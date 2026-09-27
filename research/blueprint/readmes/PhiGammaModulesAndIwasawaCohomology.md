# (φ,Γ)-modules and Iwasawa cohomology

## Scope and canonical inputs

This roadmap supplies the cyclotomic coefficient-ring, étale-module, Herr-cohomology, integral ψ and Wach machinery used by the regulator and local Langlands roadmaps. It must connect actual continuous Galois cochains to actual period modules. Defining a cohomology theory to be the homology of a displayed algebraic complex does not establish that connection.

This packet develops three interfaces in detail: extending a canonical scalar ψ through a module's Frobenius linearization; the signed comparison of the two Herr complexes, including an explicit section and homotopy; and the native two-term ψ complex with its canonical kernel/cokernel descriptions. The coefficient rings, analytic inverse required by the homotopy, Galois and Iwasawa comparisons, Fontaine equivalence, overconvergence, Wach existence and relative proofs remain requirements, itemized by stage. No stage is certified closed by this checkpoint.

Accepted RS-26 fixes ownership. `PadicHodgeTheory:P7:annulus-foundations` supplies the early analytic annulus/Robba input, not the later P7 comparison output. `ArithmeticGaloisDuality:D7` supplies the compact/topological continuous-cochain and derived-limit extension of the canonical theory, with duality interfaces. `SelmerIwasawaCohomology:L3` owns derived inverse-corestriction cochains and the completed Galois action. This roadmap owns their comparison with cyclotomic φ/Γ/ψ complexes. Bloch–Kato exponentials and regulator-specific normalization belong to the regulator owner.

The scalar-plus operator is already planned. On B=Z_p[[T]], `ColemanPowerSeries:L1/frobenius-zeroth-coordinate-psi` identifies the canonical zeroth Frobenius coordinate with the independently constructed bounded `AbstractMeasure.psiSeries`. `ColemanPowerSeries:L1/coleman-trace-psi` proves τ=pψ for the **base-valued** finite-free trace. Trace divisibility and the scalar coordinate construction are not repeated. Extension to period-ring models, embeddings and radius topologies remains a separate obligation. A statement on B is not automatically one on every overconvergent ring or coefficient field.

The baseline supplies tensor products, module categories, cochain maps, homotopies and homology. These are used rather than replaced. The reviewed audit also identifies existing low-degree continuous cup products and corestrictions for topological coefficients. Their compatibility with Herr operations must be proved; their general construction is not repeated here.

## Coefficients, torsion conventions and signs

At a fixed radius use two rings R,S with the specified algebra map φ:R→S. Even when the underlying types coincide, the scalar map on S is φ, not an inferred identity self-algebra. The module linearization is an actual S-linear equivalence

    L : S ⊗_(R,φ) M → N.

This is the admitted φ-module datum, not a record assuming Fontaine's equivalence or the Galois comparison. Source and target can differ at a fixed radius, so directions are recorded before taking limits.

For the Herr algebra, use a fixed commutative coefficient ring C on which the operators are linear. Kernels and splittings are C-linear. Operators can be semilinear over the period ring; period-ring linearity does not follow from C-linearity.

KPX's Δ_K denotes the **p-torsion** subgroup of Γ_K, trivial for odd p. Their γ generates the quotient by this subgroup. The roadmap's other odd-prime presentation removes the full prime-to-p torsion to obtain a torsion-free quotient. Those cochain presentations require a comparison; their Δ symbols are not simply identified. At p=2 rational averaging is different from integral descent. Reducing the sign action on Z_2 to F_2 gives a non-surjective map on invariants: the first invariants are zero and the second are F_2. The integral branch requires derived finite-group descent or a double complex, not division by 2.

For commuting F,G the differentials are

    d⁰(x) = ((F−1)x, (G−1)x),
    d¹(a,b) = (G−1)a − (F−1)b.

The terms M,M×M,M lie in degrees 0,1,2. The φ-to-ψ comparison has components id,diag(−ψ,id),−ψ. The separate ψ complex lies in degrees **1 and 2**, with differential ψ−1. Every comparison retains these conventions.

## PG.0–PG.2. Coefficient rings and equivalences

### PG.0. Cyclotomic coefficients

Construct the integral cyclotomic rings, their rational and overconvergent variants, finite-free Frobenius structures, field-of-norms input, semilinear actions and finite-extension maps. Retain coefficient Frobenius for general K: its triviality in the rational-field scalar-plus example is not a general convention. Prove convergence, integrality and continuity of the substitutions realizing φ and Γ and the relations in their actual topology.

