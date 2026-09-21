#!/usr/bin/env python3
"""Take in pull requests from external (browser) workers.

  python3 research/blueprint/intake.py list
  python3 research/blueprint/intake.py merge <pr> [--yes] [--complete]

A submission is merged only when every changed file lies in a swarm output
path, contains no local filesystem path, is valid JSON where it is JSON, and
the pull request's checks have passed (or none apply). After the merge the
job's issue is released for continuation unless the submitted files say the
work is complete, in which case the sync completes the job and its review
follows.
"""
from __future__ import annotations

import json
import re
import subprocess
import sys

ALLOWED = re.compile(r"^research/(blueprint/(packets|readmes|suggested|restructure|reviews|links|handoff|roadmaps|plans|classify)/[^/]+|expansion/naming/NAME-\d+\.result\.json)$")
PRIVATE = re.compile(r"/Users/|/private/|/home/[a-z]+/|mcu22seu")
REPO = "CBirkbeck/tauceti-explorer"


def gh(*args):
    result = subprocess.run(["gh", *args], capture_output=True, text=True)
    if result.returncode != 0:
        raise SystemExit(f"gh {' '.join(args[:3])}: {result.stderr.strip()[:300]}")
    return result.stdout


def inspect(number):
    data = json.loads(gh("pr", "view", str(number), "--json", "number,title,body,files,headRefName,headRefOid,isDraft,statusCheckRollup,state"))
    problems = []
    for item in data["files"]:
        path = item["path"]
        if not ALLOWED.match(path):
            problems.append(f"file outside swarm output paths: {path}")
            continue
        text = subprocess.run(["gh", "api", f"repos/{REPO}/contents/{path}?ref={data['headRefOid']}", "-H", "Accept: application/vnd.github.raw"],
                              capture_output=True, text=True).stdout
        if PRIVATE.search(text):
            problems.append(f"local path in {path}")
        if path.endswith(".json"):
            try:
                json.loads(text)
            except json.JSONDecodeError as exc:
                problems.append(f"invalid JSON in {path}: {exc}")
    checks = [c.get("conclusion") or c.get("status") for c in data.get("statusCheckRollup") or []]
    if any(c not in ("SUCCESS", "SKIPPED", "NEUTRAL") for c in checks):
        problems.append(f"checks not passed: {checks}")
    job = re.search(r"\b((?:REV-)?(?:BP|LINK|DESIGN|ASM|CLASSIFY|NAME|PLAN)-[A-Za-z0-9_.~-]+)", data["title"] + " " + data["body"])
    issue = re.search(r"#(\d+)", data["title"] + " " + data["body"])
    complete = False
    for item in data["files"]:
        if item["path"].endswith(".json") and ("/links/" in item["path"] or "/packets/" in item["path"]):
            text = subprocess.run(["gh", "api", f"repos/{REPO}/contents/{item['path']}?ref={data['headRefOid']}", "-H", "Accept: application/vnd.github.raw"],
                                  capture_output=True, text=True).stdout
            try:
                complete = json.loads(text).get("status") in ("complete", "closed")
            except json.JSONDecodeError:
                pass
    return data, problems, (job.group(1) if job else None), (int(issue.group(1)) if issue else None), complete


def main():
    if len(sys.argv) < 2:
        print(__doc__); return
    if sys.argv[1] == "list":
        for pr in json.loads(gh("pr", "list", "--state", "open", "--limit", "100", "--json", "number,title")):
            data, problems, job, issue, complete = inspect(pr["number"])
            print(f"#{pr['number']} job={job} issue=#{issue} complete={complete} problems={problems or 'none'} :: {pr['title'][:70]}")
        return
    number = int(sys.argv[2])
    data, problems, job, issue, complete = inspect(number)
    print(f"#{number} job={job} issue=#{issue} complete={complete} files={[f['path'] for f in data['files']]}")
    if problems:
        raise SystemExit("not merged: " + "; ".join(problems))
    if "--yes" not in sys.argv:
        print("dry run; pass --yes to merge")
        return
    if "--complete" in sys.argv and not complete:
        # Orchestrator decision: a full submission whose file predates the status field.
        complete = True
        mark_complete = [f["path"] for f in data["files"] if f["path"].endswith(".json") and "/links/" in f["path"]]
    else:
        mark_complete = []
    if data["isDraft"]:
        gh("pr", "ready", str(number))
    gh("pr", "merge", str(number), "--squash", "--delete-branch")
    # A description saying "close #N" makes GitHub close the job's issue on merge;
    # the issue stays open until the job is reviewed and integrated.
    if issue and json.loads(gh("issue", "view", str(issue), "--json", "state"))["state"] == "CLOSED":
        gh("issue", "reopen", str(issue))
    if mark_complete:
        import pathlib
        repo = pathlib.Path(__file__).resolve().parents[2]
        subprocess.run(["git", "pull", "--rebase", "--autostash", "-q"], cwd=repo, check=True)
        for path in mark_complete:
            target = repo / path
            packet = json.loads(target.read_text())
            packet = {"roadmapId": packet.get("roadmapId"), "protocol": packet.get("protocol"), "status": "complete",
                      **{k: v for k, v in packet.items() if k not in ("roadmapId", "protocol", "status")}}
            target.write_text(json.dumps(packet, indent=1, ensure_ascii=False) + "\n")
            subprocess.run(["git", "add", path], cwd=repo, check=True)
        subprocess.run(["git", "commit", "-q", "-m",
                        f"Record #{number}'s link map as a complete submission\n\nThe worker's file predates the status field; the orchestrator judged the "
                        f"submission complete for independent review.\n\nCo-Authored-By: Claude Opus 5 (1M context) <noreply@anthropic.com>\n"
                        f"Claude-Session: https://claude.ai/code/session_01LyKFDWpehc4bVvmBWzVFPQ\n"], cwd=repo, check=True)
        subprocess.run(["git", "push", "-q"], cwd=repo, check=True)
    note = ("Orchestrator: merged as a checkpoint; the job stays open for continuation from the merged files and handoff note."
            if not complete else "Orchestrator: merged; the job is complete and goes to independent review.")
    gh("pr", "comment", str(number), "--body", note)
    if issue and not complete:
        labels = json.loads(gh("issue", "view", str(issue), "--json", "labels"))["labels"]
        names = [label["name"] for label in labels]
        args = ["issue", "edit", str(issue), "--add-label", "state:available"]
        for name in names:
            if name.startswith("state:") and name != "state:available":
                args += ["--remove-label", name]
        gh(*args)
        gh("issue", "comment", str(issue), "--body",
           f"Orchestrator: checkpoint from #{number} merged. This job is available again; the next worker continues from the merged files and the handoff note.")
    print("merged", number)


if __name__ == "__main__":
    main()
