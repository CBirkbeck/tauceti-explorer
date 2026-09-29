# RT-AUDIT-13: fixes

Fixer: Claude Code, session `cc-f805bf`, 29 September 2026 (issue #4008, job FIX-RT-AUDIT-13).
- **Findings and verdicts.** `RT-AUDIT-13.result.json` and `RT-AUDIT-13.review.json`. The red team made 54 findings. The review confirmed 52 and rejected 2 (/14, /42).
- **Scope.** This job covers the 18 confirmed findings of high or medium severity: /1, /2, /4–/6, /11, /12, /20–/24, /32–/34, /41, /43, /44. The 34 confirmed low-severity findings are outside the fix job (PROTOCOL.md section 17).
- **Where the changes are.** Everything is in `research/blueprint/audit/AUDIT-13.result.json`; no other file changes. The audit's `review` object and every layer verdict are unchanged. Library values change only where a finding says so: AA.3's two reduction-theory targets go from `absent` to `partial`, and two new targets are added to ALS.5.

**Verification.**
- I read every added declaration at Mathlib 082e2d3 / Tau Ceti f790474, at the stated file and line, and each one resolves in the pinned `declarations.tsv` under the stated full name.
- Anonymous instances are not in the index, so they are cited in notes by file and line: the `CommRingCat.HomTopology` topology, the units-group instance, the `CuspOrbits` finiteness, the invariant measure on ℍ, and Tau Ceti's PSL(2,ℝ) proper discontinuity.
- Every layer id added to a `duplicates` list is an atlas stage.
- Every target has at most five declarations. Where a finding adds more, the displaced or surplus citations are named in the note with file and line.

## RT-AUDIT-13/1 (high, library-claim): G(𝔸) topology (AA.1, summary)

**Target "The adelic points functor…".**
- Citations added: `CommRingCat.HomTopology.isEmbedding_hom` (Ring/Topology.lean:59) and `continuous_precomp` (:64), both related, and `Matrix.SpecialLinearGroup.isTopologicalGroup` (Group/Matrix.lean:125, special case).
- Per the review, I cite the named neighbour `isEmbedding_hom`, not the namespace `CommRingCat.HomTopology`. The scoped instance (:50) and the units instance (Group/Units.lean:102) are anonymous, so the note names them by file and line.
- Displaced into the note with locations: `IdeleGroup.unitEmbedding`, `RestrictedProduct.evalRingHom` and `RestrictedProduct.unitsEquiv`.
- "Missing: any topology on G(𝔸)…" is replaced by the finding's text. It also names Tau Ceti's `GeneralLinear.pointsMulEquiv`.

**Target "Compatibility…".**
- Citation added: `isClosedEmbedding_precomp_of_surjective` (:94). `isEmbedding_pushout` (:151) is named in the note, to stay within five.
- The note now says that the closed-embedding and product statements exist for ring-hom points, and that only their restriction to K-algebra points is missing.

**Library values.** Both targets stay `partial`, and the layer stays `not built`.

**Summary.** Both phrases are replaced as the finding asks.

**Consequence in another note.** The target "Base change and restriction-of-scalars…" also said "no topology on adelic points". Under /5 below it now reads "no group topology on the adelic points of a general G identified with the restricted product".

## RT-AUDIT-13/2 (medium, library-claim): classical SL₂ reduction theory (AA.3, AA.2, summary)

**"Finitely many Siegel sets cover…".**
- Library value: `absent` → `partial`.
- Citations: `ModularGroup.exists_smul_mem_fd` (Modular.lean:426) and `cases_of_mem_fd_smul_mem_fd` (:695), both special case.
- The note adds compact truncations (:960) and the `Finite (CuspOrbits 𝒢)` instance (Cusps.lean:204), and says: SL₂(ℤ)\ℍ only, no general G, no adelic statement.

**"Finite volume of G(F)\G(A)^1".**
- Library value: `absent` → `partial`.
- Citations: Tau Ceti `ModularGroup.volume_fd_lt_top` (:112) and `isFundamentalDomain_fdo` (:230), both special case. The covolume citations are kept.
- The note names the subgroup tiling (:257).

**"Siegel sets and their height estimates".**
- Library value stays `absent`.
- Citations added: `ModularGroup.fd` (:367), `three_le_four_mul_im_sq_of_mem_fd` (:400) and `exists_max_im` (:278).
- The note now says the SL₂(ℤ) standard domain and its height bound exist, but no Siegel set of a reductive group does.

**AA.2 "Invariant quotient measures…".** The note names the GL₂(ℝ)-invariant measure on ℍ (UpperHalfPlane/Measure.lean:89) as the one concrete non-normal quotient. It is anonymous, and the target already has five citations, so it is named in the note only.

**Summary.** It now reads "reduction theory beyond the classical SL₂(ℤ) fundamental domain, its finite volume and the finiteness of cusps", followed by the list for general G.

**Layer verdict.** AA.3 stays `not built`.

## RT-AUDIT-13/4 (medium, duplicate): AA.3 duplicates

Added:
- `AutomorphicFormsOnReductiveGroups:AF.0`. Following the review, the note calls it a consumer that restates the estimates.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.3`.

## RT-AUDIT-13/5 (medium, duplicate): AA.1 duplicates and base-change note

- Added `HeightsRationalPointsAndObstructions:RP.2`, GlobalNumberFields layer 8 (`adeleBaseChangeEquiv`) and GlobalNumberFields layer 5 (discreteness).
- The base-change note now says that 𝔸_E ≅ E ⊗_F 𝔸_F is planned in GlobalNumberFields layer 8.

## RT-AUDIT-13/6 (medium, duplicate): AA.4 duplicates

- Added `ShimuraVarieties:V1`, `ArithmeticLocallySymmetricSpaces:ALS.3`, `CompletedCohomologyPartII:CC.0` and GlobalNumberFields layer 1.
- Added `ShimuraData:D5`. As the review advises, its note records it as the supplier and owner of the neatness definition, not a rival construction.
- Added `AutomorphicBundles:B5`, the reverse entry of B5 → AA.4 that the review asks for.

## RT-AUDIT-13/11 (medium, library-claim): the p = 2 finite-flat condition can be stated (R15.4, summary)

- **Citation added.** `TauCeti.CommHopfAlgCat.geometricCharacterFunctor` (CharacterLattice/Functoriality.lean:212).
- **Note.** "cannot be stated…" is replaced by the finding's text. It names the base-change functor and `coordinateHopfAlgebraBaseChangeNatIso` (CartierDuality/BaseChange.lean:93, :150).
- **Library value.** Stays `absent`.
- **Summary.** It now lists three carriers, adding the geometric-character Galois-module functor.

## RT-AUDIT-13/12 (medium, duplicate): R15.5 duplicates reworded

Following the review's refinement, I reworded the three entries rather than deleting them:
- **ModularForms layer 8.** Now recorded as a supplier: sublayer 8W builds the integral weight-one lattice by Deligne–Serre Prop. 2.7. The accepted RS-06 lists it in R15.5's suppliedBy and keeps Lemme 6.11 with R15.5.
- **R19.1.** Now recorded as a consumer (it requires R15.5) that overlaps only the weight-one case.
- **ML.1.** Now recorded as overlapping R19.1's weight-one Artin representation and the Katz caveat, not the lemma.

The lifting-lemma target's note now says that no other atlas stage plans Lemme 6.11.

## RT-AUDIT-13/20 (medium, library-claim): the proper-action route (ALS.0)

In the target "Proper discontinuity…" (stays `partial`):
- **Citations added.** `MulAction.properSMul_of_proper_orbitMap` (ProperAction/Basic.lean:291), `properlyDiscontinuousSMul_iff_properSMul` (ProperAction/CompactlyGenerated.lean:99) and `TauCeti.isQuotientCoveringMap_quotientMk_freeLocus` (FreeLocus.lean:76).
- **Citations kept.** The two ℍ instances.
- **Citations displaced.** `ProperlyDiscontinuousSMul`, `.finite_stabilizer` and `.ofFiniteRelIndex` move into the note with their locations.
- **Named in the note.** The finding's other declarations: the Mathlib quotient covering (:244), `instChartedSpaceQuotient`, `fundamentalGroupEquiv`, `TauCeti.isOpen_freeLocus` and `isEilenbergMacLaneSpaceOne`.
- **Review corrections.** `Subgroup.instIsCyclicStabilizer` is described as related context, not a special case. The special-case statement is Tau Ceti's anonymous PSL(2,ℝ) instance (Fuchsian/ProperAction.lean:33), cited by location.
- **What is absent.** The note says what the finding asks: properness for a general reductive group, discreteness beyond SL_n(ℤ)-commensurable groups, and neatness.

## RT-AUDIT-13/21 (medium, library-claim): local systems from π₁-representations (ALS.1)

In the target "Local systems from discrete integral coefficient modules…" (stays `partial`):
- **Citations.** `TauCeti.Groupoid.singleObjEquivalence`, `Action.functorCategoryEquivalence`, `Rep.repIsoAction` and `IsQuotientCoveringMap.fundamentalGroupEquiv` are added. `TauCeti.LocalCoefficientSystem` is kept.
- **Citations displaced.** `monodromyFunctor`, `CoveringSpace.monodromyEquivalence` and `Rep` move into the note with their locations.
- **Note.** The first "Missing" clause is replaced by the three-step composition. On the review's point, the note says the composition holds per component on a disconnected space. The note also names Tau Ceti's `fiberActionEquivalence` precedent.

## RT-AUDIT-13/22 (medium, missing): level coverings (ALS.3)

- **Citations added.** `IsQuotientCoveringMap.isCoveringMap_of_comp` and `HeckeCoset.degree_eq_relIndex`, both related, as under AA.4.
- **Note.** Rewritten as the finding asks.
- **Library value.** Stays `absent`, consistent with AA.4, as the review says.

## RT-AUDIT-13/23 (medium, missing): the parent ALS.5's own targets

Two targets are added to ALS.5, both `absent`:
- "Comparison of Betti, de Rham and relative Lie algebra ((g,K)-) cohomology in characteristic zero via local systems". It cites `extDeriv` (DifferentialForm/Basic.lean:73) and `LieModule.Cohomology.twoCocycle` (Lie/Cochain.lean:155), both related. The finding calls it `LieAlgebra.twoCocycle`; the pinned full name is `LieModule.Cohomology.twoCocycle`. The note says that AF.1a owns continuous cohomology and van Est.
- "Comparison with automorphic forms (via AutomorphicSpectralTheory:AS.5)".

The `ALS.5:finite-level-duality` duplicate note now says that the parent adds these two comparisons. The verdict stays `not built`.

## RT-AUDIT-13/24 (medium, duplicate): manifold-with-corners owner (ALS.2)

- **Duplicate added.** GeometricTopology layer 1. As the review cautions, the note says it supplies the general corners/collar machinery for the half-space model, not the Borel–Serre interior homotopy equivalence itself.
- **Gluing target.** "boundary/interior lemmas" is replaced by the finding's text, and `TauCeti.isManifold_boundary` (Boundary/Charts.lean:342) is cited.

## RT-AUDIT-13/32 (medium, missing): bundle operations (B0, B4, summary)

**B0 target "Generic associated-bundle construction…".**
- Citations added: `AlgebraicGeometry.Scheme.Modules.pullback` (Modules/Sheaf.lean:182), Tau Ceti `AlgebraicGeometry.Scheme.Modules.tensorProduct` (:44), `TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorProduct` (:57) and `Bundle.ContinuousLinearMap.vectorBundle` (VectorBundle/Hom.lean:226). `fppfQuotientTorsorAction` is kept.
- Displaced into the note with locations: `isPullback_fppfQuotientTorsor` and `TauCeti.BalancedProduct`, together with `SheafOfModules.IsLocallyFree`, `VectorBundle.pullback` and the continuous-alternating-map bundle.
- The finding's paragraph is appended to the note.

**Summary.** It adds invertible sheaves and the tensor product of 𝒪_X-modules to the list of Tau Ceti inputs.

**B4 Hodge-line note.** It says that tensor powers are available through `InvertibleSheaf.tensorProduct`.

## RT-AUDIT-13/33 (medium, duplicate): ModularForms 10C (B4, B0)

- Added ModularForms 10C to the duplicates of both B4 and B0, with the finding's notes.
- Added the optional `ComplexComparisonPartII:C6` to B4. The review calls it apt.

## RT-AUDIT-13/34 (medium, duplicate): B5 duplicates

- **Added.** `ModularCurvesPartII:R14.1`, ModularForms layer 2, `AutomorphicPadicLFunctions:L3` and `ModularCurvesPartII:R13.3`.
- **Not added: `OverconvergentAutomorphicForms:O6`.** The review finds that O6 requires B5 and only compares with it, so it is a consumer. The review allows adding it only if the audit keeps a convention of listing restating consumers. Other confirmed red-team findings, such as those on AUDIT-15 and AUDIT-17, remove consumer entries, so I did not add one.

## RT-AUDIT-13/41 (medium, library-claim): the real-group side of (g,K) (AF.1, AF.1a, summary)

**(g,K) target.**
- Citations: `ContRepresentation` (Mathlib, replacing Tau Ceti's `.character`, which is now named in the note), `GroupLieAlgebra`, `lieExp`, `TauCeti.Lie.continuousAdjointRepresentation` and `TauCeti.Lie.lieSubalgebraOfSubgroup`.
- The note is rewritten as the finding asks. Per the review, it says that the exp-characterisation of Lie(K) holds for closed K.

**U(g_C) target.**
- Citation added: `LieAlgebra.ExtendScalars.instLieAlgebra` (Lie/BaseChange.lean:114). `Subalgebra.center` moves into the note with its location.
- The "complexified algebra" gap is replaced as the finding asks.

**AF.1 relative-cochains note and AF.1a identification note.** Both say that 𝔤, 𝔨 and the Ad-action exist, so only the complex is missing.

**Summary.** It gains the sentence on what exists on the real-group side.

**Library values.** Unchanged.

## RT-AUDIT-13/43 (medium, library-claim): smooth functions exist (AF.0)

- **Citation added.** `ContMDiffMap` (Geometry/Manifold/ContMDiffMap.lean:38).
- **Note.** Replaced as the finding asks.
- **Library value.** Stays `partial`.

## RT-AUDIT-13/44 (medium, error): the GL₁ adelic quotient exists (AF.2)

- **Citation added.** `NumberField.IdeleClassGroup` (AdeleRing.lean:119, special case).
- **Note.** Rewritten with the review's correction. It does not say G(𝔸) has "no topology". It says there is no group topology on G(𝔸) for a general G identified with the restricted product, no G(F)\G(𝔸), and no function space on it.
- **Library value.** Stays `absent`.

## Checks

- `python3 research/blueprint/intake.py check-files research/blueprint/audit/AUDIT-13.result.json`: 0 problems. The file parses, and every target has at most five declarations.
- Every declaration added resolves in the pinned `declarations.tsv`. Four citations in the file do not resolve, and all four were already in it: `FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality`, `Topology.RelCWComplex` and `SlashAction.slash_mul` (twice). They are known index defects, not changes of this job.
- Every text substitution and removal was asserted to match exactly once.
- No Lean file is involved, so nothing was compiled.
