# REV-AUDIT-18 — review of `research/blueprint/audit/AUDIT-18.result.json`

**Verdict: accepted.** 8 corrections, all additive; no claim in the audit had to be reversed.

Baseline: tauceti `f790474`, mathlib `082e2d3`. Batch: 5 roadmaps, 49 layers, 254 targets,
557 cited declarations.

| roadmap | layers | verdicts |
|---|---|---|
| ClassicalArithmeticCompletion | 8 | 1 built, 6 partly built, 1 process |
| AdicCoefficientsAndComparisons | 7 | 2 partly built, 5 not built |
| ClassicalAdicEtaleCohomology | 10 | 10 not built |
| DeligneWeightsAndPurity | 11 | 10 not built, 1 process |
| EtaleDualityAndPerverseSheaves | 13 | 13 not built |

## 1. Claims that a target is in the libraries

All 33 targets marked `mathlib`, `tauceti` or `both` were re-read in the pinned Lean sources —
statement, hypotheses and generality compared with the target. All hold. None of the cited
declarations is `private`, an axiom or a bare structure field.

All 557 citations were machine-checked against `declarations.tsv` and the two trees
(a scripted re-lookup of every citation). Every one is at its cited file and line. The seven
flagged rows are index artefacts, not errors: `declarations.tsv` drops named instances
(`PrincipalIdealRing.to_uniqueFactorizationMonoid`, `IsAdicComplete.henselianRing`) and the
`public theorem`s `not_fermat_42` and `fermatLastTheoremFour`, and my matcher mis-handles primed
names (`Nat.chineseRemainder'`, `LinearMap.trace_tensorProduct'`).

No cited result depends on a `sorry`. The only `sorry` tokens in any cited file are inside a
commented-out TODO block in `Mathlib/GroupTheory/FiniteAbelian/Basic.lean` (lines 42–43, inside
`/- … -/`) and inside a docstring in
`TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Frobenius/Basic.lean`. All 11 `sorry`
occurrences in the whole pinned Tau Ceti tree are in comments.

## 2. The `built` and `process` verdicts

* **CA.0 `built`** — correct. All ten targets are present, and the layer's acceptance conditions
  are met: zero/unit conventions (`f 0 = 0` for `ArithmeticFunction`), Möbius inversion
  instantiated at divisor sums (`ArithmeticFunction.sum_eq_iff_sum_mul_moebius_eq`), and CRT at
  non-coprime moduli with the gcd compatibility hypothesis (`Nat.chineseRemainder'`, which takes
  exactly `a ≡ b [MOD gcd n m]` and returns a solution below `lcm n m`).
* **CA.5 `process`** — correct. "Number-field arithmetic handoff": reuse of integral bases, units,
  class groups, relative discriminants, Frobenius and Dedekind–Kummer from existing owners. Six of
  the seven targets are already in the libraries; nothing is constructed here.
* **DWP.10 `process`** — correct, and the more borderline of the two. "Arithmetic interfaces and
  acceptance checks" exports weight statements to R34.6 and the automorphic owners and lists
  acceptance examples; its point-count and weight/monodromy statements are mathematics, but they
  are proved at DWP.4/7–9 and LPV, not here.

No layer's verdict contradicts its targets (no `built` with a missing target, no `not built` with
a present one, every `partly built` has both).

## 3. Absent and partial claims

Re-searched independently — by Mathlib naming convention, by synonym and by the key words of the
statement, in `declarations.tsv` and with `grep -rn -i` over both whole trees — well over half of
the 221 absent/partial targets, and every one whose concept has a standard Mathlib name. No target
called absent or partial turned out to be present.

Confirmed absent from both trees: Hilbert/norm-residue and power-residue symbols and any higher or
Artin reciprocity law; Euler (secant) numbers; Lucas sequences; a rationality predicate for power
series; general companion matrices (Tau Ceti's `companionGL` and `companionFinTwo` are 2×2 only,
and Mathlib has none); Farey/Stern–Brocot; automatic sequences and Christol; Hermite normal form;
rational canonical form; `Int(ℤ)` and Pólya's theorem; Gröbner bases; Legendre's three-square
theorem and r₂/r₄; Catalan–Mihăilescu; Egyptian fractions; numerical semigroups and Apéry sets;
Pisot and Salem numbers and the Smyth/Dobrowolski/Schinzel–Zassenhaus/Lehmer bounds; normal
integral bases, Hilbert–Speiser, Fröhlich–Taylor and orders in semisimple algebras; henselization
and strict henselization; excellent/Nagata/Japanese rings (Tau Ceti's own
`RingTheory/IntegralClosure/NormalizationFinite.lean` says so and proves Krull–Akizuki instead, not
finiteness); blowups; de Jong alterations; Nagata compactification; hypercovers above degree one
and cohomological descent; derived completeness and completed tensor products; v-sheaves, diamonds
and perfectoid spaces (Mathlib's `RingTheory/Perfectoid/` is only `Untilt`, `FontaineTheta`,
`BDeRham`); formal schemes and `Spf`; analytification and GAGA; overconvergent/dagger algebras;
nearby and vanishing cycles; constructible sheaves; `Rf_!`, `f^!`, dualizing complexes and Verdier
duality; Gysin maps; Chow groups, Chern classes and cycle classes; weak and hard Lefschetz;
perverse sheaves, recollement and IC; Leray and Hochschild–Serre; Künneth; Poincaré duality in any
étale setting; Weil numbers; Tate modules; zeta functions of varieties; the Hasse bound; function-field
Chebotarev; Pringsheim; `lim¹`/`R lim`; Lefschetz–Verdier traces.