The interface used below supplies canonical scalar ψ, its projection formula, and continuous finite coordinates on each claimed radius. Construct the connecting maps and compare with the existing scalar-plus operator. Algebraic freeness does not itself prove continuous coordinates for an arbitrary weak topology.

A reversed finite-free source/target orientation in the retrieved KPX preprint is recorded as `E1`. This roadmap uses S finite free over R via φ. The finding is scoped to that preprint, not to the uninspected version of record.

### PG.1. Fontaine equivalence

Construct D(T) using the enlarged coefficient ring and H_K invariants, and the inverse using Frobenius-fixed vectors. Prove both comparison maps, finite freeness, stable-lattice/étaleness, continuity, full faithfulness and essential surjectivity. Prove torsion and rational coefficient comparisons separately. None follows from receiving L as input to the conditional algebra below.

### PG.2. Overconvergence

Supply the Cherbonnier–Colmez proof with radius choices, changes of radius, base-field and scalar-extension comparisons. Compare the overconvergent and original étale models through actual maps. Not all Robba modules come from representations. The complete proof-source decomposition of these three stages is not supplied by this checkpoint.

## PG.4. Integral ψ through linearization

### Balanced extension

Let r:S→R be canonical scalar ψ, R-linear for the specified φ scalar structure. Define `psiTensor` by

    s ⊗ m ↦ r(s)m.

Balancing is explicit: r(a·s)m=a r(s)m=r(s)(am). Apply the existing `TensorProduct.lift`, not a private tensor product or a tuple declared equivalent to one. Set

    psiOfLinearization(r,L) = psiTensor(r) ∘ L⁻¹.

The pure formula is ψ_N(L(s⊗m))=r(s)m. If r(1)=1 and φ_M(m)=L(1⊗m), it gives ψ_Nφ_M=id. This construction never divides an integral element by p. It works for torsion coefficient modules once their actual linearizations and comparison maps are supplied.

The qualification matters: in the torsion-free scalar ring the existing τ=pψ and coordinate formula determine ψ by cancellation. Modulo p the equation can become 0=0 and does not determine an operator. The construction and reduction maps must precede that reduction; dividing a reduced trace is not a substitute.

`psiOfLinearization_unique` precomposes a candidate with L, compares on pure tensors using `TensorProduct.ext'`, then uses surjectivity. This gives **module-basis** independence with r fixed. It does not say every scalar basis containing 1 has the same zeroth coordinate: replacing a second vector u by u+1 changes it. The canonical r is fixed by its scalar trace/measure comparison.

### Naturality, Gamma and continuity

For actual f:M→M′ and g:N→N′ with g(L(s⊗m))=L′(s⊗f(m)), both sides of ψ_N′g=fψ_N evaluate to r(s)f(m). This is `psiOfLinearization_natural`. Quotient modules are admitted when their actual linearizations exist; no unrestricted coefficient-exactness theorem is inferred.

`psiOfLinearization_semilinear` retains σ_R,σ_S and their compatibility with R→S. Assume rσ_S=σ_Rr and γ_N(L(s⊗m))=L(σ_S(s)⊗γ_M(m)). The pure-tensor calculation gives ψ_Nγ_N=γ_Mψ_N. No averaging occurs.

Suppose actual continuous coordinates satisfy x=Σ_i L(b_i⊗c_i(x)), for a finite family. Then ψ_N(x)=Σ_i r(b_i)c_i(x). Constant scalar multiplication and finite addition prove `psiOfLinearization_continuous`. Supplying those continuous c_i in the claimed topology remains a period-ring/radius theorem, not a consequence silently extracted from algebraic freeness.

### Rank one

For basis e with φ_D(e)=a e and a a unit,

    rankOnePsi(a)(f) = ψ_A(a⁻¹f).

One cannot move a⁻¹ outside ψ without the appropriate scalar relation. The left-inverse formula follows by applying ψ_A to a⁻¹aφ_A(f). A positive-height Wach multiplier need not be a unit in the plus ring; the hypothesis is retained.

Under e′=b e, the multiplier becomes a′=φ_A(b)a b⁻¹. Since a′⁻¹b⁻¹f=φ_A(b⁻¹)a⁻¹f, the projection formula gives

    ψ_(a′)(b⁻¹f)=b⁻¹ψ_a(f).

This is `rankOnePsi_changeBasis`, with the inverse coordinate and Frobenius multiplier visible.

### Psi-zero projection and Coleman input

For ψφ=id define P=1−φψ:M→ker ψ. Then Pφ=0 and P is identity on ker ψ. Every x has the unique decomposition x=φ(ψx)+Px; apply ψ and subtract to prove uniqueness. This is C-linear, not generally period-ring-linear.

