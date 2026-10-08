#!/usr/bin/env python3
"""Mirror the blueprint queue as GitHub issues, so that local lanes and browser
agents can claim the same jobs.

  python3 research/blueprint/issues.py render [--kinds blueprint,design,link] [--limit N]
      Write issue bodies to research/blueprint/issues-preview/ (not committed).
  python3 research/blueprint/issues.py publish --yes [--kinds ...] [--limit N]
      Create an issue for each selected job that has none (research/blueprint/issues.json).
  python3 research/blueprint/issues.py sync
      Mark jobs claimed on GitHub as `external` in the queue, label jobs whose inputs
      are not finished `state:blocked`, and close issues of finished jobs.
  python3 research/blueprint/issues.py refresh [--pace S]
      Rewrite the bodies of the open issues from the queue and the prompts.
  python3 research/blueprint/issues.py stale [--hours 24] [--release]
      List claims and submissions whose worker has shown nothing for that long; --release makes them available again.
"""
from __future__ import annotations

import argparse
import re
import json
import subprocess
import time
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
BP = REPO / "research" / "blueprint"
GITHUB = "https://github.com/CBirkbeck/tauceti-explorer"
BLOB = GITHUB + "/blob/main/"
KIND_TITLE = {"blueprint": "Blueprint", "design": "New roadmap", "link": "Links", "review": "Review", "assembly": "Assembly",
              "restructure": "Restructure", "paper": "Paper", "redteam": "Red team", "fix": "Fix", "errata": "Errata",
              "plan": "Plan", "classify": "Classification", "naming": "Planet names", "status": "Status mapping",
              "sources": "Sources", "collation": "Collation", "attribution": "Sources and credit", "keydef": "Key definitions",
              "package": "Roadmap package"}


LOCAL_ONLY = {"PLAN-HABIRO", "REV-PLAN-HABIRO"}
LABEL_COLOURS = {"swarm": "5b6b7a", "state:available": "2da44e", "state:blocked": "c5c9ce", "state:claimed": "bf8700",
                 "state:running": "1f6feb", "state:submitted": "8250df", "state:done": "57606a", "local-only": "b60205",
                 "owns-key-definitions": "0e8a16", "focus": "d93f0b", "top": "b60205"}


def publicize(text):
    """The worker prompt with local paths replaced by their public equivalents."""
    replacements = [
        (r"/Users/[^\s]*/Downloads/TauCeti_Roadmaps_Revised_[^\s]*/references/?", "public sources (the maintainer's reference library is not available to you; cite public versions)"),
        (r"/Users/[^\s]*/Downloads/Habiro_[A-Za-z_-]*\d*\.pdf", "[course notes available only to the maintainer's local workers]"),
        (r"(/private)?/tmp/tauceti-workers/baseline/declarations\.tsv", "the pinned library (search Loogle, LeanSearch, the docs or GitHub as BROWSER_AGENTS.md describes)"),
        (r"(/private)?/tmp/tauceti-workers/baseline", "the pinned library (Mathlib 082e2d3 and Tau Ceti f790474 on GitHub; see BROWSER_AGENTS.md)"),
        (r"(/private)?/tmp/tauceti-workers/[A-Za-z0-9_.~-]+", "your own scratch space"),
        (r"/Users/[^\s]*/GitHub/tauceti-explorer", "a clone of https://github.com/CBirkbeck/tauceti-explorer"),
        # The swarm host's paths, for prompts generated there.
        (r"/home/[^/\s]+/tauceti-swarm/tauceti-explorer", "a clone of https://github.com/CBirkbeck/tauceti-explorer"),
        (r"/home/[^/\s]+/tauceti-swarm/workers/baseline/declarations\.tsv", "the pinned library (search Loogle, LeanSearch, the docs or GitHub as BROWSER_AGENTS.md describes)"),
        (r"/home/[^/\s]+/tauceti-swarm/workers/baseline", "the pinned library (Mathlib 082e2d3 and Tau Ceti f790474 on GitHub; see BROWSER_AGENTS.md)"),
        (r"/home/[^/\s]+/tauceti-swarm/workers/[A-Za-z0-9_.~-]+", "your own scratch space"),
        (r"/home/[^/\s]+/tauceti-swarm/sources/[^\s]*", "public sources (the maintainer's reference library is not available to you; cite public versions)"),
        (r"You run unattended in a tmux session as job", "You work on job"),
        (r"You run unattended as job", "You work on job"),
        (r"You run unattended in a tmux session", "You work on this job"),
    ]
    whole_lines = [
        (r"^- Library baseline \(what exists today\):.*$",
         "- Library baseline (what exists today): Mathlib at commit 082e2d3 and Tau Ceti at commit f790474 on GitHub (links in BROWSER_AGENTS.md). Search with Loogle, LeanSearch, the documentation sites or GitHub code search, then open the Lean file at the pinned commit and read the actual statement before citing it. Tau Ceti is a large library (about 70,000 declarations): search it thoroughly before declaring something missing."),
        (r"^- Reference library:.*$",
         "- Sources: use public versions (arXiv, author pages, publishers) and record their URLs and the date you read them. The maintainer's private reference library is not available to you."),
        (r"^Library baseline: .*Reference library: .*$",
         "Library baseline: Mathlib 082e2d3 and Tau Ceti f790474 on GitHub (see BROWSER_AGENTS.md). Sources: public versions only; record their URLs."),
        (r"Your scratch directory is [^.]*\(create it\)\.", "Use your own scratch space."),
        (r"Your scratch directory is [^.]*\.", "Use your own scratch space."),
        (r" \(grep -i -P\)", ""),
        (r"^- The roadmap text and stages: data/atlas\.json.*$",
         "- The roadmap text and stages: research/blueprint/atlas/roadmaps/<id>.json (file name: the roadmap id with ':' and '/' replaced by '_'), which holds the roadmap record, all its stages with full descriptions and every stage edge touching it, together with the roadmap document named in its `document` field. data/atlas.json itself is too large for browser tools (see research/blueprint/atlas/README.md). New roadmaps are defined in research/blueprint/roadmaps/*.json."),
        (r"^- data/atlas\.json: roadmaps\[\].*$",
         "- research/blueprint/atlas/: index.json (every roadmap and stage), roadmaps/<id>.json (one roadmap's stages with descriptions and its stage edges), areas/<area>-<n>.json (every stage description in an area, for text search) and stage-edges.json (all recorded stage links). data/atlas.json itself is too large for browser tools."),
        (r"data/atlas\.json", "data/atlas.json (browser agents: use the extracts in research/blueprint/atlas/, described in its README)"),
    ]
    for pattern, replacement in whole_lines:
        text = re.sub(pattern, replacement, text, flags=re.M)
    for pattern, replacement in replacements:
        text = re.sub(pattern, replacement, text)
    if re.search(r"/Users/|/private/|/home/|mcu22seu|/Downloads/", text):
        return None
    return text


