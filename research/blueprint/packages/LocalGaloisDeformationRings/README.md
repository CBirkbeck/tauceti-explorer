# Local Galois deformation rings and their components

This roadmap builds local framed lifting rings, their tangent and obstruction theory, tame conditions, Hodge-type quotients, finite-flat model resolutions, ordinary flag spaces and component comparisons. Its outputs serve modularity lifting, potential automorphy, compatible systems and patching. Explicit small-rank rings test the general constructions.

A framed ring, an unframed ring, a flag-incidence scheme and its flag-forgetting image have separate universal properties. Each condition retains the residual basis, coefficient category, determinant or multiplier, ordered characters and extension data. Point criteria quantify over finite coefficient algebras, including nonreduced ones whenever the theorem does.

## Ownership and prerequisites

- `GlobalGaloisDeformations:R04.1–R04.3` supplies coefficient categories, strict equivalence, representability and general local deformation problems; `R04.4` supplies inertia-rigid deformations and `G7` polarized groups. Here these are applied to local Galois groups.
- `PadicHodgeTheory:R06.2–R06.4` and `P7` supplies period rings, admissibility, ordinary representation criteria and (φ,Γ)-equivalences. `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`, `R07.3`, `R07.4` owns finite-flat, Fontaine–Laffaille and Breuil–Kisin categories and realizations; this roadmap owns their deformation applications and model spaces.
- `DeformationAndDerivedPatchingAlgebra:R03.1–R03.3` owns complete local algebra, excellence and completed tensor products. `AlgebraicModuliForArithmeticGeometry:R09.1` supplies flags and lattice representability; `AdicSpacesPartII:F0` supplies formal functions and algebraization.
- `ArithmeticStatistics:ST.5` supplies integral GSp/Lie theory and needs the general reductive coefficient-group extension for G-valued applications. Tau Ceti `ReductiveGroups`, Layers 7 and 9, supplies field theory and split integral forms; coefficient-ring Borels require the relative interface below.

Consumers include `GlobalGaloisDeformations:G7,R04.6`, `PotentialAutomorphyInfrastructure:PA.3`, `PotentialModularityAndCompatibleSystems:R24.2`, `GL2ModularityLifting:R32` and `PadicLocalLanglandsForGL2Qp:R30.5`. Global presentations, dual Selmer conditions, compatible systems and general patching stay with these owners. The GL₃ equations add local charts to the imported Kisin theory; further locally algebraic trianguline geometry belongs to the trianguline-variety direction.

## Conventions and existing vocabulary

- p is the coefficient prime, ℓ the residue characteristic of K; q is its residue cardinality away from p. Unless specified otherwise, f=[K:ℚ_p]. K/ℚ_ℓ is finite except in the equal-characteristic application. The coefficient integers 𝒪 of a finite E/ℚ_p have uniformizer ϖ and residue k. Cohomology is continuous for the stated topology.
- R□ represents actual lifts in a fixed basis; R represents strict classes under the Schur hypothesis. `LiftingRing`, `ConditionRing`, `GenericFibre` denote the framed ring, its specified quotient and localization at ϖ. Residual conjugacies are transported explicitly.
- Integral dimension is one plus relative dimension for the nonzero flat rings here; generic dimension is over E. Relative determinant presentations use ad⁰; integral scalar splitting requires p∤d. For general G, fix the whole G/G^der to use dim G^der.
- Ordinary-character reciprocity sends a uniformizer to geometric Frobenius. Tau Ceti `ClassFieldTheory`, Layer 7, uses arithmetic reciprocity: compose with inversion. The tame relation uses arithmetic φtφ⁻¹=t^q; inert quadratic places use q².
- HT(ε)=+1. Negate labelled weights from HT(ε)=−1 sources. Retain the contravariant D* and covariant Fontaine–Laffaille dictionaries. Ordinary highest weights λ give characters of weights −λ_{τ,d−i+1}−i+1; the rank-two weight-zero shape has {0,−1}, with dual KW shape {0,1}.
- Full types away from p retain N; p-adic inertia types have finite image; full WD types also retain Frobenius. Flat closures may contain dropped-monodromy boundary points. A uniformizer fibre differs from the closed-point fibre of a model resolution.
- Mathlib `Matrix.symplecticGroup` uses AJAᵀ=J. Compare this with gᵀJg=νJ before using similitudes; dim GSp₄=11, dim Sp₄=10.

Mathlib provides `MvPowerSeries`, `ProfiniteGrp`, `Module.Finite`, `IsAdicComplete` and `IsLocalRing.ResidueField`. Tau Ceti `TauCeti.ContCohomology.H2` is the additive Z²/B² quotient. Coefficient-linear structure, finite-dimensionality, natural-topology scalar comparison, local duality and Euler characteristic still require `ClassFieldTheory`, Layer 5, and continuous-cohomology interfaces. Weierstrass preparation/division (`PowerSeries.exists_isWeierstrassFactorization`, `PowerSeries.isWeierstrassDivision_weierstrassDiv_weierstrassMod`) require a nonzero residue series.

## Construction order and supplier interfaces

The eight layers follow dependencies. Bounded-height lattices, character coefficients, ordinary flags and Fontaine–Laffaille conditions precede the tame rigidity and Hodge applications. The semistable-ordinary quotient precedes its determinant comparison; exports come last. Internal prerequisites refer to numbered targets below; external prerequisites retain their roadmap/layer addresses. API names are in `TauCeti.GaloisDeformation.Local` unless another namespace is shown. The README specifies the mathematics; Suggested.lean gives signature forms where the carriers can be expressed.

The following external interfaces are needed:

- **Local models**, `AlgebraicModuliForArithmeticGeometry`, Part II, shared with `HilbertModularVarieties:H2`: Pappas–Rapoport flat closure for Res_{K/ℚ_p}GL_d, normal Cohen–Macaulay structure, reduced normal special fibre with rational singularities, dual-partition closure criterion and the stated naive=flat cases. Dyadic rank two also needs Deligne–Pappas local models.
- **Generic reducedness**, `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, Part II: Caraiani–Emerton–Gee–Savitt Theorem 1.3 for potentially Barsotti–Tate special fibres, used in Caraiani–Newton Lemma 5.3.3.
- **Endpoints**, `R07.4` and `PadicHodgeTheory:R06.4`: irreducible weight-p/dyadic classification, full KW II Lemma 3.5 and Berger–Li–Zhu's ordinary weight-(p+1) branch over ℚ_p.
- **Family admissibility**, `PadicHodgeTheory:R06.3`: Colmez–Fontaine realization, inertia-type projection and deformation-groupoid compatibility for completed potentially semistable families.
- **Relative Borels**, `ReductiveGroups`: for split G/𝒪 and local A, represent Borels by G/B₀ and prove G(A)-conjugacy to B₀ with canonical torus quotient (SGA3 XXII 5.8.3, XXVI 3.3). Explicit GL_d/GSp₄ flags supply their applications.
- **Division-algebra types**: characteristic-zero Jacquet–Langlands transfer, compatible mod-p cycles for p≠2 and level-zero type comparison.
- **GL₃ weak patching**, `PotentialAutomorphyInfrastructure`, polarized definite-unitary application: the weak minimal patching functor for 10-generic semisimple ρ̄, e(M∞(σ))=1 exactly for σ∈W?(ρ̄), globalization and weight elimination (LLHLM Definition 3.5.1, Theorem 3.5.2, Proposition 3.5.15; Emerton–Gee Corollary A.7). All-shape components and uniform prime assignment use this; the length->1 chart calculations are local.

## Layer 1: Universal lifting rings and coefficient infrastructure

Begin with universal rings and the local continuous-cohomology calculation. Then construct the character coefficients and the rank-general integral-model functor once. The Fontaine–Laffaille condition is included here as input to the Hodge and rigidity applications; the ordinary flag scheme is constructed here, with its geometric comparisons in Layer 6.

<a id="t1-1"></a>

### 1.1 The local framed deformation ring

For continuous ρ̄:Γ→GL_d(k), with Γ a local absolute Galois group satisfying Mazur p-finiteness, the framed lift functor on complete Noetherian local 𝒪-algebras with residue k is represented by R□ and its universal lift. Maps correspond naturally to lifts in the fixed residual basis. Local class field theory supplies p-finiteness.

Prerequisites: `GlobalGaloisDeformations:R04.1/lifting-functor`; `GlobalGaloisDeformations:R04.2/phi-p-condition`; `GlobalGaloisDeformations:R04.2/phi-p-global`; `GlobalGaloisDeformations:R04.2/universal-lifting-ring`; `GlobalGaloisDeformations:R04.2/universal-continuous-lift`; `DeformationAndDerivedPatchingAlgebra:R03.2`.

Sources: [Gee22], §3.1 and Lemma 3.2, p. 12; [KisinNotes], Lecture 1, (1.2) and Proposition (1.2.1)(1), p. 2.

<a id="t1-2"></a>

### 1.2 The functor of bounded-height lattices of a deformation family

For a complete Noetherian family V_A and imported étale M_A, use projective rank-d 𝔖_B-lattices spanning M_B with φ-cokernel killed by E(u)^h. On nilpotent coefficient algebras this is the lattice functor; integral/rational points use its model scheme. Tensoring gives functoriality, extensionality and height monotonicity. Finite-flat ℤ_p coefficients give uniqueness; existence requires coefficient projectivity. V* and V(−1) are distinct normalizations.

API:

- `heightLatticeFunctor`: L^{≤h}_{V_A}: the functor from A-algebras to sets, B ↦ {𝔖_B-lattices of E-height ≤ h in M_B} (lattices in the sense of R07.4/finite-height-lattices).
- `heightLatticeFunctor.map`: For B → B′, 𝔐_B ↦ 𝔐_B ⊗_B B′, with map_id and map_comp.
- `heightLatticeFunctor.ext`: Two points of L^{≤h}_{V_A}(B) are equal iff their underlying 𝔖_B-submodules of M_B are equal; the projectivity, spanning and height conditions are properties.
- `heightLatticeFunctor_subsingleton`: For B finite flat over ℤ_p, L^{≤h}_{V_A}(B) has at most one element (R07.4/finite-height-lattices (1)).
- `heightLatticeFunctor_nonempty_iff`: For finite-flat B/ℤ_p, nonemptiness is equivalent to finite E-height and projectivity of the unique lattice over 𝔖_B. If K⊃μ_p and B={(a,b)∈ℤ_p²:a≡b mod p}, the character (1,χ_p) has height ≤1 but no projective B-lattice.
- `heightLatticeFunctor.mono`: For h ≤ h′, L^{≤h}_{V_A}(B) ⊆ L^{≤h′}_{V_A}(B), compatibly with base change.

Worked checks:

- Rank one, M = 𝒪_ℰ·e with φ(e) = E(u)e: in the basis e the Frobenius matrix is E(u), which divides E(u)^1 but not E(u)^0, so L^{≤1}(ℤ_p) = {𝔖e} and L^{≤0}(ℤ_p) = ∅.
- A lattice with Frobenius matrix X in a basis lies in L^{≤0}(B) iff X is invertible over 𝔖_B, i.e. iff φ*𝔐_B → 𝔐_B is an isomorphism.
- For φ(e)=ue, no E(u)^h is divisible by u. Over ℚ_p, odd p, no alternate finite-height lattice exists: this module realizes the nontrivial Teichmüller fundamental character on K∞, unlike a crystalline power of ε. At p=2, 𝔖u⁻¹e instead has height zero.

Prerequisites: `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bk-coefficient-rings`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/kisin-modules`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/finite-height-lattices`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/etale-phi-modules-with-coefficients`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`.

Sources: [KisinPST], (1.2), pp. 516–517; [KisinPST], (1.2), p. 517; [KisinPST], Errata for [Ki 2], (E.4), p. 545.

<a id="t1-3"></a>

### 1.3 The universal character coefficient rings Λ_v and Λ̃_v

For residual full-flag data, take the completed group algebra of (𝒪_K×(p))^d and quotient by the intersection of a nonempty collection of minimal primes, selecting torsion-character components. The universal inertia characters combine the Teichmüller residual characters with the d ordered pro-p factors under geometric reciprocity. Extending to (K×(p))^d adds Frobenius variables and yields full Galois characters. The pro-p inertia here is inertia in the abelianized local Galois group, not the abelianization of the full inertia group. Minimal primes correspond to Galois orbits of torsion characters; Λ can have several components.

API:

- `ordinaryWeightRing`: Λ_v = 𝒪[[𝒪_{F_v}^×(p)ⁿ]]/𝔞 for a chosen set of minimal primes.
- `universalInertialCharacter`: χ_i^univ : I_{F_v} → Λ_v^×.
- `ordinaryWeightRingTilde`: Λ̃_v and χ̃_i^univ : G_{F_v} → Λ̃_v^×.
- `universalInertialCharacter_residual`: χ_i^univ ≡ χ̄_i modulo the maximal ideal.
- `minimalPrimes_torsionCharacters`: Minimal primes ↔ Galois orbits of torsion characters.
- `ordinaryWeightRing.universal`: Maps Λ_v→A classify the ordered pro-p unit characters with the chosen reductions whose group-algebra map kills 𝔞, naturally in A.

Worked checks:

- F_v = ℚ_p, p odd: 𝒪_{ℚ_p}^×(p) ≅ 1 + pℤ_p ≅ ℤ_p is torsion-free, so Λ_v = 𝒪[[X_1, …, X_n]] with 𝔞 = 0.
- F_v = ℚ_p(ζ_p): 𝒪_{F_v}^×(p) has torsion μ_p, so 𝒪[[𝒪_{F_v}^×(p)]] has several minimal primes once ζ_p ∈ 𝒪, and 𝔞 selects tuples of characters of μ_pⁿ.
- n = 1: χ_1^univ is the universal deformation of χ̄_1|_{I_{F_v}} with values in Λ_v, and Λ̃_v adds the Frobenius variable.

Prerequisites: `PadicMeasuresIwasawaAlgebras:L1/convolution-algebra`; `MvPowerSeries` (Mathlib); ClassFieldTheory / layer 7 the absolute local artin map its normalizations and conductors.

Sources: [ACC+], §6.2.6, p. 138.

<a id="t1-4"></a>

### 1.4 Tangent and obstruction description of local lifting rings

The dual cotangent space is Z¹(Γ,ad ρ̄), of dimension h¹+d²−h⁰; H²∨ surjects onto the minimal relation space. Local duality gives h⁰−h¹+h²=−d²[K:ℚ_p] above p, and zero away from p. Component dimensions are at least 1+d²(1+[K:ℚ_p]) and 1+d² respectively. H²=0 gives formal smoothness and equality.

Prerequisites: [1.1](#t1-1); `GlobalGaloisDeformations:R04.1/tangent-spaces`; `DeformationAndDerivedPatchingAlgebra:R03.2`; `TauCeti.ContCohomology.H2` (Tau Ceti); ClassFieldTheory / layer 5 local coefficients the brauer group the local invariant and duality.

Sources: [Gee22], Corollary 3.12, Lemma 3.13 and Corollary 3.14, pp. 13–14; [KisinNotes], Lecture 1, Lemma (1.3.1)(2), p. 3.

<a id="t1-5"></a>

### 1.5 Forgetting the framing of local lifts

If End_Γ(ρ̄)=k, strict-equivalence deformations have universal ring R and R□≅R[[X₁,…,X_{d²−1}]]. For non-Schur data retain framed or versal deformations.

Prerequisites: [1.1](#t1-1); `GlobalGaloisDeformations:R04.2/universal-deformation-ring`; `GlobalGaloisDeformations:R04.2/framed-unframed-comparison`; `GlobalGaloisDeformations:R04.1/strict-vs-full-conjugacy`.

Sources: [KisinNotes], Lecture 1, Remark (1.2.2)(3), p. 2; [Gee22], Exercise 3.9, p. 13.

<a id="t1-6"></a>

### 1.6 The Fontaine–Laffaille deformation condition

Over unramified K/ℚ_p, use the coefficient Fontaine–Laffaille category with filtration in [0,p−2] and its exact fully faithful covariant realization 𝐆, closed under subquotients. Require the residual object to be in its essential image with every labelled graded multiplicity at most one. Define the lifting condition by membership of all Artinian quotients in that image. It is a local deformation problem, liftable, with tangent the image of Ext¹_{MF}(𝐆⁻¹ρ̄,𝐆⁻¹ρ̄) in H¹(G_K,ad ρ̄). The category and realization belong to R07.3; this layer owns their deformation application. In this normalization a jump i realizes inertia ε^{−i}, so the weight-two good-reduction example is the dual Tate module.

API:

- `FLDeformation`: The condition 𝒟_ṽ on lifts of r̄|_{G_{F_ṽ}}: every Artinian quotient lies in the essential image of R07.3's realisation 𝐆_ṽ.
- `FLDeformation.isLocalDeformationProblem`: Closure of the realization image under subquotients and sums yields strict-conjugacy, fibre-product and inverse-limit stability.
- `FLDeformation.mem_iff`: For R Artinian, r ∈ 𝒟_ṽ(R) iff r ≅ 𝐆_ṽ(M) for some object M of R07.3's 𝓜𝓕_{𝒪,ṽ} with R-action; for general R ∈ C_𝒪, iff this holds for every Artinian quotient.
- `FLDeformation.tangentSpace`: The tangent space of 𝒟_ṽ is L_ṽ = image of Ext¹_{𝓜𝓕_{k,ṽ}}(𝐆_ṽ^{−1}(r̄), 𝐆_ṽ^{−1}(r̄)) in H¹(G_{F_ṽ}, ad r̄), using the Ext comparison of R07.3.
- `FLDeformation.liftable`: CHT Lemma 2.4.1: under the multiplicity-one hypothesis, every point over R/I (𝔪_R I = 0) lifts to R.
- `FLDeformation.baseChange`: A map of Artinian coefficient algebras carries a lift in 𝒟_ṽ to a lift in 𝒟_ṽ, via the coefficient-compatible realisation of R07.3.

Worked checks:

- For n = 1 the tangent space L_ṽ is the unramified classes H¹(G_{F_ṽ}/I_{F_ṽ}, ad r̄), of dimension 1 (CHT Corollary 2.4.4 with n = 1).
- For good-reduction E/ℚ_l, l≥3, jumps {0,1} give inertia {1,ε⁻¹}: E[l]∨ and T_lE∨ satisfy this condition. T_lE requires jumps {−1,0}.
- A crystalline character with Hodge–Tate weight l − 1 is not in 𝒟_ṽ: R07.3's objects satisfy Fil^{l−1}M = 0.
- r̄ = ε ⊕ ε violates the multiplicity-one hypothesis for n = 2, so Lemma 2.4.1 does not apply.

Prerequisites: [1.1](#t1-1); `GlobalGaloisDeformations:R04.3/local-deformation-problem`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-filtered-modules`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-functor-torsion`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-full-faithfulness`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-essential-image-subquotients`; `PadicHodgeTheory:R06.4/fontaine-laffaille-crystalline-comparison`; `PadicHodgeTheory:R06.4/fontaine-laffaille-sign-dictionary`.

Sources: [CHT08], §2.4.1, p. 33; [CHT08], §2.4.1, 𝒟_ṽ and Lemma 2.4.1, p. 35.

<a id="t1-7"></a>

### 1.7 Ordinary representations of weight λ

For dominant λ=(λ_{τ,1}≥⋯≥λ_{τ,d}), require an increasing stable full flag whose ordered characters χ_i satisfy χ_i(Art_K(u))=∏_τ τ(u)^{−λ_{τ,d−i+1}−i+1} on an open unit subgroup. Ordinary permits a finite-order factor; semistable-ordinary requires equality on all inertia. Its labelled HT weights are −λ_{τ,d−i+1}−i+1 in HT(ε)=+1 convention. Supply coefficient change, restriction, uniqueness for distinct inertial characters and potentially semistable comparison; exact characters give semistability. Weight λ=(k−2,0) in rank two has ordered characters 1,ε^{1−k}; duality and flag reversal give KW's ordinary shape with ε^{k−1} on the subline. The original ordered representations are not identified.

API:

- `IsOrdinaryOfWeight`: The predicate: ρ has a G_K-stable full flag whose graded characters χ_i satisfy χ_i∘Art_K ≡ Π_τ τ^{−(λ_{τ,n−i+1}+i−1)} up to finite order on 𝒪_K^×.
- `IsSemistableOrdinaryOfWeight`: The same with equality on I_K.
- `IsSemistableOrdinaryOfWeight.isOrdinary`: Semistable-ordinary of weight λ implies ordinary of weight λ.
- `IsOrdinaryOfWeight.potentiallySemistable`: Ordinary of weight λ implies potentially semistable of Hodge type v_λ; semistable-ordinary implies semistable of type v_λ.
- `IsOrdinaryOfWeight.flag_unique`: If the χ_i are pairwise distinct on I_K, the flag is unique.
- `IsOrdinaryOfWeight.restrict`: Ordinary of weight λ is preserved by restriction to G_{K′} (with the restricted weight).
- `IsOrdinaryOfWeight.baseChange`: Coefficient maps preserve direct-summand flags and ordered inertia characters, including the exact semistable-ordinary condition.

Worked checks:

- n = 1, λ = (λ_τ): χ_p^{-1}-normalised, ρ = χ_λ·(unramified) is ordinary of weight λ; ρ = χ_λ·ω (ω ramified of order p) is ordinary but not semistable-ordinary.
- For n=2 and λ=(0,0), the ordered inertia characters are 1 and ε_p⁻¹. Weight zero is not the condition that both diagonal characters are unramified.
- At λ=(0,0), a nonsplit extension of 1 by ε⁻¹ has the determinant polynomials but lacks the required stable subline of character 1.
- At λ=(k−2,0), ordered characters are 1,ε^{−(k−1)}; duality and flag reversal produce KW's subline ε^{k−1} and weight-zero quotient.

Prerequisites: [1.1](#t1-1); `PadicHodgeTheory:R06.4/ordinary-representation`; `PadicHodgeTheory:R06.4/ordinary-implies-semistable`; ClassFieldTheory / layer 7 the absolute local artin map its normalizations and conductors.

Sources: [NT26], Definition 2.5(2), arXiv v2 p. 12; [BCGP25], Definition 5.6.8, arXiv v1 pp. 129–130; [CN23], Definition 3.3.1, arXiv v3 pp. 50–51.

<a id="t1-8"></a>

### 1.8 Moduli of lattices of bounded E-height and their image

The lattice functor has projective model Θ_A with canonical very ample bundle, coefficient base change and a generic closed immersion. Its image A^{≤h} has the finite-rational-algebra height criterion and a finite universal 𝔖-module, generically projective, specializing to the unique lattice. Use Grassmannian bounds and formal GAGA. Height zero of the G_{K∞}-restriction need not imply G_K-semistability.

Prerequisites: [1.2](#t1-2); `AdicSpacesPartII:F0/grothendieck-algebraization`; `AlgebraicModuliForArithmeticGeometry:R09.1`.

Sources: [KisinPST], Proposition (1.3), p. 517; [KisinPST], Corollary (1.5.1), p. 518; [KisinPST], Proposition (1.6.4) and its proof, pp. 520–521; [KisinPST], Corollary (1.7), pp. 521–522.

<a id="t1-9"></a>

### 1.9 The ordinary flag scheme and its image ring R^△_v

Over Λ_v, the closed stable full-flag incidence scheme imposes the ordered inertia characters on direct-summand graded lines and projects properly to Spec R□. R△ is the image in its global functions. For domain coefficients, factoring through R△ is equivalent to having the required flag over the algebraic closure of the fraction field; the flag need not exist over the coefficient ring.

API:

- `ordinaryFlagScheme`: 𝒢_v ⊂ 𝓕 × Spec R^□_v.
- `ordinaryFlagScheme_proper`: 𝒢_v → Spec R^□_v is proper.
- `ordinaryFlagImage`: R^△_v = im(R^□_v → H⁰(𝒢_v, 𝒪)).
- `ordinaryFlagImage_points`: The domain point criterion.
- `ordinaryFlagScheme.points`: B-points classify framed lifts with stable full direct-summand flags and the prescribed ordered inertia characters, by universal-flag pullback.
- `ordinaryFlagScheme.baseChange`: Tensoring a flag of direct summands along a coefficient map gives the new point of the incidence scheme; identity and composition agree with ordinaryFlagScheme pullback.

Worked checks:

- n = 1: every line is a flag, and R^△_v = R^□_v/(ρ|_{I_{F_v}} − χ_1^univ).
- Requiring I_{F_v} to act on the i-th piece by χ^univ_{σ(i)} for σ ∈ S_n gives the variant R^{△,σ}_v used in the proof of L8/determinant-flag-comparison.
- A point of R^△_v need not carry a flag over R itself, only over the algebraic closure of its fraction field.

Prerequisites: [1.1](#t1-1); [1.3](#t1-3); `AlgebraicModuliForArithmeticGeometry:R09.1`.

Sources: [ACC+], §6.2.6, p. 138; [ACC+], §6.2.6, p. 139.

<a id="t1-10"></a>

### 1.10 Fixing the determinant of local lifts

For a continuous determinant lift ψ and p∤d, the det=ψ quotient uses ad⁰ for tangent and obstructions. The scalar splitting gives its completed tensor-product comparison with the character ring and lower relative dimensions (d²−1)(1+[K:ℚ_p]) above p and d²−1 away from p.

Prerequisites: [1.1](#t1-1); [1.4](#t1-4); `GlobalGaloisDeformations:R04.1/fixed-determinant-functors`; `GlobalGaloisDeformations:R04.2/fixed-determinant-rings`; ClassFieldTheory / layer 5 local coefficients the brauer group the local invariant and duality.

Sources: [Gee22], §3.18 and Exercise 3.19, p. 15.

<a id="t1-11"></a>

### 1.11 Archimedean deformation rings for odd p

For Γ_ℝ=C₂ and p odd, all positive-degree residual cohomology vanishes. The framed ring is formally smooth of relative dimension d²−h⁰(C₂,ad ρ̄). In rank two with odd determinant, the two eigenspaces are distinct and the relative dimension is two.

Prerequisites: [1.4](#t1-4); `GlobalGaloisDeformations:R04.1/lifting-functor`; `GlobalGaloisDeformations:R04.1/tangent-spaces`.

Sources: [TUNG21], §3.2.5, Proposition 3.2.7, p. 15.

<a id="t1-12"></a>

### 1.12 Local deformation rings under change of coefficients

For finite coefficient extension 𝒪→𝒪′, R□_{𝒪′}≅R□_𝒪⊗̂_𝒪𝒪′, compatibly with universal lifts and fixed determinants. Residue extension preserves cotangent/cohomology dimensions; components may split.

Prerequisites: [1.1](#t1-1); [1.4](#t1-4); `GlobalGaloisDeformations:R04.2/change-of-residue-field`; `GlobalGaloisDeformations:R04.1/change-of-coefficients`; `DeformationAndDerivedPatchingAlgebra:R03.1`.

Sources: [Gee22], §3.1, p. 12; [BLGGT14], Lemma 1.2.1, arXiv v4 p. 13.

<a id="t1-13"></a>

### 1.13 Fontaine–Laffaille deformations: tangent space and smoothness (CHT Lemma 2.4.2, Corollaries 2.4.3–2.4.4, Lemma 2.4.5)

For the preceding multiplicity-free Fontaine–Laffaille objects, prove the exact sequence 0→Hom_MF(M,N)→Fil⁰Hom(M,N)→Hom_{Fr⊗1}(gr M,N)→Ext¹_MF(M,N)→0, with middle map β↦(βΦ_M^i−Φ_N^iβ)_i. It yields dim L−h⁰(ad ρ̄)=fd(d−1)/2 and a formally smooth framed ring of relative dimension d²+fd(d−1)/2. In rank one L is unramified H¹. For a residual direct-sum decomposition, H¹(ad) and L split into the pairwise Hom/Ext summands. Keep the small weight range and multiplicity hypothesis, apart from the separately specified irreducible endpoint extension.

Prerequisites: [1.6](#t1-6); [1.1](#t1-1).

Sources: [CHT08], §2.4.1, Lemma 2.4.2, p. 35; [CHT08], §2.4.1, proof of Lemma 2.4.2 and Corollary 2.4.3, p. 36; [CHT08], §2.4.1, Corollary 2.4.4 and Lemma 2.4.5, p. 37.

<a id="t1-14"></a>

### 1.14 The odd archimedean deformation ring at p = 2

At p=2 in rank two, odd lifts complete the quadric a²+bc=1 for matrices (a,b;c,−a). This flat domain is a relative complete intersection of dimension two, with smooth generic and integral special fibre. At the identity involution the equation is X²+2X+YZ; at the nonidentity unipotent involution it is X²+2X+YZ+Z.

Prerequisites: [1.11](#t1-11); `GlobalGaloisDeformations:R04.1/fixed-determinant-functors`; `GlobalGaloisDeformations:R04.2/fixed-determinant-rings`; `MvPowerSeries` (Mathlib).

Sources: [TUNG21], §3.2.5, Proposition 3.2.7, p. 15.

<a id="t1-15"></a>

### 1.15 Coefficient rings Λ for finite, p-adic and local residue fields

Use κ with its natural topology: a finite field, finite p-adic extension, or k′((t)). Its Cohen-type coefficient Λ is respectively the unramified coefficient extension of 𝒪, κ itself, or the uniformizer completion of 𝒪′[[t]][1/t]. Define the Artinian coefficient category and continuous lifting functor with these topologies.

API:

- `CoeffRing`: The ring Λ attached to an 𝒪-field κ of the three kinds, with its residue isomorphism Λ/ϖ ≅ κ in cases (1), (3) and Λ = κ in case (2).
- `CoeffRing.isCohen`: In case (3), any 𝒪-algebra that is a complete DVR with uniformiser ϖ and residue field κ is isomorphic to Λ.
- `ArtinCat`: The category 𝔄_Λ with the topology on each object.
- `liftFunctorΛ`: D^□_ρ : 𝔄_Λ → Set, continuous lifts of ρ : G_F → GL_d(κ).
- `liftFunctorΛ_finite`: For κ finite, D^□_ρ restricted to Artinian objects is the lifting functor of GlobalGaloisDeformations R04.1.

Worked checks:

- For κ = k, CoeffRing κ = 𝒪.
- For κ = L, CoeffRing κ = L and 𝔄_Λ consists of finite local L-algebras with residue field L.
- For κ = k((t)), Λ is not 𝒪⟦t⟧ (not a DVR, residue field k) but the ϖ-adic completion of 𝒪⟦t⟧[1/t], a DVR with residue field k((t)).
- For κ finite, liftFunctorΛ ρ agrees with the lifting functor of R08.1/local-lifting-ring on Artinian objects.

Prerequisites: [1.1](#t1-1); [1.12](#t1-12); `DeformationAndDerivedPatchingAlgebra:R03.1`; `IsAdicComplete` (Mathlib); `IsLocalRing.ResidueField` (Mathlib).

Sources: [BIP23], §3.5, the coefficient rings Λ and Remark 3.32, arXiv v2 pp. 25–26; [BIP23], Proposition 3.33, arXiv v2 p. 26.

<a id="t1-16"></a>

### 1.16 Presentation of framed rings over Λ and the cocycle count

Over Λ, R□=Λ[[X₁,…,X_r]]/(f₁,…,f_s), with r=dim_κZ¹(ad ρ), s=h²(ad ρ) and r−s=d²(1+f); relations may be padded by zero. For finite continuous V, dim Z¹(V)=h¹(V)+dim V−h⁰(V)=(1+f)dim V+h²(V). Relative to the universal determinant ring R_{det ρ}, the same presentation uses ad⁰ without assuming p∤d. Require coefficient-linear continuous cohomology, finiteness and natural-topology comparison for κ.

Prerequisites: [1.15](#t1-15); [1.4](#t1-4); `DeformationAndDerivedPatchingAlgebra:R03.2`; ClassFieldTheory / layer 5 local coefficients the brauer group the local invariant and duality.

Sources: [BIP23], Proposition 3.33 and (21)–(22), arXiv v2 p. 26, and Proposition 4.3, p. 37; [PQ26], Lemma 3.1, p. 22, and Proposition 3.6, p. 24 (arXiv v2).

<a id="t1-17"></a>

### 1.17 G-valued framed deformation rings

For smooth affine G/Λ, continuous framed lifts Γ→G(A) have universal ring R□_{ρ̄,G}, tangent Z¹(Γ,Lie G with Ad ρ̄), and contravariant maps induced by G→H. Fixing a multiplier means fixing the map to G/G^der. Import the integral group/Lie interface; dim GSp₄=11 and dim Sp₄=10.

API:

- `GLift`: D^□_{ρ,G}(A): continuous lifts Γ → G(A) of ρ.
- `GFramedRing`: R^□_{ρ,G}, the pro-representing complete local Noetherian Λ-algebra, with the universal lift ρ^□_G : Γ → G(R^□_{ρ,G}).
- `GFramedRing.tangent`: Hom_Λ(R^□_{ρ,G}, κ[ε]) ≅ Z¹(Γ, ad ρ).
- `GFramedRing.map`: A morphism φ : G → H induces R^□_{φ∘ρ,H} → R^□_{ρ,G}, with map_id and map_comp.
- `GFramedRing.fixedMultiplier`: For a character μ lifting ν∘ρ, the quotient R^{□,μ}_{ρ,G} of lifts with ν∘ρ_A = μ.
- `GFramedRing.gl`: For G = GL_d, R^□_{ρ,GL_d} = R^□_ρ of R08.1/local-lifting-ring.
- `GFramedRing.hom_ext`: Maps from the universal ring are equal iff their framed lifts agree; this bijection is natural in coefficients.

Worked checks:

- G = 𝔾_m, F = ℚ_p (p odd), ρ trivial: R^□_{ρ,G} ≅ 𝒪⟦y₁, y₂⟧ (R08.1/rank-one-ring).
- G trivial: R^□_{ρ,G} = Λ.
- G = GSp₄ with fixed multiplier, v ∤ p, H⁰(F_v, ad⁰ρ̄(1)) = 0: R^{□,μ} is a power series ring over 𝒪 in 10 variables (BCGP21 Proposition 7.4.2).
- GFramedRing for GL_d agrees with R^□_ρ of R08.1/local-lifting-ring.

Prerequisites: [1.15](#t1-15); [1.1](#t1-1); `DeformationAndDerivedPatchingAlgebra:R03.2`; `Matrix.symplecticGroup` (Mathlib); `ArithmeticStatistics:ST.5/symplectic-similitude-group`.

Sources: [PQ26], §3, Lemma 3.2, arXiv v2 p. 23; [BCGP21], §7.1, arXiv v3 p. 169.

<a id="t1-18"></a>

### 1.18 Completed local rings at points of the generic fibre are framed rings

At a coefficient-valued lifting point, the completed localization of Λ⊗R□ represents deformations of its specialised representation. In particular the completion of R□[1/p] at a closed point x represents E′-Artinian lifts of ρ_x, E′ its residue field. H²(ad ρ_x)=0 makes this a power-series ring.

Prerequisites: [1.15](#t1-15); [1.16](#t1-16); [1.1](#t1-1); [1.10](#t1-10).

Sources: [BIP23], Proposition 3.41, arXiv v2 p. 29; [CG18], §4.1, proof of Lemma 4.11 (published p. 365); [BCGP21], §7.1, the paragraph after Definition 7.1.2, arXiv v3 pp. 169–170; [BHS19], §3.6 and Remark 3.6.1, printed pp. 362–363.

<a id="t1-19"></a>

### 1.19 The universal deformation ring of a character

For K/ℚ_p finite, R□≅𝒪[μ_{p∞}(K)][[X₁,…,X_{[K:ℚ_p]+1}]]. Splitting the torsion characters labels geometric components, each formally smooth. For ℚ_p, odd p, this is 𝒪[[X,Y]]; over a field with exactly μ_p torsion there are p geometric components.

Prerequisites: [1.16](#t1-16); ClassFieldTheory / layer 7 the absolute local artin map its normalizations and conductors.

Sources: [BIP23], Lemma 4.1 and its proof, arXiv v2 p. 36.

<a id="t1-20"></a>

### 1.20 Presentations of G-valued framed rings and central quotients

For smooth affine 𝒪-groups φ:G→H with G⁰→H⁰ smooth surjective, put 𝔨=ker(ad ρ→ad(φρ)). Then R□_G=R□_H[[X₁,…,X_r]]/(f₁,…,f_t), r=dim Z¹(𝔨), t=h²(𝔨); for Γ=G_K, r−t=(dim G−dim H)(1+f). Taking H=1 gives the absolute presentation. Continuous sections are required for local-field κ. For generalised reductive G and flat closed Z⊂Z(G⁰) normal in G, H=G/Z: finite étale Z gives R□_H≅R□_G; a torus Z with Z∩G^der étale gives R□_{G/G^der}⊗̂_{R□_{H/H^der}}R□_H≅R□_G. Away from p, GSp₄ with fixed multiplier and H⁰(ad⁰ρ̄(1))=0 has a ten-variable smooth ring; if ρ̄ is also unramified, every lift is unramified.

Prerequisites: [1.17](#t1-17); [1.16](#t1-16); [1.10](#t1-10); ClassFieldTheory / layer 5 local coefficients the brauer group the local invariant and duality.

Sources: [PQ26], Proposition 3.6, arXiv v2 p. 24; [PQ26], Corollary 3.12 and Proposition 3.13, arXiv v2 p. 26; [BCGP21], Proposition 7.4.2, arXiv v3 p. 189.

<a id="t1-21"></a>

### 1.21 G-valued ordinary representations of weight λ

For split connected reductive G over 𝒪, identify the canonical Borel-quotient torus using a fixed split B₀,T₀. Given inertial cocharacters λ_τ, put χ_λ=∏_τ λ_τ∘τ∘rec_v⁻¹. A lift to G(A), A finite local E-algebra, is F′_v-ordinary if it lands in a Borel and its torus projection on I_{F′_v} equals χ_λ; this is independent of the conjugating element. Dominant regular λ gives Hodge type v_λ. For GL_d, the exponent cocharacters are −(λ′_{τ,d+1−i}+i−1), rather than the highest-weight λ′ itself. Relative conjugacy and representability of Borels over coefficient rings are required in general G; GL_d and GSp₄ use explicit full and isotropic flags.

API:

- `canonicalTorus`: T_G = B/R_u(B), canonically independent of B.
- `chiLambda`: χ_λ : I_{F_v} → T_G(𝒪) attached to cocharacters λ_τ.
- `IsGOrdinary`: ρ : G_{F_v} → G(A) is F′_v-ordinary of weight λ.
- `IsGOrdinary.gl`: For GL_d the cocharacters satisfy λ_{τ,j}=−(λ′_{τ,d+1−j}+j−1), with finite-order factors killed over F′_v.
- `IsGOrdinary.map`: Ordinarity is preserved by central isogenies G → G′ with the induced weight.

Worked checks:

- G = T a torus: B = T, T_G = T and ρ is F′_v-ordinary of weight λ iff ρ|I_{F′_v} = χ_λ.
- For GL₂, cocharacter (1,0) corresponds to highest weight (−1,−1), giving subline ε and trivial quotient inertia; highest weight (0,0) gives cocharacter (0,−1).
- Regular GSp₄ ordinarity uses an isotropic full flag with characters χ₁,χ₂,ε⁻¹χ₂⁻¹,ε⁻¹χ₁⁻¹.
- The definition is for lifts to finite E-algebras; a residual ρ̄ with a stable Borel is not 'ordinary of weight λ' (χ_λ mod 𝔪 loses the weight).

Prerequisites: [1.17](#t1-17); [1.7](#t1-7); ClassFieldTheory / layer 7 the absolute local artin map its normalizations and conductors; ReductiveGroups / layer 7 structure theory; ReductiveGroups / layer 9 pinned chevalleydemazure group schemes over ℤ.

Sources: [FKP22], Appendix B, arXiv v5 p. 52; [FKP22], Definition B.2, arXiv v5 p. 52.

<a id="t1-22"></a>

### 1.22 Smooth points of the generic fibre and purity

Away from p, a closed characteristic-zero point is regular iff H²(ad⁰ρ_x)=H⁰(ad⁰ρ_x(1))=0. Pure WD points satisfy this vanishing. The unrestricted GL_d generic dimension is d²; a fixed full abelianisation gives dim G^der in the group-valued setting.

Prerequisites: [1.18](#t1-18); [1.4](#t1-4); ClassFieldTheory / layer 5 local coefficients the brauer group the local invariant and duality.

Sources: [BCGP21], Lemma 7.1.3, arXiv v3 p. 170.

<a id="t1-23"></a>

### 1.23 Deformation rings of (φ, Γ)-modules and their trianguline and de Rham quotients

For noncritical crystabelline D, End(D)=E, generic regular parameters and noncritical refinements, R_D,R_{D,w},R_{D,g} are smooth of dimensions 1+d²f, 1+d(d+1)f/2, 1+d(d−1)f/2, f=[K:ℚ_p]. Identify Ext¹ tangents and the first-order Cartesian comparison with locally algebraic parameters. For D=D_rig(V), recover unframed Galois deformations.

API:

- `PhiGamma.defRing`: R_D for a (φ, Γ_K)-module D with End(D) = E.
- `PhiGamma.triangulineDefRing`: R_{D,w}, deformations with a deformation of the triangulation attached to w.
- `PhiGamma.deRhamDefRing`: R_{D,g}, de Rham deformations.
- `PhiGamma.tangent_defRing`: Tangent space of R_D is Ext¹(D, D); of R_{D,w} the classes preserving the triangulation.
- `PhiGamma.formallySmooth`: Under genericity of δ, R_D, R_{D,w}, R_{D,g} are formally smooth over E.
- `PhiGamma.galois_compat`: For D = D_rig(V), R_D is the unframed deformation ring of V (R08.1/completion-at-points modulo framing).
- `triangulineDefRing.forget`: Forgetting the triangulation induces R_D→R_{D,w}, taking each trianguline point to its underlying deformation.

Worked checks:

- n = 1: R_D ≅ R_δ ≅ E⟦x₁, …, x_{[K:ℚ_p]+1}⟧.
- The tangent map of R_D → R_{D,w} identifies Hom(R_{D,w}, E[ε]) with the subspace of Ext¹(D, D) of extensions that are trianguline for the deformed refinement.
- D=ℛ⊕ℛ(ε) violates End(D)=E and genericity; its cyclotomic off-diagonal H² is nonzero.
- For D = D_rig(V) with End V = E, R_D is the unframed deformation ring of V.

Prerequisites: [1.18](#t1-18); `PadicHodgeTheory:P7`.

Sources: [DING25], §3.2.2, arXiv p. 61; [DING25], §3.2.2, arXiv p. 61.

<a id="t1-24"></a>

### 1.24 Fixed-determinant rings by twisting: the functor 𝒳 and the power map φ_d

Let ψ lift det ρ̄ and χ=ψ∘Art_K|_μ on the selected local-Artin torsion subgroup μ. For continuous θ:G_K→1+𝔪_A trivial on Art_K(μ), 𝒳 is represented by 𝒪(𝒳)=𝒪[[Y₁,…,Y_{f+1}]]. The d-th-power map φ_d is finite flat, generically étale and a special-fibre universal homeomorphism. Scalar twisting (ρ,θ)↦(ρ⊗θ⁻¹,θ) gives R^{□,χ}⊗_{𝒪(𝒳),φ_d}𝒪(𝒳)≅R^{□,ψ}⊗̂_𝒪𝒪(𝒳). Here R^{□,χ} fixes det on μ and R^{□,ψ}=R□⊗_{R_{det ρ̄},ψ}𝒪 fixes the whole determinant. These comparisons allow p|d.

Prerequisites: [1.19](#t1-19); [1.10](#t1-10); [1.1](#t1-1).

Sources: [BIP23], §5, (30) and Proposition 5.1, arXiv v2 pp. 47–48; [BIP23], Lemma 5.3, arXiv v2 p. 48.

## Layer 2: Tame conditions and components away from p

The prime-to-p inertia decomposition reduces minimal ramification to a tame matrix problem. Keep the tame full-type ring distinct from the finite-image inertia datum at p. The rank-two and symplectic examples specify equations and component behaviour rather than only dimension bounds.

<a id="t2-1"></a>

### 2.1 The tame quotient and the reduction to tame pieces

Away from p, P=ker(I_K→ℤ_p) has prime-to-p finite quotients. After splitting its absolutely irreducible residual constituents, decompose lifts into tame multiplicity spaces; Frobenius permutes constituents and induction reconstructs the lift. This gives an equivalence of lifting problems; P generally exceeds wild inertia.

Prerequisites: `GlobalGaloisDeformations:R04.1/lifting-functor`; `GlobalGaloisDeformations:R04.1/strict-deformation-functor`; `ProfiniteGrp` (Mathlib).

Sources: [CHT08], §2.4.4, Lemma 2.4.10 and Corollary 2.4.13, pp. 41–43.

<a id="t2-2"></a>

### 2.2 Unramified lifts

If ρ̄ is unramified, unramified lifts are determined by an arbitrary Frobenius matrix lifting ρ̄(Frob). Their ring is formally smooth over 𝒪 of relative dimension d²; for a compatible fixed unramified determinant its relative dimension is d²−1. Unramified residual data alone does not force every lift to be unramified.

Prerequisites: [2.1](#t2-1); [1.1](#t1-1); `GlobalGaloisDeformations:R04.3/local-deformation-problem`; `GlobalGaloisDeformations:R04.3/deformation-problem-ideal`; `MvPowerSeries` (Mathlib).

Sources: [Gee22], Definition 3.36(1) and Theorem 3.38(2), p. 21; [CHT08], §2.4.4, remark after Definition 2.4.14, p. 43.

<a id="t2-3"></a>

### 2.3 Minimally ramified lifts

In each tame multiplicity space, require the kernels of all powers of unipotent inertia to be free direct summands of the residual ranks and commute with reduction. Transport through tame splitting. The condition respects strict conjugacy, tame-generator change and coefficient maps. Prime-to-p residual inertia gives the fixed-kernel condition.

API:

- `IsMinimallyRamified`: The minimally ramified condition on lifts of ρ̄|_{T_q} and of ρ̄.
- `isMinimallyRamified_iff_filtration`: Equivalent to a σ_q-unipotent filtration by direct summands lifting the residual kernel filtration.
- `IsMinimallyRamified.conj`: Stable under Γ̂_n-conjugation.
- `minimallyRamified_deformationProblem`: Minimally ramified lifts form a deformation problem.
- `minimal_baseChange`: A map of coefficient algebras carries a minimal lift and its split kernel flag to the corresponding minimal lift; each kernel commutes with base change.
- `minimal_generator_independent`: Replacing a topological generator of the pro-p tame inertia factor by its unit power gives the same minimal condition and kernel filtration.

Worked checks:

- For unramified ρ̄, minimally ramified = unramified.
- Conjugating by Γ̂_n preserves the condition.
- ρ(σ_q) = (1 x; 0 1), x ∈ m_A∖0, lifting ρ̄(σ_q) = 1, is not minimally ramified.

Prerequisites: [2.1](#t2-1); `GlobalGaloisDeformations:R04.3/local-deformation-problem`.

Sources: [CHT08], §2.4.4, Definition 2.4.14 and Corollary 2.4.18, pp. 43–44.

<a id="t2-4"></a>

### 2.4 Structure of unrestricted lifting rings away from p

Away from p, H⁰(ad ρ̄(1))=0 gives an unrestricted rank-d ring 𝒪[[X₁,…,X_{d²}]]. In rank two with compatible fixed determinant, the unrestricted ring is reduced, 𝒪-flat and a complete intersection of dimension four. Its generic components are regular of dimension three, with constant inertia type after forgetting N. Full type may change at component intersections; H⁰(ad⁰ρ(1)) detects ambient smoothness.

Prerequisites: [1.1](#t1-1); [1.4](#t1-4); [2.1](#t2-1); ClassFieldTheory / layer 5 local coefficients the brauer group the local invariant and duality.

Sources: [CHT08], §2.4.3, Lemma 2.4.9, p. 40; [Gee22], Theorem 3.31, p. 19; [TUNG21], §3.2.6, Lemma 3.2.8, p. 15; [BLGGT14], Lemma 1.3.4, arXiv v4 p. 21.

<a id="t2-5"></a>

### 2.5 Steinberg (unipotent-monodromy) lifts

For trivial residual data and q≡1 mod p, impose unipotent inertia and a q-chain α,qα,…,q^{d−1}α of Frobenius roots, then take the reduced flat closure. In rank two q(tr Φ)²=(1+q)²det Φ. Monodromy may drop on the boundary. Compare separately with the filtered discrete-series condition.

API:

- `SteinbergLifts`: D^Stein,1 and its flat closure D^Stein.
- `steinberg_charpoly_frob`: Frobenius eigenvalues in ratio q.
- `steinberg_le_unipotentInertia`: D^Stein ⊆ D^{(1,…,1)}.
- `steinberg_n_two`: For n = 2, the relation q(tr ρ(φ))² = (1 + q)² det ρ(φ).
- `SteinbergLifts.baseChange`: The q-chain and unipotence equations, and the resulting flat-closure point, commute with coefficient maps.

Worked checks:

- For n = 2 the Steinberg relation is q(tr ρ(φ))² = (1 + q)² det ρ(φ).
- Every Steinberg lift has unipotent inertia.
- An unramified lift with Frobenius eigenvalue ratio ≠ q has unipotent inertia but is not Steinberg.

Prerequisites: [2.1](#t2-1); `GlobalGaloisDeformations:R04.3/local-deformation-problem`; `GlobalGaloisDeformations:R04.3/deformation-problem-ideal`.

Sources: [TaylorII], §3, definition of D^{Stein,1} and D^{Stein} before Proposition 3.1, p. 196; [Gee22], Definition 3.36(3), p. 21.

<a id="t2-6"></a>

### 2.6 The q-tame group

For p∤q, T_q=ℤ_p⋊ℤ̂ with φtφ⁻¹=t^q; ⟨t,φ^b⟩≅T_{q^b} and G_K/P≅T_q. In maximal-ideal-topological coefficients, tame matrices with pro-p inertia and BAB⁻¹=A^q give a unique continuous representation. Dense generators detect equality. The abelianisation is ℤ_p/(q−1)×ℤ̂.

API:

- `TameGroup`: T_q as a profinite group with generators t, φ_q.
- `TameGroup.conj_t`: φ_q t φ_q^{-1} = t^q.
- `TameGroup.lift`: A pair (A, B) in GL_n(R) with B A B^{-1} = A^q and A of pro-p order (for R ∈ C_𝒪: the reduction of A unipotent) defines a unique continuous representation of T_q.
- `TameGroup.ofLocalField`: G_K/P_K ≅ T_q for K/ℚ_ℓ with residue field 𝔽_q, given the choices.
- `TameGroup.lift_ext`: Agreement on dense generators t,φ determines a continuous representation; tame-pair lifting commutes with coefficient maps.

Worked checks:

- T_q^{ab} ≅ ℤ_p/(q − 1) × ℤ̂.
- q = 1: T_1 = ℤ_p × ℤ̂ is abelian (the relation φtφ^{-1} = t is trivial).
- For q ≥ 2, T_q is not abelian: φ_q t φ_q^{-1} = t^q ≠ t (t has infinite order).
- ⟨t, φ_q^b⟩ ≅ T_{q^b}.

Prerequisites: [2.1](#t2-1); `ProfiniteGrp` (Mathlib).

Sources: [LTXZZrigid], Definition 3.3.1, arXiv v1 p. 15.

<a id="t2-7"></a>

### 2.7 Ramification types U1–U3, P, H of GSp₄-valued residual representations

The U₁,U₂,U₃ representatives are E₂₃, E₁₂−E₃₄, E₁₂+E₂₃−E₃₄. Require p≥5 at U₃ and p≥3 at U₁,U₂. Type P has two distinct inertia characters on isotropic planes and x−1 a unit; H has absolutely irreducible inertia and x⁴−1 a unit. Geometric orbit comparisons use splitting coefficients. Cyclotomic similitude excludes P.

API:

- `GSp4RamType`: The types U1, U2, U3, P, H as a predicate on r̄ : G_x → GSp₄(k).
- `GSp4RamType.unipotent_rank`: r̄ is of type U_i iff r̄(I_x) is generated by exp(N) with N ∈ sp₄ nilpotent of rank i.
- `GSp4RamType.exclusive`: The types U, P, H are mutually exclusive.
- `GSp4RamType.not_P`: A cyclotomic-power similitude excludes type P.
- `GSp4RamType.conjugate`: Residual GSp₄-conjugacy preserves type; splitting coefficient extension preserves the geometric orbit description.

Worked checks:

- r̄(σ) = exp(E₂₃) = 1 + E₂₃ has rank-one logarithm, so r̄ is U1.
- For p = 3, exp(N₃) = 1 + N₃ + N₃²/2 + N₃³/6 is not defined over k; type U3 is stated for p ≥ 5.
- Unramified r̄ is of no type.
- r̄|I_x absolutely irreducible with x ≡ 2 mod 5, p = 5: x⁴ − 1 ≡ 0 mod 5 is excluded from type H.

Prerequisites: [1.17](#t1-17); [2.1](#t2-1).

Sources: [CG20], Assumption 4.3, published pp. 813–814; [CG20], Remark 4.4, published p. 814.

<a id="t2-8"></a>

### 2.8 The minimally ramified deformation ring

Minimal ramification is liftable, with framed ring 𝒪[[X₁,…,X_{d²}]] and unframed tangent dimension h⁰(ad ρ̄). Construct kernel/image filtrations over small extensions compatibly with tame splitting. If p∤#ρ̄(I_K), minimality means killing ker(ρ̄|_I), and L=H¹(G_K/I_K,(ad ρ̄)^{I_K}).

Prerequisites: [2.3](#t2-3); [2.1](#t2-1); [1.1](#t1-1); `GlobalGaloisDeformations:R04.3/deformation-problem-ideal`; `MvPowerSeries` (Mathlib).

Sources: [CHT08], §2.4.4, Corollary 2.4.21, p. 46; [CHT08], §2.4.4, Lemma 2.4.22, p. 47.

<a id="t2-9"></a>

### 2.9 Fixed inertial type quotients

The rank-two fixed-type ring is the reduced flat closure of characteristic-zero exact full-inertia-type points: its ideal is their kernel intersection. These points are dense, while boundary points may lose type. Nonzero quotients have dimension four; only finitely many types occur. Uniqueness respects the universal quotient map.

API:

- `typeQuotient`: R^□_{ρ̄,χ,τ} as a quotient of R^□_{ρ̄,χ}.
- `typeQuotient_points`: Every exact-type point factors through the type quotient; its exact-type points are Zariski dense. The converse can fail on component intersections.
- `typeQuotient_krullDim`: Nonzero ⇒ Krull dimension 4 (n = 2).
- `typeQuotient_finite`: Only finitely many full inertial types have a nonzero closure quotient.
- `typeQuotient_unique`: Equality of closure kernels gives the unique isomorphism commuting with the universal quotient map.

Worked checks:

- For ρ̄ unramified, trivial r|I_K and N = 0 give the unramified quotient. The closure of a Steinberg type with N ≠ 0 can meet it at an N = 0 point.
- Only finitely many types occur.
- The naive quotient by the equations of the type need not be p-torsion free; the definition takes the flat closure.

Prerequisites: [2.4](#t2-4); `GlobalGaloisDeformations:R04.3/deformation-problem-ideal`.

Sources: [Gee22], §3.31, after Theorem 3.31, pp. 19–20; [Shotton], Definition 3.5 and Proposition 3.6, p. 12.

<a id="t2-10"></a>

### 2.10 Local rings at Taylor–Wiles primes

For rank two, odd p, q≡1 mod p, distinct residual Frobenius eigenvalues and fixed unramified determinant, the ring is 𝒪[[x,y,B,u]]/((1+u)^{p^m}−1), p^m∥q−1. Set C=(1,y;x,1) and lift one residual Frobenius eigenvalue to α. The universal matrices are Φ=C⁻¹diag(α+B,χ(φ)/(α+B))C and σ=C⁻¹diag(1+u,(1+u)⁻¹)C. It is smooth of relative dimension three over 𝒪[Δ].

Prerequisites: [2.4](#t2-4); [2.1](#t2-1); [1.1](#t1-1).

Sources: [Gee22], §3.32, Lemma 3.33 and Exercise 3.34, p. 20.

<a id="t2-11"></a>

### 2.11 Local models for GSp₄ Ihara avoidance: nilpotent strata, 𝒩(q) and ℳ(x, y; q)

For p≥3, exp₂(N)=1+N+N²/2+N³/2 and log₂(U)=(U−1)−(U−1)²/2 are inverse on the specified symplectic schemes. Frobenius gives ΦNΦ⁻¹=qN+((q−q³)/3)N³, retaining the characteristic-three correction. Centralizers are smooth of dimensions 11,7,5,3 for ranks 0–3. The pair scheme ΦNΦ⁻¹=qN+q*N³ identifies with the unipotent specialization of the reciprocal-eigenvalue tame matrix model.

API:

- `GSp4.exp₂`: exp₂ : 𝒩 → 𝒰, N ↦ I + N + N²/2 + N³/2.
- `GSp4.log₂`: log₂ : 𝒰 → 𝒩, U ↦ (U − I) − (U − I)²/2.
- `GSp4.exp₂_log₂`: exp₂ ∘ log₂ = id and log₂ ∘ exp₂ = id.
- `GSp4.exp₂_pow`: exp₂(mN + m*N³) = exp₂(N)^m, m* = (m − m³)/3.
- `GSp4.nilpotentStratum`: 𝒩_i, the rank-i nilpotent stratum, with representative N_i.
- `GSp4.MSpace`: ℳ(x, y; q) ⊂ GSp₄², with ℳ(1, 1; q) ≅ 𝒩(q).
- `GSp4.exp₂_conjugate`: For invertible g in GSp₄, exp₂(gNg⁻¹)=g exp₂(N)g⁻¹ and log₂(gUg⁻¹)=g log₂(U)g⁻¹. Both polynomial maps commute with coefficient maps in which 2 is invertible.

Worked checks:

- exp₂(E₁₄) = I + E₁₄ (E₁₄² = 0).
- exp₂(0) = I and log₂(I) = 0.
- For p≥5 and N₃ with N₃³≠0, exp₂(N₃)≠exp(N₃)=I+N₃+N₃²/2+N₃³/6. At p=3 the usual exponential formula is undefined, whereas exp₂ is still a bijection 𝒩→𝒰.
- m* = (m − m³)/3 ∈ ℤ for all m ∈ ℤ, e.g. m = 2 gives m* = −2.
- For q=2 one has q*=−2. In characteristic 3 the cubic coefficient is 1 and N₃³≠0, so the defining equation is ΦN₃Φ⁻¹=2N₃+N₃³, not merely 2N₃.

Prerequisites: [1.17](#t1-17); [2.5](#t2-5).

Sources: [BCGP21], §7.4.9, arXiv v3 p. 190; [BCGP21], Proposition 7.4.10, arXiv v3 p. 191; [BCGP21], §7.4.13, pp. 193–194.

<a id="t2-12"></a>

### 2.12 Level-raising local deformation problems 𝒟^mix, 𝒟^unr, 𝒟^ram

At an inert CM place, take polarized rank N≥2, p≥N, p∤(q²−1), even μ and multiplier η_v^με^{1−N}. The unramified residual restriction contains q^{−N},q^{−N+2} exactly once. Its mixed ring is smooth of relative dimension N²−1 over 𝒪[[x₀,x₁]]/(x₀x₁); both components have relative dimension N². Monodromy points from q^{−N} to q^{−N+2}, with x(s−q^{−N})=0 and tame exponent q². For odd μ, x₀(2+x+y)=0 forces x₀=0: mixed equals unramified, while the ramified subproblem is smooth of relative dimension N²−1.

API:

- `LevelRaising.mix`: Inertia preserves the canonical rank-two block M₀ and is trivial on M₁; the GL_N restriction is r♮ on G_{F_w}.
- `LevelRaising.unr`: Inertia is also trivial on M₀.
- `LevelRaising.ram`: Frobenius on M₀ has characteristic polynomial (T−q^{−N})(T−q^{−N+2}).
- `LevelRaising.localModel`: 𝒟^mix is formally smooth over Spf 𝒪⟦x₀, x₁⟧/(x₀x₁), with 𝒟^unr = {x₀ = 0} and 𝒟^ram = {x₁ = 0}.
- `LevelRaising.relation`: x(s − q^{−N}) = 0 in R^mix.
- `LevelRaising.unr_eq_minimal`: For the unramified polarized residual problem 𝒟^unr is the polarized unramified lifting condition; after restriction to G_{F_w} it is unramified GL_N inertia.

Worked checks:

- Relative dimensions: 𝒟^mix and 𝒟^unr have N² − 1 + 1 = N² as framed rings over 𝒪 on each component; 𝒟^ram is formally smooth of relative dimension N².
- For N = 2, Spec R^mix has exactly two irreducible components, R^unr and R^ram, meeting in R^mix/(x, s − q^{−2}).
- The direction v↦v+xv′ gives x(s′−q²s)=0; reversal gives x(s−q²s′)=0. Both vanish on the unramified component x=0.
- When p divides q²−1 the two residual eigenvalues coincide and separate eigenlines are not supplied by Hensel. The polarized nodal model requires p∤(q²−1).

Prerequisites: [2.6](#t2-6); [2.2](#t2-2); [2.5](#t2-5); [1.1](#t1-1); `GlobalGaloisDeformations:R04.3/local-deformation-problem`; `GlobalGaloisDeformations:G7/polarized-deformation-problem`; [1.17](#t1-17).

Sources: [LTXZZrigid], Definition 3.5.1, arXiv v1 p. 27; [LTXZZrigid], Proposition 3.5.2, arXiv v1 p. 27; [LTXZZ], §6.4, arXiv v3 pp. 116–117.

<a id="t2-13"></a>

### 2.13 Unrestricted lifting rings away from p are complete intersections

For any d and K/ℚ_ℓ, ℓ≠p, R□ is reduced, flat and a local complete intersection of pure relative dimension d²; R□/ϖ is equidimensional of dimension d². Each component gives a deformation problem; the smooth minimal quotient is one component. No p≥d restriction is needed for GL_d.

Prerequisites: [2.1](#t2-1); [2.8](#t2-8); [2.4](#t2-4); [1.4](#t1-4).

Sources: [LTXZZrigid], Proposition 3.4.12, arXiv v1 p. 25; [NT26], proof of Lemma 3.6, arXiv v2 p. 18; [Shotton], Theorem 2.5, arXiv v2 p. 7.

<a id="t2-14"></a>

### 2.14 Lifts away from p of reducible residual representations with prescribed determinant

For p≥3, global residual (χ̄,*;0,1) and geometric determinant μ=κ^{r−1}χ₀, r≥2 and χ₀ finite order, every place away from p has, after coefficient extension, a determinant-μ lift on a smooth component. The nonsplit cyclotomic case uses a Steinberg lift with determinant-compatible unramified twist.

Prerequisites: [2.8](#t2-8); [2.5](#t2-5); [1.10](#t1-10).

Sources: [FKP22], Lemma 7.2, first bullet, arXiv v5 pp. 33–34.

<a id="t2-15"></a>

### 2.15 Components for Ihara avoidance

For trivial rank-d residual data, q≡1 mod p and splitting coefficients, distinct finite inertia characters reducing to one give a geometrically irreducible ring of dimension d²+1. All character conditions share special-fibre equations. For trivial characters, components have that dimension and each special generic point has a unique generic generalisation. The Steinberg closure is a domain; the rank-two fixed-determinant comparison requires p>2.

Prerequisites: [2.5](#t2-5); [2.4](#t2-4); [2.9](#t2-9).

Sources: [TaylorII], §3, Proposition 3.1, p. 196; [Gee22], Proposition 3.37 and Theorem 3.38, p. 21; [NT26], proof of Theorem 5.9, arXiv v2 p. 45; [THORNE15], Proposition 3.15 and its proof, p. 18.

<a id="t2-16"></a>

### 2.16 Taylor–Wiles local conditions in rank n: the tangent dimension

For p>d, semisimple unramified residual data, a selected simple eigenvalue and q≡1 mod p, the Taylor–Wiles scalar-block condition has dim L−h⁰(ad⁰ρ̄)=1.

Prerequisites: [2.10](#t2-10); [2.1](#t2-1); `GlobalGaloisDeformations:R04.3/local-deformation-problem`.

Sources: [CG18], §8.5.1, published p. 408.

<a id="t2-17"></a>

### 2.17 GSp₄ lifts at Taylor–Wiles places

With four distinct residual Frobenius eigenvalues paired by similitude and q≡1 mod p, lifts have ordered inertia γ₁,γ₂,ψγ₂⁻¹,ψγ₁⁻¹. The fixed-similitude ring is smooth of relative dimension ten over 𝒪[Δ_v], Δ_v=(k_v×(p))²; the eigenvalue ordering is fixed.

Prerequisites: [1.17](#t1-17); [1.20](#t1-20); [2.10](#t2-10); ClassFieldTheory / layer 7 the absolute local artin map its normalizations and conductors.

Sources: [BCGP21], Lemma 7.4.4, arXiv v3 p. 189.

<a id="t2-18"></a>

### 2.18 Inertial types with monodromy and fixed-type rings

A full type away from p retains N and an inertia representation extendible to W_K. Its ring is the reduced flat closure of exact-type points. Finitely many closed type loci cover the generic fibre and may intersect. The finite-image p-adic potentially semistable inertia datum is a different type notion.

API:

- `InertialType`: An inertial type: an I_K-isomorphism class of Weil–Deligne representations restricted to I_K, N retained.
- `fixedTypeRing`: R^□_r̄(τ), the reduced 𝒪-flat closure quotient of exact-type points.
- `fixedTypeRing_points`: Every exact-type point lies on R^□_r̄(τ), and such points are dense in its generic fibre. Boundary points need not have exact type τ.
- `fixedTypeRing_union`: The generic fibre is covered by finitely many closed type-ring loci, which can intersect; this is not a disjoint union.
- `fixedTypeRing_n2`: For n=2, after imposing the same compatible determinant, this closure definition agrees with R08.2/inertial-type-quotient.
- `fixedTypeRing.unique`: The exact-type kernel intersection uniquely specifies the flat closure; precomposition with R□ detects equality of its ring maps.

Worked checks:

- Trivial and Steinberg types differ by N but their closures meet: take ρ(φ)=diag(q,1), ρ(t)=(1 pt;0 1), q≡1 mod p, and specialize t=0.
- For r̄ unramified and τ trivial with N = 0 the ring is the unramified lifting ring, formally smooth of relative dimension n² (R08.2/unramified-lifting-ring).
- Each nonzero R^□_r̄(τ) is equidimensional of dimension 1 + n².
- Incompatible reductions of τ|P_K and ρ̄|P_K, even after coefficient extension, give an empty exact-type locus and zero closure ring.

Prerequisites: [2.13](#t2-13); [2.9](#t2-9); [2.5](#t2-5); `ArithmeticGaloisRepresentations:R01.2/grothendieck-monodromy-and-the-weil-deligne-functor`.

Sources: [NT26], proof of Lemma 3.6, arXiv v2 p. 18; [Shotton], Definition 3.5 and Proposition 3.6, p. 12.

<a id="t2-19"></a>

### 2.19 Fixed-determinant rank-two rings away from p: complete intersection with smooth generic fibre

For p≥3 and conductor minimal among twists, the four ramified obstructed rank-two cases below give two group-algebra power-series rings and two hypersurfaces. The extension-of-1 case includes C(T)−T and has (p^a+1)/2 geometric components, p^a∥q−1. Retain the ramification and conductor hypotheses.

In the ramified conductor-minimal setting, require R_v to be a complete intersection with formally smooth R_v[1/p]. For the four exceptional cases its presentations refine as follows:

- In the diagonal and induced cases, R_v is a power-series algebra over 𝒪[Δ], where Δ is the maximal p-quotient of ℱ_v× or ℱ_{v²}× respectively.
- In the two ramified-extension cases, R_v≅𝒪[[x₁,x₂,x₃,x₄]]/(r) with r≠0.
- For the q≡1 extension of 1 by 1, take the trace coordinate T at T=2 and the relation C(T)−T, where C(t+t⁻¹)=t^q+t^{−q}. If p^a is the largest p-power dividing q−1, the geometric generic components are the unipotent T=2 component and the (p^a−1)/2 reciprocal pairs T=ζ+ζ⁻¹, ζ≠1, ζ^{p^a}=1. Thus the total is (p^a+1)/2. This p^a is distinct from the residue cardinality q.


Prerequisites: [2.4](#t2-4); [2.13](#t2-13); [1.18](#t1-18); [1.10](#t1-10); ClassFieldTheory / layer 5 local coefficients the brauer group the local invariant and duality.

Sources: [CG18], Lemma 4.11, published p. 364; [CG18], proof of Lemma 4.11, published p. 364; [CG18], footnote 5, published p. 365.

<a id="t2-20"></a>

### 2.20 Rigidity of a residual representation for (Σ_min, Σ_lr)

For polarized 𝒢_N data, p≥N and the fixed similitude, rigidity means every lift is minimal on Σ_min, the inert Frobenius pair occurs once on Σ_lr, regular Fontaine–Laffaille at p and unramified elsewhere. The disjoint away-from-p sets include all ramification in Σ_min; Σ_lr=∅ for odd N. Added level-raising places satisfy p∤(q²−1). For every lift to be unramified, exclude q=1 and adjoint Frobenius ratios q.

API:

- `IsRigidFor`: The predicate on r̄ given by the local conditions (1)–(4) at Σ_min, Σ_lr, the places above p and the rest.
- `IsRigidFor.minimal`: For v ∈ Σ_min every lift of r̄_v is minimally ramified.
- `IsRigidFor.levelRaising`: For v ∈ Σ_lr the residual hypothesis of R08.2/level-raising-local-problems holds.
- `IsRigidFor.fontaineLaffaille`: For v | p, r̄^♮_v is regular Fontaine–Laffaille crystalline (clause (3)), in the sense of L7/fontaine-laffaille-deformation-condition.
- `IsRigidFor.unramified`: At every finite place outside Σ_min ∪ Σ_lr and not above p, r̄_v is unramified (clause (4)).
- `IsRigidFor.mono`: Adding an inert level-raising place preserves rigidity if it is disjoint from the existing sets and satisfies the Frobenius-pair and q²−1 conditions.

Worked checks:

- Σ_min = Σ_lr = ∅: rigidity says r̄ is unramified away from p and regular Fontaine–Laffaille at p.
- If r̄^♮_v(φ_w) has the pair {‖v‖^{−N}, ‖v‖^{−N+2}} twice, condition (2) fails and 𝒟^mix is not defined at v.
- Adding to Σ_lr a place satisfying (2) preserves rigidity (used with 𝔭 in LTXZZ §6.4).
- An unramified r̄_v with every lift unramified satisfies (1).

Prerequisites: [2.3](#t2-3); [2.12](#t2-12); [2.13](#t2-13); [1.6](#t1-6).

Sources: [LTXZZ], the rigidity definition (published Definition 6.3.3, p. 277; arXiv v3 Definition 6.3.4).

<a id="t2-21"></a>

### 2.21 Unipotent lifts of a regular unipotent residual monodromy are minimally ramified

A single regular unipotent residual inertia block makes every unipotent lift minimal: its successive kernels are free direct summands reducing to the residual flag.

Prerequisites: [2.3](#t2-3); [2.15](#t2-15).

Sources: [CG20], Appendix §A.4(2)(a), published p. 888.

<a id="t2-22"></a>

### 2.22 GSp₄ Ihara-avoidance deformation rings

For p>2, ℓ≠p, trivial residual GSp₄, q≡1 mod p and unramified fixed similitude, distinct nontrivial inertia characters up to inverse give an irreducible scheme of integral dimension eleven with smooth generic fibre of dimension ten. Trivial characters give an equidimensional scheme of integral dimension eleven, characteristic-zero generic points and unique generic generalisation over each special generic point. Both have equal special-fibre equations; variable multiplier adds one variable.

Prerequisites: [2.11](#t2-11); [2.15](#t2-15); [1.22](#t1-22); [1.17](#t1-17).

Sources: [BCGP21], Proposition 7.4.7, arXiv v3 p. 189; [BCGP21], Proposition 7.4.21, arXiv v3 p. 197.

<a id="t2-23"></a>

### 2.23 The Taylor–Wiles block condition in rank n (including p = 2)

For semisimple unramified residual Frobenius, select an eigenvalue block A of multiplicity d₁, impose scalar inertia ψ on A and unramified complement B. The Hensel projector is coefficient-natural and ψ gives 𝒪[Δ_v]. This permits p=2. In rank two, odd p and q≡1 mod p, fixing det=ψ̃χ and twisting by ψ̃⁻¹/² recovers the fixed-determinant ring; an unramified determinant instead forces ψ=1.

API:

- `TaylorWilesBlock`: 𝒟^TW_v for a chosen eigenvalue α_v of multiplicity n₁.
- `TaylorWilesBlock.decomposition`: The lifted decomposition r = A_v ⊕ B_v.
- `TaylorWilesBlock.deltaAlgebra`: The canonical map 𝒪[Δ_v] → R^TW_v from ψ_v∘Art_{F_v}.
- `TaylorWilesBlock.isLocalDeformationProblem`: 𝒟^TW_v is a local deformation problem.
- `TaylorWilesBlock.rank2`: In rank two, odd p and q≡1 mod p, fix the unramified determinant part and twist by ψ̃⁻¹/² to recover the Taylor–Wiles ring; the Δ-structures differ by δ↦δ².
- `TaylorWilesBlock.decomposition_unique`: The Hensel idempotent separating the selected residual eigenvalue defines the block projector and scalar inertia character naturally under coefficient maps.

Worked checks:

- For distinct eigenvalues in rank two, the variable-determinant ring is 𝒪[Δ][[x,y,B,C]]. Fixing det=ψ̃χ gives 𝒪[Δ][[x,y,B]]; fixing unramified det gives 𝒪[[x,y,B]] and ψ=1.
- n₁ = n: lifts are ψ_v·(unramified) on inertia, the ring is formally smooth over 𝒪[Δ_v].
- p = 2: Δ_v = k(v)^×(2), the 2-part, e.g. q_v = 17 gives Δ_v ≅ ℤ/16.
- A nonscalar Jordan block fails residual semisimplicity; the lift condition does not require Frobenius to be scalar on the selected block.

Prerequisites: [2.1](#t2-1); [2.10](#t2-10); [2.16](#t2-16); `GlobalGaloisDeformations:R04.3/local-deformation-problem`; ClassFieldTheory / layer 7 the absolute local artin map its normalizations and conductors.

Sources: [BCGP25], §5.5, arXiv v1 p. 124.

<a id="t2-24"></a>

### 2.24 Fixed-type rings away from p in rank n and constancy of types on components

Nonzero full-type rings are flat reduced of dimension d²+1. Full type is constant between points on a common generic component that belong to no other component; this applies to pure points and their conductors. One finite extension of K makes all occurring inertia actions unipotent.

Prerequisites: [2.18](#t2-18); [2.13](#t2-13); [1.22](#t1-22).

Sources: [BCGP25], Lemma 5.6.2 and its proof, arXiv v1 p. 128; [NT26], proof of Lemma 3.6, arXiv v2 p. 18.

<a id="t2-25"></a>

### 2.25 Minimal GSp₄ conditions at the ramified primes of types U, P, H

At U_i require the prescribed split nilpotent orbit over the coefficient algebra, allowing compatible unit rescaling. At P require reduction-injective inertia; H forces rigidity. These coefficient-natural conditions are local deformation problems; U₃ is regular-unipotent minimality. Require p≥5 at U₃, p≥3 at U₁,U₂; generic rank does not specify Artinian orbit membership.

API:

- `GSp4.MinimalAt`: The minimal condition at x ∈ S(r̄) according to its type.
- `GSp4.MinimalAt.unipotent_rank`: At U_i impose the prescribed orbit over the Artinian ring via conjugacy or free kernel/image conditions for every power.
- `GSp4.MinimalAt.rigid`: At types P, H the reduction map is injective on r(I_x).
- `GSp4.MinimalAt.isLocalDeformationProblem`: Each condition is a local deformation problem.
- `GSp4.MinimalAt.U3_eq_unipotent`: At type U3 the condition equals the unipotent problem R^1 and the minimally ramified condition.
- `GSp4.MinimalAt.baseChange`: Coefficient maps transport the U_i conjugator and unit parameter and preserve the fixed prime-to-p P/H inertia lift.

Worked checks:

- Type U3: the minimal condition equals R^1 (single Jordan block, R08.2/regular-unipotent-minimally-ramified).
- Type H with x⁴ − 1 prime to p: r(I_x) ≅ r̄(I_x), a finite group of order prime to p, so the condition is formally smooth.
- A lift of N₁ with nonzero nilpotent square fails the U₁ orbit condition although its reduction still has rank one.
- At primes outside S(r̄) ∪ {p} the minimal condition is 'unramified'.

Prerequisites: [2.7](#t2-7); [2.11](#t2-11); [2.21](#t2-21); [2.8](#t2-8); [1.17](#t1-17).

Sources: [CG20], Definition 4.6 (3)–(4), published p. 815.

<a id="t2-26"></a>

### 2.26 The Steinberg lifting ring is a domain and equals the fixed-type ring

For trivial rank d and q≡1 mod p, the Steinberg closure is a domain of dimension d²+1. The natural surjection to the full special-type ring R□(τ_{Sp_d}) is an isomorphism. Integral monodromy analysis removes Taylor's p>d restriction.

Prerequisites: [2.5](#t2-5); [2.18](#t2-18); [2.24](#t2-24).

Sources: [NT26], proof of Lemma 3.8, arXiv v2 p. 20; [THORNE15], Proposition 3.17, p. 20.

<a id="t2-27"></a>

### 2.27 Breuil–Mézard cycles for central division algebras away from p

Let D/K be central division of degree d, ℓ≠p, and choose E defining all types and making both fibre components geometrically irreducible. Define cyc(σ)=Σ_{(τ,N)} dim Hom_{GL_d(𝒪_K)}(σ∨,π_{τ,N})[R□(τ,N)], in dimension d²+1; cyc_D uses Hom_{𝒪_D×}(σ∨,JL⁻¹π_{τ,N}), with JL⁻¹ zero outside essentially square-integrable representations. Then cyc_D=cyc∘JL_K. For p≠2 there is a unique special-cycle map in dimension d² satisfying red∘cyc_D=cyc̄_D∘r_p. Under p≠2 and even d, inflate an order-p character of the quadratic residue extension through N_{k_D/k′}; its type ring and Steinberg have isomorphic reduced special-fibre subschemes. Equal cycles do not assert reducedness of either original fibre.

Prerequisites: [2.18](#t2-18); [2.24](#t2-24); [2.15](#t2-15).

Sources: [NT26], proof of Lemma 3.6, arXiv v2 pp. 18–19; [DOTTO25], §6, case ℓ ≠ p and Theorem 6.3, pp. 243–245 (journal pages); [Shotton], Theorem 4.6, arXiv v2 p. 17 (with the abstract).

<a id="t2-28"></a>

### 2.28 Generic fibres of G-valued lifting rings away from p and minimally ramified lifts

For reductive, possibly disconnected G and fixed full abelianisation, the generic fibre is reduced, equidimensional of dimension dim G^der, with dense regular open and finitely many type loci. For GSp_{2d}, p>2d and Booher's splitting, square-root and smooth-centralizer assumptions give a smooth minimal component. A Steinberg lift at the specified trivial prime is smooth.

Prerequisites: [1.17](#t1-17); [1.22](#t1-22); [2.24](#t2-24).

Sources: [FKP22], §9, proof of Proposition 9.1, arXiv v5 p. 41; [FKP22], §2, arXiv v5 p. 9; [BOOHER19], Theorem 1.1, p. 2; Corollary 6.16, p. 30 (arXiv v1); [BellovinGee], §3.1 and Theorem 3.3.3, arXiv v3 pp. 29–30.

<a id="t2-29"></a>

### 2.29 Unipotent ramification and Ihara-avoidance rings at p = 2

At p=2 away from 2, one finite extension makes every lift unipotently ramified. With unramified regular semisimple residual Frobenius, choose an eigenbasis, then strictly diagonalize lifts into characters; a uniform extension makes them unramified. Trivial-residual character rings retain the Ihara dimension d²+1, distinct-character irreducibility and unique-generalisation statements.

Prerequisites: [2.24](#t2-24); [2.15](#t2-15); [2.17](#t2-17).

Sources: [BCGP25], Lemma 5.6.2, arXiv v1 p. 128; [BCGP25], Proposition 5.6.4, arXiv v1 p. 129.

<a id="t2-30"></a>

### 2.30 Local lifts at places of global function fields

Over a local function field of characteristic ℓ≠p, every residual GL_d representation has a p-adic lift. For p∤d the unique d-th root of a 1+ϖ𝒪-valued character permits determinant matching. The away-from-p generic-fibre analysis applies.

Prerequisites: [2.8](#t2-8); [2.1](#t2-1); [2.28](#t2-28).

Sources: [FKP22], §8, proof of Theorem 8.1, arXiv v5 p. 38; [FKP22], §2, arXiv v5 pp. 8–9.

## Layer 3: Hodge-type quotients and characteristic-zero geometry

Construct bounded semistability first, then fixed Hodge and inertia conditions. Characteristic-zero smoothness and integral flatness are separate conclusions. The ordinary component construction supplies the fixed-determinant comparison needed for the finite-flat component results.

<a id="t3-1"></a>

### 3.1 p-adic Hodge types and Galois types

A Hodge type specifies a filtration on K⊗E of rank d with labelled multiplicities m_{τ,i}, using contravariant D* and the explicit HT dictionary. A p-adic Galois type is finite-image inertia extendible to W_K. Define Δ(v)=Σ_τ(d²−Σ_i m_{τ,i}²)/2, equal to fd(d−1)/2 for regular type. Give equality and coefficient-transport APIs.

API:

- `HodgeType`: (D_E, Fil^• D_{E,K}) with jumps in [0, h].
- `GaloisType`: τ : I_K → GL_r(E) with open kernel.
- `IsOfType`: V_B is potentially semistable of type (τ, v).
- `HodgeType.adQuotDim`: dim_E ad D_{E,K}/Fil⁰ = Σ_σ (d² − Σ_j m_{σ,j}²)/2.
- `HodgeType.filteredIsom_iff`: Over splitting coefficients, filtered-isomorphism classes are determined by every labelled graded multiplicity.
- `GaloisType.conjugacy`: Conjugating the matrix representative preserves the inertia type and its lift condition.

Worked checks:

- Regular weights give [K : ℚ_p]·d(d − 1)/2 (for d = 2, K = ℚ_p: 1).
- (d² − Σ m_j²)/2 counts pairs of weights in different jumps; checked for d = 3 with multiplicities (2, 1): (9 − 5)/2 = 2.
- The restriction to I_K of the cyclotomic character has infinite image, so it is not a Galois type.

Prerequisites: `PadicHodgeTheory:R06.2/hodge-tate-weight-convention`; `PadicHodgeTheory:R06.3/potentially-semistable-dieudonne-module`; `PadicHodgeTheory:R06.3/weil-deligne-parameter`; `PadicHodgeTheory:R06.2/filtered-vector-spaces`.

Sources: [KisinPST], (2.6), p. 531; [KisinPST], (2.7), pp. 532–533.

<a id="t3-2"></a>

### 3.2 The semistable quotient with Hodge–Tate weights in [0, h]

For complete Noetherian A° with finite residue field and A=A°[1/p], the bounded semistable quotient represents the weight-[0,h] condition on all finite ℚ_p-algebras, including nonreduced ones. Construct the finite-projective filtered (φ,N)-module and period comparison. Finite height on G_{K∞} alone does not imply semistability of the G_K-action.

Prerequisites: [1.8](#t1-8); [1.2](#t1-2); `PadicHodgeTheory:R06.1/semistable-period-ring`; `PadicHodgeTheory:R06.2/dst-exact-tensor-fully-faithful`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`.

