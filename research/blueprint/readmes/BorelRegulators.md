# Stable arithmetic cohomology and Borel regulators

This roadmap constructs the stable real cohomology of arithmetic special-linear groups over division-algebra orders, uses its primitive part to prove the rational ranks of higher algebraic K-groups, and constructs the normalized Borel regulator of a number field. Its arithmetic image becomes a full lattice only after the independently owned integral finite-generation theorem. Compact arithmetic cycles and Tamagawa volumes then relate its covolume to the leading coefficient of the Dedekind zeta function. The final comparison identifies the Borel regulator with twice the Beilinson regulator under the selected conventions in every weight.

The targets below are mathematical specifications, with proposed declaration names. Every name without a namespace prefix belongs to `TauCeti.Borel`. A statement of a rank or comparison is a theorem target; it supplies no implementation claim. The companion [packet](../packets/BorelRegulators.json) fixes the dependencies, APIs, tests, source versions and open interfaces. The [suggested file](../suggested/BorelRegulators.lean) gives native prototypes where the baseline already has their carriers and explicit mathematical signatures elsewhere. This document is definitive.

## Conventions and ownership

Let F be a number field with signature (r₁,r₂), counting a pair of conjugate complex embeddings once. Write Σ_F for the full set of complex embeddings, including both members of every pair. An order in a central division F-algebra D is a unital full integral lattice spanning D; maximality is stated wherever Quillen's projective rank filtration needs it. Matrix rank n is dimension over D. The absolute size of a split archimedean matrix factor is ne, where e is the division-algebra degree. These ranks must not be interchanged in a stable-range estimate.

For weight j≥2 put q=2j−1 and R(a)=(2πi)^a R. The target V_j(F) is the simultaneous conjugation-invariant part of the product of R(j−1) over Σ_F. In real coordinates an element obeys f(σ̄)=(−1)^{j−1}f(σ). Its dimension d_j is r₁+r₂ for odd j and r₂ for even j. Choose coordinates only after constructing this invariant target. Its reference lattice is the fixed product of the Tate integer lines, and the reference measure gives that lattice covolume one. A complex pair does not contribute an extra square-root-of-two measure factor.

Use Burgos's renormalized Borel class, defined by suspension of ch_j=(2πi)^j pr_j/j!, its compact-unitary invariant form, and inverse van Est. The same Chern-character and Tate generators define the Beilinson side. The resulting map equality is r_Bo=2r_Be. A rank-d determinant or covolume changes by 2^d. The signed embedding determinant enters algebraic restriction of scalars; the absolute discriminant enters positive Haar measure. Borel's published 1980 correction controls the phases in the former.

Generic arithmetic groups, restriction of scalars, reduction theory, measures and compactifications belong to AdelicAlgebraicGroups and ArithmeticLocallySymmetricSpaces. Generic relative Lie theory and van Est belong to AutomorphicFormsOnReductiveGroups AF.1a. Genuine plus constructions, group completion and K-theory carriers belong to H.3, H.4 and K.2. ArithmeticKTheory N.3 owns the integral K-finiteness and localization endpoints. R.3 supplies its rational rank input. Higher Adams operations are imported from SchemeKTheoryOperations S.6; the K₀ Chern-character API does not substitute for them. Universal Deligne Chern characters belong to MotivicEtaleKTheory M.8, with their early construction separated from any downstream analytic special-value comparison.

The accepted RS-04 boundary is retained: R.6 owns the primitive pairing, specialized norm-one volumes and their measure conversion used in Bloch's formulation. It imports the general adelic infrastructure. Tau Ceti's existing topology, Lie groups and class field theory roadmaps are prerequisites. Where those documents stop short of a required input, the additional target is a precisely described Part II request; it is not rebuilt inside this roadmap.

## R.1 — Arithmetic groups and finiteness infrastructure

The arithmetic system must remember block inclusions, the reduced norm and all archimedean factors. Its building is over the division algebra, rather than over the order: flags of proper nonzero right subspaces give the coefficient module needed by Quillen. Augmented homology gives the rank-one Steinberg module Z and prevents an off-by-one failure in the filtration.

The Steinberg module usually has infinite integral rank. The usable finiteness theorem is finiteness of arithmetic group homology with that coefficient, obtained from integral Borel–Serre duality, the orientation character and finite-quotient descent. Ordinary finite-type cohomology does not prove it. The Q rank filtration remains in N.3; this layer provides its arithmetic coefficient input. Quillen's read passage treats maximal orders, so a nonmaximal-order integral extension needs its own comparison theorem. Rational ranks for arbitrary orders do not depend on that extension.

### Arithmetic groups of division-algebra orders

**Declaration:** `orderArithmeticSystem` · construction · `BorelRegulators:R.1/order-arithmetic-system`.

Let F be a number field, D a finite-dimensional central division F-algebra of degree e, and O a unital Z-order spanning D over Q. For n≥2 put G_n=Res_{F/Q} SL_n(D), Γ_n=SL_n(O), with reduced norm one; for a projective O-lattice P spanning D^n use Aut_O(P). The construction identifies these as arithmetic subgroups and retains each archimedean matrix/quaternion factor and the block maps diag(g,1).

**Hypotheses.** O is a full Z-lattice, closed under multiplication and containing 1; D is division and central over F.

**Construction or proof.** Use CSA only for the existing central-simple carrier; import orders, reduced norms and restriction of scalars from AA.1. Use the order lattice to exhibit commensurability with an integral stabilizer and apply AA.1 arithmeticity. At real places D is a real matrix algebra or a quaternion matrix algebra, while complex places split. Block diagonal matrices preserve reduced norm.

**Dependencies.** `mathlib:CSA`, `AdelicAlgebraicGroups:AA.1`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-9-the-cartan-iwasawa-and-kak-decompositions`.

**Working API.**

- `orderArithmeticSystem_block` (functoriality): The block inclusion Γ_n→Γ_{n+1} agrees with diag(g,1) on matrices and composes to diag(g,I_r).
- `orderArithmeticSystem_archimedean` (projection): The real Lie group of G_n is the product of the factors SL_{ne}(R), SL_{ne/2}(H) at ramified real places, and SL_{ne}(C) at complex places.
- `orderArithmeticSystem_rank` (characterisation): For n≥2, rank_Q G_n=n−1.
- `orderArithmeticSystem_equiv` (compatibility): An order algebra isomorphism induces the native matrix-group isomorphism and commutes with every block inclusion.
- `orderArithmeticSystem_projective` (data): Aut_O(P), with P a projective full lattice in D^n, is arithmetic in Res GL_D(P⊗D).

**Unit tests.**

- `orderArithmeticSystem_split` (compatibility): For D=F and O=O_F, Γ_n=SL_n(O_F).
- `orderArithmeticSystem_rank_two` (computation): For n=2 and any central division D, rank_Q G_2=1.
- `orderArithmeticSystem_norm_one` (non-example): For F=Q, diag(2,1) lies in GL_2(Q) but not in Γ_2 for O=Z, and not in SL_2(Q).

**Consumers.** Borel 1974, §11.5: Supplies the compatible arithmetic sequence. BorelRegulators:R.3: Identifies rank parameters and local compact duals.

**Acceptance.** For D=F and O=O_F obtain the ordinary SL_n(O_F), not GL_n or norm-one units of O_F. The Q-rank of G_n is n−1 independently of the degree of D.

**Source.** [Armand Borel, Stable real cohomology of arithmetic groups](https://www.numdam.org/item/ASENS_1974_4_7_2_235_0.pdf), §11.5, pp.266–267. Arithmetic subgroups over orders and the three archimedean factors are the system used in Proposition 12.2.

### The spherical building over a division algebra

**Declaration:** `divisionBuilding` · definition · `BorelRegulators:R.1/division-building`.

For a right D-vector space V of finite dimension n≥2, Δ(V) is the order complex of the poset of proper nonzero right D-subspaces of V; simplices are strictly increasing finite flags. Aut_D(V) acts by transport of subspaces. Set Δ(0) and Δ(D) to the empty complex, with augmented chain conventions fixed separately.

**Hypotheses.** D is a division ring, not necessarily commutative.

**Construction or proof.** Form the flag simplicial complex using the imported simplicial/CW infrastructure AT.4. Define the action by transporting each member of a flag. Keep augmented chains to make reduced degree −1 meaningful for rank one.

**Dependencies.** `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`, `BorelRegulators:R.1/order-arithmetic-system`.

**Working API.**

- `divisionBuilding_vertices` (data): Vertices are exactly proper nonzero D-subspaces.
- `divisionBuilding_simplex` (characterisation): A finite set spans a simplex iff it is a chain of distinct comparable subspaces.
- `divisionBuilding_map` (functoriality): A D-linear equivalence of V and W induces a simplicial equivalence with identity and composition laws.
- `divisionBuilding_action` (structure): Aut_D(V) acts simplicially, compatibly with the inclusion of Aut_O(P).

**Unit tests.**

- `divisionBuilding_rank_one` (degenerate): The rank-one building is empty.
- `divisionBuilding_rank_two` (computation): The rank-two building is a discrete complex indexed by right D-lines; it has no edges.
- `divisionBuilding_not_order_submodules` (non-example): For V=Q², the lattices Z² and 2Z² do not define two distinct vertices: both span the excluded full subspace.

**Consumers.** Quillen 1973, Theorems 2–3: The augmented building chains compute the Steinberg coefficient in the rank filtration. BorelRegulators:R.1/steinberg-duality-finiteness: Identifies the dualizing module.

**Acceptance.** Flags are right subspaces; a set of arbitrary submodules of an order is not this building.

**Source.** [Daniel Quillen; text prepared by Hyman Bass, Finite generation of the groups Ki of rings of algebraic integers](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/bass-seattle.pdf), §1, proof of Theorem 2 and Theorem 3, pp.181–184. Quillen uses the Tits building of the generic-fiber vector space, including division-algebra orders.

### The integral Steinberg module

**Declaration:** `steinbergModule` · definition · `BorelRegulators:R.1/steinberg-module`.

St_D(V)=reduced integral homology H̃_{n−2}(Δ(V);Z) for n≥2, with its Aut_D(V)-action; set St_D(D)=Z with trivial action via augmented degree −1. It is an integral coefficient module, and is usually not finitely generated as an abelian group.

**Hypotheses.** V has positive finite D-dimension n.

**Construction or proof.** Use AT.2 reduced augmented chains of the flag complex. Pass the simplicial automorphism action to homology. For n=1 use H̃_{−1}(empty;Z)=Z.

**Dependencies.** `BorelRegulators:R.1/division-building`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology`.

**Working API.**

- `steinbergModule_action` (structure): St_D(V) is a Z[Aut_D(V)]-module induced from the action on augmented chains.
- `steinbergModule_equiv` (functoriality): Linear equivalences give equivariant module equivalences, preserving identity and composition.
- `steinbergModule_rank_one` (simp): St_D(D)=Z with trivial automorphism action.
- `steinbergModule_rank_two` (compatibility): St_D(D²) is canonically the kernel of the sum-of-coefficients map Z[P¹(D)]→Z.
- `steinbergModule_apartment` (constructor): An ordered D-basis gives the oriented apartment class; permutations act by their sign and replacing any basis vector by a nonzero multiple leaves the apartment unchanged.

**Unit tests.**

- `steinbergModule_one` (degenerate): St_D(D)=Z, not zero.
- `steinbergModule_two` (compatibility): For D=F_q, rank_Z St_D(D²)=q.
- `steinbergModule_rational_lines` (non-example): For D=Q and n=2 the underlying abelian group has infinite rank, despite the arithmetic group having a finite classifying-space model.

**Consumers.** Quillen 1973, Theorem 3: Coefficients in the relative homology of rank-filtration steps. ArithmeticKTheory:N.3:finite-generation: Needs finiteness of twisted group homology, not finiteness of St itself.

**Acceptance.** For n=2 it is the augmentation kernel of Z[right D-lines].

**Source.** [Daniel Quillen; text prepared by Hyman Bass, Finite generation of the groups Ki of rings of algebraic integers](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/bass-seattle.pdf), §1, Theorem 2, pp.181–182. The coefficient in Quillen’s rank-filtration argument is the top reduced homology of the building.

### Solomon–Tits theorem over division rings

**Declaration:** `solomonTits` · theorem · `BorelRegulators:R.1/solomon-tits`.

For a right D-space V of dimension n≥2 over a division ring, Δ(V) is homotopy equivalent to a wedge of (n−2)-spheres. Its reduced integral homology is concentrated in degree n−2, is torsion-free there, and the oriented apartment classes generate St_D(V). The statement permits an infinite wedge.

**Hypotheses.** D division; n≥2.

**Construction or proof.** Use the apartment cover and opposition filtration cited in Quillen’s Theorem 2. Apply the AT.4 CW filtration and AT.2 augmented homology to obtain concentration. The apartment cycles generate the surviving top homology.

**Dependencies.** `BorelRegulators:R.1/division-building`, `BorelRegulators:R.1/steinberg-module`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology`.

**Acceptance.** For n=2 this is a wedge of zero-spheres; no connectedness is asserted.

**Source.** [Daniel Quillen; text prepared by Hyman Bass, Finite generation of the groups Ki of rings of algebraic integers](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/bass-seattle.pdf), §1, Theorem 2, pp.181–182. The quoted Tits theorem supplies the building homology used in the proof.

### Finiteness of Steinberg-coefficient homology

**Declaration:** `steinbergHomology_finitelyGenerated` · theorem · `BorelRegulators:R.1/steinberg-duality-finiteness`.

For an order O in a central division number algebra, a projective full O-lattice P of rank n≥1 and Γ=Aut_O(P), each H_i(Γ,St_D(P⊗_O D)) is finitely generated over Z. Choose a normal torsion-free finite-index Γ′ lying in the kernel of the orientation character and of the absolute rational reduced-norm character; Borel–Serre integral duality identifies its twisted homology with complementary-degree integral cohomology. Descent to Γ uses the integral finite-quotient spectral sequence.

**Hypotheses.** The Borel–Serre duality input includes the building as rational boundary and the orientation twist; a finite CW model alone does not imply this assertion.

**Construction or proof.** Import ALS.2 finite-type models and integral Borel–Serre duality with orientation module. Choose Γ′ with trivial orientation. Apply the duality isomorphism H_i(Γ′,St)≅H^{vcd−i}(Γ′,Z), including the reductive central factor. Finite CW models make the right side finitely generated. Apply the Lyndon–Hochschild–Serre homology spectral sequence for finite Γ/Γ′. Its terms with finitely generated coefficients are finitely generated; this uses integral homology rather than rational transfer.

**Dependencies.** `BorelRegulators:R.1/solomon-tits`, `BorelRegulators:R.1/order-arithmetic-system`, `ArithmeticLocallySymmetricSpaces:ALS.2`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`.

**Acceptance.** Retain finite-quotient torsion; do not infer this from the size of St. For rank one the coefficient is Z and the statement reduces to ordinary homology finiteness.

**Source.** [Daniel Quillen; text prepared by Hyman Bass, Finite generation of the groups Ki of rings of algebraic integers](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/bass-seattle.pdf), §1, proof of Theorem 1, pp.184–185. Quillen’s finiteness proof invokes arithmetic duality for the Steinberg module and integral descent.

### Rank-filtration input to arithmetic K-finiteness

**Declaration:** `quillenRankFiltration_finitenessInput` · theorem · `BorelRegulators:R.1/quillen-finiteness-interface`.

For a maximal order O in a central division number algebra, the category of projective O-modules of rank at most n has only finitely many isomorphism classes in rank n (Jordan–Zassenhaus). Quillen’s rank-filtration relative homology is assembled from H_{i−n}(Aut_O(P),St_D(P⊗D)) over those classes. Thus every finite-rank filtration step has finitely generated integral homology; ArithmeticKTheory:N.3:finite-generation owns stabilization, plus/Q comparison and K_i(O) finite generation. Extension of this argument to a nonmaximal order requires an additional order-comparison theorem and is not inferred from Quillen’s hereditary-order filtration.

**Hypotheses.** O is maximal; projective-module exact category and Q construction imported from GeneralAlgebraicKTheory.

**Construction or proof.** Import the Q rank filtration and its relative homology theorem from N.3, where the K-theoretic filtration belongs. Supply R.1 Steinberg homology finiteness and Jordan–Zassenhaus finiteness of projective lattice classes. Combine the finite sums in the filtration exact sequence; pass the resulting input to the owning N.3 theorem.

**Dependencies.** `BorelRegulators:R.1/steinberg-duality-finiteness`, `ArithmeticKTheory:N.3:finite-generation`, `GeneralAlgebraicKTheory:K.2`.

**Acceptance.** This node does not duplicate the final finite-generation theorem in N.3.

**Source.** [Daniel Quillen; text prepared by Hyman Bass, Finite generation of the groups Ki of rings of algebraic integers](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/bass-seattle.pdf), §1, Theorem 3 and proof of Theorem 1, pp.182–185. The relative groups and finite projective-class sum are the exact input that the owner of the rank filtration needs.

### Finite-type consequences for arithmetic plus spaces

**Declaration:** `arithmeticPlus_finiteType` · theorem · `BorelRegulators:R.1/finite-type-plus-consequences`.

For a maximal order O, the arithmetic plus/Q model of K(O), supplied by K.2 with H.3–H.4, is a connected homotopy-associative H-space on its positive component, with the correct K_1 fundamental group, trivial π1 action on higher homotopy and finite-type integral homology in each degree. Its higher homotopy groups are finitely generated using the finite-type H-space theorem; the arithmetic finite-generation endpoint is imported from N.3. Rational rank calculations for all orders use only the finite-dimensional rational comparison and do not depend on this integral endpoint.

**Hypotheses.** Use the genuine local-coefficient-acyclic plus construction and the cofinal-projective comparison; simple connectedness of BGL+ is not assumed.

**Construction or proof.** Import the strengthened connected H-space plus and projective-cofinality interfaces from H.3–H.4 and their K.2 identification. Feed the arithmetic filtration input into the N.3 proof of integral finite type. Use the connected simple H-space finite-type homotopy theorem, including the π1 stage, rather than the simply connected Hurewicz theorem alone.

**Dependencies.** `BorelRegulators:R.1/quillen-finiteness-interface`, `StableHomotopyKTheory:H.3`, `StableHomotopyKTheory:H.4`, `GeneralAlgebraicKTheory:K.2`, `ArithmeticKTheory:N.3:finite-generation`.

**Acceptance.** BGL+ has π1=K1, which need not vanish; no simply connected substitution is admissible.

**Source.** [Daniel Quillen; text prepared by Hyman Bass, Finite generation of the groups Ki of rings of algebraic integers](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/bass-seattle.pdf), §1, proof of Theorem 1, pp.184–185. The proof passes from finite homology to finite homotopy for the K-theory H-space.

