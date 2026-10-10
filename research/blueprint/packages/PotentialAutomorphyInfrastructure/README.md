# Roadmap: potential automorphy infrastructure

This roadmap builds the arithmetic comparisons that let torsion cohomology produce automorphy lifting theorems for GLₙ over CM fields, and the transport lemmas that let potential automorphy arguments reuse them. Its central objects are integral coefficient systems, localized boundary cohomology, ordinary completed cohomology, arithmetic deformation–Hecke maps and paired patched complexes. Its two main lifting results are the Fontaine–Laffaille and ordinary theorems of Allen–Calegari–Caraiani–Gee–Helm–Le Hung–Newton–Scholze–Taylor–Thorne. Neither result assumes a polarization of the rank-n representation. Layer 2 provides soluble base change and descent, residual-image preservation, and rank-two compatible-system tools used by symmetric-power arguments.

The constructions retain coefficient rings, levels, twists, labelled weights and degree shifts. Each patching application exhibits its algebraic data. Support describes primes at which a module is nonzero; it does not identify integral deformation and Hecke rings. Rank-one characters and the stated higher-rank p-bounds remain distinct branches.

The suggested file proposes declaration names, local algebraic and combinatorial cores, API lemmas and examples. Its arithmetic contracts require the carriers exported by neighbouring roadmaps. Their mathematical statements are given here even when those carriers are not yet available for Lean signatures. The local prototypes alone do not construct arithmetic spaces, compatible systems or automorphic representations.

## Scope and ownership

The reusable spaces, Borel–Serre compactification, sheaf cohomology, derived Hecke actions, finite-level duality and Matsushima comparison belong to **ArithmeticLocallySymmetricSpaces**. Smooth induction, coefficient-p monoid categories and general double-coset algebras belong to **SmoothRepresentationsOfLocalGroups**. The unitary torsion concentration theorem belongs to **IgusaVarietiesAndTorsionConcentration:IG.7**. This roadmap applies those theories to the explicit Siegel coefficients and ordinary towers; it does not reconstruct them.

Integral Fontaine–Laffaille categories belong to **FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3**, rational crystalline comparisons to **PadicHodgeTheory:R06.4**, and the general Galois attachment and local–global comparisons to **AutomorphicGaloisRepresentationsPartII**. Determinants, determinant kernels and reconstruction belong to **IntegralHeckeAndGaloisDeterminants**. Local and global deformation rings belong to **LocalGaloisDeformationRings** and **GlobalGaloisDeformations**. Perfect-complex reconstruction, ultrapatching and abstract support belong to **DeformationAndDerivedPatchingAlgebra:P7–P9**. Layer 4 and Layer 5 verify the arithmetic inputs to those results.

Compatible-system carriers, operations and rank-one classifications belong to **PotentialModularityAndCompatibleSystems:R24.5**. Finite-image enormousness and scalar calculations belong to **ArithmeticGaloisRepresentations:G7**. Cyclic automorphic base change belongs to **EndoscopicTransferAndUnitaryTraceComparison:ET.7a**; Layer 2 owns its soluble iteration and Galois-side descent. Upstream ReductiveGroups supplies root systems, parabolics, Weyl groups and split integral group schemes. Integral highest-weight modules require **ReductiveGroupsIntegralRepresentationsPartII**, whose layer identifiers remain to be assigned. The arithmetic classification of forms of products of PGL₂ requires an arithmetic reductive-groups interface; **ReductiveGroupsArithmeticPartII** is its natural home. These two requirements are not attributed to an unrelated existing layer.

The general stable-operator splitting and localization are owned by upstream SmoothRepresentationsOfLocalGroups, SR.6.5 (`StableOperator.split`, `StableOperator.invertiblePart`). Upstream IntegralHeckeAndGaloisDeterminants, §2.3 (`Theorems.factorial_powers`, `Theorems.ordinary_finite`), owns the finite-quotient projector and derived telescope. The ordinary summand here adds the actual arithmetic level, diamond action and Hecke image; its generic stable-image theory is imported. Upstream ReductiveGroupsPartII, RG2.4, owns general Bruhat decompositions and Iwahori–Weyl combinatorics. The Siegel cells here add compact integral charts, place-indexed relative lengths and embedding-indexed absolute lengths. RG2.3 already has `LevelSubgroups.iwahori` and `proPIwahori`; this tower refines them by two congruence depths and adelic diamonds. The highest-weight theory in upstream RepresentationTheory/LieHighestWeight is over characteristic-zero fields; it supplies no integral dual-Weyl lattice.

Applications to Dwork families, construction of potential automorphy witnesses, abelian surfaces and their separate real-multiplication large-image arguments remain with their own roadmaps. This roadmap supplies the lifting and transport interfaces they use.

## Conventions

Write F⁺ for the maximal totally real subfield of an imaginary CM field F, c for complex conjugation, and f=[F⁺:Q]. Frobenius and Artin reciprocity are geometric, and HT(ε)={−1}. Dominant GLₙ rows are descending. For an algebraic weight λ the labelled Hodge–Tate multiset is {λτ,i+n−i : 1≤i≤n}. The rank-n ordinary diagonal character indexed by i uses λτ,n−i+1, so its order is part of the convention.

O is the ring of integers of a finite p-adic field E containing the required embeddings, varpi (also written ϖ) is its coefficient uniformizer, and k its residue field. A local field uniformizer ϖv is a separate choice. Write Sₚ for places of F above p and S̄ₚ for places of F⁺ above p. Chosen lifts above p identify the split rank-2n unitary factors with GL₂ₙ; choose ϖ_{vᶜ}=c(ϖ_v) compatibly with conjugation. The unitary group is G̃, its Siegel parabolic is P=GU, and G is the GLₙ Levi viewed over F⁺. At other parabolics the unipotent radical is written N. All derived categories and tensor products retain the coefficient ring in their subscript.

Put d=n²f, so dim Xₖ=d−1. For rational GLₙ cohomology put qGL=n(n−1)f/2 and ℓ₀=nf−1. Its range is [qGL,qGL+ℓ₀]. The dual arithmetic complex is RHom(RΓ,O)[−d]. After extending scalars to E, its i-th cohomology is Hom_E(Hᵈ⁻ⁱ(RΓ⊗_O E),E); over O retain derived Hom, including its Ext contributions. Consequently its rational range is [qpatch,qpatch+ℓ₀], where qpatch=qGL+1 and 2qGL+ℓ₀=d−1. The q₀ in the abstract patching hypotheses below means qpatch. It is unrelated to the number q of Taylor–Wiles places or to a residue cardinality qv.

Good non-neat levels use arithmetic groupoids. A finite free cellular complex is used only after trivial stabilizers, or the specified invertibility and free diamond-action conditions, have been proved. Hecke images are images in endomorphisms of the stated derived object; changing that object, the coefficient ring or the localization requires a comparison theorem. Superscripts “ord” refer to the ordinary action with its stated normalization. Character twists include both their unit values and their values at the chosen local uniformizers.

For n=2 and f=2, d=8, qGL=2 and ℓ₀=3: rational cohomology in degrees 2–5 dualizes to degrees 3–6, hence qpatch=3. A single free term in degree 0 dualized and shifted by −d lies in degree d. Over O, the torsion module O/ϖ in degree 0 contributes Ext¹_O(O/ϖ,O) to the dual, so the integral answer cannot use ordinary Hom. The duality, amplitude and Hida-dual targets below retain these coefficients. All local arithmetic rings here are mixed-characteristic p-adic integer rings; the matrix congruence signatures over arbitrary commutative rings assert only their algebraic congruences. A local uniformizer need not equal p in a ramified extension.

The source references used here are ACC (the ten-author CM-field paper), Qian, BLGGT, BCGNT (Bianchi modular forms), BCGP (potential modularity of abelian surfaces), Chenevier and KT (Khare–Thorne). Precise editions and public links are at the end. A source result with a repaired normalization or a restricted conclusion is stated in that form throughout; none of the arguments require the stronger discarded formulation.

## Good-level arithmetic hypotheses

The two good-level profiles below are abbreviations only. Targets outside these profiles list their own hypotheses. In particular the global lifting theorems in Layer 5 have fewer field and level restrictions, achieved using Layer 2.

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

### Supplier abbreviations

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
| `ET` | `EndoscopicTransferAndUnitaryTraceComparison` |
| `AL` | `AutomorphicLFunctionsAndLocalFactors` |
| `RG` | `ReductiveGroupsPartII` |

The upstream short names expand as follows:

- Tau Ceti ReductiveGroups L7: `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.
- Tau Ceti ReductiveGroups L9: `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`.
- Tau Ceti Chebotarev L10: `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.
- Tau Ceti ClassFieldTheory L5: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

Suggested theorem names without a namespace prefix lie in `TauCetiRoadmap.PotentialAutomorphyInfrastructure`; the definition and API namespaces are printed explicitly. Internal prerequisites refer to the stated layer and its construction route. Within each thematic subsection the statements specify the particular levels, coefficients, functors or previous theorem being used.

## Exact supplier contracts

### From Mathlib

Use Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. The following existing declarations are foundations, with the indicated scope:

| Declaration | Module | Scope of use |
| --- | --- | --- |
| `CategoryTheory.Retract`, `CategoryTheory.Retract.map` | `Mathlib.CategoryTheory.Retract` | Split maps and their functorial transport; equivariance is additional data in Layer 0. |
| `DerivedCategory`, `DerivedCategory.Q` | `Mathlib.Algebra.Homology.DerivedCategory.Basic` | Localization of cochain complexes of an abelian category at quasi-isomorphisms. |
| `Module.support` | `Mathlib.RingTheory.Support` | Primes with nonzero localization; the support target is not a ring isomorphism. |
| `Matrix.charpoly` | `Mathlib.LinearAlgebra.Matrix.Charpoly.Basic` | det(XI−M) over a commutative coefficient ring. |
| `Subgroup.goursat_surjective` | `Mathlib.GroupTheory.Goursat` | A subdirect subgroup gives an isomorphism of quotient groups; arithmetic composita require Layer 2's field step. |
| `Equiv.Perm.permGroup` | `Mathlib.Algebra.Group.End` | Permutation multiplication by composition, with the inverse convention used by left Levi shuffles. |
| `finAddFlip` | `Mathlib.Logic.Equiv.Fin.Basic` | Exchange of the two finite blocks. |
| `Matrix.ProjectiveSpecialLinearGroup.rank_two_simple` | `Mathlib.LinearAlgebra.Projectivization.PSL.PSL2` | Simplicity of PSL₂ over a finite field with at least four elements. |

The arithmetic and analytic extensions are specified by the owning layer in each target's prerequisites and in the supplier interfaces below. A reference of the form `Roadmap:Layer/declaration` asks for that precise declaration of the layer; `tauceti:TauCetiRoadmap/...#layer-...` identifies an upstream layer. Internal prerequisites name their build layer; subsection introductions specify the construction route.

### Arithmetic suppliers

The targets import general theories from their owners. The following exports specify the additional precision needed for these arithmetic applications. They are requirements of the indicated mathematical statements, not substitute assumptions that can be encoded by an unspecified proposition.

| Owner and layer | Required export and consumers |
| --- | --- |
| `ArithmeticLocallySymmetricSpaces:ALS.1` | Actual algebraic coefficient lattices in groupoid/sheaf cohomology, compatible finite models and coefficient reduction; at normal neat levels, free O[Δ]-cells, compatible pullback and trace, and bounds on minimal ranks independent of the tower index. Layer 0 integral models and both Layer 5 towers require these exports. Two pro-v Iwahori factors of distinct residue characteristics justify neatness through ACC Lemma 6.5.2. |
| `ArithmeticLocallySymmetricSpaces:ALS.4` | Localized Siegel stratum with induced coefficients and split coefficient evaluation in ACC (2.4.7); determinant pushforward and local-system descent in Lemma 5.4.16. Layer 0 and Layer 3 use these specific comparisons. |
| `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality` | Hecke-adjoint Poincaré–Lefschetz/Verdier duality with the orientation system, coefficient dual/twist and degree d−1−q, including stabilizer hypotheses and determinant-component exterior pairings. This prefix supplies Layer 1 duality independently of Matsushima theory. |
| `ArithmeticLocallySymmetricSpaces:ALS.5` | Automorphic realization and rational concentration from ACC Theorem 2.4.10, pp. 947–948: original range [qGL,qGL+ℓ₀], dual range [qpatch,qpatch+ℓ₀]. The patching application does not assume mod-p GLₙ concentration. |
| `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension` | Smooth modules over Δₚ and B⁺ with O/varpiᵐ coefficients, enough injectives, and injective preservation under the restrictions of ACC Lemma 5.2.4, pp. 996–997. Layer 3 needs coefficient characteristic p. |
| `SmoothRepresentationsOfLocalGroups:SR.1` | Positive-monoid Hecke algebra restriction/integration, evaluation splitting and exact double-coset formulas from ACC Lemmas 2.1.10–2.1.14, pp. 913–916, compatible with twisted integral coefficients. Also the residual Iwahori Bernstein presentation at qv≡1 mod p, p>n, split spherical inclusion, ordered distinct-root support and selected-character trace of KT §5, Lemmas 5.1–5.4, manuscript pp. 25–27. Layer 5 applies these to torsion cohomology modules. |
| `SmoothRepresentationsOfLocalGroups:SR.2` | Exact smooth parabolic induction, its adjunction with exact restriction, injective preservation and compact-chart functors over O/varpiᵐ. Layer 3 adds the specific Bruhat and ordinary comparisons. |
| `SmoothRepresentationsOfLocalGroups:SR.3` | Purity implies irreducibility of the normalized unramified principal series used in BCGNT Lemma 6.1.4, p. 59. Preserve the normalization of recᵀ. |
| `IgusaVarietiesAndTorsionConcentration:IG.7` | ACC Theorem 4.3.3 and Corollary 4.3.2, pp. 973–974, with f>1, the rational-prime splitting/unramified condition, rank-at-most-two residual unitary support and decomposed genericity. The unitary vanishing below/above d makes middle cohomology torsion-free and gives boundary surjectivity in both Layer 1 and Layer 3. |
| `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3` | ACC §4.1, pp. 965–969, with K/Qₚ unramified, p>n, interval [aτ,aτ+p−n−1], contravariant normalized Gᵃ, crystalline/Teichmüller twists, residual FL multisets, tensor formula (4.1.1), and the lattice/essential-image and subquotient result of Theorem 3.2.5. |
| `PadicHodgeTheory:R06.4` | Rational crystalline and labelled Hodge–Tate comparisons with geometric Artin and HT(ε)=−1, including the character-twist calculation for ACC Theorem 4.5.1. |
| `AutomorphicGaloisRepresentationsPartII:AG2.0` | Weight and reciprocity dictionaries; prescribed crystalline global character with an arbitrary integer exponent on units (including exponent 1 for the second alternative of ACC Theorem 4.5.1); algebraic Hecke-character realization and compatibility with π⊗(ψ∘det). |
| `AutomorphicGaloisRepresentationsPartII:AG2.2`, `AG2.3`, `AG2.6` | Degree-2n unitary Galois attachment with its split-place polynomials and algebraic twists; removal of the auxiliary geometric regularity restriction by the owner's interpolation/descent; crystallinity and precise labelled unitary weights at hyperspecial unramified p places for Proposition 4.4.6, pp. 979–981. Layer 1 deduces the nonselfdual rank-n comparison from these inputs. |
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
| `DeformationAndDerivedPatchingAlgebra:P9` | Complete perfect-pair support contract of ACC §6.3.5, Assumption 6.3.6, Proposition 6.3.8 and Corollary 6.3.9, pp. 1051–1053, including unique generic lifts, strict lower-component dimensions and characteristic-zero augmentation support. Layer 4 verifies local hypotheses; Layer 5 supplies the pair. |
| `PotentialModularityAndCompatibleSystems:R24.5:operations` | Rank-one classification and coefficient enlargement over arbitrary F for extremely weak systems, including E-rational abelian representations being locally algebraic; Larsen–Pink unramified monodromy and Larsen density-one maximality in that regime. Rational weak-system results over Q with all-member Hodge–Tate hypotheses alone do not provide this export. |
| `PotentialModularityAndCompatibleSystems:R24.5` | System operations for very/extremely weak data, canonical Hodge metadata, integral lattices/reductions and local WD transport. Reconcile a weak carrier with all-member de Rham/Hodge clauses with the weakened-data carrier before using weakening maps. Extremely weak compatibility asserts the determinant weights, not arbitrary full-member weights. |
| `PotentialModularityAndCompatibleSystems:R24.5/character-system` | Realization of algebraic Hecke characters once constructed, crystalline normalization, and the converse for finitely ramified de Rham rank-one characters. This supplies rank-one branches of compatibility and lifting. |
| `ArithmeticGaloisRepresentations:G7/enormous-symmetric-powers`, `G7/taylor-wiles-image-lemmas` | The finite-image symmetric-power and scalar calculations used by ACC Lemmas 7.1.4 and 7.1.6. Layer 2 imports these rather than rebuilding their general finite-group theory. |
| `PadicFamilies:L0a`, `ArithmeticGaloisRepresentations:R01.4`, Layer 2 auxiliary CM extension construction | Respectively the Artinian ordinary projector, finite-group image calculations, and soluble local prescriptions or split cyclic CM auxiliaries. |
| `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ` | General roots, Weyl groups, parabolics, Levi decompositions and pinned split integral group schemes. Layer 1 adds Siegel shuffles and linkage/alcove bounds. Integral induced/Weyl/dual-Weyl modules, lattice splittings and lowest-weight projections require ReductiveGroupsIntegralRepresentationsPartII. |
| `ReductiveGroupsPartII:RG2.0a` | Weil restriction of PGL₂ along finite separable local extensions, its algebraic-closure product indexed by embeddings and the Galois permutation action (ACC Lemma 7.1.3, fact (6), p. 1088). |
| Arithmetic reductive-group forms | Facts (7)–(8) of ACC Lemma 7.1.3, pp. 1088–1089: Aut(PGL₂ʳ)=PGL₂ʳ⋊Sᵣ, classification by H¹(Qₗ,Aut(PGL₂ʳ)), and identification of quasi-split forms split over an unramified extension with products of Res from unramified extensions. Neither finite abstract Goursat nor the split-group theory supplies this descent classification. No layer identifier is assigned here. |
| `EndoscopicTransferAndUnitaryTraceComparison:ET.7a` | Arthur–Clozel cyclic prime-degree base change/descent, Chapter 3, Theorems 4.2 and 5.1, retaining regular algebraic weights and local base change at every finite place. Local Langlands compatibility is needed to restrict rec to Wₑw in Layer 2. The source application is ACC Proposition 6.5.13, pp. 1070–1072. |
| `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev` | Density-one equality of Frobenius polynomials identifies continuous semisimple representations; prescribed joint residual/cyclotomic Frobenius classes give infinitely many degree-one auxiliary places after finite exclusions. Layer 2 also uses the normal-closure compositum calculation over Q. |
| `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality` | Finite-module local Tate duality: scalar residual Frobenius and qv≢1 mod p give H²(Ev,ad ρ̄)=0. Use the trace pairing on the full endomorphism module; no division by n on the trace-zero module is needed. |

Several source-dependent interfaces need separate proof completion. The integral highest-weight and arithmetic-form classifications require their owners' layer designations. The primary eigenvalue calculation for a twisted Steinberg representation (Geraghty Lemma 5.2) and the nonsplit-p-adic soluble transport of ordinarity (Lemma 5.7) are not supplied by the restated BLGGT definition or by the split local argument. Qian's proof of Lemma 4.3, journal concordance p. 1273 / NSF p. 35, and ACC pp. 1028, 1084 identify these two inputs, but their primary statements remain to be established at the required precision. The Henniart/Serre rank-one and Larsen–Pink/Larsen monodromy leaves likewise require the extremely weak, arbitrary-F versions in R24.5.

The ordinary determinant transfer has an additional local proof requirement. ACC Theorem 5.4.3 provides a map onto the Satake image. To obtain Proposition 5.4.18 over the larger GLₙ Hecke algebra, prove a polynomial-law/kernel argument over the O-flat unitary algebra and carry the identities through base change to every relevant group-algebra element. A map onto the image alone does not supply that argument. Layer 3's all-degree characteristic data and local–global theorem depend on this completion.

Uniform free diamond-cell models, common bounds on minimal ranks and compatible derived reconstruction are required before the perfect arithmetic towers can be used in Layer 5. Their existence is not inferred for every good non-neat quotient. The suggested file types local cores; this README states the arithmetic definitions, APIs, checks and theorem contracts.

## How to read the build

Layer 0 fixes integral coefficients and the Siegel comparison. Layer 1 establishes Fontaine–Laffaille compatibility. Layer 2 constructs the field transport and rank-two system tools independently of automorphy lifting. Layer 3 builds ordinary towers and local–global compatibility, using that transport when the split-field restrictions are removed. Layer 4 constructs the Hida dual and weight twist, then specifies the arithmetic deformation actions and the conditional support criterion. Layer 5 constructs the patched pairs, verifies that criterion and proves both lifting theorems. The conditional criterion takes a patched pair as input; it does not construct that pair or assume the lifting theorem.

## Layer 0: Integral coefficients and boundary comparison

**Integral models and equivariant splittings**

Begin with the actual arithmetic coefficient systems. The groupoid model handles good levels; the finite free model requires the separate stabilizer and diamond-action hypotheses. An equivariant retract then transports a Hecke action through a genuine split inclusion.

<a id="integral-model-comparison"></a>

### 0.1 Integral cohomology comparison

Prove `integral_model_comparison`. For F CM, the GL_n space and the split-at-p unitary space with their arithmetic coefficient local systems, the groupoid derived-invariants, sheaf-cohomology and sufficiently-neat finite cellular models represent the same RΓ object. On a finite projective O coefficient lattice V, their derived reductions to O/varpi^m, pullback/trace at finite normal levels and Hecke away from S commute with these identifications. For a normal good neat level with finite quotient Δ and free cell action the cellular complex is finite free over O[Δ]. Before freeness is proved retain the groupoid model; no finite free assertion is made with nontrivial p-stabilizers.

