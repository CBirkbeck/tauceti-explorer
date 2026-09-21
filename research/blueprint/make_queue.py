#!/usr/bin/env python3
"""Build (or extend) the blueprint swarm queue and write every job prompt.

Usage:
  python3 research/blueprint/make_queue.py --library <reference library> --baseline <baseline dir> \
      --workers <worker dir> [--max-stages 6] [--dry-run]

Existing jobs keep their state; new jobs are appended. Prompts are written to
research/blueprint/prompts/ (not committed: they contain local paths).
"""
from __future__ import annotations

import argparse
import json
from collections import defaultdict
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
BP = REPO / "research" / "blueprint"

COMMON_INPUTS = """INPUTS
- The roadmap text and stages: data/atlas.json (roadmaps[] entry with the roadmap id: readme, summary; stages[] with that owner: id, key, title, description, requires, consumers, parentStageId). Extract them with python3 into your scratch directory and read them in full. New roadmaps are defined in research/blueprint/roadmaps/*.json.
- An integrated, reviewed decomposition, if present: data/decompositions/{FILE}.json. Build on it: keep its node ids for nodes you keep, refine them to declaration granularity and reuse its verified locators. Its node ids may be reused in your packet, which will replace it.
- Unreviewed drafts, as leads only (re-verify everything): research/expansion/external/*/{FILE}.json and research/expansion/drafts/{FILE}.json.
- Other blueprints: research/blueprint/packets/*.json. Use their node ids for cross-roadmap prerequisites when they supply exactly what you need. Ids promised by concurrent jobs are listed in research/blueprint/reserved-ids.json.
- The reviewed library audit: data/library-coverage.json, one entry per audited layer: its verdict (built, partly built, not built or process), each target with where the pinned libraries have it, the declarations that show it, and the layers of other roadmaps that duplicate it. Plan only what is missing. A target the libraries contain is a baseline citation, never a node; a partly built layer gets nodes only for its missing targets; a process layer is not mathematics and gets no nodes (propose its removal in `restructure`); a layer that duplicates another roadmap's layer is planned once, by the roadmap that owns it, and you add a `requests` entry for it. Audits in research/blueprint/audit/ without an accepted review are leads only.
- Library baseline (what exists today): {BASELINE}/BASELINE.json (pinned commits), {BASELINE}/TauCeti/ (Tau Ceti source), {BASELINE}/mathlib/Mathlib/ (Mathlib source), {BASELINE}/declarations.tsv (index: library, full name, kind, file, line, signature start). Search the index (grep -i -P), then open the Lean file at that line and read the actual statement before citing it. Tau Ceti is a large library (about 70,000 declarations): search it thoroughly before declaring something missing.
- Links between roadmaps: research/blueprint/links/*.json (evidence-backed stage links and overlaps; read every entry that mentions your roadmap's stages) and the stage links already in data/atlas.json (stageEdges).
- Style and density: research/blueprint/UPSTREAM_GUIDE.md (upstream's checklist, binding) and the upstream roadmap documents under content/tau-ceti/ (read at least two in or near your area, for example ModularForms/README.md, EllipticCurves/README.md, AdicSpaces/README.md, ModularCurves/README.md).
- Reference library: {LIBRARY}/ (CATALOGUE.json and the additional_*.json catalogues, papers/, extracted/, text/; text files are page-ordered: use grep -n and sed -n). Public sources that are not in the library may be fetched into your scratch directory with provenance (URL, SHA-256, date); never into the repository."""

METHOD = """METHOD
1. Sources and targets. Go through every paper and book the roadmap is built on (its document's references and the sources its stages cite), and list every definition and every key theorem they use or prove on the way to the targets of the stages in scope, together with the targets the stages state: definitions, constructions, theorems, comparisons, examples. Each becomes a node whose `realises` names its stage, unless the libraries or another roadmap already provide it (step 2). Coverage is complete: no definition or key theorem of the sources is left out (PROTOCOL.md section 0).
2. Backward chaining to the baseline. For each node write the exact statement with all hypotheses, then the construction or proof as steps, and list every fact a step uses in `prerequisites`. For each prerequisite:
   (a) find it in the baseline and confirm its statement in the Lean source (record it in baseline.declarations); or
   (b) find it as a node of another blueprint or integrated decomposition and confirm that node's statement suffices; or
   (c) if it belongs to another roadmap with no suitable node yet, add a `requests` entry and list that roadmap's stage; or
   (d) add a new node to this packet.
   Recurse on every new node until every chain ends in (a), (b) or (c). Keep an explicit worklist in your scratch directory and work through it methodically; do not stop at the first level.
   Build on existing roadmaps and never duplicate them (PROTOCOL.md section 15): what a Tau Ceti roadmap or another proposed roadmap plans is imported through (b) or (c), never planned again in (d). If you need more than an existing roadmap provides in its own direction, propose the addition as "<that roadmap>, Part II" in `restructure`.
3. Granularity. One node per library declaration. Split multi-part results. Every non-routine step becomes its own lemma node.
4. Uses, API and unit tests. For every definition and construction, first find where and how it is used, in the sources and in the layers that consume it (the stage links in the atlas extracts, and other packets), and record each use in `uses` as {{"where", "how"}}. Then give it an `api` outline that serves those uses (PROTOCOL.md section 4) and a `tests` list of at least three unit tests (section 12), chosen so that a plausible wrong definition fails one of them: a value in a small case, the degenerate case, agreement with the closest Mathlib or Tau Ceti notion wherever both are defined, and a non-example. Think as a library designer: what does a user of this object need in order to use it without unfolding its definition? Include compatibility with the closest Mathlib or Tau Ceti notion, stated precisely.
5. Sources. Every node cites the passage that states or proves it. Keep excerpts short.
6. Check. Run `python3 scripts/check_blueprint.py {OUTPUT}` and fix every error. Record anything you could not establish as a gap; never paper over a missing step.
7. Document. Write {README} in the style and density of the upstream Tau Ceti roadmap documents. For each layer in scope, give:
   - the objects, with exact definitions and pinned conventions;
   - the theorems, with their hypotheses;
   - the named declarations, their API and their unit tests;
   - the dependencies inside this roadmap and on other roadmaps (by stage id);
   - the acceptance tests.
   The document and the packet must agree. Do not write "optional", "deferred" or "later".
8. Suggested Lean file. Write {SUGGESTED} in the form of upstream's Suggested.lean (PROTOCOL.md section 13; UPSTREAM_GUIDE.md, Prototyping): the standard note; for each definition and construction its signature, its API items as lemma signatures and its unit tests as `example`s, each proved by `sorry`; the named theorems as signatures proved by `sorry`. Import individual Mathlib and Tau Ceti modules and prototype against what they already contain. If you can run Lean at the pinned baseline, make the file elaborate; say in the handoff whether you compiled it.
9. Planets. Mark the nodes the atlas should show as planets with "planet": {{"name": "..."}} (PROTOCOL.md section 14): a layer's key definitions, central constructions and named theorems, at most six per layer, each named by a short noun phrase from the source.
10. Structure. If this roadmap overlaps another, or is too broad or too thin, or a layer should be divided into sub-layers for the atlas, record a `restructure` proposal in the packet (PROTOCOL.md sections 9 and 14) and keep working with the current structure.
11. Handoff. Write research/blueprint/handoff/{JOB}.md: what is closed, what remains (precisely), requests you made to other roadmaps, whether the suggested file compiled, sources read and sources missing.

RULES
- Lean code only in {SUGGESTED}; no Lean code or `sorry` in the packet or the document; no tickets and no implementation claims: implementationStatus stays "unchecked".
- Never plan what another roadmap plans (PROTOCOL.md section 15).
- Edit only {EDITABLE}, the document {README}, the suggested file {SUGGESTED}, the handoff note and files in your scratch directory. Do not run git. Do not edit application code, data/, content/, tests/, README.md, HANDOVER.md, the queue, reserved ids or other packets.
- No private absolute paths, PDFs or extracted book text in the repository.
- Save the packet after every few nodes (write to a temporary file in your scratch directory, validate it with python3 -c 'import json;json.load(open(...))', then move it into place) so an interrupted run loses little.
- Depth before breadth: a closed treatment of fewer stages is worth more than a shallow treatment of all. If you cannot finish, leave status "partial" with precise `remaining` lists so a continuation job can resume exactly where you stopped.

Finish by printing a summary under 250 words: nodes by kind, API items, unit tests, planets, baseline declarations cited, whether the suggested file compiled, gaps, requests, and what a continuation must do."""

HEADER = """You are a research mathematician and library architect for the Tau Ceti Atlas blueprint programme. You run unattended in a tmux session as job {JOB}. Work in {REPO}. Your scratch directory is {WORKERS}/{JOB} (create it).

READ FIRST (binding): research/blueprint/PROTOCOL.md, then research/expansion/PROTOCOL.md for the source-faithfulness discipline it inherits.
"""

BP_TEMPLATE = HEADER + """
JOB: write the blueprint for roadmap {ROADMAP} ("{TITLE}"){PARTNOTE}.
Stages in scope (write exactly these ids into the packet's `scope`, and one coverage record for each):
{STAGES}
Output packet: {OUTPUT} (set "part": {PART}).
If {OUTPUT} already exists from an earlier attempt, read it and continue: keep what is right, extend what is missing, and do not start over.
{EXTRA}
""" + COMMON_INPUTS + "\n\n" + METHOD

DESIGN_TEMPLATE = HEADER + """
JOB: design a new roadmap and write its complete blueprint.
Roadmap id: {ROADMAP}. Area (group): {GROUP}.
{BRIEF}

Step 1. Write the roadmap definition research/blueprint/roadmaps/{ROADMAP}.json (schema in PROTOCOL.md section 7). The layers must lead from the library baseline to the final theorem, in the order a formaliser would build them, with each layer's targets stated precisely in its description. Put in this roadmap everything that is specific to this proof, and take inputs that belong to existing roadmaps from those roadmaps (list them in `prerequisites`, and use their stage ids in `requires`). Search data/atlas.json for suppliers; read a supplier stage's description before relying on it.
Step 2. Write the blueprint packet {OUTPUT} covering every stage of the new roadmap ("part": null), following the method below. The roadmap definition may be revised while you write the packet; keep both consistent.
If either file already exists from an earlier attempt, continue from it.
""" + COMMON_INPUTS + "\n\n" + METHOD