## R.2 — Continuous and relative Lie-algebra cohomology

The baseline already has homogeneous continuous cochains and their functorial restriction maps. Specialize those maps to an arithmetic subgroup and identify their all-degree discrete-group realization through the owning comparison interface. The existing explicit H² equivalence supplies only degree two. It cannot justify every regulator degree.

The invariant-form map descends a relative Lie cohomology class to a torsion-free arithmetic quotient and then applies the early finite-level Betti/de Rham comparison in ALS.5. For a group with torsion, use finite-index descent over real coefficients. The cup and block compatibility must concern those actual maps. Stabilization then preserves the Hopf structure, so homological primitives pair with cohomological indecomposables. Keeping this distinction prevents decomposable classes from entering the K-rank count.

### Restriction of continuous classes to arithmetic groups

**Declaration:** `arithmeticRestriction` · construction · `BorelRegulators:R.2/arithmetic-restriction`.

For Γ⊂G(R) arithmetic, Γ with the discrete topology, q≥0 and a finite-dimensional real trivial coefficient vector space E, res_Γ:H_cont^q(G(R),E)→H^q(Γ,E) is induced by precomposition of homogeneous continuous cochains with Γ→G(R), followed by the all-degree comparison between continuous cochains on a discrete group and native group cochains. It agrees with the pinned ContinuousCohomology.cochainsMap on complexes.

**Hypotheses.** The inclusion is a continuous group homomorphism when Γ is discrete.

**Construction or proof.** Use the existing homogeneousCochains and cochainsMap rather than defining another continuous cochain complex. Import the all-degree discrete-group comparison from AF.1a; the pinned Tau Ceti explicit H2 equivalence is only its degree-two acceptance case. Pass the cochain map to homology.

**Dependencies.** `mathlib:TopRep.homogeneousCochains`, `mathlib:continuousCohomology`, `mathlib:ContinuousCohomology.cochainsMap`, `mathlib:ContinuousCohomology.cochainsMap_comp`, `tauceti:TauCeti.ContCohomology.explicitH2IsoGroupCohomology`, `AutomorphicFormsOnReductiveGroups:AF.1a`.

**Working API.**

- `arithmeticRestriction_cochains` (compatibility): Its cochain representative is ContinuousCohomology.cochainsMap for the inclusion and identity coefficients.
- `arithmeticRestriction_id` (functoriality): Restriction along the identity is the identity.
- `arithmeticRestriction_comp` (functoriality): For Δ⊂Γ⊂G, res_Δ=res_{Δ⊂Γ}∘res_Γ.
- `arithmeticRestriction_coeff` (functoriality): For a real linear coefficient map E→E′, coefficient extension commutes with restriction.
- `arithmeticRestriction_cup` (compatibility): Restriction preserves cup products and units for compatible algebra coefficients.

**Unit tests.**

- `arithmeticRestriction_degree_zero` (computation): For trivial coefficients, the degree-zero restriction R→R is identity.
- `arithmeticRestriction_trivial_group` (degenerate): For Γ={1} and q>0, restriction has zero target.
- `arithmeticRestriction_degree_two` (compatibility): The degree-two discrete comparison agrees with TauCeti.ContCohomology.explicitH2IsoGroupCohomology on a cocycle class.

**Consumers.** Borel 1974, §10.2: Identifies the analytic invariant-form comparison with continuous restriction. BorelRegulators:R.4: Pulls the universal Borel class back to arithmetic group homology.

**Acceptance.** The map starts with topological G(R), not its discrete cohomology.