def issue_command(label, state, body=False):
    """Every issue with the label, page by page. `gh issue list` stops at 1000 issues,
    and the swarm has more; the REST listing has no such limit. Pull requests are left out."""
    fields = "number, state: (.state | ascii_upcase), labels: [.labels[] | {name}], updatedAt: .updated_at, title" + (", body" if body else "")
    return ["gh", "api", "--paginate", f"repos/{GITHUB.split('github.com/')[1]}/issues?labels={label}&state={state}&per_page=100",
            "--jq", f".[] | select(.pull_request | not) | {{{fields}}}"]


def parse_issues(text):
    return [json.loads(line) for line in text.splitlines() if line.strip()]


def list_issues(label, state, body=False):
    result = subprocess.run(issue_command(label, state, body), capture_output=True, text=True, cwd=REPO)
    if result.returncode != 0:
        raise SystemExit("listing the issues failed: " + result.stderr[:200])
    return parse_issues(result.stdout)


def ready(job, by_id):
    """Every job this one waits for is finished."""
    return all(by_id.get(dep, {}).get("state") == "done" for dep in job.get("after") or [])


def load():
    queue = json.loads((BP / "queue.json").read_text())
    atlas = json.loads((REPO / "data" / "atlas.json").read_text())
    return queue["jobs"], {r["id"]: r for r in atlas["roadmaps"]}, {s["id"]: s for s in atlas["stages"]}


# GitHub refuses an issue body over 65,536 characters.
ISSUE_LIMIT = 65_000
SHORTENED = ("\n\n[Some long list entries are shortened to fit a GitHub issue. A paper route's full brief is in "
             "research/blueprint/papers/<paper>.result.json, and a red-team finding's full text in "
             "research/blueprint/redteam/<red team>.result.json.]")


def fit_instructions(text, room):
    """The instructions in at most `room` characters: the longest list entries, such as the briefs of
    paper routes and red-team findings, are shortened first, since each is also in a committed file."""
    if len(text) <= room:
        return text
    lines = text.split("\n")
    for width in (2000, 1200, 800, 500, 300, 200):
        lines = [line if len(line) <= width or not line.startswith("- ") else line[:width].rstrip() + " … (shortened)" for line in lines]
        shortened = "\n".join(lines)
        if len(shortened) + len(SHORTENED) <= room:
            return shortened + SHORTENED
    return shortened[:max(0, room - len(SHORTENED))] + SHORTENED


