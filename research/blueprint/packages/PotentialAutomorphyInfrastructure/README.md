# Reusable infrastructure for potential automorphy over CM fields

This roadmap builds the arithmetic comparisons that let torsion cohomology produce automorphy lifting theorems for GLₙ over CM fields, and the transport lemmas that let potential automorphy arguments reuse them. Its central objects are integral coefficient systems, localized boundary cohomology, ordinary completed cohomology, arithmetic deformation–Hecke maps and paired patched complexes. Its two main lifting results are the Fontaine–Laffaille and ordinary theorems of Allen–Calegari–Caraiani–Gee–Helm–Le Hung–Newton–Scholze–Taylor–Thorne. Neither result assumes a polarization of the rank-n representation. The last layer provides soluble base change and descent, residual-image preservation, and rank-two compatible-system tools used by symmetric-power arguments.

The constructions retain coefficient rings, level transitions, twists, labelled weights, ordered characters and degree shifts. A patching application must exhibit data satisfying the algebraic hypotheses. Support describes primes at which a module is nonzero. It does not identify the integral deformation and Hecke rings. In every lifting and restriction statement, check the rank-one character branch separately, retain the stated higher-rank p-bound, and impose neither a polarization nor an integral R=T assertion.

The suggested file proposes declaration names, local algebraic and combinatorial cores, API lemmas and examples. Its arithmetic contracts require the carriers exported by neighbouring roadmaps. Their mathematical statements are given here even when those carriers are not yet available for Lean signatures. The local prototypes alone do not construct arithmetic spaces, compatible systems or automorphic representations.

## Scope and neighbouring roadmaps

The reusable spaces, Borel–Serre compactification, sheaf cohomology, derived Hecke actions, finite-level duality and Matsushima comparison belong to **ArithmeticLocallySymmetricSpaces**. Smooth induction, coefficient-p monoid categories and general double-coset algebras belong to **SmoothRepresentationsOfLocalGroups**. The unitary torsion concentration theorem belongs to **IgusaVarietiesAndTorsionConcentration:IG.7**. This roadmap applies those theories to the explicit Siegel coefficients and ordinary towers; it does not reconstruct them.

Integral Fontaine–Laffaille categories belong to **FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3**, rational crystalline comparisons to **PadicHodgeTheory:R06.4**, and the general Galois attachment and local–global comparisons to **AutomorphicGaloisRepresentationsPartII**. Determinants, determinant kernels and reconstruction belong to **IntegralHeckeAndGaloisDeterminants**. Local and global deformation rings belong to **LocalGaloisDeformationRings** and **GlobalGaloisDeformations**. Perfect-complex reconstruction, ultrapatching and abstract support belong to **DeformationAndDerivedPatchingAlgebra:P7–P9**. PA.3 and PA.4 verify the arithmetic inputs to those results.

Compatible-system carriers, operations and rank-one classifications belong to **PotentialModularityAndCompatibleSystems:R24.5**. Finite-image enormousness and scalar calculations belong to **ArithmeticGaloisRepresentations:G7**. Cyclic automorphic base change belongs to **EndoscopicTransferAndUnitaryTraceComparison:ET.7a**; PA.5 owns its soluble iteration and Galois-side descent. Upstream ReductiveGroups supplies root systems, parabolics, Weyl groups and split integral group schemes. Integral highest-weight modules require **ReductiveGroupsIntegralRepresentationsPartII**, whose layer identifiers remain to be assigned. The arithmetic classification of forms of products of PGL₂ requires an arithmetic reductive-groups interface; **ReductiveGroupsArithmeticPartII** is its natural home. These two requirements are not attributed to an unrelated existing layer.

Applications to Dwork families, construction of potential automorphy witnesses, abelian surfaces and their separate real-multiplication large-image arguments remain with their own roadmaps. This roadmap supplies the lifting and transport interfaces they use.

## Conventions

Write F⁺ for the maximal totally real subfield of an imaginary CM field F, c for complex conjugation, and f=[F⁺:Q]. Frobenius and Artin reciprocity are geometric, and HT(ε)={−1}. Dominant GLₙ rows are descending. For an algebraic weight λ the labelled Hodge–Tate multiset is {λτ,i+n−i : 1≤i≤n}. The rank-n ordinary diagonal character indexed by i uses λτ,n−i+1, so its order is part of the convention.

O is the ring of integers of a finite p-adic field E containing the required embeddings, varpi (also written ϖ) is its coefficient uniformizer, and k its residue field. A local field uniformizer ϖv is a separate choice. Write Sₚ for places of F above p and S̄ₚ for places of F⁺ above p. Chosen lifts above p identify the split rank-2n unitary factors with GL₂ₙ; choose ϖ_{vᶜ}=c(ϖ_v) compatibly with conjugation. The unitary group is G̃, its Siegel parabolic is P=GU, and G is the GLₙ Levi viewed over F⁺. At other parabolics the unipotent radical is written N. All derived categories and tensor products retain the coefficient ring in their subscript.

Put d=n²f, so dim Xₖ=d−1. For rational GLₙ cohomology put qGL=n(n−1)f/2 and ℓ₀=nf−1. Its range is [qGL,qGL+ℓ₀]. The dual arithmetic complex is RHom(RΓ,O)[−d]. After extending scalars to E, its i-th cohomology is Hom_E(Hᵈ⁻ⁱ(RΓ⊗_O E),E); over O retain derived Hom, including its Ext contributions. Consequently its rational range is [qpatch,qpatch+ℓ₀], where qpatch=qGL+1 and 2qGL+ℓ₀=d−1. The q₀ in the abstract patching hypotheses below means qpatch. It is unrelated to the number q of Taylor–Wiles places or to a residue cardinality qv.

Good non-neat levels use arithmetic groupoids. A finite free cellular complex is used only after trivial stabilizers, or the specified invertibility and free diamond-action conditions, have been proved. Hecke images are images in endomorphisms of the stated derived object; changing that object, the coefficient ring or the localization requires a comparison theorem. Superscripts “ord” refer to the ordinary action with its stated normalization. Character twists include both their unit values and their values at the chosen local uniformizers.

The source references used here are ACC (the ten-author CM-field paper), Qian, BLGGT, BCGNT (Bianchi modular forms), BCGP (potential modularity of abelian surfaces), Chenevier and KT (Khare–Thorne). Precise editions and public links are at the end. A source result with a repaired normalization or a restricted conclusion is stated in that form throughout; none of the arguments require the stronger discarded formulation.

## Construction order

| Layer | Output | Main inputs |
| --- | --- | --- |
| PA.0 | Integral coefficients, Siegel retracts and boundary Satake descent | ALS.1/ALS.4, SR.1, integral highest-weight modules |
| PA.1 | Fontaine–Laffaille local–global compatibility | PA.0, IG.7, R07.3, AG2.0/AG2.2/AG2.3/AG2.6, IHG.0/IHG.1 |
| PA.2 | Ordinary towers, boundary degree shifts and local–global compatibility | PA.0/PA.1, SR.0/SR.1/SR.2, PadicFamilies:L0a, ALS.4/ALS.5, IHG.0/IHG.1 |
| PA.3 | Arithmetic deformation–Hecke actions and component/support hypotheses | PA.1/PA.2, L7/L8/R08.2, G7/G8, P7/P9 |
| PA.4 | Arithmetic patched pairs and lifting theorems | PA.3, ALS.1/ALS.5, P7/P8/P9, independent PA.5 field transport |
| PA.5 | Soluble transport, rank-two systems and symmetric-power avoidance | ET.7a, AG2.2/AG2.5, R24.5, ArithmeticGaloisRepresentations:G7, reductive-group structure |

The numbering groups mathematical interfaces. Within PA.2 the general automorphic-flag corollary also uses the soluble transport lemmas of PA.5. Within PA.4 the reduction to the original field uses the independent first part of PA.5. Implement that transport prefix before those two consumers. The PA.3 support contract assumes a patched pair; it supplies the criterion, and PA.4 subsequently verifies its hypotheses for the constructed pair. Neither the field-transport prefix nor the abstract support criterion uses the lifting theorem it helps prove.

## Existing library foundations

Use Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. The following existing declarations are foundations, with the indicated scope:

| Declaration | Module | Scope of use |
| --- | --- | --- |
| `CategoryTheory.Retract`, `CategoryTheory.Retract.map` | `Mathlib.CategoryTheory.Retract` | Split maps and their functorial transport; equivariance is additional data in PA.0. |
| `DerivedCategory`, `DerivedCategory.Q` | `Mathlib.Algebra.Homology.DerivedCategory.Basic` | Localization of cochain complexes of an abelian category at quasi-isomorphisms. |
| `Module.support` | `Mathlib.RingTheory.Support` | Primes with nonzero localization; the support target is not a ring isomorphism. |
| `Matrix.charpoly` | `Mathlib.LinearAlgebra.Matrix.Charpoly.Basic` | det(XI−M) over a commutative coefficient ring. |
| `Subgroup.goursat_surjective` | `Mathlib.GroupTheory.Goursat` | A subdirect subgroup gives an isomorphism of quotient groups; arithmetic composita require PA.5's field step. |
| `Equiv.Perm.permGroup` | `Mathlib.Algebra.Group.End` | Permutation multiplication by composition, with the inverse convention used by left Levi shuffles. |
| `finAddFlip` | `Mathlib.Logic.Equiv.Fin.Basic` | Exchange of the two finite blocks. |
| `Matrix.ProjectiveSpecialLinearGroup.rank_two_simple` | `Mathlib.LinearAlgebra.Projectivization.PSL.PSL2` | Simplicity of PSL₂ over a finite field with at least four elements. |

The arithmetic and analytic extensions are specified by the owning layer in each target's prerequisites and in the supplier interfaces below. A reference of the form `Roadmap:Layer/declaration` asks for that precise declaration of the layer; `tauceti:TauCetiRoadmap/...#layer-...` identifies an upstream layer. Internal prerequisites name their PA layer; subsection introductions specify the construction route.

## Good-level arithmetic hypotheses

The two good-level profiles below are abbreviations only. Targets outside these profiles list their own hypotheses. In particular the global lifting theorems in PA.4 have fewer field and level restrictions, achieved using PA.5.

### Fontaine–Laffaille good level

Let F be imaginary CM. Choose data and impose the following conditions:

(1) n≥2, and p is a prime with p>n².

(2) S is a finite set of finite places of F with Sₚ⊆S.

(3) R⊆S consists of places away from p; R may be empty.

(4) π is cuspidal on GLₙ(𝔸F), regular algebraic with weight λ.

(5) Fix ι:Q̄ₚ≅C.

(6) Each rational prime ramified in F or lying below S splits in an imaginary quadratic subfield of F. Hence the places of S split over F⁺, and F/F⁺ is everywhere unramified.

(7) The prime p is unramified in F.

(8) At every embedding τ:F↪C, λτ,1+λτc,1−λτ,n−λτc,n<p−2n.

(9) For each v∈Sₚ let v̄=v|F⁺. There is a different v̄′|p such that Σv̄″≠v̄,v̄′[F⁺v̄″:Qₚ]>f/2.

(10) The residual representation r̄ι(π) is absolutely irreducible.

(11) Every πv with v|p is unramified.

(12) For v∈R the Iwahori-fixed subspace πvᴵʷᵛ is nonzero.

(13) At v∈S−(R∪Sₚ), πv is unramified, v∉Rᶜ, and H²(Fv,ad r̄ι(π))=0.

(14) The set S−(R∪Sₚ) includes two places whose residue characteristics differ.

(15) At all finite v outside S, πv is unramified.

(16) At v∈R one has qv≡1 mod p and r̄ι(π)|GFv trivial.

(17) The representation r̄ι(π) is decomposed generic (ACC Definition 4.3.1) and its restriction to GF(ζp) has enormous image (Definition 6.2.29).

Define K=∏v Kv: use GLₙ(OFv) outside S and at v|p, Iwv at v∈R, and the pro-v Iwahori Iwv,1 at v∈S−(R∪Sₚ). These are the hypotheses of ACC §6.5.1, pp. 1062–1063.

### Ordinary good level

Let F be imaginary CM. The data and assumptions are:

(1) n≥2, and p is prime with p>n.

(2) S is a finite set of finite places containing Sₚ.

(3) R⊆S contains only places away from p and may be empty.

(4) π is a regular algebraic cuspidal representation of GLₙ(𝔸F), with weight μ.

(5) Fix ι:Q̄ₚ≅C.

(6) Every rational prime below S or ramified in F splits in an imaginary quadratic subfield of F.

(7) The representation r̄ι(π) is absolutely irreducible.

(8) For each v|p, πv has a nonzero Iwv(1,1)-fixed vector and is ι-ordinary at v.

(9) For v∈R, πv has a nonzero Iwahori-fixed vector.

(10) At v∈S−(R∪Sₚ), πv is unramified, v∉Rᶜ, and H²(Fv,ad r̄ι(π))=0.

(11) There are two places in S−(R∪Sₚ) of different residue characteristics.

(12) All finite πv with v∉S are unramified.

(13) For v∈R, qv≡1 mod p and r̄ι(π)|GFv is trivial.

(14) The representation r̄ι(π) is decomposed generic, and its image on GF(ζp) is enormous.

(15) For each v|p, [Fv:Qₚ]>n(n+1)/2+1 and r̄ι(π)|GFv is trivial.

Set K=∏v Kv with GLₙ(OFv) outside S, Iwv(1,1) at v|p, Iwv at R and pro-v Iwahori Iwv,1 at the other places of S. Lemma 6.5.2 gives neatness, hence goodness, using the two auxiliary residue characteristics. This is ACC §6.6.1, pp. 1074–1075.

### Prerequisite key

The compact owner prefixes below expand the prerequisite identifiers used in the layers. For example `AG:AG2.7` means `AutomorphicGaloisRepresentationsPartII:AG2.7`; declaration-level exports are specified in the supplier interfaces.

| Prefix | Roadmap |
| --- | --- |
| `ALS` | `ArithmeticLocallySymmetricSpaces` |
| `SR` | `SmoothRepresentationsOfLocalGroups` |
| `IG` | `IgusaVarietiesAndTorsionConcentration` |
| `FF` | `FiniteFlatGroupsAndIntegralPadicHodgeTheory` |
| `PH` | `PadicHodgeTheory` |
| `AG` | `AutomorphicGaloisRepresentationsPartII` |
| `IHG` | `IntegralHeckeAndGaloisDeterminants` |
| `LGD` | `LocalGaloisDeformationRings` |
| `GGD` | `GlobalGaloisDeformations` |
| `DP` | `DeformationAndDerivedPatchingAlgebra` |
| `CS` | `PotentialModularityAndCompatibleSystems` |
| `AGR` | `ArithmeticGaloisRepresentations` |
| `PF` | `PadicFamilies` |
| `PAL` | `PotentialAutomorphyInfrastructurePartII` |
| `ET` | `EndoscopicTransferAndUnitaryTraceComparison` |
| `AL` | `AutomorphicLFunctionsAndLocalFactors` |
| `RG` | `ReductiveGroupsPartII` |

The upstream short names expand as follows:

- Tau Ceti ReductiveGroups L7: `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.
- Tau Ceti ReductiveGroups L9: `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`.
- Tau Ceti Chebotarev L10: `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.
- Tau Ceti ClassFieldTheory L5: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

Suggested theorem names without a namespace prefix lie in `TauCeti.PotentialAutomorphy`; the definition and API namespaces are printed explicitly. Internal prerequisites refer to the stated layer and its construction route. Within each thematic subsection the statements specify the particular levels, coefficients, functors or previous theorem being used. The construction order above explains the independent transport prefix and conditional support interface.

## PA.0 — Integral coefficients and boundary comparison

### Integral models and equivariant splittings

Begin with the actual arithmetic coefficient systems. The groupoid model handles good levels; the finite free model requires the separate stabilizer and diamond-action hypotheses. An equivariant retract then transports a Hecke action through a genuine split inclusion.

<a id="integral-model-comparison"></a>

**Integral cohomology comparison** (`integral_model_comparison`). For F CM, the GL\_n space and the split-at-p unitary space with their arithmetic coefficient local systems, the groupoid derived-invariants, sheaf-cohomology and sufficiently-neat finite cellular models represent the same RΓ object. On a finite projective O coefficient lattice V, their derived reductions to O/varpi^m, pullback/trace at finite normal levels and Hecke away from S commute with these identifications. For a normal good neat level with finite quotient Δ and free cell action the cellular complex is finite free over O[Δ]. Before freeness is proved retain the groupoid model; no finite free assertion is made with nontrivial p-stabilizers.