([ACC](#source-acc), §2.1.2, pp. 910–911 (groupoid/sheaf cohomology and Hecke actions); §2.2; §6.5.1, pp. 1064–1069 (finite normal levels and perfect cellular models)). *Needs:* `ALS:ALS.1`; `ALS:ALS.3`; `mathlib:DerivedCategory.Q`.

<a id="equivariant-retract"></a>

### 0.2 Equivariant direct summands

Define `EquivariantRetract`. For a category C, objects A,B and an indexed family of endomorphisms f_A(r), f_B(r), an EquivariantRetract is a Mathlib Retract A B with f_A(r) followed by i = i followed by f_B(r), and f_B(r) followed by the retraction = the retraction followed by f_A(r), for every r. For C=D(S) and S-algebra actions of R this is the source’s R-equivariant direct summand: the complementary idempotent splits in D(S). The general categorical carrier records no additional ring laws; actual arithmetic applications pass S-algebra homomorphisms.

([ACC](#source-acc), §4.2, after Theorem 4.2.1, p. 969). *Needs:* `mathlib:CategoryTheory.Retract`; `mathlib:CategoryTheory.Retract.map`; `DP:P7`.

Its interface includes:

- `EquivariantRetract.toRetract`: Forgetting the commuting equations gives CategoryTheory.Retract A B.
- `EquivariantRetract.inclusion_comm`: For every r, f_A(r) followed by i equals i followed by f_B(r).
- `EquivariantRetract.retraction_comm`: For every r, f_B(r) followed by the retraction equals the retraction followed by f_A(r).
- `EquivariantRetract.map`: A functor carries the retract to the image retract, with the image endomorphisms; it preserves both commuting equations.
- `EquivariantRetract.idempotent`: The endomorphism of B given by retraction followed by inclusion is an idempotent commuting with every action operator.
- `EquivariantRetract.refl`: Identity inclusion and retraction give an equivariant retract for any indexed action on A; forgetting it gives Retract.refl A.
- `EquivariantRetract.ext`: Two equivariant retracts for the same objects and indexed actions are equal if their inclusion and retraction maps are equal.

**Checks.**

- `EquivariantRetract.identity` (degenerate): Identity maps on A give an equivariant retract of A into itself.
- `EquivariantRetract.forget_identity` (compatibility): The forgotten retract of the identity construction is Mathlib Retract.refl.
- `EquivariantRetract.incompatible_actions` (non-example): Identity inclusion/retraction cannot form an equivariant retract between Z with multiplication-by-1 and multiplication-by-2 as the same indexed operator.

<a id="unitary-levi-weight-dictionary"></a>

### 0.3 Unitary weight dictionary

Define `UnitaryLeviWeight`. For descending Levi rows λ_τ and λ_{τc} of length n and a chosen lift τ above an embedding of F⁺, define the unitary row by concatenating −reverse(λ_{τc}) with λ_τ. For n>0 it is descending exactly when −λ_{τc,1}≥λ_{τ,1}; the rank-zero row is empty. This is the character-lattice identification (2.2.2); it does not assert that the integral dual-Weyl lattice is the dual of the integral lattice of the dual weight.

([ACC](#source-acc), §2.2.1 equation (2.2.2), pp. 918–919). *Needs:* Mathlib integer arithmetic and finite collections.

Its interface includes:

- `UnitaryLeviWeight.first_block`: The i-th entry of the first block is −λ_{τc,n−1−i} for 0≤i<n with zero-based indexing.
- `UnitaryLeviWeight.second_block`: The i-th entry of the second block is λ_{τ,i}.
- `UnitaryLeviWeight.dominant_iff`: For n>0 and descending input rows, dominance is equivalent to −λ_{τc,1}≥λ_{τ,1}.
- `UnitaryLeviWeight.inverse`: Recover λ_τ from the second block and λ_{τc} by negating and reversing the first block.

**Checks.**

- `UnitaryLeviWeight.rank_one` (computation): For λ_τ=(2), λ_{τc}=(−3), the unitary row is (3,2).
- `UnitaryLeviWeight.zero` (degenerate): Zero Levi rows give the zero unitary row.
- `UnitaryLeviWeight.rank_two` (computation): For λ_τ=(2,1), λ_{τc}=(−3,−4), the unitary row is (4,3,2,1).

**The Siegel boundary and Satake descent**

The boundary triangle and non-Eisenstein Siegel localization identify the stratum on which the Levi coefficients occur. Restriction to the trivial unipotent subgroup supplies the retraction; this is compatible with the Satake action before taking cohomology.

<a id="boundary-level-coefficient-comparison"></a>

### 0.4 Boundary level coefficient comparison

Prove `boundary_level_coefficient_comparison`. For the same finite-projective coefficient lattice and good compact levels, the compact-support → interior → Borel–Serre-boundary triangle commutes with derived reduction O→O/varpi^m and finite-level pullback/trace. Localizing at the paired GL_n/unitary non-Eisenstein ideals isolates the Siegel stratum, with the Satake action on each triangle map. Maps are constructed using the arithmetic correspondences and stratum comparison, not assumed merely because a retract exists.

([ACC](#source-acc), §2.4.1, Theorems 2.4.2 and 2.4.4, pp. 942–946). *Needs:* `Layer 0`; `ALS:ALS.4`; `ALS:ALS.3`.

<a id="siegel-coefficient-retract"></a>

### 0.5 Siegel coefficient splitting

Prove `siegel_coefficient_retract`. With K̃ decomposed (so K̃_P = K̃_U ⋊ K) and λ, λ̃ as in Theorem 2.4.4, for each m ≥ 1: (i) arguing as in [NT16 p. 58], RΓ(X^P_{K̃_P}, 𝒱_λ̃/ϖ^m) ≅ RΓ(K̃^S_P × K_S, RΓ(Inf^{P^S×K_S}_{G^S×K_S} 𝔛_G, R1_\*^{K̃_{U,S}} 𝒱_λ̃/ϖ^m)), where R1_\*^{K̃_{U,S}} sends P^S × K̃_{P,S}-equivariant complexes of sheaves on 𝔛_G to P^S × K_S-equivariant ones; (ii) the K̃_P-equivariant embedding 𝒱_λ → 𝒱_λ̃^{K̃_{U,S}} ⊂ 𝒱_λ̃, which splits K-equivariantly [NT16 Cor. 2.11], makes 𝒱_λ/ϖ^m a direct summand of R1_\*^{K̃_{U,S}}(𝒱_λ̃/ϖ^m): the inclusion is 𝒱_λ/ϖ^m → (𝒱_λ̃/ϖ^m)^{K̃_{U,S}} → R1_\*^{K̃_{U,S}}𝒱_λ̃/ϖ^m and the retraction is R1_\*^{K̃_{U,S}}𝒱_λ̃/ϖ^m → 𝒱_λ̃/ϖ^m (restriction to the trivial subgroup) followed by the splitting 𝒱_λ̃ → 𝒱_λ mod ϖ^m; (iii) hence r_G^\* RΓ(X_K, 𝒱_λ/ϖ^m) is a direct summand of RΓ(X^P_{K̃_P}, 𝒱_λ̃/ϖ^m) in D(H(P^S × K̃_{P,S}, K̃_P) ⊗_Z O/ϖ^m), and 𝒮 = r_G ∘ r_P descends to (2.4.7) T̃^S(RΓ(X^P_{K̃_P}, 𝒱_λ̃/ϖ^m)) → T̃^S(RΓ(X_K, 𝒱_λ/ϖ^m)).

([ACC](#source-acc), §2.4.1, proof of Theorem 2.4.4, (2.4.7), pp. 945–946). *Needs:* `Layer 0`; `ALS:ALS.4`; `Tau Ceti ReductiveGroups L9`.

<a id="coefficient-satake-descent"></a>

### 0.6 Coefficient Satake descent

Prove `coefficient_satake_descent`. Let K̃ be as in §2.4.1 (good, decomposed with respect to P = GU; K = K̃ ∩ G(A^∞_{F⁺})), let λ ∈ (Z^n_+)^{Hom(F,E)} be dominant with image λ̃ ∈ (Z^{2n})^{Hom(F⁺,E)} (under (2.2.2)) G̃-dominant, let 𝔪 ⊂ T^S(K, λ) be non-Eisenstein and 𝔪̃ = 𝒮\*(𝔪) ⊂ T̃^S. Then 𝒮 : T̃^S → T^S descends to a homomorphism T̃^S(RΓ(∂X̃_K̃, 𝒱_λ̃)_𝔪̃) → T^S(RΓ(X_K, 𝒱_λ)_𝔪).

([ACC](#source-acc), §2.4.1, Theorem 2.4.4 with (2.4.5)–(2.4.7), pp. 945–946). *Needs:* `Layer 0`; `SR:SR.1`.

<a id="ramified-satake-descent"></a>

### 0.7 Ramified Satake descent

Prove `ramified_satake_descent`. Let K̃ be as in §2.4.1, let 𝔪 ⊂ T^S(K, 0) be a non-Eisenstein maximal ideal and 𝔪̃ = 𝒮\*(𝔪) ⊂ T̃^S. Suppose R ⊂ S satisfies: each v ∈ R is prime to p and split over F⁺; for each v ∈ R − R^c above v̄, K̃_v̄ = q̃_v with p̃_{v,1} ⊂ q̃_v ⊂ p̃_v; for each v ∈ R ∩ R^c above v̄, K̃_v̄ = Ĩ_v̄ with Iw̃_{v̄,1} ⊂ Ĩ_v̄ ⊂ Iw̃_v̄. Let T = S − (R^c − R); let T̃^T_R ⊂ H(G̃(A^∞_{F⁺}), K̃) ⊗_Z O be the (commutative) O-subalgebra generated by T̃^S, all t_{v,i}(σ) (v ∈ R, σ ∈ W_{F_v}) and all e_{v,i}(σ) (v ∈ R^c − R, σ ∈ W_{F_v}), and T^T_R ⊂ H(GL_n(A_F^∞), K) ⊗_Z O the (commutative) O-subalgebra generated by T^T and all t_{v,i}(σ) (v ∈ R, σ ∈ W_{F_v}). Then there is a map 𝒮 : T̃^T_R → T^T_R, which descends to an O-algebra homomorphism T̃^T_R(RΓ(∂X̃_K̃, O)_𝔪̃) → T^T_R(RΓ(X_K, O)_𝔪).

([ACC](#source-acc), §2.4.1, Theorem 2.4.8, pp. 946–948). *Needs:* `Layer 0`; `SR:SR.1`.

**Unipotent cohomology with trivial coefficients**

The exterior-algebra computation supplies the degree and orientation convention used by both weight routes. Keep the integral coefficient ring and the Levi action in the comparison.

<a id="unipotent-exterior-cohomology"></a>

### 0.8 Unipotent exterior cohomology

Prove `unipotent_exterior_cohomology`. Let v̄ ∈ S̄_p, K = F^+_v̄ (a local field here), m ≥ 1. For each i ≥ 0 there is a G(O_K)-equivariant isomorphism H^i(U(O_K), O/ϖ^m) ≅ Hom_{Z_p}(∧^i_{Z_p} U(O_K), O/ϖ^m) = Hom_O(∧^i_O(U(O_K) ⊗_{Z_p} O), O/ϖ^m), with G(O_K) acting on the right through its conjugation action on U(O_K) ≅ Z_p^{n²[K:Q_p]} (continuous group cohomology; the map is the cup-product extension of H^1 = Hom).

([ACC](#source-acc), §4.2, Lemma 4.2.2(1), p. 970). *Needs:* `Layer 0`.

### Examples

The rank-one and rank-two coefficient rows fix the conjugate reversal. The identity retract and the incompatible multiplication-by-1 and multiplication-by-2 actions distinguish a split map from an equivariant split map.

### Dependencies

Mathlib retracts and derived categories; ALS.1/ALS.3/ALS.4, SR.1 and integral highest-weight modules from ReductiveGroupsIntegralRepresentationsPartII.

## Layer 1: Fontaine–Laffaille compatibility

**Siegel shuffles and integral Kostant theory**

Use minimal representatives for left Levi cosets. The inverse-increasing condition fixes the convention needed for the dot action. Integral Kostant decomposition and formality turn the coefficient splitting into a direct summand in each indicated degree.

<a id="kostant-shuffles"></a>

### 1.1 Kostant representatives

Define `KostantShuffle`. For the Siegel Levi GL_n×GL_n in GL_{2n}, define KostantShuffle(n) as permutations w of {0,…,2n−1} whose inverse is increasing on each block {0,…,n−1} and {n,…,2n−1}. These are the minimal representatives for (S_n×S_n)\\S_{2n}; length is the number of inversions of w. For Res_{F⁺/Q} use one shuffle per embedding and sum lengths. General Weyl groups, roots, dominant weights and highest-weight modules are imported, not defined here.

([ACC](#source-acc), §1.2 Notation, pp. 905–906). *Needs:* `Tau Ceti ReductiveGroups L7`; `mathlib:Equiv.Perm.permGroup`; `mathlib:finAddFlip`.

Its interface includes:

- `KostantShuffle.val`: The underlying permutation lies in S_{2n}.
- `KostantShuffle.mem_iff`: Membership is precisely strict increase of the inverse on each of the two Levi blocks.
- `KostantShuffle.length`: Length is the cardinality of {(i,j):i<j and w(j)<w(i)}.
- `KostantShuffle.minimal_representative`: The shuffle is the unique minimum-length representative of its left Levi coset.

**Checks.**

- `KostantShuffle.rank_one` (computation): For n=1 the two shuffles have lengths 0 and 1.
- `KostantShuffle.rank_zero` (degenerate): For n=0 the unique shuffle has length 0.
- `KostantShuffle.block_swap` (computation): The permutation exchanging the two blocks, preserving order inside each block, is a shuffle of length n².
- `KostantShuffle.internal_swap` (non-example): For n=2 the transposition (0 1) is not a shuffle.

<a id="integral-kostant-decomposition"></a>

### 1.2 Integral Kostant decomposition

Prove `integral_kostant_decomposition`. Let v̄ ∈ S̄_p, K = F^+_v̄ and assume p ≥ 2n − 1. For w ∈ W^P_v̄ put λ_w = w(ρ_v̄) − ρ_v̄ ∈ (Z^n_+)^{Hom_{Q_p}(F⊗_{F^+}F^+_v̄, E)} (via (2.2.2)). For each i ≥ 0 there is a G(O_K)-equivariant isomorphism Hom_O(∧^i_O(U(O_K) ⊗_{Z_p} O), O) ≅ ⊕_{w ∈ W^P_v̄, l(w) = i} V_{λ_w} (V_{λ_w} the integral dual Weyl module lattice).

([ACC](#source-acc), §4.2, Lemma 4.2.2(2), pp. 970–971). *Needs:* `Layer 1`; `Layer 0`; `Tau Ceti ReductiveGroups L7`; `Tau Ceti ReductiveGroups L9`.

<a id="unipotent-derived-formality"></a>

### 1.3 Unipotent derived formality

Prove `unipotent_derived_formality`. Let v̄ ∈ S̄_p, K = F^+_v̄, m ≥ 1 and p > n². There is a natural isomorphism, inducing the identity on cohomology, R Γ(U(O_K), O/ϖ^m) ≅ ⊕_{i=0}^{n²[K:Q_p]} H^i(U(O_K), O/ϖ^m)[−i] in D(O/ϖ^m[G(O_K)]).

([ACC](#source-acc), §4.2, Lemma 4.2.3, pp. 971–972). *Needs:* `Layer 0`.

<a id="boundary-degree-retract"></a>

### 1.4 Boundary degree shifting

Prove `boundary_degree_retract`. Notation (§4.2): for τ: F^+ ↪ E, W_τ = W(G̃⊗_{F^+,τ}E, T⊗_{F^+,τ}E) ≅ W(GL_{2n}), W_{P,τ} = W(G⊗E, T⊗E) ≅ W(GL_n×GL_n), W^P_τ ⊂ W_τ the representatives of W_{P,τ}\\W_τ of §1.2, ρ_τ the half-sum of B⊗E-positive roots; W_v̄, W_{P,v̄}, W^P_v̄ the products over τ ∈ I_v̄ (embeddings inducing v̄), ρ_v̄ = Σ_{τ ∈ Hom(F^+_v̄,E)} ρ_τ; W_T̄, W^P_T̄ for T̄ ⊂ S̄_p, W = W_{S̄_p} with length l and ρ = Σ_v̄ ρ_v̄; λ̃_v̄ = (λ̃_τ)_{τ ∈ Hom(F^+_v̄,E)} and λ_v̄ = (λ_τ)_{τ inducing ṽ or ṽ^c}. Statement: let K̃ ⊂ G̃(A^∞_{F^+}) be a good subgroup decomposed with respect to P with K̃_{U,v̄} = U(O_{F^+_v̄}) for every v̄ ∈ S̄_p, and K = K̃ ∩ G(A^∞_{F^+}); let m ⊂ T^S be non-Eisenstein and m̃ = S^\*(m) ⊂ T̃^S. Let S̄_p = S̄_1 ⊔ S̄_2 and let λ̃ ∈ (Z^{2n}_+)^{Hom(F^+,E)}, λ ∈ (Z^n_+)^{Hom(F,E)} be dominant with (1) λ̃_v̄ = λ_v̄ (via (2.2.2)) for v̄ ∈ S̄_1; (2) λ̃_v̄ = 0 for v̄ ∈ S̄_2; (3) for each v̄ ∈ S̄_2 some w_v̄ ∈ W^P_v̄ with λ_v̄ = w_v̄(ρ_v̄) − ρ_v̄; (4) p > n² (p unramified in F throughout §4). Put w_v̄ = 1 for v̄ ∈ S̄_1 and w = (w_v̄). Then for every m ≥ 1, R Γ(X_K, V_λ/ϖ^m)_m[−l(w)] is a T̃^S-equivariant direct summand (T̃^S acting through S) of R Γ(∂X̃_K̃, V_λ̃/ϖ^m)_m̃.

([ACC](#source-acc), §4.2, Theorem 4.2.1, pp. 968–970). *Needs:* `Layer 0`; `Layer 1`; `mathlib:DerivedCategory`.

**Cuspidal weights and the middle degree**

Cuspidal-triviality exclusion is a predicate on the computed Kostant weight table. It is then combined with the imported unitary torsion concentration theorem. The perturbation and degree-shifting arguments retain their local degree and residue-characteristic bounds.

<a id="ctg-weight"></a>

### 1.5 Cuspidal-triviality exclusion for Kostant weights

Define `CTGWeight`. Given the actual finite set W^P of Siegel shuffles, the embedding involution τ↦τc and the Levi weight table μ(w,τ,i)=λ_{w,τ,i}, define CTGWeight(μ) by: for every w∈W^P and a∈Z there exists τ for which the vector (μ(w,τ,i)+μ(w,τc,n−1−i))_i is not the constant a vector. Here λ_w=w(λ̃+ρ)−ρ and the conjugate dual row is −reverse(λ_{w,τc}). This predicate on the computed table is Definition 4.3.5; it uses the Kostant weight calculation, rather than an arbitrary table of parallel-trace inequalities.

([ACC](#source-acc), §4.3, Definition 4.3.5 and following paragraph, p. 974). *Needs:* `Layer 1`; `Layer 0`.

Its interface includes:

- `CTGWeight.iff_witness`: CTG is equivalent to ∀w,a, ∃τ,i, μ(w,τ,i)+μ(w,τc,n−1−i)≠a.
- `CTGWeight.reindex`: Equivariant bijections of embeddings and bijections of W preserve the predicate.
- `CTGWeight.not_parallel`: If one w and a give that same constant vector at every τ, the table is not CTG.
- `CTGWeight.no_cuspidal_levi_weight`: For the weight table calculated from λ̃, CTG excludes a regular algebraic cuspidal GL_n representation of any weight λ_w, by the imported purity lemma.

**Checks.**

- `CTGWeight.zero` (non-example): For nonempty W and n>0 the zero table is not CTG.
- `CTGWeight.empty_w` (degenerate): With W empty the predicate is true.
- `CTGWeight.rank_one_pair` (computation): For n=1, one w and embeddings a,aᶜ,b,bᶜ, with μ(a)=0, μ(aᶜ)=0, μ(b)=1, μ(bᶜ)=0, the table is CTG: the conjugate sums are 0 and 1.

<a id="ctg-one-embedding-perturbation"></a>

### 1.6 Ctg one embedding perturbation

Prove `ctg_one_embedding_perturbation`. Assume [F^+:Q] > 1. Let λ̃ ∈ (Z^{2n}_+)^{Hom(F^+,E)} and τ_0: F^+ ↪ E. There is λ̃' ∈ (Z^{2n}_+)^{Hom(F^+,E)} with λ̃'_τ = λ̃_τ for all τ ≠ τ_0 and λ̃' CTG; one may take λ̃'_{τ_0} = λ̃_{τ_0} + (a, 0, …, 0) with a ∈ Z_{≥0} sufficiently large (depending on λ̃).

([ACC](#source-acc), §4.3, Lemma 4.3.6 and (4.3.7), pp. 974–975). *Needs:* `Layer 1`.

<a id="middle-degree-satake"></a>

### 1.7 Middle degree Satake

Prove `middle_degree_satake`. Assume [F^+:Q] > 1. Let K̃ ⊂ G̃(A^∞_{F^+}) be good and decomposed with respect to P (K = K̃ ∩ G), with K̃_{U,v̄} = U(O_{F^+_v̄}) for each v̄ ∈ S̄_p, λ̃ ∈ (Z^{2n}_+)^{Hom(F^+,E)} and S̄_p = S̄_1 ⊔ S̄_2 with (1) λ̃_v̄ = 0 for v̄ ∈ S̄_2; (2) for every finite place w ∉ S of F with residue characteristic l, either S contains no l-adic place of F and l is unramified in F, or l splits in some imaginary quadratic field F_0 ⊂ F; (3) p > n² (p unramified in F). Let w ∈ W^P_{S̄_2}, λ_w = w(λ̃+ρ) − ρ ∈ (Z^n_+)^{Hom(F,E)}, m ⊂ T^S non-Eisenstein in the support of H^\*(X_K, V_{λ_w}), m̃ = S^\*(m), and assume ρ̄_m̃ decomposed generic. Then S: T̃^S → T^S descends to a homomorphism T̃^S(H^d(X̃_K̃, V_λ̃))_m̃ → T^S(H^{d−l(w)}(X_K, V_{λ_w}))_m.

([ACC](#source-acc), §4.3, Proposition 4.3.4, pp. 973–974). *Needs:* `Layer 1`; `IG:IG.7`; `AG:AG2.0`; `ALS:ALS.5`.

<a id="fontaine-laffaille-degree-shifting"></a>

### 1.8 Fontaine–Laffaille degree shifting

Prove `fontaine_laffaille_degree_shifting`. Let λ ∈ (Z^n_+)^{Hom(F,E)} and let v̄ ≠ v̄' be p-adic places of F^+ (so F^+ ≠ Q). Fix m ≥ 1 and a good K̃ ⊂ G̃(A^∞_{F^+}) (K = K̃ ∩ G). Assume: (1) −λ_{τc,1} − λ_{τ,1} ≥ 0 for every τ: F ↪ E inducing v̄; (2) Σ_{v̄'' ∈ S̄_p, v̄'' ≠ v̄, v̄'} [F^+_{v̄''}:Q_p] > ½[F^+:Q]; (3) U(O_{F^+_{v̄''}}) ⊂ K̃_{v̄''} ⊂ {g ≡ (1_n \*; 0 1_n) mod ϖ^m_{v̄''}} for every p-adic v̄'' ≠ v̄, and K̃_v̄ = G̃(O_{F^+_v̄}); (4) p > n²; (5) for every finite place w ∉ S of F with residue characteristic l, either S contains no l-adic place of F and l is unramified in F, or l splits in some imaginary quadratic field F_0 ⊂ F; (6) m ⊂ T^S is non-Eisenstein and ρ̄_m̃ is decomposed generic. Define λ̃ ∈ (Z^{2n}_+)^{Hom(F^+,E)} by λ̃_τ = 0 if τ induces neither v̄ nor v̄', λ̃_τ = (−λ_{τ̃c,n}, …, −λ_{τ̃c,1}, λ_{τ̃,1}, …, λ_{τ̃,n}) if τ induces v̄ (dominant by (1)), and λ̃_τ ∈ Z^{2n}_+ arbitrary if τ induces v̄'. For m' ≥ m let K̃(m')_{v̄''} = K̃_{v̄''} ∩ {g ≡ (1_n \*; 0 1_n) mod ϖ^{m'}_{v̄''}} for p-adic v̄'' ≠ v̄ and K̃(m')_{v̄''} = K̃_{v̄''} otherwise (K̃ = K̃(m)). Let q ∈ [⌊d/2⌋, d−1]. Then there are m' ≥ m, N ≥ 1 depending only on n and [F^+:Q], a nilpotent ideal J ⊂ A(K,λ,q,m) with J^N = 0, and a commutative square T̃^S → Ã(K̃(m'), λ̃) → A(K,λ,q,m)/J, T̃^S →^S T^S → A(K,λ,q,m)/J.

([ACC](#source-acc), §4.4, Proposition 4.4.1 (with Hypothesis 4.4.2 and (4.4.3)–(4.4.5) in its proof), pp. 975–978). *Needs:* `Layer 1`; `IG:IG.7`.

**Integral Fontaine–Laffaille transfer**

Transfer the polarized unitary representation to the rank-n summand using determinant kernels and multiplicity-free reconstruction. This step must work for an arbitrary coefficient homomorphism. Degree reflection uses finite-level duality with the actual orientation and coefficient twists.

<a id="nilpotent-fontaine-laffaille-transfer"></a>

### 1.9 Nilpotent Fontaine–Laffaille transfer

Prove `nilpotent_fontaine_laffaille_transfer`. Let Ã be a finite flat O-algebra, D̃ a continuous 2n-dimensional determinant of G_{F,S} valued in Ã, and M = Ã[G_{F,S}]/ker D̃. Assume the finite O-module M, restricted to each G_{F_v} with v | v̄, lies in the essential image of the integral Fontaine–Laffaille functor G^a in the stated interval. Let Ã → B be an O-algebra homomorphism, where B is a finite Artinian local O-algebra killed by ϖ^m for some m ≥ 1. Suppose D̃_B = det(ρ ⊕ ρ′) for continuous ρ, ρ′: G_{F,S} → GL_n(B), whose residual representations over the residue field of B are absolutely irreducible and non-isomorphic. Then there is a surjection B ⊗_Ã M ↠ B[G_{F,S}]/ker D̃_B, and the latter algebra is isomorphic to M_n(B) × M_n(B). Consequently ρ|_{G_{F_v}} belongs to the essential image of G^a. The coefficient map Ã → B need not be surjective. Kernel inclusion under arbitrary scalar extension, rather than equality under flat scalar extension, gives the displayed surjection; the split matrix-algebra identification requires the residually multiplicity-free reconstruction and faithful determinant argument.

([ACC](#source-acc), §4.4, proof of Proposition 4.4.6, pp. 980–981 (determinant-kernel transfer); [Chenevier](#source-chenevier), §1.17 and Lemma 1.18(iii), PDF p. 16; Theorem 2.22, PDF p. 34). *Needs:* `FF:R07.3`; `IHG:IHG.0`; `IHG:IHG.1`.

<a id="middle-range-fontaine-laffaille"></a>

### 1.10 Middle range Fontaine–Laffaille

Prove `middle_range_fontaine_laffaille`. Let λ, v̄ ≠ v̄', m ≥ 1 and a good K̃ satisfy (1) −λ_{τc,1} − λ_{τ,1} ≥ 0 and −λ_{τc,n} − λ_{τ,n} ≤ p − 2n − 1 for every τ inducing v̄, and (2)–(6) of Proposition 4.4.1. Let q ∈ [⌊d/2⌋, d−1], and for assertion (c) assume A(K,λ,q,m) ≠ 0. Then there are N ≥ 1 depending only on [F:Q] and n, an ideal J ⊂ A(K,λ,q,m) with J^N = 0 and a continuous ρ_m: G_{F,S} → GL_n(A(K,λ,q,m)/J) with (a) char(ρ_m(Frob_v)) = image of P_v(X) for v ∉ S; (b) for each v | v̄, ρ_m|_{G_{F_v}} is in the essential image of G^a, a = (λ_{τ,n})_{τ ∈ Hom_{Q_p}(F_v,E)}; (c) for each v | v̄ there is N̄ ∈ MF_k with ρ̄_m̃|_{G_{F_v}} ≅ G(N̄) and FL_τ(N̄) = {−λ_{τc,n}+2n−1, …, −λ_{τc,1}+n, λ_{τ,1}+n−1, …, λ_{τ,n}} for every τ ∈ Hom_{Q_p}(F_v,E), where ρ̄_m̃ = ρ̄_m ⊕ ρ̄_m^{c,∨}ε^{1−2n}.

([ACC](#source-acc), §4.4, Proposition 4.4.6, pp. 979–981). *Needs:* `Layer 1`; `FF:R07.3`; `IG:IG.7`; `PH:R06.4`; `AG:AG2.0`; `AG:AG2.2`; `AG:AG2.3`; `AG:AG2.6`.

<a id="degree-reflection-duality"></a>

### 1.11 Degree reflection duality

Prove `degree_reflection_duality`. Assume K is principal-congruence of level ϖ^m at the p-adic places ≠ v̄, λ_{v̄''} = 0 for p-adic v̄'' ≠ v̄, and λ satisfies (3) of Cor. 4.4.8. Then V_{λ^∨} ≅ V_λ^∨ ([Jan03, Cor. II.5.6]). With n_0 = (2n+1−p)/2 and μ_{0,τ} = (n_0, …, n_0), the maximal ideal m^∨(ε^{−n_0}) lies in the support of H^\*(X_K, V_{λ^∨+μ_0}), λ^∨+μ_0 again satisfies (3), and [K^S g K^S] ↦ ε(Art_F(det g))^{−n_0}[K^S g^{−1} K^S] descends to an isomorphism f: T^S(H^{d−1−q'}(X_K, V_{λ^∨+μ_0}/ϖ^m))_{m^∨(ε^{−n_0})} ≅ A(K,λ,q',m); a representation ρ' for the left side gives ρ = (f∘ρ')^∨ ⊗ ε^{1−2n+(p−1)/2} for the right side, with the same properties (a)–(c).

([ACC](#source-acc), §4.4, proof of Corollary 4.4.8, pp. 983–984). *Needs:* `Layer 0`; `ALS:ALS.5:finite-level-duality`; `ALS:ALS.4`; `ALS:ALS.3`.

**Crystalline twists and local–global compatibility**

A prescribed global crystalline character makes the unitary residual representation generic without changing the desired local conclusion. The finite shifted-partition argument recovers the labelled rank-n weights. The final theorem has two separate alternatives for obtaining its nonzero comparison.

<a id="genericity-making-character-twist"></a>

### 1.12 Genericity making character twist

Prove `genericity_making_character_twist`. (Asserted without proof.) If ρ̄_m is decomposed generic then, after enlarging k, there is a character ψ̄: G_F → k^× with ψ̄|_{G_{F_v}} trivial for every v ∈ S such that (ρ̄_m ⊗ ψ̄) ⊕ ((ρ̄_m ⊗ ψ̄)^{c,∨} ⊗ ε^{1−2n}) is decomposed generic.

([ACC](#source-acc), §4.4, proof of Corollary 4.4.8, p. 984). *Needs:* `AG:AG2.7`; `CS:R23.1`.

<a id="shifted-partition-recovery"></a>

### 1.13 Shifted partition recovery

Prove `shifted_partition_recovery`. Let m ≥ 1 and let A, B, C, D be sets of integers, each of size m, with c > d for all c ∈ C and d ∈ D. If A ∪ B = C ∪ D and (A+1) ∪ B = (C+1) ∪ D, and both sets have 2m elements, then A = C and B = D.

([ACC](#source-acc), §4.5, Lemma 4.5.2, p. 989). *Needs:* Mathlib integer arithmetic and finite collections.

<a id="all-degree-fontaine-laffaille"></a>

### 1.14 All degree Fontaine–Laffaille

Prove `all_degree_fontaine_laffaille`. Let v̄ ∈ S̄_p, K ⊂ GL_n(A_F^∞) good, λ ∈ (Z^n_+)^{Hom(F,E)}, m ⊂ T^S(K,λ) non-Eisenstein. Assume: (1) K_v = GL_n(O_{F_v}) for v | v̄; (2) there is v̄' ∈ S̄_p, v̄' ≠ v̄, with Σ_{v̄'' ∈ S̄_p, v̄'' ≠ v̄, v̄'} [F^+_{v̄''}:Q_p] > ½[F^+:Q]; (3) −λ_{τc,1} − λ_{τ,1} ≥ 0 and −λ_{τc,n} − λ_{τ,n} ≤ p − 1 − 2n for every τ inducing v̄; (4) p > n²; (5) for every finite place w ∉ S of F with residue characteristic l, either S contains no l-adic place of F and l is unramified in F, or l splits in some imaginary quadratic field F_0 ⊂ F; (6) ρ̄_m is decomposed generic. Then for all integers q ∈ [0, d−1] and m ≥ 1 there are N ≥ 1 depending only on [F:Q] and n, J ⊂ A(K,λ,q,m) with J^N = 0, and a continuous ρ_m: G_{F,S} → GL_n(A(K,λ,q,m)/J) satisfying (a), (b), (c) of Proposition 4.4.6.

([ACC](#source-acc), §4.4, Corollary 4.4.8, pp. 981–984). *Needs:* `Layer 1`; `FF:R07.3`.

<a id="fontaine-laffaille-local-global"></a>

### 1.15 Fontaine–Laffaille compatibility

Prove `fontaine_laffaille_local_global`. Let K ⊂ GL_n(A_F^∞) be a good subgroup, λ ∈ (Z^n_+)^{Hom(F,E)}, S a finite set of finite places of F containing the p-adic places with S = S^c, and m ⊂ T^S(K,λ) a non-Eisenstein maximal ideal with T^S(K,λ)/m = k of characteristic p. Let v̄ be a p-adic place of F^+ and assume: (1) F is unramified at p, and some imaginary quadratic subfield F_0⊂F has p split; (2) for every finite place w ∉ S of F with residue characteristic l, either S contains no l-adic place of F and l is unramified in F, or l splits in some imaginary quadratic field F_0 ⊂ F; (3) K_v = GL_n(O_{F_v}) for every v | v̄; (4) λ_{τ,1} + λ_{τc,1} − λ_{τ,n} − λ_{τc,n} ≤ p − 2n − 1 for every τ: F ↪ E inducing v̄; (5) p > n²; (6) there is a p-adic place v̄' ≠ v̄ of F^+ with Σ_{v̄'' ∈ S̄_p, v̄'' ≠ v̄, v̄'} [F^+_{v̄''}:Q_p] > ½[F^+:Q]; (7) ρ̄_m is decomposed generic; (8) either (a) H^\*(X_K, V_λ)_m[1/p] ≠ 0, or (b) for every τ inducing v̄, −λ_{τc,n} − λ_{τ,n} ≤ p − 2n − 2 and −λ_{τc,1} − λ_{τ,1} ≥ 0. Then there are an integer N ≥ 1 depending only on [F^+:Q] and n, an ideal J ⊂ T^S(K,λ)_m with J^N = 0, and a continuous ρ_m: G_{F,S} → GL_n(T^S(K,λ)_m/J) such that: (a) for each finite v ∉ S, the characteristic polynomial of ρ_m(Frob_v) is the image of P_v(X); (b) for each v | v̄, ρ_m|_{G_{F_v}} lies in the essential image of G^a with a = (λ_{τ,n})_{τ ∈ Hom(F_v,E)}; (c) for each v | v̄ there is M̄ ∈ MF_k with ρ̄_m|_{G_{F_v}} ≅ G(M̄) and FL_τ(M̄) = {λ_{τ,1}+n−1, λ_{τ,2}+n−2, …, λ_{τ,n}} for every τ: F_v ↪ E.

([ACC](#source-acc), §4.1, Theorem 4.5.1, p. 967 (restated §4.5, p. 985; proof pp. 985–988)). *Needs:* `Layer 1`; `FF:R07.3`; `PH:R06.4`; `AG:AG2.0`; `CS:R24.5`.

### Examples

At rank one the two shuffles have lengths 0 and 1; exchanging two blocks of size n has length n². The zero weight table fails CTG, whereas two conjugate pairs with sums 0 and 1 satisfy it. The cohomological duality has degree d−1−q, with its coefficient twist retained.

### Dependencies

Layer 0; IG.7, R07.3, PH:R06.4, AG2.0/AG2.2/AG2.3/AG2.6 and IHG.0/IHG.1, with the integral highest-weight contract.

## Layer 2: Soluble transport and rank-two compatible systems

**Soluble transport and split test primes**

Iterate cyclic base change and descent with irreducibility maintained. A finite collection of split-test primes controls both residual and cyclotomic images. These transport results are independent of the lifting conclusions in Layer 5.

<a id="genericity-normal-closure-restriction"></a>

### 2.1 Genericity normal closure restriction

Prove `genericity_normal_closure_restriction`. Let F be a number field and r̄: G_F → GL_n(F̄_l) continuous, absolutely irreducible and decomposed generic. Let K/Q be a finite Galois extension linearly disjoint over Q from the Galois closure over Q of F̄^{ker r̄}(ζ_l). Then r̄|G_{FK} is absolutely irreducible and decomposed generic. In the proof of Theorem 1.4 this is applied with K = L′LF^suff(ζ_N), which is Galois over Q with K ∩ F^avoid = Q, and FK = F′. Apply the disjointness over Q to K; the resulting field FK contains F.

([ACC](#source-acc), Lemma 7.1.7, p. 1091). *Needs:* `AG:AG2.7`; `Tau Ceti Chebotarev L10`.

<a id="residual-lifting-hypothesis-restriction"></a>

### 2.2 Residual lifting hypothesis restriction

Prove `residual_lifting_hypothesis_restriction`. Let F be a number field, l a prime, r: G_F → GL_n(Q̄_l) continuous with residual representation r̄, and M = F^{ker r̄}(ζ_l). Let F'/F be a finite extension linearly disjoint from M over F. Then G_{F'} surjects onto Gal(M/F), so r̄(G_{F'}) = r̄(G_F) and r̄(G_{F'(ζ_l)}) = r̄(G_{F(ζ_l)}). Consequently: r̄|G_{F'} is absolutely irreducible if r̄ is; r̄(G_{F'(ζ_l)}) is enormous if r̄(G_{F(ζ_l)}) is; and if σ ∈ G_F − G_{F(ζ_l)} has r̄(σ) scalar, then some σ' ∈ G_{F'} − G_{F'(ζ_l)} has r̄(σ') = r̄(σ). If r is unramified almost everywhere, so is r|G_{F'}. Suppose r|G_{F_v} is potentially semistable and ordinary of weight λ_v (Definition 1.2). Then for each place w | v of F', r|G_{F'_w} is potentially semistable and ordinary of weight (λ_{v,τ'|F_v})_{τ'}, by the compatibility Art_{F_v} ∘ N_{F'_w/F_v} = (restriction) ∘ Art_{F'_w}. Decomposed genericity is not covered here; it needs ACC+ Lemma 7.1.7.

([Qian](#source-qian), Remark after Definition 1.3, p. 1241; proof of Theorem 1.4, p. 1274; NSF online-first PDF pp. 3 and 36). *Needs:* `AG:AG2.7`; `CS:R24.5:operations`.

<a id="soluble-base-change-and-descent"></a>

### 2.3 Soluble base change and descent

Prove `soluble_base_change_and_descent`. Fix n ≥ 2, a prime p and ι: Q̄_p ≅ ℂ. Let F be imaginary CM or totally real and E/F a finite Galois extension with Gal(E/F) soluble and E imaginary CM or totally real. (1) If π is a cuspidal regular algebraic automorphic representation of GL_n(𝔸_F) of weight λ = (λ_τ)_{τ∈Hom(F,ℂ)} with r_ι(π)|G_E irreducible, there is a cuspidal regular algebraic π_E of GL_n(𝔸_E) of weight λ_{E,τ} = λ_{τ|F} with r_ι(π_E) ≅ r_ι(π)|G_E, and rec_{E_w}(π_{E,w}) = rec_{F_v}(π_v)|_{W_{E_w}} for every finite place w | v. (2) If ρ: G_F → GL_n(Q̄_p) is continuous with ρ|G_E irreducible and ρ|G_E ≅ r_ι(Π) for a cuspidal regular algebraic Π of GL_n(𝔸_E) of weight λ, then λ_{F,τ} = λ_{τ′} (τ′ any extension of τ to E) is well defined and there is a cuspidal regular algebraic π_F of GL_n(𝔸_F) of weight λ_F with ρ ≅ r_ι(π_F) and rec_{E_w}(Π_w) = rec_{F_v}(π_{F,v})|_{W_{E_w}} for every finite w | v. The identities at every finite place use the Arthur–Clozel local base change at v and its compatibility with the local Langlands correspondence (Harris–Taylor, Ch. VII), supplied with the cyclic base change by ET.7a.

([ACC](#source-acc), §6.5.12, Proposition 6.5.13 and its proof, pp. 1070–1072). *Needs:* `ET:ET.7a`; `AL:AL.3`; `Tau Ceti Chebotarev L10`; `AG:AG2.6`; `AG:AG2.2`.

**Checks.**

- For E = F both parts are the identity.
- The cuspidality of π_E needs irreducibility of r_ι(π)|G_E: for a CM quadratic E/F and π automorphically induced from E, the base change is not cuspidal.
- The weight of the descent is λ_F, independent of the extension τ′ of τ.

<a id="split-test-prime-image-preservation"></a>

### 2.4 Split test prime image preservation

Prove `split_test_prime_image_preservation`. Let F be imaginary CM, ρ̄ absolutely irreducible with ρ̄(G_{F(ζ_p)}) enormous and some σ ∈ G_F − G_{F(ζ_p)} with ρ̄(σ) scalar, and K/F(ζ_p) the extension cut out by ρ̄|_{G_{F(ζ_p)}}. Choose finite sets of finite places: V_0, all split in F(ζ_p), such that for each subfield F(ζ_p) ⊊ K′ ⊆ K some v ∈ V_0 splits in F(ζ_p) but not in K′; V_1 such that for each subfield F ⊊ K′ ⊆ K some v ∈ V_1 does not split in K′; V_2 = the p_0-adic places for a rational prime p_0 ≠ p that is decomposed generic for ρ̄; and v ∤ 2p with ρ, π unramified at every v ∈ V_0 ∪ V_1 ∪ V_2. Then for every finite Galois E/F in which all places of V_0 ∪ V_1 ∪ V_2 split: ρ̄(G_E) = ρ̄(G_F) and ρ̄(G_{E(ζ_p)}) = ρ̄(G_{F(ζ_p)}); hence ρ̄|_{G_{E(ζ_p)}} has enormous image, some σ ∈ G_E − G_{E(ζ_p)} has ρ̄(σ) scalar, and ρ̄|_{G_E} is decomposed generic (p_0 splits in E).

([ACC](#source-acc), §6.5.12, proof of Theorem 6.1.1, p. 1072 (and §6.6.10, p. 1082)). *Needs:* `Layer 2`; `AG:AG2.7`.

<a id="auxiliary-cm-extension-prescriptions"></a>

### 2.5 Auxiliary soluble and cyclic extensions

Prove `auxiliary_cm_extension_prescriptions` in three forms. Let F be a number field, A/F a finite Galois extension to avoid and S a finite set of places. Given finite Galois local extensions L_v/F_v for v∈S, construct a finite soluble Galois E/F, linearly disjoint from A over F, with E_w≅L_v over F_v for every w|v. For any N≥1, construct a cyclic E/F of degree N, disjoint from A, in which every place of S splits completely. If F is imaginary CM, the latter E is CM: carry out the cyclic construction over F⁺, include all real places in the split prescriptions, avoid the normal closure of A over F⁺, and compose with F. The soluble local construction and the cyclic CM construction have different hypotheses; arbitrary local data are not asserted to give a CM field.

Realize the cyclic prescriptions by a finite-order idele-class character trivial on the prescribed local factors, with local order divisible by N at an additional place, then take its degree-N subextension. Extra split test places force disjointness. For the soluble construction, use induction on the prescribed soluble local towers, retaining their Galois completions. The required local-character existence is the finite-prescription theorem of Clozel–Harris–Taylor, Lemmas 4.1.1–4.1.2, p. 116 ([published paper](https://www.numdam.org/item/10.1007/s10240-008-0016-1.pdf)), as used in BLGGT; it is a target here, since general class-field reciprocity alone does not provide those prescriptions. This construction supplies the E₀ choices below together with their stated local conditions.

([BLGGT](#source-blggt), Appendix A.2, Lemmas A.2.1–A.2.2 and Corollary A.2.3, pp. 600–601). *Needs:* Tau Ceti ClassFieldTheory, Layer 12, global reciprocity; CS:R23.1, split test places; finite local Galois solvability from Tau Ceti LocalFieldsRamification.

**Checks.**

- N=1 gives E=F, including when A=F.
- A prescribed trivial completion forces splitting, while a quadratic unramified completion has local degree 2 and cannot split completely.
- Over CM F, keeping the real places of F⁺ split makes the cyclic auxiliary field totally real before its compositum with F.

<a id="fontaine-laffaille-base-change-fields"></a>

### 2.6 Fontaine–Laffaille base change fields

Prove `fontaine_laffaille_base_change_fields`. Let E_0/F be a soluble CM extension such that: all places of V_0 ∪ V_1 ∪ V_2 split and p is unramified in E_0; π_{E_0,w}^{Iw_w} ≠ 0 for every finite w; at every finite prime-to-p w, either π_{E_0,w} and ρ|_{G_{E_0,w}} are both unramified, or ρ|_{G_{E_0,w}} is unipotently ramified, q_w ≡ 1 mod p and ρ̄|_{G_{E_0,w}} is trivial; every w̄ | p of E_0⁺ splits in E_0 and admits w̄′ ≠ w̄, w̄′ | p, with Σ_{w̄″≠w̄,w̄′} [E⁺_{0,w̄″}:ℚ_p] > ½[E_0⁺:ℚ]. Choose imaginary quadratic E_a, E_b, E_c with: every rational prime below V_0 ∪ V_1 ∪ V_2 splits in E_aE_bE_c and p is unramified in E_aE_bE_c; 2 and p split in E_a; every l ∉ {2,p} below a place of E_0 where π_{E_0} or ρ ramifies, or ramified in E_0E_aE_c, splits in E_b; every l ∉ {2,p} ramified in E_b splits in E_c (e.g. E_b = ℚ(√−p_b) with p_b ≡ 1 mod 4 and p_b ≡ −1 mod each such l, E_c = ℚ(√−p_c) with p_c ≡ 1 mod 4p_b, p_c ≠ p and p_b ≠ p; also impose p_b ≡ p_c ≡ −1 mod each rational prime below V_0∪V_1∪V_2; quadratic reciprocity shows p_c splits in E_b). Then E = E_0E_aE_bE_c is a soluble CM extension of F, split at V_0 ∪ V_1 ∪ V_2, with: p unramified in E; for R = {prime-to-p w: π_{E,w} or ρ|_{G_{E_w}} ramified}, S_p the p-adic places and S′ = S_p ∪ R, every prime below S′ or ramified in E splits in an imaginary quadratic subfield of E; ρ̄|_{G_{E_w}} trivial and q_w ≡ 1 mod p for w ∈ R; ρ̄|_{G_{E(ζ_p)}} enormous, ρ̄|_{G_E} decomposed generic, some σ ∈ G_E − G_{E(ζ_p)} with ρ̄(σ) scalar; and the E⁺-analogue of the p-adic degree condition.

([ACC](#source-acc), §6.5.12, proof of Theorem 6.1.1, pp. 1072–1073). *Needs:* `Layer 2`; `auxiliary_cm_extension_prescriptions`.

<a id="ordinary-base-change-fields"></a>

### 2.7 Ordinary base change fields

Prove `ordinary_base_change_fields`. Let E_0/F be a soluble CM extension such that: all places of V_0 ∪ V_1 ∪ V_2 split in E_0; π_{E_0,w}^{Iw_w} ≠ 0 for every finite w; at each finite prime-to-p w, either π_{E_0,w} and ρ|_{G_{E_0,w}} are unramified, or ρ|_{G_{E_0,w}} is unipotently ramified, q_w ≡ 1 mod p and ρ̄|_{G_{E_0,w}} trivial; for w | p, ρ̄|_{G_{E_0,w}} is trivial and [E_{0,w}:ℚ_p] > n(n+1)/2 + 1; for v | p, w | v and each i, ψ_{v,i} agrees with σ ↦ ∏_{τ∈Hom(F_v,Q̄_p)} τ(Art_{F_v}^{-1}(σ))^{−(λ_{τ,n−i+1}+i−1)} on all of I_{E_0,w}; and, with μ the weight of π_{E_0}, ψ_{v,i}(Art_{E_0,w}(x)) · ∏_{τ∈Hom(E_{0,w},Q̄_p)} τ(x)^{μ_{ιτ,n−i+1}+i−1} = 1 for every w | p and every p-power root of unity x ∈ E_{0,w}. Choose imaginary quadratic E_a, E_b, E_c as in the FL case but without requiring p unramified (p_c ≡ 1 mod 4p_b and p_b ≡ p_c ≡ −1 mod every rational prime below V_0∪V_1∪V_2). Then E = E_0E_aE_bE_c is soluble CM, V-split, and: every prime below S′ = S_p ∪ R or ramified in E splits in an imaginary quadratic subfield of E; ρ̄|_{G_{E_w}} trivial and q_w ≡ 1 mod p for w ∈ R; ρ̄|_{G_{E(ζ_p)}} enormous, ρ̄|_{G_E} decomposed generic, some σ ∈ G_E − G_{E(ζ_p)} with ρ̄(σ) scalar; ρ̄|_{G_{E_w}} trivial and [E_w:ℚ_p] > n(n+1)/2 + 1 for w | p. These are the field and residual/local arithmetic conditions. Construction of π_E uses Layer 2/soluble-base-change-and-descent; transport of its ι-ordinarity is the separate Layer 3/iota-ordinary-soluble-base-change obligation used by Layer 5/ordinary-lifting-descent.

([ACC](#source-acc), §6.6.10, proof of Theorem 6.1.2, pp. 1082–1084). *Needs:* `Layer 2`; `auxiliary_cm_extension_prescriptions`.

**Rank-two systems and their monodromy**

Begin with extremely weak compatibility over an arbitrary number field. Rank-one classification gives the reducibility dichotomy and the irreducible trichotomy. Algebraic subdirect-product structure and the arithmetic classification of unramified forms then feed the density-one large-image result.

<a id="rank-two-reducibility-dichotomy"></a>

### 2.8 Rank two reducibility dichotomy

Prove `rank_two_reducibility_dichotomy`. A rank-two extremely weakly compatible system R has one of two forms: every member r_λ is irreducible, or there are rank-one weakly compatible systems 𝒳₁,𝒳₂ in the BLGGT sense with r_λ≅χ₁,λ⊕χ₂,λ at every coefficient place λ.

([ACC](#source-acc), §7.1, Lemma 7.1.1, p. 1086). *Needs:* `CS:R24.5`; `CS:R24.5:operations`.

<a id="rank-two-system-trichotomy"></a>

### 2.9 Rank-two trichotomy

Prove `rank_two_system_trichotomy`. Let R be an irreducible extremely weakly compatible system of rank 2. Then either (1) R is strongly irreducible; or (2) R is Artin up to twist; or (3) there are a quadratic extension F'/F and a weakly compatible system 𝒳 of characters of G_{F'} with R ≅ Ind_{G_{F'}}^{G_F} 𝒳 (R is then called induced).

([ACC](#source-acc), §7.1, Lemma 7.1.2, pp. 1086–1087). *Needs:* `Layer 2`; `CS:R24.5`; `CS:R24.5:operations`.

<a id="rank-two-adjoint-monodromy"></a>

### 2.10 Rank two adjoint monodromy

Prove `rank_two_adjoint_monodromy`. Over Q̄_l: (1) every morphism PGL_2 → PGL_2 is trivial or conjugation by an element of PGL_2(Q̄_l); (2) every morphism PGL_2^r → PGL_2 is trivial or a projection followed by a conjugation; (3) up to PGL_2(Q̄_l)^J-conjugacy, morphisms PGL_2^I → PGL_2^J are induced by pairs (J_0 ⊂ J, φ : J_0 → I); (4) Aut(PGL_2^I) = PGL_2^I ⋊ S_I; (5) a connected algebraic subgroup G ⊂ PGL_2^J surjecting onto PGL_2 under every projection is ≅ PGL_2^I, embedded (up to conjugacy) through a surjection φ : J ↠ I (induction on #J and Goursat); (6) for M/Q_l finite, (Res^M_{Q_l} PGL_2)_{Q̄_l} ≅ PGL_2^{Hom_{Q_l}(M,Q̄_l)} with G_{Q_l} acting through its left action on Hom_{Q_l}(M, Q̄_l); (7) forms of PGL_2^r are classified by the middle term of H^1(Q_l, PGL_2^r) → H^1(Q_l, Aut PGL_2^r) → H^1(Q_l, S_r), and the unramified ones (quasi-split and split over an unramified extension) are exactly ∏_i Res^{N_i}_{Q_l} PGL_2 with N_i/Q_l unramified; (8) hence, if G ⊂ ∏_{j∈J} Res^{M_j}_{Q_l} PGL_2 is an unramified connected subgroup whose base change to Q̄_l surjects onto every factor of PGL_2^{⊔_j Hom(M_j,Q̄_l)}, then G ≅ ∏_{i∈I} Res^{N_i}_{Q_l} PGL_2 with N_i/Q_l unramified, and each (j, τ)-projection of G_{Q̄_l} is PGL_2(Q̄_l)-conjugate to the projection onto one factor of ∏_i (Res^{N_i}_{Q_l} PGL_2)_{Q̄_l}.

([ACC](#source-acc), §7.1, proof of Lemma 7.1.3, facts (1)–(8), pp. 1088–1089). *Needs:* `Tau Ceti ReductiveGroups L7`; `RG:RG2.0a`.

<a id="rank-two-large-residual-image"></a>

### 2.11 Rank-two large residual image

Prove `rank_two_large_residual_image`. Suppose R is a rank-two extremely weakly compatible system which is irreducible. A set L of rational primes of Dirichlet density one can be chosen so that bar r_λ is absolutely irreducible for every l∈L and every λ|l. If R is neither induced nor Artin up to twist, shrink L while keeping density one so that bar r_λ(G_{F̃}) contains SL₂(F_l), where F̃ is the normal closure of F/Q. The contained subgroup is over the prime field; no equality with the coefficient residue-field SL₂ is asserted.

([ACC](#source-acc), §7.1, Lemma 7.1.3, pp. 1087–1089). *Needs:* `Layer 2`; `CS:R24.5`; `CS:R24.5:operations`.

**Galois composita, genericity and avoidance**

Separate the finite group calculation from the field compositum construction. Decomposed genericity uses the normal closure over Q, whereas preservation of a residual image uses disjointness over F. Symmetric-power avoidance requires both disjointness conditions specified below.

<a id="simple-galois-composita"></a>

### 2.12 Simple Galois composita

Prove `simple_galois_composita`. Let k be a field, Δ a finite simple group, and K_1, …, K_s finite Galois extensions of k inside a common field, each equal to k or with Galois group isomorphic to Δ. Then there is a subset J ⊂ {1, …, s} such that the compositum K = K_1⋯K_s is the compositum of the K_j with j ∈ J, and restriction identifies Gal(K/k) with ∏_{j∈J} Gal(K_j/k) ≅ Δ^{|J|}. In particular, for disjoint subsets I, I′ of J, the composita of the K_j over j ∈ I and over j ∈ I′ are linearly disjoint over k.

([Qian](#source-qian), Proof of Lemma 2.6(2), journal concordance pp. 1251–1252; NSF PDF pp. 13–14). *Needs:* `mathlib:Subgroup.goursat_surjective`; `AGR:R01.4`.

<a id="symmetric-power-adjoint-genericity"></a>

### 2.13 Symmetric-power genericity

Prove `symmetric_power_adjoint_genericity`. Let F/Q be finite with normal closure F̃, m a positive integer, l > 2m + 3 a prime, and r̄: G_F → GL_2(F̄_l) continuous with r̄(G_{F̃}) ⊃ SL_2(F_l). Let F′/F be a finite extension linearly disjoint from F̄^{ker r̄} over F, with normal closure F̃′ over Q. If ad r̄(G_{F̃′}) ⊃ PSL_2(F_l), then Sym^m r̄|_{G_{F′}} is decomposed generic.

([ACC](#source-acc), Lemma 7.1.6(3), pp. 1090–1091). *Needs:* `Layer 2`; `AG:AG2.7`; `AGR:R01.4`; `mathlib:Matrix.ProjectiveSpecialLinearGroup.rank_two_simple`; `Tau Ceti Chebotarev L10`.

<a id="qian-symmetric-power-avoidance"></a>

### 2.14 Symmetric-power avoidance

Prove `qian_symmetric_power_avoidance`. Let F/Q be a finite extension with normal closure F̃, n a positive integer, l > 2n + 5 a prime, and r̄: G_F → GL_2(F̄_l) a continuous representation with r̄(G_{F̃}) ⊃ SL_2(F_l). Put H = F̃ · F̄^{ker ad r̄}, and let H′ be the normal closure of H over Q. Let F_1/F be a finite Galois extension that is linearly disjoint from F̄^{ker r̄} over F and linearly disjoint from H′ over F. Then Sym^{n−1} r̄|_{G_{F_1}} is decomposed generic. For n = 1 this is immediate, since Sym^0 r̄ is the trivial character; for n ≥ 2 the proof rests on ACC+ Lemma 7.1.6(3) with m = n − 1.

([Qian](#source-qian), Lemma 2.6(2), p. 1251; proof pp. 1251–1252; NSF online-first PDF pp. 13–14 (journal pagination inferred from 1239–1275)). *Needs:* `Layer 2`; `AG:AG2.7`; `AGR:R01.4`; `mathlib:Matrix.ProjectiveSpecialLinearGroup.rank_two_simple`.

**Weak automorphy and symmetric powers**

Keep prescribed primes in the weak automorphy witness: almost-everywhere equality alone does not control them. Purity upgrades this witness over CM fields. The rank-two symmetric-power formulas transport the labelled weights and determinants to the desired rank.

<a id="weak-automorphy-prime-to-set"></a>

### 2.15 Weak automorphy prime to a set

Define `WeaklyAutomorphicPrimeTo`. For T a finite set of finite places disjoint from S, R is weakly automorphic of level prime to T if there are a regular algebraic cuspidal π of GL_n(𝔸_F) and ι : M ↪ ℂ such that for all but finitely many v ∉ S and for every v ∈ T, π_v is unramified and rec^T_{F_v}(π_v)(Frob_v) has characteristic polynomial ι(Q_v(X)); weakly automorphic means T = ∅.

([BCGNT](#source-bianchi), Definition 6.1.2(3), author PDF p. 58). *Needs:* `CS:R24.5`; `AG:AG2.6`; `CS:R24.5:operations`.

Its interface includes:

- `WeaklyAutomorphicPrimeTo.empty`: At T=∅ this is weak automorphy.
- `WeaklyAutomorphicPrimeTo.mono`: For T′⊂T disjoint from S, a witness at T is a witness at T′.
- `WeaklyAutomorphicPrimeTo.witness_at`: Every v∈T is unramified for the witnessing π and has precisely the specified polynomial.
- `WeaklyAutomorphicPrimeTo.automorphic_implies`: An automorphic system is weakly automorphic prime to any finite T disjoint from S.

**Checks.**

- `WeaklyAutomorphicPrimeTo.empty_set` (degenerate): An automorphic system is weakly automorphic prime to ∅.
- `WeaklyAutomorphicPrimeTo.singleton` (characterisation): At T={v₀}, a witness must match at v₀ even if v₀ lies in its finite almost-everywhere exception list.
- `WeaklyAutomorphicPrimeTo.bad_set` (non-example): T∩S≠∅ is inadmissible; no unspecified Q_v at a bad place can witness the predicate.

<a id="pure-weak-automorphy-upgrade"></a>

### 2.16 Pure weak automorphy upgrade

Prove `pure_weak_automorphy_upgrade`. Let F be CM and R a very weakly compatible system of rank n that is weakly automorphic, via π, and pure of weight m. Then R is automorphic.

([BCGNT](#source-bianchi), Lemma 6.1.4, author PDF p. 59). *Needs:* `Layer 2`; `CS:R24.5`; `AG:AG2.6`; `SR:SR.3`; `AG:AG2.5`.

<a id="density-one-crystalline-large-image"></a>

### 2.17 Density one crystalline large image

Prove `density_one_crystalline_large_image`. Let R be a strongly irreducible very weakly compatible system of rank 2 over a number field F. The set L(R) of primes l not lying below any place of S such that r_λ is crystalline with Hodge–Tate weights H_τ and r̄_λ(G_{F̃}) contains a conjugate of SL_2(𝔽_l) for every λ | l (F̃ the Galois closure of F/ℚ) has Dirichlet density 1.

([BCGNT](#source-bianchi), Lemma 6.1.5, author PDF p. 59). *Needs:* `Layer 2`; `CS:R24.5`.

<a id="rank-two-symmetric-power-transport"></a>

### 2.18 Rank two symmetric power transport

Prove `rank_two_symmetric_power_transport`. For a very weakly compatible system R of rank 2 with H_τ = {0, m}, Sym^{n−1}R has representations Sym^{n−1}r_λ, weights {0, m, …, (n − 1)m} and determinant det^{n(n−1)/2}. Here n≥1. Regularity follows when m≠0; for m=0 and n>1 the Hodge multiset has repetitions. No automorphy or purity is inferred from the operation alone.

([BCGNT](#source-bianchi), §6.2, proof discussion after Remark 6.2.2, author PDF p. 60 (parallel HT formula); the determinant formula is the imported symmetric-power calculation). *Needs:* `mathlib:Matrix.charpoly`; `CS:R24.5`; `CS:R24.5:operations`.

**Checks.**

- For n=3 and H={0,m}, H(Sym²)={0,m,2m} and det(Sym²)=(det r)^3. Roots 2,3 give Sym² roots 4,6,9 and determinant 216=6³.
- For m=0 and n=3, the multiset {0,0,0} is not regular.

**Weight zero, oddness and irreducibility criteria**

Weight zero is the Hodge multiset {0,1}, and oddness is a determinant condition at every real place. The regularity hypothesis removes the Artin-up-to-twist branch of the rank-two trichotomy. The final large-image formulation retains the prime-field conclusion.

<a id="rank-two-weight-zero"></a>

### 2.19 Rank two weight zero

Define `RankTwoWeightZero`. For a rank-two compatible system with Hodge table H_τ, WeightZero means H_τ is the multiset {0,1} at every embedding τ. This is the BCGP automorphic-weight convention and differs from saying that the system is pure of weight 0. General system purity, regularity and strong irreducibility are imported from R24.5.

([BCGP](#source-bcgp), §9.1, definitions before Lemma 9.1.10, p. 251). *Needs:* `CS:R24.5`.

Its interface includes:

- `RankTwoWeightZero.iff`: Weight zero means ∀τ,H_τ={0,1} as multisets.
- `RankTwoWeightZero.sum`: Every Hodge multiset has sum 1.
- `RankTwoWeightZero.regular`: Its two Hodge weights are distinct, so the rank-two system is regular.
- `RankTwoWeightZero.restriction`: Pulling the Hodge table back along restriction of embeddings preserves weight zero.

**Checks.**

- `RankTwoWeightZero.standard` (computation): The constant table {0,1} has weight zero.
- `RankTwoWeightZero.repeated_zero` (non-example): The constant table {0,0} does not have weight zero.
- `RankTwoWeightZero.reversed` (compatibility): The table presented as {1,0} has weight zero because the weights are a multiset.

<a id="rank-two-odd"></a>

### 2.20 Rank two odd

Define `RankTwoOdd`. For a rank-two system over a number field F with characteristic-zero coefficient fields, Odd means det r_λ(c_v)=−1 for every real place v and every coefficient place λ, where c_v is the complex-conjugation involution. At a field with no real places the condition is vacuous. With the actual involutions supplied, it is the determinant condition on the corresponding matrices; it is not trace zero without a coefficient-characteristic restriction.

([BCGP](#source-bcgp), §9.1 definitions before Lemma 9.1.10, p. 251). *Needs:* `mathlib:Matrix.charpoly`; `CS:R24.5`; `AG:AG2.6`; `CS:R24.5:operations`.

Its interface includes:

- `RankTwoOdd.det_eq`: For every real-place involution and coefficient member the determinant is −1.
- `RankTwoOdd.conjugate`: Changing the representative complex conjugation by conjugacy preserves the determinant equation.
- `RankTwoOdd.no_real_places`: If F has no real places the condition is true.
- `RankTwoOdd.automorphic_weight_zero`: The weight-zero cuspidal GL₂ system in BCGP’s setting is odd by the automorphic-system supplier.

**Checks.**

- `RankTwoOdd.split_involution` (computation): diag(1,−1) is odd.
- `RankTwoOdd.identity` (non-example): The identity matrix over Q is not odd.
- `RankTwoOdd.empty_real_places` (degenerate): An empty real-place family satisfies the determinant condition.

<a id="rank-two-member-irreducibility-equivalence"></a>

### 2.21 Rank two member irreducibility equivalence

Prove `rank_two_member_irreducibility_equivalence`. For a rank-two weakly compatible system R, the following are equivalent: R is irreducible on a density-one set of rational primes; every r_λ is irreducible; at least one r_λ is irreducible. The assertion follows from the stronger extremely weak rank-two reducibility dichotomy over the same F, not from the existing R24.5 result restricted to Q.

([BCGP](#source-bcgp), Lemma 9.1.10(1), pp. 251–252). *Needs:* `Layer 2`; `CS:R24.5`.

<a id="strong-irreducibility-symmetric-square"></a>

### 2.22 Strong irreducibility symmetric square

Prove `strong_irreducibility_symmetric_square`. For an irreducible regular rank-two weakly compatible system R, strong irreducibility of R, irreducibility of Sym²R as a system, irreducibility of every Sym²r_λ, and irreducibility of some Sym²r_λ are equivalent. If they fail, R is induced from a compatible system of characters of a quadratic extension F′/F. Regularity excludes the Artin-up-to-twist case. The rank-three symmetric-square implication uses rank-two representation theory, not an assertion of general lambda-independence of rank-three systems.

([BCGP](#source-bcgp), Lemma 9.1.10(2), pp. 251–252). *Needs:* `Layer 2`; `CS:R24.5`.

<a id="corrected-rank-two-large-image"></a>

### 2.23 Prime-field large residual image

Prove `corrected_rank_two_large_image`. For a strongly irreducible rank-two weakly compatible system over F, there is a density-one set of rational primes l such that for every coefficient place λ|l, bar r_λ(G_{F̃}) contains a conjugate of SL₂(F_l). No regularity hypothesis is needed. This does not assert SL₂(O_M/λ). In the real-multiplication use of BCGP Lemma 9.2.2, a separate large-image argument is required from AbelianSurfacesPotentialModularity.

([BCGP](#source-bcgp), Lemma 9.1.10(3), pp. 251–252, corrected by ACC Lemma 7.1.3). *Needs:* `Layer 2`; `CS:R24.5`.

### Examples

The identity field extension fixes both base-change directions. Weight-zero means the multiset {0,1}, in either order, while repeated zero fails. Oddness is checked on diag(1,−1); the identity matrix over Q fails. A cyclic induced representation shows why base change can lose cuspidality.

### Dependencies

ET.7a, AL.3, AG2.2/AG2.5/AG2.6/AG2.7, CS:R23.1/R24.5, AGR:R01.4, Tau Ceti Chebotarev and reductive-group structure. The local auxiliary CM construction supplies the prescribed extensions.

## Layer 3: Ordinary cohomology and compatibility

**Iwahori levels, contraction and ordinary summands**

Fix all local factors before passing up a tower. Positive torus elements act by transfer on unipotent invariants. The ordinary projector at finite Artinian level is imported; the stable image of a single endomorphism is the local algebraic core of its arithmetic use.

<a id="iwahori-level-tower"></a>

### 3.1 Iwahori level tower

Define `IwahoriLevelTower`, the two-depth adelic refinement of RG2.3’s local Iwahori. Standing data: F a CM field, n ≥ 1, p a prime, E/Q_p finite containing the images of all embeddings F ↪ Q̄_p; standing hypothesis for all of §5: F contains an imaginary quadratic field in which p splits (p may ramify in F). Let K ⊂ GL_n(A_F^∞) be a good subgroup, λ ∈ (Z^n_+)^{Hom(F,E)}, S a finite set of finite places of F containing S_p and stable under c, such that (i) for every finite v ∉ S with residue characteristic l, either S contains no l-adic place and l is unramified in F, or l splits in some imaginary quadratic subfield of F; (ii) K_v = Iw_v for v | p and K_v = GL_n(O_{F_v}) for finite v ∉ S. For integers c ≥ b ≥ 0 with c ≥ 1, K(b,c) ⊂ K is the good subgroup with K(b,c)_v = K_v for v ∤ p and K(b,c)_v = Iw_v(b,c) for v | p; K(0,1) = K and K(0,c)/K(b,c) ≅ ∏_{v|p} T_n(O_{F_v}/ϖ_v^b). Define T^{S,ord} = T^S ⊗_O O⟦T_n(O_{F,p})⟧[{U_{v,1},…,U_{v,n},U_{v,n}^{-1}}_{v|p}] (U_{v,i} formal variables), U_v = U_{v,1}U_{v,2}⋯U_{v,n−1}, U_p = ∏_{v|p} U_v. The canonical surjection O⟦T_n(O_{F,p})⟧ → O[K(0,c)/K(b,c)] extends to T^{S,ord} → End_{D(O[K(0,c)/K(b,c)])}(RΓ_{K(0,c)/K(b,c)}(X_{K(b,c)}, V_λ)), U_{v,i} acting by the double coset operator [Iw_v(b,c) diag(ϖ_v,…,ϖ_v,1,…,1) Iw_v(b,c)] (i entries ϖ_v). Additional standing hypothesis for §§5.2–5.5: ϖ_{v^c} = ϖ_v^c for every v | p; the U_{v,i} depend on ϖ_v but RΓ^ord, T^S(K(b,c),λ)^ord and the truth of Theorem 5.5.1 do not.

([ACC](#source-acc), §5.1, pp. 989–991). *Needs:* `Layer 0`; `SR:SR.1`.

Its interface includes:

- `IwahoriLevelTower.level`: The (b,c)-level equals K away from p and matrices upper triangular modulo varpi_v^c with diagonal congruent to 1 modulo varpi_v^b at p.
- `IwahoriLevelTower.transition`: For b′≥b,c′≥c, inclusion of levels gives compatible pullback and trace on integral cohomology.
- `IwahoriLevelTower.diamondQuotient`: K(0,c)/K(b,c) is the product of diagonal unit groups modulo varpi_v^b.
- `IwahoriLevelTower.ordinaryOperator`: U_p is the product over v|p and 1≤i<n of the normalized double-coset operators; U_{v,n} is already invertible.

**Checks.**

- `IwahoriLevelTower.base` (computation): K(0,1)=K.
- `IwahoriLevelTower.zero_b` (degenerate): For b=0 the diamond quotient is trivial.
- `IwahoriLevelTower.deep_unipotent` (non-example): For b=1 a diagonal unit not congruent to 1 modulo varpi_v is excluded even though it belongs to K(0,c).
- Over a field, nonzero ϖ generates the unit ideal and the congruence levels are the whole matrix group; arithmetic uniformizers are nonunits.

<a id="positive-torus-monoid"></a>

### 3.2 Positive torus monoid

Define `PositiveTorusMonoid`. T_n(F_p)^+ ⊂ T_n(F_p) is the open submonoid of t with t N_n(O_{F,p}) t^{-1} ⊂ N_n(O_{F,p}); T_n(F_v)^+ = T_n(F_v) ∩ T_n(F_p)^+; Δ_p = ∏_{v|p} Iw_v T_n(F_v)^+ Iw_v (§2.2.5). For b ≥ 0: T_n(O_{F,p})(b) = ∏_{v∈S_p} ker(T_n(O_{F_v}) → T_n(O_{F_v}/ϖ_v^b)), T_n(O_{F,p})_b = T_n(O_{F,p})/T_n(O_{F,p})(b), T_n(F_p)^+_b = T_n(F_p)^+/T_n(O_{F,p})(b), T_n(F_p)_b = T_n(F_p)/T_n(O_{F,p})(b). u_p = (p^{n−1}, p^{n−2}, …, 1) ∈ T_n(Q_p) ⊂ T_n(F_p) lies in T_n(F_p)^+. B_n(F_p)^+ = N_n(O_{F,p})·T_n(F_p)^+ ⊂ Δ_p; B_n(O_{F,p})(b) is the preimage of T_n(O_{F,p})(b) in B_n(O_{F,p}). Every C ∈ D_sm(O/ϖ^m[T_n(F_p)^+_b]) carries a functorial homomorphism O⟦T_n(O_{F,p})⟧[{U_{v,1},…,U_{v,n},U_{v,n}^{-1}}_{v∈S_p}] → End(C), via O⟦T_n(O_{F,p})⟧ → O/ϖ^m[T_n(O_{F,p})_b] and U_{v,i} ↦ diag(ϖ_v,…,ϖ_v,1,…,1) ∈ T_n(F_v) (i entries ϖ_v); hence a T^S-action on C extends to a T^{S,ord}-action.

([ACC](#source-acc), §5.2.1, pp. 992–993). *Needs:* `Layer 3`; `SR:SR.1`.

Its interface includes:

- `PositiveTorusMonoid.mem_iff`: For a diagonal torus element, contraction of upper unipotents is equivalent to valuation(t_i)≥valuation(t_j) for i<j.
- `PositiveTorusMonoid.contractingElement`: The local-uniformizer row (n−1,n−2,…,0) is positive; u_p has this row multiplied by v(p).
- `PositiveTorusMonoid.unit_subgroup`: Every diagonal unit belongs to the cone, and zero valuations recover the compact torus.
- `PositiveTorusMonoid.mul`: Componentwise products preserve the cone, so it is an open submonoid of the diagonal torus.

**Checks.**

- `PositiveTorusMonoid.rank_one` (degenerate): For n=1 all diagonal torus elements are positive.
- `PositiveTorusMonoid.rank_two_positive` (computation): The exponent row (1,0) is positive.
- `PositiveTorusMonoid.rank_two_negative` (non-example): The exponent row (0,1) is not positive for the upper-triangular Borel.

<a id="arithmetic-ordinary-summand"></a>

### 3.3 Arithmetic ordinary summand

Define `ArithmeticOrdinarySummand` on the arithmetic tower with its diamond and Hecke actions. For the Iwahori level tower above, there is a well-defined direct summand RΓ_{K(0,c)/K(b,c)}(X_{K(b,c)}, V_λ)^ord of RΓ_{K(0,c)/K(b,c)}(X_{K(b,c)}, V_λ) in D(O[K(0,c)/K(b,c)]) on which U_p acts invertibly (theory of ordinary parts, [KT17 §2.4]). T^S(K(b,c),λ)^ord is the image of T^{S,ord} → End_{D(O[K(0,c)/K(b,c)])}(RΓ_{K(0,c)/K(b,c)}(X_{K(b,c)}, V_λ)^ord), i.e. T^S(K(b,c),λ)^ord = T^{S,ord}(RΓ_{K(0,c)/K(b,c)}(X_{K(b,c)}, V_λ)^ord). There is a canonical homomorphism T^S(K(0,c)/K(b,c), V_λ) → T^S(K(b,c),λ)^ord (in general neither injective nor surjective); consequently every maximal ideal 𝔪 of T^S(K(b,c),λ)^ord has an associated ρ̄_𝔪: G_{F,S} → GL_n(T^S(K(b,c),λ)^ord/𝔪). A maximal ideal of T^{S,ord} with residue field finite over k is of Galois type (resp. non-Eisenstein) if its pullback to T^S is so in the sense of Definition 2.3.6.

([ACC](#source-acc), §5.1, p. 990). *Needs:* `Layer 3`; `PF:L0a`.

Its interface includes:

- `ArithmeticOrdinarySummand.complex`: The image of PadicFamilies:L0a’s derived ordinary idempotent on the tower’s finite perfect complex.
- `ArithmeticOrdinarySummand.operator_bijective`: U_p acts invertibly on that image.
- `ArithmeticOrdinarySummand.finite_quotient_comparison`: Modulo varpi^m the image is the stabilized factorial-power summand, and equals the localization of the finite module at U_p.
- `ArithmeticOrdinarySummand.base_change`: Coefficient quotient and equivariant tower maps commute with the projector after the finite-quotient/continuity hypotheses are verified.

**Checks.**

- `ArithmeticOrdinarySummand.zero_complex` (degenerate): The ordinary summand of the zero complex is zero.
- `ArithmeticOrdinarySummand.unit_operator` (computation): With U_p the identity, the summand is the whole complex.
- `ArithmeticOrdinarySummand.nilpotent_operator` (non-example): A finite complex with nilpotent U_p has zero ordinary summand.

<a id="lowest-weight-character"></a>

### 3.4 Lowest weight character

Define `LowestWeightCharacter`. For λ ∈ X^\*((Res_{F/Q}T_n)_E) = (Z^n)^{Hom(F,E)}, O(λ) is the free rank-one O-module on which u ∈ T_n(O_{F,p}) acts by ∏_{τ∈Hom(F,E)} ∏_{i=1}^n τ(u_i)^{λ_{τ,i}} and every diag(ϖ_v^{a_1},…,ϖ_v^{a_n}) (a_i ∈ Z) acts trivially. For dominant λ, projection to the lowest weight space gives an O-linear map V_λ → O(w_0^G λ) which is B_n(F_p)^+-equivariant (·_p-action of §2.2.5 on the source, action through the projection to T_n(F_p) on the target); K_λ := ker(V_λ → O(w_0^G λ)) is an O[B_n(F_p)^+]-module, finite free over O.

([ACC](#source-acc), §5.2.1, p. 993). *Needs:* `Layer 3`; `Tau Ceti ReductiveGroups L9`.

Its interface includes:

- `LowestWeightCharacter.unit_eval`: On units u its scalar is ∏τ,i τ(u_i)^{λ_{τ,i}}.
- `LowestWeightCharacter.uniformizer_eval`: It is 1 on every chosen diagonal uniformizer power.
- `LowestWeightCharacter.add`: The character for λ+μ is the product of the two characters.
- `LowestWeightCharacter.projection`: For dominant λ the integral dual-Weyl lattice has a B⁺-equivariant lowest-weight quotient O(w₀λ) with finite free kernel killed by a power of u_p modulo varpi^m.

**Checks.**

- `LowestWeightCharacter.zero` (degenerate): The zero weight gives the trivial character.
- `LowestWeightCharacter.rank_one_square` (computation): For one embedding, rank one and weight 2, a unit u acts by τ(u)².
- `LowestWeightCharacter.uniformizer_normalization` (non-example): Even for nonzero λ, chosen uniformizers act by 1, not by their algebraic λ-power.

<a id="ordinary-galois-characters"></a>

### 3.5 Ordinary Galois characters

Define `OrdinaryGaloisCharacters`. The operators U_{v,i} are invertible in T^S(K(b,c),λ)^ord (because U_p is). For each v | p and i = 1,…,n, χ_{λ,v,i}: G_{F_v} → (T^S(K(b,c),λ)^ord)^× is the unique continuous character with χ_{λ,v,i}(Art_{F_v}(u)) = ε^{1−i}(Art_{F_v}(u)) · ∏_{τ∈Hom_{Q_p}(F_v,E)} τ(u)^{−(w_0^G λ)_{τ,i}} · ⟨diag(1,…,u,…,1)⟩ for u ∈ O_{F_v}^× (u in the i-th diagonal entry), and χ_{λ,v,i}(Art_{F_v}(ϖ_v)) = ε^{1−i}(Art_{F_v}(ϖ_v)) · U_{v,i}/U_{v,i−1} (with U_{v,0} = 1).

([ACC](#source-acc), §5.1, p. 990). *Needs:* `Layer 3`; `mathlib:Matrix.charpoly`.

Its interface includes:

- `OrdinaryGaloisCharacters.on_units`: On Art(u), χ_i=ε^{1−i}∏τ τ(u)^{−λ_{τ,n−i+1}} times the i-th diamond character.
- `OrdinaryGaloisCharacters.on_uniformizer`: On Art(varpi_v), χ_i=ε^{1−i} U_{v,i}/U_{v,i−1}, with U_{v,0}=1.
- `OrdinaryGaloisCharacters.unique`: The unit formula and chosen uniformizer value determine the continuous character by local class field theory.
- `OrdinaryGaloisCharacters.change_uniformizer`: Changing the uniformizer changes the U-ratio by the corresponding unit/diamond factor and leaves the Galois character unchanged.

**Checks.**

- `OrdinaryGaloisCharacters.rank_one` (computation): For n=1, χ₁(Art(varpi_v))=U_{v,1}.
- `OrdinaryGaloisCharacters.determinant` (characterisation): The product of the n uniformizer values is ε^{n(1−n)/2}U_{v,n}.
- `OrdinaryGaloisCharacters.weight_reversal` (non-example): For rank 2 with λ=(2,0), the algebraic unit factors are 1 for χ₁ and u^{-2} for χ₂ before ε and diamonds; using λ_i instead of λ_{n−i+1} reverses them.

**Local ordinary functors and derived invariants**

The coefficient characteristic is p. Build ordinary parts in smooth positive-monoid categories with enough injectives, then derive the functors. The comparisons depend on unipotent acyclicity and injective preservation, with the indicated boundedness conditions.

The coordinate API also gives `OrdinaryGaloisCharacters.unique_from_units_and_uniformizer` and `OrdinaryGaloisCharacters.coordinate_uniformizer_change`. If ϖ′=u₀ϖ, its new coordinates (u,k) represent old coordinates (u u₀^k,k), so χ(u u₀^k,k)=χ(u,0)(χ(u₀,0)χ(1,1))^k. This proves the algebraic coordinate change; local reciprocity supplies the arithmetic character. Every quotient U_i/U_{i−1} uses units of the ordinary Hecke algebra, and the integer powers therefore include negative k. (The unit/uniformizer prescription in ACC §5.1, p. 990.)

**Checks.**

- For rank one, unit character u↦u and χ(ϖ)=2 over Q, replacing ϖ by 3ϖ gives χ(3ϖ)=6. Keeping the old uniformizer value 2 fails this computation.

<a id="local-ordinary-parts"></a>

### 3.6 Ordinary parts

Define `LocalOrdinaryParts`. Γ(N_n(O_{F,p}),−): Mod_sm(O/ϖ^m[Δ_p]) → Mod_sm(O/ϖ^m[T_n(F_p)^+]) is N_n(O_{F,p})-invariants with t ∈ T_n(F_p)^+ acting by t·v = Σ_{n∈N_n(O_{F,p})/tN_n(O_{F,p})t^{-1}} n t v (5.2.5), i.e. by the double coset operator [N_n(O_{F,p}) t N_n(O_{F,p})]. Γ(B_n(O_{F,p})(b),−): Mod_sm(O/ϖ^m[Δ_p]) → Mod(O/ϖ^m[T_n(F_p)^+_b]) is B_n(O_{F,p})(b)-invariants with the same formula. For c ≥ b ≥ 0, c ≥ 1, Iw_p(b,c) = ∏_{v∈S_p} Iw_v(b,c) and Γ(Iw_p(b,c),−): Mod_sm(O/ϖ^m[Δ_p]) → Mod(O/ϖ^m[T_n(F_p)^+_b]), t acting by [Iw_p(b,c) t Iw_p(b,c)]. Γ(T_n(O_{F,p})(b),−) maps Mod_sm(O/ϖ^m[T_n(F_p)^+]) → Mod(O/ϖ^m[T_n(F_p)^+_b]) and Mod_sm(O/ϖ^m[T_n(F_p)]) → Mod(O/ϖ^m[T_n(F_p)_b]). ord = − ⊗_{O/ϖ^m[T_n(F_p)^+]} O/ϖ^m[T_n(F_p)]: Mod_sm(O/ϖ^m[T_n(F_p)^+]) → Mod_sm(O/ϖ^m[T_n(F_p)]) and ord_b = − ⊗_{O/ϖ^m[T_n(F_p)^+_b]} O/ϖ^m[T_n(F_p)_b]: Mod(O/ϖ^m[T_n(F_p)^+_b]) → Mod(O/ϖ^m[T_n(F_p)_b]) (localizations; on modules finite over O/ϖ^m they agree with the maximal summand on which the torus acts invertibly, [Eme10b, Lem. 3.2.1]).

([ACC](#source-acc), §5.2.1, (5.2.5), pp. 993–994). *Needs:* `Layer 3`; `PF:L0a`; `SR:SR.0:derived-extension`.

Its interface includes:

- `LocalOrdinaryParts.transfer_action`: The action on N(O)-invariants is t·v=Σ_{n∈N(O)/tN(O)t^{-1}} ntv.
- `LocalOrdinaryParts.localization`: Ordinary parts are the localization from the positive-torus monoid algebra to the group algebra after N-invariants.
- `LocalOrdinaryParts.finite_comparison`: On finite O/varpi^m-modules this localization is the PadicFamilies:L0a ordinary summand.
- `LocalOrdinaryParts.map`: Equivariant module maps induce ordinary maps and preserve identity/composition.
- `LocalOrdinaryParts.derived`: Derive N-invariants in the smooth monoid category, then apply exact localization.

**Checks.**

- `LocalOrdinaryParts.zero` (degenerate): The ordinary parts of the zero representation are zero.
- `LocalOrdinaryParts.trivial_unipotent` (compatibility): For N={1}, the functor is precisely torus localization.
- `LocalOrdinaryParts.transfer_not_naive` (non-example): For a trivial F_p-representation of N=Z_p and tNt^{-1}=pN, transfer acts by p=0; ordinary localization is zero although the naive t action would be the identity.

<a id="ordinary-torus-invariants"></a>

### 3.7 Ordinary torus invariants

Prove `ordinary_torus_invariants`. For b ≥ 0 the square Γ(T_n(O_{F,p})(b),−) ∘ ord ≅ ord_b ∘ Γ(T_n(O_{F,p})(b),−) of functors Mod_sm(O/ϖ^m[T_n(F_p)^+]) → Mod(O/ϖ^m[T_n(F_p)_b]) commutes up to natural isomorphism; i.e. the natural map M^{T_n(O_{F,p})(b)} ⊗_{O/ϖ^m[T_n(F_p)^+_b]} O/ϖ^m[T_n(F_p)_b] → (M ⊗_{O/ϖ^m[T_n(F_p)^+]} O/ϖ^m[T_n(F_p)])^{T_n(O_{F,p})(b)} is an isomorphism for every smooth M.

([ACC](#source-acc), §5.2.1, Lemma 5.2.6, p. 995). *Needs:* `Layer 3`.

<a id="unipotent-invariants-acyclicity"></a>

### 3.8 Unipotent invariants acyclicity

Prove `unipotent_invariants_acyclicity`. The functors Γ(N_n(O_{F,p}),−), Γ(B_n(O_{F,p})(b),−) and Γ(Iw_p(b,c),−) on Mod_sm(O/ϖ^m[Δ_p]) are left exact, and for every b ≥ 0 the functor Γ(N_n(O_{F,p}),−) sends injective objects of Mod_sm(O/ϖ^m[Δ_p]) to Γ(T_n(O_{F,p})(b),−)-acyclic objects of Mod_sm(O/ϖ^m[T_n(F_p)^+]).

([ACC](#source-acc), §5.2.1, Lemma 5.2.7(1), p. 995). *Needs:* `Layer 3`; `SR:SR.0:derived-extension`.

<a id="ordinary-exact-injective"></a>

### 3.9 Ordinary exact injective

Prove `ordinary_exact_injective`. The localization functors ord: Mod_sm(O/ϖ^m[T_n(F_p)^+]) → Mod_sm(O/ϖ^m[T_n(F_p)]) and ord_b: Mod(O/ϖ^m[T_n(F_p)^+_b]) → Mod(O/ϖ^m[T_n(F_p)_b]) are exact and preserve injectives.

([ACC](#source-acc), §5.2.1, Lemma 5.2.7(2), pp. 995–996). *Needs:* `Layer 3`; `SR:SR.0:derived-extension`.

<a id="iwahori-borel-ordinary-comparison"></a>

### 3.10 Iwahori borel ordinary comparison

Prove `iwahori_borel_ordinary_comparison`. For c ≥ b ≥ 0 with c ≥ 1 there is a natural isomorphism ord_b ∘ Γ(Iw_p(b,c),−) ≅ ord_b ∘ Γ(B_n(O_{F,p})(b),−) of functors Mod_sm(O/ϖ^m[Δ_p]) → Mod(O/ϖ^m[T_n(F_p)_b]), induced by the inclusion V^{Iw_p(b,c)} ⊂ V^{B_n(O_{F,p})(b)} (which is T_n(F_p)^+_b-equivariant because Iw_p(b,c) has an Iwahori decomposition).

([ACC](#source-acc), §5.2.1, Lemma 5.2.8, pp. 996–997). *Needs:* `Layer 3`.

<a id="derived-ordinary-comparison"></a>

### 3.11 Derived ordinary comparison

Prove `derived_ordinary_comparison`. Let π ∈ D_sm(O/ϖ^m[Δ_p]) be bounded below. For c ≥ b ≥ 0 with c ≥ 1 there is a natural isomorphism RΓ(T_n(O_{F,p})(b), ord RΓ(N_n(O_{F,p}), π)) ≅ ord_b RΓ(Iw_p(b,c), π) in D(O/ϖ^m[T_n(F_p)_b]).

([ACC](#source-acc), §5.2.1, Lemma 5.2.9, pp. 997–998). *Needs:* `Layer 3`; `SR:SR.0:derived-extension`.

**Completed cohomology and weight control**

Keep the finite-level coefficient reduction, level transition maps and continuous torus actions throughout the inverse limits. Classical comparison and weight control use the lowest-weight projection after the contracting action has removed its kernel.

<a id="completed-arithmetic-cohomology"></a>

### 3.12 Completed arithmetic cohomology

Define `CompletedArithmeticCohomology`. For K ⊂ GL_n(A_F^∞) good there are functors Γ_{K^p,sm}: Mod(O/ϖ^m[G^∞]) → Mod_sm(O/ϖ^m[G(F_p^+)]) and Mod(O/ϖ^m[G^{p,∞}×Δ_p]) → Mod_sm(O/ϖ^m[Δ_p]), M ↦ Γ(K^p,M)^sm. For λ ∈ (Z^n_+)^{Hom(F,E)}, π(K^p,λ,m) := RΓ_{K^p,sm} RΓ(𝔛_G, V_λ/ϖ^m) ∈ D_sm(O/ϖ^m[Δ_p]). If K^S = ∏_{v∉S} GL_n(O_{F_v}) it carries T^S → End_{D_sm(O/ϖ^m[Δ_p])}(π(K^p,λ,m)) (5.2.11), and for K_p ⊂ Δ_p a canonical T^S-equivariant isomorphism RΓ(K_p, π(K^p,λ,m)) ≅ RΓ(X_K, V_λ/ϖ^m) in D(O/ϖ^m) (5.2.12). π(K^p,m) := RΓ_{K^p,sm} RΓ(𝔛_G, O/ϖ^m) ∈ D_sm(O/ϖ^m[G(F_p^+)]) carries T^S → End_{D_sm(O/ϖ^m[G(F_p^+)])}(π(K^p,m)) (5.2.13), recovering (5.2.11) for λ = 0; T^S(K^p,m) := image of (5.2.13).

([ACC](#source-acc), §5.2.10, (5.2.11)–(5.2.13), p. 998). *Needs:* `Layer 0`; `mathlib:DerivedCategory`; `SR:SR.0:derived-extension`.

Its interface includes:

- `CompletedArithmeticCohomology.finite_level`: RΓ(K_p,π(K^p,λ,m))≅RΓ(X_K,V_λ/varpi^m), Hecke-equivariantly.
- `CompletedArithmeticCohomology.hecke_action`: Unramified double cosets away from S give T^S → End of the smooth derived complex.
- `CompletedArithmeticCohomology.coefficient_reduction`: Derived coefficient reduction m′→m commutes with completed cohomology on the imported finite-projective models.
- `CompletedArithmeticCohomology.weight_zero`: At λ=0 this is the weight-zero completed complex with the full local group action.

**Checks.**

- `CompletedArithmeticCohomology.zero_coefficients` (degenerate): The zero coefficient local system gives the zero completed complex.
- `CompletedArithmeticCohomology.finite_level_identity` (compatibility): Taking the specified K_p derived invariants recovers the ALS finite-level complex, rather than its degree-zero invariants only.
- `CompletedArithmeticCohomology.higher_group_cohomology` (non-example): For the trivial F_p-module of a pro-p group Z_p, replacing derived invariants by fixed vectors loses the nonzero H¹.

<a id="completed-ordinary-cohomology"></a>

### 3.13 Completed ordinary cohomology

Define `CompletedOrdinaryCohomology`. π^ord(K^p,λ,m) := ord RΓ(N_n(O_{F,p}), π(K^p,λ,m)) ∈ D_sm(O/ϖ^m[T_n(F_p)]); for λ = 0 it is written π^ord(K^p,m).

([ACC](#source-acc), §5.2.10, p. 999). *Needs:* `Layer 3`.

Its interface includes:

- `CompletedOrdinaryCohomology.formula`: π^ord=ord RΓ(N_n(O),π), in the smooth torus derived category.
- `CompletedOrdinaryCohomology.torus_action`: The torus group acts after localization; Hecke away from S acts commuting with it.
- `CompletedOrdinaryCohomology.weight_zero`: At λ=0 the formula agrees with ordinary parts of weight-zero completed arithmetic cohomology.
- `CompletedOrdinaryCohomology.change_coefficients`: Derived reduction modulo a smaller coefficient power commutes under the tower’s finite-quotient hypotheses.

**Checks.**

- `CompletedOrdinaryCohomology.zero` (degenerate): Zero completed cohomology has zero ordinary part.
- `CompletedOrdinaryCohomology.invertible_contractor` (compatibility): If N={1} and all positive torus operators are invertible, ordinary localization recovers the original complex.
- `CompletedOrdinaryCohomology.nilpotent_contractor` (non-example): A nilpotent contracting action gives zero ordinary part, even with nonzero completed cohomology.

<a id="completed-classical-ordinary-control"></a>

### 3.14 Completed classical ordinary control

Prove `completed_classical_ordinary_control`. Let K ⊂ G^∞ be a good subgroup with K_v = Iw_v for each v | p and K^S = ∏_{v∉S} GL_n(O_{F_v}), and let c ≥ b ≥ 0 be integers with c ≥ 1. For every λ ∈ (Z^n_+)^{Hom(F,E)} there is a T^{S,ord}-equivariant isomorphism RΓ(T_n(O_{F,p})(b), π^ord(K^p,λ,m)) ≅ RΓ_{K(0,c)/K(b,c)}(X_{K(b,c)}, V_λ/ϖ^m)^ord in D(O/ϖ^m[K(0,c)/K(b,c)]) (K(0,c)/K(b,c) ≅ T_n(O_{F,p})_b).

([ACC](#source-acc), §5.2.10, Proposition 5.2.15, p. 999). *Needs:* `Layer 3`.

<a id="ordinary-level-control"></a>

### 3.15 Ordinary level control

Prove `ordinary_level_control`. Let K ⊂ GL_n(A_F^∞) be good with K_v = Iw_v for v | p and K^S = ∏_{v∉S} GL_n(O_{F_v}); let c ≥ b ≥ 0 with c ≥ 1 and λ ∈ (Z^n_+)^{Hom(F,E)}. The natural morphism RΓ_{K(0,max(1,b))/K(b,max(1,b))}(X_{K(b,max(1,b))}, V_λ/ϖ^m)^ord → RΓ_{K(0,c)/K(b,c)}(X_{K(b,c)}, V_λ/ϖ^m)^ord in D(O/ϖ^m[T_n(O_{F,p})_b]) is an isomorphism.

([ACC](#source-acc), §5.2.10, Corollary 5.2.16, p. 999). *Needs:* `Layer 3`.

<a id="completed-ordinary-weight-control"></a>

### 3.16 Completed ordinary weight control

Prove `completed_ordinary_weight_control`. Let K ⊂ GL_n(A_F^∞) be good with K^S = ∏_{v∉S} GL_n(O_{F,v}) and λ ∈ (Z^n_+)^{Hom(F,E)}. There are T^S-equivariant isomorphisms in D(O/ϖ^m[T_n(F_p)]): π^ord(K^p,λ,m) ≅ ord RΓ(N_n(O_{F,p}), RΓ_{K^p,sm} RΓ(𝔛_G, O(w_0^G λ)/ϖ^m)) ≅ π^ord(K^p,m) ⊗_O O(w_0^G λ).

([ACC](#source-acc), §5.2.10, Proposition 5.2.17, p. 1000). *Needs:* `Layer 3`.

<a id="finite-ordinary-weight-control"></a>

### 3.17 Finite ordinary weight control

Prove `finite_ordinary_weight_control`. Let K be good with K_v = Iw_v for v | p and K^S = ∏_{v∉S} GL_n(O_{F_v}); c ≥ b ≥ 0 with c ≥ 1. For λ, λ' ∈ (Z^n_+)^{Hom(F,E)} with O(w_0^G λ)/ϖ^m ≅ O(w_0^G λ')/ϖ^m as O/ϖ^m[T_n(O_{F,p})(b)]-modules there is a T^{S,ord}-equivariant isomorphism RΓ_{K(0,c)/K(b,c)}(X_{K(b,c)}, V_λ/ϖ^m)^ord ≅ RΓ_{K(0,c)/K(b,c)}(X_{K(b,c)}, V_{λ'}/ϖ^m)^ord ⊗_O O(w_0^G λ) ⊗_O O((w_0^G λ')^{-1}) in D(O/ϖ^m[T_n(F_p)_b]).

([ACC](#source-acc), §5.2.10, Corollary 5.2.18, p. 1000). *Needs:* `Layer 3`.

**The unitary tower and ordinary Satake operators**

The contracting element belongs to the full GL_{2n} factor. The unitary positive cone and the Levi cone therefore have distinct roles. The explicit formulas below determine the Satake map on every ordinary generator.

<a id="unitary-ordinary-tower"></a>

### 3.18 Unitary ordinary tower

Define `UnitaryOrdinaryTower`. Every p-adic place of F^+ splits in F; the fixed lifts ṽ ∈ S̃_p give ∏_{v̄∈S̄_p} ι_ṽ: G̃(F_p^+) ≅ ∏_{v̄∈S̄_p} GL_{2n}(F_ṽ), with T ⊂ B ⊂ G̃ corresponding to T_{2n} ⊂ B_{2n}. T̃^{S,ord} = T̃^S ⊗_O O⟦T(O_{F^+,p})⟧[{Ũ_{v,1},…,Ũ_{v,2n},Ũ_{v,2n}^{-1}}_{v∈S_p}] / (Ũ_{v^c,i} − Ũ_{v,2n−i} Ũ_{v,2n}^{-1})_{v∈S_p, i=1,…,2n}; Ũ_v = [Iw diag(ϖ^{2n−1},…,ϖ,1) Iw] (equivalently the product of the 2n−1 simple ordinary operators with the source normalization) and Ũ_p = ∏_{v∈S_p} Ũ_v. For K̃ good with K̃_v̄ = Ĩw_v̄ (v̄ ∈ S̄_p) and c ≥ b ≥ 0, c ≥ 1: K̃(b,c)_v̄ = K̃_v̄ (v̄ ∉ S̄_p), Ĩw_v̄(b,c) (v̄ ∈ S̄_p). For λ̃ ∈ (Z^{2n}_+)^{Hom(F^+,E)} there is a well-defined direct summand RΓ_{K̃(0,c)/K̃(b,c)}(X̃_{K̃(b,c)}, V_λ̃)^ord on which Ũ_p acts invertibly, and T̃(K̃(b,c),λ̃)^ord := T̃^{S,ord}(RΓ_{K̃(0,c)/K̃(b,c)}(X̃_{K̃(b,c)}, V_λ̃)^ord). Monoids: T(F_p^+)^+ ⊂ T(F_p^+) = elements contracting N(O_{F^+,p}); under T(F_p^+) = T_n(F_p), T(F_p^+)^+ ⊂ T_n(F_p)^+ (strictly for n ≥ 2); Ĩw_p(b,c) = ∏_{v̄} Ĩw_v̄(b,c); Δ̃_p = Ĩw_p(b,c) T(F_p^+)^+ Ĩw_p(b,c) with its ·_p-action on V_λ̃; T(O_{F^+,p})(b) = T_n(O_{F,p})(b); B(O_{F^+,p})(b) = preimage of T(O_{F^+,p})(b) in B(O_{F^+,p}); B(F_p^+)^+ = N(O_{F^+,p})·T(F_p^+)^+.

([ACC](#source-acc), §5.2.19, pp. 1000–1001). *Needs:* `Layer 0`; `Layer 3`; `PF:L0a`; `SR:SR.1`.

Its interface includes:

- `UnitaryOrdinaryTower.split_local_factor`: The chosen lift of v̄ identifies its factor with GL_{2n}(F_v).
- `UnitaryOrdinaryTower.conjugate_operator`: Ũ_{vᶜ,i}=Ũ_{v,2n−i}Ũ_{v,2n}^{−1}.
- `UnitaryOrdinaryTower.ordinary_operator`: The full contracting double coset is diag(varpi^{2n−1},…,varpi,1).
- `UnitaryOrdinaryTower.coefficient_control`: Boundary and interior tower maps commute with the finite-quotient ordinary projector.

**Checks.**

- `UnitaryOrdinaryTower.zero_b` (degenerate): The diamond quotient at b=0 is trivial.
- `UnitaryOrdinaryTower.rank_one_contraction` (computation): For n=1 the unitary rank-2 contracting exponents are (1,0), so the ordinary operator is not an empty product.
- `UnitaryOrdinaryTower.proper_cone` (non-example): For n≥2 the unitary positive monoid in the Levi torus is strictly smaller than the GL_n positive monoid; the Satake map cannot equate the cones.

<a id="ordinary-satake-homomorphism"></a>

### 3.19 Ordinary Satake homomorphism

Prove `ordinary_satake_homomorphism`. With the Siegel Levi G ≅ Res_{O_F/O_{F^+}} GL_n (so T ≅ Res_{O_F/O_{F^+}} T_n), the unnormalized Satake homomorphism S: T̃^S → T^S of (2.1.8) extends to S: T̃^{S,ord} → T^{S,ord} using O⟦T(O_{F^+,p})⟧ ≅ O⟦T_n(O_{F,p})⟧ and Ũ_{v,i} ↦ U_{v^c,n−i} U_{v^c,n}^{-1} (1 ≤ i ≤ n), Ũ_{v,i} ↦ U_{v^c,n}^{-1} U_{v,i−n} (n+1 ≤ i ≤ 2n); these are double coset operators of elements of T(F_p^+) and T_n(F_p) that match under T(F_p^+) = T_n(F_p). (The assignment respects the relations Ũ_{v^c,i} = Ũ_{v,2n−i}Ũ_{v,2n}^{-1}.)

([ACC](#source-acc), §5.2.19, p. 1001). *Needs:* `Layer 3`; `Layer 0`; `SR:SR.1`.

<a id="unitary-completed-boundary"></a>

### 3.20 Unitary completed boundary

Define `UnitaryCompletedBoundary`. Fix m ≥ 1; K̃ ⊂ G̃(A^∞_{F^+}) good with K̃_v̄ = Ĩw_v̄ (v̄ ∈ S̄_p), λ̃ ∈ (Z^{2n}_+)^{Hom(F^+,E)}. π̃(K̃^p,λ̃,m) := RΓ_{K̃^p,sm} RΓ(𝔛_G̃, V_λ̃/ϖ^m) ∈ D_sm(O/ϖ^m[Δ̃_p]) (5.2.20), with T̃^S → End (5.2.21) if K̃^S = G̃(Ô^S_{F^+}); π̃(K̃^p,m) := RΓ_{K̃^p,sm} RΓ(𝔛_G̃, O/ϖ^m) ∈ D_sm(O/ϖ^m[G̃(F_p^+)]) with (5.2.22); boundary versions π̃_∂(K̃^p,λ̃,m) := RΓ_{K̃^p,sm} RΓ(∂𝔛_G̃, V_λ̃/ϖ^m) (5.2.23)–(5.2.24) and π̃_∂(K̃^p,m) (5.2.25). For c ≥ b ≥ 0, c ≥ 1, canonical T̃^{S,ord}-equivariant isomorphisms RΓ(Ĩw_p(b,c), π̃(K̃^p,λ̃,m)) ≅ RΓ(X̃_{K̃(b,c)}, V_λ̃/ϖ^m) (5.2.26) and RΓ(Ĩw_p(b,c), π̃_∂(K̃^p,λ̃,m)) ≅ RΓ(∂X̃_{K̃(b,c)}, V_λ̃/ϖ^m) (5.2.27) in D(O/ϖ^m). Ordinary parts: π̃^ord(K̃^p,λ̃,m) = ord RΓ(N(O_{F^+,p}), π̃(K̃^p,λ̃,m)) and π̃^ord_∂(K̃^p,λ̃,m) = ord RΓ(N(O_{F^+,p}), π̃_∂(K̃^p,λ̃,m)) in D_sm(O/ϖ^m[T(F_p^+)]); λ̃ = 0 is omitted from the notation.

([ACC](#source-acc), §5.2.19, (5.2.20)–(5.2.27), p. 1002). *Needs:* `Layer 3`; `Layer 0`; `mathlib:DerivedCategory`.

Its interface includes:

- `UnitaryCompletedBoundary.interior`: The interior complex is RΓ_{K̃^p,sm}RΓ of the unitary arithmetic groupoid.
- `UnitaryCompletedBoundary.boundary`: Replace that groupoid by its Borel–Serre boundary to obtain π̃_∂.
- `UnitaryCompletedBoundary.finite_level`: Iwahori derived invariants recover the corresponding finite interior and boundary complexes.
- `UnitaryCompletedBoundary.triangle`: The imported compact-support/interior/boundary triangle carries the same commuting Hecke and ordinary actions.

**Checks.**

- `UnitaryCompletedBoundary.zero_coefficients` (degenerate): All three complexes vanish for the zero coefficient local system.
- `UnitaryCompletedBoundary.boundary_recovery` (compatibility): Finite Iwahori derived invariants of π̃_∂ give the ALS boundary complex.
- `UnitaryCompletedBoundary.compact_case` (degenerate): When the boundary is empty its completed complex is zero and compact-support equals interior cohomology.

<a id="unitary-ordinary-control"></a>

### 3.21 Unitary ordinary control

Prove `unitary_ordinary_control`. Let K̃ ⊂ G̃(A^∞_{F^+}) be good with K̃_v̄ = Ĩw_v̄ for v̄ ∈ S̄_p and K̃^S = G̃(Ô^S_{F^+}); c ≥ b ≥ 0 with c ≥ 1. For every λ̃ ∈ (Z^{2n}_+)^{Hom(F^+,E)} there are T̃^{S,ord}-equivariant isomorphisms RΓ(T(O_{F^+,p})(b), π̃^ord(K̃^p,λ̃,m)) ≅ RΓ(T(O_{F^+,p})(b), O(w_0^G̃ λ̃) ⊗_O π̃^ord(K̃^p,m)) ≅ RΓ_{K̃(0,c)/K̃(b,c)}(X̃_{K̃(b,c)}, V_λ̃/ϖ^m)^ord, and likewise RΓ(T(O_{F^+,p})(b), π̃^ord_∂(K̃^p,λ̃,m)) ≅ RΓ(T(O_{F^+,p})(b), O(w_0^G̃ λ̃) ⊗_O π̃^ord_∂(K̃^p,m)) ≅ RΓ_{K̃(0,c)/K̃(b,c)}(∂X̃_{K̃(b,c)}, V_λ̃/ϖ^m)^ord, in D_sm(O/ϖ^m[K̃(0,c)/K̃(b,c)]).

([ACC](#source-acc), §5.2.19, Proposition 5.2.28, p. 1003). *Needs:* `Layer 3`.

**Relative Bruhat cells and compact charts**

Filter parabolic induction by relative length, using compact charts for the local invariants. Absolute length records local field degrees and determines cohomological shifts; relative length determines the order of the filtration.

<a id="relative-bruhat-cells"></a>

### 3.22 Relative Bruhat cells

Define `RelativeBruhatCells`. For a p-adic place v̄ of F^+: ^rW_v̄ = W(G̃_{F^+_v̄}, T_{F^+_v̄}) (≅ S_{2n}), ^rW_{P,v̄} = W(G_{F^+_v̄}, T_{F^+_v̄}) (≅ S_n × S_n), ^rW^P_v̄ ⊂ ^rW_v̄ the representatives of ^rW_{P,v̄}\\^rW_v̄ attached to B_{F^+_v̄}; ^rW, ^rW_P, ^rW^P are the products over v̄ ∈ S̄_p; ^rW ⊂ W (absolute Weyl group), l_r = relative length, l = absolute length; w_0^P = w_0^G w_0^G̃, the longest element of W^P (equivalently of ^rW^P), has l(w_0^P) = [F^+:Q]n^2 and l_r(w_0^P) = |S̄_p|n^2; ρ = half-sum of (Res_{F^+/Q}B)_E-positive roots. ^rW is identified with permutation matrices in G̃(F_p^+) = ∏_{ṽ∈S̃_p} GL_{2n}(F_ṽ); G̃(F_p^+) = ⊔_{w∈^rW^P} P(F_p^+) w B(F_p^+) [BT65, Cor. 5.20]. For w ∈ ^rW^P: S_w = P(F_p^+) w N(F_p^+), S_w° = P(F_p^+) w N(O_{F^+,p}) ⊂ S_w; the closure of S_w is ⊔_{w'≤w} S_{w'} (Bruhat order on ^rW^P), and w' < w ⇒ l_r(w') < l_r(w). For i ≥ 0, G̃_{≥i} = ⊔_{w∈^rW^P, l_r(w)≥i} S_w is open in G̃(F_p^+), left P(F_p^+)- and right B(F_p^+)-invariant.

([ACC](#source-acc), §5.3, pp. 1003–1004). *Needs:* `Layer 1`; `Layer 3`; `Tau Ceti ReductiveGroups L7`.

Its interface includes:

- `RelativeBruhatCells.cell`: S_w=P(F_p⁺)wN(F_p⁺), and S_w° uses N(O_{F⁺,p}).
- `RelativeBruhatCells.lengths`: Relative length sums one inversion count per p-adic place; absolute length multiplies each by its local degree.
- `RelativeBruhatCells.open_union`: The union of cells of relative length ≥i is open.
- `RelativeBruhatCells.longest`: The longest shuffle has absolute length n²[F⁺:Q] and relative length n²#S̄_p.

**Checks.**

- `RelativeBruhatCells.rank_one` (computation): A single split GL₂ factor has relative cell lengths 0 and 1.
- `RelativeBruhatCells.identity_cell` (degenerate): The identity representative has both lengths zero.
- `RelativeBruhatCells.degree_two_place` (non-example): For one p-adic place of local degree 2 and n=1, longest relative length is 1 but absolute length is 2.

<a id="bruhat-cell-induction"></a>

### 3.23 Bruhat cell induction

Define `BruhatCellInduction`. Ind_{P(F_p^+)}^{G̃(F_p^+)}: Mod_sm(O/ϖ^m[P(F_p^+)]) → Mod_sm(O/ϖ^m[G̃(F_p^+)]) is exact and preserves injectives (right adjoint of the exact restriction). For i ≥ 0, I_{≥i}: Mod_sm(O/ϖ^m[P(F_p^+)]) → Mod_sm(O/ϖ^m[B(F_p^+)]), I_{≥i}(π) = {f: G̃_{≥i} → π locally constant, compactly supported modulo P(F_p^+), f(pg) = p f(g) for p ∈ P(F_p^+), g ∈ G̃_{≥i}} with B(F_p^+) acting by right translation; for w ∈ ^rW^P, I_w(π) is defined the same way with S_w in place of G̃_{≥i}; I_w°: Mod_sm(O/ϖ^m[P(F_p^+)]) → Mod_sm(O/ϖ^m[B(F_p^+)^+]) sends π to the subspace of I_w(π) of functions supported in S_w°.

([ACC](#source-acc), §5.3, pp. 1003–1004). *Needs:* `Layer 3`; `SR:SR.0:derived-extension`; `SR:SR.2`.

Its interface includes:

- `BruhatCellInduction.section`: Sections are locally constant P-equivariant functions with compact support modulo P on the specified cell or open union.
- `BruhatCellInduction.right_action`: B acts by right translation; on the compact chart use B⁺.
- `BruhatCellInduction.restriction`: Restriction to a length-i layer induces the maps in the exact Bruhat-filtration sequence.
- `BruhatCellInduction.compact_inclusion`: Extension by zero includes functions supported in S_w° into those on S_w.

**Checks.**

- `BruhatCellInduction.zero_module` (degenerate): Inducing the zero coefficient module gives zero in each chart.
- `BruhatCellInduction.outside_support` (computation): The extension-by-zero compact-chart section evaluates to zero outside S_w°.
- `BruhatCellInduction.equivariance` (non-example): A locally constant function violating f(pg)=p f(g) is not a section, even if its support is compact modulo P.

<a id="bruhat-filtration"></a>

### 3.24 Bruhat filtration

Prove `bruhat_filtration`. (1) I_{≥0} = Res^{G̃(F_p^+)}_{B(F_p^+)} ∘ Ind^{G̃(F_p^+)}_{P(F_p^+)}. (2) Each of I_{≥i}, I_w, I_w° is exact. (3) For every i ≥ 0 and π ∈ Mod_sm(O/ϖ^m[P(F_p^+)]) there is a functorial exact sequence 0 → I_{≥i+1}(π) → I_{≥i}(π) → ⊕_{w∈^rW^P, l_r(w)=i} I_w(π) → 0. Hence for π ∈ D_sm(O/ϖ^m[P(F_p^+)]) there is a functorial distinguished triangle I_{≥i+1}(π) → I_{≥i}(π) → ⊕_{l_r(w)=i} I_w(π) → I_{≥i+1}(π)[1] (5.3.2) in D_sm(O/ϖ^m[B(F_p^+)]).

([ACC](#source-acc), §5.3, Proposition 5.3.1 and (5.3.2), pp. 1004–1005). *Needs:* `Layer 3`.

<a id="bruhat-invariant-filtration"></a>

### 3.25 Bruhat invariant filtration

Prove `bruhat_invariant_filtration`. Let π ∈ D_sm(O/ϖ^m[P(F_p^+)]) be bounded below, b ≥ 0 and λ̃ ∈ (Z^{2n}_+)^{Hom(F^+,E)}. For every i ≥ 0 and j ∈ Z the sequence 0 → R^jΓ(B(O_{F^+,p})(b), O(w_0^G̃ λ̃) ⊗_O I_{≥i+1}(π)) → R^jΓ(B(O_{F^+,p})(b), O(w_0^G̃ λ̃) ⊗_O I_{≥i}(π)) → R^jΓ(B(O_{F^+,p})(b), ⊕_{w∈^rW^P, l_r(w)=i} O(w_0^G̃ λ̃) ⊗_O I_w(π)) → 0 in Mod(O/ϖ^m[T(F_p^+)^+_b]) associated with (5.3.2) is (short) exact.

([ACC](#source-acc), §5.3, Lemma 5.3.3, pp. 1005–1006). *Needs:* `Layer 3`.

<a id="bruhat-unipotent-acyclicity"></a>

### 3.26 Bruhat unipotent acyclicity

Prove `bruhat_unipotent_acyclicity`. For w ∈ ^rW^P, the functor I_w° takes injective objects of Mod_sm(O/ϖ^m[P(F_p^+)]) to Γ(N(O_{F^+,p}),−)-acyclic objects.

([ACC](#source-acc), §5.3, Lemma 5.3.4(1), p. 1006). *Needs:* `Layer 3`; `SR:SR.0:derived-extension`.

<a id="ordinary-compact-cell-comparison"></a>

### 3.27 Ordinary compact cell comparison

Prove `ordinary_compact_cell_comparison`. For w ∈ ^rW^P and π ∈ D_sm(O/ϖ^m[P(F_p^+)]) bounded below there is a natural isomorphism ord RΓ(N(O_{F^+,p}), I_w°(π)) ≅ ord RΓ(N(O_{F^+,p}), I_w(π)); equivalently ord RΓ(N(O_{F^+,p}), J_w(π)) = 0 for J_w = I_w/I_w°.

([ACC](#source-acc), §5.3, Lemma 5.3.4(2), pp. 1006–1007). *Needs:* `Layer 3`.

**Cell evaluation and orientation**

Evaluation at a Bruhat representative identifies the derived compact-unipotent invariants. The orientation character uses the p-adic absolute value as a rational scalar, and the conjugation twist is recorded separately. Together these give each ordinary graded piece.

<a id="bruhat-unipotent-invariants"></a>

### 3.28 Bruhat unipotent invariants

Define `BruhatUnipotentInvariants`. For w ∈ ^rW^P, N_w := P(F_p^+) ∩ w N(O_{F^+,p}) w^{-1}, a compact subgroup of P(F_p^+) containing N_n(O_{F,p}). Γ(N_w,−): Mod_sm(O/ϖ^m[P(F_p^+)]) → Mod_sm(O/ϖ^m[T(F_p^+)^+]), with t ∈ T(F_p^+)^+ acting by t·v = tr_{t^w N_w (t^w)^{-1} / N_w}(t^w v), where t^w = w t w^{-1} (this makes sense since t^w N_w (t^w)^{-1} = P(F_p^+) ∩ w t N(O_{F^+,p}) t^{-1} w^{-1} ⊂ N_w); moreover w T(F_p^+)^+ w^{-1} ⊂ T_n(F_p)^+.

([ACC](#source-acc), §5.3, p. 1007). *Needs:* `Layer 3`.

Its interface includes:

- `BruhatUnipotentInvariants.subgroup`: N_w=P∩wN(O)w^{-1}.
- `BruhatUnipotentInvariants.transfer`: For t the transfer uses t^w=wtw^{-1} and the finite-index subgroup t^wN_w(t^w)^{-1}.
- `BruhatUnipotentInvariants.evaluation`: Evaluation at w identifies the derived compact-cell N-invariants with RΓ(N_w,π).
- `BruhatUnipotentInvariants.map`: A smooth P-map induces the corresponding invariant and derived invariant maps.

**Checks.**

- `BruhatUnipotentInvariants.zero` (degenerate): The invariant functor sends the zero module to zero.
- `BruhatUnipotentInvariants.identity_w` (computation): For w=1 the subgroup is P∩N(O).
- `BruhatUnipotentInvariants.index_p_transfer` (non-example): On a trivial F_p-module a transfer over index p is zero, not the naive identity torus action.

<a id="bruhat-evaluation-comparison"></a>

### 3.29 Bruhat evaluation comparison

Prove `bruhat_evaluation_comparison`. For w ∈ ^rW^P and π ∈ D_sm(O/ϖ^m[P(F_p^+)]) bounded below there is a natural isomorphism RΓ(N(O_{F^+,p}), I_w°(π)) ≅ RΓ(N_w, π) (compatible with the T(F_p^+)^+-actions), induced by f ↦ f(w).

([ACC](#source-acc), §5.3, Lemma 5.3.5 and (5.3.6), pp. 1007–1008). *Needs:* `Layer 3`.

<a id="bruhat-orientation-character"></a>

### 3.30 Bruhat orientation character

Define `BruhatOrientationCharacter`. For w ∈ ^rW^P, χ_w: T(F_p^+) → O^× is χ_w(t) = N_{F_p^+/Q_p} det_{F_p^+}(Ad(t^w)|_{Lie U(F_p^+) ∩ w N(F_p^+) w^{-1}})^{-1} / |N_{F_p^+/Q_p} det_{F_p^+}(Ad(t^w)|_{Lie U(F_p^+) ∩ w N(F_p^+) w^{-1}})|_p. There is an isomorphism O(χ_w) ≅ O(−ρ + w^{-1} w_0^P(ρ)) ⊗_O O(α_w) of O[T(F_p^+)]-modules, where w_0^P = w_0^G w_0^G̃ is the longest element of ^rW^P and α_w: T(F_p^+) → O^× is trivial on T(O_{F^+,p}) and agrees with χ_w on every ι_v^{-1}(diag(ϖ_v^{a_1},…,ϖ_v^{a_{2n}})) (a_i ∈ Z). τ_w: Mod_sm(O/ϖ^m[T_n(F_p)]) → Mod_sm(O/ϖ^m[T_n(F_p)]) sends π to π with t acting as π(t^{w^{-1}}).

([ACC](#source-acc), §5.3, p. 1008). *Needs:* `Layer 3`.

Its interface includes:

- `BruhatOrientationCharacter.formula`: For a(t)=N det Ad(t^w) on the indicated unipotent Lie space, χ_w(t)=a(t)^{-1}/|a(t)|_p.
- `BruhatOrientationCharacter.unit_part`: Its algebraic character is −ρ+w^{-1}w₀^Pρ; α_w is the residual unramified character.
- `BruhatOrientationCharacter.uniformizer_part`: α_w is trivial on units and agrees with χ_w on chosen diagonal uniformizer powers.
- `BruhatOrientationCharacter.twist`: τ_w precomposes the torus action with t↦t^{w^{-1}}.

**Checks.**

- `BruhatOrientationCharacter.zero_lie` (degenerate): For a zero-dimensional unipotent Lie space, χ_w=1.
- `BruhatOrientationCharacter.one_unit` (computation): For a one-dimensional rational root with Ad scalar u∈Z_p×, χ_w(u)=u^{-1}.
- `BruhatOrientationCharacter.one_uniformizer` (computation): For the same rational root with scalar p, χ_w(p)=1 because the p-adic norm factor cancels p^{-1}.
- At p=2, the rational unit −1 gives χ_w(−1)=−1; reduction modulo 2 would lose this sign.

<a id="ordinary-unipotent-degree-shift"></a>

### 3.31 Ordinary unipotent degree shift

Prove `ordinary_unipotent_degree_shift`. Let w ∈ ^rW^P and π ∈ D_sm(O/ϖ^m[G(F_p^+)]) bounded below. There is a natural isomorphism in D_sm(O/ϖ^m[T_n(F_p)]) ord RΓ(N_w, Inf_{G(F_p^+)}^{P(F_p^+)} π) ≅ O/ϖ^m(χ_w) ⊗_{O/ϖ^m} τ_w^{-1} ord RΓ(N_n(O_{F,p}), π)[−[F^+:Q]n^2 + l(w)].

([ACC](#source-acc), §5.3, Lemma 5.3.7, pp. 1008–1010). *Needs:* `Layer 3`; `Layer 0`.

<a id="ordinary-bruhat-piece"></a>

### 3.32 Ordinary Bruhat piece

Prove `ordinary_bruhat_piece`. Let w ∈ ^rW^P and π ∈ D_sm(O/ϖ^m[G(F_p^+)]) bounded below. There is a natural isomorphism in D_sm(O/ϖ^m[T_n(F_p)]) ord RΓ(N(O_{F^+,p}), I_w(Inf_{G(F_p^+)}^{P(F_p^+)} π)) ≅ O/ϖ^m(χ_w) ⊗_{O/ϖ^m} τ_{w^{-1}} ord RΓ(N_n(O_{F,p}), π)[−[F^+:Q]n^2 + l(w)] (τ_{w^{-1}} = τ_w^{-1}).

([ACC](#source-acc), §5.3, Proposition 5.3.8, pp. 1010–1011). *Needs:* `Layer 3`.

**Boundary degree shifting with ordinary coefficients**

The completed boundary retract gives a map onto the image of the unitary Satake action. Weight choice in rank at least two then moves the needed GL_n degrees to unitary middle degree. All further determinant transfer must respect the inclusion of that image.

<a id="completed-boundary-induction-retract"></a>

### 3.33 Completed boundary induction retract

Prove `completed_boundary_induction_retract`. Let K̃ ⊂ G̃(A^∞_{F^+}) be a good subgroup decomposed with respect to P (K = K̃ ∩ G(A^∞_{F^+})); let 𝔪 ⊂ T^S be a non-Eisenstein maximal ideal and 𝔪̃ = S^\*(𝔪) ⊂ T̃^S. Then Ind_{P(F_p^+)}^{G̃(F_p^+)} (Inf_{G(F_p^+)}^{P(F_p^+)} π(K^p,m)_𝔪) is a T̃^S-equivariant direct summand (T̃^S acting through S) of π̃_∂(K̃^p,m)_{𝔪̃} in D_sm(O/ϖ^m[G̃(F_p^+)]).

([ACC](#source-acc), §5.4, Theorem 5.4.1, pp. 1011–1013). *Needs:* `Layer 3`; `Layer 0`; `SR:SR.2`.

<a id="ordinary-boundary-degree-shifting"></a>

### 3.34 Ordinary degree shifting

Prove `ordinary_boundary_degree_shifting`. Let K̃ be good, decomposed with respect to P, with K̃_v̄ = Ĩw_v̄ for v̄ ∈ S̄_p. Let λ̃ ∈ (Z^{2n}_+)^{Hom(F^+,E)}, w ∈ ^rW^P, λ_w = w(λ̃+ρ) − ρ ∈ (Z^n_+)^{Hom(F,E)}; 𝔪 ⊂ T^S non-Eisenstein, 𝔪̃ = S^\*(𝔪); c ≥ b ≥ 0 with c ≥ 1. Then for every j ∈ Z, S descends to a homomorphism, surjective onto the image of T̃^{S,ord} acting through S, T̃^{S,ord}(H^j(∂X̃_{K̃(b,c)}, V_λ̃)^ord_{𝔪̃}) → T^{S,ord}(O(α_{w_0^G w w_0^G̃}) ⊗_O τ^{-1}_{w_0^G w w_0^G̃} H^{j−l(w)}(X_{K(b,c)}, V_{λ_w})^ord_𝔪).

([ACC](#source-acc), §5.4, Theorem 5.4.3, pp. 1013–1015). *Needs:* `Layer 3`.

<a id="ordinary-ctg-weight-choice"></a>

### 3.35 Ordinary ctg weight choice

Prove `ordinary_ctg_weight_choice`. Notation: for λ ∈ (Z^n_+)^{Hom(F,E)} and a ∈ Z, λ(a)_{τ,i} = λ_{τ,i} + a. Assume n ≥ 2. Fix m ≥ 1. There is λ ∈ (Z^n_+)^{Hom(F,E)} such that (1) O(λ)/ϖ^m ≅ O/ϖ^m as T_n(F_p)-modules; (2) Σ_{i=1}^n (λ_{τ,i} + λ_{τc,i}) is independent of τ ∈ Hom(F,E); (3) for each i = 0,…,n^2 there are w_i = (w_{i,v̄})_{v̄∈S̄_p} ∈ ^rW^P, a_i ∈ (p−1)Z and a dominant λ̃_i ∈ (Z^{2n}_+)^{Hom(F^+,E)} with (a) λ̃_i CTG (Definition 4.3.5); (b) l_r(w_{i,v̄}) = n^2 − i for every v̄ ∈ S̄_p, hence l(w_i) = [F^+:Q](n^2 − i); (c) w_i(λ̃_i + ρ) − ρ = λ(a_i). Construction: M > 16n divisible by 8(p−1)·#(O/ϖ^m)^×; λ_τ = (−nM, −2nM, …, −n^2M) if τ ∈ Ĩ_p and (0, −M, …, (1−n)M) if τc ∈ Ĩ_p, so λ̃(a) = ((n−1)M − a, …, −a, −nM + a, …, −n^2M + a); for i > 0, w_{i,v̄} = σ_{X_i}, X_i = {x+1,…,x+r, x+r+2,…,x+n+1} with nx + n − r = n^2 − i, 1 ≤ r ≤ n; a_i = the unique integer in [(nx+2n−r−1)M/2, (nx+2n−r)M/2] congruent to M/8 mod M/2; λ̃_i = w_i^{-1}(λ̃(a_i) + ρ) − ρ. At i = 0 take the block-exchange shuffle (n+1, …, 2n, 1, …, n), with x = r = n. Verify dominance at the boundary between its two nonempty blocks.

([ACC](#source-acc), §5.4, Lemma 5.4.8 and (5.4.9)–(5.4.12), pp. 1015–1017). *Needs:* `Layer 1`; `Layer 3`.

<a id="ordinary-middle-degree-quotient"></a>

### 3.36 Ordinary middle degree quotient

Prove `ordinary_middle_degree_quotient`. Suppose [F^+:Q] > 1 and n ≥ 2, and fix m ≥ 1. There exist a dominant λ ∈ (Z^n_+)^{Hom(F,E)} on whose V_λ a finite-index subgroup of O_F^× acts trivially and, for each i = 0,…,n^2−1, a CTG dominant weight λ̃_i ∈ (Z^{2n}_+)^{Hom(F^+,E)}, an integer a_i divisible by p−1 and w_i ∈ ^rW^P, such that for every good K̃ ⊂ G̃(A^∞_{F^+}) decomposed with respect to P with K̃_v̄ = Ĩw_v̄ (v̄ ∈ S̄_p), all integers c ≥ b ≥ 0 with c ≥ 1, and every non-Eisenstein 𝔪 ⊂ T^S with ρ̄_{𝔪̃} decomposed generic (𝔪̃ = S^\*(𝔪)): (1) O(λ)/ϖ^m ≅ O/ϖ^m as O[T(F_p^+)]-modules; (2) for each i = 0,…,n^2−1, S descends to an algebra homomorphism T̃^{S,ord}(H^d(X̃_{K̃(b,c)}, V_{λ̃_i})^ord_{𝔪̃}) → T^{S,ord}(O(α_{w_i}) ⊗_O τ_{w_i}^{-1} H^{i[F^+:Q]}(X_{K(b,c)}, V_{λ(a_i)})^ord_𝔪), where d = [F^+:Q]n^2.

([ACC](#source-acc), §5.4, Proposition 5.4.13, pp. 1017–1018). *Needs:* `Layer 3`; `IG:IG.7`.

**The determinant torus and all degrees**

The determinant quotient has an archimedean component of dimension f−1. After a suitable neat-level shrinking, its cohomology separates from the determinant-one factor. The exterior grading supplies the remaining shifts with a Hecke-trivial torus action.

<a id="determinant-torus"></a>

### 3.37 Determinant torus

Define `DeterminantTorus`. For a good K ⊂ GL_n(A_F^∞), define A_K = F^×\\A_F^×/det(K) det(K_∞) R_{>0}, with identity component A_K°. Mapping to F^×\\A_F^×/det(K) F_∞^× expresses this quotient as a real torus extension of the ray class group. The torus has dimension [F⁺:Q]−1, and its cocharacters are the lattice F^×∩det(K), a torsion-free congruence subgroup of O_F^×. Set Γ_{g,K}=GL_n(F)∩gKg^{−1} for g∈GL_n(A_F^∞). The dimensions are dim X_K=d−1=[F⁺:Q]n²−1 and dim A_K=[F⁺:Q]−1.

([ACC](#source-acc), §5.4, pp. 1018, 1020). *Needs:* `Layer 0`.

Its interface includes:

- `DeterminantTorus.quotient`: The quotient is F×\\A_F×/(det K·det K∞·R_{>0}).
- `DeterminantTorus.component`: The identity component A_K° is the real torus of dimension [F⁺:Q]−1.
- `DeterminantTorus.determinant_map`: Determinant X_K→A_K induces the ray-class identification of connected components.
- `DeterminantTorus.level_change`: Inclusion K′⊂K induces the quotient map A_{K′}→A_K and commutes with determinant.

**Checks.**

- `DeterminantTorus.imaginary_quadratic` (computation): For [F⁺:Q]=1 the identity component has dimension zero.
- `DeterminantTorus.degree_two` (computation): For [F⁺:Q]=2 the identity component has dimension one.
- `DeterminantTorus.not_whole_class_group` (non-example): For [F⁺:Q]>1 the quotient has a positive-dimensional torus; replacing it by the finite ray-class group loses that component.

<a id="determinant-component-product"></a>

### 3.38 Determinant component product

Prove `determinant_component_product`. (2) det: X_K → A_K is continuous and induces a bijection on sets of connected components (equivalently det: G(F^+)\\G(A^∞_{F^+})/K → F^×\\(A_F^∞)^×/det(K) is bijective, by strong approximation for Res_{F/F^+} SL_n). (3) If g ∈ GL_n(A_F^∞) satisfies det(Γ_g) = det(F^× ∩ K) and Γ_g^1 = SL_n(F) ∩ Γ_g, then the product map Γ_g^1 × (F^× ∩ K) → Γ_g is a group isomorphism; writing X = X^1 × (∏_{v|∞} R_{>0})/R_{>0} with X^1 = SL_n(F_∞)/∏_{v|∞} SU(n), one gets Γ_g\\X = (Γ_g^1\\X^1) × (F^× ∩ K)\\(∏_{v|∞} R_{>0})/R_{>0}. (4) Under the same hypothesis det: F^× ∩ K → F^× ∩ det(K) is an isomorphism, the composite Γ_g\\X ↪ X_K → A_K is (x,z) ↦ det(g) z^n, and z ↦ det(g) z^n is an isomorphism from (F^× ∩ K)\\(∏_{v|∞} R_{>0})/R_{>0} onto the connected component A_K^{[det(g)]} of A_K containing [det(g)]. (K is neat.)

([ACC](#source-acc), §5.4, Lemma 5.4.14(2)–(4), pp. 1018–1019). *Needs:* `Layer 3`; `ALS:ALS.4`.

<a id="determinant-neat-level-shrinking"></a>

### 3.39 Determinant neat level shrinking

Prove `determinant_neat_level_shrinking`. Let K be a good subgroup of G(A^∞_{F^+}) = GL_n(A_F^∞) and T a finite set of finite places of F. There is a good normal subgroup K' ⊂ K with K'_T = K_T such that det(Γ_{g,K'}) = det(F^× ∩ K') for all g ∈ GL_n(A_F^∞). Construction: an ideal 𝔞 of O_F prime to T with ker(O_F^× → (O_F/𝔞)^×) torsion-free and contained in F^× ∩ K (Chevalley [Che51, Th. 1]); an ideal 𝔟 prime to 𝔞 and T with ker(O_F^× → (O_F/𝔞𝔟)^×) ⊂ (ker(O_F^× → (O_F/𝔞)^×))^n; K' = ker(O_F^× → (O_F/𝔞)^×)·K(𝔞𝔟), K(𝔞𝔟) = K ∩ (principal congruence subgroup of level 𝔞𝔟).

([ACC](#source-acc), §5.4, Lemma 5.4.15, pp. 1019–1020). *Needs:* `Layer 3`.

<a id="central-torus-cohomology-shifting"></a>

### 3.40 Central torus cohomology shifting

Prove `central_torus_cohomology_shifting`. Let K = K(b, c) ⊂ GL_n(A_F^∞) be good with K_v = Iw_v(b, c) for v | p and λ ∈ (Z^n_+)^{Hom(F,E)}, and suppose (1) det(Γ_g) = det(F^× ∩ K) for all g ∈ GL_n(A_F^∞) and (2) F^× ∩ K acts trivially on V_λ. Then R det_\*(V_λ) is constant on each connected component of A_K and R det_\*(V_λ) = ⊕_{i=0}^{dim X^1} R^i det_\*(V_λ)[−i]; there is a T^{S,ord}-equivariant isomorphism of graded O-modules ⊕_{i=0}^{dim X_K} H^i(X_K, V_λ) ≅ (⊕_{j=0}^{dim A_K°} H^j(A_K°, O)) ⊗_O (⊕_{k=0}^{dim X^1} H^0(A_K, R^k det_\*(V_λ))) (5.4.17), with trivial Hecke action on the first factor. Consequently the image of T^{S,ord} in End_O(⊕_{i=0}^{dim X_K} H^i(X_K, V_λ)) equals its image in End_O(⊕_{i=0}^{n^2−1} H^{i[F^+:Q]}(X_K, V_λ)).

([ACC](#source-acc), §5.4, Lemma 5.4.16 and (5.4.17), pp. 1020–1021). *Needs:* `Layer 3`; `ALS:ALS.4`.

<a id="all-degree-ordinary-characteristic-data"></a>

### 3.41 All degree ordinary characteristic data

Prove `all_degree_ordinary_characteristic_data`. Suppose [F^+:Q] > 1. Let K ⊂ GL_n(A_F^∞) be good with K_v = Iw_v for v ∈ S_p; c ≥ b ≥ 0 with c ≥ 1; m ≥ 1; 𝔪 ⊂ T^S non-Eisenstein, 𝔪̃ = S^\*(𝔪). Suppose (1) ρ̄_𝔪 is decomposed generic; (2) for every finite v ∉ S with residue characteristic l, either S contains no l-adic place of F and l is unramified in F, or l splits in some imaginary quadratic F_0 ⊂ F. Then there are λ ∈ (Z^n_+)^{Hom(F,E)} and N ≥ 1 depending only on [F^+:Q] and n such that (1) O(λ)/ϖ^m ≅ O/ϖ^m as O[T(F_p^+)]-modules; (2) for each i = 0,…,d−1 there are a nilpotent ideal J_i ⊂ T^{S,ord}(H^i(X_{K(b,c)}, V_λ)^ord_𝔪) with J_i^N = 0 and a continuous ρ_𝔪: G_{F,S} → GL_n(T^{S,ord}(H^i(X_{K(b,c)}, V_λ)^ord_𝔪)/J_i) with (a) det(X − ρ_𝔪(Frob_v)) = image of P_v(X) for v ∉ S; (b) for v | p and g ∈ G_{F_v}, det(X − ρ_𝔪(g)) = ∏_{j=1}^n (X − χ_{λ,v,j}(g)); (c) for v | p and g_1,…,g_n ∈ G_{F_v}, ρ_𝔪 maps (g_1 − χ_{λ,v,1}(g_1))⋯(g_n − χ_{λ,v,n}(g_n)) to 0 in M_n(…/J_i).

([ACC](#source-acc), §5.4, Proposition 5.4.18 and (5.4.19)–(5.4.23), pp. 1022–1026). *Needs:* `Layer 3`; `mathlib:Matrix.charpoly`; `CS:R24.5`.

<a id="ordinary-local-global"></a>

### 3.42 Ordinary local–global compatibility

Prove `ordinary_local_global`. Assume the §5 standing hypotheses (F contains an imaginary quadratic field in which p splits; ϖ_{v^c} = ϖ_v^c) and [F^+:Q] > 1. Let K ⊂ GL_n(A_F^∞) be a good subgroup with K_v = Iw_v for each v ∈ S_p (and K_v = GL_n(O_{F_v}) for v ∉ S), let c ≥ b ≥ 0 be integers with c ≥ 1, let λ ∈ (Z^n_+)^{Hom(F,E)} be a dominant weight, and let 𝔪 ⊂ T^S(K(b,c),λ)^ord be a non-Eisenstein maximal ideal. Suppose (1) for every finite place v ∉ S with residue characteristic l, either S contains no l-adic place of F and l is unramified in F, or there is an imaginary quadratic F_0 ⊂ F in which l splits; (2) ρ̄_𝔪 is decomposed generic. There is a bound N=N(n,[F⁺:Q])≥1 and an ideal J ⊂ T^S(K(b,c),λ)^ord_𝔪 with J^N = 0, and a continuous ρ_𝔪: G_{F,S} → GL_n(T^S(K(b,c),λ)^ord_𝔪/J) such that: (a) for every finite v ∉ S, det(X − ρ_𝔪(Frob_v)) is the image of P_v(X); (b) for every v ∈ S_p and g ∈ G_{F_v}, det(X − ρ_𝔪(g)) = ∏_{i=1}^n (X − χ_{λ,v,i}(g)); (c) for every v ∈ S_p and g_1,…,g_n ∈ G_{F_v}, (ρ_𝔪(g_1) − χ_{λ,v,1}(g_1))(ρ_𝔪(g_2) − χ_{λ,v,2}(g_2))⋯(ρ_𝔪(g_n) − χ_{λ,v,n}(g_n)) = 0.

([ACC](#source-acc), §5.1, Theorem 5.5.1, p. 991; restated and proved in §5.5, pp. 1026–1027). *Needs:* `Layer 3`; `mathlib:Matrix.charpoly`; `CS:R24.5`.

**Checks.**

- For n=2 the ordered identity is (ρ(g₁)−χ₁(g₁))(ρ(g₂)−χ₂(g₂))=0 for arbitrary distinct arguments g₁,g₂; a factorization only at one g is insufficient.

**Automorphic ordinarity and Galois flags**

Ordinarily automorphic means that an automorphic witness has a nonzero ordinary Hecke eigenspace. The ordered Galois flag is a subsequent consequence under its residual hypotheses. Construct the automorphic-witness predicate first; its `local_flag` API is supplied by the later flag theorem. The soluble-transport input in Layer 2 is an independent prerequisite for the final field reduction.

<a id="iota-ordinary-automorphic-representation"></a>

### 3.43 ι-ordinary automorphic representation

Define `IotaOrdinary`. Let F be a number field (in the applications imaginary CM or totally real), l a prime, ι: Q̄_l ≅ ℂ, and π a regular algebraic automorphic representation of GL_n(𝔸_F) of weight a ∈ (ℤⁿ₊)^{Hom(F,ℂ)}: π_∞ has the infinitesimal character of Ξ_a^∨ (AG2.0); for λ = ι^{-1}a ∈ (ℤⁿ₊)^{Hom(F,Q̄_l)} this is ACC’s weight ιλ, and HT_τ(r_{l,ι}(π)) = {λ_{τ,i}+n−i} when r_{l,ι}(π) exists. Fix a place v | l, a uniformizer ϖ_v and b ≥ 1, and let Iw(v^{b,b}) = Iw_v(b,b) ⊂ GL_n(O_{F_v}) be the subgroup of matrices that are upper triangular unipotent modulo ϖ_v^b (Layer 3/iwahori-level-tower). On (ι^{-1}π_v)^{Iw(v^{b,b})} the double-coset operators U^{(j)}_{ϖ_v} = [Iw(v^{b,b}) diag(ϖ_v·1_j, 1_{n−j}) Iw(v^{b,b})], j = 1,…,n, commute, and the weight-normalized operators are U^{(j)}_{λ,ϖ_v} = (∏_{τ:F_v↪Q̄_l} ∏_{i=1}^{j} τ(ϖ_v)^{−λ_{τ,n−i+1}}) U^{(j)}_{ϖ_v}. The ordinary part (ι^{-1}π_v)^{Iw(v^{b,b}),ord} is the maximal subspace stable under every U^{(j)}_{λ,ϖ_v} on which all their eigenvalues are l-adic units; it does not depend on ϖ_v. π is ι-ordinary at v if this ordinary part is nonzero for some b ≥ 1, and π is ι-ordinary if it is ι-ordinary at every v | l. The diagonal torus T_n(O_{F_v}) normalizes Iw(v^{b,b}) and its diamond operators ⟨u⟩ commute with the U^{(j)}_{λ,ϖ_v}; their common eigenvalues on a nonzero ordinary part are the data u^{(i)}_{λ,ϖ_v} and ⟨u⟩_{ι,i} of Geraghty’s Definition 5.5 used in ACC Corollary 5.5.2. No polarization is assumed; BLGGT uses this notion for polarized π.

([BLGGT](#source-blggt-published), §2.1, definition of ι-ordinary, p. 537 (PDF p. 37); [BLGGT (preprint)](#source-blggt), §2.1, definition of ι-ordinary, and PDF p. 33; [Qian](#source-qian), Definition 1.3, p. 1241 (NSF PDF p. 3), citing Geraghty Definition 5.3). *Needs:* `Layer 3`; `SR:SR.1`; `AG:AG2.0`.

Its interface includes:

- `IotaOrdinary.normalizedOperator`: U^{(j)}_{λ,ϖ_v} = (∏_{τ:F_v↪Q̄_l} ∏_{i=1}^{j} τ(ϖ_v)^{−λ_{τ,n−i+1}}) U^{(j)}_{ϖ_v} on (ι^{-1}π_v)^{Iw(v^{b,b})}; these operators commute.
- `IotaOrdinary.ordinaryPart`: The maximal subspace of (ι^{-1}π_v)^{Iw(v^{b,b})} stable under all U^{(j)}_{λ,ϖ_v} with only l-adic unit eigenvalues; it is the sum of the common generalized unit eigenspaces.
- `IotaOrdinary.uniformizer_independent`: For ϖ_v′=uϖ_v the normalized j-th operator changes by the weight unit ∏_τ∏_{i=1}^j τ(u)^{−λ_{τ,n−i+1}} times the commuting diamond operator ⟨diag(u·1_j,1_{n−j})⟩. The diamond order divides the exponent of (O_{F_v}/ϖ_v^b)^×; both factors have unit eigenvalues, so the ordinary part and ι-ordinarity are unchanged.
- `IotaOrdinary.level_independent`: π is ι-ordinary at v if and only if for some c ≥ b ≥ 0 with c ≥ 1 the Iw_v(b,c)-invariants contain a common eigenvector of all U^{(j)}_{λ,ϖ_v} with unit eigenvalues (the formulation cited from Geraghty’s Definition 5.3).
- `IotaOrdinary.iff_local`: ι-ordinarity at v depends only on ι, π_v and the weights λ_τ for the embeddings τ inducing v.
- `IotaOrdinary.twist`: For an algebraic Hecke character ψ of F, π is ι-ordinary if and only if π ⊗ (ψ∘det) is ι-ordinary (with its shifted weight).

**Checks.**

- `IotaOrdinary.gl_one` (computation): For n = 1 every algebraic Hecke character χ of weight λ is ι-ordinary at every v | l: on the one-dimensional space the normalized operator acts by ι^{-1}χ_v(ϖ_v)·∏_{τ:F_v↪Q̄_l} τ(ϖ_v)^{−λ_τ}, which is the value of the l-adic character r_{l,ι}(χ) at Art_{F_v}(ϖ_v), an l-adic unit.
- `IotaOrdinary.supersingular` (non-example): Let π be the cuspidal representation of GL_2(𝔸_Q) of weight (0,0) attached to an elliptic curve E/Q with good reduction at l ≥ 5 and a_l(E) = 0. The eigenvalues of U^{(1)}_{λ,l} on π_l^{Iw(l^{1,1})} are the two roots of X² − a_l(E)X + l = X² + l, of l-adic valuation 1/2, so π is not ι-ordinary at l.
- `IotaOrdinary.unnormalized_fails` (non-example): Omitting the weight normalization is wrong: for n = 1, F_v = Q_l and an algebraic Hecke character of weight λ_τ = 3 at the embedding inducing v, the unnormalized eigenvalue ι^{-1}χ_v(l) has l-adic valuation 3, although χ is ι-ordinary.
- `IotaOrdinary.finite_twist` (compatibility): For a finite-order Hecke character ψ, π ⊗ (ψ∘det) has the same weight and the normalized U^{(j)} eigenvalues of π multiplied by the roots of unity ψ_v(ϖ_v)^j on the same Iw(v^{b,b})-invariants once b exceeds the conductor of ψ_v; hence it is ι-ordinary exactly when π is.
- `IotaOrdinary.tame_uniformizer_change` (non-example): Take n=1, F=ℚ, l=5, b=1, weight zero and a quartic finite-order Hecke character of conductor 5. On its Iw(5^{1,1})-invariants, changing the uniformizer 5 to 10 multiplies the operator by the character value at 2, a primitive fourth root of unity. The diamond operator therefore has order 4, not dividing b=1; ordinarity is unchanged.

<a id="ordinarily-automorphic-representation"></a>

### 3.44 Ordinarily automorphic representation

Define `OrdinarilyAutomorphic`. Let E be an imaginary CM or totally real field, l a prime and ι: Q̄_l ≅ ℂ. For an attached representation r_{l,ι}(π) supplied with its attachment contract, a continuous representation r: G_E → GL_n(Q̄_l) is ι-ordinarily automorphic (of weight ιλ) if r ≅ r_{l,ι}(π) for a regular algebraic cuspidal automorphic representation π of GL_n(𝔸_E) (of weight ιλ) that is ι-ordinary at every place v | l (Layer 3/iota-ordinary-automorphic-representation). A residual representation r̄: G_E → GL_n(F̄_l) is ι-ordinarily automorphic if it has a lift r ≅ r_{l,ι}(π) with π regular algebraic cuspidal and ι-ordinary at every v | l. This is a condition on Hecke eigenvalues of π_v, not on r|G_{E_v}: ordinarity of r|G_{E_v} for v | l does not replace it (Qian Remark 4.4, whose deduction of automorphic ordinarity uses polarizability). The conclusion of ACC Theorem 6.1.2 is that ρ is ι-ordinarily automorphic of weight ιλ.

([Qian](#source-qian), Definition 1.3, p. 1241 (NSF PDF p. 3)). *Needs:* `Layer 3`; `AG:AG2.6`; `AG:AG2.7`; `AG:AG2.0`.

Its interface includes:

- `OrdinarilyAutomorphic.lift`: A witness consists of a regular algebraic cuspidal π, ι-ordinary at every v | l, and an isomorphism r ≅ r_{l,ι}(π).
- `OrdinarilyAutomorphic.residual`: If r is ι-ordinarily automorphic then so is its semisimplified reduction r̄, with the same witness π.
- `OrdinarilyAutomorphic.twist`: For χ=r_{l,ι}(ψ) supplied as the l-adic realization of an algebraic Hecke character ψ of E, with the attachment/tensor compatibility, r is ι-ordinarily automorphic if and only if r ⊗ χ is, with the shifted weight.
- `OrdinarilyAutomorphic.local_flag`: For E imaginary CM, if r is ι-ordinarily automorphic of weight ιλ and r̄ is irreducible and decomposed generic, then r|G_{E_v} is ordinary of weight λ for every v | l by Layer 3/ordinary-automorphic-galois-flag (ACC Corollary 5.5.2). This API item does not assert a totally real local–global theorem.

**Checks.**

- `OrdinarilyAutomorphic.gl_one` (computation): For n = 1, the l-adic realization r_{l,ι}(χ) of an algebraic Hecke character χ is ι-ordinarily automorphic, by IotaOrdinary.gl_one.
- `OrdinarilyAutomorphic.supersingular` (non-example): H¹_ét(E_{Q̄}, Q̄_l) for E/Q with good reduction at l ≥ 5 and a_l(E) = 0 is automorphic but not ι-ordinarily automorphic: by strong multiplicity one the only π with r_{l,ι}(π) ≅ H¹(E) is the one attached to E, which is not ι-ordinary at l.
- `OrdinarilyAutomorphic.ordinary_curve` (computation): For E/Q with good ordinary reduction at l ≥ 3 (a_l(E) an l-adic unit), H¹_ét(E_{Q̄}, Q̄_l) is ι-ordinarily automorphic: the Iwahori U_l-eigenvalues of the attached π_l are the two roots of X² − a_l(E)X + l, exactly one of which is a unit.

<a id="twisted-steinberg-ordinarity-criterion"></a>

### 3.45 Twisted steinberg ordinarity criterion

Prove `twisted_steinberg_ordinarity_criterion`. Use geometric Artin reciprocity and HT(ε_l) = {−1}. Let F be a CM field, l a prime, ι: Q̄_l ≅ ℂ, v | l a place of F with uniformizer ϖ_v, and π a regular algebraic cuspidal automorphic representation of GL_n(𝔸_F) of weight ιλ in the ACC convention with λ_{τ,i} = c_τ for all i = 1,…,n and all τ: F_v ↪ Q̄_l (so HT_τ(r_{l,ι}(π)) = {c_τ, c_τ+1, …, c_τ+n−1}). Suppose π_v ≅ Sp_n(ψ_v|·|_v^{(1−n)/2}) for an unramified character ψ_v of F_v^×, and val_l(ι^{-1}ψ_v(det α^{(j)}_{ϖ_v})) = val_l(∏_{τ:F_v↪Q̄_l} τ(ϖ_v)^{+jc_τ}) for every 0 ≤ j ≤ n, where α^{(j)}_{ϖ_v} = diag(ϖ_v·1_j, 1_{n−j}). Then π is ι-ordinary at v. Since det α^{(j)}_{ϖ_v} = ϖ_v^j, the condition for j = n implies it for every j. Geraghty’s Lemma 5.6 is the weight-zero case.

([Qian](#source-qian), Proof of Lemma 4.3, second paragraph, p. 1273 (NSF PDF p. 35), citing Geraghty Lemmas 5.2 and 5.6). *Needs:* `Layer 3`; `SR:SR.1`.

**Checks.**

- For n = 1 the criterion is IotaOrdinary.gl_one: an unramified character ψ_v with the displayed valuation is ι-ordinary.
- With c_τ = 0 the hypothesis is val_l(ι^{-1}ψ_v(ϖ_v)^n) = 0, which the central-character identity gives automatically (r_{l,ι}(φ_π) then has Hodge–Tate weight 0); this recovers the weight-zero Steinberg remark of BLGGT §2.1 (Geraghty Lemma 5.1.5). Complex unitarity of ψ_v alone does not give the l-adic condition.

<a id="iota-ordinary-soluble-base-change"></a>

### 3.46 Iota ordinary soluble base change

Prove `iota_ordinary_soluble_base_change`. Let F be imaginary CM or totally real, E/F a finite soluble Galois extension with E imaginary CM or totally real, ι: Q̄_p ≅ ℂ, and π, π_E regular algebraic cuspidal automorphic representations of GL_n(𝔸_F), GL_n(𝔸_E) of weights ιλ and ιλ_E (λ_{E,τ} = λ_{τ|F}) with rec_{E_w}(π_{E,w}) ≅ rec_{F_v}(π_v)|_{W_{E_w}} for every finite place w | v (as produced by Layer 2/soluble-base-change-and-descent). Then π_E is ι-ordinary at w | p if π is ι-ordinary at v = w|_F, and π is ι-ordinary at v if π_E is ι-ordinary at the places w | v. If every p-adic place of F splits completely in E then π_{E,w} ≅ π_v and λ_E at w is λ at v, so the equivalence at w is immediate from IotaOrdinary.iff_local; this is the case of ACC’s proof of Corollary 5.5.2.

([ACC](#source-acc), §6.6.10, proof of Theorem 6.1.2, p. 1084; proof of Corollary 5.5.2, p. 1028). *Needs:* `Layer 3`; `Layer 2`.

**Checks.**

- If E/F is split at every p-adic place, ι-ordinarity of π at v and of π_E at each w | v coincide.
- No ι-ordinarity is asserted for a base change that is not cuspidal; irreducibility of r_ι(π)|G_E is a hypothesis of the supplier theorem.

<a id="ordinary-automorphic-galois-flag"></a>

### 3.47 Ordinary Galois filtration

Prove `ordinary_automorphic_galois_flag`. Let F be an imaginary CM field (the §5 standing hypotheses are dropped), ι: Q̄_p ≅ C, and π a cuspidal automorphic representation of GL_n(A_F), regular algebraic of weight ιλ with λ ∈ (Z^n_+)^{Hom(F,Q̄_p)}. Suppose (1) π is ι-ordinary at every v ∈ S_p (Layer 3/iota-ordinary-automorphic-representation; [Ger19, Def. 5.3]); (2) r̄_ι(π) is decomposed generic and irreducible. Then for every v ∈ S_p, r_ι(π)|_{G_{F_v}} is ordinary of weight λ ([Ger19, §5.2]): r_ι(π)|_{G_{F_v}} is conjugate to an upper-triangular representation with diagonal characters ψ_{v,1},…,ψ_{v,n}, where ψ_{v,i}(Art_{F_v}(u)) = ε^{1−i}(Art_{F_v}(u)) ∏_{τ∈Hom_{Q_p}(F_v,Q̄_p)} τ(u)^{−(w_0^G λ)_{τ,i}} ⟨u⟩_{ι,i} (u ∈ O_{F_v}^×) and ψ_{v,i}(Art_{F_v}(ϖ_v)) = ε^{1−i}(Art_{F_v}(ϖ_v)) u^{(i)}_{λ,ϖ_v}/u^{(i−1)}_{λ,ϖ_v}, with ⟨u⟩_{ι,i}, u^{(i)}_{λ,ϖ_v} the Hecke eigenvalues on the ordinary part (ι^{-1}π_v)^ord of IotaOrdinary.ordinaryPart ([Ger19, Def. 5.5]).

([ACC](#source-acc), §5.5, Corollary 5.5.2, p. 1028). *Needs:* `Layer 3`; `Layer 2`; `mathlib:Matrix.charpoly`; `LGD:L7`.

### Examples

The positive rank-two row (1,0) contracts upper unipotents; (0,1) fails. A degree-two local factor has longest relative length 1 and absolute length 2 at n=1. Transfer over index p on trivial F_p coefficients is zero. The orientation scalar p has character value 1.

### Dependencies

Layers 0–2; SR.0/SR.1/SR.2/SR.3, PF:L0a, ALS.4/ALS.5, AG2.0/AG2.2/AG2.3/AG2.5/AG2.6/AG2.7 and IHG.0/IHG.1. Exact arithmetic comparisons and polynomial-law transfer have the supplier contracts above.

## Layer 4: Arithmetic deformation and support inputs

**Deformation actions on arithmetic Hecke algebras**

Attach the universal representations only after verifying their local deformation conditions. Both maps land in Hecke algebras modulo a uniformly nilpotent ideal. The ordinary complex retains the full torus algebra and its weight normalization.

<a id="local-condition-mod-varpi-comparison"></a>

### 4.1 Local-condition comparison

Prove `local_condition_mod_varpi_comparison`. Under either full good-level hypothesis profile, choose pairwise distinct characters χ_{v,i}:k(v)×→O× at every v∈R, all congruent to 1 modulo varpi. The untwisted and χ-twisted coefficient complexes have a Hecke-equivariant derived isomorphism modulo varpi, and their finite local/global deformation rings reduce to the same deformation problem. At p the FL condition or the ordinary flag/determinant condition is identical on the two sides; away from p the R08.2 unipotent/inertial-type reductions supply the comparison. Framing conventions and coefficient maps are the same on both sides. The global determinant varies, as in the source deformation problems; the ordinary local determinant condition is retained. A separate globally fixed-determinant variant requires its own presentation and dimension counts.

([ACC](#source-acc), §6.5.1, pp. 1062, 1068–1069 (variable-determinant Sχ and reduced coefficient comparison); §6.6.1, equation (6.6.4), p. 1077). *Needs:* `Layer 0`; `LGD:R08.2`; `LGD:L8`; `LGD:L7`; `GGD:G8`.

<a id="fontaine-laffaille-deformation-hecke-map"></a>

### 4.2 Fontaine–Laffaille deformation action

Prove `fontaine_laffaille_deformation_hecke_map`. Under §6.5.1, for each χ as above there are an integer δ ≥ 1 depending only on n and [F:ℚ], an ideal J ⊂ T^S(RΓ(X_K, 𝒱_λ(χ^{-1})))_𝔪 with J^δ = 0, and a continuous surjection f_{𝒮_χ}: R_{𝒮_χ} → T^S(RΓ(X_K, 𝒱_λ(χ^{-1})))_𝔪/J such that for every finite place v ∉ S the characteristic polynomial of f_{𝒮_χ} ∘ ρ_{𝒮_χ}(Frob_v) is the image of P_v(X). (Proof: the representation ρ_𝔪: G_{F,S∪S^c} → GL_n(T^S(…)_𝔪/J) of Theorem 2.3.7, conjugated so that ρ_𝔪 mod 𝔪 = ρ̄_𝔪; Theorem 4.5.1 gives the Fontaine–Laffaille condition at v | p; Theorem 3.1.1, applied with its S equal to S ∪ S^c and its R equal to S − S_p, gives the inertial characteristic-polynomial condition at v ∈ R and unramifiedness with the right Frobenius polynomial at v ∈ S^c − S.)

([ACC](#source-acc), §6.5.1, Proposition 6.5.3, p. 1063). *Needs:* `Layer 1`; `Layer 4`; `AG:AG2.5`; `GGD:G8`.

<a id="ordinary-hida-complex"></a>

### 4.3 Ordinary Hida complex

Define `OrdinaryHidaComplex`. For c ≥ 1, Λ_{1,c} = 𝒪[∏_{v∈S_p} ker(T_n(𝒪_{F_v}/ϖ_v^c) → T_n(𝒪_{F_v}/ϖ_v))], a quotient of Λ_1, and A_1(μ,χ,c) = RHom_{Λ_{1,c}}(RΓ(X_{K(c,c)}, 𝒱_μ(χ^{-1}))^{ord}, Λ_{1,c})[−d], a perfect complex in D(Λ_{1,c}) on which T^{S,ord} acts by transpose. (6.6.3): for c′ ≥ c there are T^{S,ord}-equivariant isomorphisms A_1(μ,χ,c′) ⊗^L_{Λ_{1,c′}} Λ_{1,c} ≅ A_1(μ,χ,c) in D(Λ_{1,c}) (Corollary 5.2.16). (6.6.4): canonical T^{S,ord}-equivariant isomorphisms A_1(μ,χ,c) ⊗^L_{Λ_{1,c}} Λ_{1,c}/ϖ ≅ A_1(μ,1,c) ⊗^L_{Λ_{1,c}} Λ_{1,c}/ϖ. By [KT17, Lem. 2.13] there is a perfect A_1(μ,χ) ∈ D(Λ_1) with T^{S,ord}-action and equivariant isomorphisms A_1(μ,χ) ⊗^L_{Λ_1} Λ_{1,c} ≅ A_1(μ,χ,c) (all c ≥ 1) and A_1(μ,χ) ⊗^L_{Λ_1} Λ_1/ϖ ≅ A_1(μ,1) ⊗^L_{Λ_1} Λ_1/ϖ, compatible with (6.6.3) and with (6.6.4) for varying χ; A(μ,χ) = A_1(μ,χ) ⊗^L_{Λ_1} Λ ∈ D(Λ).

([ACC](#source-acc), §6.6.1, (6.6.3), (6.6.4), pp. 1076–1077). *Needs:* `Layer 3`; `mathlib:DerivedCategory`; `PF:L0a`; `DP:P7`; `DP:P8`.

Its interface includes:

- `OrdinaryHidaComplex.finite`: A₁(μ,χ,c)=RHom_{Λ₁,c}(RΓ(X_{K(c,c)},V_μ(χ^{-1}))^ord,Λ₁,c)[−d].
- `OrdinaryHidaComplex.transition`: Derived tensor from Λ₁,c′ to Λ₁,c gives the finite c complex for c′≥c.
- `OrdinaryHidaComplex.mod_varpi`: For χ congruent to 1 modulo varpi, the χ and 1 complexes agree after derived reduction.
- `OrdinaryHidaComplex.perfect_limit`: The P7 reconstruction supplies a perfect Λ₁-complex with all these compatible finite specializations.

**Checks.**

- `OrdinaryHidaComplex.zero` (degenerate): The dual of the zero ordinary complex is zero.
- `OrdinaryHidaComplex.single_free_term` (computation): For the free module Λ₁,c in degree 0 the dual shifted by −d has its sole cohomology in degree d.
- `OrdinaryHidaComplex.derived_reduction` (compatibility): For a perfect finite complex, specializing the dual equals the dual of the specialized complex; underived reduction of cohomology is not substituted.

<a id="weight-independent-hida-twist"></a>

### 4.4 Weight independent Hida twist

Define `WeightIndependentHidaTwist`. ν ∈ X^\*((Res_{F/ℚ} T)_E) = (ℤ^n)^{Hom(F,E)} is ν_τ = (0, 1, …, n−1) for all τ. B_1(μ,χ) = A_1(μ,χ) ⊗_𝒪 𝒪(ν + w_0^G μ)^{-1}, where 𝒪(ν + w_0^G μ)^{-1} is the 𝒪[T_n(F_p)]-module of §5.2.1 (the action of T_n(𝒪_{F,p}) extending uniquely to 𝒪⟦T_n(𝒪_{F,p})⟧); it is a perfect complex in D(Λ_1) with T^{S,ord}-action. B(μ,χ) = B_1(μ,χ) ⊗^L_{Λ_1} Λ.

([ACC](#source-acc), §6.6.1, p. 1077). *Needs:* `Layer 4`; `Layer 3`.

Its interface includes:

- `WeightIndependentHidaTwist.nu`: ν_{τ,i}=i−1 for one-based i.
- `WeightIndependentHidaTwist.formula`: B₁=A₁⊗O(ν+w₀μ)^{-1}, and B=B₁⊗^L_{Λ₁}Λ.
- `WeightIndependentHidaTwist.hecke`: Transpose Hecke away from S is preserved under the tensor twist.
- `WeightIndependentHidaTwist.weight_compare`: For all dominant μ,μ′ the complexes B₁(μ,χ),B₁(μ′,χ) are equivariantly isomorphic by Lemma 6.6.5.

**Checks.**

- `WeightIndependentHidaTwist.rank_one_zero` (degenerate): For n=1, μ=0, ν=0 so the twist is trivial.
- `WeightIndependentHidaTwist.rank_two_zero` (computation): For n=2, μ=0, ν=(0,1) and the twist is O(0,1)^{-1}, not the trivial character.
- `WeightIndependentHidaTwist.rank_two_weight` (computation): For μ=(2,0), ν+w₀μ=(0,3), fixing both the reversal and ν shift.

<a id="hida-weight-independence"></a>

### 4.5 Hida weight independence

Prove `hida_weight_independence`. For every μ′ ∈ (ℤ^n_+)^{Hom(F,E)} there is a T^{S,ord}-equivariant isomorphism B_1(μ,χ) ≅ B_1(μ′,χ) in D(Λ_1). (Proof: Proposition 5.2.17 and [KT17, Lem. 2.13].)

([ACC](#source-acc), §6.6.1, Lemma 6.6.5, p. 1077). *Needs:* `Layer 5`; `Layer 3`.

<a id="hida-weight-specialization"></a>

### 4.6 Hida weight specialization

Prove `hida_weight_specialization`. For μ′ ∈ (ℤ^n_+)^{Hom(F,E)} there is a T^{S,ord}-equivariant isomorphism in D(𝒪): B_1(μ,χ) ⊗^L_{Λ_1} 𝒪(ν + w_0^G μ′)^{-1} ≅ A_1(μ′,χ,1) ⊗_𝒪 𝒪(ν + w_0^G μ′)^{-1}. (By Lemma 6.6.5 reduce to μ′ = μ, where the left side is A_1(μ,χ) ⊗^L_{Λ_1} 𝒪 ⊗_𝒪 𝒪(ν + w_0^G μ)^{-1}.)

([ACC](#source-acc), §6.6.1, Corollary 6.6.6, pp. 1077–1078). *Needs:* `Layer 5`.

**Ordinary diamonds and patching**

The ordinary auxiliary complex carries both its finite torus algebra and its diamond action. Pass to the c-limit with derived reductions intact, and verify diamond linearity before applying the abstract patching construction.

<a id="ordinary-deformation-hecke-map"></a>

### 4.7 Ordinary deformation action

Prove `ordinary_deformation_hecke_map`. Let T^{S,Λ_1} = T^S ⊗_𝒪 Λ_1 ⊂ T^{S,ord}. There are δ ≥ 1 depending only on n and [F:ℚ], an ideal J ⊂ T^{S,Λ_1}(A(μ,χ)_𝔪 ⊗_𝒪 𝒪(ν + w_0^G μ)^{-1}) with J^δ = 0, and a continuous surjective Λ-algebra homomorphism f_{𝒮_χ}: R_{𝒮_χ} → T^{S,Λ_1}(A(μ,χ)_𝔪 ⊗_𝒪 𝒪(ν + w_0^G μ)^{-1})/J such that for every finite v ∉ S the characteristic polynomial of f_{𝒮_χ} ∘ ρ_{𝒮_χ}(Frob_v) is the image of P_v(X). (Proof: build compatible maps R_{𝒮_χ} → T^{S,ord}(RΓ(X_{K(c,c)}, 𝒱_μ(χ^{-1}))^{ord})_𝔪/J_c as in Prop. 6.5.3 with Theorem 5.5.1 in place of Theorem 4.5.1 (using the description of 𝒟^{det,ord} in §6.2.6); Carayol's lemma [CHT08, Lem. 2.1.10] puts the image in a nilpotent quotient of T^{S,Λ_1}(…); the Hecke algebras agree by transpose and twist; pass to the limit in c as in the proof of Theorem 4.5.1.)

([ACC](#source-acc), §6.6.1, Proposition 6.6.7, p. 1078). *Needs:* `Layer 3`; `Layer 4`; `AG:AG2.5`; `LGD:L8`; `GGD:G8`.

**Components and the derived support interface**

Compare the untwisted and character-twisted local conditions modulo the coefficient uniformizer, then globalize using the same framings and variable determinant. The dimension and component calculation is the arithmetic input to the abstract support theorem. Its conclusion is conditional on the actual perfect pair supplied in Layer 5.

<a id="arithmetic-component-dimension-input"></a>

### 4.8 Arithmetic component comparison

Prove `arithmetic_component_dimension_input`. For the FL or ordinary framed global problem and its χ-twist, tensor the local rings with the common framing/patching power-series variables. With q Taylor–Wiles places and g=qn−n²[F⁺:Q]≥0, the FL rings satisfy dim R∞=dim S∞−ℓ₀ and dim(R∞/varpi)=dim R∞−1, ℓ₀=n[F⁺:Q]−1. The maximal-dimensional mod-varpi generic points lift uniquely to maximal-dimensional characteristic-zero components as required by P9; the χ-twisted generic lifts are unique, and lower components satisfy the strict dimension bound in Assumption 6.3.6. In the ordinary case the same P9 comparisons apply after choosing the specified minimal prime of the torus Iwasawa algebra and using the L7 trivial-residual degree bound; this is not a classification of every ordinary component.

([ACC](#source-acc), Proof of Theorem 6.5.4 pp. 1069–1070; proof of Theorem 6.6.2 pp. 1080–1081). *Needs:* `Layer 4`; `LGD:R08.2`; `GGD:G7`; `LGD:L7`; `LGD:L8`; `GGD:G8`; `DP:P9`.

<a id="arithmetic-derived-support-contract"></a>

### 4.9 Derived Ihara avoidance

Prove `arithmetic_derived_support_contract`. Given the imported P8 patched perfect complexes C∞,C∞′ for these two arithmetic towers, their common mod-varpi Hecke image and quotient deformation actions, and rational amplitude [q_patch,q_patch+ℓ₀] at every characteristic-zero augmentation point, the component input implies P9 Assumption 6.3.6. Consequently support of H\*(C∞) contains each maximal-dimensional component, and an augmentation characteristic-zero point x is in the support of H\*(C∞⊗^L_{S∞}S∞/(x∩S∞))[1/p] whenever its generic component is one of those components. This statement is conditional on the patching input; Layer 5 constructs and verifies that input. The conclusion is reduced support, not an integral R=T isomorphism.

([ACC](#source-acc), §6.3.5, Proposition 6.3.8 and Corollary 6.3.9, pp. 1052–1053). *Needs:* `Layer 4`; `mathlib:Module.support`; `DP:R03.6`; `DP:P9`.

### Examples

The zero ordinary complex and the unramified trace-twist identity test the coefficient and Hecke actions. A zero localization cannot certify support: the lifting point must lie on the specified maximal-dimensional component and rational cohomology must be nonzero.

### Dependencies

Layers 1 and 3; LGD:L7/L8/R08.2, GGD:G7/G8 and DP:P7/P9. Support is conditional on the supplied pair; Layer 5 verifies its arithmetic hypotheses.

## Layer 5: Arithmetic patching and automorphy lifting

**Taylor–Wiles levels and selected roots**

Auxiliary sets and deformation presentations come from their global owner. This layer constructs the arithmetic levels, the ordered-root localization and the trace comparison. At every old place the original level is retained.

<a id="taylor-wiles-arithmetic-levels"></a>

### 5.1 Taylor–Wiles arithmetic levels

Define `TaylorWilesArithmeticLevels`. Let (Q, (α_{v,1},…,α_{v,n})_{v∈Q}) be a Taylor–Wiles datum for 𝒮_1 (§6.2.28) such that for each v ∈ Q the residue characteristic l_v splits in an imaginary quadratic subfield of F. It is a Taylor–Wiles datum for every 𝒮_χ, and R_{𝒮_{χ,Q}} is an 𝒪[Δ_Q]-algebra, Δ_Q = ∏_{v∈Q} Δ_v = ∏_{v∈Q} k(v)^×(p)^n. Good subgroups K_1(Q) ⊂ K_0(Q) ⊂ K: K_1(Q)_v = K_0(Q)_v = K_v for v ∉ Q; for v ∈ Q, K_0(Q)_v = Iw_v and K_1(Q)_v is the maximal pro-prime-to-p subgroup of Iw_v. Then K_0(Q)/K_1(Q) ≅ Δ_Q, and (6.5.6) there are surjective T^{S∪Q}-algebra maps _{K_0(Q)/K_1(Q)}T^{S∪Q}(K_0(Q)/K_1(Q), 𝒱) → T^{S∪Q}(K_0(Q), 𝒱) → T^{S∪Q}(K, 𝒱) (𝒱 = 𝒱_λ(χ^{-1})): the first from K_0(Q)-invariants (𝒪[Δ_Q] acting trivially on invariants), the second t ↦ [K:K_0(Q)]^{-1} π_{Q,\*} ∘ t ∘ π_Q^\* for the projection π_Q: X_{K_0(Q)} → X_K, where [K:K_0(Q)] ≡ (n!)^{|Q|} mod p is a unit since p > n. T^{S∪Q}_Q(K_0(Q), 𝒱) ⊂ End_{D(𝒪)}(RΓ(X_{K_0(Q)}, 𝒱)) is the commutative T^{S∪Q}(K_0(Q),𝒱)-subalgebra generated by the U_{v,i} (v ∈ Q, 1 ≤ i ≤ n), equivalently the image of T^{S∪Q}_Q (§3.1); T^{S∪Q}_Q(K_0(Q)/K_1(Q), 𝒱) ⊂ End_{D(𝒪[Δ_Q])}(RΓ_{K_0(Q)/K_1(Q)}(X_{K_1(Q)}, 𝒱)) likewise (an 𝒪[Δ_Q]-algebra). (6.5.7): the first map of (6.5.6) extends to a surjection T^{S∪Q}_Q(K_0(Q)/K_1(Q), 𝒱) → T^{S∪Q}_Q(K_0(Q), 𝒱) sending U_{v,i} to U_{v,i}.

([ACC](#source-acc), §6.5.1, paragraphs after Corollary 6.5.5, (6.5.6), (6.5.7), pp. 1064–1065). *Needs:* `Layer 0`; `GGD:G7`.

Its interface includes:

- `TaylorWilesArithmeticLevels.away`: Both auxiliary levels equal K_v at every v∉Q, including v∈S.
- `TaylorWilesArithmeticLevels.at_auxiliary`: At v∈Q use Iw_v and its maximal pro-prime-to-p subgroup.
- `TaylorWilesArithmeticLevels.diamond_quotient`: The quotient K₀(Q)/K₁(Q) is the imported Δ_Q.
- `TaylorWilesArithmeticLevels.trace_scalar`: Pullback followed by trace has scalar [K:K₀(Q)]≡(n!)^{#Q} mod p.

**Checks.**

- `TaylorWilesArithmeticLevels.empty` (degenerate): For Q=∅ both levels equal K and the diamond group is trivial.
- `TaylorWilesArithmeticLevels.single_prime` (computation): For Q={v}, n=2 and p>2 the trace scalar is 2 modulo p, hence a unit.
- `TaylorWilesArithmeticLevels.old_bad_place` (non-example): At v∈S outside Q the original local factor must be retained; leaving it unspecified does not define a level.

<a id="taylor-wiles-selected-ideals"></a>

### 5.2 Taylor–Wiles selected ideals

Define `TaylorWilesSelectedIdeals`. With 𝒱 = 𝒱_λ(χ^{-1}): 𝔪^Q ⊂ T^{S∪Q}(K, 𝒱) is the pullback of 𝔪 under T^{S∪Q}(K,𝒱) ⊂ T^S(K,𝒱); 𝔪_0^Q ⊂ T^{S∪Q}(K_0(Q),𝒱) is the pullback of 𝔪^Q and 𝔪_1^Q ⊂ _{K_0(Q)/K_1(Q)}T^{S∪Q}(K_0(Q)/K_1(Q),𝒱) the pullback of 𝔪_0^Q under the maps (6.5.6); 𝔫_0^Q ⊂ T^{S∪Q}_Q(K_0(Q),𝒱) is the ideal generated by 𝔪_0^Q and the elements U_{v,i} − q_v^{i(1−i)/2} α_{v,1}⋯α_{v,i} (v ∈ Q, 1 ≤ i ≤ n); 𝔫_1^Q ⊂ T^{S∪Q}_Q(K_0(Q)/K_1(Q),𝒱) is the preimage of 𝔫_0^Q under (6.5.7).

([ACC](#source-acc), §6.5.1, paragraph before Lemma 6.5.8, p. 1065). *Needs:* `Layer 5`.

Its interface includes:

- `TaylorWilesSelectedIdeals.unramified_contraction`: m^Q is the contraction of m to the away-from-S∪Q Hecke image.
- `TaylorWilesSelectedIdeals.selected_generator`: n₀^Q adds U_{v,i}−q_v^{i(1−i)/2}∏_{j≤i}α_{v,j}.
- `TaylorWilesSelectedIdeals.diamond_pullback`: n₁^Q is the preimage of n₀^Q under the auxiliary diamond-forgetting Hecke map.
- `TaylorWilesSelectedIdeals.ordering`: The chosen ordering of residual eigenvalues fixes the selected Iwahori constituent.

**Checks.**

- `TaylorWilesSelectedIdeals.empty` (degenerate): For Q=∅ the selected ideal is just the original localized maximal ideal.
- `TaylorWilesSelectedIdeals.rank_two_second` (computation): For n=2 the i=2 generator is U_{v,2}−q_v^{-1}α_{v,1}α_{v,2}; q_v=3 and roots 2,5 give eigenvalue 10/3.
- `TaylorWilesSelectedIdeals.order_sensitive` (non-example): For distinct α₁,α₂, interchanging them changes the i=1 generator U_{v,1}−α₁.

<a id="selected-ideal-properness"></a>

### 5.3 Selected ideal properness

Prove `selected_ideal_properness`. Each of 𝔪^Q, 𝔪_0^Q, 𝔪_1^Q, 𝔫_0^Q, 𝔫_1^Q is a (proper) maximal ideal. The content is that 𝔫_0^Q is proper, i.e. H^\*(X_{K_0(Q)}, 𝒱_λ(χ^{-1})/ϖ)[𝔪_0^Q] contains a nonzero vector on which every U_{v,i} (v ∈ Q) acts by α_{v,1}⋯α_{v,i}; this follows from (the proof of) [KT17, Lem. 5.3] once H^\*(X_K, 𝒱_λ(χ^{-1}))[𝔪^Q] is killed by a power of 𝔪, which follows from the existence of ρ̄_𝔪 and its local–global compatibility at v ∈ Q.

([ACC](#source-acc), §6.5.1, Lemma 6.5.8, p. 1065; [KT](#source-kt), §5, Lemma 5.3 and proof, manuscript p. 26). *Needs:* `Layer 5`; `SR:SR.1`; `ALS:ALS.3`.

<a id="diamond-derived-augmentation"></a>

### 5.4 Diamond augmentation

Prove `diamond_derived_augmentation`. The natural morphisms RΓ(X_K, 𝒱)_{𝔪^Q} → RΓ(X_K, 𝒱)_𝔪, RΓ(X_{K_0(Q)}, 𝒱)_{𝔫_0^Q} → RΓ(X_K, 𝒱)_{𝔪^Q} (trace), and RΓ(Δ_Q, RΓ_{K_0(Q)/K_1(Q)}(X_{K_1(Q)}, 𝒱)_{𝔫_1^Q}) → RΓ(X_{K_0(Q)}, 𝒱)_{𝔫_0^Q} are isomorphisms in D(𝒪) (𝒱 = 𝒱_λ(χ^{-1})). (Proof: the first because 𝔪 is the unique maximal ideal of T^S(K, 𝒱) above 𝔪^Q, shown in the proof of Lemma 6.5.8; the second reduces after ⊗^L_𝒪 k to tr_{K/K_0(Q)}: H^\*(X_{K_0(Q)}, 𝒱/ϖ)_{𝔫_0^Q} ≅ H^\*(X_K, 𝒱/ϖ)_{𝔪^Q}, which is [KT17, Lem. 5.4]; the third is clear from the definitions.)

([ACC](#source-acc), §6.5.1, Lemma 6.5.9, p. 1066; [KT](#source-kt), §5, Lemma 5.4 and proof, manuscript p. 27). *Needs:* `Layer 5`; `Layer 0`; `SR:SR.1`.

<a id="taylor-wiles-hecke-locality"></a>

### 5.5 Taylor–Wiles Hecke locality

Prove `taylor_wiles_hecke_locality`. There is a surjection _{K_0(Q)/K_1(Q)}T^{S∪Q}(RΓ_{K_0(Q)/K_1(Q)}(X_{K_1(Q)}, 𝒱)_{𝔫_1^Q}) → T^{S∪Q}(RΓ(X_K, 𝒱)_{𝔪^Q}) = T^{S∪Q}(K, 𝒱)_{𝔪^Q}; its source is a local 𝒪[Δ_Q]-algebra whose maximal ideal is the preimage of 𝔪^Q, because it acts nearly faithfully on H^\*(X_{K_1(Q)}, 𝒱)_{𝔫_1^Q}. Definition ([Tay08, Def. 2.1]): a finitely generated module over a Noetherian local ring is nearly faithful if its annihilator is a nilpotent ideal.

([ACC](#source-acc), §6.5.1, (6.5.10) and following paragraph, p. 1066). *Needs:* `Layer 5`.

<a id="diamond-linear-deformation-hecke-map"></a>

### 5.6 Diamond linear deformation Hecke map

Prove `diamond_linear_deformation_hecke_map`. Let 𝕋 = _{K_0(Q)/K_1(Q)}T^{S∪Q}(RΓ_{K_0(Q)/K_1(Q)}(X_{K_1(Q)}, 𝒱_λ(χ^{-1}))_{𝔫_1^Q}). There are δ ≥ 1 depending only on n and [F:ℚ], an ideal J ⊂ 𝕋 with J^δ = 0, and a continuous surjective 𝒪[Δ_Q]-algebra homomorphism f_{𝒮_{χ,Q}}: R_{𝒮_{χ,Q}} → 𝕋/J such that for every finite v ∉ S ∪ Q the characteristic polynomial of f_{𝒮_{χ,Q}} ∘ ρ_{𝒮_{χ,Q}}(Frob_v) is the image of P_v(X). (Proof: with T′ = T^{S∪Q}_Q(K_0(Q)/K_1(Q), 𝒱)_{𝔫_1^Q} ⊃ 𝕋 (a local inclusion of finite 𝒪[Δ_Q]-algebras), Theorem 2.3.7 gives ρ_{𝔫_1^Q}: G_{F,S∪Q} → GL_n(T′/J′) lifting ρ̄_𝔪; the conditions at S are as in Prop. 6.5.3 and there is none at Q. For v ∈ Q define ψ_{v,i}: W_{F_v} → (T′)^× by ψ_{v,i}(Art_{F_v}(α)) = t_{v,i}(α); Theorem 3.1.1 gives det(X − ρ_{𝔫_1^Q}(σ)) = ∏_i (X − ψ_{v,i}(σ)) for σ ∈ W_{F_v} (after enlarging J′); the ψ_{v,i} mod 𝔫_1^Q send Frobenius to the pairwise distinct α_{v,i}, so [BC09, Prop. 1.5.1] gives ρ_{𝔫_1^Q}|_{W_{F_v}} ≅ ⊕_i ψ_{v,i}, whence 𝒪[Δ_v]-linearity (§6.2.18); take J = ker(𝕋 → T′/J′).)

([ACC](#source-acc), §6.5.1, Proposition 6.5.11, pp. 1066–1067). *Needs:* `Layer 5`; `Layer 4`; `AG:AG2.5`; `GGD:G8`.

**The Fontaine–Laffaille patched pair**

Verify the two arithmetic towers against the abstract ultrapatching input at a fixed nonprincipal ultrafilter. The free diamond-cell models, uniform ranks and nilpotent bounds are part of that verification. Reduction compares Hecke images in the reduced coefficient category.

<a id="fontaine-laffaille-patching-verification"></a>

### 5.7 Fontaine–Laffaille patching verification

Prove `fontaine_laffaille_patching_verification`. Fix one nonprincipal ultrafilter on the positive integers for the imported ultrapatching construction. Set q = h¹(F_S/F, ad ρ̄_𝔪(1)), g = qn − n²[F⁺:ℚ], Δ_∞ = ℤ_p^{nq}, 𝒯 = a power series ring over 𝒪 in n²|S| − 1 variables, S_∞ = 𝒯⟦Δ_∞⟧ with augmentation ideal 𝔞_∞ (Λ = 𝒪). Enlarge E to contain ζ_p and choose, for each v ∈ R, pairwise distinct χ_{v,1},…,χ_{v,n}: 𝒪_{F_v}^× → 𝒪^× trivial mod ϖ (possible as p > n, q_v ≡ 1 mod p); χ = ∏_{v∈R} χ_v on ∏_{v∈R} I_v. For N ≥ 1 choose Taylor–Wiles data (Q_N, (α_{v,i})_{v∈Q_N}) as in Proposition 6.2.33 (possible as r̄_ι(π)(G_{F(ζ_p)}) is enormous; any imaginary quadratic subfield of F), Q_0 = ∅, Δ_N = Δ_{Q_N} with a surjection Δ_∞ ↠ Δ_N whose kernel lies in (p^N ℤ_p)^{nq} (as q_v ≡ 1 mod p^N for v ∈ Q_N). R_N = R_{𝒮_{1,Q_N}}, R′_N = R_{𝒮_{χ,Q_N}} (R_0 = R_{𝒮_1}, R′_0 = R_{𝒮_χ}); R^loc = R^{S,loc}_{𝒮_1}, R′^loc = R^{S,loc}_{𝒮_χ} (§6.2.22), also the local rings of 𝒮_{·,Q_N}; canonical isomorphisms R^loc/ϖ ≅ R′^loc/ϖ, R_N/ϖ ≅ R′_N/ϖ, R_N ⊗_{𝒪[Δ_N]} 𝒪 ≅ R_0, R′_N ⊗ 𝒪 ≅ R′_0, compatible mod ϖ; R^loc-algebra structures on R_N ⊗̂_𝒪 𝒯 (Lemma 6.2.4); R_∞, R′_∞ = power series rings in g variables over R^loc, R′^loc with surjections onto the framed rings R_N ⊗̂ 𝒯, R′_N ⊗̂ 𝒯 (Prop. 6.2.25 for N = 0, using H⁰(F_S/F, ad ρ̄_𝔪(1)) = 0 because r̄_ι(π)|_{G_{F(ζ_p)}} is irreducible and ζ_p ∉ F; Prop. 6.2.33(3) for N ≥ 1 ), compatible mod ϖ and with R_N ⊗ 𝒪 ≅ R_0. Complexes: 𝒞_0 = RHom_𝒪(RΓ(X_K, 𝒱_λ(1))_𝔪, 𝒪)[−d], T_0 = T^S(K, 𝒱_λ(1))_𝔪, with H^i(𝒞_0)[1/p] ≅ Hom_E(H^{d−i}(X_K, 𝒱_λ(1))_𝔪[1/p], E) as T_0-modules; 𝒞′_0, T′_0 likewise with 𝒱_λ(χ^{-1}); for N ≥ 1, 𝒞_N = RHom_{𝒪[Δ_N]}(RΓ_{K_0(Q_N)/K_1(Q_N)}(X_{K_1(Q_N)}, 𝒱_λ(1))_{𝔫_1^{Q_N}}, 𝒪[Δ_N])[−d], T_N = _{K_0/K_1}T^{S∪Q_N}(RΓ_{K_0(Q_N)/K_1(Q_N)}(X_{K_1(Q_N)}, 𝒱_λ(1))_{𝔫_1^{Q_N}}), and 𝒞′_N, T′_N with 𝒱_λ(χ^{-1}). Claim: with I_N, I′_N from Props. 6.5.3/6.5.11 these data satisfy the set-up of §6.4.1: canonical 𝒞_N ⊗^L k[Δ_N] ≅ 𝒞′_N ⊗^L k[Δ_N] with T_N, T′_N having the same image T̄_N; 𝒞_N ⊗^L_{𝒪[Δ_N]} 𝒪 ≅ 𝒞_0 (Lemma 6.5.9), compatible mod ϖ; local 𝒪[Δ_N]-algebra surjections R_N → T_N/I_N, R′_N → T′_N/I′_N compatible mod ϖ and agreeing into T̄_N/(Ī_N + Ī′_N); T_N ⊗_{𝒪[Δ_N]} 𝒪 → T_0 surjective onto T_0/I_0 (Chebotarev and the Galois representation over T_0/I_0), and likewise primed.

([ACC](#source-acc), §6.5.1, proof of Theorem 6.5.4, pp. 1067–1069). *Needs:* `Layer 5`; `mathlib:DerivedCategory`; `DP:P7`; `GGD:G7`; `ALS:ALS.1`; `DP:P8`.

<a id="patched-arithmetic-mod-varpi-comparison"></a>

### 5.8 Patched-complex comparison

Prove `patched_arithmetic_mod_varpi_comparison`. (1) The quasi-isomorphisms 𝒞_N/ϖ ≅ 𝒞′_N/ϖ induce a quasi-isomorphism 𝒞_∞/ϖ ≅ 𝒞′_∞/ϖ. (2) Via this identification T_∞ and T′_∞ have the same image T̄_∞ in the endomorphism algebras of 𝒞_∞/ϖ and 𝒞′_∞/ϖ in D(S_∞/ϖ), and also after restriction of scalars to D(S_∞). (3) With Ī_∞, Ī′_∞ the images of I_∞, I′_∞ in T̄_∞, the actions of R_∞/ϖ ≅ R′_∞/ϖ (through T_∞ and T′_∞) on H^\*(𝒞_∞/ϖ)/(Ī_∞ + Ī′_∞) and H^\*(𝒞′_∞/ϖ)/(Ī_∞ + Ī′_∞) are identified via 𝒞_∞/ϖ ≅ 𝒞′_∞/ϖ.

([ACC](#source-acc), §6.4.2, Proposition 6.4.17, pp. 1060–1061). *Needs:* `Layer 4`; `mathlib:DerivedCategory`; `DP:P8`.

<a id="fontaine-laffaille-dimension-amplitude"></a>

### 5.9 Fontaine–Laffaille dimension amplitude

Prove `fontaine_laffaille_dimension_amplitude`. Applying §6.4.2 to the Fontaine–Laffaille arithmetic tower data gives: bounded complexes 𝒞_∞, 𝒞′_∞ of free S_∞-modules, T_∞ ⊂ End_{D(S_∞)}(𝒞_∞), T′_∞ ⊂ End_{D(S_∞)}(𝒞′_∞), ideals with I_∞^δ = I′_∞^δ = 0, S_∞-algebra structures on R_∞, R′_∞ and S_∞-algebra surjections R_∞ → T_∞/I_∞, R′_∞ → T′_∞/I′_∞; surjections R_∞/𝔞_∞ ↠ R_0, R′_∞/𝔞_∞ ↠ R′_0; 𝒞_∞ ⊗^L S_∞/𝔞_∞ ≅ 𝒞_0 and 𝒞′_∞ ⊗^L S_∞/𝔞_∞ ≅ 𝒞′_0 with T_∞ → T_0 surjective onto T_0/I_0 and R_∞/𝔞_∞ → (T_0/I_0)/I_{∞,0} factoring through R_0; 𝒞_∞ ⊗^L S_∞/ϖ ≅ 𝒞′_∞ ⊗^L S_∞/ϖ with a common image T̄_∞ of T_∞ and T′_∞ and identified actions of R_∞/ϖ ≅ R′_∞/ϖ on H^\*(𝒞_∞ ⊗^L S_∞/ϖ)/(Ī_∞ + Ī′_∞). By Lemma 6.2.26: every generic point of Spec R_∞/ϖ specializes from a unique generic point of Spec R_∞, all generic points of Spec R_∞ have characteristic 0, Spec R′_∞ is irreducible with characteristic-0 generic point, R_∞ is equidimensional, and dim R_∞ = dim R′_∞ = 1 + g + n²|S| + ½n(n−1)[F:ℚ]. For X_K with F CM, ℓ_0 = n[F⁺:ℚ] − 1; since dim S_∞ = n²|S| + qn and g = qn − n²[F⁺:ℚ], dim R_∞ = dim R′_∞ = dim S_∞ − ℓ_0. H^\*(𝒞_∞ ⊗^L S_∞/𝔞_∞)[1/p] ≅ Hom_E(H^{d−\*}(X_K, 𝒱_λ(1))_𝔪[1/p], E) is nonzero and concentrated in [q_patch, q_patch + ℓ_0] by Theorem 2.4.10. Hence Assumption 6.3.6 holds, Proposition 6.3.8 gives full support of H^\*(𝒞_∞) over R_∞, hence of H^\*(𝒞_∞ ⊗^L S_∞/𝔞_∞) = H^\*(𝒞_0) over R_∞/𝔞_∞ and so over R_{𝒮_1}.

([ACC](#source-acc), §6.5.1, proof of Theorem 6.5.4, pp. 1069–1070). *Needs:* `Layer 4`; `LGD:L7`; `LGD:R08.2`; `ALS:ALS.5`; `Layer 5`; `DP:P9`.

<a id="fontaine-laffaille-full-support"></a>

### 5.10 Fontaine–Laffaille full support

Prove `fontaine_laffaille_full_support`. Under assumptions (1)–(17) of §6.5.1, H^\*(X_K, 𝒱_λ(1))_𝔪 has full support over R_{𝒮_1}, i.e. its support in Spec R_{𝒮_1}, defined through f_{𝒮_1}: R_{𝒮_1} → T^S(RΓ(X_K, 𝒱_λ(1)))_𝔪/J (Prop. 6.5.3) as in §6.3.5, is all of Spec R_{𝒮_1} (although H^\* is not literally an R_{𝒮_1}-module).

([ACC](#source-acc), §6.5.1, Theorem 6.5.4, p. 1063; proof pp. 1067–1070). *Needs:* `Layer 5`; `Layer 4`; `DP:P9`.

**Checks.**

- Nilpotent ideals disappear from Spec and support, but the original integral deformation and Hecke rings need not be isomorphic.

<a id="fontaine-laffaille-lifting-at-good-level"></a>

### 5.11 Fontaine–Laffaille lifting at good level

Prove `fontaine_laffaille_lifting_at_good_level`. Under (1)–(17) of §6.5.1, let ρ: G_F → GL_n(Q̄_p) be continuous with: (1) ρ̄ ≅ r̄_ι(π); (2) ρ|_{G_{F_v}} crystalline for every v | p, with HT_τ(ρ) = {λ_{ιτ,1} + n − 1, …, λ_{ιτ,n}} (the j-th entry λ_{ιτ,j} + n − j) for every τ: F ↪ Q̄_p; (3) ρ unramified at every finite v ∉ S; (4) ρ|_{G_{F_v}} unipotently ramified for v ∈ R. Then ρ is automorphic: there is a cuspidal regular algebraic automorphic representation Π of GL_n(𝔸_F) of weight λ with ρ ≅ r_ι(Π), and Π_v is unramified at every finite v with v | p or v ∉ S. (Proof: conjugate ρ into GL_n(𝒪) with ρ mod ϖ = ρ̄_𝔪; it is of type 𝒮_1, giving f: R_{𝒮_1} → E; by Theorem 6.5.4, ker f ∈ Supp H^\*(X_K, 𝒱_λ(1))_𝔪[1/p]; Theorem 2.4.10 gives Π with (Π^∞)^K ≠ 0.)

([ACC](#source-acc), §6.5.1, Corollary 6.5.5, pp. 1063–1064). *Needs:* `Layer 5`; `ALS:ALS.5`.

**Auxiliary neatness and Hida weight independence**

Two suitable auxiliary places justify neatness. For the ordinary tower remove the weight by the ν+w₀μ character before taking the perfect limit. Specialization then recovers the required finite-level ordinary complex at the new weight.

<a id="neatness-auxiliary-places"></a>

### 5.12 Neatness auxiliary places

Prove `neatness_auxiliary_places`. Let E be an imaginary CM field, n ≥ 2, p an odd prime, and ρ̄: G_E → GL_n(k) continuous and unramified outside a finite set S′ containing the p-adic places. Assume some σ ∈ G_E − G_{E(ζ_p)} has scalar ρ̄(σ), and fix a finite forbidden set R^c of places. Then infinitely many degree-one places v of E have odd residue characteristic different from p, avoid S′ ∪ R^c and the primes ramified in E/ℚ, have scalar ρ̄(Frob_v), and satisfy q_v ≢ 1 mod p. At such v, local Tate duality gives H²(E_v, ad ρ̄) = H⁰(E_v, ad ρ̄(1))^∨ = 0. Choose two of distinct residue characteristics and put S = S′ ∪ {v_0,v′_0}; pro-v Iwahori factors at these two places make the resulting level neat (ACC Lemma 6.5.2). Their underlying rational primes split in every imaginary quadratic subfield of E. If π_E is unramified outside S′ and all other Fontaine–Laffaille seventeen-clause (respectively ordinary fifteen-clause) profile hypotheses have already been arranged, this completes the auxiliary unramified, H²-vanishing, two-prime and neat-level requirements; it does not establish the other profile hypotheses.

([ACC](#source-acc), §6.5.12, proof of Theorem 6.1.1, pp. 1073–1074 (and §6.6.10, p. 1084); Lemma 6.5.2, p. 1062, for neatness). *Needs:* `Tau Ceti Chebotarev L10`; `Tau Ceti ClassFieldTheory L5`; `ALS:ALS.1`.

<a id="ordinary-taylor-wiles-levels"></a>

### 5.13 Ordinary Taylor–Wiles levels

Define `OrdinaryTaylorWilesLevels`. For a Taylor–Wiles datum (Q, (α_{v,i})) for 𝒮_1 whose places have residue characteristic split in an imaginary quadratic subfield of F (a TW datum for all 𝒮_χ; R_{𝒮_{χ,Q}} an 𝒪[Δ_Q]-algebra, Δ_Q = ∏_{v∈Q} k(v)^×(p)^n) and c ≥ 1: good subgroups K(c,c)_1(Q) ⊂ K(c,c)_0(Q) ⊂ K(c,c), equal to K(c,c)_v away from Q, with K(c,c)_0(Q)_v = Iw_v and K(c,c)_1(Q)_v the maximal pro-prime-to-p subgroup of Iw_v for v ∈ Q, so K(c,c)_0(Q)/K(c,c)_1(Q) ≅ Δ_Q. A_1(μ,χ,Q,c) = RHom_{Λ_{1,c}[Δ_Q]}(RΓ_{K(c,c)_0(Q)/K(c,c)_1(Q)}(X_{K(c,c)_1(Q)}, 𝒱_μ(χ^{-1}))^{ord}, Λ_{1,c}[Δ_Q])[−d] ∈ D(Λ_{1,c}[Δ_Q]), with transpose action of T^{S∪Q,ord}_Q = T^{S∪Q,ord} ⊗_{T^{S∪Q}} T^{S∪Q}_Q. Passing to the limit in c gives A_1(μ,χ,Q) ∈ D(Λ_1[Δ_Q]) with T^{S∪Q,ord}_Q-action and equivariant isomorphisms A_1(μ,χ,Q) ⊗^L_{Λ_1} Λ_{1,c} ≅ A_1(μ,χ,Q,c) and A_1(μ,χ,Q) ⊗^L_{Λ_1} Λ_1/ϖ ≅ A_1(μ,1,Q) ⊗^L_{Λ_1} Λ_1/ϖ, compatible with the level-c data. 𝔪^Q = the contraction of 𝔪 to T^{S∪Q,ord}; 𝔫^Q = the ideal of T^{S∪Q,ord}_Q generated by 𝔪^Q and U_{v,i} − α_{v,1}⋯α_{v,i} (v ∈ Q, 1 ≤ i ≤ n).

([ACC](#source-acc), §6.6.1, pp. 1078–1079). *Needs:* `Layer 5`; `Layer 4`; `PF:L0a`; `GGD:G7`; `DP:P8`; `DP:P7`.

Its interface includes:

- `OrdinaryTaylorWilesLevels.levels`: For every c the two auxiliary levels agree with K(c,c) away from Q and use the same imported diamonds at Q.
- `OrdinaryTaylorWilesLevels.dual`: The finite ordinary dual complex is formed over Λ₁,c[Δ_Q], with transpose Hecke.
- `OrdinaryTaylorWilesLevels.selected_generator`: The ordinary auxiliary ideal has generators U_{v,i}−∏_{j≤i}α_{v,j}, using the ordinary normalization.
- `OrdinaryTaylorWilesLevels.limit`: Perfect reconstruction in c commutes with mod-varpi comparison and carries the diamond action.

**Checks.**

- `OrdinaryTaylorWilesLevels.empty` (degenerate): For Q=∅ the complex is A₁(μ,χ,c).
- `OrdinaryTaylorWilesLevels.single_rank_two` (computation): For n=2 and Q={v}, the ordinary i=2 generator is U_{v,2}−α₁α₂; the FL factor q_v^{-1} is absent. For q_v=3 and roots 2,5 its eigenvalue is 10.
- `OrdinaryTaylorWilesLevels.old_level` (compatibility): All places in S outside Q retain K(c,c)_v; the auxiliary modification does not change their levels.

<a id="ordinary-diamond-augmentation"></a>

### 5.14 Ordinary diamond augmentation

Prove `ordinary_diamond_augmentation`. 𝔫^Q lies in the support of H^\*(A_1(μ,χ,Q)), and there are T^{S∪Q,ord}-equivariant isomorphisms A_1(μ,χ,Q)_{𝔫^Q} ⊗^L_{Λ_1[Δ_Q]} Λ_1 ≅ A_1(μ,χ)_{𝔪^Q} ≅ A_1(μ,χ)_𝔪. (Proof 'as in the Fontaine–Laffaille case', details omitted.)

([ACC](#source-acc), §6.6.1, Lemma 6.6.8, p. 1079). *Needs:* `Layer 5`.

<a id="ordinary-diamond-linear-hecke-map"></a>

### 5.15 Ordinary diamond linear Hecke map

Prove `ordinary_diamond_linear_hecke_map`. Let A(μ,χ,Q) = A_1(μ,χ,Q) ⊗^L_{Λ_1} Λ and _{Δ_Q}T^{S∪Q,Λ_1} = T^{S∪Q,Λ_1} ⊗_𝒪 𝒪[Δ_Q], acting on A(μ,χ,Q)_{𝔫^Q} via K(c,c)_0(Q)/K(c,c)_1(Q) ≅ Δ_Q and passage to the limit; _{Δ_Q}T^{S∪Q,Λ_1}(A(μ,χ,Q)_{𝔫^Q}) is a local Λ[Δ_Q]-algebra. Then there are δ ≥ 1 depending only on n and [F:ℚ], an ideal J ⊂ 𝕋 := _{Δ_Q}T^{S∪Q,Λ_1}(A(μ,χ,Q)_{𝔫^Q} ⊗_𝒪 𝒪(ν + w_0^G μ)^{-1}) with J^δ = 0, and a continuous surjective Λ[Δ_Q]-algebra homomorphism f_{𝒮_{χ,Q}}: R_{𝒮_{χ,Q}} → 𝕋/J such that for every finite v ∉ S ∪ Q the characteristic polynomial of f_{𝒮_{χ,Q}} ∘ ρ_{𝒮_{χ,Q}}(Frob_v) is the image of P_v(X). (Proof: the Λ-algebra map as in Prop. 6.6.7; Λ[Δ_Q]-linearity as in Prop. 6.5.11 via T^{S∪Q,ord}_Q(A(μ,χ,Q) ⊗ 𝒪(ν + w_0^G μ)^{-1})_{𝔫^Q}.)

([ACC](#source-acc), §6.6.1, Proposition 6.6.9 and the preceding paragraph, pp. 1079–1080). *Needs:* `Layer 4`; `Layer 5`; `AG:AG2.5`; `LGD:L8`; `GGD:G8`.

<a id="ordinary-patching-verification"></a>

### 5.16 Ordinary patching verification

Prove `ordinary_patching_verification`. Fix one nonprincipal ultrafilter on the positive integers for the imported ultrapatching construction. Let f: R_{𝒮_1} → 𝒪 classify ρ. Set q = h¹(F_S/F, ad ρ̄_𝔪(1)), g = qn − n²[F⁺:ℚ], Δ_∞ = ℤ_p^{nq}, 𝒯 = a power series ring over Λ (the weight algebra) in n²|S| − 1 variables, S_∞ = 𝒯⟦Δ_∞⟧, augmented over Λ with ideal 𝔞_∞. Choose χ = ∏_{v∈R} χ_v: ∏_{v∈R} Iw_v → 𝒪^× with χ_{v,1},…,χ_{v,n}: k(v)^× → 𝒪^× trivial mod ϖ and pairwise distinct. R^loc = R^{S,loc}_{𝒮_1}, R′^loc = R^{S,loc}_{𝒮_χ} (§6.2.22); R_∞, R′_∞ = power series rings in g variables over them. Applying §6.4.2 to the complexes A(μ,χ,Q_N)_{𝔫^{Q_N}} ⊗_𝒪 𝒪(ν + w_0^G μ)^{-1} (and χ = 1), for Taylor–Wiles data from Proposition 6.2.33, gives: bounded complexes 𝒞_∞, 𝒞′_∞ of free S_∞-modules, T_∞, T′_∞ with nilpotent I_∞, I′_∞ (I^δ = 0), S_∞-algebra structures on R_∞, R′_∞ and surjections R_∞ → T_∞/I_∞, R′_∞ → T′_∞/I′_∞; surjections of local Λ-algebras R_∞/𝔞_∞ ↠ R_{𝒮_1}, R′_∞/𝔞_∞ ↠ R_{𝒮_χ}; and isomorphisms 𝒞_∞ ⊗^L_{S_∞} S_∞/𝔞_∞ ≅ A(μ,1)_𝔪 ⊗_𝒪 𝒪(ν + w_0^G μ)^{-1} = B(μ,1)_𝔪 and 𝒞′_∞ ⊗^L S_∞/𝔞_∞ ≅ B(μ,χ)_𝔪 in D(Λ).

([ACC](#source-acc), §6.6.1, proof of Theorem 6.6.2, pp. 1080–1081). *Needs:* `Layer 5`; `mathlib:DerivedCategory`; `DP:P7`; `GGD:G7`; `ALS:ALS.1`; `DP:P8`.

<a id="ordinary-support-at-lifting-point"></a>

### 5.17 Ordinary support at the lifting point

Prove `ordinary_support_at_lifting_point`. For the ordinary patched pair just constructed: Lemma 6.2.27(1),(2) give Assumption 6.3.6(1),(2) for R_∞, R′_∞ (the dimension equality dim R_∞ = dim S_∞ − ℓ_0 needs g = qn − n²[F⁺:ℚ]). For 𝔭 = the preimage in S_∞ of Ann_Λ(𝒪(ν + w_0^G μ)^{-1}), Corollary 6.6.6 gives (𝒞_∞ ⊗^L S_∞/𝔭)[1/p] ≅ (B(μ,1)_𝔪 ⊗^L_Λ 𝒪(ν + w_0^G μ)^{-1})[1/p], whose cohomology is a quotient of Hom_E(H^{d−\*}(X_{K(1,1)}, 𝒱_μ)_𝔪[1/p], E); π contributes, so by Theorem 2.4.10 it is nonzero and concentrated in [q_patch, q_patch + ℓ_0] (Assumption 6.3.6(3)). Let x ∈ Spec R_∞ be the preimage of ker f and y its contraction to S_∞ (the preimage of Ann_Λ(𝒪(ν + w_0^G λ)^{-1})). The inertial characters on the diagonal of ρ|_{G_{F_v}} are pairwise distinct for v ∈ S_p, so x lies on a maximal-dimensional component of Spec R_∞ (Lemma 6.2.27(3)), and Corollary 6.3.9 gives ker f ∈ Supp H^\*(B(μ,1)_𝔪 ⊗^L_Λ 𝒪(ν + w_0^G λ)^{-1})[1/p]; by Corollary 6.6.6, ker f ∈ Supp H^\*(A_1(λ,1,1)_𝔪 ⊗_𝒪 𝒪(ν + w_0^G λ)^{-1})[1/p], a quotient of Hom_E(H^{d−\*}(X_{K(1,1)}, 𝒱_λ)_𝔪, 𝒪(ν + w_0^G λ)^{-1}[1/p]).

([ACC](#source-acc), §6.6.1, proof of Theorem 6.6.2, pp. 1080–1081). *Needs:* `Layer 5`; `Layer 4`; `LGD:L7`; `LGD:L8`; `LGD:R08.2`; `DP:P9`.

<a id="ordinary-lifting-at-good-level"></a>

### 5.18 Ordinary lifting at good level

Prove `ordinary_lifting_at_good_level`. Under (1)–(15) of §6.6.1, let ρ: G_F → GL_n(Q̄_p) be continuous and λ ∈ (ℤ^n_+)^{Hom(F,Q̄_p)} such that: (1) ρ̄ ≅ r̄_ι(π); (2) for each v | p, ρ|_{G_{F_v}} is conjugate to an upper-triangular representation with diagonal characters ψ_{v,1}, …, ψ_{v,n}, where ψ_{v,i} agrees on the whole inertia group I_{F_v} with σ ↦ ∏_{τ∈Hom(F_v,Q̄_p)} τ(Art_{F_v}^{-1}(σ))^{−(λ_{τ,n−i+1} + i − 1)}; (3) for each v | p, each i and each p-power root of unity x ∈ 𝒪_{F_v}: ∏_{τ∈Hom(F_v,Q̄_p)} τ(x)^{λ_{τ,n+1−i} − μ_{ιτ,n+1−i}} = 1; (4) ρ unramified at finite v ∉ S; (5) ρ|_{G_{F_v}} unipotently ramified for v ∈ R. Then ρ is ordinarily automorphic of weight ιλ: there is an ι-ordinary cuspidal automorphic Π of GL_n(𝔸_F) of weight ιλ with ρ ≅ r_ι(Π), and Π_v is unramified for every finite v ∉ S. (No analogue of Theorem 6.5.4 is proved, because the irreducible components of the 𝒟^{det,ord} lifting rings are not understood well enough.)

([ACC](#source-acc), §6.6.1, Theorem 6.6.2, p. 1075; proof pp. 1080–1081). *Needs:* `Layer 5`; `ALS:ALS.5`.

**Lifting over the original field**

Use the independent soluble field constructions of Layer 2 to reach the good-level hypotheses, apply the appropriate lifting result, and descend. Recover unramified local components using the local Weil–Deligne comparison. The rank-one character case is treated before the higher-rank reduction.

<a id="fontaine-laffaille-lifting-descent"></a>

### 5.19 Fontaine–Laffaille lifting descent

Prove `fontaine_laffaille_lifting_descent`. Let F, ρ, π, λ, ι satisfy the hypotheses of Theorem 6.1.1 ((1) ρ unramified almost everywhere; (2) ρ|_{G_{F_v}} crystalline for v | p, p unramified in F; (3) ρ̄ absolutely irreducible and decomposed generic, ρ̄(G_{F(ζ_p)}) enormous; (4) some σ ∈ G_F − G_{F(ζ_p)} with ρ̄(σ) scalar, p > n²; (5) π cuspidal regular algebraic of weight λ with λ_{τ,1} + λ_{τc,1} − λ_{τ,n} − λ_{τc,n} < p − 2n, ρ̄ ≅ r̄_ι(π), HT_τ(ρ) = {λ_{ιτ,1} + n − 1, …, λ_{ιτ,n}}, π_v unramified for v | p). The totally real case reduces to the imaginary CM case by base change. For imaginary F: choose V_0, V_1, V_2 and a soluble CM E/F as in the split-test and Fontaine–Laffaille field constructions in Layer 2 and auxiliary places v_0, v′_0 so that §6.5.1 (1)–(17) hold for E, π_E and S = S′ ∪ {v_0, v′_0}; Corollary 6.5.5 for ρ|_{G_E} and Proposition 6.5.13(2) give a cuspidal regular algebraic Π of GL_n(𝔸_F) of weight λ with ρ ≅ r_ι(Π), with Π_{E,w} unramified for w ∉ S; unramifiedness of Π_v at finite v ∤ p where ρ and π are unramified follows from the Varma argument. For v | p, unramifiedness follows from the unramified component Π_{E,w} and p being unramified in E.

([ACC](#source-acc), §6.5.12, proof of Theorem 6.1.1, pp. 1071–1074). *Needs:* `Layer 2`; `Layer 5`; `AG:AG2.5`.

<a id="ordinary-lifting-descent"></a>

### 5.20 Ordinary lifting descent

Prove `ordinary_lifting_descent`. Let F, ρ, λ, π, ι satisfy Theorem 6.1.2 ((1) ρ unramified almost everywhere; (2) for v | p, ρ|_{G_{F_v}} potentially semistable and ordinary of regular weight λ ∈ (ℤ^n_+)^{Hom(F,Q̄_p)}: upper triangular with diagonal ψ_{v,i} agreeing with σ ↦ ∏_τ τ(Art_{F_v}^{-1}(σ))^{−(λ_{τ,n−i+1}+i−1)} on an open subgroup of I_{F_v}; (3) ρ̄ absolutely irreducible and decomposed generic, ρ̄(G_{F(ζ_p)}) enormous, some σ ∈ G_F − G_{F(ζ_p)} with ρ̄(σ) scalar, p > n; (4) π regular algebraic cuspidal and ι-ordinary with r̄_ι(π) ≅ ρ̄). The totally real case reduces to the imaginary CM case by base change. For imaginary F choose V_0, V_1, V_2, the ordinary field extension E of Layer 2 and auxiliary places v_0, v′_0 so that (1)–(15) of §6.6.1 hold for E, π_E, S; Theorem 6.6.2 applied to ρ|_{G_E} gives an ι-ordinary cuspidal Π_E of weight λ_E with r_ι(Π_E) ≅ ρ|_{G_E}; Proposition 6.5.13(2) and [Ger19, Lem. 5.7] descend it to an ι-ordinary cuspidal regular algebraic Π of GL_n(𝔸_F) of weight λ with r_ι(Π) ≅ ρ; Π_{E,w} is unramified for w ∉ S, and Π_v is unramified at finite v ∤ p where ρ and π are unramified (the Varma local–global comparison).

([ACC](#source-acc), §6.6.10, proof of Theorem 6.1.2, pp. 1081–1084). *Needs:* `Layer 2`; `Layer 5`; `Layer 3`; `AG:AG2.5`.

<a id="fontaine-laffaille-automorphy-lifting"></a>

### 5.21 Fontaine–Laffaille automorphy lifting

Prove `fontaine_laffaille_automorphy_lifting`. Let F be an imaginary CM or totally real field, c ∈ Aut(F) complex conjugation, p a prime, and ρ : G_F → GL_n(ℚ̄_p) continuous with: (1) ρ unramified almost everywhere; (2) ρ|_{G_{F_v}} crystalline for every v | p, and p unramified in F; (3) ρ̄ absolutely irreducible and decomposed generic (Definition 4.3.1), and ρ̄(G_{F(ζ_p)}) enormous (Definition 6.2.29); (4) there is σ ∈ G_F − G_{F(ζ_p)} with ρ̄(σ) scalar, and p > n²; (5) there is a cuspidal automorphic π of GL_n(𝔸_F) with (a) π regular algebraic of weight λ satisfying λ_{τ,1} + λ_{τc,1} − λ_{τ,n} − λ_{τc,n} < p − 2n for all τ; (b) an isomorphism ι : ℚ̄_p → ℂ with ρ̄ ≅ r̄_ι(π) and HT_τ(ρ) = {λ_{ιτ,1} + n − 1, λ_{ιτ,2} + n − 2, …, λ_{ιτ,n}} for every τ : F ↪ ℚ̄_p; (c) π_v unramified for every v | p. Then ρ is automorphic: ρ ≅ r_ι(Π) for a cuspidal automorphic Π of GL_n(𝔸_F) of weight λ; moreover Π_v is unramified at every finite v with v | p or with ρ and π both unramified at v. (Remark 6.1.4, folded here: the image of Pρ̄ equals that of ad ρ̄, so the first half of (4) is equivalent to ζ_p ∉ F̄^{ker ad ρ̄}; when p is unramified in F it follows from the non-existence of a surjection (ad ρ̄)(G_F) ↠ (ℤ/pℤ)^×.)

([ACC](#source-acc), §6.1, Theorem 6.1.1 and Remark 6.1.4, pp. 1029–1030). *Needs:* `Layer 5`; `AG:AG2.7`; `AG:AG2.5`; `GGD:G7`; `ALS:ALS.5`; `Layer 2`; `CS:R24.5`.

<a id="ordinary-automorphy-lifting"></a>

### 5.22 Ordinary automorphy lifting

Prove `ordinary_automorphy_lifting`. Let F be an imaginary CM or totally real field, c complex conjugation, p a prime, and ρ : G_F → GL_n(ℚ̄_p) continuous with: (1) ρ unramified almost everywhere; (2) for every v | p, ρ|_{G_{F_v}} is potentially semistable and ordinary with regular Hodge–Tate weights: there is λ ∈ (ℤ^n_+)^{Hom(F,ℚ̄_p)} such that for each v | p, ρ|_{G_{F_v}} ∼ an upper-triangular representation with diagonal characters ψ_{v,1}, …, ψ_{v,n} : G_{F_v} → ℚ̄_p^×, where ψ_{v,i} agrees on an open subgroup of I_{F_v} with σ ↦ ∏_{τ ∈ Hom(F_v, ℚ̄_p)} τ(Art_{F_v}^{-1}(σ))^{−(λ_{τ,n−i+1} + i − 1)}; (3) ρ̄ absolutely irreducible and decomposed generic, and ρ̄(G_{F(ζ_p)}) enormous; (4) there is σ ∈ G_F − G_{F(ζ_p)} with ρ̄(σ) scalar, and p > n; (5) there are a regular algebraic cuspidal automorphic π of GL_n(𝔸_F) and ι : ℚ̄_p → ℂ with π ι-ordinary and r̄_ι(π) ≅ ρ̄. Then ρ is ordinarily automorphic of weight ιλ: ρ ≅ r_ι(Π) for an ι-ordinary cuspidal automorphic Π of GL_n(𝔸_F) of weight ιλ; for finite v ∤ p with ρ and π unramified at v, Π_v is unramified. (Remark 6.1.3, folded here: the existence of Π forces λ to be conjugate self-dual up to twist, λ_{τ,i} + λ_{τc,n+1−i} = w for some w ∈ ℤ, by Clozel's purity lemma [Clo90, Lem. 4.9]; this is not assumed. The proof shows ρ contributes to the ordinary part of completed cohomology and gets Π by 'independence of weight'.)

([ACC](#source-acc), §6.1, Theorem 6.1.2 and Remark 6.1.3, pp. 1029–1030). *Needs:* `Layer 5`; `AG:AG2.7`; `AG:AG2.5`; `GGD:G7`; `ALS:ALS.5`; `Layer 2`; `CS:R24.5`; `Layer 3`.

### Examples

At rank two a single auxiliary flag index is q_v+1, congruent to 2 modulo p. The ordinary selected generator is U_{v,2}−α₁α₂; the Fontaine–Laffaille normalization retains q_v⁻¹. For μ=(2,0), ν+w₀μ=(0,3), and the coefficient character is inverted in the Hida twist.

### Dependencies

Layers 0–4; ALS.1/ALS.5, GGD:G7/G8, LGD:L7/L8 and DP:P7/P8/P9, including uniform free diamond-cell models and compatible reconstruction.

## References

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