PAPER_TEMPLATE = HEADER + """
JOB: extract a paper and route its mathematics (PROTOCOL.md section 16).
Paper: {CITATION}
Link: {LINK}
Maintainer's note: {NOTE}

Write research/blueprint/papers/{PAPER}.result.json in the format of PROTOCOL.md section 16, and the report research/blueprint/papers/{PAPER}.md.
1. Read the paper completely. The link may be paywalled: use the authors' public version (arXiv or a homepage), check that it matches the published paper, and record in `source` which version you read. Fetch it into your scratch directory with its provenance (URL, SHA-256, date), and read what the paper relies on wherever you need to know exactly what an input says.
2. List every definition, construction and key theorem the paper uses or proves on the way to its main results, and each main result, as an item with its exact statement and its locator. Split multi-part results. Coverage is complete (PROTOCOL.md section 0).
3. For each item, search the pinned libraries ({BASELINE}/declarations.tsv, then open the Lean file and read the statement) and the atlas: data/atlas.json (layers and their descriptions), the new roadmaps in research/blueprint/roadmaps/, the packets in research/blueprint/packets/, and the reviewed library audit data/library-coverage.json. Mark it `library`, `planned` or `missing`, and cite what you found.
4. Route every missing item exactly once: `source` of existing layers of a proposed roadmap, `part-ii` of an existing roadmap (a Tau Ceti roadmap is extended this way, never re-planned), or `new`. Build on what exists (PROTOCOL.md section 15). For each part-ii or new route, write the brief its design job will follow.
5. List the prerequisite papers the atlas does not yet cover.
6. Run `python3 scripts/check_paper.py research/blueprint/papers/{PAPER}.result.json` until it reports no errors. Set "status": "complete" only when the whole paper is extracted and every missing item is routed. Otherwise leave "partial" and write a handoff note, research/blueprint/handoff/{PAPER}.md.

Worked examples of routing, by the maintainer (research/blueprint/papers/papers.json, "guides"):
{GUIDES}
Edit only research/blueprint/papers/{PAPER}.result.json, research/blueprint/papers/{PAPER}.md, the handoff note and your scratch directory.
""" + COMMON_INPUTS

PAPER_REVIEW_TEMPLATE = """You are an independent reviewer for the Tau Ceti Atlas blueprint programme. You did not write the files you review. You run unattended in a tmux session as job {JOB}. Work in {REPO}. Your scratch directory is {WORKERS}/{JOB} (create it). Save as you go.

READ FIRST (binding): research/blueprint/PROTOCOL.md, sections 0, 15 and 16.

REVIEW: the paper extraction research/blueprint/papers/{PAPER}.result.json and its report research/blueprint/papers/{PAPER}.md. Paper: {CITATION} ({LINK}).
Library baseline: {BASELINE} (BASELINE.json, TauCeti/, mathlib/Mathlib/, declarations.tsv). Public sources may be fetched into your scratch directory with provenance, never into the repository.

1. Items. Check statements and locators against the paper, and that no definition or key theorem on the way to the main results is missing.
2. Statuses. Open every cited declaration at the pinned commit and check that it provides the item. Read every cited layer's description and check that it plans the item. Search the libraries and the atlas yourself for every missing item.
3. Routes. Every missing item is routed once. A source route names the layers the item belongs in. A Part II or a new roadmap is justified only when nothing in the atlas owns the mathematics, and its brief states the final theorems exactly and names what to import. Tau Ceti roadmaps are never re-planned.
4. Correct the extraction in place where the fix is clear, and record every change.
5. Run `python3 scripts/check_paper.py` on the extraction and fix every error.
Write research/blueprint/papers/{PAPER}.review.json, {{"paper", "verdict": "accept | revise", "routes": [{{"route": <n>, "verdict": "accept | reject", "reason"}}], "notes"}}, and research/blueprint/reviews/REV-{PAPER}.md. Accept a route only if you would build on it: accepted routes become design jobs and blueprint sources.
"""

REVIEW_TEMPLATE = """You are an independent reviewer for the Tau Ceti Atlas blueprint programme. You did not write the files you review. You run unattended in a tmux session as job {JOB}. Work in {REPO}. Your scratch directory is {WORKERS}/{JOB} (create it). Save as you go.

READ FIRST (binding): research/blueprint/PROTOCOL.md and research/expansion/PROTOCOL.md.

REVIEW: {TARGETS}
Library baseline: {BASELINE} (BASELINE.json, TauCeti/, mathlib/Mathlib/, declarations.tsv). Reference library: {LIBRARY}/. Public sources may be fetched into your scratch directory with provenance, never into the repository.

Check each item below, and correct it in place wherever the fix is clear. Record every change you make.
1. Sources. Check every node's locator and excerpt against the source text. Statements keep the source's hypotheses exactly.
2. Baseline. For every `baseline.declarations` entry, open the Lean file at the cited module and confirm two things: that the declaration exists under that name at the pinned commit, and that its statement provides what the citing nodes need, with the same or weaker hypotheses and the same conventions. Remove or replace a wrong citation. A near miss becomes a node.
3. Closure. For every node, ask whether its proofSteps really follow from its prerequisites plus routine steps.
   - Where they do not, add the missing prerequisites or lemma nodes, marking each added node with "addedBy": "{JOB}", or record a gap.
   - Check that every stage target in scope is realised.
   - Check that cross-roadmap prerequisites are justified, by reading the supplier's statement.
   - Check that each request is precise.
4. Granularity. Split any node that bundles several declarations or hides a non-routine argument.
5. API. For every definition and construction, check that the outline would let a user work with the object without unfolding its definition. It should cover constructors, extensionality, simp lemmas, structure, functoriality, the universal property, compatibility with Mathlib or Tau Ceti, relations and examples. Add any missing items.
6. Unit tests, suggested file and planets. Every definition and construction has at least three unit tests that would catch a plausible wrong definition (PROTOCOL.md section 12). The suggested Lean file matches the packet, uses `sorry` honestly and, if you can run Lean at the pinned baseline, elaborates (section 13). Planets are key definitions, central constructions and named theorems, named from the source (section 14). Add or correct what is missing.
7. Library audit. Nothing that the reviewed audit (data/library-coverage.json) shows in the libraries is planned as a new node, and a duplicated layer is requested from its owner rather than planned again.
8. For a new roadmap, also check that its layers are correctly ordered, that its suppliers are right, and that its scope is honest.
9. Run `python3 scripts/check_blueprint.py` on each packet and fix every error.

Then add a top-level "review" object to each packet:
{{"status": "accepted" | "needs_changes", "reviewer": "independent-review-{JOB}", "date": "<today>", "notes": "<what was checked and corrected>", "checked": [{{"nodeId": "...", "verdict": "verified|corrected|added|unverifiable", "note": "..."}}]}}
Use "accepted" only when all of the following hold:
- every node is verified, corrected, or added and justified;
- every baseline citation is confirmed;
- no unresolved contradiction remains.
A packet may still be accepted while it is partial and while it lists open gaps, as long as they are recorded honestly.
Write research/blueprint/reviews/{JOB}.md with the counts, corrections, baseline citations removed or fixed, nodes added, and questions for the orchestrator.

RULES: edit only the files under review, your report and scratch files. Do not run git. No Lean code outside the suggested file under review. No private paths in the repository. Do not promote anything.
Finish with a summary under 250 words."""

LINK_TEMPLATE = """You are a mathematician mapping dependencies between roadmaps for the Tau Ceti Atlas. You run unattended in a tmux session as job {JOB}. Work in {REPO}. Your scratch directory is {WORKERS}/{JOB} (create it). Save as you go.

READ FIRST (binding): research/blueprint/PROTOCOL.md, especially section 10 (links) and section 9 (restructuring).

JOB: find every prerequisite relationship and every overlap between the stages of roadmap {ROADMAP} ("{TITLE}") and the stages of all other roadmaps in the atlas, and write them to {OUTPUT}.
If {OUTPUT} already exists (a checkpoint from an earlier worker), read it and research/blueprint/handoff/{JOB}.md first, keep the links and overlaps that you can confirm, and continue the screen from where it stopped. Set "status": "complete" only when the whole catalogue-wide screen is finished; otherwise leave "status": "partial" and say in the handoff note exactly where you stopped.

SOURCES
- data/atlas.json: roadmaps[] (id, title, summary, readme, group), stages[] (id, owner, key, title, description, requires, consumers), edges[] (roadmap links) and stageEdges[] (stage links already recorded). Extract what you need with python3.
- New roadmaps: research/blueprint/roadmaps/*.json.
- Other link packets: research/blueprint/links/*.json. Do not duplicate a link that is already recorded there or in stageEdges.
- To check what a stage relies on in the library, you may search {BASELINE}/declarations.tsv.

METHOD
1. Read {ROADMAP}'s document and every one of its stage descriptions in full. For each stage, write down in your scratch directory its inputs (what it assumes or imports) and its outputs (what it constructs or proves), in precise mathematical terms.
2. Candidate search. For each input and output, search the stage titles, stage descriptions and documents of every other roadmap for the objects, their synonyms and their notation (grep -i over an extracted text dump). Read the summaries of all roadmaps in the same and neighbouring areas. Examine at least the following:
   - every roadmap in the same area;
   - every roadmap whose document mentions this roadmap's objects;
   - every other upstream Tau Ceti roadmap (ids starting with "tauceti:").
3. Decide each candidate pair by reading both stage descriptions in full.
   - Prerequisite: the source stage supplies a result or construction that the target stage uses. Record the direction (prerequisite → consumer), the reason, and two verbatim quotes: one showing the output, one showing the use. Mark the link "explicit" when a text names the other roadmap or stage, and "inferred" when the match is exact but unnamed.
   - Overlap: both stages develop the same mathematics. Record what overlaps and recommend merge, rescope or keep, with a concrete proposal.
   - Otherwise, record nothing for the pair.
   Shared vocabulary is not a dependency. If the texts do not settle the direction, record an overlap rather than guess. Prefer the most specific stage on each side, such as a milestone rather than its whole layer.
4. List every roadmap you read in "examined", with its result.
5. Run `python3 scripts/check_links.py {OUTPUT}` and fix every error.

RULES: edit only {OUTPUT}, research/blueprint/handoff/{JOB}.md and your scratch files. Do not run git. No private paths in the repository.
Finish with a summary under 250 words: links in each direction (with the main partner roadmaps), overlaps with recommendations, and roadmaps that should be merged or rescoped."""

