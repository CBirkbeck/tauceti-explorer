# Étale duality, cycle classes and perverse sheaves — EDC.0–EDC.3

This is the first part of the roadmap: coefficient and support interfaces, exceptional inverse image, smooth trace and purity, constructible biduality, Poincaré pairings, and cycle and Chern classes. The [packet](../packets/EtaleDualityAndPerverseSheaves--EDC.0.json) fixes the node identifiers and dependency graph; this reader states its mathematical targets, proofs, APIs and tests. The [suggested Lean file](../suggested/EtaleDualityAndPerverseSheaves--EDC.0.lean) proposes signatures against the pinned libraries. Nothing is claimed to be formalized.

The pass is complete at target level. All eight stages have planned coverage, with precise supplier contracts below. The four recorded gaps concern extensions outside these scheme-level targets. The [handoff](../handoff/BP-EtaleDualityAndPerverseSheaves--EDC.0~2.md) records validation and integration work.

## Ownership and imported foundations

The accepted RS-19 restructuring keeps these scheme-level targets with EDC. The generic stable enhancement, complex localization, replacements, adjoint functor theorem and coherent adjunction diagrams belong to EnhancedDerivedSheaves E1 and E3. EDC owns the geometric compactification diagram that lifts the imported compactly supported image to that enhancement.

The finite-coefficient six operations, constructible sheaves, Kummer sequence, proper and smooth base change, finiteness and adic realization are imported unchanged from CohomologicalPointCounting’s ConstructibleEtale, CompactSupport, EtaleBaseChange, EllAdicRealization and TraceFormula roadmap owners. SchemeAndStackFoundations SF.2 records their integration contracts in the atlas. Proposed upstream PR196 is an integration lead, not a result already merged on current upstream main. In particular SF.2’s coherent O-module duality is not a supplier of the étale Λ-module dualizing base. The elementary strict-trait Kummer and tame-inertia calculations are explicit finite-coefficient supplier requests; EDC owns the resulting dimension-one duality theorem.

Current [AlgebraicVectorBundles](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/AlgebraicVectorBundles) L0A–L0C supplies finite locally free sheaves, ranks, pullback, tensor, direct sums and duals. It postdates the atlas snapshot and is imported through the SF.0 integration contract. The pinned Tau Ceti already supplies invertible sheaves, their trivial object, line-bundle classes and their tensor commutative monoid. JacobianChallenge Layer A supplies the remaining Picard inverses, divisor and degree interfaces, and Layer D supplies the Jacobian. AbelianSchemesAndArithmeticModuli A3 supplies the Weil pairing. These objects are never reconstructed as EDC targets.

SF.5 supplies graded cycles, rational equivalence, Chow groups, Tor intersection and the moving lemma, projective bundles and normal deformation. Its projective-bundle convention parametrizes quotients. Apply it to E∨ to obtain the lines convention used here: P(E)=Proj Sym(E∨), O(−1)⊂π*E, and ξ=c₁(O(1)). This gives the all-plus Chern relation. The complete flag bundle is an iterated imported projective bundle, and EDC owns its cohomological freeness and Chern computations.

## Conventions and proof order

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed audit finds the EDC targets unbuilt; existing site, derived-category, scheme-morphism, invertible-sheaf and cycle carriers are reused. Current upstream main was also read at `cd03e06852a13216ad246d0623492c4beac39af2` to avoid duplicating later work.

D(X,Λ) is the unbounded derived category of sheaves of Λ-modules on the small étale site. Compactifiable means separated and finite type over a quasi-compact quasi-separated base, together with a Nagata compactification. Finite type includes quasi-compactness; separated and locally finite type alone do not suffice. The adjoint formalism uses torsion coefficients. Prime-to-residue-characteristic hypotheses enter the twists, smooth purity and constructible duality statements. For quasi-finite flat trace the morphism is of finite presentation.

Constructibility requires a finite locally closed stratification with finite lisse restrictions. Finite Tor amplitude is one uniform cohomological interval for all geometric stalks and all coefficient modules. Pointwise finite stalks alone do not establish constructibility. Ordinary duality is asserted over noetherian self-injective finite coefficients such as O/πᵐ. For arbitrary noetherian coefficients retain finite Tor dimension and derived Hom. Integral adic duality retains its Ext¹ term; rationalization gives the ordinary perfect pairing.

The cohomological shift is [q]. Geometric Frobenius acts on Λ(i) by q^(−i) over 𝔽_q. The trace is H_c^(2d)(X̄,Λ(d))→Λ, so the untwisted top group is Λ(−d). Over a regular dimension-one base S the chosen étale dualizing object is the constant Λ_S. It differs from the geometric dualizing object Λ(1)[2] of a smooth curve over a separably closed field. Never import a coherent dualizing O-complex for this calculation.

The proof order is EDC.0 → EDC.1:adjoint → EDC.2:trace-purity → EDC.1:biduality → EDC.2:pairings → EDC.3. EDC.1 and EDC.2 are collector stages, not an instruction to prove all of EDC.1 before any of EDC.2. Curve duality comes from the Jacobian and Kummer theory before general smooth purity or biduality. The latter uses only formal exchanges until evaluation has been proved.

Four proof comparisons determine the order:

1. On proper refinements of compactifications, the adjunction unit j!→Ru*j′! is an equivalence by proper base change. Form the cofiltered diagram in the imported enhancement before passing to its homotopy category. Common refinements give composition and square-pasting coherence from the same units and mates.
2. Define smooth purity as the adjoint of the canonical derived trace. Effacement and its derived factorization make the trace-augmented neighbourhood pro-system equivalent to the constant system. The Hom-colimit stalk formula identifies that specific adjoint as an isomorphism, resolving the disputed XVIII 3.2.3 identification.
3. Formal duality commutes with proper pushforward and carries evaluation to evaluation on the base. Apply this to the evaluation cone, use proper relative curves from an affine projection and induction on support dimension, then detect the remaining finite-support cone. Reverse exchanges are derived only afterwards.
4. Derive the projective-space basis by hyperplane localization and affine cohomology before projective-bundle freeness. For cycle descent use the weighted class of the graph closure in X×P¹; derived restrictions retain singular fibre multiplicities, and the two constant section pullbacks agree. Products have the Euler–Tor multiplicities. For self-intersection, purity identifies support cohomology on the normal deformation with cohomology of Z×A¹, whose fibre restriction maps are isomorphisms. This compares the immersion with the normal zero section without assuming an isomorphism of ambient nonproper fibre cohomology.

The Lean prototypes use actual scheme morphism predicates, finite stratifications, regular local rings, cohomology modules and graded cycle groups. Supplier data carriers and their comparisons are marked as imports. Excellence and the complete stable infinity-category conditions cannot yet be expressed with the pinned library; the reader retains them, while the suggested file follows PROTOCOL §13 by omitting unavailable conditions instead of inventing Prop placeholders. The file is a signature proposal, not a proof or a replacement for this document.

## EDC.0 — Coefficient, support and enhancement interfaces

Use Mathlib’s small étale site and derived category. Import the finite-level operations and their exact comparisons; the new work is the support interface, the coefficient and constructibility predicates, and the coherent lift of compact support needed by the adjoint construction.

### The étale derived category D(X, Λ) and its geometric stalks

Node `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category` · definition. Planet: Étale derived category D(X, Λ).

Let X be a scheme and Λ a commutative ring. The étale derived category is D(X, Λ) := the unbounded derived category of the Grothendieck abelian category Sh(X_ét, Λ) of sheaves of Λ-modules on Mathlib's small étale site X.smallEtaleTopology. Its full subcategories D⁺, D⁻, D^b are cut out by the canonical t-structure (cohomology sheaves ℋ^q K). For a geometric point x̄ : Spec Ω → X (Ω separably closed) the geometric stalk K ↦ K_x̄ : D(X, Λ) → D(Λ) is the derived functor of the exact fibre functor of the point pointSmallEtale x̄. Global cohomology is H^q(X, K) := Hom_{D(X,Λ)}(Λ_X, K[q]) and RΓ(X, −) is the right derived functor of global sections. When Λ is torsion with nΛ = 0, n invertible on X, D(X, Λ) is the finite-level coefficient category of SGA 4 XVII–XVIII written D(X, Λ) there; this node fixes the notation every node of this packet uses and adds no new category.

**Hypotheses.**

- X any scheme for the definition; quasi-compact quasi-separated wherever a compactifiable morphism or Rf_! appears.
- Λ a commutative ring; for the duality statements Λ is torsion with nΛ = 0 for an integer n invertible on X (SGA 4 XVIII 1.1.1).
- The site is Mathlib's small étale site; the big étale site is never used for coefficients.

**Construction and proof.**

- Take the abelian category Sheaf X.smallEtaleTopology (ModuleCat Λ); it is Grothendieck abelian by Mathlib's isGrothendieckAbelian_sheaf_smallEtaleTopology, so it has enough injectives and K-injective resolutions (EnhancedDerivedSheaves E1).
- Form Mathlib's DerivedCategory of it (HasDerivedCategory.standard); D⁺, D⁻, D^b are the usual subcategories for the canonical t-structure.
- The fibre functor of pointSmallEtale x̄ is exact on abelian sheaves (filtered colimit over étale neighbourhoods), so Functor.mapDerivedCategory gives the triangulated stalk functor; conservativity of the family of geometric stalks follows from isConservativeFamilyOfPoints_pointSmallEtale' and exactness (a complex is acyclic iff all its stalks are).
- H^q(X, F) for a sheaf F agrees with Ext^q(Λ_X, F), which for Λ = ℤ is Mathlib's Sheaf.H.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.EtaleDuality.EtaleSheaf` | data | EtaleSheaf Λ X := Sheaf X.smallEtaleTopology (ModuleCat Λ), the abelian category of étale sheaves of Λ-modules. |
| `TauCeti.EtaleDuality.EtaleDerived` | data | EtaleDerived Λ X := DerivedCategory (EtaleSheaf Λ X), pretriangulated, with shift [1]. |
| `TauCeti.EtaleDuality.EtaleDerived.constant` | constructor | Λ_X ∈ D(X, Λ): the constant sheaf Λ placed in degree 0. |
| `TauCeti.EtaleDuality.EtaleDerived.stalk` | projection | For a geometric point x̄ : Spec Ω → X, the triangulated functor K ↦ K_x̄ : D(X, Λ) → D(Λ) induced by the exact fibre functor of pointSmallEtale x̄. |
| `TauCeti.EtaleDuality.EtaleDerived.isIso_iff_stalk` | characterisation | A morphism u in D(X, Λ) is an isomorphism iff u_x̄ is an isomorphism for every geometric point x̄; an object is zero iff all its stalks are zero. |
| `TauCeti.EtaleDuality.EtaleDerived.cohomology` | projection | H^q(X, K) := Hom(Λ_X, K[q]), an abelian group (its Λ-module structure is that of cohomologyModule), functorial in K and contravariant in X; long exact sequences for distinguished triangles. |
| `TauCeti.EtaleDuality.EtaleDerived.cohomology_sheaf` | compatibility | For a sheaf F placed in degree 0, H^q(X, F) ≅ Ext^q(Λ_X, F), equal to Mathlib's Sheaf.H when Λ = ℤ. |
| `TauCeti.EtaleDuality.EtaleDerived.equivModuleOfSepClosed` | equivalence | For X = Spec Ω with Ω separably closed, global sections give an equivalence D(X, Λ) ≃ D(Λ) compatible with shifts. |
| `TauCeti.EtaleDuality.GeometricPoint` | data | A geometric point of X: a separably closed field Ω with a morphism Spec Ω → X. |
| `TauCeti.EtaleDuality.globalSections` | projection | Γ(X, −) : EtaleSheaf Λ X ⥤ Mod_Λ, evaluation at the terminal étale X-scheme X → X. |
| `TauCeti.EtaleDuality.cohomologyModule` | projection | H^q(X, K) as a Λ-module: the q-th cohomology of RΓ(X, K) ∈ D(Λ). |
| `TauCeti.EtaleDuality.compactCohomologyModule` | projection | H^q_c(X, K) as a Λ-module for X separated of finite type over a separably closed field: cohomology of RΓ(Ra_!K). |

**Unit tests.**

- `TauCeti.EtaleDuality.etaleDerived_isZero_of_isEmpty` (degenerate): If X is empty then every object of D(X, Λ) is zero.
- `TauCeti.EtaleDuality.etaleDerived_spec_sepClosed` (compatibility): For Ω separably closed, D(Spec Ω, Λ) is equivalent to D(Λ) by global sections, and H^q(Spec Ω, F) = 0 for q > 0.
- `TauCeti.EtaleDuality.etaleDerived_stalk_conservative` (characterisation): A complex K with K_x̄ ≅ 0 for every geometric point x̄ of X is zero in D(X, Λ).
- `TauCeti.EtaleDuality.etaleDerived_globalSections_not_conservative` (non-example): Over Spec 𝔽₂ with Λ = ℤ/3, the rank-one character sending arithmetic Frobenius to −1 gives a nonzero sheaf with H⁰ = 0 (−1−1 is a unit in ℤ/3). Global sections do not detect zero objects.

**Acceptance.**

- X = Spec Ω with Ω separably closed: global sections is an exact equivalence Sh(X_ét, Λ) ≃ Mod_Λ, so D(X, Λ) ≃ D(Λ).
- Agreement with EnhancedDerivedSheaves E1: the homotopy category of the enhancement is this D(X, Λ).

**Prerequisites.** `mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology`, `mathlib:AlgebraicGeometry.Scheme.Etale`, `mathlib:AlgebraicGeometry.Scheme.isGrothendieckAbelian_sheaf_smallEtaleTopology`, `mathlib:DerivedCategory`, `mathlib:HasDerivedCategory.standard`, `mathlib:AlgebraicGeometry.Scheme.pointSmallEtale`, `mathlib:AlgebraicGeometry.Scheme.isConservativeFamilyOfPoints_pointSmallEtale'`, `mathlib:CategoryTheory.GrothendieckTopology.Point.sheafFiber`, `mathlib:CategoryTheory.Functor.mapDerivedCategory`, `mathlib:DerivedCategory.TStructure.t`, `mathlib:CategoryTheory.Sheaf.H`, `mathlib:DerivedCategory.singleFunctor`, `mathlib:DerivedCategory.homologyFunctor`, `mathlib:CategoryTheory.constantSheaf`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`.

**Sources.**

- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 1.1.1, p. 484-485: The finite-level coefficient category D(X, 𝒜) of étale sheaves of modules over a ring killed by n invertible on X; this node names it on Mathlib's site.
- [Stacks-MoreEtale](https://stacks.math.columbia.edu/download/more-etale.pdf), Lemma 11.1 (tag 0G2C): The unbounded category D(X_étale, Λ) on which the adjoint is constructed.

**Suggested location.** `TauCeti/AlgebraicGeometry/Etale/Duality/DerivedCategory`, namespace `TauCeti.EtaleDuality`.

### Constructible complexes D^b_c(X, Λ) and complexes of finite Tor-dimension D_ctf(X, Λ)

Node `EtaleDualityAndPerverseSheaves:EDC.0/constructible-ctf-complexes` · definition. Planet: Constructible complexes D^b_c(X, Λ).

Let X be a noetherian scheme (in practice separated of finite type over a field or over a regular base of dimension ≤ 1) and Λ a noetherian torsion ring with nΛ = 0, n invertible on X. A complex K ∈ D(X, Λ) is constructible, K ∈ D^b_c(X, Λ), when it is bounded and every cohomology sheaf ℋ^q K is a constructible sheaf of Λ-modules in the sense imported from ConstructibleEtale (there is a finite partition of X into locally closed constructible subschemes on each of which the sheaf is locally constant with finitely generated stalks). K is of finite Tor-dimension, K ∈ D_ctf(X, Λ), when moreover there is an a such that K ⊗^L_Λ M has ℋ^q = 0 for q < a for every Λ-module M (equivalently K is locally quasi-isomorphic to a bounded complex of flat constructible sheaves). D_ctf ⊂ D^b_c ⊂ D^b are full triangulated subcategories, constructibility requires the finite stratification just specified; finite Tor-amplitude is checked on geometric stalks with a common bound. Finite stalks alone do not imply constructibility.

**Hypotheses.**

- Λ noetherian, torsion, with nΛ = 0 and n invertible on X.
- The notion of constructible sheaf is ConstructibleEtale's (imported through SchemeAndStackFoundations SF.2); this node only names the derived subcategories and their closure properties.
- Finite Tor-dimension is a separate condition: for Λ = ℤ/ℓ², the constructible sheaf (ℤ/ℓ)_X is in D^b_c but not in D_ctf.

**Construction and proof.**

- Constructibility of each ℋ^q is stable under extensions, kernels and cokernels of constructible sheaves (imported), so the long exact cohomology sequence makes D^b_c a triangulated subcategory closed under shifts and direct summands.
- Finite Tor-dimension is tested stalkwise because the geometric stalks are exact and conservative (EDC.0/etale-derived-category) and commute with ⊗^L (EDC.0/derived-tensor-and-internal-hom).
- Stability: f^* preserves both (exact on stalks); ⊗^L preserves D_ctf and sends D_ctf × D^b_c to D^b_c; Rf_! preserves both for f separated of finite type (imported finiteness and SGA 4 XVII 5.2.10 for Tor-dimension); Rf_* preserves D^b_c for f of finite type over a field or a regular base of dimension ≤ 1 (imported finiteness theorem of SGA 4½ [Th. finitude]).

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.EtaleDuality.IsConstructibleComplex` | data | IsConstructibleComplex K : Prop, K bounded with every ℋ^q K constructible (imported sheaf notion). |
| `TauCeti.EtaleDuality.IsCtf` | data | IsCtf K : Prop, K constructible and of finite Tor-dimension over Λ. |
| `TauCeti.EtaleDuality.isConstructibleComplex_shift` | structure | IsConstructibleComplex K ↔ IsConstructibleComplex (K[1]); likewise for IsCtf. |
| `TauCeti.EtaleDuality.isConstructibleComplex_of_triangle` | structure | In a distinguished triangle K → L → M → K[1], two constructible vertices force the third. |
| `TauCeti.EtaleDuality.isConstructibleComplex_iff_stalk` | characterisation | For X of finite type over a field, K ∈ D^b_c iff K is bounded and there is a finite stratification on whose strata the ℋ^q K are locally constant with finitely generated stalks. |
| `TauCeti.EtaleDuality.IsCtf.tensor` | structure | IsCtf K → IsCtf L → IsCtf (K ⊗^L L), and IsCtf K → IsConstructibleComplex L → IsConstructibleComplex (K ⊗^L L). |
| `TauCeti.EtaleDuality.IsConstructibleComplex.pullback` | functoriality | f^* preserves D^b_c and D_ctf for any morphism f. |
| `TauCeti.EtaleDuality.IsConstructibleComplex.lowerShriek` | functoriality | For f separated of finite type, Rf_! preserves D^b_c and D_ctf (imported finiteness; SGA 4 XVII 5.2.10). |

**Unit tests.**

- `TauCeti.EtaleDuality.isCtf_constant` (computation): For Λ = ℤ/ℓⁿ and X of finite type over a field with ℓ invertible, the constant sheaf Λ_X is in D_ctf(X, Λ).
- `TauCeti.EtaleDuality.not_isCtf_reduction` (non-example): For ℓ prime, Λ = ℤ/ℓ² and nonempty X with ℓ invertible, (ℤ/ℓ)_X is constructible but not of finite Tor-dimension: its derived tensor with ℤ/ℓ has nonzero cohomology in every degree ≤ 0 at each geometric point.
- `TauCeti.EtaleDuality.not_isConstructible_infinite_skyscrapers` (non-example): Assume Λ ≠ 0. On A¹ over an algebraically closed field, ⊕_{a ∈ ℕ} (i_a)_*Λ over infinitely many distinct closed points is not constructible.
- `TauCeti.EtaleDuality.isConstructible_zero` (degenerate): The zero complex is in D_ctf, and on empty X every complex is.

**Acceptance.**

- Over Spec Ω (Ω separably closed), D^b_c is the category of bounded complexes with finitely generated total cohomology, and D_ctf is the category of perfect complexes of Λ-modules.
- The constant sheaf Λ_X is in D_ctf; a direct sum of skyscraper sheaves at infinitely many closed points of A¹ is not in D^b_c.

**Prerequisites.** `EDC.0/etale-derived-category`, `EDC.0/derived-tensor-and-internal-hom`, `SchemeAndStackFoundations:SF.2`.

**Sources.**