def body(job, jobs, roadmaps, stages):
    lines = [f"**Job** `{job['id']}` · {KIND_TITLE.get(job['kind'], job['kind'])} · priority {job.get('priority')}", ""]
    rids = job.get("roadmapIds") or []
    for rid in rids:
        r = roadmaps.get(rid)
        if r:
            lines.append(f"Roadmap: **{r['title']}** (`{rid}`), [document]({BLOB}{r['sourcePath']})")
            decomposition = REPO / "data" / "decompositions" / (rid.replace(':', '_').replace('/', '_') + ".json")
            if decomposition.exists():
                lines.append(f"Reviewed decomposition already integrated: [{decomposition.name}]({BLOB}data/decompositions/{decomposition.name})")
        else:
            lines.append(f"Roadmap: `{rid}` (new; defined by this job)")
    if job.get("anchors"):
        lines += ["", "Existing Tau Ceti roadmaps to build on (never changed): " +
                  "; ".join(f"**{roadmaps[a]['title']}** (`{a}`)" for a in job["anchors"] if a in roadmaps) + "."]
    if job.get("scope"):
        lines += ["", "Stages in scope:"]
        lines += [f"- `{sid}` — {stages[sid]['title']}" for sid in job["scope"] if sid in stages]
    if job.get("outputs"):
        lines += ["", "Deliverables:"] + [f"- `{path}`" for path in job["outputs"]]
    if job.get("after"):
        by_id = {j["id"]: j for j in jobs}
        waiting = [dep for dep in job["after"] if by_id.get(dep, {}).get("state") != "done"]
        if waiting:
            lines += ["", "Waits for: " + ", ".join(f"`{d}`" for d in waiting[:12]) + " (labelled `state:blocked` until then)."]
    if job.get("suppliers"):
        lines += ["", "Suppliers: " + ", ".join(f"`{d}`" for d in job["suppliers"][:12]) +
                  ". Reuse their packets' node ids where the packets exist; for anything still missing from them, add a `requests` entry. Do not wait for them."]
    if job["kind"] == "restructure":
        lines += ["", "### What this issue delivers",
                  "- **One owner for every piece of mathematics:** where these roadmaps, or the Tau Ceti roadmaps above, plan the same thing, one layer owns it and the others import it. Tau Ceti roadmaps never change.",
                  "- **Roadmaps that build on each other:** each proposed roadmap is kept (with narrowed layers where needed), becomes `<base roadmap>, Part II: <what it adds>`, merges into another, or retires because everything it plans is owned elsewhere.",
                  "- **Nothing lost:** every target of a changed layer is kept, moved or supplied by a named layer, and every consumer still finds its prerequisites.",
                  "- **The proposal and its reasoning**, in the format of PROTOCOL.md section 15. The family file lists the evidence: leads, not verdicts.",
                  "", "The blueprints of these roadmaps wait for this restructuring and its review."]
    if job["kind"] == "paper":
        lines += ["", "### What this issue delivers",
                  "- **Every definition and key theorem of the paper**, with its exact statement and where it is in the paper, and for each: Mathlib or Tau Ceti has it (cite the declaration), a layer of the atlas plans it (name the layer), or it is missing.",
                  "- **A route for everything missing:** a source of an existing roadmap's layers, a Part II of an existing roadmap, or a new roadmap, each Part II or new roadmap with the brief its design job will follow (PROTOCOL.md section 16). Build on what exists; never duplicate (section 15).",
                  "- **A report** explaining the routes to a human reader, and the prerequisite papers the atlas does not cover yet.",
                  "", "After an independent review, the accepted routes become blueprint sources and design jobs when the queue is next generated."]
    if job["kind"] == "redteam" and job["id"].startswith("RT-AREA-"):
        lines += ["", "### What this issue delivers",
                  "- **What the area is missing:** definitions and key theorems that these roadmaps' targets, or the papers routed to them, need but no layer plans and the libraries lack, each with the roadmap and layer that should own it, or a proposed Part II or new roadmap.",
                  "- **Duplication and broken dependencies:** mathematics planned twice, layers whose prerequisites are wrong or missing, and targets out of date with the literature (PROTOCOL.md section 17).",
                  "- **Each finding precise and evidenced:** where, what, the evidence (a source locator with a quotation, or a declaration read at the pinned commit), the fix, and its severity.",
                  "- **What you read**, even when you find nothing: a clean result is evidence too.",
                  "", "An independent verifier checks every finding; confirmed findings of high or medium severity become a fix job."]
    elif job["kind"] == "redteam":
        lines += ["", "### What this issue delivers",
                  "- **An attack on accepted work:** errors (false or misstated statements, wrong library claims, wrong owners, routes or prerequisites), omissions (definitions and key theorems the sources need that nothing plans) and duplication (PROTOCOL.md section 17).",
                  "- **Each finding precise and evidenced:** where, what, the evidence (a source locator with a quotation, or a declaration read at the pinned commit), the fix, and its severity.",
                  "- **What you checked**, even when you find nothing: a clean result is evidence too.",
                  "", "An independent verifier checks every finding; confirmed findings of high or medium severity become a fix job."]
    if job["kind"] == "keydef":
        lines += ["", "### What this issue delivers",
                  "- **The area's key definitions:** the notions at least two of the atlas's papers need and Mathlib and Tau Ceti lack, each a real piece of work to formalise, in the format of PROTOCOL.md section 19, ordered by the number of papers that need them.",
                  "- **For each one:** what to define, with the conventions pinned; what the libraries have and what is missing, read at the pinned commits; the papers that need it, with their catalogue items; the layers that own it; what it depends on; its size (M, L or XL).",
                  "- **A sample API that tells a right formalisation from a wrong one:** at least five statements, among them worked examples with their values, a counterexample showing that a hypothesis matters, and the theorems the definition exists to support.",
                  "- **Every input item accounted for:** in an entry, owned elsewhere, in the reserve with its reason, or routine.",
                  "- **A report** for a human reader, with the gaps (key definitions nothing plans) and duplications it found.",
                  "", "An independent review checks every entry; accepted surveys go live on the atlas's definitions page."]
    if job["kind"] == "errata":
        lines += ["", "### What this issue delivers",
                  "- **Every mistake in the published source that earlier work on it found**, in `research/blueprint/errata/<paper>.json` (PROTOCOL.md section 18): misprints, errors and gaps, each quoted at its locator with the correction, the reason and how far it reaches.",
                  "- **Whether each is already corrected in print:** a published erratum or a later version, and where you looked.",
                  "- **An explanation of each finding** for a mathematician, beside it in `research/blueprint/errata/<paper>.md`.",
                  "", "An independent reviewer checks each one at its locator; confirmed new mistakes go into the register of mistakes in published work, research/errata/REGISTER.md."]
    if job["kind"] == "fix":
        lines += ["", "### What this issue delivers",
                  "- **Every confirmed finding fixed** in the files it names, each file still valid under its checker (PROTOCOL.md section 17).",
                  "- **Plan fixes in the roadmap's blueprint:** a fix to a roadmap's plan goes into the finished blueprint files listed as deliverables, never into `content/campaign/` or `data/`. Findings about roadmaps whose blueprint is not written yet are handed to the jobs that will write them.",
                  "- **Missing mathematics put where it belongs:** a node or a `requests` entry in the owning packet, or a note for the maintainer when it needs a new roadmap.",
                  "- **A fixes report:** for each finding, what changed, or why not."]
    if job["kind"] in ("blueprint", "design"):
        lines += ["", "### What this issue delivers",
                  "- **Built on existing roadmaps, never duplicating them:** import what another roadmap plans, and extend it as a Part II where you need more (PROTOCOL.md section 15).",
                  "- **The plan, gap-free from the pinned libraries:** a blueprint packet with one node per declaration. Read the roadmap's reviewed library audit (`data/library-coverage.json`) first, and plan only what Mathlib and Tau Ceti do not already contain.",
                  "- **API and unit tests for every definition:** an `api` outline, and at least three unit tests that a plausible wrong definition would fail (a small computed value, the degenerate case, agreement with the nearest Mathlib or Tau Ceti notion, a non-example). See PROTOCOL.md sections 4 and 12.",
                  "- **The roadmap document** in the upstream style and density, with each definition's API and unit tests.",
                  "- **A suggested Lean file** in upstream's `Suggested.lean` form: signatures, API lemmas and unit tests as `example`s, all proved by `sorry` (section 13).",
                  "- **The atlas's planets for these layers:** the key definitions and named theorems, at most six per layer, named from the source (section 14). Sub-layers can be proposed in `restructure`.",
                  "- **A handoff note:** what is closed, what remains, and whether the Lean file compiled."]
    if job.get("independentOf"):
        lines += ["", "Must be done by an agent that did none of " + ", ".join(f"`{other}`" for other in job["independentOf"]) + "."]
    elif job.get("avoidAccountOf"):
        lines += ["", f"Must be done by a different agent from the one that did `{job['avoidAccountOf']}`."]
    reserved = json.loads((BP / "reserved-ids.json").read_text()) if (BP / "reserved-ids.json").exists() else {}
    mine = [nid for nid, v in reserved.items() if v.get("job") == job["id"]]
    if mine:
        lines += ["", "This job must provide nodes with exactly these ids:"] + [f"- `{nid}`: {reserved[nid]['statement']}" for nid in mine]
    prompt_path = REPO / job.get("prompt", "")
    public = publicize(prompt_path.read_text()) if job.get("prompt") and prompt_path.exists() else None
    lines += ["", "### How to work on this",
              f"- Start here: [WORKERS.md]({BLOB}research/blueprint/WORKERS.md) (choosing, claiming and submitting a job).",
              f"- Rules: [PROTOCOL.md]({BLOB}research/blueprint/PROTOCOL.md) and [UPSTREAM_GUIDE.md]({BLOB}research/blueprint/UPSTREAM_GUIDE.md).",
              f"- From a browser: [BROWSER_AGENTS.md]({BLOB}research/blueprint/BROWSER_AGENTS.md) (resources, method, submission).",
              "- Comment `/claim` before starting; submit a pull request that says \"Refs #N\" (merged automatically once its check passes), or attach the files to a comment on this issue.",
              ""]
    if job["id"] in LOCAL_ONLY:
        lines += ["This job relies on files that only the maintainer's local workers have (`local-only`).", ""]
    elif job["kind"] == "classify":
        lines += ["This job needs the zbMATH Open API, which browser sessions cannot reach, so it is done by the local workers (`local-only`).", ""]
    footer = "<sub>Generated from the blueprint queue; local swarm workers claim the same jobs through the `state:` labels.</sub>"
    if public:
        wrapper = ["<details><summary>Full instructions (as given to the local workers, with local paths replaced)</summary>", "", "````text"]
        room = ISSUE_LIMIT - len("\n".join(lines + wrapper + ["````", "", "</details>", "", footer])) - 2
        lines += wrapper + [fit_instructions(public.strip(), room), "````", "", "</details>", ""]
    lines += [footer]
    return "\n".join(lines)