Prerequisites: `ALS:ALS.1`; `ALS:ALS.3`; `mathlib:DerivedCategory.Q`. Source: [ACC](#source-acc), §2.1.2, pp. 910–911 (groupoid/sheaf cohomology and Hecke actions); §2.2; §6.5.1, pp. 1064–1069 (finite normal levels and perfect cellular models).

<a id="equivariant-retract"></a>

**Equivariant direct summands** (`EquivariantRetract`). For a category C, objects A,B and an indexed family of endomorphisms f\_A(r), f\_B(r), an EquivariantRetract is a Mathlib Retract A B with f\_A(r) followed by i = i followed by f\_B(r), and f\_B(r) followed by the retraction = the retraction followed by f\_A(r), for every r. For C=D(S) and S-algebra actions of R this is the source’s R-equivariant direct summand: the complementary idempotent splits in D(S). The general categorical carrier records no additional ring laws; actual arithmetic applications pass S-algebra homomorphisms.

Prerequisites: `mathlib:CategoryTheory.Retract`; `mathlib:CategoryTheory.Retract.map`; `DP:P7`. Source: [ACC](#source-acc), §4.2, after Theorem 4.2.1, p. 969.

API:

- `EquivariantRetract.toRetract`: Forgetting the commuting equations gives CategoryTheory.Retract A B.
- `EquivariantRetract.inclusion_comm`: For every r, f\_A(r) followed by i equals i followed by f\_B(r).
- `EquivariantRetract.retraction_comm`: For every r, f\_B(r) followed by the retraction equals the retraction followed by f\_A(r).
- `EquivariantRetract.map`: A functor carries the retract to the image retract, with the image endomorphisms; it preserves both commuting equations.
- `EquivariantRetract.idempotent`: The endomorphism of B given by retraction followed by inclusion is an idempotent commuting with every action operator.
- `EquivariantRetract.refl`: Identity inclusion and retraction give an equivariant retract for any indexed action on A; forgetting it gives Retract.refl A.
- `EquivariantRetract.ext`: Two equivariant retracts for the same objects and indexed actions are equal if their inclusion and retraction maps are equal.

Examples and tests:

- `EquivariantRetract.identity` (degenerate): Identity maps on A give an equivariant retract of A into itself.
- `EquivariantRetract.forget_identity` (compatibility): The forgotten retract of the identity construction is Mathlib Retract.refl.
- `EquivariantRetract.incompatible_actions` (non-example): Identity inclusion/retraction cannot form an equivariant retract between Z with multiplication-by-1 and multiplication-by-2 as the same indexed operator.

<a id="unitary-levi-weight-dictionary"></a>

**Unitary weight dictionary** (`UnitaryLeviWeight`). For descending Levi rows λ\_τ and λ\_{τc} of length n and a chosen lift τ above an embedding of F⁺, define the unitary row by concatenating −reverse(λ\_{τc}) with λ\_τ. It is descending exactly when −λ\_{τc,1}≥λ\_{τ,1}. This is the character-lattice identification (2.2.2); it does not assert that the integral dual-Weyl lattice is the dual of the integral lattice of the dual weight.

Prerequisites: Mathlib integer arithmetic and finite collections. Source: [ACC](#source-acc), §2.2.1 equation (2.2.2), pp. 918–919.

API:

- `UnitaryLeviWeight.first_block`: The i-th entry of the first block is −λ\_{τc,n−1−i} for 0≤i<n with zero-based indexing.
- `UnitaryLeviWeight.second_block`: The i-th entry of the second block is λ\_{τ,i}.
- `UnitaryLeviWeight.dominant_iff`: For descending input rows, dominance is equivalent to −λ\_{τc,1}≥λ\_{τ,1}.
- `UnitaryLeviWeight.inverse`: Recover λ\_τ from the second block and λ\_{τc} by negating and reversing the first block.

Examples and tests:

- `UnitaryLeviWeight.rank_one` (computation): For λ\_τ=(2), λ\_{τc}=(−3), the unitary row is (3,2).
- `UnitaryLeviWeight.zero` (degenerate): Zero Levi rows give the zero unitary row.
- `UnitaryLeviWeight.rank_two` (computation): For λ\_τ=(2,1), λ\_{τc}=(−3,−4), the unitary row is (4,3,2,1).

### The Siegel boundary and Satake descent

The boundary triangle and non-Eisenstein Siegel localization identify the stratum on which the Levi coefficients occur. Restriction to the trivial unipotent subgroup supplies the retraction; this is compatible with the Satake action before taking cohomology.

<a id="boundary-level-coefficient-comparison"></a>

**Boundary level coefficient comparison** (`boundary_level_coefficient_comparison`). For the same finite-projective coefficient lattice and good compact levels, the compact-support → interior → Borel–Serre-boundary triangle commutes with derived reduction O→O/varpi^m and finite-level pullback/trace. Localizing at the paired GL\_n/unitary non-Eisenstein ideals isolates the Siegel stratum, with the Satake action on each triangle map. Maps are constructed using the arithmetic correspondences and stratum comparison, not assumed merely because a retract exists.

Prerequisites: `PA.0` (constructions in this layer); `ALS:ALS.4`; `ALS:ALS.3`. Source: [ACC](#source-acc), §2.4.1, Theorems 2.4.2 and 2.4.4, pp. 942–946.

<a id="siegel-coefficient-retract"></a>

**Siegel coefficient splitting** (`siegel_coefficient_retract`). With K̃ decomposed (so K̃\_P = K̃\_U ⋊ K) and λ, λ̃ as in Theorem 2.4.4, for each m ≥ 1: (i) arguing as in [NT16 p. 58], RΓ(X^P\_{K̃\_P}, 𝒱\_λ̃/ϖ^m) ≅ RΓ(K̃^S\_P × K\_S, RΓ(Inf^{P^S×K\_S}\_{G^S×K\_S} 𝔛\_G, R1\_\*^{K̃\_{U,S}} 𝒱\_λ̃/ϖ^m)), where R1\_\*^{K̃\_{U,S}} sends P^S × K̃\_{P,S}-equivariant complexes of sheaves on 𝔛\_G to P^S × K\_S-equivariant ones; (ii) the K̃\_P-equivariant embedding 𝒱\_λ → 𝒱\_λ̃^{K̃\_{U,S}} ⊂ 𝒱\_λ̃, which splits K-equivariantly [NT16 Cor. 2.11], makes 𝒱\_λ/ϖ^m a direct summand of R1\_\*^{K̃\_{U,S}}(𝒱\_λ̃/ϖ^m): the inclusion is 𝒱\_λ/ϖ^m → (𝒱\_λ̃/ϖ^m)^{K̃\_{U,S}} → R1\_\*^{K̃\_{U,S}}𝒱\_λ̃/ϖ^m and the retraction is R1\_\*^{K̃\_{U,S}}𝒱\_λ̃/ϖ^m → 𝒱\_λ̃/ϖ^m (restriction to the trivial subgroup) followed by the splitting 𝒱\_λ̃ → 𝒱\_λ mod ϖ^m; (iii) hence r\_G^\* RΓ(X\_K, 𝒱\_λ/ϖ^m) is a direct summand of RΓ(X^P\_{K̃\_P}, 𝒱\_λ̃/ϖ^m) in D(H(P^S × K̃\_{P,S}, K̃\_P) ⊗\_Z O/ϖ^m), and 𝒮 = r\_G ∘ r\_P descends to (2.4.7) T̃^S(RΓ(X^P\_{K̃\_P}, 𝒱\_λ̃/ϖ^m)) → T̃^S(RΓ(X\_K, 𝒱\_λ/ϖ^m)).

Prerequisites: `PA.0` (constructions in this layer); `ALS:ALS.4`; `Tau Ceti ReductiveGroups L9`. Source: [ACC](#source-acc), §2.4.1, proof of Theorem 2.4.4, (2.4.7), pp. 945–946.

<a id="coefficient-satake-descent"></a>

**Coefficient Satake descent** (`coefficient_satake_descent`). Let K̃ be as in §2.4.1 (good, decomposed with respect to P = GU; K = K̃ ∩ G(A^∞\_{F⁺})), let λ ∈ (Z^n\_+)^{Hom(F,E)} be dominant with image λ̃ ∈ (Z^{2n})^{Hom(F⁺,E)} (under (2.2.2)) G̃-dominant, let 𝔪 ⊂ T^S(K, λ) be non-Eisenstein and 𝔪̃ = 𝒮\*(𝔪) ⊂ T̃^S. Then 𝒮 : T̃^S → T^S descends to a homomorphism T̃^S(RΓ(∂X̃\_K̃, 𝒱\_λ̃)\_𝔪̃) → T^S(RΓ(X\_K, 𝒱\_λ)\_𝔪).

Prerequisites: `PA.0` (constructions in this layer); `SR:SR.1`. Source: [ACC](#source-acc), §2.4.1, Theorem 2.4.4 with (2.4.5)–(2.4.7), pp. 945–946.

<a id="ramified-satake-descent"></a>

**Ramified Satake descent** (`ramified_satake_descent`). Let K̃ be as in §2.4.1, let 𝔪 ⊂ T^S(K, 0) be a non-Eisenstein maximal ideal and 𝔪̃ = 𝒮\*(𝔪) ⊂ T̃^S. Suppose R ⊂ S satisfies: each v ∈ R is prime to p and split over F⁺; for each v ∈ R − R^c above v̄, K̃\_v̄ = q̃\_v with p̃\_{v,1} ⊂ q̃\_v ⊂ p̃\_v; for each v ∈ R ∩ R^c above v̄, K̃\_v̄ = Ĩ\_v̄ with Iw̃\_{v̄,1} ⊂ Ĩ\_v̄ ⊂ Iw̃\_v̄. Let T = S − (R^c − R); let T̃^T\_R ⊂ H(G̃(A^∞\_{F⁺}), K̃) ⊗\_Z O be the (commutative) O-subalgebra generated by T̃^S, all t\_{v,i}(σ) (v ∈ R, σ ∈ W\_{F\_v}) and all e\_{v,i}(σ) (v ∈ R^c − R, σ ∈ W\_{F\_v}), and T^T\_R ⊂ H(GL\_n(A\_F^∞), K) ⊗\_Z O the (commutative) O-subalgebra generated by T^T and all t\_{v,i}(σ) (v ∈ R, σ ∈ W\_{F\_v}). Then there is a map 𝒮 : T̃^T\_R → T^T\_R, which descends to an O-algebra homomorphism T̃^T\_R(RΓ(∂X̃\_K̃, O)\_𝔪̃) → T^T\_R(RΓ(X\_K, O)\_𝔪).

Prerequisites: `PA.0` (constructions in this layer); `SR:SR.1`. Source: [ACC](#source-acc), §2.4.1, Theorem 2.4.8, pp. 946–948.

### Unipotent cohomology with trivial coefficients

The exterior-algebra computation supplies the degree and orientation convention used by both weight routes. Keep the integral coefficient ring and the Levi action in the comparison.

<a id="unipotent-exterior-cohomology"></a>

**Unipotent exterior cohomology** (`unipotent_exterior_cohomology`). Let v̄ ∈ S̄\_p, K = F^+\_v̄ (a local field here), m ≥ 1. For each i ≥ 0 there is a G(O\_K)-equivariant isomorphism H^i(U(O\_K), O/ϖ^m) ≅ Hom\_{Z\_p}(∧^i\_{Z\_p} U(O\_K), O/ϖ^m) = Hom\_O(∧^i\_O(U(O\_K) ⊗\_{Z\_p} O), O/ϖ^m), with G(O\_K) acting on the right through its conjugation action on U(O\_K) ≅ Z\_p^{n²[K:Q\_p]} (continuous group cohomology; the map is the cup-product extension of H^1 = Hom).

Prerequisites: `PA.0` (constructions in this layer). Source: [ACC](#source-acc), §4.2, Lemma 4.2.2(1), p. 970.

## PA.1 — Fontaine–Laffaille compatibility

### Siegel shuffles and integral Kostant theory

Use minimal representatives for left Levi cosets. The inverse-increasing condition fixes the convention needed for the dot action. Integral Kostant decomposition and formality turn the coefficient splitting into a direct summand in each indicated degree.

<a id="kostant-shuffles"></a>

**Kostant representatives** (`KostantShuffle`). For the Siegel Levi GL\_n×GL\_n in GL\_{2n}, define KostantShuffle(n) as permutations w of {0,…,2n−1} whose inverse is increasing on each block {0,…,n−1} and {n,…,2n−1}. These are the minimal representatives for (S\_n×S\_n)\\S\_{2n}; length is the number of inversions of w. For Res\_{F⁺/Q} use one shuffle per embedding and sum lengths. General Weyl groups, roots, dominant weights and highest-weight modules are imported, not defined here.

Prerequisites: `Tau Ceti ReductiveGroups L7`; `mathlib:Equiv.Perm.permGroup`; `mathlib:finAddFlip`. Source: [ACC](#source-acc), §1.2 Notation, pp. 905–906.

API:

- `KostantShuffle.val`: The underlying permutation lies in S\_{2n}.
- `KostantShuffle.mem_iff`: Membership is precisely strict increase of the inverse on each of the two Levi blocks.
- `KostantShuffle.length`: Length is the cardinality of {(i,j):i<j and w(j)<w(i)}.
- `KostantShuffle.minimal_representative`: The shuffle is the unique minimum-length representative of its left Levi coset.

Examples and tests:

- `KostantShuffle.rank_one` (computation): For n=1 the two shuffles have lengths 0 and 1.
- `KostantShuffle.rank_zero` (degenerate): For n=0 the unique shuffle has length 0.
- `KostantShuffle.block_swap` (computation): The permutation exchanging the two blocks, preserving order inside each block, is a shuffle of length n².
- `KostantShuffle.internal_swap` (non-example): For n=2 the transposition (0 1) is not a shuffle.

<a id="integral-kostant-decomposition"></a>

**Integral Kostant decomposition** (`integral_kostant_decomposition`). Let v̄ ∈ S̄\_p, K = F^+\_v̄ and assume p ≥ 2n − 1. For w ∈ W^P\_v̄ put λ\_w = w(ρ\_v̄) − ρ\_v̄ ∈ (Z^n\_+)^{Hom\_{Q\_p}(F⊗\_{F^+}F^+\_v̄, E)} (via (2.2.2)). For each i ≥ 0 there is a G(O\_K)-equivariant isomorphism Hom\_O(∧^i\_O(U(O\_K) ⊗\_{Z\_p} O), O) ≅ ⊕\_{w ∈ W^P\_v̄, l(w) = i} V\_{λ\_w} (V\_{λ\_w} the integral dual Weyl module lattice).

Prerequisites: `PA.1` (constructions in this layer); `PA.0`; `Tau Ceti ReductiveGroups L7`; `Tau Ceti ReductiveGroups L9`. Source: [ACC](#source-acc), §4.2, Lemma 4.2.2(2), pp. 970–971.

<a id="unipotent-derived-formality"></a>

**Unipotent derived formality** (`unipotent_derived_formality`). Let v̄ ∈ S̄\_p, K = F^+\_v̄, m ≥ 1 and p > n². There is a natural isomorphism, inducing the identity on cohomology, R Γ(U(O\_K), O/ϖ^m) ≅ ⊕\_{i=0}^{n²[K:Q\_p]} H^i(U(O\_K), O/ϖ^m)[−i] in D(O/ϖ^m[G(O\_K)]).

Prerequisites: `PA.0`. Source: [ACC](#source-acc), §4.2, Lemma 4.2.3, pp. 971–972.

<a id="boundary-degree-retract"></a>

**Boundary degree shifting** (`boundary_degree_retract`). Notation (§4.2): for τ: F^+ ↪ E, W\_τ = W(G̃⊗\_{F^+,τ}E, T⊗\_{F^+,τ}E) ≅ W(GL\_{2n}), W\_{P,τ} = W(G⊗E, T⊗E) ≅ W(GL\_n×GL\_n), W^P\_τ ⊂ W\_τ the representatives of W\_{P,τ}\\W\_τ of §1.2, ρ\_τ the half-sum of B⊗E-positive roots; W\_v̄, W\_{P,v̄}, W^P\_v̄ the products over τ ∈ I\_v̄ (embeddings inducing v̄), ρ\_v̄ = Σ\_{τ ∈ Hom(F^+\_v̄,E)} ρ\_τ; W\_T̄, W^P\_T̄ for T̄ ⊂ S̄\_p, W = W\_{S̄\_p} with length l and ρ = Σ\_v̄ ρ\_v̄; λ̃\_v̄ = (λ̃\_τ)\_{τ ∈ Hom(F^+\_v̄,E)} and λ\_v̄ = (λ\_τ)\_{τ inducing ṽ or ṽ^c}. Statement: let K̃ ⊂ G̃(A^∞\_{F^+}) be a good subgroup decomposed with respect to P with K̃\_{U,v̄} = U(O\_{F^+\_v̄}) for every v̄ ∈ S̄\_p, and K = K̃ ∩ G(A^∞\_{F^+}); let m ⊂ T^S be non-Eisenstein and m̃ = S^\*(m) ⊂ T̃^S. Let S̄\_p = S̄\_1 ⊔ S̄\_2 and let λ̃ ∈ (Z^{2n}\_+)^{Hom(F^+,E)}, λ ∈ (Z^n\_+)^{Hom(F,E)} be dominant with (1) λ̃\_v̄ = λ\_v̄ (via (2.2.2)) for v̄ ∈ S̄\_1; (2) λ̃\_v̄ = 0 for v̄ ∈ S̄\_2; (3) for each v̄ ∈ S̄\_2 some w\_v̄ ∈ W^P\_v̄ with λ\_v̄ = w\_v̄(ρ\_v̄) − ρ\_v̄; (4) p > n² (p unramified in F throughout §4). Put w\_v̄ = 1 for v̄ ∈ S̄\_1 and w = (w\_v̄). Then for every m ≥ 1, R Γ(X\_K, V\_λ/ϖ^m)\_m[−l(w)] is a T̃^S-equivariant direct summand (T̃^S acting through S) of R Γ(∂X̃\_K̃, V\_λ̃/ϖ^m)\_m̃.

Prerequisites: `PA.0`; `PA.1` (constructions in this layer); `mathlib:DerivedCategory`. Source: [ACC](#source-acc), §4.2, Theorem 4.2.1, pp. 968–970.

### Cuspidal weights and the middle degree

Cuspidal-triviality exclusion is a predicate on the computed Kostant weight table. It is then combined with the imported unitary torsion concentration theorem. The perturbation and degree-shifting arguments retain their local degree and residue-characteristic bounds.

<a id="ctg-weight"></a>

**Cuspidal-triviality exclusion for Kostant weights** (`CTGWeight`). Given the actual finite set W^P of Siegel shuffles, the embedding involution τ↦τc and the Levi weight table μ(w,τ,i)=λ\_{w,τ,i}, define CTGWeight(μ) by: for every w∈W^P and a∈Z there exists τ for which the vector (μ(w,τ,i)+μ(w,τc,n−1−i))\_i is not the constant a vector. Here λ\_w=w(λ̃+ρ)−ρ and the conjugate dual row is −reverse(λ\_{w,τc}). This predicate on the computed table is Definition 4.3.5; it uses the Kostant weight calculation, rather than an arbitrary table of parallel-trace inequalities.

Prerequisites: `PA.1` (constructions in this layer); `PA.0`. Source: [ACC](#source-acc), §4.3, Definition 4.3.5 and following paragraph, p. 974.

API:

- `CTGWeight.iff_witness`: CTG is equivalent to ∀w,a, ∃τ,i, μ(w,τ,i)+μ(w,τc,n−1−i)≠a.
- `CTGWeight.reindex`: Equivariant bijections of embeddings and bijections of W preserve the predicate.
- `CTGWeight.not_parallel`: If one w and a give that same constant vector at every τ, the table is not CTG.
- `CTGWeight.no_cuspidal_levi_weight`: For the weight table calculated from λ̃, CTG excludes a regular algebraic cuspidal GL\_n representation of any weight λ\_w, by the imported purity lemma.

Examples and tests:

- `CTGWeight.zero` (non-example): For nonempty W and n>0 the zero table is not CTG.
- `CTGWeight.empty_w` (degenerate): With W empty the predicate is true.
- `CTGWeight.rank_one_pair` (computation): For n=1, one w and embeddings a,aᶜ,b,bᶜ, with μ(a)=0, μ(aᶜ)=0, μ(b)=1, μ(bᶜ)=0, the table is CTG: the conjugate sums are 0 and 1.

<a id="ctg-one-embedding-perturbation"></a>

**Ctg one embedding perturbation** (`ctg_one_embedding_perturbation`). Assume [F^+:Q] > 1. Let λ̃ ∈ (Z^{2n}\_+)^{Hom(F^+,E)} and τ\_0: F^+ ↪ E. There is λ̃' ∈ (Z^{2n}\_+)^{Hom(F^+,E)} with λ̃'\_τ = λ̃\_τ for all τ ≠ τ\_0 and λ̃' CTG; one may take λ̃'\_{τ\_0} = λ̃\_{τ\_0} + (a, 0, …, 0) with a ∈ Z\_{≥0} sufficiently large (depending on λ̃).

Prerequisites: `PA.1` (constructions in this layer). Source: [ACC](#source-acc), §4.3, Lemma 4.3.6 and (4.3.7), pp. 974–975.

<a id="middle-degree-satake"></a>

**Middle degree Satake** (`middle_degree_satake`). Assume [F^+:Q] > 1. Let K̃ ⊂ G̃(A^∞\_{F^+}) be good and decomposed with respect to P (K = K̃ ∩ G), with K̃\_{U,v̄} = U(O\_{F^+\_v̄}) for each v̄ ∈ S̄\_p, λ̃ ∈ (Z^{2n}\_+)^{Hom(F^+,E)} and S̄\_p = S̄\_1 ⊔ S̄\_2 with (1) λ̃\_v̄ = 0 for v̄ ∈ S̄\_2; (2) for every finite place w ∉ S of F with residue characteristic l, either S contains no l-adic place of F and l is unramified in F, or l splits in some imaginary quadratic field F\_0 ⊂ F; (3) p > n² (p unramified in F). Let w ∈ W^P\_{S̄\_2}, λ\_w = w(λ̃+ρ) − ρ ∈ (Z^n\_+)^{Hom(F,E)}, m ⊂ T^S non-Eisenstein in the support of H^\*(X\_K, V\_{λ\_w}), m̃ = S^\*(m), and assume ρ̄\_m̃ decomposed generic. Then S: T̃^S → T^S descends to a homomorphism T̃^S(H^d(X̃\_K̃, V\_λ̃))\_m̃ → T^S(H^{d−l(w)}(X\_K, V\_{λ\_w}))\_m.

Prerequisites: `PA.1` (constructions in this layer); `IG:IG.7`; `AG:AG2.0`; `ALS:ALS.5`. Source: [ACC](#source-acc), §4.3, Proposition 4.3.4, pp. 973–974.

<a id="fontaine-laffaille-degree-shifting"></a>

**Fontaine–Laffaille degree shifting** (`fontaine_laffaille_degree_shifting`). Let λ ∈ (Z^n\_+)^{Hom(F,E)} and let v̄ ≠ v̄' be p-adic places of F^+ (so F^+ ≠ Q). Fix m ≥ 1 and a good K̃ ⊂ G̃(A^∞\_{F^+}) (K = K̃ ∩ G). Assume: (1) −λ\_{τc,1} − λ\_{τ,1} ≥ 0 for every τ: F ↪ E inducing v̄; (2) Σ\_{v̄'' ∈ S̄\_p, v̄'' ≠ v̄, v̄'} [F^+\_{v̄''}:Q\_p] > ½[F^+:Q]; (3) U(O\_{F^+\_{v̄''}}) ⊂ K̃\_{v̄''} ⊂ {g ≡ (1\_n \*; 0 1\_n) mod ϖ^m\_{v̄''}} for every p-adic v̄'' ≠ v̄, and K̃\_v̄ = G̃(O\_{F^+\_v̄}); (4) p > n²; (5) for every finite place w ∉ S of F with residue characteristic l, either S contains no l-adic place of F and l is unramified in F, or l splits in some imaginary quadratic field F\_0 ⊂ F; (6) m ⊂ T^S is non-Eisenstein and ρ̄\_m̃ is decomposed generic. Define λ̃ ∈ (Z^{2n}\_+)^{Hom(F^+,E)} by λ̃\_τ = 0 if τ induces neither v̄ nor v̄', λ̃\_τ = (−λ\_{τ̃c,n}, …, −λ\_{τ̃c,1}, λ\_{τ̃,1}, …, λ\_{τ̃,n}) if τ induces v̄ (dominant by (1)), and λ̃\_τ ∈ Z^{2n}\_+ arbitrary if τ induces v̄'. For m' ≥ m let K̃(m')\_{v̄''} = K̃\_{v̄''} ∩ {g ≡ (1\_n \*; 0 1\_n) mod ϖ^{m'}\_{v̄''}} for p-adic v̄'' ≠ v̄ and K̃(m')\_{v̄''} = K̃\_{v̄''} otherwise (K̃ = K̃(m)). Let q ∈ [⌊d/2⌋, d−1]. Then there are m' ≥ m, N ≥ 1 depending only on n and [F^+:Q], a nilpotent ideal J ⊂ A(K,λ,q,m) with J^N = 0, and a commutative square T̃^S → Ã(K̃(m'), λ̃) → A(K,λ,q,m)/J, T̃^S →^S T^S → A(K,λ,q,m)/J.

Prerequisites: `PA.1` (constructions in this layer); `IG:IG.7`. Source: [ACC](#source-acc), §4.4, Proposition 4.4.1 (with Hypothesis 4.4.2 and (4.4.3)–(4.4.5) in its proof), pp. 975–978.

### Integral Fontaine–Laffaille transfer

Transfer the polarized unitary representation to the rank-n summand using determinant kernels and multiplicity-free reconstruction. This step must work for an arbitrary coefficient homomorphism. Degree reflection uses finite-level duality with the actual orientation and coefficient twists.

<a id="nilpotent-fontaine-laffaille-transfer"></a>

**Nilpotent Fontaine–Laffaille transfer** (`nilpotent_fontaine_laffaille_transfer`). Let Ã be a finite flat O-algebra, D̃ a continuous 2n-dimensional determinant of G\_{F,S} valued in Ã, and M = Ã[G\_{F,S}]/ker D̃. Assume the finite O-module M, restricted to each G\_{F\_v} with v | v̄, lies in the essential image of the integral Fontaine–Laffaille functor G^a in the stated interval. Let Ã → B be an O-algebra homomorphism, where B is a finite Artinian local O-algebra killed by ϖ^m for some m ≥ 1. Suppose D̃\_B = det(ρ ⊕ ρ′) for continuous ρ, ρ′: G\_{F,S} → GL\_n(B), whose residual representations over the residue field of B are absolutely irreducible and non-isomorphic. Then there is a surjection B ⊗\_Ã M ↠ B[G\_{F,S}]/ker D̃\_B, and the latter algebra is isomorphic to M\_n(B) × M\_n(B). Consequently ρ|\_{G\_{F\_v}} belongs to the essential image of G^a. The coefficient map Ã → B need not be surjective. Kernel inclusion under arbitrary scalar extension, rather than equality under flat scalar extension, gives the displayed surjection; the split matrix-algebra identification requires the residually multiplicity-free reconstruction and faithful determinant argument.

Prerequisites: `FF:R07.3`; `IHG:IHG.0`; `IHG:IHG.1`. Source: [ACC](#source-acc), §4.4, proof of Proposition 4.4.6, pp. 980–981 (determinant-kernel transfer); [Chenevier](#source-chenevier), §1.17 and Lemma 1.18(iii), PDF p. 16; Theorem 2.22, PDF p. 34.

<a id="middle-range-fontaine-laffaille"></a>

**Middle range Fontaine–Laffaille** (`middle_range_fontaine_laffaille`). Let λ, v̄ ≠ v̄', m ≥ 1 and a good K̃ satisfy (1) −λ\_{τc,1} − λ\_{τ,1} ≥ 0 and −λ\_{τc,n} − λ\_{τ,n} ≤ p − 2n − 1 for every τ inducing v̄, and (2)–(6) of Proposition 4.4.1. Let q ∈ [⌊d/2⌋, d−1], and for assertion (c) assume A(K,λ,q,m) ≠ 0. Then there are N ≥ 1 depending only on [F:Q] and n, an ideal J ⊂ A(K,λ,q,m) with J^N = 0 and a continuous ρ\_m: G\_{F,S} → GL\_n(A(K,λ,q,m)/J) with (a) char(ρ\_m(Frob\_v)) = image of P\_v(X) for v ∉ S; (b) for each v | v̄, ρ\_m|\_{G\_{F\_v}} is in the essential image of G^a, a = (λ\_{τ,n})\_{τ ∈ Hom\_{Q\_p}(F\_v,E)}; (c) for each v | v̄ there is N̄ ∈ MF\_k with ρ̄\_m̃|\_{G\_{F\_v}} ≅ G(N̄) and FL\_τ(N̄) = {−λ\_{τc,n}+2n−1, …, −λ\_{τc,1}+n, λ\_{τ,1}+n−1, …, λ\_{τ,n}} for every τ ∈ Hom\_{Q\_p}(F\_v,E), where ρ̄\_m̃ = ρ̄\_m ⊕ ρ̄\_m^{c,∨}ε^{1−2n}.

Prerequisites: `PA.1` (constructions in this layer); `FF:R07.3`; `IG:IG.7`; `PH:R06.4`; `AG:AG2.0`; `AG:AG2.2`; `AG:AG2.3`; `AG:AG2.6`. Source: [ACC](#source-acc), §4.4, Proposition 4.4.6, pp. 979–981.

<a id="degree-reflection-duality"></a>

**Degree reflection duality** (`degree_reflection_duality`). Assume K is principal-congruence of level ϖ^m at the p-adic places ≠ v̄, λ\_{v̄''} = 0 for p-adic v̄'' ≠ v̄, and λ satisfies (3) of Cor. 4.4.8. Then V\_{λ^∨} ≅ V\_λ^∨ ([Jan03, Cor. II.5.6]). With n\_0 = (2n+1−p)/2 and μ\_{0,τ} = (n\_0, …, n\_0), the maximal ideal m^∨(ε^{−n\_0}) lies in the support of H^\*(X\_K, V\_{λ^∨+μ\_0}), λ^∨+μ\_0 again satisfies (3), and [K^S g K^S] ↦ ε(Art\_F(det g))^{−n\_0}[K^S g^{−1} K^S] descends to an isomorphism f: T^S(H^{d−1−q'}(X\_K, V\_{λ^∨+μ\_0}/ϖ^m))\_{m^∨(ε^{−n\_0})} ≅ A(K,λ,q',m); a representation ρ' for the left side gives ρ = (f∘ρ')^∨ ⊗ ε^{1−2n+(p−1)/2} for the right side, with the same properties (a)–(c).

Prerequisites: `PA.0`; `ALS:ALS.5:finite-level-duality`; `ALS:ALS.4`; `ALS:ALS.3`. Source: [ACC](#source-acc), §4.4, proof of Corollary 4.4.8, pp. 983–984.

### Crystalline twists and local–global compatibility

A prescribed global crystalline character makes the unitary residual representation generic without changing the desired local conclusion. The finite shifted-partition argument recovers the labelled rank-n weights. The final theorem has two separate alternatives for obtaining its nonzero comparison.

<a id="genericity-making-character-twist"></a>

**Genericity making character twist** (`genericity_making_character_twist`). (Asserted without proof.) If ρ̄\_m is decomposed generic then, after enlarging k, there is a character ψ̄: G\_F → k^× with ψ̄|\_{G\_{F\_v}} trivial for every v ∈ S such that (ρ̄\_m ⊗ ψ̄) ⊕ ((ρ̄\_m ⊗ ψ̄)^{c,∨} ⊗ ε^{1−2n}) is decomposed generic.

Prerequisites: `AG:AG2.7`; `CS:R23.1`. Source: [ACC](#source-acc), §4.4, proof of Corollary 4.4.8, p. 984.

<a id="shifted-partition-recovery"></a>

**Shifted partition recovery** (`shifted_partition_recovery`). Let m ≥ 1 and let A, B, C, D be sets of integers, each of size m, with c > d for all c ∈ C and d ∈ D. If A ∪ B = C ∪ D and (A+1) ∪ B = (C+1) ∪ D, and both sets have 2m elements, then A = C and B = D.

Prerequisites: Mathlib integer arithmetic and finite collections. Source: [ACC](#source-acc), §4.5, Lemma 4.5.2, p. 989.

<a id="all-degree-fontaine-laffaille"></a>

**All degree Fontaine–Laffaille** (`all_degree_fontaine_laffaille`). Let v̄ ∈ S̄\_p, K ⊂ GL\_n(A\_F^∞) good, λ ∈ (Z^n\_+)^{Hom(F,E)}, m ⊂ T^S(K,λ) non-Eisenstein. Assume: (1) K\_v = GL\_n(O\_{F\_v}) for v | v̄; (2) there is v̄' ∈ S̄\_p, v̄' ≠ v̄, with Σ\_{v̄'' ∈ S̄\_p, v̄'' ≠ v̄, v̄'} [F^+\_{v̄''}:Q\_p] > ½[F^+:Q]; (3) −λ\_{τc,1} − λ\_{τ,1} ≥ 0 and −λ\_{τc,n} − λ\_{τ,n} ≤ p − 1 − 2n for every τ inducing v̄; (4) p > n²; (5) for every finite place w ∉ S of F with residue characteristic l, either S contains no l-adic place of F and l is unramified in F, or l splits in some imaginary quadratic field F\_0 ⊂ F; (6) ρ̄\_m is decomposed generic. Then for all integers q ∈ [0, d−1] and m ≥ 1 there are N ≥ 1 depending only on [F:Q] and n, J ⊂ A(K,λ,q,m) with J^N = 0, and a continuous ρ\_m: G\_{F,S} → GL\_n(A(K,λ,q,m)/J) satisfying (a), (b), (c) of Proposition 4.4.6.

Prerequisites: `PA.1` (constructions in this layer); `FF:R07.3`. Source: [ACC](#source-acc), §4.4, Corollary 4.4.8, pp. 981–984.

<a id="fontaine-laffaille-local-global"></a>

**Fontaine–Laffaille compatibility** (`fontaine_laffaille_local_global`). Let K ⊂ GL\_n(A\_F^∞) be a good subgroup, λ ∈ (Z^n\_+)^{Hom(F,E)}, S a finite set of finite places of F containing the p-adic places with S = S^c, and m ⊂ T^S(K,λ) a non-Eisenstein maximal ideal with T^S(K,λ)/m = k of characteristic p. Let v̄ be a p-adic place of F^+ and assume: (1) F is unramified at p, and some imaginary quadratic subfield F\_0⊂F has p split; (2) for every finite place w ∉ S of F with residue characteristic l, either S contains no l-adic place of F and l is unramified in F, or l splits in some imaginary quadratic field F\_0 ⊂ F; (3) K\_v = GL\_n(O\_{F\_v}) for every v | v̄; (4) λ\_{τ,1} + λ\_{τc,1} − λ\_{τ,n} − λ\_{τc,n} ≤ p − 2n − 1 for every τ: F ↪ E inducing v̄; (5) p > n²; (6) there is a p-adic place v̄' ≠ v̄ of F^+ with Σ\_{v̄'' ∈ S̄\_p, v̄'' ≠ v̄, v̄'} [F^+\_{v̄''}:Q\_p] > ½[F^+:Q]; (7) ρ̄\_m is decomposed generic; (8) either (a) H^\*(X\_K, V\_λ)\_m[1/p] ≠ 0, or (b) for every τ inducing v̄, −λ\_{τc,n} − λ\_{τ,n} ≤ p − 2n − 2 and −λ\_{τc,1} − λ\_{τ,1} ≥ 0. Then there are an integer N ≥ 1 depending only on [F^+:Q] and n, an ideal J ⊂ T^S(K,λ)\_m with J^N = 0, and a continuous ρ\_m: G\_{F,S} → GL\_n(T^S(K,λ)\_m/J) such that: (a) for each finite v ∉ S, the characteristic polynomial of ρ\_m(Frob\_v) is the image of P\_v(X); (b) for each v | v̄, ρ\_m|\_{G\_{F\_v}} lies in the essential image of G^a with a = (λ\_{τ,n})\_{τ ∈ Hom(F\_v,E)}; (c) for each v | v̄ there is M̄ ∈ MF\_k with ρ̄\_m|\_{G\_{F\_v}} ≅ G(M̄) and FL\_τ(M̄) = {λ\_{τ,1}+n−1, λ\_{τ,2}+n−2, …, λ\_{τ,n}} for every τ: F\_v ↪ E.

Prerequisites: `PA.1` (constructions in this layer); `FF:R07.3`; `PH:R06.4`; `AG:AG2.0`; `CS:R24.5`. Source: [ACC](#source-acc), §4.1, Theorem 4.5.1, p. 967 (restated §4.5, p. 985; proof pp. 985–988).

## PA.2 — Ordinary cohomology and compatibility

### Iwahori levels, contraction and ordinary summands

Fix all local factors before passing up a tower. Positive torus elements act by transfer on unipotent invariants. The ordinary projector at finite Artinian level is imported; the stable image of a single endomorphism is the local algebraic core of its arithmetic use.

<a id="iwahori-level-tower"></a>

**Iwahori level tower** (`IwahoriLevelTower`). Standing data: F a CM field, n ≥ 1, p a prime, E/Q\_p finite containing the images of all embeddings F ↪ Q̄\_p; standing hypothesis for all of §5: F contains an imaginary quadratic field in which p splits (p may ramify in F). Let K ⊂ GL\_n(A\_F^∞) be a good subgroup, λ ∈ (Z^n\_+)^{Hom(F,E)}, S a finite set of finite places of F containing S\_p and stable under c, such that (i) for every finite v ∉ S with residue characteristic l, either S contains no l-adic place and l is unramified in F, or l splits in some imaginary quadratic subfield of F; (ii) K\_v = Iw\_v for v | p and K\_v = GL\_n(O\_{F\_v}) for finite v ∉ S. For integers c ≥ b ≥ 0 with c ≥ 1, K(b,c) ⊂ K is the good subgroup with K(b,c)\_v = K\_v for v ∤ p and K(b,c)\_v = Iw\_v(b,c) for v | p; K(0,1) = K and K(0,c)/K(b,c) ≅ ∏\_{v|p} T\_n(O\_{F\_v}/ϖ\_v^b). Define T^{S,ord} = T^S ⊗\_O O⟦T\_n(O\_{F,p})⟧[{U\_{v,1},…,U\_{v,n},U\_{v,n}^{-1}}\_{v|p}] (U\_{v,i} formal variables), U\_v = U\_{v,1}U\_{v,2}⋯U\_{v,n−1}, U\_p = ∏\_{v|p} U\_v. The canonical surjection O⟦T\_n(O\_{F,p})⟧ → O[K(0,c)/K(b,c)] extends to T^{S,ord} → End\_{D(O[K(0,c)/K(b,c)])}(RΓ\_{K(0,c)/K(b,c)}(X\_{K(b,c)}, V\_λ)), U\_{v,i} acting by the double coset operator [Iw\_v(b,c) diag(ϖ\_v,…,ϖ\_v,1,…,1) Iw\_v(b,c)] (i entries ϖ\_v). Additional standing hypothesis for §§5.2–5.5: ϖ\_{v^c} = ϖ\_v^c for every v | p; the U\_{v,i} depend on ϖ\_v but RΓ^ord, T^S(K(b,c),λ)^ord and the truth of Theorem 5.5.1 do not.

Prerequisites: `PA.0`; `SR:SR.1`. Source: [ACC](#source-acc), §5.1, pp. 989–991.

API:

- `IwahoriLevelTower.level`: The (b,c)-level equals K away from p and matrices upper triangular modulo varpi\_v^c with diagonal congruent to 1 modulo varpi\_v^b at p.
- `IwahoriLevelTower.transition`: For b′≥b,c′≥c, inclusion of levels gives compatible pullback and trace on integral cohomology.
- `IwahoriLevelTower.diamondQuotient`: K(0,c)/K(b,c) is the product of diagonal unit groups modulo varpi\_v^b.
- `IwahoriLevelTower.ordinaryOperator`: U\_p is the product over v|p and 1≤i<n of the normalized double-coset operators; U\_{v,n} is already invertible.

Examples and tests:

- `IwahoriLevelTower.base` (computation): K(0,1)=K.
- `IwahoriLevelTower.zero_b` (degenerate): For b=0 the diamond quotient is trivial.
- `IwahoriLevelTower.deep_unipotent` (non-example): For b=1 a diagonal unit not congruent to 1 modulo varpi\_v is excluded even though it belongs to K(0,c).

<a id="positive-torus-monoid"></a>

**Positive torus monoid** (`PositiveTorusMonoid`). T\_n(F\_p)^+ ⊂ T\_n(F\_p) is the open submonoid of t with t N\_n(O\_{F,p}) t^{-1} ⊂ N\_n(O\_{F,p}); T\_n(F\_v)^+ = T\_n(F\_v) ∩ T\_n(F\_p)^+; Δ\_p = ∏\_{v|p} Iw\_v T\_n(F\_v)^+ Iw\_v (§2.2.5). For b ≥ 0: T\_n(O\_{F,p})(b) = ∏\_{v∈S\_p} ker(T\_n(O\_{F\_v}) → T\_n(O\_{F\_v}/ϖ\_v^b)), T\_n(O\_{F,p})\_b = T\_n(O\_{F,p})/T\_n(O\_{F,p})(b), T\_n(F\_p)^+\_b = T\_n(F\_p)^+/T\_n(O\_{F,p})(b), T\_n(F\_p)\_b = T\_n(F\_p)/T\_n(O\_{F,p})(b). u\_p = (p^{n−1}, p^{n−2}, …, 1) ∈ T\_n(Q\_p) ⊂ T\_n(F\_p) lies in T\_n(F\_p)^+. B\_n(F\_p)^+ = N\_n(O\_{F,p})·T\_n(F\_p)^+ ⊂ Δ\_p; B\_n(O\_{F,p})(b) is the preimage of T\_n(O\_{F,p})(b) in B\_n(O\_{F,p}). Every C ∈ D\_sm(O/ϖ^m[T\_n(F\_p)^+\_b]) carries a functorial homomorphism O⟦T\_n(O\_{F,p})⟧[{U\_{v,1},…,U\_{v,n},U\_{v,n}^{-1}}\_{v∈S\_p}] → End(C), via O⟦T\_n(O\_{F,p})⟧ → O/ϖ^m[T\_n(O\_{F,p})\_b] and U\_{v,i} ↦ diag(ϖ\_v,…,ϖ\_v,1,…,1) ∈ T\_n(F\_v) (i entries ϖ\_v); hence a T^S-action on C extends to a T^{S,ord}-action.

Prerequisites: `PA.2` (constructions in this layer); `SR:SR.1`. Source: [ACC](#source-acc), §5.2.1, pp. 992–993.

API:

- `PositiveTorusMonoid.mem_iff`: For a diagonal torus element, contraction of upper unipotents is equivalent to valuation(t\_i)≥valuation(t\_j) for i<j.
- `PositiveTorusMonoid.contractingElement`: The exponent row (n−1,n−2,…,0) defines u\_p and belongs to the positive cone.
- `PositiveTorusMonoid.unit_subgroup`: Every diagonal unit belongs to the cone, and zero valuations recover the compact torus.
- `PositiveTorusMonoid.mul`: Componentwise products preserve the cone, so it is an open submonoid of the diagonal torus.

Examples and tests:

- `PositiveTorusMonoid.rank_one` (degenerate): For n=1 all diagonal torus elements are positive.
- `PositiveTorusMonoid.rank_two_positive` (computation): The exponent row (1,0) is positive.
- `PositiveTorusMonoid.rank_two_negative` (non-example): The exponent row (0,1) is not positive for the upper-triangular Borel.

<a id="arithmetic-ordinary-summand"></a>

**Arithmetic ordinary summand** (`ArithmeticOrdinarySummand`). For the Iwahori level tower above, there is a well-defined direct summand RΓ\_{K(0,c)/K(b,c)}(X\_{K(b,c)}, V\_λ)^ord of RΓ\_{K(0,c)/K(b,c)}(X\_{K(b,c)}, V\_λ) in D(O[K(0,c)/K(b,c)]) on which U\_p acts invertibly (theory of ordinary parts, [KT17 §2.4]). T^S(K(b,c),λ)^ord is the image of T^{S,ord} → End\_{D(O[K(0,c)/K(b,c)])}(RΓ\_{K(0,c)/K(b,c)}(X\_{K(b,c)}, V\_λ)^ord), i.e. T^S(K(b,c),λ)^ord = T^{S,ord}(RΓ\_{K(0,c)/K(b,c)}(X\_{K(b,c)}, V\_λ)^ord). There is a canonical homomorphism T^S(K(0,c)/K(b,c), V\_λ) → T^S(K(b,c),λ)^ord (in general neither injective nor surjective); consequently every maximal ideal 𝔪 of T^S(K(b,c),λ)^ord has an associated ρ̄\_𝔪: G\_{F,S} → GL\_n(T^S(K(b,c),λ)^ord/𝔪). A maximal ideal of T^{S,ord} with residue field finite over k is of Galois type (resp. non-Eisenstein) if its pullback to T^S is so in the sense of Definition 2.3.6.

Prerequisites: `PA.2` (constructions in this layer); `PF:L0a`. Source: [ACC](#source-acc), §5.1, p. 990.

API:

- `ArithmeticOrdinarySummand.complex`: The image of PadicFamilies:L0a’s derived ordinary idempotent on the tower’s finite perfect complex.
- `ArithmeticOrdinarySummand.operator_bijective`: U\_p acts invertibly on that image.
- `ArithmeticOrdinarySummand.finite_quotient_comparison`: Modulo varpi^m the image is the stabilized factorial-power summand, and equals the localization of the finite module at U\_p.
- `ArithmeticOrdinarySummand.base_change`: Coefficient quotient and equivariant tower maps commute with the projector after the finite-quotient/continuity hypotheses are verified.

Examples and tests:

- `ArithmeticOrdinarySummand.zero_complex` (degenerate): The ordinary summand of the zero complex is zero.
- `ArithmeticOrdinarySummand.unit_operator` (computation): With U\_p the identity, the summand is the whole complex.
- `ArithmeticOrdinarySummand.nilpotent_operator` (non-example): A finite complex with nilpotent U\_p has zero ordinary summand.

<a id="lowest-weight-character"></a>

**Lowest weight character** (`LowestWeightCharacter`). For λ ∈ X^\*((Res\_{F/Q}T\_n)\_E) = (Z^n)^{Hom(F,E)}, O(λ) is the free rank-one O-module on which u ∈ T\_n(O\_{F,p}) acts by ∏\_{τ∈Hom(F,E)} ∏\_{i=1}^n τ(u\_i)^{λ\_{τ,i}} and every diag(ϖ\_v^{a\_1},…,ϖ\_v^{a\_n}) (a\_i ∈ Z) acts trivially. For dominant λ, projection to the lowest weight space gives an O-linear map V\_λ → O(w\_0^G λ) which is B\_n(F\_p)^+-equivariant (·\_p-action of §2.2.5 on the source, action through the projection to T\_n(F\_p) on the target); K\_λ := ker(V\_λ → O(w\_0^G λ)) is an O[B\_n(F\_p)^+]-module, finite free over O.

Prerequisites: `PA.2` (constructions in this layer); `Tau Ceti ReductiveGroups L9`. Source: [ACC](#source-acc), §5.2.1, p. 993.

API:

- `LowestWeightCharacter.unit_eval`: On units u its scalar is ∏τ,i τ(u\_i)^{λ\_{τ,i}}.
- `LowestWeightCharacter.uniformizer_eval`: It is 1 on every chosen diagonal uniformizer power.
- `LowestWeightCharacter.add`: The character for λ+μ is the product of the two characters.
- `LowestWeightCharacter.projection`: For dominant λ the integral dual-Weyl lattice has a B⁺-equivariant lowest-weight quotient O(w₀λ) with finite free kernel killed by a power of u\_p modulo varpi^m.

Examples and tests:

- `LowestWeightCharacter.zero` (degenerate): The zero weight gives the trivial character.
- `LowestWeightCharacter.rank_one_square` (computation): For one embedding, rank one and weight 2, a unit u acts by τ(u)².
- `LowestWeightCharacter.uniformizer_normalization` (non-example): Even for nonzero λ, chosen uniformizers act by 1, not by their algebraic λ-power.

<a id="ordinary-galois-characters"></a>

**Ordinary Galois characters** (`OrdinaryGaloisCharacters`). The operators U\_{v,i} are invertible in T^S(K(b,c),λ)^ord (because U\_p is). For each v | p and i = 1,…,n, χ\_{λ,v,i}: G\_{F\_v} → (T^S(K(b,c),λ)^ord)^× is the unique continuous character with χ\_{λ,v,i}(Art\_{F\_v}(u)) = ε^{1−i}(Art\_{F\_v}(u)) · ∏\_{τ∈Hom\_{Q\_p}(F\_v,E)} τ(u)^{−(w\_0^G λ)\_{τ,i}} · ⟨diag(1,…,u,…,1)⟩ for u ∈ O\_{F\_v}^× (u in the i-th diagonal entry), and χ\_{λ,v,i}(Art\_{F\_v}(ϖ\_v)) = ε^{1−i}(Art\_{F\_v}(ϖ\_v)) · U\_{v,i}/U\_{v,i−1} (with U\_{v,0} = 1).

Prerequisites: `PA.2` (constructions in this layer); `mathlib:Matrix.charpoly`. Source: [ACC](#source-acc), §5.1, p. 990.

API:

- `OrdinaryGaloisCharacters.on_units`: On Art(u), χ\_i=ε^{1−i}∏τ τ(u)^{−λ\_{τ,n−i+1}} times the i-th diamond character.
- `OrdinaryGaloisCharacters.on_uniformizer`: On Art(varpi\_v), χ\_i=ε^{1−i} U\_{v,i}/U\_{v,i−1}, with U\_{v,0}=1.
- `OrdinaryGaloisCharacters.unique`: The unit formula and chosen uniformizer value determine the continuous character by local class field theory.
- `OrdinaryGaloisCharacters.change_uniformizer`: Changing the uniformizer changes the U-ratio by the corresponding unit/diamond factor and leaves the Galois character unchanged.

Examples and tests:

- `OrdinaryGaloisCharacters.rank_one` (computation): For n=1, χ₁(Art(varpi\_v))=U\_{v,1}.
- `OrdinaryGaloisCharacters.determinant` (characterisation): The product of the n uniformizer values is ε^{n(1−n)/2}U\_{v,n}.
- `OrdinaryGaloisCharacters.weight_reversal` (non-example): For rank 2 with λ=(2,0), the algebraic unit factors are 1 for χ₁ and u^{-2} for χ₂ before ε and diamonds; using λ\_i instead of λ\_{n−i+1} reverses them.

### Local ordinary functors and derived invariants

The coefficient characteristic is p. Build ordinary parts in smooth positive-monoid categories with enough injectives, then derive the functors. The comparisons depend on unipotent acyclicity and injective preservation, with the indicated boundedness conditions.

<a id="local-ordinary-parts"></a>

**Ordinary parts** (`LocalOrdinaryParts`). Γ(N\_n(O\_{F,p}),−): Mod\_sm(O/ϖ^m[Δ\_p]) → Mod\_sm(O/ϖ^m[T\_n(F\_p)^+]) is N\_n(O\_{F,p})-invariants with t ∈ T\_n(F\_p)^+ acting by t·v = Σ\_{n∈N\_n(O\_{F,p})/tN\_n(O\_{F,p})t^{-1}} n t v (5.2.5), i.e. by the double coset operator [N\_n(O\_{F,p}) t N\_n(O\_{F,p})]. Γ(B\_n(O\_{F,p})(b),−): Mod\_sm(O/ϖ^m[Δ\_p]) → Mod(O/ϖ^m[T\_n(F\_p)^+\_b]) is B\_n(O\_{F,p})(b)-invariants with the same formula. For c ≥ b ≥ 0, c ≥ 1, Iw\_p(b,c) = ∏\_{v∈S\_p} Iw\_v(b,c) and Γ(Iw\_p(b,c),−): Mod\_sm(O/ϖ^m[Δ\_p]) → Mod(O/ϖ^m[T\_n(F\_p)^+\_b]), t acting by [Iw\_p(b,c) t Iw\_p(b,c)]. Γ(T\_n(O\_{F,p})(b),−) maps Mod\_sm(O/ϖ^m[T\_n(F\_p)^+]) → Mod(O/ϖ^m[T\_n(F\_p)^+\_b]) and Mod\_sm(O/ϖ^m[T\_n(F\_p)]) → Mod(O/ϖ^m[T\_n(F\_p)\_b]). ord = − ⊗\_{O/ϖ^m[T\_n(F\_p)^+]} O/ϖ^m[T\_n(F\_p)]: Mod\_sm(O/ϖ^m[T\_n(F\_p)^+]) → Mod\_sm(O/ϖ^m[T\_n(F\_p)]) and ord\_b = − ⊗\_{O/ϖ^m[T\_n(F\_p)^+\_b]} O/ϖ^m[T\_n(F\_p)\_b]: Mod(O/ϖ^m[T\_n(F\_p)^+\_b]) → Mod(O/ϖ^m[T\_n(F\_p)\_b]) (localizations; on modules finite over O/ϖ^m they agree with the maximal summand on which the torus acts invertibly, [Eme10b, Lem. 3.2.1]).

Prerequisites: `PA.2` (constructions in this layer); `PF:L0a`; `SR:SR.0:derived-extension`. Source: [ACC](#source-acc), §5.2.1, (5.2.5), pp. 993–994.

API:

- `LocalOrdinaryParts.transfer_action`: The action on N(O)-invariants is t·v=Σ\_{n∈N(O)/tN(O)t^{-1}} ntv.
- `LocalOrdinaryParts.localization`: Ordinary parts are the localization from the positive-torus monoid algebra to the group algebra after N-invariants.
- `LocalOrdinaryParts.finite_comparison`: On finite O/varpi^m-modules this localization is the PadicFamilies:L0a ordinary summand.
- `LocalOrdinaryParts.map`: Equivariant module maps induce ordinary maps and preserve identity/composition.
- `LocalOrdinaryParts.derived`: Derive N-invariants in the smooth monoid category, then apply exact localization.

Examples and tests:

- `LocalOrdinaryParts.zero` (degenerate): The ordinary parts of the zero representation are zero.
- `LocalOrdinaryParts.trivial_unipotent` (compatibility): For N={1}, the functor is precisely torus localization.
- `LocalOrdinaryParts.transfer_not_naive` (non-example): For a trivial F\_p-representation of N=Z\_p and tNt^{-1}=pN, transfer acts by p=0; ordinary localization is zero although the naive t action would be the identity.

<a id="ordinary-torus-invariants"></a>

**Ordinary torus invariants** (`ordinary_torus_invariants`). For b ≥ 0 the square Γ(T\_n(O\_{F,p})(b),−) ∘ ord ≅ ord\_b ∘ Γ(T\_n(O\_{F,p})(b),−) of functors Mod\_sm(O/ϖ^m[T\_n(F\_p)^+]) → Mod(O/ϖ^m[T\_n(F\_p)\_b]) commutes up to natural isomorphism; i.e. the natural map M^{T\_n(O\_{F,p})(b)} ⊗\_{O/ϖ^m[T\_n(F\_p)^+\_b]} O/ϖ^m[T\_n(F\_p)\_b] → (M ⊗\_{O/ϖ^m[T\_n(F\_p)^+]} O/ϖ^m[T\_n(F\_p)])^{T\_n(O\_{F,p})(b)} is an isomorphism for every smooth M.

Prerequisites: `PA.2` (constructions in this layer). Source: [ACC](#source-acc), §5.2.1, Lemma 5.2.6, p. 995.

<a id="unipotent-invariants-acyclicity"></a>

**Unipotent invariants acyclicity** (`unipotent_invariants_acyclicity`). The functors Γ(N\_n(O\_{F,p}),−), Γ(B\_n(O\_{F,p})(b),−) and Γ(Iw\_p(b,c),−) on Mod\_sm(O/ϖ^m[Δ\_p]) are left exact, and for every b ≥ 0 the functor Γ(N\_n(O\_{F,p}),−) sends injective objects of Mod\_sm(O/ϖ^m[Δ\_p]) to Γ(T\_n(O\_{F,p})(b),−)-acyclic objects of Mod\_sm(O/ϖ^m[T\_n(F\_p)^+]).

Prerequisites: `PA.2` (constructions in this layer); `SR:SR.0:derived-extension`. Source: [ACC](#source-acc), §5.2.1, Lemma 5.2.7(1), p. 995.

<a id="ordinary-exact-injective"></a>

**Ordinary exact injective** (`ordinary_exact_injective`). The localization functors ord: Mod\_sm(O/ϖ^m[T\_n(F\_p)^+]) → Mod\_sm(O/ϖ^m[T\_n(F\_p)]) and ord\_b: Mod(O/ϖ^m[T\_n(F\_p)^+\_b]) → Mod(O/ϖ^m[T\_n(F\_p)\_b]) are exact and preserve injectives.

Prerequisites: `PA.2` (constructions in this layer); `SR:SR.0:derived-extension`. Source: [ACC](#source-acc), §5.2.1, Lemma 5.2.7(2), pp. 995–996.

<a id="iwahori-borel-ordinary-comparison"></a>

**Iwahori borel ordinary comparison** (`iwahori_borel_ordinary_comparison`). For c ≥ b ≥ 0 with c ≥ 1 there is a natural isomorphism ord\_b ∘ Γ(Iw\_p(b,c),−) ≅ ord\_b ∘ Γ(B\_n(O\_{F,p})(b),−) of functors Mod\_sm(O/ϖ^m[Δ\_p]) → Mod(O/ϖ^m[T\_n(F\_p)\_b]), induced by the inclusion V^{Iw\_p(b,c)} ⊂ V^{B\_n(O\_{F,p})(b)} (which is T\_n(F\_p)^+\_b-equivariant because Iw\_p(b,c) has an Iwahori decomposition).

Prerequisites: `PA.2` (constructions in this layer). Source: [ACC](#source-acc), §5.2.1, Lemma 5.2.8, pp. 996–997.

<a id="derived-ordinary-comparison"></a>

**Derived ordinary comparison** (`derived_ordinary_comparison`). Let π ∈ D\_sm(O/ϖ^m[Δ\_p]) be bounded below. For c ≥ b ≥ 0 with c ≥ 1 there is a natural isomorphism RΓ(T\_n(O\_{F,p})(b), ord RΓ(N\_n(O\_{F,p}), π)) ≅ ord\_b RΓ(Iw\_p(b,c), π) in D(O/ϖ^m[T\_n(F\_p)\_b]).

Prerequisites: `PA.2` (constructions in this layer); `SR:SR.0:derived-extension`. Source: [ACC](#source-acc), §5.2.1, Lemma 5.2.9, pp. 997–998.

### Completed cohomology and weight control

Keep the finite-level coefficient reduction, level transition maps and continuous torus actions throughout the inverse limits. Classical comparison and weight control use the lowest-weight projection after the contracting action has removed its kernel.

<a id="completed-arithmetic-cohomology"></a>

**Completed arithmetic cohomology** (`CompletedArithmeticCohomology`). For K ⊂ GL\_n(A\_F^∞) good there are functors Γ\_{K^p,sm}: Mod(O/ϖ^m[G^∞]) → Mod\_sm(O/ϖ^m[G(F\_p^+)]) and Mod(O/ϖ^m[G^{p,∞}×Δ\_p]) → Mod\_sm(O/ϖ^m[Δ\_p]), M ↦ Γ(K^p,M)^sm. For λ ∈ (Z^n\_+)^{Hom(F,E)}, π(K^p,λ,m) := RΓ\_{K^p,sm} RΓ(𝔛\_G, V\_λ/ϖ^m) ∈ D\_sm(O/ϖ^m[Δ\_p]). If K^S = ∏\_{v∉S} GL\_n(O\_{F\_v}) it carries T^S → End\_{D\_sm(O/ϖ^m[Δ\_p])}(π(K^p,λ,m)) (5.2.11), and for K\_p ⊂ Δ\_p a canonical T^S-equivariant isomorphism RΓ(K\_p, π(K^p,λ,m)) ≅ RΓ(X\_K, V\_λ/ϖ^m) in D(O/ϖ^m) (5.2.12). π(K^p,m) := RΓ\_{K^p,sm} RΓ(𝔛\_G, O/ϖ^m) ∈ D\_sm(O/ϖ^m[G(F\_p^+)]) carries T^S → End\_{D\_sm(O/ϖ^m[G(F\_p^+)])}(π(K^p,m)) (5.2.13), recovering (5.2.11) for λ = 0; T^S(K^p,m) := image of (5.2.13).

Prerequisites: `PA.0`; `mathlib:DerivedCategory`; `SR:SR.0:derived-extension`. Source: [ACC](#source-acc), §5.2.10, (5.2.11)–(5.2.13), p. 998.

API:

- `CompletedArithmeticCohomology.finite_level`: RΓ(K\_p,π(K^p,λ,m))≅RΓ(X\_K,V\_λ/varpi^m), Hecke-equivariantly.
- `CompletedArithmeticCohomology.hecke_action`: Unramified double cosets away from S give T^S → End of the smooth derived complex.
- `CompletedArithmeticCohomology.coefficient_reduction`: Derived coefficient reduction m′→m commutes with completed cohomology on the imported finite-projective models.
- `CompletedArithmeticCohomology.weight_zero`: At λ=0 this is the weight-zero completed complex with the full local group action.

Examples and tests:

- `CompletedArithmeticCohomology.zero_coefficients` (degenerate): The zero coefficient local system gives the zero completed complex.
- `CompletedArithmeticCohomology.finite_level_identity` (compatibility): Taking the specified K\_p derived invariants recovers the ALS finite-level complex, rather than its degree-zero invariants only.
- `CompletedArithmeticCohomology.higher_group_cohomology` (non-example): For the trivial F\_p-module of a pro-p group Z\_p, replacing derived invariants by fixed vectors loses the nonzero H¹.

<a id="completed-ordinary-cohomology"></a>

**Completed ordinary cohomology** (`CompletedOrdinaryCohomology`). π^ord(K^p,λ,m) := ord RΓ(N\_n(O\_{F,p}), π(K^p,λ,m)) ∈ D\_sm(O/ϖ^m[T\_n(F\_p)]); for λ = 0 it is written π^ord(K^p,m).

Prerequisites: `PA.2` (constructions in this layer). Source: [ACC](#source-acc), §5.2.10, p. 999.

API:

- `CompletedOrdinaryCohomology.formula`: π^ord=ord RΓ(N\_n(O),π), in the smooth torus derived category.
- `CompletedOrdinaryCohomology.torus_action`: The torus group acts after localization; Hecke away from S acts commuting with it.
- `CompletedOrdinaryCohomology.weight_zero`: At λ=0 the formula agrees with ordinary parts of weight-zero completed arithmetic cohomology.
- `CompletedOrdinaryCohomology.change_coefficients`: Derived reduction modulo a smaller coefficient power commutes under the tower’s finite-quotient hypotheses.

Examples and tests:

- `CompletedOrdinaryCohomology.zero` (degenerate): Zero completed cohomology has zero ordinary part.
- `CompletedOrdinaryCohomology.invertible_contractor` (compatibility): If N={1} and all positive torus operators are invertible, ordinary localization recovers the original complex.
- `CompletedOrdinaryCohomology.nilpotent_contractor` (non-example): A nilpotent contracting action gives zero ordinary part, even with nonzero completed cohomology.

<a id="completed-classical-ordinary-control"></a>

**Completed classical ordinary control** (`completed_classical_ordinary_control`). Let K ⊂ G^∞ be a good subgroup with K\_v = Iw\_v for each v | p and K^S = ∏\_{v∉S} GL\_n(O\_{F\_v}), and let c ≥ b ≥ 0 be integers with c ≥ 1. For every λ ∈ (Z^n\_+)^{Hom(F,E)} there is a T^{S,ord}-equivariant isomorphism RΓ(T\_n(O\_{F,p})(b), π^ord(K^p,λ,m)) ≅ RΓ\_{K(0,c)/K(b,c)}(X\_{K(b,c)}, V\_λ/ϖ^m)^ord in D(O/ϖ^m[K(0,c)/K(b,c)]) (K(0,c)/K(b,c) ≅ T\_n(O\_{F,p})\_b).

Prerequisites: `PA.2` (constructions in this layer). Source: [ACC](#source-acc), §5.2.10, Proposition 5.2.15, p. 999.

<a id="ordinary-level-control"></a>

**Ordinary level control** (`ordinary_level_control`). Let K ⊂ GL\_n(A\_F^∞) be good with K\_v = Iw\_v for v | p and K^S = ∏\_{v∉S} GL\_n(O\_{F\_v}); let c ≥ b ≥ 0 with c ≥ 1 and λ ∈ (Z^n\_+)^{Hom(F,E)}. The natural morphism RΓ\_{K(0,max(1,b))/K(b,max(1,b))}(X\_{K(b,max(1,b))}, V\_λ/ϖ^m)^ord → RΓ\_{K(0,c)/K(b,c)}(X\_{K(b,c)}, V\_λ/ϖ^m)^ord in D(O/ϖ^m[T\_n(O\_{F,p})\_b]) is an isomorphism.

Prerequisites: `PA.2` (constructions in this layer). Source: [ACC](#source-acc), §5.2.10, Corollary 5.2.16, p. 999.

<a id="completed-ordinary-weight-control"></a>

**Completed ordinary weight control** (`completed_ordinary_weight_control`). Let K ⊂ GL\_n(A\_F^∞) be good with K^S = ∏\_{v∉S} GL\_n(O\_{F,v}) and λ ∈ (Z^n\_+)^{Hom(F,E)}. There are T^S-equivariant isomorphisms in D(O/ϖ^m[T\_n(F\_p)]): π^ord(K^p,λ,m) ≅ ord RΓ(N\_n(O\_{F,p}), RΓ\_{K^p,sm} RΓ(𝔛\_G, O(w\_0^G λ)/ϖ^m)) ≅ π^ord(K^p,m) ⊗\_O O(w\_0^G λ).

Prerequisites: `PA.2` (constructions in this layer). Source: [ACC](#source-acc), §5.2.10, Proposition 5.2.17, p. 1000.

<a id="finite-ordinary-weight-control"></a>

**Finite ordinary weight control** (`finite_ordinary_weight_control`). Let K be good with K\_v = Iw\_v for v | p and K^S = ∏\_{v∉S} GL\_n(O\_{F\_v}); c ≥ b ≥ 0 with c ≥ 1. For λ, λ' ∈ (Z^n\_+)^{Hom(F,E)} with O(w\_0^G λ)/ϖ^m ≅ O(w\_0^G λ')/ϖ^m as O/ϖ^m[T\_n(O\_{F,p})(b)]-modules there is a T^{S,ord}-equivariant isomorphism RΓ\_{K(0,c)/K(b,c)}(X\_{K(b,c)}, V\_λ/ϖ^m)^ord ≅ RΓ\_{K(0,c)/K(b,c)}(X\_{K(b,c)}, V\_{λ'}/ϖ^m)^ord ⊗\_O O(w\_0^G λ) ⊗\_O O((w\_0^G λ')^{-1}) in D(O/ϖ^m[T\_n(F\_p)\_b]).

Prerequisites: `PA.2` (constructions in this layer). Source: [ACC](#source-acc), §5.2.10, Corollary 5.2.18, p. 1000.

### The unitary tower and ordinary Satake operators

The contracting element belongs to the full GL_{2n} factor. The unitary positive cone and the Levi cone therefore have distinct roles. The explicit formulas below determine the Satake map on every ordinary generator.

<a id="unitary-ordinary-tower"></a>

**Unitary ordinary tower** (`UnitaryOrdinaryTower`). Every p-adic place of F^+ splits in F; the fixed lifts ṽ ∈ S̃\_p give ∏\_{v̄∈S̄\_p} ι\_ṽ: G̃(F\_p^+) ≅ ∏\_{v̄∈S̄\_p} GL\_{2n}(F\_ṽ), with T ⊂ B ⊂ G̃ corresponding to T\_{2n} ⊂ B\_{2n}. T̃^{S,ord} = T̃^S ⊗\_O O⟦T(O\_{F^+,p})⟧[{Ũ\_{v,1},…,Ũ\_{v,2n},Ũ\_{v,2n}^{-1}}\_{v∈S\_p}] / (Ũ\_{v^c,i} − Ũ\_{v,2n−i} Ũ\_{v,2n}^{-1})\_{v∈S\_p, i=1,…,2n}; Ũ\_v = [Iw diag(ϖ^{2n−1},…,ϖ,1) Iw] (equivalently the product of the 2n−1 simple ordinary operators with the source normalization) and Ũ\_p = ∏\_{v∈S\_p} Ũ\_v. For K̃ good with K̃\_v̄ = Ĩw\_v̄ (v̄ ∈ S̄\_p) and c ≥ b ≥ 0, c ≥ 1: K̃(b,c)\_v̄ = K̃\_v̄ (v̄ ∉ S̄\_p), Ĩw\_v̄(b,c) (v̄ ∈ S̄\_p). For λ̃ ∈ (Z^{2n}\_+)^{Hom(F^+,E)} there is a well-defined direct summand RΓ\_{K̃(0,c)/K̃(b,c)}(X̃\_{K̃(b,c)}, V\_λ̃)^ord on which Ũ\_p acts invertibly, and T̃(K̃(b,c),λ̃)^ord := T̃^{S,ord}(RΓ\_{K̃(0,c)/K̃(b,c)}(X̃\_{K̃(b,c)}, V\_λ̃)^ord). Monoids: T(F\_p^+)^+ ⊂ T(F\_p^+) = elements contracting N(O\_{F^+,p}); under T(F\_p^+) = T\_n(F\_p), T(F\_p^+)^+ ⊂ T\_n(F\_p)^+ (strictly for n ≥ 2); Ĩw\_p(b,c) = ∏\_{v̄} Ĩw\_v̄(b,c); Δ̃\_p = Ĩw\_p(b,c) T(F\_p^+)^+ Ĩw\_p(b,c) with its ·\_p-action on V\_λ̃; T(O\_{F^+,p})(b) = T\_n(O\_{F,p})(b); B(O\_{F^+,p})(b) = preimage of T(O\_{F^+,p})(b) in B(O\_{F^+,p}); B(F\_p^+)^+ = N(O\_{F^+,p})·T(F\_p^+)^+.

Prerequisites: `PA.0`; `PA.2` (constructions in this layer); `PF:L0a`; `SR:SR.1`. Source: [ACC](#source-acc), §5.2.19, pp. 1000–1001.

API:

- `UnitaryOrdinaryTower.split_local_factor`: The chosen lift of v̄ identifies its factor with GL\_{2n}(F\_v).
- `UnitaryOrdinaryTower.conjugate_operator`: Ũ\_{vᶜ,i}=Ũ\_{v,2n−i}Ũ\_{v,2n}^{−1}.
- `UnitaryOrdinaryTower.ordinary_operator`: The full contracting double coset is diag(varpi^{2n−1},…,varpi,1).
- `UnitaryOrdinaryTower.coefficient_control`: Boundary and interior tower maps commute with the finite-quotient ordinary projector.

Examples and tests:

- `UnitaryOrdinaryTower.zero_b` (degenerate): The diamond quotient at b=0 is trivial.
- `UnitaryOrdinaryTower.rank_one_contraction` (computation): For n=1 the unitary rank-2 contracting exponents are (1,0), so the ordinary operator is not an empty product.
- `UnitaryOrdinaryTower.proper_cone` (non-example): For n≥2 the unitary positive monoid in the Levi torus is strictly smaller than the GL\_n positive monoid; the Satake map cannot equate the cones.

<a id="ordinary-satake-homomorphism"></a>

**Ordinary Satake homomorphism** (`ordinary_satake_homomorphism`). With the Siegel Levi G ≅ Res\_{O\_F/O\_{F^+}} GL\_n (so T ≅ Res\_{O\_F/O\_{F^+}} T\_n), the unnormalized Satake homomorphism S: T̃^S → T^S of (2.1.8) extends to S: T̃^{S,ord} → T^{S,ord} using O⟦T(O\_{F^+,p})⟧ ≅ O⟦T\_n(O\_{F,p})⟧ and Ũ\_{v,i} ↦ U\_{v^c,n−i} U\_{v^c,n}^{-1} (1 ≤ i ≤ n), Ũ\_{v,i} ↦ U\_{v^c,n}^{-1} U\_{v,i−n} (n+1 ≤ i ≤ 2n); these are double coset operators of elements of T(F\_p^+) and T\_n(F\_p) that match under T(F\_p^+) = T\_n(F\_p). (The assignment respects the relations Ũ\_{v^c,i} = Ũ\_{v,2n−i}Ũ\_{v,2n}^{-1}.)

Prerequisites: `PA.2` (constructions in this layer); `PA.0`; `SR:SR.1`. Source: [ACC](#source-acc), §5.2.19, p. 1001.

<a id="unitary-completed-boundary"></a>

**Unitary completed boundary** (`UnitaryCompletedBoundary`). Fix m ≥ 1; K̃ ⊂ G̃(A^∞\_{F^+}) good with K̃\_v̄ = Ĩw\_v̄ (v̄ ∈ S̄\_p), λ̃ ∈ (Z^{2n}\_+)^{Hom(F^+,E)}. π̃(K̃^p,λ̃,m) := RΓ\_{K̃^p,sm} RΓ(𝔛\_G̃, V\_λ̃/ϖ^m) ∈ D\_sm(O/ϖ^m[Δ̃\_p]) (5.2.20), with T̃^S → End (5.2.21) if K̃^S = G̃(Ô^S\_{F^+}); π̃(K̃^p,m) := RΓ\_{K̃^p,sm} RΓ(𝔛\_G̃, O/ϖ^m) ∈ D\_sm(O/ϖ^m[G̃(F\_p^+)]) with (5.2.22); boundary versions π̃\_∂(K̃^p,λ̃,m) := RΓ\_{K̃^p,sm} RΓ(∂𝔛\_G̃, V\_λ̃/ϖ^m) (5.2.23)–(5.2.24) and π̃\_∂(K̃^p,m) (5.2.25). For c ≥ b ≥ 0, c ≥ 1, canonical T̃^{S,ord}-equivariant isomorphisms RΓ(Ĩw\_p(b,c), π̃(K̃^p,λ̃,m)) ≅ RΓ(X̃\_{K̃(b,c)}, V\_λ̃/ϖ^m) (5.2.26) and RΓ(Ĩw\_p(b,c), π̃\_∂(K̃^p,λ̃,m)) ≅ RΓ(∂X̃\_{K̃(b,c)}, V\_λ̃/ϖ^m) (5.2.27) in D(O/ϖ^m). Ordinary parts: π̃^ord(K̃^p,λ̃,m) = ord RΓ(N(O\_{F^+,p}), π̃(K̃^p,λ̃,m)) and π̃^ord\_∂(K̃^p,λ̃,m) = ord RΓ(N(O\_{F^+,p}), π̃\_∂(K̃^p,λ̃,m)) in D\_sm(O/ϖ^m[T(F\_p^+)]); λ̃ = 0 is omitted from the notation.

Prerequisites: `PA.2` (constructions in this layer); `PA.0`; `mathlib:DerivedCategory`. Source: [ACC](#source-acc), §5.2.19, (5.2.20)–(5.2.27), p. 1002.

API:

- `UnitaryCompletedBoundary.interior`: The interior complex is RΓ\_{K̃^p,sm}RΓ of the unitary arithmetic groupoid.
- `UnitaryCompletedBoundary.boundary`: Replace that groupoid by its Borel–Serre boundary to obtain π̃\_∂.
- `UnitaryCompletedBoundary.finite_level`: Iwahori derived invariants recover the corresponding finite interior and boundary complexes.
- `UnitaryCompletedBoundary.triangle`: The imported compact-support/interior/boundary triangle carries the same commuting Hecke and ordinary actions.

Examples and tests:

- `UnitaryCompletedBoundary.zero_coefficients` (degenerate): All three complexes vanish for the zero coefficient local system.
- `UnitaryCompletedBoundary.boundary_recovery` (compatibility): Finite Iwahori derived invariants of π̃\_∂ give the ALS boundary complex.
- `UnitaryCompletedBoundary.compact_case` (degenerate): When the boundary is empty its completed complex is zero and compact-support equals interior cohomology.

<a id="unitary-ordinary-control"></a>

**Unitary ordinary control** (`unitary_ordinary_control`). Let K̃ ⊂ G̃(A^∞\_{F^+}) be good with K̃\_v̄ = Ĩw\_v̄ for v̄ ∈ S̄\_p and K̃^S = G̃(Ô^S\_{F^+}); c ≥ b ≥ 0 with c ≥ 1. For every λ̃ ∈ (Z^{2n}\_+)^{Hom(F^+,E)} there are T̃^{S,ord}-equivariant isomorphisms RΓ(T(O\_{F^+,p})(b), π̃^ord(K̃^p,λ̃,m)) ≅ RΓ(T(O\_{F^+,p})(b), O(w\_0^G̃ λ̃) ⊗\_O π̃^ord(K̃^p,m)) ≅ RΓ\_{K̃(0,c)/K̃(b,c)}(X̃\_{K̃(b,c)}, V\_λ̃/ϖ^m)^ord, and likewise RΓ(T(O\_{F^+,p})(b), π̃^ord\_∂(K̃^p,λ̃,m)) ≅ RΓ(T(O\_{F^+,p})(b), O(w\_0^G̃ λ̃) ⊗\_O π̃^ord\_∂(K̃^p,m)) ≅ RΓ\_{K̃(0,c)/K̃(b,c)}(∂X̃\_{K̃(b,c)}, V\_λ̃/ϖ^m)^ord, in D\_sm(O/ϖ^m[K̃(0,c)/K̃(b,c)]).

Prerequisites: `PA.2` (constructions in this layer). Source: [ACC](#source-acc), §5.2.19, Proposition 5.2.28, p. 1003.

### Relative Bruhat cells and compact charts

Filter parabolic induction by relative length, using compact charts for the local invariants. Absolute length records local field degrees and determines cohomological shifts; relative length determines the order of the filtration.

<a id="relative-bruhat-cells"></a>

**Relative Bruhat cells** (`RelativeBruhatCells`). For a p-adic place v̄ of F^+: ^rW\_v̄ = W(G̃\_{F^+\_v̄}, T\_{F^+\_v̄}) (≅ S\_{2n}), ^rW\_{P,v̄} = W(G\_{F^+\_v̄}, T\_{F^+\_v̄}) (≅ S\_n × S\_n), ^rW^P\_v̄ ⊂ ^rW\_v̄ the representatives of ^rW\_{P,v̄}\\^rW\_v̄ attached to B\_{F^+\_v̄}; ^rW, ^rW\_P, ^rW^P are the products over v̄ ∈ S̄\_p; ^rW ⊂ W (absolute Weyl group), l\_r = relative length, l = absolute length; w\_0^P = w\_0^G w\_0^G̃, the longest element of W^P (equivalently of ^rW^P), has l(w\_0^P) = [F^+:Q]n^2 and l\_r(w\_0^P) = |S̄\_p|n^2; ρ = half-sum of (Res\_{F^+/Q}B)\_E-positive roots. ^rW is identified with permutation matrices in G̃(F\_p^+) = ∏\_{ṽ∈S̃\_p} GL\_{2n}(F\_ṽ); G̃(F\_p^+) = ⊔\_{w∈^rW^P} P(F\_p^+) w B(F\_p^+) [BT65, Cor. 5.20]. For w ∈ ^rW^P: S\_w = P(F\_p^+) w N(F\_p^+), S\_w° = P(F\_p^+) w N(O\_{F^+,p}) ⊂ S\_w; the closure of S\_w is ⊔\_{w'≤w} S\_{w'} (Bruhat order on ^rW^P), and w' < w ⇒ l\_r(w') < l\_r(w). For i ≥ 0, G̃\_{≥i} = ⊔\_{w∈^rW^P, l\_r(w)≥i} S\_w is open in G̃(F\_p^+), left P(F\_p^+)- and right B(F\_p^+)-invariant.

Prerequisites: `PA.1`; `PA.2` (constructions in this layer); `Tau Ceti ReductiveGroups L7`. Source: [ACC](#source-acc), §5.3, pp. 1003–1004.

API:

- `RelativeBruhatCells.cell`: S\_w=P(F\_p⁺)wN(F\_p⁺), and S\_w° uses N(O\_{F⁺,p}).
- `RelativeBruhatCells.lengths`: Relative length sums one inversion count per p-adic place; absolute length multiplies each by its local degree.
- `RelativeBruhatCells.open_union`: The union of cells of relative length ≥i is open.
- `RelativeBruhatCells.longest`: The longest shuffle has absolute length n²[F⁺:Q] and relative length n²#S̄\_p.

Examples and tests:

- `RelativeBruhatCells.rank_one` (computation): A single split GL₂ factor has relative cell lengths 0 and 1.
- `RelativeBruhatCells.identity_cell` (degenerate): The identity representative has both lengths zero.
- `RelativeBruhatCells.degree_two_place` (non-example): For one p-adic place of local degree 2 and n=1, longest relative length is 1 but absolute length is 2.

<a id="bruhat-cell-induction"></a>

**Bruhat cell induction** (`BruhatCellInduction`). Ind\_{P(F\_p^+)}^{G̃(F\_p^+)}: Mod\_sm(O/ϖ^m[P(F\_p^+)]) → Mod\_sm(O/ϖ^m[G̃(F\_p^+)]) is exact and preserves injectives (right adjoint of the exact restriction). For i ≥ 0, I\_{≥i}: Mod\_sm(O/ϖ^m[P(F\_p^+)]) → Mod\_sm(O/ϖ^m[B(F\_p^+)]), I\_{≥i}(π) = {f: G̃\_{≥i} → π locally constant, compactly supported modulo P(F\_p^+), f(pg) = p f(g) for p ∈ P(F\_p^+), g ∈ G̃\_{≥i}} with B(F\_p^+) acting by right translation; for w ∈ ^rW^P, I\_w(π) is defined the same way with S\_w in place of G̃\_{≥i}; I\_w°: Mod\_sm(O/ϖ^m[P(F\_p^+)]) → Mod\_sm(O/ϖ^m[B(F\_p^+)^+]) sends π to the subspace of I\_w(π) of functions supported in S\_w°.

Prerequisites: `PA.2` (constructions in this layer); `SR:SR.0:derived-extension`; `SR:SR.2`. Source: [ACC](#source-acc), §5.3, pp. 1003–1004.

API:

- `BruhatCellInduction.section`: Sections are locally constant P-equivariant functions with compact support modulo P on the specified cell or open union.
- `BruhatCellInduction.right_action`: B acts by right translation; on the compact chart use B⁺.
- `BruhatCellInduction.restriction`: Restriction to a length-i layer induces the maps in the exact Bruhat-filtration sequence.
- `BruhatCellInduction.compact_inclusion`: Extension by zero includes functions supported in S\_w° into those on S\_w.

Examples and tests:

- `BruhatCellInduction.zero_module` (degenerate): Inducing the zero coefficient module gives zero in each chart.
- `BruhatCellInduction.outside_support` (computation): The extension-by-zero compact-chart section evaluates to zero outside S\_w°.
- `BruhatCellInduction.equivariance` (non-example): A locally constant function violating f(pg)=p f(g) is not a section, even if its support is compact modulo P.

<a id="bruhat-filtration"></a>

**Bruhat filtration** (`bruhat_filtration`). (1) I\_{≥0} = Res^{G̃(F\_p^+)}\_{B(F\_p^+)} ∘ Ind^{G̃(F\_p^+)}\_{P(F\_p^+)}. (2) Each of I\_{≥i}, I\_w, I\_w° is exact. (3) For every i ≥ 0 and π ∈ Mod\_sm(O/ϖ^m[P(F\_p^+)]) there is a functorial exact sequence 0 → I\_{≥i+1}(π) → I\_{≥i}(π) → ⊕\_{w∈^rW^P, l\_r(w)=i} I\_w(π) → 0. Hence for π ∈ D\_sm(O/ϖ^m[P(F\_p^+)]) there is a functorial distinguished triangle I\_{≥i+1}(π) → I\_{≥i}(π) → ⊕\_{l\_r(w)=i} I\_w(π) → I\_{≥i+1}(π)[1] (5.3.2) in D\_sm(O/ϖ^m[B(F\_p^+)]).

Prerequisites: `PA.2` (constructions in this layer). Source: [ACC](#source-acc), §5.3, Proposition 5.3.1 and (5.3.2), pp. 1004–1005.

<a id="bruhat-invariant-filtration"></a>

**Bruhat invariant filtration** (`bruhat_invariant_filtration`). Let π ∈ D\_sm(O/ϖ^m[P(F\_p^+)]) be bounded below, b ≥ 0 and λ̃ ∈ (Z^{2n}\_+)^{Hom(F^+,E)}. For every i ≥ 0 and j ∈ Z the sequence 0 → R^jΓ(B(O\_{F^+,p})(b), O(w\_0^G̃ λ̃) ⊗\_O I\_{≥i+1}(π)) → R^jΓ(B(O\_{F^+,p})(b), O(w\_0^G̃ λ̃) ⊗\_O I\_{≥i}(π)) → R^jΓ(B(O\_{F^+,p})(b), ⊕\_{w∈^rW^P, l\_r(w)=i} O(w\_0^G̃ λ̃) ⊗\_O I\_w(π)) → 0 in Mod(O/ϖ^m[T(F\_p^+)^+\_b]) associated with (5.3.2) is (short) exact.

Prerequisites: `PA.2` (constructions in this layer). Source: [ACC](#source-acc), §5.3, Lemma 5.3.3, pp. 1005–1006.

<a id="bruhat-unipotent-acyclicity"></a>

**Bruhat unipotent acyclicity** (`bruhat_unipotent_acyclicity`). For w ∈ ^rW^P, the functor I\_w° takes injective objects of Mod\_sm(O/ϖ^m[P(F\_p^+)]) to Γ(N(O\_{F^+,p}),−)-acyclic objects.

Prerequisites: `PA.2` (constructions in this layer); `SR:SR.0:derived-extension`. Source: [ACC](#source-acc), §5.3, Lemma 5.3.4(1), p. 1006.

<a id="ordinary-compact-cell-comparison"></a>

**Ordinary compact cell comparison** (`ordinary_compact_cell_comparison`). For w ∈ ^rW^P and π ∈ D\_sm(O/ϖ^m[P(F\_p^+)]) bounded below there is a natural isomorphism ord RΓ(N(O\_{F^+,p}), I\_w°(π)) ≅ ord RΓ(N(O\_{F^+,p}), I\_w(π)); equivalently ord RΓ(N(O\_{F^+,p}), J\_w(π)) = 0 for J\_w = I\_w/I\_w°.

Prerequisites: `PA.2` (constructions in this layer). Source: [ACC](#source-acc), §5.3, Lemma 5.3.4(2), pp. 1006–1007.

### Cell evaluation and orientation

Evaluation at a Bruhat representative identifies the derived compact-unipotent invariants. The orientation character uses the p-adic absolute value as a rational scalar, and the conjugation twist is recorded separately. Together these give each ordinary graded piece.

<a id="bruhat-unipotent-invariants"></a>

**Bruhat unipotent invariants** (`BruhatUnipotentInvariants`). For w ∈ ^rW^P, N\_w := P(F\_p^+) ∩ w N(O\_{F^+,p}) w^{-1}, a compact subgroup of P(F\_p^+) containing N\_n(O\_{F,p}). Γ(N\_w,−): Mod\_sm(O/ϖ^m[P(F\_p^+)]) → Mod\_sm(O/ϖ^m[T(F\_p^+)^+]), with t ∈ T(F\_p^+)^+ acting by t·v = tr\_{t^w N\_w (t^w)^{-1} / N\_w}(t^w v), where t^w = w t w^{-1} (this makes sense since t^w N\_w (t^w)^{-1} = P(F\_p^+) ∩ w t N(O\_{F^+,p}) t^{-1} w^{-1} ⊂ N\_w); moreover w T(F\_p^+)^+ w^{-1} ⊂ T\_n(F\_p)^+.

Prerequisites: `PA.2` (constructions in this layer). Source: [ACC](#source-acc), §5.3, p. 1007.

API:

- `BruhatUnipotentInvariants.subgroup`: N\_w=P∩wN(O)w^{-1}.
- `BruhatUnipotentInvariants.transfer`: For t the transfer uses t^w=wtw^{-1} and the finite-index subgroup t^wN\_w(t^w)^{-1}.
- `BruhatUnipotentInvariants.evaluation`: Evaluation at w identifies the derived compact-cell N-invariants with RΓ(N\_w,π).
- `BruhatUnipotentInvariants.map`: A smooth P-map induces the corresponding invariant and derived invariant maps.

Examples and tests:

- `BruhatUnipotentInvariants.zero` (degenerate): The invariant functor sends the zero module to zero.
- `BruhatUnipotentInvariants.identity_w` (computation): For w=1 the subgroup is P∩N(O).
- `BruhatUnipotentInvariants.index_p_transfer` (non-example): On a trivial F\_p-module a transfer over index p is zero, not the naive identity torus action.

<a id="bruhat-evaluation-comparison"></a>

**Bruhat evaluation comparison** (`bruhat_evaluation_comparison`). For w ∈ ^rW^P and π ∈ D\_sm(O/ϖ^m[P(F\_p^+)]) bounded below there is a natural isomorphism RΓ(N(O\_{F^+,p}), I\_w°(π)) ≅ RΓ(N\_w, π) (compatible with the T(F\_p^+)^+-actions), induced by f ↦ f(w).

Prerequisites: `PA.2` (constructions in this layer). Source: [ACC](#source-acc), §5.3, Lemma 5.3.5 and (5.3.6), pp. 1007–1008.

<a id="bruhat-orientation-character"></a>

**Bruhat orientation character** (`BruhatOrientationCharacter`). For w ∈ ^rW^P, χ\_w: T(F\_p^+) → O^× is χ\_w(t) = N\_{F\_p^+/Q\_p} det\_{F\_p^+}(Ad(t^w)|\_{Lie U(F\_p^+) ∩ w N(F\_p^+) w^{-1}})^{-1} / |N\_{F\_p^+/Q\_p} det\_{F\_p^+}(Ad(t^w)|\_{Lie U(F\_p^+) ∩ w N(F\_p^+) w^{-1}})|\_p. There is an isomorphism O(χ\_w) ≅ O(−ρ + w^{-1} w\_0^P(ρ)) ⊗\_O O(α\_w) of O[T(F\_p^+)]-modules, where w\_0^P = w\_0^G w\_0^G̃ is the longest element of ^rW^P and α\_w: T(F\_p^+) → O^× is trivial on T(O\_{F^+,p}) and agrees with χ\_w on every ι\_v^{-1}(diag(ϖ\_v^{a\_1},…,ϖ\_v^{a\_{2n}})) (a\_i ∈ Z). τ\_w: Mod\_sm(O/ϖ^m[T\_n(F\_p)]) → Mod\_sm(O/ϖ^m[T\_n(F\_p)]) sends π to π with t acting as π(t^{w^{-1}}).

Prerequisites: `PA.2` (constructions in this layer). Source: [ACC](#source-acc), §5.3, p. 1008.

API:

- `BruhatOrientationCharacter.formula`: For a(t)=N det Ad(t^w) on the indicated unipotent Lie space, χ\_w(t)=a(t)^{-1}/|a(t)|\_p.
- `BruhatOrientationCharacter.unit_part`: Its algebraic character is −ρ+w^{-1}w₀^Pρ; α\_w is the residual unramified character.
- `BruhatOrientationCharacter.uniformizer_part`: α\_w is trivial on units and agrees with χ\_w on chosen diagonal uniformizer powers.
- `BruhatOrientationCharacter.twist`: τ\_w precomposes the torus action with t↦t^{w^{-1}}.

Examples and tests:

- `BruhatOrientationCharacter.zero_lie` (degenerate): For a zero-dimensional unipotent Lie space, χ\_w=1.
- `BruhatOrientationCharacter.one_unit` (computation): For a one-dimensional rational root with Ad scalar u∈Z\_p×, χ\_w(u)=u^{-1}.
- `BruhatOrientationCharacter.one_uniformizer` (computation): For the same rational root with scalar p, χ\_w(p)=1 because the p-adic norm factor cancels p^{-1}.

<a id="ordinary-unipotent-degree-shift"></a>

**Ordinary unipotent degree shift** (`ordinary_unipotent_degree_shift`). Let w ∈ ^rW^P and π ∈ D\_sm(O/ϖ^m[G(F\_p^+)]) bounded below. There is a natural isomorphism in D\_sm(O/ϖ^m[T\_n(F\_p)]) ord RΓ(N\_w, Inf\_{G(F\_p^+)}^{P(F\_p^+)} π) ≅ O/ϖ^m(χ\_w) ⊗\_{O/ϖ^m} τ\_w^{-1} ord RΓ(N\_n(O\_{F,p}), π)[−[F^+:Q]n^2 + l(w)].

Prerequisites: `PA.2` (constructions in this layer); `PA.0`. Source: [ACC](#source-acc), §5.3, Lemma 5.3.7, pp. 1008–1010.

<a id="ordinary-bruhat-piece"></a>

**Ordinary Bruhat piece** (`ordinary_bruhat_piece`). Let w ∈ ^rW^P and π ∈ D\_sm(O/ϖ^m[G(F\_p^+)]) bounded below. There is a natural isomorphism in D\_sm(O/ϖ^m[T\_n(F\_p)]) ord RΓ(N(O\_{F^+,p}), I\_w(Inf\_{G(F\_p^+)}^{P(F\_p^+)} π)) ≅ O/ϖ^m(χ\_w) ⊗\_{O/ϖ^m} τ\_{w^{-1}} ord RΓ(N\_n(O\_{F,p}), π)[−[F^+:Q]n^2 + l(w)] (τ\_{w^{-1}} = τ\_w^{-1}).

Prerequisites: `PA.2` (constructions in this layer). Source: [ACC](#source-acc), §5.3, Proposition 5.3.8, pp. 1010–1011.

### Boundary degree shifting with ordinary coefficients

The completed boundary retract gives a map onto the image of the unitary Satake action. Weight choice in rank at least two then moves the needed GL_n degrees to unitary middle degree. All further determinant transfer must respect the inclusion of that image.

<a id="completed-boundary-induction-retract"></a>

**Completed boundary induction retract** (`completed_boundary_induction_retract`). Let K̃ ⊂ G̃(A^∞\_{F^+}) be a good subgroup decomposed with respect to P (K = K̃ ∩ G(A^∞\_{F^+})); let 𝔪 ⊂ T^S be a non-Eisenstein maximal ideal and 𝔪̃ = S^\*(𝔪) ⊂ T̃^S. Then Ind\_{P(F\_p^+)}^{G̃(F\_p^+)} (Inf\_{G(F\_p^+)}^{P(F\_p^+)} π(K^p,m)\_𝔪) is a T̃^S-equivariant direct summand (T̃^S acting through S) of π̃\_∂(K̃^p,m)\_{𝔪̃} in D\_sm(O/ϖ^m[G̃(F\_p^+)]).

Prerequisites: `PA.2` (constructions in this layer); `PA.0`; `SR:SR.2`. Source: [ACC](#source-acc), §5.4, Theorem 5.4.1, pp. 1011–1013.

<a id="ordinary-boundary-degree-shifting"></a>

**Ordinary degree shifting** (`ordinary_boundary_degree_shifting`). Let K̃ be good, decomposed with respect to P, with K̃\_v̄ = Ĩw\_v̄ for v̄ ∈ S̄\_p. Let λ̃ ∈ (Z^{2n}\_+)^{Hom(F^+,E)}, w ∈ ^rW^P, λ\_w = w(λ̃+ρ) − ρ ∈ (Z^n\_+)^{Hom(F,E)}; 𝔪 ⊂ T^S non-Eisenstein, 𝔪̃ = S^\*(𝔪); c ≥ b ≥ 0 with c ≥ 1. Then for every j ∈ Z, S descends to a homomorphism, surjective onto the image of T̃^{S,ord} acting through S, T̃^{S,ord}(H^j(∂X̃\_{K̃(b,c)}, V\_λ̃)^ord\_{𝔪̃}) → T^{S,ord}(O(α\_{w\_0^G w w\_0^G̃}) ⊗\_O τ^{-1}\_{w\_0^G w w\_0^G̃} H^{j−l(w)}(X\_{K(b,c)}, V\_{λ\_w})^ord\_𝔪).

Prerequisites: `PA.2` (constructions in this layer). Source: [ACC](#source-acc), §5.4, Theorem 5.4.3, pp. 1013–1015.

<a id="ordinary-ctg-weight-choice"></a>

**Ordinary ctg weight choice** (`ordinary_ctg_weight_choice`). Notation: for λ ∈ (Z^n\_+)^{Hom(F,E)} and a ∈ Z, λ(a)\_{τ,i} = λ\_{τ,i} + a. Assume n ≥ 2. Fix m ≥ 1. There is λ ∈ (Z^n\_+)^{Hom(F,E)} such that (1) O(λ)/ϖ^m ≅ O/ϖ^m as T\_n(F\_p)-modules; (2) Σ\_{i=1}^n (λ\_{τ,i} + λ\_{τc,i}) is independent of τ ∈ Hom(F,E); (3) for each i = 0,…,n^2 there are w\_i = (w\_{i,v̄})\_{v̄∈S̄\_p} ∈ ^rW^P, a\_i ∈ (p−1)Z and a dominant λ̃\_i ∈ (Z^{2n}\_+)^{Hom(F^+,E)} with (a) λ̃\_i CTG (Definition 4.3.5); (b) l\_r(w\_{i,v̄}) = n^2 − i for every v̄ ∈ S̄\_p, hence l(w\_i) = [F^+:Q](n^2 − i); (c) w\_i(λ̃\_i + ρ) − ρ = λ(a\_i). Construction: M > 16n divisible by 8(p−1)·#(O/ϖ^m)^×; λ\_τ = (−nM, −2nM, …, −n^2M) if τ ∈ Ĩ\_p and (0, −M, …, (1−n)M) if τc ∈ Ĩ\_p, so λ̃(a) = ((n−1)M − a, …, −a, −nM + a, …, −n^2M + a); for i > 0, w\_{i,v̄} = σ\_{X\_i}, X\_i = {x+1,…,x+r, x+r+2,…,x+n+1} with nx + n − r = n^2 − i, 1 ≤ r ≤ n; a\_i = the unique integer in [(nx+2n−r−1)M/2, (nx+2n−r)M/2] congruent to M/8 mod M/2; λ̃\_i = w\_i^{-1}(λ̃(a\_i) + ρ) − ρ. At i = 0 take the block-exchange shuffle (n+1, …, 2n, 1, …, n), with x = r = n. Verify dominance at the boundary between its two nonempty blocks.

Prerequisites: `PA.1`; `PA.2` (constructions in this layer). Source: [ACC](#source-acc), §5.4, Lemma 5.4.8 and (5.4.9)–(5.4.12), pp. 1015–1017.

<a id="ordinary-middle-degree-quotient"></a>

**Ordinary middle degree quotient** (`ordinary_middle_degree_quotient`). Suppose [F^+:Q] > 1 and n ≥ 2, and fix m ≥ 1. There exist a dominant λ ∈ (Z^n\_+)^{Hom(F,E)} on whose V\_λ a finite-index subgroup of O\_F^× acts trivially and, for each i = 0,…,n^2−1, a CTG dominant weight λ̃\_i ∈ (Z^{2n}\_+)^{Hom(F^+,E)}, an integer a\_i divisible by p−1 and w\_i ∈ ^rW^P, such that for every good K̃ ⊂ G̃(A^∞\_{F^+}) decomposed with respect to P with K̃\_v̄ = Ĩw\_v̄ (v̄ ∈ S̄\_p), all integers c ≥ b ≥ 0 with c ≥ 1, and every non-Eisenstein 𝔪 ⊂ T^S with ρ̄\_{𝔪̃} decomposed generic (𝔪̃ = S^\*(𝔪)): (1) O(λ)/ϖ^m ≅ O/ϖ^m as O[T(F\_p^+)]-modules; (2) for each i = 0,…,n^2−1, S descends to an algebra homomorphism T̃^{S,ord}(H^d(X̃\_{K̃(b,c)}, V\_{λ̃\_i})^ord\_{𝔪̃}) → T^{S,ord}(O(α\_{w\_i}) ⊗\_O τ\_{w\_i}^{-1} H^{i[F^+:Q]}(X\_{K(b,c)}, V\_{λ(a\_i)})^ord\_𝔪), where d = [F^+:Q]n^2.

Prerequisites: `PA.2` (constructions in this layer); `IG:IG.7`. Source: [ACC](#source-acc), §5.4, Proposition 5.4.13, pp. 1017–1018.

### The determinant torus and all degrees

The determinant quotient has an archimedean component of dimension f−1. After a suitable neat-level shrinking, its cohomology separates from the determinant-one factor. The exterior grading supplies the remaining shifts with a Hecke-trivial torus action.

<a id="determinant-torus"></a>

**Determinant torus** (`DeterminantTorus`). For a good K ⊂ GL\_n(A\_F^∞), define A\_K = F^×\\A\_F^×/det(K) det(K\_∞) R\_{>0}, with identity component A\_K°. Mapping to F^×\\A\_F^×/det(K) F\_∞^× expresses this quotient as a real torus extension of the ray class group. The torus has dimension [F⁺:Q]−1, and its cocharacters are the lattice F^×∩det(K), a torsion-free congruence subgroup of O\_F^×. Set Γ\_{g,K}=GL\_n(F)∩gKg^{−1} for g∈GL\_n(A\_F^∞). The dimensions are dim X\_K=d−1=[F⁺:Q]n²−1 and dim A\_K=[F⁺:Q]−1.

Prerequisites: `PA.0`. Source: [ACC](#source-acc), §5.4, pp. 1018, 1020.

API:

- `DeterminantTorus.quotient`: The quotient is F×\\A\_F×/(det K·det K∞·R\_{>0}).
- `DeterminantTorus.component`: The identity component A\_K° is the real torus of dimension [F⁺:Q]−1.
- `DeterminantTorus.determinant_map`: Determinant X\_K→A\_K induces the ray-class identification of connected components.
- `DeterminantTorus.level_change`: Inclusion K′⊂K induces the quotient map A\_{K′}→A\_K and commutes with determinant.

Examples and tests:

- `DeterminantTorus.imaginary_quadratic` (computation): For [F⁺:Q]=1 the identity component has dimension zero.
- `DeterminantTorus.degree_two` (computation): For [F⁺:Q]=2 the identity component has dimension one.
- `DeterminantTorus.not_whole_class_group` (non-example): For [F⁺:Q]>1 the quotient has a positive-dimensional torus; replacing it by the finite ray-class group loses that component.

<a id="determinant-component-product"></a>

**Determinant component product** (`determinant_component_product`). (2) det: X\_K → A\_K is continuous and induces a bijection on sets of connected components (equivalently det: G(F^+)\\G(A^∞\_{F^+})/K → F^×\\(A\_F^∞)^×/det(K) is bijective, by strong approximation for Res\_{F/F^+} SL\_n). (3) If g ∈ GL\_n(A\_F^∞) satisfies det(Γ\_g) = det(F^× ∩ K) and Γ\_g^1 = SL\_n(F) ∩ Γ\_g, then the product map Γ\_g^1 × (F^× ∩ K) → Γ\_g is a group isomorphism; writing X = X^1 × (∏\_{v|∞} R\_{>0})/R\_{>0} with X^1 = SL\_n(F\_∞)/∏\_{v|∞} SU(n), one gets Γ\_g\\X = (Γ\_g^1\\X^1) × (F^× ∩ K)\\(∏\_{v|∞} R\_{>0})/R\_{>0}. (4) Under the same hypothesis det: F^× ∩ K → F^× ∩ det(K) is an isomorphism, the composite Γ\_g\\X ↪ X\_K → A\_K is (x,z) ↦ det(g) z^n, and z ↦ det(g) z^n is an isomorphism from (F^× ∩ K)\\(∏\_{v|∞} R\_{>0})/R\_{>0} onto the connected component A\_K^{[det(g)]} of A\_K containing [det(g)]. (K is neat.)

Prerequisites: `PA.2` (constructions in this layer); `ALS:ALS.4`. Source: [ACC](#source-acc), §5.4, Lemma 5.4.14(2)–(4), pp. 1018–1019.

<a id="determinant-neat-level-shrinking"></a>

**Determinant neat level shrinking** (`determinant_neat_level_shrinking`). Let K be a good subgroup of G(A^∞\_{F^+}) = GL\_n(A\_F^∞) and T a finite set of finite places of F. There is a good normal subgroup K' ⊂ K with K'\_T = K\_T such that det(Γ\_{g,K'}) = det(F^× ∩ K') for all g ∈ GL\_n(A\_F^∞). Construction: an ideal 𝔞 of O\_F prime to T with ker(O\_F^× → (O\_F/𝔞)^×) torsion-free and contained in F^× ∩ K (Chevalley [Che51, Th. 1]); an ideal 𝔟 prime to 𝔞 and T with ker(O\_F^× → (O\_F/𝔞𝔟)^×) ⊂ (ker(O\_F^× → (O\_F/𝔞)^×))^n; K' = ker(O\_F^× → (O\_F/𝔞)^×)·K(𝔞𝔟), K(𝔞𝔟) = K ∩ (principal congruence subgroup of level 𝔞𝔟).

Prerequisites: `PA.2` (constructions in this layer). Source: [ACC](#source-acc), §5.4, Lemma 5.4.15, pp. 1019–1020.

<a id="central-torus-cohomology-shifting"></a>

**Central torus cohomology shifting** (`central_torus_cohomology_shifting`). Let K = K(b, c) ⊂ GL\_n(A\_F^∞) be good with K\_v = Iw\_v(b, c) for v | p and λ ∈ (Z^n\_+)^{Hom(F,E)}, and suppose (1) det(Γ\_g) = det(F^× ∩ K) for all g ∈ GL\_n(A\_F^∞) and (2) F^× ∩ K acts trivially on V\_λ. Then R det\_\*(V\_λ) is constant on each connected component of A\_K and R det\_\*(V\_λ) = ⊕\_{i=0}^{dim X^1} R^i det\_\*(V\_λ)[−i]; there is a T^{S,ord}-equivariant isomorphism of graded O-modules ⊕\_{i=0}^{dim X\_K} H^i(X\_K, V\_λ) ≅ (⊕\_{j=0}^{dim A\_K°} H^j(A\_K°, O)) ⊗\_O (⊕\_{k=0}^{dim X^1} H^0(A\_K, R^k det\_\*(V\_λ))) (5.4.17), with trivial Hecke action on the first factor. Consequently the image of T^{S,ord} in End\_O(⊕\_{i=0}^{dim X\_K} H^i(X\_K, V\_λ)) equals its image in End\_O(⊕\_{i=0}^{n^2−1} H^{i[F^+:Q]}(X\_K, V\_λ)).

Prerequisites: `PA.2` (constructions in this layer); `ALS:ALS.4`. Source: [ACC](#source-acc), §5.4, Lemma 5.4.16 and (5.4.17), pp. 1020–1021.

<a id="all-degree-ordinary-characteristic-data"></a>

**All degree ordinary characteristic data** (`all_degree_ordinary_characteristic_data`). Suppose [F^+:Q] > 1. Let K ⊂ GL\_n(A\_F^∞) be good with K\_v = Iw\_v for v ∈ S\_p; c ≥ b ≥ 0 with c ≥ 1; m ≥ 1; 𝔪 ⊂ T^S non-Eisenstein, 𝔪̃ = S^\*(𝔪). Suppose (1) ρ̄\_𝔪 is decomposed generic; (2) for every finite v ∉ S with residue characteristic l, either S contains no l-adic place of F and l is unramified in F, or l splits in some imaginary quadratic F\_0 ⊂ F. Then there are λ ∈ (Z^n\_+)^{Hom(F,E)} and N ≥ 1 depending only on [F^+:Q] and n such that (1) O(λ)/ϖ^m ≅ O/ϖ^m as O[T(F\_p^+)]-modules; (2) for each i = 0,…,d−1 there are a nilpotent ideal J\_i ⊂ T^{S,ord}(H^i(X\_{K(b,c)}, V\_λ)^ord\_𝔪) with J\_i^N = 0 and a continuous ρ\_𝔪: G\_{F,S} → GL\_n(T^{S,ord}(H^i(X\_{K(b,c)}, V\_λ)^ord\_𝔪)/J\_i) with (a) det(X − ρ\_𝔪(Frob\_v)) = image of P\_v(X) for v ∉ S; (b) for v | p and g ∈ G\_{F\_v}, det(X − ρ\_𝔪(g)) = ∏\_{j=1}^n (X − χ\_{λ,v,j}(g)); (c) for v | p and g\_1,…,g\_n ∈ G\_{F\_v}, ρ\_𝔪 maps (g\_1 − χ\_{λ,v,1}(g\_1))⋯(g\_n − χ\_{λ,v,n}(g\_n)) to 0 in M\_n(…/J\_i).

Prerequisites: `PA.2` (constructions in this layer); `mathlib:Matrix.charpoly`; `CS:R24.5`. Source: [ACC](#source-acc), §5.4, Proposition 5.4.18 and (5.4.19)–(5.4.23), pp. 1022–1026.

<a id="ordinary-local-global"></a>

**Ordinary local–global compatibility** (`ordinary_local_global`). Assume the §5 standing hypotheses (F contains an imaginary quadratic field in which p splits; ϖ\_{v^c} = ϖ\_v^c) and [F^+:Q] > 1. Let K ⊂ GL\_n(A\_F^∞) be a good subgroup with K\_v = Iw\_v for each v ∈ S\_p (and K\_v = GL\_n(O\_{F\_v}) for v ∉ S), let c ≥ b ≥ 0 be integers with c ≥ 1, let λ ∈ (Z^n\_+)^{Hom(F,E)} be a dominant weight, and let 𝔪 ⊂ T^S(K(b,c),λ)^ord be a non-Eisenstein maximal ideal. Suppose (1) for every finite place v ∉ S with residue characteristic l, either S contains no l-adic place of F and l is unramified in F, or there is an imaginary quadratic F\_0 ⊂ F in which l splits; (2) ρ̄\_𝔪 is decomposed generic. There is a bound N=N(n,[F⁺:Q])≥1 and an ideal J ⊂ T^S(K(b,c),λ)^ord\_𝔪 with J^N = 0, and a continuous ρ\_𝔪: G\_{F,S} → GL\_n(T^S(K(b,c),λ)^ord\_𝔪/J) such that: (a) for every finite v ∉ S, det(X − ρ\_𝔪(Frob\_v)) is the image of P\_v(X); (b) for every v ∈ S\_p and g ∈ G\_{F\_v}, det(X − ρ\_𝔪(g)) = ∏\_{i=1}^n (X − χ\_{λ,v,i}(g)); (c) for every v ∈ S\_p and g\_1,…,g\_n ∈ G\_{F\_v}, (ρ\_𝔪(g\_1) − χ\_{λ,v,1}(g\_1))(ρ\_𝔪(g\_2) − χ\_{λ,v,2}(g\_2))⋯(ρ\_𝔪(g\_n) − χ\_{λ,v,n}(g\_n)) = 0.

Prerequisites: `PA.2` (constructions in this layer); `mathlib:Matrix.charpoly`; `CS:R24.5`. Source: [ACC](#source-acc), §5.1, Theorem 5.5.1, p. 991; restated and proved in §5.5, pp. 1026–1027.

Concrete checks:

- For n=2 the ordered identity is (ρ(g₁)−χ₁(g₁))(ρ(g₂)−χ₂(g₂))=0 for arbitrary distinct arguments g₁,g₂; a factorization only at one g is insufficient.

### Automorphic ordinarity and Galois flags

Ordinarily automorphic means that an automorphic witness has a nonzero ordinary Hecke eigenspace. The ordered Galois flag is a subsequent consequence under its residual hypotheses. Construct the automorphic-witness predicate first; its `local_flag` API is supplied by the later flag theorem. The soluble-transport input in PA.5 is an independent prerequisite for the final field reduction.

<a id="iota-ordinary-automorphic-representation"></a>

**ι-ordinary automorphic representation** (`IotaOrdinary`). Let F be a number field (in the applications imaginary CM or totally real), l a prime, ι: Q̄\_l ≅ ℂ, and π a regular algebraic automorphic representation of GL\_n(𝔸\_F) of weight a ∈ (ℤⁿ₊)^{Hom(F,ℂ)}: π\_∞ has the infinitesimal character of Ξ\_a^∨ (AG2.0); for λ = ι^{-1}a ∈ (ℤⁿ₊)^{Hom(F,Q̄\_l)} this is ACC’s weight ιλ, and HT\_τ(r\_{l,ι}(π)) = {λ\_{τ,i}+n−i} when r\_{l,ι}(π) exists. Fix a place v | l, a uniformizer ϖ\_v and b ≥ 1, and let Iw(v^{b,b}) = Iw\_v(b,b) ⊂ GL\_n(O\_{F\_v}) be the subgroup of matrices that are upper triangular unipotent modulo ϖ\_v^b (PA.2/iwahori-level-tower). On (ι^{-1}π\_v)^{Iw(v^{b,b})} the double-coset operators U^{(j)}\_{ϖ\_v} = [Iw(v^{b,b}) diag(ϖ\_v·1\_j, 1\_{n−j}) Iw(v^{b,b})], j = 1,…,n, commute, and the weight-normalized operators are U^{(j)}\_{λ,ϖ\_v} = (∏\_{τ:F\_v↪Q̄\_l} ∏\_{i=1}^{j} τ(ϖ\_v)^{−λ\_{τ,n−i+1}}) U^{(j)}\_{ϖ\_v}. The ordinary part (ι^{-1}π\_v)^{Iw(v^{b,b}),ord} is the maximal subspace stable under every U^{(j)}\_{λ,ϖ\_v} on which all their eigenvalues are l-adic units; it does not depend on ϖ\_v. π is ι-ordinary at v if this ordinary part is nonzero for some b ≥ 1, and π is ι-ordinary if it is ι-ordinary at every v | l. The diagonal torus T\_n(O\_{F\_v}) normalizes Iw(v^{b,b}) and its diamond operators ⟨u⟩ commute with the U^{(j)}\_{λ,ϖ\_v}; their common eigenvalues on a nonzero ordinary part are the data u^{(i)}\_{λ,ϖ\_v} and ⟨u⟩\_{ι,i} of Geraghty’s Definition 5.5 used in ACC Corollary 5.5.2. No polarization is assumed; for polarized π this is the notion BLGGT and the Part II PL.0 use.

Prerequisites: `PA.2` (constructions in this layer); `SR:SR.1`; `AG:AG2.0`. Source: [BLGGT](#source-blggt-published), §2.1, definition of ι-ordinary, p. 537 (PDF p. 37); [BLGGT (preprint)](#source-blggt), §2.1, definition of ι-ordinary, and PDF p. 33; [Qian](#source-qian), Definition 1.3, p. 1241 (NSF PDF p. 3), citing Geraghty Definition 5.3.

API:

- `IotaOrdinary.normalizedOperator`: U^{(j)}\_{λ,ϖ\_v} = (∏\_{τ:F\_v↪Q̄\_l} ∏\_{i=1}^{j} τ(ϖ\_v)^{−λ\_{τ,n−i+1}}) U^{(j)}\_{ϖ\_v} on (ι^{-1}π\_v)^{Iw(v^{b,b})}; these operators commute.
- `IotaOrdinary.ordinaryPart`: The maximal subspace of (ι^{-1}π\_v)^{Iw(v^{b,b})} stable under all U^{(j)}\_{λ,ϖ\_v} with only l-adic unit eigenvalues; it is the sum of the common generalized unit eigenspaces.
- `IotaOrdinary.uniformizer_independent`: For ϖ\_v′=uϖ\_v the normalized j-th operator changes by the weight unit ∏\_τ∏\_{i=1}^j τ(u)^{−λ\_{τ,n−i+1}} times the commuting diamond operator ⟨diag(u·1\_j,1\_{n−j})⟩. The diamond order divides the exponent of (O\_{F\_v}/ϖ\_v^b)^×; both factors have unit eigenvalues, so the ordinary part and ι-ordinarity are unchanged.
- `IotaOrdinary.level_independent`: π is ι-ordinary at v if and only if for some c ≥ b ≥ 0 with c ≥ 1 the Iw\_v(b,c)-invariants contain a common eigenvector of all U^{(j)}\_{λ,ϖ\_v} with unit eigenvalues (the formulation cited from Geraghty’s Definition 5.3).
- `IotaOrdinary.iff_local`: ι-ordinarity at v depends only on ι, π\_v and the weights λ\_τ for the embeddings τ inducing v.
- `IotaOrdinary.twist`: For an algebraic Hecke character ψ of F, π is ι-ordinary if and only if π ⊗ (ψ∘det) is ι-ordinary (with its shifted weight).

Examples and tests:

- `IotaOrdinary.gl_one` (computation): For n = 1 every algebraic Hecke character χ of weight λ is ι-ordinary at every v | l: on the one-dimensional space the normalized operator acts by ι^{-1}χ\_v(ϖ\_v)·∏\_{τ:F\_v↪Q̄\_l} τ(ϖ\_v)^{−λ\_τ}, which is the value of the l-adic character r\_{l,ι}(χ) at Art\_{F\_v}(ϖ\_v), an l-adic unit.
- `IotaOrdinary.supersingular` (non-example): Let π be the cuspidal representation of GL\_2(𝔸\_Q) of weight (0,0) attached to an elliptic curve E/Q with good reduction at l ≥ 5 and a\_l(E) = 0. The eigenvalues of U^{(1)}\_{λ,l} on π\_l^{Iw(l^{1,1})} are the two roots of X² − a\_l(E)X + l = X² + l, of l-adic valuation 1/2, so π is not ι-ordinary at l.
- `IotaOrdinary.unnormalized_fails` (non-example): Omitting the weight normalization is wrong: for n = 1, F\_v = Q\_l and an algebraic Hecke character of weight λ\_τ = 3 at the embedding inducing v, the unnormalized eigenvalue ι^{-1}χ\_v(l) has l-adic valuation 3, although χ is ι-ordinary.
- `IotaOrdinary.finite_twist` (compatibility): For a finite-order Hecke character ψ, π ⊗ (ψ∘det) has the same weight and the normalized U^{(j)} eigenvalues of π multiplied by the roots of unity ψ\_v(ϖ\_v)^j on the same Iw(v^{b,b})-invariants once b exceeds the conductor of ψ\_v; hence it is ι-ordinary exactly when π is.
- `IotaOrdinary.tame_uniformizer_change` (non-example): Take n=1, F=ℚ, l=5, b=1, weight zero and a quartic finite-order Hecke character of conductor 5. On its Iw(5^{1,1})-invariants, changing the uniformizer 5 to 10 multiplies the operator by the character value at 2, a primitive fourth root of unity. The diamond operator therefore has order 4, not dividing b=1; ordinarity is unchanged.

<a id="ordinarily-automorphic-representation"></a>

**Ordinarily automorphic representation** (`OrdinarilyAutomorphic`). Let E be an imaginary CM or totally real field, l a prime and ι: Q̄\_l ≅ ℂ. For an attached representation r\_{l,ι}(π) supplied with its attachment contract, a continuous representation r: G\_E → GL\_n(Q̄\_l) is ι-ordinarily automorphic (of weight ιλ) if r ≅ r\_{l,ι}(π) for a regular algebraic cuspidal automorphic representation π of GL\_n(𝔸\_E) (of weight ιλ) that is ι-ordinary at every place v | l (PA.2/iota-ordinary-automorphic-representation). A residual representation r̄: G\_E → GL\_n(F̄\_l) is ι-ordinarily automorphic if it has a lift r ≅ r\_{l,ι}(π) with π regular algebraic cuspidal and ι-ordinary at every v | l. This is a condition on Hecke eigenvalues of π\_v, not on r|G\_{E\_v}: ordinarity of r|G\_{E\_v} for v | l does not replace it (Qian Remark 4.4, whose deduction of automorphic ordinarity uses polarizability). The conclusion of ACC Theorem 6.1.2 is that ρ is ι-ordinarily automorphic of weight ιλ.

Prerequisites: `PA.2` (constructions in this layer); `AG:AG2.6`; `AG:AG2.7`; `AG:AG2.0`. Source: [Qian](#source-qian), Definition 1.3, p. 1241 (NSF PDF p. 3).

API:

- `OrdinarilyAutomorphic.lift`: A witness consists of a regular algebraic cuspidal π, ι-ordinary at every v | l, and an isomorphism r ≅ r\_{l,ι}(π).
- `OrdinarilyAutomorphic.residual`: If r is ι-ordinarily automorphic then so is its semisimplified reduction r̄, with the same witness π.
- `OrdinarilyAutomorphic.twist`: For χ=r\_{l,ι}(ψ) supplied as the l-adic realization of an algebraic Hecke character ψ of E, with the attachment/tensor compatibility, r is ι-ordinarily automorphic if and only if r ⊗ χ is, with the shifted weight.
- `OrdinarilyAutomorphic.local_flag`: For E imaginary CM, if r is ι-ordinarily automorphic of weight ιλ and r̄ is irreducible and decomposed generic, then r|G\_{E\_v} is ordinary of weight λ for every v | l by PA.2/ordinary-automorphic-galois-flag (ACC Corollary 5.5.2). This API item does not assert a totally real local–global theorem.

Examples and tests:

- `OrdinarilyAutomorphic.gl_one` (computation): For n = 1, the l-adic realization r\_{l,ι}(χ) of an algebraic Hecke character χ is ι-ordinarily automorphic, by IotaOrdinary.gl\_one.
- `OrdinarilyAutomorphic.supersingular` (non-example): H¹\_ét(E\_{Q̄}, Q̄\_l) for E/Q with good reduction at l ≥ 5 and a\_l(E) = 0 is automorphic but not ι-ordinarily automorphic: by strong multiplicity one the only π with r\_{l,ι}(π) ≅ H¹(E) is the one attached to E, which is not ι-ordinary at l.
- `OrdinarilyAutomorphic.ordinary_curve` (computation): For E/Q with good ordinary reduction at l ≥ 3 (a\_l(E) an l-adic unit), H¹\_ét(E\_{Q̄}, Q̄\_l) is ι-ordinarily automorphic: the Iwahori U\_l-eigenvalues of the attached π\_l are the two roots of X² − a\_l(E)X + l, exactly one of which is a unit.

<a id="twisted-steinberg-ordinarity-criterion"></a>

**Twisted steinberg ordinarity criterion** (`twisted_steinberg_ordinarity_criterion`). Use geometric Artin reciprocity and HT(ε\_l) = {−1}. Let F be a CM field, l a prime, ι: Q̄\_l ≅ ℂ, v | l a place of F with uniformizer ϖ\_v, and π a regular algebraic cuspidal automorphic representation of GL\_n(𝔸\_F) of weight ιλ in the ACC convention with λ\_{τ,i} = c\_τ for all i = 1,…,n and all τ: F\_v ↪ Q̄\_l (so HT\_τ(r\_{l,ι}(π)) = {c\_τ, c\_τ+1, …, c\_τ+n−1}). Suppose π\_v ≅ Sp\_n(ψ\_v|·|\_v^{(1−n)/2}) for an unramified character ψ\_v of F\_v^×, and val\_l(ι^{-1}ψ\_v(det α^{(j)}\_{ϖ\_v})) = val\_l(∏\_{τ:F\_v↪Q̄\_l} τ(ϖ\_v)^{+jc\_τ}) for every 0 ≤ j ≤ n, where α^{(j)}\_{ϖ\_v} = diag(ϖ\_v·1\_j, 1\_{n−j}). Then π is ι-ordinary at v. Since det α^{(j)}\_{ϖ\_v} = ϖ\_v^j, the condition for j = n implies it for every j. Geraghty’s Lemma 5.6 is the weight-zero case.

Prerequisites: `PA.2` (constructions in this layer); `SR:SR.1`. Source: [Qian](#source-qian), Proof of Lemma 4.3, second paragraph, p. 1273 (NSF PDF p. 35), citing Geraghty Lemmas 5.2 and 5.6.

Concrete checks:

- For n = 1 the criterion is IotaOrdinary.gl\_one: an unramified character ψ\_v with the displayed valuation is ι-ordinary.
- With c\_τ = 0 the hypothesis is val\_l(ι^{-1}ψ\_v(ϖ\_v)^n) = 0, which the central-character identity gives automatically (r\_{l,ι}(φ\_π) then has Hodge–Tate weight 0); this recovers the weight-zero Steinberg remark of BLGGT §2.1 (Geraghty Lemma 5.1.5). Complex unitarity of ψ\_v alone does not give the l-adic condition.

<a id="iota-ordinary-soluble-base-change"></a>

**Iota ordinary soluble base change** (`iota_ordinary_soluble_base_change`). Let F be imaginary CM or totally real, E/F a finite soluble Galois extension with E imaginary CM or totally real, ι: Q̄\_p ≅ ℂ, and π, π\_E regular algebraic cuspidal automorphic representations of GL\_n(𝔸\_F), GL\_n(𝔸\_E) of weights ιλ and ιλ\_E (λ\_{E,τ} = λ\_{τ|F}) with rec\_{E\_w}(π\_{E,w}) ≅ rec\_{F\_v}(π\_v)|\_{W\_{E\_w}} for every finite place w | v (as produced by PA.5/soluble-base-change-and-descent). Then π\_E is ι-ordinary at w | p if π is ι-ordinary at v = w|\_F, and π is ι-ordinary at v if π\_E is ι-ordinary at the places w | v. If every p-adic place of F splits completely in E then π\_{E,w} ≅ π\_v and λ\_E at w is λ at v, so the equivalence at w is immediate from IotaOrdinary.iff\_local; this is the case of ACC’s proof of Corollary 5.5.2.

Prerequisites: `PA.2` (constructions in this layer); `PA.5`. Source: [ACC](#source-acc), §6.6.10, proof of Theorem 6.1.2, p. 1084; proof of Corollary 5.5.2, p. 1028.

Concrete checks:

- If E/F is split at every p-adic place, ι-ordinarity of π at v and of π\_E at each w | v coincide.
- No ι-ordinarity is asserted for a base change that is not cuspidal; irreducibility of r\_ι(π)|G\_E is a hypothesis of the supplier theorem.

<a id="ordinary-automorphic-galois-flag"></a>

**Ordinary Galois filtration** (`ordinary_automorphic_galois_flag`). Let F be an imaginary CM field (the §5 standing hypotheses are dropped), ι: Q̄\_p ≅ C, and π a cuspidal automorphic representation of GL\_n(A\_F), regular algebraic of weight ιλ with λ ∈ (Z^n\_+)^{Hom(F,Q̄\_p)}. Suppose (1) π is ι-ordinary at every v ∈ S\_p (PA.2/iota-ordinary-automorphic-representation; [Ger19, Def. 5.3]); (2) r̄\_ι(π) is decomposed generic and irreducible. Then for every v ∈ S\_p, r\_ι(π)|\_{G\_{F\_v}} is ordinary of weight λ ([Ger19, §5.2]): r\_ι(π)|\_{G\_{F\_v}} is conjugate to an upper-triangular representation with diagonal characters ψ\_{v,1},…,ψ\_{v,n}, where ψ\_{v,i}(Art\_{F\_v}(u)) = ε^{1−i}(Art\_{F\_v}(u)) ∏\_{τ∈Hom\_{Q\_p}(F\_v,Q̄\_p)} τ(u)^{−(w\_0^G λ)\_{τ,i}} ⟨u⟩\_{ι,i} (u ∈ O\_{F\_v}^×) and ψ\_{v,i}(Art\_{F\_v}(ϖ\_v)) = ε^{1−i}(Art\_{F\_v}(ϖ\_v)) u^{(i)}\_{λ,ϖ\_v}/u^{(i−1)}\_{λ,ϖ\_v}, with ⟨u⟩\_{ι,i}, u^{(i)}\_{λ,ϖ\_v} the Hecke eigenvalues on the ordinary part (ι^{-1}π\_v)^ord of IotaOrdinary.ordinaryPart ([Ger19, Def. 5.5]).

Prerequisites: `PA.2` (constructions in this layer); `PA.5`; `mathlib:Matrix.charpoly`; `LGD:L7`. Source: [ACC](#source-acc), §5.5, Corollary 5.5.2, p. 1028.

## PA.3 — Arithmetic deformation and support inputs

### Deformation actions on arithmetic Hecke algebras

Attach the universal representations only after verifying their local deformation conditions. Both maps land in Hecke algebras modulo a uniformly nilpotent ideal. The ordinary complex retains the full torus algebra and its weight normalization.

<a id="local-condition-mod-varpi-comparison"></a>

**Local-condition comparison** (`local_condition_mod_varpi_comparison`). Under either full good-level hypothesis profile, choose pairwise distinct characters χ\_{v,i}:k(v)×→O× at every v∈R, all congruent to 1 modulo varpi. The untwisted and χ-twisted coefficient complexes have a Hecke-equivariant derived isomorphism modulo varpi, and their finite local/global deformation rings reduce to the same deformation problem. At p the FL condition or the ordinary flag/determinant condition is identical on the two sides; away from p the R08.2 unipotent/inertial-type reductions supply the comparison. Framing conventions and coefficient maps are the same on both sides. The global determinant varies, as in the source deformation problems; the ordinary local determinant condition is retained. A separate globally fixed-determinant variant requires its own presentation and dimension counts.

Prerequisites: `PA.0`; `LGD:R08.2`; `LGD:L8`; `LGD:L7`; `GGD:G8`. Source: [ACC](#source-acc), §6.5.1, pp. 1062, 1068–1069 (variable-determinant Sχ and reduced coefficient comparison); §6.6.1, equation (6.6.4), p. 1077.

<a id="fontaine-laffaille-deformation-hecke-map"></a>

**Fontaine–Laffaille deformation action** (`fontaine_laffaille_deformation_hecke_map`). Under §6.5.1, for each χ as above there are an integer δ ≥ 1 depending only on n and [F:ℚ], an ideal J ⊂ T^S(RΓ(X\_K, 𝒱\_λ(χ^{-1})))\_𝔪 with J^δ = 0, and a continuous surjection f\_{𝒮\_χ}: R\_{𝒮\_χ} → T^S(RΓ(X\_K, 𝒱\_λ(χ^{-1})))\_𝔪/J such that for every finite place v ∉ S the characteristic polynomial of f\_{𝒮\_χ} ∘ ρ\_{𝒮\_χ}(Frob\_v) is the image of P\_v(X). (Proof: the representation ρ\_𝔪: G\_{F,S∪S^c} → GL\_n(T^S(…)\_𝔪/J) of Theorem 2.3.7, conjugated so that ρ\_𝔪 mod 𝔪 = ρ̄\_𝔪; Theorem 4.5.1 gives the Fontaine–Laffaille condition at v | p; Theorem 3.1.1, applied with its S equal to S ∪ S^c and its R equal to S − S\_p, gives the inertial characteristic-polynomial condition at v ∈ R and unramifiedness with the right Frobenius polynomial at v ∈ S^c − S.)

Prerequisites: `PA.1`; `PA.3` (constructions in this layer); `AG:AG2.5`; `GGD:G8`. Source: [ACC](#source-acc), §6.5.1, Proposition 6.5.3, p. 1063.

<a id="ordinary-hida-complex"></a>

**Ordinary Hida complex** (`OrdinaryHidaComplex`). For c ≥ 1, Λ\_{1,c} = 𝒪[∏\_{v∈S\_p} ker(T\_n(𝒪\_{F\_v}/ϖ\_v^c) → T\_n(𝒪\_{F\_v}/ϖ\_v))], a quotient of Λ\_1, and A\_1(μ,χ,c) = RHom\_{Λ\_{1,c}}(RΓ(X\_{K(c,c)}, 𝒱\_μ(χ^{-1}))^{ord}, Λ\_{1,c})[−d], a perfect complex in D(Λ\_{1,c}) on which T^{S,ord} acts by transpose. (6.6.3): for c′ ≥ c there are T^{S,ord}-equivariant isomorphisms A\_1(μ,χ,c′) ⊗^L\_{Λ\_{1,c′}} Λ\_{1,c} ≅ A\_1(μ,χ,c) in D(Λ\_{1,c}) (Corollary 5.2.16). (6.6.4): canonical T^{S,ord}-equivariant isomorphisms A\_1(μ,χ,c) ⊗^L\_{Λ\_{1,c}} Λ\_{1,c}/ϖ ≅ A\_1(μ,1,c) ⊗^L\_{Λ\_{1,c}} Λ\_{1,c}/ϖ. By [KT17, Lem. 2.13] there is a perfect A\_1(μ,χ) ∈ D(Λ\_1) with T^{S,ord}-action and equivariant isomorphisms A\_1(μ,χ) ⊗^L\_{Λ\_1} Λ\_{1,c} ≅ A\_1(μ,χ,c) (all c ≥ 1) and A\_1(μ,χ) ⊗^L\_{Λ\_1} Λ\_1/ϖ ≅ A\_1(μ,1) ⊗^L\_{Λ\_1} Λ\_1/ϖ, compatible with (6.6.3) and with (6.6.4) for varying χ; A(μ,χ) = A\_1(μ,χ) ⊗^L\_{Λ\_1} Λ ∈ D(Λ).

Prerequisites: `PA.2`; `mathlib:DerivedCategory`; `PF:L0a`; `DP:P7`; `DP:P8`. Source: [ACC](#source-acc), §6.6.1, (6.6.3), (6.6.4), pp. 1076–1077.

API:

- `OrdinaryHidaComplex.finite`: A₁(μ,χ,c)=RHom\_{Λ₁,c}(RΓ(X\_{K(c,c)},V\_μ(χ^{-1}))^ord,Λ₁,c)[−d].
- `OrdinaryHidaComplex.transition`: Derived tensor from Λ₁,c′ to Λ₁,c gives the finite c complex for c′≥c.
- `OrdinaryHidaComplex.mod_varpi`: For χ congruent to 1 modulo varpi, the χ and 1 complexes agree after derived reduction.
- `OrdinaryHidaComplex.perfect_limit`: The P7 reconstruction supplies a perfect Λ₁-complex with all these compatible finite specializations.

Examples and tests:

- `OrdinaryHidaComplex.zero` (degenerate): The dual of the zero ordinary complex is zero.
- `OrdinaryHidaComplex.single_free_term` (computation): For the free module Λ₁,c in degree 0 the dual shifted by −d has its sole cohomology in degree d.
- `OrdinaryHidaComplex.derived_reduction` (compatibility): For a perfect finite complex, specializing the dual equals the dual of the specialized complex; underived reduction of cohomology is not substituted.

<a id="ordinary-deformation-hecke-map"></a>

**Ordinary deformation action** (`ordinary_deformation_hecke_map`). Let T^{S,Λ\_1} = T^S ⊗\_𝒪 Λ\_1 ⊂ T^{S,ord}. There are δ ≥ 1 depending only on n and [F:ℚ], an ideal J ⊂ T^{S,Λ\_1}(A(μ,χ)\_𝔪 ⊗\_𝒪 𝒪(ν + w\_0^G μ)^{-1}) with J^δ = 0, and a continuous surjective Λ-algebra homomorphism f\_{𝒮\_χ}: R\_{𝒮\_χ} → T^{S,Λ\_1}(A(μ,χ)\_𝔪 ⊗\_𝒪 𝒪(ν + w\_0^G μ)^{-1})/J such that for every finite v ∉ S the characteristic polynomial of f\_{𝒮\_χ} ∘ ρ\_{𝒮\_χ}(Frob\_v) is the image of P\_v(X). (Proof: build compatible maps R\_{𝒮\_χ} → T^{S,ord}(RΓ(X\_{K(c,c)}, 𝒱\_μ(χ^{-1}))^{ord})\_𝔪/J\_c as in Prop. 6.5.3 with Theorem 5.5.1 in place of Theorem 4.5.1 (using the description of 𝒟^{det,ord} in §6.2.6); Carayol's lemma [CHT08, Lem. 2.1.10] puts the image in a nilpotent quotient of T^{S,Λ\_1}(…); the Hecke algebras agree by transpose and twist; pass to the limit in c as in the proof of Theorem 4.5.1.)

Prerequisites: `PA.2`; `PA.3` (constructions in this layer); `AG:AG2.5`; `LGD:L8`; `GGD:G8`. Source: [ACC](#source-acc), §6.6.1, Proposition 6.6.7, p. 1078.

### Components and the derived support interface

Compare the untwisted and character-twisted local conditions modulo the coefficient uniformizer, then globalize using the same framings and variable determinant. The dimension and component calculation is the arithmetic input to the abstract support theorem. Its conclusion is conditional on the actual perfect pair supplied in PA.4.

<a id="arithmetic-component-dimension-input"></a>

**Arithmetic component comparison** (`arithmetic_component_dimension_input`). For the FL or ordinary framed global problem and its χ-twist, tensor the local rings with the common framing/patching power-series variables. With q Taylor–Wiles places and g=qn−n²[F⁺:Q]≥0, the FL rings satisfy dim R∞=dim S∞−ℓ₀ and dim(R∞/varpi)=dim R∞−1, ℓ₀=n[F⁺:Q]−1. The maximal-dimensional mod-varpi generic points lift uniquely to maximal-dimensional characteristic-zero components as required by P9; the χ-twisted generic lifts are unique, and lower components satisfy the strict dimension bound in Assumption 6.3.6. In the ordinary case the same P9 comparisons apply after choosing the specified minimal prime of the torus Iwasawa algebra and using the L7 trivial-residual degree bound; this is not a classification of every ordinary component.

Prerequisites: `PA.3` (constructions in this layer); `LGD:R08.2`; `GGD:G7`; `LGD:L7`; `LGD:L8`; `GGD:G8`; `DP:P9`. Source: [ACC](#source-acc), Proof of Theorem 6.5.4 pp. 1069–1070; proof of Theorem 6.6.2 pp. 1080–1081.

<a id="arithmetic-derived-support-contract"></a>

**Derived Ihara avoidance** (`arithmetic_derived_support_contract`). Given the imported P8 patched perfect complexes C∞,C∞′ for these two arithmetic towers, their common mod-varpi Hecke image and quotient deformation actions, and rational amplitude [q\_patch,q\_patch+ℓ₀] at every characteristic-zero augmentation point, the component input implies P9 Assumption 6.3.6. Consequently support of H\*(C∞) contains each maximal-dimensional component, and an augmentation characteristic-zero point x is in the support of H\*(C∞⊗^L\_{S∞}S∞/(x∩S∞))[1/p] whenever its generic component is one of those components. This statement is conditional on the patching input; PA.4 constructs and verifies that input. The conclusion is reduced support, not an integral R=T isomorphism.

Prerequisites: `PA.3` (constructions in this layer); `mathlib:Module.support`; `DP:R03.6`; `DP:P9`. Source: [ACC](#source-acc), §6.3.5, Proposition 6.3.8 and Corollary 6.3.9, pp. 1052–1053.

## PA.4 — Arithmetic patching and automorphy lifting

### Taylor–Wiles levels and selected roots

Auxiliary sets and deformation presentations come from their global owner. This layer constructs the arithmetic levels, the ordered-root localization and the trace comparison. At every old place the original level is retained.

<a id="taylor-wiles-arithmetic-levels"></a>

**Taylor–Wiles arithmetic levels** (`TaylorWilesArithmeticLevels`). Let (Q, (α\_{v,1},…,α\_{v,n})\_{v∈Q}) be a Taylor–Wiles datum for 𝒮\_1 (§6.2.28) such that for each v ∈ Q the residue characteristic l\_v splits in an imaginary quadratic subfield of F. It is a Taylor–Wiles datum for every 𝒮\_χ, and R\_{𝒮\_{χ,Q}} is an 𝒪[Δ\_Q]-algebra, Δ\_Q = ∏\_{v∈Q} Δ\_v = ∏\_{v∈Q} k(v)^×(p)^n. Good subgroups K\_1(Q) ⊂ K\_0(Q) ⊂ K: K\_1(Q)\_v = K\_0(Q)\_v = K\_v for v ∉ Q; for v ∈ Q, K\_0(Q)\_v = Iw\_v and K\_1(Q)\_v is the maximal pro-prime-to-p subgroup of Iw\_v. Then K\_0(Q)/K\_1(Q) ≅ Δ\_Q, and (6.5.6) there are surjective T^{S∪Q}-algebra maps \_{K\_0(Q)/K\_1(Q)}T^{S∪Q}(K\_0(Q)/K\_1(Q), 𝒱) → T^{S∪Q}(K\_0(Q), 𝒱) → T^{S∪Q}(K, 𝒱) (𝒱 = 𝒱\_λ(χ^{-1})): the first from K\_0(Q)-invariants (𝒪[Δ\_Q] acting trivially on invariants), the second t ↦ [K:K\_0(Q)]^{-1} π\_{Q,\*} ∘ t ∘ π\_Q^\* for the projection π\_Q: X\_{K\_0(Q)} → X\_K, where [K:K\_0(Q)] ≡ (n!)^{|Q|} mod p is a unit since p > n. T^{S∪Q}\_Q(K\_0(Q), 𝒱) ⊂ End\_{D(𝒪)}(RΓ(X\_{K\_0(Q)}, 𝒱)) is the commutative T^{S∪Q}(K\_0(Q),𝒱)-subalgebra generated by the U\_{v,i} (v ∈ Q, 1 ≤ i ≤ n), equivalently the image of T^{S∪Q}\_Q (§3.1); T^{S∪Q}\_Q(K\_0(Q)/K\_1(Q), 𝒱) ⊂ End\_{D(𝒪[Δ\_Q])}(RΓ\_{K\_0(Q)/K\_1(Q)}(X\_{K\_1(Q)}, 𝒱)) likewise (an 𝒪[Δ\_Q]-algebra). (6.5.7): the first map of (6.5.6) extends to a surjection T^{S∪Q}\_Q(K\_0(Q)/K\_1(Q), 𝒱) → T^{S∪Q}\_Q(K\_0(Q), 𝒱) sending U\_{v,i} to U\_{v,i}.

Prerequisites: `PA.0`; `GGD:G7`. Source: [ACC](#source-acc), §6.5.1, paragraphs after Corollary 6.5.5, (6.5.6), (6.5.7), pp. 1064–1065.

API:

- `TaylorWilesArithmeticLevels.away`: Both auxiliary levels equal K\_v at every v∉Q, including v∈S.
- `TaylorWilesArithmeticLevels.at_auxiliary`: At v∈Q use Iw\_v and its maximal pro-prime-to-p subgroup.
- `TaylorWilesArithmeticLevels.diamond_quotient`: The quotient K₀(Q)/K₁(Q) is the imported Δ\_Q.
- `TaylorWilesArithmeticLevels.trace_scalar`: Pullback followed by trace has scalar [K:K₀(Q)]≡(n!)^{#Q} mod p.

Examples and tests:

- `TaylorWilesArithmeticLevels.empty` (degenerate): For Q=∅ both levels equal K and the diamond group is trivial.
- `TaylorWilesArithmeticLevels.single_prime` (computation): For Q={v}, n=2 and p>2 the trace scalar is 2 modulo p, hence a unit.
- `TaylorWilesArithmeticLevels.old_bad_place` (non-example): At v∈S outside Q the original local factor must be retained; leaving it unspecified does not define a level.

<a id="taylor-wiles-selected-ideals"></a>

**Taylor–Wiles selected ideals** (`TaylorWilesSelectedIdeals`). With 𝒱 = 𝒱\_λ(χ^{-1}): 𝔪^Q ⊂ T^{S∪Q}(K, 𝒱) is the pullback of 𝔪 under T^{S∪Q}(K,𝒱) ⊂ T^S(K,𝒱); 𝔪\_0^Q ⊂ T^{S∪Q}(K\_0(Q),𝒱) is the pullback of 𝔪^Q and 𝔪\_1^Q ⊂ \_{K\_0(Q)/K\_1(Q)}T^{S∪Q}(K\_0(Q)/K\_1(Q),𝒱) the pullback of 𝔪\_0^Q under the maps (6.5.6); 𝔫\_0^Q ⊂ T^{S∪Q}\_Q(K\_0(Q),𝒱) is the ideal generated by 𝔪\_0^Q and the elements U\_{v,i} − q\_v^{i(1−i)/2} α\_{v,1}⋯α\_{v,i} (v ∈ Q, 1 ≤ i ≤ n); 𝔫\_1^Q ⊂ T^{S∪Q}\_Q(K\_0(Q)/K\_1(Q),𝒱) is the preimage of 𝔫\_0^Q under (6.5.7).

Prerequisites: `PA.4` (constructions in this layer). Source: [ACC](#source-acc), §6.5.1, paragraph before Lemma 6.5.8, p. 1065.

API:

- `TaylorWilesSelectedIdeals.unramified_contraction`: m^Q is the contraction of m to the away-from-S∪Q Hecke image.
- `TaylorWilesSelectedIdeals.selected_generator`: n₀^Q adds U\_{v,i}−q\_v^{i(1−i)/2}∏\_{j≤i}α\_{v,j}.
- `TaylorWilesSelectedIdeals.diamond_pullback`: n₁^Q is the preimage of n₀^Q under the auxiliary diamond-forgetting Hecke map.
- `TaylorWilesSelectedIdeals.ordering`: The chosen ordering of residual eigenvalues fixes the selected Iwahori constituent.

Examples and tests:

- `TaylorWilesSelectedIdeals.empty` (degenerate): For Q=∅ the selected ideal is just the original localized maximal ideal.
- `TaylorWilesSelectedIdeals.rank_two_second` (computation): For n=2 the i=2 generator is U\_{v,2}−q\_v^{-1}α\_{v,1}α\_{v,2}.
- `TaylorWilesSelectedIdeals.order_sensitive` (non-example): For distinct α₁,α₂, interchanging them changes the i=1 generator U\_{v,1}−α₁.

<a id="selected-ideal-properness"></a>

**Selected ideal properness** (`selected_ideal_properness`). Each of 𝔪^Q, 𝔪\_0^Q, 𝔪\_1^Q, 𝔫\_0^Q, 𝔫\_1^Q is a (proper) maximal ideal. The content is that 𝔫\_0^Q is proper, i.e. H^\*(X\_{K\_0(Q)}, 𝒱\_λ(χ^{-1})/ϖ)[𝔪\_0^Q] contains a nonzero vector on which every U\_{v,i} (v ∈ Q) acts by α\_{v,1}⋯α\_{v,i}; this follows from (the proof of) [KT17, Lem. 5.3] once H^\*(X\_K, 𝒱\_λ(χ^{-1}))[𝔪^Q] is killed by a power of 𝔪, which follows from the existence of ρ̄\_𝔪 and its local–global compatibility at v ∈ Q.

Prerequisites: `PA.4` (constructions in this layer); `SR:SR.1`; `ALS:ALS.3`. Source: [ACC](#source-acc), §6.5.1, Lemma 6.5.8, p. 1065; [KT](#source-kt), §5, Lemma 5.3 and proof, manuscript p. 26.

<a id="diamond-derived-augmentation"></a>

**Diamond augmentation** (`diamond_derived_augmentation`). The natural morphisms RΓ(X\_K, 𝒱)\_{𝔪^Q} → RΓ(X\_K, 𝒱)\_𝔪, RΓ(X\_{K\_0(Q)}, 𝒱)\_{𝔫\_0^Q} → RΓ(X\_K, 𝒱)\_{𝔪^Q} (trace), and RΓ(Δ\_Q, RΓ\_{K\_0(Q)/K\_1(Q)}(X\_{K\_1(Q)}, 𝒱)\_{𝔫\_1^Q}) → RΓ(X\_{K\_0(Q)}, 𝒱)\_{𝔫\_0^Q} are isomorphisms in D(𝒪) (𝒱 = 𝒱\_λ(χ^{-1})). (Proof: the first because 𝔪 is the unique maximal ideal of T^S(K, 𝒱) above 𝔪^Q, shown in the proof of Lemma 6.5.8; the second reduces after ⊗^L\_𝒪 k to tr\_{K/K\_0(Q)}: H^\*(X\_{K\_0(Q)}, 𝒱/ϖ)\_{𝔫\_0^Q} ≅ H^\*(X\_K, 𝒱/ϖ)\_{𝔪^Q}, which is [KT17, Lem. 5.4]; the third is clear from the definitions.)

Prerequisites: `PA.4` (constructions in this layer); `PA.0`; `SR:SR.1`. Source: [ACC](#source-acc), §6.5.1, Lemma 6.5.9, p. 1066; [KT](#source-kt), §5, Lemma 5.4 and proof, manuscript p. 27.

<a id="taylor-wiles-hecke-locality"></a>

**Taylor–Wiles Hecke locality** (`taylor_wiles_hecke_locality`). There is a surjection \_{K\_0(Q)/K\_1(Q)}T^{S∪Q}(RΓ\_{K\_0(Q)/K\_1(Q)}(X\_{K\_1(Q)}, 𝒱)\_{𝔫\_1^Q}) → T^{S∪Q}(RΓ(X\_K, 𝒱)\_{𝔪^Q}) = T^{S∪Q}(K, 𝒱)\_{𝔪^Q}; its source is a local 𝒪[Δ\_Q]-algebra whose maximal ideal is the preimage of 𝔪^Q, because it acts nearly faithfully on H^\*(X\_{K\_1(Q)}, 𝒱)\_{𝔫\_1^Q}. Definition ([Tay08, Def. 2.1]): a finitely generated module over a Noetherian local ring is nearly faithful if its annihilator is a nilpotent ideal.

Prerequisites: `PA.4` (constructions in this layer). Source: [ACC](#source-acc), §6.5.1, (6.5.10) and following paragraph, p. 1066.

<a id="diamond-linear-deformation-hecke-map"></a>

**Diamond linear deformation Hecke map** (`diamond_linear_deformation_hecke_map`). Let 𝕋 = \_{K\_0(Q)/K\_1(Q)}T^{S∪Q}(RΓ\_{K\_0(Q)/K\_1(Q)}(X\_{K\_1(Q)}, 𝒱\_λ(χ^{-1}))\_{𝔫\_1^Q}). There are δ ≥ 1 depending only on n and [F:ℚ], an ideal J ⊂ 𝕋 with J^δ = 0, and a continuous surjective 𝒪[Δ\_Q]-algebra homomorphism f\_{𝒮\_{χ,Q}}: R\_{𝒮\_{χ,Q}} → 𝕋/J such that for every finite v ∉ S ∪ Q the characteristic polynomial of f\_{𝒮\_{χ,Q}} ∘ ρ\_{𝒮\_{χ,Q}}(Frob\_v) is the image of P\_v(X). (Proof: with T′ = T^{S∪Q}\_Q(K\_0(Q)/K\_1(Q), 𝒱)\_{𝔫\_1^Q} ⊃ 𝕋 (a local inclusion of finite 𝒪[Δ\_Q]-algebras), Theorem 2.3.7 gives ρ\_{𝔫\_1^Q}: G\_{F,S∪Q} → GL\_n(T′/J′) lifting ρ̄\_𝔪; the conditions at S are as in Prop. 6.5.3 and there is none at Q. For v ∈ Q define ψ\_{v,i}: W\_{F\_v} → (T′)^× by ψ\_{v,i}(Art\_{F\_v}(α)) = t\_{v,i}(α); Theorem 3.1.1 gives det(X − ρ\_{𝔫\_1^Q}(σ)) = ∏\_i (X − ψ\_{v,i}(σ)) for σ ∈ W\_{F\_v} (after enlarging J′); the ψ\_{v,i} mod 𝔫\_1^Q send Frobenius to the pairwise distinct α\_{v,i}, so [BC09, Prop. 1.5.1] gives ρ\_{𝔫\_1^Q}|\_{W\_{F\_v}} ≅ ⊕\_i ψ\_{v,i}, whence 𝒪[Δ\_v]-linearity (§6.2.18); take J = ker(𝕋 → T′/J′).)

Prerequisites: `PA.4` (constructions in this layer); `PA.3`; `AG:AG2.5`; `GGD:G8`. Source: [ACC](#source-acc), §6.5.1, Proposition 6.5.11, pp. 1066–1067.

### The Fontaine–Laffaille patched pair

Verify the two arithmetic towers against the abstract ultrapatching input at a fixed nonprincipal ultrafilter. The free diamond-cell models, uniform ranks and nilpotent bounds are part of that verification. Reduction compares Hecke images in the reduced coefficient category.

<a id="fontaine-laffaille-patching-verification"></a>

**Fontaine–Laffaille patching verification** (`fontaine_laffaille_patching_verification`). Fix one nonprincipal ultrafilter on the positive integers for the imported ultrapatching construction. Set q = h¹(F\_S/F, ad ρ̄\_𝔪(1)), g = qn − n²[F⁺:ℚ], Δ\_∞ = ℤ\_p^{nq}, 𝒯 = a power series ring over 𝒪 in n²|S| − 1 variables, S\_∞ = 𝒯⟦Δ\_∞⟧ with augmentation ideal 𝔞\_∞ (Λ = 𝒪). Enlarge E to contain ζ\_p and choose, for each v ∈ R, pairwise distinct χ\_{v,1},…,χ\_{v,n}: 𝒪\_{F\_v}^× → 𝒪^× trivial mod ϖ (possible as p > n, q\_v ≡ 1 mod p); χ = ∏\_{v∈R} χ\_v on ∏\_{v∈R} I\_v. For N ≥ 1 choose Taylor–Wiles data (Q\_N, (α\_{v,i})\_{v∈Q\_N}) as in Proposition 6.2.33 (possible as r̄\_ι(π)(G\_{F(ζ\_p)}) is enormous; any imaginary quadratic subfield of F), Q\_0 = ∅, Δ\_N = Δ\_{Q\_N} with a surjection Δ\_∞ ↠ Δ\_N whose kernel lies in (p^N ℤ\_p)^{nq} (as q\_v ≡ 1 mod p^N for v ∈ Q\_N). R\_N = R\_{𝒮\_{1,Q\_N}}, R′\_N = R\_{𝒮\_{χ,Q\_N}} (R\_0 = R\_{𝒮\_1}, R′\_0 = R\_{𝒮\_χ}); R^loc = R^{S,loc}\_{𝒮\_1}, R′^loc = R^{S,loc}\_{𝒮\_χ} (§6.2.22), also the local rings of 𝒮\_{·,Q\_N}; canonical isomorphisms R^loc/ϖ ≅ R′^loc/ϖ, R\_N/ϖ ≅ R′\_N/ϖ, R\_N ⊗\_{𝒪[Δ\_N]} 𝒪 ≅ R\_0, R′\_N ⊗ 𝒪 ≅ R′\_0, compatible mod ϖ; R^loc-algebra structures on R\_N ⊗̂\_𝒪 𝒯 (Lemma 6.2.4); R\_∞, R′\_∞ = power series rings in g variables over R^loc, R′^loc with surjections onto the framed rings R\_N ⊗̂ 𝒯, R′\_N ⊗̂ 𝒯 (Prop. 6.2.25 for N = 0, using H⁰(F\_S/F, ad ρ̄\_𝔪(1)) = 0 because r̄\_ι(π)|\_{G\_{F(ζ\_p)}} is irreducible and ζ\_p ∉ F; Prop. 6.2.33(3) for N ≥ 1 ), compatible mod ϖ and with R\_N ⊗ 𝒪 ≅ R\_0. Complexes: 𝒞\_0 = RHom\_𝒪(RΓ(X\_K, 𝒱\_λ(1))\_𝔪, 𝒪)[−d], T\_0 = T^S(K, 𝒱\_λ(1))\_𝔪, with H^i(𝒞\_0)[1/p] ≅ Hom\_E(H^{d−i}(X\_K, 𝒱\_λ(1))\_𝔪[1/p], E) as T\_0-modules; 𝒞′\_0, T′\_0 likewise with 𝒱\_λ(χ^{-1}); for N ≥ 1, 𝒞\_N = RHom\_{𝒪[Δ\_N]}(RΓ\_{K\_0(Q\_N)/K\_1(Q\_N)}(X\_{K\_1(Q\_N)}, 𝒱\_λ(1))\_{𝔫\_1^{Q\_N}}, 𝒪[Δ\_N])[−d], T\_N = \_{K\_0/K\_1}T^{S∪Q\_N}(RΓ\_{K\_0(Q\_N)/K\_1(Q\_N)}(X\_{K\_1(Q\_N)}, 𝒱\_λ(1))\_{𝔫\_1^{Q\_N}}), and 𝒞′\_N, T′\_N with 𝒱\_λ(χ^{-1}). Claim: with I\_N, I′\_N from Props. 6.5.3/6.5.11 these data satisfy the set-up of §6.4.1: canonical 𝒞\_N ⊗^L k[Δ\_N] ≅ 𝒞′\_N ⊗^L k[Δ\_N] with T\_N, T′\_N having the same image T̄\_N; 𝒞\_N ⊗^L\_{𝒪[Δ\_N]} 𝒪 ≅ 𝒞\_0 (Lemma 6.5.9), compatible mod ϖ; local 𝒪[Δ\_N]-algebra surjections R\_N → T\_N/I\_N, R′\_N → T′\_N/I′\_N compatible mod ϖ and agreeing into T̄\_N/(Ī\_N + Ī′\_N); T\_N ⊗\_{𝒪[Δ\_N]} 𝒪 → T\_0 surjective onto T\_0/I\_0 (Chebotarev and the Galois representation over T\_0/I\_0), and likewise primed.

Prerequisites: `PA.4` (constructions in this layer); `mathlib:DerivedCategory`; `DP:P7`; `GGD:G7`; `ALS:ALS.1`; `DP:P8`. Source: [ACC](#source-acc), §6.5.1, proof of Theorem 6.5.4, pp. 1067–1069.

<a id="patched-arithmetic-mod-varpi-comparison"></a>

**Patched-complex comparison** (`patched_arithmetic_mod_varpi_comparison`). (1) The quasi-isomorphisms 𝒞\_N/ϖ ≅ 𝒞′\_N/ϖ induce a quasi-isomorphism 𝒞\_∞/ϖ ≅ 𝒞′\_∞/ϖ. (2) Via this identification T\_∞ and T′\_∞ have the same image T̄\_∞ in the endomorphism algebras of 𝒞\_∞/ϖ and 𝒞′\_∞/ϖ in D(S\_∞/ϖ), and also after restriction of scalars to D(S\_∞). (3) With Ī\_∞, Ī′\_∞ the images of I\_∞, I′\_∞ in T̄\_∞, the actions of R\_∞/ϖ ≅ R′\_∞/ϖ (through T\_∞ and T′\_∞) on H^\*(𝒞\_∞/ϖ)/(Ī\_∞ + Ī′\_∞) and H^\*(𝒞′\_∞/ϖ)/(Ī\_∞ + Ī′\_∞) are identified via 𝒞\_∞/ϖ ≅ 𝒞′\_∞/ϖ.

Prerequisites: `PA.3`; `mathlib:DerivedCategory`; `DP:P8`. Source: [ACC](#source-acc), §6.4.2, Proposition 6.4.17, pp. 1060–1061.

<a id="fontaine-laffaille-dimension-amplitude"></a>

**Fontaine–Laffaille dimension amplitude** (`fontaine_laffaille_dimension_amplitude`). Applying §6.4.2 to the Fontaine–Laffaille arithmetic tower data gives: bounded complexes 𝒞\_∞, 𝒞′\_∞ of free S\_∞-modules, T\_∞ ⊂ End\_{D(S\_∞)}(𝒞\_∞), T′\_∞ ⊂ End\_{D(S\_∞)}(𝒞′\_∞), ideals with I\_∞^δ = I′\_∞^δ = 0, S\_∞-algebra structures on R\_∞, R′\_∞ and S\_∞-algebra surjections R\_∞ → T\_∞/I\_∞, R′\_∞ → T′\_∞/I′\_∞; surjections R\_∞/𝔞\_∞ ↠ R\_0, R′\_∞/𝔞\_∞ ↠ R′\_0; 𝒞\_∞ ⊗^L S\_∞/𝔞\_∞ ≅ 𝒞\_0 and 𝒞′\_∞ ⊗^L S\_∞/𝔞\_∞ ≅ 𝒞′\_0 with T\_∞ → T\_0 surjective onto T\_0/I\_0 and R\_∞/𝔞\_∞ → (T\_0/I\_0)/I\_{∞,0} factoring through R\_0; 𝒞\_∞ ⊗^L S\_∞/ϖ ≅ 𝒞′\_∞ ⊗^L S\_∞/ϖ with a common image T̄\_∞ of T\_∞ and T′\_∞ and identified actions of R\_∞/ϖ ≅ R′\_∞/ϖ on H^\*(𝒞\_∞ ⊗^L S\_∞/ϖ)/(Ī\_∞ + Ī′\_∞). By Lemma 6.2.26: every generic point of Spec R\_∞/ϖ specializes from a unique generic point of Spec R\_∞, all generic points of Spec R\_∞ have characteristic 0, Spec R′\_∞ is irreducible with characteristic-0 generic point, R\_∞ is equidimensional, and dim R\_∞ = dim R′\_∞ = 1 + g + n²|S| + ½n(n−1)[F:ℚ]. For X\_K with F CM, ℓ\_0 = n[F⁺:ℚ] − 1; since dim S\_∞ = n²|S| + qn and g = qn − n²[F⁺:ℚ], dim R\_∞ = dim R′\_∞ = dim S\_∞ − ℓ\_0. H^\*(𝒞\_∞ ⊗^L S\_∞/𝔞\_∞)[1/p] ≅ Hom\_E(H^{d−\*}(X\_K, 𝒱\_λ(1))\_𝔪[1/p], E) is nonzero and concentrated in [q\_patch, q\_patch + ℓ\_0] by Theorem 2.4.10. Hence Assumption 6.3.6 holds, Proposition 6.3.8 gives full support of H^\*(𝒞\_∞) over R\_∞, hence of H^\*(𝒞\_∞ ⊗^L S\_∞/𝔞\_∞) = H^\*(𝒞\_0) over R\_∞/𝔞\_∞ and so over R\_{𝒮\_1}.

Prerequisites: `PA.3`; `LGD:L7`; `LGD:R08.2`; `ALS:ALS.5`; `PA.4` (constructions in this layer); `DP:P9`. Source: [ACC](#source-acc), §6.5.1, proof of Theorem 6.5.4, pp. 1069–1070.

<a id="fontaine-laffaille-full-support"></a>

**Fontaine–Laffaille full support** (`fontaine_laffaille_full_support`). Under assumptions (1)–(17) of §6.5.1, H^\*(X\_K, 𝒱\_λ(1))\_𝔪 has full support over R\_{𝒮\_1}, i.e. its support in Spec R\_{𝒮\_1}, defined through f\_{𝒮\_1}: R\_{𝒮\_1} → T^S(RΓ(X\_K, 𝒱\_λ(1)))\_𝔪/J (Prop. 6.5.3) as in §6.3.5, is all of Spec R\_{𝒮\_1} (although H^\* is not literally an R\_{𝒮\_1}-module).

Prerequisites: `PA.4` (constructions in this layer); `PA.3`; `DP:P9`. Source: [ACC](#source-acc), §6.5.1, Theorem 6.5.4, p. 1063; proof pp. 1067–1070.

Concrete checks:

- Nilpotent ideals disappear from Spec and support, but the original integral deformation and Hecke rings need not be isomorphic.

<a id="fontaine-laffaille-lifting-at-good-level"></a>

**Fontaine–Laffaille lifting at good level** (`fontaine_laffaille_lifting_at_good_level`). Under (1)–(17) of §6.5.1, let ρ: G\_F → GL\_n(Q̄\_p) be continuous with: (1) ρ̄ ≅ r̄\_ι(π); (2) ρ|\_{G\_{F\_v}} crystalline for every v | p, with HT\_τ(ρ) = {λ\_{ιτ,1} + n − 1, …, λ\_{ιτ,n}} (the j-th entry λ\_{ιτ,j} + n − j) for every τ: F ↪ Q̄\_p; (3) ρ unramified at every finite v ∉ S; (4) ρ|\_{G\_{F\_v}} unipotently ramified for v ∈ R. Then ρ is automorphic: there is a cuspidal regular algebraic automorphic representation Π of GL\_n(𝔸\_F) of weight λ with ρ ≅ r\_ι(Π), and Π\_v is unramified at every finite v with v | p or v ∉ S. (Proof: conjugate ρ into GL\_n(𝒪) with ρ mod ϖ = ρ̄\_𝔪; it is of type 𝒮\_1, giving f: R\_{𝒮\_1} → E; by Theorem 6.5.4, ker f ∈ Supp H^\*(X\_K, 𝒱\_λ(1))\_𝔪[1/p]; Theorem 2.4.10 gives Π with (Π^∞)^K ≠ 0.)

Prerequisites: `PA.4` (constructions in this layer); `ALS:ALS.5`. Source: [ACC](#source-acc), §6.5.1, Corollary 6.5.5, pp. 1063–1064.

### Auxiliary neatness and Hida weight independence

Two suitable auxiliary places justify neatness. For the ordinary tower remove the weight by the ν+w₀μ character before taking the perfect limit. Specialization then recovers the required finite-level ordinary complex at the new weight.

<a id="neatness-auxiliary-places"></a>

**Neatness auxiliary places** (`neatness_auxiliary_places`). Let E be an imaginary CM field, n ≥ 2, p an odd prime, and ρ̄: G\_E → GL\_n(k) continuous and unramified outside a finite set S′ containing the p-adic places. Assume some σ ∈ G\_E − G\_{E(ζ\_p)} has scalar ρ̄(σ), and fix a finite forbidden set R^c of places. Then infinitely many degree-one places v of E have odd residue characteristic different from p, avoid S′ ∪ R^c and the primes ramified in E/ℚ, have scalar ρ̄(Frob\_v), and satisfy q\_v ≢ 1 mod p. At such v, local Tate duality gives H²(E\_v, ad ρ̄) = H⁰(E\_v, ad ρ̄(1))^∨ = 0. Choose two of distinct residue characteristics and put S = S′ ∪ {v\_0,v′\_0}; pro-v Iwahori factors at these two places make the resulting level neat (ACC Lemma 6.5.2). Their underlying rational primes split in every imaginary quadratic subfield of E. If π\_E is unramified outside S′ and all other Fontaine–Laffaille seventeen-clause (respectively ordinary fifteen-clause) profile hypotheses have already been arranged, this completes the auxiliary unramified, H²-vanishing, two-prime and neat-level requirements; it does not establish the other profile hypotheses.

Prerequisites: `Tau Ceti Chebotarev L10`; `Tau Ceti ClassFieldTheory L5`; `ALS:ALS.1`. Source: [ACC](#source-acc), §6.5.12, proof of Theorem 6.1.1, pp. 1073–1074 (and §6.6.10, p. 1084); Lemma 6.5.2, p. 1062, for neatness.

<a id="weight-independent-hida-twist"></a>

**Weight independent Hida twist** (`WeightIndependentHidaTwist`). ν ∈ X^\*((Res\_{F/ℚ} T)\_E) = (ℤ^n)^{Hom(F,E)} is ν\_τ = (0, 1, …, n−1) for all τ. B\_1(μ,χ) = A\_1(μ,χ) ⊗\_𝒪 𝒪(ν + w\_0^G μ)^{-1}, where 𝒪(ν + w\_0^G μ)^{-1} is the 𝒪[T\_n(F\_p)]-module of §5.2.1 (the action of T\_n(𝒪\_{F,p}) extending uniquely to 𝒪⟦T\_n(𝒪\_{F,p})⟧); it is a perfect complex in D(Λ\_1) with T^{S,ord}-action. B(μ,χ) = B\_1(μ,χ) ⊗^L\_{Λ\_1} Λ.

Prerequisites: `PA.3`; `PA.2`. Source: [ACC](#source-acc), §6.6.1, p. 1077.

API:

- `WeightIndependentHidaTwist.nu`: ν\_{τ,i}=i−1 for one-based i.
- `WeightIndependentHidaTwist.formula`: B₁=A₁⊗O(ν+w₀μ)^{-1}, and B=B₁⊗^L\_{Λ₁}Λ.
- `WeightIndependentHidaTwist.hecke`: Transpose Hecke away from S is preserved under the tensor twist.
- `WeightIndependentHidaTwist.weight_compare`: For all dominant μ,μ′ the complexes B₁(μ,χ),B₁(μ′,χ) are equivariantly isomorphic by Lemma 6.6.5.

Examples and tests:

- `WeightIndependentHidaTwist.rank_one_zero` (degenerate): For n=1, μ=0, ν=0 so the twist is trivial.
- `WeightIndependentHidaTwist.rank_two_zero` (computation): For n=2, μ=0, ν=(0,1) and the twist is O(0,1)^{-1}, not the trivial character.
- `WeightIndependentHidaTwist.rank_two_weight` (computation): For μ=(2,0), ν+w₀μ=(0,3), fixing both the reversal and ν shift.

<a id="hida-weight-independence"></a>

**Hida weight independence** (`hida_weight_independence`). For every μ′ ∈ (ℤ^n\_+)^{Hom(F,E)} there is a T^{S,ord}-equivariant isomorphism B\_1(μ,χ) ≅ B\_1(μ′,χ) in D(Λ\_1). (Proof: Proposition 5.2.17 and [KT17, Lem. 2.13].)

Prerequisites: `PA.4` (constructions in this layer); `PA.2`. Source: [ACC](#source-acc), §6.6.1, Lemma 6.6.5, p. 1077.

<a id="hida-weight-specialization"></a>

**Hida weight specialization** (`hida_weight_specialization`). For μ′ ∈ (ℤ^n\_+)^{Hom(F,E)} there is a T^{S,ord}-equivariant isomorphism in D(𝒪): B\_1(μ,χ) ⊗^L\_{Λ\_1} 𝒪(ν + w\_0^G μ′)^{-1} ≅ A\_1(μ′,χ,1) ⊗\_𝒪 𝒪(ν + w\_0^G μ′)^{-1}. (By Lemma 6.6.5 reduce to μ′ = μ, where the left side is A\_1(μ,χ) ⊗^L\_{Λ\_1} 𝒪 ⊗\_𝒪 𝒪(ν + w\_0^G μ)^{-1}.)

Prerequisites: `PA.4` (constructions in this layer). Source: [ACC](#source-acc), §6.6.1, Corollary 6.6.6, pp. 1077–1078.

### Ordinary diamonds and patching

The ordinary auxiliary complex carries both its finite torus algebra and its diamond action. Pass to the c-limit with derived reductions intact, and verify diamond linearity before applying the abstract patching construction.

<a id="ordinary-taylor-wiles-levels"></a>

**Ordinary Taylor–Wiles levels** (`OrdinaryTaylorWilesLevels`). For a Taylor–Wiles datum (Q, (α\_{v,i})) for 𝒮\_1 whose places have residue characteristic split in an imaginary quadratic subfield of F (a TW datum for all 𝒮\_χ; R\_{𝒮\_{χ,Q}} an 𝒪[Δ\_Q]-algebra, Δ\_Q = ∏\_{v∈Q} k(v)^×(p)^n) and c ≥ 1: good subgroups K(c,c)\_1(Q) ⊂ K(c,c)\_0(Q) ⊂ K(c,c), equal to K(c,c)\_v away from Q, with K(c,c)\_0(Q)\_v = Iw\_v and K(c,c)\_1(Q)\_v the maximal pro-prime-to-p subgroup of Iw\_v for v ∈ Q, so K(c,c)\_0(Q)/K(c,c)\_1(Q) ≅ Δ\_Q. A\_1(μ,χ,Q,c) = RHom\_{Λ\_{1,c}[Δ\_Q]}(RΓ\_{K(c,c)\_0(Q)/K(c,c)\_1(Q)}(X\_{K(c,c)\_1(Q)}, 𝒱\_μ(χ^{-1}))^{ord}, Λ\_{1,c}[Δ\_Q])[−d] ∈ D(Λ\_{1,c}[Δ\_Q]), with transpose action of T^{S∪Q,ord}\_Q = T^{S∪Q,ord} ⊗\_{T^{S∪Q}} T^{S∪Q}\_Q. Passing to the limit in c gives A\_1(μ,χ,Q) ∈ D(Λ\_1[Δ\_Q]) with T^{S∪Q,ord}\_Q-action and equivariant isomorphisms A\_1(μ,χ,Q) ⊗^L\_{Λ\_1} Λ\_{1,c} ≅ A\_1(μ,χ,Q,c) and A\_1(μ,χ,Q) ⊗^L\_{Λ\_1} Λ\_1/ϖ ≅ A\_1(μ,1,Q) ⊗^L\_{Λ\_1} Λ\_1/ϖ, compatible with the level-c data. 𝔪^Q = the contraction of 𝔪 to T^{S∪Q,ord}; 𝔫^Q = the ideal of T^{S∪Q,ord}\_Q generated by 𝔪^Q and U\_{v,i} − α\_{v,1}⋯α\_{v,i} (v ∈ Q, 1 ≤ i ≤ n).

Prerequisites: `PA.4` (constructions in this layer); `PA.3`; `PF:L0a`; `GGD:G7`; `DP:P8`; `DP:P7`. Source: [ACC](#source-acc), §6.6.1, pp. 1078–1079.

API:

- `OrdinaryTaylorWilesLevels.levels`: For every c the two auxiliary levels agree with K(c,c) away from Q and use the same imported diamonds at Q.
- `OrdinaryTaylorWilesLevels.dual`: The finite ordinary dual complex is formed over Λ₁,c[Δ\_Q], with transpose Hecke.
- `OrdinaryTaylorWilesLevels.selected_generator`: The ordinary auxiliary ideal has generators U\_{v,i}−∏\_{j≤i}α\_{v,j}, using the ordinary normalization.
- `OrdinaryTaylorWilesLevels.limit`: Perfect reconstruction in c commutes with mod-varpi comparison and carries the diamond action.

Examples and tests:

- `OrdinaryTaylorWilesLevels.empty` (degenerate): For Q=∅ the complex is A₁(μ,χ,c).
- `OrdinaryTaylorWilesLevels.single_rank_two` (computation): For n=2 and Q={v}, the ordinary i=2 generator is U\_{v,2}−α₁α₂; the FL factor q\_v^{-1} is absent.
- `OrdinaryTaylorWilesLevels.old_level` (compatibility): All places in S outside Q retain K(c,c)\_v; the auxiliary modification does not change their levels.

<a id="ordinary-diamond-augmentation"></a>

**Ordinary diamond augmentation** (`ordinary_diamond_augmentation`). 𝔫^Q lies in the support of H^\*(A\_1(μ,χ,Q)), and there are T^{S∪Q,ord}-equivariant isomorphisms A\_1(μ,χ,Q)\_{𝔫^Q} ⊗^L\_{Λ\_1[Δ\_Q]} Λ\_1 ≅ A\_1(μ,χ)\_{𝔪^Q} ≅ A\_1(μ,χ)\_𝔪. (Proof 'as in the Fontaine–Laffaille case', details omitted.)

Prerequisites: `PA.4` (constructions in this layer). Source: [ACC](#source-acc), §6.6.1, Lemma 6.6.8, p. 1079.

<a id="ordinary-diamond-linear-hecke-map"></a>

**Ordinary diamond linear Hecke map** (`ordinary_diamond_linear_hecke_map`). Let A(μ,χ,Q) = A\_1(μ,χ,Q) ⊗^L\_{Λ\_1} Λ and \_{Δ\_Q}T^{S∪Q,Λ\_1} = T^{S∪Q,Λ\_1} ⊗\_𝒪 𝒪[Δ\_Q], acting on A(μ,χ,Q)\_{𝔫^Q} via K(c,c)\_0(Q)/K(c,c)\_1(Q) ≅ Δ\_Q and passage to the limit; \_{Δ\_Q}T^{S∪Q,Λ\_1}(A(μ,χ,Q)\_{𝔫^Q}) is a local Λ[Δ\_Q]-algebra. Then there are δ ≥ 1 depending only on n and [F:ℚ], an ideal J ⊂ 𝕋 := \_{Δ\_Q}T^{S∪Q,Λ\_1}(A(μ,χ,Q)\_{𝔫^Q} ⊗\_𝒪 𝒪(ν + w\_0^G μ)^{-1}) with J^δ = 0, and a continuous surjective Λ[Δ\_Q]-algebra homomorphism f\_{𝒮\_{χ,Q}}: R\_{𝒮\_{χ,Q}} → 𝕋/J such that for every finite v ∉ S ∪ Q the characteristic polynomial of f\_{𝒮\_{χ,Q}} ∘ ρ\_{𝒮\_{χ,Q}}(Frob\_v) is the image of P\_v(X). (Proof: the Λ-algebra map as in Prop. 6.6.7; Λ[Δ\_Q]-linearity as in Prop. 6.5.11 via T^{S∪Q,ord}\_Q(A(μ,χ,Q) ⊗ 𝒪(ν + w\_0^G μ)^{-1})\_{𝔫^Q}.)

Prerequisites: `PA.3`; `PA.4` (constructions in this layer); `AG:AG2.5`; `LGD:L8`; `GGD:G8`. Source: [ACC](#source-acc), §6.6.1, Proposition 6.6.9 and the preceding paragraph, pp. 1079–1080.

<a id="ordinary-patching-verification"></a>

**Ordinary patching verification** (`ordinary_patching_verification`). Fix one nonprincipal ultrafilter on the positive integers for the imported ultrapatching construction. Let f: R\_{𝒮\_1} → 𝒪 classify ρ. Set q = h¹(F\_S/F, ad ρ̄\_𝔪(1)), g = qn − n²[F⁺:ℚ], Δ\_∞ = ℤ\_p^{nq}, 𝒯 = a power series ring over Λ (the weight algebra) in n²|S| − 1 variables, S\_∞ = 𝒯⟦Δ\_∞⟧, augmented over Λ with ideal 𝔞\_∞. Choose χ = ∏\_{v∈R} χ\_v: ∏\_{v∈R} Iw\_v → 𝒪^× with χ\_{v,1},…,χ\_{v,n}: k(v)^× → 𝒪^× trivial mod ϖ and pairwise distinct. R^loc = R^{S,loc}\_{𝒮\_1}, R′^loc = R^{S,loc}\_{𝒮\_χ} (§6.2.22); R\_∞, R′\_∞ = power series rings in g variables over them. Applying §6.4.2 to the complexes A(μ,χ,Q\_N)\_{𝔫^{Q\_N}} ⊗\_𝒪 𝒪(ν + w\_0^G μ)^{-1} (and χ = 1), for Taylor–Wiles data from Proposition 6.2.33, gives: bounded complexes 𝒞\_∞, 𝒞′\_∞ of free S\_∞-modules, T\_∞, T′\_∞ with nilpotent I\_∞, I′\_∞ (I^δ = 0), S\_∞-algebra structures on R\_∞, R′\_∞ and surjections R\_∞ → T\_∞/I\_∞, R′\_∞ → T′\_∞/I′\_∞; surjections of local Λ-algebras R\_∞/𝔞\_∞ ↠ R\_{𝒮\_1}, R′\_∞/𝔞\_∞ ↠ R\_{𝒮\_χ}; and isomorphisms 𝒞\_∞ ⊗^L\_{S\_∞} S\_∞/𝔞\_∞ ≅ A(μ,1)\_𝔪 ⊗\_𝒪 𝒪(ν + w\_0^G μ)^{-1} = B(μ,1)\_𝔪 and 𝒞′\_∞ ⊗^L S\_∞/𝔞\_∞ ≅ B(μ,χ)\_𝔪 in D(Λ).

Prerequisites: `PA.4` (constructions in this layer); `mathlib:DerivedCategory`; `DP:P7`; `GGD:G7`; `ALS:ALS.1`; `DP:P8`. Source: [ACC](#source-acc), §6.6.1, proof of Theorem 6.6.2, pp. 1080–1081.

<a id="ordinary-support-at-lifting-point"></a>

**Ordinary support at the lifting point** (`ordinary_support_at_lifting_point`). For the ordinary patched pair just constructed: Lemma 6.2.27(1),(2) give Assumption 6.3.6(1),(2) for R\_∞, R′\_∞ (the dimension equality dim R\_∞ = dim S\_∞ − ℓ\_0 needs g = qn − n²[F⁺:ℚ]). For 𝔭 = the preimage in S\_∞ of Ann\_Λ(𝒪(ν + w\_0^G μ)^{-1}), Corollary 6.6.6 gives (𝒞\_∞ ⊗^L S\_∞/𝔭)[1/p] ≅ (B(μ,1)\_𝔪 ⊗^L\_Λ 𝒪(ν + w\_0^G μ)^{-1})[1/p], whose cohomology is a quotient of Hom\_E(H^{d−\*}(X\_{K(1,1)}, 𝒱\_μ)\_𝔪[1/p], E); π contributes, so by Theorem 2.4.10 it is nonzero and concentrated in [q\_patch, q\_patch + ℓ\_0] (Assumption 6.3.6(3)). Let x ∈ Spec R\_∞ be the preimage of ker f and y its contraction to S\_∞ (the preimage of Ann\_Λ(𝒪(ν + w\_0^G λ)^{-1})). The inertial characters on the diagonal of ρ|\_{G\_{F\_v}} are pairwise distinct for v ∈ S\_p, so x lies on a maximal-dimensional component of Spec R\_∞ (Lemma 6.2.27(3)), and Corollary 6.3.9 gives ker f ∈ Supp H^\*(B(μ,1)\_𝔪 ⊗^L\_Λ 𝒪(ν + w\_0^G λ)^{-1})[1/p]; by Corollary 6.6.6, ker f ∈ Supp H^\*(A\_1(λ,1,1)\_𝔪 ⊗\_𝒪 𝒪(ν + w\_0^G λ)^{-1})[1/p], a quotient of Hom\_E(H^{d−\*}(X\_{K(1,1)}, 𝒱\_λ)\_𝔪, 𝒪(ν + w\_0^G λ)^{-1}[1/p]).

Prerequisites: `PA.4` (constructions in this layer); `PA.3`; `LGD:L7`; `LGD:L8`; `LGD:R08.2`; `DP:P9`. Source: [ACC](#source-acc), §6.6.1, proof of Theorem 6.6.2, pp. 1080–1081.

<a id="ordinary-lifting-at-good-level"></a>

**Ordinary lifting at good level** (`ordinary_lifting_at_good_level`). Under (1)–(15) of §6.6.1, let ρ: G\_F → GL\_n(Q̄\_p) be continuous and λ ∈ (ℤ^n\_+)^{Hom(F,Q̄\_p)} such that: (1) ρ̄ ≅ r̄\_ι(π); (2) for each v | p, ρ|\_{G\_{F\_v}} is conjugate to an upper-triangular representation with diagonal characters ψ\_{v,1}, …, ψ\_{v,n}, where ψ\_{v,i} agrees on the whole inertia group I\_{F\_v} with σ ↦ ∏\_{τ∈Hom(F\_v,Q̄\_p)} τ(Art\_{F\_v}^{-1}(σ))^{−(λ\_{τ,n−i+1} + i − 1)}; (3) for each v | p, each i and each p-power root of unity x ∈ 𝒪\_{F\_v}: ∏\_{τ∈Hom(F\_v,Q̄\_p)} τ(x)^{λ\_{τ,n+1−i} − μ\_{ιτ,n+1−i}} = 1; (4) ρ unramified at finite v ∉ S; (5) ρ|\_{G\_{F\_v}} unipotently ramified for v ∈ R. Then ρ is ordinarily automorphic of weight ιλ: there is an ι-ordinary cuspidal automorphic Π of GL\_n(𝔸\_F) of weight ιλ with ρ ≅ r\_ι(Π), and Π\_v is unramified for every finite v ∉ S. (No analogue of Theorem 6.5.4 is proved, because the irreducible components of the 𝒟^{det,ord} lifting rings are not understood well enough.)

Prerequisites: `PA.4` (constructions in this layer); `ALS:ALS.5`. Source: [ACC](#source-acc), §6.6.1, Theorem 6.6.2, p. 1075; proof pp. 1080–1081.

### Lifting over the original field

Use the independent soluble field constructions of PA.5 to reach the good-level hypotheses, apply the appropriate lifting result, and descend. Recover unramified local components using the local Weil–Deligne comparison. The rank-one character case is treated before the higher-rank reduction.

<a id="fontaine-laffaille-lifting-descent"></a>

**Fontaine–Laffaille lifting descent** (`fontaine_laffaille_lifting_descent`). Let F, ρ, π, λ, ι satisfy the hypotheses of Theorem 6.1.1 ((1) ρ unramified almost everywhere; (2) ρ|\_{G\_{F\_v}} crystalline for v | p, p unramified in F; (3) ρ̄ absolutely irreducible and decomposed generic, ρ̄(G\_{F(ζ\_p)}) enormous; (4) some σ ∈ G\_F − G\_{F(ζ\_p)} with ρ̄(σ) scalar, p > n²; (5) π cuspidal regular algebraic of weight λ with λ\_{τ,1} + λ\_{τc,1} − λ\_{τ,n} − λ\_{τc,n} < p − 2n, ρ̄ ≅ r̄\_ι(π), HT\_τ(ρ) = {λ\_{ιτ,1} + n − 1, …, λ\_{ιτ,n}}, π\_v unramified for v | p). The totally real case reduces to the imaginary CM case by base change. For imaginary F: choose V\_0, V\_1, V\_2 and a soluble CM E/F as in the split-test and Fontaine–Laffaille field constructions in PA.5 and auxiliary places v\_0, v′\_0 so that §6.5.1 (1)–(17) hold for E, π\_E and S = S′ ∪ {v\_0, v′\_0}; Corollary 6.5.5 for ρ|\_{G\_E} and Proposition 6.5.13(2) give a cuspidal regular algebraic Π of GL\_n(𝔸\_F) of weight λ with ρ ≅ r\_ι(Π), with Π\_{E,w} unramified for w ∉ S; unramifiedness of Π\_v at finite v ∤ p where ρ and π are unramified follows from the Varma argument. For v | p, unramifiedness follows from the unramified component Π\_{E,w} and p being unramified in E.

Prerequisites: `PA.5`; `PA.4` (constructions in this layer); `AG:AG2.5`. Source: [ACC](#source-acc), §6.5.12, proof of Theorem 6.1.1, pp. 1071–1074.

<a id="ordinary-lifting-descent"></a>

**Ordinary lifting descent** (`ordinary_lifting_descent`). Let F, ρ, λ, π, ι satisfy Theorem 6.1.2 ((1) ρ unramified almost everywhere; (2) for v | p, ρ|\_{G\_{F\_v}} potentially semistable and ordinary of regular weight λ ∈ (ℤ^n\_+)^{Hom(F,Q̄\_p)}: upper triangular with diagonal ψ\_{v,i} agreeing with σ ↦ ∏\_τ τ(Art\_{F\_v}^{-1}(σ))^{−(λ\_{τ,n−i+1}+i−1)} on an open subgroup of I\_{F\_v}; (3) ρ̄ absolutely irreducible and decomposed generic, ρ̄(G\_{F(ζ\_p)}) enormous, some σ ∈ G\_F − G\_{F(ζ\_p)} with ρ̄(σ) scalar, p > n; (4) π regular algebraic cuspidal and ι-ordinary with r̄\_ι(π) ≅ ρ̄). The totally real case reduces to the imaginary CM case by base change. For imaginary F choose V\_0, V\_1, V\_2, the ordinary field extension E of PA.5 and auxiliary places v\_0, v′\_0 so that (1)–(15) of §6.6.1 hold for E, π\_E, S; Theorem 6.6.2 applied to ρ|\_{G\_E} gives an ι-ordinary cuspidal Π\_E of weight λ\_E with r\_ι(Π\_E) ≅ ρ|\_{G\_E}; Proposition 6.5.13(2) and [Ger19, Lem. 5.7] descend it to an ι-ordinary cuspidal regular algebraic Π of GL\_n(𝔸\_F) of weight λ with r\_ι(Π) ≅ ρ; Π\_{E,w} is unramified for w ∉ S, and Π\_v is unramified at finite v ∤ p where ρ and π are unramified (the Varma local–global comparison).

Prerequisites: `PA.5`; `PA.4` (constructions in this layer); `PA.2`; `AG:AG2.5`. Source: [ACC](#source-acc), §6.6.10, proof of Theorem 6.1.2, pp. 1081–1084.

<a id="fontaine-laffaille-automorphy-lifting"></a>

**Fontaine–Laffaille automorphy lifting** (`fontaine_laffaille_automorphy_lifting`). Let F be an imaginary CM or totally real field, c ∈ Aut(F) complex conjugation, p a prime, and ρ : G\_F → GL\_n(ℚ̄\_p) continuous with: (1) ρ unramified almost everywhere; (2) ρ|\_{G\_{F\_v}} crystalline for every v | p, and p unramified in F; (3) ρ̄ absolutely irreducible and decomposed generic (Definition 4.3.1), and ρ̄(G\_{F(ζ\_p)}) enormous (Definition 6.2.29); (4) there is σ ∈ G\_F − G\_{F(ζ\_p)} with ρ̄(σ) scalar, and p > n²; (5) there is a cuspidal automorphic π of GL\_n(𝔸\_F) with (a) π regular algebraic of weight λ satisfying λ\_{τ,1} + λ\_{τc,1} − λ\_{τ,n} − λ\_{τc,n} < p − 2n for all τ; (b) an isomorphism ι : ℚ̄\_p → ℂ with ρ̄ ≅ r̄\_ι(π) and HT\_τ(ρ) = {λ\_{ιτ,1} + n − 1, λ\_{ιτ,2} + n − 2, …, λ\_{ιτ,n}} for every τ : F ↪ ℚ̄\_p; (c) π\_v unramified for every v | p. Then ρ is automorphic: ρ ≅ r\_ι(Π) for a cuspidal automorphic Π of GL\_n(𝔸\_F) of weight λ; moreover Π\_v is unramified at every finite v with v | p or with ρ and π both unramified at v. (Remark 6.1.4, folded here: the image of Pρ̄ equals that of ad ρ̄, so the first half of (4) is equivalent to ζ\_p ∉ F̄^{ker ad ρ̄}; when p is unramified in F it follows from the non-existence of a surjection (ad ρ̄)(G\_F) ↠ (ℤ/pℤ)^×.)

Prerequisites: `PA.4` (constructions in this layer); `AG:AG2.7`; `AG:AG2.5`; `GGD:G7`; `ALS:ALS.5`; `PA.5`; `CS:R24.5`. Source: [ACC](#source-acc), §6.1, Theorem 6.1.1 and Remark 6.1.4, pp. 1029–1030.

<a id="ordinary-automorphy-lifting"></a>

**Ordinary automorphy lifting** (`ordinary_automorphy_lifting`). Let F be an imaginary CM or totally real field, c complex conjugation, p a prime, and ρ : G\_F → GL\_n(ℚ̄\_p) continuous with: (1) ρ unramified almost everywhere; (2) for every v | p, ρ|\_{G\_{F\_v}} is potentially semistable and ordinary with regular Hodge–Tate weights: there is λ ∈ (ℤ^n\_+)^{Hom(F,ℚ̄\_p)} such that for each v | p, ρ|\_{G\_{F\_v}} ∼ an upper-triangular representation with diagonal characters ψ\_{v,1}, …, ψ\_{v,n} : G\_{F\_v} → ℚ̄\_p^×, where ψ\_{v,i} agrees on an open subgroup of I\_{F\_v} with σ ↦ ∏\_{τ ∈ Hom(F\_v, ℚ̄\_p)} τ(Art\_{F\_v}^{-1}(σ))^{−(λ\_{τ,n−i+1} + i − 1)}; (3) ρ̄ absolutely irreducible and decomposed generic, and ρ̄(G\_{F(ζ\_p)}) enormous; (4) there is σ ∈ G\_F − G\_{F(ζ\_p)} with ρ̄(σ) scalar, and p > n; (5) there are a regular algebraic cuspidal automorphic π of GL\_n(𝔸\_F) and ι : ℚ̄\_p → ℂ with π ι-ordinary and r̄\_ι(π) ≅ ρ̄. Then ρ is ordinarily automorphic of weight ιλ: ρ ≅ r\_ι(Π) for an ι-ordinary cuspidal automorphic Π of GL\_n(𝔸\_F) of weight ιλ; for finite v ∤ p with ρ and π unramified at v, Π\_v is unramified. (Remark 6.1.3, folded here: the existence of Π forces λ to be conjugate self-dual up to twist, λ\_{τ,i} + λ\_{τc,n+1−i} = w for some w ∈ ℤ, by Clozel's purity lemma [Clo90, Lem. 4.9]; this is not assumed. The proof shows ρ contributes to the ordinary part of completed cohomology and gets Π by 'independence of weight'.)

Prerequisites: `PA.4` (constructions in this layer); `AG:AG2.7`; `AG:AG2.5`; `GGD:G7`; `ALS:ALS.5`; `PA.5`; `CS:R24.5`; `PA.2`. Source: [ACC](#source-acc), §6.1, Theorem 6.1.2 and Remark 6.1.3, pp. 1029–1030.

## PA.5 — Soluble transport and rank-two compatible systems

### Soluble transport and split test primes

Iterate cyclic base change and descent with irreducibility maintained. A finite collection of split-test primes controls both residual and cyclotomic images. These transport results are independent of the lifting conclusions in PA.4.

<a id="genericity-normal-closure-restriction"></a>

**Genericity normal closure restriction** (`genericity_normal_closure_restriction`). Let F be a number field and r̄: G\_F → GL\_n(F̄\_l) continuous, absolutely irreducible and decomposed generic. Let K/Q be a finite Galois extension linearly disjoint over Q from the Galois closure over Q of F̄^{ker r̄}(ζ\_l). Then r̄|G\_{FK} is absolutely irreducible and decomposed generic. In the proof of Theorem 1.4 this is applied with K = L′LF^suff(ζ\_N), which is Galois over Q with K ∩ F^avoid = Q, and FK = F′. Apply the disjointness over Q to K; the resulting field FK contains F.

Prerequisites: `AG:AG2.7`; `Tau Ceti Chebotarev L10`. Source: [ACC](#source-acc), Lemma 7.1.7, p. 1091.

<a id="residual-lifting-hypothesis-restriction"></a>

**Residual lifting hypothesis restriction** (`residual_lifting_hypothesis_restriction`). Let F be a number field, l a prime, r: G\_F → GL\_n(Q̄\_l) continuous with residual representation r̄, and M = F^{ker r̄}(ζ\_l). Let F'/F be a finite extension linearly disjoint from M over F. Then G\_{F'} surjects onto Gal(M/F), so r̄(G\_{F'}) = r̄(G\_F) and r̄(G\_{F'(ζ\_l)}) = r̄(G\_{F(ζ\_l)}). Consequently: r̄|G\_{F'} is absolutely irreducible if r̄ is; r̄(G\_{F'(ζ\_l)}) is enormous if r̄(G\_{F(ζ\_l)}) is; and if σ ∈ G\_F − G\_{F(ζ\_l)} has r̄(σ) scalar, then some σ' ∈ G\_{F'} − G\_{F'(ζ\_l)} has r̄(σ') = r̄(σ). If r is unramified almost everywhere, so is r|G\_{F'}. Suppose r|G\_{F\_v} is potentially semistable and ordinary of weight λ\_v (Definition 1.2). Then for each place w | v of F', r|G\_{F'\_w} is potentially semistable and ordinary of weight (λ\_{v,τ'|F\_v})\_{τ'}, by the compatibility Art\_{F\_v} ∘ N\_{F'\_w/F\_v} = (restriction) ∘ Art\_{F'\_w}. Decomposed genericity is not covered here; it needs ACC+ Lemma 7.1.7.

Prerequisites: `AG:AG2.7`; `CS:R24.5:operations`. Source: [Qian](#source-qian), Remark after Definition 1.3, p. 1241; proof of Theorem 1.4, p. 1274; NSF online-first PDF pp. 3 and 36.

<a id="soluble-base-change-and-descent"></a>

**Soluble base change and descent** (`soluble_base_change_and_descent`). Fix n ≥ 2, a prime p and ι: Q̄\_p ≅ ℂ. Let F be imaginary CM or totally real and E/F a finite Galois extension with Gal(E/F) soluble and E imaginary CM or totally real. (1) If π is a cuspidal regular algebraic automorphic representation of GL\_n(𝔸\_F) of weight λ = (λ\_τ)\_{τ∈Hom(F,ℂ)} with r\_ι(π)|G\_E irreducible, there is a cuspidal regular algebraic π\_E of GL\_n(𝔸\_E) of weight λ\_{E,τ} = λ\_{τ|F} with r\_ι(π\_E) ≅ r\_ι(π)|G\_E, and rec\_{E\_w}(π\_{E,w}) = rec\_{F\_v}(π\_v)|\_{W\_{E\_w}} for every finite place w | v. (2) If ρ: G\_F → GL\_n(Q̄\_p) is continuous with ρ|G\_E irreducible and ρ|G\_E ≅ r\_ι(Π) for a cuspidal regular algebraic Π of GL\_n(𝔸\_E) of weight λ, then λ\_{F,τ} = λ\_{τ′} (τ′ any extension of τ to E) is well defined and there is a cuspidal regular algebraic π\_F of GL\_n(𝔸\_F) of weight λ\_F with ρ ≅ r\_ι(π\_F) and rec\_{E\_w}(Π\_w) = rec\_{F\_v}(π\_{F,v})|\_{W\_{E\_w}} for every finite w | v. The identities at every finite place use the Arthur–Clozel local base change at v and its compatibility with the local Langlands correspondence (Harris–Taylor, Ch. VII), supplied with the cyclic base change by ET.7a.

Prerequisites: `ET:ET.7a`; `AL:AL.3`; `Tau Ceti Chebotarev L10`; `AG:AG2.6`; `AG:AG2.2`. Source: [ACC](#source-acc), §6.5.12, Proposition 6.5.13 and its proof, pp. 1070–1072.

Concrete checks:

- For E = F both parts are the identity.
- The cuspidality of π\_E needs irreducibility of r\_ι(π)|G\_E: for a CM quadratic E/F and π automorphically induced from E, the base change is not cuspidal.
- The weight of the descent is λ\_F, independent of the extension τ′ of τ.

<a id="split-test-prime-image-preservation"></a>

**Split test prime image preservation** (`split_test_prime_image_preservation`). Let F be imaginary CM, ρ̄ absolutely irreducible with ρ̄(G\_{F(ζ\_p)}) enormous and some σ ∈ G\_F − G\_{F(ζ\_p)} with ρ̄(σ) scalar, and K/F(ζ\_p) the extension cut out by ρ̄|\_{G\_{F(ζ\_p)}}. Choose finite sets of finite places: V\_0, all split in F(ζ\_p), such that for each subfield F(ζ\_p) ⊊ K′ ⊆ K some v ∈ V\_0 splits in F(ζ\_p) but not in K′; V\_1 such that for each subfield F ⊊ K′ ⊆ K some v ∈ V\_1 does not split in K′; V\_2 = the p\_0-adic places for a rational prime p\_0 ≠ p that is decomposed generic for ρ̄; and v ∤ 2p with ρ, π unramified at every v ∈ V\_0 ∪ V\_1 ∪ V\_2. Then for every finite Galois E/F in which all places of V\_0 ∪ V\_1 ∪ V\_2 split: ρ̄(G\_E) = ρ̄(G\_F) and ρ̄(G\_{E(ζ\_p)}) = ρ̄(G\_{F(ζ\_p)}); hence ρ̄|\_{G\_{E(ζ\_p)}} has enormous image, some σ ∈ G\_E − G\_{E(ζ\_p)} has ρ̄(σ) scalar, and ρ̄|\_{G\_E} is decomposed generic (p\_0 splits in E).

Prerequisites: `PA.5` (constructions in this layer); `AG:AG2.7`. Source: [ACC](#source-acc), §6.5.12, proof of Theorem 6.1.1, p. 1072 (and §6.6.10, p. 1082).

<a id="fontaine-laffaille-base-change-fields"></a>

**Fontaine–Laffaille base change fields** (`fontaine_laffaille_base_change_fields`). Let E\_0/F be a soluble CM extension such that: all places of V\_0 ∪ V\_1 ∪ V\_2 split and p is unramified in E\_0; π\_{E\_0,w}^{Iw\_w} ≠ 0 for every finite w; at every finite prime-to-p w, either π\_{E\_0,w} and ρ|\_{G\_{E\_0,w}} are both unramified, or ρ|\_{G\_{E\_0,w}} is unipotently ramified, q\_w ≡ 1 mod p and ρ̄|\_{G\_{E\_0,w}} is trivial; every w̄ | p of E\_0⁺ splits in E\_0 and admits w̄′ ≠ w̄, w̄′ | p, with Σ\_{w̄″≠w̄,w̄′} [E⁺\_{0,w̄″}:ℚ\_p] > ½[E\_0⁺:ℚ]. Choose imaginary quadratic E\_a, E\_b, E\_c with: every rational prime below V\_0 ∪ V\_1 ∪ V\_2 splits in E\_aE\_bE\_c and p is unramified in E\_aE\_bE\_c; 2 and p split in E\_a; every l ∉ {2,p} below a place of E\_0 where π\_{E\_0} or ρ ramifies, or ramified in E\_0E\_aE\_c, splits in E\_b; every l ∉ {2,p} ramified in E\_b splits in E\_c (e.g. E\_b = ℚ(√−p\_b) with p\_b ≡ 1 mod 4 and p\_b ≡ −1 mod each such l, E\_c = ℚ(√−p\_c) with p\_c ≡ 1 mod 4p\_b, p\_c ≠ p and p\_b ≠ p; also impose p\_b ≡ p\_c ≡ −1 mod each rational prime below V\_0∪V\_1∪V\_2; quadratic reciprocity shows p\_c splits in E\_b). Then E = E\_0E\_aE\_bE\_c is a soluble CM extension of F, split at V\_0 ∪ V\_1 ∪ V\_2, with: p unramified in E; for R = {prime-to-p w: π\_{E,w} or ρ|\_{G\_{E\_w}} ramified}, S\_p the p-adic places and S′ = S\_p ∪ R, every prime below S′ or ramified in E splits in an imaginary quadratic subfield of E; ρ̄|\_{G\_{E\_w}} trivial and q\_w ≡ 1 mod p for w ∈ R; ρ̄|\_{G\_{E(ζ\_p)}} enormous, ρ̄|\_{G\_E} decomposed generic, some σ ∈ G\_E − G\_{E(ζ\_p)} with ρ̄(σ) scalar; and the E⁺-analogue of the p-adic degree condition.

Prerequisites: `PA.5` (constructions in this layer); `PAL:PL.0`. Source: [ACC](#source-acc), §6.5.12, proof of Theorem 6.1.1, pp. 1072–1073.

<a id="ordinary-base-change-fields"></a>

**Ordinary base change fields** (`ordinary_base_change_fields`). Let E\_0/F be a soluble CM extension such that: all places of V\_0 ∪ V\_1 ∪ V\_2 split in E\_0; π\_{E\_0,w}^{Iw\_w} ≠ 0 for every finite w; at each finite prime-to-p w, either π\_{E\_0,w} and ρ|\_{G\_{E\_0,w}} are unramified, or ρ|\_{G\_{E\_0,w}} is unipotently ramified, q\_w ≡ 1 mod p and ρ̄|\_{G\_{E\_0,w}} trivial; for w | p, ρ̄|\_{G\_{E\_0,w}} is trivial and [E\_{0,w}:ℚ\_p] > n(n+1)/2 + 1; for v | p, w | v and each i, ψ\_{v,i} agrees with σ ↦ ∏\_{τ∈Hom(F\_v,Q̄\_p)} τ(Art\_{F\_v}^{-1}(σ))^{−(λ\_{τ,n−i+1}+i−1)} on all of I\_{E\_0,w}; and, with μ the weight of π\_{E\_0}, ψ\_{v,i}(Art\_{E\_0,w}(x)) · ∏\_{τ∈Hom(E\_{0,w},Q̄\_p)} τ(x)^{μ\_{ιτ,n−i+1}+i−1} = 1 for every w | p and every p-power root of unity x ∈ E\_{0,w}. Choose imaginary quadratic E\_a, E\_b, E\_c as in the FL case but without requiring p unramified (p\_c ≡ 1 mod 4p\_b and p\_b ≡ p\_c ≡ −1 mod every rational prime below V\_0∪V\_1∪V\_2). Then E = E\_0E\_aE\_bE\_c is soluble CM, V-split, and: every prime below S′ = S\_p ∪ R or ramified in E splits in an imaginary quadratic subfield of E; ρ̄|\_{G\_{E\_w}} trivial and q\_w ≡ 1 mod p for w ∈ R; ρ̄|\_{G\_{E(ζ\_p)}} enormous, ρ̄|\_{G\_E} decomposed generic, some σ ∈ G\_E − G\_{E(ζ\_p)} with ρ̄(σ) scalar; ρ̄|\_{G\_{E\_w}} trivial and [E\_w:ℚ\_p] > n(n+1)/2 + 1 for w | p. These are the field and residual/local arithmetic conditions. Construction of π\_E uses PA.5/soluble-base-change-and-descent; transport of its ι-ordinarity is the separate PA.2/iota-ordinary-soluble-base-change obligation used by PA.4/ordinary-lifting-descent.

Prerequisites: `PA.5` (constructions in this layer); `PAL:PL.0`. Source: [ACC](#source-acc), §6.6.10, proof of Theorem 6.1.2, pp. 1082–1084.

### Rank-two systems and their monodromy

Begin with extremely weak compatibility over an arbitrary number field. Rank-one classification gives the reducibility dichotomy and the irreducible trichotomy. Algebraic subdirect-product structure and the arithmetic classification of unramified forms then feed the density-one large-image result.

<a id="rank-two-reducibility-dichotomy"></a>

**Rank two reducibility dichotomy** (`rank_two_reducibility_dichotomy`). A rank-two extremely weakly compatible system R has one of two forms: every member r\_λ is irreducible, or there are rank-one weakly compatible systems 𝒳₁,𝒳₂ in the BLGGT sense with r\_λ≅χ₁,λ⊕χ₂,λ at every coefficient place λ.

Prerequisites: `CS:R24.5`; `CS:R24.5:operations`. Source: [ACC](#source-acc), §7.1, Lemma 7.1.1, p. 1086.

<a id="rank-two-system-trichotomy"></a>

**Rank-two trichotomy** (`rank_two_system_trichotomy`). Let R be an irreducible extremely weakly compatible system of rank 2. Then either (1) R is strongly irreducible; or (2) R is Artin up to twist; or (3) there are a quadratic extension F'/F and a weakly compatible system 𝒳 of characters of G\_{F'} with R ≅ Ind\_{G\_{F'}}^{G\_F} 𝒳 (R is then called induced).

Prerequisites: `PA.5` (constructions in this layer); `CS:R24.5`; `CS:R24.5:operations`. Source: [ACC](#source-acc), §7.1, Lemma 7.1.2, pp. 1086–1087.

<a id="rank-two-adjoint-monodromy"></a>

**Rank two adjoint monodromy** (`rank_two_adjoint_monodromy`). Over Q̄\_l: (1) every morphism PGL\_2 → PGL\_2 is trivial or conjugation by an element of PGL\_2(Q̄\_l); (2) every morphism PGL\_2^r → PGL\_2 is trivial or a projection followed by a conjugation; (3) up to PGL\_2(Q̄\_l)^J-conjugacy, morphisms PGL\_2^I → PGL\_2^J are induced by pairs (J\_0 ⊂ J, φ : J\_0 → I); (4) Aut(PGL\_2^I) = PGL\_2^I ⋊ S\_I; (5) a connected algebraic subgroup G ⊂ PGL\_2^J surjecting onto PGL\_2 under every projection is ≅ PGL\_2^I, embedded (up to conjugacy) through a surjection φ : J ↠ I (induction on #J and Goursat); (6) for M/Q\_l finite, (Res^M\_{Q\_l} PGL\_2)\_{Q̄\_l} ≅ PGL\_2^{Hom\_{Q\_l}(M,Q̄\_l)} with G\_{Q\_l} acting through its left action on Hom\_{Q\_l}(M, Q̄\_l); (7) forms of PGL\_2^r are classified by the middle term of H^1(Q\_l, PGL\_2^r) → H^1(Q\_l, Aut PGL\_2^r) → H^1(Q\_l, S\_r), and the unramified ones (quasi-split and split over an unramified extension) are exactly ∏\_i Res^{N\_i}\_{Q\_l} PGL\_2 with N\_i/Q\_l unramified; (8) hence, if G ⊂ ∏\_{j∈J} Res^{M\_j}\_{Q\_l} PGL\_2 is an unramified connected subgroup whose base change to Q̄\_l surjects onto every factor of PGL\_2^{⊔\_j Hom(M\_j,Q̄\_l)}, then G ≅ ∏\_{i∈I} Res^{N\_i}\_{Q\_l} PGL\_2 with N\_i/Q\_l unramified, and each (j, τ)-projection of G\_{Q̄\_l} is PGL\_2(Q̄\_l)-conjugate to the projection onto one factor of ∏\_i (Res^{N\_i}\_{Q\_l} PGL\_2)\_{Q̄\_l}.

Prerequisites: `Tau Ceti ReductiveGroups L7`; `RG:RG2.0a`. Source: [ACC](#source-acc), §7.1, proof of Lemma 7.1.3, facts (1)–(8), pp. 1088–1089.

<a id="rank-two-large-residual-image"></a>

**Rank-two large residual image** (`rank_two_large_residual_image`). Suppose R is a rank-two extremely weakly compatible system which is irreducible. A set L of rational primes of Dirichlet density one can be chosen so that bar r\_λ is absolutely irreducible for every l∈L and every λ|l. If R is neither induced nor Artin up to twist, shrink L while keeping density one so that bar r\_λ(G\_{F̃}) contains SL₂(F\_l), where F̃ is the normal closure of F/Q. The contained subgroup is over the prime field; no equality with the coefficient residue-field SL₂ is asserted.

Prerequisites: `PA.5` (constructions in this layer); `CS:R24.5`; `CS:R24.5:operations`. Source: [ACC](#source-acc), §7.1, Lemma 7.1.3, pp. 1087–1089.

### Galois composita, genericity and avoidance

Separate the finite group calculation from the field compositum construction. Decomposed genericity uses the normal closure over Q, whereas preservation of a residual image uses disjointness over F. Symmetric-power avoidance requires both disjointness conditions specified below.

<a id="simple-galois-composita"></a>

**Simple Galois composita** (`simple_galois_composita`). Let k be a field, Δ a finite simple group, and K\_1, …, K\_s finite Galois extensions of k inside a common field, each equal to k or with Galois group isomorphic to Δ. Then there is a subset J ⊂ {1, …, s} such that the compositum K = K\_1⋯K\_s is the compositum of the K\_j with j ∈ J, and restriction identifies Gal(K/k) with ∏\_{j∈J} Gal(K\_j/k) ≅ Δ^{|J|}. In particular, for disjoint subsets I, I′ of J, the composita of the K\_j over j ∈ I and over j ∈ I′ are linearly disjoint over k.

Prerequisites: `mathlib:Subgroup.goursat_surjective`; `AGR:R01.4`. Source: [Qian](#source-qian), Proof of Lemma 2.6(2), journal concordance pp. 1251–1252; NSF PDF pp. 13–14.

<a id="symmetric-power-adjoint-genericity"></a>

**Symmetric-power genericity** (`symmetric_power_adjoint_genericity`). Let F/Q be finite with normal closure F̃, m a positive integer, l > 2m + 3 a prime, and r̄: G\_F → GL\_2(F̄\_l) continuous with r̄(G\_{F̃}) ⊃ SL\_2(F\_l). Let F′/F be a finite extension linearly disjoint from F̄^{ker r̄} over F, with normal closure F̃′ over Q. If ad r̄(G\_{F̃′}) ⊃ PSL\_2(F\_l), then Sym^m r̄|\_{G\_{F′}} is decomposed generic.

Prerequisites: `PA.5` (constructions in this layer); `AG:AG2.7`; `AGR:R01.4`; `mathlib:Matrix.ProjectiveSpecialLinearGroup.rank_two_simple`; `Tau Ceti Chebotarev L10`. Source: [ACC](#source-acc), Lemma 7.1.6(3), pp. 1090–1091.

<a id="qian-symmetric-power-avoidance"></a>

**Symmetric-power avoidance** (`qian_symmetric_power_avoidance`). Let F/Q be a finite extension with normal closure F̃, n a positive integer, l > 2n + 5 a prime, and r̄: G\_F → GL\_2(F̄\_l) a continuous representation with r̄(G\_{F̃}) ⊃ SL\_2(F\_l). Put H = F̃ · F̄^{ker ad r̄}, and let H′ be the normal closure of H over Q. Let F\_1/F be a finite Galois extension that is linearly disjoint from F̄^{ker r̄} over F and linearly disjoint from H′ over F. Then Sym^{n−1} r̄|\_{G\_{F\_1}} is decomposed generic. For n = 1 this is immediate, since Sym^0 r̄ is the trivial character; for n ≥ 2 the proof rests on ACC+ Lemma 7.1.6(3) with m = n − 1.

Prerequisites: `PA.5` (constructions in this layer); `AG:AG2.7`; `AGR:R01.4`; `mathlib:Matrix.ProjectiveSpecialLinearGroup.rank_two_simple`. Source: [Qian](#source-qian), Lemma 2.6(2), p. 1251; proof pp. 1251–1252; NSF online-first PDF pp. 13–14 (journal pagination inferred from 1239–1275).

### Weak automorphy and symmetric powers

Keep prescribed primes in the weak automorphy witness: almost-everywhere equality alone does not control them. Purity upgrades this witness over CM fields. The rank-two symmetric-power formulas transport the labelled weights and determinants to the desired rank.

<a id="weak-automorphy-prime-to-set"></a>

**Weak automorphy prime to a set** (`WeaklyAutomorphicPrimeTo`). For T a finite set of finite places disjoint from S, R is weakly automorphic of level prime to T if there are a regular algebraic cuspidal π of GL\_n(𝔸\_F) and ι : M ↪ ℂ such that for all but finitely many v ∉ S and for every v ∈ T, π\_v is unramified and rec^T\_{F\_v}(π\_v)(Frob\_v) has characteristic polynomial ι(Q\_v(X)); weakly automorphic means T = ∅.

Prerequisites: `CS:R24.5`; `AG:AG2.6`; `CS:R24.5:operations`. Source: [BCGNT](#source-bianchi), Definition 6.1.2(3), author PDF p. 58.

API:

- `WeaklyAutomorphicPrimeTo.empty`: At T=∅ this is weak automorphy.
- `WeaklyAutomorphicPrimeTo.mono`: For T′⊂T disjoint from S, a witness at T is a witness at T′.
- `WeaklyAutomorphicPrimeTo.witness_at`: Every v∈T is unramified for the witnessing π and has precisely the specified polynomial.
- `WeaklyAutomorphicPrimeTo.automorphic_implies`: An automorphic system is weakly automorphic prime to any finite T disjoint from S.

Examples and tests:

- `WeaklyAutomorphicPrimeTo.empty_set` (degenerate): An automorphic system is weakly automorphic prime to ∅.
- `WeaklyAutomorphicPrimeTo.singleton` (characterisation): At T={v₀}, a witness must match at v₀ even if v₀ lies in its finite almost-everywhere exception list.
- `WeaklyAutomorphicPrimeTo.bad_set` (non-example): T∩S≠∅ is inadmissible; no unspecified Q\_v at a bad place can witness the predicate.

<a id="pure-weak-automorphy-upgrade"></a>

**Pure weak automorphy upgrade** (`pure_weak_automorphy_upgrade`). Let F be CM and R a very weakly compatible system of rank n that is weakly automorphic, via π, and pure of weight m. Then R is automorphic.

Prerequisites: `PA.5` (constructions in this layer); `CS:R24.5`; `AG:AG2.6`; `SR:SR.3`; `AG:AG2.5`. Source: [BCGNT](#source-bianchi), Lemma 6.1.4, author PDF p. 59.

<a id="density-one-crystalline-large-image"></a>

**Density one crystalline large image** (`density_one_crystalline_large_image`). Let R be a strongly irreducible very weakly compatible system of rank 2 over a number field F. The set L(R) of primes l not lying below any place of S such that r\_λ is crystalline with Hodge–Tate weights H\_τ and r̄\_λ(G\_{F̃}) contains a conjugate of SL\_2(𝔽\_l) for every λ | l (F̃ the Galois closure of F/ℚ) has Dirichlet density 1.

Prerequisites: `PA.5` (constructions in this layer); `CS:R24.5`. Source: [BCGNT](#source-bianchi), Lemma 6.1.5, author PDF p. 59.

<a id="rank-two-symmetric-power-transport"></a>

**Rank two symmetric power transport** (`rank_two_symmetric_power_transport`). For a very weakly compatible system R of rank 2 with H\_τ = {0, m}, Sym^{n−1}R has representations Sym^{n−1}r\_λ, weights {0, m, …, (n − 1)m} and determinant det^{n(n−1)/2}. Here n≥1. Regularity follows when m≠0; for m=0 and n>1 the Hodge multiset has repetitions. No automorphy or purity is inferred from the operation alone.

Prerequisites: `mathlib:Matrix.charpoly`; `CS:R24.5`; `CS:R24.5:operations`. Source: [BCGNT](#source-bianchi), §6.2, proof discussion after Remark 6.2.2, author PDF p. 60 (parallel HT formula); the determinant formula is the imported symmetric-power calculation.

Concrete checks:

- For n=3 and H={0,m}, H(Sym²)={0,m,2m} and det(Sym²)=(det r)^3.

### Weight zero, oddness and irreducibility criteria

Weight zero is the Hodge multiset {0,1}, and oddness is a determinant condition at every real place. The regularity hypothesis removes the Artin-up-to-twist branch of the rank-two trichotomy. The final large-image formulation retains the prime-field conclusion.

<a id="rank-two-weight-zero"></a>

**Rank two weight zero** (`RankTwoWeightZero`). For a rank-two compatible system with Hodge table H\_τ, WeightZero means H\_τ is the multiset {0,1} at every embedding τ. This is the BCGP automorphic-weight convention and differs from saying that the system is pure of weight 0. General system purity, regularity and strong irreducibility are imported from R24.5.

Prerequisites: `CS:R24.5`. Source: [BCGP](#source-bcgp), §9.1, definitions before Lemma 9.1.10, p. 251.

API:

- `RankTwoWeightZero.iff`: Weight zero means ∀τ,H\_τ={0,1} as multisets.
- `RankTwoWeightZero.sum`: Every Hodge multiset has sum 1.
- `RankTwoWeightZero.regular`: Its two Hodge weights are distinct, so the rank-two system is regular.
- `RankTwoWeightZero.restriction`: Pulling the Hodge table back along restriction of embeddings preserves weight zero.

Examples and tests:

- `RankTwoWeightZero.standard` (computation): The constant table {0,1} has weight zero.
- `RankTwoWeightZero.repeated_zero` (non-example): The constant table {0,0} does not have weight zero.
- `RankTwoWeightZero.reversed` (compatibility): The table presented as {1,0} has weight zero because the weights are a multiset.

<a id="rank-two-odd"></a>

**Rank two odd** (`RankTwoOdd`). For a rank-two system over a number field F, Odd means det r\_λ(c\_v)=−1 for every real place v and every coefficient place λ, where c\_v is the complex-conjugation involution. At a field with no real places the condition is vacuous. With the actual involutions supplied, it is the determinant condition on the corresponding matrices; it is not trace zero without a coefficient-characteristic restriction.

Prerequisites: `mathlib:Matrix.charpoly`; `CS:R24.5`; `AG:AG2.6`; `CS:R24.5:operations`. Source: [BCGP](#source-bcgp), §9.1 definitions before Lemma 9.1.10, p. 251.

API:

- `RankTwoOdd.det_eq`: For every real-place involution and coefficient member the determinant is −1.
- `RankTwoOdd.conjugate`: Changing the representative complex conjugation by conjugacy preserves the determinant equation.
- `RankTwoOdd.no_real_places`: If F has no real places the condition is true.
- `RankTwoOdd.automorphic_weight_zero`: The weight-zero cuspidal GL₂ system in BCGP’s setting is odd by the automorphic-system supplier.

Examples and tests:

- `RankTwoOdd.split_involution` (computation): diag(1,−1) is odd.
- `RankTwoOdd.identity` (non-example): The identity matrix over Q is not odd.
- `RankTwoOdd.empty_real_places` (degenerate): An empty real-place family satisfies the determinant condition.

<a id="rank-two-member-irreducibility-equivalence"></a>

**Rank two member irreducibility equivalence** (`rank_two_member_irreducibility_equivalence`). For a rank-two weakly compatible system R, the following are equivalent: R is irreducible on a density-one set of rational primes; every r\_λ is irreducible; at least one r\_λ is irreducible. The assertion follows from the stronger extremely weak rank-two reducibility dichotomy over the same F, not from the existing R24.5 result restricted to Q.

Prerequisites: `PA.5` (constructions in this layer); `CS:R24.5`. Source: [BCGP](#source-bcgp), Lemma 9.1.10(1), pp. 251–252.

<a id="strong-irreducibility-symmetric-square"></a>

**Strong irreducibility symmetric square** (`strong_irreducibility_symmetric_square`). For an irreducible regular rank-two weakly compatible system R, strong irreducibility of R, irreducibility of Sym²R as a system, irreducibility of every Sym²r\_λ, and irreducibility of some Sym²r\_λ are equivalent. If they fail, R is induced from a compatible system of characters of a quadratic extension F′/F. Regularity excludes the Artin-up-to-twist case. The rank-three symmetric-square implication uses rank-two representation theory, not an assertion of general lambda-independence of rank-three systems.

Prerequisites: `PA.5` (constructions in this layer); `CS:R24.5`. Source: [BCGP](#source-bcgp), Lemma 9.1.10(2), pp. 251–252.

<a id="corrected-rank-two-large-image"></a>

**Prime-field large residual image** (`corrected_rank_two_large_image`). For a strongly irreducible rank-two weakly compatible system over F, there is a density-one set of rational primes l such that for every coefficient place λ|l, bar r\_λ(G\_{F̃}) contains a conjugate of SL₂(F\_l). No regularity hypothesis is needed. This does not assert SL₂(O\_M/λ). In the real-multiplication use of BCGP Lemma 9.2.2, a separate large-image argument is required from AbelianSurfacesPotentialModularity.

Prerequisites: `PA.5` (constructions in this layer); `CS:R24.5`. Source: [BCGP](#source-bcgp), Lemma 9.1.10(3), pp. 251–252, corrected by ACC Lemma 7.1.3.

## Supplier interfaces and proof boundaries

The targets above import general theories from their owners. The following exports specify the additional precision needed for these arithmetic applications. They are requirements of the indicated mathematical statements, not substitute assumptions that can be encoded by an unspecified proposition.

| Owner and layer | Required export and consumers |
| --- | --- |
| `ArithmeticLocallySymmetricSpaces:ALS.1` | Actual algebraic coefficient lattices in groupoid/sheaf cohomology, compatible finite models and coefficient reduction; at normal neat levels, free O[Δ]-cells, compatible pullback and trace, and bounds on minimal ranks independent of the tower index. PA.0 integral models and both PA.4 towers require these exports. Two pro-v Iwahori factors of distinct residue characteristics justify neatness through ACC Lemma 6.5.2. |
| `ArithmeticLocallySymmetricSpaces:ALS.4` | Localized Siegel stratum with induced coefficients and split coefficient evaluation in ACC (2.4.7); determinant pushforward and local-system descent in Lemma 5.4.16. PA.0 and PA.2 use these specific comparisons. |
| `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality` | Hecke-adjoint Poincaré–Lefschetz/Verdier duality with the orientation system, coefficient dual/twist and degree d−1−q, including stabilizer hypotheses and determinant-component exterior pairings. This prefix supplies PA.1 duality independently of Matsushima theory. |
| `ArithmeticLocallySymmetricSpaces:ALS.5` | Automorphic realization and rational concentration from ACC Theorem 2.4.10, pp. 947–948: original range [qGL,qGL+ℓ₀], dual range [qpatch,qpatch+ℓ₀]. The patching application does not assume mod-p GLₙ concentration. |
| `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension` | Smooth modules over Δₚ and B⁺ with O/varpiᵐ coefficients, enough injectives, and injective preservation under the restrictions of ACC Lemma 5.2.4, pp. 996–997. PA.2 needs coefficient characteristic p. |
| `SmoothRepresentationsOfLocalGroups:SR.1` | Positive-monoid Hecke algebra restriction/integration, evaluation splitting and exact double-coset formulas from ACC Lemmas 2.1.10–2.1.14, pp. 913–916, compatible with twisted integral coefficients. Also the residual Iwahori Bernstein presentation at qv≡1 mod p, p>n, split spherical inclusion, ordered distinct-root support and selected-character trace of KT §5, Lemmas 5.1–5.4, manuscript pp. 25–27. PA.4 applies these to torsion cohomology modules. |
| `SmoothRepresentationsOfLocalGroups:SR.2` | Exact smooth parabolic induction, its adjunction with exact restriction, injective preservation and compact-chart functors over O/varpiᵐ. PA.2 adds the specific Bruhat and ordinary comparisons. |
| `SmoothRepresentationsOfLocalGroups:SR.3` | Purity implies irreducibility of the normalized unramified principal series used in BCGNT Lemma 6.1.4, p. 59. Preserve the normalization of recᵀ. |
| `IgusaVarietiesAndTorsionConcentration:IG.7` | ACC Theorem 4.3.3 and Corollary 4.3.2, pp. 973–974, with f>1, the rational-prime splitting/unramified condition, rank-at-most-two residual unitary support and decomposed genericity. The unitary vanishing below/above d makes middle cohomology torsion-free and gives boundary surjectivity in both PA.1 and PA.2. |
| `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3` | ACC §4.1, pp. 965–969, with K/Qₚ unramified, p>n, interval [aτ,aτ+p−n−1], contravariant normalized Gᵃ, crystalline/Teichmüller twists, residual FL multisets, tensor formula (4.1.1), and the lattice/essential-image and subquotient result of Theorem 3.2.5. |
| `PadicHodgeTheory:R06.4` | Rational crystalline and labelled Hodge–Tate comparisons with geometric Artin and HT(ε)=−1, including the character-twist calculation for ACC Theorem 4.5.1. |
| `AutomorphicGaloisRepresentationsPartII:AG2.0` | Weight and reciprocity dictionaries; prescribed crystalline global character with an arbitrary integer exponent on units (including exponent 1 for the second alternative of ACC Theorem 4.5.1); algebraic Hecke-character realization and compatibility with π⊗(ψ∘det). |
| `AutomorphicGaloisRepresentationsPartII:AG2.2`, `AG2.3`, `AG2.6` | Degree-2n unitary Galois attachment with its split-place polynomials and algebraic twists; removal of the auxiliary geometric regularity restriction by the owner's interpolation/descent; crystallinity and precise labelled unitary weights at hyperspecial unramified p places for Proposition 4.4.6, pp. 979–981. PA.1 deduces the nonselfdual rank-n comparison from these inputs. |
| `AutomorphicGaloisRepresentationsPartII:AG2.5` | Inertial comparison at R and away from p (ACC Theorem 3.1.1), and rational local–global Weil–Deligne comparison for final unramified descent. The Varma semisimplification comparison used in BCGNT Lemma 6.1.4 is also required. |
| `AutomorphicGaloisRepresentationsPartII:AG2.6` | ACC Lemmas 7.1.9–7.1.10, pp. 1091–1093: decomposed genericity yields very weak compatibility, and GL₂ supplies irreducibility and genericity. The weight-zero automorphic GL₂ system must be odd. |
| `AutomorphicGaloisRepresentationsPartII:AG2.7` | Residual automorphic representations, decomposed genericity and the existence of a completely split generic rational prime. The named genericity exports feed the twisting and field-restriction arguments. |
| `IntegralHeckeAndGaloisDeterminants:IHG.0` | For any A→B, image(ker D)⊆ker Dᵦ and B⊗ₐ(A[G]/ker D)↠B[G]/ker Dᵦ. Chenevier §1.17, Lemma 1.18(iii), §1.19 supplies the kernel convention. No surjectivity or flatness of A→B is assumed. |
| `IntegralHeckeAndGaloisDeterminants:IHG.1` | Over finite Artinian local B, the image of a split representation with absolutely irreducible, nonisomorphic residual summands is Mₙ(B)×Mₙ(B), by Burnside/Nakayama. The product determinant is faithful; export the rank-n column quotient and restriction compatibility. Chenevier Theorem 2.22 supplies multiplicity-free GMA structure, but a product-matrix conclusion requires the separate split-image argument. |
| `LocalGaloisDeformationRings:L7` | Fontaine–Laffaille framed local dimensions n²+[K:Qₚ]n(n−1)/2; ACC Lemma 6.2.11's ordered full-flag criterion from both polynomial and ordered product identities; flat reduced trivial-residual ordinary rings and components under [K:Qₚ]>n(n+1)/2+1. |
| `LocalGaloisDeformationRings:L8` | Determinant-ordinary functor, universal unit characters and closed points, with component and dimension comparisons over the chosen minimal prime of the completed torus algebra. |
| `LocalGaloisDeformationRings:R08.2` | At R with trivial residual representation and qv≡1 mod p: equality modulo varpi of the unipotent and pairwise-distinct χ-type conditions, irreducibility of the χ-type ring in characteristic zero, unique maximal-dimensional generic lifts and the dimension/drop bounds of ACC Assumption 6.3.6. |
| `GlobalGaloisDeformations:G7`, `G8` | Enormous Taylor–Wiles sets, local diamonds and framed presentations with the required field splitting and ordered eigenvalues; the two global problems with the same framings, variable global determinant, local-to-global reductions and diamond-linear universal representations. A fixed global determinant variant needs a new dimension calculation. |
| `DeformationAndDerivedPatchingAlgebra:P7` | Derived idempotent splitting, finite-perfect dual/tensor/reduction comparisons and compatible perfect inverse-limit reconstruction for Λ₁,c. Import the minimal-complex machinery; prove the arithmetic uniform bounds needed to use it. |
| `DeformationAndDerivedPatchingAlgebra:P8` | ACC §6.4 at one fixed nonprincipal ultrafilter: uniform minimal ranks, paired reductions, common Hecke images, compatible quotient deformation actions, bounded nilpotent ideals and derived augmentation/specialization. Remark 6.4.13, p. 1059, concerns transition-map choices; it does not assert independence of the ultrafilter. |
| `DeformationAndDerivedPatchingAlgebra:P9` | Complete perfect-pair support contract of ACC §6.3.5, Assumption 6.3.6, Proposition 6.3.8 and Corollary 6.3.9, pp. 1051–1053, including unique generic lifts, strict lower-component dimensions and characteristic-zero augmentation support. PA.3 verifies local hypotheses; PA.4 supplies the pair. |
| `PotentialModularityAndCompatibleSystems:R24.5:operations` | Rank-one classification and coefficient enlargement over arbitrary F for extremely weak systems, including E-rational abelian representations being locally algebraic; Larsen–Pink unramified monodromy and Larsen density-one maximality in that regime. Rational weak-system results over Q with all-member Hodge–Tate hypotheses alone do not provide this export. |
| `PotentialModularityAndCompatibleSystems:R24.5` | System operations for very/extremely weak data, canonical Hodge metadata, integral lattices/reductions and local WD transport. Reconcile a weak carrier with all-member de Rham/Hodge clauses with the weakened-data carrier before using weakening maps. Extremely weak compatibility asserts the determinant weights, not arbitrary full-member weights. |
| `PotentialModularityAndCompatibleSystems:R24.5/character-system` | Realization of algebraic Hecke characters once constructed, crystalline normalization, and the converse for finitely ramified de Rham rank-one characters. This supplies rank-one branches of compatibility and lifting. |
| `ArithmeticGaloisRepresentations:G7/enormous-symmetric-powers`, `G7/taylor-wiles-image-lemmas` | The finite-image symmetric-power and scalar calculations used by ACC Lemmas 7.1.4 and 7.1.6. PA.5 imports these rather than rebuilding their general finite-group theory. |
| `PadicFamilies:L0a`, `ArithmeticGaloisRepresentations:R01.4`, `PotentialAutomorphyInfrastructurePartII:PL.0` | Respectively the Artinian ordinary projector, finite-group automorphism/Dickson calculations, and auxiliary soluble CM extensions with prescribed local behavior and avoidance. Their general definitions remain with these owners. |
| `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ` | General roots, Weyl groups, parabolics, Levi decompositions and pinned split integral group schemes. PA.1 adds Siegel shuffles and linkage/alcove bounds. Integral induced/Weyl/dual-Weyl modules, lattice splittings and lowest-weight projections require ReductiveGroupsIntegralRepresentationsPartII. |
| `ReductiveGroupsPartII:RG2.0a` | Weil restriction of PGL₂ along finite separable local extensions, its algebraic-closure product indexed by embeddings and the Galois permutation action (ACC Lemma 7.1.3, fact (6), p. 1088). |
| Arithmetic reductive-group forms | Facts (7)–(8) of ACC Lemma 7.1.3, pp. 1088–1089: Aut(PGL₂ʳ)=PGL₂ʳ⋊Sᵣ, classification by H¹(Qₗ,Aut(PGL₂ʳ)), and identification of quasi-split forms split over an unramified extension with products of Res from unramified extensions. Neither finite abstract Goursat nor the split-group theory supplies this descent classification. No layer identifier is assigned here. |
| `EndoscopicTransferAndUnitaryTraceComparison:ET.7a` | Arthur–Clozel cyclic prime-degree base change/descent, Chapter 3, Theorems 4.2 and 5.1, retaining regular algebraic weights and local base change at every finite place. Local Langlands compatibility is needed to restrict rec to Wₑw in PA.5. The source application is ACC Proposition 6.5.13, pp. 1070–1072. |
| `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev` | Density-one equality of Frobenius polynomials identifies continuous semisimple representations; prescribed joint residual/cyclotomic Frobenius classes give infinitely many degree-one auxiliary places after finite exclusions. PA.5 also uses the normal-closure compositum calculation over Q. |
| `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality` | Finite-module local Tate duality: scalar residual Frobenius and qv≢1 mod p give H²(Ev,ad ρ̄)=0. Use the trace pairing on the full endomorphism module; no division by n on the trace-zero module is needed. |

Several source-dependent interfaces need separate proof completion. The integral highest-weight and arithmetic-form classifications require their owners' layer designations. The primary eigenvalue calculation for a twisted Steinberg representation (Geraghty Lemma 5.2) and the nonsplit-p-adic soluble transport of ordinarity (Lemma 5.7) are not supplied by the restated BLGGT definition or by the split local argument. Qian's proof of Lemma 4.3, journal concordance p. 1273 / NSF p. 35, and ACC pp. 1028, 1084 identify these two inputs, but their primary statements remain to be established at the required precision. The Henniart/Serre rank-one and Larsen–Pink/Larsen monodromy leaves likewise require the extremely weak, arbitrary-F versions in R24.5.

The ordinary determinant transfer has an additional local proof requirement. ACC Theorem 5.4.3 provides a map onto the Satake image. To obtain Proposition 5.4.18 over the larger GLₙ Hecke algebra, prove a polynomial-law/kernel argument over the O-flat unitary algebra and carry the identities through base change to every relevant group-algebra element. A map onto the image alone does not supply that argument. PA.2's all-degree characteristic data and local–global theorem depend on this completion.

Uniform free diamond-cell models, common bounds on minimal ranks and compatible derived reconstruction are required before the perfect arithmetic towers can be used in PA.4. Their existence is not inferred for every good non-neat quotient. These requirements, together with the missing arithmetic carrier interfaces, explain why the suggested file types its local cores while retaining the full arithmetic definitions, APIs, examples and theorem contracts as mathematical comments.

## Sources

All mathematical statements above are in the conventions stated here. Page locators for ACC and BLGGT refer to the published editions. Qian locators give the journal pagination concordance and the physical page in the NSF online-first PDF. BCGNT and BCGP locators refer to the linked author manuscripts.

<a id="source-acc"></a>

- **ACC**: Patrick Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James Newton, Peter Scholze, Richard Taylor, Jack Thorne, [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf). Published Annals of Mathematics 197 (2023), 897–1113; author-hosted published PDF.

<a id="source-qian"></a>

- **Qian**: Lie Qian, [Potential automorphy for GL_n](https://par.nsf.gov/servlets/purl/10388233). Inventiones Mathematicae 231 (2023), 1239–1275; NSF-hosted Springer online-first publisher PDF with 37 unpaginated physical pages. Journal page numbers in locators are a concordance; physical PDF pages are recorded separately.

<a id="source-bianchi"></a>

- **BCGNT**: George Boxer, Frank Calegari, Toby Gee, James Newton, Jack Thorne, [The Ramanujan and Sato–Tate Conjectures for Bianchi modular forms](https://www.ma.imperial.ac.uk/~tsg/Index_files/SatoTate.pdf). Author-hosted 2025 PDF; Definition 6.1.2 is on author page 58 and Lemmas 6.1.4–6.1.5 on page 59.

<a id="source-bcgp"></a>

- **BCGP**: George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, [Abelian surfaces over totally real fields are potentially modular](https://www.ma.imperial.ac.uk/~gboxer/abeliansurfacesmodular.pdf). Author-hosted published manuscript (2021); §9.1 pp. 251–252.

<a id="source-chenevier"></a>

- **Chenevier**: Gaëtan Chenevier, [The p-adic analytic space of pseudocharacters of a profinite group and pseudorepresentations over arbitrary rings](https://arxiv.org/pdf/0809.0415). Public arXiv author text 0809.0415; determinant-kernel and multiplicity-free reconstruction passages.

<a id="source-blggt"></a>

- **BLGGT (preprint)**: Thomas Barnet-Lamb, Toby Gee, David Geraghty, Richard Taylor, [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561). arXiv 1010.2561 (author preprint of Ann. of Math. 179 (2014), 501–609).

<a id="source-blggt-published"></a>

- **BLGGT**: Thomas Barnet-Lamb, Toby Gee, David Geraghty, Richard Taylor, [Potential automorphy and change of weight](https://annals.math.princeton.edu/wp-content/uploads/annals-v179-n2-p03-p.pdf). Published Annals of Mathematics 179 (2014), 501–609; publisher PDF.

<a id="source-kt"></a>

- **KT**: Chandrashekhar Khare, Jack Thorne, [Potential automorphy and the Leopoldt conjecture](https://www.repository.cam.ac.uk/bitstream/1810/254249/1/Khare%20et%20al%202016%20American%20Journal%20of%20Mathematics.pdf). Cambridge repository author manuscript of American Journal of Mathematics 139 (2017), 1205–1273.
