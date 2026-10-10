# Igusa varieties, compactified period fibres and torsion concentration

This roadmap builds the geometry and cohomology of Igusa varieties needed to study torsion classes in unitary Shimura varieties. Its central geometric result identifies the fibres of the Hodge–Tate period map with canonical compactifications of perfect Igusa varieties. Nearby cycles then give a lower degree bound, affineness gives an upper degree bound, and Hecke genericity eliminates the nonordinary contributions. The resulting vanishing theorem places ordinary cohomology in degrees at least the middle degree and compactly supported cohomology in degrees at most that degree. Absolute irreducibility, together with boundary vanishing, gives concentration in the middle degree.

The development includes usable theories of central leaves, internal Hom p-divisible groups, liftable automorphisms, Igusa towers, their partial compactifications and their boundary strata. These objects support two arithmetic arguments. The global argument uses Igusa trace formulas, dual Hecke ideals and Pink's boundary formula. The local argument uses the spectral action on local Shimura varieties and identifies ordinary costalk and stalk cohomology after local spherical localization. Their hypotheses remain separate throughout.

## Scope and conventions

The global datum is the quasi-split unitary similitude group attached to a CM field F, its maximal real subfield F⁺, and a split skew-hermitian space of dimension 2n. The rational similitude factor is common to all embeddings. The local geometric results have the broader unramified PEL generality of types (A) and (C); they do not include type (D). The Harris–Taylor Drinfeld-level constructions use their own signature (1,n−1) datum and are not obtained by changing the signature of the balanced global datum silently.

Write p for the geometric prime, ℓ≠p for the coefficient prime, k for an algebraically closed characteristic-p field, and C for a complete algebraically closed extension of ℚ_p. Its valuation ring is O_C. For the balanced unitary datum,

$$d=[F^+:\mathbb Q]n^2,\qquad d_b=\langle2\rho,\nu_b\rangle.$$

Here d is the complex dimension of the Shimura variety and d_b is the dimension of its central leaf and finite-level Igusa varieties. Use the covariant Dieudonné convention of Caraiani–Scholze for internal Hom slopes. A Shimura Hodge cocharacter μ gives Newton indices in B(G,μ⁻¹). The ordinary index is maximal in the Newton order and its flag stratum has dimension zero. A cyclotomic completed base K_∞ must be chosen once before forming infinite-level local period fibres or the product formula.

At finite level the Igusa maps are finite étale. The perfect Igusa variety trivializes the entire p-divisible group; Mantovan's tower trivializes liftable truncations of its slope-graded pieces. The right action in Mantovan's convention corresponds to the left quasi-isogeny action via inversion. Our left action is (j,h)·(ρ,η)=(jρ,ηh⁻¹). Scalar pairs give a kernel, so this action is not asserted to be faithful. Cohomology with ℤ_ℓ coefficients uses the derived coefficient limit before the colimit over geometric levels. Smooth duals, derived coinvariants and the orientation character κ must be retained in equivariant formulas.

The notation C^{X,tor}, C^{X,*}, Ig^{X,tor} and Ig^{X,*} refers to **partial** compactifications inside the ambient Shimura compactifications. A partial compactification need not be proper. Finite-level minimal Igusa maps are finite, whereas their inverse limit is integral. At a semi-abelian boundary the whole torsion object A[p^∞] need not be p-divisible: use its connected part and the polarized biconnected quotient. The support functor RΓ_{c−∂} means RΓ(Ig^{b,*},j!−), not ordinary compact support on Ig^b.

Arithmetic Frobenius and geometric Artin conventions must not be mixed. In the Hecke–Galois dictionary below Artin sends a uniformizer to geometric Frobenius, and |Art_F⁻¹| takes that Frobenius to q_v⁻¹. The dual residual system is ρ̄^∨⊗|Art_F⁻¹|^{1−2n}. Weak genericity excludes α_i=q_vα_j for i≠j; repeated eigenvalues are allowed when this ratio condition allows them. Strong decomposed genericity also requires distinct eigenvalues. Residual length at most two is used only on the global trace-and-boundary route.

## Library vocabulary and neighbouring roadmaps

Use Mathlib's `Scheme`, `Scheme.Hom`, `IsAffine`, `IsFinite`, `IsProper`, `ValuationRing`, `PerfectRing`, `WittVector`, derived categories and localizations. `PerfectRing R p` does not by itself assert characteristic p; add `CharP R p`. The small étale and pro-étale topologies are `Scheme.smallEtaleTopology` and `Scheme.proetaleTopology`. Scheme normalization is `Scheme.Hom.normalization`. The valuative criterion for properness requires quasi-compactness, quasi-separatedness and local finite type before applying `IsProper.of_valuativeCriterion`. Neither properness nor finiteness follows from an unrestricted pointwise lifting assertion.

For number fields use `NumberField.IsCMField` and the maximal real subfield. `Matrix.unitaryGroup` preserves the identity form and therefore does not supply the split skew-hermitian group used here. `TauCeti.ReductiveAffineGroupSchemeCat` is the category over a field; it supplies the reductive generic fibre, not an integral model over ℤ. Use Tau Ceti's `HeckeRing` and `HeckeAntiInvolution.ofAmbient`/`onHeckeCoset` for the double-coset convolution and inversion API; local spherical commutativity is an additional theorem about the chosen datum.

Ownership is fixed by the prerequisite labels below. PELModuli supplies integral PEL data, moduli and compactifications. FiniteFlatGroupsAndIntegralPadicHodgeTheory supplies p-divisible groups, Dieudonné theory and universal covers. BunGAndNewtonStrata supplies B(G), J_b, the Kottwitz and Newton maps, and the admissible set; this roadmap supplies their occurrence in the PEL special fibre and period map. AdicSpaces and PerfectoidSpaces supply the ambient analytic geometry, DiamondsAndVStacks and DiamondEtaleCohomology the diamond geometry and cohomology, and EtaleDualityAndPerverseSheaves the finite-type perverse formalism. EndoscopicTransferAndUnitaryTraceComparison supplies rational trace comparison and local Langlands, while ExcursionOperatorsAndSpectralAction supplies the local spectral action. SmoothRepresentationsOfLocalGroups, TorsionCohomologyInfrastructure and AutomorphicGaloisRepresentationsPartII supply representation theory, torsion determinants and the genericity predicates. General boundary constructions and Cartan–Leray descent belong to their respective neighbouring roadmaps; only the Igusa-specific applications are developed here.

Each item below gives its mathematical specification, the API that its later uses require, and its prerequisites. Earlier targets are identified by their IG layer label. External labels denote the indicated roadmap and layer. The supplier interfaces collected after the layers are part of those prerequisites: a theorem that uses one must take its full stated generality, coefficient system and equivariance, rather than substituting a weaker nearby theorem. The mathematical specification in this README is definitive; [Suggested.lean](Suggested.lean) proposes names and signatures, with `sorry` proofs, and is not an implementation.

Prerequisite abbreviations (the text after the colon is the external layer id):

- `ASAM` = `AbelianSchemesAndArithmeticModuli`.
- `AAG` = `AdelicAlgebraicGroups`.
- `ACCoh` = `AdicCoefficientsAndComparisons`.
- `AEG` = `AdicEtaleGeometry`.
- `AdicII` = `AdicSpacesPartII`.
- `AGD` = `ArithmeticGaloisDuality`.
- `ALS` = `ArithmeticLocallySymmetricSpaces`.
- `AGII` = `AutomorphicGaloisRepresentationsPartII`.
- `BG` = `BunGAndNewtonStrata`.
- `CAEC` = `ClassicalAdicEtaleCohomology`.
- `DEC` = `DiamondEtaleCohomology`.
- `DSO` = `DiamondSixOperations`.
- `DVS` = `DiamondsAndVStacks`.
- `ET` = `EndoscopicTransferAndUnitaryTraceComparison`.
- `EDC` = `EtaleDualityAndPerverseSheaves`.
- `ES` = `ExcursionOperatorsAndSpectralAction`.
- `FF` = `FiniteFlatGroupsAndIntegralPadicHodgeTheory`.
- `HS` = `HeckeStacksAndLocalShtukas`.
- `HT` = `HodgeTateAndCanonicalSubgroups`.
- `IHG` = `IntegralHeckeAndGaloisDeterminants`.
- `LPV` = `LefschetzPencilsAndVanishingCycles`.
- `NM` = `NeronModelsAndSemistableAbelianVarieties`.
- `PEL` = `PELModuli`.
- `PH` = `PadicHodgeTheory`.
- `PSV` = `PerfectoidShimuraVarieties`.
- `PS` = `PerfectoidSpaces`.
- `SF` = `SchemeAndStackFoundations`.
- `SC` = `ShimuraCompactifications`.
- `SR` = `SmoothRepresentationsOfLocalGroups`.
- `TC` = `TorsionCohomologyInfrastructure`.
- `VS` = `VStackSheavesAndLisseCategories`.
- `VB` = `VectorBundlesAndIsocrystals`.

Common settings used in the hypotheses below:

**Smooth toroidal setting.** Standing hypotheses of CSnc §§3–4: p unramified in F, N ≥ 3 prime to p, K = K(N), and Σ a compatible family of smooth projective cone decompositions with trivial stabilizers (CSnc Remark 2.5.6); S = S_K and S_k = S ×_ℤ k for k algebraically closed of characteristic p.

**Valued-field fibre setting.** p unramified in F, N ≥ 3 prime to p, Σ as in CSnc Remark 2.5.6; C a complete algebraically closed nonarchimedean extension of ℚ_p with ring of integers O_C, residue field k and a fixed section k → O_C/p.

**Nearby-cycle setting.** p unramified in F, N ≥ 3 prime to p, Σ as in CSnc Remark 2.5.6; C complete algebraically closed over ℚ_p with residue field k; ℓ ≠ p; d = [F⁺:ℚ]n².

**Trace-comparison setting.** Standing assumptions of CSnc §5: p unramified in F; F contains an imaginary quadratic F₀ in which p splits; F⁺ ≠ ℚ; a character ϖ : 𝔸^×_{F₀}/F₀^× → ℂ^× extending the quadratic character of F₀/ℚ; S ⊇ {∞} ∪ {primes dividing pℓΔ_F} ∪ {primes where ϖ ramifies}; level N ≥ 3 divisible only by primes in S^p_f = S_fin ∖ {p} and by the integer N₀ of CSnc Remark 5.4.5; ι_ℓ : ℚ̄_ℓ ≅ ℂ fixed.

**Boundary tower setting.** p unramified in F; X a p-divisible group with G-structure over k with class b; N ≥ 3 prime to p; ℓ ≠ p; Ig^b_∞ = lim_N Ig^b_{K(N)} and similarly Ig^{b,*}_∞, Ig^{b,tor}_∞; compactly supported cohomology of schemes with integral maps to schemes of finite type in Hamacher's sense (colimit over an approximating tower with finite transitions).

**Global residual-system setting.** F = F⁺F₀ CM with F₀ imaginary quadratic and F⁺ ≠ ℚ; G⁰ the quasi-split unitary group of IG.0 with d = [F⁺:ℚ]n²; ℓ a prime; S a finite set of places containing ∞, ℓ, the primes ramified in F and those where K is not hyperspecial; 𝕋^S the unramified Hecke algebra over ℤ; 𝔪 ⊂ 𝕋^S a maximal ideal in the support of H^*(X_K, 𝔽_ℓ) with associated ρ̄_𝔪 : Gal(F̄/F) → GL_{2n}(𝔽̄_ℓ).

## Layer IG.0: Unitary data, p-divisible groups and central leaves

The starting point is an explicit unitary datum and its representable good-reduction integral model. Local deformation theory then supplies the groups and torsors governing a Newton stratum. The internal Hom API is needed to describe the positive-dimensional fibres of the universal-cover automorphism group; it is not replaced by the discrete group J_b(ℚ_p).

### The balanced datum and its integral model

<a id="ig-0-quasi-split-unitary-datum"></a>