On ker(ψ−1), the map 1−φ has values in ker ψ. Its kernel consists exactly of φ-fixed vectors. `oneSubPhiOnPsiOne` is that restriction, with no assertion of surjectivity. In the polynomial model φ(U)=U² with coefficient-extracting ψ, fixed polynomials are constant, so the image is zero while U is a nonzero element of ker ψ. The actual period/Wach module identifications are needed before using this as the input to Coleman coordinates.

## PG.3. Native Herr complexes and comparison

### Complex and signed map

`herrDifferentials_sq` expands d¹d⁰ to GF−FG. `herrComplex` uses native module-category objects, `ModuleCat.ofHom` and `CochainComplex.of`, with zero modules outside degrees 0,1,2. This preserves compatibility with existing homology. An intertwiner h induces `herrMap` with components h,h×h,h; check the two squares and identity/composition degreewise.

Write F for the comparison map from the φ complex to the ψ complex:

    F⁰=id,       F¹(a,b)=(−ψa,b),       F²(c)=−ψc.

The first square is −ψ(φ−1)=ψ−1. The second uses ψγ=γψ and −ψ(1−φ)=1−ψ. These justify both negative signs. Even for φ=ψ=id the signed map need not be identity in degrees 1 and 2.

It is degreewise surjective, using ψφ=id. The simple graded right inverses id,diag(−φ,id),−φ do not in general form a chain map. Its kernel has ker ψ in degrees 1 and 2, differential B=γ−1, and inclusion (a,0) in degree 1. Acyclicity needs an actual inverse for B on that kernel.

### Corrected section

Assume e:ker ψ≃_C ker ψ is an actual equivalence realizing B. Set

    q = inclusion ∘ e⁻¹ ∘ P.

Then Bq=qB=P, qφ=0 and ψq=0. The first identity is the inverse property. For qB=P commute P with B and use uniqueness of a B-preimage in ker ψ. The remaining identities use Pφ=0 and the codomain of q.

Define

    S⁰=id,
    S¹(a,b)=(−φa−q b,b),
    S²(c)=−φc.

The q b correction is essential. The first square uses

    −φ(ψ−1)−qB = −φψ+φ−P = φ−1.

The second uses Bφ=φB and Bq=P. Hence `herrComparisonSection` is a chain map. Its composition FS=id follows from ψφ=id and ψq=0. In categorical notation this is S followed by F.

### Explicit homotopy

Let H vanish except for H²(c)=(q c,0):C_φ²→C_φ¹. In degree 1,

    (id−SF)(a,b)=(P a+q b,0)=H²d¹(a,b),

using qB=P and qφ=0. In degree 2, id−SF=P=d¹H². Degree zero gives zero. Thus id−SF=dH+Hd, with the exact native homotopy sign convention.

`herrComparisonHomotopy` records these components. `herrComparisonEquiv` packages F,S and both identities. The induced homology isomorphism is the existing `HomotopyEquiv.toHomologyIso`, with forward map the one induced by F, not an arbitrary vector-space identification.

These formulas are the worker's algebraic expansion of KPX Proposition 2.3.6's signed diagram and kernel proof. They are not claimed as formulas printed in that paper, and they do not remove the analytic inverse hypothesis.

### Analytic inverse and generator changes

KPX Theorem 3.1.1 supplies a rational inverse in its relative Robba setting. Its route controls Gamma on ψ-zero summands at suitable radii, factors an operator using π and a small perturbation of identity, applies a Neumann inverse, and uses finite-projective complement and gluing arguments. Those estimates, bounds and imported proofs remain required. The abstract retraction does not transfer the inverse to every integral lattice or to γ=1 with nonzero ker ψ.

For an integer n≥0 put Q_n=Σ_(i<n)γ^i. The identity γ^n−1=Q_n(γ−1)=(γ−1)Q_n gives `herrGeneratorMap`, with components id,diag(id,Q_n),Q_n. It is an isomorphism if Q_n is invertible. For γ=id on F_3 and n=3, Q_n=0. The completed-action proof for a genuine p-adic generator change must establish the relevant unit instead of applying an arbitrary power case. The torsion-presentation comparison is also separate.

The actual comparison to continuous Galois cochains must be constructed from its own source proof, then composed with these maps. Cup/corestriction and residue/duality compatibility remain statements about those actual maps.

## PG.5. Psi complex and Iwasawa boundary

`psiComplex` places M in degrees 1 and 2, with differential ψ−1. `psiComplexMap` applies an intertwiner in both degrees. The native short-complex API gives

    H¹(C_ψ) ≅ ker(ψ−1),
    H²(C_ψ) ≅ M / range(ψ−1).