- [SGA4-XVII](https://www.normalesup.org/~forgogozo/SGA4/17/17.pdf), 5.2.10, p. 359: Finite Tor-dimension is preserved by Rf_!; the D_ctf subcategory is the one SGA 4 uses for coefficients.

**Suggested location.** `TauCeti/AlgebraicGeometry/Etale/Duality/Constructible`, namespace `TauCeti.EtaleDuality`.

### Tate twists Λ(i) and K(i), with the Frobenius convention

Node `EtaleDualityAndPerverseSheaves:EDC.0/tate-twist` · construction. Planet: Tate twist.

Let X be a scheme, n ≥ 1 an integer invertible on X and Λ a ring with nΛ = 0. The Tate-twist sheaf is Λ(1) := μ_n ⊗_{ℤ/n} Λ, where μ_n is the étale sheaf U ↦ μ_n(Γ(U, O_U)) (locally free of rank one over ℤ/n); Λ(i) := Λ(1)^{⊗i} for i ≥ 0 and Λ(i) := Hom(Λ(−i), Λ) for i < 0. For K ∈ D(X, Λ), K(i) := K ⊗_Λ Λ(i), an exact autoequivalence. The construction does not depend on n: for n = dn′ the d-th power map gives μ_n ⊗ ℤ/n′ ≅ μ_{n′} (SGA 4 XVIII 1.1.1.2). For X over 𝔽_q, the geometric Frobenius acts on Λ(1)_x̄ by q⁻¹ (arithmetic Frobenius ζ ↦ ζ^q is its inverse), so it acts on Λ(−d) by q^d.

**Hypotheses.**

- n invertible on X and nΛ = 0; for torsion Λ of order prime to the residue characteristics, twists are defined as colimits over n (SGA 4 XVIII 1.1.1.4).
- The sheaf μ_n and its exactness properties (Kummer sequence) are imported from ConstructibleEtale through SchemeAndStackFoundations SF.2.

**Construction and proof.**

- Λ(1) is locally free of rank one over Λ, so −⊗_Λ Λ(i) is exact and needs no derivation; Λ(i) ⊗ Λ(j) ≅ Λ(i + j) canonically.
- f^*(Λ(1)_S) ≅ Λ(1)_X because μ_n is defined by the same formula on every scheme; hence f^*(K(i)) ≅ (f^*K)(i), and by the projection formula Rf_*, Rf_! commute with twists.
- Over a separably closed field a primitive n-th root of unity gives an isomorphism Λ(1) ≅ Λ, not canonical; over 𝔽_q the Galois action is the cyclotomic character.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.EtaleDuality.tateTwistSheaf` | data | Λ(1) ∈ EtaleSheaf Λ X, the sheaf μ_n ⊗ Λ, locally free of rank one. |
| `TauCeti.EtaleDuality.tateTwist` | constructor | tateTwist i : D(X, Λ) ⥤ D(X, Λ), K ↦ K(i), an exact autoequivalence. |
| `TauCeti.EtaleDuality.tateTwistZeroIso` | simp | K(0) ≅ K naturally. |
| `TauCeti.EtaleDuality.tateTwistAddIso` | relation | K(i)(j) ≅ K(i + j) naturally, associative and unital. |
| `TauCeti.EtaleDuality.tateTwist_pullback` | functoriality | f^*(K(i)) ≅ (f^*K)(i), and Rf_*(K(i)) ≅ (Rf_*K)(i), Rf_!(K(i)) ≅ (Rf_!K)(i). |
| `TauCeti.EtaleDuality.tateTwist_shift` | compatibility | (K[m])(i) ≅ (K(i))[m] compatibly with the triangulated structure. |
| `TauCeti.EtaleDuality.tateTwistSheaf_iso_of_sepClosed` | example | Over Spec Ω with Ω separably closed, a primitive n-th root of unity in Ω gives Λ(1) ≅ Λ. |
| `TauCeti.EtaleDuality.tateTwist_geomFrobenius` | characterisation | Over 𝔽_q, geometric Frobenius acts on the stalk Λ(i)_x̄ by q^{-i}. |

**Unit tests.**

- `TauCeti.EtaleDuality.tateTwist_sepClosed_trivial` (computation): Over Spec Ω with Ω separably closed of characteristic prime to n, Λ(1) ≅ Λ as sheaves.
- `TauCeti.EtaleDuality.tateTwist_zero` (degenerate): Λ(0) = Λ and K(0) ≅ K.
- `TauCeti.EtaleDuality.not_tateTwist_trivial_F2` (non-example): Over Spec 𝔽_2 with n = 3 and Λ = ℤ/3, Λ(1) is not isomorphic to Λ: Frobenius acts on μ_3(𝔽̄_2) by ζ ↦ ζ², which is not the identity.
- `TauCeti.EtaleDuality.tateTwist_frobenius_eigenvalue` (characterisation): Over 𝔽_q, geometric Frobenius acts on Λ(−1) by multiplication by q and on Λ(1) by q⁻¹.

**Acceptance.**

- The Frobenius convention: over 𝔽_q, Λ(−1) has geometric Frobenius eigenvalue q; this is the convention of DeligneWeightsAndPurity and WeilConjectures.
- Independence of n via (1.1.1.2), checked on the diagram (1.1.3.5) of Kummer sequences.

**Prerequisites.** `EDC.0/etale-derived-category`, `EDC.0/derived-tensor-and-internal-hom`, `mathlib:rootsOfUnity`, `SchemeAndStackFoundations:SF.2`.

**Sources.**

- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 1.1.1, (1.1.1.1)-(1.1.1.3), p. 484: Definition of the twists Z/n(i) and F(i) = F ⊗ Z/n(i).
- [Milne-LEC](https://www.jmilne.org/math/CourseNotes/LEC.pdf), §16, p. 108: The same twist, defined by sections over affine étale U.

**Suggested location.** `TauCeti/AlgebraicGeometry/Etale/Duality/TateTwist`, namespace `TauCeti.EtaleDuality`.

### Derived tensor product and internal Hom on D(X, Λ)

Node `EtaleDualityAndPerverseSheaves:EDC.0/derived-tensor-and-internal-hom` · comparison.

For X a scheme and Λ a commutative ring, the derived tensor product ⊗^L_Λ and the derived internal Hom RHom_Λ on D(X, Λ) constructed by EnhancedDerivedSheaves E1 (K-flat and K-injective replacements on the ringed site (X_ét, Λ)) satisfy: (i) Hom(K ⊗^L L, M) ≅ Hom(K, RHom(L, M)) naturally, so ⊗^L ⊣ RHom; (ii) (K ⊗^L L)_x̄ ≅ K_x̄ ⊗^L_Λ L_x̄ for every geometric point; (iii) f^*(K ⊗^L L) ≅ f^*K ⊗^L f^*L and Hom(f^*K, M) ≅ Hom(K, Rf_*M); (iv) RHom(Λ_X, K) ≅ K and RΓ(X, RHom(K, L)) ≅ RHom_X(K, L), whose H^0 is Hom_{D(X,Λ)}(K, L). For a closed immersion i, i^* preserves ⊗^L, and for an étale j, j^* preserves RHom.

**Hypotheses.**

- Unbounded complexes are allowed: the replacements are the unbounded K-flat/K-injective ones of EnhancedDerivedSheaves E1, not bounded-below injective resolutions.
- No constructibility is needed for (i)-(iv).

**Construction and proof.**

- Import the bifunctors and the adjunction from EnhancedDerivedSheaves E1 for the site X_ét with constant ring Λ.
- The stalk formula holds because geometric stalks are exact, commute with tensor products and send K-flat complexes to K-flat complexes of Λ-modules.
- Pullback is exact and monoidal on sheaves and preserves K-flatness, which gives (iii); the Leray identity RΓ(X, −) ∘ RHom = RHom_X is the global sections of (i) (Stacks Cohomology on Sites, Lemmas 19.1 and 35.2, the two equalities used in the proof of More Étale 11.5).

**Acceptance.**

- For X = Spec Ω with Ω separably closed these are the usual ⊗^L_Λ and RHom_Λ on D(Λ).
- RHom(Λ_X, K) ≅ K and Λ_X is a unit for ⊗^L.

**Prerequisites.** `EDC.0/etale-derived-category`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `EnhancedDerivedSheaves:E1/k-injective-and-k-flat-replacements`, `mathlib:CategoryTheory.Adjunction`.

**Sources.**

- [Stacks-MoreEtale](https://stacks.math.columbia.edu/download/more-etale.pdf), Lemma 11.5 (tag 0GLC), proof: The pullback/pushforward and tensor/RHom adjunctions on the unbounded étale derived category, used as the formal input to the sheafified adjunction.

**Suggested location.** `TauCeti/AlgebraicGeometry/Etale/Duality/Theorems`, namespace `TauCeti.EtaleDuality`. Proposed declaration: `TauCeti.EtaleDuality.derivedTensor_internalHom_adjunction`.

### Cohomology with supports and the localization triangle

Node `EtaleDualityAndPerverseSheaves:EDC.0/cohomology-with-supports` · construction. Planet: Cohomology with supports.

Let i : Z → X be a closed immersion with open complement j : U → X, and Λ a ring. On sheaves, i^!F := i^{-1}(ker(F → j_*j^*F)) is the sheaf of sections of F supported on Z; it is right adjoint to the exact functor i_*, so its right derived functor Ri^! : D(X, Λ) → D(Z, Λ) is right adjoint to i_* on derived categories. The cohomology of X with supports in Z is RΓ_Z(X, K) := RΓ(Z, Ri^!K), with groups H^q_Z(X, K). There is a distinguished triangle i_*Ri^!K → K → Rj_*j^*K → (i_*Ri^!K)[1], hence RΓ_Z(X, K) ≅ fibre(RΓ(X, K) → RΓ(U, j^*K)) and the long exact sequence of the pair … → H^q_Z(X, K) → H^q(X, K) → H^q(U, K) → H^{q+1}_Z(X, K) → …; for Z ⊂ Z′ closed there is the sequence of the triple. Excision: for φ : X′ → X étale with Z′ := φ^{-1}(Z) → Z an isomorphism, RΓ_Z(X, K) ≅ RΓ_{Z′}(X′, φ^*K). The construction retains the immersion i and the category D(Z, Λ), and depends only on Z_red.

**Hypotheses.**

- Any scheme X; Z ⊂ X closed with its reduced or nonreduced structure (the étale sites of Z and Z_red coincide).
- Λ any ring; no torsion or constructibility hypothesis.

**Construction and proof.**

- i_* is exact and fully faithful on sheaves and i^{-1}i_* = id; ker(F → j_*j^*F) is supported on Z, so i^! is right adjoint to i_* and preserves injectives.
- The localization triangle comes from the exact sequence 0 → i_*i^!I → I → j_*j^*I → 0 for injective I (surjectivity: injective sheaves are flasque in the étale sense) applied to a K-injective replacement.
- Excision is Stacks More Étale Lemma 2.1 (growing sections) applied to injective resolutions.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.EtaleDuality.supportSections` | data | i^! : EtaleSheaf Λ X ⥤ EtaleSheaf Λ Z, sections supported on Z. |
| `TauCeti.EtaleDuality.supportAdjunction` | universal-property | i_* ⊣ i^! on sheaves; i^!i_* ≅ id. |
| `TauCeti.EtaleDuality.derivedSupport` | constructor | Ri^! : D(X, Λ) ⥤ D(Z, Λ), right adjoint to i_* on derived categories. |
| `TauCeti.EtaleDuality.localizationTriangle` | relation | i_*Ri^!K → K → Rj_*j^*K → (i_*Ri^!K)[1] is distinguished, naturally in K. |
| `TauCeti.EtaleDuality.cohomologyWithSupports` | projection | H^q_Z(X, K) := H^q(Z, Ri^!K), a Λ-module. |
| `TauCeti.EtaleDuality.cohomologyWithSupports_exact` | relation | The long exact sequence of the pair (X, U) and of a triple Z ⊂ Z′. |
| `TauCeti.EtaleDuality.cohomologyWithSupports_excision` | characterisation | For φ : X′ → X étale with φ^{-1}(Z) → Z an isomorphism, H^q_Z(X, K) ≅ H^q_{φ^{-1}Z}(X′, φ^*K). |
| `TauCeti.EtaleDuality.derivedSupport_reduced` | characterisation | Ri^! depends only on the closed subset: the thickening Z_red → Z identifies the étale sites and the functors. |
| `TauCeti.EtaleDuality.localizationTriangle_distinguished` | relation | For j the open complement of i, the localization triangle is distinguished. |
| `TauCeti.EtaleDuality.forgetSupports` | projection | The map H^q_Z(X, K) → H^q(X, K) forgetting supports. |
| `TauCeti.EtaleDuality.restrictToOpen` | projection | The restriction H^q(X, K) → H^q(U, j^*K) to the open complement. |

**Unit tests.**

- `TauCeti.EtaleDuality.cohomologyWithSupports_self` (degenerate): For Z = X (i = id), H^q_Z(X, K) = H^q(X, K).
- `TauCeti.EtaleDuality.cohomologyWithSupports_empty` (degenerate): For Z = ∅, H^q_Z(X, K) = 0.
- `TauCeti.EtaleDuality.cohomologyWithSupports_origin_line` (computation): For X = A¹_Ω, Ω algebraically closed, Z = {0} and Λ = ℤ/n with n invertible: H²_Z(X, Λ(1)) ≅ Λ and H^q_Z(X, Λ(1)) = 0 for q ≠ 2.
- `TauCeti.EtaleDuality.not_cohomologyWithSupports_eq_cohomology_of_support` (non-example): H⁰_{0}(A¹_Ω, Λ) = 0 while H⁰({0}, Λ) = Λ: cohomology with supports is not the cohomology of Z.

**Acceptance.**

- Z = X gives RΓ_Z = RΓ; Z = ∅ gives 0.
- For X = A¹ over an algebraically closed field, Z = {0}, Λ = ℤ/n: H^q_Z(X, Λ(1)) is Λ for q = 2 and 0 otherwise (Kummer theory on A¹ − {0}; this is EDC.3's purity for a point on a curve).

**Prerequisites.** `EDC.0/etale-derived-category`, `mathlib:AlgebraicGeometry.IsClosedImmersion`, `mathlib:AlgebraicGeometry.IsOpenImmersion`, `mathlib:CategoryTheory.Adjunction`, `SchemeAndStackFoundations:SF.2`.

**Sources.**

- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 3.1.8 (ii), p. 571: For a closed immersion the sheaf-level right adjoint is sections with support.
- [Stacks-MoreEtale](https://stacks.math.columbia.edu/download/more-etale.pdf), Lemma 2.1 (tag 0F6F): Étale excision for sections with support.
- [Milne-LEC](https://www.jmilne.org/math/CourseNotes/LEC.pdf), §23, p. 138: The sequence of the triple used for semi-purity and cycle classes.

**Suggested location.** `TauCeti/AlgebraicGeometry/Etale/Duality/Supports`, namespace `TauCeti.EtaleDuality`.

### Change of coefficients and the reduction identities

Node `EtaleDualityAndPerverseSheaves:EDC.0/coefficient-change` · construction.

Let φ : Λ → Λ′ be a homomorphism of commutative rings. Restriction of scalars ρ : D(X, Λ′) → D(X, Λ) is exact; extension of scalars Λ′ ⊗^L_Λ − : D(X, Λ) → D(X, Λ′) is its left adjoint. ρ commutes with f^*, Rf_*, Rf_! and Ri^! (for i a closed immersion); extension commutes with f^* and, for Λ and Λ′ torsion, with Rf_! (projection formula). In particular, for an ideal I ⊂ Λ (reduction), (Λ/I) ⊗^L_Λ Rf_!K ≅ Rf_!((Λ/I) ⊗^L_Λ K) and RΓ_c(X_k̄, (Λ/I) ⊗^L K) ≅ (Λ/I) ⊗^L RΓ_c(X_k̄, K). These identities use derived tensor products; the underived tensor product is not exact.

**Hypotheses.**

- Λ, Λ′ commutative; for the Rf_! statements both torsion and f compactifiable.
- The identities hold in the unbounded derived categories; no finite Tor-dimension hypothesis.

**Construction and proof.**

- Adjunction: Hom_{Λ′}(Λ′ ⊗^L_Λ K, L) ≅ Hom_Λ(K, ρL) from the sheaf-level adjunction and K-flat replacements (EnhancedDerivedSheaves E1).
- ρ commutes with f^* trivially and with Rf_* because ρ preserves K-injectives' acyclicity for f_* (flasque sheaves); with Rf_! because Rf_! = R f̄_* ∘ j_! on a compactification (SGA 4 XVII 5.1.14, Stacks More Étale Remark 10.8).
- Extension commutes with Rf_! by the projection formula Rf_!E ⊗^L K ≅ Rf_!(E ⊗^L f^{-1}K) with K = Λ′ (Stacks More Étale Lemma 10.7; SGA 4 XVII 5.2.9).

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.EtaleDuality.restrictScalars` | constructor | ρ_φ : D(X, Λ′) ⥤ D(X, Λ), exact and triangulated. |
| `TauCeti.EtaleDuality.extendScalars` | constructor | Λ′ ⊗^L_Λ − : D(X, Λ) ⥤ D(X, Λ′). |
| `TauCeti.EtaleDuality.extendRestrictAdjunction` | universal-property | extendScalars φ ⊣ restrictScalars φ. |
| `TauCeti.EtaleDuality.restrictScalars_lowerShriek` | compatibility | ρ ∘ Rf_! ≅ Rf_! ∘ ρ for f compactifiable and torsion coefficients. |
| `TauCeti.EtaleDuality.extendScalars_lowerShriek` | compatibility | Λ′ ⊗^L Rf_!K ≅ Rf_!(Λ′ ⊗^L K) (the reduction identity). |
| `TauCeti.EtaleDuality.restrictScalars_derivedSupport` | compatibility | ρ ∘ Ri^! ≅ Ri^! ∘ ρ for a closed immersion i. |
| `TauCeti.EtaleDuality.restrictScalars_comp` | functoriality | ρ_{ψ∘φ} ≅ ρ_φ ∘ ρ_ψ and ρ_id ≅ id. |

**Unit tests.**

- `TauCeti.EtaleDuality.extendScalars_id` (degenerate): For φ = id, extension and restriction are isomorphic to the identity.
- `TauCeti.EtaleDuality.extendScalars_reduction_unbounded` (computation): For Λ = ℤ/ℓ², Λ′ = ℤ/ℓ: ℋ^{-q}(Λ′ ⊗^L_Λ Λ′_X) ≅ Λ′_X for all q ≥ 0.
- `TauCeti.EtaleDuality.restrictScalars_constant` (compatibility): ρ(Λ′_X) is the constant sheaf with value Λ′ regarded as a Λ-module.
- `TauCeti.EtaleDuality.not_extendScalars_underived_exact` (non-example): The underived tensor product with ℤ/ℓ is not exact: tensoring the injection ℤ → ℤ, x ↦ ℓx, with ℤ/ℓ gives the zero map on ℤ/ℓ ≠ 0 (shown for ℓ = 2); coefficient extension must be derived.

**Acceptance.**

- Λ = ℤ/ℓ², Λ′ = ℤ/ℓ: (ℤ/ℓ) ⊗^L_{ℤ/ℓ²} (ℤ/ℓ)_X has ℋ^{-q} ≅ (ℤ/ℓ)_X for every q ≥ 0, so extension of scalars leaves D^b.
- Restriction of scalars of Λ′_X is the constant sheaf Λ′ regarded as a Λ-module.

**Prerequisites.** `EDC.0/etale-derived-category`, `EDC.0/derived-tensor-and-internal-hom`, `SchemeAndStackFoundations:SF.2`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

**Sources.**

- [Stacks-MoreEtale](https://stacks.math.columbia.edu/download/more-etale.pdf), Remark 11.8 (tag 0GLF): Restriction of scalars commutes with Rf_! (Remark 10.8) and with Rf^! (Remark 11.8).
- [SGA4-XVII](https://www.normalesup.org/~forgogozo/SGA4/17/17.pdf), Proposition 5.2.9, p. 358: The projection formula, which gives the reduction identity for extension of scalars.

**Suggested location.** `TauCeti/AlgebraicGeometry/Etale/Duality/Coefficients`, namespace `TauCeti.EtaleDuality`.

### The enhanced compactly supported direct image Rf_!

Node `EtaleDualityAndPerverseSheaves:EDC.0/enhanced-compact-pushforward` · construction. Planet: Enhanced compactly supported direct image.

For f : X → S separated of finite type with S quasi-compact quasi-separated, and a torsion ring Λ, construct an exact colimit-preserving functor Rf_! between the stable enhancements of D(X_ét,Λ) supplied by EnhancedDerivedSheaves E1. Its homotopy functor is the existing CompactSupport Rf_!. For each compactification (j : X ↪ X̄, p : X̄ → S proper) use Rp_* j_!. Proper refinements give equivalences between these functors. Their homotopy coherent diagram descends along the contractible compactification index, yielding independence of compactification, composition and cartesian base change with unit, associativity and pasting coherence. This is an enhancement of an existing operation, not a second finite-coefficient definition.

**Hypotheses.**

- f separated of finite type over a quasi-compact quasi-separated S (compactifiable by Nagata, imported from CompactSupport).
- Λ torsion; the unbounded category is used, which needs the finite cohomological dimension of EDC.0/compact-pushforward-amplitude-and-colimits.
- This lifts the imported Rf_!; it is not a second definition of Rf_! (RS-19: EDC.0 does not own the finite-level Rf_!).

**Construction and proof.**

- Localize the complex categories at quasi-isomorphisms using E1. The exact sheaf pullback and extension by zero induce functors on the localizations. Derive p_* as the right adjoint of exact p^* in the presentable enhancements by E3; its homotopy functor agrees with ordinary Rp_* by the K-injective adjunction. No termwise Godement operation is asserted to land in K-injectives.
- Let a refinement u : X̄′ → X̄ be proper and restrict to the identity on X, with j=u j′ and p′=p u. The unit of u^* ⊣ Ru_* gives j_! → Ru_*j′_!. Proper base change shows it is an equivalence: over X the fibre is a point and over the boundary the pulled-back coefficient is zero. Applying Rp_* gives the comparison for the compactification models.
- Form this diagram as an E3 diagram of ringed topoi and adjunction units, before taking homotopy categories. Functorial units and the composition comparison of right adjoints supply all higher composition data. The compactification category is cofiltered: closures of the diagonal in fibre products give common refinements, and equalizers of refinements give common equalizing refinements. Hence its nerve is weakly contractible. A diagram all of whose arrows are equivalences descends to a single functor with contractible choice of identifications (E3 localization).
- For a composable pair use the category of compatible pairs of compactifications; compactify the intermediate open map, then take proper fibre products and diagonal closures to compare it with a compactification of the composite. Its cofinal common-refinement diagrams identify the two models. For a cartesian square pull back the compactification and use the canonical proper base-change mate. Refining these diagrams together gives associativity and pasting, because the comparisons are the same units and mates in the E3 diagram, rather than independently chosen homotopy-category isomorphisms.
- The imported uniform fibre-dimension bound implies finite cohomological amplitude; filtered-colimit and direct-sum compatibility follow from XVII 5.2.8 and XVIII 3.1.4. On a stable enhancement exactness and preservation of sums imply preservation of all small colimits. These properties allow the E3 adjoint functor theorem at the next target. The bounded flasque model XVIII 3.1.4.7 is a comparison model only; coherent localization avoids its geometric-point choice issue (source issue E9).

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.EtaleDuality.enhancedLowerShriek` | constructor | Rf_!^{enh} : 𝒟(X, Λ) → 𝒟(S, Λ), an exact functor of the EnhancedDerivedSheaves stable categories. |
| `TauCeti.EtaleDuality.enhancedLowerShriek_homotopy` | compatibility | The homotopy-category functor of Rf_!^{enh} is isomorphic to the imported Rf_! : D(X, Λ) ⥤ D(S, Λ). |
| `TauCeti.EtaleDuality.enhancedLowerShriek_preservesColimits` | instance | Rf_!^{enh} preserves all small colimits. |
| `TauCeti.EtaleDuality.enhancedLowerShriek_comp` | functoriality | (g ∘ h)_!^{enh} ≃ g_!^{enh} ∘ h_!^{enh}, with the coherent associativity and unit data. |
| `TauCeti.EtaleDuality.enhancedLowerShriek_baseChange` | compatibility | For a cartesian square, g^*Rf_!^{enh} ≃ Rf′_!^{enh}g′^*, coherently (proper base change). |
| `TauCeti.EtaleDuality.lowerShriek_openImmersion` | simp | For an open immersion j, Rj_! is extension by zero j_!, left adjoint to j^*. |
| `TauCeti.EtaleDuality.lowerShriek_proper` | simp | For proper f, Rf_! ≅ Rf_*. |

**Unit tests.**

- `TauCeti.EtaleDuality.lowerShriek_openImmersion_stalk` (computation): For j : U → X open and K ∈ D(U, Λ), (Rj_!K)_x̄ = 0 for x̄ outside U and = K_x̄ for x̄ in U.
- `TauCeti.EtaleDuality.lowerShriek_finiteEtale` (computation): For f finite étale, Rf_! ≅ f_* is exact (no higher cohomology sheaves).
- `TauCeti.EtaleDuality.lowerShriek_affineLine` (computation): For a : A¹_Ω → Spec Ω, Ω algebraically closed, n invertible: H^q(Ra_!Λ(1)) = Λ for q = 2 and 0 for q ≠ 2.
- `TauCeti.EtaleDuality.not_lowerShriek_eq_pushforward` (non-example): For j : A¹_Ω → P¹_Ω, Rj_!Λ ≇ Rj_*Λ: their stalks at ∞ are 0 and Λ (in degree 0) respectively.

**Acceptance.**

- Open immersion j : U → X: Rj_!^{enh} is extension by zero.
- Finite étale f: Rf_!^{enh} = f_* (exact).
- Structure map a : A¹_Ω → Spec Ω, Ω algebraically closed: H^q(Ra_!Λ(1)) is Λ for q = 2 and 0 otherwise, the same as the imported Rf_!.

**Prerequisites.** `EDC.0/etale-derived-category`, `EDC.0/compact-pushforward-amplitude-and-colimits`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E3/coherent-diagrams-of-ringed-topoi`, `EnhancedDerivedSheaves:E3/mates-and-beck-chevalley`, `SchemeAndStackFoundations:SF.2`, `EnhancedDerivedSheaves:E1/k-injective-and-k-flat-replacements`, `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`.

**Sources.**

- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 0.1 (III), p. 481: The property of Rf_! that the enhancement uses.
- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), proof of 3.1.4, (3.1.4.7), p. 568-569: The complex-level model f_!^• of Rf_!.

**Suggested location.** `TauCeti/AlgebraicGeometry/Etale/Duality/LowerShriek`, namespace `TauCeti.EtaleDuality`.

### Rf_! has finite amplitude and commutes with direct sums and filtered colimits

Node `EtaleDualityAndPerverseSheaves:EDC.0/compact-pushforward-amplitude-and-colimits` · theorem.

Let f : X → S be compactifiable with fibres of dimension ≤ d and Λ a torsion ring. (a) For every sheaf F of Λ-modules, (R^q f_!F)_s̄ = H^q_c(X_s̄, F) for each geometric point s̄ of S, and R^q f_!F = 0 for q > 2d; R^{2d}f_! is right exact. (b) Hence Rf_! has finite cohomological amplitude and is defined on the unbounded D(X, Λ); there is N with H^i(Rf_!E) = 0 for i ∉ [a, b + N] when H^i(E) = 0 for i ∉ [a, b]. (c) Rf_! : D(X, Λ) → D(S, Λ) commutes with arbitrary direct sums, and the functors R^q f_! commute with filtered colimits of sheaves. (d) Rf_! preserves D^b_c and D_ctf (imported finiteness).

**Hypotheses.**

- f compactifiable; Λ torsion (for (c) on the unbounded category).
- The finite-level Rf_!, its stalk formula and its cohomological dimension are CompactSupport's (imported); this node records them in the form the adjoint construction consumes.

**Construction and proof.**

- (a) is SGA 4 XVII 5.2.8 and 5.2.8.1: reduce by base change to S the spectrum of an algebraically closed field and use cohomological dimension 2 dim X̄ of a compactification (SGA 4 X 4.3).
- (b) follows from (a) by the way-out lemma (Stacks More Étale Lemma 10.2, SGA 4 XVIII Remark 3.1.5).
- (c): reduce to an open immersion (j_! is a left adjoint) and a proper morphism (Rf_* commutes with direct sums for torsion Λ by finite cohomological dimension), Stacks More Étale Lemma 10.1; filtered colimits by SGA 4 XVIII 0.1 (II).
- (d) is imported from CompactSupport and the finiteness theorem through SchemeAndStackFoundations SF.2.

**Acceptance.**

- For X = A^d over an algebraically closed field, R^{2d}a_!Λ(d) ≅ Λ and R^q a_!Λ = 0 for q > 2d.
- For f finite, Rf_! = f_* is exact, so the amplitude is [0, 0].

**Prerequisites.** `EDC.0/etale-derived-category`, `SchemeAndStackFoundations:SF.2`, `mathlib:DerivedCategory.TStructure.t`.

**Sources.**

- [SGA4-XVII](https://www.normalesup.org/~forgogozo/SGA4/17/17.pdf), Corollaire 5.2.8.1, p. 358: Amplitude bound (a).
- [Stacks-MoreEtale](https://stacks.math.columbia.edu/download/more-etale.pdf), Lemma 10.1 (tag 0G29): Colimit preservation (c) on the unbounded category.
- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 0.1 (II), p. 481: The properties Deligne isolates as the input to the existence of Rf^!.

**Suggested location.** `TauCeti/AlgebraicGeometry/Etale/Duality/Theorems`, namespace `TauCeti.EtaleDuality`. Proposed declaration: `TauCeti.EtaleDuality.lowerShriek_amplitude, TauCeti.EtaleDuality.lowerShriek_preservesCoproducts`.

## EDC.1:adjoint — Exceptional inverse image and formal duality

Construct the right adjoint of the enhanced compact image. Define the dualizing object and its internal-Hom functor, with evaluation and formal exchange maps. Constructible biduality is a later theorem, rather than an assumption in these formal identities.

### The exceptional inverse image f^!, right adjoint to Rf_!

Node `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/exceptional-inverse-image` · construction. Planet: Exceptional inverse image f^!.

Let f : X → S be compactifiable and Λ a torsion ring. The exceptional inverse image f^! : D(S, Λ) → D(X, Λ) is the right adjoint of Rf_!: it is the homotopy-category functor of the right adjoint f^!_{enh} of Rf_!^{enh}, which exists by the adjoint functor theorem for colimit-preserving functors of presentable stable categories (EnhancedDerivedSheaves E3) and is exact. There are natural isomorphisms Hom_{D(S,Λ)}(Rf_!K, L) ≅ Hom_{D(X,Λ)}(K, f^!L) with unit K → f^!Rf_!K and counit Rf_!f^!L → L; f^! is triangulated. On D⁺ it is SGA 4 XVIII's partial adjoint (3.1.4) and the derived functor of the complex-level f^{!•} right adjoint to f_!^•; on the unbounded category it agrees with the Brown-representability adjoint of Stacks More Étale Lemma 11.1, by uniqueness of adjoints. If f has fibres of dimension ≤ d and H^i(L) = 0 for i ≤ k then H^i(f^!L) = 0 for i ≤ k − 2d. For f étale, f^! = f^* with counit the trace f_!f^* → id; for f quasi-finite, f^! is the right derived functor of the sheaf-level right adjoint of f_!; for a closed immersion it is Ri^! of EDC.0/cohomology-with-supports.

**Hypotheses.**

- f separated of finite type over a quasi-compact quasi-separated base S; Λ torsion.
- No smoothness, purity or constructibility is assumed: this is the formal prefix of SGA 4 XVIII §3.1, independent of §§1-2 (XVIII 0.2).
- The right adjoint is produced, not assumed (EnhancedDerivedSheaves E3).

**Construction and proof.**

- Rf_!^{enh} preserves small colimits between presentable stable categories (EDC.0/enhanced-compact-pushforward), so EnhancedDerivedSheaves E3 produces its right adjoint f^!_{enh} with unit and counit; pass to homotopy categories.
- Agreement with SGA 4 XVIII 3.1.4 on D⁺ and with Stacks 0G2C on D: both are right adjoints of the same functor Rf_!, hence canonically isomorphic.
- Amplitude: by adjunction with L′ := τ_{≤k−2d}f^!L, Rf_!L′ has cohomology in degrees ≤ k so Hom(Rf_!L′, L) = 0 (XVIII 3.1.7 (i), Stacks 0GLA).
- Étale f: f_! is left adjoint to f^* with the trace as counit (SGA 4 XVII 6.2.11), so f^! = f^*; quasi-finite f: Rf_! = f_! is exact and commutes with filtered colimits, so it has a sheaf-level right adjoint whose derived functor is f^! (XVIII 3.1.8 (i)); closed immersion: XVIII 3.1.8 (ii).

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.EtaleDuality.upperShriek` | constructor | f^! : D(S, Λ) ⥤ D(X, Λ) for f compactifiable and Λ torsion. |
| `TauCeti.EtaleDuality.lowerShriekUpperShriekAdjunction` | universal-property | Rf_! ⊣ f^!, with unit and counit. |
| `TauCeti.EtaleDuality.upperShriek_commShift` | instance | f^! commutes with the shift functors. |
| `TauCeti.EtaleDuality.upperShriek_isTriangulated` | instance | f^! is a triangulated functor. |
| `TauCeti.EtaleDuality.upperShriek_id` | simp | id^! ≅ id. |
| `TauCeti.EtaleDuality.upperShriek_etale` | simp | For f étale (separated, of finite type), f^! ≅ f^* with counit the trace f_!f^* → id. |
| `TauCeti.EtaleDuality.upperShriek_closedImmersion` | compatibility | For a closed immersion i, i^! ≅ Ri^! (derived sections with support). |
| `TauCeti.EtaleDuality.upperShriek_amplitude` | other | If f has fibres of dimension ≤ d and L ∈ D^{≥k+1}, then f^!L ∈ D^{≥k+1−2d}. |
| `TauCeti.EtaleDuality.upperShriek_quasiFinite` | characterisation | For f quasi-finite, f^! is the right derived functor of the right adjoint of the exact functor f_! on sheaves. |

**Unit tests.**

- `TauCeti.EtaleDuality.upperShriek_id_eq` (degenerate): For f = 𝟙_X, f^! ≅ 𝟭 (D(X, Λ)).
- `TauCeti.EtaleDuality.upperShriek_openImmersion` (computation): For j : U → X an open immersion, j^!K ≅ j^*K, and the counit j_!j^*K → K is extension by zero of the identity.
- `TauCeti.EtaleDuality.upperShriek_point_line` (computation): For i : {0} → A¹_Ω (Ω algebraically closed, n invertible, Λ = ℤ/n), i^!Λ ≅ Λ(−1)[−2].
- `TauCeti.EtaleDuality.not_upperShriek_eq_pullback_closed` (non-example): For i : {0} → A¹_Ω, i^!Λ ≇ i^*Λ = Λ: the exceptional inverse image of a closed immersion is not the pullback.

**Acceptance.**

- X = S, f = id: f^! = id.
- j : U → X open immersion: j^! = j^*.
- i : {0} → A¹_Ω, Ω algebraically closed: i^!Λ ≅ Λ(−1)[−2] (computed by EDC.3/smooth-pair-purity), so f^! ≠ f^* for closed immersions.

**Prerequisites.** `EDC.0/enhanced-compact-pushforward`, `EDC.0/compact-pushforward-amplitude-and-colimits`, `EDC.0/cohomology-with-supports`, `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`, `mathlib:CategoryTheory.Adjunction`, `mathlib:CategoryTheory.Functor.IsTriangulated`, `mathlib:CategoryTheory.Functor.CommShift`, `mathlib:AlgebraicGeometry.Etale`, `mathlib:AlgebraicGeometry.LocallyQuasiFinite`.

**Sources.**

- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), Théorème 3.1.4, p. 567: Existence of the right adjoint on D⁺.
- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), Définition 3.1.6, p. 570-571: Name and definition.
- [Stacks-MoreEtale](https://stacks.math.columbia.edu/download/more-etale.pdf), Lemma 11.1 (tag 0G2C): The unbounded right adjoint (by Brown representability), isomorphic to ours by uniqueness of adjoints.
- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), Proposition 3.1.8, p. 571: The étale case.

**Suggested location.** `TauCeti/AlgebraicGeometry/Etale/Duality/UpperShriek`, namespace `TauCeti.EtaleDuality`.

### Composition and localization for f^!

Node `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/upper-shriek-pseudofunctor` · theorem.

For compactifiable S-morphisms X →h Y →g Z there are isomorphisms c^!_{g,h} : h^!g^! ≅ (gh)^!, transposed from the composition isomorphism Rg_!Rh_! ≅ R(gh)_!, satisfying the cocycle condition for triple composites and unit conditions; so the categories D(X, Λ) form a category fibred (by f^!) and cofibred (by Rf_!) over compactifiable morphisms. For a commutative square of compactifiable morphisms there is the cobase-change map Rf′_!g′^! → g^!Rf_!. For k : V → S étale with X_V := X ×_S V, there is the localization isomorphism k_X^*f^! ≅ f_V^!k^*.

**Hypotheses.**

- Compactifiable morphisms over a quasi-compact quasi-separated base; Λ torsion.

**Construction and proof.**

- Transpose the composition isomorphism of EDC.0/enhanced-compact-pushforward by uniqueness of adjoints; the coherence of the enhancement (EnhancedDerivedSheaves E3 mates) gives the cocycle condition (SGA 4 XVIII 3.1.13.1).
- Localization: k_!Rf_{V!} ≅ Rf_!k_{X!} transposes, using k^! = k^* for étale k (EDC.1:adjoint/exceptional-inverse-image), to (3.1.10.1).

**Acceptance.**

- For h = id, c^!_{g,id} is the identity.
- For two open immersions U ⊂ V ⊂ X, the composite of restrictions is restriction.

**Prerequisites.** `EDC.1:adjoint/exceptional-inverse-image`, `EDC.0/enhanced-compact-pushforward`, `EnhancedDerivedSheaves:E3/mates-and-beck-chevalley`.

**Sources.**

- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 3.1.13, (3.1.13.1), p. 576: Composition isomorphisms for f^!.
- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), proof of 3.1.10, (3.1.10.1), p. 573: Localization isomorphism for étale base change.

**Suggested location.** `TauCeti/AlgebraicGeometry/Etale/Duality/Theorems`, namespace `TauCeti.EtaleDuality`. Proposed declaration: `TauCeti.EtaleDuality.upperShriek_comp`.

### The sheafified adjunction Rf_*RHom(L, f^!K) ≅ RHom(Rf_!L, K) and the induction formulas

Node `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/sheafified-adjunction` · theorem.

Let f : X → S be compactifiable and Λ torsion. (a) For K ∈ D(S, Λ) and L ∈ D(X, Λ), the composite Rf_*RHom(L, f^!K) → RHom(Rf_!L, Rf_!f^!K) → RHom(Rf_!L, K) is an isomorphism; taking RΓ gives RHom_X(L, f^!K) ≅ RHom_S(Rf_!L, K). (b) Induction formula: for K ∈ D(S, Λ) and L ∈ D(S, Λ), RHom(f^*K, f^!L) ≅ f^!RHom(K, L). (c) Base change: for a cartesian square with g : S′ → S and f′ : X′ → S′, Rg′_*f′^!L ≅ f^!Rg_*L. (d) Coefficient restriction: for a ring map Λ → Λ′ of torsion rings, ρf^! ≅ f^!ρ.

**Hypotheses.**

- f compactifiable, Λ torsion; unbounded complexes allowed (Stacks); SGA 4 XVIII states (a)-(c) with K ∈ D⁻, L ∈ D⁺, which the unbounded version contains.
- No smoothness or constructibility.

**Construction and proof.**

- (a) Test against M ∈ D(S, Λ): Hom(M, Rf_*RHom(L, f^!K)) = Hom(f^{-1}M ⊗^L L, f^!K) = Hom(Rf_!(f^{-1}M ⊗^L L), K) = Hom(M ⊗^L Rf_!L, K) = Hom(M, RHom(Rf_!L, K)), the fourth equality being the projection formula (Stacks More Étale Lemmas 11.5-11.6; SGA 4 XVIII 3.1.10).
- (b)-(d) are the three special cases of the induction isomorphism (3.1.11.4) of SGA 4 XVIII 3.1.12, transposed from base change and the projection formula (XVII 5.2.6, 5.2.9) by uniqueness of adjoints; (c) is also Stacks 0GLE, (d) Stacks 0GLF.

**Acceptance.**

- For f étale, (a) reduces to f_*RHom(L, f^*K) ≅ RHom(f_!L, K), the usual adjunction formula.
- For f = i a closed immersion and L = Λ_X, (a) gives i_*Ri^!K ≅ RHom(i_*Λ_Z, K) = RHom_Z-supported, the local-cohomology form.

**Prerequisites.** `EDC.1:adjoint/exceptional-inverse-image`, `EDC.0/derived-tensor-and-internal-hom`, `EDC.0/coefficient-change`, `SchemeAndStackFoundations:SF.2`.

**Sources.**

- [Stacks-MoreEtale](https://stacks.math.columbia.edu/download/more-etale.pdf), Lemma 11.5 (tag 0GLC): Statement (a).
- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), Corollaires 3.1.12.2-3.1.12.3, p. 575-576: Statements (b) and (c).
- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), Corollaire 3.1.12.1, p. 575: Statement (d).