Sources: [KisinPST], Theorem (2.5.5) and its proof, pp. 530–531; Propositions (2.4.7), (2.5.4).

<a id="t3-3"></a>

### 3.3 Fixing the p-adic Hodge type selects components

In the bounded semistable quotient, fixed Hodge type is a union of connected components: projective filtration steps and graded pieces make ranks locally constant. Prove coefficient compatibility.

Prerequisites: [3.2](#t3-2); [3.1](#t3-1).

Sources: [KisinPST], Corollary (2.6.2) and Lemma (2.6.1), pp. 531–532.

<a id="t3-4"></a>

### 3.4 Potentially semistable deformation rings of fixed type

For finite-image τ and Hodge type v, construct the quotient of R□[1/p] with the potentially semistable finite-E-algebra point criterion; N=0 gives the crystalline variant. Its integral reduced p-torsion-free closure is R□_{τ,v}, possibly zero. Over an extension killing τ the locus is a union of bounded semistable components. Include Schur unframed variants.

Prerequisites: [3.3](#t3-3); [3.1](#t3-1); [1.1](#t1-1); [1.5](#t1-5); [1.10](#t1-10); `PadicHodgeTheory:R06.3/potentially-semistable-dieudonne-module`.

Sources: [KisinPST], Theorem (2.7.6) and its proof, p. 534; [KisinPST], Corollary (2.7.7), p. 534; [Gee22], Theorem 3.28, pp. 18–19.

<a id="t3-5"></a>

### 3.5 Potentially semistable loci in families over a complete local base

For any complete Noetherian local A° with finite residue field, define semistable, potentially semistable and crystalline quotients of A°[1/p] by their universal finite-E-algebra point conditions, compatibly with allowable coefficient maps.

Prerequisites: [1.8](#t1-8); [3.1](#t3-1); [3.3](#t3-3); `PadicHodgeTheory:R06.3/potentially-semistable-dieudonne-module`.

Sources: [KisinPST], (2.7.5), p. 534; [KisinPST], Theorem (2.5.5), p. 530.

<a id="t3-6"></a>

### 3.6 Deformation theory of filtered (φ, N)-modules with descent data

Over L₀⊗A, use finite-projective modules with invertible φ, nilpotent N, Nφ=pφN, commuting descent and stable projective filtrations. The obstruction complex uses 1−φ,N,pφ−1; H²=0 gives H¹-torsors of small-extension lifts. Forgetting filtration is smooth, with dense vanishing locus in a smooth family. Completed lifting-family comparison requires formal smoothness over this groupoid.

Prerequisites: `PadicHodgeTheory:R06.2/filtered-phi-n-modules-with-descent-data`; `PadicHodgeTheory:R06.2/weak-admissibility`; `PadicHodgeTheory:R06.3`; [3.4](#t3-4).

Sources: [KisinPST], (3.1.1), Proposition (3.1.2), Corollary (3.1.3), Lemma (3.1.5), Proposition (3.1.6), pp. 535–538; [KisinPST], Lemma (3.2.1), Proposition (3.3.1), pp. 538–540.

<a id="t3-7"></a>

### 3.7 Potentially semistable rings under change of coefficients

Transporting Hodge and inertia data through E→E′ commutes with the generic and reduced torsion-free integral quotients and Schur comparison. Components can split; geometric assertions require splitting coefficients.

Prerequisites: [3.4](#t3-4); [1.12](#t1-12); `PadicHodgeTheory:R06.2/coefficient-field-base-change`.

Sources: [KisinPST], (2.7.5), p. 534.

<a id="t3-8"></a>

### 3.8 Rings of fixed Weil–Deligne type cut out of pseudo-character deformation rings (R_{B,M})

For supercuspidal full WD parameter M, define R_{B,M} by the weight-two de Rham point-kernel intersection in the fixed-determinant block pseudocharacter ring, and R⁺ as its integral image. The reduced Jacobson ring is a finite product of the specified bounded-function PIDs on opens of ℙ¹; its trace gives a unique representation up to isomorphism. Full Frobenius data are needed; empty blocks give zero and special parameters require separate L-invariants.

API:

- `WDTypeRing`: R_{B,M} = R^{ps,δ_M}_B[1/p]/I_{B,M} and its integral model R^+_{B,M}.
- `WDTypeRing.points`: Maximal ideals containing I_{B,M} correspond to de Rham traces of weights {0,1}, full WD type M and determinant δ_Mε; the reverse implication uses the cited local Langlands theorem.
- `WDTypeRing.reduced`: R_{B,M} is reduced and Jacobson.
- `WDTypeRing.pid`: R_{B,M} is a finite product of principal ideal domains (bounded analytic functions on an open of ℙ¹).
- `WDTypeRing.universalRep`: The representation ρ_{B,M} with Tr ρ_{B,M} = the universal pseudo-character.
- `WDTypeRing.integralImage`: R⁺ is the integral image: its kernel is the preimage of I under localization and R⁺[1/p]=R_{B,M}.

Worked checks:

- Every maximal ideal x of R_{B,M} gives ρ_x de Rham of weights {0, 1} with WD(ρ_x) ≅ M (Frobenius included).
- A supercuspidal M and a distinct unramified quadratic twist have equal determinant and inertia but different full WD types.
- If no de Rham representation of type M has reduction in B, I_{B,M} is the unit ideal and R_{B,M} = 0.
- Tr ∘ ρ_{B,M} equals the image of the universal pseudo-character of R^{ps,δ_M}_B.

Prerequisites: [3.5](#t3-5); [3.1](#t3-1); `GlobalGaloisDeformations:R04.1/lifting-functor`; `PadicLocalLanglandsForGL2Qp:R30.5`.

Sources: [CDN23], §5.2, arXiv p. 66; [CDN23], Théorème 5.11, arXiv p. 66.

<a id="t3-9"></a>

### 3.9 Dimension and generic smoothness of potentially semistable rings

Nonzero framed semistable generic fibres have dimension d²+Δ(v) and dense smooth open; Schur unframed dimension is 1+Δ(v), integral framed dimension 1+d²+Δ(v). A compatible nonempty fixed determinant lowers generic dimension by one through rational twisting, including p|d. Component intersections may be singular.

Prerequisites: [3.4](#t3-4); [3.6](#t3-6); [3.1](#t3-1); [1.5](#t1-5); `DeformationAndDerivedPatchingAlgebra:R03.3`; [1.24](#t1-24).

Sources: [KisinPST], Theorem (3.3.4) and its proof, pp. 540–541; [KisinPST], Introduction, p. 514, footnote 1.

<a id="t3-10"></a>

### 3.10 Potentially crystalline rings are generically smooth

The crystalline generic fibre is everywhere formally smooth of dimension d²+Δ(v). For unramified K, trivial τ, regular weights of width ≤p−2 and Fontaine–Laffaille residual data, the nonempty compatible fixed-determinant integral ring is smooth of relative dimension d²−1+fd(d−1)/2.

Prerequisites: [3.4](#t3-4); [3.6](#t3-6); [3.9](#t3-9); [1.6](#t1-6); [1.13](#t1-13).

Sources: [KisinPST], Theorem (3.3.8) and its proof, p. 541; [Gee22], Theorem 3.28, pp. 18–19.

<a id="t3-11"></a>

### 3.11 G-valued potentially semistable lifting rings (Balaji, Bellovin–Gee)

For possibly disconnected reductive G/𝒪, prescribed G⁰-inertia conjugacy class and Hodge cocharacter v give a unique reduced flat local-complete-intersection quotient with dense regular open. Generic dimension is dim G+Σ_τdim(G/P_{v,τ}), or dim G+f dim Fl_G for regular v. A nonempty compatible fixed full abelianisation replaces dim G by dim G^der.

Prerequisites: [1.17](#t1-17); [3.5](#t3-5); [3.4](#t3-4); [3.9](#t3-9).

Sources: [FKP22], Appendix B, arXiv v5 pp. 52–53; [BellovinGee], §3.2 and Theorem 3.3.3 (= Theorem A), arXiv v3 pp. 29–30.

<a id="t3-12"></a>

### 3.12 Breuil–Conrad–Diamond–Taylor type rings as Kisin rings

For Schur rank-two data, weak potentially Barsotti–Tate types define the intersection of weight-two characteristic-zero point kernels with determinant ε times a prime-to-p Teichmüller character. Compare inertia τ, extended Weil τ′ and the Kisin quotient, using the weight-two theorem that weak type is actual type. N≠0 Tate curves are excluded.

Prerequisites: [3.4](#t3-4); [1.5](#t1-5); `PadicHodgeTheory:R06.4/barsotti-tate-crystalline-criterion`; [3.10](#t3-10).

Sources: [BCDT01], §1.1, p. 851; author manuscript pp.7–8 (§1.1); [BCDT01], Conjecture 1.1.1, p. 851; author manuscript pp.7–8 (§1.1); [KisinPST], Introduction, p. 513.

<a id="t3-13"></a>

### 3.13 Semistable-ordinary quotients of semistable lifting rings

Start with the semistable and crystalline fixed-Hodge-type quotients. In a finite local E-algebra, if a semistable lift reduces to a semistable-ordinary representation of weight λ, it is itself semistable-ordinary. Thus the ordinary condition selects an open and closed union of components of the semistable generic fibre, defining a unique flat reduced quotient R^{△,λ}. It is the ordinary component quotient inside that semistable space, not a closure in the unrestricted ring of an arbitrary ordinary point set.

Prerequisites: [1.7](#t1-7); [3.4](#t3-4); [3.10](#t3-10); [3.11](#t3-11); [1.9](#t1-9).

Sources: [CN23], Lemma 3.3.2, arXiv v3 p. 51; [CN23], Theorem 3.3.3, arXiv v3 p. 52.

<a id="t3-14"></a>

### 3.14 Fixed-determinant crystalline and ordinary rings as power-series quotients

For p∤d and dominant λ, the determinant weight is −Σ_i(λ_{τ,i}+d−i). A compatible ψ gives reduced flat crystalline or semistable-ordinary quotients with the finite-E-algebra point criterion. Scalar twisting with a section identifies the unfixed ring with R^ψ[[X]]; the ordinary variant uses the semistable ordinary component quotient.

Prerequisites: [3.4](#t3-4); [1.10](#t1-10); [3.13](#t3-13).

Sources: [CN23], Lemma 3.3.6, arXiv v3 pp. 52–53.

## Layer 4: Finite-flat models and Barsotti–Tate components

The projective space of finite-flat models resolves a lifting condition. Its closed model fibre records multiple models of one representation; its uniformizer fibre carries the local-model singularity theorem. Use this distinction throughout the component comparison.

Throughout this layer K/ℚ_p is finite, e=e(K/ℚ_p), K₀ is its maximal unramified subfield, p>2, the residual module is finite-flat, and the model lattice has its fixed generic-fibre identification. Rank-two ordinary/nonordinary comparisons use v_ψ=1.

<a id="t4-1"></a>

### 4.1 Flat deformations and the flat deformation ring

For p>2 and finite-flat residual data, impose finite flatness on every Artinian quotient of a lift, obtaining framed and Schur unframed quotients. Integral points are Tate modules of p-divisible groups from compatible models. After inverting p compare with the crystalline weight-{0,1} locus.

API:

- `flatLiftingRing`: R^{fl,□}, the quotient of R^□ classifying flat lifts.
- `flatLiftingRing_points`: An 𝒪_E-point is flat iff it is the Tate module of a p-divisible group.
- `flatDeformationRing`: R^fl when End V_𝔽 = 𝔽.
- `flatLiftingRing.universal`: Hom_cont,𝒪(R^{fl,□},A) identifies naturally with finite-flat framed A-lifts; integral points satisfy the p-divisible-group criterion.

Worked checks:

- 𝔽(1) ⊕ 𝔽 is finite flat.
- 𝒪_E-points of R^{fl,□} are Tate modules of p-divisible groups.
- ω² over ℚ_p (p > 3) has no finite flat model.

Prerequisites: [1.1](#t1-1); [1.5](#t1-5); `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`.

Sources: [KisinFlat], (2.1.1), p. 16.

<a id="t4-2"></a>

### 4.2 Savitt's weight-two deformation rings of tame type

For odd p, Schur rank-two data and compatible weight-two determinant, Savitt's tame classification gives the residual-character cases below: principal-series rings 𝒪[[Y]] or 𝒪[[X₁,X₂]]/(X₁X₂−pu); niveau-two rings 𝒪[[B]] or zero. Retain peu-ramification endpoints and coefficient extensions. The nodal special fibre has two components and multiplicity two; its generic fibre is smooth.

The residual-character classification is part of the target, with ω and ω₂ the level-one and level-two fundamental characters of ℚ_p:

- For τ=ω̃^i⊕ω̃^j, i≠j modulo p−1, the allowed reducible residual inertia is an extension with ordered characters ω^{1+i},ω^j, or with i,j exchanged. Each corresponding allowed reducible case gives 𝒪[[Y]]. The irreducible case has inertia ω₂^a⊕ω₂^{pa}, a=1+{j−i}+(p+1)i, and gives the nodal ring above. Enlarge E to contain ℚ_{p²} and the residue field to contain a square root of the residual Frobenius determinant.
- For τ=ω̃₂^m⊕ω̃₂^{pm}, write m=i+(p+1)j with 1≤i≤p. The reducible cases are the two orders of ω^{i+j},ω^{1+j}, with the peu-ramification requirement at i=2 and i=p−1. The other allowable inertia pairs are ω₂^{p+m}⊕ω₂^{1+pm} and ω₂^{1+m}⊕ω₂^{p(1+m)}. At i=1 or i=p these degenerate to niveau-one cases. The ring for every allowed case is 𝒪[[B]], and outside this list it is zero.


Prerequisites: [3.4](#t3-4); [3.1](#t3-1); [1.10](#t1-10); `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`.

Sources: [Savitt], Theorems 6.22–6.24, p. 42 (arXiv v3).

<a id="t4-3"></a>

### 4.3 Finite cocycles via Kummer theory over F^nr (KW II Lemma 3.7)

For unramified F_v/ℚ_p and complete Noetherian B over 𝒪[[T]], take Ξ=χ₁η₁η₂⁻¹, unramified η_i, and χ₁=χ_p^{k−1} or χ_pω^{k−2}, 2≤k≤p. At k=2 use the inertia Kummer valuation kernel; at k>2 finite cocycles are all Z¹. This module is B-free of rank 1+f and commutes with tensor base change.

Prerequisites: [1.4](#t1-4); ProfiniteCohomology / layer 9 the galois interface hilbert 90 and kummer theory; ClassFieldTheory / layer 5 local coefficients the brauer group the local invariant and duality.

Sources: [KW209], §3.2.5, Lemma 3.7, author copy pp. 25–26; [KW209], §3.2.5, the definition of finite cocycles, p. 25.

<a id="t4-4"></a>

### 4.4 Normalising a vector over 𝒪[T] inside 𝒪⟦T⟧ (KW II Lemma 3.8)

After a completion automorphism, the KW free 𝒪[[T]]-module algebraizes to a free 𝒪[T]-module at the chosen point, giving the cocycle torsor and projective-line parameter. Before Weierstrass preparation/division, remove the common ϖ-power to obtain nonzero residue series.

Prerequisites: `PowerSeries.exists_isWeierstrassFactorization` (Mathlib); `PowerSeries.isWeierstrassDivision_weierstrassDiv_weierstrassMod` (Mathlib).

Sources: [KW209], Lemma 3.8, author copy p. 30; [KW209], proof of Lemma 3.8, p. 30.

<a id="t4-5"></a>

### 4.5 The moduli of finite flat models

Height-one Kisin lattices with generic-fibre identification have a projective model scheme over the lifting family. Its closed fibre parametrizes models of the fixed residual representation, using the rank-general bounded-height construction. When K contains ζ_p, a generic fibre can have both multiplicative and étale models.

API:

- `finiteFlatModels`: 𝒢ℛ_{V_𝔽,ξ}, the projective R-scheme of E-height ≤ 1 lattices.
- `finiteFlatModels_toFlat`: Θ : 𝒢ℛ_{V_𝔽} → Spec R^fl, projective.
- `finiteFlatModels_closedFibre`: 𝒢ℛ_{V_𝔽,0}(𝔽′) ≃ finite flat models of V_𝔽 ⊗ 𝔽′.
- `finiteFlatModels.points`: B-points classify height-one projective lattices in M(ξ)_B with their generic-fibre identification; the universal lattice pulls back naturally.

Worked checks:

- K = ℚ_p, V_𝔽 irreducible: one model.
- Closed-fibre points are finite flat models.
- Over ℚ_p(ζ_p), μ_p and ℤ/p are two models of one generic fibre.

Prerequisites: [1.8](#t1-8); [1.2](#t1-2); [4.1](#t4-1); `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`.

Sources: [KisinFlat], Corollaries (2.1.11) and (2.1.13), p. 21.

<a id="t4-6"></a>

### 4.6 The generic fibre of the flat deformation ring

The crystalline weight-{0,1} flat generic fibre is smooth, of framed dimension d²+Σ_ψ(d−v_ψ)v_ψ and Schur unframed dimension 1+Σ_ψ(d−v_ψ)v_ψ. Rank two with v_ψ=1 gives 4+f and 1+f. Integral smoothness and normality need not hold.

Prerequisites: [4.1](#t4-1); [3.10](#t3-10); `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`.

Sources: [KisinFlat], Proposition (2.3.8) and Corollary (2.3.11), pp. 32–33.

<a id="t4-7"></a>

### 4.7 Unique models in small ramification

For e<p−1 the model is unique and the projective model map is an integral isomorphism onto the flat space. At e=p−1 uniqueness can fail; the strict range contains no p=2 case.

Prerequisites: [4.5](#t4-5); `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`.

Sources: [KisinFlat], Proposition (2.1.14), p. 22.

<a id="t4-8"></a>

### 4.8 Local structure of the resolution

Pappas–Rapoport comparison gives a normal Cohen–Macaulay resolution and reduced normal uniformizer fibre with rational singularities. Stratum closure is the dual-partition Jordan inequality at each embedding. For each embedding σ of K₀, require |v_ψ−v_ψ′|≤1 for every pair extending σ; if also all v_ψ∈{0,1} or e≤2, naive=flat. The closed-point model fibre has separate geometry.

Prerequisites: [4.5](#t4-5).

Sources: [KisinFlat], Proposition (2.2.2), Corollary (2.2.8) and Proposition (2.4.6), pp. 23–35.

<a id="t4-9"></a>

### 4.9 Kisin's resolution of the flat deformation ring

The flat closure of the type-v height-one model scheme maps projectively to Spec R^v and is an isomorphism after inverting p. Local-model comparison requires the lifting family to be formally smooth over the flat groupoid. For rank two, v_ψ=1, naive and flat model conditions coincide.

API:

- `flatHodgeTypeQuotient`: R^v, the Hodge-type-v part of the flat ring.
- `flatResolution`: 𝒢ℛ^{v,loc} with Θ^v : 𝒢ℛ^{v,loc} → Spec R^v projective.
- `flatResolution_generic_iso`: Θ^v[1/p] is an isomorphism.
- `flatResolution.points`: B-points classify model lattices with the labelled determinant/rank condition v, naturally under base change.

Worked checks:

- e < p − 1: Θ^v is an isomorphism integrally.
- Θ^v is an isomorphism after inverting p.
- Θ^v has positive-dimensional closed fibre in general.

Prerequisites: [4.5](#t4-5); [4.6](#t4-6); [4.8](#t4-8); [3.3](#t3-3).

Sources: [KisinFlat], (2.4.1)–(2.4.3) and Proposition (2.4.8), pp. 34–37.

<a id="t4-10"></a>

### 4.10 Connected components through the special fibre

The projective resolution, generic-fibre isomorphism and reduced uniformizer fibre give a bijection between generic deformation connected components and connected components of the closed-point model fibre, using properness, formal functions and algebraization.

Prerequisites: [4.9](#t4-9); [4.8](#t4-8); `AdicSpacesPartII:F0/grothendieck-algebraization`; `AdicSpacesPartII:F0/theorem-on-formal-functions`.

Sources: [KisinFlat], Corollary (2.4.10), pp. 37–38.

<a id="t4-11"></a>

### 4.11 The ordinary type of a component

Maximal multiplicative rank d_m and maximal étale quotient rank d_et commute with coefficient extension and duality and are constant on closed model components. Rationally they detect unramified subrepresentations of V(−1) and unramified quotients of V. No general connectedness assertion for each pair is made.

Prerequisites: [4.9](#t4-9); [4.10](#t4-10); `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`.

Sources: [KisinFlat], Proposition (2.4.14), (2.4.15) and Conjecture (2.4.16), pp. 38–41.

<a id="t4-12"></a>

### 4.12 Connectedness of the non-ordinary locus in rank two

For rank two, v_ψ=1 and K₀=ℚ_p, the nonordinary closed model locus is connected. Fundamental characters belong to K; ramification prevents identifying them with the ℚ_p cyclotomic character.

Prerequisites: [4.11](#t4-11); [4.10](#t4-10); [4.5](#t4-5).

Sources: [KisinFlat], Lemmas (2.5.1), (2.5.3), (2.5.5) and Proposition (2.5.6), pp. 41–48.

<a id="t4-13"></a>

### 4.13 The ordinary locus in rank two

For v_ψ=1, a nonempty ordinary rank-two closed locus is one point unless residual data are two unramified characters: distinct characters give two points, equal ones ℙ¹, with generic-fibre framing retained. Trivial data over K⊃ζ_p exhibit ℙ¹; over ℚ_p, odd p, they have no prescribed {0,1} lift.

Prerequisites: [4.11](#t4-11); [4.5](#t4-5); `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`.

Sources: [KisinFlat], Proposition (2.5.15), pp. 48–49.

<a id="t4-14"></a>

### 4.14 Components of rank-two Barsotti–Tate deformation rings

The v_ψ=1 rank-two BT ring is flat of relative dimension 4+f and generically smooth. Ordinary status is component-constant. For K₀=ℚ_p nonordinary points are connected; ordinary components are distinguished by the residual cyclotomic-line character. At e=p−1 the trivial-residual ℙ¹ gives one ordinary component; larger e can permit both statuses.

Prerequisites: [4.6](#t4-6); [4.10](#t4-10); [4.11](#t4-11); [4.12](#t4-12); [4.13](#t4-13); [1.5](#t1-5).

Sources: [KisinFlat], Corollary (2.5.16), p. 49; [CN23], Lemma 5.3.4, arXiv v3 p. 77.

<a id="t4-15"></a>

### 4.15 Unique generalisation of generic points for Barsotti–Tate rings

For odd p, determinant ε⁻¹ and BT weights {0,−1} here, each uniformizer-fibre generic point has a unique generic generalisation. For trivial residual data and local residue field ≠ℱ_p, the nonzero ring has exactly ordinary and nonordinary components. This uses potentially BT generic reducedness from the Emerton–Gee interface.

Prerequisites: [4.14](#t4-14); [4.6](#t4-6); [3.14](#t3-14).

Sources: [CN23], Lemma 5.3.3, arXiv v3 p. 76; [CN23], Lemma 5.3.4, arXiv v3 p. 77.

## Layer 5: Dyadic and endpoint-weight conditions

At p=2, connected modules and determinant normalization require their own arguments. The endpoint-weight branches also retain the irreducible and ordinarity hypotheses of their classification theorems. The comparisons refer to the same local rings built above.

<a id="t5-1"></a>

### 5.1 Deformation groupoids of connected Kisin modules with coefficients

On Kisin's augmented coefficient category, deform M_ℱ=(𝒪_{ℰ^ur}⊗V_ℱ(−1))^{G_{K∞}} by coefficient Kisin modules with fixed étale identification and compatible isomorphisms. Construct the connected subgroupoid and forgetful map to étale φ-deformations, importing the integral categories and dyadic connectedness criterion from R07.4.

API:

- `kisinGroupoid`: D_{𝔖,M_𝔽}: over (A, I), pairs (𝔐_A, ι) with 𝔐_A ∈ R07.4's (Mod/𝔖)_A and ι : 𝒪_ℰ ⊗_𝔖 𝔐_A ⊗_A A/I ≅ M_𝔽 ⊗_𝔽 A/I; morphisms are isomorphisms compatible with ι.
- `kisinGroupoid.connected`: D^c_{𝔖,M_𝔽} ⊆ D_{𝔖,M_𝔽}: the full subgroupoid of objects connected in R07.4's sense.
- `kisinGroupoid_toPhiModule`: 𝔐_A ↦ 𝒪_ℰ ⊗ 𝔐_A, a morphism of groupoids D_{𝔖,M_𝔽} → D_{M_𝔽} (Lemma 2.1.7).
- `kisinGroupoid.baseChange`: Admissible coefficient maps tensor the module and transport its identification ι, preserving connectedness and the canonical identity/composition laws.
- `kisinGroupoid.connected_iff_etalePart`: At p=2, D^c means zero maximal étale quotient. At p>2 the finite-flat equivalence uses all height-one objects.

Worked checks:

- Rank one with φ(e) = E(u)e over 𝔽: the object is étale (R07.4) and lies in D_{𝔖,M_𝔽} but not in D^c_{𝔖,M_𝔽}.
- Rank one with φ(e) = e: multiplicative, hence connected, so it lies in D^c_{𝔖,M_𝔽}.
- φ(e)=pE(u)/E(0)e is étale since p/E(0) is a unit, so it is outside D^c. Its φ-invariants have character χ⁻¹; the prescribed (1)-twist realizes the trivial étale group.
- At p=2 an étale rank-one module is outside D^c but has a finite-flat étale model.

Prerequisites: [4.5](#t4-5); [1.2](#t1-2); [1.1](#t1-1); `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/kisin-modules-with-coefficients`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/etale-phi-modules-with-coefficients`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/dyadic-classification`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`.

Sources: [Kisin2adic], §2.1, (2.1.1)–(2.1.7), pp. 19–21 (DVI).

<a id="t5-2"></a>

### 5.2 Ordinary deformation rings of rank two at p = 2

Unit-class Kummer H¹_f is right exact on p-nilpotent modules. Cyclotomic-determinant ordinary objects have a stable cyclotomic line and extension in H¹_f. Their projective incidence map is a generic closed embedding, smooth for smooth flat families; its image has points (χη,*;0,η⁻¹), η unramified, and fixed-ψ subcharacter χψη. Generic dimension is 3+f; the domain exception is the specified split pair of distinct residual characters.

Prerequisites: [1.10](#t1-10); [1.1](#t1-1); [4.11](#t4-11); [4.3](#t4-3).

Sources: [Kisin2adic], §2.4, (2.4.1)–(2.4.6), pp. 30–33 (DVI).

<a id="t5-3"></a>

### 5.3 Kisin's rings away from 2 and at ∞ against R08.1–R08.2

Compare with existing rings: away-from-p fixed-character Steinberg generic dimension three, unramified fixed-determinant relative dimension three, unrestricted generic dimension three and tangent dimension 3+h². The dyadic odd-real equations are X²+2X+YZ and X²+2X+YZ+Z, at identity and nonidentity residual involutions.

Prerequisites: [2.5](#t2-5); [2.2](#t2-2); [2.4](#t2-4); [1.14](#t1-14).

Sources: [Kisin2adic], §2.5, Propositions 2.5.2–2.5.6, pp. 33–35 (DVI).

<a id="t5-4"></a>

### 5.4 Crystalline lifts of weight k ≤ p are ordinary when the residual representation is

For unramified F/ℚ_p, ordinary residual rank two and weights {0,k−1}, 2≤k≤p, every crystalline lift is ordinary. The endpoint k=p requires the R06.4 ordinarity criterion and R07.4 endpoint classification beyond the fully faithful small-weight range.

Prerequisites: `PadicHodgeTheory:R06.4/weight-p-endpoint-branch`; `PadicHodgeTheory:R06.4/two-dimensional-ordinarity-criterion`; `PadicHodgeTheory:R06.4/ordinary-representation`.

Sources: [KW209], Lemma 3.5 (i) and its proof, author copy p. 22; [KW209], proof of Lemma 3.5, p. 22.

<a id="t5-5"></a>

### 5.5 Crystalline lifts of weight p + 1: ordinarity and formal smoothness

For odd p, F=ℚ_p and Serre weight p+1, Berger–Li–Zhu gives ordinary crystalline lifts and a fixed-determinant framed ring 𝒪[[X₁,…,X₄]]. Its stable-line character map is not smooth. For general unramified F, only the separate ordinary ring calculation gives relative dimension 3+f.

Prerequisites: [4.3](#t4-3); `PadicHodgeTheory:R06.4/weight-p-plus-one-branch`; `PadicHodgeTheory:R06.4`; [1.10](#t1-10); ClassFieldTheory / layer 5 local coefficients the brauer group the local invariant and duality.

Sources: [KW209], §3.2.7, author copy p. 31; [KW209], §3.2.7, p. 31; [KW209], Remark after §3.2.7, p. 32.

<a id="t5-6"></a>

### 5.6 Semistable weight-two lifts at p: the resolution and the dyadic homothety case

For unramified F_v and residual (γ̄χ̄_p,*;0,γ̄), choose unramified γ with γ²χ_p equal to the determinant. The stable-line resolution is a rank-(2+f) cocycle torsor over the relevant ℙ¹ completion, and an isomorphism unless p=2 with residual homotheties. In that case complete along all special ℙ¹.

Prerequisites: [4.3](#t4-3); [1.10](#t1-10); `AlgebraicModuliForArithmeticGeometry:R09.1`.

Sources: [KW209], §3.2.6, author copy p. 30; [KW209], §3.2.6, p. 30.

<a id="t5-7"></a>

### 5.7 Minimal lifts in the dihedral and exceptional cases (p = 2 and residue characteristic 2)

For noncyclic projective inertia whose order is divisible by p, retain the two exceptional minimal-lift constructions. If its wild centre is cyclic, p=2 and the projective image is dihedral of order 2d with d odd and local residue prime dividing d: induce a Teichmüller lift of the ramified quadratic character datum corrected by the specified ramified quadratic character δ, then choose an unramified determinant twist. The inertial restriction is independent of δ and has Teichmüller determinant and the residual conductor. With noncyclic centre, local residue characteristic two and p=3, use the A₄/S₄ projective lift to PGL₂(ℤ₃). Define minimality by inertia rigidity relative to the resulting lift ρ₀. Naively inducing without δ gives the wrong inertial determinant in the dihedral case.

API:

- `DyadicMinimal.lift`: The lift ρ₀ = unramified twist of Ind(γ̂δ) in case (a), or the S₄-lift in case (b).
- `DyadicMinimal.restrict_inertia`: ρ₀|I_v is independent of δ (case (a)).
- `DyadicMinimal.det_inertia`: det ρ₀|I_v is the Teichmüller lift of det ρ̄_v|I_v.
- `DyadicMinimal.conductor`: a(ρ₀) = a(ρ̄_v).
- `DyadicMinimal.problem`: Minimal lifts: the inertia-rigid problem attached to ρ₀ (GlobalGaloisDeformations R04.4).

Worked checks:

- For ρ̄_v = Ind(γ) with γ of odd order divisible by q (for example of order 3^a when q = 3; here p = 2) on a ramified quadratic L, det ρ₀|I_v = Teichmüller(det ρ̄_v|I_v).
- The naive lift Ind(γ̂) without δ has det|I_v = ε_L·(γ̂∘t), which differs from the Teichmüller lift of det ρ̄|I_v by the ramified ε_L; δ corrects it.
- q = 2, p = 3, G ≅ A₄: ρ₀ has projective image S₄ ⊂ PGL₂(ℤ₃) or its subgroup A₄.
- Prime-to-p inertia has a unique rigid lift up to conjugacy; extending to G_K involves an unramified twist and gives relative dimension three.

Prerequisites: [2.3](#t2-3); `GlobalGaloisDeformations:R04.4/inertia-rigid-deformations`; [1.10](#t1-10).

Sources: [KW209], §3.3.1, author copy p. 33; [KW109], §5, the definition of minimal lifts, p. 8.

<a id="t5-8"></a>

### 5.8 Étale quotients, multiplicative parts and connectedness

Maximal étale quotient and multiplicative subobject, including its Kisin-module quotient, commute with admissible coefficient changes. Zero étale quotient characterizes the open-and-closed connected subgroupoid. For p>2 the full finite-flat equivalence includes nonconnected objects.

Prerequisites: [5.1](#t5-1).

Sources: [Kisin2adic], §2.1, Lemmas 2.1.8–2.1.9 and Proposition 2.1.10, p. 21 (DVI).

<a id="t5-9"></a>

### 5.9 Twists of semistable deformations away from p

Away from p and residual (γ̄χ̄_p,*;0,γ̄), fix γ Teichmüller on inertia and γ²χ_p equal to the determinant. The extension resolution has cocycle rank two: finite A give |Z¹(A(χ_p))|=|A|². Ramified data preserve conductor; p=2 includes projectively cyclic order-two inertia.

Prerequisites: [5.6](#t5-6); [4.3](#t4-3); ClassFieldTheory / layer 5 local coefficients the brauer group the local invariant and duality.

Sources: [KW209], §3.3.4, author copy pp. 36–37.

<a id="t5-10"></a>

### 5.10 Moduli of connected finite flat models

Over each complete local deformation family, the Kisin-to-étale forgetful map is relatively represented by a projective scheme and is a generic-fibre closed immersion. Connected models form an open-and-closed subscheme.

Prerequisites: [5.8](#t5-8); [1.8](#t1-8).

Sources: [Kisin2adic], §2.1, Proposition 2.1.12, p. 22 (DVI).

<a id="t5-11"></a>

### 5.11 Rank-two Kisin modules of type v and their determinant

The rank-two maximal-isotropic condition modulo E(u) forces determinant pE(u)/E(0) times a unit. Connected residual type-v modules have connected deformations without multiplicative part. Realization determinant is χ on inertia, and on all G_K iff the determinant unit has trivial reduction in W(k)⊗A, equivalently a basis gives pE(u)/E(0).

Prerequisites: [5.1](#t5-1); [5.8](#t5-8); [4.9](#t4-9).

Sources: [Kisin2adic], §2.3, (2.3.1) and Lemmas 2.3.2–2.3.4, pp. 25–27 (DVI).

<a id="t5-12"></a>

### 5.12 Flat connected deformation rings at p = 2

Finite-flat and flat-connected Galois subgroupoids are relatively closed representable. For a flat family, its connected quotient is open in the flat generic fibre. Formal smoothness over the connected groupoid gives smooth generic fibre and identifies the connected Kisin model map after inverting p.

Prerequisites: [5.10](#t5-10); [4.1](#t4-1); [4.6](#t4-6); `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`.

Sources: [Kisin2adic], §2.2, (2.2.1)–(2.2.7), pp. 22–24 (DVI).

<a id="t5-13"></a>

### 5.13 Components of 2-adic Barsotti–Tate deformation rings

For a smooth flat-connected rank-two family of cyclotomic determinant, Deligne–Pappas comparison gives normal local-complete-intersection type-v models with geometrically reduced special fibre and smooth generic fibre. The closed model and generic deformation fibres are geometrically connected if K₀=ℚ_p or residual action is trivial. Fixed unramified ψχ gives framed generic dimension 3+f, including p=2 by rational twisting.

Prerequisites: [5.11](#t5-11); [5.12](#t5-12); [4.8](#t4-8); [4.14](#t4-14); [1.10](#t1-10); [1.24](#t1-24).

Sources: [Kisin2adic], §2.3, (2.3.5)–(2.3.13), pp. 27–30 (DVI).

<a id="t5-14"></a>

### 5.14 Endpoint-weight local rings for KW I Theorem 4.1

KW I Theorem 4.1 uses dyadic crystalline/semistable weight two, odd-p weights 2≤k≤p+1 with separate small-range and endpoint branches, and tame potentially semistable weight-two types. These framed fixed-determinant rings over ℚ_p have relative dimension four and regular generic fibre. The nonordinary weight-(p+1) branch for irreducible Serre-weight-two data needs Kisin's geometric modularity input.

Prerequisites: [5.12](#t5-12); [5.13](#t5-13); [5.6](#t5-6); [5.4](#t5-4); [5.5](#t5-5); [3.4](#t3-4); [4.2](#t4-2); [5.2](#t5-2).

Sources: [KW109], Theorem 4.1, author copy p. 7; [KW109], Theorem 4.1 (1), p. 7.

## Layer 6: Ordinary geometry, crystalline connections and GL₃ charts

Construct ordinary flags before their images, and characterize weight and multiplier before discussing components. This layer also provides component connections, GL₃ shape coordinates and explicit special-fibre primes. The detailed chart equations below fix the conventions for their labels.

<a id="t6-1"></a>

### 6.1 Local structure of the ordinary flag scheme at characteristic-zero points

At a closed flagged point, completion represents pair deformations (ρ_x,Fil_x). An adapted basis gives a Borel lifting ring plus d(d−1)/2 flag variables. For 𝔟=Fil⁰ad V_x the presentation has z=fd(d+1)/2+d²+h²(𝔟) variables and at most h² relations. Components have dimension ≥fd(d+1)/2+d². Excluded cyclotomic character ratios, or uniqueness of every stable flag step, give H²=0 and smooth equality.

Prerequisites: [1.9](#t1-9); [1.1](#t1-1); [1.18](#t1-18); ClassFieldTheory / layer 5 local coefficients the brauer group the local invariant and duality.

Sources: [Geraghty], Lemma 3.7 (preprint Lemma 3.2.3, p. 35), with Lemma 3.5 and Corollary 3.6 (preprint Lemma 3.2.1, p. 33; Corollary 3.2.2, p. 35); [THORNE15], proof of Proposition 3.14, p. 17 (accepted manuscript).

<a id="t6-2"></a>

### 6.2 Nearly ordinary rings of a p-distinguished split residual representation

For odd p, fixed determinant χ̃ and split distinguished residual χ⊕1 with χ≠1, construct versal unrestricted and nearly ordinary deformations. Write f=[K:ℚ_p] and ω for the local mod-p cyclotomic character. The nearly ordinary versal ring has 2f+2 variables and one relation if χ=ω or ω=1, and 2f+1 variables otherwise. The kernel in the unrestricted versal ring has f+ε generators: ε=2 if χ=ω=χ⁻¹; ε=1 if ω=1, or χ=ω≠χ⁻¹, or χ≠ω=χ⁻¹; ε=0 otherwise. The character comparisons are local, and these are versal rings, not an asserted universal unframed ring for split data.

Prerequisites: [1.1](#t1-1); [1.4](#t1-4); `DeformationAndDerivedPatchingAlgebra:R03.2`; ClassFieldTheory / layer 5 local coefficients the brauer group the local invariant and duality.

Sources: [SkinnerWiles], §2.1, Lemma 2.2, p. 11; [SkinnerWiles], §2.1, Corollary 2.3, p. 13.

<a id="t6-3"></a>

### 6.3 Ordinary deformations with fixed inertial characters on a full flag (CHT §2.4.2)

Choose the decreasing residual filtration with gr^i=k(χ̄_i), i=0,…,d−1. For i<j require χ̄_j/χ̄_i to be neither 1 nor ε̄. Define lifts admitting a direct-summand filtration reducing to it, with fixed inertia action χ_i on each graded piece. The filtration is unique; it descends along injective coefficient maps and is natural under coefficient change. This gives a local deformation problem. For the increasing flag convention, match χ_j^univ with χ_{d−j}|_I. The orientation of the cyclotomic-ratio exclusion is essential: replacing it by its inverse admits obstructed extensions.

API:

- `OrdinaryFixedInertia`: The condition 𝒟_v with its characters χ_{v,i}.
- `OrdinaryFixedInertia.filtration`: The filtration Fil^i of a lift in 𝒟_v.
- `OrdinaryFixedInertia.filtration_unique`: Lemma 2.4.6(1).
- `OrdinaryFixedInertia.filtration_baseChange`: Lemma 2.4.6(2).
- `OrdinaryFixedInertia.isLocalDeformationProblem`: Lemma 2.4.6(3).
- `OrdinaryFixedInertia.graded_character`: Inertia σ acts on gr^i by χ_{v,i}(σ); in the decreasing flag gr^{d−1} is the stable subrepresentation.

Worked checks:

- For n = 1, 𝒟_v is the lifts with inertial character χ_{v,0}.
- For n=2 write ρ̄=(χ̄₁ *;0 χ̄₀) with χ̄₁/χ̄₀ ≠ 1,ω. The decreasing filtration has Fil¹ equal to the unique line carrying the prescribed χ̄₁; its quotient carries χ̄₀.
- Over ℚ_l, l>3, residual ω on the subline and 1 on the quotient has H²(k(ω))≠0. It satisfies CHT's printed (2) but fails the corrected (2′) and smoothness.
- The lifts in 𝒟_v are the lifts that admit a (unique, by Lemma 2.4.6) point of L7/ordinary-flag-scheme over the point of Λ_v given by χ_j^univ ↦ χ_{v,n−j}|_I.

Prerequisites: [1.1](#t1-1); [1.9](#t1-9).

Sources: [CHT08], §2.4.2, the characters χ_{v,i}, p. 37; [CHT08], §2.4.2, 𝒟_v and Lemma 2.4.6, p. 38.

<a id="t6-4"></a>

### 6.4 Discrete series deformations away from l (CHT §2.4.5)

Let d=mr and fix a rank-r reference lift r̃ with absolutely irreducible reduction, absolutely irreducible inertia constituents and r̃⊗k≇(r̃⊗k)(i) for 1≤i≤m. The reference representation is induced from an unramified extension, and lifts with its inertia restriction are induced after a unique unramified twist; its inertia centralizer reduces surjectively. Define a discrete-series lift by a decreasing direct-summand filtration with gr^i≅gr⁰(i) and gr⁰|_I≅r̃|_I. Its filtration is unique and coefficient compatible, and the condition is a local deformation problem. For r=1 it is the filtration version of Steinberg; its twist-separation hypothesis excludes q≡±1 mod p in rank two, unlike the Steinberg flat closure.

API:

- `DiscreteSeriesType`: (m, d, r̃_v) with conditions (1)–(3).
- `IsDiscreteSeriesLift`: Definition 2.4.24: the filtration with gr^i ≅ gr⁰(i) and gr⁰|_I ≅ r̃_v|_I ⊗ R.
- `IsDiscreteSeriesLift.filtration_unique`: Lemma 2.4.25.
- `discreteSeriesDeformation`: Lemma 2.4.26: a local deformation problem.
- `DiscreteSeriesType.induced`: Lemma 2.4.23: r̃_v ≅ Ind s_v.
- `DiscreteSeriesType.filtration_baseChange`: Coefficient maps preserve the unique filtration, graded identifications and fixed prime-to-p inertia lift.

Worked checks:

- d = 1, m = n, r̃_v trivial: the unipotent-monodromy (Steinberg) lifts with Frobenius eigenvalues α, qα, …, q^{n−1}α.
- m = 1: lifts with ρ|_I ≅ r̃_v|_I ⊗ R, i.e. minimally ramified type r̃_v.
- If q ≡ 1 mod l (l the coefficient characteristic) then k(1) ≅ k and condition (3) fails for i = 1.
- d = 2 with r̃_v induced from the unramified quadratic extension (a supercuspidal type).

Prerequisites: [1.1](#t1-1); [2.5](#t2-5).

Sources: [CHT08], §2.4.5, the set-up, p. 47; [CHT08], §2.4.5, Definition 2.4.24, p. 49.

<a id="t6-5"></a>

### 6.5 The G-valued ordinary flag scheme and the ordinary quotient R^{△λ}

Inside the fixed-extension semistable G-valued Hodge-type family, construct the closed Borel incidence locus imposing the prescribed inertia torus character. Include equations ψ(t_σ)=ψ(χ_λ(σ)) for a character-lattice basis, as well as the root-space equations. Root equations alone see the torus only modulo the centre and fail for GL₁. The characteristic-zero image defines R^{△λ}; properness and the finite-local-E-algebra point criterion identify its points with F′_v-ordinary lifts. A Borel-valued representation with that torus restriction is semistable over F′_v of Hodge type v_λ. Keep dominant regularity for the unique-flag comparison.

API:

- `gOrdinaryFlagScheme`: 𝒢_λ ⊂ Fl_G ×_𝒪 Spec R^{□,v_λ}_ρ̄.
- `gOrdinaryFlagScheme.isClosed`: 𝒢_λ is a closed subscheme, with the ideal of (1) including the torus equations.
- `gOrdinaryFlagScheme.proper`: 𝒢_λ → Spec R^{□,v_λ}_ρ̄ is proper.
- `gOrdinaryRing`: R^{△λ}_ρ̄, the scheme-theoretic image of 𝒢_λ[1/p].
- `gOrdinaryRing_points`: Point criterion (3).
- `gOrdinaryRing.gl`: For G = GL_n, R^{△λ}_ρ̄ is the weight-λ specialisation of L7/ordinary-flag-scheme's image ring, intersected with the Hodge type v_λ.
- `gOrdinaryFlagScheme.points`: Incidence points are lifts with Borel reductions satisfying root and torus equations; both pull back under coefficient maps, even for rootless G.

Worked checks:

- G = GL₁: R^{△λ}_ρ̄ = R_ρ̄/(ρ(σ) − χ_λ(σ) : σ ∈ I_{F′_v}) up to the p-torsion-free generic fibre (R08.1/rank-one-ring).
- For GL₁ there are no root equations: impose ρ(σ)=χ_λ(σ) on I_{F′_v} explicitly in the unrestricted ring.
- For GL₂ over ℚ_p and cocharacter (1,0), (ψ₁ε,*;0,ψ₂) is semistable over F′_v; a Tate-curve extension can have N≠0.
- For GL_d and F′_v=F_v, apply the displayed cocharacter/highest-weight dictionary to recover the semistable-ordinary quotient's points.

Prerequisites: [1.21](#t1-21); [3.11](#t3-11); [1.17](#t1-17); `PadicHodgeTheory:R06.4/ordinary-implies-semistable`; [1.9](#t1-9).

Sources: [FKP22], Lemma B.3, arXiv v5 p. 53; [FKP22], Lemma B.4 (1), arXiv v5 p. 54.

<a id="t6-6"></a>

### 6.6 The two-dimensional ordinary ring of the trivial representation (Snowden)

For odd p, trivial rank-two residual data and μ_p⊂K, the fixed-determinant ε⁻¹ semistable-ordinary weight-zero ring has integral dimension [K:ℚ_p]+4 and exactly two components: crystalline and the extension component shaped (1,*;0,ε⁻¹). Each special-fibre generic point has a unique generic generalisation. Twisting by ε compares it with Snowden's ring. The μ_p hypothesis excludes K=ℚ_p for odd p.

Prerequisites: [3.13](#t3-13); [3.14](#t3-14); `PadicHodgeTheory:R06.4/two-dimensional-ordinarity-criterion`.

Sources: [CN23], Proposition 5.3.2, arXiv v3 pp. 75–76.

<a id="t6-7"></a>

### 6.7 The ordinary ring with a Frobenius eigenvalue for trivial ρ̄|G_p (Calegari–Geraghty R̃†)

For p≥3 and trivial rank-two residual data, choose weight n≥2, χ=εω⁻¹≡1 mod ϖ, and Frobenius φ_p with χ(φ_p)=1. Adjoin to the ordinary lift of determinant χ^{n−1} an eigenvalue α≡1 for the unramified quotient. Define the ring by the inertia trace, ordered product and Frobenius compatibility equations listed below, then take its reduced flat form R̃†. Its image forgetting α is R†. With β=α−1 and entries φ_i of ρ(φ_p)−1, the eigenvalue equation is β²−(φ₁+φ₄)β−(φ₁+φ₄)=0. Define the unramified quotient, its pullback, the kernel ideal I and doubling annihilator J in the original universal framed ring. Here n is a weight, not the matrix rank.

Write Φ=ρ(φ_p), G=ρ(g), G′=ρ(g′), c_g=χ^{n−1}(g) for g,g′ in inertia. Require the following equations for every such pair:

1. det Φ=1 and det(Φ−α)=0.
2. tr G=c_g+1.
3. (G−1)(G′−1)=(c_g−1)(G′−1).
4. (G−1)(Φ−α)=(c_g−1)(Φ−α).
5. (Φ−α)(G−1)=(α⁻¹−α)(G−1).

The entries of Φ−1, inertia-generator matrices minus one and β topologically generate the eigenvalue ring. The unramified quotient kills every entry of ρ(g)−1 for g in inertia, and R̃^{unr}=R̃†⊗_{R†}R^{unr}. Define I=ker(R^{univ}→R^{unr}) and J=Ann_{R^{univ}}(R̃†/R†).


API:

- `OrdinaryWithEigenvalue`: R̃† with the universal pair (ρ, α) satisfying (1)–(6).
- `OrdinaryWithEigenvalue.forget`: R† → R̃†, forgetting α; R† is the image.
- `OrdinaryWithEigenvalue.beta_relation`: β² − (φ₁ + φ₄)β − (φ₁ + φ₄) = 0, α = 1 + β.
- `OrdinaryWithEigenvalue.unr`: R^unr and R̃^unr = R̃† ⊗_{R†} R^unr.
- `OrdinaryWithEigenvalue.unramifiedIdeal`: I = ker(R^univ → R^unr).
- `OrdinaryWithEigenvalue.doublingIdeal`: J = Ann_{R^univ}(R̃†/R†).
- `OrdinaryWithEigenvalue.hom_ext`: Maps from R̃† agree iff both ρ and α agree; maps from the image R† are determined by ρ alone.

Worked checks:

- The displayed R̃^unr is R^unr⊕R^unr as a module, rather than a product of rings; ϖ^m divides every χ^{n−1}(g)−1 maximally.
- The unramified eigenvalue algebra is rank two as a module but has ϖ-power-torsion support. After inverting p, I=J=(1) and R̃†=R†.
- R† ≠ R̃†: the ring with an eigenvalue is not the image ring; their difference is measured by J.
- α + α^{-1} = 2 + φ₁ + φ₄ in R̃†.

Prerequisites: [1.9](#t1-9); [3.13](#t3-13); [1.10](#t1-10).

Sources: [CG18], proof of Lemma 3.22, published pp. 336–337; [CG18], Definition 3.20, published p. 335; [CG18], Definition 3.21, published p. 335.

<a id="t6-8"></a>

### 6.8 The relation "connects" between potentially crystalline lifts

For representations descending to integers of finite coefficient extensions, define ρ₁∼ρ₂ by equivalent reductions, equal labelled Hodge types, potential crystallinity and membership in one geometric irreducible component of a common sufficiently-large-extension crystalline lifting ring. Away from p use the unrestricted geometric lifting ring. Strong connection additionally requires ρ₁ on a unique component. Prove independence of the residual equivalence, coefficient splitting and sufficiently large extension, and conjugacy invariance. Connection is symmetric and is an equivalence relation on points lying on unique components; a common-component relation is not transitive at arbitrary component intersections.

API:

- `Connects`: ρ₁ ∼ ρ₂: same reduction, potentially crystalline with the same labelled Hodge–Tate weights, same component of the potentially crystalline lifting ring over ℚ̄_l.
- `Connects.symm`: ρ₁ ∼ ρ₂ ⟹ ρ₂ ∼ ρ₁.
- `Connects.restrict`: ρ₁ ∼ ρ₂ ⟹ ρ₁|G_{K′} ∼ ρ₂|G_{K′} for K′/K finite.
- `Connects.sum_tensor_dual`: ∼ is compatible with direct sums, tensor products, duals, and twists by unramified characters with trivial reduction.
- `Connects.symPow`: ∼ is compatible with Sym^{n−1} (components of these generic fibres are connected components and Sym^{n−1} induces a morphism of generic fibres).
- `Connects.trans_of_smooth`: On points lying on unique components, ∼ is transitive.

Worked checks:

- n = 1: ψ₁ ∼ ψ₂ iff ψ̄₁ = ψ̄₂ and HT(ψ₁) = HT(ψ₂) (crystalline characters).
- Two ordinary crystalline weight-0 lifts of the trivial representation connect (L7/weight-zero-crystalline-connectedness).
- Lifts with different labelled Hodge–Tate weights never connect, even if their reductions agree.
- ρ₁ ∼ ρ₂ implies ρ₁|G_{K′} ∼ ρ₂|G_{K′}.

Prerequisites: [3.4](#t3-4); [3.10](#t3-10); [3.7](#t3-7); [2.24](#t2-24).

Sources: [BLGGT14], §1.3, p. 21, and §1.4, p. 26, arXiv v4.

<a id="t6-9"></a>

### 6.9 GL₃ eigenbasis charts and shapes of Kisin modules with tame descent

For unramified K of degree f and a 1-generic tame GL₃ type, choose its lowest-alcove presentation (s,μ), permutation order r∈{1,2,3}, f′=fr, the unramified K′/K and L′=K′((-p)^{1/(p^{f′}−1)}). Import height-bounded Kisin modules with semilinear Gal(L′/K) descent from R07.4. The type condition on reduction modulo u′ is τ∨. Add eigenbasis coordinates and partial Frobenius matrices in GL₃(R((v))), v=(u′)^{p^{f′}−1}; Iwahori changes act by the prescribed twisted conjugation. Shape is the tuple of Iwahori double cosets, defined after the principal-series base change when necessary. For 3-generic τ the shape attached to a residual representation is unique. Keep each stronger genericity hypothesis at its own theorem.

API:

- `GL3KisinChart`: A rank-3 Kisin module with tame descent datum of type τ (R07.4) over R together with an eigenbasis: the data from which the partial Frobenius matrices are read.
- `GL3KisinChart.frobMatrix`: A^{(j)} ∈ GL₃(R((v))) for j ∈ ℤ/f, the matrix of the j-th partial Frobenius in the eigenbasis.
- `GL3KisinChart.changeBasis`: Eigenbases differ by Iwahori tuples I^{(j)}; their matrices transform by LLHLM18 Proposition 2.15's φ-twisted conjugation, using s_j* v^{μ_j*+η_j*}.
- `GL3KisinChart.shape`: Shape is the eigenbasis-independent Iwahori double coset of A^{(j)} for principal-series type; general types use unramified base change.
- `GL3KisinChart.unique`: For 3-generic τ the type-(η,τ) module realizing ρ̄|_{G_{K∞}} is unique when it exists, hence determines w̃(ρ̄,τ).

Worked checks:

- For principal series, Δ has order p^f−1; the shifted isotypic pieces are rank-one over (W(k)⊗R)[[v]], and an eigenbasis adapts to the three characters.
- For ρ̄ = T*_dd of the semisimple Kisin module of shape t_1 (A^{(j)} diagonal), the shape w̃(ρ̄, τ) is the identity at every j.
- w̃(ρ̄, τ) lies in Adm^∨(η) whenever ρ̄ has a potentially crystalline lift of type (η, τ) (LLHLM Theorem 3.3.11).
- For 10-generic semisimple ρ̄ and non-1-generic τ, R^τ=0. Dropping residual genericity fails: trivial residual data have trivial-type crystalline lifts.

Prerequisites: [1.2](#t1-2); [1.8](#t1-8); [3.1](#t3-1); `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/kisin-modules`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/kisin-modules-with-coefficients`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`.

Sources: [LLHLM20], Definition 3.1.3, published p. 27; [LLHLM20], Definition 3.3.1, published p. 31.

<a id="t6-10"></a>

### 6.10 Unipotent lifting rings with monodromy bounded by a partition (Clozel–Thorne R^m_v)

For trivial residual rank d away from p and q≡1 mod p, let R¹ classify unipotent inertia. For a partition m of d, impose that the arithmetic-Frobenius characteristic roots can be grouped into q-chains of lengths m_i, then take the maximal flat reduced quotient R^m. The one-part partition gives the Steinberg closure; all one-part-size-one chains give the reduced flat quotient of R¹, without asserting R¹ itself reduced. Compare these ring-defined conditions with the local-deformation-problem interface.

API:

- `partitionRing`: R^m_v for a partition m of n.
- `partitionRing_points`: ℚ̄_l-points of R^m_v are the unipotently ramified lifts whose Frobenius characteristic polynomial lies in Pol_n(m, q_v).
- `partitionRing_steinberg`: R^{(n)}_v = R^St_v.
- `partitionRing_trivial`: R^{(1,…,1)}_v = R^1_v.
- `partitionRing_mono`: Splitting consecutive q-chains gives Pol_d(m′,q)⊂Pol_d(m,q) and R^m↠R^{m′}; partition dominance alone is insufficient.
- `partitionRing.coefficientMap`: Coefficient maps preserve unipotence, q-chain equations and points of the flat quotient, without prescribing the rank of N.

Worked checks:

- m = (n) gives R^St_v of R08.2/steinberg-condition.
- m = (1, …, 1) gives the maximal reduced 𝒪-flat quotient of R^1_v.
- n = 2, m = (2): the defining equation q_v(tr Φ)² = (1 + q_v)² det Φ.
- R^m_v for m = (2, 1) is not the ring of lifts with scalar inertial semisimplification: it also constrains the Frobenius eigenvalues to contain a chain α, q_vα.
- {1,q,q²,b} for generic b has chains (3,1) but cannot be grouped as (2,2), despite partition dominance.

Prerequisites: [2.5](#t2-5); [2.15](#t2-15); `GlobalGaloisDeformations:R04.3/local-deformation-problem`.

Sources: [CT17], §5.1, item 5, accepted manuscript p. 39.

<a id="t6-11"></a>

### 6.11 Torsion crystalline representations with Hodge–Tate weights in [a, b]

For unramified K/ℚ_p, define a torsion module crystalline in [a,b] if it is a quotient of two stable lattices in a crystalline rational representation of those weights. A finitely generated ℤ_p-module has the condition when every quotient by p^m does; coefficient-𝒪 modules use their underlying ℤ_p-module. A crystalline rational lattice gives this torsion condition. For b−a≤p−2, identify the torsion condition with the twisted Fontaine–Laffaille essential image using R07.3. The definition alone does not prove the converse that all these torsion quotients force the rational representation crystalline.

API:

- `IsTorsionCrystalline`: R is a subquotient R″/R′ of lattices in a crystalline representation with weights in [a, b].
- `IsCrystallineIntegral`: R crystalline iff every R/p^m R is torsion crystalline.
- `IsTorsionCrystalline.closed`: For every fixed [a,b], torsion crystalline objects are closed under subobjects, quotients and finite direct sums.
- `IsCrystallineIntegral.of_rational`: A lattice in a crystalline representation with weights in [a, b] is crystalline.
- `IsTorsionCrystalline.fontaineLaffaille`: For b − a ≤ p − 2 these are the representations of Fontaine–Laffaille modules.
- `IsTorsionCrystalline.twist`: Tensoring by a crystalline character lattice of constant labelled weight w shifts [a,b] to [a+w,b+w].

Worked checks:

- μ_p ≅ ℤ/p(1) is torsion crystalline with weights in [−1, 0] (LTXZZ convention).
- ℤ/p^m with trivial action is torsion crystalline with weights in [0, 0].
- At width p−1 integral Fontaine–Laffaille full faithfulness can fail; crystalline lattice-subquotient closure still holds.
- A Γ-stable lattice in a crystalline representation is crystalline in the sense of (2).

Prerequisites: [1.6](#t1-6); `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-essential-image-subquotients`; `PadicHodgeTheory:R06.4/fontaine-laffaille-rational-consequences`.

Sources: [LTXZZ], Definition 2.2.4, published pp. 124–125.

<a id="t6-12"></a>

### 6.12 Geraghty's fixed-weight ordinary rings: components, connected fibres and irreducibility

For dominant λ, the flag image in the semistable or crystalline Hodge ring has exactly the ordinary weight-λ finite-local-E-algebra points and is a union of ambient components. For trivial residual data, variable-weight characteristic-zero fibres are connected and every nonzero fixed-weight ordinary crystalline ring is irreducible.

Prerequisites: [1.9](#t1-9); [6.1](#t6-1); [1.7](#t1-7); [3.4](#t3-4); [3.9](#t3-9); [3.10](#t3-10).

Sources: [Geraghty], Lemma 3.10 (preprint Lemma 3.3.3, p. 37); [Geraghty], Lemmas 3.13–3.14 (preprint Lemmas 3.4.2–3.4.3, pp. 38–39).

<a id="t6-13"></a>

### 6.13 Ordinary deformations with fixed inertial characters are formally smooth (CHT Lemmas 2.4.7–2.4.8)

Under that decreasing-filtration ratio hypothesis, every lift across a small extension exists. The fixed-inertia framed ring is formally smooth of relative dimension d²+fd(d−1)/2, and dim L−h⁰(ad ρ̄)=fd(d−1)/2. The same count occurs for regular Fontaine–Laffaille deformations, but the two conditions are defined by different functors.

Prerequisites: [6.3](#t6-3); [1.1](#t1-1); ClassFieldTheory / layer 5 local coefficients the brauer group the local invariant and duality.

Sources: [CHT08], §2.4.2, proof of Lemma 2.4.7, p. 39; [CHT08], §2.4.2, proof of Lemma 2.4.8, p. 40.

<a id="t6-14"></a>

### 6.14 The Siegel-ordinary GSp₄ condition at p with fixed multiplier (Calegari–Geraghty)

For p>2, a≥2 and the specified GSp₄ residual shape of multiplier ε̄^{1−a}, require (α²−1)(β²−1)(α²β²−1)(α−β)≠0. A lift stabilizes a Lagrangian plane which is the sum of two unramified characters χ_αψ⁻¹,χ_βψ⁻¹; its quotient has characters ε^{1−a}χ_β⁻¹ψ,ε^{1−a}χ_α⁻¹ψ, with ψ unramified and residually trivial. The (1,2) and (3,4) entries vanish. Define L′ as the kernel H¹(𝔟⁰)→H¹(I,𝔟⁰/𝔲) and L as its image in H¹(ad⁰), where 𝔲 is the three-dimensional Siegel unipotent radical. This nonregular-weight Siegel condition is stronger than full-flag ordinarity.

API:

- `GSp4.SiegelOrdinary`: The local deformation problem of Siegel-ordinary lifts with multiplier ε^{−(a−1)}.
- `GSp4.SiegelOrdinary.plane`: The stable unramified Lagrangian plane of a lift in the condition.
- `GSp4.SiegelOrdinary.plane_unique`: Under the genericity condition the plane is unique and lifts the residual one.
- `GSp4.SiegelOrdinary.tangent`: The tangent space of the condition is L_p ⊂ H¹(G_p, ad⁰r̄).
- `GSp4.SiegelOrdinary.isOrdinary`: Every lift in the condition is G-ordinary of the corresponding (non-regular) weight in the sense of L7/g-valued-ordinary-condition with the Siegel parabolic.
- `SiegelOrdinary.baseChange`: Coefficient maps preserve the stable unramified Lagrangian plane and multiplier; uniqueness identifies the pulled-back plane.

Worked checks:

- dim u = 3 (root spaces (1,4), (2,3) and (1,3) ~ (2,4) in sp₄).
- A ramified nonsplit extension on the Lagrangian quotient plane fails unramified-plane ordinarity; an unramified extension may be conjugate to split form.
- For R = k the condition is the residual shape itself.
- Every lift in the condition has multiplier ε^{−(a−1)}: (χ_αψ^{-1})(ε^{−(a−1)}χ_α^{-1}ψ) = ε^{−(a−1)}.

Prerequisites: [1.17](#t1-17); [1.7](#t1-7); [6.3](#t6-3).

Sources: [CG20], Definition 4.6 (6), published p. 815; [CG20], §4, the definition of L′_p, published p. 816.

<a id="t6-15"></a>

### 6.15 The GL₂ ordinary ring R^{B₂}: irreducible generic fibre and explicit presentations

For p>2 and residual (λ_ᾱ,*;0,ε̄⁻¹λ_ᾱ⁻¹), fix determinant ε⁻¹ and the universal inertial character over 𝒪[[1+pℤ_p]]. The ordinary ring has irreducible generic fibre of dimension five and is formally smooth over 𝒪 of that relative dimension when H²=0. H² is one precisely for ᾱ²=1 and zero extension class, and zero otherwise. The B₂-framed versions are flat complete intersections of relative dimension four, with the four explicit presentation cases below; full framing adds one smooth variable. The points nonsmooth over weight space are, up to unramified twist, crystalline extensions of ε⁻¹ by 1.

For the B₂-framed calculation, use y₁,y₂ from the rank-one character ring, x_i for framing and z_i for extensions. The residual character parameter is γ and the extension class is η∈H¹(ℚ_p,ε̄λ_γ²).

| Residual case | B₂-framed ring or relation |
|---|---|
| γ²≠1, η≠0 | 𝒪[[x₁,x₂,y₁,y₂]] |
| γ²≠1, η=0 | 𝒪[[x₁,z₁,y₁,y₂]] |
| γ²=1, η≠0 | 𝒪[[x₁,x₂,z₁,y₁,y₂]]/(g_η), with g_η≡c_ηy₁+d_ηy₂ mod (ϖ,𝔪²) |
| γ²=1, η=0 | 𝒪[[x₁,z₁,z₂,y₁,y₂]]/(g), with g≡z₁y₁+z₂y₂ mod (ϖ,𝔪³) |

In the third row [c_η:d_η] depends only on η and c_η=0 exactly for peu-ramification; the ring is smooth over 𝒪 but smooth over Λ only outside that peu branch. The last row is not smooth modulo ϖ. Full framing adds one variable. These congruences specify the initial terms of the relations; they do not identify an arbitrary chosen higher-order polynomial with the deformation equation.


Prerequisites: [6.3](#t6-3); [1.19](#t1-19); [1.18](#t1-18); ClassFieldTheory / layer 5 local coefficients the brauer group the local invariant and duality; ClassFieldTheory / layer 7 the absolute local artin map its normalizations and conductors.

Sources: [BCGP21], Lemma 7.3.6, arXiv v3 p. 174; [BCGP21], Lemma 7.3.9, arXiv v3 p. 179.

<a id="t6-16"></a>

### 6.16 Discrete series deformations are formally smooth of relative dimension n² (CHT Lemmas 2.4.27–2.4.30)

The discrete-series lifting problem is liftable and its framed ring is formally smooth of relative dimension d². Its tangent dimension is h⁰(ad ρ̄). For rank-one reference type, identify the tangent as the unramified scalar H¹ plus the kernel of H¹(ad⁰)→H¹(ad/Fil¹ad). In the induction proof the rank of the last graded piece is r, and the dimension identity is r(d−r)+(d−r)²+(r²−1)+r(d−r)+1=d².

Prerequisites: [6.4](#t6-4); [1.1](#t1-1); ClassFieldTheory / layer 5 local coefficients the brauer group the local invariant and duality.

Sources: [CHT08], §2.4.5, Lemma 2.4.27, p. 51; [CHT08], §2.4.5, proof of Lemma 2.4.28, p. 52; [CHT08], §2.4.5, Lemma 2.4.30, p. 53.

<a id="t6-17"></a>

### 6.17 The G-valued ordinary locus is a union of components

For dominant regular λ and the preceding fixed-extension ordinary quotient, its generic fibre is a union of components of the ambient G-valued semistable ring. It has dense regular open and every component has dimension dim G+[K:ℚ_p]dim Fl_G. Fixing a compatible full abelianisation replaces dim G by dim G^der.

Prerequisites: [6.5](#t6-5); [3.11](#t3-11); [1.18](#t1-18); ClassFieldTheory / layer 5 local coefficients the brauer group the local invariant and duality.

Sources: [FKP22], Lemma B.4 (2)–(3), arXiv v5 pp. 54–55; [BCG25], proof of Theorem 2.1, arXiv v3 p. 6.

<a id="t6-18"></a>

### 6.18 R̃† is a normal Cohen–Macaulay domain of relative dimension 4 and type 3

The ordinary eigenvalue ring R̃† is a normal Cohen–Macaulay domain of relative dimension four, with normal Cohen–Macaulay special fibre of dimension four and type three, hence not Gorenstein. Its eight-variable special-fibre presentation and six-variable quotient by β are specified below. The latter has dimension three, associated graded completion and Hilbert series beginning 1+6t+15t². Three degree-one generators form a regular sequence exactly when their quotient has Hilbert series 1+3t. The sequence β,a,φ₂+φ₃,b+c+φ₁ leaves k[x,y,z]/(x,y,z)², proving the canonical-module generator count three.

Use the following explicit special-fibre presentation. Set A=k[[a,b,c,φ₁,φ₂,φ₃,φ₄,β]] modulo

- φ₁+φ₄+φ₁φ₄−φ₂φ₃;
- β²−(φ₁+φ₄)β−(φ₁+φ₄);
- aφ₁+bφ₃−aβ and aφ₂+bφ₄−bβ;
- −aφ₃+cφ₁−cβ and aφ₄−cφ₂−aβ;
- a²+bc.

Then A is the completion at (1,1;0) of Snowden's B₁. Eliminating β and φ₄ gives B=A/(β)=k[[a,b,c,φ₁,φ₂,φ₃]] modulo −φ₁²−φ₂φ₃, aφ₁+bφ₃, aφ₂−bφ₁, −aφ₃+cφ₁, −aφ₁−cφ₂, a²+bc. Compute the regular-sequence quotient and Hilbert functions in this presentation, before lifting the Cohen–Macaulay and canonical-module statements integrally.


Prerequisites: [6.7](#t6-7); `DeformationAndDerivedPatchingAlgebra:R03.3`.

Sources: [CG18], Theorem 4.3, published p. 356; [CG18], Lemma 4.7, published p. 360; [CG18], Lemma 4.5, published p. 358.

<a id="t6-19"></a>

### 6.19 The induced local models ρ_{n,m,0}

For p>nm, choose the conjugate Lubin–Tate characters ε₂,ε′₂ of ℚ_{p²}, trivial on the uniformizer under geometric reciprocity and with ε₂ε′₂=ε⁻¹. Put ρ_{n,m,0}=⊕_{i=1}^n ε₂^{m(n−i)}(ε′₂)^{m(i−1)}. Its labelled weights here are 0,−m,…,−(n−1)m. Sym^{n−1}ρ_{2,m,0}=ρ_{n,m,0} and ρ_{n,m,0}⊗ρ_{m,1,0}=ρ_{nm,1,0}. Over an unramified extension, matching residual inertia for a crystalline lift of this Hodge type gives residual equality after further unramified extension, then connection to the model on each extension with that equality.

API:

- `rhoNM0`: ρ_{n,m,0} = ⊕ ε₂^{m(n−i)}(ε′₂)^{m(i−1)}.
- `rhoNM0.hodgeTate`: HT_τ(ρ_{n,m,0})={0,−m,…,−(n−1)m} at each embedding in HT(ε)=+1 convention; the source uses the opposite signs.
- `rhoNM0.symPow`: Sym^{n−1}ρ_{2,m,0} ≅ ρ_{n,m,0}.
- `rhoNM0.tensor`: ρ_{n,m,0} ⊗ ρ_{m,1,0} ≅ ρ_{nm,1,0}.
- `rhoNM0.connects`: Crystalline lifts of ρ̄_{n,m,0} with the same weights connect to ρ_{n,m,0} after an unramified extension.
- `rhoNM0.rank_one`: For n=1 the sole summand has exponents zero, so ρ_{1,m,0} is the trivial character for every allowed m.

Worked checks:

- n = 1: ρ_{1,m,0} is the trivial character.
- det ρ_{2,1,0} = ε₂ε′₂ = ε^{-1}.
- ρ_{3,2,0} has weights {0,−2,−4} here, equivalently {0,2,4} in the source convention.
- p>dm gives the uniform Fontaine–Laffaille range; failure of this bound alone says nothing about an individual weight multiset.

Prerequisites: [6.8](#t6-8); [1.13](#t1-13); `ArithmeticGaloisRepresentations:R01.2/tame-inertia-and-fundamental-characters`; ClassFieldTheory / layer 7 the absolute local artin map its normalizations and conductors.

Sources: [BCGNT25], Definition 5.1.1, arXiv p. 49; [BCGNT25], Lemma 5.1.3, arXiv p. 49.

<a id="t6-20"></a>

### 6.20 Semisimple Kisin modules and the shapes of potentially crystalline lifts

A semisimple Kisin module has the explicit shape normal form and a semisimple G_{K∞} realization, with inertia computable from its étale φ-module. Semisimple residual representations have matching inertia exactly when their restrictions arise from semisimple modules of the same shape. Potentially crystalline liftability passes to semisimplification after coefficient extension. For an effective Hodge type, liftability gives an admissible shape when τ is regular principal series or λ=η and τ is 3-generic. Conversely a semisimple ρ̄ arising from a module admits a semisimple model after residue extension if ρ̄ is a sum of characters or λ=η with 3-generic τ; in the latter case uniqueness avoids residue extension.

Prerequisites: [6.9](#t6-9); [3.4](#t3-4).

Sources: [LLHLM20], Theorem 3.3.11, published p. 33; [LLHLM20], Propositions 3.3.5–3.3.9, Lemma 3.3.10, Theorem 3.3.12, arXiv v4 pp. 24–27.

<a id="t6-21"></a>

### 6.21 Explicit GL₃ rings for shapes of length two, three and four (LLHLM Tables 3–4)

For the unique semisimple residual Kisin module, use the length-two/three shape presentations and minimal-prime generators displayed below, up to the outer affine-Weyl automorphisms. Keep the Table 3/4 indexing: a type written τ(s,μ) has lowest-alcove parameter μ−η, and the row for w_{f−1−i} uses s_i⁻¹μ_i. Unit coordinates c* are expanded about their chosen residual values. The listed ideals are primes in the presented quotient, not primes in the ambient power-series ring. The length-three rows have two components and the length-two rows four; the minimal-type length-four rows are smooth, and the length-three minimal-type rows are two-factor hypersurfaces.

The coordinate data below specify the matrices, relation ideals, weight labels and minimal-type matching elements. Each starred coordinate is a unit in its completed chart.

- **βαγ**. A = (v c11, v c*12, 0; v² c*21, v c22, 0; v(c31 + v d31), v c32, c*33); relations c11 c22 = 0, (−1 − a + c) c*12 c31 − (−1 − b + c) c32 c11 = 0; primes (ε1+ε2, 0): (c11), z̃* = βγ⁺β; (ε2, 1): (c22), z̃* = α.

- **αβγ**. A = (v² c*11, 0, 0; v(c21 + v d21), c22, c*23; v(c21 c33 (c*23)^{−1} + v d31), v c*32, c33); relations c22 c33 = 0, (−1 − a + c) c21 c*32 + (b − c) d31 c22 = 0; primes (ε1+ε2, 0): (c22), αγ⁺α; (ε1, 1): (c33), β.

- **αβα**. A = (c11, c11 c32 (c*31)^{−1}, d33 c11 (c*31)^{−1} + v c*13; 0, v c*22, v c23; v c*31, v c32, v d33); relation c11((a − b) c23 c32 − (a − c) c*22 d33) = 0; primes (0, 0): (c11), γ⁺; (0, 1): ((a − b) c23 c32 − (a − c) c*22 d33), id.

- **αβ**. A = (c31 c12 (c*32)^{−1}, c12, c13 + v c*13; v c*21, c22, c23 + v d23; v c31, v c*32, c31 c23 (c*21)^{−1} + v d33); relations (3.14): c12 c23 − c22 c13 = 0, c22 c31 = 0, c*32 c13 − d33 c12 = 0, c12((b − c) d33 c*21 + (a − b) c31 d23) = 0, (−1 − a + c) c23 c*32 = (−1 − a + b) c22 d33; primes (ε1, 1): (c12, c31), γ⁺β; (ε1 − ε2, 0): (c31, d33), βγ⁺αβ; (0, 0): (c12, c22), αγ⁺; (0, 1): (c22, (b − c) d33 c*21 + (a − b) c31 d23), α.

- **βα**. A = (c11, (c*31)^{−1} c11 c32 + v c*12, c13; 0, v d22, v c*23; v c*31, v c32, c33 + v d33); relations c11 c33 = 0, d22(c13 c*31 − c11 d33) = 0, c11((a − b) c32 c*23 − (a − c) d22 d33) = 0, (1 + a − c) c33 c*23 c*12 = c13((a − b) c32 c*23 − (a − c) d22 d33); primes (ε2, 1): (d22, c11), γ⁺α; (ε2 − ε1, 0): (d22, c32), αγ⁺βα; (0, 0): (c11, c13), βγ⁺; (0, 1): ((a − b) c32 c*23 − (a − c) d22 d33, c13 c*31 − c11 d33), β.

The intersection ideals 𝔴_ω = 𝔠_{(ω,0)} ∩ 𝔠_{(ω,1)} of the continuation of Table 3 are (c22) for αβ and (c13 c*31 − c11 d33) for βα.

For the minimal-type shapes w̃′ (Table 4, structure constants (a′, b′, c′) ≡ z̃_{f−1−i}(a, b, c)): αβαγ, βγβα and αγαβ give power series rings in their entries; βγαγ, γαβα and αβγβ each have one relation, (−1 − b′ + c′) c′32 c′*11 − (−1 − a′ + c′) c′12 c′31 = 0, (a′ − c′) c′13 c′*22 − (a′ − b′) c′23 c′12 = 0 and (−1 − a′ + b′) c′21 c′*33 − (b′ − c′) c′31 c′23 = 0 respectively, solvable for one variable, so the ring is again a power series ring; the length-three shapes αβα, βγβ and γαγ have the relations c′11((a′ − b′) c′23 c′32 − (a′ − c′) c′*22 d′33) = 0, c′22((b′ − c′) c′31 c′13 − (−1 − a′ + b′) c′*33 d′11) = 0 and c′33((−1 − a′ + c′) c′12 c′21 − (−1 − b′ + c′) c′*11 d′22) = 0, each with two minimal primes.


Prerequisites: [6.9](#t6-9); [1.1](#t1-1).

Sources: [LLHLM20], Table 3, published p. 51 (arXiv v4 p. 53), and its continuation, published p. 52 (arXiv v4 p. 54); [LLHLM20], §3.6.2, (3.14), arXiv v4 p. 43; [LLHLM20], Table 4, published p. 60 (arXiv v4 p. 55).

<a id="t6-22"></a>

### 6.22 Smooth pure points of partition rings and their minimal primes

At a pure closed characteristic-zero point of R^m, the unipotent generic lifting space is formally smooth and the point lies on a unique component. Its unique minimal prime contains the kernel of R¹→R^m. This transfers the partition condition to that component; the purity hypothesis prevents an ambiguous intersection-point comparison.

Prerequisites: [6.10](#t6-10); [1.22](#t1-22); [2.15](#t2-15).

Sources: [CT17], Lemma 5.2, accepted manuscript p. 39.

<a id="t6-23"></a>

### 6.23 Rank-n conditions away from p: the interface with R08.2

Export the same minimal, Steinberg, full-type, Ihara and discrete-series objects already defined above, together with the partition generalization. Their consumers are GlobalGaloisDeformations G7 and PotentialAutomorphyInfrastructure PA.3; the algebraic patched-complex comparison remains in the patching algebra roadmap. Keep the unique-component hypothesis when comparing full inertia type including N on a common component.

Prerequisites: [2.8](#t2-8); [2.21](#t2-21); [2.26](#t2-26); [6.10](#t6-10); [2.24](#t2-24); [2.15](#t2-15); [2.29](#t2-29); [6.4](#t6-4).

Sources: [CT17], §5.1, accepted manuscript p. 39.

<a id="t6-24"></a>

### 6.24 The flag image ring for trivial residual representation

Assume ρ̄=1 and f=[K:ℚ_p]>d(d−1)/2+1. For each minimal prime Q of Λ_v the flag scheme over Λ_v/Q is flat integral of dimension 1+d²+fd(d+1)/2, and its reduction modulo the uniformizer is integral. Its image R△ is already flat and reduced. For integral R∈C_𝒪, a lift factors through R△ iff over an algebraic closure of Frac R it admits the ordered universal-inertia flag. For odd p, over distinct inertia characters the incidence projection is an isomorphism. For odd p and pairwise distinct specialised characters, fibres over characteristic-zero weight points are geometrically connected with dimension at most fd(d−1)/2+d²+d(d−1)/2; excluding cyclotomic ratios makes them regular of dimension fd(d−1)/2+d² and the ambient point regular of dimension fd(d+1)/2+d². Each R△/Q is geometrically irreducible, with generically reduced special fibre, and components correspond bijectively to those of Λ_v. At p=2 use only the extended flatness and component-correspondence clauses cited by BCGP25.

Prerequisites: [1.9](#t1-9); [1.4](#t1-4); [6.1](#t6-1); [6.12](#t6-12); [1.3](#t1-3).

Sources: [ACC+], §6.2.6, Proposition 6.2.10, p. 139; [BCGP25], Proposition 5.6.6 (3) and Remark 5.6.7, arXiv v1 p. 129; [THORNE15], Lemma 3.11, Corollary 3.12, Lemma 3.13, Proposition 3.14, pp. 16–17.

<a id="t6-25"></a>

### 6.25 Connectedness results for crystalline weight-zero lifts

Ordinary crystalline weight-zero lifts of trivial residual data connect through the irreducible ordinary crystalline ring. For any fixed crystalline weight-zero ρ, sufficiently close crystalline weight-zero lifts connect to it. In the source HT(ε)=−1 convention, weights 0,…,d−1 are ordinary exactly when φ^f Frobenius valuations are 0,f,…,(d−1)f, normalized by v(p)=1; here the HT weights have opposite signs. Symmetric powers and tensor products retain crystalline ordinary flags when the resulting labelled weights are distinct and have one compatible ordering at all embeddings; repeated weights do not satisfy the regular condition automatically.

Prerequisites: [6.8](#t6-8); [3.13](#t3-13); [3.10](#t3-10); [1.7](#t1-7); [6.12](#t6-12).

Sources: [BCGNT25], Lemma 5.1.4, arXiv p. 50; [BCGNT25], Lemma 5.1.5, arXiv p. 50; [BCGNT25], Proposition 4.2.5(2) and its proof, arXiv pp. 42–43; [Geraghty], Lemma 2.32 (preprint Lemma 2.7.7, pp. 27–28).

<a id="t6-26"></a>

### 6.26 Tangent dimension of the Siegel-ordinary condition and its comparison with finite flatness

The quotient 𝔟⁰/𝔲 has characters 1,1,λ(α)λ(β)⁻¹; 𝔲 has λ(α²)ε̄^{a−1},λ(β²)ε̄^{a−1},λ(αβ)ε̄^{a−1}. The standing nonvanishing hypotheses give h⁰(𝔲)=h²(𝔲)=0, h¹(𝔲)=3, h⁰(ad⁰/𝔟⁰)=0, the required H¹ surjection and injection, and dim L−h⁰(ad⁰)=3. At a=2 this condition is equivalent to finite flatness of the dual r∨≅r⊗ε, not of the original normalization without twisting.

Prerequisites: [6.14](#t6-14); `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`; ClassFieldTheory / layer 5 local coefficients the brauer group the local invariant and duality.

Sources: [CG20], Lemma 4.8 and its proof, published pp. 816–817; [CG20], Remark 4.7, published p. 816.

<a id="t6-27"></a>

### 6.27 p-distinguished weight-two ordinary GSp₄ conditions (B- and P-ordinary)

Over ℚ_p with p>2 and distinguished weight-two residual ordered unramified characters ᾱ≠β̄, construct the two Borel conditions distinguished by the first character ᾱ or β̄ over the two-variable weight algebra. On the one-variable diagonal-weight algebra require both orderings: this gives the subgroup P with zero (1,2),(3,4) entries and scalar inertia on the Lagrangian plane. P is the six-dimensional torus times Siegel unipotent radical, not the full Siegel parabolic. Give the ordinary lifting rings and the B/P-framed comparisons. These semistable ordinary lifts need not be crystalline.

API:

- `GSp4.IsPDistinguishedOrdinary`: The residual and lifted p-distinguished weight-2 ordinary shapes.
- `GSp4.BorelOrdinary`: 𝒟^{B,𝔠̄}_v over Λ_{v,2}, represented by R^{B,𝔠̄}_v.
- `GSp4.ParabolicOrdinary`: 𝒟^P_v over Λ_{v,1}, represented by R^P_v.
- `GSp4.partiallyFramed`: R^B and R^P are formally smooth over the B- and P-framed rings R^{B,◹}, R^{P,◹} (BCGP21 Lemma 7.3.12).
- `GSp4.BorelOrdinary.semistable`: The weight-two arithmetic finite-flat flag criterion gives semistability at that specialization.
- `ParabolicOrdinary.toBorel`: P-ordinary implies both Borel orderings after θ₁=θ₂, yielding quotient maps after weight base change. The converse fails for a ramified nonsplit Fil₂; generic dimensions are 14 and 15.

Worked checks:

- Λ_{v,2} = 𝒪⟦(1 + pℤ_p)²⟧ ≅ 𝒪⟦x₁, x₂⟧ for p > 2.
- ᾱ = β̄ is excluded: the residual Lagrangian plane then carries a two-dimensional unramified isotypic piece and the flag is not unique.
- When α²=1, the Kummer class of p gives a p-distinguished weight-two ordinary extension on the first/fourth subquotient that is semistable and noncrystalline.
- For p-distinguished ρ̄ the flag-incidence map of L7/gsp4-ordinary-flag-incidence is a closed immersion with image R^{B,𝔠̄}_v.

Prerequisites: [6.14](#t6-14); [1.17](#t1-17); [6.3](#t6-3); ClassFieldTheory / layer 7 the absolute local artin map its normalizations and conductors.

Sources: [BCGP21], Definition 7.3.1, arXiv v3 p. 172.

<a id="t6-28"></a>

### 6.28 Explicit rings R^{expl,∇} and the comparison diagram (3.9)

Construct the gauge-basis deformation chart and its monodromy quotient R̄^{expl,∇}=⊗̂_i R̄^{expl,∇}_{w_i}. For 10-generic semisimple ρ̄ and nonzero type quotient, τ is 7-generic and the residual Kisin module is unique. The étale φ-module comparison is a monomorphism under the stated 3-generic semisimple assumptions. The common framed gauge ring is formally smooth of relative dimension 3f over R̄^τ_ρ̄ and nine over the explicit chart; hence Irr(R̄^τ_ρ̄)≅∏_i Irr(R̄^{expl,∇}_{w_i}). There is no asserted algebra map from the explicit ring to R̄^τ_ρ̄ itself: their dimensions are 6f and 9+3f. Include the length-one and identity-shape equations below, with the necessary determinant coefficient and corrected p-saturation relations.

Use the following remaining chart equations, in addition to the length-two/three rows.

**Length one.** For αt₁, transport the other simple-root shapes by δ̃=(123)t_(0,0,−1). A^{(i)} = (c11, c12 + v c*12, c13; v c*21, c22 + v d22, c23; v c31, v c32, c33 + v c*33), c̃32 := (c32 c*21 − d22 c31)/c*21, and R̄^{expl,∇}_{𝔐̄,αt₁} is F⟦c11, c12, c13, c22, c23, c31, c̃32, c33, d22, c*12 − [c̄*12], c*21 − [c̄*21], c*33 − [c̄*33]⟧ modulo: c11 c23 = 0; c*33 c11 c̃32 = c13 c31 c̃32; (a − b) c11 d22 c*33 = (b − c) c*21 c13 c̃32; c13 c23 c̃32 = 0; c23 c31 c̃32 = 0; (a − b) c13 c31 d22 + (c − b) c13 c̃32 c*21 + (−1 − a + c) c23 c31 c*12 = 0; (a − b) c12 c*33 = (a − c) c13 c̃32; (−1 − a + b) c22 c*33 = (−1 − a + c) c23 c̃32; c*21 c33 = c31 c23 — the three-variable power-series extension of the corrected companion-ring presentation (LLHLM18, Proposition 8.11);

**Identity.** For t₁, A^{(i)} = (c11 + v c*11, c12, c13; v c21, c22 + v c*22, c23; v c31, v c32, c33 + v c*33), and R̄^{expl,∇}_{𝔐̄,t₁} is F⟦c_{jk} (1 ≤ j, k ≤ 3), c*_{kk} − [c̄*_{kk}]⟧ (twelve variables) modulo: c_{jj} c_{kk} = 0 (j ≠ k); c11 c23 = c31 c22 = c33 c12 = 0; c12 c23 = c22 c13; c11 c32 = c12 c31; c21 c33 = c31 c23; (−1 − a + c) c*22 c33 + (−1 − a + b) c22 c*33 − (−1 − a + c) c23 c32 = 0; (a − b) c*33 c11 + (−1 − b + c) c33 c*11 − (a − b) c13 c31 = 0; (b − c) c*11 c22 + (a − c) c11 c*22 − (b − c) c12 c21 = 0; and the cubic c11 c*22 c*33 + c22 c*11 c*33 + c33 c*11 c*22 − c*11 c23 c32 − c*22 c13 c31 − c*33 c12 c21 + c13 c32 c21 = 0 (the vanishing of the v² coefficient of det A^{(i)}), the three-variable power-series extension of the corrected dimension-three companion ring (LLHLM18, Corollary 8.4), giving dimension six.

For the identity chart include c₁₂c₃₃=0 and the cubic coefficient of det A. For the length-one chart the unit denominators a−b and −1−a+b are cleared using genericity. These saturation and determinant relations are part of the quotient.


API:

- `GL3.explicitRing`: R̄^{expl,∇}_{𝔐̄,w̃} for each shape w̃ (three cases by length).
- `GL3.comparisonDiagram`: The diagram (3.9) relating R̄^τ_ρ̄, explicit rings and étale φ-modules.
- `GL3.iotaPrime_mono`: For τ 3-generic and 𝔐̄ semisimple, ι′_τ : Ȳ^{η,τ}_{𝔐̄} → Φ-Mod^ét_{ℳ̄} is a monomorphism.
- `GL3.formallySmooth_over_explicit`: R̄^{τ,β̄,□}_{𝔐̄,ρ̄} is a power series ring in 3f variables over R̄^τ_ρ̄ and is formally smooth of relative dimension 9 over ⊗̂_i R̄^{expl,∇}_{𝔐̄,w̃_i}.
- `GL3.irr_bijection`: Irr(R̄^τ_ρ̄) ↔ Π_i Irr(R̄^{expl,∇}_{w̃_i}).

Worked checks:

- The twelve-variable identity chart has six minimal primes in its quotient ring, each of dimension six, as in the component list below.
- For shape α the explicit ring (the nine relations of (b)) has exactly 6 minimal primes (Table 3, row α).
- Length-four charts are power-series rings (solve the lone relation if present); lengths ≥2 are generically formally smooth over R_N.
- ι′_τ is a monomorphism; étale φ-deformations not arising from type-(η,τ) Kisin modules lie outside its image.

Prerequisites: [6.9](#t6-9); [1.1](#t1-1); [6.21](#t6-21).

Sources: [LLHLM20], §3.6.1, items (1)–(4) and diagram (3.9), published p. 49; arXiv v4 pp. 36–39; [LLHLM20], §3.6.1 item (4)(b)–(c), arXiv v4 p. 38 (relations for the shapes α and id; repeated on pp. 46 and 48 respectively).

<a id="t6-29"></a>

### 6.29 The GSp₄ ordinary flag-incidence scheme and its scheme-theoretic image R^△_v

For ordinary GSp₄ residual data over ℚ_p, any p, fix the p-stabilisation and multiplier ε̄⁻¹. The weight algebra has two universal inertial characters and its extension has two full Galois characters. In the symplectic full-flag variety impose graded characters χ̃₁,χ̃₂,ε⁻¹χ̃₂⁻¹,ε⁻¹χ̃₁⁻¹. Define R△ as the scheme-theoretic image in global functions without removing p-torsion. Integral points are exactly ordinary lifts with this stabilisation. Pairwise distinct residual graded characters make the flag unique and the incidence map a closed immersion. The lowering filtration on ad⁰ has dimensions 6,4,2,1,0. At p=2 the weight space has four components; its generic fibre is regular.

API:

- `GSp4.weightAlgebra`: Λ_{GSp₄,v} and Λ̃_{GSp₄,v} with their universal characters.
- `GSp4.ordinaryFlagScheme`: 𝒢_v ⊂ 𝓕 ×_𝒪 Spec R_v.
- `GSp4.ordinaryFlagScheme_proper`: 𝒢_v → Spec R_v is proper.
- `GSp4.ordinaryImage`: R^△_v, the scheme-theoretic image (no flat closure).
- `GSp4.ordinaryImage_points`: 𝒪_{E′}-points of Spf R^△_v are the ordinary lifts with the given p-stabilisation.
- `GSp4.ordinaryFlagScheme_closedImmersion`: Residually p-distinguished ⟹ 𝒢_v → Spec R_v is a closed immersion.
- `GSp4.ordinaryFlagScheme.points`: Incidence points classify fixed-similitude framed lifts with stable isotropic full flags and ordered universal characters, naturally in coefficients.

Worked checks:

- p = 2: Spec Λ_{GSp₄,v} has 4 irreducible components (from (ℤ/2)² ⊂ (ℤ₂^×)²) and regular generic fibre.
- dim Fil^i ad⁰ρ_x = 6, 4, 2, 1, 0 for i = 0, …, 4.
- R^△_v may have p-torsion; replacing it by its flat closure changes the ring when 𝒢_v is not 𝒪-flat.
- For p > 2 and ρ̄ p-distinguished of weight 2 (unramified residual characters χ̄₁ ≠ χ̄₂), R^△_v is the ring R^{B,𝔠̄}_v of L7/gsp4-borel-ordinary-conditions.

Prerequisites: [1.17](#t1-17); [1.9](#t1-9); [6.27](#t6-27); ClassFieldTheory / layer 7 the absolute local artin map its normalizations and conductors.

Sources: [BCGP25], §6.2, arXiv v1 p. 142; [BCGP25], §6.2, arXiv v1 p. 143.

<a id="t6-30"></a>

### 6.30 Potentially crystalline deformation rings of GL₃ in parallel weight (2, 1, 0)

For 10-generic semisimple residual GL₃ data over unramified K and Hodge type η=(2,1,0), a tame type not 1-generic gives the zero ring. A nonzero 1-generic type ring is a normal Cohen–Macaulay domain with reduced special fibre, formally smooth special-fibre components of equal dimension and component count #W?(ρ̄,τ). Nonemptiness is equivalent to W?(ρ̄,τ)≠∅. For semisimple residual data and 5-generic τ with the stated Deligne–Lusztig presentation and all admissible shapes of length >1, a local proof gives nonemptiness and Π_j2^{4−ℓ(w_j)} components. For shapes of length zero or one, and for the uniform all-type statement, the weak minimal patching functor and weight-elimination input are additional prerequisites; genericity alone does not supply that functor.

Prerequisites: [6.9](#t6-9); [6.20](#t6-20); [6.28](#t6-28); [3.4](#t3-4); `DeformationAndDerivedPatchingAlgebra:R03.3`.

Sources: [LLHLM20], Theorem 3.5.3, published p. 38; [LLHLM20], Lemma 3.5.4, published p. 38; [LLHLM20], §3.5.3, proof of Theorem 3.5.3 and Remark 3.5.17, arXiv v4 p. 34; Theorem 3.5.2 and Proposition 3.5.15, arXiv v4 pp. 29, 33.

<a id="t6-31"></a>

### 6.31 Regularity of the GSp₄ ordinary flag scheme at characteristic-zero points

At a flagged closed characteristic-zero point over ℚ_p, H²(G_K,Fil⁰ad⁰ρ_x)=0 is equivalent to H⁰(G_K,(ad⁰ρ_x/Fil¹ad⁰ρ_x)(1))=0. It gives a regular point on a unique component of dimension sixteen. Sufficient conditions are none of χ̃₁²ε, χ̃₂²ε, χ̃₁χ̃₂ε, χ̃₁χ̃₂⁻¹ equalling ε; purity with distinguished characters; or purity with potential crystallinity. Transfer this regularity to the image ring only when the point is distinguished. Without that assumption the conclusion remains about the flagged point.

Prerequisites: [6.29](#t6-29); [1.18](#t1-18); [1.22](#t1-22); ClassFieldTheory / layer 5 local coefficients the brauer group the local invariant and duality; [6.1](#t6-1).

Sources: [BCGP25], Lemma 6.2.2, arXiv v1 p. 143.

<a id="t6-32"></a>

### 6.32 Formal smoothness of the finite-flat ordinary flag scheme for GSp₄

For p>2 over ℚ_p, ordinary residual data with ρ̄⊗ε̄ finite flat, cut out the incidence locus where ρ⊗ε is finite flat and inertia is trivial on the Lagrangian plane. Prove formal smoothness of its completion at every finite residue extension point by the finite/unit extension argument, extended to the three Siegel coordinates. Its closed residual flag fibre is a point or ℙ¹, so its image is irreducible. State the formal smoothness itself rather than inventing an undefined H²_flat carrier.

Prerequisites: [6.29](#t6-29); [1.1](#t1-1); `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`; ProfiniteCohomology / layer 9 the galois interface hilbert 90 and kummer theory.

Sources: [BCGP25], proof of Lemma 6.2.5, arXiv v1 p. 145.

<a id="t6-33"></a>

### 6.33 Labelling of components of GL₃ potentially crystalline rings by Serre weights

For 10-generic semisimple ρ̄, construct the unique prime assignment σ↦𝔭(σ) in R□ whose images are the special-fibre type-ring components for σ∈W?(ρ̄,τ). Use the explicit chart/component bijections to label them by the Table 3 primes. Matching Frobenius matrices A=A′z̃ modulo intersections of primes yields the same ideal of R̄□ after the compatible gauge normalization. The minimal type of σ is τ(sz*,μ+sz̃*(0)), its shape satisfies w(τ′)z̃=w(τ), and its weight set is contained in that of τ. For all shapes of length≥2, the node-coordinate primes select x_j or y_j in N=Σ_i(4−ℓ(w_i)) slots; the symmetric difference has cardinality 2d_gph(σ₁,σ₂). The nine-vertex, fifteen-edge extension graph and prime lists are given below. The existence of the uniform prime assignment uses the stated weak patching input; local ideal matching and distance computations do not.

These are the remaining prime generators in the explicit quotient rings.

**Simple-root chart α.** Use these label/ideal pairs: (ε1, 1): (c11, c13, c31);
(ε2, 0): (c11, c31, c*21 c̃32);
(ε2, 1): (c11, c*21 c̃32, (a − b) c13 d22 + (−1 − a + c) c23 c*12);
(ε2 − ε1, 0): (c23, d22, c*21 c̃32);
(0, 0): (c11, c13, c23);
(0, 1): (c11 c*33 − c13 c31, c23, (a − b) c31 d22 + (c − b) c*21 c̃32).

**Identity chart.** Use these label/ideal pairs: (ε1, 0): (c11, c22, c33, c21, c31, c23);
(ε1, 1): (c31, c33, c11, (−1 − a + c) c32 c13 − (−1 − a + b) c12 c*33, c21 c13 − c23 c*11);
(ε2, 0): (c11, c22, c33, c12, c31, c32);
(ε2, 1): (c12, c22, c11, (a − b) c21 c13 − (−1 − b + c) c23 c*11, c21 c32 − c31 c*22);
(0, 0): (c11, c22, c33, c13, c23, c12);
(0, 1): (c23, c33, c22, (b − c) c21 c32 − (a − c) c31 c*22, c32 c13 − c12 c*33).

**Extension graph.** Its vertices are (ε₁+ε₂,0), (ε₁−ε₂,0), (ε₂−ε₁,0), (0,0), (ε₁,0), (ε₂,0), (0,1), (ε₁,1), (ε₂,1). Join each of (0,0),(ε₁,0),(ε₂,0) to each of (0,1),(ε₁,1),(ε₂,1). Add the six edges from (ε₁+ε₂,0) to (ε₁,1),(ε₂,1), from (ε₁−ε₂,0) to (ε₁,1),(0,1), and from (ε₂−ε₁,0) to (ε₂,1),(0,1). This gives fifteen edges. The product over embeddings has the graph distance used above. Length-two, three and four shapes give respectively a four-cycle, an edge and a point. In the identity-chart matching for (0,0), use z̃=t_{(−1,0,1)}. The codimension calculation sums the two prime ideals.


Prerequisites: [6.21](#t6-21); [6.28](#t6-28); [6.30](#t6-30).

Sources: [LLHLM20], Proposition 3.6.1, published p. 46; [LLHLM20], Theorem 3.6.4, published p. 55; [LLHLM20], Lemma 3.6.10, published p. 59 (arXiv v4 p. 43), with Definition 2.1.6 and Table 1 (arXiv v4 pp. 12, 17); [LLHLM20], Remark 3.6.8, arXiv v4 pp. 41–42; [LLHLM20], Proposition 3.6.9 and Lemma 3.6.6, Corollary 3.6.7, arXiv v4 pp. 40–42; Table 2, arXiv v4 p. 18.

<a id="t6-34"></a>

### 6.34 Generic fibres of the GSp₄ ordinary rings: irreducibility, dimension and smooth pure points

For the preceding distinguished residual problems, the Borel and diagonal-weight ordinary generic fibres are irreducible of dimensions sixteen and fourteen. The universal P-ring and its weight specialisation are complete intersections with connected characteristic-zero fibres and nonsmooth locus of codimension at least two; their dimensions are fifteen and fourteen. The P-framed ring is the completed tensor product of three GL₂ ordinary subquotient rings. The Borel H² exceptional cases are listed below, with dimension at most one except the simultaneous double exception, where it is two. Pure distinguished closed points are smooth, using the symplectic dual-quotient argument. In the double exception the integral Borel ring is not asserted flat or to have complete-intersection special fibre.

Write the residual Siegel extension classes as η_{α²},η_{β²},η_{αβ}. The only possible nonzero Borel obstruction cases are:

- η_{αβ}=η_{α²}=0 and ᾱ²=1;
- η_{β²}=0 and β̄²=1; if the first case also holds then h²=2, while outside it h²=1 and the obstruction is identified with the GL₂ Borel obstruction of W=λ_β̄⊗(1⊕ε̄⁻¹);
- η_{αβ}=η_{β²}=0 and ᾱβ̄=1.

The list supplies necessary conditions, without asserting a converse for every listed datum. For smooth pure points, duality uses the quotient ad⁰/Fil¹ad⁰, rather than treating the dual of the Borel as a submodule of ad⁰. In the dimension estimates use relative dimension twelve over the GL₂ Borel ring in case (2b), complement dimension at most thirteen in case (2a), and codimension three in the indicated P comparison.


Prerequisites: [6.27](#t6-27); [6.15](#t6-15); [1.18](#t1-18); [1.22](#t1-22); ClassFieldTheory / layer 5 local coefficients the brauer group the local invariant and duality; [6.31](#t6-31).

Sources: [BCGP21], Proposition 7.3.4, arXiv v3 p. 173; [BCGP21], Proposition 7.3.16, arXiv v3 p. 183; [BCGP21], Lemma 7.3.18, arXiv v3 p. 188.

<a id="t6-35"></a>

### 6.35 Finite-flat ordinary weight-two lifts lie on one component

For p>2 and finite-flat ρ̄⊗ε̄, all ordinary pure crystalline weight-two lifts lie on one component of R△, each on a unique component of relative dimension sixteen. If a component R△/Q surjects onto weight space, some minimal prime of R△/(p) contains Q and no other generic minimal prime, and that component has relative dimension sixteen. Surjectivity to weight space is a hypothesis, not a conclusion for every component.

Prerequisites: [6.31](#t6-31); `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`; [6.32](#t6-32).

Sources: [BCGP25], Lemma 6.2.5, arXiv v1 p. 145.

## Layer 7: Determinant-ordinary equations and flag comparisons

Characteristic polynomials, ordered products and flag incidence give three related interfaces. Compare reduced spaces over the distinct-character open and keep the collision-locus dimension bound. The eigenvalue doubling computation is the rank-two image/flag example.

<a id="t7-1"></a>

### 7.1 The determinant-ordinary rings R̃^{det,ord}_v and R^{det,ord}_v

Over Λ̃ impose both det(X−ρ(g))=∏_i(X−χ̃_i(g)) for every g and the ordered products (ρ(g₁)−χ̃₁(g₁))⋯(ρ(g_d)−χ̃_d(g_d))=0 for every tuple. Define R̃^{det,ord} by this quotient and R^{det,ord} as the image of R□ after forgetting the Frobenius characters. Give the factorisation criterion by vanishing of all coefficients and matrix entries, compatible with coefficient maps. The two sets of equations are independent over nonreduced rings; never replace the definition by the characteristic-polynomial equations alone.

API:

- `detOrdTilde`: R̃^{det,ord}_v, the quotient by (6.2.7)–(6.2.8).
- `detOrd`: R^{det,ord}_v = im(R^□_v → R̃^{det,ord}_v).
- `detOrdTilde_charpoly`: (6.2.7) holds over R̃^{det,ord}_v.
- `detOrdTilde_product`: (6.2.8) holds over R̃^{det,ord}_v.
- `detOrd_universal`: R^□_v → R factors through R^{det,ord}_v when R ↪ S carries characters ψ_i with the relations.
- `detOrdTilde.factor_iff`: Factoring through the quotient is equivalent to vanishing of all coefficients of (6.2.7) and all ordered entries of (6.2.8), naturally in A.

Worked checks:

- n = 1: (6.2.7) says ρ^□ = χ̃_1^univ and (6.2.8) is the same relation.
- A diagonal lift diag(χ̃_1, …, χ̃_n) satisfies (6.2.7) and (6.2.8).
- Over ℤ/9, M=diag(4,7), U=(1 1;0 1) generate a group with every characteristic polynomial (X−1)², yet (M−I)(U−I)=(0 3;0 0). The ordered-product equations are independent constraints.

Prerequisites: [1.1](#t1-1); [1.3](#t1-3).

Sources: [ACC+], §6.2.6, p. 138; [ACC+], §6.2.6, p. 139.

<a id="t7-2"></a>

### 7.2 R̃^{det,ord}_v is finite over R^{det,ord}_v

The extended determinant-ordinary ring R̃^{det,ord} is a finite module over its image R^{det,ord}. Each added Frobenius character satisfies a monic characteristic-polynomial equation, which supplies the finite generators. Finiteness is over the image lifting ring, not over weight space.

Prerequisites: [7.1](#t7-1); `Module.Finite` (Mathlib).

Sources: [ACC+], §6.2.6, Lemma 6.2.9, p. 139.

<a id="t7-3"></a>

### 7.3 Point criteria and Spec R^△_v ⊂ Spec R^{det,ord}_v

If a lift over R acquires ordered characters satisfying both determinant-ordinary equations in an injective coefficient extension R↪S, it factors through R^{det,ord}. Therefore the underlying flag-image locus is contained in the determinant-ordinary locus and there is a universal-ring-compatible surjection R^{det,ord}→(R△)_red. This gives the reduced comparison, not an isomorphism of the unreduced rings.

Prerequisites: [7.1](#t7-1); [1.9](#t1-9).

Sources: [ACC+], §6.2.6, p. 139.

<a id="t7-4"></a>

### 7.4 Characteristic polynomials and ordered products give a flag

Over a field, a rank-d representation with pairwise distinct prescribed characters, their characteristic-polynomial identities and every ordered-product identity admits a stable full flag with those ordered graded characters. Use the distinct-character separation in the induction proof. This is a field theorem and does not recover an integral flag over an arbitrary nonreduced ring.

Prerequisites: [7.1](#t7-1).

Sources: [ACC+], §6.2.6, Lemma 6.2.11, p. 140.

<a id="t7-5"></a>

### 7.5 The doubling ideal equals the unramified ideal (Calegari–Geraghty Lemma 3.22)

For the ordinary rank-two eigenvalue ring, let ϖ^m be the common divisibility of χ^{n−1}(g)−1. Its unramified quotient is (𝒪/ϖ^m)[[φ₁,…,φ₄]]/(φ₁+φ₄+φ₁φ₄−φ₂φ₃); adjoining β by β²−(φ₁+φ₄)β−(φ₁+φ₄) makes a rank-two free module. The quotient by the image copy is a faithful rank-one module over the unramified quotient. Conclude J=I: the annihilator of R̃†/R† equals the kernel defining the unramified quotient in the universal framed ring.

Prerequisites: [6.7](#t6-7); [7.1](#t7-1).

Sources: [CG18], Lemma 3.22, published p. 335; [CG18], proof of Lemma 3.22, published pp. 336–337.

<a id="t7-6"></a>

### 7.6 Determinant-ordinary versus flag-ordinary components

For trivial residual data and f=[K:ℚ_p]>d(d+1)/2+1, let U be the distinct-character open in Λ. The flag and determinant-ordinary loci agree over U as underlying subspaces of Spec R□. Every component of weight space is dominated by exactly one determinant-ordinary component of dimension 1+d²+fd(d+1)/2. Any other component lies over the collision locus and has dimension at most d²−1+fd(d+1)/2. Retain this stronger degree bound than the flag-ring theorem and the topological/reduced nature of the comparison.

Prerequisites: [7.3](#t7-3); [7.4](#t7-4); [7.2](#t7-2); [6.24](#t6-24); [1.4](#t1-4); [6.1](#t6-1).

Sources: [ACC+], §6.2.6, Proposition 6.2.12, p. 140; [ACC+], §6.2.6, proof of Proposition 6.2.12, p. 141.

## Layer 8: Local interfaces for lifting and patching

These results package the preceding local rings for global lifting and patching consumers. They state nonemptiness, relative dimension, regularity and dependence on selected characters. Global theorems consume these exports through their own deformation problems.

<a id="t8-1"></a>

### 8.1 Smooth resolutions of framed deformation conditions

Let a nonzero framed condition quotient admit a proper map f from a flat 𝒪-scheme ℛ, with injective map 𝒪_{Spec R}→f_*𝒪_ℛ, closed immersion into the unrestricted generic fibre, geometrically connected closed-point fibre Y, and a smooth finite-type algebraization inducing an isomorphism of completions along all of Y. Then R is a domain, R[1/p] is regular, and its relative dimension equals that of ℛ; integral points are images of resolution points specializing into Y. Formal smoothness at individual closed points alone is not the whole algebraization hypothesis. The Kisin variant additionally uses reduced special fibre. Formal functions, Stein factorization and excellence supply the algebraic proof.

Prerequisites: `AdicSpacesPartII:F0/theorem-on-formal-functions`; `DeformationAndDerivedPatchingAlgebra:R03.3`.

Sources: [KW209], §2.8, Proposition 2.12 and its proof, pp. 16–18.

<a id="t8-2"></a>

### 8.2 The local conditions of KW II

For rank two over a totally real field, fix determinant φ=ψχ_p and the local choices: odd at infinity; low-weight crystalline, ordinary endpoint or prescribed weight-two type above p; fixed-character semistable or inertia-rigid away from p. The p-adic local field is unramified, and is ℚ_p in the irreducible and crystalline endpoint branches. Define each quotient as the reduced flat closure of its selected points. The chosen unramified quotient character, semistable γ and reference inertia lift ρ₀ are data. In the abelian split-distinct case selecting one graded character selects one component; the union of both choices need not be a domain.

Above p, low weight means crystalline of residual Serre weight k≤p, or ordinary of weight p+1. For odd p the weight-two WD parameter is (ω^{k−2}⊕1,0), or (1,N≠0) at k=p+1; for p=2 use crystalline weight two at k=2 and semistable weight two at k=4. At p, the fixed-character semistable shape is (γχ_p,*;0,γ), with γ unramified. Inertia-rigid lifts are conjugate on inertia to ρ₀; the split-distinct branch fixes its upper-triangular graded character. Retain F_v=ℚ_q in the level-two branch.

API:

- `KWCondition`: A KW II local condition at v, with its choices.
- `KWCondition.ring`: R̄^{□,ψ}_v as the flat reduced quotient classifying X_v-lifts.
- `KWCondition.points`: 𝒪′-points of the ring are exactly the X_v-lifts.
- `KWCondition.ring_unique`: With all local choices fixed, equal characteristic-zero point kernels give a unique compatible isomorphism of reduced flat quotients.

Worked checks:

- Odd lifts at a real place.
- The ring classifies exactly the X_v-lifts on 𝒪′-points.
- For distinct unramified residual characters, allowing either quotient character gives two components; fixing KW's choice selects one.

Prerequisites: [1.1](#t1-1); [1.10](#t1-10); [3.1](#t3-1).

Sources: [KW209], §3 opening and §3.2.2, pp. 18 and 22–24.

<a id="t8-3"></a>

### 8.3 irreducible residual representation, low-weight crystalline

For F_v=ℚ_p and irreducible rank-two residual representation of Serre weight k≤p, the compatible fixed-determinant crystalline ring has unframed relative dimension one and framed relative dimension four, both formally smooth. Include p=2,k=2 and the k=p endpoint through the irreducible filtered-module classification. This extension of the usual Fontaine–Laffaille range needs that classification; the multiplicity-free small-range theorem by itself does not cover the endpoints.

Prerequisites: [1.5](#t1-5); [1.13](#t1-13).

Sources: [KW209], §3.2.3, p. 24.

<a id="t8-4"></a>

### 8.4 irreducible residual representation, weight two

For odd p, F_v=ℚ_p and irreducible residual Serre weight 3≤k≤p, use the nontrivial principal-series weight-two type ω^{k−2}⊕1. After the required coefficient extension and unit rescaling, its unframed ring is 𝒪[[T₁,T₂]]/(T₁T₂−p), and the framed ring adds three variables. It is a flat domain of relative dimension four with regular generic fibre, but is not formally smooth over 𝒪. At k=2 the type is trivial, so the preceding smooth crystalline ring applies instead of Savitt's distinct-character formula.

Prerequisites: [4.2](#t4-2); [1.5](#t1-5).

Sources: [KW209], §3.2.4, p. 24.

<a id="t8-5"></a>

### 8.5 Ordinary potentially crystalline local lifts of reducible residual representations

For p≥3 and global residual (χ̄,*;0,1) with geometric determinant μ=κ^{r−1}χ₀, r≥2, construct at v|p an ordinary potentially crystalline lift of weights {0,r−1} and determinant μ after coefficient extension. There also exists such a lift with nontrivial unramified quotient, but its determinant need not still be μ. Ordinary means ordinary after a fixed finite local extension in the group-valued condition. In the weight-two Barsotti–Tate example use a Kummer unit class; a uniformizer class produces semistable noncrystalline monodromy.

Prerequisites: [1.21](#t1-21); [1.10](#t1-10); `PadicHodgeTheory:R06.4/ordinary-implies-semistable`; ClassFieldTheory / layer 5 local coefficients the brauer group the local invariant and duality.

Sources: [FKP22], Lemma 7.2, second bullet, arXiv v5 p. 34.

<a id="t8-6"></a>

### 8.6 Deformation conditions cut out by a category S (BCDT §4.3)

For a Schur residual module V, let S(ρ̄) consist of finite-length coefficient Galois modules whose composition factors are V. A full subcategory S containing V and closed under isomorphism, finite products, subobjects and quotients defines a deformation condition by requiring every open-ideal quotient of a lift to lie in S. Construct its universal unframed quotient, with and without fixed determinant. Its tangent is Ext¹_S(V,V), or H¹_S(G_K,ad⁰ρ̄) with fixed determinant. Inclusion S⊆T gives a compatible surjection R^T→R^S; the finite-flat subcategory recovers Layer 4.

API:

- `CategoryCondition`: A full subcategory S ⊂ S(ρ̄) closed under isomorphism, finite products, subobjects and quotients, containing V.
- `CategoryCondition.defFunctor`: D^S_{V,𝒪} and D^{ψ,S}_{V,𝒪}.
- `CategoryCondition.ring`: R^S_{V,𝒪}, R^{ψ,S}_{V,𝒪}, quotients of R_{V,𝒪}, R^ψ_{V,𝒪}.
- `CategoryCondition.tangent`: Tangent space of D^{ψ,S} is H¹_S(G_ℓ, ad⁰ρ̄) ⊂ H¹(G_ℓ, ad⁰ρ̄).
- `CategoryCondition.flat`: For S the finite flat modules, D^S is R08.4/flat-deformation-condition.
- `CategoryCondition.mono`: S⊂T induces R^T↠R^S, compatibly with the same residual object, determinant and universal lifts.

Worked checks:

- S = S(ρ̄): R^S_{V,𝒪} = R_{V,𝒪}.
- S = finite flat 𝒪[G_ℓ]-modules (ℓ = p): R^S is the flat deformation ring.
- The category {0,V} fails product closure since V⊕V is missing.
- For p odd, S = finite flat, ρ̄ peu ramifié of weight 2 over ℚ_p: dim H¹_S(G_p, ad⁰ρ̄) = 1 + dim H⁰(G_p, ad⁰ρ̄).

Prerequisites: [4.1](#t4-1); [1.5](#t1-5); `GlobalGaloisDeformations:R04.3/local-deformation-problem`.

Sources: [BCDT01], §4.3, p. 874; author manuscript pp.27–28 (§4.3).

<a id="t8-7"></a>

### 8.7 odd archimedean rings

Export the odd real quadric ring as a flat domain of relative dimension two with regular generic fibre. It is formally smooth when the residual involution is not the identity (always for odd p). At p=2 and identity residual involution it is the hypersurface 𝒪[[X,Y,Z]]/(X²+2X+YZ). Identify the chosen determinant quotient and its universal involution with Layer 1's construction.

Prerequisites: [1.11](#t1-11); [1.14](#t1-14); [8.1](#t8-1).

Sources: [KW209], Proposition 3.3 and the Remark after it, pp. 20–21.

<a id="t8-8"></a>

### 8.8 rings at finite places away from p

For fixed-character semistable extensions away from p, export a flat domain of relative dimension three with regular generic fibre. For inertia-rigid conditions, after splitting coefficients and fixing the reference inertia representation, export a flat ring with every component of relative dimension three and regular generic fibre. It need not be a domain. The nonabelian level-two case assumes F_v=ℚ_q, and the abelian split-distinct condition selects one component as specified above.

Prerequisites: [2.5](#t2-5); [2.3](#t2-3); `GlobalGaloisDeformations:R04.4/inertia-rigid-deformations`; [8.1](#t8-1); ClassFieldTheory / layer 5 local coefficients the brauer group the local invariant and duality; [5.9](#t5-9).

Sources: [KW209], Theorem 3.1 and §3.3, pp. 18–19 and 32–37.

<a id="t8-9"></a>

### 8.9 ordinary rings of low weight or weight two

For unramified F_v, ordinary residual data with Serre weight k≤p, and the selected quotient character, the low-weight crystalline or weight-two potentially Barsotti–Tate ring is a flat domain of relative dimension 3+[F_v:ℚ_p] with regular generic fibre. It is formally smooth if the residual representation is ramified or split with two distinct unramified characters. Every selected lift is (χ₁η₁,*;0,η₂), η_i unramified, with χ₁=χ_p^{k−1} or χ_pω^{k−2}. The scalar unramified case uses the projective-line resolution and may be nonnormal as well as nonsmooth; domain does not imply normality.

Prerequisites: [8.2](#t8-2); [8.1](#t8-1); [3.9](#t3-9); [1.13](#t1-13); [4.3](#t4-3); [4.4](#t4-4); [5.4](#t5-4).

Sources: [KW209], §3.2.5, Proposition 3.6, Lemma 3.7 and their proofs, pp. 24–30; [KW209], Lemma 3.5, p. 22.

<a id="t8-10"></a>

### 8.10 A crystalline lift in Serre weight

For p≥3 and rank-two residual (χ̄,*;0,1) over ℚ_p, construct a crystalline lift in its Serre weight r with weights {0,r−1}. It can be chosen ordinary with unramified quotient using the preceding existence statement. The residual shape is essential: a representation with no unramified quotient cannot be the reduction of such a quotient-bearing lift.

Prerequisites: `PadicHodgeTheory:R06.4/weight-p-endpoint-branch`; [5.5](#t5-5); [8.5](#t8-5).

Sources: [FKP22], Lemma 7.2, third bullet, arXiv v5 p. 34.

<a id="t8-11"></a>

### 8.11 The good-dihedral local condition at q ≡ −1 mod p

At q≠p with p|q+1 and residual cyclotomic-extension shape up to unramified twist, choose a conjugate pair χ′,χ′^q of level-two tame characters of p-power order, with the dyadic parity constraint. Fixed-determinant induced lifts give a nonempty flat ring of relative dimension three and regular generic fibre. For odd p use nontrivial powers of ω_{q,2}^{(q²−1)/p^r}, r=v_p(q+1); at p=2 require r≥2 and order at least four with the specified parity. No such dyadic character exists when r=1. For q odd, i+j=q−1 makes i−j even, excluding the adjacent-index case; q=2,p=3 gives (i,j)=(1,0). In the residual-trivial case retain the source's chosen integral triangular basis; equality of generic inertia types alone need not select that integral condition.

Prerequisites: [8.8](#t8-8); `GlobalGaloisDeformations:R04.4/inertia-rigid-deformations`; [1.10](#t1-10).

Sources: [KW109], Theorem 5.1 (4), author copy pp. 9–10; [KW109], Remarks after Theorem 5.1, p. 10.

<a id="t8-12"></a>

### 8.12 Local quotients for weight-two symmetric power lifting (Newton–Thorne §4)

After the specified soluble base change, residual data are trivial and determinant ε⁻¹. Nonordinary crystalline, ordinary crystalline and, for p>2, noncrystalline semistable quotients at p are domains of dimension 4+f. Fixed-character extension rings away from p have dimension four; odd-real rings dimension three. The weight-two source convention translates to {0,−1} here.

Prerequisites: [4.14](#t4-14); [4.13](#t4-13); [6.6](#t6-6); [8.8](#t8-8); [1.11](#t1-11); [5.13](#t5-13); [5.2](#t5-2); [5.3](#t5-3); [1.14](#t1-14).

Sources: [NT26], §4, after Theorem 4.1, arXiv v2 p. 27; [NT26], §4, after Theorem 4.1, p. 27.

<a id="t8-13"></a>

### 8.13 semistable weight-two rings above p

With unramified F_v and fixed unramified γ satisfying γ²χ_p=φ, export the semistable extension ring. It is formally smooth of relative dimension 3+[F_v:ℚ_p] except in the dyadic residual-homothety case, where it is a faithfully flat domain of that relative dimension with regular generic fibre. Fixing γ and φ forbids adding a free unramified-twist variable.

Prerequisites: [8.1](#t8-1); [8.9](#t8-9); [5.6](#t5-6).

Sources: [KW209], §3.2.6, pp. 30.

<a id="t8-14"></a>

### 8.14 Torsion semistable lifts with Hodge–Tate weights in {0, 1} form a stable condition

Rank-two torsion semistable objects are subquotients of stable lattices in semistable ℚ_p-representations of the specified weight-{0,1} convention. Subobject, quotient and sum closure gives a fixed-determinant deformation quotient; the crystalline and noncrystalline semistable quotients factor through it.

Prerequisites: [8.12](#t8-12); [4.1](#t4-1); [6.6](#t6-6).

Sources: [NT26], proof of Lemma 4.2, arXiv v2 pp. 28–29.

<a id="t8-15"></a>

### 8.15 crystalline lifts of weight p + 1

For odd p, F_v=ℚ_p and the residual Serre-weight p+1 branch, crystalline weight-p+1 lifts equal ordinary lifts. The compatible fixed-determinant framed ring is formally smooth of relative dimension four. Retain the nonsmoothness of its stable-line character morphism. This is the endpoint ring comparison of Layer 5, with its complete ordinarity criterion.

Prerequisites: [8.13](#t8-13); [5.5](#t5-5); ClassFieldTheory / layer 5 local coefficients the brauer group the local invariant and duality.

Sources: [KW209], §3.2.7 and the Remark, pp. 31–32.

<a id="t8-16"></a>

### 8.16 The dyadic weight-two transition: k(ρ̄) = 2 versus k(ρ̄) = 4 at p = 2

For p=2, the KW weight-two condition is crystalline/Barsotti–Tate for residual Serre weight two and semistable with nonzero monodromy for residual Serre weight four. The mod-two cyclotomic character does not distinguish these cases; N does. At weight two use the irreducible smooth ring over ℚ₂ or the selected reducible ordinary ring over an unramified extension. At weight four the residual extension is très ramifiée, so it is not a homothety and the semistable ring is formally smooth of relative dimension 3+[F_v:ℚ₂]. Trivial residual data cannot have Serre weight four here.

Prerequisites: [5.6](#t5-6); [8.13](#t8-13); [8.1](#t8-1); [8.3](#t8-3); [8.9](#t8-9).

Sources: [KW209], §3.2.2 (i), author copy p. 23; [KW109], Theorem 5.1 (2), p. 9.

<a id="t8-17"></a>

### 8.17 the completed tensor product of KW II's local rings

For the selected KW conditions at a finite set S containing all real and p-adic places of a totally real field, the completed tensor product of the local fixed-determinant framed rings is flat, with all components of relative dimension 3|S| and regular generic fibre. If all finite away-from-p conditions are semistable, it is a domain. After finite coefficient extension it has an integral point. Use the completed-tensor-product and geometric-domain results of R03, rather than rebuilding them here; for ℚ and S={∞,p}, the dimensions add as 2+4=6.

Prerequisites: [8.7](#t8-7); [8.9](#t8-9); [8.8](#t8-8); `DeformationAndDerivedPatchingAlgebra:R03.3`; [8.2](#t8-2); [8.3](#t8-3); [8.4](#t8-4); [8.13](#t8-13); [8.15](#t8-15).

Sources: [KW209], Proposition 3.2, p. 19.

<a id="t8-18"></a>

### 8.18 Nonemptiness of KW II's local rings

For every KW condition satisfying Theorem 3.1's hypotheses and local choices, construct an integral lift after finite coefficient extension. Hence its ring and their completed tensor product are nonzero. General fixed-type quotients can instead be zero.

Prerequisites: [8.2](#t8-2); [8.17](#t8-17); [8.8](#t8-8); [8.9](#t8-9); `DeformationAndDerivedPatchingAlgebra:R03.3`.

Sources: [KW209], Theorem 3.1, p. 19.

<a id="t8-19"></a>

### 8.19 The local conditions of KW I Theorem 5.1

Export the four local patterns for KW I's compatible-system construction: minimal away from p with the selected crystalline weight at p; minimal away from p with prescribed weight-two inertia/monodromy at p; the same with a chosen nontrivial tame character at q∥N, p|q−1; and the good-dihedral condition at q≠p, p|q+1. Supply the relevant quotient, tangent condition, point existence and dimensions (three away from p and 3+[F_v:ℚ_p] above p). Characters of p-power order require enlarged coefficient integers containing the roots of unity; they need not be ℤ_p-valued. The compatible-system and global irreducibility conclusions remain with their global owner.

Prerequisites: [8.8](#t8-8); [8.9](#t8-9); [8.3](#t8-3); [8.4](#t8-4); [8.13](#t8-13); [8.15](#t8-15); [8.18](#t8-18); [5.7](#t5-7); [2.8](#t2-8).

Sources: [KW109], Theorem 5.1, author copy p. 9.

## References and numbering

Locators in the layers refer to the version linked here. Journal numbers are included where the original manuscript and publication differ. A number concordance identifies a result; it does not identify two texts word for word.

- **Gee22**. Toby Gee, [Modularity lifting theorems](https://arxiv.org/pdf/2202.05818v2). Essential Number Theory 1 (2022), 73–126. Locators use arXiv:2202.05818v2, 45 pages.

- **KisinNotes**. Mark Kisin, [Lectures on deformations of Galois representations (Lecture 1)](https://people.math.harvard.edu/~kisin/notes/notes.pdf). Harvard author lecture notes, Lecture 1, four pages.

- **TUNG21**. Shen-Ning Tung, [On the modularity of 2-adic potentially semi-stable deformation rings](https://arxiv.org/pdf/1908.06174v3). Math. Z. 298 (2021), 107–159. Locators use arXiv:1908.06174v3.

- **CHT08**. Laurent Clozel, Michael Harris and Richard Taylor, [Automorphy for some l-adic lifts of automorphic mod l Galois representations](https://www.numdam.org/item/10.1007/s10240-008-0016-1.pdf). Publ. Math. IHÉS 108 (2008), 1–181. Numdam open-access article; article page equals PDF page.

- **TaylorII**. Richard Taylor, [Automorphy for some l-adic lifts of automorphic mod l Galois representations. II](https://www.numdam.org/item/10.1007/s10240-008-0015-2.pdf). Publ. Math. IHÉS 108 (2008), 183–239. Numdam article pages equal PDF pages plus 182.

- **KisinPST**. Mark Kisin, [Potentially semi-stable deformation rings](https://www.ams.org/journals/jams/2008-21-02/S0894-0347-07-00576-0/S0894-0347-07-00576-0.pdf). J. Amer. Math. Soc. 21 (2008), 513–546. The author DVI def.dvi uses pages approximately 512 below journal pages; its Errata (E.4) is on journal p. 545. Family results (2.5.5), (2.7.5)–(2.7.7) also occur in the AMS article.

- **KW209**. Chandrashekhar Khare and Jean-Pierre Wintenberger, [Serre's modularity conjecture (II)](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf). Invent. Math. 178 (2009), 505–586. Locators use the 98-page UCLA author copy proofs.pdf (30 May 2009).

- **KisinFlat**. Mark Kisin, [Moduli of finite flat group schemes, and modularity](https://people.math.harvard.edu/~kisin/dvifiles/bt.dvi). Ann. of Math. 170 (2009), 1085–1180. Locators use the author DVI bt.dvi and its own pagination (21 October 2008).

- **Savitt**. David Savitt, [On a conjecture of Conrad, Diamond, and Taylor](https://arxiv.org/pdf/math/0404327v3). Duke Math. J. 128 (2005). Locators use the corrected arXiv:math/0404327v3 (15 September 2010), including Remark 1.7; they refer to this corrected text.

- **ACC+**. Patrick B. Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James Newton, Peter Scholze, Richard Taylor and Jack A. Thorne, [Potential automorphy over CM fields](https://arxiv.org/pdf/1812.09999v2). Ann. of Math. 197 (2023), 897–1113. Locators use arXiv:1812.09999v2 and its 218-page pagination.

- **SkinnerWiles**. C. M. Skinner and A. J. Wiles, [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf). Publ. Math. IHÉS 89 (1999), 5–126. Numdam article pages equal PDF pages plus three.

- **Kisin2adic**. Mark Kisin, [Modularity of 2-adic Barsotti–Tate representations](https://people.math.harvard.edu/~kisin/dvifiles/serre2.dvi). Invent. Math. 178 (2009). Locators use the author DVI serre2.dvi and its own pagination (21 October 2008).

- **BIP23**. Gebhard Böckle, Ashwin Iyengar, Vytautas Paškūnas, [On local Galois deformation rings](https://arxiv.org/abs/2110.01638). Forum Math. Pi 11 (2023), e30; corrigendum 12 (2024), e5. Locators use arXiv:2110.01638v2.

- **PQ26**. Vytautas Paškūnas, Julian Quast, [On local Galois deformation rings: generalised reductive groups](https://arxiv.org/abs/2404.14622). Forum Math. Pi 14 (2026), e15. Locators use arXiv:2404.14622v2 (9 January 2026).

- **CG18**. Frank Calegari, David Geraghty, [Modularity lifting beyond the Taylor–Wiles method](https://arxiv.org/abs/1207.4224). Invent. Math. 211 (2018), 297–433; correction 227 (2022), 855–856. The linked accepted manuscript is arXiv:1207.4224v2; the layer citations also give journal page numbers.

- **BCGP21**. George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, [Abelian surfaces over totally real fields are potentially modular](https://arxiv.org/abs/1812.09269). Publ. Math. IHÉS 134 (2021), 153–501. Locators use arXiv:1812.09269v3 (28 November 2021).

- **BHS19**. Christophe Breuil, Eugen Hellmann, Benjamin Schraen, [A local model for the trianguline variety and applications](https://arxiv.org/abs/1702.02192). Publ. Math. IHÉS 130 (2019), 299–412. The linked manuscript is arXiv:1702.02192.

- **DING25**. Yiwen Ding, [p-adic Hodge parameters in the crystabelline representations of GL_n](https://arxiv.org/abs/2407.21237). Publ. Math. IHÉS 142 (2025), 1–74. The linked manuscript is arXiv:2407.21237.

- **LTXZZ**. Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu, [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://arxiv.org/abs/1912.11942). Invent. Math. 228 (2022), 107–375; linked version arXiv:1912.11942v3. The rigidity definition is 6.3.4 there, corresponding to journal Definition 6.3.3; citations distinguish the two numberings.

- **LTXZZrigid**. Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu, [Deformation of rigid conjugate self-dual Galois representations](https://arxiv.org/abs/2108.06998). arXiv:2108.06998v1; published in Acta Math. Sin. 40 (2024), 1599–1644. Locators refer to arXiv v1.

- **NT26**. James Newton, Jack A. Thorne, [Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/abs/2212.03595). Ann. of Math. 203 (2026), no. 1. Locators use arXiv:2212.03595v2.

- **CG20**. Frank Calegari, David Geraghty; appendix by Frank Calegari, David Geraghty, Michael Harris, [Minimal modularity lifting for nonregular symplectic representations](https://arxiv.org/abs/1907.08691). Duke Math. J. 169 (2020), 801–896. Linked manuscript arXiv:1907.08691v1, with appendix arXiv:1907.08694v1; layer locators specify journal pages.

- **FKP22**. Najmuddin Fakhruddin, Chandrashekhar Khare, Stefan Patrikis, [Lifting and automorphy of reducible mod p Galois representations over global fields](https://arxiv.org/abs/2008.12593). Invent. Math. 228 (2022), 415–492. Locators use arXiv:2008.12593v5.

- **BCGP25**. George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, [Modularity theorems for abelian surfaces](https://arxiv.org/abs/2502.20645v1). arXiv:2502.20645v1 (2025); locators use its own pagination.

- **CDN23**. Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, [Factorisation de la cohomologie étale p-adique de la tour de Drinfeld](https://arxiv.org/abs/2204.11214). Forum Math. Pi 11 (2023), e16; linked manuscript arXiv:2204.11214. The full Weil–Deligne point theorem is Théorème 5.11.

- **BCDT01**. Christophe Breuil, Brian Conrad, Fred Diamond, Richard Taylor, [On the modularity of elliptic curves over Q: wild 3-adic exercises](https://www.ams.org/journals/jams/2001-14-04/S0894-0347-01-00370-8/). J. Amer. Math. Soc. 14 (2001), 843–939. Author-manuscript §§1.1 and 4.3 are on pp. 7–8 and 27–28; these are distinguished from the cited journal pages.

- **CN23**. Ana Caraiani, James Newton, [On the modularity of elliptic curves over imaginary quadratic fields](https://arxiv.org/abs/2301.10509v3). arXiv:2301.10509v3; locators use this version.

- **KW109**. Chandrashekhar Khare, Jean-Pierre Wintenberger, [Serre's modularity conjecture (I)](https://www.math.ucla.edu/~shekhar/papers/results.pdf). Invent. Math. 178 (2009), 485–504. Locators use the UCLA author copy results.pdf.

- **BLGGT14**. Thomas Barnet-Lamb, Toby Gee, David Geraghty, Richard Taylor, [Potential automorphy and change of weight](https://arxiv.org/abs/1010.2561). Ann. of Math. 179 (2014), 501–609. Locators use arXiv:1010.2561v4.

- **BCGNT25**. George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, [The Ramanujan and Sato–Tate conjectures for Bianchi modular forms](https://arxiv.org/abs/2309.15880). Forum Math. Pi 13 (2025), e10; linked manuscript arXiv:2309.15880.

- **BCG25**. George Boxer, Frank Calegari, Toby Gee, [Cuspidal cohomology classes for GL_n(Z)](https://arxiv.org/abs/2309.15944). J. Amer. Math. Soc. 38 (2025), 509–520; linked manuscript arXiv:2309.15944v3.

- **LLHLM20**. Daniel Le, Bao V. Le Hung, Brandon Levin, Stefano Morra, [Serre weights and Breuil's lattice conjecture in dimension three](https://arxiv.org/abs/1608.06570). Forum Math. Pi 8 (2020), e5. Locators use the journal-style numbering of arXiv:1608.06570v4. References to LLHLM18 within the chart formulas are to the earlier companion paper cited there.

- **CT17**. Laurent Clozel, Jack A. Thorne, [Level-raising and symmetric power functoriality, III](https://www.dpmms.cam.ac.uk/~jat58/lrspiii.pdf). Duke Math. J. 166 (2017), 325–402. Locators use the Cambridge accepted manuscript lrspiii.pdf.

- **Shotton**. Jack Shotton, [The Breuil–Mézard conjecture when l ≠ p](https://arxiv.org/pdf/1608.01784v2). Duke Math. J. 167 (2018), 603–678. Locators use arXiv:1608.01784v2 (16 October 2017).

- **THORNE15**. Jack Thorne, [Automorphy lifting for residually reducible l-adic Galois representations](https://www.repository.cam.ac.uk/bitstreams/5b8962a1-6a0e-4d17-b5ae-b478575e1a0c/download). J. Amer. Math. Soc. 28 (2015); locators use the accepted author manuscript of 16 April 2014.

- **Geraghty**. David Geraghty, [Modularity lifting theorems for ordinary Galois representations](https://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.167.6526&rep=rep1&type=pdf). Math. Ann. 373 (2019), 1341–1427. Locators use the author preprint of 12 March 2010, with concordance: journal 2.32↔preprint 2.7.7, 3.5↔3.2.1, 3.6↔3.2.2, 3.7↔3.2.3, 3.10↔3.3.3, 3.13↔3.4.2 and 3.14↔3.4.3. The preprint statements are the targets.

- **BOOHER19**. Jeremy Booher, [Minimally ramified deformations when ℓ ≠ p](https://arxiv.org/pdf/1807.10743). Compositio Math. 155 (2019), 1–37; locators use arXiv:1807.10743v1.

- **DOTTO25**. Andrea Dotto, [Breuil–Mézard conjectures for central division algebras](https://msp.org/ant/2025/19-2/ant-v19-n2-p01-s.pdf). Algebra & Number Theory 19 (2025), 213–247. Journal page equals PDF page plus 211; arXiv:1808.06851v3 has the same numbering.

- **BellovinGee**. Rebecca Bellovin, Toby Gee, [G-valued local deformation rings and global lifts](https://arxiv.org/pdf/1708.04885). Algebra & Number Theory 13 (2019), 333–378. Locators use arXiv:1708.04885v3 (30 December 2018).
[ACC+]: https://arxiv.org/pdf/1812.09999v2
[BCDT01]: https://www.ams.org/journals/jams/2001-14-04/S0894-0347-01-00370-8/
[BCG25]: https://arxiv.org/abs/2309.15944
[BCGNT25]: https://arxiv.org/abs/2309.15880
[BCGP21]: https://arxiv.org/abs/1812.09269
[BCGP25]: https://arxiv.org/abs/2502.20645v1
[BHS19]: https://arxiv.org/abs/1702.02192
[BIP23]: https://arxiv.org/abs/2110.01638
[BLGGT14]: https://arxiv.org/abs/1010.2561
[BOOHER19]: https://arxiv.org/pdf/1807.10743
[BellovinGee]: https://arxiv.org/pdf/1708.04885
[CDN23]: https://arxiv.org/abs/2204.11214
[CG18]: https://arxiv.org/abs/1207.4224
[CG20]: https://arxiv.org/abs/1907.08691
[CHT08]: https://www.numdam.org/item/10.1007/s10240-008-0016-1.pdf
[CN23]: https://arxiv.org/abs/2301.10509v3
[CT17]: https://www.dpmms.cam.ac.uk/~jat58/lrspiii.pdf
[DING25]: https://arxiv.org/abs/2407.21237
[DOTTO25]: https://msp.org/ant/2025/19-2/ant-v19-n2-p01-s.pdf
[FKP22]: https://arxiv.org/abs/2008.12593
[Gee22]: https://arxiv.org/pdf/2202.05818v2
[Geraghty]: https://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.167.6526&rep=rep1&type=pdf
[KW109]: https://www.math.ucla.edu/~shekhar/papers/results.pdf
[KW209]: https://www.math.ucla.edu/~shekhar/papers/proofs.pdf
[Kisin2adic]: https://people.math.harvard.edu/~kisin/dvifiles/serre2.dvi
[KisinFlat]: https://people.math.harvard.edu/~kisin/dvifiles/bt.dvi
[KisinNotes]: https://people.math.harvard.edu/~kisin/notes/notes.pdf
[KisinPST]: https://www.ams.org/journals/jams/2008-21-02/S0894-0347-07-00576-0/S0894-0347-07-00576-0.pdf
[LLHLM20]: https://arxiv.org/abs/1608.06570
[LTXZZ]: https://arxiv.org/abs/1912.11942
[LTXZZrigid]: https://arxiv.org/abs/2108.06998
[NT26]: https://arxiv.org/abs/2212.03595
[PQ26]: https://arxiv.org/abs/2404.14622
[Savitt]: https://arxiv.org/pdf/math/0404327v3
[Shotton]: https://arxiv.org/pdf/1608.01784v2
[SkinnerWiles]: http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf
[THORNE15]: https://www.repository.cam.ac.uk/bitstreams/5b8962a1-6a0e-4d17-b5ae-b478575e1a0c/download
[TUNG21]: https://arxiv.org/pdf/1908.06174v3
[TaylorII]: https://www.numdam.org/item/10.1007/s10240-008-0015-2.pdf
