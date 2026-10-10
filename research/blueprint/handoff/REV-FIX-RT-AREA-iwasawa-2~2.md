# Handoff: REV-FIX-RT-AREA-iwasawa-2~2

Codex (GPT-6), session `codex-zSS4E1`, 10 October 2026; issue
[#6219](https://github.com/CBirkbeck/tauceti-explorer/issues/6219).
One bot-confirmed claim and one checkpoint. **The authorized two-packet
review is finished; the queue cannot finish within the live issue's scope.**

L3 is accepted within the fixes. PMIA needs coordinated migration to current
Tau Ceti's generic Fitting and transpose APIs. The
[review report](../reviews/REV-FIX-RT-AREA-iwasawa-2~2.md) records all six
finding dispositions, fresh public-source locators/hashes, current/pinned
native interfaces, final checker/compiler results and the retained
codex-KQjyXV L6 ledger. Archived codex-oYbkOx's two receipts in
`reviewHistory`. Mathematical nodes, pins, requests, source-issue reviews
and suggested files are unchanged.

## Resolve the dispatch mismatch

The live issue names these five deliverables: this job's report, the L3 and
PMIA packets, and their suggested files. `queue.json` requires nine outputs,
adding:

- `research/blueprint/packets/DirichletPadicLFunctions--L3-2.json`
- `research/blueprint/suggested/DirichletPadicLFunctions--L3-2.lean`
- `research/blueprint/packets/PadicHodgeRegulators--D.1.json`
- `research/blueprint/suggested/PadicHodgeRegulators--D.1.lean`

A fresh read-only `issues.deliverables_complete` call returns True for the
live five-file scope and False for the nine-file queue scope. `needs_changes`
is a completed review verdict; PMIA's verdict does not cause this mismatch.
L3-2 has no top-level review, and D.1 has the newer independent
`independent-review-REV-PadicHodgeRegulators--D.1~2` regulator review, not this
fix-review id.

[WORKERS.md](../WORKERS.md) requires: “Edit only the files the issue names,
plus your own scratch space.” Requested authorization for the four extra
paths; no answer arrived. Those files, the queue, issue body and labels
were not edited. Before redispatching, either reconcile the issue's scope
with the queue or authorize the additional scoped fix reviews. Another
refresh of the same two receipts cannot complete the queue.

## Fresh preparation for an authorized continuation

Read all 29 L3-2 `rjw2-gk-*`/`rjw2-fg-*` contracts and four D.1 integral/open
syntomic contracts without editing them. Fresh Zhao/Gross and EN/CN/NN
source checks are recorded with public URLs and PDF hashes in the report.
EN Proposition 2.1 supplies the small-weight truncation of the divided
complex; Theorem 2.2 then supports its nearby-cycle comparison. The
normalized exponential remains ω_Q⁻¹δ_D; the raw undivided boundary carries
a p^r factor. The Ferrero–Greenberg formula retains its conductor term,
branch and character orientation. Its nonvanishing input and CS.0–CS.3
remain external.

Full standalone `lean-check` passes: L3-2 has 110 proof-placeholder warnings
only; D.1 has 307. Their packet checkers have no errors or warnings. These
are fresh prototype checks, not implementations or new independent full
regulator/source reviews. Preserve D.1's complete existing regulator review
in history if a later authorized pass installs the scoped fix receipt, and
preserve all source-issue verdicts.

## Reproduce the L3 diagnostic

PMIA's complete suggested file elaborates with 1,075 proof-placeholder
warnings only. Standalone L3 stops at repository-local `research` imports.
The fresh full-body diagnostic elaborates with 7,177 proof-placeholder
warnings only under scratch-only supplier corrections. Concatenate bodies
PMIA, L0, L1, L2 and L3 in order; deduplicate library imports at the top and
remove original library/repository import commands. The report gives the
input and assembled hashes. Apply these corrections only in scratch until
the supplier owners are authorized to repair their files:

- L1 `smoothedResidue_carry`, original lines 1753–1758: close the first
  conjunct after `(N : ℤ)` and type the filter binder `fun i : ℕ => ...`.
- L1 line 1883: expand `[IsBoundedSMul Z K]` to
  `[IsBoundedSMul ℤ_[p] ℚ_[p]]`.
- L1 before `unit_denominator_quinary`, original lines 1976–1977: supply a
  local `Fact (Nat.Prime 5)` instance proved by `norm_num`.
- L2 original lines 3854 and 3856: remove the unused `d` notation referring
  to undefined `eisensteinTwistedDenominator` and the unused `S` notation.

Both suppliers are outside the issue. This session reproduced the final
corrected assembly, not each earlier failing intermediate experiment. The
original L3 file still lacks dependency artifacts and the supplier sources
still need repair. All Lean runs were sequential through `lean-check` at
the pinned libraries after memory checks. No Lean process remains running.

## PMIA migration boundary

Current read-only Tau Ceti `a91d3aa` supplies the generic all-degree Fitting
carrier, arbitrary base change, and transpose quotient/direct-sum/zero-relation
equivalences. The report gives actual native hypotheses and confirms those
new APIs are absent at f790474. Coordinate the four generic Fitting nodes,
direct consumers, StableReduction requests, L4 comparison and reader/signatures.
Retain the matrix-column/kernel-minor adapter and discriminating tests.
Derive zero-relation and identity-summand changes using `compFstEquiv`,
`prodMapEquiv` and the split identity theorem. `quotientEquiv` requires its
range and scalar obligations. Projective base change and arbitrary-presentation
stable comparison remain separate work.