Three partial claims worth recording because I re-derived them rather than taking them:

* Mathlib's `Module.Basis.SmithNormalForm` really has no divisibility chain — its field
  `a : Fin n → R` is unconstrained (`Mathlib/LinearAlgebra/FreeModule/PID.lean:408`).
* `Mathlib/AlgebraicGeometry/AffineTransitionLimit.lean` proves eventual affineness
  (`exists_isAffine_of_isLimit`) and quasi-affineness only; there is no eventual separatedness,
  properness, closed immersion or étaleness, as the audit says.
* `Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean` is 79 lines with four declarations and only
  `map_id` proved — the audit's characterisation of EDC.3's cycle target is exact.
* The heart-is-abelian gap (EDC.5) is a literal `## TODO (@joelriou) * Show that the heart is an
  abelian category` in `Mathlib/CategoryTheory/Triangulated/TStructure/Heart.lean`, and the
  triangulated structure of `rightDerivedFunctorPlus` (H0) is a TODO in its own file.

## 4. Duplicates

All 117 recorded entries resolve: 101 to live atlas stage ids (none belonging to a retired
roadmap) and 16 to headings that exist under `content/tau-ceti/`. A sample of eleven was read in
full and each states the claimed overlap.

A phrase-overlap sweep of all 2000+ atlas layer descriptions, subtracting what the audit already
claims, found eleven further genuine overlaps, now added:

| layer | added |
|---|---|
| AdicCoefficientsAndComparisons:L1 | `RelativeFarguesFontaine:RF2:untilts` |
| AdicCoefficientsAndComparisons:L3 | `DiamondSixOperations:S0`, `DiamondSixOperations:S3` |
| AdicCoefficientsAndComparisons:L4 | `DiamondSixOperations:S0` |
| ClassicalAdicEtaleCohomology:H3 | `EtaleDualityAndPerverseSheaves:EDC.2`, `DiamondSixOperations:S1`, `AdicSpacesPartII:R3` |
| ClassicalAdicEtaleCohomology:H4 | `DiamondEtaleCohomology:C1`, `DiamondEtaleCohomology:C6` |
| EtaleDualityAndPerverseSheaves:EDC.4 | `LefschetzPencilsAndVanishingCycles:LPV.3`, `SchemeKTheoryOperations:S.5` |

The most important finding of this review is here: **H3 and H4 carried no duplicates at all**,
although H3's own description names `EtaleDualityAndPerverseSheaves EDC.2` as the owner of the
scheme trace, relative purity and pairing it transfers, and `DiamondEtaleCohomology:C6` says in so
many words that it uses "the annulus/open-ball calculations in H4". Two other roadmaps in this
batch — `AdicCoefficientsAndComparisons` L3/L4 — recorded only the consumer EDC.6 and missed
`DiamondSixOperations` S0/S3, which own the very eligibility predicates (compactifiable,
representable in locally spatial diamonds, locally finite `dim.trg`) and the `Rf^!` right adjoint
that ECD 27.4–27.5 compare across.

## Two note refinements

* **CA.3, Smith normal form** — what is missing for rectangular and singular matrices is
  *existence*: `Matrix.smith_normal_form_unique` (TauCeti, line 836) already covers singular
  diagonals, and only `exists_smith_normal_form_of_det_ne_zero` (line 743) carries `det A ≠ 0`.
  The existence theorem is an `∃ L R d` statement, not a procedure, so "partial" is unchanged.
* **L6, ECD 27.6** — set-level constructibility in the baseline is not only Chevalley's theorem:
  Tau Ceti has pro-constructible subsets of spectral spaces (`TauCeti.IsProConstructible`,
  `TauCeti/Topology/Spectral/ProConstructible.lean:111`), used for the patch presentation of Spa.
  Sheaf-level constructibility, and so the "absent" verdict, is unchanged.