def title(job, roadmaps):
    """The issue title. A revision round of a plan, and the review of one, say which round they are."""
    text = _title(job, roadmaps)
    plan = job["id"] if job["kind"] in ("blueprint", "design") else (job.get("after") or [""])[0] if job["kind"] == "review" else ""
    base, _, round_no = plan.partition("~")
    if round_no.isdigit() and base.startswith(("BP-", "DESIGN-")):
        text = f"{text} (revision {round_no})"
    return text


def _title(job, roadmaps):
    kind = KIND_TITLE.get(job["kind"], job["kind"])
    jid = job["id"]
    rid = (job.get("roadmapIds") or [None])[0]
    name = roadmaps[rid]["title"] if rid in roadmaps else None
    part = ""
    if job.get("scope") and "--" in jid:
        first = job["scope"][0].split(":", 1)[-1].split("#")[-1]
        part = f" (part from {first[:40]})"
    special = {
        "PLAN-HABIRO": "[Plan] Habiro rings and Habiro cohomology: roadmap structure",
        "REV-PLAN-HABIRO": "[Review] Plan for Habiro rings and Habiro cohomology",
        "DESIGN-LV": "[New roadmap] The Mordell conjecture after Lawrence and Venkatesh",
        "DESIGN-ZAGIER": "[New roadmap] Zagier's conjecture via polylogarithms",
        "REV-DESIGN-LV": "[Review] New roadmap: the Mordell conjecture after Lawrence and Venkatesh",
        "REV-DESIGN-ZAGIER": "[Review] New roadmap: Zagier's conjecture via polylogarithms",
        "DESIGN-BCGP18": "[New roadmap] Abelian surfaces over totally real fields are potentially modular (Boxer–Calegari–Gee–Pilloni)",
        "DESIGN-PAN": "[New roadmap] Completed cohomology over Q, Part II: locally analytic vectors (Pan)",
        "DESIGN-SKINNER": "[New roadmap] Rank-zero and rank-one BSD, Part II: the p-converse to Gross–Zagier–Kolyvagin (Skinner)",
        "DESIGN-BETTS-STIX": "[New roadmap] Nonabelian Chabauty, Part II: Galois sections and p-adic period mappings (Betts–Stix)",
        "REV-DESIGN-PAN": "[Review] New roadmap: completed cohomology over Q, Part II: locally analytic vectors (Pan)",
        "REV-DESIGN-SKINNER": "[Review] New roadmap: rank-zero and rank-one BSD, Part II: the p-converse (Skinner)",
        "REV-DESIGN-BETTS-STIX": "[Review] New roadmap: nonabelian Chabauty, Part II: Galois sections and p-adic period mappings (Betts–Stix)",
        "DESIGN-BCGP25": "[New roadmap] Modularity theorems for abelian surfaces (Boxer–Calegari–Gee–Pilloni)",
        "REV-DESIGN-BCGP18": "[Review] New roadmap: abelian surfaces over totally real fields are potentially modular",
        "REV-DESIGN-BCGP25": "[Review] New roadmap: modularity theorems for abelian surfaces",
    }
    if jid in special:
        return special[jid]
    if job["kind"] == "classify":
        count = len(job.get("roadmapIds") or [])
        return f"[Classification] Batch {jid.split('-')[-1]}: subject classes and distance from Mathlib for {count} roadmaps"
    if job["kind"] == "naming" and job.get("name"):
        return f"[Planet names] {job['name']}"
    if job["kind"] == "naming":
        jobs_file = BP.parent / "expansion" / "naming" / "JOBS.json"
        area = ""
        if jobs_file.exists():
            area = next((j.get("galaxy", "") for j in json.loads(jobs_file.read_text())["jobs"] if j["id"] == jid), "")
        return f"[Planet names] {area or jid}"
    if job["kind"] == "restructure":
        return f"[Restructure] {job.get('name') or jid}"
    if job["kind"] == "paper":
        return f"[Paper] {job.get('name') or jid}"[:240]
    if job["kind"] == "redteam":
        return f"[Red team] {job.get('name') or jid}"[:240]
    if job["kind"] == "errata":
        return f"[Errata] {job.get('name') or jid}"[:240]
    if job["kind"] == "keydef":
        return f"[Key definitions] {job.get('name') or jid}"[:240]
    if job["kind"] == "review" and jid.startswith("REV-ERRATA-"):
        return f"[Review] Mistakes recorded in {job.get('name') or jid[len('REV-ERRATA-'):]}"[:240]
    if job["kind"] == "fix":
        return f"[Fix] Red-team findings on the {job.get('name') or jid}"[:240]
    if job["kind"] == "design" and job.get("name"):
        return f"[New roadmap] {job['name']}"[:240]
    if job["kind"] == "review":
        target = (job.get("after") or [""])[0]
        if target.startswith("RS-"):
            return f"[Review] Restructure: {job.get('name') or target}"
        if target.startswith("PAPER-"):
            return f"[Review] Paper: {job.get('name') or target}"[:240]
        if target.startswith("RT-"):
            return f"[Review] Red-team findings on the {job.get('name') or target}"[:240]
        if target.startswith("FIX-"):
            return f"[Review] Fixes for the {job.get('name') or target}"[:240]
        if target.startswith("KEYDEF-"):
            return f"[Review] Key definitions: {job.get('name') or target}"[:240]
        if target.startswith("DESIGN-") and job.get("name"):
            return f"[Review] New roadmap: {job['name']}"[:240]
        if target.startswith("LINK-"):
            return f"[Review] Links: {name or rid}"
        if target.startswith("ASM-"):
            return f"[Review] Assembly: {name or rid}"
        if target.startswith("PKG-"):
            return f"[Review] Roadmap package: {name or rid}"
        return f"[Review] Blueprint: {name or rid}{part}"
    if job["kind"] == "link":
        return f"[Links] {name or rid}"
    return f"[{kind}] {name or rid or jid}{part}"[:240]


