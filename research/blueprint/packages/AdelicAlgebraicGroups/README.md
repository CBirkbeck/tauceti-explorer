# Adelic algebraic groups and arithmetic quotients

The adeles let one study the real geometry of an algebraic group and its congruence conditions in a single locally compact group. This roadmap develops that passage for affine groups over number fields: the topology on their adelic points, Haar and Tamagawa measures, arithmetic quotients, reduction theory, approximation, and changes of level. The resulting library supports automorphic forms, Hecke correspondences and arithmetic locally symmetric spaces. Its main reusable objects are restricted products of Haar measures, the Harish–Chandra logarithm, quotient integration, adelic heights, fixed-compact Siegel sets, neat levels and residual abelian quotients.

The layers are:

| Layer | Material |
| --- | --- |
| AA.0 | Borel structures and Haar measures on restricted products |
| AA.1 | Integral models and canonical topologies on adelic points |
| AA.2 | Characters, split centres, quotient integration and Tamagawa normalization |
| AA.3 | Reduction, finite volume, compactness and algebraic heights |
| AA.4 | Approximation, neatness, level maps, Hecke correspondences and residual quotients |
| AA.5 | Explicit checks for GL₁, GL₂ over ℚ and definite quaternion groups |

[Suggested.lean](Suggested.lean) proposes signatures using the existing Lean vocabulary. This document specifies the mathematics; the suggested forms are aids to choosing names and interfaces. A condition requiring a supplier's algebraic or analytic language remains a mathematical condition, including in examples.

## Scope and prerequisites

Mathlib supplies restricted-product carriers and topologies, finite and probability product measures, Haar uniqueness, the modular character, fundamental-domain integration, double cosets, action groupoids and L² spaces. Tau Ceti supplies convolution groups of Hopf-algebra points, their coefficient maps, concrete GLₙ and Gₘ comparisons, algebraic centres, geometric characters and cotangent/adjoint constructions. This roadmap extends those objects rather than defining substitutes. In particular, an algebraic equivalence does not by itself supply a homeomorphism or an identity of pushed measures.

Algebraic structure belongs to the [Reductive groups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md) and to **ReductiveGroupsPartII**. ReductiveGroups supplies the finite-dimensional comodule/tensor dictionary (layer 1), closed subgroups, quotients and closed homogeneous embeddings (layer 3), character lattices of groups of multiplicative type (layer 4), the centre, derived group and simply connected covers (layer 6), rational parabolics, Levi decompositions and relative roots (layer 7) and finite reductive groups with their order estimates (layer 9). **RG2.0** supplies the finite-type affine evaluation topology and compact open local subgroups; **RG2.0a** supplies coefficient-natural Weil restriction, its tower maps and tensor comparison; **RG2.1** supplies the maximal split central torus with its valuation map; **RG2.3** supplies reductive integral models, hyperspecial subgroups and Lang's theorem with Hensel lifting; **RG2.4** supplies the local decompositions and integration, the Iwasawa decomposition G(F_v) = K_v P(F_v) with K_v ∩ P(F_v) = P(𝒪_v) for an arbitrary parabolic and a hyperspecial K_v (`iwasawa-parabolic-integral`), and the Kneser–Tits theorem over a local field (`kneser-tits-local`). Quasi-splitness at almost all places (AA.4, isotropic-almost-everywhere) and the integral compatibility of a central derived cover (AA.4, cover-integral-image) are proved in this roadmap from those inputs.

The [Global number fields roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/GlobalNumberFields/README.md) supplies places and the product formula (layer 0), weak approximation (layer 1), finite adeles (layer 4), full adeles and the discrete rational diagonal (layer 5), additive strong approximation and idele norm structure (layer 6), and scalar extension of adeles (layer 8). NumberFieldArithmetic, layer 4, supplies the discriminant identities used in scalar Jacobians. RepresentationTheory/LieGroups, layer 9, supplies Cartan and Iwasawa theory, including simultaneous self-adjointness. GlobalQuadraticForms, layer 5, supplies local and global quadratic isotropy. Chebotarev, layer 10, supplies the density input for approximation obstructions. ClassFieldTheory, layer 12, supplies quadratic idele characters, reciprocity and the global norm-index theorem. RepresentationTheory/CompactGroups, layer 5, supplies compact abelian Fourier theory. AlgebraicTopology, stage 6, supplies the integral cohomology of products of circles. RepresentationTheory/CompactGroups, layer 0, supplies the Haar probability measure of a compact group; on a compact open factor B_i it is the restriction of a local Haar measure normalized as in AA.0. The [Fuchsian orbifolds roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FuchsianOrbifolds/README.md) supplies the coarse quotient Riemann surface Γ\ℍ of a Fuchsian group (layers 0–1), its cusp compactification and the maps induced by conjugation and finite-index inclusions (layer 4), and degree theory for finite holomorphic maps (layer 5). AA.5 identifies the GL₂ components with these quotients for its congruence groups; the comparison with algebraic modular curves lies outside this roadmap. Tau Ceti already provides the topological splitting of finitely many factors of a restricted product (`awayDecomposition`, module `Topology/Algebra/RestrictedProduct/Away/Decomposition`) and the homeomorphism of the infinite adeles with the mixed space (`InfiniteAdeleRing.homeomorphMixedSpace`, module `NumberTheory/NumberField/Global/Adeles/Basic`); AA.0 consumes both and adds only their measure clauses.

AA.0 is the shared measure theory for restricted products, including function-field applications. AA.3 owns the generic adelic heights and reduction statements. AA.4 owns neat elements and neat compact open levels; locally symmetric spaces, Shimura data and Shimura varieties build on that theory and add their own geometric applications. Automorphic forms on reductive groups use the adelic groups, measures and reduction theory of this roadmap; their representation and spectral theory lie outside it. AA.5 owns the analytic identification of the GL₂ level quotients over ℚ with quotients of the upper half-plane by congruence groups, together with its behaviour under change of level. The residual quaternion calculations in AA.4 give the abelian part needed for arithmetic torus distributions; they do not specify an equidistribution theorem on the whole automorphic quotient.

## Conventions

Let F be a number field and O_F its ring of integers. An affine algebraic F-group G is represented by a finite-type commutative Hopf F-algebra H. Coordinate morphisms are contravariant; G(R) is the existing convolution group of F-algebra maps H → R. Use the evaluation topology on affine points and the quotient topology on every homogeneous or double quotient. Finite exceptional sets contain the infinite places; integral-model indices refer to their finite part. Smoothness, connectedness, reductivity and simple connectedness are hypotheses where stated, not assumptions on every affine group.

Write A_F, A_{F,f}, F_∞ and A_F^S for the full adeles, finite adeles, product of infinite completions and adeles away from S. Absolute values satisfy the product formula; at complex places the ordinary modulus is squared. Normalize additive measures by vol(O_v)=1, dx at real places and 2 dx dy at complex places. Ordinary multiplicative idele Haar measure has vol(O_v×)=1; the form measure |dx/x| instead gives that subgroup volume 1−q_v⁻¹.

Mathlib's modular character Δ is fixed by (right multiplication by g)_*μ_left=Δ(g)μ_left. For mutually inversion-normalized Haar measures, dμ_left=Δ⁻¹dμ_right. Integration on H\G uses right Haar on H and G, with Δ_G restricted to H equal to Δ_H. For a parabolic P=N⋊M put δ_P(m)=|det(Ad(m)|Lie N)|_A; then Δ_P(nm)=δ_P(m), left Haar in (n,m) coordinates is δ_P(m)⁻¹ dn dm and right Haar is dn dm. These conventions also govern the inversion bridge to Mathlib's right-coset unfolding.

For connected reductive G, X*_F(G) is the rational-character lattice and a_G=Hom_ℤ(X*_F(G),ℝ). A_G is the largest ℚ-split central torus of Res_{F/ℚ}G, and A_G(ℝ)⁰ its positive real part. Its dimension is the rational-character rank; it need not be the whole archimedean centre. Set G(A)¹=ker H_G. Identifying G(A)¹ with G(A)/A_G(ℝ)⁰ transports the quotient measure; it does not identify G(A)¹ with G(F_∞)¹×G(A_f).

A gauge form is a nonzero invariant top-degree form, obtained from the top exterior power of the identity cotangent space. Basis-dependent scalar Jacobians at individual places are retained until the global discriminant identity is applied. A central character is continuous, unitary, and trivial on the rational central intersection. Its L² space consists of measurable Hermitian-line sections modulo equality almost everywhere, with the character convention fixed by f(zg)=ω(z)f(g).

For real Siegel sets fix the maximal compact K throughout a comparison. Cartan compatibility is part of subgroup containment. Neatness is defined through a faithful algebraic representation, a closed immersion, at one fixed embedding F→ℂ; it is independent of that embedding. It differs from applying neatness after restriction of scalars to ℚ. A neat level means that every rational intersection G(F)∩xUx⁻¹ is neat.

## Analytic inputs

The targets below include their intermediate mathematical bridges. Gauge measures require nonarchimedean analytic charts and change of variables, finite-field order estimates, and positivity and induction for the Artin leading coefficient. Quotient L² requires Borel sections, measurable line bundles and completion, and extension of characters of locally compact abelian groups. Approximation requires the p-adic analytic closed-subgroup theorem, Borel density, local torsor vanishing and the simply connected Hasse principle. Arithmetic closures over general number fields need native-field Lie algebras and exclusion of graphs linking distinct completions; ℚ_p-Zariski density alone is insufficient.

Reduction requires general-dimensional Hermite–Minkowski reduction, finite overlap, closed-orbit weight bounds and a geometry-of-numbers count for rational coordinates. Discreteness and compactness alone do not give a polynomial counting estimate. Parabolic integration must include Levi and unipotent factors and disconnected reductive cases where stated. Cholesky bounds, separation of deep parabolic ends and reductive subgroup pullback are separate bridges. The quaternion residual homeomorphism additionally requires open local reduced norm, integral norm images and central-cover compatibility. These are mathematical prerequisites for the corresponding statements, not implicit consequences of the rank-one examples.

Throughout the layers, a source locator attaches to the precise target beside it. The bibliography fixes the editions; arXiv page numbers and journal page numbers are distinguished. Derivations from a source's special case are identified as such. Local notation in a target supplements these standing conventions.

## AA.0 — Restricted products of Haar measures

For the measure targets let ι be countable, G_i second countable locally compact Hausdorff groups, and B_i open subgroups compact at almost every index. Measures μ_i are left Haar unless a target explicitly allows general measures. Purely topological finite-splitting results allow arbitrary index sets. Use the restricted-product carrier and topology already in Mathlib. Build its Borel structure from countably many open principal pieces, put probability measures on the compact tails, and glue compatible level measures. The convergent rescaling construction handles the non-unit local volumes needed for Tamagawa measure.

### AA.0.1 — Borel structure and local normalization

- **The restricted product of countably many second countable groups is second countable.** Let ι be countable, let each G i be a second countable topological group and each B i an open subgroup of G i. Then Πʳ i, [G i, B i] is second countable. Consequently its Borel σ-algebra is generated by the boxes Π i, C i with C i open in G i and C i = B i for all but finitely many i. Assumptions: B i ≤ G i open subgroups.

  Sources: [Sutherland], §23.3, p. 6. Requires: Mathlib `RestrictedProduct.topologicalSpace_eq_iSup`; Mathlib `RestrictedProduct.isOpenEmbedding_inclusion_principal`.

- **Borel structure on a restricted product.** For the data of AA.0 put the Borel σ-algebra on Πʳ i, [G i, B i]. With it the restricted product is a Borel space in which every open subgroup U_S, every box Π i, C i (C i Borel, C i = B i cofinitely) and every inclusion of a principal piece is measurable, and the coordinate maps x ↦ x i are measurable.

  API: `RestrictedProduct.borelSpace` — Πʳ i, [G i, B i] carries the Borel σ-algebra and is a BorelSpace; `RestrictedProduct.measurable_eval` — For each i the coordinate map x ↦ x i is measurable; `RestrictedProduct.measurableSet_box` — For Borel C i with C i = B i for all but finitely many i, the box {x | ∀ i, x i ∈ C i} is measurable; `RestrictedProduct.measurable_inclusion` — The inclusion of each principal piece Πʳ i, [G i, B i]_[𝓟 S] is measurable; `RestrictedProduct.borel_eq_generateFrom_boxes` — For countable ι the Borel σ-algebra is generated by the boxes with open factors.

  Examples: The set {x | ∀ i, x i ∈ B i} is measurable. For ι = ℕ, G i = ℤ/4 and B i = 2ℤ/4, the singleton {0} is neither open nor a box with cofinitely trivial factors, but it is measurable: it is the decreasing intersection over n of the boxes with factor {0} at the indices below n and B i elsewhere. A σ-algebra generated by the open subgroups U_S and their cosets alone would not contain it.

  Sources: [Sutherland], §23.3, p. 6. Requires: AA.0.1; Mathlib `RestrictedProduct.topologicalSpace_eq_iSup`.

- **Normalized local Haar measures.** For a number field K and a finite place v there is a unique additive Haar measure μ_v on K_v with μ_v(𝒪_v) = 1; for a ∈ K_v^×, map (a · ·) μ_v = |a|_v⁻¹ • μ_v with |a|_v = q_v^{−v(a)}. Assumptions: K a number field; v a finite place.

  Sources: [Sutherland], §23.3, p. 6. Requires: Tau Ceti `IsDedekindDomain.HeightOneSpectrum.isNonarchimedeanLocalField_adicCompletion`; Mathlib `MeasureTheory.Measure.haarMeasure`; Mathlib `MeasureTheory.Subgroup.index_mul_measure`.

### AA.0.2 — Compatible measures on principal pieces

- **Product measure on a level subgroup.** Let S ⊂ ι be finite with B i compact and μ i (B i) = 1 for i ∉ S, where μ i is a left Haar measure on G i. On U_S = Π_{i∈S} G i × Π_{i∉S} B i define μ_S as the product of the finite product measure Measure.pi (fun i : S => μ i) and the infinite product measure infinitePi (fun i : ι∖S => μ i restricted to B i), each factor a probability measure on the compact group B i. Assumptions: S finite with μ i (B i) = 1 for i ∉ S.

  API: `RestrictedProduct.levelMeasure` — The measure μ_S on the open subgroup U_S; `RestrictedProduct.levelMeasure_box` — μ_S of a box with factors C i (i ∈ S) and B i (i ∉ S) is ∏_{i∈S} μ i (C i); `RestrictedProduct.levelMeasure_isHaar` — μ_S is a left Haar measure on the topological group U_S; `RestrictedProduct.levelMeasure_univ_compact` — If every B i is compact and μ i (B i) = 1 for all i, then μ_∅ is a probability measure.

  Examples: For S = ∅ and μ i (B i) = 1 for all i, μ_∅ (univ) = 1. For S = {i₀} and a measurable C ⊆ G i₀, μ_S{x | x i₀ ∈ C} = μ i₀ (C) even when μ i₀ (B i₀) ≠ 1: for G i₀ = ℤ/4 with counting measure, B i₀ = 2ℤ/4 and C = {0} the value is 1, whereas a construction that also normalized the factors in S would give 1/2.

  Sources: [Sutherland], §23.3, p. 6; [Borel], §5.5, p. 21. Requires: Mathlib `MeasureTheory.Measure.pi`; Mathlib `MeasureTheory.Measure.infinitePi`; Mathlib `MeasureTheory.Measure.prod`; AA.0.1; Mathlib `RestrictedProduct.isOpenEmbedding_structureMap`; Mathlib `RestrictedProduct.isOpenEmbedding_inclusion_principal`.

