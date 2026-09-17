# Review of AUDIT-14

**Job** REV-AUDIT-14 · **Date** 2026-09-17 · **Verdict `accepted`** · **15 corrections**

Baseline: tauceti `f790474`, mathlib `082e2d3`.

Scope: the five roadmaps of `research/blueprint/audit/AUDIT-14.json` —
`AutomorphicLFunctionsAndLocalFactors`, `AutomorphicSpectralTheory`, `CompletedCohomologyPartII`,
`GL2AutomorphicRepresentationsAndTransfer` and `HabiroNahmSeries`. That is 41 layers, 169 targets,
411 declaration citations naming 374 distinct declarations, and 104 duplicate claims.

This audit is accurate. Every claim I re-tested held. No target changed `library`, no note needed
repair, and no verdict moved; all 15 corrections are duplicates the audit had not found. The most
important finding is one of those: `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6c` owns the
Hilbert symbol and the local Hasse invariant over a nonarchimedean local field — the exact data
R17.1 records as missing — and R17.1 had cited only layer 2 and sublayer 6E, so the roadmap could
have been read as free to build it again.

## What was checked

**Mechanical.**
- All 41 batch layers appear; no extras, no omissions.
- Every one of the 374 distinct citations resolves at its stated library, file and line in the
  pinned baseline. None is `private`, an axiom or a bare structure field.
- `grep -n sorry` is clean in all 374 cited files. The two hits in
  `Mathlib/GroupTheory/FiniteAbelian/Basic.lean` sit inside a `/- TODO: … -/` comment block, not in
  a declaration, so `AddCommGroup.equiv_free_prod_directSum_zmod` (HB.5) is sorry-free.