LINK_REVIEW_TEMPLATE = """You are an independent reviewer for the Tau Ceti Atlas. You did not write the file you review. You run unattended as job {JOB}. Work in {REPO}. Your scratch directory is {WORKERS}/{JOB}.

READ FIRST: research/blueprint/PROTOCOL.md sections 9 and 10.

REVIEW: the link packet {TARGET} for roadmap {ROADMAP}.
- For every link, read both stage descriptions in full and confirm three things: that the source really supplies what the target uses, that the direction is right, and that both quotes are verbatim and relevant. Fix what is wrong, and remove any link that rests on shared vocabulary only.
- For every overlap, confirm it and judge the recommendation.
- Spot-check completeness. Take at least five stages of {ROADMAP} and search the atlas for suppliers and consumers the packet missed. Add any you find, with evidence, marked "addedBy": "{JOB}".
- Run `python3 scripts/check_links.py {TARGET}` and fix every error.
Then add a top-level "review" object to the packet:
{{"status": "accepted" | "needs_changes", "reviewer": "independent-review-{JOB}", "date": "<today>", "notes": "...", "removed": [...], "added": [...]}}
Write research/blueprint/reviews/{JOB}.md.

RULES: edit only {TARGET}, your report and scratch files. Do not run git. No private paths in the repository.
Finish with a summary under 200 words."""

ASSEMBLY_TEMPLATE = HEADER + """
JOB: assemble the blueprint of roadmap {ROADMAP} ("{TITLE}") from its reviewed parts.
Part packets: {PARTS}
Part documents: {PARTDOCS}
Tasks:
1. Write the full roadmap document {README}. It opens with purpose, scope and boundaries (against the neighbouring roadmaps named in research/blueprint/links/), conventions, sources and a layer overview, followed by the parts in order. Reconcile notation across parts. The result should read as one document in the upstream style.
2. Check cross-part prerequisites. A node that needs a result from another part must reference that part's node id. Fix references in the part packets where the fix is clear; otherwise record a gap in the consuming part.
3. Run `python3 scripts/check_blueprint.py` on all part packets and fix every error.
4. Join the parts' suggested Lean files ({PARTLEAN}) into {SUGGESTED}, with one standard note, one import block and consistent names.
5. Collect the parts' `restructure` proposals and requests in research/blueprint/handoff/{JOB}.md.
RULES: edit only the listed part packets, {README}, {SUGGESTED}, the handoff note and scratch files. Do not run git. No Lean code outside {SUGGESTED}. No private paths in the repository. Do not change a review verdict. If you change a reviewed node's mathematics, say so in the handoff note, so that the orchestrator can schedule a re-review.
Finish with a summary under 200 words."""

RESTRUCTURE_TEMPLATE = HEADER + """
JOB: restructure the roadmap family {FAMILY} ("{NAME}") so that every piece of mathematics has exactly one owner and the roadmaps build on each other (PROTOCOL.md section 15).
Family file: {FAMILYFILE} (its proposed roadmaps, the existing Tau Ceti roadmaps they overlap, and the evidence).
Outputs: {OUTPUT} (the proposal, in the format of PROTOCOL.md section 15) and {REPORT} (your reasoning, for a human reader).
If {OUTPUT} already exists from an earlier attempt, read it and {REPORT} first, and continue from them.

INPUTS
- The family file. Its evidence lists pairs of layers that the library audits or the link maps flagged as overlapping, with their notes. They are leads, not verdicts: some are deliberate handoffs between a supplier and its consumer, and some duplicates may be missing.
- Every member's roadmap document (its `document` path) and its layers: research/blueprint/atlas/roadmaps/<id>.json (file name: the roadmap id with ':' and '/' replaced by '_'), with each layer's full description and prerequisite links. Read them in full.
- Every anchor's document and layers. Anchors are Tau Ceti roadmaps: existing work that never changes.
- The reviewed library audit, data/library-coverage.json: what the pinned Mathlib and Tau Ceti already contain.
- The roadmaps outside the family that consume a member (the `requires` links in the atlas extracts), so that nothing a consumer relies on disappears.

METHOD
1. For each member, write down in your scratch space what each of its layers constructs or proves, precisely.
2. For every piece of mathematics that appears in more than one roadmap of the family, members and anchors alike, choose one owner. An anchor always owns what it plans. Between members, the roadmap whose purpose it serves most directly, usually the more foundational one, owns it, and the other imports it.
3. Decide each member's fate: keep (possibly with narrowed layers); extend (it becomes "<base roadmap>, Part II: <what it adds>" and starts exactly where the base stops); merge (its remaining layers join another member); or retire (everything it plans is owned elsewhere).
4. For each layer that changes, narrow it (state exactly what remains), move it, or drop it (name the layers that supply it). Add a link from the new supplier to every layer that relied on what moved or went.
5. Check: every piece of mathematics that was duplicated has exactly one owner; every consumer inside and outside the family still finds each of its prerequisites; no anchor changes; each extension starts where its base stops.
6. Write {REPORT}: the family's structure before and after, each decision with its reason, and anything you are unsure of.

RULES
- Edit only {OUTPUT}, {REPORT} and files in your scratch directory. Do not run git. Do not edit roadmap documents, atlas data or other jobs' files: the orchestrator applies accepted proposals.
- Restructuring moves and deduplicates; it never loses mathematics. If a target seems unnecessary, say so in the report instead of dropping it.
- No private absolute paths in the repository.

Finish with a summary under 250 words: the decision for each roadmap, the layers changed, the links added, and your open questions."""

RESTRUCTURE_REVIEW_TEMPLATE = """You are an independent reviewer for the Tau Ceti Atlas. You did not write the proposal you review. You run unattended in a tmux session as job {JOB}. Work in {REPO}. Your scratch directory is {WORKERS}/{JOB} (create it). Save as you go.

READ FIRST (binding): research/blueprint/PROTOCOL.md, section 15.

REVIEW: the restructuring proposal {OUTPUT} and its report {REPORT}, for the family {FAMILY} ("{NAME}") described in {FAMILYFILE}.

Check, by reading the members' and anchors' documents and layer descriptions:
1. Duplication: every piece of mathematics planned by more than one roadmap of the family has exactly one owner, and no duplicate was missed.
2. Nothing lost: every target of every changed layer is kept, moved, or supplied by a named layer, and every consumer, inside the family or outside it, still finds its prerequisites.
3. Anchors are unchanged; each extension starts where its base stops and is titled "<base roadmap>, Part II: <what it adds>".
4. The proposal follows the format of PROTOCOL.md section 15.
Correct the proposal in place wherever the fix is clear, and record every change. Then add a top-level "review" object to it: {{"status": "accepted" | "needs_changes", "reviewer": "independent-review-{JOB}", "date": "<today>", "notes": "<what was checked and corrected>", "corrections": ["..."]}}.
Write research/blueprint/reviews/{JOB}.md with your findings and questions for the orchestrator.

RULES: edit only the proposal, your report and scratch files. Do not run git. No private paths in the repository.
Finish with a summary under 200 words."""

PLANETS_TEMPLATE = """You are a mathematical editor for the Tau Ceti Atlas. You run unattended in a tmux session as job {JOB}. Work in {REPO}. Your scratch directory is {WORKERS}/{JOB} (create it). Save progress often, so partial work survives.

TASK: the planets of the atlas are the key definitions, named theorems and central constructions of each roadmap layer. The planets listed in {INPUT} were extracted mechanically from the roadmap texts and the source decompositions, and most of their names are sentence fragments or source locators ("FS VI.1.5-VI.1.9: loop groups, the local Hecke stack and ..."). Decide which deserve to be planets, and give those a proper name: the standard name of the object or result where the text uses one (for example "Potential automorphy theorem", "Geometric Satake equivalence", "Pre-Bloch group"), otherwise a short noun phrase.

Each entry has: id, label (the current name), kind, excerpt (the passage; may be empty), star and starId (its layer), roadmap and roadmapId, curated (false here) and refinement (true when the planet is a node of a reviewed source decomposition).

For EVERY entry decide exactly one of:
 (a) "keep": the current label already names a key definition, named theorem or central construction well: a noun phrase of at most 48 characters, with no verb, no source locator (FS VI.1.5, Theorem 3.2, p. 138), no bookkeeping vocabulary, and not identical to its layer's title.
 (b) "name": the passage is about such an object or result but the label is poor. Give a noun phrase of at most 48 characters, built only from words and symbols that occur in the excerpt, the current label, or the layer's own title and description (research/blueprint/atlas/roadmaps/<file>.json holds them; the file name is the roadmap id with ':' and '/' replaced by '_'). Prefer the name the text itself gives the result ("the potential automorphy theorem", "Serre's conjecture"). Strip locators: "FS VI.1.5-VI.1.9: loop groups, the local Hecke stack and the Beilinson-Drinfeld Grassmannian" becomes "Beilinson–Drinfeld Grassmannian". Never introduce mathematics the passage does not state, never guess a name or attribution the text does not give, and never turn a conjecture into a theorem or a special case into the general one.
 (c) "drop": not a key definition, named theorem or central construction. This covers instructions and workflow, acceptance checks, examples used as tests, scope caveats and warnings, bookkeeping about owners, suppliers or documents, cross-references between layers ("R5 uses P0-P3 to construct ..."), and fragments whose object cannot be identified. Give a one-line reason.
 Set "kind" to "definition", "theorem" or "construction" as appropriate, otherwise null.

Judgement: a layer keeps its few most important planets, usually two to six. When in doubt between "name" and "drop" for a minor item, drop it: the passage stays readable in the layer's text, and a poor planet misleads every reader of the map.

RULES: names within one layer (same starId) must be distinct. Capitalise only the first word and proper names, and do not capitalise a name whose first token is notation (p-adic, n-local). Write en dashes as "–" (Riemann–Roch), keep the passage's notation (GL2, Bun_G as written), and use no trailing punctuation, no quotation marks and none of the characters \\ $ {{ }} ^. Function words (in, on, of, for, and, over, with, from, into, under, via, the, a, an, its) are exempt from the passage-vocabulary rule. Check every new label with python3 (len(label) <= 48).

OUTPUT: {OUTPUT}, a JSON array of objects {{"id": ..., "decision": "keep" | "name" | "drop", "label": <string or null>, "kind": <"definition" | "theorem" | "construction" | null>, "reason": <string, for drop>}} covering every input id exactly once. Rewrite the whole file after every 50 entries, validate it with python3 -c "import json;json.load(open('{OUTPUT}'))", and check that its id set equals the input's. Then run `python3 scripts/merge_landmark_names.py {OUTPUT}` (without --apply) and fix every rejected entry. Edit no other file in the repository, do not run git, and never write private absolute paths into the repository.

Finish by printing the counts of keep, name and drop decisions, five renamed entries (old -> new), and five dropped entries with their reasons."""

