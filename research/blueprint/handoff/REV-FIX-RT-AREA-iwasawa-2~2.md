# Handoff: REV-FIX-RT-AREA-iwasawa-2~2

Codex (GPT-6), session `codex-oYbkOx`, 10 October 2026; issue
[#6219](https://github.com/CBirkbeck/tauceti-explorer/issues/6219).
One confirmed claim and one checkpoint. **The live issue review is finished;
queue completion is blocked by the issue/queue scope mismatch.**

L3 is accepted within the fix scope. PMIA needs coordinated reuse of current
Tau Ceti's generic Fitting and transpose APIs. The
[report](../reviews/REV-FIX-RT-AREA-iwasawa-2~2.md) records all six dispositions,
fresh public source locators/hashes, pinned/current native hypotheses,
compiler diagnostics and the attributed prior L6 ledger. Archived the two
codex-6EmRVa receipts in `reviewHistory`; changed no mathematical node,
source-issue verdict, request, baseline or suggested signature.

## Resolve scope before another dispatch

The live issue authorizes five files, covering only L3 and PMIA. The queue
also requires the L3-2 and D.1 packets/suggested files. A read-only call to
`issues.deliverables_complete` returns True for the live five-file scope and
False for the nine-file queue scope: L3-2 has no review object, while D.1 has
another independent review id. A `needs_changes` verdict counts as a
completed review, so PMIA's verdict is not this administrative blocker.

[WORKERS.md](../WORKERS.md) requires: “Edit only the files the issue names,
plus your own scratch space.” Requested authorization for the four extra
paths; no answer arrived. No extra file, queue entry, issue body or label was
changed. Reconcile the issue and queue, or authorize the two additional
scoped reviews, before redispatching. Repeating the same two receipts cannot
complete the queue.

The report links codex-6EmRVa's retained, read-only L3-2/D.1 preflight. Use it
as prior evidence, not a new audit by this session. Preserve D.1's newer
independent regulator/source-issue reviews when installing any later scoped
fix receipt. Ferrero–Greenberg nonvanishing and CS.0–CS.3 remain external;
prototype elaboration does not close them.

## New compiler evidence and reproduction

PMIA's full suggested file elaborated with 1,075 proof-placeholder warnings
only. Standalone L3 stops at unresolved repository-local imports. To examine
its whole body without a dependency build, concatenate the suggested bodies
PMIA, L0, L1, L2, L3 in that order into a scratch Lean file. Collect/deduplicate
their Mathlib/TauCeti import commands at the top and remove their original
library/repository-local import commands. Retain all other text. The report
records exact input hashes and atlas input commit.

The unmodified assembly processes every L3 declaration with no L3 errors,
but has supplier errors, including 46 repeated `p✝` unknown-constant
diagnostics at L1 line 1883. A first scratch-only correction reveals a
natural-number filter inference error in the newly parsed L1 declaration.
The required supplier changes are:

- L1 `smoothedResidue_carry`, original lines 1753–1758: close the first
  conjunct after `(N : ℤ)` before `∧`, and give its residue-count filter binder
  the explicit natural-number type `fun i : ℕ => ...`.
- L2, original lines 3854 and 3856: reconcile/remove the unused `d` notation
  referring to undefined `eisensteinTwistedDenominator`, and its unused `S`
  notation. These lie in `SuggestedEisensteinAwayTests`; do not invent a new
  denominator to mask the error.
- L1 line 1883: expand `variable [IsBoundedSMul Z K]` to the explicit types
  `variable [IsBoundedSMul ℤ_[p] ℚ_[p]]`. The repeated unknown-constant
  diagnostics use `error(lean.unknownIdentifier)`, so a search for only
  `error:` misses them. Count both diagnostic formats.
- L1 lines 1976–1977, `unit_denominator_quinary`: after the above correction,
  the concrete p-adic types need `Fact (Nat.Prime 5)`. Add a local instance
  proved by `norm_num` before this example; no new proof placeholder is
  needed. The expanded-notation run otherwise finishes with only three
  diagnostics for this missing instance and 7,176 proof-placeholder warnings.

No supplier repository file was edited: both are outside this issue.
The final assembled diagnostic with all five supplier corrections exits 0
with 7,177 proof-placeholder warnings only. L3 and PMIA bodies are unchanged.
This is conditional prototype elaboration; the original standalone L3 file
still lacks dependency artifacts and its original suppliers still need repair.
The report records the final diagnostic hash and all original input hashes.
All checks ran sequentially through `lean-check` after memory checks. No
language server, Lake project/dependency build, or current-main build was
started. No Lean process remains at submission.

## PMIA migration boundary

At current Tau Ceti a91d3aa, the four generic L6 Fitting nodes, their direct
consumers, both StableReduction requests, the L4 comparison and
reader/signatures need coordinated migration. Retain the concrete
matrix-column/kernel-minor adapter and discriminating tests. Derive the
transpose zero-relation and split-identity changes from native
`compFstEquiv`, `prodMapEquiv` and `quotientEquiv`, preserving their range and
scalar obligations. Projective base change and arbitrary-presentation stable
comparison remain separate work.

These new native APIs are absent at f790474; keep the old/current boundary
explicit. The reader is outside the live issue. The report gives exact
native declarations/hypotheses, and existing packet `upstreamNotes` retains
the full migration inventory. Do not silently change pins or rebuild native
carriers.

Both packet checkers pass (L3: 26 inherited short-API warnings; PMIA: none),
and all 57 L6 test names occur in the suggested file. The report distinguishes
selected fresh source checks from the historical 50-node audit ledger. All
needed continuation evidence is committed or linked; public PDFs and scratch
are disposable. No source passage or restricted book was copied.
