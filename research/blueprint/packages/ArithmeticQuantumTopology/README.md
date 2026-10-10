# Arithmetic quantum topology, Habiro invariants and regulators

This roadmap constructs integral quantum invariants of links and integral homology spheres, then relates selected hyperbolic knot invariants to Bloch classes, perturbative series and quantum modular transformations. Its central objects are the even integral quantum group, Habiro’s cyclotomic color lattice, the unified invariant, geometric extended Bloch classes and triangulation-derived formal state integrals. Analytic knot integrals and quantum modular conjectures have their own hypotheses and normalization data.

## Conventions and boundaries

For rank one, q=exp(h), v=exp(h/2), K=exp(hH/2), e=(v−v⁻¹)E, and F̃⁽ⁿ⁾=FⁿKⁿ/[n]q!. The integral ground ring is ℤ[q±1]; the ambient representation algebra uses ℚ(v), with q=v². Positive framing acts by the inverse ribbon element r⁻¹. Vₙ has dimension n+1, whereas the reduced colored-Jones dimension index N uses Vₙ₋₁. The unreduced unknot value is [n+1]; division defining a reduced polynomial takes place before root evaluation. General Lie type retains the root lattice, symmetrizers, root lift and parity grading rather than borrowing rank-one formulas without their hypotheses.

The scalar Habiro ring is imported from HabiroCyclotomicCompletions: the inverse limit of ℤ[q] modulo the cyclotomic factorial ideals. Neither the completion of the integral quantum group nor the color-lattice completion is silently identified with that scalar ring. The former is an image of an inverse limit in the ambient h-adic quantum algebra. QT.1 constructs quantum completed tensors and PBW forms using native quotient and tensor algebras. A general inverse-limit map is not asserted injective.

GeometricTopology owns framed links, their ordinary diagram and braid relations, linking matrices, surgery, Kirby calculus, manifold carriers and hyperbolic geometry. Tau Ceti’s based Gauss codes and writhe are single-knot interfaces; its unframed Markov equivalence does not prove a framed link theorem. QT.0 imports these carriers and adds the refined admissible calculus needed by the integral invariant. LieHighestWeight and its RootSystems inputs own the classical Lie, root, weight and PBW theory. QT.1 owns the quantum presentations and integral ribbon/core structures.

K3BlochGroups owns ordinary pre-Bloch and Bloch groups, their boundary conventions, Suslin fibres and K₃ interfaces. Polylogarithms owns dilogarithm branches, Bloch–Wigner and regulator machinery. QT.5 supplies geometric flattenings, the full extended group needed by these manifolds, and the normalization comparisons. Neumann’s regulator is iVol−CS in ℂ/π²ℤ; GZ’s complex volume is iVol+CS, so the comparison is −complex conjugation with the period and lift recorded. A trace-field class needs verified algebraicity and boundary cancellation; a diagram alone does not supply it.

HabiroNahmSeries owns formal Gaussian contraction and the integral Nahm/module theorem. HabiroNumberFields supplies the early Frobenius coefficient ring and the twisted K₃-indexed module. The QT comparison retains HB.9’s coefficient-transfer, signed Kummer, integral-gluing and full quadratic finite étale descent obligations, including split components. The NZ bridge requires a symmetric **integral** Nahm matrix, parity compatibility, nondegenerate shapes and the exact arithmetic coefficient ring; invertibility of B alone gives a rational matrix and is insufficient. QT.6 contributes the geometric series and the comparison of its classical, one-loop and phase factors. Unbounded self-adjoint operators and their functional calculus belong to Tau Ceti’s OperatorTheory/SelfAdjointSpectralTheory; the Schrödinger realization, common Schwartz core and microlocal kernel extension build on that owner; the analytic Faddeev pentagon differs from the formal noncommutative pentagon already owned by the cyclotomic-completion roadmap.

QSeriesPartitionsAndMockModularForms owns generic scalar quantum modular and cocycle theory. Its matrix multiplicative and branch-aware extension is requested as Part II. QT.7 owns the selected knot rows, matrices and comparisons. Its algebraic cocycle identity is conditional on invertibility and the automorphy-factor identity; real analyticity is a separate conjecture. A general resurgence or Borel-summation framework is outside this roadmap. Wheeler’s two-variable knot invariant and its MMR/Alexander and relative-Habiro comparison are routed to ArithmeticQuantumTopology, Part II, using HabiroRings HR.1/HR.5 for the generic relative-completion interfaces.

## Library interfaces

The suggested signatures use Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Monoidal, braided and rigid categories and ordinary Hopf algebras supply their existing algebraic interfaces. Completed tensor powers, a ribbon twist and quantum PBW forms are additional structures. `MeasureTheory.integral` is total, so every contour construction needs an integrability theorem. Cauchy–Goursat on a rectangle handles finite deformation; passage to an unbounded contour also requires tail estimates. Meromorphic normal form and `meromorphicOrderAt` supply a native way to distinguish a zero from a pole, even when both have the totalized value zero.

Current Tau Ceti also supplies `SmoothLinkEmbedding`, with disjoint smooth circle components, and `FramedBoundaryTorus`, with primitive surgery slopes in actual first homology. The framed isotopy quotient, oriented linking numbers and construction of a filled manifold belong to GeometricTopology. Its cusped extension supplies ordered ideal triangulations, peripheral completeness and geometric refinement. The invariants below require those exact interfaces. The closed hyperbolic theory does not provide the cusped completeness theorem by itself.

<a id="qt-0"></a>

## QT.0 — Framed links, surgery and normalization

<a id="qt-0-framed-link-and-linking-matrix"></a>

### Framed oriented links and their linking matrix

Import the framed oriented multi-component link carrier from GeometricTopology layer 4. Relative to its Seifert longitude, integer framings f_i and the pairwise linking numbers give the symmetric matrix A with A_ii=f_i and A_ij=lk(L_i,L_j) for i≠j. QT uses this interface, including crossing-sign/writhe compatibility. Tau Ceti FramedOrientedGaussCode describes one knot; FramedMarkovBraid has component framings but MarkovEquiv alone is unframed and supplies no framed link-type quotient.

**Depends on.** [GeometricTopology — layer-4-knot-theory-done-properly-owned-here][GT4]; `TauCeti.FramedMarkovBraid`; `TauCeti.MarkovEquiv`; `TauCeti.BasedOrientedGaussCode.writhe`.

**API.**

- `linkingMatrix`: linkingMatrix L is a symmetric integer matrix indexed by the components of L.
- `linkingMatrix_symm`: linkingMatrix L is symmetric: its (i,j) and (j,i) entries agree.
- `linkingMatrix_diag`: The (i,i) entry of linkingMatrix L is the framing of the i-th component.
- `IsAlgebraicallySplit`: IsAlgebraicallySplit L holds when every off-diagonal entry of linkingMatrix L vanishes.
- `linkingMatrix_of_move`: The linking matrix is unchanged by the moves of the chosen carrier, so it is an invariant of the framed link type.

**Tests.**

- `linkingMatrix_unknot`: The linking matrix of the 0-framed unknot is the 1-by-1 zero matrix.
- `linkingMatrix_hopf`: The linking matrix of the 0-framed Hopf link is [[0,1],[1,0]], which is not diagonal, so the Hopf link is not algebraically split.
- `linkingMatrix_blackboard`: For a diagram with the blackboard framing, the diagonal entry of the linking matrix is the writhe of that component; this distinguishes the Seifert normalisation from the blackboard one.
- `not_algebraicallySplit_of_det_ne`: A two-component link whose linking matrix has a nonzero off-diagonal entry is not algebraically split; in particular the Hopf link is a non-example.

**Sources.** [Habiro, refined Kirby calculus][AQT61], §2.3, pp. 1290–1291 (PDF pp. 6–7), linking matrices.

<a id="qt-0-surgery-presentation"></a>

### Surgery on a framed link and the homology of the result

Import integral Dehn surgery on a framed link L in oriented S³: the meridian of the attached solid torus maps to f_i μ_i+λ_i, with λ_i the Seifert longitude. The oriented result has H₁≅coker(A:ℤ^m→ℤ^m); it is an integral homology sphere iff det A=±1. Empty surgery is S³; split union gives connected sum. The ordinary construction and Mayer–Vietoris calculation belong to GeometricTopology, Part II where its layer 5 lacks this exact interface.

**Depends on.** [GeometricTopology — layer-5-dehn-surgery][GT5]; [Framed links and linking matrix][AQT01]; `Matrix.det`.

**API.**

- `surgery`: surgery L is the closed oriented 3-manifold obtained by surgery on the framed link L.
- `surgery_empty`: Surgery on the empty framed link is the 3-sphere.
- `homology_surgery`: The first homology of surgery L is the cokernel of linkingMatrix L.
- `isIntegralHomologySphere_iff`: surgery L is an integral homology sphere if and only if the determinant of linkingMatrix L is a unit.
- `surgery_disjoint_union`: Surgery on a split union of framed links is the connected sum of the surgeries.

**Tests.**

- `surgery_empty_eq_sphere`: Surgery on the empty link is the 3-sphere, so the invariant of the empty presentation must be the invariant of the 3-sphere.
- `surgery_unknot_pm_one`: Surgery on the plus-one-framed unknot is again the 3-sphere: a definition that gave a different manifold here would be wrong.
- `homology_surgery_unknot_p`: Surgery on the p-framed unknot has first homology cyclic of order the absolute value of p; for p = 0 this is infinite cyclic, so that presentation is not an integral homology sphere.

**Sources.** [Habiro 2008][H06], §10.1, pp. 34–35, surgery presentation recalled before Theorem 10.2.

<a id="qt-0-admissible-framed-link"></a>

### Admissible framed links

L is admissible iff its linking matrix is diagonal with diagonal entries in {1,−1}. Equivalently L is algebraically split and unit-framed. This is a predicate on the imported link type; existence of an admissible presentation is a separate theorem. Surgery on an admissible L is an integral homology sphere.

**Depends on.** [Framed links and linking matrix][AQT01]; [Surgery on a framed link and the homology of the result][AQT06].

**API.**

- `IsAdmissible`: IsAdmissible L holds when L is algebraically split and every framing is plus or minus one.
- `isAdmissible_iff`: IsAdmissible L holds if and only if linkingMatrix L is diagonal with all diagonal entries of absolute value one.
- `isIntegralHomologySphere_of_isAdmissible`: If L is admissible then surgery L is an integral homology sphere.
- `isAdmissible_empty`: The empty framed link is admissible.

**Tests.**

- `isAdmissible_unknot_one`: The plus-one-framed unknot is admissible.
- `not_isAdmissible_unknot_zero`: The 0-framed unknot is not admissible; this is the case that separates admissibility from the algebraically split condition alone.
- `not_isAdmissible_hopf`: The unit-framed Hopf link is not admissible, since its off-diagonal linking number is 1.

**Sources.** [Habiro, refined Kirby calculus][AQT61], §1, p. 1286 (PDF p. 2), admissible links.

<a id="qt-0-kirby-and-fenn-rourke-moves"></a>

### Kirby moves and the Fenn-Rourke move

Import Kirby equivalence (isotopy, split ±1-unknot stabilization and handle slides) and the equivalent Fenn–Rourke ±1-unknot local twisting calculus. On a symmetric linking matrix a slide is PᵀAP with P=I+E_ji; for i≠j its new ii-entry is A_ii+A_jj+2A_ij. Ordinary moves and their surgery theorem are requested from GeometricTopology, Part II, rather than duplicated in QT.

**Depends on.** [GeometricTopology — layer-5-dehn-surgery][GT5]; [Framed links and linking matrix][AQT01]; [Surgery on a framed link and the homology of the result][AQT06].

**API.**

- `IsKirbyMove`: IsKirbyMove L L' holds when L' is obtained from L by one blow-up, blow-down or handle slide.
- `IsFennRourkeMove`: IsFennRourkeMove L L' holds when L' is obtained from L by one Fenn-Rourke twist.
- `surgery_eq_of_isKirbyMove`: A Kirby move does not change the surgered manifold up to orientation-preserving homeomorphism.
- `linkingMatrix_congr_of_handleSlide`: A handle slide changes the linking matrix by congruence with a unimodular matrix.
- `kirbyEquiv`: kirbyEquiv is the equivalence relation generated by isotopy and Kirby moves.

**Tests.**

- `kirbyEquiv_empty_unknot_one`: The empty link and the plus-one-framed unknot are Kirby equivalent, since one blow-down relates them.
- `framing_of_handleSlide`: Sliding L_1 over L_2 in the 0-framed Hopf link changes the framing of the first component by f_2 + 2 lk = 0 + 2, which pins the sign convention.
- `not_kirbyEquiv_of_ne_homology`: Two framed links whose cokernels are non-isomorphic groups are not Kirby equivalent, since surgery is invariant; the 0-framed and 3-framed unknots are a non-example pair.

**Sources.** [Habiro, refined Kirby calculus][AQT61], §5, p. 1309 (PDF p. 25), Kirby and Fenn–Rourke calculus.

<a id="qt-0-hoste-move"></a>

### Hoste moves between admissible links

A Hoste move is a Fenn–Rourke move between admissible framed links, including its inverse. The component removed is an unknotted ±1-framed component algebraically unlinked from every remaining component; deletion gives a ∓1 full twist of the strands through its spanning disc. hosteEquiv is the equivalence closure together with ambient isotopy. Both endpoint conditions are explicit; no claim is made that a move on an admissible source generally destroys admissibility.

**Depends on.** [Admissible framed links][AQT00]; [Kirby moves and the Fenn-Rourke move][AQT03].

**API.**

- `IsHosteMove`: IsHosteMove L L' holds when L and L' are admissible and related by one Fenn-Rourke move.
- `hosteEquiv`: hosteEquiv is the equivalence relation on admissible framed links generated by isotopy and Hoste moves.
- `isFennRourkeMove_of_isHosteMove`: Every Hoste move is a Fenn-Rourke move.
- `hosteEquiv_refl`: hosteEquiv is reflexive on admissible links.

**Tests.**

- `isHosteMove_blowdown_unknot`: Deleting a split plus-one-framed unknot from an admissible link is a Hoste move.
- `not_isHosteMove_of_framing_two`: Removing a 2-framed unknot is not a Hoste move: its source is not unit-framed.
- `hosteEquiv_of_isotopy`: Isotopic admissible links are Hoste equivalent.

**Sources.** [Habiro, refined Kirby calculus][AQT61], §5, p. 1309 (PDF p. 25), Hoste moves.

<a id="qt-0-refined-kirby-calculus"></a>

### Refined Kirby calculus for admissible links (Hoste's conjecture)

Two admissible framed links in S³ have orientation-preserving homeomorphic surgery results iff they are related by isotopy and Hoste moves. Labels/orientations used in the proof are auxiliary; the theorem is on unoriented unordered surgery links. It proves invariance using admissible intermediate presentations, without denying the ordinary Kirby-equivalence characterization.