BCGP18_BRIEF = """Final theorem: Boxer, Calegari, Gee and Pilloni, "Abelian surfaces over totally real fields are potentially modular" (arXiv:1812.09269): every abelian surface over a totally real field is potentially modular, with the paper's modularity-lifting theorems for GSp4 and the consequences it states. Cover the paper completely, every definition and key theorem it uses or proves. Among them: Siegel modular forms for GSp4 and the Siegel modular threefold with its compactifications; higher Coleman theory and higher Hida theory (Boxer and Pilloni's work, as the paper uses it); the p-adic Hodge theory inputs; the Galois deformation theory and the patching method it uses; abelian surfaces and their polarizations; and the potential-modularity argument. Build on the existing roadmaps and never duplicate them (PROTOCOL.md section 15): Siegel and PEL moduli problems, toroidal compactifications, local and global Galois deformation rings, commutative algebra for deformation theory and patching, potential modularity and compatible systems (Moret-Bailly), Hida and Coleman families, abelian schemes and arithmetic moduli, and the p-adic Hodge theory roadmaps. A large self-contained theory that is missing, such as higher Coleman theory, is proposed as its own roadmap in `restructure`, not buried in this one."""

BCGP25_BRIEF = """Final theorem: Boxer, Calegari, Gee and Pilloni, "Modularity theorems for abelian surfaces" (arXiv:2502.20645), with all the main theorems as stated there. This roadmap builds on the roadmap for their earlier paper (arXiv:1812.09269; job DESIGN-BCGP18, research/blueprint/roadmaps/AbelianSurfacesPotentialModularity.json) and on the infrastructure of the ten-author paper, Allen, Calegari, Caraiani, Gee, Helm, Le Hung, Newton, Scholze, Taylor and Thorne, "Potential automorphy over CM fields" (arXiv:1812.09999). The atlas already plans that infrastructure: Reusable infrastructure for potential automorphy over CM fields; Reusable infrastructure for torsion in arithmetic cohomology; Igusa varieties and torsion concentration (Caraiani and Scholze); and Arithmetic locally symmetric spaces (with the Borel–Serre compactification and boundary cohomology). Cover the paper completely, every definition and key theorem it uses or proves. Among them: higher Coleman theory; abelian surfaces and their polarizations; cuspidal automorphic representations of GL4 over Q, and of the other reductive groups it uses, with their L-functions; the Sato–Tate conjecture as the paper uses it; locally symmetric spaces; the Hecke algebras needed for the ten-author modularity results; Caraiani and Scholze's results; decomposed generic representations; the Borel–Serre compactification and boundary cohomology; and deformation theory. Import from these roadmaps and never duplicate them; where more is needed in one's direction, propose a Part II (PROTOCOL.md section 15)."""

# Papers the maintainer added on 21 September 2026. Three need new layers and
# become "Part II" roadmaps of the roadmaps they extend; one falls inside the
# existing layers of two roadmaps and becomes a source of their blueprints.
PAN_BRIEF = """Final theorems: Lue Pan, "On locally analytic vectors of the completed cohomology of modular curves II", Annals of Mathematics 203 (2026), 121–281 (doi:10.4007/annals.2026.203.1.3), with every main theorem as stated there: the differential operators on modular curves at infinite level at p in the holomorphic and anti-holomorphic directions; the new proof of Emerton's classicality theorem (an absolutely irreducible two-dimensional Galois representation that is regular de Rham at p and appears in the completed cohomology of modular curves comes from an eigenform); and the geometric description of the locally analytic representations of GL₂(ℚ_p) attached to such a representation in completed cohomology. The paper continues Pan's "On locally analytic vectors of the completed cohomology of modular curves" (Forum of Mathematics, Pi 10 (2022), e7), which this roadmap covers first, as its foundation: the Hodge–Tate period map at infinite level, the Sen operator and geometric Sen theory, and the locally analytic vectors of completed cohomology in terms of the perfectoid modular curve. Cover both papers completely, every definition and key theorem they use or prove. The roadmap is "Completed cohomology and p-adic local–global compatibility over Q, Part II: locally analytic vectors": it builds on CompletedCohomologyAndLocalGlobalCompatibility (Emerton's route, R31.1–R31.6) and imports from these roadmaps, never duplicating them (PROTOCOL.md section 15): Hodge–Tate theory, canonical subgroups and automorphic period maps; Shimura towers and perfectoid representability; Perfectoid rings and spaces; P-adic local Langlands for GL₂(Q_p); Locally analytic distributions, growth and character spaces; Completed cohomology, homology and arithmetic towers — Part II; P-adic Hodge theory and geometric comparison; and the modular forms roadmaps."""

SKINNER_BRIEF = """Final theorems: Christopher Skinner, "A converse to a theorem of Gross, Zagier, and Kolyvagin", Annals of Mathematics 191 (2020), 329–354 (doi:10.4007/annals.2020.191.2.1), with every main theorem as stated there: for a semistable elliptic curve E over ℚ with the paper's reduction hypotheses, rank E(ℚ) = 1 and #Ш(E) finite imply ord_{s=1} L(E,s) = 1; the analogue for the abelian varieties attached to weight-two newforms; and the criteria for ord_{s=1} L(f,s) = 1 through Iwasawa theory over imaginary quadratic fields, including the non-vanishing of the p-adic logarithm of a suitable Heegner point. Cover the paper completely, every definition and key theorem it uses or proves. The roadmap is "Rank-zero and rank-one Birch–Swinnerton-Dyer theory, Part II: the p-converse": it builds on RankZeroOneBSD, whose BSD.3 proves the Gross–Zagier–Kolyvagin direction, and imports from these roadmaps, never duplicating them (PROTOCOL.md section 15): Heegner-point Euler systems and arithmetic descent; Gross–Zagier formulas and arithmetic heights; Generalized Heegner cycles and their Iwasawa variation (the p-adic Gross–Zagier formula of Bertolini, Darmon and Prasanna); Main conjectures for modular forms and their families; Automorphic congruences and reverse main-conjecture divisibilities; Euler systems, Kolyvagin systems and higher-rank descent; and Elliptic curves."""

BETTS_STIX_BRIEF = """Final theorem: L. Alexander Betts and Jakob Stix, "Galois sections and p-adic period mappings", Annals of Mathematics 201 (2025), 79–166 (doi:10.4007/annals.2025.201.1.2), with every main theorem as stated there: for a number field K containing no CM subfield and a smooth projective curve Y over K of genus at least 2, the image of the Selmer part of Grothendieck's section set in Y(K_v) is finite for every finite place v. Cover the paper completely, every definition and key theorem it uses or proves: Galois sections and the section conjecture, Selmer sections and their local conditions, the p-adic period mappings of Lawrence and Venkatesh as the paper uses them, and the finiteness argument. The roadmap is "Anabelian geometry and nonabelian Chabauty, Part II: Galois sections and p-adic period mappings": it builds on AnabelianGeometryAndNonabelianChabauty (NC.0 sections, NC.3 Selmer varieties) and imports from these roadmaps, never duplicating them (PROTOCOL.md section 15): The Mordell conjecture after Lawrence and Venkatesh (research/blueprint/roadmaps/MordellLawrenceVenkatesh.json: its p-adic period maps and crystalline comparison); P-adic Hodge theory and geometric comparison; Inverse Galois theory and arithmetic fundamental groups; and Heights, rational points and obstructions."""

BDMTV = ('Balakrishnan, Dogra, Müller, Tuitman and Vonk, "Explicit Chabauty–Kim for the split Cartan modular curve of level 13", '
         'Annals of Mathematics 189 (2019), 885–944 (doi:10.4007/annals.2019.189.3.6): explicit quadratic Chabauty for non-hyperelliptic '
         'curves (genus at least 2 over Q, Jacobian of Mordell–Weil rank equal to the genus and Picard number greater than one, with the '
         "paper's further conditions), and its application determining the rational points of X_s(13), which completes the classification "
         "of non-CM elliptic curves over Q with split Cartan level structure (Bilu–Parent, Bilu–Parent–Rebolledo)")
ADDED_SOURCES = {
    "AnabelianGeometryAndNonabelianChabauty": [BDMTV + ". Its theory (local heights at p and the height equations for non-hyperelliptic curves) belongs to NC.5."],
    "EffectiveDiophantineMethods": [BDMTV + ". Its algorithm and the computation for X_s(13) belong to ED.6, which consumes NC.5 of AnabelianGeometryAndNonabelianChabauty."],
}


def accepted_routes(pid):
    """The routes of a paper extraction that its review accepted (PROTOCOL.md section 16)."""
    folder = BP / "papers"
    try:
        result = json.loads((folder / f"{pid}.result.json").read_text())
        review = json.loads((folder / f"{pid}.review.json").read_text())
    except (OSError, ValueError):
        return []
    if review.get("verdict") != "accept":
        return []
    accepted = {entry.get("route") for entry in review.get("routes", []) if entry.get("verdict") == "accept"}
    return [route for number, route in enumerate(result.get("routes", []), 1) if number in accepted]


def added_sources(rid):
    papers = ADDED_SOURCES.get(rid)
    if not papers:
        return ""
    return ("\nThe maintainer added these sources to this roadmap. Cover them completely, like its own sources (PROTOCOL.md section 0), "
            "within the stages they belong to; what belongs to another roadmap is requested from it:\n" + "\n".join(f"- {paper}" for paper in papers) + "\n")

HABIRO_FAMILY = {"HabiroNumberFields", "HabiroRings", "HabiroCyclotomicCompletions", "HabiroNahmSeries",
                 "HabiroCohomologyFoundations", "ArithmeticQuantumTopology"}

LINK_PRIORITY = ["tauceti:TauCetiRoadmap/ModularCurves", "tauceti:TauCetiRoadmap/ModularForms", "tauceti:TauCetiRoadmap/EllipticCurves",
                 "tauceti:TauCetiRoadmap/AdicSpaces", "tauceti:TauCetiRoadmap/AlgebraicCurves", "tauceti:TauCetiRoadmap/GlobalNumberFields",
                 "tauceti:TauCetiRoadmap/NumberFieldArithmetic", "tauceti:TauCetiRoadmap/LocalFieldsRamification",
                 "tauceti:TauCetiRoadmap/ClassFieldTheory", "tauceti:TauCetiRoadmap/Chebotarev", "tauceti:TauCetiRoadmap/JacobianChallenge",
                 "tauceti:TauCetiRoadmap/ArithmeticDirichletSeries", "tauceti:TauCetiRoadmap/HodgeStructures",
                 "tauceti:TauCetiRoadmap/ProfiniteCohomology", "tauceti:TauCetiRoadmap/ProfiniteProPGroups",
                 "tauceti:TauCetiRoadmap/GlobalQuadraticForms", "tauceti:TauCetiRoadmap/QuadraticFormInvariants",
                 "tauceti:TauCetiRoadmap/StableReduction", "tauceti:TauCetiRoadmap/PolynomialGaloisGroups",
                 "tauceti:TauCetiRoadmap/ReductiveGroups", "tauceti:TauCetiRoadmap/BelyiMaps", "tauceti:TauCetiRoadmap/FuchsianOrbifolds"]

