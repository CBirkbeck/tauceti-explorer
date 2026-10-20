# Roadmap: stable arithmetic cohomology and Borel regulators

**Summary.** Build the stable real cohomology of arithmetic groups of orders in central division algebras, use its primitive classes to compute higher K-group ranks, and construct the archimedean regulator of a number field. Integral finite generation turns its real isomorphism into a full lattice. Compact cycles from division algebras then identify the determinant line with the leading coefficient of the Dedekind zeta function at a negative integer. The final comparison fixes the exact factor two between the Borel and Beilinson regulators in specified Tate coordinates.

The README specifies the mathematics. `Suggested.lean` records the light definitions and representative statements whose carriers can be expressed using the pinned libraries; it is not an exhaustive declaration list.

## Scope and ownership

This roadmap owns arithmetic specialisations of buildings and duality, the stable-range comparison of invariant forms with arithmetic cohomology, the resulting rank theorem for orders in central division algebras, embedding-equivariant regulator targets, the universal Borel class, its arithmetic lattice and its zeta determinant, and the exact comparison with the higher Deligne Chern character. The number-field regulator uses the ring of integers for its integral lattice and the field for functoriality. It does not assert finite generation of the field's integral K-groups.

The norm-one Tamagawa number is computed here from the zeta integral of a central division algebra (§6.2). The weight-two coefficient is also evaluated: the Borel regulator is the Bloch–Wigner function of Suslin's image divided by π (§8.5).

Prerequisites and boundaries are as follows. Mathlib owns continuous-cohomology pullback, finite-dimensional linear algebra, determinants, analytic Taylor coefficients, complex embeddings and the lattice measure API. Tau Ceti's simplicial `orderComplex` and its induced simplicial maps are used directly; only the division-subspace specialisation and its topology belong here. The generic exterior algebra, matrix-of-a-linear-map, change-of-basis formula, and covolume of a discrete full lattice are not additional definitions of this roadmap. Their regulator specialisations below refer to those APIs. The prime symbol on Borel's integer part means `ceil(x) - 1`; no second integer-part theory is introduced.

TauCetiRoadmap DifferentialGeometry owns smooth forms, their exterior differential and product, Stokes for compact support and manifolds with corners (Layer 5), the de Rham complex (Layer 6), the natural multiplicative integration comparison (Layer 8), and Riemannian volume (Layer 12). AlgebraicTopology owns augmented homology, realisation, CW arguments, Hurewicz, products, fundamental classes and finite-cover descent. RepresentationTheory/LieGroups owns compact real forms, Cartan decompositions and maximal compact subgroups (Layers 7 and 9). IntegralLattices owns ordinary full lattices, determinant lines and their basic integral linear algebra. ClassFieldTheory owns local and global Brauer invariants (Layers 5 and 10); Chebotarev owns the auxiliary cyclotomic prime and the prescribed-Frobenius infinitude theorem (Layers 7 and 10).

A compact real form does not by itself supply the compact dual of a symmetric pair. A compact-support Stokes theorem does not supply the complete-manifold integrability theorem used for noncompact arithmetic quotients. Those extra constructions are specified below. Likewise, the topological H-space and plus-construction inputs, rational localisation, Adams operations, the Deligne regulator, and the weight-two Bloch interface are specified as local targets with statements and sources, rather than being hidden behind a reference to a later K-theory or polylogarithm roadmap. Their other applications should share these definitions.

The Dedekind functional equation is consumed from the finite-order Hecke L-function interface of LFunctions and ArithmeticGaloisRepresentations §2.7, specialised to the trivial character. The construction of the global functional equation is outside this roadmap. The all-unitary-character interface, when needed for the comparison of conventions, is the degree-one Godement–Jacquet interface of AutomorphicLFunctionsAndLocalFactors or the Eisenstein interface of AutomorphicSpectralTheory. Apart from the zeta integral of a central division algebra of degree at least two in §6.2, which no supplier provides, none of the zeta results below asks for a global adelic zeta integral. Its degree-one case and the volume of the norm-one idele class group are consumed from AutomorphicLFunctionsAndLocalFactors AL.1.

## Conventions

A number field is denoted by F; its ring of integers is O_F, its degree by d, its signature by (r₁,r₂), and its signed discriminant by D_F. There are r₁ real embeddings and 2r₂ nonreal complex embeddings. A complex place means one conjugate pair. Write Δ_F=|D_F| for the positive discriminant used in Haar measures.

A central division algebra D over F has degree e, so dim_F D=e². An order need not be maximal. Lattices are projective right O-modules, and V=P⊗_O D is a right D-space. In Lean its subspaces are left submodules over Dᵐᵒᵖ. Matrix formulae use the corresponding column/endomorphism convention explicitly. Building vertices are proper nonzero D-subspaces, not integral sublattices. Augmented reduced homology is indexed in ℤ; the empty rank-one building has reduced homology ℤ in degree −1.

Arithmetic symmetric spaces for a reductive group are formed after removing the connected real points of its maximal rational split central torus. For a subgroup Γ put G_Γ=G(ℝ)°Γ and K_Γ=K∩G_Γ. Its invariant-form source is H*(g,K_Γ); no components absent from Γ are imposed. Quotients are Γ\G/K except where the right-quotient cusp coordinates are explicitly named. Integration uses compact oriented neat covers and then finite-index descent.

Weights satisfy j≥2. The coefficient line ℝ(q)=(2πi)^qℝ has the displayed generator. After division by (2πi)^(j−1), the regulator target is the real space of functions f on all complex embeddings satisfying f(σ̄)=(-1)^(j−1)f(σ). Thus d_j=r₁+r₂ for odd j and r₂ for even j. Choosing one representative per complex place and including the real places only for odd j identifies it with ℝ^{d_j}. The reference integer lattice is ℤ^{d_j} in these coordinates, with covolume one. This is not the Euclidean measure inherited from the space with both members of each pair.

The twisted Chern character is ch_j=(2πi)^j pr_j/j!. Fix the suspension and Bott orientations compatibly with Burgos §§4.4–4.6 and Definition 9.24. The Borel class is his renormalised class. Its absolute Lie representative is 2π_{j−1}Φ_{2j−1}, while the Beilinson class has representative π_{j−1}Φ_{2j−1}; here π_q(z)=(z+(-1)^q z̄)/2. This is equality of cohomology classes; it does not identify the relative and absolute cocycles pointwise.

Write a∼_ℚb for nonzero real numbers when a/b∈ℚ×; for positive covolumes the ratio is in ℚ_{>0}. Exterior powers of degree zero, empty products and empty determinants are one. An analytic leading coefficient of order h is f^(h)(s₀)/h!, not f^(h)(s₀). The exact order hypothesis is required for its nonvanishing.

## Exact supplier contracts

### From Mathlib and Tau Ceti

Use `NumberField.ComplexEmbedding.conjugate` and `involutive_conjugate`, `NumberField.InfinitePlace.mk_eq_iff`, the finite embedding sets and the completion at an infinite place. The fibre of restriction of complex embeddings along a finite number-field embedding has cardinality [E:F]; this is the separable algebra-homomorphism counting theorem (`AlgHom.card`) after base change. `Bialgebra.IsPrimitiveElem` gives the ordinary coalgebraic primitive condition; the graded Hopf compatibilities below additionally require the Koszul signs in the tensor product. `Matrix.det`, `LinearMap.toMatrix`, `Basis`, `Module.finrank`, `ExteriorAlgebra`, and `ZLattice.covolume` provide the linear algebra and measure conventions. A `Submodule ℤ V` alone does not assert discreteness or fullness.

`Mathlib.RepresentationTheory.Homological.ContCohomology.Functoriality` supplies `ContinuousCohomology.map`, `cochainsMap`, `map_id`, `map_comp` and the coefficient-natural cochain pullback. Tau Ceti's `RepresentationTheory/Homological/ContCohomology/GroupCohomologyIso` supplies the explicit discrete comparison in degrees zero, one and two. The all-degree chain comparison used below extends that low-degree interface, rather than redefines group restriction.

`Mathlib.Algebra.Lie.Cochain` supplies `LieModule.Cohomology.oneCochain`, `twoCochain`, the differentials `d₁₂`, `d₂₃`, their composite-zero theorem `d₂₃_comp_d₁₂`, and `twoCocycle`. The all-degree and relative complexes of §2.2 extend these low-degree constructions; their degree-one and degree-two maps must recover these supplied differentials.

Tau Ceti’s `CategoryTheory/GrothendieckGroup/Exact` and `Split` supply `TauCeti.ExactK0`, `ExactK0.of_conflation`, `ExactK0.liftEquiv`, `ExactK0.map`, `ExactK0.fromSplitEquiv` and `TauCeti.SplitK0`. Use these for K₀ of the exact category of finitely generated projective modules, whose exact sequences split. The generic Grothendieck-group presentation, universal property and exact-functor maps are supplied inputs; the new higher K-theory target is the Q/plus construction and its comparison, not a second K₀ construction.

`TauCeti.AlgebraicTopology.SimplicialComplex.OrderComplex` supplies `TauCeti.AbstractSimplicialComplex.orderComplex`, `mem_orderComplex_iff`, `pair_mem_orderComplex_iff`, `orderComplexMap` and its identity/composition laws. Its faces are nonempty finite chains. The pair membership theorem includes a repeated vertex; the assertion that a pair is an edge also requires two distinct vertices.

The analytic library's iterated derivative and analytic germ API supplies the ordinary Taylor coefficient. The present use ties that coefficient to the exact order of the supplied Dedekind zeta function. At the pins, NumberField.dedekindZeta is the ideal-counting Dirichlet series. Current Tau Ceti additionally supplies continuation of ζ_F(s)−ρ_F/(s−1) to Re(s)>1−1/d and nonvanishing on Re(s)=1 away from the pole (TauCeti.NumberTheory.NumberField.DedekindZeta: exists_differentiableOn_eq_dedekindZeta_sub and ne_zero_of_eqOn_dedekindZeta). Neither that half-plane result nor the defining Dirichlet series gives values at 1−j; the full functional equation is consumed from its named owner. Section 6.2 uses Mathlib's `NumberField.dedekindZeta_residue` with the class number formula `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`, a real one-sided limit at 1. It also uses Tau Ceti's Euler product `TauCeti.dedekindZeta_eulerProduct_hasProd` for Re(s)>1 and Mathlib's weak approximation at the infinite places, `NumberField.InfinitePlace.denseRange_algebraMap_pi`.

### From existing geometric roadmaps

AlgebraicTopology's relative-chain and realisation stages supply augmented integral simplicial homology including degree −1 and agreement with singular homology, and the cone-attachment homotopy argument. Its bundle/product stages supply the Serre and Lyndon–Hochschild–Serre spectral sequences, transgression, Künneth, finite-cover transfer, and the integration pairing with a compact oriented fundamental class. DifferentialGeometry Layers 5, 6 and 8 supply the forms and natural multiplicative de Rham comparison, including its compatibility with integration. The group quotient and component descent refinements are specified in Layer 2.

LieGroups Layers 7 and 9 supply compact real forms, compatible Cartan involutions, maximal compact subgroups and their conjugacy, and the invariant metric of a symmetric space. Layer 3 below supplies the additional dual symmetric-pair quotient. ClassFieldTheory Layers 5 and 10 supply inv_v:Br(F_v)→ℚ/ℤ at finite places, the real invariants 0 and 1/2, vanishing of Br(ℂ), the exact global sum-of-invariants sequence, and multiplication by local degree under restriction. Chebotarev Layer 7 supplies a prime p≡1 mod e for which the p-th cyclotomic polynomial is irreducible over F, and hence the full cyclic group of order p−1 over F; Layer 10 supplies infinitely many inert primes in its cyclic degree-e subextension.

### Arithmetic and analytic interfaces

AdelicAlgebraicGroups §2.4 already supplies gauge measures and corrected finite-place volumes: for the standard SL_e model, e≥1, the mass is #SL_e(k_v)/q_v^(e²−1)=∏_{a=2}^e(1−q_v^(−a)), and exceptional compact-open gauge volumes are positive rational. Use its finite-product convergence. Its §3.4 already constructs SL₁(D) for a central division algebra and proves the compactness of its adelic and infinite arithmetic quotients. The additional result here is the exact Tamagawa number, followed by the primitive cycle and rational period calculation; the finite-place formula and the norm-one group construction are not targets again. For example, at e=2 and q_v=2 its supplied formula gives 6/8=3/4, and at e=1 the empty product is 1. AutomorphicLFunctionsAndLocalFactors AL.0 supplies the standard additive character, self-dual measures, the adelic Schwartz–Bruhat space of 𝔸_F^n and its Poisson summation, whose scalar case is ArithmeticGaloisRepresentations §2.7. Section 6.2 uses them for D_𝔸 through an F-basis of D. AL.1 supplies the volume κ of the norm-one idele class group in its own measure normalisation, which §6.2 converts to the Tamagawa normalisation.

AdelicAlgebraicGroups' affine-group and quotient layers and ReductiveGroupsPartII's local-structure layer supply adelic points, integral models, reduced norm on a central simple algebra, restriction of scalars, arithmeticity, rational ranks, parabolic flags, and relative roots with multiplicities. The exact division-algebra specialisations are in §1.1 and §6.1. The reduction-theory input is compactness for anisotropic groups, finite volume for arithmetic groups, neat finite-index subgroups, and strong approximation for a simply connected inner form of SL_e with a noncompact infinite factor. These contracts are for general number fields and orders; neither split matrix algebras nor maximal orders alone suffice.

For the zeta function, use the trivial finite-order character in the LFunctions/ArithmeticGaloisRepresentations §2.7 interface: a meromorphic function agreeing with the ideal Dirichlet series for Re(s)>1, holomorphic away from s=1, with completed function Δ_F^(s/2)Γ_ℝ(s)^r₁Γ_ℂ(s)^r₂ζ_F(s), functional equation Λ_F(s)=Λ_F(1−s), and no completed poles except simple poles at 0 and 1. Its Euler product is positive and nonzero at real j>1. Here Γ_ℝ(s)=π^(−s/2)Γ(s/2) and Γ_ℂ(s)=2(2π)^(−s)Γ(s). If a supplied complex-place factor is L_ℂ(s)=πΓ_ℂ(s), multiply the corresponding completed function by π^(−r₂) before applying this contract. The gamma residue calculation is performed here. The source for the use of this convention is Borel 1977 §6.4, p.633, and Burgos Theorem 9.12, pp.80–81; these uses are not a construction of the functional equation.

The remaining K-theoretic and regulator interfaces are local targets in §§3.9–3.12, §4.4 and §8.2–8.6. This specifies their logical order: rational localisation and the independently normalised Deligne Chern character are available before a regulator comparison; neither assumes the Borel rank or factor-two theorem it is used to prove.

## How to read the build

Layer 1 supplies integral finiteness through buildings and arithmetic duality. Layer 2 constructs the comparison and its naturality, and Layer 3 proves stability, primitive comparisons and the rank theorem. Layer 4 constructs the regulator, functorial embedding maps and full lattice. Layer 5 fixes the analytic leading coefficient independently of the periods and constructs the compact-fibre cohomology comparison needed for the cycles. Layer 6 builds inner forms, archimedean volumes and compact cycles. Only then does Layer 7 compare rational cohomology lines and deduce zeta proportionality. Layer 8 identifies the Beilinson normalisation and gives low-weight and extension computations. In particular, the compact-cycle proof does not rely on the zeta determinant it establishes.

## Layer 1: Orders, buildings and integral finiteness

### 1.1 Arithmetic groups of division-algebra orders

Let F be a number field, D a finite-dimensional central division F-algebra of degree e, and O a ℤ-order in D in the sense of the following convention: a unital subring that is a full ℤ-lattice. For n≥2 put G_n=Res_{F/ℚ} SL_n(D), the group of elements of M_n(D) of reduced norm one, and Γ_n=SL_n(O)=G_n(ℚ)∩M_n(O). For a projective right O-lattice P of rank n≥1, put V=P⊗_O D, a right D-space isomorphic to D^n, and put Γ_P=Aut_O(P)⊂GL_D(V). The construction makes Γ_n and Γ_P arithmetic subgroups of Res_{F/ℚ}SL_n(D) and Res_{F/ℚ}GL_D(V), records the real Lie group G_n(ℝ)=∏_{v|∞}SL_n(D⊗_F F_v) with each factor SL_{ne}(ℝ), SL_{ne/2}(ℍ) or SL_{ne}(ℂ), and records the block maps g↦diag(g,1) from Γ_n to Γ_{n+1} and from G_n to G_{n+1}.

Matrices act on columns by left multiplication, and GL_D(V) denotes right-D-linear automorphisms. In arithmetic statements Δ_D(V) and St_D(V) are the right-subspace constructions, that is, the generic building and Steinberg module over Dᵐᵒᵖ.

When O contains O_F, equivalently use a full O_F-lattice subring; when the centre order is smaller, specify the inclusion into O_F and pass through finite-index commensurability. The arithmetic claims below are for the integral arithmetic subgroup, not for the discrete group of all rational points. Its basic API includes extension O⊗ℚ≃D, integrality and full-span lemmas, and commensurability of two orders. Use the central-simple algebra carrier from Mathlib. The reduced norm and its extension to completions and ideles are ClassicalArithmeticCompletion §7.10 (the Azumaya reduced norm of IntegralHeckeAndGaloisDeterminants §0.6). SL_1(D) is AdelicAlgebraicGroups §3.4; SL_n(D)=SL_1(M_n(D)) is the norm-one group of ClassicalArithmeticCompletion §7.26, and GL_n(D) is the unit-group scheme of M_n(D) underlying it. Restriction of scalars to ℚ and arithmetic subgroups are AdelicAlgebraicGroups §§1.4 and 3.4. Keep the right-module/opposite-algebra dictionary in these imports, so the lattice stabiliser agrees with the tensor-product convention used in Quillen’s rank filtration. Γ_n is the stabiliser in G_n(ℚ) of the lattice O^n, and Γ_P the stabiliser of P; both are of the form G(ℚ)∩U for a compact open U (AdelicAlgebraicGroups §3.4 (level arithmetic groups)). Any two orders of D are commensurable, so the commensurability class of Γ_n does not depend on O. At a real place D⊗_F F_v is M_e(ℝ) or M_{e/2}(ℍ), and at a complex place it is M_e(ℂ) (Borel 1974, 11.5(1)). Block diagonal extension multiplies the reduced norm by one. A minimal parabolic ℚ-subgroup of G_n is the stabiliser of a full flag of D-subspaces, with maximal ℚ-split torus of dimension n−1; hence rank_ℚ G_n=n−1.

Prove the following basic identities and compatibility maps.

- `orderArithmeticSystem_block`: The block inclusion Γ_n→Γ_{n+1} agrees with diag(g,1) on matrices and composes to diag(g,I_r).
- `orderArithmeticSystem_archimedean`: The real Lie group of G_n is the product of the factors SL_{ne}(R), SL_{ne/2}(H) at ramified real places, and SL_{ne}(C) at complex places.
- `orderArithmeticSystem_rank`: For n≥2, rank_Q G_n=n−1.
- `orderArithmeticSystem_equiv`: An order algebra isomorphism induces the corresponding isomorphism of matrix groups and commutes with every block inclusion.
- `orderArithmeticSystem_projective`: For a projective right O-lattice P of rank n≥1 spanning V, Aut_O(P) is an arithmetic subgroup of Res_{F/ℚ}GL_D(V), commensurable with GL_n(O) after a choice of D-basis of V.

For the order itself include `order_ratSpan`, `order_tensorEquiv`, `order_integral` and `order_commensurable`. The first two identify its rational span and scalar extension with D, the third proves every element integral over ℤ, and the last compares any two full orders.

**Checks.**

- For D=ℚ the subring ℤ is an order.
- In D=ℚ, the unital subring ℤ[1/2] fails finite generation over ℤ and is not an order.
- In D=ℚ(i), ℤ fails full span while ℤ[i] satisfies it.
- For D=F and O=O_F, Γ_n=SL_n(O_F), not GL_n(O_F) and not the norm-one units of O_F.
- For n=2 and any central division D, rank_Q G_2=1.
- For F=Q, diag(2,1) lies in GL_2(Q) but not in Γ_2 for O=Z, and not in SL_2(Q).

Use Borel 1974, §11.5, p.268; Quillen, §2, pp.185–186 (scan headers 201–202).

*Needs:* the arithmetic and geometric contracts above.

### 1.2 The spherical building over a division algebra

For a division ring D and a D-module V of finite dimension n, let S(V) be the type of proper nonzero D-subspaces of V, ordered by inclusion. The building Δ(V) is the order complex of S(V), in the sense of Tau Ceti's AbstractSimplicialComplex.orderComplex: its vertices are the elements of S(V) and its faces are the nonempty finite chains. A D-linear equivalence V≃W induces an isomorphism Δ(V)≅Δ(W) by taking images of subspaces, so Aut_D(V) acts simplicially on Δ(V). For n≤1 the type S(V) is empty and Δ(V) is the empty complex; reduced homology in degree −1 is fixed in the Steinberg module, not here.

D is a division ring, not necessarily commutative; V is a D-module of finite dimension. This is a left module in Mathlib; for an arithmetic right D-space use the scalar ring Dᵐᵒᵖ.

Define S(V) as the subtype of Submodule D V cut out by W≠⊥ and W≠⊤, with the induced partial order, and apply orderComplex. A linear equivalence gives an order isomorphism of S(V) with S(W) (Submodule.map); orderComplexMap, with its identity and composition laws, turns it into a simplicial isomorphism. Faces are read off from mem_orderComplex_iff. The pair_mem_orderComplex_iff theorem characterises a two-vertex set as a face by comparability even when the two listed vertices coincide; an edge additionally has cardinality two. Thus W,W′ span an edge exactly when W≠W′ and either W≤W′ or W′≤W.

Prove the following basic identities and compatibility maps.

- `divisionBuilding_vertices`: The vertex type of Δ(V) is S(V), the proper nonzero D-subspaces of V.
- `divisionBuilding_simplex`: A finite set of vertices is a face iff it is nonempty and totally ordered by inclusion.
- `divisionBuilding_edge`: Two vertices W, W′ span an edge iff W≠W′ and (W≤W′ or W′≤W); an edge is a face with two distinct vertices.
- `divisionBuilding_map`: A D-linear equivalence V≃W induces a simplicial isomorphism Δ(V)≅Δ(W), with identity and composition laws.
- `divisionBuilding_action`: Aut_D(V) acts on Δ(V) by simplicial automorphisms; every subgroup, in particular Aut_O(P), acts by restriction.
- `divisionBuilding_dim`: Every face has at most n−1 vertices, and a maximal chain has exactly n−1; so Δ(V) has dimension n−2 for n≥2.

**Checks.**

- For V=D of dimension one, S(V) is empty and Δ(V) has no faces.
- For dim V=2 every face of Δ(V) is a single vertex: two distinct lines are incomparable, so there is no edge.
- For V=D³ with basis e₁,e₂,e₃, the line De₁ and the plane De₁+De₂ span an edge, and De₁ and De₂ do not.
- For V=ℚ², neither ℤ² nor 2ℤ² is a vertex: they are not ℚ-subspaces, and the subspace each spans is the excluded V.
- For any proper nonzero subspace W, {W,W}={W} is a face with one vertex and is not an edge, despite W≤W.

Use Quillen, §1, before Theorem 2, p.180; §2, pp.185–190 (scan headers 196, 201–206); Putman–Studenmund, §1, p.3.

*Needs:* the arithmetic and geometric contracts above.

### 1.3 The integral Steinberg module

For a division ring D and a D-module V of finite dimension n≥1, the Steinberg module is St_D(V)=H̃_{n−2}(Δ(V);ℤ), the reduced integral homology of the building in its top degree, with the action of Aut_D(V) induced by the simplicial action. Reduced homology is that of the augmented chain complex, so for n=1 (empty building) St_D(V)=H̃_{−1}(∅;ℤ)=ℤ with trivial action, and for n=2 it is the kernel of the augmentation ℤ[lines of V]→ℤ. It is a ℤ[Aut_D(V)]-module and is in general not finitely generated as an abelian group.

V has positive finite D-dimension n.