The first map sends a cycle class to the same vector since there are no incoming boundaries. The second sends the degree-two vector to its actual quotient class. Neither defines Iwasawa cohomology to equal these groups.

The remaining theorem compares with `SelmerIwasawaCohomology:L3` derived inverse-corestriction cochains, including the inverse Galois action, integral/rational coefficients, field/corestriction maps and Tate twists. KPX's derived character specialization uses the inverse twist η⁻¹. Its actual maps and hypotheses must be transported rather than replaced by ordinary module evaluation.

Tor terms cannot be silently removed. For Λ=Q[T], M=Λ/(T), ψ=id, the two-term complex has zero differential. Derived specialization at T=0 has dimensions 1,2,1 in degrees 0,1,2; ordinary tensor specialization has 0,1,1. This detects an unrestricted underived base-change assertion.

## PG.6–PG.7. Wach and relative theorems

PG.6 constructs Wach modules in the admitted unramified crystalline setting, with its Hodge–Tate convention and twist. Prove existence, uniqueness, height, D_cris comparison, lattice reconstruction and freeness. The good ψ-zero basis needed by regulators is an additional theorem. Do not extend the unit-multiplier rank-one test to every positive-height lattice, ramified field or de Rham representation.

PG.7 decomposes relative finiteness, perfectness, derived base change and triangulation with affinoid and exceptional-locus hypotheses. Pointwise crystallinity, étaleness or existence of a lattice is not a uniform family construction. The present algebra supplies interfaces, not these source proofs.

## Definition APIs and discriminating tests

Each API name below is in the suggested file. Tests have matching `TEST` annotations and examples. Private polynomial/product-ring fixtures are finite algebra models, not replacement period rings. Executed Laurent-polynomial regressions do not certify Lean or p-adic analysis.

### `psiTensor`

API: `psiTensor_tmul` gives r(s)m; `psiTensor_one` gives m when r(1)=1; `psiTensor_zero` gives zero.

Tests: `tensor_zero` includes torsion M; `tensor_identity_scalar` computes ordinary multiplication for r=id; `tensor_projection_not_product` uses first projection Q×Q→Q, sending (0,1)⊗7 to 0 and (1,0)⊗7 to 7.

### `psiOfLinearization`

API: `psiOfLinearization_pure` gives r(s)m on L(s⊗m); `psiOfLinearization_leftInverse` uses r(1)=1; `psiOfLinearization_zero` gives zero. The pure and left-inverse proofs are separate lemma nodes.

Tests: `linearized_zero` checks zero; `linearized_scaled` uses L(s⊗m)=2sm and gives ψ_N(6)=3; `linearized_torsion` uses the canonical Z-linearization on Z/5 and gives ψ_N(1)=1 while 5 times any element vanishes. It does not identify the degree-one scalar trace with a rank-five trace.

### `rankOnePsi`

API: `rankOnePsi_apply` gives ψ(a⁻¹f); `rankOnePsi_one` gives ψ for a=1; `rankOnePsi_zero` gives zero.

Tests: `rank_one_half` gives 3 on 6 for a=2 over Q; `rank_one_negative` gives −7 for a=−1; `rank_one_no_pullout` uses A=Q×Q and swap, with a=(2,3), giving (1/3,1/2) on 1 rather than (1/2,1/3).

### `psiProjection`

API: `psiProjection_val` gives x−φψx; `psiProjection_phi` gives zero on φx; `psiProjection_onKer` gives identity on ker ψ.

Tests: `projection_zero_kernel` has φ=ψ=id; `projection_nonzero_kernel` gives P(U)=U in the polynomial model; `projection_frobenius_image` gives P(U^p)=0.

### `oneSubPhiOnPsiOne`

API: `oneSubPhiOnPsiOne_val` gives x−φx; `oneSubPhiOnPsiOne_zero` gives zero; `oneSubPhiOnPsiOne_vanish` characterizes zero by φx=x.

Tests: `one_sub_phi_identity` gives the zero map for identity operators; `one_sub_phi_zero` checks zero input; `one_sub_phi_not_surjective` uses p=2 polynomial fixed vectors, whose image is zero while U∈ker ψ is nonzero.

### `herrComplex`

API: `herrComplex_d0`, `herrComplex_d1` are the displayed formulas; `herrComplex_above_two` identifies all higher terms as zero modules.

Tests: `herr_trivial_actions` has both differentials zero for identity actions; `herr_numeric_sign` uses F=2,G=3 over Q, giving d0(7)=(7,14) and d1(5,11)=−1; `herr_wrong_sign` gives d1d0(1)=4 after changing the minus to plus.