CLASSIFY_CLUSTERS = ["foundations", "commutative-algebra", "homological-algebra-and-categories", "group-theory",
    "lie-theory-and-representations", "algebraic-number-theory", "analytic-number-theory", "elementary-and-computational-number-theory",
    "algebraic-geometry", "arithmetic-geometry", "p-adic-geometry", "etale-and-motivic-cohomology", "k-theory-and-motives",
    "modular-and-automorphic-forms", "galois-representations-and-langlands", "geometric-langlands", "iwasawa-theory-and-special-values",
    "function-fields", "analysis", "pde", "probability", "topology", "differential-geometry", "combinatorics"]

CLASSIFY_TEMPLATE = """You are a mathematician classifying roadmaps for the Tau Ceti Atlas. You run unattended in a tmux session as job {JOB}. Work in {REPO}. Your scratch directory is {WORKERS}/{JOB} (create it). Save as you go.

JOB: classify each roadmap listed in research/blueprint/classify/{JOB}.json (roadmap ids and titles). Write the result to {OUTPUT}.
If {OUTPUT} already exists (a checkpoint from an earlier worker), keep its entries after checking them, finalise any entry marked "assessmentStatus": "partial" (look up the references it lists), and classify only the roadmaps it lacks.

For each roadmap:
1. Read its document and summary (data/atlas.json roadmaps[]: readme, summary; new roadmaps in research/blueprint/roadmaps/). Identify its principal references: the works it follows or cites for its main results, at most eight.
2. Look up each reference in zbMATH Open, which has a public JSON API. For example:
   curl -s 'https://api.zbmath.org/v1/document/_search?search_string=ti%3A%22<url-encoded title words>%22&page=0&results_per_page=3'
   Add au:<surname> when a title is ambiguous. Record the zbMATH document id and the MSC 2020 codes of the matching work, and check that title and authors match. For a work known only on arXiv, use http://export.arxiv.org/api/query?id_list=<id> to get its categories. Make at most one request per second.
3. Assign the following:
   - a primary MSC 2020 code at the three-character level (for example 11G, 14F, 11F) and up to three secondary codes, weighted by how central each reference is to the roadmap;
   - a cluster from this list: {CLUSTERS}. If none fits, propose a new cluster name and justify it.
4. Estimate the distance from Mathlib as an integer from 0 to 10:
   - 0: the roadmap's objects and main theorems are essentially in Mathlib or Tau Ceti already;
   - 3: about one layer of standard graduate theory is missing;
   - 6: several layers of research-level theory must be built first;
   - 10: the targets are at the current research frontier and rest on many theories not yet built.
   Check the library's coverage of the roadmap's basic objects by searching {BASELINE}/declarations.tsv (grep -i -P) and opening files where needed. Cite two to five relevant declarations you found, or state what is absent. Justify the score in one or two sentences.

OUTPUT: a JSON array with one object per roadmap, each roadmap exactly once:
{{"roadmapId", "primaryMsc", "secondaryMsc": [...], "cluster", "distance", "distanceRationale", "mathlibEvidence": [...], "references": [{{"title", "authors", "zbmath", "msc": [...]}}]}}
Validate the file with python3 -c 'import json;json.load(open("{OUTPUT}"))', and rewrite the whole file after every five roadmaps.
RULES: edit only {OUTPUT} and your scratch files. Do not run git. No private paths in the repository.
Finish with the distribution of clusters and distances, and any roadmap that fits no cluster."""

PLAN_HABIRO_TEMPLATE = HEADER + """
JOB: plan, very carefully, the roadmaps for the Habiro ring of a number field and for Habiro cohomology. Planning comes before any blueprint work; your plan decides the structure that later jobs will fill in.

PRIMARY SOURCES (read them in full; do not copy them into the repository):
- S. Garoufalidis, P. Scholze, C. Wheeler, D. Zagier, "The Habiro ring of a number field", arXiv:2412.04241. Fetch the PDF and, if available, the TeX source (https://arxiv.org/e-print/2412.04241) into your scratch directory, and record provenance.
- W. J. G. Ong, notes of P. Scholze's Bonn course "V5A2 – The Habiro ring of a number field" (winter 2024/25): {DOWNLOADS}/Habiro_Rings_Notes-3.pdf. This is the latest and longest version; Habiro_Rings_Notes.pdf, -1 and -2 in the same folder are earlier, shorter versions. Check whether they contain anything the latest version dropped.
- W. J. G. Ong, notes of P. Scholze's Bonn course "V5A4 – Habiro cohomology" (summer 2025): {DOWNLOADS}/Habiro_Cohomology_Notes.pdf.
- Extract the text with pdftotext -layout into your scratch directory and read page images (pdftoppm) wherever formulas are garbled. Follow the notes' own references (for example Wagner's work on q-Witt vectors and q-Hodge complexes, Scholze's "Canonical q-deformations in arithmetic geometry", Bhatt–Scholze prisms, Bhatt–Lurie and Drinfeld on prismatization and ring stacks, Clausen–Scholze on condensed and analytic mathematics) and fetch the public versions you need.

THE ATLAS AS IT IS
- The existing Habiro-related roadmaps in data/atlas.json: HabiroNumberFields, HabiroRings, HabiroCyclotomicCompletions, HabiroNahmSeries, HabiroCohomologyFoundations and ArithmeticQuantumTopology. Read their documents and stages in full.
- Their neighbours: K3BlochGroups, Polylogarithms, BorelRegulators, PrismaticCohomology, DerivedDeRhamCohomology, AInfCohomology, CrystallineCohomology, RefinedTraceMethods and tauceti:TauCetiRoadmap/ProfiniteCohomology. Search for any others that mention q-series, q-de Rham, Witt vectors, condensed or analytic rings, or stacks.
- The pinned library: {BASELINE}/declarations.tsv, TauCeti/ and mathlib/Mathlib/. Inventory precisely what exists for each of the following, citing declarations you have read:
  - cyclotomic polynomials, completions and adic completions, power series, Witt vectors and δ-rings, and q-analogues;
  - Mathlib's Condensed library: condensed sets and modules, light condensed objects, and anything solid or analytic;
  - stacks, and any prismatic material in Tau Ceti.

DELIVERABLES
1. research/blueprint/plans/HABIRO.md, a plan in precise mathematical language, covering:
   (a) the target theorems of the paper and of each set of notes, with their exact statements and locators;
   (b) the full dependency chain from the pinned library to those targets, layer by layer, naming every object that must be defined (for example ring stacks, the relevant analytic or condensed structures, q-de Rham and q-Hodge complexes, q-Witt vectors, Habiro-complete modules, and the Bloch-group and K_3 inputs) and saying where each is proved in the sources;
   (c) the proposed set of roadmaps, each with a boundary stated in a few sentences, its layers, and its suppliers and consumers. This includes any foundations roadmaps that are needed and missing, for example ring stacks or transmutation, and condensed or analytic foundations beyond Mathlib;
   (d) for each of the six existing roadmaps, whether to keep, rescope, merge or retire it, and exactly which of its stages move where;
   (e) the order in which the roadmaps should be blueprinted;
   (f) open mathematical questions and places where the notes and the paper differ;
   (g) decisions the user should confirm.
2. For each new roadmap in the plan, a roadmap definition research/blueprint/roadmaps/<Id>.json (schema in PROTOCOL.md section 7). Each needs precise stage descriptions in the upstream style, and the stage requires/prerequisites must match the plan. Do not write blueprint packets.
3. A handoff note at research/blueprint/handoff/{JOB}.md.

RULES: edit only the plan, the new roadmap definitions, the handoff note and scratch files. Do not run git. No Lean code. No private absolute paths, PDFs or extracted text in the repository: refer to the notes by title, author, course and date. Take your time. Correctness and completeness of the structure matter more than speed.
Finish with a summary under 300 words: the proposed roadmaps and their order, what happens to the existing six, and the decisions for the user."""

PLAN_REVIEW_TEMPLATE = """You are an independent reviewer for the Tau Ceti Atlas. You did not write the plan you review. You run unattended as job {JOB}. Work in {REPO}. Your scratch directory is {WORKERS}/{JOB}.

READ FIRST: research/blueprint/PROTOCOL.md and research/blueprint/UPSTREAM_GUIDE.md.
REVIEW: research/blueprint/plans/HABIRO.md and every roadmap definition in research/blueprint/roadmaps/ that the plan proposes.
The sources are the same as the planner's:
- arXiv:2412.04241, fetched into your scratch directory;
- {DOWNLOADS}/Habiro_Rings_Notes-3.pdf;
- {DOWNLOADS}/Habiro_Cohomology_Notes.pdf;
- the atlas;
- the baseline {BASELINE}.
Check the following, and correct the plan and the definitions in place where the fix is clear:
- target statements and locators;
- that the dependency chain has no gaps, in particular that ring stacks, condensed or analytic inputs, q-de Rham and q-Hodge complexes, q-Witt vectors, and the Bloch-group and K_3 inputs each have a home;
- that roadmap boundaries neither overlap nor leave holes;
- that the treatment of the six existing roadmaps is sound;
- that the baseline inventory is accurate, by reading the cited Lean files;
- that the ordering is sound.
Record every change in research/blueprint/reviews/{JOB}.md, with a verdict of accepted or needs_changes and the questions for the user.
RULES: edit only the plan, the proposed roadmap definitions, your report and scratch files. Do not run git. No private paths in the repository.
Finish with a summary under 250 words."""

