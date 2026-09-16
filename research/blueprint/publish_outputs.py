#!/usr/bin/env python3
"""Commit and push the swarm's outputs from the machine that runs the lanes.

The swarm host owns the queue and the job outputs; the atlas build happens
elsewhere. This script commits only swarm-owned paths, rebases onto the remote
(so code changes pushed from elsewhere arrive, and lanes reload them), and
pushes. On a rebase conflict it aborts and reports rather than guessing.

  python3 research/blueprint/publish_outputs.py
"""
from __future__ import annotations

import datetime
import subprocess
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
OWNED = ["research/blueprint/packets", "research/blueprint/readmes", "research/blueprint/reviews",
         "research/blueprint/links", "research/blueprint/handoff", "research/blueprint/roadmaps",
         "research/blueprint/plans", "research/blueprint/classify", "research/blueprint/compare", "research/blueprint/audit", "research/blueprint/queue.json",
         "research/blueprint/ledger.tsv", "research/blueprint/issues.json", "research/expansion/status",
         "research/expansion/naming"]
TRAILER = ("\n\nCo-Authored-By: Claude Opus 5 (1M context) <noreply@anthropic.com>\n"
           "Claude-Session: https://claude.ai/code/session_01LyKFDWpehc4bVvmBWzVFPQ\n")


def git(*args, check=True):
    result = subprocess.run(["git", *args], cwd=REPO, capture_output=True, text=True)
    if check and result.returncode != 0:
        raise RuntimeError(f"git {' '.join(args)}: {result.stderr.strip()[:300]}")
    return result


def main():
    stamp = datetime.datetime.now(datetime.timezone.utc).strftime("%Y-%m-%d %H:%M UTC")
    existing = [path for path in OWNED if (REPO / path).exists()]
    git("add", "--", *existing)
    staged = git("diff", "--cached", "--name-only").stdout.split()
    if staged:
        packets = sum(1 for p in staged if p.startswith("research/blueprint/packets/"))
        reviews = sum(1 for p in staged if p.startswith("research/blueprint/reviews/"))
        links = sum(1 for p in staged if p.startswith("research/blueprint/links/"))
        message = (f"Swarm outputs, {stamp}\n\n{len(staged)} files: {packets} packet(s), {reviews} review report(s), "
                   f"{links} link file(s), with the queue and ledger." + TRAILER)
        git("commit", "-q", "-m", message)
    pull = git("pull", "--rebase", "--autostash", "-q", check=False)
    if pull.returncode != 0:
        git("rebase", "--abort", check=False)
        print(f"{stamp}: CONFLICT while rebasing; nothing pushed: {pull.stderr.strip()[:300]}")
        return
    ahead = git("rev-list", "--count", "@{u}..HEAD").stdout.strip()
    if ahead != "0":
        git("push", "-q")
    print(f"{stamp}: committed {len(staged)} file(s); pushed {ahead} commit(s)")


if __name__ == "__main__":
    main()