**Depends on.** [Hoste moves between admissible links][AQT02]; [Admissible band-slide theorem](#qt-0-admissible-band-slide-calculus).

**Proof.** Habiro Main Lemma replaces a sequence with identity matrix by band slides. Stabilize the ordinary Kirby sequence to reduce the matrix in O(p,q;ℤ), then use the band-slide calculus. The Hoste corollary unknots the sliding component by Hoste moves and replaces a band slide by two local twists; remove auxiliary components.

**Checks.**

- Applied to the empty link and a plus-one-framed unknot, the theorem gives a Hoste move, which it must, since both present the 3-sphere.
- Any invariant of admissible links that is unchanged by a single Hoste move descends to an invariant of integral homology spheres.
- Ordinary Kirby equivalence also characterizes the same surgery relation for admissible endpoints, but its intermediate links need not be admissible. Hoste equivalence supplies the stronger intermediate-admissibility condition.

**Sources.** [Habiro, refined Kirby calculus][AQT61], Corollary 5.1, §5, pp. 1309–1310 (PDF pp. 25–26).

<a id="qt-0-refined-presentation-existence"></a>

### Every integral homology sphere has an admissible surgery presentation

Every closed connected oriented integral homology 3-sphere admits surgery on an algebraically split ±1-framed link in S³.

**Depends on.** [Admissible framed links][AQT00]; [GeometricTopology — layer-5-dehn-surgery][GT5].

**Proof.** Import Lickorish–Wallace and the integral homology-cokernel presentation. Stabilize the unimodular integral surgery form by ±1 summands, diagonalize the stabilized odd indefinite form integrally, and realize elementary congruences by handle slides. The required stable integral-form theorem is a precise supplier request; Habiro recalls this existence result rather than proving that algebraic step.

**Checks.**

- The 3-sphere has the empty admissible presentation.
- A manifold with non-trivial first homology has no admissible presentation, since the linking matrix of an admissible link is unimodular.

**Sources.** [Habiro, refined Kirby calculus][AQT61], §1, p. 1286 (PDF p. 2), admissible-presentation existence.

<a id="qt-0-admissible-band-slide-calculus"></a>

### Admissible band-slide theorem

A band slide is an algebraically cancelling pair of handle slides and preserves the linking matrix. Two admissible links with the same oriented surgery result become related by band slides and isotopy after split ±1 stabilizations. This is Habiro theorem Theorem 1.1; its Main Lemma applies to an oriented ordered move sequence with φ(S)=I.

**Depends on.** [Kirby moves and the Fenn-Rourke move][AQT03]; [Admissible framed links][AQT00].

**Proof.** Track elementary slide, reversal and permutation matrices functorially. Use the Main Lemma for the identity-matrix remainder after realizing O(p,q;ℤ) generators on stabilized unlinks. Forget ordering/orientation; all band-slide intermediate matrices remain diagonal ±1.

**Sources.** [Habiro, refined Kirby calculus][AQT61], Theorem 1.1, §1, p. 1287 (PDF p. 3); Main Lemma, Theorem 2.1, §2.2, p. 1290 (PDF p. 6); proof in §4, pp. 1300–1309 (PDF pp. 16–25).

<a id="qt-1"></a>

## QT.1 — Ribbon quantum groups and integral cores

<a id="qt-1-quantized-enveloping-algebra"></a>

### The h-adic quantized enveloping algebra of sl(2) and its integral forms

Over ℚ[[h]] put q=exp(h), v=exp(h/2), K=exp(hH/2). U_h(sl₂) is the h-adically complete algebra with [H,E]=2E, [H,F]=−2F, [E,F]=(K−K⁻¹)/(v−v⁻¹), interpreted by its h-adic expansion. Set e=(v−v⁻¹)E and F̃^(n)=F^nK^n/[n]_q!=v^(−n(n−1)/2)F^(n)K^n. Habiro U_q is the ℤ[q±1]-subalgebra generated by K±1,e,F̃^(n); U_q^ev uses K±2. Their PBW bases are F̃^(i)K^je^k and F̃^(i)K^(2j)e^k. U_q=U_q^ev⊕K U_q^ev. For F_p=U_q e^p U_q take the image of lim U_q/F_p in U_h and the induced tensor-power completion; do not assert injectivity of the preimage completion.

**Native construction.** `Truncation p` is the noncommutative `RingQuot` of ℚ⟨H,E,F⟩[h] by h^p and the displayed relations. Remove the common h before inverting the Cartan denominator: `cartanSeries`=sinh(hH/2)/sinh(h/2) has constant H, odd coefficients zero and h² coefficient (H³−H)/24. `Uh` is the compatible subalgebra of ∏_p Truncation p, with projections and polynomial lifts. `scalar` evaluates each formal scalar in its finite quotient; its image is central and it is injective. The discrete-quotient topology is complete and separated. `pbwCoordinates` and `pbwHomeomorph` identify Uh linearly and topologically with ℚ[F,H,E][[h]], using discrete PBW coefficients; they are not algebra equivalences.

`KUnit` uses the compatible truncated exponential; `Ftilde` inverts `formalQFactorial`, whose constant is n!. `qToFormal` sends the Laurent variable to exp(h), not exp(h/2). `integralForm` is the actual `Algebra.adjoin` of these generators. `integralIdeal` is the native two-sided ideal generated by e^p; `IntegralQuotient` uses its `RingCon`. `integralToUh` maps the compatible quotients to Uh, and `completion` is its range. The image is not replaced by the whole h-adic closure.

`CompletedTensor n` uses native `PiTensorProduct` on the free algebra factors, one central h, the factor relations and h^p=0, then the compatible quotient limit. `tensorInsert` inserts a factor; distinct factors commute. Its zero-fold power is ℚ[[h]], its one-fold power is Uh, and the ordinary module tensor maps densely into it. `IntegralTensor` instead tensors the integral forms over ℤ[q±1]. `integralTensorIdeal` is generated by inserting e^p in one factor; n=0 has F₀=ℤ[q±1] and F_p=0 for p>0. `completedIntegralTensor` is the canonical image in CompletedTensor n. All these products retain each factor's noncommutativity.

**Depends on.** `HopfAlgebra`; [RepresentationTheory/LieHighestWeight — layer-3-enveloping-algebra-verma-modules-and-lλ][LHW3]; `AdicCompletion`; `UniformSpace.Completion`.

**API.**

- `Uq`: The ℤ[q±1]-subalgebra generated by e=(v−v⁻¹)E, K±1 and F̃^(n)=F^nK^n/[n]_q!.
- `Uqev`: The ℤ[q±1]-subalgebra generated by e, K±2 and F̃^(n); q=v².
- `basis_Uq`: The ordered F̃^(i)K^je^k form a free ℤ[q±1]-basis; replace j by 2j for the even form.
- `Uqev_le_Uq`: Uqev is a subalgebra of Uq stable under Uq’s adjoint action.
- `completion`: The completed integral form is the image of the inverse limit for F_p=Uq e^p Uq in U_h; its tensor-power image completions are algebras. No injectivity of the inverse-limit map is presumed.
- `transition_quotient`, `transition_comp`, `projection_compatible`: quotient maps and precision changes compose on the actual presentation.
- `classicalLimit`, `classicalLimit_kernel`: precision one is `UniversalEnvelopingAlgebra ℚ (LieAlgebra.SpecialLinear.sl (Fin 2) ℚ)`, with kernel hUh.
- `basis_Uq_apply`, `integralParity`: identify both PBW bases and the unique even/odd decomposition.
- `tensorOfOrdinary_tprod`, `tensorInject_insert`: pure tensors and leg insertions agree with the native module tensor and preserve its factor order.

**Tests.**

- `basis_freeness`: The ordered F̃^(i)K^je^k are linearly independent over ℤ[q±1], with the stated K factors and q-divided-power normalization.
- `Uqev_ne_Uq`: K itself lies in Uq and not in Uqev, so the two forms are different.
- `classical_limit`: U_h/hU_h is the classical ℚ-enveloping algebra of sl₂; h is a parameter of the ambient complete algebra, not an element asserted in the integral coefficient ring ℤ[q±1].
- `cartan_series_constant`, `cartan_series_second`, `parameter_not_nilpotent`: cancellation gives H and (H³−H)/24; no fixed power of h vanishes in Uh.
- `q_variable_second_coefficient`, `divided_power_first`, `divided_power_product`: exp(h) has h² coefficient 1/2, F̃¹=FK and F̃¹F̃¹=q⁻¹[2]_qF̃².
- `basis_negative_cartan_power`, `filtration_power`, `completion_compatible_coordinates`: negative K powers occur, e^p vanishes in its quotient and every image retains its finite observations.
- `tensor_shared_parameter`, `tensor_cross_factors_commute`, `tensor_same_factor_noncommutative`: the parameter is shared, distinct factors commute and H,E in one factor do not.
- `integral_tensor_zero_filtration`, `integral_tensor_one_large_factor`, `integral_tensor_not_total_degree`: the empty case is special; e^p⊗1 lies in F_p, while e⊗e does not lie in F₂. The latter is detected on V₁⊗V₁ at q=−1, where e²=0 but e⊗e≠0.

**Sources.** [Habiro 2008][H06], §§2.1–2.6, pp. 7–11, quantum algebra, integral forms and completions.

<a id="qt-1-ribbon-structure"></a>

### The ribbon structure of U_h(sl(2))

U_h(sl₂) has ΔH=H⊗1+1⊗H, ΔE=E⊗1+K⊗E, ΔF=F⊗K⁻¹+1⊗F, S(H)=−H, S(E)=−K⁻¹E, S(F)=−FK. With D=exp(hH⊗H/4), R=D Σ_n v^(n(n−1)/2)(v−v⁻¹)^n/[n]! F^n⊗E^n. If R=Σ α⊗β, the ribbon element is r=Σ S(α)K⁻¹β and the pivotal element is κ=K⁻¹. Positive framing acts by r⁻¹, with scalar q^(n(n+2)/4) on V_n. All infinite sums live in specified h-adic completed tensor products.

**Depends on.** [Quantum sl₂ algebra and integral forms][AQT09]; [Ribbon category][AQT11].

**Proof.** Check Hopf and quasitriangular identities from the ordered formulas in Habiro §3.1. Construct r and prove centrality, S(r)=r, ε(r)=1 and Δr=(R₂₁R)⁻¹(r⊗r). On finite free modules use R for braiding and r⁻¹ for the twist; compare the duality with Mathlib ExactPairing.

**API.**

- `universalR`: The universal R-matrix of U_h, an invertible element of the completed tensor square.
- `yangBaxter`: The universal R-matrix satisfies the Yang-Baxter equation.
- `ribbonElement`: The ribbon element is a central invertible element with the standard compatibility with the coproduct and antipode.
- `braidedCategory_modules`: The category of finite-rank topologically free U_h-modules is braided, with braiding given by the R-matrix.
- `rigidCategory_modules`: The same category is rigid, with duals given by the antipode and the grouplike element.
- `coproduct`, `counit`, `antipode`: continuous maps with the displayed generator values, coassociativity, counit laws and both antipode identities; the antipode is an algebra map to Uhᵐᵒᵖ.
- `universalRAtPrecision`, `inverseRAtPrecision`: the finite sums n<p, with the inverse Cartan exponential on the right in the balanced formula, define the two sides of the unit `universalR`.
- `ribbonAtPrecision`, `inverseRibbonAtPrecision`: equations (3.8)–(3.9) define the central ribbon unit; `ribbon_color` and `twist_color` give exp(∓n(n+2)h/4).

**Tests.**

- `ribbon_unknot_framing`: A positive unit framing acts by r⁻¹, hence by q^(n(n+2)/4) on V_n. Using r instead reverses the anomaly.
- `R_matrix_classical_limit`: Modulo h the R-matrix is the identity, so the braiding degenerates to the symmetry of the classical category.
- `quantum_dimension_V1`: The quantum dimension of the 2-dimensional module is the quantum integer [2], not 2; a definition returning the ordinary dimension is wrong.
- `R_matrix_first_order`, `R_matrix_inverse_order`, `ribbon_negative_framing`: R=1+h(H⊗H/4+F⊗E) modulo h²; its ordered inverse multiplies to one; r acts on V₁ by exp(−3h/4).

`FiniteQuantumModule` is the native full subcategory of `ModuleCat Uh` whose scalar restriction is finite free. `finiteCoordinates` uses `Module.finBasis`; its transported uniformity has the native `(h)`-adic module topology, is complete and separated, and makes actions and module morphisms continuous. `finiteTensorUnderlying` identifies the scalar module tensor with Δ action. `finiteBraiding_formula` is flip after R. Native right duals evaluate dual⊗V and use S; left duals evaluate V⊗dual and use S⁻¹. Both use `Module.Dual`, canonical dual-basis coevaluation and `ExactPairing`. `finiteModuleRibbon` has twist r⁻¹; `finiteColor` identifies the rank-n+1 matrix module. Tests `module_unit_rank`, `module_tensor_native`, `module_dual_native`, `module_braiding_R`, `module_color_carrier` and `module_twist_color_one` distinguish the unit, tensor/dual carriers, R and exp(3h/4).

**Sources.** [Habiro 2008][H06], §3.1, pp. 11–12; §5.1, pp. 18–19, ribbon structure and colors.

<a id="qt-1-braided-hopf-structure"></a>

### Braided Hopf algebra structure on the completed even integral form

The braided Hopf algebra structure of the braided transmutation of U_h induces a braided Hopf algebra structure with invertible antipode on the image completion of the even integral form; that is, each of the braided structure maps, and the inverses of the braiding and the antipode, carries the completed even form into the appropriate completed tensor power.

**Hypotheses.** the even completion is the image of the e-power inverse limit; the braided Hopf structure on U_h is the transmutation of its ribbon Hopf structure

**Depends on.** [Quantum sl₂ algebra and integral forms][AQT09]; [The ribbon structure of U_h(sl(2))][AQT12].

**Proof.** Recall the braided transmutation of U_h: the same algebra with the braided coproduct and antipode built from the R-matrix. Check on the free basis of the even form that each structure map has image in the completed tensor power of the even form. Extend to the completion by continuity, using that each structure map respects the defining filtration. Record that the same holds for the odd form and for the Z/2-grading, which is the variant used for bottom knots.

**Checks.**

- Each of the braided product, unit, coproduct, counit, antipode and its inverse preserves the integral form.
- A structure map that left the integral form would break the integrality of the universal invariant, which is the point of the theorem.
- The statement fails for the non-completed form, so the completion is not cosmetic.

**Native maps.** `adjointEvaluation` extends (a⊗b,x)↦axS(b); composing with Δ gives `adjointAction`, with K▷x=KxK⁻¹ and e▷x=ex−KxK⁻¹e. `integralAdjoint_stable` is Proposition 2.2. `braidedSwap` is flip after the componentwise adjoint R action. The contraction formulas define Δ̲(x)=Σx₁S(β)⊗(α▷x₂), S̲(x)=ΣβS(α▷x), and S̲⁻¹(x)=ΣS⁻¹(α▷x)β. These are continuous linear maps, using the braided tensor product for multiplicativity. Each map and its stated inverse preserves the completed even images. Their image filtrations come from kernels of the integral quotient projections; ψ±¹ and S̲±¹ preserve F_p, while Δ̲(F_p)⊂F_⌊(p+1)/2⌋.

`braidedMultiply_pure` multiplies x⊗y and u⊗v as (x⊗1)ψ(y⊗u)(1⊗v); Δ̲ is multiplicative for this product. The continuous leg maps give coassociativity, both counit and antipode identities.

**Tests.** `braided_swap_classical_limit` gives the flip modulo h; `braided_coproduct_unit` and `braided_antipode_unit` give one. `even_requires_transmutation` excludes Δ(FK) from the completed even tensor square; `transmuted_coproduct_even` includes Δ̲(FK). `braided_antipode_invertible` tests its inverse and `braided_coproduct_precision_loss` records F₅→F₃. `braided_product_crossing`, `braided_product_unit` and `inverse_braided_antipode_precision` test the middle crossing, both units and inverse precision.

**Sources.** [Habiro 2008][H06], Proposition 2.2, §2.4, p. 9; equations (3.10)–(3.12), §§3.2–3.3, pp. 12–14, Theorem 3.1 and Proposition 3.3.

<a id="qt-1-bottom-tangle"></a>

### Bottom tangles and their closure

An n-component bottom tangle is a framed oriented union of n arcs in the cube with the i-th arc from bottom endpoint 2i to 2i−1 and no closed component. Closure by exterior arcs gives a framed link; every framed link has such a presentation. Juxtaposition tensors bottom tangles. Composition is the action of Habiro’s category B (objects b^m, suitable tangle morphisms b^m→b^n) on bottom tangles, rather than arbitrary vertical stacking of two all-bottom tangles.

**Depends on.** [GeometricTopology — layer-4-knot-theory-done-properly-owned-here][GT4]; [Framed links and linking matrix][AQT01].

**API.**

- `BottomTangle`: BottomTangle n is the type of n-component bottom tangles up to isotopy.
- `closure`: closure sends a bottom tangle to a framed oriented link with the same number of components.
- `closure_surjective`: Every framed oriented link is the closure of some bottom tangle.
- `bottomTangleAction`: A B-morphism b^m→b^n acts on an m-component bottom tangle to give an n-component bottom tangle.
- `tensor`: Juxtaposition gives BT_m×BT_n→BT_(m+n).

**Tests.**

- `closure_trivial`: The closure of the trivial bottom tangle is the zero-framed unlink.
- `closure_of_bottom_knot`: A one-component bottom tangle closes to a knot; the number of components is preserved.
- `bottomTangle_not_closed`: A tangle with a closed component is not a bottom tangle; this excludes the degenerate case where the universal invariant would already be a trace.

**Sources.** [Habiro 2008][H06], §4.1, pp. 14–15, bottom tangles and their closure.

<a id="qt-1-universal-sl2-invariant"></a>

### The universal sl(2) invariant of a bottom tangle

For T∈BT_n the bead-reading rule gives J_T∈U_h completed⊗n, invariant under framed tangle isotopy and in the diagonal adjoint-invariant submodule. Crossings use R±1, local turns use the pivotal data, and products are read from right to left along the oriented components. J of the trivial bottom tangle is 1⊗⋯⊗1; tensor is juxtaposition and B-actions are represented by the corresponding braided structure maps.

**Depends on.** [Bottom tangles and their closure][AQT07]; [The ribbon structure of U_h(sl(2))][AQT12]; [Reshetikhin–Turaev functor][AQT10].

**Proof.** Assign the local bead rules, using the stated order and pivotal element. Verify the local isotopy relations from the ribbon axioms. Compare the B action with braided multiplication/comultiplication and diagonal adjoint invariance.

**API.**

- `J`: J T is the universal invariant of the bottom tangle T, an element of the completed n-fold tensor power.
- `J_trivial`: The universal invariant of the trivial bottom tangle is the unit.
- `J_bottomTangleAction`: J intertwines the category B action with the specified braided Hopf maps, where that action is defined.
- `J_tensor`: The universal invariant of a juxtaposition is the tensor product of the invariants.
- `J_mem_invariants`: The universal invariant lies in the adjoint-invariant part of the completed tensor power.

**Tests.**

- `J_unknot_zero_framed`: The universal invariant of the 0-framed unknotted bottom tangle is the unit.
- `J_framing_change`: Adding a positive kink inserts r⁻¹ in the bead product; invariance under an unframed Reidemeister-I move would lose the framing.
- `J_hopf_nontrivial`: The universal invariant of the bottom tangle closing to the Hopf link is not the unit, so the invariant sees linking.

**Sources.** [Habiro 2008][H06], §4.2, pp. 15–16, universal invariant.

<a id="qt-1-universal-invariant-integrality"></a>

### Integrality of the universal invariant on 0-framed bottom tangles

For an algebraically split AND 0-framed n-component bottom tangle T, J_T lies in Inv((completed U_q^ev) completed⊗n), where completion means the image of the e-power tensor filtration in U_h completed⊗n. No conclusion of this form is claimed for every 0-framed link.

**Depends on.** [The universal sl(2) invariant of a bottom tangle][AQT16]; [Braided Hopf algebra structure on the completed even integral form](#qt-1-braided-hopf-structure); [Framed links and linking matrix][AQT01].

**Proof.** Generate algebraically split 0-framed bottom tangles using the Borromean bottom tangle and category B operations. Compute integral even Borromean coefficients. Use closure under ψ±1, μ, braided Δ and braided S±1 and the diagonal adjoint action.

**Checks.**

- The invariant of the 0-framed unknotted bottom tangle lies in the integral submodule, being the unit.
- The theorem fails for non-zero framings, where the ribbon element contributes denominators; this is why the framing hypothesis is present.
- Integrality is what makes the coloured Jones polynomials Laurent polynomials rather than rational functions.

**Sources.** [Habiro 2008][H06], Theorem 4.1, p. 16; proof in §4.3, pp. 16–17.

<a id="qt-1-topological-ribbon-hopf-algebras"></a>

### Ribbon Hopf algebras over a formal power series ring, and the category they present

A topological ribbon Hopf algebra over ℂ[[h]] is topologically free of countable topological rank, with invertible antipode and continuous Hopf structure maps into h-adic completed tensor products, a quasitriangular R and a central invertible ribbon r. A sequence is zero-convergent when each fixed h-adic quotient has only finitely many nonzero terms. The completed tensor product, dual maps and ribbon/pivotal identities are part of the structure. This is the ambient object in Habiro–Le, not an assumption that arbitrary integral subalgebras inherit its completion. Explicitly, Δ^op(a)=RΔ(a)R⁻¹, (Δ⊗id)R=R₁₃R₂₃, (id⊗Δ)R=R₁₃R₁₂, and the normalized counit identities hold. If u=μ(S⊗id)(R₂₁), then r²=uS(u), S(r)=r, ε(r)=1 and Δ(r)=(R₂₁R)⁻¹(r⊗r). All products and maps here use the specified completed tensor topology.

**Depends on.** `HopfAlgebra`; [Ribbon category][AQT11]; `AdicCompletion`; `UniformSpace.Completion`.

**API.**

- `TopologicalRibbonHopfAlgebra`: A countable-rank topologically free Hopf algebra over ℂ[[h]] with continuous completed-tensor maps, R and r satisfying the displayed ribbon identities.
- `TopologicalRibbonHopfAlgebra.R`: The invertible element of the completed tensor square, with the quasi-triangularity identities.
- `TopologicalRibbonHopfAlgebra.ribbon`: The central invertible element with its coproduct and antipode axioms.
- `TopologicalRibbonHopfAlgebra.moduleCategory`: Finite-rank topologically free continuous modules form a ribbon category, with braiding from R and positive twist from r⁻¹.
- `TopologicalRibbonHopfAlgebra.duals`: Finite-rank topologically free modules have continuous left/right duals and evaluation/coevaluation. No rigidity of all infinite-rank topologically free modules is asserted.
- `ZeroConvergent`: Zero-convergent families and the sums they define, which is what makes infinite expansions meaningful.

**Tests.**

- `trivialRibbonHopf`: The ground ring itself, with trivial R-matrix and ribbon element, is a topological ribbon Hopf algebra whose universal invariant is constant; this is the degenerate case.
- `twist_unit`: The twist on the tensor unit is the identity, which is the statement that the ribbon element acts trivially on the trivial module.
- `braiding_not_symmetric`: For the quantised enveloping algebra the braiding is not a symmetry: its square on a two-dimensional module is not the identity, which is exactly what makes the invariant see the knotting.
- `groupAlgebra_symmetric`: The completed group algebra of a countable abelian group with trivial R-matrix gives a symmetric, not merely braided, category; its universal invariant cannot distinguish a knot from the unknot.

**Sources.** [Habiro–Lê][AQT55], §§2.1–2.3, pp. 12–16; ribbon axioms in §2.2, pp. 14–15.

<a id="qt-1-core-subalgebras-and-twist-forms"></a>

### The abstract data that turns a ribbon Hopf algebra into an invariant of homology spheres

A core subalgebra X of a topological ribbon Hopf algebra is topologically free with continuous Δ(X)⊂completed X⊗X, S±1(X)⊂X, adjoint stability, and R in the ambient h-adic closure of X⊗X and the pivotal element g in X itself. For the clasp c=Σ c′_i⊗c″_i, both families are zero-convergent topological bases of X. If x=Σ x″_ic″_i lies in its ambient closure and y=Σ y′_ic′_i lies in X, define ⟨x,y⟩=Σ x″_iy′_i; its convergence follows from these basis conditions. Twist forms are T±(y)=⟨r±1,y⟩. Their normalization is T±(1)=1. Construction of an integral invariant also needs the integral K_n stability conditions, separately planned. No arbitrary scalar Gauss denominator is inserted.

**Depends on.** [Topological ribbon Hopf algebras][AQT14].

**API.**

- `CoreSubalgebra`: Topological core with both clasp basis conditions and stability.
- `claspForm`: Continuous pairing between the closure and the core with the coordinate formula above.
- `CoreSubalgebra.twistForm`: T±(y)=⟨r±1,y⟩.
- `CoreSubalgebra.twistForm_one`: Both twist forms send 1 to 1.

**Tests.**

- `claspForm_dualBasis`: The two clasp basis families pair as Kronecker delta.
- `coreInvariant_empty`: The empty surgery presentation gives 1, without a denominator.
- `core_pairing_no_arbitrary_dual`: A one-sided basis without the other topological basis does not satisfy CoreSubalgebra; it cannot define the coordinate pairing.

**Sources.** [Habiro–Lê][AQT55], Definition 3, §2.14, p. 28; §§2.15–2.16, pp. 29–35, core and twist systems.

<a id="qt-1-root-of-unity-categories-are-not-generically-semisimple"></a>

### What specialising at a root of unity does and does not give

Keep three settings distinct: generic h-adic finite free modules; integral PBW forms and their image completions; and specialized tilting modules at a specified root. The last category is not generically semisimple. Negligibility means every composite endomorphism has zero quantum trace, not merely that an arbitrary object has zero quantum dimension. The negligible quotient and its allowed alcove are separate constructions. Modularity needs extra root/type restrictions; general Lie-type strong Kirby colors in QT.4 do not imply a modular category at every admissible root.

**Depends on.** [Quantum sl₂ algebra and integral forms][AQT09]; [Tilting semisimplification][AQT13]; [Strong Kirby colors][AQT27].

**Sources.** [Quantum groups at roots of unity and modularity][AQT60], §4, pp. 18–22, tilting modules; §6, Theorem 5, pp. 24–26, negligible quotient.

<a id="qt-1-ribbon-category"></a>

### Ribbon category

A ribbon category is a braided rigid monoidal category with a natural automorphism θ of the identity satisfying θ₁=id, θ_(X⊗Y)=(θ_X⊗θ_Y) followed by the double braiding, and θ_(X*)=(θ_X)* for the chosen rigid duality. All associators/unitors and the dual comparison are retained; no symmetric-braiding axiom is imposed. Its pivotal trace is the ribbon graphical closure of an endomorphism.

**Depends on.** `CategoryTheory.MonoidalCategory`; `CategoryTheory.BraidedCategory`; `CategoryTheory.RigidCategory`; `CategoryTheory.ExactPairing`.

**API.**

- `RibbonCategory`: The pinned braided rigid category together with the natural twist and the three equations above.
- `ribbonTwist_tensor`: The twist of a tensor product is the double braiding composed with the tensor of twists.
- `ribbonTwist_dual`: Dualizing θ_X gives θ_(X*).
- `ribbonTrace`: Graphical closure gives an endomorphism of the tensor unit; compare with the pivotal quantum trace.

**Tests.**

- `ribbonTwist_unit`: The twist on the tensor unit is the identity.
- `ribbonTrace_vectorSpace`: For finite-dimensional vector spaces with flip braiding and trivial twist the ribbon trace is the ordinary trace.
- `ribbonTwist_sl2_V1`: In the generic sl₂ instance a positive twist on V₁ acts as q^(3/4), so θ is not the identity.

**Sources.** [Habiro 2008][H06], §3.1, pp. 11–12; §5.2, pp. 19–20; [Ribbon graphs and their invariants derived from quantum groups][AQT64], §§2.1–2.2, pp. 2–4; §§3.1–3.3, pp. 4–7; Theorem 5.1, pp. 12–13.

<a id="qt-1-reshetikhin-turaev-functor"></a>

### Reshetikhin–Turaev functor

For a ribbon Hopf algebra (A,R,r) over a field, the finite-dimensional module category admits the unique tensor functor from homogeneous colored directed ribbon graphs that sends signed colors to V or V*, coupons to their A-linear maps, crossings to flip∘R and turns to the evaluation/coevaluation with pivotal u r⁻¹. Its value on a closed colored framed link is a scalar invariant under framed isotopy. For U_h use finite free modules over the complete base and continuous structure maps. The geometric ribbon-graph presentation is imported, not a new link carrier.

**Depends on.** [Ribbon category][AQT11]; [GeometricTopology — layer-4-knot-theory-done-properly-owned-here][GT4]; `HopfAlgebra`; [Topological ribbon Hopf algebras][AQT14].

**Proof.** Use the supplier diagram generators and isotopy relations (RT Lemmas 5.2–5.3). Assign R, pivotal duality and coupons; verify the relations by the ribbon identities. Uniqueness follows from generation; compare the h-adic assignment with Habiro’s bead reading.

**API.**

- `RTFunctor`: Tensor functor with the specified generators and color duality.
- `RTFunctor_coupon`: The image of an A-linear coupon is its label.
- `RTFunctor_tensor`: Juxtaposition maps to the tensor product of maps.
- `RTFunctor_closed`: Closing a component is pivotal quantum trace.

**Tests.**

- `RTFunctor_empty`: The empty closed graph evaluates to 1.
- `RTFunctor_straight`: The straight colored strand evaluates to id_V.
- `RTFunctor_crossing_inverse`: A crossing followed by its inverse is the identity; a positive crossing alone is not assumed involutive.

**Sources.** [Habiro 2008][H06], §5.2, pp. 19–20; [Ribbon graphs and their invariants derived from quantum groups][AQT64], Theorem 5.1, §5.1, pp. 12–13; proof in §5.4, pp. 15–16; ribbon structure in §3.3, p. 7.

<a id="qt-1-tilting-negligible-quotient"></a>

### Tilting semisimplification

Specialize the Lusztig divided-power quantum group at the source root: q=s^L, s of order lL, l′=l for odd l and l/2 for even l. For types with d_max|l′ require l′≥d_max h∨; otherwise l′>h. The tilting category consists of modules with Weyl and dual Weyl filtrations. Quotient Hom(V,W) by maps f with qtr(hf)=0 for every h:W→V. Sawin’s full ribbon functor yields a semisimple ribbon category with simples in the open affine alcove ⟨λ+ρ,θ₀⟩<l′. For sl₂ in Habiro variables v of order 2r, r≥2, the admissible colors are V₀,…,V_(r−2); the source root-lattice scaling must be compared before using this specialization. General-type modularity is not asserted.

**Depends on.** [Reshetikhin–Turaev functor][AQT10]; [RepresentationTheory/LieHighestWeight — layer-3-enveloping-algebra-verma-modules-and-lλ][LHW3]; [Drinfeld–Jimbo algebra][AQT08].

**Proof.** Construct specialized Lusztig modules and Weyl filtrations using the supplier algebraic representation theory. Prove the negligible maps form a tensor ideal, then use Sawin’s alcove and tilting decomposition theorem. Descend ribbon evaluation through the full quotient functor and compare the sl₂ root convention.

**API.**

- `TiltingModule`: Module with both Weyl and dual Weyl filtrations.
- `IsNegligibleMorphism`: f:V→W is negligible iff qtr(hf)=0 for all h:W→V.
- `TiltingSemisimplification`: The quotient ribbon category by the negligible tensor ideal.
- `tiltingSimple_alcove`: Simples are labelled by the stated open affine alcove under the root bounds.

**Tests.**

- `negligible_identity_outside_alcove`: An indecomposable tilting module outside the alcove has negligible identity under the root bounds.
- `tilting_unit_not_negligible`: The unit has quantum trace 1 and survives.
- `sl2_alcove_rank`: For r=3 the two retained sl₂ labels are 0 and 1; the weight r−1=2 does not survive as a simple.

**Sources.** [Quantum groups at roots of unity and modularity][AQT60], §4, pp. 18–22; §6, Theorem 5, pp. 24–26.

<a id="qt-1-general-drinfeld-jimbo-algebra"></a>

### Drinfeld–Jimbo algebra

For a finite-dimensional simple complex Lie algebra with normalized short-root length²=2, put d_i=(α_i,α_i)/2∈{1,2,3}, v_i=v^d_i, q=v², and use root lattice Y⊂weight lattice X with D=|X/Y|. U_h(g) has Cartan-root commutators, [E_i,F_j]=δ_ij(K_i−K_i⁻¹)/(v_i−v_i⁻¹), and quantum Serre relations of degree 1−a_ij, with K_i=exp(hH_i/2) in the source convention. The generic U_q(g) over ℂ(v) embeds in U_h(g); its PBW root-vector and Lusztig divided-power integral forms are distinguished. Classical root data and ordinary PBW are imported from LieHighestWeight.

**Depends on.** `HopfAlgebra`; [RepresentationTheory/LieHighestWeight — layer-3-enveloping-algebra-verma-modules-and-lλ][LHW3]; [Topological ribbon Hopf algebras][AQT14]; [RepresentationTheory/LieHighestWeight — layer-1-cartan-subalgebras-and-the-root-space-decomposition](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md#layer-1-cartan-subalgebras-and-the-root-space-decomposition).

**API.**

- `DrinfeldJimboDatum`: Root/weight lattices, d_i,D and the chosen root ordering.
- `DrinfeldJimboAlgebra`: The topological quantum Serre algebra for that datum.
- `quantumPBWBasis`: Ordered root-vector divided powers and Cartan factors form the specified PBW basis.

**Tests.**

- `DJ_sl2_relations`: For rank one the relations reduce to QT.1 U_h(sl₂), including the correct F weight sign.
- `DJ_serre_commuting_roots`: For a_ij=0 the quantum Serre relation is E_iE_j=E_jE_i.
- `DJ_root_lengths_G2`: In G₂ the long-root d_i is 3; replacing every v_i by v loses the Serre coefficients.

**Sources.** [Habiro–Lê][AQT55], §§3.1–3.4, pp. 36–40, quantum presentations, gradings and triangular forms.

<a id="qt-1-general-integral-core"></a>

### Integral core subalgebra

For the ordered PBW data of U_h(g), the h-adic core X_h over ℂ[[√h]] has weighted basis h^(||n||/2)b_h. Over A=ℤ[v±1] adjoin the square roots √Φ_k(q) to form Ã. The integral core X_ℤ is the Ã-span of √((q;q)_n)b^Lusztig_n with the multi-index factorial and PBW ordering of Habiro–Le §5. It is free with those two-sided clasp bases and is stable under the coproduct, antipode, adjoint action, braiding, bar and mirror operations. These weighted lattices are separate from U_A and from the eventual ℤ[q±1] coefficient ring.

**Depends on.** [Drinfeld–Jimbo algebra][AQT08]; [The abstract data that turns a ribbon Hopf algebra into an invariant of homology spheres](#qt-1-core-subalgebras-and-twist-forms); `Polynomial.cyclotomic`.

**Proof.** Use §3 PBW and the dual PBW form to factor the clasp. Insert h^(||n||/2) weights to build the topological core; verify both clasp bases (§4). Use the cyclotomic square-root weights and divisibility to prove integral stability and T±(X_ℤ)⊂Ã (§5).

**API.**

- `weightedPBWCore`: The √h-adic core with the displayed weighted PBW basis.
- `integralQuantumCore`: The Ã-lattice with cyclotomic square-root PBW weights.
- `integralCore_twist`: The clasp twist forms take the integral core to Ã.
- `integralCore_stable`: The specified Hopf, adjoint, braiding, bar and mirror maps preserve the core.

**Tests.**

- `integralCore_unit`: The zero PBW index has weight 1 and contains the unit.
- `integralCore_sl2`: Under the rank-one identification the core construction yields the sl₂ integral image used for unified invariants, with its own coefficient comparison.
- `integralCore_weights_essential`: The n-th positive-root basis weight contains √((q;q)_n), rather than an unweighted Lusztig basis; omitting that weight is a different lattice.

**Sources.** [Habiro–Lê][AQT55], §§4–5, pp. 46–67, h-adic and integral cores.

<a id="qt-2"></a>

## QT.2 — Cyclotomic colors and colored Jones invariants

<a id="qt-2-coloured-jones"></a>

### Coloured Jones polynomials from the universal invariant

For a framed m-component oriented link presented as closure of T, put J_L(V_(n₁),…,V_(n_m))=(tr_q^(V_n₁)⊗⋯⊗tr_q^(V_nm))(J_T). This is independent of T and multilinear in virtual colors. The empty link has value 1; the zero-framed unknot has [n+1]. Generic framed values may need ℤ[q^(±1/4)]; even framings give ℤ[v±1], and algebraically split zero-framed links give ℤ[q±1]. Positive framing on a V_n component multiplies by q^(n(n+2)/4). For a zero-framed knot define J^red_(K,N)=J_K(V_(N−1))/[N] as a Laurent polynomial by the divisibility theorem before root evaluation, N≥1.

**Depends on.** [The universal sl(2) invariant of a bottom tangle][AQT16]; [Reshetikhin–Turaev functor][AQT10]; [Finite free sl₂ colors][AQT20].

**Proof.** Use RT graphical closure to prove isotopy and closure independence. Extend traces linearly to virtual colors. Distinguish scalar-field targets and reduced division before specialization; quantum dimension vanishes at some roots.

**API.**

- `colouredJones`: colouredJones L n is the coloured Jones polynomial of the framed link L with the given colours.
- `colouredJones_unknot`: The 0-framed unknot coloured by V_n has value the quantum integer [n+1].
- `colouredJones_multilinear`: The coloured Jones invariant is multilinear in the colours, hence extends to the representation ring.
- `reducedJones`: The reduced coloured Jones polynomial is the quotient by the value of the unknot with the same colour.
- `colouredJones_framing_change`: Changing the framing of a component multiplies the invariant by the ribbon scalar of its colour.

**Tests.**

- `colouredJones_unknot_V1`: The 0-framed unknot coloured by the 2-dimensional module has value the quantum integer [2], not 1; a definition returning 1 is the reduced one.
- `colouredJones_positive_framing`: The +1-framed unknot in color V₁ has q^(3/4)(v+v⁻¹), not merely [2].
- `colouredJones_split_union`: For a split union the invariant is the product of the invariants, so a definition that failed multiplicativity would be wrong.

**Sources.** [Habiro 2008][H06], §§5.2–5.3, pp. 19–20; §6.2, pp. 21–22.

<a id="qt-2-p-basis"></a>

### The elements P_n and the cyclotomic basis of the representation ring

In ℚ(v)[X]=R_ℚ(v), X=V₁, define {a}=v^a−v⁻a, {n}!=∏_(j=1)^n{j}, {a}_b=∏_(j=0)^(b−1){a−j}. Set P_n=∏_(i=0)^(n−1)(X−v^(2i+1)−v^(−2i−1)), P′_n=P_n/{n}!, P″_n=P_n/{2n+1}_(2n), and P̃′_n=v^(−n(n−1)/2)P′_n. P_n is monic and forms a triangular basis over ℤ[v±1]; the three rescalings are distinct elements in the fraction-field representation algebra.

**Depends on.** [Finite free sl₂ colors][AQT20].

**API.**

- `P`: The exact monic product P_n in R_A.
- `P_prime`: P′_n=P_n/{n}! in R_ℚ(v).
- `P_doublePrime`: P″_n=P_n/{2n+1}_(2n).
- `P_tildePrime`: P̃′_n=v^(−n(n−1)/2)P′_n.
- `P_basis`: The P_n form a monic triangular A-basis.

**Tests.**

- `P_zero_eq_one`: P₀=P′₀=P″₀=1.
- `P_one`: P₁=X−v−v⁻¹.
- `P_rescalings_distinct`: P″₁=P₁/({3}{2}) whereas P′₁=P₁/{1}; the denominators are different.

**Sources.** [Habiro 2008][H06], §6.1, p. 21, P and P″; §8.1, p. 28, P′ and P̃′.

<a id="qt-2-dual-basis-pairing"></a>

### The quantum trace pairing is dual to the cyclotomic basis

For m,n≥0, tr_q^(P″_m)(σ_n)=δ_mn, where the trace is linearly extended over ℚ(v) and σ_n has the Casimir normalization above.

**Depends on.** [The elements P_n and the cyclotomic basis of the representation ring][AQT22]; [Completed even center][AQT18]; [Finite free sl₂ colors][AQT20].

**Proof.** Compute the trace of σ_n on V_j from its Casimir eigenvalue and [j+1]. Insert the triangular formula for P″_m. Use the resulting q-binomial cancellation; check m=n=0 gives tr_V0(1)=1.

**Checks.**

- The pairing of P''_0 with sigma_0 is 1 and with sigma_1 is 0.
- Duality forces the coefficients in the cyclotomic expansion to be the reduced coloured Jones values at the colours P''_n.

**Sources.** [Habiro 2008][H06], Proposition 6.3, §6.2, p. 21; proof in §6.3, pp. 22–24.

<a id="qt-2-cyclotomic-expansion"></a>

### Cyclotomic expansion of the universal invariant of a bottom knot

For a zero-framed bottom knot T with closure K there are unique a_i(K)∈ℤ[q±1], a₀=1, with J_T=Σ_i a_i(K)σ_i and a_i(K)=J_K(P″_i). In ordinary colors J_K(V_n)=Σ_(i=0)^n ({n+1+i}_(2i+1)/{1}) a_i(K). The reduced polynomial J^red_(K,N) is obtained by dividing this identity by [N] before evaluation; Habiro’s name “reduced Jones polynomial” a_i is a different normalization from J^red_(K,N).

**Depends on.** [The quantum trace pairing is dual to the cyclotomic basis](#qt-2-dual-basis-pairing); [Completed even center][AQT18]; [Integrality of the universal invariant on 0-framed bottom tangles][AQT15]; [Colored Jones polynomials][AQT17].

**Proof.** Use bottom-knot integrality and adjoint invariance to place J_T in the completed even center. Take quantum trace against the P″ dual basis to extract a_i. Trace in V_n; σ_i vanishes for i>n, giving the finite ordinary-color formula.

**Checks.**

- For the unknot the expansion is the single term sigma_0, so all higher coefficients vanish.
- The coefficients are Laurent polynomials, by the integrality theorem, which is the point of the expansion.
- Summing the expansion against the change-of-basis formula recovers the ordinary coloured Jones polynomials.

**Sources.** [Habiro 2008][H06], Theorem 6.4, §6.2, pp. 21–22.

<a id="qt-2-algebra-P-and-completion"></a>

### The algebra spanned by the cyclotomic elements and its completion

Let P be the ℤ[q±1]-span of P̃′_n in R_ℚ(v), q=v²; it is a subalgebra, not the ℤ[v±1]-span of unnormalized P_n. P_k=span_(ℤ[q±1]){P̃′_n:n≥k} is an ideal and P̂=lim P/P_k, with unique formal coordinates in P̃′_n. In the P′ basis P′_m P′_n=Σ_(i=0)^min(m,n) {m+n}!/({i}!{m−i}!{n−i}!) P′_(m+n−i); rescaling gives integral ℤ[q±1] structure coefficients for P̃′.

**Depends on.** [The elements P_n and the cyclotomic basis of the representation ring][AQT22]; `UniformSpace.Completion`.

**API.**

- `algebraP`: The ℤ[q±1]-linear span of P̃′_n=v^(−n(n−1)/2)P_n/{n}! in ℚ(v)[V₁], with q=v².
- `mul_P`: The displayed P′ multiplication rule, transported to the integral tilde basis.
- `algebraP_isSubalgebra`: The span of P̃′_n is closed under products and contains 1, so is a ℤ[q±1]-subalgebra of ℚ(v)[V₁].
- `filtration`: P_k is the ℤ[q±1]-span of P̃′_n for n≥k; it is an ideal of P and P_kP_l⊂P_max(k,l).
- `completion`: The inverse limit P̂=lim P/P_k has unique convergent coordinates in P̃′_n, with coefficients in ℤ[q±1].

**Tests.**

- `P_zero_eq_one`: P 0 is the unit of the algebra.
- `mul_P_one_one`: P′₁P′₁=({2}!/{1}!²)P′₂+({2}!/{1}!)P′₁; the coefficients change upon tilde rescaling.
- `twistElement_not_mem`: The twist element lies in the completion and not in the algebra, so the completion step is necessary.

**Sources.** [Habiro 2008][H06], §8.1, p. 28, color algebra and its completion.

<a id="qt-2-integrality-algebraically-split"></a>

### Integrality and divisibility for algebraically split 0-framed links

For an m-component algebraically split zero-framed L, colors x_i∈P_(k_i), and k=max_i k_i, J_L(x₁,…,x_m) belongs to ({2k+1}_(q,k+1)/{1}_q)ℤ[q±1], where {a}_q=q^a−1 and {a}_(q,b)=∏_(j=0)^(b−1){a−j}_q. The empty link has value 1 separately. Consequently the multilinear map extends continuously P̂^m→ℤ[q]^ℕ, the Habiro ring.

**Depends on.** [The algebra spanned by the cyclotomic elements and its completion](#qt-2-algebra-P-and-completion); [Integrality of the universal invariant on 0-framed bottom tangles][AQT15]; [Quantum traces of the integral form in cyclotomic colours are integral](#qt-2-quantum-trace-integrality); `HabiroCyclotomicCompletions:HC.1/the-cyclotomic-completion`.

**Proof.** Apply universal even integrality and the strengthened quantum-trace divisibility to the largest filtration index. Use Habiro Theorem 8.2’s explicit ideal, not merely unspecified Laurent integrality. Show its generators are cofinal with cyclotomic factorial ideals, giving the continuous extension (Corollary 8.3).

**Checks.**

- The divisibility fails for links that are not algebraically split, which is why the hypothesis is present.
- The theorem gives the convergence of the surgery sum used to define the unified invariant.

**Sources.** [Habiro 2008][H06], Theorem 8.2 and Corollary 8.3, §8.2, p. 29.

<a id="qt-2-quantum-trace-integrality"></a>

### Quantum traces of the integral form in cyclotomic colours are integral

For x∈U_q^ev and y∈P, tr_q^y(x) lies in ℤ[q±1]. Both the even form and the tilde-normalized ℤ[q±1] color lattice are necessary hypotheses of the stated theorem.

**Depends on.** [Quantum sl₂ algebra and integral forms][AQT09]; [The algebra spanned by the cyclotomic elements and its completion](#qt-2-algebra-P-and-completion); [Finite free sl₂ colors][AQT20].

**Proof.** Compute on PBW x and the tilde P′ basis. Use the divided-power action and q-binomial integrality. Extend linearly over the actual ground ring ℤ[q±1].

**Checks.**

- The trace of the unit in the colour P_0 is 1.
- The trace of a basis monomial with mismatched degrees vanishes, which is the vanishing that makes the computation finite.
- The lemma fails for colours outside the algebra P, where denominators appear, so the restriction on colours is necessary.

**Sources.** [Habiro 2008][H06], Lemma 8.5, §8.3, p. 29; proof in §8.4, pp. 30–31.

<a id="qt-2-coloured-jones-determination"></a>

### Each coloured Jones polynomial is determined modulo an explicit ideal by the earlier ones

For a zero-framed knot and n≥1, the values J_K(V₀),…,J_K(V_(n−1)) determine a₀,…,a_(n−1) exactly and determine J_K(V_n) modulo ({2n+1}_(2n)) in ℤ[v±1]. The new term has coefficient {2n+1}_(2n+1)/{1}={2n+1}_(2n). This is a finite triangular consequence, not reconstruction of a knot from its invariants.

**Depends on.** [Bottom knot cyclotomic expansion][AQT19].

**Proof.** Solve the triangular color system successively in ℚ(v). Use integrality of the extracted a_i. For V_n reduce the last summand modulo its explicit integral factor.

**Checks.**

- The ideal is not the zero ideal, so the statement is a congruence and not an equality; a stronger reading would be false.
- The result is a consequence of integrality and not of the definition, so it fails for invariants without the cyclotomic expansion.

**Sources.** [Habiro 2008][H06], Proposition 6.5, §6.2, p. 22.

<a id="qt-2-truncations-and-what-may-be-done-before-completion"></a>

### Finite truncations, integrality of coefficients, and the order of operations

For N≥0 define Z_K,<N=Σ_(i<N)a_iσ_i in the polynomial center and, for a fixed ordinary color n, T_(K,n,N)=Σ_(i<min(N,n+1)) ({n+1+i}_(2i+1)/{1})a_i∈ℤ[v±1]. If N>n then T=J_K(V_n). Central truncations differ by a multiple of σ_N. They are not one scalar Laurent polynomial equal to every color. Evaluation of Habiro factorial-series truncations is instead the imported HC.2/HC.3 statement and must be applied to an element of that completion; no generic root cutoff for an unspecified Jones truncation is asserted.

**Depends on.** [Bottom knot cyclotomic expansion][AQT19]; [Completed even center][AQT18]; `HabiroCyclotomicCompletions:HC.2/factorial-series`; `HabiroCyclotomicCompletions:HC.3/evaluation-at-a-root-of-unity`.

**Proof.** Truncate the unique central expansion. Trace σ_i in the fixed V_n to obtain the finite sum and its exact range. Keep the central σ-filtration and the scalar Habiro factorial filtration distinct.

**API.**

- `cyclotomicTruncation`: Z_K,<N in the polynomial center.
- `colorTruncation`: The finite scalar sum T_(K,n,N).
- `cyclotomicTruncation_trunc`: Z_K,<M−Z_K,<N is divisible by σ_N for M≥N.
- `colorTruncation_exact`: For N>n the trace truncation equals J_K(V_n).

**Tests.**

- `cyclotomicTruncation_zero`: At N=0 the truncation is 0, whereas the V₀ value becomes 1 at N=1.
- `colorTruncation_V1`: At N=2 the V₁ value is [2]+{3}{2}a₁.
- `cyclotomicTruncation_compat`: Increasing N changes only terms divisible by σ_N.

**Sources.** [Habiro 2008][H06], §6.2, pp. 21–22, finite color traces.

<a id="qt-2-an-expansion-is-a-theorem-about-an-invariant"></a>

### What a cyclotomic expansion is not

HC.2 supplies generic factorial-series representations of elements of the completion. QT.2 proves a different theorem: the integral central σ-expansion of the universal invariant of a zero-framed knot, with uniquely characterized coefficients a_i=J_K(P″_i). A completion element need not be a knot invariant; evaluation at roots alone supplies neither these coefficients nor knot presentation independence. Link divisibility is the algebraically split zero-framed multilinear theorem, not a blanket knot-basis formula for all links.

**Depends on.** [Bottom knot cyclotomic expansion][AQT19]; [Integral colored Jones divisibility][AQT21]; `HabiroCyclotomicCompletions:HC.2/factorial-series`.

**Sources.** [Habiro 2008][H06], §6.2, pp. 21–22; §8.2, p. 29.

<a id="qt-2-the-kashaev-invariant-and-the-function-on-the-rationals"></a>

### The Kashaev invariant, its identification with a colored Jones evaluation, and the periodic function it defines

For N≥2 the Murakami–Murakami theorem identifies Kashaev ⟨K⟩_N with J^red_(K,N)(exp(2πi/N)), where color N means dimension N and the reduced polynomial is formed before specialization. For α=a/c in lowest terms, c>0, set 𝒥_K(α)=J^red_(K,c)(exp(−2πiα)); then 𝒥_K(−1/N)=⟨K⟩_N. It is one-periodic and Galois equivariant: σ_b𝒥_K(a/c)=𝒥_K(ba/c), gcd(b,c)=1. This does not mean that every value is fixed by every Galois automorphism. For 4₁, ⟨4₁⟩_N=Σ_(j=0)^(N−1)|(ζ_N;ζ_N)_j|² and the first six values are 1,5,13,27,46+2√5,89. The order-one extension is defined to be 1. Its root values come from the unified integral Habiro element H_K. The original Kashaev R-matrix presentation is used only by the MM comparison, not replanned as an additional carrier here.

**Depends on.** [Colored Jones polynomials][AQT17]; [Finite truncations, integrality of coefficients, and the order of operations](#qt-2-truncations-and-what-may-be-done-before-completion); `HabiroCyclotomicCompletions:HC.3/evaluation-at-a-root-of-unity`; [Unified Kashaev invariant](#qt-2-unified-kashaev-invariant).

**API.**

- `kashaevInvariant`: The element of the ring of integers with a root of unity adjoined attached to a knot and a positive integer.
- `kashaevInvariant_eq_colouredJones`: Its identification with the evaluation of the colored Jones polynomial in the corresponding colour.
- `kashaevFunction`: 𝒥_K(a/c)=J^red_(K,c)(exp(−2πia/c)), c>0, is one-periodic and Galois equivariant; 𝒥_K(−1/N)=⟨K⟩_N.
- `kashaevFunction_unique`: The values at −1/N, periodicity and σ_b𝒥(a/c)=𝒥(ba/c) uniquely determine the rational function. Values need not be pointwise Galois fixed.
- `figureEightKashaev`: The closed form and the first values for the figure-eight knot.

**Tests.**

- `kashaev_unknot`: For the unknot the Kashaev invariant is one for every order, and the periodic function is constant.
- `figureEightKashaev_small`: The first six values for the figure-eight knot are one, five, thirteen, twenty-seven, forty-six plus twice the square root of five, and eighty-nine; a wrong normalisation would not reproduce them.
- `kashaevFunction_periodic`: The function satisfies that its value at an argument plus one equals its value at the argument; this is what makes the statement at minus one over the integer meaningful.
- `kashaev_Galois_equivariance`: At order 5, the automorphism sending ζ₅ to ζ₅² changes 46+2√5 to 46−2√5; equivariance is not pointwise Galois invariance.

**Sources.** [GZ][GZ], §1, equations (1.1)–(1.2), p. 9, and rational extension on p. 10; [The colored Jones polynomials and the simplicial volume of a knot][AQT63], Theorem 4.9, §4, p. 15.

<a id="qt-2-finite-free-colors"></a>

### Finite free sl₂ colors

For n≥0, V_n is the rank n+1 finite free ℚ[[h]] highest-weight U_h-module of weight n, with basis F̃^(i)v₀, 0≤i≤n, and actions as in Habiro §5.1. For a finite free module V define tr_q^V(x)=Tr(ρ_V(K⁻¹x)). The representation algebra R_A=A[V₁] has V_m V_n=Σ_(j=0)^min(m,n) V_(m+n−2j); equivalently V_n=S_n(V₁) with Mathlib’s second-kind Chebyshev S₀=1,S₁=X,S_(n+2)=XS_(n+1)−S_n. Quantum dimension is [n+1], with [n]=(v^n−v⁻n)/(v−v⁻¹).

**Depends on.** [Quantum sl₂ algebra and integral forms][AQT09]; [The ribbon structure of U_h(sl(2))][AQT12]; `Polynomial.Chebyshev.S`.

**Proof.** Construct the highest-weight action in the ordered basis and check the algebra relations. Use the pivotal closure to identify the quantum trace. Prove the Clebsch–Gordan rule and compare the resulting monic recursion with Chebyshev.S.

**API.**

- `sl2Color`: V_n with rank n+1 and the fixed highest-weight basis.
- `quantumTrace`: Tr(ρ(K⁻¹x)) on a finite free color.
- `sl2RepRing`: R_A=A[X], X representing V₁.
- `qInt`: The balanced Laurent quantum integer [n].
- `color_Chebyshev`: V_n equals Chebyshev.S n evaluated at V₁.

**Tests.**

- `quantum_dimension_V0`: qdim V₀=1.
- `quantum_dimension_V1`: qdim V₁=v+v⁻¹, not the constant 2.
- `color_tensor_V1`: V₁⊗V₁=V₂+V₀, so V₂=X²−1 rather than X².

**Native realization.** Put S=PowerSeries ℚ and v^a=exp(ah/2). The carrier `sl2Color n` is Fin(n+1)→S with `sl2ColorBasis`; matrices act on columns. Write w_i=n−2i. `colorH`, `colorK` and `colorKinv` are diagonal with entries w_i, v^(w_i) and v^(−w_i). The only nonzero generator entries are E_(i−1,i)=v^(n−i+1)[n−i+1] and F_(i+1,i)=v^(i−n)[i+1]. Endpoints vanish. `formalQInt` is the Laurent sum Σ_(i<n)v^(n−1−2i), transported by `laurentToFormal`; no division by v−v⁻¹ in S is used. Its constant term is n and it is a unit for n>0.

The helper `formalQChoose` uses the polynomial Gaussian recurrence at q=v²; `formalQFactorial` is the product of unbalanced [i]_q=Σ_(j<i)q^j. `colorDividedF n m` sends v_i to q^(−mi) binom_q(i+m,m)v_(i+m). `colorSmallEPower n m` sends v_i to ∏_(t<m)(q^(n−i+m−t)−1)v_(i−m). Their APIs compare these matrices with F^m K^m/[m]_q! and e^m, recover the highest-weight basis, and handle m=0 and out-of-range indices. Generator relations include [H,E]=2E, [H,F]=−2F, [E,F]=diag([w_i]), K E=q E K and K F=q⁻¹ F K. `colorK_coeff` records the actual formal exponential, beyond conjugation alone.

`quantumTrace n` is the S-linear functional A↦Tr(K⁻¹A); its diagonal formula, identity value [n+1], and constant-term comparison with ordinary trace form its API. Cyclicity requires an endomorphism commuting with K⁻¹. Tests also use the first matrix unit (trace v⁻¹ rather than v), and EF versus FE on V₁ (different traces), so a reversed pivot or arbitrary cyclic trace fails. On V₂, F̃^(2)v₀=v₂ whereas F²v₀=(v⁻²+v⁻⁴)v₂; at h=0 the generator entries become the classical divided-power matrices, with E entries 2,1 and F entries 1,2. Together with identity colors, endpoint vanishing and the h² coefficient 1/4 of qdim V₁, these test the carrier, basis, formal coefficients and actions.

`tensorColorEquiv` identifies the module tensor product with functions on the product index, explicitly on pure tensors. `tensorColorH/E/F/K` use ΔH=H⊗1+1⊗H, ΔE=E⊗1+K⊗E, ΔF=F⊗K⁻¹+1⊗F and ΔK=K⊗K. `color_clebschGordan` requires a linear equivalence intertwining all four actions with ⊕_(j≤min(m,n))V_(m+n−2j). The zero-color comparison, V₁⊗V₁ comparison and weight-character product test distinguish the coproduct and decomposition. `colorCharacter` sums the H-weights in a second Laurent variable; `colorCharacter_Chebyshev` and `color_repRing_product` compare this character and the polynomial representation algebra, rather than interpreting a dimension identity as a module isomorphism. `colorRepresentation` and `tensorColorRepresentation` extend these actions continuously through QT.1; `ribbon_color` and `twist_color` identify their framing operators.

**Sources.** [Habiro 2008][H06], §5.1, p. 18; §§5.3–5.4, pp. 19–20. Generator conventions: §2.2–2.3, pp. 7–8; basis actions: equations (5.1)–(5.3), p. 19; representation algebra and trace: §§5.3–5.4, p. 20.

<a id="qt-2-completed-even-center"></a>

### Completed even center

Set C=(v−v⁻¹)²FE+vK+v⁻¹K⁻¹ and σ_n=∏_(i=1)^n(C²−q^i−2−q⁻i), σ₀=1. The completed even image center is lim_n ℤ[q±1][C²]/(σ_n); every element has a unique expansion Σ a_n σ_n, a_n∈ℤ[q±1]. The full center has coefficients in A+AC.

**Depends on.** [Quantum sl₂ algebra and integral forms][AQT09]; [Integrality of the universal invariant on 0-framed bottom tangles][AQT15].

**Proof.** Compute the polynomial center by PBW and the Harish–Chandra map (Theorem 9.2), then identify its e-power filtration as (σ_n) (Theorem 9.5). The adjoint construction (§10.3) and cyclotomic valuations (Lemma 10.8) prove Proposition 9.4 integrally. Integral coefficient saturation (Lemmas 9.10–9.12) and Theorem 9.13 identify central series in the image completion. Restrict the q-form and Cartan parity by Theorem 11.2; C² belongs to the even form, while vC belongs to the full q-form. No injectivity of the entire e-adic inverse limit is assumed.

**Native realization.** Use `QuantumEnveloping.EvenCenter.Center`, the Mathlib `Subalgebra.center` of QT.1's actual even image algebra. Use QBase=ℤ[q±1], Y=C² and monic σ_n(Y). `SigmaCompletion` is the compatible subalgebra of ∏_n QBase[Y]/(σ_n), with quotient multiplication. Evaluation in the even integral form descends through the e-power quotients; `sigmaToIntegralLimit` assembles the maps; `sigmaToCenter` realizes their image in U_h. The center theorem gives bijectivity.

Quotients have basis σ₀,…,σ_(n−1). `sigmaQuotientCoordinates` and `sigmaCoordinates` are linear equivalences; `evenCenterRealization` is an algebra equivalence to the actual center. Its discrete-quotient sigma topology is complete and separated; multiplication is continuous and partial sums converge. Identify it separately from the ambient h-adic topology.
**API.**

- `quantumCasimir`: C with the stated normalization.
- `sigma`: The monic central polynomial σ_n.
- `evenCenterExpansion`: An element of the completed even center has unique coefficients a_n∈ℤ[q±1].

**Tests.**

- `sigma_zero`: σ₀=1.
- `sigma_one`: σ₁=C²−q−2−q⁻¹.
- `sigma_Vn_vanish`: σ_i acts by zero on V_n when i>n, since C acts by v^(n+1)+v^(−n−1).

**Additional tests.** σ₁ is nonzero on V₁, but σ₂ annihilates it; C acts on V₀ by v+v⁻¹. The coordinates of σ₁² are a₁=q²+q⁻²−q−q⁻¹ and a₂=1, so multiplication cannot be pointwise. Precision zero is the zero ring, precision one is QBase; arbitrary integral coordinate sequences reconstruct uniquely, and equal coordinates below n give equal projections at precision n. Test C²∈Uqev and vC∈Uq independently.

**Sources.** [An integral form of the quantized enveloping algebra of sl2 and its completions][AQT62], Theorems 9.2 and 9.5, §§9.3–9.4, pp. 19–20; Lemmas 9.10–9.12 and Theorem 9.13, §9.6, pp. 22–23; Proposition 9.4's proof, §§10.3–10.4, pp. 26–30; Theorem 11.2, §11, pp. 30–31.

<a id="qt-2-jones-normalization-comparison"></a>

### Jones normalization comparison

**Comparison target.**

For a zero-framed knot, the fundamental-color quantum invariant is unreduced: J_K(V₁)=[2]J^red_(K,2). Compare J^red_(K,2) to the GeometricTopology Jones V_K(t), V_U=1, t=A⁻⁴, using an explicitly fixed mirror/crossing convention and a proven substitution t=q or q⁻¹. The existence of such a comparison is a planned target; the source conventions read here do not fix which supplier crossing matches Habiro’s positive crossing, so the exact sign is a recorded gap, not silently selected.

**Depends on.** [Colored Jones polynomials][AQT17]; [GeometricTopology — layer-4-knot-theory-done-properly-owned-here][GT4].

**Sources.** [Habiro 2008][H06], §5.2, pp. 19–20; §6.2, pp. 21–22; RT §6.1, p. 17.

<a id="qt-2-unified-kashaev-invariant"></a>

### Unified Kashaev invariant

For a zero-framed knot K with integral cyclotomic coefficients a_n(K)=J_K(P″_n), define H_K(q)=Σ_(n≥0) a_n(K)∏_(i=1)^n(2−q^i−q⁻ⁱ)=Σ a_n(K)(q;q)_n(q⁻¹;q⁻¹)_n in the scalar integral Habiro ring. This is evaluation C²↦4 of the central σ_n expansion; each product is (−1)^n q^(−n(n+1)/2)(q;q)_n², so the series converges in that ring. At a primitive root ζ of order N, evaluation equals the reduced dimension-N colored Jones polynomial J^red_(K,N)(ζ), and terms n≥N vanish. The unknot gives 1 and the order-one value is 1. This construction gives the unified Kashaev element without introducing the entire two-variable completion; that extension belongs to the recorded Part II.

**Depends on.** [Bottom knot cyclotomic expansion][AQT19]; [Completed even center][AQT18]; `HabiroCyclotomicCompletions:HC.1/the-cyclotomic-completion`; `HabiroCyclotomicCompletions:HC.3/evaluation-at-a-root-of-unity`.

**Proof.** Apply the central coefficient theorem to evaluate σ_n at C²=4. Factor the product as a Laurent unit times the square of the cyclotomic factorial; use the imported completion. At ζ^N=1 compare C²=4 with the normalized V_(N−1) trace and use Habiro §7.1, e51; form the reduced polynomial before evaluation.

**API.**

- `unifiedKashaevInvariant`: The displayed factorial-square series in the imported integral Habiro ring.
- `unifiedKashaevInvariant_eval`: At primitive order N its evaluation is J^red_(K,N)(ζ).
- `unifiedKashaevInvariant_truncate`: At order N only terms n<N contribute.
- `unifiedKashaevInvariant_unknot`: The unified unknot invariant equals 1.

**Tests.**

- `unifiedKashaev_unknot`: The unknot gives the constant element 1.
- `unifiedKashaev_order_one`: At q=1 only a₀(K)=1 remains.
- `unifiedKashaev_factorial_square`: The n-th product equals (−1)^n q^(−n(n+1)/2)(q;q)_n², hence has at least twice the factorial divisibility.

**Sources.** [Habiro 2008][H06], §7.1, pp. 24–26, θ₀ specialization.

<a id="qt-3"></a>

## QT.3 — The unified invariant of integral homology spheres

<a id="qt-3-twist-element"></a>

### The twist element in the completed cyclotomic algebra

In P̂ define ω±=Σ_(n≥0)(±1)^n v^(±n(n+3)/2)P′_n. In the P̃′_n basis, the coefficients are q^(n(n+1)/2) for ω+ and (−1)^n q^(−n) for ω−. These satisfy ω+ω−=1. For the Hopf pairing with the even representation subalgebra S_ℚ(v)=span{V_(2j)}, ⟨ω±,x⟩=J_(U±)(x). This characterization is only on even colors, not every element of the full representation algebra. In particular ⟨ω±,V₀⟩=1.

**Depends on.** [The algebra spanned by the cyclotomic elements and its completion](#qt-2-algebra-P-and-completion); [Colored Jones polynomials][AQT17]; [Finite free sl₂ colors][AQT20].

**Proof.** Check integral coefficients after tilde rescaling and convergence in P̂. Use the Hopf-link pairing formula on even colors to characterize ω±. Prove their product is 1 by pairing with a separating family of even colors.

**API.**

- `omega`: omega is the twist element of the completed cyclotomic algebra, in the two sign variants.
- `pairing_omega`: The equality with the ±1-framed unknot pairing holds on S_ℚ(v), the even-color subalgebra.
- `omega_mul_inv`: The two twist elements are mutually inverse in the completed algebra.
- `omega_mem_completion`: The twist element lies in the completion of the cyclotomic algebra and not in the algebra itself.
- `omega_coeff`: The stated tilde-basis coefficients give ω+ coordinates (1,q,q³,…) and ω− coordinates (1,−q⁻¹,q⁻²,…).

**Tests.**

- `pairing_omega_V0`: ⟨ω±,V₀⟩=1.
- `omega_plus_mul_omega_minus`: The product of the two twist elements is 1, which is the algebraic shadow of blowing up and then blowing down.
- `omega_not_finite`: The twist element has infinitely many non-zero cyclotomic coefficients, so it is not an element of the uncompleted algebra.

**Sources.** [Habiro 2008][H06], §9.1, Propositions 9.1–9.2, p. 33.

<a id="qt-3-twisting-theorem"></a>

### Twisting theorem: surgery along a unit-framed unknotted component

For algebraically split zero-framed L=L₁∪⋯∪L_m∪K with K unknotted and colors x_i∈P̂, surgery of sign ε=±1 along K satisfies J_(L_(K,ε))(x₁,…,x_m)=J_L(x₁,…,x_m,ω^(−ε)). The remaining link stays zero-framed in this algebraically split setting; the opposite exponent is essential.

**Depends on.** [The twist element in the completed cyclotomic algebra](#qt-3-twist-element); [Integral colored Jones divisibility][AQT21]; [Hoste moves between admissible links][AQT02].

**Proof.** Use the paired-strand local twist formula and the even-color pairing of ω. Track the convention that ±1 surgery gives a ∓1 geometric full twist. Extend from finite colors by the continuous P̂ multilinear invariant.

**Checks.**

- With no remaining components, surgery on the isolated ±1-framed unknot gives S³ and the formula specializes to J_U(ω^(−ε))=1.
- Applying the theorem twice with opposite signs returns the original invariant, matching that the two twist elements are inverse.
- The identity is an identity in the completed algebra and requires the divisibility theorem for convergence.

**Sources.** [Habiro 2008][H06], Theorem 9.4, §9.2, p. 34.

<a id="qt-3-definition-of-JM"></a>

### The unified invariant of an integral homology sphere

For an integral homology sphere M with admissible presentation L of component framings f_i=±1, let L⁰ be the underlying zero-framed link and set J_M=J_(L⁰)(ω^(−f₁),…,ω^(−f_m))∈ℤ[q]^ℕ. There is no product of unknot denominators in this formula. Convergence comes from QT.2’s algebraically split zero-framed multilinear extension, whose filtration generator at maximal color index tends to zero in the Habiro topology. Empty surgery gives 1.

**Depends on.** [Twisting theorem: surgery along a unit-framed unknotted component][AQT24]; [Integral colored Jones divisibility][AQT21]; [Admissible framed links][AQT00]; [Every integral homology sphere has an admissible surgery presentation][AQT05]; `HabiroCyclotomicCompletions:HC.1/the-cyclotomic-completion`.

**Proof.** Choose an admissible presentation and erase its component framings. Insert the inverse-sign twists in its finite approximants. Use the continuous P̂^m→Habiro map to define the limit; normalize the empty link as 1.

**API.**

- `unifiedInvariantOfPresentation`: The exact formula J_(L⁰)(ω^(−f_i)) in the Habiro ring, with no division.
- `unifiedInvariant_empty`: The empty admissible link gives the element 1.
- `summable`: The defining sum converges in the Habiro ring, by the divisibility theorem.
- `unifiedInvariant_mirror`: Reverse the orientation of the surgered 3-manifold by mirroring the surgery link and negating its framings: J_(−M)(q)=J_M(q⁻¹). Reversing component orientations alone is not this operation.

**Tests.**

- `unified_empty`: The empty presentation gives 1, so the invariant of the 3-sphere is 1.
- `unified_unknot_pm_one`: The plus-one-framed unknot also presents the 3-sphere and must give 1; this is the first non-trivial instance of independence.
- `unified_converges`: The defining sum has terms divisible by higher and higher q-shifted factorials, so it converges in the Habiro ring; a formula without that divisibility would not define an element.

**Sources.** [Habiro 2008][H06], §10.2, Theorem 10.2, p. 35.

<a id="qt-3-JM-well-defined"></a>

### The unified invariant does not depend on the admissible presentation

For an integral homology sphere M the element of the Habiro ring defined by the surgery formula does not depend on the choice of admissible framed link presenting M. Hence the assignment of that element to M is an invariant of integral homology spheres with values in the Habiro ring.

**Hypotheses.** M is an integral homology sphere; the presentations compared are admissible

**Depends on.** [The unified invariant of an integral homology sphere](#qt-3-definition-of-JM); [Refined Kirby calculus for admissible links (Hoste's conjecture)][AQT04]; [Twisting theorem: surgery along a unit-framed unknotted component][AQT24].

**Proof.** By the refined Kirby calculus any two admissible presentations of M are related by isotopies and Hoste moves. Check invariance of the surgery formula under an isotopy, which is immediate from invariance of the coloured invariant. Check invariance under a single Hoste move, using the twisting theorem to compare the two sides. Conclude by induction along the sequence of moves.

**Checks.**

- The empty link and the plus-one-framed unknot both give 1, matching that both present the 3-sphere.
- The proof uses the refined calculus and not the classical one, since the intermediate links of a classical sequence need not be admissible.
- The invariant of a connected sum is the product of the invariants, which is a consistency check on the normalisation.

**Sources.** [Habiro 2008][H06], Theorem 10.2, §10.2, p. 35; refined calculus in §10.1, pp. 34–35.

<a id="qt-3-JM-divisibility"></a>

### First divisibility of the unified invariant

For every integral homology sphere M the element J_M minus 1 is divisible in the Habiro ring by the product of the second and third cyclotomic-type factors, namely by (q squared minus 1)(q cubed minus 1) divided by (q minus 1).

**Hypotheses.** M is an integral homology sphere

**Depends on.** [The unified invariant does not depend on the admissible presentation](#qt-3-JM-well-defined); [Integral colored Jones divisibility][AQT21].

**Proof.** Expand the surgery formula and isolate the constant term, which is 1. Bound the remaining terms by the divisibility theorem for algebraically split 0-framed links with colours in the first filtration step. Combine the resulting factors and identify the product as the displayed one.

**Checks.**

- For the 3-sphere the statement is trivial, since the difference is 0.
- Expanding the divisor at q=1 begins with 6(q−1), hence the coefficient of q−1 in J_M−1 is divisible by 6. Integrality of all Taylor coefficients instead follows from the integral Habiro Taylor map.

**Sources.** [Habiro 2008][H06], Lemma 10.3, §10.3, p. 36; stronger Proposition 12.14, §12.4.2, p. 44.

<a id="qt-3-JM-connected-sum-and-orientation"></a>

### Multiplicativity under connected sum and behaviour under orientation reversal

The unified invariant is multiplicative under connected sum, so that the invariant of a connected sum is the product of the invariants, and the invariant of the 3-sphere is 1. Reversing the orientation of an integral homology sphere replaces the invariant by the image of the invariant under the ring involution sending q to its inverse.

**Hypotheses.** M and the second manifold are integral homology spheres

**Depends on.** [The unified invariant does not depend on the admissible presentation](#qt-3-JM-well-defined); [GeometricTopology — layer-1-manifold-library-buildout-general-dimension-general-structure-group][GT1]; `HabiroCyclotomicCompletions:HC.1/the-cyclotomic-completion`.

**Proof.** Present the connected sum by the split union of admissible presentations of the two summands. Use multiplicativity of the coloured invariant on split unions to factor the surgery formula. For orientation reversal, take the mirror image of the presentation and track the effect on the twist elements and on the coloured invariant. Identify the result with the ring involution of the Habiro ring.

**Checks.**

- The invariant of the 3-sphere is 1, which is the empty case of multiplicativity.
- The invariant of the connected sum of a manifold with its own orientation reversal is the norm of the invariant under the involution.
- An invariant that failed multiplicativity would not evaluate to the Witten-Reshetikhin-Turaev invariants, which are multiplicative.

**Sources.** [Habiro 2008][H06], Proposition 12.1, §12.1, p. 39.

<a id="qt-3-rational-homology-spheres-are-not-in-this-domain"></a>

### The domain of the invariant, and what a larger domain would require

QT.3 defines J only for integral homology spheres. For the p-framed unknot with |p|>1, H₁≅ℤ/|p| and its link is not admissible. Rational homology-sphere extensions require separate localization/coefficient and surgery theorems; neither the integral target nor the present convergence proof transfers automatically. Dependence on root lifts for general WRT manifolds is a separate qualification, not an assertion that it persists for every non-integral example.

**Depends on.** [The unified invariant of an integral homology sphere](#qt-3-definition-of-JM); [Surgery on a framed link and the homology of the result][AQT06]; [The Witten-Reshetikhin-Turaev invariant at a root of unity](#qt-4-WRT-invariant-at-a-root).

**Sources.** [Habiro 2008][H06], §16.3, pp. 62–63, rational homology spheres.

<a id="qt-4"></a>

## QT.4 — Root evaluations and general Lie type

<a id="qt-4-WRT-invariant-at-a-root"></a>

### The Witten-Reshetikhin-Turaev invariant at a root of unity

For r≥2 choose ξ primitive of order 4r and ζ=ξ⁴. Evaluate q^(1/4) at ξ. Let Ω_r=Σ_(i=0)^(r−2)[i+1]V_i and I_ζ(L)=ev_ξ J_L(Ω_r,…,Ω_r). For a surgery matrix with positive/negative inertia σ± define τ_(ζ,ξ)(M)=I_ζ(L)/(I_ζ(U+)^σ+ I_ζ(U−)^σ−), with both Gauss values nonzero. It is invariant under ordinary Kirby moves. For an integral homology sphere it is independent of ξ and written τ_ζ(M); for general closed M retain ξ. At ζ=1 the source defines τ₁(M)=1 by convention.

**Depends on.** [Colored Jones polynomials][AQT17]; [Tilting semisimplification][AQT13]; [Kirby moves and the Fenn-Rourke move][AQT03]; [sl₂ Kirby color](#qt-4-sl2-kirby-color); `IsPrimitiveRoot`.

**API.**

- `wrtWithLift`: The normalized surgery quotient retaining ζ and ξ.
- `wrt`: The IHS invariant after lift-independence, and the ζ=1 convention.
- `wrt_sphere`: τ(S³)=1.
- `wrt_kirby_invariant`: Ω_r handles slides and the two Gauss factors cancel stabilizations.
- `wrt_connected_sum`: The normalized invariant is multiplicative under connected sum in the source normalization.

**Tests.**

- `wrt_sphere_one`: Empty surgery gives 1.
- `wrt_root_one`: At ζ=1 the invariant is 1 by the declared convention, including r=1.
- `wrt_stabilization_sign`: A split +1 unknot cancels the positive Gauss factor and a −1 unknot cancels the negative factor; interchanging the two fails this test.

**Sources.** [Habiro 2008][H06], §11.1, equation (11.2), pp. 36–37.

<a id="qt-4-evaluation-theorem"></a>

### Evaluation of the unified invariant at a root of unity

Let M be an integral homology sphere and zeta a primitive r-th root of unity. Then the evaluation at zeta of the unified invariant of M equals the sl(2) Witten-Reshetikhin-Turaev invariant of M at zeta.

**Hypotheses.** M is an integral homology sphere; zeta is a primitive root of unity of any order

**Depends on.** [The unified invariant does not depend on the admissible presentation](#qt-3-JM-well-defined); [The Witten-Reshetikhin-Turaev invariant at a root of unity](#qt-4-WRT-invariant-at-a-root); `HabiroCyclotomicCompletions:HC.3/evaluation-at-a-root-of-unity`.

**Proof.** Evaluate the surgery formula for the unified invariant at the root, using that evaluation is a ring homomorphism from the Habiro ring to the ring of integers of the cyclotomic field. Identify the evaluated twist elements with the finite Gauss sums appearing in the state sum. Match the normalisations, using the auxiliary lemma on coloured invariants with colours in the representation ring at the root. Conclude the equality for every root of unity, without restriction on the order.

**Checks.**

- Both sides are 1 on the 3-sphere.
- The theorem holds for every root of unity, including those of even and of non-prime-power order, which the earlier literature had excluded.
- As a corollary the Witten-Reshetikhin-Turaev invariant of an integral homology sphere is an algebraic integer in the cyclotomic field, and the family is Galois equivariant.

**Sources.** [Habiro 2008][H06], Theorem 11.1, §11.1, p. 36; proof in §11.3, pp. 37–38.

<a id="qt-4-integrality-and-galois"></a>

### Integrality and Galois equivariance of the quantum invariants

For every integral homology sphere M and every root of unity zeta, the Witten-Reshetikhin-Turaev invariant of M at zeta lies in the ring of integers generated by zeta, and for every field automorphism alpha of the cyclotomic field the invariant at the image of zeta is the image of the invariant.

**Hypotheses.** M is an integral homology sphere

**Depends on.** [Evaluation of the unified invariant at a root of unity][AQT25]; `HabiroCyclotomicCompletions:HC.3/evaluation-at-a-root-of-unity`.

**Proof.** Apply the evaluation theorem to write the invariant as the image of an element of the Habiro ring. Observe that the Habiro ring has coefficients in the integers, so evaluation lands in the ring of integers generated by the root. For equivariance, note that an automorphism of the cyclotomic field commutes with evaluation of a fixed element of the Habiro ring. Conclude both statements.

**Checks.**

- The invariant is an algebraic integer, not merely an algebraic number; this is a strictly stronger statement than the state sum gives directly.
- Galois equivariance relates the values at all primitive roots of the same order, so one value determines the others in that orbit.

**Sources.** [Habiro 2008][H06], §1.3, pp. 3–4, integrality and Galois consequences.

<a id="qt-4-determination-by-WRT"></a>

### The unified invariant is determined by the family of quantum invariants

For IHS M the root-value function τ_ζ(M) and J_M determine each other, by evaluation and Habiro injectivity. A subset Z of roots suffices when it has a Habiro limit point: some root has prime-power-order ratio with infinitely many members of Z. Over ℤ this is a sufficient injectivity condition; no converse is claimed for arbitrary infinite sets without that property. A finite set cannot suffice for generic Habiro elements: the product of its cyclotomic polynomials is a nonzero element killed by all its evaluations. A single rootwise Taylor expansion also determines J_M.

**Depends on.** [Evaluation of the unified invariant at a root of unity][AQT25]; `HabiroCyclotomicCompletions:HC.4/evaluation-at-individual-roots`; `HabiroCyclotomicCompletions:HC.4/rootwise-taylor-injectivity`.

**Proof.** Transport HC.4 injectivity along ev_ζ(J_M)=τ_ζ(M). Use the exact limit-point condition, not Euclidean convergence of complex roots. For the negative test use only the explicit finite cyclotomic-product kernel.

**Checks.**

- Two integral homology spheres with the same quantum invariants at all roots have the same unified invariant.
- The statement is about the evaluation map on the Habiro ring, not about the manifolds, so it needs the ring-theoretic injectivity input.

**Sources.** [Habiro 2008][H06], Proposition 1.1, §1.2, p. 3; Propositions 12.2–12.3, §12.2, pp. 39–40.

<a id="qt-4-ohtsuki-series"></a>

### Taylor expansion at q equal to 1 is the Ohtsuki series

For IHS M, σ₁(J_M)∈ℤ[[q−1]] is the Ohtsuki series, characterized by its convergent p-adic evaluations equal to τ_ζ(M) at all odd prime-power roots. The identity uses the imported HC.3 re-expansion square and Habiro’s uniqueness lemma for the product of odd-prime evaluations of ℤ[[q−1]]. This is not convergence as a complex analytic power series.

**Depends on.** [Evaluation of the unified invariant at a root of unity][AQT25]; `HabiroCyclotomicCompletions:HC.3/the-taylor-map`; `HabiroCyclotomicCompletions:HC.3/re-expansion-of-taylor-expansions`; [Ohtsuki characterization](#qt-4-ohtsuki-characterization).

**Proof.** Apply the re-expansion square at ζ of odd prime-power order. Substitute the WRT evaluation theorem. Use the integral formal-series uniqueness characterization.

**Checks.**

- The constant term is 1, matching that the Ohtsuki series begins with 1.
- The coefficient of q−1 is 6λ(M), with λ the Casson invariant in Habiro §12.3.3’s orientation convention.
- The theorem identifies two objects defined by different means, so it is a comparison and not a definition.

**Sources.** [Habiro 2008][H06], Theorem 12.6, §12.3.2, p. 41; Casson normalization in §12.4.2, p. 44.

<a id="qt-4-general-simple-lie-type"></a>

### The same theorem for every simple Lie algebra, with the restrictions it carries

For each finite-dimensional simple complex g there is a unique invariant J_M^g∈ℤ[q]^ℕ of oriented integral homology spheres such that ev_ξ J_M^g=τ_M^g(ξ) for ξ∈Z_g and ev_ξ J_M^g=τ_M^(Pg)(ξ) for ξ∈Z_Pg. At any other root evaluation remains defined; using it to extend the conventional invariant is a definition. At ξ=1 it is 1. Uniqueness and rootwise Taylor determination use the integral Habiro rigidity theorem. The construction uses the concrete integral core and its degree-one K_n filtration, not only an unspecified abstract core.

**Depends on.** [Integral core filtration][AQT26]; [General Lie-type WRT comparison](#qt-4-general-wrt-comparison); [Every integral homology sphere has an admissible surgery presentation][AQT05]; `HabiroCyclotomicCompletions:HC.4/evaluation-at-individual-roots`; `HabiroCyclotomicCompletions:HC.4/rootwise-taylor-injectivity`.

**Proof.** Build the abstract Hoste-invariant core formula using T_(f_i). Apply AL1/AL2 to place it in K̃₀=Habiro. Use the admissible WRT comparison and an injective infinite family of root evaluations for uniqueness.

**Checks.**

- Evaluation at roots outside Z_g∪Z_Pg defines an extension of the root-value function; it is not asserted to be analytic continuation.
- The proof is identified with the abstract theorem of the ribbon layer.

**Sources.** [Habiro–Lê][AQT55], Theorem 8.1, §8.1, p. 90; Theorem 8.8, §8.5, p. 94.

<a id="qt-4-the-coefficient-ring-may-not-be-changed"></a>

### Why the determination theorems do not transfer to other completions

The determination and integrality statements are over ℤ. Over ℚ the all-order cyclotomic completion is a product of rootwise completions, so its Taylor map at one root is not injective. QT does not transfer integral rigidity, Galois/integer target statements, or IHS coefficient results to localized, twisted or rational-homology-sphere completions without a comparison theorem.

**Depends on.** [Integrality and Galois equivariance of the quantum invariants](#qt-4-integrality-and-galois); `HabiroCyclotomicCompletions:HC.4/rootwise-taylor-injectivity`; `HabiroCyclotomicCompletions:HC.1/the-cyclotomic-completion`.

**Sources.** [Habiro 2008][H06], §1.2, pp. 2–3, integral cyclotomic completion.

<a id="qt-4-sl2-kirby-color"></a>

### sl₂ Kirby color

For the primitive 4r-th root ξ, r≥2, Ω_r=Σ_(i=0)^(r−2)[i+1]V_i is the sl₂ Kirby color. Its specialized link evaluations satisfy the handle-slide identity, and its ±1-unknot values are nonzero quadratic Gauss sums. The admissible range r−2 and the choice q^(1/4)=ξ are retained together; specializing an infinite generic representation sum is not this construction.

**Depends on.** [Finite free sl₂ colors][AQT20]; [Colored Jones polynomials][AQT17]; [Tilting semisimplification][AQT13]; `IsPrimitiveRoot`.

**Proof.** Evaluate the finite pivotal color sum in the semisimple sl₂ quotient. Use fusion/orthogonality to prove the slide identity. Compute the two Gauss values, with their root lift, to prove nonvanishing.

**API.**

- `sl2KirbyColor`: The finite weighted color sum Ω_r.
- `sl2KirbyColor_handleSlide`: The colored surgery link value is unchanged by a handle slide.
- `sl2KirbyColor_gauss_ne_zero`: Both ±1 unknot values are nonzero at the specified lift.

**Tests.**

- `kirbyColor_r2`: At r=2 the color is V₀.
- `kirbyColor_r3`: At r=3 the labels are V₀ and V₁ with the quantum-dimension coefficients.
- `kirbyColor_no_top_weight`: The weight V_(r−1) is absent; its vanishing quantum dimension does not supply an extra simple color.

**Sources.** [Habiro 2008][H06], §11.1, pp. 36–37, colors and nonzero unknot normalizations.

<a id="qt-4-ohtsuki-characterization"></a>

### Ohtsuki characterization

The homomorphism ℤ[[q−1]]→∏_(p odd prime)ℤ_p[ζ_p] obtained by convergent evaluation q=ζ_p is injective. Consequently there is at most one integral formal series with a prescribed collection of these values; existence for WRT values follows from σ₁(J_M).

**Depends on.** `HabiroCyclotomicCompletions:HC.3/re-expansion-of-taylor-expansions`.

**Proof.** For a series killed by every evaluation, induct on its first possible nonzero coefficient x_n. Reduce modulo (ζ_p−1)^(n+1) to show p|x_n for every odd prime p. An integer divisible by every odd prime is zero; repeat the induction.

**Sources.** [Habiro 2008][H06], Lemma 12.7, §12.3.2, p. 42.

<a id="qt-4-general-core-filtration"></a>

### Integral core filtration

Let G be the Habiro–Le central parity extension of Y×Y/2Y, retaining its central element v̇ of order two and tensor products over that element. On U_q, deg_G(v)=v̇, deg_G(K_α)=K̇_α, deg_G(E_α)=v̇^d_α ė_α and deg_G(F_α)=ė_α⁻¹K̇_α; use the exact §6 relations rather than an abelian root grading. Set K_n=(X_ℤ^ev)^⊗n∩[(U_A^ev)^⊗n]_1, F_kK_n=(q;q)_k K_n and K̃_n its image completion inside U_h completed⊗n. Then K₀=ℤ[q±1], K̃₀=Habiro; J_T∈K̃_n for zero-linking-matrix bottom tangles and tensor twist forms map K̃_n to K̃₀.

**Depends on.** [Integral core subalgebra](#qt-1-general-integral-core); `HabiroCyclotomicCompletions:HC.1/the-cyclotomic-completion`; [Quantum parity grading](#qt-4-general-parity-grading); [Topological ribbon Hopf algebras][AQT14]; [Bottom tangles and their closure][AQT07].

**Proof.** Before AL1, construct the generic J_T from the topological ribbon Hopf bead rules (Habiro–Le §2.7) and its finite-color trace compatibility; this missing general-type interface is explicitly G2, not supplied by universal-sl2-invariant. Use the even core and degree-one intersection to exclude unwanted square roots. Stability and the integral Borromean computation establish AL1. Twist images lie in Ã∩ℚ(q)=ℤ[q±1]; continuity gives AL2 and K̃₀.

**API.**

- `generalIntegralKn`: The displayed graded intersection K_n.
- `generalKnFiltration`: F_k=(q;q)_kK_n.
- `generalCompletedKn`: Image completion inside the h-adic ambient tensor power.
- `generalKn_twist`: The tensor product of sign twist forms maps K̃_n to the ordinary integral Habiro ring.

**Tests.**

- `generalKn_zero`: K₀=ℤ[q±1] and K̃₀=Habiro.
- `generalKn_degree_one`: An odd power of v alone has central degree v̇ and is excluded from K₀.
- `generalKn_filtration_vanishes`: At a q-root of order r, (q;q)_k vanishes for k≥r, compatible with the Habiro completion.

**Sources.** [Habiro–Lê][AQT55], §§7.1–7.3, pp. 75–77; Proposition 7.1 and Theorem 7.3.

<a id="qt-4-general-parity-grading"></a>

### Quantum parity grading

G is generated by a central v̇ of order two, commuting K̇_α of order two and invertible ė_α, with K̇_α ė_β=v̇^((α,β))ė_βK̇_α and ė_αė_β=v̇^((α,β))ė_βė_α. Its quotient by ⟨v̇⟩ is Y×Y/2Y. The tensor grading amalgamates the central v̇ in all factors; G^⊗0=⟨v̇⟩. The generator degrees are deg(v)=v̇, deg(K_±α)=K̇_α, deg(E_α)=v̇^(d_α)ė_α and deg(F_α)=ė_α⁻¹K̇_α. These define the grading over ℂ(q); the even subalgebra is the sum over G^ev. This carries integral square-root cancellation information unavailable from ordinary Y-grading.

**Depends on.** [Drinfeld–Jimbo algebra][AQT08].

**API.**

- `QuantumParityGroup`: The central parity extension with the displayed presentation.
- `quantumParityDegree`: The source G-degree on PBW generators.
- `tensorParityGroup`: G^⊗n with the central order-two elements identified.

**Tests.**

- `parity_v_square`: The degree of v²=q is 1.
- `parity_K_square`: The degree of K_α² is 1.
- `parity_tensor_zero`: G^⊗0 is the two-element central group, not a trivial group.

**Sources.** [Habiro–Lê][AQT55], §§6.1–6.3, pp. 68–70, noncommutative grading.

<a id="qt-4-strong-kirby-colors"></a>

### Strong Kirby colors

For g, let D=|X/Y|, d=d_max, r=ord ξ, and choose ζ with ζ^(2D)=ξ (ζ evaluates v^(1/D)). The half-open weight box P_ζ consists of λ=Σ k_iω_i, 0≤k_i<2rD. Ω^g_ζ=Σ_(λ∈Pζ)qdim(V_λ)V_λ; Ω^(Pg)_ζ restricts λ to Y. A strong Kirby color satisfies the source strong handle-slide condition, nonzero ±1 Gauss values, and r>d(h∨−1). Define Z′_g,Z′_Pg as admissible lifts, and Z_g,Z_Pg as their images ξ. Odd r supplies projective admissibility and even r supplies full admissibility under that bound; individual lifts with the same ξ can differ. No semisimplicity at all these roots is asserted.

**Depends on.** [Drinfeld–Jimbo algebra][AQT08]; `IsPrimitiveRoot`; [Reshetikhin–Turaev functor][AQT10]; [Topological ribbon Hopf algebras][AQT14].

**API.**

- `StrongKirbyColor`: The finite color with root bound, sliding condition and nonzero Gauss factors.
- `admissibleRootLifts`: Z′_g and Z′_Pg retain the root lift ζ.
- `admissibleQRoots`: Images under ζ↦ζ^(2D).

**Tests.**

- `kirby_root_bound`: A root with r≤d(h∨−1) does not meet the declared strong-color bound.
- `kirby_gauss_vanishing_Aodd`: For A_ℓ, ℓ odd, ord ζ≡2 mod4 gives a vanishing full Gauss sum, so this lift is excluded.
- `kirby_root_one_convention`: At ξ=1 τ is defined as 1 separately; the strong-color root bound does not silently include it.

**Sources.** [Habiro–Lê][AQT55], §§8.4–8.5, pp. 92–94; Appendix C, pp. 112–117, with E5 correction.

<a id="qt-4-general-wrt-comparison"></a>

### General Lie-type WRT comparison

At each ξ∈Z_g or Z_Pg, choose a corresponding strong Kirby lift ζ. On IHS surgery links the normalized finite color quotient using Ω^g_ζ or Ω^(Pg)_ζ is independent of the admissible lift and equals ev_ξ J_M^g. The quotient divides by separate J_(U+)(Ω)^σ+ and J_(U−)(Ω)^σ−, both nonzero. Equality outside these admissible sets is not claimed for an existing conventional RT invariant.

**Depends on.** [Strong Kirby colors][AQT27]; [Integral core filtration][AQT26]; [Refined Kirby calculus for admissible links (Hoste's conjecture)][AQT04]; `HabiroCyclotomicCompletions:HC.3/evaluation-at-a-root-of-unity`.

**Proof.** Approximate the integral core twists in the cyclotomic filtration. Use the root-annihilating ideals and the specialized quantum traces to compare with the finite strong Kirby colors. Cancel the distinct sign Gauss factors and prove lift-independence on IHS presentations.

**Sources.** [Habiro–Lê][AQT55], Theorem 8.8, §8.5, p. 94; comparison to Theorem 8.1, p. 90.

<a id="qt-5"></a>

## QT.5 — Geometric flattenings and extended Bloch classes

<a id="qt-5-ideal-tetrahedron-and-shape"></a>

### Oriented ideal tetrahedra and their shape parameters

The supplier’s ordered ideal hyperbolic tetrahedron with four distinct boundary vertices has cross-ratio z∈ℂ∖{0,1}, with ordering normalized by (0,∞,1,z)↦z. Its companions are z′=1/(1−z), z″=1−1/z and zz′z″=−1. Im z>0 is positive orientation; real nondegenerate shapes are flat and may occur in refinement arguments. QT records the shape coordinate interface and imports the geometric carrier/isometry classification; it does not construct hyperbolic space again.

**Depends on.** `Complex.log`; [GeometricTopology — layer-7-riemannian-geometric-structures-and-volume][GT7].

**API.**

- `IdealTetrahedron`: An ordered oriented ideal tetrahedron, recorded by its shape parameter in the complement of 0 and 1.
- `shape`: shape T is the cross-ratio of the four ideal vertices in the chosen order.
- `shape_companions`: The three edge parameters are z, 1/(1-z) and 1-1/z, and their product is minus 1.
- `isometry_iff_shape_eq`: Two ordered ideal tetrahedra are orientation-preserving isometric if and only if their shapes agree.
- `positively_oriented`: A tetrahedron is positively oriented exactly when the imaginary part of its shape is positive.

**Tests.**

- `shape_regular`: The regular ideal tetrahedron has shape the primitive sixth root of unity; a convention giving a different value is a different cross-ratio ordering.
- `shape_product`: The product of the three edge parameters is minus 1, not 1; this pins the convention.
- `shape_excludes_degenerate`: Shapes 0 and 1 are excluded, so a degenerate configuration is not an ideal tetrahedron.

**Sources.** [Neumann 2004][N04], §3, pp. 420–421 (PDF pp. 8–9), ideal simplex parameters.

<a id="qt-5-gluing-and-completeness-equations"></a>

### Gluing and completeness equations of an ideal triangulation

For an actual ideal face-pairing triangulation of the interior of a compact oriented 3-manifold with torus boundary, shapes give edge products and peripheral products from the incidence data. A positive geometric solution has every z_j in the upper half-plane, each edge product 1 with total dihedral angle 2π, and peripheral similarity multiplier 1 for both generators of each cusp (parabolic/unipotent cusp holonomy in the developing representation, whose translational part is generally nontrivial). Edge products alone are insufficient. Geometric realization, ideal triangulation existence and finite-volume cusped rigidity are requested from GeometricTopology, Part II. A matrix equation alone is called linear gluing data, not an ideal triangulation.

**Depends on.** [Oriented ideal tetrahedra and their shape parameters][AQT34]; [GeometricTopology — layer-5-dehn-surgery][GT5]; [GeometricTopology — layer-7-riemannian-geometric-structures-and-volume][GT7].

**API.**

- `IdealTriangulation`: Import an actual oriented cusped-manifold ideal face-pairing triangulation, with peripheral curves and nondegenerate shapes satisfying all edge and completeness equations; an arbitrary matrix equation is not this carrier.
- `edgeEquation`: At each edge, the product of the incident edge parameters is 1 and the sum of their logarithms is two pi i.
- `cuspEquation`: At each cusp, each generator has similarity multiplier 1; its parabolic translation need not vanish.
- `isGeometricSolution`: The conjunction includes positive shapes, edge angle equations and both peripheral completeness equations.
- `volume_eq_sum`: The volume of the structure is the sum of the volumes of its tetrahedra.

**Tests.**

- `figure_eight_solution`: The two-tetrahedron triangulation of the figure-eight knot complement has the solution with both shapes the primitive sixth root of unity; this is the running example.
- `edge_equation_log_form`: The logarithmic edge equation fixes the branch: the product form alone does not, and the two differ by multiples of two pi i.
- `not_geometric_of_negative_imaginary`: A solution with a shape of negative imaginary part is not geometric, so the positivity condition is not redundant.
- `complete_cusp_nonidentity_translation`: The map w↦w+1 is a nonidentity parabolic with multiplier 1. Completeness may admit this holonomy; a test requiring the identity transformation rejects a complete cusp.

**Sources.** [Geometric perturbative invariants][AQT58], §2.2, equations (14)–(15), pp. 6–7, edge/peripheral equations; §2.3, pp. 8–9, regular geometric triangulations.

<a id="qt-5-combinatorial-flattening"></a>

### Combinatorial flattenings and the extended pre-Bloch group

On Neumann’s cut-plane ℤ²-cover of ℂ∖{0,1}, a point (z;p,q) determines (w₀,w₁,w₂)=(log z+pπi,−log(1−z)+qπi,log(1−z)−log z−(p+q)πi). Their sum is zero. Crossing the negative-real cut changes p by 2 and crossing the >1 cut changes q by 2; the cover has four parity components. The triple determines the point of the cover using both w₀ and w₁, not w₀ alone. Strong flattenings of triangulations impose additional parity and normal-path conditions, separately planned. An intrinsic model consists of (z,w₀,w₁) with z≠0,1, exp(2w₀)=z² and exp(−2w₁)=(1−z)², with the subspace topology of ℂ³ and w₂=−w₀−w₁. Both logarithms recover z=(1+exp(2w₀)−exp(−2w₁))/2. This model is homeomorphic to the cut-side quotient and retains the four parity components; exp(w₀)=z alone would discard odd p sheets.

**Depends on.** [Oriented ideal tetrahedra and their shape parameters][AQT34]; `Complex.log`.

**API.**

- `Flattening`: A point on the cut ℤ²-cover and its log parameters.
- `flattening_sum_zero`: w₀+w₁+w₂=0.
- `flatteningEquiv`: The cover is in bijection with combinatorial flattening triples.
- `flattening_cover_transition`: Cut transitions shift p or q by two, preserving the appropriate logarithmic parameters.

**Tests.**

- `flattening_zero_zero`: On the chosen cut-plane chart p=q=0 gives (log z,−log(1−z),log(1−z)−log z).
- `flattening_determines_shape`: Equality of the full w-triples determines z; equality of w₀ alone is insufficient.
- `flattening_regular`: For z=exp(πi/3) and p=q=0 the log parameters are (πi/3,πi/3,−2πi/3), summing to zero.

**Sources.** [Neumann 2004][N04], Definition 3.1 and Lemma 3.2, §3, pp. 421–422 (PDF pp. 9–10).

<a id="qt-5-five-term-and-pachner"></a>

### The flattening condition makes a two-three move an instance of the lifted five-term relation

For five distinct ideal vertices, the alternating lifted five-shape relation is permitted iff the alternating sum of log parameters about each of their ten edges is zero. Consequently a compatible 2–3 Pachner move preserves the signed flattened-shape sum in P̂(ℂ); sheet changes also use the transfer relation. Nondegenerate vertices and the full log-edge compatibility are retained.

**Depends on.** [Extended pre-Bloch group][AQT31]; [Combinatorial flattenings and the extended pre-Bloch group][AQT29].

**Proof.** Use the geometric edge-sum interpretation of Neumann’s lifted relation. For the FT⁺ chart solve the integer sheet equations; extend along the distinguished lifted components. Interpret the two/three tetrahedra as the two sides of the alternating boundary.

**Checks.**

- The classical five-term relation is recovered by forgetting the flattenings.
- Without the flattening condition the lifted relation fails, so the condition is not automatic.
- The lemma is what makes a two-three Pachner move on an ideal triangulation act trivially on the Bloch element.

**Sources.** [Neumann 2004][N04], Definition 3.3 and Lemma 3.4, §3, pp. 423–424 (PDF pp. 11–12).

<a id="qt-5-bloch-element-of-a-triangulation"></a>

### The extended Bloch element of a hyperbolic 3-manifold

For an oriented complete finite-volume hyperbolic 3-manifold M with the ordered hybrid refinement and strong flattening specified above, β̂(M)=Σ_j ε_j[z_j;p_j,q_j] belongs to B̂(ℂ) and depends only on M. More generally the labelled ordered-cycle construction gives λ:H₃(PSL₂(ℂ)^δ;ℤ)→B̂(ℂ), and the signed sum depends only on the represented homology class. Changes of strong flattening, developing points and compatible refinement do not change the class. The ordinary β_F requires the separate verified field/boundary comparison; it is not produced by a diagram or numerical shapes alone.

**Depends on.** [Strong flattening theorem][AQT36]; [Extended Bloch group][AQT30]; [The flattening condition makes a two-three move an instance of the lifted five-term relation][AQT32].

**Proof.** Use cancellation of logarithmic wedges from the edge and normal-path conditions. Use lifted five-term, transfer and cycle relations to prove independence of flattening and representative. For cusps use Neumann’s relative parabolic fundamental-class construction and ordered hybrid refinements.

**API.**

- `blochElement`: blochElement M is the class in the extended Bloch group attached to a flattened ideal triangulation of M.
- `blochElement_exists`: A flattening of the triangulation exists, so the element is defined.
- `blochElement_indep`: The element does not depend on the chosen flattening, only on the homology class.
- `blochElement_mem_extendedBloch`: The element lies in the extended Bloch group, the kernel of the map to the exterior square.

**Tests.**

- `blochElement_figure_eight_volume`: The projected figure-eight class is 2[z₆], z₆=exp(πi/3); its Bloch–Wigner value is 2D(z₆). The full extended class must use the cusp-compatible flattening, rather than assume twice the principal lift.
- `blochElement_flattening_independent`: Changing the flattening by an admissible amount does not change the class.
- `blochElement_not_in_prebloch_kernel`: The element is non-zero for a hyperbolic manifold, since its Rogers dilogarithm has non-zero imaginary part equal to the volume.

**Sources.** [Neumann 2004][N04], Theorems 4.5–4.6, §4.2, p. 429 (PDF p. 17); Theorem 14.2, p. 465 (PDF p. 53).

<a id="qt-5-volume-and-chern-simons"></a>

### The Rogers dilogarithm computes volume and Chern-Simons

Neumann’s λ:H₃(PSL₂(ℂ)^δ;ℤ)≅B̂(ℂ) is an isomorphism and R∘λ is the Cheeger–Chern–Simons class i(Vol+i CS)=i Vol−CS modulo π²ℤ. For a complete finite-volume hyperbolic manifold R(β̂(M)) has imaginary part Vol(M). The tetrahedron identity Vol(z)=D(z) is imported from Polylogarithms P.2; QT assembles the signed sum and compares the Chern–Simons normalization. GZ uses V=i Vol+CS, so V=−conj(R) modulo the corresponding period and with a chosen representative for exponentials. This is not the ordinary K₃ Suslin isomorphism.

**Depends on.** [The extended Bloch element of a hyperbolic 3-manifold][AQT28]; [Extended Rogers regulator](#qt-5-extended-rogers-regulator); `Polylogarithms:P.2/bloch-wigner-descent`; `K3BlochGroups:V.4/suslin-exact-sequence`; `K3BlochGroups:V.6/suslin-lift-fibre`.

**Proof.** Use Neumann’s exact sequence and λ to compare the group-homology class with the extended Bloch class. Identify the Rogers class with the Cheeger–Chern–Simons cocycle. Import Vol(z)=D(z) for the signed volume sum and explicitly convert the real CS sign for GZ asymptotics.

**Checks.**

- The imaginary part of R(β̂(M)) is Vol(M); the real-valued Bloch–Wigner regulator computes the same volume.
- The real part of R(β̂(M)) is −CS(M) modulo π²ℤ in Neumann’s convention, since R=i(Vol+i CS)=i Vol−CS.
- For the figure-eight knot complement the imaginary part is twice the volume of the regular ideal tetrahedron.

**Sources.** [Neumann 2004][N04], Theorem 2.6, p. 420 (PDF p. 8); §12, Theorem 12.1, p. 459 (PDF p. 47); Theorem 14.2, p. 465 (PDF p. 53).

<a id="qt-5-a-diagram-does-not-produce-a-bloch-class"></a>

### The four proof obligations between a knot diagram and a number-field Bloch class

A knot diagram does not automatically give β_F. Required witnesses are: a complete finite-volume hyperbolic complement; genuine face-pairing and peripheral data; an ordered hybrid refinement with a strong flattening; and an algebraic shape field with the required boundary/convention comparison. Once supplied, β̂(M) is independent of permissible flattening choices. Neumann’s warning about non-manifold underlying complexes applies to Dehn-filling triangulations, not all software triangulations of cusped complements. QT.5 imports geometric existence/rigidity from GeometricTopology Part II and tetrahedron volume from Polylogarithms; it has no dependency on QT.0 surgery.

**Depends on.** [Strong flattening theorem][AQT36]; [The extended Bloch element of a hyperbolic 3-manifold][AQT28]; [Geometric number-field Bloch class][AQT35]; [Rogers volume and Chern–Simons regulator][AQT37].

**Sources.** [Neumann 2004][N04], §14, pp. 464–465 (PDF pp. 52–53), complete cusped geometry and fillings.

<a id="qt-5-extended-pre-bloch"></a>

### Extended pre-Bloch group

Let FT be the five-shape locus (x,y,y/x,(1−1/x)/(1−1/y),(1−x)/(1−y)), x,y∉{0,1},x≠y. In the fivefold Neumann cover, choose the component FT̂₀ containing the all-principal lifts when all five shapes are in the upper half-plane; put FT̂=FT̂₀+V, where V consists of sheet pairs ((p₀,q₀),(p₁,q₁),(p₁−p₀,q₂),(p₁−p₀+q₁−q₀,q₂−q₁),(q₁−q₀,q₂−q₁−p₀)). P̂(ℂ) is the free abelian group on the cover modulo the alternating lifted five-term relations AND [z;p,q]+[z;p′,q′]=[z;p,q′]+[z;p′,q]. The second relation is the transfer relation; omitting it retains an extra ℤ/2.

**Depends on.** [Combinatorial flattenings and the extended pre-Bloch group][AQT29]; `K3BlochGroups:V.3/pre-bloch-group`.

**API.**

- `LiftedFiveTerm`: Membership in FT̂₀+V, not every unrestricted tuple of lifts.
- `transferRelation`: The four-term sheet interchange relation.
- `extendedPreBloch`: The quotient by lifted five-term and transfer relations.
- `forget`: The homomorphism forgetting sheet coordinates to P(ℂ).

**Tests.**

- `lifted_five_term_general`: Forgetting a permitted lifted relation gives the ordinary five-term relation.
- `transfer_zero`: [z;1,1]+[z;0,0]−[z;1,0]−[z;0,1]=0 in this quotient.
- `lift_sheet_constraint`: For shapes in FT⁺, arbitrary sheet choices violating p₂=p₁−p₀ are not the specified lifted relation.

**Sources.** [Neumann 2004][N04], Definition 2.2, §2, pp. 417–418 (PDF pp. 5–6).

<a id="qt-5-extended-bloch-kernel"></a>

### Extended Bloch group

The homomorphism ν:P̂(ℂ)→ℂ∧_ℤℂ is ν[z;p,q]=(log z+pπi)∧(−log(1−z)+qπi). Define B̂(ℂ)=ker ν, a subgroup of P̂. Forgetting gives the Neumann ordinary Bloch convention ker([z]↦2z∧(1−z)); its comparison with the K3 supplier’s antisymmetric-tensor and exterior-kernel conventions must use the named comparison, not an integral equality of all those groups.

**Depends on.** [Extended pre-Bloch group][AQT31]; `K3BlochGroups:V.3/exterior-kernel-bloch-group`; `K3BlochGroups:V.4/suslin-exact-sequence`.

**API.**

- `extendedDehn`: The displayed logarithmic wedge homomorphism.
- `extendedBloch`: Its kernel subgroup.
- `extendedBloch_forget`: Forgetting gives an ordinary Bloch class in the explicitly stated convention. The comparison square uses ε(w₀∧w₁)=−2 exp(w₀)∧exp(w₁), so ε∘ν=ν′∘forget for ν′[z]=2z∧(1−z).

**Tests.**

- `extendedBloch_zero`: The zero class is in the kernel.
- `extendedDehn_transfer`: The four sheet-interchange terms have wedge sum zero.
- `extendedDehn_sheet_change`: Changing p by 1 changes ν by πi∧(−log(1−z)+qπi); individual generators are not automatically in the kernel.

**Sources.** [Neumann 2004][N04], Lemma 2.3 and Definition 2.4, §2, p. 418 (PDF p. 6). Theorem 7.5, §7, p. 441 (PDF p. 29), the factor-two boundary square.

<a id="qt-5-strong-flattening"></a>

### Strong flattening theorem

For a G-labelled ordered 3-cycle K, G=PSL₂(ℂ) with discrete topology, choose developing boundary points giving nondegenerate simplex shapes. A flattening has zero parity on every normal path and zero log-parameter sum about every edge; it is strong if the log parameter also vanishes on normal paths in each vertex star. Neumann proves existence of a strong flattening. For complete finite-volume hyperbolic M use an ordered hybrid ideal/ordinary refinement with compatible face orderings; an unordered ideal triangulation alone may give only B̂/C₆. Existence of that geometric refinement is imported from the cusped GeometricTopology Part II request.

**Depends on.** [Gluing and completeness equations][AQT33]; [Combinatorial flattenings and the extended pre-Bloch group][AQT29]; [GeometricTopology — layer-7-riemannian-geometric-structures-and-volume][GT7].

**Proof.** Use the log/parity chain complex in Neumann §9 to solve the flattening obstructions. Impose vertex-star normal-path conditions for a strong flattening. Apply the ordered hybrid refinement theorem for cusped manifolds, retaining the ordering condition.

**API.**

- `StrongFlattening`: Simplex flattenings satisfying edge, parity and vertex-star normal-path equations.
- `strongFlattening_exists`: Existence for the stated labelled ordered nondegenerate 3-cycle.
- `strongFlattening_refinement`: Compatible ordered geometric refinements preserve the resulting class.

**Tests.**

- `strongFlattening_edge`: Every edge has log-parameter sum zero.
- `strongFlattening_parity`: An edge-log solution with an odd normal-path parity is not a strong flattening.
- `strongFlattening_ordering`: An un-ordered ideal triangulation is not the input of the full B̂-class theorem; its unordered invariant can lose C₆ information.

**Sources.** [Neumann 2004][N04], Definition 4.4 and Theorem 4.5, §4.2, p. 429 (PDF p. 17); Theorem 14.2, p. 465 (PDF p. 53).

<a id="qt-5-extended-rogers-regulator"></a>

### Extended Rogers regulator

On the cut-cover chart put R(z;p,q)=Li₂(z)+½log z log(1−z)+(πi/2)(p log(1−z)+q log z)−π²/6 modulo π²ℤ. The cover transition and both relation families make R:P̂(ℂ)→ℂ/π²ℤ an additive homomorphism. Restrict to B̂(ℂ). The Li₂ branch and ordinary Bloch–Wigner descent are imported from Polylogarithms; the π² quotient and sheet terms are QT’s extra geometric data.

**Depends on.** [Extended pre-Bloch group][AQT31]; [Extended Bloch group][AQT30]; `Polylogarithms:P.1/bloch-wigner-dilogarithm`; `Polylogarithms:P.2/bloch-wigner-descent`.

**Proof.** Use the supplied Li₂ function with its disk series, derivative −log(1−z)/z off the positive cut, and lower-bank limit at x>1. These hypotheses specify the branch; the five-term equation is a conclusion. On the upper x>1 bank add 2πi log x to Li₂. Across the negative cut (upper;p,q)→(lower;p+2,q), the raw difference is −qπ²; across the positive cut with q→q+2 it is +pπ². Quotient by integer multiples of π², never their real span. Derive the real five-term identity, continue to FT⁺ and its distinguished lifted component, and use exactly the prescribed sheet lattice. Transfer is affine in the sheets. Descend both relations through the existing free-abelian quotient.

For a single flattening f, Im R(f)=D(z)+(Re w₀ Im w₁−Im w₀ Re w₁)/2. The alternating correction factors through the logarithmic Dehn map. Thus Im R on a class in its kernel is the signed Bloch–Wigner sum; this equality requires boundary cancellation. The construction takes the supplier function and branch laws as parameters, then instantiates them from Polylogarithms.

**API.**

- `extendedRogers`: The normalized expression in ℂ/π²ℤ.
- `extendedRogers_transfer`: The four-term transfer relation maps to zero.
- `extendedRogers_liftedFiveTerm`: A permitted lifted five-term relation maps to zero modulo π².
- `rawRogers_negative`, `rawRogers_positive`: Exact cut differences −qπ² and +pπ².
- `rogersClass_eq_iff`: Equality means the raw difference is nπ² for n∈ℤ.
- `rogersOnFlattening_chart`, `rogersOnFlattening_im`: Principal chart and single-symbol log-area formulas.
- `extendedRogers_gen`, `extendedRogers_im`: Generator value and imaginary comparison on zero-Dehn classes.

**Tests.**

- `rogers_normalizing_constant`: With Li₂(1/2)=π²/12−log²(1/2)/2, R(1/2;0,0)=−π²/12 modulo π².
- `rogers_sheet_p`: Changing p by 2 adds πi log(1−z) before reducing periods.
- `rogers_not_plain_BlochWigner`: −π²/12 is nonzero in the quotient and has imaginary part zero.
- `rogers_cut_negative`, `rogers_cut_positive`: At z=−1 and z=2 retain the q and p period multipliers and the upper-bank Li₂ jump.
- `rogers_period_control`: π² vanishes; π²/2 survives.
- `rogers_transfer_chart`: The four chart values with swapped sheets cancel.
- `rogers_fiveTerm_class`: Every permitted five-term class has regulator zero.
- `rogers_symbol_im_correction`: R(1/2;1,0) has nonzero imaginary part π log(1/2)/2 although D(1/2)=0.

**Sources.** [Neumann 2004][N04], Proposition 2.5 and proof, §2, pp. 419–420 (PDF pp. 7–8).

<a id="qt-5-number-field-geometric-bloch-class"></a>

### Geometric number-field Bloch class

**Comparison target.**

For a chosen algebraic nondegenerate complete gluing solution with all shapes in a number field F, the signed symbol sum is first an element of P(F). To place it in the selected Bloch group one must prove the appropriate exterior/antisymmetric boundary vanishes and compare Neumann’s factor-two convention with K3BlochGroups. The trace-field realization must also identify the chosen embedding and any necessary field extension. For the standard figure-eight solution z₆²−z₆+1=0, F=ℚ(√−3), the ordinary class 2[z₆] has zero exterior boundary since 1−z₆=z₆⁻¹ and regulator 2D(z₆). No unverified general integral trace-field descent is asserted.

**Depends on.** [Gluing and completeness equations][AQT33]; [The extended Bloch element of a hyperbolic 3-manifold][AQT28]; `K3BlochGroups:V.3/exterior-kernel-bloch-group`; `K3BlochGroups:V.3/bloch-group`; `Polylogarithms:P.2/bloch-wigner-descent`.

**Sources.** [Neumann 2004][N04], §15, pp. 470–471 (PDF pp. 58–59); §16, p. 472 (PDF p. 60).

<a id="qt-6"></a>

## QT.6 — Formal and analytic state integrals

<a id="qt-6-the-asymptotic-series-and-its-arithmetic"></a>

### The conjectural asymptotic expansion, its normalisation, and the field its coefficients lie in

**Formal arithmetic is a source theorem; the general analytic comparison is conjectural.**

The formal GSW geometric NZ series exists and is invariant under its hypotheses, with coefficients in the invariant trace field. A normalized GZ perturbative series additionally includes a one-loop square root, an eighth-root phase and the complex-volume exponential; the normalization comparison is explicit. The Kashaev all-orders analytic expansion is conjectural in general and proved only in the separately cited families. For 4₁ the GZ series begins 3^(−1/4)(1+11h/(72√−3)+697h²/(2(72√−3)²)+⋯). For 5₂ use ξ³−ξ²+1=0 with Im ξ<0 and the prefactor ζ₈/√(3ξ−2). These formal coefficients do not supply an error bound by themselves. At primitive order k use the root-refined DG2 series. Compare its finite average and one-loop factor with HB.8 under the integral/parity hypotheses; evaluation of the k=1 series is insufficient.

**Depends on.** [Formal state-integral invariance][AQT42]; [Rogers volume and Chern–Simons regulator][AQT37]; [Topological Habiro-module comparison][AQT47]; [Proved quantum modularity cases][AQT48]; [Root-series arithmetic theorem][AQT44].

**Sources.** [GZ][GZ], §1, equations (1.3)–(1.4), pp. 9–10; §2.2, pp. 12–14.

<a id="qt-6-what-is-exported-to-the-habiro-roadmaps"></a>

### The comparisons with the Habiro ring that are actually proved, and the ones that are not

Three precise interfaces connect QT to the Habiro family: integral knot coefficients and IHS unified invariants consume HC.1–HC.4; the explicit figure-eight descendant H_m supplies new elements of the ordinary Habiro ring via HC.2; and qualified integral-NZ Nahm data consume HB.8/HB.9 and HNF HB.6/HB.7 for a K₃-indexed module. The knot-specific construction/topological comparison stays in QT. Neither formal asymptotics nor root values alone prove completion membership. Wheeler’s two-variable relative-Habiro theorem is routed as a named QT Part II after QT.2, with HR.1/HR.5 coefficient suppliers and GeometricTopology’s Alexander polynomial; it is not absorbed into the current stages.

**Depends on.** [Bottom knot cyclotomic expansion][AQT19]; [The unified invariant does not depend on the admissible presentation](#qt-3-JM-well-defined); [Figure-eight Habiro descendants](#qt-7-figure-eight-habiro-descendants); [Topological Habiro-module comparison][AQT47]; `HabiroCyclotomicCompletions:HC.1/the-cyclotomic-completion`; `HabiroCyclotomicCompletions:HC.2/factorial-series`.

**Sources.** [GZ][GZ], §7.1, pp. 52–56, descendant Habiro-like functions.

<a id="qt-6-formal-and-analytic-asymptotics-are-different-outputs"></a>

### What a formal expansion establishes and what it does not

A formal series is an element of a coefficient ring [[h]], with no domain or error estimate. Analytic all-orders asymptotics requires a limit domain, a branch and, for every truncation M, an O(h^M) remainder with the stated uniformity. GSW supplies formal invariance; AK supplies the selected analytic leading limits; Bettin–Drappeau supplies bounded-denominator all-orders modular asymptotics for its named knot family. General GZ refinements remain conjectural. No number of computed coefficients or saddle-point equations upgrades a formal series to such a theorem.

**Depends on.** [Formal NZ state integral][AQT41]; [Selected state-integral volume theorem][AQT46]; [Proved quantum modularity cases][AQT48].

**Sources.** [Geometric perturbative invariants][AQT58], §1, pp. 2–5; Theorem 1.1, p. 4.

<a id="qt-6-neumann-zagier-datum"></a>

### Neumann–Zagier datum

An NZ datum Ξ=(A,B,ν,z,f,f″) comes from an actual ideal triangulation with r redundant edge equations removed and one peripheral equation per cusp added (r=1 in the knot case). The integral block (A|B) has a symplectic completion over ℤ[1/2]; a completion over ℤ additionally requires the appropriate integral peripheral-row normalization. In particular ABᵀ=BAᵀ and rank(A|B)=N. Shapes z_j∉{0,1} solve ∏_j z_j^A_ij(1−1/z_j)^B_ij=(−1)^ν_i. Integer flattening vectors satisfy Af+Bf″=ν (and f′=1−f−f″ with the full incidence equations). For the formal Gaussian route impose det B≠0 and det Λ≠0, Λ=−B⁻¹A+diag(1/(1−z_j)). Λ is symmetric over ℚ(z). This is more than arbitrary integer matrices.

**Depends on.** [Gluing and completeness equations][AQT33]; [Strong flattening theorem][AQT36]; `Matrix.det`.

**API.**

- `NZDatum`: The triangulation-derived matrices, shapes and flattening satisfying the stated equations.
- `NZHessian`: Λ=−B⁻¹A+diag(1/(1−z)).
- `NZHessian_symmetric`: ABᵀ=BAᵀ and invertible B imply symmetry of Λ.
- `NZDatum_nonDegenerate`: Both B and Λ are invertible and all shapes avoid 0 and 1.

**Tests.**

- `NZ_singular_B`: A datum with det B=0 is excluded from this coordinate Gaussian formula.
- `NZ_degenerate_shape`: A shape 1 makes the Hessian and gluing coordinates invalid.
- `NZ_hessian_one_variable`: For A=0,B=1,z=1/2 the algebraic Hessian equals 2; this matrix computation alone does not certify a manifold datum.

**Sources.** [Geometric perturbative invariants][AQT58], §2.2, equations (14)–(19), pp. 6–8, NZ matrices and symplectic completion; [The quantum content of the gluing equations][AQT54], §1.2, pp. 4–5; §§2.1–2.3, pp. 11–13.

<a id="qt-6-formal-nz-state-integral"></a>

### Formal NZ state integral

For nondegenerate Ξ define ψ_h(x,z)=exp(−Σ_(k,ℓ≥0;k+ℓ/2>1) B_k x^ℓ h^(k+ℓ/2−1) Li_(2−k−ℓ)(z)/(k!ℓ!)). These nonpositive-index polylogarithms are rational functions of z. Put F_h^Ξ=exp(√h xᵀ(1−B⁻¹ν)/2+h fᵀB⁻¹Af/8)∏_jψ_h(x_j,z_j). Define Φ^Ξ(h)=⟨F_h^Ξ⟩_Λ using the imported formal Gaussian bracket at covariance Λ⁻¹. The result lies in ℚ(z)[[h]] with constant 1: Gaussian parity removes half-integral powers. This is a formal construction with no analytic contour or error assertion. It differs from the DG ψ normalization by the stated exp(h/12−x√h/2) factor.

**Depends on.** [Neumann–Zagier datum][AQT43]; `HabiroNahmSeries:HB.4/formal-gaussian-integration`; `Polylogarithms:P.1`; `QSeriesPartitionsAndMockModularForms:QM.0`.

**Proof.** Use the source filtered polynomial-series algebra to justify coefficientwise exponentiation. Apply HB.4’s Gaussian differential operator, not a new Gaussian theory. Check odd-polynomial parity and finite contributions to each h coefficient; retain the source prefactor.

At t=√h, positive degree d uses 2n+j=d+2: coefficients are finite polynomials. Instantiate `liNeg r z=Li_(−r)(z)` from Polylogarithms. Zero log constant permits Mathlib `PowerSeries.subst` of `PowerSeries.exp`; degree-d coefficients have parity (−1)^d. HB.4 supplies a ℂ-linear G with G(1)=1, G(x_i p)=Σ_j C_ij G(∂_j p), and G(p(−x))=G(p), C=Λ⁻¹, compatible with coefficient-field embeddings. `NZPerturbativeSeries` extracts G([t^(2d)]F) as coefficient h^d. Its `PowerSeries.expand 2` identity recovers the complete contracted t-series; parity justifies this extraction. The geometric datum and HB.4 scalar extension instantiate this algebraic adapter.

**API.**

- `NZVertexSeries`: The normalized ψ_h series with Bernoulli coefficients.
- `NZVertexLog`: The finite polynomial coefficients of log ψ; `NZVertexLog_hasSubst` certifies substitution.
- `NZVertexSeries_constant`, `NZVertexSeries_parity`: Unit constant and degree-parity identity.
- `NZFormalIntegrand`: F_h^Ξ including its flattening exponential.
- `formalNZStateIntegral`: The imported Gaussian bracket of F_h^Ξ.
- `formalNZStateIntegral_constant`: Its constant coefficient is 1.
- `formalNZStateIntegral_integralPowers`: The resulting half-variable series descends to integer h powers.
- `NZPerturbativeSeries_coeff`, `NZPerturbativeSeries_constant`, `NZPerturbativeSeries_integralPowers`, `NZFormalIntegrand_gaussian_odd`: Exact coefficient extraction, conditional normalization and recovery under h=t² for the algebraic adapter.

**Tests.**

- `formalNZ_constant`: At h=0 Φ^Ξ=1.
- `formalNZ_odd_moment`: The √h coefficient vanishes by Gaussian parity.
- `formalNZ_normalization`: For variance 1, the omitted correction exp(tx/2−t²/12) changes the zero-vertex unit control to 1+h/24+⋯.
- `formalNZ_flattening_gaussian`: The zero-vertex Q=1, μ=1, f=2 control retains coefficient h equal 1/2.
- `formalNZ_bracket_not_multiplicative`: G(x)=0 but G(x²)=1 at covariance 1; the bracket cannot be a ring homomorphism.
- `NZVertexLog_constant`, `NZVertexLog_first`, `formalNZ_vertex_second`: Log coefficients 0, Li₀x/2−Li₋₁x³/6, and −Li₀/12+Li₋₁x²/4−Li₋₂x⁴/24.
- `NZVertexSeries_constant`, `formalNZ_vertex_first`, `formalNZ_vertex_exponential`: Vertex coefficients 1, log coefficient 1, and log coefficient 2 plus half the square of coefficient 1.
- `formalNZ_empty_integrand`, `NZFormalIntegrand_first`, `formalNZ_flattening_prefactor`: Empty product is 1; the linear coefficient includes (1−μ_i)/2; with zero vertex input, Q=1, μ=1, f=2, coefficient t² is 1/2. These algebraic controls do not certify geometric data.

**Sources.** [Geometric perturbative invariants][AQT58], §1, equations (1), (4)–(7), pp. 3–4; §2.2, equations (16)–(19), pp. 7–8; Gaussian evaluation in §3.1, pp. 9–10.

<a id="qt-6-formal-state-integral-invariance"></a>

### Formal state-integral invariance

Φ^Ξ is invariant under the GSW changes of quad, edge/peripheral choice and integer flattening and under a nondegenerate 2–3 Pachner move, with the normalization above. For the geometric discrete-faithful solution of a complete finite-volume cusped hyperbolic M the canonical Epstein–Penner cell decomposition and connected regular refinements give a topological invariant Φ_M∈k_M[[h]], k_M the invariant trace field. This does not assert connectivity of all ideal triangulations seeing an arbitrary representation.

**Depends on.** [Formal NZ state integral][AQT41]; [The flattening condition makes a two-three move an instance of the lifted five-term relation][AQT32]; `HabiroNahmSeries:HB.4/formal-gaussian-integration`; [GeometricTopology — layer-7-riemannian-geometric-structures-and-volume][GT7].

**Proof.** Use formal Fourier and formal pentagon identities of GSW §§3–4 for local moves. For the geometric solution import regular-refinement connectivity of the canonical EP decomposition, permitting flat nondegenerate tetrahedra. Use local rigidity/nonzero one-loop Hessian to meet the determinant hypotheses; each geometric input is a Part II supplier request.

**Sources.** [Geometric perturbative invariants][AQT58], Theorem 1.1, p. 4; §2.3, pp. 8–9; quad and Pachner proofs in §§5–6, pp. 19–38.

<a id="qt-6-nz-to-integral-nahm"></a>

### NZ–Nahm comparison

**Comparison target.**

If B is unimodular over ℤ, N=I−B⁻¹A is symmetric integral. If additionally B⁻¹ν≡diag(N)+1 mod2, the NZ gluing equations are exactly 1−z_j=(−1)^N_jj∏_i z_i^N_ij. The Gaussian Hessian is Λ=N+diag(z_j/(1−z_j)); its determinant agrees with the Nahm discriminant δ=∏_j z_j^(−N_jj)det(diag(1−z)N+diag z) after the indicated nonzero monomial factors. If det B≠0 but B is not unimodular, N can be rational and this is not an input to the symmetric-integral HB.9 theorem. For the standard figure-eight comparison the Bloch index is 2[z₆] over ℚ(√−3).

**Depends on.** [Neumann–Zagier datum][AQT43]; `HabiroNahmSeries:HB.8`; `K3BlochGroups:V.3/cgz-published-bloch-group`; [Geometric number-field Bloch class][AQT35].

**Sources.** [The Habiro ring of a number field][AQT59], §1.8, pp. 15–17, NZ-to-Nahm comparison and figure-eight example.

<a id="qt-6-topological-habiro-module-comparison"></a>

### Topological Habiro-module comparison

**Comparison target.**

For a nondegenerate isolated solution of the symmetric integral N Nahm equations obtained by the preceding qualified bridge, import the HB.8 refined Gaussian collection only after its G1 global-prefactor and G2 regularity conditions are discharged (and retaining its coprime auxiliary root-order condition) and the HB.9 module-membership contract only after its coefficient-transfer, HB.8 all-order identification, Kummer-orientation and all-order gluing obligations are discharged. Its coefficient algebra is the full quadratic finite étale B=R[T]/(δT²−1), including split components, and the target is Φ_(N,z)∈H_(B,ξ|B) at root orders prime to Δ, where ξ=Σ_j[z_j] in the checked CGZ convention. The coefficient ring R is the arithmetic ring of the chosen number field with the required units and bad-prime localization; HNF HB.6/HB.7 supply the Frobenius ring and K₃-indexed module, subject to HB.7 effective global descent extended to this full finite étale algebra; a selected number-field component does not prove membership on all components. Identifying this collection with the normalized geometric NZ series requires the explicit phase/one-loop and classical-exponential comparison. It is a separate obligation, not an automatic assertion that every formal NZ series is in that module. At primitive order k use the root-refined DG2 series. Compare its finite average and one-loop factor with HB.8 under the integral/parity hypotheses; evaluation of the k=1 series is insufficient.

**Depends on.** [NZ–Nahm comparison](#qt-6-nz-to-integral-nahm); `HabiroNahmSeries:HB.8/refinement-gaussian-identification`; `HabiroNahmSeries:HB.9/module-membership`; `HabiroNumberFields:HB.6`; `HabiroNumberFields:HB.7`; `K3BlochGroups:V.3/cgz-published-bloch-group`; [Root-series arithmetic theorem][AQT44]; `HabiroNahmSeries:HB.9/followup-integral-gluing-contract`; `HabiroNahmSeries:HB.9/followup-kummer-orientation-contract`; `HabiroNahmSeries:HB.9/followup-etale-module-contract`.

**Sources.** [The Habiro ring of a number field][AQT59], Theorem 5, §1.7, p. 14; §1.8, pp. 15–17.

<a id="qt-6-faddeev-quantum-dilogarithm"></a>

### Faddeev quantum dilogarithm

For Re b>0, Im b≥0 put c_b=i(b+b⁻¹)/2. In |Im z|<|Im c_b| define Φ_b(z)=exp(∫_(ℝ+i0) e^(−2izw)/(4 sinh(bw)sinh(w/b)w) dw), with the prescribed contour passing above w=0, and extend meromorphically. Zeros are −c_b−mib−nib⁻¹ and poles are c_b+mib+nib⁻¹, m,n≥0, with multiplicities when the lattice points coincide. b↦b⁻¹ is its self-duality. An arbitrary ordinary real-axis integral through w=0 is not this definition.

**Depends on.** `Polylogarithms:P.1`; `MeasureTheory.integral`; `Complex.integral_boundary_rect_eq_zero_of_differentiableOn`.

The Lean signatures use the reciprocal-stable parameter domain Re b>0; the source convention selects its representatives with Im b≥0. A horizontal contour ℝ+iδ with 0<δ<π min(Re b, Re b⁻¹) passes above zero and below the first hyperbolic-sine poles. Strip convergence and contour deformation identify it with the prescribed contour. `IsFaddeevPhi` requires meromorphic normal form on ℂ and agreement with every such strip contour. Existence and uniqueness give the selected function; neither its carrier nor its defining property is admitted as an unspecified type. The divisor is the difference of the finite zero- and pole-lattice cardinalities. At b=1 a point −i(k+1) has order k+1. Functional, inversion and product identities hold on punctured neighborhoods, avoiding arithmetic on totalized pole values.

**API.**

- `faddeevPhi`: The strip integral with the above-zero contour prescription and meromorphic continuation.
- `faddeevPhi_selfDual`: Φ_b(z)=Φ_(1/b)(z).
- `faddeevPhi_divisor`: The stated zeros/poles with their multiplicities.

**Tests.**

- `faddeevPhi_zero_pole`: −c_b is a zero and +c_b is a pole; exchanging them reverses the convention.
- `faddeevPhi_selfDual_b1`: At b=1 the self-duality fixes the parameter.
- `faddeevPhi_contour_prescription`: The defining integrand has a singularity at w=0; the unsubtracted ordinary integral over ℝ is not the above-zero contour definition.

**Sources.** [AK][AK], Definition 15, §1.7, p. 9; Appendix A, §13, pp. 34–37.

<a id="qt-6-faddeev-functional-inversion"></a>

### Faddeev functional equations

As meromorphic identities, Φ_b(z−i b^(±1)/2)=(1+exp(2π b^(±1)z))Φ_b(z+i b^(±1)/2), and Φ_b(z)Φ_b(−z)=ζ_inv⁻¹exp(iπz²), ζ_inv=exp(iπ(1+2c_b²)/6). Where Im b²>0 the product formula is (exp(2πb(z+c_b));exp(2πib²))_∞/(exp(2πb⁻¹(z−c_b));exp(−2πib⁻²))_∞. Equalities at poles are understood meromorphically, not as ordinary finite complex values.

**Depends on.** [Faddeev quantum dilogarithm](#qt-6-faddeev-quantum-dilogarithm); `QSeriesPartitionsAndMockModularForms:QM.0`.

**Proof.** Shift the contour in the defining strip and compute residues. Use the two shift equations for meromorphic continuation. Check the inversion constant at the source normalization; compare the product representation in its convergence domain.

**Sources.** [AK][AK], Appendix A, §13, equations (47)–(49), pp. 34–35.

<a id="qt-6-faddeev-operator-pentagon"></a>

### Faddeev operator pentagon

On the standard Schrödinger Hilbert space L²(ℝ), for self-adjoint position and momentum p,q with [p,q]=1/(2πi) on the common invariant Schwartz core and b>0, the bounded unitary functional-calculus operators satisfy Φ_b(p)Φ_b(q)=Φ_b(q)Φ_b(p+q)Φ_b(p). The closure of p+q and the functional calculus are supplier analytic inputs. This operator identity is distinct from the formal noncommutative q-dilogarithm pentagon owned by HC.1.

**Depends on.** [Faddeev functional equations][AQT40]; [OperatorTheory/SelfAdjointSpectralTheory][SAST], with its Schrödinger/core and microlocal extension.

**Proof.** Use the spectral calculus and the canonical commutation realization supplied by HilbertSpectral. Apply AK Appendix A’s integral Fourier identities on the invariant core. Extend to bounded operators and use the charged identity for admissible analytic Pachner moves.

**Sources.** [AK][AK], Appendix A, §13, equation (50), p. 35.

<a id="qt-6-selected-analytic-state-integrals"></a>

### Selected analytic state integrals

Choose b∈(0,1], ℏ=(b+b⁻¹)⁻², and n=2 or 3. For ε∈(0,π) define g_n(ℏ)=(2π√ℏ)⁻¹∫_(ℝ−iε) Φ_b(z/(2π√ℏ))^(−n)exp(iz²/(4πℏ)) dz, oriented left to right. The strip avoids poles of Φ_b⁻¹ (nearest is at Im z=−π); its tails decay on both ends for n>1. Cauchy deformation identifies permitted ε, defining the ℝ−i0 boundary value. AK’s figure-eight and 5₂ examples identify the absolute values of g₂ and g₃ with their selected knot state integrals after explicit unit-modulus phase correction; the exact phases are tracked in sourceIssues. General contour/analytic gluing invariance is not inferred from the formal NZ theorem.

**Depends on.** [Faddeev functional equations][AQT40]; [Gluing and completeness equations][AQT33]; `MeasureTheory.integral`; `Complex.integral_boundary_rect_eq_zero_of_differentiableOn`.

**Proof.** Use the pole lattice and large-real-argument estimates to justify the horizontal contour and absolute convergence. Prove contour independence by rectangular deformation and vanishing vertical edges. Compare AK’s χ₄₁(0) and χ₅₂(0) with g₂,g₃ including the inversion and exp(−iπ/3) phases.

**API.**

- `analyticStateIntegral`: The displayed g_n with its b,ℏ and horizontal contour.
- `analyticStateIntegral_contour`: Permitted ε in the pole-free strip give the same value.
- `analyticStateIntegral_knotExamples`: The selected AK knot kernels at x=0 agree in absolute value after the explicit phases.

**Tests.**

- `stateIntegral_pole_boundary`: The line Im z=−π reaches a pole of the inverse Φ integrand and is excluded.
- `stateIntegral_hbar_b1`: At b=1 the declared parameter is ℏ=1/4.
- `stateIntegral_phase_52`: χ₅₂(0)=exp(−iπ/3)g₃, so absolute values agree but exact complex values require that phase.

**Sources.** [AK][AK], §§11.4–11.7, pp. 28–32; §12, pp. 32–34.

<a id="qt-6-selected-state-integral-volume"></a>

### Selected state-integral volume theorem

For the AK selected n=2,3 integrals, as ℏ→0+ on the b→0+ branch, v_n(z)=−nLi₂(−e^z)−z²/2 has v′_n(z)=n log(1+e^z)−z. The source’s contour-selected critical point z_n minimizes Im v_n in the stated strip. Its steepest-descent expansion has leading exp(v_n(z_n)/(2πiℏ)) g(z_n)^(−n)/√(i v″_n(z_n)) (1+O(ℏ)). Thus lim_(ℏ→0+)2πℏ log|g₂|=−Vol(S³∖4₁) and similarly g₃ gives −Vol(S³∖5₂). These are decay limits for AK integrals; they are not Kashaev growth theorems. Uniform deformation/error details at the Lean proof boundary are recorded as an analytic gap.

**Depends on.** [Selected analytic state integrals][AQT45]; [Rogers volume and Chern–Simons regulator][AQT37]; `Polylogarithms:P.1`; `HabiroNahmSeries:HB.4`.

**Proof.** Use the quantum-dilogarithm small-b expansion on a pole-free strip. Identify the contour-selected nondegenerate critical points and relate their dilogarithm action to the complete gluing shapes. Use the source steepest-descent contour and O(ℏ) formula, recording uniform-tail/phase estimates required from the analytic supplier.

**Sources.** [AK][AK], Theorem 5, §1.9, p. 11; §12, pp. 32–34, with E8/E9 boundaries.

<a id="qt-6-ak-leveled-positive-shapes"></a>

### Leveled positive shapes

On an imported finite ordered oriented pseudo-3-manifold X with orientation-reversing order-preserving face pairings, a shape assigns α>0 to each local edge, with the three angles at every tetrahedron vertex summing to π. Opposite edges have equal angles. The weight ω(e) is the sum of local angles over each global edge. Balanced means internal and ω=2π; fully balanced means every edge is balanced, hence the face boundary is empty. A level is ℓ∈ℝ. With p sending a local edge to its opposite-edge pair and ε the orientation-induced cyclic antisymmetric incidence, a boundary-zero gauge g shifts α(a) by πΣ_b ε_(p(a),p(b))g(edge(b)), and shifts ℓ by Σ_e g(e)Σ_(a over e)(1/3−α(a)/π), retaining positivity. Leveled shaped equivalence uses gauge equivalence after common vertex-preserving shaped 3↔2 refinements. The inverse 2→3 move requires existence of positive new angles; it is not automatically allowed. The AK admissibility condition is H₂(X∖vertices;ℤ)=0, and composition is allowed only if the glued result remains admissible.

**Depends on.** [GeometricTopology — layer-1-manifold-library-buildout-general-dimension-general-structure-group][GT1].

**API.**

- `AKShape.weight`: ω(e)=Σ_(local a over e)α(a).
- `AKShape.charge`: c(a)=α(a)/(2π); each tetrahedron has three opposite-edge charges summing to 1/2.
- `AKShape.gauge`: The stated gauge action and level shift on the domain retaining positive angles; boundary gauges vanish.
- `AKShape.admissible`: Admissibility is H₂ of the complement of vertices equal to zero; it is checked again after gluing.

**Tests.**

- `ak_regular_charges`: The regular tetrahedron has all local angles π/3 and all three charges 1/6.
- `ak_fullyBalanced_boundary`: A shape with a boundary edge cannot be fully balanced under AK’s definition.
- `ak_positive_inverse_move`: A proposed 2→3 move without positive new angles is excluded, even if its formal linear angle equations have a real solution.

**Sources.** [AK][AK], Definitions 1–11, §§1.2–1.6, pp. 2–8.

<a id="qt-6-ak-charged-tetrahedron-kernel"></a>

### Charged tetrahedron kernel

For λ with ℏ=(λ+λ⁻¹)⁻²>0 and the AK quantum-dilogarithm parameter domain, put c_λ=i(λ+λ⁻¹)/2. Charges a,c>0 and b=1/2−a−c>0 define ψ_(a,c)(x)=Φ_λ(x−2c_λ(a+c))⁻¹ exp(−4πi c_λ a(x−c_λ(a+c))) exp(−πi c_λ²(4(a−c)+1)/6). Its Fourier transform is ψ̃_(a,c)(x)=∫ℝ ψ_(a,c)(y)exp(−2πixy)dy, absolutely convergent, and ψ̃′_(a,c)(x)=exp(−πix²)ψ̃_(a,c)(x)=exp(−πi/12)ψ_(c,b)(x). The positive charged kernel is the tempered distribution δ(x₀+x₂−x₁)ψ̃′_(a,c)(x₃−x₂)exp(2πix₀(x₃−x₂)); the negative kernel is its conjugate transpose. For an ordered tetrahedron, a=α(v₀v₁)/(2π) and c=α(v₀v₃)/(2π). The Dirac factor is a distribution supported on a hyperplane, never an ordinary complex-valued function.

**Depends on.** [Leveled positive shapes][AQT39]; [Faddeev functional equations][AQT40]; `SchwartzMap`; `TemperedDistribution`; `TemperedDistribution.delta`; `SchwartzMap.fourierTransformCLM`; [OperatorTheory/SelfAdjointSpectralTheory][SAST], with its Schrödinger/core and microlocal extension.

**Proof.** Use AK §CTO to prove charged Fourier convergence and the cyclic Fourier identity from Appendix A. Interpret the hyperplane Dirac kernel by its action on Schwartz test functions; prove continuity with the imported nuclear-kernel interface. Apply conjugate transpose for orientation reversal and retain the exp(−πi/12) phase.

**API.**

- `chargedPsi`: The displayed charged scalar function with all three charges positive.
- `chargedPsi_fourier`: exp(−πix²) times its Fourier transform equals exp(−πi/12)ψ_(c,b)(x).
- `chargedTetrahedronKernel`: The specified distribution on four real face coordinates.
- `chargedTetrahedronKernel_adjoint`: Orientation reversal gives the conjugate transpose with incoming and outgoing face coordinates exchanged.

**Tests.**

- `chargedPsi_regular`: At a=c=1/6 the third charge is b=1/6; the Fourier transform cycles the same charge triple with the specified phase.
- `chargedKernel_hyperplane`: The kernel pairs to zero against any test function supported away from x₀+x₂−x₁=0.
- `chargedKernel_zero_charge`: The charge boundary a=0 is outside the strictly positive construction; a limiting or residue invariant requires a separate theorem.

**Sources.** [AK][AK], §4, pp. 15–16, charged kernels and Fourier identities.

<a id="qt-6-ak-charged-pentagon"></a>

### Charged pentagon theorem

For positive charge pairs (a_j,c_j), b_j=1/2−a_j−c_j>0, satisfying a₁=a₀+a₂, a₃=a₂+a₄, c₁=c₀+a₄, c₃=a₀+c₄, c₂=c₁+c₃, the charged operators satisfy T₁₂(a₄,c₄)T₁₃(a₂,c₂)T₂₃(a₀,c₀)=exp(πi c_λ²P_e/3)T₂₃(a₁,c₁)T₁₂(a₃,c₃), where P_e=2(c₀+a₂+c₄)−1/2. This is an equality of the admitted continuous Schwartz/distribution kernels. Products and contractions are defined only with the necessary generic analytic extension conditions. The scalar is part of the equality and is canceled by the AK level shift under the corresponding shaped Pachner move.

**Depends on.** [Charged tetrahedron kernel][AQT38]; [Faddeev operator pentagon](#qt-6-faddeev-operator-pentagon); [OperatorTheory/SelfAdjointSpectralTheory][SAST], with its Schrödinger/core and microlocal extension.

**Proof.** Insert the charge conjugations around the uncharged tetrahedral operator. Use AK §CPI’s Heisenberg relations, the five linear charge equations and the uncharged pentagon. Evaluate the ratio of the five ν charge phases; it is precisely exp(πi c_λ²P_e/3), not 1.

**Sources.** [AK][AK], Proposition 2, §5, pp. 16–17.

<a id="qt-6-ak-leveled-state-integral"></a>

### Leveled AK state integral

For ℏ>0, the AK state integral F_ℏ(X,ℓ)=Z_ℏ(X)exp(iπℓ/(4ℏ)) is obtained by tensoring the signed charged tetrahedron kernels and contracting each identified face variable over ℝ. Its objects are finite face sets, and the morphism associated to X is in S′(ℝ^(boundary faces)). Generic contraction A:n→m, B:m→l is (π_(n,l))_*(π_(n,m)^*A·π_(m,l)^*B), admitted only when the two pulled-back wavefront sets have no opposite covectors at a common base point and their product extends continuously to the enlarged Schwartz test space S(ℝ^(n⊔m⊔l))_m of AK Appendix B. It is a partial composition, not unrestricted multiplication of distributions. On the shape/gauge/Pachner domain above this gives the stated level-normalized construction; convergence and well-definedness are the separate following theorem. Empty face boundary gives a complex scalar.

**Depends on.** [Leveled positive shapes][AQT39]; [Charged tetrahedron kernel][AQT38]; `TemperedDistribution`; [OperatorTheory/SelfAdjointSpectralTheory][SAST], with its Schrödinger/core and microlocal extension.

**Proof.** Tensor the kernels on independent variables; pull them back along the actual face incidence maps. Check wavefront transversality and the enlarged-test-space extension before pushforward along internal variables. Multiply by the exact level phase. Separate generic nuclear/microlocal inputs from the AK-specific homological convergence theorem.

**API.**

- `akStateIntegral`: The tensor contraction of signed charged kernels with exp(iπℓ/(4ℏ)), only on the admitted contraction domain.
- `akStateIntegral_levelShift`: Adding u to ℓ multiplies F by exp(iπu/(4ℏ)).
- `akStateIntegral_glue`: The distributional composition equality for a glued admissible composite, with transversality and extension discharged by the convergence theorem.
- `akStateIntegral_closed`: No boundary face variables identify the output distribution with a complex scalar.

**Tests.**

- `ak_level_shift`: At ℏ>0 a level increase of 8ℏ leaves F unchanged because its phase is exp(2πi).
- `ak_bad_distribution_product`: δ₀·δ₀ on the same coordinate has opposite wavefront covectors and is excluded from this composition rule.
- `ak_closed_output`: The output for an empty face boundary has no free face-coordinate dependence; cusp links at deleted vertices do not add boundary-face variables.

**Sources.** [AK][AK], Theorem 4, §1.7, pp. 9–10; Appendix B, §14, pp. 37–39.

<a id="qt-6-ak-state-integral-invariance"></a>

### AK convergence and invariance theorem

For every positively shaped pseudo-3-manifold X satisfying H₂(X∖vertices;ℤ)=0, Z_ℏ(X) is a well-defined tempered distribution. Thus F_ℏ is the AK unique *-functor on the admissible leveled shaped cobordism categroid: it respects composition exactly when the composite is admissible, orientation reversal by adjoint, and the gauge/common vertex-preserving shaped-Pachner equivalence defined above. The level compensates the charged pentagon and gauge phases. Fully balanced admissible leveled objects have empty face boundary and give scalar invariants of this qualified equivalence class. This does not assert invariance under arbitrary moves that add/remove vertices, or convergence for every shape or homology type.

**Depends on.** [Leveled AK state integral](#qt-6-ak-leveled-state-integral); [Charged pentagon theorem](#qt-6-ak-charged-pentagon); [GeometricTopology — layer-1-manifold-library-buildout-general-dimension-general-structure-group][GT1]; [OperatorTheory/SelfAdjointSpectralTheory][SAST], with its Schrödinger/core and microlocal extension.

**Proof.** Use AK’s Fundamental Lemma: the three adjacent vertex exchanges conjugate the charged kernel by its A/B boundary distributions, with charge permutations and orientation change. Use the operator-valued boundary cohomology class θ_X and its annihilation on the kernel of H₁(boundary∖vertices)→H₁(X∖vertices). In the polarization of §Convergence the kernel is ψ_X(η) times a product of independent Dirac factors. A forbidden repeated Dirac constraint under gluing would yield a nonzero H₂ class. Admissibility rules it out; exponential decay of ψ_X supplies the required pushforward extension. Apply the charged pentagon, gauge-trans phase and level shift to prove independence of the admitted refinements and gauge representatives; use conjugate transpose for the * law.

**Sources.** [AK][AK], Theorem 4, §1.7, pp. 9–10; Theorem 7 and proof of Theorem 4, §10, pp. 24–25.

<a id="qt-6-root-nz-data"></a>

### Root-refined NZ data

Fix a geometric NZ datum Ξ with B∈GL_N(ℤ), symmetric Q=B⁻¹A, nonzero determinant of Λ=−Q+diag(z′), the canonical primitive k-th root ζ=exp(2πi/k), k>0, and choices θ_i^k=z_i. Put F=ℚ(z), F_k=F(ζ), E=F_k(θ); the actual Kummer Galois group embeds into (ℤ/kℤ)^N and need not be the whole product. For m represented by integers 0≤m_i<k, put a_m(θ)=exp(−πi mᵀQm) exp(πi(mᵀQm+mᵀB⁻¹ν)/k) ∏_i θ_i^(−(Qm)_i)/(ζθ_i⁻¹;ζ)_(m_i). These denominators are nonzero since z_i≠1. Assume S=Σ_m a_m≠0 and set Av(g)=Σ_m a_m g(m)/S. Put D*_k(x)=∏_(s=1)^(k−1)(1−ζ⁻ˢx)^s. With chosen roots, τ_(Ξ,k)=k^(−N/2)[det(A diag(z″)+B diag(z⁻¹)) z^(f″/k)(z″)^(−f/k)]^(−1/2)∏_i D*_k(θ_i⁻¹)^(1/k) S. The displayed fractional monomials use the chosen θ_i and roots of z″_i, not unspecified powers. The invariant scalar is qualified modulo its 2k-th-root ambiguity; it is not canonically an element of F_k. For another primitive root ζ^u, transport the complete descended formula by the cyclotomic Galois action, including its phase and a compatible extension to the coefficient and shape-root data; this action need not fix the original shape field. Keeping the displayed canonical exponential while replacing ζ only in the finite products is incorrect.

**Depends on.** [Neumann–Zagier datum][AQT43]; `HabiroNahmSeries:HB.4/formal-gaussian-integration`; `QSeriesPartitionsAndMockModularForms:QM.0`.

**API.**

- `RootNZDatum.weights`: The explicit a_m on (ZMod k)^N with stated integral and root choices.
- `RootNZDatum.average`: Σa_m g(m)/Σa_m, only with nonzero denominator.
- `cyclicDilogarithmStar`: The finite product D*_k(x).
- `RootNZDatum.oneLoop`: The exact τ formula with chosen square and k-th roots.

**Tests.**

- `rootNZ_k_one`: For k=1, the finite average has one summand, D*₁=1 and θ=z.
- `rootNZ_denominator`: If the weighted sum S is zero, the normalized average is outside the constructor’s domain.
- `rootNZ_kummer_relations`: Repeated shapes θ₁=θ₂ cannot admit an independent automorphism rotating only θ₁ in their actual splitting field.
- `rootNZ_primitive_root_transport`: For k=3 and the scalar weight Q=−1, r=1, θ=2, m=2, the canonical numerator is 4ζ⁻¹. Complex conjugation transports the entire weight to numerator 4ζ with the conjugated Pochhammer denominator. Replacing ζ by ζ² only in that denominator retains the wrong numerator. This is a scalar phase test, not a claim that these inputs form a geometric NZ datum.

**Sources.** [Matrix quantum modularity][AQT56], §§2.1–2.2, equations (7), (10)–(12), pp. 5–6; Definition 2.1 and Remark 2.7, pp. 6–7.

<a id="qt-6-root-refined-nz-series"></a>

### Root-refined perturbative series

On RootNZDatum, define the filtered vertex series Ψ_(k,h)(x,θ,m)=exp(Σ_(n,j≥0;n+j/2>1) h^(n+j/2−1)(−1)^j/(n!j!k^j) Σ_(s=1)^k B_n(s/k)Li_(2−n−j)(ζ^(m+s)θ⁻¹)x^j). All polylogarithm indices here are nonpositive; each coefficient is rational in the indicated algebraic arguments. Define F_(k,h)(x;m)=exp(−√h xᵀB⁻¹ν/(2k)+h fᵀB⁻¹ν/(8k))∏_iΨ_(k,h)(x_i,θ_i,m_i). The Gaussian bracket has Hessian Λ/k, hence covariance kΛ⁻¹. Put φ⁺_(Ξ,ζ)(h)=Av(⟨F_(k,h)⟩) and φ_(Ξ,ζ)=τ_(Ξ,k)φ⁺_(Ξ,ζ). Wick parity and coefficientwise finiteness give φ⁺∈1+hE[[h]]. This filtered definition is the rescaled form of DG2’s explicit §2.4 diagram rules: Π=hkΛ⁻¹, valence-zero vertices start at n=2, valence-one/two at n=1 and valence≥3 at n=0. It corrects the unfiltered printed block (E19). It is not obtained by substituting a root into the k=1 series. Choice/topological invariance and identification with Kashaev asymptotics are DG2’s qualified conjecture, modulo ζ^(1/12)exp(h/(24k)); GSW’s k=1 theorem alone proves neither at all roots.

**Depends on.** [Root-refined NZ data](#qt-6-root-nz-data); `HabiroNahmSeries:HB.4/formal-gaussian-integration`; `Polylogarithms:P.1`.

**Proof.** Use DG2 §2.4’s propagator and rational diagonal vertex factors, translated by x↦√h x to the displayed filtered series. Import Gaussian moments from HB.4; pair indices and divide each finite diagram by its automorphism count. The degree bound in LD makes every fixed h coefficient finite. Average coefficientwise over the finite m-set; multiply by the separately chosen one-loop factor. Keep the general conjectures separate.

Positive t-degree d uses 2n+j=d+2. Evaluate Mathlib’s Bernoulli polynomial at s/k, s=1,…,k and import Li_(−r); zero log constant permits exponential substitution. Apply the preceding G laws with C=kΛ⁻¹. `rootNZPerturbativeSeries` takes the actual finite weighted average of G([t^(2d)]F_m), requiring S≠0. Its constant is 1 and expansion under h=t² recovers every contracted coefficient. This algebraic adapter does not assert root compatibility or arithmetic descent for arbitrary supplied weights.

**API.**

- `rootNZVertexSeries`: The displayed degree-filtered Bernoulli-polynomial vertex expansion.
- `rootNZVertexLog`, `rootNZVertexLog_hasSubst`: Finite logarithmic coefficients and substitution condition.
- `rootNZFormalIntegrand`: Exact product with linear prefactor −xᵀμ/(2k) and scalar fᵀμ/(8k), μ=B⁻¹ν.
- `rootNZVertexSeries_parity`, `rootNZFormalIntegrand_parity`: Degree-d coefficients have polynomial parity (−1)^d.
- `rootNZFormalSeries`: The normalized finite average of Gaussian brackets, with Hessian Λ/k.
- `rootNZFormalSeries_constant`: The constant coefficient of φ⁺ equals 1.
- `rootNZFormalSeries_descent`: Its coefficients lie in F(ζ), independently of the k-th shape-root choices, by the following arithmetic theorem.
- `rootNZPerturbativeSeries_coeff`, `rootNZPerturbativeSeries_constant`, `rootNZPerturbativeSeries_integralPowers`, `rootNZFormalIntegrand_gaussian_odd`: Weighted coefficient extraction, conditional normalization and integer-power recovery.

**Tests.**

- `rootNZ_constant`: φ⁺(0)=1 whenever S≠0.
- `rootNZ_odd_moment`: Wick parity removes all odd √h powers.
- `rootNZ_valence_three`: The n=0, j=3 vertex is necessary: two such vertices with three propagators contribute at h¹; the printed n≥1 block omits this two-loop term.
- `rootNZ_valence_three_contraction`: With mock Li₀=0, Li₋₁=1 and all other values zero, k=2, μ=f=0, log coefficients −x³/24 and x²/16 give coefficient h equal 11/48 at covariance 2; deleting the cubic pair leaves 1/8.
- `rootNZ_covariance_scaling`, `rootNZ_flattening_gaussian`: Zero vertices, k=2 and μ=4 give coefficient h equal 1 for f=0 and 3/2 for f=2. Covariance 1 would give 1/2 and 1 respectively.
- `rootNZVertexLog_constant`, `rootNZ_valence_three`, `rootNZ_cubic_scaling`: Zero log constant; at k=1 its t coefficient is −Li₀x/2−Li₋₁x³/6; at k=2 with Li₀=0, Li₋₁=1 it is −x³/24.
- `rootNZVertexSeries_constant`, `rootNZ_vertex_exponential`, `rootNZVertexSeries_parity`: Unit constant, coefficient t² contains half the squared t coefficient, and odd t coefficients are odd polynomials.
- `rootNZ_empty_integrand`, `rootNZ_linear_prefactor`, `rootNZ_flattening_prefactor`: Empty product is 1; with zero vertices, k=2, μ=4, f=2 the t coefficient is −x and the t² coefficient is 1/2+x²/2. These controls distinguish the root prefactor from GSW’s.

**Sources.** [Matrix quantum modularity][AQT56], Definition 2.5, §2.3, p. 7; diagrams in §2.4, equations (24)–(28) and Lemma 2.8, pp. 8–9; [Matrix quantum modularity][AQT56], Conjecture 2.9, §2.8, pp. 11–12.

<a id="qt-6-root-series-arithmetic"></a>

### Root-series arithmetic theorem

For the admitted RootNZDatum with nonzero S, every coefficient of φ⁺_(Ξ,ζ) lies in F(ζ) and is independent of choices θ_i^k=z_i; moreover τ_(Ξ,k)^(2k)∈F(ζ). This proves arithmetic descent of the defined formal series, not its identification with analytic Kashaev asymptotics. The proof uses the actual Kummer subgroup (or universal finite étale root algebra), allowing multiplicative relations among shapes; independent coordinate rotations are not assumed to exist as automorphisms of every selected field component.

**Depends on.** [Root-refined perturbative series](#qt-6-root-refined-nz-series).

**Proof.** Prove k-periodicity of a_m and the simultaneous root-rotation/index-translation identities as rational identities in the universal root algebra. For any actual automorphism with θ_i↦ζ^(−r_i)θ_i, translate all m by r. Both weighted sums transform by the same nonzero factor, so the normalized average is fixed. Use the cyclic-product shift to compensate the one-loop sum; raising to 2k removes root/square-root ambiguities. Correct the cyclic and parity slips E20/E21 in this computation.

**Sources.** [Matrix quantum modularity][AQT56], Theorems 2.2 and 2.6, §§2.2–2.3, pp. 6–8; proofs in §3, pp. 12–16.

<a id="qt-7"></a>

## QT.7 — Quantum modularity and knot examples

<a id="qt-7-the-quantum-modularity-conjecture"></a>

### The conjecture, with its exact normalisation and its domain

**Conjectural target.**

Conjecture (GZ QMC): for γ=(a b;c d)∈SL₂(ℤ), c>0, X→+∞ through rationals with bounded denominator, J_K(γX)∼(cX+d)^(3/2) J_K(X) Φ̂_(a/c)^geo(2πi/[c(cX+d)]). Here the completed geometric series is exp(Vgeo/[den(α)²h])Φ_α^geo(h), with the specified volume representative, one-loop phase and q convention. The relation means an all-orders asymptotic expansion, not equality of rational functions or pointwise convergence of the formal series. The positive-q Bettin–Drappeau theorem is a separately normalized proved specialization for its ten knots, requiring the explicit q-conjugation comparison.

**Depends on.** [Kashaev invariant][AQT23]; [Representation-indexed knot series][AQT52]; [Rogers volume and Chern–Simons regulator][AQT37].

**Sources.** [GZ][GZ], §1, equations (1.5)–(1.6), pp. 10–11.

<a id="qt-7-the-example-ledger"></a>

### A reproducible ledger linking the four kinds of data, for two knots

The ledger records exact knot/root/normalization/representation/shape-field data and mathematical status separately for each output. 4₁: ζ₆=e^(πi/3), ordinary Bloch class 2[ζ₆], field ℚ(√−3), exact Kashaev values 1,5,13,27,46+2√5,89 in orders 1–6 (the other primitive order-five embedding gives 46−2√5), AK decay-volume theorem for g₂, positive-q BD modular theorem, and conjectural matrix refinements. 5₂: the GZ branch ξ³−ξ²+1=0, Im ξ<0; AK g₃ decay theorem and its explicit phase; positive-q BD modular theorem; conjectural quadratic/matrix extensions. Numerical shapes/coefficients have numerical status. Neither a torus knot nor a singular gluing solution satisfies the hyperbolic/nondegenerate hypotheses of these selected theorems.

**Depends on.** [Kashaev invariant][AQT23]; [Geometric number-field Bloch class][AQT35]; [Selected state-integral volume theorem][AQT46]; [Proved quantum modularity cases][AQT48]; [Matrix refined quantum modularity][AQT50].

**Proof.** Use exact arithmetic and the source branches for the finite values and shape fields. Record independently which source proves which analytic output. Treat failed geometric/root-domain hypotheses as nonexamples rather than false theorem instances.

**API.**

- `Ledger`: The table with one row per example and one column per kind of datum.
- `LedgerColumn`: The six columns: cyclotomic coefficients, Kashaev values, invariants at roots of unity, trace field and Bloch classes, volume and Chern-Simons, asymptotic series.
- `LedgerEntry.node`: For each entry, the node that produces it.
- `LedgerEntry.status`: For each entry, one of the five labels: proved, imported, computed, numerical, conjectural.
- `ledgerRows`: The two rows, for the figure-eight knot and for the knot five two.

**Tests.**

- `ledger_figureEight_row`: Every entry of the figure-eight row is filled, and the Kashaev column reproduces the six values of the source.
- `ledger_status_consistent`: Each output has its own status: the selected nondegenerate formal geometric series has a source theorem, AK and BD have selected analytic theorems, while general matrix RQMC and cocycle analyticity remain conjectural. No producing conjectural statement is marked proved.
- `ledger_traceField`: The trace field of the figure-eight knot is the rationals with the square root of minus three adjoined, and of the knot five two the cubic field of the displayed polynomial.
- `ledger_empty_column`: A column that cannot be filled for a row is recorded as empty and not as agreement; this is the discipline the ledger exists to enforce.

**Sources.** [GZ][GZ], §1, equations (1.3)–(1.4), pp. 9–10; producing nodes cite the selected proved cases.

<a id="qt-7-proved-cases-conjectures-and-the-executable-boundary"></a>

### Provenance and comparison boundaries

The ledger records each output’s status. Geometric comparisons require their stated carriers. The two-variable/MMR/relative-Habiro route is Part II, over QT.2.

**Depends on.** [The comparisons with the Habiro ring that are actually proved, and the ones that are not](#qt-6-what-is-exported-to-the-habiro-roadmaps); [A reproducible ledger linking the four kinds of data, for two knots](#qt-7-the-example-ledger).

**Sources.** [Habiro 2008][H06], §7.1, pp. 24–26, two-variable invariant and unified Kashaev specialization.

<a id="qt-7-representation-indexed-perturbative-family"></a>

### Representation-indexed knot series

**Comparison target.**

For a knot with a finite set P_K of isolated boundary-parabolic SL₂(ℂ) representations (including the trivial σ₀), fix their branches, complex-volume representatives Vσ and perturbative normalizations. The geometric σ₁ and conjugate geometric representation are distinguished. Define κσ₀=3/2 and κσ=0 otherwise, and the selected series Φ_ασ(h), with Jσ(α)=Φ_ασ(0), α∈ℚ/ℤ. The trivial series is the rootwise Taylor series of the knot Habiro element in the chosen q=e(α)e^(−h) convention; nontrivial series use a qualified formal NZ datum and its one-loop normalization. For 4₁ |P|=3 and for 5₂ |P|=4. General well-definedness for all representations/triangulations is a comparison obligation, not the geometric GSW theorem.

**Depends on.** [Kashaev invariant][AQT23]; [Formal state-integral invariance][AQT42]; [The conjectural asymptotic expansion, its normalisation, and the field its coefficients lie in](#qt-6-the-asymptotic-series-and-its-arithmetic); `HabiroCyclotomicCompletions:HC.3/the-taylor-map`; `HabiroCyclotomicCompletions:HC.3/re-expansion-of-taylor-expansions`.

**Proof.** Import rootwise Taylor maps for the trivial branch. Extract the selected nontrivial stationary points and finite representation index from the knot data. Compare each formal NZ normalization and field; require isolated nondegenerate input rather than a bare representation label.

**API.**

- `KnotPerturbativeFamily`: The finite representation index, volumes, weights, branches and normalized series.
- `representationWeight`: 3/2 on the trivial representation and zero elsewhere.
- `generalizedKashaev`: The constant term Jσ(α) of a supplied normalized series.
- `trivialSeries_Taylor`: The trivial series uses the exact rootwise Habiro Taylor convention.

**Tests.**

- `representationWeight_trivial`: κσ₀=3/2 and Vσ₀=0.
- `representationIndex_41`: The selected figure-eight family has three representations.
- `representationIndex_52`: The selected 5₂ family has four representations.
- `nonisolated_representation`: A nonisolated or degenerate stationary point is not an input to the declared one-loop formal formula.

**Sources.** [GZ][GZ], §§2.1–2.2, pp. 11–15; §3.1, pp. 15–16.

<a id="qt-7-denominator-volume-cocycle"></a>

### Denominator cocycle

For γ=(a b;c d)∈PSL₂(ℤ), x=r/s∈ℚ in lowest terms with s>0 and cr+ds≠0, set λγ(x)=c/[s(cr+ds)]. Whenever γ′x and γγ′x are finite, λ_(γγ′)(x)=λγ(γ′x)+λγ′(x). For fixed data vσ=Vσ/(2πi), κσ₀=3/2 and κσ=0 otherwise, put j̃γ(x)=diagσ(exp(vσλγ(x))|cx+d|^κσ). Its positive real-power base gives nonzero entries and a GL lift; j̃_(γγ′)(x)=j̃γ(γ′x)j̃γ′(x). Diagonality allows GZ (4.15)’s reversed order. Negating γ leaves λ and j̃ unchanged. The Lean formula accepts fixed volumes and real weights; the preceding target supplies their knot interpretation.

**Depends on.** [Representation-indexed knot series][AQT52]; `QSeriesPartitionsAndMockModularForms:QM.5/quantum-modular-cocycle`.

**API.**

- `denominatorCocycle`: λγ(x) on the declared pole-free rational domain.
- `denominatorCocycle_comp`: The additive composition identity with both pole exclusions.
- `tweakedAutomorphy`: The diagonal exp(Ṽσλγ)|cx+d|^κσ.
- `tweakedAutomorphy_comp`: The factors compose on the common pole-free domain.
- `tweakedAutomorphyEntry`: A scalar entry, nonzero off the pole, with composition and sign invariance.
- `tweakedAutomorphyGL`: The native GL lift; its matrix coercion and composition agree with the diagonal formula.

**Tests.**

- `lambda_T`: For T=(1 1;0 1), λ_T(x)=0.
- `lambda_S_one`: For S=(0 −1;1 0), λ_S(1)=1.
- `lambda_S_zero`: x=0 is excluded from λ_S because Sx is infinite.
- `lambda_sign`: γ and −γ give the same λ.
- `lambda_S_two_thirds`: λ_S(2/3)=1/6, rather than 3/2.
- `tweaked_T`: Every entry is 1 and both the diagonal and GL factor are the identity.
- `tweaked_S_one`: Each entry at S,1 is exp(vσ), independently of κσ; both matrix carriers have that diagonal.
- `tweaked_S_two_thirds`: At weight zero the entry is exp(vσ/6).
- `tweaked_sign`: Negating S leaves the entries and diagonal unchanged; S,0 admits no pole-free GL lift.

**Sources.** [GZ][GZ], §3.1, equation (3.5) and Lemma 3.1, p. 16 (subtract the second fraction in the displayed proof); §4.5, equations (4.14)–(4.15), p. 30.

<a id="qt-7-generalized-quantum-modularity"></a>

### Generalized quantum modularity

**Conjectural target.**

Conjecture (GZ GQMC): for every supplied representation σ, γ=(a b;c d), c>0, and rational X→+∞ with bounded denominator, (cX+d)^(−κσ) exp(−Ṽσλγ(X))Jσ(γX)∼Jσ(X)Φ̂_(a/c)^geo(2πi/[c(cX+d)]). The trivial σ reduces to the original QMC; nontrivial σ has weight zero but retains its complex-volume twist. All-orders error statements are analytic conjectures; neither the formal series nor the cocycle identity proves them.

**Depends on.** [The conjecture, with its exact normalisation and its domain][AQT53]; [Denominator cocycle][AQT49].

**Sources.** [GZ][GZ], §3.1, equation (3.6), p. 16.

<a id="qt-7-lift-from-values-to-series"></a>

### Lift to knot power series

**Conjectural target.**

Conjecture (GZ §§3.2): put ℏ=h/(2πi), x=X−ℏ and h*=h/[(cx+d)(cX+d)]. The generalized value relation lifts coefficientwise to (cX+d)^(−κσ)exp(−Ṽσλγ(X))Φ_(γX)^σ(h*)∼Φ_X^σ(h)Φ̂_(a/c)^geo(2πi/[c(cx+d)]). In completed scalar normalization this is Φ̂_(γX)^σ(h*)∼(cx+d)^(−κσ)Φ̂_X^σ(h)Φ̂_(a/c)^geo(2πi/[c(cx+d)]). Formal coefficients in h each have their own all-orders 1/X assertion; one must not differentiate a rational-point asymptotic statement as if it were a smooth function.

**Depends on.** [Generalized quantum modularity](#qt-7-generalized-quantum-modularity); `HabiroCyclotomicCompletions:HC.3/the-taylor-map`; `HabiroCyclotomicCompletions:HC.3/re-expansion-of-taylor-expansions`.

**Sources.** [GZ][GZ], §3.2, equations (3.9), (3.12)–(3.13), pp. 17–18.

<a id="qt-7-quadratic-relations"></a>

### Quadratic relations of knot series

**Conjectural target.**

Conjecture (GZ): Σ_(σ∈P_K∖{σ₀})Φ_ασ(h)Φ_(−α)^σ(−h)=0, with the chosen phases and representation index. It excludes the trivial representation. For 4₁ the identity follows formally from Φ_α^anti(h)=iΦ_(−α)^geo(−h). For 5₂ the nontrivial relation is supported by source computations, not a general theorem; its arithmetic trace interpretation must use the same embeddings and phase.

**Depends on.** [Representation-indexed knot series][AQT52].

**Sources.** [GZ][GZ], §3.3, equation (3.14), pp. 18–19.

<a id="qt-7-coefficient-asymptotics"></a>

### Knot coefficient asymptotics

**Conjectural target.**

GZ’s experimental large-n expansion couples A_ασ(n)=[h^n]Φ_ασ to all other representations through Γ(n−ℓ+κσ)/(Vσ−Vσ′)^(n−ℓ+κσ), an integer matrix M_K and a phase-dependent prefactor. The printed equation (3.18) uses (2π)^(κσ−1) and M₄₁=((0,1,−1),(0,0,−3),(0,3,0)); its phase must be reconciled with the adjacent coupled formulas containing 1/(2πi), as recorded in sourceIssues. The selected figure-eight asymptotic conjecture is equation (3.16): A(n)∼(3/(2π))Σ_ℓ(−1)^ℓ A(ℓ)(n−ℓ−1)!/(2Vgeo)^(n−ℓ). Distinct action differences, branches and truncation meanings are required. These are conjectural knot statements; general resurgence/Borel summation theory is outside QT.

**Depends on.** [Representation-indexed knot series][AQT52]; [Quadratic relations of knot series][AQT51].

**Sources.** [GZ][GZ], §3.4, equations (3.16)–(3.18), pp. 20–22; E12 records the phase discrepancy.

<a id="qt-7-matrix-refined-quantum-modularity"></a>

### Matrix refined quantum modularity

**Conjectural target.**

GZ supplies selected square matrices Φ_α^(σ,σ′)(h) and J(α)=Φ_α(0), indexed by P_K, with row-wise completions (den(α)h/(2πi))^κσ exp(Vσ/[den(α)²h]). Its matrix RQMC asserts Φ̂_(γX)(h*)≈jγ(x)Φ̂_X(h)Φ̂_(a/c)(2πi/[c(cx+d)]), x=X−h/(2πi), h*=h/[(cx+d)(cX+d)], for bounded-denominator X→+∞ and c>0. This is conjectural and also has a normalization obligation: the printed positive row-weight factor must be reconciled with the scalar completed negative factor in equation (3.13), before transporting a single convention. General matrix invertibility, topological well-definedness and analytic completion are not assumptions silently discharged by GSW’s geometric scalar theorem.

**Depends on.** [Lift to knot power series](#qt-7-lift-from-values-to-series); [Quadratic relations of knot series][AQT51]; [Knot coefficient asymptotics](#qt-7-coefficient-asymptotics).

**Sources.** [GZ][GZ], §4.5, equations (4.12)–(4.14), pp. 28–30; E13 records the weight discrepancy.

<a id="qt-7-knot-matrix-cocycle"></a>

### Knot matrix cocycle

**Comparison target.**

Given the selected knot matrix J(x) with invertible values and a diagonal tweaked factor j̃ satisfying j̃_(γγ′)(x)=j̃γ(γ′x)j̃γ′(x), set Wγ(x)=J(γx)⁻¹j̃γ(x)J(x) on the common rational pole-free domain. Then W_(γγ′)(x)=Wγ(γ′x)Wγ′(x) is a proved algebraic identity under these explicit hypotheses. GZ’s general invertibility/unimodularity assertion is conjectural, so the unconditional knot theorem requires that separate comparison. QT owns the selected knot matrix and this comparison; the general quantum modular/cocycle framework is imported from QM.5.

**Depends on.** [Denominator cocycle][AQT49]; [Matrix refined quantum modularity][AQT50]; `QSeriesPartitionsAndMockModularForms:QM.5/quantum-modular-cocycle`.

**Proof.** Use the supplier matrix-valued cocycle interface. Multiply the matrices in order and cancel J(γ′x)J(γ′x)⁻¹. For a knot-specific application establish J invertibility first; diagonal commutation justifies reversing the source’s order for j̃.

**API.**

- `knotMatrixCocycle`: The stated conjugated automorphy factor on its domain.
- `knotMatrixCocycle_comp`: The ordered multiplicative cocycle identity under invertibility.
- `knotMatrixCocycle_id`: The identity group element gives the identity matrix.

**Tests.**

- `matrixCocycle_constant`: J=I and j̃=I give W=I.
- `matrixCocycle_noncommutative_order`: With j̃=I, J(−1/2)=I, J(2)=(1 1;0 1), J(1)=(1 0;1 1), W_(ST)(1) has entry (0,0)=1; reversing its factors gives 0.
- `matrixCocycle_singular_J`: The matrix (1 1;0 0) has zero determinant and no GL lift.

**Sources.** [GZ][GZ], §5 introduction, equations (5.1)–(5.3), pp. 30–31.

<a id="qt-7-cocycle-analytic-extension"></a>

### Analytic extension of the knot cocycle

**Conjectural target.**

GZ conjectures that Wγ on ℚ∖{γ⁻¹(∞)} extends real analytically to ℝ∖{γ⁻¹(∞)}. For c≠0 the exceptional point is −d/c. The restriction to (−d/c,∞) extends holomorphically to ℂ∖(−∞,−d/c], and the restriction to (−∞,−d/c) extends holomorphically to ℂ∖[−d/c,∞). For c=0 there is no finite exceptional point. RQMC further predicts Wγ(X)≈Φ̂_(a/c)(2πi/[c(cX+d)])⁻¹ for c>0. Algebraic composition and formal inverses do not prove any analytic extension. Generic smooth/holomorphic quantum modular criteria are requested from QM.5, Part II; QT supplies the knot matrices.

**Depends on.** [Knot matrix cocycle](#qt-7-knot-matrix-cocycle); [Matrix refined quantum modularity][AQT50]; `QSeriesPartitionsAndMockModularForms:QM.5`; `MeasureTheory.integral`; `Complex.integral_boundary_rect_eq_zero_of_differentiableOn`.

**Sources.** [GZ][GZ], §5.2, Conjecture 5.1 and conditional Proposition 5.2, pp. 34–37; §5.4, pp. 40–42; both cut planes specified on p. 7.

<a id="qt-7-figure-eight-habiro-descendants"></a>

### Figure-eight Habiro descendants

For m∈ℤ define H_m(q)=Σ_(n≥0)(q;q)_n(q⁻¹;q⁻¹)_n q^(mn) in the integral ordinary Habiro ring. Laurent monomials q^(mn) cause no denominator problem because q is a unit; the summands are cofinally factorial-divisible. The exact recurrence is q^(m+1)H_(m+1)+(1−2q^m)H_m+q^(m−1)H_(m−1)=1. H₀ is the figure-eight Kashaev element, and the first descendant matrix row is (1,H₀,½(qH₁−q⁻¹H₋₁)); the last entry is in ½ times the integral Habiro ring. Its Taylor coefficient of (q−1)² is −½, so it is not an element of the integral ℤ-Habiro ring. The source explicitly only asserts visible integral membership after multiplying this entry by 2. Nontrivial matrix rows involve the selected shape-field branches and are not ordinary integral Habiro elements by this formula alone.

**Depends on.** [Kashaev invariant][AQT23]; `HabiroCyclotomicCompletions:HC.1/the-cyclotomic-completion`; `HabiroCyclotomicCompletions:HC.2/factorial-series`; `HabiroCyclotomicCompletions:HC.3/evaluation-at-a-root-of-unity`.

**Proof.** Construct the sum using the imported factorial-series convergence and q-unit theorem. Telescope the shifted summands to prove the inhomogeneous recurrence in every finite quotient, then pass to the inverse limit. Specialize at roots by truncating at their order. For Q₂=½(qH₁−q⁻¹H₋₁), the n=0 summand is (q−q⁻¹)/2=(q−1)−(q−1)²/2+⋯; every n≥1 summand has order at least 3. This detects its coefficient-ring localization.

**API.**

- `figureEightDescendant`: The integral Habiro series H_m for every integer m.
- `figureEightDescendant_recurrence`: The displayed inhomogeneous three-term recurrence.
- `figureEightDescendant_eval`: At a root of order N only n<N contribute.
- `figureEightDescendant_firstRow`: The trivial row (1,H₀,Q₂) in the scalar extension by ½, with 2Q₂ integral; Q₂ is not in the integral ℤ-Habiro ring.

**Tests.**

- `descendant_root_one`: ev₁H_m=1 for every m.
- `descendant_root_minus_one`: ev₋₁H_m=1+4(−1)^m.
- `descendant_root_three`: For a primitive cube root ζ, evζH₀=13.
- `descendant_recurrence_root_one`: At q=1 the recurrence gives 1−1+1=1.
- `descendant_half_row_not_integral`: The Taylor coefficient of (q−1)² in Q₂ is −½; an implementation placing this matrix entry in the integral ℤ-Habiro ring contradicts its Taylor map.

**Sources.** [GZ][GZ], §7.1, pp. 52–56, descendant sums and recurrence.

<a id="qt-7-bettin-drappeau-proved-cases"></a>

### Proved quantum modularity cases

Bettin–Drappeau prove positive-q modular asymptotics for the ten hyperbolic knots 4₁,5₂,6₁,6₂,6₃,7₃,7₄,7₅,7₆,7₇ (7₂ is excluded). Write J⁺_K(x)=J^red_(K,c)(exp(2πix)), c=den(x). For γ with α=γ∞∈ℚ and h=2πi/(x−γ⁻¹∞), for every M and rational x→+∞ of bounded denominator: J⁺_K(γx)/J⁺_K(x)=(2π/h)^(3/2)exp(i(Vol−iCS)/h)C_K(α)(Σ_(0≤n<M)D_(K,n)(α)h^n+O(h^M)). The error constant depends on α, the denominator bound and M; D_(K,n)∈F_K(e(α)); C=e(ν_K s(α)/2)c^(ν_K/2)Λ_(K,α)^(1/c)δ_K^(−1/2), with Λ in that field and δ in F_K. Branches follow the source. Its positive-q convention is compared explicitly with GZ’s negative-q colored-Jones definition before identifying phases; the general matrix refinements are not proved by this theorem.

**Depends on.** [Kashaev invariant][AQT23]; [Rogers volume and Chern–Simons regulator][AQT37]; `Polylogarithms:P.1`; `HabiroNahmSeries:HB.4`; `QSeriesPartitionsAndMockModularForms:QM.0`.

**Proof.** Use the source’s exact finite Pochhammer reciprocity formula with holomorphic error and prescribed branches. Insert each of the ten explicit knot sums, and use the selected all-orders stationary-phase arithmeticity theorem; demand a source-level proof and uniform error estimates at the supplier boundary. Identify the field and the Dedekind/Gauss constants; correct the source table’s 5₁ label to the hyperbolic 5₂.

**Sources.** [Modularity and value distribution of quantum invariants of hyperbolic knots][AQT57], Theorem 1, §1, p. 2; reciprocal Pochhammer and knot proofs in §§2–3, pp. 8–30.

<a id="qt-7-ak-knot-comparison-conjecture"></a>

### AK knot comparison conjecture

**Conjectural target.**

Conjecture (AK, for a hyperbolic knot K in a closed oriented compact 3-manifold M): there is a smooth J_(M,K)(ℏ,x) on ℝ_>0×ℝ. (1) Every fully balanced positive ideal triangulation X of M∖K has a gauge-invariant real linear angle form λ and a real quadratic angle form φ with Z_ℏ(X)=exp(iφ/ℏ)∫ℝ J_(M,K)(ℏ,x)exp(−xλ/√ℏ)dx. (2) For any positive one-vertex H-triangulation Y approachable by weights tending to τ(K)=0 and τ(other edges)=2π, there is a real quadratic angle form ϕ such that lim_(ω→τ) Φ_b((π−ω(K))/(2πi√ℏ))Z_ℏ(Y)=exp(iϕ/ℏ−iπ/12)J_(M,K)(ℏ,0). (3) lim_(ℏ→0+)2πℏ log|J_(M,K)(ℏ,0)|=−Vol(M∖K). All relevant existence, convergence and limiting conditions are part of the conjecture. AK’s Theorem 5 proves its three parts for (S³,4₁) and (S³,5₂), using χ₄₁ and χ₅₂. The general analytic/formal NZ identification additionally needs matched saddle, logarithmic branches, classical action, one-loop determinant and all-orders error estimates; no such universal comparison follows from formal Pachner invariance.

**Depends on.** [AK convergence and invariance theorem](#qt-6-ak-state-integral-invariance); [Selected analytic state integrals][AQT45]; [Selected state-integral volume theorem][AQT46]; [Formal NZ state integral][AQT41].

**Sources.** [AK][AK], Conjecture 1 and Theorem 5, §1.9, p. 11.

<a id="qt-7-kashaev-volume-conjecture"></a>

### Kashaev volume conjecture

**Conjectural target.**

For a hyperbolic knot K⊂S³, put ⟨K⟩_N=J^red_(K,N)(exp(2πi/N)), with dimension N and zero framing, reduced before root evaluation. The volume conjecture is lim_(N→∞)(2π/N)log|⟨K⟩_N|=Vol(S³∖K). It is conjectural for general K. With the unknot/reduced and negative-q conventions compared, γ=S sends X=N to −1/N in the quantum modular conjecture and recovers this leading exponential assertion. The volume assertion is weaker than an all-orders QMC expansion. AK’s negative decay-volume limit concerns a different analytic invariant and is not a proof of this growth statement. The separate BD theorem supplies its specified family and stronger QMC asymptotics with the positive-q normalization.

**Depends on.** [Kashaev invariant][AQT23]; [The conjecture, with its exact normalisation and its domain][AQT53].

**Sources.** [AK][AK], §1.9, p. 11, volume-conjecture qualification following Conjecture 1; [GZ][GZ], §1, equations (1.1), (1.5)–(1.6), pp. 9–11.

## Sources and fixed versions

- **habiro2008** — Kazuo Habiro. [A unified Witten-Reshetikhin-Turaev invariant for integral homology spheres](https://arxiv.org/abs/math/0605314v1). Public arXiv math/0605314v1 (version explicitly fixed).

- **neumann2004** — Walter D. Neumann. [Extended Bloch group and the Cheeger-Chern-Simons class][N04]. Public arXiv math/0307092v2 (version explicitly fixed).

- **habiro-le-unified-simple-lie** — Kazuo Habiro and Thang T. Q. Le. [Habiro–Lê, unified invariants][AQT55]. Public arXiv 1503.03549v2 (version explicitly fixed).

- **garoufalidis-zagier-quantum-modularity** — Stavros Garoufalidis and Don Zagier. [Knots, perturbative series and quantum modularity][GZ]. Public arXiv 2111.06645v3 (version explicitly fixed).

- **gsw** — Stavros Garoufalidis, Matthias Storzer, Campbell Wheeler. [Geometric perturbative invariants][AQT58]. Public arXiv 2305.14884v2.

- **gswz** — Stavros Garoufalidis, Peter Scholze, Campbell Wheeler, Don Zagier. [The Habiro ring of a number field][AQT59]. Public arXiv 2412.04241v2.

- **ak** — Jørgen Ellegaard Andersen, Rinat Kashaev. [A TQFT from quantum Teichmüller theory][AK]. Public arXiv 1109.6295v2.

- **bd** — Sandro Bettin, Sary Drappeau. [Modularity and value distribution of quantum invariants of hyperbolic knots][AQT57]. Public arXiv 1905.02045v2.

- **bottom** — Kazuo Habiro. [Bottom tangles and universal invariants](https://arxiv.org/abs/math/0505219v2). Public arXiv math/0505219v2.

- **center** — Kazuo Habiro. [An integral form of the quantized enveloping algebra of sl2 and its completions][AQT62]. Public arXiv math/0605313v1.

- **kirby** — Kazuo Habiro. [Habiro, refined Kirby calculus][AQT61]. Public arXiv math/0509039v2.

- **murakami** — Hitoshi Murakami, Jun Murakami. [The colored Jones polynomials and the simplicial volume of a knot][AQT63]. Public arXiv math/9905075v1.

- **wheeler** — Campbell Wheeler. [Quantum knot invariants and the Habiro ring](https://arxiv.org/abs/2603.01619v1). Public arXiv 2603.01619v1.

- **sawin** — Stephen F. Sawin. [Quantum groups at roots of unity and modularity][AQT60]. Public arXiv math/0308281v2.

- **rt1990** — N. Yu. Reshetikhin, V. G. Turaev. [Ribbon graphs and their invariants derived from quantum groups][AQT64]. Communications in Mathematical Physics 127 (1990), 1–26.

- **dg** — Tudor Dimofte and Stavros Garoufalidis. [The quantum content of the gluing equations][AQT54]. Public arXiv 1202.6268v2 (fixed version).

- **dg2** — Tudor Dimofte and Stavros Garoufalidis. [Matrix quantum modularity][AQT56]. Public arXiv 1511.05628v1 (fixed version).

[H06]: https://arxiv.org/abs/math/0605314v1
[GZ]: https://arxiv.org/abs/2111.06645v3
[AK]: https://arxiv.org/abs/1109.6295v2
[N04]: https://arxiv.org/abs/math/0307092v2

[GT1]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/GeometricTopology/README.md#layer-1-manifold-library-buildout-general-dimension-general-structure-group
[GT4]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/GeometricTopology/README.md#layer-4-knot-theory-done-properly-owned-here
[GT5]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/GeometricTopology/README.md#layer-5-dehn-surgery
[GT7]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/GeometricTopology/README.md#layer-7-riemannian-geometric-structures-and-volume
[SAST]: https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/OperatorTheory/SelfAdjointSpectralTheory
[LHW3]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md#layer-3-enveloping-algebra-verma-modules-and-lλ

[AQT00]: #qt-0-admissible-framed-link
[AQT01]: #qt-0-framed-link-and-linking-matrix
[AQT02]: #qt-0-hoste-move
[AQT03]: #qt-0-kirby-and-fenn-rourke-moves
[AQT04]: #qt-0-refined-kirby-calculus
[AQT05]: #qt-0-refined-presentation-existence
[AQT06]: #qt-0-surgery-presentation
[AQT07]: #qt-1-bottom-tangle
[AQT08]: #qt-1-general-drinfeld-jimbo-algebra
[AQT09]: #qt-1-quantized-enveloping-algebra
[AQT10]: #qt-1-reshetikhin-turaev-functor
[AQT11]: #qt-1-ribbon-category
[AQT12]: #qt-1-ribbon-structure
[AQT13]: #qt-1-tilting-negligible-quotient
[AQT14]: #qt-1-topological-ribbon-hopf-algebras
[AQT15]: #qt-1-universal-invariant-integrality
[AQT16]: #qt-1-universal-sl2-invariant
[AQT17]: #qt-2-coloured-jones
[AQT18]: #qt-2-completed-even-center
[AQT19]: #qt-2-cyclotomic-expansion
[AQT20]: #qt-2-finite-free-colors
[AQT21]: #qt-2-integrality-algebraically-split
[AQT22]: #qt-2-p-basis
[AQT23]: #qt-2-the-kashaev-invariant-and-the-function-on-the-rationals
[AQT24]: #qt-3-twisting-theorem
[AQT25]: #qt-4-evaluation-theorem
[AQT26]: #qt-4-general-core-filtration
[AQT27]: #qt-4-strong-kirby-colors
[AQT28]: #qt-5-bloch-element-of-a-triangulation
[AQT29]: #qt-5-combinatorial-flattening
[AQT30]: #qt-5-extended-bloch-kernel
[AQT31]: #qt-5-extended-pre-bloch
[AQT32]: #qt-5-five-term-and-pachner
[AQT33]: #qt-5-gluing-and-completeness-equations
[AQT34]: #qt-5-ideal-tetrahedron-and-shape
[AQT35]: #qt-5-number-field-geometric-bloch-class
[AQT36]: #qt-5-strong-flattening
[AQT37]: #qt-5-volume-and-chern-simons
[AQT38]: #qt-6-ak-charged-tetrahedron-kernel
[AQT39]: #qt-6-ak-leveled-positive-shapes
[AQT40]: #qt-6-faddeev-functional-inversion
[AQT41]: #qt-6-formal-nz-state-integral
[AQT42]: #qt-6-formal-state-integral-invariance
[AQT43]: #qt-6-neumann-zagier-datum
[AQT44]: #qt-6-root-series-arithmetic
[AQT45]: #qt-6-selected-analytic-state-integrals
[AQT46]: #qt-6-selected-state-integral-volume
[AQT47]: #qt-6-topological-habiro-module-comparison
[AQT48]: #qt-7-bettin-drappeau-proved-cases
[AQT49]: #qt-7-denominator-volume-cocycle
[AQT50]: #qt-7-matrix-refined-quantum-modularity
[AQT51]: #qt-7-quadratic-relations
[AQT52]: #qt-7-representation-indexed-perturbative-family
[AQT53]: #qt-7-the-quantum-modularity-conjecture
[AQT54]: https://arxiv.org/abs/1202.6268v2
[AQT55]: https://arxiv.org/abs/1503.03549v2
[AQT56]: https://arxiv.org/abs/1511.05628v1
[AQT57]: https://arxiv.org/abs/1905.02045v2
[AQT58]: https://arxiv.org/abs/2305.14884v2
[AQT59]: https://arxiv.org/abs/2412.04241v2
[AQT60]: https://arxiv.org/abs/math/0308281v2
[AQT61]: https://arxiv.org/abs/math/0509039v2
[AQT62]: https://arxiv.org/abs/math/0605313v1
[AQT63]: https://arxiv.org/abs/math/9905075v1
[AQT64]: https://people.math.harvard.edu/~opie/Reshetikhin_Turaev.pdf