LV_BRIEF = """Topic: the Mordell conjecture (Faltings's theorem) as proved by Brian Lawrence and Akshay Venkatesh, "Diophantine problems and p-adic period mappings", Invent. Math. 221 (2020), 893–999, arXiv:1807.02721 (fetch the arXiv version; record provenance). The final target: a smooth projective geometrically connected curve of genus at least 2 over a number field has finitely many rational points. Follow the paper's own route and its intermediate results: the S-unit equation as the first worked instance of the method; the Kodaira–Parshin family attached to the curve; Gauss–Manin connections, the complex and p-adic period maps on residue disks and their analytic properties; crystalline comparison and the Frobenius-semilinear structure on de Rham cohomology of the fibres; semisimplicity of the relevant Galois representations and Faltings's finiteness lemma for representations of bounded dimension, restricted ramification and fixed weights; the monodromy / Zariski-density input for the period map and the dimension estimate on Frobenius-centralizer orbits that makes the counting work; and the final assembly. Identify every place where the paper cites an outside result, and decide for each whether an existing roadmap supplies it (candidates include PadicHodgeTheory, CrystallineCohomology, CohomologyComparisons, DeligneWeightsAndPurity, FaltingsFinitenessAndIsogenyTheorems, HeightsRationalPointsAndObstructions, tauceti:TauCetiRoadmap/HodgeStructures, tauceti:TauCetiRoadmap/Chebotarev, tauceti:TauCetiRoadmap/AlgebraicCurves, AlgebraicModuliForArithmeticGeometry, LefschetzPencilsAndVanishingCycles, PadicDifferentialEquationsAndRigidCohomology) or must be a layer of this roadmap. Lawrence–Venkatesh is an alternative to Faltings's height-based proof; do not route through FaltingsFinitenessAndIsogenyTheorems' Mordell corollary."""

ZAGIER_BRIEF = """Topic: Zagier's conjecture on special values of Dedekind zeta functions via polylogarithms, with the proved cases carried out in full. Layers should include:
(1) the Bloch–Wigner dilogarithm and the dilogarithm's functional equations;
(2) the pre-Bloch group P(F) and Bloch group B(F) of a field, the map to the exterior square of F^× and their functoriality;
(3) Suslin's theorem relating K_3^ind(F) to B(F) and the Dupont–Sah / Bloch results used;
(4) Borel's theorem on K_{{2n-1}} of rings of integers and the Borel regulator;
(5) Zagier's theorem for n = 2: ζ_F(2) as a rational multiple of π^{{2(r_1+r_2)}}|d_F|^{{1/2}} times a determinant of Bloch–Wigner values, via hyperbolic 3-manifolds or via Borel and Suslin, as the sources do it;
(6) Zagier's higher Bloch groups B_n(F) and the single-valued polylogarithms, and Goncharov's polylogarithmic complexes Γ(F, n);
(7) Goncharov's proof for n = 3;
(8) Goncharov–Rudenko's proof for n = 4;
(9) the precise general conjecture, its known cases and what remains open (recorded as a frontier layer, not as a theorem).
Sources:
- Zagier, "Polylogarithms, Dedekind zeta functions and the algebraic K-theory of fields" (Arithmetic Algebraic Geometry, 1991);
- Zagier, "Hyperbolic manifolds and special values of Dedekind zeta-functions", Invent. Math. 83 (1986);
- Zagier, "The dilogarithm function" (Frontiers in Number Theory, Physics and Geometry II, 2007);
- Suslin, "K_3 of a field, and the Bloch group", Proc. Steklov Inst. 183 (1991);
- Bloch, "Higher regulators, algebraic K-theory, and zeta functions of elliptic curves" (CRM Monograph Series 11, 2000);
- Dupont–Sah, "Scissors congruences II", J. Pure Appl. Algebra 25 (1982);
- Goncharov, "Geometry of configurations, polylogarithms, and motivic cohomology", Adv. Math. 114 (1995);
- Goncharov, "Polylogarithms and motivic Galois groups" (1994);
- Goncharov–Rudenko, "Motivic correlators, cluster varieties and Zagier's conjecture on ζ_F(4)", arXiv:1803.08585;
- Borel, "Cohomologie de SL_n et valeurs de fonctions zêta aux points entiers" (1977).
Fetch public versions where possible.
Ownership, so that concurrent jobs do not duplicate work:
- the pre-Bloch group, the Bloch group, the Bloch–Wigner dilogarithm, the five-term relation and Suslin's exact sequence belong to roadmap K3BlochGroups (job BP-K3BlochGroups);
- the classical and single-valued polylogarithms, higher Bloch groups and polylogarithmic complexes belong to roadmap Polylogarithms (job BP-Polylogarithms);
- the Borel regulator and Borel's rank theorem belong to roadmap BorelRegulators (jobs BP-BorelRegulators--*).
Use the reserved ids in research/blueprint/reserved-ids.json as prerequisites for those objects. Your roadmap owns the proofs of the Zagier statements and everything specific to them (for example, the determinant formula, the comparison of the Borel regulator with polylogarithm values, and the Grassmannian polylogarithm constructions if the sources need them)."""

RESERVED = {
    "K3BlochGroups:V.3/pre-bloch-group": ("BP-K3BlochGroups", "The pre-Bloch group P(F) of a field F: the free abelian group on F \\ {0,1} modulo the five-term relations, with the convention for the degenerate symbols recorded."),
    "K3BlochGroups:V.3/bloch-group": ("BP-K3BlochGroups", "The Bloch group B(F): the kernel of P(F) → ∧²(F^×) (with the source's convention on 2-torsion or tensoring), [x] ↦ x ∧ (1 − x)."),
    "K3BlochGroups:V.3/five-term-relation": ("BP-K3BlochGroups", "The five-term relation in P(F), in the source's normalisation."),
    "K3BlochGroups:V.3/bloch-wigner-dilogarithm": ("BP-K3BlochGroups", "The Bloch–Wigner function D: P¹(C) → R, D(z) = Im Li₂(z) + arg(1 − z) log|z|, real-analytic off {0, 1, ∞} and continuous on P¹(C)."),
    "K3BlochGroups:V.3/bloch-wigner-five-term": ("BP-K3BlochGroups", "D satisfies the five-term relation, hence induces a homomorphism P(C) → R."),
    "K3BlochGroups:V.4/suslin-exact-sequence": ("BP-K3BlochGroups", "Suslin's exact sequence 0 → Tor(F^×, F^×)~ → K_3^ind(F) → B(F) → 0 for infinite fields, in the source's precise form."),
    "Polylogarithms:P.1/classical-polylogarithm": ("BP-Polylogarithms", "The classical polylogarithm Li_n(z) = Σ z^k / k^n for |z| < 1 and its analytic continuation."),
    "Polylogarithms:P.1/single-valued-polylogarithm": ("BP-Polylogarithms", "Zagier's single-valued polylogarithm P_n (or L_n), real-analytic on P¹(C) minus {0, 1, ∞}."),
    "Polylogarithms:P.4/higher-bloch-group": ("BP-Polylogarithms", "Zagier's higher Bloch groups B_n(F) defined via functional equations of polylogarithms, with the convention recorded."),
    "Polylogarithms:P.3/polylogarithmic-complex": ("BP-Polylogarithms", "Goncharov's polylogarithmic complexes Γ(F, n) for n ≤ 3 and the groups B_n(F) they use."),
    "BorelRegulators:R.4/borel-regulator": ("BP-BorelRegulators--R.3", "The Borel regulator K_{2n−1}(O_F) → R^{d_n}, with its normalisation."),
    "BorelRegulators:R.3/borel-rank-theorem": ("BP-BorelRegulators--R.1", "Borel's theorem: the rank of K_{2n−1}(O_F) is r₁ + r₂ (n odd, n > 1) or r₂ (n even)."),
}


def file_id(rid):
    return rid.replace(":", "_").replace("/", "_")


