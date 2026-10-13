# R18.4 — Cohomology and Hecke correspondences

This layer constructs the finite-level cohomological modules used by the Hilbert and quaternionic arithmetic programme. The accepted R18.2 packet already supplies the coefficient systems, finite cohomology, conditional integral control, pairings, eigenspaces, rational definite/indefinite comparison, degeneracy maps, basic purity and finite-cover descent. This continuation supplies the residual vanishing, the precise large-image Ihara argument and its integral consequence, and the generalized quaternionic coefficient projector. It also records the Hilbert support comparison and the adapter to the Betti complexes Tau Ceti now implements.

This is a complete target-level planning pass with R18.4 **planned**. The local p-adic source proofs and the requested supplier extensions below are explicit proof leaves. Every implementation status is unchecked. A compiling linear-algebra suggestion establishes the shape of those signatures; it does not establish the arithmetic theorems.

## Conventions and existing work

Write F for a totally real field, g=[F:Q], D for a quaternion division algebra **split at exactly one real place** τ, and X_K for its compact Shimura curve at sufficiently small effective level K. All components are retained. Smallness means the arithmetic stabilizers act freely after quotient by the rational center; it is not torsion-freeness of the ineffective full group. For F=Q compactness requires finite ramification. At a split finite place w identify D_w with M₂(F_w), put q_w=|k_w|, and use hyperspecial K_w=GL₂(O_w). The Iwahori has lower-left entry divisible by π_w. Right-level maps have convention ρ_h:[x,a]↦[x,ah]; the two degeneracy maps are ρ_1 and ρ_(diag(π_w,1)⁻¹).

O is the complete DVR of a finite extension of Q_l, with residue field k and uniformizer λ. Algebraic coefficient lattices must descend through the effective level. Local systems with finite residual coefficients factor through finite level quotients. A coefficient action away from w is an actual hypothesis of the Ihara theorem, including at w|l. It cannot be inferred from an algebraic weight label.

The unnormalized spherical operators are T_v=[K diag(π_v,1) K] and S_v=[K diag(π_v,π_v) K], with vol(K)=1. The Hecke algebra used for localization is the commutative away algebra; any U_v or bad-place type operator is named separately. S_v is invertible and acts by the central character. Use the cohomological geometric-Frobenius polynomial X²−T_v X+q_v S_v, compatible with Carayol's geometric reciprocity. The cyclotomic character ε has geometric value q_v⁻¹. Fixed determinant is θ=ψε⁻¹. Arithmetic Frobenius is the inverse and has the normalized reciprocal polynomial, as in IHG.3/frobenius-conversion. The Hecke adjoint ideal is m*, obtained from T_v*=S_v⁻¹T_v, S_v*=S_v⁻¹; it need not equal m.

The compact-curve integral theorem concerns H¹ and its genuine lattice, with dual coefficients at the adjoint ideal. An open Hilbert variety instead carries ordinary and compact support groups and their support map; its inner group is their image. Neither integral freeness nor middle-degree concentration is assumed there.

The accepted [R18.2 packet](../packets/HilbertModularVarietiesAndShimuraCurves--R18.2.json) supplies the following imports. Their statements and retained limitations are part of this layer.

| Existing R18.4 node | Imported contract |
| --- | --- |
| quaternion-local-systems | Arithmetic coefficient sheaves from actual lattices and effective levels. |
| finite-cohomology | Finite integral and rational Betti/étale groups with compatible actions; finiteness alone gives no freeness. |
| integral-cohomology-control | Freeness and reduction conditional on the two residual degree-zero vanishings. |
| cohomology-pairing | Rational pairing, derived integral duality, and trace/pullback adjunction. |
| cohomological-eigenspaces | Characteristic-zero cohomological eigenspaces with actual coefficient models. |
| definite-indefinite-comparison | Rational eigensystem comparison, not equality of whole groups or integral lattices. |
| cohomological-degeneracy | The two pullbacks and traces of degree q_w+1. |
| quaternion-purity | Rank-two Morita summand purity; the generalized coefficient projector is supplied here. |
| finite-level-descent | Averaged invariants only when the effective covering order is invertible; Hochschild–Serre otherwise. |

The H0 packet supplies earlier Hilbert geometry and the canonical quaternionic curve. It has no R18.4 coverage record. The nine imports and their remaining-work record are in R18.2, whose files are outside this review and unchanged. Packaging must replace the core eigenspace R17 prerequisites with ALS.5/AF.3/AF.4 and the early bridge below, and replace the core purity R34.5 back-edge with the Saito projector and coefficient-purity target here. The new targets do not inherit those backward edges.

At the pins, TauCeti.LocalCoefficientSystem is already a fundamental-groupoid functor into ModuleCat; the constant functor, pullback and monodromy are implemented. Mathlib's Scheme.EllAdicCohomology is constant continuous Z_l pro-étale sheaf cohomology with an additive group structure. It does not supply algebraic local coefficient sheaves, integral duality or the comparison used here. The finite-torsion-free freeness theorem over a PID and the DVR class are imported rather than reproved.

Current Tau Ceti at a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 additionally contains the twisted cochain complex, twisted cohomology, coefficient maps, pullback and constant-system comparison in AlgebraicTopology/Cohomology/Twisted/Basic.lean. Those declarations are credited as current work, not as declarations at f790474. Their Hom variance necessitates the arithmetic dual/bidual adapter below. The current AlgebraicTopology, IntegralLattices and IntegralHeckeAndGaloisDeterminants roadmaps were checked: generic twisted cohomology and the GL_n polynomial remain with their existing owners.

## The targets

The build follows the vanishing/control and support comparisons, the degeneracy matrix, the finite-level Ihara inputs and proof, then the coefficient projector and purity. A dependency that names a supplier node imports its exact contract. A supplier stage below has an explicit request; its unproved theorem is not treated as a library declaration.

### 1. Hecke action on quaternionic connected components

Target `HilbertModularVarietiesAndShimuraCurves:R18.4/component-hecke-action` (construction).

For a sufficiently small level K of an indefinite quaternion division algebra D/F split at exactly one real place, retain every geometric connected component. Reduced norm identifies their indexing torsor with C_K=F_{f}^{×}/(F^{×,+}ν(K)). On the free finite A-module A[C_K], at v outside the discriminant, level and coefficient-action set, T_v acts by (q_v+1) times translation by the class c_v of a uniformizer, and S_v by translation by c_v². On a component character χ the spherical polynomial is (X−χ(c_v))(X−q_vχ(c_v)). This is a geometric component-action specialization of the existing GL2 Hecke normalization.

**Hypotheses.** F totally real; D division and split at exactly one real place; K sufficiently small in the effective central quotient. A finite coefficient algebra; the two spherical double cosets have volume(K_v)=1; translations use the right-level convention.

**Uses.** `HilbertModularVarietiesAndShimuraCurves:R18.4/residual-eisenstein-vanishing`: Classify the support of degree-zero sections. `HilbertModularVarietiesAndShimuraCurves:R19.2`: Exclude component characters from cuspidal cohomology.

**API.**

- `R18Cohomology.components_T` (compatibility): T_v[e_c]=(q_v+1)[e_{c c_v}].
- `R18Cohomology.components_S` (compatibility): S_v[e_c]=[e_{c c_v²}], so S_v is invertible.
- `R18Cohomology.components_character` (compatibility): At χ the two roots are χ(c_v) and q_vχ(c_v).
- `R18Cohomology.components_linearAction` (constructor): Extend the right permutation of the finite component torsor to A[C_K] by A-linearity; an equivariant identification of torsors induces the corresponding module isomorphism.
- `R18Cohomology.components_ext` (extensionality): A-linear maps out of A[C_K] are equal if they agree on every component basis vector.
- `R18Cohomology.components_translation_comp` (relation): Translation by 1 is the identity; translation by c then d is translation by cd, and translation by c⁻¹ is its inverse. The dual function model acts by f(xc).
- `R18Cohomology.components_coeffMap` (functoriality): A→B sends each basis vector to the same indexed B-basis vector and commutes with T and S; identity and composite coefficient maps agree.

**Definition checks.**

- `R18Cohomology.component_trivial` (computation): For C_K=1 and A=F_7, q_v=3, T_v=4 and S_v=1.
- `R18Cohomology.component_central` (non-example): For C_K cyclic of order 3 and c_v a generator, S_v is a nonidentity permutation.
- `R18Cohomology.component_change_uniformizer` (compatibility): Multiplying π_v by O_v× leaves both operators unchanged.

**Construction or proof.**

1. Use canonical quaternionic components and reduced-norm strong approximation to obtain the finite component torsor.
2. Every representative in K diag(π_v,1) K has norm class c_v, and the double coset has q_v+1 right cosets. The scalar double coset has norm class c_v².
3. Extend these permutations A-linearly; the character calculation agrees with IHG.3’s polynomial X²−T_vX+q_vS_v.

**Dependencies.** `HilbertModularVarietiesAndShimuraCurves:R18.1/canonical-quaternionic-curve`, `HilbertModularVarietiesAndShimuraCurves:R18.4/quaternion-local-systems`, `IntegralHeckeAndGaloisDeterminants:IHG.3/gln-hecke-polynomial`.