### `herrMap`

API: `herrMap_f0` and `herrMap_f2` give h; `herrMap_f1` gives (h(a),h(b)).

Tests: `herr_map_identity` and `herr_map_zero` check the whole cochain map; `herr_map_composition` checks scalars 2 then 3 give 6 in each coordinate.

### `phiPsiComparison`

API: `phiPsiComparison_f0` gives identity; `phiPsiComparison_f1` gives (−ψa,b); `phiPsiComparison_f2` gives −ψ.

Tests: `signed_identity_case` retains the negative signs even for identity ψ; `signed_frobenius_monomial` gives −U from U³ for p=3; `signed_kernel_monomial` kills U in degree two and (U,0) in degree one.

### `kernelResolvent`

API: `kernelResolvent_formula` gives the composite with e⁻¹; `kernelResolvent_mem` gives ψq=0; `kernelResolvent_spec` proves Bq=qB=P, qφ=0, ψq=0 under the explicit inverse hypothesis.

Tests: `resolvent_zero_kernel` gives zero for identity φ,ψ; `resolvent_polynomial` gives q(U)=U,q(U^p)=0 for γ=2id; `resolvent_hypothesis_essential` shows γ−1 is not injective on nonzero ker ψ when γ=id.

### `herrComparisonSection`

API: `herrComparisonSection_f0` gives identity; `herrComparisonSection_f1` gives (−φa−qb,b); `herrComparisonSection_f2` gives −φ.

Tests: `section_zero_kernel` gives (−a,b) for identity φ,ψ; `section_correction` gives (−U,U) from (0,U) for p=3,γ=2id; `section_degree_two` gives −U³ from U.

### `herrComparisonHomotopy`

API: `herrComparisonHomotopy_h1` gives zero; `herrComparisonHomotopy_h2` gives (qc,0); `herrComparisonHomotopy_identity` states the native equation id=dH+Hd+SF.

Tests: `homotopy_zero_kernel` gives zero for identity φ,ψ; `homotopy_kernel_monomial` gives (U,0); `homotopy_image_monomial` gives zero on U³.

### `herrComparisonEquiv`

API: `herrComparisonEquiv_hom` and `herrComparisonEquiv_inv` identify the actual maps F,S; `herrComparisonEquiv_homology` identifies the induced homology map with homologyMap(F).

Tests: `equivalence_forward_sign` sends 1 to −1 in degree two for identity φ,ψ; `equivalence_inverse_correction` sends (0,U) to (−U,U); `equivalence_section_identity` checks that the forward map after that inverse recovers (0,U).

### `herrGeneratorMap`

API: `herrGeneratorMap_f0` gives identity; `herrGeneratorMap_f1` gives (a,Q_n b); `herrGeneratorMap_f2` gives Q_n.

Tests: `generator_one` checks n=1; `generator_geometric_sum` computes Q_3=7 for G=2 over Q; `generator_divisible_index` computes Q_3=0 for identity on F_3 and detects failure of invertibility.

### `psiComplex`

API: `psiComplex_d12` gives ψ−1; `psiComplex_X1` and `psiComplex_X2` identify the supported terms.

Tests: `psi_complex_identity` gives differential zero for ψ=id; `psi_complex_zero_operator` gives −id with zero kernel/cokernel; `psi_complex_degree_zero` distinguishes the zero term in degree zero from the nonzero term in degree one.

### `psiComplexMap`

API: `psiComplexMap_f1` and `psiComplexMap_f2` give h; `psiComplexMap_id` gives the identity cochain map.

Tests: `psi_map_zero`, `psi_map_identity` and `psi_map_composition` check zero, identity and scalar composition in the supported degrees.

## Sources and validation boundary

The packet records exact sources and read scopes. KPX is retrieved arXiv v3, with margin and cover dates distinguished; the JAMS publication was not obtained. The signed diagram, finite-free sentence and local kernel proof were visually checked. LLZ was read as parsed publisher text because rendering failed. Berger's introduction supplies the contrasting torsion convention, not a claimed reading of original equivalence proofs.

The nine baseline declarations were read at the exact Mathlib pin. The broader inventory is attributed to accepted AUDIT-38, not a fresh exhaustive audit. The current scalar Coleman comparison nodes were read. Coverage records identify the uncompleted arithmetic work.

The Lean file is an uncompiled planning prototype: no Lean/lake or local pinned checkout is available. Repository structural/world/index validation is distinct from Lean elaboration, independent mathematical review and completion of the missing arithmetic constructions.