def key_definition_owners():
    """The jobs that own key definitions no roadmap plans yet (research/blueprint/keydefs/owners.json, PROTOCOL.md section 19)."""
    path = BP / "keydefs" / "owners.json"
    try:
        return {entry.get("owner") for entry in json.loads(path.read_text()).get("definitions", {}).values() if entry.get("owner")}
    except (OSError, ValueError):
        return set()


def focus_roadmaps(top=False):
    """The roadmaps the maintainer wants finished next (research/blueprint/focus.json); with top, only those of
    the areas the maintainer put ahead of the rest (its "top" list)."""
    try:
        focus = json.loads((BP / "focus.json").read_text())
    except (OSError, ValueError):
        return set()
    areas = focus.get("areas", {})
    return {rid for name in (focus.get("top", []) if top else areas) for rid in areas.get(name, [])}


def is_focus(job, focus=None):
    """Whether a job helps finish a focus roadmap: its plans, assembly and fixes, and their reviews. Red teams
    and their reviews check finished work, so they keep their turn."""
    focus = focus_roadmaps() if focus is None else focus
    if job["kind"] not in ("blueprint", "design", "assembly", "fix", "review", "package"):
        return False
    if job["kind"] == "review" and not (job.get("after") or [""])[0].startswith(("BP-", "DESIGN-", "FIX-", "ASM-", "PKG-")):
        return False
    return any(rid in focus for rid in job.get("roadmapIds") or [])


def labels_for(job, roadmaps, by_id):
    rid = (job.get("roadmapIds") or [None])[0]
    group = roadmaps[rid].get("group") if rid in roadmaps else job.get("area")
    state = {"pending": "available", "running": "running", "done": "submitted", "external": "claimed"}.get(job.get("state"), "available")
    if state == "available" and not ready(job, by_id):
        state = "blocked"
    out = ["swarm", f"kind:{job['kind']}", f"priority:{job.get('priority', 9)}", f"state:{state}"]
    if job["id"] in LOCAL_ONLY or job["kind"] == "classify":
        out.append("local-only")
    if group and job["kind"] not in ("classify", "naming", "plan", "status"):
        out.append(f"area:{group}")
    if job["id"] in key_definition_owners():
        out.append("owns-key-definitions")
    if is_focus(job):
        out.append("focus")
    if is_focus(job, focus_roadmaps(top=True)):
        out.append("top")
    return out


