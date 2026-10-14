# Review checkpoint: GeometryOfNumbersAndQuadraticArithmetic, GN.4

Codex, session `codex-8bCNpr`, 2026-10-14. Job
`REV-GeometryOfNumbersAndQuadraticArithmetic--GN.4`, issue #9286.

## Status: blocked by the maintainer's upstream ownership instruction

This is a checkpoint, not a mathematical review verdict. The packet has no new
`review` object, and this report does not accept or reject its mathematics.

The issue was open with `swarm`, `state:available`, `kind:review`, `focus` and
`top` when selected. None of the manager's priority issues appeared in the
complete available swarm list. The bot confirmed this session's claim in
[comment 6161028823](https://github.com/CBirkbeck/tauceti-explorer/issues/9286#issuecomment-6161028823).
The source job was written by Claude session `claude-iKBZMu`, as recorded in
its handoff and the merged atlas PR #9375; this reviewer did not write it.

On rereading the issue after claim confirmation, the reviewer found the
[maintainer's blocking instruction of 2026-10-13](https://github.com/CBirkbeck/tauceti-explorer/issues/9286#issuecomment-6147011221).
It says that the roadmap has already become a TauCetiRoadmap pull request,
that its upstream README is authoritative, and that further atlas blueprint
rounds are unnecessary. The instruction directs changes through the upstream
pull request. The available label and pending local queue entry therefore do
not describe the maintainer's intended state of this review.

## Upstream evidence checked

[TauCetiRoadmap PR #851](https://github.com/TauCetiProject/TauCetiRoadmap/pull/851)
was open and ready for review when inspected on 2026-10-14. Its head was
`f7073b8b6016e119d66cc1effbd79f6d28f4050f`. Its three changed files are
`TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md`,
`Suggested.lean` and `metadata.toml`.

The [README at that head](https://github.com/TauCetiProject/TauCetiRoadmap/blob/f7073b8b6016e119d66cc1effbd79f6d28f4050f/TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md)
was read for the ownership boundary and Layer 4 scope:

- Scope and ownership, lines 21–29, assigns lattice counts, homogeneous
  dynamics, transference, star bodies, Mahler compactness and Siegel mean value
  to this upstream roadmap.
- Layer 4, lines 1565–2344, contains lattice-point counting (§4.1), mixing,
  ergodicity and unipotent flows (§4.2), Oppenheim and Duke (§4.3), packing,
  covering and transference (§4.4), star bodies and Mahler compactness (§4.5),
  Siegel mean value (§4.6) and lattices from codes (§4.7).
- In particular, §4.1 includes the semialgebraic component condition and
  Davenport fibre estimate, and §4.2 includes quantitative nondivergence.

This inspection confirms that the maintainer's upstream-ownership instruction
still applies. It does not certify those targets, their proofs or their
source locators. PROTOCOL.md §15 treats tracked open Tau Ceti roadmap pull
requests as existing work, and WORKERS.md prohibits reviewing Tau Ceti's own
roadmaps here.

## Work preserved and checks

The inherited GN.4 packet contains 65 nodes and remains `complete` with
coverage `planned`. Its mathematical content, reader and suggested Lean file
were left intact. No nodes, API items, tests, baseline declarations, source
issue verdicts or review verdicts were changed. Sources and baseline
statements were not independently verified, and Lean was not run in this
checkpoint.

The submission's Markdown files pass `intake.py check-files`; `git diff
--check` passes. The inherited packet was also checked with
`scripts/check_blueprint.py`: zero errors and zero warnings. That structural
check is not evidence of independent mathematical verification.

## Maintainer action needed

Reconcile #9286's available/pending state with the linked blocking instruction,
and retire or block this atlas review if that instruction remains in force.
Any changes to the authoritative roadmap should follow PR #851's workflow.
A future atlas worker should not resume the mathematical review solely because
this checkpoint makes the issue available again. If the maintainer explicitly
reopens an atlas-only review with a defined scope, start its source, baseline,
closure, API, unit-test and Lean checks from the beginning; no independent
mathematical checks are claimed here.
