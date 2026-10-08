# Stable arithmetic cohomology and Borel regulators

This roadmap computes the stable real cohomology of the arithmetic groups SL_n(O), for O an order in a central division algebra over a number field F, and draws its three arithmetic consequences. The first is Borel's rank theorem: for i ≥ 2 the rank of K_i(O) is 0, r₁+r₂, 0, r₂ according to i modulo 4. The second is the Borel regulator r_Bo : K_{2j−1}(O_F) → V_j(F), j ≥ 2, whose image is a lattice in a real vector space of dimension d_j = r₁+r₂ (j odd) or r₂ (j even). The third is Borel's theorem that the covolume of this lattice is a rational multiple of the leading coefficient of the Dedekind zeta function ζ_F at s = 1−j. The roadmap ends with the comparison r_Bo = 2·r_Be with the Beilinson regulator in every weight.

The targets are mathematical specifications with proposed declaration names; a name without a prefix belongs to the namespace `TauCeti.Borel`. Nothing here is a claim of formalisation. The [packet](../packets/BorelRegulators.json) records the same declarations with their prerequisites, and the [suggested file](../suggested/BorelRegulators.lean) gives Lean signatures where the pinned libraries can state them. This document is definitive.

## Scope and completion criterion

The roadmap is complete when the library contains the following, with the stated generality.

1. For a central division algebra D over a number field and an order O, the arithmetic groups SL_n(O) with their block inclusions; the building of proper nonzero subspaces of a D-module, its Steinberg module, the Solomon–Tits theorem, and finite generation of the homology of arithmetic groups with Steinberg coefficients (R.1).
2. Borel's map j_Γ from invariant forms to the cohomology of an arithmetic group, identified with restriction in continuous cohomology, natural for block inclusions and multiplicative (R.2).
3. The stable cohomology of the compact duals SU/SO, SU/USp and SU; the theorems of Matsushima, Garland and Borel giving the range in which j_Γ is bijective, with the explicit bound 4q < n−1 for SL_n of a division algebra; the stable cohomology of SL(O) as an exterior Hopf algebra; and the rank theorem for K_i(O), i ≥ 2 (R.3).
4. The regulator target V_j(F) with its coordinates and reference lattice; the universal Borel class with its trace-form representative; the regulator on K_{2j−1}(F) and K_{2j−1}(O_F), with naturality, transfer, Adams weight j, the real isomorphism, the lattice, the determinant and the covolume R_Bo,j(F) (R.4).
5. The order of vanishing d_j of ζ_F at 1−j, its leading coefficient, and Borel's theorem R_Bo,j(F) ∈ ℚ^×·|ζ_F^*(1−j)| (R.5).
6. The arithmetic inputs of that theorem: a division algebra of each degree split at the archimedean places, the Tamagawa number and the volume of its norm-one group, compact period cycles, and the comparison with Bloch's formulation through Tamagawa measures (R.6).
7. The equality Bo_j = 2·Be_j of universal classes for every j ≥ 2, its consequences for regulators, determinants and covolumes, and the test cases over ℚ and imaginary quadratic fields (R.7).

The statement relating the regulator to the zeta function is proportionality by a nonzero rational number. The integral refinement, which involves the torsion of K-groups and powers of 2, belongs to SpecialValuesBirchTate and ArithmeticKTheory and is not a target here. Rings of S-integers, finite generation of K-groups and all results on K₀, K₁ belong to ArithmeticKTheory.

## Conventions