def refresh_payload(job, current_body, text):
    """The one request that brings an open issue up to date, or None if it is.
    A superseded job's issue closes as not planned and says why; any other gets a
    fresh body. State labels are left to sync: claims live on GitHub until a sync
    brings them into the queue, so a state computed here could undo a claim."""
    if job.get("state") == "superseded":
        return {"state": "closed", "state_reason": "not_planned",
                "body": f"**Superseded.** {job.get('note') or 'This job is no longer planned.'}\n\n{text}"}
    if (current_body or "").strip() == text.strip():
        return None
    return {"body": text}


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("command", choices=["render", "publish", "sync", "refresh", "stale"])
    ap.add_argument("--kinds", default="blueprint,design,link,plan,review,assembly,classify,naming")
    ap.add_argument("--pace", type=float, default=7.5, help="seconds between issue creations (GitHub allows about 500 an hour)")
    ap.add_argument("--limit", type=int, default=0)
    ap.add_argument("--ids", default="", help="only these jobs (comma-separated ids)")
    ap.add_argument("--yes", action="store_true")
    ap.add_argument("--days", type=float, default=None, help="stale: days without progress (or --hours)")
    ap.add_argument("--hours", type=float, default=24.0, help="stale: hours without progress (default 24)")
    ap.add_argument("--release", action="store_true", help="stale: make those jobs available again")
    args = ap.parse_args()
    jobs, roadmaps, stages = load()
    by_id = {j["id"]: j for j in jobs}
    kinds = set(args.kinds.split(","))
    selected = [j for j in jobs if j["kind"] in kinds and j.get("state") in ("pending", "running")]
    if args.ids:
        wanted = set(args.ids.split(","))
        selected = [j for j in selected if j["id"] in wanted]
    selected.sort(key=lambda j: (j.get("priority", 9), j.get("order", 0), j["id"]))
    if args.limit:
        selected = selected[:args.limit]
    mapping_path = BP / "issues.json"
    mapping = json.loads(mapping_path.read_text()) if mapping_path.exists() else {}
    if args.command == "render":
        out = BP / "issues-preview"
        out.mkdir(exist_ok=True)
        for job in selected:
            (out / f"{job['id']}.md").write_text(f"# {title(job, roadmaps)}\n\nLabels: {', '.join(labels_for(job, roadmaps, by_id))}\n\n" + body(job, jobs, roadmaps, stages))
        print(f"rendered {len(selected)} issue bodies into {out.relative_to(REPO)}")
        return
    if args.command == "publish":
        if not args.yes:
            raise SystemExit("publish creates public GitHub issues; pass --yes to confirm")
        existing = set(subprocess.run(["gh", "label", "list", "--limit", "500", "--json", "name", "--jq", ".[].name"],
                                      capture_output=True, text=True, cwd=REPO).stdout.split())
        for job in selected:
            if job["id"] in mapping:
                continue
            for label in labels_for(job, roadmaps, by_id) + ["state:blocked", "state:claimed", "state:running", "state:submitted", "state:done"]:
                if label not in existing:
                    colour = LABEL_COLOURS.get(label, "c5def5" if label.startswith("area:") else "ededed")
                    subprocess.run(["gh", "label", "create", label, "--force", "--color", colour], cwd=REPO, capture_output=True)
                    existing.add(label)
                    time.sleep(1)
            text = body(job, jobs, roadmaps, stages)
            if re.search(r"/Users/|/private/|mcu22seu", text):
                print("skipped (private path)", job["id"]); continue
            if len(text) > 65536:
                # GitHub refuses it outright; retrying only waits (about 20 minutes per job).
                print("failed (body of %d characters; GitHub allows 65,536)" % len(text), job["id"], flush=True); continue
            url = None
            for attempt in range(6):
                result = subprocess.run(["gh", "issue", "create", "--title", title(job, roadmaps), "--body", text,
                                         *sum((["--label", label] for label in labels_for(job, roadmaps, by_id)), [])],
                                        capture_output=True, text=True, cwd=REPO)
                if "Body is too long" in result.stderr:
                    break
                if result.returncode == 0:
                    url = result.stdout.strip()
                    if re.search(r"/issues/\d+$", url):
                        break
                    # gh can exit 0 without printing an address, as it did for the whole of
                    # GitHub's secondary (content-creation) rate limit on 2026-09-29. Look for
                    # the issue among the newest (listed directly, not through the lagging search
                    # index) so a retry never duplicates it; if it is not there, wait and retry.
                    newest = subprocess.run(["gh", "issue", "list", "--state", "all", "--limit", "30", "--json", "number,title"],
                                            capture_output=True, text=True, cwd=REPO)
                    found = [i["number"] for i in json.loads(newest.stdout or "[]") if i["title"] == title(job, roadmaps)]
                    if found:
                        url = f"/issues/{found[0]}"; break
                    url = None
                print("retry", job["id"], (result.stderr.strip() or "no issue was created")[:160], flush=True)
                time.sleep(60 * (attempt + 1))
            if not url:
                print("failed", job["id"], result.stderr.strip()[:200], flush=True); continue
            mapping[job["id"]] = int(url.rsplit("/", 1)[-1])
            mapping_path.write_text(json.dumps(mapping, indent=1) + "\n")
            print("created", job["id"], mapping[job["id"]], flush=True)
            time.sleep(args.pace)
        return
    if args.command == "sync":
        sync(mapping)
    if args.command == "stale":
        stale(mapping, by_id, args.days * 24 if args.days else args.hours, args.release)
    if args.command == "refresh":
        # One request per issue sets its body and its state label together, so a
        # full refresh stays within GitHub's limit of about 500 edits an hour.
        listed = list_issues("swarm", "open", body=True)
        open_issues = {item["number"]: item["body"] for item in listed}
        open_titles = {item["number"]: item["title"] for item in listed}
        repo = GITHUB.split("github.com/")[1]
        unchanged = 0
        for job in jobs:
            number = mapping.get(job["id"])
            if not number or number not in open_issues or (args.ids and job["id"] not in set(args.ids.split(","))):
                continue
            text = body(job, jobs, roadmaps, stages)
            if re.search(r"/Users/|/private/|/home/|mcu22seu", text):
                print("skipped (private path)", job["id"]); continue
            payload = refresh_payload(job, open_issues[number], text)
            wanted = title(job, roadmaps)
            if open_titles.get(number) != wanted and job.get("state") != "superseded":
                payload = dict(payload or {}, title=wanted)
            if payload is None:
                unchanged += 1
                continue
            result = subprocess.run(["gh", "api", "-X", "PATCH", f"repos/{repo}/issues/{number}", "--input", "-", "--silent"],
                                    input=json.dumps(payload), capture_output=True, text=True, cwd=REPO)
            print("refreshed" if result.returncode == 0 else "failed", job["id"], number, result.stderr.strip()[:120], flush=True)
            time.sleep(args.pace)
        print(f"refresh: {unchanged} issue(s) already up to date")


STATE_LABELS = ("state:available", "state:blocked", "state:claimed", "state:running", "state:submitted", "state:done")
# A finished job's issue closes, except where the orchestrator still has to promote the work
# into the atlas: a blueprint, design or link map closes once promotion sets "integrated",
# because a refused promotion is reported on its issue. Every other kind has nothing left
# to do on its issue once its deliverables are on main (papers feed design jobs, red-team
# findings FIX jobs, errata the register, restructures their revisions).
AWAIT_INTEGRATION = {"blueprint", "design", "link"}


# Coverage a planning job may finish a stage with (PROTOCOL.md section 0; scripts/check_blueprint.py PLANNED).
DECOMPOSED = ("planned", "source_decomposed", "closed")


