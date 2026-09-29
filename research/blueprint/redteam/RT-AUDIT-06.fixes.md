# RT-AUDIT-06: fixes

Fixer: Claude Code, session `cc-f805bf`, 29 September 2026 (issue #4001, job FIX-RT-AUDIT-06).
- **Findings and verdicts.** `RT-AUDIT-06.result.json` and `RT-AUDIT-06.review.json`. The red team made 69 findings. The review confirmed 67 and rejected 2 (/3, /27).
- **Scope.** This job covers the 31 confirmed findings of high or medium severity: /4, /5, /10–/18, /28–/33, /42–/46, /48–/50, /57–/61, /63. Three of them are high (/10, /11, /57). The 36 confirmed low-severity findings (/1, /2, /6–/9, /19–/26, /34–/41, /47, /51–/56, /62, /64–/69) are outside the fix job (PROTOCOL.md section 17). One low finding is fixed as a side effect: /31's fix replaces the private `TauCeti.rockafellarPotential`, which is /7's subject.
- **Where the changes are.** Everything is in `research/blueprint/audit/AUDIT-06.result.json`; no other file changes. The audit's `review` object is unchanged.
- **Layer verdicts changed.** Two, both under /5: OneParameterSemigroups Part C and its BCR milestone (milestone 2) go from `built` to `partly built`.
- **Library values changed.** Only where a finding says so:
  - `tauceti` → `both`: one target (/4).
  - `tauceti` → `partial`: four targets (/5 twice, /29, /30).
  - `absent` → `partial`: seven targets (/13, /14, /31, /42, /43, /44, /61).
  - `partial` → `absent`: three targets (/50).
- **Target texts changed.** Three texts are widened back to the roadmap's scope: OT Layer 1 lower semicontinuity (/30), OT Layer 2 c-transform (/29) and OT Layer 13 kernel/Sinkhorn divergence (/44).

**Verification.**
- I read every added declaration at Mathlib 082e2d3 / Tau Ceti f790474, at the stated file and line. Each of the 53 new citations resolves in the pinned `declarations.tsv` under the stated full name, library, file and line.
- Two resolved names differ from the finding's wording:
  - Mathlib's `kernel_ofKernel` is `RKHS.OfKernel.kernel_ofKernel`; it sits inside `namespace OfKernel`, Reproducing.lean:315.
  - The Tau Ceti order lemma is `TauCeti.qExpansion_order_eq_analyticOrderAt_cuspFunction`, as the review says.
- Anonymous instances are not in the index, so they are named in notes by file and line, not cited:
  - `t2Space_of_properlyDiscontinuousSMul_of_t2Space`, a named Mathlib instance that the index also omits;
  - Tau Ceti's `ProperlyDiscontinuousSMul` for discrete subgroups of PSL(2, ℝ);
  - the PSL(2, R) `MeasurableConstSMul` and `SMulInvariantMeasure` instances;
  - Mathlib's PSL action on ℙ ℝ (Fin 2 → ℝ);
  - the continuous-map metric, second-countability, completeness and Polish instances.
- Every layer id added to a `duplicates` list is an atlas stage in `data/atlas.json`.
- Every target has at most five declarations. Where a finding adds more, the displaced citations are named in the note with file and line, and listed below.

## RT-AUDIT-06/4 (medium, library-claim): Kolmogorov decomposition (Part C)

- **Library value.** `tauceti` → `both`.
- **Citations added.** `RKHS.OfKernel` (Reproducing.lean:312) and `RKHS.OfKernel.kernel_ofKernel` (:367), both more general.
- **Citation displaced.** Following the review's correction for the five-citation cap, `Matrix.PosSemidef.kolmogorovEquiv` (Kolmogorov.lean:285) moves into the note. The kept Tau Ceti citations are the feature map, its inner product and the universal isometry.
- **Note.** The empty note is replaced. The new note:
  - names `RKHS.kerFun_dense` (:189) and `RKHS.equiv` (:422), with their completeness hypotheses;
  - says that `KolmogorovSpace` (Kolmogorov.lean:126) is defined through `RKHS.OfKernel`.
- **Summary.** "Mathlib contributes only AbsolutelyMonotoneOn, LinearPMap, charFun and Matrix.PosSemidef" now also names `RKHS.OfKernel`, and says that Tau Ceti's decomposition is its scalar specialisation.

## RT-AUDIT-06/5 (medium, error): the Part C acceptance examples

**Both copies of the target (Part C and milestone 2).**
- Library value: `tauceti` → `partial`. The four citations are kept.
- The note is rewritten. Bochner on V = ℝ is an instance of `bochner`. Two checks are missing:
  - (a) The Gaussian representing measure. The note gives the pushforward scale √2/(2π), which the review verified, and the covariance (2π²)⁻¹·I. It names the lemmas to prove it from: `integral_fourierAtom_eq_charFun_neg_two_pi_smul` (Fourier/Convention.lean:78) and `eq_bochnerMeasure` (BochnerTheorem.lean:362).
  - (b) The V = 0 comparison of `bcr_semigroup_bochner` with `hausdorff_bernstein_widder_existsUnique` (HausdorffBernsteinWidder.lean:70).
- Per the review, the note calls `representsLaplace_timeMarginal` a necessary slice identity. It does not demand a separate named specialisation for V = ℝ.

**Layer verdicts.** Part C and milestone 2 go from `built` to `partly built`.

**Summary.** The two acceptance checks are added to "Genuinely missing". Because the target is now judged by the same rule as OptimalTransport Layer 0's gluing check, the finding's conditional ("revisit Layer 0") does not arise.

## RT-AUDIT-06/10 (high, library-claim): covolume (FuchsianOrbifolds Layer 2, summary)

**Target "Measurable fundamental domains…".**
- Citations added: `MeasureTheory.covolume` (FundamentalDomain.lean:679) and `IsFundamentalDomain.covolume_eq_volume` (:695), both more general.
- `ModularGroup.volume_fd_lt_top` (Modular.lean:112) moves into the note, to stay within five.
- The note now says:
  - The covolume of a Fuchsian group is `covolume Γ ℍ volume`. It names `HasFundamentalDomain` (:668).
  - Tau Ceti's PSL instances (PSLAction.lean:145, :153) supply the hypotheses. The PSL(2, ℤ) covolume is finite through `fdo`, its a.e. equality with `fd`, and `fd`'s finite volume, with no new volume definition, per the review.
  - Missing: `HasFundamentalDomain Γ ℍ` for a general discrete Γ (Mathlib's Dirichlet TODO, :654); a cofiniteness predicate, which must include that existence because the generic covolume defaults to 0; and the comparison with Riemannian volume.
- The false claim that only `ZLattice.covolume` exists is gone.
- Library value: stays `partial`.

**Summary.** "or covolume" is deleted from the missing list, and a parenthesis on Mathlib's generic covolume is added.

## RT-AUDIT-06/11 (high, library-claim): the cusp stabilizer (Layer 3 cusp-datum target)

- **Fit.** `strictPeriods_eq_zmultiples_strictWidthInfty` goes from `exact` to `related`.
- **Citations replaced.**
  - `Subgroup.strictWidthInfty_pos` (Cusps.lean:402, which assumes `IsArithmetic`) is replaced by `Subgroup.strictWidthInfty_pos_iff` (:379, more general).
  - `Subgroup.instDiscreteTopStrictPeriods` (:284, related) is added. `Subgroup.widthInfty` (:332) is dropped to make room and is named in the note.
- **Note.** Rewritten:
  - `strictPeriods` is the translation subgroup, not the full stabilizer.
  - w > 0 holds under discreteness and `HasDetPlusMinusOne` exactly when ∞ is a cusp.
  - Missing: (a) the full-stabilizer theorem (no hyperbolic element shares a fixed point with a parabolic one), (b) the transfer to a general cusp through σ, and (c) `CuspDatum` with its change-of-datum laws.
  - Per the review, (a) is to be stated for the orientation-preserving PSL(2, ℝ) input or its SL(2, ℝ) lift, since GL elements of determinant ±1 would admit reflections.
- **Library value.** Stays `partial`.

## RT-AUDIT-06/12 (medium, library-claim): the GL/PSL cusp adapter (Layers 3 and 4)

**Target "Cusp orbits in OnePoint ℝ…".**
- Fits: `IsCusp`, `cuspsSubMulAction` and `CuspOrbits` go from `exact` to `more general`.
- Per the review's correction of the blanket relabel, `cosetToCuspOrbit` goes from `exact` to `special case`, because it assumes `IsArithmetic`.

**Notes.** The adapter sentence is added to the notes of the cusp-orbit target, the cusp-datum target and Layer 4's compactified-carrier target. It says:
- Mathlib's cusp API takes `Subgroup (GL (Fin 2) ℝ)`, but the roadmap's input is `Subgroup PSL(2, ℝ)`.
- The missing adapter is the lift of Γ through SL(2, ℝ) into GL(2, ℝ), with cusps, orbits and widths transported.
- It can be built from the PSL action on ℙ ℝ (Fin 2 → ℝ) (Projectivization/Action.lean:219) and `OnePoint.equivProjectivization` (ProjectiveLine.lean:84). As the review says, these give the action and the identification, not the lift.

## RT-AUDIT-06/13 (medium, missing): topology of the coarse quotient (Layer 1, Layer 4)

**Layer 1 gluing target.**
- Library value: `absent` → `partial`.
- Citation added: `ContinuousConstSMul.secondCountableTopology` (ConstMulAction.lean:657, more general). The two existing related citations are kept.
- `t2Space_of_properlyDiscontinuousSMul_of_t2Space` (:621) is a Mathlib instance missing from `declarations.tsv`, so it is named in the note, together with Tau Ceti's discrete-subgroup instance (Fuchsian/ProperAction.lean:33).
- The missing part is unchanged: the elliptic charts, their gluing, and the `ChartedSpace`/`IsManifold` structure (`instChartedSpaceQuotient` needs a free action).
- The layer verdict stays `partly built`.

**Layer 4 carrier target.** "Only the second summand exists" is replaced. The coarse quotient exists (Hausdorff, second countable), and so does the GL cusp-orbit summand. The sum carrier and its topology are absent, and nothing compactifies the quotient.

## RT-AUDIT-06/14 (medium, missing): local order formula (Layer 1 descent target)

- **Library value.** `absent` → `partial`.
- **Citations added.**
  - `MeromorphicAt.meromorphicOrderAt_comp` (Meromorphic/Order.lean:907) and `AnalyticAt.analyticOrderAt_comp` (Analytic/Order.lean:540), both more general.
  - `TauCeti.analyticOrderAt_comp_pow_zero` (TauCeti/Analysis/Analytic/Order.lean:50, exact).
  - `TauCeti.ModularForm.valence_formula_finiteIndex` (Norm/Cusps.lean:468, related), added next to the level-one `valence_formula`.
- **Note.** "Level-one group only" is gone. The note records the not-eventually-constant hypothesis of the meromorphic lemma. It keeps the missing descent, coordinate transport and quotient statement, and says that these formulas give no complex structure.

## RT-AUDIT-06/15 (medium, library-claim): decay ⇒ zero of controlled order (Layer 3 Laurent target)

- **Fit.** `exp_decay_of_zero_at_inf` goes from `exact` to `related`. It is the converse direction, and to order one only.
- **Citations.** `TauCeti.UpperHalfPlane.qExpansion_coeff_eq_zero_of_cuspFunction_isBigO_pow` (QExpansion/BigO.lean:83, exact) replaces `boundedAtFilter_cuspFunction`, which moves into the note (Periodic.lean:195).
- **Note.** It names the converse (:70) and `TauCeti.qExpansion_order_eq_analyticOrderAt_cuspFunction` (QExpansion/Order.lean:43), under the namespace the review corrected. Per the review, it keeps the analyticity hypothesis and says that translating a bound along i∞ into q is a separate step. Missing is only the pole branch.
- **Library value.** Stays `partial`.

## RT-AUDIT-06/16 (medium, library-claim): level-one elliptic data (Layer 6)

- **Citations added.** `TauCeti.ModularGroup.ellipticOrder` (Modular/Stabilizer.lean:239, exact), `TauCeti.ModularGroup.card_stabilizer_psl_ρ` (:213, exact) and `isCusp_SL2Z_iff'` (Cusps.lean:133, related).
- **Citations displaced.** Within five, the weak citation `UpperHalfPlane.norm_eq_one_of_mem_ellipticPoints` (Rho.lean:119) is dropped. `ModularGroup.volume_fd_lt_top` (Modular.lean:112) and `TauCeti.ModularGroup.exists_rep_mem_fd` (Modular/Orbits.lean:62) move into the note.
- **Note.** Rewritten. The note names the stabilizer orders 2, 3 and 1 (:206, :213, :220) and the unique cusp of width 1. Per the review, these cover only the elliptic and cusp parts of the signature, and X(1) remains absent.
- **Library value.** Stays `partial`.

## RT-AUDIT-06/17 (medium, duplicate): AlgebraicTopology supplies Layer 5's CW inputs

- **Duplicates added to Layer 5, both marked as supplier.**
  - `AlgebraicTopology#stage-7-euler-characteristic-and-finite-decompositions`: Euler characteristic, homotopy invariance, cover multiplicativity and excisive additivity.
  - `AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`: item 7, finite CW type of compact smooth manifolds.
- **Note.** The note of the CW/genus target now says that these inputs are AlgebraicTopology's to build. Surface genus and the branched-cover application stay here.

## RT-AUDIT-06/18 (medium, duplicate): the BelyiMaps triangle-group record (Layer 2)

The record's note is rewritten as an ownership split, not a request for a single owner:
- BelyiMaps 4.1 owns the presented `TriangleGroup` with ℕ parameters.
- BelyiMaps 4.5 proves only that the group is infinite, and disclaims discreteness and faithfulness. Remark 2.29 is only a source.
- Item 6 here owns the geometric realization, discreteness and faithfulness, and should use or compare with BelyiMaps' group.

Following the review, the note does not ask for a redesign of either carrier. It says that the two parameter conventions coexist through the adapter elliptic m ↦ m, cusp ↦ 0, which the comparison should state.

## RT-AUDIT-06/28 (medium, library-claim): the general atom inequality (OT Layer 4)

- **Citation replaced.** `ProbabilityTheory.HasLaw.measure_singleton_le` (Probability/HasLaw.lean:50, exact) replaces the definitional wrapper `mongeCost_eq_top_of_not_exists_hasLaw`, which the note now names (Monge.lean:199).
- **Fit.** `mongeCost_eq_top_of_measure_singleton_ne_zero` goes from `exact` to `special case`.
- **Note.** The first sentence is replaced as the finding asks. It names `TauCeti.Probability.not_hasLaw_of_measure_singleton_ne_zero` (:62). "The general inequality" is dropped from the missing list, which keeps the atom-set version and the general nonatomic source.
- **Library value.** Stays `partial`.

## RT-AUDIT-06/29 (medium, library-claim): only the finite-real-cost c-transform (OT Layer 2, summary)

- **Target text.** Restored to "Infimal c-transform interfaces for finite-real and extended costs, with extended-real codomain, …".
- **Library value.** `tauceti` → `partial`.
- **Note.** It now begins "For finite real costs it is built…". It ends by saying that the five citations are the finite-real-cost interface, and that the extended-cost interface is absent, deferred by CTransform/Basic.lean's docstring.
- **Fits.** The review asks to qualify the finite-cost citations. I did this in the note and left their fits at `exact`, since each is exact for the finite-cost half it names.
- **Layer verdict.** Stays `partly built`.
- **Summary.** Changed under /33.

## RT-AUDIT-06/30 (medium, library-claim): the bounded-below lsc theorem (OT Layer 1)

- **Target text.** Extended with "; a reusable version for costs bounded below by integrable marginal terms".
- **Library value.** `tauceti` → `partial`.
- **Fit.** `transportCost_eq_iSup_transportCost_lscApprox` goes from `exact` to `related`, and the note says it holds on compact metrizable spaces.
- **Note.** The last sentence is replaced. `transportCostBddBelow` (Cost/BoundedBelow.lean:143) only defines the signed value. The file proves independence of the lower bound but no semicontinuity, and the existing lsc-integral theorems take ℝ≥0∞ integrands.
- **Layer verdict.** Stays `partly built`.

## RT-AUDIT-06/31 (medium, missing): Fenchel–Moreau input and algebraic Rockafellar (OT Layer 5)

- **Library value.** `absent` → `partial`.
- **Citations.**
  - `ConvexOn.real_sSup_affine_eq` (Convex/Approximation.lean:237, related) added.
  - `TauCeti.IsCyclicallyMonotone.exists_isCConcave_subset_cSuperdifferential` (CyclicalMonotonicity.lean:235, more general) replaces the private `TauCeti.rockafellarPotential` (:175). This also settles low finding /7.
  - `SeparatingDual` is kept.
- **Note.** Rewritten as the finding asks, with the review's qualifications:
  - The envelope theorem is Fenchel–Moreau for functions finite on a closed convex domain, not the proper EReal theorem.
  - The instantiation at c = −⟪x,y⟫ needs negation, a vocabulary and properness translation, and a separate treatment of the empty S.
  - The conjugate, subgradient and extended-valued APIs stay missing.

## RT-AUDIT-06/32 (medium, error): the polar-factorization prerequisites (OT Layer 5)

- **Library value.** Stays `absent`.
- **Citations added**, all related:
  - `TauCeti.HasWeakFDerivOn` (Sobolev/WeakDeriv.lean:239);
  - `TauCeti.W1p` (Sobolev/W1p/Basic.lean:349);
  - `TauCeti.W1p0.isCompactOperator_valueL` (Sobolev/RellichKondrachov.lean:141).
- **Note.** "Blocked twice over" is replaced by the finding's text. The weighted space and Brenier are the blockers. Rellich–Kondrachov exists for W^{1,p}_0 on bounded open Ω with 1 ≤ p < ∞, and only the full-W^{1,p} version is missing, for the smooth-domain specialization. The review's warning is included: the weighted space must relate the ordinary weak derivative to the weighted norm, not merely change the measure.

## RT-AUDIT-06/33 (medium, error): the OT summary

- "Layers 0--4 are largely done" now reads "Layers 0--3 are largely done…, and Layer 4 has only its Monge-value/relaxation API and feasibility basics".
- "the whole `c`-transform…tower" now reads "the finite-real-cost `c`-transform…tower".
- The residual-gap list gains the eleven items the finding lists, with measurable selection among them.
- **The Layer 5 sentence.** "From Layer 5 on, only the Gaussian matrix toolkit exists…; everything else is missing" is replaced by a sentence that lists what Layer 5 has: the Gaussian toolkit, Mathlib's convex inputs and `ConvexOn.real_sSup_affine_eq`, the Rockafellar–Rüschendorf instantiation, and the partly present Sobolev inputs. It also records inputs in later layers: the Borel path space and BV variation measure (Layer 8, from /42 and /43), and the Part C kernel API (Layer 13, from /44).
- As the review asks, the sentence does not end with a new blanket "everything else is missing". The following sentence, which lists what is absent, is unchanged apart from /48's edit.
- Finding 56, which the review says to coordinate with, is low severity and was not otherwise applied.

## RT-AUDIT-06/42 (medium, library-claim): the continuous path space (OT Layer 8)

**Target "Continuous path space…".**
- Library value: `absent` → `partial`.
- Citations: `ContinuousMap.measurableSpace` (BorelSpace/ContinuousMap.lean:51), `ContinuousMap.measurable_eval` (:56) and `ContinuousMap.borel_eq_iSup_comap_eval` (:77), all exact; `TauCeti.MeasureTheory.AnalyticSet.nullMeasurableSet` (MeasurableSpace/Analytic.lean:298, related). `analyticSet_setOf_cTransform_lt` is kept.
- The note names `measurable_iff_eval` (:155).
- **Two corrections from the review.**
  - The note does not list Polishness as missing. It says that C([0,T], X) is Polish by instance inference and gives the review's locators.
  - It does not claim that no measurable-selection theorem exists. It lists only the Jankov–von Neumann uniformization, endpoint laws, dynamic plans, geodesic plans and the closedness of the geodesic relation as missing.

**Layer 13 dynamic-Schrödinger target and sub-layer 13C.** Both notes gain the sentence that C([0,1]; ℝⁿ) already carries Mathlib's Borel σ-algebra and measurable evaluations, so the Wiener law on it is what is missing there.

## RT-AUDIT-06/43 (medium, library-claim): BV curves and their variation measure (OT Layer 8)

- **Library value.** `absent` → `partial`.
- **Citations added.**
  - `BoundedVariationOn` (EMetricSpace/BoundedVariation.lean:66, exact).
  - `BoundedVariationOn.stieltjesFunctionRightLim`, `.vectorMeasure` and `.variation_vectorMeasure_Ioc` (VectorMeasure/BoundedVariation.lean:53, :119, :343), all special case.
- **Note.** Per the review, the note keeps the ordered-domain hypotheses and says that the identification is with the right-limit representative. It lists the metric-valued |Dγ|, Borel dependence, D(I;X), BV(I;X) and the ALS theorems as missing.

## RT-AUDIT-06/44 (medium, library-claim): positive-definite kernels (OT Layer 13, 13A)

**Layer 13 target.**
- Renamed to "Continuous positive-definite and universal-kernel predicates on compact spaces; finite smooth dependence of the regularized value and potentials, the envelope formula, and the debiased Sinkhorn divergence with the Feydy et al. theorem".
- Library value: `absent` → `partial`.
- Citations added:
  - `Matrix.PosSemidef` (PosDef.lean:59, exact);
  - `RKHS.OfKernel.kernel_ofKernel` (:367, related);
  - `Matrix.PosSemidef.kolmogorovFeature` (Kolmogorov.lean:133, related);
  - `TauCeti.posSemidef_cexp_neg_mul_sq_norm` (Gaussian/Basic.lean:153, special case);
  - `TauCeti.posSemidef_schur_pow` (LinearAlgebra/Matrix/PosSemidef.lean:185, related).
- The note is replaced as the finding asks. Per the review, it says that c = 1/ε gives the Gibbs kernel, and it lists the Laplace kernel exp(−‖x − y‖/ε) as missing.

**Sub-layer 13A.** The same sentence is appended to the note.

## RT-AUDIT-06/45 (medium, duplicate): the reverse Part C records (OT Layer 13, 13A)

- **Duplicates added.** `OneParameterSemigroups#part-c--positive-definite-functions-and-bochners-theorem` is added to the duplicates of Layer 13 and of 13A, recorded as the supplier of the kernel component.
- **Note.** Narrowed as the review asks:
  - It does not say that Part C is wholly built, which /5 changed.
  - It does not say that only universality and the Sinkhorn divergence belong to Layer 13. It limits the boundary to the kernel component and leaves the rest of the entropic theory with Layer 13.

## RT-AUDIT-06/46 (medium, duplicate): PDE VMO, Schauder and BMO boundaries (OT Layer 6, 6C)

- **Duplicates added.** Layer 6 and 6C each gain `PDE#milestone-e-21`, `PDE#milestone-e-22` and `PDE#milestone-b-11`.
- **Notes.** They follow the review, not the finding's ownership proposal:
  - E-21 is recorded as a different theorem (linear variable-coefficient against nonlinear Monge–Ampère) that shares the VMO notion.
  - The note records that the OT roadmap assigns the VMO API to this layer and E-21 consumes VMO coefficients, so the definitions must be coordinated. It does not move VMO ownership to PDE.
  - E-22 and B-11 are recorded as suppliers.
- **Target note.** In the note of target 7 (`Section-local W^{2,p}…`), the BMO clause is replaced as the finding asks.
- **Maintainer note.** AUDIT-40 (not yet reviewed) records the reverse E-21 and E-22 entries. I did not touch it, since it is another job's file.

## RT-AUDIT-06/48 (medium, library-claim): the transport problem's Γ-convergence (OT Layer 10, summary)

- **Library value.** Stays `absent`.
- **Citations added.** `TauCeti.IsCostLiminfStable` (Stability.lean:103), `TauCeti.HasRecoveryPlans` (:118) and `TauCeti.tendsto_transportCost` (:315), all special case.
- **Note.** Replaced. Per the review's correction, it says that `exists_isOptimalCoupling_tendsto` (:355) extracts a refining filter along which optimal couplings converge, not convergence of every family. The bridge must keep the tightness, marginal and cost hypotheses.
- **Summary.** It now says "no … abstract Γ-convergence (only the transport problem's own liminf/recovery stability of Layer 1)".

## RT-AUDIT-06/49 (medium, library-claim): a private citation in finite Sinkhorn (OT Layer 13)

- **Citations.**
  - The private `TauCeti.realPlans_nonempty` is replaced by `TauCeti.TransportMatrix.independent` (Finite/TransportMatrix.lean:82, related).
  - `TauCeti.TransportMatrix.exists_forall_cost_le` (Finite/Duality.lean:307, related) is added.
- **Note.** "Built (nonempty, compact, closed)" is replaced by the public API. The note names `transportMatrixEquiv` (:220) and says that closedness and compactness are proved only for the private `RealPlans` (:148, :286, :298, :302). Per the review, it says that the independent matrix gives unrestricted nonemptiness, not feasibility for a prescribed support K.

## RT-AUDIT-06/50 (medium, other): three partial targets that are really absent (OT Layers 7, 13, 15)

- **Library values.** `partial` → `absent` for:
  - Layer 7 "Injectivity radius…";
  - Layer 13 "Static Schrödinger problem…";
  - Layer 15 "Symmetry, the triangle inequality by gluing…".
- **Kept as they were.** All their citations were already `related`, and their notes are unchanged. The layer verdicts stay `not built`.
- **Borderline cases.** I left the two borderline cases the finding allows unchanged: Layer 13 target 10 and Layer 15 target 6.

## RT-AUDIT-06/57 (high, library-claim): private Perron citations (AN.3 contour shift)

- **Citations replaced.** The three private Perron lemmas are replaced by:
  - `Complex.integral_boundary_rect_eq_zero_of_differentiableOn` (CauchyIntegral.lean:296, related);
  - `TauCeti.Contour.classicalResidueTheorem_starConvex` (Contour/StarConvex.lean:193, more general);
  - `TauCeti.Contour.residue_logDeriv_eq_meromorphicOrderAt` (Contour/Residue/LogDeriv.lean:63, related).
- **Note.** Rewritten. It also names `argumentPrinciple_starConvex` (:210) and `classicalResidueTheorem_nullHomologous` (Residue/Cycle.lean:226). Two points follow the review:
  - Application needs a closed piecewise-C¹ rectangle in an open neighbourhood (not the rectangle's own interior), with sides and winding numbers.
  - The private rectangle identity is not called Perron-specific. The note says it reparameterises Mathlib's theorem for an arbitrary holomorphic f, and that only the two bounds concern `perronFn` (:258).
- **Library value.** Stays `partial`.

## RT-AUDIT-06/58 (medium, missing): contour tools for N(T) and the explicit formula (AN.3)

**T0 (N(T)).**
- Citation added: `TauCeti.Contour.argumentPrinciple_starConvex` (StarConvex.lean:210, related). The note names `argumentPrinciple_nullHomologous` (Argument/Cycle.lean:110).
- The note is extended. Per the review, the missing application includes the open neighbourhood, boundary avoidance, finite orders and winding numbers, as well as Stirling and S(T).
- Library value: stays `partial`.

**T1 (explicit formula).**
- Citation added: `classicalResidueTheorem_starConvex` (related).
- The note is changed as the finding asks.
- Library value: stays `absent`.

## RT-AUDIT-06/59 (medium, missing): the Wiener–Ikehara boundary data (AN.2)

**Citations.** `ArithmeticFunction.vonMangoldt.continuousOn_LFunctionResidueClassAux` (PrimesInAP.lean:288) and `…eqOn_LFunctionResidueClassAux` (:303), both related, are added to:
- T4, PNT in progressions, which now has five citations;
- T3, PNT, which now has three.

**Library values.** T3 stays `absent` and T4 stays `partial`.

**Notes.** The same sentence is added to the T2, T3 and T4 notes. It names `residueClass_nonneg` (:90) and `abscissaOfAbsConv_residueClass_le_one` (:101), with the coercion to ℂ and A = (φ(q))⁻¹. Per the review, it does not say "one missing step". It lists what remains:
- the unsmoothing step;
- the ψ → θ → π passage;
- for a residue class, the higher-prime-power comparison, because the restricted Λ tests n ≡ a, not p ≡ a;
- the rational-prime/prime-ideal adapter, on Tau Ceti's transfer route.

## RT-AUDIT-06/60 (medium, error): Λ(p)/p, not 1/p (AN.2 T4)

In the note, "the divergence of `∑ 1/p` over that class" now reads "the divergence of `∑ log p / p` (that is, `∑ Λ(p)/p`) over the primes of that class".

## RT-AUDIT-06/61 (medium, library-claim): the ideal side of Hecke L-functions (AN.4)

- **Library value.** `absent` → `partial`.
- **Citations added.**
  - `TauCeti.UnitaryIdealWeight` (Weight.lean:608, related);
  - `TauCeti.MultiplicativeIdealWeight.hasProd_eulerFactor` (EulerProduct/Analytic.lean:335, more general);
  - `…LSeries_ne_zero_of_summable_idealTerm` (:355, related);
  - `TauCeti.summable_idealTerm_of_unitary_of_one_lt_re` at the review's corrected locator, Estimates.lean:476 (related);
  - `TauCeti.GlobalNumberFields.RayClassGroup` (RayClass/Basic.lean:180, related).
- **Note.** Rewritten. It names `MultiplicativeIdealWeight` (Weight.lean:116), the log-derivative expansion (EulerProduct/Logarithm/VonMangoldtCoeff.lean:118) and `finite_rayClassGroup` (RayClass/Finite.lean:154). Per the review:
  - it separates absolute convergence for general weights from Re s > 1 for unitary weights;
  - it says that an arbitrary ideal weight is not a Hecke character.
- **Layer verdict.** AN.4 stays `partly built`.

## RT-AUDIT-06/63 (medium, other): the AN summary

- **Mathlib list.** It gains the pole-subtracted restricted von Mangoldt L-series on Re s ≥ 1 (`PrimesInAP`) as Wiener–Ikehara's hypothesis package. Per the review, this is not called −L′/L of a single L-function.
- **Tau Ceti list.** It gains the ContourIntegration residue theorem and argument principle, and the ideal-weight L-series with Euler product and nonvanishing. The convergence regions are distinguished as the review asks. Degree-one Galois characters come from low finding /62 and are not added.
- **PNT sentence.** It now reads "no Tauberian theorem in final form (only the smoothed Wiener--Ikehara limit), hence no prime number theorem … although their boundary input is proved".
- **Hecke and Artin.** "no Hecke or Artin L-functions" now reads "no Hecke characters, no Artin L-function, and no continuation or functional equation of Hecke or Artin L-functions".

## Checks

- `python3 research/blueprint/intake.py check-files research/blueprint/audit/AUDIT-06.result.json`: 1 file, 0 problems.
- All edits were made by one script. It located each target by roadmap, layer and target-text prefix, asserting exactly one match, and asserted that each replaced text occurred exactly once. It also asserted that every target has at most five declarations and that the `review` object is unchanged. It dumped the file with indent 1 and `ensure_ascii=False`, keeping the absence of a trailing newline.
- **Citations.**
  - All 53 new citations resolve in the pinned `declarations.tsv` (library, full name, file, line).
  - Four citations in the file do not resolve, and all four were already there: Tau Ceti's anonymous PSL instances (`…instT2Space…`, `…instFaithfulSMul…`, `…instContinuousSMul…`, `…instProperlyDiscontinuousSMul…`). They are not changes of this job.
- **Changes against the original file.**
  - The two verdict changes and the library-value and target-text changes listed above.
  - Duplicates added to FuchsianOrbifolds Layer 5 (+2) and to OT Layer 6 (+3), 6C (+3), Layer 13 (+1) and 13A (+1).
  - Nothing else outside the targets named above.
- No Lean file is involved, so nothing was compiled.
