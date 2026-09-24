# REV-RT-AUDIT-24 — independent verification

Codex / codex-7e92bd · 2026-09-24 · explorer `a39dad4a51f84683dc11e86189824bb8a0c265c9`

Both findings are **confirmed**: one high-severity missing hypothesis and one
medium-severity ownership error. The changes belong in the audit's normal fix job.

| Finding | Verdict | Correction |
| --- | --- | --- |
| RT-AUDIT-24/1 | Confirmed, high | Retain `p odd` and `n ≥ 1` on the relative norm identity. |
| RT-AUDIT-24/2 | Confirmed, medium | Attribute the Selmer carrier to L2; retain R02.5's comparison and dimension work. |

## Independence and scope

The ledger records AUDIT-24's checkpoint as `claude2/2`, its completion as
`claude6/2`, and REV-AUDIT-24 as `claude4/2`. The red team was
Codex / codex-a71f92 (issue #1598, PR #2649). None is this session.
The bot confirmed this review's claim on issue #1597, comment 5806230914,
in response to claim 5806229562. I reread the complete issue after confirmation.

I read both findings and the full red-team report, the original review, the two
affected audit layers, their coverage mirrors, and the relevant roadmap documents
and stage records. This verifies the supplied findings; it does not recertify all
142 audit targets, all 111 distinct original citations, or the whole Iwasawa graph.

## 1. The norm target needs its prime restriction

The fifth target of `ColemanPowerSeries:L0` states the relative norm formula with
an unconditional plus sign. Its note contains no odd-prime restriction. The
restriction on the separate unit-splitting target is not a hypothesis on this one.
The roadmap's indexing is `n ≥ 1`.

In [RJW v2, §9](https://arxiv.org/html/2309.15692v2#S9), the authors say
“Let p be an odd prime”. The product calculation in the proof of
[Lemma 10.3](https://arxiv.org/html/2309.15692v2#S10.SS2) uses that convention.
Both passages were read on 2026-09-24. No source erratum is proposed.

Independently, for `p=2,n=1`, the fields are `Q₂` and `Q₂(i)` with `i²=-1`.
The latter extension is quadratic: a square root of −1 in Q₂ would have valuation
zero, but a 2-adic unit has square 1 modulo 8. Multiplication by `i−1` on `(1,i)`
has matrix `[[-1,-1],[1,-1]]`. Its determinant is **2**, whereas the displayed
right side `ζ₂−1` is **−2**.

This uses the precise norm convention in
[Mathlib Norm/Defs.lean at 082e2d3](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Norm/Defs.lean#L61):
`Algebra.norm` is the determinant of multiplication, `norm_apply` unfolds it,
and `norm_eq_matrix_det` expresses it in a finite basis. I read the ambient ring
and algebra assumptions as well as these statements.

For the degree-p step with compatible primitive roots and `n ≥ 1`, the minimal
polynomial of `ζ_(p^(n+1))−1` is `(X+1)^p−ζ_(p^n)`. Its constant coefficient gives

`N(ζ_(p^(n+1))−1) = (−1)^(p+1) (ζ_(p^n)−1)`.

Equivalently, `N(1−ζ_(p^(n+1))) = 1−ζ_(p^n)`. Exact symbolic companion-matrix
calculations at p=2,3,5,7 independently checked these signs; the constant-term
argument supplies the general formula. These are diagnostic computations, not
Lean proofs. Smoothed ratios retain norm compatibility because both signs cancel.

I also read the audit's actual supporting declaration,
[`IsPrimitiveRoot.sub_one_norm_isPrimePow`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Cyclotomic/PrimitiveRoots.lean#L360).
It assumes a cyclotomic extension, irreducibility of the full cyclotomic
polynomial over the base, a prime-power order, and order different from 2.
It computes the norm to that base, not the desired relative-tower formula.
The existing `partial` verdict remains appropriate for this correction.

The minimal fix is to qualify the target and note with `p odd, n ≥ 1`.
A deliberate all-prime version can use the signed formula or `1−ζ` convention.
Keep the separate continuity obligation and all unrelated dyadic branches.
High severity describes the false unqualified statement; it does not imply
the source's intended odd-prime theorem is wrong.

## 2. Selmer ownership belongs to L2

The audit's `EulerSystemsAndKolyvaginSystems:ES.0` duplicate entry says that
`ArithmeticGaloisDuality:R02.5` owns Selmer groups with local conditions.
Its [actual roadmap contract](https://github.com/CBirkbeck/tauceti-explorer/blob/a39dad4a51f84683dc11e86189824bb8a0c265c9/content/campaign/ArithmeticGaloisDuality/README.md#r02-5)
explicitly imports the local-condition/mapping-fibre construction from
`SelmerIwasawaCohomology:L2`, then proves the deformation-facing H¹/kernel
comparison and the dimension formula for deformation and auxiliary-prime arguments.
The stage's prerequisite list includes L2.

[L2's contract](https://github.com/CBirkbeck/tauceti-explorer/blob/a39dad4a51f84683dc11e86189824bb8a0c265c9/content/campaign/SelmerIwasawaCohomology/README.md#l2-selmer-structures-and-duals)
constructs the local conditions, classical restriction kernel, Pontryagin dual
and mapping fibre. Its H¹ identification keeps the stated H⁰ conditions.
The Euler-systems scope paragraph imports that carrier; ES.0 requires both L2
and R02.5. This is consistent with the campaign's one-owner convention.

Correct the single overlap note to distinguish the imported Selmer object from
R02.5's comparison/dimension theorem. Retain the real dimension/core-rank overlap
and the separate existing L2 supplier entry. No edge deletion, graph redesign,
second carrier or library-status change follows from this finding. This is a
current-contract check, not a historical claim about the original audit's date.

## Integration and validation

For both affected layers, all target texts, library statuses and notes match
the coverage mirror, as do the verdicts and duplicate arrays. The mirror omits
per-target declaration arrays by design; I compared the common fields rather than
claiming byte-identical audit and coverage objects. Apply the corrections to the
accepted audit and regenerate coverage through normal intake.

Both cited Mathlib source files were downloaded from the full pinned commit and
byte-matched against the local baseline. No Tau Ceti declaration is needed for
these two findings. No Lean file was changed or compiled.

**PASS:** red-team checker; exact coverage of both supplied finding IDs with no extras; two-file intake with zero problems. All 18 captured input blobs and both output guards matched fresh main `ec8fd3cee1dfad8cd48ac687cce1788750b9cf57`. The bot-confirmed claim and issue instructions were unchanged before publication.