Take the augmented simplicial chain complex of Δ(V), equivalently the reduced singular chains of its realization (Tau Ceti's AbstractSimplicialComplex.Realization); the comparison of the two is supplied by Tau Ceti AlgebraicTopology stages 2 and 4. The simplicial action of Aut_D(V) acts on chains and passes to homology. For n=1 the augmented complex of the empty complex is ℤ in degree −1.

Prove the following basic identities and compatibility maps.

- `steinbergModule_action`: St_D(V) is a Z[Aut_D(V)]-module induced from the action on augmented chains.
- `steinbergModule_equiv`: Linear equivalences give equivariant module equivalences, preserving identity and composition.
- `steinbergModule_rank_one`: St_D(D)=Z with trivial automorphism action.
- `steinbergModule_rank_two`: St_D(D²) is canonically the kernel of the sum-of-coefficients map Z[P¹(D)]→Z.
- `steinbergModule_apartment`: An ordered D-basis gives the oriented apartment class; permutations act by their sign and replacing any basis vector by a nonzero multiple leaves the apartment unchanged.

**Checks.**

- St_D(D)=Z, not zero.
- For D=F_q, rank_Z St_D(D²)=q.
- For D=Q and n=2 the underlying abelian group has infinite rank, although a torsion-free subgroup of finite index in GL₂(ℤ) has a finite classifying-space model.

For n=1 the rank-one term of the rank filtration is the homology of the unit group with constant coefficients.

Use Quillen, §1, definition before Theorem 3, p.181 (scan header 197); Putman–Studenmund, §1, p.3.

*Needs:* §1.2; the arithmetic and geometric contracts above.

### 1.4 Solomon–Tits theorem over division rings

For a division ring D and a D-module V of finite dimension n≥2, the realization of Δ(V) is homotopy equivalent to a wedge of spheres of dimension n−2, possibly infinitely many. Hence the reduced integral homology of Δ(V) vanishes outside degree n−2, St_D(V) is a free abelian group, and it is generated by the apartment classes: for an ordered basis (v₁,…,v_n) of V the subcomplex of subspaces spanned by proper nonempty subsets of the basis is a simplicial (n−2)-sphere, and its fundamental class is the apartment class of the basis.

D division; n≥2.

Fix a line L. Deleting the vertices that are hyperplanes complementary to L leaves a contractible subcomplex (compare W with W+L), and Δ(V) is obtained from it by attaching, for each such hyperplane H, a cone over the link of H, which is the building of H. Induct on n: the link has the homotopy type of a wedge of (n−3)-spheres, so each attachment adds suspensions of these, giving a wedge of (n−2)-spheres. The case n=2 is a discrete set, a wedge of 0-spheres. The induction also shows that the top homology is spanned by classes of apartments; the homotopy and homology of the pushouts are those of Tau Ceti AlgebraicTopology stages 2 and 4.

For n=2 the building is a discrete set with at least three points; it is not connected, and St is the augmentation kernel.

Use Quillen, §1, Theorem 2, p.180; §2, proof, pp.186–188 (scan headers 196, 202–204); Putman–Studenmund, §1, pp.3 and 5.

*Needs:* §1.2, §1.3; the arithmetic and geometric contracts above.

### 1.5 Finiteness of Steinberg-coefficient homology

Let O be an order in a central division algebra D over a number field F, P a projective right O-lattice of rank n≥1, V=P⊗_O D, and Γ a subgroup of Aut_D(V) commensurable with Aut_O(P). Then H_i(Γ;St_D(V)) is a finitely generated abelian group for every i≥0. More precisely, let G=Res_{F/ℚ}GL_D(V), let A_G be its maximal ℚ-split central torus, and let X̄ be the Borel–Serre bordification of X=G(ℝ)/(K·A_G(ℝ)°), of dimension d, and let Γ′⊂Γ be a torsion-free subgroup of finite index that acts on X̄ preserving orientation. Then, with ν=d−(n−1), H_i(Γ′;St_D(V)⊗M)≅H^{ν−i}(Γ′;M) for all i and every ℤ[Γ′]-module M that is finitely generated and free over ℤ, in particular for M=ℤ. For a torsion-free Γ′ that does not preserve orientation, St_D(V) is replaced by its twist by the orientation character; for D=F and Γ′⊂GL_n(O_F) that character is the (n−1)-st power of g↦sign N_{F/ℚ}(det g).

Γ is commensurable with Aut_O(P); for D=F and O=O_F this is every subgroup of GL_n(F) commensurable with GL_n(O_F). The duality statement is integral and needs Γ′ torsion-free; a finite CW model of BΓ′ alone does not bound H_*(Γ′;St), since St is not finitely generated over ℤ. Remove the connected real points of the maximal ℚ-split central torus before defining d. For D=F, d=r₁n(n+1)/2+r₂n²−1 and ν=d−(n−1)=r₁n(n+1)/2+r₂n²−n (Putman–Studenmund, Proposition 2.1, p.8).

Choose Γ′⊂Γ normal, of finite index, neat (AdelicAlgebraicGroups §4.3 (neat subgroups), hence torsion-free by AdelicAlgebraicGroups §4.3 (neatness implies torsion-freeness)) and inside the kernel of the orientation character, which has index at most two. Use the symmetric space with its ℚ-split central factor removed. Its bordification X̄ is a contractible manifold with corners on which Γ′ acts freely with compact quotient Y, and Y has a finite triangulation (`borelSerre_arithmetic_finiteTriangulation`); so H^*(Γ′;M)=H^*(Y;M) is finitely generated. The boundary of X̄ is Γ′-equivariantly homotopy equivalent to the building of rational parabolic subgroups of G, which is Δ(V) because parabolics are stabilisers of flags of D-subspaces (`borelSerre_boundary_building`). By Solomon–Tits the relative chain complex of (X̄,∂X̄) is a bounded complex of free ℤ[Γ′]-modules whose homology is St_D(V), in degree n−1 only (ℤ in degree zero when n=1). Hence H_m(Y,∂Y;M)≅H_{m−n+1}(Γ′;St⊗M). Poincaré–Lefschetz duality on the compact oriented manifold with boundary Y (AlgebraicTopology manifold duality, with trivial orientation sheaf by the choice of Γ′) identifies H_m(Y,∂Y;M) with H^{d−m}(Y;M), which gives the displayed isomorphism. The Lyndon–Hochschild–Serre spectral sequence H_p(Γ/Γ′;H_q(Γ′;St))⇒H_{p+q}(Γ;St) (Tau Ceti AlgebraicTopology stage 5) has finitely generated terms, since the homology of a finite group with finitely generated coefficients is finitely generated. For n=1 the coefficient is ℤ and only the finite model and this descent are used.

The bordification input used here includes an equivariant homotopy equivalence between its boundary and the rational-parabolic building, with its orientation character, in addition to its compact arithmetic quotient. Poincaré–Lefschetz duality then gives the displayed group duality. For split GL_n over F the orientation character is (sign N_{F/ℚ} det)^(n−1). With Γ′ orientation preserving this character is trivial; otherwise tensor the Steinberg module with it. Name these additional interfaces `borelSerre_boundary_building`, `borelSerre_arithmetic_finiteTriangulation`, `steinberg_duality` and `arithmetic_orientationCharacter`. This is a local extension of the usual bordification/finite-level-duality input, not a consequence of compactness alone (Putman–Studenmund Theorem C, pp.4–5, and Proposition 2.1, pp.8–10).

For F=ℚ, n=2 and Γ′ torsion-free of finite index in SL₂(ℤ): ν=1, H¹(Γ′;ℤ)≅H₀(Γ′;St) and H⁰(Γ′;ℤ)≅H₁(Γ′;St). For n even and O_F with a unit of norm −1, the dualizing module of GL_n(O_F) is the twist of St by the sign of the norm of the determinant and is not St itself; the statement keeps the twist. For n=1 the statement is finite generation of the homology of a group commensurable with O^×. For F=ℚ, D=F and n=2, d=2 and ν=1; retaining the positive scalar centre would incorrectly give d=3.

Use Quillen, §1, proof of Theorem 1, pp.182–184 (scan headers 198–200); Putman–Studenmund, Theorem C, p.4; §2.1, Proposition 2.1, p.8, and the proof of Theorem C, pp.9–10.

*Needs:* §1.4, §1.1; the arithmetic and geometric contracts above.

### Examples

For P=ℤ² and D=ℚ the building is the discrete set ℙ¹(ℚ). Its Steinberg module is the kernel of the augmentation ℤ[ℙ¹(ℚ)]→ℤ; it is not a finitely generated abelian group. Nevertheless its homology with arithmetic-group action is finitely generated. For a finite field 𝔽_q the analogous rank-two kernel has rank q, since ℙ¹(𝔽_q) has q+1 points. At rank one the empty complex contributes ℤ in degree −1, supplying the correct trivial Steinberg module.

### Dependencies

Number-field orders and reduced norms; the supplied order complex; AlgebraicTopology augmented homology and CW cone attachments; arithmetic bordification and its boundary/orientation refinement in §1.5.

## Layer 2: Arithmetic comparison and its naturality

### 2.1 Discrete comparison in all cohomological degrees

For a discrete group Γ and a real topological coefficient representation M, identify the homogeneous continuous-cochain complex of Γ with the homogeneous complex of the underlying abstract representation. Transport by the homogeneous-to-inhomogeneous comparison to group cohomology in every degree. The resulting comparison is natural in group homomorphisms and coefficient maps. Compose it with the existing continuous-cohomology pullback for Γ→G to obtain the restriction `arithmeticRestriction` from a real Lie group.

Γ carries the discrete topology; M is a continuous real representation and is restricted along the given homomorphism. No comparison between continuous and abstract cohomology of a nondiscrete group is asserted.

Every function from a finite power of a discrete group is continuous. Identify the differentials and their equivariance conditions before passing to cohomology. The homogeneous-to-inhomogeneous chain equivalence then gives the comparison in each degree. Verify naturality on cochains.

Name the comparison `discreteCohomologyIso`; prove `discreteCohomologyIso_natural`, `discreteCohomologyIso_coeff` and `discreteCohomologyIso_cup` by the corresponding cochain identities. Identity and composite pullbacks agree before taking cohomology.

**Checks.**

- For trivial coefficients, the degree-zero restriction R→R is identity.
- For Γ={1} and q>0, restriction has zero target.
- The degree-two discrete comparison agrees with TauCeti.ContCohomology.explicitH2IsoGroupCohomology on a cocycle class.

The source is the continuous cohomology of the topological group G, not the cohomology of G as a discrete group. The continuous part of the declaration is the Mathlib map; only the comparison with group cohomology of the discrete group is new.

Use Borel 1974, §10.2(2), p.263.

*Needs:* the arithmetic and geometric contracts above.

### 2.2 The invariant-form arithmetic comparison

Let G be a connected semisimple ℚ-group, K a maximal compact subgroup of G(ℝ), X=K\G(ℝ), g=k⊕p the Cartan decomposition and Γ an arithmetic subgroup of G(ℚ). Put G_Γ=G(ℝ)°Γ and K_Γ=K∩G_Γ, so X≅K_Γ\G_Γ. Let I_G^{Γ,q} be the space of q-forms on X invariant under G(ℝ)° and under Γ; such forms are closed. This is H^q(g,K_Γ;ℝ), equivalently the invariants of H^q(g,k;ℝ)=(∧^q p^*)^{K°} under the image of Γ in K/K°. Choose a torsion-free normal subgroup Γ′ of finite index contained in G(ℝ)°. The map j_Γ=`arithmeticInvariantFormMap`:I_G^{Γ,q}→H^q(Γ;ℝ) sends a form to its de Rham class on X/Γ′ and then descends through H^q(Γ′;ℝ)^{Γ/Γ′}=H^q(Γ;ℝ). Before descent, j_{Γ′} is induced by the constants in C^∞(Γ′\G(ℝ)°). Under van Est for (G_Γ,K_Γ), j_Γ is restriction along Γ→G_Γ. If Γ meets every real component, G_Γ=G(ℝ) and the source is H^q(g,K;ℝ); if Γ⊂G(ℝ)°, the source is H^q(g,k;ℝ).

G connected semisimple over ℚ; Γ arithmetic. The Betti, de Rham and relative Lie algebra descriptions of H^*(X/Γ′) are those of the natural multiplicative de Rham comparison, which uses no automorphic input. Real coefficients are used for the descent from Γ′ to Γ. Intersect a neat normal finite-index subgroup with G(ℝ)° when choosing Γ′. The coefficient module for its relative Lie algebra description uses Γ′\G(ℝ)°, rather than the disconnected full real group.

Choose Γ′⊂Γ normal, neat and of finite index (AdelicAlgebraicGroups §4.3 (neat subgroups)), and intersect with G(ℝ)°. X/Γ′ is a manifold and an Eilenberg–MacLane space for Γ′. Identify invariant forms on X with relative Lie algebra cochains, including the action of K/K°. Invariant forms are closed: the geodesic symmetry at the base point multiplies an invariant q-form by (−1)^q and commutes with d. Apply the natural multiplicative de Rham comparison of this layer with trivial coefficients on the connected real group: H^*(Γ′;ℝ) is computed by Γ′-invariant forms on X and by the (g,K°)-complex of C^∞(Γ′\G(ℝ)°); j_{Γ′} comes from the constants. Classical quotient comparison, wedge/cup compatibility and finite-component descent are supplied by the quotient comparison of Layer 2. Descend through Γ/Γ′-invariants. This changes the source from H^q(g,k;ℝ) to H^q(g,K_Γ;ℝ). Van Est for the open subgroup G_Γ (the van Est comparison below) identifies j_Γ with arithmeticRestriction along Γ→G_Γ. Restriction from the full G(ℝ) only describes its full-K-invariant subspace when Γ misses components.

Prove the following basic identities and compatibility maps.

- `arithmeticInvariantFormMap_vanEst`: j_Γ=res_{Γ→G_Γ}∘vanEst⁻¹ on H^q(g,K_Γ;ℝ), using van Est for (G_Γ,K_Γ). It is the full-group formula with K only when Γ meets every real component.
- `arithmeticInvariantFormMap_descent`: Its pullback to a torsion-free finite-index Γ′ equals the invariant form on X/Γ′.
- `arithmeticInvariantFormMap_component`: The source H^q(g,K_Γ;ℝ) is the space of invariants of H^q(g,k;ℝ) under the image of Γ in K/K°; it is H^q(g,K;ℝ) when Γ meets every real component and H^q(g,k;ℝ) when Γ⊂G(ℝ)°.
- `arithmeticInvariantFormMap_cup`: jΓ sends wedge products of invariant forms to cup products.
- `arithmeticInvariantFormMap_coeff`: Extension R→C commutes with the map and with Betti/de Rham comparison.
- `arithmeticInvariantFormMap_constants`: For Γ′⊂G(ℝ)° as above, j_{Γ′} is the map on (g,K°)-cohomology induced by ℝ→C^∞(Γ′\G(ℝ)°); it descends to j_Γ by finite-quotient invariants.

Extend the supplied low-degree Lie cochains to the Chevalley–Eilenberg cochain complex for a finite-dimensional real Lie algebra and construct its relative subcomplex of horizontal K-invariant cochains for a compact subgroup K. Name the agreement with the supplied differentials `lieCochain_d₁₂` and `lieCochain_d₂₃`; these are compatibility theorems, not replacements for the existing maps. Its differential, coefficient maps and pullback for morphisms of pairs must be natural, with wedge/cup compatibility. Prove the van Est isomorphism between continuous group cohomology and relative Lie cohomology for a real Lie group with finitely many components and maximal compact K, for the trivial real or complex coefficient modules used here. Use the full compact K, including its component action. At the cochain-comparison level require naturality for compatible group maps, restriction to discrete subgroups and the invariant-form realisation (Burgos §5.1, pp.35–36, §5.5, pp.48–49, Proposition 6.8 and Theorem 6.9, pp.53–54; Borel 1974 §10.2, pp.263–264).

Construct the quotient comparison with trivial real or complex coefficients first, independently of automorphic spectral theory. On a neat Γ′⊂G(ℝ)° use constant functions in C∞(Γ′\G(ℝ)°), relative Lie cochains and the de Rham comparison. Require naturality for a group morphism carrying the arithmetic subgroup and maximal compact into the chosen targets, compatibility with wedge/cup products, and compatibility on Γ′\G(ℝ) with the projection to Γ′\G(ℝ)/K°. Descend by the finite quotient Γ/Γ′. This fixes the component group action on the source and on cohomology simultaneously.

For the local Lie-cochain definition include `lieCochain_d_sq`, `relativeCochain_horizontal`, `relativeCochain_invariant`, `relativeCochain_pull_comp` and `vanEst_natural`. The relative conditions include both contraction by k and invariance under K; connected k-invariance alone does not impose missing compact components.

**Checks.**

- The zero Lie algebra has only degree-zero cochains.
- An abelian one-dimensional Lie algebra has zero differential and degree-one trivial-coefficient cohomology ℝ.
- For the pair (g,G) with k=g there are no positive-degree relative cochains.
- The constant invariant 0-form 1 maps to the unit cohomology class.
- If X/Γ is a point then every positive-degree class maps to zero.
- For G=PGL₂ over ℚ, K=PO₂ and Γ=PGL₂(ℤ): the non-identity component of K reverses the orientation of the two-dimensional space p, so it acts by −1 on H²(g,k;ℝ)=ℝ, and Γ meets that component. The degree-two source of j_Γ is therefore zero; a definition with source H²(g,k;ℝ) would be wrong.
- For G=PGL₂ over ℚ and Γ=PGL₂(ℤ)∩G(ℝ)°, the degree-two invariant-form source is ℝ, whereas for PGL₂(ℤ) it is zero. This tests the source of the map, without asserting that its degree-two image is nonzero.

Constructing the map uses no automorphic decomposition and no Matsushima formula.

Use Borel 1974, §3.1, pp.241–242; §10.2(1)–(5), p.263.

*Needs:* §2.1; the arithmetic and geometric contracts above.

### 2.3 Naturality of arithmetic comparison under block maps

For an injective real algebraic homomorphism f:G→G′ taking Γ into Γ′, choose K′ containing f(K). The invariant-form restriction, relative Lie pullback, continuous-cohomology pullback and arithmetic-group pullback form commuting squares with jΓ and jΓ′. In the order system this holds for every diag(g,I_r) and commutes with coefficient extension R→C. After the compact duals are constructed in §3.1, the same square identifies their pullbacks, independently of compatible maximal-compact choices up to conjugacy.

Groups, arithmetic subgroups and compact duals satisfy the Layer 2 comparison hypotheses. For disconnected real groups use f:G_Γ→G′_{Γ′} and compatible maximal compact subgroups K_Γ,K′_{Γ′}, as in arithmeticInvariantFormMap.

Continuous restriction is functorial by ContinuousCohomology.cochainsMap_comp. Relative Lie algebra cohomology is functorial for morphisms of pairs, and van Est is natural for them (the natural Lie and van Est comparisons of this layer). Naturality of the Betti–de Rham comparison for the map X/Γ→X′/Γ′ is supplied by the quotient comparison of Layer 2. Work with these open subgroups, or with their identity components before finite descent, so a missing component is not silently imposed as an extra invariant. Compatible maximal compact subgroups exist by conjugacy (Tau Ceti LieGroups Layer 9); the induced map of compact duals is described in Borel 1974, 10.3.

Composing two block inclusions gives the same comparison square as their single block inclusion.

Use Borel 1974, §10.3, pp.263–264.

*Needs:* §2.2, §1.1; the arithmetic and geometric contracts above.

### 2.4 Stable comparison as a Hopf-algebra map

For an order O as in Layer 1, block sum SL_m(O)×SL_n(O)→SL_{m+n}(O) makes H_*(SL(O);ℝ)=colim_n H_*(SL_n(O);ℝ) a connected graded commutative and cocommutative Hopf algebra, and H^*(SL(O);ℝ), taken degree by degree, its dual. The stable comparison with invariant forms and their block-sum maps, is a morphism of Hopf algebras: it preserves unit, product, coproduct and augmentation. Hence it preserves primitive elements and induces a map on indecomposables QH^i=H^i/(decomposables), and in each degree in which cohomology is finite-dimensional the primitive part of H_i is the dual of QH^i, not of all of H^i.

Cohomology is taken in a range of degrees where it has stabilised and is finite-dimensional over ℝ. Define the product directly on the filtered colimit of SL homology by finite block sums and Künneth; define the coproduct by the group diagonal. The map to GL homology and then BGL(O)⁺ preserves these products, but no product is transported backwards along SL→GL.

Homology of a filtered union of groups is the filtered colimit of group homology; prove this using the bar chain complex before passing to the stable arithmetic group. Name this natural comparison `groupHomology_filteredUnion`. Every bar simplex has finitely many entries and hence belongs to a single stage; filtered colimits of abelian groups are exact. For the union of trivial groups the comparison is the identity in degree zero and both sides vanish in positive degree.

Use finite block sums and filtered-colimit homology (the filtered-union group-homology comparison) to define the product on stable SL homology. Associativity and the unit follow after stabilization; block comparison naturality makes the invariant-form comparison compatible with this product. For graded commutativity exchange the two blocks by a permutation matrix. If its reduced norm is −1, stabilize by one more coordinate and multiply the exchanging matrix by −1 on that unused coordinate, making its reduced norm one. Inner conjugation acts trivially on homology (homotopy invariance under inner conjugation). Künneth and the diagonal (AlgebraicTopology Stage 5) give the compatible cocommutative coproduct, counit and Hopf structure. Once the plus H-space is constructed in §3.9, the map SL→GL→BGL(O)^+ preserves this block product. This compatibility does not define the SL product and does not assume an SL/GL homology isomorphism. Dualise degree by degree: primitives of a finite-type Hopf algebra are the annihilator of the decomposables of the dual.

For the graded duality, define the degree-i indecomposable quotient as the degree-i part of I/I², where I is the augmentation ideal. The new result `primitive_dual_indecomposables` identifies its dual with the degree-i primitives of homology for i>0 under finite-dimensionality in each degree. The API `stableBlockProduct_assoc`, `stableBlockProduct_comm`, `stableBlockDiagonal_compat` and `arithmeticComparison_hopf` records the product and comparison compatibilities. The graded tensor-product sign controls the mixed terms.

**Checks.**

- The trivial group gives only the degree-zero unit.
- An odd exterior generator x is primitive with Δx=x⊗1+1⊗x.
- For distinct odd generators x,y, Δ(xy)=xy⊗1+x⊗y−y⊗x+1⊗xy prevents xy from being primitive and kills its indecomposable class.

Exchanging blocks of D-ranks m and m′ has reduced norm (−1)^{mm′e}. When this is −1, e is odd, and −1 in an unused D-coordinate, of reduced norm (−1)^e=−1, restores reduced norm one.

Use Borel 1974, §10.6, pp.265–266; §12.1, p.270.

*Needs:* §2.3; the arithmetic and geometric contracts above.

### Examples

For a subgroup contained in PSL₂(ℝ), the invariant two-form of the hyperbolic plane belongs to the connected-component source. Adjoining an orientation-reversing element acts by −1 on it, so finite-component descent removes it. Restriction in degree zero is the identity on invariant constants; on the trivial group all positive-degree cohomology vanishes. These checks fix both the direction of pullback and the component convention.

### Dependencies

Layer 1 arithmetic subgroups; continuous-cohomology functoriality; DifferentialGeometry de Rham comparison; LieGroups Cartan pairs; the all-degree discrete and finite-component comparison constructed in this layer.

## Layer 3: Stable cohomology and higher K-group ranks

### 3.1 Classical compact-dual identifications

For the archimedean factors of SL_n(D), the connected compact duals are SU_{ne}/SO_{ne} at split real places, SU_{ne}/USp_{ne} at quaternionic real places (ne even), and SU_{ne} at complex places. They use the Cartan symmetric-pair dual g_u=k⊕i p and the quotient K°\G_u; a compact real form by itself does not specify the dual. Compatible block inclusions induce the corresponding maps between these homogeneous spaces.

n≥2 and D is a central division algebra of degree e over F. The dual symmetric-pair construction is included in this subsection.

Take Cartan decompositions and maximal compact subgroups from Tau Ceti LieGroups Layers 7 and 9; the dual of a symmetric pair, g_u=k⊕i·p with the homogeneous space K°\G_u, and its functoriality are constructed here from those layers. By Layer 1, the archimedean factors of G_n are SL_{ne}(ℝ), SL_{ne/2}(ℍ) and SL_{ne}(ℂ), with maximal compact subgroups SO_{ne}, Sp_{ne/2} (written USp_{ne}) and SU_{ne}. Their duals are SU_{ne}/SO_{ne}, SU_{ne}/USp_{ne} and (SU_{ne}×SU_{ne})/SU_{ne}≅SU_{ne}; block inclusions of the groups induce the block inclusions of these spaces.

For a real reductive Cartan pair g=k⊕p admitting a compact integration of k⊕ip, choose such an integration with its compact subgroup and construct its dual pair g_u=k⊕ip and the compact homogeneous space K°\G_u, with the maps induced by compatible morphisms of pairs. Identify relative Lie cohomology with invariant forms on this space and hence with its real cohomology. An isomorphism of compact real Lie algebras without this quotient and its functoriality is insufficient. These constructions are needed also for the GL_N(ℂ),U_N pair in Layer 8 (Burgos §5.5, pp.48–49, and §6.3 with Example 6.10, pp.54–55; Borel 1974 §10.2, pp.263–264).

The compact-dual API consists of `compactDual_pair`, identifying its tangent symmetric pair with (k⊕ip,k); `compactDual_cohomology`, the invariant-form/relative-cohomology isomorphism; `compactDual_map_id` and `compactDual_map_comp`; and `compactDual_classical`, the three displayed matrix identifications. For the reductive GL_N(ℂ) pair use U_N×U_N and the diagonal U_N explicitly. A chosen compact integration, rather than an unspecified simply connected integration of an abelian centre, fixes that quotient.

**Checks.**

- The compact dual of SL₂(ℝ)/SO₂ is SU₂/SO₂, a two-sphere, and its degree-two real cohomology is ℝ.
- The complex group SL₂(ℂ), considered as a real group, has compact dual SU₂, whose nonzero positive generator is in degree three, not two.
- At quaternionic rank one, SU₂/USp₂ is a point; the list of positive generators is empty.

Use Borel 1974, §§10.2,10.6 and 11.5, pp.263,265–266,268.

*Needs:* §1.1; the arithmetic and geometric contracts above.

### 3.2 Stable exterior cohomology of classical compact duals

With real coefficients (`compactDual_stableExterior`), the degreewise stable cohomology rings are H*(SU)=Λ(x_3,x_5,x_7,…), H*(SU/SO)=Λ(y_5,y_9,y_13,…) and H*(SU/USp)=Λ(z_5,z_9,z_13,…). The named generators are primitive for stable block sum. The finite-dimensional groups and homogeneous spaces have their own unstable relations; the displayed infinite exterior algebras assert only degreewise stable cohomology. For finite ranks m≥1, H*(SU_m;R)=Λ(x_3,x_5,…,x_{2m−1}); H*(SU_{2m+1}/SO_{2m+1};R)=Λ(y_5,y_9,…,y_{4m+1}); H*(SU_{2m}/SO_{2m};R)=Λ(y_5,y_9,…,y_{4m−3})⊗R[e_{2m}]/(e_{2m}²); and H*(SU_{2m}/USp_{2m};R)=Λ(z_5,z_9,…,z_{4m−3}), with empty generator ranges interpreted as R. Block pullback preserves the named transgressed odd generators wherever they occur; the even-rank Euler class is unstable.

Stability maps come from the compatible classical block inclusions.

Use the Serre spectral sequence with transgression for the fibrations of the classical groups (Tau Ceti AlgebraicTopology stage 5). Compute the finite-rank rings from the classical transgression calculation: Borel 1953 Propositions 31.3–31.4 compute U(2m)/Sp(m) and U(n)/SO(n); remove the determinant S¹ factor to obtain the displayed SU quotients over R. Retain the even-rank Euler generator and its square-zero relation. Borel 1974 §10.6 then gives the degreewise stable rings. Use block multiplication to verify the generator coproduct x↦x⊗1+1⊗x.

H³(SU/SO;R)=H³(SU/USp;R)=0, while H³(SU;R)=R. Finite-size cohomology is not replaced by the stable ring without a degree bound.

Use Borel 1974, §10.6, pp.265–266; Borel 1953, Propositions 31.3–31.4 and their transgression calculations, pp.203–205.

*Needs:* §3.1; the arithmetic and geometric contracts above.

### 3.3 Explicit degreewise compact-dual stability

For fixed q≥0, all three classical compact-dual systems occurring in the order system have stationary real cohomology in degrees ≤q once n≥2q+3. This is a uniform sufficient bound, not the sharp bound: each local matrix rank is at least n, and no unstable Euler or top-degree class occurs in that range. The stable generators and block pullbacks agree under these identifications.

n is the rank over D, rather than the absolute matrix size ne; quaternionic D has even e.

Use the finite-rank presentations in compactDual_stableExterior, including the Euler generator in degree 2m and the largest odd generator in each family. Borel 1953 pp.203–205 also computes restriction on transgressive generators; stationarity alone would not establish the numerical bound. Use the conservative bound on all local matrix sizes to remove each unstable generator in degree ≤q. Apply Layer 2 block naturality to identify the chosen maps.

For q=3 the complex generator survives and the real/quaternionic factors contribute zero. The bound is labelled sufficient; no claim of sharpness is made.

Use Borel 1974, §§10.1 and 10.6, pp.263,265–266; Borel 1953, Propositions 31.3–31.4 and their transgression calculations, pp.203–205.

*Needs:* §3.2, §2.3; the arithmetic and geometric contracts above.

### 3.4 Square-integrability criterion of Matsushima and Garland

Let G be a real semisimple Lie group with finitely many components and finite centre, K a maximal compact subgroup, X=K\G with a G-invariant metric, Γ a discrete subgroup with X/Γ of finite volume and Γ′⊂Γ a torsion-free normal subgroup of finite index. Write Ω^Γ for the complex of Γ-invariant forms on X, I^Γ for its subspace of forms also invariant under G°, and j^q:I^{Γ,q}→H^q(Γ;ℝ) for the map of Layer 2. For a connected simple noncompact group G₁ with Cartan decomposition k₁⊕p₁, Matsushima's constant m(G₁) is the largest positive integer q for which the quadratic form (A/q)(ξ,ξ)+P(ξ,ξ) on the symmetric square of p₁ is positive definite; here the norm and curvature tensor are normalised by the Killing metric. To specify A, let B be the Killing form on g₁, ψ(X,Y)=Tr(ad_p X∘ad_p Y) on k₁, and a_min be the least eigenvalue of −ψ relative to −B|_{k₁}. Set A=a_min/2. The eigenvalue on the centre of k₁ is 1; if k₁ is abelian set a_min=1. On a simple compact ideal the eigenvalue is its isotropy trace-form ratio. Use P(ξ,η)=Σ R_{iklj}ξ_{kl}η_{ij}, with Matsushima's curvature convention (1.5), with R_{ijkl}=−Σ_a c_{aij}c_{akl} in an orthonormal Cartan basis. Thus the last two curvature indices are ordered l,j in P, and the positivity expression is a_min/(2q) times the squared norm plus P. This fixes the factor absorbed into Borel's symbol A. Set m(G₁)=0 if there is no such positive q; degree zero is handled by constants. Put m(G)=min m(G₁) over the simple noncompact factors of G°, with the minimum of an empty set equal to ∞. Then: (a) if G/Γ is compact, j^q is injective for all q and surjective for q≤m(G); (b) if Γ is torsion-free, q≤m(G) and every class in H^q(Ω^Γ) has a square-integrable representative, then j^q is surjective; (c) if C⊂Ω^{Γ′} is a subcomplex stable under Γ/Γ′ and m′ is a positive real number such that C→Ω^{Γ′} is an isomorphism on cohomology in degrees ≤m′, C^q consists of square-integrable forms for q≤m′, and I^{Γ′,q}⊂C^q for q≤m′, then j^q:I^{Γ,q}→H^q(Γ;ℝ) is injective for q≤m′ and bijective for q≤min(m(G),m′).

G real semisimple with finitely many components and finite centre; X/Γ of finite volume for (c). Square integrability is with respect to the invariant metric on X/Γ′. The real cutoff m′ is positive, as in Borel 1974 3.6, p.244; only integer cohomological degrees q≤m′ are involved. The expression A/q defining m(G₁) is used only for positive q.

Choose Γ′ normal and of finite index, torsion-free and contained in G°. Work on K°\G° before descent: H^*(Γ;ℝ)=H^*(Γ′;ℝ)^{Γ/Γ′} and I^Γ=(I^{Γ′})^{Γ/Γ′}. The component convention is the one of arithmeticInvariantFormMap, with G_Γ for van Est. Injectivity. Elements of I^{Γ′} are harmonic. On the complete manifold X/Γ′ Stokes' formula holds for integrable forms with integrable differential (Borel 1974 §1), so a square-integrable harmonic form which is the differential of a square-integrable form is zero (Borel 1974 2.5). If j(ω)=0 with ω∈I^{Γ′,q}, q≤m′, then ω=dσ with σ∈C^{q−1}, which is square integrable; hence ω=0. Surjectivity. Write a square-integrable harmonic q-form η through its coefficients η_I on Γ′\G in a Maurer–Cartan frame adapted to k⊕p. Matsushima's integral formula for φ=Σ([X_a,X_b]η_I)² shows, for q≤m(G), that the η_I are killed by p, hence constant, so η∈I^{Γ′}. On a noncompact quotient the integrations by parts are justified after replacing η by α*η for a K-invariant test function α: convolution commutes with the Casimir operator and makes every derivative square integrable. Letting α run through a Dirac sequence gives η in the closure of the finite-dimensional space I^{Γ′} (Garland's argument, Borel 1974 3.5). In (c) every class of degree ≤m′ has a square-integrable representative in C, so (b) applies for q≤min(m(G),m′).

The analytic input beyond compact-support Stokes is the following complete-manifold statement: if M is oriented, complete and has no boundary, α is a smooth (dim M−1)-form, and α and dα are integrable, then ∫_M dα=0. Establish the accompanying fact that an exact square-integrable harmonic form is zero under the integrable-primitive/product conditions used in the proof, the Casimir description of the form Laplacian, and regularisation by convolution with compactly supported K-invariant test functions. These are targets of the comparison argument here (Borel 1974 §§1–3, pp.238–246). In particular, compact quotient Hodge theory is not invoked without its compactness hypothesis. For m(G), the trace-form definition above is Matsushima §§5–7, pp.10–13; the factor is visible in his definition of H_g^p on p.13. His Theorem 1, pp.13–14, supplies the positivity criterion; the estimates also use Kaneyuki–Nagano Theorem 4.1, pp.249–250. The rank lower bound alone does not define this constant.

Name the criterion (a)–(c) `invariantForms_bijective_of_squareIntegrable`. For the numerical invariant include `matsushimaConstant_factor`, which gives the minimum over noncompact simple factors, `matsushimaConstant_compact`, which gives ∞ for no such factors, and `matsushimaConstant_positive_iff`, the strict positive-definiteness test above for positive integral q. The auxiliary complete-manifold results are named `integrableStokes`, `exactL2Harmonic_eq_zero`, `formLaplacian_eq_casimir` and `convolution_casimir`; the exact-harmonic statement requires the square-integrable primitive and the product integrability used by Stokes.

Use the Hodge sign Δ_H=dδ+δd for this form Laplacian. In Borel's coefficient frame it acts as minus the Casimir on the coefficient functions (1974, §3.2(5), p.242). On scalar functions it is −div grad, the negative of DifferentialGeometry Layer 12's convention. On the Euclidean line Δ_H(x²)=−2 whereas div grad(x²)=2; this witness fixes the sign of `formLaplacian_eq_casimir`. Harmonicity is unchanged by the sign conversion.

**Checks.**

- A compact quotient has no cusp integrability condition; the all-degree injectivity statement applies there.
- A compact hyperbolic surface has nonzero H¹ but the SL₂(ℝ) invariant source in degree one is zero. This rules out surjectivity in degree one with m(SL₂(ℝ))=0.
- For SL₂(ℝ), k is abelian, a_min=1 and the trace-free curvature eigenvalue is −1/2, so the q=1 positivity expression has eigenvalue 1/2−1/2=0 and fails strict positivity. More explicitly, ξ=diag(1,−1) has squared norm 2 and P(ξ,ξ)=−1, giving (1/2)·2−1=0; the scalar tensor diag(1,1) has the opposite curvature eigenvalue. Reversing the final curvature indices interchanges these signs. At a finite bound c=0 choose m′=1/2: the integer degrees ≤m′ are exactly degree zero. Substitution q=0 into A/q is never made.

For G/Γ compact, (c) with C=Ω^{Γ′} recovers (a).

Use Borel 1974, §1.3–1.5, pp.238–239; §2.2–2.5, pp.239–240; §3.1–3.7, pp.241–246.

*Needs:* §2.2; the arithmetic and geometric contracts above.

### 3.5 Forms with logarithmic growth on an arithmetic quotient

Let G be a connected semisimple ℚ-group, P a minimal parabolic ℚ-subgroup, A_P the identity component of the real points of a maximal ℚ-split torus of P, with simple roots α₁,…,α_s, and ρ_P the character with a^{2ρ_P}=det Ad(a) on the Lie algebra of the unipotent radical U of P. Write λ≫0 if λ is a combination of the α_i with strictly positive coefficients. For q≥0 and a character λ of A_P, condition c(P,q,λ) is: ρ_P+λ−ν≫0 for every weight ν of A_P on ⊕_{i≤q}∧^i Lie(U(ℝ)). For λ with ρ_P+λ≫0, define c(G,λ)=sup{q∈ℕ : c(P,q,λ) holds} in ℕ∪{∞}; if this set is bounded its supremum is its largest degree. This admissibility condition ensures degree zero belongs to the set. For other λ retain only the predicate c(P,q,λ), without assigning it a nonnegative bound. Put c(G)=c(G,0), and c(G)=∞ when G is anisotropic; for an almost direct product, c is the minimum over the factors. Let Γ be a torsion-free arithmetic subgroup and X̄/Γ the Borel–Serre compactification of X/Γ. A form on X/Γ has logarithmic growth near the boundary if every boundary point has a neighbourhood, pulled back from a Siegel set, on which its coefficients in the frame adapted to the horospherical decomposition are bounded by a polynomial in |log a_B^{α_i}| in the right-quotient convention described below. Let C be the complex of Γ-invariant forms on X which, together with their exterior derivatives, have logarithmic growth near the boundary. Then: (a) the inclusion of C into Ω^Γ is an isomorphism on cohomology; (b) for q≤c(G) every element of C^q is square integrable on X/Γ; (c) every form invariant under G(ℝ)° lies in C.

G connected semisimple over ℚ; Γ torsion-free arithmetic. Siegel sets, the horospherical decomposition and the corners are those of AdelicAlgebraicGroups Layer 3 and the bordification input of §1.5. The condition c(P,q,λ) does not depend on the choice of minimal parabolic. Use Borel’s right arithmetic quotient K\G(ℝ)/Γ and boundary coordinates a_B with a_B^{α_i}→0. AdelicAlgebraicGroups Layer 3 uses the left quotient Γ\G(ℝ)/K and a_AA^{α_i}→∞. Quotient inversion identifies the charts by a_B=a_AA⁻¹; transport the adapted frame and metric as well as the coordinate, rather than mixing the two conventions.

Convert the AdelicAlgebraicGroups Layer 3 left-quotient Siegel charts to the right quotient by g↦g⁻¹. In the right-quotient charts a_B^{α_i} tends to zero; logarithmic growth is polynomial growth in |log a_B^{α_i}|, equivalently in log a_AA^{α_i}. The pullback of the metric and adapted frame is used for the norm and volume estimates of Borel 1974 §§4–5. Forms on open subsets of X̄/Γ which, with their differentials, have logarithmic growth near the boundary form a sheaf F of differential graded algebras on the compact manifold with corners X̄/Γ of §1.5, with global sections C. F is fine: a smooth function on the manifold with corners and its differential have bounded coefficients in the adapted frame, so multiplication by a smooth partition of unity preserves F. F resolves the constant sheaf: at interior points by the Poincaré lemma; at a boundary point, in the coordinates log a^{α_i} on the corner and local coordinates on a relatively compact factor, a closed form of F on a small neighbourhood is the differential of a form of F on a smaller one. Hence H^*(C)=H^*(X̄/Γ;ℝ)=H^*(X/Γ;ℝ), which is (a). For (b): a form with logarithmic growth has coefficients bounded by a_B^{−εd} for every ε>0, d being the sum of the simple roots; under inversion this bound is a_AA^{+εd}. The metric and volume computation in the same right-quotient frame (Borel 1974 §§4–5, Proposition 5.5) gives square integrability when c(P,q,−εd) holds. The strict inequalities in c(P,q,0) imply this for small ε. Keep the root, metric and volume conventions together. For (c): a form invariant under A_P has bounded coefficients in the adapted frame (Borel 1974 5.7), and invariant forms are closed.

The logarithmic-growth complex is a new arithmetic subcomplex of the supplied smooth de Rham complex. Define it by bounds on a form and its differential in a fixed invariant cusp frame, with seminorms on compact nilpotent/Levi directions and polynomial bounds in logarithms of the positive chamber coordinates. Its API includes restriction to an open cusp chart, differential and wedge closure, independence of equivalent reduction data, the inclusion of invariant forms, and the natural comparison to all smooth forms. Prove the fine-sheaf resolution and square-integrability claims from these bounds, not from a bare unspecified predicate on growth.

Use the named growth API `logGrowthForms_restrict`, `logGrowthForms_d`, `logGrowthForms_wedge`, `logGrowthForms_changeFrame`, `logGrowthForms_invariant`, `logGrowthForms_quasiIso` and `logGrowthForms_squareIntegrable`. Define `cuspBound` with values in ℕ∪{∞}, with API `cuspBound_minParabolic`, `cuspBound_product` and `cuspBound_anisotropic` for independence, product minima and the empty-parabolic case. The degree condition includes all weights up to q; testing only ∧^q would lose monotonicity.

**Checks.**

- In the right-quotient coordinate a_B tending to zero, |log a_B| is allowed while a_B^(−ε), ε>0, fails a polynomial logarithmic bound.
- Inverting to the left-quotient coordinate a_A=a_B^(−1) transports both the metric/frame and the growth bound; only inverting the variable reverses the integrability conclusion incorrectly.
- An anisotropic arithmetic quotient has no rational cusp, so the chamber inequalities are empty and c=∞; the complex is the ordinary smooth complex on its compact quotient.
- For Res_{F/ℚ}SL₂ the one relative simple root has multiplicity [F:ℚ], so c is the greatest integer strictly smaller than [F:ℚ]/2: 0 for [F:ℚ]=1 or 2, and 1 for [F:ℚ]=3.
- On a product of two semisimple groups with cusp bounds 0 and 1, the product bound is 0; replacing the minimum by a sum would admit unsupported degree-one square integrability.
- For the split A₁ cusp with ρ=α/2, λ=−ρ fails even degree zero and has no admissible nonnegative bound; λ=α satisfies the inequality for every exterior degree and gives c(G,λ)=∞. This excludes an undefined maximum and an accidental value zero for an empty set.

For G=Res_{F/ℚ}SL₂ with [F:ℚ]=d, ρ_P=(d/2)α and c(G)=[d/2]′ (Borel 1974, 7.7). The complex contains the invariant forms; the smaller complex of forms locally lifted from the boundary does not (Borel 1974 8.2).

Use Borel 1974, §4, pp.246–248; §5, pp.248–251; §6, pp.251–254; §7.1–7.4, pp.254–258.

*Needs:* §2.2; the arithmetic and geometric contracts above.

### 3.6 Lower bounds for the constants of the stable range

Let [x]′ denote the greatest integer strictly smaller than x. (1) For an irreducible root system Φ let 2r be the sum of its positive roots, d₀ the highest root of the subsystem of non-multipliable roots, and c(Φ)=max{p : r−p·d₀≫0}; for a reducible system take the minimum over the irreducible factors. Then c(A_n)=[n/2]′, and c(Φ)≥[n/2]′ for every irreducible Φ of rank n. (2) For a connected semisimple group H of positive rank over a field k of characteristic zero, define c(H/k) as c(G) was defined in §3.5, with a maximal k-split torus and a minimal parabolic k-subgroup. Then c(H/k)≥m·c(Φ(H/k)) if every relative root has multiplicity at least m; c(H/k)≥[rk_k(H)/2]′ if H is almost k-simple; c(Res_{k′/k}H′/k)≥[k′:k]·c(H′/k′); and c(H/k)≥c(H/k″) for every extension k″ of k. (3) For H almost simple over ℝ of positive real rank, Matsushima's constant satisfies m(H(ℝ))≥[rk_ℝ(H)/4]′. (4) For a connected almost ℚ-simple ℚ-group G, min(c(G), m(G(ℝ)))≥[rk_ℚ(G)/4]′. In particular for G_n=Res_{F/ℚ}SL_n(D), of rational rank n−1, the minimum is at least [(n−1)/4]′, that is, it is ≥q whenever 4q<n−1.

Root systems, relative root systems with multiplicities and their behaviour under restriction of scalars are those of the structure theory of reductive groups over a field. (3) rests on the values of m for the simple real Lie algebras, which are tabulated in the literature cited by Borel.

(1) For A_n the coefficient of the simple root α_i in r is i(n+1−i)/2 and d₀ is the sum of the simple roots, so the condition is p<n/2. The other types are read from the tables of root systems (Borel 1974 9.1(3)); the same computation gives c(B_n)=n−2 and c(C_n)=[n/2]′. (2) Reduce to H almost k-simple. The character 2ρ_P contains every term of 2r with coefficient at least m, and p·d₀−ν is a nonnegative combination of simple roots for every sum ν of p roots; this gives the first inequality, and the table gives the second. Restriction of scalars multiplies multiplicities by the degree. A minimal parabolic over k contains one over k″ after extension, which gives the last inequality. (3) is read from the tables of Matsushima and of Kaneyuki–Nagano. (4) Up to isogeny G=Res_{k/ℚ}G′ with G′ absolutely simple over a number field k, and G(ℝ) is the product of the G′(k_v). Each k_v-rank is at least the k-rank of G′, which is the ℚ-rank of G; apply (2) and (3).

Use relative root systems with multiplicities for a connected semisimple group over a characteristic-zero field, not merely the absolute split root system. The restriction-of-scalars formula multiplies the relevant multiplicities by the extension degree. In the B_n formula n≥2 is required: B₁ is A₁ and is treated by that identification, not by substituting n=1 into n−2.

The root-system invariant has API `rootBound_simple`, `rootBound_product`, `rootBound_typeA` and `rootBound_multiplicity`; `arithmeticBound_rank`, statement (4), combines it with the analytic constant. The strict-part expression is the native ceiling minus one, not a new definition.

**Checks.**

- For A₁ the root bound is 0, since p<1/2; for B₂ it is 0, and for C₂ it is the strict integer part of 1, again 0. B₁ is treated as A₁.
- The strict integer part of 1 is 0, while that of 5/4 is 1. Replacing it by floor gives a false endpoint at integral arguments.
- For q=2 the sufficient arithmetic bound 4q<n−1 holds at n=10 and fails at n=9.
- Rank zero has no proper rational parabolic and the minimum defining the cusp bound is ∞; it is not forced to be −1 by the coarse rank estimate.

The bound is a lower bound; no claim is made that it is sharp.

Use Borel 1974, §0.1, p.237; §9.1–9.5, pp.261–262.

*Needs:* §3.5, §3.4, §1.1; the arithmetic and geometric contracts above.

### 3.7 Borel’s arithmetic stable-range comparison

For an order O in a central division algebra D over a number field F, n≥2 and q≥0 with 4q<n−1 (`arithmeticComparison_stableRange`), the map j_{Γ_n}:H^q(g_n,k_n;ℝ)→H^q(SL_n(O);ℝ) of Layer 2 is an isomorphism. More generally, for a connected semisimple ℚ-group G and an arithmetic subgroup Γ, j_Γ^q:I_G^{Γ,q}→H^q(Γ;ℝ) is injective for q≤c(G) and surjective for q≤min(c(G),m(G(ℝ))), with the constants of logGrowthForms_quasiIso and invariantForms_bijective_of_squareIntegrable. Since G_n is almost ℚ-simple of rational rank n−1 and G_n(ℝ) is connected, min(c(G_n),m(G_n(ℝ)))≥[(n−1)/4]′, the greatest integer strictly smaller than (n−1)/4; so the strict inequality 4q<n−1 is what the proof gives.

O is any order of D; Γ_n=SL_n(O) is arithmetic in G_n=Res_{F/ℚ}SL_n(D) by Layer 1. For the general statement G is a connected semisimple ℚ-group and Γ⊂G(ℚ) is arithmetic.

Choose a torsion-free normal subgroup Γ′ of finite index in Γ and let C be the complex of forms with logarithmic growth for Γ′; it is stable under Γ/Γ′. Choose Γ′ inside G(ℝ)° and use the component convention of Layer 2. By logGrowthForms_quasiIso, C computes H^*(Γ′;ℝ), consists of square-integrable forms in degrees ≤c(G) and contains the invariant forms. If c(G) is finite, apply criterion (c) with the positive real cutoff m′=c(G)+1/2; this has exactly the same allowed integer degrees, even when c(G)=0. If c(G)=∞, choose a finite positive cutoff at least as large as the desired degree. Descend through Γ/Γ′-invariants; degree zero also follows directly from constants. For G_n use arithmeticBound_rank with rank_ℚ G_n=n−1 from Layer 1.

For q=2 this gives n≥10, not n=9; for q=0 it is H⁰=ℝ for every n≥2.

Use Borel 1974, Theorem 7.5, p.259; §9.5(3), p.262; §11.5, p.268.

*Needs:* §2.2, §1.1, §3.4, §3.5, §3.6; the arithmetic and geometric contracts above.

### 3.8 Stable cohomology of division-order arithmetic groups

For Γ∞=colim_n SL_n(O) (`arithmeticCohomology_stableExterior`), H*(Γ∞;R) is the graded exterior algebra with r1 independent generators in every degree 4a+1 (a≥1) and r2 independent generators in every degree 2a+1 (a≥1). The comparison is compatible with block-sum Hopf structures. Each cohomological degree is finite-dimensional and stationary; the inverse limit is taken degree by degree and then summed as a graded algebra, not as a completed product across degrees.

O any order in a central division algebra over F; r1 and r2 are the signature of F, independent of archimedean ramification of D.

Fix q and choose n with 4q<n−1 and n≥2q+3, so that both the arithmetic comparison and compact-dual stability hold in degrees ≤q. By Layer 2 and compactDual_stableExterior, H^q(SL_n(O);ℝ) is the degree-q part of the tensor product over the archimedean places of the stable rings of the compact duals (Künneth, AlgebraicTopology Stage 5): r₁ factors Λ(y₅,y₉,…), counting split and quaternionic real places alike, and r₂ factors Λ(x₃,x₅,…). Group homology commutes with the filtered union SL(O)=⋃SL_n(O) (the filtered-union group-homology comparison); dualising the finite-dimensional stable groups degree by degree gives the graded cohomology, as in Borel Theorem 11.1.

In degree 10, a wedge of two independent degree-five generators can be nonzero; it is decomposable and does not contribute to the K-group rank.

Use Borel 1974, Theorem 11.1 and §11.5, pp.266,268.

*Needs:* §3.3, §3.7, §2.4; the arithmetic and geometric contracts above.

### 3.9 Stable SL and GL primitive comparison

Use stable block inclusions to form GL(A) for any unital ring A, and its perfect stable elementary subgroup E(A). Define BGL(A)^+ with respect to E(A), with π₁=GL(A)/E(A) and an integral-homology equivalence BGL(A)→BGL(A)^+. Define K_i(A)=π_i(BGL(A)^+) for i≥1, using the supplied projective-module K₀ in degree zero. Construct the Quillen Q-category of finitely generated projective A-modules and prove the plus/Q equivalence, including naturality. Block sum supplies the group-like homotopy-commutative H-space structure and its agreement with direct sum. These are the local higher K-theory targets used here (Weibel IV §1.1–1.10, pp.2–9; Quillen §1, pp.179–184).

The API includes `higherK_map`, its identity and composition laws, `higherK_plusQ`, `higherK_blockSum`, `stableElementary_perfect`, the integral-homology equivalence of the plus map, and its universal-cover identification.

**Checks.**

- K₀ of a field is ℤ via dimension, and K₁ of a field is its multiplicative group via determinant; replacing K₁ by the reduced-norm-one subgroup fails this check.
- E(A) is generated by stable elementary matrices: an elementary transvection with coefficient 1 lies in it, while diag(2,1,…) over ℚ has nontrivial determinant and does not.
- For the trivial ring with 0=1 the stable GL group and its positive K-groups are trivial. For an arbitrary group, a plus construction killing a nonperfect subgroup is not covered by this definition.

For a unital order O as in Layer 1, let E(O) be the stable elementary subgroup of GL(O), with SL(O) defined by reduced norm one. Prove E(O)=[GL(O),GL(O)]=[SL(O),SL(O)], and E(O) perfect. The quotient SL(O)/E(O) is torsion abelian, and E(O)→SL(O) induces an isomorphism on real homology, compatible with block products. Include `stableSL_to_plus_hopf` for this compatibility. This is the stable group comparison; the higher K-group primitive identification is the next subsection.

K_i(O) is π_i(BGL(O)⁺), identified with Quillen's Q-construction by `higherK_plusQ`. The stable cohomology of Layer 3 is used in degree one: H¹(SL_n(O);ℝ)=0 for n>5.

Whitehead's lemma gives E(O)=[GL(O),GL(O)], perfect (`stableElementary_perfect`). Hence [SL(O),SL(O)]=E(O) and SL(O)/E(O)=H₁(SL(O);ℤ). The stable exterior algebra has no generator in degree one, so H₁(SL(O);ℝ)=0 and SL(O)/E(O) is a torsion abelian group; its real homology vanishes in positive degrees. A torsion abelian group is the filtered union of its finite subgroups; their positive-degree real homology vanishes, and the filtered-union group-homology comparison gives the claimed vanishing for the union. BE(O)⁺ is the universal cover of the connected H-space BGL(O)⁺. The lifted H-space multiplication and the homotopy of each deck transformation to the identity, natural under block maps, are proved by the universal-cover argument below. The induced SL(O)/E(O) action on H_*(E(O);ℝ) is trivial by the equivariant plus homology identification. The extension spectral sequence therefore gives H_*(E(O);ℝ)≅H_*(SL(O);ℝ), compatible with the directly defined SL block product. For i≥2 the covering identifies the homotopy groups; the rational Hurewicz step is §3.10.

The required local topological input is this: a connected CW H-space with a unit has an H-space universal cover, and every deck transformation of that cover is homotopic to the identity. For X=BGL(O)^+ identify that cover with BE(O)^+ and compare it with BE(O) by the integral-homology equivalence of the plus construction. The deck action on real homology is therefore trivial. Combine it with the LHS spectral sequence for E→SL→SL/E and the real acyclicity of the torsion abelian quotient. The plus construction is taken with respect to the specified perfect elementary subgroup; it is not applied to an arbitrary subgroup without perfectness (Weibel IV §§1.1–1.8, pp.2–7; Borel 1974 §12.1, pp.270–271).

For i=1 no rank assertion is made: the central unit contribution is not detected by stable SL cohomology. The proof uses H¹(SL(O);ℝ)=0 from the stable computation, not a separate finiteness theorem for SK₁.

Use Borel 1974, §12.1, p.270.

*Needs:* §3.8, §2.4; the arithmetic and geometric contracts above.

### 3.10 Rational Hurewicz and arithmetic indecomposables

For an order O as in Layer 1 and i≥2 (`arithmeticK_rationalHurewicz`), dim_ℝ(K_i(O)⊗ℝ) is the number of generators of degree i of the stable exterior algebra H^*(SL(O);ℝ). Indeed K_i(O)⊗ℝ is the degree-i primitive part of H_*(SL(O);ℝ), and in each degree the primitive part of a connected Hopf algebra of finite type is dual to the indecomposable quotient QH^i=H^i/(products of classes of positive degree) of the dual algebra; for an exterior algebra on generators of odd degree QH^i has the generators of degree i as a basis. No finite generation of K_i(O) is used.

The Cartan–Serre theorem is used in the form for path-connected H-spaces of finite rational type, the rational Hurewicz theorem of §3.10; a Hurewicz theorem for simply connected spaces in the first nonvanishing degree does not suffice.

Apply rational Hurewicz to BE(O)^+ and then use the real homology comparison with SL(O) from §3.9. Each H_i(SL(O);ℝ) is finite-dimensional by the stable computation, so primitives of H_* are the annihilator of the decomposables of H^*. For the exterior algebra of arithmeticCohomology_stableExterior, the decomposables in degree i are spanned by products of at least two generators, and the quotient has the degree-i generators as basis.

Construct rational Hurewicz for a connected homotopy-commutative CW H-space with finite-dimensional real homology in each degree: π_i(X)⊗ℝ identifies with the primitive part of H_i(X;ℝ) for i≥2, naturally for H-space maps. Use the universal-cover statement of the previous subsection when X is not simply connected. Under degreewise finite duality, these primitives are dual to indecomposables of cohomology. The claim is not that all positive cohomology classes are primitive (Borel 1974 §10.6, pp.265–266; Burgos §3.4, pp.20–22).

In degree 10 the stable cohomology of SL(O_F) for a field with r₁+r₂≥2 is nonzero (products of two distinct generators of degree 5), but QH^{10}=0 and K_{10}(O_F)⊗ℝ=0. Finite generation of K_i(O) is not among the prerequisites.

Use Borel 1974, §10.6(3), pp.265–266; §12.1, p.270.

*Needs:* §3.9, §2.4, §3.8; the arithmetic and geometric contracts above.

### 3.11 Borel’s rank theorem for division-algebra orders

For any order O in a finite-dimensional central division algebra over a number field F and i≥2 (`divisionOrder_borelRank`), dim_R(K_i(O)⊗_Z R) is 0 if i≡0 or 2 mod4, r1+r2 if i≡1 mod4, and r2 if i≡3 mod4. In particular the answer is independent of the degree and real ramification of D. No assertion about integral torsion or K1 is part of this theorem.

O is any order of D, maximal or not.

Combine Layer 3 arithmeticK_rationalHurewicz with the degreewise stable exterior algebra. Real and quaternionic factors each contribute one generator in degrees 5,9,…; complex factors contribute one in 3,5,…. Read the period-four pattern with the explicit lower cutoff i≥2.

For F totally real the rank in degree 3 is zero; degree 5 has rank [F:Q].

Use Borel 1974, Proposition 12.2, p.271.

*Needs:* §3.10; the arithmetic and geometric contracts above.

### 3.12 Borel’s odd K-group rank theorem

For a number field F and j≥2, dim_ℚ(K_{2j−1}(O_F)⊗ℚ)=d_j(F), where d_j(F)=r₁+r₂ when j is odd and r₂ when j is even; and K_i(O_F)⊗ℚ=0 for even i≥2. The rank of an abelian group means the dimension after tensoring with ℚ; the statement asserts neither finite generation nor discreteness of a regulator image. The same holds for every order of F.

j≥2; O_F is the ring of integers of F.

Specialize the division-order theorem to D=F, O=O_F and i=2j−1. Compare Q- and R-dimensions by scalar extension of a finite-dimensional rational vector space. Use the parity of j to distinguish i≡1 and 3 mod4.

Prove the following basic identities and compatibility maps.

- `borelRankTheorem_odd`: If j≥2 is odd, dim_Q K_{2j−1}(O_F)⊗Q=r1+r2.
- `borelRankTheorem_even`: If j≥2 is even, dim_Q K_{2j−1}(O_F)⊗Q=r2.
- `borelRankTheorem_scalarExtension`: The Q-rank equals dim_R(K_{2j−1}(O_F)⊗R).
- `borelRankTheorem_order`: The corresponding odd-rank statement holds for every commutative order in F by divisionOrder_borelRank, without an unproved integral K-isomorphism.
- `borelRankTheorem_evenDegree`: For even i≥2, K_i(O_F)⊗ℚ=0.

Also prove `quillen_finiteGeneration`: for O_F and every i≥0, K_i(O_F) is finitely generated; the same holds for rings of S-integers with S finite. For the proof filter the Q-category by projective rank. Quillen's Theorem 3, pp.181–182, gives the rank-filtration homology exact sequence with summands H_*(Aut(P);St(P⊗F)); in each rank there are finitely many projective isomorphism classes by the ideal-class description. Apply §1.5 to these terms, then the rank filtration and the finite-generation passage from the homology of the relevant simply connected loop/cover space to its homotopy groups (Quillen §1, proof of Theorem 1, pp.182–185). For S-integers use localisation and finite residue-field K-groups. The source extends this argument to maximal orders in semisimple algebras (Remark (4), p.180); no finite-generation assertion for every nonmaximal noncommutative order is needed here.

Rational localisation is a separate K-theoretic input: for a number field and i≥2 the inclusion O_F→F induces K_i(O_F)⊗ℚ≃K_i(F)⊗ℚ, since the positive K-groups of finite residue fields are torsion. The localisation sequence and finite-field torsion theorem precede this assertion; they do not use a regulator. Finite generation applies to O_F (and finite-S rings), not to F (Quillen Theorem 1, pp.179–181; Weibel IV Theorems 1.17–1.18, p.12, with both sides rationalised).

For a concrete negative control, K₂(ℚ) surjects onto ⊕_p 𝔽_p×: in localisation the following map K₁(ℤ)→K₁(ℚ) is injective. The direct sum is infinite, although its rationalisation is zero. This rules out integral field finiteness and any formula that rationalises only the left side of the comparison.

**Checks.**

- dim_Q(K3(Z)⊗Q)=0.
- dim_Q(K5(Z)⊗Q)=1.
- For [F:Q]=2, r1=0 and j≥2, the odd K-group rank is one.
- The theorem cannot be applied at j=1: rank K1(O_F)=r1+r2−1.
- dim_ℚ(K₂(ℤ)⊗ℚ)=0 and dim_ℚ(K₄(O_F)⊗ℚ)=0 for every number field F.

For F=ℚ, j=2 gives rank zero and j=3 gives rank one. For an imaginary quadratic F, every j≥2 gives rank one. For a finite set S, localisation gives the same ranks for O_F[S⁻¹] in degrees i≥2; degree one also has the S-unit contribution.

Use Borel 1974, Proposition 12.2, p.271.

*Needs:* §3.11; the arithmetic and geometric contracts above.

### Examples

For F=ℚ the higher odd ranks alternate: K₃ has real rank zero, K₅ has rank one, K₇ has rank zero and K₉ has rank one. For an imaginary quadratic field every odd degree at least three has rank one. If r₁≥2, the wedge of two degree-five primitive classes is a nonzero degree-ten decomposable stable cohomology class even though K₁₀ has rank zero. At degree two the sufficient rank bound is n≥10, with n=9 excluded by the strict inequality.

### Dependencies

Layers 1–2; LieGroups compact forms and Cartan decomposition; AlgebraicTopology spectral sequences and H-space homology; relative-root multiplicities; the local analytic, plus-construction, rational Hurewicz and localisation inputs specified here.

## Layer 4: Archimedean regulators and their lattices

### 4.1 The embedding-conjugation regulator target

For a number field F and j≥2 let Σ_F=Hom(F,C), R(q)=(2πi)^q R and V_j(F)=(∏_{σ∈Σ_F}R(j−1))^conj, where conj acts simultaneously on coefficients and embeddings. After dividing each component by (2πi)^{j−1}, identify this with the real submodule of functions f:Σ_F→R satisfying f(σ̄)=(−1)^{j−1}f(σ). The submodule is defined for any function c:S→S by the same linear equations; the finite-involution case gives the coordinate theorem. For a number field use Mathlib's conjugation of complex embeddings.

F number field; j≥2. The coefficient twist is part of the definition.

Use the pinned finite embedding set and involutive_conjugate. Take the simultaneous fixed subspace; express it as a real submodule by the displayed coordinate equation. Identify coefficient R(j−1) with R through its specified generator.

Prove the following basic identities and compatibility maps.

- `archimedeanTarget_mk`: A function satisfying f(σ̄)=(−1)^{j−1}f(σ) determines a target element.
- `archimedeanTarget_ext`: Two elements are equal iff their evaluations at every σ agree.
- `archimedeanTarget_conjugate`: Evaluation at σ̄ is (−1)^{j−1} times evaluation at σ.
- `archimedeanTarget_fixed_even`: At a conjugation-fixed embedding, every target element is zero if j is even.
- `archimedeanTarget_twist`: Multiplication by (2πi)^{j−1} identifies the real-function model with the simultaneous fixed subspace in ∏R(j−1).
- `archimedeanTarget_reindex`: An involution-equivariant bijection of embedding sets induces a real linear equivalence, with identity and composition laws.
- `archimedeanTarget_real_even` and `archimedeanTarget_empty`: The one-point identity target at weight two is zero; the empty-set target is zero for every natural weight, including zero. Only the regulator interpretation requires j≥2.

**Checks.**

- On a one-point embedding set with identity involution and j=2, the target is zero.
- On a two-point exchanged pair at j=2, the function (1,−1) is in the target and (1,1) is not.
- On a fixed point at j=3, the constant function 1 belongs to the target.
- For an empty embedding set the target is the zero submodule in every weight.

A real embedding contributes only if j is odd. Counting complex embeddings independently would double the target dimension.

Use Burgos, Proposition 9.22 and Corollary 9.23, pp.84–85.

*Needs:* the exact supplier contracts above.

### 4.2 Coordinates and integral reference lattice

Choose one complex embedding above each complex infinite place; real places have their unique real embedding. Let I_j(F) consist of all complex infinite places and the real infinite places only when j is odd. Evaluation at the chosen embeddings gives `targetCoordinates` c_j:V_j(F)≃_R R^{I_j(F)}, with inverse reconstructing the conjugate coordinate by (−1)^{j−1} and putting zero at omitted real places. Define the reference Z-lattice c_j⁻¹(Z^{I_j}) and transport coordinate product Haar measure so that its covolume is one. The ambient Euclidean fixed-subspace metric is not the measure convention.

The selection is explicit data; changing a complex representative changes its coordinate by (−1)^{j−1}.

Use InfinitePlace.mk_eq_iff to split each embedding fiber into a singleton or conjugate pair. Define evaluation and reconstruction and prove both inverses. Use Mathlib's ℤ-span, IsZLattice and covolume; transport the coordinate volume through c_j.

Prove the following basic identities and compatibility maps.

- `targetCoordinates_apply`: In the model by real functions, c_j(x)(v)=x(σ_v). Starting from the complex Tate model, first use archimedeanTarget_twist to divide by the fixed generator (2πi)^{j−1} exactly once, then evaluate; no second division occurs in c_j.
- `targetCoordinates_symm`: Reconstruction uses x_v at σ_v and (−1)^{j−1}x_v at σ̄_v, with zero at even-weight real places.
- `targetCoordinates_inverse`: Evaluation and reconstruction are mutually inverse real linear maps.
- `targetCoordinates_change`: Changing selected representatives gives a diagonal matrix with entries ±1 and absolute determinant one.
- `targetCoordinates_reference`: The inverse image of Z^{I_j} is discrete, spans V_j and has covolume one for the transported coordinate measure.
- `targetCoordinates_ext`: Agreement on the chosen coordinates determines a target element.

**Checks.**

- At weight two one exchanged pair has coordinate a and reconstruction (a,−a).
- For F=Q and j=2 the coordinate space is R^0 and the reference lattice has covolume one.
- Switching the embedding of an imaginary quadratic field at j=2 multiplies the single coordinate by −1 and preserves its absolute covolume.

Each conjugate pair has reference covolume one, not √2.

Use Burgos, Proposition 9.22, p.85, including its lattice statement.

*Needs:* §4.1; the exact supplier contracts above.

### 4.3 Dimension of the conjugation target

For every number field F and j≥2, dim_R V_j(F)=d_j(F)=r1+r2 if j is odd and r2 if j is even. The integral reference lattice has the same Z-rank. The proof uses conjugation-fixed real embeddings and one independent coordinate for each exchanged complex pair.

r2 counts conjugate pairs, using the pinned InfinitePlace definition.

Apply targetCoordinates and count I_j(F). Use the pinned real/complex-place cardinalities and embedding-fiber classification. Check that even-weight real coordinates vanish because a=−a over R.

For totally real F and j=2 the target dimension is zero.

Use Burgos, Proposition 9.22 and the dimension discussion in §9.2.

*Needs:* §4.2; the exact supplier contracts above.

### 4.4 The normalized universal Borel class

For j≥2 and N in the classical stable range, Bo_j∈H_cont^{2j−1}(GL_N(C),R(j−1)) is Burgos’s Definition 9.24 class: suspend ch_j in H^{2j}(BGL_N(C),R(j)), restrict to U_N, identify invariant forms on U_N\(U_N×U_N), identify the same complex relative cochain with coefficients R(j−1), and apply inverse van Est. The twist generator and suspension normalization are fixed by ch_j=(2πi)^j pr_j/j!, with the integral Bott/Hurewicz normalization from topological K-theory. The class restricts compatibly with N and is primitive.

GL_N(ℂ) is regarded as a real Lie group with maximal compact subgroup U_N. N lies in the stable range for degree 2j; N≥2j suffices, since the generator of degree 2j−1 of H^*(U_N;ℝ) and the class ch_j on BGL_N(ℂ) are stable from N≥j on. The identification of the coefficient lines ℝ(j) and ℝ(j−1) is the one of Burgos Definition 9.24: both relative cohomology groups are the same real subspace of the cohomology with complex coefficients.

Take ch_j=(2πi)^j pr_j/j! and suspend it to U_N (the topological Chern-character input below). For the Bott homotopy generator ε_j and an integral primitive homology generator β_j, Hurewicz sends ε_j to ±(j−1)!β_j, whereas suspended ch_j evaluates as ±(2πi)^j/(j−1)! on β_j. Thus its value on ε_j is one signed Tate unit ±(2πi)^j, not (j−1)!. These suspension and Hurewicz identifications are supplied by the topological K-theory input below; fix the sign by the chosen Bott orientation (Burgos Theorem 4.24 and Remark 4.25, p.32). Restrict to U_N and represent the class by a bi-invariant form on U_N=U_N\(U_N×U_N), that is, by a relative Lie algebra cochain for (u_N⊕u_N,u_N); pass to (gl_N(ℂ),u_N) with the twisted coefficient line, and apply the inverse of the van Est isomorphism (the invariant-form and van Est comparison of Layer 2). Independence of N and primitivity follow from the stable cohomology of the compact dual of GL_N(ℂ) and its block-sum maps (Layer 3, Layer 2).

Prove the following basic identities and compatibility maps.

- `universalBorelClass_stabilize`: Block pullback Bo_j,N+1=Bo_j,N in the common stable range.
- `universalBorelClass_primitive`: Block sum pulls Bo_j back to pr1*Bo_j+pr2*Bo_j.
- `universalBorelClass_conjugation`: Complex conjugation and the Tate generator yield component parity (−1)^{j−1} on regulator values.
- `universalBorelClass_vanEst`: Van Est sends Bo_j to the relative class obtained from the suspended normalized ch_j.
- `universalBorelClass_bott`: With compatible Bott orientation, ⟨s(ch_j),ε_j⟩=(2πi)^j. The Hurewicz image of ε_j is ±(j−1)! times an integral primitive homology generator, on which s(ch_j) has the reciprocal factorial; the homotopy pairing is one Tate unit.
- `universalBorelClass_representation`: For an algebraic representation ρ:GL_N→GL_M over ℂ, ρ^*Bo_{j,M}∈H_cont^{2j−1}(GL_N(ℂ);ℝ(j−1)) is the image of ch_j of the bundle associated with ρ on BGL_N(ℂ) under the same chain of maps; it is additive in ρ, so it is defined on the representation ring.

Construct the stable Chern character, its suspension and this Bott/Hurewicz normalisation before invoking them here (Burgos Theorem 4.24 and Remark 4.25, p.32; Definition 9.24, pp.86–87).

**Checks.**

- At j=2, block pullback from GL_11(C) to GL_9(C) gives the same degree-three class.
- Restriction to GL_1(C) has zero degree-three continuous class.
- On indecomposables ch_3=(2πi)^3 c_3/2, so using c_3 without its factor cannot satisfy the normalization.
- For j=3 the pairing of suspended ch₃ with the compatibly oriented Bott generator, divided by (2πi)³, is 1; the Hurewicz factorial is 2 and must not be substituted for that pairing.

Use Burgos, Definition 9.24 and Remark 4.25, pp.86–87,32.

*Needs:* §3.2, §2.4; the exact supplier contracts above.

### 4.5 Alternating trace representative

For j≥2 and m=2j−1, define Φ_m(X_1,…,X_m)=c_j∑_{s∈S_m}sgn(s)Tr(X_{s(1)}⋯X_{s(m)}), where c_j=(−1)^{j−1}(j−1)!/(2j−1)!, on complex square matrices. Regard the Lie algebra as real. The relative Borel representative is Φ_m(X_1†+X_1,…,X_m†+X_m); its absolute Lie cohomology class has invariant representative 2π_{j−1}Φ_m, with π_q(z)=(z+(−1)^q z̄)/2. These are equal as cohomology classes after relative-to-absolute inclusion, not pointwise as cochains.

Finite matrix size N; trace and conjugate transpose are Mathlib's. The alternating-sum expression is defined for every natural j, including the empty input length at j=0; the cocycle and regulator assertions here require j≥2.

Use Mathlib's sign of a permutation and matrix trace to define the alternating sum. Use trace cyclicity and conjugate transpose to verify real multilinearity, alternation and the coefficient-line condition. Apply Burgos Propositions 9.25–9.26 to the relative and invariant absolute representatives.

Prove the following basic identities and compatibility maps.

- `traceCocycle_alternating`: Permuting the inputs multiplies Φ by the permutation sign; repeated inputs give zero.
- `traceCocycle_multilinear`: Φ is complex multilinear before real-coefficient projection, and its relative and projected forms are real multilinear.
- `traceCocycle_block`: On block-diagonal inputs Φ is the sum of the forms on the two blocks; adding a zero block leaves it unchanged.
- `traceCocycle_three`: Φ3(X,Y,Z)=−Tr(X(YZ−ZY))/2.
- `traceCocycle_hermitian`: For j≥2 and Hermitian inputs X_a of any finite matrix size, Φ_{2j−1}(X_1†+X_1,…,X_m†+X_m)=2^mΦ_m(X_1,…,X_m), where m=2j−1. No tracelessness or positivity of the inputs is required.
- `traceCocycle_projection`: π_q is the real-linear projection onto R(q)⊂C; the absolute Borel class is represented by 2π_{j−1}Φ.
- `traceCocycle_scalar`: For j≥2, if every pair of input matrices commutes, Φ_{2j−1}=0, for every finite matrix size.

The real Tate projection also has its own API: `tateProjection_realLinear`, `tateProjection_range`, `tateProjection_idempotent` and `tateProjection_kernel`. Its image is ℝ(q), its kernel the complementary real axis ℝ(q+1), and it commutes with conjugation. The denominator 2 makes this a projection, not twice a projection. The generator (2πi)^q is nonzero because π>0. Name the Pauli-coordinate identity `tateProjection_weight_two_coordinates`: Φ₃=−2i gives the absolute Borel representative value 2π₁Φ₃=−4i and the absolute Beilinson representative value π₁Φ₃=−2i; division by 2πi gives −2/π and −1/π, respectively.

For the same Hermitian Pauli triple the relative Borel representative instead has value 2³Φ₃=−16i, and its Tate coordinate is −8/π. The three values are compared on the same real Lie algebra inputs:

| Representative | Formula at weight two | Pauli value | Value divided by 2πi |
|---|---|---|---|
| Relative Borel | Φ₃(X†+X,Y†+Y,Z†+Z) | −16i | −8/π |
| Invariant absolute Borel | 2π₁Φ₃(X,Y,Z) | −4i | −2/π |
| Invariant absolute Beilinson | π₁Φ₃(X,Y,Z) | −2i | −1/π |

The relative Borel form is the one to transport to the symmetric space by invariant forms and then integrate. Its inclusion into absolute cohomology agrees with the absolute Borel representative in the table. The unequal cochain values therefore do not change the factor two between the Borel and Beilinson classes. In particular, substituting the absolute value −4i for the relative value −16i in a symmetric-space tangent calculation loses a factor four.

**Checks.**

- π₀(1)=1 and π₀(i)=0.
- π₁(1)=0 and π₁(i)=i.
- π₂(1)=1 and π₂(i)=0.
- For N=1 and j=2 the form vanishes on every triple.
- For the Hermitian Pauli matrices X,Y,Z with [Y,Z]=2iX and Tr(X²)=2, Φ3(X,Y,Z)=−2i.
- For that triple, replacing each input by X†+X doubles each of the three arguments, giving −16i rather than −4i. Swapping X and Y reverses all the displayed values; repeating an input gives zero.
- Φ3(X,X,Z)=0, ruling out the unalternated trace product.

At j=2, Φ3(X,Y,Z)=−Tr(X[Y,Z])/2.

Use Burgos, §9.7, Propositions 9.25–9.26, pp.87–88.

*Needs:* §4.4; the exact supplier contracts above.

### 4.6 Embedding pullback and trace on targets

For a finite extension f:F→E define pull_f:V_j(F)→V_j(E) by (pull_f x)_τ=x_{τ∘f}, and Tr_f:V_j(E)→V_j(F) by (Tr_f y)_σ=∑_{τ∘f=σ}y_τ. Both are real linear and preserve conjugation parity. Every complex embedding σ has exactly [E:F] extensions, hence Tr_f∘pull_f=[E:F]·id. Coordinate matrices are obtained only after targetCoordinates; they are not obtained by discarding the conjugate member of each fiber.

F,E number fields and f a field embedding; coefficients use the same Tate generator.

Use finite embedding fibers and conjugation-equivariance of restriction. Define precomposition and fiberwise sum, retaining all complex embeddings. Use the separable embedding-extension count from number-field embedding theory.

Prove the following basic identities and compatibility maps.

- `embeddingPull_apply`: (pull_f x)_τ=x_{τ∘f}.
- `embeddingTrace_apply`: (Tr_f y)_σ is the sum over the full embedding fiber above σ.
- `embeddingPullTrace_id`: Pullback and trace along identity are identity.
- `embeddingPullTrace_comp`: Pull_{g∘f}=pull_g∘pull_f and Tr_{g∘f}=Tr_f∘Tr_g.
- `embeddingTrace_pull`: Tr_f∘pull_f=[E:F]·id.
- `embeddingPullTrace_conjugate`: Both maps preserve the defining conjugation parity and therefore land in the fixed targets.

**Checks.**

- For f=id both maps are identity in every weight.
- For Q⊂Q(i) at j=3, the one-coordinate pull matrix is (1) and the trace matrix is (2).
- For Q⊂Q(i) at j=2 the trace to the zero target V2(Q) is zero; summing the pair (a,−a) gives zero.

Use Burgos, Proposition 9.21 and the product target of Proposition 9.22.

*Needs:* §4.1, §4.2; the exact supplier contracts above.

### 4.7 The normalized Borel regulator

For a number field F and j≥2 the Borel regulator r_Bo:K_{2j−1}(F)→V_j(F) has σ-component, for each embedding σ:F→ℂ, the composite of K_{2j−1}(σ), the Hurewicz map K_{2j−1}(ℂ)=π_{2j−1}(BGL(ℂ)⁺)→H_{2j−1}(GL(ℂ);ℤ), and the pairing with the restriction of Bo_j to the discrete group GL_N(ℂ), with values in ℝ(j−1). The components satisfy the conjugation condition, so r_Bo lands in V_j(F). The arithmetic regulator r_Bo:K_{2j−1}(O_F)→V_j(F) is the composite with K_{2j−1}(O_F)→K_{2j−1}(F). The normalisation is Burgos's renormalised one, not that of Borel's original lattice.

j≥2. K-groups are those of the higher K-theory functor of §3.9, identified with homotopy groups of BGL⁺ by the plus/Q comparison of §3.9, and H_*(BGL(R)⁺;ℤ)=H_*(GL(R);ℤ) by the integral-homology property of the plus map in §3.9. The pairing uses the group homology of the discrete group GL_N(ℂ), stably in N.

For each σ, map K_{2j−1}(F) to K_{2j−1}(ℂ), apply Hurewicz and pair with the image of Bo_j under arithmeticRestriction for the discrete group GL_N(ℂ); stability in N is universalBorelClass_stabilize. Complex conjugation acts on GL_N(ℂ) and on the coefficient line; universalBorelClass_conjugation gives r_{σ̄}=(−1)^{j−1}r_σ in real coordinates, which is the defining condition of V_j(F). Additivity follows from primitivity of Bo_j. The map K_{2j−1}(O_F)⊗ℚ→K_{2j−1}(F)⊗ℚ is an isomorphism by rational localisation in §3.12.

Prove the following basic identities and compatibility maps.

- `borelRegulator_embedding`: The σ-component equals r_Bo,C∘K(σ).
- `borelRegulator_add`: r_Bo is an additive homomorphism; it kills every torsion element.
- `borelRegulator_integral`: r_Bo on K_{2j−1}(O_F) is r_Bo on K_{2j−1}(F) composed with the map induced by O_F⊂F, which is an isomorphism after tensoring with ℚ (rational localisation, §3.12).
- `borelRegulator_conjugation`: In real Tate coordinates r_σ̄=(−1)^{j−1}r_σ.
- `borelRegulator_natural`: For a field embedding f:F→E, r_E∘f*=pull_f∘r_F, with identity and composition laws.
- `borelRegulator_pairing`: Pairing with Bo_j equals the corresponding component regulator on the Hurewicz image of every K-theory class.
- `borelRegulator_equiv`: A number-field isomorphism gives the regulator square with the induced bijection of complex embeddings.

**Checks.**

- r_Bo:K3(Z)→V2(Q) is zero because the target is zero.
- For any nonzero integer a with a·x=0, r_Bo(x)=0.
- At weight two over an imaginary quadratic F the two components are (a,−a), not (a,a).

This construction alone does not assert a lattice or finite generation.

Use Burgos, Definitions 9.19,9.24 and Proposition 9.21, pp.84–86.

*Needs:* §4.4, §4.1, §2.1; the exact supplier contracts above.

### 4.8 Regulator naturality and finite-extension transfer

Construct transfer K_i(B)→K_i(A) for a ring map A→B with B finitely generated projective over A, using restriction of projective modules. Its API includes identity and tower laws and compatibility with flat base change. For finite separable fields and an embedding σ:F→ℂ, the split algebra E⊗_{F,σ}ℂ is a product of [E:F] copies of ℂ; transfer followed by K(σ) is the sum of the maps for all extending embeddings. For O_F→O_E, finite projectivity holds even at ramified primes; compare this transfer with field transfer by localisation. These are targets with precisely that finite-projective hypothesis (Weibel IV §2, transfer construction and base change, pp.14–17; Burgos Proposition 9.21, p.85).

For a finite number-field extension f:F→E and j≥2, r_E∘f*=pull_f∘r_F and r_F∘f_*=Tr_f∘r_E on higher K-groups of fields, where f_* is restriction-of-scalars transfer. Thus r_F∘f_*∘f*=[E:F]r_F. The same formula for rings of integers uses their finite projective transfer and compatibility with localization; no unramified hypothesis is added to this field-level formula.

The transfer f_* is the transfer of the local K-theory interface for the finite extension E/F (and for the finite projective O_F-module O_E); no hypothesis on ramification is made.

Naturality: r_E∘f^*=pull_f∘r_F holds componentwise, since τ∘f is an embedding of F for every embedding τ of E. Transfer: for an embedding σ of F, `higherK_transfer_split` applied to F′=ℂ gives K(σ)∘f_*=Σ_τ K(τ), the sum over the [E:F] embeddings τ of E extending σ, because E⊗_{F,σ}ℂ is a product of copies of ℂ indexed by those τ, each of length one. Pairing with Bo_j, which is additive, gives the σ-component of Tr_f∘r_E. For rings of integers the transfer along O_F→O_E commutes with localisation after tensoring with ℚ (the localisation/transfer comparison of §3.12).

An even-weight real target receives the sum of a conjugate pair, which is zero.
Name the transfer API `higherK_transfer_id`, `higherK_transfer_comp`, `higherK_transfer_baseChange` and `higherK_transfer_split`. The finite-projective condition is essential.

**Checks.**

- Identity transfer is identity on K₀(ℚ).
- For ℚ⊂ℚ(i), restriction of scalars sends the rank-one class to rank two.
- ℤ→𝔽₂ is excluded from this exact-category construction because 𝔽₂ is not projective over ℤ; merely finite is insufficient.


Use Burgos, Proposition 9.21, pp.84–85.

*Needs:* §4.7, §4.6; the exact supplier contracts above.

### 4.9 Higher Adams weights and product compatibility

For a number field F, j≥2 and an integer a≥1, r_Bo(ψ^a x)=a^j·r_Bo(x) for x∈K_{2j−1}(F)⊗ℚ, where ψ^a is the Adams operation on higher K-groups. Consequently r_Bo vanishes on every summand of weight w≠j in the weight decomposition of K_{2j−1}(F)⊗ℚ. For classes x, y of positive degrees m, m′ with m+m′=2j−1, r_Bo(x·y)=0: one of the degrees is even, and K_i(F)⊗ℚ=0 for even i≥2. For c∈K₀(F)=ℤ, r_Bo(c·x)=c·r_Bo(x).

The operations are those of the local operations interface below on the higher K-theory of a commutative ring, defined through virtual representations of GL_N; Adams operations on K₀ alone do not suffice.

ψ^a on K_m(F)=π_m(BGL(F)⁺) is composition with the self-map of BGL(F)⁺ defined by the virtual representations ψ^a(id_N−N) of the groups GL_N, which are integral combinations of algebraic representations (Weibel IV, 5.3–5.4). For an algebraic representation ρ over ℂ, ρ^*Bo_j is the class attached to ch_j(ρ) (universalBorelClass_representation), additively in ρ; and ch_j(ψ^a ρ)=a^j·ch_j(ρ) (the Chern-character construction of §4.4). Since Bo_j is primitive, the pairing with a Hurewicz image is additive for the H-space sum, so r(ψ^a x)=a^j r(x). On the summand of weight w, ψ^a acts by a^w (the rational Adams-weight decomposition); taking a=2 gives r=0 there for w≠j. Products: K_i(F)⊗ℚ≅K_i(O_F)⊗ℚ=0 for even i≥2 by rational localisation in §3.12 and borelRankTheorem_evenDegree; the product is bilinear (their product compatibility is used for the weights of products).

The local operations input consists of Adams operations ψ^a for integers a≥1 on higher K-theory, natural for ring homomorphisms and compatible with the product and higher Chern character. On the universal degree-2j Chern-character component ψ^a acts by a^j. On a number field the positive even K-groups rationally vanish by Layer 3. Thus a product of positive-degree classes landing in K_{2j−1} has zero regulator: at least one factor has positive even degree. This argument precedes, and does not use, the Beilinson comparison (Weibel IV §5, Proposition 5.3–Corollary 5.5.1, pp.47–49).

For a=2 and j=3 the factor is 8. The product statement concerns factors of positive degree; multiplication by an integer class of K₀ multiplies the regulator by that integer. The proof does not use the comparison with the Beilinson regulator of Layer 8.
The operations API includes `higherAdams_one`, `higherAdams_comp`, `higherAdams_natural`, `higherAdams_product` and `higherAdams_chernCharacter`. Construct the rational eigenspaces used here and prove the weight decomposition for number fields. The operation label a=0 is outside the stated family.

**Checks.**

- ψ¹ is identity.
- In weight j=3, ψ² multiplies the regulator by 8.
- A K₀ class of rank two multiplies the regulator by 2; the positive-degree product statement does not apply to it.


Use Weibel IV, §5, Proposition 5.3, Example 5.3.1 and Definition 5.4, pp.47–49; Rapoport, §1, pp.171–175.

*Needs:* §4.7, §4.4, §3.12; the exact supplier contracts above.

### 4.10 The real regulator isomorphism

For F a number field and j≥2, the linear extension r_Bo,O_F⊗R:K_{2j−1}(O_F)⊗R→V_j(F) is an isomorphism. The same is true for K_{2j−1}(F)⊗R using localization. This is proved from the normalized primitive compact-dual pairing and arithmetic stable comparison, not merely from equality of source and target dimensions.

No integral finite-generation hypothesis is used.

By Layer 3, K_{2j−1}(O_F)⊗ℝ is the primitive part of H_{2j−1}(SL(O_F);ℝ), dual to the indecomposables of degree 2j−1, and these are, through the arithmetic comparison, the direct sum over the archimedean places of the degree-(2j−1) generators of the compact duals: one for each complex place, and one for each real place when j is odd. For an embedding σ, the restriction of σ^*Bo_j to SL_N(O_F) is the image under j_Γ of the invariant form attached to Bo_j on the factor at the place of σ. At a complex place this is a nonzero multiple of the generator x_{2j−1}; at a real place it is the pullback of x_{2j−1} along SU_N/SO_N→SU_N, a nonzero multiple of y_{2j−1} when j is odd and zero when j is even (Burgos, Proposition 9.15). Hence the components of r_Bo at one embedding per place, omitting real places for even j, form a basis of the dual of K_{2j−1}(O_F)⊗ℝ; with the conjugation rule this says that r_Bo⊗ℝ is an isomorphism onto V_j(F). The statement for F follows from rational localisation in §3.12.

Nonzero primitive pairing is essential; a zero map between equal-dimensional spaces is excluded.

Use Burgos, Corollary 9.8, p.78; Proposition 9.15 and Corollary 9.17, pp.82–83.

*Needs:* §4.4, §4.7, §4.3, §3.12, §3.10, §3.7, §3.2; the exact supplier contracts above.

### 4.11 The arithmetic regulator image is a full lattice

For a number field F and j≥2 let L_j=r_Bo(K_{2j−1}(O_F))⊂V_j(F). Since K_{2j−1}(O_F) is finitely generated (the finite-generation theorem of §3.12) and r_Bo⊗ℝ is an isomorphism, the kernel of r_Bo on K_{2j−1}(O_F) is its torsion subgroup, K_{2j−1}(O_F)/tors is free of rank d_j, and L_j is a discrete subgroup spanning V_j(F): a ℤ-lattice in the sense of Mathlib's IsZLattice. Finite generation is needed here, though not for the ranks of Layer 3.

Finite generation of K_{2j−1}(O_F) is the finite-generation theorem of §3.12; any homomorphism to a real vector space kills torsion.

Use the structure theorem for finitely generated abelian groups and r_j⊗R injectivity to identify the kernel as torsion. The image of an integral basis under a real linear isomorphism is a discrete full lattice. State discreteness and the spanning condition in the form of Mathlib's IsZLattice.

A finitely generated subgroup whose rank exceeds the ambient dimension can be nondiscrete; the real isomorphism prevents this.

Use Burgos, Corollary 9.8 and Definition 9.19, pp.78,84.

*Needs:* §4.10, §4.7, §4.2; the exact supplier contracts above.

### 4.12 The regulator determinant line and matrix

For the actual arithmetic regulator r_Bo and a ℤ-basis b of K_{2j−1}(O_F) modulo torsion, define its coordinate matrix `regulatorMatrix` by M_{v,a}=c_F(r_Bo(b_a))_v. Here c_F is the coordinate equivalence of §4.2 and both indices have cardinality d_j. Define the determinant of the regulator on the top exterior power by this matrix. This specialisation uses the ordinary matrix-of-a-linear-map interface; it does not introduce a second generic lattice matrix construction.

A is finite free from the arithmetic finiteness theorem; determinant lines are top exterior powers in Mathlib's exterior algebra.

Pass the regulator through the torsion quotient and select its integral basis. Apply the map induced on top exterior powers, or equivalently the universal alternating determinant form. Express this map in coordinate bases and prove the unimodular basis-change formula.

Prove the following basic identities and compatibility maps.

- `regulatorMatrix_apply`: M_{v,a}=c_j(r_Bo(b_a))_v.
- `regulatorMatrix_basis_change`: For b′=bU, M(b′)=M(b)U and det M(b′)=det M(b)det U.
- `regulatorMatrix_target_change`: Changing embedding representatives gives M′=DM for a diagonal sign matrix D.
- `regulatorMatrix_topExterior`: The top exterior regulator map is multiplication by det M in the specified orientations.
- `regulatorMatrix_scalar`: Multiplying the regulator by λ multiplies det M by λ^d.
- `regulatorMatrix_empty`: At d=0 the matrix is 0×0 and its determinant is one.

**Checks.**

- The determinant at rank zero is 1.
- Swapping two integral basis vectors negates the determinant and preserves its absolute value.
- For d=2, doubling every regulator component multiplies the determinant by 4, not by 2.

Use Burgos, Definition 9.19 and §9.4, pp.79–84.

*Needs:* §4.11, §4.2; the exact supplier contracts above.

### 4.13 The normalized Borel regulator covolume

For j≥2 let R_Bo,j be the covolume of the actual image of K_{2j−1}(O_F) under r_Bo, using the coordinate measure of §4.2. Apply the ordinary ZLattice covolume to this full discrete lattice. It equals |det M| for the matrix of §4.12, is strictly positive, and is independent of the ℤ-basis and of the choice of conjugate representatives. It is one for d_j=0. Keep the covolume and determinant-line orientation distinct.

The full-lattice result and its discrete topology are established, not implicit assumptions on an arbitrary image.

Use the full lattice of §4.11 and the coordinate measure of §4.2 to specialize ZLattice.covolume. Apply the pinned covolume_eq_det theorem after coordinate transport. Use unimodular and representative-change formulas for independence.

Prove the following basic identities and compatibility maps.

- `regulatorCovolume_det`: R_Bo,j=|det regulatorMatrix| under the selected coordinate measure.
- `regulatorCovolume_pos`: The covolume is strictly positive for the proven full lattice.
- `regulatorCovolume_basis_independent`: Every integral basis and every allowed representative selection gives the same positive value.
- `regulatorCovolume_scalar`: For a nonzero real scalar λ, the image lattice of λr has covolume |λ|^{d_j}R_Bo,j.
- `regulatorCovolume_original`: Relative to Borel’s original R′, R_Bo=(2π)^{d_j}R′ if j≢3 mod4, and R_Bo=(2π)^{d_j}2^{r1}R′ if j≡3 mod4.

**Checks.**

- For F=Q and j=2 the covolume is 1.
- For a rank-one matrix (a), the covolume is |a| and is unchanged by a↦−a.
- The reference lattice Z^{I_j} has covolume 1 for the coordinate measure; no √2 per complex pair occurs.

Use Burgos, Definition 9.19 and Remark 9.20, p.84.

*Needs:* §4.11, §4.12, §4.2; the exact supplier contracts above.

### Examples

For ℚ⊂ℚ(i) at weight three the target spaces both have dimension one: pullback has matrix (1), trace has matrix (2), and their composite is multiplication by two. At weight two the ℚ-target is zero and the ℚ(i)-target is the line (a,−a); trace adds the two embedding coordinates and is zero. A complex pair with selected coordinate 1 has reference covolume one, not √2. At j=2 the Pauli matrices give Φ₃(X,Y,Z)=−2i. The relative Borel form has value −16i and coordinate −8/π; the invariant absolute Borel and Beilinson representatives have values −4i and −2i and coordinates −2/π and −1/π. These are evaluations of specified cochains, not evaluations of the regulator on a K₃ element.

### Dependencies

Layer 3 rank theorem and rational localisation, Layer 1 finite generation; finite complex embeddings; topological Chern character/suspension with Bott normalisation; continuous/Lie comparison of Layer 2; ordinary determinant and lattice measure APIs.

## Layer 5: Analytic conventions and negative special values

### 5.1 Completed-zeta normalisation comparison

For the meromorphic Dedekind zeta function supplied by the trivial finite-order Hecke character interface, identify its right-half-plane values with the ideal Dirichlet series and its completion with

```text
Γ_ℝ(s) = π^(−s/2) Γ(s/2),    Γ_ℂ(s) = 2 (2π)^(−s) Γ(s),
Λ_F(s) = Δ_F^(s/2) Γ_ℝ(s)^r₁ Γ_ℂ(s)^r₂ ζ_F(s).
```

The supplier's functional equation is Λ_F(s)=Λ_F(1−s), with simple completed poles only at 0 and 1. Prove `completedZeta_convention` by agreement in Re(s)>1 and uniqueness of meromorphic continuation. In a convention with local complex factor L_ℂ(s)=(2π)^(1−s)Γ(s)=πΓ_ℂ(s), the completed function must be multiplied by π^(−r₂). This equality compares conventions and does not reprove the global functional equation (Borel 1977 §§1.4 and 6.4, pp.616,633; Burgos Theorem 9.12, pp.80–81).

**Checks.**

- At a real place and s=2, Γ_ℝ(2)=1/π.
- At a complex place and s=2, Γ_ℂ(2)=1/(2π²), whereas L_ℂ(2)=1/(2π). Their ratio is π, not a rational correction.
- For F=ℚ there are no complex-place factors, so the conversion scalar π^(−r₂) is 1.

*Needs:* the trivial-character L-function supplier contract, the right-half-plane Euler product, complex gamma and uniqueness of analytic continuation.

### 5.2 The exact negative-integer vanishing order

For F a number field and j≥2, ζ_F is holomorphic at s0=1−j and has exact vanishing order d_j=dim_R V_j(F). If j is odd, each real Γ_R factor and each complex Γ_C factor has a simple pole at s0, giving d_j=r1+r2; if j is even, only the complex factors have poles, giving d_j=r2. Λ_F(s0)=Λ_F(j) is finite and nonzero because ζ_F(j)>0. Thus no additional zero is possible. At a totally real field and j=2, ζ_F(−1) is finite and nonzero, not a pole.

Use the continued zeta, j≥2, and the gamma pole/residue formulae in the analytic library.

Use the Euler series positivity/nonvanishing at real j>1. Apply the functional equation to obtain a nonzero completed value at s0. Count the simple gamma poles and divide a nonzero holomorphic germ by their product.

For Q and j=2 the exact order is zero; for Q and j=3 it is one.

Use Borel 1977, §1.4, p.616.

*Needs:* §5.1, §4.3; the exact supplier contracts above.

### 5.3 The nonzero zeta leading coefficient

For the holomorphic continued ζ_F at s0=1−j with d=d_j, define ζ_F*(1−j)=ζ_F^{(d)}(s0)/d!, equivalently the value g(s0) in the unique germ factorization ζ_F(s)=(s−s0)^d g(s) with g holomorphic and g(s0)≠0. It is also lim_{s→s0}ζ_F(s)/(s−s0)^d. The expression f^(d)(s₀)/d! is defined for arbitrary f:ℂ→ℂ and d∈ℕ using the library iterated derivative. Its factorisation and nonvanishing theorems require analyticity and the stated exact-order hypothesis; specialization to ζ_F imports its continuation.

F number field, j≥2; d is exact vanishing order, not an arbitrary exponent.

Use Mathlib's iterated derivative at s0. Apply the exact-order factorization and removable-singularity limit. Use conjugation symmetry of the continued zeta to obtain a nonzero real coefficient.

Prove the following basic identities and compatibility maps.

- `normalizedLeadingCoefficient_order_zero`: For d=0 the coefficient of any function f:ℂ→ℂ at s0 is f(s0), without an analyticity hypothesis.
- `normalizedLeadingCoefficient_factor`: If f=(s−s0)^d g as analytic germs, the coefficient equals g(s0).
- `normalizedLeadingCoefficient_limit`: For a zero of exact order d it equals the removable limit f(s)/(s−s0)^d.
- `normalizedLeadingCoefficient_ne_zero`: For finite exact vanishing order d, the coefficient is nonzero.
- `normalizedLeadingCoefficient_smul`: Multiplying f by a complex scalar a multiplies the coefficient by a.
- `zetaLeadingCoefficient_real`: The specialized zeta coefficient is real and nonzero by conjugation symmetry.

**Checks.**

- For f(z)=z² at s0=0 and d=2 the coefficient is 1, whereas f″(0)=2.
- For f(z)=7 and d=0 the coefficient is 7.
- For f(z)=z³ at 0, the coefficient with d=2 is zero, so d=2 fails the exact-order nonzero test.

Use Borel 1977, §6.4(3) and (5), p.633.

*Needs:* §5.2; the exact supplier contracts above.

### 5.4 Leading-term form of the functional equation

Write A_F(s)=Γ_R(s)^{r1}Γ_C(s)^{r2} and a_{F,j}=lim_{s→1−j}(s+j−1)^{d_j}A_F(s), a nonzero real number determined by gamma residues. Then ζ_F*(1−j)=|D_F|^{j−1/2} A_F(j)ζ_F(j)/a_{F,j} (`zetaLeading_functionalEquation`). Consequently |ζ_F*(1−j)|∼_Q |D_F|^{1/2}π^{d_j−[F:Q]j}ζ_F(j), where ∼_Q means quotient in Q×. The integer factor |D_F|^{j−1}, signs, powers of 2 and factorials are rational factors; the exact formula retains them before taking proportionality.

j≥2; completed-zeta convention and exact zero order fixed.

Expand the gamma factors at s0 using the simple poles and residues of the classical gamma function. Take the nonzero constant term of Λ_F(s)=Λ_F(1−s). Evaluate gamma values at integral/half-integral j to isolate π^{d_j−[F:Q]j}.

For Q,j=2 the formula gives ζ(−1)=−1/12.

Use Borel 1977, §6.4(4), p.633, interpreted as rational proportionality.

*Needs:* §5.3, §5.1; the exact supplier contracts above.

### 5.5 Absolute and relative arithmetic cohomology with the compact fiber

Let F be a number field of degree d, N odd, G_N=SL_N(F⊗ℝ), K_N its standard maximal compact subgroup (SO_N at real places, SU_N at complex places), Γ⊂SL_N(F) a torsion-free arithmetic subgroup, Y_N=Γ\G_N and X_N=Γ\G_N/K_N. Write g and k for the complexified Lie algebras of G_N and K_N, G_u for the compact form of G_N(ℂ) containing K_N, and X_u=G_u/K_N for the compact dual. Invariant forms give maps β:H^*(g;ℂ)→H^*(Y_N;ℂ) and j:H^*(g,k;ℂ)→H^*(X_N;ℂ), and the compact-form isomorphisms α:H^*(g;ℂ)≅H^*(G_u;ℂ), α_rel:H^*(g,k;ℂ)≅H^*(X_u;ℂ) are compatible with them: β∘incl=p^*∘j for the inclusion of relative into absolute cochains and the projection p:Y_N→X_N. The three spectral sequences of the fibrations with fibre K_N, namely of G_u→X_u, of g modulo k, and of Y_N→X_N, are compatible under these maps. For odd N the restriction H^*(G_u;ℂ)→H^*(K_N;ℂ) is surjective, the three spectral sequences degenerate, and H^*(G_u;ℂ) is the exterior algebra on P₁⊕P₂ with p^* mapping H^*(X_u;ℂ) isomorphically onto ΛP₁ and restriction mapping ΛP₂ isomorphically onto H^*(K_N;ℂ). In every degree q with 4q<N−1, j and β are isomorphisms. In those degrees the splitting P=P₁⊕P₂ of the primitive elements is the one used to factor determinant lines in the period theorem. Name the statement `arithmeticCompactFactorComparison`.

N is odd: for a real place the fibre SO_N is totally non-homologous to zero in SU_N only for odd N. Nothing is asserted for even N. Γ is torsion-free, so that Y_N→X_N is a principal K_N-bundle of manifolds; other arithmetic subgroups are reached by finite covers. j is an isomorphism in degrees q with 4q<N−1 by Layer 3. The period theorem applies the statement in degree d(2j−1), which requires N−1>4d(2j−1).

Define α, α_rel, β and j by invariant forms on G_u, X_u, G_N and G_N/K_N (the invariant-form and relative-Lie comparison of Layer 2) and the de Rham comparison on X_N and Y_N; on cochains the inclusion of relative into absolute cochains is pullback along the quotient map. Filter the forms on the total spaces of K_N→G_u→X_u and K_N→Y_N→X_N, and the Lie algebra cochains of g modulo k; α and β respect the filtrations, so they induce morphisms of spectral sequences which on the fibre term are the compact-form isomorphism (Borel 1977, 3.5). For odd N, H^*(SU_N)→H^*(SO_N) is onto (Borel 1953, Proposition 31.4), and at a complex place the diagonal SU_N in SU_N×SU_N is totally non-homologous to zero. So the spectral sequence of G_u→X_u degenerates, hence so do the other two; by Samelson's theorem H^*(G_u) is an exterior algebra on primitives which split as stated (Borel 1977, 5.2). In degrees q with 4q<N−1, j is an isomorphism by arithmeticComparison_stableRange; comparing the degenerate spectral sequences shows that β is an isomorphism there too.

Require the cohomology splittings only as filtered vector spaces unless an algebra splitting is separately proved.

At a complex place the compact form is SU_N×SU_N with the diagonal SU_N as fibre; the base primitives are differences of the primitives of the two factors. For N=2 and a real place the fibre SO₂ is a circle and H¹(SU₂)=0, so restriction is not surjective: oddness of N cannot be dropped. The period theorem uses β on Y_N, while the rank theorem uses j on X_N; the compatibility β∘incl=p^*∘j is what relates them.

Use Borel 1977, §§3.3–3.5, pp.620–622; §§5.1–5.2, pp.625–627; Borel 1953, Proposition 31.4, p.204.

*Needs:* §2.2, §3.1, §3.2, §3.7; the exact supplier contracts above.

### Examples

At F=ℚ and j=2, d_j=0 and ζ_ℚ(−1)=−1/12 is already its leading coefficient. At j=3, Γ_ℝ has a simple pole at −2 and ζ_ℚ has a simple zero there. For a local model f(z)=z² at zero the order-two coefficient is 1, while f″(0)=2; for f(z)=z³ its order-two coefficient is zero and cannot be used as a nonzero determinant.

### Dependencies

The trivial-character completed L-function interface with the stated gamma factors; analytic germs and gamma residues; Layer 4 target dimension. No compact-period or zeta-determinant theorem is used.

## Layer 6: Inner forms, measures and compact period cycles

### 6.1 Archimedean-split division inner forms

For every number field F and integer e≥2 (`exists_archimedeanSplitDivision`) there is a central division F-algebra D of degree e (dimension e² over F) with D⊗_F F_v≅M_e(F_v) at every archimedean place v. Construction: choose a cyclic extension L/F of degree e and two distinct finite places v₁, v₂ of F that are unramified and inert in L. Let α∈Br(F) be the class with local invariants 1/e at v₁, −1/e at v₂ and 0 at all other places. Then α has period e and index e, and D is the division algebra in the class α.

The two places are chosen after the cyclic field, so no existence theorem for extensions with prescribed behaviour at given places is needed. The central-simple input includes the division representative of a Brauer class, its index (the degree of that representative), period dividing index, and index dividing the degree of any finite splitting field. Use the standard Artin–Wedderburn representative and these two divisibilities; they are precisely the algebraic facts used in Borel Lemma 2.2, pp.617–618. This local Brauer-index interface is not an unlabelled import from a later semisimple-algebra roadmap.

Import exists_auxiliaryPrime and the full cyclotomic-degree theorem from Tau Ceti Chebotarev Layer 7, applied with base F, trivial extension F/F and level e. They give p≡1 mod e, p unramified in F and Irreducible(cyclotomic p F). Nat.exists_prime_gt_modEq_one supplies the congruence ingredient only; irreducibility supplies the hypothesis for IsCyclotomicExtension.autEquivPow, yielding Gal(F(ζ_p)/F)≅(ℤ/p)^× of order p−1. This group is cyclic, so the fixed field of its subgroup of index e is a cyclic extension L/F of degree e, using the cyclic fixed-field interface of Chebotarev Layer 8. By Chebotarev's density theorem (Tau Ceti Chebotarev Layer 10) infinitely many primes of F are unramified in L with Frobenius a generator of Gal(L/F); these are inert. Choose two of them. The global Brauer sequence (Tau Ceti ClassFieldTheory Layer 10) gives a unique α with the stated invariants, whose sum is zero. Its order is e: e·α has all invariants zero, and the invariant at v₁ has order e. Restriction to L multiplies the invariant at a place w above v by [L_w:F_v] (ClassFieldTheory Layer 5). At v₁ and v₂ the local degree is e, so every invariant of α_L vanishes and L splits α. Hence the index of α divides e (the splitting-degree divisibility stated below) and is divisible by its period e (the period/index divisibility stated below); so the division algebra in α has degree e (the division representative of a Brauer class). Its archimedean invariants are zero, so it splits at the archimedean places.

For e=2 this is a quaternion algebra ramified at exactly two finite places and split at every real place. For F=ℚ, e=2 and L=ℚ(i): the primes 3 and 7 are inert, and the quaternion algebra over ℚ ramified exactly at 3 and 7 is a division algebra split at infinity. A quaternion algebra ramified at a real place does not satisfy the conclusion.
Name the Brauer-index API `brauerDivisionRepresentative`, `brauerPeriod_dvd_index`, `brauerIndex_dvd_splittingDegree` and `brauerInvariant_restrict`. These interfaces separate division degree from the size of a matrix representative.

**Checks.**

- For the zero Brauer class the division representative has degree one, even if a chosen matrix representative has larger degree.
- For the quaternion class with invariants 1/2 at 3 and 7 its division degree is two.
- A nonzero invariant 1/2 at a real place prevents archimedean splitting.


Use Borel 1977, §2.1 and Lemma 2.2 with its proof, pp.617–618.

*Needs:* the exact supplier contracts above.

### 6.2 Tamagawa number of division norm-one groups

Let D be a central division algebra of degree e≥1 over a number field F, let G′=GL₁(D) be its unit group and H=SL₁(D) the kernel of the reduced norm Nrd:G′→𝔾_m. Then τ(G′)=1 and τ(H)=1 (`generalLinearOne_tamagawaNumber`, `normOne_tamagawaNumber`), in the normalisation of AdelicAlgebraicGroups §2.4 (Tamagawa measure, Tamagawa number). For e=1 the group H is trivial and G′=𝔾_m. The period theorem of Layer 7 uses only τ(H)∈ℚ_{>0}; existence of a finite positive Haar volume does not give this rationality, which is why the value is proved here. For quaternion algebras τ(H)=1 also enters GeometryOfNumbersAndQuadraticArithmetic §3.3 (`quaternionAdjointTamagawa`) by the same zeta-residue route; the targets here are for every degree e. The proof is Weil's: compute τ(G′) from the zeta integral of D, compute τ(𝔾_m) from the zeta integral of F, and compare along the reduced norm (Mars, exposé 351, §4, p.84, which applies Weil's zeta-function theorem once to F and once to D).

**Measures.** Write D_𝔸=D⊗_F𝔸_F, ‖x‖=|Nrd x|_𝔸 and D_𝔸^1=ker‖·‖. The additive measure dx on D_𝔸 is the Tamagawa measure of the vector group D, namely Δ_F^{−e²/2}∏_v dx_v with dx_v given by an F-basis of D. It is self-dual for the character ψ∘Trd, with ψ the standard additive character of AutomorphicLFunctionsAndLocalFactors AL.0, and vol(D_𝔸/D)=1. On G′ take the gauge ω′=Nrd(x)^{−e}dx, which is left and right invariant because left or right multiplication by y scales dx_v by |Nrd y|_v^e. Since X^*(G′)=ℤ·Nrd with trivial Galois action, the convergence factors of AdelicAlgebraicGroups §2.4 are λ_v=(1−q_v^{−1})^{−1} at finite places and 1 at infinite places, and ρ_{G′}=ρ_F is the residue of ζ_F at 1, Mathlib's `NumberField.dedekindZeta_residue`. Thus μ_{G′}=Δ_F^{−e²/2}ρ_F^{−1}∏_vλ_v|ω′|_v. The number τ(G′) is the volume of D^×\D_𝔸^1 for the measure induced by μ_{G′} and by dt/t on ℝ_{>0} through ‖·‖; this is AdelicAlgebraicGroups' normalisation of a_G by the lattice Hom(X_F^*(G′),ℤ). The group H has no characters, so λ_v=1 and ρ_H=1, and its gauge ω_H is fixed by ω′=ω_H∧Nrd^*(dt/t) along the fibration. The discriminant exponents are additive, e²/2=(e²−1)/2+1/2.

**Steps.** The following targets decompose the proof.

- `divisionUnits_normOne_compact`: D^×\D_𝔸^1 is compact (Fujisaki; Godement, exposé 171, Théorème 2, p.44; Borel 1977 §2.3, p.618, quoting Weil 3.1.1). In the terms of AdelicAlgebraicGroups §3.4 this is compactness of G′(F)\G′(𝔸)^1 for a group whose derived group H is anisotropic.
- `divisionZeta_residue`: Let e≥2 and let Φ be an adelic Schwartz–Bruhat function on D_𝔸, transported from AutomorphicLFunctionsAndLocalFactors AL.0 by an F-basis of D. Then Z(Φ,s)=∫_{D_𝔸^×}Φ(x)‖x‖^s dμ_{G′}(x) converges absolutely for real s>e, and (s−e)Z(Φ,s)→τ(G′)Φ̂(0) as s→e from above, where Φ̂(0)=∫_{D_𝔸}Φ dx. Proof: split the integral at ‖x‖=1. On ‖x‖≤1 apply the Poisson summation of AL.0 to the lattice D⊂D_𝔸≅𝔸_F^{e²}. For y∈D_𝔸^× right multiplication by y scales dx by ‖y‖^e, so Σ_{ξ∈D}Φ(ξy)=‖y‖^{−e}Σ_{ξ∈D}Φ̂(y^{−1}ξ). The terms ξ=0 contribute τ(G′)(Φ̂(0)/(s−e)−Φ(0)/s), and the remaining sums are entire in s by the compactness step. Godement, exposé 176, §1 and §2, Théorème 2 with its proof, pp.110–116, gives this argument for a division algebra; his footnote (3), p.115, normalises the quotient volume to one and leaves the Haar constants open, so the constant τ(G′) is fixed here. The degree-one case is Tate's and is consumed from AutomorphicLFunctionsAndLocalFactors AL.1; it is not restated.
- `divisionZeta_localValue`: For every place v and every Schwartz–Bruhat Φ_v on D_v, Z_v(Φ_v,s)=∫_{D_v^×}Φ_v(x)|Nrd x|_v^s|ω′|_v converges for real s>e−1, and Z_v(Φ_v,e)=∫_{D_v}Φ_v dx_v. At s=e the integrand is Φ_v dx_v, and D_v∖D_v^× is a null set.
- `divisionZeta_unramifiedFactor`: If v is finite, D_v≅M_e(F_v), Φ_v is the indicator of M_e(O_v) and dx_v gives M_e(O_v) volume one, then λ_vZ_v(Φ_v,s)=∏_{a=2}^{e}(1−q_v^{−a})·∏_{b=0}^{e−1}(1−q_v^{b−s})^{−1}. Proof: the cosets GL_e(O_v)x with x∈M_e(O_v)∩GL_e(F_v) correspond to the full sublattices L=O_v^e·x of O_v^e, with |det x|_v=[O_v^e:L]^{−1}. Each coset has |ω′|_v-volume #GL_e(𝔽_{q_v})/q_v^{e²}=∏_{a=1}^{e}(1−q_v^{−a}), and the sublattices of O_v^e satisfy Σ_L[O_v^e:L]^{−s}=∏_{b=0}^{e−1}(1−q_v^{b−s})^{−1}. The finite-place masses are those of AdelicAlgebraicGroups §2.4, which are not recomputed here.
- `generalLinearOne_tamagawaNumber`: For e≥2, τ(G′)=1. Proof: choose a maximal O_F-order Λ of D and Φ=⊗_vΦ_v, with Φ_v the indicator of Λ_v at finite places and ∫Φ_∞≠0. At almost all v, D_v≅M_e(F_v) and Λ_v≅M_e(O_v). For s>e, Z(Φ,s)=Δ_F^{−e²/2}ρ_F^{−1}∏_vλ_vZ_v(Φ_v,s). At finite v write λ_vZ_v(Φ_v,s)=(1−q_v^{e−1−s})^{−1}c_v(s). By the unramified factor, c_v(s)=∏_{a=2}^{e}(1−q_v^{−a})∏_{b=0}^{e−2}(1−q_v^{b−s})^{−1} at almost all v. This is 1+O(q_v^{−2}) uniformly for s∈[e,e+1], so ∏_vc_v converges uniformly there. By the local value theorem, c_v(e)=λ_v(1−q_v^{−1})∫Φ_v dx_v=∫Φ_v dx_v. The Euler product of ζ_F (Tau Ceti `TauCeti.dedekindZeta_eulerProduct_hasProd`) and the class number formula (Mathlib `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`) give (s−e)ζ_F(s−e+1)→ρ_F. Hence (s−e)Z(Φ,s)→Δ_F^{−e²/2}∏_v∫Φ_v dx_v=Φ̂(0). Compare with `divisionZeta_residue` and use Φ̂(0)≠0. Only the real one-sided limit is used, not continuation of Z or of ζ_F.
- `tamagawaNumber_multiplicativeGroup`: τ(𝔾_m)=1 in the same normalisation. This is a conversion of AutomorphicLFunctionsAndLocalFactors AL.1 (the volume κ of the norm-one idele class group), not a new volume computation. AL.1's multiplicative measure at a finite place is λ_vN𝔡_v^{−1/2}|dx/x|_v, its archimedean measures are dx/|x| and 2dxdy/|z|², and ∏_vN𝔡_v^{−1/2}=Δ_F^{−1/2}. Hence the Tamagawa volume of F^×\𝔸_F^1 is κ/ρ_F, and κ=ρ_F is Mathlib's `NumberField.dedekindZeta_residue`.
- `reducedNorm_image`: Locally, Nrd(D_v^×)=F_v^× at every finite place and at every archimedean place where D splits, and Nrd(D_v^×)=ℝ_{>0} at a real place where D_v≅M_{e/2}(ℍ). For a division algebra over a local field the finite-place statement is Platonov–Rapinchuk–Rapinchuk, §1.4.3, p.33; for D_v≅M_m(Δ_v) use diagonal matrices. Globally, Nrd(D^×) is the set of a∈F^× that are positive at every real place where D does not split (Eichler; Platonov–Rapinchuk–Rapinchuk, Theorem 1.34, p.43). For archimedean-split D this is F^×. AdelicAlgebraicGroups §4.6 owns the quaternion case; the general degree is needed here.
- `normOne_tamagawaNumber`: For every central division algebra D of degree e≥1, τ(H)=1. Proof: N=Nrd(D_𝔸^×) is an open subgroup of 𝔸_F^× by `reducedNorm_image`. Mars's fibration lemma (exposé 351, §3, Lemme, pp.82–83) gives the compatible convergence factors λ_{G′}=λ_{𝔾_m}·λ_H and the local identity |ω′|_v=|ω_H|_v|dt/t|_v, hence the iterated-integral formula over D^×\D_𝔸^1→Nrd(D^×)\N^1. The fibre over the identity class is {x∈D_𝔸^1: Nrd x∈Nrd(D^×)}/D^×=D^×H(𝔸)/D^×≅H(F)\H(𝔸). By Eichler, Nrd(D^×)=F^×∩N. Weak approximation at the real places (Mathlib `NumberField.InfinitePlace.denseRange_algebraMap_pi`) gives F^×N=𝔸_F^×. So Nrd(D^×)\N^1→F^×\𝔸_F^1 is a continuous bijective homomorphism of compact groups. It is therefore an isomorphism, and it matches the measures, so the base has volume τ(𝔾_m)=1. Hence 1=τ(G′)=τ(H)τ(𝔾_m)=τ(H). For e=1 both sides are the trivial group.
- `specialLinearDivision_tamagawaNumber`: For every m≥1, τ(SL_m(D))=1. For m≥2, τ(SL_m(D)) equals the Tamagawa number of the stabiliser below, and induction on m reduces to τ(SL₁(D))=1; when D=F and m=2 the stabiliser is unipotent. The rank-maximal vectors form the open orbit of SL_m(D) in D^m. The stabiliser of the first basis vector is SL_{m−1}(D)⋉(unipotent), and unipotent groups have Tamagawa number one. Weil's convergent orbital integral, Poisson summation on D_𝔸^m and the fibration lemma give τ(SL_m(D))=τ(stabiliser) (Mars, exposé 351, §§3–4, pp.81–84). This is the general inner special-linear statement; the period theorem uses m=1.

The local measures, convergence factors and discriminant power must all be those of AdelicAlgebraicGroups §2.4. Changing one local measure without compensating the product changes τ and invalidates τ=1.

**Checks.**

- For e=2 and q_v=2 the unramified factor at s=2 is (3/4)/((3/4)(1/2))=2. This equals λ_v·∫Φ_v dx_v=(1−1/2)^{−1}·1, so the unramified formula agrees with the local value theorem at the edge of convergence.
- For e=2 the coefficient of q_v^{−s} in ∏_{b=0}^{1}(1−q_v^{b−s})^{−1} is 1+q_v, the number of index-q_v sublattices of O_v² (one for each line of 𝔽_{q_v}²). A formula keeping only the factor b=0 would count one sublattice.
- Without the convergence factors, ∏_v∏_{a=1}^{e}(1−q_v^{−a}) diverges to zero through its a=1 factor. With them, the product ∏_v∏_{a=2}^{e}(1−q_v^{−a})=∏_{a=2}^{e}ζ_F(a)^{−1} converges, and for H no factors are needed.
- For F=ℚ and 𝔾_m, the set {1}×∏_pℤ_p^× is a fundamental domain for ℚ^×\𝔸^1. Each local volume is λ_p(1−p^{−1})=1, and Δ_ℚ=ρ_ℚ=1, so τ(𝔾_m)=1, as the conversion of AL.1 requires.
- Let D be the rational quaternion algebra ramified at 2 and ∞. Then Nrd(D^×)=ℚ_{>0}, the image N has index two in 𝔸^×, and ℚ^×N=𝔸^×. The base of the fibration still has volume one. Dividing by [𝔸^1:N^1]=2 without the compensating index [ℚ^×:Nrd(D^×)]=2 would give τ(H)=2.
- The discriminant exponents satisfy e²/2=(e²−1)/2+1/2. Dropping Δ_F^{−1/2} from 𝔾_m alone multiplies τ(𝔾_m) by Δ_F^{1/2} and breaks τ(H)=1 for F≠ℚ.

Use Borel 1977, §2.3, p.618, and the proof of Proposition 2.4, p.619, where Borel quotes Weil, Theorem 3.3.1, and remarks that rationality suffices; Mars, Séminaire Bourbaki exposé 351, §3, Lemme, pp.82–83, and §4, pp.83–84; Godement I, exposé 171, Théorème 2, p.44; Godement II, exposé 176, §§1–2 and Théorème 2, pp.110–116; Platonov–Rapinchuk–Rapinchuk, *Algebraic Groups and Number Theory*, Volume I, §1.4.3, p.33, and Theorem 1.34, p.43.

*Needs:* §6.1; AdelicAlgebraicGroups §§2.4, 3.4; AutomorphicLFunctionsAndLocalFactors AL.0 and AL.1; the exact supplier contracts above.

### 6.3 Archimedean volume as a product of zeta values

For an archimedean-split division algebra D of degree e≥2, H=SL_1(D), a nonzero F-rational invariant top form ω and any arithmetic Γ⊂H(F), μ_∞(H(F⊗R)/Γ)∼_Q∏_{a=2}^e ζ_F(a) (`normOne_archimedeanVolume`), with μ_∞ the discriminant-normalized positive archimedean measure from ω. H(A_F)/H(F) is compact. Taking Γ_U=H(F)∩(H_∞U), AdelicAlgebraicGroups Layer 4 strong approximation gives H(A_F)=H(F)H_∞U and τ(H)=μ_∞(H_∞/Γ_U)vol_f(U). Commensurable arithmetic groups change this volume by a positive rational index.

H is anisotropic over F, simply connected and archimedean-split; H_∞ is noncompact, satisfying the strong approximation hypothesis outside the infinite places.

H(F)\H(𝔸_F) is compact (AdelicAlgebraicGroups §3.4 (anisotropic compactness)). H is simply connected, absolutely almost simple and H(F⊗ℝ)=∏SL_e(F_v) is noncompact, so strong approximation gives H(𝔸_F)=H(F)·H_∞·U for every compact open U (AdelicAlgebraicGroups §4.2 (strong approximation)). For Γ_U=H(F)∩H_∞U the quotient decomposes with a single class: τ(H)=μ_∞(H_∞/Γ_U)·vol_f(U) (AdelicAlgebraicGroups §§2.2–2.4 (quotient integration), with the Tamagawa measure of AdelicAlgebraicGroups §2.4 (Tamagawa measure)). Insert τ(H)∈ℚ^× and the local volumes: vol_f(U) is a rational multiple of ∏_v∏_{a=2}^e(1−q_v^{−a})=∏_{a=2}^e ζ_F(a)^{−1}, by the Euler product in the region of convergence. Two arithmetic subgroups are commensurable, and volumes scale by the index (AdelicAlgebraicGroups §4.5 (level index)).

For e=2 only ζ_F(2) occurs. The proof does not use Layer 7 regulator proportionality, avoiding a circular Tamagawa reformulation.

Use Borel 1977, Proposition 2.4 and proof, pp.618–619.

*Needs:* §6.1, §6.2, AdelicAlgebraicGroups §2.4; the exact supplier contracts above.

### 6.4 Restriction-of-scalars form and discriminant normalization

Choose an ordered integral basis α_1,…,α_d and ordered complex embeddings σ_1,…,σ_d. Put δ_F=det(σ_i(α_a)), so δ_F²=D_F is the signed discriminant and (−1)^{r2}D_F>0. For an F-rational invariant q-form η define `restrictionScalarsForm` Rη=δ_F^{−q}∧_{σ∈Σ_F}ση on the restriction-of-scalars complex group. For a top form of F-dimension h, the associated positive archimedean Haar measure instead uses |D_F|^{−h/2}∏_{v|∞}|ω_v|. These signed algebraic and positive measure conventions are distinct and are related with their conjugate-pair orientation factors.

δ_F≠0; embedding order and integral-basis orientation are recorded. Use the 1980 correction to the algebraic form.

The embedding matrix of an integral basis has determinant δ_F with δ_F²=D_F, the signed discriminant (NumberField.basisMatrix, discr_eq_basisMatrix_det_sq), and the sign of D_F is (−1)^{r₂} (sign_discr). Transport η to each conjugate group, take the exterior product over the embeddings and divide by δ_F^q; the result is defined over ℚ on the restriction of scalars. For a top form the associated positive measure on the archimedean points is |D_F|^{−h/2}∏_{v|∞}|ω|_v, the archimedean part of the Tamagawa measure (AdelicAlgebraicGroups §2.4 (Tamagawa measure)); its compatibility with restriction of scalars is AdelicAlgebraicGroups §2.5 (scalar Jacobians) and AdelicAlgebraicGroups §2.5 (restriction of scalars).

Prove the following basic identities and compatibility maps.

- `restrictionScalarsForm_factor`: The algebraic normalization scalar is δ_F^{−q}.
- `restrictionScalarsForm_embedding_order`: Permuting embeddings changes both δ_F^{−q} and the wedge by the same permutation-sign power, so Rη is unchanged.
- `restrictionScalarsForm_integral_basis`: An integral basis change of determinant ±1 changes the algebraic normalization by (±1)^q; the rational line and positive Haar measure are unchanged.
- `restrictionScalarsForm_positive_measure`: The positive top-form measure has scalar |D_F|^{−h/2}, agreeing with the AdelicAlgebraicGroups Layer 2 Tamagawa convention.
- `restrictionScalarsForm_scalar`: For a∈F×, R(aη)=Norm_{F/Q}(a)Rη.
- `restrictionScalarsForm_erratum`: In Borel 1977, 5.5(1),(4) and 6.2(5) the corrected identities remove the printed i^{r2}; this does not remove every orientation phase elsewhere.

**Checks.**

- For F=Q with integral basis (1), δ=1 and Rη=η.
- For F=Q(i), basis (1,i) and embeddings (id,conj), δ=det([[1,i],[1,−i]])=−2i and δ²=−4=D; at q=1 the scalar is i/2, not Δ_F^(−1/2)=1/2.
- In that Q(i) case the scalar 1/2 from |D|½ gives a different algebraic form and fails δ²=D.

Use Borel 1977, §§1.5–1.6, pp.616–617; Borel 1980, p.373, first paragraph and definition of D½.

*Needs:* the exact supplier contracts above.

### 6.5 Compact arithmetic period cycles

For an archimedean-split central division F-algebra D of degree e≥2, choose a neat arithmetic Γ_D⊂SL_1(D)(F). The quotient Z_D=Γ_D\SL_1(D)(F⊗R) is a compact oriented manifold of real dimension [F:Q](e²−1). The left regular F-representation on D gives SL_1(D)→SL_{e²}; after a lattice choice and finite-index passage it maps Γ_D into SL_N(O_F) for every sufficiently large N. Its compact fundamental cycle defines a period functional on the ambient arithmetic cohomology. Pullback of each algebraic SL_N primitive generator of weight 2≤j≤e is e times the corresponding standard SL_e generator under the archimedean splitting, and the relevant top exterior pairing is nonzero.

N≥e² and N is large enough for the comparison in the degrees of the primitive classes; a neat arithmetic subgroup exists by AdelicAlgebraicGroups §4.3 (neat subgroups).

Take D from exists_archimedeanSplitDivision. The quotient of H_∞=SL_1(D)(F⊗ℝ)≅∏_v SL_e(F_v) by an arithmetic subgroup is compact (AdelicAlgebraicGroups §3.4 (anisotropic compactness)); choose Γ_D neat (AdelicAlgebraicGroups §4.3 (neat subgroups)), so that Z_D is a compact manifold, oriented by an invariant top form. Left multiplication of D on itself is an F-representation of dimension e² with trivial determinant on SL_1(D); a Γ_D-stable lattice and a finite-index subgroup give Γ_D→SL_{e²}(O_F), and block inclusion gives SL_N for N≥e². Over ℂ the regular representation is e copies of the standard representation of SL_e, and the primitive classes are additive for direct sums; so each primitive generator of degree 2j−1, 2≤j≤e, restricts to e times the generator of SL_e, and the product of all of them restricts to a nonzero multiple of the invariant top form. By arithmeticCompactFactorComparison the primitive classes are classes on the full quotient Γ\G, not only on the symmetric-space quotient; pairing with the fundamental class of Z_D is integration (Tau Ceti AlgebraicTopology stage 6).

Prove the following basic identities and compatibility maps.

- `compactPeriodCycle_fundamental`: Z_D has its integral fundamental class in top degree with the selected orientation.
- `compactPeriodCycle_map`: The cycle map comes from the left regular representation followed by block inclusion.
- `compactPeriodCycle_primitive`: For 2≤j≤e, pullback of the normalized algebraic primitive generator is e times the split standard generator.
- `compactPeriodCycle_integral`: Pairing the normalized top invariant form with the cycle equals its finite quotient-volume integral.
- `compactPeriodCycle_cover`: Passing to a subgroup of index a multiplies the pushed-forward fundamental class and top-form integral by a.
- `compactPeriodCycle_orientation`: Reversing orientation negates the signed period and preserves the positive volume.

**Checks.**

- For e=2, left regular representation has F-dimension 4 and the weight-two primitive pullback factor is 2.
- An index-two neat subgroup doubles the top period.
- Replacing division D by M_e(F) gives an isotropic group and does not supply the compact quotient used here.

Use Borel 1977, Theorem 5.5 and proof, pp.628–630.

*Needs:* §6.1, §6.3, §3.2, §5.5; the exact supplier contracts above.

### 6.6 Adelic primitive period pairing

For the compact oriented cycle Z_D and compact-open U with Γ_D=H(F)∩H_∞U, define I_D(η,U)=∫_{Z_D}η for every real-valued rational invariant top form η, including zero. For nonzero η let c_η>0 be the explicitly computed conversion scalar satisfying μ_∞^Tam=c_η|η| in the fixed AdelicAlgebraicGroups Layer 2 normalization. Then μ_∞^Tam(Z_D)=c_η|I_D(η,U)| and c_η|I_D(η,U)|vol_f(U)=τ(H). The scalar is obtained from the differential-form and restriction-of-scalars conventions, rather than assumed equal to one. For primitive wedge forms this integral equals the singular/de Rham pairing with [Z_D]. This is the intrinsic adelic period interface used in Layer 7.

The quotient is compact and oriented. The integration map is defined for zero; c_η and the volume formula require η≠0. All local measures and the selected rational Tamagawa form are fixed compatibly.

Integration of top forms over the compact oriented manifold Z_D and its identification with the pairing of de Rham classes with the fundamental class (Tau Ceti AlgebraicTopology stage 6; the integration compatibility is the quotient comparison of Layer 2). For η≠0 the measure |η| on H_∞ is the archimedean measure of AdelicAlgebraicGroups §2.4 (gauge measure), and μ_∞^{Tam}=c_η|η| defines c_η by restrictionScalarsForm and AdelicAlgebraicGroups §2.4 (Tamagawa measure); it satisfies c_{aη}=c_η/|a| for a∈ℚ^×. Insert normOne_archimedeanVolume and the decomposition of the adelic quotient.

Prove the following basic identities and compatibility maps.

- `adelicPeriodPairing_linear`: I_D is linear in the top form for a fixed orientation and quotient.
- `adelicPeriodPairing_cohomology`: For a closed top form, I_D equals the de Rham/singular pairing with the fundamental class.
- `adelicPeriodPairing_volume`: For η≠0, μ_∞^Tam(Z_D)=c_η|I_D(η,U)| and c_η|I_D(η,U)|vol_f(U)=τ(H), with c_η defined by μ_∞^Tam=c_η|η|.
- `adelicPeriodPairing_local_rescale`: Rescaling local measures by a_v, all but finitely many one, rescales the total measure by ∏a_v; the archimedean/finite product equation changes accordingly.
- `adelicPeriodPairing_cover`: Finite cover of degree a multiplies the integral by a.
- `adelicPeriodPairing_form_rescale`: With measures fixed and a∈Q×, I_D(aη,U)=aI_D(η,U) and c_{aη}=c_η/|a|. Thus the converted quotient volume is unchanged.

For two explicitly specified products of local measures μ′_v=a_v μ_v, with a_v>0 and a_v=1 outside a finite set, the adelic measure conversion is ∏_v a_v. Include this as `adelicPeriodPairing_changeMeasure`, and use it together with the fixed archimedean form orientation whenever comparing an independently normalised period pairing. A name for a pairing without its local factors does not determine a scalar. The intrinsic period in this subsection is the one used by Layer 7.

**Checks.**

- The integral of the zero top form is zero.
- Replacing η by −η negates I_D but leaves its absolute volume unchanged.
- Doubling one finite local measure doubles the finite product; the normalization equation cannot stay unchanged without its compensating global conversion.
- With all Tamagawa measures fixed, replacing nonzero η by 2η doubles I_D and halves c_η; the unconverted equation |I_D|vol_f(U)=τ(H) cannot hold for both forms.

Rational proportionality allows exceptional-place and commensurability factors; it does not allow losing a π or a discriminant square-root factor.

Use Borel 1977, §§1.5–1.6, pp.616–617; Proposition 2.4, pp.618–619; proof of Theorem 5.5, pp.628–630.

*Needs:* §6.5, §6.4, §6.3; the exact supplier contracts above.

### Examples

For e=2 over ℚ choose the cyclic splitting extension ℚ(i). Two inert finite primes, such as 3 and 7, carry Brauer invariants 1/2 and −1/2; the resulting quaternion division algebra splits at the real place. At a good residue field 𝔽₂, #SL₂(𝔽₂)=6 and the normalised local volume is 6/2³=3/4. In the signed-discriminant witness F=ℚ(i), (1,i), (id,conj), the determinant is −2i. Doubling a top form doubles its oriented period and halves the density factor c_η, leaving the adelic volume identity unchanged. For the quaternion algebra ramified at 3 and 7, the zeta integral of §6.2 has at every other prime p the factor (1−p^{−2})/((1−p^{−s})(1−p^{1−s})), whose value at s=2 is (1−p^{−1})^{−1}=λ_p.

### Dependencies

ClassFieldTheory Brauer reciprocity and local degrees; Chebotarev cyclotomic disjointness and inert primes; arithmetic strong approximation and anisotropic compactness; AdelicAlgebraicGroups Tamagawa measures; AutomorphicLFunctionsAndLocalFactors AL.0 Poisson summation and AL.1 idele class volume, with the zeta integral of a division algebra and the reduced-norm images of §6.2; Layer 1 neat arithmetic lattices; DifferentialGeometry integration and Layer 2 comparison.

## Layer 7: Rational periods and the zeta determinant

### 7.1 Borel’s primitive-period determinant theorem

Let F have degree d, j≥2 and N odd with N−1>4d(2j−1); let Γ⊂SL_N(F) be a torsion-free arithmetic subgroup, Y_N=Γ\SL_N(F⊗ℝ) and X_N=Y_N/K_N, with the notation of arithmeticCompactFactorComparison. (1) Let L(g) be the d-th exterior power of the space of primitive elements of degree 2j−1 of H^*(g;ℂ), with the ℚ-structure given by ℚ-rational invariant forms on Res_{F/ℚ}SL_N, and L(Y_N) the d-th exterior power of the space of indecomposable elements of H^{2j−1}(Y_N;ℚ). Then β(L(g))=ζ_F(j)·L(Y_N) (Borel's Theorem 5.5 with m=j−1). (2) Let L(X_u) and L(Γ) be the d_j-th exterior powers of the spaces of indecomposable elements of degree 2j−1 of H^*(X_u;ℚ) and of H^*(Γ;ℚ). Then j_Γ(L(X_u))=R′·L(Γ) with R′=|D_F|^{1/2}·π^{−d·j}·ζ_F(j) (Theorem 6.2). These are equalities of ℚ-structures on complex lines, so they determine the scalars up to ℚ^×. The power of i printed in 5.5(1) is removed by the 1980 correction. The statement concerns rational structures; integral bases of K-groups enter in borelRegulator_zetaProportional. Name the theorem `borel_positiveZetaPeriod`.

N is odd and N−1>4d(2j−1), so that β and j_Γ are isomorphisms in the degrees used; the statement for one arithmetic subgroup implies it for all. The norm-one volumes and the compact cycles of Layer 6 are available: at the level of declarations they precede this theorem.

By arithmeticCompactFactorComparison, β is an isomorphism in degree d(2j−1) and the primitives split into those coming from the base and those restricting isomorphically to the fibre. It suffices to treat N large: restriction from SL_M to SL_N for M≥N respects the rational structures and is surjective on the classes involved. Embed the norm-one group of an archimedean-split division algebra of degree j over F by its regular representation. By Layer 6 the resulting compact cycle carries a nonzero multiple of the product of the primitive forms of degrees 3,5,…,2j−1, and its volume is a rational multiple of ζ_F(2)⋯ζ_F(j). An induction on the degree isolates the factor ζ_F(j); this proves (1). For (2), use the splitting of primitives to pass from Y_N to X_N, and Borel's comparison (1977, 5.4) between the ℚ-structure of invariant forms and that of the cohomology of the compact form, which contributes the powers of π and of the discriminant; the discriminant normalisation is restrictionScalarsForm, with the corrections of the 1980 note.

The proof needs the nonvanishing of the restriction of the primitive product to the compact cycle; rationality of a Haar measure alone proves nothing about regulators. For F totally real and j even, d_j=0, both lines in (2) are ℚ and the statement says |D_F|^{1/2}π^{−d·j}ζ_F(j)∈ℚ^× (Borel's Remark 6.3); for F=ℚ and j=2 this is ζ(2)/π²=1/6.

Use Borel 1977, Proposition 5.4 and Theorem 5.5, pp.628–630; §6.1 and Theorem 6.2, pp.631–632; Remark 6.3, p.632; Borel 1980, p.373, corrections to 5.5(1), (4) and 6.2(5).

*Needs:* §6.5, §6.3, §6.4, §3.7, §3.2, §5.5, §6.6; the exact supplier contracts above.

### 7.2 Borel’s regulator–zeta theorem

For a number field F and j≥2, R_Bo,j(F)∼_Q |ζ_F*(1−j)| (`borelRegulator_zetaProportional`), equivalently there exists q∈Q_{>0} with R_Bo,j(F)=q|ζ_F*(1−j)|. In Borel’s original homotopy-lattice convention R′_j∼_Q π^{−d_j}|ζ_F*(1−j)|. Burgos’s renormalization multiplies that covolume by (2π)^{d_j}, and by the additional rational factor 2^{r1} when j≡3 mod4. This removes the transcendental π discrepancy. No formula for q in terms of torsion orders or dyadic factors is asserted.

j≥2; finite generation, full regulator lattice, analytic continuation and the primitive-period theorem are all established inputs.

The indecomposables of degree 2j−1 of H^*(X_u;ℚ) are dual to π_{2j−1}(X_u)⊗ℚ and those of H^*(SL(O_F);ℚ) to K_{2j−1}(O_F)⊗ℚ (Layer 3). Borel's original regulator R′_j is defined by j_Γ(x)=R′_j·y for generators x, y of the duals of the top exterior powers of the two integral lattices; such generators are rational multiples of rational generators, so by borel_positiveZetaPeriod R′_j is a rational multiple of |D_F|^{1/2}π^{−d·j}ζ_F(j) (Borel 1977, 6.4). By zetaLeading_functionalEquation, |D_F|^{1/2}π^{d_j−d·j}ζ_F(j) is a rational multiple of |ζ_F^*(1−j)|; hence R′_j∼π^{−d_j}|ζ_F^*(1−j)|. Apply regulatorCovolume_original to pass to the renormalised covolume: the factor (2π)^{d_j}, and 2^{r₁} when j≡3 mod 4, removes π^{−d_j} up to a rational number.

For Q,j=2, R=1 and |ζ*(−1)|=1/12 give a rational ratio 12. An integral Lichtenbaum torsion identity does not follow from this theorem.

Use Borel 1977, §6.4(1)–(5), pp.632–633; Burgos, Theorem 9.12 and Remark 9.20, pp.80,84.

*Needs:* §7.1, §5.4, §4.13; the exact supplier contracts above.

### Examples

For ℚ at j=2 the rank-zero regulator covolume is 1 and |ζ_ℚ(−1)|=1/12; their ratio is 12. For an imaginary quadratic field at j=2, the determinant is an absolute one-by-one regulator entry and the leading term at −1 has order one. Changing the complex representative negates the entry and preserves its absolute value. The rational proportionality does not determine a torsion correction or an integral special-value formula.

### Dependencies

Layers 2–4 arithmetic and primitive comparisons; Layer 5 leading coefficient; Layer 6 inner-form volumes and compact cycles; compact Lie spectral sequences and rational cohomology structures.

## Layer 8: Beilinson comparison and low-weight coordinates

### 8.1 Injectivity for the complex general-linear relative class

For GL_N(ℂ) as a real Lie group with maximal compact subgroup U_N, the map from relative to absolute Lie algebra cohomology H^*(gl_N(ℂ),u_N;ℝ(j−1))→H^*(gl_N(ℂ);ℝ(j−1)) is injective. Under compact duality it is the pullback H^*(U_N)→H^*(U_N×U_N) along the quotient map (M,M′)↦M^{−1}M′, which sends a primitive generator x to 1⊗x−x⊗1; restriction to the second factor is a left inverse on the exterior algebra generated by the primitives. Hence an equality of the images of Bo_j and Be_j in absolute cohomology implies their equality in relative cohomology.

Use the GL_N(C) symmetric pair; no injectivity assertion is made for arbitrary relative Lie pairs.

Use a diagonal compact-dual coordinate for the pair (GL_N(ℂ),U_N): the compact inclusion is U_N→U_N×U_N, u↦(u,u). Burgos’s conjugate-diagonal coordinate u↦(ū,u) is converted to this one by complex conjugation on the first factor. This coordinate change transports the comparison map; it does not change the fixed Borel/Beilinson normalisations. Use the functorial compact-dual construction of §3.1 and the cochain comparison of Layer 2. For the left diagonal quotient, q(M,M′)=M⁻¹M′ identifies U_N\(U_N×U_N) with U_N. Its section s(u)=(1,u) satisfies q∘s=id, hence s*∘q*=id on all cohomology. On primitive generators q*x=1⊗x−x⊗1. The transported relative-to-absolute map is q*, so it is injective. Equality of the absolute images determines equality in relative cohomology, with no unspecified transpose sign.

Equality of absolute representatives is used only with this injectivity input.
The quotient-map sign is fixed already for U₁: q(1,i)=i and q(i,1)=−i. On degree-one cohomology q* sends the generator to the second generator minus the first. This is a sign witness for the transported diagonal coordinate, not a pointwise formula for Burgos's relative cocycle.


Use Burgos, Definition 9.24, final paragraph, pp.86–87.

*Needs:* §3.2; the exact supplier contracts above.

### 8.2 The infinitesimal Beilinson representative

For j≥2 and N stable, the universal Beilinson class Be_j determined by the independently constructed higher Deligne Chern character below has absolute Lie representative π_{j−1}Φ_{2j−1}, with π_q(z)=(z+(−1)^q z̄)/2. This uses the first infinitesimal diagonal of the simplicial classifying scheme, its differential-form normalization into the Weil algebra, the inverse Chern–Weil construction, and the explicit van Est identification. The normalized Deligne class is the higher Chern character, not the unscaled Chern class.

The Beilinson class Be_j is the universal class of the Deligne normalisation of §8.2, built from the independently defined Deligne regulator below; this construction does not use the Borel comparison. The description of the Chern–Weil homomorphism and of the van Est isomorphism through the first infinitesimal neighbourhood of the diagonal of the simplicial classifying scheme (Burgos §§8.2–8.3) is supplied by the explicit Lie-cochain comparisons below.

Restrict the universal Deligne–Beilinson class to the first infinitesimal neighbourhood of the diagonal of the simplicial scheme B.GL_N (Burgos Lemma 10.10). Use the explicit description of the Chern–Weil morphism into the Weil algebra and of the van Est isomorphism (Burgos Theorems 8.12 and 8.15) to compute the image in absolute Lie algebra cohomology. The result is π_{j−1}Φ_{2j−1} (Burgos Proposition 10.11); the normalisation ch_j=(2πi)^j pr_j/j! is the one of the Deligne normalisation of §8.2 and of the Chern-character construction of §4.4.

Construct the Deligne regulator independently: its universal class is the higher Deligne Chern character, compatible with ring maps, stabilisation and products. For F⊗ℝ, identify H_D¹(F⊗ℝ,ℝ(j)) with the simultaneous-conjugation invariants of the sum of ℂ/ℝ(j). Use the canonical real projection π_{j−1} to identify each quotient with ℝ(j−1), with no further scalar. The defining higher Chern class normalisation is ch_j=(2πi)^j pr_j/j!. Require functoriality under complex embeddings and compatibility with the map O_F→F, before any comparison with Borel (Burgos Definition 10.8, pp.94–95, and Lemma 10.2, p.90).

Use `deligneRegulator_natural`, `deligneRegulator_stabilize`, `deligneRegulator_chernCharacter`, `deligneField_quotient`, `deligneField_projection` and `beilinsonClass_infinitesimal` for the corresponding maps and comparisons. Concretely construct the real Deligne complex as Cone(ℝ(j)⊕F^jΩ^•→Ω^•)[−1] on a smooth complex variety, using logarithmic forms on a normal-crossings compactification for an open variety. The classifying-scheme version is obtained degreewise on B.GL_N and then totalised. The universal Chern character in its hypercohomology, paired with the algebraic K-theory construction, defines the higher regulator. In the cone the comparison morphism is (r,f)↦r−f; the degree-n differential on a triple is (dr,df,r−f−dω). Include `deligneComplex_d_sq`, `deligneComplex_projections`, `deligneComplex_exactSequence`, `deligneComplex_changeCompactification` and the existence and compatibility of the normal-crossings models of the simplicial B.GL_N used here. First state the construction for a chosen smooth proper compactification with normal-crossings boundary; independence is a comparison theorem. On B.GL_N the Hodge-type calculation gives the isomorphism `deligneUniversal_toBetti` in degree 2j; its inverse lifts the topological ch_j uniquely. The map η to continuous cochains is π_{j−1}(ω) in form degree one and zero in other degrees, and evaluation on the discrete classifying space gives its restriction to group cohomology. These maps define Be_j and its pairing with Hurewicz. The infinitesimal diagonal comparison is a theorem about this construction, not its definition (Burgos §§10.1–10.3, pp.89–95). On Spec ℂ in degree one and j≥2 this gives ℂ/ℝ(j), with the projection and Tate coordinate just specified.

**Checks.**

- For Spec ℂ, H_D⁰(ℝ(0))=ℝ, and for j>0 the only nonzero group is H_D¹=ℂ/ℝ(j); retaining an extra degree-zero ℝ(j) is incorrect.
- In weight two the quotient ℂ/ℝ(2) kills the real line and is identified with the imaginary line by π₁; π₁(1)=0 and π₁(i)=i.
- In weight three the quotient ℂ/ℝ(3) kills the imaginary line; π₂(1)=1 and π₂(i)=0.
- Replacing the Chern character by an unscaled Chern class changes the weight-three indecomposable coefficient by 2 and therefore fails the shared Bott normalisation.

At j=2 the representative is π1Φ3, half the Borel absolute representative.

Use Burgos, Theorems 8.12,8.15, pp.70–71,73; Lemma 10.10 and Proposition 10.11, p.97.

*Needs:* §4.5; the exact supplier contracts above.

### 8.3 Universal Borel–Beilinson comparison

For every j≥2 and N in the fixed classical stable range, Bo_j=2Be_j in H_cont^{2j−1}(GL_N(C),R(j−1)) (`borelClass_eq_two_beilinsonClass`), with Burgos Definitions 9.24 and 10.8 and ch_j=(2πi)^j pr_j/j!. The equality is compatible with stabilization. Its proof compares the two explicit absolute Lie classes and then uses the proved relative-to-absolute injectivity and van Est; weight two is a test and is not the proof for other j.

The selected Tate generators, suspension sign and Chern-character normalization are identical on both sides.

Use Layer 4 absolute Borel representative 2π_{j−1}Φ and Layer 8 Beilinson representative π_{j−1}Φ. Apply the relative-to-absolute injectivity theorem. Transport by inverse van Est from Layer 2 and apply stabilization naturality.

At j=3 the same scalar 2 holds; no guessed weight-dependent scalar is introduced.

Use Burgos, Theorem 10.9 and proof, pp.95–97.

*Needs:* §8.1, §8.2, §4.5, §4.4; the exact supplier contracts above.

### 8.4 Arithmetic regulator and covolume comparison

Let r_Be be the Beilinson regulator K_{2j−1}(F)→H_D¹(F⊗ℝ,ℝ(j))≅V_j(F), the independently constructed Deligne regulator and quotient identification of §8.2, in the same Tate coordinate as r_Bo. For j≥2, r_Bo=2·r_Be on K_{2j−1}(F), and on K_{2j−1}(O_F) after composing with O_F⊂F. On determinant lines of rank d_j, det(r_Bo)=2^{d_j}det(r_Be), and R_Bo,j=2^{d_j}R_Be,j for the same reference measure. Hence both covolumes are rational multiples of |ζ_F^*(1−j)|.

The Deligne-field identification is the quotient C/R(j)≅R(j−1), and retains simultaneous conjugation invariants.

Pull back the equality Bo_j=2Be_j along every complex embedding and pair with Hurewicz images; both regulators are defined by pairing with these universal classes. The identification of the Deligne cohomology of F⊗ℝ with V_j(F) is the quotient ℂ/ℝ(j)≅ℝ(j−1) at each embedding, with simultaneous conjugation invariants (the Deligne normalisation of §8.2). Compatibility with O_F⊂F is rational localisation (§3.12). Apply regulatorMatrix_scalar and regulatorCovolume_scalar to the lattice of rank d_j.

For d_j=1 the covolume factor is 2; for d_j=2 it is 4; for d_j=0 it is 1.

Use Burgos, Theorem 10.9, pp.95–97, with Definitions 9.19 and 10.8, pp.84,94.

*Needs:* §8.3, §4.7, §4.12, §4.13; the exact supplier contracts above.

### 8.5 The Bloch–Wigner coefficient

At j=2 the Borel regulator is the Bloch–Wigner function divided by π. Let S_F:K₃(F)→B(F) be Suslin's map, with the labelling [x]=(0,∞,1,x) of configurations in ℙ¹(F) fixed below. For every number field F, every x∈K₃(F) and every complex embedding τ, the Tate coordinate of the τ-component of r_Bo(x) is D(τS_F(x))/π, and that of r_Be(x) is D(τS_F(x))/(2π) (`borelRegulator_blochWigner_exact`). Here D is the Bloch–Wigner function, extended additively to B(ℂ). Equivalently, in the cross-ratio labelling by r with r(∞,0,1,z)=z, the coefficient is −1/π, because the configuration that S_F labels [x] has r-label [1/x]. The coefficient does not depend on F or on τ. The weaker statement `borelRegulator_blochWigner_proportional` (a nonzero real scalar common to all fields and places) is its corollary.

The factor two between the Borel and Beilinson classes is fixed in every weight by borelClass_eq_two_beilinsonClass; the Beilinson coefficient is half the Borel one.

The proof evaluates the relative Borel form on hyperbolic space and compares the resulting volume cocycle with ideal simplices.

1. *Relative form.* On SL₂(ℂ)⊂GL_N(ℂ), with p the traceless Hermitian 2×2 matrices, the relative Borel representative is 8Φ₃=−4Tr(X[Y,Z]) on p, by `traceCocycle_hermitian` and §4.5. As a check of §4.5, write Ψ(X,Y,Z)=Tr(X[Y,Z]) and Ψ̄ for its complex conjugate. In the absolute complex of sl₂(ℂ) (as a real Lie algebra), the cochain equal to Ψ on Λ³p and zero when an argument lies in su(2) is cohomologous to (Ψ−Ψ̄)/8. So 8Φ₃ on p has the absolute class −(Ψ−Ψ̄)/2=2π₁Φ₃.
2. *Hyperbolic normalisation.* Identify SL₂(ℂ)/SU(2) with upper half-space {(x+iy,h): h>0}, sending g to g·(0,0,1). Here g acts by the Poincaré extension g·q=(aq+b)(cq+d)^{−1}, with q=z+hj in quaternion notation. The tangent map at o=(0,0,1) sends σ₁,σ₂,σ₃ to 2∂_x, −2∂_y, 2∂_h. Thus the symmetric-space metric 2Re Tr(XY) on p is the curvature −1 metric (dx²+dy²+dh²)/h², with σ_k/2 orthonormal. The relative form takes the value −16i on (σ₁,σ₂,σ₃), and −8/π after division by 2πi. That frame has determinant 2·(−2)·2=−8 with respect to (∂_x,∂_y,∂_h). Hence the invariant 3-form attached to Bo₂/(2πi) is +vol_ℍ/π, where vol_ℍ=dx∧dy∧dh/h³.
3. *Volume cocycle.* Lie cochains are evaluated on left-invariant vector fields, with Burgos's differential (§5.1, pp.35–36), and a relative cochain corresponds to the invariant form on SL₂(ℂ)/SU(2) whose value at o on the vectors d/dt exp(tX_i)·o is its value on (X_i). For the right model K\G of §2.2, transport forms by the inversion g↦g^{−1}, which carries K\G to G/K. An identification of right-invariant forms with Lie cochains that respects differentials is (−1)^q times evaluation at the identity, and this cancels the sign (−1)^q of the inversion on tangent vectors, so the two models give the same continuous class. The inverse van Est map of Layer 2 sends an invariant form to its integrals over geodesic simplices, oriented by vertex order: c(g₀,…,g₃)=(1/π)∫_{Δ(g₀o,…,g₃o)}vol_ℍ. The normalisation witness is G=ℝ with the form dx, which gives c(g₀,g₁)=g₁−g₀. Goncharov's prism cochain (Lemma 5.2, p.38) replaces the interior point o by the boundary point ∞. The resulting cocycle is the signed volume of the ideal simplex with vertices g_i∞, extended by zero on degenerate configurations, and the replacement is an identity of actual cochains, before restriction to a discrete subgroup.
4. *Ideal simplices.* The singular simplex with vertex order (∞,0,1,z) and Im z>0 reverses the orientation (x,y,h). In barycentric coordinates its projection to ℂ has Jacobian Im z>0, while the height decreases away from the vertex ∞. Its unsigned volume is D(z) (Lobachevsky's formula, Goncharov p.7), so its signed vol_ℍ-volume is −D(z); for Im z<0 both signs change. Since PSL₂(ℂ) preserves orientation and cross-ratios, the boundary cocycle is −D(r(g₀∞,…,g₃∞))/π.
5. *Labelling.* Suslin's map on H₃(GL₂(F)) is the edge map ψ of the configuration spectral sequence, with the 4-tuple (0,∞,1,x) labelled [x] (Weibel VI Lemma 5.6 and Theorem 5.7, pp.25–26). Since r(0,∞,1,x)=1/x, the class [x]+[1/x] is 2-torsion in P(F) (Weibel VI Lemma 5.4(b), p.24) and D(1/z)=−D(z), we get ⟨Bo₂/(2πi),ξ⟩=D(ψ(ξ))/π for ξ∈H₃(GL₂(ℂ)). On GL₂(ℂ) the relative form ignores scalar parts, so Bo₂ is pulled back from PGL₂(ℂ).
6. *Passage to K₃.* S_F(x)=ψ(h(x)), where h(x)∈H₃(GL(F))≅H₃(GL₃(F)) (Weibel VI Lemma 5.10, Proposition 5.12 and Remark 5.12.1, p.29). The group H₃(GL₃(F)) is generated by the images of H₃(GL₂(F)) and of H₃ of the diagonal torus (Suslin, used in the proof of Weibel VI Proposition 5.12). The map ψ kills torus classes (Lemma 5.11), and so does Bo₂, whose relative form vanishes on commuting diagonal Hermitian inputs (`traceCocycle_scalar`). Naturality in τ and stabilisation (`universalBorelClass_stabilize`) complete the proof.

Goncharov's equations (61), (64), Theorem 5.7, Corollary 5.10 and Theorem 5.11 identify the same universal class through the Grassmannian dilogarithm, but they use a different coefficient normalisation, and none of their scalars enters the coefficient above.

For this comparison construct the following minimal weight-two interface for an infinite field F of characteristic zero. Let the pre-Bloch group be generated by [z], z∈F\{0,1}, modulo

```text
[x] − [y] + [y/x] − [(1−x⁻¹)/(1−y⁻¹)] + [(1−x)/(1−y)] = 0
```

for distinct x,y∉{0,1}. All five arguments lie outside {0,1}. Use the cross-ratio r(a,b,c,d)=(a−c)(b−d)/((a−d)(b−c)), extended by limits, so r(∞,0,1,z)=z. Write the multiplicative group F× additively inside tensor products and put A=(F×⊗ℤF×)/⟨a⊗b+b⊗a⟩. Its boundary is [z]↦z⊗(1−z) in A, not an exterior square; define the Bloch group as its kernel. Supply Suslin's natural surjection S_F:K₃(F)→B(F), factoring through K₃^ind(F). It is the Hurewicz map followed by the configuration edge map ψ:H₃(GL(F))≅H₃(GL₃(F))→B(F), in which the 4-tuple (0,∞,1,x) of points of ℙ¹(F) is labelled [x] (Weibel VI Lemma 5.6, Theorem 5.7, Lemma 5.10 and Proposition 5.12, pp.25–29). Also supply the exact sequence with torsion kernel μ̃(F) for K₃^ind(F) (Theorem 5.2, p.23). For number fields the Milnor K₃ image is torsion, so K₃(F)⊗ℚ≃B(F)⊗ℚ. This is the rational comparison used here; and the Bloch–Wigner homomorphism induced by D(z), including its measurable four-point cocycle and D(z̄)=−D(z). For the universal comparison use the smooth interior cocycle on hyperbolic space and the everywhere-defined boundary cocycle, with D extended by zero on degenerate four-point configurations. Construct the prism homotopy between them as an identity of actual cochains, valid also on degenerate configurations. Restrict this identity to the discrete group before passing to cohomology. An almost-everywhere class of measurable functions has no pointwise restriction map to an arbitrary discrete subgroup. This construction supplies the required restriction without such a map (Goncharov Introduction (11), p.7; Lemma 5.2, pp.38–39, Corollary 5.5, p.41, and §§5.4–5.7, pp.43–49; Weibel VI Definition 5.1, Theorem 5.2 and Corollary 5.3, pp.23–24).

Its API includes `preBloch_map`, `preBloch_fiveTerm`, `blochGroup_map`, `blochBoundary_wellDefined`, `blochGroup_kernel`, `blochBoundary`, `blochWigner_fiveTerm`, `blochWigner_conjugate`, `blochWigner_cocycle`, `blochWigner_smoothRepresentative`, `blochWigner_prismHomotopy`, `blochWigner_restrictComparison`, `suslinMap_natural`, `suslinMap_labelling`, `borelRegulator_blochWigner_proportional`, `borelRegulator_blochWigner_exact` and `beilinsonRegulator_blochWigner_exact`. Here `suslinMap_labelling` states that the configuration with r-label [z] has Suslin label [1/z]. The proportionality statement asserts a nonzero real scalar common to fields and places; the two exact statements evaluate it as 1/π for r_Bo and 1/(2π) for r_Be, with respect to S_F.

**Checks.**

- With x=2,y=3 the five-term relation is [2]−[3]+[3/2]−[3/4]+[1/2]=0. The cross-ratios r(2,0,1,3)=−3 and r(0,2,1,3)=−1/3 distinguish an ordered quadruple from its inverse.
- D(z̄)=−D(z) matches the weight-two target pair (a,−a); it does not match the invariant pair (a,a).
- D(x)=0 for real x∉{0,1}, while D(ζ₆)>0 for the upper-half-plane root ζ₆=(1+√−3)/2.
- In the antisymmetric tensor quotient, 2(a⊗a)=0 but a⊗a need not be zero. Thus the integral symbol used for ζ₆ is 2[ζ₆], while [ζ₆] is a rational Bloch element.
- The generators [0] and [1] do not exist; the five-term instance x=y is excluded because it would introduce [1]. A field embedding sends a valid relation to a valid relation and sends [z] to [f(z)], fixing the direction of the pre-Bloch and Bloch maps.
- The antisymmetric tensor quotient of the zero abelian group is zero. For the infinite cyclic group its diagonal tensor has order two; for ℤ² the alternating functional (a,b)↦a₁b₂−a₂b₁ sends e₁⊗e₂ to 1 and e₂⊗e₁ to −1. Thus imposing every off-diagonal tensor to be zero would give the wrong quotient, just as imposing every diagonal to be zero would.
- The zero pre-Bloch class belongs to B(F). In F=ℚ(t), the class [t] does not: the alternating functional v_t⊗v_{1−t}−v_{1−t}⊗v_t on the tensor quotient evaluates its boundary t⊗(1−t) to 1. This distinguishes the kernel from the whole pre-Bloch group. The two valuations are the ordinary orders at t=0 and t=1; their values on t and 1−t are (1,0) and (0,1).
- The Milnor K₃ image maps to zero under the Suslin map, whereas for an imaginary quadratic number field its rational indecomposable K₃/Bloch comparison has dimension one. For ℚ that rational dimension is zero. Together with embedding naturality these distinguish the specified quotient map from an arbitrary surjection or a zero map in every field.
- A repeated boundary point gives zero for the extended four-point cocycle. The prism identity remains valid on a five-point tuple with repetitions; restricting to the identity subgroup therefore gives the zero positive-degree class, without a generic-position assumption.
- Changing the interior base point changes its smooth cocycle by the explicit prism coboundary, and restricting that same coboundary to a discrete subgroup commutes with its differential. Changing a representative only on a countable orbit preserves its almost-everywhere class but can change its pointwise values there; this excludes a purported restriction defined on arbitrary almost-everywhere representatives.
- Frame witness: σ₁,σ₂,σ₃ act at o=(0,0,1) as 2∂_x, −2∂_y, 2∂_h, a frame of determinant −8. Dividing the relative value −8/π by −8 gives the invariant form vol_ℍ/π. Substituting the absolute value −4i for the relative value −16i would give vol_ℍ/(4π), and ignoring the reversed frame orientation would give −vol_ℍ/π.
- Ideal-simplex witness: the simplex (∞,0,1,i) has signed vol_ℍ-volume −D(i)=−G, with G≈0.91597 Catalan's constant, so the boundary cocycle takes the value −G/π. The Möbius map w↦1/w carries (∞,0,1,i) to (0,∞,1,−i), so Suslin's label is [−i], and D(−i)/π=−G/π agrees. Pairing the r-label [i] with the coefficient +1/π would give the wrong sign.
- For F=ℚ(√−3) take x∈K₃(F) with S_F(x)=2[ζ₆]; it exists because S_F is onto B(F). At the upper-half-plane embedding the Borel coordinate of x is 2D(ζ₆)/π≈0.64613 and the Beilinson coordinate is D(ζ₆)/π≈0.32307. At the conjugate embedding both are negated, giving the pair (a,−a) of V₂(F).
- If the four boundary points are real the ideal simplex is flat and D vanishes. Real embeddings, and the zero weight-two target of ℚ, therefore cannot detect the coefficient; the test needs a complex place.

The Pauli value Φ₃=−2i fixes the trace normalisation but not the coefficient. The coefficient also needs the frame orientation of step 2, the ideal-simplex orientation of step 4 and the labelling of step 5, and reversing any one of them changes its sign.

Use Goncharov, Introduction, equation (11) and Lobachevsky's volume formula, p.7; Lemma 5.2, pp.38–39; §§5.4–5.7, equations (61),(64), Theorem 5.7 and proof, pp.43–47; Corollary 5.10 and Theorem 5.11, p.49; Weibel VI, Theorem 5.2, p.23, Lemma 5.4, p.24, Lemma 5.6 and Theorem 5.7, pp.25–26, Lemmas 5.10–5.11, Proposition 5.12 and Remark 5.12.1, p.29; Burgos, §5.1, pp.35–36, and Propositions 9.25–9.26, pp.87–88.

*Needs:* §2.2, §4.4, §4.5, §4.7, §4.2, §8.3; the exact supplier contracts above.

### 8.6 Zero-rank and imaginary-quadratic regulator tests

For Q and every even j≥2, V_j(Q)=0, the rational odd K-group is zero and its arithmetic regulator covolume is 1. For an imaginary quadratic F and j=2, V_2(F) is one-dimensional with components (a,−a); the arithmetic regulator image is a full rank-one lattice and changes sign when the selected embedding is conjugated. For F=Q(√−3), put ζ_6=(1+√−3)/2. With Suslin’s antisymmetric tensor quotient, ∂[ζ_6]=−ζ_6⊗ζ_6 can be nonzero 2-torsion; consequently 2[ζ_6] is an integral Bloch element and [ζ_6] is a rational Bloch element. This follows from 1−ζ_6=ζ_6^{-1} and 2(ζ_6⊗ζ_6)=0. The Bloch–Wigner values D(ζ_6) and 2D(ζ_6) are positive at the upper-half-plane embedding. By `borelRegulator_blochWigner_exact`, an element with Suslin image 2[ζ_6] has Borel coordinate 2D(ζ_6)/π≈0.6461 at the upper-half-plane embedding; rank one and nonzero image also follow independently from the real regulator isomorphism.

j≥2; ζ_6 is tested in the rationalized Suslin/Bloch comparison, with the stated boundary convention.

Use the pinned signature counts, Layer 3 rank theorem and Layer 4 target coordinates. Apply the full-lattice theorem for the imaginary-quadratic field. Use the antisymmetric tensor relation of §8.5 to show ∂(2[ζ_6])=0, then rationalize if using [ζ_6]. Apply the Bloch–Wigner positivity, descent and exact coefficient of §8.5.

At Q,j=2 the zeta value is nonzero although the rational K3 rank is zero. At an imaginary quadratic field switching embedding changes orientation but preserves absolute determinant. The integral test is 2[ζ_6]; replacing the antisymmetric tensor quotient by an exterior square would incorrectly kill every diagonal tensor. The rationalized test may use [ζ_6].

Use Borel 1974, Proposition 12.2, p.271; Weibel IV, Theorems 1.17–1.18 and Regulator Maps 1.18.1, pp.12–13.

*Needs:* §3.12, §4.2, §4.11, §4.13, §8.5; the exact supplier contracts above.

### 8.7 Matrices of extension and trace

For f:F→E finite and selected coordinates c_F,c_E, define P_f=c_E∘pull_f∘c_F⁻¹ and T_f=c_F∘Tr_f∘c_E⁻¹ as real linear maps between coordinate spaces and take their matrices in the standard bases. Entries sum the signed contributions of all complex embedding extensions, including conjugate representatives. Then T_f P_f=[E:F]I, coordinate matrices equal the coordinate-free maps, and they compose with extension/trace. For equal-dimensional target spaces their determinant relation is det(T_f)det(P_f)=[E:F]^{d_j}; for unequal dimensions this is a rectangular matrix relation, with no square determinant asserted.

F,E number fields, j≥2, f finite; both coordinate selections are explicit.

Use the proven coordinate equivalences and pull/trace formulas. Apply LinearMap.toMatrix on the standard function-space bases. Transport identity, composition and trace-pull relation through the equivalences and matrix multiplication.

Prove the following basic identities and compatibility maps.

- `embeddingMatrices_pull_apply`: The pull matrix acts on c_F(x) as c_E(pull_f x).
- `embeddingMatrices_trace_apply`: The trace matrix acts on c_E(y) as c_F(Tr_f y).
- `embeddingMatrices_id`: Identity extension gives identity matrices.
- `embeddingMatrices_comp`: For F→E→L, P_comp=P_EL P_FE and T_comp=T_FE T_EL.
- `embeddingMatrices_trace_pull`: T_f P_f=[E:F]I with the appropriate source index.
- `embeddingMatrices_representatives`: A source/target representative change conjugates the maps by the corresponding diagonal sign matrices.
- `embeddingMatrices_regulator`: The coordinate regulator matrices satisfy the pullback/transfer commuting squares, including exact Borel–Beilinson scaling.

**Checks.**

- For Q→Q(i),j=3, the one-by-one pull/trace matrices are (1) and (2).
- For Q→Q(i),j=2, the pull matrix has one row and zero columns, and the trace matrix has zero rows and one column.
- Switching the selected Q(i) embedding at j=2 negates its coordinate maps, preserving the coordinate-free square.

Use Burgos, Propositions 9.21–9.22 and Theorem 10.9.

*Needs:* §4.6, §4.2, §4.8, §8.4; the exact supplier contracts above.

### Examples

At target rank two, replacing r_Be by 2r_Be multiplies the determinant by 4; at rank zero the factor is 2⁰=1. For ℚ(√−3), 1−ζ₆=ζ₆⁻¹, so the boundary of [ζ₆] is −ζ₆⊗ζ₆ and twice this boundary vanishes in the antisymmetric quotient. An element with Suslin image 2[ζ₆] has Borel coordinate 2D(ζ₆)/π≈0.6461 at the upper-half-plane embedding. The extension matrices remain rectangular when target dimensions differ; no determinant of a nonsquare matrix is asserted.

### Dependencies

Layer 4 universal Borel class and target coordinates; Layer 7 zeta determinant; the independent Deligne Chern-character, infinitesimal Chern–Weil/van Est and weight-two Bloch interfaces specified in this layer; ordinary matrix functoriality.

## Downstream consumers

ArithmeticKTheory uses the division-order rank theorem, the ring-of-integers/field rational comparison and the full regulator lattice; its finite-generation theorem for the arithmetic ring must be logically prior to that lattice statement. MotivicEtaleKTheory uses the all-weight factor two only after constructing its Deligne Chern character independently. Polylogarithms and K3BlochGroups use the evaluated weight-two coefficient: 1/π for Suslin's map with the labelling [x]=(0,∞,1,x), and −1/π in the cross-ratio labelling r(∞,0,1,z)=z. A consumer with another labelling or Tate generator converts through D(1/z)=−D(z) and its own generator. Higher-weight polylogarithm comparisons require separate universal-class identifications.

Period computations on arithmetic quotients use the compact inner-form cycles, the signed restriction-of-scalars form and the local-measure change identity. A comparison with an independently defined pairing must specify that pairing's primitive homology, coefficient generator and every local measure before a numerical scalar is asserted. The zeta theorem here concerns rational determinant lines and absolute covolumes; it does not assert an integral Lichtenbaum formula, a torsion-group order, or a choice of generator for an oriented determinant line.

## References

- **Borel 1974.** Armand Borel, [Stable real cohomology of arithmetic groups](https://www.numdam.org/item/ASENS_1974_4_7_2_235_0.pdf), Annales scientifiques de l’École normale supérieure, 4e série 7 (1974), 235–272.
- **Borel 1977.** Armand Borel, [Cohomologie de SLn et valeurs de fonctions zêta aux points entiers](https://www.numdam.org/item/ASNSP_1977_4_4_4_613_0.pdf), Annali della Scuola Normale Superiore di Pisa, 4e série 4 (1977), 613–636.
- **Borel 1980.** Armand Borel, [Errata-Corrigé: Cohomologie de SLn et valeurs de fonctions zêta aux points entiers](https://www.numdam.org/item/ASNSP_1980_4_7_2_373_0.pdf), Annali della Scuola Normale Superiore di Pisa, 4e série 7 (1980), 373.
- **Burgos.** José Ignacio Burgos Gil, [The Regulators of Beilinson and Borel](https://www.icmat.es/miembros/burgos/files/brbr.pdf), CRM Monograph Series 15, American Mathematical Society, 2002; author PDF.
- **Quillen.** Daniel Quillen; text prepared by Hyman Bass, [Finite generation of the groups Ki of rings of algebraic integers](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/bass-seattle.pdf), Algebraic K-Theory I, Lecture Notes in Mathematics 341 (1973), 179–198; collected scan headers 195–214.
- **Weibel IV.** Charles A. Weibel, [The K-book, Chapter IV: Definitions of Higher K-Theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.IV.pdf), Public author chapter PDF, accessed 2026-10-19.
- **Weibel VI.** Charles A. Weibel, [The K-book, Chapter VI: The Higher K-Theory of Fields](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.VI.pdf), Public author chapter PDF, accessed 2026-10-19.
- **Rapoport.** Michael Rapoport, [Comparison of the regulators of Beilinson and of Borel](https://ncatlab.org/nlab/files/Rapoport.pdf), Beilinson’s Conjectures on Special Values of L-Functions (1988), 169–192.
- **Goncharov.** Alexander B. Goncharov, [Polylogarithms, regulators, and Arakelov motivic complexes](https://arxiv.org/pdf/math/0207036), arXiv:math/0207036v3, 17 June 2004.
- **Borel 1953.** Armand Borel, [Sur la cohomologie des espaces fibrés principaux et des espaces homogènes de groupes de Lie compacts](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Borel-Sur.pdf), Annals of Mathematics 57 (1953), 115–207; published scan.
- **Putman–Studenmund.** Andrew Putman, Daniel Studenmund, [The dualizing module and top-dimensional cohomology group of GL_n(O)](https://arxiv.org/pdf/1909.01217v4), arXiv:1909.01217v4.
- **Godement I.** Roger Godement, [Les fonctions ζ des algèbres simples, I](https://www.numdam.org/item/SB_1958-1960__5__27_0/), Séminaire Bourbaki 5 (1958–1960), exposé 171, 27–49.
- **Godement II.** Roger Godement, [Les fonctions ζ des algèbres simples, II](https://www.numdam.org/item/SB_1958-1960__5__109_0/), Séminaire Bourbaki 5 (1958–1960), exposé 176, 109–128.
- **Mars.** J. G. M. Mars, [Les nombres de Tamagawa de groupes semi-simples](https://www.numdam.org/item/SB_1968-1969__11__79_0/), Séminaire Bourbaki 11 (1968–1969), exposé 351, 79–94.
- **Platonov–Rapinchuk–Rapinchuk.** Vladimir Platonov, Andrei Rapinchuk, Igor Rapinchuk, *Algebraic Groups and Number Theory*, Volume I, 2nd edition, Cambridge Studies in Advanced Mathematics 205, Cambridge University Press, 2023.
- **Matsushima.** Yozô Matsushima, [On Betti numbers of compact, locally symmetric Riemannian manifolds](https://ir.library.osaka-u.ac.jp/repo/ouka/all/5711/omj14_01_01.pdf), Osaka Math. J. 14 (1962), 1–20.
- **Kaneyuki–Nagano.** Soji Kaneyuki, Tadashi Nagano, [On certain quadratic forms related to symmetric Riemannian spaces](https://ir.library.osaka-u.ac.jp/repo/ouka/all/10195/omj14_02_03.pdf), Osaka Math. J. 14 (1962), 241–252.

Borel's 1980 correction is used with the 1977 period formulae: the algebraic restriction-of-scalars normalisation uses the signed embedding determinant, whereas the positive Haar measure uses the absolute discriminant. In the public author copy of Weibel IV, Theorem 1.18, p.12, the field comparison is read with both sides rationalised. The finiteness discussion in the author copy of VI, Classical Data 8.1, p.47, is applied to finite-S integer rings, not to the field. The localisation example in §3.12 gives the reason for both distinctions; these remarks do not make a claim about a separate published edition.