- Three citations are missing from `declarations.tsv` but present in the sources exactly as
  described: `ModularForm.weakFEPair` and `ModularForm.Λ` (the index drops them from the
  `@[expose] public section` of `ModularForms/LFunction.lean`) and `Topology.RelCWComplex` (declared
  `class RelCWComplex.{u}`, which the index's parser misses).
- Layer verdicts are consistent with the targets: 35 not built, 6 partly built, none `built` or
  `process`. All 7 fully present targets sit in "partly built" layers, and every "not built" layer
  has no present target. `fit` values are consistent too: all 181 citations inside `absent` targets
  are marked `related`, and the 10 `exact` fits inside `partial` targets each supply one named piece
  of a compound target.
- Target lists faithfully decompose the layer descriptions in the extracts. I read AL.1, AL.5, AS.3,
  CC.3, R16.5 and HB.8 in full against their target lists; nothing stated is missing.

**Presence claims (61 targets, 230 citations).** All 5 `mathlib`, 2 `both` and 54 `partial` targets
were re-derived from source, including each file's `variable` lines. Checks that mattered:

- `hasDerivAt_integral_of_dominated_loc_of_deriv_le` sits under `[RCLike 𝕜]`, so the audit is right
  that holomorphic dependence is included (AL.0, AS.0).
- `Fourier.fourierIntegral` really is defined for any `[CommRing 𝕜]`, while every theorem from
  line 417 of `FourierTransform.lean` carries `[InnerProductSpace ℝ V] [FiniteDimensional ℝ V]`.
  The audit's "a local-field transform can be written, but only the real inner-product-space case
  has theorems" is exactly right (AL.0).
- `Gammaℝ = π^(-s/2)Γ(s/2)` and `Gammaℂ = 2(2π)^(-s)Γ(s)`, with the reflection identity — the
  normalizations AL.1 states.
- `WeakFEPair` is "constant plus rapidly decaying at ∞ with `f(1/x) = ε·x^k·g x`", as the note says.
- `haarMeasure_quotient` carries `[Subgroup.Normal Γ] [Countable Γ]`, which is precisely why R16.1's
  note calls the non-normal quotient `GL₂(F)Z(𝔸)\GL₂(𝔸)` missing.
- `groupCohomology.coindIso` holds for every subgroup and `Rep.indCoindIso` for finite index, so
  CC.0's change-of-level claim is sound; the model is `Extⁿ` in `Rep k G` for arbitrary `G`.
- `polynomialRingEquivTwo` is Shimura Theorem 3.20 for `n = 1, 2` only — its own docstring says the
  source leaves general `n` a gap — matching the audit's note exactly (AL.2, R16.2).
- The two "unnamed instance" claims check out: `instance : AB5 (ModuleCat.{u} R)` at
  `Algebra/Category/ModuleCat/AB.lean:29` (CC.1) and the limits of `TopModuleCat` (CC.2); likewise
  `instance … : LocallyCompactSpace αˣ` at `Topology/Algebra/Group/Units.lean:130` (R16.1) and the
  `Finite (CuspOrbits 𝒢)` instance at `Cusps.lean:204` (HB.5a).
- `RestrictedProduct.unitsEquiv` is indeed only a `≃*`, not a homeomorphism (R16.1).

**Absence and partial claims.** I re-searched 81 of the 108 `absent` targets independently — by
concept, by Mathlib naming convention, with `grep -i -P` on `declarations.tsv` and `grep -rn -i`
over both Lean trees — together with the missing half of each of the 54 `partial` targets. Every
claim held. Nothing turned up for: Schwartz–Bruhat spaces, self-dual local measures, adelic Poisson
summation, Tate / Godement–Jacquet / Rankin–Selberg zeta integrals, ε- and γ-factors, Satake and
L-groups, Weil–Deligne data and local Langlands, Whittaker and Kirillov models, converse theorems,
trace-class / Hilbert–Schmidt / Schatten / nuclear operators, direct integrals and spectral
measures, Arthur truncation and Maass–Selberg, orbital integrals and every trace formula, weighted
cohomology and Franke's comparison, `lim¹` and the Milnor sequence, Mittag-Leffler for module
systems, cellular homology, singular cohomology, Borel–Serre, perfect complexes, completed group
rings and Lazard's theorem, admissible smooth or Banach representations, locally algebraic vectors,
modular curves and Shimura varieties, Galois representations of modular forms, Jacquet–Langlands and
quaternionic forms, Brandt matrices and Eichler orders, the Hilbert symbol and Hasse invariants,
base change and automorphic induction, Langlands–Tunnell and Rohrlich–Tunnell, q-Pochhammer symbols
and q-binomials, Li₂ and the Bloch–Wigner and cyclic dilogarithms, Bloch groups and the five-term
relation, Euler–Maclaurin and saddle-point asymptotics, Nahm and Habiro objects, Dieudonné–Dwork and
Artin–Hasse. Three of these are explicit Mathlib TODOs, as the audit says: the Hochschild–Serre
spectral sequence in `GroupCohomology/Basic.lean`, q-Pochhammer in
`RingTheory/Polynomial/Pochhammer.lean`, and trace-class operators in the multivariate Gaussian file.

Two searches that could plausibly have overturned a claim, and did not:

- **Mathlib's p-adic measures are not the completed group ring.** `Mathlib/NumberTheory/Padics/Measure/`
  defines `AbstractMeasure X R E = C(X,R) →L[R] E` with `dirac`, `map` and a product `prodMk`, but no
  `Mul` or `Ring` instance and no convolution; `amiceTransformEquiv` is only
  `D(ℤ_p,ℤ_p) ≃ₗ[ℤ_p] ℤ_p⟦X⟧`. So it is not `O[[ℤ_p]]`, and CC.3's and CC.5's claims stand.
- **No multivariable convexity criterion.** `Mathlib/Analysis/Convex/` has only the one-variable
  `strictConvexOn_of_deriv2_pos`; there is no "positive-definite Hessian ⇒ strictly convex". HB.3's
  note is right that this is the gap in the standard proof for Nahm's equations.

One presence claim reads generously and I left it: CC.0's derived group-cohomology target is marked
`mathlib` although its arithmetic-group input does not exist. The model itself is in Mathlib for any
group and the note states exactly what is missing, so `mathlib` conveys the right message — do not
rebuild group cohomology — and the missing input is already recorded under CC.0's other targets.

**Duplicates.** All 104 original claims resolve to live atlas stages: 85 roadmap layers and 19
Tau Ceti roadmap anchors. None belongs to the retired `FoundationsAndLibraryIntegration`, and none
is self-referential. The four hidden `HabiroNahmSeries:KU-*` stages are correctly omitted (they are
`hidden: true` in `data/stage-presentation.json`, so the batch excludes them by design).

## Corrections

All 15 are duplicates added after reading the referenced layer descriptions in full.

| Layer | Added duplicate | Why |
| --- | --- | --- |
| R17.1 | `tauceti:…/QuadraticFormInvariants#6c-the-hilbert-symbol-and-the-local-hasse-invariant` | Declares the Hilbert symbol its own and builds it with the local Hasse invariant over any nonarchimedean local field, dyadic case included: exactly what R17.1 calls missing |
| CC.0, CC.4 | `ArithmeticLocallySymmetricSpaces:ALS.2` | The Borel–Serre compactification itself, with the neat-level manifold-with-corners structure and boundary stratification |
| CC.2 | `StableHomotopyKTheory:H.6` | Constructs the Milnor `lim¹` exact sequence and the hypotheses under which it collapses |
| HB.4, HB.5 | `HabiroNumberFields:HB.2` | Owns the cyclic quantum dilogarithm and its comparison with the finite Chern class |
| HB.9 | `HabiroRings:HR.2`, `HabiroRings:HR.1` | Habiro-complete modules over `A[q,q⁻¹]` (the `((q;q)_n)` completion) and the Λ-ring Frobenius congruences |
| R16.3 | `ArithmeticGaloisRepresentations:R01.3`, `tauceti:…/ClassFieldTheory#layer-7-…` | Artin and Swan conductors; the absolute local Artin map with its normalizations and conductors |
| R17.5 | `tauceti:…/InductionRestriction#layer-7-projective-representations-factor-sets-and-the-schur-multiplier` | Owns the Schur-multiplier lifting machinery R17.5's own citations come from |
| R17.3 | `K2SymbolsBrauer:T.7` | A second owner of the Hilbert-symbol reciprocity behind the ramification-parity condition |
| AL.0 | `MetaplecticAutomorphicForms:MP.0` | Builds Schwartz–Bruhat spaces as Schrödinger models, with Haar normalization and modulation relations |
| AL.1 | `AnalyticNumberTheory:AN.8` | Prehomogeneous zeta integrals with orbit decomposition, Poisson summation and functional equations; lists AL.0 as an input |
| HB.10 | `HabiroRings:HR.6` | The coefficient-and-cohomology export interface HB.10's integration target names |

## Findings worth repeating

Two of the audit's own findings correct the roadmaps rather than the libraries, and I confirmed both:

- **HB.5a's non-congruence generality is already the default.** Mathlib's modular-forms API is stated
  for `Subgroup.IsArithmetic`, and `isArithmetic_iff_finiteIndex` shows that for `Γ ≤ SL(2,ℤ)` this
  is exactly finite index, with `IsCongruenceSubgroup` a separate predicate. Cusps, scaling matrices,
  finiteness of cusp orbits and the width at ∞ are all there, and Tau Ceti has the width at every
  cusp with `sum_cuspTranslationOrbitWidth`. HB.5a should not rebuild cusps and widths.
- **The classical GL₂/ℚ newform theory is built.** Tau Ceti has the old/new decomposition, normalized
  newforms with multiplicative coefficients and the prime-power recurrence, multiplicity one, strong
  multiplicity one at fixed level and nebentypus, the conductor dichotomy and normalized
  Atkin–Lehner eigenspaces; Mathlib has Hecke's continuation of cusp-form `L`-functions. R16.2, R16.4,
  R16.5 and R16.6 must consume this, not plan it again.
