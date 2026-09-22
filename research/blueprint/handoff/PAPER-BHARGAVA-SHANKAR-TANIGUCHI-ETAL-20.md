# PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20: eighth checkpoint

Claude Code — `cc-7b31c4`, issue #1420, 2026-09-22. Status: partial.

## Done in this checkpoint

Closed the first interface named in resume item 2 of the seventh handoff, the
Taylor-within endpoint conversion, against the prescribed Mathlib pin
`082e2d37e8b0463410cdb532e111cd43d5a66174`. The argument is written out in the
new report section "Eighth checkpoint: the Taylor endpoint adapter" as T1 and
T2, with every cited declaration read in the source tree and given by file and
line.

The substantive finding is that the remaining adaptation recorded for
`bp-taylor-supplier` in the seventh checkpoint was over-stated.
`iteratedDerivWithin_eq_iteratedDeriv` (IteratedDeriv/Defs.lean:70) and the
underlying `iteratedFDerivWithin_eq_iteratedFDeriv` (ContDiff/Defs.lean:1040)
require `UniqueDiffOn 𝕜 s`, `ContDiffAt 𝕜 n f x` and `x ∈ s`, and **not** that
`s` be a neighbourhood of `x`; the smoothness hypothesis is on the function,
not on the set. With `uniqueDiffOn_uIcc` (TangentCone/Real.lean:102) the
conversion therefore applies at the endpoint of `uIcc x₀ x`, which is exactly
what BP2 needs, and the equal-endpoint case is `taylorWithinEval_self`
(Taylor.lean:109). The remainder side needed no conversion at all:
`taylor_mean_remainder_lagrange_iteratedDeriv` (Taylor.lean:348) already yields
an ordinary `iteratedDeriv`.

Only the third clause of the old note survives — BP2's scaled inequality needs
a supremum, not an equality at one point — and its suppliers are identified in
the new section's table: `ContDiffOn.continuousOn_iteratedDerivWithin`
(IteratedDeriv/Defs.lean:147) with `IsOpen.uniqueDiffOn`
(TangentCone/Basic.lean:291) for continuity on the interval, and
`IsCompact.exists_isMaxOn` (Topology/Order/Compact.lean:246) with
`isCompact_Icc` for the maximum. The hypothesis actually used is C^{n+1}
smoothness on an open set containing `uIcc x₀ x`, which is stronger than the
`ContDiffOn` hypothesis of the cited remainder lemma; a blueprint must not
weaken it back, since without `ContDiffAt` at the endpoint the conversion does
not apply.

The result is otherwise untouched: all 129 items and their ids are preserved,
no item is added or removed, no route, `sourceIssues`, `gaps`, `verification`
or `selectedProofEdges` entry changes. Exactly two strings change — the note
on `bp-taylor-supplier` and the `summary`. The baseline blobs this checkpoint
started from, on current main, are result `dd7194b6821113a158868d3032e9a53e303fcdc4`,
report `0a10b862f049003c687573df9c3a671d2fbe14bb` and handoff `3ff0bbf03816f52840a3f753f327bca7db6af3b7`.

## Checks

`python3 scripts/check_paper.py` reported ok and
`python3 research/blueprint/intake.py check-files` reported two files, zero
problems, on the edited result and report. Item count and id preservation were
checked programmatically before and after the edit (129 → 129, ids identical).
No Lean artifact was written or compiled, and the sixth checkpoint's
regression script was not rerun; its recorded results stand unchanged. These
checks do not establish mathematical completeness, and this worker did not
review the inherited items, routes or proposed issues.

## Resume here

1. Close a second G7 interface. Three of the four named in the seventh handoff
remain: rectangular evaluation-rank/kernel equivalence; the repeated-Rolle
derivative witness with its factorial bounds; nonzero specialization and
degree bounds. Read actual pinned statements and instantiate their hypotheses,
as the new section does for the Taylor adapter — the generic supplier nodes
are still not proof-ready consuming theorems.
2. Instantiate the two suppliers named in the new section's table to finish
BP2's scaled inequality. This is the smallest remaining piece of G7 and is now
fully specified; the only real work is applying `IsCompact.exists_isMaxOn` to
`fun y => |iteratedDeriv (n+1) f y|` rather than to the derivative itself.
3. Acquire an authorized final 2019-revised or 2020 BSTTTZ version and compare
it with the v1 preprint. Public AMS PDF retrieval failed for the seventh
checkpoint and was not retried here; restricted deposits must not be treated
as accessible or equated with the public v1 preprint.
4. For the graph cover, establish proper Bézout through SF.5, smooth branch
continuation in open strips, and inversion of steep graphs. Do not promote the
weaker 8d³ finite-point cover to the source's stronger O(d²) whole-curve
decomposition.
5. Other substantial gaps remain, unchanged: G1 primitive-prefix generic
interfaces; G2 relative-genus diagnostic/source reconciliation; G3 original
Brumer–Kramer and HV proof interiors; G4 torus/resolvent transfer; G5
hyperelliptic descent and bad-prime/model discriminants; G6 del Pezzo height
normalization and singular fibers; G8 counting originals; G9 q-uniformity,
epsilon, gonality and characteristic-two/inseparability issues. G10 retains
recursive closure and the incomplete source-issue inventory.
6. E1–E4 are proposed issues inherited from #1817, not accepted errata. They
were not reviewed in this checkpoint. Preserve source-version qualifiers.

Current generic owners stay unchanged: determinant methods imports generic
linear algebra/calculus and SF.5 intersection theory; basis reduction belongs
to GN.5; arithmetic torsion applications extend completed EffectiveBounds.
Never re-plan the inherited library objects. Do not reapply the obsolete
guarded patch and do not overwrite the 129-item result. The complete
historical report, source metadata and verification history must survive the
next continuation.