**Suggested location.** `TauCeti/AlgebraicGeometry/Etale/Duality/Theorems`, namespace `TauCeti.EtaleDuality`. Proposed declaration: `TauCeti.EtaleDuality.sheafified_adjunction`.

### i_*i^! is local cohomology

Node `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/local-cohomology-identification` · theorem.

For a closed immersion i : Z → X with open complement j : U → X and Λ torsion, the exceptional inverse image i^! of EDC.1:adjoint/exceptional-inverse-image is canonically isomorphic to Ri^! of EDC.0/cohomology-with-supports, compatibly with the adjunctions i_* ⊣ i^!; hence i_*i^!K ≅ RHom(i_*Λ_Z, K) (the local cohomology complex, by the sheafified adjunction for the finite morphism i), RΓ(Z, i^!K) = RΓ_Z(X, K), and there is a distinguished triangle i_*i^!K → K → Rj_*j^*K → with j^! = j^*.

**Hypotheses.**

- i a closed immersion (finite, hence compactifiable with Ri_! = i_*); Λ torsion.

**Construction and proof.**

- Ri_! = i_* (finite morphism); the right adjoint of i_* on derived categories is Ri^! (EDC.0/cohomology-with-supports); uniqueness of adjoints identifies it with i^!.
- The triangle is the localization triangle of EDC.0/cohomology-with-supports with Rj_* = j_* ∘ (right adjoint of j^* = j^!).

**Acceptance.**

- Z = X: i^! = id; Z = ∅: i^! = 0.

**Prerequisites.** `EDC.1:adjoint/exceptional-inverse-image`, `EDC.0/cohomology-with-supports`, `EDC.1:adjoint/sheafified-adjunction`.

**Sources.**

- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), Proposition 3.1.8 (ii), p. 571: Identification of i^! with sections with support.

**Suggested location.** `TauCeti/AlgebraicGeometry/Etale/Duality/Theorems`, namespace `TauCeti.EtaleDuality`. Proposed declaration: `TauCeti.EtaleDuality.upperShriek_closedImmersion_eq_derivedSupport`.

### The dualizing complex K_X = a^!Λ

Node `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/dualizing-complex` · definition. Planet: Dualizing complex.

Let k be a field, n invertible in k, Λ a ring with nΛ = 0, and a : X → Spec k separated of finite type. The dualizing complex of X is K_X := a^!Λ ∈ D(X, Λ). More generally, for f : X → S compactifiable, the relative dualizing complex is K_{X/S} := f^!Λ_S. For an étale (separated, finite type) map u : V → X, u^*K_X ≅ K_V; for a closed immersion i : Z → X, i^!K_X ≅ K_Z; for compactifiable X → Y → S, K_{X/S} ≅ h^!K_{Y/S}. No identification K_X ≅ Λ(d)[2d] is part of this definition: it is the theorem EDC.1:biduality/dualizing-complex-of-smooth-scheme, after smooth purity.

**Hypotheses.**

- X separated of finite type over a field k (or compactifiable over a quasi-compact quasi-separated S); Λ torsion, n invertible.
- Defined before and independently of smooth purity and biduality (SGA 4 XVIII 0.2).

**Construction and proof.**

- Apply EDC.1:adjoint/exceptional-inverse-image to the structure morphism; the restriction and composition formulas are the étale case and the pseudofunctoriality (EDC.1:adjoint/upper-shriek-pseudofunctor).

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.EtaleDuality.dualizingComplex` | data | K_X := a^!Λ ∈ D(X, Λ) for a : X → Spec k separated of finite type. |
| `TauCeti.EtaleDuality.relativeDualizingComplex` | data | K_{X/S} := f^!Λ_S for f compactifiable. |
| `TauCeti.EtaleDuality.dualizingComplex_spec` | simp | K_{Spec k} ≅ Λ. |
| `TauCeti.EtaleDuality.dualizingComplex_etale` | compatibility | u^*K_X ≅ K_V for u : V → X étale separated of finite type. |
| `TauCeti.EtaleDuality.dualizingComplex_closedImmersion` | compatibility | i^!K_X ≅ K_Z for a closed immersion i : Z → X. |
| `TauCeti.EtaleDuality.relativeDualizingComplex_comp` | functoriality | K_{X/S} ≅ h^!K_{Y/S} for compactifiable X →h Y → S. |

**Unit tests.**

- `TauCeti.EtaleDuality.dualizingComplex_point` (degenerate): For X = Spec k, K_X ≅ Λ.
- `TauCeti.EtaleDuality.dualizingComplex_finiteSeparable` (computation): For X = Spec L with L/k finite separable, K_X ≅ Λ_X.
- `TauCeti.EtaleDuality.dualizingComplex_curve` (computation): For X a smooth curve over an algebraically closed k, K_X ≅ Λ(1)[2] (after EDC.2:trace-purity/smooth-purity).
- `TauCeti.EtaleDuality.not_dualizingComplex_shift_of_constant` (non-example): Assume Λ ≠ 0. For X = Spec k ⊔ A¹_k (k algebraically closed), K_X restricts to Λ on the point and to Λ(1)[2] on the line, so K_X is not Λ_X(d)[2d] for any single d.

**Acceptance.**

- K_{Spec k} = Λ.
- For X = Spec L, L/k finite separable, K_X = Λ_X (a étale).

**Prerequisites.** `EDC.1:adjoint/exceptional-inverse-image`, `EDC.1:adjoint/upper-shriek-pseudofunctor`.

**Sources.**

- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 3.2.6, (3.2.6.1), p. 586: The role of a^!Λ (here identified with Z/n(d)[2d]) as the dualizing object of global duality.
- [Stacks-MoreEtale](https://stacks.math.columbia.edu/download/more-etale.pdf), Lemma 11.3 (tag 0GL9): Restriction of the dualizing complex along étale maps.

**Suggested location.** `TauCeti/AlgebraicGeometry/Etale/Duality/Dualizing`, namespace `TauCeti.EtaleDuality`.

### The Verdier duality functor D_X = RHom(−, K_X)

Node `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/verdier-dual` · definition. Planet: Verdier duality functor.

For X separated of finite type over a field k (n invertible, Λ torsion), the Verdier duality functor is the contravariant triangulated functor D_X : D(X, Λ)^op → D(X, Λ), D_X(K) := RHom(K, K_X). It satisfies D_X(K[m]) ≅ D_X(K)[−m], D_X(Λ_X) ≅ K_X, D_X(K ⊗^L L) ≅ RHom(K, D_X L), and there is a natural evaluation morphism ev_K : K → D_X D_X K. For u : V → X étale, u^*D_X ≅ D_V u^*. Biduality (ev_K an isomorphism on D^b_c) is not part of this definition: it is EDC.1:biduality/constructible-biduality.

**Hypotheses.**

- X separated of finite type over a field; Λ torsion; the functor is defined on all of D(X, Λ).

**Construction and proof.**

- Compose the internal RHom of EDC.0/derived-tensor-and-internal-hom with K_X; the shift and tensor formulas are the closed monoidal structure; ev_K is adjoint to the evaluation K ⊗^L RHom(K, K_X) → K_X.
- Étale restriction: u^*RHom(K, K_X) ≅ RHom(u^*K, u^*K_X) for u étale and u^*K_X ≅ K_V (EDC.1:adjoint/dualizing-complex).

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.EtaleDuality.verdierDual` | constructor | D_X : (D(X, Λ))ᵒᵖ ⥤ D(X, Λ), K ↦ RHom(K, K_X). |
| `TauCeti.EtaleDuality.verdierDual_shift` | compatibility | D_X(K[m]) ≅ D_X(K)[−m]. |
| `TauCeti.EtaleDuality.verdierDual_constant` | simp | D_X(Λ_X) ≅ K_X. |
| `TauCeti.EtaleDuality.verdierDual_tensor` | relation | D_X(K ⊗^L L) ≅ RHom(K, D_X L). |
| `TauCeti.EtaleDuality.verdierDualEval` | data | ev_K : K ⟶ D_X(D_X K), natural in K. |
| `TauCeti.EtaleDuality.verdierDual_etale` | compatibility | u^* ∘ D_X ≅ D_V ∘ u^* for u : V → X étale. |

**Unit tests.**

- `TauCeti.EtaleDuality.verdierDual_point` (computation): For X = Spec Ω, Ω algebraically closed, Λ self-injective (e.g. ℤ/n) and M a finitely generated Λ-module in degree 0, D_X(M) ≅ Hom_Λ(M, Λ) in degree 0.
- `TauCeti.EtaleDuality.verdierDual_zero` (degenerate): D_X(0) ≅ 0.
- `TauCeti.EtaleDuality.verdierDual_smoothCurve_constant` (computation): For X a smooth curve over an algebraically closed field, D_X(Λ_X) ≅ Λ(1)[2].
- `TauCeti.EtaleDuality.not_verdierDual_eq_linearDual` (non-example): Assume Λ ≠ 0 and X nonempty. D_X(Λ_X) ≇ RHom(Λ_X, Λ_X) = Λ_X on a smooth curve: duality is measured against K_X, not against Λ_X.

**Acceptance.**

- X = Spec Ω with Ω algebraically closed, Λ = ℤ/n: D(M) = Hom_{ℤ/n}(M, ℤ/n) for a finite ℤ/n-module M placed in degree 0 (ℤ/n is self-injective).

**Prerequisites.** `EDC.1:adjoint/dualizing-complex`, `EDC.0/derived-tensor-and-internal-hom`, `mathlib:CategoryTheory.Functor.IsTriangulated`.

**Sources.**

- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 3.2.6, p. 586: The dual on locally constant coefficients, the model case of D_X.

**Suggested location.** `TauCeti/AlgebraicGeometry/Etale/Duality/VerdierDual`, namespace `TauCeti.EtaleDuality`.

### Formal exchange: D_S ∘ Rf_! ≅ Rf_* ∘ D_X and D_X ∘ f^* ≅ f^! ∘ D_S

Node `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/formal-duality-exchange` · theorem.

Let f : X → S be a morphism of schemes separated of finite type over a field k, Λ torsion. With K_X ≅ f^!K_S (composition of exceptional inverse images): (a) for every L ∈ D(X, Λ), D_S(Rf_!L) ≅ Rf_*(D_X L); (b) for every K ∈ D(S, Λ), D_X(f^*K) ≅ f^!(D_S K). Both hold without constructibility or biduality. The dual forms D_S Rf_* ≅ Rf_! D_X and D_X f^! ≅ f^* D_S need biduality and are EDC.1:biduality/duality-exchange-isomorphisms.

**Hypotheses.**

- X, S separated of finite type over k; f compactifiable; Λ torsion.

**Construction and proof.**

- (a) is EDC.1:adjoint/sheafified-adjunction (a) with K := K_S, using f^!K_S ≅ K_X.
- (b) is the induction formula EDC.1:adjoint/sheafified-adjunction (b) with L := K_S.

**Acceptance.**

- For f = j an open immersion, (b) reads D_U(j^*K) ≅ j^*D_X K.

**Prerequisites.** `EDC.1:adjoint/sheafified-adjunction`, `EDC.1:adjoint/verdier-dual`, `EDC.1:adjoint/upper-shriek-pseudofunctor`.

**Sources.**

