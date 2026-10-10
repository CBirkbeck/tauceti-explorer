# REV-FIX-RT-AREA-iwasawa-2~2 — checkpoint: issue scope must be corrected

Codex, session `codex-obfCnR`, 10 October 2026. Refs #6219.
[Confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6219#issuecomment-6099253387).
Branch `codex-obfCnR-review-iwasawa`, input `8747873f6`.
One job claimed; this session did none of fixer `claude-6ZAIEy`'s work.

## Completed work and exact blocker

Every finding has a verdict in the review report. L3 is accepted for the
bounded source fixes; PMIA needs the precisely identified current-library
migration. The negative verdict is valid completion of that review portion.

The queue additionally requires this fix review's reviewer in two packets
omitted from the live issue's deliverables and “Files under review”:

- `research/blueprint/packets/DirichletPadicLFunctions--L3-2.json`
- `research/blueprint/packets/PadicHodgeRegulators--D.1.json`

WORKERS.md says: “Edit only the files the issue names, plus your own scratch
space.” Prepared review-only patches were offered to this run's user for
explicit scope authorization. No authorization arrived, and no omitted
packet was edited. The actual `issues.deliverables_complete` function returns
**False**, because those packets still name their original independent
reviewers. This is the same dispatch defect reported by earlier workers.
**Correct the issue scope before assigning another unchanged continuation.**

The report, this handoff and the two issue-named packets change. L3 and PMIA
archive the previous review whole and refresh only review metadata, with
accepted and needs_changes verdicts respectively. No mathematical field,
suggested file, omitted packet, issue body, label or queue record was modified. The claim is submitted through
this checkpoint PR; no second job was claimed.

## Evidence and checks

The report preserves the preceding exhaustive audits and source hashes,
then attributes fresh bounded readings of findings /1–/6 to this session.
The ten public PDF hashes all agree with its table. The selected pinned
library statements, reviewed audits and current native Fitting/stable
transpose results were read directly. All four packet checks pass: L3 has
26 inherited short-API warnings; the other three have none.

Fresh sequential whole-file `lean-check` results:

- L3: exit 1, imported `research` module prefix unresolved in the shared build.
- L3-2: exit 0, 111 `sorry` warnings only.
- D.1: exit 0, 307 `sorry` warnings only.
- PMIA: exit 0, 1,075 `sorry` warnings only.

Memory was sufficient. No library build, update, cache fetch or language
server was used. All processes finished. Scratch sources and logs are
disposable; the public links, exact locators and hashes are in the report.

## Resume once scope is authorized

No new exhaustive mathematical audit is necessary just to install these
bounded receipts. For each omitted packet, append its entire then-current
`review` object to `reviewHistory`, preserving all `checked` entries. Install
an accepted top-level review naming
`independent-review-REV-FIX-RT-AREA-iwasawa-2~2`, the installing session/date,
the preceding reviewer and this bounded contract:

- **L3-2, finding /2:** Zhao §1.2 p.461, Theorem 4.1 and (4.1)–(4.6)
  pp.471–473, Appendices A–B pp.473–474. Primitive odd character of
  prime-to-p conductor, chi-omega branch, common log/embeddings, general
  correction term, strict Gamma endpoint and coefficient-limit
  differentiation. Preserve its 79-entry audit, five gaps, eight requests
  and E37. Nonvanishing and simple-zero suppliers remain unresolved.
- **D.1, finding /3:** Ertl–Nizioł v2 §§2.1–2.2 pp.4–8, Colmez–Nizioł v4
  Corollary 3.16 p.37/Theorem 5.4 p.54, Nekovář–Nizioł v5 Remark 2.14
  p.14/Proposition 4.13 pp.53–54. The four D.2 consumers preserve distinct
  divided/undivided complexes, directed omega/tau maps, factorial twist,
  exact divided range through p−2, bounded undivided comparison and rational
  boundary scaling/sign. CS.0–CS.3 remain proposed external producers;
  CP.4 is only a proper rational anchor. Preserve the 72-entry audit, nine
  gaps, twenty requests, seventeen source issues and eight planned stages.

Assert that removing only `review` and `reviewHistory` from original and
patched objects gives equal objects, and that each original review was
archived whole. Run all four packet checkers and the intake file screen.
Import the actual completion predicate from `research/blueprint/issues.py`,
select this queue job and require **True** before reporting completion.
Update the report/handoff to say the dispatch defect is resolved.

Keep PMIA `needs_changes`. Its next coherent revision replaces generic plans
in `higher-fitting-ideal`, `relation-minors-add-generator`,
`higher-fitting-independence`, `higher-fitting-base-change` and
`transpose-stable-equivalence` by the current native imports/adapters. Update
consumers, both StableReduction requests, L4, the reader and suggested file
together. Preserve non-generating-family and opposite/contragredient
adapters, order calculations and nonflat controls. The report gives the
current commit and actual replacement declarations; do not attribute the
new modules to the old programme pin. This belongs to the next fix job,
not this review's missing receipts.
