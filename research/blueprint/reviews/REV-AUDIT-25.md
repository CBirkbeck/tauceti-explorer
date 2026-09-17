# REV-AUDIT-25 — review of AUDIT-25

**Verdict: accepted.** 234 targets checked across 47 layers of 5 roadmaps; 10 corrections — three
notes/citations made more precise and seven additions to `duplicates`. No target classification and
no layer verdict needed changing.

Baseline: tauceti `f790474`, mathlib `082e2d3`.

## What the audit says

| roadmap | layers | verdict | targets |
| --- | --- | --- | --- |
| GrossZagierAndArithmeticHeights | 10 | 2 partly built, 8 not built | 65 |
| HeegnerPointEulerSystems | 12 | 1 partly built, 9 not built, 2 process | 57 |
| IntegralIwasawaTheory | 15 | 1 partly built, 14 not built | 66 |
| KatoEulerSystems | 5 | 5 not built | 19 |
| LocallyAnalyticDistributions | 5 | 5 not built | 27 |

8 targets present, 34 partial, 192 absent; 157 declaration citations; 82 duplicates (75 audited,
7 added here).

## 1. Claims that a target is in the libraries

Every citation was resolved mechanically against the pinned baseline and then read in its file. All
154 original citations (123 distinct declarations) name a declaration that really is on the cited
line of the cited file, none is `private`, none is a bare structure field standing in for an
unproved theorem, and every cited file is free of `sorry`. The only mechanical misses are
`ModularForm.L` and `ModularForm.Λ`, which `declarations.tsv` drops; both are real, at
`Mathlib/NumberTheory/ModularForms/LFunction.lean:134` and `:91`, inside `namespace ModularForm`.
The index is incomplete here, not the audit.

The hypotheses and generality the notes flag are accurate:

* `ClassGroup` is defined for any `[CommRing R] [IsDomain R]`, so it really does give Pic of a
  non-maximal quadratic order; finiteness is proved only in the Dedekind setting, as the note says.
* `Ideal.relNorm` needs `[IsDedekindDomain R] [IsDedekindDomain S]` with `Module.Finite`, satisfied
  at every finite layer of the cyclotomic tower.
* `IsCyclotomicExtension.Rat.discr` needs only `[NeZero n]`, so "for every n" is right.
* `CommGroup.fg_of_descent'` is `@[to_additive]`, so the `AddCommGroup` form the Mordell–Weil
  argument consumes really does exist.
* `IsCompactOperator.finiteDimensional_ker_one_sub` sits under `[NontriviallyNormedField 𝕜]`
  `[CompleteSpace 𝕜]`, while `isClosed_range_one_sub` and the cokernel result come after
  `variable [IsRCLikeNormedField 𝕜]` — exactly the split the note describes, and the reason the
  p-adic half of Riesz theory is available and the other half is not.
* `MeasureTheory.Measure.isMulLeftInvariant_eq_smul` needs local compactness and second
  countability; `Matrix.det_smul` holds over any commutative ring; `PadicInt.continuousAddCharEquiv`
  is `d = 1` only, as claimed.

Two entries were made more precise (corrections 1 and 3 below); no claim of presence was withdrawn.

## 2. Layer verdicts