- [Stacks-MoreEtale](https://stacks.math.columbia.edu/download/more-etale.pdf), Lemma 11.6 (tag 0GLD): The global form of (a) with K = K_S.

**Suggested location.** `TauCeti/AlgebraicGeometry/Etale/Duality/Theorems`, namespace `TauCeti.EtaleDuality`. Proposed declaration: `TauCeti.EtaleDuality.verdierDual_lowerShriek, TauCeti.EtaleDuality.verdierDual_pullback`.

### The formal base-change and exchange maps for f^!

Node `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/base-change-exchange-maps` · construction.

For a cartesian square X′ →g′ X, f′ : X′ → S′, f : X → S, g : S′ → S with f compactifiable and Λ torsion, construct natural transformations: (i) the isomorphism Rg′_* f′^! ≅ f^! Rg_* (transpose of proper base change g^*Rf_! ≅ Rf′_!g′^*); (ii) the base-change morphism g′^*f^! → f′^!g^* (mate of (i)); (iii) the cobase-change morphism Rf′_!g′^! → g^!Rf_! for g compactifiable; (iv) the exchange morphism f^*RHom(K, L) → RHom(f^*K, f^*L) and its dual form f^!RHom(K, L) ≅ RHom(f^*K, f^!L). These are constructed as mates in the EnhancedDerivedSheaves coherent diagrams and satisfy the pasting laws for horizontal and vertical composition of squares. (ii) is an isomorphism for g étale here and for g smooth after EDC.2:trace-purity/smooth-purity; it is not an isomorphism for an arbitrary g.

**Hypotheses.**

- f compactifiable, S and S′ quasi-compact quasi-separated, Λ torsion.

**Construction and proof.**

- Take the mates of the proper base change isomorphism under the adjunctions Rf_! ⊣ f^!, g^* ⊣ Rg_* (EnhancedDerivedSheaves E3 mates and Beck-Chevalley), giving (i) and (ii); (iii) is the mate of the composition isomorphism (SGA 4 XVIII 3.1.13.2); (iv) is EDC.1:adjoint/sheafified-adjunction (b).
- Pasting: the mate correspondence is functorial for pasting of squares (EnhancedDerivedSheaves E3).

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.EtaleDuality.upperShriekPushforwardIso` | compatibility | Rg′_* ∘ f′^! ≅ f^! ∘ Rg_* for a cartesian square. |
| `TauCeti.EtaleDuality.upperShriekBaseChange` | data | The natural transformation g′^* ∘ f^! ⟶ f′^! ∘ g^*, the mate of (i). |
| `TauCeti.EtaleDuality.upperShriekCobaseChange` | data | Rf′_! ∘ g′^! ⟶ g^! ∘ Rf_! for g compactifiable. |
| `TauCeti.EtaleDuality.upperShriekBaseChange_etale` | simp | For g étale, upperShriekBaseChange is an isomorphism. |
| `TauCeti.EtaleDuality.upperShriekBaseChange_paste` | functoriality | Compatibility of upperShriekBaseChange with horizontal and vertical pasting of cartesian squares. |

**Unit tests.**

- `TauCeti.EtaleDuality.upperShriekBaseChange_id` (degenerate): For g = id the base-change map is the identity of f^!.
- `TauCeti.EtaleDuality.upperShriekBaseChange_openImmersion` (computation): For g an open immersion, g′^*f^! ≅ f′^!g^*.
- `TauCeti.EtaleDuality.not_upperShriekBaseChange_iso_closedPoint` (non-example): Over an algebraically closed field with nonzero prime-to-characteristic torsion Λ, take f = g = i : {0} → A¹ and f′ = g′ = id_{point}. This is the cartesian self-pullback of the closed immersion. Its base-change map i^!Λ = Λ(−1)[−2] → Λ is not an isomorphism. For f = id and arbitrary g the base-change map is an isomorphism.

**Acceptance.**

- For g étale, (ii) is the localization isomorphism of EDC.1:adjoint/upper-shriek-pseudofunctor.
- Over an algebraically closed field with nonzero prime-to-characteristic torsion Λ, take f = g = i : {0} → A¹ and f′ = g′ = id_{point}. In this cartesian self-pullback square, (ii) on Λ is i^!Λ = Λ(−1)[−2] → Λ, which is zero and not an isomorphism. For f = id and arbitrary g, (ii) is an isomorphism.

**Prerequisites.** `EDC.1:adjoint/exceptional-inverse-image`, `EDC.1:adjoint/sheafified-adjunction`, `EnhancedDerivedSheaves:E3/mates-and-beck-chevalley`, `SchemeAndStackFoundations:SF.2`.

**Sources.**

- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 3.1.13, (3.1.13.2), p. 576: Cobase-change map (iii).
- [Stacks-MoreEtale](https://stacks.math.columbia.edu/download/more-etale.pdf), Lemma 11.7 (tag 0GLE): Isomorphism (i).
- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 3.1.14, (3.1.14.2), p. 577–578: Cartesian base-change transformation, separately from the cobase-change map in 3.1.13.

**Suggested location.** `TauCeti/AlgebraicGeometry/Etale/Duality/Exchange`, namespace `TauCeti.EtaleDuality`.

## EDC.2:trace-purity — Trace, curve duality and smooth purity

Normalize the quasi-finite trace by scheme-theoretic fibre lengths and c₁ by the Kummer boundary. The curve duality input is proved from the Jacobian and Weil pairing. Effacement then identifies the adjoint of this specific trace on smooth morphisms.

### The trace for quasi-finite flat morphisms

Node `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/quasi-finite-flat-trace` · construction. Planet: Trace for finite flat maps.

For f : X → S separated, flat, of finite presentation and quasi-finite, and F an abelian sheaf on S, there is a unique trace morphism Tr_f : f_!f^*F → F such that (Var 1) Tr_f is natural in F; (Var 2) it is compatible with every base change S′ → S; (Var 3) for f = gh with g, h of the same kind, Tr_f = Tr_g ∘ g_!(Tr_h)g^*; (Var 4) if f is finite locally free of constant rank r, the composite F → f_*f^*F = f_!f^*F → F is multiplication by r. On geometric stalks over s̄, (f_!f^*F)_s̄ = ⊕_{x̄ ↦ s̄} F_s̄ and Tr_f is (a_x̄) ↦ Σ m_x̄ a_x̄, where m_x̄ is the length of the local ring of the fibre X_s̄ at x̄. For f étale, Tr_f is the counit of the adjunction f_! ⊣ f^*. With F replaced by K ∈ D(S, Λ), it gives Rf_!f^*K = f_!f^*K → K.

**Hypotheses.**

- f separated, flat, of finite presentation, quasi-finite (relative dimension zero); S arbitrary.
- F any abelian sheaf (no torsion hypothesis is needed in relative dimension zero).

**Construction and proof.**

- Reduce étale-locally to the finite flat pieces of SGA 4 XVII 6.2.1–6.2.2. Define the trace on a geometric fibre as the sum of coefficient stalks weighted by the lengths of its local rings; the weighted morphism construction in 6.2.3–6.2.5 glues these maps and proves base change and composition. Algebra.trace on regular functions is a different map and is not an input.
- Étale case: SGA 4 XVII 6.2.11 identifies f_! with the left adjoint of f^* and Tr_f with the counit.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.EtaleDuality.finiteFlatTrace` | constructor | Tr_f : f_!f^*F ⟶ F for f separated flat of finite presentation and quasi-finite. |
| `TauCeti.EtaleDuality.finiteFlatTrace_natural` | functoriality | Tr_f is natural in F. |
| `TauCeti.EtaleDuality.finiteFlatTrace_baseChange` | compatibility | g^*(Tr_f) corresponds to Tr_{f′} under the base-change isomorphism g^*f_! ≅ f′_!g′^*. |
| `TauCeti.EtaleDuality.finiteFlatTrace_comp` | functoriality | Tr_{gh} = Tr_g ∘ g_!(Tr_h). |
| `TauCeti.EtaleDuality.finiteFlatTrace_unit` | relation | For f finite locally free of constant rank r, Tr_f ∘ (unit of f^* ⊣ f_*) = r · id. |
| `TauCeti.EtaleDuality.finiteFlatTrace_etale` | compatibility | For f étale, Tr_f is the counit of f_! ⊣ f^*. |
| `TauCeti.EtaleDuality.finiteFlatTrace_stalk` | characterisation | On the stalk at s̄, Tr_f is (a_x̄) ↦ Σ_x̄ m_x̄ a_x̄ with m_x̄ the multiplicity of the fibre at x̄. |

**Unit tests.**

- `TauCeti.EtaleDuality.finiteFlatTrace_separable` (computation): For Spec L → Spec K with L/K finite separable of degree r, Tr ∘ unit = r on every sheaf.
- `TauCeti.EtaleDuality.finiteFlatTrace_square_map` (computation): For f : A¹ → A¹, x ↦ x², over an algebraically closed field of characteristic ≠ 2, the stalk of Tr_f at 0 is multiplication by 2 on F_0.
- `TauCeti.EtaleDuality.finiteFlatTrace_id` (degenerate): For f = id, Tr_f is the identity.
- `TauCeti.EtaleDuality.not_finiteFlatTrace_counit_ramified` (non-example): For x ↦ x² on A¹ the trace is not the counit of an adjunction f_! ⊣ f^*: at 0 it is 2 · id rather than an isomorphism compatible with a left adjoint, so 'trace = counit' holds only for étale f.

**Acceptance.**

- Spec L → Spec K for a finite separable extension of degree r: Tr ∘ unit = r.
- x ↦ x² on A¹ over an algebraically closed field of characteristic ≠ 2: at the origin the stalk of f_!f^*F is F_0 and Tr is multiplication by 2.

**Prerequisites.** `EDC.0/etale-derived-category`, `EDC.0/compact-pushforward-amplitude-and-colimits`, `mathlib:AlgebraicGeometry.Flat`, `mathlib:AlgebraicGeometry.LocallyQuasiFinite`, `mathlib:AlgebraicGeometry.IsFinite`, `mathlib:AlgebraicGeometry.Scheme.Hom.finrank`, `SchemeAndStackFoundations:SF.2`, `mathlib:AlgebraicGeometry.LocallyOfFinitePresentation`.

**Sources.**

- [SGA4-XVII](https://www.normalesup.org/~forgogozo/SGA4/17/17.pdf), Théorème 6.2.3, p. 422-423: Existence and uniqueness with (Var 1)-(Var 4).
- [SGA4-XVII](https://www.normalesup.org/~forgogozo/SGA4/17/17.pdf), Théorème 6.2.3 (Var 4), p. 423: Degree normalization.
- [SGA4-XVII](https://www.normalesup.org/~forgogozo/SGA4/17/17.pdf), Proposition 6.2.11, p. 430: Étale case.

**Suggested location.** `TauCeti/AlgebraicGeometry/Etale/Duality/Trace/FiniteFlat`, namespace `TauCeti.EtaleDuality`.

### The Kummer first Chern class c₁ : Pic(X) → H²(X, Λ(1))

Node `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/first-chern-class` · construction. Planet: Kummer first Chern class.

Let X be a scheme with n invertible on X and Λ a ring with nΛ = 0. The Kummer sequence 0 → μ_n → G_m →(·)^n G_m → 0 is exact on X_ét, and H¹(X_ét, G_m) = Pic(X) (both imported). The first Chern class is the composite c₁ : Pic(X) = H¹(X, G_m) →δ H²(X, μ_n) → H²(X, Λ(1)). It is a group homomorphism, natural for pullback, and kills nPic(X). For an effective Cartier divisor D ⊂ X with complement U, c₁(O(D)) is the image of the local class cl_D ∈ H²_D(X, μ_n) (boundary of the class of a local equation in H¹(U, μ_n)) under H²_D(X) → H²(X).

**Hypotheses.**

- n invertible on X; Λ with nΛ = 0.
- The Kummer sequence and Pic(X) = H¹(X, G_m) are imported (ConstructibleEtale through SchemeAndStackFoundations SF.2); Pic(X) and degrees of line bundles on curves come from JacobianChallenge Layer A.

**Construction and proof.**

- δ is the connecting map of the long exact sequence of the Kummer sequence (SGA 4 IX 3.2); compose with μ_n → Λ(1).
- Naturality from the naturality of the Kummer sequence under f^{-1}; additivity because δ is a homomorphism and [L ⊗ M] = [L] + [M] in H¹(G_m).
- Divisor form: the section 1 of O(D) trivializes O(D) on U, so [O(D)] comes from H¹_D(X, G_m), whose δ is the local class.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.EtaleDuality.firstChernClass` | constructor | c₁ : Pic(X) →+ H²(X, Λ(1)), the Kummer boundary. |
| `TauCeti.EtaleDuality.firstChernClass_tensor` | simp | c₁(L ⊗ M) = c₁(L) + c₁(M), c₁(O_X) = 0, c₁(L^∨) = −c₁(L). |
| `TauCeti.EtaleDuality.firstChernClass_pullback` | functoriality | c₁(f^*L) = f^*c₁(L). |
| `TauCeti.EtaleDuality.firstChernClass_pow` | relation | c₁(L^{⊗n}) = 0 for nΛ = 0. |
| `TauCeti.EtaleDuality.firstChernClass_divisor` | characterisation | For an effective Cartier divisor D, c₁(O(D)) is the image of the local class cl_D ∈ H²_D(X, Λ(1)). |
| `TauCeti.EtaleDuality.firstChernClass_changeN` | compatibility | For n′ \| n, reduction μ_n → μ_{n′} (via (·)^{n/n′}) sends c₁ to c₁ (SGA 4 XVIII (1.1.3.5)). |

**Unit tests.**

- `TauCeti.EtaleDuality.firstChernClass_projectiveLine` (computation): On P¹ over an algebraically closed field, c₁(O(1)) generates H²(P¹, μ_n) ≅ ℤ/n.
- `TauCeti.EtaleDuality.firstChernClass_trivial` (degenerate): c₁(O_X) = 0.
- `TauCeti.EtaleDuality.not_firstChernClass_injective` (non-example): c₁(O_{P¹}(n)) = 0 although O(n) is nontrivial: c₁ only sees Pic(X)/n.
- `TauCeti.EtaleDuality.firstChernClass_degree_curve` (compatibility): For X a smooth projective connected curve over an algebraically closed field, Tr_X(c₁(L)) = deg L mod n (with EDC.2:trace-purity/curve-trace).

**Acceptance.**

- On P¹ over an algebraically closed field, c₁(O(1)) generates H²(P¹, μ_n) ≅ ℤ/n and its curve trace is 1.
- c₁(O_X) = 0 and c₁(L^{⊗n}) = 0.

**Prerequisites.** `EDC.0/tate-twist`, `EDC.0/cohomology-with-supports`, `SchemeAndStackFoundations:SF.2`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree`, `SchemeAndStackFoundations:SF.0`, `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf`, `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial`, `tauceti:TauCeti.AlgebraicGeometry.LineBundleClass`, `tauceti:TauCeti.AlgebraicGeometry.LineBundleClass.mk`, `tauceti:TauCeti.AlgebraicGeometry.LineBundleClass.mk_tensorProduct`, `tauceti:TauCeti.AlgebraicGeometry.LineBundleClass.mk_trivial`.

**Sources.**

- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 1.1.3, (1.1.3.2), p. 485: Kummer identification on a complete curve, built from c₁.
- [Milne-LEC](https://www.jmilne.org/math/CourseNotes/LEC.pdf), §23, p. 138: Definition of c₁ (text layer of the PDF as extracted).

**Suggested location.** `TauCeti/AlgebraicGeometry/Etale/Duality/FirstChernClass`, namespace `TauCeti.EtaleDuality`.

### The trace morphism for curves

Node `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/curve-trace` · construction. Planet: Trace morphism for curves.

(a) Let X be a curve (separated, finite type, pure dimension one) over an algebraically closed field k of exponent characteristic p, n prime to p, with irreducible components c and multiplicities n_i = length O_{X,η_i}. Then H²_c(X, ℤ/n(1)) ≅ H²(X̄_red, ℤ/n(1)) ≅ Pic(X̄_red)/n ≅ (ℤ/n)^c (X̄ a completion of X_red, c₁ and degree), and Tr_X : H²_c(X, ℤ/n(1)) → ℤ/n is (a_i) ↦ Σ n_i a_i; it extends to Tr_X : H²_c(X, F(1)) → F for every torsion abelian group F prime to p. (b) For a flat compactifiable curve f : X → S (flat, finite presentation, separated, fibres of pure dimension one) and a torsion sheaf F on S prime to the residue characteristics, there is a unique Tr_f : R²f_!(f^*F(1)) → F, natural in F, compatible with every base change, and equal to (a) on geometric fibres. It satisfies: additivity over components (1.1.4); compatibility with quasi-finite flat traces on either side (1.1.7, 1.1.8); and Tr_f is an isomorphism when f is smooth with geometrically irreducible fibres (1.1.9).

**Hypotheses.**

- k algebraically closed for (a); in (b) S arbitrary (quasi-compact quasi-separated for compactifiability) and F torsion prime to residue characteristics.
- Uses the cohomology of curves over algebraically closed fields (H² = Pic/n, vanishing above 2), imported through SchemeAndStackFoundations SF.2, and the degree of line bundles from JacobianChallenge Layer A.

**Construction and proof.**

- (a): H²_c(X) ≅ H²_c(X_red) (topological invariance), and for the dense open X_red ⊂ X̄ the localization sequence (SGA 4 XVII 5.1.16.3) with the finite complement gives H²_c(X) ≅ H²(X̄); Kummer and degree give (ℤ/n)^c; define t((a_i)) = Σ n_i a_i (SGA 4 XVIII 1.1.3).
- (b): on P¹_S the Kummer map ℤ/n → R²p_*ℤ/n(1) is an isomorphism (checked fibrewise); its inverse is Tr_p. Where X admits a quasi-finite flat S-map u to P¹_S, set Tr_f := Tr_p ∘ Tr_u (EDC.2:trace-purity/quasi-finite-flat-trace), independent of u by checking fibrewise via 1.1.5; glue over such opens using right exactness of R²f_!; in general restrict to the dense Cohen-Macaulay locus. For F with nF = 0 use R²f_!ℤ/n(1) ⊗ F ≅ R²f_!(f^*F(1)) (projection formula) and pass to the limit (SGA 4 XVIII 1.1.6).
- 1.1.4, 1.1.7-1.1.9 are checked fibre by fibre from (a).

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.EtaleDuality.curveTrace` | constructor | Tr_f : R²f_!(f^*F(1)) ⟶ F for a flat compactifiable curve f : X → S and torsion F prime to the residue characteristics. |
| `TauCeti.EtaleDuality.curveTrace_baseChange` | compatibility | Tr_f is compatible with every base change S′ → S. |
| `TauCeti.EtaleDuality.curveTrace_components` | relation | For nonempty opens U_i of the irreducible components, the sum of the Tr_{U_i} factors through Tr_X (SGA 4 XVIII 1.1.4). |
| `TauCeti.EtaleDuality.curveTrace_quasiFiniteFlat` | functoriality | For u : X → Y quasi-finite flat over a curve Y, Tr_{fu} = Tr_f ∘ R²f_!(Tr_u) (1.1.7), and the dual compatibility for a quasi-finite flat base (1.1.8). |
| `TauCeti.EtaleDuality.curveTrace_isIso` | characterisation | If f is smooth with geometrically irreducible fibres, Tr_f is an isomorphism. |
| `TauCeti.EtaleDuality.curveTrace_firstChernClass` | compatibility | For X a proper smooth connected curve over an algebraically closed field, Tr_X(c₁(L)) = deg L mod n. |

**Unit tests.**

- `TauCeti.EtaleDuality.curveTrace_projectiveLine` (computation): On P¹ over an algebraically closed field, Tr(c₁(O(1))) = 1 ∈ ℤ/n.
- `TauCeti.EtaleDuality.curveTrace_twoLines` (computation): For X = A¹ ⊔ A¹ over an algebraically closed field, H²_c(X, Λ(1)) ≅ Λ² and Tr_X(a, b) = a + b.
- `TauCeti.EtaleDuality.curveTrace_empty` (degenerate): For the empty curve, H²_c = 0 and Tr = 0.
- `TauCeti.EtaleDuality.not_curveTrace_isIso_doubleLine` (non-example): For X = Spec k[x, y]/(y²) (a double line) and n = 2, Tr_X is multiplication by the multiplicity 2 on H²_c(X, ℤ/2(1)) ≅ ℤ/2, hence zero and not an isomorphism.

**Acceptance.**

- P¹ over k algebraically closed: Tr(c₁(O(1))) = 1.
- Two disjoint lines: H²_c ≅ Λ² and Tr is the sum.
- The double line Spec k[x, y]/(y²): Tr is multiplication by 2 on H²_c ≅ ℤ/n, not an isomorphism for n even.

**Prerequisites.** `EDC.2:trace-purity/first-chern-class`, `EDC.2:trace-purity/quasi-finite-flat-trace`, `EDC.0/compact-pushforward-amplitude-and-colimits`, `EDC.0/tate-twist`, `SchemeAndStackFoundations:SF.2`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree`.

**Sources.**

- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 1.1.3, (1.1.3.3), p. 486: Definition over an algebraically closed field, with multiplicities.
- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), Proposition 1.1.6, p. 489: Relative curve trace.
- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), Lemme 1.1.9, p. 491: Isomorphism criterion.

**Suggested location.** `TauCeti/AlgebraicGeometry/Etale/Duality/Trace/Curve`, namespace `TauCeti.EtaleDuality`.

### Poincaré duality on a smooth curve over an algebraically closed field

Node `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/curve-h1-duality` · theorem.

Let U be a smooth connected curve over an algebraically closed field k and n invertible in k. For every finite locally constant sheaf F of ℤ/n-modules on U and every r, the pairing H^r_c(U, F) × H^{2−r}(U, F^∨(1)) → H²_c(U, μ_n) →Tr ℤ/n is perfect. In particular H¹_c(U, ℤ/n) and H¹(U, μ_n) are dual, and for a tame finite étale cover u : U′ → U the trace Tr_u : H¹_c(U′, ℤ/n) → H¹_c(U, ℤ/n) is (after choosing μ_n ≅ ℤ/n) the transpose of u^* : H¹(U, ℤ/n) → H¹(U′, ℤ/n). The proof uses the Jacobian and Kummer theory and is independent of the general duality theorem.

**Hypotheses.**

- k algebraically closed, n invertible; U smooth connected (affine or proper).
- This is the curve input of SGA 4 XVIII §1 and must not be deduced from EDC.1:biduality or EDC.2:pairings (it is used to prove them).

**Construction and proof.**

- Dévissage (Milne LEC 14.7, steps 0-4): both sides vanish outside 0 ≤ r ≤ 2; both are δ-functors in F; a finite map U′ → U reduces F to a direct image of a constant sheaf; removing a point x compares the pair sequences, with H^r_x(U, μ_n) = ℤ/n for r = 2 and 0 otherwise (Kummer on the henselian trait); so it suffices to treat F = ℤ/n on a complete smooth curve X.
- Complete curve: H⁰ and H² are dual by the trace (EDC.2:trace-purity/curve-trace). In degree 1, Kummer gives H¹(X, μ_n) = Pic(X)[n] = J(k)[n] for the Jacobian J (JacobianChallenge Layer D) and H¹(X, ℤ/n) = Hom(π₁, ℤ/n) = Hom(J[n], ℤ/n) via the Abel-Jacobi pullback of isogenies; the cup product pairing is identified with the Weil pairing on J[n] (Milne LEC 14.8), which is perfect for the principal polarization (AbelianSchemesAndArithmeticModuli A3).
- Transposition 1.6.6: the trace Tr_u and u^* are adjoint for the cup-product pairing by the projection formula Tr_u(a ∪ u^*b) = Tr_u(a) ∪ b; perfectness on U and U′ then makes Tr_u the transpose of u^* (SGA 4 XVIII 1.6.6, first proof via 1.6.5.1).

**Acceptance.**

- U = A¹: H¹_c(A¹, ℤ/n) = 0 = H¹(A¹, μ_n).
- U = G_m: H¹_c(G_m, ℤ/n) ≅ ℤ/n and H¹(G_m, μ_n) = Γ(G_m, O)^×/n ≅ ℤ/n (generated by the Kummer class of the coordinate t), and the pairing is perfect.

**Prerequisites.** `EDC.2:trace-purity/curve-trace`, `EDC.2:trace-purity/first-chern-class`, `EDC.0/cohomology-with-supports`, `AbelianSchemesAndArithmeticModuli:A3`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`, `SchemeAndStackFoundations:SF.2`.

**Sources.**

- [Milne-LEC](https://www.jmilne.org/math/CourseNotes/LEC.pdf), Theorem 14.7, p. 93: Statement (symbols restored from the page; the text layer drops them).
- [Milne-LEC](https://www.jmilne.org/math/CourseNotes/LEC.pdf), Example 14.8, p. 93: The Jacobian input.
- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), Lemme 1.6.6, p. 545: The transposition statement used for effacement.

**Suggested location.** `TauCeti/AlgebraicGeometry/Etale/Duality/Theorems`, namespace `TauCeti.EtaleDuality`. Proposed declaration: `TauCeti.EtaleDuality.curve_h1_duality`.

### The fundamental effacement lemma for smooth curves

Node `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/curve-effacement-lemma` · theorem. Planet: Fundamental effacement lemma.

Let f : X → S be a smooth compactifiable curve, x̄ a geometric point of X with image s̄, and n ≥ 1 invertible on S. There exist an étale neighbourhood V of s̄ in S and an étale neighbourhood U of x̄ in X_V, with f′ : U → V, such that R⁰f′_!ℤ/n = 0, the trace map Tr_u : R¹f′_!ℤ/n → R¹f_{V!}ℤ/n of the étale map u : U → X_V is zero, and Tr_{f′} : R²f′_!ℤ/n(1) → ℤ/n is an isomorphism.

**Hypotheses.**

- f smooth compactifiable of relative dimension one; n invertible on S.

**Construction and proof.**

- R⁰f′_! = 0 holds once f′ is quasi-affine, and Tr_{f′} is an isomorphism once the geometric fibres of f′ are connected (curve-trace, 1.1.9); both are arranged étale-locally by EGA IV 15.6.5 (SGA 4 XVIII 1.6.8).
- Killing R¹: on a geometric fibre, take the maximal abelian n-torsion Galois cover U′ → U of a connected affine fibre; u^* is zero on H¹(U, ℤ/n), so by EDC.2:trace-purity/curve-h1-duality (1.6.6) Tr_u is zero on H¹_c (SGA 4 XVIII 1.6.7).
- Spread out the cover and use the acyclicity lemma for smooth morphisms (SGA 4 XV 2.6, imported with smooth base change) to make the images of Tr_u for shrinking U a decreasing filtered system with stationary value zero (SGA 4 XVIII 1.6.9).

**Acceptance.**

- For S = Spec k with k algebraically closed and X = A¹, U := A¹ minus a point with the n-th power cover already kills R¹.

**Prerequisites.** `EDC.2:trace-purity/curve-h1-duality`, `EDC.2:trace-purity/curve-trace`, `EDC.2:trace-purity/quasi-finite-flat-trace`, `SchemeAndStackFoundations:SF.2`.

**Sources.**

- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), Lemme fondamental 1.6.9, p. 548: Statement.
- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 0.2, p. 481-482: The inputs of the proof.

### The trace isomorphism for affine space

Node `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/affine-space-trace` · construction.

For a quasi-compact quasi-separated S, the standard vector bundle a_d : E^d_S = A^d_S → S, and a torsion sheaf F on S prime to the residue characteristics, there is an isomorphism Tr_{a_d} : R^{2d}a_{d!}a_d^*F(d) → F defined by induction: Tr_{a_0} = id, Tr_{a_1} is the curve trace (an isomorphism by 1.1.9), and Tr_{a_{d+1}} is the composite of Tr_{a_d} and R^{2d}a_{d!}(Tr_{a_1}) through E^{d+1} = E¹ ×_S E^d. Its source and target commute with base change; it is invariant under permutation of coordinates (any connected algebraic group acting on E^d acts trivially on R^{2d}a_{d!}).

**Hypotheses.**

- S quasi-compact quasi-separated; F torsion prime to the residue characteristics.

**Construction and proof.**

- Induction via the composition isomorphism R^{2d}f_!R^{2e}g_! ≅ R^{2(d+e)}(fg)_! (maximal-degree argument in the Leray spectral sequence, SGA 4 XVIII 2.7).
- Permutation invariance: the affine group acts on the base-change-compatible sheaf R^{2d}a_{d!}F(d), and a connected group acts trivially (2.8.2).

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.EtaleDuality.affineSpaceTrace` | constructor | Tr_{a_d} : R^{2d}a_{d!}a_d^*F(d) ≅ F. |
| `TauCeti.EtaleDuality.affineSpaceTrace_succ` | relation | Tr_{a_{d+1}} = Tr_{a_d} ∘ R^{2d}a_{d!}(Tr_{a_1}) under E^{d+1} = E¹ ×_S E^d. |
| `TauCeti.EtaleDuality.affineSpaceTrace_perm` | relation | Tr_{a_d} is invariant under permutations of the coordinates. |
| `TauCeti.EtaleDuality.affineSpaceTrace_baseChange` | compatibility | Tr_{a_d} commutes with every base change S′ → S. |

**Unit tests.**

- `TauCeti.EtaleDuality.affineSpaceTrace_zero` (degenerate): For d = 0, Tr_{a_0} is the identity of F.
- `TauCeti.EtaleDuality.affineSpaceTrace_line` (computation): For d = 1 over an algebraically closed field, Tr_{a_1} sends the class in H²_c(A¹, Λ(1)) of a point (Gysin image of 1) to 1.
- `TauCeti.EtaleDuality.affineSpaceTrace_swap` (characterisation): For d = 2, Tr_{a_2} ∘ σ^* = Tr_{a_2} for the coordinate swap σ of A².
- `TauCeti.EtaleDuality.not_affineSpaceTrace_lower_degree` (non-example): R^q a_{d!}Λ = 0 for q ≠ 2d (d ≥ 1, algebraically closed field): there is no nonzero trace in degree 2d − 1, so a 'trace' placed in any degree but 2d is zero.

**Acceptance.**

- d = 1: the curve trace of A¹; it sends the compactly supported class of a point to 1.

**Prerequisites.** `EDC.2:trace-purity/curve-trace`, `EDC.0/compact-pushforward-amplitude-and-colimits`, `mathlib:AlgebraicGeometry.AffineSpace`.

**Sources.**

- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 2.8, (2.8.1), p. 552-553: Definition.
- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 2.8.2, p. 553: Permutation invariance.

**Suggested location.** `TauCeti/AlgebraicGeometry/Etale/Duality/Trace/AffineSpace`, namespace `TauCeti.EtaleDuality`.

### The trace morphism Tr_f : R^{2d}f_!f^*F(d) → F

Node `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/flat-trace` · construction. Planet: Trace morphism Tr_f.

Consider triples (f, d, F): f : X → Y compactifiable, d an integer, F a torsion sheaf on Y prime to the residue characteristics, where f satisfies (∗)_d: there is an open U ⊂ X on which f is flat of finite presentation with fibres of dimension ≤ d and the fibres of X − U have dimension < d. There is a unique trace Tr_f : R^{2d}f_!f^*F(d) → F such that (Var 1) it is natural in F; (Var 2) it commutes with base change along Y′ → Y (Y′ quasi-compact quasi-separated); (Var 3) for composable X →g Y →f Z satisfying (∗)_e and (∗)_d, fg satisfies (∗)_{d+e} and Tr_{fg} = Tr_f ∘ R^{2d}f_!(Tr_g) under R^{2d}f_!R^{2e}g_! ≅ R^{2(d+e)}(fg)_!; (Var 4)(I) for d = 0 and f finite locally free of rank r, F → f_*f^*F → F is multiplication by r; (II) for the affine line it is the isomorphism (2.8.1). For d = 0 it is the quasi-finite flat trace, for curves the curve trace, for affine space (2.8.1) (Prop. 2.10). It is compatible with Künneth: Tr_{f×g} = Tr_f ⊗ Tr_g (2.12). In derived form, Tr_f : Rf_!(f^*K(d)[2d]) → K for K ∈ D(Y, Λ), Λ killed by n invertible (2.13.2). For Λ = ℤ/n with n ≥ 2, the sheaf trace R^{2d}f_!Λ(d) → Λ is an isomorphism iff every geometric fibre has exactly one d-dimensional irreducible component and its multiplicity is prime to n (Remark 2.10.1). This criterion does not assert that the derived trace Rf_!f^*K(d)[2d] → K is an isomorphism; it is not an iff for arbitrary F, for instance F = 0.

**Hypotheses.**

- f compactifiable satisfying (∗)_d (e.g. flat of finite presentation of pure relative dimension d); F torsion prime to residue characteristics.
- Uses only §1.1 of SGA 4 XVIII (not the effacement lemma).

**Construction and proof.**

- Reduction to the dense open U and to the Cohen-Macaulay locus: R^{2d} does not see closed subsets of fibre dimension < d (SGA 4 XVIII 2.1, 2.3) and is computed by étale covers (2.2).
- Locally on a Cohen-Macaulay flat X, choose a quasi-finite flat map u : X → E^d_Y and set Tr_f := Tr_{a_d} ∘ R^{2d}a_{d!}(Tr_u) (affine-space trace and quasi-finite flat trace); independence of u: two systems of parameters are joined by a chain changing one coordinate at a time (2.5-2.6), and changing one coordinate reduces to the curve case (1.1.7-1.1.8). Glue by uniqueness.
- Uniqueness: (Var 2) reduces to S an algebraically closed field, and (Var 3)-(Var 4) pin the trace on the generating classes.
- Künneth compatibility from (Var 3) and the asymmetric description of the Künneth map (SGA 4 XVII 5.4.3.5); the derived form by tensoring with K via the projection formula (2.13.1).

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.EtaleDuality.trace` | constructor | Tr_f : R^{2d}f_!f^*F(d) ⟶ F for f compactifiable satisfying (∗)_d. |
| `TauCeti.EtaleDuality.derivedTrace` | constructor | Tr_f : Rf_!(f^*K(d)[2d]) ⟶ K in D(Y, Λ), natural in K. |
| `TauCeti.EtaleDuality.trace_baseChange` | compatibility | (Var 2): compatibility with base change. |
| `TauCeti.EtaleDuality.trace_comp` | functoriality | (Var 3): Tr_{fg} = Tr_f ∘ R^{2d}f_!(Tr_g). |
| `TauCeti.EtaleDuality.trace_finite` | relation | (Var 4)(I): for d = 0 and f finite locally free of rank r, Tr_f ∘ unit = r. |
| `TauCeti.EtaleDuality.trace_affineLine` | compatibility | (Var 4)(II): for the affine line Tr_f is the isomorphism (2.8.1). |
| `TauCeti.EtaleDuality.trace_kunneth` | compatibility | Tr_{f×g} ∘ (Künneth) = Tr_f ⊗ Tr_g (SGA 4 XVIII 2.12). |
| `TauCeti.EtaleDuality.trace_isIso_iff` | characterisation | For Λ = ℤ/n, n ≥ 2, the sheaf trace R^{2d}f_!Λ(d) → Λ is an isomorphism iff each geometric fibre has one d-dimensional irreducible component of multiplicity prime to n. No such criterion for the derived trace or an arbitrary sheaf F is asserted. |
| `TauCeti.EtaleDuality.higherLowerShriek` | projection | R^q f_!K := ℋ^q(Rf_!K), the sheaf on which the trace is defined. |

**Unit tests.**

- `TauCeti.EtaleDuality.trace_projectiveSpace` (computation): For P^d over an algebraically closed field, Tr(c₁(O(1))^d) = 1.
- `TauCeti.EtaleDuality.trace_dimZero_separable` (computation): For Spec k′ → Spec k finite separable of degree r and d = 0, Tr ∘ unit = r.
- `TauCeti.EtaleDuality.trace_twoComponents` (computation): Assume Λ ≠ 0. For X = P¹ ⊔ P¹ over an algebraically closed field (d = 1), H²(X, Λ(1)) ≅ Λ² and Tr is the sum, so Tr is surjective but not injective.
- `TauCeti.EtaleDuality.not_trace_ignores_multiplicity` (non-example): For the double plane X = Spec k[x, y, z]/(z²) over an algebraically closed k and d = 2, Tr is multiplication by 2 on H⁴_c(X, Λ(2)) ≅ Λ; a trace defined without multiplicities (the identity there) violates (Var 4)(I) after a finite flat projection.

**Acceptance.**

- For X = Spec k′ → Spec k finite separable of degree r and d = 0, Tr ∘ unit = r.
- For P^d over an algebraically closed field, Tr(c₁(O(1))^d) = 1.

**Prerequisites.** `EDC.2:trace-purity/quasi-finite-flat-trace`, `EDC.2:trace-purity/curve-trace`, `EDC.2:trace-purity/affine-space-trace`, `EDC.0/compact-pushforward-amplitude-and-colimits`, `EDC.0/derived-tensor-and-internal-hom`, `mathlib:AlgebraicGeometry.Flat`, `SchemeAndStackFoundations:SF.2`.

**Sources.**

- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), Théorème 2.9, p. 553: Existence and uniqueness with (Var 1)-(Var 4).
- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), Proposition 2.10, p. 559: Special cases.
- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 2.13, (2.13.2), p. 560: Derived form.
- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), Remarque 2.10.1, p. 559: Isomorphism criterion.

**Suggested location.** `TauCeti/AlgebraicGeometry/Etale/Duality/Trace/Flat`, namespace `TauCeti.EtaleDuality`.

### Effacement for smooth morphisms (SGA 4 XVIII 2.14)

Node `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/smooth-effacement` · theorem.

Let f : X → S be smooth compactifiable of pure relative dimension d and n ≥ 1 invertible on S. For every geometric point x̄ of X over s̄ there are an étale neighbourhood V of s̄ and an étale neighbourhood U of x̄ in X_V, with f′_V : U → V and j : U → X_V, such that R^i f′_{V!}ℤ/n → R^i f_{V!}ℤ/n (the trace of j) is zero for i < 2d and Tr_{f′_V} : R^{2d}f′_{V!}ℤ/n(d) → ℤ/n is an isomorphism. Consequently (2.14.4) the map Rf′_{V!}ℤ/n(d) → Rf_{V!}ℤ/n(d) factors in D^b(V, ℤ/n) through Rf′_{V!}ℤ/n(d) → ℤ/n[−2d], the composite of the truncation and Tr_{f′_V}.

**Hypotheses.**

- f smooth compactifiable of pure relative dimension d; n invertible.

**Construction and proof.**

- d = 0 is trivial and d = 1 is EDC.2:trace-purity/curve-effacement-lemma. For d ≥ 2, factor f étale-locally as a smooth curve over a smooth morphism of relative dimension d − 1 and iterate, composing traces by (Var 3) of EDC.2:trace-purity/flat-trace.
- Lemma 2.14.2: in D^b of an abelian category, a composite of 2k morphisms each zero on H^p for p < k between complexes concentrated in [0, k] factors through H^k(K_0)[−k]; apply with 4d successive neighbourhoods to obtain the factorization 2.14.4.

**Acceptance.**

- For f : A^d_S → S and U a suitable étale neighbourhood, the factorization exhibits Rf′_!ℤ/n(d)[2d] → ℤ/n as the pro-trace.

**Prerequisites.** `EDC.2:trace-purity/curve-effacement-lemma`, `EDC.2:trace-purity/flat-trace`, `mathlib:AlgebraicGeometry.SmoothOfRelativeDimension`.

**Sources.**

- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), Theorem 2.14, pp. 561–563; Lemma 2.14.2 and Corollary 2.14.4, pp. 563–565: Effacement and derived trace factorization; the proof uses a finite chain of refinements, not an abstract top-cohomology identification.

### Smooth purity (Poincaré duality): f^!K ≅ f^*K(d)[2d]

Node `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/smooth-purity` · theorem. Planet: Smooth purity f^! ≅ f^*(d)[2d].

Let f : X → S be smooth and compactifiable, d the locally constant relative dimension, n ≥ 1 invertible on S, and Λ a ring with nΛ = 0. The morphism t_f : f^*K(d)[2d] → f^!K adjoint to the derived trace Tr_f : Rf_!(f^*K(d)[2d]) → K is an isomorphism for every K ∈ D(S, Λ). Hence f^! has finite cohomological amplitude, Rf_! is left adjoint to K ↦ f^*K(d)[2d] with counit Tr_f, and Hom(L, f^*K(d)[2d]) ≅ Hom(Rf_!L, K). The isomorphism is additive over the components of different relative dimension, compatible with composition (t_{gh} = t_h ∘ h^*t_g under (gh)^! ≅ h^!g^!, SGA 4 XVIII 3.2.4), with base change along any S′ → S (via the base-change map of EDC.1:adjoint/base-change-exchange-maps, which is therefore an isomorphism for smooth f), with products (Künneth compatibility of traces) and, for d = 0 (f étale), with the identification f^! = f^* whose counit is the quasi-finite flat trace. The normalization is fixed by Tr(class of a degree-one point) = 1 and Tr(c₁(O(1))) = 1 on P¹.

**Hypotheses.**

- f smooth compactifiable (S quasi-compact quasi-separated); d : X → ℕ locally constant.
- Λ any ring killed by n invertible on S, unbounded K allowed.
- This is smooth purity, not Gabber's absolute purity for regular pairs over arbitrary regular bases.

**Construction and proof.**

- For constant relative dimension d define t_f to be the adjoint of the derived trace, rather than deriving its identity with the adjoint via XVIII 3.2.3. Thus the counit identity is the adjunction identity by construction. Treat different dimensions on open and closed components.
- Fix a geometric x over s. Use the filtered neighbourhood pairs (U,V), where V is étale over S near s and U is étale over X_V near x. On V put C(U,V)=R(f_U)_!Λ_U(d)[2d], with transition maps the traces of the étale refinements, and the augmentation Tr_{f_U}:C(U,V)→Λ_V. Composition and base-change of the flat trace make the augmentation a morphism of these pro-systems, with no change of orientation.
- XVIII Theorem 2.14 kills the lower cohomology of transition maps after refinement and identifies the top trace with Λ_V; the upper cohomology vanishes by the compact-support dimension bound. Corollary 2.14.4, obtained by 4d successive refinements, factors the actual transition morphism in the derived category through this top trace. The augmented pro-system C(U,V) is therefore equivalent, through its given augmentation, to the system Λ_V. The factorization concerns the trace morphism itself, not only abstractly isomorphic cohomology groups.
- Apply Hom(−,K|_V[q]) and the filtered colimit. The localization formula XVIII 3.1.17, pp. 580–581 (also Stacks 0GLK) identifies the left colimit with the stalk of f^!K, while the constant-system colimit is the stalk of f^*K(d)[2d]. Under these identifications the augmentation induces exactly t_f, since both are adjoints of the same trace. Conservativity of geometric stalks proves it is an isomorphism for bounded-below K.
- The calculation gives the uniform amplitude of f^!, equal to that of f^*(d)[2d]. Truncation on uniform cohomology windows extends the equivalence to unbounded complexes; do not assume finite amplitude of f^! before establishing this calculation. Composition, base change and products follow by transposing the corresponding trace identities (XVIII 3.2.4–3.2.5, pp. 584–586).

**Acceptance.**

- For X = A¹ over an algebraically closed field: a^!Λ ≅ Λ(1)[2].
- For f étale (d = 0): t_f is the identification f^! = f^*.
- For a closed point i : x → C of a smooth curve over an algebraically closed field: i^!Λ ≅ Λ(−1)[−2], from (a_C)^! = Λ(1)[2] and (a_x)^! = Λ.

**Prerequisites.** `EDC.2:trace-purity/flat-trace`, `EDC.2:trace-purity/smooth-effacement`, `EDC.1:adjoint/exceptional-inverse-image`, `EDC.1:adjoint/upper-shriek-pseudofunctor`, `EDC.1:adjoint/base-change-exchange-maps`, `EDC.0/etale-derived-category`, `mathlib:AlgebraicGeometry.SmoothOfRelativeDimension`.

**Sources.**

- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), Théorème 3.2.5 (Dualité de Poincaré), p. 585: Statement.
- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 3.2.4, p. 584-585: Compatibility with composition.
- [Stacks-MoreEtale](https://stacks.math.columbia.edu/download/more-etale.pdf), Lemma 16.1 (tag 0GLK): The stalk formula for f^! used in the proof.
- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 2.14 and 2.14.4, pp. 561–565: The trace-compatible pro-system factorization, including transition maps.
- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 3.1.17, pp. 580–581: The stalk localization formula applied to the augmented system.

**Suggested location.** `TauCeti/AlgebraicGeometry/Etale/Duality/Theorems`, namespace `TauCeti.EtaleDuality`. Proposed declaration: `TauCeti.EtaleDuality.smooth_purity`.

### Top-degree compactly supported cohomology of a variety

Node `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/top-degree-compact-cohomology` · theorem.

Let X be separated of finite type of dimension ≤ d over an algebraically closed field k, n invertible in k, Λ = ℤ/n. Then H^q_c(X, F) = 0 for q > 2d and every torsion sheaf F, and étale topological invariance and the reduced smooth loci give H^{2d}_c(X, Λ(d)) ≅ Λ^{C_d}, C_d the set of irreducible components of dimension d, when the structure morphism satisfies (*)_d, its trace on the factor of a component of multiplicity m is multiplication by m. In particular, for X geometrically irreducible of dimension d over a field k₀ with k = k̄₀, H^{2d}_c(X_k, Λ) ≅ Λ(−d) as a Galois module (geometric Frobenius acting by q^d over 𝔽_q). For X smooth connected of dimension d and F locally constant constructible, H^{2d}_c(X, F) ≅ (F_x̄)_{π₁(X, x̄)}(−d) (coinvariants); this is EDC.2:pairings/extreme-degree-cohomology.

**Hypotheses.**

- X separated of finite type over an algebraically closed field (for the Galois statement, base change from k₀).

**Construction and proof.**

- Vanishing above 2d: SGA 4 XVII 5.2.8.1.
- Remove the smaller-dimensional components and a closed subset of dimension < d (XVIII 2.1). Pass to X_red using étale topological invariance, then to a dense smooth open in each component. Smooth purity identifies each summand with Λ. The trace of 2.9, when (*)_d holds, separately acts on this reduced-cohomology identification with the generic multiplicities (2.10.1); it need not be an isomorphism for nonreduced X.
- Galois equivariance: use topological invariance to pass to X_red, then a Galois-stable dense smooth open. On that geometrically irreducible smooth open, the trace is an isomorphism and is Galois-equivariant by (Var 2), giving H^{2d}_c(X_k, Λ) ≅ Λ(−d). The possibly noninvertible multiplicity-weighted trace of X itself is not used to deduce this identification.

**Acceptance.**

- X = P^d: H^{2d}(P^d, Λ(d)) ≅ Λ.
- X = A^d ∪ A^{d−1} (disjoint): H^{2d}_c ≅ Λ.

**Prerequisites.** `EDC.2:trace-purity/flat-trace`, `EDC.2:trace-purity/smooth-purity`, `EDC.0/compact-pushforward-amplitude-and-colimits`, `mathlib:IsSepClosed`.

**Sources.**

- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), Lemme 2.1, p. 550: Top degree does not see small closed subsets.
- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), Remarque 2.10.1, p. 559: Component count.

**Suggested location.** `TauCeti/AlgebraicGeometry/Etale/Duality/Theorems`, namespace `TauCeti.EtaleDuality`. Proposed declaration: `TauCeti.EtaleDuality.top_degree_compact_cohomology`.

## EDC.1:biduality — Constructible biduality and geometric duality

Compute the dimension-one étale dualizing base, then use proper pushforward of the evaluation cone and dimension induction. Derive reverse exchanges and constructible recollement after this theorem. Global geometric duality is adjunction over the separably closed base.

### The dualizing complex of a smooth scheme and the dual of a local system

Node `EtaleDualityAndPerverseSheaves:EDC.1:biduality/dualizing-complex-of-smooth-scheme` · theorem.

Let X be smooth of pure dimension d over a field k, n invertible in k, Λ with nΛ = 0. Then K_X ≅ Λ(d)[2d] canonically (via t_a for a : X → Spec k). If moreover Λ is self-injective (e.g. ℤ/ℓⁿ or O/πⁿ) and L is a locally constant constructible sheaf of Λ-modules, then RHom(L, Λ) = L^∨ := Hom(L, Λ) in degree 0 and D_X(L) ≅ L^∨(d)[2d]; the evaluation L → D_X D_X L is an isomorphism. For a smooth closed pair Z ⊂ X of pure codimension c, i^!K_X = K_Z gives i^!Λ_X ≅ Λ_Z(−c)[−2c].

**Hypotheses.**

- X smooth of pure dimension d over a field k; Λ killed by n invertible.
- Self-injectivity of Λ is used for L^∨ to be the derived dual; over ℤ_ℓ the derived dual has Ext terms (EDC.2:pairings/adic-and-rational-poincare-duality).

**Construction and proof.**

- K_X = a^!Λ ≅ a^*Λ(d)[2d] = Λ(d)[2d] by EDC.2:trace-purity/smooth-purity.
- For L locally constant constructible, ℰxt^q(L, Λ) is computed étale-locally where L is constant with finite stalk M, and Ext^q_Λ(M, Λ) = 0 for q > 0 because Λ is self-injective (EDC.1:biduality/self-injective-coefficients); so RHom(L, Λ(d)[2d]) = L^∨(d)[2d], and biduality reduces to M ≅ Hom(Hom(M, Λ), Λ) for finitely generated modules over a self-injective artinian ring (Matlis duality).
- Closed pair: i^!K_X ≅ K_Z by composition, then cancel twists (EDC.3/smooth-pair-purity gives the canonical form).

**Acceptance.**

- X a smooth curve over an algebraically closed field: K_X ≅ Λ(1)[2].

**Prerequisites.** `EDC.2:trace-purity/smooth-purity`, `EDC.1:adjoint/dualizing-complex`, `EDC.1:adjoint/verdier-dual`, `EDC.1:biduality/self-injective-coefficients`.

**Sources.**

- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 3.2.6, p. 586: Dual of a local system over a self-injective ring.
- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), Théorème 3.2.5, p. 586: K_X ≅ Λ(d)[2d].

**Suggested location.** `TauCeti/AlgebraicGeometry/Etale/Duality/Theorems`, namespace `TauCeti.EtaleDuality`. Proposed declaration: `TauCeti.EtaleDuality.dualizingComplex_smooth`.

### ℤ/ℓⁿ and O/πⁿ are self-injective

Node `EtaleDualityAndPerverseSheaves:EDC.1:biduality/self-injective-coefficients` · lemma.

Let O be a discrete valuation ring with uniformizer π (for example ℤ_ℓ or the ring of integers O_E of a finite extension E/ℚ_ℓ) and n ≥ 1. Then Λ = O/πⁿ is injective as a module over itself. Consequently Hom_Λ(−, Λ) is exact on Λ-modules, Ext^q_Λ(M, Λ) = 0 for q > 0, and M → Hom(Hom(M, Λ), Λ) is an isomorphism for finitely generated M. For Λ = ℤ/ℓ² the module ℤ/ℓ is not projective, so finite-level duality is a statement about the self-injective ring, not about a field.

**Hypotheses.**

- O a discrete valuation ring; n ≥ 1.

**Construction and proof.**

- Baer's criterion (Mathlib Module.Baer): the ideals of O/πⁿ are πᵏO/πⁿ; a map πᵏO/πⁿ → O/πⁿ sends πᵏ to an element killed by π^{n−k}, which lies in π^kO/πⁿ, so it extends to multiplication by an element.
- Matlis duality for the artinian local Gorenstein ring O/πⁿ gives the double-dual isomorphism on finitely generated modules (each is a sum of O/πᵏ).

**Acceptance.**

- Hom_{ℤ/ℓ²}(ℤ/ℓ, ℤ/ℓ²) ≅ ℤ/ℓ, generated by 1 ↦ ℓ.

**Prerequisites.** `mathlib:Module.Injective`, `mathlib:Module.Baer.injective`, `mathlib:ZMod`.

**Sources.**

- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 3.2.6, p. 586: Self-injectivity is what turns derived duality into ordinary duals.

**Suggested location.** `TauCeti/AlgebraicGeometry/Etale/Duality/Theorems`, namespace `TauCeti.EtaleDuality`. Proposed declaration: `TauCeti.EtaleDuality.zmod_selfInjective`.

### The étale dualizing base in dimension zero or one

Node `EtaleDualityAndPerverseSheaves:EDC.1:biduality/one-dimensional-dualizing-base` · theorem.

Let S be a field spectrum or an excellent regular noetherian scheme of pure dimension one, with n invertible, and Λ a noetherian commutative self-injective ring killed by n. The constant Λ_S is an étale dualizing object: RHom(−,Λ_S) preserves bounded constructible complexes and its evaluation is an isomorphism. For a closed point i in a regular curve/trait, i^!Λ_S≅Λ(−1)[−2]. These are étale Λ-module statements, independent of coherent O-module duality. For X→S set K_X=a^!Λ_S; this target fixes the base used by constructible biduality.

**Hypotheses.**

- For dimension one, use the constant base dualizing object with no global twist/shift; it differs from the geometric dualizing complex of a smooth curve over a field.
- n invertible on S; no absolute-purity theorem in higher dimension is imported.

**Construction and proof.**

- A geometric field point reduces to finite-module duality over Λ. Self-injectivity makes Hom(−,Λ) exact and the finite double-dual isomorphism follows by finite-length dévissage. Étale stalk conservativity descends the calculation to a field.
- At a strict henselian trait, the Kummer valuation sequence and local tame cohomology give i^!Λ=Λ(−1)[−2]. Wild inertia has prime-to-n finite quotients and exact invariants; the remaining tame group has n-primary cohomological dimension one, with H¹(M)=M_I(−1). Invariants and coinvariants are exchanged by Λ-duality. These explicit local calculations are requested from the finite-coefficient SF.2 import, not from coherent duality.
- For j:U↪S dense open and a finite lisse F on U, the same calculation gives RHom(j_*F,Λ_S)=j_*(F^∨), with higher sheaf Ext zero; j_* here is underived. The point-supported case follows from the closed-point calculation and finite-module double duality. No reverse derived exchange D Rj_* is used.
- Every constructible sheaf embeds into j_* of its finite lisse restriction with kernel and cokernel on finitely many closed points; triangles and bounded cohomological dévissage give the base evaluation isomorphism. These are the proof of SGA 4½ [Dualité] 1.3–1.4, pp. 156–157; the same finite-module calculation applies to self-injective artinian Λ.

**Acceptance.**

- On Spec Ω it is finite-module double duality, including Λ=ℤ/ℓ² and M=ℤ/ℓ.
- At a closed point of a regular trait the shift is −2 and twist −1, with the Kummer valuation fixing the generator.

**Prerequisites.** `EDC.1:biduality/self-injective-coefficients`, `EDC.1:adjoint/local-cohomology-identification`, `EDC.0/etale-derived-category`, `SchemeAndStackFoundations:SF.2`, `mathlib:IsRegularLocalRing`.

**Sources.**

- [SGA4half](https://publications.ias.edu/sites/default/files/Number32.pdf), [Dualité] 1.1–1.4, pp. 155–157: The dimension-one base calculation and duality; [Th. finitude] 4.1 supplies the relative base convention.

**Suggested location.** `TauCeti/AlgebraicGeometry/Etale/Duality/Theorems`, namespace `TauCeti.EtaleDuality`. Proposed declaration: `TauCeti.EtaleDuality.oneDimensionalBase_biduality`.

### Verdier biduality on constructible complexes

Node `EtaleDualityAndPerverseSheaves:EDC.1:biduality/constructible-biduality` · theorem. Planet: Verdier biduality.

Let X be separated of finite type over a field k (or over a excellent regular noetherian base of dimension ≤ 1 such as ℤ[1/ℓ]), n invertible, and Λ = O/πⁿ (more generally a noetherian self-injective ring killed by n). Then D_X preserves D^b_c(X, Λ) and D_ctf(X, Λ), and for K ∈ D^b_c(X, Λ) the evaluation ev_K : K → D_X D_X K is an isomorphism. Hence D_X : D^b_c(X, Λ)^op → D^b_c(X, Λ) is an anti-equivalence with D_X² ≅ id. For a general finite coefficient ring the statement is restricted to D_ctf, and no biduality is asserted for non-Gorenstein Λ.

**Hypotheses.**

- X separated of finite type over a field or an excellent regular noetherian base of dimension ≤1; n invertible.
- Λ noetherian, commutative, self-injective and killed by n; finite rings not self-injective are restricted to constructible finite-Tor complexes.
- The base dualizing object is Λ_S from one-dimensional-dualizing-base; K_X=a^!Λ_S. Imported finiteness is the étale finiteness theorem, not coherent sheaf biduality.

**Construction and proof.**

- First establish constructibility of D_XK by finite stratification and the finite-module duality calculation on smooth strata. The formal identity D_X j_!=Rj_*D_U and étale finiteness suffice; no identity D_X Rj_*=j_!D_U is needed. Purely inseparable extension reduces field strata to the perfect case without changing the étale site. Over a regular one-dimensional base use its dualizing calculation and generic/special-fibre stratification.
- For a proper a:X→S, formal adjunction gives D_S Ra_*≅Ra_*D_X before biduality. Check the evaluation square commutes (SGA 4½ [Th. finitude] Lemma 4.4, p. 250): under this identity Ra_*(ev_K) is ev_{Ra_*K}. Base biduality therefore gives Ra_*Cone(ev_K)=0.
- Use induction on the dimension of the support, with étale localization and a compactification, as in [Th. finitude] 4.3–4.5. Induction applied to fibres of local affine projections shows the cohomology sheaves of the evaluation cone have finite support on closed geometric points. For the trait case first remove the generic fibre using the field case; the same induction leaves finitely many closed points in the special fibre. This is precisely the finite-support conclusion of that proof, rather than a general assertion that proper pushforward is conservative.
- A finite-support constructible complex is pushed forward exactly along its finite support; its geometric stalks are finite direct sums of the support stalks. Thus Ra_*Cone(ev_K)=0 forces each support stalk, and hence the cone, to vanish. This proves biduality without invoking the reverse exchange which will be deduced from it at the next node.
- Initially use constructible finite-Tor complexes as in Theorem 4.3. Self-injective noetherian Λ has finite injective dimension zero, so the same bounded dévissage extends to D^b_c (4.7 explicitly treats ℤ/m); the finite-module lemma handles O/π^m as well. The duality preserves D_ctf by perfect local calculation.

**Acceptance.**

- X = Spec Ω (Ω separably closed): biduality is M ≅ Hom(Hom(M, Λ), Λ) on perfect complexes over Λ = ℤ/ℓⁿ.
- X a smooth curve, K = j_*L for j : U → X dense open and L locally constant: D_X(j_*L) ≅ j_*(L^∨)(1)[2] (used for Weil I 2.12).

**Prerequisites.** `EDC.1:biduality/dualizing-complex-of-smooth-scheme`, `EDC.1:adjoint/formal-duality-exchange`, `EDC.1:adjoint/verdier-dual`, `EDC.1:adjoint/local-cohomology-identification`, `EDC.0/constructible-ctf-complexes`, `SchemeAndStackFoundations:SF.2`, `EDC.1:biduality/one-dimensional-dualizing-base`.

**Sources.**

- [SGA4half](https://publications.ias.edu/sites/default/files/Number32.pdf), [Th. finitude] Theorem 4.3, Lemma 4.4 and §§4.5–4.7, pp. 250–251: The noncircular evaluation-cone proof, proper compatibility, generic/special-fibre induction and coefficient extension.
- [SGA4half](https://publications.ias.edu/sites/default/files/Number32.pdf), [Dualité] 1.1–1.4, pp. 155–157: The regular one-dimensional base input.
- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 3.2.6, p. 586: Smooth-stratum local-system duality, used only for constructibility and normalization.

**Suggested location.** `TauCeti/AlgebraicGeometry/Etale/Duality/Theorems`, namespace `TauCeti.EtaleDuality`. Proposed declaration: `TauCeti.EtaleDuality.verdierDualEval_isIso`.

### Duality exchanges f_* with f_! and f^* with f^!

Node `EtaleDualityAndPerverseSheaves:EDC.1:biduality/duality-exchange-isomorphisms` · theorem.

Under the hypotheses of EDC.1:biduality/constructible-biduality, for f : X → S a morphism of schemes separated of finite type over k and constructible complexes: D_S ∘ Rf_* ≅ Rf_! ∘ D_X on D^b_c(X, Λ) and D_X ∘ f^! ≅ f^* ∘ D_S on D^b_c(S, Λ); in particular, for i : Z → X closed and j : U → X open, D_Z i^* ≅ i^! D_X, D_X i_* ≅ i_* D_Z, D_U j^* ≅ j^* D_X and D_X Rj_* ≅ j_! D_U. Moreover D_X(K ⊗^L L) ≅ RHom(K, D_X L) for K, L ∈ D^b_c, and f^! preserves D^b_c.

**Hypotheses.**

- As in constructible-biduality; constructibility of Rf_* and f^! is part of the conclusion (f^! via f^! = D f^* D).

**Construction and proof.**

- Apply D to the formal exchanges D_S Rf_! ≅ Rf_* D_X and D_X f^* ≅ f^! D_S (EDC.1:adjoint/formal-duality-exchange) and use biduality on both sides; constructibility of f^!K follows from f^!K ≅ D_X f^* D_S K.

**Acceptance.**

- For i the inclusion of a closed point of a smooth curve C over an algebraically closed field: i^!Λ ≅ D(i^*D_C Λ) = D(Λ(1)[2]) = Λ(−1)[−2].

**Prerequisites.** `EDC.1:biduality/constructible-biduality`, `EDC.1:adjoint/formal-duality-exchange`.

**Sources.**

- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 3.1.10 and 3.2.6, p. 573 and 586: The sheafified adjunction from which the exchange isomorphisms follow after biduality.

### Open-closed recollement on constructible complexes

Node `EtaleDualityAndPerverseSheaves:EDC.1:biduality/recollement-adjunctions` · theorem. Planet: Open–closed recollement.

Let X be separated of finite type over a field, i : Z → X closed with open complement j : U → X, Λ = O/πⁿ (or a self-injective noetherian ring killed by n invertible). On D^b_c the six functors i^*, i_* = i_!, i^!, j_!, j^* = j^!, Rj_* satisfy: i^* ⊣ i_* ⊣ i^! and j_! ⊣ j^* ⊣ Rj_*; i_*, j_! and Rj_* are fully faithful; j^*i_* = 0, i^*j_! = 0 and i^!Rj_* = 0; and there are distinguished triangles j_!j^*K → K → i_*i^*K → and i_*i^!K → K → Rj_*j^*K →, natural in K. Duality exchanges the two triangles. These are the recollement data (BBD 1.4.3) that EDC.5 uses to glue the perverse t-structure.

**Hypotheses.**

- X separated of finite type over a field; constructible coefficients; Λ as in constructible-biduality.

**Construction and proof.**

- The adjunctions and triangles hold on the unbounded categories (EDC.0/cohomology-with-supports, EDC.1:adjoint/local-cohomology-identification); constructibility of Rj_* and i^! (imported finiteness and EDC.1:biduality/duality-exchange-isomorphisms) restricts them to D^b_c.
- The vanishing statements are checked on stalks (j^*i_*) or by adjunction (i^!Rj_* = right adjoint of j^*i_* = 0).

**Acceptance.**

- X = A¹, Z = {0}: for K = Λ the second triangle has i^!Λ = Λ(−1)[−2] and Rj_*Λ with stalk at 0 equal to Λ ⊕ Λ(−1)[−1]: both triangles and all shifts are verified (the closed-point acceptance test of EDC.1).

**Prerequisites.** `EDC.1:adjoint/local-cohomology-identification`, `EDC.1:biduality/duality-exchange-isomorphisms`, `EDC.0/cohomology-with-supports`, `EDC.0/constructible-ctf-complexes`, `SchemeAndStackFoundations:SF.2`.

**Sources.**

- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), Proposition 3.1.8, p. 571: The two exceptional inverse images of the recollement.

### Global Verdier duality over a field: relative and geometric forms

Node `EtaleDualityAndPerverseSheaves:EDC.1:biduality/relative-and-geometric-duality` · theorem. Planet: Global Verdier duality.

Let X be separated of finite type over a field k with a : X → Spec k, n invertible, Λ = O/πⁿ (or self-injective, killed by n). (a) Relative duality in D(k_ét, Λ): Ra_*D_X K ≅ RHom(Ra_!K, Λ) for every K ∈ D(X, Λ), as complexes of Gal(k_s/k)-modules. (b) Geometric duality: for X̄ := X ⊗_k k_s, RΓ(X̄, D_X̄ K̄) ≅ RHom_Λ(RΓ_c(X̄, K̄), Λ), and for K ∈ D^b_c, H^{−q}(X̄, D K̄) ≅ Hom_Λ(H^q_c(X̄, K̄), Λ) since Λ is self-injective. The relative form is not the same as a statement about absolute cohomology RΓ(X, −) = RΓ(k, Ra_*−): for X = Spec 𝔽_q and K = Λ, the absolute groups RΓ(X, D_X Λ) = RΓ(𝔽_q, Λ) are Λ in degrees 0 and 1, while RHom_Λ(RΓ(𝔽_q, Λ), Λ) is Λ in degrees 0 and −1, so the absolute analogue of (b) is false. Over ℤ_ℓ the derived dual and its Ext terms are retained (EDC.6 and EDC.2:pairings/adic-and-rational-poincare-duality).

**Hypotheses.**

- X separated of finite type over a field k; n invertible in k.
- (a) holds for all K ∈ D(X, Λ); the degreewise form in (b) uses self-injectivity of Λ.

**Construction and proof.**

- (a) is EDC.1:adjoint/sheafified-adjunction (a) for a with L := K and K := Λ, using a^!Λ = K_X (EDC.1:adjoint/dualizing-complex).
- For the displayed geometric duality, apply sheafified adjunction directly to ā : X_k̄ → Spec k̄. Do not commute Ra_* across the field extension by the proper base change theorem when a is not proper. Any separate comparison of the original relative duality object with its geometric stalk requires its own constructibility/base-change hypotheses.

**Acceptance.**

- X = Spec k: (a) is RHom(K, Λ) ≅ RHom(K, Λ).
- X = Spec 𝔽_q, K = Λ: relative duality holds in D(𝔽_q,ét, Λ), while the absolute form fails in degrees ±1 (H¹(𝔽_q, Λ) = Λ against Ext^{−1} = Λ in degree −1), as the stage requires to be tested.
- X = P¹ over an algebraically closed field: H^{−q}(X, D Λ) = H^{2−q}(X, Λ(1)) is dual to H^q(X, Λ).

**Prerequisites.** `EDC.1:adjoint/sheafified-adjunction`, `EDC.1:adjoint/dualizing-complex`, `EDC.1:biduality/self-injective-coefficients`, `EDC.0/constructible-ctf-complexes`, `SchemeAndStackFoundations:SF.2`.

**Sources.**

- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 3.2.6, p. 586: Geometric global duality over an algebraically closed field.
- [Stacks-MoreEtale](https://stacks.math.columbia.edu/download/more-etale.pdf), Lemma 11.6 (tag 0GLD): Relative form.

**Suggested location.** `TauCeti/AlgebraicGeometry/Etale/Duality/Theorems`, namespace `TauCeti.EtaleDuality`. Proposed declaration: `TauCeti.EtaleDuality.relative_duality`.

## EDC.2:pairings — Poincaré pairings and coefficient variants

Identify evaluation followed by the counit with cup product followed by trace. Keep finite self-injective coefficient duality, integral derived duality, and rational duality separate. Record the hypotheses needed for rank-one vanishing and field-valued eigenvalue comparisons.

### Poincaré duality for smooth varieties with torsion coefficients

Node `EtaleDualityAndPerverseSheaves:EDC.2:pairings/poincare-duality-torsion` · theorem. Planet: Poincaré duality pairing.

Let X be smooth, separated, of finite type and of pure dimension d over a separably closed field k, n invertible in k, Λ = O/πⁿ (e.g. ℤ/ℓⁿ), and F a locally constant constructible sheaf of Λ-modules. Then RΓ(X, F^∨(d)[2d]) ≅ RHom_Λ(RΓ_c(X, F), Λ), and for every i the pairing H^i_c(X, F) × H^{2d−i}(X, F^∨(d)) → H^{2d}_c(X, Λ(d)) →Tr Λ is a perfect pairing of finitely generated Λ-modules. For X proper, H_c = H. For general Λ killed by n the derived statement holds with F^∨ := RHom(F, Λ) and the degreewise statement needs self-injectivity.

**Hypotheses.**

- k separably closed (for a general k apply to X ⊗ k_s with Galois action: EDC.2:pairings/galois-frobenius-equivariance).
- X smooth separated of pure dimension d; F locally constant constructible; Λ = O/πⁿ.

**Construction and proof.**

- Combine EDC.1:biduality/relative-and-geometric-duality (b) with D_X F = F^∨(d)[2d] (EDC.1:biduality/dualizing-complex-of-smooth-scheme).
- The adjunction isomorphism is given by evaluation F ⊗ F^∨ → Λ followed by the counit R a_!a^!Λ → Λ. Taking cohomology identifies this map with cup product and the smooth trace; this is the formal evaluation/counit calculation, independent of the later cup-product-trace-pairing node.
- Finiteness of H^i_c and H^i: imported finiteness theorem.

**Acceptance.**

- X = P¹, F = Λ: H⁰ × H²(Λ(1)) → Λ and H¹ = 0.
- X = G_m, F = Λ: H¹_c(G_m, Λ) ≅ Λ is dual to H¹(G_m, Λ(1)) ≅ Λ.

**Prerequisites.** `EDC.1:biduality/relative-and-geometric-duality`, `EDC.1:biduality/dualizing-complex-of-smooth-scheme`, `SchemeAndStackFoundations:SF.2`.

**Sources.**

- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 3.2.6, (3.2.6.2), p. 586: Statement.
- [Milne-LEC](https://www.jmilne.org/math/CourseNotes/LEC.pdf), Theorem 24.1, p. 144: Pairing form (symbols restored from the page).

**Suggested location.** `TauCeti/AlgebraicGeometry/Etale/Duality/Theorems`, namespace `TauCeti.EtaleDuality`. Proposed declaration: `TauCeti.EtaleDuality.poincare_duality, TauCeti.EtaleDuality.poincarePairing`.

### The duality pairing is cup product followed by the trace; graded symmetry

Node `EtaleDualityAndPerverseSheaves:EDC.2:pairings/cup-product-trace-pairing` · theorem.

In the situation of EDC.2:pairings/poincare-duality-torsion, the pairing defined by the duality isomorphism equals ⟨x, y⟩ = Tr_X(x ∪ y) for x ∈ H^i_c(X, F), y ∈ H^{2d−i}(X, F^∨(d)), where ∪ : H^i_c(X, F) ⊗ H^j(X, G) → H^{i+j}_c(X, F ⊗ G) is the cup product and F ⊗ F^∨ → Λ is evaluation. For F = Λ and X proper, the cup-product pairing H^i(X, Λ) × H^{2d−i}(X, Λ(d)) → Λ satisfies ⟨x, y⟩ = (−1)^{i(2d−i)}⟨y, x⟩ = (−1)^i ⟨y, x⟩ after identifying Λ(d) ⊗ Λ ≅ Λ ⊗ Λ(d); in the middle degree i = d with d odd, graded commutativity proves alternation when 2 is invertible in Λ, and with d even it proves symmetry. The curve alternation for all n follows separately from the Weil pairing (curve-h1-duality); no general 2-primary alternation is deduced from the Koszul sign alone. For smooth proper f : X → S of relative dimension d with connected geometric fibres, R^{2d}f_*Λ(d) ≅ Λ via Tr_f and the fibrewise pairings R^jf_*Λ ⊗ R^{2d−j}f_*Λ → R^{2d}f_*Λ → Λ(−d) are morphisms of sheaves compatible with base change, so monodromy preserves them.

**Hypotheses.**

- As in poincare-duality-torsion; for the relative form f smooth proper with geometrically connected fibres, n invertible on S.

**Construction and proof.**

- The duality isomorphism is the adjoint of Tr through the evaluation K ⊗^L D K → K_X; on cohomology this is cup product with the evaluation map followed by Tr (SGA 4 XVIII 3.2.6, Milne LEC 24.1 discussion).
- Graded commutativity of the cup product on H*(X, Λ) (Koszul sign (−1)^{ij}), with i(2d − i) ≡ i mod 2. To infer ⟨x,x⟩ = 0 from 2⟨x,x⟩ = 0 require 2 invertible, or the separate curve Weil-pairing argument.
- Relative form: Tr_f is an isomorphism for connected geometric fibres (EDC.2:trace-purity/flat-trace, isomorphism criterion) and commutes with base change (Var 2); R^jf_* = R^jf_! commutes with base change (proper base change, imported).

**Acceptance.**

- Curve (d = 1): the pairing on H¹ is alternating, matching the Weil pairing on J[n] (Milne LEC 14.8).
- Surface (d = 2): the pairing on H² is symmetric; on P¹ × P¹ its matrix in the basis of the two rulings is [[0, 1], [1, 0]].

**Prerequisites.** `EDC.2:pairings/poincare-duality-torsion`, `EDC.2:trace-purity/flat-trace`, `SchemeAndStackFoundations:SF.2`, `EDC.2:trace-purity/curve-h1-duality`.

**Sources.**

- [Milne-LEC](https://www.jmilne.org/math/CourseNotes/LEC.pdf), §24, p. 145: The pairing is cup product.
- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), Proposition 2.12, p. 559-560: Trace compatible with products, used for the cup product form.

### Galois and Frobenius equivariance of the Poincaré pairing

Node `EtaleDualityAndPerverseSheaves:EDC.2:pairings/galois-frobenius-equivariance` · theorem.

Let X₀ be smooth separated of finite type of pure dimension d over a field k₀, X = X₀ ⊗ k_s, and F₀ locally constant constructible on X₀. The pairing H^i_c(X, F) × H^{2d−i}(X, F^∨(d)) → Λ of EDC.2:pairings/poincare-duality-torsion is Gal(k_s/k₀)-equivariant (Λ with trivial action). Over k₀ = 𝔽_q with geometric Frobenius F: for the untwisted pairing H^i_c(X, Λ) × H^{2d−i}(X, Λ) → H^{2d}_c(X, Λ) ≅ Λ(−d), one has ⟨Fx, Fy⟩ = q^d⟨x, y⟩. Consequently, if F acts on H^i_c with eigenvalue α then q^d/α is an eigenvalue of F on H^{2d−i}, with multiplicities preserved. Eigenvalue multisets and their algebraic multiplicities are statements for field coefficients (𝔽_ℓ or, after adic-and-rational-poincare-duality, ℚ_ℓ), not for modules over ℤ/ℓᵐ. The torsion-ring conclusion is the equivariance of the pairing itself.

**Hypotheses.**

- k₀ arbitrary for Galois equivariance; k₀ = 𝔽_q for the Frobenius statement.

**Construction and proof.**

- Trace and cup product are compatible with base change (Var 2) and hence with the Galois action; the twist Λ(d) carries the cyclotomic character.
- Geometric Frobenius acts on Λ(−d) by q^d (EDC.0/tate-twist).

**Acceptance.**

- X = P¹ over 𝔽_q: F acts on H⁰ by 1 and on H² by q, and ⟨F·1, Fy⟩ = q⟨1, y⟩.
- Elliptic curve E over 𝔽_q: the Frobenius eigenvalues α, β on H¹ satisfy αβ = q.

**Prerequisites.** `EDC.2:pairings/poincare-duality-torsion`, `EDC.2:pairings/cup-product-trace-pairing`, `EDC.0/tate-twist`.

**Sources.**

- [Deligne-WeilI-1974](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), (2.4), p. 281: The Galois-equivariant rational pairing and eigenvalue reciprocity. Finite-level equivariance follows from trace base change; eigenvalues require field coefficients.

### ℓ-adic and rational Poincaré duality, with the integral derived form kept separate

Node `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality` · theorem. Planet: ℓ-adic Poincaré duality.

Let X be smooth separated of finite type of pure dimension d over a separably closed field k, E/ℚ_ℓ finite with ring of integers O_E and uniformizer π, ℓ invertible in k, and F a lisse O_E-sheaf (compatible system (F_m) of locally constant constructible O_E/π^m-sheaves). With H^i_c(X, F) := lim_m H^i_c(X, F_m) and H^i(X, F^∨(d)) := lim_m H^i(X, F_m^∨(d)) (finitely generated O_E-modules), there is a derived duality RΓ(X, F^∨(d)[2d]) ≅ RHom_{O_E}(RΓ_c(X, F), O_E), hence short exact sequences 0 → Ext¹_{O_E}(H^{2d−i+1}_c(X, F), O_E) → H^i(X, F^∨(d)) → Hom(H^{2d−i}_c(X, F), O_E) → 0. After ⊗E, the pairing H^i_c(X, F_E) × H^{2d−i}(X, F_E^∨(d)) → E is a perfect pairing of finite-dimensional E-vector spaces, Galois-equivariant (Frobenius-equivariant over 𝔽_q).

**Hypotheses.**

- k separably closed; ℓ invertible; F lisse; finite-level duality is applied at each level O_E/π^m (self-injective).
- The ℓ-adic realization (limits, Mittag-Leffler for finite groups, finiteness of H^i) is imported from EllAdicRealization through SchemeAndStackFoundations SF.2; the pro-étale comparison is EDC.6.

**Construction and proof.**

- At level m: RΓ(X, F_m^∨(d)[2d]) ≅ RHom_{O/π^m}(RΓ_c(X, F_m), O/π^m) (EDC.2:pairings/poincare-duality-torsion), compatible with reduction (EDC.0/coefficient-change).
- Pass to the derived limit: R lim of RHom_{O/π^m}(C ⊗^L O/π^m, O/π^m) is RHom_{O_E}(C, O_E) for C a perfect O_E-complex computing RΓ_c(X, F) (finiteness), and the groups are finite so lim¹ vanishes.
- The universal coefficient sequence for RHom_{O_E}(C, O_E) gives the Ext¹ terms; they are torsion and vanish after ⊗E.

**Acceptance.**

- X a smooth projective curve of genus g, F = ℤ_ℓ: H¹(X, ℤ_ℓ) is free of rank 2g and the pairing H¹ × H¹ → ℤ_ℓ(−1) is perfect (unimodular).
- An Enriques surface over k of characteristic ≠ 2, ℓ = 2: H²(X, ℤ_2) has torsion ℤ/2 and H³(X, ℤ_2) ≅ ℤ/2, illustrating the Ext¹ term; over ℚ_2 the pairing is perfect.

**Prerequisites.** `EDC.2:pairings/poincare-duality-torsion`, `EDC.0/coefficient-change`, `EDC.2:pairings/galois-frobenius-equivariance`, `SchemeAndStackFoundations:SF.2`.

**Sources.**

- [Deligne-WeilI-1974](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), (2.14) A), p. 283: Passage from torsion to ℓ-adic coefficients.

### Poincaré duality on a projective curve with j_* coefficients (Weil I 2.12)

Node `EtaleDualityAndPerverseSheaves:EDC.2/curve-poincare-duality-with-j-star-statement` · theorem.

Write Λ for ℚ_ℓ in the rational case and O/πᵐ in the finite-level case. Let X be a projective smooth connected curve over an algebraically closed field k, j : U → X the inclusion of a dense open, ℓ invertible in k, and F a lisse ℚ_ℓ-sheaf (or a locally constant constructible O/πⁿ-sheaf) on U. Then D_X(j_*F) ≅ j_*(F^∨)(1)[2], and the pairing Tr(x ∪ y) : H^i(X, j_*F) ⊗ H^{2−i}(X, j_*F^∨(1)) → H²(X, j_*(F ⊗ F^∨)(1)) → H²(X, Λ(1)) → Λ is a perfect duality, Frobenius-equivariant when X, U and F are defined over 𝔽_q. The stalks of j_*F at the points of X − U are the local monodromy invariants. In the finite-level variant the trace target is Λ = O/πᵐ; in the rational variant it is ℚ_ℓ. The invariant/coinvariant duality used locally is valid for these self-injective finite coefficients.

**Hypotheses.**

- X projective smooth connected curve over k algebraically closed; F lisse on U; for ℚ_ℓ coefficients pass to the limit as in EDC.2:pairings/adic-and-rational-poincare-duality.
- The torsion statement needs the dual of j_*F to be j_*(F^∨)(1)[2], which is the local calculation at the punctures.

**Construction and proof.**

- Local calculation (Weil I (2.14) E; SGA 4½ [Dualité] 1.3, pp. 156–157): at a puncture s with inclusion i_s, i_s^*j_*F = F^{I_s} (invariants) and i_s^!j_*F = (F_{I_s})(−1)[−2] (coinvariants), and the duality between invariants and coinvariants of the dual representation gives D(j_*F) ≅ j_*(F^∨)(1)[2] (EDC.1:biduality/constructible-biduality, example).
- Then global duality (EDC.1:biduality/relative-and-geometric-duality) gives RΓ(X, j_*F^∨(1)[2]) ≅ RHom(RΓ(X, j_*F), Λ), identified with the cup-product pairing (EDC.2:pairings/cup-product-trace-pairing); pass to ℚ_ℓ.

**Acceptance.**

- Used in Weil I (3.9) and Weil II (3.3.5) to turn upper weight bounds into lower bounds; the pairing is on j_*F, not on j_!F.
- U = X: the usual Poincaré duality on the curve.

**Prerequisites.** `EDC.1:biduality/constructible-biduality`, `EDC.1:biduality/relative-and-geometric-duality`, `EDC.2:pairings/cup-product-trace-pairing`, `EDC.2:pairings/adic-and-rational-poincare-duality`.

**Sources.**

- [Deligne-WeilI-1974](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §2, Théorème (2.12), p. 283: Statement (displayed pairing reconstructed from the OCR fragments).
- [Deligne-WeilI-1974](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §2, (2.14) E), p. 283: Import boundary: the local computation is the first proof step.

### Cohomology in degrees 0 and 2d with compact supports

Node `EtaleDualityAndPerverseSheaves:EDC.2:pairings/extreme-degree-cohomology` · theorem.

Let X be smooth, separated, connected of dimension d ≥ 1 over a separably closed field k, n invertible, and F a locally constant constructible sheaf of Λ-modules (Λ = O/πⁿ) or a lisse ℚ_ℓ-sheaf. (a) H^{2d}_c(X, F) ≅ (F_x̄)_{π₁(X, x̄)}(−d), the coinvariants of the monodromy representation, twisted. (b) If X is affine, H⁰_c(X, F) = 0. (c) For d = 1 (a curve, Weil I (2.10)): H⁰_c(X, F) = 0 when X is affine and H²_c(X, F) = (F_x̄)_{π₁(X, x̄)}(−1). In particular, for a rank-one F over a field coefficient ring with geometrically nontrivial monodromy on a non-proper geometrically connected X, H⁰_c = H^{2d}_c = 0. For finite-ring coefficients require that some monodromy scalar χ(γ)−1 is a unit; nontrivial monodromy alone is insufficient. For example the ℤ/4 Kummer local system on G_m with monodromy −1 has coinvariants ℤ/2.

**Hypotheses.**

- X smooth connected; for (b) affine (or more generally with no proper component).

**Construction and proof.**

- (a): by EDC.2:pairings/poincare-duality-torsion, H^{2d}_c(X, F) is dual to H⁰(X, F^∨(d)) = ((F_x̄)^∨)^{π₁}(d), and duality exchanges invariants of the dual with coinvariants.
- (b): a section of F with compact (proper) support on a connected non-proper X is zero (its support is open and closed and proper).

**Acceptance.**

- X = A¹, F = Λ: H⁰_c = 0 and H²_c = Λ(−1).
- X = G_m, F = the Kummer sheaf of a nontrivial character χ of μ_m: H⁰_c = H²_c = 0.

**Prerequisites.** `EDC.2:pairings/poincare-duality-torsion`, `EDC.2:pairings/adic-and-rational-poincare-duality`, `EDC.2:trace-purity/top-degree-compact-cohomology`.

**Sources.**

- [Deligne-WeilI-1974](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), Scholie (2.10), p. 282: Statement for curves (OCR symbols restored).

### H⁰ and H² of F₁ ⊗ F₂^∨ on a proper curve

Node `EtaleDualityAndPerverseSheaves:EDC.2:pairings/lisse-tensor-hom-duality-on-curves` · theorem.

Let X be a projective smooth connected curve over an algebraically closed field (or the geometric curve of one over 𝔽_q), and F₁, F₂ lisse ℚ̄_ℓ-sheaves. Then H⁰(X, F₁ ⊗ F₂^∨) = Hom_X(F₂, F₁) and H²(X, F₁ ⊗ F₂^∨) ≅ H⁰(X, F₁^∨ ⊗ F₂(1))^∨ = Hom_X(F₁, F₂)^∨(−1), Frobenius-equivariantly for Weil sheaves; on a non-proper U the same holds for H⁰_c = 0 and H²_c by EDC.2:pairings/extreme-degree-cohomology. (Yu prints the two Hom's in the opposite order; see sourceIssues.)

**Hypotheses.**

- Lisse ℚ̄_ℓ coefficients (via finite E and passage to the limit).

**Construction and proof.**

- F₁ ⊗ F₂^∨ ≅ Hom(F₂, F₁) as lisse sheaves, so global sections are Hom_X(F₂, F₁).
- Poincaré duality (EDC.2:pairings/adic-and-rational-poincare-duality) on the proper curve gives H²(X, G) ≅ H⁰(X, G^∨(1))^∨ with G^∨ = F₁^∨ ⊗ F₂ ≅ Hom(F₁, F₂).
- Frobenius equivariance from EDC.2:pairings/galois-frobenius-equivariance.

**Acceptance.**

- F₁ = F₂ irreducible: H⁰ and H² are one-dimensional, giving the pole of the self-pair L-function (Yu Prop. 6.1.1).

**Prerequisites.** `EDC.2:pairings/adic-and-rational-poincare-duality`, `EDC.2:pairings/galois-frobenius-equivariance`, `EDC.2:pairings/extreme-degree-cohomology`.

**Sources.**

- [Yu-2023](https://arxiv.org/pdf/1807.04659v5), §6.1, equations (6.1.1)-(6.1.2), p. 42: The printed formulas, with the Hom arguments reversed; the node states the corrected form (known erratum PAPER-YU-23/E14).

### Relative Poincaré duality for smooth morphisms with locally constant coefficients

Node `EtaleDualityAndPerverseSheaves:EDC.2:pairings/relative-duality-locally-constant` · theorem.

Let f : X → S be smooth compactifiable of pure relative dimension d, n invertible on S, Λ = O/πⁿ, and F a locally constant constructible sheaf of Λ-modules on X such that the R^q f_!(F^∨) are locally constant constructible for all q. Then R^q f_*F ≅ Hom_Λ(R^{2d−q}f_!(F^∨), Λ)(−d) for every q, compatibly with base change; in particular, for f proper smooth the sheaves R^q f_*F and R^{2d−q}f_*(F^∨(d)) are dual local systems. This is the scheme analogue of Berkovich's Theorem 7.4.9 requested by ClassicalAdicEtaleCohomology H5.

**Hypotheses.**

- f smooth compactifiable of pure relative dimension d; F locally constant constructible with locally constant R^q f_!(F^∨); Λ self-injective.

**Construction and proof.**

- Rf_*RHom(F^∨, f^!Λ) ≅ RHom(Rf_!F^∨, Λ) (EDC.1:adjoint/sheafified-adjunction), with f^!Λ = Λ(d)[2d] (EDC.2:trace-purity/smooth-purity) and RHom(F^∨, Λ) = F.
- If the R^q f_!F^∨ are locally constant constructible, ℰxt^p(R^q f_!F^∨, Λ) = 0 for p > 0 (self-injectivity, stalkwise), so the spectral sequence degenerates to the stated isomorphism.

**Acceptance.**

- f : A^d_S → S, F = Λ: R^q f_*Λ = Λ for q = 0 and 0 otherwise, dual to R^{2d}f_!Λ(d) ≅ Λ.

**Prerequisites.** `EDC.1:adjoint/sheafified-adjunction`, `EDC.2:trace-purity/smooth-purity`, `EDC.1:biduality/self-injective-coefficients`.

**Sources.**

- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), Théorème 3.2.5, p. 585: The relative setting in which the duality holds.

## EDC.3 — Supported classes, Gysin maps and cycle classes

Start with smooth-pair purity and semi-purity. Construct supported fundamental classes and Gysin maps; derive the early projective-space basis before projective-bundle freeness and Chern classes. Weighted supported classes then give rational-equivalence descent and Tor intersection compatibility. Self-intersection uses the support comparison in the normal deformation.

### Cohomological purity for a smooth pair

Node `EtaleDualityAndPerverseSheaves:EDC.3/smooth-pair-purity` · theorem. Planet: Purity for smooth pairs.

Let k be a field, n invertible in k, Λ with nΛ = 0, X smooth over k and i : Z → X a closed immersion with Z smooth over k, of pure codimension c. Then there is a canonical isomorphism i^!Λ_X ≅ Λ_Z(−c)[−2c] in D(Z, Λ); equivalently ℋ^q_Z(Λ_X) = 0 for q ≠ 2c and ℋ^{2c}_Z(Λ(c)) ≅ Λ_Z, and for every locally constant constructible F on X, H^q_Z(X, F) ≅ H^{q−2c}(Z, i^*F(−c)). The generator s_{Z/X} ∈ H^{2c}_Z(X, Λ(c)) corresponding to 1 is the fundamental class (EDC.3/fundamental-class); for c = 1 it is the Kummer local class of the divisor Z (EDC.2:trace-purity/first-chern-class). The formula is for a smooth pair over a field; a regular immersion into a singular ambient scheme, or a regular pair over a trait, is not covered (that is Gabber's absolute purity, outside this roadmap's stated scope).

**Hypotheses.**

- X and Z smooth over the field k; i a closed immersion of pure codimension c.
- F locally constant constructible for the version with coefficients (projection formula for i^!).

**Construction and proof.**

- Composition of exceptional inverse images: i^!a_X^! ≅ a_Z^! (EDC.1:adjoint/upper-shriek-pseudofunctor), with a_X^!Λ = Λ(d)[2d] and a_Z^!Λ = Λ(d − c)[2(d − c)] (EDC.2:trace-purity/smooth-purity), so i^!Λ_X(d)[2d] ≅ Λ_Z(d − c)[2d − 2c]; cancel the invertible twist and shift (EDC.0/tate-twist).
- Canonicity: the composite is independent of d (additivity over components) and compatible with étale localization on X; for c = 1, compare with the Kummer local class by reducing étale-locally to Z = {t = 0} ⊂ A¹ × Z and the computation on A¹ (EDC.0/cohomology-with-supports test).
- Coefficients: i^!(F) ≅ i^*F ⊗ i^!Λ for F locally constant (projection formula / induction formula, EDC.1:adjoint/sheafified-adjunction).
- Local calculation: a smooth pair is étale-locally isomorphic to the zero section Z → Z × A^c (EGA IV 17.12.2); by étale excision (EDC.0/cohomology-with-supports) and the Künneth formula the canonical isomorphism is the c-fold external product of the point-on-a-line case H²_{0}(A¹, Λ(1)) ≅ Λ, so the identification is independent of the chart and agrees with the composition isomorphism.

**Acceptance.**

- A point on a curve: i^!Λ ≅ Λ(−1)[−2].
- A hyperplane P^{n−1} ⊂ P^n: H^q_{P^{n−1}}(P^n, Λ) ≅ H^{q−2}(P^{n−1}, Λ(−1)).

**Prerequisites.** `EDC.2:trace-purity/smooth-purity`, `EDC.1:adjoint/upper-shriek-pseudofunctor`, `EDC.1:adjoint/local-cohomology-identification`, `EDC.1:adjoint/sheafified-adjunction`, `EDC.0/tate-twist`, `mathlib:AlgebraicGeometry.IsClosedImmersion`, `mathlib:AlgebraicGeometry.Smooth`.

**Sources.**

- [Milne-LEC](https://www.jmilne.org/math/CourseNotes/LEC.pdf), Theorem 16.1, p. 108: Statement over an algebraically closed field (symbols restored from the page).
- [SGA4-XVIII](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 3.1.13, p. 576: Composition of f^!, which reduces purity of the pair to smooth purity of X and Z.

**Suggested location.** `TauCeti/AlgebraicGeometry/Etale/Duality/Theorems`, namespace `TauCeti.EtaleDuality`. Proposed declaration: `TauCeti.EtaleDuality.smooth_pair_purity`.

### Semi-purity: H^q_Z(X, Λ) = 0 for q < 2c

Node `EtaleDualityAndPerverseSheaves:EDC.3/semi-purity` · theorem.

Let X be smooth over a perfect field k, n invertible, and Z ⊂ X a closed subset of codimension ≥ c. Then H^q_Z(X, F) = 0 and ℋ^q_Z(F) = 0 for q < 2c and every locally constant constructible F. Consequently, for Y ⊂ Z closed of codimension ≥ c + 1 in X, restriction H^{2c}_Z(X, F) → H^{2c}_{Z−Y}(X − Y, F) is an isomorphism (and injective in degree 2c + 1).

**Hypotheses.**

- X smooth over a perfect field k (so the regular locus of a reduced closed subscheme is smooth and dense); codim Z ≥ c.

**Construction and proof.**

- Induction on dim Z: the singular locus Y of Z_red has smaller dimension; the triple sequence H^q_Y(X) → H^q_Z(X) → H^q_{Z−Y}(X − Y) gives the vanishing from purity for the smooth pair (Z − Y, X − Y) (EDC.3/smooth-pair-purity) and induction for Y (codimension ≥ c + 1, so H^q_Y = 0 for q < 2c + 2) (Milne LEC 23.1).
- The isomorphism in degree 2c follows from the same sequence.

**Acceptance.**

- Z a point on a surface (c = 2): H^q_Z = 0 for q < 4.

**Prerequisites.** `EDC.3/smooth-pair-purity`, `EDC.0/cohomology-with-supports`, `mathlib:PerfectField`.

**Sources.**

- [Milne-LEC](https://www.jmilne.org/math/CourseNotes/LEC.pdf), Lemma 23.1 (Semi-purity), p. 138: Statement (Λ restored).

**Suggested location.** `TauCeti/AlgebraicGeometry/Etale/Duality/Theorems`, namespace `TauCeti.EtaleDuality`. Proposed declaration: `TauCeti.EtaleDuality.semi_purity`.

### The fundamental class with supports of a cycle

Node `EtaleDualityAndPerverseSheaves:EDC.3/fundamental-class` · construction. Planet: Fundamental class with supports.

Let X be smooth of pure dimension d over a perfect field k, n invertible, Λ = ℤ/n (or O/πⁿ). For an integral closed subscheme Z ⊂ X of codimension c with (smooth, dense) regular locus Z° = Z − Y, the fundamental class s_{Z/X} ∈ H^{2c}_Z(X, Λ(c)) is the unique class restricting to the purity generator s_{Z°/(X−Y)} ∈ H^{2c}_{Z°}(X − Y, Λ(c)) (EDC.3/smooth-pair-purity), which exists and is unique by semi-purity. Extend linearly to cycles: for α = Σ m_i[Z_i] of codimension c with support |α|, s_α := Σ m_i s_{Z_i/X} ∈ H^{2c}_{|α|}(X, Λ(c)). For Z smooth it is the image of 1 under purity; for c = 1 and Z a Cartier divisor it is the Kummer local class. Smooth purity is never applied to a singular Z; over an imperfect field, where the regular locus may fail to be smooth, the construction is not asserted.

**Hypotheses.**

- X smooth over a perfect field k; Z integral of pure codimension c; n invertible.
- Perfectness of k makes the regular locus of Z smooth and dense (covers finite fields and algebraically closed fields).

**Construction and proof.**

- Semi-purity (EDC.3/semi-purity) with Y = Sing(Z) of codimension ≥ c + 1 in X gives H^{2c}_Z(X) ≅ H^{2c}_{Z°}(X − Y); define s_{Z/X} as the preimage of the purity generator.
- Compatibility with étale restriction and with open restriction X′ ⊂ X follows from uniqueness.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.EtaleDuality.fundamentalClass` | constructor | s_{Z/X} ∈ H^{2c}_Z(X, Λ(c)) for Z ⊂ X integral of codimension c, X smooth over a perfect field. |
| `TauCeti.EtaleDuality.fundamentalClass_restrict` | characterisation | s_{Z/X} is the unique class restricting to the purity generator on X − Sing(Z). |
| `TauCeti.EtaleDuality.fundamentalClass_smooth` | compatibility | For Z smooth, s_{Z/X} is the image of 1 under purity H⁰(Z, Λ) ≅ H^{2c}_Z(X, Λ(c)). |
| `TauCeti.EtaleDuality.fundamentalClass_divisor` | compatibility | For c = 1 and Z a Cartier divisor, s_{Z/X} is the Kummer local class; its image in H²(X, Λ(1)) is c₁(O(Z)). |
| `TauCeti.EtaleDuality.fundamentalClass_etale` | functoriality | u^*s_{Z/X} = s_{u^{-1}Z/X′} for u : X′ → X étale. |
| `TauCeti.EtaleDuality.fundamentalClassOfCycle` | constructor | s_α ∈ H^{2c}_{\|α\|}(X, Λ(c)) for a codimension-c cycle α, additive in α. |

**Unit tests.**

- `TauCeti.EtaleDuality.fundamentalClass_hyperplane` (computation): For a hyperplane H ⊂ P^n over an algebraically closed field, the image of s_{H/P^n} in H²(P^n, Λ(1)) is c₁(O(1)).
- `TauCeti.EtaleDuality.fundamentalClass_nodalCubic` (computation): For the nodal cubic C ⊂ P² over an algebraically closed field of characteristic ≠ 2, 3, the image of s_{C/P²} is 3c₁(O(1)), computed through the smooth locus.
- `TauCeti.EtaleDuality.fundamentalClass_whole` (degenerate): For Z = X (c = 0), s_{X/X} = 1 ∈ H⁰(X, Λ).
- `TauCeti.EtaleDuality.not_fundamentalClass_purity_singular` (non-example): Over an algebraically closed characteristic-zero field with Λ = ℤ/3, let Z = {xy = 0} ⊂ A². The stalk at the crossing of ℋ²_Z(Λ(1)) is Λ², generated by the two branches (local Kummer residues), whereas Λ_Z has stalk Λ. Thus i^!Λ cannot be Λ_Z(−1)[−2]; the fundamental classes of the branches exist without asserting purity for the singular union.

**Acceptance.**

- For a hyperplane H ⊂ P^n, s_{H/P^n} maps to c₁(O(1)) in H²(P^n, Λ(1)).
- For the nodal cubic C ⊂ P², s_{C/P²} maps to 3c₁(O(1)) = c₁(O(3)) although C is singular.

**Prerequisites.** `EDC.3/smooth-pair-purity`, `EDC.3/semi-purity`, `EDC.2:trace-purity/first-chern-class`, `mathlib:AlgebraicGeometry.AlgebraicCycle`, `mathlib:PerfectField`.

**Sources.**

- [Milne-LEC](https://www.jmilne.org/math/CourseNotes/LEC.pdf), §23, p. 139: Construction through the dense smooth locus (symbols restored).

**Suggested location.** `TauCeti/AlgebraicGeometry/Etale/Duality/FundamentalClass`, namespace `TauCeti.EtaleDuality`.

### Gysin maps and proper pushforward in cohomology

Node `EtaleDualityAndPerverseSheaves:EDC.3/gysin-map` · construction. Planet: Gysin map.

(a) For a closed immersion i : Z → X of smooth k-schemes of pure codimension c and F locally constant constructible on X, the Gysin map i_* : H^q(Z, i^*F(m)) → H^{q+2c}(X, F(m + c)) is the composite of the purity isomorphism H^q(Z, i^*F(m)) ≅ H^{q+2c}_Z(X, F(m + c)) and forgetting supports. (b) For f : Y → X proper between smooth k-schemes of pure dimensions d_Y and d_X, e := d_Y − d_X, f_* : H^q(Y, Λ(m)) → H^{q−2e}(X, Λ(m − e)) is the map induced by the adjunction Rf_*f^!Λ → Λ and f^!Λ_X ≅ Λ_Y(e)[2e]; for k separably closed it is the transpose of f^* : H^{2d_X−q+2e}_c(X) → H^{2d_Y−q}_c(Y) under Poincaré duality. Properties: f_*(y ∪ f^*x) = f_*y ∪ x (projection formula); (gf)_* = g_*f_*; i_*1 = cl(Z); for X, Y proper over k separably closed, Tr_X ∘ f_* = Tr_Y; for f finite flat of degree δ, f_*f^* = δ; transverse base change g^*i_* = i′_*g′^* for a cartesian square with g transverse to Z.

**Hypotheses.**

- Smooth schemes over a field k; proper f; F locally constant constructible (twists explicit).

**Construction and proof.**

- (a) from EDC.3/smooth-pair-purity and the localization triangle; (b) from smooth purity for Y and X and the counit of Rf_! = Rf_* ⊣ f^!.
- Agreement of (a) and (b) for closed immersions: both are adjoint to restriction under duality (Milne LEC 24.2 (b)).
- Projection formula and composition follow from the projection formula for Rf_* and composition of f^! (EDC.1:adjoint/upper-shriek-pseudofunctor). For general proper f, Tr_X ∘ f_* = Tr_Y is the composition law for adjunction counits after identifying the smooth dualizing complexes. The finite flat degree formula additionally uses (Var 4)(I) of EDC.2:trace-purity/flat-trace.
- Transverse base change: g^!-compatibility of purity for g transverse (the base change map of EDC.1:adjoint/base-change-exchange-maps is an isomorphism for the smooth pair pulled back transversally).
- For a general proper map between smooth schemes use the canonical counit Rf_*f^! → id together with the dualizing-complex identifications. The flat top-degree trace transitivity of XVIII 2.9 alone does not cover a nonflat proper map.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.EtaleDuality.gysin` | constructor | i_* : H^q(Z, Λ(m)) → H^{q+2c}(X, Λ(m + c)) for a smooth pair of codimension c. |
| `TauCeti.EtaleDuality.properPushforward` | constructor | f_* : H^q(Y, Λ(m)) → H^{q−2e}(X, Λ(m − e)) for f proper between smooth schemes, e = dim Y − dim X. |
| `TauCeti.EtaleDuality.properPushforward_projection` | relation | f_*(y ∪ f^*x) = f_*y ∪ x. |
| `TauCeti.EtaleDuality.properPushforward_comp` | functoriality | (g ∘ f)_* = g_* ∘ f_*, and id_* = id. |
| `TauCeti.EtaleDuality.gysin_one` | simp | i_*1 = cl(Z). |
| `TauCeti.EtaleDuality.trace_properPushforward` | compatibility | For X, Y proper over k separably closed, Tr_X(f_*y) = Tr_Y(y) on top-degree classes. |
| `TauCeti.EtaleDuality.properPushforward_finiteFlat` | relation | For f finite flat of degree δ, f_*f^* = δ. |
| `TauCeti.EtaleDuality.gysin_baseChange` | compatibility | For a cartesian square with g transverse to Z, g^* ∘ i_* = i′_* ∘ g′^*. |
| `TauCeti.EtaleDuality.gysin_eq_properPushforward` | compatibility | For a closed immersion, the purity Gysin map agrees with the duality pushforward. |

**Unit tests.**

- `TauCeti.EtaleDuality.gysin_point_curve` (computation): For a closed point i : x → C of a smooth projective connected curve over an algebraically closed field, Tr_C(i_*1) = 1.
- `TauCeti.EtaleDuality.gysin_hyperplane_powers` (computation): For i : P^{n−1} → P^n a hyperplane over an algebraically closed field, i_*(h^j) = h^{j+1} in H*(P^n, Λ).
- `TauCeti.EtaleDuality.properPushforward_id` (degenerate): id_* = id.
- `TauCeti.EtaleDuality.not_properPushforward_ring_hom` (non-example): Assume Λ ≠ 0. For f : C′ → C finite flat of degree 2 between smooth projective connected curves over an algebraically closed field (n odd), f_*(1_{C′}) = 2 · 1_C ≠ 1_C in H⁰(C, Λ): proper pushforward is H*(C)-linear by the projection formula but not a ring homomorphism.

**Acceptance.**

- Point i : x → C on a smooth projective curve: i_*1 = cl(x) and Tr_C(i_*1) = 1.
- Hyperplane i : P^{n−1} → P^n: i_*(h^j) = h^{j+1}.

**Prerequisites.** `EDC.3/smooth-pair-purity`, `EDC.2:trace-purity/smooth-purity`, `EDC.2:trace-purity/flat-trace`, `EDC.2:pairings/poincare-duality-torsion`, `EDC.1:adjoint/base-change-exchange-maps`, `mathlib:AlgebraicGeometry.IsProper`, `EDC.3/fundamental-class`.

**Sources.**

- [Milne-LEC](https://www.jmilne.org/math/CourseNotes/LEC.pdf), Remark 24.2, p. 145: Definition by duality and agreement with the purity Gysin map (symbols restored; see sourceIssues for the misprinted degree).
- [Milne-LEC](https://www.jmilne.org/math/CourseNotes/LEC.pdf), Remark 24.2 (e)-(f), p. 145: Projection formula and degree.

**Suggested location.** `TauCeti/AlgebraicGeometry/Etale/Duality/Gysin`, namespace `TauCeti.EtaleDuality`.

### The Gysin sequence

Node `EtaleDualityAndPerverseSheaves:EDC.3/gysin-sequence` · theorem.

For a smooth pair (Z, X) of pure codimension c over a field k, U := X − Z, n invertible and F locally constant constructible on X, there is a long exact sequence … → H^{q−2c}(Z, F(−c)) →i_* H^q(X, F) → H^q(U, F) → H^{q−2c+1}(Z, F(−c)) → …, functorial in F and compatible with base change along k′/k; in particular H^q(X, F) ≅ H^q(U, F) for q < 2c − 1 and H^{2c−1}(X, F) ↪ H^{2c−1}(U, F). The same holds in families: for a smooth pair over a base S with smooth proper structure maps, the sequence of the sheaves R^q f_* is exact.

**Hypotheses.**

- Smooth pair over a field (or a relative smooth pair over S for the family version); F locally constant constructible.

**Construction and proof.**

- Substitute the purity isomorphism (EDC.3/smooth-pair-purity) into the long exact sequence of the pair (EDC.0/cohomology-with-supports) (Milne LEC 16.2).
- Family version: apply Rf_* to the localization triangle and use relative purity i^!Λ = Λ(−c)[−2c] for a relative smooth pair (smooth purity for Z → S and X → S, composition).

**Acceptance.**

- X = P¹, Z = {∞}: 0 → H¹(P¹) = 0 → H¹(A¹) = 0 → H⁰(pt)(−1) → H²(P¹) → H²(A¹) = 0, so H²(P¹, Λ) ≅ Λ(−1).

**Prerequisites.** `EDC.3/smooth-pair-purity`, `EDC.0/cohomology-with-supports`, `EDC.3/gysin-map`, `SchemeAndStackFoundations:SF.2`.

**Sources.**

- [Milne-LEC](https://www.jmilne.org/math/CourseNotes/LEC.pdf), Corollary 16.2, p. 108: Statement.

### The projective-space cohomology basis before cycle classes

Node `EtaleDualityAndPerverseSheaves:EDC.3/projective-space-basis` · theorem.

For Ω separably closed, n invertible and Λ killed by n, ξ=c₁(O(1)) gives H^{2j}(P^m_Ω,Λ(j))≅Λ for 0≤j≤m and all other degrees vanish; the ξ^j give the basis, and Tr(ξ^m)=1. This is the prerequisite computation for projective-bundle freeness, without any Chow-ring descent or degree formula.

**Hypotheses.**

- Prime-to-characteristic torsion coefficients; geometric field base.

**Construction and proof.**

- Induct on m using the Gysin sequence of the smooth hyperplane P^{m−1} with complement A^m. Affine-space cohomology and compact trace give the boundary and top groups. The Cartier Kummer class of the hyperplane is ξ, and projection formula identifies its Gysin image of ξ^{j−1} with ξ^j. The point case starts the induction.
- Trace transitivity gives Tr(ξ^m)=Tr_{P^{m−1}}(ξ^{m−1})=1. This uses the Gysin normalization, not cycle-class multiplicativity.

**Acceptance.**

- P¹ has only degrees zero and two, and Tr(c₁(O(1)))=1.

**Prerequisites.** `EDC.3/gysin-sequence`, `EDC.3/gysin-map`, `EDC.2:trace-purity/affine-space-trace`, `EDC.2:trace-purity/first-chern-class`, `SchemeAndStackFoundations:SF.5/projective-bundle`.

**Sources.**

- [Milne-LEC](https://www.jmilne.org/math/CourseNotes/LEC.pdf), proof of Theorem 23.2, p. 139: Inductive projective-space basis computation; separated from the cycle-dependent degree target.

**Suggested location.** `TauCeti/AlgebraicGeometry/Etale/Duality/ProjectiveBundle`, namespace `TauCeti.EtaleDuality`. Proposed declaration: `TauCeti.EtaleDuality.projective_space_basis`.

### Cohomology of a projective bundle is free on powers of ξ

Node `EtaleDualityAndPerverseSheaves:EDC.3/projective-bundle-freeness` · theorem.

Let X be a scheme with n invertible, E a locally free O_X-module of rank m + 1, π : P(E) → X the projective bundle with O(1), and ξ := c₁(O(1)) ∈ H²(P(E), Λ(1)). Then the map ⊕_{j=0}^{m} H^{q−2j}(X, F(−j)) → H^q(P(E), π^*F), (a_j) ↦ Σ π^*a_j ∪ ξ^j, is an isomorphism for every q and every locally constant constructible F on X; equivalently Rπ_*Λ ≅ ⊕_{j=0}^m Λ(−j)[−2j] via ξ^j. This is the input that defines Chern classes; the refined decomposition with Frobenius on every summand, and the blowup formula, are EDC.4's.

**Hypotheses.**

- X quasi-compact quasi-separated (finite cover by trivializing opens) with n invertible; F locally constant constructible.

**Construction and proof.**

- For trivial E, use the preliminary projective-space-basis computation from the Gysin sequence and affine-space trace, followed by proper base change. This computation precedes cycle-class descent and does not use the later projective-space degree formula.
- General case: the map Σ ξ^j ∪ π^*(−) : ⊕ Λ(−j)[−2j] → Rπ_*Λ is a map of complexes on X that is an isomorphism Zariski-locally, hence an isomorphism (Milne LEC 23.2, by Mayer-Vietoris).

**Acceptance.**

- X = Spec k, E = k^{m+1}: H*(P^m) is free on 1, h, …, h^m.

**Prerequisites.** `EDC.2:trace-purity/first-chern-class`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.2`, `SchemeAndStackFoundations:SF.5/projective-bundle`, `EDC.3/projective-space-basis`.

**Sources.**

- [Milne-LEC](https://www.jmilne.org/math/CourseNotes/LEC.pdf), Theorem 23.2, p. 139: Statement (symbols restored).

### Chern classes of vector bundles in étale cohomology

Node `EtaleDualityAndPerverseSheaves:EDC.3/chern-classes` · construction. Planet: Chern classes.

Let X be a scheme with n invertible (in applications smooth over a perfect field). For a locally free E of rank m + 1 with π : P(E) → X and ξ = c₁(O_{P(E)}(1)), the Chern classes c_r(E) ∈ H^{2r}(X, Λ(r)) are the unique classes with Σ_{r=0}^{m+1} π^*c_r(E) ∪ ξ^{m+1−r} = 0 and c₀ = 1 (Grothendieck's definition through EDC.3/projective-bundle-freeness). They satisfy: functoriality c_r(f^*E) = f^*c_r(E); normalization c₁(L) is the Kummer class for a line bundle; Whitney formula c_t(E) = c_t(E′)c_t(E″) for 0 → E′ → E → E″ → 0; c_r(E) = 0 for r > rank E; splitting principle. The top Chern class of the normal bundle computes self-intersections (EDC.3/self-intersection-formula).

**Hypotheses.**

- n invertible; E locally free of finite rank (Zariski-locally free).
- Quasi-compactness is needed only for the assertion that the total Chern class is a unit; individual Chern classes and the Whitney identity do not need it.

**Construction and proof.**

- Existence and uniqueness of the relation from freeness of H*(P(E)) over H*(X) (Grothendieck's method, Milne LEC 23.3).
- Normalization and convention: P(E) := Proj Sym(E^∨) parametrizes lines in E and O(−1) is the tautological line subbundle; for E = L of rank one, P(L) = X with O(−1) = L, so the relation ξ + c₁(E) = 0 gives c₁(E) = −c₁(O(1)) = c₁(L), the Kummer class (Milne LEC 23.3 (b)).
- Whitney formula and splitting principle: pull back to the flag bundle, where E has a filtration with line-bundle quotients and π^* is injective (iterate projective-bundle freeness).
- For quasi-compact X choose a finite trivializing cover. Positive Chern classes restrict to zero on its members, and the multiplicative cover filtration bounds their nilpotence; the finite geometric series in the positive-degree part gives the inverse of c(E). Do not assert this uniform nilpotence on an arbitrary non-quasi-compact scheme.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.EtaleDuality.chernClass` | constructor | c_r(E) ∈ H^{2r}(X, Λ(r)) for E locally free. |
| `TauCeti.EtaleDuality.totalChernClass` | data | c(E)=Σ_{r=0}^{rank E} c_r(E) in the even diagonal cohomology ring. For quasi-compact X this is a unit: a finite trivializing cover bounds the nilpotence of its positive-degree part. |
| `TauCeti.EtaleDuality.chernClass_pullback` | functoriality | c_r(f^*E) = f^*c_r(E). |
| `TauCeti.EtaleDuality.chernClass_one_lineBundle` | compatibility | For L invertible, c₁(L) = firstChernClass L and c_r(L) = 0 for r ≥ 2. |
| `TauCeti.EtaleDuality.totalChernClass_whitney` | relation | c(E) = c(E′) ∪ c(E″) for 0 → E′ → E → E″ → 0. |
| `TauCeti.EtaleDuality.chernClass_eq_zero_of_rank_lt` | simp | c_r(E) = 0 for r > rank E. |
| `TauCeti.EtaleDuality.chernClass_projectiveBundle_relation` | characterisation | Σ_r π^*c_r(E) ∪ ξ^{rank E − r} = 0 in H^{2 rank E}(P(E), Λ(rank E)). |

**Unit tests.**

- `TauCeti.EtaleDuality.chernClass_tangent_projectiveSpace` (computation): For X = P^m over an algebraically closed field, c(T_{P^m}) = (1 + h)^{m+1} in Λ[h]/(h^{m+1}).
- `TauCeti.EtaleDuality.chernClass_trivial` (degenerate): c(O_X^r) = 1.
- `TauCeti.EtaleDuality.chernClass_sum_lines` (computation): Assume Λ ≠ 0. c(O(1) ⊕ O(1)) = (1 + h)² on P^m, so c₂ = h² ≠ 0 for m ≥ 2.
- `TauCeti.EtaleDuality.not_chernClass_two_of_line` (non-example): For a line bundle L, c₂(L) = 0 although c₁(L)² may be nonzero (e.g. L = O(1) on P²): c₂ is not c₁².

**Acceptance.**

- c(T_{P^m}) = (1 + h)^{m+1}.
- c(O ⊕ O(1)) on P^m is 1 + h.

**Prerequisites.** `EDC.3/projective-bundle-freeness`, `EDC.2:trace-purity/first-chern-class`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.5/projective-bundle`.

**Sources.**

- [Milne-LEC](https://www.jmilne.org/math/CourseNotes/LEC.pdf), §23, p. 140: Definition (Milne writes ch_r for c_r; symbols restored).
- [Milne-LEC](https://www.jmilne.org/math/CourseNotes/LEC.pdf), Theorem 23.3, p. 140: Axioms.

**Suggested location.** `TauCeti/AlgebraicGeometry/Etale/Duality/ChernClass`, namespace `TauCeti.EtaleDuality`.

### The étale cycle class map CH^r(X) → H^{2r}(X, Λ(r))

Node `EtaleDualityAndPerverseSheaves:EDC.3/cycle-class-map` · construction. Planet: Cycle class map.

Let X be smooth of pure dimension d over a perfect field k, n invertible, Λ = ℤ/n (or O/πⁿ, and with ℤ_ℓ, ℚ_ℓ coefficients by passage to the limit). The cycle class of a codimension-r cycle α is cl_X(α) := image of the fundamental class s_α ∈ H^{2r}_{|α|}(X, Λ(r)) in H^{2r}(X, Λ(r)). The map cl_X : Z^r(X) → H^{2r}(X, Λ(r)) is additive and factors through rational equivalence, giving cl_X : CH^r(X) → H^{2r}(X, Λ(r)) (Chow groups imported from SchemeAndStackFoundations SF.5). For r = 1 it is c₁ ∘ (divisor ↦ line bundle); it is compatible with flat pullback, with proper pushforward (Gysin maps of EDC.3/gysin-map), with intersection products (cl(α · β) = cl(α) ∪ cl(β) for properly intersecting cycles, hence a ring homomorphism CH*(X) → ⊕ H^{2r}(X, Λ(r)) for X smooth quasi-projective), and with the Galois action (cl is Gal(k̄/k)-equivariant into H^{2r}(X_k̄, Λ(r))). For X proper over k̄, Tr_X(cl(point)) = 1, so Tr ∘ cl = degree on 0-cycles. No comparison between numerical and homological equivalence is asserted.

**Hypotheses.**

- X smooth over a perfect field; for the ring structure X smooth quasi-projective (moving lemma imported with the intersection product from SF.5).
- Over an imperfect field the construction through the smooth locus is not asserted (inseparable descent is outside this stage).

**Construction and proof.**

- Use the supported classes of fundamental-class and the weighted coherent-complex construction of SGA 4½ [Cycle] 2.3.1–2.3.8: for a perfect O_X-complex with support of codimension at least r, its class has generic coefficient the alternating length of its homology. On a smooth X every coherent sheaf is locally perfect. The trace construction agrees with the smooth-locus generator by 2.3.8(iii), and uniqueness follows from semi-purity away from the generic points.
- For a principal-divisor generator div_W(g), with W integral of codimension r−1, take the closure Γ of the graph of g in X×P¹. For nonconstant g, Γ is integral and flat over the regular curve P¹. Its codimension-r weighted class restricts at 0 and ∞ by the derived base-change identity [Cycle] 2.3.8(iv). Flatness over P¹ eliminates parameter Tor terms; the resulting Euler lengths are the two divisor fibres, including all singular generic points. The normalization/valuation description of div_W(g), imported with SF.5 rational equivalence, identifies their difference with the pushforward of div_W(g). For constant g both are zero.
- The two section pullbacks H^{2r}(X×P¹,Λ(r))→H^{2r}(X,Λ(r)) coincide: the projective-bundle decomposition writes a class as a+ξb, and ξ=c₁(O(1)) restricts to zero on either constant section. Therefore cl(div_W(g))=0 without deleting Sing(W). This proves descent to CH^r integrally modulo n; a Chern-character argument requiring factorial denominators would not suffice.
- For properly intersecting Z,W use [Cycle] 2.3.8(v): the cup product of their supported classes is the weighted class of O_Z⊗^L O_W, with coefficient Σ_i(−1)^i length Tor_i at each generic intersection point. The proof factors the diagonal graph through a smooth projection and a regular closed immersion, uses compatibility of the weighted trace with both, and uses semi-purity only to compare generic supported classes. SF.5/tor-intersection identifies exactly this weighted cycle with the Chow product; ordinary intersection lengths are used only when higher Tor vanishes. The moving lemma extends the formula to the Chow ring for smooth quasi-projective X.
- Flat pullback is the derived base-change formula; proper pushforward follows from weighted-trace transitivity and restriction to generic points, with contracted components zero by degree/dimension. Cartier divisors give the Kummer c₁ by the local regular-sequence case 2.3.8(iii). Base change of the trace gives Galois equivariance, and the normalized point trace gives degree on zero cycles.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.EtaleDuality.cycleClass` | constructor | cl_X : Z^r(X) →+ H^{2r}(X, Λ(r)), on Mathlib AlgebraicCycle X ℤ restricted to codimension r. |
| `TauCeti.EtaleDuality.cycleClass_rationalEquiv` | characterisation | cl_X vanishes on cycles rationally equivalent to zero, so factors through CH^r(X). |
| `TauCeti.EtaleDuality.cycleClass_divisor` | compatibility | For a Cartier divisor D, cl_X(D) = c₁(O(D)). |
| `TauCeti.EtaleDuality.cycleClass_pullback` | functoriality | cl(f^*α) = f^*cl(α) for f flat (and for f between smooth schemes with the refined pullback). |
| `TauCeti.EtaleDuality.cycleClass_pushforward` | functoriality | cl(f_*α) = f_*cl(α) for f proper between smooth schemes. |
| `TauCeti.EtaleDuality.cycleClass_intersection` | relation | cl(α · β) = cl(α) ∪ cl(β) for properly intersecting cycles. |
| `TauCeti.EtaleDuality.trace_cycleClass_point` | simp | Tr_X(cl(x)) = 1 for a closed point of X proper over k separably closed; Tr ∘ cl = deg on 0-cycles. |
| `TauCeti.EtaleDuality.cycleClass_galois` | compatibility | cl is Gal(k̄/k)-equivariant into H^{2r}(X_k̄, Λ(r)); over 𝔽_q geometric Frobenius fixes cl(α) in the twisted group. |

**Unit tests.**

- `TauCeti.EtaleDuality.cycleClass_hyperplane` (computation): On P^n over an algebraically closed field, cl(H) = h and cl of a linear subspace of codimension r is h^r.
- `TauCeti.EtaleDuality.cycleClass_transverse_curves` (computation): For two transverse curves C, D on a smooth projective surface over an algebraically closed field, Tr(cl(C) ∪ cl(D)) = #(C ∩ D).
- `TauCeti.EtaleDuality.cycleClass_zero` (degenerate): cl_X(0) = 0, and cl_X([X]) = 1 for r = 0.
- `TauCeti.EtaleDuality.cycleClass_principal` (characterisation): For f a nonzero rational function on X, cl_X(div f) = 0.
- `TauCeti.EtaleDuality.not_cycleClass_injective` (non-example): For an elliptic curve E over an algebraically closed field, the 0-cycle [p] − [q] (p ≠ q) is not rationally equivalent to 0 but cl([p] − [q]) = 0 in H²(E, Λ(1)): cl is not injective (and nothing about numerical vs homological equivalence is asserted).

**Acceptance.**

- Hyperplanes in P^n: cl(H) = h and cl(H₁ ∩ … ∩ H_r) = h^r for transverse hyperplanes.
- A transverse intersection of two curves on a surface: Tr(cl(C) ∪ cl(D)) = #(C ∩ D).
- Self-intersection of a line on P²: cl(L)² = h², Tr = 1 = deg N_{L/P²}.
- A singular divisor (the nodal cubic in P²): cl(C) = 3h through the fundamental class built on the smooth locus.

**Prerequisites.** `EDC.3/fundamental-class`, `EDC.3/gysin-map`, `EDC.3/semi-purity`, `EDC.2:trace-purity/first-chern-class`, `SchemeAndStackFoundations:SF.5`, `mathlib:AlgebraicGeometry.AlgebraicCycle`, `mathlib:AlgebraicGeometry.AlgebraicCycle.map`, `EDC.3/projective-bundle-freeness`, `SchemeAndStackFoundations:SF.5/graded-cycle`, `SchemeAndStackFoundations:SF.5/chow-group`, `SchemeAndStackFoundations:SF.5/tor-intersection`, `SchemeAndStackFoundations:SF.5/smooth-intersection`.

**Sources.**

- [SGA4half](https://publications.ias.edu/sites/default/files/Number32.pdf), [Cycle] 2.3.1–2.3.8, pp. 144–149: Weighted trace classes and their derived pullback/product formulas; these supply the integral comparison omitted in Milne 23.4.
- [Angeniol-1976](https://www.numdam.org/article/AST_1976__36-37__152_0.pdf), §§1–3, pp. 153–158: Supported intersection classes and cup-product comparison.
- [Milne-LEC](https://www.jmilne.org/math/CourseNotes/LEC.pdf), §23, pp. 139–142: Normalization and statement of the cycle-map target; not the missing proof of 23.4.

**Suggested location.** `TauCeti/AlgebraicGeometry/Etale/Duality/CycleClass`, namespace `TauCeti.EtaleDuality`.

### The self-intersection formula

Node `EtaleDualityAndPerverseSheaves:EDC.3/self-intersection-formula` · theorem.

For a closed immersion i : Z → X of smooth k-schemes of pure codimension c with normal bundle N = N_{Z/X}, and y ∈ H^q(Z, Λ(m)), one has i^*i_*y = c_c(N) ∪ y in H^{q+2c}(Z, Λ(m + c)); in particular i^*cl(Z) = c_c(N). For c = 1, i^*cl(Z) = c₁(O(Z)|_Z) = c₁(N).

**Hypotheses.**

- Smooth pair over a field; n invertible.

**Construction and proof.**

- Import the deformation geometry from SF.5/normal-deformation: for the smooth pair i:Z↪X, the open deformation M has support J:Z×A¹↪M, fibre pair (Z,X) at 1 and (Z,N) at 0. Étale normal coordinates show both M and Z×A¹ are smooth over k and J has codimension c. The fibre squares are transverse; the purity normalization is therefore stable under their base change.
- Compare cohomology WITH SUPPORT, not cohomology of the nonproper ambient fibres. Smooth-pair purity identifies H^{q+2c}_{Z×A¹}(M,Λ(m+c)) with H^q(Z×A¹,Λ(m)). A¹ homotopy invariance on the smooth Z makes restriction to either fibre an isomorphism. Compatibility of purity with transverse base change shows these two maps transport each input y and its supported Gysin class to the fibre classes with the same generator.
- The squares for restriction, forgetting support and pullback to Z commute. Hence this supported comparison identifies i^*i_*y with the zero-section operator s^*s_*y. No isomorphism H*(M_1)≅H*(M_0) is asserted merely from smoothness of M→A¹.
- Compactify N by the lines bundle P(N⊕O). In its projective-bundle decomposition the zero-section class is Σ_{j=0}^c π^*c_j(N)ξ^{c−j}; restriction to the zero section sets ξ to zero and yields c_c(N). The class formula follows after pullback to the splitting flag bundle from the product of the Cartier classes of the line summands. The flag pullback is injective by projective-bundle freeness. Projection formula then gives s^*s_*y=c_c(N)∪y for arbitrary y.
- For c=1 one can also use the Kummer divisor formula and O_X(Z)|_Z≅N. SF.5 owns the Chow self-intersection theorem already; this node owns its cohomological extension to all étale classes.

**Acceptance.**

- A line L ⊂ P²: i^*cl(L) = c₁(O_L(1)), degree 1.
- The diagonal Δ ⊂ C × C of a curve of genus g: Tr(cl(Δ) ∪ cl(Δ)) = 2 − 2g.

**Prerequisites.** `EDC.3/gysin-map`, `EDC.3/chern-classes`, `EDC.3/smooth-pair-purity`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.5`, `SchemeAndStackFoundations:SF.5/normal-deformation`, `EDC.3/projective-bundle-freeness`, `EDC.2:trace-purity/first-chern-class`, `SchemeAndStackFoundations:SF.2`, `SchemeAndStackFoundations:SF.5/projective-bundle`.

**Sources.**

- [LMS-1975](https://www.dam.brown.edu/people/mumford/alg_geom/papers/1975c--FormuleClef-NC.pdf), §1, (1.4)–(1.7), pp. 118–119; §2, pp. 120–121: Projective completion of the zero section and normal deformation geometry; the cohomological support comparison is specified in this node.
- [Grothendieck-Chern-1958](https://www.numdam.org/item/10.24033/bsmf.1501.pdf), §2, pp. 140–142; §3, pp. 144–146; §5, Lemma 3 and Theorem 2, pp. 152–153: Projective-bundle construction, splitting and the zero-section computation. The cohomological support specialization is given explicitly in this node.
- [Milne-LEC](https://www.jmilne.org/math/CourseNotes/LEC.pdf), Theorem 16.1 and Corollary 16.2, pp. 108–109; Remark 24.2(e), p. 145: Purity with support and projection formula used in the explicit comparison.

### Cohomology of projective space and degrees

Node `EtaleDualityAndPerverseSheaves:EDC.3/projective-space-cohomology` · theorem.

Let k be separably closed, n invertible, Λ = ℤ/n. Then H^q(P^m_k, Λ) = 0 for q odd, and ⊕_r H^{2r}(P^m_k, Λ(r)) = Λ[h]/(h^{m+1}) as a ring under cup product, with h = c₁(O(1)) = cl(hyperplane) ∈ H²(P^m, Λ(1)) and Tr(h^m) = 1. More generally, for X smooth projective of pure dimension d over k and L a line bundle, Tr_X(c₁(L)^d) = deg_L(X) := (L^d) mod n, and for i : Y → X a smooth hyperplane section, i_*(i^*x) = cl(Y) ∪ x and Tr_X(i_*y ∪ x) = Tr_Y(y ∪ i^*x).

**Hypotheses.**

- k separably closed; X smooth projective for the degree formula (intersection number (L^d) from SF.5).

**Construction and proof.**

- Import the projective-space-basis target proved before projective-bundle freeness; the ring relation follows from its basis and vanishing.
- Degree formula: in CH*(X), take the integral self-intersection c₁(L)^d and use cl(c₁(L)) = c₁(L), multiplicativity and Tr ∘ cl = degree on 0-cycles (cycle-class-map). This proves the stated degree formula once that compatibility gap is closed; do not divide by a very-ample multiple modulo n.
- Hyperplane formulas: projection formula and Tr_X ∘ i_* = Tr_Y (EDC.3/gysin-map).

**Acceptance.**

- P¹: H⁰ = Λ, H² = Λ(−1), Tr(h) = 1.
- A smooth quadric surface Q ⊂ P³: Tr(h²) = 2.

**Prerequisites.** `EDC.3/gysin-sequence`, `EDC.3/gysin-map`, `EDC.3/cycle-class-map`, `EDC.2:trace-purity/affine-space-trace`, `SchemeAndStackFoundations:SF.5`, `EDC.2:trace-purity/curve-trace`, `EDC.3/projective-space-basis`.

**Sources.**

- [Milne-LEC](https://www.jmilne.org/math/CourseNotes/LEC.pdf), proof of Theorem 23.2, p. 139: Cohomology of projective space (symbols restored).

## Supplier contracts

These contracts identify the imports that keep the targets with their existing owners. Stage references remain pending integration; exact SF.5 and E1/E3 node IDs are used in the prerequisite graph where available.

### `SchemeAndStackFoundations:SF.2`

From ConstructibleEtale (CohomologicalPointCounting, PR196), integrated by SF.2: (i) constructible sheaves of Λ-modules on X_ét for X noetherian and Λ noetherian torsion (finite stratification by locally closed constructible subschemes on which the sheaf is locally constant with finitely generated stalks), forming a weak Serre subcategory stable under f^* and ⊗; (ii) the sheaf μ_n for n invertible and the exactness of the Kummer sequence 0 → μ_n → G_m → G_m → 0 on X_ét, with H¹(X_ét, G_m) = Pic(X) naturally in X; (iii) the exact pullback f^* and the right derived functors Rf_* and RΓ on the unbounded D(X_ét, Λ) (K-injective resolutions); (iv) topological invariance: a nilpotent thickening Z_red → Z induces an equivalence of étale sites. For the EDC-owned one-dimensional dualizing-base proof, import the Kummer valuation and strict-trait tame inertia cohomology: exact wild invariants, tame cd_n=1, H¹(I,M)=M_I(−1), and invariants/coinvariants duality for finite M over self-injective Λ (SGA 4½ [Dualité] 1.2–1.3). This requests local computations, not the dualizing theorem itself.

**Consumers.** `EtaleDualityAndPerverseSheaves:EDC.0/constructible-ctf-complexes`, `EtaleDualityAndPerverseSheaves:EDC.0/tate-twist`, `EtaleDualityAndPerverseSheaves:EDC.0/cohomology-with-supports`, `EtaleDualityAndPerverseSheaves:EDC.0/coefficient-change`, `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/first-chern-class`, `EtaleDualityAndPerverseSheaves:EDC.1:biduality/one-dimensional-dualizing-base`.

### `SchemeAndStackFoundations:SF.2`

From CompactSupport (PR196), integrated by SF.2: for f : X → S separated of finite type with S quasi-compact quasi-separated and Λ torsion, the functor Rf_! : D(X_ét, Λ) → D(S_ét, Λ) on unbounded complexes, defined through a Nagata compactification as R f̄_* ∘ j_! and independent of it, with: the composition isomorphism R(gh)_! ≅ Rg_!Rh_! satisfying the cocycle condition; proper base change g^*Rf_! ≅ Rf′_!g′^* (SGA 4 XVII 5.2.6); stalks (R^q f_!F)_s̄ = H^q_c(X_s̄, F) (5.2.8); R^q f_!F = 0 for q > 2d when the fibres have dimension ≤ d (5.2.8.1); the projection formula Rf_!(E ⊗^L f^{-1}K) ≅ Rf_!E ⊗^L K (5.2.9; Stacks 0GL5); the Künneth isomorphism (5.4.3); the localization sequence for U open with closed complement (5.1.16.2); Rf_! = f_! left adjoint to f^* for f étale (6.2.11); Rf_! = Rf_* for f proper; preservation of finite Tor-dimension (5.2.10) and of D^b_c.

**Consumers.** `EtaleDualityAndPerverseSheaves:EDC.0/compact-pushforward-amplitude-and-colimits`, `EtaleDualityAndPerverseSheaves:EDC.0/enhanced-compact-pushforward`, `EtaleDualityAndPerverseSheaves:EDC.0/coefficient-change`, `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/sheafified-adjunction`, `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/base-change-exchange-maps`, `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/quasi-finite-flat-trace`, `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/curve-trace`, `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/flat-trace`.

### `SchemeAndStackFoundations:SF.2`

From EtaleBaseChange (PR196), integrated by SF.2: proper base change for Rf_* along proper f, the smooth base change theorem and its acyclicity lemma (SGA 4 XV 2.1 and 2.6) in the form used by SGA 4 XVIII 1.6.9, and the finiteness theorem: Rf_* preserves D^b_c(−, Λ) for f of finite type between schemes of finite type over a field or over a excellent regular noetherian base of dimension ≤ 1 (SGA 4½ [Th. finitude] 1.1 and 4.3), with finiteness of H^q(X_k̄, F) and H^q_c(X_k̄, F) for constructible F. Also supply A¹ homotopy invariance for prime-to-characteristic torsion coefficients on smooth schemes, compatibly with section restriction (SGA 4 smooth base change and affine-space cohomology); this is used only on the support Z×A¹ in self-intersection.

**Consumers.** `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/curve-effacement-lemma`, `EtaleDualityAndPerverseSheaves:EDC.1:biduality/constructible-biduality`, `EtaleDualityAndPerverseSheaves:EDC.1:biduality/recollement-adjunctions`, `EtaleDualityAndPerverseSheaves:EDC.1:biduality/relative-and-geometric-duality`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/poincare-duality-torsion`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/cup-product-trace-pairing`, `EtaleDualityAndPerverseSheaves:EDC.3/gysin-sequence`, `EtaleDualityAndPerverseSheaves:EDC.3/self-intersection-formula`.

### `SchemeAndStackFoundations:SF.2`

Cohomology of curves over an algebraically closed field k (Stacks 03RM-03RR), n invertible: for a proper curve X, H²(X, μ_n) ≅ Pic(X)/n ≅ (ℤ/n)^{irreducible components} via degrees of line bundles (and through X_red), H^q(X, μ_n) = 0 for q ≥ 3, H¹(X, μ_n) ≅ Pic(X)[n]; for a smooth affine curve H^q(X, μ_n) = 0 for q ≥ 2; for a closed point x of a smooth curve C, H^q_x(C, μ_n) is ℤ/n for q = 2 and 0 otherwise (Kummer on the henselization). Also the identification, owned by TraceFormula Layer 8 (RS-17), of the cup product H¹(X, μ_n) × H¹(X, μ_n) → H²(X, μ_n^{⊗2}) ≅ μ_n with the Weil pairing on Jac(X)[n] (Milne LEC 14.8).

**Consumers.** `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/curve-trace`, `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/curve-h1-duality`, `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/first-chern-class`.

### `SchemeAndStackFoundations:SF.2`

From EllAdicRealization (PR196), integrated by SF.2: for E/ℚ_ℓ finite and a lisse O_E-sheaf F = (F_m) on X of finite type over a separably closed field, the groups H^i(X, F) := lim_m H^i(X, F_m) and H^i_c(X, F) are finitely generated O_E-modules with lim¹ = 0, RΓ(X, F) and RΓ_c(X, F) are perfect O_E-complexes with RΓ(X, F) ⊗^L O_E/π^m ≅ RΓ(X, F_m), compatibly with the Galois action and with extension of coefficients to E and ℚ̄_ℓ.

**Consumers.** `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`.

### `SchemeAndStackFoundations:SF.0`

Import finite locally free sheaves, ranks, pullback, tensor, direct sums and duals from current upstream AlgebraicVectorBundles L0A–L0C. The projective geometry is supplied by SF.5/projective-bundle (quotient convention): apply it to E^∨ to obtain the EDC lines convention P(E)=Proj Sym E^∨ with ξ=c₁(O(1)) and the all-plus Chern relation. SF.0 is requested only for the complete flag bundle built by iterated projective bundles and its geometric local trivializations.

**Consumers.** `EtaleDualityAndPerverseSheaves:EDC.3/projective-bundle-freeness`, `EtaleDualityAndPerverseSheaves:EDC.3/chern-classes`, `EtaleDualityAndPerverseSheaves:EDC.3/self-intersection-formula`, `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/first-chern-class`.

### `SchemeAndStackFoundations:SF.5`

For X smooth (quasi-projective where intersections are taken) over a field: the group Z^r(X) of codimension-r cycles (Mathlib AlgebraicCycle restricted to codimension r), rational equivalence and CH^r(X); flat pullback; proper pushforward compatible with Mathlib's AlgebraicCycle.map; the intersection product of properly intersecting cycles with Serre's Tor multiplicities and the moving lemma making CH*(X) a ring; the degree of 0-cycles on proper X; and the deformation to the normal cone of a closed immersion.

**Consumers.** `EtaleDualityAndPerverseSheaves:EDC.3/cycle-class-map`, `EtaleDualityAndPerverseSheaves:EDC.3/projective-space-cohomology`, `EtaleDualityAndPerverseSheaves:EDC.3/self-intersection-formula`.

### `tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree`

Line bundles and the Picard group Pic(X) of a scheme as an abelian group under ⊗, natural under pullback, divisors and O(D), and the degree deg : Pic(X) → ℤ of a line bundle on a proper curve over a field, additive, with principal divisors of degree zero and deg O_{P¹}(1) = 1.

**Consumers.** `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/first-chern-class`, `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/curve-trace`.

### `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`

The Jacobian J = Pic⁰ of a smooth projective connected curve X over an algebraically closed field, an abelian variety of dimension g with J(k)[n] = Pic⁰(X)[n] ≅ (ℤ/n)^{2g} for n invertible, and its canonical principal polarization.

**Consumers.** `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/curve-h1-duality`.

### `AbelianSchemesAndArithmeticModuli:A3`

The Weil pairing e_n : A[n] × A^∨[n] → μ_n of an abelian variety over an algebraically closed field (n invertible) and, for a principal polarization λ, perfectness and alternation of the induced pairing on A[n]; applied to the Jacobian of a curve.

**Consumers.** `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/curve-h1-duality`.

## External boundaries and follow-up ownership

### Absolute purity for higher-dimensional regular pairs and semistable trait morphisms remains outside this part

LPV.7 requests from EDC.2:trace-purity and EDC.3 the relative fundamental class Λ ≅ Rf^!Λ(−d)[−2d] for a strict semistable trait morphism (Saito 2003, Proposition 1.1.1(2)) and fundamental classes of the regular intersection strata over the trait (Saito 2003, Lemma 1.1.4). These are purity statements for regular pairs over a discrete valuation ring (Gabber's absolute purity and its semistable special case), which EDC.2's text excludes ('This proves smooth purity, not the unrelated general Gabber absolute-purity theorem') and EDC.3 restricts to smooth pairs over a field. This packet plans smooth purity (EDC.2:trace-purity/smooth-purity) and smooth-pair purity (EDC.3/smooth-pair-purity) only. Absolute purity for regular pairs (Gabber; Riou's exposé in Astérisque 363-364, XVI) needs an owner: a new layer after EDC.3, or the trait geometry of LefschetzPencilsAndVanishingCycles. Recorded for the maintainer. The elementary closed-point purity of a regular dimension-one base is now owned by EDC.1:biduality/one-dimensional-dualizing-base; it does not imply absolute purity for arbitrary regular pairs or the semistable LPV requests.

**Consumers.** `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/snc-nearby-cycle-description`, `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/snc-restriction-gysin-differential`, `LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles/localization-duality-cross`.

### ℓ-adic sheaf theory on algebraic stacks (RT-AREA-etale/3) has no layer

EDC.0-EDC.3 are planned for schemes only. Consumers on Artin and Deligne-Mumford stacks (shtuka, Hitchin, Bun_G and root-Picard stacks; WC.6's smooth proper DM stacks; FunctionFieldArithmeticPartII's tame coarse comparisons) need the Laszlo-Olsson / Liu-Zheng enhanced six operations on stacks, which this packet does not plan. The restructure entry proposes the Part II that the confirmed red-team finding asks for. The scheme-level objects of this packet (the enhanced Rf_! and f^!, the dualizing complex, smooth purity) are what that Part II extends by smooth descent. Explicit RT-AREA-etale/3 paper routes: EDC.8 YUN-ZHANG-17/35, YUN-ZHANG-19/120 and LAFFORGUE-18/48; the two named Part IIs are consumers, not scheme-level completions.

**Consumers.** `GlobalShtukasAndFunctionFieldLanglands:GS.1`, `GlobalShtukasAndFunctionFieldLanglands:GS.3`, `EndoscopicTransferAndUnitaryTraceComparison:ET.2b`, `WeilConjectures:WC.6/purity-for-smooth-proper-dm-stacks`, `EtaleDualityAndPerverseSheaves:EDC.8/YUN-ZHANG-17/35`, `EtaleDualityAndPerverseSheaves:EDC.8/YUN-ZHANG-19/120`, `EtaleDualityAndPerverseSheaves:EDC.8/LAFFORGUE-18/48`, `ShtukaSpecialCyclesAndHigherSiegelWeil`, `RamifiedGeometricClassFieldTheory`.

### Perfect schemes and finite-level equivariant coefficients (RT-AREA-etale/16) are not planned here

PAPER-ZHU-17 routes to EDC.0, EDC.1:adjoint, EDC.1:biduality, EDC.2:trace-purity and EDC.3 the items E01-E03, E07, E14 and characteristic-classes-of-torsors: constructible coefficients, six operations, Verdier biduality, fundamental classes and Chern classes on separated perfectly-finitely-presented perfect algebraic spaces, through finite-type models (Zhu, Appendix A.3). The confirmed finding RT-AREA-etale/16 classifies these as new layers. This packet plans the finite-type scheme statements those transports start from (and E07(a)'s finite-type trace isomorphism, EDC.2:trace-purity/top-degree-compact-cohomology), and records the perfect-space transport in the Part II proposed under restructure. Zhu's A.3 orientation problem (independence of the model in E07) stays a proof gate of that Part II.

**Consumers.** `GeometricSatakeAndFusion:GS0`, `GeometricSatakeAndFusion:GS3`.

### The Grothendieck-Ogg-Shafarevich formula has no layer

FiniteFieldsAndCharacterSums requests χ_c(X, F) = rk F · χ_c(X) − Σ_s Sw_s(F) from EDC.2 (RT-AREA-finitefields/3, confirmed). It is not among EDC.2's stated targets and needs Swan conductors (ArithmeticGaloisRepresentations:R01.3) and the Euler-characteristic computation of SGA 5 X / Raynaud (Séminaire Bourbaki 286). This packet endorses the FiniteFieldsAndCharacterSums proposal of a sub-stage EtaleDualityAndPerverseSheaves:EDC.2:euler-characteristic after EDC.2 (restructure entry), with inputs EDC.2:pairings and R01.3.

**Consumers.** `FiniteFieldsAndCharacterSums:FF.2/h1c-conductor-bound`, `FiniteFieldsAndCharacterSums:FF.2/artin-schreier-sum-on-curve-bound`, `FiniteFieldsAndCharacterSums:FF.2/deligne-cohomology-of-polynomial-sheaf`.

**Restructure (rescope).** Confirmed red-team finding RT-AREA-etale/3: no layer plans ℓ-adic sheaf theory on Artin or Deligne-Mumford stacks, while EDC is scheme-only and accepted routes apply EDC.5/7/8 outputs on stacks.

Create 'Étale duality, cycle classes and perverse sheaves, Part II: Artin and Deligne-Mumford stacks' with EtaleDualityAndPerverseSheaves as first prerequisite and EnhancedDerivedSheaves E2-E3 (smooth descent, coherent diagrams) as inputs. Layers: (1) lisse-étale site, D_c(𝒳, Λ) and the Laszlo-Olsson / Liu-Zheng enhanced six operations on Artin stacks, extending EDC.0's enhanced Rf_! and EDC.1:adjoint's f^! by smooth descent; (2) dualizing complex, smooth purity and biduality on stacks (from EDC.1-EDC.2); (3) the perverse t-structure and IC on Artin stacks (from EDC.5); (4) the decomposition theorem for proper representable maps of DM stacks (from EDC.7); (5) correspondences and trace formulas on DM stacks (Varshavsky, Behrend; from EDC.8). Edges from it to GlobalShtukas GS.1 and GS.3, ET.2b, the EDC.8 stack items and WC.6's DM-stack purity node; the shtuka and ramified geometric class field theory Part II briefs import it, and LAFFORGUE-18/48 is re-routed there as missing.

**Restructure (rescope).** Confirmed red-team finding RT-AREA-etale/16: PAPER-ZHU-17 route 7 adds about twenty items outside EDC's declared scope (six operations, Verdier duality, perversity, IC and Chern classes on perfect pfp spaces; equivariant perverse sheaves and Borel equivariant cohomology; Braden hyperbolic localization).

Create 'Étale duality, cycle classes and perverse sheaves, Part II: perfect schemes, equivariant coefficients and hyperbolic localization', importing GeometricSatakeAndFusion GS0:Witt-geometry's perfect-space carrier and the perfection invariance of the étale site, with layers: (1) D^b_c on separated pfp perfect spaces through finite-type models, with the six operations, biduality and the trace/fundamental classes of EDC.0-EDC.3 transported (Zhu A.3.1, A.3.3, items E01-E03, E07), including the model-independence proof gate; (2) Chern and characteristic classes of torsors on perfect spaces (A.3.2, E14) from EDC.3/chern-classes; (3) finite-level equivariant perverse sheaves and Borel equivariant cohomology (A.3.5, E10-E13), importing the common equivariant operations from the stacks Part II, which is their single owner; this perfect-space Part II owns only finite-model/perfection transport; (4) scheme-level Braden hyperbolic localization (E09). Keep only the finite-type items (E06) as sources of EDC.7. Within this packet, EDC.0-EDC.3 plan the finite-type scheme statements those transports start from.

**Restructure (rescope).** The Grothendieck-Ogg-Shafarevich Euler characteristic formula for lisse sheaves on curves is used by FiniteFieldsAndCharacterSums FF.2 and by KloostermanMomentsAndPotentialAutomorphy, and no stage states it (RT-AREA-finitefields/3, confirmed). The FiniteFieldsAndCharacterSums packet already proposes a sub-stage of this roadmap.

Endorse that proposal: add EtaleDualityAndPerverseSheaves:EDC.2:euler-characteristic after EDC.2:pairings (inputs EDC.2:pairings/extreme-degree-cohomology, EDC.2:pairings/poincare-duality-torsion and ArithmeticGaloisRepresentations:R01.3 in equal characteristic), stating χ_c(X, F) = rk F · χ_c(X) − Σ_{s} Sw_s(F) for F lisse on a dense open X of a smooth projective connected curve over an algebraically closed field, with χ_c = χ, sourced to Raynaud (Séminaire Bourbaki 286, Numdam) or SGA 5 X; link it to FF.2.

Common stack and equivariant operations have one owner: the stacks Part II. The perfect-space Part II imports them and owns finite-model/perfection transport. Later EDC.4–EDC.8 imports this part’s completed scheme interfaces. It must import EDC.3 projective-bundle freeness instead of reconstructing it; its additional blow-up, Lefschetz, perverse, decomposition and correspondence targets are outside this part. The higher-layer local trait computations needed for the base theorem have been made an explicit lower SF.2 supplier contract, avoiding an upward dependency on LocalGaloisGroups.

## Checked library baseline

Each statement below was read at the recorded pin. The original 40 citations retain the independent review’s confirmation; eight further carrier or hypothesis declarations were read for this revision. Current upstream vector-bundle imports are recorded separately in the packet and do not masquerade as pinned declarations.

| Reference | Module | Supplies |
| --- | --- | --- |
| `mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology` | `Mathlib/AlgebraicGeometry/Sites/Etale.lean` | smallEtaleTopology X : GrothendieckTopology X.Etale, the small étale site of a scheme X on which every coefficient category of this packet is built. |
| `mathlib:AlgebraicGeometry.Scheme.Etale` | `Mathlib/AlgebraicGeometry/Morphisms/Etale.lean` | X.Etale := MorphismProperty.Over @Etale ⊤ X, the category of étale X-schemes (the underlying category of the small étale site). |
| `mathlib:AlgebraicGeometry.Scheme.isGrothendieckAbelian_sheaf_smallEtaleTopology` | `Mathlib/AlgebraicGeometry/Sites/AffineEtale.lean` | For A abelian and Grothendieck abelian, Sheaf S.smallEtaleTopology A is Grothendieck abelian (applied with A = ModuleCat Λ): enough injectives, so D(X_ét, Λ) exists with K-injective resolutions. |
| `mathlib:AlgebraicGeometry.Scheme.pointSmallEtale` | `Mathlib/AlgebraicGeometry/Sites/EtalePoint.lean` | For Ω separably closed and s : Spec Ω ⟶ S, the point of the small étale site of S at the geometric point s; its fibre functor is the geometric stalk. |
| `mathlib:AlgebraicGeometry.Scheme.isConservativeFamilyOfPoints_pointSmallEtale'` | `Mathlib/AlgebraicGeometry/Sites/EtalePoint.lean` | The points pointSmallEtale form a conservative family of points of the small étale site: a morphism of étale sheaves is an isomorphism when it is one on all geometric stalks. |
| `mathlib:CategoryTheory.GrothendieckTopology.Point.sheafFiber` | `Mathlib/CategoryTheory/Sites/Point/Basic.lean` | Φ.sheafFiber : Sheaf J A ⥤ A, the fibre (stalk) functor of a point of a site; with pointSmallEtale it is the geometric stalk F ↦ F_x̄. |
| `mathlib:DerivedCategory` | `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean` | DerivedCategory C, the unbounded derived category of an abelian category C (localization of ℤ-graded cochain complexes at quasi-isomorphisms), with its triangulated structure. |
| `mathlib:HasDerivedCategory.standard` | `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean` | A choice of universe for the morphisms of the derived category of any abelian category, used as a local instance. |
| `mathlib:CategoryTheory.Functor.mapDerivedCategory` | `Mathlib/Algebra/Homology/DerivedCategory/ExactFunctor.lean` | An exact functor F : C₁ ⥤ C₂ of abelian categories induces F.mapDerivedCategory : DerivedCategory C₁ ⥤ DerivedCategory C₂; used for geometric stalks and exact pullbacks. |
| `mathlib:CategoryTheory.Adjunction` | `Mathlib/CategoryTheory/Adjunction/Basic.lean` | F ⊣ G with unit and counit and the triangle identities: the form of the adjunctions Rf_! ⊣ f^!, f^* ⊣ Rf_* and ⊗ ⊣ RHom. |
| `mathlib:CategoryTheory.Functor.IsTriangulated` | `Mathlib/CategoryTheory/Triangulated/Functor.lean` | A functor of pretriangulated categories commuting with shifts is triangulated when it sends distinguished triangles to distinguished triangles: the property asserted of f^! and D_X. |
| `mathlib:DerivedCategory.TStructure.t` | `Mathlib/Algebra/Homology/DerivedCategory/TStructure.lean` | The canonical t-structure on DerivedCategory C for an abelian C with HasDerivedCategory C. DerivedCategory.Plus, Minus and Bounded use this structure; IsGE/IsLE are characterized by cohomology vanishing. |
| `mathlib:CategoryTheory.Sheaf.H` | `Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean` | Sheaf cohomology H^n(F) := Ext^n(ℤ, F) of an abelian sheaf on a site; on the small étale site it is the étale cohomology H^n(X_ét, F) that RΓ computes. |
| `mathlib:CategoryTheory.Abelian.Ext` | `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean` | Ext groups in an abelian category, via shifted morphisms in the derived category: the groups Hom(K, L[n]) of the adjunction and duality statements. |
| `mathlib:AlgebraicGeometry.Smooth` | `Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean` | Smooth morphisms of schemes (locally standard smooth): the hypothesis of the trace and purity theorems. |
| `mathlib:AlgebraicGeometry.SmoothOfRelativeDimension` | `Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean` | SmoothOfRelativeDimension n f: f is locally standard smooth of relative dimension n; the pure relative dimension d of the smooth purity theorem. |
| `mathlib:AlgebraicGeometry.IsClosedImmersion` | `Mathlib/AlgebraicGeometry/Morphisms/ClosedImmersion.lean` | Closed immersions of schemes: the immersions i of cohomology with supports, i^! and the Gysin maps. |
| `mathlib:AlgebraicGeometry.IsOpenImmersion` | `Mathlib/AlgebraicGeometry/OpenImmersion.lean` | Open immersions of schemes: the immersions j of extension by zero and of the localization triangles. |
| `mathlib:AlgebraicGeometry.IsSeparated` | `Mathlib/AlgebraicGeometry/Morphisms/Separated.lean` | Separated morphisms. Nagata compactification also needs finite type (including quasi-compactness), with a qcqs base; separated and locally of finite type alone do not suffice. |
| `mathlib:AlgebraicGeometry.LocallyOfFiniteType` | `Mathlib/AlgebraicGeometry/Morphisms/FiniteType.lean` | Morphisms locally of finite type; part of the compactifiability hypothesis. |
| `mathlib:AlgebraicGeometry.IsProper` | `Mathlib/AlgebraicGeometry/Morphisms/Proper.lean` | Proper morphisms: for proper f, Rf_! = Rf_* and the pairings lose their compact supports. |
| `mathlib:AlgebraicGeometry.Flat` | `Mathlib/AlgebraicGeometry/Morphisms/Flat.lean` | Flat morphisms: the flatness hypothesis of the trace morphisms (quasi-finite flat, and (∗)_d of SGA 4 XVIII 2.9). |
| `mathlib:AlgebraicGeometry.IsFinite` | `Mathlib/AlgebraicGeometry/Morphisms/Finite.lean` | Finite morphisms: the finite locally free case of the degree normalization. |
| `mathlib:AlgebraicGeometry.Etale` | `Mathlib/AlgebraicGeometry/Morphisms/Etale.lean` | Étale morphisms: for étale f, f^! = f^* and the trace is the counit of f_! ⊣ f^*. |
| `mathlib:AlgebraicGeometry.LocallyQuasiFinite` | `Mathlib/AlgebraicGeometry/Morphisms/QuasiFinite.lean` | Locally quasi-finite morphisms: the relative-dimension-zero case of the trace and of f^!. |
| `mathlib:rootsOfUnity` | `Mathlib/RingTheory/RootsOfUnity/Basic.lean` | rootsOfUnity n M, the subgroup of units with x^n = 1: the sections μ_n(Γ(U, O_U)) of the Tate-twist sheaf. |
| `mathlib:Module.Injective` | `Mathlib/Algebra/Module/Injective.lean` | Injective modules; Λ self-injective (Module.Injective Λ Λ) is the coefficient hypothesis under which ordinary duals Hom(−, Λ) compute derived duals. |
| `mathlib:Module.Baer.injective` | `Mathlib/Algebra/Module/Injective.lean` | Baer R Q implies Module.Injective R Q, for a ring R and an R-module Q. The accompanying Module.Baer definition expresses extension of maps from ideals. |
| `mathlib:LinearMap.IsPerfPair` | `Mathlib/LinearAlgebra/PerfectPairing/Basic.lean` | A bilinear map p : M →ₗ N →ₗ R is a perfect pairing when both curried maps are bijective onto the duals: the form of the Poincaré duality pairings. |
| `mathlib:AlgebraicGeometry.AlgebraicCycle` | `Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean` | AlgebraicCycle X R := Function.locallyFinsupp X R, cycles as locally finitely supported functions on the points of X (generic points of integral closed subschemes): the source of the cycle class map. |
| `mathlib:AlgebraicGeometry.AlgebraicCycle.map` | `Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean` | Pushforward of algebraic cycles along a quasi-compact morphism, weighted by residue degrees and a dimension function: the cycle-side proper pushforward compared with the cohomological Gysin map. |
| `mathlib:PerfectField` | `Mathlib/FieldTheory/Perfect.lean` | Perfect fields: the base fields over which the cycle class of a singular cycle is built from its dense smooth locus. |
| `mathlib:IsSepClosed` | `Mathlib/FieldTheory/IsSepClosed.lean` | Separably closed fields: geometric points and the geometric cohomology H^i(X_k̄, −). |
| `mathlib:ZMod` | `Mathlib/Data/ZMod/Defs.lean` | ZMod n = ℤ/n, the basic coefficient ring Λ = ℤ/ℓⁿ. |
| `mathlib:AlgebraicGeometry.Scheme.Hom.finrank` | `Mathlib/AlgebraicGeometry/Morphisms/FlatRank.lean` | f.finrank s : ℕ, the rank of a finite flat morphism at a point of the base (locally constant for finite presentation): the r of the degree normalization Tr ∘ unit = r. |
| `mathlib:AlgebraicGeometry.AffineSpace` | `Mathlib/AlgebraicGeometry/AffineSpace.lean` | AffineSpace n S = 𝔸(n; S), affine space over a scheme with its structure morphism 𝔸(n; S) ↘ S: the source of the affine-space trace and of the A¹ tests. |
| `mathlib:DerivedCategory.singleFunctor` | `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean` | The functor placing an object in a single degree of the derived category: sheaves as complexes concentrated in degree 0. |
| `mathlib:DerivedCategory.homologyFunctor` | `Mathlib/Algebra/Homology/DerivedCategory/HomologySequence.lean` | The cohomology-object functor ℋ^q : D(C) ⥤ C; the sheaves R^q f_!K = ℋ^q(Rf_!K) and the amplitude statements. |
| `mathlib:CategoryTheory.constantSheaf` | `Mathlib/CategoryTheory/Sites/ConstantSheaf.lean` | constantSheaf J A : A ⥤ Sheaf J A; the constant sheaf Λ_X on the small étale site. |
| `mathlib:CategoryTheory.Functor.CommShift` | `Mathlib/CategoryTheory/Shift/CommShift.lean` | Compatibility of a functor with shifts, the data needed before a functor of triangulated categories can be triangulated. |
| `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf` | `TauCeti/AlgebraicGeometry/LineBundle/Basic.lean` | The existing full category of rank-one locally free O_X-modules. |
| `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial` | `TauCeti/AlgebraicGeometry/LineBundle/Basic.lean` | The globally free rank-one invertible sheaf used in the zero Chern-class test. |
| `tauceti:TauCeti.AlgebraicGeometry.LineBundleClass` | `TauCeti/AlgebraicGeometry/LineBundle/Class.lean` | The existing skeleton of invertible sheaves, carrying the tensor commutative monoid; no inverse or degree is asserted here. |
| `tauceti:TauCeti.AlgebraicGeometry.LineBundleClass.mk` | `TauCeti/AlgebraicGeometry/LineBundle/Class.lean` | The map from an invertible sheaf to its isomorphism class. |
| `tauceti:TauCeti.AlgebraicGeometry.LineBundleClass.mk_tensorProduct` | `TauCeti/AlgebraicGeometry/LineBundle/Class.lean` | The class of the tensor product equals the product of the two classes. |
| `tauceti:TauCeti.AlgebraicGeometry.LineBundleClass.mk_trivial` | `TauCeti/AlgebraicGeometry/LineBundle/Class.lean` | The class of the trivial invertible sheaf is the tensor unit. |
| `mathlib:AlgebraicGeometry.LocallyOfFinitePresentation` | `Mathlib/AlgebraicGeometry/Morphisms/FinitePresentation.lean` | The actual affine-local finite-presentation predicate, required in the quasi-finite flat trace. |
| `mathlib:IsRegularLocalRing` | `Mathlib/RingTheory/RegularLocalRing/Defs.lean` | The actual regular-local-ring predicate, including Noetherianity and the embedding-dimension/Krull-dimension equality. |

## Source corrections

All statements above and the notes below are in our own words. The packet records the public versions, hashes and access dates. The source-issue records retain their original review history.

### EtaleDualityAndPerverseSheaves/E1 — gap

[Exposé XVIII. La formule de dualité globale](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), Lemme 3.2.3 and its proof, p. 583-584 (retyped edition, version 71766d9, 2024).

After proving agreement between the two constructions of t_f, the author asks anyone who understands the demonstration to explain it to them.

Define smooth purity as the adjoint of the canonical derived trace. The augmented neighbourhood pro-system, its trace factorization from XVIII 2.14.4, and the Hom-colimit formula XVIII 3.1.17 identify that specific adjoint on stalks. The smooth-purity proofSteps now give this replacement of the disputed identification. The source issue remains historical; its prior review records the state before this revision.

**Reason.** The last derived-category identification is assigned to the reader, and the author records uncertainty about the argument.

### EtaleDualityAndPerverseSheaves/E2 — misprint

[Exposé XVIII. La formule de dualité globale](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 3.2.1, display (3.2.1.1), p. 583 (retyped edition, version 71766d9, 2024).

In the display identifying the top compact image with K″, the coefficient modulus changes from the fixed lower-case n to an unintroduced upper-case N, and the final parenthesis is unmatched.

j_! ℤ/n(−d) = K″(U, V, φ): the coefficient is ℤ/n (the integer n fixed in 3.2.1), not ℤ/N, and the final parenthesis is unbalanced.

**Reason.** No integer N is introduced in 3.2.1; K″ was defined two lines earlier from ℤ/n(−d)[−2d].

### EtaleDualityAndPerverseSheaves/E3 — misprint

[Exposé XVIII. La formule de dualité globale](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), Lemme 2.14.2, p. 561 (retyped edition, version 71766d9, 2024).

The displayed target index for the successive maps repeats i in the increment, instead of advancing to the next object of the chain.

f_i : K_i → K_{i+1}.

**Reason.** The f_i are composed into f : K_0 → K_{2k}, so consecutive indices are meant.

### EtaleDualityAndPerverseSheaves/E4 — misprint

[Lectures on Étale Cohomology](https://www.jmilne.org/math/CourseNotes/LEC.pdf), Remark 24.2 and the display before it, p. 145 (version 2.21, 22 March 2013).

The duality-defined pushforward uses c in the cohomological degree although only the relative-dimension difference e has been defined, and the closed-immersion remark uses the wrong sign for codimension.

Use the relative dimension e=dim Y−dim X: the target is H^{r−2e}(X,Λ(−e)). For a closed immersion of codimension c, e=−c and the target is H^{r+2c}(X,Λ(c)).

**Reason.** Dualizing π^* : H^{2d−r}_c(X, Λ(d)) → H^{2d−r}_c(Y, Λ(d)) with Poincaré duality on Y (dimension d) and X (dimension a) lands in H^{2a−2d+r}(X, Λ(a − d)) = H^{r−2e}(X, Λ(−e)); c is not defined in the remark.

### EtaleDualityAndPerverseSheaves/E5 — gap

[Lectures on Étale Cohomology](https://www.jmilne.org/math/CourseNotes/LEC.pdf), §23, after Theorem 23.3 and the NOTES, p. 140-142 (version 2.21).

The cycle construction is expressed with an alternating Chern character before that character has been defined; the claimed comparison with the direct cycle map has no proof in the notes.

Use the weighted supported classes in SGA 4½ [Cycle] 2.3.1–2.3.8, pp. 144–149. Derived pullback to graph fibres proves rational-equivalence descent on singular cycles, and the derived tensor product computes the alternating Tor lengths of an intersection. The cycle-class-map proofSteps give both comparisons integrally modulo n, without a Chern-character denominator. The prior review records the earlier unresolved state.

**Reason.** The notes say so themselves.

### EtaleDualityAndPerverseSheaves/E6 — misprint

[Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), §6.1, equations (6.1.1)-(6.1.2), p. 42 (arXiv:1807.04659v5, 18 July 2022).

Both tensor-Hom identifications in the two displayed cohomology formulas place F₁ and F₂ in the opposite Hom argument order.

H⁰(X, F₁ ⊗ F₂^∨) = Hom_X(F₂, F₁) and H²_c(X, F₁ ⊗ F₂^∨) ≅ Hom_X(F₁, F₂)^∨(−1).

**Reason.** F₁ ⊗ F₂^∨ ≅ Hom(F₂, F₁), and F₁^∨ ⊗ F₂ ≅ Hom(F₁, F₂). Both uses in the proof (vanishing for F₁, F₂ without common constituent, and the self-pair F₁ = F₂) are symmetric in the order.

### EtaleDualityAndPerverseSheaves/E7 — gap

[Exposé XVIII. La formule de dualité globale](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), Définition 1.1.2 and editors' note 2, p. 485 (retyped edition, version 71766d9, 2024).

The source asserts that a curve over a field is quasi-projective, with footnote (2).

EGA II 7.4.10 proves quasi-projectivity only for normal curves; the general case was announced for EGA V, which never appeared. The construction of the curve trace does not need it: it can be made locally on quasi-projective opens and glued, as in the proof of 1.1.6.

**Reason.** Editors' note 2 of the retyped edition.

### EtaleDualityAndPerverseSheaves/E8 — misprint

[Exposé XVIII. La formule de dualité globale](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), Proof of Proposition 1.1.6, p. 489 (2024 retyped edition 71766d9).

The projective-line Kummer construction gives its cohomological direct image degree one rather than degree two.

Replace R¹p_* by R²p_* in the Kummer class of O(1) on p : P¹_S → S.

**Reason.** The Kummer boundary of Pic lies in degree two; fibrewise H¹(P¹, μ_n) = 0 and H²(P¹, μ_n) = ℤ/n. The displayed superscript 1 was checked visually in the PDF, not only by text extraction.

### EtaleDualityAndPerverseSheaves/E9 — gap

[Exposé XVIII. La formule de dualité globale](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 3.1.9, (3.1.9.3), p. 572; editor note 37 on p. 573 (2024 retyped edition 71766d9).

The source says that an isomorphism cannot be expected without first choosing points coherently.

Fix a family P of points of S_ét and on V_ét use the points (p, ξ), ξ ∈ V_p, as in editor note 37; do not use independent Godement resolutions in the localization comparison.

**Reason.** The editor explicitly supplies the missing compatible point choices, affecting the enhancement/sheafified-adjunction proof model.

### EtaleDualityAndPerverseSheaves/E10 — misprint

[Exposé XVIII. La formule de dualité globale](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), 3.1.13, (3.1.13.1), p. 576; editor note 38 (2024 retyped edition 71766d9).

The source says that transposition produces a composition morphism Rh! Rg! → R(gh)!.

The actual transpose initially goes from R(gh)! to Rh! Rg!; invert that isomorphism to obtain the displayed direction.

**Reason.** Editor note 38 explicitly says the transposed morphism goes in the other direction. Both displayed functors are isomorphic, so the final pseudofunctor statement is unchanged.

## Coverage and validation

| Stage | Status | Remaining integration work |
| --- | --- | --- |
| `EtaleDualityAndPerverseSheaves:EDC.0` | planned | Replace precisely specified supplier-stage requests with accepted supplying declarations when those packages are integrated. Small proof steps remain in the target proof sketches; no separate lemma-node expansion is required. |
| `EtaleDualityAndPerverseSheaves:EDC.1` | planned | Collector stage; all targets are realized in its two substages. |
| `EtaleDualityAndPerverseSheaves:EDC.1:adjoint` | planned | Replace precisely specified supplier-stage requests with accepted supplying declarations when those packages are integrated. Small proof steps remain in the target proof sketches; no separate lemma-node expansion is required. |
| `EtaleDualityAndPerverseSheaves:EDC.1:biduality` | planned | Replace precisely specified supplier-stage requests with accepted supplying declarations when those packages are integrated. Small proof steps remain in the target proof sketches; no separate lemma-node expansion is required. |
| `EtaleDualityAndPerverseSheaves:EDC.2` | planned | Collector stage; all targets are realized in its two substages. |
| `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity` | planned | Replace precisely specified supplier-stage requests with accepted supplying declarations when those packages are integrated. Small proof steps remain in the target proof sketches; no separate lemma-node expansion is required. |
| `EtaleDualityAndPerverseSheaves:EDC.2:pairings` | planned | Replace precisely specified supplier-stage requests with accepted supplying declarations when those packages are integrated. Small proof steps remain in the target proof sketches; no separate lemma-node expansion is required. The distinct Euler-characteristic extension is the recorded restructure proposal. |
| `EtaleDualityAndPerverseSheaves:EDC.3` | planned | Replace precisely specified supplier-stage requests with accepted supplying declarations when those packages are integrated. Small proof steps remain in the target proof sketches; no separate lemma-node expansion is required. The absolute-purity/semistable trait extension is outside this part, with its consumers recorded in gaps. |

The packet has 52 targets, including all 50 original identifiers, 141 API entries, 76 unit tests and 24 planets. Each of the 19 definitions/constructions has at least three tests. All 141 API names have typed declarations, and all 76 tests have corresponding Lean `example`s identified by their names in docstrings. Every implementation status is `unchecked`. The handoff records the final packet and Lean validation results.

## Public references

- [P. Deligne, Exposé XVIII. La formule de dualité globale](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf). SGA 4, tome 3, Lecture Notes in Mathematics 305 (Springer, 1973); retyped edition of the SGA 4 re-edition project, version 71766d9 of 30 July 2024 (LNM page numbers in the margin); accessed 2026-10-10.
- [P. Deligne, Exposé XVII. Cohomologie étale à supports propres](https://www.normalesup.org/~forgogozo/SGA4/17/17.pdf). SGA 4, tome 3, Lecture Notes in Mathematics 305 (Springer, 1973); retyped edition of the SGA 4 re-edition project (2024); accessed 2026-10-10.
- [J. S. Milne, Lectures on Étale Cohomology](https://www.jmilne.org/math/CourseNotes/LEC.pdf). Version 2.21, 22 March 2013 (202 pages; printed page = PDF page); accessed 2026-10-10.
- [The Stacks Project Authors, The Stacks Project, Chapter 'More Étale Cohomology' (tag 0F4U)](https://stacks.math.columbia.edu/download/more-etale.pdf). Chapter PDF, version ed88ff78 compiled 14 July 2026; accessed 2026-10-10.
- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf). Publ. Math. IHÉS 43 (1974), 273-307; Numdam scan with OCR; accessed 2026-10-10.
- [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5). Annals of Mathematics 197 (2023), 423-531; read in arXiv:1807.04659v5 (18 July 2022), printed pages; accessed 2026-10-10.
- [Pierre Deligne, with contributions by J.-F. Boutot, A. Grothendieck, L. Illusie and J.-L. Verdier, Cohomologie étale (SGA 4½)](https://publications.ias.edu/sites/default/files/Number32.pdf). Lecture Notes in Mathematics 569 (1977), IAS public scan; accessed 2026-10-10.
- [B. Angéniol, Intersection de cycles et produit des classes de cohomologie](https://www.numdam.org/article/AST_1976__36-37__152_0.pdf). Public primary-source copy; accessed 2026-10-10.
- [A. Grothendieck, La théorie des classes de Chern](https://www.numdam.org/item/10.24033/bsmf.1501.pdf). Public primary-source copy; accessed 2026-10-10.
- [D. Laksov, D. Mumford and K. Suominen, Formule clef de la théorie des intersections](https://www.dam.brown.edu/people/mumford/alg_geom/papers/1975c--FormuleClef-NC.pdf). Public primary-source copy; accessed 2026-10-10.