*Fields and places.* F is a number field of degree d with r₁ real and r₂ complex places (Mathlib's `nrRealPlaces` and `nrComplexPlaces`); Σ_F is the set of all d embeddings F → ℂ, so each complex place has two elements of Σ_F above it. D_F is the signed discriminant.

*Division algebras and ranks.* D is a central division F-algebra of degree e, so dim_F D = e². An order O is a subring that is a full ℤ-lattice. The rank n of SL_n(D) is the dimension over D of the module D^n; the corresponding real groups consist of matrices of size ne or ne/2. Stable ranges are stated in terms of n. Arithmetic lattices P are right O-modules and V=P⊗_O D is a right D-space, with matrices acting on columns by left multiplication. Generic building prototypes use Mathlib’s left modules, so this arithmetic application takes the scalar ring Dᵐᵒᵖ. In arithmetic statements Δ_D(V) and St_D(V) denote the right-subspace building and module, implemented by these generic constructions over Dᵐᵒᵖ.

*Strict integer part.* [x]′ is the greatest integer strictly smaller than x. Borel's range for SL_n(O) is q ≤ [(n−1)/4]′, that is 4q < n−1.

*Twists.* ℝ(a) = (2πi)^a ℝ ⊂ ℂ, and π_a(z) = (z + (−1)^a z̄)/2 is the projection of ℂ onto ℝ(a). For j ≥ 2 the target V_j(F) is the subspace of ∏_{σ∈Σ_F} ℝ(j−1) fixed by simultaneous complex conjugation of coefficients and embeddings. After dividing by (2πi)^{j−1} it is the space of functions f : Σ_F → ℝ with f(σ̄) = (−1)^{j−1} f(σ). Coordinates are chosen only after this space is defined: one embedding above each complex place, and the real embeddings when j is odd. The reference lattice is ℤ^{I_j} in these coordinates and has covolume one; a pair of conjugate embeddings contributes no factor √2.

*Regulator normalisation.* The Borel class Bo_j ∈ H^{2j−1}_cont(GL_N(ℂ); ℝ(j−1)) is Burgos's: the suspension of the Chern character component ch_j = (2πi)^j pr_j / j!, restricted to U_N, transported to relative Lie algebra cohomology and then to continuous cohomology by van Est. With the same conventions on the Beilinson side, Bo_j = 2·Be_j. Borel's original regulator, defined through the homotopy lattice of the compact dual, differs from the one used here by (2π)^{d_j}, and by a further 2^{r₁} when j ≡ 3 mod 4.

*Zeta function.* Γ_ℝ(s) = π^{−s/2}Γ(s/2), Γ_ℂ(s) = 2(2π)^{−s}Γ(s), Λ_F(s) = |D_F|^{s/2} Γ_ℝ(s)^{r₁} Γ_ℂ(s)^{r₂} ζ_F(s), with Λ_F(s) = Λ_F(1−s). ζ_F^*(1−j) is the first nonzero Taylor coefficient at 1−j. x ∼ y means x/y ∈ ℚ^×.

*Discriminants.* For an ordered integral basis and ordered embeddings, δ_F = det(σ_i(α_a)) satisfies δ_F² = D_F. Algebraic differential forms on a restriction of scalars are normalised with δ_F; positive Haar measures with |D_F|^{1/2}. The two differ by a power of i, which Borel's printed formulas misplace and his published correction restores.

## Ownership and dependencies

Every object below that another roadmap plans is imported from it; the packet cites the supplying declaration, and where none exists yet it records a request to the supplying layer.

- **AdelicAlgebraicGroups** owns adelic points, integral models, Tamagawa measures and numbers in general (AA.2), reduction theory, Siegel sets and compactness of anisotropic quotients (AA.3), strong approximation and neat subgroups (AA.4). This roadmap uses those nodes and asks AA.1 for the algebraic groups attached to a central simple algebra. The Tamagawa number of the norm-one group of a division algebra is computed here, in R.6.
- **ArithmeticLocallySymmetricSpaces** owns the Borel–Serre bordification, its compact quotient and triangulation (ALS.2), duality at finite level (ALS.5:finite-level-duality) and the comparison of Betti, de Rham and relative Lie algebra cohomology (ALS.5/de-rham-comparison). This roadmap asks it for the identification of the boundary with the building, and for naturality and multiplicativity of the comparison.
- **AutomorphicFormsOnReductiveGroups** AF.1a owns relative Lie algebra cochains, invariant forms and the van Est isomorphism.
- **StableHomotopyKTheory** owns the plus construction, its H-space structure, the Cartan–Serre theorem for H-spaces (H.3/rational-hurewicz-hspace) and the homology of filtered colimits. **GeneralAlgebraicKTheory** owns the K-groups of a ring, the plus-equals-Q theorem and transfers (K.2, K.3). **KTheoryLowDegrees** owns Whitehead's lemma.
- **ArithmeticKTheory** N.3 owns Quillen's rank filtration, finite generation of K_n(O_F) and the passage from O_F to rings of S-integers and to F. It consumes the Steinberg homology finiteness of R.1 and the rank theorem of R.3; this roadmap consumes its finite generation theorem and its rational localisation isomorphism in R.4, and plans neither.
- **SchemeKTheoryOperations** S.6 owns Adams operations on higher K-groups; **RefinedTraceMethods** RT.4:topological owns topological K-theory, the Chern character and Bott periodicity.
- **MotivicEtaleKTheory** M.8 owns the Deligne regulator and its normalisation for number fields. Its node comparing determinants consumes R.7.
- **AutomorphicLFunctionsAndLocalFactors** AL.1 owns the continuation and functional equation of Hecke L-functions, of which ζ_F is the case of the trivial character.
- **SemisimpleAlgebrasPartII** owns the index of a Brauer class; **ClassicalArithmeticCompletion** CA.7 owns orders. **Polylogarithms** P.1–P.2 and **K3BlochGroups** V.3–V.4 own the Bloch–Wigner function and Suslin's map.
- Tau Ceti's AlgebraicTopology, Lie groups, ClassFieldTheory and Chebotarev roadmaps are prerequisites. Tau Ceti's order complex of a preorder is the carrier of the building.

## Order of the layers

Within the roadmap the declarations depend on each other in the order R.1, R.2, R.3, R.4, then the zeta-function part of R.5, then the volume and cycle part of R.6 together with the compact-fibre comparison, then Borel's period and regulator theorems in R.5, then Bloch's reformulation in R.6, and finally R.7. The layers R.5 and R.6 are therefore each divided in two, as recorded under "Proposed changes of structure".

## R.1 — Arithmetic groups and finiteness infrastructure

**Objects.** The arithmetic groups Γ_n = SL_n(O) and Γ_P = Aut_O(P) attached to an order O in a central division algebra D over F, with the algebraic groups G_n = Res_{F/ℚ} SL_n(D) containing them, the real Lie groups G_n(ℝ) and the block inclusions. The building Δ(V) of a D-module V: the order complex of its proper nonzero subspaces. The Steinberg module St_D(V), the reduced homology of Δ(V) in its top degree n−2, with St = ℤ in rank one.

**Theorems.** Solomon–Tits: Δ(V) is a wedge of (n−2)-spheres, so St_D(V) is free and generated by apartment classes. Finiteness: H_i(Γ; St_D(V)) is finitely generated for every group Γ commensurable with Aut_O(P), by duality for a torsion-free subgroup of finite index that preserves orientation, followed by descent through the finite quotient. The Steinberg module itself has infinite rank, so this is not a consequence of the finiteness of a classifying space.

**Boundary with ArithmeticKTheory.** Quillen's proof that K_n(O_F) is finitely generated filters the Q-construction by rank; the relative homology of a rank layer is a sum of groups H_*(Aut(P); St). That filtration, the passage from homology to homotopy and the finite generation theorem are ArithmeticKTheory N.3:finite-generation. Its only arithmetic input is the finiteness theorem of this layer, which is stated for nonfree projective modules and for all commensurable groups so that it applies there directly.

**Dependencies.** Orders from ClassicalArithmeticCompletion CA.7; the groups of a central simple algebra from AdelicAlgebraicGroups AA.1 (request); arithmetic subgroups of a level and neat subgroups from AA.3 and AA.4; the bordification and its compact quotient from ArithmeticLocallySymmetricSpaces ALS.2, duality from ALS.5:finite-level-duality, and the identification of the boundary with the building as a request to ALS.2; reduced homology and spectral sequences from Tau Ceti AlgebraicTopology stages 2, 4 and 5; maximal compact subgroups from Tau Ceti LieGroups Layer 9. The order complex is Tau Ceti's `AbstractSimplicialComplex.orderComplex`.

### Arithmetic groups of division-algebra orders

**Declaration** `orderArithmeticSystem` · construction · node `R.1/order-arithmetic-system` · planet “Arithmetic groups of orders”.

Let F be a number field, D a finite-dimensional central division F-algebra of degree e, and O a ℤ-order in D in the sense of ClassicalArithmeticCompletion CA.7 (a subring containing 1 that is a full ℤ-lattice). For n≥2 put G_n=Res_{F/ℚ} SL_n(D), the group of elements of M_n(D) of reduced norm one, and Γ_n=SL_n(O)=G_n(ℚ)∩M_n(O). For a projective right O-lattice P of rank n≥1, put V=P⊗_O D, a right D-space isomorphic to D^n, and put Γ_P=Aut_O(P)⊂GL_D(V). The construction makes Γ_n and Γ_P arithmetic subgroups of Res_{F/ℚ}SL_n(D) and Res_{F/ℚ}GL_D(V), records the real Lie group G_n(ℝ)=∏_{v|∞}SL_n(D⊗_F F_v) with each factor SL_{ne}(ℝ), SL_{ne/2}(ℍ) or SL_{ne}(ℂ), and records the block maps g↦diag(g,1) from Γ_n to Γ_{n+1} and from G_n to G_{n+1}.

**Hypotheses.**

- O is a subring of D containing 1 which is finitely generated as a ℤ-module and spans D over ℚ; D is a division algebra with centre F.
- In the arithmetic application P is a right O-module and V=P⊗_O D is a right D-space; matrices act on columns by left multiplication. In Mathlib this is a left Module Dᵐᵒᵖ V. The generic building and Steinberg constructions apply to that opposite division algebra, and GL_D(V) here denotes right-D-linear automorphisms. In arithmetic statements Δ_D(V) and St_D(V) mean the right-subspace constructions, implemented by the generic building and Steinberg module over Dᵐᵒᵖ.

**Construction.**

1. Take the central simple carrier from Mathlib's CSA and orders from CA.7/order-in-finite-dimensional-algebra. The reduced norm, the affine F-groups GL_n(D) and SL_n(D), their restriction of scalars to ℚ and the arithmeticity of the stabiliser of a lattice are requested from AdelicAlgebraicGroups AA.1. Keep the right-module/opposite-algebra dictionary in the AA.1 import, so the lattice stabiliser agrees with the tensor-product convention used in Quillen’s rank filtration.
2. Γ_n is the stabiliser in G_n(ℚ) of the lattice O^n, and Γ_P the stabiliser of P; both are of the form G(ℚ)∩U for a compact open U (AA.3/arithmetic-subgroup-of-level). Any two orders of D are commensurable, so the commensurability class of Γ_n does not depend on O.
3. At a real place D⊗_F F_v is M_e(ℝ) or M_{e/2}(ℍ), and at a complex place it is M_e(ℂ) (Borel 1974, 11.5(1)). Block diagonal extension multiplies the reduced norm by one.
4. A minimal parabolic ℚ-subgroup of G_n is the stabiliser of a full flag of D-subspaces, with maximal ℚ-split torus of dimension n−1; hence rank_ℚ G_n=n−1.

**Used by.**

- Borel 1974, §11.5 and Proposition 12.2: The sequence Γ_n with its block maps is the arithmetic system whose stable cohomology is computed.
- BorelRegulators:R.3/classical-compact-duals: The archimedean factors determine the compact duals, and rank_ℚ G_n=n−1 enters the stable range.
- ArithmeticKTheory:N.3:finite-generation/steinberg-homology-of-automorphism-groups: Aut_O(P) for a nonfree projective P is commensurable with GL_n(O), so its Steinberg homology is covered by R.1.

**API.**

- `orderArithmeticSystem_block` (functoriality): The block inclusion Γ_n→Γ_{n+1} agrees with diag(g,1) on matrices and composes to diag(g,I_r).
- `orderArithmeticSystem_archimedean` (projection): The real Lie group of G_n is the product of the factors SL_{ne}(R), SL_{ne/2}(H) at ramified real places, and SL_{ne}(C) at complex places.
- `orderArithmeticSystem_rank` (characterisation): For n≥2, rank_Q G_n=n−1.
- `orderArithmeticSystem_equiv` (compatibility): An order algebra isomorphism induces the corresponding isomorphism of matrix groups and commutes with every block inclusion.
- `orderArithmeticSystem_projective` (data): For a projective right O-lattice P of rank n≥1 spanning V, Aut_O(P) is an arithmetic subgroup of Res_{F/ℚ}GL_D(V), commensurable with GL_n(O) after a choice of D-basis of V.

**Unit tests.**

- `orderArithmeticSystem_split` (compatibility): For D=F and O=O_F, Γ_n=SL_n(O_F).
- `orderArithmeticSystem_rank_two` (computation): For n=2 and any central division D, rank_Q G_2=1.
- `orderArithmeticSystem_norm_one` (non-example): For F=Q, diag(2,1) lies in GL_2(Q) but not in Γ_2 for O=Z, and not in SL_2(Q).

**Acceptance.**

- For D=F and O=O_F obtain the ordinary SL_n(O_F), not GL_n or norm-one units of O_F.
- The Q-rank of G_n is n−1 independently of the degree of D.

**Depends on.** Declarations of other roadmaps: `ClassicalArithmeticCompletion:CA.7/order-in-finite-dimensional-algebra`, `AdelicAlgebraicGroups:AA.3/arithmetic-subgroup-of-level`; Layers, with a request: `AdelicAlgebraicGroups:AA.1`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-9-the-cartan-iwasawa-and-kak-decompositions`; Pinned libraries: `mathlib:CSA`.

**Source.** [Armand Borel, *Stable real cohomology of arithmetic groups*](https://www.numdam.org/item/ASENS_1974_4_7_2_235_0.pdf), §11.5, p.268. The arithmetic groups of matrices over an order of D, the three types of archimedean factor and the value n−1 of the rational rank are the system used for Proposition 12.2.

**Source.** [Daniel Quillen; text prepared by Hyman Bass, *Finite generation of the groups Ki of rings of algebraic integers*](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/bass-seattle.pdf), §2, pp.185–186 (scan headers 201–202). The arithmetic use of the division-ring building is stated for right vector spaces; this fixes the right-projective lattice and opposite-ring dictionary.

### The spherical building over a division algebra

**Declaration** `divisionBuilding` · definition · node `R.1/division-building` · planet “Spherical building”.

For a division ring D and a D-module V of finite dimension n, let S(V) be the type of proper nonzero D-subspaces of V, ordered by inclusion. The building Δ(V) is the order complex of S(V), in the sense of Tau Ceti's AbstractSimplicialComplex.orderComplex: its vertices are the elements of S(V) and its faces are the nonempty finite chains. A D-linear equivalence V≃W induces an isomorphism Δ(V)≅Δ(W) by taking images of subspaces, so Aut_D(V) acts simplicially on Δ(V). For n≤1 the type S(V) is empty and Δ(V) is the empty complex; reduced homology in degree −1 is fixed in the Steinberg module, not here.

**Hypotheses.** D is a division ring, not necessarily commutative; V is a D-module of finite dimension. This is a left module in Mathlib; for an arithmetic right D-space use the scalar ring Dᵐᵒᵖ.

**Construction.**

1. Define S(V) as the subtype of Submodule D V cut out by W≠⊥ and W≠⊤, with the induced partial order, and apply orderComplex.
2. A linear equivalence gives an order isomorphism of S(V) with S(W) (Submodule.map); orderComplexMap, with its identity and composition laws, turns it into a simplicial isomorphism.
3. Faces are read off from mem_orderComplex_iff. The pair_mem_orderComplex_iff theorem characterises a two-vertex set as a face by comparability even when the two listed vertices coincide; an edge additionally has cardinality two. Thus W,W′ span an edge exactly when W≠W′ and either W≤W′ or W′≤W.

**Used by.**

- Quillen 1973, Theorems 2 and 3: Its reduced homology is the coefficient module of the rank filtration.
- ArithmeticKTheory:N.3:finite-generation/layer-poset-is-the-suspended-building: The poset of layers of V is the suspension of Δ(V), equivariantly for GL(V).
- BorelRegulators:R.1/steinberg-duality-finiteness: Δ(V) is the homotopy type of the Borel–Serre boundary, which makes its top homology the dualizing module.

**API.**

- `divisionBuilding_vertices` (data): The vertex type of Δ(V) is S(V), the proper nonzero D-subspaces of V.
- `divisionBuilding_simplex` (characterisation): A finite set of vertices is a face iff it is nonempty and totally ordered by inclusion.
- `divisionBuilding_edge` (characterisation): Two vertices W, W′ span an edge iff W≠W′ and (W≤W′ or W′≤W); an edge is a face with two distinct vertices.
- `divisionBuilding_map` (functoriality): A D-linear equivalence V≃W induces a simplicial isomorphism Δ(V)≅Δ(W), with identity and composition laws.
- `divisionBuilding_action` (structure): Aut_D(V) acts on Δ(V) by simplicial automorphisms; every subgroup, in particular Aut_O(P), acts by restriction.
- `divisionBuilding_dim` (characterisation): Every face has at most n−1 vertices, and a maximal chain has exactly n−1; so Δ(V) has dimension n−2 for n≥2.

**Unit tests.**

- `divisionBuilding_rank_one` (degenerate): For V=D of dimension one, S(V) is empty and Δ(V) has no faces.
- `divisionBuilding_rank_two` (computation): For dim V=2 every face of Δ(V) is a single vertex: two distinct lines are incomparable, so there is no edge.
- `divisionBuilding_rank_three_edge` (computation): For V=D³ with basis e₁,e₂,e₃, the line De₁ and the plane De₁+De₂ span an edge, and De₁ and De₂ do not.
- `divisionBuilding_not_order_submodules` (non-example): For V=ℚ², neither ℤ² nor 2ℤ² is a vertex: they are not ℚ-subspaces, and the subspace each spans is the excluded V.
- `divisionBuilding_repeated_vertex` (non-example): For any proper nonzero subspace W, {W,W}={W} is a face with one vertex and is not an edge, despite W≤W.

**Acceptance.**

- Vertices are subspaces over D; lattices over an order are not vertices.
- The definition is the Tau Ceti order complex of a subtype of Mathlib's Submodule D V; no second simplicial-complex structure is introduced.
- Distinguish a pair that is a face from an edge: a repeated vertex produces a singleton face.

**Depends on.** Pinned libraries: `tauceti:TauCeti.AbstractSimplicialComplex.orderComplex`, `tauceti:TauCeti.AbstractSimplicialComplex.mem_orderComplex_iff`, `tauceti:TauCeti.AbstractSimplicialComplex.pair_mem_orderComplex_iff`, `tauceti:TauCeti.AbstractSimplicialComplex.orderComplexMap`, `mathlib:AbstractSimplicialComplex`.

**Source.** [Daniel Quillen; text prepared by Hyman Bass, *Finite generation of the groups Ki of rings of algebraic integers*](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/bass-seattle.pdf), §1, before Theorem 2, p.180; §2, pp.185–190 (scan headers 196, 201–206). Quillen attaches to a vector space over the fraction field, or over a division algebra, the building of its proper nonzero subspaces and uses it for orders in division algebras.

**Source.** [Andrew Putman, Daniel Studenmund, *The dualizing module and top-dimensional cohomology group of GL_n(O)*](https://arxiv.org/pdf/1909.01217v4), §1, p.3. The building of K^n is described as the complex of flags of proper nonzero subspaces, with the action of the general linear group.

### The integral Steinberg module

**Declaration** `steinbergModule` · definition · node `R.1/steinberg-module` · planet “Steinberg module”.

For a division ring D and a D-module V of finite dimension n≥1, the Steinberg module is St_D(V)=H̃_{n−2}(Δ(V);ℤ), the reduced integral homology of the building in its top degree, with the action of Aut_D(V) induced by the simplicial action. Reduced homology is that of the augmented chain complex, so for n=1 (empty building) St_D(V)=H̃_{−1}(∅;ℤ)=ℤ with trivial action, and for n=2 it is the kernel of the augmentation ℤ[lines of V]→ℤ. It is a ℤ[Aut_D(V)]-module and is in general not finitely generated as an abelian group.

**Hypotheses.** V has positive finite D-dimension n.

**Construction.**

1. Take the augmented simplicial chain complex of Δ(V), equivalently the reduced singular chains of its realization (Tau Ceti's AbstractSimplicialComplex.Realization); the comparison of the two is requested from Tau Ceti AlgebraicTopology stages 2 and 4.
2. The simplicial action of Aut_D(V) acts on chains and passes to homology.
3. For n=1 the augmented complex of the empty complex is ℤ in degree −1.

**Used by.**

- Quillen 1973, Theorem 3: Coefficient module of the relative homology of the rank filtration.
- ArithmeticKTheory:N.3:finite-generation/relative-rank-homology-comparison: The relative homology of a rank layer is a sum of H_{i−m}(Aut(P);St(P⊗F)).
- BorelRegulators:R.1/steinberg-duality-finiteness: Dualizing module of torsion-free arithmetic subgroups, up to the orientation character.

**API.**

- `steinbergModule_action` (structure): St_D(V) is a Z[Aut_D(V)]-module induced from the action on augmented chains.
- `steinbergModule_equiv` (functoriality): Linear equivalences give equivariant module equivalences, preserving identity and composition.
- `steinbergModule_rank_one` (simp): St_D(D)=Z with trivial automorphism action.
- `steinbergModule_rank_two` (compatibility): St_D(D²) is canonically the kernel of the sum-of-coefficients map Z[P¹(D)]→Z.
- `steinbergModule_apartment` (constructor): An ordered D-basis gives the oriented apartment class; permutations act by their sign and replacing any basis vector by a nonzero multiple leaves the apartment unchanged.

**Unit tests.**

- `steinbergModule_one` (degenerate): St_D(D)=Z, not zero.
- `steinbergModule_two` (computation): For D=F_q, rank_Z St_D(D²)=q.
- `steinbergModule_rational_lines` (non-example): For D=Q and n=2 the underlying abelian group has infinite rank, although a torsion-free subgroup of finite index in GL₂(ℤ) has a finite classifying-space model.

**Acceptance.**

- For n=2 it is the kernel of the augmentation ℤ[lines of V]→ℤ, not H₀ of the set of lines.
- For n=1 it is ℤ, so that the rank-one term of the rank filtration is the homology of the unit group with constant coefficients.

**Depends on.** This roadmap: `R.1/division-building`; Layers, with a request: `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology`; Pinned libraries: `tauceti:AbstractSimplicialComplex.Realization`.

**Source.** [Daniel Quillen; text prepared by Hyman Bass, *Finite generation of the groups Ki of rings of algebraic integers*](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/bass-seattle.pdf), §1, definition before Theorem 3, p.181 (scan header 197). The coefficient of the rank filtration is the top reduced homology of the building, with the rank-one convention ℤ.

**Source.** [Andrew Putman, Daniel Studenmund, *The dualizing module and top-dimensional cohomology group of GL_n(O)*](https://arxiv.org/pdf/1909.01217v4), §1, p.3. The Steinberg module is the top reduced homology of the building with its action of the general linear group.

### Solomon–Tits theorem over division rings

**Declaration** `solomonTits` · theorem · node `R.1/solomon-tits` · planet “Solomon–Tits theorem”.

For a division ring D and a D-module V of finite dimension n≥2, the realization of Δ(V) is homotopy equivalent to a wedge of spheres of dimension n−2, possibly infinitely many. Hence the reduced integral homology of Δ(V) vanishes outside degree n−2, St_D(V) is a free abelian group, and it is generated by the apartment classes: for an ordered basis (v₁,…,v_n) of V the subcomplex of subspaces spanned by proper nonempty subsets of the basis is a simplicial (n−2)-sphere, and its fundamental class is the apartment class of the basis.

**Hypotheses.** D division; n≥2.

**Proof.**

1. Fix a line L. Deleting the vertices that are hyperplanes complementary to L leaves a contractible subcomplex (compare W with W+L), and Δ(V) is obtained from it by attaching, for each such hyperplane H, a cone over the link of H, which is the building of H.
2. Induct on n: the link has the homotopy type of a wedge of (n−3)-spheres, so each attachment adds suspensions of these, giving a wedge of (n−2)-spheres. The case n=2 is a discrete set, a wedge of 0-spheres.
3. The induction also shows that the top homology is spanned by classes of apartments; the homotopy and homology of the pushouts are those of Tau Ceti AlgebraicTopology stages 2 and 4.

**Acceptance.**

- For n=2 the building is a discrete set with at least three points; it is not connected, and St is the augmentation kernel.
- For D=𝔽_q and n=2, St has rank q, the number of lines minus one.

**Depends on.** This roadmap: `R.1/division-building`, `R.1/steinberg-module`; layers, with a request: `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology`.

**Source.** [Daniel Quillen; text prepared by Hyman Bass, *Finite generation of the groups Ki of rings of algebraic integers*](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/bass-seattle.pdf), §1, Theorem 2, p.180; §2, proof, pp.186–188 (scan headers 196, 202–204). States that the building of an n-dimensional space has the homotopy type of a wedge of (n−2)-spheres and proves it by the inductive attachment argument.

**Source.** [Andrew Putman, Daniel Studenmund, *The dualizing module and top-dimensional cohomology group of GL_n(O)*](https://arxiv.org/pdf/1909.01217v4), §1, pp.3 and 5. Recalls the Solomon–Tits theorem and that the Steinberg module is generated by apartment classes.

### Finiteness of Steinberg-coefficient homology

**Declaration** `steinbergHomology_finitelyGenerated` · theorem · node `R.1/steinberg-duality-finiteness` · planet “Steinberg homology finiteness”.

Let O be an order in a central division algebra D over a number field F, P a projective right O-lattice of rank n≥1, V=P⊗_O D, and Γ a subgroup of Aut_D(V) commensurable with Aut_O(P). Then H_i(Γ;St_D(V)) is a finitely generated abelian group for every i≥0. More precisely, let G=Res_{F/ℚ}GL_D(V), let A_G be its maximal ℚ-split central torus, and let X̄ be the Borel–Serre bordification of X=G(ℝ)/(K·A_G(ℝ)°), of dimension d, and let Γ′⊂Γ be a torsion-free subgroup of finite index that acts on X̄ preserving orientation. Then, with ν=d−(n−1), H_i(Γ′;St_D(V)⊗M)≅H^{ν−i}(Γ′;M) for all i and every ℤ[Γ′]-module M that is finitely generated and free over ℤ, in particular for M=ℤ. For a torsion-free Γ′ that does not preserve orientation, St_D(V) is replaced by its twist by the orientation character; for D=F and Γ′⊂GL_n(O_F) that character is the (n−1)-st power of g↦sign N_{F/ℚ}(det g).

**Hypotheses.**

- Γ is commensurable with Aut_O(P); for D=F and O=O_F this is every subgroup of GL_n(F) commensurable with GL_n(O_F).
- The duality statement is integral and needs Γ′ torsion-free; a finite CW model of BΓ′ alone does not bound H_*(Γ′;St), since St is not finitely generated over ℤ.
- Remove the connected real points of the maximal ℚ-split central torus before defining d. For D=F, d=r₁n(n+1)/2+r₂n²−1 and ν=d−(n−1)=r₁n(n+1)/2+r₂n²−n (Putman–Studenmund, Proposition 2.1, p.8).

**Proof.**

1. Choose Γ′⊂Γ normal, of finite index, neat (AA.4/neat-level-exists, hence torsion-free by AA.4/neat-torsion-free) and inside the kernel of the orientation character, which has index at most two.
2. Use the symmetric space with its ℚ-split central factor removed. Its bordification X̄ is a contractible manifold with corners on which Γ′ acts freely with compact quotient Y (ALS.2/borel-serre-bordification, ALS.2/borel-serre-quotient-compact), and Y has a finite triangulation (ALS.2/borel-serre-finite-triangulation); so H^*(Γ′;M)=H^*(Y;M) is finitely generated.
3. The boundary of X̄ is Γ′-equivariantly homotopy equivalent to the building of rational parabolic subgroups of G, which is Δ(V) because parabolics are stabilisers of flags of D-subspaces; this is requested from ArithmeticLocallySymmetricSpaces ALS.2. By Solomon–Tits the relative chain complex of (X̄,∂X̄) is a bounded complex of free ℤ[Γ′]-modules whose homology is St_D(V), in degree n−1 only (ℤ in degree zero when n=1).
4. Hence H_m(Y,∂Y;M)≅H_{m−n+1}(Γ′;St⊗M). Poincaré–Lefschetz duality on the compact oriented manifold with boundary Y (ALS.5:finite-level-duality/verdier-poincare-duality, with trivial orientation sheaf by the choice of Γ′) identifies H_m(Y,∂Y;M) with H^{d−m}(Y;M), which gives the displayed isomorphism.
5. The Lyndon–Hochschild–Serre spectral sequence H_p(Γ/Γ′;H_q(Γ′;St))⇒H_{p+q}(Γ;St) (Tau Ceti AlgebraicTopology stage 5) has finitely generated terms, since the homology of a finite group with finitely generated coefficients is finitely generated. For n=1 the coefficient is ℤ and only the finite model and this descent are used.

**Acceptance.**

- For F=ℚ, n=2 and Γ′ torsion-free of finite index in SL₂(ℤ): ν=1, H¹(Γ′;ℤ)≅H₀(Γ′;St) and H⁰(Γ′;ℤ)≅H₁(Γ′;St).
- For n even and O_F with a unit of norm −1, the dualizing module of GL_n(O_F) is the twist of St by the sign of the norm of the determinant and is not St itself; the statement keeps the twist.
- For n=1 the statement is finite generation of the homology of a group commensurable with O^×.
- For F=ℚ, D=F and n=2, d=2 and ν=1; retaining the positive scalar centre would incorrectly give d=3.

**Depends on.** This roadmap: `R.1/solomon-tits`, `R.1/order-arithmetic-system`; Declarations of other roadmaps: `ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-bordification`, `ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-quotient-compact`, `ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-finite-triangulation`, `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/verdier-poincare-duality`, `AdelicAlgebraicGroups:AA.4/neat-level-exists`, `AdelicAlgebraicGroups:AA.4/neat-torsion-free`; Layers, with a request: `ArithmeticLocallySymmetricSpaces:ALS.2`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`; Pinned libraries: `mathlib:groupHomology`.

**Source.** [Daniel Quillen; text prepared by Hyman Bass, *Finite generation of the groups Ki of rings of algebraic integers*](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/bass-seattle.pdf), §1, proof of Theorem 1, pp.182–184 (scan headers 198–200). Finiteness of the Steinberg homology of Aut(P) is deduced from Borel–Serre duality for a torsion-free normal subgroup of finite index, and from the spectral sequence of the finite quotient.

**Source.** [Andrew Putman, Daniel Studenmund, *The dualizing module and top-dimensional cohomology group of GL_n(O)*](https://arxiv.org/pdf/1909.01217v4), Theorem C, p.4; §2.1, Proposition 2.1, p.8, and the proof of Theorem C, pp.9–10. Identifies the dualizing module of GL_n(O_F) as the Steinberg module twisted by the (n−1)-st power of the sign of the norm of the determinant, from the orientation behaviour of the action on the Borel–Serre manifold with corners, whose boundary is the building.

## R.2 — Continuous and relative Lie-algebra cohomology

**Objects.** For a homomorphism from a discrete group to a real Lie group, the restriction map from continuous cohomology to group cohomology; it is Mathlib's map of homogeneous continuous cochains followed by the comparison with group cohomology of a discrete group. For an arithmetic subgroup Γ of a semisimple ℚ-group G, Borel's map j_Γ from invariant forms on the symmetric space X = K\G(ℝ) to H^*(Γ; ℝ).

**Conventions.** Invariant forms are closed, and the space of forms invariant under G(ℝ)° is the relative Lie algebra cohomology H^*(g, k; ℝ) = (∧p^*)^{K°}. The source of j_Γ consists of the forms invariant under G(ℝ)° and under Γ; when Γ meets every component of G(ℝ) this is the cohomology H^*(g, K; ℝ) of the pair with the full maximal compact subgroup. For the groups G_n of R.1 the real points are connected and the distinction disappears; it matters for PGL₂, where the class of the invariant area form is not invariant under the second component.

**Theorems.** j_Γ is the map induced on relative Lie algebra cohomology by the inclusion of the constants in C^∞(Γ\G(ℝ)), and corresponds to restriction of continuous cohomology under van Est. It is natural for morphisms of groups with compatible maximal compact subgroups, in particular for block inclusions, and carries wedge products to cup products. On the stable groups, block sum makes homology a Hopf algebra and the comparison a morphism of Hopf algebras; primitive homology classes are dual to indecomposable cohomology classes.

**Dependencies.** Relative Lie algebra cochains, invariant forms and van Est from AF.1a; the comparison of Betti, de Rham and relative Lie algebra cohomology from ALS.5/de-rham-comparison, which uses no automorphic forms; the H-space structure of BGL(O)⁺ from StableHomotopyKTheory H.4. Requests: the comparison of continuous and discrete cohomology in all degrees (AF.1a), and naturality and multiplicativity of the de Rham comparison (ALS.5).

### Restriction of continuous classes to arithmetic groups

**Declaration** `arithmeticRestriction` · construction · node `R.2/arithmetic-restriction` · planet “Arithmetic restriction”.

For a real Lie group G, a group Γ with the discrete topology, a homomorphism φ:Γ→G, q≥0 and a finite-dimensional real vector space E with trivial action, res_φ:H_cont^q(G;E)→H^q(Γ;E) is Mathlib's ContinuousCohomology.map for φ with identity coefficients, followed by the identification of the continuous cohomology of the discrete group Γ with Mathlib's group cohomology, in every degree. It is used for an arithmetic subgroup Γ⊂G(ℝ), and for GL_N(F)→GL_N(ℂ) induced by an embedding of a field F in ℂ. On cochains it is ContinuousCohomology.cochainsMap: precomposition of homogeneous continuous cochains with φ.

**Hypotheses.** Γ carries the discrete topology, so the inclusion Γ→G(ℝ) is a continuous homomorphism; E is a finite-dimensional real vector space with trivial action.

**Construction.**

1. The map on continuous cohomology, with its identity and composition laws, is Mathlib's ContinuousCohomology.map; no second continuous cochain complex is defined. AF.1a/differentiable-cochains identifies the homogeneous cochains with continuous functions on G^{q+1}.
2. For the discrete group Γ, continuous cochains are all cochains. The comparison of their cohomology with Mathlib's group cohomology of Γ in every degree is requested from AutomorphicFormsOnReductiveGroups AF.1a; the pinned Tau Ceti equivalence explicitH2IsoGroupCohomology is its degree-two case.
3. Compatibility with coefficient maps and with cup products is checked on cochains.

**Used by.**

- Borel 1974, §10.2: Identifies the analytic invariant-form comparison with continuous restriction.
- BorelRegulators:R.4: Pulls the universal Borel class back to arithmetic group homology.

**API.**

- `arithmeticRestriction_cochains` (compatibility): Its cochain representative is ContinuousCohomology.cochainsMap for the inclusion and identity coefficients.
- `arithmeticRestriction_id` (functoriality): Restriction along the identity is the identity.
- `arithmeticRestriction_comp` (functoriality): For Δ⊂Γ⊂G, res_Δ=res_{Δ⊂Γ}∘res_Γ.
- `arithmeticRestriction_coeff` (functoriality): For a real linear coefficient map E→E′, coefficient extension commutes with restriction.
- `arithmeticRestriction_cup` (compatibility): Restriction preserves cup products and units for compatible algebra coefficients.

**Unit tests.**

- `arithmeticRestriction_degree_zero` (computation): For trivial coefficients, the degree-zero restriction R→R is identity.
- `arithmeticRestriction_trivial_group` (degenerate): For Γ={1} and q>0, restriction has zero target.
- `arithmeticRestriction_degree_two` (compatibility): The degree-two discrete comparison agrees with TauCeti.ContCohomology.explicitH2IsoGroupCohomology on a cocycle class.

**Acceptance.**

- The source is the continuous cohomology of the topological group G, not the cohomology of G as a discrete group.
- The continuous part of the declaration is the Mathlib map; only the comparison with group cohomology of the discrete group is new.

**Depends on.** Declarations of other roadmaps: `AutomorphicFormsOnReductiveGroups:AF.1a/differentiable-cochains`; layers, with a request: `AutomorphicFormsOnReductiveGroups:AF.1a`; pinned libraries: `mathlib:TopRep.homogeneousCochains`, `mathlib:continuousCohomology`, `mathlib:ContinuousCohomology.cochainsMap`, `mathlib:ContinuousCohomology.cochainsMap_comp`, `mathlib:ContinuousCohomology.map`, `tauceti:TauCeti.ContCohomology.explicitH2IsoGroupCohomology`.

**Source.** [Armand Borel, *Stable real cohomology of arithmetic groups*](https://www.numdam.org/item/ASENS_1974_4_7_2_235_0.pdf), §10.2(2), p.263. The comparison jΓ is restriction in continuous Eilenberg–Mac Lane cohomology.

### The invariant-form arithmetic comparison

**Declaration** `arithmeticInvariantFormMap` · construction · node `R.2/arithmetic-invariant-form-map` · planet “Borel's map from invariant forms”.

Let G be a connected semisimple ℚ-group, K a maximal compact subgroup of G(ℝ), X=K\G(ℝ), g=k⊕p the Cartan decomposition and Γ an arithmetic subgroup of G(ℚ). Put G_Γ=G(ℝ)°Γ and K_Γ=K∩G_Γ, so X≅K_Γ\G_Γ. Let I_G^{Γ,q} be the space of q-forms on X invariant under G(ℝ)° and under Γ; such forms are closed. This is H^q(g,K_Γ;ℝ), equivalently the invariants of H^q(g,k;ℝ)=(∧^q p^*)^{K°} under the image of Γ in K/K°. Choose a torsion-free normal subgroup Γ′ of finite index contained in G(ℝ)°. The map j_Γ:I_G^{Γ,q}→H^q(Γ;ℝ) sends a form to its de Rham class on X/Γ′ and then descends through H^q(Γ′;ℝ)^{Γ/Γ′}=H^q(Γ;ℝ). Before descent, j_{Γ′} is induced by the constants in C^∞(Γ′\G(ℝ)°). Under van Est for (G_Γ,K_Γ), j_Γ is restriction along Γ→G_Γ. If Γ meets every real component, G_Γ=G(ℝ) and the source is H^q(g,K;ℝ); if Γ⊂G(ℝ)°, the source is H^q(g,k;ℝ).

**Hypotheses.**

- G connected semisimple over ℚ; Γ arithmetic. The Betti, de Rham and relative Lie algebra descriptions of H^*(X/Γ′) are those of ALS.5/de-rham-comparison, which uses no automorphic input.
- Real coefficients are used for the descent from Γ′ to Γ.
- Intersect a neat normal finite-index subgroup with G(ℝ)° when choosing Γ′. The coefficient module for its relative Lie algebra description uses Γ′\G(ℝ)°, rather than the disconnected full real group.

**Construction.**

1. Choose Γ′⊂Γ normal, neat and of finite index (AA.4/neat-level-exists), and intersect with G(ℝ)°. X/Γ′ is a manifold and an Eilenberg–MacLane space for Γ′ (ALS.0/neat-level-manifold).
2. Identify invariant forms on X with relative Lie algebra cochains, including the action of K/K° (AF.1a/invariant-forms-complex, AF.1a/relative-lie-cochain-complex). Invariant forms are closed: the geodesic symmetry at the base point multiplies an invariant q-form by (−1)^q and commutes with d.
3. Apply ALS.5/de-rham-comparison with trivial coefficients on the connected real group: H^*(Γ′;ℝ) is computed by Γ′-invariant forms on X and by the (g,K°)-complex of C^∞(Γ′\G(ℝ)°); j_{Γ′} comes from the constants. Classical quotient comparison, wedge/cup compatibility and finite-component descent are requested from ALS.5.
4. Descend through Γ/Γ′-invariants. This changes the source from H^q(g,k;ℝ) to H^q(g,K_Γ;ℝ). Van Est for the open subgroup G_Γ (AF.1a/van-est-isomorphism) identifies j_Γ with arithmeticRestriction along Γ→G_Γ. Restriction from the full G(ℝ) only describes its full-K-invariant subspace when Γ misses components.

**Used by.**

- Borel 1974, Theorem 7.5: This is the map whose injectivity and surjectivity ranges are estimated.
- BorelRegulators:R.3/arithmetic-stable-range: Transfers the cohomology of the compact dual to the arithmetic group in the stable range.
- BorelRegulators:R.5/compact-factor-comparison: Is compared with the analogous map for absolute Lie algebra cohomology and the quotient Γ\G(ℝ).

**API.**

- `arithmeticInvariantFormMap_vanEst` (compatibility): j_Γ=res_{Γ→G_Γ}∘vanEst⁻¹ on H^q(g,K_Γ;ℝ), using van Est for (G_Γ,K_Γ). It is the full-group formula with K only when Γ meets every real component.
- `arithmeticInvariantFormMap_descent` (characterisation): Its pullback to a torsion-free finite-index Γ′ equals the invariant form on X/Γ′.
- `arithmeticInvariantFormMap_component` (projection): The source H^q(g,K_Γ;ℝ) is the space of invariants of H^q(g,k;ℝ) under the image of Γ in K/K°; it is H^q(g,K;ℝ) when Γ meets every real component and H^q(g,k;ℝ) when Γ⊂G(ℝ)°.
- `arithmeticInvariantFormMap_cup` (compatibility): jΓ sends wedge products of invariant forms to cup products.
- `arithmeticInvariantFormMap_coeff` (functoriality): Extension R→C commutes with the map and with Betti/de Rham comparison.
- `arithmeticInvariantFormMap_constants` (characterisation): For Γ′⊂G(ℝ)° as above, j_{Γ′} is the map on (g,K°)-cohomology induced by ℝ→C^∞(Γ′\G(ℝ)°); it descends to j_Γ by finite-quotient invariants.

**Unit tests.**

- `arithmeticInvariantFormMap_unit` (computation): The constant invariant 0-form 1 maps to the unit cohomology class.
- `arithmeticInvariantFormMap_point` (degenerate): If X/Γ is a point then every positive-degree class maps to zero.
- `arithmeticInvariantFormMap_component_invariants` (non-example): For G=PGL₂ over ℚ, K=PO₂ and Γ=PGL₂(ℤ): the non-identity component of K reverses the orientation of the two-dimensional space p, so it acts by −1 on H²(g,k;ℝ)=ℝ, and Γ meets that component. The degree-two source of j_Γ is therefore zero; a definition with source H²(g,k;ℝ) would be wrong.
- `arithmeticInvariantFormMap_missing_components` (non-example): For G=PGL₂ over ℚ and Γ=PGL₂(ℤ)∩G(ℝ)°, the degree-two invariant-form source is ℝ, whereas for PGL₂(ℤ) it is zero. This tests the source of the map, without asserting that its degree-two image is nonzero.

**Acceptance.**

- Constructing the map uses no automorphic decomposition and no Matsushima formula.
- For G=PGL₂ and Γ=PGL₂(ℤ) the degree-two source is zero, although H²(g,k;ℝ) is one-dimensional.
- When Γ misses real components, use G_Γ in the continuous-cohomology comparison and G(ℝ)° before finite descent; the full real group gives the wrong source.

**Depends on.** This roadmap: `R.2/arithmetic-restriction`; Declarations of other roadmaps: `AutomorphicFormsOnReductiveGroups:AF.1a/van-est-isomorphism`, `AutomorphicFormsOnReductiveGroups:AF.1a/invariant-forms-complex`, `AutomorphicFormsOnReductiveGroups:AF.1a/relative-lie-cochain-complex`, `ArithmeticLocallySymmetricSpaces:ALS.5/de-rham-comparison`, `ArithmeticLocallySymmetricSpaces:ALS.0/neat-level-manifold`, `AdelicAlgebraicGroups:AA.4/neat-level-exists`; Layers, with a request: `ArithmeticLocallySymmetricSpaces:ALS.5`.

**Source.** [Armand Borel, *Stable real cohomology of arithmetic groups*](https://www.numdam.org/item/ASENS_1974_4_7_2_235_0.pdf), §3.1, pp.241–242; §10.2(1)–(5), p.263. Defines the map from invariant forms to the cohomology of a discrete subgroup, identifies it with the map induced by the constants in relative Lie algebra cohomology, and with restriction in continuous cohomology.

### Naturality of arithmetic comparison under block maps

**Declaration** `arithmeticComparison_block_natural` · theorem · node `R.2/block-comparison-naturality`.

For an injective real algebraic homomorphism f:G→G′ taking Γ into Γ′, choose K′ containing f(K). The invariant-form restriction, relative Lie pullback, continuous-cohomology pullback and arithmetic-group pullback form commuting squares with jΓ and jΓ′. In the order system this holds for every diag(g,I_r) and commutes with coefficient extension R→C. The induced compact-dual pullback is independent of compatible maximal-compact choices up to the canonical conjugacy identifications.

**Hypotheses.** Groups, arithmetic subgroups and compact duals satisfy the R.2 comparison hypotheses. For disconnected real groups use f:G_Γ→G′_{Γ′} and compatible maximal compact subgroups K_Γ,K′_{Γ′}, as in arithmeticInvariantFormMap.

**Proof.**

1. Continuous restriction is functorial by ContinuousCohomology.cochainsMap_comp.
2. Relative Lie algebra cohomology is functorial for morphisms of pairs, and van Est is natural for them (AF.1a/relative-cohomology-functoriality, AF.1a/van-est-isomorphism). Naturality of the Betti–de Rham comparison for the map X/Γ→X′/Γ′ is requested from ALS.5. Work with these open subgroups, or with their identity components before finite descent, so a missing component is not silently imposed as an extra invariant.
3. Compatible maximal compact subgroups exist by conjugacy (Tau Ceti LieGroups Layer 9); the induced map of compact duals is described in Borel 1974, 10.3.

**Acceptance.** Composing two block inclusions gives the same comparison square as their single block inclusion.

**Depends on.** This roadmap: `R.2/arithmetic-invariant-form-map`, `R.1/order-arithmetic-system`; Declarations of other roadmaps: `AutomorphicFormsOnReductiveGroups:AF.1a/relative-cohomology-functoriality`, `AutomorphicFormsOnReductiveGroups:AF.1a/van-est-isomorphism`; Layers, with a request: `ArithmeticLocallySymmetricSpaces:ALS.5`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-9-the-cartan-iwasawa-and-kak-decompositions`; Pinned libraries: `mathlib:ContinuousCohomology.cochainsMap_comp`.

**Source.** [Armand Borel, *Stable real cohomology of arithmetic groups*](https://www.numdam.org/item/ASENS_1974_4_7_2_235_0.pdf), §10.3, pp.263–264. For an injective morphism of real groups with compatible maximal compact subgroups, constructs the map of invariant forms and identifies it with the pullback on the cohomology of the compact duals.

### Stable comparison as a Hopf-algebra map

**Declaration** `stableComparison_hopf` · theorem · node `R.2/stable-hopf-compatibility`.

For an order O as in R.1, block sum SL_m(O)×SL_n(O)→SL_{m+n}(O) makes H_*(SL(O);ℝ)=colim_n H_*(SL_n(O);ℝ) a connected graded commutative and cocommutative Hopf algebra, and H^*(SL(O);ℝ), taken degree by degree, its dual. The stable comparison with invariant forms, equivalently with the cohomology of the compact duals with their block-sum maps, is a morphism of Hopf algebras: it preserves unit, product, coproduct and augmentation. Hence it preserves primitive elements and induces a map on indecomposables QH^i=H^i/(decomposables), and in each degree in which cohomology is finite-dimensional the primitive part of H_i is the dual of QH^i, not of all of H^i.

**Hypotheses.**

- Cohomology is taken in a range of degrees where it has stabilised and is finite-dimensional over ℝ.
- Define the product directly on the filtered colimit of SL homology by finite block sums and Künneth; define the coproduct by the group diagonal. The map to GL homology and then BGL(O)⁺ preserves these products, but no product is transported backwards along SL→GL.

**Proof.**

1. Use finite block sums and filtered-colimit homology (H.1/filtered-colimit-homology) to define the product on stable SL homology. Associativity and the unit follow after stabilization; block comparison naturality makes the invariant-form comparison compatible with this product.
2. For graded commutativity exchange the two blocks by a permutation matrix. If its reduced norm is −1, stabilize by one more coordinate and multiply the exchanging matrix by −1 on that unused coordinate, making its reduced norm one. Inner conjugation acts trivially on homology (H.1/conjugate-homomorphisms-freely-homotopic). Künneth and the diagonal (Tau Ceti AlgebraicTopology stage 6) give the compatible cocommutative coproduct, counit and Hopf structure.
3. The forward map SL→GL followed by H.3/plus-integral-homology preserves block sums and agrees with the H.4/plus-hspace-block-sum Pontryagin product. This compatibility does not define the SL product and does not assume an SL/GL homology isomorphism.
4. Dualise degree by degree: primitives of a finite-type Hopf algebra are the annihilator of the decomposables of the dual.

**Acceptance.**

- An exterior product of two positive-degree generators is excluded from the indecomposable quotient.
- The SL Hopf structure is defined before the E/SL comparison and does not require injectivity of H_*(SL)→H_*(GL).

**Depends on.** This roadmap: `R.2/block-comparison-naturality`; Declarations of other roadmaps: `StableHomotopyKTheory:H.4/plus-hspace-block-sum`, `StableHomotopyKTheory:H.3/plus-integral-homology`, `StableHomotopyKTheory:H.1/filtered-colimit-homology`, `StableHomotopyKTheory:H.1/conjugate-homomorphisms-freely-homotopic`; Layers, with a request: `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

**Source.** [Armand Borel, *Stable real cohomology of arithmetic groups*](https://www.numdam.org/item/ASENS_1974_4_7_2_235_0.pdf), §10.6, pp.265–266; §12.1, p.270. The stable cohomology is a Hopf algebra for the block-sum maps, and the rank computation uses its indecomposable elements.

## R.3 — The stable cohomology calculation

**Objects.** The compact duals of the archimedean factors of G_n: SU_{ne}/SO_{ne} at a real place where D splits, SU_{ne}/USp_{ne} at a real place where D is quaternionic, and SU_{ne} at a complex place. The dual of a symmetric pair (g, k) with g = k ⊕ p is the compact homogeneous space attached to g_u = k ⊕ i·p; a compact real form alone does not determine it. Two constants of a semisimple ℚ-group G: c(G), defined by positivity of ρ_P − ν for the weights ν of a maximal split torus on the exterior powers of the Lie algebra of the unipotent radical of a minimal parabolic; and Matsushima's constant m(G(ℝ)), defined by positivity of a quadratic form built from the curvature of X.

**Theorems.** (i) Stably, H^*(SU) = Λ(x₃, x₅, x₇, …) and H^*(SU/SO) = H^*(SU/USp) = Λ(y₅, y₉, y₁₃, …), with the finite-rank rings and an explicit range of stability. (ii) The criterion of Matsushima and Garland: a complex of square-integrable forms computing cohomology and containing the invariant forms makes j_Γ bijective up to degree m(G). (iii) Borel's complex of forms with logarithmic growth near the boundary of the Borel–Serre compactification is such a complex up to degree c(G). (iv) min(c(G), m(G(ℝ))) ≥ [rank_ℚ(G)/4]′. Together: j_Γ is an isomorphism in degrees q with 4q < n−1 for Γ = SL_n(O). (v) H^*(SL(O); ℝ) is the exterior algebra with r₁ generators in each degree 4a+1 and r₂ generators in each degree 2a+1, a ≥ 1. (vi) K_i(O) ⊗ ℝ is the primitive part of H_i(SL(O); ℝ) for i ≥ 2, by the Cartan–Serre theorem for the universal cover of BGL(O)⁺. (vii) Borel's rank theorem.

**Two stable ranges.** The cohomology of the compact duals is stable in degrees ≤ q for n ≥ 2q+3, and the arithmetic comparison holds for 4q < n−1; both are sufficient conditions and both are needed before passing to the limit. The limit of cohomology is taken degree by degree.

**Boundary.** The rank theorem is proved for orders, O_F included, without finite generation. The ranks of the K-groups of rings of S-integers and of F follow by localisation and are ArithmeticKTheory N.3:ranks, which consumes `borelRankTheorem`.

**Dependencies.** R.1 and R.2; Siegel sets and relative roots from AdelicAlgebraicGroups AA.3; the bordification from ALS.2; the Cartan–Serre theorem, the universal cover of the plus construction and filtered colimits from StableHomotopyKTheory H.1 and H.3; plus-equals-Q from GeneralAlgebraicKTheory K.2; Whitehead's lemma from KTheoryLowDegrees U.1; spectral sequences and products from Tau Ceti AlgebraicTopology stages 5 and 6. Requests: the dual of a symmetric pair (Tau Ceti LieGroups Layer 7), the analysis of square-integrable forms (AF.1a) and relative root systems under restriction of scalars (ReductiveGroupsPartII RG2.1).

### Classical compact-dual identifications

**Declaration** `classicalCompactDuals` · theorem · node `R.3/classical-compact-duals` · planet “Classical compact duals”.

For the archimedean factors of SL_n(D), the connected compact duals are SU_{ne}/SO_{ne} at split real places, SU_{ne}/USp_{ne} at quaternionic real places (ne even), and SU_{ne} at complex places. They use the Cartan symmetric-pair dual g_u=k⊕i p and the quotient K°\G_u; a compact real form by itself does not specify the dual. Compatible block inclusions induce the corresponding maps between these homogeneous spaces.

**Hypotheses.** n≥2 and D is a central division algebra of degree e over F. The dual of a symmetric pair is requested from Tau Ceti LieGroups Layer 7.

**Proof.**

1. Take Cartan decompositions and maximal compact subgroups from Tau Ceti LieGroups Layers 7 and 9; the dual of a symmetric pair, g_u=k⊕i·p with the homogeneous space K°\G_u, and its functoriality are requested as an extension of those layers.
2. By R.1, the archimedean factors of G_n are SL_{ne}(ℝ), SL_{ne/2}(ℍ) and SL_{ne}(ℂ), with maximal compact subgroups SO_{ne}, Sp_{ne/2} (written USp_{ne}) and SU_{ne}.
3. Their duals are SU_{ne}/SO_{ne}, SU_{ne}/USp_{ne} and (SU_{ne}×SU_{ne})/SU_{ne}≅SU_{ne}; block inclusions of the groups induce the block inclusions of these spaces.

**Acceptance.** The quaternionic quotient has USp_{ne}, not SO_{ne}, as denominator.

**Depends on.** This roadmap: `R.1/order-arithmetic-system`; layers, with a request: `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-7-complexification-and-real-forms`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-9-the-cartan-iwasawa-and-kak-decompositions`.

**Source.** [Armand Borel, *Stable real cohomology of arithmetic groups*](https://www.numdam.org/item/ASENS_1974_4_7_2_235_0.pdf), §§10.2,10.6 and 11.5, pp.263,265–266,268. The classical compact twins supply the three factor calculations.

### Stable exterior cohomology of classical compact duals

**Declaration** `compactDual_stableExterior` · theorem · node `R.3/compact-dual-cohomology` · planet “Stable compact-dual cohomology”.

With real coefficients, the degreewise stable cohomology rings are H*(SU)=Λ(x_3,x_5,x_7,…), H*(SU/SO)=Λ(y_5,y_9,y_13,…) and H*(SU/USp)=Λ(z_5,z_9,z_13,…). The named generators are primitive for stable block sum. The finite-dimensional groups and homogeneous spaces have their own unstable relations; the displayed infinite exterior algebras assert only degreewise stable cohomology. For finite ranks m≥1, H*(SU_m;R)=Λ(x_3,x_5,…,x_{2m−1}); H*(SU_{2m+1}/SO_{2m+1};R)=Λ(y_5,y_9,…,y_{4m+1}); H*(SU_{2m}/SO_{2m};R)=Λ(y_5,y_9,…,y_{4m−3})⊗R[e_{2m}]/(e_{2m}²); and H*(SU_{2m}/USp_{2m};R)=Λ(z_5,z_9,…,z_{4m−3}), with empty generator ranges interpreted as R. Block pullback preserves the named transgressed odd generators wherever they occur; the even-rank Euler class is unstable.

**Hypotheses.** Stability maps come from the compatible classical block inclusions.

**Proof.**

1. Use the Serre spectral sequence with transgression for the fibrations of the classical groups (Tau Ceti AlgebraicTopology stage 5).
2. Compute the finite-rank rings from the classical transgression calculation: Borel 1953 Propositions 31.3–31.4 compute U(2m)/Sp(m) and U(n)/SO(n); remove the determinant S¹ factor to obtain the displayed SU quotients over R. Retain the even-rank Euler generator and its square-zero relation. Borel 1974 §10.6 then gives the degreewise stable rings.
3. Use block multiplication to verify the generator coproduct x↦x⊗1+1⊗x.

**Acceptance.**

- H³(SU/SO;R)=H³(SU/USp;R)=0, while H³(SU;R)=R.
- Finite-size cohomology is not replaced by the stable ring without a degree bound.

**Depends on.** This roadmap: `R.3/classical-compact-duals`; layers, with a request: `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`; pinned libraries: `mathlib:ExteriorAlgebra`.

**Source.** [Armand Borel, *Stable real cohomology of arithmetic groups*](https://www.numdam.org/item/ASENS_1974_4_7_2_235_0.pdf), §10.6, pp.265–266. The stable compact-space cohomology calculations and primitive degrees are stated here.

**Source.** [Armand Borel, *Sur la cohomologie des espaces fibrés principaux et des espaces homogènes de groupes de Lie compacts*](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Borel-Sur.pdf), Propositions 31.3–31.4 and their transgression calculations, pp.203–205. Finite-rank generators, the even-rank Euler factor and restriction of transgressive classes justify the conservative bound; the SU quotients remove the determinant degree-one factor.

### Explicit degreewise compact-dual stability

**Declaration** `compactDual_stable_in_degree` · theorem · node `R.3/compact-dual-degree-stability`.

For fixed q≥0, all three classical compact-dual systems occurring in the order system have stationary real cohomology in degrees ≤q once n≥2q+3. This is a uniform sufficient bound, not the sharp bound: each local matrix rank is at least n, and no unstable Euler or top-degree class occurs in that range. The stable generators and block pullbacks agree under these identifications.

**Hypotheses.** n is the rank over D, rather than the absolute matrix size ne; quaternionic D has even e.

**Proof.**

1. Use the finite-rank presentations in compactDual_stableExterior, including the Euler generator in degree 2m and the largest odd generator in each family. Borel 1953 pp.203–205 also computes restriction on transgressive generators; stationarity alone would not establish the numerical bound.
2. Use the conservative bound on all local matrix sizes to remove each unstable generator in degree ≤q.
3. Apply R.2 block naturality to identify the chosen maps.

**Acceptance.**

- For q=3 the complex generator survives and the real/quaternionic factors contribute zero.
- The bound is labelled sufficient; no claim of sharpness is made.

**Depends on.** This roadmap: `R.3/compact-dual-cohomology`, `R.2/block-comparison-naturality`; layers, with a request: `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`.

**Source.** [Armand Borel, *Stable real cohomology of arithmetic groups*](https://www.numdam.org/item/ASENS_1974_4_7_2_235_0.pdf), §§10.1 and 10.6, pp.263,265–266. The source uses stationarity in each degree, not an ungraded inverse limit.

**Source.** [Armand Borel, *Sur la cohomologie des espaces fibrés principaux et des espaces homogènes de groupes de Lie compacts*](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Borel-Sur.pdf), Propositions 31.3–31.4 and their transgression calculations, pp.203–205. Finite-rank generators, the even-rank Euler factor and restriction of transgressive classes justify the conservative bound; the SU quotients remove the determinant degree-one factor.

### Square-integrability criterion of Matsushima and Garland

**Declaration** `invariantForms_bijective_of_squareIntegrable` · theorem · node `R.3/matsushima-garland-criterion`.

Let G be a real semisimple Lie group with finitely many components and finite centre, K a maximal compact subgroup, X=K\G with a G-invariant metric, Γ a discrete subgroup with X/Γ of finite volume and Γ′⊂Γ a torsion-free normal subgroup of finite index. Write Ω^Γ for the complex of Γ-invariant forms on X, I^Γ for its subspace of forms also invariant under G°, and j^q:I^{Γ,q}→H^q(Γ;ℝ) for the map of R.2. For a connected simple noncompact group G₁ with Cartan decomposition k₁⊕p₁, Matsushima's constant m(G₁) is the largest positive integer q for which the quadratic form (A/q)(ξ,ξ)+P(ξ,ξ) on the symmetric square of p₁ is positive definite; here (ξ,ξ) comes from the Killing form, P(ξ,η)=Σ R_{ikjl}ξ_{ij}η_{kl} is built from the curvature tensor of X and A is Matsushima's constant attached to the Killing form on k₁. Set m(G₁)=0 if there is no such positive q; degree zero is handled by constants. Put m(G)=min m(G₁) over the simple noncompact factors of G°, with the minimum of an empty set equal to ∞. Then: (a) if G/Γ is compact, j^q is injective for all q and surjective for q≤m(G); (b) if Γ is torsion-free, q≤m(G) and every class in H^q(Ω^Γ) has a square-integrable representative, then j^q is surjective; (c) if C⊂Ω^{Γ′} is a subcomplex stable under Γ/Γ′ and m′ is a positive real number such that C→Ω^{Γ′} is an isomorphism on cohomology in degrees ≤m′, C^q consists of square-integrable forms for q≤m′, and I^{Γ′,q}⊂C^q for q≤m′, then j^q:I^{Γ,q}→H^q(Γ;ℝ) is injective for q≤m′ and bijective for q≤min(m(G),m′).

**Hypotheses.**

- G real semisimple with finitely many components and finite centre; X/Γ of finite volume for (c).
- Square integrability is with respect to the invariant metric on X/Γ′.
- The real cutoff m′ is positive, as in Borel 3.6, p.244; only integer cohomological degrees q≤m′ are involved. The expression A/q defining m(G₁) is used only for positive q.

**Proof.**

1. Choose Γ′ normal and of finite index, torsion-free and contained in G°. Work on K°\G° before descent: H^*(Γ;ℝ)=H^*(Γ′;ℝ)^{Γ/Γ′} and I^Γ=(I^{Γ′})^{Γ/Γ′}. The component convention is the one of arithmeticInvariantFormMap, with G_Γ for van Est.
2. Injectivity. Elements of I^{Γ′} are harmonic. On the complete manifold X/Γ′ Stokes' formula holds for integrable forms with integrable differential (Borel §1), so a square-integrable harmonic form which is the differential of a square-integrable form is zero (Borel 2.5). If j(ω)=0 with ω∈I^{Γ′,q}, q≤m′, then ω=dσ with σ∈C^{q−1}, which is square integrable; hence ω=0.
3. Surjectivity. Write a square-integrable harmonic q-form η through its coefficients η_I on Γ′\G in a Maurer–Cartan frame adapted to k⊕p. Matsushima's integral formula for φ=Σ([X_a,X_b]η_I)² shows, for q≤m(G), that the η_I are killed by p, hence constant, so η∈I^{Γ′}. On a noncompact quotient the integrations by parts are justified after replacing η by α*η for a K-invariant test function α: convolution commutes with the Casimir operator and makes every derivative square integrable. Letting α run through a Dirac sequence gives η in the closure of the finite-dimensional space I^{Γ′} (Garland's argument, Borel 3.5).
4. In (c) every class of degree ≤m′ has a square-integrable representative in C, so (b) applies for q≤min(m(G),m′).

**Acceptance.**

- For G/Γ compact, (c) with C=Ω^{Γ′} recovers (a).
- For G=SL₂(ℝ) and Γ a cocompact surface group, I^1=0 and H¹(Γ;ℝ)≠0, so j¹ is not surjective: m(SL₂(ℝ))=0.
- The criterion gives no information in degrees above min(m(G),m′).

**Depends on.** This roadmap: `R.2/arithmetic-invariant-form-map`; Declarations of other roadmaps: `AutomorphicFormsOnReductiveGroups:AF.1a/invariant-forms-complex`, `AutomorphicFormsOnReductiveGroups:AF.1a/relative-lie-cochain-complex`; Layers, with a request: `AutomorphicFormsOnReductiveGroups:AF.1a`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-9-the-cartan-iwasawa-and-kak-decompositions`.

**Source.** [Armand Borel, *Stable real cohomology of arithmetic groups*](https://www.numdam.org/item/ASENS_1974_4_7_2_235_0.pdf), §1.3–1.5, pp.238–239; §2.2–2.5, pp.239–240; §3.1–3.7, pp.241–246. Proves Stokes’ formula on complete manifolds, the vanishing of exact square-integrable harmonic forms, and states with proof sketches the theorems of Matsushima (3.4) and Garland (3.5) and the criterion 3.6, with the definition of m(G) in 3.3.

### Forms with logarithmic growth on an arithmetic quotient

**Declaration** `logGrowthForms_quasiIso` · theorem · node `R.3/logarithmic-growth-complex`.

Let G be a connected semisimple ℚ-group, P a minimal parabolic ℚ-subgroup, A_P the identity component of the real points of a maximal ℚ-split torus of P, with simple roots α₁,…,α_s, and ρ_P the character with a^{2ρ_P}=det Ad(a) on the Lie algebra of the unipotent radical U of P. Write λ≫0 if λ is a combination of the α_i with strictly positive coefficients. For q≥0 and a character λ of A_P, condition c(P,q,λ) is: ρ_P+λ−ν≫0 for every weight ν of A_P on ⊕_{i≤q}∧^i Lie(U(ℝ)). Put c(G,λ)=max{q : c(P,q,λ) holds}, c(G)=c(G,0), and c(G)=∞ when G is anisotropic; for an almost direct product, c is the minimum over the factors. Let Γ be a torsion-free arithmetic subgroup and X̄/Γ the Borel–Serre compactification of X/Γ. A form on X/Γ has logarithmic growth near the boundary if every boundary point has a neighbourhood, pulled back from a Siegel set, on which its coefficients in the frame adapted to the horospherical decomposition are bounded by a polynomial in |log a_B^{α_i}| in the right-quotient convention described below. Let C be the complex of Γ-invariant forms on X which, together with their exterior derivatives, have logarithmic growth near the boundary. Then: (a) the inclusion of C into Ω^Γ is an isomorphism on cohomology; (b) for q≤c(G) every element of C^q is square integrable on X/Γ; (c) every form invariant under G(ℝ)° lies in C.

**Hypotheses.**

- G connected semisimple over ℚ; Γ torsion-free arithmetic. Siegel sets, the horospherical decomposition and the corners are those of AA.3 and ALS.2.
- The condition c(P,q,λ) does not depend on the choice of minimal parabolic.
- Use Borel’s right arithmetic quotient K\G(ℝ)/Γ and boundary coordinates a_B with a_B^{α_i}→0. AA.3 uses the left quotient Γ\G(ℝ)/K and a_AA^{α_i}→∞. Quotient inversion identifies the charts by a_B=a_AA⁻¹; transport the adapted frame and metric as well as the coordinate, rather than mixing the two conventions.

**Proof.**

1. Convert the AA.3 left-quotient Siegel charts to the right quotient by g↦g⁻¹. In these Borel charts a_B^{α_i} tends to zero; logarithmic growth is polynomial growth in |log a_B^{α_i}|, equivalently in log a_AA^{α_i}. The pullback of the metric and adapted frame is used for the norm and volume estimates of Borel §§4–5.
2. Forms on open subsets of X̄/Γ which, with their differentials, have logarithmic growth near the boundary form a sheaf F of differential graded algebras on the compact manifold with corners (ALS.2/borel-serre-bordification, ALS.2/borel-serre-quotient-compact), with global sections C.
3. F is fine: a smooth function on the manifold with corners and its differential have bounded coefficients in the adapted frame, so multiplication by a smooth partition of unity preserves F.
4. F resolves the constant sheaf: at interior points by the Poincaré lemma; at a boundary point, in the coordinates log a^{α_i} on the corner and local coordinates on a relatively compact factor, a closed form of F on a small neighbourhood is the differential of a form of F on a smaller one. Hence H^*(C)=H^*(X̄/Γ;ℝ)=H^*(X/Γ;ℝ), which is (a).
5. For (b): a form with logarithmic growth has coefficients bounded by a_B^{−εd} for every ε>0, d being the sum of the simple roots; under inversion this bound is a_AA^{+εd}. The metric and volume computation in the same right-quotient frame (Borel §§4–5, Proposition 5.5) gives square integrability when c(P,q,−εd) holds. The strict inequalities in c(P,q,0) imply this for small ε. Keep the root, metric and volume conventions together.
6. For (c): a form invariant under A_P has bounded coefficients in the adapted frame (Borel 5.7), and invariant forms are closed.

**Acceptance.**

- For G anisotropic over ℚ the quotient is compact, C is the whole complex and c(G)=∞.
- For G=Res_{F/ℚ}SL₂ with [F:ℚ]=d, a minimal parabolic has one simple root α with multiplicity d and ρ_P=(d/2)α, so c(G) is the greatest integer strictly smaller than d/2 (Borel 7.7); for F=ℚ it is 0.
- The complex contains the invariant forms; the smaller complex of forms locally lifted from the boundary does not (Borel 8.2).

**Depends on.** This roadmap: `R.2/arithmetic-invariant-form-map`; Declarations of other roadmaps: `ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-bordification`, `ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-quotient-compact`, `ArithmeticLocallySymmetricSpaces:ALS.2/geodesic-action-boundary-face`, `AdelicAlgebraicGroups:AA.3/horospherical-decomposition`, `AdelicAlgebraicGroups:AA.3/real-siegel-set`, `AdelicAlgebraicGroups:AA.3/relative-chamber`, `AdelicAlgebraicGroups:AA.3/positive-root-coordinates`; Layers, with a request: `AutomorphicFormsOnReductiveGroups:AF.1a`.

**Source.** [Armand Borel, *Stable real cohomology of arithmetic groups*](https://www.numdam.org/item/ASENS_1974_4_7_2_235_0.pdf), §4, pp.246–248; §5, pp.248–251; §6, pp.251–254; §7.1–7.4, pp.254–258. Decomposes the metric along a parabolic subgroup, estimates forms on Siegel sets, constructs special partitions of unity on the manifold with corners, defines c(G) and logarithmic growth, and proves the three assertions.

### Lower bounds for the constants of the stable range

**Declaration** `borelConstants_ge_rank` · theorem · node `R.3/stable-range-constants`.

Let [x]′ denote the greatest integer strictly smaller than x. (1) For an irreducible root system Φ let 2r be the sum of its positive roots, d₀ the highest root of the subsystem of non-multipliable roots, and c(Φ)=max{p : r−p·d₀≫0}; for a reducible system take the minimum over the irreducible factors. Then c(A_n)=[n/2]′, and c(Φ)≥[n/2]′ for every irreducible Φ of rank n. (2) For a connected semisimple group H of positive rank over a field k of characteristic zero, define c(H/k) as c(G) was defined in logGrowthForms_quasiIso, with a maximal k-split torus and a minimal parabolic k-subgroup. Then c(H/k)≥m·c(Φ(H/k)) if every relative root has multiplicity at least m; c(H/k)≥[rk_k(H)/2]′ if H is almost k-simple; c(Res_{k′/k}H′/k)≥[k′:k]·c(H′/k′); and c(H/k)≥c(H/k″) for every extension k″ of k. (3) For H almost simple over ℝ of positive real rank, Matsushima's constant satisfies m(H(ℝ))≥[rk_ℝ(H)/4]′. (4) For a connected almost ℚ-simple ℚ-group G, min(c(G), m(G(ℝ)))≥[rk_ℚ(G)/4]′. In particular for G_n=Res_{F/ℚ}SL_n(D), of rational rank n−1, the minimum is at least [(n−1)/4]′, that is, it is ≥q whenever 4q<n−1.

**Hypotheses.**

- Root systems, relative root systems with multiplicities and their behaviour under restriction of scalars are those of the structure theory of reductive groups over a field.
- (3) rests on the values of m for the simple real Lie algebras, which are tabulated in the literature cited by Borel.

**Proof.**

1. (1) For A_n the coefficient of the simple root α_i in r is i(n+1−i)/2 and d₀ is the sum of the simple roots, so the condition is p<n/2. The other types are read from the tables of root systems (Borel 9.1(3)); the same computation gives c(B_n)=n−2 and c(C_n)=[n/2]′.
2. (2) Reduce to H almost k-simple. The character 2ρ_P contains every term of 2r with coefficient at least m, and p·d₀−ν is a nonnegative combination of simple roots for every sum ν of p roots; this gives the first inequality, and the table gives the second. Restriction of scalars multiplies multiplicities by the degree. A minimal parabolic over k contains one over k″ after extension, which gives the last inequality.
3. (3) is read from the tables of Matsushima and of Kaneyuki–Nagano.
4. (4) Up to isogeny G=Res_{k/ℚ}G′ with G′ absolutely simple over a number field k, and G(ℝ) is the product of the G′(k_v). Each k_v-rank is at least the k-rank of G′, which is the ℚ-rank of G; apply (2) and (3).

**Acceptance.**

- For Φ=A₁, r=α/2 and d₀=α, so c(A₁)=0=[1/2]′.
- For G_n with n=10 the bound is [9/4]′=2, and for n=9 it is [8/4]′=1: the inequality 4q<n−1 is strict.
- The bound is a lower bound; no claim is made that it is sharp.

**Depends on.** This roadmap: `R.3/logarithmic-growth-complex`, `R.3/matsushima-garland-criterion`, `R.1/order-arithmetic-system`; declarations of other roadmaps: `AdelicAlgebraicGroups:AA.3/minimal-parabolic-data`, `AdelicAlgebraicGroups:AA.3/relative-chamber`; layers, with a request: `ReductiveGroupsPartII:RG2.1`.

**Source.** [Armand Borel, *Stable real cohomology of arithmetic groups*](https://www.numdam.org/item/ASENS_1974_4_7_2_235_0.pdf), §0.1, p.237; §9.1–9.5, pp.261–262. Defines c(Φ) with its table, c(H/k), proves the inequalities for c, quotes the bound for Matsushima’s constant and deduces the bound by a quarter of the rational rank.

### Borel’s arithmetic stable-range comparison

**Declaration** `arithmeticComparison_stableRange` · theorem · node `R.3/arithmetic-stable-range` · planet “Borel stable-range theorem”.

For an order O in a central division algebra D over a number field F, n≥2 and q≥0 with 4q<n−1, the map j_{Γ_n}:H^q(g_n,k_n;ℝ)→H^q(SL_n(O);ℝ) of R.2 is an isomorphism. More generally, for a connected semisimple ℚ-group G and an arithmetic subgroup Γ, j_Γ^q:I_G^{Γ,q}→H^q(Γ;ℝ) is injective for q≤c(G) and surjective for q≤min(c(G),m(G(ℝ))), with the constants of logGrowthForms_quasiIso and invariantForms_bijective_of_squareIntegrable. Since G_n is almost ℚ-simple of rational rank n−1 and G_n(ℝ) is connected, min(c(G_n),m(G_n(ℝ)))≥[(n−1)/4]′, the greatest integer strictly smaller than (n−1)/4; so the strict inequality 4q<n−1 is what the proof gives.

**Hypotheses.**

- O is any order of D; Γ_n=SL_n(O) is arithmetic in G_n=Res_{F/ℚ}SL_n(D) by R.1.
- For the general statement G is a connected semisimple ℚ-group and Γ⊂G(ℚ) is arithmetic.

**Proof.**

1. Choose a torsion-free normal subgroup Γ′ of finite index in Γ and let C be the complex of forms with logarithmic growth for Γ′; it is stable under Γ/Γ′. Choose Γ′ inside G(ℝ)° and use the component convention of R.2.
2. By logGrowthForms_quasiIso, C computes H^*(Γ′;ℝ), consists of square-integrable forms in degrees ≤c(G) and contains the invariant forms. If c(G) is finite, apply criterion (c) with the positive real cutoff m′=c(G)+1/2; this has exactly the same allowed integer degrees, even when c(G)=0. If c(G)=∞, choose a finite positive cutoff at least as large as the desired degree. Descend through Γ/Γ′-invariants; degree zero also follows directly from constants.
3. For G_n use borelConstants_ge_rank with rank_ℚ G_n=n−1 from R.1.

**Acceptance.**

- For q=2 the comparison holds for n≥10, and the argument does not give n=9.
- For q=0 the statement is H⁰=ℝ and holds for every n≥2.
- Replacing 4q<n−1 by 4q≤n−1 is not justified by the bound [(n−1)/4]′.

**Depends on.** This roadmap: `R.2/arithmetic-invariant-form-map`, `R.1/order-arithmetic-system`, `R.3/matsushima-garland-criterion`, `R.3/logarithmic-growth-complex`, `R.3/stable-range-constants`.

**Source.** [Armand Borel, *Stable real cohomology of arithmetic groups*](https://www.numdam.org/item/ASENS_1974_4_7_2_235_0.pdf), Theorem 7.5, p.259; §9.5(3), p.262; §11.5, p.268. States the injectivity and surjectivity ranges, the lower bound by a quarter of the rational rank, and the value n−1 of the rank for SL_n of a division algebra, with the consequence for H² when n>9.

### Stable cohomology of division-order arithmetic groups

**Declaration** `arithmeticCohomology_stableExterior` · theorem · node `R.3/stable-arithmetic-exterior` · planet “Stable arithmetic cohomology”.

For Γ∞=colim_n SL_n(O), H*(Γ∞;R) is the graded exterior algebra with r1 independent generators in every degree 4a+1 (a≥1) and r2 independent generators in every degree 2a+1 (a≥1). The comparison is compatible with block-sum Hopf structures. Each cohomological degree is finite-dimensional and stationary; the inverse limit is taken degree by degree and then summed as a graded algebra, not as a completed product across degrees.

**Hypotheses.** O any order in a central division algebra over F; r1 and r2 are the signature of F, independent of archimedean ramification of D.

**Proof.**

1. Fix q and choose n with 4q<n−1 and n≥2q+3, so that both the arithmetic comparison and compact-dual stability hold in degrees ≤q.
2. By R.2 and compactDual_stableExterior, H^q(SL_n(O);ℝ) is the degree-q part of the tensor product over the archimedean places of the stable rings of the compact duals (Künneth, Tau Ceti AlgebraicTopology stage 6): r₁ factors Λ(y₅,y₉,…), counting split and quaternionic real places alike, and r₂ factors Λ(x₃,x₅,…).
3. Group homology commutes with the filtered union SL(O)=⋃SL_n(O) (H.1/filtered-colimit-homology); dualising the finite-dimensional stable groups degree by degree gives the graded cohomology, as in Borel Theorem 11.1.

**Acceptance.** In degree 9, possible decomposable terms must be separated from the generator space; rank counts indecomposables.

**Depends on.** This roadmap: `R.3/compact-dual-degree-stability`, `R.3/arithmetic-stable-range`, `R.2/stable-hopf-compatibility`; declarations of other roadmaps: `StableHomotopyKTheory:H.1/filtered-colimit-homology`; layers, with a request: `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`; pinned libraries: `mathlib:ExteriorAlgebra`.

**Source.** [Armand Borel, *Stable real cohomology of arithmetic groups*](https://www.numdam.org/item/ASENS_1974_4_7_2_235_0.pdf), Theorem 11.1 and §11.5, pp.266,268. The arithmetic sequence satisfies the comparison hypotheses and yields the stable exterior algebra.

### Stable SL and GL primitive comparison

**Declaration** `stableGL_SL_primitiveComparison` · theorem · node `R.3/gl-sl-primitive-comparison`.

For an order O as in R.1 and i≥2, K_i(O)⊗ℝ is the space of primitive elements of degree i in the Hopf algebra H_*(SL(O);ℝ) of R.2. In more detail: E(O)=[GL(O),GL(O)] is perfect, BE(O)⁺ is the universal cover of BGL(O)⁺, so K_i(O)=π_i(BE(O)⁺) for i≥2; and the inclusion E(O)⊂SL(O) induces an isomorphism of Hopf algebras H_*(E(O);ℝ)≅H_*(SL(O);ℝ), because SL(O)/E(O)=H₁(SL(O);ℤ) is a torsion group acting trivially on H_*(E(O);ℝ). The quotient GL(O)/E(O)=K₁(O) contributes to π₁ and degree-one primitive generators and their products; nothing is asserted for i=1, and the full cohomology rings of GL(O) and SL(O) are not claimed to agree.

**Hypotheses.**

- K_i(O) is the K-group of the ring O in the early ring model of GeneralAlgebraicKTheory K.2, identified with π_i(BGL(O)⁺) by the plus-equals-Q theorem.
- The stable cohomology of R.3 is used in degree one: H¹(SL_n(O);ℝ)=0 for n>5.

**Proof.**

1. Whitehead's lemma gives E(O)=[GL(O),GL(O)], perfect (KTheoryLowDegrees U.1/whitehead-lemma, U.1/stable-elementary-perfect). Hence [SL(O),SL(O)]=E(O) and SL(O)/E(O)=H₁(SL(O);ℤ).
2. The stable exterior algebra has no generator in degree one, so H₁(SL(O);ℝ)=0 and SL(O)/E(O) is a torsion abelian group; its real homology vanishes in positive degrees. A torsion abelian group is the filtered union of its finite subgroups; their positive-degree real homology vanishes, and H.1/filtered-colimit-homology gives the claimed vanishing for the union.
3. BE(O)⁺ is the universal cover of the connected H-space BGL(O)⁺ (H.3/plus-universal-cover, H.4/plus-hspace-block-sum). The lifted H-space multiplication and the homotopy of each deck transformation to the identity, natural under block maps, are explicitly requested from H.3; neither follows merely from the statement that a cover exists. The induced SL(O)/E(O) action on H_*(E(O);ℝ) is trivial by the equivariant plus homology identification. The extension spectral sequence therefore gives H_*(E(O);ℝ)≅H_*(SL(O);ℝ), compatible with the directly defined SL block product.
4. π_i(BGL(O)⁺)=π_i(BE(O)⁺) for i≥2, and K_i(O)=π_i(BGL(O)⁺) by K.2:plus/plus-equals-Q. Rational Hurewicz for the simply connected H-space BE(O)⁺ (H.3/rational-hurewicz-hspace), with H_*(BE(O)⁺)=H_*(E(O)) (H.3/plus-integral-homology), identifies π_i⊗ℝ with the primitives.

**Acceptance.**

- For i=1 nothing is asserted: K₁(O) has the rank of the unit group of the centre, which the stable cohomology of SL does not see.
- The proof uses H¹(SL(O);ℝ)=0 from the stable computation, not a separate finiteness theorem for SK₁.

**Depends on.** This roadmap: `R.3/stable-arithmetic-exterior`, `R.2/stable-hopf-compatibility`; Declarations of other roadmaps: `GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q`, `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`, `StableHomotopyKTheory:H.3/plus-universal-cover`, `StableHomotopyKTheory:H.3/plus-integral-homology`, `StableHomotopyKTheory:H.3/rational-hurewicz-hspace`, `StableHomotopyKTheory:H.4/plus-hspace-block-sum`, `KTheoryLowDegrees:U.1/whitehead-lemma`, `KTheoryLowDegrees:U.1/stable-elementary-perfect`, `StableHomotopyKTheory:H.1/filtered-colimit-homology`; Layers, with a request: `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`, `StableHomotopyKTheory:H.3`.

**Source.** [Armand Borel, *Stable real cohomology of arithmetic groups*](https://www.numdam.org/item/ASENS_1974_4_7_2_235_0.pdf), §12.1, p.270. For i≥2, K_i of an order is the i-th homotopy group of an H-space with the homology of the stable special linear group, so its real rank is the number of indecomposables.

### Rational Hurewicz and arithmetic indecomposables

**Declaration** `arithmeticK_rationalHurewicz` · theorem · node `R.3/cartan-serre-application`.

For an order O as in R.1 and i≥2, dim_ℝ(K_i(O)⊗ℝ) is the number of generators of degree i of the stable exterior algebra H^*(SL(O);ℝ). Indeed K_i(O)⊗ℝ is the degree-i primitive part of H_*(SL(O);ℝ), and in each degree the primitive part of a connected Hopf algebra of finite type is dual to the indecomposable quotient QH^i=H^i/(products of classes of positive degree) of the dual algebra; for an exterior algebra on generators of odd degree QH^i has the generators of degree i as a basis. No finite generation of K_i(O) is used.

**Hypotheses.** The Cartan–Serre theorem is used in the form for path-connected H-spaces of finite rational type, H.3/rational-hurewicz-hspace; a Hurewicz theorem for simply connected spaces in the first nonvanishing degree does not suffice.

**Proof.**

1. Take the identification of K_i(O)⊗ℝ with primitives from stableGL_SL_primitiveComparison.
2. Each H_i(SL(O);ℝ) is finite-dimensional by the stable computation, so primitives of H_* are the annihilator of the decomposables of H^*.
3. For the exterior algebra of arithmeticCohomology_stableExterior, the decomposables in degree i are spanned by products of at least two generators, and the quotient has the degree-i generators as basis.

**Acceptance.**

- In degree 10 the stable cohomology of SL(O_F) for a field with r₁+r₂≥2 is nonzero (products of two distinct generators of degree 5), but QH^{10}=0 and K_{10}(O_F)⊗ℝ=0.
- Finite generation of K_i(O) is not among the prerequisites.

**Depends on.** This roadmap: `R.3/gl-sl-primitive-comparison`, `R.2/stable-hopf-compatibility`, `R.3/stable-arithmetic-exterior`; declarations of other roadmaps: `StableHomotopyKTheory:H.3/rational-hurewicz-hspace`; layers, with a request: `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

**Source.** [Armand Borel, *Stable real cohomology of arithmetic groups*](https://www.numdam.org/item/ASENS_1974_4_7_2_235_0.pdf), §10.6(3), pp.265–266; §12.1, p.270. Recalls that the real homotopy of an H-space is its primitive homology, dual to the indecomposables of cohomology, and applies it to the K-groups of an order.

### Borel’s rank theorem for division-algebra orders

**Declaration** `divisionOrder_borelRank` · theorem · node `R.3/division-order-rank-period` · planet “Borel rank theorem for orders”.

For any order O in a finite-dimensional central division algebra over a number field F and i≥2, dim_R(K_i(O)⊗_Z R) is 0 if i≡0 or 2 mod4, r1+r2 if i≡1 mod4, and r2 if i≡3 mod4. In particular the answer is independent of the degree and real ramification of D. No assertion about integral torsion or K1 is part of this theorem.

**Hypotheses.** O is any order of D, maximal or not.

**Proof.**

1. Combine R.3 arithmeticK_rationalHurewicz with the degreewise stable exterior algebra.
2. Real and quaternionic factors each contribute one generator in degrees 5,9,…; complex factors contribute one in 3,5,….
3. Read the period-four pattern with the explicit lower cutoff i≥2.

**Acceptance.** For F totally real the rank in degree 3 is zero; degree 5 has rank [F:Q].

**Depends on.** This roadmap: `R.3/cartan-serre-application`; pinned libraries: `mathlib:NumberField.InfinitePlace.nrRealPlaces`, `mathlib:NumberField.InfinitePlace.nrComplexPlaces`.

**Source.** [Armand Borel, *Stable real cohomology of arithmetic groups*](https://www.numdam.org/item/ASENS_1974_4_7_2_235_0.pdf), Proposition 12.2, p.271. This is the precise generality and period-four endpoint, including nonmaximal orders.

### Borel’s odd K-group rank theorem

**Declaration** `borelRankTheorem` · theorem · node `R.3/borel-rank-theorem` · planet “Borel rank theorem”.

For a number field F and j≥2, dim_ℚ(K_{2j−1}(O_F)⊗ℚ)=d_j(F), where d_j(F)=r₁+r₂ when j is odd and r₂ when j is even; and K_i(O_F)⊗ℚ=0 for even i≥2. The rank of an abelian group means the dimension after tensoring with ℚ; the statement asserts neither finite generation nor discreteness of a regulator image. The same holds for every order of F.

**Hypotheses.** j≥2; O_F is the ring of integers of F.

**Proof.**

1. Specialize the division-order theorem to D=F, O=O_F and i=2j−1.
2. Compare Q- and R-dimensions by scalar extension of a finite-dimensional rational vector space.
3. Use the parity of j to distinguish i≡1 and 3 mod4.

**Used by.**

- Polylogarithms:P.4/zagier-determinant: Fixes the number of columns of the regulator matrix.
- ArithmeticKTheory:N.3:ranks/borel-rank-theorem: Supplies the rank for O_F; that node owns the passage to rings of S-integers and to F by localisation.
- BorelRegulators:R.4/target-dimension: Matches the dimension of the regulator target.
- BorelRegulators:R.4/regulator-adams-products: Even-degree groups are rationally zero, which kills products of positive-degree classes.

**API.**

- `borelRankTheorem_odd` (simp): If j≥2 is odd, dim_Q K_{2j−1}(O_F)⊗Q=r1+r2.
- `borelRankTheorem_even` (simp): If j≥2 is even, dim_Q K_{2j−1}(O_F)⊗Q=r2.
- `borelRankTheorem_scalarExtension` (compatibility): The Q-rank equals dim_R(K_{2j−1}(O_F)⊗R).
- `borelRankTheorem_order` (compatibility): The corresponding odd-rank statement holds for every commutative order in F by divisionOrder_borelRank, without an unproved integral K-isomorphism.
- `borelRankTheorem_evenDegree` (compatibility): For even i≥2, K_i(O_F)⊗ℚ=0.

**Unit tests.**

- `borelRankTheorem_Q_two` (computation): dim_Q(K3(Z)⊗Q)=0.
- `borelRankTheorem_Q_three` (computation): dim_Q(K5(Z)⊗Q)=1.
- `borelRankTheorem_imaginary_quadratic` (computation): For [F:Q]=2, r1=0 and j≥2, the odd K-group rank is one.
- `borelRankTheorem_units_excluded` (non-example): The theorem cannot be applied at j=1: rank K1(O_F)=r1+r2−1.
- `borelRankTheorem_even_degrees` (degenerate): dim_ℚ(K₂(ℤ)⊗ℚ)=0 and dim_ℚ(K₄(O_F)⊗ℚ)=0 for every number field F.

**Acceptance.**

- For F=ℚ, j=2 gives rank zero and j=3 gives rank one.
- For an imaginary quadratic F, every j≥2 gives rank one.
- The rank of K_i of a ring of S-integers is not stated here: it is ArithmeticKTheory:N.3:ranks/borel-rank-theorem, which consumes this theorem.

**Depends on.** This roadmap: `R.3/division-order-rank-period`; pinned libraries: `mathlib:NumberField.InfinitePlace.nrRealPlaces`, `mathlib:NumberField.InfinitePlace.nrComplexPlaces`.

**Source.** [Armand Borel, *Stable real cohomology of arithmetic groups*](https://www.numdam.org/item/ASENS_1974_4_7_2_235_0.pdf), Proposition 12.2, p.271. The odd-degree formulation is a direct specialization of the proven rank theorem.

## R.4 — Regulator classes and maps

**Objects.** The target V_j(F), defined before any choice of coordinates as a space of functions on all complex embeddings with a conjugation rule; its coordinates c_j, reference lattice and measure; the maps of pullback and trace along a finite extension, which use every embedding of the larger field. The universal Borel class Bo_j in the continuous cohomology of GL_N(ℂ), and its representative by the alternating trace form Φ_{2j−1}(X₁,…,X_{2j−1}) = ((−1)^{j−1}(j−1)!/(2j−1)!)·Σ_s sgn(s)·Tr(X_{s(1)}⋯X_{s(2j−1)}). The regulator r_Bo on K_{2j−1}(F) and on K_{2j−1}(O_F); its matrix, determinant and covolume.

**Conventions.** The relative Lie algebra representative of Bo_j is Φ evaluated on the Hermitian parts X_i^† + X_i, and its image in absolute Lie algebra cohomology is represented by 2·π_{j−1}∘Φ; the two agree as classes, not as cochains. The Pauli matrices give Φ₃ = −2i, which fixes the factorial and the sign. Coordinates of an element of V_j(F) at conjugate embeddings differ by (−1)^{j−1}; changing the chosen embedding above a complex place multiplies that coordinate by (−1)^{j−1}.

**Theorems.** Naturality in the field and the transfer formula r_F∘f_* = Tr_f∘r_E. Adams weight: r_Bo(ψ^a x) = a^j·r_Bo(x), so r_Bo vanishes on the weights other than j and on products of classes of positive degree. The real regulator r_Bo ⊗ ℝ is an isomorphism K_{2j−1}(O_F) ⊗ ℝ → V_j(F); this uses the stable cohomology and the nonvanishing of the pairing of Bo_j with the primitive generators, not a count of dimensions. With finite generation of K_{2j−1}(O_F), the image is a lattice; its covolume R_Bo,j(F) is the absolute value of the determinant of the regulator matrix, and equals 1 when d_j = 0.

**Dependencies.** R.2 and R.3; the K-groups of a ring, plus-equals-Q, transfers and their base change from GeneralAlgebraicKTheory K.2 and K.3; finite generation and rational localisation from ArithmeticKTheory N.3; Adams operations from SchemeKTheoryOperations S.6; the Chern character and Bott periodicity from RefinedTraceMethods RT.4:topological; van Est from AF.1a. Request: the suspension of the Chern character with its value on the Bott generator (RT.4:topological).

### The embedding-conjugation regulator target

**Declaration** `archimedeanTarget` · definition · node `R.4/archimedean-target` · planet “Archimedean regulator target”.

For a number field F and j≥2 let Σ_F=Hom(F,C), R(q)=(2πi)^q R and V_j(F)=(∏_{σ∈Σ_F}R(j−1))^conj, where conj acts simultaneously on coefficients and embeddings. After dividing each component by (2πi)^{j−1}, identify this with the real submodule of functions f:Σ_F→R satisfying f(σ̄)=(−1)^{j−1}f(σ). This submodule formulation extends to any finite set with an involution and uses Mathlib's conjugation of complex embeddings.

**Hypotheses.** F number field; j≥2. The coefficient twist is part of the definition.

**Construction.**

1. Use the pinned finite embedding set and involutive_conjugate.
2. Take the simultaneous fixed subspace; express it as a real submodule by the displayed coordinate equation.
3. Identify coefficient R(j−1) with R through its specified generator.

**Used by.**

- Burgos, Proposition 9.22: Assembles normalized complex regulators using simultaneous invariance.
- Polylogarithms:P.4/zagier-determinant: Specifies the real target before coordinate selection.

**API.**

- `archimedeanTarget_mk` (constructor): A function satisfying f(σ̄)=(−1)^{j−1}f(σ) determines a target element.
- `archimedeanTarget_ext` (extensionality): Two elements are equal iff their evaluations at every σ agree.
- `archimedeanTarget_conjugate` (simp): Evaluation at σ̄ is (−1)^{j−1} times evaluation at σ.
- `archimedeanTarget_fixed_even` (simp): At a conjugation-fixed embedding, every target element is zero if j is even.
- `archimedeanTarget_twist` (equivalence): Multiplication by (2πi)^{j−1} identifies the real-function model with the simultaneous fixed subspace in ∏R(j−1).
- `archimedeanTarget_reindex` (functoriality): An involution-equivariant bijection of embedding sets induces a real linear equivalence, with identity and composition laws.

**Unit tests.**

- `archimedeanTarget_fixed_weight_two` (degenerate): On a one-point embedding set with identity involution and j=2, the target is zero.
- `archimedeanTarget_pair_weight_two` (computation): On a two-point exchanged pair at j=2, the function (1,−1) is in the target and (1,1) is not.
- `archimedeanTarget_fixed_weight_three` (computation): On a fixed point at j=3, the constant function 1 belongs to the target.

**Acceptance.**

- A real embedding contributes only if j is odd.
- Counting complex embeddings independently would double the target dimension.

**Depends on.** Pinned libraries: `mathlib:NumberField.ComplexEmbedding.involutive_conjugate`, `mathlib:NumberField.InfinitePlace.mk_eq_iff`.

**Source.** [José Ignacio Burgos Gil, *The Regulators of Beilinson and Borel*](https://www.icmat.es/miembros/burgos/files/brbr.pdf), Proposition 9.22 and Corollary 9.23, pp.84–85. The coefficient twist and embedding conjugation give the actual regulator target.

### Coordinates and integral reference lattice

**Declaration** `targetCoordinates` · construction · node `R.4/target-coordinates` · planet “Regulator coordinates”.

Choose one complex embedding above each complex infinite place; real places have their unique real embedding. Let I_j(F) consist of all complex infinite places and the real infinite places only when j is odd. Evaluation at the chosen embeddings gives c_j:V_j(F)≃_R R^{I_j(F)}, with inverse reconstructing the conjugate coordinate by (−1)^{j−1} and putting zero at omitted real places. Define the reference Z-lattice c_j⁻¹(Z^{I_j}) and transport coordinate product Haar measure so that its covolume is one. The ambient Euclidean fixed-subspace metric is not the measure convention.

**Hypotheses.** The selection is explicit data; changing a complex representative changes its coordinate by (−1)^{j−1}.

**Construction.**

1. Use InfinitePlace.mk_eq_iff to split each embedding fiber into a singleton or conjugate pair.
2. Define evaluation and reconstruction and prove both inverses.
3. Use Mathlib's ℤ-span, IsZLattice and covolume; transport the coordinate volume through c_j.

**Used by.**

- BorelRegulators:R.4/regulator-covolume: Fixes the measure used for the covolume.
- BorelRegulators:R.7/extension-matrix: Provides computable matrices for coordinate-free maps.

**API.**

- `targetCoordinates_apply` (projection): In the model by real functions, c_j(x)(v)=x(σ_v). Starting from the complex Tate model, first use archimedeanTarget_twist to divide by the fixed generator (2πi)^{j−1} exactly once, then evaluate; no second division occurs in c_j.
- `targetCoordinates_symm` (constructor): Reconstruction uses x_v at σ_v and (−1)^{j−1}x_v at σ̄_v, with zero at even-weight real places.
- `targetCoordinates_inverse` (equivalence): Evaluation and reconstruction are mutually inverse real linear maps.
- `targetCoordinates_change` (compatibility): Changing selected representatives gives a diagonal matrix with entries ±1 and absolute determinant one.
- `targetCoordinates_reference` (structure): The inverse image of Z^{I_j} is discrete, spans V_j and has covolume one for the transported coordinate measure.
- `targetCoordinates_ext` (extensionality): Agreement on the chosen coordinates determines a target element.

**Unit tests.**

- `targetCoordinates_pair_two` (computation): At weight two one exchanged pair has coordinate a and reconstruction (a,−a).
- `targetCoordinates_empty` (degenerate): For F=Q and j=2 the coordinate space is R^0 and the reference lattice has covolume one.
- `targetCoordinates_representative_switch` (characterisation): Switching the embedding of an imaginary quadratic field at j=2 multiplies the single coordinate by −1 and preserves its absolute covolume.

**Acceptance.** Each conjugate pair has reference covolume one, not √2.

**Depends on.** This roadmap: `R.4/archimedean-target`; pinned libraries: `mathlib:NumberField.InfinitePlace.mk_eq_iff`, `mathlib:IsZLattice`, `mathlib:ZLattice.covolume`.

**Source.** [José Ignacio Burgos Gil, *The Regulators of Beilinson and Borel*](https://www.icmat.es/miembros/burgos/files/brbr.pdf), Proposition 9.22, p.85, including its lattice statement. The fixed product of Tate integer lattices determines the reference measure.

### Dimension of the conjugation target

**Declaration** `archimedeanTarget_finrank` · theorem · node `R.4/target-dimension`.

For every number field F and j≥2, dim_R V_j(F)=d_j(F)=r1+r2 if j is odd and r2 if j is even. The integral reference lattice has the same Z-rank. The proof uses conjugation-fixed real embeddings and one independent coordinate for each exchanged complex pair.

**Hypotheses.** r2 counts conjugate pairs, using the pinned InfinitePlace definition.

**Proof.**

1. Apply targetCoordinates and count I_j(F).
2. Use the pinned real/complex-place cardinalities and embedding-fiber classification.
3. Check that even-weight real coordinates vanish because a=−a over R.

**Acceptance.** For totally real F and j=2 the target dimension is zero.

**Depends on.** This roadmap: `R.4/target-coordinates`; pinned libraries: `mathlib:NumberField.InfinitePlace.nrRealPlaces`, `mathlib:NumberField.InfinitePlace.nrComplexPlaces`, `mathlib:NumberField.InfinitePlace.card_add_two_mul_card_eq_rank`.

**Source.** [José Ignacio Burgos Gil, *The Regulators of Beilinson and Borel*](https://www.icmat.es/miembros/burgos/files/brbr.pdf), Proposition 9.22 and the dimension discussion in §9.2. Simultaneous invariants have the stated signature-dependent dimension.

### The normalized universal Borel class

**Declaration** `universalBorelClass` · construction · node `R.4/universal-borel-class` · planet “Universal Borel class”.

For j≥2 and N in the classical stable range, Bo_j∈H_cont^{2j−1}(GL_N(C),R(j−1)) is Burgos’s Definition 9.24 class: suspend ch_j in H^{2j}(BGL_N(C),R(j)), restrict to U_N, identify invariant forms on U_N\(U_N×U_N), identify the same complex relative cochain with coefficients R(j−1), and apply inverse van Est. The twist generator and suspension normalization are fixed by ch_j=(2πi)^j pr_j/j!, with the integral Bott/Hurewicz normalization from topological K-theory. The class restricts compatibly with N and is primitive.

**Hypotheses.**

- GL_N(ℂ) is regarded as a real Lie group with maximal compact subgroup U_N. N lies in the stable range for degree 2j; N≥2j suffices, since the generator of degree 2j−1 of H^*(U_N;ℝ) and the class ch_j on BGL_N(ℂ) are stable from N≥j on.
- The identification of the coefficient lines ℝ(j) and ℝ(j−1) is the one of Burgos Definition 9.24: both relative cohomology groups are the same real subspace of the cohomology with complex coefficients.

**Construction.**

1. Take ch_j=(2πi)^j pr_j/j! and suspend it to U_N (RT.4:topological/chern-character, chern-classes, bott-periodicity). For the Bott homotopy generator ε_j and an integral primitive homology generator β_j, Hurewicz sends ε_j to ±(j−1)!β_j, whereas suspended ch_j evaluates as ±(2πi)^j/(j−1)! on β_j. Thus its value on ε_j is one signed Tate unit ±(2πi)^j, not (j−1)!. These suspension and Hurewicz identifications are requested from RT.4:topological; fix the sign by the chosen Bott orientation (Burgos Theorem 4.24 and Remark 4.25, p.32).
2. Restrict to U_N and represent the class by a bi-invariant form on U_N=U_N\(U_N×U_N), that is, by a relative Lie algebra cochain for (u_N⊕u_N,u_N); pass to (gl_N(ℂ),u_N) with the twisted coefficient line, and apply the inverse of the van Est isomorphism (AF.1a/invariant-forms-complex, AF.1a/van-est-isomorphism).
3. Independence of N and primitivity follow from the stable cohomology of the compact dual of GL_N(ℂ) and its block-sum maps (R.3, R.2).

**Used by.**

- Burgos, Theorem 10.9: It is the class compared with the Beilinson element in every weight.
- BorelRegulators:R.4/borel-regulator: Its restriction to the discrete group is paired with Hurewicz images of K-theory classes.
- BorelRegulators:R.4/regulator-adams-products: Its behaviour under representations gives the Adams weight of the regulator.
- Polylogarithms:P.3/configuration-borel-class: The explicit weight-three cocycle is compared with it.

**API.**

- `universalBorelClass_stabilize` (functoriality): Block pullback Bo_j,N+1=Bo_j,N in the common stable range.
- `universalBorelClass_primitive` (structure): Block sum pulls Bo_j back to pr1*Bo_j+pr2*Bo_j.
- `universalBorelClass_conjugation` (compatibility): Complex conjugation and the Tate generator yield component parity (−1)^{j−1} on regulator values.
- `universalBorelClass_vanEst` (characterisation): Van Est sends Bo_j to the relative class obtained from the suspended normalized ch_j.
- `universalBorelClass_bott` (compatibility): With compatible Bott orientation, ⟨s(ch_j),ε_j⟩=(2πi)^j. The Hurewicz image of ε_j is ±(j−1)! times an integral primitive homology generator, on which s(ch_j) has the reciprocal factorial; the homotopy pairing is one Tate unit.
- `universalBorelClass_representation` (functoriality): For an algebraic representation ρ:GL_N→GL_M over ℂ, ρ^*Bo_{j,M}∈H_cont^{2j−1}(GL_N(ℂ);ℝ(j−1)) is the image of ch_j of the bundle associated with ρ on BGL_N(ℂ) under the same chain of maps; it is additive in ρ, so it is defined on the representation ring.

**Unit tests.**

- `universalBorelClass_stable_two` (characterisation): At j=2, block pullback from GL_11(C) to GL_9(C) gives the same degree-three class.
- `universalBorelClass_abelian_two` (degenerate): Restriction to GL_1(C) has zero degree-three continuous class.
- `universalBorelClass_chern_factor` (non-example): On indecomposables ch_3=(2πi)^3 c_3/2, so using c_3 without its factor cannot satisfy the normalization.
- `universalBorelClass_bott_three` (non-example): For j=3 the pairing of suspended ch₃ with the compatibly oriented Bott generator, divided by (2πi)³, is 1; the Hurewicz factorial is 2 and must not be substituted for that pairing.

**Acceptance.** Replacing ch_j by the Chern class c_j changes the normalization by the nontrivial factorial/sign on indecomposables.

**Depends on.** This roadmap: `R.3/compact-dual-cohomology`, `R.2/stable-hopf-compatibility`; Declarations of other roadmaps: `AutomorphicFormsOnReductiveGroups:AF.1a/van-est-isomorphism`, `AutomorphicFormsOnReductiveGroups:AF.1a/invariant-forms-complex`, `RefinedTraceMethods:RT.4:topological/chern-character`, `RefinedTraceMethods:RT.4:topological/chern-classes`, `RefinedTraceMethods:RT.4:topological/bott-periodicity`; Layers, with a request: `RefinedTraceMethods:RT.4:topological`.

**Source.** [José Ignacio Burgos Gil, *The Regulators of Beilinson and Borel*](https://www.icmat.es/miembros/burgos/files/brbr.pdf), Definition 9.24 and Remark 4.25, pp.86–87,32. Defines the universal renormalized class; the Chern character fixes factorial and Tate factors.

### Alternating trace representative

**Declaration** `traceCocycle` · construction · node `R.4/trace-cocycle` · planet “Borel trace cocycle”.

For j≥2 and m=2j−1, define Φ_m(X_1,…,X_m)=c_j∑_{s∈S_m}sgn(s)Tr(X_{s(1)}⋯X_{s(m)}), where c_j=(−1)^{j−1}(j−1)!/(2j−1)!, on complex square matrices. Regard the Lie algebra as real. The relative Borel representative is Φ_m(X_1†+X_1,…,X_m†+X_m); its absolute Lie cohomology class has invariant representative 2π_{j−1}Φ_m, with π_q(z)=(z+(−1)^q z̄)/2. These are equal as cohomology classes after relative-to-absolute inclusion, not pointwise as cochains.

**Hypotheses.** Finite matrix size N; trace and conjugate transpose are Mathlib's.

**Construction.**

1. Use Mathlib's sign of a permutation and matrix trace to define the alternating sum.
2. Use trace cyclicity and conjugate transpose to verify real multilinearity, alternation and the coefficient-line condition.
3. Apply Burgos Propositions 9.25–9.26 to the relative and invariant absolute representatives.

**Used by.**

- Burgos, §10.4: Compares Borel and Beilinson representatives with exact scalar two.
- BorelRegulators:R.7: Supplies a discriminating small-matrix normalization test.

**API.**

- `traceCocycle_alternating` (relation): Permuting the inputs multiplies Φ by the permutation sign; repeated inputs give zero.
- `traceCocycle_multilinear` (structure): Φ is complex multilinear before real-coefficient projection, and its relative and projected forms are real multilinear.
- `traceCocycle_block` (functoriality): On block-diagonal inputs Φ is the sum of the forms on the two blocks; adding a zero block leaves it unchanged.
- `traceCocycle_three` (simp): Φ3(X,Y,Z)=−Tr(X(YZ−ZY))/2.
- `traceCocycle_projection` (compatibility): π_q is the real-linear projection onto R(q)⊂C; the absolute Borel class is represented by 2π_{j−1}Φ.
- `traceCocycle_scalar` (simp): For m>1, if all inputs commute, Φ_m=0.

**Unit tests.**

- `traceCocycle_scalar_two` (degenerate): For N=1 and j=2 the form vanishes on every triple.
- `traceCocycle_pauli_two` (computation): For the Hermitian Pauli matrices X,Y,Z with [Y,Z]=2iX and Tr(X²)=2, Φ3(X,Y,Z)=−2i.
- `traceCocycle_repeat` (characterisation): Φ3(X,X,Z)=0, ruling out the unalternated trace product.

**Acceptance.** At j=2, Φ3(X,Y,Z)=−Tr(X[Y,Z])/2.

**Depends on.** This roadmap: `R.4/universal-borel-class`; declarations of other roadmaps: `AutomorphicFormsOnReductiveGroups:AF.1a/relative-lie-cochain-complex`; pinned libraries: `mathlib:Matrix.trace_mul_comm`, `mathlib:Matrix.trace_conjTranspose`.

**Source.** [José Ignacio Burgos Gil, *The Regulators of Beilinson and Borel*](https://www.icmat.es/miembros/burgos/files/brbr.pdf), §9.7, Propositions 9.25–9.26, pp.87–88. The explicit alternating trace form gives the precise representative and factor two.

### The normalized Borel regulator

**Declaration** `borelRegulator` · construction · node `R.4/borel-regulator` · planet “Borel regulator”.

For a number field F and j≥2 the Borel regulator r_Bo:K_{2j−1}(F)→V_j(F) has σ-component, for each embedding σ:F→ℂ, the composite of K_{2j−1}(σ), the Hurewicz map K_{2j−1}(ℂ)=π_{2j−1}(BGL(ℂ)⁺)→H_{2j−1}(GL(ℂ);ℤ), and the pairing with the restriction of Bo_j to the discrete group GL_N(ℂ), with values in ℝ(j−1). The components satisfy the conjugation condition, so r_Bo lands in V_j(F). The arithmetic regulator r_Bo:K_{2j−1}(O_F)→V_j(F) is the composite with K_{2j−1}(O_F)→K_{2j−1}(F). The normalisation is Burgos's renormalised one, not that of Borel's original lattice.

**Hypotheses.**

- j≥2. K-groups are those of the ring model K.2/functorial-K-theory-of-a-ring, identified with homotopy groups of BGL⁺ by K.2:plus/plus-equals-Q, and H_*(BGL(R)⁺;ℤ)=H_*(GL(R);ℤ) by H.3/plus-integral-homology.
- The pairing uses the group homology of the discrete group GL_N(ℂ), stably in N.

**Construction.**

1. For each σ, map K_{2j−1}(F) to K_{2j−1}(ℂ), apply Hurewicz and pair with the image of Bo_j under arithmeticRestriction for the discrete group GL_N(ℂ); stability in N is universalBorelClass_stabilize.
2. Complex conjugation acts on GL_N(ℂ) and on the coefficient line; universalBorelClass_conjugation gives r_{σ̄}=(−1)^{j−1}r_σ in real coordinates, which is the defining condition of V_j(F).
3. Additivity follows from primitivity of Bo_j. The map K_{2j−1}(O_F)⊗ℚ→K_{2j−1}(F)⊗ℚ is an isomorphism by ArithmeticKTheory:N.3:ranks/borel-rank-theorem.

**Used by.**

- Polylogarithms:P.4/zagier-determinant: Uses this map and its normalisation for the regulator determinant.
- BorelRegulators:R.5/borel-zeta-proportionality: Its covolume is compared with the leading term of the zeta function.
- BorelRegulators:R.7/regulator-factor-two: Is compared with the Beilinson regulator.
- HabiroNahmSeries:HB.3/torsion-criterion-by-regulators: Uses that the degree-three regulator has kernel exactly the torsion.
- ColemanIntegration:L3/padic-beilinson-conjecture: The complex part of the p-adic Beilinson statement uses the regulator on K_{2n−1}(ℂ) and the rank theorem.

**API.**

- `borelRegulator_embedding` (projection): The σ-component equals r_Bo,C∘K(σ).
- `borelRegulator_add` (structure): r_Bo is an additive homomorphism; it kills every torsion element.
- `borelRegulator_integral` (compatibility): r_Bo on K_{2j−1}(O_F) is r_Bo on K_{2j−1}(F) composed with the map induced by O_F⊂F, which is an isomorphism after tensoring with ℚ (ArithmeticKTheory:N.3:ranks/borel-rank-theorem).
- `borelRegulator_conjugation` (relation): In real Tate coordinates r_σ̄=(−1)^{j−1}r_σ.
- `borelRegulator_natural` (functoriality): For a field embedding f:F→E, r_E∘f*=pull_f∘r_F, with identity and composition laws.
- `borelRegulator_pairing` (characterisation): Pairing with Bo_j equals the corresponding component regulator on the Hurewicz image of every K-theory class.
- `borelRegulator_equiv` (functoriality): A number-field isomorphism gives the regulator square with the induced bijection of complex embeddings.

**Unit tests.**

- `borelRegulator_Q_two` (degenerate): r_Bo:K3(Z)→V2(Q) is zero because the target is zero.
- `borelRegulator_torsion` (characterisation): For any nonzero integer a with a·x=0, r_Bo(x)=0.
- `borelRegulator_imaginary_conjugate` (computation): At weight two over an imaginary quadratic F the two components are (a,−a), not (a,a).

**Acceptance.** This construction alone does not assert a lattice or finite generation.

**Depends on.** This roadmap: `R.4/universal-borel-class`, `R.4/archimedean-target`, `R.2/arithmetic-restriction`; declarations of other roadmaps: `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`, `GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q`, `StableHomotopyKTheory:H.3/plus-integral-homology`, `ArithmeticKTheory:N.3:ranks/borel-rank-theorem`; layers, with a request: `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology`.

**Source.** [José Ignacio Burgos Gil, *The Regulators of Beilinson and Borel*](https://www.icmat.es/miembros/burgos/files/brbr.pdf), Definitions 9.19,9.24 and Proposition 9.21, pp.84–86. The number-field map is assembled from the universal complex-field regulator and its fixed target.

### Embedding pullback and trace on targets

**Declaration** `embeddingPullTrace` · construction · node `R.4/embedding-pull-trace`.

For a finite extension f:F→E define pull_f:V_j(F)→V_j(E) by (pull_f x)_τ=x_{τ∘f}, and Tr_f:V_j(E)→V_j(F) by (Tr_f y)_σ=∑_{τ∘f=σ}y_τ. Both are real linear and preserve conjugation parity. Every complex embedding σ has exactly [E:F] extensions, hence Tr_f∘pull_f=[E:F]·id. Coordinate matrices are obtained only after targetCoordinates; they are not obtained by discarding the conjugate member of each fiber.

**Hypotheses.** F,E number fields and f a field embedding; coefficients use the same Tate generator.

**Construction.**

1. Use finite embedding fibers and conjugation-equivariance of restriction.
2. Define precomposition and fiberwise sum, retaining all complex embeddings.
3. Use the separable embedding-extension count from number-field embedding theory.

**Used by.**

- BorelRegulators:R.4/regulator-transfer: States field-extension naturality and transfer with the correct embedding multiplicities.
- BorelRegulators:R.7/extension-matrix: Exports computational matrices.

**API.**

- `embeddingPull_apply` (projection): (pull_f x)_τ=x_{τ∘f}.
- `embeddingTrace_apply` (projection): (Tr_f y)_σ is the sum over the full embedding fiber above σ.
- `embeddingPullTrace_id` (functoriality): Pullback and trace along identity are identity.
- `embeddingPullTrace_comp` (functoriality): Pull_{g∘f}=pull_g∘pull_f and Tr_{g∘f}=Tr_f∘Tr_g.
- `embeddingTrace_pull` (relation): Tr_f∘pull_f=[E:F]·id.
- `embeddingPullTrace_conjugate` (compatibility): Both maps preserve the defining conjugation parity and therefore land in the fixed targets.

**Unit tests.**

- `embeddingPullTrace_identity` (degenerate): For f=id both maps are identity in every weight.
- `embeddingPullTrace_quadratic_odd` (computation): For Q⊂Q(i) at j=3, the one-coordinate pull matrix is (1) and the trace matrix is (2).
- `embeddingPullTrace_quadratic_even` (computation): For Q⊂Q(i) at j=2 the trace to the zero target V2(Q) is zero; summing the pair (a,−a) gives zero.

**Acceptance.** For Q⊂an imaginary quadratic field at j=3, coordinate pullback is 1 and coordinate trace is 2.

**Depends on.** This roadmap: `R.4/archimedean-target`, `R.4/target-coordinates`; pinned libraries: `mathlib:NumberField.ComplexEmbedding.involutive_conjugate`, `mathlib:AlgHom.card`.

**Source.** [José Ignacio Burgos Gil, *The Regulators of Beilinson and Borel*](https://www.icmat.es/miembros/burgos/files/brbr.pdf), Proposition 9.21 and the product target of Proposition 9.22. The componentwise embedding realization determines the specialization to pullback and trace; the trace identity is derived by counting embedding fibers.

### Regulator naturality and finite-extension transfer

**Declaration** `borelRegulator_transfer` · theorem · node `R.4/regulator-transfer`.

For a finite number-field extension f:F→E and j≥2, r_E∘f*=pull_f∘r_F and r_F∘f_*=Tr_f∘r_E on higher K-groups of fields, where f_* is restriction-of-scalars transfer. Thus r_F∘f_*∘f*=[E:F]r_F. The same formula for rings of integers uses their finite projective transfer and compatibility with localization; no unramified hypothesis is added to this field-level formula.

**Hypotheses.** The transfer f_* is the transfer of GeneralAlgebraicKTheory K.3 for the finite extension E/F (and for the finite projective O_F-module O_E); no hypothesis on ramification is made.

**Proof.**

1. Naturality: r_E∘f^*=pull_f∘r_F holds componentwise, since τ∘f is an embedding of F for every embedding τ of E.
2. Transfer: for an embedding σ of F, K.3/finite-field-transfer-base-change applied to F′=ℂ gives K(σ)∘f_*=Σ_τ K(τ), the sum over the [E:F] embeddings τ of E extending σ, because E⊗_{F,σ}ℂ is a product of copies of ℂ indexed by those τ, each of length one.
3. Pairing with Bo_j, which is additive, gives the σ-component of Tr_f∘r_E. For rings of integers the transfer along O_F→O_E commutes with localisation after tensoring with ℚ (ArithmeticKTheory:N.3/rational-localisation-extension-transfer).

**Acceptance.** An even-weight real target receives the sum of a conjugate pair, which is zero.

**Depends on.** This roadmap: `R.4/borel-regulator`, `R.4/embedding-pull-trace`; declarations of other roadmaps: `GeneralAlgebraicKTheory:K.3/transfer-maps-and-projection-formula`, `GeneralAlgebraicKTheory:K.3/finite-field-transfer-base-change`, `GeneralAlgebraicKTheory:K.3/additivity-for-exact-categories`, `GeneralAlgebraicKTheory:K.2:plus/scalar-extension-and-functoriality`, `ArithmeticKTheory:N.3/rational-localisation-extension-transfer`.

**Source.** [José Ignacio Burgos Gil, *The Regulators of Beilinson and Borel*](https://www.icmat.es/miembros/burgos/files/brbr.pdf), Proposition 9.21, pp.84–85. The regulator of a number field is determined, embedding by embedding, by the regulator of ℂ; the transfer formula then follows from the base-change formula for transfers.

### Higher Adams weights and product compatibility

**Declaration** `borelRegulator_adams` · theorem · node `R.4/regulator-adams-products`.

For a number field F, j≥2 and an integer a≥1, r_Bo(ψ^a x)=a^j·r_Bo(x) for x∈K_{2j−1}(F)⊗ℚ, where ψ^a is the Adams operation on higher K-groups. Consequently r_Bo vanishes on every summand of weight w≠j in the weight decomposition of K_{2j−1}(F)⊗ℚ. For classes x, y of positive degrees m, m′ with m+m′=2j−1, r_Bo(x·y)=0: one of the degrees is even, and K_i(F)⊗ℚ=0 for even i≥2. For c∈K₀(F)=ℤ, r_Bo(c·x)=c·r_Bo(x).

**Hypotheses.** The operations are those of SchemeKTheoryOperations S.6 on the higher K-theory of a commutative ring, defined through virtual representations of GL_N; Adams operations on K₀ alone do not suffice.

**Proof.**

1. ψ^a on K_m(F)=π_m(BGL(F)⁺) is composition with the self-map of BGL(F)⁺ defined by the virtual representations ψ^a(id_N−N) of the groups GL_N, which are integral combinations of algebraic representations (S.6/quillen-hiller-operations; Weibel IV, 5.3–5.4).
2. For an algebraic representation ρ over ℂ, ρ^*Bo_j is the class attached to ch_j(ρ) (universalBorelClass_representation), additively in ρ; and ch_j(ψ^a ρ)=a^j·ch_j(ρ) (RT.4:topological/chern-character). Since Bo_j is primitive, the pairing with a Hurewicz image is additive for the H-space sum, so r(ψ^a x)=a^j r(x).
3. On the summand of weight w, ψ^a acts by a^w (S.6/field-weight-decomposition); taking a=2 gives r=0 there for w≠j.
4. Products: K_i(F)⊗ℚ≅K_i(O_F)⊗ℚ=0 for even i≥2 by ArithmeticKTheory:N.3:ranks/borel-rank-theorem and borelRankTheorem_evenDegree; the product is bilinear (S.6/adams-product-compatibility is used for the weights of products).

**Acceptance.**

- For a=2 and j=3 the factor is 8.
- The product statement concerns factors of positive degree; multiplication by an integer class of K₀ multiplies the regulator by that integer.
- The proof does not use the comparison with the Beilinson regulator of R.7.

**Depends on.** This roadmap: `R.4/borel-regulator`, `R.4/universal-borel-class`, `R.3/borel-rank-theorem`; declarations of other roadmaps: `SchemeKTheoryOperations:S.6/quillen-hiller-operations`, `SchemeKTheoryOperations:S.6/operations-functoriality`, `SchemeKTheoryOperations:S.6/adams-product-compatibility`, `SchemeKTheoryOperations:S.6/field-weight-decomposition`, `RefinedTraceMethods:RT.4:topological/chern-character`, `RefinedTraceMethods:RT.4:topological/adams-operations`, `ArithmeticKTheory:N.3:ranks/borel-rank-theorem`.

**Source.** [Charles A. Weibel, *The K-book, Chapter IV: Definitions of Higher K-Theory*](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.IV.pdf), §5, Proposition 5.3, Example 5.3.1 and Definition 5.4, pp.47–49 of the author chapter PDF. Operations on the higher K-groups of a commutative ring are induced by virtual representations of the general linear groups through the representation ring.

**Source.** [Michael Rapoport, *Comparison of the regulators of Beilinson and of Borel*](https://ncatlab.org/nlab/files/Rapoport.pdf), §1, pp.171–175. The regulator is defined by higher Chern characters, which is why it has Adams weight j.

### The real regulator isomorphism

**Declaration** `borelRegulator_realIso` · theorem · node `R.4/regulator-real-isomorphism`.

For F a number field and j≥2, the linear extension r_Bo,O_F⊗R:K_{2j−1}(O_F)⊗R→V_j(F) is an isomorphism. The same is true for K_{2j−1}(F)⊗R using localization. This is proved from the normalized primitive compact-dual pairing and arithmetic stable comparison, not merely from equality of source and target dimensions.

**Hypotheses.** No integral finite-generation hypothesis is used.

**Proof.**

1. By R.3, K_{2j−1}(O_F)⊗ℝ is the primitive part of H_{2j−1}(SL(O_F);ℝ), dual to the indecomposables of degree 2j−1, and these are, through the arithmetic comparison, the direct sum over the archimedean places of the degree-(2j−1) generators of the compact duals: one for each complex place, and one for each real place when j is odd.
2. For an embedding σ, the restriction of σ^*Bo_j to SL_N(O_F) is the image under j_Γ of the invariant form attached to Bo_j on the factor at the place of σ. At a complex place this is a nonzero multiple of the generator x_{2j−1}; at a real place it is the pullback of x_{2j−1} along SU_N/SO_N→SU_N, a nonzero multiple of y_{2j−1} when j is odd and zero when j is even (Burgos, Proposition 9.15).
3. Hence the components of r_Bo at one embedding per place, omitting real places for even j, form a basis of the dual of K_{2j−1}(O_F)⊗ℝ; with the conjugation rule this says that r_Bo⊗ℝ is an isomorphism onto V_j(F). The statement for F follows from ArithmeticKTheory:N.3:ranks/borel-rank-theorem.

**Acceptance.** Nonzero primitive pairing is essential; a zero map between equal-dimensional spaces is excluded.

**Depends on.** This roadmap: `R.4/universal-borel-class`, `R.4/borel-regulator`, `R.4/target-dimension`, `R.3/borel-rank-theorem`, `R.3/cartan-serre-application`, `R.3/arithmetic-stable-range`, `R.3/compact-dual-cohomology`; declarations of other roadmaps: `ArithmeticKTheory:N.3:ranks/borel-rank-theorem`.

**Source.** [José Ignacio Burgos Gil, *The Regulators of Beilinson and Borel*](https://www.icmat.es/miembros/burgos/files/brbr.pdf), Corollary 9.8, p.78; Proposition 9.15 and Corollary 9.17, pp.82–83. Borel’s regulator is an isomorphism onto the primitive homology of the compact dual after tensoring with ℝ, and the map of compact duals induced by the real points inside the complex points identifies that primitive homology with the conjugation-invariant part for the complex group.

### The arithmetic regulator image is a full lattice

**Declaration** `borelRegulator_isZLattice` · theorem · node `R.4/regulator-lattice` · planet “Regulator lattice”.

For a number field F and j≥2 let L_j=r_Bo(K_{2j−1}(O_F))⊂V_j(F). Since K_{2j−1}(O_F) is finitely generated (ArithmeticKTheory:N.3:finite-generation/quillen-finite-generation-theorem) and r_Bo⊗ℝ is an isomorphism, the kernel of r_Bo on K_{2j−1}(O_F) is its torsion subgroup, K_{2j−1}(O_F)/tors is free of rank d_j, and L_j is a discrete subgroup spanning V_j(F): a ℤ-lattice in the sense of Mathlib's IsZLattice. Finite generation is needed here, though not for the ranks of R.3.

**Hypotheses.** Finite generation of K_{2j−1}(O_F) is ArithmeticKTheory:N.3:finite-generation/quillen-finite-generation-theorem; any homomorphism to a real vector space kills torsion.

**Proof.**

1. Use the structure theorem for finitely generated abelian groups and r_j⊗R injectivity to identify the kernel as torsion.
2. The image of an integral basis under a real linear isomorphism is a discrete full lattice.
3. State discreteness and the spanning condition in the form of Mathlib's IsZLattice.

**Acceptance.** A finitely generated subgroup whose rank exceeds the ambient dimension can be nondiscrete; the real isomorphism prevents this.

**Depends on.** This roadmap: `R.4/regulator-real-isomorphism`, `R.4/borel-regulator`, `R.4/target-coordinates`; declarations of other roadmaps: `ArithmeticKTheory:N.3:finite-generation/quillen-finite-generation-theorem`; pinned libraries: `mathlib:IsZLattice`.

**Source.** [José Ignacio Burgos Gil, *The Regulators of Beilinson and Borel*](https://www.icmat.es/miembros/burgos/files/brbr.pdf), Corollary 9.8 and Definition 9.19, pp.78,84. Full regulator image and the arithmetic lattice define the covolume only after finite generation.

### The regulator determinant line and matrix

**Declaration** `regulatorMatrix` · construction · node `R.4/regulator-determinant`.

Let A=K_{2j−1}(O_F)/tors, d=d_j, with an integral basis b and selected target coordinates c_j. Define the regulator matrix M_{v,a}=c_j(r_Bo(b_a))_v and the top exterior map det(r):Λ^d_R(A⊗R)→Λ^d_R V_j. Its value on b_1∧⋯∧b_d is det(M) times the coordinate orientation. A unimodular integral basis change U multiplies det(M) by det(U)=±1; its absolute value is intrinsic. For d=0 use the empty determinant 1.

**Hypotheses.** A is finite free from the arithmetic finiteness theorem; determinant lines are top exterior powers in Mathlib's exterior algebra.

**Construction.**

1. Pass the regulator through the torsion quotient and select its integral basis.
2. Apply the map induced on top exterior powers, or equivalently the universal alternating determinant form.
3. Express this map in coordinate bases and prove the unimodular basis-change formula.

**Used by.**

- Polylogarithms:P.4/zagier-determinant: Exports the regulator matrix and intrinsic determinant.
- BorelRegulators:R.7: Controls the factor-two determinant conversion.

**API.**

- `regulatorMatrix_apply` (projection): M_{v,a}=c_j(r_Bo(b_a))_v.
- `regulatorMatrix_basis_change` (compatibility): For b′=bU, M(b′)=M(b)U and det M(b′)=det M(b)det U.
- `regulatorMatrix_target_change` (compatibility): Changing embedding representatives gives M′=DM for a diagonal sign matrix D.
- `regulatorMatrix_topExterior` (characterisation): The top exterior regulator map is multiplication by det M in the specified orientations.
- `regulatorMatrix_scalar` (relation): Multiplying the regulator by λ multiplies det M by λ^d.
- `regulatorMatrix_empty` (simp): At d=0 the matrix is 0×0 and its determinant is one.

**Unit tests.**

- `regulatorMatrix_rank_zero` (degenerate): The determinant at rank zero is 1.
- `regulatorMatrix_swap` (computation): Swapping two integral basis vectors negates the determinant and preserves its absolute value.
- `regulatorMatrix_double_two` (computation): For d=2, doubling every regulator component multiplies the determinant by 4, not by 2.

**Acceptance.** Changing either basis can change the signed determinant, but not its absolute value.

**Depends on.** This roadmap: `R.4/regulator-lattice`, `R.4/target-coordinates`; pinned libraries: `mathlib:ExteriorAlgebra`, `mathlib:ZLattice.covolume_eq_det`, `mathlib:LinearMap.toMatrix`.

**Source.** [José Ignacio Burgos Gil, *The Regulators of Beilinson and Borel*](https://www.icmat.es/miembros/burgos/files/brbr.pdf), Definition 9.19 and §9.4, pp.79–84. The determinant expression specializes the lattice covolume to the chosen primitive/reference basis.

### The normalized Borel regulator covolume

**Declaration** `regulatorCovolume` · construction · node `R.4/regulator-covolume`.

Define R_Bo,j(F)>0 as Mathlib's ZLattice.covolume of the arithmetic regulator image L_j with respect to the target measure transported from targetCoordinates. Equivalently R_Bo,j(F)=|det M| for any integral basis of K_{2j−1}(O_F)/tors. The reference fixed Tate integer lattice has covolume one. At d_j=0 set R_Bo,j(F)=1, agreeing with the volume of a zero-dimensional space.

**Hypotheses.** The full-lattice result and its discrete topology are established, not implicit assumptions on an arbitrary image.

**Construction.**

1. Use regulator-lattice and the specified coordinate measure to specialize ZLattice.covolume.
2. Apply the pinned covolume_eq_det theorem after coordinate transport.
3. Use unimodular and representative-change formulas for independence.

**Used by.**

- BorelRegulators:R.5/borel-zeta-proportionality: Gives the positive quantity rationally proportional to the zeta leading term.
- SpecialValuesBirchTate:B.8: Provides only the regulator normalization, not an integral torsion formula.

**API.**

- `regulatorCovolume_det` (compatibility): R_Bo,j=|det regulatorMatrix| under the selected coordinate measure.
- `regulatorCovolume_pos` (characterisation): The covolume is strictly positive for the proven full lattice.
- `regulatorCovolume_basis_independent` (relation): Every integral basis and every allowed representative selection gives the same positive value.
- `regulatorCovolume_scalar` (relation): For a nonzero real scalar λ, the image lattice of λr has covolume |λ|^{d_j}R_Bo,j.
- `regulatorCovolume_original` (compatibility): Relative to Borel’s original R′, R_Bo=(2π)^{d_j}R′ if j≢3 mod4, and R_Bo=(2π)^{d_j}2^{r1}R′ if j≡3 mod4.

**Unit tests.**

- `regulatorCovolume_zero_rank` (degenerate): For F=Q and j=2 the covolume is 1.
- `regulatorCovolume_rank_one_sign` (computation): For a rank-one matrix (a), the covolume is |a| and is unchanged by a↦−a.
- `regulatorCovolume_reference` (compatibility): The reference lattice Z^{I_j} has covolume 1 for the coordinate measure; no √2 per complex pair occurs.

**Acceptance.** The convention includes the real-place correction 2^{r1} at j≡3 mod4 when comparing with Borel’s original covolume.

**Depends on.** This roadmap: `R.4/regulator-lattice`, `R.4/regulator-determinant`, `R.4/target-coordinates`; pinned libraries: `mathlib:ZLattice.covolume`, `mathlib:ZLattice.covolume_eq_det`.

**Source.** [José Ignacio Burgos Gil, *The Regulators of Beilinson and Borel*](https://www.icmat.es/miembros/burgos/files/brbr.pdf), Definition 9.19 and Remark 9.20, p.84. The chosen renormalized lattice fixes the regulator covolume and its difference from the original one.

## R.5 — Dedekind zeta functions and leading terms

**Objects.** The completed zeta function Λ_F in the normalisation of the conventions, obtained from the completed Hecke L-function of AL.1 for the trivial character; Mathlib's `NumberField.dedekindZeta` is its Dirichlet series in the half-plane of convergence, and values outside that half-plane refer to the continuation. The leading coefficient of an analytic function at a zero of exact order d: the d-th derivative divided by d!.

**Theorems.** (i) ζ_F vanishes at 1−j to order exactly d_j = dim V_j(F): the Γ-factors have a pole there for each complex place, and for each real place when j is odd, while Λ_F(1−j) = Λ_F(j) is finite and nonzero. In particular ζ_F(−1) ≠ 0 for totally real F. (ii) |ζ_F^*(1−j)| ∼ |D_F|^{1/2}·π^{d_j−dj}·ζ_F(j). (iii) For odd N the fibration of Γ\G(ℝ) over the locally symmetric space with fibre the maximal compact subgroup has a degenerate spectral sequence, and its cohomology is that of the compact form in the stable range. (iv) Borel's period theorem: the rational structure on the indecomposables of H^{2j−1}(Γ) differs from that of the compact dual by |D_F|^{1/2}·π^{−dj}·ζ_F(j). (v) Borel's regulator theorem: R_Bo,j(F) ∼ |ζ_F^*(1−j)|.

**Order.** (i) and (ii) depend only on AL.1 and on the target of R.4. (iii) is used by the compact cycles of R.6, and (iv) uses the volumes and cycles of R.6. The rational number in (v) is not determined here.

**Dependencies.** The completed Hecke L-function, its functional equation and archimedean factors from AutomorphicLFunctionsAndLocalFactors AL.1; the Euler product of ζ_F from Tau Ceti; R.2–R.4 and R.6.

### Completed-zeta normalization comparison

**Declaration** `completedZeta_convention` · comparison · node `R.5/completed-zeta-conventions`.

Specialize the AL.1 completed Hecke L-function to the trivial idele-class character and compare its Re(s)>1 finite product with the pinned Dedekind L-series. Adopt Γ_R(s)=π^{−s/2}Γ(s/2), Γ_C(s)=2(2π)^{−s}Γ(s) and Λ_F(s)=|D_F|^{s/2}Γ_R(s)^{r1}Γ_C(s)^{r2}ζ_F(s). Since AL.1 uses L_C(s)=(2π)^{1−s}Γ(s)=πΓ_C(s), the adopted completion is |D_F|^{s/2}π^{−r2}Λ_AL(s,1). It satisfies Λ_F(s)=Λ_F(1−s), with only simple poles at 0 and 1. ζ_F here denotes the meromorphic continuation supplied by AL.1, which agrees with NumberField.dedekindZeta only in the convergence half-plane.

**Hypotheses.** F number field; D_F absolute discriminant in the positive power, although signed D is used in rational differential-form restriction of scalars.

**Proof.**

1. Use the Euler product of Tau Ceti (dedekindZeta_eulerProduct_hasProd) to identify the finite factors on Re(s)>1.
2. Apply the exact AL.1 archimedean factor and epsilon formulas, including the trivial-character root number one.
3. Multiply by the discriminant and π constants and use uniqueness of meromorphic continuation.

**Acceptance.** The π per complex place is explicit; it must not become a hidden rational factor.

**Depends on.** Declarations of other roadmaps: `AutomorphicLFunctionsAndLocalFactors:AL.1/completed-hecke-l-function`, `AutomorphicLFunctionsAndLocalFactors:AL.1/archimedean-local-theory`, `AutomorphicLFunctionsAndLocalFactors:AL.1/hecke-l-functional-equation`, `AutomorphicLFunctionsAndLocalFactors:AL.1/global-epsilon-factor`, `AutomorphicLFunctionsAndLocalFactors:AL.1/tate-global-functional-equation`; pinned libraries: `mathlib:NumberField.dedekindZeta`, `tauceti:TauCeti.dedekindZeta_eulerProduct_hasProd`.

**Source.** [Armand Borel, *Cohomologie de SLn et valeurs de fonctions zêta aux points entiers*](https://www.numdam.org/item/ASNSP_1977_4_4_4_613_0.pdf), §1.4 and §6.4(3)–(5), pp.616,633. The negative-integer leading term is obtained using the functional equation, with the present exact gamma convention supplied by AL.1.

### The exact negative-integer vanishing order

**Declaration** `dedekindZeta_vanishingOrder` · theorem · node `R.5/zeta-zero-order` · planet “Dedekind-zeta vanishing order”.

For F a number field and j≥2, ζ_F is holomorphic at s0=1−j and has exact vanishing order d_j=dim_R V_j(F). If j is odd, each real Γ_R factor and each complex Γ_C factor has a simple pole at s0, giving d_j=r1+r2; if j is even, only the complex factors have poles, giving d_j=r2. Λ_F(s0)=Λ_F(j) is finite and nonzero because ζ_F(j)>0. Thus no additional zero is possible. At a totally real field and j=2, ζ_F(−1) is finite and nonzero, not a pole.

**Hypotheses.** Use the continued zeta, j≥2, and the exact gamma pole/residue interfaces from AL.1.

**Proof.**

1. Use the Euler series positivity/nonvanishing at real j>1.
2. Apply the functional equation to obtain a nonzero completed value at s0.
3. Count the simple gamma poles and divide a nonzero holomorphic germ by their product.

**Acceptance.** For Q and j=2 the exact order is zero; for Q and j=3 it is one.

**Depends on.** This roadmap: `R.5/completed-zeta-conventions`, `R.4/target-dimension`; declarations of other roadmaps: `AutomorphicLFunctionsAndLocalFactors:AL.1/archimedean-local-theory`; pinned libraries: `tauceti:TauCeti.dedekindZeta_ne_zero_of_one_lt_re`.

**Source.** [Armand Borel, *Cohomologie de SLn et valeurs de fonctions zêta aux points entiers*](https://www.numdam.org/item/ASNSP_1977_4_4_4_613_0.pdf), §1.4, p.616. The source lists the vanishing orders, which follow from the functional equation.

### The nonzero zeta leading coefficient

**Declaration** `normalizedLeadingCoefficient` · definition · node `R.5/zeta-leading-coefficient` · planet “Zeta leading coefficient”.

For the holomorphic continued ζ_F at s0=1−j with d=d_j, define ζ_F*(1−j)=ζ_F^{(d)}(s0)/d!, equivalently the value g(s0) in the unique germ factorization ζ_F(s)=(s−s0)^d g(s) with g holomorphic and g(s0)≠0. It is also lim_{s→s0}ζ_F(s)/(s−s0)^d. The general definition is for an analytic function f, its complex iterated derivative and the proven exact order; specialization to ζ_F imports its continuation.

**Hypotheses.** F number field, j≥2; d is exact vanishing order, not an arbitrary exponent.

**Construction.**

1. Use Mathlib's iterated derivative at s0.
2. Apply the exact-order factorization and removable-singularity limit.
3. Use conjugation symmetry of the continued zeta to obtain a nonzero real coefficient.

**Used by.**

- BorelRegulators:R.5/borel-zeta-proportionality: Provides the nonzero leading term in the rational proportionality statement.
- Polylogarithms:P.4: Fixes what a special-value determinant compares to.

**API.**

- `normalizedLeadingCoefficient_order_zero` (simp): For d=0 the coefficient of an analytic f at s0 is f(s0).
- `normalizedLeadingCoefficient_factor` (characterisation): If f=(s−s0)^d g as analytic germs, the coefficient equals g(s0).
- `normalizedLeadingCoefficient_limit` (compatibility): For a zero of exact order d it equals the removable limit f(s)/(s−s0)^d.
- `normalizedLeadingCoefficient_ne_zero` (characterisation): For finite exact vanishing order d, the coefficient is nonzero.
- `normalizedLeadingCoefficient_smul` (functoriality): Multiplying f by a complex scalar a multiplies the coefficient by a.
- `zetaLeadingCoefficient_real` (compatibility): The specialized zeta coefficient is real and nonzero by conjugation symmetry.

**Unit tests.**

- `normalizedLeadingCoefficient_square` (computation): For f(z)=z² at s0=0 and d=2 the coefficient is 1, whereas f″(0)=2.
- `normalizedLeadingCoefficient_constant` (degenerate): For f(z)=7 and d=0 the coefficient is 7.
- `normalizedLeadingCoefficient_wrong_order` (non-example): For f(z)=z³ at 0, the coefficient with d=2 is zero, so d=2 fails the exact-order nonzero test.

**Acceptance.**

- When d=0 it equals ζ_F(s0).
- The factorial cannot be dropped in exact comparison statements.

**Depends on.** This roadmap: `R.5/zeta-zero-order`; pinned libraries: `mathlib:iteratedDeriv`.

**Source.** [Armand Borel, *Cohomologie de SLn et valeurs de fonctions zêta aux points entiers*](https://www.numdam.org/item/ASNSP_1977_4_4_4_613_0.pdf), §6.4(3) and (5), p.633. The regulator statement uses the first nonzero coefficient, not an unnormalized derivative.

### Leading-term form of the functional equation

**Declaration** `zetaLeading_functionalEquation` · theorem · node `R.5/leading-term-functional-equation`.

Write A_F(s)=Γ_R(s)^{r1}Γ_C(s)^{r2} and a_{F,j}=lim_{s→1−j}(s+j−1)^{d_j}A_F(s), a nonzero real number determined by gamma residues. Then ζ_F*(1−j)=|D_F|^{j−1/2} A_F(j)ζ_F(j)/a_{F,j}. Consequently |ζ_F*(1−j)|∼_Q |D_F|^{1/2}π^{d_j−[F:Q]j}ζ_F(j), where ∼_Q means quotient in Q×. The integer factor |D_F|^{j−1}, signs, powers of 2 and factorials are rational factors; the exact formula retains them before taking proportionality.

**Hypotheses.** j≥2; completed-zeta convention and exact zero order fixed.

**Proof.**

1. Expand the gamma factors at s0 using AL.1 residues.
2. Take the nonzero constant term of Λ_F(s)=Λ_F(1−s).
3. Evaluate gamma values at integral/half-integral j to isolate π^{d_j−[F:Q]j}.

**Acceptance.** For Q,j=2 the formula gives ζ(−1)=−1/12.

**Depends on.** This roadmap: `R.5/zeta-leading-coefficient`, `R.5/completed-zeta-conventions`; declarations of other roadmaps: `AutomorphicLFunctionsAndLocalFactors:AL.1/archimedean-local-theory`; pinned libraries: `mathlib:riemannZeta_neg_nat_eq_bernoulli`.

**Source.** [Armand Borel, *Cohomologie de SLn et valeurs de fonctions zêta aux points entiers*](https://www.numdam.org/item/ASNSP_1977_4_4_4_613_0.pdf), §6.4(4), p.633, interpreted as rational proportionality. The source suppresses rational factors; the formula here explains the discriminant exponent before suppression.

### Absolute and relative arithmetic cohomology with the compact fiber

**Declaration** `arithmeticCompactFactorComparison` · theorem · node `R.5/compact-factor-comparison`.

Let F be a number field of degree d, N odd, G_N=SL_N(F⊗ℝ), K_N its standard maximal compact subgroup (SO_N at real places, SU_N at complex places), Γ⊂SL_N(F) a torsion-free arithmetic subgroup, Y_N=Γ\G_N and X_N=Γ\G_N/K_N. Write g and k for the complexified Lie algebras of G_N and K_N, G_u for the compact form of G_N(ℂ) containing K_N, and X_u=G_u/K_N for the compact dual. Invariant forms give maps β:H^*(g;ℂ)→H^*(Y_N;ℂ) and j:H^*(g,k;ℂ)→H^*(X_N;ℂ), and the compact-form isomorphisms α:H^*(g;ℂ)≅H^*(G_u;ℂ), α_rel:H^*(g,k;ℂ)≅H^*(X_u;ℂ) are compatible with them: β∘incl=p^*∘j for the inclusion of relative into absolute cochains and the projection p:Y_N→X_N. The three spectral sequences of the fibrations with fibre K_N, namely of G_u→X_u, of g modulo k, and of Y_N→X_N, are compatible under these maps. For odd N the restriction H^*(G_u;ℂ)→H^*(K_N;ℂ) is surjective, the three spectral sequences degenerate, and H^*(G_u;ℂ) is the exterior algebra on P₁⊕P₂ with p^* mapping H^*(X_u;ℂ) isomorphically onto ΛP₁ and restriction mapping ΛP₂ isomorphically onto H^*(K_N;ℂ). In every degree q with 4q<N−1, j and β are isomorphisms. In those degrees the splitting P=P₁⊕P₂ of the primitive elements is the one used to factor determinant lines in the period theorem.

**Hypotheses.**

- N is odd: for a real place the fibre SO_N is totally non-homologous to zero in SU_N only for odd N. Nothing is asserted for even N.
- Γ is torsion-free, so that Y_N→X_N is a principal K_N-bundle of manifolds; other arithmetic subgroups are reached by finite covers.
- j is an isomorphism in degrees q with 4q<N−1 by R.3. The period theorem applies the statement in degree d(2j−1), which requires N−1>4d(2j−1).

**Proof.**

1. Define α, α_rel, β and j by invariant forms on G_u, X_u, G_N and G_N/K_N (AF.1a/invariant-forms-complex, AF.1a/relative-cohomology-functoriality) and the de Rham comparison on X_N and Y_N; on cochains the inclusion of relative into absolute cochains is pullback along the quotient map.
2. Filter the forms on the total spaces of K_N→G_u→X_u and K_N→Y_N→X_N, and the Lie algebra cochains of g modulo k; α and β respect the filtrations, so they induce morphisms of spectral sequences which on the fibre term are the compact-form isomorphism (Borel 1977, 3.5).
3. For odd N, H^*(SU_N)→H^*(SO_N) is onto (Borel 1953, Proposition 31.4), and at a complex place the diagonal SU_N in SU_N×SU_N is totally non-homologous to zero. So the spectral sequence of G_u→X_u degenerates, hence so do the other two; by Samelson's theorem H^*(G_u) is an exterior algebra on primitives which split as stated (Borel 1977, 5.2).
4. In degrees q with 4q<N−1, j is an isomorphism by arithmeticComparison_stableRange; comparing the degenerate spectral sequences shows that β is an isomorphism there too.

**Acceptance.**

- At a complex place the compact form is SU_N×SU_N with the diagonal SU_N as fibre; the base primitives are differences of the primitives of the two factors.
- For N=2 and a real place the fibre SO₂ is a circle and H¹(SU₂)=0, so restriction is not surjective: oddness of N cannot be dropped.
- The period theorem uses β on Y_N, while the rank theorem uses j on X_N; the compatibility β∘incl=p^*∘j is what relates them.

**Depends on.** This roadmap: `R.2/arithmetic-invariant-form-map`, `R.3/classical-compact-duals`, `R.3/compact-dual-cohomology`, `R.3/arithmetic-stable-range`; declarations of other roadmaps: `AutomorphicFormsOnReductiveGroups:AF.1a/invariant-forms-complex`, `AutomorphicFormsOnReductiveGroups:AF.1a/relative-cohomology-functoriality`, `ArithmeticLocallySymmetricSpaces:ALS.5/de-rham-comparison`; layers, with a request: `ArithmeticLocallySymmetricSpaces:ALS.5`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

**Source.** [Armand Borel, *Cohomologie de SLn et valeurs de fonctions zêta aux points entiers*](https://www.numdam.org/item/ASNSP_1977_4_4_4_613_0.pdf), §§3.3–3.5, pp.620–622; §§5.1–5.2, pp.625–627. Defines the four maps, proves their compatibility with the spectral sequences of the fibrations, and for odd rank proves degeneration and the splitting of the primitive elements, with the isomorphism range for the map from absolute Lie algebra cohomology.

**Source.** [Armand Borel, *Sur la cohomologie des espaces fibrés principaux et des espaces homogènes de groupes de Lie compacts*](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Borel-Sur.pdf), Proposition 31.4, p.204. For odd rank the special orthogonal group is totally non-homologous to zero in the special unitary group; for even rank it is not.

### Borel’s primitive-period determinant theorem

**Declaration** `borel_positiveZetaPeriod` · theorem · node `R.5/borel-positive-zeta-period` · planet “Borel primitive-period theorem”.

Let F have degree d, j≥2 and N odd with N−1>4d(2j−1); let Γ⊂SL_N(F) be a torsion-free arithmetic subgroup, Y_N=Γ\SL_N(F⊗ℝ) and X_N=Y_N/K_N, with the notation of arithmeticCompactFactorComparison. (1) Let L(g) be the d-th exterior power of the space of primitive elements of degree 2j−1 of H^*(g;ℂ), with the ℚ-structure given by ℚ-rational invariant forms on Res_{F/ℚ}SL_N, and L(Y_N) the d-th exterior power of the space of indecomposable elements of H^{2j−1}(Y_N;ℚ). Then β(L(g))=ζ_F(j)·L(Y_N) (Borel's Theorem 5.5 with m=j−1). (2) Let L(X_u) and L(Γ) be the d_j-th exterior powers of the spaces of indecomposable elements of degree 2j−1 of H^*(X_u;ℚ) and of H^*(Γ;ℚ). Then j_Γ(L(X_u))=R′·L(Γ) with R′=|D_F|^{1/2}·π^{−dj}·ζ_F(j) (Theorem 6.2). These are equalities of ℚ-structures on complex lines, so they determine the scalars up to ℚ^×. The power of i printed in 5.5(1) is removed by the 1980 correction. The statement concerns rational structures; integral bases of K-groups enter in borelRegulator_zetaProportional.

**Hypotheses.**

- N is odd and N−1>4d(2j−1), so that β and j_Γ are isomorphisms in the degrees used; the statement for one arithmetic subgroup implies it for all.
- The norm-one volumes and the compact cycles of R.6 are available: at the level of declarations they precede this theorem.

**Proof.**

1. By arithmeticCompactFactorComparison, β is an isomorphism in degree d(2j−1) and the primitives split into those coming from the base and those restricting isomorphically to the fibre.
2. It suffices to treat N large: restriction from SL_M to SL_N for M≥N respects the rational structures and is surjective on the classes involved.
3. Embed the norm-one group of an archimedean-split division algebra of degree j over F by its regular representation. By R.6 the resulting compact cycle carries a nonzero multiple of the product of the primitive forms of degrees 3,5,…,2j−1, and its volume is a rational multiple of ζ_F(2)⋯ζ_F(j). An induction on the degree isolates the factor ζ_F(j); this proves (1).
4. For (2), use the splitting of primitives to pass from Y_N to X_N, and Borel's comparison (1977, 5.4) between the ℚ-structure of invariant forms and that of the cohomology of the compact form, which contributes the powers of π and of the discriminant; the discriminant normalisation is restrictionScalarsForm, with the corrections of the 1980 note.

**Acceptance.**

- The proof needs the nonvanishing of the restriction of the primitive product to the compact cycle; rationality of a Haar measure alone proves nothing about regulators.
- For F totally real and j even, d_j=0, both lines in (2) are ℚ and the statement says |D_F|^{1/2}π^{−dj}ζ_F(j)∈ℚ^× (Borel's Remark 6.3); for F=ℚ and j=2 this is ζ(2)/π²=1/6.

**Depends on.** This roadmap: `R.6/compact-period-cycles`, `R.6/norm-one-volume`, `R.6/restriction-scalars-form`, `R.3/arithmetic-stable-range`, `R.3/compact-dual-cohomology`, `R.5/compact-factor-comparison`, `R.6/adelic-period-pairing`; layers, with a request: `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

**Source.** [Armand Borel, *Cohomologie de SLn et valeurs de fonctions zêta aux points entiers*](https://www.numdam.org/item/ASNSP_1977_4_4_4_613_0.pdf), Proposition 5.4 and Theorem 5.5, pp.628–630; §6.1 and Theorem 6.2, pp.631–632; Remark 6.3, p.632. States and proves the two equalities of rational lines, with the hypothesis on the rank, and notes the rationality consequence for totally real fields.

**Source.** [Armand Borel, *Errata-Corrigé: Cohomologie de SLn et valeurs de fonctions zêta aux points entiers*](https://www.numdam.org/item/ASNSP_1980_4_7_2_373_0.pdf), p.373, corrections to 5.5(1), (4) and 6.2(5). Removes the powers of i in the printed formulas and corrects the discriminant normalisation of algebraic forms.

### Borel’s regulator–zeta theorem

**Declaration** `borelRegulator_zetaProportional` · theorem · node `R.5/borel-zeta-proportionality` · planet “Borel regulator theorem”.

For a number field F and j≥2, R_Bo,j(F)∼_Q |ζ_F*(1−j)|, equivalently there exists q∈Q_{>0} with R_Bo,j(F)=q|ζ_F*(1−j)|. In Borel’s original homotopy-lattice convention R′_j∼_Q π^{−d_j}|ζ_F*(1−j)|. Burgos’s renormalization multiplies that covolume by (2π)^{d_j}, and by the additional rational factor 2^{r1} when j≡3 mod4. This removes the transcendental π discrepancy. No formula for q in terms of torsion orders or dyadic factors is asserted.

**Hypotheses.** j≥2; finite generation, full regulator lattice, analytic continuation and the primitive-period theorem are all established inputs.

**Proof.**

1. The indecomposables of degree 2j−1 of H^*(X_u;ℚ) are dual to π_{2j−1}(X_u)⊗ℚ and those of H^*(SL(O_F);ℚ) to K_{2j−1}(O_F)⊗ℚ (R.3). Borel's original regulator R′_j is defined by j_Γ(x)=R′_j·y for generators x, y of the duals of the top exterior powers of the two integral lattices; such generators are rational multiples of rational generators, so by borel_positiveZetaPeriod R′_j is a rational multiple of |D_F|^{1/2}π^{−dj}ζ_F(j) (Borel 1977, 6.4).
2. By zetaLeading_functionalEquation, |D_F|^{1/2}π^{d_j−dj}ζ_F(j) is a rational multiple of |ζ_F^*(1−j)|; hence R′_j∼π^{−d_j}|ζ_F^*(1−j)|.
3. Apply regulatorCovolume_original to pass to the renormalised covolume: the factor (2π)^{d_j}, and 2^{r₁} when j≡3 mod 4, removes π^{−d_j} up to a rational number.

**Acceptance.**

- For Q,j=2, R=1 and |ζ*(−1)|=1/12 give a rational ratio 12.
- An integral Lichtenbaum torsion identity does not follow from this theorem.

**Depends on.** This roadmap: `R.5/borel-positive-zeta-period`, `R.5/leading-term-functional-equation`, `R.4/regulator-covolume`.

**Source.** [Armand Borel, *Cohomologie de SLn et valeurs de fonctions zêta aux points entiers*](https://www.numdam.org/item/ASNSP_1977_4_4_4_613_0.pdf), §6.4(1)–(5), pp.632–633. Passes from the rational primitive determinant to the homotopy-normalized regulator and leading term.

**Source.** [José Ignacio Burgos Gil, *The Regulators of Beilinson and Borel*](https://www.icmat.es/miembros/burgos/files/brbr.pdf), Theorem 9.12 and Remark 9.20, pp.80,84. Fixes the original π discrepancy and its exact renormalization.

## R.6 — Bloch's Tamagawa reformulation

**Objects.** For each e ≥ 2 a central division algebra D of degree e over F that splits at every archimedean place, and its norm-one group H = SL_1(D), an anisotropic inner form of SL_e. The restriction-of-scalars normalisation Rη = δ_F^{−q}·∧_σ ση of an invariant q-form, and the positive measure |D_F|^{−h/2}∏_v |ω|_v attached to a top form. The compact manifold Z_D = Γ_D\H(F⊗ℝ), its fundamental class, its map to SL_N(O_F)\SL_N(F⊗ℝ) through the regular representation of D, and the pairing of invariant forms with it.

**Theorems.** Existence of D: a cyclic extension L/F of degree e, two primes inert in L, and the Brauer class with invariants 1/e and −1/e at them; its index is e because L splits it and its period is e. The Tamagawa number of H is 1 (Weil). The local volume of H(O_v) at a good place is ∏_{a=2}^{e}(1 − q_v^{−a}). Hence the volume of H(F⊗ℝ)/Γ is a rational multiple of ζ_F(2)⋯ζ_F(e), by strong approximation. The primitive classes of SL_N restrict to Z_D as e times those of SL_e, so their product has a nonzero period on Z_D. These are the inputs of Borel's period theorem in R.5.

**Measure conversions.** The integral of a rational top form η over Z_D and the Tamagawa volume are related by an explicit scalar c_η with μ^Tam_∞ = c_η|η|; replacing η by 2η doubles the integral and halves c_η. Algebraic forms carry δ_F and measures carry |D_F|^{1/2}; for ℚ(i) these are −2i and 2.

**Bloch's formulation.** Bloch's first four lectures state Borel's theorem through Tamagawa measures and a pairing of primitive classes. The last declaration of the layer identifies that pairing with the one above, with its conversion scalar, and then applies the regulator theorem of R.5.

**Dependencies.** Tamagawa measures, Weil's volume formula, the count for SL_n, compactness and strong approximation from AdelicAlgebraicGroups AA.2–AA.4; the index of a Brauer class from SemisimpleAlgebrasPartII; local invariants and the Brauer sequence from Tau Ceti ClassFieldTheory Layers 5 and 10 and inert primes from Tau Ceti Chebotarev Layer 10; the compact-fibre comparison of R.5. Request: the groups of a central simple algebra (AA.1).

### Archimedean-split division inner forms

**Declaration** `exists_archimedeanSplitDivision` · theorem · node `R.6/archimedean-split-division` · planet “Archimedean-split division algebra”.

For every number field F and integer e≥2 there is a central division F-algebra D of degree e (dimension e² over F) with D⊗_F F_v≅M_e(F_v) at every archimedean place v. Construction: choose a cyclic extension L/F of degree e and two distinct finite places v₁, v₂ of F that are unramified and inert in L. Let α∈Br(F) be the class with local invariants 1/e at v₁, −1/e at v₂ and 0 at all other places. Then α has period e and index e, and D is the division algebra in the class α.

**Hypotheses.**

- The two places are chosen after the cyclic field, so no existence theorem for extensions with prescribed behaviour at given places is needed.
- The index of a Brauer class and its relation to periods and splitting fields are those of SemisimpleAlgebrasPartII SA.0 and SA.1.

**Proof.**

1. Import exists_auxiliaryPrime and the full cyclotomic-degree theorem from Tau Ceti Chebotarev Layer 7, applied with base F, trivial extension F/F and level e. They give p≡1 mod e, p unramified in F and Irreducible(cyclotomic p F). Nat.exists_prime_gt_modEq_one supplies the congruence ingredient only; irreducibility supplies the hypothesis for IsCyclotomicExtension.autEquivPow, yielding Gal(F(ζ_p)/F)≅(ℤ/p)^× of order p−1. This group is cyclic, so the fixed field of its subgroup of index e is a cyclic extension L/F of degree e.
2. By Chebotarev's density theorem (Tau Ceti Chebotarev Layer 10) infinitely many primes of F are unramified in L with Frobenius a generator of Gal(L/F); these are inert. Choose two of them.
3. The global Brauer sequence (Tau Ceti ClassFieldTheory Layer 10) gives a unique α with the stated invariants, whose sum is zero. Its order is e: e·α has all invariants zero, and the invariant at v₁ has order e.
4. Restriction to L multiplies the invariant at a place w above v by [L_w:F_v] (ClassFieldTheory Layer 5). At v₁ and v₂ the local degree is e, so every invariant of α_L vanishes and L splits α.
5. Hence the index of α divides e (SA.0/index-divides-splitting-degree) and is divisible by its period e (SA.1/period-divides-index); so the division algebra in α has degree e (SA.0/class-index). Its archimedean invariants are zero, so it splits at the archimedean places.

**Acceptance.**

- For e=2 this is a quaternion algebra ramified at exactly two finite places and split at every real place.
- For F=ℚ, e=2 and L=ℚ(i): the primes 3 and 7 are inert, and the quaternion algebra over ℚ ramified exactly at 3 and 7 is a division algebra split at infinity.
- A quaternion algebra ramified at a real place does not satisfy the conclusion.

**Depends on.** Declarations of other roadmaps: `SemisimpleAlgebrasPartII:SA.0/class-index`, `SemisimpleAlgebrasPartII:SA.0/index-divides-splitting-degree`, `SemisimpleAlgebrasPartII:SA.1/period-divides-index`; Layers, with a request: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`, `tauceti:TauCetiRoadmap/Chebotarev#layer-7-the-auxiliary-prime-and-the-crossing-data`; Pinned libraries: `mathlib:Nat.exists_prime_gt_modEq_one`, `mathlib:IsCyclotomicExtension.autEquivPow`.

**Source.** [Armand Borel, *Cohomologie de SLn et valeurs de fonctions zêta aux points entiers*](https://www.numdam.org/item/ASNSP_1977_4_4_4_613_0.pdf), §2.1 and Lemma 2.2 with its proof, pp.617–618. States the existence of a central division algebra of degree n over k which is trivial at infinity, and proves it from the description of the Brauer group by local invariants, a cyclic splitting field of degree n with full local degree at the ramified places, and the comparison of period and index. The source fixes n places first and quotes a theorem for the cyclic field.

### Tamagawa number of division norm-one groups

**Declaration** `normOne_tamagawaNumber` · theorem · node `R.6/norm-one-tamagawa` · planet “Norm-one Tamagawa number”.

For a central division algebra D of degree e≥2 over a number field F, the group H=SL_1(D) of elements of reduced norm one is a simply connected inner form of SL_e, anisotropic over F, and its Tamagawa number is τ(H)=1 (Weil). The period theorem uses only that τ(H) is a nonzero rational number. This computation is specific to H: AdelicAlgebraicGroups AA.2 defines Tamagawa measures and numbers and AA.3 proves compactness of the quotient, but neither computes τ(H).

**Hypotheses.** τ is the Tamagawa number of AA.2/tamagawa-number for the measure of AA.2/tamagawa-measure, which includes the factor |D_F|^{−dim H/2}; H has no nontrivial characters, so no convergence factors occur.

**Proof.**

1. H(F)\H(𝔸_F) is compact (AA.3/arithmetic-quotient-compact), so τ(H) is finite and positive.
2. τ(H)=1 is Theorem 3.3.1 of Weil's Adeles and algebraic groups, quoted by Borel in the proof of Proposition 2.4; Weil's chapter treats the zeta function of a central division algebra. The proof is not decomposed in this plan.
3. Rationality of τ(H) is the only consequence used downstream.

**Acceptance.** Changing one local measure without the compensating product normalization changes τ and invalidates τ=1.

**Depends on.** Declarations of other roadmaps: `AdelicAlgebraicGroups:AA.2/tamagawa-number`, `AdelicAlgebraicGroups:AA.2/tamagawa-measure`, `AdelicAlgebraicGroups:AA.3/arithmetic-quotient-compact`; layers, with a request: `AdelicAlgebraicGroups:AA.1`.

**Source.** [Armand Borel, *Cohomologie de SLn et valeurs de fonctions zêta aux points entiers*](https://www.numdam.org/item/ASNSP_1977_4_4_4_613_0.pdf), Proof of Proposition 2.4, p.619, citing Weil, Theorem 3.3.1. Uses that the Tamagawa number of the norm-one group is one, and remarks that its rationality would suffice.

### Good finite-place special-linear volumes

**Declaration** `specialLinear_localVolume` · theorem · node `R.6/local-sl-volume` · planet “Special-linear local volume”.

At a good finite place v where H is split with integral model SL_e and residue field of cardinality q_v, the algebraic differential-form measure normalized as in AA.2 gives μ_v(SL_e(O_v))=q_v^{−(e²−1)}#SL_e(F_{q_v})=∏_{a=2}^e(1−q_v^{−a}). At the finitely many exceptional places, compact-open volume with respect to an F-rational invariant form is a positive rational number. The finite product of exceptional volume ratios is therefore in Q_{>0}.

**Hypotheses.** q_v is a finite-field cardinality, e≥2; integral form is a generator at good places.

**Proof.**

1. Outside a finite set of finite places, an integral model of H is isomorphic over O_v to SL_e, carrying H(O_v) onto SL_e(O_v), and ω is a generator of the invariant top forms of the model up to a unit (Borel 1977, 2.3). Apply AA.2/weil-volume-formula and the count #SL_e(k_v)·q_v^{−(e²−1)}=∏_{a=2}^e(1−q_v^{−a}) of AA.2/tamagawa-convergence-gln.
2. At each remaining place, a small open subgroup is covered by finitely many disjoint images of polydiscs in analytic charts on which |ω|_v is a constant power of q_v times the standard measure (AA.2/local-form-measure); so its volume is rational, and every compact open subgroup is commensurable with it (AA.2/compact-open-volume).

**Acceptance.**

- For e=2,q=2 the volume is 3/4.
- The product begins at a=2, so no divergent ζ_F(1) factor appears.

**Depends on.** Declarations of other roadmaps: `AdelicAlgebraicGroups:AA.1/integral-model`, `AdelicAlgebraicGroups:AA.2/weil-volume-formula`, `AdelicAlgebraicGroups:AA.2/tamagawa-convergence-gln`, `AdelicAlgebraicGroups:AA.2/local-form-measure`, `AdelicAlgebraicGroups:AA.2/compact-open-volume`; layers, with a request: `AdelicAlgebraicGroups:AA.1`.

**Source.** [Armand Borel, *Cohomologie de SLn et valeurs de fonctions zêta aux points entiers*](https://www.numdam.org/item/ASNSP_1977_4_4_4_613_0.pdf), §2.3 and proof of Proposition 2.4, pp.618–619. Away from finitely many places the group is isomorphic to SL_n compatibly with integral points; the local volume is the number of points of SL_n over the residue field divided by the appropriate power of its cardinality, and the remaining local volumes are rational.

### Archimedean volume as a product of zeta values

**Declaration** `normOne_archimedeanVolume` · theorem · node `R.6/norm-one-volume` · planet “Norm-one quotient volume”.

For an archimedean-split division algebra D of degree e≥2, H=SL_1(D), a nonzero F-rational invariant top form ω and any arithmetic Γ⊂H(F), μ_∞(H(F⊗R)/Γ)∼_Q∏_{a=2}^e ζ_F(a), with μ_∞ the discriminant-normalized positive archimedean measure from ω. H(A_F)/H(F) is compact. Taking Γ_U=H(F)∩(H_∞U), AA.4 strong approximation gives H(A_F)=H(F)H_∞U and τ(H)=μ_∞(H_∞/Γ_U)vol_f(U). Commensurable arithmetic groups change this volume by a positive rational index.

**Hypotheses.** H is anisotropic over F, simply connected and archimedean-split; H_∞ is noncompact, satisfying the strong approximation hypothesis outside the infinite places.

**Proof.**

1. H(F)\H(𝔸_F) is compact (AA.3/arithmetic-quotient-compact). H is simply connected, absolutely almost simple and H(F⊗ℝ)=∏SL_e(F_v) is noncompact, so strong approximation gives H(𝔸_F)=H(F)·H_∞·U for every compact open U (AA.4/strong-approximation-theorem).
2. For Γ_U=H(F)∩H_∞U the quotient decomposes with a single class: τ(H)=μ_∞(H_∞/Γ_U)·vol_f(U) (AA.4/quotient-volume-decomposition, with the Tamagawa measure of AA.2/tamagawa-measure).
3. Insert τ(H)∈ℚ^× and the local volumes: vol_f(U) is a rational multiple of ∏_v∏_{a=2}^e(1−q_v^{−a})=∏_{a=2}^e ζ_F(a)^{−1}, by the Euler product in the region of convergence.
4. Two arithmetic subgroups are commensurable, and volumes scale by the index (AA.4/level-volume-index).

**Acceptance.**

- For e=2 only ζ_F(2) occurs.
- The proof does not use R.5 regulator proportionality, avoiding a circular Tamagawa reformulation.

**Depends on.** This roadmap: `R.6/archimedean-split-division`, `R.6/norm-one-tamagawa`, `R.6/local-sl-volume`; declarations of other roadmaps: `AdelicAlgebraicGroups:AA.2/tamagawa-measure`, `AdelicAlgebraicGroups:AA.3/arithmetic-quotient-compact`, `AdelicAlgebraicGroups:AA.4/strong-approximation-theorem`, `AdelicAlgebraicGroups:AA.4/quotient-volume-decomposition`, `AdelicAlgebraicGroups:AA.4/level-volume-index`; pinned libraries: `tauceti:TauCeti.dedekindZeta_eulerProduct_hasProd`.

**Source.** [Armand Borel, *Cohomologie de SLn et valeurs de fonctions zêta aux points entiers*](https://www.numdam.org/item/ASNSP_1977_4_4_4_613_0.pdf), Proposition 2.4 and proof, pp.618–619. The archimedean quotient volume is the specialized zeta product, not a generic reduction-theory conclusion.

### Restriction-of-scalars form and discriminant normalization

**Declaration** `restrictionScalarsForm` · construction · node `R.6/restriction-scalars-form` · planet “Discriminant form normalization”.

Choose an ordered integral basis α_1,…,α_d and ordered complex embeddings σ_1,…,σ_d. Put δ_F=det(σ_i(α_a)), so δ_F²=D_F is the signed discriminant and (−1)^{r2}D_F>0. For an F-rational invariant q-form η define Rη=δ_F^{−q}∧_{σ∈Σ_F}ση on the restriction-of-scalars complex group. For a top form of F-dimension h, the associated positive archimedean Haar measure instead uses |D_F|^{−h/2}∏_{v|∞}|ω_v|. These signed algebraic and positive measure conventions are distinct and are related with their conjugate-pair orientation factors.

**Hypotheses.** δ_F≠0; embedding order and integral-basis orientation are recorded. Use the 1980 correction to the algebraic form.

**Construction.**

1. The embedding matrix of an integral basis has determinant δ_F with δ_F²=D_F, the signed discriminant (NumberField.basisMatrix, discr_eq_basisMatrix_det_sq), and the sign of D_F is (−1)^{r₂} (sign_discr).
2. Transport η to each conjugate group, take the exterior product over the embeddings and divide by δ_F^q; the result is defined over ℚ on the restriction of scalars.
3. For a top form the associated positive measure on the archimedean points is |D_F|^{−h/2}∏_{v|∞}|ω|_v, the archimedean part of the Tamagawa measure (AA.2/tamagawa-measure); its compatibility with restriction of scalars is AA.2/gauge-form-restriction-discriminant and AA.2/tamagawa-restriction-scalars.

**Used by.**

- Borel 1977, §§5.4–6.2: Tracks rational structures and archimedean phases in primitive determinant periods.
- BorelRegulators:R.6/norm-one-volume: Relates differential forms to positive quotient volume.

**API.**

- `restrictionScalarsForm_factor` (projection): The algebraic normalization scalar is δ_F^{−q}.
- `restrictionScalarsForm_embedding_order` (relation): Permuting embeddings changes both δ_F^{−q} and the wedge by the same permutation-sign power, so Rη is unchanged.
- `restrictionScalarsForm_integral_basis` (compatibility): An integral basis change of determinant ±1 changes the algebraic normalization by (±1)^q; the rational line and positive Haar measure are unchanged.
- `restrictionScalarsForm_positive_measure` (compatibility): The positive top-form measure has scalar |D_F|^{−h/2}, agreeing with the AA.2 Tamagawa convention.
- `restrictionScalarsForm_scalar` (functoriality): For a∈F×, R(aη)=Norm_{F/Q}(a)Rη.
- `restrictionScalarsForm_erratum` (compatibility): In Borel 5.5(1),(4) and 6.2(5) the corrected identities remove the printed i^{r2}; this does not remove every orientation phase elsewhere.

**Unit tests.**

- `restrictionScalarsForm_Q` (degenerate): For F=Q with integral basis (1), δ=1 and Rη=η.
- `restrictionScalarsForm_Qi` (computation): For F=Q(i), basis (1,i) and embeddings (id,conj), δ=−2i and D=−4; at q=1 the scalar is i/2.
- `restrictionScalarsForm_absolute_wrong` (non-example): In that Q(i) case the scalar 1/2 from |D|½ gives a different algebraic form and fails δ²=D.

**Acceptance.** At an imaginary quadratic field δ is imaginary whereas |D|½ is positive; replacing one by the other loses an orientation phase.

**Depends on.** Declarations of other roadmaps: `AdelicAlgebraicGroups:AA.1/base-change-adelic`, `AdelicAlgebraicGroups:AA.2/invariant-top-form`, `AdelicAlgebraicGroups:AA.2/gauge-form-restriction-discriminant`, `AdelicAlgebraicGroups:AA.2/tamagawa-restriction-scalars`, `AdelicAlgebraicGroups:AA.2/tamagawa-measure`; pinned libraries: `mathlib:ExteriorAlgebra`, `mathlib:NumberField.basisMatrix`, `mathlib:NumberField.discr_eq_basisMatrix_det_sq`, `mathlib:NumberField.sign_discr`.

**Source.** [Armand Borel, *Cohomologie de SLn et valeurs de fonctions zêta aux points entiers*](https://www.numdam.org/item/ASNSP_1977_4_4_4_613_0.pdf), §§1.5–1.6, pp.616–617. Defines restriction-of-scalars forms and the positive Haar convention.

**Source.** [Armand Borel, *Errata-Corrigé: Cohomologie de SLn et valeurs de fonctions zêta aux points entiers*](https://www.numdam.org/item/ASNSP_1980_4_7_2_373_0.pdf), p.373, first paragraph and definition of D½. Replaces the absolute discriminant by the signed embedding determinant in algebraic form normalization.

### Compact arithmetic period cycles

**Declaration** `compactPeriodCycle` · construction · node `R.6/compact-period-cycles`.

For an archimedean-split central division F-algebra D of degree e, choose a neat arithmetic Γ_D⊂SL_1(D)(F). The quotient Z_D=Γ_D\SL_1(D)(F⊗R) is a compact oriented manifold of real dimension [F:Q](e²−1). The left regular F-representation on D gives SL_1(D)→SL_{e²}; after a lattice choice and finite-index passage it maps Γ_D into SL_N(O_F) for every sufficiently large N. Its compact fundamental cycle defines a period functional on the ambient arithmetic cohomology. Pullback of each algebraic SL_N primitive generator of weight 2≤j≤e is e times the corresponding standard SL_e generator under the archimedean splitting, and the relevant top exterior pairing is nonzero.

**Hypotheses.** N≥e² and N is large enough for the comparison in the degrees of the primitive classes; a neat arithmetic subgroup exists by AA.4/neat-level-exists.

**Construction.**

1. Take D from exists_archimedeanSplitDivision. The quotient of H_∞=SL_1(D)(F⊗ℝ)≅∏_v SL_e(F_v) by an arithmetic subgroup is compact (AA.3/arithmetic-quotient-compact); choose Γ_D neat (AA.4/neat-level-exists), so that Z_D is a compact manifold, oriented by an invariant top form.
2. Left multiplication of D on itself is an F-representation of dimension e² with trivial determinant on SL_1(D); a Γ_D-stable lattice and a finite-index subgroup give Γ_D→SL_{e²}(O_F), and block inclusion gives SL_N for N≥e².
3. Over ℂ the regular representation is e copies of the standard representation of SL_e, and the primitive classes are additive for direct sums; so each primitive generator of degree 2j−1, 2≤j≤e, restricts to e times the generator of SL_e, and the product of all of them restricts to a nonzero multiple of the invariant top form.
4. By arithmeticCompactFactorComparison the primitive classes are classes on the full quotient Γ\G, not only on the symmetric-space quotient; pairing with the fundamental class of Z_D is integration (Tau Ceti AlgebraicTopology stage 6).

**Used by.**

- BorelRegulators:R.5/borel-positive-zeta-period: Provides the compact cycles and nonvanishing restriction needed for wedge induction.
- BorelRegulators:R.6/adelic-period-pairing: Connects top cohomological periods to finite-volume integrals.

**API.**

- `compactPeriodCycle_fundamental` (data): Z_D has its integral fundamental class in top degree with the selected orientation.
- `compactPeriodCycle_map` (projection): The cycle map comes from the left regular representation followed by block inclusion.
- `compactPeriodCycle_primitive` (compatibility): For 2≤j≤e, pullback of the normalized algebraic primitive generator is e times the split standard generator.
- `compactPeriodCycle_integral` (characterisation): Pairing the normalized top invariant form with the cycle equals its finite quotient-volume integral.
- `compactPeriodCycle_cover` (functoriality): Passing to a subgroup of index a multiplies the pushed-forward fundamental class and top-form integral by a.
- `compactPeriodCycle_orientation` (relation): Reversing orientation negates the signed period and preserves the positive volume.

**Unit tests.**

- `compactPeriodCycle_degree_two` (computation): For e=2, left regular representation has F-dimension 4 and the weight-two primitive pullback factor is 2.
- `compactPeriodCycle_finite_cover` (computation): An index-two neat subgroup doubles the top period.
- `compactPeriodCycle_split_algebra_wrong` (non-example): Replacing division D by M_e(F) gives an isotropic group and does not supply the compact quotient used here.

**Acceptance.** A compact quotient without a nonzero primitive restriction would not prove the period theorem.

**Depends on.** This roadmap: `R.6/archimedean-split-division`, `R.6/norm-one-volume`, `R.3/compact-dual-cohomology`, `R.5/compact-factor-comparison`; declarations of other roadmaps: `AdelicAlgebraicGroups:AA.3/arithmetic-quotient-compact`, `AdelicAlgebraicGroups:AA.4/neat-level-exists`; layers, with a request: `AdelicAlgebraicGroups:AA.1`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

**Source.** [Armand Borel, *Cohomologie de SLn et valeurs de fonctions zêta aux points entiers*](https://www.numdam.org/item/ASNSP_1977_4_4_4_613_0.pdf), Theorem 5.5 and proof, pp.628–630. The compact inner-form cycles and primitive restrictions supply the nonzero periods used in the induction.

### Adelic primitive period pairing

**Declaration** `adelicPeriodPairing` · construction · node `R.6/adelic-period-pairing`.

For the compact oriented cycle Z_D and compact-open U with Γ_D=H(F)∩H_∞U, define I_D(η,U)=∫_{Z_D}η for every real-valued rational invariant top form η, including zero. For nonzero η let c_η>0 be the explicitly computed conversion scalar satisfying μ_∞^Tam=c_η|η| in the fixed AA.2 normalization. Then μ_∞^Tam(Z_D)=c_η|I_D(η,U)| and c_η|I_D(η,U)|vol_f(U)=τ(H). The scalar is obtained from the differential-form and restriction-of-scalars conventions, rather than assumed equal to one. For primitive wedge forms this integral equals the singular/de Rham pairing with [Z_D]. This is the specialized period interface needed in Bloch’s Tamagawa formulation.

**Hypotheses.** The quotient is compact and oriented. The integration map is defined for zero; c_η and the volume formula require η≠0. All local measures and the selected rational Tamagawa form are fixed compatibly.

**Construction.**

1. Integration of top forms over the compact oriented manifold Z_D and its identification with the pairing of de Rham classes with the fundamental class (Tau Ceti AlgebraicTopology stage 6; compatibility with the comparison of ALS.5/de-rham-comparison is requested from ALS.5).
2. For η≠0 the measure |η| on H_∞ is the archimedean measure of AA.2/local-form-measure, and μ_∞^{Tam}=c_η|η| defines c_η by restrictionScalarsForm and AA.2/tamagawa-measure; it satisfies c_{aη}=c_η/|a| for a∈ℚ^×.
3. Insert normOne_archimedeanVolume and the decomposition of the adelic quotient.

**Used by.**

- BorelRegulators:R.5/borel-positive-zeta-period: Turns the periods of the compact cycles into products of zeta values.
- Bloch, Higher regulators, algebraic K-theory, and zeta functions of elliptic curves, Lectures 1–4: Bloch's formulation of Borel's theorem through Tamagawa measures is compared with this pairing in bloch_borelPairingComparison.

**API.**

- `adelicPeriodPairing_linear` (structure): I_D is linear in the top form for a fixed orientation and quotient.
- `adelicPeriodPairing_cohomology` (compatibility): For a closed top form, I_D equals the de Rham/singular pairing with the fundamental class.
- `adelicPeriodPairing_volume` (characterisation): For η≠0, μ_∞^Tam(Z_D)=c_η|I_D(η,U)| and c_η|I_D(η,U)|vol_f(U)=τ(H), with c_η defined by μ_∞^Tam=c_η|η|.
- `adelicPeriodPairing_local_rescale` (relation): Rescaling local measures by a_v, all but finitely many one, rescales the total measure by ∏a_v; the archimedean/finite product equation changes accordingly.
- `adelicPeriodPairing_cover` (functoriality): Finite cover of degree a multiplies the integral by a.
- `adelicPeriodPairing_form_rescale` (relation): With measures fixed and a∈Q×, I_D(aη,U)=aI_D(η,U) and c_{aη}=c_η/|a|. Thus the converted quotient volume is unchanged.

**Unit tests.**

- `adelicPeriodPairing_zero_form` (degenerate): The integral of the zero top form is zero.
- `adelicPeriodPairing_sign` (computation): Replacing η by −η negates I_D but leaves its absolute volume unchanged.
- `adelicPeriodPairing_rescale` (characterisation): Doubling one finite local measure doubles the finite product; the normalization equation cannot stay unchanged without its compensating global conversion.
- `adelicPeriodPairing_double_form` (computation): With all Tamagawa measures fixed, replacing nonzero η by 2η doubles I_D and halves c_η; the unconverted equation |I_D|vol_f(U)=τ(H) cannot hold for both forms.

**Acceptance.** Rational proportionality allows exceptional-place and commensurability factors; it does not allow losing a π or a discriminant square-root factor.

**Depends on.** This roadmap: `R.6/compact-period-cycles`, `R.6/restriction-scalars-form`, `R.6/norm-one-volume`; declarations of other roadmaps: `AdelicAlgebraicGroups:AA.2/tamagawa-measure`, `AdelicAlgebraicGroups:AA.2/invariant-top-form`, `AdelicAlgebraicGroups:AA.2/local-form-measure`, `ArithmeticLocallySymmetricSpaces:ALS.5/de-rham-comparison`; layers, with a request: `ArithmeticLocallySymmetricSpaces:ALS.5`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

**Source.** [Armand Borel, *Cohomologie de SLn et valeurs de fonctions zêta aux points entiers*](https://www.numdam.org/item/ASNSP_1977_4_4_4_613_0.pdf), §§1.5–1.6, pp.616–617; Proposition 2.4, pp.618–619; proof of Theorem 5.5, pp.628–630. The integral of an invariant form over the compact quotient is the link between the primitive periods and the product of local volumes.

### Bloch–Borel Tamagawa comparison

**Declaration** `bloch_borelPairingComparison` · comparison · node `R.6/bloch-borel-interface`.

Bloch's first four lectures express Borel's theorem through a pairing of primitive cohomology classes with compact cycles and through Tamagawa measures. The comparison identifies that pairing and its local measures with adelicPeriodPairing: an equality of pairings, together with the explicit scalar converting Bloch's measures into the normalisations of restrictionScalarsForm and of AA.2. Combined with borelRegulator_zetaProportional it gives Bloch's form of the regulator theorem. It is a comparison of two normalisations of one pairing, and does not take Borel's theorem as an axiom.

**Hypotheses.** The Borel side is fixed by the nodes of R.5 and R.6. The Bloch side is specified by Lectures 1–4 of Bloch's notes; its definitions and locators are not recorded in this plan (see the gap on Bloch's pairing convention).

**Proof.**

1. Record Bloch's primitive pairing and local forms with their locators.
2. Match the Borel side with adelicPeriodPairing and restrictionScalarsForm, computing the conversion scalar as in adelicPeriodPairing_volume.
3. Compose with borelRegulator_zetaProportional.

**Acceptance.**

- The comparison is complete only with locators for Bloch's definitions and a table of the measure conversions.
- Doubling the form on the Borel side must be compensated on the Bloch side exactly as in adelicPeriodPairing_form_rescale.

**Depends on.** This roadmap: `R.6/adelic-period-pairing`, `R.6/restriction-scalars-form`, `R.5/borel-zeta-proportionality`.

**Source.** [Armand Borel, *Cohomologie de SLn et valeurs de fonctions zêta aux points entiers*](https://www.numdam.org/item/ASNSP_1977_4_4_4_613_0.pdf), §2.4, pp.618–619; Theorem 5.5, pp.628–630; §6.4, pp.632–633. Gives the Borel side of the comparison: the volume formula, the period theorem and the regulators.

## R.7 — Beilinson comparison and tests

**Objects.** The universal Beilinson class Be_j ∈ H^{2j−1}_cont(GL_N(ℂ); ℝ(j−1)), defined from the Deligne regulator of MotivicEtaleKTheory M.8 with the Chern character normalised as for Bo_j, and the Beilinson regulator r_Be : K_{2j−1}(F) → H_D¹(F⊗ℝ, ℝ(j)) ≅ V_j(F). Matrices of pullback and trace in the coordinates of R.4.

**Theorems.** The map from relative to absolute Lie algebra cohomology for (gl_N(ℂ), u_N) is injective. The Beilinson class has absolute representative π_{j−1}∘Φ_{2j−1}, computed through the first infinitesimal neighbourhood of the diagonal of the simplicial classifying scheme. Since the Borel class has absolute representative 2·π_{j−1}∘Φ_{2j−1}, Bo_j = 2·Be_j for every j ≥ 2. Hence r_Bo = 2·r_Be, det(r_Bo) = 2^{d_j}·det(r_Be) and R_Bo,j = 2^{d_j}·R_Be,j.

**Tests.** Over ℚ and even j the target is zero and the covolume is 1, while ζ(1−j) ≠ 0. For an imaginary quadratic field and j = 2 the target is one-dimensional with coordinates (a, −a), and the regulator image is a lattice of rank one. For F = ℚ(√−3) and ζ₆ = (1+√−3)/2, the element 2[ζ₆] lies in Suslin's Bloch group and [ζ₆] in its rationalisation, because 1−ζ₆ = ζ₆^{−1} and ζ₆⊗ζ₆ is 2-torsion in the antisymmetric quotient of F^×⊗F^×. The weight-two comparison with the Bloch–Wigner function is a test of normalisation, not the proof of the factor two; its exact rational scalar is an open point.

**Dependencies.** The Deligne regulator and its number-field normalisation from MotivicEtaleKTheory M.8 (nodes that do not depend on this roadmap); van Est from AF.1a; the Chern character from RefinedTraceMethods RT.4:topological; the Bloch–Wigner function and Suslin's map from Polylogarithms P.1–P.2 and K3BlochGroups V.3–V.4; R.4 and R.5. Requests: the explicit Chern–Weil and van Est maps (AF.1a) and the dual of the pair (GL_N(ℂ), U_N) (Tau Ceti LieGroups Layer 7).

### Injectivity for the complex general-linear relative class

**Declaration** `complexGL_relativeToAbsolute_injective` · theorem · node `R.7/relative-absolute-injectivity`.

For GL_N(ℂ) as a real Lie group with maximal compact subgroup U_N, the map from relative to absolute Lie algebra cohomology H^*(gl_N(ℂ),u_N;ℝ(j−1))→H^*(gl_N(ℂ);ℝ(j−1)) is injective. Under compact duality it is the pullback H^*(U_N)→H^*(U_N×U_N) along the quotient map (M,M′)↦M^{−1}M′, which sends a primitive generator x to 1⊗x−x⊗1; restriction to the second factor is a left inverse on the exterior algebra generated by the primitives. Hence an equality of the images of Bo_j and Be_j in absolute cohomology implies their equality in relative cohomology.

**Hypotheses.** Use the GL_N(C) symmetric pair; no injectivity assertion is made for arbitrary relative Lie pairs.

**Proof.**

1. Use a diagonal compact-dual coordinate for the pair (GL_N(ℂ),U_N): the compact inclusion is U_N→U_N×U_N, u↦(u,u). Burgos’s conjugate-diagonal coordinate u↦(ū,u) is converted to this one by complex conjugation on the first factor. This coordinate change transports the comparison map; it does not change the fixed Borel/Beilinson normalisations. Functorial compact duality is requested from Tau Ceti LieGroups Layer 7 and supplied on cochains by AF.1a/relative-cohomology-functoriality.
2. For the left diagonal quotient, q(M,M′)=M⁻¹M′ identifies U_N\(U_N×U_N) with U_N. Its section s(u)=(1,u) satisfies q∘s=id, hence s*∘q*=id on all cohomology. On primitive generators q*x=1⊗x−x⊗1.
3. The transported relative-to-absolute map is q*, so it is injective. Equality of the absolute images determines equality in relative cohomology, with no unspecified transpose sign.

**Acceptance.** Equality of absolute representatives is used only with this injectivity input.

**Depends on.** This roadmap: `R.3/compact-dual-cohomology`; Declarations of other roadmaps: `AutomorphicFormsOnReductiveGroups:AF.1a/relative-lie-cochain-complex`, `AutomorphicFormsOnReductiveGroups:AF.1a/relative-cohomology-functoriality`; Layers, with a request: `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-7-complexification-and-real-forms`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`.

**Source.** [José Ignacio Burgos Gil, *The Regulators of Beilinson and Borel*](https://www.icmat.es/miembros/burgos/files/brbr.pdf), Definition 9.24, final paragraph, pp.86–87. The proof of the regulator comparison requires injectivity, not just equality after a potentially noninjective map.

### The infinitesimal Beilinson representative

**Declaration** `beilinson_absoluteRepresentative` · theorem · node `R.7/beilinson-infinitesimal-representative` · planet “Beilinson infinitesimal comparison”.

For j≥2 and N stable, the universal Beilinson class Be_j determined by the M.8 higher Deligne Chern character has absolute Lie representative π_{j−1}Φ_{2j−1}, with π_q(z)=(z+(−1)^q z̄)/2. This uses the first infinitesimal diagonal of the simplicial classifying scheme, its differential-form normalization into the Weil algebra, the inverse Chern–Weil construction, and the explicit van Est identification. The normalized M.8 class is the higher Chern character, not the unscaled Chern class.

**Hypotheses.**

- The Beilinson class Be_j is the universal class of M.8/number-field-deligne-normalization, built from the Deligne regulator of M.8/deligne-regulator; that node does not depend on the comparison with Borel's regulator.
- The description of the Chern–Weil homomorphism and of the van Est isomorphism through the first infinitesimal neighbourhood of the diagonal of the simplicial classifying scheme (Burgos §§8.2–8.3) is requested from AutomorphicFormsOnReductiveGroups AF.1a.

**Proof.**

1. Restrict the universal Deligne–Beilinson class to the first infinitesimal neighbourhood of the diagonal of the simplicial scheme B.GL_N (Burgos Lemma 10.10).
2. Use the explicit description of the Chern–Weil morphism into the Weil algebra and of the van Est isomorphism (Burgos Theorems 8.12 and 8.15) to compute the image in absolute Lie algebra cohomology.
3. The result is π_{j−1}Φ_{2j−1} (Burgos Proposition 10.11); the normalisation ch_j=(2πi)^j pr_j/j! is the one of M.8/number-field-deligne-normalization and of RT.4:topological/chern-character.

**Acceptance.** At j=2 the representative is π1Φ3, half the Borel absolute representative.

**Depends on.** This roadmap: `R.4/trace-cocycle`; declarations of other roadmaps: `MotivicEtaleKTheory:M.8/number-field-deligne-normalization`, `MotivicEtaleKTheory:M.8/deligne-regulator`, `AutomorphicFormsOnReductiveGroups:AF.1a/van-est-isomorphism`, `RefinedTraceMethods:RT.4:topological/chern-character`; layers, with a request: `AutomorphicFormsOnReductiveGroups:AF.1a`.

**Source.** [José Ignacio Burgos Gil, *The Regulators of Beilinson and Borel*](https://www.icmat.es/miembros/burgos/files/brbr.pdf), Theorems 8.12,8.15, pp.70–71,73; Lemma 10.10 and Proposition 10.11, p.97. The all-weight Beilinson representative is obtained from the infinitesimal diagonal, not extrapolated from a dilogarithm.

### Universal Borel–Beilinson comparison

**Declaration** `borelClass_eq_two_beilinsonClass` · theorem · node `R.7/universal-factor-two` · planet “Borel–Beilinson comparison theorem”.

For every j≥2 and N in the fixed classical stable range, Bo_j=2Be_j in H_cont^{2j−1}(GL_N(C),R(j−1)), with Burgos Definitions 9.24 and 10.8 and ch_j=(2πi)^j pr_j/j!. The equality is compatible with stabilization. Its proof compares the two explicit absolute Lie classes and then uses the proved relative-to-absolute injectivity and van Est; weight two is a test and is not the proof for other j.

**Hypotheses.** The selected Tate generators, suspension sign and Chern-character normalization are identical on both sides.

**Proof.**

1. Use R.4 absolute Borel representative 2π_{j−1}Φ and R.7 Beilinson representative π_{j−1}Φ.
2. Apply the relative-to-absolute injectivity theorem.
3. Transport by AF.1a inverse van Est and apply stabilization naturality.

**Acceptance.** At j=3 the same scalar 2 holds; no guessed weight-dependent scalar is introduced.

**Depends on.** This roadmap: `R.7/relative-absolute-injectivity`, `R.7/beilinson-infinitesimal-representative`, `R.4/trace-cocycle`, `R.4/universal-borel-class`; declarations of other roadmaps: `AutomorphicFormsOnReductiveGroups:AF.1a/van-est-isomorphism`.

**Source.** [José Ignacio Burgos Gil, *The Regulators of Beilinson and Borel*](https://www.icmat.es/miembros/burgos/files/brbr.pdf), Theorem 10.9 and proof, pp.95–97. This fixes the exact scalar for every weight under the adopted primary convention.

### Arithmetic regulator and covolume comparison

**Declaration** `borelRegulator_eq_two_beilinsonRegulator` · theorem · node `R.7/regulator-factor-two` · planet “Regulator covolume comparison”.

Let r_Be be the Beilinson regulator K_{2j−1}(F)→H_D¹(F⊗ℝ,ℝ(j))≅V_j(F), the Deligne regulator of MotivicEtaleKTheory M.8 with the identification of M.8/number-field-deligne-normalization, in the same Tate coordinate as r_Bo. For j≥2, r_Bo=2·r_Be on K_{2j−1}(F), and on K_{2j−1}(O_F) after composing with O_F⊂F. On determinant lines of rank d_j, det(r_Bo)=2^{d_j}det(r_Be), and R_Bo,j=2^{d_j}R_Be,j for the same reference measure. Hence both covolumes are rational multiples of |ζ_F^*(1−j)|.

**Hypotheses.** The Deligne-field identification is the quotient C/R(j)≅R(j−1), and retains simultaneous conjugation invariants.

**Proof.**

1. Pull back the equality Bo_j=2Be_j along every complex embedding and pair with Hurewicz images; both regulators are defined by pairing with these universal classes.
2. The identification of the Deligne cohomology of F⊗ℝ with V_j(F) is the quotient ℂ/ℝ(j)≅ℝ(j−1) at each embedding, with simultaneous conjugation invariants (M.8/number-field-deligne-normalization). Compatibility with O_F⊂F is rational localisation (ArithmeticKTheory:N.3:ranks/borel-rank-theorem).
3. Apply regulatorMatrix_scalar and regulatorCovolume_scalar to the lattice of rank d_j.

**Acceptance.** For d_j=1 the covolume factor is 2; for d_j=2 it is 4; for d_j=0 it is 1.

**Depends on.** This roadmap: `R.7/universal-factor-two`, `R.4/borel-regulator`, `R.4/regulator-determinant`, `R.4/regulator-covolume`; declarations of other roadmaps: `MotivicEtaleKTheory:M.8/number-field-deligne-normalization`, `ArithmeticKTheory:N.3:ranks/borel-rank-theorem`.

**Source.** [José Ignacio Burgos Gil, *The Regulators of Beilinson and Borel*](https://www.icmat.es/miembros/burgos/files/brbr.pdf), Theorem 10.9, pp.95–97, with Definitions 9.19 and 10.8, pp.84,94. The universal comparison yields the map equality, and the determinant power follows by multilinearity.

### Exact Bloch–Wigner normalization test

**Declaration** `borelRegulator_blochWigner_exact` · comparison · node `R.7/weight-two-bloch-wigner`.

At j=2, compare r_Bo with the Bloch–Wigner homomorphism of Polylogarithms P.2 composed with Suslin’s map K₃(F)→B(F), and with its measurable cocycle D(r(g₀x,g₁x,g₂x,g₃x)), where r(∞,0,1,z)=z. There is a nonzero real scalar λ_BW, independent of F and the complex place, such that the coordinate of r_Bo(x) in targetCoordinates is λ_BW·D(Suslin(x)). This scalar comes from comparison of universal weight-two classes. Its exact value, sign and rational and π factors require matching Goncharov’s equations (61), (64), Theorems 5.7 and 5.11 and Corollary 5.10 with Φ₃, the real Tate projection and division by 2πi. No rationality of λ_BW in these coordinates is asserted. P.2 supplies the Bloch–Wigner homomorphism and cocycle; it does not supply this Borel comparison.

**Hypotheses.** The factor two between the Borel and Beilinson classes is fixed in every weight by borelClass_eq_two_beilinsonClass and does not depend on λ_BW.

**Proof.**

1. Take the measurable Bloch–Wigner cocycle and its descent from P.2, and Suslin’s natural map from K3BlochGroups V.4. Goncharov’s introduction (11) and Theorem 5.11 identify its universal Grassmannian class in weight two.
2. Goncharov’s equations (61), (64), Theorem 5.7 and Corollary 5.10 identify a nonzero multiple of the trace class; the continuous/measurable cohomology comparison is explicitly requested from AF.1a. The nonzero weight-two universal classes therefore differ by a nonzero real scalar. Restriction along each embedding and Suslin functoriality give the same scalar for every number field and place.
3. Determine the exact scalar by transporting the real coefficient line, the cross-ratio/Suslin orientation and the division by 2πi in targetCoordinates. Rational proportionality in a source’s coefficient convention does not imply rational proportionality after this conversion. The exact calculation remains the recorded normalisation gap.

**Acceptance.**

- The Pauli test Φ3=−2i detects a trace normalization error, but does not by itself identify the Suslin/Bloch–Wigner scalar.
- Only real proportionality is claimed before the exact coefficient conversion; P.2 is not cited as a theorem of rational Borel proportionality.

**Depends on.** This roadmap: `R.4/trace-cocycle`, `R.4/borel-regulator`, `R.4/target-coordinates`, `R.7/universal-factor-two`; Declarations of other roadmaps: `Polylogarithms:P.2/weight-two-regulator`, `Polylogarithms:P.2/bloch-wigner-cocycle`, `K3BlochGroups:V.4/suslin-exact-sequence`, `K3BlochGroups:V.4/suslin-functoriality`; Layers, with a request: `AutomorphicFormsOnReductiveGroups:AF.1a`.

**Source.** [Alexander B. Goncharov, *Polylogarithms, regulators, and Arakelov motivic complexes*](https://arxiv.org/pdf/math/0207036), Introduction, equation (11), p.7; §§5.4–5.7, equations (61),(64), Theorem 5.7 and proof, pp.43–47; Corollary 5.10 and Theorem 5.11, p.49. Compares the Grassmannian/dilogarithm class with the trace class, including its nonzero Dynkin coefficient. Converting those coefficient conventions to Burgos’s class and the normalized Tate coordinates is the additional comparison planned here.

### Zero-rank and imaginary-quadratic regulator tests

**Declaration** `borelRegulator_smallFields` · application · node `R.7/number-field-small-cases`.

For Q and every even j≥2, V_j(Q)=0, the rational odd K-group is zero and its arithmetic regulator covolume is 1. For an imaginary quadratic F and j=2, V_2(F) is one-dimensional with components (a,−a); the arithmetic regulator image is a full rank-one lattice and changes sign when the selected embedding is conjugated. For F=Q(√−3), put ζ_6=(1+√−3)/2. With Suslin’s antisymmetric tensor quotient, ∂[ζ_6]=−ζ_6⊗ζ_6 can be nonzero 2-torsion; consequently 2[ζ_6] is an integral Bloch element and [ζ_6] is a rational Bloch element. This follows from 1−ζ_6=ζ_6^{-1} and 2(ζ_6⊗ζ_6)=0. The Bloch–Wigner values D(ζ_6) and 2D(ζ_6) are positive at the upper-half-plane embedding. The exact numerical conversion to the adopted Borel coordinate uses the unresolved λ_BW test, while rank one and nonzero image follow independently from the real regulator isomorphism.

**Hypotheses.** j≥2; ζ_6 is tested in the rationalized Suslin/Bloch comparison, with the stated boundary convention.

**Proof.**

1. Use the pinned signature counts, R.3 rank theorem and R.4 target coordinates.
2. Apply the full-lattice theorem for the imaginary-quadratic field.
3. Use the V.3 antisymmetric tensor relation to show ∂(2[ζ_6])=0, then rationalize if using [ζ_6]. Apply P.1 positivity and P.2 descent; keep the exact Borel coefficient linked to the weight-two normalization gap.

**Acceptance.**

- At Q,j=2 the zeta value is nonzero although the rational K3 rank is zero.
- At an imaginary quadratic field switching embedding changes orientation but preserves absolute determinant.
- The integral test is 2[ζ_6]; replacing the antisymmetric tensor quotient by an exterior square would incorrectly kill every diagonal tensor. The rationalized test may use [ζ_6].

**Depends on.** This roadmap: `R.3/borel-rank-theorem`, `R.4/target-coordinates`, `R.4/regulator-lattice`, `R.4/regulator-covolume`, `R.7/weight-two-bloch-wigner`; declarations of other roadmaps: `Polylogarithms:P.1/bloch-wigner-positivity`, `Polylogarithms:P.2/bloch-wigner-descent`, `K3BlochGroups:V.4/suslin-exact-sequence`, `K3BlochGroups:V.3/antisymmetric-tensor-quotient`, `K3BlochGroups:V.3/bloch-boundary`, `K3BlochGroups:V.3/bloch-group`.

**Source.** [Armand Borel, *Stable real cohomology of arithmetic groups*](https://www.numdam.org/item/ASENS_1974_4_7_2_235_0.pdf), Proposition 12.2, p.271. Primary rank theorem supplies the zero-rank and imaginary-quadratic cases; the symbol boundary and positivity are explicit applications of V.3 and P.1–P.2.

**Source.** [Charles A. Weibel, *The K-book, Chapter IV: Definitions of Higher K-Theory*](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.IV.pdf), Theorems 1.17–1.18 and Regulator Maps 1.18.1, pp.12–13, author chapter PDF; corrected as E2. The signature discussion is here, not in Chapter VI §4. Rationalize both sides of the displayed comparison in Theorem 1.18.

### Matrices of extension and trace

**Declaration** `embeddingMatrices` · construction · node `R.7/extension-matrix` · planet “Regulator extension matrices”.

For f:F→E finite and selected coordinates c_F,c_E, define P_f=c_E∘pull_f∘c_F⁻¹ and T_f=c_F∘Tr_f∘c_E⁻¹ as real linear maps between coordinate spaces and take their matrices in the standard bases. Entries sum the signed contributions of all complex embedding extensions, including conjugate representatives. Then T_f P_f=[E:F]I, coordinate matrices equal the coordinate-free maps, and they compose with extension/trace. For equal-dimensional target spaces their determinant relation is det(T_f)det(P_f)=[E:F]^{d_j}; for unequal dimensions this is a rectangular matrix relation, with no square determinant asserted.

**Hypotheses.** F,E number fields, j≥2, f finite; both coordinate selections are explicit.

**Construction.**

1. Use the proven coordinate equivalences and pull/trace formulas.
2. Apply LinearMap.toMatrix on the standard function-space bases.
3. Transport identity, composition and trace-pull relation through the equivalences and matrix multiplication.

**Used by.**

- BorelRegulators:R.7: Tests extension/restriction determinants against the coordinate-free maps.
- PeriodsAndSpecialValues: Supplies matrices with proved parity and conversion, rather than arbitrary arrays.

**API.**

- `embeddingMatrices_pull_apply` (projection): The pull matrix acts on c_F(x) as c_E(pull_f x).
- `embeddingMatrices_trace_apply` (projection): The trace matrix acts on c_E(y) as c_F(Tr_f y).
- `embeddingMatrices_id` (functoriality): Identity extension gives identity matrices.
- `embeddingMatrices_comp` (functoriality): For F→E→L, P_comp=P_EL P_FE and T_comp=T_FE T_EL.
- `embeddingMatrices_trace_pull` (relation): T_f P_f=[E:F]I with the appropriate source index.
- `embeddingMatrices_representatives` (compatibility): A source/target representative change conjugates the maps by the corresponding diagonal sign matrices.
- `embeddingMatrices_regulator` (compatibility): The coordinate regulator matrices satisfy the pullback/transfer commuting squares, including exact Borel–Beilinson scaling.

**Unit tests.**

- `embeddingMatrices_quadratic_odd` (computation): For Q→Q(i),j=3, the one-by-one pull/trace matrices are (1) and (2).
- `embeddingMatrices_Q_weight_two` (degenerate): For Q→Q(i),j=2, the pull matrix has one row and zero columns, and the trace matrix has zero rows and one column.
- `embeddingMatrices_switch_pair` (characterisation): Switching the selected Q(i) embedding at j=2 negates its coordinate maps, preserving the coordinate-free square.

**Acceptance.** For Q⊂Q(i),j=3, P=(1), T=(2) and TP=(2).

**Depends on.** This roadmap: `R.4/embedding-pull-trace`, `R.4/target-coordinates`, `R.4/regulator-transfer`, `R.7/regulator-factor-two`; pinned libraries: `mathlib:LinearMap.toMatrix`.

**Source.** [José Ignacio Burgos Gil, *The Regulators of Beilinson and Borel*](https://www.icmat.es/miembros/burgos/files/brbr.pdf), Propositions 9.21–9.22 and Theorem 10.9. This computational interface is derived from the embeddingwise target and the already normalized map comparison.

## Pinned libraries

Mathlib is pinned at `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti at `f790474821cf4256814db967cb154e7af3d0c369`. Each declaration below was read at its pin; the list says what it provides and, where relevant, what it does not.

- `mathlib:CSA` (structure, `Mathlib/Algebra/BrauerGroup/Defs.lean`): Finite-dimensional central simple algebras over a field, with Algebra.IsCentral, IsSimpleRing and FiniteDimensional instances. Division-algebra orders and reduced norms are additional arithmetic inputs.
- `mathlib:ExteriorAlgebra` (abbrev, `Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean`): Exterior algebra of an R-module, the Clifford algebra for the zero quadratic form; it is not a graded cohomology comparison theorem.
- `mathlib:TopRep.homogeneousCochains` (abbrev, `Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean`): The homogeneous continuous cochain complex of a topological representation, as a cochain complex in TopModuleCat.
- `mathlib:continuousCohomology` (abbrev, `Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean`): Degree-n homology of TopRep.homogeneousCochains; continuous group cohomology with topological coefficients.
- `mathlib:ContinuousCohomology.cochainsMap` (def, `Mathlib/RepresentationTheory/Homological/ContCohomology/Functoriality.lean`): Restriction along a continuous homomorphism H→G and compatible continuous coefficient map res X→Y, by precomposition of cochains.
- `mathlib:ContinuousCohomology.cochainsMap_comp` (lemma, `Mathlib/RepresentationTheory/Homological/ContCohomology/Functoriality.lean`): The cochain map of composed continuous group and coefficient morphisms equals the composite of cochain maps, with the explicit restriction functor on coefficients.
- `mathlib:NumberField.ComplexEmbedding.involutive_conjugate` (theorem, `Mathlib/NumberTheory/NumberField/InfinitePlace/Embeddings.lean`): Complex conjugation is an involution on ring embeddings of a number field into C.
- `mathlib:NumberField.InfinitePlace.mk_eq_iff` (theorem, `Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean`): Two complex embeddings have the same infinite place iff they are equal or complex conjugate.
- `mathlib:NumberField.InfinitePlace.nrRealPlaces` (abbrev, `Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean`): r1 is the finite cardinality of the subtype of real infinite places.
- `mathlib:NumberField.InfinitePlace.nrComplexPlaces` (abbrev, `Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean`): r2 is the finite cardinality of the subtype of complex infinite places, counting pairs once.
- `mathlib:NumberField.InfinitePlace.card_add_two_mul_card_eq_rank` (theorem, `Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean`): For a number field F, r1+2r2=finrank Q F.
- `mathlib:IsZLattice` (class, `Mathlib/Algebra/Module/ZLattice/Basic.lean`): For a discrete Z-submodule L of a normed K-vector space, its K-linear span is the full space. The discreteness instance is a separate hypothesis.
- `mathlib:ZLattice.covolume` (def, `Mathlib/Algebra/Module/ZLattice/Covolume.lean`): Real covolume of a Z-submodule with respect to a specified additive Haar measure; defined as addCovolume.toReal.
- `mathlib:ZLattice.covolume_eq_det` (theorem, `Mathlib/Algebra/Module/ZLattice/Covolume.lean`): For a discrete full Z-lattice L⊂(ι→R), a finite integral basis b gives covolume L=|det(Matrix.of(inclusion∘b))| under coordinate volume.
- `mathlib:Matrix.trace_mul_comm` (theorem, `Mathlib/LinearAlgebra/Matrix/Trace.lean`): trace(AB)=trace(BA) for rectangular matrices over a commutative coefficient magma with additive commutative monoid structure.
- `mathlib:Matrix.trace_conjTranspose` (theorem, `Mathlib/LinearAlgebra/Matrix/Trace.lean`): trace(A conjugate-transpose)=star(trace A) for finite square matrices over a star additive monoid.
- `mathlib:NumberField.dedekindZeta` (def, `Mathlib/NumberTheory/NumberField/DedekindZeta.lean`): The Dedekind L-series of the sequence counting nonzero ideals by absolute norm. This definition alone does not provide continuation at negative integers.
- `tauceti:TauCeti.dedekindZeta_eulerProduct_hasProd` (theorem, `TauCeti/NumberTheory/ArithmeticDirichletSeries/EulerProduct/Analytic.lean`): For Re(s)>1, the height-one-prime Euler product converges to NumberField.dedekindZeta F s.
- `tauceti:TauCeti.dedekindZeta_ne_zero_of_one_lt_re` (theorem, `TauCeti/NumberTheory/ArithmeticDirichletSeries/EulerProduct/Analytic.lean`): For Re(s)>1 the Dedekind zeta L-series is nonzero, using the convergent Euler product; no statement outside that half-plane.
- `tauceti:TauCeti.ContCohomology.explicitH2IsoGroupCohomology` (def, `TauCeti/RepresentationTheory/Homological/ContCohomology/GroupCohomologyIso.lean`): For a discrete group and a topological additive coefficient group with continuous action, an additive equivalence from the explicit continuous H2 quotient to Mathlib discrete group cohomology. This supplies degree two, not an all-degree relative-Lie comparison.
- `mathlib:AlgHom.card` (theorem, `Mathlib/FieldTheory/PrimitiveElement.lean`): For a finite separable extension E/F and an algebraically closed F-algebra C, card(E→ₐ[F]C)=finrank F E. Giving C its F-algebra structure through a fixed embedding identifies this AlgHom set with the fiber of complex embeddings extending it.
- `mathlib:NumberField.basisMatrix` (abbrev, `Mathlib/NumberTheory/NumberField/EquivReindex.lean`): The matrix of the chosen integral basis under all complex embeddings, indexed through Mathlib's equivalence between embeddings and the index set of the basis. Another ordered integral basis changes it by a unimodular matrix.
- `mathlib:NumberField.discr_eq_basisMatrix_det_sq` (theorem, `Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean`): The signed number-field discriminant, coerced to C, equals det(basisMatrix F)^2; the matrix uses the chosen integral basis and embedding indexing.
- `mathlib:NumberField.sign_discr` (theorem, `Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean`): The sign of the integer discriminant is (−1)^nrComplexPlaces F.
- `mathlib:LinearMap.toMatrix` (def, `Mathlib/LinearAlgebra/Matrix/ToLin.lean`): For bases of two modules over a commutative semiring, the linear equivalence between linear maps and matrices indexed by the bases. It is used for the matrices of the regulator and of pullback and trace once coordinates are chosen.
- `mathlib:riemannZeta_neg_nat_eq_bernoulli` (theorem, `Mathlib/NumberTheory/LSeries/HurwitzZetaValues.lean`): For k a natural number, the continued Riemann zeta at −k equals (−1)^k bernoulli(k+1)/(k+1). In particular ζ(−1)=−1/12.
- `mathlib:iteratedDeriv` (def, `Mathlib/Analysis/Calculus/IteratedDeriv/Defs.lean`): The n-th iterated derivative of a function between normed spaces over a nontrivially normed field, evaluated by iteratedFDeriv on the constant tuple 1; permits the native Taylor-coefficient prototype over C.
- `tauceti:TauCeti.AbstractSimplicialComplex.orderComplex` (def, `TauCeti/AlgebraicTopology/SimplicialComplex/OrderComplex.lean`): The order complex of a preordered type: an abstract simplicial complex on the type whose faces are the nonempty finite chains.
- `tauceti:TauCeti.AbstractSimplicialComplex.mem_orderComplex_iff` (theorem, `TauCeti/AlgebraicTopology/SimplicialComplex/OrderComplex.lean`): A finite set is a face of the order complex iff it is nonempty and a chain for ≤.
- `tauceti:TauCeti.AbstractSimplicialComplex.pair_mem_orderComplex_iff` (theorem, `TauCeti/AlgebraicTopology/SimplicialComplex/OrderComplex.lean`): Two elements span a face of the order complex iff they are comparable; for equal elements this is the singleton face.
- `tauceti:TauCeti.AbstractSimplicialComplex.orderComplexMap` (def, `TauCeti/AlgebraicTopology/SimplicialComplex/OrderComplex.lean`): A monotone map induces a simplicial map of order complexes; the file proves the identity and composition laws orderComplexMap_id and orderComplexMap_comp.
- `tauceti:AbstractSimplicialComplex.Realization` (abbrev, `TauCeti/AlgebraicTopology/SimplicialComplex/Realization.lean`): The polyhedron of an abstract simplicial complex inside the finitely supported real functions on its vertices, as a type; no homology is attached to it at the pin.
- `mathlib:AbstractSimplicialComplex` (structure, `Mathlib/AlgebraicTopology/SimplicialComplex/Basic.lean`): Abstract simplicial complexes on a vertex type: a set of nonempty finite sets closed under nonempty subsets and containing all singletons.
- `mathlib:groupHomology` (def, `Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean`): Group homology of a k-linear representation of a group, as the homology of its inhomogeneous chains, valued in k-modules. It is the carrier for the homology of an arithmetic group with Steinberg coefficients once the Steinberg module is a representation.
- `mathlib:Nat.exists_prime_gt_modEq_one` (theorem, `Mathlib/NumberTheory/PrimesCongruentOne.lean`): For k≠0 and any n there is a prime p>n with p≡1 mod k.
- `mathlib:IsCyclotomicExtension.autEquivPow` (def, `Mathlib/NumberTheory/Cyclotomic/Gal.lean`): For a cyclotomic extension L/K of level n with irreducible cyclotomic polynomial over K, the Galois group is isomorphic to the units of ZMod n.
- `mathlib:ContinuousCohomology.map` (abbrev, `Mathlib/RepresentationTheory/Homological/ContCohomology/Functoriality.lean`): For a continuous homomorphism H→G and a morphism of topological H-representations from the restriction of X to Y, the induced map from the continuous cohomology of X to that of Y in each degree; the file proves map_id and map_comp. It does not compare the continuous cohomology of a discrete group with Mathlib's group cohomology.

## Requests to other roadmaps

A request names a layer of another roadmap, the exact statement needed from it and the declarations here that use it. Where a declaration of another roadmap already states what is needed, it is cited directly in “Depends on” above.

### `AdelicAlgebraicGroups:AA.1`

For a central simple algebra over a number field: the affine F-groups GL_D(V) and SL_n(D) with the reduced norm, and their restrictions of scalars to ℚ; arithmeticity of SL_n(O) and of Aut_O(P) for an order O and a projective lattice P; rank_ℚ Res_{F/ℚ}SL_n(D)=n−1, with minimal parabolic subgroups the stabilisers of full flags of D-subspaces; the archimedean factors SL_{ne}(ℝ), SL_{ne/2}(ℍ), SL_{ne}(ℂ). For H=SL_1(D): that it is a simply connected, absolutely almost simple inner form of SL_e, anisotropic when D is a division algebra; an integral model isomorphic to SL_e over O_v outside a finite set of places; the regular representation H→SL_{e²} with a stable lattice. AA.1's nodes treat adelic points of a general affine group; these statements about central simple algebras extend it. Use projective right O-modules P, V=P⊗_O D and right-D-linear automorphisms, represented in Mathlib by left modules over Dᵐᵒᵖ; identify these with the standard matrix convention.

Used by `R.1/order-arithmetic-system`, `R.6/norm-one-tamagawa`, `R.6/local-sl-volume`, `R.6/compact-period-cycles`.

### `ArithmeticLocallySymmetricSpaces:ALS.2`

For a connected reductive ℚ-group G, in particular Res_{F/ℚ}GL_D(V): the boundary of the bordification of ALS.2/borel-serre-bordification is equivariantly homotopy equivalent to the building of rational parabolic subgroups of G, which for GL_D(V) is the order complex of proper nonzero D-subspaces of V; and the orientation character of the action of G(ℚ) on the bordification (for GL_n over a number field, the (n−1)-st power of the sign of the norm of the determinant). This is the input of Borel–Serre duality with the Steinberg module; the present nodes of ALS.2 construct the bordification, its compact quotient, its triangulation and its stratification. For reductive G remove A_G(ℝ)°, where A_G is the maximal ℚ-split central torus, before forming the symmetric space and its bordification; export its dimension. In the split GL_n case over F it is r₁n(n+1)/2+r₂n²−1.

Used by `R.1/steinberg-duality-finiteness`.

### `ArithmeticLocallySymmetricSpaces:ALS.5`

For ALS.5/de-rham-comparison with trivial real or complex coefficients, none of which needs automorphic input: (i) the statement for a classical quotient X/Γ′ with Γ′ a neat arithmetic subgroup, as a union of components of an adelic quotient; (ii) naturality for a morphism of groups G→G′ carrying Γ′ into Γ″, with compatible maximal compact subgroups; (iii) compatibility with wedge and cup products; (iv) the analogous comparison on Γ′\G(ℝ) with absolute Lie algebra cohomology and its compatibility with the bundle Γ′\G(ℝ)→X/Γ′; (v) compatibility with integration of top forms against the fundamental class of a compact oriented quotient. In (i) use G(ℝ)° for Γ′ contained in the identity component, and export finite-component descent to Γ with source H^*(g,K_Γ) for G_Γ=G(ℝ)°Γ. Full G(ℝ) must not impose components absent from Γ.

Used by `R.2/arithmetic-invariant-form-map`, `R.2/block-comparison-naturality`, `R.5/compact-factor-comparison`, `R.6/adelic-period-pairing`.

### `AutomorphicFormsOnReductiveGroups:AF.1a`

(i) For a discrete group, the comparison in every degree between the cohomology of Mathlib's homogeneous continuous cochains and Mathlib's group cohomology, natural in the group and in the coefficients; the pinned Tau Ceti statement covers degree two. (ii) The analysis on Γ\G and X/Γ used by Matsushima, Garland and Borel: Stokes' formula on a complete Riemannian manifold for integrable forms with integrable differential, the vanishing of an exact square-integrable harmonic form, the expression of the Laplacian on forms through the Casimir operator, regularisation by convolution with K-invariant test functions, and fine resolutions by sheaves of forms on a compact manifold with corners (Borel 1974, §§1–3 and 7.4). (iii) The description of the Chern–Weil homomorphism and of the van Est isomorphism through the first infinitesimal neighbourhood of the diagonal of a simplicial classifying scheme (Burgos §§8.2–8.3, Theorems 8.12 and 8.15). Items (ii) and (iii) extend AF.1a beyond its present nodes. (iv) For a real Lie group with trivial real coefficients, the natural continuous-to-measurable group-cohomology comparison used for the Bloch–Wigner cocycle, with compatibility with restriction to the discrete subgroup and with the trace-class comparison of Goncharov §5. This generic comparison is not asserted by the present AF.1a nodes.

Used by `R.2/arithmetic-restriction`, `R.3/matsushima-garland-criterion`, `R.3/logarithmic-growth-complex`, `R.7/beilinson-infinitesimal-representative`, `R.7/weight-two-bloch-wigner`.

### `RefinedTraceMethods:RT.4:topological`

The suspension H^{2j}(BU;ℚ)→H^{2j−1}(U;ℚ), with integral Bott/Hurewicz normalisation: the Bott homotopy generator maps to ±(j−1)! times an integral primitive homology generator. Suspended ch_j=(2πi)^j s(pr_j)/j! evaluates as ±(2πi)^j/(j−1)! on that homology generator, hence as one signed Tate unit ±(2πi)^j on the Bott homotopy generator. Fix signs by compatible Bott orientation, also for ℝ(j) coefficients (Burgos Theorem 4.24 and Remark 4.25, p.32). The Chern character, Chern classes, Bott periodicity and Adams operations are existing RT.4:topological nodes cited directly.

Used by `R.4/universal-borel-class`.

### `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology`

Reduced homology of an abstract simplicial complex through its augmented chain complex, including degree −1 for the empty complex, functorial for simplicial maps, and its agreement with the reduced singular homology of the realization; the pairing between homology and cohomology, and the Hurewicz homomorphism.

Used by `R.1/steinberg-module`, `R.1/solomon-tits`, `R.4/borel-regulator`.

### `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`

The homotopy type of a complex obtained from a contractible subcomplex by attaching cones over subcomplexes (a wedge of suspensions), and the homotopy invariance needed for the inductive proof of the Solomon–Tits theorem.

Used by `R.1/solomon-tits`.

### `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`

The Serre spectral sequence for the fibrations of compact Lie groups and homogeneous spaces used for the compact duals, with transgression; fibres totally non-homologous to zero and the resulting degeneration; the Lyndon–Hochschild–Serre spectral sequence in homology for a group extension, with coefficients.

Used by `R.1/steinberg-duality-finiteness`, `R.3/compact-dual-cohomology`, `R.3/compact-dual-degree-stability`, `R.3/gl-sl-primitive-comparison`, `R.5/compact-factor-comparison`, `R.5/borel-positive-zeta-period`, `R.7/relative-absolute-injectivity`.

### `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`

Cup products and the Künneth theorem; the Hopf algebra structure on the homology and cohomology of an H-space, with primitive and indecomposable elements; fundamental classes of compact oriented manifolds, integration of de Rham classes against them, and degrees of finite covers.

Used by `R.2/stable-hopf-compatibility`, `R.3/compact-dual-cohomology`, `R.3/stable-arithmetic-exterior`, `R.3/cartan-serre-application`, `R.5/compact-factor-comparison`, `R.5/borel-positive-zeta-period`, `R.6/compact-period-cycles`, `R.6/adelic-period-pairing`.

### `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-7-complexification-and-real-forms`

Compact real forms and complexifications are used as they stand. In addition: the dual of a symmetric pair, g_u=k⊕i·p with the compact homogeneous space K°\G_u, its functoriality for compatible morphisms, and its identification for SL_n(ℝ), SL_n(ℍ), SL_n(ℂ) and GL_n(ℂ). A compact real form alone does not determine this quotient.

Used by `R.3/classical-compact-duals`, `R.7/relative-absolute-injectivity`.

### `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-9-the-cartan-iwasawa-and-kak-decompositions`

Cartan decompositions, maximal compact subgroups and their conjugacy for the classical real, complex and quaternionic groups; compatible choices along block inclusions; the invariant metric and curvature of the symmetric space.

Used by `R.1/order-arithmetic-system`, `R.2/block-comparison-naturality`, `R.3/classical-compact-duals`, `R.3/matsushima-garland-criterion`.

### `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`

Local invariants of Brauer classes at finite places of a number field, and the rule that restriction to a finite extension multiplies the invariant by the local degree. Archimedean terms are imported from ClassFieldTheory Layer 10.

Used by `R.6/archimedean-split-division`.

### `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`

Exactness of the global Brauer sequence with the sum of local invariants: existence and uniqueness of a class with prescribed local invariants of sum zero, and injectivity of localisation, also over the cyclic extension used as splitting field. Include the archimedean Brauer terms: Br(ℂ)=0 and the real invariant in {0,1/2}, so zero invariants imply splitting at all infinite places.

Used by `R.6/archimedean-split-division`.

### `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`

For a finite Galois extension of number fields and a conjugacy class of its Galois group, infinitely many primes of the base field are unramified with Frobenius in that class; applied to a cyclic extension and a generator of its group, which gives infinitely many inert primes.

Used by `R.6/archimedean-split-division`.

### `ReductiveGroupsPartII:RG2.1`

For a connected semisimple group over a field of characteristic zero: the relative root system with multiplicities and the character ρ_P of a minimal parabolic; the relative root system of a restriction of scalars along a finite extension, with multiplicities multiplied by the degree; and the behaviour of minimal parabolic subgroups under extension of the base field.

Used by `R.3/stable-range-constants`.

### `StableHomotopyKTheory:H.3`

For a connected CW H-space X with unit, lift its multiplication to its universal cover X̃ so that X̃ is an H-space, and prove that each deck transformation is homotopic to the identity. Export triviality of the π₁(X)-action on H_*(X̃;ℝ), compatibly with lifted H-space maps. Apply with X=BGL(O)⁺ and X̃=BE(O)⁺; combine with the equivariant plus-integral-homology map. The existing plus-universal-cover node identifies the cover but does not state this H-space or deck-action result.

Used by `R.3/gl-sl-primitive-comparison`.

### `tauceti:TauCetiRoadmap/Chebotarev#layer-7-the-auxiliary-prime-and-the-crossing-data`

Use Layer 7.1 exists_auxiliaryPrime with base F, trivial Galois extension F/F and level e≥2: obtain a rational prime p≡1 mod e unramified in F and cyclotomic p irreducible over F. Layer 7.2 gives [F(ζ_p):F]=p−1 and the full cyclic cyclotomic Galois group, permitting its degree-e fixed subfield. The pinned prime-congruence and cyclotomic-automorphism declarations need these extra hypotheses.

Used by `R.6/archimedean-split-division`.

## Open points

All seven layers are planned: every target has a declaration whose prerequisites end in the pinned libraries, in a declaration or requested layer of another roadmap, or in one of the points below.

### Suggested signatures that the pinned libraries cannot state

At the pinned commits there are no higher K-groups of rings, no plus construction, no relative Lie algebra cohomology, no arithmetic groups of orders with reduced norms, no compact duals, no Tamagawa measures and no Deligne cohomology. For the declarations that need them, the suggested file gives the statement, API and tests as a register of mathematical signatures in a comment, under the packet's names; it introduces no placeholder carriers. Twelve declarations have elaborated prototypes: the building, restriction in continuous cohomology (Mathlib's map), the regulator target with its coordinates, dimension and maps, the trace cocycle, regulator matrices and covolumes, leading coefficients, the existence statement for the division algebra, and extension matrices; numerical components of three more (the strict integer part of the stable range, the point count of SL_e, the discriminant scalar) are elaborated as well. Each remaining signature becomes Lean when its supplier exports the carrier.

Concerns 44 declarations: all except those with elaborated prototypes in the suggested file.

### Borel–Serre duality with the Steinberg module

No node of the atlas states that the boundary of the Borel–Serre bordification is homotopy equivalent to the building of rational parabolic subgroups, nor the resulting duality between cohomology and homology with Steinberg coefficients, nor the orientation character. ALS.2 builds the bordification and ALS.5:finite-level-duality gives Poincaré–Lefschetz duality with perfect coefficients; the boundary statement is requested from ALS.2 and proposed as an extension of ArithmeticLocallySymmetricSpaces.

Concerns `R.1/steinberg-duality-finiteness`.

### Compact dual of a symmetric pair

Tau Ceti LieGroups Layer 7 has compact real forms but not the dual symmetric space K°\G_u of a Cartan pair with its functoriality. The classical identifications and the comparison of relative Lie algebra cohomology with the cohomology of the dual depend on it.

Concerns `R.3/classical-compact-duals`, `R.7/relative-absolute-injectivity`.

### Analysis on complete locally symmetric spaces, and Matsushima's constant

Stokes' formula on complete Riemannian manifolds, square-integrable harmonic forms, the Casimir description of the Laplacian and fine resolutions on a manifold with corners have no node in the atlas; they are requested from AutomorphicFormsOnReductiveGroups AF.1a. The exact normalisation of the constant A in Matsushima's m(G), and the tables giving m(H(ℝ))≥[rk_ℝ(H)/4]′, are in Matsushima (Osaka Math. J. 14, 1962) and Kaneyuki–Nagano, which Borel quotes; these two papers were not read, so the definition of m(G) is recorded as Borel states it.

Concerns `R.3/matsushima-garland-criterion`, `R.3/logarithmic-growth-complex`, `R.3/stable-range-constants`.

### Weil's computation of the Tamagawa number of SL_1(D)

Borel's Proposition 2.4 quotes Weil, Adeles and algebraic groups, Theorem 3.3.1, for τ(SL_1(D))=1. Weil's text was not read: the record of the Institute for Advanced Study notes (handle 20.500.12111/8024) is served behind an access challenge, and the Birkhäuser edition is not freely available. The proof, with its measure normalisation and its use of the zeta function of a division algebra, has to be read and decomposed before the node is closed; positivity and finiteness of the volume do not replace rationality.

Concerns `R.6/norm-one-tamagawa`.

### Bloch's pairing convention

Bloch's Higher regulators, algebraic K-theory, and zeta functions of elliptic curves (CRM Monograph Series 11) is not freely available and its first four lectures were not read. Their definition of the primitive pairing and of the local measures, with locators, is needed to state the comparison exactly; the Borel side is planned in R.5 and R.6.

Concerns `R.6/bloch-borel-interface`.

### Chern–Weil and van Est through the infinitesimal diagonal; suspension normalisation

The proof that the Beilinson class has Lie representative π_{j−1}Φ_{2j−1} uses Burgos's explicit description of the Chern–Weil homomorphism and of the van Est isomorphism (his Theorems 8.12 and 8.15), and the definition of the Borel class uses the suspension of the Chern character with its value on the Bott generator. Neither is a node of the atlas; they are requested from AF.1a and RT.4:topological.

Concerns `R.4/universal-borel-class`, `R.7/beilinson-infinitesimal-representative`.

### The Bloch–Wigner normalisation λ_BW

The exact real scalar λ_BW, its sign and its rational and Tate π factors in targetCoordinates remain undetermined. They require comparing Goncharov’s equations (61),(64), Theorem 5.7, Corollary 5.10 and Theorem 5.11, the measurable P.2 cocycle and Suslin’s V.4 map with Φ₃, the real projection, cross-ratio orientation and division by 2πi. The packet claims real proportionality only; rationality in these coordinates needs a separate calculation. K3BlochGroups V.6 and Polylogarithms P.3–P.4 consume the exact scalar and its higher-weight analogues. The generic continuous/measurable comparison is an explicit AF.1a request.

Concerns `R.7/weight-two-bloch-wigner`, `R.7/number-field-small-cases`.

## Corrections to the sources

### BorelRegulators/E1 (misprint)

*Source.* Armand Borel, *Cohomologie de SLn et valeurs de fonctions zêta aux points entiers*; Borel 1977 pp.616,627,628,632; 5.5(1),(4) and 6.2(5); corrected by the published Borel 1980 erratum p.373.

*Printed.* The source uses |D| for the algebraic normalization by restriction of scalars, and places i^{r₂} in 5.5(1),(4) and 6.2(5).

*Correction.* Use the chosen signed discriminant square root D^{1/2}=det(σ_i(α_a)) in those algebraic form normalizations and delete the specified i^{r2} factors. Positive Haar measure still uses |D|^{1/2}; other orientation phases are not all deleted.

*Reason.* The embedding determinant squares to the signed discriminant. For Q(i) it is −2i with the stated ordered basis, whereas |D|^{1/2}=2 loses the algebraic phase.

*Status.* Corrected in print: Borel, Errata-Corrigé, 1980, p.373. It affects a stated result.

### BorelRegulators/E2 (misprint)

*Source.* Charles A. Weibel, *The K-book, Chapter IV: Definitions of Higher K-Theory*; Author Chapter IV PDF, Theorem 1.18, p.12, version accessed 2026-10-05; published-book collation unavailable.

*Printed.* K_n(A) ⊗ Q ≅ K_n(F)

*Correction.* K_n(A) ⊗ Q ≅ K_n(F) ⊗ Q for n≥2. The rank table is unchanged.

*Reason.* Take A=F=ℚ and n=2. The displayed even-degree rank makes K₂(ℚ)⊗ℚ zero. Localization gives K₂(ℚ)→⊕_p K₁(𝔽_p)→K₁(ℤ)→K₁(ℚ); the final map is the injection {±1}→ℚ×, so the first map is onto the nonzero, indeed infinite, direct sum of finite residue-field unit groups. Thus the literal integral right-hand side cannot equal the zero rationalized left-hand side. No injection of K₂(ℤ) is used: the preceding K₃ residue-field boundary would also have to be checked for that argument. The intended rational comparison agrees with IV Theorem 1.17 and Borel 1974 Proposition 12.2.

*Status.* No correction was found in print or on the author's pages; the finding concerns the copy named above. It affects a stated result.

### BorelRegulators/E3 (misprint)

*Source.* Charles A. Weibel, *The K-book, Chapter VI: The Higher K-Theory of Fields*; Author Chapter VI PDF, Classical Data 8.1, p.47, version accessed 2026-10-05; published-book collation unavailable.

*Printed.* The source claims finiteness of K_n(F) for every nonzero even n.

*Correction.* The finiteness statement concerns K_n(O_S), for a ring of S-integers with finite S, rather than K_n(F). The following finite-group-plus-free-group statement should consistently use O_S too; its rational rank formula agrees with the field after localization.

*Reason.* For F=Q, localization has K₂(Q)→⊕_p K₁(F_p)→K₁(Z)→K₁(Q). The last map is injective, so the first map is onto an infinite direct sum of finite unit groups, and K₂(Q) is infinite. By contrast K₂(O_S) is finite for finite S by Quillen finite generation and the even-degree rank theorem. The same paragraph starts with O_S and cites the ring-of-integers finite-generation theorem IV.6.9.

*Status.* No correction was found in print or on the author's pages; the finding concerns the copy named above. It affects a stated result.

## Proposed changes of structure

The plan above is written for the present layers. The following proposals would make the layer structure match the declarations.

- **Split** (BorelRegulators). The atlas orders R.5 before R.6, but Borel's proof of the regulator theorem uses the volume of the norm-one group and the compact period cycles, which this packet plans in R.6; and the compact cycles use the compact-fibre comparison planned in R.5. At the level of declarations there is no cycle. Sub-layers. R.5a 'Dedekind zeta functions and leading terms': completed-zeta-conventions, zeta-zero-order, zeta-leading-coefficient, leading-term-functional-equation; requires AutomorphicLFunctionsAndLocalFactors:AL.1 and BorelRegulators:R.4. R.6a 'Norm-one volumes and compact period cycles': R.5/compact-factor-comparison, R.6/archimedean-split-division, norm-one-tamagawa, local-sl-volume, norm-one-volume, restriction-scalars-form, compact-period-cycles, adelic-period-pairing; requires BorelRegulators:R.3, AdelicAlgebraicGroups:AA.2, AA.3, AA.4, ArithmeticLocallySymmetricSpaces:ALS.5, SemisimpleAlgebrasPartII:SA.1 and Tau Ceti ClassFieldTheory Layer 10 and Chebotarev Layers 7 and 10. R.5b 'Borel's regulator theorem': borel-positive-zeta-period, borel-zeta-proportionality; requires R.5a, R.6a and R.4. R.6b 'Bloch's Tamagawa reformulation': bloch-borel-interface; requires R.5b. The edge R.5 → R.6 is replaced by R.5a, R.6a → R.5b → R.6b; R.7 requires R.5b in place of R.6.
- **Rescope** (BorelRegulators, ArithmeticKTheory, StableHomotopyKTheory, MotivicEtaleKTheory). Two clauses of the layer texts are owned elsewhere, and some layer links do not match the declarations. R.1's 'finite-type homotopy consequences needed by K-theory' and R.3's 'S-integer cases' are theorems of ArithmeticKTheory N.3:finite-generation and N.3:ranks, which consume R.1 and R.3; planning them here as well would duplicate those nodes and make each pair of layers depend on the other. Drop the two clauses from the texts of R.1 and R.3, naming ArithmeticKTheory:N.3:finite-generation/quillen-finite-generation-theorem and ArithmeticKTheory:N.3:ranks/borel-rank-theorem as owners. Layer links implied by this packet: StableHomotopyKTheory:H.3 → R.3 (the Cartan–Serre theorem is H.3/rational-hurewicz-hspace; the atlas lists H.6); ArithmeticKTheory:N.3:ranks → R.4 (rational localisation); SchemeKTheoryOperations:S.6 and RefinedTraceMethods:RT.4:topological → R.4 (Adams weights); AdelicAlgebraicGroups:AA.2–AA.4 and SemisimpleAlgebrasPartII:SA.0, SA.1 → R.6. R.7 uses only MotivicEtaleKTheory:M.8/number-field-deligne-normalization and M.8/deligne-regulator, which do not depend on R.7, while M.8/regulator-determinant-comparison consumes R.7/regulator-factor-two: the existing link R.7 → M.8 concerns that late node, and a split of M.8 into an early and a late sub-layer would remove the apparent cycle.
- **Rescope** (BorelRegulators, tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups). Compact real forms do not supply the compact dual of a symmetric pair. Lie groups, Part II: compact duals of symmetric pairs, following Layers 7 and 9. It owns g_u=k⊕i·p, the homogeneous space K°\G_u, the action of K/K°, functoriality for compatible morphisms and the comparison of relative Lie algebra cohomology with the cohomology of the dual. R.3 owns the classical identifications, the stable cohomology and the arithmetic application.
- **Rescope** (BorelRegulators, ArithmeticLocallySymmetricSpaces). ALS.2 constructs the bordification, its compact quotient, triangulation and stratification, and ALS.5:finite-level-duality gives duality with perfect coefficients; neither identifies the boundary with the building, which is what makes the Steinberg module the dualizing module. Arithmetic locally symmetric spaces, Part II: the building at infinity and arithmetic duality, with first prerequisite ArithmeticLocallySymmetricSpaces. Targets: the homotopy equivalence of the boundary of the bordification with the building of rational parabolic subgroups, equivariantly; the orientation character; virtual duality of arithmetic groups with dualizing module the twisted Steinberg module, integrally for torsion-free subgroups. R.1 constructs the building and Steinberg module of a division algebra and deduces finiteness of Steinberg homology.
- **Rescope** (BorelRegulators, AdelicAlgebraicGroups). AA.1 treats adelic points of affine groups in general; the groups of a central simple algebra, their reduced norm, rational rank and arithmetic subgroups of orders are not among its nodes, and Tamagawa numbers of particular groups are outside AA.2. Adelic algebraic groups, Part II: groups of central simple algebras, with first prerequisite AdelicAlgebraicGroups and using SemisimpleAlgebrasPartII and ClassicalArithmeticCompletion CA.7 for algebras and orders. Targets: GL_n(D), SL_n(D) and SL_1(D) as algebraic groups, parabolic subgroups as stabilisers of flags, arithmetic subgroups of orders, inner forms and integral models. The Tamagawa number of SL_1(D) stays in BorelRegulators R.6 as a theorem about that group.
- **Rescope** (BorelRegulators, AutomorphicFormsOnReductiveGroups, RefinedTraceMethods). Borel's stable-range theorem and Burgos's comparison use general analysis and Chern–Weil theory that no layer plans: Stokes on complete manifolds and square-integrable harmonic forms, and the explicit Chern–Weil and van Est maps; the Borel class needs the suspension of the Chern character with its Bott normalisation. Automorphic forms on reductive groups, Part II: harmonic forms and Chern–Weil theory on locally symmetric spaces, following AF.1a: Stokes' formula on complete Riemannian manifolds, square-integrable forms, the Casimir description of the Laplacian, and the Chern–Weil homomorphism with its comparison to van Est through the infinitesimal diagonal. RefinedTraceMethods RT.4:topological adds the suspension of the Chern character and its pairing with the Bott generator. R.3 keeps the theorems of Matsushima, Garland and Borel about arithmetic quotients. Include the natural comparison of continuous and measurable cohomology for real Lie groups with trivial coefficients, used by the Bloch–Wigner class.

Note for Tau Ceti: The compact-real-form object in layer 7 must not be read as the symmetric-pair compact-dual quotient required by stable arithmetic cohomology. The proposed Part II boundary above records the additional input without editing the upstream roadmap.

## Sources

- Armand Borel, [*Stable real cohomology of arithmetic groups*](https://www.numdam.org/item/ASENS_1974_4_7_2_235_0.pdf), Annales scientifiques de l’École normale supérieure, 4e série 7 (1974), 235–272. Read: §0.1; §§1–3 (Stokes on complete manifolds, square-integrable forms, the map from invariant forms, Matsushima and Garland); §§4–7, particularly 7.1–7.5; §8.2; §§9–12, particularly 9.1–9.5, 10.2–10.6, Theorem 11.1, 11.5 and Proposition 12.2.
- Armand Borel, [*Cohomologie de SLn et valeurs de fonctions zêta aux points entiers*](https://www.numdam.org/item/ASNSP_1977_4_4_4_613_0.pdf), Annali della Scuola Normale Superiore di Pisa, 4e série 4 (1977), 613–636. Read: §§1–6: conventions 1.4–1.6, Lemma 2.2 and Proposition 2.4 with proofs, the maps of 3.3–3.5, 5.1–5.5, 6.1–6.4.
- Armand Borel, [*Errata-Corrigé: Cohomologie de SLn et valeurs de fonctions zêta aux points entiers*](https://www.numdam.org/item/ASNSP_1980_4_7_2_373_0.pdf), Annali della Scuola Normale Superiore di Pisa, 4e série 7 (1980), 373. Read: Entire one-page erratum.
- José Ignacio Burgos Gil, [*The Regulators of Beilinson and Borel*](https://www.icmat.es/miembros/burgos/files/brbr.pdf), CRM Monograph Series 15, American Mathematical Society, 2002; author PDF. Read: §3.4; §4.1–4.5 normalisation; §§8.2–8.3; §9, including Corollary 9.8, Proposition 9.15, Lemma 9.18, Definitions 9.19 and 9.24, Propositions 9.21–9.26; §10.4.
- Daniel Quillen; text prepared by Hyman Bass, [*Finite generation of the groups Ki of rings of algebraic integers*](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/bass-seattle.pdf), Algebraic K-Theory I, Lecture Notes in Mathematics 341 (1973), 179–198; collected scan headers 195–214. Read: §1, Theorems 1–3 and proof of Theorem 1, pp.179–185 (scan headers 195–201); §2, building and Solomon–Tits proof, pp.185–190 (scan headers 201–206).
- Thomas Church, Benson Farb, Andrew Putman, [*Integrality in the Steinberg module and the top-dimensional cohomology of GLn OK*](https://arxiv.org/pdf/1501.01307v2), arXiv:1501.01307v2, author PDF dated June 2, 2019. Read: §1.1–1.4: building, apartments, Steinberg module and rational duality.
- Charles A. Weibel, [*The K-book, Chapter IV: Definitions of Higher K-Theory*](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.IV.pdf), Author chapter PDF, version accessed 2026-10-05. Read: §1, plus construction, homological stability, Theorems 1.17–1.18 and Regulator Maps 1.18.1, pp.2–13; §§3–4, realization and group-completion context; §5, operations from representations, Proposition 5.3 to Corollary 5.5.1, pp.47–49.
- Charles A. Weibel, [*The K-book, Chapter VI: The Higher K-Theory of Fields*](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.VI.pdf), Author chapter PDF, version accessed 2026-10-05. Read: §4, motivic-cohomology context; §8, number-field data, p.47. Borel ranks/regulators are in Chapter IV §1, not Chapter VI §4.; §10, Theorem 10.1 and Table 10.1.1, pp.60–61: K₂(Z)=Z/2 for the E2 counterexample.
- Michael Rapoport, [*Comparison of the regulators of Beilinson and of Borel*](https://ncatlab.org/nlab/files/Rapoport.pdf), Beilinson’s Conjectures on Special Values of L-Functions (1988), 169–192. Read: Introduction and §1: coefficient conventions and rational comparison.
- Alexander B. Goncharov, [*Polylogarithms, regulators, and Arakelov motivic complexes*](https://arxiv.org/pdf/math/0207036), arXiv:math/0207036v3, 17 June 2004. Read: Introduction equations (8),(11); §§5.4–5.5, equations (61),(64) and Theorem 5.7, pp.43–47; §§5.1–5.3 for the regulator-map conventions.
- Armand Borel, [*Sur la cohomologie des espaces fibrés principaux et des espaces homogènes de groupes de Lie compacts*](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Borel-Sur.pdf), Annals of Mathematics 57 (1953), 115–207; published scan. Read: §31.4–31.5, Propositions 31.3–31.4 and transgression calculations, pp.203–205.
- Andrew Putman, Daniel Studenmund, [*The dualizing module and top-dimensional cohomology group of GL_n(O)*](https://arxiv.org/pdf/1909.01217v4), arXiv:1909.01217v4. Read: §1, pp.1–6: virtual duality, buildings, the Steinberg module, Theorem C and apartment classes; §2.1, Proposition 2.1 and the proof of Theorem C, pp.8–10.

## Planets

| Layer | Planets |
| --- | --- |
| R.1 | Arithmetic groups of orders; Spherical building; Steinberg module; Solomon–Tits theorem; Steinberg homology finiteness |
| R.2 | Arithmetic restriction; Borel's map from invariant forms |
| R.3 | Classical compact duals; Stable compact-dual cohomology; Borel stable-range theorem; Stable arithmetic cohomology; Borel rank theorem for orders; Borel rank theorem |
| R.4 | Archimedean regulator target; Regulator coordinates; Universal Borel class; Borel trace cocycle; Borel regulator; Regulator lattice |
| R.5 | Dedekind-zeta vanishing order; Zeta leading coefficient; Borel primitive-period theorem; Borel regulator theorem |
| R.6 | Archimedean-split division algebra; Norm-one Tamagawa number; Special-linear local volume; Norm-one quotient volume; Discriminant form normalization |
| R.7 | Beilinson infinitesimal comparison; Borel–Beilinson comparison theorem; Regulator covolume comparison; Regulator extension matrices |
