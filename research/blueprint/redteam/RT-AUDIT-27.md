# RT-AUDIT-27 — accepted library audit

Codex / codex-7e92bd · 2026-09-24 · Refs #1604

Complete: two findings, one high and one medium. The broad library-coverage verdicts remain supported. The findings correct two mathematical descriptions in the Selmer/Iwasawa notes and preserve existing implementations.

## Scope and method

Read the accepted audit and review at explorer snapshot `6d466a3a0cef4c949493af7c16a3cb3d671d57a9`. The audit author was claude4/2 and accepted reviewer claude2/2; this worker did neither job. The machine-readable findings and detailed checked inventory are in [the result](RT-AUDIT-27.result.json).

| Roadmap | Layers | Targets |
|---|---:|---:|
| PeriodsAndSpecialValues | 10 | 42 |
| RankZeroOneBSD | 12 | 57 |
| SelmerIwasawaCohomology | 5 | 27 |
| SpecialValuesBirchTate | 8 | 37 |
| ArithmeticKTheory | 10 | 41 |
| Total | 45 | 204 |

Read all 182 citation occurrences at declaration level, with their variables and hypotheses: 142 distinct declarations in 76 source files. Those files match the pinned Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` blobs. The additional Selmer exact-sequence file also matches its pin. Missing targets and missing parts of partial targets were searched in the declaration index, then both Lean source trees, under names and conceptual aliases. The accepted classifications are 142 absent, 57 partial, two Mathlib, two Tau Ceti and one both.

Read all 109 overlap notes against the full descriptions of their 78 distinct endpoints and the five complete roadmap documents. Assigned stage coverage and the reviewed coverage projection agree with the audit. Later KU checkpoints are outside this assigned batch. Existing imports and application-specific comparisons are not, by themselves, evidence that a second implementation is planned.

## Findings

### RT-AUDIT-27/1 — high

**Where:** research/blueprint/audit/AUDIT-27.result.json: SelmerIwasawaCohomology:L0, target "Integral Kummer comparison H^1(F, Z_p(1)) = lim_m F^x/(F^x)^{p^m}", final sentence of note.

The note identifies K(S,n) with S-units modulo nth powers. This drops the S-class-group n-torsion quotient. The cited selmerGroup is the subgroup of field power classes with valuations divisible by n outside S; S-unit power classes form a possibly proper subgroup. The added description as the target of the S-restricted Kummer map also obscures the direction of the cited Kummer injection, whose target is H¹.

https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/DedekindDomain/SelmerGroup.lean#L163 defines the carrier by ∀ v ∉ S, valuationOfNeZeroMod n x = 1 in the quotient valuation group. It does not require an S-unit representative. At the pinned Tau Ceti commit, https://github.com/CBirkbeck/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/DedekindDomain/SInteger/SelmerGroup/Basic.lean#L154 defines fromSUnitLift from the quotient of S.unit K by its nth powers; fromSUnitLift_injective at line 186 proves injectivity; ker_toClassGroup at line 269 identifies its image with the kernel of toClassGroup; range_toClassGroup at line 296, under [NeZero n], identifies the image of toClassGroup with the kernel of nth power on ClassGroup (S.integer K). Thus the existing declarations give 1 → O_S×/(O_S×)^n → K(S,n) → Cl(O_S)[n] → 1, rather than the asserted identification. https://github.com/CBirkbeck/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/FieldTheory/GaloisCohomology/Kummer.lean#L276-L299 defines kummerClassMap from field power classes to explicit H¹ and proves it injective. All these statements and their variable hypotheses were read at the pins; the extra Selmer exact-sequence file was also byte-checked against its pinned blob.

**Fix:** Keep this target partial and preserve the already-correct finite-level Kummer injection/kernel evidence and missing p-adic-limit comparison. Replace the final sentence by the valuation-divisibility definition of K(S,n), record the existing S-unit/class-group exact sequence for n ≠ 0 with the three cited declarations, and distinguish the map of power classes into H¹ from the algebraic S-unit map into K(S,n). An identification with S-unit power classes needs trivial Cl(O_S)[n]. Qualify any nearby use of "S-unit Selmer group" consistently. Reuse the proved exact sequence; do not plan it again or claim an S-restricted cohomological comparison merely from the algebraic sequence.

### RT-AUDIT-27/2 — medium

**Where:** research/blueprint/audit/AUDIT-27.result.json: SelmerIwasawaCohomology:L3, first target, note describing AbstractMeasure.amiceTransformEquiv.

The note says the cited Amice-transform equivalence identifies Q_p-valued measures on Z_p with power series. The equivalence at the pin is for Z_p-valued measures and Z_p[[X]]. The generic transform is only a linear map; its extension to an equivalence over general coefficient rings is explicitly left open. This is a coefficient-domain error in the library input used for integral Iwasawa theory.

https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Padics/Measure/AmiceTransform.lean#L156 gives exactly amiceTransformEquiv : D(ℤ_[p], ℤ_[p]) ≃ₗ[ℤ_[p]] ℤ_[p]⟦X⟧. Its preceding documentation specifies ℤ_[p] coefficients and says generalization requires bounded power series over a normed ring. The generic amiceTransform at line 75 has type D(ℤ_[p], R) →ₗ[R] R⟦X⟧, not an equivalence. The source introduction lines 22–33 makes the same distinction. Both declarations and their surrounding hypotheses were read at Mathlib 082e2d3.

**Fix:** Replace Q_p by Z_p in the equivalence claim and give its actual linear-equivalence type. If mentioning Q_p-valued measures, cite only the generic transform map and retain the missing bounded-power-series equivalence. Keep the target absent: the cited linear equivalence supplies neither the completed-group-ring/cohomology identification nor control, characteristic-ideal or general Gamma-module theory. No new roadmap owner or change of the layer verdict is needed.

The first finding changes the carrier represented by the audit: the S-unit quotient is only the kernel of the class-group map. For n ≠ 0, identifying it with the whole group requires the extra vanishing of S-class-group n-torsion. This is why the correction is high severity even though the integral Kummer target remains partial. The exact sequence is already proved and must be reused.

The second finding changes the coefficient domain of a cited equivalence. It has limited effect on the absent Iwasawa-cohomology target, so it is medium severity. A transform map for general coefficients is not the claimed equivalence; the source explicitly retains a bounded-power-series generalization as future work.

## Checks without additional findings

The accepted review’s distinctions survived checking: Hodge conjugation versus Betti conjugation; Dirichlet critical-value algebraicity versus Riemann negative-integer values; the valuation definition of S-integers versus a generic localization; arithmetic Bernoulli conventions versus topologists’ values; and explicit low-degree cohomology versus its canonical comparison. Generic set-level Mittag–Leffler and Pontryagin-dual ingredients do not supply arithmetic derived limits or Tate/Poitou–Tate duality.

Existing Mordell–Weil finite generation, canonical heights, torsion pairing, regulator basis independence, quadratic twists and explicit 2-descent remain reusable. They do not furnish analytic continuation, the full cohomological Selmer/Sha package or any prime-part BSD theorem. Similarly, categorical/projective K₀ and the unit/class-group infrastructure do not supply higher K-groups, arithmetic Chern classes or regulator formulas.

The torsion-order divisibility citation was checked with its coprimality hypothesis. A counterexample at the rational prime two would not attack its use in the totally real odd-prime B.4 setting. No finding is filed on that basis. Ordinary roots of unity were not confused with the weight-two invariant W₂, and the S-integer Euler-factor sign is retained.

The searches returned several homonyms rather than the requested constructions: Quillen model categories, a presheaf plus construction, Coxeter Matsumoto, probabilistic Bernoulli/hypergeometric objects, and Iwasawa’s group-action criterion. These were discarded after examining their source context. The report does not claim a fresh primary-proof review of every source in these five programmes.

## Validation

**PASS:** red-team checker; scope and reviewed-coverage consistency; exact two-file intake with zero problems. All 20 captured input blobs and both absent-output guards matched fresh main `ae16efd59f8727140b163dd6a3318e0da593cd2a`. The full issue and bot-confirmed claim (comment 5807796205, confirmation 5807802626) were unchanged before publication. No Lean compilation was run.

No Lean compilation was run and no new formalization is claimed.