**Sources.** [MS](https://arxiv.org/pdf/1907.06043v2), §§2.7–2.9 and proof of Proposition 2.3, pp.8–10: The component Hecke action forces a reducible unramified characteristic polynomial.

**Acceptance.** The action is on all components, and changing a uniformizer by a local unit does not change c_v.

### 2. Residual Eisenstein vanishing

Target `HilbertModularVarietiesAndShimuraCurves:R18.4/residual-eisenstein-vanishing` (theorem).

Let L_k be the finite k-local system from a continuous finite-image K-representation, trivial on K∩Z(F), whose action factors through finitely many finite places. Let m be a maximal ideal of the away spherical Hecke algebra with associated absolutely irreducible residual two-dimensional representation. Then H⁰(X_K,L_k)_m=H²(X_K,L_k)_m=0. The same conclusion holds for L_k∨(1) at the adjoint ideal m*. No bound on the algebraic weight relative to l is required.

**Hypotheses.** The compact curve, level and all components satisfy component-hecke-action. k is a finite field of characteristic l; the associated residual representation is given in the matched cohomological Hecke/Frobenius convention.

**Construction or proof.**

1. Trivialize L_k at a finite normal finer level. Degree-zero sections embed in component sections with fibre coefficients; their good-place Hecke characters have the reducible polynomial computed by component-hecke-action.
2. Use existing ray-class reciprocity (with inverse arithmetic Artin map for the stipulated geometric convention) to realize each component character as η on G_F. Its two cohomological Frobenius roots give η⊕ε⁻¹η. Chebotarev density and semisimple reconstruction contradict absolute irreducibility for a character supported at m. This is Proposition 2.4’s argument, without assuming the level quotient semisimple.
3. Use curve duality and the adjoint involution to transfer the degree-zero calculation for L_k∨(1) at m* to degree two for L_k at m.

**Dependencies.** `HilbertModularVarietiesAndShimuraCurves:R18.4/component-hecke-action`, `ArithmeticLocallySymmetricSpaces:ALS.4/eisenstein-maximal-ideal`, `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/hecke-adjoint-duality`, `IntegralHeckeAndGaloisDeterminants:IHG.1/algebraically-closed-reconstruction`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

**Sources.** [MS](https://arxiv.org/pdf/1907.06043v2), Propositions 2.3–2.4, pp.9–10: Constant and finite local coefficient cohomology in degrees zero and two has Eisenstein support.

**Acceptance.** A residual Eisenstein ideal can have H⁰≠0; irreducibility is indispensable. Use no idempotent averaging over a quotient of order divisible by l.

### 3. Adjoint Hecke localization and integral duality

Target `HilbertModularVarietiesAndShimuraCurves:R18.4/adjoint-localization-duality` (comparison).

For finite free O-local coefficients on the compact curve, the integral Poincaré pairing pairs the m-factor of H¹(L_O) with the m*-factor of H¹(L_O∨(1)), where m* is the image of m under the anti-involution T_v*=S_v⁻¹T_v and S_v*=S_v⁻¹. Non-Eisenstein support is preserved by this involution. Under residual degree-zero vanishings on the two factors the pairing is perfect over O, and pullback is adjoint to trace. No equality m=m* is assumed.

**Hypotheses.** O is the valuation ring of a finite extension of Q_l; the coefficients and their dual descend through the effective level. The residual system and its adjoint factor have vanishing H⁰ as in residual-eisenstein-vanishing.

**Construction or proof.**

1. Identify the inverse double cosets: diag(π⁻¹,1) is centrally translated from diag(π,1), giving S⁻¹T; invert the central scalar double coset to get S⁻¹.
2. Apply the accepted derived cohomology-pairing and integral-cohomology-control to these two localized factors.
3. After residual vanishings eliminate adjacent-degree obstructions, derived duality restricts to a perfect degree-one lattice pairing. The trace identity follows from generic finite-level duality.

**Dependencies.** `HilbertModularVarietiesAndShimuraCurves:R18.4/cohomology-pairing`, `HilbertModularVarietiesAndShimuraCurves:R18.4/integral-cohomology-control`, `HilbertModularVarietiesAndShimuraCurves:R18.4/residual-eisenstein-vanishing`, `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/verdier-poincare-duality`.

**Sources.** [MS](https://arxiv.org/pdf/1907.06043v2), §2.7 and proof of Proposition 2.3, pp.8–10: The Hecke adjoint involution relates degrees zero and two. [Milne](https://www.jmilne.org/math/CourseNotes/LEC.pdf), Theorem 24.1 and Remark 24.2, pp.144–145: Curve duality and the trace normalization are compatible.

**Acceptance.** A central character of order greater than two can have m*≠m; the target retains both factors. The degree-one pairing is integral only after the stated vanishings.

### 4. Non-Eisenstein integral cohomology control

Target `HilbertModularVarietiesAndShimuraCurves:R18.4/non-eisenstein-integral-control` (application).

For the finite free O-local system L_O on X_K and a non-Eisenstein maximal ideal m as above, H⁰(L_O)_m=H²(L_O)_m=0, H¹(L_O)_m is finite free over O, and H¹(L_O)_m⊗_O k→H¹(L_k)_m is an isomorphism. For every n≥1 the analogous O/λⁿ coefficient reduction is an isomorphism. These statements apply at both hyperspecial and sufficiently small Iwahori levels with coefficients descending there.

**Hypotheses.** All localized cohomology groups are finite O-modules as in the accepted finite-cohomology node. Finite free coefficients and their residual dual satisfy residual-eisenstein-vanishing.

**Construction or proof.**

1. Apply residual-eisenstein-vanishing to L_k and its Tate dual, keeping the adjoint ideal.
2. The coefficient exact sequence and Nakayama kill H²(L_O)_m; degree-zero torsion-free sections vanish by reduction.
3. The same sequence makes H¹(L_O)_m λ-torsion-free. Apply the accepted control node and the pinned PID finite-torsion-free freeness result. Induct on n using coefficient sequences to obtain every finite reduction.

**Dependencies.** `HilbertModularVarietiesAndShimuraCurves:R18.4/finite-cohomology`, `HilbertModularVarietiesAndShimuraCurves:R18.4/integral-cohomology-control`, `HilbertModularVarietiesAndShimuraCurves:R18.4/adjoint-localization-duality`, `mathlib:Module.free_of_finite_type_torsion_free'`.

**Sources.** [MS](https://arxiv.org/pdf/1907.06043v2), Proposition 2.4, p.10, and §2.10, p.10: Residual Eisenstein vanishing supplies the finite-level integral reduction needed for homology and cohomology. [Milne](https://www.jmilne.org/math/CourseNotes/LEC.pdf), Theorem 24.1, p.144: Duality controls the adjacent degree in the coefficient sequence.

**Acceptance.** The proof applies to all n, not merely rational coefficients. No corresponding unqualified freeness assertion is made for an open Hilbert variety.

### 5. Finite-cover reduction for Ihara coefficients

Target `HilbertModularVarietiesAndShimuraCurves:R18.4/coefficient-descent-for-ihara` (theorem).

Let H^w be an open normal subgroup of K^w trivializing a finite k-representation Λ of K^w, trivial on K∩Z(F). At a non-Eisenstein ideal, injectivity of the constant-coefficient degeneracy map at every sufficiently small finer H^w implies injectivity for L_Λ at K. The quotient K^w/H^w may have order divisible by l.

**Hypotheses.** The degeneracy prime w is split for D and K_w is hyperspecial. The coefficient action is away from w; the same normal subgroup is used at both w-levels.

**Construction or proof.**

1. Use the finite-cover Hochschild–Serre sequence, not division by the covering degree.
2. Its initial H¹(Δ,H⁰(X_H,k)⊗Λ) term vanishes after non-Eisenstein localization by residual-eisenstein-vanishing; H⁰ itself vanishes there.
3. Identify H¹ at K with the Δ-invariants of the localized finer cohomology tensored with Λ. An equivariant injective degeneracy map remains injective after invariants.

**Dependencies.** `HilbertModularVarietiesAndShimuraCurves:R18.4/residual-eisenstein-vanishing`, `ArithmeticLocallySymmetricSpaces:ALS.6/finite-cover-hochschild-serre`, `HilbertModularVarietiesAndShimuraCurves:R18.4/cohomological-degeneracy`.

**Sources.** [MS](https://arxiv.org/pdf/1907.06043v2), Lemma 6.4 and proof, p.34: Finite local coefficients reduce to constant coefficients by Hochschild–Serre and degree-zero vanishing.

**Acceptance.** A cover quotient of l-power order is an acceptance case; averaging is unavailable. Coefficients acting nontrivially at w are outside this reduction.

### 6. Arithmetic coefficient adapter for twisted Betti cohomology

Target `HilbertModularVarietiesAndShimuraCurves:R18.4/betti-coefficient-dual-adapter` (comparison).

For a finite free O-representation W of the arithmetic component group, the ordinary Betti local system L_W is compared with Tau Ceti’s existing twisted cochain complex applied to L_(W∨) and target O: its cochains take Hom_O(W∨,O), identified with W by biduality. This yields H^i_B(X_K,L_W), naturally for coefficient maps, level pullback and Hecke trace. Applying the existing complex to L_W itself would compute dual coefficients.

**Hypotheses.** Finite free fibres; effective small level; all arithmetic components and the prescribed local coefficient action retained. The algebraic sheaf/Betti comparison is imported from the accepted arithmetic local-system and sheaf-singular comparison nodes.

**Construction or proof.**

1. Read the actual twisted complex: it is linear Yoneda applied to twisted chains and is contravariant in its coefficient local system.
2. Use fibrewise finite-projective biduality to identify Hom(W∨,O) with W, with transport carried by the dual inverse action.
3. Apply ALS.1/sheaf-singular-comparison; verify naturality under pullback and the stalk-sum trace rather than construct another generic twisted cohomology theory.

**Dependencies.** `tauceti:TauCeti.LocalCoefficientSystem`, `tauceti:TauCeti.LocalCoefficientSystem.pullback`, `tauceti:TauCeti.LocalCoefficientSystem.monodromyRepresentation`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`, `ArithmeticLocallySymmetricSpaces:ALS.1/sheaf-singular-comparison`, `ArithmeticLocallySymmetricSpaces:ALS.1/arithmetic-local-system`.

**Sources.** [Carayol](https://www.numdam.org/item/10.24033/asens.1512.pdf), §§2.1–2.2, pp.417–420: Arithmetic representations define local systems on quaternionic components. [Milne](https://www.jmilne.org/math/CourseNotes/LEC.pdf), Theorem 21.1 and Remark 21.2, pp.129–131: Finite local coefficient étale/Betti comparison is compatible with the sheaf interpretation.

**Acceptance.** For W rank one with monodromy a unit u, the adapted coefficient transport is u; the unadapted Hom complex has u⁻¹. Current Tau Ceti twisted declarations are credited at current main, without claiming their presence at the old pin.

### 7. Finite-level Hilbert support comparison

Target `HilbertModularVarietiesAndShimuraCurves:R18.4/hilbert-etale-betti-adapter` (comparison).

For a smooth finite-level Hilbert modular variety Y over a number field, algebraic integral coefficients from the accepted Hilbert arithmetic local-system construction, and an embedding into C, finite O/λⁿ étale and Betti cohomology agree naturally in every degree, with ordinary and compact supports and the map H_c^i→H^i. Passing to compatible O-adic systems gives their derived integral comparison. Inner cohomology is the image of this support map; its rational Hecke eigenspaces use ALS.5. No compactness, integral torsion-freeness or degree-g concentration is inferred.

**Hypotheses.** The level is small enough for a smooth scheme or the declared effective groupoid treatment; coefficients are genuinely defined on both sides. Support comparisons, constructible extension by zero and inverse-system hypotheses are those of CC.0’s imported comparison target.

**Construction or proof.**

1. Specialize the arithmetic-local-system and level-pullback nodes to the Hilbert space, using the bidual adapter for existing Betti complexes.
2. Import the finite étale/Betti support and trace-orientation comparisons from CC.0; take the compatible derived O-adic system.
3. Define the inner groups by the actual image of H_c→H and use functoriality to transport Hecke actions; the geometric boundary is not discarded.

**Dependencies.** `HilbertModularVarietiesAndShimuraCurves:H3/hilbert-hecke-isogenies`, `HilbertModularVarietiesAndShimuraCurves:H4/finite-level-torsors`, `ArithmeticLocallySymmetricSpaces:ALS.1/arithmetic-local-system`, `ArithmeticLocallySymmetricSpaces:ALS.1/betti-complexes`, `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/duality-pairings`, `CompletedCohomologyPartII:CC.0/finite-etale-betti-support-comparison`, `CompletedCohomologyPartII:CC.0/finite-etale-trace-orientation-comparison`, `HilbertModularVarietiesAndShimuraCurves:R18.4/betti-coefficient-dual-adapter`.

**Sources.** [Milne](https://www.jmilne.org/math/CourseNotes/LEC.pdf), Theorem 21.1 and Remark 21.2, pp.129–131: Finite local coefficient comparison extends to constructible support calculations. [Deligne](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), Corollary 3.3.6, printed p.206: Inner cohomology is the image between the two support theories, not the entire ordinary group.

**Acceptance.** An open Hilbert surface retains the support map and boundary contribution. Generic constructible comparison is a supplier target with its recorded gaps; this arithmetic adapter does not silently close them.

### 8. GL2 degeneracy Gram operator

Target `HilbertModularVarietiesAndShimuraCurves:R18.4/degeneracy-gram` (definition).

For a commutative Hecke coefficient algebra A acting on an A-module M, q∈N, T∈A and S∈A×, define G_(q,T,S) on M⊕M by (x,y)↦((q+1)x+S⁻¹Ty,Tx+(q+1)y). Put Δ=(q+1)²−S⁻¹T² and J(x,y)=((q+1)x−S⁻¹Ty,−Tx+(q+1)y). Then GJ=JG=Δ id. The chosen ordering corresponds to T=π₂,*π₁*.

**Hypotheses.** All scalar operations use the actual commuting Hecke image; S is a unit, not tacitly one.

**Uses.** `HilbertModularVarietiesAndShimuraCurves:R18.4/geometric-gram-identity`: Identify δ†δ without imposing a central character of order two. `HilbertModularVarietiesAndShimuraCurves:R18.4/oldspace-splitting`: Construct an explicit left inverse when Δ is a unit.

**API.**

- `R18Cohomology.gram_first` (compatibility): pr₁G(x,y)=(q+1)x+S⁻¹Ty.
- `R18Cohomology.gram_second` (compatibility): pr₂G(x,y)=Tx+(q+1)y.
- `R18Cohomology.gram_adjugate` (compatibility): GJ=JG=Δ id.
- `R18Cohomology.gram_baseChange` (compatibility): Extending scalars carries G, J and Δ to the same formulas over the new algebra.
- `R18Cohomology.gram_linearMap` (constructor): For an A-module M, commuting scalars T∈A, S∈A× and q, construct G,J as A-linear product maps with the displayed entries, and Δ∈A.
- `R18Cohomology.gram_ext` (extensionality): Two product-valued linear maps are equal exactly when their first and second component maps agree; the displayed entries therefore determine G uniquely.
- `R18Cohomology.gram_moduleMap` (functoriality): Every A-linear f:M→N intertwines G_M with G_N and J_M with J_N under f×f; this includes identities and composites.

**Definition checks.**

- `R18Cohomology.gram_zero_hecke` (degenerate): With T=0 the matrix is (q+1) times identity, and Δ=(q+1)².
- `R18Cohomology.gram_central_factor` (computation): Over Q, q=2, T=3, S=2 gives G(0,1)=(3/2,3); removing S⁻¹ fails.
- `R18Cohomology.gram_level_raise` (non-example): For q=2,T=3,S=1 over Q, Δ=0 and G(1,−1)=0.

**Construction or proof.**

1. Form the A-linear product map using scalar endomorphisms and the displayed four entries.
2. Expand compositions to get the scalar Δ; commutativity cancels mixed terms.
3. Match the central involution T*=S⁻¹T in the geometry below.

**Dependencies.** `HilbertModularVarietiesAndShimuraCurves:R18.4/adjoint-localization-duality`, `ArithmeticLocallySymmetricSpaces:ALS.3/hecke-operator-formula`.

**Sources.** [MS](https://arxiv.org/pdf/1907.06043v2), §§2.6–2.7 and §2.11, pp.8,10–11: Right-level maps and double cosets determine the two trace-pullback entries; the matrix is derived here with the central adjoint retained.

**Acceptance.** The definition specializes to the symmetric PGL2 matrix only after S acts as one.

### 9. Geometric degeneracy Gram identity

Target `HilbertModularVarietiesAndShimuraCurves:R18.4/geometric-gram-identity` (theorem).

At a split hyperspecial prime w, take ω=diag(π_w,1), K_0(w) with lower-left entry divisible by π_w, π₁=ρ_1 and π₂=ρ_(ω⁻¹). Both maps X_(K_0(w))→X_K have degree q_w+1. For coefficients acted on away from w, δ=π₁*+π₂*:M²→M_0 and δ†=(π₁,*,π₂,*). With T_w=π₂,*π₁* and S_w the central scalar double coset, δ†δ=G_(q_w,T_w,S_w).

**Hypotheses.** Use the maps and coefficient identifications of the accepted cohomological-degeneracy node. All cohomology is localized at an away Hecke ideal compatible with these maps; integral traces have their unnormalized degree convention.

**Construction or proof.**

1. Count cosets for both maps, obtaining diagonal trace-pullback q_w+1.
2. The composite π₂,*π₁* is the diag(π_w,1) double coset in the stipulated right-action convention.
3. The reverse composite is its inverse double coset, centrally translated by S_w⁻¹. Substitute the four entries in degeneracy-gram.

**Dependencies.** `HilbertModularVarietiesAndShimuraCurves:R18.4/cohomological-degeneracy`, `HilbertModularVarietiesAndShimuraCurves:R18.4/degeneracy-gram`, `HilbertModularVarietiesAndShimuraCurves:R18.4/adjoint-localization-duality`, `ArithmeticLocallySymmetricSpaces:ALS.3/hecke-composition`.

**Sources.** [MS](https://arxiv.org/pdf/1907.06043v2), §2.11, pp.10–11, with §2.7, p.8: The two right-level degeneracy maps and the central spherical operator fix the normalization.

**Acceptance.** Changing the ordering of π₁ and π₂ transposes the off-diagonal entries; the declared ordering remains fixed. The double-coset identity holds before assuming residual Ihara.

### 10. Unit-discriminant oldspace splitting

Target `HilbertModularVarietiesAndShimuraCurves:R18.4/oldspace-splitting` (theorem).

If Δ=(q_w+1)²−S_w⁻¹T_w² is a unit in the localized Hecke image, then r=Δ⁻¹Jδ† is an integral left inverse of δ. Thus the old module im δ is a direct summand of M_0 and δ is injective. With free M_0 the quotient is O-free. The hypothesis Δ∈A× is sufficient for this splitting, not necessary for Ihara saturation.

**Hypotheses.** geometric-gram-identity; all scalar operators commute and Δ is a unit. The freeness conclusion additionally assumes O a DVR and M_0 finite free.

**Construction or proof.**

1. Use the adjugate identity to compute rδ=Δ⁻¹JG=id.
2. The idempotent δr gives M_0=im δ⊕ker r.
3. Finite direct summands of a free DVR module are finite torsion-free and hence free.

**Dependencies.** `HilbertModularVarietiesAndShimuraCurves:R18.4/geometric-gram-identity`, `mathlib:Module.free_of_finite_type_torsion_free'`.

**Sources.** [MS](https://arxiv.org/pdf/1907.06043v2), §§2.7 and 2.11, pp.8,10–11: The trace and degeneracy operators supply the input; this unit-discriminant conclusion is an explicit algebraic deduction.

**Acceptance.** Δ≡0 mod λ does not prove failure of residual Ihara; no converse is asserted. The left inverse contains the central operator in J.

### 11. Residual injectivity and DVR saturation

Target `HilbertModularVarietiesAndShimuraCurves:R18.4/residual-injectivity-saturation` (theorem).

For a DVR O with uniformizer λ, finite free O-modules M,N and an O-linear f:M→N, injectivity of f mod λ is equivalent to f being injective with finite free cokernel. Equivalently f is injective and im f is saturated in N. Here saturated means λy∈im f implies y∈im f; all nonzero scalars then have the same property.

**Hypotheses.** O is a nonfield DVR; λ generates its maximal ideal; M and N are finite free.

**Construction or proof.**

1. If f mod λ is injective, divide a purported kernel vector by its minimal coordinate valuation to contradict reduction.
2. If λy=f(x), reduction gives x=λx′; torsion-freeness of N gives y=f(x′). Thus the cokernel has no λ-torsion, hence no torsion. Apply the pinned finite-torsion-free freeness theorem.
3. Conversely a short exact sequence with a free cokernel stays exact after tensoring k, so f mod λ is injective.

**Dependencies.** `mathlib:IsDiscreteValuationRing`, `mathlib:Module.free_of_finite_type_torsion_free'`.

**Sources.** [MS](https://arxiv.org/pdf/1907.06043v2), Theorem 6.5, p.34, and §2.10, p.10: The residual theorem is intended for integral localized modules; the equivalence here is the separate DVR algebra needed to deduce saturation.

**Acceptance.** Multiplication by λ on O is injective but has nonsaturated image and zero residual map. The assertion needs both source and target free; rational injectivity alone is insufficient.

### 12. Auxiliary unipotent prime

Target `HilbertModularVarietiesAndShimuraCurves:R18.4/auxiliary-unipotent-prime` (theorem).

Suppose l>2, ρ̄:G_F→GL₂(k) is absolutely irreducible with finite image whose order is divisible by l. Outside any prescribed finite set there is a split good prime q with Nq≡1 mod l and ρ̄(Frob_q) conjugate to a nonidentity unipotent matrix. This auxiliary prime is distinct from the Taylor–Wiles primes with distinct residual eigenvalues.

**Hypotheses.** F totally real; k a finite field of characteristic l; extend k to contain the matrix entries. The excluded set contains l, the discriminant, all level and coefficient-action primes, and the intended degeneracy prime w.

**Construction or proof.**

1. Cauchy’s theorem gives an element of order l in the residual image; in dimension two it is a nonidentity unipotent, conjugate to J=(1,1;0,1).
2. In a finite extension containing the splitting field and F(ζ_l), lift this element to σ₀ and take σ=σ₀^(1−l). Its residual matrix remains J and its cyclotomic character becomes one.
3. Apply number-field Chebotarev to this conjugacy class. Inverting Frobenius changes to a conjugate nonidentity unipotent and leaves Nq≡1 intact.

**Dependencies.** `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`, `HilbertModularVarietiesAndShimuraCurves:R18.4/component-hecke-action`.

**Sources.** [MS](https://arxiv.org/pdf/1907.06043v2), Lemma 6.9 and proof, pp.35–36: Chebotarev jointly prescribes a unipotent residual element and trivial residual cyclotomic value.

**Acceptance.** Requiring two distinct residual eigenvalues at this q would contradict its role. For an exceptional residual image this argument does not produce q.

### 13. Local deformation models for quaternionic Ihara

Target `HilbertModularVarietiesAndShimuraCurves:R18.4/ihara-local-deformation-models` (construction).

For the auxiliary q, residual unramified J and fixed determinant θ=ψε⁻¹, choose O=W(k)[ζ+ζ⁻¹] with ζ a primitive lth root and π=(ζ−ζ⁻¹)². The q-local fixed-determinant quotients are R_ps=O[[X,Y₁,P,R]]/(X²Y₁−π), R_unip=O[[X,Y₂,P,R]]/(XY₂), R_nr=R_unip/(X) and R_N=R_unip/(Y₂). Their residual coordinates identify Y₁=Y₂=Y, with k[[X,Y,P,R]]/(X²Y)→k[[X,Y,P,R]]/(XY). At v|l use the O-flat reduced potentially semistable quotient over the specified finite extension L′/F_v, parallel Hodge–Tate weights {0,1} and determinant θ; its nonempty components have dimension 3+[F_v:Q_l]. At v∤l unrestricted fixed-determinant framed rings are O-flat of relative dimension 3.

**Hypotheses.** l>2; at q the finite-order ψ is unramified and det ρ̄=ψε⁻¹ mod π. O has the stated minimal ramification during the regular-model flatness argument. Unrestricted coefficient enlargement is made only after the argument by faithful flatness. At v|l choose L′ making the finite set of local Weil–Deligne types with the prescribed K_v⁰ invariants semistable and trivializing ψ there.

**Uses.** `HilbertModularVarietiesAndShimuraCurves:R18.4/patched-type-flatness`: The regular principal-series model and its nonreduced special fibre are the flatness bridge. `HilbertModularVarietiesAndShimuraCurves:R18.4/taylor-wiles-prime-datum`: Form the completed tensor product of local fixed-determinant rings.

**API.**

- `R18Cohomology.local_q_specialise` (compatibility): Reduction of R_ps maps onto R_unip modulo π with the same X,Y and smooth coordinates.
- `R18Cohomology.local_q_branches` (compatibility): R_nr=R_unip/(X) and R_N=R_unip/(Y), with these branch labels fixed.
- `R18Cohomology.local_q_regular` (compatibility): R_ps is regular over the specified O; R_nr and R_N are formally smooth over O.
- `R18Cohomology.local_l_pointCriterion` (compatibility): A characteristic-zero point factors through the v|l quotient exactly when it has determinant θ and becomes semistable with weights {0,1} over L′.
- `R18Cohomology.local_q_lift` (universal-property): Continuous local O-algebra maps from R_ps to a complete separated local O-algebra B correspond to choices of X,Y₁,P,R in m_B satisfying X²Y₁=π; the analogous R_unip maps satisfy XY₂=0. Evaluation on these coordinates determines the map uniquely.
- `R18Cohomology.local_framed_universal` (universal-property): The unrestricted framed fixed-θ ring represents continuous lifts in the chosen frame, naturally in Artinian O-algebras. The potentially semistable quotient construction and point criterion remain conditional on the recorded Kisin proof leaf.
- `R18Cohomology.local_branch_quotient` (relation): The unramified and N branch projections kill X and Y₂ respectively, with their quotient universal properties; all smooth framing parameters survive these maps.

**Definition checks.**

- `R18Cohomology.local_q_thickening` (non-example): Modulo π, the class XY is nonzero in k[[X,Y]]/(X²Y) but zero in k[[X,Y]]/(XY).
- `R18Cohomology.local_q_branch` (characterisation): In the unramified branch X=0 while Y remains a free coordinate; swapping the labels fails.
- `R18Cohomology.local_q_determinant` (non-example): The fixed-determinant q presentation has four variables; adjoining a free determinant coordinate changes its dimension.

**Construction or proof.**

1. Apply the generic framed representability node, using local finite Galois cohomology for the finiteness hypothesis, then impose determinant θ.
2. At q impose the inertia characteristic polynomials and the unipotent level-raising relation of MS §3.3. In its coordinates eliminate the determinant variable δ. Propositions 3.5–3.7 give the four-variable presentations and the common residual coordinate.
3. R_ps is regular because its defining equation has uniformizer term; R_nr and R_N are formal power-series rings. For v|l the precise quotient is the Zariski closure of the allowed characteristic-zero points. Its representability/dimension proof is retained as the local-deformation source gap, not inferred from a predicate on points.

**Dependencies.** `HilbertModularVarietiesAndShimuraCurves:R18.4/auxiliary-unipotent-prime`, `DeformationAndDerivedPatchingAlgebra:R03.2/continuous-framed-representability`, `ArithmeticGaloisDuality:D7/local-coefficient-field-duality`, `PadicHodgeTheory:R06.2`, `PadicHodgeTheory:R06.3`.

**Sources.** [MS](https://arxiv.org/pdf/1907.06043v2), §§3.1–3.3, Remark 3.4 and Propositions 3.5–3.7, pp.13–17: Fixed determinant eliminates one coordinate and yields the regular principal-series and nodal unipotent models; §3.2 cites Kisin for the p-adic quotient.

**Acceptance.** The exact special-fibre thickening is X²Y, not XY; the flatness transfer needs this difference.

### 14. Early quaternionic local type correspondence

Target `HilbertModularVarietiesAndShimuraCurves:R18.4/quaternionic-local-types-and-support` (theorem).

At q∤l with q≡1 mod l and residual unramified J, local Langlands in the cohomological normalization and local Jacquet–Langlands give the following characteristic-zero support criteria for the prescribed determinant: spherical/trivial type implies R_nr; Steinberg type implies R_unip; a discrete-series representation compatible with the q-ramified quaternion algebra implies R_N; the principal-series inertial type χ⊕χ⁻¹ for an order-l tame character χ implies R_ps. For the definite module only the discrete-series alternative occurs. These are factorization assertions for actual cohomological Galois actions, not equivalences for every deformation.

**Hypotheses.** Inflate the finite GL₂(k_q) types to GL₂(O_q), with central character compatible with ψ. The underlying Weil–Deligne representation is that of the early quaternionic cohomological realization, with geometric reciprocity and its specified dual/twist.

**Construction or proof.**

1. For spherical vectors inertia is trivial. Steinberg and principal-series types are detected by their inertia polynomial and the Frobenius/monodromy relation; substitute the defining conditions of MS §3.3.
2. The q-ramified quaternion algebra matches precisely discrete-series GL₂ representations via local Jacquet–Langlands, so use its N branch.
3. Apply local-global compatibility at q∤l to the actual cohomology representations. The integral factorization follows from O-flatness and the scheme-theoretic characteristic-zero closures in the local models.

**Dependencies.** `HilbertModularVarietiesAndShimuraCurves:R18.4/ihara-local-deformation-models`, `HilbertModularVarietiesAndShimuraCurves:R18.4/quaternionic-jacquet-langlands-bridge`, `HilbertModularVarietiesAndShimuraCurves:R18.4/early-quaternionic-galois-hecke-support`, `SmoothRepresentationsOfLocalGroups:SR.3`.

**Sources.** [MS](https://arxiv.org/pdf/1907.06043v2), §3.6, Proposition 3.10, pp.17–18, and Propositions 4.20–4.21, p.30: Local types cut out the four local deformation quotients supporting the patched modules. [Carayol](https://www.numdam.org/item/10.24033/asens.1512.pdf), §0.5, Theorem A and Theorem B-prime, pp.410–412: The geometric cohomological Weil–Deligne normalization and prime-to-l local compatibility are specified.

**Acceptance.** Steinberg residual support belongs to the union XY=0; it is not identified integrally with only one branch. No general local Langlands theory is duplicated; this finite list of inputs precedes R17.

### 15. Finite-level Taylor–Wiles prime datum

Target `HilbertModularVarietiesAndShimuraCurves:R18.4/taylor-wiles-prime-datum` (theorem).

For the large-image residual representation and exceptional l=5 condition of residual-ihara-large-image, fix finite S and local conditions as above. With Σ the framed finite places, j=4|Σ|−1, there exist integers r,g and sets Q_n outside S, |Q_n|=r, with Nv≡1 mod lⁿ and two distinct residual Frobenius eigenvalues at v∈Q_n. Choose one eigenvalue at each v. The framed fixed-determinant global ring R_(S∪Q_n)^□,θ admits a surjection R_loc[[x₁,…,x_g]]→R_(S∪Q_n)^□,θ. The unframed ring represents strict-equivalence deformations with the same determinant θ, and framing is formally smooth of relative dimension j. Set R_∞=R_loc[[x₁,…,x_g]] and S_∞=O[[y₁,…,y_r,w₁,…,w_j]]; dim R_loc=r+j−g+1 and dim R_∞=dim S_∞=r+j+1.

**Hypotheses.** ρ̄|_(G_F(ζ_l)) absolutely irreducible; for l=5 with projective image PGL₂(F₅), ker proj ρ̄ is not contained in G_F(ζ₅). Finite-order ψ trivial on the central level, θ=ψε⁻¹, and exactly the same θ for framed and unframed functors. The local deformation models and global ramification set satisfy MS §4.2, with Σ containing all l-adic places and auxiliary q.

**Construction or proof.**

1. Use arithmetic Galois finiteness and generic representability to construct the global fixed-determinant strict and framed functors. Absolute irreducibility removes noncentral infinitesimal automorphisms, giving j frame parameters.
2. The adjoint Selmer/dual Selmer calculation selects r Taylor–Wiles primes with chosen distinct eigenvalues and kills the dual Selmer obstruction. This exact arithmetic selection theorem is requested from lower-tier Selmer cohomology.
3. Apply the generic minimal-presentation and relation-bound algebra to obtain the uniform surjections and the displayed numerical dimension equality, as in MS Lemma 4.10.

**Dependencies.** `HilbertModularVarietiesAndShimuraCurves:R18.4/ihara-local-deformation-models`, `DeformationAndDerivedPatchingAlgebra:R03.2/continuous-framed-representability`, `DeformationAndDerivedPatchingAlgebra:R03.2/minimal-deformation-presentation`, `ArithmeticGaloisDuality:R02.4/global-finiteness`, `SelmerIwasawaCohomology:L2`.

**Sources.** [MS](https://arxiv.org/pdf/1907.06043v2), §4.2 and Lemma 4.10, pp.22–24: Taylor–Wiles primes, global framed presentations and matching numerical dimensions are available under these image hypotheses.

**Acceptance.** The auxiliary q has repeated eigenvalues; Q_n has distinct eigenvalues and excludes q. A framed ring with determinant θ cannot map by forgetting frames to an unframed ring with determinant ψ.

### 16. Early finite-level quaternionic Galois–Hecke realization

Target `HilbertModularVarietiesAndShimuraCurves:R18.4/early-quaternionic-galois-hecke-support` (theorem).

For the compact quaternionic curve with constant weight-two coefficients, a non-Eisenstein ideal m and a finite-order central character ψ lifting det ρ̄·ε, the localized O-flat Hecke image acting on H¹ carries a continuous two-dimensional representation ρ_T of G_(F,S). In geometric Frobenius conventions det(X−ρ_T(Frob_v))=X²−T_vX+q_vS_v at v∉S and det ρ_T=ψε⁻¹. At v|l it satisfies the specified K_v⁰-potentially semistable weight-{0,1} condition. Consequently the unframed fixed-θ global ring surjects onto this Hecke image, compatibly with finer levels; the separate local-type target supplies the q-type factorization. A residual irreducible representation is an input to localization; no modularity-lifting theorem is used.

**Hypotheses.** The cohomology module is finite free by non-eisenstein-integral-control and the Hecke image is the actual image on it. Coefficient field enlarged to split residual ρ̄; ψ-central part treated by central-character-exactness.

**Construction or proof.**

1. Use the lower-tier Betti/de Rham/relative Lie algebra comparison and the requested compact quaternionic Matsushima decomposition, with AF.3 spectral and AF.4 actual E-model inputs. The minimal Jacquet–Langlands bridge identifies the relevant automorphic factors. Carayol B-prime realizes their prime-to-l compatible systems. Do not import the older eigenspace node through its R17 prerequisites.
2. Interpolate the two-dimensional determinants into the O-flat integral Hecke image using IHG.4/compact-determinant-gluing, then IHG.1/continuous-matrix-reconstruction at the split absolutely irreducible residue.
3. Use finite-level p-adic compatibility to factor through the l-adic local quotients; this step does not follow from Carayol’s prime-to-l theorem and is recorded as an unresolved source proof input.
4. The universal property supplies R^θ→T; it is surjective because the away Frobenius traces generate the Hecke image. Use Chebotarev for uniqueness and level compatibility.

**Dependencies.** `HilbertModularVarietiesAndShimuraCurves:R18.4/non-eisenstein-integral-control`, `HilbertModularVarietiesAndShimuraCurves:R18.4/central-character-exactness`, `HilbertModularVarietiesAndShimuraCurves:R18.4/quaternionic-jacquet-langlands-bridge`, `IntegralHeckeAndGaloisDeterminants:IHG.4/compact-determinant-gluing`, `IntegralHeckeAndGaloisDeterminants:IHG.1/continuous-matrix-reconstruction`, `IntegralHeckeAndGaloisDeterminants:IHG.3/frobenius-conversion`, `HilbertModularVarietiesAndShimuraCurves:R18.4/taylor-wiles-prime-datum`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`, `ArithmeticLocallySymmetricSpaces:ALS.5/de-rham-comparison`, `ArithmeticLocallySymmetricSpaces:ALS.5`, `AutomorphicFormsOnReductiveGroups:AF.3`, `AutomorphicFormsOnReductiveGroups:AF.4`.

**Sources.** [MS](https://arxiv.org/pdf/1907.06043v2), Lemma 4.11, p.24, and §3.6, pp.17–18: The pre-patching global deformation ring acts through the localized Hecke algebra, with local conditions established before patching. [Carayol](https://www.numdam.org/item/10.24033/asens.1512.pdf), Theorems A, B-prime and §0.11, pp.410–412: Compact quaternionic cohomology realizes the prime-to-l compatible system.

**Acceptance.** This is the minimal input formerly sought from R19.2; it has no prerequisite in R22. Arithmetic Frobenius uses the normalized reciprocal polynomial; the stated q_vS_v determinant is geometric.

### 17. Exact central-character localization

Target `HilbertModularVarietiesAndShimuraCurves:R18.4/central-character-exactness` (theorem).

Let Γ_K=Z(A_f)/(Z(F)(K∩Z(A_f))) act freely at the sufficiently small effective level, and let A be a finite local Z_l-algebra. Put A∨=Hom_Z_l(A,Q_l/Z_l), with A acting by precomposition with multiplication. The modules H¹(X_K,A∨)_m and H⁰(Y_K,A∨)_m are injective A[Γ_K]-modules. Thus ψ-parts are exact on the particular cohomological sequences with these injective kernels, and Pontryagin duality gives the corresponding homological character quotients, with inverse characters under contragredient duality. This remains valid when l divides |Γ_K| and supplies the central-character steps in the patching filtration. The symbol A∨ denotes the coefficient Pontryagin dual, not Hom_A(A,A) or an unspecified dual of H¹.

**Hypotheses.** m non-Eisenstein; ψ compatible with the central level and coefficients. Smallness makes the finite central quotient action free, not just an action of an ineffective center. The definite clause uses the general-field constant-coefficient R18.3 Part II request, rather than the restricted KW specialisation.

**Construction or proof.**

1. Apply the finite-cover Hochschild–Serre sequence to the free central quotient action. Degrees zero and two vanish after non-Eisenstein localization.
2. Apply the Hom_{A[Γ_K]}(-,H¹(X_K,A∨)_m) calculation in MS Lemma 2.5 to arbitrary finite A[Γ_K]-modules. Non-Eisenstein concentration makes this functor exact, proving injectivity. On the definite side the free finite orbits give a coinduced module with injective coefficient cogenerator A∨.
3. Take ψ-parts only in the sequences to which this injectivity applies. Pontryagin duality converts them to the homological quotient sequences with the contragredient character. Use the finite central group algebra and the residual central-character block in the final Nakayama step.

**Dependencies.** `HilbertModularVarietiesAndShimuraCurves:R18.4/residual-eisenstein-vanishing`, `ArithmeticLocallySymmetricSpaces:ALS.6/finite-cover-hochschild-serre`, `HilbertModularVarietiesAndShimuraCurves:R18.3`.

**Sources.** [MS](https://arxiv.org/pdf/1907.06043v2), §1.4, p.7; §2.12 and Lemma 2.5, pp.10–11; end of proof of Theorem 6.5, p.38: Central-character extraction is exact by injectivity, and the final character reduction is removed by Nakayama.

**Acceptance.** A central quotient with l-torsion is allowed; the proof does not divide by its order. This statement concerns the localized arithmetic modules, not arbitrary A[Γ_K]-modules. For A=k[x,y]/(x,y)², the socle of A has dimension two, so A is not self-injective. Its k-dual is an injective cogenerator. Replacing the coefficient Pontryagin dual by A would invalidate the general finite-algebra statement.

### 18. Auxiliary-prime integral types

Target `HilbertModularVarietiesAndShimuraCurves:R18.4/auxiliary-prime-integral-types` (construction).

Let G_q=GL₂(k_q), B_q its upper Borel, q≡1 mod l, l>2 and O as in the local-model node. The permutation representation Ind_(B_q)^(G_q)1 splits over O as 1⊕St_O, where St_O is the sum-zero complement (q+1 is a unit). Choose a tame character χ:k_q×→O[ζ]× of exact order l. The characteristic-zero type σ_ps=Ind(χ⊗χ⁻¹) has an E-model by its Schur-index/descent result and an O-lattice with residual nonsplit sequence 0→1_k→σ_ps,k→St_k→0. Fix this orientation of the lattice; the reverse extension is not interchangeable. Inflate all types through GL₂(O_q)→G_q.

**Hypotheses.** The chosen E is the fraction field of W(k)[ζ+ζ⁻¹]; scalar extension to E(ζ) defines the inducing characters. Prescribed central character is unramified at q, so its restriction to GL₂(O_q) matches the types.

**Uses.** `HilbertModularVarietiesAndShimuraCurves:R18.4/quaternionic-ihara-patching-functor`: Exactness sends the lattice sequence to the three patched types. `HilbertModularVarietiesAndShimuraCurves:R18.4/patched-type-flatness`: The principal-series regular model supplies flatness of the residual Steinberg type.

**API.**

- `R18Cohomology.type_iwahori_split` (compatibility): Ind_B^G 1=1⊕St_O with its constant and sum-zero inclusions.
- `R18Cohomology.type_ps_reduction` (compatibility): The specified lattice gives the exact nonsplit 0→1_k→σ_ps,k→St_k→0.
- `R18Cohomology.type_inflate` (compatibility): Inflation has trivial principal-congruence action and the prescribed unramified central restriction.
- `R18Cohomology.type_homothety` (compatibility): Changing the selected lattice by homothety gives an isomorphic integral type and the same extension orientation.
- `R18Cohomology.type_iwahori_constructor` (constructor): Realize Ind_B^G 1 as O-valued functions on P¹(k_q), constants as the trivial summand and St_O as the kernel of the coordinate sum.
- `R18Cohomology.type_iwahori_mean` (projection): Since q+1∈O×, the mean (q+1)⁻¹Σ_x f(x) is a G-equivariant retraction onto constants; its complement projects onto St_O. Both projections are idempotent and sum to the identity.
- `R18Cohomology.type_ps_socle` (characterisation): The selected stable lattice in the E-model of σ_ps is characterized up to homothety by residual trivial socle; its quotient is St_k and the extension is nonsplit.

**Definition checks.**

- `R18Cohomology.type_q11_l5` (computation): For q=11,l=5 the dimensions are 1,11,12 and 12 is a unit in O.
- `R18Cohomology.type_ps_not_split` (non-example): The residual principal-series lattice has trivial socle and a nonsplit Steinberg quotient; replacing it by 1⊕St fails.
- `R18Cohomology.type_l2_excluded` (non-example): For l=2 and q odd, q+1 is not a unit; the splitting step is unavailable.

**Construction or proof.**

1. Construct the permutation representation on P¹(k_q); average only its q+1 basis coordinates, which is permissible since q+1 is a unit.
2. Descend the self-inverse principal-series type from E(ζ) by its finite-group Schur-index theorem. Choose a lattice whose socle is 1_k using the specified nonsplit-extension lattice theorem. These two finite representation-theory proofs are a precise SR.3 Part II request.
3. Reduce the chosen lattice; the order-l characters become trivial but the lattice reduction is the nonsplit extension, rather than a semisimple direct sum.

**Dependencies.** `HilbertModularVarietiesAndShimuraCurves:R18.4/ihara-local-deformation-models`, `SmoothRepresentationsOfLocalGroups:SR.3`.

**Sources.** [MS](https://arxiv.org/pdf/1907.06043v2), §3.5, equation (2), p.17: The principal-series lattice has a residual extension with trivial submodule and Steinberg quotient; the permutation representation splits integrally. [EGS](https://arxiv.org/pdf/1305.1594v3), Lemma 4.1.1 and proof, p.16: An irreducible residually multiplicity-free representation has a unique lattice up to homothety with a prescribed simple socle or cosocle.

**Acceptance.** dim St=q and dim σ_ps=q+1; orientation of the residual extension is part of the construction.

### 19. Supersingular cohomology filtration

Target `HilbertModularVarietiesAndShimuraCurves:R18.4/supersingular-cohomology-filtration` (theorem).

At the auxiliary q, the smooth proper hyperspecial integral model and regular Iwahori model have special fibre consisting of two copies of the hyperspecial curve meeting transversely at supersingular points. The supersingular set is Hecke-equivariantly identified with the definite quaternionic double-coset set for the inner form ramified at the original discriminant together with q and the split real place. After non-Eisenstein localization, H¹(X_(K_0(q)),k) has a functorial Hecke-module filtration with graded pieces N, M⊕M, N, where M=H¹(X_K,k) and N=H⁰(Y_(K^q),k). The ψ-parts and dual homology filtration remain exact. This statement forgets Galois action; no unstated Tate twists are assigned to the graded pieces.

**Hypotheses.** q∤l and outside level/discriminant; sufficiently small level and good integral models. The auxiliary residual unipotent Frobenius and non-Eisenstein ideal satisfy the hypotheses of the specialization filtration.

**Construction or proof.**

1. Specialize the accepted regular-model tower at the new split q. The two components and finite étale/supersingular correspondence are MS Theorems 2.6 and 2.10. Identify the definite supersingular function module using the general-field R18.3 Part II contract; the restricted KW coefficient specialisation is insufficient.
2. Use the normalization and vanishing-cycle exact sequences and the degree-zero/degree-two vanishings to identify the remaining degree-one filtration. The proper curve specialization and nodal vanishing-cycle sequence are imported from LPV.7:semistable-curves.
3. Use central-character-exactness and finite-dimensional duality to transfer the filtration to the actual homological modules with transition and degeneracy maps.

**Dependencies.** `HilbertModularVarietiesAndShimuraCurves:R18.2/regular-model-tower`, `HilbertModularVarietiesAndShimuraCurves:R18.2/carayol-split-model`, `HilbertModularVarietiesAndShimuraCurves:R18.4/auxiliary-unipotent-prime`, `HilbertModularVarietiesAndShimuraCurves:R18.4/residual-eisenstein-vanishing`, `HilbertModularVarietiesAndShimuraCurves:R18.4/central-character-exactness`, `HilbertModularVarietiesAndShimuraCurves:R18.3`, `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/normalization-etale-resolution`, `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/curve-specialization-sequence`, `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/curve-normalization-cohomology`.

**Sources.** [MS](https://arxiv.org/pdf/1907.06043v2), Theorems 2.6, 2.10 and 2.11, pp.11–13: Good and Iwahori models, supersingular identification and the N,M²,N filtration supply the geometric transfer.

**Acceptance.** The definite inner form exchanges two places, maintaining the parity of the quaternion ramification set. The filtration is a Hecke-module assertion, not an identification of the two copies of N as Galois representations.

### 20. Quaternionic Ihara patching functor

Target `HilbertModularVarietiesAndShimuraCurves:R18.4/quaternionic-ihara-patching-functor` (construction).

Build the ordinary finite-level type functor σ↦M_∞(σ) from the full localized H¹ dual at auxiliary Taylor–Wiles levels, and the definite functor N_∞. At Q_n use Δ_n, the product of maximal l-power residue-field multiplicative quotients, and chosen U_v eigenvalues. The finite-level homology modules are finite free over O[Δ_n], with augmentation identifying them with the base-level modules. Frame with j variables and patch over S_∞ to R_∞. M_∞ is exact on finite σ, has the prescribed augmentation M_∞(σ)⊗_(S_∞)O=M_0(σ), and is maximal Cohen–Macaulay on its local-type ring for free σ, and modulo π for residual σ. Patch the N,M²,N filtration compatibly. The full two-dimensional cohomological Galois multiplicity is retained; the functor is not a multiplicity-one module. For a finite torsion type σ, its dual means Hom_O(σ,E/O). For a free integral type use the compatible finite σ/λⁿ systems and inverse limit to obtain an O-free homology dual, not Hom_O(H¹(O),E/O) treated as O-free.

**Hypotheses.** Use the Taylor–Wiles datum, early Galois–Hecke action, local type support and exact central-character parts at every level. The generic patching theorem must expose cofinal ideals I_n=((1+y_i)^(l^(e_ni))−1), e_ni≥n, matched dimensions and maximal Cohen–Macaulay quotients in each exact patched sequence. The residual filtration is patched only under the exactness hypotheses of MS Lemma 4.7; arbitrary inverse-limit patching is not asserted exact.

**Uses.** `HilbertModularVarietiesAndShimuraCurves:R18.4/patched-type-flatness`: Compare the regular principal-series type with the nodal Steinberg type. `HilbertModularVarietiesAndShimuraCurves:R18.4/patched-degeneracy-surjectivity`: Lift definite Ihara through the patched geometric filtration.

**API.**

- `R18Cohomology.patch_augmentation` (compatibility): M_∞(σ)⊗_(S_∞)O≅M_0(σ), naturally in σ and level.
- `R18Cohomology.patch_type_exact` (compatibility): Finite type exact sequences give exact patched sequences under the MCM quotient criterion.
- `R18Cohomology.patch_type_support` (compatibility): 1, St, σ_ps and definite N have respectively nr, unip, ps and N support.
- `R18Cohomology.patch_filtration` (compatibility): The patched q-Iwahori module has graded pieces N_∞, M_∞², N_∞ and agrees with M_∞⊕M_∞(St) by the Iwahori splitting.
- `R18Cohomology.patch_type_map` (functoriality): For a single fixed compatible patching datum and ultrafilter, maps of finite types induce R∞-linear maps of patched modules; identities and composites agree, naturally with augmentation and level maps.
- `R18Cohomology.patch_integral_type` (constructor): For a free O-type, construct its patched module from the compatible finite σ/πⁿ systems and inverse limit. Reduction to each σ/πⁿ agrees under the stated cofinal/freeness hypotheses; a torsion Pontryagin dual is not declared O-free.
- `R18Cohomology.patch_type_exact_criterion` (characterisation): Exactness is asserted for the admissible systems of MS Lemma 4.7, not every inverse system; multiplication by πⁿ can become zero after patching despite each finite-level map being injective.

**Definition checks.**

- `R18Cohomology.patch_zero` (degenerate): The zero type produces zero, which is handled separately from nonzero MCM support claims.
- `R18Cohomology.patch_full_multiplicity` (non-example): The augmentation returns full H¹ dual, including its rank-two Galois factor; replacing it by a rank-one multiplicity space fails.
- `R18Cohomology.patch_nonsplit_type` (compatibility): The type lattice sequence gives 0→M_∞(1)→M_∞(σ_ps,k)→M_∞(St_k)→0 with the declared orientation.

**Construction or proof.**

1. Form the fine levels as kernels of the residue-field quotient at Q_n; localize U_v at the chosen residual eigenvalues and prove the O[Δ_n] freeness and augmentation isomorphisms from the finite-level cover action and non-Eisenstein concentration.
2. Adjoin frame variables and apply the requested MS weak-patching contract from R03.5. Keep its noetherian, cofinal-ideal and uniform-generator hypotheses, finite-level freeness and numerical equality. No domain hypothesis is imposed on the reducible local tensor product; the existing domain Kisin criterion is not used as if it covered this case.
3. For a finite type σ use the arithmetic local coefficient sheaf of σ∨ in cohomology, dualize and patch; pass compatibly through σ/πⁿ for integral free types.
4. Patch the filtration using MCM residual graded quotients; use the early local type theorem to factor each action through R_nr, R_unip, R_ps or R_N.

**Dependencies.** `HilbertModularVarietiesAndShimuraCurves:R18.4/taylor-wiles-prime-datum`, `HilbertModularVarietiesAndShimuraCurves:R18.4/early-quaternionic-galois-hecke-support`, `HilbertModularVarietiesAndShimuraCurves:R18.4/central-character-exactness`, `HilbertModularVarietiesAndShimuraCurves:R18.4/quaternionic-local-types-and-support`, `HilbertModularVarietiesAndShimuraCurves:R18.4/auxiliary-prime-integral-types`, `HilbertModularVarietiesAndShimuraCurves:R18.4/supersingular-cohomology-filtration`, `DeformationAndDerivedPatchingAlgebra:R03.5`.

**Sources.** [MS](https://arxiv.org/pdf/1907.06043v2), Lemma 4.7, p.21; Propositions 4.14 and 4.16, pp.26–27; Theorems 4.17 and 4.19, pp.28–29; Propositions 4.20–4.21, p.30: The finite-level systems patch with exactness, augmentation, MCM and local support under these hypotheses.

**Acceptance.** All specialization maps recover the full finite-level homology modules and commute with the w-degeneracy traces.

### 21. Patched Steinberg branch flatness

Target `HilbertModularVarietiesAndShimuraCurves:R18.4/patched-type-flatness` (theorem).

With the preceding finite-level patching datum, M_∞(1) is flat over R_nr, N_∞ is flat over R_N and M_∞(σ_ps,O) is flat over the regular R_ps. Residually M_∞(St_k) is flat over B=k[[X,Y]]/(XY) (with the retained formal smooth parameters), M_∞(St_k)/X≅M_∞(1_k), and there is an exact sequence 0→N_∞→M_∞(St_k)/Y→N_∞→0. All identifications are R_∞-linear and commute with the w-degeneracy maps.

**Hypotheses.** The local rings are precisely the minimal-ramification models above, and the nonzero modules have the stated MCM dimension equality. The type sequence and N,M²,N filtration are exact and compatible; zero modules are treated as flat separately.

**Construction or proof.**

1. Apply the requested MS Lemma 5.1 regular-base miracle flatness to R_nr,R_N,R_ps: A→R is local noetherian, A regular, M finite MCM over R and dim R=dim A+dim(R/m_A R). Verify these dimensions in the actual patched local tensor product, and treat M=0 separately.
2. Use the requested MS Lemma 5.2 algebra: over A=k[[X,Y]]/(X²Y), an exact 0→L→M→N→0 with M A-flat, XL=0, XYN=0 yields N=M/(XY)M flat over B and N/XN≅L. For Proposition 6.11 use the residual ps patched ambient ring, on which M(σ_ps) acts, before passing to the unipotent quotient.
3. Apply the requested Lemma 5.3 algebra to M=M_∞(St_k), L=M/XM, the Iwahori decomposition P=L⊕M and its N,L²,N filtration. Its hypotheses include N flat over B/(Y). Obtain the stated exact sequence modulo Y. For Proposition 6.12 use the residual unipotent patched ambient ring; the ps ring does not carry the coordinate-preserving B-algebra structure. This corrects the two swapped ambient rings printed on p.38.

**Dependencies.** `HilbertModularVarietiesAndShimuraCurves:R18.4/quaternionic-ihara-patching-functor`, `HilbertModularVarietiesAndShimuraCurves:R18.4/ihara-local-deformation-models`, `DeformationAndDerivedPatchingAlgebra:R03.3`.

**Sources.** [MS](https://arxiv.org/pdf/1907.06043v2), Lemmas 5.1–5.3, pp.31–33; Propositions 6.10–6.12, pp.37–38: Regular-base flatness and the two nodal transfer lemmas yield the Steinberg branch identities.

**Acceptance.** Replacing X²Y by XY before applying the first lemma invalidates its kernel calculation. All smooth framing factors survive; the fixed-determinant q-local core has four variables.

### 22. Patched degeneracy surjectivity

Target `HilbertModularVarietiesAndShimuraCurves:R18.4/patched-degeneracy-surjectivity` (theorem).

For constant residual coefficients and the large-image datum, the homological trace map M_∞,K_0(w)(St_k)→M_∞,K(St_k)² is surjective. Specializing by X and then the S_∞ augmentation gives the surjective finite-level trace H₁(X_(K_0(w)),k)_m→H₁(X_K,k)_m², first on the chosen central character and then on the whole localized module.

**Hypotheses.** The patched-type-flatness exact sequences are constructed at K and K_0(w) compatibly. The target source levels at w are small and hyperspecial/Iwahori, and definite Ihara is available from R18.3.

**Construction or proof.**

1. Form the commuting two-row short exact diagram modulo Y with outer terms N_∞ and N_∞². Use the requested general-field definite Ihara theorem, MS Theorem 6.8, to make the two outer trace maps surjective after augmentation; the existing restricted KW definite-degeneracy node alone does not cover this F.
2. The finite patched cokernels vanish by Nakayama; the short exact diagram then makes the middle map modulo Y surjective. Apply Nakayama again with Y in the maximal ideal to get the full Steinberg map surjective.
3. Tensor with the unramified branch X=0, using patched-type-flatness, then specialize S_∞ to k. Remove the central character quotient by the finite central-algebra Nakayama argument.

**Dependencies.** `HilbertModularVarietiesAndShimuraCurves:R18.4/patched-type-flatness`, `HilbertModularVarietiesAndShimuraCurves:R18.3`, `HilbertModularVarietiesAndShimuraCurves:R18.4/central-character-exactness`, `HilbertModularVarietiesAndShimuraCurves:R18.4/cohomological-degeneracy`.

**Sources.** [MS](https://arxiv.org/pdf/1907.06043v2), Proof of Theorem 6.5, p.38: A compatible exact diagram transfers definite trace surjectivity to the curve through the two branch specializations.

**Acceptance.** Use surjectivity of finite cokernels and Nakayama; no exactness of tensoring an arbitrary short exact sequence is assumed. The proof never uses an R=T theorem or R22 patching outcome.

### 23. Large-image residual Ihara lemma

Target `HilbertModularVarietiesAndShimuraCurves:R18.4/residual-ihara-large-image` (theorem).

Let l>2, D/F a quaternion division algebra split at exactly one real place, K sufficiently small and hyperspecial at a split finite place w, and Λ a finite k-representation of K^w trivial on the rational central stabilizers. Let m be non-Eisenstein with absolutely irreducible ρ̄_m. Assume l divides |ρ̄_m(G_F)|. If l=5 and proj ρ̄_m(G_F)≅PGL₂(F₅), assume ker proj ρ̄_m is not contained in G_F(ζ₅). Then δ:H¹_et(X_K,L_Λ)_m²→H¹_et(X_(K_0(w)),L_Λ)_m is injective. The exceptional condition is automatic if √5∉F. The theorem allows w|l only when the coefficient action is away from w. It makes no assertion for l=2 or the exceptional small images.

**Hypotheses.** All coefficient and effective smallness hypotheses above; the same away Hecke ideal is used at both levels.

**Construction or proof.**

1. Choose the auxiliary unipotent q and the minimal coefficient ring. Construct the Taylor–Wiles systems and their local-type patching functor without modularity lifting.
2. Apply patched-degeneracy-surjectivity and finite-dimensional duality to get constant residual cohomological injectivity.
3. Use coefficient-descent-for-ihara to extend to Λ; descend or extend the finite coefficient field by faithful flatness.

**Dependencies.** `HilbertModularVarietiesAndShimuraCurves:R18.4/auxiliary-unipotent-prime`, `HilbertModularVarietiesAndShimuraCurves:R18.4/patched-degeneracy-surjectivity`, `HilbertModularVarietiesAndShimuraCurves:R18.4/coefficient-descent-for-ihara`.

**Sources.** [MS](https://arxiv.org/pdf/1907.06043v2), Theorem 6.5 and Remarks 6.6–6.7, p.34; proof, p.38: The residual Ihara result has the large-image and l=5 Taylor–Wiles hypotheses, and is proved for arbitrary finite coefficients away from w.

**Acceptance.** The statement does not replace the large-image condition by absolute irreducibility alone. The local coefficient factorization at w must be checked even when w lies over l. Proof closure requires the two explicitly recorded p-adic source inputs and the exact lower-tier requested contracts; these are proof leaves, not additional image hypotheses.

### 24. Integral Ihara saturation

Target `HilbertModularVarietiesAndShimuraCurves:R18.4/integral-ihara-saturation` (theorem).

Under residual-ihara-large-image, let L_O be a finite free O-lattice system with reduction Λ and coefficient action away from w. Then δ:H¹_et(X_K,L_O)_m²→H¹_et(X_(K_0(w)),L_O)_m is injective and its image is saturated; the cokernel is finite free over O. A finite extension of coefficient DVRs preserves injectivity, saturation and a finite-free cokernel. After reduction to O/λⁿ the map is a split injection with finite-free cokernel over O/λⁿ; no λ-torsion-freeness of this Artinian cokernel is asserted. This is an integral consequence of the residual theorem and the established control isomorphisms; it is independent of Δ being a unit.

**Hypotheses.** The localized source and target have the finite-free and reduction statements of non-eisenstein-integral-control. All image, smallness and coefficient hypotheses of the residual theorem hold.

**Construction or proof.**

1. Identify reduction of the integral degeneracy map with the residual map by functorial cohomology control.
2. Apply residual-ihara-large-image and residual-injectivity-saturation to obtain injectivity and finite-free cokernel.
3. Tensor the resulting split short exact sequence of finite-free DVR modules to any coefficient extension or O/λⁿ.

**Dependencies.** `HilbertModularVarietiesAndShimuraCurves:R18.4/non-eisenstein-integral-control`, `HilbertModularVarietiesAndShimuraCurves:R18.4/residual-ihara-large-image`, `HilbertModularVarietiesAndShimuraCurves:R18.4/residual-injectivity-saturation`, `HilbertModularVarietiesAndShimuraCurves:R18.4/cohomological-degeneracy`.

**Sources.** [MS](https://arxiv.org/pdf/1907.06043v2), Theorem 6.5, p.34, with §2.10 and Lemma 6.4, pp.10,34: Residual injectivity and local coefficient control are the inputs; saturation is derived here by the stated DVR criterion.

**Acceptance.** A level-raising ideal with Δ≡0 is still allowed by Ihara. The result is not asserted for arbitrary integral weights that act nontrivially at w. For the inclusion O→O², x↦(x,0), the reduced cokernel is O/λⁿ. It is free over O/λⁿ but has nonzero λ-torsion, so DVR saturation cannot be asserted after Artinian reduction.

### 25. Early quaternionic Jacquet–Langlands bridge

Target `HilbertModularVarietiesAndShimuraCurves:R18.4/quaternionic-jacquet-langlands-bridge` (theorem).

For quaternion inner forms of GL₂ over F, the non-character discrete automorphic spectrum transfers, with multiplicity one, to the cuspidal GL₂ spectrum whose components at every ramified place are discrete series. Away from ramification the local factors and unnormalized Hecke eigenvalues agree; at ramified places use local Jacquet–Langlands. In particular, exchanging the unique split real place τ and a split finite place q changes an indefinite algebra to a definite one, and the common characteristic-zero eigensystems are exactly those for which π_q is discrete series. With an actual common field E of definition, compare the corresponding multiplicity spaces, not all H¹ with all H⁰ and not integral lattices. For the same spherical Hecke algebra away from q and the other bad places, the q-definite Hecke image is consequently a quotient of the q-Iwahori indefinite characteristic-zero Hecke image; finite torsion-free integral images inherit the kernel inclusion.

**Hypotheses.** F a number field, fixed compatible central character and the indicated quaternion inner forms. Exclude characters of D× and the corresponding noncuspidal discrete GL₂ representations; use actual rational models, not a chosen embedding C alone.

**Construction or proof.**

1. Use AF.3’s discrete cuspidal spectrum and the local discrete-series character correspondence. The required quaternion trace comparison is requested from AS.6, with matching orbital integrals at the ramified places.
2. Apply BR Theorem 18.1 to obtain the global transfer, multiplicity one and common unramified factors. For GL₂ the only noncuspidal discrete alternatives are the excluded character transfers.
3. At τ and q impose the two local compatibilities. Use the general-field constant-coefficient definite realization requested from R18.3, the indefinite cohomology realization, and the actual common E-model input from AF.4 to compare E-multiplicity spaces. AF.4 supplies rationality under its stated cohomological hypotheses, not an unconditional integral comparison.
4. For the kernel inclusion used in patching, tensor both finite torsion-free integral modules with E, obtain the inclusion by the common eigensystems, then descend the zero action by torsion-freeness.

**Dependencies.** `AutomorphicFormsOnReductiveGroups:AF.3`, `AutomorphicFormsOnReductiveGroups:AF.4`, `AutomorphicSpectralTheory:AS.6`, `HilbertModularVarietiesAndShimuraCurves:R18.3`, `HilbertModularVarietiesAndShimuraCurves:R18.4/finite-cohomology`.

**Sources.** [BR](https://imag.umontpellier.fr/~ioan-badulescu/Files/br_jl.pdf), §1.5, pp.5–6; Theorem 18.1 and proof, pp.44–45: The global inner-form correspondence identifies the compatible discrete spectra and proves multiplicity one through trace comparison. [MS](https://arxiv.org/pdf/1907.06043v2), Lemma 4.12 and proof, pp.24–25: The definite Hecke action factors through the indefinite action at q-Iwahori level by Jacquet–Langlands and integral torsion-freeness.

**Acceptance.** A π_q principal series is excluded from the q-ramified definite side. A rank-two Galois factor in H¹ prevents an unqualified H⁰≅H¹ statement.

### 26. Saito quaternionic coefficient projector

Target `HilbertModularVarietiesAndShimuraCurves:R18.4/quaternionic-saito-projector` (construction).

Let g=[F:Q], k=(k_i,w) with k_i≥2, all k_i≡w mod 2 and w≥max_i k_i. Use Saito’s actual CM/PEL bridge M×N→M″ and CM elliptic family A₀→N₀, not an elliptic family on M. After a splitting coefficient field L, the PEL endomorphism algebra is a product of two M₂(L) factors at each i; select the indicated second/conjugate factor and a rank-one matrix idempotent e_i. Its action on R¹a_*L_λ has rank two. Degree-one, Young/symmetric/determinant and CM projectors produce X=α*A^{g(w−2)}×β*A₀^{a}, a=(g−1)(w−2), and an L-linear algebraic correspondence e. Write q₀=(2g−1)(w−2). The only nonzero projected R^j c_* is j=q₀, with eR^q₀c_*=pr₁*F(k)⊗β*F(χ₀)^a. Here F(χ₀), after forgetting the torus action, has Tate type L_λ(−1). Leray yields eH^j(X_Ē,L_λ)≅H^{j−q₀}(M_F̄,F(k))⊗H⁰(N_Ē,F(χ₀)^a), G_E- and Hecke-equivariantly. Selecting an actual CM eigensummand L_λ(−a) identifies the selected degree-(q₀+1) factor with H¹(M,F(k))(−a).

**Hypotheses.** Small compatible levels and stable lattices admit the stated PEL and CM abelian schemes and maps α,β; the effective descent is part of the accepted coefficient system. All determinant exponents (w−k_i)/2 are nonnegative; rational idempotents have denominators, so exclude their support for an integral action. For the good-model comparison require Saito Lemma 4: p splits in the chosen imaginary quadratic E₀, the quaternion algebra is split at the distinguished p-place, K″ has the stated hyperspecial p-component, and compatible level changes retain the p-components (hence induce prime-to-p isogenies). The actual PEL and CM abelian schemes and correspondences extend under these hypotheses; λ∤p. For the invoked semistable-model form of Saito Lemma 4, choose a further sufficiently small level with every geometric curve component of genus greater than one; at a good smooth model the same correspondence extension applies directly.

**Uses.** `HilbertModularVarietiesAndShimuraCurves:R18.4/quaternionic-coefficient-purity`: Subtract the CM Tate correction from the smooth proper weight. `WeightsInEtaleCohomology:R34.5/kuga-sato-projector-weight-comparison`: Supply the quaternionic geometric projector previously assumed by the weights stage.

**API.**

- `R18Cohomology.saito_rank_two` (compatibility): Each selected e_iR¹ has rank two, and its symmetric/determinant projector has the advertised representation.
- `R18Cohomology.saito_unique_row` (compatibility): eR^j c_*=0 for j≠q₀ and the j=q₀ row is F(k) tensored with the stated CM correction.
- `R18Cohomology.saito_cohomology` (compatibility): The Leray comparison is G_E- and Hecke-equivariant in all degrees.
- `R18Cohomology.saito_good_model` (compatibility): Under the split-p, hyperspecial PEL and fixed-p-level hypotheses of Lemma 4, extend the actual abelian schemes and prime-to-p correspondences, compatibly with good-fibre specialization; exclude projector denominators for integral actions.
- `R18Cohomology.saito_constructor` (constructor): From the actual α,β bridge, PEL powers, CM powers, chosen matrix idempotents and Young projectors, construct the rational algebraic correspondence e on X. The polynomial in multiplication-by-n isolates R¹, with n prime to p at a good model.
- `R18Cohomology.saito_idempotent` (relation): The chosen rational correspondences satisfy e∘e=e and commute with the indicated endomorphism, Galois and Hecke actions; hence they define a direct summand in rational cohomology.
- `R18Cohomology.saito_tame_levels` (functoriality): Compatible level maps with unchanged p-components give prime-to-p isogenies of the PEL/CM families, intertwine the projectors and satisfy identity/composition compatibility on their cohomological summands.

**Definition checks.**

- `R18Cohomology.saito_weight_two` (degenerate): For w=k_i=2, q₀=a=0 and the degree-one comparison returns constant weight-two curve cohomology.
- `R18Cohomology.saito_g2_w4` (computation): For g=2,w=4, q₀=6 and a=2: the selected degree is seven and the cohomology factor is H¹(F(k))(−2).
- `R18Cohomology.saito_negative_determinant` (non-example): For k=(6,2),w=4 the exponent (w−6)/2 is negative; the direct tensor construction is excluded.
- `R18Cohomology.saito_no_integral_saturation` (non-example): An idempotent containing 1/λ does not define an integral projector on an O-lattice.

**Construction or proof.**

1. Use the accepted quaternion PEL instance and its actual endomorphism action. Split its algebra over L and apply the selected e_i to R¹, giving rank-two summands, not raw rank-4g cohomology.
2. Use multiplication-by-n to isolate degree one (n prime to p), then the Young projectors on g(w−2) copies to realize the required symmetric powers and determinant exponents.
3. Apply the CM bridge and the a elliptic CM factors. Their selected rank-one R¹ has Tate type (−1), so the total selected direct-image degree is q₀, not the coefficient-system weight.
4. Only one projected Leray row survives; Saito Lemma 3 gives the displayed comparison. Choose the actual CM eigensummand before extracting H¹(−a). Rational projection does not establish a saturated integral coefficient lattice.

**Dependencies.** `HilbertModularVarietiesAndShimuraCurves:R18.2/quaternion-pel-instance`, `HilbertModularVarietiesAndShimuraCurves:R18.4/quaternion-local-systems`, `PELModuli:M3`, `WeightsInEtaleCohomology:R34.1/purity-under-linear-algebra-operations`.

**Sources.** [Saito](https://arxiv.org/pdf/math/0612077v2), §§4–5, pp.18–24; §§6.1–6.3 and Lemma 3, pp.25–30; Lemma 4, pp.32–33: The coefficient projector uses higher-dimensional quaternionic PEL powers and a CM correction, with an explicit degree shift and good-model correspondence extension.

**Acceptance.** The raw PEL R¹, Morita summands and normalized F(k) are three distinct coefficient systems.

### 27. Quaternionic and inner-cohomology purity

Target `HilbertModularVarietiesAndShimuraCurves:R18.4/quaternionic-coefficient-purity` (theorem).

At a good proper model prime p, λ∤p, the rank-two Morita summands V_i of the genuine quaternionic PEL family are pure of geometric weight one. The raw tensor coefficient ⊗_i Sym^(n_i)V_i⊗det(V_i)^(d_i)(b) has weight r=Σ_i n_i+2Σ_i d_i−2b, hence H¹ on the proper curve has weight r+1. For Saito’s normalized F(k), the selected degree-(q₀+1) smooth proper cohomology is pure of weight q₀+1 and equals H¹(F(k))(−a); therefore H¹(F(k)) has weight q₀+1−2a=w−1, and its twist (b) has weight w−1−2b. The statement descends from G_E to G_F at places where the actual coefficient representation is unramified, by taking powers of Frobenius. For a smooth open Hilbert model and a lisse pure coefficient of weight r, its inner H_!^j=im(H_c^j→H^j) is pure of weight r+j. No whole-open-cohomology purity, bad-reduction purity or rational/integer Frobenius polynomial for an arbitrary L-projector factor is asserted.

**Hypotheses.** Good smooth proper spreading for the indicated abelian scheme, curve and total projector variety; coefficients and projectors extend at p. All algebraic and parity hypotheses of quaternionic-saito-projector; its CM eigensummand exists over the chosen coefficient field. For the open Hilbert clause the actual sheaf extends as lisse pure of weight r on the chosen smooth finite-field fibre. In the raw tensor formula n_i are nonnegative integers and d_i,b are integers; negative determinant exponents are inverse line powers over the rational coefficient field.

**Construction or proof.**

1. Import abelian Weil purity and the operations on pure representations to obtain the raw rank-two tensor weight; apply proper smooth direct-image/cohomology purity.
2. Use quaternionic-saito-projector and its good-model comparison. The selected smooth proper H^(q₀+1) has that weight; its CM factor has weight 2a. Subtract 2a and calculate (2g−1)(w−2)+1−2(g−1)(w−2)=w−1.
3. Use generic weights operations for the Tate twist. For descent compare Frob_u with Frob_v^f at an unramified place; the absolute values of the fth powers imply the same weight at v.
4. For the open Hilbert clause import DWP.7/cohomological-bounds-3-3-2-3-3-6, whose compact-support upper and ordinary-support lower bounds meet on the image.

**Dependencies.** `HilbertModularVarietiesAndShimuraCurves:R18.4/quaternionic-saito-projector`, `HilbertModularVarietiesAndShimuraCurves:R18.4/hilbert-etale-betti-adapter`, `DeligneWeightsAndPurity:DWP.1/weil-estimate-for-abelian-varieties`, `DeligneWeightsAndPurity:DWP.4/smooth-projective-purity`, `DeligneWeightsAndPurity:DWP.7/cohomological-bounds-3-3-2-3-3-6`, `WeightsInEtaleCohomology:R34.1/purity-under-linear-algebra-operations`, `WeightsInEtaleCohomology:R34.2/purity-of-tate-modules-with-good-reduction`.

**Sources.** [Saito](https://arxiv.org/pdf/math/0612077v2), Lemma 3, p.30, and Lemma 4, pp.32–33: The projector realizes normalized coefficients with the CM twist on a good total-space model. [Deligne](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), Corollaries 3.3.4–3.3.6, printed p.206: The two support bounds imply pure inner cohomology; proper smooth purity is their proper specialization.

**Acceptance.** For g=2,w=4 the coefficient H¹ weight is three, not seven. Raw coefficients and normalized F(k) must not be assigned the same weight merely because they use the same abelian family.

## Worked acceptance cases

For the compact curve, choose a non-Eisenstein maximal ideal and a coefficient lattice that descends at both levels. Residual degree-zero and degree-two vanishings give finite-free source and target, including the reduction isomorphisms. Residual Ihara then gives a finite-free cokernel, hence every reduction modulo λⁿ is a split injection with a finite-free O/λⁿ cokernel. For x↦(x,0) from O to O², that reduced cokernel is O/λⁿ: it has λ-torsion even though it is free over the reduced coefficient ring. This route requires the large-image conditions and the fulfilled source/supplier inputs. It also works at a level-raising ideal where Δ vanishes modulo λ. Conversely multiplication by λ on a free rank-one lattice is rationally injective with torsion cokernel; it must fail the residual test.

For a good split place, take q=2,T=3,S=2 over Q. The Gram matrix is [[3,3/2],[3,3]]; the two central-normalized off-diagonal entries differ. With S=1 its vector (1,−1) lies in the kernel, demonstrating why the unit-discriminant criterion is a sufficient splitting condition and gives no general replacement for Ihara. The generic PGL₂ degeneracy target specializes S to one; this GL₂ calculation retains it.

For the coefficient projector, g=2,w=4 gives a=2 and q₀=6. Smooth proper degree-seven cohomology has weight seven and realizes H¹(F(k))(−2). The CM factor contributes four to the weight, so H¹(F(k)) has weight three. Reading degree seven as the coefficient-cohomology weight would fail this test. For w=2 all tensor powers and the CM correction disappear, yielding ordinary weight-one H¹ of the curve. For k=(6,2),w=4 the direct symmetric/determinant projector is excluded by its negative exponent.

For an open smooth Hilbert model, the two Deligne bounds meet on im(H_c^j→H^j). They do not assign weight r+j to every boundary class in H^j. Carry the support comparison and actual image through the Betti/étale adapter; do not replace the image by a new cohomology carrier with the desired property postulated.

## Supplier contracts and proof leaves

- `PadicHodgeTheory:R06.2`: Period-functor characterization of potential semistability over a specified finite extension, parallel weight-{0,1} convention and coefficient change. This imports admissibility only, not the construction or dimension theorem for a deformation quotient. Needed by `ihara-local-deformation-models`.

- `SelmerIwasawaCohomology:L2`: Part II: the adjoint Selmer/dual-Selmer Taylor–Wiles selection theorem over a totally real F under MS Lemma 4.10’s two image hypotheses; chosen distinct eigenvalues at r primes with Nv≡1 mod lⁿ, and the tangent/obstruction dimension calculation producing g and dim R_loc=r+j−g+1. Existing rational Selmer kernels alone do not supply this arithmetic selection. Needed by `taylor-wiles-prime-datum`.

- `SmoothRepresentationsOfLocalGroups:SR.3`: Part II: the finite GL₂(k_q) order-l principal-series E-model/Schur-index descent and two residual factors 1,St when q≡1 mod l; the stable lattice with trivial socle from EGS Lemma 4.1.1, and the characteristic-zero local type/Weil–Deligne computations of MS Proposition 3.10. Include the nonsplit extension orientation and inflation, without citing a downstream local Langlands roadmap. Needed by `auxiliary-prime-integral-types`, `quaternionic-local-types-and-support`.

- `DeformationAndDerivedPatchingAlgebra:R03.5`: Part II: MS Definition 4.1 and Propositions 4.2–4.6, pp.19–21, for weak patching algebras/modules over local noetherian coefficient rings without a domain assumption; fixed ultrafilter/cofinal ideals, uniform finite generation, finite-level free S∞/I_n modules, augmentation and matched dimensions giving MCM. Include Lemma 4.7 exactness (MCM quotient, or residual systems with MCM residual quotient), Corollary 4.8 filtrations and Theorem 4.19 type functor/integral inverse limits. The existing Kisin patching datum requires a domain base and cannot be applied unchanged to R_unip or the reducible local tensor product. Needed by `quaternionic-ihara-patching-functor`.

- `DeformationAndDerivedPatchingAlgebra:R03.3`: Part II: MS Lemma 5.1 regular-base miracle flatness for local noetherian A→R, A regular, M finite MCM over R and dim R=dim A+dim(R/m_A R), with zero modules separate. Then Lemmas 5.2–5.3 under the exact hypotheses in patched-type-flatness: the X²Y→XY transfer, followed by the N,L²,N filtration on L⊕M, with M B-flat, L=M/XM and N flat over B/(Y); complete local noetherian R in the second lemma and all commuting R-actions retained. The source is MS pp.31–33. Do not cite an unreviewed old miracle-flatness node as an accepted contract. Needed by `patched-type-flatness`.

- `AutomorphicSpectralTheory:AS.6`: Part II: quaternion-inner-form matching of trace distributions in the GL₂ discrete spectrum used by BR Theorem 18.1, including ramified discrete-series local character matching and the exclusion of character transfers. The generic invariant trace identity without this comparison is insufficient. Needed by `quaternionic-jacquet-langlands-bridge`.

- `AutomorphicFormsOnReductiveGroups:AF.3`: The existing AF.3 discrete cuspidal spectrum and finite-multiplicity contract, including the unitary central normalization used by the quaternionic inner-form correspondence. Its packet currently has needs_changes review status; discharge that supplier review before proof closure. Needed by `quaternionic-jacquet-langlands-bridge`, `early-quaternionic-galois-hecke-support`.

- `AutomorphicFormsOnReductiveGroups:AF.4`: The AF.4 algebraic coefficient/rational-model contract under its stated cohomological hypotheses, specialized to the compact quaternionic eigenspaces used here, with an actual common E-model after finite coefficient enlargement. AF.4 is a supplier plan awaiting correction, not an accepted library theorem; a common E-model remains an explicit input to the bridge. Neither a complex embedding nor complex eigensystem agreement gives an integral comparison. Needed by `quaternionic-jacquet-langlands-bridge`, `early-quaternionic-galois-hecke-support`.

- `PELModuli:M3`: The existing complex-points/abelian-family contract specialized to the quaternionic CM bridge of Saito §§4–6, with actual α,β maps and compatible small levels. This uses the accepted quaternionic PEL instance rather than proposing a generic PEL moduli theory. Needed by `quaternionic-saito-projector`.

- `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`: Import the existing twisted chain/cochain and cohomology construction. Current Tau Ceti already implements the Hom-variance carrier; only the arithmetic finite-free dual/bidual comparison is new here. Needed by `betti-coefficient-dual-adapter`.

- `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`: Import infinitude of every Frobenius conjugacy class outside any finite set from the existing Chebotarev roadmap, not another plan of the density theorem. Needed by `auxiliary-unipotent-prime`, `residual-eisenstein-vanishing`, `early-quaternionic-galois-hecke-support`.

- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`: Import the existing admissible narrow ray-class character/Galois character correspondence and prime-values contract. The existing Artin map is arithmetic; invert it for the declared geometric reciprocity. This is needed to globalize the two component characters in the Eisenstein-vanishing proof, not to plan class field theory again. Needed by `residual-eisenstein-vanishing`.

- `HilbertModularVarietiesAndShimuraCurves:R18.3`: Part II: the constant-coefficient definite quaternionic set, Hecke and effective central-quotient realization over any totally real F, and the residual definite Ihara theorem of MS Theorem 6.8 and its proof, pp.34–36. For l>2, sufficiently small K unramified at w and a non-Eisenstein maximal ideal, the two H⁰ degeneracy pullbacks are injective; dual trace maps are surjective. The proof must supply the SL₂-generation and reduced-norm strong-approximation Eisenstein alternative, compatible with central-character parts. The existing KW R18.3 nodes assume even [F:Q] and l unramified in F and therefore do not supply this general contract. No such restrictions are silently added to MS Theorem 6.5. Needed by `central-character-exactness`, `supersingular-cohomology-filtration`, `patched-degeneracy-surjectivity`, `quaternionic-jacquet-langlands-bridge`.

- `ArithmeticLocallySymmetricSpaces:ALS.5`: Specialize the existing de-rham-comparison and cuspidal spectral formula to compact quaternionic curves with constant weight-two coefficients: a Hecke-equivariant characteristic-zero H¹ decomposition into the cohomological discrete-series factors, with all connected components and compatible levels. Import AF.3 discreteness and AF.4 actual E-rational coefficient/multiplicity models; norm-character factors contribute no degree-one relative Lie algebra cohomology. This is the compact Matsushima specialization needed before integral determinant interpolation, not a higher-tier R17 transfer. Needed by `early-quaternionic-galois-hecke-support`.

- `PadicHodgeTheory:R06.3`: The Weil–Deligne functor of a potentially semistable representation, with finite-extension descent data, inertia/type comparison and coefficient change. Match the geometric reciprocity and fixed determinant θ in the MS K_v⁰ local condition. R06.2 semistable admissibility alone supplies no ramified WD descent. Needed by `ihara-local-deformation-models`.

The stage stays planned because the following source proof leaves are explicit.

- **Potentially semistable deformation quotient proof.** MS §3.2, p.14, states the fixed-determinant potentially semistable quotient and its dimension using Kisin, Potentially semi-stable deformation rings, JAMS 21 (2008), 513–546. The original proof was not obtained/read in this pass (publisher and author endpoints refused access). Read the original representability and component-dimension proof, match the determinant θ and HT convention, and attach its exact theorem locators before proof closure. This quotient remains a mathematical construction target, not a point-condition structure assumed to be a representing ring.

- **Finite-level p-adic local compatibility for the early Hecke action.** MS Lemma 4.11 and §3.6 invoke EGS §6 and the finite-level p-adic compatibility input to enter the l-adic local quotient. Carayol Theorem A only covers places prime to the coefficient characteristic. Trace this weight-two finite-level compatibility proof and its semistable extension for every K_v⁰ type; do not use R22 or an R=T conclusion. The packet supplies the exact desired factorization, but this original proof chain is not closed.

## Suggested Lean and carrier omission ledger

The [suggested file](../suggested/HilbertModularVarietiesAndShimuraCurves--R18.4.lean) has real-bodied component-function translation and spherical operators, the product-module Gram/adjugate/discriminant, their API statements and small examples. Its end signatures state unit-discriminant splitting, the DVR residual-injectivity criterion and the resulting left inverse of the integral injection. Tensoring that left inverse explains the Artinian reduction statement; no reduced torsion-free claim is encoded. For the base-change API the Lean signature exposes the discriminant scalar-specialization formula; the full module tensor base change of G and J stays in the reader API. The component-function model is the dual of the finite group-algebra model: pair f with the basis e_c by f(c). The declared translation acts by f(xc), adjoint to the declared right component permutation. The arithmetic identification of C_K is a reader target.

The arithmetic end statements whose carriers are absent from the pins remain here with their exact types; they are not encoded by proposition packages or unimplemented data constants.

| Targets | Missing carriers and exact statement location |
| --- | --- |
| component-hecke-action | The arithmetic reduced-norm quotient C_K, canonical component torsor and finite A[C_K] comparison, specified in target 1. Only its elementary dual function action is in Lean. |
| residual-eisenstein-vanishing; adjoint-localization-duality; non-eisenstein-integral-control; coefficient-descent-for-ihara | Actual algebraic H^i(X_K,L), localized factors, dual sheaves, finite-cover action and pairing. Targets 2–5 specify the vanished groups, dual ideal and integral reduction types. |
| betti-coefficient-dual-adapter; hilbert-etale-betti-adapter | The arithmetic dual local system and étale sheaf comparison, ordinary/compact derived O-adic support carriers, and their image. Targets 6–7 compare existing Betti work rather than introducing a generic theory. |
| geometric-gram-identity; integral-ihara-saturation | Geometric pullback and trace maps δ:M²→M_0 and δ†:M_0→M², with M=H¹(X_K,L_O)_m. The algebraic Gram and DVR end statements have pinned carriers; targets 9 and 24 supply their arithmetic instantiation. |
| auxiliary-unipotent-prime; ihara-local-deformation-models; taylor-wiles-prime-datum | Actual G_F,S representations, chosen primes/frames and the complete local representing rings with fixed θ. Targets 12–15 give the quotient functors, dimensions and compatibility conditions. |
| quaternionic-local-types-and-support; early-quaternionic-galois-hecke-support; central-character-exactness; auxiliary-prime-integral-types | Local types, actual localized Hecke/Galois actions, finite central quotient and type lattices. Targets 14,16–18 state their factorization and exactness, not an assumed action satisfying conclusions. |
| supersingular-cohomology-filtration; quaternionic-ihara-patching-functor; patched-type-flatness; patched-degeneracy-surjectivity; residual-ihara-large-image | Regular nodal models, definite function modules, genuine filtered H¹, completed tensor rings, finite-level group-algebra systems and the patched functor. Targets 19–23 provide the construction and proof contracts with their source/supplier leaves. |
| quaternionic-jacquet-langlands-bridge | Actual discrete automorphic representations, local transfer and common rational multiplicity models. Target 25 excludes character transfers and integral-lattice claims. |
| quaternionic-saito-projector; quaternionic-coefficient-purity | Actual quaternionic PEL and CM families, bridge maps, algebraic correspondences, projected higher direct images and Galois actions. Targets 26–27 give the degree/Tate correction and good-model conditions. |

## Sources and corrected conventions

- **MS**: Jeffrey Manning and Jack Shotton, [Ihara’s lemma for Shimura curves over totally real fields via patching](https://arxiv.org/pdf/1907.06043v2), arXiv:1907.06043v2, 27 July 2020; internal pages 1–40. Read 2026-10-13; exact PDF hash and sections read are in the packet.
- **Carayol**: Henri Carayol, [Sur les représentations l-adiques associées aux formes modulaires de Hilbert](https://www.numdam.org/item/10.24033/asens.1512.pdf), Annales scientifiques de l’ENS 19 (1986), 409–468. Read 2026-10-13; exact PDF hash and sections read are in the packet.
- **Saito**: Takeshi Saito, [Hilbert modular forms and p-adic Hodge theory](https://arxiv.org/pdf/math/0612077v2), arXiv:math/0612077v2, 11 December 2006; internal pages. Read 2026-10-13; exact PDF hash and sections read are in the packet.
- **Milne**: James S. Milne, [Lectures on Étale Cohomology](https://www.jmilne.org/math/CourseNotes/LEC.pdf), Version 2.21, 22 March 2013. Read 2026-10-13; exact PDF hash and sections read are in the packet.
- **Deligne**: Pierre Deligne, [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), Publications mathématiques de l’IHÉS 52 (1980), 137–252. Read 2026-10-13; exact PDF hash and sections read are in the packet.
- **BR**: Alexandru Ioan Badulescu; appendix by David Renard, [Unitary dual of GL(n) at archimedean places and global Jacquet–Langlands correspondence](https://imag.umontpellier.fr/~ioan-badulescu/Files/br_jl.pdf), Author preprint of Compositio Mathematica 146 (2010), 1115–1164; internal pages. Read 2026-10-13; exact PDF hash and sections read are in the packet.
- **EGS**: Matthew Emerton, Toby Gee and David Savitt, [Lattices in the cohomology of Shimura curves](https://arxiv.org/pdf/1305.1594v3), arXiv:1305.1594v3, 19 November 2014; internal pages. Read 2026-10-13; exact PDF hash and sections read are in the packet.

The independent review read every cited locator in the seven linked primary texts; their hashes match the packet. Source issues are scoped to arXiv v2: the version-of-record PDF could not be accessed by this reviewer, while the accessible author copy retains the four slips at the checked locators. Every locator is attached to the target it supports, in paraphrase. The document follows the target dependencies rather than summarizing any source section by section.

**HilbertModularVarietiesAndShimuraCurves/E-R18.4-01**, Opening of §6, p.33, arXiv v2. The algebra is described as ramified at exactly one infinite place while being treated as the indefinite curve algebra. Use an algebra split at exactly one real place, ramified at the other real places, with the total ramification set of even cardinality. The §2.2 uniformization has one upper-half-plane factor precisely under this split-place condition. Over F=Q a real-ramified algebra is definite, so the printed condition cannot give the curve used in §6. No correction located. The independent review confirms arXiv v2 and the accessible author copy at this locator; the published PDF was unavailable to the reviewer. Independent review: confirmed; The one upper-half-plane uniformization in §2.2 requires one split real place, as opposed to the ramification condition printed at the §6 locator.

**HilbertModularVarietiesAndShimuraCurves/E-R18.4-02**, §4.2, definition of the unframed fixed-determinant ring, p.23, arXiv v2. The unframed fixed-determinant functor uses determinant ψ, whereas the framed functor and local conditions use ψε⁻¹. Both global functors use θ=ψε⁻¹, agreeing with §3’s fixed determinant and allowing the framed-to-unframed forgetful map. Forgetting a frame cannot change the determinant of a lift. The two different determinant conditions would not define the asserted formally smooth forgetful map or its j=4|Σ|−1 relative dimension. No correction located. The independent review confirms arXiv v2 and the accessible author copy at this locator; the published PDF was unavailable to the reviewer. Independent review: confirmed; The framed and unframed functors must impose the same θ=ψε⁻¹ determinant for their stated forgetful map. The p.23 definitions impose different determinants.

**HilbertModularVarietiesAndShimuraCurves/E-R18.4-03**, Fixed-determinant local-ring displays before Proposition 6.11, p.37, arXiv v2. Both residual fixed-determinant rings are displayed with five variables X,Y,P,Q,R. Use the four coordinates X,Y,P,R of Propositions 3.5–3.7, retaining X²Y and XY respectively; no extra free Q occurs in this fixed-determinant local core. The earlier fixed-determinant presentations have four coordinates. Adding an independent Q raises the Krull dimension by one and contradicts the local dimension used in the patching equality. No correction located in the texts accessible to this reviewer; scoped to arXiv v2. Independent review: confirmed; Compared the p.37 displays with the four-variable fixed-determinant presentations in §3.3. The free Q cannot be present in both presentations of the same ring.

**HilbertModularVarietiesAndShimuraCurves/E-R18.4-04**, Proofs of Propositions 6.11–6.12, p.38, arXiv v2. The proof of 6.11 chooses the residual unipotent patched ambient ring for the X²Y lemma; the proof of 6.12 chooses the residual ps patched ring for the XY lemma. Use residual R_ps,∞ for 6.11, before quotienting by XY; use residual R_unip,∞ for 6.12, on which the Steinberg module acts. M(σ_ps) has an R_ps action and need not factor through R_unip before the first flatness-transfer lemma. In the second step XY is nonzero in k[[X,Y]]/(X²Y), so the stated coordinate-preserving map from k[[X,Y]]/(XY) into the ps ring is not defined. Swapping the ambient labels restores both applications. No correction located in the texts accessible to this reviewer; scoped to arXiv v2. Independent review: confirmed; Read both nodal lemmas and both applications. Their module actions and required defining relations select R_ps first and R_unip second.

## Ownership and exit criteria

This stage adds no generic local-system, cohomology, determinant-polynomial, duality, purity or module-patching theory. The finite-level quaternionic local deformation datum, weight-two Galois–Hecke input and minimal local/global transfer used by Ihara must precede R22 and the corresponding R08/R17/R19 consumers. They move to the targets named here; the generic extensions remain with their lower-tier owners through the explicit requests. The existing R18.2 files are unchanged; the two inherited core dependency replacements are required at packaging, as stated above.

The six planets are component Hecke action, degeneracy Gram matrix, quaternionic patching functor, large-image Ihara lemma, integral Ihara saturation and Saito coefficient projector. Each is a mathematical target rather than a source locator.

The independent review accepts this finished planning pass with R18.4 planned. Proof closure requires the source proof leaves and supplier requests to be discharged; packaging must apply the inherited dependency replacements. All 27 new targets and nine core contracts must agree, all six owned definitions/constructions must pass their discriminating checks, and the suggested file must retain real-bodied light data only. The generalized weight assertion uses the actual CM shift and good models; the strongest Ihara statement keeps every image, prime and coefficient hypothesis stated above.