**Source.** [Armand Borel, Stable real cohomology of arithmetic groups](https://www.numdam.org/item/ASENS_1974_4_7_2_235_0.pdf), §10.2(2), p.263. The comparison jΓ is restriction in continuous Eilenberg–Mac Lane cohomology.

### The invariant-form arithmetic comparison

**Declaration:** `arithmeticInvariantFormMap` · construction · `BorelRegulators:R.2/arithmetic-invariant-form-map`.

For a connected semisimple real algebraic group G, maximal compact K, torsion-free arithmetic Γ and X=K\G(R), j_Γ:H^q(g,k;R)→H^q(Γ,R) sends a relative Lie class to its G-invariant differential form descended to X/Γ and then to its singular cohomology class. For general Γ use the finite-index torsion-free subgroup and real-coefficient invariant descent. Via van Est it equals arithmeticRestriction. Component-group invariants are retained when G(R) is disconnected.

**Hypotheses.** Invariant forms, van Est and the early Betti/de Rham comparison are supplied by AF.1a and ALS.5:finite-level-duality.

**Construction or proof.** Apply AF.1a invariant-form realization and van Est. Use the ALS.5 early de Rham/singular identification on the torsion-free quotient. Descend by finite-quotient invariants over R, and compare with continuous-cochain restriction.

**Dependencies.** `BorelRegulators:R.2/arithmetic-restriction`, `AutomorphicFormsOnReductiveGroups:AF.1a`, `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality`, `ArithmeticLocallySymmetricSpaces:ALS.2`.

**Working API.**

- `arithmeticInvariantFormMap_vanEst` (compatibility): jΓ=resΓ∘vanEst⁻¹ for the AF.1a convention on relative cochains.
- `arithmeticInvariantFormMap_descent` (characterisation): Its pullback to a torsion-free finite-index Γ′ equals the invariant form on X/Γ′.
- `arithmeticInvariantFormMap_component` (projection): For disconnected real points the source is the appropriate K/K°-invariant part.
- `arithmeticInvariantFormMap_cup` (compatibility): jΓ sends wedge products of invariant forms to cup products.
- `arithmeticInvariantFormMap_coeff` (functoriality): Extension R→C commutes with the map and with Betti/de Rham comparison.

**Unit tests.**

- `arithmeticInvariantFormMap_unit` (computation): The constant invariant 0-form 1 maps to the unit cohomology class.
- `arithmeticInvariantFormMap_point` (degenerate): If X/Γ is a point then every positive-degree class maps to zero.
- `arithmeticInvariantFormMap_component_invariants` (non-example): For disconnected G(R), replacing the invariant source by unrestricted connected-component cohomology is disallowed whenever the component action is nontrivial.

**Consumers.** Borel 1974, Theorem 7.5: This is the map whose injectivity and surjectivity are estimated. BorelRegulators:R.3: Transfers compact-dual generators to stable arithmetic cohomology.

**Acceptance.** No automorphic decomposition or Matsushima formula from AS.5 is required to construct this early map.

**Source.** [Armand Borel, Stable real cohomology of arithmetic groups](https://www.numdam.org/item/ASENS_1974_4_7_2_235_0.pdf), §3.1 and §10.2(1)–(5), pp.241–242,263. The invariant-form, relative Lie and continuous realizations describe the same arithmetic map.

### Naturality of arithmetic comparison under block maps

**Declaration:** `arithmeticComparison_block_natural` · theorem · `BorelRegulators:R.2/block-comparison-naturality`.

For an injective real algebraic homomorphism f:G→G′ taking Γ into Γ′, choose K′ containing f(K). The invariant-form restriction, relative Lie pullback, continuous-cohomology pullback and arithmetic-group pullback form commuting squares with jΓ and jΓ′. In the order system this holds for every diag(g,I_r) and commutes with coefficient extension R→C. The induced compact-dual pullback is independent of compatible maximal-compact choices up to the canonical conjugacy identifications.

**Hypotheses.** Groups, arithmetic subgroups and compact duals satisfy the R.2 comparison hypotheses.

**Construction or proof.** Use ContinuousCohomology.cochainsMap_comp for continuous restriction. Apply AF.1a van Est naturality and ALS.5 Betti/de Rham naturality. Use Borel §10.3 for compatible maximal compacts and the totally geodesic compact-dual inclusion.

**Dependencies.** `BorelRegulators:R.2/arithmetic-invariant-form-map`, `BorelRegulators:R.1/order-arithmetic-system`, `AutomorphicFormsOnReductiveGroups:AF.1a`, `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-9-the-cartan-iwasawa-and-kak-decompositions`.

**Acceptance.** Composing two block inclusions gives the same comparison square as their single block inclusion.

**Source.** [Armand Borel, Stable real cohomology of arithmetic groups](https://www.numdam.org/item/ASENS_1974_4_7_2_235_0.pdf), §10.3, pp.263–264. The source constructs the natural pullback across the invariant-form and compact-dual realizations.

### Stable comparison as a Hopf-algebra map

**Declaration:** `stableComparison_hopf` · theorem · `BorelRegulators:R.2/stable-hopf-compatibility`.

In the stabilized order system, block sum gives the arithmetic homology/cohomology its connected graded Hopf structure. The stable invariant-form/compact-dual comparison preserves unit, product, coproduct, augmentation and antipode; it therefore preserves cohomological primitives and indecomposables and, by finite-degree duality, primitive homology. Primitive homology is dual to cohomology indecomposables, not to all cohomology in the same degree.

**Hypotheses.** Each degree has stabilized and is finite-dimensional over R; block sum is compatible with plus-space multiplication.

**Construction or proof.** Use block naturality for the two inclusions and for block sum. Use AT.6 Künneth/cup products and the H.4 group-completion multiplicative structure. Dualize degreewise and identify annihilators of decomposables.

**Dependencies.** `BorelRegulators:R.2/block-comparison-naturality`, `StableHomotopyKTheory:H.4`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

**Acceptance.** An exterior product of two positive-degree generators is excluded from the indecomposable quotient.

**Source.** [Armand Borel, Stable real cohomology of arithmetic groups](https://www.numdam.org/item/ASENS_1974_4_7_2_235_0.pdf), §10.6 and §12.1, pp.264–265,270. The rank argument uses the stable Hopf algebra and its indecomposable classes.

## R.3 — Stable cohomology and Borel ranks

A compact real form is insufficient to specify the compact dual of a Cartan symmetric pair. The additional Lie groups Part II interface must construct g_u=k+i p and K°\G_u with component invariants and block functoriality. This layer computes the stable cohomology of its classical real, quaternionic and complex special-linear cases through their fibrations.

There are two stability bounds. Compact-dual cohomology is degreewise stationary under the stated conservative classical bound. The arithmetic comparison uses Borel's logarithmic-growth, square-integrability and curvature estimates, with the explicit sufficient inequality 4q<n−1. Choose n satisfying both before taking the graded degreewise limit. The connected H-space Cartan–Serre theorem then reads the higher K-ranks from primitives. The positive K₁ fundamental group is preserved: BGL plus is not replaced by a simply connected space. Neither rank calculation nor rational Hurewicz assumes integral K-finiteness. The reserved Borel rank theorem is the supplier for the Zagier determinant programme.

### Classical compact-dual identifications

**Declaration:** `classicalCompactDuals` · theorem · `BorelRegulators:R.3/classical-compact-duals`.

For the archimedean factors of SL_n(D), the connected compact duals are SU_{ne}/SO_{ne} at split real places, SU_{ne}/USp_{ne} at quaternionic real places (ne even), and SU_{ne} at complex places. They use the Cartan symmetric-pair dual g_u=k⊕i p and the quotient K°\G_u; a compact real form by itself does not specify the dual. Compatible block inclusions induce the corresponding maps between these homogeneous spaces.

**Hypotheses.** n≥2, D central division of degree e; compact-dual symmetric-pair geometry is an additional LieGroups Part II input.

**Construction or proof.** Import Cartan decomposition and the symmetric-pair dual construction from the requested LieGroups extension. Classify real central division algebras as R or H and complex ones as C after Morita matrix factors, using AA.1. Identify maximal compact groups SO, USp and SU and the stated quotients.

**Dependencies.** `BorelRegulators:R.1/order-arithmetic-system`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-7-complexification-and-real-forms`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-9-the-cartan-iwasawa-and-kak-decompositions`.

**Acceptance.** The quaternionic quotient has USp_{ne}, not SO_{ne}, as denominator.

**Source.** [Armand Borel, Stable real cohomology of arithmetic groups](https://www.numdam.org/item/ASENS_1974_4_7_2_235_0.pdf), §§10.2,10.6 and 11.5, pp.263–267. The classical compact twins supply the three factor calculations.

### Stable exterior cohomology of classical compact duals

**Declaration:** `compactDual_stableExterior` · theorem · `BorelRegulators:R.3/compact-dual-cohomology`.

With real coefficients, the degreewise stable cohomology rings are H*(SU)=Λ(x_3,x_5,x_7,…), H*(SU/SO)=Λ(y_5,y_9,y_13,…) and H*(SU/USp)=Λ(z_5,z_9,z_13,…). The named generators are primitive for stable block sum. The finite-dimensional groups and homogeneous spaces have their own unstable relations; the displayed infinite exterior algebras assert only degreewise stable cohomology.

**Hypotheses.** Stability maps come from the compatible classical block inclusions.

**Construction or proof.** Import the Serre spectral sequence, monodromy and transgression for the classical-group fibrations from AT.5. Compute the SU primitive transgressions and the SO/USp quotients as in Borel §10.6; retain unstable Euler classes until outside the tested degree. Use block multiplication to verify the generator coproduct x↦x⊗1+1⊗x.

**Dependencies.** `BorelRegulators:R.3/classical-compact-duals`, `mathlib:ExteriorAlgebra`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

**Acceptance.** H³(SU/SO;R)=H³(SU/USp;R)=0, while H³(SU;R)=R. Finite-size cohomology is not replaced by the stable ring without a degree bound.

**Source.** [Armand Borel, Stable real cohomology of arithmetic groups](https://www.numdam.org/item/ASENS_1974_4_7_2_235_0.pdf), §10.6, pp.264–265. The stable compact-space cohomology calculations and primitive degrees are stated here.

### Explicit degreewise compact-dual stability

**Declaration:** `compactDual_stable_in_degree` · theorem · `BorelRegulators:R.3/compact-dual-degree-stability`.

For fixed q≥0, all three classical compact-dual systems occurring in the order system have stationary real cohomology in degrees ≤q once n≥2q+3. This is a uniform sufficient bound, not the sharp bound: each local matrix rank is at least n, and no unstable Euler or top-degree class occurs in that range. The stable generators and block pullbacks agree under these identifications.

**Hypotheses.** n is the rank over D, rather than the absolute matrix size ne; quaternionic D has even e.

**Construction or proof.** Read the finite-rank exterior generators in Borel §10.6 and the classical fibration filtration. Use the conservative bound on all local matrix sizes to remove each unstable generator in degree ≤q. Apply R.2 block naturality to identify the chosen maps.

**Dependencies.** `BorelRegulators:R.3/compact-dual-cohomology`, `BorelRegulators:R.2/block-comparison-naturality`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`.

**Acceptance.** For q=3 the complex generator survives and the real/quaternionic factors contribute zero. The bound is labelled sufficient; no claim of sharpness is made.

**Source.** [Armand Borel, Stable real cohomology of arithmetic groups](https://www.numdam.org/item/ASENS_1974_4_7_2_235_0.pdf), §§10.1 and 10.6, pp.263–265. The source uses stationarity in each degree, not an ungraded inverse limit.

### Borel’s arithmetic stable-range comparison

**Declaration:** `arithmeticComparison_stableRange` · theorem · `BorelRegulators:R.3/arithmetic-stable-range`.

For O an order in a central division algebra D over a number field F, n≥2 and q≥0 with 4q<n−1, the invariant-form map j_{Γ_n}:H^q(g_n,k_n;R)→H^q(SL_n(O);R) is an isomorphism. The general source theorem is injectivity for q≤c(G_n) and surjectivity for q≤min(c(G_n),m(G_n(R))). Borel’s root/curvature estimates give min(c,m)≥[(rank_Q G_n)/4]′, where [x]′ is the greatest integer strictly less than x, and rank_Q G_n=n−1. The strict inequality in the displayed usable bound is intentional.

**Hypotheses.** The AF.1a analytic complexes and ALS.2 compactification/descent are supplied with the logarithmic-growth and L² interfaces requested below.

**Construction or proof.** Use the Borel–Serre boundary coordinates and logarithmic-growth fine resolution in Borel §§4–7; the square-integrability criterion uses positive unipotent weights. Use Matsushima’s curvature estimate and Borel Theorem 7.5 for the finite-quotient invariant source. Apply §§9.3–9.5 rank estimates and the strict-floor convention to obtain 4q<n−1.

**Dependencies.** `BorelRegulators:R.2/arithmetic-invariant-form-map`, `BorelRegulators:R.1/order-arithmetic-system`, `ArithmeticLocallySymmetricSpaces:ALS.2`, `AutomorphicFormsOnReductiveGroups:AF.1a`.

**Acceptance.** For q=2, n≥10 is a sufficient arithmetic comparison range. Replacing 4q<n−1 by 4q≤n−1 changes boundary cases and is not accepted without a sharper proof.

**Source.** [Armand Borel, Stable real cohomology of arithmetic groups](https://www.numdam.org/item/ASENS_1974_4_7_2_235_0.pdf), Theorem 7.5, §§9.3–9.5 and §11.5, pp.258,262,266–267. Combines the actual arithmetic map, its two bounds, and the explicit rational-rank lower estimate.

### Stable cohomology of division-order arithmetic groups

**Declaration:** `arithmeticCohomology_stableExterior` · theorem · `BorelRegulators:R.3/stable-arithmetic-exterior`.

For Γ∞=colim_n SL_n(O), H*(Γ∞;R) is the graded exterior algebra with r1 independent generators in every degree 4a+1 (a≥1) and r2 independent generators in every degree 2a+1 (a≥1). The comparison is compatible with block-sum Hopf structures. Each cohomological degree is finite-dimensional and stationary; the inverse limit is taken degree by degree and then summed as a graded algebra, not as a completed product across degrees.

**Hypotheses.** O any order in a central division algebra over F; r1 and r2 are the signature of F, independent of archimedean ramification of D.

**Construction or proof.** Choose n satisfying both R.3 arithmetic comparison and compact-dual degree stability. Apply the real/quaternionic/complex compact-dual rings and Künneth from AT.6. Group homology commutes with filtered unions; take the degreewise finite-dimensional dual to identify the graded cohomology limit as in Borel Theorem 11.1.

**Dependencies.** `BorelRegulators:R.3/compact-dual-degree-stability`, `BorelRegulators:R.3/arithmetic-stable-range`, `BorelRegulators:R.2/stable-hopf-compatibility`, `mathlib:ExteriorAlgebra`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

**Acceptance.** In degree 9, possible decomposable terms must be separated from the generator space; rank counts indecomposables.

**Source.** [Armand Borel, Stable real cohomology of arithmetic groups](https://www.numdam.org/item/ASENS_1974_4_7_2_235_0.pdf), Theorem 11.1 and §11.5, pp.265–267. The arithmetic sequence satisfies the comparison hypotheses and yields the stable exterior algebra.

### Stable SL and GL primitive comparison

**Declaration:** `stableGL_SL_primitiveComparison` · theorem · `BorelRegulators:R.3/gl-sl-primitive-comparison`.

For O as above and i≥2, the stable elementary-group plus model and BGL(O)+ have the same rational higher-homotopy primitive contribution. The determinant/reduced-norm quotient contributes the K1 component and degree-one classes; it does not add primitive generators in degrees i≥2. Under the K.2 plus/Q comparison, K_i(O)⊗R identifies with primitive degree-i homology of the stable arithmetic system computed by SL, with its stable block-sum structure.

**Hypotheses.** Use the stable perfect elementary subgroup and the connected homotopy-associative K-space supplied by K.2/H.3/H.4. The assertion is about higher primitive homology, not equality of the full SL and GL cohomology rings.

**Construction or proof.** Import the elementary-subgroup perfectness and the map-level plus/Q comparison from K.2. Use stabilization to identify the higher plus-space homotopy and remove the determinant/K1 quotient in degree one. Apply H.3 connected H-space rational Hurewicz and its naturality with block multiplication.

**Dependencies.** `BorelRegulators:R.3/stable-arithmetic-exterior`, `GeneralAlgebraicKTheory:K.2`, `StableHomotopyKTheory:H.3`, `StableHomotopyKTheory:H.4`.

**Acceptance.** For i=1 the statement is not asserted; real units can contribute there.

**Source.** [Armand Borel, Stable real cohomology of arithmetic groups](https://www.numdam.org/item/ASENS_1974_4_7_2_235_0.pdf), §12.1, pp.270–271. Quillen’s plus construction connects stable arithmetic homology to higher K-homotopy.

### Rational Hurewicz and arithmetic indecomposables

**Declaration:** `arithmeticK_rationalHurewicz` · theorem · `BorelRegulators:R.3/cartan-serre-application`.

For the connected homotopy-associative arithmetic K-space, the Cartan–Serre rational Hurewicz theorem identifies π_i⊗R with primitive H_i for i≥2. Finite-dimensional degreewise duality identifies (primitive H_i)∨ with QH^i=H^{>0}/(H^{>0})² in degree i. Consequently the dimension of K_i(O)⊗R equals the number of exterior generators in degree i, without assuming integral finite generation.

**Hypotheses.** The imported H.3 theorem handles connected simple H-spaces and nonzero π1; ordinary simply connected Hurewicz is insufficient.

**Construction or proof.** Apply the requested connected H-space Cartan–Serre theorem, including the harmless degree-one factor. Use the Hopf compatibility already established in R.2. For an exterior Hopf algebra, quotient positive cohomology by decomposable products and count its generators.

**Dependencies.** `BorelRegulators:R.3/gl-sl-primitive-comparison`, `BorelRegulators:R.2/stable-hopf-compatibility`, `StableHomotopyKTheory:H.3`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

**Acceptance.** Finite generation of K_i(O) is absent from the rank proof’s prerequisites.

**Source.** [Armand Borel, Stable real cohomology of arithmetic groups](https://www.numdam.org/item/ASENS_1974_4_7_2_235_0.pdf), §12.1–12.2, pp.270–271. The argument reads higher homotopy from the primitive/indecomposable stable Hopf algebra.

### Borel’s rank theorem for division-algebra orders

**Declaration:** `divisionOrder_borelRank` · theorem · `BorelRegulators:R.3/division-order-rank-period`.

For any order O in a finite-dimensional central division algebra over a number field F and i≥2, dim_R(K_i(O)⊗_Z R) is 0 if i≡0 or 2 mod4, r1+r2 if i≡1 mod4, and r2 if i≡3 mod4. In particular the answer is independent of the degree and real ramification of D. No assertion about integral torsion or K1 is part of this theorem.

**Hypotheses.** O need not be maximal; its arithmetic SL system and genuine plus model meet the preceding comparisons.

**Construction or proof.** Combine R.3 arithmeticK_rationalHurewicz with the degreewise stable exterior algebra. Real and quaternionic factors each contribute one generator in degrees 5,9,…; complex factors contribute one in 3,5,…. Read the period-four pattern with the explicit lower cutoff i≥2.

**Dependencies.** `BorelRegulators:R.3/cartan-serre-application`, `mathlib:NumberField.InfinitePlace.nrRealPlaces`, `mathlib:NumberField.InfinitePlace.nrComplexPlaces`.

**Acceptance.** For F totally real the rank in degree 3 is zero; degree 5 has rank [F:Q].

**Source.** [Armand Borel, Stable real cohomology of arithmetic groups](https://www.numdam.org/item/ASENS_1974_4_7_2_235_0.pdf), Proposition 12.2, p.271. This is the precise generality and period-four endpoint, including nonmaximal orders.

### Borel’s odd K-group rank theorem

**Declaration:** `borelRankTheorem` · theorem · `BorelRegulators:R.3/borel-rank-theorem`.

For a number field F and j≥2, dim_Q(K_{2j−1}(O_F)⊗Q)=d_j(F), where d_j(F)=r1+r2 when j is odd and r2 when j is even. The rank of an abelian group means dimension after tensoring with Q; it does not by itself assert finite generation or discreteness of a regulator image. This is the reserved supplier of Polylogarithms:P.4/zagier-determinant.

**Hypotheses.** j≥2; O_F is the ring of integers of F.

**Construction or proof.** Specialize the division-order theorem to D=F, O=O_F and i=2j−1. Compare Q- and R-dimensions by scalar extension of a finite-dimensional rational vector space. Use the parity of j to distinguish i≡1 and 3 mod4.

**Dependencies.** `BorelRegulators:R.3/division-order-rank-period`, `mathlib:NumberField.InfinitePlace.nrRealPlaces`, `mathlib:NumberField.InfinitePlace.nrComplexPlaces`.

**Working API.**

- `borelRankTheorem_odd` (simp): If j≥2 is odd, dim_Q K_{2j−1}(O_F)⊗Q=r1+r2.
- `borelRankTheorem_even` (simp): If j≥2 is even, dim_Q K_{2j−1}(O_F)⊗Q=r2.
- `borelRankTheorem_scalarExtension` (compatibility): The Q-rank equals dim_R(K_{2j−1}(O_F)⊗R).
- `borelRankTheorem_order` (compatibility): The corresponding odd-rank statement holds for every commutative order in F by divisionOrder_borelRank, without an unproved integral K-isomorphism.
- `borelRankTheorem_sIntegers` (compatibility): After the N.3:ranks localization/finite-residue-field comparison, the same rational rank holds for O_{F,S} with S finite.

**Unit tests.**

- `borelRankTheorem_Q_two` (computation): dim_Q(K3(Z)⊗Q)=0.
- `borelRankTheorem_Q_three` (computation): dim_Q(K5(Z)⊗Q)=1.
- `borelRankTheorem_imaginary_quadratic` (computation): For [F:Q]=2, r1=0 and j≥2, the odd K-group rank is one.
- `borelRankTheorem_units_excluded` (non-example): The theorem cannot be applied at j=1: rank K1(O_F)=r1+r2−1.

**Consumers.** Polylogarithms:P.4/zagier-determinant: Fixes the number of regulator columns. ArithmeticKTheory:N.3:ranks: Supplies the O_F rational rank before localization. BorelRegulators:R.4: Matches the dimension of the conjugation target.

**Acceptance.** For F=Q, j=2 gives rank zero and j=3 gives rank one. For an imaginary quadratic F, every j≥2 gives rank one.

**Source.** [Armand Borel, Stable real cohomology of arithmetic groups](https://www.numdam.org/item/ASENS_1974_4_7_2_235_0.pdf), Proposition 12.2, p.271. The odd-degree formulation is a direct specialization of the proven rank theorem.

### S-integer and commutative-order rank comparisons

**Declaration:** `borelRank_sIntegers` · application · `BorelRegulators:R.3/s-integer-rank-import`.

For a commutative order A⊂F the period-four rational rank follows directly from Borel’s order theorem. For O_{F,S}, S a finite set of finite places, use N.3:ranks localization and torsion of positive K-groups of the finite residue fields to obtain K_i(O_F)⊗Q≅K_i(O_{F,S})⊗Q for i≥2. Hence the same odd rank formula holds. The integral groups and regulators of S-units in degree one are distinct statements.

**Hypotheses.** i≥2 and S finite; localization is imported, not reconstructed in R.3.

**Construction or proof.** Use the division-order rank theorem for A. Import the exact localization sequence and rational vanishing of finite-field groups from N.3:ranks. Tensor the exact sequence with Q and compare the relevant adjacent terms.

**Dependencies.** `BorelRegulators:R.3/borel-rank-theorem`, `BorelRegulators:R.3/division-order-rank-period`, `ArithmeticKTheory:N.3:ranks`.

**Acceptance.** The rank formula is not copied into a second independent N.3 proof.

**Source.** [Daniel Quillen; text prepared by Hyman Bass, Finite generation of the groups Ki of rings of algebraic integers](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/bass-seattle.pdf), §1, Remark (2) after Theorem 1, p.179. The finite-residue localization argument is the correct route to S-integers.

## R.4 — Regulator classes, maps and lattices

Construct the embedding-conjugation target and its reference measure first. The universal normalized continuous class is paired with genuine K-theory Hurewicz classes to obtain component maps, then assembled using conjugation parity. The arithmetic map is composition with localization from the ring of integers. Pullback and transfer use all embedding fibers; choosing a complex representative early would lose multiplicity or cancel the wrong components.

The alternating trace form fixes factorials, signs and the half-projection. Its relative representative and invariant absolute representative agree in cohomology rather than as pointwise cochains. The Pauli triple is a concrete normalization test. The real isomorphism needs a nonzero normalized primitive pairing as well as the rank theorem. Finite generation subsequently turns its arithmetic image into a discrete full lattice. Matrix determinants, determinant lines and covolumes are then transported through genuine coordinate maps, with the empty determinant equal to one.

### The embedding-conjugation regulator target

**Declaration:** `archimedeanTarget` · definition · `BorelRegulators:R.4/archimedean-target`.

For a number field F and j≥2 let Σ_F=Hom(F,C), R(q)=(2πi)^q R and V_j(F)=(∏_{σ∈Σ_F}R(j−1))^conj, where conj acts simultaneously on coefficients and embeddings. After dividing each component by (2πi)^{j−1}, identify this with the real submodule of functions f:Σ_F→R satisfying f(σ̄)=(−1)^{j−1}f(σ). This submodule formulation extends to any finite set with an involution and uses the native embedding involution.

**Hypotheses.** F number field; j≥2. The coefficient twist is part of the definition.

**Construction or proof.** Use the pinned finite embedding set and involutive_conjugate. Take the simultaneous fixed subspace; express it as a real submodule by the displayed coordinate equation. Identify coefficient R(j−1) with R through its specified generator.

**Dependencies.** `mathlib:NumberField.ComplexEmbedding.involutive_conjugate`, `mathlib:NumberField.InfinitePlace.mk_eq_iff`.

**Working API.**

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

**Consumers.** Burgos, Proposition 9.22: Assembles normalized complex regulators using simultaneous invariance. Polylogarithms:P.4/zagier-determinant: Specifies the real target before coordinate selection.

**Acceptance.** A real embedding contributes only if j is odd. Counting complex embeddings independently would double the target dimension.

**Source.** [José Ignacio Burgos Gil, The Regulators of Beilinson and Borel](https://www.icmat.es/miembros/burgos/files/brbr.pdf), Proposition 9.22 and Corollary 9.23, pp.84–85. The coefficient twist and embedding conjugation give the actual regulator target.

### Coordinates and integral reference lattice

**Declaration:** `targetCoordinates` · construction · `BorelRegulators:R.4/target-coordinates`.

Choose one complex embedding above each complex infinite place; real places have their unique real embedding. Let I_j(F) consist of all complex infinite places and the real infinite places only when j is odd. Evaluation at the chosen embeddings gives c_j:V_j(F)≃_R R^{I_j(F)}, with inverse reconstructing the conjugate coordinate by (−1)^{j−1} and putting zero at omitted real places. Define the reference Z-lattice c_j⁻¹(Z^{I_j}) and transport coordinate product Haar measure so that its covolume is one. The ambient Euclidean fixed-subspace metric is not the measure convention.

**Hypotheses.** The selection is explicit data; changing a complex representative changes its coordinate by (−1)^{j−1}.

**Construction or proof.** Use InfinitePlace.mk_eq_iff to split each embedding fiber into a singleton or conjugate pair. Define evaluation and reconstruction and prove both inverses. Use the native Z-span and lattice/covolume APIs; push coordinate volume through c_j.

**Dependencies.** `BorelRegulators:R.4/archimedean-target`, `mathlib:NumberField.InfinitePlace.mk_eq_iff`, `mathlib:IsZLattice`, `mathlib:ZLattice.covolume`.

**Working API.**

- `targetCoordinates_apply` (projection): The v-coordinate is evaluation at the selected embedding σ_v divided by the fixed Tate generator.
- `targetCoordinates_symm` (constructor): Reconstruction uses x_v at σ_v and (−1)^{j−1}x_v at σ̄_v, with zero at even-weight real places.
- `targetCoordinates_inverse` (equivalence): Evaluation and reconstruction are mutually inverse real linear maps.
- `targetCoordinates_change` (compatibility): Changing selected representatives gives a diagonal matrix with entries ±1 and absolute determinant one.
- `targetCoordinates_reference` (structure): The inverse image of Z^{I_j} is discrete, spans V_j and has covolume one for the transported coordinate measure.
- `targetCoordinates_ext` (extensionality): Agreement on the chosen coordinates determines a target element.

**Unit tests.**

- `targetCoordinates_pair_two` (computation): At weight two one exchanged pair has coordinate a and reconstruction (a,−a).
- `targetCoordinates_empty` (degenerate): For F=Q and j=2 the coordinate space is R^0 and the reference lattice has covolume one.
- `targetCoordinates_representative_switch` (compatibility): Switching the embedding of an imaginary quadratic field at j=2 multiplies the single coordinate by −1 and preserves its absolute covolume.

**Consumers.** BorelRegulators:R.4/regulator-covolume: Fixes the measure used for the covolume. BorelRegulators:R.7/extension-matrix: Provides computable matrices for coordinate-free maps.

**Acceptance.** Each conjugate pair has reference covolume one, not √2.

**Source.** [José Ignacio Burgos Gil, The Regulators of Beilinson and Borel](https://www.icmat.es/miembros/burgos/files/brbr.pdf), Proposition 9.22, p.85, including its lattice statement. The fixed product of Tate integer lattices determines the reference measure.

### Dimension of the conjugation target

**Declaration:** `archimedeanTarget_finrank` · theorem · `BorelRegulators:R.4/target-dimension`.

For every number field F and j≥2, dim_R V_j(F)=d_j(F)=r1+r2 if j is odd and r2 if j is even. The integral reference lattice has the same Z-rank. The proof uses conjugation-fixed real embeddings and one independent coordinate for each exchanged complex pair.

**Hypotheses.** r2 counts conjugate pairs, using the pinned InfinitePlace definition.

**Construction or proof.** Apply targetCoordinates and count I_j(F). Use the pinned real/complex-place cardinalities and embedding-fiber classification. Check that even-weight real coordinates vanish because a=−a over R.

**Dependencies.** `BorelRegulators:R.4/target-coordinates`, `mathlib:NumberField.InfinitePlace.nrRealPlaces`, `mathlib:NumberField.InfinitePlace.nrComplexPlaces`, `mathlib:NumberField.InfinitePlace.card_add_two_mul_card_eq_rank`.

**Acceptance.** For totally real F and j=2 the target dimension is zero.

**Source.** [José Ignacio Burgos Gil, The Regulators of Beilinson and Borel](https://www.icmat.es/miembros/burgos/files/brbr.pdf), Proposition 9.22 and the dimension discussion in §9.2. Simultaneous invariants have the stated signature-dependent dimension.

### The normalized universal Borel class

**Declaration:** `universalBorelClass` · construction · `BorelRegulators:R.4/universal-borel-class`.

For j≥2 and N in the classical stable range, Bo_j∈H_cont^{2j−1}(GL_N(C),R(j−1)) is Burgos’s Definition 9.24 class: suspend ch_j in H^{2j}(BGL_N(C),R(j)), restrict to U_N, identify invariant forms on U_N\(U_N×U_N), identify the same complex relative cochain with coefficients R(j−1), and apply inverse van Est. The twist generator and suspension normalization are fixed by ch_j=(2πi)^j pr_j/j!, with the integral Bott/Hurewicz normalization from topological K-theory. The class restricts compatibly with N and is primitive.

**Hypotheses.** GL_N(C) is a real Lie group; choose N odd ≥4j+1 as a sufficient classical stability bound.

**Construction or proof.** Import topological universal Chern character, suspension and its Bott normalization from RT.4:topological. Use the AF.1a invariant-form and relative Lie maps, keeping the Tate coefficient line. Use R.3 compact-dual primitive stabilization to show independence of N.

**Dependencies.** `AutomorphicFormsOnReductiveGroups:AF.1a`, `RefinedTraceMethods:RT.4:topological`, `BorelRegulators:R.3/compact-dual-cohomology`, `BorelRegulators:R.2/stable-hopf-compatibility`.

**Working API.**

- `universalBorelClass_stabilize` (functoriality): Block pullback Bo_j,N+1=Bo_j,N in the common stable range.
- `universalBorelClass_primitive` (structure): Block sum pulls Bo_j back to pr1*Bo_j+pr2*Bo_j.
- `universalBorelClass_conjugation` (compatibility): Complex conjugation and the Tate generator yield component parity (−1)^{j−1} on regulator values.
- `universalBorelClass_vanEst` (characterisation): Van Est sends Bo_j to the relative class obtained from the suspended normalized ch_j.
- `universalBorelClass_bott` (compatibility): The primitive compact-unitary pairing uses the Bott integral generator with ch_j, including its (j−1)! Hurewicz factor.

**Unit tests.**

- `universalBorelClass_stable_two` (compatibility): At j=2, block pullback from GL_11(C) to GL_9(C) gives the same degree-three class.
- `universalBorelClass_abelian_two` (degenerate): Restriction to GL_1(C) has zero degree-three continuous class.
- `universalBorelClass_chern_factor` (non-example): On indecomposables ch_3=(2πi)^3 c_3/2, so using c_3 without its factor cannot satisfy the normalization.

**Consumers.** Burgos, Theorem 10.9: Provides the universal class in the all-weight comparison. BorelRegulators:R.4/borel-regulator: Pairs with genuine K-theory Hurewicz classes.

**Acceptance.** Replacing ch_j by the Chern class c_j changes the normalization by the nontrivial factorial/sign on indecomposables.

**Source.** [José Ignacio Burgos Gil, The Regulators of Beilinson and Borel](https://www.icmat.es/miembros/burgos/files/brbr.pdf), Definition 9.24 and Remark 4.25, pp.86–87,31. Defines the universal renormalized class; the Chern character fixes factorial and Tate factors.

### Alternating trace representative

**Declaration:** `traceCocycle` · construction · `BorelRegulators:R.4/trace-cocycle`.

For j≥2 and m=2j−1, define Φ_m(X_1,…,X_m)=c_j∑_{s∈S_m}sgn(s)Tr(X_{s(1)}⋯X_{s(m)}), where c_j=(−1)^{j−1}(j−1)!/(2j−1)!, on complex square matrices. Regard the Lie algebra as real. The relative Borel representative is Φ_m(X_1†+X_1,…,X_m†+X_m); its absolute Lie cohomology class has invariant representative 2π_{j−1}Φ_m, with π_q(z)=(z+(−1)^q z̄)/2. These are equal as cohomology classes after relative-to-absolute inclusion, not pointwise as cochains.

**Hypotheses.** Finite matrix size N; trace and conjugate transpose are native Mathlib operations.

**Construction or proof.** Use the native finite permutation sign and matrix trace to define the alternating sum. Use trace cyclicity and conjugate transpose to verify real multilinearity, alternation and the coefficient-line condition. Apply Burgos Propositions 9.25–9.26 to the relative and invariant absolute representatives.

**Dependencies.** `mathlib:Matrix.trace_mul_comm`, `mathlib:Matrix.trace_conjTranspose`, `AutomorphicFormsOnReductiveGroups:AF.1a`, `BorelRegulators:R.4/universal-borel-class`.

**Working API.**

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

**Consumers.** Burgos, §10.4: Compares Borel and Beilinson representatives with exact scalar two. BorelRegulators:R.7: Supplies a discriminating small-matrix normalization test.

**Acceptance.** At j=2, Φ3(X,Y,Z)=−Tr(X[Y,Z])/2.

**Source.** [José Ignacio Burgos Gil, The Regulators of Beilinson and Borel](https://www.icmat.es/miembros/burgos/files/brbr.pdf), §9.7, Propositions 9.25–9.26, pp.87–89. The explicit alternating trace form gives the precise representative and factor two.

### The normalized Borel regulator

**Declaration:** `borelRegulator` · construction · `BorelRegulators:R.4/borel-regulator`.

For a number field F and j≥2 define r_Bo,F:K_{2j−1}(F)→V_j(F) by each σ:F→C: apply σ* on K-theory, the genuine plus-space Hurewicz map, continuous-to-discrete restriction of Bo_j, and the homology/cohomology pairing in R(j−1). Conjugation gives the simultaneous fixed-subspace condition. The reserved arithmetic map r_Bo,O_F:K_{2j−1}(O_F)→V_j(F) is composition with the localization map O_F→F. Burgos’s renormalized convention is used, not Borel’s original lattice convention.

**Hypotheses.** j≥2; localization and plus/Q comparison are actual maps supplied by K.2 and N.3:ranks.

**Construction or proof.** Pair the universal normalized class with the Hurewicz image for each embedding. Apply conjugation compatibility to assemble the coordinate-free target. Use block stabilization and arithmetic restriction naturality to prove independence of matrix size and compatibility with the arithmetic map.

**Dependencies.** `BorelRegulators:R.4/universal-borel-class`, `BorelRegulators:R.4/archimedean-target`, `BorelRegulators:R.2/arithmetic-restriction`, `GeneralAlgebraicKTheory:K.2`, `StableHomotopyKTheory:H.3`, `ArithmeticKTheory:N.3:ranks`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology`.

**Working API.**

- `borelRegulator_embedding` (projection): The σ-component equals r_Bo,C∘K(σ).
- `borelRegulator_add` (structure): r_Bo is an additive homomorphism; it kills every torsion element.
- `borelRegulator_integral` (compatibility): r_Bo,O_F=r_Bo,F∘K(O_F→F), and this localization is a rational isomorphism in degree 2j−1≥3.
- `borelRegulator_conjugation` (relation): In real Tate coordinates r_σ̄=(−1)^{j−1}r_σ.
- `borelRegulator_natural` (functoriality): For a field embedding f:F→E, r_E∘f*=pull_f∘r_F, with identity and composition laws.
- `borelRegulator_pairing` (characterisation): Pairing with Bo_j equals the corresponding component regulator on every genuine K-theory Hurewicz image.
- `borelRegulator_equiv` (functoriality): A number-field isomorphism gives the regulator square with the native reindexing of complex embeddings.

**Unit tests.**

- `borelRegulator_Q_two` (degenerate): r_Bo:K3(Z)→V2(Q) is zero because the target is zero.
- `borelRegulator_torsion` (characterisation): For any nonzero integer a with a·x=0, r_Bo(x)=0.
- `borelRegulator_imaginary_conjugate` (compatibility): At weight two over an imaginary quadratic F the two components are (a,−a), not (a,a).

**Consumers.** Polylogarithms:P.4/zagier-determinant: Uses exactly this reserved map and normalization for its determinant. BorelRegulators:R.5: Supplies the arithmetic regulator lattice. BorelRegulators:R.7: Compares with the Deligne/Beilinson regulator.

**Acceptance.** This construction alone does not assert a lattice or finite generation.

**Source.** [José Ignacio Burgos Gil, The Regulators of Beilinson and Borel](https://www.icmat.es/miembros/burgos/files/brbr.pdf), Definitions 9.19,9.24 and Proposition 9.21, pp.84–86. The number-field map is assembled from the universal complex-field regulator and its fixed target.

### Embedding pullback and trace on targets

**Declaration:** `embeddingPullTrace` · construction · `BorelRegulators:R.4/embedding-pull-trace`.

For a finite extension f:F→E define pull_f:V_j(F)→V_j(E) by (pull_f x)_τ=x_{τ∘f}, and Tr_f:V_j(E)→V_j(F) by (Tr_f y)_σ=∑_{τ∘f=σ}y_τ. Both are real linear and preserve conjugation parity. Every complex embedding σ has exactly [E:F] extensions, hence Tr_f∘pull_f=[E:F]·id. Coordinate matrices are obtained only after targetCoordinates; they are not obtained by discarding the conjugate member of each fiber.

**Hypotheses.** F,E number fields and f a field embedding; coefficients use the same Tate generator.

**Construction or proof.** Use finite embedding fibers and conjugation-equivariance of restriction. Define precomposition and fiberwise sum, retaining all complex embeddings. Use the separable embedding-extension count from number-field embedding theory.

**Dependencies.** `BorelRegulators:R.4/archimedean-target`, `BorelRegulators:R.4/target-coordinates`, `mathlib:NumberField.ComplexEmbedding.involutive_conjugate`, `mathlib:AlgHom.card`.

**Working API.**

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

**Consumers.** BorelRegulators:R.4/regulator-transfer: States field-extension naturality and transfer with the correct embedding multiplicities. BorelRegulators:R.7/extension-matrix: Exports computational matrices.

**Acceptance.** For Q⊂an imaginary quadratic field at j=3, coordinate pullback is 1 and coordinate trace is 2.

**Source.** [José Ignacio Burgos Gil, The Regulators of Beilinson and Borel](https://www.icmat.es/miembros/burgos/files/brbr.pdf), Proposition 9.21 and the product target of Proposition 9.22. The componentwise embedding realization determines the specialization to pullback and trace; the trace identity is derived by counting embedding fibers.

### Regulator naturality and finite-extension transfer

**Declaration:** `borelRegulator_transfer` · theorem · `BorelRegulators:R.4/regulator-transfer`.

For a finite number-field extension f:F→E and j≥2, r_E∘f*=pull_f∘r_F and r_F∘f_*=Tr_f∘r_E on higher K-groups of fields, where f_* is restriction-of-scalars transfer. Thus r_F∘f_*∘f*=[E:F]r_F. The same formula for rings of integers uses their finite projective transfer and compatibility with localization; no unramified hypothesis is added to this field-level formula.

**Hypotheses.** Transfer is the genuine exact-category transfer, compatible with field localization; its embedding Mackey/base-change formula is requested from K.2.

**Construction or proof.** Apply component naturality for the pullback square. After extension to C, split E⊗_{F,σ}C as the product indexed by embedding extensions of σ. Use additivity of transfer and primitive pairing to sum those components.

**Dependencies.** `BorelRegulators:R.4/borel-regulator`, `BorelRegulators:R.4/embedding-pull-trace`, `GeneralAlgebraicKTheory:K.2`, `ArithmeticKTheory:N.3:ranks`.

**Acceptance.** An even-weight real target receives the sum of a conjugate pair, which is zero.

**Source.** [José Ignacio Burgos Gil, The Regulators of Beilinson and Borel](https://www.icmat.es/miembros/burgos/files/brbr.pdf), Proposition 9.21, pp.84–85. Embeddingwise factorization supplies the components; the transfer formula follows from the imported K-theory base-change and additivity interfaces.

### Higher Adams weights and product compatibility

**Declaration:** `borelRegulator_adams` · theorem · `BorelRegulators:R.4/regulator-adams-products`.

For a number field F, j≥2 and integer a≥1, r_j(ψ^a x)=a^j r_j(x) on rational K_{2j−1}(F). In the rational Adams decomposition, r_j vanishes on every weight w≠j. Its Deligne interpretation is the degree-one target H_D^1(F,R(j)); multiplication is compatible with higher Chern characters under the motivic/Deligne comparison. A product of two positive-degree higher K-classes landing in K_{2j−1}(F) has zero real regulator: one factor has positive even degree and is rationally zero by the field-rank theorem. Multiplication by a K0 class multiplies the regulator by its rank.

**Hypotheses.** Higher operations, higher Chern characters and multiplicative Deligne comparison are imported; K0 Adams operations alone do not suffice.

**Construction or proof.** Use S.6 higher Quillen/Hiller Adams operations and the weight-j universal Chern character compatibility requested from RT.4 and M.8. Pair the ψ-eigenclass with Hurewicz to obtain the a^j scaling. Use rational weight decomposition and a>1 to kill mismatched weights; use R.3 ranks and N.3:ranks localization to make the positive even-degree product factor rationally zero.

**Dependencies.** `BorelRegulators:R.4/borel-regulator`, `BorelRegulators:R.3/borel-rank-theorem`, `SchemeKTheoryOperations:S.6/quillen-hiller-operations`, `SchemeKTheoryOperations:S.6/operations-functoriality`, `SchemeKTheoryOperations:S.6/adams-product-compatibility`, `SchemeKTheoryOperations:S.6/field-weight-decomposition`, `RefinedTraceMethods:RT.4:topological`, `MotivicEtaleKTheory:M.8`, `ArithmeticKTheory:N.3:ranks`.

**Acceptance.** For a=2 and j=3 the scale is 8, not 4 or 2. The product statement concerns positive-degree factors; products with K0 ranks multiply the regulator by that rank.

**Source.** [Michael Rapoport, Comparison of the regulators of Beilinson and of Borel](https://ncatlab.org/nlab/files/Rapoport.pdf), §1, Chern character and regulator discussion, pp.171–175. The regulator comes from higher Chern characters; exact all-weight Adams compatibility is imported rather than inferred from K0.

### The real regulator isomorphism

**Declaration:** `borelRegulator_realIso` · theorem · `BorelRegulators:R.4/regulator-real-isomorphism`.

For F a number field and j≥2, the linear extension r_Bo,O_F⊗R:K_{2j−1}(O_F)⊗R→V_j(F) is an isomorphism. The same is true for K_{2j−1}(F)⊗R using localization. This is proved from the normalized primitive compact-dual pairing and arithmetic stable comparison, not merely from equality of source and target dimensions.

**Hypotheses.** No integral finite-generation hypothesis is used.

**Construction or proof.** Use R.3 rational Hurewicz and primitive arithmetic comparison. Use the normalized unitary primitive Chern-character pairing to identify one nonzero functional in each conjugation-allowed archimedean component. Apply R.3 rank and R.4 target dimension to the resulting full primitive pairing; import the localization rational isomorphism from N.3:ranks.

**Dependencies.** `BorelRegulators:R.4/universal-borel-class`, `BorelRegulators:R.4/borel-regulator`, `BorelRegulators:R.4/target-dimension`, `BorelRegulators:R.3/borel-rank-theorem`, `BorelRegulators:R.3/cartan-serre-application`, `ArithmeticKTheory:N.3:ranks`.

**Acceptance.** Nonzero primitive pairing is essential; a zero map between equal-dimensional spaces is excluded.

**Source.** [José Ignacio Burgos Gil, The Regulators of Beilinson and Borel](https://www.icmat.es/miembros/burgos/files/brbr.pdf), Corollary 9.8 and §§9.5–9.6, pp.78,82–85. Borel’s regulator has full real image; the renormalization preserves the real isomorphism.

### The arithmetic regulator image is a full lattice

**Declaration:** `borelRegulator_isZLattice` · theorem · `BorelRegulators:R.4/regulator-lattice`.

For F a number field and j≥2, let L_j=r_Bo(K_{2j−1}(O_F))⊂V_j(F) as a native Z-submodule. Arithmetic finite generation from N.3 and the real regulator isomorphism imply that K_{2j−1}(O_F)/tors is free of rank d_j, its induced regulator is injective, and L_j is discrete with real span V_j. Thus IsZLattice R L_j applies. Finite generation is explicitly needed here, though it was not needed for R.3 ranks.

**Hypotheses.** Integral finite generation is imported from N.3; torsion is killed by any homomorphism to a real vector space.

**Construction or proof.** Use the structure theorem for finitely generated abelian groups and r_j⊗R injectivity to identify the kernel as torsion. The image of an integral basis under a real linear isomorphism is a discrete full lattice. Package the native discrete-topology instance and IsZLattice span condition.

**Dependencies.** `BorelRegulators:R.4/regulator-real-isomorphism`, `BorelRegulators:R.4/borel-regulator`, `BorelRegulators:R.4/target-coordinates`, `ArithmeticKTheory:N.3:finite-generation`, `mathlib:IsZLattice`.

**Acceptance.** A finitely generated subgroup whose rank exceeds the ambient dimension can be nondiscrete; the real isomorphism prevents this.

**Source.** [José Ignacio Burgos Gil, The Regulators of Beilinson and Borel](https://www.icmat.es/miembros/burgos/files/brbr.pdf), Corollary 9.8 and Definition 9.19, pp.78,84. Full regulator image and the arithmetic lattice define the covolume only after finite generation.

### The regulator determinant line and matrix

**Declaration:** `regulatorMatrix` · construction · `BorelRegulators:R.4/regulator-determinant`.

Let A=K_{2j−1}(O_F)/tors, d=d_j, with an integral basis b and selected target coordinates c_j. Define the regulator matrix M_{v,a}=c_j(r_Bo(b_a))_v and the top exterior map det(r):Λ^d_R(A⊗R)→Λ^d_R V_j. Its value on b_1∧⋯∧b_d is det(M) times the coordinate orientation. A unimodular integral basis change U multiplies det(M) by det(U)=±1; its absolute value is intrinsic. For d=0 use the empty determinant 1.

**Hypotheses.** A is finite free from the arithmetic finiteness theorem; determinant-line objects use native exterior algebra rather than an unconstrained carrier.

**Construction or proof.** Pass the regulator through the torsion quotient and select its integral basis. Apply the native induced exterior-algebra map in top degree, or equivalently the universal alternating determinant form. Express this map in coordinate bases and prove the unimodular basis-change formula.

**Dependencies.** `BorelRegulators:R.4/regulator-lattice`, `BorelRegulators:R.4/target-coordinates`, `mathlib:ExteriorAlgebra`, `mathlib:ZLattice.covolume_eq_det`, `mathlib:LinearMap.toMatrix`.

**Working API.**

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

**Consumers.** Polylogarithms:P.4/zagier-determinant: Exports the regulator matrix and intrinsic determinant. BorelRegulators:R.7: Controls the factor-two determinant conversion.

**Acceptance.** Changing either basis can change the signed determinant, but not its absolute value.

**Source.** [José Ignacio Burgos Gil, The Regulators of Beilinson and Borel](https://www.icmat.es/miembros/burgos/files/brbr.pdf), Definition 9.19 and §9.4, pp.79–84. The determinant expression specializes the lattice covolume to the chosen primitive/reference basis.

### The normalized Borel regulator covolume

**Declaration:** `regulatorCovolume` · construction · `BorelRegulators:R.4/regulator-covolume`.

Define R_Bo,j(F)>0 as the native ZLattice.covolume of the arithmetic regulator image L_j with respect to the target measure transported from targetCoordinates. Equivalently R_Bo,j(F)=|det M| for any integral basis of K_{2j−1}(O_F)/tors. The reference fixed Tate integer lattice has covolume one. At d_j=0 set R_Bo,j(F)=1, agreeing with native zero-dimensional volume.

**Hypotheses.** The full-lattice result and its discrete topology are established, not implicit assumptions on an arbitrary image.

**Construction or proof.** Use regulator-lattice and the specified coordinate measure to specialize ZLattice.covolume. Apply the pinned covolume_eq_det theorem after coordinate transport. Use unimodular and representative-change formulas for independence.

**Dependencies.** `BorelRegulators:R.4/regulator-lattice`, `BorelRegulators:R.4/regulator-determinant`, `BorelRegulators:R.4/target-coordinates`, `mathlib:ZLattice.covolume`, `mathlib:ZLattice.covolume_eq_det`.

**Working API.**

- `regulatorCovolume_det` (compatibility): R_Bo,j=|det regulatorMatrix| under the selected coordinate measure.
- `regulatorCovolume_pos` (characterisation): The covolume is strictly positive for the proven full lattice.
- `regulatorCovolume_basis_independent` (relation): Every integral basis and every allowed representative selection gives the same positive value.
- `regulatorCovolume_scalar` (relation): For a nonzero real scalar λ, the image lattice of λr has covolume |λ|^{d_j}R_Bo,j.
- `regulatorCovolume_original` (compatibility): Relative to Borel’s original R′, R_Bo=(2π)^{d_j}R′ if j≢3 mod4, and R_Bo=(2π)^{d_j}2^{r1}R′ if j≡3 mod4.

**Unit tests.**

- `regulatorCovolume_zero_rank` (degenerate): For F=Q and j=2 the covolume is 1.
- `regulatorCovolume_rank_one_sign` (computation): For a rank-one matrix (a), the covolume is |a| and is unchanged by a↦−a.
- `regulatorCovolume_reference` (compatibility): The reference lattice Z^{I_j} has native coordinate covolume 1; no √2 per complex pair occurs.

**Consumers.** BorelRegulators:R.5/borel-zeta-proportionality: Gives the positive quantity rationally proportional to the zeta leading term. SpecialValuesBirchTate:B.8: Provides only the regulator normalization, not an integral torsion formula.

**Acceptance.** The convention includes the real-place correction 2^{r1} at j≡3 mod4 when comparing with Borel’s original covolume.

**Source.** [José Ignacio Burgos Gil, The Regulators of Beilinson and Borel](https://www.icmat.es/miembros/burgos/files/brbr.pdf), Definition 9.19 and Remark 9.20, p.84. The chosen renormalized lattice fixes the regulator covolume and its difference from the original one.

## R.5 — Dedekind zeta functions and leading terms

Use the existing Hecke/Tate continuation and functional equation, specialized to the trivial character. The native Dedekind L-series is identified with that continuation on Re(s)>1; its direct evaluation outside that half-plane is not the desired special value. The complex gamma factor in the adopted completion differs from the AL.1 convention by a factor π, which is kept explicitly alongside the discriminant.

Gamma poles at 1−j give the exact vanishing order d_j because the reflected completed value at j is nonzero. Normalize the leading term by its factorial. For the regulator relation, first prove the positive-integer primitive-period determinant theorem using the compact norm-one cycles and volume calculations of R.6. Only then use the functional equation and Burgos renormalization. The result is equality up to a positive rational factor. Computing that factor from torsion groups or dyadic corrections belongs to the integral special-value programme.

### Completed-zeta normalization comparison

**Declaration:** `completedZeta_convention` · comparison · `BorelRegulators:R.5/completed-zeta-conventions`.

Specialize the AL.1 completed Hecke L-function to the trivial idele-class character and compare its Re(s)>1 finite product with the pinned Dedekind L-series. Adopt Γ_R(s)=π^{−s/2}Γ(s/2), Γ_C(s)=2(2π)^{−s}Γ(s) and Λ_F(s)=|D_F|^{s/2}Γ_R(s)^{r1}Γ_C(s)^{r2}ζ_F(s). Since AL.1 uses L_C(s)=(2π)^{1−s}Γ(s)=πΓ_C(s), the adopted completion is |D_F|^{s/2}π^{−r2}Λ_AL(s,1). It satisfies Λ_F(s)=Λ_F(1−s), with only simple poles at 0 and 1. ζ_F here denotes the imported meromorphic continuation, which agrees with NumberField.dedekindZeta only in the convergence half-plane.

**Hypotheses.** F number field; D_F absolute discriminant in the positive power, although signed D is used in rational differential-form restriction of scalars.

**Construction or proof.** Use the native Euler-product equality to identify the finite factors on Re(s)>1. Apply the exact AL.1 archimedean factor and epsilon formulas, including the trivial-character root number one. Multiply by the discriminant and π constants and use uniqueness of meromorphic continuation.

**Dependencies.** `AutomorphicLFunctionsAndLocalFactors:AL.1/completed-hecke-l-function`, `AutomorphicLFunctionsAndLocalFactors:AL.1/archimedean-local-theory`, `AutomorphicLFunctionsAndLocalFactors:AL.1/hecke-l-functional-equation`, `AutomorphicLFunctionsAndLocalFactors:AL.1/global-epsilon-factor`, `AutomorphicLFunctionsAndLocalFactors:AL.1/tate-global-functional-equation`, `mathlib:NumberField.dedekindZeta`, `tauceti:TauCeti.dedekindZeta_eulerProduct_hasProd`.

**Acceptance.** The π per complex place is explicit; it must not become a hidden rational factor.

**Source.** [Armand Borel, Cohomologie de SLn et valeurs de fonctions zêta aux points entiers](https://www.numdam.org/item/ASNSP_1977_4_4_4_613_0.pdf), §1.4 and §6.4(3)–(5), pp.616,633. The negative-integer leading term is obtained using the functional equation, with the present exact gamma convention supplied by AL.1.

### The exact negative-integer vanishing order

**Declaration:** `dedekindZeta_vanishingOrder` · theorem · `BorelRegulators:R.5/zeta-zero-order`.

For F a number field and j≥2, ζ_F is holomorphic at s0=1−j and has exact vanishing order d_j=dim_R V_j(F). If j is odd, each real Γ_R factor and each complex Γ_C factor has a simple pole at s0, giving d_j=r1+r2; if j is even, only the complex factors have poles, giving d_j=r2. Λ_F(s0)=Λ_F(j) is finite and nonzero because ζ_F(j)>0. Thus no additional zero is possible. At a totally real field and j=2, ζ_F(−1) is finite and nonzero, not a pole.

**Hypotheses.** Use the continued zeta, j≥2, and the exact gamma pole/residue interfaces from AL.1.

**Construction or proof.** Use the Euler series positivity/nonvanishing at real j>1. Apply the functional equation to obtain a nonzero completed value at s0. Count the simple gamma poles and divide a nonzero holomorphic germ by their product.

**Dependencies.** `BorelRegulators:R.5/completed-zeta-conventions`, `BorelRegulators:R.4/target-dimension`, `AutomorphicLFunctionsAndLocalFactors:AL.1/archimedean-local-theory`, `tauceti:TauCeti.dedekindZeta_ne_zero_of_one_lt_re`.

**Acceptance.** For Q and j=2 the exact order is zero; for Q and j=3 it is one.

**Source.** [Armand Borel, Cohomologie de SLn et valeurs de fonctions zêta aux points entiers](https://www.numdam.org/item/ASNSP_1977_4_4_4_613_0.pdf), §1.4, p.616. The source lists the vanishing orders, which follow from the functional equation.

### The nonzero zeta leading coefficient

**Declaration:** `normalizedLeadingCoefficient` · definition · `BorelRegulators:R.5/zeta-leading-coefficient`.

For the holomorphic continued ζ_F at s0=1−j with d=d_j, define ζ_F*(1−j)=ζ_F^{(d)}(s0)/d!, equivalently the value g(s0) in the unique germ factorization ζ_F(s)=(s−s0)^d g(s) with g holomorphic and g(s0)≠0. It is also lim_{s→s0}ζ_F(s)/(s−s0)^d. The generic signature uses a native analytic function f, its complex iterated derivative and the proven exact order; specialization to ζ_F imports its continuation.

**Hypotheses.** F number field, j≥2; d is exact vanishing order, not an arbitrary exponent.

**Construction or proof.** Use the native analytic Taylor coefficient/iterated derivative at s0. Apply the exact-order factorization and removable-singularity limit. Use conjugation symmetry of the continued zeta to obtain a nonzero real coefficient.

**Dependencies.** `BorelRegulators:R.5/zeta-zero-order`, `mathlib:iteratedDeriv`.

**Working API.**

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

**Consumers.** BorelRegulators:R.5/borel-zeta-proportionality: Provides the nonzero leading term in the rational proportionality statement. Polylogarithms:P.4: Fixes what a special-value determinant compares to.

**Acceptance.** When d=0 it equals ζ_F(s0). The factorial cannot be dropped in exact comparison statements.

**Source.** [Armand Borel, Cohomologie de SLn et valeurs de fonctions zêta aux points entiers](https://www.numdam.org/item/ASNSP_1977_4_4_4_613_0.pdf), §6.4(3) and (5), p.633. The regulator statement uses the first nonzero coefficient, not an unnormalized derivative.

### Leading-term form of the functional equation

**Declaration:** `zetaLeading_functionalEquation` · theorem · `BorelRegulators:R.5/leading-term-functional-equation`.

Write A_F(s)=Γ_R(s)^{r1}Γ_C(s)^{r2} and a_{F,j}=lim_{s→1−j}(s+j−1)^{d_j}A_F(s), a nonzero real number determined by gamma residues. Then ζ_F*(1−j)=|D_F|^{j−1/2} A_F(j)ζ_F(j)/a_{F,j}. Consequently |ζ_F*(1−j)|∼_Q |D_F|^{1/2}π^{d_j−[F:Q]j}ζ_F(j), where ∼_Q means quotient in Q×. The integer factor |D_F|^{j−1}, signs, powers of 2 and factorials are rational factors; the exact formula retains them before taking proportionality.

**Hypotheses.** j≥2; completed-zeta convention and exact zero order fixed.

**Construction or proof.** Expand the gamma factors at s0 using AL.1 residues. Take the nonzero constant term of Λ_F(s)=Λ_F(1−s). Evaluate gamma values at integral/half-integral j to isolate π^{d_j−[F:Q]j}.

**Dependencies.** `BorelRegulators:R.5/zeta-leading-coefficient`, `BorelRegulators:R.5/completed-zeta-conventions`, `AutomorphicLFunctionsAndLocalFactors:AL.1/archimedean-local-theory`, `mathlib:riemannZeta_neg_nat_eq_bernoulli`.

**Acceptance.** For Q,j=2 the formula gives ζ(−1)=−1/12.

**Source.** [Armand Borel, Cohomologie de SLn et valeurs de fonctions zêta aux points entiers](https://www.numdam.org/item/ASNSP_1977_4_4_4_613_0.pdf), §6.4(4), p.633, interpreted as rational proportionality. The source suppresses rational factors; the formula here explains the discriminant exponent before suppression.

### Borel’s primitive-period determinant theorem

**Declaration:** `borel_positiveZetaPeriod` · theorem · `BorelRegulators:R.5/borel-positive-zeta-period`.

Let F have degree d, j≥2 and N odd with N−1>4d(2j−1). Let Y_N=SL_N(O_F)\SL_N(F⊗R), with the quotient orientation and coefficient conventions of Borel 1977. The top exterior product of the d algebraic primitive classes of degree 2j−1 maps to ζ_F(j) times the corresponding rational cohomology determinant line of Y_N, up to Q× (Theorem 5.5 with m=j−1). After passage through the compact-factor determinant splitting and the corrected restriction-of-scalars normalization, the compact-dual arithmetic indecomposable determinant is scaled, up to Q×, by |D_F|^{1/2}π^{−dj}ζ_F(j). Signed discriminant phases are handled by the 1980 erratum; this line comparison does not yet fix an integral K-basis.

**Hypotheses.** The specialized norm-one Tamagawa volumes and compact period cycles of R.6 are proved first; all determinant spaces here have their stated rational structures.

**Construction or proof.** Use R.6 compact anisotropic inner-form cycles and their nonzero primitive restrictions. Integrate the top invariant form; R.6 expresses the volume as the product ζ_F(2)…ζ_F(n). Perform Borel §5.5 induction on primitive wedge degree and split off compact-factor primitives in §6.2. Apply the corrected signed-discriminant identities in 5.4 and 6.2, retaining phase cancellation.

**Dependencies.** `BorelRegulators:R.6/compact-period-cycles`, `BorelRegulators:R.6/norm-one-volume`, `BorelRegulators:R.6/restriction-scalars-form`, `BorelRegulators:R.3/arithmetic-stable-range`, `BorelRegulators:R.3/compact-dual-cohomology`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

**Acceptance.** The period proof includes a nonzero-cycle argument; rationality of Haar measure alone does not prove regulator proportionality.

**Source.** [Armand Borel, Cohomologie de SLn et valeurs de fonctions zêta aux points entiers](https://www.numdam.org/item/ASNSP_1977_4_4_4_613_0.pdf), Theorems 5.5 and 6.2, pp.627–632. These are the period and indecomposable determinant statements, with their large-rank hypothesis. [Armand Borel, Errata-Corrigé: Cohomologie de SLn et valeurs de fonctions zêta aux points entiers](https://www.numdam.org/item/ASNSP_1980_4_7_2_373_0.pdf), p.373, corrections to 5.5(1),(4) and 6.2(5). The discriminant and i-power corrections are included.

### Borel’s regulator–zeta theorem

**Declaration:** `borelRegulator_zetaProportional` · theorem · `BorelRegulators:R.5/borel-zeta-proportionality`.

For a number field F and j≥2, R_Bo,j(F)∼_Q |ζ_F*(1−j)|, equivalently there exists q∈Q_{>0} with R_Bo,j(F)=q|ζ_F*(1−j)|. In Borel’s original homotopy-lattice convention R′_j∼_Q π^{−d_j}|ζ_F*(1−j)|. Burgos’s renormalization multiplies that covolume by (2π)^{d_j}, and by the additional rational factor 2^{r1} when j≡3 mod4. This removes the transcendental π discrepancy. No formula for q in terms of torsion orders or dyadic factors is asserted.

**Hypotheses.** j≥2; finite generation, full regulator lattice, analytic continuation and the primitive-period theorem are all established inputs.

**Construction or proof.** Use R.5 positive-zeta-period and Borel §6.4 to pass from rational cohomology determinant lines to the compact-dual homotopy reference lattice; integral bases differ by rational nonzero factors. Use the leading-term functional equation to identify the π^{−d_j} original covolume discrepancy. Apply the exact Burgos renormalization formula and take positive absolute values.

**Dependencies.** `BorelRegulators:R.5/borel-positive-zeta-period`, `BorelRegulators:R.5/leading-term-functional-equation`, `BorelRegulators:R.4/regulator-covolume`.

**Acceptance.** For Q,j=2, R=1 and |ζ*(−1)|=1/12 give a rational ratio 12. An integral Lichtenbaum torsion identity does not follow from this theorem.

**Source.** [Armand Borel, Cohomologie de SLn et valeurs de fonctions zêta aux points entiers](https://www.numdam.org/item/ASNSP_1977_4_4_4_613_0.pdf), §6.4(1)–(5), pp.632–633. Passes from the rational primitive determinant to the homotopy-normalized regulator and leading term. [José Ignacio Burgos Gil, The Regulators of Beilinson and Borel](https://www.icmat.es/miembros/burgos/files/brbr.pdf), Theorem 9.12 and Remark 9.20, pp.80,84. Fixes the original π discrepancy and its exact renormalization.

## R.6 — Compact cycles and the Bloch–Tamagawa interface

This layer is logically before the primitive-period theorem in R.5, although it is displayed after the analytic layer. Its proof route constructs an archimedean-split central division algebra of controlled degree, uses the specialized Tamagawa-number theorem for SL₁(D), evaluates finite local volumes, and applies strong approximation to obtain the archimedean quotient volume. The regular representation supplies compact cycles with nonzero primitive restrictions. Top-form integration then measures their periods.

The global Brauer sequence by itself constructs a class, not a degree-e division algebra. The precise splitting-degree input is requested from class field theory Part II. The complete primary proof of Weil's specialized Tamagawa theorem and Bloch's exact pairing definitions are source gaps. The verified Borel construction specifies the interface they must supply, including each discriminant, orientation and measure conversion. This gives concrete work for source closure without treating Bloch's assumption of Borel's conclusion as a proof.

### Archimedean-split division inner forms

**Declaration:** `exists_archimedeanSplitDivision` · theorem · `BorelRegulators:R.6/archimedean-split-division`.

For every number field F and integer e≥2 there exists a central division F-algebra D of dimension e² with D⊗_F F_v≅M_e(F_v) at every archimedean place. One explicit construction chooses e distinct finite places, assigns Brauer invariant 1/e at each and zero elsewhere, and uses the global sum-zero sequence. To conclude division degree exactly e, one needs a degree-e splitting extension or the number-field period=index theorem; exactness of the Brauer sequence alone is insufficient.

**Hypotheses.** The required cyclic splitting-field statement is the precise finite-place specialization used by Borel Lemma 2.2, not an unrestricted Grunwald assertion.

**Construction or proof.** Use CF.10 to obtain the Brauer class with the stated finitely supported local invariants. Import the requested degree-e splitting extension/period-index input from ClassFieldTheory Part II and restrict each invariant. Use the local invariant of order e and the degree-e splitting bound to force index e; archimedean invariants vanish.

**Dependencies.** `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`, `AdelicAlgebraicGroups:AA.1`.

**Acceptance.** For e=2 choose two finite invariants 1/2 and no real invariant; a quaternion algebra ramified at a real place fails the condition.

**Source.** [Armand Borel, Cohomologie de SLn et valeurs de fonctions zêta aux points entiers](https://www.numdam.org/item/ASNSP_1977_4_4_4_613_0.pdf), Lemma 2.2 and its proof, pp.617–618. The proof constructs the inner form and explicitly invokes the cyclic splitting-extension input.

### Tamagawa number of division norm-one groups

**Declaration:** `normOne_tamagawaNumber` · theorem · `BorelRegulators:R.6/norm-one-tamagawa`.

For a central division algebra D over a number field F, H=SL_1(D) is the simply connected inner form of SL_e, and its canonically normalized Tamagawa number is τ(H)=1. For the regulator period proof it suffices to know τ(H)∈Q×. This is a specialized theorem owned here; AA.2 supplies generic measure and quotient conventions and AA.3 supplies anisotropic compactness, but neither by itself computes τ(H).

**Hypotheses.** D has degree e≥2; use Weil’s Tamagawa normalization, including discriminant factor and all finite places.

**Construction or proof.** Import the generic Tamagawa quotient measure from AA.2 and identify SL_1(D) as the indicated simply connected inner form. Use Weil, Adèles and Algebraic Groups, Theorem 3.3.1, as explicitly invoked by Borel Proposition 2.4. The complete proof passage remains a source-access gap. Keep the weaker rational-nonzero consequence explicit, so the period theorem does not pretend to prove τ=1 from finite volume.

**Dependencies.** `AdelicAlgebraicGroups:AA.1`, `AdelicAlgebraicGroups:AA.2`, `AdelicAlgebraicGroups:AA.3`.

**Acceptance.** Changing one local measure without the compensating product normalization changes τ and invalidates τ=1.

**Source.** [Armand Borel, Cohomologie de SLn et valeurs de fonctions zêta aux points entiers](https://www.numdam.org/item/ASNSP_1977_4_4_4_613_0.pdf), Proof of Proposition 2.4, p.619, citing Weil Theorem 3.3.1. The cited specialized Tamagawa theorem is indispensable; its proof is not present in Borel’s paper.

### Good finite-place special-linear volumes

**Declaration:** `specialLinear_localVolume` · theorem · `BorelRegulators:R.6/local-sl-volume`.

At a good finite place v where H is split with integral model SL_e and residue field of cardinality q_v, the algebraic differential-form measure normalized as in AA.2 gives μ_v(SL_e(O_v))=q_v^{−(e²−1)}#SL_e(F_{q_v})=∏_{a=2}^e(1−q_v^{−a}). At the finitely many exceptional places, compact-open volume with respect to an F-rational invariant form is a positive rational number. The finite product of exceptional volume ratios is therefore in Q_{>0}.

**Hypotheses.** q_v is a finite-field cardinality, e≥2; integral form is a generator at good places.

**Construction or proof.** Use smooth reduction of the good integral model and AA.2 local differential-form volume normalization. Count GL_e(F_q) by independent columns and divide by q−1 to count SL_e(F_q). Cancel q^{e²−1}; rationality at bad places is the local measure interface requested from AA.2.

**Dependencies.** `AdelicAlgebraicGroups:AA.1`, `AdelicAlgebraicGroups:AA.2`.

**Acceptance.** For e=2,q=2 the volume is 3/4. The product begins at a=2, so no divergent ζ_F(1) factor appears.

**Source.** [Armand Borel, Cohomologie de SLn et valeurs de fonctions zêta aux points entiers](https://www.numdam.org/item/ASNSP_1977_4_4_4_613_0.pdf), Proof of Proposition 2.4, p.619, local factor (2). The good-place volume is the inverse Euler factor product for a=2,…,e.

### Archimedean volume as a product of zeta values

**Declaration:** `normOne_archimedeanVolume` · theorem · `BorelRegulators:R.6/norm-one-volume`.

For an archimedean-split division algebra D of degree e≥2, H=SL_1(D), a nonzero F-rational invariant top form ω and any arithmetic Γ⊂H(F), μ_∞(H(F⊗R)/Γ)∼_Q∏_{a=2}^e ζ_F(a), with μ_∞ the discriminant-normalized positive archimedean measure from ω. H(A_F)/H(F) is compact. Taking Γ_U=H(F)∩(H_∞U), AA.4 strong approximation gives H(A_F)=H(F)H_∞U and τ(H)=μ_∞(H_∞/Γ_U)vol_f(U). Commensurable arithmetic groups change this volume by a positive rational index.

**Hypotheses.** H is anisotropic over F, simply connected and archimedean-split; H_∞ is noncompact, satisfying the strong approximation hypothesis outside the infinite places.

**Construction or proof.** Apply AA.3 anisotropic compactness and AA.4 strong approximation for this particular H. Use the specialized τ(H)=1 theorem and multiply the good-place volumes; exceptional-place factors are rational. Invert the Euler product and use commensurability indices to treat arbitrary Γ.

**Dependencies.** `BorelRegulators:R.6/archimedean-split-division`, `BorelRegulators:R.6/norm-one-tamagawa`, `BorelRegulators:R.6/local-sl-volume`, `AdelicAlgebraicGroups:AA.2`, `AdelicAlgebraicGroups:AA.3`, `AdelicAlgebraicGroups:AA.4`, `tauceti:TauCeti.dedekindZeta_eulerProduct_hasProd`.

**Acceptance.** For e=2 only ζ_F(2) occurs. The proof does not use R.5 regulator proportionality, avoiding a circular Tamagawa reformulation.

**Source.** [Armand Borel, Cohomologie de SLn et valeurs de fonctions zêta aux points entiers](https://www.numdam.org/item/ASNSP_1977_4_4_4_613_0.pdf), Proposition 2.4 and proof, pp.618–619. The archimedean quotient volume is the specialized zeta product, not a generic reduction-theory conclusion.

### Restriction-of-scalars form and discriminant normalization

**Declaration:** `restrictionScalarsForm` · construction · `BorelRegulators:R.6/restriction-scalars-form`.

Choose an ordered integral basis α_1,…,α_d and ordered complex embeddings σ_1,…,σ_d. Put δ_F=det(σ_i(α_a)), so δ_F²=D_F is the signed discriminant and (−1)^{r2}D_F>0. For an F-rational invariant q-form η define Rη=δ_F^{−q}∧_{σ∈Σ_F}ση on the restriction-of-scalars complex group. For a top form of F-dimension h, the associated positive archimedean Haar measure instead uses |D_F|^{−h/2}∏_{v|∞}|ω_v|. These signed algebraic and positive measure conventions are distinct and are related with their conjugate-pair orientation factors.

**Hypotheses.** δ_F≠0; embedding order and integral-basis orientation are recorded. Use the 1980 correction to the algebraic form.

**Construction or proof.** Use the separable embedding determinant and signed discriminant identity, imported from number-field embedding theory. Apply exterior multiplication to the transported q-forms and normalize by δ_F^q. For positive Haar volume take absolute differential-form measures and the positive discriminant factor prescribed by AA.2, retaining archimedean orientation phases until the determinant comparison.

**Dependencies.** `mathlib:ExteriorAlgebra`, `AdelicAlgebraicGroups:AA.1`, `AdelicAlgebraicGroups:AA.2`, `mathlib:NumberField.basisMatrix`, `mathlib:NumberField.discr_eq_basisMatrix_det_sq`, `mathlib:NumberField.sign_discr`.

**Working API.**

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

**Consumers.** Borel 1977, §§5.4–6.2: Tracks rational structures and archimedean phases in primitive determinant periods. BorelRegulators:R.6/norm-one-volume: Relates differential forms to positive quotient volume.

**Acceptance.** At an imaginary quadratic field δ is imaginary whereas |D|½ is positive; replacing one by the other loses an orientation phase.

**Source.** [Armand Borel, Cohomologie de SLn et valeurs de fonctions zêta aux points entiers](https://www.numdam.org/item/ASNSP_1977_4_4_4_613_0.pdf), §§1.5–1.6, pp.616–617. Defines restriction-of-scalars forms and the positive Haar convention. [Armand Borel, Errata-Corrigé: Cohomologie de SLn et valeurs de fonctions zêta aux points entiers](https://www.numdam.org/item/ASNSP_1980_4_7_2_373_0.pdf), p.373, first paragraph and definition of D½. Replaces the absolute discriminant by the signed embedding determinant in algebraic form normalization.

### Compact arithmetic period cycles

**Declaration:** `compactPeriodCycle` · construction · `BorelRegulators:R.6/compact-period-cycles`.

For an archimedean-split central division F-algebra D of degree e, choose a neat arithmetic Γ_D⊂SL_1(D)(F). The quotient Z_D=Γ_D\SL_1(D)(F⊗R) is a compact oriented manifold of real dimension [F:Q](e²−1). The left regular F-representation on D gives SL_1(D)→SL_{e²}; after a lattice choice and finite-index passage it maps Γ_D into SL_N(O_F) for every sufficiently large N. Its compact fundamental cycle defines a period functional on the ambient arithmetic cohomology. Pullback of each algebraic SL_N primitive generator of weight 2≤j≤e is e times the corresponding standard SL_e generator under the archimedean splitting, and the relevant top exterior pairing is nonzero.

**Hypotheses.** Choose N≥e² and large enough for the primitive-degree arithmetic comparison; torsion-free/neat descent is imported from ALS.2.

**Construction or proof.** Use the requested split division form and AA.3 compactness, then ALS.2 torsion-free finite-index passage. Use the left regular representation, whose determinant is reducedNorm^e, and choose a Γ-stable integral lattice. Apply native fundamental-class/integration pairing from AT.6; the regular representation is e copies of the standard representation at every split embedding, giving the nonzero primitive restriction.

**Dependencies.** `BorelRegulators:R.6/archimedean-split-division`, `BorelRegulators:R.6/norm-one-volume`, `BorelRegulators:R.3/compact-dual-cohomology`, `AdelicAlgebraicGroups:AA.1`, `ArithmeticLocallySymmetricSpaces:ALS.2`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

**Working API.**

- `compactPeriodCycle_fundamental` (data): Z_D has its integral fundamental class in top degree with the selected orientation.
- `compactPeriodCycle_map` (projection): The cycle map comes from the left regular representation followed by block inclusion.
- `compactPeriodCycle_primitive` (compatibility): For 2≤j≤e, pullback of the normalized algebraic primitive generator is e times the split standard generator.
- `compactPeriodCycle_integral` (characterisation): Pairing the normalized top invariant form with the cycle equals its finite quotient-volume integral.
- `compactPeriodCycle_cover` (functoriality): Passing to a subgroup of index a multiplies the pushed-forward fundamental class and top-form integral by a.
- `compactPeriodCycle_orientation` (relation): Reversing orientation negates the signed period and preserves the positive volume.

**Unit tests.**

- `compactPeriodCycle_degree_two` (computation): For e=2, left regular representation has F-dimension 4 and the weight-two primitive pullback factor is 2.
- `compactPeriodCycle_finite_cover` (compatibility): An index-two neat subgroup doubles the top period.
- `compactPeriodCycle_split_algebra_wrong` (non-example): Replacing division D by M_e(F) gives an isotropic group and does not supply the compact quotient used here.

**Consumers.** BorelRegulators:R.5/borel-positive-zeta-period: Provides the compact cycles and nonvanishing restriction needed for wedge induction. BorelRegulators:R.6/adelic-period-pairing: Connects top cohomological periods to finite-volume integrals.

**Acceptance.** A compact quotient without a nonzero primitive restriction would not prove the period theorem.

**Source.** [Armand Borel, Cohomologie de SLn et valeurs de fonctions zêta aux points entiers](https://www.numdam.org/item/ASNSP_1977_4_4_4_613_0.pdf), Proof of Theorem 5.5, pp.628–630. The compact inner-form cycles and primitive restrictions supply the nonzero periods used in the induction.

### Adelic primitive period pairing

**Declaration:** `adelicPeriodPairing` · construction · `BorelRegulators:R.6/adelic-period-pairing`.

For the compact cycle Z_D, a rational invariant top form η and compact-open U with Γ_D=H(F)∩H_∞U, define I_D(η,U)=∫_{Z_D}η using the chosen orientation. After the restriction-of-scalars normalization, its absolute value is the corresponding positive archimedean quotient volume. The product-measure equation |I_D(η,U)|vol_f(U)=τ(H) includes the explicit conversion from η to the AA.2 Tamagawa form. For primitive wedge forms this integral is the singular/de Rham cohomology pairing with [Z_D]. This is the specialized period interface needed in Bloch’s Tamagawa formulation.

**Hypotheses.** The top form is nonzero, the quotient is compact, and all local measure choices are made compatibly; the absolute value formula includes the conversion scalar.

**Construction or proof.** Use AT.6 fundamental-class integration and ALS.5 early Betti/de Rham comparison. Apply restrictionScalarsForm to express the form in the adopted Tamagawa normalization. Use normOne_archimedeanVolume and the adelic quotient product-measure equation.

**Dependencies.** `BorelRegulators:R.6/compact-period-cycles`, `BorelRegulators:R.6/restriction-scalars-form`, `BorelRegulators:R.6/norm-one-volume`, `AdelicAlgebraicGroups:AA.2`, `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

**Working API.**

- `adelicPeriodPairing_linear` (structure): I_D is linear in the top form for a fixed orientation and quotient.
- `adelicPeriodPairing_cohomology` (compatibility): For a closed top form, I_D equals the de Rham/singular pairing with the fundamental class.
- `adelicPeriodPairing_volume` (characterisation): After exact form-to-measure conversion, |I_D| is the positive archimedean quotient volume.
- `adelicPeriodPairing_local_rescale` (relation): Rescaling local measures by a_v, all but finitely many one, rescales the total measure by ∏a_v; the archimedean/finite product equation changes accordingly.
- `adelicPeriodPairing_cover` (functoriality): Finite cover of degree a multiplies the integral by a.

**Unit tests.**

- `adelicPeriodPairing_zero_form` (degenerate): The integral of the zero top form is zero.
- `adelicPeriodPairing_sign` (computation): Replacing η by −η negates I_D but leaves its absolute volume unchanged.
- `adelicPeriodPairing_rescale` (compatibility): Doubling one finite local measure doubles the finite product; the normalization equation cannot stay unchanged without its compensating global conversion.

**Consumers.** BorelRegulators:R.5/borel-positive-zeta-period: Turns compact cycle periods into zeta products. Bloch, first four lectures, exact passage pending: Requires comparison of Bloch’s independently specified pairing and measure conventions with this Borel interface.

**Acceptance.** Rational proportionality allows exceptional-place and commensurability factors; it does not allow losing a π or a discriminant square-root factor.

**Source.** [Armand Borel, Cohomologie de SLn et valeurs de fonctions zêta aux points entiers](https://www.numdam.org/item/ASNSP_1977_4_4_4_613_0.pdf), §§1.5–1.6, Proposition 2.4 and proof of 5.5. The finite-volume invariant-form integral is the concrete bridge between primitive periods and Tamagawa products.

### Bloch–Borel Tamagawa comparison

**Declaration:** `bloch_borelPairingComparison` · comparison · `BorelRegulators:R.6/bloch-borel-interface`.

Identify the primitive cohomology pairing and finite-volume integrals in Bloch’s first four lectures with the Borel adelicPeriodPairing after the exact local differential-form, discriminant and archimedean conversion. The required comparison is an equality of pairings and their measure-conversion scalars, followed by the already proved R.5 rational zeta proportionality; it is not an axiom that restates Borel’s conclusion. The exact Bloch-side definition and locator remain a source-access gap, so this node has a specified consumer interface but no claimed source-complete proof.

**Hypotheses.** An independently read primary version of Bloch’s first four lectures is required to instantiate this comparison.

**Construction or proof.** Read the exact Bloch primitive pairings and local forms; this step is explicitly open. Match the Borel side to adelicPeriodPairing and restrictionScalarsForm without importing generic AA theory a second time. Compose with R.5 proportionality only after the independently normalized pairing equality.

**Dependencies.** `BorelRegulators:R.6/adelic-period-pairing`, `BorelRegulators:R.6/restriction-scalars-form`, `BorelRegulators:R.5/borel-zeta-proportionality`.

**Acceptance.** An exact Bloch locator and its measure table are needed before this comparison can be closed.

**Source.** [Armand Borel, Cohomologie de SLn et valeurs de fonctions zêta aux points entiers](https://www.numdam.org/item/ASNSP_1977_4_4_4_613_0.pdf), §§2.4,5.5,6.4, pp.618–619,627–633. Supplies the verified Borel side; this citation does not establish the missing Bloch-side convention.

## R.7 — All-weight Beilinson comparison and tests

The universal equality is proved in every weight by comparing the Borel and Beilinson Lie representatives. The Beilinson calculation uses the first infinitesimal diagonal, Weil algebra and inverse Chern–Weil/van Est normalization. For the complex general-linear pair, relative-to-absolute injectivity allows equality of absolute classes to imply equality of relative classes. The resulting factor two transports through embeddings, localization and the homology pairing.

Weight two supplies an additional Bloch–Wigner test. Goncharov's read Dynkin-class coefficient is not yet a map-level identification of the selected Tate coordinate with the P.2 Bloch–Wigner and V.4 Suslin conventions. The exact scalar and sign remain a named gap. Zero-rank and imaginary-quadratic tests still follow from the independently established target, rank and lattice theorems. Extension matrices are exported together with the coordinate-free maps and their commuting squares.

### Injectivity for the complex general-linear relative class

**Declaration:** `complexGL_relativeToAbsolute_injective` · theorem · `BorelRegulators:R.7/relative-absolute-injectivity`.

For GL_N(C) as a real Lie group with maximal compact U_N, the relative-to-absolute Lie cohomology map H*(gl_N(C),u_N;R(j−1))→H*(gl_N(C);R(j−1)) is injective in the primitive range needed here. Under compact duality it is the pullback H*(U_N)→H*(U_N×U_N), sending each primitive generator to the difference of its two factor generators; this gives an explicit left inverse on the generated exterior subalgebra. Thus equality of the absolute images of Bo_j and Be_j determines equality of their relative classes.

**Hypotheses.** Use the GL_N(C) symmetric pair; no injectivity assertion is made for arbitrary relative Lie pairs.

**Construction or proof.** Use the requested compact-dual fibration and AT.5 Serre spectral sequence to identify the quotient U_N. Compute the two-factor primitive pullback and its left inverse by restricting one factor. Transport through AF.1a invariant-form comparison.

**Dependencies.** `AutomorphicFormsOnReductiveGroups:AF.1a`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-7-complexification-and-real-forms`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`, `BorelRegulators:R.3/compact-dual-cohomology`.

**Acceptance.** Equality of absolute representatives is used only with this injectivity input.

**Source.** [José Ignacio Burgos Gil, The Regulators of Beilinson and Borel](https://www.icmat.es/miembros/burgos/files/brbr.pdf), Definition 9.24, final paragraph, pp.86–87. The proof of the regulator comparison requires injectivity, not just equality after a potentially noninjective map.

### The infinitesimal Beilinson representative

**Declaration:** `beilinson_absoluteRepresentative` · theorem · `BorelRegulators:R.7/beilinson-infinitesimal-representative`.

For j≥2 and N stable, the universal Beilinson class Be_j determined by the M.8 higher Deligne Chern character has absolute Lie representative π_{j−1}Φ_{2j−1}, with π_q(z)=(z+(−1)^q z̄)/2. This uses the first infinitesimal diagonal of the simplicial classifying scheme, its differential-form normalization into the Weil algebra, the inverse Chern–Weil construction, and the explicit van Est identification. The normalized M.8 class is the higher Chern character, not the unscaled Chern class.

**Hypotheses.** Import the early Deligne/Chern-character construction separately from M.8’s downstream arithmetic analytic comparison; the required infinitesimal-diagonal/Weil interface is recorded as a supplier-extension gap.

**Construction or proof.** Use the M.8 universal Deligne Chern-character class and the first infinitesimal diagonal as in Burgos Lemma 10.10. Use Burgos §§8.2–8.3 normalization into the Weil algebra and inverse Chern–Weil/van Est comparison, supplied by the requested AF.1a extension. Apply Proposition 10.11 and check the half-projection convention exactly.

**Dependencies.** `MotivicEtaleKTheory:M.8`, `AutomorphicFormsOnReductiveGroups:AF.1a`, `RefinedTraceMethods:RT.4:topological`, `BorelRegulators:R.4/trace-cocycle`.

**Acceptance.** At j=2 the representative is π1Φ3, half the Borel absolute representative.

**Source.** [José Ignacio Burgos Gil, The Regulators of Beilinson and Borel](https://www.icmat.es/miembros/burgos/files/brbr.pdf), Theorems 8.12,8.15; Lemma 10.10 and Proposition 10.11, pp.68–72,98–100. The all-weight Beilinson representative is obtained from the infinitesimal diagonal, not extrapolated from a dilogarithm.

### Universal Borel–Beilinson comparison

**Declaration:** `borelClass_eq_two_beilinsonClass` · theorem · `BorelRegulators:R.7/universal-factor-two`.

For every j≥2 and N in the fixed classical stable range, Bo_j=2Be_j in H_cont^{2j−1}(GL_N(C),R(j−1)), with Burgos Definitions 9.24 and 10.8 and ch_j=(2πi)^j pr_j/j!. The equality is compatible with stabilization. Its proof compares the two explicit absolute Lie classes and then uses the proved relative-to-absolute injectivity and van Est; weight two is a test and is not the proof for other j.

**Hypotheses.** The selected Tate generators, suspension sign and Chern-character normalization are identical on both sides.

**Construction or proof.** Use R.4 absolute Borel representative 2π_{j−1}Φ and R.7 Beilinson representative π_{j−1}Φ. Apply the relative-to-absolute injectivity theorem. Transport by AF.1a inverse van Est and apply stabilization naturality.

**Dependencies.** `BorelRegulators:R.7/relative-absolute-injectivity`, `BorelRegulators:R.7/beilinson-infinitesimal-representative`, `BorelRegulators:R.4/trace-cocycle`, `BorelRegulators:R.4/universal-borel-class`, `AutomorphicFormsOnReductiveGroups:AF.1a`.

**Acceptance.** At j=3 the same scalar 2 holds; no guessed weight-dependent scalar is introduced.

**Source.** [José Ignacio Burgos Gil, The Regulators of Beilinson and Borel](https://www.icmat.es/miembros/burgos/files/brbr.pdf), Theorem 10.9 and proof, pp.98–100. This fixes the exact scalar for every weight under the adopted primary convention.

### Arithmetic regulator and covolume comparison

**Declaration:** `borelRegulator_eq_two_beilinsonRegulator` · theorem · `BorelRegulators:R.7/regulator-factor-two`.

Let r_Be,j be the M.8 Deligne regulator followed by the real Deligne-field identification H_D^1(F⊗R,R(j))≅V_j(F) using the same Tate coefficient coordinate. For j≥2, r_Bo,j=2r_Be,j on K_{2j−1}(F), and on K_{2j−1}(O_F) after localization. On rank d_j determinant lines det(r_Bo)=2^{d_j}det(r_Be), and R_Bo,j=2^{d_j}R_Be,j with the same reference measure. Therefore either covolume has the same rational zeta proportionality, with its rational factor scaled by 2^{d_j}.

**Hypotheses.** The Deligne-field identification is the actual quotient/projection C/R(j)≅R(j−1), and retains simultaneous conjugation invariants.

**Construction or proof.** Pull back the universal all-weight class equality along every complex embedding and pair with the genuine Hurewicz map. Use the M.8 field Deligne identification and R.4 arithmetic localization compatibility. Apply the determinant/covolume scalar formulas to the rank d_j arithmetic lattice.

**Dependencies.** `BorelRegulators:R.7/universal-factor-two`, `BorelRegulators:R.4/borel-regulator`, `BorelRegulators:R.4/regulator-determinant`, `BorelRegulators:R.4/regulator-covolume`, `MotivicEtaleKTheory:M.8`, `ArithmeticKTheory:N.3:ranks`.

**Acceptance.** For d_j=1 the covolume factor is 2; for d_j=2 it is 4; for d_j=0 it is 1.

**Source.** [José Ignacio Burgos Gil, The Regulators of Beilinson and Borel](https://www.icmat.es/miembros/burgos/files/brbr.pdf), Theorem 10.9 with Definitions 9.19 and 10.8. The universal comparison yields the map equality, and the determinant power follows by multilinearity.

### Exact Bloch–Wigner normalization test

**Declaration:** `borelRegulator_blochWigner_exact` · comparison · `BorelRegulators:R.7/weight-two-bloch-wigner`.

At j=2 compare the adopted r_Bo with the P.2 Bloch–Wigner homomorphism composed with the natural Suslin map K3(F)→B(F), and with the measurable homogeneous cocycle D(r(g0x,g1x,g2x,g3x)) for r(∞,0,1,z)=z. Determine the exact nonzero scalar λ_BW and orientation in the real Tate coordinate, and prove c_2(r_Bo(x))=λ_BW·D(Suslin(x)) for every complex place. Goncharov §5.4–5.5 fixes a Dynkin-class coefficient, but identifying its complex-to-real cohomology map and Suslin normalization with Burgos’s convention is still a precise gap. The existing P.2 up-to-rational statement is not silently read as an exact scalar in this Tate coordinate.

**Hypotheses.** No value of λ_BW is asserted until the map-level convention comparison is proved; the universal Borel–Beilinson scalar is independently fixed in every weight.

**Construction or proof.** Import the native P.2 measurable cocycle and K3BlochGroups V.4 natural Suslin/Hurewicz comparison. Use Goncharov equations (61),(64), Theorem 5.7 and the weight-two Grassmannian formula to compare with Φ3. Reconcile the real/Tate projection, measurable-to-continuous comparison and Suslin sign; this remaining step is the named normalization gap.

**Dependencies.** `BorelRegulators:R.4/trace-cocycle`, `BorelRegulators:R.4/borel-regulator`, `BorelRegulators:R.4/target-coordinates`, `BorelRegulators:R.7/universal-factor-two`, `Polylogarithms:P.2/weight-two-regulator`, `Polylogarithms:P.2/bloch-wigner-cocycle`, `K3BlochGroups:V.4/suslin-exact-sequence`, `K3BlochGroups:V.4/suslin-functoriality`.

**Acceptance.** The Pauli test Φ3=−2i detects a trace normalization error, but does not by itself identify the Suslin/Bloch–Wigner scalar.

**Source.** [Alexander B. Goncharov, Polylogarithms, regulators, and Arakelov motivic complexes](https://arxiv.org/pdf/math/0207036), §§5.4–5.5, equations (61),(64), Theorem 5.7, pp.41–46; introduction equation (11). The source fixes the Dynkin cohomology coefficient; an explicit convention comparison to the Burgos-normalized map remains required.

### Zero-rank and imaginary-quadratic regulator tests

**Declaration:** `borelRegulator_smallFields` · application · `BorelRegulators:R.7/number-field-small-cases`.

For Q and every even j≥2, V_j(Q)=0, the rational odd K-group is zero and its arithmetic regulator covolume is 1. For an imaginary quadratic F and j=2, V_2(F) is one-dimensional with components (a,−a); the arithmetic regulator image is a full rank-one lattice and changes sign when the selected embedding is conjugated. For F=Q(√−3), the Bloch class of ζ_6=(1+√−3)/2 has zero boundary because 1−ζ_6=ζ_6^{-1}, and its Bloch–Wigner value is positive at the upper-half-plane embedding. The exact numerical conversion to the adopted Borel coordinate uses the unresolved λ_BW test, while rank one and nonzero image follow independently from the real regulator isomorphism.

**Hypotheses.** j≥2; ζ_6 is tested in the rationalized Suslin/Bloch comparison, with the stated boundary convention.

**Construction or proof.** Use the pinned signature counts, R.3 rank theorem and R.4 target coordinates. Apply the full-lattice theorem for the imaginary-quadratic field. Use P.1 positivity and P.2 descent for ζ_6; keep its exact Borel coefficient linked to the weight-two normalization gap.

**Dependencies.** `BorelRegulators:R.3/borel-rank-theorem`, `BorelRegulators:R.4/target-coordinates`, `BorelRegulators:R.4/regulator-lattice`, `BorelRegulators:R.4/regulator-covolume`, `BorelRegulators:R.7/weight-two-bloch-wigner`, `Polylogarithms:P.1/bloch-wigner-positivity`, `Polylogarithms:P.2/bloch-wigner-descent`, `K3BlochGroups:V.4/suslin-exact-sequence`.

**Acceptance.** At Q,j=2 the zeta value is nonzero although the rational K3 rank is zero. At an imaginary quadratic field switching embedding changes orientation but preserves absolute determinant.

**Source.** [Charles A. Weibel, The K-book, Chapter VI: The Higher K-Theory of Fields](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.VI.pdf), §4, number-field regulator and signature discussion. The standard signature cases specialize the rank and regulator theorems; the concrete Bloch symbol uses the imported polylogarithm statements.

### Matrices of extension and trace

**Declaration:** `embeddingMatrices` · construction · `BorelRegulators:R.7/extension-matrix`.

For f:F→E finite and selected coordinates c_F,c_E, define P_f=c_E∘pull_f∘c_F⁻¹ and T_f=c_F∘Tr_f∘c_E⁻¹ as native real linear maps between finite coordinate function spaces and take their matrices in the standard bases. Entries sum the signed contributions of all complex embedding extensions, including conjugate representatives. Then T_f P_f=[E:F]I, coordinate matrices equal the coordinate-free maps, and they compose with extension/trace. For equal-dimensional target spaces their determinant relation is det(T_f)det(P_f)=[E:F]^{d_j}; for unequal dimensions this is a rectangular matrix relation, with no square determinant asserted.

**Hypotheses.** F,E number fields, j≥2, f finite; both coordinate selections are explicit.

**Construction or proof.** Use the proven coordinate equivalences and pull/trace formulas. Apply native LinearMap.toMatrix on the standard function-space bases. Transport identity, composition and trace-pull relation through the equivalences and native matrix multiplication.

**Dependencies.** `BorelRegulators:R.4/embedding-pull-trace`, `BorelRegulators:R.4/target-coordinates`, `BorelRegulators:R.4/regulator-transfer`, `BorelRegulators:R.7/regulator-factor-two`, `mathlib:LinearMap.toMatrix`.

**Working API.**

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
- `embeddingMatrices_switch_pair` (compatibility): Switching the selected Q(i) embedding at j=2 negates its coordinate maps, preserving the coordinate-free square.

**Consumers.** BorelRegulators:R.7: Tests extension/restriction determinants against actual coordinate-free maps. PeriodsAndSpecialValues: Supplies matrices with proved parity and conversion, rather than arbitrary arrays.

**Acceptance.** For Q⊂Q(i),j=3, P=(1), T=(2) and TP=(2).

**Source.** [José Ignacio Burgos Gil, The Regulators of Beilinson and Borel](https://www.icmat.es/miembros/burgos/files/brbr.pdf), Propositions 9.21–9.22 and Theorem 10.9. This computational interface is derived from the embeddingwise target and the already normalized map comparison.

## Pinned-library boundary

Mathlib is pinned at `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti is pinned at `f790474821cf4256814db967cb154e7af3d0c369`. Each declaration below was read at its pin. Existing structures are reused at their stated generality. In particular, continuous cohomology is an existing carrier, a lattice is a native discrete integral submodule, and an embedding is a native ring homomorphism. These facts do not supply a higher K-group or a universal Deligne regulator.

- `mathlib:CSA` in `Mathlib/Algebra/BrauerGroup/Defs.lean`: Finite-dimensional central simple algebras over a field, with Algebra.IsCentral, IsSimpleRing and FiniteDimensional instances. Division-algebra orders and reduced norms are additional arithmetic inputs.
- `mathlib:ExteriorAlgebra` in `Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean`: Exterior algebra of an R-module, the Clifford algebra for the zero quadratic form; it is not a graded cohomology comparison theorem.
- `mathlib:TopRep.homogeneousCochains` in `Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean`: The homogeneous continuous cochain complex of a topological representation, as a cochain complex in TopModuleCat.
- `mathlib:continuousCohomology` in `Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean`: Degree-n homology of TopRep.homogeneousCochains; continuous group cohomology with topological coefficients.
- `mathlib:ContinuousCohomology.cochainsMap` in `Mathlib/RepresentationTheory/Homological/ContCohomology/Functoriality.lean`: Restriction along a continuous homomorphism H→G and compatible continuous coefficient map res X→Y, by precomposition of cochains.
- `mathlib:ContinuousCohomology.cochainsMap_comp` in `Mathlib/RepresentationTheory/Homological/ContCohomology/Functoriality.lean`: The cochain map of composed continuous group and coefficient morphisms equals the composite of cochain maps, with the explicit restriction functor on coefficients.
- `mathlib:NumberField.ComplexEmbedding.involutive_conjugate` in `Mathlib/NumberTheory/NumberField/InfinitePlace/Embeddings.lean`: Complex conjugation is an involution on ring embeddings of a number field into C.
- `mathlib:NumberField.InfinitePlace.mk_eq_iff` in `Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean`: Two complex embeddings have the same infinite place iff they are equal or complex conjugate.
- `mathlib:NumberField.InfinitePlace.nrRealPlaces` in `Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean`: r1 is the finite cardinality of the subtype of real infinite places.
- `mathlib:NumberField.InfinitePlace.nrComplexPlaces` in `Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean`: r2 is the finite cardinality of the subtype of complex infinite places, counting pairs once.
- `mathlib:NumberField.InfinitePlace.card_add_two_mul_card_eq_rank` in `Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean`: For a number field F, r1+2r2=finrank Q F.
- `mathlib:IsZLattice` in `Mathlib/Algebra/Module/ZLattice/Basic.lean`: For a discrete Z-submodule L of a normed K-vector space, its K-linear span is the full space. The discreteness instance is a separate hypothesis.
- `mathlib:ZLattice.covolume` in `Mathlib/Algebra/Module/ZLattice/Covolume.lean`: Real covolume of a Z-submodule with respect to a specified additive Haar measure; defined as addCovolume.toReal.
- `mathlib:ZLattice.covolume_eq_det` in `Mathlib/Algebra/Module/ZLattice/Covolume.lean`: For a discrete full Z-lattice L⊂(ι→R), a finite integral basis b gives covolume L=|det(Matrix.of(inclusion∘b))| under coordinate volume.
- `mathlib:Matrix.trace_mul_comm` in `Mathlib/LinearAlgebra/Matrix/Trace.lean`: trace(AB)=trace(BA) for rectangular matrices over a commutative coefficient magma with additive commutative monoid structure.
- `mathlib:Matrix.trace_conjTranspose` in `Mathlib/LinearAlgebra/Matrix/Trace.lean`: trace(A conjugate-transpose)=star(trace A) for finite square matrices over a star additive monoid.
- `mathlib:NumberField.dedekindZeta` in `Mathlib/NumberTheory/NumberField/DedekindZeta.lean`: The Dedekind L-series of the sequence counting nonzero ideals by absolute norm. This definition alone does not provide continuation at negative integers.
- `tauceti:TauCeti.dedekindZeta_eulerProduct_hasProd` in `TauCeti/NumberTheory/ArithmeticDirichletSeries/EulerProduct/Analytic.lean`: For Re(s)>1, the height-one-prime Euler product converges to NumberField.dedekindZeta F s.
- `tauceti:TauCeti.dedekindZeta_ne_zero_of_one_lt_re` in `TauCeti/NumberTheory/ArithmeticDirichletSeries/EulerProduct/Analytic.lean`: For Re(s)>1 the Dedekind zeta L-series is nonzero, using the convergent Euler product; no statement outside that half-plane.
- `tauceti:TauCeti.ContCohomology.explicitH2IsoGroupCohomology` in `TauCeti/RepresentationTheory/Homological/ContCohomology/GroupCohomologyIso.lean`: For a discrete group and a topological additive coefficient group with continuous action, an additive equivalence from the explicit continuous H2 quotient to Mathlib discrete group cohomology. This supplies degree two, not an all-degree relative-Lie comparison.
- `mathlib:AlgHom.card` in `Mathlib/FieldTheory/PrimitiveElement.lean`: For a finite separable extension E/F and an algebraically closed F-algebra C, card(E→ₐ[F]C)=finrank F E. Giving C its F-algebra structure through a fixed embedding identifies this AlgHom set with the fiber of complex embeddings extending it.
- `mathlib:NumberField.basisMatrix` in `Mathlib/NumberTheory/NumberField/EquivReindex.lean`: The matrix of the chosen integral lattice basis under all complex embeddings, reindexed by the native embedding-to-basis equivalence. An arbitrary ordered integral basis gives the corresponding unimodular change of this matrix.
- `mathlib:NumberField.discr_eq_basisMatrix_det_sq` in `Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean`: The signed number-field discriminant, coerced to C, equals det(basisMatrix F)^2; the matrix uses the chosen integral basis and embedding indexing.
- `mathlib:NumberField.sign_discr` in `Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean`: The sign of the integer discriminant is (−1)^nrComplexPlaces F.
- `mathlib:LinearMap.toMatrix` in `Mathlib/LinearAlgebra/Matrix/ToLin.lean`: For specified bases of modules over a commutative semiring, linear maps are linearly equivalent to matrices indexed by the two bases. This is the matrix API used after genuine regulators and coordinate equivalences exist.
- `mathlib:riemannZeta_neg_nat_eq_bernoulli` in `Mathlib/NumberTheory/LSeries/HurwitzZetaValues.lean`: For k a natural number, the continued Riemann zeta at −k equals (−1)^k bernoulli(k+1)/(k+1). In particular ζ(−1)=−1/12.
- `mathlib:iteratedDeriv` in `Mathlib/Analysis/Calculus/IteratedDeriv/Defs.lean`: The n-th iterated derivative of a function between normed spaces over a nontrivially normed field, evaluated by iteratedFDeriv on the constant tuple 1; permits the native Taylor-coefficient prototype over C.

## Supplier contracts

Each stage reference below is used because no finer existing blueprint node supplies its full needed statement. The packet lists its exact consumers. Existing exact nodes for AL.1 continuation, S.6 higher operations, P.2 and V.4 are referenced directly. These contracts assign work to its owner; they are not additional local definitions.

### `AdelicAlgebraicGroups:AA.1`

Arithmeticity and restriction of scalars for central-division orders and projective full lattices, reduced norms and their matrix groups; the classification D_v=M_e(R), M_{e/2}(H) or M_e(C), rank_Q Res SL_n(D)=n−1, the simply connected inner form SL_1(D), integral models and stable lattice realizations of its left regular representation. These are specific specializations of the AA.1 algebraic/arithmetic group interface; reduced-norm/order inputs not covered there need an AA Part II extension.

Consumed by `BorelRegulators:R.1/order-arithmetic-system`, `BorelRegulators:R.6/archimedean-split-division`, `BorelRegulators:R.6/norm-one-tamagawa`, `BorelRegulators:R.6/local-sl-volume`, `BorelRegulators:R.6/restriction-scalars-form`, `BorelRegulators:R.6/compact-period-cycles`.

### `AdelicAlgebraicGroups:AA.2`

Canonical differential-form local and Tamagawa measures, including |D_F|^{−dim H/2} at infinity, smooth-good-model volume q^{−dim H}#H(F_q), positive rational compact-open volumes at finitely many bad places, local rescaling and commensurability laws, and the quotient product-measure equation when strong approximation gives one adelic double coset. No computation of τ(SL_1 D) is requested from generic AA.2.

Consumed by `BorelRegulators:R.6/norm-one-tamagawa`, `BorelRegulators:R.6/local-sl-volume`, `BorelRegulators:R.6/norm-one-volume`, `BorelRegulators:R.6/restriction-scalars-form`, `BorelRegulators:R.6/adelic-period-pairing`.

### `AdelicAlgebraicGroups:AA.3`

For the anisotropic inner form SL_1(D) with D division, compactness of H(A_F)/H(F) and compactness of H_∞/Γ for the arithmetic subgroups used in the period cycles, with compatible invariant quotient measures.

Consumed by `BorelRegulators:R.6/norm-one-tamagawa`, `BorelRegulators:R.6/norm-one-volume`.

### `AdelicAlgebraicGroups:AA.4`

Strong approximation for connected simply connected absolutely almost simple F-groups outside S when H(F_S) is noncompact, specialized to archimedean-split SL_1(D), so H(A_F)=H(F)H_∞U for every compact-open U and Γ_U=H(F)∩H_∞U.

Consumed by `BorelRegulators:R.6/norm-one-volume`.

### `ArithmeticLocallySymmetricSpaces:ALS.2`

Torsion-free normal/neat finite-index arithmetic subgroups, finite-type Borel–Serre quotient models, rational-building boundary, virtual cohomological dimension and INTEGRAL arithmetic duality with Steinberg and orientation modules (including the reductive central factor). Also boundary coordinates needed by the Borel logarithmic-growth/L² proof. A finite CW quotient alone does not give Steinberg-coefficient finiteness. Integral arithmetic duality is beyond the stated ALS.2 compactification target and belongs to its Part II extension.

Consumed by `BorelRegulators:R.1/steinberg-duality-finiteness`, `BorelRegulators:R.6/compact-period-cycles`, `BorelRegulators:R.3/arithmetic-stable-range`, `BorelRegulators:R.2/arithmetic-invariant-form-map`.

### `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality`

Early finite-level singular/Betti-to-de Rham comparison on torsion-free arithmetic quotients, naturality under group maps and finite covers, wedge/cup compatibility, and integration against fundamental cycles. Use ALS.5:finite-level-duality rather than the downstream automorphic comparison AS.5.

Consumed by `BorelRegulators:R.6/adelic-period-pairing`, `BorelRegulators:R.2/arithmetic-invariant-form-map`, `BorelRegulators:R.2/block-comparison-naturality`.

### `AutomorphicFormsOnReductiveGroups:AF.1a`

Relative Lie cochains for (g,k), smooth/continuous cohomology and van Est, functoriality in compatible maximal compacts, real/complex coefficient extension and cup products; all-degree continuous-to-discrete comparison for discrete arithmetic subgroups (the pinned explicit H2 theorem alone is insufficient). For R.3 supply the generic logarithmic-growth resolution, square-integrability and Matsushima curvature interfaces in AF Part II; R.3 proves Borel’s quantitative root/curvature bounds and the arithmetic comparison itself. For R.7 add the first-infinitesimal-diagonal/Weil-algebra normalization and inverse Chern–Weil/explicit van Est comparison of Burgos §§8.2–8.3 as an AF Part II extension.

Consumed by `BorelRegulators:R.7/relative-absolute-injectivity`, `BorelRegulators:R.7/beilinson-infinitesimal-representative`, `BorelRegulators:R.7/universal-factor-two`, `BorelRegulators:R.4/universal-borel-class`, `BorelRegulators:R.4/trace-cocycle`, `BorelRegulators:R.3/arithmetic-stable-range`, `BorelRegulators:R.2/arithmetic-restriction`, `BorelRegulators:R.2/arithmetic-invariant-form-map`, `BorelRegulators:R.2/block-comparison-naturality`.

### `StableHomotopyKTheory:H.3`

Genuine plus construction acyclic for the relevant local coefficients, perfect elementary subgroup case, homotopy invariance and Hurewicz naturality. Strengthen to connected homotopy-associative SIMPLE H-spaces: finite-type integral homology implies finite-type homotopy, and Cartan–Serre identifies rational higher homotopy with primitive homology despite nonzero π1; include the degree-one factor and degreewise finite duality. A simply connected-only Hurewicz statement is insufficient. The connected H-space theorem is a StableHomotopyKTheory Part II extension beyond the present H.3 plus-construction scope.

Consumed by `BorelRegulators:R.1/finite-type-plus-consequences`, `BorelRegulators:R.4/borel-regulator`, `BorelRegulators:R.3/gl-sl-primitive-comparison`, `BorelRegulators:R.3/cartan-serre-application`.

### `StableHomotopyKTheory:H.4`

Cofinal projective-module group completion with its actual connected homotopy-associative H-space structure, stable block-sum maps, Hopf compatibility and comparison to the genuine arithmetic plus space. Preserve π1=K1 and trivial π1 action; do not substitute a contractible or simply connected carrier.

Consumed by `BorelRegulators:R.1/finite-type-plus-consequences`, `BorelRegulators:R.3/gl-sl-primitive-comparison`, `BorelRegulators:R.2/stable-hopf-compatibility`.

### `GeneralAlgebraicKTheory:K.2`

Map-level plus/Q comparison for the actual K-groups, stable elementary subgroup perfectness and the SL/GL higher-primitive comparison; embeddings and exact-category restriction-of-scalars transfers, their additivity, embedding-fiber Mackey/base-change formula after tensoring to C, and compatibility with localization from rings of integers. Fields and O_E/O_F use finite projective transfer, not an unproved finite-étale formula at ramified primes.

Consumed by `BorelRegulators:R.1/quillen-finiteness-interface`, `BorelRegulators:R.1/finite-type-plus-consequences`, `BorelRegulators:R.4/borel-regulator`, `BorelRegulators:R.4/regulator-transfer`, `BorelRegulators:R.3/gl-sl-primitive-comparison`.

### `ArithmeticKTheory:N.3:finite-generation`

Own Quillen’s Q-category rank filtration, Jordan–Zassenhaus finiteness of projective classes for maximal orders, the relative homology formula with shifted Steinberg coefficients, stabilization and K_i(O) integral finite generation. Export the early Q rank-filtration interface independently of the final finite-generation theorem. R.1’s filtration-input node consumes that early interface; the final N.3 theorem consumes R.1 twisted arithmetic-group homology, avoiding a circular finite-type argument. For nonmaximal orders supply a separate order-comparison/finiteness argument; the maximal-order filtration alone is not that argument.

Consumed by `BorelRegulators:R.1/quillen-finiteness-interface`, `BorelRegulators:R.1/finite-type-plus-consequences`, `BorelRegulators:R.4/regulator-lattice`.

### `ArithmeticKTheory:N.3:ranks`

Localization for O_F→F and O_F→O_{F,S} for finite S, with rational vanishing of positive finite-residue-field K-groups, giving rational isomorphisms for i≥2. Import the reserved R.3 rank theorem rather than proving Borel ranks again; provide finite-projective transfer/localization naturality for O_E/O_F.

Consumed by `BorelRegulators:R.7/regulator-factor-two`, `BorelRegulators:R.4/borel-regulator`, `BorelRegulators:R.4/regulator-transfer`, `BorelRegulators:R.4/regulator-adams-products`, `BorelRegulators:R.4/regulator-real-isomorphism`, `BorelRegulators:R.3/s-integer-rank-import`.

### `MotivicEtaleKTheory:M.8`

An EARLY universal higher Deligne Chern-character and regulator construction with ch_j=(2πi)^j pr_j/j!, Adams weight j, product and embedding functoriality, the simplicial first-infinitesimal-diagonal realization and H_D^1(F⊗R,R(j))≅(∏R(j−1))^conj via the actual quotient C/R(j). It must be independent of Borel’s arithmetic/zeta comparison. Keep any LATE analytic special-value comparison downstream of R.5–R.7 to avoid a circular supplier.

Consumed by `BorelRegulators:R.7/beilinson-infinitesimal-representative`, `BorelRegulators:R.7/regulator-factor-two`, `BorelRegulators:R.4/regulator-adams-products`.

### `RefinedTraceMethods:RT.4:topological`

Universal complex topological K-theory and integral Bott generators, higher universal Chern characters, primitive suspension to U_N, the (j−1)! Hurewicz normalization and compatibility of genuine higher algebraic Adams operations with ψ^a(ch_j)=a^j ch_j. Existing ku/KU and K0 operations alone do not supply this interface; extend the topological stage as Part II where needed.

Consumed by `BorelRegulators:R.7/beilinson-infinitesimal-representative`, `BorelRegulators:R.4/universal-borel-class`, `BorelRegulators:R.4/regulator-adams-products`.

### `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology`

Augmented singular/simplicial chains with reduced degree −1, integral homology and equivariant functoriality of the building; genuine homology/cohomology pairing and commutation of group homology with filtered unions in fixed degree.

Consumed by `BorelRegulators:R.1/steinberg-module`, `BorelRegulators:R.1/solomon-tits`, `BorelRegulators:R.4/borel-regulator`, `BorelRegulators:R.3/stable-arithmetic-exterior`.

### `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`

Order/flag complexes, simplicial group actions and their CW realization, apartment CW filtrations and homotopy invariance used in Solomon–Tits. Import this topology; the division-building specialization is R.1.

Consumed by `BorelRegulators:R.1/division-building`, `BorelRegulators:R.1/solomon-tits`.

### `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`

Serre spectral sequence for compact classical-group and compact-dual fibrations including local coefficients, monodromy and transgression; integral Lyndon–Hochschild–Serre homology spectral sequence for a finite arithmetic quotient with finitely generated twisted coefficient groups.

Consumed by `BorelRegulators:R.1/steinberg-duality-finiteness`, `BorelRegulators:R.7/relative-absolute-injectivity`, `BorelRegulators:R.5/borel-positive-zeta-period`, `BorelRegulators:R.3/compact-dual-cohomology`, `BorelRegulators:R.3/compact-dual-degree-stability`.

### `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`

Graded cup/Künneth and Hopf/indecomposable constructions, oriented fundamental classes and de Rham integration pairing, finite-cover degree formulas and Poincaré duality; the compact-space cohomology calculations and the Borel arithmetic application are local to R.3/R.6.

Consumed by `BorelRegulators:R.6/compact-period-cycles`, `BorelRegulators:R.6/adelic-period-pairing`, `BorelRegulators:R.5/borel-positive-zeta-period`, `BorelRegulators:R.3/compact-dual-cohomology`, `BorelRegulators:R.3/stable-arithmetic-exterior`, `BorelRegulators:R.3/cartan-serre-application`, `BorelRegulators:R.2/stable-hopf-compatibility`.

### `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-7-complexification-and-real-forms`

Existing compact real forms and real-form complexifications are prerequisites. The additional symmetric-pair compact dual g_u=k⊕i p and homogeneous space K°\G_u, functorial under compatible block maps, and the identification for SL_n(R), SL_n(H), SL_n(C), require Lie groups, Part II; compact real form alone does not specify the quotient.

Consumed by `BorelRegulators:R.7/relative-absolute-injectivity`, `BorelRegulators:R.3/classical-compact-duals`.

### `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-9-the-cartan-iwasawa-and-kak-decompositions`

Cartan decomposition, maximal compact subgroups and their conjugacy for the classical real/complex/quaternionic factors; compatible choices along algebraic block maps and the invariant symmetric-space forms used by van Est.

Consumed by `BorelRegulators:R.1/order-arithmetic-system`, `BorelRegulators:R.3/classical-compact-duals`, `BorelRegulators:R.2/block-comparison-naturality`.

### `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`

Local Brauer invariant Br(F_v)≃Q/Z at finite places, split classes at all infinite places in the chosen construction, behavior under extension [L_w:F_v] and local invariant order for the division-algebra degree lower bound.

Consumed by `BorelRegulators:R.6/archimedean-split-division`.

### `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`

Global Brauer exactness with the sum-of-invariants constraint supplies the class with finite invariants 1/e,…,1/e and zero infinite invariants. The additional degree-e splitting extension required by Borel Lemma 2.2, or number-field period=index, is a Class field theory, Part II input; Brauer exactness alone proves no degree-e bound.

Consumed by `BorelRegulators:R.6/archimedean-split-division`.


## Source closure and extensions

All seven stages have target-level plans. Closure still requires the precise inputs below, along with the supplier contracts. In particular, the two reserved rank and regulator nodes are fully specified, while their genuine upstream carriers and comparisons remain imported.

### Missing canonical higher-object Lean interfaces

At the pinned commits no genuine higher K-group/plus-space comparison, relative Lie-cohomology carrier, compact-dual cohomology comparison, Deligne higher-regulator carrier or arithmetic group/order API is established by the reviewed audit. Suggested signatures for those objects are explicit mathematical comments with their exact names, hypotheses, API and test statements. Native embedding-parity submodules, trace forms, coefficient projections, generic linear matrices, lattice covolumes, discriminant scalars and analytic Taylor coefficients are elaborated against existing Mathlib. Replace each commented interface only after its owner exports the actual carrier and maps; no proposition-valued surrogate is supplied.

### Connected H-space and arithmetic finiteness supplier strengthening

H.3–H.4 and K.2 must supply the connected simple H-space rational Cartan–Serre theorem and genuine locally acyclic plus/projective-cofinal comparison requested above. N.3 and ALS.2 must supply integral Steinberg/orientation duality and the maximal-order Q rank filtration. Integral Steinberg duality belongs to ArithmeticLocallySymmetricSpaces Part II, and the connected H-space theorem to StableHomotopyKTheory Part II. Integral finite generation for nonmaximal orders is an additional N.3 task; it is not needed for Borel’s rational rank theorem.

### Symmetric-pair compact dual beyond existing Lie groups

LieGroups layer 7 supplies compact real forms, but does not state the Cartan-pair quotient K°\G_u and its functorial compact-dual cohomology map. Its Part II extension must give this exact construction, classical identifications and component invariants before R.3 closes.

### Degree-e splitting input beyond the global Brauer sequence

Read the special cyclic extension/splitting statement used in Borel 1977 Lemma 2.2 and place it in Class field theory, Part II, or import a proved number-field period=index theorem. It must force index exactly e for the constructed class with invariants of denominator e and zero archimedean invariants; global exactness by itself is insufficient.

### Primary proof of the specialized Tamagawa-number theorem

Borel 1977 Proposition 2.4 explicitly invokes Weil, Adèles and Algebraic Groups, Theorem 3.3.1 for τ(SL_1 D)=1. The IAS catalogue was accessible, but its full text and the Springer reprint proof were not. Read that proof or an exact open primary replacement for this specialized theorem, record hypotheses/normalization and decompose its nonroutine inputs before source closure. Merely finite positive volume cannot replace rationality of τ.

### Bloch first-four-lectures pairing convention

The AMS CRM 11 edition Higher Regulators, Algebraic K-Theory, and Zeta Functions of Elliptic Curves was identified, but no complete accessible copy of the first four lectures was obtained. Read their exact primitive pairing and local measure definitions, attach literal source locator(s), and prove their map-level equality and conversion scalars with adelicPeriodPairing. The Borel side is read and planned; no claimed Bloch proof is hidden in it.

### Early Chern/Weil interface and dependency boundary

RT.4 and M.8 must export universal higher Chern characters with Bott/Adams normalization, and AF Part II must export the first-infinitesimal-diagonal/Weil-algebra/Chern–Weil-to-van-Est comparison of Burgos §§8.2–8.3. Split early M.8 universal constructions from late arithmetic analytic comparison so that the latter can consume R.7 without a cycle. K0 Adams operations or a bare ku/KU spectrum are insufficient.

### Exact Bloch–Wigner to Burgos convention conversion

Determine λ_BW and sign by a map-level comparison of Goncharov equations (61),(64), Theorem 5.7, the P.2 measurable cocycle and the V.4 Suslin/Hurewicz map with Burgos’s Tate-normalized Φ3. Include the complex-to-real projection, cross-ratio orientation, and division by 2πi. The read Goncharov Dynkin coefficient and the Pauli calculation do not establish this final scalar on their own.


### Published correction

Use the chosen signed discriminant square root D^{1/2}=det(σ_i(α_a)) in those algebraic form normalizations and delete the specified i^{r2} factors. Positive Haar measure still uses |D|^{1/2}; other orientation phases are not all deleted. The embedding determinant squares to the signed discriminant. For Q(i) it is −2i with the stated ordered basis, whereas |D|^{1/2}=2 loses the algebraic phase. The correction is recorded as `BorelRegulators/E1` with its original and erratum locators.

### Part II boundaries

Lie groups, Part II: compact duals and invariant forms, following layers 7 and 9, owns g_u=k+i p, K°\G_u, component invariants and compatible block functoriality. R.3 owns only the classical stable cohomology and arithmetic application.

Class field theory, Part II: degree-controlled Brauer splitting, following layers 5 and 10, supplies the special degree-e cyclic splitting extension in Borel Lemma 2.2 or period=index. R.6 specializes it to archimedean-split division algebras.

Preserve RS-04 ownership. Extend AF as Part II for the infinitesimal-diagonal/Weil/Chern–Weil-to-van-Est interface; extend RT.4:topological for normalized primitive Chern/Bott/higher-Adams compatibility; separate M.8 early Deligne universal constructions from its late analytic comparison. Only the latter consumes R.5–R.7.

Arithmetic locally symmetric spaces, Part II: integral arithmetic duality, builds on ALS.2 and the topology duality infrastructure. It exports the finite-type virtual-duality theorem, orientation character and coefficient comparison. R.1 constructs the division-building Steinberg module and specializes the imported duality to prove twisted homology finiteness.

Stable homotopy and K-theory, Part II: rational connected H-spaces, follows H.3–H.4 and exports Cartan–Serre rational primitive Hurewicz and the finite-type integral homotopy theorem with the nonzero fundamental-group stage. K.2 supplies the actual arithmetic plus/group-completion carrier; R.3 applies the generic theorem to its computed Hopf algebra.


## Planets

The atlas shows the following definitions, constructions and named theorems, with at most six in each layer.

| Layer | Planets |
| --- | --- |
| R.1 | Arithmetic groups of orders; Spherical building; Steinberg module; Solomon–Tits theorem; Steinberg homology finiteness |
| R.2 | Arithmetic restriction |
| R.3 | Classical compact duals; Stable compact-dual cohomology; Borel stable-range theorem; Stable arithmetic cohomology; Borel rank theorem for orders; Borel rank theorem |
| R.4 | Archimedean regulator target; Regulator coordinates; Universal Borel class; Borel trace cocycle; Borel regulator; Regulator lattice |
| R.5 | Dedekind-zeta vanishing order; Zeta leading coefficient; Borel primitive-period theorem; Borel regulator theorem |
| R.6 | Archimedean-split division algebra; Norm-one Tamagawa number; Special-linear local volume; Norm-one quotient volume; Discriminant form normalization |
| R.7 | Beilinson infinitesimal comparison; Borel–Beilinson comparison theorem; Regulator covolume comparison; Regulator extension matrices |
