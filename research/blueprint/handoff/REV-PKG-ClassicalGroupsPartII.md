# REV-PKG-ClassicalGroupsPartII — completed independent review

Issue: [#7599](https://github.com/CBirkbeck/tauceti-explorer/issues/7599).
Agent: Codex (GPT-6), session `codex-nvl1TU`.
Branch: `codex-nvl1TU-review-classical-groups`.
Date: 2026-10-10.

The bot confirmed this session's claim in
[comment 6098818344](https://github.com/CBirkbeck/tauceti-explorer/issues/7599#issuecomment-6098818344).
None of the manager's priority issues was available. The run took this one
eligible independent package review and will take no second job.
This reviewer did none of PKG-ClassicalGroupsPartII.

## Completed

Accepted the package after correcting its suggested API. The
[review report](../reviews/REV-PKG-ClassicalGroupsPartII.md) records all six
criteria, all 26 target checks, the source/library evidence and the
pre-existing package corrections. The
[machine verdict](../packages/ClassicalGroupsPartII/review.json) names
`independent-review-REV-PKG-ClassicalGroupsPartII`.

- Added six Weyl compatibility statements: monomial transport, reflection
  involution/commutation, permutation relabelling and central-degree invariance.
- Added five field-extension statements: underlying coordinates, native
  base-change coaction, map on pure tensors, canonical Hom comparison and
  reflection of invertibility. The Q-coordinate comparison is now a
  specialization. Added their README API descriptions.
- Verified all 76 planned API entries and 58 named tests, with at least three
  tests for each of the 18 definition/construction targets. Final README:
  105,694 bytes; metadata remains the single line `topic = "math.RT"`.
- Final Lean check: exit 0, 198 `sorry` warnings, no errors and no other
  warnings, in the existing shared build at Tau Ceti f790474 and Mathlib
  082e2d3. All 22 baseline declarations were read; cited Tau Ceti source
  modules were verified against the exact pin. No proof completion is claimed.
- The unchanged input packet checker reports zero errors and warnings.
  Additional finite Laurent checks passed on 2,793 weights in ranks 1–3 and
  exterior coefficient identities in ranks 1–4, as detailed in the report.

## Boundaries to retain

The package correctly replaces the packet's non-invariant individual signed
pair test by the negative sum over all pairs. It also states the explicit
matrix similitude equations on native GL rather than depending on an
unavailable arithmetic-statistics carrier. The report explains these
departures; the accepted packet was not changed by this review. A subsequent
owner/interface reconciliation should use this coordinate formulation and
leave general arithmetic-statistics matrix-group theory with its owner.

The definitive README includes the fppf central-cover quotient and full
representation-descent criterion. Scheme-level Lean signatures remain the
already accepted prototype omission; the file's header says so explicitly.
The owning ReductiveGroups interfaces and all eleven supplier contracts are
specified in the README. Keep them as imports, and keep the Cartan-component
argument in this roadmap rather than assigning an extra theorem to
LieHighestWeight Layer 4.

Current upstream roadmaps were checked at
`3c18d9fbfceed0dc5c1edb1070a3927152d19e28`, and current Tau Ceti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The public Yu, Milne and
Sternberg source versions/locators and receipts are recorded in the report
and input packet. No private source, source passage or local path was added.

## Remaining

Nothing remains for REV-PKG-ClassicalGroupsPartII. The package is ready for
the maintainer's upstream roadmap submission. Implementation of its
mathematical targets is future library work, not a checkpoint of this review.
Only this job's package corrections, review verdict/report and handoff are
submitted; inputs and other jobs' files are unchanged.