**The quasi-split unitary similitude datum (F, V, L, G, G⁰) and its locally symmetric spaces.** Fix a CM field F with maximal totally real subfield F⁺ and an integer n ≥ 1. Let V = F^{2n} with the skew-hermitian form ⟨x, y⟩ = Σ_{i=1}^{n} (x_i ȳ_{2n+1−i} − x_{2n+1−i} ȳ_i) and the alternating form (x, y) = tr_{F/ℚ}⟨x, y⟩, and fix an O_F-lattice L ⊂ V that is self-dual for (·,·) (for example L = O_F^n ⊕ 𝔡^{−1,n}, 𝔡^{−1} the inverse different). The unitary similitude group is the group scheme G over ℤ with G(R) = {(g, c) ∈ GL_{O_F}(L)(R) × 𝔾_m(R) : (gv, gw) = c(v, w) for all v, w ∈ L}, and the unitary group is G⁰ = ker(c : G → 𝔾_m). The symmetric space of G(ℝ) is X = ∏_{τ:F⁺↪ℝ} X_{τ,+} ⊔ ∏_τ X_{τ,−}, with X_{τ,±} the positive (negative) definite n-dimensional subspaces of V ⊗_{F⁺,τ} ℝ ≅ ℂ^{2n}, and X⁰ = ∏_τ X_{τ,+}. For a neat compact open K ⊂ G(𝔸_f), X_K = G(ℚ)\(X × G(𝔸_f)/K) is a real manifold of dimension 2d with d = [F⁺:ℚ]n²; X⁰_{K⁰} is defined in the same way for G⁰. For N ≥ 3, K(N) = {g ∈ G(ℤ̂) : g ≡ 1 mod N}. For a finite set S of rational primes, the Hecke algebra 𝕋^S is generated over ℤ by the double coset operators T_{i,v} (1 ≤ i ≤ 2n, v a prime of F above p ∉ S with p split in a fixed imaginary quadratic F₀ ⊂ F) inside ⊗_{p∉S, p split in F₀} ℤ[G(ℚ_p)//G(ℤ_p)], and 𝕋^{0,S} = ⊗ ℤ[G⁰(ℚ_p)//G⁰(ℤ_p)].

Hypotheses: F is a CM field, n ≥ 1, L ⊂ V is a self-dual O_F-lattice for (·,·). K ⊂ G(𝔸_f) is neat (K(N) with N ≥ 3 is neat). The Hecke operators T_{i,v} are only defined for v above primes p ∉ S split in the imaginary quadratic subfield F₀ ⊂ F; when F contains no such F₀ only the level and the space are used.

For the Hecke interfaces keep the chosen subfield E = F₀ explicit: index the restricted product by primes q ∉ S split in E, take K^S to be the product of the images of G(ℤ_q), and Δ the whole group. Use Mathlib's `RestrictedProduct` and the completed RestrictedProducts integral-subgroup interface. Then `HeckeAlgebra E S` is the native `HeckeRing Δ K^S ℤ`, with its convolution ring instance under `IsHeckeTriple Δ K^S K^S`; `[K^SgK^S]` is its single double-coset basis vector. SR.1 supplies commensurability and spherical commutativity for this datum. All Hecke actions and operators carry the same E. The geometric datum requires no E.

Required API:

- `UnitarySimilitudeDatum.group`: The group scheme G over ℤ with its similitude character c : G → 𝔾_m.
- `UnitarySimilitudeDatum.unitaryGroup`: G⁰ = ker c, a closed subgroup scheme of G.
- `UnitarySimilitudeDatum.locallySymmetricSpace`: X_K = G(ℚ)\(X × G(𝔸_f)/K) for neat K.
- `UnitarySimilitudeDatum.dim_locallySymmetricSpace`: dim_ℝ X_K = 2[F⁺:ℚ]n².
- `UnitarySimilitudeDatum.heckeOperator`: T_{i,v} ∈ 𝕋^S for 1 ≤ i ≤ 2n and v | p ∉ S split in F₀.
- `UnitarySimilitudeDatum.heckeRestrict_heckeOperator`: The restriction 𝕋^S → 𝕋^{0,S} maps T_{i,v} to T⁰_{i,v}.
- `UnitarySimilitudeDatum.toPELDatum`: The underlying PEL datum (F, complex conjugation, V, (·,·), L) of PELModuli M0.

Examples and tests:

- For F imaginary quadratic and n = 1 the space X_{K(N)} has real dimension 2 (d = 1).
- The lattice O_F^n ⊕ 𝔡^{−1,n} is self-dual for (x, y) = tr⟨x, y⟩.
- G⁰(ℚ) ≠ G(ℚ): the scalar 2 ∈ ℚ^× ⊂ F^× lies in G(ℚ) with similitude factor c = 4 ≠ 1, so it is not in G⁰(ℚ).
- For a ℚ-algebra R, G⁰(R) = {g ∈ GL_{2n}(F ⊗ R) : gᵀ J ḡ = J}, J the antidiagonal matrix of ⟨·,·⟩ (signature (n, n)); this is not Mathlib's Matrix.unitaryGroup, which preserves the identity form, and over ℤ the lattice L ⊗ R need not be free over O_F ⊗ R unless the different is principal.

Prerequisites: `PEL:M0`, `tauceti:TauCeti.ReductiveAffineGroupSchemeCat`, `mathlib:Matrix.unitaryGroup`, `mathlib:NumberField.IsCMField`; for the Hecke datum, `mathlib:RestrictedProduct`, `tauceti:HeckeCosetModule.instRingHeckeRing`, `SR:SR.1`.

Source: [csnc](#ref-csnc), CSnc §2.1, p. 11; §5.1, p. 64 for the split-prime Hecke datum.

<a id="ig-0-unitary-subgroup-comparison"></a>

**The unitary locally symmetric space is open and closed in the similitude one.** Let K ⊂ G(𝔸_f) be neat and K⁰ = K ∩ G⁰(𝔸_f). The inclusion G⁰ ↪ G induces an open and closed immersion X⁰_{K⁰} → X_K, and the induced maps H^i(X_K, ·) → H^i(X⁰_{K⁰}, ·) and H^i_c(X⁰_{K⁰}, ·) → H^i_c(X_K, ·) are equivariant for the restriction map 𝕋^S → 𝕋^{0,S}.

Hypotheses: K neat and K⁰ = K ∩ G⁰(𝔸_f).

Prerequisites: `IG.0`.

Source: [csnc](#ref-csnc), CSnc §2.1, Lemma 2.1.1, p. 12.

<a id="ig-0-hasse-principle"></a>

**The Hasse principle for the unitary similitude group.** The map H¹(ℚ, G) → ∏_v H¹(ℚ_v, G), v running over all places of ℚ, is injective. Equivalently, a 2n-dimensional F-vector space V′ with an alternating form (·,·)′ satisfying (xv, w)′ = (v, x̄w)′ that is isomorphic to (V, (·,·)) up to a scalar after base change to every completion ℚ_v is isomorphic to it up to a scalar over ℚ.

Hypotheses: G is the unitary similitude group of the quasi-split datum.

Prerequisites: `IG.0`, `AAG:AA.4`, `PEL:M3`.

Source: [csnc](#ref-csnc), CSnc §2.1, Proposition 2.1.2, p. 12.

<a id="ig-0-g-structure"></a>

**Abelian varieties and p-divisible groups with G-structure.** (1) For a scheme S over ℤ[1/Δ_F], an abelian variety with G-structure over S is a triple (A, ι, λ): an abelian scheme A/S of relative dimension [F:ℚ]n, an action ι : O_F → End(A) such that Lie A is a free O_F ⊗_ℤ O_S-module of rank n, and a principal polarization λ : A ≅ A^∨ whose Rosati involution induces complex conjugation on O_F. (2) Take p unramified in F and a scheme S with p locally nilpotent. The p-divisible version consists of (X, ι, λ), where X/S is p-divisible of height 2[F:ℚ]n and dimension [F:ℚ]n, ι : O_F → End(X) with Lie X free of rank n over O_F ⊗_ℤ O_S, and λ : X ≅ X^∨ a principal polarization whose Rosati involution is complex conjugation via ι. Morphisms are O_F-linear maps respecting λ (isomorphisms may respect λ up to ℤ_p^× when stated, as in Igusa level structures).

Hypotheses: p unramified in F in (2); the rank condition on Lie is the determinant (Kottwitz) condition of the split signature (n, n) at every place.

Required API:

- `PDivGStructure.ofAbelian`: A[p^∞] of an abelian variety with G-structure (A, ι, λ) is a p-divisible group with G-structure.
- `PDivGStructure.baseChange`: Base change along T → S of a p-divisible group with G-structure is one, compatibly with composition.
- `PDivGStructure.height_eq`: The height is 2[F:ℚ]n and the dimension [F:ℚ]n.
- `PDivGStructure.Iso`: Isomorphisms: O_F-linear isomorphisms carrying λ to a ℤ_p^×-multiple of λ′ (or exactly to λ′ for strict isomorphisms).
- `PDivGStructure.cartierDual`: λ identifies X with X^∨ semilinearly for complex conjugation on O_F.

Examples and tests:

- Over 𝔽̄_p with p unramified in F (signature (n, n) makes the ordinary element admissible for every such p), μ_{p^∞} ⊗ O_F^n ⊕ (ℚ_p/ℤ_p) ⊗ O_F^n with the standard polarization is a p-divisible group with G-structure of height 2[F:ℚ]n.
- A p-divisible group with the required height and O_F-action whose Lie algebra has conjugate embedding ranks (n+1,n−1) fails the balanced Lie-rank condition; the failure is unequal component ranks, not freeness of a different common rank.
- For an abelian variety with G-structure A, the height of A[p^∞] is 2 dim A = 2[F:ℚ]n.

Prerequisites: `IG.0`, `PEL:M1`, `PEL:M0`, `FF:R07.1`.

Source: [csnc](#ref-csnc), CSnc §2.1, Definition 2.1.3(2), p. 13.

<a id="ig-0-integral-model"></a>

**The integral model S_K of the unitary Shimura variety.** Fix N ≥ 3 and K = K(N). The S-points of S^pre_K over ℤ[1/Δ_F] consist of an abelian variety (A, ι, λ) with G-structure, level data η : L/N → A[N] that are O_F-linear, and ζ_N ∈ μ_N(O_S) of exact order N. Require that η carries (·,·) mod N to the Weil pairing of λ via ζ_N, and that η extends to compatible O_F-linear maps L/Δ_F^m N → A[Δ_F^m N] for all m ≥ 1. It is a Deligne–Mumford stack, representable after base change to ℤ[1/(Δ_F N)] and after base change to ℤ_(p) whenever the prime-to-p part of N is at least 3. S_K is the normalization of S^pre_K in S^pre_K × ℤ[1/(Δ_F N)]. For p ∤ NΔ_F, S_K ×_ℤ ℤ_(p) is the smooth PEL integral model of PELModuli M2 with hyperspecial level at p; its special fibre S_{K,k} = S_K ×_ℤ k (k = 𝔽̄_p) carries the universal p-divisible group with G-structure A[p^∞]. As schemes, S^pre_K and S_K mean their restrictions to the open base U_{D,N} on which Δ_F is invertible and the prime-to-q part of N is at least 3 at every residual prime q; the whole normalized Deligne–Mumford stack is not declared to be a Scheme.

Level-forgetting maps are defined over a common good-prime base for N|M, p∤MΔ_F. Complex uniformization commutes with these maps. Prime-to-p Hecke correspondences compose compatibly.

Hypotheses: N ≥ 3 and K=K(N). The source first defines a Deligne–Mumford moduli stack over ℤ[1/Δ_F]. The suggested Scheme carrier is its restriction to the open base U_{D,N} where the prime-to-residue-characteristic part of N is at least 3. At p unramified in F with that tame-level condition, base change to ℤ_(p) is defined; smoothness additionally requires p∤N.

API: `IntegralModel.moduli`, `IntegralModel.smooth_of_good`, `IntegralModel.universalPDiv`, `IntegralModel.hecke`, `IntegralModel.toPELModuli`, `IntegralModel.transitionAtP`, `IntegralModel.complexTransition`.

Prerequisites: `IG.0`, `PEL:M1`, `PEL:M0`, `PEL:M2`.

Source: [csnc](#ref-csnc), CSnc §2.1, Definition 2.1.4, p. 13; [csnc](#ref-csnc), CSnc §2.1, Definition 2.1.5, p. 13.

<a id="ig-0-complex-uniformization"></a>

**Complex uniformization of the integral model.** There is a natural isomorphism of complex manifolds X_K ≅ S_K(ℂ), equivariant for the Hecke action of G(𝔸_f).

Hypotheses: K = K(N) with N ≥ 3.

Prerequisites: `IG.0`, `PEL:M3`.

Source: [csnc](#ref-csnc), CSnc §2.1, Proposition 2.1.6, p. 13.

### Local PEL and internal Hom

<a id="ig-0-unramified-local-pel-datum"></a>

**Unramified local PEL data of type (A) or (C) and the p-divisible group X_b.** An unramified local PEL datum D^int = (B, *, V, (·,·), O_B, Λ, μ, b) consists of: a finite-dimensional semisimple ℚ_p-algebra B with anti-involution *, which is a product of matrix algebras over unramified extensions of ℚ_p; a *-stable maximal ℤ_p-order O_B; a finite left B-module V with an alternating form (·,·) : V × V → ℚ_p such that (bv, w) = (v, b*w); an O_B-stable lattice Λ ⊂ V self-dual for (·,·), so that G(R) = {(g, c) ∈ GL_{B⊗R}(V ⊗ R) × R^× : (gv, gw) = c(v, w)} extends to a reductive group G over ℤ_p, assumed connected (type D excluded); a conjugacy class μ : 𝔾_m → G_{ℚ̄_p} of cocharacters with weights 0 and 1 on V, V_{ℚ̄_p} = V₀ ⊕ V₁ with both summands totally isotropic and c ∘ μ = id, with field of definition E; and b ∈ G(L), L = W(𝔽̄_p)[1/p], with [b] ∈ B(G, μ^{−1}). The slopes of b on V lie in [−1, 0] in the paper's (nonstandard) covariant normalization of the Dieudonné module, so there is a p-divisible group X_b over 𝔽̄_p with rational B-action on its universal cover and symmetric quasi-polarization, unique up to quasi-isogeny, whose rational covariant Dieudonné module is V ⊗ L with Frobenius b σ. Global PEL data of type (A) or (C) unramified at p with hyperspecial level give such a datum at every b ∈ B(G_{ℚ_p}, μ^{−1}).

Hypotheses: B is a product of matrix algebras over unramified extensions of ℚ_p (unramified datum). G connected: data of type D are excluded. p = 2 is allowed in this unramified setting without type D.

Required API:

- `LocalPELDatum.reductiveModel`: The reductive group scheme G_{ℤ_p} stabilising Λ and (·,·) up to scalar.
- `LocalPELDatum.pdivOfB`: A rational framing X_b with rational B-action on its universal cover and symmetric quasi-polarization. Integral O_B-action and principal polarization are separate structures, not consequences of this constructor.
- `LocalPELDatum.pdivOfB_isocrystal`: The rational Dieudonné module of X_b is (V ⊗ L, bσ) with its O_B-action and pairing.
- `LocalPELDatum.pdivOfB_unique`: X_b is unique up to quasi-isogeny respecting the extra structures.
- `LocalPELDatum.ofGlobal`: A global PEL datum of type (A) or (C), unramified at p with hyperspecial K_p, gives a local datum D^int_b for every b ∈ B(G_{ℚ_p}, μ^{−1}).
- `LocalPELDatum.J`: The group J_b(ℚ_p) of self-quasi-isogenies of X_b respecting the extra structures, identified with J_b of BunGAndNewtonStrata BG0.
- `LocalPELDatum.IntegralSlopeRepresentative`: An integral principal-polarized PEL p-divisible group satisfying the determinant condition, a structure-preserving quasi-isogeny to the rational framing X_b and a completely slope divisible underlying group; the existence of such representatives is the R07.2 integral PEL interface.

Examples and tests:

- For the unitary datum at p split in F and b ordinary, X_b ≅ (μ_{p^∞} ⊕ ℚ_p/ℤ_p) ⊗_{ℤ_p} O_F^n ⊗ ℤ_p with the standard polarization.
- For the quasi-split unitary datum and b basic, X_b is isoclinic of slope 1/2.
- An orthogonal datum (* of type D, G disconnected) is not an unramified local PEL datum in this sense.
- J_b(ℚ_p) = Aut(X_b, extra structures) ⊗ ℚ equals the σ-centraliser of b imported from BunGAndNewtonStrata BG0.

Prerequisites: `IG.0`, `BG:BG0`, `BG:BG1`, `FF:R07.2`, `VB:VB0`, `PEL:M0`.

Source: [cs17](#ref-cs17), CS17 §4.2, p. 697; [cs17](#ref-cs17), CS17 §4.2, p. 696.

<a id="ig-0-newton-map"></a>

**The Newton map x ↦ [b_x] and the Newton stratification of the special fibre.** Let S be the special fibre over k = 𝔽̄_p of the integral model of a PEL Shimura variety of type (A) or (C) with hyperspecial level at p (for the quasi-split unitary datum: S_{K,k} with p ∤ NΔ_F). For a point x ∈ S with geometric point x̄, the rational Dieudonné module of A_x̄[p^∞] with its extra structures is an isocrystal with G-structure, classified by an element b_x ∈ B(G_{ℚ_p}); then [b_x] ∈ B(G_{ℚ_p}, μ^{−1}) (Rapoport–Richartz), with μ the Hodge cocharacter. The Newton stratum S^b = {x : [b_x] = b} is locally closed, and S = ⊔_{b ∈ B(G_{ℚ_p}, μ^{−1})} S^b. For each b fix a completely slope divisible X_b over k with G-structure in the isogeny class b (CS17 §4.3, after [Man05, §3]). The map x ↦ [b_x] is the PEL-specific map; B(G), the Newton map ν, the Kottwitz map κ, the order and B(G, μ) are those of BunGAndNewtonStrata BG0–BG1, with the sign of μ recorded: the Shimura variety has Hodge cocharacter μ and the strata are indexed by B(G, μ^{−1}).

Require prime-to-p Hecke invariance, invariance under structure-preserving quasi-isogeny, and closure(S^b)⊆⋃_{b′≤b}S^{b′}.

Hypotheses: PEL datum of type (A) or (C) unramified at p with hyperspecial K_p; for the quasi-split unitary datum p ∤ NΔ_F.

API: `newtonPoint`, `newtonStratum`, `newtonStratum_disjoint_union`, `closure_newtonStratum_subset`, `newtonPoint_hecke`, `newtonPoint_isogeny`.

Prerequisites: `IG.0`, `BG:BG0`, `BG:BG1`, `FF:R07.2`, `VB:VB0`.

Source: [cs17](#ref-cs17), CS17 §4.3, p. 714.

<a id="ig-0-splitting-symplectic-filtrations"></a>

**Splitting of symplectic filtrations of p-divisible groups with G-structure.** Work over an algebraically closed characteristic-p field k and fix p-divisible data (X, ι, λ) with G-structure. The connected–multiplicative filtration X^μ ⊂ X° ⊂ X is O_F-stable and symplectic and splits uniquely, X ≅ X^μ ⊕ X^{(0,1)} ⊕ X^{ét}, with λ decomposing accordingly; X is determined up to isomorphism by X^{(0,1)} with its O_F-action and polarization and by the finite projective O_F ⊗ ℤ_p-module T_p(X^{ét}). More generally, if Z_{−2} ⊂ Z_{−1} ⊂ X is an O_F-stable filtration by sub-p-divisible groups with Z_{−2} multiplicative, X/Z_{−1} étale and λ identifying Z_{−2} with (X/Z_{−1})^∨, then there is an O_F-linear splitting X ≅ Z_{−2} ⊕ Z_{−1}/Z_{−2} ⊕ X/Z_{−1} under which λ decomposes as a direct sum.

Hypotheses: k algebraically closed (perfect suffices for the connected–étale splitting).

Prerequisites: `IG.0`, `FF:R07.1`.

Source: [csnc](#ref-csnc), CSnc §2.2, Proposition 2.2.1, p. 14.

<a id="ig-0-internal-hom-p-divisible-group"></a>

**The internal Hom p-divisible group H_{G,G′} of Chai and Oort.** Let G, G′ be isoclinic p-divisible groups over a perfect field k of characteristic p. For n ≥ 1, H_n = 𝓗om(G[p^n], G′[p^n]) is a commutative group scheme of finite type over k; for m ≥ n the restriction r_{m,n} : H_m → H_n has closed kernel and H_n^{(m)} = H_m / ker r_{m,n} ⊂ H_n is a closed subgroup scheme, decreasing in m. (Lemma 4.1.5) H_n^{(m)} is constant for m ≫ 0, equal to a finite group scheme H′_n. (Lemma 4.1.6) The maps ι_n : H_n → H_{n+1} (precompose with p : G[p^{n+1}] → G[p^n], compose with G′[p^n] ↪ G′[p^{n+1}]) send H′_n into H′_{n+1}, and H_{G,G′} := colim_n H′_n is a p-divisible group over k with H_{G,G′}[p^n] = H′_n. The construction extends to O_F-linear Homs for p-divisible groups with an action of the ring of integers O_F of an unramified extension F/ℚ_p.

The construction is contravariant in G and covariant in G′, respects composition and isogenies, and has the O_F-linear variant for unramified F/ℚ_p.

Hypotheses: G, G′ isoclinic over a perfect field k of characteristic p.

API: `InternalHom.pdiv`, `InternalHom.torsion_eq`, `InternalHom.tateModule`, `InternalHom.map`, `InternalHom.ofLinear`.

Prerequisites: `FF:R07.1`, `FF:R07.2`, `VB:VB0`.

Source: [cs17](#ref-cs17), CS17 §4.1, Lemma 4.1.5, p. 693; [cs17](#ref-cs17), CS17 §4.1, Lemma 4.1.6, p. 694.

<a id="ig-0-internal-hom-dieudonne-module"></a>

**Tate module and Dieudonné module of the internal Hom.** Let G, G′ be isoclinic p-divisible groups over a perfect field k. (1) The Tate module T_p H_{G,G′} is identified with the sheaf 𝓗om(G, G′). (2) The rational Dieudonné module satisfies D(H_{G,G′})[1/p] = Hom(D(G)[1/p], D(G′)[1/p])^{≤0}, the part of slopes ≤ 0 of the internal Hom isocrystal (with the normalization of CS17 §4.1); the statement depends only on G, G′ up to quasi-isogeny. The analogous statements hold O_F-linearly for F/ℚ_p unramified, using D_F(G) = D(G)[1/p]_{τ₀}, an isocrystal for φ^{[F:ℚ_p]}.

Hypotheses: G, G′ isoclinic over a perfect field k.

Prerequisites: `IG.0`, `FF:R07.2`, `VB:VB0`.

Source: [cs17](#ref-cs17), CS17 §4.1, Lemma 4.1.7, p. 695; [cs17](#ref-cs17), CS17 §4.1, Lemma 4.1.8, p. 695.

<a id="ig-0-internal-hom-slopes"></a>

**Slopes of the internal Hom and the formal structure of 𝓗om(G, G′).** Let G, G′ be isoclinic p-divisible groups over a perfect field k. (1) If the slope of G is strictly greater than that of G′, then H_{G,G′} = 0. (2) If the slopes are equal, H_{G,G′} is étale. (3) If the slope of G is strictly smaller than that of G′, H_{G,G′} is connected; if it has dimension r, the sheaf 𝓗om(G, G′) is representable by Spec k[[x₁^{1/p^∞}, …, x_r^{1/p^∞}]]/(x₁, …, x_r).

Hypotheses: G, G′ isoclinic over a perfect field k.

Prerequisites: `IG.0`.

Source: [cs17](#ref-cs17), CS17 §4.1, Corollary 4.1.10, p. 696; [cs17](#ref-cs17), CS17 §4.1, Corollary 4.1.11, p. 696.

### Slope filtrations and universal-cover automorphisms

<a id="ig-0-completely-slope-divisible"></a>

**Slope divisible and completely slope divisible p-divisible groups.** Let T be an 𝔽_p-scheme and 𝒢/T a p-divisible group with relative Frobenius Frob_𝒢. (1) 𝒢 is isoclinic and slope divisible of slope λ ∈ ℚ_{≥0} if one can write λ = r/s so that the quasi-isogeny p^{−r} Frob^s_𝒢 : 𝒢 → 𝒢^{(p^s)} is an isomorphism. (2) 𝒢 is slope divisible with respect to λ = r/s if p^{−r} Frob^s_𝒢 is an isogeny. (3) 𝒢 is completely slope divisible if there are rational numbers λ₁ > … > λ_r ≥ 0 and a filtration 0 = 𝒢₀ ⊂ 𝒢₁ ⊂ … ⊂ 𝒢_r = 𝒢 by p-divisible groups such that each 𝒢_i is slope divisible with respect to λ_i and 𝒢_i/𝒢_{i−1} is isoclinic and slope divisible of slope λ_i. Such a filtration is unique and its formation is fpqc local on T.

Hypotheses: T an 𝔽_p-scheme; slopes in the covariant normalization of CSnc §2.3.

Required API:

- `IsCompletelySlopeDivisible`: The predicate on a p-divisible group over an 𝔽_p-scheme, with the slopes λ₁ > … > λ_r.
- `IsCompletelySlopeDivisible.slopeFiltration`: The unique filtration 𝒢₁ ⊂ … ⊂ 𝒢_r with isoclinic slope divisible graded pieces.
- `IsCompletelySlopeDivisible.baseChange`: Stable under base change, with the slope filtration base-changed.
- `IsCompletelySlopeDivisible.of_generic`: Over a connected regular characteristic-p base with constant Newton polygon, complete slope divisibility at the geometric generic point implies it everywhere (CSnc Lemma 2.3.4, with constant Newton polygon).
- `IsCompletelySlopeDivisible.split_of_perfect`: Over a perfect base the slope filtration splits canonically: 𝒢 ≅ ⊕ 𝒢_i/𝒢_{i−1} (Oort–Zink Proposition 1.3).

Examples and tests:

- μ_{p^∞} ⊕ ℚ_p/ℤ_p over 𝔽̄_p is completely slope divisible with slopes 1 > 0.
- A nonzero isoclinic slope divisible group is completely slope divisible with r=1; the zero group has the empty filtration r=0.
- A p-divisible group over a nonnormal base that is not isogenous to one with a slope filtration ([OZ02, Ex. 4.2]) is not completely slope divisible.
- For slopes in {0, 1} the slope filtration is the multiplicative–étale filtration of the p-divisible group.

Prerequisites: `FF:R07.1`, `FF:R07.2`, `VB:VB0`.

Source: [csnc](#ref-csnc), CSnc §2.3, Definition 2.3.3, p. 18; [csnc](#ref-csnc), CSnc §2.3, Lemma 2.3.4, p. 19.

<a id="ig-0-slope-filtration-existence"></a>

**Completely slope divisible representatives and their behaviour over perfect bases and valuation rings (Oort–Zink).** (1) Every p-divisible group over an algebraically closed field of characteristic p is isogenous to a completely slope divisible one, which is a direct sum of isoclinic slope divisible groups defined over a finite field, with decreasing slopes; for the PEL classes used here, choosing a representative with integral O_B-action, determinant condition, principal polarization and complete slope divisibility is the separate IntegralSlopeRepresentative existence request to R07.2, as used in CS17 §4.3. (2) Over a perfect base a completely slope divisible p-divisible group is the direct sum of its isoclinic graded pieces [OZ02, Prop. 1.3]. (3) If V is a valuation ring of characteristic p with fraction field K and G/V has constant Newton polygon with G_K completely slope divisible, then G is completely slope divisible [OZ02, Prop. 2.3]. (4) Over a connected regular characteristic-p base with constant Newton polygon, complete slope divisibility at the geometric generic point implies it everywhere [Zin01, Thm 7].

Hypotheses: Characteristic p bases; (3) needs constant Newton polygon. In (4), the Newton polygon is constant on the base.

Prerequisites: `IG.0`, `FF:R07.2`, `VB:VB0`.

Source: [oz02](#ref-oz02), Proposition 1.3, p. 186; [oz02](#ref-oz02), Proposition 2.3, p. 189; [cs17](#ref-cs17), CS17 §4.3, p. 714.

<a id="ig-0-automorphism-group-of-universal-cover"></a>

**The automorphism group Aut_G(X̃_b) of the universal cover of X_b.** For an unramified local PEL datum with p-divisible group X_b over 𝔽̄_p, let X̃_b = lim_{×p} X_b be its universal cover. Aut_G(X̃_b) is the sheaf on Nilp^{op}_{W(𝔽̄_p)} with Aut_G(X̃_b)(R) = {(α, β) : α ∈ Aut_{O_B}(X̃_{b,R}), β ∈ Aut(μ̃_{p^∞,R}), α respects the polarization up to β}. It is representable by a formal scheme over Spf W(𝔽̄_p), locally of the form Spf W(R) for a perfect ring R. Its group of 𝔽̄_p-points (equivalently of W(𝔽̄_p)-points) is J_b(ℚ_p), the self-quasi-isogenies of X_b respecting the extra structures.

Hypotheses: Unramified local PEL datum of type (A) or (C); X_b chosen completely slope divisible.

Required API:

- `AutUniversalCover`: The group-valued sheaf Aut_G(X̃_b) on Nilp^{op}_{W(𝔽̄_p)}.
- `AutUniversalCover.representable`: Representable by a formal scheme locally Spf W(R) with R perfect.
- `AutUniversalCover.points`: Aut_G(X̃_b)(𝔽̄_p) = J_b(ℚ_p), the group of self-quasi-isogenies of X_b with G-structure.
- `AutUniversalCover.rigid`: Aut_G(X̃_b)(R) → Aut_G(X̃_b)(R/I) is bijective for I nilpotent.
- `AutUniversalCover.toJ`: The natural map Aut_G(X̃_b) → J_b(ℚ_p) of IG.0/structure-of-automorphism-group.

Examples and tests:

- For X_b isoclinic, Aut_G(X̃_b) = J_b(ℚ_p) is the constant locally profinite formal scheme (d = 0).
- For the standard rank-two symplectic PEL datum B=ℚ_p, V=ℚ_p², its standard alternating form, O_B=ℤ_p, Λ=ℤ_p² and μ(t)=diag(t,1), with ordinary X_b=μ_{p^∞}⊕ℚ_p/ℤ_p, the group is GSp₂=GL₂ and every fibre over J_b(ℚ_p)=ℚ_p^××ℚ_p^× is Spf W(k)[[x^{1/p^∞}]].
- Aut_G(X̃_b) is not the automorphism group scheme Aut(X_b): its 𝔽̄_p-points are J_b(ℚ_p), not the compact Aut(X_b)(𝔽̄_p).
- The group of 𝔽̄_p-points equals J_b(ℚ_p) of BunGAndNewtonStrata BG0 for the isocrystal of X_b.

Prerequisites: `IG.0`, `FF:R07.1`, `SF:SF.4`, `AdicII:F0`, `AdicII:R2`.

Source: [cs17](#ref-cs17), CS17 §4.2, Lemma 4.2.10, p. 703; [cs17](#ref-cs17), CS17 §4.2, Definition 4.2.9, p. 703.

<a id="ig-0-structure-of-automorphism-group"></a>

**Structure of Aut_G(X̃_b): fibres over J_b(ℚ_p) and the dimension ⟨2ρ, ν_b⟩.** Regard the locally profinite set J_b(ℚ_p) as a formal scheme over W(𝔽̄_p) (sections over U ⊂ J_b(ℚ_p) are the continuous maps U → W(𝔽̄_p)). For unramified local PEL data of type (A) or (C) there is a natural map Aut_G(X̃_b) → J_b(ℚ_p) all of whose fibres are isomorphic to Spf W(𝔽̄_p)[[x₁^{1/p^∞}, …, x_d^{1/p^∞}]] with d = ⟨2ρ, ν_b⟩, ρ the half-sum of the positive roots.

Hypotheses: Unramified local PEL data of type (A) or (C); X_b completely slope divisible.

Prerequisites: `IG.0`, `BG:BG0`, `BG:BG1`.

Source: [cs17](#ref-cs17), CS17 §4.2, Proposition 4.2.11, p. 704.

### Liftable automorphisms and central leaves

<a id="ig-0-liftable-automorphisms"></a>

**Liftable automorphisms of truncations and finite-level Igusa torsors over seminormal bases.** Let k be algebraically closed of characteristic p and X/k an isoclinic p-divisible group with extra structures of EL or PEL type. (1) For m ≥ 1 let Γ_m be the group of automorphisms of X[p^m] commuting with the extra structures that lift to automorphisms of X[p^{m′}] for all m′ ≥ m; the finite étale group scheme Γ_{m,k} represents the functor of T-automorphisms of X_T[p^m] commuting with the extra structures that lift fppf locally to X_T[p^{m′}] for all m′ ≥ m (and one m′ suffices). (2) Let 𝒳/k be a seminormal scheme and 𝒢/𝒳 a p-divisible group with the same kind of extra structures, geometrically isomorphic to X at every point. Then the functor on 𝒳-schemes T of isomorphisms ρ_m : 𝒢[p^m] ×_𝒳 T ≅ X[p^m] ×_k T compatible with the extra structures that lift fppf locally to isomorphisms of p^{m′}-truncations for all m′ ≥ m is representable by a Γ_m-torsor J_m(𝒢/𝒳) → 𝒳.

Hypotheses: X isoclinic; 𝒳 seminormal; 𝒢 geometrically isomorphic to X at all points.

API: `liftableAutomorphismsPlain`, `liftableAutomorphisms`.

Prerequisites: `IG.0`.

Source: [csnc](#ref-csnc), CSnc §2.2, Proposition 2.2.3, p. 15; [csnc](#ref-csnc), CSnc §2.2, Theorem 2.2.4, p. 15.

<a id="ig-0-truncated-rz-isomorphism-locus"></a>

**The isomorphism locus in a truncated Rapoport–Zink space is finite.** Let Y/k be a p-divisible group with extra structures over an algebraically closed field k, and M^{0,d}_Y the reduced special fibre of the truncated Rapoport–Zink space of isogenies with kernel contained in Y[p^d]; let H be the universal p-divisible group over it. The subset Z = {x ∈ M^{0,d}_Y : H_x̄ ≅ Y_x̄ compatibly with extra structures} consists of finitely many points, all defined over k.

Hypotheses: Y need not be isoclinic.

Prerequisites: `IG.0`, `FF:R07.1`.

Source: [csnc](#ref-csnc), CSnc §2.2, Lemma 2.2.5, p. 16.

<a id="ig-0-isomorphism-torsors"></a>

**Isomorphism torsors: profinite Γ over perfect bases, the non-reduced Aut(X) over regular bases.** Let X/k be a p-divisible group with EL or PEL extra structure over algebraically closed k (not necessarily isoclinic), Γ = lim_m Γ_m = Aut(X)(k) the profinite group of its automorphisms with extra structure, and Aut(X) the group scheme of automorphisms with extra structure (in general highly non-reduced). Let 𝒢 be a p-divisible group with the same extra structure over a scheme 𝒳/k, geometrically isomorphic to X at every point. (1) If 𝒳 is perfect, the functor on perfect 𝒳-schemes T of isomorphisms 𝒢 ×_𝒳 T ≅ X ×_k T is representable by a Γ-torsor J(𝒢/𝒳) → 𝒳. (2) If 𝒳 is regular, the functor on all 𝒳-schemes T of such isomorphisms is representable by an Aut(X)-torsor over 𝒳.

Hypotheses: (1) 𝒳 perfect; (2) 𝒳 regular; 𝒢 geometrically isomorphic to X with extra structures.

Prerequisites: `IG.0`, `mathlib:PerfectRing`.

Source: [csnc](#ref-csnc), CSnc §2.2, Proposition 2.2.6, p. 17; [csnc](#ref-csnc), CSnc §2.2, Proposition 2.2.7, p. 17.

<a id="ig-0-central-leaf"></a>

**The central leaf C^X of a p-divisible group with G-structure.** Let X be a p-divisible group with G-structure over k = 𝔽̄_p (more generally with the extra structures of a PEL datum of type (A) or (C), unramified at p, hyperspecial level). The central leaf C^X ⊂ S_{K,k} is the subset of points x such that A[p^∞]_x̄ ≅ X ×_k k(x̄) compatibly with the extra structures, for one (equivalently every) geometric point x̄ over x. It is locally closed (closed in the Newton stratum S^b of X) and, with its reduced structure, a smooth subscheme of S_{K,k} (Mantovan [Man05, Prop. 1]). It is stable under prime-to-p Hecke correspondences; unlike the Newton stratum and the Igusa variety, it depends on X within its isogeny class.

Hypotheses: PEL datum of type (A) or (C) unramified at p with hyperspecial level; X over 𝔽̄_p with extra structures.

Required API:

- `centralLeaf`: C^X ⊂ S_{K,k} as a reduced locally closed subscheme.
- `centralLeaf_smooth`: C^X is smooth over k.
- `centralLeaf_subset_newtonStratum`: C^X ⊂ S^b, closed in S^b, for b the class of X.
- `mem_centralLeaf_iff`: x ∈ C^X iff A[p^∞]_x̄ ≅ X ×_k k(x̄) with extra structures.
- `centralLeaf_hecke`: Prime-to-p Hecke correspondences preserve C^X.
- `centralLeaf_universal_iso`: Over C^X the group A[p^∞] is geometrically isomorphic to X at every point, so the Igusa torsors of IG.0/isomorphism-torsors exist.

Examples and tests:

- For b ordinary, C^{X_b} equals the ordinary Newton stratum.
- For F imaginary quadratic and n = 1 and b basic, C^{X_b} is a finite set of supersingular points.
- In general C^X ⊊ S^b: for a non-ordinary, non-basic b with d_b < dim S^b the leaf is a proper closed subset of the stratum.
- dim C^{X_b} = ⟨2ρ, ν_b⟩.

Prerequisites: `IG.0`.

Source: [csnc](#ref-csnc), CSnc §2.3, Definition 2.3.1, p. 17; [cs17](#ref-cs17), CS17 §4.3, Definition 4.3.6, p. 716.

<a id="ig-0-central-leaf-dimension"></a>

**Dimension of central leaves: dim C^{X_b} = ⟨2ρ, ν_b⟩ (Hamacher).** For a PEL datum of type (A) or (C) unramified at p with hyperspecial level and b ∈ B(G_{ℚ_p}, μ^{−1}), every central leaf C^{X} with X in the isogeny class b is smooth of pure dimension d_b = ⟨2ρ, ν_b⟩, where ν_b is the Newton point and ρ the half-sum of positive roots; the perfect Igusa variety Ig^b has the same dimension d_b (CSnc §2.7).

Hypotheses: PEL type (A) or (C), unramified at p, hyperspecial level.

Prerequisites: `IG.0`, `BG:BG0`, `BG:BG1`.

Source: [ham15](#ref-ham15), Corollary 7.8 (2), p. 30 (arXiv:1312.0490v2); [cs17](#ref-cs17), CS17 §4.2, Remark 4.2.13, p. 708.

### Deformations and Newton torsors

<a id="ig-0-serre-tate-semi-abelian"></a>

**Serre–Tate theory up to isogeny and for semi-abelian schemes, without noetherian hypotheses.** Suppose S is a quotient of S′ by a nilpotent ideal and p is nilpotent in both rings. (1) Base change from S′ to S is an equivalence on p-divisible groups up to isogeny, on abelian schemes up to p-power isogeny, and on semi-abelian schemes that are global extensions of abelian schemes by split tori (with Hom ⊗ ℤ[1/p]). (2) Extensions G_{S′} of abelian schemes by split tori over S′ are equivalent to triples (G_S, 𝒢_{S′}, ρ) with G_S such an extension over S, 𝒢_{S′} a p-divisible group over S′ and ρ : G_S[p^∞] ≅ 𝒢_{S′} ×_{S′} S. No noetherian hypotheses are needed. The classical statement for abelian schemes (CSnc Theorem 2.4.2(1)) is imported from AbelianSchemesAndArithmeticModuli A4; this node owns the isogeny-level, non-noetherian and semi-abelian extensions used for toroidal boundary charts.

Hypotheses: p nilpotent in S′, kernel of S′ → S nilpotent.

Prerequisites: `ASAM:A4`, `FF:R07.6`, `FF:R07.1`.

Source: [csnc](#ref-csnc), CSnc §2.4, Theorem 2.4.1, p. 20; [csnc](#ref-csnc), CSnc §2.4, Theorem 2.4.2, p. 21.

<a id="ig-0-pel-rapoport-zink-space"></a>

**The Rapoport–Zink space of PEL type 𝔐_{D^int}.** For an unramified local PEL datum D^int with p-divisible group X_b, Ĕ the completion of the maximal unramified extension of E and O_Ĕ its ring of integers, 𝔐_{D^int} is the functor on Nilp^{op}_{O_Ĕ} (O_Ĕ-algebras R on which p is nilpotent) sending R to the isomorphism classes of pairs (G, ρ) with G a p-divisible group over R with O_B-action satisfying the determinant condition and a principal polarization whose Rosati involution is compatible with *, and ρ : X_b ×_{𝔽̄_p} R/p → G ×_R R/p an O_B-linear quasi-isogeny respecting the polarizations up to an automorphism of μ̃_{p^∞,R/p}. It is representable by a formal scheme over Spf O_Ĕ that locally admits a finitely generated ideal of definition, and it is formally smooth (Rapoport–Zink [RZ96, Thm 3.25, §3.82]). J_b(ℚ_p) acts by composition on ρ.

The action is g·(G,ρ)=(G,ρ∘g⁻¹). Provide the adic generic fibre and the truncated reduced subspaces whose isogeny kernel lies in X_b[p^m].

Hypotheses: Unramified local PEL datum of type (A) or (C) (p = 2 allowed without type D).

API: `RZSpace`, `RZSpace.represents`, `RZSpace.formallySmooth`, `RZSpace.jAction`, `RZSpace.genericFibre`, `RZSpace.truncated`.

Prerequisites: `IG.0`, `ASAM:A4`, `FF:R07.6`, `FF:R07.2`, `VB:VB0`, `SF:SF.4`, `AdicII:F0`, `AdicII:R2`, `FF:R07.1`.

Source: [cs17](#ref-cs17), CS17 §4.2, Definition 4.2.1, p. 697; [cs17](#ref-cs17), CS17 §4.2, Theorem 4.2.2, p. 698.

<a id="ig-0-berthelot-without-noetherian"></a>

**Homomorphisms of p-divisible groups with constant Newton polygon over valuation rings and normal domains of characteristic p.** (1) Let V be a valuation ring of characteristic p with fraction field K, and G, H p-divisible groups over V with constant Newton polygon. Then Hom(G, H) → Hom(G_K, H_K) is a bijection. (2) The same holds for an integral domain R of characteristic p, integrally closed in its fraction field K, in place of V (removing the noetherian hypothesis from Berthelot's theorem).

Hypotheses: Constant Newton polygon of G and H over Spec V (resp. Spec R).

Prerequisites: `IG.0`, `FF:R07.2`, `VB:VB0`, `mathlib:ValuationRing`.

Source: [cs17](#ref-cs17), CS17 §4.2, Lemma 4.2.16, p. 710; [cs17](#ref-cs17), CS17 §4.2, Remark 4.2.17, p. 710.

<a id="ig-0-constant-newton-polygon-over-perfect-rings"></a>

**p-divisible groups with constant Newton polygon over strictly henselian perfect rings.** Let R be a strictly henselian perfect ring with residue field k. In the isogeny categories, reduction G ↦ G_k identifies the constant-Newton-polygon p-divisible groups over R with all p-divisible groups over k. Each object G on the R-side is isogenous to G₀ ×_{𝔽̄_p} R, with G₀ completely slope divisible over 𝔽̄_p. Moreover there is a constant c depending only on the heights such that for every homomorphism ψ_k : G_k → H_k of such groups, p^c ψ_k lifts uniquely to G → H. In particular all automorphisms of X_R for X over 𝔽̄_p are constant.

Hypotheses: R strictly henselian and perfect; constant Newton polygon.

Prerequisites: `IG.0`, `FF:R07.2`, `VB:VB0`, `mathlib:PerfectRing`.

Source: [cs17](#ref-cs17), CS17 §4.3, Lemma 4.3.15, p. 721; [cs17](#ref-cs17), CS17 §4.3, Remark 4.3.16, p. 721.

<a id="ig-0-quasi-isogeny-torsor"></a>

**The J_b(ℚ_p)-torsor of quasi-isogenies over a Newton stratum.** Let S be a scheme over 𝔽̄_p and X a p-divisible group with PEL extra structures over S such that, for some b ∈ B(G), all geometric fibres of X are quasi-isogenous to X_b compatibly with extra structures. Then there is a natural J_b(ℚ_p)-torsor over S_proét (a torsor under the sheaf of groups attached to the topological group J_b(ℚ_p), in the sense of Bhatt–Scholze) whose fibre at a geometric point x̄ is the set of quasi-isogenies X_x̄ → X_b compatible with extra structures; it depends only on X up to isogeny. If S is connected and locally topologically noetherian, it corresponds to a continuous homomorphism π₁^proét(S, x̄) → J_b(ℚ_p). Applied to A[p^∞] over a Newton stratum S^b, this gives a J_b(ℚ_p)-torsor over S^b.

Hypotheses: All geometric fibres quasi-isogenous to X_b with extra structures.

Prerequisites: `IG.0`, `mathlib:AlgebraicGeometry.Scheme.proetaleTopology`.

Source: [cs17](#ref-cs17), CS17 §4.3, Proposition 4.3.13, p. 720.

### The Drinfeld-level signature

<a id="ig-0-drinfeld-level-newton-strata"></a>

**Newton strata of the special fibre at Drinfeld level for the Harris–Taylor type datum.** In the setting of Li–Liu §§6–7 (a unitary Shimura variety of signature (1, n−1) at one archimedean place and (0, n) at the others, with Drinfeld level 𝔭^m at a place u of F⁺ split in F, of residue characteristic p), let 𝒳_m be the integral model at Drinfeld level m and Y_m = 𝒳_m ⊗ k. For 0 ≤ j ≤ n − 1 let Y_{m,j} ⊂ Y_m^{red} be the closed locus where the formal part of the one-dimensional O_{F_u}-divisible group A[u^{c,∞}] has height at least j + 1, and Y°_{m,j} = Y_{m,j} ∖ Y_{m,j+1}. Then Y°_{m,j} is smooth over k of pure dimension n − 1 − j, Y_{m,0} = Y_m^{red}, and the strata are stable under the prime-to-p Hecke action.

Hypotheses: Harris–Taylor type unitary datum with u split in F, Drinfeld level structure at u. The smoothness and dimension statements are those of Harris–Taylor [HT01, Cor. III.4.4] at Drinfeld level.

API: `DrinfeldStratum`, `DrinfeldStratum.closed`, `DrinfeldStratum.smooth`, `DrinfeldStratum.hecke`, `DrinfeldStratum.levelZero`.

Prerequisites: `IG.0`.

Source: [lil21](#ref-lil21), Proof of Lemma 7.3 and footnote 14, p. 34.

<a id="ig-0-isomorphism-locus-constructible"></a>

**Constructibility of isomorphism loci of p-divisible groups.** Let 𝒢 be a p-divisible group with PEL extra structure over a scheme T of finite type over an algebraically closed field k of characteristic p, and Y a p-divisible group with the same kind of structure over k. The set of points t ∈ T with 𝒢_t̄ ≅ Y ⊗ k(t̄) (compatibly with the extra structure) is constructible, and it is closed in any locally closed subset of T on which the Newton polygon of 𝒢 is constant.

Hypotheses: T of finite type over k; extra structures of PEL type.

Prerequisites: `IG.0`, `FF:R07.1`, `FF:R07.2`, `VB:VB0`.

Source: [csnc](#ref-csnc), CSnc §2.2, proof of Lemma 2.2.5, p. 17; [man05](#ref-man05), Proposition 1, §3, p. 7 of the Caltech preprint (proof p. 8).

<a id="ig-0-refined-drinfeld-strata"></a>

**Refined Newton strata Y^(M)_m by the kernel of the Drinfeld structure.** In the Harris–Taylor type setting of IG.0/drinfeld-level-newton-strata (n arbitrary), for x ∈ Y_m(𝔽̄_p) the group A_x[u^{c,∞}] is a one-dimensional O_{F_u}-divisible group of height n; let 0 ≤ h(x) ≤ n − 1 be the height of its étale part. Y^[h]_m (h(x) ≤ h) is closed and reduced, and Y^(h)_m := Y^[h]_m ∖ Y^[h−1]_m is smooth of pure dimension h. For m ≥ 1, 𝔖^h_m is the set of free O_{F_u}/𝔭_u^m-submodules of (𝔭_u^{−m}/O_{F_u})^n of rank n − h, and Y^(M)_m ⊂ Y^(h)_m (M ∈ 𝔖^h_m) is the open and closed locus where the Drinfeld level structure has kernel M; with Y^[M]_m the scheme-theoretic closure, Y^[M]_m = ⋃_{M ⊆ M′ ∈ 𝔖_m} Y^(M′)_m set-theoretically (display (4.1)). The strata are preserved by Hecke operators away from u.

Hypotheses: Harris–Taylor type datum with Drinfeld level m ≥ 1 at a split place u.

API: `RefinedStratum`, `RefinedStratum.closure`, `RefinedStratum.closure_eq`, `RefinedStratum.decomp`, `RefinedStratum.hecke`.

Prerequisites: `IG.0`.

Source: [lil22](#ref-lil22), §4.3, after Theorem 4.21, p. 58; [lil22](#ref-lil22), §4.3, display (4.1), p. 58.

## Layer IG.1: Igusa towers, actions and cohomology

Construct the three distinct trivialization spaces before passing to cohomology: the perfect full Igusa variety, Mantovan's finite-level slope tower, and the first-kind Igusa varieties for the Drinfeld datum. Level transition maps, perfection and left/right action comparisons are part of the construction, because the later trace and boundary formulas use their equivariance.

### Perfect and finite-level Igusa varieties

<a id="ig-1-perfect-igusa-variety"></a>

**The perfect Igusa variety Ig^X over a central leaf.** Let X be a p-divisible group with G-structure over k = 𝔽̄_p (more generally, with the extra structures of a PEL datum of type (A) or (C), unramified at p, with hyperspecial level), lying in the isogeny class b, and C^X ⊂ S_{K,k} its central leaf. The Igusa variety Ig^X → C^X is the scheme parametrizing isomorphisms ρ : A[p^∞] ≅ X of p-divisible groups with G-structure (respecting the polarizations up to ℤ_p^×). (1) It is representable by an Aut(X)-torsor over C^X, Aut(X) the (generally non-reduced) group scheme of automorphisms of X with G-structure; its restriction to perfect schemes is a pro-étale Γ_X-torsor over (C^X)_perf, Γ_X = Aut(X)(k) profinite. (2) Ig^X is perfect. (3) Equivalently (CS17 Lemma 4.3.4), Ig^X(R) is the set of pairs (A, ρ̃) with A an abelian variety with G-structure over R up to p-power isogeny and ρ̃ : A[p^∞] → X ×_k R a quasi-isogeny respecting the extra structures; hence the formal group Aut_G(X̃) acts on Ig^X through ρ̃, extending the action of Aut(X), and in particular J_b(ℚ_p) = Aut_G(X̃)(k) acts on Ig^X. Ig^X depends only on the isogeny class b (Ig^b := Ig^{X_b}), and G(𝔸_f^p) acts on the tower (Ig^X_{K^p})_{K^p} by prime-to-p Hecke correspondences, commuting with J_b(ℚ_p).

Hypotheses: PEL datum of type (A) or (C), unramified at p, hyperspecial K_p (for the quasi-split unitary datum: p ∤ NΔ_F). K^p sufficiently small (neat).

API: `Igusa`, `Igusa.isTorsor`, `Igusa.isPerfect`, `Igusa.isoUpToIsogeny`, `Igusa.jAction`, `Igusa.heckeAction`, `Igusa.ofIsogeny`.

Prerequisites: `IG.0`, `mathlib:PerfectRing`.

Source: [csnc](#ref-csnc), CSnc §2.3, Corollary 2.3.2, p. 18; [cs17](#ref-cs17), CS17 §4.3, Corollary 4.3.5, p. 715; [cs17](#ref-cs17), CS17 §4.3, Lemma 4.3.4, p. 715.

<a id="ig-1-igusa-isogeny-invariance"></a>

**Isogeny invariance of the open Igusa variety and the pro-finite correspondences between leaves.** An isogeny φ : X → X′ of p-divisible groups with G-structure (compatible with the extra structures up to a common similitude scalar) induces an isomorphism Ig^X ≅ Ig^{X′}, equivariant for J_b(ℚ_p) × G(𝔸_f^p) after identifying J_b(ℚ_p) for X and X′ through φ. Hence the perfect Igusa variety Ig^b depends only on the isogeny class b, and there are pro-finite correspondences C^X ← Ig^X ≅ Ig^{X′} → C^{X′} between different leaves in the same Newton stratum. This invariance is for the open Igusa variety; the toroidal statement (IG.2/toroidal-isogeny-invariance) needs separate hypotheses.

Hypotheses: φ compatible with the extra structures (O_F-linear, polarizations up to a scalar).

Prerequisites: `IG.1`.

Source: [csnc](#ref-csnc), CSnc §2.3, after Corollary 2.3.2, p. 18.

<a id="ig-1-mantovan-igusa-variety"></a>

**Mantovan's finite-level Igusa varieties Ig^X_{Mant,m} for completely slope divisible X.** Let X = ⊕_{i=1}^r X_i be completely slope divisible with G-structure over k, with isoclinic X_i of strictly decreasing slopes, and 𝒢 = A[p^∞]|_{C^X}, which is completely slope divisible with slope filtration 𝒢₁ ⊂ … ⊂ 𝒢_r and graded pieces 𝒢^i. The (pro-)Igusa variety Ig^X_Mant → C^X parametrizes over a C^X-scheme T tuples (ρ_i)_{i=1}^r of isomorphisms ρ_i : 𝒢^i ×_{C^X} T ≅ X_i ×_k T compatible with the O_F ⊗ ℤ_p-actions and commuting with the polarizations 𝒢^i → (𝒢^j)^∨ (λ_i + λ_j = 1) up to an element of ℤ_p^×(T) independent of i. For m ≥ 0, Ig^X_{Mant,m} parametrizes isomorphisms ρ_{i,m} : 𝒢^i[p^m] ×_{C^X} T ≅ X_i[p^m] ×_k T that lift fppf locally to every m′ ≥ m and respect the extra structures up to (ℤ/p^m)^×. Then Ig^X_{Mant,m} → C^X is a finite étale Galois cover with group Γ_{m,X} (by IG.0/liftable-automorphisms), the transition maps are finite étale, and Ig^X_Mant = lim_m Ig^X_{Mant,m} is a pro-finite étale Γ_X-cover of C^X. Each Ig^X_{Mant,m} is smooth over k of dimension d_b. The monoid action in the API uses Mantovan’s right-action convention on the inverse trivializations X_i→𝒢^i; the perfect Igusa action ρ↦jρ is a left action. Thus source δ acts through j=δ^{-1} after perfection.

The right-action monoid S_b consists of δ with δ⁻¹ an isogeny and ker[p^{f_i}]⊆ker(δ_i⁻¹)⊆ker[p^{e_i}] on decreasing slope pieces, with f_i maximal, e_i minimal and f_{i−1}≥e_i. It contains Γ_b, p⁻¹ and inverse slope Frobenius. Put e(δ)=e_1(δ). For m≥e(δ), construct r_δ:Ig_{Mant,m}→Ig_{Mant,m−e(δ)} and prove proj_{m−e(δ)}∘r_δ^{pro}=r_δ∘proj_m. This is level loss, not an action on a fixed finite level.

Hypotheses: X completely slope divisible with G-structure; C^X the central leaf (smooth, so seminormal).

API: `MantovanIgusa`, `MantovanIgusa.finiteEtale`, `MantovanIgusa.transition`, `MantovanIgusa.smooth`, `MantovanIgusa.pro`, `MantovanIgusa.monoidAction`, `MantovanIgusa.levelLoss`, `MantovanIgusa.levelAction`, `MantovanIgusa.monoidAction_toLevel`.

Prerequisites: `IG.0`.

Source: [csnc](#ref-csnc), CSnc §2.3, Definition 2.3.5, p. 19; [cs17](#ref-cs17), CS17 §4.3, Remark 4.3.7, p. 716; [shi09](#ref-shi09), Definition 5.3, §5, p. 16 of the Berkeley preprint; [man05](#ref-man05), Proposition 4, §4, p. 11 of the Caltech preprint; [man05](#ref-man05), §4, definition of S_b on author-copy pp.11–12; Lemma 5 and following paragraph p.12; Lemma 6 p.13.

<a id="ig-1-perfection-of-mantovan"></a>

**The perfect Igusa variety is the perfection of Mantovan's Igusa variety.** For completely slope divisible X_b in the isogeny class b, the natural map P:Ig^b→Ig^b_Mant=lim_m Ig^b_{Mant,m} identifies the perfect scheme Ig^b with the perfection of Ig^b_Mant. Consequently H^i(Ig^b,ℤ/ℓ^n)=colim_m H^i(Ig^b_{Mant,m},ℤ/ℓ^n) and H^i_c(Ig^b,ℤ/ℓ^n)=colim_m H^i_c(Ig^b_{Mant,m},ℤ/ℓ^n) for ℓ≠p. Write a_j for the perfect left action ρ↦jρ and r_δ for Mantovan’s source right action of δ∈S_b. The geometric compatibility is P∘a_{δ^{-1}}=r_δ∘P. Using inverse pullback a_{j^{-1}}^* to turn a geometric left action into a left action on cohomology, the resulting J_b(ℚ_p)-cohomology action agrees with Mantovan’s action r_δ^* on S_b.

Hypotheses: X_b completely slope divisible; ℓ ≠ p.

API: `perfectionOfMantovan`.

Prerequisites: `IG.1`, `IG.0`.

Source: [cs17](#ref-cs17), CS17 §4.3, Proposition 4.3.8, p. 717; [csnc](#ref-csnc), CSnc §2.3, Remark 2.3.7, p. 20; [man05](#ref-man05), §4, Lemma 5 p.12 and the cohomology action on pp.13–14 of the author copy.

<a id="ig-1-igusa-faithfully-flat"></a>

**Ig^b → C^b is faithfully flat, a torsor under the non-reduced Aut(X_b).** The map Ig^b → C^b is faithfully flat. Since it is a quasi-torsor under the group scheme Aut(X_b) of automorphisms of X_b respecting the extra structures, it is an fpqc Aut(X_b)-torsor. This torsor is distinct from the pro-étale Γ_X-torsor Ig^b → (C^b)_perf: Aut(X_b) is highly non-reduced (like Spec k[[x₁^{1/p^∞}, …, x_d^{1/p^∞}]]/(x₁, …, x_d)) when X_b is not isoclinic, while Γ_X = Aut(X_b)(k) is profinite.

Hypotheses: X_b completely slope divisible.

Prerequisites: `IG.1`, `IG.0`.

Source: [cs17](#ref-cs17), CS17 §4.3, Corollary 4.3.9, p. 718.

### Actions, coefficients and first-kind strata

<a id="ig-1-igusa-group-actions"></a>

**The J_b(ℚ_p) × G(𝔸_f^p)-action on the Igusa tower: scalar kernel and stabilizers.** Let Ig^b_{K^p} be the perfect Igusa variety at prime-to-p level K^p⊂G(𝔸_f^p) and Ig^b_∞=lim_{K^p}Ig^b_{K^p}. Use the geometric left action of J_b(ℚ_p)×G(𝔸_f^p): (j,h) sends (A,ρ̃,η) to (A,j∘ρ̃,η∘h^{-1}) in the moduli description up to p-power isogeny. The finite Hecke correspondence labelled g in IG.1/perfect-igusa-variety uses η↦η∘g; the left tower action at h therefore uses the correspondence labelled h^{-1}. The action is continuous in the tower sense: for each compact open K^p and m, ker(Γ_{X_b}→Γ_{m,X_b})×K^p fixes the corresponding finite-level projection. The diagonally embedded scalars ℤ[1/p]^×={±p^e} act trivially: (z,z) sends (ρ̃,η) to (zρ̃,ηz^{-1}), and [z^{-1}]:A→A identifies this pair with the original one in the moduli problem up to p-power isogeny. Thus the action factors through the quotient by this diagonal subgroup; no faithfulness of that quotient action is claimed. On cohomology inverse pullback gives a smooth left J_b(ℚ_p)×G(𝔸_f^p)-representation.

Provide the level quotient Ig^b_{K^p}=Ig^b_∞/K^p. Projection stabilizers are open; point stabilizers need not be open.

Hypotheses: K^p neat; ℓ ≠ p for the statements on cohomology.

API: `IgusaTower.action`, `IgusaTower.stabilizer_open`, `IgusaTower.levelQuotient`, `IgusaTower.globalUnits_trivial`, `IgusaTower.hecke_compat`.

Prerequisites: `IG.1`.

Source: [cs17](#ref-cs17), CS17 §4.3, after Proposition 4.3.8, p. 718; [cs17](#ref-cs17), Definition 4.3.1 and Lemma 4.3.4, published pp.715–716; [man05](#ref-man05), §4, prime-to-p Hecke action on author-copy p.13.

<a id="ig-1-igusa-cohomology"></a>

**The cohomology complexes of Igusa varieties as filtered colimits over finite levels.** For ℓ ≠ p and Λ ∈ {ℤ/ℓ^n, 𝔽_ℓ, ℤ_ℓ, ℚ_ℓ, ℚ̄_ℓ}, define RΓ_c(Ig^b_∞, Λ) := colim_{K^p, m} RΓ_c(Ig^b_{Mant,K^p,m}, Λ) and RΓ(Ig^b_∞, Λ) := colim_{K^p, m} RΓ(Ig^b_{Mant,K^p,m}, Λ) (for ℤ_ℓ, ℚ_ℓ take the derived limit over n of the torsion coefficients at each finite level first), with transition maps the pullbacks along the finite étale transition maps. They are complexes of smooth Λ[J_b(ℚ_p) × G(𝔸_f^p)]-modules; at each finite level H^i_c(Ig^b_{Mant,K^p,m}, Λ) is finitely generated over Λ and vanishes outside [0, 2d_b]. Coefficient change holds: RΓ_c(·, ℤ/ℓ^n) ⊗^L_{ℤ/ℓ^n} 𝔽_ℓ ≅ RΓ_c(·, 𝔽_ℓ). The integral complex is defined by this colimit; no rational virtual-character formula enters its definition. The Hecke algebra 𝕋^S (S ⊃ {p, ℓ} ∪ bad primes) acts through the G(𝔸_f^S)-action, and H^i(Ig^b, 𝔽_ℓ)_𝔪 denotes the localization at a maximal ideal 𝔪 ⊂ 𝕋^S at fixed level K^p(N).

The map RΓ_c→RΓ is equivariant for the commuting actions and Hecke localization.

Hypotheses: ℓ ≠ p; K^p neat.

API: `IgusaCohomology.compactSupport`, `IgusaCohomology.ordinary`, `IgusaCohomology.smooth`, `IgusaCohomology.finite_level`, `IgusaCohomology.changeCoeff`, `IgusaCohomology.heckeAction`, `IgusaCohomology.forgetToCompact`.

Prerequisites: `IG.1`, `EDC:EDC.0`, `mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology`, `SR:SR.0`, `SR:SR.2`, `SR:SR.0:derived-extension`.

Source: [csnc](#ref-csnc), CSnc §2.8, Proposition 2.8.2, p. 34; [cs17](#ref-cs17), CS17 §4.3, after Proposition 4.3.8, p. 718.

<a id="ig-1-alternating-igusa-cohomology"></a>

**The alternating Igusa cohomology [H_c(Ig^b, ℚ̄_ℓ)] in the Grothendieck group and its S-unramified part.** Fix b and X_b. Define [H_c(Ig^b, ℚ̄_ℓ)] := Σ_k (−1)^k colim_{K^p, m} H^k_c(Ig^b_{Mant,K^p,m}, ℚ̄_ℓ) ∈ Groth(G(𝔸_f^p) × J_b(ℚ_p)), a virtual admissible representation: every π ∈ Groth(G(𝔸_f^p) × J_b(ℚ_p)) is a possibly infinite sum Σ n_i π_i of irreducibles such that for each compact open K only finitely many i have n_i ≠ 0 and π_i^K ≠ 0. For a finite set S of places containing p, ∞ and the ramified places and K^S = ∏_{q∉S} K_q hyperspecial, π^{S-ur} := Σ_{i : π_i^{K^S} ≠ 0} n_i π_i. The trace pairing with C^∞_c(G(𝔸_f^p) × J_b(ℚ_p)) determines an element of Groth by its traces; the S-unramified part carries an action of the unramified Hecke algebra 𝕋^S through characters.

Hypotheses: ℓ ≠ p; each H^k_c at each finite level is finite-dimensional, so the limits are admissible.

API: `AltIgusaCohomology`, `AltIgusaCohomology.admissible`, `AltIgusaCohomology.trace`, `AltIgusaCohomology.unramifiedPart`, `AltIgusaCohomology.ext_trace`.

Prerequisites: `IG.1`, `SR:SR.0`, `SR:SR.2`, `SR:SR.0:derived-extension`.

Source: [cs17](#ref-cs17), CS17 §5.2, p. 731.

<a id="ig-1-harris-taylor-igusa-varieties"></a>

**Harris–Taylor Igusa varieties of the first kind and their relation to Mantovan's and the perfect Igusa varieties.** In the Harris–Taylor setting, I_{m,j} → Y°_{0,j} is the finite étale Igusa variety of the first kind trivializing the level-m étale part of A[u^{c,∞}], of étale height n−1−j. It does not trivialize the formal part. The stratum Y°_{m,j} is a finite disjoint union of copies of I_{m,j}; Mantovan’s cover I^j_{Mant,m} → I_{m,j} adds the trivialization of the formal part, and the perfect Igusa variety is the perfection of its inverse-limit tower.

Hypotheses: Harris–Taylor type unitary datum; Drinfeld level at u.

API: `IgusaFirstKind`, `IgusaFirstKind.finiteEtale`, `IgusaFirstKind.stratum_decomp`, `IgusaFirstKind.mantovanCover`.

Prerequisites: `IG.0`, `IG.1`.

Source: [lil21](#ref-lil21), Proof of Lemma 7.3 and footnote 15, p. 35.

<a id="ig-1-refined-strata-closures-smooth"></a>

**Closures of refined Newton strata are smooth and the open strata are Igusa varieties of the first kind.** For m ≥ 1, 0 ≤ h ≤ n − 1 and M ∈ 𝔖^h_m, the closure Y^[M]_m is smooth (and proper) over k of pure dimension h (Mantovan [Man08, Prop. 12]), and Y^(M)_m is isomorphic as a k-scheme (not over Y^(h)_0) to the Harris–Taylor Igusa variety of the first kind I^h_m. Here h is the étale height, while the first-kind index j in IG.1/harris-taylor-igusa-varieties is the formal height minus one: j=n−1−h. Thus I^h_m=I_{m,n−1−h}.

Hypotheses: Harris–Taylor type datum with Drinfeld level m ≥ 1 at u; the comparison of Mantovan's integral model with Li–Liu's X_m is part of the claim.

Prerequisites: `IG.0`, `IG.1`.

Source: [lil22](#ref-lil22), Li–Liu II §4.3, p.60 for the isomorphism with I^h_m as a k-scheme; proof of Proposition4.25, p.62 for smoothness; proof of Theorem4.21, p.63; introduction p.7; [man08](#ref-man08), Proposition 12, author-copy p.12; [man08](#ref-man08), §4.2.4, author-copy p.22.

## Layer IG.2: Partial compactifications and cusp geometry

Well-positioned subsets allow central leaves to meet the ambient toroidal boundary through explicit lower-dimensional PEL data. Connected and biconnected trivializations extend the Igusa tower. Ekedahl–Oort geometry gives the affine minimal compactification needed for Artin vanishing. For a general representative, the affineness transfer uses the unit-similitude toroidal extension specified below; the minimal representative has the separate direct Ekedahl–Oort route. Existence of a completely slope-divisible minimal representative with G-structure is a required input, not a consequence of the existence of a fundamental element alone.

### Well-positioned subsets and their compactifications

<a id="ig-2-well-positioned-subscheme"></a>

**Well-positioned locally closed subsets of the special fibre.** A locally closed subset Y ⊆ S_k is well-positioned if there is a family Y^♮ = {Y^♮_Z} indexed by the cusp labels Z at level K such that (1) each Y^♮_Z is a locally closed subset of the boundary Shimura variety S_{Z,k}, and (2) for every complete algebraically closed nonarchimedean C over k and every x = (A, ι, λ, η) ∈ S_k(C) degenerating into the cusp Z, with Raynaud extension 0 → T → G → B → 0 over O_C, x lies in Y if and only if the point π(x) = (B, …) ∈ S_{Z,k}(C) lies in Y^♮_Z. Equivalently (Lan–Stroh), for every affine open Spf R of the formal chart 𝔛°_σ of the toroidal boundary, Y ×_S W⁰ = Y^♮_Z ×_{S_Z} W⁰ with W⁰ ⊂ Spec R the preimage of the interior. The notion is independent of Σ, agrees with Boxer's [Box15, Def. 3.4.1] when good integral models exist, and is preserved by the prime-to-p Hecke correspondences that extend to the compactifications.

Hypotheses: Smooth toroidal setting.

Required API:

- `IsWellPositioned`: The predicate on locally closed subsets of S_k, with the boundary data Y^♮_Z.
- `IsWellPositioned.boundaryData`: Y^♮_Z ⊂ S_{Z,k}, uniquely determined by Y.
- `isWellPositioned_iff_chart`: Equivalent to Lan–Stroh's condition Y ×_S W⁰ = Y^♮_Z ×_{S_Z} W⁰ on all charts.
- `IsWellPositioned.indep_cone`: The notion does not depend on the choice of Σ.
- `IsWellPositioned.hecke`: Images under prime-to-p Hecke correspondences of well-positioned subsets are well-positioned.
- `IsWellPositioned.closure`: If Y is well-positioned, so are its closure in S_k and the complement Y₀ of Y in its closure.

Examples and tests:

- S_k itself is well-positioned, with Y^♮_Z = S_{Z,k} for every cusp label Z.
- The empty set is well-positioned with all Y^♮_Z empty.
- The ordinary locus of S_k is well-positioned, with Y^♮_Z the ordinary locus of S_{Z,k}.
- For n = 1 and [F⁺:ℚ] = 2, let Y ⊂ S_k be a closed curve with empty interior whose closure in S^*_k meets a proper cusp Z (positive torus rank; the open cusp is excluded). Then Y is not well-positioned: the boundary Shimura variety at Z is zero-dimensional, and the well-positioned condition would require Y to contain the full punctured boundary chart whenever its boundary datum there is nonempty.

Prerequisites: `IG.0`, `SC:C1`, `SC:C4`, `NM:R11.3`, `SC:C5`, `SC:C0`, `SC:C3`.

Source: [csnc](#ref-csnc), CSnc §3.1, Definition 3.1.1, p. 37; [csnc](#ref-csnc), CSnc §3.1, Remark 3.1.2, p. 38.

<a id="ig-2-partial-compactifications"></a>

**Partial toroidal and minimal compactifications of a well-positioned subset.** Let Y ⊂ S_k be well-positioned, Ỹ its closure in S_k and Y₀ = Ỹ ∖ Y. Let Ỹ^* and Y^*₀ (resp. Ỹ^tor, Y^tor₀) be the closures of Y and Y₀ in the minimal compactification S^*_k (resp. in the toroidal compactification S^tor_{K,Σ,k}). The partial minimal and partial toroidal compactifications are Y^* := Ỹ^* ∖ Y^*₀ and Y^tor := Ỹ^tor ∖ Y^tor₀, locally closed in S^*_k and S^tor_k with their reduced structures. They satisfy Y^* ×_{S^*_k} S_{Z,k} = Y^♮_Z for every cusp label Z, Y^tor is the preimage of Y^* under π : S^tor → S^*, the map Y^tor → Y^* is proper and surjective with π_*O = O after normalization, and Y^tor (resp. Y^*) is stratified by the (Z, [σ]) (resp. Z) as S^tor (resp. S^*) is.

Prove compatibility with Hecke correspondences and refinements of the cone decomposition.

Hypotheses: Smooth toroidal setting. Y well-positioned.

API: `partialMinimal`, `partialToroidal`, `partialToroidal_eq_preimage`, `partialMinimal_inter_boundary`, `partialToroidal_to_partialMinimal_proper`, `partialCompactification_hecke`.

Prerequisites: `IG.2`, `SC:C5`, `SC:C3`.

Source: [csnc](#ref-csnc), CSnc §3.1, p. 38; [ls18a-author](#ref-ls18a-author), Theorem 2.3.2 with display (2.3.3), author-copy pp.17–19; Definition 2.3.1, pp.16–17.

<a id="ig-2-lan-stroh-boundary-charts"></a>

**Boundary charts of partial toroidal compactifications (Lan–Stroh Theorem 2.3.2).** Let Y ⊂ S_k be well-positioned and Z a cusp label. The formal completion of Y^tor along its Z-stratum is canonically isomorphic to the Γ_Z-quotient of the formal completion of Ξ_{Z,Σ_Z} ×_{S_Z} Y^♮_Z along its toroidal boundary ∂_{Z,Σ_Z} ×_{S_Z} Y^♮_Z, compatibly with the corresponding description of Ŝ^tor_Z in ShimuraCompactifications C5. If Y is smooth (resp. regular), so is Y^tor.

Hypotheses: Smooth toroidal setting. Y well-positioned; Σ smooth with trivial stabilizers.

Prerequisites: `IG.2`, `SC:C5`, `SC:C4`, `NM:R11.3`.

Source: [csnc](#ref-csnc), CSnc §3.2, p. 41 (citing [LS18a, Thm 2.3.2(5)]).

<a id="ig-2-partial-minimal-closed"></a>

**Closed subsets give closed partial minimal compactifications.** Let Y ⊂ Y′ ⊂ S_k be well-positioned locally closed subsets with Y closed in Y′. Then Y^* is a closed subset of Y′^*, and Y^♮_Z is closed in Y′^♮_Z for every cusp label Z.

Hypotheses: Smooth toroidal setting.

Prerequisites: `IG.2`.

Source: [csnc](#ref-csnc), CSnc §3.1, Proposition 3.1.3, p. 38.

<a id="ig-2-leaves-are-well-positioned"></a>

**Central leaves are well-positioned; their partial toroidal compactifications are smooth.** For every p-divisible group X with G-structure over k, the central leaf C^X ⊂ S_k is well-positioned. For a cusp label Z = (Z_N, X) (X of O_F-rank r), (C^X)^♮_Z is the central leaf C^{X_Z}_Z of S_{Z,k} for the unique p-divisible group X_Z with G-structure (for the group with n replaced by n − r) such that X ≅ Hom(X, μ_{p^∞}) ⊕ X_Z ⊕ X ⊗ ℚ_p/ℤ_p, or empty if no such X_Z exists. Writing C^X_Z := C^{X,*} ×_{S^*} S_Z, this identifies C^X_Z = C^{X_Z}_Z. The partial toroidal compactification C^{X,tor} is a smooth variety over k.

Hypotheses: Smooth toroidal setting.

Prerequisites: `IG.2`, `IG.0`, `SC:C4`, `NM:R11.3`.

Source: [csnc](#ref-csnc), CSnc §3.1, Proposition 3.1.4, p. 38; [csnc](#ref-csnc), CSnc §3.1, Lemma 3.1.5, p. 39.

### Connected boundary torsion and Igusa extensions

<a id="ig-2-connected-part-at-boundary"></a>

**The connected part of A[p^∞] over C^{X,tor} is a p-divisible group, and the biconnected part carries a polarization.** Let 𝒜 be the semi-abelian scheme over C^{X,tor} (restriction of the universal one over S^tor). For m ≥ 1 the groups 𝒜[p^m] are quasi-finite flat; across a nonempty degenerating boundary they are not finite flat and 𝒜[p^∞] is not a p-divisible group. If the boundary is empty, this obstruction does not occur. In either case, its connected part 𝒜[p^∞]° (the ind-scheme 𝒜̂[p^∞] of the formal completion along the identity) is a p-divisible group over C^{X,tor} with O_F-action, geometrically isomorphic at every point to X° = Hom(X, μ_{p^∞}) ⊕ X°_Z. Its multiplicative part 𝒜[p^∞]^μ has constant rank, and the biconnected part 𝒜[p^∞]^{(0,1)} = 𝒜[p^∞]°/𝒜[p^∞]^μ carries a principal polarization extending the one over C^X.

Hypotheses: Smooth toroidal setting.

Prerequisites: `IG.2`, `SC:C4`, `NM:R11.3`, `AdicII:F0`, `FF:R07.1`.

Source: [csnc](#ref-csnc), CSnc §3.2, Proposition 3.2.1, p. 39; [csnc](#ref-csnc), CSnc §3.2, Proposition 3.2.2, p. 40.

<a id="ig-2-toroidal-igusa-finite-level"></a>

**Finite-level partial toroidal compactifications of Igusa varieties Ig^{X,tor}_m.** Let X = ⊕ X_i be completely slope divisible with G-structure. (1) The finite étale Γ_{m,X}-cover Ig^X_{Mant,m} → C^X extends uniquely to a finite étale cover Ig^{X,tor}_m → C^{X,tor}, Galois with group Γ_{m,X}. It represents Igusa level-p^m structures on C^{X,tor}-schemes T: for each i with λ_i > 0, an isomorphism ρ_{i,m} : 𝒜[p^∞]_i[p^m] ×T ≅ X_i[p^m] × T commuting with O_F and lifting fppf locally to all p^{m′}, together with a scalar in (ℤ/p^m)^×(T) such that ρ_{i,m}, ρ_{j,m} commute with the polarizations up to that scalar whenever λ_i + λ_j = 1. (2) With the splitting of Z_N of ShimuraCompactifications C5 fixed, for each cusp label Z the formal completion of Ig^{X,tor}_m along its Z-stratum is canonically isomorphic to 𝔜_{Z,Σ_Z}/Γ_Z, where 𝔜_{Z,Σ_Z} is the completion along the boundary of the Γ_{m,X}-torsor Ig^X_{Z,Σ_Z} → Ξ_{Z,Σ_Z} ×_{S_Z} C^X_Z defined by Igusa level structures on the completely slope divisible connected part H_Z of the Raynaud extension G_Z over C_Z ×_{S_Z} C^X_Z.

Hypotheses: Smooth toroidal setting. X completely slope divisible with G-structure.

API: `ToroidalIgusa`, `ToroidalIgusa.represents`, `ToroidalIgusa.restrict_open`, `ToroidalIgusa.unique`, `ToroidalIgusa.boundaryChart`, `ToroidalIgusa.transition`.

Prerequisites: `IG.1`, `IG.2`, `IG.0`.

Source: [csnc](#ref-csnc), CSnc §3.2.3, Theorem 3.2.4, p. 40; [csnc](#ref-csnc), CSnc §3.2.3, Theorem 3.2.6, p. 41.

<a id="ig-2-perfect-toroidal-igusa-variety"></a>

**The perfect toroidal Igusa variety Ig^{X,tor}.** For any p-divisible group X with G-structure over k (not necessarily completely slope divisible), the pro-finite étale Γ_X-cover Ig^X → C^X_perf extends uniquely to a pro-finite étale cover Ig^{X,tor} → C^{X,tor}_perf, Galois with group Γ_X. It represents perfect Igusa level structures on perfect C^{X,tor}-schemes T: an O_F-linear isomorphism ρ : 𝒜[p^∞]° ×T ≅ X° × T together with a scalar in ℤ_p^×(T) such that the induced isomorphism of biconnected parts ρ^{(0,1)} commutes with the polarizations up to that scalar. If X is completely slope divisible, Ig^{X,tor} is the perfection of lim_m Ig^{X,tor}_m. Ig^X is an fpqc Aut(X)-torsor over C^X before perfection, but this fails over the toroidal boundary strata.

Hypotheses: Smooth toroidal setting.

API: `PerfectToroidalIgusa`, `PerfectToroidalIgusa.represents`, `PerfectToroidalIgusa.restrict_open`, `PerfectToroidalIgusa.eq_perf_lim`, `PerfectToroidalIgusa.action`.

Prerequisites: `IG.1`, `IG.2`, `IG.0`, `mathlib:PerfectRing`.

Source: [csnc](#ref-csnc), CSnc §3.2.7, Theorem 3.2.8, p. 42; [csnc](#ref-csnc), CSnc §3.2.7, Remark 3.2.10, p. 42.

<a id="ig-2-igusa-boundary-charts"></a>

**Boundary charts of the perfect toroidal Igusa variety.** (1) The Γ_X-torsor C^{Ig,X}_Z → (C_Z ×_{S_Z} C^X_Z)_perf parametrizing O_F-linear isomorphisms H_Z ≅ X° with a ℤ_p^×-scalar compatible on biconnected parts is the perfect scheme parametrizing (B, ι, λ, η) ∈ S_Z, an extension 0 → T → G → B → 0 by the split torus with cocharacter group X, and an O_F-linear embedding ρ : G[p^∞] ↪ X such that T[p^∞] ⊂ G[p^∞] ⊂ X is symplectic and B[p^∞] = G[p^∞]/T[p^∞] ≅ Gr_{−1} compatibly with principal polarizations. (2) The 𝐒_{Z,perf}-torsor Ξ^{Ig,X}_Z → C^{Ig,X}_Z is the perfection of the 𝐒_Z-torsor of symmetric lifts f : X → G of f₀ : X → B^∨ ≅ B; after choosing a symplectic splitting δ_X of the filtration of X, it parametrizes symmetric lifts f̃ : X[1/p] → G of the induced f̃₀ : X[1/p] → B. (3) With the splitting of Z_N fixed, the completion of Ig^{X,tor} along its Z-stratum is canonically isomorphic to 𝔜_{Z,Σ_Z}/Γ_Z, 𝔜_{Z,Σ_Z} the completion of Ξ^{Ig,X}_{Z,Σ_Z} := Ξ^{Ig,X}_Z ×_{Ξ_Z} Ξ_{Z,Σ_Z} along its toroidal boundary.

Hypotheses: Smooth toroidal setting.

Prerequisites: `IG.2`, `IG.0`, `SC:C4`, `NM:R11.3`.

Source: [csnc](#ref-csnc), CSnc §3.2.7, Proposition 3.2.11, p. 43; [csnc](#ref-csnc), CSnc §3.2.7, Theorem 3.2.13, p. 44.

### Quasi-isogenies and Ekedahl–Oort affineness

<a id="ig-2-unit-similitude-quasi-isogeny"></a>

**Existence of unit-similitude G-quasi-isogenies that are isomorphisms on étale and multiplicative parts (p split in F₀).** Assume p splits in the imaginary quadratic F₀ ⊂ F. Let X, X′ be p-divisible groups with G-structure over k in the same isogeny class b. Then there is a G-quasi-isogeny φ : X′ → X with similitude factor 1 that restricts to isomorphisms X′^{ét} ≅ X^{ét} and X′^μ ≅ X^μ.

Hypotheses: p split in F₀ (so G_{ℚ_p} ≅ ℚ_p^× × ∏_{v|𝔭} GL_{2n}(F_v) for 𝔭 a prime of F₀ above p).

Prerequisites: `IG.0`.

Source: [csnc](#ref-csnc), CSnc §3.3.1, footnote 15, p. 45.

<a id="ig-2-toroidal-isogeny-invariance"></a>

**Quasi-isogeny invariance of toroidal Igusa varieties.** Let φ : X → X′ be a quasi-isogeny of p-divisible groups with G-structure over k, with similitude factor in ℤ_p^×, inducing isomorphisms on étale and multiplicative parts. Then the isomorphism Ig^X ≅ Ig^{X′} induced by φ (IG.1/igusa-isogeny-invariance) extends uniquely to an isomorphism Ig^{X,tor} ≅ Ig^{X′,tor} over the correspondence of partial toroidal compactifications, equivariantly for the prime-to-p Hecke action. This is the unit-similitude extension theorem required for the transfer arguments below; its proof must construct a principally polarized boundary quotient and establish compatibility with the interior isomorphism.

Hypotheses: Smooth toroidal setting. φ a G-quasi-isogeny with unit similitude, isomorphism on X^{ét} and X^μ.

Prerequisites: `IG.2`, `IG.1`.

Source: [csnc](#ref-csnc), CSnc §3.2.7, before Corollary 3.2.14, p. 44; [csnc](#ref-csnc), CSnc §3.2.7, Corollary 3.2.14, p. 44.

<a id="ig-2-ekedahl-oort-stratification"></a>

**Ekedahl–Oort strata via G-zips and their Hasse sections.** For the PEL datum of IG.0 at p unramified, the p-torsion A[p] of the universal abelian scheme over S_k with its O_F-action and polarization defines an F-zip with G-structure (Moonen–Wedhorn; Pink–Wedhorn–Ziegler), hence a morphism ζ : S_k → [E_𝒵\G_k] to the stack of G-zips, which is smooth. The Ekedahl–Oort strata S^w, w ∈ ^JW (minimal-length coset representatives for the Weyl group of the Levi of μ), are the locally closed fibres of ζ over the points of [E_𝒵\G_k]; dim S^w = ℓ(w). Each stratum closure carries Hasse sections: sections of a power of the Hodge line bundle ω^{⊗N} on the closure of S^w whose non-vanishing locus is exactly S^w (Boxer; Goldring–Koskivirta). EO strata extend to the toroidal and minimal compactifications as well-positioned subsets, and the Hasse sections extend to S^* using the ample Hodge line bundle there.

The zip morphism is smooth and each nonempty stratum has dimension ℓ(w). Its Hasse section cuts out the stratum inside its closure; for the ordinary stratum use a matching positive power of the classical Hasse invariant.

Hypotheses: Smooth toroidal setting. PEL datum of type (A) or (C) unramified at p (here the quasi-split unitary datum).

API: `ekedahlOortStratum`, `ekedahlOortStratum_dim`, `zipMorphism_smooth`, `hasseSection`, `ekedahlOortStratum_wellPositioned`, `ekedahlOortStratum_ordinary`.

Prerequisites: `IG.0`, `IG.2`, `HT:T0`, `FF:R07.2`, `VB:VB0`, `SC:C5`.

Source: [csnc](#ref-csnc), CSnc §3.3.1, proof of Theorem 3.3.2, p. 45; [box15](#ref-box15), Theorem C, p. 17 (§1.5 of the Introduction; with Theorem B, p. 17); in the text Theorem 6.2.3 and Corollary 6.2.4, p. 190; [ls18a-author](#ref-ls18a-author), Proposition3.5.1(3)–(4), p.41; Proposition3.5.5 and Corollary3.5.8, pp.41–42 (84-page current author copy).

<a id="ig-2-eo-strata-minimal-affine"></a>

**Partial minimal compactifications of Ekedahl–Oort strata are affine.** For every w ∈ ^JW, the partial minimal compactification (S^w)^* of the Ekedahl–Oort stratum S^w (a well-positioned subset) is affine.

Hypotheses: Smooth toroidal setting.

Prerequisites: `IG.2`, `SC:C5`.

Source: [box15](#ref-box15), Theorem C, p. 17 (§1.5 of the Introduction; with Theorem B, p. 17); in the text Theorem 6.2.3 and Corollary 6.2.4, p. 190; [csnc](#ref-csnc), CSnc §3.3.1, proof of Theorem 3.3.2, p. 45.

<a id="ig-2-fundamental-eo-stratum-in-newton-stratum"></a>

**Every Newton stratum contains an Ekedahl–Oort stratum, which is a central leaf.** For every b ∈ B(G_{ℚ_p}, μ^{−1}) there is an EO label w ∈ ^JW whose associated affine Weyl representative is fundamental such that the Ekedahl–Oort stratum S^w is contained in the Newton stratum S^b; for such w, the p-divisible groups with G-structure at the points of S^w are all isomorphic, so S^w is a central leaf C^{X_w} with X_w the minimal p-divisible group with G-structure in the class b.

Hypotheses: PEL datum of type (A) or (C) unramified at p (Nie's results are for unramified groups with minuscule μ).

Prerequisites: `IG.2`, `IG.0`, `BG:BG1`.

Source: [nie15](#ref-nie15), Proposition 1.5, p. 3 (arXiv:1310.2229v2; proof on p. 12); [nie15](#ref-nie15), Corollary 1.6, p. 4 (arXiv:1310.2229v2); [nie15](#ref-nie15), Theorem1.4, p.3 (arXiv:1310.2229v2), with Corollary1.6 p.4.

<a id="ig-2-affineness-transfer-lemma"></a>

**Transfer of affineness through proper correspondences.** Consider schemes X ← C → Y with maps π₁, π₂, and closed subschemes X₀ ⊂ X, C₀ ⊂ C, Y₀ ⊂ Y with C₀ topologically the preimage of both X₀ and Y₀. Assume X, X₀ and Y₀ are affine, and π₁, π₂ are proper, surjective and finite away from C₀. Then Y is affine.

Hypotheses: π₁, π₂ proper surjective, finite away from C₀; X, X₀, Y₀ affine.

Prerequisites: `mathlib:AlgebraicGeometry.IsAffine`, `mathlib:AlgebraicGeometry.IsProper`, `mathlib:AlgebraicGeometry.IsFinite`, `mathlib:AlgebraicGeometry.Scheme.Hom.normalization`.

Source: [csnc](#ref-csnc), CSnc §3.3.1, Lemma 3.3.3, p. 46.

<a id="ig-2-leaf-minimal-compactification-affine"></a>

**Partial minimal compactifications of central leaves are affine.** The affineness target for a p-divisible group X with G-structure has the following two forms: (1) for X = X_w the minimal p-divisible group of a fundamental element (IG.2/fundamental-eo-stratum-in-newton-stratum), C^{X,*} is affine unconditionally; (2) for an arbitrary X in the same isogeny class, C^{X,*} is affine provided there is a unit-similitude G-quasi-isogeny X_w → X that is an isomorphism on étale and multiplicative parts (IG.2/unit-similitude-quasi-isogeny, available for p split in F₀) and the toroidal invariance IG.2/toroidal-isogeny-invariance holds for it.

Hypotheses: Smooth toroidal setting.

Prerequisites: `IG.2`.

Source: [csnc](#ref-csnc), CSnc §3.3.1, Theorem 3.3.2, p. 45; [csnc](#ref-csnc), CSnc §3.3.1, proof of Theorem 3.3.2, p. 45.

### Normalization and cusp strata

<a id="ig-2-perfect-minimal-igusa"></a>

**The partial minimal compactification Ig^{X,*} of the perfect Igusa variety.** Define Ig^{X,*} as the normalization of C^{X,*} in the perfect Igusa variety Ig^X. Then Ig^{X,*} → C^{X,*} is integral, so Ig^{X,*} is affine when C^{X,*} is; it agrees with the Stein factorization of Ig^{X,tor} → C^{X,*}, so, when C^{X,*} is affine, Ig^{X,*} = Spec H⁰(Ig^{X,tor}, O). A G-quasi-isogeny φ : X → X′ as in IG.2/toroidal-isogeny-invariance induces Ig^{X,*} ≅ Ig^{X′,*}.

Hypotheses: Smooth toroidal setting.

API: `PerfectMinimalIgusa`, `PerfectMinimalIgusa.integral`, `PerfectMinimalIgusa.eq_spec_H0`, `PerfectMinimalIgusa.isAffine`, `PerfectMinimalIgusa.open`.

Prerequisites: `IG.2`, `mathlib:AlgebraicGeometry.Scheme.Hom.normalization`.

Source: [csnc](#ref-csnc), CSnc §3.3.1, Proposition 3.3.4, p. 46.

<a id="ig-2-minimal-igusa-compactification"></a>

**Finite-level partial minimal compactifications Ig^{b,*}_m of Igusa varieties.** Fix b ∈ B(G_{ℚ_p}, μ^{−1}) and a completely slope divisible X_b with G-structure in the class b; when possible take X_b = X_w minimal for a fundamental w (IG.2/fundamental-eo-stratum-in-newton-stratum), which is completely slope divisible. Let C^b = C^{X_b} and Ig^b_m = Ig^{X_b}_{Mant,m}. Define Ig^{b,*}_m as the normalization of C^{b,*} in Ig^b_m and Ig^{b,*} := lim_m Ig^{b,*}_m. Then: (1) h^{b,*}_m : Ig^{b,*}_m → C^{b,*} is finite and surjective, so Ig^{b,*}_m is affine whenever C^{b,*} is; (2) Ig^b_m ↪ Ig^{b,*}_m is a dense open immersion and Ig^{b,*}_m is normal; (3) Ig^{b,*} → C^{b,*} is integral (not finite) and Ig^{b,*} is affine whenever C^{b,*} is; its perfection is Ig^{X_b,*} of IG.2/perfect-minimal-igusa.

Extend prime-to-p Hecke correspondences and the level-changing Mantovan monoid maps through normalization.

Hypotheses: Smooth toroidal setting. X_b completely slope divisible.

API: `MinimalIgusa`, `MinimalIgusa.finite`, `MinimalIgusa.normal`, `MinimalIgusa.isAffine`, `MinimalIgusa.lim_integral`, `MinimalIgusa.perf`, `MinimalIgusa.hecke`.

Prerequisites: `IG.1`, `IG.2`, `mathlib:AlgebraicGeometry.Scheme.Hom.normalization`, `mathlib:AlgebraicGeometry.IsFinite`.

Source: [csnc](#ref-csnc), CSnc §3.3.6, Definition 3.3.7, p. 46; [csnc](#ref-csnc), CSnc §3.3.6, Lemma 3.3.8, p. 47; [csnc](#ref-csnc), CSnc §2.8, Theorem 2.8.1, p. 33.

<a id="ig-2-igusa-cusp-labels"></a>

**Igusa cusp labels.** An Igusa cusp label is a triple Z̃ = (Z_b, Z^p, X) where (1) Z_b is an O_F-stable filtration Z_{b,−2} ⊂ Z_{b,−1} ⊂ X_b with Gr_{−2} = Z_{b,−2} multiplicative, Gr_0 = X_b/Z_{b,−1} étale, identified as Cartier dual by the polarization (so Gr_{−1} is principally polarized); (2) Z^p is an O_F-stable symplectic filtration Z^p_{−2} ⊂ Z^p_{−1} ⊂ L ⊗ ℤ̂^p; (3) X is a finite projective O_F-module with isomorphisms X ⊗ ℚ_p/ℤ_p ≅ Gr^{Z_b}_0 and X ⊗ ℤ̂^p ≅ Gr^{Z^p}_0. J_b(ℚ_p) × G(𝔸_f^p) acts on Igusa cusp labels; at level K (compact open) an Igusa cusp label is a K-orbit, and for K = Γ_b(p^m)K^p(N) these are triples (Z_{m,b}, Z_N, X) with Z = (Z_N, X) a cusp label at level K(N) and Z_{m,b} an O_F-linear symplectic filtration of X_b[p^m] with X/p^m ≅ Gr_0. Its stabilizer is Γ_Z̃ = {γ ∈ Aut_{O_F}(X) : γ ≡ 1 mod p^mN}.

Hypotheses: Smooth toroidal setting. X_b completely slope divisible.

Required API:

- `IgusaCuspLabel`: Triples (Z_b, Z^p, X) as above.
- `IgusaCuspLabel.toCuspLabel`: The underlying cusp label (Z^p, X) of the Shimura variety.
- `IgusaCuspLabel.action`: Action of J_b(ℚ_p) × G(𝔸_f^p).
- `IgusaCuspLabel.atLevel`: At level Γ_b(p^m)K^p(N), Igusa cusp labels correspond to triples (Z_{m,b}, Z_N, X).
- `IgusaCuspLabel.stabilizer`: Γ_Z̃ = {γ ∈ Aut_{O_F}(X) : γ ≡ 1 mod p^mN}.
- `IgusaCuspLabel.rank`: r = rk_{O_F} X ∈ {0, …, n}.

Examples and tests:

- The label with X = 0 corresponds to the open stratum Ig^b_m.
- At m = 0 (level Γ_b K^p(N)) the filtration Z_{0,b} of X_b[p⁰] = 0 is trivial, so the Igusa cusp labels above a cusp label Z of the leaf correspond to Z itself; for n = 1, F imaginary quadratic and b ordinary there is exactly one above each cusp.
- If X_b^{ét} = 0 there are no Igusa cusp labels with X ≠ 0.

Prerequisites: `IG.0`, `SC:C1`.

Source: [csnc](#ref-csnc), CSnc §3.3.9, Definition 3.3.10, p. 47; [csnc](#ref-csnc), CSnc §3.3.9, p. 47.

<a id="ig-2-toroidal-igusa-boundary-strata"></a>

**Boundary strata of finite-level toroidal Igusa varieties over Igusa cusp labels.** (1) The completion of Ig^{b,tor}_m along its Z-stratum decomposes into open and closed formal subschemes indexed by Igusa cusp labels Z̃ at level Γ_b(p^m)K^p(N) above Z. (2) Fix a symplectic O_F-linear splitting δ_{m,b} of X_b[p^m] along Z_{m,b} and the splitting of Z_N. There is an abelian scheme C_Z̃ = Hom_{O_F}((1/N)X, (B/B[p^m]^μ)^∨) over the level-p^m Igusa variety Ig^b_{Z,m} of the boundary leaf C^b_Z ⊂ S_Z, mapping to C_Z over S_Z, such that, with Ξ_{Z̃,Σ_Z} the pullback of Ξ_{Z,Σ_Z} → C_Z to C_Z̃ and 𝔛_{Z̃,Σ_Z} its completion along the toroidal boundary, the Z̃-piece is Γ_Z̃-equivariantly 𝔛_{Z̃,Σ_Z}/Γ_Z̃; the moduli interpretation is by Igusa level-p^m structures compatible with Z̃ and δ_{m,b} (Definition 3.3.13). The natural map C_Z̃ → C_Z ×_{S_Z} Ig^b_{Z,m} is finite étale.

Hypotheses: Smooth toroidal setting. X_b completely slope divisible.

Prerequisites: `IG.2`, `SC:C4`, `NM:R11.3`, `SC:C5`.

Source: [csnc](#ref-csnc), CSnc §3.3.11, Theorem 3.3.12, p. 48; [csnc](#ref-csnc), CSnc §3.3.11, proof of Theorem 3.3.12, p. 50.

<a id="ig-2-minimal-igusa-boundary-strata"></a>

**Boundary strata of Ig^{b,*}_m.** There is a decomposition into locally closed strata Ig^{b,*}_m = ⊔_{Z̃} Ig^b_{Z̃}, Z̃ running over Igusa cusp labels at level Γ_b(p^m)K^p(N), with Ig^b_{Z̃} ≅ Ig^b_{Z,m}, the level-p^m Igusa variety over the boundary leaf C^b_Z in S_Z (for the smaller unitary group of rank 2(n − r)). If the stratum of Z̃ meets the closure of the stratum of Z̃′, the underlying cusp labels satisfy the corresponding closure relation. This necessary condition does not identify all Igusa-level incidence relations from the underlying labels alone.

Hypotheses: Smooth toroidal setting. X_b completely slope divisible.

Prerequisites: `IG.2`, `SC:C5`.

Source: [csnc](#ref-csnc), CSnc §3.3.14, Theorem 3.3.15, p. 50.

## Layer IG.3: Hodge–Tate period fibres and the product formula

The local Hodge–Tate map, universal-cover automorphisms and the product formula identify the open period fibres. Extending the trivializations across boundary charts gives the compactified fibre theorem. Rank-one point comparisons are upgraded using qcqs diamonds and canonical compactifications with proper targets. The minimal case also uses relative primitive comparison. The final filtration retains the equivariant orientation data needed by the local arithmetic argument.

### Good reduction and the local period map

<a id="ig-3-good-reduction-locus"></a>

**The good-reduction locus S° and its infinite-level tower.** Inside the adic space S_{K(N),ℚ_p} attached to S_{K(N)} ⊗ ℚ_p, the good-reduction locus S°_{K(N),ℚ_p} is the locus of points where the universal abelian variety has good reduction; it is a Hecke-equivariant quasicompact open subspace, equal for p ∤ NΔ_F to the adic generic fibre of the p-adic completion of S_{K(N)} ⊗ ℤ_p. At infinite level, S°_{K(p^∞N)} := lim_m S°^◇_{K(p^mN),ℚ_p} is representable by a perfectoid space (Scholze, Theorem 4.1.1), open in S^*_{K(p^∞N)}, and the Hodge–Tate period map restricts to π°_HT : S°_{K(p^∞N)} → Fℓ. Here S^*_{K(p^∞N)} = lim_m S^{*,◇}_{K(p^mN),ℚ_p} and S^tor_{K(p^∞N)} = lim_m S^{tor,◇}_{K(p^mN),ℚ_p} (limits of spatial diamonds), both representable by perfectoid spaces (S^tor for a cofinal choice of Σ).

Hypotheses: Valued-field fibre setting.

API: `goodReductionLocus`, `goodReductionLocus_eq_genericFibre`, `goodReductionLocus_hecke`, `goodReductionLocus_infinite`, `goodReductionLocus_piHT`.

Prerequisites: `IG.0`, `PSV:S0`, `PSV:S2`, `PSV:S4`, `PSV:S1`, `PSV:S3`, `SF:SF.4`, `AdicII:F0`, `AdicII:R2`.

Source: [csnc](#ref-csnc), CSnc §2.6, p. 31; [csnc](#ref-csnc), CSnc §2.6, Theorem 2.6.2, p. 30.

<a id="ig-3-good-reduction-locus-cohomology"></a>

**The good-reduction locus carries all the cohomology.** Let C be a complete algebraically closed extension of ℚ_p and N ≥ 3 prime to p. The natural Hecke-equivariant map H^i(S_{K(N),ℚ̄}, 𝔽_ℓ) → H^i(S°_{K(N),C}, 𝔽_ℓ) is an isomorphism for every i and every ℓ ≠ p. (Lan–Stroh prove it for every N ≥ 3, also divisible by p; only N prime to p is used and planned here.)

Hypotheses: Valued-field fibre setting. ℓ ≠ p.

Prerequisites: `IG.3`, `CAEC:H1:formal-adic-comparison`, `SC:C5`, `LPV:LPV.0`.

Source: [csnc](#ref-csnc), CSnc §2.6, Proposition 2.6.4, p. 31; [csnc](#ref-csnc), CSnc §2.6, proof of Proposition 2.6.4, p. 32; [ls18b](#ref-ls18b), Corollary 5.20, p. 25 of the authors' compilation.

<a id="ig-3-flag-points-and-p-divisible-groups"></a>

**Flag points give p-divisible groups with G-structure over O_C and their Newton points.** Let Fℓ be the adic space over ℚ_p attached to the flag variety of totally isotropic F-linear subspaces of V. For C as above, points x ∈ Fℓ(C) correspond bijectively to isomorphism classes of pairs (𝒳_{O_C}, α) with 𝒳_{O_C} a p-divisible group with G-structure over O_C and α : T_p𝒳_{O_C} ≅ L ⊗ ℤ_p an isomorphism compatible with G-structures; the subspace is the Hodge–Tate filtration Lie 𝒳 ⊗ C(1) ⊂ T_p𝒳 ⊗ C. The special fibre X_k = 𝒳_{O_C} ⊗ k is a p-divisible group with G-structure over k, whose isogeny class defines b(x) ∈ B(G_{ℚ_p}, μ^{−1}). The filtration 𝒳^μ ⊂ 𝒳° ⊂ 𝒳 transported by α is a symplectic O_F-linear filtration of L ⊗ ℤ_p; fixing a symplectic splitting δ gives a splitting δ_{𝒳} of 𝒳 and δ_X of X.

Hypotheses: Valued-field fibre setting.

Prerequisites: `IG.0`, `HT:T2`, `PSV:S3`.

Source: [csnc](#ref-csnc), CSnc §4.1, p. 51; [csnc](#ref-csnc), CSnc §2.7, p. 33.

<a id="ig-3-flag-newton-strata-dimension"></a>

**Dimension of the Newton strata of the flag variety: dim Fℓ^b = d − d_b.** Let Fℓ = ⊔_{b ∈ B(G_{ℚ_p}, μ^{−1})} Fℓ^b be the Newton stratification (x ∈ Fℓ^b(C) iff b(x) = b), with locally closed partially proper strata and Fℓ^{≥b} closed (BunGAndNewtonStrata BG3). Then the Krull dimension of |Fℓ^b| is ⟨2ρ, μ⟩ − ⟨2ρ, ν_b⟩ = d − d_b, where d = [F⁺:ℚ]n² and d_b = ⟨2ρ, ν_b⟩ = dim Ig^b. Since the reflex field is ℚ, the ordinary element is the largest in B(G_{ℚ_p}, μ^{−1}) and Fℓ^{ord} = Fℓ(ℚ_p) is 0-dimensional; d_{b′} ≥ d_b whenever b′ ≥ b.

Hypotheses: Valued-field fibre setting. Unramified PEL data of type (A) or (C) (for the local argument).

Prerequisites: `IG.3`, `BG:BG3`, `BG:BG2:uniformization`, `BG:BG1`, `DEC:C8`, `PSV:S1`.

Source: [cs17](#ref-cs17), CS17 §4.2, Proposition 4.2.23, p. 713; [csnc](#ref-csnc), CSnc §2.7, Theorem 2.7.3, p. 33; [csnc](#ref-csnc), CSnc §2.7, p. 33.

<a id="ig-3-local-hodge-tate-period-map"></a>

**Rapoport–Zink spaces at infinite level and the local Hodge–Tate period map.** For an unramified local PEL datum D^int, let M_{D^int} = (𝔐_{D^int})^ad_η and, for n ≥ 0, M_{D^int,n} the finite étale covers parametrizing O_B-linear Λ/p^n → G[p^n]^ad_η matching the pairings (with ζ_{p^n} fixed). M_{D^int,∞} sends a complete affinoid (Ĕ(ζ_{p^∞}), O)-algebra (R, R⁺) to triples (G, ρ, α) with (G, ρ) ∈ M_{D^int}(R, R⁺) and α : Λ → T_pG^ad_η(R, R⁺) an O_B-linear map matching the pairing and an isomorphism at all geometric points. (1) M_{D^int,∞} is representable by an adic space, preperfectoid, with M_{D^int,∞} ∼ lim_n M_{D^int,n}; it depends only on D (write M_{D,∞}) and is the sheafification of B-linear maps V → (X̃_b)^ad_η(R, R⁺) matching the polarization, with totally isotropic image in D(X_b)[1/p] ⊗ R, locally free quotient W locally ≅ V₁ ⊗ R, and exact 0 → V → X̃_b(C, C⁺) → W ⊗ C → 0 at geometric points. (2) There is a G(ℚ_p)-equivariant local Hodge–Tate period map π_HT : M_{D,∞} → Fℓ_{G,μ} (Fℓ_{G,μ} parametrizing B-equivariant quotients V ⊗ R → W′ with totally isotropic kernel, W′ locally ≅ V₀ ⊗ R), sending a point to the kernel of V ⊗ R → D(X_b)[1/p] ⊗ R. (3) π_HT factors through the b-stratum: π^b_HT : M_{D,∞} → Fℓ^b_{G,μ}.

The G(ℚ_p)-action on α commutes with the J_b(ℚ_p)-action on ρ. The period map is invariant under the second action.

Hypotheses: Unramified local PEL datum of type (A) or (C).

API: `RZSpaceInfinite`, `RZSpaceInfinite.tilde_lim`, `RZSpaceInfinite.rational_description`, `localHodgeTate`, `localHodgeTate_mem_stratum`, `RZSpaceInfinite.groupActions`.

Prerequisites: `IG.0`, `IG.3`, `PSV:S3`, `BG:BG3`, `BG:BG2:uniformization`, `FF:R07.2`, `VB:VB0`.

Source: [cs17](#ref-cs17), CS17 §4.2, Theorem 4.2.4, p. 699; [cs17](#ref-cs17), CS17 §4.2, Proposition 4.2.5, p. 702; [cs17](#ref-cs17), CS17 §4.2, Proposition 4.2.6, p. 702.

### Automorphism orbits and integral extension

<a id="ig-3-local-period-fibres"></a>

**Fibres of the local Hodge–Tate period map are Aut_G(X̃_b)-orbits.** Fix K_∞ = the completion of Ĕ(ζ_{p^∞}), and take the infinite-level PEL space M_{D,∞}, the flag variety Fl_{K_∞}, and Aut_G(X̃_b)^ad_η after the indicated base changes to K_∞. The automorphism action changes the quasi-isogeny and preserves both the Hodge–Tate period and the map to K_∞. Its action map M̂_{D,∞} ×_{Spa K_∞} Aut_G(X̃_b)^ad_{η,K_∞} → (M_{D,∞} ×_{Fl_{K_∞}} M_{D,∞})^∧ is an isomorphism of perfectoid spaces. Here hats denote strong completions of the preperfectoid adic spaces. If the flag variety is kept over the smaller base Ĕ, the target also has pairs with different cyclotomic structure maps; the action identifies only the part over the cyclotomic diagonal.

Hypotheses: Unramified local PEL datum of type(A) or(C); choose the completed cyclotomic base K_∞ and take the flag fibre product over Fl_{K_∞}.

Prerequisites: `IG.3`, `IG.0`, `HT:T2`, `PS:P2`, `PS:P7`.

Source: [cs17](#ref-cs17), CS17 §4.2, Proposition 4.2.14, p. 709.

<a id="ig-3-integral-extension-lemma"></a>

**Extending morphisms of p-divisible groups over R⁺ from rank-one points.** Let R⁺ be a ℤ_p-algebra integrally closed in R = R⁺[1/p], and G, H p-divisible groups over R⁺ whose Newton polygons at points of Spec(R⁺/p) are constant. A morphism f_R : G_R → H_R over R extends (necessarily uniquely) to f : G → H over R⁺ if and only if for every geometric rank-one point Spa(C, O_C) of Spa(R, R⁺) the base change f_C extends to O_C.

Hypotheses: R⁺ integrally closed in R⁺[1/p]; constant Newton polygons.

Prerequisites: `IG.0`, `mathlib:ValuationRing`.

Source: [cs17](#ref-cs17), CS17 §4.2, Lemma 4.2.15, p. 709.

<a id="ig-3-local-period-surjective-on-stratum"></a>

**Surjectivity of the local period map onto the b-stratum on (C, O_C)-points.** For C/Ĕ(ζ_{p^∞}) complete algebraically closed, π^b_HT : M_{D,∞}(C, O_C) → Fℓ^b_{G,μ}(C, O_C) is surjective.

Hypotheses: Unramified local PEL datum of type (A) or (C).

Prerequisites: `IG.3`, `VB:VB2`, `VB:VB2:classification`.

Source: [cs17](#ref-cs17), CS17 §4.2, Lemma 4.2.18, p. 711.

<a id="ig-3-automorphism-group-dimension"></a>

**The adic generic fibre of Aut_G(X̃_b) is partially proper of dimension ⟨2ρ, ν_b⟩.** For every complete nonarchimedean field K over O_Ĕ, Aut_G(X̃_b)^ad ×_{Spa(O_Ĕ)} Spa(K, O_K) is partially proper over Spa(K, O_K), of dimension ⟨2ρ, ν_b⟩; each connected component is Spa(O_Ĕ[[x₁^{1/p^∞}, …, x_d^{1/p^∞}]]) ×_{Spa O_Ĕ} Spa(K, O_K), after extending K to a perfectoid field and tilting, the same dimension is computed on a d-dimensional open unit disc.

Hypotheses: Unramified local PEL data of type (A) or (C); K of characteristic 0.

Prerequisites: `IG.0`, `IG.3`, `DEC:C8`.

Source: [cs17](#ref-cs17), CS17 §4.2, Proposition 4.2.22, p. 712.

### Witt lifts and the product formula

<a id="ig-3-canonical-lift-of-igusa"></a>

**The canonical formal lift of the perfect Igusa variety and the space 𝔛^b.** Being perfect, Ig^b (and Ig^{X,tor}, Ig^{X,*}) lifts uniquely to a flat p-adic formal scheme W(Ig^b) over W(k) = O_Ĕ (apply Witt vectors to an affine cover and glue); for K/Ĕ complete, Ig^b_{O_K} := W(Ig^b) ⊗_{W(k)} O_K, and similarly Ig^{X,tor}_{O_C} := W(Ig^{X,tor}) ×_{W(k)} O_C, the unique flat formal lift of Ig^{X,tor}_{O_C/p^ε}. On Nilp_{O_Ĕ}, Ig^b_{O_Ĕ} parametrizes abelian varieties with G-structure up to p-power isogeny with an isomorphism of the universal cover of A[p^∞] with that of the canonical lift of X_b. Fixing a lift (X_b)_{O_K} ∈ 𝔐^b(O_K) of X_b (exists with K = Ĕ by formal smoothness), Ig^b_{O_K}(R) = {(A, ρ) : ρ : A[p^∞] ≅ (X_b)_{O_K} ⊗ R} for R ∈ Nilp_{O_K}. The functor 𝔛^b on Nilp_{O_Ĕ} of pairs (A, ρ) with A ∈ S_{K_pK^p}(R) and ρ : A[p^∞] ⊗ R/p → X_b ⊗ R/p a quasi-isogeny with extra structures satisfies 𝔛^b_{O_K} ≅ Ig^b_{O_K} ×_{O_Ĕ} 𝔐^b (Lemma 4.3.12), over Nilp_{O_Ĕ}, with the displayed direction of ρ.

Hypotheses: PEL data of type (A) or (C) unramified at p with hyperspecial level; X_b completely slope divisible.

API: `canonicalLift`, `canonicalLift_unique`, `canonicalLift_genericFibre_perfectoid`, `canonicalLift_moduli`, `XbSpace_decomp`.

Prerequisites: `IG.1`, `IG.0`, `ASAM:A4`, `FF:R07.6`, `FF:R07.1`, `mathlib:WittVector`, `SF:SF.4`.

Source: [cs17](#ref-cs17), CS17 §4.3, Lemma 4.3.10, p. 719; [cs17](#ref-cs17), CS17 §4.3, Lemma 4.3.12, p. 720; [csnc](#ref-csnc), CSnc §4.3, p. 54.

<a id="ig-3-infinite-level-newton-space"></a>

**The infinite-level space X^b_∞ over the Newton stratum.** Let X^b = (𝔛^b)^ad_η. X^b_∞ sends a complete affinoid (Ĕ(ζ_{p^∞}), O)-algebra (R, R⁺) to triples (𝒜, ρ, α) with (𝒜, ρ) ∈ X^b(R, R⁺) and α : Λ → T_p𝒜 an O_B-linear map matching the pairings (with the fixed p-power roots of unity) and an isomorphism at every geometric point. Sending an abelian variety to its p-divisible group gives X^b → M^b and X^b_∞ = X^b ×_{M^b} M^b_∞, representable by an adic space; and (Ig^b_{O_K})^ad_η ×_{Spa Ĕ} M^b_∞ ≅ X^b_{∞,K}, so X^b_∞ is preperfectoid.

Hypotheses: PEL data of type (A) or (C) unramified at p with hyperspecial level.

API: `XbInfinite`, `XbInfinite.eq_fibreProduct`, `XbInfinite.product`, `XbInfinite.preperfectoid`.

Prerequisites: `IG.3`.

Source: [cs17](#ref-cs17), CS17 §4.3, Definition 4.3.17, p. 724; [cs17](#ref-cs17), CS17 §4.3, Corollary 4.3.19, p. 724.

<a id="ig-3-product-formula"></a>

**The product formula for Newton strata at infinite level.** Let X̂^b_∞ be the perfectoid space attached to X^b_∞ and 𝒮^b_{K^p} ⊂ 𝒮_{K^p} the locus of the perfectoid Shimura variety (infinite level at p) of points Spa(K, K⁺) over which the universal abelian variety extends to K⁺ with reduction in the Newton stratum S^b (a locally closed subset, the preimage of S^b under specialization). Then X̂^b_∞ maps to 𝒮^b_{K^p} by forgetting ρ and to M^b_∞ by (𝒜, ρ, α) ↦ (𝒜[p^∞], ρ, α), compatibly with π_HT and π^b_HT, and the induced map X̂^b_∞ → (M^b_∞ ×_{Fℓ_{G,μ}} 𝒮^b_{K^p})^∧ is an isomorphism of perfectoid spaces. All objects in this square are taken over the same chosen completed cyclotomic base; the flag fibre product uses its base-changed flag variety, so the two cyclotomic structure maps agree.

Hypotheses: PEL data of type (A) or (C) unramified at p with hyperspecial level; no compactness needed.

Prerequisites: `IG.3`, `HT:T2`, `HT:T1`, `PSV:S3`.

Source: [cs17](#ref-cs17), CS17 §4.3, Lemma 4.3.20, p. 725.

### Rank-one comparisons and open fibres

<a id="ig-3-rank-one-cohomology-lemma"></a>

**Stalks and cohomology are determined by rank-one points.** (1) Let f : Y → X be a qcqs map of analytic adic spaces, X locally strongly noetherian or perfectoid and Y perfectoid; for a geometric point x̄ of X the stalk (R^if_*𝒢)_x̄ is the cohomology of the fibre f^{−1}(x̄) (an adic space over Spa(C(x̄), C(x̄)⁺)). (2) Let X be a qcqs analytic adic space (perfectoid, or strongly noetherian) and U ⊂ X a quasicompact open containing all rank-one points. Then H^i(X, 𝒢) → H^i(U, 𝒢) is an isomorphism for every locally constant 𝒢 and every i.

Hypotheses: X qcqs, U quasicompact open containing all rank-one points; 𝒢 locally constant.

Prerequisites: `CAEC:H0`, `DEC:C0`, `DSO:S1`, `PS:P2`, `PS:P7`.

Source: [cs17](#ref-cs17), CS17 §4.4, Lemma 4.4.2, p. 727; [cs17](#ref-cs17), CS17 §4.4, Lemma 4.4.1, p. 726.

<a id="ig-3-perfect-scheme-lift-cohomology"></a>

**Étale cohomology of a perfect scheme, of its canonical lift and of the perfectoid generic fibre agree.** Let ℓ ≠ p, X a perfect scheme over 𝔽̄_p, C complete algebraically closed with residue field containing 𝔽̄_p, 𝔛_{O_C} the unique flat formal lift of X ⊗ O_C/p over Spf O_C and 𝒳_C its (perfectoid) generic fibre. Then H^i(X, ℤ/ℓ^n) → H^i(𝔛_{O_C}, ℤ/ℓ^n) → H^i(𝒳_C, ℤ/ℓ^n) are isomorphisms for all i (with the canonical pullback maps). The first map is pullback along X×_{𝔽̄_p}k→X followed by the formal/special-fibre étale-site identification; its inverse may be used when displaying the comparison in the opposite direction.

Hypotheses: X perfect over 𝔽̄_p (in the application: qcqs, a perfection of a finite type scheme); ℓ ≠ p.

Prerequisites: `IG.3`, `CAEC:H1:formal-adic-comparison`, `LPV:LPV.0`, `PS:P1`, `SF:SF.4`.

Source: [cs17](#ref-cs17), CS17 §4.4, Lemma 4.4.3, p. 728.

<a id="ig-3-newton-strata-correspond"></a>

**On rank-one points the Newton stratifications correspond under π_HT, and fibres over Fℓ^b lie in the good-reduction Newton locus.** Assume S_{K^pK_p} proper over O_{E,𝔭} (or replace 𝒮_{K^p} by the good-reduction locus). (1) A rank-one point y of 𝒮_{K^p} lies in 𝒮^b_{K^p} if and only if π_HT(y) ∈ Fℓ^b_{G,μ}. (2) For a rank-one point x ∈ Fℓ^b(C, O_C), every geometric rank-one point of the fibre 𝒮_{K^p,x} lies in 𝒮^b_{K^p}; hence 𝒮^b_{K^p,x} is a quasicompact open subset of 𝒮_{K^p,x} with the same rank-one points, and (R^iπ_HT* ℤ/ℓ^n)_x = H^i(𝒮^b_{K^p,x}, ℤ/ℓ^n).

Hypotheses: PEL data of type (A) or (C) unramified at p with hyperspecial level; properness (or restriction to the good-reduction locus).

Prerequisites: `IG.3`, `IG.0`, `HT:T1`, `PSV:S3`.

Source: [cs17](#ref-cs17), CS17 §4.2, Proposition 4.2.6, p. 702 (with Remark 4.2.8, p. 703); [cs17](#ref-cs17), CS17 §4.2, Remark 4.2.8, p. 703.

<a id="ig-3-compact-fibre-theorem"></a>

**Stalks of Rπ_HT* are the cohomology of Igusa varieties: the compact PEL case.** Assume a PEL datum of type (A) or (C), unramified at p, with K_p hyperspecial, and S_{K^pK_p} proper over O_{E,𝔭} (equivalently G^ad anisotropic over ℚ). Let ℓ ≠ p, K^p sufficiently small, π_HT : 𝒮_{K^p} → Fℓ_{G,μ} and b ∈ B(G, μ^{−1}). For every geometric point x̄ of Fℓ_{G,μ} lying in Fℓ^b_{G,μ} and all i there are isomorphisms (R^iπ_HT* ℤ/ℓ^n)_x̄ ≅ H^i(Ig^b, ℤ/ℓ^n) ≅ colim_m H^i(Ig^b_{Mant,m}, ℤ/ℓ^n), depending only on a lift of x̄ to M^b_∞ and compatible with the Hecke action of G(𝔸_f^p).

Hypotheses: Proper integral model (compact Shimura variety); K^p small; ℓ ≠ p.

Prerequisites: `IG.3`, `IG.1`.

Source: [cs17](#ref-cs17), CS17 §4.4, Theorem 4.4.4, p. 729.

<a id="ig-3-open-fibre-theorem"></a>

**Fibres of π°_HT on the good-reduction locus.** For x ∈ Fℓ(C) with p-divisible group 𝒳_{O_C} with G-structure and special fibre X_k, there is a canonical open immersion Ig^{X_k}_C ↪ (π°_HT)^{−1}(x) whose image contains all rank-one points, where Ig^{X_k}_C is the generic fibre of the canonical lift of the perfect Igusa variety (prime-to-p level the part of N prime to p). Consequently, for ℓ ≠ p, (R(π°_HT)_*𝔽_ℓ)_x ≅ RΓ(Ig^{X_k}, 𝔽_ℓ) canonically and Hecke-equivariantly.

Hypotheses: Valued-field fibre setting. The quasi-split unitary datum (non-compact); only the good-reduction locus is used, so no properness is needed.

Prerequisites: `IG.3`.

Source: [csnc](#ref-csnc), CSnc §2.7, Theorem 2.7.2, p. 33.

### Boundary period maps and compactified fibres

<a id="ig-3-period-map-on-boundary"></a>

**The Hodge–Tate period map on toroidal boundary charts and on minimal boundary strata.** (1) Let Ŝ^tor_{K(p^∞N),Z,ℤ_p} be the completion of the infinite-level naive integral model along the Z-boundary, with π₁ to (G/P_r)(ℚ_p) (symplectic O_F-filtrations Z_{p^∞,−2} ⊂ Z_{p^∞,−1} ⊂ L ⊗ ℤ_p with rk Z_{−2} = r) and the local system L_Z = Gr_{−1} with its perfect form. The Hodge–Tate filtration Lie B(1) ⊂ L_Z ⊗ O of the abelian part B of the Raynaud extension, pulled back to Z_{p^∞,−1} ⊗ O, is a totally isotropic subspace of L ⊗ O; the resulting π_{HT,Z} agrees with π^tor_HT restricted to the generic fibre of Ŝ^tor_Z. (2) On a boundary stratum S_{K(p^∞N),Ẑ} of the infinite-level minimal compactification, π^*_HT is the Hodge–Tate period map of the smaller Shimura variety followed by the embedding Fℓ_Ẑ ↪ Fℓ (preimage of a totally isotropic subspace of L_Z ⊗ ℚ_p in Z_{p^∞,−1} ⊗ ℚ_p).

Hypotheses: Valued-field fibre setting.

Prerequisites: `PSV:S3`, `PSV:S6`, `SC:C4`, `NM:R11.3`, `SC:C5`, `IG.3`.

Source: [csnc](#ref-csnc), CSnc §4.2, Theorem 4.2.1, p. 53; [csnc](#ref-csnc), CSnc §4.2, Corollary 4.2.2, p. 53.

<a id="ig-3-pdiv-constant-mod-p-epsilon"></a>

**The p-divisible group of a flag point is constant modulo p^ε.** For x ∈ Fℓ(C) with (𝒳_{O_C}, α), splitting δ_{𝒳} and special fibre X = 𝒳 ⊗ k with induced δ_X, there is ε ∈ ℚ ∩ (0, 1] and an isomorphism ρ : X ⊗_k O_C/p^ε ≅ 𝒳_{O_C} ⊗ O_C/p^ε of p-divisible groups with G-structure lifting the identity, which can be chosen with δ_{𝒳} ⊗ O_C/p^ε = δ_X ⊗ O_C/p^ε.

Hypotheses: Valued-field fibre setting.

Prerequisites: `IG.3`, `FF:R07.2`, `VB:VB2`, `VB:VB2:classification`.

Source: [csnc](#ref-csnc), CSnc §4.3, Proposition 4.3.1, p. 54.

<a id="ig-3-compactified-igusa-to-shimura"></a>

**The map from compactified Igusa varieties over O_C to compactified Shimura varieties at infinite level.** Let Ig^{X,tor}_{O_C} = W(Ig^{X,tor}) ×_{W(k)} O_C. The map g : Ig^X_{O_C} → S_{K(p^∞N),O_C} — Serre–Tate lift of the universal abelian scheme over Ig^X_{O_C/p^ε} along A[p^∞] ≅ 𝒳_{O_C} (IG.3/pdiv-constant-mod-p-epsilon), with level structure at p from α — extends to a morphism of p-adic formal schemes g^tor : Ig^{X,tor}_{O_C} → S^tor_{K(p^∞N),O_C}, and composing with the projection gives f^tor : Ig^{X,tor}_{O_C} → S^*_{K(p^∞N),O_C}. On boundary charts, Igusa cusp labels map to cusp labels and g^tor is given by deforming G[p^∞] ↪ X (Serre–Tate for Raynaud extensions) and the torus torsor of symmetric lifts.

Hypotheses: Valued-field fibre setting.

API: `igusaToShimura`, `igusaToShimura_open`, `igusaToShimura_cusp`, `igusaToShimura_hecke`, `igusaToShimura_piHT`.

Prerequisites: `IG.3`, `IG.2`, `IG.0`, `SC:C4`, `NM:R11.3`, `SC:C5`.

Source: [csnc](#ref-csnc), CSnc §4.3, Theorem 4.3.2, p. 55; [csnc](#ref-csnc), CSnc §4.3, proof of Theorem 4.3.2, p. 57.

<a id="ig-3-canonical-compactification-criterion"></a>

**A bijection on rank-one points to a proper diamond identifies the canonical compactification.** Suppose X/Spd C is a quasicompact separated perfectoid space and Y/Spd C is a proper diamond. A morphism f : X → Y identifies Y with the canonical compactification X̄ of X over Spd C whenever it gives a bijection X(C′, O_{C′}) → Y(C′, O_{C′}) for every complete algebraically closed extension C′/C. If X/Spd C is compactifiable, this same f is an open immersion.

Hypotheses: Y proper over Spd C.

Prerequisites: `DEC:C4`, `DVS:D5`.

Source: [csnc](#ref-csnc), CSnc §4.4, Lemma 4.4.2, p. 59.

<a id="ig-3-toroidal-fibre-theorem"></a>

**The fibre of π^tor_HT is the canonical compactification of the toroidal Igusa variety.** The morphism g^tor induces a map of diamonds Ig^{b,tor}_C → (π^tor_HT)^{−1}(x) which is an open immersion with the same rank-one points; since the fibre (π^tor_HT)^{−1}(x) is proper over Spd C (a closed fibre of a proper map), it is the canonical compactification of Ig^{b,tor}_C.

Hypotheses: Valued-field fibre setting. x ∈ Fℓ^b(C).

Prerequisites: `IG.3`, `IG.2`, `DEC:C4`, `DVS:D5`.

Source: [csnc](#ref-csnc), CSnc §4.4, Theorem 4.4.1, p. 57.

<a id="ig-3-minimal-fibre-theorem"></a>

**The fibre of π^*_HT and the partial minimal Igusa variety.** f^tor induces an open immersion f^* : Ig^{b,*}_C → (π^*_HT)^{−1}(x) of affinoid perfectoid spaces with the same rank-one points. Moreover (1) Ig^{b,tor}_C → Ig^{b,*}_C induces an isomorphism on global sections, and (2) F^tor := (π^tor_HT)^{−1}(x) → F^* := (π^*_HT)^{−1}(x) induces an isomorphism on global sections, via the almost isomorphism O⁺ᵃ_{F^*}/p^n ≅ π_*O⁺ᵃ_{F^tor}/p^n.

Hypotheses: Valued-field fibre setting.

Prerequisites: `IG.3`, `IG.2`, `PH:P8`, `DEC:C0`, `AEG:A1`, `PS:P0`, `PSV:S0`, `PSV:S2`, `PSV:S4`, `PSV:S1`, `PS:P2`, `PS:P7`.

Source: [csnc](#ref-csnc), CSnc §4.5, Theorem 4.5.1, p. 59; [csnc](#ref-csnc), CSnc §4.5, proof of Lemma 4.5.2, p. 60.

<a id="ig-3-compactified-fibre-theorem"></a>

**Fibres of the compactified Hodge–Tate period maps and their cohomology.** For x ∈ Fℓ(C) with (𝒳_{O_C}, α) and special fibre X, there are natural maps Ig^{X,*}_C → (π^*_HT)^{−1}(x) and Ig^{X,tor}_C → (π^tor_HT)^{−1}(x), open immersions of perfectoid spaces with the same rank-one points, whose targets are the canonical compactifications of the sources. Consequently there are natural Hecke-equivariant isomorphisms RΓ(Ig^{X,*}, 𝔽_ℓ) ≅ (Rπ^*_HT*𝔽_ℓ)_x and RΓ(Ig^{X,tor}, 𝔽_ℓ) ≅ (Rπ^tor_HT*𝔽_ℓ)_x, and the stalks at higher-rank points agree with those at the corresponding rank-one points. These maps are compatible with the prime-to-p Hecke action, with passage between p-levels (the transition maps of the towers), with the flag Newton strata (x ∈ Fℓ^b iff X is in the class b) and with the good-reduction open part (IG.3/open-fibre-theorem).

Hypotheses: Valued-field fibre setting.

Prerequisites: `IG.3`, `DEC:C4`, `CAEC:H0`.

Source: [csnc](#ref-csnc), CSnc §4.1, Theorem 4.1.1, p. 51; [csnc](#ref-csnc), CSnc §4.1, Corollary 4.1.2, p. 51.

### Local moduli and the cohomological filtration

<a id="ig-3-sw-infinite-level-rz-space"></a>

**The Scholze–Weinstein Rapoport–Zink space at infinite level M_∞ of a p-divisible group (SW13 §6.3; CS17 proof of Theorem 4.2.4).** Let H be a p-divisible group of height h and dimension d over a perfect field k of characteristic p, M the Rapoport–Zink space of deformations of H up to quasi-isogeny (no extra structure) and M_n its level-p^n covers. M_∞ sends a complete affinoid (W(k)[1/p], W(k))-algebra (R, R⁺) to triples (G, ρ, α) with (G, ρ) ∈ M(R, R⁺) and α : ℤ_p^h → T_pG^ad_η(R, R⁺) an isomorphism at all geometric points. M_∞ is representable by an adic space, is preperfectoid over Spa(W(k)[1/p], W(k)), and satisfies M_∞ ∼ lim_n M_n in the sense of Scholze–Weinstein Definition 2.4.1 (Theorem 6.3.4). Preperfectoidness means that, after any perfectoid characteristic-zero base-field extension, strong completion is perfectoid; it does not assert that M_∞ itself is perfectoid over W(k)[1/p]. Already over W(k)[1/p], M_∞ ≅ M′_∞, the functor of h-tuples (s₁, …, s_h) ∈ H̃^ad_η(R, R⁺) whose quasi-logarithms span a rank-(h − d) submodule with finite projective quotient W of rank d of M(H) ⊗ R, and such that 0 → ℚ_p^h → H̃^ad_η(C, O_C) → W ⊗_R C → 0 is exact at every geometric point Spa(C, O_C) → Spa(R, R⁺) (Definition 6.3.5, Lemma 6.3.6). The first arrow sends the standard basis to the s_i. For an unramified local PEL datum, M_{D^int,∞} (IG.3/local-hodge-tate-period-map) is a closed subspace of M_∞ for H = X_b.

Hypotheses: H a p-divisible group over a perfect field k; "∼ lim" in the sense of Scholze–Weinstein Definition 2.4.1.

API: `SWInfiniteLevel`, `SWInfiniteLevel.preperfectoid`, `SWInfiniteLevel.eq_tuples`, `SWInfiniteLevel.actions`, `SWInfiniteLevel.pel`.

Prerequisites: `IG.0`, `FF:R07.1`, `HT:T2`, `PS:P2`, `PS:P7`, `FF:R07.2`.

Source: [sw13](#ref-sw13), Theorem 6.3.4, p. 59 (§6.3; Definition 6.3.3 of M_∞); proof pp. 59–62; [sw13](#ref-sw13), Definition 6.3.5 and Lemma 6.3.6, p. 60; proof pp. 60–62; [cs17](#ref-cs17), CS17 §4.2, proof of Theorem 4.2.4, p. 701; [sw13](#ref-sw13), Definition 2.3.9, p. 18; Proposition 2.3.11, p. 19; §6.3, p. 60.

<a id="ig-3-mantovan-formula"></a>

**Mantovan's formula: a filtration of the cohomology of the good-reduction Shimura variety by Igusa and Rapoport–Zink contributions.** For an integral PEL datum of type (A) or (C) unramified at p with hyperspecial level and ℓ ≠ p, there is a filtration of RΓ(S_{K^p,ℚ̄_p}, 𝔽_ℓ) by complexes of smooth G(ℚ_p) × W_{E_p}-representations whose graded pieces are indexed by b ∈ B(G_{ℚ_p}, μ^{−1}) (ordered compatibly with the closure relations) and equal to RΓ(Ig^b, 𝔽_ℓ)^{op} ⊗^L_{C_c(J_b(ℚ_p))} RΓ_c(M_{(G,b,μ),∞}, 𝔽_ℓ(d_b))[2d_b], with Ig^b the perfect Igusa variety (dimension d_b = ⟨2ρ, ν_b⟩) and M_{(G,b,μ),∞} the local Shimura variety at infinite level. Here 𝔽_ℓ(d_b) on M_{(G,b,μ),∞} carries the J_b(ℚ_p)-equivariant structure induced by the relative dualizing equivalence Rπ_unip^!𝔽_ℓ ≅ 𝔽_ℓ(d_b)[2d_b], where π_unip : M_{(G,b,μ),∞} → M_{(G,b,μ),∞}/J̃_b^0 is the connected-automorphism-group torsor. This equivariant structure is part of the formula; its smooth character κ agrees with the character on the Igusa dualizing twist (Koshikawa Lemmas 7.4 and 7.6).

Hypotheses: PEL type (A) or (C) unramified at p, hyperspecial K_p; for non-proper Shimura varieties, use the good-reduction locus and IG.3/good-reduction-locus-cohomology.

Prerequisites: `IG.3`, `IG.1`, `HS:HS2`, `SR:SR.0`, `SR:SR.2`, `SR:SR.0:derived-extension`, `BG:BG3`, `VS:VS4`, `DSO:S3`, `DSO:S4`, `SR:SR.1`, `DSO:S2`.

Source: [kos21](#ref-kos21), §7, Theorem 7.1 and Remark 7.2, p. 10; Lemmas 7.3–7.6 and their proofs, pp. 10–12 (arXiv:2106.10602v1).

## Layer IG.4: Nearby cycles, semiperversity and degree bounds

Use finite-type residue-field models to state perverse bounds. Raw reductions over O_C/p and finite-type k-reductions are different objects, and a finite-presentation assertion over O_C/p is not a finite-type assertion over k. The compact argument uses both halves of torsion nearby-cycle exactness; the noncompact argument uses its lower half, integral pushforward and the vanishing of boundary contributions after auxiliary ℓ-level passage.

### Equivariant models and compact perversity

<a id="ig-4-equivariant-sites-and-nearby-cycles"></a>

**Equivariant étale sites of the flag variety and nearby cycles of K_p-equivariant formal models.** For a locally profinite group acting continuously, Scholze's equivariant étale sites give (Fℓ_{G,μ}/G(ℚ_p))_ét and (𝒮_{K^p}/G(ℚ_p))_ét with π_HT/G(ℚ_p) between them; R(π_HT/G(ℚ_p))_*𝔽_ℓ pulls back to Rπ_HT*𝔽_ℓ along (Fℓ_{G,μ})_ét → (Fℓ_{G,μ}/G(ℚ_p))_ét (pass to slice categories to replace G(ℚ_p) by a compact open K_p, then to the limit). For an étale U = Spa(A, A°) → Fℓ_{G,μ}, every sufficiently small K_p ⊂ G(ℚ_p) acts continuously on U and trivially on U_s = Spec(A°/p) (finite generation of A°/p), so étale maps to U_s̄ lift K_p-equivariantly to 𝔘_{O_C}, 𝔘 = Spf A°, giving the nearby-cycle morphism of sites λ_{U/K_p} : (U_η̄/K_p)_ét → U_{s̄,ét}.

Hypotheses: Continuous action of a locally profinite group on an analytic adic space (Scholze, Lubin–Tate paper §2).

API: `equivariantEtaleSite`, `equivariantSite.pullback`, `equivariantSite.slice`, `nearbyCyclesEquivariant`.

Prerequisites: `DEC:C0`, `CAEC:H1:formal-adic-comparison`, `SF:SF.4`, `AdicII:F0`, `AdicII:R2`, `PSV:S3`.

Source: [cs17](#ref-cs17), CS17 §6.1, p. 751.

<a id="ig-4-finiteness-from-rank-one-valuative-criterion"></a>

**Affine maps of finite type over 𝔽_p satisfying the rank-one valuative criterion are finite.** Let f : X → Y be a morphism of affine schemes of finite type over 𝔽_p such that, for every algebraically closed field K with a rank-one valuation ring V ⊂ K, every V-point of Y together with a K-point of X lifting its generic point extends to a V-point of X. Then f is proper, hence finite.

Hypotheses: X, Y affine of finite type over 𝔽_p.

Prerequisites: `mathlib:AlgebraicGeometry.IsProper.of_valuativeCriterion`, `mathlib:AlgebraicGeometry.ValuativeCriterion`, `mathlib:AlgebraicGeometry.IsFinite`.

Source: [cs17](#ref-cs17), CS17 §6.1, proof of Proposition 6.1.3, p. 753.

<a id="ig-4-finite-level-formal-models"></a>

**Cofinal affinoid neighbourhoods of the flag variety with finite-level formal models of their preimages.** Every geometric point x of Fℓ_C has a cofinal system of affinoid étale neighbourhoods U = Spa(A) → Fℓ_C such that: (1) S^*_{K(p^∞N),U} := S^*_{K(p^∞N),C} ×_{Fℓ_C} U is affinoid perfectoid, = Spa(R_{K(p^∞N),U}), and is the preimage of an affinoid U′ = S^*_{K(p^mN),U} étale over S^*_{K(p^mN),C} for m large; (2) with 𝔘 = Spf(A°), the reduction modulo p of Spf(R°_{K(p^∞N),U}) → 𝔘 factors over Spec(R°_{K(p^mN),U}/p) → Spec(A°/p) for m large, and this map of affine schemes is integral (integrality is the asserted property; no finite-type claim over 𝔽_p is made here); (3) the minimal charts and finite-level factorizations admit compatible changes in auxiliary ℓ-power tame level; the toroidal compactifications map properly to these minimal charts, with compatible boundary maps. Affinoid perfectoidness is asserted only for the minimal preimages. These formal models, with the transition maps in p-level and ℓ-level and the boundary maps, are the finite-level geometry from which the semiperverse bound is deduced. Distinguish the raw model Spec(A°/p) over O_C/p from its residue-field reduction 𝔘_k. On the cofinal basis A°/p is finitely presented over O_C/p, so 𝔘_k is affine of finite type over k. The source of the integral map need not be of finite type. The perverse pushforward and nearby-cycle comparison interfaces using these models belong to IG.4/semiperversity.

Hypotheses: Nearby-cycle setting.

API: `FormalNeighbourhood`, `FormalNeighbourhood.cofinal`, `FormalNeighbourhood.integral`, `FormalNeighbourhood.transition`, `FormalNeighbourhood.factor_modP`.

Prerequisites: `IG.4`, `IG.3`, `PSV:S3`, `SF:SF.2`.

Source: [csnc](#ref-csnc), CSnc §4.6, proof of Theorem 4.6.1, p. 62; [csnc](#ref-csnc), CSnc §4.6, proof of Theorem 4.6.1, p. 61.

<a id="ig-4-compact-perversity"></a>

**Perversity of the nearby cycles of Rπ_HT*𝔽_ℓ for compact Hodge-type Shimura varieties.** Let π_HT : 𝒮_{K^p} → Fℓ_{G,μ} be the Hodge–Tate period map of a compact Shimura variety of Hodge type, K^p ⊂ G(𝔸_f^p) sufficiently small, and x̄ a geometric point of Fℓ_{G,μ}. Then x̄ has a neighbourhood basis of affinoid étale neighbourhoods U = Spa(A, A°) such that, with 𝔘 = Spf(A°), Rλ_{U/K_p*}(R(π_HT/G(ℚ_p))_*𝔽_ℓ)|_{U_η̄/K_p}[⟨2ρ, μ⟩] is a perverse sheaf on 𝔘_s̄ for every sufficiently small pro-p compact open K_p ⊂ G(ℚ_p). This is the compact-case strengthening (full perversity), not merged with the non-compact one-sided bound of IG.4/semiperversity.

Hypotheses: Compact Shimura variety of Hodge type (Prop. 6.1.3 is stated for Hodge type; CS17 §6.1).

Prerequisites: `IG.4`, `LPV:LPV.6`, `LPV:LPV.0`, `CAEC:H1:formal-adic-comparison`, `EDC:EDC.5`, `PSV:S3`.

Source: [cs17](#ref-cs17), CS17 §6.1, Proposition 6.1.3, p. 751.

<a id="ig-4-compact-minimal-stratum-concentration"></a>

**Concentration of generic Igusa cohomology at a minimal stratum: the compact case.** Suppose the Shimura variety is compact, of PEL type (A) or (C) with good reduction at p (as in IG.3/compact-fibre-theorem), ℓ ≠ p. Let S be a finite set of primes containing p with K^p = K^p_S K^S, K^S hyperspecial, 𝕋^S = ℤ[G(𝔸_f^S)//K^S] (or any subalgebra of it acting on Rπ_HT*𝔽_ℓ), and 𝔪 ⊂ 𝕋^S maximal. Among the b ∈ B(G, μ^{−1}) with H^i(Ig^b, 𝔽_ℓ)[𝔪] ≠ 0 for some i, choose b with d_b = ⟨2ρ, ν_b⟩ minimal. Then H^i(Ig^b, 𝔽_ℓ)[𝔪] is nonzero only for i = d_b. For ℚ̄_ℓ-coefficients use the corresponding eigenideal of the characteristic-zero Hecke algebra; the analogous concentration holds, and (Li–Liu, footnote 16) the argument is asserted to apply when only one factor of the level at p is hyperspecial in their Harris–Taylor type setting.

Hypotheses: Compact PEL type (A) or (C) Shimura variety with good reduction at p; S ∋ p.

Prerequisites: `IG.4`, `IG.3`, `IG.1`, `EDC:EDC.5`.

Source: [cs17](#ref-cs17), CS17 §6.1, Corollary 6.1.4, p. 753; [lil21](#ref-lil21), Proof of Lemma 7.3 and footnote 16, p. 35.

### Boundary killing and the two bounds

<a id="ig-4-ell-power-boundary-killing"></a>

**At ℓ^∞ tame level the toroidal boundary carries no cohomology.** (1) For j_{Nℓ^∞} : S_{K(Nℓ^∞),ℚ̄} ↪ S^tor_{K(Nℓ^∞),ℚ̄} (inverse limits over the levels Nℓ^m taken in schemes), the natural map 𝔽_ℓ → Rj_{Nℓ^∞,*}𝔽_ℓ is an isomorphism. (2) For any Igusa variety Ig^X, the restriction H^i(Ig^{X,tor}_{K(Nℓ^∞)}, 𝔽_ℓ) → H^i(Ig^X_{K(Nℓ^∞)}, 𝔽_ℓ) is an isomorphism. Consequently Rπ^tor_{HT,ℓ^∞,*}𝔽_ℓ → Rπ°_{HT,ℓ^∞,*}𝔽_ℓ is an isomorphism.

Hypotheses: Nearby-cycle setting.

Prerequisites: `IG.2`, `IG.3`, `ACCoh:L5`, `SC:C5`.

Source: [csnc](#ref-csnc), CSnc §4.6, Lemma 4.6.2, p. 61; [csnc](#ref-csnc), CSnc §4.6, Lemma 4.6.3, p. 61.

<a id="ig-4-semiperversity"></a>

**Semiperversity of the nearby cycles of Rπ°_HT*𝔽_ℓ.** Consider Rπ°_HT*𝔽_ℓ ∈ D(Fℓ_C, 𝔽_ℓ) for π°_HT : S°_{K(p^∞N),C} → Fℓ_C. Every geometric point x of Fℓ_C has a cofinal system of affinoid étale neighbourhoods U = Spa(A) → Fℓ_C such that, with 𝔘 = Spf(A°), the nearby cycles satisfy Rψ(Rπ°_HT*𝔽_ℓ)|_𝔘 ∈ ^pD^{≥d}(𝔘_k, 𝔽_ℓ), d = [F⁺:ℚ]n². The statement is local (for such cofinal U), in the scheme-theoretic perverse t-structure on the special fibres 𝔘_k; it is not a statement about a perverse t-structure on Fℓ itself. Here ^pD^{≥d} denotes the geometric costalk lower-bound criterion on the finite-type k-target and its continuous enlargement for the level complexes; no perverse t-structure on all nonnoetherian schemes is assumed.

Hypotheses: Nearby-cycle setting.

API: `FormalNeighbourhood.pushforward_ge`, `FormalNeighbourhood.nearbyComparisonCompatibility`.

Prerequisites: `IG.4`, `IG.3`, `LPV:LPV.6`, `LPV:LPV.0`, `CAEC:H1:formal-adic-comparison`, `EDC:EDC.5`, `SF:SF.2`, `SR:SR.0`, `SR:SR.0:derived-extension`.

Source: [csnc](#ref-csnc), CSnc §4.6, Theorem 4.6.1, p. 60; [csnc](#ref-csnc), CSnc §4.6, end of proof of Theorem 4.6.1, p. 63.

<a id="ig-4-partial-support-cohomology"></a>

**Partially compactly supported Igusa cohomology H^i_{c−∂}(Ig^b, 𝔽_ℓ).** For b ∈ B(G_{ℚ_p}, μ^{−1}) with completely slope divisible X_b and j : Ig^b ↪ Ig^{b,*} the open immersion into the partial minimal compactification (IG.2/minimal-igusa-compactification), define RΓ_{c−∂}(Ig^b, 𝔽_ℓ) := RΓ(Ig^{b,*}, j_!𝔽_ℓ) and H^i_{c−∂}(Ig^b, 𝔽_ℓ) := H^i(Ig^{b,*}, j_!𝔽_ℓ), at each finite level and in the colimit over levels. It carries the action of 𝕋^S and the natural map H^i_{c−∂}(Ig^b, 𝔽_ℓ) → H^i(Ig^b, 𝔽_ℓ) induced by j_!𝔽_ℓ → Rj_*𝔽_ℓ. This is not the ordinary compactly supported cohomology RΓ_c(Ig^b) (Ig^{b,*} is not proper), and not RΓ(Ig^b) unless the boundary is empty.

Hypotheses: Nearby-cycle setting. X_b completely slope divisible.

Required API:

- `partialSupportCohomology`: RΓ_{c−∂}(Ig^b, 𝔽_ℓ) := RΓ(Ig^{b,*}, j_!𝔽_ℓ).
- `partialSupportCohomology.toCohomology`: The natural map RΓ_{c−∂}(Ig^b) → RΓ(Ig^b), 𝕋^S-equivariant.
- `partialSupportCohomology.triangle`: Distinguished triangle RΓ_{c−∂}(Ig^b) → RΓ(Ig^b) → RΓ(∂Ig^{b,*}, i^*Rj_*𝔽_ℓ) →.
- `partialSupportCohomology.fromCompact`: The natural map RΓ_c(Ig^b) → RΓ_{c−∂}(Ig^b).
- `partialSupportCohomology.hecke`: Equivariant for 𝕋^S and the prime-to-p Hecke action.

Examples and tests:

- If X_b^{ét} = 0 then RΓ_{c−∂}(Ig^b) = RΓ(Ig^b).
- For the modular curve and b ordinary at finite level m, H⁰_{c−∂}(Ig^b_m, 𝔽_ℓ) = 0 (j_! kills global sections on the affine curve with cusps added) while H⁰(Ig^b_m, 𝔽_ℓ) ≠ 0.
- RΓ_{c−∂}(Ig^b) ≠ RΓ_c(Ig^b) in general: Ig^{b,*} is affine, not proper, when the leaf is non-proper.

Prerequisites: `IG.2`, `IG.1`, `EDC:EDC.0`, `mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology`.

Source: [csnc](#ref-csnc), CSnc §2.8, p. 33.

<a id="ig-4-artin-vanishing-upper-bound"></a>

**Upper bound: H^i_{c−∂}(Ig^b, 𝔽_ℓ) = 0 for i > d_b.** The partial minimal compactification Ig^{b,*} is affine (Theorem 2.8.1); consequently, for every ℓ ≠ p, H^i_{c−∂}(Ig^b, 𝔽_ℓ) = H^i(Ig^{b,*}, j_!𝔽_ℓ) is nonzero only for i ≤ d_b = dim Ig^b.

Hypotheses: Nearby-cycle setting.

Prerequisites: `IG.4`, `IG.2`, `EDC:EDC.4`.

Source: [csnc](#ref-csnc), CSnc §2.8, Proposition 2.8.2, p. 34.

<a id="ig-4-minimal-stratum-lower-bound"></a>

**Lower bound at a minimal Newton stratum: H^i(Ig^b, 𝔽_ℓ)_𝔪 ≠ 0 implies i ≥ d_b.** Let S be a finite set of places containing ∞ and all primes dividing pℓNΔ_F, 𝔪 ⊂ 𝕋^S a maximal ideal containing ℓ, and choose b ∈ B(G_{ℚ_p}, μ^{−1}) with d_b minimal among those with H^*(Ig^b, 𝔽_ℓ)_𝔪 ≠ 0. Then H^i(Ig^b, 𝔽_ℓ)_𝔪 ≠ 0 implies i ≥ d_b. (No constructibility of the perverse sheaves is needed; Remark 2.8.5: the dual variant for Rπ^*_HT*(j_!𝔽_ℓ) would only reprove the upper bound.)

Hypotheses: Nearby-cycle setting.

Prerequisites: `IG.4`, `IG.3`, `IG.1`, `BG:BG3`, `BG:BG2:uniformization`, `CAEC:H0`, `EDC:EDC.5`.

Source: [csnc](#ref-csnc), CSnc §2.8, Lemma 2.8.4, p. 34; [csnc](#ref-csnc), CSnc §2.8, proof of Lemma 2.8.4, p. 34.

## Layer IG.5: Dual Hecke systems and ordinary genericity

Hecke inversion exchanges the residual ideal with its dual. Finite-level Poincaré duality and one-degree concentration lift a mod-ℓ class to a rational constituent with the dual system. The rational trace theorem and local Langlands then force the ordinary Newton class under the weak Frobenius-ratio hypothesis. The dual and modulus normalizations are part of the theorem.

### Duality and rational constituents

<a id="ig-5-dual-hecke-ideal"></a>

**The dual Hecke ideal 𝔪^∨ = ι(𝔪) for the unitary similitude Hecke algebra and its Galois dictionary.** Let ι : 𝕋^S → 𝕋^S be the anti-involution [K_qgK_q] ↦ [K_qg^{−1}K_q] of the spherical Hecke algebra (commutative, so an involution), obtained from the inversion g ↦ g^{−1} of G(ℚ_q) by the double-coset anti-involution formalism (Tau Ceti HeckeAntiInvolution.ofAmbient; the smooth-representation owner is SmoothRepresentationsOfLocalGroups SR.1). For a maximal ideal 𝔪 ⊂ 𝕋^S with finite residue field set 𝔪^∨ := ι(𝔪). At a prime v | q ∉ S split in F₀, G(ℚ_q) = GL_{2n}(F_v) × ∏_{w|𝔮, w≠v} GL_{2n}(F_w) × ℚ_q^× and ι(T_{i,v}) = T_{2n,v}^{−1}T_{2n−i,v}; if 𝔪 is of Galois type with ρ_𝔪 (Frobenius polynomial X^{2n} − T_{1,v}X^{2n−1} + … + q_v^{n(2n−1)}T_{2n,v}, geometric Frobenius), then 𝔪^∨ is of Galois type with ρ_{𝔪^∨} ≅ ρ_𝔪^∨ ⊗ |Art_F^{−1}|^{1−2n}, Art_F sending uniformizers to geometric Frobenius; the Frobenius eigenvalues of ρ_{𝔪^∨} at v are q_v^{2n−1}α_{i,v}^{−1}. Hence ρ_𝔪 = ρ_{𝔪^∨}^∨ ⊗ |Art_F^{−1}|^{1−2n}, and unramifiedness at v, the length of ρ_𝔪 and the condition α_i ≠ q_vα_j (i ≠ j) are preserved by 𝔪 ↦ 𝔪^∨.

Hypotheses: Trace-comparison setting.

Required API:

- `heckeInvolution`: ι : 𝕋^S → 𝕋^S, [KgK] ↦ [Kg^{−1}K], a ring involution of the commutative Hecke algebra.
- `heckeInvolution_involutive`: ι ∘ ι = id.
- `dualIdeal`: 𝔪^∨ := ι(𝔪), a maximal ideal with the same residue field.
- `heckeInvolution_T`: ι(T_{i,v}) = T_{2n,v}^{−1}T_{2n−i,v}.
- `dualIdeal_galois`: ρ_{𝔪^∨} ≅ ρ_𝔪^∨ ⊗ |Art_F^{−1}|^{1−2n}; eigenvalues q_v^{2n−1}α_{i,v}^{−1}.
- `dualIdeal_preserves`: Length, unramifiedness at places v ∤ ℓ and the condition α_i ≠ q_vα_j are invariant under 𝔪 ↦ 𝔪^∨ (above ℓ the twist |Art_F^{−1}|^{1−2n} reduced mod ℓ is in general ramified).
- `heckeInvolution_compat_tauceti`: On every native basis vector, ι is the linear lift of `onHeckeCoset` for `HeckeAntiInvolution.ofAmbient` applied to inversion; the rule uniquely determines the ring endomorphism. Its multiplicativity uses the unimodular spherical datum and separate commutativity input. Inversion need not fix double cosets.

Examples and tests:

- (𝔪^∨)^∨ = 𝔪.
- For 2n = 2 and eigenvalues {α, β} of ρ_𝔪(Frob_v), the eigenvalues for 𝔪^∨ are {q_v/α, q_v/β}.
- 𝔪^∨ ≠ 𝔪 in general: for ρ_𝔪 with eigenvalues {1, 2} at q_v = 7 over 𝔽_ℓ, ℓ = 11, the dual has eigenvalues {7, 7/2}.
- On `HeckeCosetModule.of (Finsupp.single c 1)`, ι gives the same native single basis vector at `onHeckeCoset c` for the `ofAmbient` inversion datum (Tau Ceti, TauCeti/NumberTheory/HeckeRing/Commutativity.lean).

Prerequisites: `tauceti:HeckeAntiInvolution.ofAmbient`, `tauceti:HeckeAntiInvolution.onHeckeCoset`, `tauceti:HeckeCosetModule.instRingHeckeRing`, `SR:SR.1`, `AGII:AG2.7`, `IHG:IHG.3`, `tauceti:TauCetiRoadmap`, `IG.0`.

Source: [csnc](#ref-csnc), CSnc §5.1, proof of Corollary 5.1.3, p. 66; [acc23](#ref-acc23), §2.2.19 'Duality and twisting', pp. 35–37: anti-involutions ι, ι̃ (p. 35), m^∨ := ι(m) (p. 36), Proposition 2.2.20 and Corollary 2.2.21 (pp. 36–37).

<a id="ig-5-igusa-poincare-duality"></a>

**Hecke-equivariant Poincaré duality for Igusa varieties with the dual ideal.** Let Ig = Ig^b_{Mant,m,K(N)} be a finite-level Igusa variety (smooth of dimension d_b over k) and Λ = ℤ/ℓ^n or ℤ_ℓ. Then RΓ_c(Ig, Λ) ≅ RHom_Λ(RΓ(Ig, Λ), Λ)[−2d_b](−d_b), and under this isomorphism T ∈ 𝕋^S acts on the left through ι(T) on the right. Consequently, for 𝔪 ⊂ 𝕋^S, RΓ_c(Ig, Λ)_{𝔪^∨} ≅ RHom_Λ(RΓ(Ig, Λ)_𝔪, Λ)[−2d_b](−d_b), compatibly with the transition maps: pullback on RΓ along a finite étale transition Ig_{m′} → Ig_m is dual to the trace on RΓ_c. (Since a dual turns colimits into limits, this is not a duality between colim_m RΓ_c and colim_m RΓ.)

Hypotheses: Trace-comparison setting. ℓ ≠ p.

Prerequisites: `IG.5`, `IG.1`, `EDC:EDC.2:pairings`.

Source: [csnc](#ref-csnc), CSnc §5.1, proof of Corollary 5.1.3, p. 66.

<a id="ig-5-galois-representations-for-igusa-constituents"></a>

**Galois representations attached to the constituents of Igusa cohomology.** Under the standing assumptions of §5 (listed in the hypotheses), write [H_c(Ig^b_{K(N)}, ℚ̄_ℓ)] := Σ_i (−1)^i [colim_m H^i_c(Ig^b_{m,K(N)}, ℚ̄_ℓ)] = Σ_{j∈J} n_j π_j ⊗ ψ_j as a virtual representation of J_b(ℚ_p) × 𝕋^S (π_j irreducible smooth, ψ_j : 𝕋^S → ℚ̄_ℓ characters, n_j ≠ 0, pairwise distinct). For each j there is a continuous semisimple ρ_j : Gal(F̄/F) → GL_{2n}(ℚ̄_ℓ), almost everywhere unramified, unramified at every v | q ∉ S with q split in F₀, with characteristic polynomial of ρ_j(Frob_v) equal to X^{2n} − ψ_j(T_{1,v})X^{2n−1} + … + (−1)^i q_v^{i(i−1)/2}ψ_j(T_{i,v})X^{2n−i} + … + q_v^{n(2n−1)}ψ_j(T_{2n,v}); and for v | p the semisimple Langlands parameter of π_{j,v}|·|^{1/2−n} (via Badulescu's Jacquet–Langlands for the inner form J_{b_v} of a Levi of GL_{2n}(F_v)) equals the semisimple parameter of ρ_j|_{Gal(F̄_v/F_v)}.

Hypotheses: Trace-comparison setting. Semisimple Langlands parameters as in CSnc Remark 5.1.1: restriction of a Frobenius-semisimple WD representation along w ↦ (w, diag(|w|^{1/2}, |w|^{−1/2})).

Prerequisites: `IG.1`, `ET:ET.5`, `ET:ET.4`, `ET:ET.7b`, `AGII:AG2.1a`, `AGII:AG2.0`, `AGII:AG2.5`, `ET:ET.6`.

Source: [csnc](#ref-csnc), CSnc §5.1, Theorem 5.1.2, p. 65; [csnc](#ref-csnc), CSnc §5.1, p. 64.

<a id="ig-5-concentrated-cohomology-gives-constituent"></a>

**From mod-ℓ Igusa cohomology concentrated in one degree to a rational constituent with the dual residual Hecke system.** Under the standing assumptions, suppose H^i(Ig^b_{K(N)}, 𝔽_ℓ)_𝔪 is nonzero for exactly one i. Then H^*_c(Ig^b_{K(N)}, ℤ_ℓ)_{𝔪^∨} is concentrated in one degree and torsion-free, the corresponding ℚ̄_ℓ-cohomology is a nonzero lattice-bearing 𝕋^S-module whose eigencharacters lift 𝔪^∨, and in the decomposition of [H_c(Ig^b_{K(N)}, ℚ̄_ℓ)] there is j ∈ J with ψ_j ≡ 𝔪^∨ (mod the maximal ideal of ℤ̄_ℓ) and n_j ≠ 0 (no cancellation, since only one degree contributes). The semisimplified reduction ρ̄_{𝔪^∨} of ρ_j (IG.5/galois-representations-for-igusa-constituents) is independent of the choice of j and of the lattice.

Hypotheses: Trace-comparison setting.

Prerequisites: `IG.5`, `IG.1`, `AGII:AG2.7`, `SF:SF.2`, `SR:SR.0`, `SR:SR.0:derived-extension`.

Source: [csnc](#ref-csnc), CSnc §5.1, proof of Corollary 5.1.3, p. 66.

### Local lifts and the ordinary obstruction

<a id="ig-5-generic-lift-splits"></a>

**Local lifts of an unramified generic residual representation.** Let L/ℚ_p be finite with residue cardinality q, ℓ ≠ p, and ρ : Gal(L̄/L) → GL_m(ℚ̄_ℓ) continuous whose semisimplified reduction ρ̄ is unramified with Frobenius eigenvalues α₁, …, α_m satisfying α_i ≠ qα_j for i ≠ j. (1) If ρ̄ is moreover decomposed generic at L (α_i/α_j ∉ {1, q} for i ≠ j), then ρ ≅ ⊕χ_i is a sum of characters with χ_a/χ_b not the cyclotomic character for a ≠ b, so the corresponding representation of GL_m(L) is a generic principal series. (2) Without assuming the α_i distinct: if q ≢ 1 mod ℓ then ρ is unramified; if q ≡ 1 mod ℓ then ρ is a direct sum of characters whose pairwise ratios are not the cyclotomic character (when q≡1 mod ℓ the ratio condition itself forces distinct residual eigenvalues; repetitions are allowed in the q≠1 branch).

Hypotheses: ℓ ≠ p; α_i ≠ qα_j for i ≠ j.

Prerequisites: `AGII:AG2.7`, `AGD:D7`, `tauceti:TauCetiRoadmap`.

Source: [cs17](#ref-cs17), CS17 §6.2, Lemma 6.2.2, p. 756; [csnc](#ref-csnc), CSnc §5.1, proof of Corollary 5.1.3 and footnote 17, pp.66–67 (arXiv v2).

<a id="ig-5-genericity-forces-ordinary"></a>

**Generic residual eigenvalues at a split prime force the ordinary stratum.** Assume the standing assumptions and let 𝔪 ⊂ 𝕋^S be a maximal ideal such that H^i(Ig^b_{K(N)}, 𝔽_ℓ)_𝔪 ≠ 0 in exactly one degree. Then there is a continuous semisimple ρ̄_𝔪 : Gal(F̄/F) → GL_{2n}(𝔽̄_ℓ), unramified at every v | q ∉ S with q split in F₀, with ρ̄_𝔪(Frob_v) of characteristic polynomial the reduction modulo 𝔪 of X^{2n} − T_{1,v}X^{2n−1} + … + (−1)^i q_v^{i(i−1)/2}T_{i,v}X^{2n−i} + … + q_v^{n(2n−1)}T_{2n,v}; namely ρ̄_𝔪 := (ρ̄_{𝔪^∨})^∨ ⊗ |Art_F^{−1}|^{1−2n}. If moreover p splits completely in F and for all v | p, ρ̄_𝔪 is unramified at v with Frobenius eigenvalues α_{1,v}, …, α_{2n,v} satisfying α_{i,v} ≠ pα_{j,v} for i ≠ j (the residual ratio predicate owned by AutomorphicGaloisRepresentationsPartII AG2.7; repeated eigenvalues allowed), then b is ordinary.

Hypotheses: Trace-comparison setting. p splits completely in F for the last assertion.

Prerequisites: `IG.5`, `ET:ET.6`, `AGII:AG2.7`.

Source: [csnc](#ref-csnc), CSnc §5.1, Corollary 5.1.3, p. 66; [csnc](#ref-csnc), CSnc §2.8, Theorem 2.8.6, p. 35.

## Layer IG.6: Boundary cohomology and Pink’s formula

The maximal-parabolic boundary strata have lower-rank Igusa and GL_r locally symmetric factors. The local chart comparison gives an equivariant Pink formula. Derived invariants and unnormalized Hecke restriction make it compatible with global localization. Induction on rank uses both degree bounds and torsion Galois determinants; it establishes a boundary length obstruction before the final length-at-most-two hypothesis is imposed.

### Parabolic strata and their local comparison

<a id="ig-6-boundary-strata-by-parabolics"></a>

**Boundary strata of Ig^{b,*} indexed by rational parabolics and the lower-rank Igusa datum b_P.** The boundary ∂Ig^{b,*} ⊂ Ig^{b,*} is stratified by the conjugacy classes [P] of maximal rational parabolics of G_ℚ, represented by P_r = Stab(0 ⊂ F^r ⊂ F^{2n−r} ⊂ F^{2n}), r = 1, …, n: Ig^{b,*}_{[P_r]} is the preimage of the strata S_Z ⊂ S^* whose cusp label Z = (Z_N, X) has rk_{O_F} X = r; the strata are Hecke-equivariant and pass to the limit Ig^{b,*}_{∞,[P]}. The Levi of the standard P = P_r is M = Res_{F/ℚ}GL_r × G_{2(n−r)} (replace n by n−r; for r=n, G_0=𝔾_m). Let X_r = (∏_{τ:F⁺↪ℝ} M^{herm,>0}_r(ℂ))/ℝ_{>0} be the symmetric space of GL_r(F ⊗ ℝ). Fix an O_F-stable symplectic filtration Z_b : 0 ⊂ Z_{b,−2} ⊂ Z_{b,−1} ⊂ X_b with Z_{b,−2} ≅ Hom(O_F^r, μ_{p^∞}); it defines the parabolic P_b(ℚ_p) ⊂ J_b(ℚ_p) of self-quasi-isogenies preserving it and the p-divisible group X_P = Z_{b,−1}/Z_{b,−2} with G_{2(n−r)}-structure, with isocrystal class b_P ∈ B(G_{2(n−r),ℚ_p}, μ^{−1}). With j : Ig^b_∞ ↪ Ig^{b,*}_∞ and i_{[P]} the inclusion of the stratum, RΓ_c(Ig^{b,*}_{∞,[P]}, i^*_{[P]}Rj_*𝔽_ℓ) is a complex of smooth J_b(ℚ_p) × G(𝔸_f^p)-representations.

The rank-r stratum closure is contained in the union of rank≥r strata; do not require equality when some strata are empty.

Hypotheses: Boundary tower setting.

API: `boundaryStratum`, `boundaryStratum_union`, `levelSubgroup`, `lowerRankDatum`, `levi`, `boundaryStratum_hecke`.

Prerequisites: `IG.2`, `IG.0`, `ALS:ALS.2`, `EDC:EDC.0`, `mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology`.

Source: [csnc](#ref-csnc), CSnc §6.1, p. 79; [csnc](#ref-csnc), CSnc §6.1, p. 80.

<a id="ig-6-boundary-parabolic-induction"></a>

**The boundary strata are parabolically induced.** There is a natural J_b(ℚ_p) × G(𝔸_f^p)-equivariant map Ig^{b,*}_{∞,[P]} → J_b(ℚ_p)/P_b(ℚ_p) × G(𝔸_f^p)/P(𝔸_f^p) induced by the cusp labels (the target parametrizes pairs (Z_b, Z^p) of rank r). With Ig^{b,*}_{∞,P} its fibre over the identity, RΓ_c(Ig^{b,*}_{∞,[P]}, i^*_{[P]}Rj_*𝔽_ℓ) ≅ Ind^{J_b(ℚ_p)×G(𝔸_f^p)}_{P_b(ℚ_p)×P(𝔸_f^p)} RΓ_c(Ig^{b,*}_{∞,P}, i^*_P Rj_*𝔽_ℓ) (unnormalized smooth induction).

Hypotheses: Boundary tower setting.

Prerequisites: `IG.6`, `IG.2`, `SR:SR.0`, `SR:SR.2`, `SR:SR.0:derived-extension`.

Source: [csnc](#ref-csnc), CSnc §6.2.1, p. 80.

<a id="ig-6-boundary-comparison-map"></a>

**The comparison map: cup product of the lower-rank Igusa factor and the GL_r locally symmetric factor.** There is a natural P_b(ℚ_p) × P(𝔸_f^p)-equivariant map RΓ(GL_r(F)\(X_r × GL_r(𝔸_{F,f})), 𝔽_ℓ) ⊗ RΓ_c(Ig^{b_P}_∞, 𝔽_ℓ) → RΓ_c(Ig^{b,*}_{∞,P}, i^*_P Rj_*𝔽_ℓ), the cup product of (1) RΓ_c(Ig^{b_P}_∞, 𝔽_ℓ) → RΓ_c(Ig^{b,*}_{∞,P}, 𝔽_ℓ), pullback along the profinite map Ig^{b,*}_{∞,P} → Ig^{b_P}_∞ (limit of IG.2/minimal-igusa-boundary-strata), and (2) RΓ(GL_r(F)\(X_r × GL_r(𝔸_{F,f})), 𝔽_ℓ) → RΓ(Ig^{b,*}_{∞,P}, i^*_P Rj_*𝔽_ℓ), constructed from a continuous P_b(ℚ_p) × P(𝔸_f^p)-equivariant map f  : |Ig^b_{∞,P}| → GL_r(F)\(X_r × GL_r(𝔸_{F,f})) on the punctured perfectoid formal neighbourhood (the logarithms of the norms of the sections of the Poincaré bundle of the Raynaud extension give the point of X_r, well defined up to ℝ_{>0}; the level structures give the adelic component), together with RΓ(Ig^{b,*}_{∞,P}, i^*_P Rj_*𝔽_ℓ) ≅ colim_{m,N} RΓ(Ig^b_{m,K(N),P}, 𝔽_ℓ) (Huber, Cor. 3.5.14, at each finite level) and RΓ(GL_r(F)\(X_r × GL_r(𝔸_{F,f})), 𝔽_ℓ) ≅ colim_K RΓ(GL_r(F)\(X_r × GL_r(𝔸_{F,f})/K), 𝔽_ℓ) (Borel–Serre). Both maps are equivariant for P_b(ℚ_p) × P(𝔸_f^p) acting through J_{b_P}(ℚ_p) × G_{2(n−r)}(𝔸_f^p), respectively GL_r(𝔸_{F,f}).

The unipotent radicals of P_b(ℚ_p) and P(𝔸_f^p) act trivially on the source; equivariance factors through the stated Levi projections.

Hypotheses: Boundary tower setting.

API: `boundaryComparison`, `igusaFactor`, `lsFactor`, `lsFactor_equivariant`, `boundaryComparison_levi`.

Prerequisites: `IG.6`, `IG.2`, `IG.1`, `CAEC:H1:formal-adic-comparison`, `ALS:ALS.2`, `ALS:ALS.1`, `ALS:ALS.0`, `SC:C4`, `NM:R11.3`.

Source: [csnc](#ref-csnc), CSnc §6.2.2, p. 81; [csnc](#ref-csnc), CSnc §6.2.3, p. 83.

<a id="ig-6-local-boundary-computation"></a>

**The local computation on Igusa cusp labels.** Decompose Ig^{b,*}_{∞,P} by Igusa cusp labels above P: finite projective O_F-modules X of rank r with X ⊗ ℤ̂^p ≅ O_F^r ⊗ ℤ̂^p and X ⊗ ℤ_p ≅ O_F^r ⊗ ℤ_p, giving ⊔_{X/≅} GL_{O_F}(X)\GL_{O_F}(X ⊗ ℤ̂) ≅ GL_r(F)\GL_r(𝔸_{F,f}), compatibly with f. For the closed subset Ig^{b,*}_{∞,Z̃} of a fixed label, the map RΓ_c(Ig^{b_P}_∞, 𝔽_ℓ) ⊗ colim_{Γ ⊂ GL_{O_F}(X)} RΓ(Γ, 𝔽_ℓ) → RΓ_c(Ig^{b,*}_{∞,Z̃}, i^*_{Z̃}Rj_*𝔽_ℓ) (Γ running over congruence subgroups) is an isomorphism. The same method proves Pink's original formula Hecke-equivariantly (alternative to Pink §4.8).

Hypotheses: Boundary tower setting.

Prerequisites: `IG.6`, `IG.2`, `ACCoh:L5`, `SC:C4`, `NM:R11.3`.

Source: [csnc](#ref-csnc), CSnc §6.3, Proposition 6.3.1, p. 84; [csnc](#ref-csnc), CSnc §6.3, proof of Proposition 6.3.1, p. 84; [ls18a-author](#ref-ls18a-author), §4.3, Assumption 4.3.1 and Lemma 4.3.2, author-copy p.61; Definition 4.3.8 and Theorem 4.3.10, pp.63–64.

### Pink’s formula and boundary induction

<a id="ig-6-igusa-pink-formula"></a>

**Pink's formula for Igusa varieties.** There is a natural J_b(ℚ_p) × G(𝔸_f^p)-equivariant isomorphism RΓ_c(Ig^{b,*}_{∞,[P]}, i^*_{[P]}Rj_*𝔽_ℓ) ≅ Ind^{J_b(ℚ_p)×G(𝔸_f^p)}_{P_b(ℚ_p)×P(𝔸_f^p)} (RΓ(GL_r(F)\(X_r × GL_r(𝔸_{F,f})), 𝔽_ℓ) ⊗ RΓ_c(Ig^{b_P}_∞, 𝔽_ℓ)), with unnormalized smooth induction and P_b(ℚ_p) × P(𝔸_f^p) acting on the tensor product through its Levi quotient (J_{b_P}(ℚ_p) × G_{2(n−r)}(𝔸_f^p) on the Igusa factor, GL_r(𝔸_{F,f}) on the locally symmetric factor). No Tate twist or cohomological shift enters (𝔽_ℓ coefficients, degrees as written). The isomorphism is an equivariant isomorphism of complexes, not only an equality of Euler characteristics.

Hypotheses: Boundary tower setting.

Prerequisites: `IG.6`.

Source: [csnc](#ref-csnc), CSnc §6.1, Theorem 6.1.1, p. 80.

<a id="ig-6-parabolic-induction-derived-invariants"></a>

**Derived invariants of induced and inflated smooth representations and the Hecke restriction maps.** Let P = MN be a standard rational parabolic of G, K^S = ∏_{v∉S} hyperspecial, K^S_P = K^S ∩ P(𝔸^S), K^S_M its image in M(𝔸^S), r_P : 𝕋^S → 𝕋^S_P restriction of functions and r_M : 𝕋^S_P → 𝕋^S_M integration along unipotent fibres (so r_M ∘ r_P is the unnormalized Satake transform; ArithmeticLocallySymmetricSpaces ALS.4). Then (1) RΓ_cont(K^S, Ind^{G(𝔸^S)}_{P(𝔸^S)}(−)) ≅ r_P^* RΓ_cont(K^S_P, −) as functors D^+_sm(P(𝔸^S), 𝔽_ℓ) → D^+(𝕋^S); (2) r_M^* RΓ_cont(K^S_M, −) ≅ RΓ_cont(K^S_P, Inf^{P(𝔸^S)}_{M(𝔸^S)}(−)) as functors D^+_sm(M(𝔸^S), 𝔽_ℓ) → D^+(𝕋^S_P).

Hypotheses: K^S hyperspecial at every place outside S (Iwasawa decomposition G(𝔸^S) = K^S P(𝔸^S)); K^S_N pro-prime-to-ℓ.

Prerequisites: `ALS:ALS.4`, `SR:SR.0`, `SR:SR.2`, `SR:SR.0:derived-extension`.

Source: [csnc](#ref-csnc), CSnc §6.4, Lemma 6.4.2, p. 85; [csnc](#ref-csnc), CSnc §6.4, Lemma 6.4.3, p. 86.

<a id="ig-6-boundary-length-obstruction"></a>

**Galois representations for Igusa cohomology and the boundary length obstruction.** Assume p unramified in F, F contains properly an imaginary quadratic F₀ in which p splits, F⁺ ≠ ℚ, S and N ≥ 3 as in §5 (N prime to p, divisible only by primes of S^p_f and by N₀), and 𝔪 ⊂ 𝕋^S a maximal ideal containing ℓ; Igusa varieties at tame level K^p(N). (1) If for some b ∈ B(G_{ℚ_p}, μ^{−1}) one of H^i_{c−∂}(Ig^b, 𝔽_ℓ)_𝔪, H^i(Ig^b, 𝔽_ℓ)_𝔪 is nonzero, then there is a continuous semisimple ρ̄_𝔪 : Gal(F̄/F) → GL_{2n}(𝔽̄_ℓ) with ρ̄_𝔪(Frob_v) of characteristic polynomial X^{2n} − T_{1,v}X^{2n−1} + … + (−1)^i q_v^{i(i−1)/2}T_{i,v}X^{2n−i} + … + q_v^{n(2n−1)}T_{2n,v} mod 𝔪 for all v | q ∉ S split in F₀. (2) If moreover H^i_{c−∂}(Ig^b, 𝔽_ℓ)_𝔪 → H^i(Ig^b, 𝔽_ℓ)_𝔪 is not an isomorphism for some i and b is not ordinary, then ρ̄_𝔪 has at least 3 Jordan–Hölder constituents. Both parts are proved together, by induction on n, uniformly for all the unitary groups G_{2m}, m ≤ n. The hypothesis that ρ̄_𝔪 has length at most two is not assumed here; it is the hypothesis under which (2) is applied in IG.7.

Hypotheses: As stated; the induction uses the theorem for G_{2(n−r)}, 1 ≤ r ≤ n, and the torsion Galois determinants for GL_r over F.

Prerequisites: `IG.6`, `IG.5`, `IG.4`, `TC:TC.4`, `IHG:IHG.0`, `IHG:IHG.1`, `IHG:IHG.4`, `ALS:ALS.4`.

Source: [csnc](#ref-csnc), CSnc §6.4, Theorem 6.4.1, p. 84; [csnc](#ref-csnc), CSnc §6.4, proof of Theorem 6.4.1, p. 86; [csnc](#ref-csnc), CSnc §2.8, Theorem 2.8.7, p. 35.

## Layer IG.7: Generic vanishing and its arithmetic forms

Assemble the global argument by eliminating nonordinary strata and descending the infinite-level bound. Integral coefficients and boundary excision give the middle-degree maps used in potential automorphy. Then assemble the separate local spectral argument: non-quasi-split local terms vanish, and the localized ordinary costalk equals the stalk. This removes the real-degree and residual-length restrictions under the local hyperspecial hypotheses, without changing the distinction between ordinary and compact support.

### Global genericity and descent

<a id="ig-7-cs-generic-maximal-ideal"></a>

**Caraiani–Scholze generic maximal ideals: the hypotheses of the concentration theorem.** A maximal ideal 𝔪 ⊂ 𝕋^S of Galois type (with semisimple ρ̄_𝔪 : Gal(F̄/F) → GL_{2n}(𝔽̄_ℓ) whose Frobenius polynomials are those of IG.5/genericity-forces-ordinary) is CS-generic if (i) F⁺ ≠ ℚ; (ii) ρ̄_𝔪 has at most two Jordan–Hölder constituents; (iii) some prime p ≠ ℓ splits completely in F and ρ̄_𝔪 is unramified at every v | p with Frobenius eigenvalues satisfying α_{i,v} ≠ pα_{j,v} for i ≠ j (a decomposed-generic prime in the sense of AutomorphicGaloisRepresentationsPartII AG2.7; repeated eigenvalues are allowed, so the distinctness α_i ≠ α_j of CS17 is not required). This is distinct from (a) non-Eisenstein (ρ̄_𝔪 absolutely irreducible), which is neither implied by nor implies (iii), and (b) the stronger CS17 decomposed genericity α_i/α_j ∉ {1, q}. The renaming dictionary for ACC+: the coefficient prime called ℓ here is called p in ACC+, and the auxiliary split prime called p here is called l there.

Hypotheses: Global residual-system setting.

Required API:

- `IsCSGeneric`: The predicate (i)–(iii) on a Galois-type maximal ideal 𝔪.
- `IsCSGeneric.dual`: 𝔪 CS-generic iff 𝔪^∨ CS-generic (IG.5/dual-hecke-ideal).
- `IsCSGeneric.of_strong`: CS17 decomposed genericity (α_i/α_j ∉ {1, q}) at a completely split p with length ≤ 2 implies CS-generic.
- `IsCSGeneric.infinitely_many_primes`: If some p witnesses (iii), infinitely many do, avoiding any finite set (AG2.7, Chebotarev).
- `IsCSGeneric.acc_dictionary`: Equivalent to ACC+ "decomposed generic and length ≤ 2" after exchanging the names of the two primes.

Examples and tests:

- For 2n = 2, ρ̄ = χ₁ ⊕ χ₂ with χ₁, χ₂ unramified at all v | p (p completely split) and χ₁(Frob_v)/χ₂(Frob_v) ∉ {p, p^{−1}} is CS-generic of length two; ρ̄ = 1 ⊕ ε̄^{−1} is not (its eigenvalue ratio at every such v is p).
- A ρ̄_𝔪 with three or more Jordan–Hölder constituents (for instance a sum of three nonzero subrepresentations of GL_{2n}) is never CS-generic (condition (ii) fails), whatever its eigenvalues.
- CS-generic does not imply non-Eisenstein: the reducible χ₁ ⊕ χ₂ of IsCSGeneric.reducible_ok is CS-generic and Eisenstein.
- Repeated eigenvalues α_i = α_j are allowed when α_i ≠ pα_j (CSnc Remark 1.4).

Prerequisites: `AGII:AG2.7`, `IG.0`.

Source: [csnc](#ref-csnc), CSnc §2.8, proof of Theorem 1.1, p. 36; [acc23](#ref-acc23), Definition 4.3.1, pp. 76–77 (recalled from [CS17, Defn. 1.9] with p and l swapped).

<a id="ig-7-cohomologically-generic"></a>

**Cohomologically generic Hecke homomorphisms.** Let N ≥ 1, Σ⁺ a finite set of nonarchimedean places of F⁺ containing Σ⁺_bad, and 𝕋_N^{Σ⁺} the abstract spherical Hecke algebra of the unitary groups U(V) of N-dimensional hermitian spaces over F. A homomorphism φ : 𝕋_N^{Σ⁺} → κ to a field is cohomologically generic if H^i_ét(Sh(V, K)_{F̄}, κ)_{𝕋_N^{Σ⁺′} ∩ ker φ} = 0 for every finite Σ⁺′ ⊇ Σ⁺, every i ≠ N − 1, every standard indefinite hermitian space V of dimension N and every K = K_{Σ⁺′} × ∏_{v∉Σ⁺_∞∪Σ⁺′} U(Λ)(O_{F⁺_v}) with Λ self-dual. It is the cohomological conclusion of the compact-case concentration theorem, used as a hypothesis by Liu–Tian–Xiao–Zhang–Zhu.

Hypotheses: Notation of LTXZZ §3: standard indefinite hermitian spaces have signature (N − 1, 1) at one archimedean place and (N, 0) at the others.

Required API:

- `IsCohomologicallyGeneric`: The vanishing predicate on φ : 𝕋_N^{Σ⁺} → κ.
- `IsCohomologicallyGeneric.mono`: Stable under enlarging Σ⁺.
- `IsCohomologicallyGeneric.field_ext`: Invariant under extension of the field κ.
- `IsCohomologicallyGeneric.of_decomposedGeneric`: For φ with values in 𝔽̄_ℓ and F⁺≠ℚ, an auxiliary split decomposed-generic witness away from ℓ and from every prescribed finite enlargement of Σ⁺ implies cohomological genericity, by repeated application of LTXZZ PropositionD.1.3 as in CorollaryD.1.4. A single witness is insufficient for an arbitrary abstract Hecke character.

Examples and tests:

- For N = 1 every φ is cohomologically generic.
- The Eisenstein homomorphism attached to the trivial representation (degree of H^0) is not cohomologically generic for N ≥ 2, since H^0 ≠ 0 and 0 ≠ N − 1.
- For N = 2 (Shimura curves), φ is cohomologically generic iff, for every V and K as in the definition, the localized H⁰ and H² vanish.

Prerequisites: `IG.7`, `AGII:AG2.7`.

Source: [ltxzz](#ref-ltxzz), Appendix D, §D.1 'Vanishing of cohomology off middle degree', Definition D.1.1, p. 365; [ltxzz](#ref-ltxzz), Published Appendix D, Proposition D.1.3 p.365 and Corollary D.1.4 p.368.

<a id="ig-7-only-ordinary-contributes"></a>

**Under CS-genericity only the ordinary stratum contributes, in degrees ≥ d.** Assume p unramified in F, N ≥ 3 prime to p, divisible only by primes in S^p_f and by N₀, S ⊇ {∞} ∪ {primes dividing pℓNΔ_F} ∪ {ramification of ϖ}, and 𝔪 ⊂ 𝕋^S CS-generic with witness prime p (completely split in F). Then H^i(Ig^b, 𝔽_ℓ)_𝔪 ≠ 0 only if b is ordinary, and then only for i ≥ d. Consequently (Rπ°_HT*𝔽_ℓ)_𝔪 is concentrated on the ordinary locus Fℓ(ℚ_p) and in degrees ≥ d, and H^i(S°_{K(p^∞N),C}, 𝔽_ℓ)_𝔪 ≅ H^i(Fℓ, (Rπ°_HT*𝔽_ℓ)_𝔪) vanishes for i < d.

Hypotheses: Global residual-system setting. Witness prime p ≠ ℓ completely split in F.

Prerequisites: `IG.4`, `IG.6`, `IG.5`, `IG.3`, `IG.7`.

Source: [csnc](#ref-csnc), CSnc §2.8, proof of Theorem 1.1, p. 36.

<a id="ig-7-level-descent"></a>

**Descent from infinite level at p and to general neat level.** (1) If H^i(S°_{K(p^∞N),C}, 𝔽_ℓ)_𝔪 = 0 for i < d, then H^i(X_{K(N)}, 𝔽_ℓ)_𝔪 = 0 for i < d. (2) For the unitary group, H^i(X⁰_{K⁰}, 𝔽_ℓ)_{𝔪⁰} = 0 for i < d at K⁰ = K(N) ∩ G⁰(𝔸_f), 𝔪⁰ the image of 𝔪 under 𝕋^S → 𝕋^{0,S}. (3) For arbitrary neat K⁰, rechoose a good generic auxiliary prime away from its bad level primes, then descend from a normal principal-level cover using continuous étale Cartan–Leray, compatibly with the Hecke localization. The arbitrary-neat-level step uses the geometric Hecke-compatible normal-cover Cartan–Leray interface of SF.2/SR.0.

Hypotheses: Global residual-system setting.

Prerequisites: `IG.7`, `IG.3`, `IG.0`, `SF:SF.2`, `SR:SR.0`, `SR:SR.0:derived-extension`.

Source: [csnc](#ref-csnc), CSnc §2.8, proof of Theorem 1.1, p. 36.

### Vanishing, integral coefficients and middle-degree maps

<a id="ig-7-caraiani-scholze-vanishing"></a>

**The generic part of the cohomology lies on the correct side of the middle degree (Caraiani–Scholze, Theorem 1.1).** Let F be a CM field containing an imaginary quadratic field with F⁺ ≠ ℚ, G⁰ the quasi-split unitary group of signature (n, n) at each archimedean place, K ⊂ G⁰(𝔸_f) neat, d = [F⁺:ℚ]n², and 𝔪 ⊂ 𝕋^S a maximal ideal in the support of H^*(X_K, 𝔽_ℓ) such that (ii) ρ̄_𝔪 has length at most 2 and (iii) there is a prime p ≠ ℓ splitting completely in F with ρ̄_𝔪 unramified at all v | p and α_{i,v} ≠ pα_{j,v} for i ≠ j. Then (1) H^i(X_K, 𝔽_ℓ)_𝔪 ≠ 0 implies i ≥ d, and (2) H^i_c(X_K, 𝔽_ℓ)_𝔪 ≠ 0 implies i ≤ d. It is not asserted that ordinary and compactly supported cohomology are both concentrated in degree d (false in the reducible boundary case).

Hypotheses: Global residual-system setting. 𝔪 CS-generic (IG.7/cs-generic-maximal-ideal).

Prerequisites: `IG.7`, `IG.5`, `ALS:ALS.5:finite-level-duality`.

Source: [csnc](#ref-csnc), CSnc §1, Theorem 1.1, p. 5.

<a id="ig-7-integral-and-local-system-versions"></a>

**Integral coefficients, local systems, torsion-freeness and the boundary exact sequence.** Under the hypotheses of IG.7/caraiani-scholze-vanishing: (1) H^i(X_K, ℤ_ℓ)_𝔪 = 0 for i < d and H^i_c(X_K, ℤ_ℓ)_𝔪 = 0 for i > d; (2) H^d(X_K, ℤ_ℓ)_𝔪 is torsion-free; (3) the sequence 0 → H^{d−1}(∂X_K, ℤ_ℓ)_𝔪 → H^d_c(X_K, ℤ_ℓ)_𝔪 → H^d(X_K, ℤ_ℓ)_𝔪 → H^d(∂X_K, ℤ_ℓ)_𝔪 → 0 is exact (∂X_K the Borel–Serre boundary); (4) the same hold for the local systems V_λ attached to algebraic representations with ℤ_ℓ-lattices (via Hochschild–Serre from a deeper ℓ-power level where V_λ/ℓ^m is trivial).

Hypotheses: Global residual-system setting. 𝔪 CS-generic.

Prerequisites: `IG.7`, `ALS:ALS.4`, `AGD:R02.2`, `ALS:ALS.6`.

Source: [csnc](#ref-csnc), CSnc §1, Remark 1.5, pp. 5–6.

<a id="ig-7-irreducible-specialization"></a>

**Absolutely irreducible residual representations: boundary vanishing and middle-degree concentration.** If moreover ρ̄_𝔪 is absolutely irreducible (so 𝔪 is non-Eisenstein), then H^i(∂X_K, 𝔽_ℓ)_𝔪 = 0 for all i, hence H^i_c(X_K, 𝔽_ℓ)_𝔪 ≅ H^i(X_K, 𝔽_ℓ)_𝔪 vanish outside i = d; integrally, H^i(X_K, ℤ_ℓ)_𝔪 is concentrated in degree d and torsion-free. This is a separate specialization: the boundary vanishing is imported (Borel–Serre boundary strata and their Hecke eigenvalues), and only the deduction of concentration is proved here.

Hypotheses: Global residual-system setting. 𝔪 CS-generic and ρ̄_𝔪 absolutely irreducible.

Prerequisites: `IG.7`, `ALS:ALS.4`, `TC:TC.3`.

Source: [csnc](#ref-csnc), CSnc §1, Remark 1.6, p. 6; [acc23](#ref-acc23), Theorem 2.4.2, p. 46 (§2.4); proof pp. 46–49.

<a id="ig-7-acc-middle-degree-export"></a>

**The middle-degree injection and boundary surjection exported to potential automorphy.** Assume [F⁺:ℚ] > 1, F contains an imaginary quadratic field, and the set S satisfies: for every finite place v ∉ S of residue characteristic l, either S contains no l-adic place and l is unramified in F, or l splits in an imaginary quadratic subfield of F. Let 𝔪̃ ⊂ 𝕋̃^S(K̃, λ̃) be a maximal ideal of the Hecke algebra of the quasi-split unitary group G̃ in 2n variables acting on cohomology with coefficients V_λ̃ (an O-lattice in an algebraic representation, O the ring of integers of a finite extension of ℚ_p, p the coefficient prime in ACC+ notation) such that ρ̄_𝔪̃ has length at most 2 and is decomposed generic (ACC+ Definition 4.3.1). Then, with d = n²[F⁺:ℚ], H^d(X̃_K̃, V_λ̃)_𝔪̃ → H^d(X̃_K̃, V_λ̃[1/p])_𝔪̃ is injective and H^d(X̃_K̃, V_λ̃)_𝔪̃ → H^d(∂X̃_K̃, V_λ̃)_𝔪̃ is surjective. Renaming dictionary: ACC+'s coefficient prime p is ℓ here and its auxiliary prime l is p here.

Hypotheses: As stated (ACC+ §4.3); the level and ramification conditions on S are those of ACC+.

Prerequisites: `IG.7`, `ALS:ALS.4`.

Source: [acc23](#ref-acc23), Theorem 4.3.3, p. 77 (§4.3 'Cohomology in the middle degree'); proof pp. 77–78.

### Local parameters and the spectral argument

<a id="ig-7-koshikawa-parameter-irrelevance"></a>

**Generic unramified parameters are irrelevant for nonsplit inner forms.** Let G=∏GL_{n_i} over a finite extension F/ℚ_p with residue cardinal q, b∈B(G), and associated J_b not quasi-split (an inner form of the Newton centralizer Levi). For every irreducible smooth 𝔽̄_ℓ-representation π of J_b(F), ℓ≠p, its Fargues–Scholze semisimple parameter is not a generic unramified parameter of G: if it is unramified, the eigenvalues in some factor have α_{j′}/α_j=q for j≠j′. Apply the twisted Levi inclusion appropriate to J_b when viewing its parameter in G.

API: `koshikawaParameterIrrelevance`.

Prerequisites: `ES:ES5`, `ES:ES6:functoriality`, `ES:ES7:parabolic`, `ES:ES7:GLn-comparison`, `SR:SR.5`.

Source: [kos21](#ref-kos21), §§2–3, Theorem 2.1 and Lemma 3.1, pp.4–5; [kos21](#ref-kos21), §3, Lemma 3.1, p.5.

<a id="ig-7-koshikawa-local-vanishing"></a>

**Generic part of the cohomology of local Shimura varieties with non-quasi-split J_b.** Let F/ℚ_p be finite with residue field 𝔽_q, (G, b, μ) a local Shimura datum with G = ∏_{i∈I} GL_{n_i}, K = ∏GL_{n_i}(O_F) and M_{(G,b,μ),K} the local Shimura variety, ℓ ≠ p. Let 𝔪 ⊂ ℤ_ℓ[K\G(F)/K] be a maximal ideal whose unramified L-parameter ρ̄_𝔪 is generic (the eigenvalues of ρ̄_𝔪(Frob_F) in each GL_{n_i} satisfy α_{j′}/α_j ≠ q for j ≠ j′). If J_b is not quasi-split, then H^i_c(M_{(G,b,μ),K}, ℤ_ℓ)_𝔪 = 0 for every i (cohomology over the completed algebraic closure).

Hypotheses: G a product of GL_{n_i}, hyperspecial K; ρ̄_𝔪 generic in Koshikawa's sense.

API: `koshikawaSpectralSatake`, `koshikawaSpectralSatakeReduction`.

Prerequisites: `HS:HS2`, `ES:ES5`, `IG.7`, `ES:ES3`, `SR:SR.6`.

Source: [kos21](#ref-kos21), Theorem 1.1, p. 1 (§1.1 'Local vanishing'); proof §4; [kos21](#ref-kos21), §1.1, p. 1 (definition of 'generic' for the unramified L-parameter ρ_m); used globally in Conjecture 1.2, p. 2; [kos21](#ref-kos21), §4, pp.5–6.

<a id="ig-7-koshikawa-ordinary-costalk-bound"></a>

**Ordinary local cohomology has the semiperverse lower bound.** For the quasi-split unitary datum, p completely split, ℓ≠p, put F=Rπ°_{HT,*}𝔽_ℓ and let i₀:Fℓ(ℚ_p)→Fℓ_C be the closed ordinary locus. Then RΓ_{Fℓ(ℚ_p)}(Fℓ_C,F)=RΓ_c(Fℓ(ℚ_p),Ri₀!F) lies in D^{≥d}(𝔽_ℓ). The same bound holds for RΓ_c([Fℓ(ℚ_p)/K_p],Ri₀!F) for the sufficiently small compact opens used at finite level. This is an unlocalized costalk bound, not a stalk bound.

API: `koshikawaOrdinaryCostalkBound`.

Prerequisites: `IG.4`, `SF:SF.2`, `SR:SR.0`, `EDC:EDC.5`, `SR:SR.0:derived-extension`, `LPV:LPV.6`, `DSO:S3`.

Source: [kos21](#ref-kos21), Corollary 8.2 and Lemma 8.3, pp.13–14.

<a id="ig-7-koshikawa-ordinary-costalk-stalk"></a>

**Local spherical localization identifies ordinary costalk and stalk cohomology.** With F=Rπ°_{HT,*}𝔽_ℓ and i₀ the closed ordinary locus, let 𝔪_p be a maximal ideal of the local spherical ℤ_ℓ Hecke algebra at p with generic unramified parameter. The natural map RΓ_c([Fℓ(ℚ_p)/K_p],Ri₀!F)_{𝔪_p}→RΓ_c([Fℓ(ℚ_p)/K_p],i₀^*F)_{𝔪_p} is an isomorphism. Localization is at p only. No away-p minimal-stratum theorem or Pink formula is used.

API: `koshikawaOrdinaryCostalkStalk`.

Prerequisites: `IG.7`, `IG.3`, `BG:BG3`, `ES:ES3`, `ES:ES4`, `ES:ES6:duality`, `SR:SR.0:derived-extension`, `VS:VS4`, `DSO:S3`, `DSO:S4`.

Source: [kos21](#ref-kos21), Proposition 1.7, p.3; proof §9, pp.14–16; Lemma 9.1, p.15.

<a id="ig-7-koshikawa-generic-vanishing"></a>

**Generic vanishing with localization at p only, without [F⁺:ℚ] > 1 or the length condition.** Let F be a CM field, B = F, V = F^{2n} with the quasi-split unitary similitude group G (the datum of IG.0), p a prime splitting completely in F, K_p hyperspecial, K = K_pK^p sufficiently small, d = dim S_K and ℓ ≠ p. Let 𝔪_p ⊂ ℤ_ℓ[K_p\G(ℚ_p)/K_p] be a maximal ideal of the local Hecke algebra at p whose unramified parameter ρ̄_{𝔪_p} is generic. Then H^i(S_K, 𝔽_ℓ)_{𝔪_p} ≠ 0 only for i ≥ d and H^i_c(S_K, 𝔽_ℓ)_{𝔪_p} ≠ 0 only for i ≤ d. In particular the conclusion of IG.7/caraiani-scholze-vanishing and of IG.7/acc-middle-degree-export holds without the hypotheses [F⁺:ℚ] > 1 and "ρ̄_𝔪 of length at most two" (Koshikawa Theorem 1.3; Caraiani–Newton Theorem 2.1.28).

Hypotheses: p completely split in F; K_p hyperspecial; ρ̄_{𝔪_p} generic (α_{j′}/α_j ≠ q).

Prerequisites: `IG.7`, `IG.3`, `IG.0`.

Source: [kos21](#ref-kos21), Theorem 1.3, p. 2; proof §9, pp. 14–16; [cn23](#ref-cn23), Proof of Theorem 2.1.28, p. 25.

<a id="ig-7-middle-degree-without-length-hypothesis"></a>

**Middle-degree injection and boundary surjection without [F⁺:ℚ] > 1 or length two (Caraiani–Newton Theorem 2.1.28).** Let F be an imaginary CM field containing an imaginary quadratic field, T ⊇ S_p a finite set of finite places with T = T^c such that every finite v ∉ T of residue characteristic l either has T free of l-adic places and l unramified in F, or l split in an imaginary quadratic subfield of F. Let 𝔪̃ ⊂ 𝕋̃^T(K̃, λ̃) be a maximal ideal with ρ̄_𝔪̃ decomposed generic (Caraiani–Newton Definition 2.1.27: some ℓ ≠ p splits completely in F with ρ̄|_{G_{F_v}} unramified and α_i/α_j ≠ ℓ for all v | ℓ), and d = dim_ℂ X̃_K̃. Then there are 𝕋̃^T-equivariant maps H^d(X̃_K̃, V_λ̃[1/p])_𝔪̃ ↩ H^d(X̃_K̃, V_λ̃)_𝔪̃ ↠ H^d(∂X̃_K̃, V_λ̃)_𝔪̃, the first injective and the second surjective.

Hypotheses: As stated; this is the form needed for F⁺ = ℚ.

Prerequisites: `IG.7`, `ALS:ALS.4`.

Source: [cn23](#ref-cn23), Theorem 2.1.28 and its proof, p. 25 (§2.1); [cn23](#ref-cn23), Theorem 2.1.26, p. 24 (same hypotheses on F as Theorem 2.1.20, p. 22); setup §2.1.11, p. 15.

## Supplier interfaces

These interfaces specify the additional results used from neighbouring layers. They are mathematical assumptions on the constructions above. In particular, rational nearby-cycle exactness over a trait does not substitute for torsion exactness over O_C, a dimension formula does not substitute for an equivariant dualizing object, and a characteristic-zero parameter comparison does not substitute for the mod-ℓ spectral action. The relevant supplier layer must provide the full interface before the dependent theorem can be proved.

**`AbelianSchemesAndArithmeticModuli:A4`.** Classical Serre–Tate theorem: for S′ → S a nilpotent thickening on which p is nilpotent, abelian schemes over S′ (with endomorphisms and polarization) are equivalent to triples (A_S, 𝒢_{S′}, A_S[p^∞] ≅ 𝒢 ⊗ S), and the p-divisible group A[p^∞] of an abelian scheme; IG.0 extends it to semi-abelian schemes and non-noetherian bases.

Used by: IG.0, IG.3.

**`BunGAndNewtonStrata:BG1`.** The Kottwitz set B(G, μ) = {b : κ(b) = μ^♮, ν_b ≤ μ^◇} with its partial order (the ordinary element is maximal when the reflex field is ℚ), using only the algebraic B(G)/Newton/Kottwitz data; and the Rapoport–Richartz statement that the isocrystal of a point of a PEL special fibre lies in B(G_{ℚ_p}, μ^{−1}). No analytic torsor comparison is needed.

Used by: IG.0, IG.2, IG.3.

**`BunGAndNewtonStrata:BG3`.** For the minuscule modification map q_K:[Fℓ/K_p]→Bun_G used by Koshikawa Lemma 6.1, supply ℓ-cohomological smoothness and smooth base change for the Newton-stratum maps, and the ordinary-stratum dualizing object κ^{-1}[−2d] of Lemma 9.1, compatible with the character κ on the Igusa and local factors in Lemma 7.6. BG3/stratum-dimension alone gives the dimension, not this orientation character. IG owns the resulting Proposition 1.7 application; do not import it wholesale from BG3.

Used by: IG.7.

**`DiamondsAndVStacks:D5`.** For a map of qcqs diamonds, the criterion that bijectivity on (C,C⁺)-points for every complete algebraically closed C and all allowed valuation subrings C⁺ implies an isomorphism (Scholze, Étale cohomology of diamonds, Lemma 11.11). Canonical compactifications and their universal property are imported separately from the explicit DiamondEtaleCohomology C4 nodes.

Used by: IG.3.

**`EndoscopicTransferAndUnitaryTraceComparison:ET.4`.** For the groups 𝒢_n⃗ = (Res_{F₀/ℚ}𝔾_m × Res_{F/ℚ}GL_n⃗) ⋊ {1, θ}: the stabilized twisted trace formula with no proper cuspidal subsets when [F⁺:ℚ] ≥ 2, base-change transfers, the level N₀ at bad places (CSnc §§5.2–5.5).

Used by: IG.5.

**`EndoscopicTransferAndUnitaryTraceComparison:ET.5`.** Shin's stable trace formula for the Igusa varieties of IG.1 (Shin 2010, Theorem 7.2; CSnc Theorem 5.3.2): tr(φ | H_c(Ig^b, ℚ̄_ℓ)) = Σ ι(G, G_n⃗) ST_e^{G_n⃗}(φ^n⃗) for acceptable φ, with no ker¹ factor.

Used by: IG.5.

**`EndoscopicTransferAndUnitaryTraceComparison:ET.6`.** Local Langlands for GL_m and its inner forms with full Weil–Deligne parameters (Badulescu's Jacquet–Langlands), the semisimple Langlands parameters of CSnc Remark 5.1.1, and the nontransfer of generic principal series to nontrivial inner forms of Levi subgroups (CS17 Lemma 5.4.3).

Used by: IG.5.

**`EndoscopicTransferAndUnitaryTraceComparison:ET.7b`.** The rational Igusa trace comparison (CSnc Theorem 5.6.1, Lemma 5.6.2): tr(φ | [H_c(Ig^b, ℚ̄_ℓ)]) as a combination of traces of Red^b_n⃗(π_p^n⃗) and θ-stable cohomological isobaric Π^n⃗, with the corrected Red^b normalization (δ̄^{1/2}_{P(ν_b)} applied once) and Ξ(φ_n⃗)-cohomologicality.

Used by: IG.5.

**`ExcursionOperatorsAndSpectralAction:ES5`.** Mod-ℓ FS parameters of irreducible smooth representations of GL_n inner forms, with central characters and twisted Levi embedding conventions; identify their reduced parameters with the semisimplified characteristic-zero lifts of supercuspidal support (FS IX.5.2). ES5 parameter assignment is not the integral categorical action.

Used by: IG.7.

**`ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison`.** Compatibility of the Fargues–Scholze parameters with the semisimplified local Langlands correspondence for GL_n and its inner forms (and Hansen–Kaletha–Weinstein's consequences for the cohomology of local Shimura varieties), as used by Koshikawa Theorem 1.1.

Used by: IG.7.

**`FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`.** The universal cover X̃ = lim_{×p} X of a p-divisible group over a ring on which p is nilpotent: invariance under isogenies, rigidity under nilpotent thickenings (X̃(R) = X̃(R/I) for I nilpotent; Scholze–Weinstein Proposition 3.1.3), its representability by a formal scheme over perfect bases (CS17 Proposition 4.1.2), and quasi-isogenies of p-divisible groups as isomorphisms of universal covers.

Used by: IG.0, IG.3.

**`FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`.** Scholze–Weinstein Theorem A: on an f-semiperfect ring R (e.g. O_C/p) the Dieudonné module functor on p-divisible groups up to isogeny is fully faithful, with values in φ-modules over B⁺_cris(R); used for the internal Hom of Chai–Oort and for the constancy of the p-divisible group of a flag point modulo p^ε.

Used by: IG.0, IG.3.

**`HodgeTateAndCanonicalSubgroups:T0`.** The Hasse invariant Ha = det(V : ω^{(p)} → ω) of the p-torsion of a p-divisible group (BT₁) over an 𝔽_p-scheme, as a section of ω^{⊗(p−1)}; IG.2 compares it with the Ekedahl–Oort Hasse section of the ordinary stratum.

Used by: IG.2.

**`HodgeTateAndCanonicalSubgroups:T1`.** For an abelian variety A over O_C, the Hodge–Tate filtration of H¹_ét(A_C, ℤ_p) ⊗ C agrees with the Hodge–Tate filtration of the p-divisible group A[p^∞] (CS17 Remark 4.2.8, Scholze 2013 Proposition 4.15), so the global period map restricts to the local one.

Used by: IG.3.

**`HodgeTateAndCanonicalSubgroups:T2`.** Scholze–Weinstein Theorem B: p-divisible groups over O_C are equivalent to pairs (T, W) with T a finite free ℤ_p-module and W ⊂ T ⊗ C(−1) a C-subspace, via G ↦ (T_pG, Lie G ⊗ C); IG.3 adds the O_F-action and polarization (PEL) adapter.

Used by: IG.3.

**`LefschetzPencilsAndVanishingCycles:LPV.6`.** Nearby-cycle left t-exactness for the non-compact lower bound and full t-exactness for the compact finite-level application for the perverse t-structure with torsion coefficients 𝔽_ℓ (Illusie, Autour du théorème de monodromie locale, Cor. 4.5), over the valuation ring O_C of a complete algebraically closed field through finite-type models over complete discretely valued subrings. Require naturality under the specified auxiliary level changes and toroidal boundary comparisons. For the ordinary support sets in Koshikawa Corollary 8.2, prove compatibility of nearby cycles and closed-support cohomology under refinement of these formal models, identifying generic-fibre ordinary support with the derived inverse limit of special-fibre support complexes. This Rlim comparison is distinct from the filtered-colimit continuity theorem for étale cohomology.

Used by: IG.4, IG.7.

**`PadicHodgeTheory:P8`.** Scholze's primitive comparison theorem and its relative form (Scholze 2013, Theorems 1.3, 3.13 and 5.1): for the proper toroidal-to-minimal Stein-factorization maps of rigid spaces over C at finite level the map O⁺ᵃ/p^n → π_*O⁺ᵃ/p^n is an almost isomorphism when ℤ/p^n → π_*ℤ/p^n is (geometrically connected Stein fibres).

Used by: IG.3.

**`SchemeAndStackFoundations:SF.4`.** Formal schemes: locally noetherian and adic formal schemes over Spf W(k) and Spf O_C, completions along closed subschemes, and the identification of the étale site of a formal scheme with that of its special fibre; use AdicSpacesPartII F0/R2 for the analytic comparisons.

Used by: IG.0, IG.3, IG.4.

**`SmoothRepresentationsOfLocalGroups:SR.0`.** Exact smooth invariants of compact pro-p groups for p≠ℓ on Λ-modules with p invertible, with the pro-p hypothesis explicit. The general derived invariants and geometric comparison are separately supplied by SR.0:derived-extension and SF.2.

Used by: IG.1, IG.3, IG.6, IG.7, IG.4, IG.5.

**`SmoothRepresentationsOfLocalGroups:SR.1`.** The opposite anti-involution [KgK] ↦ [Kg^{−1}K] of Hecke algebras of compact-open double cosets over rings, as an involution of the commutative spherical Hecke algebra.

Used by: IG.5.

**`SmoothRepresentationsOfLocalGroups:SR.2`.** Unnormalized smooth parabolic induction Ind^{G}_{P} and inflation from a Levi, with exactness and adjunctions, for locally profinite groups of the form J_b(ℚ_p) × G(𝔸_f^p).

Used by: IG.1, IG.3, IG.6.

**`TorsionCohomologyInfrastructure:TC.3`.** Boundary induction for GL_n and unitary Borel–Serre strata: the Levi/determinant factor extraction showing that an absolutely irreducible residual representation does not occur in the localized boundary cohomology (as in the proof of ACC+ Theorem 2.4.2).

Used by: IG.7.

**`TorsionCohomologyInfrastructure:TC.4`.** Scholze's torsion Galois determinants for GL_r over a CM field F: for a maximal ideal 𝔪₁ of the Hecke algebra acting on H^*(GL_r locally symmetric space, 𝔽_ℓ) there is a continuous semisimple ρ̄_{𝔪₁} with the expected Frobenius polynomials (Scholze 2015 Corollary 5.4.3 / Theorem 5.4.1; ACC+ Theorem 2.3.5).

Used by: IG.6.

**`VectorBundlesAndIsocrystals:VB2`.** Fargues: G-Dieudonné modules over B⁺_cris(O_C/p) are equivalent to G-bundles on the Fargues–Fontaine curve X_{C♭}, determined up to isomorphism by their restriction to W(k)[1/p] (Fargues 2020, Théorèmes 5.1, 5.6), and the classification of p-divisible groups over O_C/p up to isogeny by such bundles (CS17 Theorem 4.1.4).

Used by: IG.3.

**`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.** The global Artin map of the CM field F and its geometric normalization (the composite with inversion, sending uniformizers to geometric Frobenius), used for the twist |Art_F^{−1}|^{1−2n} of the dual Hecke ideal.

Used by: IG.5.

**`FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`.** Give the exact adapter from positive Dieudonné slopes to the CS17 covariant [−1,0] normalization, and the existence of O_B-stable self-dual lattices/compatible principal-polarized, completely slope divisible representatives in the PEL classes used here; separate rational quasi-polarization from integral principal polarization.

Used by: IG.0.

**`FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`.** Quotients of p-divisible groups by sub-p-divisible groups, with quotient maps and exactness, base change and height additivity; this is needed to make the graded pieces in SlopeFiltration actual quotients.

Used by: IG.0.

**`EtaleDualityAndPerverseSheaves:EDC.5`.** For torsion Λ of characteristic ℓ≠p on the finite-type k-targets obtained by reduction of finitely presented O_C/p models, extend the perverse lower-bound costalk criterion H^i(i_x!K)=0 for i<a−dim closure{x} to the uniformly bounded finite-level nearby-cycle complexes and their two-level filtered colimits. Prove integral pushforward preservation with the source dimension function pulled back from the base, uniform costalk bounds and continuity for those systems; do not posit constructibility or a perverse t-structure on every scheme. Also give the stalk upper criterion, its uniform continuity, and two-sided pushforward comparison from finite-type approximants for the compact application (CS17 Proposition 6.1.3; CSnc Remark 2.8.4 and proof Theorem 4.6.1 pp.61–63).

Used by: IG.4, IG.7.

**`SchemeAndStackFoundations:SF.4`.** Formal étale-site invariance for henselian p-adically complete nonnoetherian rings W(R) with R perfect and their completed O_C base changes; compatible special-fibre, generic-fibre and equivariant comparison. AdicSpacesPartII R2 supplies locally topologically finitely presented admissible formal schemes over its allowed, possibly nonnoetherian, valuation bases. The arbitrary perfect Witt lifts here need not lie in that domain, so that node does not by itself supply this extension.

Used by: IG.3, IG.4.

**`SchemeAndStackFoundations:SF.2`.** For actual finite/profinite étale Shimura and Igusa torsor towers, give Hecke-equivariant geometric Cartan–Leray RΓ(X,Λ)≅RΓ_cont(Q,RΓ(X∞,Λ)) and its relative sheaf version, compatible with nearby cycles, uniform geometric costalk lower bounds, localization and finite-level descent. Derived invariants are left t-exact on the bounded-below complexes; no exactness is claimed for an ℓ-power group on ℓ-torsion. Include both p-level and ℓ-level transition maps and algebraized open/finite minimal-level charts. Abstract group or Betti Hochschild–Serre is not this interface. Include compatibility of these level maps and comparison functors with restriction to toroidal boundary charts. For IG.4/finite-level-formal-models the export is only the canonical geometric charts, their genuine formal models and commuting p-level, auxiliary-level and boundary maps. The cohomological comparisons in the preceding sentences are exported to IG.4/semiperversity and the other named cohomological consumers.

Used by: IG.4, IG.5, IG.7.

**`PELModuli:M0`.** Local unramified PEL scalar extension: finite étale ℤ_p-orders with their fraction fields, decomposition of B into matrix algebras over these unramified fields, maximality of the matrix integer orders, and equivalence of a B-linear isotropic weight-(0,1) projector with μ(t)=(1−P)+tP in the similitude group, c∘μ=id (CS17 §4.2 pp.696–697).

Used by: IG.0.

**`ExcursionOperatorsAndSpectralAction:ES3`.** Integral action over ℤ_ℓ[q^{1/2}] on local-shtuka compact cohomology; compatibility with colimits, Hecke functors and coefficient reduction. Give the map Zspec→End(c-Ind_K^GΛ)=H_K^op followed by [KgK]↦[Kg^{-1}K], and identify its evaluation at 𝔪 with ρ̄_𝔪. Include the shifted/half-twisted local-shtuka realization FS IX.3.1 used in Koshikawa §4.

Used by: IG.7.

**`ExcursionOperatorsAndSpectralAction:ES6:functoriality`.** FS parameter compatibility with products and mod-ℓ reduction of integral supercuspidal lifts. Together with ES7:parabolic retain normalized induction or the precise modulus-twisted Levi embedding for unnormalized induction (Koshikawa §§2–3).

Used by: IG.7.

**`SmoothRepresentationsOfLocalGroups:SR.5`.** Mínguez–Sécherre Theorem 3.27/Remark 3.28 as used in Koshikawa Theorem 2.1 and Lemma 3.1: lift irreducible mod-ℓ supercuspidals of GL_m(D), D/F a division algebra, to integral characteristic-zero supercuspidals. Give supercuspidal-support and semisimplified reduction interfaces. No assertion that every irreducible representation lifts as an irreducible is required.

Used by: IG.7.

**`SmoothRepresentationsOfLocalGroups:SR.6`.** Exact finite-generation/integral-localization passage in Koshikawa §4 using FS IX.3.1: after faithful q^{1/2} coefficient extension, mod-ℓ localized local-shtuka vanishing implies integral ℤ_ℓ localized vanishing. Specify the smooth finite-generation and integral Bernstein/spherical module hypotheses for Nakayama; do not substitute finite-dimensional-vector-space finiteness.

Used by: IG.7.

**`ExcursionOperatorsAndSpectralAction:ES4`.** For bounded admissible stratum complexes, identify spectral support from irreducible constituents, prove disjoint central supports annihilate derived Hom (all Ext), and give support under duality with the ES6 Chevalley/contragredient involution. Generic unramified support must remain generic after duality; coefficients are 𝔽_ℓ (Koshikawa §9).

Used by: IG.7.

**`SmoothRepresentationsOfLocalGroups:SR.0:derived-extension`.** For the bounded admissible complex V_b of Koshikawa §9, supply reflexive smooth duality and the opposite-action derived tensor/derived-Hom dictionary over C_c(J_b), retaining κ and the shifts from the dualizing object. Use FS V.6.2 to establish reflexivity of i^b_!V_b and the target i^{b₀}*D(i^b_!V_b) in the actual application. Do not assume that the entire local compact cohomology complex is admissible or self-dual.

Used by: IG.7.

**`ExcursionOperatorsAndSpectralAction:ES6:duality`.** Identify the dual spectral action on bounded admissible stratum sheaves with the Chevalley/contragredient involution, preserving generic unramified support and matching smooth duality/κ twists used by Koshikawa §9.

Used by: IG.7.

**`SmoothRepresentationsOfLocalGroups:SR.0:derived-extension`.** Construct derived continuous invariants for general compact opens and the ℓ-power tame tower, preserve ordinary lower bounds, and compare them with the geometric étale Cartan–Leray complexes supplied by SF.2. For IG.4 require compatibility with nearby cycles and geometric costalks on the specified uniformly bounded systems; group-cohomology or Betti finite-cover statements alone do not supply it. The early SR.0 export is only the abelian-category/invariants carrier.

Used by: IG.1, IG.3, IG.6, IG.7, IG.4, IG.5.

**`VStackSheavesAndLisseCategories:VS4`.** For the existing VS4/strata-are-classifying-stacks coefficient equivalence D_ét(Bun_G^b,𝔽_ℓ)≃D_sm(J_b(ℚ_p),𝔽_ℓ), supply the explicit compatibility with q_K^b pullback and the bounded admissible V_b used in Koshikawa §9. Keep the connected kernel in the geometric stack and use the existing VS4 invariance theorem to remove it at the coefficient-category level. Import the stated smooth-dual reflexivity criterion from SR.0:derived-extension. The equivalence itself is already owned by the exact VS4 node.

Used by: IG.7.

**`DiamondSixOperations:S3`.** For the actual closed ordinary immersion i and complementary open j used here, construct i_* ⊣ Ri! and the support fibre sequence i_*Ri! → id → Rj_*j*. Give the analogous locally closed Newton-stratum localization and the costalk-to-stalk map, in the stated torsion étale categories and under eligibility hypotheses. Do not infer a closed sub-v-sheaf from an arbitrary topological complement. The special-fibre scheme version is supplied by SF.2; the mixed formal-model support comparison is supplied by LPV.6.

Used by: IG.7.

**`DiamondSixOperations:S4`.** For the mixed exchange q_stratum^* Ri! ≅ Ri′! q_K^* already supplied by S4/smooth-upper-shriek-exchange, establish the compatibility with the support fibre sequences and equivariant compact pushforward used in Koshikawa §9. Retain its precise hypotheses: i is an eligible locally closed stratum immersion and q_K is separated, representable in locally spatial diamonds and ℓ-cohomologically smooth; coefficients are ℓ-power torsion. The exchange map itself is imported from the exact existing node.

Used by: IG.7.

**`HeckeStacksAndLocalShtukas:HS2`.** Extend the minuscule rigid local-Shimura realization to every finite F/ℚ_p for the products of GL_n used in Koshikawa Theorem 1.1, with its reflex field, geometric base, hyperspecial levels and commuting actions. A restriction-of-scalars construction must prove the comparison. Record explicitly the μ versus μ^{-1} and B(G,μ) convention dictionary with HS2/minuscule-rigidification, whose current rigid statement is over ℚ_p. The general-F torsor quotient in HS2/levels-and-tower-limit alone does not supply this rigidification.

Used by: IG.7.

**`VStackSheavesAndLisseCategories:VS4`.** For the positive connected automorphism kernel J̃_b^0 and its torsors, export the equivariant dualizing identification Rπ_unip^!𝔽_ℓ ≅ 𝔽_ℓ(d_b)[2d_b] and the trace equivalence Rπ_unip,!Rπ_unip^! ≅ id as APIs of VS4/contractibility-of-connected-banach-colmez-torsors (whose proof already supplies the underlying torsion trace computation) and VS4/strata-are-classifying-stacks. Retain the J_b(ℚ_p)-equivariant smooth orientation character κ and the comparison of that character under the local universal-cover/bundle dictionary (Koshikawa Lemmas 7.4 and 7.6). BG3 supplies the kernel geometry, smoothness and dimension; the coefficient invariance and trace/orientation compatibilities belong to VS4. IG.3 applies them in the Mantovan filtration.

Used by: IG.3.

**`DiamondSixOperations:S2`.** For a torsor under a locally pro-p group J and prime-to-p torsion coefficients with a specified Haar measure, identify compact pushforward along the quotient with derived J-coinvariants over the locally unital convolution algebra C_c(J). Include base change, the projection formula and the opposite-action convention in Koshikawa Lemmas 7.3 and 7.5; use SR.1 for the convolution-module equivalence and SR.0:derived-extension for the derived smooth category. This is a geometric torsor comparison, not exact invariants for an arbitrary compact group.

Used by: IG.3.

**`SmoothRepresentationsOfLocalGroups:SR.1`.** The equivalence between smooth representations and nondegenerate modules over C_c(J_b(ℚ_p),𝔽_ℓ), ℓ≠p, with the specified Haar measure, locally unital derived tensor product, and the inverse-action identification of a left representation with the right module denoted by op in Koshikawa Theorem 7.1. The geometric compact-pushforward comparison is separately supplied by DiamondSixOperations S2.

Used by: IG.3.

**`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.** For a finite extension L/Q_p and finite l-primary continuous G_L-modules with l≠p, finite local cohomology in degrees0,1,2 and local Euler characteristic zero; together with local Tate duality derive dim H1(G_L,M)=dim H0(G_L,M)+dim H2(G_L,M). In particular, for the unramified mod-l character χ_λ with arithmetic Frobenius eigenvalue λ, prove H1(G_L,χ_λ)=0 for λ∉{1,q_L}, compatibly with finite coefficient extension. This is the exact obstruction-vanishing input to CS17 Lemma6.2.2 p.756. D7 derived local duality alone does not supply the Euler formula.

Used by: IG.5.

## References

Locators refer to the editions below. For CS17 the printed Annals page is the PDF page plus 648. For the other preprints, page numbers are the displayed preprint pages. Lan–Stroh's published and author copies have different pagination; each locator identifies the edition. The erratum to the compactification paper governs the componentwise lattice exponents. Source results used only through supplier interfaces retain the supplier's responsibility for their stated generality.

<a id="ref-csnc"></a>

**csnc** — Ana Caraiani, Peter Scholze, [On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2). arXiv:1909.01898v2, 22 November 2023, 90 pages. CSnc denotes this edition, not the differently paginated Annals 199 (2024) typesetting.

<a id="ref-cs17"></a>

**cs17** — Ana Caraiani, Peter Scholze, [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf). Annals of Mathematics 186 (2017), 649–766. CS17 denotes the published edition.

<a id="ref-oz02"></a>

**oz02** — Frans Oort, Thomas Zink, [Families of p-divisible groups with constant Newton polygon](https://emis.muni.cz/journals/DMJDMV/vol-07/09.pdf). Documenta Mathematica 7 (2002), 183–201.

<a id="ref-ham15"></a>

**ham15** — Paul Hamacher, [The geometry of Newton strata in the reduction modulo p of Shimura varieties of PEL type](https://arxiv.org/pdf/1312.0490). arXiv:1312.0490v2, 12 November 2014.

<a id="ref-lil21"></a>

**lil21** — Chao Li, Yifeng Liu, [Chow groups and L-derivatives of automorphic motives for unitary groups](https://www.math.columbia.edu/~chaoli/AIPF.pdf). Author version AIPF.pdf, 67 pages, 16 January 2022; the separately indicated published Lemma 7.3 is in Annals 194 (2021), pp. 859–860.

<a id="ref-man05"></a>

**man05** — Elena Mantovan, [On the cohomology of certain PEL type Shimura varieties](https://www.its.caltech.edu/~mantovan/papers/PEL.pdf). Caltech author preprint, 30 pages; the publication is Duke Mathematical Journal 129 (2005), 573–610.

<a id="ref-lil22"></a>

**lil22** — Chao Li, Yifeng Liu, [Chow groups and L-derivatives of automorphic motives for unitary groups, II.](https://par.nsf.gov/servlets/purl/10338691). Forum of Mathematics, Pi 10 (2022), e5, pp. 1–71.

<a id="ref-shi09"></a>

**shi09** — Sug Woo Shin, [Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf). Berkeley author preprint, 44 pages, 4 October 2008; publication in Duke Mathematical Journal 146 (2009), 509–568.

<a id="ref-ls18a"></a>

**ls18a** — Kai-Wen Lan, Benoît Stroh, [Compactifications of subschemes of integral models of Shimura varieties](https://resolve.cambridge.org/core/services/aop-cambridge-core/content/view/E26A33D14B2E77C4962AE761F6403A1C/S2050509418000208a.pdf/compactifications-of-subschemes-of-integral-models-of-shimura-varieties.pdf). Forum of Mathematics, Sigma 6 (2018), e18, 105 pages. Corresponding author-copy locators are distinguished below.

<a id="ref-box15"></a>

**box15** — George Boxer, [Torsion in the coherent cohomology of Shimura varieties and Galois representations](https://arxiv.org/pdf/1507.05922). arXiv:1507.05922v1, 21 July 2015, doctoral dissertation.

<a id="ref-nie15"></a>

**nie15** — Sian Nie, [Fundamental elements of an affine Weyl group](https://arxiv.org/pdf/1310.2229). arXiv:1310.2229v2, 3 June 2014.

<a id="ref-ls18b"></a>

**ls18b** — Kai-Wen Lan, Benoît Stroh, [Nearby cycles of automorphic étale sheaves](https://web.archive.org/web/2024id_/https://www-users.cse.umn.edu/~kwlan/articles/nearby-aut.pdf). Author compilation incorporating errata, 4 April 2022, 42 pages; publication in Compositio Mathematica 154 (2018), 80–119.

<a id="ref-sw13"></a>

**sw13** — Peter Scholze, Jared Weinstein, [Moduli of p-divisible groups](https://arxiv.org/pdf/1211.6357). arXiv:1211.6357v2, 13 April 2013.

<a id="ref-kos21"></a>

**kos21** — Teruhisa Koshikawa, [On the generic part of the cohomology of local and global Shimura varieties](https://arxiv.org/pdf/2106.10602). arXiv:2106.10602v1, 20 June 2021. The quasi-split global vanishing theorem is Theorem 1.3; Theorem 1.4 is the anisotropic case.

<a id="ref-acc23"></a>

**acc23** — Patrick B. Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James Newton, Peter Scholze, Richard Taylor, Jack A. Thorne, [Potential automorphy over CM fields](https://arxiv.org/pdf/1812.09999). arXiv:1812.09999v2, 16 June 2022. ACC+ denotes this edition.

<a id="ref-ltxzz"></a>

**ltxzz** — Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu, [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568). Inventiones Mathematicae 228 (2022), 107–375.

<a id="ref-cn23"></a>

**cn23** — Ana Caraiani, James Newton, [On the modularity of elliptic curves over imaginary quadratic fields](https://arxiv.org/pdf/2301.10509v3). arXiv:2301.10509v3, 27 March 2025.

<a id="ref-ls18a-author"></a>

**ls18a-author** — Kai-Wen Lan, Benoît Stroh, [Compactifications of subschemes of integral models of Shimura varieties (current author copy)](https://www.kwlan.org/articles/cpt-sub.pdf). 84-page author copy, with the separately linked one-page erratum.

<a id="ref-ls18a-erratum"></a>

**ls18a-erratum** — Kai-Wen Lan, Benoît Stroh, [Errata for Compactifications of subschemes of integral models of Shimura varieties](https://www.kwlan.org/articles/cpt-sub-err.pdf). One-page author erratum; correction to §3.6.

<a id="ref-man08"></a>

**man08** — Elena Mantovan, [A compactification of Igusa varieties](https://www.its.caltech.edu/~mantovan/papers/Igusa.pdf). Caltech author copy, 24 pages; publication in Mathematische Annalen 340 (2008).