- **Compatibility of level measures.** For finite S ⊆ S' as in level-measure, the restriction of μ_{S'} to the open subgroup U_S ⊂ U_{S'} equals μ_S. Assumptions: μ i (B i) = 1 for i ∉ S.

  Sources: [Borel], §5.5, p. 21. Requires: AA.0.2; Mathlib `MeasureTheory.Measure.infinitePi_map_restrict`; Mathlib `MeasureTheory.Measure.pi_pi`.

- **Directed suprema of compatible measures.** Let X be a measurable space, (U_S) a countable directed family of measurable sets covering X and ν_S measures with ν_S supported on U_S and ν_{S'}|_{U_S} = ν_S for S ⊆ S'. Then E ↦ sup_S ν_S(E ∩ U_S) is a measure ν on X with ν|_{U_S} = ν_S for every S, and it is the unique measure with this property. Assumptions: (U_S) countable, directed and covering; compatibility ν_{S'}|_{U_S} = ν_S.

  Sources: [Borel], §5.5, p. 21. Requires: Mathlib measure theory.

- **Restricted product of Haar measures.** Given left Haar measures μ i on G i with μ i (B i) = 1 for all but finitely many i, the restricted product measure μ = ∏ʳ μ i on Πʳ i, [G i, B i] is the unique Borel measure whose restriction to each open subgroup U_S (S finite and containing the finitely many i with μ i (B i) ≠ 1 or B i not compact) is μ_S. It is defined as the supremum of the directed family of measures (U_S ↪ Πʳ)_* μ_S. Assumptions: μ i left Haar measures on G i.

  API: `RestrictedProduct.haarProduct` — The measure ∏ʳ μ i on Πʳ i, [G i, B i], given hμ : ∀ᶠ i in cofinite, μ i (B i) = 1; `RestrictedProduct.haarProduct_restrict_level` — For admissible finite S, the restriction of ∏ʳ μ i to U_S is μ_S; `RestrictedProduct.haarProduct_eq_of_restrict` — A Borel measure whose restriction to every admissible U_S is μ_S equals ∏ʳ μ i; `RestrictedProduct.haarProduct_box` — ∏ʳ μ i of a box Π i, C i with C i = B i cofinitely equals ∏ᶠ i, μ i (C i); `RestrictedProduct.haarProduct_isHaarMeasure` — ∏ʳ μ i is a left Haar measure; `RestrictedProduct.haarProduct_smul` — For positive finite real c_i equal to 1 cofinitely, rescaling μ_i by c_i rescales the product by ∏ᶠ c_i.

  Examples: If μ i (B i) = 1 for every i, then ∏ʳ μ i of {x | ∀ i, x i ∈ B i} is 1. If some factor has infinite total mass (as μ_p on ℚ_p), then ∏ʳ μ i has infinite total mass; it is not an infinite product of probability measures.

  Sources: [Sutherland], §23.3, p. 6; [Borel], §5.5, p. 21. Requires: AA.0.2; AA.0.1.

- **Restriction of the restricted product measure to a level.** For every finite S containing the exceptional indices, (∏ʳ μ i).restrict U_S = (U_S ↪ Πʳ)_* μ_S, and ∏ʳ μ i is the unique measure with this property.

  Sources: [Sutherland], §23.3, p. 6. Requires: AA.0.2.

- **Measure of a box.** For Borel sets C i ⊂ G i with C i = B i for all but finitely many i, ∏ʳ μ i (Π i, C i) = ∏ᶠ i, μ i (C i), the product being finite because almost all factors equal 1.

  Sources: [Sutherland], §23.3, p. 6. Requires: AA.0.2; Mathlib `MeasureTheory.Measure.pi_pi`.

- **The restricted product measure is a Haar measure.** ∏ʳ μ i is a left Haar measure on the locally compact group Πʳ i, [G i, B i]; if every μ i is also right invariant then ∏ʳ μ i is right invariant.

  Sources: [Sutherland], §23.3, p. 6. Requires: AA.0.2; Mathlib `RestrictedProduct.locallyCompactSpace_of_group`; Mathlib `RestrictedProduct.isTopologicalGroup`; Mathlib `MeasureTheory.Measure.IsHaarMeasure`.


### AA.0.3 — Products, transport and changes of normalization

- **Change of local normalizations.** If μ′_i = c_i μ_i, where 0<c_i<∞ and c_i=1 outside a finite set, then the normalized restricted Haar products satisfy ∏ʳ μ′_i = (∏ᶠ c_i) ∏ʳ μ_i. An infinitely rescaled family needs the separately stated convergent-product construction; finite rescaling alone gives no such theorem.

  Sources: [Rosengarten], §1, p. 2. Requires: AA.0.2.

- **Changing the restricting subgroups at finitely many places.** Let B' i ≤ G i be open subgroups with B' i = B i for all but finitely many i. The identity on Π i, G i restricts to an isomorphism of topological groups Πʳ i, [G i, B i] ≃ₜ* Πʳ i, [G i, B' i], under which ∏ʳ μ i corresponds to ∏ʳ μ i (the normalization condition being cofinite). Thus the restricted product and its measure depend only on the B i up to finitely many indices. Assumptions: B' i open subgroups, B' i = B i cofinitely.

  Sources: [Conrad], Theorem 3.6, p. 6. Requires: AA.0.2; Mathlib `RestrictedProduct.topologicalSpace_eq_iSup`; Mathlib `RestrictedProduct.continuous_dom`.

- **Fubini for restricted product measures.** Under the finite splitting, ∏ʳ_ι μ i corresponds to (Measure.pi (fun i : S => μ i)).prod (∏ʳ_{ι∖S} μ i). Hence for f integrable on Πʳ i, [G i, B i], ∫ f ∂(∏ʳ μ i) = ∫_{Π_{i∈S} G i} ∫_{Πʳ_{ι∖S}} f(x_S, x^S) dμ^S dμ_S. Assumptions: f integrable for ∏ʳ μ i.

  Sources: [Borel], §5.5, p. 21. Requires: AA.0.3; AA.0.2; Mathlib `MeasureTheory.Measure.isMulLeftInvariant_eq_smul`; Mathlib `MeasureTheory.integral_prod`.

- **Integral of a factorizable function.** Let f i : G i → ℂ be integrable, with f i = indicator of B i for all but finitely many i. Then f(x) = ∏ i, f i (x i) is a well-defined integrable function on Πʳ i, [G i, B i] and ∫ f ∂(∏ʳ μ i) = ∏ᶠ i, ∫ f i ∂μ i. Assumptions: f i integrable, f i = 1_{B i} cofinitely.

  Sources: [Sutherland], §23.3, p. 6. Requires: AA.0.3; AA.0.2.

- **Restricted products of unimodular groups are unimodular.** If every G i is unimodular (modularCharacter G i = 1), then Πʳ i, [G i, B i] is unimodular. More generally the modular character of the restricted product is x ↦ ∏ᶠ i, Δ_{G i}(x i), a finite product because x_i belongs to B_i at almost every index and those B_i are compact at almost every index.

  Sources: [Borel], §5.5, p. 21. Requires: AA.0.2; Mathlib `MeasureTheory.Measure.modularCharacter`.

- **Functoriality of restricted product measures.** Let φ i : G i ≃ₜ* G' i be isomorphisms of topological groups with φ i (B i) = B' i for all but finitely many i. The induced isomorphism Φ = RestrictedProduct.map φ of restricted products satisfies Φ_*(∏ʳ μ i) = ∏ʳ (φ i)_* μ i. Assumptions: φ i topological group isomorphisms, φ i (B i) = B' i cofinitely.

  Sources: [Rosengarten], Lemma 3.5, p. 26. Requires: AA.0.2; Mathlib `RestrictedProduct.mapAlong_continuous`; Mathlib `MeasureTheory.Measure.isMulLeftInvariant_eq_smul`.

- **Positive convergent products.** For a countable family a_i>0 of real numbers with ∑_i |a_i−1|<∞, the net of finite products has a positive finite limit C. Deleting a finite set S divides C by ∏_{i∈S}a_i; equivalently ∑ log a_i converges absolutely and C=exp(∑ log a_i). Assumptions: ι is countable; a : ι → ℝ with a_i > 0 for every i; ∑_i |a_i − 1| < ∞; for the deletion identity, S ⊂ ι finite.

  Sources: [Sutherland], §23.3, p. 6. Requires: Mathlib summable series and logarithms.

- **Convergent restricted products of local Haar measures.** Let G_i be countably many second countable locally compact Hausdorff groups, B_i open and compact cofinitely, and μ_i left Haar measures. Choose finite S containing the noncompact B_i. Put a_i=μ_i(B_i)∈(0,∞) for i∉S, suppose ∑_{i∉S}|a_i−1|<∞, and let C_S=∏_{i∉S}a_i>0. Define the convergent product as C_S times the normalized restricted Haar product of μ_i for i∈S and a_i⁻¹μ_i for i∉S. It is independent of S. Assumptions: ι countable; each G_i a second countable locally compact Hausdorff group with a left Haar measure μ_i; B_i ≤ G_i open subgroups; S ⊂ ι finite with B_i compact for every i ∉ S; ∑_{i∉S} |μ_i(B_i) − 1| < ∞.

  API: `RestrictedProduct.convergentHaarProduct` — The construction specified above; `RestrictedProduct.convergentHaarProduct_independent_exceptionalSet` — Enlarging the finite exceptional set leaves the measure unchanged; `RestrictedProduct.convergentHaarProduct_isHaarMeasure` — The convergent product is a nonzero Haar measure; `RestrictedProduct.convergentHaarProduct_box` — If C_i=B_i off finite T⊃S, its box mass is (∏_{i∈T}μ_i(C_i))·∏_{i∉T}a_i.

  Examples: When every a_i=1 the measure equals haarProduct, including its integral box of mass 1. For SL₂ good factors a_v=1−q_v⁻², the integral box mass is their positive infinite product, strictly less than 1 for a nonempty tail; eventual equality to 1 is unnecessary.

  Sources: [Sutherland], §23.3, p. 6. Requires: AA.0.2; AA.0.3.

- **Independence under finite changes of integral subgroups.** Changing compact open B_i at finitely many indices transports the convergent Haar product to the same measure on the canonically identified restricted product. Assumptions: ι countable; each G_i a second countable locally compact Hausdorff group with a left Haar measure μ_i; B_i, B′_i ≤ G_i open subgroups; S ⊂ ι finite with B_i = B′_i compact for every i ∉ S; ∑_{i∉S} |μ_i(B_i) − 1| < ∞.

  Sources: [Sutherland], §23.3, p. 6. Requires: AA.0.3.


### AA.0.4 — Adeles and ideles

- **Normalized Haar measure on the finite adeles.** For a number field K, the measure μ_f on 𝔸_{K,f} = FiniteAdeleRing (𝓞 K) K is the restricted product of the additive Haar measures μ_v on K_v normalized by μ_v(𝒪_v) = 1, where each K_v is a nonarchimedean local field and 𝒪_v its compact open valuation ring. Assumptions: K a number field.

  API: `NumberField.finiteAdeleHaar` — The normalized Haar measure on 𝔸_{K,f}; `NumberField.finiteAdeleHaar_integers` — finiteAdeleHaar (∏_v 𝒪_v) = 1; `NumberField.finiteAdeleHaar_isAddHaar` — finiteAdeleHaar is an additive Haar measure; `NumberField.finiteAdeleHaar_smul` — For a finite idele a, map (a * ·) finiteAdeleHaar = (∏_v |a_v|_v)⁻¹ • finiteAdeleHaar.

  Examples: For a nonzero ideal 𝔞 of 𝓞 K, the closure of 𝔞 in ∏_v 𝒪_v has measure (Ideal.absNorm 𝔞)⁻¹. finiteAdeleHaar is not a finite measure: 𝔸_{K,f} is a disjoint union of infinitely many translates of ∏_v 𝒪_v.

  Sources: [Sutherland], §23.3, p. 6. Requires: AA.0.2; Mathlib `IsDedekindDomain.FiniteAdeleRing`; Tau Ceti `IsDedekindDomain.HeightOneSpectrum.isNonarchimedeanLocalField_adicCompletion`; GlobalNumberFields, layer 4; AA.0.1.

- **Normalized Haar measure on the adeles.** For a number field K, the measure μ_𝔸 on 𝔸_K = K_∞ × 𝔸_{K,f} is the product of the measure on K_∞ = ∏_{w|∞} K_w given by Lebesgue measure at real places and twice Lebesgue measure at complex places, and the finite-adele measure finite-adele-haar. Assumptions: K a number field.

  API: `NumberField.adeleHaar` — The normalized Haar measure on 𝔸_K; `NumberField.adeleHaar_isAddHaar` — adeleHaar is an additive Haar measure; `NumberField.adeleHaar_prod` — adeleHaar is the product of the archimedean measure and finiteAdeleHaar; `NumberField.adeleHaar_infinite_eq_mixed` — The archimedean factor is 2^{r₂} times the transport of the mixed-space volume.

  Examples: For K = ℚ the set [0,1) × ∏_p ℤ_p has measure 1. The product of the mixed-space fundamental parallelotope of 𝓞_K (transported to K_∞) with ∏_v 𝒪_v is a fundamental domain for K in 𝔸_K and has measure |d_K|^{1/2}: the archimedean factor is 2^{r₂} times the mixed volume 2^{−r₂}|d_K|^{1/2}. So vol(𝔸_K/K) = |d_K|^{1/2}, which differs from the self-dual value 1 (owned by AL.0) whenever |d_K| > 1; omitting the factor 2 at complex places would give 2^{−r₂}|d_K|^{1/2}.

  Sources: [Sutherland], §23.3, p. 6. Requires: AA.0.4; Mathlib `NumberField.AdeleRing`; AA.0.1; Mathlib `NumberField.mixedEmbedding.volume_fundamentalDomain_stdBasis`; Mathlib `MeasureTheory.Measure.prod`.

- **Normalized Haar measure on the ideles.** For a number field K, the measure d^×x on the idele group 𝔸_K^× is the restricted product, through the topological isomorphism 𝔸_K^× ≅ Πʳ v, [K_v^×, 𝒪_v^×] (finite part) times ∏_{w|∞} K_w^×, of the Haar measures d^×x_v with vol(𝒪_v^×) = 1 at finite places, dx/|x| at real places and 2 dx dy/(x² + y²) at complex places. Assumptions: K a number field.

  API: `NumberField.ideleHaar` — The normalized Haar measure on 𝔸_K^×; `NumberField.ideleHaar_isHaar` — ideleHaar is a Haar measure on the idele group; `NumberField.ideleHaar_units` — ideleHaar of ∏_v 𝒪_v^× times a box at infinity is the archimedean volume of the box; `NumberField.ideleHaar_invariant_principal` — ideleHaar is invariant under multiplication by K^×.

  Examples: For K = ℚ, ideleHaar (∏_p ℤ_p^× × [1,e]) = 1. At a finite place, the measure |dx/x|_v built from the additive normalization gives 𝒪_v^× volume 1 - q_v⁻¹, so ideleHaar is the product of (1 - q_v⁻¹)⁻¹|dx/x|_v. Check for K = ℚ: the set with x_2 ∈ 1 + 4ℤ_2, x_p ∈ ℤ_p^× for odd p and x_∞ ∈ [1, e] has ideleHaar mass (1 − 2⁻¹)⁻¹ · 4⁻¹ = 1/2; without the factor at 2 it would be 1/4.

  Sources: [Sutherland], §23.3, p. 6; [Rosengarten], §1, p. 2. Requires: AA.0.2; Mathlib `NumberField.IdeleGroup`; Mathlib `RestrictedProduct.unitsEquiv`; GlobalNumberFields, layer 6.

- **Products of form measures need convergence factors.** For K = ℚ and ω = dx/x on G_m, the local measures |ω|_p built from the additive normalization μ_p(ℤ_p) = 1 give vol(ℤ_p^×) = 1 - p⁻¹, and ∏_p (1 - p⁻¹) diverges to 0. Hence the family |ω|_p does not satisfy the normalization hypothesis of restricted-haar-product (cofinitely volume 1), and no rescaling by a single constant makes it do so; the Tamagawa measure of G_m uses the convergence factors λ_p = (1 - p⁻¹)⁻¹. Assumptions: K = ℚ; the analogous statement for a number field K uses the pole of the Dedekind zeta function at s = 1.

  Sources: [Rosengarten], §1, p. 2; [Borel], §5.5, p. 21. Requires: AA.0.4; Mathlib `Nat.Primes.not_summable_one_div`; AA.0.2.


## AA.1 — Adelic points of algebraic groups

Equip Hopf-algebra points with their evaluation topology and compare points over the adelic algebra with a restricted product of local groups. Finite presentation controls the choice of integral model. Preserve coefficient naturality, topology and the actual rational diagonal through every comparison.

### AA.1.1 — Affine points and integral models

- **Adelic points of an affine algebraic group.** For a finitely generated commutative Hopf algebra H over a number field F, G(𝔸_F) is the group of F-algebra maps H → 𝔸_F under convolution (TauCeti.HopfAlgebra.points H 𝔸_F), with the topology of affine points over the topological ring 𝔸_F (weakest topology making every evaluation h ↦ x(h) continuous). Likewise G(𝔸_{F,f}), G(F_∞) = G(F ⊗_ℚ ℝ) and G(F_v). The diagonal ι : G(F) → G(𝔸_F) is mapPoints along F → 𝔸_F and the local projection p_v : G(𝔸_F) → G(F_v) is mapPoints along the projection 𝔸_F → F_v. Assumptions: H finitely generated.

  API: `AdelicPoints` — AdelicPoints H := WithConv (H →ₐ[F] 𝔸_F), a group under convolution; `AdelicPoints.instTopologicalSpace` — The affine-points topology: induced from 𝔸_F^H by evaluation; `AdelicPoints.instIsTopologicalGroup` — AdelicPoints H is a topological group; `AdelicPoints.diagonal` — The diagonal G(F) →* AdelicPoints H, mapPoints along algebraMap F 𝔸_F; `AdelicPoints.proj` — For a finite place v, the continuous homomorphism AdelicPoints H →* G(F_v); `AdelicPoints.continuous_eval` — For h ∈ H, x ↦ x h is continuous AdelicPoints H → 𝔸_F; `AdelicPoints.proj_diagonal` — proj v (diagonal g) is the image of g in G(F_v); `AdelicPoints.finiteEmbed` — The finite-supported homomorphism G(𝔸_f)→G(𝔸), x↦(1,x), under the canonical archimedean/finite splitting. This is an embedding of point groups, not a ring inclusion with archimedean coordinate zero; `AdelicPoints.finiteEmbed_finite` — The finite projection of finiteEmbed x equals x; `AdelicPoints.finiteEmbed_infinite` — The infinite projection of finiteEmbed x equals 1.

  Examples: For H = F[T] with additive comultiplication, AdelicPoints H ≃ₜ+ 𝔸_F (see ga-adelic). For H = F[T, T⁻¹] the topology is not the subspace topology of 𝔸_F: the inversion map is not continuous for the subspace topology on 𝔸_F^×.

  Sources: [Conrad], Proposition 2.1, p. 2; [Arthur], §2, p. 11. Requires: Tau Ceti `TauCeti.HopfAlgebra.points`; Tau Ceti `TauCeti.HopfAlgebra.mapPoints`; Tau Ceti `TauCeti.HopfAlgebra.pointsFunctor`; Mathlib `NumberField.AdeleRing`; Mathlib `IsDedekindDomain.FiniteAdeleRing`; Mathlib `RestrictedProduct.evalRingHom`; `ReductiveGroupsPartII:RG2.0`; GlobalNumberFields, layer 4.

- **Integral models over S-integers.** An integral model of H away from a finite set S of places of F (containing the archimedean places) is a finitely presented commutative Hopf algebra 𝓗 over the S-integers 𝒪_{F,S} together with an isomorphism of Hopf algebras F ⊗_{𝒪_{F,S}} 𝓗 ≅ H. For v ∉ S its integral points are 𝓗(𝒪_v) = Hom_{𝒪_{F,S}}(𝓗, 𝒪_v) ⊂ G(F_v). Assumptions: H finitely generated; S a finite set of places containing the archimedean ones.

  API: `IntegralModel` — A finitely presented commutative Hopf algebra over O_{F,S} and a specified Hopf isomorphism of its F-generic fibre with H; S is finite and all infinite places are understood to be included; `IntegralModel.localPoints` — For v ∉ S, the subgroup 𝓗(𝒪_v) of G(F_v); `IntegralModel.enlarge` — For S ⊆ S′, the base-changed model over 𝒪_{F,S′}, with localPoints unchanged at v ∉ S′; `IntegralModel.localPoints_injective` — The map 𝓗(𝒪_v) → G(F_v) induced by the injection 𝒪_v → F_v is injective.

  Examples: For the standard model of GL_n, localPoints v = GL_n(𝒪_v) (invertible determinant), not all integral matrices with nonzero determinant. For G_a (H = F[T]) and the model 𝒪_{F,S}[X] identified with H by X ↦ cT, where c ∈ 𝒪_{F,S} is nonzero, localPoints v is {a ∈ F_v : c·a ∈ 𝒪_v} = c⁻¹𝒪_v. For c = p and v | p (v ∉ S) this is p⁻¹𝒪_v ⊋ 𝒪_v, so the integral points depend on the specified Hopf identification and not only on the abstract Hopf algebra.

  Sources: [Conrad], Remark 3.5 and §3, p. 6. Requires: Tau Ceti `TauCeti.HopfAlgebra.points`; Tau Ceti `TauCeti.CommHopfAlgCat.baseChangePointsMulEquiv`; Mathlib `Set.integer`.

- **Spreading Hopf structure and its identities.** A finitely presented affine F-algebra with Hopf structure descends to a finitely presented Hopf algebra over O_{F,S} after enlarging finite S. A prescribed finite collection of Hopf morphisms and their identities descends simultaneously. Assumptions: integral generic-fibre identifications are Hopf isomorphisms.

  Sources: [Conrad], Theorem 3.4(1)–(2), pp. 5–6; Remark 3.5, p. 6. Requires: Mathlib finite presentation and localization.

- **Spreading out.** Every finitely generated commutative Hopf algebra H over F has an integral model away from some finite set S of places. Assumptions: H finitely generated.

  Sources: [Conrad], Theorem 3.4(1), p. 5. Requires: AA.1.1.

- **Uniqueness of integral models up to enlarging S.** Two integral models 𝓗, 𝓗′ of H (away from S and S′) become isomorphic, compatibly with their identifications with H, after base change to 𝒪_{F,S″} for some finite S″ ⊇ S ∪ S′. Consequently 𝓗(𝒪_v) = 𝓗′(𝒪_v) inside G(F_v) for all but finitely many v. Assumptions: H finitely generated.

  Sources: [Conrad], Theorem 3.4(3), p. 5. Requires: AA.1.1.

- **Integral points are compact open subgroups.** For an integral model 𝓗 away from S and a finite place v ∉ S, 𝓗(𝒪_v) is a compact open subgroup of G(F_v). Assumptions: H finitely generated.

  Sources: [Conrad], Example 2.3, p. 3. Requires: AA.1.1; `ReductiveGroupsPartII:RG2.0`.


### AA.1.2 — Restricted-product realization

- **Points over a product of rings.** For commutative F-algebras R₁, R₂ (and more generally a finite product), WithConv (H →ₐ[F] R₁ × R₂) ≃* WithConv (H →ₐ[F] R₁) × WithConv (H →ₐ[F] R₂), naturally and as topological groups for the affine-points topology. Assumptions: H a commutative Hopf algebra over F.

  Sources: [Conrad], Proposition 2.1, proof, p. 2. Requires: AA.1.1; Mathlib `AlgHom.prod`.

- **Finite adeles as a directed union of S-adeles.** For finite sets S of finite places, the S-adeles 𝔸_{F,S} = ∏_{v∈S} F_v × ∏_{v∉S} 𝒪_v are open subrings of 𝔸_{F,f} forming a directed union, and every F-algebra map H → 𝔸_{F,f} from a finitely generated H restricts to a map of models 𝓗 → 𝔸_{F,S} for S large: G(𝔸_{F,f}) = ⋃_S 𝓗(𝔸_{F,S}). Assumptions: H finitely generated; 𝓗 an integral model; integral generic-fibre identifications are Hopf isomorphisms.

  Sources: [Conrad], Remark 3.5, p. 6. Requires: AA.1.1; Mathlib `RestrictedProduct.isOpenEmbedding_inclusion_principal`.

- **The restricted-product bijection on S-adelic points.** For a fixed affine finitely presented model over O_{F,S}, the evaluation map from its S′-adelic points to ∏_{v∈S′}G(F_v)×∏_{v∉S′}𝓗(O_v), for finite S′⊃S, is a bijection. This is a set and group statement; the topology is proved separately. Assumptions: 𝓗 affine over 𝒪_{F,S}; integral generic-fibre identifications are Hopf isomorphisms.

  Sources: [Conrad], Theorem 3.6, p. 6. Requires: AA.1.1; AA.1.2; `ReductiveGroupsPartII:RG2.0`.

- **Topology of the restricted-product comparison.** The bijection G(A_{F,f})→∏ʳ_v[G(F_v),B_v] induced by coordinate projections is a homeomorphism. On each S-integral principal piece it is the product homeomorphism of affine points, and the principal pieces are open on both sides. Assumptions: integral generic-fibre identifications are Hopf isomorphisms.

  Sources: [Conrad], Theorem 3.6, pp. 7–8; §4, p. 9. Requires: AA.1.2; `ReductiveGroupsPartII:RG2.0`; Mathlib `RestrictedProduct.topologicalSpace_eq_iSup`.

- **Adelic points as a restricted product.** Let 𝓗 be an integral model of H away from S. The map x ↦ (p_v(x))_v is an isomorphism of topological groups G(𝔸_{F,f}) ≃ₜ* Πʳ v, [G(F_v), B_v], where B_v = 𝓗(𝒪_v) for v ∉ S and B_v = G(F_v) for the finitely many finite v ∈ S; and G(𝔸_F) ≃ₜ* G(F_∞) × G(𝔸_{F,f}). Assumptions: H finitely generated; 𝓗 an integral model away from S.

  Sources: [Conrad], Theorem 3.6, p. 6; [Borel], §1.2, p. 7. Requires: AA.1.1; Mathlib `RestrictedProduct.topologicalSpace_eq_iSup`; AA.0.3; `ReductiveGroupsPartII:RG2.0`; AA.1.2.

- **Independence of the model and of the exceptional set.** The topological group structure on Πʳ v, [G(F_v), 𝓗(𝒪_v)] obtained from restricted-product-comparison does not depend on the integral model 𝓗 or on S: for two models the identity of G(𝔸_{F,f}) corresponds to the canonical isomorphism of RestrictedProduct.changeSubgroups, and enlarging S does not change it. Assumptions: H finitely generated.

  Sources: [Conrad], Theorem 3.6, p. 6. Requires: AA.1.2; AA.1.1; AA.0.3.

- **Adelic groups are locally compact.** G(𝔸_F), G(𝔸_{F,f}) and G(F_∞) are second countable, locally compact, Hausdorff topological groups. Assumptions: H finitely generated.

  Sources: [Borel], §1.2, p. 7. Requires: AA.1.2; Mathlib `RestrictedProduct.locallyCompactSpace_of_group`; AA.0.1; `ReductiveGroupsPartII:RG2.0`; GlobalNumberFields, layer 5.

- **Splitting off finitely many places.** For a finite set S of places, G(𝔸_F) ≃ₜ* G(F_S) × G(𝔸_F^S), with G(F_S) = ∏_{v∈S} G(F_v) and G(𝔸_F^S) the adelic points away from S; in particular G(𝔸_F) ≃ₜ* G(F_∞) × G(𝔸_{F,f}). The diagonal G(F) maps to the pair of diagonals. Assumptions: H finitely generated.

  Sources: [Borel], §1.2, p. 7. Requires: AA.1.2; AA.0.3.


### AA.1.3 — Rational points and functoriality

- **Rational points are discrete in the full adeles.** The diagonal G(F) → G(𝔸_F) is injective, its image is a discrete subgroup, and the image is closed. Assumptions: H finitely generated.

  Sources: [Conrad], Example 2.3, p. 3; [Borel], §1.2, p. 7. Requires: AA.1.1; Tau Ceti `TauCeti.GlobalNumberFields.discreteTopology_principalSubgroup`; Tau Ceti `TauCeti.GlobalNumberFields.isClosed_principalSubgroup`; Mathlib `Subgroup.isClosed_of_discrete`; Tau Ceti `NumberField.AdeleRing.instT2Space`; `ReductiveGroupsPartII:RG2.0`.

- **Discreteness in the finite adeles alone.** G(F) is discrete in G(𝔸_{F,f}) if and only if G(F) ∩ U is finite for one (equivalently every) compact open subgroup U ⊂ G(𝔸_{F,f}). In particular G_a(F) = F is not discrete in 𝔸_{F,f}, SL_2(ℚ) is not discrete in SL_2(𝔸_{ℚ,f}) because SL_2(ℤ) is infinite, and ℚ^× is discrete in 𝔸_{ℚ,f}^× because ℚ^× ∩ ∏_p ℤ_p^× = {±1}. Assumptions: H finitely generated.

  Sources: [Borel], §1.8, p. 9. Requires: AA.1.3; AA.1.2.

- **Functoriality of adelic points.** A homomorphism of affine algebraic groups φ : G → G′ over F (a Hopf algebra map φ* : H′ → H) induces a continuous homomorphism φ_𝔸 : G(𝔸_F) → G′(𝔸_F), x ↦ x ∘ φ*, commuting with the diagonals and with the local projections, with (id)_𝔸 = id and (ψ ∘ φ)_𝔸 = ψ_𝔸 ∘ φ_𝔸. Under restricted-product-comparison it is the restricted product of the local maps φ_v, which send 𝓗(𝒪_v) into 𝓗′(𝒪_v) for almost all v. Assumptions: H finitely generated; φ a homomorphism of affine algebraic groups over F.

  API: `AdelicPoints.map` — AdelicPoints.map φ : AdelicPoints H →* AdelicPoints H′ for a Hopf algebra map H′ → H; `AdelicPoints.continuous_map` — AdelicPoints.map φ is continuous; `AdelicPoints.map_id` — AdelicPoints.map (id) = id; `AdelicPoints.map_comp` — AdelicPoints.map (φ ∘ ψ) = AdelicPoints.map ψ ∘ AdelicPoints.map φ (contravariance on Hopf algebras); `AdelicPoints.map_diagonal` — map φ (diagonal g) = diagonal (φ g); `AdelicPoints.proj_map` — proj v ∘ map φ = φ_v ∘ proj v.

  Examples: For GL₁, the adelic determinant point map corresponds under the canonical GL₁-to-units identification to the identity on the idele group; explicitly its G_m unit is the one-by-one matrix determinant. For G_m over ℚ the image (𝔸_ℚ^×)² is closed and has infinite index. It is not open: every basic identity neighbourhood allows arbitrary units at almost all odd primes, including nonsquare units. Thus the adelic squaring map need not be surjective or open.

  Sources: [Borel], §1.3, p. 7. Requires: AA.1.1; Tau Ceti `TauCeti.CommHopfAlgCat.pointsFunctor`; AA.1.2; Mathlib `RestrictedProduct.mapAlong_continuous`; Tau Ceti `TauCeti.GeneralLinear.determinantCoordinateMap`; Tau Ceti `TauCeti.GeneralLinear.pointsMulEquiv_determinantPoints`.

- **Closed subgroups give closed embeddings.** If H′ = H/I for a Hopf ideal I (a closed subgroup G′ ⊂ G), the induced map G′(𝔸_F) → G(𝔸_F) is a closed embedding of topological groups with image quotientPointsSubgroup H I 𝔸_F. Assumptions: H finitely generated; I a Hopf ideal of H.

  Sources: [Conrad], Proposition 2.1, p. 2. Requires: AA.1.3; Tau Ceti `TauCeti.CommHopfAlgCat.quotientPointsSubgroup`; `ReductiveGroupsPartII:RG2.0`; Tau Ceti `NumberField.AdeleRing.instT2Space`.

- **Products of groups.** For affine algebraic groups G, G′ over F, (G × G′)(𝔸_F) ≃ₜ* G(𝔸_F) × G′(𝔸_F), compatibly with diagonals and local projections. Assumptions: H finitely generated.

  Sources: [Conrad], Proposition 2.1, proof, p. 2. Requires: AA.1.1; Tau Ceti `TauCeti.AffineGroup.Product.pointsMulEquiv`; `ReductiveGroupsPartII:RG2.0`.

- **The centre on adelic points.** Let Z ⊂ G be the centre (centerDefiningIdeal). Then Z(𝔸_F) is a closed subgroup of G(𝔸_F) contained in the centre of G(𝔸_F), and Z(F) = Z(𝔸_F) ∩ G(F). Assumptions: H finitely generated.

  Sources: [Borel], §1.6, p. 8. Requires: AA.1.3; Tau Ceti `TauCeti.CommHopfAlgCat.centerDefiningIdeal`; Tau Ceti `TauCeti.CommHopfAlgCat.centerPointsSubgroup_eq_center`.


### AA.1.4 — Restriction of scalars and concrete groups

- **Local factors of restriction of scalars.** Under base-change-adelic, the projection to F_v corresponds to Res(F_v) ≃ ∏_{w|v} G_E(E_w), and for almost all v the integral points of a model of Res correspond to ∏_{w|v} 𝓗_E(𝒪_w). Assumptions: E/F finite; G_E affine over E; The Weil restriction and the completion/adelic base-change maps are the natural adjunction and canonical tensor-product maps; arbitrary point equivalences are excluded; integral generic-fibre identifications are Hopf isomorphisms.

  Sources: [Borel], §1.4, p. 8. Requires: AA.1.4; GlobalNumberFields, layer 8; `ReductiveGroupsPartII:RG2.0a`.

- **Naturality of adelic restriction of scalars.** For the Weil-restriction adjunction Res_{E/F}G(R)≃G(E⊗_F R), the adelic comparison commutes with every algebraic group morphism, the diagonal F→A_F, projections to F_v, and the canonical tensor associator for towers E/F/k. Assumptions: k ⊆ F ⊆ E number fields with E/F and F/k finite; G_E an affine algebraic group over E (finite-type commutative Hopf E-algebra) and morphisms G_E → G′_E over E; Res_{E/F} with its natural point adjunction from RG2.0a; the canonical continuous isomorphism E ⊗_F 𝔸_F ≅ 𝔸_E and its local factors from GlobalNumberFields layer 8.

  Sources: [Conrad], Examples 2.4 and 4.2, pp. 3 and 9–10. Requires: AA.1.4; `ReductiveGroupsPartII:RG2.0a`; GlobalNumberFields, layer 8.

- **Restriction of scalars on adelic points.** For a finite extension E/F and an affine algebraic group G_E over E, with Res = Res_{E/F} G_E, there is an isomorphism of topological groups Res(𝔸_F) ≃ₜ* G_E(𝔸_E), natural in G_E, compatible with Res(F) = G_E(E) on diagonals. Assumptions: E/F a finite extension of number fields; G_E an affine algebraic group over E; The Weil restriction and the completion/adelic base-change maps are the natural adjunction and canonical tensor-product maps; arbitrary point equivalences are excluded; integral generic-fibre identifications are Hopf isomorphisms.

  API: `AdelicPoints.resEquiv` — The isomorphism of topological groups Res_{E/F}(G_E)(𝔸_F) ≃ₜ* G_E(𝔸_E); `AdelicPoints.resEquiv_diagonal` — resEquiv carries the diagonal of Res(F) to the diagonal of G_E(E); `AdelicPoints.resEquiv_natural` — resEquiv is natural in homomorphisms G_E → G′_E; `AdelicPoints.resEquiv_trans` — In a tower F ⊂ E ⊂ L, resEquiv for L/F is the composite of those for L/E and E/F.

  Examples: For G_E = G_m, resEquiv is 𝔸_E^× ≃ (E ⊗ 𝔸_F)^×. Res_{E/F}(G_E) is not the base change of G_E: for E = ℚ(i), Res G_m(ℚ) = ℚ(i)^× while G_m(ℚ) = ℚ^×.

  Sources: [Conrad], Example 4.2, p. 10; [Arthur], §2, p. 11. Requires: AA.1.1; `ReductiveGroupsPartII:RG2.0a`; GlobalNumberFields, layer 8.

- **The additive group.** For G = G_a (H = F[T] with T primitive), G(𝔸_F) ≃ₜ+ 𝔸_F, the diagonal is algebraMap F 𝔸_F and restricted-product-comparison recovers FiniteAdeleRing as a restricted product.

  Sources: [Arthur], §2, p. 11. Requires: AA.1.1; Mathlib `NumberField.AdeleRing`; Mathlib `IsDedekindDomain.FiniteAdeleRing`.

- **The multiplicative group and the ideles.** For G = G_m, G(𝔸_F) ≃ₜ* NumberField.IdeleGroup (𝓞 F) F = 𝔸_F^× with the units topology, and under restricted-product-comparison the finite part is Πʳ v, [F_v^×, 𝒪_v^×] via RestrictedProduct.unitsEquiv.

  Sources: [Borel], §1.3, p. 7. Requires: AA.1.1; Tau Ceti `TauCeti.MultiplicativeGroup.pointsMulEquiv`; Mathlib `NumberField.IdeleGroup`; Mathlib `RestrictedProduct.unitsEquiv`; GlobalNumberFields, layer 6.

- **The general linear group.** For G = GL_n, G(𝔸_F) ≃ₜ* GL_n(𝔸_F) = (Matrix (Fin n) (Fin n) 𝔸_F)ˣ with the units topology, and its finite part is the restricted product Πʳ v, [GL_n(F_v), GL_n(𝒪_v)]. Assumptions: n ≥ 1.

  Sources: [Arthur], §2, p. 11. Requires: AA.1.1; Tau Ceti `TauCeti.GeneralLinear.pointsMulEquiv`; AA.1.2; AA.1.4.


### AA.1.5 — Unimodularity and compact open levels

- **The modular character on compact and central elements.** For a locally compact group G, the modular character Δ : G → ℝ_{>0} is a homomorphism trivial on every compact subgroup and on the centre of G, and it is invariant under conjugation. Assumptions: G locally compact.

  Sources: [Borel], §5.5, p. 20. Requires: Mathlib `MeasureTheory.Measure.modularCharacter`; Mathlib `MeasureTheory.Measure.map_right_mul_eq_modularCharacterFun_smul`.

- **Weyl orbit products lie in the split centre up to finite index.** Let A be a maximal split torus of a connected reductive group over a field and W its relative Weyl group. For a ∈ A(E), the product ∏_{w∈W} w(a) lies in (Z(G) ∩ A)(E) up to an element of a finite group; in particular some power of it lies in the split centre.

  Sources: [Borel], §5.5, p. 20. Requires: `ReductiveGroupsPartII:RG2.4`; `ReductiveGroupsPartII:RG2.1`; ReductiveGroups, layer 7.

- **Local unimodularity of reductive groups.** For a connected reductive group G over a local field E of characteristic 0, the locally compact group G(E) is unimodular. Assumptions: E a local field of characteristic 0.

  Sources: [Borel], §5.5, p. 20. Requires: Mathlib `MeasureTheory.Measure.modularCharacter`; `ReductiveGroupsPartII:RG2.4`; RepresentationTheory/LieGroups, layer 9; AA.1.5.

- **Adelic groups of reductive groups are unimodular.** For a connected reductive group G over a number field F, G(𝔸_F), G(𝔸_{F,f}) and G(F_∞) are unimodular.

  Sources: [Borel], §5.5, p. 20. Requires: AA.1.5; AA.0.3; AA.1.2.

- **Compact open subgroups and product levels.** Every compact open subgroup U ⊂ G(𝔸_{F,f}) contains a product subgroup ∏_v U_v with U_v ⊂ G(F_v) compact open and U_v = 𝓗(𝒪_v) for all but finitely many v, and is contained in such a product; any two compact open subgroups are commensurable. Assumptions: H finitely generated.

  Sources: [Borel], §1.7, p. 8. Requires: AA.1.2; AA.0.1; `ReductiveGroupsPartII:RG2.0`.

- **Conjugation changes a level at finitely many places.** For g ∈ G(𝔸_{F,f}) and an integral model 𝓗, g_v ∈ 𝓗(𝒪_v) for all but finitely many v; hence for a product level U = ∏_v U_v, the conjugate gUg⁻¹ = ∏_v g_v U_v g_v⁻¹ agrees with U at all but finitely many v, and the element g can be written as g_B · u with g_B supported on a finite set B of places and u ∈ ∏_v 𝓗(𝒪_v). Assumptions: H finitely generated.

  Sources: [Borel], §1.2, p. 7. Requires: AA.1.2; AA.1.5.


## AA.2 — Characters, quotient measures and Tamagawa measures

The character lattice separates the positive split centre from the norm-one subgroup. Develop right-Haar quotient integration before applying it to rational and central quotients. Gauge forms and convergence factors then fix a global normalization which respects the product formula and restriction of scalars.

### AA.2.1 — Characters, logarithms and the split centre

- **F-rational characters.** X*_F(G) is the group of homomorphisms G → G_m defined over F, realized as the group-like elements χ ∈ H (Δχ = χ ⊗ χ, ε(χ) = 1) under multiplication; χ acts on points by x ↦ x(χ) ∈ R^×. Equivalently, X*_F(G) is the Galois-fixed subgroup of the geometric character group X*(G_{F̄}). Assumptions: G = Spec H an affine algebraic group over F, H finitely generated.

  API: `RationalCharacter` — RationalCharacter H := GroupLike F H, a commutative group; `RationalCharacter.apply` — For χ and a point x : H →ₐ[F] R, χ x := x χ ∈ Rˣ; `RationalCharacter.apply_mul` — χ (x * y) = χ x * χ y for the convolution product; `RationalCharacter.equivHom` — RationalCharacter H ≃* (Hopf maps F[T,T⁻¹] → H); `RationalCharacter.toGeometric_injective` — Base change to an algebraic closure injects rational characters into Tau Ceti’s geometric character group; `RationalCharacter.free` — For finite-type smooth geometrically reduced and geometrically connected G, its rational character group is free abelian of finite rank; `RationalCharacter.toGeometric_range` — Over a number field F, the image of rational characters in the geometric character group is exactly the subgroup fixed by Field.absoluteGaloisGroup F.

  Examples: For n≥1, X*_F(GL_n)≃ℤ and the actual generic determinant is sent to 1, so every character is its unique integral power. For E = ℚ(i), the rational characters of Res_{E/ℚ} G_m have rank 1, not the rank 2 of the geometric character group.

  Sources: [Arthur], §3, p. 16; [Borel], §1.3, p. 7. Requires: Mathlib `GroupLike`; Mathlib `GroupLike.instCommGroup`; Tau Ceti `TauCeti.CommHopfAlgCat.geometricCharacterGroup`; Tau Ceti `TauCeti.CommHopfAlgCat.instGeometricCharacterGroupGaloisAction`; Tau Ceti `TauCeti.GeneralLinear.determinantGroupLike`; Tau Ceti `TauCeti.GeneralLinear.pointsMulEquiv_determinantPoints`.

- **Rational characters form a lattice.** For geometrically connected G, X*_F(G) is a free abelian group of finite rank. For connected reductive G, restriction of F-rational characters to the identity component of the centre is injective with finite cokernel (Borel 5.9). Assumptions: G = Spec H an affine algebraic group over F, H finitely generated; G geometrically connected; G smooth and geometrically reduced (automatic for reduced finite-type characteristic-zero algebraic groups through the characteristic-zero smoothness bridge of RG2.0).

  Sources: [Borel], Lemma 5.9, p. 22; [Arthur], §5, p. 24. Requires: AA.2.1; Tau Ceti `TauCeti.CommHopfAlgCat.isMulTorsionFree_geometricCharacterGroup`; ReductiveGroups, layer 4; Tau Ceti `TauCeti.geometricallyReducedCommHopfAlgProperty`; Tau Ceti `TauCeti.geometricallyConnectedCommHopfAlgProperty`.

- **The real vector space a_G.** a_G = Hom_ℤ(X*_F(G), ℝ), a finite-dimensional real vector space, with dual a_G^* = X*_F(G) ⊗_ℤ ℝ and complexification a_{G,ℂ}^* = X*_F(G) ⊗ ℂ. A homomorphism G → G′ induces a linear map a_G → a_{G′}. Assumptions: G = Spec H an affine algebraic group over F, H finitely generated; G geometrically connected.

  API: `RealCharacterSpace` — RealCharacterSpace H = Hom_ℤ(Additive X*_F(G), ℝ), with scalar multiplication on the codomain and the finite-dimensional topology from rational-characters-free; `RealCharacterSpace.pairing` — The pairing a_G × X*_F(G) → ℝ; `RealCharacterSpace.finrank` — finrank ℝ a_G = rank of X*_F(G); `RealCharacterSpace.map` — A coordinate Hopf map H′→H gives the linear map a_G→a_{G′} by precomposition with character pullback; `RealCharacterSpace.map_id` — The map induced by the identity coordinate Hopf map is the identity on a_G; `RealCharacterSpace.map_comp` — For coordinate Hopf maps φ:H′→H and ψ:H″→H′, map(φ∘ψ)=map(ψ)∘map(φ).

  Examples: For GL_n with n≥1, its rational character lattice is ℤ·det and a_G has real dimension 1. For E = ℚ(i) and G = Res_{E/ℚ} G_m, finrank a_G = 1, not 2.

  Sources: [Arthur], §3, p. 16. Requires: AA.2.1.

- **The Harish-Chandra map H_G.** H_G : G(𝔸_F) → a_G is the continuous homomorphism with ⟨H_G(x), χ⟩ = log ‖χ(x)‖ for χ ∈ X*_F(G), where χ(x) = χ_𝔸(x) ∈ 𝔸_F^× and ‖·‖ is the idele norm ∏_v |·|_v. Assumptions: G = Spec H an affine algebraic group over F, H finitely generated; G geometrically connected.

  API: `AdelicPoints.logHeight` — logHeight : AdelicPoints H →* Multiplicative a_G (an additive map to a_G); `AdelicPoints.logHeight_apply` — ⟪logHeight x, χ⟫ = Real.log ‖χ x‖; `AdelicPoints.continuous_logHeight` — logHeight is continuous; `AdelicPoints.logHeight_diagonal` — logHeight (diagonal g) = 0 (product formula); `AdelicPoints.logHeight_map` — logHeight ∘ map φ = a(φ) ∘ logHeight; `AdelicPoints.logHeight_compact` — logHeight vanishes on every compact subgroup.

  Examples: For G = G_m, logHeight is log of the idele norm. logHeight is not computed from the archimedean component alone: for F = ℚ, the ideles 1 and (p at the place p, 1 elsewhere) have the same archimedean component but norms 1 and p⁻¹.

  Sources: [Arthur], §3, p. 16. Requires: AA.2.1; AA.1.3; AA.1.4; GlobalNumberFields, layer 6; Tau Ceti `TauCeti.GlobalNumberFields.normalizedAbsValue`.

- **H_G vanishes on rational points.** For g ∈ G(F), H_G(g) = 0. Assumptions: G = Spec H an affine algebraic group over F, H finitely generated.

  Sources: [Arthur], §3, p. 16. Requires: AA.2.1; Tau Ceti `TauCeti.GlobalNumberFields.finprod_normalizedAbsValue_eq_one`; Mathlib `NumberField.prod_abs_eq_one`.

- **The norm-one subgroup G(𝔸)^1.** G(𝔸_F)^1 = ker H_G = ⋂_{χ ∈ X*_F(G)} ker ‖χ‖, a closed normal subgroup of G(𝔸_F) containing G(F), every compact subgroup and the commutator subgroup. Assumptions: G = Spec H an affine algebraic group over F, H finitely generated; G geometrically connected.

  API: `AdelicPoints.normOne` — normOne H : Subgroup (AdelicPoints H) := logHeight.ker; `AdelicPoints.isClosed_normOne` — normOne is closed; `AdelicPoints.normOne_normal` — normOne is normal; `AdelicPoints.diagonal_mem_normOne` — diagonal g ∈ normOne; `AdelicPoints.mem_normOne_iff` — x ∈ normOne iff ‖χ x‖ = 1 for every rational character χ; `AdelicPoints.normOne_eq_top_of_no_characters` — If X*_F(G) = 0 then normOne = ⊤.

  Examples: For G_m, normOne is the norm-one idele subgroup of GlobalNumberFields layer 6. normOne is not G(F_∞)^1 × G(𝔸_f): for GL_1(𝔸_ℚ) the idele (p_∞ = p, p_p = p, 1 elsewhere) has norm 1 but its archimedean component has |p|_∞ ≠ 1.

  Sources: [Arthur], §3, p. 16; [Borel], §5.8, p. 22. Requires: AA.2.1.

- **The split component A_G.** Let G₁ = Res_{F/ℚ} G. A_G is the largest ℚ-split torus in the centre of G₁, and A_G(ℝ)^0 ⊂ G₁(ℝ) = G(F ⊗ ℝ) = G(F_∞) ⊂ G(𝔸_F) the identity component of its real points, isomorphic to (ℝ_{>0})^k with k = rank X*_F(G). Assumptions: G a connected reductive group over F.

  API: `SplitComponent` — The subgroup A_G(ℝ)^0 of AdelicPoints H (supported at the archimedean places); `SplitComponent.logHeight_equiv` — logHeight restricts to an isomorphism of topological groups A_G(ℝ)^0 ≃ a_G; `SplitComponent.central` — A_G(ℝ)^0 is central in G(𝔸); `SplitComponent.inter_normOne` — A_G(ℝ)^0 ∩ G(𝔸)^1 = {1}.

  Examples: For GL_n, a_G is one-dimensional and SplitComponent (the positive real scalars at ∞ for F = ℚ) is homeomorphic to ℝ. For G_m over a number field F, a_G and SplitComponent are one-dimensional, whereas (F ⊗ ℝ)^×_{>0} has dimension r₁ + r₂: for F real quadratic the anti-diagonal direction is not split over ℚ.

  Sources: [Arthur], §3, pp. 15–16; [Borel], §1.5, Proposition, p. 8. Requires: AA.2.1; AA.1.4; AA.1.3.

- **H_G on the split centre.** The restriction of H_G to A_G(ℝ)^0 is an isomorphism of topological groups onto a_G; in particular H_G is surjective. Assumptions: G a connected reductive group over F.

  Sources: [Arthur], (5.1), p. 24. Requires: AA.2.1.

- **G(𝔸) = G(𝔸)^1 × A_G(ℝ)^0.** Multiplication G(𝔸_F)^1 × A_G(ℝ)^0 → G(𝔸_F) is an isomorphism of topological groups. Assumptions: G a connected reductive group over F.

  Sources: [Arthur], §3, p. 16. Requires: AA.2.1.

- **Two normalizations of the quotient.** The inclusion G(𝔸_F)^1 → G(𝔸_F) induces a homeomorphism G(F)\G(𝔸_F)^1 ≃ G(F)\G(𝔸_F)/A_G(ℝ)^0, equivariant for G(𝔸_F)^1 acting on the right; it is a theorem, not a definitional identity, and it fails if A_G(ℝ)^0 is replaced by a larger central subgroup such as Z(F_∞)^0. Assumptions: G a connected reductive group over F.

  Sources: [Arthur], §6, p. 30. Requires: AA.2.1; AA.1.3.


### AA.2.2 — Parabolic modulus and homogeneous integration

- **Modulus character of a parabolic.** For an F-parabolic P = M_P N_P of G (or any F-group with a normal unipotent F-subgroup N), δ_P : P(𝔸_F) → ℝ_{>0} is δ_P(p) = ‖det(Ad(p) | Lie N_P)‖, the idele norm of the determinant of the adjoint action on Lie N_P ⊗ 𝔸_F. It factors as ∏_v δ_{P,v}, is trivial on N_P(𝔸) and P(F), and δ_P(p) = e^{⟨2ρ_P, H_P(p)⟩}. Assumptions: G a connected reductive group over F; P an F-parabolic with unipotent radical N_P (Tau Ceti dynamic parabolic P(λ) for an F-cocharacter λ).

  API: `Parabolic.modulus` — Parabolic.modulus P : P(𝔸) →* ℝ≥0, p ↦ ‖det (Ad p | Lie N_P)‖; `Parabolic.modulus_apply_local` — modulus p = ∏ᶠ v, |det(Ad p_v | Lie N_P ⊗ F_v)|_v; `Parabolic.modulus_rational` — modulus (diagonal p) = 1 for p ∈ P(F); `Parabolic.modulus_unipotent` — modulus n = 1 for n ∈ N_P(𝔸); `Parabolic.modulus_eq_exp_rho` — modulus p = exp ⟨2ρ_P, H_P p⟩.

  Examples: For the Borel of GL_2, modulus (diag(a,d) * n) = ‖a/d‖. For the Borel of GL_2, modulus ≠ ‖det‖: at diag(a,1) with ‖a‖ = 2 both equal 2, but at diag(1,d) with ‖d‖ = 2, modulus = 1/2 while ‖det‖ = 2.

  Sources: [Arthur], §5, p. 25. Requires: AA.2.1; Tau Ceti `TauCeti.Cocharacter.parabolic`; Tau Ceti `TauCeti.Cocharacter.unipotent`; Tau Ceti `TauCeti.Cocharacter.leviDecompositionMulEquiv`; Tau Ceti `Derivation.adjointPointRepresentation`.

- **Modular function of P(𝔸).** For a parabolic P of a connected reductive G over a number field F, Mathlib's modular character (map (·p) μ_l = Δ(p)μ_l) on P(𝔸_F) is δ_P. With mutually inversion-normalized left and right Haar measures, dμ_l(p)=δ_P(p)⁻¹dμ_r(p). For a proper parabolic δ_P is nontrivial; for P=G it is 1.

  Sources: [Arthur], §5, p. 25. Requires: AA.2.2; AA.1.5; AA.1.3; Tau Ceti `TauCeti.Cocharacter.leviDecompositionMulEquiv`; Mathlib `MeasureTheory.Measure.modularCharacter`; AA.0.3.

- **Topology of a closed homogeneous quotient.** For a second countable locally compact Hausdorff group G and closed H, the left-orbit quotient H\G with its quotient topology is locally compact, Hausdorff and second countable; q:G→H\G is open. Over each compact subset of H\G there is a compact subset of G whose image contains it. Assumptions: G a second countable locally compact Hausdorff topological group; H ≤ G a closed subgroup acting by left multiplication; H\G the orbit space with the quotient topology and q : G → H\G the projection.

  Sources: [Arthur], §1, pp. 7–9; [BHV], Appendix B.1, Lemma B.1.1, pp. 343–344. Requires: Mathlib locally compact groups and quotient topology.

- **Continuity and support of fibre averaging.** For f∈C_c(G,ℝ) and a right Haar dh on closed H, P f(Hg)=∫_H f(hg)dh is a continuous compactly supported function on H\G, with support contained in q(support f). It preserves positivity. Assumptions: G a second countable locally compact Hausdorff group; H ≤ G a closed subgroup; dh a right Haar measure on H; f ∈ C_c(G, ℝ).

  Sources: [Arthur], §1, pp. 7–9; [BHV], Appendix B.1, Lemma B.1.2, p. 344. Requires: AA.2.2.

- **A cutoff over a compact part of the quotient.** For compact C⊂H\G there is β∈C_c(G,ℝ), β≥0, with Pβ=1 on C. Assumptions: G a second countable locally compact Hausdorff group; H ≤ G a closed subgroup with a right Haar measure dh; P the fibre average of fibre-average-continuous; C ⊂ H\G compact.

  Sources: [Arthur], §1, pp. 7–9; [BHV], Appendix B.1, Lemma B.1.2 and its proof, p. 344. Requires: AA.2.2.

- **Averaging over a closed subgroup is surjective on compact supports.** For a closed subgroup H of a locally compact group G and a right Haar measure dh on H, the map P : C_c(G) → C_c(H\G), (Pf)(Hg) = ∫_H f(hg) dh, is surjective, and every f ≥ 0 in C_c(H\G) is Pφ for some φ ≥ 0. Assumptions: G locally compact Hausdorff; H closed; dh a right Haar measure on H.

  Sources: [Arthur], §1, p. 7; [BHV], Appendix B.1, Lemma B.1.2 and its proof, p. 344. Requires: AA.2.2.

- **The right-Haar exchange identity.** Assume Δ_G(h)=Δ_H(h) for h∈H, and dg,dh are right Haar measures. For f,β∈C_c(G), ∫_G β(g)Pf(Hg)dg = ∫_G f(g)Pβ(Hg)dg. Assumptions: G a second countable locally compact Hausdorff group; H ≤ G a closed subgroup; dg and dh right Haar measures on G and H; Δ_G(h) = Δ_H(h) for h ∈ H in the Mathlib modularCharacter convention; f, β ∈ C_c(G, ℝ).

  Sources: [Arthur], §1, pp. 7–9; [BHV], Appendix B.1, Lemma B.1.3, pp. 344–346. Requires: AA.2.2; Mathlib `MeasureTheory.Measure.modularCharacter`; Mathlib `MeasureTheory.integral_prod`.

- **Weil's functional is well defined under the modular condition.** If Δ_G|_H = Δ_H, then for f ∈ C_c(G), Pf = 0 implies ∫_G f dg = 0; hence Pf ↦ ∫_G f dg is a well-defined positive G-invariant functional on C_c(H\G). Assumptions: G locally compact Hausdorff; H a closed subgroup; dg and dh right Haar measures; Δ_G|_H = Δ_H, using the pinned Mathlib modular-character convention.

  Sources: [Arthur], §1, p. 9; [BHV], Appendix B.1, Lemma B.1.3, pp. 344–346. Requires: AA.2.2.

- **Invariant measure on a coset space.** Let G be a second countable locally compact group, H ≤ G a closed subgroup with Δ_G|_H = Δ_H, and dg, dh right Haar measures. There is a unique G-invariant Radon measure dġ on the right coset space H\G with ∫_G f(g) dg = ∫_{H\G} ∫_H f(hg) dh dġ for every f ∈ C_c(G). Assumptions: G second countable locally compact Hausdorff group; H closed subgroup; Δ_G restricted to H equals Δ_H; dg and dh are right Haar measures; invariance means the right G-action on H\G.

  API: `QuotientMeasure.measure` — The measure on H\G given dg, dh and the modular condition; `QuotientMeasure.integral_eq` — ∫_G f dg = ∫_{H\G} ∫_H f(hg) dh dġ for f ∈ C_c(G); `QuotientMeasure.invariant` — The measure is invariant under the right action of G; `QuotientMeasure.unique` — Any G-invariant Radon measure on H\G is a scalar multiple; `QuotientMeasure.smul_left` — Replacing dh by c • dh replaces dġ by c⁻¹ • dġ.

  Examples: For H=⊥ with its normalized counting measure, the quotient measure transported to G equals dg. For G=SL₂(ℝ) and H its upper triangular Borel, Δ_G|H≠Δ_H; the canonical homogeneous quotient ℙ¹(ℝ) has no nonzero invariant Radon measure.

  Sources: [Arthur], §1, p. 7; [Borel], §5.6, p. 21; [BHV], Appendix B.1, Lemma B.1.3 and Corollary B.1.7, pp. 344–346 and 349–350. Requires: AA.2.2; Mathlib `RealRMK.integral_rieszMeasure`; Mathlib `MeasureTheory.Measure.ext_of_integral_eq_on_compactlySupported`; Mathlib `MeasureTheory.Measure.isMulLeftInvariant_eq_smul`.

- **Tonelli extension of quotient integration.** For a nonnegative Borel function f on G in the modular-compatible right-Haar setting, fibre integration is measurable on H\G and ∫_G f = ∫_{H\G}∫_H f(hg)dh. The identity is valid in [0,∞]. Assumptions: G a second countable locally compact Hausdorff group; H ≤ G closed; dg, dh right Haar measures with Δ_G|_H = Δ_H; dġ the quotient measure of quotient-measure; f : G → [0, ∞] Borel.

  Sources: [Arthur], §1, pp. 7–9. Requires: AA.2.2.

- **Weil's formula for integrable functions.** In the setting of quotient-measure, for f ∈ L¹(G), the function h ↦ f(hg) is integrable on H for almost every Hg, the function Hg ↦ ∫_H f(hg) dh is integrable on H\G, and ∫_G f dg = ∫_{H\G} ∫_H f(hg) dh dġ.

  Sources: [Arthur], §1, p. 9. Requires: AA.2.2.

- **Quotient measures in stages.** For closed subgroups H₁ ≤ H₂ ≤ G satisfying the modular conditions, the quotient measure on H₁\G is the product of those on H₂\G and H₁\H₂: ∫_{H₁\G} f = ∫_{H₂\G} ∫_{H₁\H₂} f(hg) dh dg. Assumptions: G a second countable locally compact Hausdorff group; H₁ ≤ H₂ ≤ G closed subgroups; right Haar measures on G, H₂, H₁ with Δ_G = Δ_{H₂} on H₂ and Δ_{H₂} = Δ_{H₁} on H₁.

  Sources: [Arthur], §1, p. 9. Requires: AA.2.2.

- **Inversion between left and right quotient conventions.** For a locally compact unimodular G and discrete countable Γ, inversion sends Γg to g⁻¹Γ, giving a homeomorphism Γ\G≃G/Γ that preserves the correspondingly normalized quotient measures. It carries left-orbit unfolding to the pinned right Γ.op-orbit unfolding. Assumptions: G second countable locally compact Hausdorff and unimodular; Γ a countable discrete subgroup; normalized Haar μ is left and right invariant; Use the fundamental-domain quotient measures and the integrability/measurability hypotheses of the pinned theorem.

  Sources: [Arthur], §1, p. 7. Requires: Mathlib `QuotientGroup.integral_eq_integral_automorphize`; Mathlib `MeasureTheory.IsFundamentalDomain.quotientMeasure_eq`; Mathlib `MeasureTheory.QuotientMeasureEqMeasurePreimage`.


### AA.2.3 — Rational quotients and central-character L²

- **Borel fundamental domains for countable discrete subgroups.** Let G be a second countable locally compact Hausdorff group and Γ ≤ G a countable discrete subgroup acting by left translation. There is a Borel set D ⊂ G meeting every orbit Γg in exactly one point. Assumptions: G second countable locally compact Hausdorff; Γ countable and discrete.

  Sources: [Borel], Definition 4.1, p. 17. Requires: Mathlib `MeasureTheory.IsFundamentalDomain`.

- **Fundamental domains for rational points.** G(F) acting on G(𝔸_F) (or G(𝔸_F)^1) by left translation admits a Borel fundamental domain; the quotient measure on G(F)\G(𝔸_F) equals the pushforward of the restriction of Haar measure to any measurable fundamental domain, and does not depend on the choice. Assumptions: G = Spec H an affine algebraic group over F, H finitely generated; G(𝔸_F) (resp. G(𝔸_F)^1) unimodular, for instance G connected reductive (AA.1.5 and split-centre-decomposition); then Haar measure is invariant under left translation by G(F).

  Sources: [Borel], Definition 4.1, p. 17. Requires: AA.1.3; AA.1.2; Mathlib `MeasureTheory.IsFundamentalDomain.quotientMeasure_eq`; Mathlib `MeasureTheory.QuotientMeasureEqMeasurePreimage`; AA.2.2; AA.2.3.

- **The measure on the automorphic quotient.** For connected reductive G with a Haar measure dx on G(𝔸_F) and Lebesgue measure on a_G (normalized by the lattice dual to X*_F(G)), the measure on [G]^1 = G(F)\G(𝔸_F)^1 is the quotient (quotient-measure) of the measure on G(𝔸)^1 induced via split-centre-decomposition, and the measure on G(F)A_G(ℝ)^0\G(𝔸_F) is its transport by quotient-norm-one-comparison.

  API: `AutomorphicQuotient.measure` — The measure on G(F)\G(𝔸)^1 attached to dx; `AutomorphicQuotient.measure_split` — Its transport to G(F)A_G(ℝ)^0\G(𝔸); `AutomorphicQuotient.invariant` — Right G(𝔸)^1-invariance; `AutomorphicQuotient.smul_haar` — Scaling dx by c scales the quotient measure by c.

  Examples: For G without rational characters (for instance semisimple G), G(𝔸)^1 = G(𝔸), so the measure lives on G(F)\G(𝔸). For GL_1, the norm-one quotient has finite volume while the split component ℝ_{>0} is not compact, so ℚ^×\𝔸^× has infinite volume.

  Sources: [Borel], Theorem 5.8, p. 22. Requires: AA.2.1; AA.2.2; AA.2.3; AA.1.5.

- **Closedness of the central rational product.** Let G be connected reductive over F and X a closed subgroup of Z(𝔸_F). If XZ(F) is closed in Z(𝔸_F), then XG(F) is closed in G(𝔸_F).

  Sources: [Arthur], §1, pp. 7–9. Requires: AA.1.3; `ReductiveGroupsPartII:RG2.1`.

- **The central-character measurable Hermitian line.** With Γ=G(F), closed central X, XΓ closed, and continuous unitary ω trivial on X∩Γ, ξ(γz)=ω(z) defines a continuous unitary character of XΓ. The associated measurable Hermitian line field on XΓ\G has fibres (G×ℂ)/(hg,t)∼(g,ξ(h)⁻¹t). A Borel section of G→XΓ\G trivializes this field measurably; equivariant functions φ(hg)=ξ(h)φ(g) are its sections. Topological local triviality is not asserted for an arbitrary closed subgroup. Assumptions: F a number field; G connected reductive over F; Γ = G(F); X ≤ Z(𝔸_F) closed with XΓ closed in G(𝔸_F); ω a continuous unitary character of X trivial on X ∩ Γ.

  Sources: [Arthur], §1, p. 7; [BHV], Appendix E.1, covariant function construction, pp. 405–407. Requires: AA.1.3; AA.2.2; AA.2.3; Mathlib `MonoidHom.isOpenMap_of_sigmaCompact`.

- **A measurable section and unitary cocycle.** For closed XΓ in the second countable adelic group there is a Borel section s:XΓ\G→G. With c(y,g)=s(y)g s(yg)⁻¹∈XΓ, right translation on sections is represented on quotient functions by ξ(c(y,g)) times translation y↦yg. Different sections give unitarily equivalent models. Assumptions: F a number field; G connected reductive over F; Γ = G(F); X ≤ Z(𝔸_F) closed with XΓ closed in the second countable locally compact (Polish) group G(𝔸_F); ξ the character of XΓ from central-associated-line.

  Sources: [Arthur], §1, pp. 7–9. Requires: AA.2.3.

- **Completeness of central-character L² sections.** Square-integrable measurable sections of the associated Hermitian line, modulo equality almost everywhere, form a complex Hilbert space with inner product ∫conj(φ)ψ. Right translation is unitary and strongly continuous. Assumptions: F a number field; G connected reductive over F; Γ = G(F); X ≤ Z(𝔸_F) closed with XΓ closed; ω continuous unitary on X, trivial on X ∩ Γ; the associated line and Borel section of central-associated-line and central-measurable-section; the right-invariant quotient measure on XΓ\G(𝔸_F).

  Sources: [Arthur], §1, pp. 7–9; [BHV], Appendix E.1, completion construction and Remark E.1.2, pp. 407–408. Requires: AA.2.3; AA.2.2; Mathlib `MeasureTheory.Lp`.

- **Extension and twisting of a central character.** For X′⊂X with X′Γ\XΓ compact and continuous ω′ trivial on X′∩Γ, extend the resulting character of X′Γ/Γ to a continuous character ω₀ of XΓ/Γ. The operators ω₀(z)⁻¹R(z) define a strongly continuous unitary action of the compact abelian quotient XΓ/X′Γ on CentralCharL2(X′,ω′). Assumptions: F a number field; G connected reductive over F; Γ = G(F); X′ ⊂ X ⊂ Z(𝔸_F) closed with X′Γ and XΓ closed and X′Γ\XΓ compact; ω′ a continuous unitary character of X′ trivial on X′ ∩ Γ; z ranges over X.

  Sources: [Arthur], §1, pp. 7–9. Requires: AA.2.3.

- **L² space with a unitary central character.** Let 𝔛 ⊂ Z(𝔸_F) be a closed subgroup such that 𝔛Z(F) is closed, and ω a continuous unitary character of 𝔛 trivial on 𝔛 ∩ Z(F). L²(G(F)\G(𝔸_F), ω) is the Hilbert space of (classes of) measurable φ on G(𝔸) with φ(γ z g) = ω(z) φ(g) for γ ∈ G(F), z ∈ 𝔛, and ∫_{𝔛G(F)\G(𝔸)} |φ|² < ∞, with right translation R a unitary representation of G(𝔸) on which 𝔛 acts by ω. Assumptions: G a connected reductive group over F; 𝔛, ω as stated.

  API: `CentralCharL2` — CentralCharL2 𝔛 ω, a Hilbert space; `CentralCharL2.rightReg` — The unitary representation of G(𝔸) by right translation; `CentralCharL2.rightReg_central` — rightReg z = ω z • id for z ∈ 𝔛; `CentralCharL2.inner_def` — ⟪φ, ψ⟫ = ∫_{𝔛G(F)\G(𝔸)} conj(φ) · ψ, conjugate-linear in the first argument as in Mathlib; the integrand is quotient-invariant; `CentralCharL2.continuous_rightReg` — rightReg is strongly continuous.

  Examples: For 𝔛 = 1 it is L²(G(F)\G(𝔸)). If ω is nontrivial on 𝔛 ∩ Z(F) the space is zero.

  Sources: [Arthur], §1, p. 7. Requires: AA.2.2; AA.1.3; Mathlib `MeasureTheory.Lp`; AA.2.3.

- **Change of central quotient.** Let 𝔛′ ⊂ 𝔛 ⊂ Z(𝔸_F) be as in central-character-l2 with 𝔛′Z(F)\𝔛Z(F) compact, and ω′ a unitary character of 𝔛′. Then L²(G(F)\G(𝔸), ω′) is the Hilbert direct sum of the subspaces L²(G(F)\G(𝔸), ω) over the unitary characters ω of 𝔛 trivial on 𝔛 ∩ Z(F) and restricting to ω′, each being the ω-isotypic part for 𝔛. In particular L²(G(F)A_G(ℝ)^0\G(𝔸)) ≅ L²(G(F)\G(𝔸)^1) unitarily and G(𝔸)^1-equivariantly. Assumptions: G a connected reductive group over F; 𝔛′Z(F) and 𝔛Z(F) closed; their quotient compact; ω′ continuous and trivial on 𝔛′∩Z(F).

  Sources: [Arthur], §3, p. 16. Requires: AA.2.3; AA.2.1; AA.2.2; RepresentationTheory/CompactGroups, layer 5.


### AA.2.4 — Gauge forms and Tamagawa normalization

- **Invariant top-degree forms.** For a smooth affine algebraic group G of dimension d over a field k with coordinate Hopf algebra H, the space of left-invariant top-degree differential forms is ω_G = ∧^d_k (𝔪_ε/𝔪_ε²), the top exterior power of the cotangent space at the identity; it is a one-dimensional k-vector space, and a nonzero ω ∈ ω_G is a gauge form. Right translation by g acts on ω_G by det(Ad(g))⁻¹. Assumptions: k a field; G smooth affine of dimension d.

  API: `GaugeForm` — GaugeForm is the top exterior-power line of the cotangent module (ker ε)/(ker ε)² at the identity; a gauge form is a nonzero vector in it; `GaugeForm.finrank_eq_one` — For smooth G, finrank k (GaugeForm H) = 1; `GaugeForm.baseChange` — GaugeForm commutes with base change k → k′; `GaugeForm.rightTranslate` — Right pullback by g acts on the left-invariant top-form line by det(Ad(g))⁻¹.

  Examples: For G_m the cotangent space at 1 is one-dimensional, spanned by the class of T − 1, so GaugeForm is spanned by dT/T. For the upper triangular Borel of GL₂, right pullback by diag(a,d) multiplies a left-invariant gauge form by (a/d)⁻¹. For a/d≠1 it is not invariant.

  Sources: [Rosengarten], §1, p. 2. Requires: Tau Ceti `TauCeti.Bialgebra.CotangentSpace`; Tau Ceti `Derivation.adjointPointRepresentation`; Mathlib `Ideal.Cotangent`; Mathlib `Bialgebra.counitAlgHom`; Mathlib `exteriorPower.ιMulti`; Tau Ceti `Derivation.adjointAction`; Mathlib `Module.evalEquiv`; Mathlib `TensorProduct.lid`; Mathlib `exteriorPower.map`.

- **The Haar measure |ω|_v of a gauge form.** For a smooth affine group G over a local field F_v of characteristic 0 with gauge form ω and the standard Haar measure on F_v (𝒪_v of volume 1; Lebesgue on ℝ; twice Lebesgue on ℂ), |ω|_v is the left Haar measure on G(F_v) given in any F_v-analytic chart φ : U → G(F_v), U ⊂ F_v^d open, by |f(x)|_v dx_1 ⋯ dx_d where φ^*ω = f dx_1 ∧ ⋯ ∧ dx_d. Assumptions: F_v a local field of characteristic 0; G smooth affine over F_v; ω a gauge form.

  API: `GaugeForm.localMeasure` — The Haar measure |ω|_v on G(F_v); `GaugeForm.localMeasure_isHaar` — |ω|_v is a left Haar measure; `GaugeForm.localMeasure_smul` — |c ω|_v = |c|_v • |ω|_v; `GaugeForm.localMeasure_rightTranslate` — Measure.map (· * g) |ω|_v = |det Ad(g)|_v • |ω|_v. In contrast R_g^*ω = det Ad(g)⁻¹ • ω. This agrees with the pinned Mathlib convention map R_g μ = modularCharacter(g) • μ.

  Examples: For G_a with coordinate T, the image of localMeasure dT under x ↦ x(T) is the standard Haar measure of F_v (𝒪_v of volume 1). localMeasure (dT/T) on ℚ_p^× is not the normalized idele measure of AA.0.4: they differ by the factor 1 − p⁻¹ ≠ 1.

  Sources: [Rosengarten], §1, p. 2; [Borel], §5.5, p. 21. Requires: AA.2.4; `ReductiveGroupsPartII:RG2.0`.

- **Weil's volume formula for integral points.** Let 𝓗 be a smooth affine group scheme of relative dimension d over 𝒪_v with residue field k_v of order q_v, and ω a gauge form of the generic fibre that extends to a generator of the invariant top forms of 𝓗. Then |ω|_v(𝓗(𝒪_v)) = #𝓗(k_v) · q_v^{-d}. Assumptions: 𝓗 smooth affine over 𝒪_v; ω extends to a generator over 𝒪_v.

  Sources: [Rosengarten], §3, p. 25; [Gordon], §2.3, equation (17), pp. 10–11. Requires: AA.2.4; AA.1.1.

- **Convergence factors from the character module.** Let X = X*(G_{F̄}) ⊗ ℂ with its continuous finite-image Galois action. For a finite place v, L_v(X, s) = det(1 - q_v^{-s} Frob_v | X^{I_v})⁻¹, and the convergence factors are λ_v = L_v(X, 1) at finite v and λ_v = 1 at infinite v. The partial Euler product L^S(X, s) = ∏_{v∉S} L_v(X, s) converges for Re s > 1, and ρ_G = lim_{s→1⁺} (s - 1)^r L^S(X, s) · ∏_{v∈S, v finite} L_v(X, s) with r = rank X*_F(G), whenever this limit exists and is nonzero. Assumptions: G = Spec H an affine algebraic group over F, H finitely generated; G connected.

  API: `Tamagawa.localFactor` — localFactor v s := det(1 - q_v^{-s} Frob_v | X^{I_v})⁻¹; `Tamagawa.localFactor_trivial` — If Gal acts trivially on X of rank r, localFactor v s = (1 - q_v^{-s})^{-r}; `Tamagawa.leadingCoeff` — ρ_G, defined when the limit exists; `Tamagawa.leadingCoeff_split` — For split characters of rank r, ρ_G = (dedekindZeta_residue F)^r.

  Examples: For G_m, localFactor v 1 = (1 - q_v⁻¹)⁻¹. For G = Res_{E/ℚ} G_m with E = ℚ(i), localFactor p 1 = (1 - p⁻¹)⁻¹(1 - χ₄(p)p⁻¹)⁻¹, not (1 - p⁻¹)⁻¹: the inert primes see the nontrivial character.

  Sources: [Rosengarten], §3, p. 25; [Rosengarten], §1, p. 2. Requires: Tau Ceti `TauCeti.CommHopfAlgCat.geometricCharacterGroup`; Tau Ceti `TauCeti.CommHopfAlgCat.instGeometricCharacterGroupGaloisAction`; AA.2.1; Mathlib `NumberField.dedekindZeta_residue`; Mathlib `NumberField.dedekindZeta_residue_pos`; Mathlib `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`; Chebotarev, layer 10; Tau Ceti `TauCeti.dedekindZeta_eulerProduct_hasProd`.

- **Absolute convergence of the corrected volumes.** For connected reductive G with an integral model 𝓗 smooth with connected reductive fibres away from S, the product ∏_{v∉S} λ_v #𝓗(k_v) q_v^{-d} converges absolutely; for semisimple G the factors are 1 + O(q_v^{-2}). Assumptions: 𝓗 reductive over 𝒪_{F,S}.

  Sources: [Rosengarten], §3, p. 25. Requires: AA.2.4; AA.1.1; ReductiveGroups, layer 9.

- **Tamagawa measure.** For a smooth connected affine F-group of dimension d for which the Artin leading coefficient ρ_G exists and is positive and the corrected integral volumes converge absolutely, define τ_G=|d_F|⁻ᵈ/²ρ_G⁻¹ times the convergent Haar product of μ_v=λ_v|ω|_v. At finite v, λ_v=L_v(X*(G_Fbar)⊗ℂ,1), including ramified inertia invariants; at infinite v λ_v=1. Use the specified additive normalizations dx, 2dxdy and vol(O_v)=1. Connected reductive groups satisfy the separate convergence target. If the geometric character lattice is zero, λ_v=ρ_G=1, but the gauge integral masses still need the convergent-product construction. Assumptions: G = Spec H an affine algebraic group over F, H finitely generated; G connected; ρ_G exists (convergence-factors); ρ_G is finite and strictly positive; The product of corrected integral volumes is absolutely convergent and nonzero.

  API: `Tamagawa.measure` — Tamagawa.measure G : Measure (AdelicPoints H); `Tamagawa.measure_isHaar` — Tamagawa.measure is a left Haar measure; `Tamagawa.measure_eq_product` — On a product of finitely many local sets and almost all 𝓗(𝒪_v) it is |d_F|^{-d/2} ρ_G⁻¹ ∏ λ_v |ω|_v(C_v); `Tamagawa.measure_ga` — For G_a it is |d_F|^{-1/2} • adeleHaar; `Tamagawa.measure_res` — Compatibility with restriction of scalars (tamagawa-restriction-scalars).

  Examples: For G_a over ℚ, Tamagawa.measure (ℚ\𝔸 fundamental domain [0,1) × ℤ̂) = 1. For G_m the naive product ∏ |dT/T|_p is not a measure on 𝔸^×: the volumes 1 − p⁻¹ have product 0 because Σ_p 1/p diverges; Tamagawa.measure uses λ_v = (1 − q_v⁻¹)⁻¹ and ρ = Res ζ_F.

  Sources: [Rosengarten], §3, p. 25; [Borel], §5.5, p. 21; [Gordon], §5.1.1, equation (48), pp. 31–33; Remark 2.1, p. 3. Requires: AA.2.4; AA.0.2; AA.0.3; AA.0.4.

- **Independence of the gauge form.** τ_G does not depend on the gauge form ω: replacing ω by cω with c ∈ F^× multiplies each |ω|_v by |c|_v, and ∏_v |c|_v = 1. Assumptions: G = Spec H an affine algebraic group over F, H finitely generated.

  Sources: [Rosengarten], §1, p. 2. Requires: AA.2.4; Tau Ceti `TauCeti.GlobalNumberFields.finprod_normalizedAbsValue_eq_one`; AA.0.3.

- **Corrected volumes for GL_n and SL_n.** For the standard models of GL_n and SL_n over 𝒪_F and their standard gauge forms, at every finite place v: λ_v · #GL_n(k_v) q_v^{-n²} = ∏_{i=2}^{n} (1 − q_v^{-i}) with λ_v = (1 − q_v^{-1})^{-1}, and #SL_n(k_v) q_v^{-(n²−1)} = ∏_{i=2}^{n} (1 − q_v^{-i}); both products over v converge absolutely.

  Sources: [Rosengarten], §3, p. 25. Requires: AA.2.4.

- **Tamagawa number.** For connected reductive G, τ(G) = vol(G(F)\G(𝔸_F)^1) for the measure on G(𝔸)^1 induced by τ_G and the Lebesgue measure on a_G normalized by the lattice Hom(X*_F(G), ℤ) (through split-centre-decomposition and log-height-split-centre-iso), with counting measure on G(F), as an element of [0, ∞]. Its finiteness is AA.3.4.

  API: `Tamagawa.number` — Tamagawa.number G : ℝ≥0∞; `Tamagawa.number_pos` — Tamagawa.number G > 0; `Tamagawa.number_res` — Tamagawa.number (Res_{E/F} G) = Tamagawa.number G.

  Examples: For the trivial group τ = 1. vol(G_m(F)\G_m(𝔸)) = ∞ because the split component ℝ_{>0} is not compact; τ uses the norm-one quotient.

  Sources: [Rosengarten], §1, p. 3. Requires: AA.2.4; AA.2.3; AA.2.1.

- **Volumes of commensurable compact open subgroups.** For compact open subgroups U, U′ of G(𝔸_{F,f}) (or of G(F_v)) and a left Haar measure μ, μ(U)/μ(U′) = [U : U ∩ U′]/[U′ : U ∩ U′]; in particular all volumes of compact open subgroups are positive rational multiples of one of them. Assumptions: G(𝔸_{F,f}) as in AA.1.

  Sources: [Borel], §1.7, p. 8. Requires: AA.1.5; Mathlib `MeasureTheory.Subgroup.index_mul_measure`; AA.0.2.


### AA.2.5 — Scalar Jacobians and restriction of scalars

- **Finite-place scalar Jacobian for a chosen basis.** For β:F_v^n≃∏_{w|v}E_w, let L_{β,v}=∑_j O_vβ_j. With every valuation ring of volume 1, j_{β,v}=vol_{∏E_w}(L_{β,v})⁻¹. In particular j_{β,v}=1 when β is an O_v-basis of ∏_{w|v}O_w. Assumptions: E/F a finite extension of number fields of degree n; v a finite place of F; β an F-basis of E, read as F_v^n ≃ E⊗F_v ≅ ∏_{w|v}E_w; Haar measures on F_v and every E_w giving the valuation rings volume 1.

  Sources: [Gordon], Remark 2.1, p. 3; §5.1.1, pp. 31–33. Requires: AA.0.1; AA.1.4.

- **Archimedean scalar Jacobian for a chosen basis.** If F_v=ℝ and E⊗F_v=ℝ^a×ℂ^b, let D_{β,v} be the real determinant of the basis map in real and imaginary coordinates. Then j_{β,v}=2⁻ᵇ|D_{β,v}|⁻¹. If F_v=ℂ, then j_{β,v}=|det_ℂ β|⁻². The factors use dx at real places and 2dxdy at complex places. Assumptions: E/F a finite extension of number fields of degree n; v an infinite place of F; β an F-basis of E, read as the real-linear map F_v^n → E⊗F_v ≅ ℝ^a × ℂ^b (F_v = ℝ) or ℂ^n (F_v = ℂ); measures dx on ℝ and 2dxdy on ℂ on both sides.

  Sources: [Gordon], §2.2, Examples 2.3–2.4, pp. 5–7; §5.1.1, pp. 31–33. Requires: AA.0.4; AA.1.4.

- **Global scalar Jacobian and absolute discriminants.** For an F-basis β of E, the positive factors j_{β,v} equal 1 at almost all finite v and ∏_v j_{β,v}=|d_F|^{[E:F]/2}|d_E|⁻¹/². Thus |d_F|⁻ⁿᵈ/²∏_v j_{β,v}^d=|d_E|⁻ᵈ/². Assumptions: E/F a finite extension of number fields of degree n; β an F-basis of E; j_{β,v} as defined in restriction-finite-jacobian and restriction-infinite-jacobian; d ≥ 0.

  Sources: [Gordon], Remark 2.1, p. 3; §5.1.1, pp. 31–33. Requires: AA.2.5; NumberFieldArithmetic, layer 4; Tau Ceti `TauCeti.GlobalNumberFields.finprod_normalizedAbsValue_eq_one`.

- **Gauge forms under restriction of scalars.** Choose an F-basis β of E and an E-basis of the cotangent space dual to the E-gauge ω_E. Let ω_β be the F-top form dual to the ordered F-basis β_j e_i of the restricted cotangent space. At v, transport |ω_β|_v to G_E(∏_{w|v}E_w); it equals j_{β,v}^d∏_{w|v}|ω_E|_w. Here j_{β,v} is defined by (β-coordinates)_*μ_{F_v}^{[E:F]}=j_{β,v}∏_{w|v}μ_{E_w}. It depends on β and is not an unspecified square root of a local discriminant. Assumptions: E/F finite; ω_E a gauge form.

  Sources: [Rosengarten], §1, p. 2. Requires: AA.2.4; AA.1.4; GlobalNumberFields, layer 0; AA.2.5.

- **Inductivity of the convergence factors.** For a finite separable E/F and a finite-image complex Galois representation X over E, the induced representation satisfies L_v(Ind X,s)=∏_{w|v}L_w(X,s) at every finite v, including ramified v with inertia invariants. Consequently their global Euler products coincide for Re(s)>1 and their leading coefficients coincide whenever the stated nonzero limits at s=1 exist. Assumptions: E/F finite; X with finite image.

  Sources: [Rosengarten], §3, p. 25. Requires: AA.2.4.

- **Tamagawa measures and restriction of scalars.** Let E/F be a finite extension of number fields and G_E a connected reductive E-group of dimension d. The canonical topological group isomorphism Res_{E/F}G_E(𝔸_F)→G_E(𝔸_E), together with the induced character-space map and its integral-lattice Lebesgue normalization, transports Tamagawa measures and norm-one quotient measures. In particular the Tamagawa numbers agree. The extension to connected nonreductive groups requires the Levi/unipotent integration input of AA.3. Assumptions: E/F finite extensions of number fields; The Artin leading coefficients and Haar products have the existence/convergence proved in the named inputs.

  Sources: [Gordon], §5.1.1, eq. (48), pp. 31–33; [Rosengarten], §1, p. 2; §3, p. 20. Requires: AA.2.4; AA.1.4; GlobalNumberFields, layer 0; NumberFieldArithmetic, layer 4; AA.2.5.


## AA.3 — Reduction and arithmetic quotients

Begin with rational parabolic data, real Siegel coordinates and the primitive GLₙ and closed-orbit reductions. Their adelic consequences give finite class sets, finite volume and compactness criteria. Heights quantify growth; the fixed-K real theory controls cusps and subgroup orbit maps.

### AA.3.1 — Rational parabolics and Iwasawa integration

- **Minimal rational parabolics and standard parabolics.** Fix a minimal F-parabolic P_0 ⊂ G with Levi decomposition P_0 = M_0 N_0, M_0 the centralizer of a maximal F-split torus S_0. A standard parabolic is an F-parabolic P ⊇ P_0; it has a unique Levi component M_P ⊇ M_0, unipotent radical N_P, and split component A_P = A_{M_P}. The standard parabolics are finite in number, correspond to subsets of the simple relative roots Δ_0, and every F-parabolic is G(F)-conjugate to exactly one of them. Assumptions: G a connected reductive group over F.

  API: `Reduction.MinimalParabolic` — Structure: P_0, M_0, N_0, S_0 with the Levi decomposition; `Reduction.StandardParabolic` — The finite type of standard parabolics P ⊇ P_0, with M_P, N_P, A_P; `Reduction.standardParabolic_equiv_subsets` — StandardParabolic ≃ Finset Δ_0; `Reduction.exists_unique_standard_conj` — Every F-parabolic is G(F)-conjugate to a unique standard parabolic; `Reduction.StandardParabolic.le_iff` — P ≤ P′ iff the corresponding subsets satisfy Δ_0^P ⊆ Δ_0^{P′} (with the convention that the subset lists the simple roots of M_P).

  Examples: For GL_3 there are 4 standard parabolics. For GL_2 over ℚ the lower triangular Borel is a parabolic that is not standard; it is conjugate to the standard one by the Weyl element.

  Sources: [Arthur], §4, p. 22. Requires: ReductiveGroups, layer 7; Tau Ceti `TauCeti.Cocharacter.parabolic`; Tau Ceti `TauCeti.Cocharacter.unipotent`; Tau Ceti `TauCeti.Cocharacter.leviDecompositionMulEquiv`; AA.2.1.

- **Relative chambers and the spaces a_P.** For standard P, a_P = a_{M_P} (AA.2.1), with a_0 = a_{P_0}. For P_1 ⊆ P_2 there are split exact sequences giving a_{P_1} = a_{P_2} ⊕ a_{P_1}^{P_2} and dually. The roots Φ_P of (P, A_P) lie in (a_P^G)^*, ρ_P = (1/2) ∑_{α∈Φ_P} (dim 𝔫_α) α, the simple roots Δ_P are the restrictions of Δ_0 ∖ Δ_0^P, and the positive chamber is a_P^+ = {H ∈ a_P : α(H) > 0 for α ∈ Δ_P}. Assumptions: G a connected reductive group over F.

  API: `Reduction.aP` — The real vector space a_P for a standard parabolic; `Reduction.aPProjection` — For P₁⊆P₂ the canonical linear projection a_{P₁}→a_{P₂}, dual to restriction of rational characters; its kernel is the relative space a_{P₁}^{P₂}; `Reduction.aP_decomp` — For P₁≤P₂, restriction of rational characters induces the canonical projection π:a_{P₁}→a_{P₂}; a_{P₁}≃ₗ a_{P₂}×ker π, with the splitting induced by the split centres. The kernel is 0 for P₁=P₂; `Reduction.rho` — ρ_P ∈ (a_P^G)^*; `Reduction.simpleRoots` — Δ_P ⊂ (a_P^G)^*, a basis; `Reduction.positiveChamber` — a_P^+ = {H | ∀ α ∈ Δ_P, 0 < α H}.

  Examples: For the Borel of GL_2, ρ = (1/2)(e_1 - e_2). For GL_3, a_0^+ is cut out by the two simple roots; positivity of e_1 - e_3 alone does not imply membership.

  Sources: [Arthur], §5, p. 24; [Arthur], §5, p. 25. Requires: AA.3.1; AA.2.1; `ReductiveGroupsPartII:RG2.1`; ReductiveGroups, layer 7.

- **Admissible maximal compact subgroup of G(𝔸).** A maximal compact subgroup K = ∏_v K_v of G(𝔸_F) is admissible relative to M_0 if K_v = 𝓗(𝒪_v) is hyperspecial for all but finitely many v, each K_v is a special maximal compact subgroup in good position relative to M_0 at finite v and a maximal compact subgroup of G(F_v) at archimedean v, and G(F_v) = P_0(F_v) K_v for every v. Assumptions: G a connected reductive group over F.

  API: `Reduction.AdmissibleCompact` — Structure: the local K_v with the hyperspecial, special and Iwasawa conditions; `Reduction.AdmissibleCompact.toSubgroup` — The compact subgroup ∏_v K_v of G(𝔸); `Reduction.AdmissibleCompact.isCompact` — toSubgroup is compact; `Reduction.AdmissibleCompact.exists` — An admissible K exists for every minimal parabolic data.

  Examples: For GL_n over ℚ, O(n) × ∏_p GL_n(ℤ_p) is admissible. The Iwahori subgroup (upper triangular modulo p) is a proper subgroup of GL_2(ℤ_p), so a product of Iwahori subgroups is not maximal compact and not admissible.

  Sources: [Arthur], §4, p. 23; [Arthur], §4, p. 24. Requires: AA.1.1; AA.1.2; `ReductiveGroupsPartII:RG2.3` (reductive-model, hyperspecial-vertices); `ReductiveGroupsPartII:RG2.4` (iwasawa-parabolic-integral); RepresentationTheory/LieGroups, layer 9.

- **Adelic Iwasawa factorization.** For connected reductive G/F, minimal-parabolic data and an admissible K, multiplication N_P(𝔸)×M_P(𝔸)^1×A_P(ℝ)^0×K→G(𝔸) is surjective and open for each standard P. At almost all finite places it restricts to the integral Iwasawa factorization; this integrality permits assembling local choices into restricted-product elements.

  Sources: [Arthur], §4, pp. 23–24. Requires: AA.3.1; AA.2.1; `ReductiveGroupsPartII:RG2.3` (reductive-model); `ReductiveGroupsPartII:RG2.4` (iwasawa-parabolic-integral); RepresentationTheory/LieGroups, layer 9.

- **Parabolic Haar Jacobian.** Write P=N⋊M and δ_P(m)=|det(Ad(m)|Lie N)|_𝔸. With left Haar measures dn,dm, the measure δ_P(m)^−1 dn dm in coordinates (n,m) is a left Haar measure of P(𝔸); Mathlib's modular character of P(𝔸) (map (·p) μ_l = Δ_P(p) μ_l, equivalently map (p·) μ_r = Δ_P(p)^−1 μ_r for μ_r the inversion image of μ_l) is Δ_P(nm)=δ_P(m), and dn dm is a right Haar measure in the same coordinates. Assumptions: F a number field; G a connected reductive group over F; P = N_P ⋊ M_P an F-parabolic with its Levi decomposition on 𝔸-points; dn and dm Haar measures on N_P(𝔸) and the unimodular M_P(𝔸).

  Sources: [Arthur], §4, p. 21. Requires: AA.2.2.

- **Iwasawa integration through the compact factor.** For admissible K and P=N⋊M, normalize dk to mass one and choose compatible dn,dm. The functional f↦∫_K∫_M∫_N f(nmk)δ_P(m)^−1 dn dm dk on compactly supported continuous f is a positive functional invariant under right translation by G(𝔸) (left P-invariance and right K-invariance are immediate); since G(𝔸) is unimodular it is the Haar measure of G(𝔸). Equivalently use the compact homogeneous space (P∩K)\K, whose measure is quasi-invariant under G with the parabolic Radon–Nikodym cocycle. No invariant measure on P\G is asserted. Assumptions: F a number field; G a connected reductive group over F; P = N ⋊ M a standard F-parabolic; K admissible with dk its Haar probability measure; dn, dm Haar measures on N(𝔸), M(𝔸) with vol(N(𝒪_v)) = vol(M(𝒪_v)) = 1 at almost all v.

  Sources: [Arthur], §4, pp. 21–23. Requires: AA.3.1; AA.0.3; `ReductiveGroupsPartII:RG2.4`; RepresentationTheory/LieGroups, layer 9; AA.1.5.

- **Adelic Iwasawa decomposition and integration formula.** For admissible K and standard P, G(𝔸_F) = P(𝔸_F)K = N_P(𝔸)M_P(𝔸)^1 A_P(ℝ)^0 K, and for f ∈ L¹(G(𝔸)), ∫_{G(𝔸)} f(x) dx = ∫_K ∫_{M_P(𝔸)} ∫_{N_P(𝔸)} f(nmk) δ_P(m)^{-1} dn dm dk for compatible Haar measures. Assumptions: G a connected reductive group over F; K admissible.

  Sources: [Arthur], §4, p. 24. Requires: AA.3.1.

- **The map H_P.** For standard P and admissible K, H_P : G(𝔸_F) → a_P is H_P(nmk) = H_{M_P}(m) for n ∈ N_P(𝔸), m ∈ M_P(𝔸), k ∈ K; write H_0 = H_{P_0}. Assumptions: G a connected reductive group over F; K admissible.

  API: `Reduction.HP` — Reduction.HP P : AdelicPoints H → a_P; `Reduction.HP_nmk` — HP (n * m * k) = logHeight_{M_P} m; `Reduction.HP_left_P` — HP (p * x) = HP p + HP x for p ∈ P(𝔸); `Reduction.continuous_HP` — HP is continuous; `Reduction.HP_rational` — HP (diagonal γ * x) = HP x for γ ∈ P(F).

  Examples: For x in P(𝔸), the pairing of HP x with each rational character χ of P is log ‖χ(x)‖; for GL_2 and the Borel, HP (diag(a, d)) = (log ‖a‖, log ‖d‖). HP is not a homomorphism on G(𝔸): for GL_2, HP(w) = 0 for the Weyl element w ∈ K, but HP of a product of upper and lower unipotents can be nonzero.

  Sources: [Arthur], §4, p. 24. Requires: AA.3.1; AA.2.1.


### AA.3.2 — Real Siegel coordinates and reduced positive forms

- **Horospherical decomposition for a fixed maximal compact.** Let G be connected semisimple over ℚ, G = G(ℝ)^+, K ⊂ G maximal compact with Cartan involution θ, and 𝐏 a ℚ-parabolic with unipotent radical 𝐍_P and Levi quotient 𝐋_P. With S_P the split centre of 𝐋_P, A_P = S_P(ℝ)^0 and M_P the real points of ⋂_{χ∈X*(𝐋_P)} ker χ², there is a unique θ-stable real Levi lift of (𝐋_P)_ℝ, giving P = N_P A_P M_P and the diffeomorphism N_P × A_P × ((M_P ∩ G) K) → G (M_P itself can leave G(ℝ)^+: for PGL_2 it contains diag(−1, 1)). Left multiplication by p_0 = n_0 a_0 m_0 acts by (n, a, m) ↦ (n_0 · (a_0m_0) n (a_0m_0)⁻¹, a_0 a, m_0 m). Assumptions: G connected semisimple over ℚ; K a maximal compact subgroup of G(ℝ)^+.

  API: `RealSiegel.HoroData` — Structure: N_P, A_P, M_P K, the homeomorphism horoDecomp : G ≃ₜ N_P × A_P × (M_P K) for fixed K and 𝐏, and the simple roots; `RealSiegel.horoDecomp_left_mul` — The left action formula of p_0 = n_0 a_0 m_0; `RealSiegel.horoDecomp_conj` — Conjugation by g ∈ G(ℚ) carries the decomposition for (𝐏, K) to that for (g𝐏g⁻¹, gKg⁻¹); `RealSiegel.horoDecomp_change_K` — For K′=uKu⁻¹ with u∈N_P and the Levi lifts identified by conjugation by u, the A-coordinate satisfies a_{K′}(g)=a_K(gu), equivalently H_{P,K′}(g)=H_{P,K}(gu). It need not equal a_K(g).

  Examples: For SL_2(ℝ): (x, a, ±k) ↦ n(x) diag(√a, 1/√a)(±k). In SL₂(ℝ), take u=n(1), k=[[0,−1],[1,0]]∈SO(2). The upper-half-plane height of ki is 1 whereas that of k(1+i) is 1/2. Thus a_K(k)=1 but a_{uKu⁻¹}(k)=1/2 under the parameter diag(√a,1/√a).

  Sources: [BKT], §2.2, p. 8; [BKT], (2.2), p. 8. Requires: AA.3.1; RepresentationTheory/LieGroups, layer 9; Tau Ceti `TauCeti.Cocharacter.parabolic`; Tau Ceti `TauCeti.Cocharacter.leviDecompositionMulEquiv`.

- **Simple roots of P and truncated tori.** Φ(A_P, N_P) is the set of characters of A_P on Lie N_P; Δ(A_P, N_P) = {α_1, …, α_r} is the unique set of dim A_P linearly independent roots of which every root is a nonnegative integral combination (the simple roots). For t > 0, A_{P,t} = {a ∈ A_P : a^α > t for all α ∈ Δ(A_P, N_P)}, and e_P(a) = (a^{-α_1}, …, a^{-α_r}) is a semialgebraic diffeomorphism A_P ≃ (ℝ_{>0})^r with e_P(A_{P,t}) = (0, 1/t)^r.

  API: `RealSiegel.HoroData.simpleRoots` — Δ(A_P, N_P) as a Finset of positive characters of A_P; `RealSiegel.truncatedTorus` — A_{P,t}; `RealSiegel.cornerCoord` — e_P : A_P ≃ (Fin r → ℝ_{>0}); `RealSiegel.cornerCoord_truncated` — e_P '' A_{P,t} = Set.pi univ (fun _ => Ioo 0 t⁻¹).

  Examples: For SL_2 and the Borel, Δ = {α} with diag(a, a⁻¹)^α = a². For the Borel of SL_3 the root α_1 + α_2 is positive but not simple; truncating by it alone does not give A_{P,t}.

  Sources: [BKT], §2.2, p. 8. Requires: AA.3.2; ReductiveGroups, layer 7.

- **Siegel set for a fixed maximal compact.** For a ℚ-parabolic 𝐏, a maximal compact K ⊂ G = G(ℝ)^+, t > 0 and bounded (relatively compact open semialgebraic) U ⊂ N_P, W ⊂ M_P K, the Siegel set associated to 𝐏 and K is 𝔖 = U × A_{P,t} × W ⊂ G in horospherical coordinates. For a connected compact M ⊂ K, a Siegel set of G/M associated to K is the image of such a set; K is fixed once and for all (BKT Definition 2.5 as corrected by the 2023 erratum). Assumptions: K fixed.

  API: `RealSiegel.siegelSet` — RealSiegel.siegelSet 𝐏 K U t W : Set G; `RealSiegel.mem_siegelSet` — Membership in horospherical coordinates; `RealSiegel.siegelSet_mono` — Monotone in U, W and antitone in t; `RealSiegel.siegelSet_quotient` — The image in G/M.

  Examples: For SL_2 and K = SO(2), the image in ℍ is {x + iy : x ∈ U, y > t}. Siegel sets for different K are not interchangeable: for SL_2, P upper triangular and x ≠ i in ℍ, a Siegel set B_N B_A K_x is not contained in finitely many SL_2(ℤ)-translates of Siegel sets for K_i (erratum §1.6.1).

  Sources: [BKT], Definition 2.3, p. 8; [BKT erratum], §1.1, p. 1. Requires: AA.3.2.

- **Translating and conjugating Siegel sets.** For g ∈ G(ℚ), g𝔖g⁻¹ is a Siegel set associated to g𝐏g⁻¹ and gKg⁻¹. For g ∈ G, 𝔖g is a Siegel set for 𝐏 and g⁻¹Kg, and for g ∈ 𝐏(ℝ), g𝔖 is a Siegel set for 𝐏 and K (exactly, for the sets U a A_{>0} W of the erratum; for Definition 2.3's A_{P,t}, up to containment). Consequently, for γ ∈ 𝐆(ℚ)^+, γ𝔖 is contained in a Siegel set associated to γ𝐏γ⁻¹ and the same K.

  Sources: [BKT], Lemma 2.4, p. 8; [BKT erratum], Remark 1.1(1), p. 2. Requires: AA.3.2.

- **Reduced positive forms.** Given an ordered basis e = (e_i) of V_ℚ (integral bases of V_ℤ in BKT), C > 0 and a positive definite symmetric form b on V_ℝ, b is (e, C)-reduced if (1) |b(e_i, e_j)| < C b(e_i, e_i) for all i, j; (2) b(e_i, e_i) < C b(e_j, e_j) for i < j; (3) ∏_i b(e_i, e_i) < C det(b), the Gram determinant in e. Assumptions: V a finite-dimensional ℚ-vector space; e an ordered basis.

  API: `RealSiegel.IsReduced` — RealSiegel.IsReduced e C b : Prop for a positive definite matrix b in the basis e; `RealSiegel.IsReduced.mono` — IsReduced e C b → C ≤ C′ → IsReduced e C′ b; `RealSiegel.IsReduced.smul` — IsReduced e C b ↔ IsReduced e C (λ • b) for λ > 0; `RealSiegel.IsReduced.cholesky` — For fixed dimension n and C>0 there is a constant R(n,C)>0 such that every C-reduced positive Gram matrix b=Nᵀdiag(d)N with N unit upper triangular and d_i>0 satisfies |N_ij|≤R for i<j and d_i≤R d_{i+1} for 0≤i<n−1. The bound is uniform over b; `RealSiegel.IsReduced.of_cholesky_bounds` — For fixed n and R>0 there is C(n,R)>1 such that every positive Gram matrix b=Nᵀdiag(d)N with N unit upper triangular, positive pivots d_i, |N_ij|≤R above the diagonal and d_i≤R d_{i+1} for i<n−1 is C-reduced.

  Examples: The identity matrix of size n is (std, 2)-reduced. diag(4, 1) is not (std, 2)-reduced (condition (2) fails) although diag(1, 4) is.

  Sources: [BKT], Definition 4.11, p. 17. Requires: Tau Ceti `TauCeti.cholesky`.

- **Scalar invariance of reduced forms.** For a positive definite Gram matrix B, C>0 and a>0, B is (e,C)-reduced iff aB is (e,C)-reduced. Consequently determinant normalization preserves reducedness. Assumptions: B a positive definite real symmetric n × n matrix (the Gram matrix of b in the basis e); C > 0; a > 0 real.

  Sources: [BKT], §4.5, Definition 4.11, pp. 17–18 (arXiv v2). Requires: AA.3.2.

- **The set T_{e,C} of reduced forms.** T_{e,C} = {b ∈ X : b is (e, C)-reduced} ⊂ X, the space of positive definite forms on V_ℝ; it is semialgebraic and satisfies T_{ge,C} = g·T_{e,C} for g ∈ GL(V_ℚ).

  API: `RealSiegel.reducedSet` — RealSiegel.reducedSet e C : Set (PosDefMatrix n); `RealSiegel.reducedSet_mono` — Monotone in C; `RealSiegel.reducedSet_smul_basis` — reducedSet (g • e) C = g • reducedSet e C.

  Examples: 1 ∈ reducedSet std 2. diag(1, 4) ∈ reducedSet std 2 but its inverse diag(1, 1/4) is not.

  Sources: [BKT], §4.5, p. 18 (arXiv v2); JAMS p. 933. Requires: AA.3.2; Tau Ceti `TauCeti.cholesky_mul_transpose`.

- **Reduced forms and Siegel sets.** For an ordered integral basis e and C>0, the set of (e,C)-reduced positive definite forms lies in the image of a GL_n(ℝ) Siegel set in GL_n(ℝ)/O(n), and each such Siegel set has reduced-form image for some C. Restricting to Gram determinant one gives the corresponding statement for SL_n(ℝ)/SO(n); normalize an arbitrary form B by det(B)^−1/n B. Rational bases are handled by the matching rational change of basis. Assumptions: V_ℤ a lattice in V_ℚ.

  Sources: [BKT], §4.5, p. 18 (arXiv v2); JAMS p. 933. Requires: AA.3.2; Tau Ceti `TauCeti.cholesky`; Tau Ceti `TauCeti.cholesky_mul_transpose`.

- **Lower bound by diagonal entries.** Let B be a positive definite real symmetric n × n matrix with diagonal d_k = B_kk and D ≥ 1 with ∏_k d_k ≤ D det B. Then for every real vector a and every k, aᵀ B a ≥ a_k² d_k / D. Assumptions: B positive definite.

  Sources: [BKT], §4.5, p. 18 (arXiv v2); JAMS p. 933. Requires: Tau Ceti `TauCeti.cholesky_mul_transpose`.

- **Transferring off-diagonal bounds to another basis.** Let B be the Gram matrix in an ordered basis e′ of a positive definite form b with |B_ab| ≤ C′ d_a for all a, b, with d_a ≤ C′ d_b for a < b, and ∏ d_a ≤ C′ det B (C′ ≥ 1). For a fixed basis e_i = ∑_a A_ai e′_a put k_i = max{a : A_ai ≠ 0}, m_i = |A_{k_i,i}|, L_i = ∑_a |A_ai|. Then |b(e_i, e_j)| ≤ C′³ L_i L_j m_i⁻² b(e_i, e_i) for all i, j.

  Sources: [BKT], §4.5, p. 18 (arXiv v2); JAMS p. 933. Requires: AA.3.2.

- **Basis change with determinant control.** Let e, e′ be bases of V_ℚ (m = dim V) and C, C′ ≥ 1. If b is (e′, C′)-reduced and ∏_i b(e_i, e_i) ≤ C det(b in e), then b is (σe, C″)-reduced for the ordering σ of e that sorts the values b(e_i, e_i), with C″ depending only on C, C′ and the change-of-basis matrix; hence b lies in one of the m! sets T_{σe,C″}. The sorting permutation is part of the conclusion.

  Sources: [BKT], §4.5, p. 18 (arXiv v2); JAMS p. 933. Requires: AA.3.2.


### AA.3.3 — Primitive reduction and closed orbits

- **Reduction for GL_n(ℝ).** There are C > 0 and a standard Siegel set 𝔖 ⊂ GL_n(ℝ) (with respect to O(n) and the upper triangular Borel) such that GL_n(ℝ) = GL_n(ℤ)·𝔖; equivalently every positive definite form is GL_n(ℤ)-equivalent to an (e, C)-reduced form for the standard basis e. Assumptions: n ≥ 1.

  Sources: [Borel], §3.3, p. 15. Requires: AA.3.2; Mathlib `ModularGroup.exists_smul_mem_fd`.

- **GLₙ finite class number one over ℚ.** For n≥1, GL_n(𝔸_{ℚ,f})=GL_n(ℚ)GL_n(ℤ̂). The rational intersection with GL_n(ℤ̂) is GL_n(ℤ). Assumptions: n ≥ 1; the ground field is ℚ (ℤ a PID; over a number field the double coset set is the class group).

  Sources: [Borel], §2.1–2.2, pp. 11–12; §4.4, p. 17. Requires: AA.1.4; AA.1.1.

- **Adelic reduction for GL_n over ℚ.** For a standard Siegel domain 𝔖 of GL_n(ℝ) with GL_n(ℝ) = GL_n(ℤ)·𝔖 (gln-real-reduction), GL_n(𝔸_ℚ) = GL_n(ℚ) · (𝔖 × GL_n(ℤ̂)). Assumptions: n ≥ 1.

  Sources: [Borel], Lemma 4.4, p. 17. Requires: AA.3.3.

- **Real GLₙ Siegel overlap.** For a standard GL_n(ℝ) Siegel domain Σ and a fixed integer d≥1, the set of γ∈GL_n(ℚ) with γ,γ⁻¹∈d^−1M_n(ℤ) and γΣ∩Σ≠∅ is finite. The same statement holds for two fixed rational translates of such domains. Assumptions: n ≥ 1; d ≥ 1 an integer; Σ a standard Siegel domain of GL_n(ℝ) in the left-quotient convention of gln-real-reduction; for the second claim c_1, c_2 ∈ GL_n(ℚ) fixed and the overlap condition γc_1Σ ∩ c_2Σ ≠ ∅.

  Sources: [Borel], §3.1 Lemma, p. 14; §3.3, p. 15. Requires: AA.3.3.

- **Simultaneous self-adjointness.** For a finite nested chain of reductive real algebraic subgroups of GL_n, one a∈SL_n(ℝ) makes every aG_i(ℝ)a⁻¹ stable under transpose. Assumptions: n ≥ 1; G_1 ⊃ G_2 ⊃ ⋯ ⊃ G_m (m ≥ 1) reductive real algebraic subgroups of GL_n(ℝ).

  Sources: [BHC], Theorem 1.9, p. 492. Requires: RepresentationTheory/LieGroups, layer 9.

- **Reductive homogeneous spaces as closed orbits.** If H⊂G are reductive algebraic groups over a characteristic-zero field F, then H\G is affine and has a G-equivariant closed immersion into a finite-dimensional rational G-representation, taking the identity coset to w∈V(F) with stabilizer H. The orbit of w is closed. Assumptions: F a field of characteristic 0; G a reductive (not necessarily connected) linear algebraic group over F; H ⊂ G a reductive closed F-subgroup.

  Sources: [BHC], §3.8, p. 501; §2.4 cited there. Requires: ReductiveGroups, layer 3; ReductiveGroups, layer 6.

- **Closed-orbit weight bounds in a real Siegel domain.** Let GL_n act rationally on V, w have closed orbit and transpose-stable stabilizer, and Γ⊂V(ℚ) be a lattice. Let GL_n(ℝ) act on the left and let Σ = ω·A_t·O(n) be a standard real Siegel domain in the left-quotient convention of gln-real-reduction (BHC §5.3 uses the equivalent right action v·g = g⁻¹·v and the inverse domain O(n)·A_t⁻¹·ω⁻¹). There is a compact Q⊂GL_n(ℝ) such that Σ·w∩Γ⊂Q·w. In particular the norms of these lattice points are uniformly bounded. Assumptions: V a finite-dimensional rational representation of GL_n over ℚ; w ∈ V(ℝ) with closed GL_n(ℂ)-orbit and transpose-stable stabilizer in GL_n(ℝ); Γ ⊂ V(ℚ) a lattice; Σ a standard Siegel domain for the upper triangular Borel and O(n).

  Sources: [BHC], §5.3–5.4, pp. 504–506. Requires: AA.3.3.

- **Closed-orbit lattice finiteness.** Under closed-orbit-weight-bound, Σ·w∩Γ is finite. The same holds for any other lattice of V(ℚ), in particular after replacing Σ by c·Σ for fixed c ∈ GL_n(ℚ), since c·Σ·w∩Γ = c·(Σ·w∩c⁻¹Γ). Assumptions: the hypotheses of closed-orbit-weight-bound (rational GL_n-representation V over ℚ, w ∈ V(ℝ) with closed orbit and transpose-stable stabilizer, Γ ⊂ V(ℚ) a lattice, Σ a left-convention standard Siegel domain).

  Sources: [BHC], Lemma 5.4, pp. 505–506. Requires: AA.3.3.

- **Compact finite parts give bounded denominators.** For a rational representation ρ:G→GL(V), w∈V(F) and compact C⊂G(𝔸_f), there is a fractional O_F-lattice L⊂V(F) such that wρ(C)∩V(F)⊂L. Likewise a compact C bounds denominators of all entries of g and g⁻¹ for g∈C∩GL_n(F). Assumptions: F a number field; G a linear algebraic group over F with a rational representation ρ: G → GL(V) over F; w ∈ V(F); C ⊂ G(𝔸_{F,f}) compact (for the second claim G = GL_n and ρ the identity).

  Sources: [Borel], Lemma 4.3, p. 17. Requires: AA.1.2; AA.1.5.

- **Reduction for reductive subgroups of GL_n.** Let G ⊂ GL_n be reductive over ℚ with a(G(ℝ))a⁻¹ self-adjoint for some a ∈ SL_n(ℝ). Let 𝔖 be the left-quotient standard Siegel domain of gln-real-reduction. There are finitely many c_i ∈ GL_n(ℚ) such that Ω = ⋃_i (c_i·(𝔖a × GL_n(ℤ̂)) ∩ G(𝔸)) satisfies G(𝔸) = G(ℚ)·Ω and {γ ∈ G(ℚ) : γΩ ∩ Ω ≠ ∅} is finite; the finite projection of Ω is compact. (Borel §4.5 states the inverse set ⋃_i (a⁻¹𝔖⁻¹·GL_n(ℤ̂)·c_i⁻¹ ∩ G(𝔸)) for right quotients.) Assumptions: G reductive over ℚ; self-adjoint embedding.

  Sources: [Borel], Theorem 4.5, p. 17. Requires: AA.3.3.

- **Rational points on closed orbits.** Let G be reductive over F, H ⊂ G a reductive F-subgroup and σ : G → H\G. Then σ_𝔸(G(𝔸)) ∩ (H\G)(F) is a finite union of G(F)-orbits. Assumptions: F a number field; G a reductive F-group (not necessarily connected); H ⊂ G a reductive F-subgroup.

  Sources: [Borel], Theorem 5.4, p. 20. Requires: AA.3.3; AA.1.4.


### AA.3.4 — Adelic reduction and arithmetic quotients

- **Adelic Siegel sets.** For T_1 ∈ a_0 and a compact subset ω ⊂ N_0(𝔸)M_0(𝔸)^1, the Siegel set is 𝔖(T_1, ω) = {p a k : p ∈ ω, a ∈ A_0(ℝ)^0, k ∈ K, β(H_0(a) - T_1) > 0 for all β ∈ Δ_0}. Assumptions: G a connected reductive group over F; K admissible.

  API: `Reduction.siegelSet` — Reduction.siegelSet T₁ ω : Set (AdelicPoints H); `Reduction.mem_siegelSet` — x ∈ siegelSet T₁ ω iff x = p a k with the stated conditions; `Reduction.siegelSet_mono` — siegelSet is antitone in T₁ (coordinatewise for Δ_0) and monotone in ω; `Reduction.siegelSet_mul_K` — siegelSet T₁ ω * K = siegelSet T₁ ω; `Reduction.siegelSet_center` — siegelSet is stable under A_G(ℝ)^0.

  Examples: For SL_2/ℚ, some Siegel set with compact ω meets every SL_2(ℚ)-orbit in SL_2(𝔸) (at ∞ it contains the standard fundamental domain of SL_2(ℤ)). For SL₂/ℚ choose the finite factor SL₂(ℤ̂), real N-window [−1,1], and A-parameter y≥1/2. Both the identity and n(1) lie in this Siegel set; their ratio is a nontrivial rational element. Thus this specified Siegel set cannot be a fundamental domain with disjoint rational translates.

  Sources: [Arthur], §8, p. 37. Requires: AA.3.1.

- **Siegel sets cover G(F)\G(𝔸).** There are T_1 and ω such that G(𝔸_F) = G(F) 𝔖(T_1, ω) (Borel–Harish-Chandra). Assumptions: G a connected reductive group over F; K admissible.

  Sources: [Arthur], Theorem 8.1, p. 37; [Borel], Theorem 4.6, p. 18. Requires: AA.3.4; AA.3.2; AA.1.4; Mathlib `ModularGroup.exists_smul_mem_fd`; AA.3.3.

- **Siegel property.** For a Siegel set 𝔖 = 𝔖(T_1, ω), the set {γ ∈ G(F) : γ𝔖 ∩ 𝔖 ≠ ∅} is finite. Assumptions: G a connected reductive group over F; K admissible.

  Sources: [Borel], Definition 4.1, p. 17; [BKT], Proposition 2.7(2), p. 9. Requires: AA.3.4; AA.3.6; AA.3.3; AA.1.4.

- **Finiteness of class numbers.** For every linear algebraic group G over F and every compact open subgroup U ⊂ G(𝔸_{F,f}), the double coset space G(F)\G(𝔸_{F,f})/U is finite; equivalently G(𝔸_F) = ⋃_{i=1}^h G(F) x_i G(F_∞) U for finitely many x_i. Assumptions: G a linear algebraic group over F; U compact open.

  Sources: [Borel], Theorem 5.1, p. 19; [Milne], Lemma 5.12, p. 57. Requires: AA.1.5; AA.1.4; AA.3.4; AA.1.2; AA.3.3.

- **Unipotent groups have class number one.** For a unipotent group N over F and compact open U ⊂ N(𝔸_f), N(𝔸_f) = N(F)U. Assumptions: N unipotent over F.

  Sources: [Borel], Corollary 2.5, p. 13. Requires: GlobalNumberFields, layer 6; AA.1.3.

- **Class numbers of semidirect products.** If G = H ⋉ N over F with N unipotent, then every double coset G(F)\G(𝔸_f)/U meets H(𝔸_f), and G(F)\G(𝔸_f)/U is finite if H(F)\H(𝔸_f)/(U ∩ H(𝔸_f)) is finite for all compact open U.

  Sources: [Borel], Proposition 2.7, p. 13. Requires: AA.3.4; AA.1.3.

- **Arithmetic subgroups attached to a level.** For compact open U ⊂ G(𝔸_{F,f}) and x ∈ G(𝔸_{F,f}), Γ_{x,U} = G(F) ∩ x U x⁻¹, viewed in G(F_∞) through the diagonal. It is a discrete subgroup of G(F_∞); for x, x′ and U, U′ the groups Γ_{x,U} and Γ_{x′,U′} are commensurable after conjugating by a rational element when x′ ∈ G(F) x U. Assumptions: G a connected reductive group over F.

  API: `Reduction.levelArithmetic` — Reduction.levelArithmetic x U : Subgroup (G(F)) := G(F) ∩ x U x⁻¹; `Reduction.levelArithmetic_discrete` — Its image in G(F_∞) is discrete; `Reduction.levelArithmetic_conj` — levelArithmetic (γ x u) U = γ (levelArithmetic x U) γ⁻¹ for γ ∈ G(F), u ∈ U; `Reduction.levelArithmetic_commensurable` — For U′ ≤ U, levelArithmetic x U′ has finite index in levelArithmetic x U.

  Examples: For GL_2/ℚ, levelArithmetic 1 GL_2(ℤ̂) = GL_2(ℤ). levelArithmetic x U depends on x and not only on U: for GL_2/ℚ and x = diag(p,1) at the place p, levelArithmetic x GL_2(ℤ̂) = diag(p,1) GL_2(ℤ) diag(p,1)⁻¹ ≠ GL_2(ℤ).

  Sources: [Milne], Lemma 5.13, p. 57. Requires: AA.1.3; AA.1.5; AA.1.2.

- **Component decomposition of a level quotient.** Let x_1, …, x_h represent G(F)\G(𝔸_{F,f})/U (class-number-finite). Then [g_∞] ↦ [(g_∞, x_i)] induces a homeomorphism ⊔_i Γ_{x_i,U}\G(F_∞) ≃ G(F)\G(𝔸_F)/U, equivariant for the right action of G(F_∞); the archimedean factor and the split centre are retained, and the finite set G(F)\G(𝔸_f)/U is in general not the whole quotient. Assumptions: G a connected reductive group over F; U compact open.

  Sources: [Milne], Lemma 5.13, p. 57; [Arthur], §2, p. 13. Requires: AA.3.4; AA.1.2.

- **Exponential integrability on the relative chamber.** Let β₁,…,β_r be a basis of (a₀^G)* and let 2ρ=∑c_iβ_i with every c_i>0. For any T the integral of exp(−2ρ(H)) over β_i(H)>β_i(T) is finite. For r=0 the domain is the zero-dimensional point and has the chosen finite Haar mass. Assumptions: r ≥ 0; a₀^G a real vector space of dimension r with a Haar (Lebesgue) measure; β_1, …, β_r a basis of its dual; c_1, …, c_r > 0 with 2ρ = Σ c_iβ_i; T ∈ a₀^G.

  Sources: no published source located for this estimate (gap: it is a direct computation in the chamber coordinates; [Arthur], §8, pp. 37–39, states only Theorem 8.1 and Lemma 8.2 and does not contain it). Requires: AA.3.1.

- **Siegel sets in G(𝔸)^1 have finite measure.** For an adelic Siegel set 𝔖 = 𝔖(T₁, ω), the measure of 𝔖 ∩ G(𝔸)^1 is finite. Assumptions: G connected reductive; ω compact.

  Sources: [Arthur], §8, p. 38. Requires: AA.3.4; AA.3.1; AA.2.2.

- **Finite volume of G(F)\G(𝔸)^1.** For a connected reductive group G/F, G(F)\G(𝔸_F)^1 has finite positive volume for the invariant quotient measure. For a connected nonreductive group the same conclusion follows after supplying its characteristic-zero Levi decomposition, compact unipotent adelic quotient and the associated product integration. Assumptions: G connected.

  Sources: [Borel], Theorem 5.8, p. 22. Requires: AA.3.4; AA.2.3; AA.2.1; AA.2.2; AA.3.1.

- **Tamagawa numbers are finite.** For connected reductive G, the Tamagawa number τ(G) of AA.2.4 is finite and positive.

  Sources: [Rosengarten], §1, p. 3. Requires: AA.3.4; AA.2.4.

- **When G(F)\G(𝔸) has finite volume.** For a linear algebraic group G over F, G(F)\G(𝔸_F) carries a nonzero G(𝔸)-invariant Radon measure of finite volume iff X*_F(G°) = 0. Assumptions: G linear algebraic over F.

  Sources: [Borel], Theorem 5.6(i), p. 21. Requires: AA.3.4; AA.2.1.

- **Anisotropic groups have compact quotients.** For connected reductive G over F whose derived group is F-anisotropic (equivalently, G has no proper F-parabolic subgroup), G(F)\G(𝔸_F)^1 is compact. Assumptions: G^der F-anisotropic.

  Sources: [Borel], Theorem 5.8, p. 22; [Arthur], §4, p. 21. Requires: AA.3.4; AA.3.1; ReductiveGroups, layer 7.

- **Isotropic groups have noncompact quotients.** For connected reductive G over F with a proper F-parabolic subgroup, G(F)\G(𝔸_F)^1 is not compact. Precisely: G(F)\G(𝔸)^1 is compact iff G(F) has no nontrivial unipotent element iff G^der is F-anisotropic.

  Sources: [Borel], Theorem 5.8, p. 22; [Arthur], §4, p. 21. Requires: AA.3.1; AA.1.3; ReductiveGroups, layer 7; AA.2.1.

- **Cocompact arithmetic groups contain no unipotents.** Let G be connected semisimple over ℚ and Γ = G(ℚ) ∩ U for a compact open U ⊂ G(𝔸_f). If Γ\G(ℝ) is compact then Γ contains no nontrivial unipotent element. Assumptions: G connected semisimple over ℚ; U compact open.

  Sources: [BKT], Remarks 1.4(1), p. 5. Requires: AA.3.4.

- **S-arithmetic subgroups are lattices.** Let G be connected semisimple over F, S a finite set of places containing the archimedean ones, and U^S ⊂ G(𝔸_F^S) compact open. Then Γ_S = G(F) ∩ G(F_S)U^S is a lattice in G(F_S) = ∏_{v∈S} G(F_v), cocompact iff G is F-anisotropic. Assumptions: G connected semisimple over F; S finite ⊇ archimedean places.

  Sources: [Rapinchuk], §2.6, p. 16; [Borel], Introduction, p. 6; §8, pp. 26–30. Requires: AA.3.4; AA.1.2; AA.1.3.

- **Finitely many G(𝒪)-orbits on rational flags.** For connected G and an F-parabolic P, (G/P)(F) is a finite union of orbits of an arithmetic subgroup; equivalently G(F) = ⋃_{i∈I} Γ x_i P(F) with I finite. Assumptions: F a number field; G connected reductive over F (Borel 7.3 allows any connected G; the consumers need only reductive G); P parabolic over F.

  Sources: [Borel], Lemma 7.2 and Theorem 7.3, p. 25. Requires: AA.3.4; AA.3.1.

- **Arithmetic quotients have finite volume.** For connected reductive G over F and Γ = G(F) ∩ U with U ⊂ G(𝔸_{F,f}) compact open, Γ\(G(F_∞)/A_G(ℝ)^0) has finite invariant volume. Assumptions: U compact open.

  Sources: [Borel], Theorem 5.6, p. 21. Requires: AA.3.4; AA.2.1.

- **Division algebras have no nontrivial unipotent units.** If D is a division algebra over a field of characteristic 0, then D^× contains no unipotent element other than 1. Assumptions: D a division algebra.

  Sources: [Milne], §3, Example 3.4, p. 34. Requires: Mathlib `QuaternionAlgebra`.

- **Arithmetic quotients of anisotropic groups are compact.** In the setting of arithmetic-quotient-finite-volume, Γ\(G(F_∞)/A_G(ℝ)^0) is compact iff G^der is F-anisotropic; for an anisotropic inner form SL_1(D) of a central division algebra D, H(F)\H(𝔸_F) and Γ\H(F_∞) are compact. Assumptions: G connected reductive.

  Sources: [Borel], Theorem 5.6(ii), p. 21. Requires: AA.3.4.


### AA.3.5 — Algebraic heights

- **Local polynomial comparison for algebraic heights.** For closed algebraic embeddings σ,τ of an affine group G into general linear groups and dual-augmented norms, there are integers N≥1 and positive c_v, with c_v=1 at almost all finite places, such that ‖τ(g)‖_v≤c_v‖σ(g)‖_v^N. The statement includes inverse coordinates. Assumptions: F a number field; G an affine algebraic group over F; σ: G → GL_m and τ: G → GL_{m′} closed immersions over F; local norms as in adelic-height applied to σ ⊕ σ^∨ and τ ⊕ τ^∨.

  Sources: [Arthur], §13, p. 70. Requires: AA.1.1; AA.1.5.

- **Properness of dual-augmented adelic height.** If r contains a closed embedding σ and σ∨, the product height in adelic-height has compact sublevel sets. At infinity it bounds both σ(g) and σ(g)⁻¹; at finite v its value is ≥1 and, when not integral in both directions, is ≥q_v. A height bound therefore allows only finitely many exceptional finite places. Assumptions: F a number field; G an affine algebraic group over F; σ: G → GL_n a closed immersion over F; r contains σ ⊕ σ^∨; local norms normalized as in adelic-height.

  Sources: [Arthur], §13, p. 70. Requires: AA.1.2; AA.1.3; AA.3.5.

- **Polynomial count of rational coordinates.** For a fixed number field F and integer d≥1, the number of a∈F^d with ∏_v max(1,|a₁|_v,…,|a_d|_v)≤R is at most C R^N for R≥1, for constants C,N depending only on F,d. The absolute values are normalized for the product formula. Assumptions: F a number field; d ≥ 1; absolute values normalized for the product formula (|·|_v = |·|^{[F_v:ℝ]} at archimedean v); R ≥ 1.

  Sources: [Arthur], §13, p. 70. Requires: GlobalNumberFields, layer 6.

- **Height functions on G(𝔸).** Choose a faithful F-algebraic representation r : G → GL_m containing a representation and its dual (and, if needed, a trivial summand), so the resulting height is proper and each local norm is at least 1. Define ‖x‖_r = product over v of ‖r(x)_v‖_v, using the entrywise maximum of normalized absolute values at finite v and the Hilbert–Schmidt norm raised to the archimedean multiplicity [F_v:ℝ] at infinity. The height is submultiplicative, has compact sublevel sets, and satisfies polynomial inverse and rational-point counting bounds, using the proper-height and counting results below. Assumptions: G a connected reductive group over F; r is an algebraic faithful representation chosen with the stated dual/properness condition; arbitrary abstract faithful point representations do not suffice.

  API: `Reduction.height` — Reduction.height r : AdelicPoints H → ℝ; `Reduction.height_mul_le` — height (x * y) ≤ height x * height y; `Reduction.height_inv_le` — ∃ C N, height x⁻¹ ≤ C * height x ^ N; `Reduction.isCompact_height_le` — {x | height x ≤ t} is compact for a suitable r; `Reduction.card_rational_height_le` — #{γ ∈ G(F) | height γ ≤ t} ≤ C t^N.

  Examples: For GL₁/ℚ with r(x)=diag(x,x⁻¹), height x⁻¹=height x; the real local factor is sqrt(x²+x⁻²), and each finite factor is max(|x|_p,|x⁻¹|_p). If G(F_∞) is noncompact the height is unbounded on G(𝔸); a height built from finite places only would be bounded on G(F_∞) and fail the compactness of height balls.

  Sources: [Arthur], §13, p. 70. Requires: AA.1.1; AA.1.5; AA.1.3; AA.1.4; AA.3.5.

- **Comparison of heights.** For two proper F-algebraic height representations r,r′ satisfying adelic-height, there are C,N>0 with ‖x‖_{r′}≤C‖x‖_r^N for every x∈G(𝔸_F), and conversely. Multiplication on either side by a fixed compact subgroup changes these heights by bounded factors. Assumptions: G a connected reductive group over F; Both representations are algebraic and define proper heights controlling their inverses.

  Sources: [Arthur], §13, p. 70. Requires: AA.3.5.

- **Heights on Siegel sets.** On a Siegel set 𝔖(T_1, ω) there are c, C > 0 such that for x = pak, c^{-1} e^{c‖H_0(a)‖} ≤ ‖x‖ ≤ C e^{C‖H_0(a)‖} (any norm on a_0); in particular log‖x‖ and ‖H_0(x)‖ are comparable on 𝔖 ∩ G(𝔸)^1 up to constants. Assumptions: G a connected reductive group over F.

  Sources: [Arthur], §13, p. 70. Requires: AA.3.5; AA.3.4; AA.3.1.


### AA.3.6 — Cusps for one fixed maximal compact

- **Finitely many cusps.** For an arithmetic subgroup Γ ⊂ 𝐆(ℚ), there are only finitely many Γ-conjugacy classes of ℚ-parabolic subgroups. Assumptions: G connected semisimple over ℚ; Γ arithmetic.

  Sources: [BKT], Proposition 2.7(1), p. 9; [Borel], Theorem 7.3, p. 25. Requires: AA.3.1; AA.3.4.

- **Finitely many fixed-K Siegel sets cover.** Let 𝐏_1, …, 𝐏_k represent the Γ-conjugacy classes of ℚ-parabolics and K a fixed maximal compact. There are Siegel sets 𝔖_i = U_i × A_{𝐏_i,t_i} × W_i associated to 𝐏_i and the same K whose images cover Γ\G/M. Assumptions: G connected semisimple over ℚ; Γ arithmetic; K fixed, M ⊂ K compact.

  Sources: [BKT], Proposition 2.7(1), p. 9; [BKT erratum], §1.1, p. 1. Requires: AA.3.6; AA.3.2; AA.3.4.

- **Finite overlaps of Siegel sets.** For Siegel sets 𝔖_1, 𝔖_2 associated to the same K, the set {γ ∈ Γ : γ𝔖_1 ∩ 𝔖_2 ≠ ∅} is finite; the same holds for the relatively compact closures of their unipotent and Levi factors.

  Sources: [BKT], Proposition 2.7(2), p. 9. Requires: AA.3.2; AA.3.3.

- **Deep Siegel sets of distinct parabolics are disjoint.** For distinct ℚ-parabolics 𝐏_1 ≠ 𝐏_2 and fixed bounded U_i, W_i (one K), the Siegel sets 𝔖_1, 𝔖_2 are disjoint once t_1, t_2 are sufficiently large.

  Sources: [BKT], Proposition 2.7(5), p. 9. Requires: AA.3.2; ReductiveGroups, layer 7.

- **Inequivalent cusps separate.** If 𝐏_1 and 𝐏_2 are not Γ-conjugate, then for fixed U_i, W_i and all sufficiently large t_1, t_2, γ𝔖_1 ∩ 𝔖_2 = ∅ for every γ ∈ Γ.

  Sources: [BKT], Proposition 2.7(3), p. 9. Requires: AA.3.6; AA.3.2.

- **Deep self-intersections come from the parabolic.** For fixed U, W and sufficiently large t, a Siegel set 𝔖 for 𝐏 and K satisfies γ𝔖 ∩ 𝔖 = ∅ for every γ ∈ Γ ∖ Γ_𝐏, where Γ_𝐏 = Γ ∩ 𝐏(ℚ).

  Sources: [BKT], Proposition 2.7(4), p. 9. Requires: AA.3.6; AA.3.2.

- **Comparison of Siegel-set conventions.** Fix K. Every Siegel set U × A_{P,t} × W associated to 𝐏 and K is contained in a Siegel set Ω A_{t′} K in Orr's sense for a Siegel triple (𝐏_0, 𝐒_0, K) with 𝐏_0 ⊂ 𝐏 a minimal ℚ-parabolic, and conversely; every Siegel set for K lies in a 𝐆(ℚ)-translate of one for K and a fixed minimal ℚ-parabolic.

  Sources: [BKT], §2.2, p. 8; [Orr], §§2.2–2.3 (Lemma 2.1), pp. 5–7. Requires: AA.3.2; AA.3.1.


### AA.3.7 — Subgroup containment and orbit maps

- **Compatible parabolic and torus for a subgroup.** For H⊂G reductive over ℚ, a Siegel triple (P_H,S_H,K_H), and K_G containing K_H with Cartan involution stabilizing S_H, choose a parabolic ℚ-subgroup Q⊂G with Levi Z_G(S_H) and N_H⊂R_u(Q), then a minimal P_G⊂Q. Its Cartan-stable Siegel torus S_G contains S_H, satisfies S_G∩H=S_H, and N_H⊂N_G. Assumptions: H ⊂ G reductive ℚ-groups; (P_H, S_H, K_H) a Siegel triple for H with S_H ℚ-split (the general case reduces to this by conjugating with an element of R_u(P_H)(ℝ), Orr §4.1); K_G ⊂ G(ℝ) maximal compact with K_H ⊂ K_G whose Cartan involution stabilises S_H.

  Sources: [Orr], §4.2, Lemmas 4.2–4.6, pp. 15–17; [Orr–Schnell], §§A,E, pp. 1232, 1236. Requires: AA.3.1; AA.3.2; ReductiveGroups, layer 7.

- **Finite root-cone comparison.** In containment-parabolic-torus, for any t>0 there is t′∈(0,1] such that every a∈A_{H,t} belongs to wA_{G,t′}w⁻¹ for some w in the finite Weyl group of S_G satisfying N_H,N_Z⊂wN_Gw⁻¹. Roots of S_G vanishing on S_H take the value 1 ≥ t′ on a, so they impose no further condition. Assumptions: the notation and hypotheses of containment-parabolic-torus (S_H ℚ-split, K_H ⊂ K_G, Cartan involution of K_G stabilising S_H); Z = Z_G(S_H), N_Z = R_u(P_G ∩ Z); t > 0.

  Sources: [Orr], §4.3, Proposition 4.7 and Lemmas 4.8–4.9, pp. 17–20; [Orr–Schnell], §§A,E, pp. 1232, 1236. Requires: AA.3.7; ReductiveGroups, layer 7.

- **Rational and compact Weyl representatives.** For each admissible Weyl element w in containment-finite-root-cones, choose a compact representative w_K∈K_G and a representative w_Q=u⁻¹w′_Qu with w′_Q∈G(ℚ), u∈N_Z(ℝ), and w′_Q⁻¹w_Q∈N_G(ℝ). Their quotient can be chosen in the identity component of Z_G(S_G)(ℝ). Assumptions: the notation and hypotheses of containment-finite-root-cones; w ranges over the finite set of Weyl elements of S_G with N_H, N_Z ⊂ wN_Gw⁻¹; u ∈ N_Z(ℝ) with uS_Gu⁻¹ a maximal ℚ-split torus of P_G ∩ Z; the maximal real split torus containing S_G is chosen stable under the Cartan involution of K_G.

  Sources: [Orr], §4.4, Lemmas 4.10–4.11, pp. 20–21; [Orr–Schnell], §§A,E, pp. 1232, 1236. Requires: AA.3.7; ReductiveGroups, layer 7; RepresentationTheory/LieGroups, layer 9.

- **Uniform compact factors for subgroup Siegel sets.** With Ω_H⊂N_HM_H compact, choose a compact Ω_G⊂N_GM_G and, for every admissible w, a compact B_w⊂S_G(ℝ)^0 such that w′_Q⁻¹Ω_H⊂Ω_G w_K⁻¹ B_w K_Z. All these choices range over a finite Weyl set. Assumptions: the notation and hypotheses of containment-weyl-representatives; Ω_H ⊂ N_H(ℝ)M_H(ℝ)^+ compact; K_Z = K_G ∩ Z_G(S_H)(ℝ), maximal compact in Z_G(S_H)(ℝ) by the Cartan hypothesis.

  Sources: [Orr], §4.5, Lemmas 4.12–4.13, pp. 21–22; [Orr–Schnell], §§A,E, pp. 1232, 1236. Requires: AA.3.7; AA.3.2.

- **Containment of subgroup Siegel sets.** Let 𝐇 ⊂ 𝐆 be reductive ℚ-groups, (𝐏_H, 𝐒_H, K_H) a Siegel triple for 𝐇 and 𝔖_H = Ω A_t K_H a Siegel set. Let K_G ⊂ 𝐆(ℝ) be maximal compact with K_H ⊂ K_G and whose Cartan involution stabilises 𝐒_H. Then there are a Siegel triple (𝐏_G, 𝐒_G, K_G), a Siegel set 𝔖_G for it and a finite C ⊂ 𝐆(ℚ) with 𝔖_H ⊂ C·𝔖_G; moreover R_u(𝐏_H) ⊂ R_u(𝐏_G) and 𝐒_H = 𝐒_G ∩ 𝐇. Assumptions: 𝐇 ⊂ 𝐆 reductive over ℚ; θ_{K_G} stabilises 𝐒_H.

  Sources: [Orr–Schnell], Theorem 1, pp. 1231–1232; §§A,E; [Orr], §4.6, Proposition 4.14, pp. 22–23; [Orr], §4.1, p. 15. Requires: AA.3.7; AA.3.6.

- **Stability of the subgroup under the Cartan involution suffices.** In the setting of orr-schnell-containment with K_H ⊂ K_G: if the Cartan involution Θ of 𝐆 for K_G stabilises 𝐇, then Θ|_𝐇 is the Cartan involution of 𝐇 for K_H and Θ stabilises the torus 𝐒_H of every Siegel triple, so the theorem applies. The converse fails for 𝐆 = SL_2, 𝐇 = {(a, db; b, a) : a² − db² = 1} with d a positive non-square rational, K_G = SO_2(ℝ), 𝐒_H = {1}.

  Sources: [BKT erratum], Proof of Theorem 1.2, p. 3; [Orr–Schnell], Remark 2, pp. 1231–1232. Requires: AA.3.7; RepresentationTheory/LieGroups, layer 9.

- **Intersecting Siegel sets with a subgroup.** Let 𝐇 ⊂ 𝐆 be reductive over ℚ, K_H = K_G ∩ 𝐇(ℝ) maximal compact, and assume every K_H-Siegel set lies in finitely many 𝐆(ℚ)-translates of a K_G-Siegel set (the conclusion of orr-schnell-containment). Then for every K_G-Siegel set 𝔖_G there are a K_H-Siegel set 𝔖_H and a finite F ⊂ 𝐇(ℚ) with 𝔖_G ∩ 𝐇(ℝ) ⊂ F 𝔖_H. Assumptions: as stated, with the forward-containment hypothesis.

  Sources: [BGST], §28, Proposition 28.1, pp. 14–15; [BKT erratum], §1.5, pp. 2–3. Requires: AA.3.7; AA.3.6; AA.3.2.

- **Compact inclusion alone does not give Siegel containment.** There are inclusions of reductive (even semisimple) ℚ-groups 𝐇 ⊂ 𝐆 with K_H ⊂ K_G for which some 𝐇-Siegel set is not covered by finitely many 𝐆(ℚ)-translates of K_G-Siegel sets; the Cartan compatibility hypothesis of orr-schnell-containment cannot be removed.

  Sources: [Orr–Schnell], §§B–C, pp. 1232–1234. Requires: AA.3.7; AA.3.6.

- **Preimages of Siegel sets under orbit maps.** Let 𝐇 ⊂ SL(V) be reductive over ℚ, x_0 ∈ X = SL(V_ℝ)/SO(b_0) with K_H = Stab_{𝐇(ℝ)}(x_0) and the Cartan involution of x_0 stabilising Lie 𝐇, and ι : 𝐇(ℝ)/K_H → X the orbit map. For every Siegel set 𝔖 ⊂ X, ι⁻¹(𝔖) is contained in finitely many Siegel sets of 𝐇(ℝ)/K_H associated to K_H.

  Sources: [BKT], §4.5, pp. 17–18 (arXiv v2); JAMS pp. 932–933. Requires: AA.3.7; AA.3.2.

- **Images of Siegel sets under orbit maps.** In the setting of orbit-map-siegel-preimage, every Siegel set of 𝐇(ℝ)/K_H is mapped by ι into finitely many Siegel sets of X.

  Sources: [BKT], §4.5, p. 18 (arXiv v2); JAMS p. 933. Requires: AA.3.7; AA.3.2; AA.3.6.


## AA.4 — Approximation, neat levels and Hecke maps

Weak and strong approximation have different hypotheses and obstructions. Develop torsors and arithmetic closure lemmas explicitly, then construct neat levels, actual topological level quotients, stabilizer-aware fibre formulas and Hecke maps. The final abelian calculations isolate the residual quotient of quaternion groups.

### AA.4.1 — Weak approximation and torsors

- **Weak approximation.** An affine algebraic group G over F has weak approximation with respect to a finite set S of places if G(F) is dense in G(F_S) = ∏_{v∈S} G(F_v); it has weak approximation if this holds for every finite S. Assumptions: G affine algebraic over F.

  API: `Approximation.HasWeakApproximation` — HasWeakApproximation G S : Prop := DenseRange (diagonal G(F) → G(F_S)); `Approximation.HasWeakApproximation.mono` — Weak approximation for S implies it for every S′ ⊆ S; `Approximation.HasWeakApproximation.prod` — Weak approximation for G and H gives it for G × H; `Approximation.HasWeakApproximation.of_iso` — Invariant under isomorphisms of F-groups.

  Examples: G_a has weak approximation for every finite S (weakApproximation_denseRange). μ_2 over ℚ fails weak approximation for S = {∞, 2}: the diagonal image {(1,1), (−1,−1)} is not dense in {±1}².

  Sources: [HW], §1 (notation and conventions), p. 6. Requires: AA.1.2; Tau Ceti `TauCeti.GlobalNumberFields.weakApproximation_denseRange`.

- **Weak approximation for GL_n, SL_n and split tori.** GL_n, SL_n, G_a and split tori G_m^r over F have weak approximation.

  Sources: [Rapinchuk], Lemma 1.2, proof, p. 3. Requires: AA.4.1; Tau Ceti `TauCeti.GlobalNumberFields.weakApproximation_denseRange`; AA.1.4; GlobalNumberFields, layer 1.

- **Torsors under an affine group over a field.** For an affine algebraic group G over a field k (Hopf algebra H), a G-torsor is a nonzero finitely generated commutative k-algebra A with a coaction A → A ⊗ H making Spec A a right G-space such that A ⊗_k k̄ ≅ H ⊗_k k̄ as comodule algebras (the isomorphism is of comodule algebras; geometric points alone are insufficient for nonreduced group schemes). It is trivial if X(k) ≠ ∅. Assumptions: k a field; G affine algebraic over k.

  API: `Approximation.Torsor` — Structure: the algebra, the coaction, the geometric trivialization; `Approximation.Torsor.IsTrivial` — IsTrivial X : Prop := Nonempty (A →ₐ[k] k); `Approximation.Torsor.baseChange` — Base change along a field extension k → k′; `Approximation.Torsor.trivial_iff_iso` — X is trivial iff X is isomorphic to G acting on itself.

  Examples: G acting on itself is trivial. G_m acting on A¹ by scaling is not a torsor: A¹(k̄) has two orbits.

  Sources: [HW], Lemme 6.3, p. 22. Requires: Tau Ceti `TauCeti.HopfAlgebra.points`.

- **Kneser's theorem: local triviality of torsors.** For G connected semisimple simply connected over a nonarchimedean local field F_v of characteristic 0, every G-torsor over F_v is trivial (H¹(F_v, G) = 1). Assumptions: F_v nonarchimedean of characteristic 0; G semisimple simply connected.

  Sources: [HW], §6.2, p. 22; [Khayutin], §2.3, arXiv v3 pp. 15–16; Annals p. 162. Requires: AA.4.1; Tau Ceti `TauCeti.simplyConnectedSemisimpleCommHopfAlgProperty`.

- **Hasse principle for simply connected groups.** For G connected semisimple simply connected over a number field F, a G-torsor over F is trivial iff it is trivial over F_v for every real place v (H¹(F, G) → ∏_{v real} H¹(F_v, G) is bijective). Assumptions: G semisimple simply connected over F.

  Sources: [Khayutin], §2.3, arXiv v3 pp. 15–16; Annals p. 162; [HW], Lemme 6.3, p. 22. Requires: AA.4.1.

- **Weak approximation for simply connected groups.** A connected semisimple simply connected group G over a number field F has weak approximation; more generally (property (⋆)) a torsor under G that has points at all real places has an F-point and satisfies weak approximation. Assumptions: G semisimple simply connected over F.

  Sources: [HW], Théorème 6.1, proof, p. 21. Requires: AA.4.1.


### AA.4.2 — Strong approximation and arithmetic closures

- **Strong approximation.** An affine algebraic group G over F has strong approximation with respect to a finite set S of places if G(F) is dense in G(𝔸_F^S), the adelic points away from S (equivalently G(F)G(F_S) is dense in G(𝔸_F)). Assumptions: S a finite set of places.

  API: `Approximation.HasStrongApproximation` — HasStrongApproximation G S : Prop := DenseRange (diagonal G(F) → G(𝔸^S)); `Approximation.HasStrongApproximation.mul_open` — For every open subgroup U ⊂ G(𝔸^S), G(𝔸^S) = G(F)U; `Approximation.HasStrongApproximation.mono` — Strong approximation for S implies it for S′ ⊇ S; `Approximation.HasStrongApproximation.classNumber_one` — If it holds for S = archimedean places then G(F)\G(𝔸_f)/U is a point for every compact open U.

  Examples: G_a over F has strong approximation for S = archimedean places (GlobalNumberFields layer 6). G_m over ℚ fails for S = {∞}: ℚ^× ∩ ℤ̂^× = {±1}, so ℚ^× is discrete in 𝔸_f^× (AA.1.3).

  Sources: [Rapinchuk], §2.1, Definition, p. 7; restated in Theorem 2.3, p. 12; [Borel], §2.6, p. 13. Requires: AA.1.2; AA.0.3.

- **Strong approximation for unipotent groups.** Every unipotent group over F (in particular G_a) has strong approximation with respect to any nonempty finite S containing the archimedean places. Assumptions: N unipotent over F.

  Sources: [Borel], §2.6, p. 13. Requires: AA.4.2; GlobalNumberFields, layer 6; AA.3.4.

- **Tori never have strong approximation for finite S.** For a nontrivial torus T over F and a finite set S of places, T(F) is not dense in T(𝔸^S); the quotient of T(𝔸^S) by the closure of T(F) has infinite exponent. Weak approximation for tori is asserted only for split tori (weak-approximation-gln). Assumptions: T a nontrivial F-torus; S finite.

  Sources: [Rapinchuk], Proposition 2.1, p. 9. Requires: AA.4.2; AA.1.3; AA.1.4; Chebotarev, layer 10.

- **Closures of Zariski-dense subgroups are open.** Let G be connected absolutely almost simple over ℚ_p, and Γ⊂G(ℚ_p) a Zariski-dense nondiscrete subgroup. Its closure is open in G(ℚ_p), using the p-adic analytic closed-subgroup theorem. This statement does not extend to arbitrary E/ℚ_p with E-Zariski density alone. Assumptions: G connected absolutely almost simple over ℚ_p; Γ⊂G(ℚ_p) Zariski dense and nondiscrete.

  Sources: [Rapinchuk], Lemma 2.7, p. 16. Requires: `ReductiveGroupsPartII:RG2.0`.

- **Borel density for S-arithmetic groups.** For G connected absolutely almost simple over F and S a finite set of places containing the archimedean ones with G_S noncompact, the S-arithmetic group G(𝒪_{F,S}) is infinite and Zariski dense in G. Assumptions: G absolutely almost simple over F.

  Sources: [Rapinchuk], Theorem 2.3, remark after it, p. 12. Requires: AA.3.4.

- **Open subgroups of finite covolume have finite index.** If Δ is an open subgroup of a locally compact group H such that H/Δ carries a nonzero finite H-invariant Radon measure, then Δ has finite index in H. Assumptions: H locally compact; Δ open; The quotient measure is nonzero, finite and Radon.

  Sources: [Rapinchuk], §2.6, p. 16. Requires: AA.2.2.

- **Strong approximation through finitely many places.** For S containing the archimedean places, G has strong approximation with respect to S iff for every finite set S₁ of places disjoint from S, the S ∪ S₁-arithmetic group G(𝒪(S ∪ S₁)) is dense in G_{S₁} = ∏_{v∈S₁} G(F_v). Assumptions: S ⊇ archimedean places.

  Sources: [Rapinchuk], §2.6, p. 16. Requires: AA.4.2; AA.1.5.

- **S-arithmetic groups are not discrete at an extra place.** If G is absolutely almost simple, G_S is noncompact and S₁ is finite, nonempty and disjoint from S, then the image of G(𝒪(S ∪ S₁)) in G_{S₁} is not discrete and is infinite. Assumptions: G_S noncompact; F a number field; G connected absolutely almost simple; S finite containing the archimedean places; S₁ finite, nonempty and disjoint from S.

  Sources: [Rapinchuk], §2.6, p. 16. Requires: AA.3.4.

- **Finite covolume of a projection closure.** Let Γ be a lattice in locally compact second-countable groups A×B, and Δ the closure of its B-projection. Then Δ\B carries a nonzero finite B-invariant Radon measure. Assumptions: A and B second countable locally compact Hausdorff groups; Γ ⊂ A×B a lattice: a discrete subgroup with a nonzero finite (A×B)-invariant Radon measure on Γ\(A×B); B acts on Γ\(A×B) and on Δ\B by right translation in the second factor.

  Sources: [Rapinchuk], §2.6, pp. 16–17, proof following Theorem 2.3. Requires: AA.2.2.

- **Native-field Lie algebra of an arithmetic closure.** For absolutely almost simple G/F, S containing all infinite places with G(F_S) noncompact, and finite nonempty S₁ disjoint from S, the closure of G(O_{F,S∪S₁}) in ∏_{v∈S₁}G(F_v) has full native F_v Lie algebra in every factor and, for the places of S₁ above one rational prime p, no proper graph Lie subalgebra of the ℚ_p-Lie algebra of ∏_{v|p}G(F_v) linking distinct places (places above distinct primes are separated by the pro-p splitting of compact open subgroups). This is an arithmetic statement requiring the full S-integral subgroup, rather than mere F_v-Zariski density. Assumptions: F a number field; G connected absolutely almost simple over F; S a finite set of places containing all archimedean places with G_S noncompact; S₁ a finite nonempty set of finite places disjoint from S.

  Sources: [Rapinchuk], §§2.6–2.7, pp. 16–18 (the ℚ single-prime branch; the native-field and independent-factor extension is an additional arithmetic input). Requires: AA.4.2.

- **Openness in a finite product of completions.** Given arithmetic-native-lie-closure and Cartan's closed-subgroup theorem applied, for each rational prime p, to the ℚ_p-analytic group ∏_{v∈S₁, v|p}G(F_v), the closure Δ of G(O_{F,S∪S₁}) is open in that finite product. Its index is finite by projection-finite-covolume. Assumptions: F a number field; G connected absolutely almost simple over F; S a finite set of places containing the archimedean places with G_S noncompact; S₁ a finite nonempty set of finite places disjoint from S.

  Sources: [Rapinchuk], §2.6, pp. 16–17 (Cartan and finite-covolume argument). Requires: AA.4.2; AA.3.4.

- **Elimination of arithmetic finite-index closures.** For G/F absolutely almost simple simply connected, S containing infinity with G(F_S) noncompact, and S₁ finite disjoint from S, an open finite-index closure of G(O_{F,S∪S₁}) in ∏_{v∈S₁}G(F_v) is the whole product. At isotropic factors this follows from the local Kneser–Tits/Tits finite-index theorem; anisotropic factors need the separate global arithmetic congruence argument. Assumptions: F a number field; G connected, absolutely almost simple and simply connected over F; S a finite set of places containing the archimedean places with G_S noncompact; S₁ a finite set of finite places disjoint from S; the closure of G(𝒪_{F,S∪S₁}) in G_{S₁} is open of finite index.

  Sources: [Rapinchuk], §2.6, pp. 16–17 (isotropic factors; the anisotropic arithmetic step is separate). Requires: AA.4.2; `ReductiveGroupsPartII:RG2.4` (kneser-tits-local).

- **Arithmetic closure at one isotropic place.** Let G be connected, absolutely almost simple and simply connected over a number field F, S a finite set of places containing the archimedean ones with G_S noncompact, v ∉ S a finite place at which G is F_v-isotropic, and W ⊂ G(𝔸_F^{S∪{v}}) a compact open subgroup. Then the image of Γ_W = G(F) ∩ (G_S × G(F_v) × W) is dense in G(F_v). Consequently the closure of G(F)G_S in G(𝔸_F) contains G(F_v), placed at v. Assumptions: F a number field; G connected, absolutely almost simple and simply connected over F; S finite, containing the archimedean places, with G_S noncompact; v ∉ S a finite place with G isotropic over F_v; W ⊂ G(𝔸_F^{S∪{v}}) a compact open subgroup.

  Sources: [Rapinchuk], §2.6, pp. 16–17; [Rapinchuk], Remark 1 after Theorem 2.3, p. 12. Requires: AA.3.4; AA.4.2; `ReductiveGroupsPartII:RG2.4` (kneser-tits-local).

- **Almost all local factors are isotropic.** Let G be a connected semisimple group of positive dimension over a number field F. Then G is quasi-split, hence isotropic, over F_v for all but finitely many places v. In particular, for finite S the set of places v ∉ S at which G is F_v-anisotropic is finite. Assumptions: F a number field; G connected semisimple over F with dim G > 0.

  Sources: [Arthur], §16, p. 89. Requires: `ReductiveGroupsPartII:RG2.3` (reductive-model, lang-theorem, hyperspecial-vertices: a reductive 𝒪_{F,S}-model exists for some finite S, its special fibres are quasi-split by Lang's theorem, and a Borel of the special fibre lifts along the henselian 𝒪_v); ReductiveGroups, layer 9; ReductiveGroups, layer 7.

- **Strong approximation: sufficiency.** Let G be connected, absolutely almost simple and simply connected over a number field F, and S a finite set of places containing the archimedean ones with G_S = ∏_{v∈S} G(F_v) noncompact. Then G has strong approximation with respect to S. Assumptions: G absolutely almost simple simply connected over F; S ⊇ archimedean places; G_S noncompact.

  Sources: [Rapinchuk], Theorem 2.3, p. 12; [Rapinchuk], Remark 1 after Theorem 2.3, p. 12. Requires: AA.4.2; AA.4.1.

- **Strong approximation: necessity.** In the setting of strong-approximation-sufficiency without the hypotheses: if G has strong approximation with respect to S then G_S is noncompact and G is simply connected. Assumptions: G connected absolutely almost simple over F; S finite.

  Sources: [Rapinchuk], §2.3, p. 11. Requires: AA.4.2; AA.1.3; Chebotarev, layer 10; Tau Ceti `TauCeti.simplyConnectedSemisimpleCommHopfAlgProperty`.

- **Strong approximation for semisimple groups.** Let G be connected semisimple simply connected over F and S ⊇ archimedean places finite such that G′(F_S) is noncompact for every F-simple factor G′ of G. Then G(𝔸_F) = G(F)·G(F_S)·U for every compact open U ⊂ G(𝔸_F^S); in particular G(F)\G(𝔸_f)/U is a single point when S is the set of archimedean places. Assumptions: G semisimple simply connected; each F-simple factor noncompact at S.

  Sources: [Arthur], Theorem 2.1(a), p. 12. Requires: AA.4.2; AA.1.4; ReductiveGroups, layer 6.


### AA.4.3 — Neat elements and levels

- **Eigenvalues of algebraic tensor subquotients.** For a closed faithful algebraic representation ρ of a finite-type affine group G over a characteristic-zero field and any algebraic representation σ, every eigenvalue of σ(g) over an algebraic closure lies in the multiplicative subgroup generated by the eigenvalues of ρ(g). Assumptions: k a field of characteristic 0 with algebraic closure k̄; G an affine group scheme of finite type over k; ρ : G → GL(V) a closed immersion; σ : G → GL(W) an algebraic representation; g ∈ G(k).

  Sources: [Milne], §3, p. 34. Requires: `ReductiveGroupsPartII:RG2.0`.

- **Neat elements.** An automorphism α of a finite-dimensional vector space over a subfield of ℂ is neat if its eigenvalues in ℂ generate a torsion-free subgroup of ℂ^×. An element g ∈ G(F) of a linear algebraic group over a number field F is neat if ρ(g) is neat for one faithful F-representation ρ; a subgroup of G(F) is neat if all its elements are. Assumptions: F a number field with a fixed embedding τ : F → ℂ; the notion does not depend on τ, since an automorphism of ℂ carries one eigenvalue group isomorphically onto the other. It is weaker than neatness of g as an element of (Res_{F/ℚ}G)(ℚ), whose eigenvalues include all Galois conjugates: √2 ∈ G_m(ℚ(√2)) is neat, but ±√2 generate a group containing −1; G linear algebraic; The group representation is algebraic and faithful, rather than merely injective as a map on F-rational points. In Hopf coordinates it is induced by a surjective GL_n-coordinate morphism O(GL_n)→O(G).

  API: `Neat.IsNeatAut` — IsNeatAut α : Prop for α ∈ GL(V), V over a subfield of ℂ; `Neat.IsNeat` — IsNeat g : Prop for g ∈ G(F), via a chosen faithful representation; `Neat.IsNeatSubgroup` — A subgroup all of whose elements are neat; `Neat.IsNeat.pow` — If g is neat then so is g^n; `Neat.IsNeat.torsion_eq_one` — A neat element of finite order is 1; `Neat.algebraicPointMap` — For a GL_n coordinate bialgebra morphism r:O(GL_n)→O(G) and an embedding F→ℂ, evaluate r on F-points through Tau Ceti GeneralLinear.pointsMulEquiv and extend matrix entries to ℂ; `Neat.IsAlgebraicPointHom` — The point homomorphism is induced by such an algebraic coordinate morphism, using the specified coefficient embedding; `Neat.IsFaithfulAlgebraicPointHom` — The point homomorphism is induced by a surjective coordinate morphism, hence a closed algebraic immersion; this is stronger than injectivity on rational points.

  Examples: diag(2, 1/2) ∈ SL_2(ℚ) is neat. The order-3 element (0 −1; 1 −1) of SL_2(ℤ) is not neat; nor is a torsion-free element whose eigenvalue group contains ζ_3, such as (0 −1; 1 1)·(scalar 2) in GL_2(ℚ).

  Sources: [Milne], §3, p. 34. Requires: AA.1.3.

- **Neatness does not depend on the representation.** If ρ(g) is neat for one faithful representation ρ of G then σ(g) is neat for every representation σ of G defined over a subfield of ℂ. Assumptions: G a finite-type linear algebraic group over the number field F; ρ is a faithful algebraic representation (a closed immersion), σ is an algebraic representation, and the compared complex point actions use the same embedding F→ℂ. Arbitrary homomorphisms of the abstract rational-point group are excluded.

  Sources: [Milne], §3, p. 34. Requires: AA.4.3.

- **Neatness is stable under subgroups, conjugation and homomorphisms.** Subgroups of neat subgroups are neat; conjugates of neat subgroups by elements of G(F) are neat; and for a homomorphism φ : G → G′ of linear algebraic groups the image φ(Γ) of a neat subgroup Γ is neat. Assumptions: G, G′ linear algebraic over F.

  Sources: [Milne], §3, p. 34. Requires: AA.4.3.

- **Neat groups are torsion free.** A neat subgroup of G(F) is torsion free. Assumptions: G linear algebraic.

  Sources: [Milne], §3, p. 34. Requires: AA.4.3.

- **Neat compact open levels.** A compact open subgroup U ⊂ G(𝔸_{F,f}) is neat if G(F) ∩ x U x⁻¹ is neat for every x ∈ G(𝔸_{F,f}) (convention: all rational intersections, not every element of U). Assumptions: G linear algebraic over F.

  API: `Neat.IsNeatLevel` — IsNeatLevel U : Prop := ∀ x, IsNeatSubgroup (levelArithmetic x U); `Neat.IsNeatLevel.mono` — A compact open subgroup of a neat level is neat; `Neat.IsNeatLevel.conj` — Conjugates of neat levels are neat; `Neat.IsNeatLevel.torsionFree` — All levelArithmetic x U are torsion free.

  Examples: The level U(3) ⊂ GL_2(ℤ̂) is neat: every GL_2(ℚ) ∩ xU(3)x⁻¹ (x ∈ GL_2(𝔸_f)) is neat by neat-criterion-one-prime at p = 3. For x = 1 this group is Γ(3) = SL_2(ℤ) ∩ U(3), since a determinant in {±1} congruent to 1 mod 3 equals 1. GL_2(ℤ̂) is not neat: it contains −1 ∈ GL_2(ℤ).

  Sources: [Milne], §5, p. 58. Requires: AA.4.3; AA.3.4.

- **Stable lattices for compact p-adic matrix groups.** Every compact subgroup C⊂GL_n(ℚ_p) preserves a full ℤ_p-lattice Λ⊂ℚ_p^n. It is conjugate into GL_n(ℤ_p). Assumptions: p a prime; n ≥ 1; C ⊂ GL_n(ℚ_p) a compact subgroup.

  Sources: [Milne], Proposition 3.5, p. 34. Requires: AA.1.5.

- **Distance of p-adic roots of unity from one.** If ζ≠1 is a root of unity in an algebraic closure of ℚ_p, then |ζ−1|_p≥p^{−1/(p−1)}. More precisely a primitive p^k-th root has distance p^{−1/(p^{k−1}(p−1))}, while a root of order prime to p has distance one. Assumptions: p a prime; ℚ̄_p an algebraic closure of ℚ_p with the unique extension of |·|_p; ζ ∈ ℚ̄_p a root of unity.

  Sources: [Milne], Proposition 3.5, p. 34. Requires: GlobalNumberFields, layer 0.

- **Eigenvalue bound for congruence matrices.** If M∈1+p^a M_n(ℤ_p), every eigenvalue λ of M in ℚ̄_p satisfies |λ−1|_p≤p^−a. The eigenvalues and their inverses then lie in the multiplicative open ball used by padic-ball-torsion-free when p≥3,a≥1 or p=2,a≥2. Assumptions: p a prime; a ≥ 1; M ∈ 1 + p^a M_n(ℤ_p); eigenvalues taken in ℚ̄_p with the extended absolute value.

  Sources: [Milne], Proposition 3.5, p. 34. Requires: AA.4.3.

- **Principal units of small radius are torsion free.** In an algebraic closure of ℚ_p, the multiplicative group {λ : |λ − 1|_p < p^{−1/(p−1)}} contains no root of unity other than 1; in particular eigenvalues of elements of 1 + pM_n(ℤ_p) (p ≥ 3) or 1 + 4M_n(ℤ_2) generate a torsion-free group. Assumptions: p prime.

  Sources: [Milne], Proposition 3.5, p. 34. Requires: AA.4.3.

- **A one-prime criterion for neatness.** Let ρ : G ↪ GL_n be a faithful representation over ℚ (after restriction of scalars) and U ⊂ G(𝔸_f) compact open. If for some prime p ≥ 3 the projection of ρ(U) to GL_n(ℚ_p) lies in 1 + p M_n(ℤ_p) (for p = 2, in 1 + 4M_n(ℤ_2)), then U is neat. Assumptions: ρ faithful; U compact open; p ≥ 3 (or p = 2 with level 4).

  Sources: [Milne], Proposition 3.5, p. 34. Requires: AA.4.3; AA.1.5.

- **Neat levels exist.** Every compact open U ⊂ G(𝔸_{F,f}) contains a neat normal open subgroup of finite index; every arithmetic subgroup of G(F) contains a neat subgroup of finite index defined by congruence conditions (Borel). Assumptions: G linear algebraic over F.

  Sources: [Milne], Proposition 3.5, p. 34. Requires: AA.4.3; AA.1.5.


### AA.4.4 — Double cosets and level topology

- **Nested-level map on double cosets.** For a group G, H ≤ G and K′ ≤ K ≤ G, π : H\G/K′ → H\G/K, [g] ↦ [g], is well defined and surjective, and for each g the map K/K′ → π⁻¹([g]), kK′ ↦ [gk], is a surjection; no normality is assumed. Assumptions: G a group; H, K′ ≤ K subgroups.

  API: `LevelMaps.levelMap` — levelMap H hK : DoubleCoset.Quotient H K′ → DoubleCoset.Quotient H K; `LevelMaps.levelMap_mk` — levelMap (mk g) = mk g; `LevelMaps.levelMap_surjective` — levelMap is surjective; `LevelMaps.fibreSurj` — fibreSurj g : K ⧸ K′.subgroupOf K → levelMap ⁻¹' {mk g}, kK′ ↦ mk (g k), surjective; `LevelMaps.levelMap_comp` — levelMap for K″ ≤ K′ ≤ K composes.

  Examples: For K′ = K, levelMap is the identity. For H = G and [K : K′] = 2 there is one fine class, so the fibre size 1 is not the index 2.

  Sources: [LT], §3.2, (15), p. 11. Requires: Mathlib `DoubleCoset.Quotient`; Mathlib `DoubleCoset.eq`.

- **Finite-index bound for level changes.** For K′ ≤ K of finite index N, every fibre of H\G/K′ → H\G/K has at most N elements; if H\G/K is finite of cardinality h then H\G/K′ is finite of cardinality at most Nh. No normality, freeness or neatness is assumed. Assumptions: K′ ≤ K, [K : K′] = N finite.

  Sources: [LT], §3.2.3, p. 16. Requires: AA.4.4.

- **Conjugate levels give equivalent double-coset sets.** For H, K ≤ G and a ∈ G, [g] ↦ [ga] is a bijection H\G/(aKa⁻¹) ≃ H\G/K with inverse [x] ↦ [xa⁻¹]; a need not normalize H. Assumptions: G a group.

  Sources: [LT], §3.2, pp. 11–16 (conjugate lattice stabilizers; the abstract bijection is a direct double-coset calculation). Requires: Mathlib `DoubleCoset.eq`; Mathlib `DoubleCoset.Quotient`.

- **Index of product subgroups with finite exceptional support.** For groups H_v with subgroups S_v ≤ H_v equal to H_v outside a finite set B and of finite index for v ∈ B, (∏ H_v)/(∏ S_v) ≃ ∏_{v∈B} H_v/S_v and [∏ H_v : ∏ S_v] = ∏_{v∈B} [H_v : S_v]; in particular for compact open product levels in G(𝔸_f), [∏ K_v : ∏ K′_v] = ∏_v [K_v : K′_v]. Assumptions: S_v = H_v outside finite B.

  Sources: [LT], §3.2.1, (20), p. 14. Requires: AA.1.5; Mathlib `Subgroup.index_prod`.

- **Level quotients.** For compact open U ⊂ G(𝔸_{F,f}) and a closed subgroup K_∞ ⊂ G(F_∞) (for example a maximal compact subgroup times A_G(ℝ)^0, or trivial), the level quotient is X_U = G(F)\G(𝔸_F)/K_∞U with the quotient topology, together with the right action of G(𝔸_f) by Hecke translation X_{gUg⁻¹} ≃ X_U, [x] ↦ [xg]. Assumptions: G a connected reductive group over F; U compact open; K_∞ closed.

  API: `LevelMaps.LevelQuotient` — LevelQuotient U K∞ : Type, the double quotient with its topology; `LevelMaps.LevelQuotient.mk` — The projection G(𝔸) → LevelQuotient U K∞; `LevelMaps.LevelQuotient.rightTranslate` — rightTranslate g : LevelQuotient (g U g⁻¹) K∞ ≃ₜ LevelQuotient U K∞; `LevelMaps.LevelQuotient.mk_rational` — mk (diagonal γ * x) = mk x.

  Examples: For GL_1/ℚ, U = ℤ̂^× (the maximal compact open subgroup) and K∞ = ℝ^×: LevelQuotient is a point. For SL_2/ℚ with K∞ = 1 and U = SL_2(ℤ̂), LevelQuotient is SL_2(ℤ)\SL_2(ℝ) (strong approximation), not the one-point set SL_2(ℚ)\SL_2(𝔸_f)/U.

  Sources: [Milne], §5, footnote 40, p. 57. Requires: AA.3.4; AA.1.2.

- **Compact kernel of height on an archimedean level.** For connected reductive G/F let K∞⊂G(F∞) be closed, contain A_G(ℝ)^0, and be compact modulo it. Then K∞∩ker H_{G,∞} is compact, and multiplication gives K∞≃A_G(ℝ)^0×(K∞∩ker H_{G,∞}).

  Sources: [Arthur], §2, pp. 13–15. Requires: AA.2.1.

- **Finite full rational stabilizers.** Under compact-kernel-split-centre and for compact open U⊂G(𝔸_f), A_x=G(F)∩gK∞Ug⁻¹ is finite. Here A_x is the full stabilizer, before division by any rational central subgroup. Assumptions: F a number field; G connected reductive over F; K∞ ⊂ G(F_∞) closed, containing A_G(ℝ)^0 and compact modulo it; U ⊂ G(𝔸_{F,f}) compact open; g ∈ G(𝔸_F).

  Sources: [Arthur], §1, pp. 7–8; §2, pp. 13–15. Requires: AA.4.4; AA.1.3; AA.2.1; AA.1.2.

- **Proper arithmetic action on the level space.** Under rational-stabilizer-finite, the discrete group G(F) acts properly discontinuously on G(𝔸)/K∞U with its canonical quotient topology: for compact C,D only finitely many γ satisfy γC∩D≠∅. Assumptions: F a number field; G connected reductive over F; K∞ ⊂ G(F_∞) closed, containing A_G(ℝ)^0 and compact modulo it; U ⊂ G(𝔸_{F,f}) compact open; G(F) acts on G(𝔸)/K∞U by left multiplication.

  Sources: [Arthur], §1, pp. 7–8. Requires: AA.4.4; AA.2.2; AA.2.1; AA.1.3.

- **Level quotients are Hausdorff.** For compact open U and K_∞ compact modulo A_G(ℝ)^0 containing A_G(ℝ)^0, the level quotient X_U is Hausdorff and locally compact, and G(F) acts properly discontinuously on G(𝔸)/K_∞U. Assumptions: U compact open; K_∞ as stated.

  Sources: [Milne], Lemma 5.13, p. 57. Requires: AA.4.4; AA.2.2; Mathlib `ProperlyDiscontinuousSMul`; Mathlib `isOpenMap_quotient_mk'_mul`.

- **Free action of finite level groups at neat level.** For neat compact open U, normal open U′⊂U, and K∞ containing A_G(ℝ)^0 and compact modulo it, the full group U/U′ acts freely and properly discontinuously on X_{U′}. Rational stabilizers are finite, and neatness makes them trivial; the central rational kernel is trivial in this scope. Assumptions: U neat; U′ normal in U; K∞ contains A_G(ℝ)^0 and is compact modulo it.

  Sources: [Milne], §5, p. 58. Requires: AA.4.4; AA.4.3.

- **Covering maps between neat levels.** Let U′⊂U be compact open with U neat, and K∞ containing A_G(ℝ)^0 and compact modulo it. Then X_{U′}→X_U is a finite covering of degree [U:U′]. If U′ is normal in U, the canonical U/U′ action is free and transitive on each fibre, so this is a principal U/U′ covering. The rational stabilizer is trivial in this scope. Equality of U/U′ with the full deck-transformation group additionally requires the usual connectedness hypotheses (in particular connected total space). Assumptions: G a connected reductive group over F; U′ ⊂ U compact open; K∞ contains A_G(ℝ)^0 and is compact modulo it.

  Sources: [Milne], §5, p. 58. Requires: AA.4.4; AA.4.3; Mathlib `isQuotientCoveringMap_quotientMk_of_properlyDiscontinuousSMul`; Tau Ceti `IsQuotientCoveringMap.isCoveringMap_of_comp`; Mathlib `ProperlyDiscontinuousSMul`.

- **Fibre mass for full stabilizers.** Let U′⊂U be compact open and let A_x=G(F)∩gK∞Ug⁻¹ be finite. For the full stabilizers A_y at the points above x, ∑_{y↦x}1/|A_y|=[U:U′]/|A_x|. Assumptions: F a number field; G connected reductive over F; K∞ ⊂ G(F_∞) closed; U′ ⊂ U ⊂ G(𝔸_{F,f}) compact open; x = [g] ∈ X_U with A_x = G(F) ∩ gK∞Ug⁻¹ finite (for example by rational-stabilizer-finite).

  Sources: [Arthur], §1, pp. 7–8. Requires: AA.4.4.

- **Fibre mass of a level map with stabilizers.** Without neatness, for U′ ⊂ U and x ∈ X_U with finite stabilizer group Γ_x = (G(F) ∩ g K_∞U g⁻¹)/(Z(F) ∩ K_∞U), the fibre of X_{U′} → X_U over x satisfies ∑_{y ↦ x} 1/|Γ_y| = [U : U′]/(|Γ_x|·[Z(F) ∩ K_∞U : Z(F) ∩ K_∞U′]). Assumptions: G a connected reductive group over F; U′ ⊂ U compact open; K∞ ⊂ G(F_∞) closed, containing A_G(ℝ)^0 and compact modulo it (so that A_x, Z(F) ∩ K∞U and Z(F) ∩ K∞U′ are finite by rational-stabilizer-finite).

  Sources: [LT], §3.2, pp. 11–16 (level-counting context; the displayed mass formula is derived from finite-group orbit–stabilizer). Requires: AA.4.4.

- **Quotient groupoids at non-neat level.** For compact open U and closed K∞, 𝒳_U is the action groupoid of G(F) on G(𝔸)/K∞U, with automorphism group G(F)∩xK∞Ux⁻¹ and isomorphism classes X_U. If K∞ contains A_G(ℝ)^0 and is compact modulo it, these automorphism groups are finite; at neat U they are trivial. For an arbitrary closed K∞ they need not be finite (real quadratic unit stabilizers when K∞ is the full archimedean centre). Assumptions: G a connected reductive group over F.

  API: `LevelMaps.levelGroupoid` — The action groupoid of G(F) on G(𝔸)/K∞U; `LevelMaps.levelGroupoid_aut` — Aut of the object x is G(F) ∩ x K∞U x⁻¹; `LevelMaps.levelGroupoid_isoClasses` — Isomorphism classes ≃ LevelQuotient U K∞; `LevelMaps.levelGroupoid_finite_aut` — Every automorphism group is finite if U is compact open and K∞ contains A_G(ℝ)^0 and is compact modulo it; no finiteness assertion is made for general closed K∞.

  Examples: For SL_2/ℚ, K∞ = SO(2), U = SL_2(ℤ̂), the automorphism group of the object over i is ⟨(0 −1; 1 0)⟩ of order 4 (for K∞ = 1 it would be trivial). The groupoid is not determined by X_U: Y(1) and the coarse space of the groupoid agree, but the groupoid remembers the stabilizers of orders 4 and 6.

  Sources: [Milne], §5, p. 58. Requires: AA.4.4; Mathlib `CategoryTheory.ActionCategory`; AA.1.3.


### AA.4.5 — Hecke correspondences, volumes and abelianization

- **Degree of a Hecke correspondence.** For compact open U and g∈G(𝔸_f), UgU is the disjoint union of [U:U∩gUg⁻¹] cosets of the form x·U (left cosets in the convention of tauceti HeckeCoset.degree), represented by u g. In the compact-modulo-A_G neat scope, p₁:X_{U∩gUg⁻¹}→X_U is a covering of exactly that degree; the rational central kernel is trivial. Assumptions: U compact open.

  Sources: [Arthur], §2, p. 13. Requires: Tau Ceti `HeckeCoset.degree_eq_relIndex`; AA.4.4.

- **Hecke correspondences.** For g ∈ G(𝔸_{F,f}) and compact open U, put U_g = U ∩ gUg⁻¹. The Hecke correspondence T_g is X_U ←p₁ X_{U_g} →p₂ X_U with p₁[x] = [x] and p₂[x] = [xg]; it depends only on UgU. Assumptions: G a connected reductive group over F; U compact open.

  API: `LevelMaps.hecke` — The pair of maps X_{U_g} → X_U; `LevelMaps.hecke_fst` — (hecke g).1 (mk x) = mk x; `LevelMaps.hecke_snd` — (hecke g).2 (mk x) = mk (x * g); `LevelMaps.hecke_degree` — At neat level the degree of p₁ is [U : U_g] = degree of the double coset UgU (HeckeCoset.degree_eq_relIndex).

  Examples: For g = 1 both maps are the identity. T_g and T_{g⁻¹} are transposes, not equal in general: for GL_2/ℚ with g = diag(p,1), T_{g⁻¹} is T_g composed with translation by the central idele p⁻¹ at p. With U = GL_2(ℤ̂) and K∞ = SO(2) this translation rescales the archimedean component (|det| changes by p⁻²), so T_{g⁻¹} ≠ T_g; if K∞ ⊇ ℝ_{>0} the translation is trivial on X_U and the two coincide.

  Sources: [Arthur], §2, p. 13. Requires: AA.4.4; AA.4.5.

- **Cartesian squares of level maps.** Let U′,L⊂U be compact open with U neat, K∞ containing A_G(ℝ)^0 and compact modulo it, and U′L=U. Then X_{U′∩L}→X_L, X_{U′∩L}→X_{U′}, X_{U′}→X_U, X_L→X_U is Cartesian. For L=U_g this identifies this one leg of a Hecke pullback only when the product condition holds. U′ normal does not imply that condition, and U′∩U_g is generally different from U′∩gU′g⁻¹. Assumptions: G a connected reductive group over F; K∞ contains A_G(ℝ)^0 and is compact modulo it.

  Sources: [Milne], §5, p. 58. Requires: AA.4.4; AA.4.5; Tau Ceti `HeckeCoset.degree_eq_relIndex`.

- **Volume of a level quotient.** With a Haar measure dg_f on G(𝔸_f), dg_∞ on G(F_∞) and the product measure on G(𝔸) (AA.0.3), vol(G(F)\G(𝔸)^1) = vol(U) ∑_{i} vol(Γ_i\G(F_∞)/A_G(ℝ)^0) for representatives x_i of G(F)\G(𝔸_f)/U, where Γ_i = G(F) ∩ x_iUx_i⁻¹, the measure on G(𝔸)^1 is transported from G(𝔸)/A_G(ℝ)^0 (AA.2.1) and G(F_∞)/A_G(ℝ)^0 carries the quotient measure. (G(𝔸)^1 is not G(F_∞)^1 × G(𝔸_f): finite ideles have nontrivial norms.) Assumptions: G a connected reductive group over F; U compact open.

  Sources: [Arthur], (2.1), p. 13. Requires: AA.3.4; AA.2.3; AA.2.1; AA.2.2; AA.0.3.

- **Volumes under finite-index level change.** For compact open U′ ⊂ U, ∑_j vol(Γ′_j\G(F_∞)/A_G(ℝ)^0) = [U : U′] ∑_i vol(Γ_i\G(F_∞)/A_G(ℝ)^0). Assumptions: G a connected reductive group over F; U′ ⊂ U compact open.

  Sources: [LT], §3.2.3, p. 16. Requires: AA.4.5; Mathlib `MeasureTheory.Subgroup.index_mul_measure`; AA.2.4.

- **Integral lifting for reductive abelianization.** For connected reductive G/F with simply connected derived group and ν:G→D=G/G^der, there is a finite set B such that smooth reductive models over O_{F,B} extend ν and ν:G(O_v)→D(O_v) is surjective for every finite v∉B.

  Sources: [Milne], Lemma 5.21(b), p. 61. Requires: AA.1.1; `ReductiveGroupsPartII:RG2.3`; ReductiveGroups, layer 9.

- **Surjectivity of finite adelic abelianization.** Under abelianization-integral-lifts and local simply connected H¹ vanishing, ν:G(𝔸_f)→D(𝔸_f) is surjective with kernel G^der(𝔸_f). It is the actual restricted-product homomorphism induced by ν. Assumptions: F a number field; G connected reductive over F with G^der simply connected; D = G/G^der and ν : G → D the quotient morphism with its restricted-product map on finite adelic points.

  Sources: [Milne], Lemma 5.21, p. 61. Requires: AA.4.5; AA.4.1; AA.1.3.

- **Class sets of groups with simply connected derived group.** Let G be connected reductive over F with G^der simply connected and G^der(F_∞) noncompact on each F-simple factor, ν : G → D = G/G^der. For compact open U ⊂ G(𝔸_{F,f}), ν induces a bijection G(F)\G(𝔸_{F,f})/U ≃ ν(G(F))\D(𝔸_{F,f})/ν(U). Assumptions: G^der(F_∞) noncompact on each simple factor.

  Sources: [LT], §3.2.2, (21), p. 14. Requires: AA.4.2; AA.4.1; AA.1.3; AA.1.5; AA.4.5.


### AA.4.6 — Residual quotients and quaternion norms

- **Integral compatibility of a central derived cover.** For the actual simply connected central cover ρ:G̃→G^der, at almost every finite place v one has ρ(G̃(F_v))∩G^der(O_v)=ρ(G̃(O_v)). Consequently the adelic image is exactly the restricted product of the local images with these integral image subgroups. Assumptions: F a number field; G connected reductive over F; ρ : G̃ → G^der the simply connected central cover of the derived group (a central isogeny), extended with G̃, G^der to smooth affine models over 𝒪_{F,B} for a finite set B (RG2.3 request).

  Sources: [Khayutin], §2.3, arXiv v3 p. 15 (definition of G(R)^+); used in Definition 3.1, p. 22. Requires: `ReductiveGroupsPartII:RG2.3`; AA.1.2; AA.1.3.

- **The subgroup G(𝔸)^+ from the simply connected cover.** For G connected reductive over F with simply connected cover ρ : G̃ → G^der ⊂ G of the derived group, G(𝔸_F)^+ = ρ(G̃(𝔸_F)), a normal subgroup of G(𝔸_F) containing the commutator subgroup; likewise G(R)^+ for any F-algebra R. For G = PB^× (B a quaternion algebra over ℚ), G̃ = B^(1) is the norm-one group.

  API: `Approximation.plusSubgroup` — plusSubgroup G : Subgroup (AdelicPoints H) := range of the simply connected cover; `Approximation.plusSubgroup_normal` — plusSubgroup is normal; `Approximation.commutator_le_plusSubgroup` — ⁅G(𝔸), G(𝔸)⁆ ≤ plusSubgroup; `Approximation.plusSubgroup_gln` — For GL_n, plusSubgroup = SL_n(𝔸).

  Examples: For simply connected G, plusSubgroup = ⊤. For PGL_2, plusSubgroup ≠ G^der(𝔸) = PGL_2(𝔸): the image of SL_2(ℚ_p) in PGL_2(ℚ_p) has index 4 for odd p.

  Sources: [Khayutin], §2.3, arXiv v3 pp. 15–16; Annals p. 162. Requires: AA.1.3; Tau Ceti `TauCeti.simplyConnectedSemisimpleCommHopfAlgProperty`; ReductiveGroups, layer 6; AA.4.6.

- **The residual quotient G_res.** For connected reductive G/F, define G_res=G(𝔸_F)/(G(F)G(𝔸_F)^+), an abelian topological group with its canonical quotient topology, and π⁺:[G(𝔸)]→G_res. The composite G(𝔸)→G_res is a continuous surjective homomorphism. Hausdorffness or compactness requires closedness of the denominator subgroup; for PB×/ℚ these follow from reduced-norm-components and idele-class-square-compact.

  API: `Approximation.residualQuotient` — residualQuotient G : Type, the quotient group G(𝔸) ⧸ (G(F) ⊔ plusSubgroup); `Approximation.residualQuotient.commGroup` — residualQuotient is a commutative topological group; `Approximation.residualQuotient.piPlus` — piPlus : G(𝔸) →* residualQuotient, continuous and surjective; `Approximation.residualQuotient.piPlus_rational` — piPlus (diagonal γ) = 1.

  Examples: For SL_2 the residual quotient is trivial. G(𝔸)/G(𝔸)^+ itself is not compact for PGL_2: it is 𝔸^×/𝔸^{×2}, only locally compact.

  Sources: [Khayutin], Definition 3.1, arXiv v3 p. 22; Annals p. 169. Requires: AA.4.6; AA.1.3; GlobalNumberFields, layer 6.

- **Reduced norms of a quaternion algebra over ℚ.** For a quaternion algebra B over ℚ: Nrd(B_p^×) = ℚ_p^× for every prime p; Nrd(B_∞^×) = ℝ^× if B is split at ∞ and ℝ_{>0} otherwise; and Nrd(B^×) = ℚ^× if B is split at ∞, ℚ_{>0} otherwise (Hasse–Schilling–Maass). Assumptions: B a quaternion algebra over ℚ.

  Sources: [Khayutin], §2.3, arXiv v3 pp. 15–16; Annals p. 162. Requires: Tau Ceti `QuaternionAlgebra.normForm`; GlobalQuadraticForms, layer 5; AA.4.1.

- **Compact idele classes modulo squares.** Let C_F=F×\𝔸_F× be the idele class group of a number field. Then C_F/C_F² is compact Hausdorff: the norm decomposition C_F≃ℝ_{>0}×C_F¹ identifies it with the quotient of compact C_F¹ by its square image. Assumptions: F a number field; C_F = F^×\𝔸_F^× with the quotient topology and C_F² its subgroup of squares; the idele norm and the compactness of C_F^1 from GlobalNumberFields layer 6.

  Sources: [Khayutin], Definition 3.1, arXiv v3 p. 22, and Remark 3.7, p. 25. Requires: GlobalNumberFields, layer 6.

- **The reduced norm on the residual quotient.** For G = PB^× with B a quaternion algebra over ℚ, the reduced norm induces an injective continuous homomorphism of locally compact groups Nrd : G(𝔸)/G(𝔸)^+ → 𝔸^×/𝔸^{×2}, and a bijection (indeed an isomorphism of compact groups) G_res ≃ ℚ^×\𝔸^×/𝔸^{×2} whether or not B is split at ∞. Neither G(𝔸)/G(𝔸)^+ nor 𝔸^×/𝔸^{×2} is compact.

  Sources: [Khayutin], §2.3, arXiv v3 pp. 15–16; Annals p. 162. Requires: AA.4.6.

- **Pushforward of a homogeneous measure to a compact abelian quotient.** Let C be a compact abelian group, π : G → C a continuous surjective homomorphism, T ≤ G a closed subgroup with Λ ≤ T discrete and Λ\T compact (as for [T(𝔸)] with T anisotropic modulo the centre), and μ the T-invariant probability measure on Λ\T g. If π(Λ) = 1, then π_*μ is the Haar probability measure of the coset π(T)·π(g) of the closed subgroup π(T). Assumptions: C compact abelian; π continuous surjective homomorphism; C second countable (true for G_res of PB^×, a countable product of finite groups), so the pinned Haar uniqueness isMulLeftInvariant_eq_smul applies; Λ ≤ T discrete with π(Λ) = 1.

  Sources: [Khayutin], Definition 3.1, arXiv v3 p. 22; Annals p. 169. Requires: AA.4.6; Mathlib `MeasureTheory.Measure.isMulLeftInvariant_eq_smul`.

- **Images of tori in the residual quotient.** For a quadratic field E ⊂ B and the torus T = E^×/ℚ^× ⊂ G = PB^×, π^+([T(𝔸)]) is a closed subgroup of G_res and Nrd ∘ π^+([T(𝔸)]) = ker χ_E, where χ_E : ℚ^×\𝔸^×/𝔸^{×2} → {±1} is the quadratic character of E/ℚ. Assumptions: B quaternion over ℚ; E ⊂ B quadratic.

  Sources: [Khayutin], Proof of Proposition 3.6, arXiv v3 p. 25; Annals pp. 172–173. Requires: AA.4.6; ClassFieldTheory, layer 12; AA.3.4; AA.1.4.


### AA.4.7 — Fourier limits in the residual quotient

- **Fourier convergence of quadratic-character kernels.** Let C be a compact Hausdorff abelian group and χ_i:C→{±1} pairwise distinct nontrivial continuous characters. For each fixed character ψ of C, the Haar integral of ψ over ker χ_i is zero unless ψ=1 or ψ=χ_i, and hence these kernel Haar probabilities converge weakly to Haar probability on C. Assumptions: C a compact Hausdorff abelian group; χ_i : C → {±1} pairwise distinct nontrivial continuous characters; m_i the Haar probability of the closed subgroup ker χ_i, viewed on C.

  Sources: [Khayutin], Proposition 3.6, arXiv v3 p. 24, and its proof with Remark 3.7, p. 25. Requires: AA.2.4; RepresentationTheory/CompactGroups, layer 5.

- **Kernels of distinct characters converge to the whole group.** Let C be a compact abelian group and (χ_i) a sequence of pairwise distinct continuous characters C → {±1}. Then the closed subgroups ker χ_i converge to C in the Chabauty topology; consequently any weak-* limit of probability measures invariant under ker χ_i is C-invariant. Assumptions: C compact abelian; χ_i pairwise distinct.

  Sources: [Khayutin], Proof of Proposition 3.6, arXiv v3 p. 25; Annals pp. 172–173. Requires: AA.4.7; RepresentationTheory/CompactGroups, layer 5.

- **Limits of Haar measures on diagonal cosets.** For compact abelian C, closed H_i≤C with H_i→H through the quadratic-kernel setting, and points z_i∈C×C, every weak limit of Haar probabilities on z_iH_i^Δ is H^Δ-invariant and supported on one coset of H^Δ. The analogous statement holds when H_i=H is fixed. Assumptions: C a compact Hausdorff abelian group; either H_i = ker χ_i for pairwise distinct quadratic characters χ_i : C → {±1} (then H = C) or H_i = H a fixed closed subgroup; z_i ∈ C × C; Haar probabilities on the cosets z_iH_i^Δ.

  Sources: [Khayutin], Proposition 3.6, arXiv v3 p. 24, and Remark 3.7, p. 25. Requires: AA.4.7; AA.4.6; RepresentationTheory/CompactGroups, layer 5.

- **Limit behaviour of the residual spectrum.** Let B be a quaternion algebra over ℚ, G = PB^×, and for each i let T_i = E_i^×/ℚ^× ⊂ G be the torus of a quadratic field E_i ⊂ B, g_i, s_i ∈ G(𝔸), and μ_i the pushforward to [G(𝔸)] × [G(𝔸)] of the Haar probability measure of [T_i(𝔸)] under t ↦ ([t g_i], [t s_i g_i]). Suppose either the E_i are pairwise distinct (put H = G_res) or all equal one field E_0 (put H = ker(χ_{E_0} ∘ Nrd) < G_res). Then every weak-* limit point of (π^+ × π^+)_* μ_i is an H^Δ-invariant probability measure supported on a single coset of H^Δ; in general (π^+ × π^+)_* μ_i need not converge. Assumptions: B a quaternion algebra over ℚ and G = PB^×; for each i a quadratic field E_i ⊂ B with torus T_i = E_i^×/ℚ^× ⊂ G, and g_i, s_i ∈ G(𝔸); either the E_i are pairwise distinct or all equal one field E_0.

  Sources: [Khayutin], Proposition 3.6, arXiv v3 p. 24; Annals p. 172; [Khayutin], Remark 3.7, arXiv v3 p. 25; Annals p. 172. Requires: AA.4.6; ClassFieldTheory, layer 12; AA.4.7.


## AA.5 — Worked examples

Work out the quotient topology, connected components, cohomology and level changes in concrete groups. These examples test the centre, determinant, measure and stabilizer conventions of the preceding layers.

### AA.5.1 — GL₁ and logarithmic tori

- **The GL_1 quotient is the idele class group.** For G = G_m over a number field F: G(F)\G(𝔸_F) ≃ₜ* IdeleClassGroup F; G(𝔸_F)^1 is the group 𝔸_F^1 of norm-one ideles; A_G(ℝ)^0 = ℝ_{>0} embedded diagonally at the archimedean places; 𝔸_F^× = 𝔸_F^1 × ℝ_{>0}; and F^×\𝔸_F^1 is compact (this clause is Tau Ceti's `IdeleClassGroup.isCompact_normOne`) while F^×\𝔸_F^× is not.

  Sources: [Arthur], §3, p. 16; [Borel], §5.8, p. 22. Requires: AA.1.4; Mathlib `NumberField.IdeleClassGroup`; AA.2.1; AA.3.4; GlobalNumberFields, layer 6; Tau Ceti `TauCeti.MultiplicativeGroup.pointsMulEquiv_mapValue`.

- **GL_1 class number.** For G = G_m over F and U = Ô^× = ∏_v 𝒪_v^×, G(F)\G(𝔸_f)/U ≃ Cl(𝒪_F), so its cardinality is the class number of F.

  Sources: [Borel], Proposition 2.2, p. 11. Requires: AA.1.4; AA.3.4; Mathlib `NumberField.classNumber`; GlobalNumberFields, layer 4.

- **Units at level U_Q form a lattice of rank r₁ + r₂ − 1.** For a compact open U ⊂ Ô^×, Γ_U = F^× ∩ U is a finite-index subgroup of 𝒪_F^×, and its image under the logarithmic embedding is a lattice of rank r₁ + r₂ − 1 in the trace-zero hyperplane of ℝ^{r₁+r₂}. Assumptions: U compact open.

  Sources: [CG], §8.2, p. 79. Requires: Mathlib `NumberField.Units.unitLattice_rank`; Mathlib `NumberField.Units.rank`; Mathlib `NumberField.Units.instZLattice_unitLattice`.

- **Canonical logarithmic torus at GL₁ level.** For the level U_Q of gl1-XQ-components, the identity component is the logarithmic quotient W/Λ_Q, where W=ℝ^{r₁+r₂}/ℝ·(1,…,1) and Λ_Q is the image of totally positive congruence units F×∩U_{Q,f}. It is a compact real torus of dimension r₁+r₂−1. The complex circle factors have already been divided out by K∞. Assumptions: F a number field with r₁ real and r₂ complex places; Q a finite set of finite places, p a prime and n ≥ 1 with N(v) ≡ 1 mod p^n for v ∈ Q; U_Q = K_∞ × ∏_v U_{Q,v}, K_∞ and A_∞^0 as in gl1-XQ-components.

  Sources: [CG], §8.2, pp. 78–79. Requires: AA.5.1.

- **Geometry of the GL_1 arithmetic quotients X_Q.** For a finite set Q of finite places with N(v) ≡ 1 mod p^n, let U_Q = K_∞ × ∏_v U_{Q,v}, where K_∞ ≅ (S¹)^{r₂} is the identity component of the maximal compact subgroup of (F ⊗ ℝ)^×, U_{Q,v} = 𝒪_v^× for v ∉ Q and the index-p^n subgroup of 𝒪_v^× for v ∈ Q, and X_Q = F^×\𝔸_F^×/U_Q A_∞^0 with A_∞^0 = A_{G_m}(ℝ)^0. Each connected component of X_Q is a compact torus (S¹)^{r₁+r₂−1}, and π_0(X_Q) = F^×\𝔸_F^×/U_Q (F ⊗ ℝ)^{×,0}, an extension of the narrow class group of F by a quotient of ∏_{v∈Q} 𝒪_v^×/𝒪_v^{×p^n} (not, in general, the maximal exponent-p^n quotient of the ray class group). Assumptions: Q, p, n as stated.

  Sources: [CG], §8.2, p. 79. Requires: AA.5.1; AA.3.4; Mathlib `NumberField.Units.rank`; Mathlib `NumberField.Units.unitLattice_rank`; GlobalNumberFields, layer 6.

- **The invariant l0 for GL_1.** Every connected component of X_Q has dimension r₁ + r₂ − 1 = NumberField.Units.rank F, the value of Calegari–Geraghty's invariant l0 for G = GL_1/F; in particular its cohomology vanishes above degree r₁ + r₂ − 1.

  Sources: [CG], §8.2, p. 77. Requires: AA.5.1; Mathlib `NumberField.Units.rank`; AlgebraicTopology, stage 6.

- **Degree-zero cohomology of X_Q.** The ℤ_p-module of locally constant functions X_Q → ℤ_p is free on π_0(X_Q): H^0(X_Q, ℤ_p) ≅ ℤ_p[π_0(X_Q)].

  Sources: [CG], §8.2, p. 79. Requires: AA.5.1; AA.3.4.

- **Hecke and diamond operators for GL_1.** For v∉Q the GL₁ Hecke operator of the finite idele π_v is right translation, and for v∈Q a unit α gives the diamond translation. Each permutes π₀(X_Q) by its finite idele class. Under the natural exterior-power identification of torus cohomology, translation induces the identity within the torus factor and the indicated permutation of the component factors in every degree.

  Sources: [CG], §8.2, p. 79. Requires: AA.4.5; AA.5.1; AlgebraicTopology, stage 6.


### AA.5.2 — GL₂ over ℚ and principal levels

- **Raw Möbius action and the Mathlib folded action.** The raw Möbius maps of GL₂(ℝ) induce an action on ℍ±=ℂ∖ℝ. Folding the lower half-plane by conjugation is equivariant for this action and Mathlib glAction on ℍ. For positive determinant the raw and folded formulas coincide; diag(1,−1) sends i to −i in the raw action and fixes i in glAction. The existing pinned imaginary-part and denominator formulas supply the carrier and sign checks. Assumptions: g∈GL₂(ℝ), z∈ℂ with Im z≠0.

  Sources: [Milne], Lemma 5.11, p. 56. Requires: Mathlib `UpperHalfPlane.glAction`; Mathlib `Matrix.GeneralLinearGroup.det`; Mathlib `UpperHalfPlane.moebius_im`; Mathlib `UpperHalfPlane.denom_ne_zero_of_im`; Mathlib `UpperHalfPlane.coe_smul`.

- **GL_2(ℝ) modulo ℝ^× SO(2).** GL_2(ℝ)/ℝ^× SO(2) is homeomorphic to ℍ^± = ℂ ∖ ℝ through g ↦ g·i, equivariantly for the Möbius action; GL_2(ℝ)^+ acts transitively on ℍ with stabilizer ℝ^× SO(2) at i.

  Sources: [Milne], Lemma 5.11, p. 56. Requires: AA.5.2.

- **Congruence groups of the GL₂ components.** For a compact open subgroup U ⊂ GL₂(𝔸_f) and g ∈ GL₂(𝔸_f) put Γ_{g,U} = GL₂(ℚ)^+ ∩ gUg⁻¹, with GL₂(ℚ) embedded diagonally. Every element of Γ_{g,U} has determinant 1: det U is a compact subgroup of 𝔸_f^×, hence lies in ℤ̂^×, and ℚ_{>0} ∩ ℤ̂^× = {1}. Thus Γ_{g,U} = SL₂(ℚ) ∩ gUg⁻¹. If K(M) = ker(GL₂(ℤ̂) → GL₂(ℤ/M)) lies in gUg⁻¹ (such M exists because these kernels form a neighbourhood basis of 1), then Γ(M) ⊂ Γ_{g,U}, and Γ_{g,U} ∩ SL₂(ℤ) has finite index in both Γ_{g,U} and SL₂(ℤ). Hence the image of Γ_{g,U} in GL₂(ℝ) is arithmetic in Mathlib's sense, discrete, and acts properly discontinuously on ℍ; its image in PSL₂(ℝ) is a Fuchsian group, and the orbit space Γ_{g,U}\ℍ with the quotient topology is Hausdorff and is the coarse quotient Riemann surface of the Fuchsian orbifolds roadmap. For q ∈ GL₂(ℚ)^+ and u ∈ U, Γ_{qgu,U} = qΓ_{g,U}q⁻¹ and z ↦ q·z induces a biholomorphism Γ_{g,U}\ℍ → Γ_{qgu,U}\ℍ. For a compact open U′ ⊂ U, Γ_{g,U′} has finite index in Γ_{g,U}, and z ↦ z induces a finite holomorphic map Γ_{g,U′}\ℍ → Γ_{g,U}\ℍ. Assumptions: U′ ⊂ U compact open subgroups of GL₂(𝔸_f); g ∈ GL₂(𝔸_f); q ∈ GL₂(ℚ) with det q > 0; u ∈ U.

  Sources: [Milne], §4, definition of congruence subgroups, p. 42, and Proposition 4.1, p. 43; Lemma 5.13 and the remarks after it, pp. 57–58. The determinant argument is a direct computation. Requires: AA.5.2; AA.4.4; Mathlib `Subgroup.IsArithmetic`; Mathlib `Subgroup.IsArithmetic.conj`; Mathlib `Subgroup.IsArithmetic.properlyDiscontinuous`; Mathlib `Subgroup.IsArithmetic.discreteTopology`; Mathlib `CongruenceSubgroup.Gamma`; Mathlib `t2Space_of_properlyDiscontinuousSMul_of_t2Space`; FuchsianOrbifolds, layers 0, 1 and 4.

- **The GL_2/ℚ quotient and the upper half-plane.** For G = GL_2 over ℚ, K_∞ = ℝ^× SO(2) and U ⊂ GL_2(𝔸_f) compact open, G(ℚ)\G(𝔸)/K_∞U ≃ ⊔_{c ∈ ℚ_{>0}\𝔸_f^×/det U} Γ_c\ℍ, where Γ_c = GL_2(ℚ)^+ ∩ g_c U g_c⁻¹ for g_c ∈ GL_2(𝔸_f) with det g_c = c, acting on ℍ by Möbius transformations; for det U = ℤ̂^× there is a single component. Assumptions: G = GL_2/ℚ; U compact open.

  Sources: [Milne], Lemma 5.13, p. 57. Requires: AA.3.4; AA.4.5; AA.4.2; Tau Ceti `Matrix.SpecialLinearGroup.map_intCast_zmod_surjective`; AA.5.2, including the congruence groups of the components; Mathlib `Matrix.GeneralLinearGroup.det`; AA.4.4.

- **Principal congruence level.** For U = K(N) = ker(GL_2(ℤ̂) → GL_2(ℤ/N)), det K(N) = {x ∈ ℤ̂^× : x ≡ 1 mod N}, the components are indexed by (ℤ/N)^×, and each Γ_c is Γ(N) = ker(SL_2(ℤ) → SL_2(ℤ/N)) (Mathlib CongruenceSubgroup.Gamma). Assumptions: N ≥ 1.

  Sources: [Milne], Lemma 5.13, p. 57. Requires: AA.5.2; Mathlib `CongruenceSubgroup.Gamma`; AA.3.4.

- **Riemann-surface structure and change of level for GL₂ quotients.** Let X_U = G(ℚ)\G(𝔸)/K_∞U for G = GL₂ over ℚ, K_∞ = ℝ^×SO(2) and U ⊂ GL₂(𝔸_f) compact open. Transport the Riemann-surface structures of the components Γ_c\ℍ along the homeomorphism of the upper half-plane decomposition. The resulting complex structure on X_U does not depend on the representatives g_c. For a compact open U′ ⊂ U the projection X_{U′} → X_U is holomorphic: if g′ = qgu with q ∈ GL₂(ℚ)^+ and u ∈ U, it maps the component Γ_{g′,U′}\ℍ to Γ_{g,U}\ℍ by z ↦ q⁻¹·z. For h ∈ GL₂(𝔸_f), right translation [x, a] ↦ [x, ah] is a biholomorphism X_U → X_{h⁻¹Uh}. For N ≥ 1 let K₀(N) and K₁(N) be the matrices (a b; c d) ∈ GL₂(ℤ̂) with c ≡ 0 mod N, respectively with c ≡ 0 and d ≡ 1 mod N. Their determinants fill ℤ̂^×, so X_{K₀(N)} and X_{K₁(N)} are connected, isomorphic to Γ₀(N)\ℍ and Γ₁(N)\ℍ as Riemann surfaces, and the projections X_{K(N)} → X_{K₁(N)} → X_{K₀(N)} restrict on the component of 1 to the natural maps Γ(N)\ℍ → Γ₁(N)\ℍ → Γ₀(N)\ℍ. Assumptions: G = GL₂ over ℚ; U′ ⊂ U compact open subgroups of GL₂(𝔸_f); h ∈ GL₂(𝔸_f); N ≥ 1.

  Sources: [Milne], Lemma 5.13, p. 57, and the maps Sh_{K′} → Sh_K and T(g), p. 58; π₀ at principal level, p. 63. The K₀(N) and K₁(N) cases are direct computations from the component decomposition. Requires: AA.5.2; AA.4.4; Mathlib `CongruenceSubgroup.Gamma0`; Mathlib `CongruenceSubgroup.Gamma1`; Mathlib `CongruenceSubgroup.Gamma`; FuchsianOrbifolds, layers 1, 4 and 5.

- **GL₂ components for O(2) and SO(2).** For GL₂/ℚ and principal finite level K(N), the quotient with K∞=ℝ×SO(2) has components (ℤ/N)× and raw real symmetric space ℍ± before rational orientation reduction. With K∞=ℝ×O(2), the real space is the folded ℍ and the component set is (ℤ/N)×/{±1}. At N=3 these cardinalities are respectively two and one. Assumptions: G = GL₂ over ℚ; N ≥ 1 and K(N) = ker(GL₂(ℤ̂) → GL₂(ℤ/N)); K∞ = ℝ^×SO(2) with the raw Möbius action on ℍ±, or K∞ = ℝ^×O(2) with the folded action on ℍ.

  Sources: [Milne], Theorem 5.17, pp. 59–61; zero-dimensional example, p. 63. Requires: AA.5.2.


### AA.5.3 — Definite quaternion groups

- **Compactness for a definite quaternion algebra.** For a definite quaternion algebra D over ℚ and G = D^×: G(ℚ)\G(𝔸)^1 is compact; G(ℚ)\G(𝔸_f)/U is finite for every compact open U; each Γ_{x,U} = D^× ∩ xUx⁻¹ is finite; and D^×/ℚ^× is discrete in (D ⊗ 𝔸_f)^×/𝔸_f^×. Assumptions: D a quaternion division algebra over ℚ with D ⊗ ℝ ≅ ℍ (Hamilton).

  Sources: [Milne], §3, Theorem 3.3 and Example 3.4, pp. 33–34. Requires: AA.3.4; AA.1.3; Mathlib `QuaternionAlgebra`.

- **Volume comparison under level change for a definite quaternion algebra.** For D definite over ℚ and compact open U′ ⊂ U ⊂ (D ⊗ 𝔸_f)^×, with Γ_x = (D^× ∩ xUx⁻¹)/(ℚ^× ∩ U) the finite stabilizers: ∑_{x ∈ Cl(U′)} 1/|Γ′_x| = [U : U′]/[ℚ^× ∩ U : ℚ^× ∩ U′] · ∑_{x ∈ Cl(U)} 1/|Γ_x|, where Cl(U) = D^×\(D ⊗ 𝔸_f)^×/U. Assumptions: U′ ⊂ U compact open.

  Sources: [Arthur], §2, p. 12. Requires: AA.5.3; AA.4.5; AA.4.4.


## Sources

The locators above refer to the following editions. Rosengarten supplies a function-field comparison only; number-field analytic normalization uses the number-field sources and inputs specified in AA.2.

[Arthur]: https://www.claymath.org/library/cw/arthur/pdf/62.pdf

- **Arthur**: James Arthur, *An introduction to the trace formula*. Clay Mathematics Proceedings 4 (2005), pp. 1–263.

[Borel]: http://www.numdam.org/item/PMIHES_1963__16__5_0.pdf

- **Borel**: Armand Borel, *Some finiteness properties of adele groups over number fields*. Publications mathématiques de l’IHÉS 16 (1963), pp. 5–30.

[Conrad]: https://math.stanford.edu/~conrad/papers/adelictop.pdf

- **Conrad**: Brian Conrad, *Weil and Grothendieck approaches to adelic points*. L’Enseignement Mathématique 58 (2012), pp. 61–97; locators use the author's preprint pagination.

[Rapinchuk]: https://arxiv.org/abs/1207.4425

- **Rapinchuk**: Andrei S. Rapinchuk, *On strong approximation for algebraic groups*. MSRI Publications 61 (2014), pp. 269–298; locators use arXiv:1207.4425.

[Milne]: https://www.jmilne.org/math/xnotes/svi.pdf

- **Milne**: J. S. Milne, *Introduction to Shimura varieties*. Author's revision of 16 September 2017 of the Clay Mathematics Proceedings 4 (2005) article.

[Rosengarten]: https://arxiv.org/abs/1806.10723v3

- **Rosengarten**: Zev Rosengarten, *Tamagawa numbers and other invariants of pseudo-reductive groups over global function fields*. arXiv:1806.10723v3 (31 January 2020); published in Algebra & Number Theory 15 (2021), pp. 1865–1920; locators use the arXiv edition.

[Sutherland]: https://math.mit.edu/classes/18.785/2016fa/LectureNotes23.pdf

- **Sutherland**: Andrew V. Sutherland, *18.785 Number theory I, Lecture #23: The ring of adeles, strong approximation*. MIT 18.785 lecture notes, Fall 2016.

[BKT]: https://arxiv.org/abs/1810.04801v2

- **BKT**: Benjamin Bakker, Bruno Klingler, Jacob Tsimerman, *Tame topology of arithmetic quotients and algebraicity of Hodge loci*. Journal of the American Mathematical Society 33 (2020), pp. 917–939; arXiv:1810.04801v2, with the 2023 erratum.

[Khayutin]: https://arxiv.org/abs/1710.04557v3

- **Khayutin**: Ilya Khayutin, *Joint equidistribution of CM points*. Annals of Mathematics 189 (2019), pp. 145–276; arXiv:1710.04557v3.

[CG]: https://arxiv.org/abs/1207.4224v2

- **CG**: Frank Calegari, David Geraghty, *Modularity lifting beyond the Taylor–Wiles method*. Inventiones Mathematicae 211 (2018), pp. 297–433; arXiv:1207.4224v2.

[LT]: https://arxiv.org/abs/1511.02212v1

- **LT**: Michael Lipnowski, Jacob Tsimerman, *How large is A_g(F_q)?*. Duke Mathematical Journal 167 (2018); locators use arXiv:1511.02212v1.

[HW]: https://arxiv.org/abs/1802.09605v2

- **HW**: Yonatan Harpaz, Olivier Wittenberg, *Zéro-cycles sur les espaces homogènes et problème de Galois inverse*. Journal of the American Mathematical Society 33 (2020), pp. 775–805; arXiv:1802.09605v2.

[BKT erratum]: https://benjamin-bakker.github.io/DefArithErr.pdf

- **BKT erratum**: Benjamin Bakker, Bruno Klingler, Jacob Tsimerman, *Erratum: Tame topology of arithmetic quotients and algebraicity of Hodge loci*. Journal of the American Mathematical Society 36 (2023), DOI 10.1090/jams/1025; locators use the four-page author copy.

[Gordon]: https://arxiv.org/pdf/2205.02391v1

- **Gordon**: Julia Gordon, with an appendix by Matthew Koster, *Orbital integrals and normalizations of measures*. arXiv:2205.02391v1 (2022).

[BHC]: https://www.mathi.uni-heidelberg.de/~wienhard/retreat10/references/borel_harishchandra_2.pdf

- **BHC**: Armand Borel and Harish-Chandra, *Arithmetic subgroups of algebraic groups*. Annals of Mathematics 75 (1962), pp. 485–535.

[BGST]: https://benjamin-bakker.github.io/finiteness.pdf

- **BGST**: Benjamin Bakker, Thomas W. Grimm, Christian Schnell and Jacob Tsimerman, *Finiteness for self-dual classes in integral variations of Hodge structure*. Author PDF, 2021 edition, including §28 and Proposition 28.1.

[Orr–Schnell]: https://msp.org/ant/2023/17-6/ant-v17-n6-p04-s.pdf

- **Orr–Schnell**: Martin Orr and Christian Schnell, *Correction to the article Height bounds and the Siegel property*. Algebra & Number Theory 17 (2023), pp. 1231–1237.

[Orr]: https://arxiv.org/pdf/1609.01315v2

- **Orr**: Martin Orr, *Height bounds and the Siegel property*. arXiv:1609.01315v2, with the Orr–Schnell 2023 corrections.

[BHV]: https://perso.univ-rennes1.fr/bachir.bekka/KazhdanTotal.pdf

- **BHV**: Bachir Bekka, Pierre de la Harpe and Alain Valette, *Kazhdan’s Property (T)*. Author manuscript of 23 February 2007; locators use its pagination rather than that of the Cambridge 2008 book.