def deliverables_complete(job, root=REPO):
    """Every output exists and covers the whole job: for a batch, every item of the
    batch; for a plan, a complete pass or every stage in scope planned; for a link
    map, the status "complete". Anything less is a checkpoint."""
    bp = root / "research" / "blueprint"
    paths = [root / path for path in job.get("outputs", [])]
    if not paths or not all(path.exists() for path in paths):
        return False
    try:
        if job["kind"] in ("blueprint", "design"):
            packet_path = next((path for path in paths if path.parent.name == "packets"), None)
            if packet_path is None:
                return True
            packet = json.loads(packet_path.read_text())
            # "complete": the pass ended at its node budget or with every stage planned, and the
            # checker has held it to that (PROTOCOL.md section 0); the stages it leaves open become
            # follow-up jobs once its review accepts it.
            if packet.get("status") in ("closed", "complete"):
                return True
            scope = job.get("scope") or packet.get("scope")
            if not scope and job["kind"] == "design":
                roadmap = json.loads(paths[0].read_text())
                scope = [f"{roadmap.get('id')}:{stage.get('key')}" for stage in roadmap.get("stages", [])]
            covered = {entry.get("stageId"): entry.get("status") for entry in packet.get("coverage", [])}
            scope = scope or list(covered)
            return bool(scope) and all(covered.get(sid) in DECOMPOSED for sid in scope)
        if job["kind"] == "classify":
            result = json.loads(paths[0].read_text())
            covered = {entry.get("roadmapId") for entry in result}
            return (set(job.get("roadmapIds") or []) <= covered
                    and not any(entry.get("assessmentStatus") == "partial" for entry in result))
        if job["kind"] == "review":
            # A blueprint, design or fix review finishes when it records its verdict in the
            # review object of every file it reviews, naming itself; a checkpoint writes only its report.
            if any(target.startswith(("BP-", "DESIGN-", "FIX-", "KEYDEF-")) for target in job.get("after") or []):
                reviewed = [path for path in paths if path.parent.name in ("packets", "links")
                            or (path.parent.name == "keydefs" and path.suffix == ".json")
                            or (path.parent.name == "restructure" and path.name.endswith(".result.json"))]
                if reviewed:
                    reviews = [json.loads(path.read_text()).get("review") or {} for path in reviewed]
                    return all(review.get("reviewer") == f"independent-review-{job['id']}"
                               and review.get("status") in ("accepted", "needs_changes", "rejected") for review in reviews)
            # A red-team verification finishes when every finding has a verdict.
            verdicts = next((path for path in paths if path.parent.name == "redteam" and path.name.endswith(".review.json")), None)
            if verdicts is not None:
                result = json.loads(verdicts.with_name(verdicts.name.replace(".review.json", ".result.json")).read_text())
                judged = {item.get("finding") for item in json.loads(verdicts.read_text()).get("findings", []) if item.get("verdict")}
                return {item.get("id") for item in result.get("findings", [])} <= judged
        if job["kind"] in ("link", "paper", "redteam", "keydef"):
            return json.loads(paths[0].read_text()).get("status") == "complete"
        if job["kind"] == "errata":
            issues = json.loads(paths[0].read_text()).get("sourceIssues")
            return isinstance(issues, list) and all(isinstance(item, dict) and "kind" in item for item in issues)
        if job["kind"] == "audit":
            listed = {layer["id"] for roadmap in json.loads((bp / "audit" / f"{job['id']}.json").read_text())["roadmaps"] for layer in roadmap["layers"]}
            present = {lid for roadmap in json.loads(paths[0].read_text()).get("roadmaps", {}).values() for lid in roadmap.get("layers", {})}
            return listed <= present
        if job["kind"] == "compare":
            listed = json.loads((bp / "compare" / f"{job['id']}.json").read_text())["pairs"]
            answered = {(item.get("a"), item.get("b")) for item in json.loads(paths[0].read_text()).get("judgements", [])}
            return all((pair["a"], pair["b"]) in answered for pair in listed)
        if job["kind"] == "naming":
            wanted = {entry["id"] for entry in json.loads((root / "research" / "expansion" / "naming" / f"{job['id']}.json").read_text())}
            return wanted <= {entry.get("id") for entry in json.loads(paths[0].read_text())}
        if job["kind"] == "status":
            wanted = {stage["id"] for roadmap in json.loads((root / "research" / "expansion" / "status" / f"{job['id']}.json").read_text())
                      for stage in roadmap["stages"]}
            return wanted <= {entry.get("stageId") for entry in json.loads(paths[0].read_text())}
    except (OSError, ValueError, KeyError, TypeError):
        return False
    return True


def transition(job, labels, complete, is_ready):
    """A job's queue state and issue state label, from the queue and GitHub.

    A claim or an open pull request on GitHub makes the job external, so the local
    swarm skips it. Deliverables on main that cover the whole job finish it, whoever
    held the claim: workers may release a claim once their pull request is open.
    A released claim makes the job pending again. Local work is left alone."""
    state = job.get("state")
    if state in ("pending", "external") and complete:
        state = "done"
    elif state == "pending" and ("state:claimed" in labels or "state:submitted" in labels):
        state = "external"
    elif state == "external" and "state:available" in labels:
        state = "pending"
    if state == "done":
        return state, "state:done" if (job["kind"] not in AWAIT_INTEGRATION or job.get("integrated")) else "state:submitted"
    if state == "external":
        return state, "state:submitted" if "state:submitted" in labels else "state:claimed"
    if state == "pending":
        return state, "state:available" if is_ready else "state:blocked"
    if state == "running":
        return state, "state:running"
    return state, None


def set_state(number, wanted, current):
    remove = [label for label in current if label in STATE_LABELS and label != wanted]
    command = ["gh", "issue", "edit", str(number), "--add-label", wanted]
    for label in remove:
        command += ["--remove-label", label]
    return subprocess.run(command, capture_output=True, text=True, cwd=REPO).returncode == 0


# A change to focus.json relabels many issues; sync spreads the edits over its runs.
FOCUS_EDITS_PER_SYNC = 60