No layer is marked `built`. The two `process` layers are confirmed from their descriptions:
**HE.7s** is a source-acquisition boundary ("the exact dyadic and CM source passages still need
acquisition/verification … Record this as unresolved"), and **HE.8c** records the hypotheses of
Cornut, Cornut–Vatsal and BCGS Theorem A and routes the discharge through HE.8b. Neither adds
mathematics beyond HE.7 and HE.8, and none of those targets is in the libraries.

The four `partly built` layers are exactly the four with a fully present target: GZ.0 (Gram
determinant scaling), GZ.1 (projective-height lemmas and the descent theorem), HE.0 (Pic of an
order) and IntegralIwasawaTheory:L0 (four of its eight targets). The other 41 have only partial and
absent targets. Every layer of the batch file appears, with no extras.

## 3. Absent and partial claims, re-searched

All 192 absent and all 34 partial targets were re-searched independently — by Mathlib naming
convention, by concept and by the key words of each statement — in `declarations.tsv` and with
`grep -rn -i` over both Lean trees, about a hundred sweeps in all. Nothing was found that the audit
missed. Neither library has: Heegner or CM points, ring class fields, or orders of a number field
(only the maximal order); the Weil pairing (Tau Ceti has the divisor machinery *for* it and says so
in its docstrings); Tate modules; Tate–Shafarevich groups or cohomological Selmer groups of elliptic
curves (`IsDedekindDomain.selmerGroup` is the S-unit group `K(S,n)`, and Tau Ceti's `selmerGroupA`
is the étale-algebra 2-descent group); Néron models, Tamagawa numbers or modular curves as schemes;
Arakelov intersection theory or Green functions; Shimura curves, admissible representations, epsilon
factors, Weil representations or theta kernels; representation densities, Serre–Tate theory or
quasi-canonical lifts; Siegel or modular units, Milnor/Quillen K₂, Steinberg or tame symbols, étale
Chern classes, syntomic comparison, modular symbols; Fitting ideals, characteristic ideals,
pseudo-isomorphisms, ℤ_p-extensions, completed group algebras or Iwasawa cohomology; Stickelberger
elements, Brumer–Stark, Ritter–Weiss modules, determinant functors; Vandiver, Ferrero–Washington,
Leopoldt or Baker–Brumer; locally analytic function spaces, admissible distributions, p-adic
character/weight spaces, Mellin transforms of distributions, Fredholm determinants or slope
decompositions.

Apparent hits were read in context and are false friends: Mathlib's "Iwasawa" is the
group-theoretic Iwasawa criterion plus one docstring aside calling `AbstractMeasure` the Iwasawa
algebra; "Fitting" is the Lie-theoretic Fitting decomposition; Tau Ceti's 260 "Shimura" hits are
citations of Shimura's book in the Hecke files, its "test vector" and "matrix coefficient" hits are
linear algebra, its "real period" hits are periodic functions, its "intersection number" hits are
the axiomatised `NumericalType` datum the audit already cites, its `Stickelberger.lean` is the
discriminant congruence, and its 500-odd "Fredholm" hits are real/complex operator theory.

Four points that could have gone the other way and did not:

* **Mathlib's elliptic-curve height file.** `Mathlib/NumberTheory/Height/EllipticCurve.lean` exists,
  but contains only `abs_logHeight_addSubMap_sub_two_mul_logHeight_le`; "Define the naïve height"
  and "Add the statement and proof of the approximate parallelogram law" are still its TODOs. The
  audit is right to attribute the canonical height and the parallelogram law to Tau Ceti.
* **Class field theory.** Tau Ceti has abstract class formations
  (`TauCeti/NumberTheory/ClassFieldTheory/Formation/`, 153 declarations: levels, finite normal
  layers, norms, norm quotients) and the ideal-theoretic Artin map away from S, but no reciprocity
  law, no existence theorem and no class field of any kind; the genus-field development for
  imaginary quadratic fields is the only constructed class field, and the Hilbert class field
  appears only as a remark. HE.0, I.2 and L1 are right.
* **Chebotarev.** `TauCeti/NumberTheory/Chebotarev/` has `frobeniusPrimeSet`, the tagged fibres,
  character orthogonality and Frobenius von Mangoldt summatory functions with an `o(x)` estimate,
  plus the sorry-free `exists_auxiliaryPrime` — but no density theorem. HE.5's `partial` is correct.
* **Algebraic cycles.** `Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean` really does contain
  only `mapCoeff`, `map` and `map_id`, so GZ.6's "no pullback, no functoriality, no rational
  equivalence, no Chow group" is exact.

The audit's sharpest finding is independently confirmed. `neronTatePairing` is
`QuadraticMap.associated'` of `canonicalHeightQuadratic`, and `neronTatePairing_self`
(`CanonicalHeight.lean:390`) states `⟨P,P⟩ = P.canonicalHeight`, where `canonicalHeight` is
`limUnder atTop fun n ↦ ((2^n) • P).naiveHeight / (2 * 4^n)` and `naiveHeight` is Mathlib's
`logHeight` of the x-coordinate, relative to the base field. So the built pairing is half the one
with `⟨P,P⟩ = lim h_x(2ⁿP)/4ⁿ`, the regulator over ℚ is `2^(−r)` times that one, and GZ.0's premise
that the existing height "is normalized using the logarithmic x-height, twice one common
convention" does not describe the baseline code.

## 4. Corrections

Three entries were sharpened and seven duplicates added.

1. **GZ.1, positivity/torsion target.** The instance hypothesis of
   `canonicalHeight_eq_zero_iff_isOfFinAddOrder` is `Northcott (Point.canonicalHeight)`, not
   Northcott for the naïve height; the naïve height enters through the instance at
   `CanonicalHeight.lean:308`, and Mathlib's number-field instance through
   `MordellWeil/NaiveHeight.lean` and `Northcott (mulHeight₁)`. The note now says so.
2. **GZ.2, Faltings–Hriljac target.** Added
   `TauCeti.AlgebraicGeometry.WeilDivisor.OrderSystem.weightedDegreeZeroQuotientEquivPicZero`
   (`PicZeroQuotient.lean:125`, related): Tau Ceti identifies weighted-degree-zero divisors modulo
   principal divisors with the abstract `Pic⁰`, so the group the pairing would live on exists at the
   divisor-class level. There is still no Jacobian variety and no pairing, so the target stays
   `absent`.
3. **LocallyAnalyticDistributions:L4, Fredholm-determinant target.** Added
   `ContinuousLinearMap.IsFredholm` (`Mathlib/Analysis/Normed/Operator/Fredholm/Basic.lean:123`) and
   Tau Ceti's `ContinuousLinearMap.index` (`Analysis/Fredholm/Index.lean:52`). Both are stated over
   any `NontriviallyNormedField`, hence apply over ℚ_p — a relevant part of the layer's own subject
   that the audit did not record. The determinant itself is still absent, so the target is unchanged.

## 5. Duplicates

All 75 duplicates were confirmed against the cited layer's own description; each genuinely states
overlapping targets, and every id resolves (65 atlas stage ids and 10 `tauceti:TauCetiRoadmap/…`
anchors, all present in `atlas/index.json`). A keyword sweep of all 1962 atlas layer descriptions
added seven the audit had missed:

* **KatoEulerSystems:L1 → K2SymbolsBrauer:T.2 and T.3, MotivicEtaleKTheory:M.8.** L1's own text says
  "Import symbols, localization, tame residues, transfers and higher-K comparison from K2SymbolsBrauer
  … Import étale Chern classes/syntomic comparison from MotivicEtaleKTheory"; T.2 owns Steinberg
  symbols, Milnor K₂ and Matsumoto, T.3 the tame symbol and the localisation boundary, and M.8 the
  étale Chern classes, the regulator and norm-compatible families with Euler-factor relations.
* **HeegnerPointEulerSystems:HE.1 → ShimuraVarieties:V5.** V5 proves the main theorem of complex
  multiplication with reflex norms, Tate-module action and the full reciprocity law, and applies it
  to the Siegel canonical model — HE.1's descent target. CM.2, already listed, only imports it.
* **HeegnerPointEulerSystems:HE.8b → ModularIwasawaMainConjectures:L6.** L6 exposes the same BCS v2
  Theorems 1.2.2/1.2.4 and BCGS Theorem 1.2.13(ii)/(iii) through its branch interfaces and names
  HE.8b as their proof owner; the overlap is the formulation and normalisation comparison.
* **GrossZagierAndArithmeticHeights:GZ.7 → GeometryOfNumbersAndQuadraticArithmetic:GN.3.** GN.3
  constructs local representation densities and mass formulas; GZ.7's finite-place identities are
  stated against derivatives of exactly those densities.
* **IntegralIwasawaTheory:I.6 → NoncommutativeAndEquivariantIwasawa:NE.6.** NE.6 decomposes the
  Kakde and Ritter–Weiss routes with their integral congruences and abelian pseudo-measures; its
  Ritter–Weiss machinery overlaps I.6's Ritter–Weiss modules and presentations.

Candidates the sweep threw up and this review rejected: the high-scoring `RankZeroOneBSD` matches
(BSD.1, BSD.3, BSD.5, BSD.6/6a against HE.6, HE.7, GZ.8, GZ.9) are consumers that say "Apply GZ.8",
"Apply HE.7" and list these layers as dependencies, not co-owners of their targets;
`SpecialValuesBirchTate:B.6` (already listed under I.10) likewise consumes I.9; `MetaplecticAutomorphicForms:MP.5`
and `ShimuraVarieties:V5`-style suppliers for GZ.5 are explicit imports named in GZ.5's own text; and
`ArithmeticKTheory:N.7` and `SpecialValuesBirchTate:B.8` mention Vandiver only to keep conditional
results separate. The audit's restraint there is right.

## Assessment

This is a careful and unusually precise audit. Its citations are accurate to the line, its notes
state differing hypotheses correctly — including the two that matter most, the `IsRCLikeNormedField`
boundary in Tau Ceti's Riesz theory and the `NeZero`/Dedekind conditions in the cyclotomic
material — and its absent claims hold under independent search, which is what one expects for
Gross–Zagier, Heegner-point Euler systems, integral Iwasawa theory, Kato's Euler system and locally
analytic distributions: the libraries supply only generic inputs. The most valuable things it
records are where the libraries are closer than the roadmaps assume — Mathlib's projective height
machine with its two-sided polynomial bounds and the descent theorem, which between them give the
height half of Mordell–Weil for free; Tau Ceti's canonical height, Néron–Tate pairing, regulator and
Mordell–Weil over number fields; Mathlib's Picard-group functoriality and units-to-Pic exactness as
the tool for conductor-change kernels; the CM/Hasse-unit-index and regulator-comparison API for
ℚ(μ_n); the bounded Amice transform and Mahler basis; and Tau Ceti's Huber/adic and Riesz material —
and the one place where a roadmap's stated convention contradicts the code it points at, GZ.0's
description of the existing elliptic height.
