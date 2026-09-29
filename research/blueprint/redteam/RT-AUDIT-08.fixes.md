# RT-AUDIT-08: fixes

Fixer: Claude Code, session `cc-f805bf`, 29 September 2026 (issue #4003, job FIX-RT-AUDIT-08).
- **Findings and verdicts.** `RT-AUDIT-08.result.json` and `RT-AUDIT-08.review.json`. The red team made 63 findings. The review confirmed all 63 and rejected none.
- **Scope.** This job covers the 36 confirmed findings of high or medium severity: /1–/4, /13–/22, /26–/31, /36–/41, /43, /47, /48, /51–/57. Only /13 is high. The 27 confirmed low-severity findings (/5–/12, /23–/25, /32–/35, /42, /44–/46, /49, /50, /58–/63) are outside the fix job (PROTOCOL.md section 17).
- **Where the changes are.** Everything is in `research/blueprint/audit/AUDIT-08.result.json`; no other file changes. The audit's `review` object is unchanged.
- **Layer verdicts changed (two).**
  - `AbelianSchemesAndArithmeticModuli:A5`: `not built` → `partly built`, required by /16 (following /13–/15).
  - `ArakelovGeometryAndAbelianHeights:R35.1`: `not built` → `partly built`, required by /37.
- **Library values changed (five).**
  - ArithmeticDirichletSeries Layer 5, ideal-count bounds: `tauceti` → `both` (/4).
  - A5, Riemann bilinear relations: `absent` → `partial` (/13).
  - R35.1, hermitian bundles: `absent` → `partial` (/38).
  - R35.1, arithmetic degree: `absent` → `partial` (/39).
  - R35.1, product formula: `mathlib` → `both` (/41).

**Verification.**
- I read every added declaration at Mathlib 082e2d3 / Tau Ceti f790474, at the stated file and line. Each one resolves in the pinned `declarations.tsv` under the stated full name.
- Every layer id added to a `duplicates` list is an atlas stage.
- Every target has at most five declarations. Where a finding adds more, the displaced citations are named in the note with file and line, and each case is listed below.
- The reviews confirm every finding without narrowing it. So each fix follows the finding's own wording, except where the five-citation cap forced a choice.

## RT-AUDIT-08/1 (medium, library-claim): `EulerProductData` (ADS Layer 3, summary)

- **Fit.** `TauCeti.EulerProductData` (Data.lean:56) goes from `exact` to `more general`.
- **Note.** It gains the finding's text: only the function and its coprime multiplicativity are stored, the local series is derived (Data.lean:80), and there is no finite bad set, by design. The export-contract row is met; the 3.1 text's finite bad set is not.
- **Library value and verdict.** The target stays `tauceti`, and the layer stays `built`.
- **Summary.** "Layers 0–4 are complete in the stated generality" is qualified for Layer 3's design.
- **Maintainer note.** The wording of roadmap item 3.1 should be reconciled with the implemented design.

## RT-AUDIT-08/2 (medium, error): the blocker for density zero (ADS Layer 5)

In the note of the target "convergence and density-zero statements…":
- "since Layer 7's predicate does not exist yet" is replaced by the finding's text.
- The real blocker is now named: the divergence of `primeIdealZetaSum univ s` as `s → 1⁺`. The note also names the existing predicate, Mathlib's `NumberField.Set.HasDirichletDensity` (DirichletDensity.lean:82).

## RT-AUDIT-08/3 (medium, error): the prerequisites of 7.2 (ADS Layer 7)

In the target "the all-prime normalization…" (stays `absent`):
- **Citations added.** `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT` (DedekindZeta.lean:77) and `TauCeti.MultiplicativeIdealWeight.tsum_prime_pow_eq_tsum_neg_log_one_sub` (EulerProduct/Logarithm/Basic.lean:78), both related.
- **Citation removed.** The finding says `primeIdealZetaSum_higherDegreePrimes_le` should be kept only as material for 5.3/7.3, not as the 7.2 prerequisite. Keeping it would also have made six citations. It stays cited under Layer 5, and this note names it with its location (ResidueDegree.lean:250).
- **Note.** The "two prerequisites are in place" sentence is replaced by the finding's text. It says the bounded contribution of prime powers with `j ≥ 2` is missing, and that it follows from `summable_absNorm_rpow_primes_of_one_lt` (Convergence.lean:92).

## RT-AUDIT-08/4 (medium, library-claim): ideal counts come from Mathlib (ADS Layer 5, summary)

- **Library value.** The target "two-sided linear bounds for the ideal count…" goes from `tauceti` to `both`.
- **Citation added.** `NumberField.Ideal.tendsto_norm_le_div_atTop₀` (Ideal/Asymptotics.lean:128, more general).
- **Note.** It gains the finding's sentence on how the bounds are derived.
- **Summary.** "but nothing ideal-indexed" is replaced by the finding's text: the ideal-count asymptotic, `dedekindZeta` with its residue theorem and norm-fibre finiteness, but no ideal-indexed arithmetic-function, convolution or Euler-product API.

## RT-AUDIT-08/13 (high, missing): the Riemann bilinear relations (A5)

In the target "Riemann bilinear relations and algebraicity of polarized complex tori":
- **Library value.** `absent` → `partial`.
- **Citations added.**
  - `TauCeti.Hodge.isPolarization_of_weilOperator_invariant_on_realPoints_of_pos` (WeightOne/Polarization.lean:122, exact).
  - `IsPolarization.isOrthogonal_weilOperator` (WeilOperator.lean:298, more general).
  - `IsPolarization.integralFormBaseChange_weilOperator_self_pos` (HodgeForm.lean:255, more general).
  - `AlmostComplexStructure.hodgeStructure` (WeightOne/Basic.lean:186, related).
- **Note.** Rewritten as the finding asks. The only things missing are the complex torus as an analytic space and algebraicity. The note also names the genus-one worked instance `StandardWeightOne.isPolarization_riemannForm` (WeightOne/Standard.lean:346).
- **Cap.** The finding asks to keep both PeriodPair citations, which would make six. Following the recipe's rule of dropping the least specific existing citation, `PeriodPair.lattice` (Weierstrass.lean:79) moved into the note with its location. `PeriodPair.derivWeierstrassP_sq`, the Weierstrass equation behind algebraicity, is kept.

## RT-AUDIT-08/14 (medium, library-claim): the weight-one dictionary and the Tate twist (A5)

In the target "the equivalence with polarizable integral Hodge structures…" (stays `partial`):
- **Citations added.** `AlmostComplexStructure.hodgeStructure` (:186), `HodgeStructureOn.eigenspace_weilOperator_I` (WeightOne/Basic.lean:106), `HodgeStructureOn.tateTwist` (Tate/Twist.lean:57) and `IsPolarization.tateTwist` (:206), all related.
- **Note.** The last sentence is replaced by the finding's text. It also names `HodgeStructureOn.dual` (Dual.lean:76) and `StandardWeightOne.polarization` (WeightOne/Standard.lean:410).
- **Cap.** Eight citations would have resulted. `IsPolarizable` is kept. Three citations moved into the note with their locations: `TauCeti.Hodge.IsPolarization` (Polarization.lean:70), `TauCeti.Hodge.Polarization` (:157) and `PeriodDomain.Point` (PeriodDomain.lean:71). `PeriodDomain.Point` is now cited under the Siegel target (/15).

## RT-AUDIT-08/15 (medium, missing): the Siegel space as a period domain (A5)

In the target "the Siegel universal analytic family…" (stays `absent`):
- **Citations added.** All five are related: `PeriodDomain.Point` (PeriodDomain.lean:71), `TauCeti.BilinForm.isometryGroup` (BilinearForm/Isometry.lean:156), `SymplecticForm.Compatible` (Symplectic/AlmostComplex.lean:455), `SymplecticForm.exists_compatible` (Symplectic/ExistsCompatible.lean:188) and `LocalCoefficientSystem.monodromyRepresentation` (LocalCoefficient.lean:267).
- **Note.** "There is no Siegel upper half space in either library" is replaced by the finding's text: the Siegel space exists only as a set, with its monodromy group, and without a manifold structure, universal family or level structures. The list of `Siegel` declarations is kept.
- **Duplicate added.** `tauceti:TauCetiRoadmap/HodgeStructures#milestone-l3--period-domain-points-the-symmetry-group`, with the finding's note.

## RT-AUDIT-08/16 (medium, other): the A5 verdict

- **Verdict.** `not built` → `partly built`, as the finding asks.
- **Why.** After /13 and /14, two targets are partial with real content, and a third has substantial related material. The layer has no verdict-reason field. The reason ("the linear-algebra (Hodge-theoretic) half is built; the analytic half is absent") is now in the roadmap summary, under /22.

## RT-AUDIT-08/17 (medium, library-claim): isogenies over an affine base (A3)

In the target "isogenies of abelian schemes and their duals" (stays `partial`):
- **Citations added.** `TauCeti.GroupScheme.IsIsogeny` (CentralIsogeny/Basic.lean:161), `.comp` (:223) and `.baseChange` (CentralIsogeny/BaseChange.lean:63), all special case. `Scheme.Hom.finrank` is added under /18.
- **Note.** It gains the finding's paragraph on the affine-base relative definition, including `isIso_of_mono` (CentralIsogeny/Isomorphism.lean:116), and on what is missing.
- **Cap.** Nine citations would have resulted, so four existing ones moved into the note with their locations: `AbelianVariety.IsIsogeny.comp` (AbelianVariety/Isogeny.lean:122), `.baseChange` (:140), `isIsogeny_mulBy_neg_one` (:150) and `TauCeti.Isogeny.degree` (EllipticCurve/Isogeny/Degree.lean:99). `AbelianVariety.IsIsogeny` is kept as the field case.
- **The `[n]` target.** "Nothing is stated over a base" now reads "Nothing about `[n]` is stated over a base".

## RT-AUDIT-08/18 (medium, missing): the rank of a morphism (A3, A6)

- **Isogeny target (A3).** `Scheme.Hom.finrank` (FlatRank.lean:88, related) is added. "carry no degree" is replaced by the finding's sentence: the degree is locally constant and stable under base change, there is no tower formula, and `AbelianVariety.IsIsogeny` would need flatness first.
- **The `[n]` target (A3).**
  - Added: `Scheme.Hom.finrank` (:88) and `Scheme.Hom.isLocallyConstant_finrank` (:231), both related.
  - Note: "the rank notion is Mathlib's `Scheme.Hom.finrank`; nothing computes it for `mulBy`".
  - Cap: six citations would have resulted, so `AbelianVariety.mulBy` (related, the least specific) moved into the note as End/Basic.lean:243.
- **A6 target.** `Scheme.Hom.finrank` is added. "no degree of an isogeny of abelian varieties" now reads "no degree formula…; the degree itself is available as Mathlib's `Scheme.Hom.finrank` once flatness is known".

## RT-AUDIT-08/19 (medium, library-claim): Cartier duality is over an affine base (A3, A4, summary)

- **Fit.** `cartierDuality` (FiniteLocallyFree.lean:232) goes to `special case` under both A3 and A4.
- **A3 note.** It says: over an arbitrary affine base `Spec R`, with double duality and base change; globalization is not done.
- **A4 note.** It says: "Only Cartier duality over an affine base is present".
- **Summary.** It adds "over an affine base".

## RT-AUDIT-08/20 (medium, library-claim): the Picard group of a ring (A2, A0, summary)

- **A2 target 1.**
  - Added: `CommRing.Pic.functor` (PicardGroup.lean:604) and `CommRing.Pic` (:429), both related.
  - Note: rewritten as the finding asks. It names `mapAlgebra` (:553) and `relPic` (:616), and the Tau Ceti invertible-sheaf objects with their locations. The `IsPicardLindelof` sentence is deleted.
- **A0 note.** The nearest objects are now Mathlib's `CommRing.Pic` / `CommRing.Pic.functor` and Tau Ceti's `LineBundleClass X`, and "a Picard functor" reads "a relative Picard functor".
- **A2 last target.** `WeierstrassCurve.Affine.Point.toClass` (EllipticCurve/Affine/Point.lean:752, related) is added. The note describes it as the field-level injection into the class group, with `toClass_injective` (:797).
- **Summary.** "Picard functor" is qualified as "relative Picard functor", under /22.
- **Library values.** The targets stay `absent`.

## RT-AUDIT-08/21 (medium, library-claim): the base-general language (A1)

- **A1 target 1.**
  - Added: `AlgebraicGeometry.SmoothOfRelativeDimension` (Morphisms/Smooth.lean:130) and `AlgebraicGeometry.GeometricallyConnected` (Geometrically/Connected.lean:40), both related.
  - Note: "no relative-dimension function exists" is replaced by the finding's text.
  - Cap: six citations would have resulted, so `AlgebraicGeometry.smooth_of_grpObj` moved into the note as Group/Smooth.lean:64. The note already described it as an input to the field case.
- **A1 target 4.** `CategoryTheory.Functor.mapGrp` (Monoidal/Grp.lean:611, related) is added. The note gains the sentence that group-scheme homomorphisms, products and base change over any base are `Grp (Over S)` with `(Over.pullback f).mapGrp`.

## RT-AUDIT-08/22 (medium, library-claim): the AbelianSchemes summary

The finding's rewrite is applied in full.
- **The "no … anywhere" list.** It now reads: no abelian scheme over a base, relative Picard functor, dual, geometric polarization, and so on. It then names Mathlib's base-general language and the Picard group and functor of rings.
- **"What exists".** It now names the affine-base group-scheme material.
- **"A1 and A3 … only over a field".** It now reads: A1 and A3 have real coverage, over a field and, for A3's isogenies and Cartier duality, over affine bases; A5 has the Hodge-theoretic half.
- **Cartier duality.** Qualified "over an affine base", under /19.

## RT-AUDIT-08/26 (medium, library-claim): nonabelian Čech H¹ (NC.3, summary)

- **Citations added.** In "torsor-valued `H¹`…" (stays `partial`): `CategoryTheory.PresheafOfGroups.H1` (NonabelianCohomology/H1.lean:197) and the optional `PresheafOfGroups.OneCocycle` (:123), both related.
- **Note.** The last two sentences are replaced by the finding's text. The correct first half, the TODO and the `CommGroup` requirement, is kept.
- **Summary.** "no nonabelian `H¹`" now reads "no nonabelian continuous Galois cohomology (Mathlib has only Čech H¹ of a presheaf of groups, `PresheafOfGroups.H1`)".

## RT-AUDIT-08/27 (medium, library-claim): the étale fibre functor of any scheme (NC.0, summary)

- **Citations added.** In NC.0 target 1 (stays `partial`): `AlgebraicGeometry.Scheme.pointSmallEtale` (Sites/EtalePoint.lean:64, more general) and `AlgebraicGeometry.Scheme.Etale` (Morphisms/Etale.lean:155, related).
- **Note.** "nothing covers a non-affine scheme (…)" is replaced by the finding's text.
- **Cap.** Seven citations would have resulted, so two of the three related Galois-category citations moved into the note with their locations: `PreGaloisCategory.FiberFunctor` (Galois/Basic.lean:83) and `PreGaloisCategory.IsFundamentalGroup` (Galois/IsFundamentalgroup.lean:232). `PreGaloisCategory` is kept.
- **Summary.** The same correction is made there.

## RT-AUDIT-08/28 (medium, missing): group extensions and splittings (NC.0)

- **Target 3 (path torsors).** `GroupExtension.Splitting` (GroupExtension/Defs.lean:271) and `GroupExtension.ConjClasses` (GroupExtension/Basic.lean:217) are added, both related. The note gains the finding's sentence.
- **Target 2 (the exact sequence).** `GroupExtension` (Defs.lean:74, related) is added. The note gets a one-sentence gloss.
- **Library values.** Both targets stay `absent`.

## RT-AUDIT-08/29 (medium, duplicate): NC.0 duplicates

- **Added.** `tauceti:TauCetiRoadmap/BelyiMaps#layer-12-profinite-powers-the-fundamental-group-and-the-branch-cycle-theorem` and `ColemanIntegration:L2`, with the finding's notes.
- **IG.0 entry.** Its note now says that IG.0 also owns base-point change as explicit equivalences, which overlaps NC.0's path-torsor target.

## RT-AUDIT-08/30 (medium, error): curves through their function fields (NC.1)

- **Target 2.**
  - Added, all related: `TauCeti.riemannRochSpace` (RiemannRoch/Basic.lean:83), `TauCeti.Place.card_decompositionSubgroup` (Place/Extension/Decomposition.lean:88), `TauCeti.Place.decompositionField` (:102) and `ValuationSubring.decompositionSubgroup` (Valuation/RamificationGroup.lean:30).
  - Note: rewritten as the finding asks. It names `residueAut` (Place/Extension/Inertia.lean:124) and says that the WeilDivisor linear systems are the weaker version.
- **Target 1.** `TauCeti.genus` (RiemannRoch/Genus.lean:189, related) is added. "or hyperbolic curves" now reads "or a notion of hyperbolic curve (the genus of a function field exists, `TauCeti.genus`)".
- **Library values.** All targets stay `absent`.

## RT-AUDIT-08/31 (medium, duplicate): NC.3 duplicates

Added with the finding's notes:
- `SelmerIwasawaCohomology:L2`
- `SelmerIwasawaCohomology:L4`
- `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`
- `HeightsRationalPointsAndObstructions:RP.3`

## RT-AUDIT-08/36 (medium, other): the Anabelian summary

- **Absence sentences.** Both are corrected, under /26 and /27.
- **Usable inputs.** The sentence now also lists:
  - Mathlib's étale fibre functor at a geometric point.
  - Group extensions, splittings and their conjugacy classes.
  - Nonabelian Čech H¹ and ℓ-adic cohomology of schemes (`Scheme.EllAdicCohomology`).
  - Tau Ceti's function-field theory of curves: Riemann–Roch spaces, genus, regular differentials, Cl⁰, and decomposition and inertia groups.
- **Verdicts.** No layer verdict changes.

## RT-AUDIT-08/37 (medium, other): the R35.1 verdict and the product-formula owner

- **Verdict.** R35.1 goes from `not built` to `partly built`. Its product-formula target is present, and the other targets are absent or partial.
- **Note.** The sentence on "another owner (`ArithmeticHeights #287`)" is replaced by the finding's text: R35.1 asks for the formula; it is a baseline citation, not a node; and ArithmeticHeights #287 is not an atlas roadmap.

## RT-AUDIT-08/38 (medium, library-claim): invertible modules (R35.1)

In the target "hermitian line and vector bundles…":
- **Library value.** `absent` → `partial`.
- **Citations added.** `Module.Invertible` (PicardGroup.lean:77), `CommRing.Pic` (:429) and `ClassGroup.equivPic` (:876), all related.
- **Note.** Replaced by the finding's text.

## RT-AUDIT-08/39 (medium, missing): arithmetic-degree inputs (R35.1)

In the target "arithmetic degree of a hermitian bundle…":
- **Library value.** `absent` → `partial`.
- **Citations added.** `NumberField.absNorm_mul_finprod_finitePlace_eq_one` (Height/NumberField.lean:200) and `NumberField.mixedEmbedding.covolume_idealLattice` (Discriminant/Basic.lean:134), both related.
- **Note.** Replaced by the finding's text.

## RT-AUDIT-08/40 (medium, missing): local degree formulas (R35.1)

In the target "base-change and degree formulas…" (stays `partial`):
- **Citations added.** All related: `NumberField.InfinitePlace.sum_inertiaDeg_eq_finrank` (Completion/Ramification.lean:125), `NumberField.InfinitePlace.mult_mul_finrank` (:87) and `Ideal.sum_ramification_inertia_eq_finrank` (RamificationInertia/Basic.lean:72).
- **Note.** It ends with the finding's text.
- **Cap.** Eight citations would have resulted, so three related height citations moved into the note with their locations: `Height.mulHeight` (Height/Basic.lean:233), `Height.mulHeight_comp_equiv` (:256) and `Projectivization.mulHeight` (Height/Projectivization.lean:46). `NumberField.mulHeight_eq` and `absMulHeight₁` are kept. `Projectivization.mulHeight` stays cited under R35.5.

## RT-AUDIT-08/41 (medium, duplicate): GlobalNumberFields layer 0 (R35.1, summary)

- **Duplicate added.** `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-0-places-completions-and-the-product-formula`, with the finding's note.
- **Product-formula target.**
  - Library value: `mathlib` → `both`.
  - Added: `TauCeti.GlobalNumberFields.finprod_normalizedAbsValue_eq_one` (Global/Places/Basic.lean:209, exact) and `normalizedAbsValue` (:80, related).
  - Cap: seven citations would have resulted, so two moved into the note: `Height.AdmissibleAbsValues` (the only `more general` citation, Height/Basic.lean:78) and the translation lemma `NumberField.prod_archAbsVal_eq` (Height/NumberField.lean:87).
- **Extension target.** The note says that the place-level functoriality belongs to that Tau Ceti layer.
- **Summary.** It names the layer as the existing owner.

## RT-AUDIT-08/43 (medium, library-claim): cotangent spaces at the identity (R35.2, summary)

- **Citations added.** All related: `TauCeti.AlgebraicGeometry.AbelianVariety.TangentSpace` (AbelianVariety/TangentSpace.lean:85), `TauCeti.AlgebraicGeometry.ZariskiCotangentSpace` (TangentSpace/Basic.lean:60) and `TauCeti.Bialgebra.CotangentSpace` (AlgebraicGroup/Tangent/Cotangent.lean:57).
- **Note.** Replaced by the finding's text. It also carries the R11.1 supplier sentence, under /48.
- **Summary.** It now reads "no module of invariant differentials of an abelian scheme over a Dedekind base".

## RT-AUDIT-08/47 (medium, library-claim): the finite-flat side and the `[n]` check (R35.4)

- **Target "treatment of primes dividing the isogeny degree…"** (stays `partial`).
  - Added, all related: `TauCeti.Bialgebra.CotangentSpace` (:57), `TauCeti.CommHopfAlgCat.IsIsogeny.isIsogeny_kernelSpec_to_trivial` (Isogeny/Kernel.lean:56) and `TauCeti.CommHopfAlgCat.IsCentralIsogeny.kernelFiniteLocallyFree` (:84).
  - Note: replaced by the finding's text.
- **Target "the isogeny formula…"** (stays `absent`).
  - Added, all related: `TauCeti.GroupScheme.IsIsogeny` (CentralIsogeny/Basic.lean:161), `TauCeti.Isogeny.pullbackDifferential_mulByIntIsogeny_invariantDifferential` (MulByInt/Separability.lean:47) and `TauCeti.Isogeny.degree_mulByIntIsogenyOfNeZero` (MulByInt/Degree.lean:79).
  - Note: it now names the relative notion, and says that the dimension-one inputs `[n]^*ω = nω` and `deg[n] = n²` exist over a field.
  - Cap: six citations would have resulted, so `AbelianVariety.IsIsogeny` moved into the note as AbelianVariety/Isogeny.lean:61.

## RT-AUDIT-08/48 (medium, duplicate): supplier and consumer entries removed (R35.1–R35.6)

- **Removed from `duplicates`.** Six entries, as the finding asks:
  - GZ.2 from R35.1
  - R11.1 from R35.2
  - EllipticCurves layer 8 from R35.3
  - M6 and C5 from R35.5
  - RP.0 from R35.6
- **Recorded as handoffs in target notes.** The finding allows keeping the relations this way.
  - GZ.2 is a consumer, in R35.1's arithmetic-intersection note.
  - R11.1 is a supplier, in R35.2's Hodge-bundle note.
  - EllipticCurves layer 8 routes the Faltings height here, in R35.3's first note.
  - M6 and C5 are suppliers, in R35.5's boundary note.
  - RP.0 only shares the Northcott import, in R35.6's constant-dependence note.
- **Kept.** ModularCurvesPartII:R12.5 (R35.2), FaltingsFinitenessAndIsogenyTheorems:R28.2 (R35.4), R28.1 (R35.6) and HeightsRationalPointsAndObstructions:RP.0 under R35.1.
- **Empty lists.** R35.3 and R35.5 now have none.

## RT-AUDIT-08/51 (medium, library-claim): the power map's height identity (DY.1)

- **Target "the error bound…"** (stays `partial`).
  - Added: `Height.logHeight₁_pow` (Height/Basic.lean:622) and `Height.logHeight_pow` (:595), both special case.
  - Note: gains the finding's sentence.
  - Cap: seven citations would have resulted, so the two parallelogram-law citations moved into the note: `canonicalHeight_parallelogram_law` (CanonicalHeight.lean:211) and `approx_parallelogram_law` (MordellWeil/NaiveHeight.lean:146).
- **Target "preperiodicity from zero canonical height…"** (stays `partial`).
  - Added: `Height.logHeight₁_pow` (related).
  - Note: "has no carrier" is replaced by the finding's text.
  - Cap: six citations would have resulted, so the abstract `Northcott` class (Order/Northcott.lean:36) moved into the note.

## RT-AUDIT-08/52 (medium, library-claim): iteration as a morphism (DY.0, DY.3, DY.5)

- **Target "iteration of a self-map…"** (stays `partial`).
  - Added: `CategoryTheory.End.monoid` (Endomorphism.lean:73, more general) and `Polynomial.natDegree_iterate_comp` (Degree/Lemmas.lean:389, special case).
  - The optional sixth citation, `Polynomial.iterate_comp_eval` (Eval/Degree.lean:222), is named in the note, as the finding allows. So is `TauCeti.AlgebraicGeometry.AbelianVariety.mulBy` (End/Basic.lean:243).
  - The "scheme-theoretic layer is absent" sentence is replaced by the finding's text.
  - Cap: `Function.IsPeriodicPt.iterate` (PeriodicPts/Defs.lean:132) and `Function.IsPeriodicPt.gcd` (:157) moved into the note.
- **DY.3 and DY.5.** The dynatomic note and the tree note now say that `p.comp^[n] X - X` and `p.comp^[n] X - C α` are available as polynomials.

## RT-AUDIT-08/53 (medium, library-claim): rational functions, degree and resultant (DY.0)

In the target "rational functions on `P¹`…" (stays `partial`):
- **Citation replaced.** `Polynomial.Monic.resultant_deriv` becomes `RatFunc.isCoprime_num_denom` (RatFunc/Basic.lean:991, related). The discriminant lemma is named in the note with its location.
- **Citation added.** `RatFunc.finrank_eq_max_natDegree` (RatFunc/IntermediateField.lean:162, exact).
- **Fit.** `Polynomial.resultant` is relabelled `special case`.
- **Note.** It names `resultant_map_map` (Resultant/Basic.lean:140), `exists_mul_add_mul_eq_C_resultant` (:874), `WeierstrassCurve.isCoprime_Φ_ΨSq` (Coprimality.lean:100) and `WeierstrassCurve.finrank_adjoin_Φ_div_ΨSq` (RatFuncDegree.lean:65). Its last sentences are the finding's text. The remark that `HasGoodReduction` is Weierstrass-only is kept.

## RT-AUDIT-08/54 (medium, missing): the Lattès map in all but name (DY.6)

In the target "complete power-map and elliptic/Lattès worked examples" (stays `partial`):
- **Citations added.** All related: `WeierstrassCurve.zsmul_point_eq_smulEval` (DivisionPolynomial/ZSMul.lean:1013), `WeierstrassCurve.finrank_adjoin_Φ_div_ΨSq` (RatFuncDegree.lean:65) and `Height.logHeight₁_pow` (Height/Basic.lean:622).
- **Cap.** The target now has exactly five citations, so `neronTatePairing` did not need to be dropped.
- **Note.** The last clause is replaced by the finding's text.

## RT-AUDIT-08/55 (medium, error): effective height bounds (DY.3)

In the target "certified enumeration…" (stays `absent`):
- **Citations added.** All related: `Height.logHeight_eval_le` (Height/MvPolynomial.lean:368), `Height.logHeight_eval_ge` (:491) and `Rat.mulHeight₁_eq_max` (Height/NumberField.lean:533).
- **Note.** Replaced by the finding's text.

## RT-AUDIT-08/56 (medium, missing): the continuous action over a field (DY.5)

In the target "the continuous Galois action…" (stays `partial`):
- **Citation added.** `stabilizer_isOpen_of_isIntegral` (FieldTheory/KrullTopology.lean:260, related). The target has four citations, so `functorToAction` is kept.
- **Note.** "Only general machinery" now says that, over a field, the machinery already gives the continuous action on each finite level. The last sentence is replaced by the finding's text.

## RT-AUDIT-08/57 (medium, other): the Dynamics summary

All four corrections are applied as the finding words them:
- (a) Rational functions with a coprime presentation, their degree and the formal-degree resultant exist; a binary-form carrier, iteration and dynamical good reduction do not.
- (b) "the Néron–Tate package (all but the uniqueness statement)".
- (c) "DY.2–DY.6 are unbuilt apart from elliptic special cases and the finite-level Galois action".
- (d) A new sentence on the power-map height identity and the Lattès map.

## Checks

- `python3 research/blueprint/intake.py check-files research/blueprint/audit/AUDIT-08.result.json`: 1 file, 0 problems.
- **Added citations.** All 61 distinct added citations resolve in the pinned `declarations.tsv` (library, full name, file, line). Each was read at its line in the pinned tree.
- **Pre-existing unresolved citations.** Two citations in the file do not resolve, and both were already there: `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality` and `cartierDualDualIso`. The index lists them without the `TauCeti` prefix, although the file declares them inside `namespace TauCeti` (FiniteLocallyFree.lean:65). This is a known index defect, not a change of this job. For `cartierDuality`, this job changes only the fit.
- **Script checks.**
  - Every text substitution was asserted to match exactly once.
  - Every target has at most five declarations, with no repeated names.
  - The `review`, `job` and `baseline` fields are unchanged.
  - The file is dumped with `indent=1`, `ensure_ascii=False`; the original had no trailing newline, and none was added.
- **Diff.** `git diff --stat` touches only `research/blueprint/audit/AUDIT-08.result.json`, plus this report as a new file.
- **Lean.** No Lean file is involved, so nothing was compiled.