def set_focus(number, wanted, label="focus"):
    command = ["gh", "issue", "edit", str(number), "--add-label" if wanted else "--remove-label", label]
    return subprocess.run(command, capture_output=True, text=True, cwd=REPO).returncode == 0


def sync(mapping):
    """Claims flow from GitHub into the queue; local progress flows back as labels."""
    import fcntl
    issues = {item["number"]: item for item in list_issues("swarm", "all")}
    lock = open(BP / ".queue.lock", "a+")
    fcntl.flock(lock, fcntl.LOCK_EX)
    changed_queue, edits, closed, focus_edits = 0, 0, 0, 0
    tiers = (("focus", focus_roadmaps()), ("top", focus_roadmaps(top=True)))
    try:
        queue = json.loads((BP / "queue.json").read_text())
        by_id = {j["id"]: j for j in queue["jobs"]}
        for job in queue["jobs"]:
            number = mapping.get(job["id"])
            item = issues.get(number)
            if not item:
                continue
            labels = [label["name"] for label in item["labels"]]
            complete = job.get("state") in ("pending", "external") and deliverables_complete(job)
            state, wanted = transition(job, labels, complete, ready(job, by_id))
            if state != job.get("state"):
                job["state"] = state; changed_queue += 1
                job["note"] = {"external": f"claimed on GitHub issue #{number}",
                               "done": f"deliverables arrived from an external worker on issue #{number}",
                               "pending": f"released on GitHub issue #{number}"}.get(state, job.get("note"))
                if state == "done":
                    job["finishedAt"] = __import__("datetime").datetime.now(__import__("datetime").timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
            if wanted and wanted not in labels:
                edits += set_state(number, wanted, labels)
            for label, members in tiers:
                if (item["state"] == "OPEN" and wanted != "state:done" and focus_edits < FOCUS_EDITS_PER_SYNC
                        and is_focus(job, members) != (label in labels)):
                    focus_edits += 1
                    edits += set_focus(number, label not in labels, label)
            if wanted == "state:done" and item["state"] == "OPEN":
                note = "Finished by the local swarm." if job.get("account") else "Finished."
                subprocess.run(["gh", "issue", "close", str(number), "--comment", note], capture_output=True, cwd=REPO)
                closed += 1
        if changed_queue:
            tmp = BP / "queue.json.tmp"
            tmp.write_text(json.dumps(queue, indent=1, ensure_ascii=False) + "\n")
            tmp.replace(BP / "queue.json")
    finally:
        fcntl.flock(lock, fcntl.LOCK_UN)
    print(f"sync: {changed_queue} queue change(s), {edits} label edit(s), {closed} issue(s) closed")


BOT = "github-actions[bot]"


def worker_activity(comments, prs):
    """When a claimed or submitted job last showed its worker's progress: the bot's claim and
    submission notices, any comment but the orchestrator's, and pull requests naming the issue."""
    times = [c["created_at"] for c in comments
             if (c["user"]["login"] == BOT and c["body"].startswith(("Claimed for", "Submitted in")))
             or (c["user"]["login"] != BOT and not c["body"].lstrip().startswith("Orchestrator:"))]
    return max(times + [pr["updated_at"] for pr in prs], default=None)


def names_issue(pr, number):
    return re.search(rf"#{number}\b", (pr.get("title") or "") + "\n" + (pr.get("body") or "")) is not None


def stale(mapping, by_id, hours, release):
    """Claims and submissions whose worker has shown nothing for `hours` hours: a claim with no
    comment or pull request since, or a submission whose pull request is gone while the job is
    unfinished. Releasing one makes its job available again; the sync then records it in the queue."""
    import datetime
    now = datetime.datetime.now(datetime.timezone.utc)
    cutoff = (now - datetime.timedelta(hours=hours)).strftime("%Y-%m-%dT%H:%M:%SZ")
    number_to_job = {number: jid for jid, number in mapping.items()}
    repo = GITHUB.split("github.com/")[1]

    def api(path):
        result = subprocess.run(["gh", "api", path], capture_output=True, text=True, cwd=REPO)
        if result.returncode != 0:
            raise SystemExit(f"gh api {path}: {result.stderr.strip()[:200]}")
        return json.loads(result.stdout)
    # Pull requests touched within the window, newest first, and every open one.
    prs, page = [], 1
    while True:
        batch = api(f"repos/{repo}/pulls?state=all&sort=updated&direction=desc&per_page=100&page={page}")
        prs += batch
        if len(batch) < 100 or batch[-1]["updated_at"] < cutoff:
            break
        page += 1
    released = []
    for label in ("state:claimed", "state:submitted"):
        for item in list_issues(label, "open"):
            number = item["number"]
            job = by_id.get(number_to_job.get(number), {})
            if job.get("state") in (None, "done", "superseded", "failed") or deliverables_complete(job):
                continue  # finished, or no swarm job: the sync brings its label up to date
            naming = [pr for pr in prs if names_issue(pr, number)]
            if any(pr["state"] == "open" for pr in naming):
                continue
            last = worker_activity(api(f"repos/{repo}/issues/{number}/comments?per_page=100"), naming)
            if last and last >= cutoff:
                continue
            print(f"#{number} {job['id']} ({label}) no progress since {(last or '?')[:16]}: {item['title'][:70]}")
            if not release:
                continue
            subprocess.run(["gh", "issue", "comment", str(number), "--body",
                            f"Orchestrator: this job has shown no progress since {(last or 'it was claimed')[:16].replace('T', ' ')} UTC "
                            f"(no comment, pull request or checkpoint for {hours:g} hours, longer than jobs here take), so it is available again. "
                            "Any merged work stays in the repository; continue from it and the handoff note, if there is one. "
                            "If you are still working on it, comment `/claim` again."],
                           capture_output=True, cwd=REPO)
            subprocess.run(["gh", "issue", "edit", str(number), "--remove-label", label, "--add-label", "state:available"],
                           capture_output=True, cwd=REPO)
            released.append(job["id"])
            time.sleep(1)
    print(f"stale: {len(released)} released" if release else "stale: listed only; pass --release to release")


if __name__ == "__main__":
    main()
