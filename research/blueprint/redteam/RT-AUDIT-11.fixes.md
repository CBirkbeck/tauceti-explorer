# RT-AUDIT-11: fixes

Fixer: Claude Code, session `cc-39fac3`, 29 September 2026 (issue #4006, job FIX-RT-AUDIT-11).
- Findings: `RT-AUDIT-11.result.json`.
- Verdicts: `RT-AUDIT-11.review.json`.
- 58 findings (3 high, 22 medium, 33 low), all confirmed. All 58 are applied.

The only edited deliverable is `research/blueprint/audit/AUDIT-11.result.json`. The orchestrator merges audit fixes into the library audit (PROTOCOL.md §17).

**How the fixes were applied.**
- Where a review amended the red team's fix, the amended form was applied; the main cases are marked below.
- Every added declaration was checked against the pinned trees (Mathlib `082e2d3`, Tau Ceti `f790474`, via the local baseline copies and their declaration index): name, file and line. Auto-generated instance names were confirmed by the instance at the cited line.
- A target lists at most five declarations. Where a fix would have gone past five, the most direct evidence is listed and the rest is named in the note with its file and line: /4, /16, /17, /27, /30, /32, /36, /51, /52.
- Status changes (all required by confirmed findings):
  - absent → partial: V0 effective action (/4), V1 effective deck group (/5), Belyi 5.3 (/8), 6.1 (/9), 7.1 (/10), 8.1 Riemann sphere (/11), 14.1 (/46), EC Vélu quotient (/14), translation-invariance of ω (/15), isogeny compatibility of ĥ (/23), and the Layer 7 local-global interface (/21);
  - tauceti → partial: EC [n] (/1) and the Néron–Tate pairing and regulator (/3).
- One layer verdict changed: EllipticCurves Layer 7, not built → partly built (/2).
- One target was added (/2), and one target statement was extended (/1).

## High

**/1 (EC Layer 1, [n]).** The target statement regains the roadmap's clause "base-change compatibility", and the status goes to partial. The note says that `Isogeny.map` exists with its identity, composition and function-field square theorems, but that no comparison of the base change of `mulByIntIsogeny` with `mulByIntIsogeny` (or of the division-polynomial pullback) is stated. Per the review, the existing citations are kept, and the note separates the zero morphism in `Hom` from the carrier of nonzero finite isogenies.

**/2 (EC Layer 7, inflation-restriction).** A target is added for continuous inflation-restriction in degree one, library tauceti. It cites `explicitInfl1_injective` and `explicitInfRes_exact` (more general) and the quotient-action instance `TauCeti.continuousSMulQuotientFixedPointsOfContinuousSMul` (related), for any topological group and normal subgroup. The note names the supplier (ProfiniteCohomology Layer 5; AUDIT-23 records the same theorem) and says it does not supply the elliptic Galois module, Kummer maps or Selmer groups. By the grading rule the layer verdict goes from not built to partly built.

**/3 (EC Layer 6, Néron–Tate pairing and regulator).** The status goes from tauceti to partial and every fit to related. Tau Ceti's ĥ is half the pinned one, so the pinned pairing is 2 · `neronTatePairing` and the regulator in rank r scales by 2^r. The note keeps what transports under the rescaling (the Gram construction, basis independence, Reg = 1 in rank 0), says no normalisation adapter exists, and keeps the theorems' hypotheses.

## Medium

**/4 (V0).** The effective-action target goes to partial, citing `ratPosToPSL2R`, its central-kernel containment, the faithful PSL(2,ℝ) action and Mathlib's `forall_smul_eq_self_iff_mem_center`, all as special cases. The note says the kernel statement is a containment, not an iff. On the proper-discontinuity target, the review's selection was applied: five citations, including Tau Ceti's discrete-subgroup instance and Mathlib's proper-action criteria; the other two related declarations are named in the note. The summary now mentions the effective PSL(2,ℝ) action and proper discontinuity.

**/5 (V1, effective deck group).** Partial, citing the Tau Ceti normal-subgroup and normaliser deck-group equivalences (more general) and `deckMulEquiv` (related). Per the review, the note keeps nonemptiness and preconnectedness, and it does not identify the global deck group or a component group with K/K′.

**/6 (V1, level maps and Hecke).** `isCoveringMap_of_comp` and the free-locus covering are added to the covering target; `HeckeCoset.degree_eq_relIndex` to the Hecke target. Per the review, the note says the degree is a `Nat.card` index (zero at infinite index), and that identifying it with a geometric degree needs the finite-index and effective-action comparisons. Both stay partial.

**/7 (V1, V2 duplicates).** FuchsianOrbifolds 1 and 4 are added to V1. FuchsianOrbifolds 3 and 4 and ModularForms 10A are added to V2. The R12.3 note is corrected to RS-06's narrowed scope. Each note is scoped to rank one, as the review asked.

**/8 (Belyi 5.3).** Partial: Tau Ceti's monodromy naturality along a homeomorphism of the base (special case), plus Mathlib's covering property after a homeomorphism and after restriction (related). The note gives the h = g.symm reading from the review; pullback along an arbitrary continuous map stays missing.

**/9 (Belyi 6.1).** Partial, citing the connectedness/transitivity theorem, monodromy pretransitivity and `coveringFiberEquiv`. Per the review, the note says nonemptiness belongs to the transitive-action statement and that pretransitivity alone does not give it. The three Belyi carriers, relabeling and the triple stay missing.

**/10 (Belyi 7.1).** Partial, adding `Complex.isQuotientCoveringMap_npow`, `rootsOfUnityBallQuotientHomeomorph` and the unpointed classification. Following the review, the note does not say "the local model is built". It gives the power map and the rotation quotient with their hypotheses (e ≠ 0, r ≥ 0, path-connectedness), and lists as missing the punctured-disc restriction, the deck group ℤ/e with a chosen generator, the degree and the e-cycle monodromy.

**/11 (Belyi 8.1, Riemann sphere).** Partial, adding `Opens.instChartedSpace` (more general) and `onePointEquivSphereOfFinrankEq` (related). The anonymous `IsManifold` instance is cited by file and line in the note. The note says `equivProjectivization` is a plain `Equiv`, and that the complex atlas on `OnePoint ℂ` and the concrete U and disc wrappers are missing.

**/12, /13 (Belyi 12 duplicates).** AlgebraicCurves 8 is added for finite-level inertia, and 12.9 is told to consume it per RS-29. ProfiniteProPGroups 4 is added for ℤ_p-exponentiation; the review's caution is in the note: for a nonabelian pro-ℓ group, work in the closed procyclic subgroup, or use the rank-one universal property.

**/14 (EC Vélu quotient).** Partial, citing `relativeFrobeniusIsogeny`, its degree and the p-th-power containment. Per the review, the note keeps ExpChar p, says the containment is all that holds over an imperfect base, and says no group-scheme quotient property is inferred. Vélu and exhaustiveness stay absent.

**/15 (EC translation-invariance of ω).** Partial, citing `inv_smul_derivation_xCoord_add` as related. The note keeps the review's restrictions: the specialisation needs the Kähler naturality wrapper and nonvanishing checks, Q is affine with W_Y(Q) ≠ 0, and nontrivial 2-torsion is not covered.

**/16 (EC Layer 0, inducedPlace).** Cites the separability-free affine-model identity `sum_ramificationIdx_mul_relativeDegree_eq_finrank` (Extension.lean:293). The note says it covers places over affine places of W₂ for isogenies of elliptic curves, Frobenius included, but not the fibre over infinity. To stay within five, `Place.relativeDegree` moved from the list to the note.

**/17 (EC Layer 0.5, Galois actions).** Cites the place action `Place.instMulActionAlgEquiv` and `ramificationIdx_smul` (more general). The note says the action still has to be specialised to the constant-field extension, and that `FunctionField.map` and `Isogeny.map` transport to the conjugate curve (named in the note because of the five-entry limit). No divisor action was found.

**/18 (EC separable ⟹ unramified).** Adds `Algebra.finite_compl_unramifiedLocus` (related). Per the review, the note says it gives affine finiteness only.

**/19 (EC Layer 0.5 duplicates).** AlgebraicCurves 11 and 6 are added, scoped as the review asks: neither supplies coefficient descent, and the Cl⁰ identification and the constant-field specialisation stay with this layer.

**/20 (EC Layer 1 duplicates).** ModularCurves 1C is added, with the bridge to the function-field End carrier recorded as still needed.

**/21 (EC Layer 7, local-global).** Partial, citing Mathlib's adic and infinite-place completions (special case) and Tau Ceti's `ContinuousCohomology.res` (related). Per the review, restriction becomes the local map only after the decomposition-group comparison is built.

**/22 (EC Layer 7 duplicates and m-descent).** ProfiniteCohomology 5 is added as owner of the long exact sequence and inflation-restriction. `DiscreteShortExact.explicitDelta0` is cited in the m-descent target. The note says the generic boundary map gives neither Selmer finiteness nor the Selmer–Ш sequence.

**/23 (EC ĥ and isogenies).** Partial, citing `canonicalHeight_zsmul` (special case) and `degree_mulByIntIsogeny` (related), with the review's hypotheses and its remark that the finite-isogeny carrier excludes the zero map. The general comparison is recorded as absent packaging.

**/24 (EC Layer 4.5a, localisation instances).** Adds Mathlib's `localizationAlgebraOfSubmonoidLe` and `localization_isScalarTower_of_submonoid_le` (more general). The note says only the registration for an arbitrary K is missing, and that it must use compatible structures, not conflicting global instances. Stays partial.

**/25 (EC Layer 5 duplicates).** LanglandsParameterStacks LP0 and AnabelianGeometry NC.3 are added. The notes use the review's qualified wording: only a general cocycle and pointed-cohomology core is shared, and ownership does not transfer.

## Low

**/26 (V1 topology).** Adds `MulAction.instChartedSpaceQuotient`, `t2Space_of_properlyDiscontinuousSMul_of_t2Space` and the free-locus local homeomorphism (related). The note keeps the hypotheses the review lists (Hausdorff, locally compact, continuous, properly discontinuous, free for the atlas) and the smooth-compatibility TODO. Stays absent.

**/27 (V0 reduction theory).** Adds `cases_of_mem_fd_smul_mem_fd`. The review's selection was applied: the coset tiling and the narrow-class-group finiteness are named in the note, since the target already had four citations. The note says the tiling is a finite covering only at finite index.

**/28 (V2).** The finite-generation target cites the finite-index Sturm bound and finite-dimensionality with their hypotheses. The note says finiteness of each graded piece does not give finite generation. The boundary target cites `CuspOrbits`, and its anonymous `Finite` instance by file and line.

**/29 (V3).** Adds Schwarz–Pick and removable singularities to the Borel-extension target, and Mathlib's `IsInvariant` integrality and orbit theorems to the all-levels target, all related. Both stay absent, with the review's caveats.

**/30 (V4 Artin normalisation).** Adds `autToPow_eq_absNorm` (special case). The genus-field kernel and surjectivity theorems are named in the note as related evidence (five-entry limit). The note replaces "reciprocity is missing" by "general reciprocity and the named Milne conversion are missing".

**/31 (V5).** "monoids" is corrected to "rings", citing `End.instRing`. Stays absent: a ring instance gives neither End ⊗ ℚ nor a CM embedding.

**/32 (R25.1 different).** Cites `aeval_derivative_mem_differentIdeal`, with `conductor_mul_differentIdeal` in the note (five-entry limit). The note says this is ideal divisibility, not a numerical torsion-field bound.

**/33 (R25.1 Minkowski).** Fits are refined as the review says: `abs_discr_ge'` exact, `abs_discr_ge` and `abs_discr_gt_two` related, `rootDiscr` related. `abs_discr_rpow_ge_of_isTotallyComplex` is added (special case).

**/34 (V0 duplicates).** FuchsianOrbifolds 0 and AdelicAlgebraicGroups AA.5 are added, scoped to GL₂/ℚ. The adelic/classical comparison stays missing.

**/35 (V8 duplicates).** R12.3 is added for the compactification, q-parameter and cusp-locus comparison. V8 keeps the canonical-model compatibility. The note keeps the prime-level PR81 scope and RS-06's exclusion of the R12.3–R12.6–R13.4b cycle.

**/36 (Belyi 5.4, 5.8).** 5.4 had three citations. `HomotopyEquiv.fundamentalGroupMulEquiv` and `windingNumber_eq_of_pathHomotopy` are added; `Circle.fundamentalGroupMulEquiv` is named in the note (five-entry limit). 5.8 cites the circle value, concatenation and argument-increment theorems for the winding number. As the review asks, the note keeps the piecewise-C¹, avoidance, nonzero-radius and principal-value hypotheses, and says the `Real.Angle` identity fixes the winding number only modulo an integer.

**/37 (Belyi 6.2).** Cites `isTransitiveAction_fiberAction_iff_connectedSpace`. The review corrected the red team's dependency list: the note keeps 5.6 (needed to read the π₁-action as a triple) alongside 5.1, 5.2 and 6.1.

**/38 (Belyi 6.4).** Adds `Deck.monodromy_smul` and `fiberActionFunctor_isEquivalence`. The note says lifting an equivariant permutation uses fullness and faithfulness under the classification hypotheses, and that the centraliser identification is still missing.

**/39 (Belyi 3.2).** Adds the decide-checked `DihedralGroup 3` structure-constant table: entries 2 and 0 give 6 and 0. Per the review, this needs transport along an explicit D₃ ≅ S₃ with the classes matched.

**/40 (Belyi 8.3).** Cites `IsCoveringMapOn.of_isLocalHomeomorphOn` with the red team's note. Stays absent.

**/41 (Belyi 8.2).** Adds `exists_eventuallyEq_pow_iff_dvd`. Per the review, the note says finite positive order, analyticity of the root, the order computation and the inverse function theorem are all needed; the identically-zero germ gives no coordinate.

**/42 (Belyi 9.1).** Adds Tau Ceti's Kummer theorem (`restrictOfPrimeEquivNormalizedFactors` and its ramification-index formula), five citations in all. As the review asks, the note calls it a route to the tⁿ example, not a checked instantiation; it needs the model, monogenicity, n > 0 and separability of Xⁿ − 1.

**/43 (Belyi 12.9).** Adds `card_inertiaSubgroup`, with the separable-residue and finite-G₁ hypotheses. Tame cyclicity stays absent.

**/44 (Belyi 12.10).** Adds `galEquivZMod_restrictNormal_apply` and `autToPow_eq_modularCyclotomicCharacter`. The note says these are finite-level inputs and that level compatibility of `modularCyclotomicCharacter` is a Mathlib TODO.

**/45 (Belyi 12.7).** Adds `Subgroup.inverseConjugationHom`, with the review's convention warning (g ↦ (n ↦ g⁻¹ng) composes in reverse order). Stays absent.

**/46 (Belyi 14.1).** Partial, citing `orderTriple_eq_lcm_cycleData` and `geometryType`; genus and automorphism group are named in the note. The note says the genus is geometric only for transitive triples. The layer verdict stays "process".

**/47 (Belyi 12 duplicates).** The LocalFieldsRamification 4 entry is removed, as the review prefers. RS-29 keeps finite-residue-field tame theory apart from the characteristic-zero punctures of 12.9–12.11.

**/48 (Belyi 7 duplicates).** FuchsianOrbifolds 1 is added, scoped to the shared local model. As the review asks, the classification of punctured-disc covers, the monodromy and the deck group are left as Belyi work.

**/49 (Belyi summary).** "all of Layers 7–14" is replaced, following the review's preference, by a precise list. The summary now lists the composite theorems still missing, then each existing component with its target. No later layer is described as formalized.

**/50 (EC Layer 1 duplicates).** AlgebraicCurves 9 is added. The note says `invariantDifferentialBasis` is `kaehlerBasisOfSeparating` rescaled by the denominator, and that the Kähler–Weil divisor comparison is a separate target.

**/51 (EC Layer 0 places).** The "only through Divisor.eval" sentence is replaced. Evaluation is the residue map on `P.integers`, the functions regular at P, into `Place.ResidueField`; at degree one, the inverse of `residueFieldEquivOfDegreeEqOne` gives a value in K. `CoordinateRing.evalAlgHom` evaluates regular functions. The target already had five citations, so these are named in the note, per the review.

**/52 (EC base change).** `CoordinateRing.map_bijective` is replaced by `map_comp_map` (exact), with `map_id` and Mathlib's `CoordinateRing.map` named in the note (five-entry limit). Per the review, the note says this is transport along the coefficient map, not a tensor-product base-change isomorphism.

**/53 (EC formal group).** The note is replaced. The [m]-series for m ∈ ℕ is m • X in Mathlib's `FormalGroup.Point` monoid, the inverse series is `formalInverse` with F(X, i(X)) = 0, and ℤ-multiples exist on the evaluated points. Per the review, the note separates this expression from a named [m] with its API, and series operations from point operations. It also says the instantiation was not compiled. Stays partial.

**/54 (EC Layer 3 kernel count).** Adds `card_ker_mulByIntIsogeny` (special case). The review's caveat is in the note: over an algebraically closed field this does not count F-rational kernels over a finite field.

**/55 (EC Layer 4 reduction).** `range_formalPointHomAdicCompletion` becomes special case, and `formalPointHomAdicCompletion_injective` is added. The note uses the review's qualified wording: Ê(𝔪) ≅ E₁ is present in substance for this completion setting, but there is no reduction-defined E₁ and no proof that it equals the pole subgroup. The general comparison stays missing.

**/56 (EC Layer 5 twists).** Adds `exists_variableChange_of_j_eq` (related). The note says it is an existence theorem that needs transport to Kˢᵉᵖ, not a chosen trivialisation, a cocycle or descent.

**/57 (EC Mordell–Weil).** `fg_point` goes from more general to related, and `fg_point_of_variableChange` is added (related). The note keeps the normal-form and per-factor hypotheses, and says the transfer is along a given change of variables. `fg_point_of_numberField` stays exact and the status stays tauceti.

**/58 (EC Layer 2 duplicates).** AbelianSchemes A4 is added, restricted to the elliptic case over a field, together with LocalFieldsRamification 4 for the ℓ-component of Ẑ^{(p′)}(1). The note says tame-inertia theorems do not transfer, consistent with /47.

## Checks

- `python3 research/blueprint/intake.py check-files` on both deliverables: 0 problems.
- The unit suite passes.
- The JSON keeps its one-space indentation.
- Only the four roadmaps of this audit are in the file, and only the targets, duplicates and summaries named above changed.
- No target that was within the limit now has more than five declarations.