def tarjan_levels(nodes, edges):
    """Topological levels of the condensation (prerequisite -> consumer)."""
    graph = defaultdict(list)
    for a, b in edges:
        graph[a].append(b)
    index, low, on, stack, comp = {}, {}, set(), [], {}
    counter = [0]
    def strong(v):
        work = [(v, iter(graph[v]))]
        index[v] = low[v] = counter[0]; counter[0] += 1; stack.append(v); on.add(v)
        while work:
            node, children = work[-1]
            advanced = False
            for w in children:
                if w not in index:
                    index[w] = low[w] = counter[0]; counter[0] += 1; stack.append(w); on.add(w)
                    work.append((w, iter(graph[w]))); advanced = True; break
                elif w in on:
                    low[node] = min(low[node], index[w])
            if advanced:
                continue
            work.pop()
            if work:
                low[work[-1][0]] = min(low[work[-1][0]], low[node])
            if low[node] == index[node]:
                while True:
                    w = stack.pop(); on.discard(w); comp[w] = node
                    if w == node:
                        break
    for v in nodes:
        if v not in index:
            strong(v)
    cedges = defaultdict(set)
    indeg = defaultdict(int)
    for a, b in edges:
        ca, cb = comp[a], comp[b]
        if ca != cb and cb not in cedges[ca]:
            cedges[ca].add(cb); indeg[cb] += 1
    level = {}
    frontier = [c for c in set(comp.values()) if indeg[c] == 0]
    for c in frontier:
        level[c] = 0
    while frontier:
        nxt = []
        for c in frontier:
            for d in cedges[c]:
                level[d] = max(level.get(d, 0), level[c] + 1)
                indeg[d] -= 1
                if indeg[d] == 0:
                    nxt.append(d)
        frontier = nxt
    return {v: level[comp[v]] for v in nodes}, comp


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--library", required=True)
    ap.add_argument("--baseline", required=True)
    ap.add_argument("--workers", required=True)
    ap.add_argument("--max-stages", type=int, default=4)
    ap.add_argument("--dry-run", action="store_true")
    args = ap.parse_args()
    atlas = json.loads((REPO / "data" / "atlas.json").read_text())
    presentation = json.loads((REPO / "data" / "stage-presentation.json").read_text())
    hidden = {k for k, v in presentation.items() if isinstance(v, dict) and v.get("hidden")}
    roadmaps = {r["id"]: r for r in atlas["roadmaps"]}
    stages_by_owner = defaultdict(list)
    for s in atlas["stages"]:
        if s["id"] not in hidden:
            stages_by_owner[s["owner"]].append(s)
    edges = [(e["source"], e["target"]) for e in atlas["edges"] if e["source"] in roadmaps and e["target"] in roadmaps]
    levels, comp = tarjan_levels(list(roadmaps), edges)
    suppliers = defaultdict(set)
    for a, b in edges:
        if comp[a] != comp[b]:
            suppliers[b].add(a)
    fill = dict(REPO=str(REPO), BASELINE=args.baseline, LIBRARY=args.library, WORKERS=args.workers)
    jobs = []
    prompts = {}

    def add(job, prompt_text=None):
        if prompt_text is not None:
            path = f"research/blueprint/prompts/{job['id']}.md"
            prompts[path] = prompt_text
            job["prompt"] = path
        job.setdefault("state", "pending")
        jobs.append(job)

    def parts_for(rid):
        stages = stages_by_owner.get(rid, [])
        top = [s for s in stages if not s.get("parentStageId") or s["parentStageId"] not in {x["id"] for x in stages}]
        children = defaultdict(list)
        ids = {s["id"] for s in stages}
        for s in stages:
            p = s.get("parentStageId")
            while p and p in ids and p not in {t["id"] for t in top}:
                p = next((x.get("parentStageId") for x in stages if x["id"] == p), None)
            if s not in top and p:
                children[p].append(s)
        groups, current, size = [], [], 0
        for t in top:
            block = [t] + children.get(t["id"], [])
            if current and size + len(block) > args.max_stages:
                groups.append(current); current, size = [], 0
            current += block; size += len(block)
        if current:
            groups.append(current)
        return groups

    def stage_lines(group):
        return "\n".join(f"- {s['id']} — {s['title']}" for s in group)

    bp_jobs_of = defaultdict(list)
    parts_of = defaultdict(list)

    def add_blueprint(rid, priority, order, extra="", after=()):
        groups = parts_for(rid)
        title = roadmaps[rid]["title"]
        for i, group in enumerate(groups):
            multi = len(groups) > 1
            key = (group[0].get("key") or group[0]["id"].split("#")[-1])[:40].replace("/", "-").replace(":", "-")
            part = key if multi else None
            job_id = f"BP-{file_id(rid)}" + (f"--{key}" if multi else "")
            output = f"research/blueprint/packets/{file_id(rid)}" + (f"--{key}" if multi else "") + ".json"
            readme = f"research/blueprint/readmes/{file_id(rid)}" + (f"--{key}" if multi else "") + ".md"
            suggested = f"research/blueprint/suggested/{file_id(rid)}" + (f"--{key}" if multi else "") + ".lean"
            text = BP_TEMPLATE.format(**fill, JOB=job_id, ROADMAP=rid, TITLE=title, README=readme, SUGGESTED=suggested,
                                      PARTNOTE=f", part {i + 1} of {len(groups)}" if multi else "",
                                      STAGES=stage_lines(group), OUTPUT=output, PART=json.dumps(part),
                                      EXTRA=extra, FILE=file_id(rid), EDITABLE=output)
            add({"id": job_id, "kind": "blueprint", "priority": priority, "order": order * 100 + i,
                 "roadmapIds": [rid], "scope": [s["id"] for s in group], "outputs": [output, readme, suggested],
                 "after": list(after)}, text)
            bp_jobs_of[rid].append(job_id)
            parts_of[rid].append((job_id, output, readme, suggested))
            review_id = "REV-" + job_id[3:]
            rtext = REVIEW_TEMPLATE.format(**fill, JOB=review_id, TARGETS=f"the blueprint packet {output} and its suggested Lean file {suggested} (roadmap {rid}, stages: {', '.join(s['id'] for s in group)})")
            add({"id": review_id, "kind": "review", "priority": 2, "order": order * 100 + i,
                 "roadmapIds": [rid], "outputs": [f"research/blueprint/reviews/{review_id}.md"],
                 "after": [job_id], "avoidAccountOf": job_id}, rtext)

    # Priority 0: status mapping, already specified.
    for n in (1, 2, 3):
        add({"id": f"STATUS-0{n}", "kind": "status", "priority": 0, "order": n,
             "prompt": f"research/expansion/prompts/STATUS-0{n}.md",
             "outputs": [f"research/expansion/status/STATUS-0{n}.result.json"], "after": []})
    # Priority 0: the Habiro plan, which decides the structure of the Habiro roadmaps.
    downloads = str(Path(args.library).parents[2]) if len(Path(args.library).parents) > 2 else args.library
    text = PLAN_HABIRO_TEMPLATE.format(**fill, JOB="PLAN-HABIRO", DOWNLOADS=downloads)
    add({"id": "PLAN-HABIRO", "kind": "plan", "priority": 0, "order": 0, "roadmapIds": [],
         "outputs": ["research/blueprint/plans/HABIRO.md"], "after": [], "timeout": 10 * 3600}, text)
    text = PLAN_REVIEW_TEMPLATE.format(**fill, JOB="REV-PLAN-HABIRO", DOWNLOADS=downloads)
    add({"id": "REV-PLAN-HABIRO", "kind": "review", "priority": 0, "order": 1, "roadmapIds": [],
         "outputs": ["research/blueprint/reviews/REV-PLAN-HABIRO.md"], "after": ["PLAN-HABIRO"], "avoidAccountOf": "PLAN-HABIRO",
         "timeout": 8 * 3600}, text)
    # Priority 0: subject classification and distance from Mathlib, for the layout.
    classify_ids = sorted(roadmaps)
    size = 36
    (BP / "classify").mkdir(exist_ok=True)
    for n in range(0, len(classify_ids), size):
        job_id = f"CLASSIFY-{n // size + 1:02d}"
        chunk = [{"roadmapId": rid, "title": roadmaps[rid]["title"]} for rid in classify_ids[n:n + size]]
        if not args.dry_run:
            (BP / "classify" / f"{job_id}.json").write_text(json.dumps(chunk, indent=1, ensure_ascii=False) + "\n")
        output = f"research/blueprint/classify/{job_id}.result.json"
        text = CLASSIFY_TEMPLATE.format(**fill, JOB=job_id, OUTPUT=output, CLUSTERS=", ".join(CLASSIFY_CLUSTERS))
        add({"id": job_id, "kind": "classify", "priority": 0, "order": 10 + n // size, "roadmapIds": [c["roadmapId"] for c in chunk],
             "outputs": [output], "after": []}, text)
    # Priority 1: papers (PROTOCOL.md section 16). Each paper in papers.json gets an
    # extraction and a review; the accepted routes of reviewed extractions become
    # blueprint sources and design jobs.
    registry = json.loads((BP / "papers" / "papers.json").read_text()) if (BP / "papers" / "papers.json").exists() else {}
    guides = "\n".join(f"- {g['citation']}: " + "; ".join(r["summary"] for r in g["routes"]) + "." for g in registry.get("guides", []))
    paper_designs = []
    for number, paper in enumerate(registry.get("papers", []), 1):
        pid, link = paper["id"], paper.get("link", "")
        result, report = f"research/blueprint/papers/{pid}.result.json", f"research/blueprint/papers/{pid}.md"
        fields = dict(PAPER=pid, CITATION=paper["citation"], LINK=link, NOTE=paper.get("note") or "none", GUIDES=guides, FILE=pid)
        add({"id": pid, "kind": "paper", "priority": 1, "order": 100 + number, "name": paper.get("short") or paper["citation"],
             "roadmapIds": [], "outputs": [result, report], "after": []}, PAPER_TEMPLATE.format(**fill, JOB=pid, **fields))
        add({"id": "REV-" + pid, "kind": "review", "priority": 1, "order": 100 + number, "name": paper.get("short") or paper["citation"],
             "roadmapIds": [], "outputs": [f"research/blueprint/papers/{pid}.review.json", f"research/blueprint/reviews/REV-{pid}.md"],
             "after": [pid], "avoidAccountOf": pid}, PAPER_REVIEW_TEMPLATE.format(**fill, JOB="REV-" + pid, **fields))
        for route in accepted_routes(pid):
            origin = f" (from the extraction of {paper['citation']}, {pid}: research/blueprint/papers/{pid}.result.json, items {', '.join(route['items'])})"
            if route["route"] == "source":
                ADDED_SOURCES.setdefault(route["roadmap"], []).append(
                    f"{paper['citation']} ({link}), for {', '.join(route['stages'])}: {route['reason']}{origin}")
            else:
                extends = (f" The roadmap is \"{route['title']}\": it extends {route['parent']} and starts where that roadmap stops (PROTOCOL.md section 15)."
                           if route["route"] == "part-ii" else f" The roadmap is \"{route['title']}\".")
                paper_designs.append(("DESIGN-" + route["roadmap"], route["roadmap"], route["area"], route["brief"] + extends + origin, route["title"]))
    # Priority 1: the new roadmaps and the Zagier suppliers.
    designs = [("DESIGN-LV", "MordellLawrenceVenkatesh", "diophantine", LV_BRIEF, None),
               ("DESIGN-ZAGIER", "ZagierConjecturePolylogarithms", "motivic", ZAGIER_BRIEF, None),
               ("DESIGN-BCGP18", "AbelianSurfacesPotentialModularity", "modular", BCGP18_BRIEF, None),
               ("DESIGN-BCGP25", "AbelianSurfacesModularity", "modular", BCGP25_BRIEF, None),
               ("DESIGN-PAN", "LocallyAnalyticCompletedCohomology", "langlands", PAN_BRIEF, None),
               ("DESIGN-SKINNER", "RankOneConverse", "iwasawa", SKINNER_BRIEF, None),
               ("DESIGN-BETTS-STIX", "GaloisSectionsPadicPeriodMaps", "arithmeticgeometry", BETTS_STIX_BRIEF, None)]
    designs += [d for d in paper_designs if d[0] not in {x[0] for x in designs}]
    for position, (job_id, rid, group, brief, name) in enumerate(designs, 1):
        output = f"research/blueprint/packets/{rid}.json"
        suggested = f"research/blueprint/suggested/{rid}.lean"
        text = DESIGN_TEMPLATE.format(**fill, JOB=job_id, ROADMAP=rid, GROUP=group, BRIEF=brief, OUTPUT=output,
                                      README=f"research/blueprint/readmes/{rid}.md", SUGGESTED=suggested,
                                      FILE=rid, EDITABLE=f"research/blueprint/roadmaps/{rid}.json and {output}")
        add({"id": job_id, "kind": "design", "priority": 1, "order": position, "roadmapIds": [rid], **({"name": name} if name else {}),
             "outputs": [f"research/blueprint/roadmaps/{rid}.json", output, f"research/blueprint/readmes/{rid}.md", suggested],
             "after": ["DESIGN-BCGP18"] if job_id == "DESIGN-BCGP25" else [], "timeout": 8 * 3600}, text)
        review_id = "REV-" + job_id
        rtext = REVIEW_TEMPLATE.format(**fill, JOB=review_id, TARGETS=f"the new roadmap definition research/blueprint/roadmaps/{rid}.json, its blueprint packet {output} and its suggested Lean file {suggested}")
        add({"id": review_id, "kind": "review", "priority": 2, "order": 1, "roadmapIds": [rid], **({"name": name} if name else {}),
             "outputs": [f"research/blueprint/reviews/{review_id}.md"], "after": [job_id], "avoidAccountOf": job_id,
             "timeout": 8 * 3600}, rtext)
    upstream = [rid for rid in roadmaps if rid.startswith("tauceti:")]
    upstream.sort(key=lambda r: (LINK_PRIORITY.index(r) if r in LINK_PRIORITY else 100, r))
    for position, rid in enumerate(upstream):
        job_id = f"LINK-{file_id(rid)}"
        output = f"research/blueprint/links/{file_id(rid)}.json"
        text = LINK_TEMPLATE.format(**fill, JOB=job_id, ROADMAP=rid, TITLE=roadmaps[rid]["title"], OUTPUT=output)
        add({"id": job_id, "kind": "link", "priority": 1, "order": 10 + position, "roadmapIds": [rid],
             "outputs": [output], "after": []}, text)
        review_id = f"REV-LINK-{file_id(rid)}"
        rtext = LINK_REVIEW_TEMPLATE.format(**fill, JOB=review_id, ROADMAP=rid, TARGET=output)
        add({"id": review_id, "kind": "review", "priority": 2, "order": 10 + position, "roadmapIds": [rid],
             "outputs": [f"research/blueprint/reviews/{review_id}.md"], "after": [job_id], "avoidAccountOf": job_id}, rtext)
    owned = defaultdict(list)
    for rid_node, (job, statement) in RESERVED.items():
        owned[rid_node.split(":")[0]].append((rid_node, statement))
    for order, rid in enumerate(("K3BlochGroups", "Polylogarithms", "BorelRegulators"), 3):
        extra = "\nThis roadmap supplies the Zagier-conjecture programme. Your packet MUST contain nodes with exactly these ids (they are reserved for you; put each under the stated stage and make it complete, with a full API outline):\n" + \
                "\n".join(f"- {nid}: {st}" for nid, st in owned[rid]) + \
                "\nIf one of these ids falls in a stage outside your part's scope, leave it to the job for that part.\n"
        add_blueprint(rid, 1, order, extra)
    # Priority 2: reviews of the legacy research packets still being written.
    add({"id": "REVIEW-EXT-12", "kind": "review", "priority": 2, "order": 0,
         "prompt": "research/expansion/prompts/REVIEW-EXT-12.md",
         "outputs": ["research/expansion/reviews/REVIEW-EXT-12-review.md"], "after": [],
         "waitForLogs": ["{WORKERS}/EXT-12/run.log"]})
    add({"id": "REVIEW-EXT-13-EXT-07B", "kind": "review", "priority": 2, "order": 0,
         "prompt": "research/expansion/prompts/REVIEW-EXT-13-EXT-07B.md",
         "outputs": ["research/expansion/reviews/REVIEW-EXT-13-EXT-07B-review.md"], "after": [],
         "waitForLogs": ["{WORKERS}/EXT-07-continued/run.log"]})
    # Priority 0: restructure the families of overlapping roadmaps first, so that
    # nothing is blueprinted twice (PROTOCOL.md section 15).
    family_review = {}
    for number, path in enumerate(sorted((BP / "restructure").glob("RS-[0-9][0-9].json")), 1):
        family = json.loads(path.read_text())
        job_id, members = family["id"], [m["id"] for m in family["members"]]
        output, report = f"research/blueprint/restructure/{job_id}.result.json", f"research/blueprint/restructure/{job_id}.md"
        familyfile = f"research/blueprint/restructure/{path.name}"
        fields = dict(FAMILY=job_id, NAME=family["name"], FAMILYFILE=familyfile, OUTPUT=output, REPORT=report)
        add({"id": job_id, "kind": "restructure", "priority": 0, "order": 20 + number, "name": family["name"],
             "roadmapIds": members, "anchors": [a["id"] for a in family["anchors"]], "outputs": [output, report], "after": []},
            RESTRUCTURE_TEMPLATE.format(**fill, JOB=job_id, **fields))
        review_id = "REV-" + job_id
        add({"id": review_id, "kind": "review", "priority": 0, "order": 20 + number, "name": family["name"], "roadmapIds": members,
             "outputs": [f"research/blueprint/reviews/{review_id}.md"], "after": [job_id], "avoidAccountOf": job_id},
            RESTRUCTURE_REVIEW_TEMPLATE.format(**fill, JOB=review_id, **fields))
        for member in members:
            family_review[member] = review_id
    # Priority 3: every other proposed roadmap, suppliers before consumers. Tau
    # Ceti roadmaps are planned upstream; the atlas builds on them, never
    # re-plans them.
    ordered = sorted((rid for rid in roadmaps if rid not in ("K3BlochGroups", "Polylogarithms", "BorelRegulators")
                      and not rid.startswith("tauceti:") and stages_by_owner.get(rid)), key=lambda r: (levels[r], r))
    for position, rid in enumerate(ordered):
        after = sorted({j for s in suppliers[rid] for j in bp_jobs_of.get(s, [])})
        add_blueprint(rid, 3, 10 + levels[rid] * 1000 + position, extra=added_sources(rid), after=after)
    # Supplier jobs are only known once all blueprints are listed: fix dependencies.
    ids = {j["id"] for j in jobs}
    for job in jobs:
        if job["kind"] == "blueprint":
            rid = job["roadmapIds"][0]
            # A supplier's blueprint is read if it exists; what is missing becomes a
            # `requests` entry. So no blueprint waits for another, or for the link
            # maps; it waits only for its family's restructuring, when it has one.
            job["suppliers"] = sorted({j for s in suppliers[rid] if not s.startswith("tauceti:") for j in bp_jobs_of.get(s, []) if j in ids})
            job["after"] = (["REV-PLAN-HABIRO"] if rid in HABIRO_FAMILY else []) + ([family_review[rid]] if rid in family_review else [])
    # Assembly of multi-part roadmaps, after every part is reviewed.
    for rid, parts in parts_of.items():
        if len(parts) < 2:
            continue
        job_id = f"ASM-{file_id(rid)}"
        readme = f"research/blueprint/readmes/{file_id(rid)}.md"
        suggested = f"research/blueprint/suggested/{file_id(rid)}.lean"
        text = ASSEMBLY_TEMPLATE.format(**fill, JOB=job_id, ROADMAP=rid, TITLE=roadmaps.get(rid, {}).get("title", rid),
                                        PARTS=", ".join(p[1] for p in parts), PARTDOCS=", ".join(p[2] for p in parts),
                                        PARTLEAN=", ".join(p[3] for p in parts), README=readme, SUGGESTED=suggested)
        add({"id": job_id, "kind": "assembly", "priority": 2, "order": 5000, "roadmapIds": [rid], "outputs": [readme, suggested],
             "after": ["REV-" + p[0][3:] for p in parts]}, text)
    # Priority 1: name the planets drawn today (research/expansion/naming/PLANETS.json).
    planets_index = BP.parent / "expansion" / "naming" / "PLANETS.json"
    for number, batch in enumerate(json.loads(planets_index.read_text())["jobs"] if planets_index.exists() else [], 1):
        job_id = batch["id"]
        output = f"research/expansion/naming/{job_id}.result.json"
        add({"id": job_id, "kind": "naming", "priority": 1, "order": 200 + number, "name": batch["name"],
             "roadmapIds": batch["roadmaps"], "outputs": [output], "after": []},
            PLANETS_TEMPLATE.format(**fill, JOB=job_id, INPUT=f"research/expansion/naming/{job_id}.json", OUTPUT=output))
    # Priority 4: planet naming (the first batches, superseded by the PLANETS jobs above).
    for n in range(1, 15):
        add({"id": f"NAME-{n:02d}", "kind": "naming", "priority": 4, "order": n,
             "prompt": f"research/expansion/prompts/NAME-{n:02d}.md",
             "outputs": [f"research/expansion/naming/NAME-{n:02d}.result.json"], "after": []})

    queue_path = BP / "queue.json"
    import fcntl
    lock = open(BP / ".queue.lock", "a+")
    fcntl.flock(lock, fcntl.LOCK_EX)
    old = json.loads(queue_path.read_text())["jobs"] if queue_path.exists() else []
    previous = {j["id"]: j for j in old}
    merged = []
    for job in jobs:
        if job["id"] in previous:
            kept = previous[job["id"]]
            for key in ("state", "account", "lane", "attempts", "startedAt", "finishedAt", "seconds", "result", "note",
                        "promptPreface", "integrated"):
                if key in kept:
                    job[key] = kept[key]
            # A preface added by the orchestrator (for example a continuation note) survives regeneration.
            if kept.get("promptPreface") and job.get("prompt") in prompts:
                prompts[job["prompt"]] = kept["promptPreface"] + prompts[job["prompt"]]
        merged.append(job)
    extra_old = [j for j in old if j["id"] not in {x["id"] for x in merged}]
    merged += extra_old
    stats = defaultdict(int)
    for j in merged:
        stats[j["kind"]] += 1
    level_counts = defaultdict(int)
    for j in merged:
        if j["kind"] == "blueprint" and j["priority"] == 3:
            level_counts[(j["order"] - 10) // 100000 if False else (j["order"] // 100 - 10) // 1000] += 1
    print("jobs by kind", dict(stats))
    print("blueprint jobs by supplier level", dict(sorted(level_counts.items())))
    print("blueprint jobs with no pending supplier", sum(1 for j in merged if j["kind"] == "blueprint" and not j["after"]))
    if args.dry_run:
        return
    for path, text in prompts.items():
        (REPO / path).write_text(text, encoding="utf-8")
    reserved = {k: {"job": v[0], "statement": v[1]} for k, v in RESERVED.items()}
    (BP / "reserved-ids.json").write_text(json.dumps(reserved, indent=1, ensure_ascii=False) + "\n")
    tmp = queue_path.with_suffix(".json.tmp")
    tmp.write_text(json.dumps({"purpose": "Blueprint swarm queue; see research/blueprint/PROTOCOL.md. Lanes (research/blueprint/lane.py) claim jobs under a file lock.",
                                      "jobs": merged}, indent=1, ensure_ascii=False) + "\n")
    import os
    os.replace(tmp, queue_path)
    fcntl.flock(lock, fcntl.LOCK_UN)
    print("queue written:", len(merged), "jobs;", len(prompts), "prompts")


if __name__ == "__main__":
    main()
