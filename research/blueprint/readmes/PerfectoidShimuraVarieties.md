# Shimura towers and perfectoid representability

This roadmap starts with the finite canonical models of pure Shimura varieties and asks which infinite p-level towers are represented by perfectoid spaces. Its main outputs are Scholze’s Siegel and Hodge-type constructions, Hansen–Johansson’s genuine minimal and pre-abelian representability theorems, and period maps on the represented or toroidal diamond towers. Every target below has its hypotheses, direct prerequisites and source locators. A geometric result is a planned target, not an implementation claim.

The open, image-compactified and genuine minimal towers must be distinguished. The first two Hodge-type constructions follow from the Siegel perfectoid tower and closed-locus arguments. The genuine canonical minimal tower additionally needs universal perfectoidization of integral algebras. Pre-abelian representability does not give a period map for arbitrary pre-abelian data: the minimal period-map extension in S6 is for abelian type.

## Inputs and conventions

Fix a rational prime p, tame level K^p and, unless a theorem says otherwise, a complete algebraically closed extension C/ℚ_p with its fixed untilt. The indexing category consists of compact open K_p, with transition maps toward larger subgroups. A sequence is cofinal only if every open level contains a term; trivial intersection alone is insufficient. Finite-level canonical models, boundary geometry and analytification are imports from ShimuraVarieties, ShimuraCompactifications and AdicSpaces. DiamondsAndVStacks supplies the actual sheaf/diamond category and limit comparison. PerfectoidSpaces P7 supplies tilde-limits and good charts; P8 supplies closed-locus and quotient applications. General quotient foundations belong to PerfectoidQuotients.

Right tower translation satisfies T_(gh)=T_h∘T_g. The action can have an arithmetic central kernel even at neat finite level. Effective deck groups divide out its actual closure, and coefficient descent also requires that this kernel annihilate the coefficient fibres. The full tower, neutral-component tower and moduli-rigidified tower are different objects. A fixed infinite Weil-pairing fibre is closed; the profinite family of fibres is not a disjoint union of open components.

For integral GSp, Γ₀(p^m) has lower-left block zero and similitude multiplier one modulo p^m. Replacing the multiplier by det permits unwanted roots of unity for genus greater than one. Γ₁ fixes both diagonal blocks modulo p^m; Γ fixes the entire matrix. At m=0 all three are the full group. The strict Iwahori has diagonal reduction and multiplier one modulo p; It differs from Γ₁: Γ₁ allows upper unipotents, while the strict Iwahori allows diagonal torus elements.

Use the right flag quotient FL=P_μ\G. The Siegel cocharacter μ(t)=diag(1_g,t1_g) gives the lower-block parabolic B=0. Inversion transports G/P to P\G. The graph chart is represented by rows (1,Z), with symmetric Z, and has column kernel (−Z;1). For γ=(A B;C D), its factor is A+ZC and its action is (A+ZC)⁻¹(B+ZD). The quotient frame has factor A+ZC; the W-dual frame has the additional c(γ)⁻¹. Choosing a Tate generator changes the underlying identification and requires transport of the linearization. Distance domains are neighbourhoods of all integral matrices, not only a disc centred at zero.

A fan smooth at the base cusp lattice can lose underlying smoothness after changing p-level. Keep the compatible fan and changed lattices, using fs logarithmic Kummer charts at deeper levels. Do not assume that every underlying deeper-level toroidal space is smooth. A finite toroidal quotient may ramify at the boundary even when it is Galois and étale on the interior.

## Ownership and dependency order

HodgeTateAndCanonicalSubgroups T2 owns the open limit-v-sheaf period map and its equivariance and Levi/bundle pullback, before perfectoid representability. S0 supplies that limit. S3 imports T2’s exact nodes, identifies their analytic incarnation on S2’s representative, proves datum functoriality through S2 and extends them to the compactifications under the stated hypotheses. The generic representable flag, parabolic torsor and Levi quotient needed by T2 belong upstream in R09.1/B0. The dependencies run S0→T2→S3. An edge S3→T4 would close T4→S1→S2→S3→T4 and is forbidden.

T3/T4 supply canonical-subgroup quotients, radius changes and canonical–anticanonical comparisons. S1 specializes those inputs to Scholze’s formal Siegel Frobenius towers and perfectoid limits. T6 supplies the finite-level logarithmic comparison and its central-cocharacter Tate twist. S6 owns tower triviality, the effective-deck/log-to-v bridge and the general toroidal map. Existing TauCetiRoadmap AdicSpaces, AnalyticToricGeometry, AlgebraicVectorBundles and ProfiniteArithmetic supply their general foundations; those foundations are not re-planned here.

## Coverage and limits of the plan

There are 90 target-level nodes: 4 definitions, 20 constructions, 51 theorems, 8 comparisons and 7 lemmas. They carry 155 API items, 97 planned discriminating tests and 27 planets. All eight stages are planned; none is closed. Seven gaps and fifteen exact requests remain, listed below. The revision review REV-PerfectoidShimuraVarieties~2 is complete and records needs_changes. All mathematical targets were checked; eight S6 nodes still depend on unestablished geometric proof inputs, and the suggested file remains a partial prototype that does not meet Protocol §13 packet/file coverage. The recorded closure gaps alone do not require any stage to be implemented or closed. The acceptance failure is the missing prototype coverage, together with the eight explicitly unverifiable proof interfaces.

The suggested file contains 112 actual named declarations/instances and 49 actual examples. Its pinned Lean check succeeds with only placeholder-proof warnings, including the reviewer’s residue-unit and cusp-cone examples. That validates the stated native signatures, not the unavailable geometry or the 90 mathematical targets. The categorical recipes take the actual finite-level models and geometric functors as suppliers; they do not define replacement geometric records. The supplied perfectoid category and fully faithful fixed-base functor are parameters. The representative record retains its space and diamond isomorphism, while good-affinoid/tilde-limit conditions are omitted. Its resulting predicate is only the diamond-representability portion of the full notion.

The following ledger records the stated portions and omissions for every definition/construction. In the target specifications that follow, every planned API and test is still given in mathematics. Items absent from the native signatures are not claimed to have elaborated. Named geometric theorems likewise remain the mathematical statements below: perfectoid representability, boundary goodness, compactified period maps, logarithmic comparison, algebraic torsor descent, integral Levi reductions and their affinoidness have no geometric Lean theorem signatures at this baseline.

## Suggested-file ledger

### The level subgroups Γ₀(pᵐ), Γ₁(pᵐ), Γ(pᵐ) of GSp_2g(ℤ_p)

All nine planned level-group API names have actual native signatures, using integral GSp and the multiplier congruence. Compactness/openness and full multiplier-image statements are included. Examples cover m=0, genus one, the Γ₀/Γ₁ and GL₂ finite indices, the SL₂(ℤ) congruence comparison, noncofinal Γ₁ and the determinant-versus-multiplier non-example. No geometric moduli quotient is inferred from these group calculations.

API names with a native signature or structure field (often only the stated portion): `GSp.levelGamma`, `GSp.levelGamma1`, `GSp.levelGamma0`, `GSp.levelGamma_le_levelGamma1`, `GSp.levelGamma_normal`, `GSp.levelGamma0QuotGamma1`, `GSp.levelGamma_cofinal`, `GSp.similitude_levelGamma0`, `GSp.levelGamma_genusOne`.

### The p-level tower of a Shimura datum at fixed tame level

Canonical-model, base-change and analytification functors are supplied. Finiteness and degree, canonical-model descent, double-coset points and geometric open immersion are omitted. Identity and composition examples check only the functor recipe.

API names with a native signature or structure field (often only the stated portion): `ShimuraTower.pLevel`, `ShimuraTower.pLevelMin`, `ShimuraTower.toMin`, `ShimuraTower.transition_comp`, `ShimuraTower.reindex`.

API names without a signature: `ShimuraTower.transition_finite`, `ShimuraTower.points_eq_doubleCoset`.

### The right action of G(ℚ_p) and of prime-to-p Hecke operators on the p-level tower

An opposite-group action on points, its multiplication order, equivariant transitions and quotient by an actual annihilated normal subgroup are stated. Continuous diamond actions, arithmetic identity at a finite level, tame Hecke maps and the actual deck-kernel equality are omitted.

API names with a native signature or structure field (often only the stated portion): `ShimuraTower.translate`, `ShimuraTower.translate_one`, `ShimuraTower.translate_mul`, `ShimuraTower.translate_of_mem`, `ShimuraTower.translate_comm_transition`, `ShimuraTower.quotientAction`.

API names without a signature: `ShimuraTower.primeToPHecke`.

### The infinite-level Shimura diamond S^◇_{K^p,∞}

The actual limit in a supplied sheaf category, projections, extensionality and reindexing by an initial functor are stated. Existence/diamondhood, spatiality, underlying topological limit, complete-field points, continuous action and pro-étaleness are omitted. No claim that an ordinary categorical limit is a tilde-limit is made.

API names with a native signature or structure field (often only the stated portion): `ShimuraTower.infiniteLevel`, `ShimuraTower.infiniteLevelMin`, `ShimuraTower.infiniteLevel.proj`, `ShimuraTower.infiniteLevel_reindex`.

API names without a signature: `ShimuraTower.infiniteLevelMin_isSpatial`, `ShimuraTower.infiniteLevel_isLocallySpatial`, `ShimuraTower.infiniteLevel_space_homeo`, `ShimuraTower.infiniteLevel_points`, `ShimuraTower.infiniteLevel_action`, `ShimuraTower.infiniteLevel_proEtale`.

### Perfectoid representatives of a tower

A supplied category Perf and fixed-base fully faithful diamond functor give the representative’s space and diamond isomorphism, cone lifting, uniqueness and maps. Good-affinoid and dense-function/tilde-limit conditions are omitted. Every API has its categorical portion; the nonperfectoid constant-tower and component-moduli tests are not expressible here.

API names with a native signature or structure field (often only the stated portion): `ShimuraTower.PerfectoidRepresentative`, `ShimuraTower.PerfectoidRepresentative.diamondIso`, `ShimuraTower.PerfectoidRepresentative.unique`, `ShimuraTower.PerfectoidRepresentative.lift`, `ShimuraTower.PerfectoidRepresentative.map`, `ShimuraTower.PerfectoidRepresentative.ofDiamondIso`, `ShimuraTower.IsPerfectoidTower`.

### The neutral-component tower and its symmetry group

The neutral diagram and inclusion are supplied functors; the neutral symmetry is the stabilizer in a supplied component action. Actual arithmetic components, connectedness, induced reconstruction, neutral deck groups and connected-data moduli are omitted.

API names with a native signature or structure field (often only the stated portion): `ShimuraTower.neutralComponent`, `ShimuraTower.neutralComponent.toFull`, `ShimuraTower.neutralSymmetry`.

API names without a signature: `ShimuraTower.neutralDeckGroup`, `ShimuraTower.fullOfNeutral`, `ShimuraTower.connectedDatumTower`, `ShimuraTower.neutralComponent_isConnected`.

### Towers retaining a moduli rigidification

Only the quadratic-unit arithmetic example is stated. Rigidified Shimura moduli, finite geometric quotient, tower limit, torsor freeness and quotient/limit comparison have no signatures.

API names without a signature: `ShimuraTower.Rigidified`, `ShimuraTower.Rigidified.quotientIso`, `ShimuraTower.Rigidified.infiniteLevel`, `ShimuraTower.Rigidified.isTorsor_of_free`, `ShimuraTower.Rigidified.quotient_infiniteLevel`, `ShimuraTower.Rigidified.trivial`.

### The general-data infinite-level diamond

The limit of the supplied general-data diagram is stated. General canonical models, spatiality, component identifications, actions and agreement with the abelian construction remain supplied geometry.

API names with a native signature or structure field (often only the stated portion): `ShimuraTower.generalInfiniteLevel`.

API names without a signature: `ShimuraTower.generalInfiniteLevel_isSpatial`, `ShimuraTower.generalInfiniteLevel_action`, `ShimuraTower.generalInfiniteLevel_eq_abelian`.

### The toroidal tower diamond with cone-compatible deck actions

Analytification of a supplied cone-compatible diagram and its limit, maps to the supplied open/minimal diagrams and refinement compatibility are stated. Open immersion, spatiality, boundary ramification, continuous effective deck actions and Hecke spans through changed fans are omitted. The refinement example checks only the identity refinement.

API names with a native signature or structure field (often only the stated portion): `ShimuraTower.toroidal`, `ShimuraTower.toroidalInfiniteLevel`, `ShimuraTower.toroidalInfiniteLevel.openEmbedding`, `ShimuraTower.toroidalInfiniteLevel.toMin`, `ShimuraTower.toroidalInfiniteLevel.refine`.

API names without a signature: `ShimuraTower.toroidalInfiniteLevel_isSpatial`, `ShimuraTower.toroidalInfiniteLevel.deck`, `ShimuraTower.toroidalInfiniteLevel.translate`.

### The Siegel spaces of the construction: integral models, Hasse domains and finite-level adic spaces

No signature: the integral minimal moduli/model, semi-abelian boundary, analytic generic fibre and Hasse-domain carriers are unavailable. All seven APIs and five geometric tests are omitted.

API names without a signature: `SiegelTorsion.integralMin`, `SiegelTorsion.hasseDomain`, `SiegelTorsion.hasseDomain_generic`, `SiegelTorsion.finiteLevel`, `SiegelTorsion.finiteLevel_hasse`, `SiegelTorsion.finiteLevel_eq_tower`, `SiegelTorsion.hasseDomain_mono`.

### The anticanonical Γ₀(pᵐ)-tower and its affinoidness at deep level

No signature: formal Hasse neighbourhoods, canonical subgroups, analytic anticanonical domains and their tilde-limit carriers are unavailable. All six APIs and four tests are omitted.

API names without a signature: `SiegelTorsion.anticanonical`, `SiegelTorsion.anticanonical_iso_hasse`, `SiegelTorsion.anticanonical_isClopen`, `SiegelTorsion.anticanonical_integralModel`, `SiegelTorsion.anticanonical_isAffinoid`, `SiegelTorsion.anticanonical_restrict`.

### Tate's normalized traces on the anticanonical tower

Finite free characteristic-zero algebras give degree-normalized trace, linearity, scalar identity and tower compatibility, with three algebraic examples. Completed affinoid algebras, integral operator bounds and convergence in the Frobenius tower are omitted; the finite-level coefficient trace is not the full continuous Tate trace.

API names with a native signature or structure field (often only the stated portion): `SiegelTorsion.normalizedTrace`, `SiegelTorsion.normalizedTrace_of_finiteLevel`, `SiegelTorsion.normalizedTrace_compat`, `SiegelTorsion.normalizedTrace_linear`.

API names without a signature: `SiegelTorsion.normalizedTrace_bound`, `SiegelTorsion.normalizedTrace_tendsto`.

### The continuous Hodge–Tate map on the open infinite-level Siegel tower

No signature: abelian families, completed relative Hodge–Tate sequence and the underlying inverse-limit analytic space are unavailable. All five APIs and four tests are omitted.

API names without a signature: `SiegelTorsion.htMapTop`, `SiegelTorsion.htMapTop_apply`, `SiegelTorsion.htMapTop_continuous`, `SiegelTorsion.htMapTop_equivariant`, `SiegelTorsion.points_infiniteLevel`.

### The Siegel Hodge–Tate period map as a map of adic spaces, extended over the boundary

No signature: the perfectoid and analytic flag/morphism carriers and boundary extension are unavailable. All six APIs and four tests are omitted.

API names without a signature: `SiegelTorsion.htMap`, `SiegelTorsion.htMap_top`, `SiegelTorsion.htMap_unique`, `SiegelTorsion.htMap_equivariant`, `SiegelTorsion.htMap_anticanonical`, `SiegelTorsion.htMap_neighbourhood`.

### The open perfectoid Siegel tower, its right action and its finite-level quotients

Only the strict-Iwahori subgroup of actual integral GSp is stated, with Γ₀ inclusion and quotient/unipotent tests. Open perfectoid tower, geometric effective torsor, quotient and action signatures and tests are omitted.

API names with a native signature or structure field (often only the stated portion): `SiegelTorsion.strictIwahori`.

API names without a signature: `SiegelTorsion.openTower`, `SiegelTorsion.openTower_torsor`, `SiegelTorsion.openTower_quotient`, `SiegelTorsion.openTower_action`.

### The symplectic embedding and the comparison of finite levels with their Siegel images

No signature: actual Shimura-data embeddings, finite-level analytic models and closed immersions are unavailable. All six APIs and four tests are omitted.

API names without a signature: `HodgeTower.embedding`, `HodgeTower.toSiegel`, `HodgeTower.toSiegel_isClosedImmersion`, `HodgeTower.toSiegel_boundary`, `HodgeTower.toSiegel_comp`, `HodgeTower.toSiegel_finite`.

### Scholze's image compactification and its relation to the minimal compactification

No signature: schematic closure, normalization, Hodge-type canonical minimal compactification and boundary carriers are unavailable. All six APIs and four tests are omitted.

API names without a signature: `HodgeTower.imageCompactification`, `HodgeTower.minToImage`, `HodgeTower.minToImage_isNormalization`, `HodgeTower.minToImage_iso_open`, `HodgeTower.imageCompactification_boundary`, `HodgeTower.imageCompactification_stable`.

### Imported homogeneous flag and Levi torsor: the right-action dictionary

Point quotients P\G, inversion, U\G→P\G, inverse-left Levi action, normality and fibrewise freeness are stated. These do not give an algebraic/analytic torsor or associated vector bundle; geometric local triviality, compact dual, parabolic from μ and general associated-bundle APIs are omitted. The generic geometric construction is an upstream R09.1/B0 request, not owned by S3.

API names with a native signature or structure field (often only the stated portion): `HodgeTate.FL`, `HodgeTate.leviTorsor`, `HodgeTate.FL_equivLeftFlag`.

API names without a signature: `HodgeTate.associatedBundle`, `HodgeTate.associatedBundle_tensor`, `HodgeTate.FL_siegel`.

### Siegel graph charts, strict-Iwahori stable domains and the Hodge–Tate frame

Symmetric matrices, block fractional action, determinant-unit congruence, quotient map (1,Z), its graph kernel, surjectivity and transformation are stated. The distance-to-ℤ_p subset and strict-Iwahori pointwise stability are stated over normed ultrametric p-adic extensions. Kernel/quotient and the genus-one c⁻¹ correction have examples. Analytic affinoid realization, pullback to an actual abelian family, bundle frames and Tate-line linearizations are omitted.

API names with a native signature or structure field (often only the stated portion): `HodgeTate.siegelGraphChart`, `HodgeTate.siegelGraphChart_act`, `HodgeTate.det_factor_isUnit`, `HodgeTate.siegelGraphChart_stable`, `HodgeTate.hodgeFrame`, `HodgeTate.hodgeFrame_transform`, `HodgeTate.graphDistanceDomain`.

### Property 𝒫: perfectoidness of all minimally compactified towers of a datum

Only universal diamond representability of supplied minimal/neutral diagrams and diagram-isomorphism invariance are stated. This omits the good-chart and strong-boundary clauses, arithmetic index-category construction, neutral/full equivalence, adjoint descent and Hodge/pre-abelian geometric examples.

API names with a native signature or structure field (often only the stated portion): `ShimuraTower.PropertyP`, `ShimuraTower.ConnectedPropertyP`, `ShimuraTower.propertyP_iso`.

API names without a signature: `ShimuraTower.propertyP_iff_neutral`, `ShimuraTower.propertyP_of_adjoint`, `ShimuraTower.propertyP_hodge`.

### The geometric, intermediate and arithmetic Hilbert towers at infinite level

Only the matrix level action through det(γ)γ⁻¹, its order and diagonal counterexamples are stated. The three geometric towers, β₁/β₂, polarization action, Weil-pairing components and perfectoid representatives have no signatures.

API names with a native signature or structure field (often only the stated portion): `HilbertTower.levelAction`.

API names without a signature: `HilbertTower.geometric`, `HilbertTower.intermediate`, `HilbertTower.arithmetic`, `HilbertTower.beta1`, `HilbertTower.beta2`, `HilbertTower.polAction`, `HilbertTower.isPerfectoid`.

### The 𝒪_p^×-valued Weil pairing of the intermediate Hilbert tower

Only the alternating determinant coefficient, its level transformation, target-generator change and diagonal example are stated. A closed singleton in the p-adic pairing group illustrates the topology. Actual abelian Weil pairing, polarization compatibility, ideal/twist generator, target units and geometric/rigidified/arithmetic fibres are omitted.

API names with a native signature or structure field (often only the stated portion): `HilbertTower.weilPairing`, `HilbertTower.weilPairing_level`, `HilbertTower.weilPairing_changeGenerator`.

API names without a signature: `HilbertTower.weilPairing_pol`, `HilbertTower.weilPairing_fibre`, `HilbertTower.weilPairing_E`, `HilbertTower.weilPairing_arith`.

### The action of G(ℚ_p) on the Hilbert towers and the change of polarization module

Only the dual-matrix multiplication order used for its level-action convention has a signature/example in hilbert-three-towers. No action on isogenies, polarization classes or Hilbert spaces is stated; all four qpAction APIs and the geometric tests are omitted.

API names without a signature: `HilbertTower.qpAction`, `HilbertTower.qpAction_extends`, `HilbertTower.qpAction_polModule`, `HilbertTower.qpAction_eq_translate`.

### Auxiliary data for an abelian-type datum: the Hodge-type cover and Lovering's B₁

Only the group fibre product of supplied ab/reflex-norm homomorphisms, its projections, commutative square and identity-pullback example are stated. No reflex norm, cocharacter, auxiliary Shimura datum, reflex-field compatibility, maps to G, coefficient c-Levi identity or toroidal Galois quotient is constructed.

API names with a native signature or structure field (often only the stated portion): `AbelianType.lovering`.

API names without a signature: `AbelianType.hodgeCover`, `AbelianType.flag_eq`, `AbelianType.deltaGroup`, `AbelianType.neutral_galois`.

## S0 — Finite and infinite towers

Coverage: **planned**.

- Promote the finite-level freeness argument of tower-action-kernel (stabilisers of Hodge-generic points) to a lemma node when the roadmap moves to lemma level.
- The requests to ShimuraVarieties V8 (finiteness of extended datum maps) and V2 (arbitrary arithmetic groups) are open.

### The level subgroups Γ₀(pᵐ), Γ₁(pᵐ), Γ(pᵐ) of GSp_2g(ℤ_p)

Target `PerfectoidShimuraVarieties:S0/siegel-level-subgroups` (definition).

Let g ≥ 1, let J = Matrix.J = (0 −1_g; 1_g 0) be Mathlib's symplectic matrix on ℤ_p^{2g} (Scholze's form is −J; the similitude group and the level groups below do not depend on this sign), and let GSp_2g(ℤ_p) = {γ ∈ GL_2g(ℤ_p) : γJγᵗ = c(γ)J for some c(γ) ∈ ℤ_p^×} (equivalently γᵗJγ = c(γ)J; for c = 1 this is Mathlib's Matrix.symplecticGroup), with similitude character c : GSp_2g → G_m and blocks of size g × g. For m ≥ 1 put Γ(pᵐ) = {γ ∈ GSp_2g(ℤ_p) : γ ≡ 1 mod pᵐ}, Γ₁(pᵐ) = {γ : γ ≡ (1 ∗; 0 1) mod pᵐ}, and Γ₀(pᵐ) = {γ : γ ≡ (∗ ∗; 0 ∗) mod pᵐ and c(γ) ≡ 1 mod pᵐ}. Then Γ(pᵐ) ⊆ Γ₁(pᵐ) ⊆ Γ₀(pᵐ) ⊆ GSp_2g(ℤ_p) are compact open subgroups, Γ(pᵐ) is normal in GSp_2g(ℤ_p), Γ₁(pᵐ) is normal in Γ₀(pᵐ) with Γ₀(pᵐ)/Γ₁(pᵐ) ≅ GL_g(ℤ/pᵐ) through the upper-left block, and Γ₀(pᵐ)/Γ(pᵐ) is the group of block upper-triangular matrices in GSp_2g(ℤ/pᵐ) with similitude 1. The family (Γ(pᵐ))_m is cofinal among compact open subgroups of GSp_2g(ℚ_p); the families (Γ₀(pᵐ))_m and (Γ₁(pᵐ))_m are not, and their intersections Γ₀(p^∞) = ⋂_m Γ₀(pᵐ), Γ₁(p^∞) = ⋂_m Γ₁(pᵐ) are closed subgroups that are not open.

**Hypotheses and conventions.**

- The similitude condition in Γ₀(pᵐ) is c(γ) ≡ 1 mod pᵐ. The published Definition 3.1.1 prints det γ ≡ 1 mod pᵐ; since det γ = c(γ)^g, the printed condition is weaker for g > 1 (it allows c(γ) ∈ μ_g(ℤ/pᵐ)) and does not give the stated field of definition ℚ(ζ_{pᵐ}) of X*_{Γ₀(pᵐ)}; see sourceIssues PerfectoidShimuraVarieties/E1.
- For g = 1, GSp_2 = GL_2, c = det, and Γ₀(pᵐ) here is {(a b; c d) ∈ GL_2(ℤ_p) : c ≡ 0, ad − bc ≡ 1 mod pᵐ}, which differs from the classical Γ₀(pᵐ) of GL_2(ℤ_p) by the determinant condition.
- For multiplier images at level zero, write U_0 = ℤ_p^× and U_m = ker(ℤ_p^× → (ℤ/pᵐ)^×) for m ≥ 1; thus U_m = 1 + pᵐℤ_p only for m ≥ 1.

**Proof route.**

1. The conditions are preserved by products and inverses because reduction mod pᵐ is a group homomorphism GSp_2g(ℤ_p) → GSp_2g(ℤ/pᵐ) and the subsets defined modulo pᵐ (block upper-triangular, unipotent block upper-triangular, identity, similitude 1) are subgroups of GSp_2g(ℤ/pᵐ); each is the preimage of a subgroup of a finite group, hence compact open.
2. Γ(pᵐ) is the kernel of reduction, hence normal. The map Γ₀(pᵐ) → GL_g(ℤ/pᵐ), γ ↦ upper-left block mod pᵐ, is a homomorphism on block upper-triangular matrices with kernel Γ₁(pᵐ) (for a symplectic similitude with c ≡ 1 and lower-left block 0, the lower-right block is (Aᵗ)⁻¹ mod pᵐ, so A ≡ 1 forces D ≡ 1).
3. Cofinality: reduction modulo pᵐ gives a neighbourhood basis of 1 in the matrix topology on GSp_2g(ℤ_p). For every open subgroup U, choose m such that Γ(pᵐ) ⊆ U. Since GSp_2g(ℤ_p) is compact open in GSp_2g(ℚ_p), intersect any compact open subgroup of GSp_2g(ℚ_p) with it and use the same witness. This supplies PerfectoidSpaces:P7/level-cofinality-witness, rather than just the equality of the intersection with {1}.
4. Non-cofinality: Γ₁(pᵐ) ⊇ {(1 B; 0 1) : B symmetric with entries in ℤ_p} for all m, so ⋂_m Γ₁(pᵐ) ≠ {1} and no Γ₁(pᵐ) lies in Γ(p); the same holds for Γ₀.

**Planning API.**

- `GSp.levelGamma` (constructor): Γ(pᵐ) as an open normal subgroup of GSp_2g(ℤ_p): the kernel of reduction modulo pᵐ.
- `GSp.levelGamma1` (constructor): Γ₁(pᵐ) as an open subgroup of GSp_2g(ℤ_p).
- `GSp.levelGamma0` (constructor): Γ₀(pᵐ) as an open subgroup of GSp_2g(ℤ_p), with the similitude condition c(γ) ≡ 1 mod pᵐ.
- `GSp.levelGamma_le_levelGamma1` (relation): Γ(pᵐ) ≤ Γ₁(pᵐ) ≤ Γ₀(pᵐ), and Γ(pᵐ⁺¹) ≤ Γ(pᵐ), Γ₁(pᵐ⁺¹) ≤ Γ₁(pᵐ), Γ₀(pᵐ⁺¹) ≤ Γ₀(pᵐ).
- `GSp.levelGamma_normal` (instance): Γ(pᵐ) is normal in GSp_2g(ℤ_p) and Γ₁(pᵐ) is normal in Γ₀(pᵐ).
- `GSp.levelGamma0QuotGamma1` (equivalence): Γ₀(pᵐ)/Γ₁(pᵐ) ≅ GL_g(ℤ/pᵐ) through the upper-left block.
- `GSp.levelGamma_cofinal` (characterisation): Every open subgroup of GSp_2g(ℚ_p) contains some Γ(pᵐ): a cofinality witness in the sense of PerfectoidSpaces:P7/level-cofinality-witness.
- `GSp.similitude_levelGamma0` (simp): c(Γ₀(pᵐ)) = U_m and c(Γ(pᵐ)) = U_m, with U_0 = ℤ_p^×.
- `GSp.levelGamma_genusOne` (compatibility): For g = 1, Γ(pᵐ) is the principal congruence subgroup of GL_2(ℤ_p), and its intersection with SL_2(ℤ) is Mathlib's CongruenceSubgroup.Gamma (pᵐ).

**Unit tests.**

- `levelGamma_index_g1` (computation): For g = 1, m = 1: [GL_2(ℤ_p) : Γ(p)] = (p² − 1)(p² − p), [Γ₀(p) : Γ₁(p)] = p − 1, [Γ₁(p) : Γ(p)] = p.
- `levelGamma0_similitude_not_det` (non-example): For g = 2, p odd and m = 1, the element γ = diag(1, 1, −1, −1) of GSp_4(ℤ_p) has c(γ) = −1 and det γ = 1: it satisfies the printed condition det γ ≡ 1 mod p but not c(γ) ≡ 1 mod p, so it lies in the printed Γ₀(p) and not in Γ₀(p).
- `levelGamma_inter_SL2Z` (compatibility): For g = 1, inside GL_2(ℤ_p) ⊇ SL_2(ℤ): Γ(pᵐ) ∩ SL_2(ℤ) = CongruenceSubgroup.Gamma (pᵐ), Γ₁(pᵐ) ∩ SL_2(ℤ) = CongruenceSubgroup.Gamma1 (pᵐ) and Γ₀(pᵐ) ∩ SL_2(ℤ) = CongruenceSubgroup.Gamma0 (pᵐ) (Mathlib; Gamma1 is the condition a ≡ d ≡ 1, c ≡ 0 modulo pᵐ).
- `levelGamma1_not_cofinal` (non-example): The matrix (1 B; 0 1) with B = 1_g lies in Γ₁(pᵐ) for every m but not in Γ(p): the Γ₁-family is not cofinal.
- `levelGamma_m_zero` (degenerate): For m = 0 all three groups are GSp_2g(ℤ_p).

**Acceptance instances.**

- For g = 1 and m = 1, [GSp_2(ℤ_p) : Γ(p)] = |GL_2(𝔽_p)| = (p² − 1)(p² − p), [Γ₀(p) : Γ₁(p)] = p − 1 and [Γ₁(p) : Γ(p)] = p.
- c(Γ(pᵐ)) = c(Γ₀(pᵐ)) = U_m, where U_0 = ℤ_p^× and U_m = 1 + pᵐℤ_p for m ≥ 1.

**Direct prerequisites.** `mathlib:Matrix.J`, `mathlib:Matrix.symplecticGroup`, `mathlib:Matrix.GeneralLinearGroup`, `mathlib:PadicInt`, `mathlib:CongruenceSubgroup.Gamma`, `mathlib:CongruenceSubgroup.Gamma1`, `mathlib:CongruenceSubgroup.Gamma0`, `PerfectoidSpaces:P7/compact-open-subgroup-cofinality`, `PerfectoidSpaces:P7/level-cofinality-witness`.

**Sources.**

- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §3.1, Definition 3.1.1 and the sentences after it, p. 971. The three level groups and the nonstandard similitude condition, corrected to c(γ) ≡ 1 (PerfectoidShimuraVarieties/E1).

### The p-level tower of a Shimura datum at fixed tame level

Target `PerfectoidShimuraVarieties:S0/p-level-tower` (construction).

Let D = (G, X) be a pure Shimura datum with reflex field E = E(D), with actual canonical models (ShimuraVarieties V6 for abelian type, V7/V8.general in general), and fix a prime p, a complete algebraically closed nonarchimedean extension C of ℚ_p and an embedding ι: E → C. For a compact open K^p ⊆ G(𝔸_f^p) let CO_p = CO(G(ℚ_p)) be the cofiltered poset of compact open subgroups of G(ℚ_p) under inclusion. The p-level tower at tame level K^p is the functor CO_p^{op-arrows} → analytic adic spaces over Spa(C, O_C), K_p ↦ S_{K^pK_p} := (Sh_{K^pK_p}(G, X) ⊗_{E,ι} C)^{ad}, with transition maps π_{K'_p,K_p}: S_{K^pK'_p} → S_{K^pK_p} for K'_p ⊆ K_p the analytifications of the descended forgetful maps of ShimuraVarieties:V8/level-tower; and likewise the minimally compactified tower K_p ↦ S*_{K^pK_p} := (Sh*_{K^pK_p} ⊗_{E,ι} C)^{ad} with the extended finite level maps of ShimuraVarieties:V8/minimal-map-extension. The transition maps are finite, finite étale on the open towers when K^pK_p is neat, and the open tower is the restriction of the compactified one to the complements of the boundaries. On C-points: if |C| = 2^ℵ₀ (for instance C = ℂ_p), a field isomorphism σ: C ≅ ℂ exists, and through σ ∘ ι and the complex uniformisation of ShimuraVarieties:V1/analytic-points, S_{K^pK_p}(C) = G(ℚ)\(X × G(𝔸_f)/K^pK_p); for C of larger cardinality no such σ exists. Identities between the base-changed algebraic maps (for instance T_g = id) hold over C as soon as they hold over ℂ for the models over Ē, so the double-coset computations of the following nodes apply for every C.

**Hypotheses and conventions.**

- D in the datum class for which actual canonical models are supplied (abelian type by ShimuraVarieties V6; all pure data by V7, used in S0.general).
- C is complete, algebraically closed, of characteristic 0, over ℚ_p; the tower depends on ι. Descent to E_v or to other bases is a separate theorem and is not implicit in the notation.
- No neatness is assumed for the definition; finiteness of transition maps needs no neatness (ShimuraVarieties:V8/finite-level-maps).

**Proof route.**

1. Take the algebraic tower and its finite level maps from ShimuraVarieties:V8/level-tower and ShimuraVarieties:V8/finite-level-maps; base change along ι and analytify (AdicSpacesPartII:R1/analytification-functor; analytification preserves finiteness and étaleness by AdicSpacesPartII:R1/analytification-finite and AdicSpacesPartII:R1/analytification-etale-smooth).
2. For the compactified tower use ShimuraVarieties:V8/minimal-descent for the models over E and ShimuraVarieties:V8/minimal-map-extension for the finite extended level maps; the open tower is the complement of the boundary, functorially.
3. Functoriality in K_p (identity and composition) is inherited from the algebraic tower; the index poset is cofiltered because K_p ∩ K'_p is compact open.

**Planning API.**

- `ShimuraTower.pLevel` (data): The functor K_p ↦ S_{K^pK_p} on compact open subgroups of G(ℚ_p), for fixed D, K^p, C, ι.
- `ShimuraTower.pLevelMin` (data): The minimally compactified tower K_p ↦ S*_{K^pK_p} with its finite extended level maps.
- `ShimuraTower.toMin` (projection): The open immersion of towers S_{K^pK_p} → S*_{K^pK_p}, with complement the boundary Z_{K^pK_p}.
- `ShimuraTower.transition_finite` (characterisation): Every transition map is finite; on the open tower it is finite étale when K^pK_p is neat.
- `ShimuraTower.transition_comp` (functoriality): π_{K''_p,K_p} = π_{K'_p,K_p} ∘ π_{K''_p,K'_p} and π_{K_p,K_p} = id.
- `ShimuraTower.points_eq_doubleCoset` (characterisation): For |C| = 2^ℵ₀ and a field isomorphism σ: C ≅ ℂ: S_{K^pK_p}(C) ≅ G(ℚ)\(X × G(𝔸_f)/K^pK_p) through σ ∘ ι and the complex uniformisation, compatibly with transition maps.
- `ShimuraTower.reindex` (functoriality): Restriction along a level family with a cofinality witness (PerfectoidSpaces:P7/level-cofinality-witness) does not change limits or tilde-limits.

**Unit tests.**

- `pLevel_gl2_full_level` (computation): For GL_2, K^p = K(N)^p (N ≥ 3) and K_p = K(pᵐ), S*_{K^pK_p} has φ(Npᵐ) connected components, each the analytified complete modular curve X(Npᵐ)_C.
- `pLevel_transition_degree_gl2` (computation): For GL_2, N ≥ 3 and m ≥ 1, the map S_{K^pK(pᵐ⁺¹)} → S_{K^pK(pᵐ)} is finite étale of degree p⁴ = [K(pᵐ) : K(pᵐ⁺¹)] (the kernel of the action is trivial at this level).
- `pLevel_torus_zero_dim` (degenerate): For a torus datum (T, {h}) the tower consists of finite sets of C-points T(ℚ)\T(𝔸_f)/K^pK_p (zero-dimensional adic spaces), with surjective transition maps.
- `pLevel_not_over_reflex_completion` (non-example): For GL_2 the tower over C is not the base change of a tower over ℚ_p of geometrically connected spaces: the component set (ℤ/Npᵐ)^× carries the cyclotomic Galois action, so the fixed-pairing fibres are defined only over ℚ_p(ζ_{Npᵐ}).

**Acceptance instances.**

- For D = (GL_2, ℍ^±), K^p = K(N)^p with N ≥ 3 prime to p, and K_p = K(pᵐ), S*_{K^pK_p} is the analytification over C of the base change of X_full(Npᵐ)_ℚ (ShimuraVarieties:V8/gl2-compact-model), a disjoint union of φ(Npᵐ) copies of the compactified modular curve X(Npᵐ) over C.
- For the Siegel datum and K_p = Γ(pᵐ), S*_{K^pK_p} is the adic space over Spa(ℚ_p, ℤ_p) of X*_{Γ(pᵐ)K^p} in the notation of Scholze §3.1, base changed along ℚ_p → C (all similitude components); it is not Scholze's §3.2 space X*_{Γ(pᵐ)} ⊗_{ℚ(ζ_{pᵐ})} ℚ_p^cycl base changed along ℚ_p^cycl → C, which is the open and closed part on which the similitude root is the fixed ζ_{pᵐ}.

**Direct prerequisites.** `ShimuraVarieties:V8/level-tower`, `ShimuraVarieties:V8/finite-level-maps`, `ShimuraVarieties:V8/minimal-descent`, `ShimuraVarieties:V8/minimal-map-extension`, `ShimuraVarieties:V8/abelian-instance`, `ShimuraVarieties:V1/analytic-points`, `AdicSpacesPartII:R1/analytification-functor`, `AdicSpacesPartII:R1/analytification-finite`, `AdicSpacesPartII:R1/analytification-etale-smooth`, `mathlib:CategoryTheory.IsCofiltered`, `mathlib:CategoryTheory.Functor`.

**Sources.**

- [J. S. Milne, Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §5, 'Passage to the limit', Theorem 5.28 and Remark 5.29, pp. 64–65. Remark 5.29: the inverse system, the right action T(gh) = T(h) ∘ T(g), and S_K = S_{K'}/(K/K') for K' normal in K.
- [David Hansen, Christian Johansson, Perfectoid Shimura varieties and the Calegari–Emerton conjectures](https://arxiv.org/abs/2011.03951v2), §5.3, conventions at the start of the subsection, p. 35. The minimally compactified tower over C and the component comparison used later.
- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §3.1, the paragraph before Definition 3.1.1, p. 971. The Siegel instance of the tower.

### The right action of G(ℚ_p) and of prime-to-p Hecke operators on the p-level tower

Target `PerfectoidShimuraVarieties:S0/tower-right-action` (construction).

In the situation of p-level-tower, for g ∈ G(ℚ_p) (embedded in G(𝔸_f) with trivial prime-to-p component) and K_p ∈ CO_p, the descended right translation T_g: S_{K^pK_p} → S_{K^p g⁻¹K_pg} ([x, a] ↦ [x, ag] on complex points before canonical-model descent; ShimuraVarieties:V8/translation-laws) is an isomorphism, extended to S* by ShimuraVarieties:V8/minimal-map-extension. The T_g satisfy T_1 = id, T_{gh} = T_h ∘ T_g and π ∘ T_g = T_g ∘ π, and for k ∈ K_p, T_k: S_{K^pK_p} → S_{K^pK_p} is the identity. Hence for K'_p normal in K_p the finite group K_p/K'_p acts on S_{K^pK'_p} over S_{K^pK_p}, and G(ℚ_p) acts on the right on the pro-system (S_{K^pK_p})_{K_p} (an action in the sense of Deligne 2.7.1). Prime-to-p Hecke: for h ∈ G(𝔸_f^p) the translations S_{K^pK_p} → S_{h⁻¹K^ph K_p} commute with the G(ℚ_p)-action and the transition maps.

**Hypotheses and conventions.**

- As in p-level-tower; g ranges over G(ℚ_p), not over the profinite K_p only.
- The action is C-linear: it is defined after base change along ι. Scholze's spaces over ℚ_p^cycl carry a GSp_2g(ℚ_p)-action that does not preserve the structure map to Spa(ℚ_p^cycl) (torsion paper, footnote 7); that twisted form is not the action here.

**Proof route.**

1. Analytify and base change the algebraic right translations of ShimuraVarieties:V8/translation-laws and their minimal extensions.
2. The relations T_1 = id, T_{gh} = T_h ∘ T_g and T_k = id for k ∈ K_p follow from the double-coset formula on the complex canonical models. Equality of algebraic maps descends along the faithfully flat extension E → ℂ, then survives base change E → C and analytification. No identification of an arbitrary complete algebraically closed C with ℂ is required.
3. Commutation with transition maps and with prime-to-p translations is the same computation on double cosets, [x, a] ↦ [x, ag] and [x, a] ↦ [x, ah] commuting because g and h have disjoint support.

**Planning API.**

- `ShimuraTower.translate` (constructor): T_g: S_{K^pK_p} → S_{K^p g⁻¹K_pg} for g ∈ G(ℚ_p).
- `ShimuraTower.translate_one` (simp): T_1 = id.
- `ShimuraTower.translate_mul` (simp): T_{gh} = T_h ∘ T_g (right action).
- `ShimuraTower.translate_of_mem` (simp): T_k = id on S_{K^pK_p} for k ∈ K_p.
- `ShimuraTower.translate_comm_transition` (functoriality): π ∘ T_g = T_g ∘ π for compatible levels.
- `ShimuraTower.primeToPHecke` (constructor): Translations by h ∈ G(𝔸_f^p), commuting with all T_g and transition maps.
- `ShimuraTower.quotientAction` (constructor): For K'_p ⊴ K_p, the action of K_p/K'_p on S_{K^pK'_p} over S_{K^pK_p}.

**Unit tests.**

- `translate_mul_order` (characterisation): For noncommuting g, h ∈ GL_2(ℚ_p), T_{gh} = T_h ∘ T_g and in general T_{gh} ≠ T_g ∘ T_h on C-points: the action is a right action.
- `translate_center_gl2` (computation): For GL_2, K^p = K(N)^p with N ≥ 3 prime to p, and z = p·1 ∈ Z(ℚ_p), T_z acts on lim_{K_p} S_{K^pK_p}(C) by [x, a] ↦ [x, a z_p] = [x, a (z^p)⁻¹] (z^p = p·1 ∈ G(𝔸_f^p)), which is the identity exactly when p ≡ 1 modulo N (for p ≡ −1 modulo N it is T_{−1}, which is not the identity since −1 ∉ K(N)^p).
- `translate_trivial_group` (degenerate): For the torus datum (G_m, {Nm}) (X a point), p odd, K^p = Ẑ^{p×}, K_p = ℤ_p^× and K'_p = 1 + pℤ_p: S_{K^pK'_p} = ℚ^×\𝔸_f^×/K^pK'_p ≅ 𝔽_p^×/{±1}, and quotientAction of K_p/K'_p = 𝔽_p^× is translation, whose trivially acting subgroup is {±1}, the image of Z(ℚ) ∩ K^pK_p = {±1}; so the subgroup acting trivially is nontrivial and quotientAction is not faithful.

**Acceptance instances.**

- For GL_2 and g = diag(p, 1), T_g relates S_{K^pK(pᵐ)} to S_{K^p g⁻¹K(pᵐ)g}; composed with the transition maps it gives the U_p/T_p correspondence of the modular tower.
- For k ∈ K_p, T_k = id on S_{K^pK_p} (Milne, Remark 5.29(c)).

**Direct prerequisites.** `PerfectoidShimuraVarieties:S0/p-level-tower`, `ShimuraVarieties:V8/translation-laws`, `ShimuraVarieties:V8/minimal-map-extension`, `ShimuraVarieties:V1/right-translation`, `mathlib:MulAction.toPermHom`.

**Sources.**

- [J. S. Milne, Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §5, 'Passage to the limit', Theorem 5.28 and Remark 5.29, pp. 64–65. Remark 5.29: the inverse system, the right action T(gh) = T(h) ∘ T(g), and S_K = S_{K'}/(K/K') for K' normal in K.
- [J. S. Milne, Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §5, the paragraph before Definition 5.14, p. 58. The right-action convention.

### The infinite-level Shimura diamond S^◇_{K^p,∞}

Target `PerfectoidShimuraVarieties:S0/infinite-level-diamond` (construction).

In the situation of p-level-tower, put S^◇_{K^p,∞} := lim_{K_p} (S_{K^pK_p})^◇ and S^{*◇}_{K^p,∞} := lim_{K_p} (S*_{K^pK_p})^◇, limits of v-sheaves on Perf over Spd(C, O_C) of the diamonds of DiamondsAndVStacks:D6/gluing-and-the-diamond-functor. No perfectoidness is assumed. Then: (i) S^{*◇}_{K^p,∞} is a spatial diamond, the projections to S*_{K^pK_p}^◇ are qcqs, and |S^{*◇}_{K^p,∞}| → lim_{K_p} |S*_{K^pK_p}| is a homeomorphism; (ii) S^◇_{K^p,∞} is the open subdiamond of S^{*◇}_{K^p,∞} over the complement of the boundary, a locally spatial diamond with |S^◇_{K^p,∞}| ≅ lim_{K_p} |S_{K^pK_p}|; (iii) for a perfectoid (R, R⁺) over (C, O_C), S^◇_{K^p,∞}(R, R⁺) = lim_{K_p} S_{K^pK_p}(R, R⁺); (iv) the action of G(ℚ_p) of tower-right-action induces an action on S^◇_{K^p,∞} and S^{*◇}_{K^p,∞}, continuous for the profinite subgroups (it is an action of the locally profinite group G(ℚ_p) on the v-sheaf through the sheaf of continuous maps to G(ℚ_p)); (v) for K^pK_p neat, S^◇_{K^p,∞} → S^◇_{K^pK_p} is a pro-étale map, the limit of the finite étale maps S_{K^pK'_p} → S_{K^pK_p}. A cofinal level family gives the same limit.

**Hypotheses and conventions.**

- The limit is taken in v-sheaves over Spd(C, O_C); the cofiltered index category is CO_p or any family with a cofinality witness.
- Compactness: S*_{K^pK_p} is the analytification of a projective variety, hence qcqs, which gives spatiality in (i); the open tower is only locally spatial.

**Proof route.**

1. Each S*_{K^pK_p}^◇ is a spatial diamond and each S_{K^pK_p}^◇ locally spatial, with |Y^◇| = |Y| (DiamondsAndVStacks:D6/etale-site-comparison; the analytification of a projective variety is qcqs).
2. Transition maps are finite, hence qcqs; apply DiamondsAndVStacks:D5/limits-and-finite-stage-comparisons (ECD Lemma 11.22) for (i), and for (ii) to the open subdiamonds, or note that the preimage of an open is an open subdiamond (DiamondsAndVStacks:D4/underlying-topological-space).
3. (iii) is the definition of a limit of sheaves evaluated on Spd(R, R⁺) = Spa(R♭, R♭⁺) with its untilt, using the diamond functor's description on perfectoid spaces.
4. (iv) the T_g are compatible with the transition maps, so they induce maps of limits; the profinite group K_p acts through its finite quotients K_p/K'_p on each stage, hence continuously.
5. (v) for neat K^pK_p the maps S_{K^pK'_p} → S_{K^pK_p} are finite étale, and a cofiltered limit of finite étale maps is pro-étale.

**Planning API.**

- `ShimuraTower.infiniteLevel` (data): S^◇_{K^p,∞} = lim_{K_p} S^◇_{K^pK_p} as a v-sheaf over Spd C.
- `ShimuraTower.infiniteLevelMin` (data): S^{*◇}_{K^p,∞} = lim_{K_p} S*^◇_{K^pK_p}.
- `ShimuraTower.infiniteLevel.proj` (projection): The qcqs projections to each finite level.
- `ShimuraTower.infiniteLevelMin_isSpatial` (characterisation): S^{*◇}_{K^p,∞} is a spatial diamond.
- `ShimuraTower.infiniteLevel_isLocallySpatial` (characterisation): S^◇_{K^p,∞} is a locally spatial diamond, open in S^{*◇}_{K^p,∞}.
- `ShimuraTower.infiniteLevel_space_homeo` (characterisation): |S^{*◇}_{K^p,∞}| ≅ lim |S*_{K^pK_p}| and |S^◇_{K^p,∞}| ≅ lim |S_{K^pK_p}|.
- `ShimuraTower.infiniteLevel_points` (simp): S^◇_{K^p,∞}(R, R⁺) = lim S_{K^pK_p}(R, R⁺) for perfectoid (R, R⁺) over (C, O_C).
- `ShimuraTower.infiniteLevel_action` (instance): The induced action of G(ℚ_p), continuous on profinite subgroups.
- `ShimuraTower.infiniteLevel_proEtale` (characterisation): At neat level the projection to S^◇_{K^pK_p} is pro-étale.
- `ShimuraTower.infiniteLevel_reindex` (functoriality): Restriction to a cofinal level family gives a canonically isomorphic limit.

**Unit tests.**

- `infiniteLevel_torus` (computation): For D = (G_m, {Nm}) (X a point) and K^p = Ẑ^{p×}: |S^◇_{K^p,∞}| is the profinite set lim_{K_p} ℚ^×\𝔸_f^×/K^pK_p = ℤ_p^×/{±1}, and ℚ_p^× acts through ℚ_p^×/±p^ℤ by multiplication (the kernel ±p^ℤ is Z_{K^p} of tower-action-kernel).
- `infiniteLevel_not_perfectoid_definition` (non-example): The definition does not make S^◇_{K^p,∞} a perfectoid space: for a single level (the constant tower S_{K^pK_p} with identity maps, i.e. a non-cofinal family) the limit is the diamond of a rigid space of positive dimension, which is not representable by a perfectoid space.
- `infiniteLevel_space_gl2` (compatibility): For GL_2 (the Siegel datum with g = 1) and K^p ⊆ K(N)^p, N ≥ 3: |S^{*◇}_{K^p,∞}| ≅ |𝒳*_{Γ(p^∞)} ×_{Spa ℚ_p} Spa C|, where 𝒳*_{Γ(p^∞)} is Scholze's perfectoid modular curve over ℚ_p^cycl (Theorem 3.1.2 with g = 1); after fixing an embedding ℚ_p^cycl → C this is ℤ_p^× × |𝒳*_{Γ(p^∞)} ⊗̂_{ℚ_p^cycl} C|, so |𝒳*_{Γ(p^∞)} ⊗̂_{ℚ_p^cycl} C| alone is not homeomorphic to |S^{*◇}_{K^p,∞}| (their π₀ differ by the factor ℤ_p^×).
- `infiniteLevel_singleton_index` (degenerate): If the index family has a least element K_p^0 (a non-cofinal family), the limit is S^◇_{K^pK_p^0} itself.

**Acceptance instances.**

- For the Siegel datum, once Scholze's perfectoid space 𝒳*_{Γ(p^∞)} over ℚ_p^cycl (fixed similitude root, torsion paper p. 983 and footnote 10) is constructed (S1): S^{*◇}_{K^p,∞} ≅ (𝒳*_{Γ(p^∞)} ×_{Spa ℚ_p} Spa C)^◇ = (𝒳*_{Γ(p^∞)} ×_{Spa ℚ_p^cycl} Spa C⁰(ℤ_p^×, C))^◇, by PerfectoidSpaces:P7/represented-functor-comparison; 𝒳*_{Γ(p^∞)} ⊗̂_{ℚ_p^cycl} C alone is the closed, generally non-open fibre on which the Weil-pairing roots are the fixed compatible system (the comparison PerfectoidShimuraVarieties:S1/siegel-similitude-comparison), and differs from S^{*◇}_{K^p,∞} by a factor ℤ_p^× on π₀.
- For a torus datum (T, {h}), S^◇_{K^p,∞} is the profinite set lim_{K_p} T(ℚ)\T(𝔸_f)/K^pK_p = T(𝔸_f)/cl(T(ℚ)K^p), regarded as a diamond over Spd C (DiamondsAndVStacks:D4/compact-hausdorff-diamonds).

**Direct prerequisites.** `PerfectoidShimuraVarieties:S0/p-level-tower`, `PerfectoidShimuraVarieties:S0/tower-right-action`, `DiamondsAndVStacks:D6/gluing-and-the-diamond-functor`, `DiamondsAndVStacks:D6/etale-site-comparison`, `DiamondsAndVStacks:D5/limits-and-finite-stage-comparisons`, `DiamondsAndVStacks:D5/spatial-diamond`, `DiamondsAndVStacks:D4/underlying-topological-space`, `PerfectoidSpaces:P7/tilde-limit-cofinal-change`, `mathlib:CategoryTheory.Limits.limit`.

**Sources.**

- [Peter Scholze, Étale cohomology of diamonds](https://arxiv.org/abs/1709.07343v4), §11, Lemma 11.22, p. 63. Limits of (locally) spatial diamonds along qcqs maps are (locally) spatial with |Y| = lim |Y_i|.
- [David Hansen, Christian Johansson, Perfectoid Shimura varieties and the Calegari–Emerton conjectures](https://arxiv.org/abs/2011.03951v2), §1.3, Theorem 1.5, p. 4. The representability theorem is stated as an isomorphism with this diamond limit.

### Perfectoid representatives of a tower

Target `PerfectoidShimuraVarieties:S0/perfectoid-representative` (definition).

Let (Y_i)_{i∈I} be a cofiltered system of analytic adic spaces over Spa(C, O_C) with qcqs transition maps (for instance a p-level tower S_{K^pK_p} or S*_{K^pK_p}, or a subsystem of opens). A perfectoid representative of (Y_i) is a perfectoid space Y over Spa(C, O_C) with a compatible family of maps φ_i: Y → Y_i such that Y ~ lim_i Y_i in the sense of PerfectoidSpaces:P7/perfectoid-tilde-limit (Scholze–Weinstein Definition 2.4.1). For finite transition maps and the finite-level affinoid basis of PerfectoidSpaces:P8/finite-level-affinoid-basis, equivalently (PerfectoidSpaces:P7/represented-functor-comparison) the induced map Y^◇ → lim_i Y_i^◇ is an isomorphism of v-sheaves and Y is covered by good affinoid perfectoids (PerfectoidSpaces:P7/good-affinoid-perfectoid). A perfectoid representative is unique up to unique isomorphism compatible with the φ_i, represents lim_i Hom(−, Y_i) on perfectoid spaces, and is functorial in morphisms of systems (PerfectoidSpaces:P7/tilde-limit-perfectoid-uniqueness). The tower is perfectoid if it has a perfectoid representative; this is a property of the diamond lim_i Y_i^◇ together with the existence of good affinoid perfectoid charts.

**Hypotheses and conventions.**

- The definition records both conditions: the diamond isomorphism alone (the form of Hansen–Johansson Theorem 1.5) and the tilde-limit with finite-level charts (Scholze's form). PerfectoidSpaces:P7/represented-functor-comparison (iii) supplies the passage from the first to the second under the finite-level affinoid basis of PerfectoidSpaces:P8/finite-level-affinoid-basis.
- Over a non-perfectoid base (for instance ℚ_p or E_v) one first base changes to C; descent is a separate statement.

**Proof route.**

1. Definition; uniqueness, representability and functoriality are PerfectoidSpaces:P7/tilde-limit-perfectoid-uniqueness.
2. The equivalence with the diamond formulation is PerfectoidSpaces:P7/represented-functor-comparison (i) and (iii), with the basis of finite-level affinoid perfectoids of PerfectoidSpaces:P8/finite-level-affinoid-basis for finite transition maps.

**Planning API.**

- `ShimuraTower.PerfectoidRepresentative` (data): A perfectoid space Y over Spa(C, O_C) with a cone φ to the system and Y ~ lim Y_i.
- `ShimuraTower.PerfectoidRepresentative.diamondIso` (projection): The isomorphism Y^◇ ≅ lim_i Y_i^◇.
- `ShimuraTower.PerfectoidRepresentative.unique` (extensionality): Two representatives are uniquely isomorphic compatibly with the cones.
- `ShimuraTower.PerfectoidRepresentative.lift` (universal-property): A compatible family of maps from a perfectoid space Z to the Y_i factors uniquely through Y.
- `ShimuraTower.PerfectoidRepresentative.map` (functoriality): A morphism of systems induces a unique morphism of representatives, with map_id and map_comp.
- `ShimuraTower.PerfectoidRepresentative.ofDiamondIso` (constructor): From a perfectoid space with compatible maps and a diamond isomorphism to the limit, when the transition maps are finite (via finite-level affinoid charts).
- `ShimuraTower.IsPerfectoidTower` (other): The property that a perfectoid representative exists; invariant under cofinal reindexing.

**Unit tests.**

- `representative_frobenius_P1` (computation): The tower ℙ¹_C ← ℙ¹_C ← ⋯ with T ↦ T^p has the perfectoid projective line as representative.
- `representative_constant_tower` (non-example): The constant tower Y_i = ℙ¹_C (identity maps) has no perfectoid representative, although its diamond limit (ℙ¹_C)^◇ is a spatial diamond: being a diamond is not perfectoidness.
- `representative_compatible_tilde` (compatibility): If Y is a representative, then Y^◇ → lim Y_i^◇ is an isomorphism (PerfectoidSpaces:P7/represented-functor-comparison (i)).
- `representative_perfectoid_constant` (degenerate): A constant tower with a perfectoid space Y_0 (identity transition maps) has Y_0 as its representative.

**Acceptance instances.**

- 𝒳*_{Γ(p^∞)} ×_{Spa ℚ_p} Spa C, Scholze's perfectoid space over ℚ_p^cycl base changed along ℚ_p → C (a profinite family indexed by ℤ_p^× of 𝒳*_{Γ(p^∞)} ⊗̂_{ℚ_p^cycl} C after fixing ℚ_p^cycl → C), is a perfectoid representative of the Siegel tower (S*_{K^pΓ(pᵐ)})_m (S1); 𝒳*_{Γ(p^∞)} ⊗̂_{ℚ_p^cycl} C alone represents the limit of the finite-level clopen parts with similitude root ζ_{pᵐ}; this infinite fixed-pairing fibre is closed and generally not open (PerfectoidShimuraVarieties:S1/siegel-similitude-comparison).
- A constant system with a non-perfectoid rigid space has no perfectoid representative.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S0/infinite-level-diamond`, `PerfectoidSpaces:P7/perfectoid-tilde-limit`, `PerfectoidSpaces:P7/tilde-limit-perfectoid-uniqueness`, `PerfectoidSpaces:P7/represented-functor-comparison`, `PerfectoidSpaces:P7/good-affinoid-perfectoid`, `PerfectoidSpaces:P8/finite-level-affinoid-basis`.

**Sources.**

- [Peter Scholze, Jared Weinstein, Moduli of p-divisible groups](https://arxiv.org/abs/1211.6357v2), §2.4, Definition 2.4.1 and Proposition 2.4.5, pp. 19–21. Uniqueness and the universal property of a perfectoid tilde-limit.

### Effective deck groups: the kernel of the action on the tower

Target `PerfectoidShimuraVarieties:S0/tower-action-kernel` (theorem).

In the situation of p-level-tower and tower-right-action, let Z be the centre of G and put Z(ℚ)_{K^p} := {z ∈ Z(ℚ) : z^p ∈ K^p}, where z^p ∈ Z(𝔸_f^p) is the prime-to-p component, and Z_{K^p} := the closure in G(ℚ_p) of the image of Z(ℚ)_{K^p} under z ↦ z_p. Then: (i) the kernel of the right action of G(ℚ_p) on lim_{K_p} S_{K^pK_p}(C), equivalently on |S^◇_{K^p,∞}| and on S^◇_{K^p,∞}, is Z_{K^p} = G(ℚ_p) ∩ cl(Z(ℚ)K^p), the closure taken in G(𝔸_f); (ii) for K'_p ⊆ K_p normal, the kernel of the action of K_p/K'_p on S_{K^pK'_p} is the image of (Z(ℚ) ∩ K^pK_p)_p in K_p/K'_p, and S_{K^pK_p} = S_{K^pK'_p}/(K_p/K'_p); if K^pK_p is neat, S_{K^pK'_p} → S_{K^pK_p} is a finite étale Galois cover with group K_p/(K'_p · (Z(ℚ) ∩ K^pK_p)_p); (iii) for K^pK_p neat, S^◇_{K^p,∞} → S^◇_{K^pK_p} is a pro-étale torsor under the profinite group K_p/Z_{K^pK_p}, where Z_{K^pK_p} = Z_{K^p} ∩ K_p is the closure of (Z(ℚ) ∩ K^pK_p)_p. In particular the tower is a K_p-torsor exactly when Z(ℚ) ∩ K^pK_p = {1}, which holds for GL_2 and GSp_2g at level K^p ⊆ K(N)^p with N ≥ 3, and fails for Hilbert data, where Z(ℚ) ∩ K^pK_p contains a finite-index subgroup of the units ≡ 1 mod N of a totally real field F ≠ ℚ and Z_{K^pK_p} is a nontrivial closed subgroup of 𝒪_{F,p}^×.

**Hypotheses and conventions.**

- D pure Shimura datum with the tower of p-level-tower; G(ℚ_p) embedded in G(𝔸_f) with trivial prime-to-p component.
- Neatness of K^pK_p is used only for freeness (finite étaleness and torsor statements), not for the kernel computation.
- Equality with the kernel on C-points is justified at each finite level: the translations are analytifications of algebraic maps over the canonical-model field, and equality of those maps can be checked after faithful base change to ℂ and on its closed points. Passing through the reduced finite levels gives equality on the tower. No assertion that arbitrary qcqs diamond maps are determined by one fixed field of points is used.

**Proof route.**

1. Containment: for z ∈ Z(ℚ)_{K^p}, [x, a z_p] = [z x, z a (z^p)⁻¹] = [x, a] in every S_{K^pK_p}(C), since z is central, acts trivially on X, and z^p ∈ K^p. By continuity of the action of the profinite K_p on each finite level, the closure acts trivially.
2. Reverse containment: if g ∈ G(ℚ_p) acts trivially, then for each K_p and each x ∈ X there is q ∈ G(ℚ) with q x = x and g ∈ q·K^pK_p (taking a = 1). The set of such q is countable, so by the Baire category theorem one q fixes a nonempty open subset of the real-analytic manifold X, hence all of X; then q centralises h(𝕊) for every h ∈ X. Let q̄ be the image of q in G^ad(ℚ) and write G^ad_ℝ = G_nc × G_c with G_c the product of the compact factors. By SV1–SV2 the projection of each h to a compact factor is trivial and to each ℝ-simple noncompact factor H is nontrivial, so the H(ℝ)-conjugates of the projections of h(𝕊) generate a Zariski-dense normal subgroup of the adjoint group H; q̄ centralises it, so the projection of q̄ to G_nc(ℝ) is trivial. (The images of the h do not generate G^der when G^ad_ℝ has compact factors, as for Shimura curves, so q̄ = 1 cannot be read off directly.) Each ℚ-simple factor H′ of G^ad is Res_{F/ℚ}H″ with H″ absolutely simple, and by SV3 some place v of F has H″(F_v) noncompact, i.e. a factor of G_nc. The projection of q̄ to H′(ℚ) = H″(F) maps trivially to H″(F_v), and H″(F) → H″(F_v) is injective, so q̄ = 1 and q ∈ Z(ℚ). Thus g ∈ ⋂_{K_p} Z(ℚ)K^pK_p = G(ℚ_p) ∩ cl(Z(ℚ)K^p) (closure in G(𝔸_f), because K^p is fixed and open in G(𝔸_f^p)).
3. Identify G(ℚ_p) ∩ cl(Z(ℚ)K^p) with Z_{K^p}: a sequence z_n k_n with prime-to-p part converging to 1 eventually has z_n^p ∈ K^p because K^p is open, and its p-part z_{n,p} converges in G(ℚ_p).
4. (ii) is the finite-level form of the same computation (Milne, Remark 5.29(c), with the kernel made explicit), and the Galois/torsor statement uses freeness of the action at neat level (ShimuraVarieties:V8/finite-level-maps, ShimuraVarieties:V0/effective-proper-action). (iii) passes to the limit using infinite-level-diamond (v).

**Acceptance instances.**

- GSp_2g with K^p = K(N)^p, N ≥ 3 (equality is needed: for p = 7 and K^p = K(9)^p ⊆ K(3)^p, 7 ≡ 1 mod 3 but 7 ∉ Z(ℚ)_{K^p}): Z(ℚ)_{K^p} = {±pᵏ : ±pᵏ ≡ 1 mod N}, so Z_{K^p} is the infinite cyclic group generated by εp^f, where f is the order of p in (ℤ/N)^×/{±1} and ε = ±1 with εp^f ≡ 1 mod N; it is discrete and meets GSp_2g(ℤ_p) trivially, so the Siegel tower over GSp_2g(ℤ_p)-level is a GSp_2g(ℤ_p)-torsor while the central element εp^f acts trivially on the whole tower.
- Hilbert modular datum G = Res_{F/ℚ} GL_2 with K = K(N): Z(ℚ) ∩ K = 𝒪_F^× ∩ (1 + N𝒪_F), an infinite group when [F : ℚ] > 1; its closure in 𝒪_{F,p}^× is the nontrivial kernel, the source of the separate polarization statements in S5.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S0/tower-right-action`, `PerfectoidShimuraVarieties:S0/infinite-level-diamond`, `ShimuraVarieties:V8/finite-level-maps`, `ShimuraVarieties:V0/effective-proper-action`, `DiamondsAndVStacks:D4/isomorphism-criteria-for-v-sheaves-and-stacks`, `mathlib:Subgroup.topologicalClosure`, `mathlib:MonoidHom.ker`, `mathlib:IsDedekindDomain.FiniteAdeleRing`.

**Sources.**

- [J. S. Milne, Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §5, 'Passage to the limit', the paragraph before Theorem 5.28 and Theorem 5.28, p. 65. The closure of the rational centre is what the limit of the tower sees; the p-level kernel is computed from it.
- [J. S. Milne, Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §5, 'Passage to the limit', Theorem 5.28 and Remark 5.29, pp. 64–65. Remark 5.29: the inverse system, the right action T(gh) = T(h) ∘ T(g), and S_K = S_{K'}/(K/K') for K' normal in K.

### Connected components of the infinite-level tower

Target `PerfectoidShimuraVarieties:S0/component-set-of-infinite-level` (theorem).

In the situation of infinite-level-diamond, assume G^der simply connected and put T = G/G^der, ν: G → T, T(ℚ)^† = ν(G(ℚ)_+). Then π₀(S^{*◇}_{K^p,∞}) = π₀(S^◇_{K^p,∞}) = lim_{K_p} π₀(S_{K^pK_p}) = lim_{K_p} T(ℚ)^†\T(𝔸_f)/ν(K^pK_p), a profinite set (finite at each level). The right action of G(ℚ_p) on π₀ is through ν: G(ℚ_p) → T(ℚ_p) acting by translation; every compact open K_p acts with finitely many orbits, and the stabiliser of the neutral component (the image of X⁺ × {1}) is K_p ∩ ν⁻¹(cl(T(ℚ)^† ν(K^p)) ∩ T(ℚ_p)). The minimal compactification does not change components: π₀ S_{K^pK_p} → π₀ S*_{K^pK_p} is a bijection because S*_{K^pK_p} is normal and S_{K^pK_p} is dense in it.

**Hypotheses and conventions.**

- G^der simply connected is needed for the abelianised formula (ShimuraVarieties:V0/simply-connected-components). Without it the formula fails in both directions: for G = PGL_2 (T = 1) the formula's set is a point, while π₀ at level K(5) is ℚ_{>0}\𝔸_f^×/((𝔸_f^×)² det K(5)) = (ℤ/5)^×/((ℤ/5)^×)², of order 2. In general π₀(S_{K^pK_p}) = G(ℚ)_+\G(𝔸_f)/K^pK_p, a finite set (ShimuraVarieties:V0/component-decomposition), so π₀ of the infinite-level tower is lim_{K_p} G(ℚ)_+\G(𝔸_f)/K^pK_p and the finiteness of K_p-orbits still holds.
- π₀ of a spatial diamond is the profinite set of connected components of its spectral space (ECD §11).

**Proof route.**

1. Finite level: π₀(S_{K^pK_p}(ℂ)) ≅ T(ℚ)^†\T(𝔸_f)/ν(K^pK_p) by ShimuraVarieties:V0/simply-connected-components, and analytification does not change π₀ (connected components of a normal variety and of its analytification agree).
2. Normality of S*_{K^pK_p} and density of the open part give the bijection on π₀ (Hansen–Johansson §5.3 conventions).
3. Limits: |S^{*◇}_{K^p,∞}| = lim |S*_{K^pK_p}| is a cofiltered limit of spectral spaces along spectral maps, so π₀ commutes with the limit (a cofiltered limit of nonempty compact Hausdorff spaces is nonempty, applied to fibres).
4. The action on π₀ at finite level is translation by ν(g) (ShimuraVarieties:V8/component-reciprocity); finiteness of each level gives finitely many K_p-orbits.

**Acceptance instances.**

- GL_2, K^p = K(N)^p with N ≥ 3 prime to p: π₀ at level K^pK(pᵐ) is ℚ_{>0}\𝔸_f^×/det(K^pK(pᵐ)) = (ℤ/Npᵐ)^×, so π₀ of the infinite-level tower is lim_m (ℤ/Npᵐ)^× = ℤ_p^× × (ℤ/N)^×, with K_p = GL_2(ℤ_p) acting through det by multiplication on the first factor: one orbit per class in (ℤ/N)^×.
- Siegel: the same with ν the similitude factor; the Weil pairing identifies π₀ at level Γ(pᵐ)K^p with primitive Npᵐ-th roots of unity.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S0/infinite-level-diamond`, `PerfectoidShimuraVarieties:S0/tower-right-action`, `ShimuraVarieties:V0/simply-connected-components`, `ShimuraVarieties:V0/component-decomposition`, `ShimuraVarieties:V8/component-reciprocity`, `DiamondsAndVStacks:D5/limits-and-finite-stage-comparisons`.

**Sources.**

- [J. S. Milne, Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §5, Theorem 5.17, p. 59. π₀ at finite level and the neutral component.
- [David Hansen, Christian Johansson, Perfectoid Shimura varieties and the Calegari–Emerton conjectures](https://arxiv.org/abs/2011.03951v2), §5.3, conventions, p. 35. Components of the minimal compactification.

### The neutral-component tower and its symmetry group

Target `PerfectoidShimuraVarieties:S0/connected-component-tower` (construction).

In the situation of p-level-tower, fix a connected component X⁺ of X and for K_p ∈ CO_p let Γ(K^pK_p) := G(ℚ)_+ ∩ K^pK_p (G(ℚ)_+ the stabiliser of X⁺). The neutral-component tower is K_p ↦ S⁰_{K^pK_p} := (Γ(K^pK_p)\X⁺)^{an} over C, the connected component of S_{K^pK_p} containing the image of X⁺ × {1} (ShimuraVarieties:V0/component-decomposition), with S*⁰_{K^pK_p} its Zariski closure in S*_{K^pK_p} (normal, connected), and S^{0◇}_{K^p,∞} := lim_{K_p} S⁰^◇_{K^pK_p}, S^{*0◇}_{K^p,∞} likewise. Its symmetry group is the closure Γ̄_{K^p} of Γ_{K^p} := G(ℚ)_+ ∩ K^pG(ℚ_p) in G(ℚ_p), acting through T_g on the tower; for K'_p ⊆ K_p normal, the deck group of S⁰_{K^pK'_p} → S⁰_{K^pK_p} is the image of Γ(K^pK_p) in K_p/K'_p, i.e. (Γ̄_{K^p} ∩ K_p)/(Γ̄_{K^p} ∩ K'_p) modulo the kernel of tower-action-kernel, a subgroup of K_p/K'_p that is in general proper. The full tower is recovered from neutral towers at conjugate tame levels: for each of the finitely many K_p-orbits O on π₀(S^◇_{K^p,∞}) choose a_O = (a_O^p, a_{O,p}) ∈ G(𝔸_f) such that the component C_O through the image of X⁺ × {a_O} lies in O, and let Stab_O ⊆ K_p be its stabiliser. Then T_{a_{O,p}} ∘ T_{a_O^p} (a prime-to-p Hecke translation followed by a p-adic translation) is an isomorphism S^{0◇}_{a_O^pK^p(a_O^p)⁻¹,∞} ≅ C_O, transporting the Stab_O-action to the action of a_{O,p}Stab_Oa_{O,p}⁻¹ on the neutral tower at tame level a_O^pK^p(a_O^p)⁻¹, and S^◇_{K^p,∞} ≅ ∐_O (S^{0◇}_{a_O^pK^p(a_O^p)⁻¹,∞} ×^{Stab_O} K_p), compatibly with the K_p-action (Hansen–Johansson, proof of Proposition 5.16: each component is isomorphic to a neutral component at a conjugate tame level, not in general to the one at K^p). When G^der is simply connected and K^pK_p is small, the neutral component at each level is the fibre over the class of 1 of the component map of ShimuraVarieties:V8/component-reciprocity (Milne, Theorem 5.17); for GL_2 it is the fixed-Weil-pairing curve of ShimuraVarieties:V8/gl2-fixed-pairing-fibre, and a compatible system ζ of primitive Npᵐ-th roots of unity singles out a connected component of the infinite-level tower. For a connected Shimura datum (G, X⁺), an arithmetic subgroup Γ ⊆ G(ℚ)_+ and K_p ⊆ G(ℚ_p) compact open, put Γ ∩ K_p := Γ ∩ (G(𝔸_f^p)K_p) = {γ ∈ Γ : γ ∈ K_p in G(ℚ_p)}, an arithmetic subgroup of finite index in Γ; the connected tower is K_p ↦ X*_{Γ∩K_p}(G, X⁺), the analytified minimal compactification over C of (Γ ∩ K_p)\X⁺, and X*_{Γ,∞}(G, X⁺) := lim_{K_p} X*_{Γ∩K_p}(G, X⁺)^◇. This is the reading of S4/property-p: Hansen–Johansson's Definition 5.17 takes Γ ⊆ G^ad(ℚ)^+ but intersects with K_p ⊆ G(ℚ_p), which is consistent only for G = G^ad, where the two readings coincide; the proof of their Proposition 5.18 uses Γ ⊆ G(ℚ)_+ (PerfectoidShimuraVarieties/E16).

**Hypotheses and conventions.**

- Γ(K^pK_p) arithmetic; neatness for freeness of finite levels.
- The symmetry group of the neutral tower is Γ̄_{K^p}, not G(ℚ_p): elements of G(ℚ_p) outside the stabiliser of the neutral component move it to another component.

**Proof route.**

1. Finite level: ShimuraVarieties:V0/component-decomposition identifies the component over [1] with Γ(K^pK_p)\X⁺; its algebraic structure and closure in S* come from the canonical model and its minimal compactification (normal, so the closure of a component is a component).
2. The level maps restrict to the neutral components because they fix the class of 1; the deck group computation is that of tower-action-kernel restricted to γ ∈ Γ(K^pK_p) (γ acts on Γ(K^pK'_p)\X⁺ by x ↦ γ⁻¹x, matching T_γ under [x, 1] ↦ [x, γ]).
3. Induction: component-set-of-infinite-level (and ShimuraVarieties:V0/component-decomposition when G^der is not simply connected) gives finitely many K_p-orbits on π₀, each open and closed. For a = (a^p, a_p), the prime-to-p translation T_{a^p} (tower-right-action) maps the neutral component [x, 1] of the tower at tame level a^pK^p(a^p)⁻¹ to the component [x, a^p] of the tower at tame level K^p, and T_{a_p} then moves it to [x, a]; since T_k ∘ T_{a_p} = T_{a_pk} = T_{a_p} ∘ T_{a_pka_p⁻¹} by the right-action law T_{gh} = T_h ∘ T_g, and prime-to-p translations commute with the T_g, the stabiliser transports as stated. The part of S^◇_{K^p,∞} over an orbit O is then C_O ×^{Stab_O} K_p.

**Planning API.**

- `ShimuraTower.neutralComponent` (data): The tower K_p ↦ S⁰_{K^pK_p} with its closures S*⁰_{K^pK_p}.
- `ShimuraTower.neutralComponent.toFull` (projection): The open and closed immersion of towers S⁰ → S.
- `ShimuraTower.neutralSymmetry` (data): The closed subgroup Γ̄_{K^p} ⊆ G(ℚ_p) acting on the neutral tower.
- `ShimuraTower.neutralDeckGroup` (characterisation): The deck group of S⁰_{K^pK'_p} → S⁰_{K^pK_p} is the image of Γ(K^pK_p) in K_p/K'_p modulo the kernel of tower-action-kernel.
- `ShimuraTower.fullOfNeutral` (equivalence): S^◇_{K^p,∞} ≅ ∐_O (S^{0◇}_{a_O^pK^p(a_O^p)⁻¹,∞} ×^{Stab_O} K_p) over the finitely many K_p-orbits O on π₀, with the neutral tower at the conjugate tame level a_O^pK^p(a_O^p)⁻¹ for each orbit.
- `ShimuraTower.connectedDatumTower` (constructor): For a connected datum (G, X⁺) and arithmetic Γ ⊆ G(ℚ)_+, the tower K_p ↦ X*_{Γ∩K_p}(G, X⁺) over compact open K_p ⊆ G(ℚ_p), with Γ ∩ K_p = Γ ∩ (G(𝔸_f^p)K_p).
- `ShimuraTower.neutralComponent_isConnected` (characterisation): Each S*⁰_{K^pK_p} is connected and normal, and S⁰_{K^pK_p} is dense in it.

**Unit tests.**

- `neutral_deck_gl2` (computation): For GL_2, K^p = K(N)^p, N ≥ 3, m ≥ 1: the deck group of S⁰_{K^pK(pᵐ⁺¹)} → S⁰_{K^pK(pᵐ)} is the kernel of SL_2(ℤ/pᵐ⁺¹) → SL_2(ℤ/pᵐ), of order p³, while that of the full tower is of order p⁴.
- `neutral_full_comparison_count` (compatibility): π₀(S_{K^pK_p}) = π₀(S^◇_{K^p,∞})/K_p, so fullOfNeutral has exactly one induced piece per connected component of S_{K^pK_p}. For GL_2, K^p = K(N)^p (N ≥ 3) and K_p = K(pᵐ), m ≥ 1: the K(pᵐ)-orbits on π₀(S^◇_{K^p,∞}) = (ℤ/N)^× × ℤ_p^× are the cosets of det K(pᵐ) = 1 + pᵐℤ_p in the second factor; there are φ(Npᵐ) of them, matching the φ(Npᵐ) components of S_{K^pK(pᵐ)}, and each stabiliser is K(pᵐ) ∩ SL_2(ℤ_p).
- `neutral_tower_torus` (degenerate): For a torus datum (T, {h}): X⁺ = X is a point and G(ℚ)_+ = T(ℚ), so every S⁰_{K^pK_p} is one point and S^{0◇}_{K^p,∞} = Spd C. The group Γ(K^pK_p) = T(ℚ) ∩ K^pK_p need not be finite (for T = Res_{F/ℚ}G_m with F real quadratic it contains a finite-index subgroup of 𝒪_F^×), and its image in K_p/K'_p can be nontrivial; but it lies in the kernel of tower-action-kernel (Z = T), so neutralDeckGroup is trivial.
- `neutral_symmetry_not_Gp` (non-example): For GL_2, the element diag(1, u) with u ∈ ℤ_p^× not in the closure of ℚ_{>0} p^ℤ-type determinants does not preserve the neutral component of the infinite-level tower: the neutral tower is not stable under all of K_p.

**Acceptance instances.**

- GL_2, K^p = K(N)^p with N ≥ 3 prime to p: Γ_{K^p} = {γ ∈ GL_2(ℤ[1/p]) : det γ ∈ p^ℤ, γ ≡ 1 mod N}, Γ(K^pK(pᵐ)) = Γ(Npᵐ), so the neutral tower at levels K(pᵐ) is the tower of curves Γ(Npᵐ)\ℍ, and the deck group of Γ(Npᵐ)\ℍ → Γ(N)\ℍ is the image of Γ(N) in GL_2(ℤ/pᵐ), which is SL_2(ℤ/pᵐ) by strong approximation for SL_2 (−1 ∉ Γ(N) since N ≥ 3), not GL_2(ℤ/pᵐ).
- For a Hilbert datum the deck groups on neutral components are the images of the totally positive-determinant subgroups; their quotient by the closure of units is the finite torsor statement of S5.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S0/p-level-tower`, `PerfectoidShimuraVarieties:S0/tower-right-action`, `PerfectoidShimuraVarieties:S0/infinite-level-diamond`, `PerfectoidShimuraVarieties:S0/tower-action-kernel`, `PerfectoidShimuraVarieties:S0/component-set-of-infinite-level`, `ShimuraVarieties:V0/component-decomposition`, `ShimuraVarieties:V6/connected-tower`, `ShimuraVarieties:V8/component-reciprocity`, `ShimuraVarieties:V8/gl2-fixed-pairing-fibre`, `mathlib:MulAction.stabilizer`, `mathlib:Subgroup.topologicalClosure`.

**Sources.**

- [J. S. Milne, Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §5, Lemma 5.13, p. 57. Decomposition of Sh_K into the quotients Γ_g\X⁺.
- [David Hansen, Christian Johansson, Perfectoid Shimura varieties and the Calegari–Emerton conjectures](https://arxiv.org/abs/2011.03951v2), §5.3, Proposition 5.16 and the sentence after it, p. 36. Property P is formulated for the full and the neutral component towers.
- [David Hansen, Christian Johansson, Perfectoid Shimura varieties and the Calegari–Emerton conjectures](https://arxiv.org/abs/2011.03951v2), §5.3, proof of Proposition 5.16, (2) implies (1), p. 36. Finitely many K_p-orbits on π₀; the same paragraph identifies each component with a neutral component tower at a conjugate tame level gK^pg⁻¹, g ∈ G(𝔸_f^p).
- [David Hansen, Christian Johansson, Perfectoid Shimura varieties and the Calegari–Emerton conjectures](https://arxiv.org/abs/2011.03951v2), §5.3, the sentence after Definition 5.17, p. 36. The intersection Γ ∩ K_p of the connected towers, read with Γ ⊆ G(ℚ)_+ (PerfectoidShimuraVarieties/E16).

### Towers retaining a moduli rigidification

Target `PerfectoidShimuraVarieties:S0/rigidified-moduli-tower` (definition).

In the situation of p-level-tower, a rigidified tower over (S_{K^pK_p})_{K_p} (or over an open and closed subtower of it stable under the action below) consists of: a cofiltered system (M_{K_p})_{K_p} of separated qcqs rigid analytic spaces over C with finite transition maps, indexed by CO_p or by a cofinal level family with a cofinality witness (PerfectoidSpaces:P7/level-cofinality-witness); a pro-system of finite groups (Δ_{K_p})_{K_p}, with transition homomorphisms Δ_{K'_p} → Δ_{K_p} for K'_p ⊆ K_p, Δ_{K_p} acting on M_{K_p} so that the transition maps M_{K'_p} → M_{K_p} are equivariant along Δ_{K'_p} → Δ_{K_p}; finite Δ_{K_p}-invariant maps q_{K_p}: M_{K_p} → S_{K^pK_p} compatible with the transition maps, each inducing an isomorphism M_{K_p}/Δ_{K_p} ≅ S_{K^pK_p} (categorical quotient of a finite group action; PerfectoidSpaces:P8/rigid-finite-quotient); and a right action of a locally profinite group H on the system (M_{K_p}) normalising the Δ_{K_p} and lifting, through a continuous homomorphism H → G(ℚ_p), the action of tower-right-action. Put Δ_∞ := lim_{K_p} Δ_{K_p}, a profinite group acting on M^◇_∞ := lim_{K_p} M^◇_{K_p}. The orders of the Δ_{K_p} may grow without bound with the level; a single finite group Δ is the special case of a constant pro-system. If Δ_{K_p} acts freely on M_{K_p} for every K_p, each q_{K_p} is a finite étale Δ_{K_p}-torsor and M^◇_∞ → S^◇_{K^p,∞} is a pro-étale Δ_∞-torsor of diamonds. If the pro-system is constant (Δ_{K_p} = Δ) and (M_{K_p}) is a good tower, M^◇_∞/Δ ≅ S^◇_{K^p,∞} without any freeness, by PerfectoidSpaces:P8/quotient-of-good-tower. The effective deck groups of M and of S differ: the kernel of the H-action on M^◇_∞ is computed separately from tower-action-kernel and need not contain the preimage of Z_{K^p}.

**Hypotheses and conventions.**

- Each Δ_{K_p} is finite and the quotients are categorical quotients of rigid spaces (P8), not quotients of moduli functors; Δ_∞ is profinite and in general infinite.
- The basic example (Birkbeck–Heuer–Williams §8.2): for the Hilbert datum G = Res_{F/ℚ}GL_2 with tame level μ_N (N ≥ 4) and a polarization module 𝔠, the hybrid spaces X_{Γ(pⁿ)} (G*-polarization λ fixed, G-level structure α_n: (𝒪_F/pⁿ)² ≅ A^∨[pⁿ]) over the arithmetic spaces X_{G,Γ(pⁿ)}, with Δ_{K(pⁿ)} = Δ(pⁿN) = 𝒪_F^{×,+}/((1 + pⁿN𝒪_F)^×)² acting through the polarization action (BHW Lemma 8.16(1)); the order of Δ(pⁿN) is unbounded in n when [F : ℚ] > 1 (for F = ℚ it is 1), and Δ_∞ = Δ(p^∞N) (S5). The G*-tower X_{Γ*(pⁿ)} is not an example at full level: its map to X_{G,Γ(pⁿ)} is not surjective, and 𝒪_F^{×,+} no longer acts on it by changing the polarization (BHW p. 33).
- The finite free-quotient assertion uses the separated qcqs rigid-space hypotheses of PerfectoidSpaces:P8/free-action-quotient-is-torsor; finite transition maps give the spectral compactness needed for surjectivity of the inverse-limit torsor.

**Proof route.**

1. Definition. Torsor statement: a free action of a finite group on a separated rigid space has a finite étale quotient map which is a torsor (PerfectoidSpaces:P8/free-action-quotient-is-torsor), so M_{K_p} × Δ_{K_p} ≅ M_{K_p} ×_{S_{K^pK_p}} M_{K_p} compatibly in K_p. Cofiltered limits of v-sheaves commute with fibre products, so M^◇_∞ × Δ_∞ ≅ M^◇_∞ ×_{S^◇_{K^p,∞}} M^◇_∞, where M^◇_∞ × Δ_∞ = lim_{K_p} M^◇_{K_p} × Δ_{K_p}. The map M^◇_∞ → S^◇_{K^p,∞} is pro-étale as a cofiltered limit of finite étale maps, and surjective because |M^◇_∞| = lim |M_{K_p}| → lim |S_{K^pK_p}| is a cofiltered limit of surjective spectral maps of spectral spaces (DiamondsAndVStacks:D5/limits-and-finite-stage-comparisons).
2. Constant pro-system without freeness: PerfectoidSpaces:P8/quotient-of-good-tower gives M^◇_∞/Δ ≅ lim_{K_p} (M_{K_p}/Δ)^◇ = S^◇_{K^p,∞}.

**Planning API.**

- `ShimuraTower.Rigidified` (data): A tower (M_{K_p}) with a pro-system of finite groups (Δ_{K_p}) acting compatibly, Δ_{K_p}-invariant finite maps to the Shimura tower inducing M_{K_p}/Δ_{K_p} ≅ S_{K^pK_p}, and a lifted right action of H.
- `ShimuraTower.Rigidified.quotientIso` (projection): The isomorphisms M_{K_p}/Δ_{K_p} ≅ S_{K^pK_p}, compatible with the transition maps.
- `ShimuraTower.Rigidified.infiniteLevel` (data): M^◇_∞ = lim M^◇_{K_p} with the action of Δ_∞ = lim Δ_{K_p} and its map to S^◇_{K^p,∞}.
- `ShimuraTower.Rigidified.isTorsor_of_free` (characterisation): If Δ_{K_p} acts freely on M_{K_p} for every K_p, M^◇_∞ → S^◇_{K^p,∞} is a pro-étale Δ_∞-torsor.
- `ShimuraTower.Rigidified.quotient_infiniteLevel` (characterisation): For a constant pro-system Δ and a good tower M, M^◇_∞/Δ ≅ S^◇_{K^p,∞}.
- `ShimuraTower.Rigidified.trivial` (constructor): The tower itself with Δ_{K_p} = 1.

**Unit tests.**

- `rigidified_trivial_delta` (degenerate): With Δ_{K_p} = 1 for every K_p: M = S, Δ_∞ = 1 and the quotient isomorphisms are identities.
- `rigidified_hilbert_delta_order` (computation): For the Hilbert hybrid tower with F = ℚ(√5), N = 4 and p odd: 𝒪_F^{×,+} = ⟨ε²⟩ with ε = (1+√5)/2 of norm −1, and −1 is not a power of ε modulo 4, so 𝒪_F^× ∩ (1 + 4pⁿ𝒪_F) = ⟨ε^{k_n}⟩ with k_n the order of ε in (𝒪_F/4pⁿ)^×, and |Δ_{K(pⁿ)}| = |Δ(4pⁿ)| = [⟨ε²⟩ : ⟨ε^{2k_n}⟩] = k_n. At n = 0 (the torsor X → X_G of BHW Proposition 8.4) k_0 = 6, since ε has order 6 in (𝒪_F/4)^×, so |Δ(4)| = 6; and k_n is unbounded in n, so no single finite group serves at every level.
- `rigidified_not_shimura_kernel` (non-example): For the Hilbert hybrid tower with [F : ℚ] ≥ 2, take η ∈ (1 + N𝒪_F)^× with η ≠ 1 and g = diag(η, η) ∈ H = GL_2(𝒪_p). Then g acts trivially on every X_{G,Γ(pⁿ)} (it lies in the central subgroup Z_n of BHW Definition 8.17, which acts trivially by Proposition 8.18(3); equivalently in Z_{K^p} of tower-action-kernel). On the hybrid tower it acts as the polarization action of η⁻² (g^∨ = g and BHW Lemma 8.12), which is a nontrivial element of Δ(pⁿN) for n large (η² ∈ ((1 + pⁿN𝒪_F)^×)² would force η ≡ 1 mod pⁿN, as N ≥ 3) and acts freely. So the kernel of the H-action on M^◇_∞ does not contain the preimage of Z_{K^p}.

**Acceptance instances.**

- Hilbert: the hybrid tower (X_{𝔠,Γ(pⁿ)} ⊗ C)_{n≥0} over the open and closed subtower (X_{G,𝔠,Γ(pⁿ)} ⊗ C)_{n≥0} of the G-Shimura tower lying over [𝔠] ∈ Cl⁺(F), with Δ_{K(pⁿ)} = Δ(pⁿN) acting freely, so that at infinite level it is a pro-étale Δ(p^∞N)-torsor (S5 hilbert-polarization-torsors; BHW Proposition 8.21(3)). The lifted action is that of H = GL_2(𝒪_p) ⊆ G(ℚ_p) through x·g := g^∨·x, where g^∨ = det(g)g⁻¹ and g^∨·x is BHW's level-structure action.
- For the constant pro-system Δ_{K_p} = 1, a rigidified tower is the tower itself.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S0/p-level-tower`, `PerfectoidShimuraVarieties:S0/infinite-level-diamond`, `PerfectoidShimuraVarieties:S0/tower-action-kernel`, `PerfectoidSpaces:P8/rigid-finite-quotient`, `PerfectoidSpaces:P8/free-action-quotient-is-torsor`, `PerfectoidSpaces:P8/quotient-of-good-tower`, `PerfectoidSpaces:P8/good-tower`, `PerfectoidSpaces:P7/level-cofinality-witness`, `DiamondsAndVStacks:D5/limits-and-finite-stage-comparisons`.

**Sources.**

- [Christopher Birkbeck, Ben Heuer, Chris Williams, Overconvergent Hilbert modular forms via perfectoid modular varieties](https://arxiv.org/abs/1902.03985v4), §8, Proposition 8.4, p. 32. The unit quotient Δ(N) at tame level.
- [Christopher Birkbeck, Ben Heuer, Chris Williams, Overconvergent Hilbert modular forms via perfectoid modular varieties](https://arxiv.org/abs/1902.03985v4), §8.2.4, Lemma 8.16(1), p. 35. The level-dependent groups Δ(pⁿN) of the hybrid tower.
- [Christopher Birkbeck, Ben Heuer, Chris Williams, Overconvergent Hilbert modular forms via perfectoid modular varieties](https://arxiv.org/abs/1902.03985v4), §8.2, p. 33. The G*-tower at full level carries no polarization action.

## S0.general — General-data completion interface

Coverage: **planned**.

- The toroidal tower diamond cites the planned supplier nodes ShimuraCompactifications C2.general/general-toroidal-descent, C2/minimal-boundary-map, C3/refinement-map, C3/level-datum-functoriality, C3/hecke-span, C3/choice-comparison and C3.general/general-map-descent, whose packet has not yet been independently reviewed; their condition that level maps send cones into cones is the admissibility of the fixed Σ at all levels K′_p ⊆ K_p.
- A fan smooth at the base cusp lattice need not remain smooth after p-level lattice change. Use compatible fs log Kummer charts at deeper levels; no all-level underlying smoothness is assumed.

### The general-data infinite-level diamond

Target `PerfectoidShimuraVarieties:S0.general/general-infinite-level-diamond` (construction).

For every pure Shimura datum D = (G, X), with the actual canonical models and minimal compactifications over E(D) of ShimuraVarieties:V8.general/general-tower and ShimuraVarieties:V8.general/general-minimal, and C, ι, K^p as in p-level-tower, the p-level towers K_p ↦ S_{K^pK_p}, S*_{K^pK_p} over C, their diamond limits S^◇_{K^p,∞} ⊆ S^{*◇}_{K^p,∞}, the right action of G(ℚ_p) and the prime-to-p Hecke action are defined exactly as in infinite-level-diamond and tower-right-action, with the same conclusions: S^{*◇}_{K^p,∞} is a spatial diamond with |S^{*◇}_{K^p,∞}| ≅ lim |S*_{K^pK_p}|, S^◇_{K^p,∞} is an open locally spatial subdiamond, the kernel of the G(ℚ_p)-action is Z_{K^p} (tower-action-kernel), and the components are described by component-set-of-infinite-level when G^der is simply connected. No perfectoidness of these diamonds and no Hodge–Tate map is asserted for general D; S6 supplies the period map on the toroidal tower.

**Hypotheses and conventions.**

- D an arbitrary pure Shimura datum; the canonical models are those of ShimuraVarieties V7/V8.general.
- This is an interface stage: perfectoid representability is proved only for pre-abelian data (S4).

**Proof route.**

1. Apply the constructions and proofs of p-level-tower, tower-right-action, infinite-level-diamond, tower-action-kernel and component-set-of-infinite-level verbatim to the general canonical models; they use only finiteness of level maps, projectivity of the minimal compactification and the double-coset description of points, all supplied by ShimuraVarieties:V8.general/general-tower and ShimuraVarieties:V8.general/general-minimal.

**Planning API.**

- `ShimuraTower.generalInfiniteLevel` (data): S^◇_{K^p,∞} and S^{*◇}_{K^p,∞} for an arbitrary pure datum.
- `ShimuraTower.generalInfiniteLevel_isSpatial` (characterisation): The compactified limit is a spatial diamond with |·| the limit of the finite-level spaces.
- `ShimuraTower.generalInfiniteLevel_action` (instance): The right G(ℚ_p)-action and the prime-to-p Hecke action.
- `ShimuraTower.generalInfiniteLevel_eq_abelian` (compatibility): For abelian-type data it is canonically isomorphic to infinite-level-diamond.

**Unit tests.**

- `general_abelian_agrees` (compatibility): For the Siegel datum, generalInfiniteLevel is canonically isomorphic to the S0 diamond of the Siegel tower.
- `general_torus` (degenerate): For a torus datum the general diamond is the profinite set lim T(ℚ)\T(𝔸_f)/K^pK_p over Spd C.
- `general_no_perfectoid_claim` (non-example): For the GL₂ modular-curve datum at a neat finite level, the constant one-level family is not cofinal: its limit is the diamond of a positive-dimensional smooth rigid curve over C and has no perfectoid representative over C. This counterexample uses positive dimension; a zero-dimensional constant tower over perfectoid C can be perfectoid. Representability of the actual cofinal p-level tower is proved in S1–S4.

**Acceptance instances.**

- For D of abelian type the construction agrees with infinite-level-diamond, because the general canonical models agree with V6's (uniqueness of canonical models, ShimuraVarieties:V8/model-uniqueness).
- For a datum D with a simple factor of type E₇ (not of abelian type, hence outside S4), the diamond is defined although no representability theorem is claimed.

**Direct prerequisites.** `ShimuraVarieties:V8.general/general-tower`, `ShimuraVarieties:V8.general/general-minimal`, `PerfectoidShimuraVarieties:S0/p-level-tower`, `PerfectoidShimuraVarieties:S0/tower-right-action`, `PerfectoidShimuraVarieties:S0/infinite-level-diamond`, `PerfectoidShimuraVarieties:S0/tower-action-kernel`, `PerfectoidShimuraVarieties:S0/component-set-of-infinite-level`.

**Sources.**

- [George Boxer, Vincent Pilloni, Higher Coleman theory](https://arxiv.org/abs/2110.10251v1), §4.4.38, p. 77. The general-datum tower taken in diamonds.

### The toroidal tower diamond with cone-compatible deck actions

Target `PerfectoidShimuraVarieties:S0.general/toroidal-tower-diamond` (construction).

Let D be a pure Shimura datum, K^p ⊆ G(𝔸_f^p) neat, K_p ∈ CO_p and Σ a K^pK_p-admissible projective cone decomposition (ShimuraCompactifications C0–C3.general). Smoothness of Σ is not assumed: it is relative to the lattices U(ℚ) ∩ K, which shrink when K_p shrinks, so a Σ that is smooth at level K^pK_p need not be smooth at level K^pK'_p. For K'_p ⊆ K_p, Σ is K^pK'_p-admissible, and the toroidal compactifications S^tor_{K^pK'_p,Σ} over C (analytified base changes of the canonical models of ShimuraCompactifications C2.general) with the proper transition maps S^tor_{K^pK''_p,Σ} → S^tor_{K^pK'_p,Σ} of ShimuraCompactifications C3.general form a tower with the same Σ at every level. Put S^{tor◇}_{K^p,Σ,∞} := lim_{K'_p ⊆ K_p} (S^tor_{K^pK'_p,Σ})^◇, a spatial diamond with |S^{tor◇}_{K^p,Σ,∞}| ≅ lim |S^tor_{K^pK'_p,Σ}|, containing S^◇_{K^p,∞} as the open complement of the boundary and mapping to S^{*◇}_{K^p,∞}. Deck actions: K_p acts on the tower (k ∈ K_p preserves Σ because Σ is K_p-stable), compatibly with the action on S^◇_{K^p,∞}; an element g ∈ G(ℚ_p) outside K_p maps the tower for Σ to the tower for gΣ, and two cone decompositions are compared through a common refinement Σ'' and the proper refinement maps, which are isomorphisms over S^◇_{K^p,∞}. Hecke correspondences for g ∈ G(ℚ_p) are formed on a common refinement of Σ and gΣ.

**Hypotheses and conventions.**

- Neat K^p; Σ admissible at level K^pK_p, so admissible at all smaller levels; no single Σ admits every Hecke correspondence (ShimuraCompactifications C3).
- The same Σ is used at every level of the tower (Boxer–Pilloni 2026, §3.3; Pilloni–Stroh Théorème 0.4 for the Siegel case).

**Proof route.**

1. Finite levels and the transition maps for fixed Σ are supplied by ShimuraCompactifications C2.general/C3.general (request).
2. Spatiality and the topological comparison follow from DiamondsAndVStacks:D5/limits-and-finite-stage-comparisons since the S^tor are proper, hence qcqs, and the transition maps proper.
3. The open tower is the preimage of the complement of the boundary at each level, so S^◇_{K^p,∞} is an open subdiamond; the maps S^tor → S* at each level give the map of limits.
4. Deck actions and Hecke correspondences are the limits of the finite-level maps of ShimuraCompactifications C3 with common refinements; refinement maps are isomorphisms over the open part, so the comparison is canonical there.

**Planning API.**

- `ShimuraTower.toroidal` (data): The tower K'_p ↦ S^tor_{K^pK'_p,Σ} for K'_p ⊆ K_p with fixed Σ.
- `ShimuraTower.toroidalInfiniteLevel` (data): The diamond S^{tor◇}_{K^p,Σ,∞} = lim (S^tor_{K^pK'_p,Σ})^◇.
- `ShimuraTower.toroidalInfiniteLevel_isSpatial` (characterisation): It is a spatial diamond with |·| = lim |S^tor|.
- `ShimuraTower.toroidalInfiniteLevel.openEmbedding` (projection): S^◇_{K^p,∞} ⊆ S^{tor◇}_{K^p,Σ,∞} as the complement of the boundary.
- `ShimuraTower.toroidalInfiniteLevel.toMin` (projection): The map to S^{*◇}_{K^p,∞}.
- `ShimuraTower.toroidalInfiniteLevel.deck` (instance): The action of K_p, compatible with the action on the open part.
- `ShimuraTower.toroidalInfiniteLevel.refine` (functoriality): For a refinement Σ'' of Σ, the map S^{tor◇}_{Σ''} → S^{tor◇}_{Σ}, an isomorphism over the open part, with identity and composition laws.
- `ShimuraTower.toroidalInfiniteLevel.translate` (functoriality): For g ∈ G(ℚ_p), the isomorphism from the tower for Σ to the tower for gΣ, compared with the K_p-action on common refinements.

**Unit tests.**

- `toroidal_g1_equals_minimal` (compatibility): For the modular-curve datum the toroidal tower diamond equals S^{*◇}_{K^p,∞}.
- `toroidal_refinement_iso_open` (characterisation): For a refinement Σ'' of Σ the map of toroidal diamonds is an isomorphism over S^◇_{K^p,∞} and, for a genuine star subdivision introducing a new ray in a two-dimensional boundary cone, it is not an isomorphism over the affected boundary stratum (the toric chart map is a blow-up).
- `toroidal_single_level` (degenerate): Restricted to the one-element family {K_p}, the limit is (S^tor_{K^pK_p,Σ})^◇.
- `toroidal_hecke_needs_refinement` (non-example): Use the genus-two perfect-cone fan at the standard Siegel cusp and p = 2. Put γ = diag(2, 1, 1, 2), with multiplier 2 and A = diag(2,1). On the cusp cone γ acts by Q ↦ AQAᵀ/2. The cone generated by e₁e₁ᵀ, e₂e₂ᵀ and (e₁−e₂)(e₁−e₂)ᵀ is sent to a cone containing both axis rays and the ray (2e₁−e₂)(2e₁−e₂)ᵀ. The only maximal perfect cones containing both axis rays have third ray (e₁±e₂)(e₁±e₂)ᵀ; neither contains this image ray (its off-diagonal magnitude is 2 while its second diagonal entry is 1). Thus γΣ does not refine Σ. A common refinement gives the Hecke span. The scalar cusp dilation diag(p,p,1,1) preserves every fan and is not a counterexample.

**Acceptance instances.**

- Siegel datum: by Pilloni–Stroh, Théorème 0.4, there is a perfectoid space X(p^∞)^{tor−mod} ~ lim X(pⁿ)^tor, so the toroidal tower diamond with fixed Σ has a perfectoid representative (S1). Their Remarque A.13 concerns another object, the generic fibre of the limit of the formal toroidal models, which they do not identify with X(p^∞)^{tor−mod}; the diamond limit here is the limit of the rigid toroidal compactifications.
- Modular curves (g = 1): toroidal and minimal compactifications agree and the toroidal tower diamond is S^{*◇}_{K^p,∞}.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S0.general/general-infinite-level-diamond`, `PerfectoidShimuraVarieties:S0/infinite-level-diamond`, `ShimuraCompactifications:C2.general/general-toroidal-descent`, `ShimuraCompactifications:C2/minimal-boundary-map`, `ShimuraCompactifications:C3/refinement-map`, `ShimuraCompactifications:C3/level-datum-functoriality`, `ShimuraCompactifications:C3/hecke-span`, `ShimuraCompactifications:C3/choice-comparison`, `ShimuraCompactifications:C3.general/general-map-descent`, `DiamondsAndVStacks:D5/limits-and-finite-stage-comparisons`.

**Sources.**

- [George Boxer, Vincent Pilloni, Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §3.3, p. 34. The toroidal tower with the same cone decomposition at every level.
- [Vincent Pilloni, Benoît Stroh, Cohomologie cohérente et représentations Galoisiennes](https://www.imo.universite-paris-saclay.fr/~pilloni/koko.pdf), Appendice A, Remarque A.13, PDF p. 27. The comparison that Pilloni–Stroh leave open concerns the generic fibre of the limit of formal toroidal models, not the limit of the rigid toroidal compactifications.

## S1 — The Siegel construction

Coverage: **planned**.

- Gap: the boundary-strata argument of Lemma 3.2.35 for general ε (PerfectoidShimuraVarieties/E9).
- Exact T0/T2/T3/T4 supplier nodes replace the old broad Hasse, filtration, chart and canonical-subgroup requests. Their conditional boundary/Raynaud descent inputs remain inherited. TC.0’s Hebbarkeitssatz and C5’s full-level boundary strata are still requested.

### The Siegel spaces of the construction: integral models, Hasse domains and finite-level adic spaces

Target `PerfectoidShimuraVarieties:S1/siegel-finite-level-spaces` (construction).

Fix g ≥ 1, p and K^p as in the hypotheses. Let X = X_{g,K^p} be the moduli scheme over ℤ_(p) of principally polarized abelian schemes of dimension g with level-K^p structure (PELModuli:M5/siegel-moduli), X* its minimal compactification over ℤ_(p) with ample line bundle ω (Faltings–Chai; ShimuraCompactifications C5), normal with normal geometric fibres and boundary of codimension g, and X* = Proj ⊕_k H⁰(X, ω^{⊗k}) when g ≥ 2. Let 𝔛 ⊆ 𝔛* be the p-adic completions of X ⊗ ℤ_p^cycl ⊆ X* ⊗ ℤ_p^cycl, 𝔄 → 𝔛 the universal abelian scheme, and Ha ∈ H⁰(X*_{𝔽_p}, ω^{⊗(p−1)}) the Hasse invariant (HodgeTateAndCanonicalSubgroups T0). For 0 ≤ ε < 1, the Hasse domain 𝔛*(ε) → 𝔛* is the formal model of AdicSpacesPartII:R2/hasse-domain for (𝔛*, ω, Ha): it represents pairs (f, u) with u·Ha(f̄) = p^ε modulo u ~ u(1 + p^{1−ε}h), locally Spf((R ⊗̂ ℤ_p^cycl)⟨u⟩/(uH̃a − p^ε)); it is an open formal subscheme of an admissible blow-up of 𝔛* (not itself an admissible blow-up; PerfectoidShimuraVarieties/E3), and 𝔛(ε), 𝔄(ε) are its pullbacks, with generic fibre 𝒳*(ε) = {|Ha| ≥ |p|^ε}. For K_p ⊆ GSp_2g(ℤ_p) compact open with c(K_p) = U_m (as for Γ₀(pᵐ), Γ₁(pᵐ), Γ(pᵐ)), X*_{K_pK^p} (the minimal compactification of the level-K_pK^p Siegel variety, the normalisation of X* in X_{K_pK^p}) lives over ℚ(ζ_{pᵐ}) through the similitude factor (the Weil pairing), and 𝒳*_{K_p} is the adic space over Spa(ℚ_p^cycl, ℤ_p^cycl) of its base change along ℚ(ζ_{pᵐ}) → ℚ_p^cycl for a fixed compatible system (ζ_{pⁿ})_n of p-power roots of unity (the tautological ζ_{pᵐ} ∈ ℚ_p^cycl matched with the root ζ_{pᵐ} ∈ 𝒪(X*_{K_pK^p}) given by the similitude factor, i.e. the Weil pairing of the level structure: 𝒳*_{K_p} is the fixed-similitude part); 𝒳_{K_p} ⊆ 𝒳*_{K_p} the preimage of 𝒳 (the good-reduction locus, not the open Shimura variety), 𝒵_{K_p} the boundary, and 𝒳*_{K_p}(ε) the preimage of 𝒳*(ε). Relation with the S0 tower: for a complete algebraically closed C ⊇ ℚ_p^cycl and S*_{K^pK_p} = (X*_{K_pK^p} ⊗_ℚ C)^{ad} (PerfectoidShimuraVarieties:S0/p-level-tower for the Siegel datum), S*_{K^pK_p} = ⊔_{a ∈ (ℤ/pᵐ)^×} 𝒳*_{K_p} ⊗_{ℚ_p^cycl, σ_a} C, where σ_a ∈ Gal(ℚ_p^cycl/ℚ_p) is σ_a(ζ_{pⁿ}) = ζ_{pⁿ}^a; so 𝒳*_{K_p} ⊗_{ℚ_p^cycl} C is the open and closed part of S*_{K^pK_p} on which the Weil-pairing root equals the fixed ζ_{pᵐ}, and it is all of S*_{K^pK_p} exactly when (ℤ/pᵐ)^× is trivial, namely m = 0 or (p, m) = (2, 1). The comparison at all levels K′_p ⊆ GSp_2g(ℚ_p), at infinite level and for the group actions is siegel-similitude-comparison.

**Hypotheses and conventions.**

- Siegel setting of Scholze §3: g ≥ 1, p prime, K^p ⊆ GSp_2g(𝔸_f^p) contained in {γ ∈ GSp_2g(Ẑ^p) : γ ≡ 1 mod N} for some N ≥ 3 prime to p; ℚ_p^cycl the completion of ℚ_p(μ_{p^∞}) with ring of integers ℤ_p^cycl; p^ε ∈ ℤ_p^cycl a chosen element of valuation ε.
- 𝒳_{K_p} is the locus of good reduction (the preimage of 𝒳 = 𝔛_η), which is strictly smaller than the analytification of the open Shimura variety X_{K_pK^p}; the boundary 𝒵_{K_p} is the preimage of the boundary of 𝒳*.
- Here U_0 = ℤ_p^× and U_m = ker(ℤ_p^× → (ℤ/pᵐ)^×) = 1 + pᵐℤ_p for m ≥ 1. The formula 1 + ℤ_p is not used as a unit subgroup.

**Proof route.**

1. Siegel moduli and the integral minimal compactification are imported (PELModuli:M5/siegel-moduli; ShimuraCompactifications:C5/integral-minimal-space, C5/minimal-hodge-ampleness, C5/integral-toroidal-space and C5/valuative-properness), with ampleness of ω and normality of geometric fibres.
2. The Hasse invariant on X_{𝔽_p} extends to X*_{𝔽_p} by Hartogs for g ≥ 2 (boundary of codimension g ≥ 2) and by inspection at the cusps for g = 1 (request to HodgeTateAndCanonicalSubgroups T0).
3. Apply AdicSpacesPartII:R2/hasse-domain to (𝔛*, ω, Ha) over ℤ_p^cycl, which contains p^ε for ε ∈ ℤ[1/p]·(1/(p−1)); flatness of the local charts uses that the image of H̃a in R/p is a nonzerodivisor (Lemma 3.2.10).
4. Finite levels: X*_{K_pK^p} is the level-K_pK^p member of the algebraic Siegel tower of S0; it lives over ℚ(ζ_{pᵐ}) through the root ζ_{pᵐ} := e(η(e_1), η(e_{g+1}))^{p^{n−m}} of a level structure η: (ℤ/pⁿ)^{2g} ≅ A[pⁿ] at a level Γ(pⁿ) ⊆ K_p, which is K_p-invariant because c(K_p) ⊆ U_m. Since the cyclotomic polynomial Φ_{pᵐ} is irreducible over ℚ, ℚ(ζ_{pᵐ}) ⊗_ℚ C ≅ ∏_{a ∈ (ℤ/pᵐ)^×} C (ζ_{pᵐ} ⊗ 1 ↦ (ζ_{pᵐ}^a)_a), which gives the decomposition of S*_{K^pK_p} after analytification.

**Planning API.**

- `SiegelTorsion.integralMin` (data): The p-adic formal scheme 𝔛* over ℤ_p^cycl with ω and the Hasse invariant.
- `SiegelTorsion.hasseDomain` (constructor): 𝔛*(ε) → 𝔛*, with pullbacks 𝔛(ε), 𝔄(ε).
- `SiegelTorsion.hasseDomain_generic` (simp): The generic fibre of 𝔛*(ε) is {|Ha| ≥ |p|^ε} ⊆ 𝒳*.
- `SiegelTorsion.finiteLevel` (data): 𝒳*_{K_p}, 𝒳_{K_p} (good reduction locus) and 𝒵_{K_p} for compact open K_p.
- `SiegelTorsion.finiteLevel_hasse` (projection): 𝒳*_{K_p}(ε) := preimage of 𝒳*(ε).
- `SiegelTorsion.finiteLevel_eq_tower` (compatibility): For C ⊇ ℚ_p^cycl complete algebraically closed and c(K_p) = U_m: S*_{K^pK_p} of PerfectoidShimuraVarieties:S0/p-level-tower (Siegel datum) is ⊔_{a ∈ (ℤ/pᵐ)^×} 𝒳*_{K_p} ⊗_{ℚ_p^cycl, σ_a} C, and 𝒳*_{K_p} ⊗_{ℚ_p^cycl} C is its open and closed part where the Weil-pairing root is ζ_{pᵐ}; compatibly with level maps, boundaries and open parts.
- `SiegelTorsion.hasseDomain_mono` (functoriality): For ε' ≤ ε, 𝒳*(ε') ⊆ 𝒳*(ε), with the transition maps of AdicSpacesPartII:R2/hasse-domain-transition-maps.

**Unit tests.**

- `hasseDomain_zero_ordinary` (computation): 𝒳*(0) = {|Ha| = 1} is the tube of the ordinary locus of X*_{𝔽_p}; for g = 1 it contains every cusp.
- `goodReduction_ne_open` (non-example): For g = 1, K_p = Γ(p) and a supersingular point, its preimage in 𝒳_{Γ(p)} is nonempty, but a point of the open modular curve with multiplicative reduction lies in the open Shimura variety and not in 𝒳_{Γ(p)}: 𝒳_{K_p} is the good-reduction locus, not X_{K_pK^p}^{an}.
- `hasseDomain_not_blowup` (non-example): 𝔛*(ε) → 𝔛* is not proper for ε > 0 (its generic fibre is the proper open subset {|Ha| ≥ |p|^ε}), so it is not an admissible blow-up, only an open subscheme of one.
- `finiteLevel_trivial_level` (degenerate): For K_p = GSp_2g(ℤ_p), 𝒳*_{K_p} is the generic fibre of 𝔛* and 𝒳_{K_p} = 𝒳.
- `finiteLevel_fixed_similitude_g1` (computation): For g = 1, K^p = K(N)^p (N ≥ 3) and K_p = Γ(pᵐ) with m ≥ 1, S*_{K^pK_p} has φ(N)φ(pᵐ) connected components, while 𝒳*_{Γ(pᵐ)} ⊗_{ℚ_p^cycl} C has φ(N): those on which the Weil pairing at p is ζ_{pᵐ}. For p = 3, m = 1 this is a proper clopen part, whereas for p = 2, m = 1 the residue-unit group is trivial and it is the whole space. These two cases distinguish the definitions.

**Acceptance instances.**

- For g = 1, 𝒳*(0) is the tube of the ordinary locus of the compactified modular curve X(N) over ℤ_p^cycl, containing the cusps.
- 𝒳*(ε') ⊆ 𝒳*(ε) for ε' ≤ ε, by AdicSpacesPartII:R2/hasse-domain-transition-maps.

**Direct prerequisites.** `PELModuli:M5/siegel-moduli`, `ShimuraCompactifications:C5/integral-minimal-space`, `ShimuraCompactifications:C5/minimal-hodge-ampleness`, `ShimuraCompactifications:C5/integral-toroidal-space`, `ShimuraCompactifications:C5/valuative-properness`, `AdicSpacesPartII:R2/hasse-domain`, `AdicSpacesPartII:R2/hasse-domain-transition-maps`, `PerfectoidShimuraVarieties:S0/p-level-tower`, `PerfectoidShimuraVarieties:S0/siegel-level-subgroups`, `HodgeTateAndCanonicalSubgroups:T0/semi-abelian-hasse-invariant`, `HodgeTateAndCanonicalSubgroups:T0/hasse-invariant-ordinary-locus`, `HodgeTateAndCanonicalSubgroups:T0/hasse-invariant-minimal-compactification`.

**Sources.**

- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §3.1, pp. 970–971, and §3.2.2, Definition 3.2.12 and Lemma 3.2.13, pp. 983–984. Hasse domains and the setting of §3.
- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §3.2.2, p. 983. 𝒳*_{K_p} is the base change along ℚ(ζ_{pᵐ}) → ℚ_p^cycl matching the tautological ζ_{pᵐ} with the similitude root.

### Scholze's fixed-similitude Siegel spaces over ℚ_p^cycl and the S0 Siegel tower over C

Target `PerfectoidShimuraVarieties:S1/siegel-similitude-comparison` (comparison).

Let K^p be as in siegel-finite-level-spaces and let S_{K^pK′_p} ⊆ S*_{K^pK′_p} (K′_p ⊆ GSp_2g(ℚ_p) compact open) be the open and minimally compactified p-level towers of PerfectoidShimuraVarieties:S0/p-level-tower for the Siegel datum (reflex field ℚ) over a complete algebraically closed C, with the C-linear right action T_γ of S0/tower-right-action and S0/infinite-level-diamond (iv); fix an embedding ℚ_p^cycl ⊆ C, so that the compatible system ζ = (ζ_{pⁿ})_n of siegel-finite-level-spaces lies in C. For a point with level structure α: T_pA ≅ ℤ_p^{2g} (a symplectic similitude), its Weil-pairing root w ∈ ℤ_p^× is defined by e(α⁻¹x, α⁻¹y) = ζ^{w·⟨x, y⟩} (⟨ , ⟩ the standard symplectic form, ⟨e_i, e_{g+i}⟩ = 1); at a level K′_p with c(K′_p) ⊆ U_m, w mod pᵐ is locally constant, and w: |S^{*◇}_{K^p,∞}| → ℤ_p^× is continuous and factors through π₀ (S0/component-set-of-infinite-level). For a ∈ ℤ_p^× let σ_a ∈ Gal(ℚ_p^cycl/ℚ_p) be the automorphism with σ_a(ζ_{pⁿ}) = ζ_{pⁿ}^a, and for γ ∈ GSp_2g(ℚ_p) put u(γ) := c(γ)p^{−v_p(c(γ))} ∈ ℤ_p^×. Then: (i) (finite level) for K_p ⊆ GSp_2g(ℤ_p) compact open with c(K_p) = U_m (m ≥ 0), S*_{K^pK_p} = ⊔_{a ∈ (ℤ/pᵐ)^×} {w ≡ a mod pᵐ} with {w ≡ a} ≅ 𝒳*_{K_p} ⊗_{ℚ_p^cycl, σ_a} C; in particular 𝒳*_{K_p} ⊗_{ℚ_p^cycl} C is the open and closed part {w ≡ 1 mod pᵐ} of S*_{K^pK_p}, equal to S*_{K^pK_p} exactly when m = 0 or (p, m) = (2, 1); likewise for the open parts 𝒳*_{K_p} ∖ 𝒵_{K_p} and S_{K^pK_p} and for the boundaries. (ii) (infinite level) For every perfectoid field L ⊇ ℚ_p^cycl, Spa(ℚ_p^cycl) ×_{Spa ℚ_p} Spa(L) ≅ ℤ_p^× × Spa(L) = Spa(C⁰(ℤ_p^×, L), C⁰(ℤ_p^×, 𝒪_L)), the point a ∈ ℤ_p^× corresponding to ℚ_p^cycl →σ_a ℚ_p^cycl ⊆ L, and lim_m 𝒳*^◇_{Γ(pᵐ)} ×_{Spd ℚ_p} Spd L ≅ lim_m (X*_{Γ(pᵐ)K^p} ⊗_ℚ L)^{ad◇}; for L = C this is S^{*◇}_{K^p,∞} = lim_{K′_p} S*^◇_{K^pK′_p} (Γ(pᵐ) cofinal), and its part {w = 1} is lim_m 𝒳*^◇_{Γ(pᵐ)} ×_{Spd ℚ_p^cycl} Spd C. Hence, once 𝒳*_{Γ(p^∞)} ~ lim_m 𝒳*_{Γ(pᵐ)} exists as a perfectoid space over ℚ_p^cycl (perfectoid-siegel-space): S^{*◇}_{K^p,∞} ≅ (𝒳*_{Γ(p^∞)} ×_{Spa ℚ_p} Spa C)^◇ = (𝒳*_{Γ(p^∞)} ×_{Spa ℚ_p^cycl} Spa C⁰(ℤ_p^×, C))^◇; the perfectoid space 𝒳*_{Γ(p^∞)} ×_{Spa ℚ_p} Spa C is a perfectoid representative (S0/perfectoid-representative) of the Siegel tower (S*_{K^pK′_p})_{K′_p ⊆ GSp_2g(ℚ_p)}; and 𝒳*_{Γ(p^∞)} ⊗̂_{ℚ_p^cycl} C is its closed fixed-pairing fibre {w = 1}, generally not open, not the whole tower (π₀ differs by the factor ℤ_p^×); likewise for the complements of the boundaries. (iii) (actions, all levels) Under (ii) the C-linear right action of GSp_2g(ℚ_p) on S^{*◇}_{K^p,∞} is the base change of the ℚ_p-linear right action on lim_m (X*_{Γ(pᵐ)K^p} ⊗_ℚ ℚ_p)^{ad◇} ≅ lim_m 𝒳*^◇_{Γ(pᵐ)} by the translations of ShimuraVarieties:V8/translation-laws (Scholze's GSp_2g(ℚ_p)-action), and w(x·γ) = u(γ)·w(x); equivalently, for the structure map s to Spd ℚ_p^cycl, T_γ^* ∘ s^* = s^* ∘ σ_{u(γ)}, so γ acts ℚ_p^cycl-linearly iff c(γ) ∈ p^ℤ. For every compact open K′_p ⊆ GSp_2g(ℚ_p), ((𝒳*_{Γ(p^∞)} ∖ 𝒵_{Γ(p^∞)}) ×_{Spa ℚ_p} Spa C)^◇ → S^◇_{K^pK′_p} is a pro-étale K′_p-torsor; if K′_p ⊆ GSp_2g(ℤ_p) with c(K′_p) = U_m, the stabiliser of the part {w = 1} in K′_p is K′_p ∩ ker c, and the restriction of this torsor to {w = 1} is a (K′_p ∩ ker c)-torsor over (𝒳*_{K′_p} ∖ 𝒵_{K′_p}) ⊗_{ℚ_p^cycl} C.

**Hypotheses and conventions.**

- Siegel setting of Scholze §3: g ≥ 1, p prime, K^p ⊆ GSp_2g(𝔸_f^p) contained in {γ ∈ GSp_2g(Ẑ^p) : γ ≡ 1 mod N} for some N ≥ 3 prime to p; ℚ_p^cycl the completion of ℚ_p(μ_{p^∞}) with ring of integers ℤ_p^cycl; p^ε ∈ ℤ_p^cycl a chosen element of valuation ε.
- C is complete and algebraically closed with a fixed embedding ℚ_p^cycl ⊆ C (equivalently a compatible system of p-power roots of unity in C); L in (ii) is any perfectoid field containing ℚ_p^cycl, for instance Heuer's base field K.
- Conventions: the right action x·γ is α ↦ γ⁻¹ ∘ α on α: V_pA ≅ ℚ_p^{2g}, i.e. η ↦ η ∘ γ on η = α⁻¹, which is S0's T_γ ([x, a] ↦ [x, aγ]); the Weil pairing is normalised by e(α⁻¹e_i, α⁻¹e_{g+i}) = ζ on the fixed-similitude part.
- Here U_0 = ℤ_p^× and U_m = ker(ℤ_p^× → (ℤ/pᵐ)^×) = 1 + pᵐℤ_p for m ≥ 1. The formula 1 + ℤ_p is not used as a unit subgroup.

**Proof route.**

1. (i): X*_{K_pK^p} over ℚ lives over ℚ(ζ_{pᵐ}) through the K_p-invariant similitude root (siegel-finite-level-spaces); since Φ_{pᵐ} is irreducible over ℚ, ℚ(ζ_{pᵐ}) ⊗_ℚ C ≅ ∏_{a ∈ (ℤ/pᵐ)^×} C, so X*_{K_pK^p} ⊗_ℚ C = ⊔_a X*_{K_pK^p} ⊗_{ℚ(ζ_{pᵐ}), ζ ↦ ζ^a} C, whose a-th piece is 𝒳*_{K_p} ⊗_{ℚ_p^cycl, σ_a} C after analytification (siegel-finite-level-spaces, finiteLevel_eq_tower); the boundary and the open part are compatible because the decomposition is by open and closed subschemes.
2. (ii), the base: ℚ_p(ζ_{pᵐ}) ⊗_{ℚ_p} L ≅ ∏_{(ℤ/pᵐ)^×} L, and Spd ℚ_p^cycl = lim_m Spd ℚ_p(ζ_{pᵐ}) (ℚ_p^cycl is the completed colimit: PerfectoidSpaces:P1/cyclotomic-perfectoid-field, PerfectoidSpaces:P7/represented-functor-comparison (ii)); hence Spd ℚ_p^cycl ×_{Spd ℚ_p} Spd L = lim_m ⊔_{(ℤ/pᵐ)^×} Spd L = ℤ_p^× × Spd L, the diamond of Spa(C⁰(ℤ_p^×, L), C⁰(ℤ_p^×, 𝒪_L)) (DiamondsAndVStacks:D4/compact-hausdorff-diamonds; fibre products by PerfectoidSpaces:P2/fibre-products-over-analytic-base).
3. (ii), the towers: since p is totally ramified in ℚ(ζ_{pᵐ}), X*_{Γ(pᵐ)K^p} ⊗_ℚ ℚ_p = X*_{Γ(pᵐ)K^p} ⊗_{ℚ(ζ_{pᵐ})} ℚ_p(ζ_{pᵐ}), so 𝒳*_{Γ(pᵐ)} = (X*_{Γ(pᵐ)K^p} ⊗_ℚ ℚ_p)^{ad} ×_{Spa ℚ_p(ζ_{pᵐ})} Spa ℚ_p^cycl; as Spd ℚ_p^cycl = lim_m Spd ℚ_p(ζ_{pᵐ}), lim_m 𝒳*^◇_{Γ(pᵐ)} ≅ lim_m (X*_{Γ(pᵐ)K^p} ⊗_ℚ ℚ_p)^{ad◇} (this is Scholze's 'in the inverse limit over m, the difference goes away', p. 983). Base change to L commutes with the limit (DiamondsAndVStacks:D5/limits-and-finite-stage-comparisons), (X* ⊗_ℚ ℚ_p)^{ad} ×_{Spa ℚ_p} Spa C = S*_{K^pΓ(pᵐ)}, and the restriction to the cofinal family Γ(pᵐ) does not change the limit (S0/siegel-level-subgroups, S0/infinite-level-diamond reindexing, PerfectoidSpaces:P7/tilde-limit-cofinal-change). The part {w = 1} is the fibre over the point 1 of ℤ_p^×.
4. Perfectoid case: PerfectoidSpaces:P7/represented-functor-comparison (i) gives 𝒳*^◇_{Γ(p^∞)} ≅ lim_m 𝒳*^◇_{Γ(pᵐ)}; 𝒳*_{Γ(p^∞)} ×_{Spa ℚ_p^cycl} Spa C⁰(ℤ_p^×, C) is a perfectoid space (PerfectoidSpaces:P2/fibre-products-over-analytic-base) whose diamond is the base change in (ii), and it is a perfectoid representative by S0/perfectoid-representative (ofDiamondIso; the transition maps are finite).
5. (iii): the action of S0/tower-right-action is the base change of the algebraic translations of ShimuraVarieties:V8/translation-laws, which over ℚ_p act on lim_m (X*_{Γ(pᵐ)K^p} ⊗_ℚ ℚ_p)^{ad◇}. On level structures T_γ is η ↦ η ∘ γ and e(ηγx, ηγy) = ζ^{c(γ)⟨x, y⟩}; for γ ∉ GSp_2g(ℤ_p) the new lattice ηγ(ℤ_p^{2g}) is the Tate module of an isogenous abelian variety on which the polarization rescaled by p^{−v_p(c(γ))} ∈ ℚ_{>0} is principal, so w(x·γ) = u(γ)w(x) (p·1 and diag(p·1_g, 1_g) preserve w). Torsors: S0/tower-action-kernel (iii), with Z(ℚ) ∩ K^pK′_p = {±1} ∩ (1 + Nℤ) = {1} for N ≥ 3; the stabiliser of {w = 1} is K′_p ∩ ker c by the formula for w(x·γ).

**Acceptance instances.**

- g = 1, K^p = K(N)^p (N ≥ 3) and K_p = Γ(pᵐ) with m ≥ 1: S*_{K^pΓ(pᵐ)} has φ(N)φ(pᵐ) connected components (S0 p-level-tower, test pLevel_gl2_full_level) and 𝒳*_{Γ(pᵐ)} ⊗_{ℚ_p^cycl} C is the union of the φ(N) of them with w ≡ 1 mod pᵐ.
- g = 1, K^p = K(N)^p: π₀(S^{*◇}_{K^p,∞}) = ℤ_p^× × (ℤ/N)^× (S0 component-set-of-infinite-level), w factors through the projection to ℤ_p^× (up to the inversion fixed by the reciprocity convention of ShimuraVarieties:V8/component-reciprocity), and π₀(𝒳*_{Γ(p^∞)} ⊗̂_{ℚ_p^cycl} C) ≅ (ℤ/N)^×.
- For γ = diag(1_g, a·1_g) with a ∈ ℤ_p^×, c(γ) = a and the action of γ on Scholze's 𝒳*_{Γ(p^∞)} covers σ_a on ℚ_p^cycl; for γ = p·1_{2g} or diag(p·1_g, 1_g), u(γ) = 1 and γ acts ℚ_p^cycl-linearly.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S1/siegel-finite-level-spaces`, `PerfectoidShimuraVarieties:S0/p-level-tower`, `PerfectoidShimuraVarieties:S0/tower-right-action`, `PerfectoidShimuraVarieties:S0/infinite-level-diamond`, `PerfectoidShimuraVarieties:S0/perfectoid-representative`, `PerfectoidShimuraVarieties:S0/tower-action-kernel`, `PerfectoidShimuraVarieties:S0/component-set-of-infinite-level`, `PerfectoidShimuraVarieties:S0/siegel-level-subgroups`, `PELModuli:M5/siegel-moduli`, `ShimuraVarieties:V8/translation-laws`, `ShimuraVarieties:V8/component-reciprocity`, `PerfectoidSpaces:P1/cyclotomic-perfectoid-field`, `PerfectoidSpaces:P7/represented-functor-comparison`, `PerfectoidSpaces:P7/tilde-limit-cofinal-change`, `PerfectoidSpaces:P2/fibre-products-over-analytic-base`, `DiamondsAndVStacks:D4/compact-hausdorff-diamonds`, `DiamondsAndVStacks:D5/limits-and-finite-stage-comparisons`.

**Sources.**

- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §3.2.2, p. 983. The fixed-similitude spaces over ℚ_p^cycl and the spaces over ℚ_p have the same inverse limit; (ii) makes this precise.
- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §3.2.2, footnote 10, p. 983. The ℚ_p^cycl-spaces see only the similitude-1 part; (iii) identifies the K′_p ∩ ker c torsor.
- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §3.1, footnote 7, p. 971. The GSp_2g(ℚ_p)-action is semilinear over ℚ_p^cycl, through u(γ).
- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §4.1, proof of Theorem 4.1.1, p. 1019. The passage from Scholze's Siegel space to the tower over C.

### The Frobenius diagram modulo p on Hasse domains

Target `PerfectoidShimuraVarieties:S1/frobenius-diagram-mod-p` (lemma).

Let 0 ≤ ε < 1. The relative Frobenius maps of 𝔄(p⁻¹ε)/p, 𝔛(p⁻¹ε)/p and 𝔛*(p⁻¹ε)/p over ℤ_p^cycl/p, followed by the natural isomorphisms (𝔜(p⁻¹ε)/p)^{(p)} ≅ 𝔜(ε)/p (𝔜 = 𝔄, 𝔛, 𝔛*), form a natural commutative diagram F: 𝔄(p⁻¹ε)/p → 𝔄(ε)/p over F: 𝔛(p⁻¹ε)/p → 𝔛(ε)/p over F: 𝔛*(p⁻¹ε)/p → 𝔛*(ε)/p.

**Hypotheses and conventions.**

- Siegel setting of Scholze §3: g ≥ 1, p prime, K^p ⊆ GSp_2g(𝔸_f^p) contained in {γ ∈ GSp_2g(Ẑ^p) : γ ≡ 1 mod N} for some N ≥ 3 prime to p; ℚ_p^cycl the completion of ℚ_p(μ_{p^∞}) with ring of integers ℤ_p^cycl; p^ε ∈ ℤ_p^cycl a chosen element of valuation ε.
- 0 ≤ ε < 1.

**Proof route.**

1. The Frobenius twist of the Hasse domain of radius p⁻¹ε is the Hasse domain of radius ε modulo p: under Frobenius twist u ↦ u^p and Ha ↦ Ha^p, and (p^{p⁻¹ε})^p = p^ε (Scholze's proof via the moduli description of Definition 3.2.12).
2. Relative Frobenius commutes with all maps of 𝔽_p-schemes, giving commutativity.

**Acceptance instances.**

- For ε = 0 it is the relative Frobenius of the ordinary locus modulo p.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S1/siegel-finite-level-spaces`, `AdicSpacesPartII:R2/hasse-domain`, `mathlib:frobenius`.

**Sources.**

- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §3.2.2, Lemma 3.2.14, pp. 984–985. Statement of Lemma 3.2.14.

### Trace estimates for Frobenius-type extensions on Hasse domains

Target `PerfectoidShimuraVarieties:S1/frobenius-trace-estimates` (theorem).

(i) (Lemma 3.2.21) Let R be a p-adically complete flat ℤ_p-algebra, Y_1, …, Y_n ∈ R, P_1, …, P_n ∈ R⟨X_1, …, X_n⟩ topologically nilpotent and S = R⟨X⟩/(X_i^p − Y_i − P_i). Then S is finite free over R with basis X^{i} (0 ≤ i_j ≤ p − 1), and tr_{S/R}(S) ⊆ Iⁿ for I = (p, I_1, …, I_n), I_i the ideal generated by the coefficients of P_i. (ii) (Corollary 3.2.22) Let R be a p-adically complete ℤ_p-algebra topologically of finite type and formally smooth of dimension n, f ∈ R with f̄ ∈ R/p a nonzerodivisor, R_ε = (R ⊗̂_{ℤ_p} ℤ_p^cycl)⟨u_ε⟩/(f u_ε − p^ε) for 0 ≤ ε < 1, and φ: R_ε → R_{ε/p} a ℤ_p^cycl-algebra map that is, modulo p^{1−ε}, Frobenius on R̄ and u_ε ↦ u_{ε/p}^p. If ε < 1/2 then φ[1/p] is finite flat, indeed finite free of rank p^n locally on Spf R, and the trace tr: R_{ε/p}[1/p] → R_ε[1/p] maps R_{ε/p} into p^{n−(2n+1)ε} R_ε.

**Hypotheses and conventions.**

- As stated; the trace is the trace of a finite locally free algebra (AdicSpacesPartII:R3/finite-locally-free-algebra-trace).
- ε < 1/2 in (ii).

**Proof route.**

1. (i) Finite freeness: Weierstrass-type division by the monic relations; the trace of a monomial X^i with some i_j ≠ 0 lies in Iⁿ by a change of variables making X_1^{i_1}⋯X_n^{i_n} the first coordinate over an invertible matrix over 𝔽_p (PAPER-SCHOLZE-15/E15 corrects X_i^{i_1} to X_1^{i_1}).
2. (ii) Locally Spf R is étale over Spf ℤ_p⟨Y_1, …, Y_n⟩, so R/p is locally free over itself via Frobenius with basis Y^i (0 ≤ i_j ≤ p − 1). Put R′_{ε/p} = (R ⊗̂ ℤ_p^cycl)⟨v_ε⟩/(f^p v_ε − p^ε) and τ: R′_{ε/p} → R_{ε/p}, v_ε ↦ u_{ε/p}^p: τ[1/p] is an isomorphism, τ is injective because R′_{ε/p} is p-torsion free (Lemma 3.2.10; TorsionCohomologyInfrastructure TC.0), and its cokernel is killed by p^{(p−1)ε/p}, hence by p^ε. Since ε < 1 − ε, φ factors through ψ: R_ε → R′_{ε/p}, and ψ agrees modulo p^{1−2ε} with the Frobenius map, so ψ is finite free with basis Y^i (this gives finite flatness and the rank p^n after inverting p). One can write R′_{ε/p} = R_ε⟨X_1, …, X_n⟩/(X_i^p − Y_i − P_i) with P_i ∈ p^{1−2ε}R_ε⟨X⟩ (p. 994), so (i) with I = (p^{1−2ε}) gives tr(R′_{ε/p}) ⊆ p^{n−2nε}R_ε; as p^ε R_{ε/p} ⊆ τ(R′_{ε/p}), tr(R_{ε/p}) ⊆ p^{−ε}·p^{n−2nε}R_ε = p^{n−(2n+1)ε}R_ε.

**Acceptance instances.**

- For n = 1, R = ℤ_p⟨Y⟩ and S = R⟨X⟩/(X^p − Y), tr(X^i) = 0 for 0 < i < p and tr(1) = p, so tr(S) ⊆ (p) = I.

**Direct prerequisites.** `AdicSpacesPartII:R3/finite-locally-free-algebra-trace`, `AdicSpacesPartII:R3/algebra-trace-base-change`, `AdicSpacesPartII:R3/algebra-trace-transitivity`, `TorsionCohomologyInfrastructure:TC.0`.

**Sources.**

- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §3.2.4, Lemma 3.2.21 and Corollary 3.2.22 with proofs, pp. 991–994. Purpose of §3.2.4.
- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §3.2.4, proof of Corollary 3.2.22(ii), p. 994. The coefficient bound p^{1−2ε}, not p^{1−ε}.

### Canonical Frobenius lifts on Hasse domains

Target `PerfectoidShimuraVarieties:S1/canonical-frobenius-lift` (theorem).

Let 0 ≤ ε < 1/2. There is a unique diagram of p-adic formal schemes F̃: 𝔄(p⁻¹ε) → 𝔄(ε), 𝔛(p⁻¹ε) → 𝔛(ε), 𝔛*(p⁻¹ε) → 𝔛*(ε), compatible with the projections, in which F̃_𝔄 is an isogeny of principally polarised abelian schemes with level structure over F̃_𝔛, that reduces modulo p^{1−ε} to the diagram of frobenius-diagram-mod-p (uniqueness is among the displayed diagrams, including the morphism of abelian schemes and the moduli structures). On 𝔛(p⁻¹ε), F̃ sends A to A/C, where C ⊆ A[p] is the canonical subgroup of level 1 (it exists because Ha^p divides p^ε there). The maps F̃_{𝔛(p⁻¹ε)} and F̃_{𝔄(p⁻¹ε)} are finite, and after inverting p they are finite étale of degrees p^{g(g+1)/2} and p^{g(g+1)/2+g}. No general integral-flatness assertion is made here.

**Hypotheses and conventions.**

- Siegel setting of Scholze §3: g ≥ 1, p prime, K^p ⊆ GSp_2g(𝔸_f^p) contained in {γ ∈ GSp_2g(Ẑ^p) : γ ≡ 1 mod N} for some N ≥ 3 prime to p; ℚ_p^cycl the completion of ℚ_p(μ_{p^∞}) with ring of integers ℤ_p^cycl; p^ε ∈ ℤ_p^cycl a chosen element of valuation ε.
- 0 ≤ ε < 1/2 (needed for the strong canonical subgroup of level 1 on 𝔄(p⁻¹ε), whose uniqueness gives the uniqueness of the diagram).

**Proof route.**

1. Import the generic canonical-subgroup quotient/radius and canonical–anticanonical comparison from T3/quotient-hasse-radius and T4/atkin-lehner-anticanonical. Specialize to the Siegel formal moduli problem and its integral Frobenius map; this node does not own those general comparisons.
2. On 𝔛(p⁻¹ε), the strong canonical subgroup C of level 1 exists (HodgeTateAndCanonicalSubgroups T3: Scholze Corollary 3.2.6 and Definition 3.2.7); it is totally isotropic by uniqueness, so A/C is principally polarized with induced level-K^p structure, giving F̃_𝔛 and F̃_𝔄 (the isogeny A → A/C).
3. C reduces to ker F modulo p^{1−ε}, so F̃ reduces to the relative Frobenius diagram; the Hasse invariant of A/C is related to that of A so that F̃ lands in 𝔛(ε).
4. Extension to 𝔛*: by Hartogs on the Hasse blow-up (Scholze Lemma 3.2.10; owned by TorsionCohomologyInfrastructure TC.0 and AdicSpacesPartII R2) the map extends uniquely across the boundary, which has codimension ≥ 2 in the special fibre for g ≥ 2; for g = 1 the boundary is the set of cusps, which lie in the ordinary locus, and the extension near a cusp is given by the finite-level Tate-curve parameter spaces (ShimuraVarieties:V8/gl2-cusps-tate; Heuer §2.3), on which the canonical subgroup is μ_p.
5. Uniqueness is immediate from uniqueness of the canonical subgroup (Scholze p. 986): in a diagram of the stated kind, ker F̃_𝔄 ⊆ 𝔄(p⁻¹ε)[p] is a finite flat subgroup that reduces to ker F modulo p^{1−ε}, hence is the canonical subgroup C (HodgeTateAndCanonicalSubgroups T3), so F̃_𝔄 is A → A/C and F̃_𝔛 classifies A/C with its induced structures; over 𝔛* the extension is unique by Hartogs. (Lemma 3.2.4 is not used here: it needs Ω¹ killed by p^ε, and bare Frobenius lifts are not unique.)
6. Degrees, without using the anticanonical locus: F̃_𝔛 is locally a map φ: R_ε → R_{ε/p} of the kind in frobenius-trace-estimates (ii) (Frobenius on R̄ and u_ε ↦ u_{ε/p}^p modulo p^{1−ε}), so on generic fibres it is finite locally free of rank p^n, n = g(g+1)/2 (proof of Corollary 3.2.22(i)); it is étale on generic fibres because A ↦ (A, C) is a section of the étale forgetful map 𝒳_{Γ₀(p)} → 𝒳, hence an open immersion, followed by the étale map (A, D) ↦ A/D (Scholze p. 987). Over it, F̃_𝔄 is fibrewise an isogeny of degree p^g, giving p^{g(g+1)/2+g}. The printed common degree is incorrect; the stronger assertion of integral nonflatness at every positive ε has not been established by this review (PerfectoidShimuraVarieties/E4).

**Acceptance instances.**

- For g = 1 and ε = 0, F̃ is the classical canonical lift of Frobenius on the ordinary locus, E ↦ E/C, of degree p on generic fibres.
- F̃ ∘ (inclusion 𝔛(p⁻²ε) ⊆ 𝔛(p⁻¹ε)) = (inclusion) ∘ F̃ (compatibility with shrinking ε).

**Direct prerequisites.** `PerfectoidShimuraVarieties:S1/siegel-finite-level-spaces`, `PerfectoidShimuraVarieties:S1/frobenius-diagram-mod-p`, `PerfectoidShimuraVarieties:S1/frobenius-trace-estimates`, `HodgeTateAndCanonicalSubgroups:T3/canonical-subgroup`, `HodgeTateAndCanonicalSubgroups:T3/canonical-subgroup-theorem`, `HodgeTateAndCanonicalSubgroups:T3/canonical-subgroup-properties`, `HodgeTateAndCanonicalSubgroups:T3/quotient-hasse-radius`, `HodgeTateAndCanonicalSubgroups:T3/section-rigidity`, `TorsionCohomologyInfrastructure:TC.0`, `AdicSpacesPartII:R2/hasse-domain`, `ShimuraVarieties:V8/gl2-cusps-tate`, `HodgeTateAndCanonicalSubgroups:T4/canonical-anticanonical-loci`, `HodgeTateAndCanonicalSubgroups:T4/atkin-lehner-anticanonical`.

**Sources.**

- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §3.2.2, Theorem 3.2.15(i) and its proof, pp. 985–987. Part (i) and the reduction to relative Frobenius.
- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §3.2.2, proof of Theorem 3.2.15(i), p. 986. Uniqueness of the diagram.

### Anticanonical open immersions into Γ₀(pᵐ)-level

Target `PerfectoidShimuraVarieties:S1/anticanonical-open-immersions` (theorem).

Let 0 ≤ ε < 1/2 and m ≥ 0. Then 𝔄(p⁻ᵐε) → 𝔛(p⁻ᵐε) has a canonical subgroup C_m ⊆ 𝔄(p⁻ᵐε)[pᵐ] of level m, and the pair (𝒜(p⁻ᵐε)/C_m, 𝒜(p⁻ᵐε)[pᵐ]/C_m) defines a morphism 𝒳(p⁻ᵐε) → 𝒳_{Γ₀(pᵐ)} on generic fibres, which extends uniquely to 𝒳*(p⁻ᵐε) → 𝒳*_{Γ₀(pᵐ)}; these morphisms are open immersions. For m ≥ 1 the square with top 𝒳*(p⁻ᵐ⁻¹ε) → 𝒳*_{Γ₀(pᵐ⁺¹)}, left (F̃_{𝔛*(p⁻ᵐ⁻¹ε)})^{ad}_η, right the forgetful map 𝒳*_{Γ₀(pᵐ⁺¹)} → 𝒳*_{Γ₀(pᵐ)} and bottom 𝒳*(p⁻ᵐε) → 𝒳*_{Γ₀(pᵐ)} commutes and is cartesian.

**Hypotheses and conventions.**

- Siegel setting of Scholze §3: g ≥ 1, p prime, K^p ⊆ GSp_2g(𝔸_f^p) contained in {γ ∈ GSp_2g(Ẑ^p) : γ ≡ 1 mod N} for some N ≥ 3 prime to p; ℚ_p^cycl the completion of ℚ_p(μ_{p^∞}) with ring of integers ℤ_p^cycl; p^ε ∈ ℤ_p^cycl a chosen element of valuation ε.
- 0 ≤ ε < 1/2; the left arrow of the square is the extension of F̃ to the minimal compactification (the published label omits the star; PerfectoidShimuraVarieties/E6).

**Proof route.**

1. Import the generic canonical-subgroup quotient/radius and canonical–anticanonical comparison from T3/quotient-hasse-radius and T4/atkin-lehner-anticanonical. Specialize to the Siegel formal moduli problem and its integral Frobenius map; this node does not own those general comparisons.
2. Existence of C_m on 𝔄(p⁻ᵐε): iterate the canonical subgroup of level 1 along the Frobenius lifts (HodgeTateAndCanonicalSubgroups T3: canonical subgroups of all levels and their quotients, Scholze Proposition 3.2.8).
3. (A/C_m, A[pᵐ]/C_m) is a Γ₀(pᵐ)-structure: C_m is totally isotropic by uniqueness, so A/C_m is principally polarized, and A[pᵐ]/C_m is a Lagrangian subgroup isomorphic to (ℤ/pᵐ)^g at geometric points because C_m is (Scholze Proposition 3.2.8(iv); T3) — a totally isotropic subgroup of order p^{mg} alone need not be of this form. The map is an open immersion: its composite with the étale map 𝒳_{Γ₀(pᵐ)} → 𝒳, (A′, D) ↦ A′/D, is the inclusion 𝒳(p⁻ᵐε) ⊆ 𝒳, since (A/C_m)/(A[pᵐ]/C_m) = A/A[pᵐ] ≅ A (Scholze p. 987).
4. Extension to minimal compactifications. g ≥ 2: Hartogs for the Hasse blow-up (Scholze Lemma 3.2.10; TorsionCohomologyInfrastructure TC.0) on affine charts Spf S of 𝔛* with f = Ha, together with: a section U_η → 𝒴 of a finite normal 𝒴 → (Spf S)^{ad}_η that is an open embedding extends uniquely to an open embedding (𝒴 is affinoid and normal; Scholze pp. 987–988), applied to the normalisation of 𝒳*_{Γ₀(pᵐ)} over the chart; cartesianness on 𝒳* by Hartogs once more. g = 1 (left to the reader in the source): the cusps lie in the ordinary locus, and on the Tate-curve disc D_x of a cusp (ShimuraVarieties:V8/gl2-cusps-tate) the map sends (T(q), μ_{pᵐ}) to (T(q)/μ_{pᵐ}, T(q)[pᵐ]/μ_{pᵐ}) = (T(q^{pᵐ}), ⟨q⟩), i.e. it is the identity of the q-disc onto the anticanonical cusp chart of 𝒳*_{Γ₀(pᵐ)} with parameter (q^{pᵐ})^{1/pᵐ} = q (Heuer Proposition 2.22), which extends over q = 0.
5. Cartesian square: both vertical maps are finite étale of degree p^{g(g+1)/2} over the good-reduction locus (using m ≥ 1), and the top map is an open immersion; compare degrees.

**Acceptance instances.**

- For g = 1, the image of 𝒳(p⁻ᵐε) is the locus of (E', D) with E' = E/C_m and D ∩ (canonical subgroup of E') = 0, i.e. the anticanonical component of the Γ₀(pᵐ)-curve over the ε-ordinary locus.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S1/siegel-finite-level-spaces`, `PerfectoidShimuraVarieties:S1/canonical-frobenius-lift`, `HodgeTateAndCanonicalSubgroups:T3/canonical-subgroup`, `HodgeTateAndCanonicalSubgroups:T3/canonical-subgroup-theorem`, `HodgeTateAndCanonicalSubgroups:T3/canonical-subgroup-properties`, `HodgeTateAndCanonicalSubgroups:T3/quotient-hasse-radius`, `HodgeTateAndCanonicalSubgroups:T3/section-rigidity`, `TorsionCohomologyInfrastructure:TC.0`, `PerfectoidShimuraVarieties:S0/siegel-level-subgroups`, `ShimuraVarieties:V8/gl2-cusps-tate`, `HodgeTateAndCanonicalSubgroups:T4/canonical-anticanonical-loci`, `HodgeTateAndCanonicalSubgroups:T4/atkin-lehner-anticanonical`.

**Sources.**

- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §3.2.2, Theorem 3.2.15(ii) and its proof, pp. 985–987. The degree comparison that makes the square cartesian.
- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §3.2.2, proof of Theorem 3.2.15(ii), pp. 987–988. The extension to the minimal compactification for g ≥ 2.
- [Ben Heuer, Cusps and q-expansion principles for modular curves at infinite level](https://arxiv.org/abs/2002.02488v1), §2.5, Proposition 2.22 and its proof, p. 14. The anticanonical cusp charts at Γ₀(pⁿ)-level, used for g = 1.

### The anticanonical locus at Γ₀(p)-level

Target `PerfectoidShimuraVarieties:S1/anticanonical-locus-level-p` (theorem).

Let 0 ≤ ε < 1/2. There is a weak canonical subgroup C ⊆ 𝔄(ε)[p] of level 1 (the published text says 'of level p'; PerfectoidShimuraVarieties/E5); write C also for its generic fibre, and let 𝒳_{Γ₀(p)}(ε) → 𝒳(ε) be the pullback of 𝒳_{Γ₀(p)} → 𝒳. Then the map 𝒳(p⁻¹ε) → 𝒳_{Γ₀(p)}(ε) of anticanonical-open-immersions and (F̃_{𝔛(p⁻¹ε)})^{ad}_η: 𝒳(p⁻¹ε) → 𝒳(ε) form a commutative triangle over 𝒳(ε), identifying 𝒳(p⁻¹ε) with the open and closed subset 𝒳_{Γ₀(p)}(ε)_a ⊆ 𝒳_{Γ₀(p)}(ε) of those totally isotropic D ⊆ 𝒜(ε)[p] of rank p^g with D ∩ C = {0} ('a' for anticanonical).

**Hypotheses and conventions.**

- Siegel setting of Scholze §3: g ≥ 1, p prime, K^p ⊆ GSp_2g(𝔸_f^p) contained in {γ ∈ GSp_2g(Ẑ^p) : γ ≡ 1 mod N} for some N ≥ 3 prime to p; ℚ_p^cycl the completion of ℚ_p(μ_{p^∞}) with ring of integers ℤ_p^cycl; p^ε ∈ ℤ_p^cycl a chosen element of valuation ε.
- 0 ≤ ε < 1/2.

**Proof route.**

1. Import the generic canonical-subgroup quotient/radius and canonical–anticanonical comparison from T3/quotient-hasse-radius and T4/atkin-lehner-anticanonical. Specialize to the Siegel formal moduli problem and its integral Frobenius map; this node does not own those general comparisons.
2. The generic fibre of C is finite étale of rank p^g (T3), so the locus D ∩ C = 0 is open and closed in the finite étale cover 𝒳_{Γ₀(p)}(ε) → 𝒳(ε).
3. The map j: 𝒳(p⁻¹ε) → 𝒳_{Γ₀(p)}, A ↦ (A/C₀, A[p]/C₀) (C₀ the strong canonical subgroup of level 1), is an open immersion (anticanonical-open-immersions, m = 1), and the triangle with F̃ commutes (Scholze Proposition 3.2.8(iii), which concerns the canonical subgroup of A/C₀; T3).
4. j lands in {D ∩ C = 0} (Scholze p. 987): on Spf R ⊆ 𝔛(p⁻¹ε) with A′ = A/C₀ and C ⊆ A′[p] its weak canonical subgroup, a section s of A[p] mapping into C is 0 in A′[p] modulo p^{(1−ε)/p}, hence lies in C₀ modulo p^{(1−ε)/p}; its image t in H = A[p]/C₀ vanishes modulo p^{(1−ε)/p}, and since Ha(A) kills Ω¹_{H/S} and divides p^{ε/p}, Lemma 3.2.4 (T3) with δ = (1 − ε)/p and ε′ = ε/p gives t = 0 ∈ H(S) (PAPER-SCHOLZE-15/E26).
5. Degrees: 𝒳(p⁻¹ε) → 𝒳(ε) is finite étale of degree p^{g(g+1)/2} (canonical-frobenius-lift, counted without this node), and so is 𝒳_{Γ₀(p)}(ε)_a → 𝒳(ε) (the Lagrangian complements of a Lagrangian in 𝔽_p^{2g} form a torsor under the symmetric g × g matrices). An open immersion between finite étale covers of the same degree is an isomorphism, so j identifies 𝒳(p⁻¹ε) with 𝒳_{Γ₀(p)}(ε)_a; the inverse is (A′, D) ↦ A′/D, since (A/C₀)/(A[p]/C₀) ≅ A.

**Acceptance instances.**

- For g = 1, 𝒳_{Γ₀(p)}(ε) → 𝒳(ε) has degree p + 1: the canonical locus (D = C) maps isomorphically onto 𝒳(ε), and the anticanonical locus 𝒳_{Γ₀(p)}(ε)_a has degree p over 𝒳(ε) and is isomorphic to 𝒳(p⁻¹ε) via (E, D) ↦ E/D.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S1/anticanonical-open-immersions`, `PerfectoidShimuraVarieties:S1/canonical-frobenius-lift`, `HodgeTateAndCanonicalSubgroups:T3/canonical-subgroup`, `HodgeTateAndCanonicalSubgroups:T3/canonical-subgroup-theorem`, `HodgeTateAndCanonicalSubgroups:T3/canonical-subgroup-properties`, `HodgeTateAndCanonicalSubgroups:T3/quotient-hasse-radius`, `HodgeTateAndCanonicalSubgroups:T3/section-rigidity`, `HodgeTateAndCanonicalSubgroups:T4/canonical-anticanonical-loci`, `HodgeTateAndCanonicalSubgroups:T4/atkin-lehner-anticanonical`.

**Sources.**

- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §3.2.2, Theorem 3.2.15(iii) and Remark 3.2.16, p. 986. Remark 3.2.16 names the anticanonical locus.
- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §3.2.2, proof of Theorem 3.2.15(iii), p. 987. Open immersion plus degree count, after checking the image lies in the anticanonical locus.

### The anticanonical Γ₀(pᵐ)-tower and its affinoidness at deep level

Target `PerfectoidShimuraVarieties:S1/anticanonical-tower` (construction).

Let 0 ≤ ε < 1/2. For m ≥ 1 define 𝒳_{Γ₀(pᵐ)}(ε)_a ⊆ 𝒳_{Γ₀(pᵐ)}(ε) and 𝒳*_{Γ₀(pᵐ)}(ε)_a ⊆ 𝒳*_{Γ₀(pᵐ)}(ε) as the images of the open immersions 𝒳(p⁻ᵐε) → 𝒳_{Γ₀(pᵐ)} and 𝒳*(p⁻ᵐε) → 𝒳*_{Γ₀(pᵐ)}; 𝒳*_{Γ₀(pᵐ)}(ε)_a is open and closed in 𝒳*_{Γ₀(pᵐ)}(ε) and is the preimage of 𝒳*_{Γ₀(p)}(ε)_a; for K_p ⊆ Γ₀(p) put 𝒳*_{K_p}(ε)_a := preimage of 𝒳*_{Γ₀(p)}(ε)_a. The anticanonical tower is (𝒳*_{Γ₀(pᵐ)}(ε)_a)_{m ≥ 1} with transition maps the forgetful maps; it has the integral models 𝔛*(p⁻ᵐε) with transition maps the Frobenius lifts F̃, which reduce to relative Frobenius modulo p^{1−ε}. For m sufficiently large (depending on ε), 𝒳*_{Γ₀(pᵐ)}(ε)_a is affinoid (Lemma 3.2.17).

**Hypotheses and conventions.**

- Siegel setting of Scholze §3: g ≥ 1, p prime, K^p ⊆ GSp_2g(𝔸_f^p) contained in {γ ∈ GSp_2g(Ẑ^p) : γ ≡ 1 mod N} for some N ≥ 3 prime to p; ℚ_p^cycl the completion of ℚ_p(μ_{p^∞}) with ring of integers ℤ_p^cycl; p^ε ∈ ℤ_p^cycl a chosen element of valuation ε.
- 0 ≤ ε < 1/2.
- Γ₀(pᵐ) with the corrected similitude condition (S0 siegel-level-subgroups).

**Proof route.**

1. Openness and identification with 𝒳*(p⁻ᵐε): anticanonical-open-immersions; closedness: 𝒳*(p⁻ᵐε) → 𝒳*(ε) is finite, hence proper, so its image is closed.
2. The cartesian squares of anticanonical-open-immersions show the anticanonical loci form a subtower and that the integral models with Frobenius-lift transition maps reduce to relative Frobenius modulo p^{1−ε}.
3. Affinoidness: choose m with H^i(X*, ω^{⊗p^m(p−1)}) = 0 for i > 0 (ampleness), lift Ha^{p^m} globally; 𝒳*(p⁻ᵐε) is then the locus |H̃a^{p^m}| ≥ |p|^ε in the projective X* with H̃a^{p^m} a section of an ample bundle, the complement of a neighbourhood of an ample divisor, hence affinoid.

**Planning API.**

- `SiegelTorsion.anticanonical` (data): The tower m ↦ 𝒳*_{Γ₀(pᵐ)}(ε)_a with forgetful transition maps.
- `SiegelTorsion.anticanonical_iso_hasse` (equivalence): 𝒳*_{Γ₀(pᵐ)}(ε)_a ≅ 𝒳*(p⁻ᵐε).
- `SiegelTorsion.anticanonical_isClopen` (characterisation): 𝒳*_{Γ₀(pᵐ)}(ε)_a is open and closed in 𝒳*_{Γ₀(pᵐ)}(ε).
- `SiegelTorsion.anticanonical_integralModel` (data): The integral tower 𝔛*(p⁻ᵐε) with Frobenius-lift transitions, a Frobenius-controlled integral tower in the sense of PerfectoidSpaces:P7.
- `SiegelTorsion.anticanonical_isAffinoid` (characterisation): 𝒳*_{Γ₀(pᵐ)}(ε)_a is affinoid for m ≫ 0.
- `SiegelTorsion.anticanonical_restrict` (functoriality): For K_p ⊆ Γ₀(p), the preimage 𝒳*_{K_p}(ε)_a, compatible with level maps.

**Unit tests.**

- `anticanonical_m1_degree` (computation): For g = 1, 𝒳_{Γ₀(p)}(ε) → 𝒳(ε) has degree p + 1 and its anticanonical part has degree p: the canonical part is one sheet.
- `anticanonical_eps_zero` (degenerate): For ε = 0 the anticanonical tower lies over the ordinary locus and its integral transition maps are exactly relative Frobenius modulo p.
- `anticanonical_not_full_preimage` (non-example): 𝒳_{Γ₀(p)}(ε)_a is not the whole preimage of 𝒳(ε): the locus D = C (canonical) is a different open and closed piece.
- `anticanonical_affinoid_of_lift` (characterisation): If m ≥ 1 and Ha^{pᵐ} lifts to a global section H̃ of ω^{⊗pᵐ(p−1)} over 𝔛* (for instance when H¹(X*, ω^{⊗pᵐ(p−1)}) = 0), then 𝒳*_{Γ₀(pᵐ)}(ε)_a ≅ 𝒳*(p⁻ᵐε) = {|H̃| ≥ |p|^ε} (using ε < 1), which is affinoid because H̃ is a section of an ample line bundle; a definition not identifying level m with the Hasse domain of radius p⁻ᵐε fails this.

**Acceptance instances.**

- For g = 1 and ε = 0 every level 𝒳*_{Γ₀(pᵐ)}(0)_a is identified with 𝒳*(0) (the ordinary locus with its cusps), and the tower is 𝒳*(0) ← 𝒳*(0) ← ⋯ with transition maps the canonical Frobenius lift E ↦ E/C of degree p; it is not an Igusa tower, whose levels have growing degree over 𝒳(0).

**Direct prerequisites.** `PerfectoidShimuraVarieties:S1/anticanonical-open-immersions`, `PerfectoidShimuraVarieties:S1/anticanonical-locus-level-p`, `PerfectoidShimuraVarieties:S1/canonical-frobenius-lift`, `PerfectoidShimuraVarieties:S1/siegel-finite-level-spaces`, `PerfectoidShimuraVarieties:S0/siegel-level-subgroups`, `PerfectoidSpaces:P7/frobenius-controlled-integral-tower`.

**Sources.**

- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §3.2.2, the paragraphs after Theorem 3.2.15 and Lemma 3.2.17, p. 988. The anticanonical tower and its integral Frobenius models.

### The anticanonical tower at Γ₀(p^∞)-level is perfectoid and its tilt is a perfection

Target `PerfectoidShimuraVarieties:S1/gamma0-infinite-level-perfectoid` (theorem).

Let 0 ≤ ε < 1/2. There are unique perfectoid spaces 𝒳_{Γ₀(p^∞)}(ε)_a, 𝒳*_{Γ₀(p^∞)}(ε)_a and 𝒜_{Γ₀(p^∞)}(ε)_a over ℚ_p^cycl with 𝒳_{Γ₀(p^∞)}(ε)_a ~ lim_m 𝒳_{Γ₀(pᵐ)}(ε)_a and likewise for the other two (tilde-limits in the sense of PerfectoidSpaces:P7/perfectoid-tilde-limit). The tilt of 𝒳*_{Γ₀(p^∞)}(ε)_a is naturally the open subset 𝒳′*^{perf}(ε) ⊆ 𝒳′*^{perf} where |Ha| ≥ |t|^ε, and the tilt of 𝒜_{Γ₀(p^∞)}(ε)_a is 𝒜′^{perf}(ε); here the primed spaces are the Siegel spaces over the completed perfection of 𝔽_p((t^{1/(p−1)})), identified with (ℚ_p^cycl)^♭ after choosing the tilt parameter, t^♯ = p up to a unit, and ^{perf} is the perfection of PerfectoidSpaces:P7/perfection-tilde-limit.

**Hypotheses and conventions.**

- Siegel setting of Scholze §3: g ≥ 1, p prime, K^p ⊆ GSp_2g(𝔸_f^p) contained in {γ ∈ GSp_2g(Ẑ^p) : γ ≡ 1 mod N} for some N ≥ 3 prime to p; ℚ_p^cycl the completion of ℚ_p(μ_{p^∞}) with ring of integers ℤ_p^cycl; p^ε ∈ ℤ_p^cycl a chosen element of valuation ε.
- 0 ≤ ε < 1/2; the limit runs over the anticanonical tower, which is not a cofinal level system (Γ₀(p^∞) is not open).

**Proof route.**

1. The integral models 𝔛*(p⁻ᵐε) with the Frobenius lifts F̃ form a Frobenius-controlled integral tower (anticanonical-tower; PerfectoidSpaces:P7/frobenius-controlled-integral-tower) with ϖ = p^{1/p} up to the bound p^{1−ε}, ε < 1/2.
2. Apply PerfectoidSpaces:P7/perfectoid-frobenius-criterion-for-towers chartwise to affine opens Spf R_{m₀} ⊆ 𝔛*(p^{−m₀}ε) and their preimages (PAPER-SCHOLZE-15/E28 corrects the index), and glue with PerfectoidSpaces:P7/tilde-limit-gluing.
3. The tilt: the characteristic-p Siegel spaces over 𝔽_p[[t^{1/(p−1)p^∞}]] have Hasse domains whose relative Frobenius towers are identified modulo p^{1−ε} ↔ t^{1−ε} with the anticanonical tower (the two reductions agree with 𝔛*(ε)/p); PerfectoidSpaces:P7/frobenius-tower-tilt identifies the tilt with the perfection.
4. Uniqueness: PerfectoidSpaces:P7/tilde-limit-perfectoid-uniqueness.

**Acceptance instances.**

- For g = 1 and ε = 0 this is the perfectoid ordinary locus of the modular curve at Γ₀(p^∞)-level, whose tilt is the perfection of the ordinary locus in characteristic p.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S1/anticanonical-tower`, `PerfectoidSpaces:P7/perfectoid-frobenius-criterion-for-towers`, `PerfectoidSpaces:P7/frobenius-tower-tilt`, `PerfectoidSpaces:P7/perfection-tilde-limit`, `PerfectoidSpaces:P7/tilde-limit-gluing`, `PerfectoidSpaces:P7/tilde-limit-perfectoid-uniqueness`.

**Sources.**

- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §3.2.3, Definition 3.2.18 and Corollary 3.2.19 with proof, pp. 989–990. The final step identifying the tilt.
- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §3.2.3, Corollary 3.2.19, p. 989. Statement of Corollary 3.2.19.

### At Γ₀(p^∞)-level the anticanonical piece is affinoid perfectoid with strongly Zariski closed boundary

Target `PerfectoidShimuraVarieties:S1/gamma0-boundary-strongly-zariski-closed` (theorem).

For 0 ≤ ε < 1/2, 𝒳*_{Γ₀(p^∞)}(ε)_a is affinoid perfectoid, and its boundary 𝒵_{Γ₀(p^∞)}(ε)_a ⊆ 𝒳*_{Γ₀(p^∞)}(ε)_a is strongly Zariski closed (PerfectoidSpaces:P4/strongly-zariski-closed-immersion: R → S surjective, R⁺ → S⁺ almost surjective, S⁺ the integral closure of the image).

**Hypotheses and conventions.**

- Siegel setting of Scholze §3: g ≥ 1, p prime, K^p ⊆ GSp_2g(𝔸_f^p) contained in {γ ∈ GSp_2g(Ẑ^p) : γ ≡ 1 mod N} for some N ≥ 3 prime to p; ℚ_p^cycl the completion of ℚ_p(μ_{p^∞}) with ring of integers ℤ_p^cycl; p^ε ∈ ℤ_p^cycl a chosen element of valuation ε.
- 0 ≤ ε < 1/2; 'strongly Zariski closed' in the corrected sense (PAPER-SCHOLZE-15/E2: S⁺ must be the integral closure of the image of R⁺).

**Proof route.**

1. By PerfectoidSpaces:P4/zariski-closed-tilting it suffices to check both assertions for the tilts in characteristic p (Scholze Lemma 2.2.7).
2. In characteristic p, 𝒳′*(ε) = {|Ha| ≥ |t|^ε} is affinoid (anticanonical-tower, Lemma 3.2.17 argument) and the boundary 𝒵′(ε) is Zariski closed; perfection preserves affinoidness.
3. In characteristic p a Zariski closed subset of an affinoid perfectoid is strongly Zariski closed (Scholze Lemma 2.2.5; PerfectoidQuotients Q4 and PerfectoidSpaces:P4/strongly-zariski-closed-criterion).

**Acceptance instances.**

- For g = 1 the boundary is the finite set of cusps of the perfectoid anticanonical neighbourhood; strong Zariski closedness says the restriction to cusps is almost surjective on plus rings.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S1/gamma0-infinite-level-perfectoid`, `PerfectoidSpaces:P4/strongly-zariski-closed-immersion`, `PerfectoidSpaces:P4/zariski-closed-tilting`, `PerfectoidSpaces:P4/strongly-zariski-closed-criterion`, `PerfectoidQuotients:Q4/characteristic-p-perfectoidization-universal`.

**Sources.**

- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §3.2.3, Corollary 3.2.20 with proof, p. 990. First step of the proof.

### Tate's normalized traces on the anticanonical tower

Target `PerfectoidShimuraVarieties:S1/tate-normalized-traces` (construction).

Fix 0 ≤ ε < 1/2 and let 𝔛_{Γ₀(p^∞)}(ε)_a = lim_m 𝔛(p⁻ᵐε) over ℤ_p^cycl (transition maps the Frobenius lifts F̃). For fixed m and m′ ≥ m the normalized traces p^{−(m′−m)g(g+1)/2} tr: 𝒪_{𝔛(p^{−m′}ε)}[1/p] → 𝒪_{𝔛(p⁻ᵐε)}[1/p] are compatible in m′ and define tr̄_m: colim_{m′} 𝒪_{𝔛(p^{−m′}ε)}[1/p] → 𝒪_{𝔛(p⁻ᵐε)}[1/p]; the image of colim_{m′} 𝒪_{𝔛(p^{−m′}ε)} lies in p^{−C_m}𝒪_{𝔛(p⁻ᵐε)} with constants C_m → 0, so tr̄_m extends by continuity to 𝒪_{𝔛_{Γ₀(p^∞)}(ε)_a}[1/p] → 𝒪_{𝔛(p⁻ᵐε)}[1/p], an 𝒪_{𝔛(p⁻ᵐε)}[1/p]-linear retraction of the inclusion; and x = lim_{m→∞} tr̄_m(x) for every x.

**Hypotheses and conventions.**

- Siegel setting of Scholze §3: g ≥ 1, p prime, K^p ⊆ GSp_2g(𝔸_f^p) contained in {γ ∈ GSp_2g(Ẑ^p) : γ ≡ 1 mod N} for some N ≥ 3 prime to p; ℚ_p^cycl the completion of ℚ_p(μ_{p^∞}) with ring of integers ℤ_p^cycl; p^ε ∈ ℤ_p^cycl a chosen element of valuation ε.
- 0 ≤ ε < 1/2; g(g+1)/2 = dim of the Siegel space, so p^{(m′−m)g(g+1)/2} is the degree of the transition map on generic fibres.

**Proof route.**

1. Compatibility of the normalized traces follows from transitivity of traces (AdicSpacesPartII:R3/algebra-trace-transitivity) and the degree p^{g(g+1)/2} of each step (canonical-frobenius-lift).
2. The bound: apply frobenius-trace-estimates (ii) with n = g(g+1)/2 at each step; the exponents n − (2n+1)ε/p^k sum, after normalization by p^{−n}, to a convergent series of losses, giving C_m → 0.
3. Continuity extension and x = lim tr̄_m(x): density of the colimit in the completed ring and the uniform bounds.

**Planning API.**

- `SiegelTorsion.normalizedTrace` (constructor): tr̄_m: 𝒪(𝔛_{Γ₀(p^∞)}(ε)_a)[1/p] → 𝒪(𝔛(p⁻ᵐε))[1/p].
- `SiegelTorsion.normalizedTrace_of_finiteLevel` (simp): tr̄_m(x) = x for x at level m.
- `SiegelTorsion.normalizedTrace_compat` (relation): tr̄_m ∘ tr̄_{m′} = tr̄_m for m′ ≥ m.
- `SiegelTorsion.normalizedTrace_bound` (characterisation): tr̄_m maps the integral colimit into p^{−C_m}𝒪(𝔛(p⁻ᵐε)) with C_m → 0.
- `SiegelTorsion.normalizedTrace_tendsto` (characterisation): x = lim_m tr̄_m(x).
- `SiegelTorsion.normalizedTrace_linear` (structure): tr̄_m is linear over 𝒪(𝔛(p⁻ᵐε))[1/p] and continuous.

**Unit tests.**

- `normalizedTrace_identity_level` (degenerate): For x already at level m, tr̄_m(x) = x.
- `normalizedTrace_g1_monomial` (computation): For the toy tower ℤ_p⟨T^{1/p^∞}⟩ (one Frobenius step T ↦ T^p, n = 1, ε = 0), tr̄_0(T^{a/p^k}) = 0 when a/p^k ∉ ℤ and = T^{a/p^k} when it is an integer: the normalized trace is the projection onto integral exponents.
- `normalizedTrace_not_unnormalized` (non-example): The unnormalized trace tr does not give a retraction: tr(1) = p^{(m′−m)g(g+1)/2} ≠ 1, so the factor p^{−(m′−m)g(g+1)/2} is required.
- `normalizedTrace_compat_R3` (compatibility): On finite levels the normalized trace is p^{−deg} times AdicSpacesPartII:R3/analytic-trace-finite-locally-free of the transition map (after inverting p).

**Acceptance instances.**

- tr̄_m restricted to 𝒪_{𝔛(p⁻ᵐε)}[1/p] is the identity.
- For g = 1 and ε = 0 every level is 𝔛(0) (the ordinary locus) and every transition map is the canonical Frobenius lift φ of degree p, so tr̄_m(x) = lim_{m′} p^{−(m′−m)} tr_{φ^{m′−m}}(x): the normalized trace along the Frobenius tower of 𝔛(0), not along an Igusa tower.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S1/anticanonical-tower`, `PerfectoidShimuraVarieties:S1/frobenius-trace-estimates`, `PerfectoidShimuraVarieties:S1/canonical-frobenius-lift`, `AdicSpacesPartII:R3/analytic-trace-finite-locally-free`, `AdicSpacesPartII:R3/algebra-trace-transitivity`.

**Sources.**

- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §3.2.4, Corollary 3.2.23, p. 994. Names the extension constructed in Corollary 3.2.23.

### Hartogs extension for finite covers of the anticanonical tower

Target `PerfectoidShimuraVarieties:S1/hartogs-for-finite-covers-of-anticanonical-tower` (theorem).

Assume g ≥ 2 and 0 ≤ ε < 1/2. Let 𝒴*_m → 𝒳*_{Γ₀(pᵐ)}(ε)_a be finite, étale away from the boundary, with 𝒴*_m normal and no irreducible component mapping into the boundary; let 𝒴_m be the preimage of 𝒳_{Γ₀(pᵐ)}(ε)_a, for m′ ≥ m let 𝒴*_{m′} be the normalisation of the pullback to 𝒳*_{Γ₀(p^{m′})}(ε)_a with 𝒴_{m′} ⊆ 𝒴*_{m′}, and 𝒴_∞ the pullback of 𝒴_m to 𝒳_{Γ₀(p^∞)}(ε)_a. For m′ large, 𝒴*_{m′} = Spa(S_{m′}, S_{m′}⁺) with S_{m′}⁺ = S_{m′}° is affinoid. Then (i) S_{m′}⁺ = H⁰(𝒴_{m′}, 𝒪⁺) for m′ large; (ii) colim_{m′} S_{m′}⁺ → H⁰(𝒴_∞, 𝒪⁺) is injective with dense image, and there are canonical continuous retractions H⁰(𝒴_∞, 𝒪) → S_{m′}; (iii) if S_∞ = H⁰(𝒴_∞, 𝒪) is a perfectoid ℚ_p^cycl-algebra and 𝒴*_∞ = Spa(S_∞, S_∞⁺) with S_∞⁺ = S_∞°, then 𝒴*_∞ is affinoid perfectoid, 𝒴*_∞ ~ lim_{m′} 𝒴*_{m′}, and S_∞⁺ is the p-adic completion of colim_{m′} S_{m′}⁺.

**Hypotheses and conventions.**

- Siegel setting of Scholze §3: g ≥ 1, p prime, K^p ⊆ GSp_2g(𝔸_f^p) contained in {γ ∈ GSp_2g(Ẑ^p) : γ ≡ 1 mod N} for some N ≥ 3 prime to p; ℚ_p^cycl the completion of ℚ_p(μ_{p^∞}) with ring of integers ℤ_p^cycl; p^ε ∈ ℤ_p^cycl a chosen element of valuation ε.
- g ≥ 2 (boundary of codimension ≥ 2); 0 ≤ ε < 1/2.

**Proof route.**

1. (i) Finite-level Hartogs: normality of 𝒴*_{m′} and codimension ≥ 2 of the boundary in the integral model (Scholze Proposition 3.2.9 and Lemma 3.2.10; TorsionCohomologyInfrastructure TC.0 and AdicSpacesPartII R2), applied on the Hasse blow-up charts.
2. (ii) Use the retractions given by tate-normalized-traces, base-changed along the finite étale 𝒴_m → 𝒳_{Γ₀(pᵐ)}(ε)_a, and (i) at every level.
3. (iii) Combine (ii) with the definition of tilde-limits (PerfectoidSpaces:P7/good-affinoid-perfectoid).

**Acceptance instances.**

- Applied to 𝒴*_m = 𝒳*_{Γ₀(pᵐ)}(ε)_a itself it recovers that H⁰ of the open good-reduction part computes the affinoid ring of the compactified anticanonical piece.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S1/tate-normalized-traces`, `PerfectoidShimuraVarieties:S1/anticanonical-tower`, `PerfectoidShimuraVarieties:S1/gamma0-infinite-level-perfectoid`, `TorsionCohomologyInfrastructure:TC.0`, `AdicSpacesPartII:R2/hasse-domain`, `PerfectoidSpaces:P7/good-affinoid-perfectoid`.

**Sources.**

- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §3.2.5, introduction and Lemma 3.2.24 with proof, pp. 995–997. Proof strategy of Lemma 3.2.24.

### The p^m-torsion of the anticanonical abelian variety at Γ₀(p^∞)-level and its tilt

Target `PerfectoidShimuraVarieties:S1/anticanonical-torsion-and-tilt` (theorem).

Assume g ≥ 2 and 0 ≤ ε < 1/2. Over 𝒳_{Γ₀(pᵐ)}(ε)_a, 𝒜_{Γ₀(pᵐ)}(ε)_a = 𝒜(p⁻ᵐε) maps by an isogeny with kernel the canonical subgroup C_m to the tautological abelian variety 𝒜^t_{Γ₀(pᵐ)}(ε)_a, and D_m := 𝒜_{Γ₀(pᵐ)}(ε)_a[pᵐ]/C_m ⊆ 𝒜^t_{Γ₀(pᵐ)}(ε)_a is finite étale over 𝒳_{Γ₀(pᵐ)}(ε)_a; let D_{m,Γ₀(p^∞)} be its pullback to 𝒳_{Γ₀(p^∞)}(ε)_a, a perfectoid space. Then (Lemma 3.2.25) 𝒜_{Γ₀(p^∞)}(ε)_a[pᵐ] → D_{m,Γ₀(p^∞)} is an isomorphism of perfectoid spaces, and (Lemma 3.2.26) the tilt of D_{m,Γ₀(p^∞)} is canonically the perfection of D′_m = 𝒜′(ε)[pᵐ]/C′_m → 𝒳′(ε), with C′_m the canonical subgroup (kernel of Frobenius) on the characteristic-p side.

**Hypotheses and conventions.**

- Siegel setting of Scholze §3: g ≥ 1, p prime, K^p ⊆ GSp_2g(𝔸_f^p) contained in {γ ∈ GSp_2g(Ẑ^p) : γ ≡ 1 mod N} for some N ≥ 3 prime to p; ℚ_p^cycl the completion of ℚ_p(μ_{p^∞}) with ring of integers ℤ_p^cycl; p^ε ∈ ℤ_p^cycl a chosen element of valuation ε.
- g ≥ 2 is the standing assumption of §3.2.5; 0 ≤ ε < 1/2.

**Proof route.**

1. At Γ₀(p^∞)-level the canonical subgroup C_m is killed by the inverse limit of Frobenius lifts: the composite A_{m′} → A_m of quotients by canonical subgroups identifies A[pᵐ] at infinite level with its image modulo C_m (Lemma 3.2.25).
2. Tilt: the identifications of gamma0-infinite-level-perfectoid for 𝒜 restrict to the finite étale D_m (PerfectoidSpaces:P7/tilde-limit-finite-etale-base-change), so the tilt of D_{m,Γ₀(p^∞)} is (D′_m)^{perf}; moreover (D′_m)^{perf} = 𝒜′(ε)[pᵐ]^{perf}, since perfection kills the infinitesimal C′_m = ker Fᵐ (the characteristic-p analogue of Lemma 3.2.25).

**Acceptance instances.**

- For g = 1, ε = 0, D_m is the étale quotient of E[pᵐ] on the ordinary locus, and the statement is the classical trivialisation of the canonical subgroup at Γ₀(p^∞)-level.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S1/gamma0-infinite-level-perfectoid`, `PerfectoidShimuraVarieties:S1/anticanonical-open-immersions`, `HodgeTateAndCanonicalSubgroups:T3/canonical-subgroup`, `HodgeTateAndCanonicalSubgroups:T3/canonical-subgroup-theorem`, `HodgeTateAndCanonicalSubgroups:T3/canonical-subgroup-properties`, `HodgeTateAndCanonicalSubgroups:T3/quotient-hasse-radius`, `HodgeTateAndCanonicalSubgroups:T3/section-rigidity`, `PerfectoidSpaces:P7/tilde-limit-finite-etale-base-change`.

**Sources.**

- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §3.2.5, the paragraphs before Lemma 3.2.25 and Lemmas 3.2.25–3.2.26, pp. 997–998. The untilting strategy that these lemmas start.

### The characteristic-p Hasse-locus triples are good

Target `PerfectoidShimuraVarieties:S1/characteristic-p-base-triples-good` (theorem).

Assume g ≥ 2, 0 ≤ ε < 1/2 and m ≥ 1. Let X^{ord*} ⊆ X* ⊗ 𝔽_p be the affine locus where Ha is invertible, X^{ord} its intersection with X ⊗ 𝔽_p, D_m^{ord} → X^{ord} the quotient of the pᵐ-torsion by its canonical subgroup, X^{ord}_{Γ₁(pᵐ)} → X^{ord} the finite scheme of isomorphisms D_m^{ord} ≅ (ℤ/pᵐ)^g and X^{ord*}_{Γ₁(pᵐ)} = Spec H⁰(X^{ord}_{Γ₁(pᵐ)}, 𝒪) (normal, finite over X^{ord*}). Let 𝒳′*_{Γ₁(pᵐ)}(ε) be the locus |Ha| ≥ |t|^ε in the adic space of X^{ord*}_{Γ₁(pᵐ)} ⊗ 𝔽_p((t^{1/(p−1)p^∞})), with boundary 𝒵′* and good-reduction part 𝒳′. Then the triples (𝒳′*(ε)^{perf}, 𝒵′*(ε)^{perf}, 𝒳′(ε)^{perf}) and (𝒳′*_{Γ₁(pᵐ)}(ε)^{perf}, 𝒵′*_{Γ₁(pᵐ)}(ε)^{perf}, 𝒳′_{Γ₁(pᵐ)}(ε)^{perf}) are good in the sense of Scholze Definition 2.3.8: H⁰(𝒳′*^{perf}, 𝒪⁺/t)^a ≅ H⁰(𝒳′*^{perf} ∖ 𝒵′*^{perf}, 𝒪⁺/t)^a ↪ H⁰(𝒳′^{perf}, 𝒪⁺/t)^a.

**Hypotheses and conventions.**

- Siegel setting of Scholze §3: g ≥ 1, p prime, K^p ⊆ GSp_2g(𝔸_f^p) contained in {γ ∈ GSp_2g(Ẑ^p) : γ ≡ 1 mod N} for some N ≥ 3 prime to p; ℚ_p^cycl the completion of ℚ_p(μ_{p^∞}) with ring of integers ℤ_p^cycl; p^ε ∈ ℤ_p^cycl a chosen element of valuation ε.
- g ≥ 2; 0 ≤ ε < 1/2; m ≥ 1.
- Resolution of singularities of X* ⊗ 𝔽_p, required by the Hebbarkeitssatz in characteristic p (Scholze Lemma 2.3.9), is supplied by a smooth toroidal compactification (Faltings–Chai).

**Proof route.**

1. Apply the base good triple lemma (Scholze Lemma 2.3.9; TorsionCohomologyInfrastructure TC.0) on affine charts of the characteristic-p Hasse blow-up, with Spec A₀ an open of X* ⊗ 𝔽_p, f = Ha and I₀ the boundary ideal, using the toroidal resolution (ShimuraCompactifications C5).
2. Pass to the finite normal covers X^{ord*}_{Γ₁(pᵐ)} étale away from the boundary by Scholze Lemma 2.3.10 (TC.0).

**Acceptance instances.**

- The statement says that bounded functions on the perfected ε-Hasse locus extend uniquely across the boundary: the characteristic-p Hebbarkeitssatz in the Siegel instance.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S1/siegel-finite-level-spaces`, `TorsionCohomologyInfrastructure:TC.0`, `ShimuraCompactifications:C5/integral-minimal-space`, `ShimuraCompactifications:C5/integral-toroidal-space`, `ShimuraCompactifications:C5/valuative-properness`, `PerfectoidSpaces:P7/perfection-tilde-limit`.

**Sources.**

- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §3.2.5, proof of Lemma 3.2.27, p. 999. Where resolution of singularities enters.
- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §2.3.3, after Definition 2.3.8, p. 967. The intended triple.

### Tilting the Γ₁(pᵐ)-cover of the anticanonical tower

Target `PerfectoidShimuraVarieties:S1/gamma1-cover-tilt` (theorem).

Assume g ≥ 2, 0 ≤ ε < 1/2, m ≥ 1, and apply hartogs-for-finite-covers-of-anticanonical-tower to 𝒴*_m = 𝒳*_{Γ₁(pᵐ)}(ε)_a → 𝒳*_{Γ₀(pᵐ)}(ε)_a. Then (Lemma 3.2.29) the tilt of 𝒴_∞ is 𝒳′_{Γ₁(pᵐ)}(ε)^{perf}; (Lemma 3.2.30) the tilt of 𝒴*_∞ ∖ ∂ is 𝒳′*_{Γ₁(pᵐ)}(ε)^{perf} ∖ ∂ (the published proof writes 𝒴*_m ∖ ∂ for 𝒴*_∞ ∖ ∂; PAPER-SCHOLZE-15/E22); (Lemma 3.2.31, used here in its bounded form) for perfectoid spaces 𝒳, 𝒴₁, 𝒴₂ over a perfectoid field, finite étale 𝒴_i → 𝒳, f: 𝒴₁ → 𝒴₂ over 𝒳 and an open 𝒰 ⊆ 𝒳 with H⁰(𝒳, 𝒪⁺) ↪ H⁰(𝒰, 𝒪⁺) (goodness), if f is an isomorphism over 𝒰 then f is an isomorphism (the printed hypothesis on 𝒪 is not available on the non-quasicompact complement of the boundary; only idempotents are needed); (Lemma 3.2.32) S_∞ = H⁰(𝒴_∞, 𝒪) is perfectoid and the tilt of 𝒴*_∞ = Spa(S_∞, S_∞⁺) is 𝒳′*_{Γ₁(pᵐ)}(ε)^{perf}.

**Hypotheses and conventions.**

- Siegel setting of Scholze §3: g ≥ 1, p prime, K^p ⊆ GSp_2g(𝔸_f^p) contained in {γ ∈ GSp_2g(Ẑ^p) : γ ≡ 1 mod N} for some N ≥ 3 prime to p; ℚ_p^cycl the completion of ℚ_p(μ_{p^∞}) with ring of integers ℤ_p^cycl; p^ε ∈ ℤ_p^cycl a chosen element of valuation ε.
- g ≥ 2; 0 ≤ ε < 1/2; m ≥ 1.

**Proof route.**

1. Lemma 3.2.29: 𝒴_∞ is the finite étale cover of 𝒳_{Γ₀(p^∞)}(ε)_a parametrising trivialisations of D_m, whose tilt is the trivialisations of D′_m^{perf} by anticanonical-torsion-and-tilt; finite étale covers tilt (PerfectoidSpaces P3).
2. Lemma 3.2.30: glue the identification over the complement of the boundary, using the goodness of characteristic-p-base-triples-good to extend functions.
3. Lemma 3.2.31: the finite étale algebras are determined by their restriction to 𝒰 because H⁰ injects (an idempotent argument).
4. Lemma 3.2.32: H⁰ of the candidate tilt is perfectoid (a perfection), and its untilt computes S_∞ by hartogs-for-finite-covers-of-anticanonical-tower (ii) and goodness.

**Acceptance instances.**

- For g = 1 the Γ₁-cover of the ordinary locus is the Igusa tower, whose tilt is the perfection of the characteristic-p Igusa tower.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S1/hartogs-for-finite-covers-of-anticanonical-tower`, `PerfectoidShimuraVarieties:S1/anticanonical-torsion-and-tilt`, `PerfectoidShimuraVarieties:S1/characteristic-p-base-triples-good`, `PerfectoidSpaces:P3/finite-etale-over-perfectoid-is-perfectoid`, `PerfectoidSpaces:P3/finite-etale-tilting-equivalence`.

**Sources.**

- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §3.2.5, Lemmas 3.2.29–3.2.32 with proofs, pp. 999–1000. The candidate tilt.

### The anticanonical tower at Γ₁(pᵐ) ∩ Γ₀(p^∞) and Γ₁(p^∞) levels

Target `PerfectoidShimuraVarieties:S1/gamma1-level-perfectoid` (theorem).

Let 0 ≤ ε < 1/2. For every m ≥ 1 there is a unique perfectoid space 𝒳*_{Γ₁(pᵐ)∩Γ₀(p^∞)}(ε)_a over ℚ_p^cycl with 𝒳*_{Γ₁(pᵐ)∩Γ₀(p^∞)}(ε)_a ~ lim_{m′} 𝒳*_{Γ₁(pᵐ)∩Γ₀(p^{m′})}(ε)_a; it and all 𝒳*_{Γ₁(pᵐ)∩Γ₀(p^{m′})}(ε)_a for m′ large are affinoid, colim_{m′} H⁰(𝒳*_{Γ₁(pᵐ)∩Γ₀(p^{m′})}(ε)_a, 𝒪) → H⁰(𝒳*_{Γ₁(pᵐ)∩Γ₀(p^∞)}(ε)_a, 𝒪) has dense image, and with 𝒵 the boundary and 𝒳 the preimage of 𝒳_{Γ₀(p)}(ε)_a the triple (𝒳*, 𝒵, 𝒳) at this level is good (Proposition 3.2.33). The same holds at Γ₁(p^∞)-level: 𝒳*_{Γ₁(p^∞)}(ε)_a ~ lim_m 𝒳*_{Γ₁(pᵐ)}(ε)_a (Proposition 3.2.34). For g = 1 the same statements follow from the Γ₀(p^∞)-level by finite étale base change, since 𝒳*_{Γ₁(pᵐ)}(ε)_a → 𝒳*_{Γ₀(pᵐ)}(ε)_a is finite étale also over the cusps.

**Hypotheses and conventions.**

- Siegel setting of Scholze §3: g ≥ 1, p prime, K^p ⊆ GSp_2g(𝔸_f^p) contained in {γ ∈ GSp_2g(Ẑ^p) : γ ≡ 1 mod N} for some N ≥ 3 prime to p; ℚ_p^cycl the completion of ℚ_p(μ_{p^∞}) with ring of integers ℤ_p^cycl; p^ε ∈ ℤ_p^cycl a chosen element of valuation ε.
- 0 ≤ ε < 1/2; the g ≥ 2 argument uses Hartogs; for g = 1 the source gives only a sketch (PerfectoidShimuraVarieties/E10), completed with finite-level inputs only: Heuer's Lemma 2.23 (on the Tate-curve charts of ShimuraVarieties:V8/gl2-cusps-tate) shows that 𝒳*_{Γ₁(pᵐ)}(ε)_a → 𝒳*_{Γ₀(pᵐ)}(ε)_a is a finite étale (ℤ/pᵐ)^×-torsor also over the cusps, split over each anticanonical cusp disc (Heuer's Γ₀ and Γ₁ spaces are the base changes of S1's, the determinant condition of S0 siegel-level-subgroups being absorbed by the fixed ζ_{pᵐ}); no infinite-level result of Heuer is used.

**Proof route.**

1. Combine gamma1-cover-tilt (the untilting argument) with hartogs-for-finite-covers-of-anticanonical-tower (iii) at level Γ₁(pᵐ) ∩ Γ₀(p^{m′}).
2. Goodness transfers from characteristic p (characteristic-p-base-triples-good) by tilting; pass to the limit over m by the stability of good triples under inverse limits (Scholze Lemma 2.3.11; TorsionCohomologyInfrastructure TC.0) and PerfectoidSpaces:P7/limit-of-perfectoid-tower.
3. g = 1: pull the finite étale (ℤ/pᵐ)^×-torsor 𝒳*_{Γ₁(pᵐ)}(ε)_a → 𝒳*_{Γ₀(pᵐ)}(ε)_a (Heuer Lemma 2.23) back to gamma0-infinite-level-perfectoid; the result is perfectoid with the tilde-limit property by almost purity (PerfectoidSpaces:P3/finite-etale-over-perfectoid-is-perfectoid, PerfectoidSpaces:P7/tilde-limit-finite-etale-base-change), and goodness passes along finite étale maps (Scholze Lemma 2.3.10; TC.0); the base goodness uses only the injectivity half of Lemma 2.3.9, valid in codimension 1 because the cusps are ordinary (V(J) ∩ V(f) = ∅).

**Acceptance instances.**

- For g = 1 and ε = 0 this is the perfectoid ordinary Igusa tower over the ordinary locus with its cusps.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S1/gamma1-cover-tilt`, `PerfectoidShimuraVarieties:S1/hartogs-for-finite-covers-of-anticanonical-tower`, `PerfectoidShimuraVarieties:S1/characteristic-p-base-triples-good`, `PerfectoidShimuraVarieties:S1/gamma0-infinite-level-perfectoid`, `TorsionCohomologyInfrastructure:TC.0`, `PerfectoidSpaces:P7/limit-of-perfectoid-tower`, `PerfectoidSpaces:P7/tilde-limit-finite-etale-base-change`, `PerfectoidSpaces:P3/finite-etale-over-perfectoid-is-perfectoid`, `ShimuraVarieties:V8/gl2-cusps-tate`.

**Sources.**

- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §3.2.5, Propositions 3.2.33–3.2.34 with proofs, pp. 1000–1001. Statements of Propositions 3.2.33–3.2.34.
- [Ben Heuer, Cusps and q-expansion principles for modular curves at infinite level](https://arxiv.org/abs/2002.02488v1), §2.6, Lemma 2.23 with proof, pp. 14–15. Finite étaleness of the Γ₁/Γ₀ cover over the cusps at finite level, used for g = 1.

### Full Γ(p^∞)-level: the anticanonical neighbourhood is affinoid perfectoid with a good boundary triple

Target `PerfectoidShimuraVarieties:S1/full-level-anticanonical-perfectoid` (theorem).

Let 0 ≤ ε < 1/2. (Lemma 3.2.35) For m ≥ 1, 𝒳*_{Γ(pᵐ)}(ε)_a → 𝒳*_{Γ₁(pᵐ)}(ε)_a is finite étale. (Theorem 3.2.36) There is a unique perfectoid space 𝒳*_{Γ(p^∞)}(ε)_a over ℚ_p^cycl with 𝒳*_{Γ(p^∞)}(ε)_a ~ lim_m 𝒳*_{Γ(pᵐ)}(ε)_a; it and all 𝒳*_{Γ(pᵐ)}(ε)_a for m large are affinoid, colim_m H⁰(𝒳*_{Γ(pᵐ)}(ε)_a, 𝒪) → H⁰(𝒳*_{Γ(p^∞)}(ε)_a, 𝒪) has dense image and, more precisely, H⁰(𝒳*_{Γ(p^∞)}(ε)_a, 𝒪⁺) is the p-adic completion of colim_m H⁰(𝒳*_{Γ(pᵐ)}(ε)_a, 𝒪⁺) (the form used by siegel-main-theorem (i); the source states only density, PerfectoidShimuraVarieties/E11), and with 𝒵_{Γ(p^∞)}(ε)_a the boundary and 𝒳_{Γ(p^∞)}(ε)_a the preimage of 𝒳_{Γ₀(p)}(ε)_a the triple (𝒳*_{Γ(p^∞)}(ε)_a, 𝒵_{Γ(p^∞)}(ε)_a, 𝒳_{Γ(p^∞)}(ε)_a) is good: bounded functions extend uniquely from the complement of the boundary.

**Hypotheses and conventions.**

- Siegel setting of Scholze §3: g ≥ 1, p prime, K^p ⊆ GSp_2g(𝔸_f^p) contained in {γ ∈ GSp_2g(Ẑ^p) : γ ≡ 1 mod N} for some N ≥ 3 prime to p; ℚ_p^cycl the completion of ℚ_p(μ_{p^∞}) with ring of integers ℤ_p^cycl; p^ε ∈ ℤ_p^cycl a chosen element of valuation ε.
- 0 ≤ ε < 1/2.

**Proof route.**

1. Lemma 3.2.35: for ε = 0, 𝒳*_{Γ(pᵐ)}(0)_a ≅ ⊔_{Γ₁(pᵐ)/Γ(pᵐ)} 𝒳*_{Γ₁(pᵐ)}(0)_a (a Lagrangian complement Σ = α(C_m) of the anticanonical subgroup is the extra datum, and Γ₁(pᵐ)/Γ(pᵐ) acts simply transitively on such Σ; Hartogs reduces to good reduction); for general ε the source invokes an unreferenced description of the boundary strata of 𝒳*_{Γ(pᵐ)} → 𝒳*_{Γ₁(pᵐ)} through lower-genus Siegel spaces and asserts finite étaleness above each stratum 'as it is so generically': this needs constancy of inertia along strata and the density of the ordinary locus in each stratum, supplied by the boundary description requested from ShimuraCompactifications C5 (Pilloni–Stroh Appendix A at full level pⁿ); recorded as a gap (PerfectoidShimuraVarieties/E9). For g = 1 (left to the reader in the source) only finite-level inputs are used: Heuer's Lemma 2.25 and Proposition 2.26 (§2.7), on the Tate-curve charts of ShimuraVarieties:V8/gl2-cusps-tate, give at each cusp x Cartesian squares Γ₀(pᵐ, ℤ/pᵐ) × D_{m,x} → (ℤ/pᵐ)^× × D_{m,x} over Heuer's 𝒳*_{Γ(pᵐ)}(ε)_a → 𝒳*_{Γ₁(pᵐ)}(ε)_a, so the map is finite étale also over the cusps; S1's 𝒳*_{Γ(pᵐ)}(ε)_a is the open and closed part of Heuer's on which the Weil pairing is ζ_{pᵐ} (the labels (a b; 0 d) with ad ≡ 1), which is finite étale over the same base.
2. Theorem 3.2.36: base change the Γ₁(p^∞)-level perfectoid space along the finite étale tower and apply almost purity (Scholze, Perfectoid spaces, Theorem 7.9(iii); PerfectoidSpaces P3) and PerfectoidSpaces:P7/tilde-limit-finite-etale-base-change; goodness passes along finite étale maps (TC.0).

**Acceptance instances.**

- A strict and explicit neighbourhood of the ordinary locus in the minimal compactification becomes affinoid perfectoid at infinite level and satisfies the Hebbarkeitssatz with respect to the boundary.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S1/gamma1-level-perfectoid`, `PerfectoidSpaces:P3/finite-etale-over-perfectoid-is-perfectoid`, `PerfectoidSpaces:P3/almost-purity-theorem`, `PerfectoidSpaces:P7/tilde-limit-finite-etale-base-change`, `TorsionCohomologyInfrastructure:TC.0`, `ShimuraCompactifications:C5`, `PerfectoidSpaces:P5/finite-etale-finite-stage-approximation`, `ShimuraVarieties:V8/gl2-cusps-tate`.

**Sources.**

- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §3.2.5, after Theorem 3.2.36, p. 1002. The source's summary of Theorem 3.2.36.
- [Ben Heuer, Cusps and q-expansion principles for modular curves at infinite level](https://arxiv.org/abs/2002.02488v1), §2.7, Lemma 2.25 and Proposition 2.26, pp. 15–16. The finite-level cusp charts at Γ(pᵐ)-level used for g = 1.

### The continuous Hodge–Tate map on the open infinite-level Siegel tower

Target `PerfectoidShimuraVarieties:S1/continuous-hodge-tate-map` (construction).

Put |𝒳*_{Γ(p^∞)}| := lim_m |𝒳*_{Γ(pᵐ)}|, |𝒵_{Γ(p^∞)}| := lim_m |𝒵_{Γ(pᵐ)}|, with their continuous GSp_2g(ℚ_p)-actions; for a complete nonarchimedean K over ℚ_p^cycl with open bounded valuation subring K⁺, 𝒳*_{Γ(p^∞)}(K, K⁺) := lim_m 𝒳*_{Γ(pᵐ)}(K, K⁺), and |𝒳*_{Γ(p^∞)}| is the (non-filtered) colimit of these sets, each point coming from a unique minimal (K, K⁺) (Remark 3.3.3). Let Fl be the flag variety over ℚ_p of totally isotropic g-dimensional subspaces of (ℚ_p^{2g}, standard symplectic form), the compact dual of the Siegel datum (ShimuraData:D3/compact-dual), with its Plücker charts Fl_J (HodgeTateAndCanonicalSubgroups T2). There is a GSp_2g(ℚ_p)-equivariant continuous map |π_HT|: |𝒳*_{Γ(p^∞)}| ∖ |𝒵_{Γ(p^∞)}| → |Fl| sending a point given by a principally polarized abelian variety A/K with a symplectic similitude α: T_pA ≅ ℤ_p^{2g} (compatible with the fixed ζ_{p^∞}) to the Hodge–Tate filtration Lie A ⊗ K(1) ⊆ T_pA ⊗ K ≅ K^{2g}. Equivariance law: GSp_2g(ℚ_p) acts on the tower on the right by x·γ: α ↦ γ⁻¹ ∘ α (on V_pA ≅ ℚ_p^{2g}; this is S0's right translation T_γ, transported by siegel-similitude-comparison), and |π_HT|(x·γ) = γ⁻¹·|π_HT|(x) for the standard left action of GSp_2g(ℚ_p) on Fl ⊆ Gr(g, ℚ_p^{2g}); equivalently |π_HT| is equivariant for the right action W·γ := γ⁻¹W on Fl.

**Hypotheses and conventions.**

- Siegel setting of Scholze §3: g ≥ 1, p prime, K^p ⊆ GSp_2g(𝔸_f^p) contained in {γ ∈ GSp_2g(Ẑ^p) : γ ≡ 1 mod N} for some N ≥ 3 prime to p; ℚ_p^cycl the completion of ℚ_p(μ_{p^∞}) with ring of integers ℤ_p^cycl; p^ε ∈ ℤ_p^cycl a chosen element of valuation ε.
- Points outside the boundary have good reduction after a finite extension only on the good-reduction locus; on |𝒳*| ∖ |𝒵| the abelian variety may have bad reduction, and the Hodge–Tate filtration is that of the abelian variety over K (HodgeTateAndCanonicalSubgroups T0/T2: Scholze Proposition 3.3.1 and the K-rationality of the filtration).

**Proof route.**

1. Remark 3.3.3: points of the inverse limit of spaces of points, and |𝒳*_{Γ(p^∞)}| as a colimit over (K, K⁺) with unique minimal representatives (S0 infinite-level-diamond (iii) for the diamond version).
2. For an abelian variety A over a complete algebraically closed C/ℚ_p the Hodge–Tate filtration Lie A(1) ⊆ T_pA ⊗ C is a totally isotropic subspace for the Weil pairing (HodgeTateAndCanonicalSubgroups T2, finite-level Hodge–Tate sequence); it is defined over K when A is (Fargues–Genestier–Lafforgue; T0/T2 request).
3. Continuity: locally on the pro-étale site of the open Siegel variety, the relative Hodge–Tate filtration of the universal abelian variety over the tower is a totally isotropic subbundle of 𝒪^{2g} (the relative Hodge–Tate sequence on the pro-étale site, HodgeTateAndCanonicalSubgroups T2), defining a map of adic spaces from a pro-étale cover and hence continuity.
4. Equivariance: x·γ replaces α by γ⁻¹ ∘ α on rational Tate modules and does not change the rational Hodge–Tate filtration Lie A ⊗ K(1) ⊆ V_pA ⊗ K (an isogeny induces an isomorphism of Hodge–Tate sequences after inverting p), so |π_HT|(x·γ) = γ⁻¹·|π_HT|(x); the identification of this action with S0's right translations is siegel-similitude-comparison (iii).

**Planning API.**

- `SiegelTorsion.htMapTop` (constructor): |π_HT|: |𝒳*_{Γ(p^∞)}| ∖ |𝒵_{Γ(p^∞)}| → |Fl|.
- `SiegelTorsion.htMapTop_apply` (simp): On a (K, K⁺)-point (A, α), |π_HT| is the Hodge–Tate filtration α(Lie A ⊗ K(1)) ⊆ K^{2g}.
- `SiegelTorsion.htMapTop_continuous` (characterisation): |π_HT| is continuous.
- `SiegelTorsion.htMapTop_equivariant` (functoriality): |π_HT|(x·γ) = |π_HT|(x)·γ for γ ∈ GSp_2g(ℚ_p), where x·γ (α ↦ γ⁻¹ ∘ α) is the right action matching S0's T_γ (siegel-similitude-comparison) and W·γ := γ⁻¹W is the right action on Fl; i.e. |π_HT|(x·γ) = γ⁻¹·|π_HT|(x) for the standard left action.
- `SiegelTorsion.points_infiniteLevel` (characterisation): 𝒳*_{Γ(p^∞)}(K, K⁺) = lim_m 𝒳*_{Γ(pᵐ)}(K, K⁺), and |𝒳*_{Γ(p^∞)}| is the colimit over (K, K⁺) with unique minimal representatives.

**Unit tests.**

- `htMapTop_ordinary_rational` (computation): For g = 1 and an ordinary E over 𝒪_C, |π_HT|(E, α) ∈ ℙ¹(ℚ_p), equal to the line α(T_p(E[p^∞]^{mult}) ⊗ C).
- `htMapTop_supersingular_drinfeld` (computation): For g = 1 and E supersingular, |π_HT|(E, α) ∉ ℙ¹(ℚ_p).
- `htMapTop_tate_curve` (computation): For g = 1 and the Tate curve E = T(q) over K with 0 < |q| < 1 (a point of |𝒳*_{Γ(p^∞)}| ∖ |𝒵_{Γ(p^∞)}| outside the good-reduction locus) and α(T_pμ_{p^∞}) = ℤ_p e_1, |π_HT|(E, α) = [1 : 0]: the Hodge–Tate filtration of E is T_pμ_{p^∞} ⊗ K, so a definition through good reduction or Néron special fibres misses or misplaces this point.
- `htMapTop_isotropic` (compatibility): The image lies in the Lagrangian Grassmannian: the Hodge–Tate filtration is totally isotropic for the Weil pairing, so |π_HT| lands in Fl ⊆ Gr(g, 2g) (Mathlib Module.Grassmannian for the ambient Grassmannian).

**Acceptance instances.**

- For g = 1 and an ordinary elliptic curve E with α carrying T_p(E[p^∞]^{mult}) to the line spanned by e_1, |π_HT|(E, α) is the ℚ_p-rational point [1 : 0] of ℙ¹.
- For g = 1 and E with supersingular reduction, |π_HT|(E, α) is a point of Drinfeld's Ω = ℙ¹ ∖ ℙ¹(ℚ_p).

**Direct prerequisites.** `PerfectoidShimuraVarieties:S1/full-level-anticanonical-perfectoid`, `PerfectoidShimuraVarieties:S1/siegel-similitude-comparison`, `PerfectoidShimuraVarieties:S0/infinite-level-diamond`, `PerfectoidShimuraVarieties:S0/tower-right-action`, `HodgeTateAndCanonicalSubgroups:T0/semi-abelian-hasse-invariant`, `HodgeTateAndCanonicalSubgroups:T0/hasse-invariant-ordinary-locus`, `HodgeTateAndCanonicalSubgroups:T0/hasse-invariant-minimal-compactification`, `HodgeTateAndCanonicalSubgroups:T0/raynaud-hodge-tate-filtration`, `HodgeTateAndCanonicalSubgroups:T0/fargues-hodge-tate-cokernel`, `HodgeTateAndCanonicalSubgroups:T2/abelian-hodge-tate-sequence`, `HodgeTateAndCanonicalSubgroups:T2/relative-hodge-tate-sequence`, `HodgeTateAndCanonicalSubgroups:T2/hodge-tate-flag-point`, `ShimuraData:D3/compact-dual`, `mathlib:Module.Grassmannian`.

**Sources.**

- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §3.3.1, Remark 3.3.3 and Lemma 3.3.4 with proof, pp. 1004–1006. Points of the inverse limit.
- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §3.3.1, Lemma 3.3.4, p. 1004. Statement of Lemma 3.3.4.

### The closure of the ordinary locus is the preimage of the ℚ_p-rational flags

Target `PerfectoidShimuraVarieties:S1/rational-flags-preimage` (theorem).

In |𝒳*_{Γ(p^∞)}| ∖ |𝒵_{Γ(p^∞)}|: the preimage of Fl(ℚ_p) under |π_HT| is the closure of |𝒳*_{Γ(p^∞)}(0)| ∖ |𝒵_{Γ(p^∞)}(0)| (Lemma 3.3.6), the closure of a retrocompact open, i.e. its set of specialisations; and the preimage of Fl_{g+1,…,2g}(ℚ_p) is the closure of |𝒳*_{Γ(p^∞)}(0)_a| ∖ |𝒵_{Γ(p^∞)}(0)_a| (Lemma 3.3.14). The compactified versions (Lemmas 3.3.19–3.3.20) need π_HT extended over the boundary and are part of siegel-main-theorem. Here Fl_{g+1,…,2g}(ℚ_p) parametrises the totally isotropic direct summands M ⊆ ℤ_p^{2g} with M ⊕ (ℤ_p^g ⊕ 0) = ℤ_p^{2g}.

**Hypotheses and conventions.**

- Siegel setting of Scholze §3: g ≥ 1, p prime, K^p ⊆ GSp_2g(𝔸_f^p) contained in {γ ∈ GSp_2g(Ẑ^p) : γ ≡ 1 mod N} for some N ≥ 3 prime to p; ℚ_p^cycl the completion of ℚ_p(μ_{p^∞}) with ring of integers ℤ_p^cycl; p^ε ∈ ℤ_p^cycl a chosen element of valuation ε.
- The ordinary/rational correspondence is for the abelian part: at a point of bad reduction the argument applies to the abelian part B of the Raynaud extension, with g replaced by g′ = dim B (PAPER-SCHOLZE-15/E30).

**Proof route.**

1. An abelian variety over 𝒪_C with good reduction is ordinary iff its p-divisible group is (ℚ_p/ℤ_p)^g × μ_{p^∞}^g, iff its Hodge–Tate filtration is ℚ_p-rational; the kernel of α_G: T_pG → (Lie G*)* is T_p(G^{mult}) (Remark 3.3.7, with PAPER-SCHOLZE-15/E24 correcting Lie G* to (Lie G*)*), giving the direct argument without the Scholze–Weinstein classification.
2. For bad reduction use the Raynaud extension (Scholze Proposition 3.3.1; HodgeTateAndCanonicalSubgroups T0) and the Hasse invariant at boundary points (Lemma 3.3.2; T0).
3. Specialisations: the preimage of the closed set Fl(ℚ_p) is closed; it contains the ordinary locus and is contained in its closure by the above.
4. Lemma 3.3.14: at a point of 𝒳_{Γ(p^∞)}(0) the abelian variety over 𝒪_K is ordinary with canonical subgroup C ⊆ T_pA, the Hodge–Tate filtration is α(C) ⊗ K, and the point lies in (0)_a iff α(C) ⊕ (ℤ_p^g ⊕ 0) = ℤ_p^{2g}, which is the description of Fl_{g+1,…,2g}(ℚ_p); over 𝒳*(0) ∖ 𝒵(0), open and closed subsets extend across the boundary by goodness of the triple of full-level-anticanonical-perfectoid (Theorem 3.2.36), and a GSp_2g(ℤ_p)-translation argument handles the points of (0) ∖ (0)_a.

**Acceptance instances.**

- For g = 1: π_HT^{-1}(ℙ¹(ℚ_p)) is the closure of the ordinary locus and π_HT^{-1}(Ω) is the supersingular locus.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S1/continuous-hodge-tate-map`, `PerfectoidShimuraVarieties:S1/full-level-anticanonical-perfectoid`, `PerfectoidShimuraVarieties:S0/siegel-level-subgroups`, `HodgeTateAndCanonicalSubgroups:T0/raynaud-hodge-tate-filtration`, `HodgeTateAndCanonicalSubgroups:T0/hasse-invariant-minimal-compactification`.

**Sources.**

- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §3.3.2, Lemma 3.3.14 with proof, pp. 1010–1011. Goodness of Theorem 3.2.36 enters Lemma 3.3.14.
- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §3.3.1, Lemma 3.3.6 with proof and Remark 3.3.7, pp. 1006–1007. Remark 3.3.7 avoids the classification theorem.

### Finitely many GSp_2g(ℚ_p)-translates of a Hasse neighbourhood cover the tower

Target `PerfectoidShimuraVarieties:S1/translates-cover-tower` (theorem).

(Lemma 3.3.8) For 0 < ε < 1 there is an open U ⊆ Fl containing Fl(ℚ_p) with |π_HT|⁻¹(U) ⊆ |𝒳*_{Γ(p^∞)}(ε)| ∖ |𝒵_{Γ(p^∞)}(ε)|. (Lemma 3.3.9) Every open U ⊆ Fl containing a ℚ_p-rational point satisfies GSp_2g(ℚ_p)·U = Fl. (Lemma 3.3.10) For 0 < ε < 1 there are γ_1, …, γ_k ∈ GSp_2g(ℚ_p) with |𝒳*_{Γ(p^∞)}| ∖ |𝒵_{Γ(p^∞)}| = ⋃_i γ_i·(|𝒳*_{Γ(p^∞)}(ε)| ∖ |𝒵_{Γ(p^∞)}(ε)|). (Lemma 3.3.11) With the same γ_i, |𝒳*_{Γ(p^∞)}| = ⋃_i γ_i·|𝒳*_{Γ(p^∞)}(ε)|.

**Hypotheses and conventions.**

- Siegel setting of Scholze §3: g ≥ 1, p prime, K^p ⊆ GSp_2g(𝔸_f^p) contained in {γ ∈ GSp_2g(Ẑ^p) : γ ≡ 1 mod N} for some N ≥ 3 prime to p; ℚ_p^cycl the completion of ℚ_p(μ_{p^∞}) with ring of integers ℤ_p^cycl; p^ε ∈ ℤ_p^cycl a chosen element of valuation ε.
- 0 < ε < 1.

**Proof route.**

1. Lemma 3.3.8, by induction on g (g = 0 is empty): at a point of bad reduction, Proposition 3.3.1 and Lemma 3.3.2 (HodgeTateAndCanonicalSubgroups T0) express the Hodge–Tate period and the Hasse invariant through the abelian part B of the Raynaud extension, of smaller dimension, and the induction hypothesis applies (U may be taken GSp_2g(ℤ_p)-invariant, which makes the bound uniform). At points of good reduction, |π_HT| is continuous on the good-reduction locus |𝒳_{Γ(p^∞)}|, the intersection of the |π_HT|⁻¹(U) over open U ⊇ Fl(ℚ_p) is |π_HT|⁻¹(Fl(ℚ_p)) ∩ |𝒳_{Γ(p^∞)}|, which lies in the closure of |𝒳_{Γ(p^∞)}(0)| (rational-flags-preimage) and hence in |𝒳_{Γ(p^∞)}(ε)| for ε > 0, and |𝒳_{Γ(p^∞)}| ∖ |𝒳_{Γ(p^∞)}(ε)| is quasi-compact for the constructible topology, so one U works. (The compactness argument runs on the good-reduction locus: |𝒳*_{Γ(p^∞)}| ∖ |𝒵_{Γ(p^∞)}| is not quasi-compact.)
2. Lemma 3.3.9: the GSp_2g(ℚ_p)-orbit of any point of Fl contains ℚ_p-rational points in its closure, by contracting with a suitable torus element (dynamics of the Iwasawa decomposition).
3. Lemma 3.3.10: compactness of |Fl| gives finitely many translates of U covering Fl, and equivariance of |π_HT|.
4. Lemma 3.3.11: let V be the finite union of translated Hasse domains. It is a quasicompact open containing the complement of the boundary. Descend V to an open V_m at a finite compactified level, still containing the complement of the finite-level boundary. To show V_m is the whole finite-type adic space, it suffices to check classical points. If a classical point x lay outside V_m, the intersection of its open neighbourhoods is {x}; constructible compactness of V_m then gives an open neighbourhood of x disjoint from V_m. That open would lie in the boundary, which has smaller dimension and no interior, a contradiction. Pull back the equality to the tower. This is the finite-level constructible-compactness argument on Scholze p. 1009; an arbitrary union of opens is not asserted to have open complement.

**Acceptance instances.**

- For g = 1, finitely many translates of the ε-ordinary locus at infinite level cover the whole perfectoid modular curve, the supersingular disc being moved into the ordinary neighbourhood by elements of GL_2(ℚ_p).

**Direct prerequisites.** `PerfectoidShimuraVarieties:S1/rational-flags-preimage`, `PerfectoidShimuraVarieties:S1/continuous-hodge-tate-map`, `PerfectoidShimuraVarieties:S0/tower-right-action`, `HodgeTateAndCanonicalSubgroups:T0/semi-abelian-hasse-invariant`, `HodgeTateAndCanonicalSubgroups:T0/hasse-invariant-ordinary-locus`, `HodgeTateAndCanonicalSubgroups:T0/hasse-invariant-minimal-compactification`, `HodgeTateAndCanonicalSubgroups:T0/raynaud-hodge-tate-filtration`, `HodgeTateAndCanonicalSubgroups:T0/fargues-hodge-tate-cokernel`, `HodgeTateAndCanonicalSubgroups:T2/abelian-hodge-tate-sequence`, `HodgeTateAndCanonicalSubgroups:T2/relative-hodge-tate-sequence`, `HodgeTateAndCanonicalSubgroups:T2/hodge-tate-flag-point`.

**Sources.**

- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §3.3.1, proof of Lemma 3.3.8, p. 1008. The induction on g through the Raynaud extension.
- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §3.3.1, Lemmas 3.3.8–3.3.11 with proofs, pp. 1008–1009. Author's comment on Lemma 3.3.8.

### The minimally compactified Siegel tower at Γ(p^∞)-level is perfectoid

Target `PerfectoidShimuraVarieties:S1/perfectoid-siegel-space` (theorem).

There is a perfectoid space 𝒳*_{Γ(p^∞)} over ℚ_p^cycl with 𝒳*_{Γ(p^∞)} ~ lim_m 𝒳*_{Γ(pᵐ)}, unique up to unique isomorphism; for every 0 < ε < 1/2, 𝒳*_{Γ(p^∞)}(ε) = GSp_2g(ℤ_p)·𝒳*_{Γ(p^∞)}(ε)_a and 𝒳*_{Γ(p^∞)} is covered by finitely many GSp_2g(ℚ_p)-translates of the affinoid perfectoid 𝒳*_{Γ(p^∞)}(ε)_a. Its boundary 𝒵_{Γ(p^∞)} carries the induced perfectoid structure. Over C (siegel-similitude-comparison): 𝒳*_{Γ(p^∞)} ×_{Spa ℚ_p} Spa C = 𝒳*_{Γ(p^∞)} ×_{Spa ℚ_p^cycl} Spa C⁰(ℤ_p^×, C) is a perfectoid representative (S0 perfectoid-representative) of the Siegel tower (S*_{K^pK′_p})_{K′_p ⊆ GSp_2g(ℚ_p)} of S0 over C, all similitude components included (Γ(pᵐ) cofinal by S0 siegel-level-subgroups), and 𝒳*_{Γ(p^∞)} ⊗̂_{ℚ_p^cycl} C is only its closed fixed-similitude fibre, generally not open.

**Hypotheses and conventions.**

- Siegel setting of Scholze §3: g ≥ 1, p prime, K^p ⊆ GSp_2g(𝔸_f^p) contained in {γ ∈ GSp_2g(Ẑ^p) : γ ≡ 1 mod N} for some N ≥ 3 prime to p; ℚ_p^cycl the completion of ℚ_p(μ_{p^∞}) with ring of integers ℤ_p^cycl; p^ε ∈ ℤ_p^cycl a chosen element of valuation ε.

**Proof route.**

1. 𝒳*_{Γ(p^∞)}(ε) = GSp_2g(ℤ_p)·𝒳*_{Γ(p^∞)}(ε)_a (stated without proof in Scholze's proof of Corollary 3.3.12), checked at level Γ(p): at a point of the good-reduction part, the weak canonical subgroup C ⊆ A[p] is Lagrangian (T3), Sp_2g(𝔽_p) acts transitively on Lagrangians and some Lagrangian is transversal to C, so some γ ∈ Sp_2g(ℤ_p) moves the point into {D ∩ C = 0} = 𝒳*_{Γ(p)}(ε)_a (anticanonical-locus-level-p, anticanonical-tower); the translates of 𝒳*_{Γ(p)}(ε)_a are open and closed in 𝒳*_{Γ(p)}(ε), so the complement of their union is open and contained in the boundary, which has no interior; hence it is empty.
2. A subset of |𝒳*_{Γ(p^∞)}| is affinoid perfectoid if it is the preimage of an affinoid at all large finite levels with perfectoid completed colimit (Scholze Definition 3.3.5; PerfectoidSpaces:P7/good-affinoid-perfectoid); 𝒳*_{Γ(p^∞)}(ε)_a is such by full-level-anticanonical-perfectoid, and the condition is GSp_2g(ℚ_p)-stable.
3. By translates-cover-tower (Lemma 3.3.11) finitely many translates cover; glue by PerfectoidSpaces:P7/tilde-limit-gluing (iii), the torsion-paper form.
4. Uniqueness: PerfectoidSpaces:P7/tilde-limit-perfectoid-uniqueness. Over C: siegel-similitude-comparison (ii), applied to this tilde-limit, with the Γ(pᵐ) cofinality witness (PerfectoidSpaces:P7/tilde-limit-cofinal-change).

**Acceptance instances.**

- For g = 1 and K^p = K(N)^p this is the part of the perfectoid modular curve of tame level K(N)^p on which the Weil pairing of α is the fixed ζ_{p^∞}: π₀ of its base change to C is (ℤ/N)^×, while the S0 tower has π₀ = ℤ_p^× × (ℤ/N)^× (siegel-similitude-comparison).

**Direct prerequisites.** `PerfectoidShimuraVarieties:S1/translates-cover-tower`, `PerfectoidShimuraVarieties:S1/full-level-anticanonical-perfectoid`, `PerfectoidShimuraVarieties:S1/anticanonical-locus-level-p`, `PerfectoidShimuraVarieties:S1/anticanonical-tower`, `PerfectoidShimuraVarieties:S1/siegel-similitude-comparison`, `HodgeTateAndCanonicalSubgroups:T3/canonical-subgroup`, `HodgeTateAndCanonicalSubgroups:T3/canonical-subgroup-theorem`, `HodgeTateAndCanonicalSubgroups:T3/canonical-subgroup-properties`, `HodgeTateAndCanonicalSubgroups:T3/quotient-hasse-radius`, `HodgeTateAndCanonicalSubgroups:T3/section-rigidity`, `PerfectoidShimuraVarieties:S0/perfectoid-representative`, `PerfectoidShimuraVarieties:S0/siegel-level-subgroups`, `PerfectoidSpaces:P7/good-affinoid-perfectoid`, `PerfectoidSpaces:P7/tilde-limit-gluing`, `PerfectoidSpaces:P7/tilde-limit-cofinal-change`, `PerfectoidSpaces:P7/tilde-limit-perfectoid-uniqueness`.

**Sources.**

- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §3.3.2, Corollary 3.3.12 with proof, p. 1009. Proof of Corollary 3.3.12.
- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §3.3.1, after Definition 3.3.5, p. 1006. Equivariance of the affinoid perfectoid condition.

### The Siegel Hodge–Tate period map as a map of adic spaces, extended over the boundary

Target `PerfectoidShimuraVarieties:S1/siegel-hodge-tate-period-map` (construction).

There is a unique map of adic spaces π_HT: 𝒳*_{Γ(p^∞)} ∖ 𝒵_{Γ(p^∞)} → Fl over ℚ_p realising the Hodge–Tate filtration functorially on perfectoid test spaces (and hence inducing |π_HT|) (Corollary 3.3.13). For every open U ⊆ Fl containing Fl(ℚ_p) there is ε > 0 with 𝒳*_{Γ(p^∞)}(ε) ∖ 𝒵_{Γ(p^∞)}(ε) ⊆ π_HT⁻¹(U) (Lemma 3.3.15), and there is 0 < ε < 1/2 with 𝒳*_{Γ(p^∞)}(ε)_a ∖ 𝒵_{Γ(p^∞)}(ε)_a ⊆ π_HT⁻¹(Fl_{g+1,…,2g}) (Lemma 3.3.16). π_HT extends uniquely to a GSp_2g(ℚ_p)-equivariant map of adic spaces π_HT: 𝒳*_{Γ(p^∞)} → Fl (Corollary 3.3.17). The action convention: GSp_2g(ℚ_p) acts on 𝒳*_{Γ(p^∞)} on the right by x·γ: α ↦ γ⁻¹ ∘ α (S0's right translations, transported by siegel-similitude-comparison; semilinear over ℚ_p^cycl), and equivariance means π_HT(x·γ) = γ⁻¹·π_HT(x) for the standard left action of GSp_2g(ℚ_p) on Fl, equivalently π_HT(x·γ) = π_HT(x)·γ for the right action W·γ := γ⁻¹W; the conventions of S3 (FL = P_μ\G, BP's x ↦ x⁻¹) are compared there.

**Hypotheses and conventions.**

- Siegel setting of Scholze §3: g ≥ 1, p prime, K^p ⊆ GSp_2g(𝔸_f^p) contained in {γ ∈ GSp_2g(Ẑ^p) : γ ≡ 1 mod N} for some N ≥ 3 prime to p; ℚ_p^cycl the completion of ℚ_p(μ_{p^∞}) with ring of integers ℤ_p^cycl; p^ε ∈ ℤ_p^cycl a chosen element of valuation ε.
- The extension over the boundary rests on the goodness of the boundary triple (full-level-anticanonical-perfectoid) and on boundedness of the Plücker coordinates on the anticanonical neighbourhood.

**Proof route.**

1. Corollary 3.3.13: uniqueness from the functorial Hodge–Tate filtration and descent, rather than from the underlying topological map alone; existence as in Lemma 3.3.4 from the pro-étale local filtration, which is a map of adic spaces on a perfectoid cover and descends.
2. Lemmas 3.3.15–3.3.16: from rational-flags-preimage by compactness, as in translates-cover-tower.
3. Corollary 3.3.17: on 𝒳*_{Γ(p^∞)}(ε)_a the Plücker coordinates s_{J'}/s_{g+1,…,2g} are bounded functions on the complement of the boundary (Lemma 3.3.16), hence extend uniquely across the boundary by goodness of the triple; translate by GSp_2g(ℚ_p) and glue using translates-cover-tower.

**Planning API.**

- `SiegelTorsion.htMap` (constructor): π_HT: 𝒳*_{Γ(p^∞)} → Fl, a map of adic spaces over ℚ_p.
- `SiegelTorsion.htMap_top` (compatibility): The underlying continuous map on the complement of the boundary is |π_HT| of continuous-hodge-tate-map.
- `SiegelTorsion.htMap_unique` (extensionality): Any two maps of adic spaces 𝒳*_{Γ(p^∞)} → Fl agreeing on the complement of the boundary are equal.
- `SiegelTorsion.htMap_equivariant` (functoriality): π_HT(x·γ) = γ⁻¹·π_HT(x) for γ ∈ GSp_2g(ℚ_p), i.e. π_HT ∘ T_γ = (W ↦ γ⁻¹W) ∘ π_HT, with x·γ: α ↦ γ⁻¹ ∘ α the right action of siegel-similitude-comparison.
- `SiegelTorsion.htMap_anticanonical` (characterisation): For small ε > 0, π_HT(𝒳*_{Γ(p^∞)}(ε)_a) ⊆ Fl_{g+1,…,2g}.
- `SiegelTorsion.htMap_neighbourhood` (characterisation): For every open U ⊇ Fl(ℚ_p) there is ε > 0 with 𝒳*_{Γ(p^∞)}(ε) ⊆ π_HT⁻¹(U) away from the boundary.

**Unit tests.**

- `htMap_g1_cusps_rational` (computation): For g = 1, the image of every cusp of 𝒳*_{Γ(p^∞)} is a point of ℙ¹(ℚ_p).
- `htMap_anticanonical_chart` (computation): For g = 1 and small ε, π_HT(𝒳*_{Γ(p^∞)}(ε)_a) ⊆ {|x| ≤ 1}-type chart Fl_{2} of ℙ¹ (the chart J = {2}).
- `htMap_not_finite_level` (non-example): π_HT does not factor through any finite level 𝒳*_{Γ(pᵐ)}: the fibres of 𝒳*_{Γ(p^∞)} → 𝒳*_{Γ(pᵐ)} (a map over ℚ_p^cycl) are orbits of Γ(pᵐ) ∩ Sp_2g(ℤ_p) (elements with c ≠ 1 move the structure map to Spa ℚ_p^cycl), on which π_HT is the nonconstant action W ↦ γ⁻¹W on flags.
- `htMap_equivariant_center` (degenerate): Scalars z ∈ ℚ_p^× ⊆ GSp_2g(ℚ_p) act trivially on Fl, so π_HT is invariant under the central action.

**Acceptance instances.**

- For g = 1, π_HT: 𝒳*_{Γ(p^∞)} → ℙ¹ sends cusps to ℙ¹(ℚ_p) and the anticanonical neighbourhood into the affinoid where the coordinate x is bounded (Fl_{2}).

**Direct prerequisites.** `PerfectoidShimuraVarieties:S1/continuous-hodge-tate-map`, `PerfectoidShimuraVarieties:S1/rational-flags-preimage`, `PerfectoidShimuraVarieties:S1/translates-cover-tower`, `PerfectoidShimuraVarieties:S1/perfectoid-siegel-space`, `PerfectoidShimuraVarieties:S1/full-level-anticanonical-perfectoid`, `PerfectoidShimuraVarieties:S1/siegel-similitude-comparison`, `HodgeTateAndCanonicalSubgroups:T2/abelian-hodge-tate-sequence`, `HodgeTateAndCanonicalSubgroups:T2/relative-hodge-tate-sequence`, `HodgeTateAndCanonicalSubgroups:T2/hodge-tate-flag-point`.

**Sources.**

- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §3.3.2, Corollary 3.3.13, Lemmas 3.3.14–3.3.16 and Corollary 3.3.17 with proofs, pp. 1009–1012. The boundedness-plus-goodness step extending π_HT.
- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §3.3.2, proof of Corollary 3.3.13, p. 1009. Proof of Corollary 3.3.13.

### Scholze's theorem for Siegel varieties: affinoid perfectoid flag charts and strongly Zariski closed boundary

Target `PerfectoidShimuraVarieties:S1/siegel-main-theorem` (theorem).

For every tame level K^p ⊆ GSp_2g(𝔸_f^p) contained in {γ ∈ GSp_2g(Ẑ^p) : γ ≡ 1 mod N} for some N ≥ 3 prime to p, there is a perfectoid space 𝒳*_{Γ(p^∞),K^p} over ℚ_p^cycl, unique up to unique isomorphism, with 𝒳*_{Γ(p^∞),K^p} ~ lim_m 𝒳*_{Γ(pᵐ),K^p}, a GSp_2g(ℚ_p)-action which does not preserve the structure map to Spa(ℚ_p^cycl): γ acts on ℚ_p^cycl through the unit part u(γ) = c(γ)p^{−v_p(c(γ))} ∈ ℤ_p^× ≅ Gal(ℚ_p^cycl/ℚ_p) of its similitude factor, i.e. the Weil-pairing root of x·γ is the u(γ)-th power of that of x, so exactly the γ with c(γ) ∈ p^ℤ act ℚ_p^cycl-linearly (siegel-similitude-comparison (iii), which also identifies 𝒳*_{Γ(p^∞),K^p} ×_{Spa ℚ_p} Spa C with a perfectoid representative of the S0 Siegel tower over C, compatibly with the actions), and a GSp_2g(ℚ_p)-equivariant map of adic spaces π_HT: 𝒳*_{Γ(p^∞),K^p} → Fl over ℚ_p. (i) For every J ⊆ {1, …, 2g} containing exactly one of i and g + i for each i (so that the coordinate g-plane indexed by J is Lagrangian; these 2^g sets give affinoids Fl_J covering Fl), the preimage 𝒱_J = π_HT⁻¹(Fl_J) = Spa(R_{J,∞}, R_{J,∞}⁺) is affinoid perfectoid, is the preimage of an affinoid 𝒱_{J,m} = Spa(R_{J,m}, R_{J,m}⁺) ⊆ 𝒳*_{Γ(pᵐ),K^p} for all large m, and R_{J,∞}⁺ is the p-adic completion of colim_m R_{J,m}⁺. (ii) 𝒵_{Γ(p^∞),K^p} ∩ 𝒱_J ⊆ 𝒱_J is strongly Zariski closed. (iii) π_HT⁻¹(Fl(ℚ_p)) is the closure of 𝒳*_{Γ(p^∞),K^p}(0) and π_HT⁻¹(Fl_{g+1,…,2g}(ℚ_p)) is the closure of 𝒳*_{Γ(p^∞),K^p}(0)_a (Lemmas 3.3.19–3.3.20, the compactified versions of rational-flags-preimage). The published statement of (i) quantifies over all J of cardinality g; for non-Lagrangian J, Fl_J is not of the required form and the proof does not apply (PerfectoidShimuraVarieties/E2, after PAPER-SCHOLZE-15/E16).

**Hypotheses and conventions.**

- Siegel setting of Scholze §3: g ≥ 1, p prime, K^p ⊆ GSp_2g(𝔸_f^p) contained in {γ ∈ GSp_2g(Ẑ^p) : γ ≡ 1 mod N} for some N ≥ 3 prime to p; ℚ_p^cycl the completion of ℚ_p(μ_{p^∞}) with ring of integers ℤ_p^cycl; p^ε ∈ ℤ_p^cycl a chosen element of valuation ε.
- The J in (i) are the 2^g Lagrangian coordinate subsets.

**Proof route.**

1. Existence and equivariance: perfectoid-siegel-space and siegel-hodge-tate-period-map; uniqueness: PerfectoidSpaces:P7/tilde-limit-perfectoid-uniqueness.
2. (iii) Lemma 3.3.19: for an open U ⊆ Fl containing Fl(ℚ_p), π_HT⁻¹(U) is a quasi-compact open containing 𝒳*_{Γ(p^∞)}(ε) ∖ 𝒵_{Γ(p^∞)}(ε) for some ε > 0 (Lemma 3.3.15, siegel-hodge-tate-period-map), hence containing 𝒳*_{Γ(p^∞)}(ε) (the boundary has no interior, as in Lemma 3.3.11); so π_HT⁻¹(Fl(ℚ_p)) contains the closure of 𝒳*_{Γ(p^∞)}(0), and the converse holds by continuity. Lemma 3.3.20 follows from Lemma 3.3.19 and the proof of Lemma 3.3.14 (rational-flags-preimage).
3. (i) For J = {g+1, …, 2g} (Scholze p. 1014): let x ∈ Fl(ℚ_p) be 0^g ⊕ ℚ_p^g. By (iii), π_HT⁻¹(x) ⊆ 𝒳*_{Γ(p^∞)}(ε)_a for every ε > 0, so there is an open U ∋ x with π_HT⁻¹(U) ⊆ 𝒳*_{Γ(p^∞)}(ε)_a, and ε may be chosen with 𝒳*_{Γ(p^∞)}(ε)_a ⊆ π_HT⁻¹(Fl_{g+1,…,2g}) (Lemma 3.3.16, Corollary 3.3.17). For γ = diag(p, …, p, 1, …, 1), γⁿ(Fl_{g+1,…,2g}) ⊆ U for n ≫ 0 and is a rational subset of Fl_{g+1,…,2g}, so π_HT⁻¹(γⁿFl_{g+1,…,2g}) is a rational subset of the affinoid perfectoid 𝒳*_{Γ(p^∞)}(ε)_a, which satisfies the conditions of (i) with the plus-ring form (full-level-anticanonical-perfectoid). These conditions pass to rational subsets (Scholze, survey Proposition 2.22(ii); PerfectoidSpaces:P7/good-affinoid-perfectoid-basis) and are GSp_2g(ℚ_p)-stable; by the equivariance law π_HT⁻¹(Fl_{g+1,…,2g}) = π_HT⁻¹(γⁿFl_{g+1,…,2g})·γⁿ, which gives J = {g+1, …, 2g}. (A cover of 𝒱_J by translates of anticanonical neighbourhoods would not show that 𝒱_J is affinoid.) The other Lagrangian J are translates by Weyl-group elements of GSp_2g(ℤ_p) (PAPER-SCHOLZE-15/E16).
4. (ii) From gamma0-boundary-strongly-zariski-closed and base change of strongly Zariski closed immersions (PerfectoidSpaces:P4/zariski-closed-base-change).

**Acceptance instances.**

- g = 1: the two charts J = {1}, {2} of ℙ¹ have affinoid perfectoid preimages in the perfectoid modular curve, each coming from finite level, and the cusps are strongly Zariski closed in them.
- The statement agrees with Theorem 3.1.2 of the source with the J restricted to Lagrangian subsets.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S1/perfectoid-siegel-space`, `PerfectoidShimuraVarieties:S1/siegel-hodge-tate-period-map`, `PerfectoidShimuraVarieties:S1/gamma0-boundary-strongly-zariski-closed`, `PerfectoidShimuraVarieties:S1/rational-flags-preimage`, `PerfectoidShimuraVarieties:S1/full-level-anticanonical-perfectoid`, `PerfectoidShimuraVarieties:S1/translates-cover-tower`, `PerfectoidShimuraVarieties:S1/siegel-similitude-comparison`, `PerfectoidSpaces:P7/tilde-limit-perfectoid-uniqueness`, `PerfectoidSpaces:P7/good-affinoid-perfectoid-basis`, `PerfectoidSpaces:P4/zariski-closed-base-change`, `PerfectoidShimuraVarieties:S0/perfectoid-representative`.

**Sources.**

- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §3.3.3, proof of Theorem 3.3.18(i), p. 1014. The contraction into the anticanonical chart.
- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §3.3.3, Lemmas 3.3.19–3.3.20 with proof, p. 1013. The compactified versions of Lemmas 3.3.6 and 3.3.14.
- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §3.3.3, Theorem 3.3.18 (existence, (i), (ii)) with proof, pp. 1012–1014. The step from the anticanonical chart to rational subsets.
- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §3.1, Theorem 3.1.2 and footnote 7, pp. 971–972. The GSp_2g(ℚ_p)-action is semilinear over ℚ_p^cycl.

### The toroidally compactified Siegel tower with fixed cone decomposition is perfectoid

Target `PerfectoidShimuraVarieties:S1/perfectoid-toroidal-siegel-tower` (theorem).

Let K^p be neat (contained in a level-N subgroup, N ≥ 3 prime to p), K_p ⊆ GSp_2g(ℚ_p) compact open and Σ a K^pK_p-admissible smooth projective cone decomposition. Then the toroidal tower (S^tor_{K^pK'_p,Σ})_{K'_p ⊆ K_p}, formed with the same Σ at every level (S0.general toroidal-tower-diamond), has a perfectoid representative S^tor_{K^p,Σ} ~ lim_{K'_p} S^tor_{K^pK'_p,Σ} (Pilloni–Stroh, Théorème 0.4 and Corollaire A.19, for K_p = Γ(p^{n₀}) and principal levels Γ(pⁿ); cofinality gives all K'_p), and S_{K^p} = S^tor_{K^p,Σ} minus its boundary is the open perfectoid Siegel tower. The perfectoid space is constructed as the generic fibre X(p^∞)^{tor−mod} of the limit of modified formal toroidal models; its comparison with the generic fibre of the limit of the unmodified formal toroidal models is not asserted (Pilloni–Stroh, Remarque A.13).

**Hypotheses and conventions.**

- Siegel setting of Scholze §3: g ≥ 1, p prime, K^p ⊆ GSp_2g(𝔸_f^p) contained in {γ ∈ GSp_2g(Ẑ^p) : γ ≡ 1 mod N} for some N ≥ 3 prime to p; ℚ_p^cycl the completion of ℚ_p(μ_{p^∞}) with ring of integers ℤ_p^cycl; p^ε ∈ ℤ_p^cycl a chosen element of valuation ε.
- Σ fixed at all levels; Pilloni–Stroh work over ℂ_p with principal levels pⁿ, n ≥ n₀.
- Tame level: Pilloni–Stroh's Appendix A is written as if the tame level were K^p = GSp_2g(∏_{q≠p} ℤ_q) ('pour simplifier la rédaction'); for the neat K^p ⊆ K(N)^p used here the same local argument is applied to the boundary charts at level K^p (ShimuraCompactifications C3, C5), an extension the source leaves to the reader.

**Proof route.**

1. Pilloni–Stroh construct the modified toroidal formal models X(pⁿ)^{tor−mod} by normalisation and compare them with Scholze's strange models of the minimal compactification (their Proposition 1.15, Corollaire 1.16, Théorème 1.18, which recovers Scholze's perfectoid minimal compactification).
2. Over boundary strata the local structure is a torus torsor over a lower-genus Siegel tower; the perfectoidization of an affine toric embedding is perfectoid (their Lemme A.16–Proposition A.18), and Frobenius is surjective modulo p on the completed limit (Corollaire A.19).
3. Compatibility with S0's toroidal tower diamond: a tilde-limit gives a diamond isomorphism with the limit (PerfectoidSpaces:P7/represented-functor-comparison).

**Acceptance instances.**

- For g = 1 the toroidal and minimal compactifications coincide and the statement is the perfectoid compactified modular curve.
- Boxer–Pilloni 2026, §3.3, use this space as S^tor_{K^p,Σ} with S_{K^p} the open complement of its boundary.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S1/siegel-main-theorem`, `PerfectoidShimuraVarieties:S0.general/toroidal-tower-diamond`, `PerfectoidShimuraVarieties:S0/perfectoid-representative`, `ShimuraCompactifications:C3/refinement-map`, `ShimuraCompactifications:C3/level-datum-functoriality`, `ShimuraCompactifications:C5/integral-toroidal-space`, `ShimuraCompactifications:C5/higher-level-toroidal-normalization`, `ShimuraCompactifications:C5/integral-minimal-space`, `PerfectoidSpaces:P7/represented-functor-comparison`, `PerfectoidSpaces:P7/tilde-limit-cofinal-change`.

**Sources.**

- [Vincent Pilloni, Benoît Stroh, Cohomologie cohérente et représentations Galoisiennes](https://www.imo.universite-paris-saclay.fr/~pilloni/koko.pdf), Introduction, Théorème 0.4, PDF p. 2. Statement of Théorème 0.4.
- [Vincent Pilloni, Benoît Stroh, Cohomologie cohérente et représentations Galoisiennes](https://www.imo.universite-paris-saclay.fr/~pilloni/koko.pdf), Appendice A, Corollaire A.19, PDF p. 30. Conclusion of the appendix.
- [Vincent Pilloni, Benoît Stroh, Cohomologie cohérente et représentations Galoisiennes](https://www.imo.universite-paris-saclay.fr/~pilloni/koko.pdf), Appendice A, opening paragraph, PDF p. 21. The appendix takes the tame level to be GSp_2g(∏_{q≠p} ℤ_q).
- [George Boxer, Vincent Pilloni, Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §3.3, p. 34. The toroidal perfectoid Siegel space with fixed Σ used by Boxer–Pilloni.

### The open perfectoid Siegel tower, its right action and its finite-level quotients

Target `PerfectoidShimuraVarieties:S1/siegel-open-tower-and-level-quotients` (construction).

Let 𝒳_{Γ(p^∞),K^p} := 𝒳*_{Γ(p^∞),K^p} ∖ 𝒵_{Γ(p^∞),K^p}, the open perfectoid Siegel tower over ℚ_p^cycl with fixed similitude system (the complement of the boundary, not the good-reduction locus 𝒳_{K_p} of siegel-finite-level-spaces), with the right action of GSp_2g(ℚ_p) of siegel-main-theorem, semilinear over ℚ_p^cycl through u(γ) = c(γ)p^{−v_p(c(γ))}. For a compact open K ⊆ GSp_2g(ℤ_p) with c(K) = U_m containing some Γ(pⁿ) (in particular the strict Iwahori level K_{Iw⁺} := {γ ∈ GSp_2g(ℤ_p) : γ mod p lies in the diagonal torus T(𝔽_p) and c(γ) ≡ 1 mod p}, the inverse image of the full diagonal torus modulo p with similitude 1), let 𝒳^{an}_{K,K^p} := 𝒳*_K ∖ 𝒵_K (the open Siegel variety at level KK^p over ℚ_p^cycl with fixed Weil-pairing root ζ_{pᵐ}, siegel-finite-level-spaces) and K¹ := K ∩ ker c. An element k ∈ K with c(k) ≠ 1 does not act ℚ_p^cycl-linearly (Scholze, footnote 7), so the projection is not a K-torsor over ℚ_p^cycl: for n ≥ m with Γ(pⁿ) ⊆ K the finite-level maps 𝒳^{an}_{Γ(pⁿ),K^p} → 𝒳^{an}_{K,K^p} are finite étale Galois with group (K ∩ c⁻¹(1 + pⁿℤ_p))/Γ(pⁿ), and 𝒳_{Γ(p^∞),K^p} → 𝒳^{an}_{K,K^p} is a pro-étale K¹-torsor; 𝒳^{an}_{K,K^p} is the quotient 𝒳_{Γ(p^∞),K^p}/K¹ in the sense that its diamond is the v-sheaf quotient of the diamond of the tower by K¹. After base change along Spa C → Spa ℚ_p it becomes a K-torsor: ((𝒳_{Γ(p^∞),K^p}) ×_{Spa ℚ_p} Spa C)^◇ ≅ S^◇_{K^p,∞} → S^◇_{K^pK} is a pro-étale K-torsor (S0 tower-action-kernel (iii); its kernel Z(ℚ) ∩ K^pK is trivial because N ≥ 3; siegel-similitude-comparison), and its restriction to the closed fixed-similitude fibre, generally not open, 𝒳_{Γ(p^∞),K^p} ⊗̂_{ℚ_p^cycl} C is the K¹-torsor over 𝒳^{an}_{K,K^p} ⊗_{ℚ_p^cycl} C. The strict Iwahori quotient is defined group-theoretically through K_{Iw⁺}, not by choosing g subgroups of order p (which does not determine it: OverconvergentAutomorphicForms sourceIssue E-O8-1).

**Hypotheses and conventions.**

- Siegel setting of Scholze §3: g ≥ 1, p prime, K^p ⊆ GSp_2g(𝔸_f^p) contained in {γ ∈ GSp_2g(Ẑ^p) : γ ≡ 1 mod N} for some N ≥ 3 prime to p; ℚ_p^cycl the completion of ℚ_p(μ_{p^∞}) with ring of integers ℤ_p^cycl; p^ε ∈ ℤ_p^cycl a chosen element of valuation ε.
- K contains some Γ(pⁿ) and has c(K) = U_m, so that the level-K space lives over ℚ(ζ_{pᵐ}) and is base changed to ℚ_p^cycl along the fixed ζ_{pᵐ}.
- Here U_0 = ℤ_p^× and U_m = ker(ℤ_p^× → (ℤ/pᵐ)^×) = 1 + pᵐℤ_p for m ≥ 1. The formula 1 + ℤ_p is not used as a unit subgroup.

**Proof route.**

1. Finite levels: for n ≥ m with Γ(pⁿ) ⊆ K put K_n := K ∩ c⁻¹(1 + pⁿℤ_p). Its elements fix the Weil-pairing root ζ_{pⁿ}, so they act ℚ(ζ_{pⁿ})-linearly on X_{Γ(pⁿ)K^p}, freely by S0 tower-action-kernel (ii) with Z(ℚ) ∩ K^pK = {1} (N ≥ 3); the quotient is X_{KK^p} ⊗_{ℚ(ζ_{pᵐ})} ℚ(ζ_{pⁿ}), as [K : K_n] = [ℚ(ζ_{pⁿ}) : ℚ(ζ_{pᵐ})]. Base change along ℚ(ζ_{pⁿ}) → ℚ_p^cycl gives the finite étale Galois covers with group K_n/Γ(pⁿ), on the open Shimura variety (not only on the good-reduction locus).
2. Limit: c: Γ(pⁿ) → 1 + pⁿℤ_p is surjective (diag(1_g, u·1_g)), so lim_n K_n/Γ(pⁿ) = K¹ and 𝒳_{Γ(p^∞),K^p} → 𝒳^{an}_{K,K^p} is a pro-étale K¹-torsor (as in S0 infinite-level-diamond (v)); the diamond of 𝒳^{an}_{K,K^p} is the quotient by K¹ since a pro-étale torsor is a v-cover.
3. Over C: siegel-similitude-comparison (ii)–(iii) and S0 tower-action-kernel (iii); k ∈ K maps the part {w = 1} to {w = c(k)}, so the stabiliser of the fixed-similitude part is K¹.
4. The strict Iwahori subgroup is K_{Iw⁺} as defined; it contains Γ(p) with K_{Iw⁺}/Γ(p) ≅ T(𝔽_p) ∩ {c = 1}.

**Planning API.**

- `SiegelTorsion.openTower` (data): 𝒳_{Γ(p^∞),K^p} = 𝒳*_{Γ(p^∞),K^p} ∖ 𝒵_{Γ(p^∞),K^p}.
- `SiegelTorsion.strictIwahori` (constructor): K_{Iw⁺} as the inverse image of the diagonal torus (with similitude 1) modulo p.
- `SiegelTorsion.openTower_torsor` (characterisation): 𝒳_{Γ(p^∞),K^p} → 𝒳_{K,K^p} is a pro-étale K¹-torsor, K¹ = K ∩ ker c, for K ⊇ Γ(pⁿ) with c(K) = U_m; after ×_{Spa ℚ_p} Spa C the corresponding map S^◇_{K^p,∞} → S^◇_{K^pK} of the S0 tower is a K-torsor.
- `SiegelTorsion.openTower_quotient` (equivalence): (𝒳_{Γ(p^∞),K^p})^◇/K¹ ≅ 𝒳_{K,K^p}^◇.
- `SiegelTorsion.openTower_action` (instance): The right action of GSp_2g(ℚ_p), semilinear over ℚ_p^cycl through u(γ); its restriction to K¹ is ℚ_p^cycl-linear and is the action of the deck group of the torsor.

**Unit tests.**

- `strictIwahori_quotient_g1` (computation): For g = 1, K_{Iw⁺}/Γ(p) ≅ 𝔽_p^× via diag(a, a⁻¹) ↦ a.
- `strictIwahori_not_subgroups` (non-example): For g = 2, prescribing two order-p subgroups (the coordinate lines of the first two basis vectors modulo p) defines a level containing non-diagonal unipotent elements modulo p, strictly larger than K_{Iw⁺}: the group-theoretic definition is required.
- `openTower_trivial_quotient` (degenerate): For K = Γ(pⁿ), K¹ = Γ(pⁿ) ∩ Sp_2g(ℤ_p) and 𝒳_{Γ(p^∞)} → 𝒳_{Γ(pⁿ)} is a pro-étale (Γ(pⁿ) ∩ Sp_2g(ℤ_p))-torsor, not a Γ(pⁿ)-torsor over ℚ_p^cycl: diag(1_g, (1 + pⁿ)·1_g) ∈ Γ(pⁿ) raises Weil-pairing roots to the power 1 + pⁿ and so covers the nontrivial automorphism σ_{1+pⁿ} of ℚ_p^cycl.
- `openTower_kernel_trivial` (compatibility): After base change to C, K acts freely on S^◇_{K^p,∞}: the kernel computed by PerfectoidShimuraVarieties:S0/tower-action-kernel is trivial for N ≥ 3; hence K¹ acts freely on 𝒳_{Γ(p^∞),K^p}.

**Acceptance instances.**

- For g = 1, K_{Iw⁺} = {(a b; c d) ∈ GL_2(ℤ_p) : b ≡ c ≡ 0, ad ≡ 1 mod p} = Γ₀(p) ∩ Γ⁰(p) ∩ {det ≡ 1 mod p} (with det ≡ 1, Γ₁(p) ∩ Γ⁰(p) would be Γ(p)), K_{Iw⁺}/Γ(p) ≅ {diag(a, a⁻¹)} ≅ 𝔽_p^×, and 𝒳_{K_{Iw⁺}} is the base change to ℚ_p^cycl of the modular curve of classical level Γ₀(p) ∩ Γ⁰(p) (ordered pairs of distinct subgroups of order p), the condition det ≡ 1 being absorbed by the fixed ζ_p.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S1/siegel-main-theorem`, `PerfectoidShimuraVarieties:S1/siegel-similitude-comparison`, `PerfectoidShimuraVarieties:S1/siegel-finite-level-spaces`, `PerfectoidShimuraVarieties:S0/tower-action-kernel`, `PerfectoidShimuraVarieties:S0/infinite-level-diamond`, `PerfectoidShimuraVarieties:S0/siegel-level-subgroups`.

**Sources.**

- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §3.1, Theorem 3.1.2(i), p. 971. The tame level hypothesis that makes the K-action free.
- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §3.1, footnote 7, p. 971. Elements with c ≠ 1 act semilinearly over ℚ_p^cycl, so only K¹ acts by deck transformations.

### The perfectoid modular curve at the cusps: Tate-curve parameter spaces at infinite level

Target `PerfectoidShimuraVarieties:S1/elliptic-cusps-at-infinite-level` (theorem).

Let g = 1, N ≥ 3 prime to p, X* the compactified modular curve over a perfectoid K ⊇ ℚ_p(μ_{p^∞}) of tame level Γ^p with Γ(N) ⊆ Γ^p ⊆ GL_2(ℤ/N), and x a cusp of X* with field L_x and width e_x, with its analytic Tate-curve parameter space D_x ↪ X* (the open disc |q| < 1 with the cusp at q = 0; Heuer Lemma 2.9). Let D_{∞,x} be the open subspace |q| < 1 of Spa(L_x⟨q^{1/p^∞}⟩, 𝒪_{L_x}⟨q^{1/p^∞}⟩), a perfectoid tilde-limit of the discs D_{n,x} with coordinate q^{1/pⁿ}, with 𝒪⁺(D_∞) = 𝒪_L[[q^{1/p^∞}]] (completed). Here Γ₀(p^∞), the Γ₁- and Γ-levels and 𝒳*_{Γ(p^∞)}, 𝒳*_{Γ₁(p^∞)}(ε)_a are Heuer's GL_2 objects over K, with classical level groups and the Weil pairing unrestricted (Heuer Definition 2.7: Γ₀(pᵐ) = {(∗ ∗; c ∗) ∈ GL_2(ℤ_p) : c ≡ 0 mod pᵐ}, so Γ₀(p^∞) is the group of all upper triangular matrices, not S0's {(a b; 0 a⁻¹)}). Heuer's 𝒳*_{Γ(p^∞)} is 𝒳*^{S1}_{Γ(p^∞)} ×_{Spa ℚ_p} Spa K for S1's fixed-similitude space 𝒳*^{S1}_{Γ(p^∞)} (siegel-similitude-comparison (ii) with L = K), a profinite family indexed by a ∈ ℤ_p^× of the closed fibres with Weil-pairing root ζ^a, rather than a coproduct of open fibres, and 𝒳*^{S1}_{Γ(p^∞)} ⊗̂_{ℚ_p^cycl} K is its part a = 1; at the Γ₀- and Γ₁-levels Heuer's spaces are the base changes to K of S1's (the determinant condition being absorbed by the fixed ζ_{pⁿ}). Heuer's GL_2(ℤ_p)-action is the left action γ·x = x·γ^∨, γ^∨ = det(γ)γ⁻¹, i.e. S0's right action by γ^∨ (Heuer §2.7); it multiplies the Weil-pairing root by c(γ^∨) = det γ. Then: (1) there is a Cartesian tower Γ₀(p^∞) × D_{∞,x} → ℤ_p^× × D_{∞,x} → D_{∞,x} → D_x over 𝒳*_{Γ(p^∞)}(ε)_a → 𝒳*_{Γ₁(p^∞)}(ε)_a → 𝒳*_{Γ₀(p^∞)}(ε)_a → 𝒳*(ε), with Γ₀(p^∞) = upper triangular matrices in GL_2(ℤ_p) (as a profinite perfectoid space), the top-left map sending (a b; 0 d) to d; the cusp obtained by specialising at (a b; 0 d) corresponds to the basis (q^{d/p^∞}, ζ_{p^∞}^a q^{−b/p^∞}) of T_pT(q); (2) with the right action of ℤ_p on GL_2(ℤ_p) × D_{∞,x}, (γ, q^{1/pⁿ})·h = (γ(1 0; h 1), q^{1/pⁿ}ζ_{pⁿ}^{h/e_x}), the quotient (GL_2(ℤ_p) × D_{∞,x})/ℤ_p exists as a perfectoid space and there is a Cartesian square with D_x → X* whose left map (GL_2(ℤ_p) × D_{∞,x})/ℤ_p → 𝒳*_{Γ(p^∞)} (Heuer's) is an open immersion, equivariant for left multiplication on the first factor and γ·x = x·γ^∨; the point (γ, q) has Weil-pairing root ζ^{det γ} (for the normalisation e(α⁻¹e_1, α⁻¹e_2) = ζ of Heuer Lemma 2.25), so the restriction (SL_2(ℤ_p) × D_{∞,x})/ℤ_p → 𝒳*^{S1}_{Γ(p^∞)} ⊗̂_{ℚ_p^cycl} K is an SL_2(ℤ_p)-equivariant open immersion into S1's space, SL_2(ℤ_p) acting there by x ↦ x·γ⁻¹; (3) π_HT restricts to the locally constant map (γ = (a b; c d), q) ↦ (b : d) ∈ ℙ¹(ℤ_p). This is the local perfectoid q-disc construction at elliptic cusps that the Siegel argument (Hartogs, codimension ≥ 2) does not provide for g = 1.

**Hypotheses and conventions.**

- g = 1; K contains all p-power roots of unity, with a fixed compatible system ζ_{pⁿ}; 0 ≤ ε small as in S1.
- Scholze leaves the g = 1 compactified case 'to the reader'; Heuer's paper supplies it with elementary means instead of the Hebbarkeitssatz.

**Proof route.**

1. Tame level: the Tate curve T(q^{e_x}) with its Γ^p-structure over 𝒪_{L_x}((q)) gives the open immersion D_x ↪ X* sending the origin to the cusp (Katz–Mazur 8.11.10 for the completion along the cusps; Heuer §2.3).
2. Anticanonical Γ₀(pⁿ)-level: the canonical subgroup of T(q) is μ_{pⁿ}, an anticanonical subgroup is generated by a pⁿ-th root of q, so the cusp chart of 𝒳*_{Γ₀(pⁿ)}(ε)_a is D_n with D_n → D, q^{1/pⁿ} ↦ q (Heuer Proposition 3.8); pass to the limit (Lemma 3.4).
3. Γ₁ and Γ levels: trivialise T_pT(q) by (q^{d/p^∞}, ζ^a q^{−b/p^∞}) (Lemmas 3.13–3.16, Theorem 3.17).
4. (2) translate by GL_2(ℤ_p) using the Γ₀(p)-action on the charts (Proposition 3.19, Theorem 3.22); (3) Proposition 3.20 by Lemma 3.21 (a function constant on points of D_∞ is constant).
5. Comparison with S1: Heuer's finite levels X*_{Γ(pⁿ)} ⊗ K are ⊔_{a ∈ (ℤ/pⁿ)^×} 𝒳*^{S1}_{Γ(pⁿ)} ⊗_{ℚ_p^cycl, σ_a} K (siegel-finite-level-spaces), and in the limit siegel-similitude-comparison (ii) with L = K. On the charts, the cusp labelled (a b; 0 d) has basis (q^{d/p^∞}, ζ^a q^{−b/p^∞}) with Weil pairing ζ^{ad} = ζ^{det γ} (Heuer Theorem 3.17(2)), and γ·x = x·γ^∨ multiplies the Weil-pairing root by det γ, so the part a = 1 is the locus det γ = 1.

**Acceptance instances.**

- The boundary over x of Heuer's perfectoid modular curve is the profinite set GL_2(ℤ_p)/(1 0; ℤ_p 1), with the open neighbourhood (GL_2(ℤ_p) × D_{∞,x})/ℤ_p; the boundary over x of S1's fixed-similitude 𝒳*^{S1}_{Γ(p^∞)} ⊗̂_{ℚ_p^cycl} K is SL_2(ℤ_p)/(1 0; ℤ_p 1), with the open neighbourhood (SL_2(ℤ_p) × D_{∞,x})/ℤ_p.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S1/siegel-main-theorem`, `PerfectoidShimuraVarieties:S1/perfectoid-siegel-space`, `PerfectoidShimuraVarieties:S1/siegel-similitude-comparison`, `PerfectoidShimuraVarieties:S1/siegel-finite-level-spaces`, `ShimuraVarieties:V8/gl2-cusps-tate`, `ShimuraCompactifications:C6/modular-formal-cusp-comparison`, `PerfectoidSpaces:P7/tilde-limit-perfectoid-uniqueness`, `PerfectoidSpaces:P7/limit-of-perfectoid-tower`.

**Sources.**

- [Ben Heuer, Cusps and q-expansion principles for modular curves at infinite level](https://arxiv.org/abs/2002.02488v1), §1.1, Theorem 1.1, and §3, Lemma 3.4, Proposition 3.8, Theorems 3.17 and 3.22, Proposition 3.20, pp. 2–25. The boundary of the perfectoid modular curve over a cusp and its Tate-curve neighbourhood.
- [Ben Heuer, Cusps and q-expansion principles for modular curves at infinite level](https://arxiv.org/abs/2002.02488v1), §2.2, Definition 2.7, p. 8, and §2.7, p. 15. Heuer's classical levels and his left action through γ^∨.
- [Ben Heuer, Cusps and q-expansion principles for modular curves at infinite level](https://arxiv.org/abs/2002.02488v1), §1.1, p. 1. Why the elliptic cusps need a separate construction.

## S2 — Hodge type

Coverage: **planned**.

- Gap: the perfectoidization of integral algebras over perfectoid rings (Bhatt–Scholze 10.11), used for the genuine minimal tower through PerfectoidSpaces P8.
- Request to ShimuraVarieties V8 for the finiteness of the extension of a closed embedding of data to minimal compactifications.
- Request to DiamondsAndVStacks D6: fully faithful perfectoid-to-diamond functor with base/untilt fixed for genuine-to-image-comparison.

### The symplectic embedding and the comparison of finite levels with their Siegel images

Target `PerfectoidShimuraVarieties:S2/hodge-type-embedding-and-siegel-comparison` (construction).

Let (G, X) be of Hodge type with a fixed embedding ι: (G, X) ↪ (G′, X′) = (GSp_2g, H_g^±) and reflex field E. For compact open K ⊆ G(𝔸_f) and K′ ⊆ G′(𝔸_f) with K = K′ ∩ G(𝔸_f), ι induces finite morphisms Sh_K(G, X) → Sh_{K′}(G′, X′) ⊗_ℚ E and Sh*_K(G, X) → Sh*_{K′}(G′, X′) ⊗_ℚ E of canonical models and of their minimal compactifications over E, compatible with level maps and right translations; for every K there is such a K′ (chosen sufficiently small among compact open neighbourhoods of K in G′(𝔸_f); an arbitrary identity neighbourhood need not contain the fixed K) for which Sh_K → Sh_{K′} ⊗ E is a closed immersion (Deligne, Travaux de Shimura, Proposition 1.15, descended to E by the canonical-model property), and then the boundary of the image of Sh*_K is the intersection of the image with the boundary of Sh*_{K′} (the extended map preserves interiors and boundaries). The tame-level hypothesis of Scholze (K^p inside the level-N subgroup of G′(𝔸_f^p), N ≥ 3 prime to p) is a choice of such K′^p.

**Hypotheses and conventions.**

- (G, X) a Shimura datum of Hodge type in Deligne's setup (ShimuraData:D4/hodge-type): a closed embedding ι: (G, X) ↪ (GSp_2g, H_g^±) into a Siegel datum, fixed once and for all; Scholze's (G, D) ↪ (Sp_2g, D) setup is the restriction to a connected component and is not used for statements.
- The finiteness of the extension of ι to minimal compactifications and the boundary compatibility are not proved in Scholze (§4.1) or Hansen–Johansson (p. 34); they are requested from ShimuraVarieties V8 (extension of datum morphisms to minimal compactifications), whose node minimal-map-extension states finiteness only for level maps.

**Proof route.**

1. Datum functoriality of canonical models gives the morphism over E (ShimuraVarieties:V8/datum-functoriality); its finiteness on open parts holds because it is proper and quasi-finite on points (Deligne 1.15 argument).
2. Extension to minimal compactifications and finiteness: ShimuraVarieties:V8/minimal-map-extension for admissible datum morphisms (request for the finiteness and boundary compatibility for closed embeddings of data).
3. Closed immersion for small K′: Deligne's Proposition 1.15 over ℂ, descended to E by uniqueness of canonical models (ShimuraVarieties:V6/hodge-inheritance).

**Planning API.**

- `HodgeTower.embedding` (data): The fixed embedding ι: (G, X) ↪ (GSp_2g, H_g^±).
- `HodgeTower.toSiegel` (constructor): The finite map Sh*_K(G, X) → Sh*_{K′}(G′, X′) ⊗ E for K = K′ ∩ G(𝔸_f).
- `HodgeTower.toSiegel_isClosedImmersion` (characterisation): On open parts, a closed immersion for all sufficiently small K′ with K = K′ ∩ G(𝔸_f).
- `HodgeTower.toSiegel_boundary` (characterisation): The preimage of the Siegel boundary is the boundary of Sh*_K.
- `HodgeTower.toSiegel_comp` (functoriality): Compatibility with level maps and right translations by G(𝔸_f) ⊆ G′(𝔸_f).
- `HodgeTower.toSiegel_finite` (characterisation): The map of minimal compactifications is finite.

**Unit tests.**

- `toSiegel_identity` (degenerate): For ι = id on the Siegel datum, toSiegel is the identity at every level.
- `toSiegel_hilbert` (computation): For F real quadratic and the trace embedding, the image of the Hilbert modular surface in the Siegel threefold is the Humbert surface of discriminant d_F.
- `toSiegel_not_closed_large_level` (non-example): For K′ = GSp_4(Ẑ)-type maximal level, the map from the Hilbert modular surface is generically 2 : 1 onto its image (the Galois involution of F/ℚ), so the closed-immersion statement needs K′ small.
- `toSiegel_points` (compatibility): On ℂ-points the map is [x, a] ↦ [ι(x), ι(a)] between the double-coset descriptions of ShimuraVarieties:V1/analytic-points.

**Acceptance instances.**

- For the Siegel datum itself with ι = id, every map is the identity.
- For the Hilbert datum G* ⊆ Res_{F/ℚ}GL_2 with the trace form embedding (ShimuraData:D5/hilbert-trace-embedding), the map is the forgetful map from Hilbert–Blumenthal abelian varieties to principally polarized abelian varieties of dimension [F : ℚ].

**Direct prerequisites.** `ShimuraData:D4/hodge-type`, `ShimuraVarieties:V8/datum-functoriality`, `ShimuraVarieties:V8/minimal-map-extension`, `ShimuraVarieties:V6/hodge-inheritance`, `ShimuraVarieties:V1/analytic-points`, `PerfectoidShimuraVarieties:S0/p-level-tower`, `ShimuraVarieties:V8`.

**Sources.**

- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §4.1, first paragraphs and footnote 15, p. 1018. Dependence on the embedding.
- [Ana Caraiani, Peter Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://arxiv.org/abs/1511.02418v1), §2.1, Example 2.1.1 and the following paragraph, p. 11. Closed embedding over the reflex field after shrinking the Siegel level.

### Scholze's image compactification and its relation to the minimal compactification

Target `PerfectoidShimuraVarieties:S2/image-compactification` (construction).

In the situation of hodge-type-embedding-and-siegel-comparison, for K ⊆ G(𝔸_f) the image compactification X^{*̲}_K is the universal finite target over which Sh*_K → Sh*_{K′} ⊗ E factors for all K′ with K = K′ ∩ G(𝔸_f): the scheme-theoretic image of Sh*_K in Sh*_{K′} ⊗ E for every sufficiently small such K′ (the images stabilise because the subalgebras of the pushforward of 𝒪 form an increasing chain of coherent subalgebras). The tower (X^{*̲}_K)_K carries the right action of G(𝔸_f). The finite map Sh*_K → X^{*̲}_K is an isomorphism over the open Shimura variety, and Sh*_K is the normalisation of X^{*̲}_K (Sh*_K is normal and the map is finite and birational). The boundary of X^{*̲}_K is the preimage of the Siegel boundary. Whether Sh*_K → X^{*̲}_K is an isomorphism is not known in general (Scholze, §4.1): X^{*̲} is an auxiliary compactification, distinct from the canonical minimal one.

**Hypotheses and conventions.**

- (G, X) a Shimura datum of Hodge type in Deligne's setup (ShimuraData:D4/hodge-type): a closed embedding ι: (G, X) ↪ (GSp_2g, H_g^±) into a Siegel datum, fixed once and for all; Scholze's (G, D) ↪ (Sp_2g, D) setup is the restriction to a connected component and is not used for statements.
- Scholze writes the image compactification with an underlined asterisk; the image of the boundary is Zariski closed.

**Proof route.**

1. Noetherianity: the images of 𝒪_{Sh*_{K′}} in the pushforward of 𝒪_{Sh*_K} increase as K′ shrinks and stabilise; the stable value defines X^{*̲}_K, independent of K′ thereafter.
2. Over the open part, Sh_K → Sh_{K′} ⊗ E is a closed immersion for small K′, so the image compactification contains Sh_K as a dense open and the map is an isomorphism there.
3. Normality of Sh*_K plus finiteness and birationality identify Sh*_K with the normalisation of X^{*̲}_K (Pilloni–Stroh state this in §2.1).

**Planning API.**

- `HodgeTower.imageCompactification` (data): The tower K ↦ X^{*̲}_K with its right G(𝔸_f)-action.
- `HodgeTower.minToImage` (constructor): The finite map Sh*_K → X^{*̲}_K, compatible in K.
- `HodgeTower.minToImage_isNormalization` (characterisation): Sh*_K is the normalisation of X^{*̲}_K.
- `HodgeTower.minToImage_iso_open` (characterisation): The map is an isomorphism over Sh_K.
- `HodgeTower.imageCompactification_boundary` (characterisation): The boundary of X^{*̲}_K is its intersection with the Siegel boundary.
- `HodgeTower.imageCompactification_stable` (other): X^{*̲}_K is the scheme-theoretic image in Sh*_{K′} ⊗ E for all sufficiently small K′ with K = K′ ∩ G(𝔸_f).

**Unit tests.**

- `imageCompactification_siegel` (degenerate): For ι = id, X^{*̲}_K = Sh*_K and minToImage is the identity.
- `imageCompactification_curve` (computation): For a compact Shimura curve (no boundary) minToImage: Sh*_K = Sh_K → X^{*̲}_K is an isomorphism, and for the modular curve with ι = id it is the identity of the modular curve's minimal compactification.
- `imageCompactification_not_normal` (non-example): The image of a normal projective variety under a finite birational map need not be normal (the cuspidal cubic is the image of ℙ¹), so X^{*̲}_K is not asserted to be normal and is not identified with Sh*_K.
- `imageCompactification_open_compat` (compatibility): Restricted to the open Shimura variety, X^{*̲}_K is Sh_K, the S0 tower at level K.

**Acceptance instances.**

- For the Siegel datum, X^{*̲}_K = Sh*_K.
- For a compact Shimura curve (G^ad anisotropic over ℚ, so Sh*_K = Sh_K) minToImage is an isomorphism, because it is an isomorphism over the open Shimura variety, which is everything; for the modular curve with ι = id it is the identity. For a non-identity embedding of the modular curve, cusps may be identified in the image and X^{*̲}_K is not known to be normal, so no isomorphism is asserted.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S2/hodge-type-embedding-and-siegel-comparison`, `PerfectoidShimuraVarieties:S0/p-level-tower`, `ShimuraVarieties:V8/minimal-descent`, `ShimuraVarieties:V2/baily-borel`.

**Sources.**

- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §4.1, second and third paragraphs and footnote 16, p. 1018. The closed-embedding statement is known only for the open varieties, which forces the image compactification.
- [David Hansen, Christian Johansson, Perfectoid Shimura varieties and the Calegari–Emerton conjectures](https://arxiv.org/abs/2011.03951v2), §5.2, remark after Proposition 5.14, p. 34. The genuine and ad hoc compactifications are different objects.

### The open Hodge-type tower is perfectoid

Target `PerfectoidShimuraVarieties:S2/hodge-open-perfectoid-tower` (theorem).

Let (G, X) be of Hodge type with the embedding ι, and let K^p ⊆ G(𝔸_f^p) be contained in K′^p ∩ G(𝔸_f^p) for K′^p ⊆ GSp_2g(𝔸_f^p) inside a level-N subgroup with N ≥ 3 prime to p, small enough that the finite levels embed (Caraiani–Scholze's 'sufficiently small'). Then the open tower (S_{K^pK_p})_{K_p} of S0, base changed to C, has a perfectoid representative S_{K^p} ~ lim_{K_p} S_{K^pK_p} (S0 perfectoid-representative), Zariski closed in the open perfectoid Siegel tower; equivalently S^◇_{K^p,∞} is representable by a perfectoid space. Remark: Caraiani–Scholze's Theorem 2.1.2 states the open tower over E_𝔭 (a perfectoid space mapping to Spa E_𝔭); that form is not asserted here, since S1 supplies the Siegel tower only over ℚ_p^cycl and C.

**Hypotheses and conventions.**

- (G, X) a Shimura datum of Hodge type in Deligne's setup (ShimuraData:D4/hodge-type): a closed embedding ι: (G, X) ↪ (GSp_2g, H_g^±) into a Siegel datum, fixed once and for all; Scholze's (G, D) ↪ (Sp_2g, D) setup is the restriction to a connected component and is not used for statements.
- K^p sufficiently small in the above sense; Hansen–Johansson (genuine-minimal tower) remove this condition.

**Proof route.**

1. The open Siegel tower of S0 over C is perfectoid at every level K′_p ⊆ GSp_2g(ℚ_p): PerfectoidShimuraVarieties:S1/siegel-open-tower-and-level-quotients over ℚ_p^cycl, transported to the S0 Siegel tower over C (all similitude components, all levels) by PerfectoidShimuraVarieties:S1/siegel-similitude-comparison; this is Scholze's 'tensoring with C over ℚ_p^cycl, and passing to a connected component'.
2. For small K′ the finite levels of the Hodge-type tower are closed subvarieties of the Siegel ones (hodge-type-embedding-and-siegel-comparison); apply PerfectoidSpaces:P8/closed-loci-in-towers (compatible closed subvarieties of a perfectoid tower have a perfectoid, Zariski closed tilde-limit).
3. The level systems: ι⁻¹ of a cofinal system of Siegel levels is cofinal in G(ℚ_p) (PerfectoidSpaces:P7/tilde-limit-cofinal-change).

**Acceptance instances.**

- For the Siegel datum it is the open perfectoid Siegel tower.
- For a unitary PEL datum it is the tower used by Caraiani–Scholze.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S2/hodge-type-embedding-and-siegel-comparison`, `PerfectoidShimuraVarieties:S1/siegel-open-tower-and-level-quotients`, `PerfectoidShimuraVarieties:S1/siegel-main-theorem`, `PerfectoidShimuraVarieties:S1/siegel-similitude-comparison`, `PerfectoidSpaces:P8/closed-loci-in-towers`, `PerfectoidSpaces:P8/closed-subvariety-pullback-is-zariski-closed`, `PerfectoidSpaces:P7/tilde-limit-cofinal-change`, `PerfectoidShimuraVarieties:S0/perfectoid-representative`.

**Sources.**

- [Ana Caraiani, Peter Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://arxiv.org/abs/1511.02418v1), §2.1, Theorem 2.1.2 and footnote 8, pp. 11–12. Caraiani–Scholze import Scholze's Theorem 4.1.1 into the Deligne setup.
- [Ana Caraiani, Peter Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://arxiv.org/abs/1511.02418v1), §2.1, Theorem 2.1.2, p. 12. The open tower statement.

### Scholze's Hodge-type theorem for the image compactification

Target `PerfectoidShimuraVarieties:S2/hodge-image-compactified-tower` (theorem).

In the situation of hodge-open-perfectoid-tower (K^p contained in the level-N subgroup of G′ for some N ≥ 3 prime to p), there is a perfectoid space 𝒳^{*̲}_{K^p} over C with 𝒳^{*̲}_{K^p} ~ lim_{K_p} 𝒳^{*̲}_{K_pK^p}. (i) For every Lagrangian coordinate subset J ⊆ {1, …, 2g}, the preimage 𝒱_J of the Siegel chart 𝒴*_{K′^p}(J) = π_HT^{Siegel,−1}(Fl_J) is affinoid perfectoid, 𝒱_J = Spa(R_{J,∞}, R_{J,∞}⁺), it is the preimage of an affinoid 𝒱_{J,K_p} ⊆ 𝒳^{*̲}_{K_pK^p} for all sufficiently small K_p, and R_{J,∞}⁺ is the p-adic completion of colim_{K_p} R_{J,K_p}⁺. (ii) The boundary 𝒵_{K^p} ⊆ 𝒳^{*̲}_{K^p} satisfies: 𝒵_{K^p} ∩ 𝒱_J ⊆ 𝒱_J is strongly Zariski closed. The structure sheaf is that of the perfectoidization of the Zariski closed loci (PerfectoidSpaces:P8/closed-loci-in-towers), not the restriction of the Siegel structure sheaf: the tower is not merely a closed subset of the perfectoid Siegel space.

**Hypotheses and conventions.**

- (G, X) a Shimura datum of Hodge type in Deligne's setup (ShimuraData:D4/hodge-type): a closed embedding ι: (G, X) ↪ (GSp_2g, H_g^±) into a Siegel datum, fixed once and for all; Scholze's (G, D) ↪ (Sp_2g, D) setup is the restriction to a connected component and is not used for statements.
- K^p inside the level-N subgroup of G′(𝔸_f^p), N ≥ 3 prime to p; the limit in Scholze's proof runs over K^p ⊆ K′^p ⊆ G′(𝔸_f^p) (the published text prints G(𝔸_f^p); PAPER-SCHOLZE-15/E6).
- The integral identification of R_{J,∞}⁺ in (i) is asserted as 'easy to deduce' in the source (PAPER-SCHOLZE-15/E7); it is supplied by PerfectoidSpaces:P8/closed-loci-in-towers.

**Proof route.**

1. Siegel case: S1 siegel-main-theorem over ℚ_p^cycl, transported to the S0 Siegel tower over C at all levels K′_p ⊆ G′(ℚ_p) and on all similitude components by PerfectoidShimuraVarieties:S1/siegel-similitude-comparison (Scholze's 'tensoring with C over ℚ_p^cycl, and passing to a connected component').
2. For J Lagrangian, 𝒴*_{K^p}(J) = lim_{K^p ⊆ K′^p} 𝒴*_{K′^p}(J) is affinoid perfectoid (S1 (i)); the preimage of X^{*̲}_{K_pK^p} ↪ Sh*_{K′_pK′^p} is Zariski closed in it; PerfectoidSpaces:P8/closed-loci-in-towers gives an affinoid perfectoid Zariski closed limit with dense image of the finite-level rings and the tilde-limit property, and the strongly Zariski closed boundary by base change (PerfectoidSpaces:P4/zariski-closed-base-change, PerfectoidQuotients Q4).
3. Glue over J by PerfectoidSpaces:P7/tilde-limit-gluing.

**Acceptance instances.**

- For the Siegel datum it is S1 siegel-main-theorem over C.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S2/image-compactification`, `PerfectoidShimuraVarieties:S1/siegel-main-theorem`, `PerfectoidShimuraVarieties:S1/siegel-similitude-comparison`, `PerfectoidSpaces:P8/closed-loci-in-towers`, `PerfectoidSpaces:P4/zariski-closed-base-change`, `PerfectoidQuotients:Q4/zariski-closed-subsets-are-strongly-zariski-closed`, `PerfectoidSpaces:P7/tilde-limit-gluing`, `PerfectoidShimuraVarieties:S0/perfectoid-representative`.

**Sources.**

- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §4.1, Theorem 4.1.1 (existence, (i), (ii)) and its proof, pp. 1018–1020. First step of the proof.
- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §4.1, proof of Theorem 4.1.1, p. 1020. The boundary statement by pullback.

### The Siegel minimal tower is perfectoid at every tame level

Target `PerfectoidShimuraVarieties:S2/siegel-tame-level-removal` (lemma).

For every compact open K^p ⊆ GSp_2g(𝔸_f^p) (no condition at N), the minimally compactified Siegel tower lim_{K_p} 𝒮*^◇_{K^pK_p} over C (the S0 p-level tower of the Siegel datum) is a perfectoid space, covered by finitely many GSp_2g(ℚ_p)-translates of affinoid perfectoid subsets 𝒮*_{K^p}(ε)_a ⊆ 𝒮*_{K^p}(ε′)_a (0 < ε < ε′ < 1/2) with the closure of the first contained in the second, each pulled back from a finite level.

**Hypotheses and conventions.**

- K^p arbitrary; choose a normal open K₁^p ⊆ K^p inside a level-N subgroup with N ≥ 3 prime to p (ShimuraVarieties:V0/neat-sublevels).

**Proof route.**

1. For K₁^p ⊴ K^p as chosen, S1 siegel-main-theorem and perfectoid-siegel-space over ℚ_p^cycl, transported to the S0 Siegel tower over C at all levels K_p ⊆ GSp_2g(ℚ_p) by PerfectoidShimuraVarieties:S1/siegel-similitude-comparison, give the perfectoid tower over C at level K₁^p with the covering by GSp_2g(ℚ_p)-translates of anticanonical neighbourhoods, which are stable under the finite group K^p/K₁^p.
2. Quotient by K^p/K₁^p chartwise: PerfectoidSpaces:P8/affinoid-perfectoid-quotient on the invariant affinoid perfectoids (Hansen, Theorem 1.4 in the form planned by P8), and the quotients glue; the quotient commutes with the limit over K_p as in PerfectoidSpaces:P8/quotient-of-good-tower.

**Acceptance instances.**

- For K^p = GSp_2g(Ẑ^p) (full tame level, not neat), the minimally compactified tower is perfectoid.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S1/siegel-main-theorem`, `PerfectoidShimuraVarieties:S1/perfectoid-siegel-space`, `PerfectoidShimuraVarieties:S1/siegel-similitude-comparison`, `PerfectoidSpaces:P8/affinoid-perfectoid-quotient`, `PerfectoidSpaces:P8/quotient-of-good-tower`, `ShimuraVarieties:V0/neat-sublevels`.

**Sources.**

- [David Hansen, Christian Johansson, Perfectoid Shimura varieties and the Calegari–Emerton conjectures](https://arxiv.org/abs/2011.03951v2), §5.2, proof of Proposition 5.14, p. 34. Removal of Scholze's tame level condition.

### The genuine minimally compactified Hodge-type tower is perfectoid and a good tower

Target `PerfectoidShimuraVarieties:S2/hodge-genuine-minimal-perfectoid-tower` (theorem).

Let (G, X) be of Hodge type with reflex field E, Sh*_K(G, X) the canonical normal projective minimal compactification over E (ShimuraVarieties:V8/minimal-descent), C and the embedding σ: E → C as in S0 p-level-tower (σ factors through the completion E_𝔭 at the place 𝔭 | p it induces), and 𝒳*_K := S*_K = (Sh*_K(G, X) ⊗_{E,σ} C)^{ad} the S0 minimally compactified tower over C. For any compact open K^p ⊆ G(𝔸_f^p): (a) 𝒳*_{K^p} := lim_{K_p} 𝒳*^◇_{K^pK_p} = S^{*◇}_{K^p,∞} is a perfectoid space; (c) it is analytically separated; (d) it has two coverings by finitely many open affinoid perfectoids U_i ⊆ V_i with the closure of U_i in V_i, each pulled back from an open affinoid of some 𝒳*_{K^pK_p}; (e) hence for every cofinal system of K_p ⊆ G(ℚ_p), (𝒳*_{K^pK_p})_{K_p} is a good tower over C (PerfectoidSpaces:P8/good-tower). The identification with the diamond limit is the only limit statement: whether 𝒳*_{K^p} ~ lim 𝒳*_{K^pK_p} in the sense of Scholze–Weinstein is not known (Boxer–Pilloni §4.4.27). The Hodge–Tate period map on this tower is S3's (hodge-compactified-period-maps), not part of this theorem. Remark: Hansen–Johansson's Proposition 5.14 states (a)–(e) for the rigid spaces over E_𝔭 ('good tower (over E_p)'); that form is not asserted here, because its proof needs a perfectoid Siegel target over E_𝔭, and the Siegel input (siegel-tame-level-removal, from S1 over ℚ_p^cycl and C) supplies one only over C; descent from C to E_𝔭 is a separate theorem (S0 p-level-tower).

**Hypotheses and conventions.**

- (G, X) a Shimura datum of Hodge type in Deligne's setup (ShimuraData:D4/hodge-type): a closed embedding ι: (G, X) ↪ (GSp_2g, H_g^±) into a Siegel datum, fixed once and for all; Scholze's (G, D) ↪ (Sp_2g, D) setup is the restriction to a connected component and is not used for statements.
- K^p arbitrary; no hyperspecial or good-reduction hypothesis at p.
- The proof uses the perfectoidization of integral algebras (Bhatt–Scholze, Theorem 1.17(1) = 10.11) through PerfectoidSpaces:P8/finite-tower-over-perfectoid-tower, a recorded gap.

**Proof route.**

1. Choose K′^p ⊇ K^p in GSp_2g(𝔸_f^p) and a cofinal chain K_n ⊆ GSp_2g(ℚ_p) with ι⁻¹(K_n) cofinal in G(ℚ_p). The maps 𝒳*_{K^pι⁻¹(K_n)} → 𝒮*_{K′^pK_n} over C are finite (hodge-type-embedding-and-siegel-comparison, base changed along σ; the reflex field of the Siegel datum is ℚ), with finite transition maps.
2. The Siegel target tower over C is perfectoid at every tame level (siegel-tame-level-removal); PerfectoidSpaces:P8/finite-tower-over-perfectoid-tower gives (a) and quasicompactness of f: 𝒳*_{K^p} → 𝒮*_{K′^p}.
3. (c): PerfectoidSpaces:P8/projective-tower-limit-is-analytically-separated.
4. (d): pull back the translates 𝒮*(ε)_a g_i ⊆ 𝒮*(ε′)_a g_i along f; preimages of affinoid perfectoids pulled back from finite level are affinoid perfectoid (P8/finite-tower-over-perfectoid-tower), and closures pull back into the larger sets.
5. (e): Definition of good tower (PerfectoidSpaces:P8/good-tower).

**Acceptance instances.**

- For the Siegel datum it is siegel-tame-level-removal.
- For the modular curve (g = 1), genuine and image compactifications agree and the statement is the perfectoid modular curve.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S2/hodge-type-embedding-and-siegel-comparison`, `PerfectoidShimuraVarieties:S2/image-compactification`, `PerfectoidShimuraVarieties:S2/siegel-tame-level-removal`, `PerfectoidSpaces:P8/finite-tower-over-perfectoid-tower`, `PerfectoidSpaces:P8/projective-tower-limit-is-analytically-separated`, `PerfectoidSpaces:P8/good-tower`, `PerfectoidSpaces:P8/analytically-separated`, `ShimuraVarieties:V8/minimal-descent`, `PerfectoidShimuraVarieties:S0/p-level-tower`, `PerfectoidShimuraVarieties:S0/infinite-level-diamond`.

**Sources.**

- [David Hansen, Christian Johansson, Perfectoid Shimura varieties and the Calegari–Emerton conjectures](https://arxiv.org/abs/2011.03951v2), §5.2, Proposition 5.14 with proof, pp. 34–35. Conclusion (e) of Proposition 5.14.
- [George Boxer, Vincent Pilloni, Higher Coleman theory](https://arxiv.org/abs/2110.10251v1), §4.4.27, p. 74. Boxer–Pilloni: the tilde-limit property of the genuine minimal tower is open (the sentence continues with the formula).

### Good towers at arbitrary (non-product) levels

Target `PerfectoidShimuraVarieties:S2/hodge-good-tower-arbitrary-level` (theorem).

For (G, X) of Hodge type, any compact open K ⊆ G(𝔸_f) (not necessarily of the form K^pK_p) and any cofinal system of compact open K_p ⊆ G(ℚ_p), the tower (𝒳*_{K∩K_p})_{K_p} of S0 minimal compactifications over C (through σ: E → C) is a good tower over C, where H ∩ K_p := {h ∈ H : h_p ∈ K_p} = H ∩ (G(𝔸_f^p)K_p).

**Hypotheses and conventions.**

- (G, X) a Shimura datum of Hodge type in Deligne's setup (ShimuraData:D4/hodge-type): a closed embedding ι: (G, X) ↪ (GSp_2g, H_g^±) into a Siegel datum, fixed once and for all; Scholze's (G, D) ↪ (Sp_2g, D) setup is the restriction to a connected component and is not used for statements.

**Proof route.**

1. Let K^p be the image of K in G(𝔸_f^p). Then K ∩ K_p ⊆ K^pK_p is open of finite index, so the maps 𝒳*_{K∩K_p} → 𝒳*_{K^pK_p} are finite (ShimuraVarieties:V8/minimal-map-extension, V2 finite quotients).
2. Apply PerfectoidSpaces:P8/good-towers-under-finite-maps to the good tower of hodge-genuine-minimal-perfectoid-tower.

**Acceptance instances.**

- For K = K^pK_p it is hodge-genuine-minimal-perfectoid-tower (e).
- Hansen–Johansson's Corollary 5.15 states this over E_𝔭; as for hodge-genuine-minimal-perfectoid-tower, only the form over C is asserted.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S2/hodge-genuine-minimal-perfectoid-tower`, `PerfectoidSpaces:P8/good-towers-under-finite-maps`, `ShimuraVarieties:V8/minimal-map-extension`.

**Sources.**

- [David Hansen, Christian Johansson, Perfectoid Shimura varieties and the Calegari–Emerton conjectures](https://arxiv.org/abs/2011.03951v2), §5.2, Corollary 5.15 with proof, p. 35. The convention H ∩ K_p used in Corollary 5.15 and §5.3.

### Good towers are stable under extension of the base field

Target `PerfectoidShimuraVarieties:S2/good-tower-base-change` (lemma).

Let K ⊆ L be nonarchimedean fields with L complete (for instance E_𝔭 ⊆ C), and (X_i) a good tower over K (PerfectoidSpaces:P8/good-tower). Then (X_i ⊗_K L) is a good tower over L, with limit (lim X_i^◇) ×_{Spd K} Spd L; affinoid perfectoid covers pulled back from finite level, and the closure relation Ū_j ⊆ V_j, pass to the base change.

**Hypotheses and conventions.**

- Analytifications of projective varieties base change to analytifications of projective varieties; finiteness is preserved.

**Proof route.**

1. Condition (1) of a good tower is preserved by base change of projective varieties and finite maps.
2. (2) The fibre product of a perfectoid space with Spd L over Spd K is perfectoid (PerfectoidSpaces P2 fibre products over an analytic base), and limits commute with fibre products.
3. (3) Preimages of the U_j, V_j are affinoid perfectoid (fibre products of affinoid perfectoids), pulled back from the base-changed finite-level affinoids, and closures map into closures by continuity.

**Acceptance instances.**

- Applied to C ⊆ C′ (complete algebraically closed) it shows that the good towers of hodge-good-tower-arbitrary-level over C′ are the base changes of those over C; applied to E_𝔭 ⊆ C it would turn Hansen–Johansson's E_𝔭 form of Corollary 5.15 into the form over C, which is the bridge between their §5.2 and §5.3 that the source does not state (this packet proves the form over C directly).

**Direct prerequisites.** `PerfectoidSpaces:P8/good-tower`, `PerfectoidSpaces:P2/fibre-products-over-analytic-base`, `PerfectoidShimuraVarieties:S0/infinite-level-diamond`.

**Sources.**

- [David Hansen, Christian Johansson, Perfectoid Shimura varieties and the Calegari–Emerton conjectures](https://arxiv.org/abs/2011.03951v2), §5.3, conventions, p. 35. §5.3 works over C, while Corollary 5.15 is over E_𝔭.

### Comparison of the genuine and image-compactified Hodge-type towers

Target `PerfectoidShimuraVarieties:S2/genuine-to-image-comparison` (comparison).

For (G, X) of Hodge type and K^p as in hodge-image-compactified-tower, the finite maps Sh*_K → X^{*̲}_K of image-compactification induce a G(ℚ_p)-equivariant quasicompact map 𝒳*_{K^p} → 𝒳^{*̲}_{K^p} of perfectoid spaces over C, which is an isomorphism over the open tower S_{K^p} (hodge-open-perfectoid-tower) and maps boundary to boundary. Whether it is an isomorphism is not known in general and is not asserted.

**Hypotheses and conventions.**

- (G, X) a Shimura datum of Hodge type in Deligne's setup (ShimuraData:D4/hodge-type): a closed embedding ι: (G, X) ↪ (GSp_2g, H_g^±) into a Siegel datum, fixed once and for all; Scholze's (G, D) ↪ (Sp_2g, D) setup is the restriction to a connected component and is not used for statements.

**Proof route.**

1. Take the inverse limit of the compatible finite-level maps in v-sheaves. The two diamonds are represented by perfectoid spaces over C, so the map lifts uniquely through the fully faithful perfectoid-space-to-diamond functor with the untilt/base fixed. The qcqs property follows from DiamondsAndVStacks:D5/limits-and-finite-stage-comparisons. This does not assume that the genuine minimal tower already satisfies a tilde-limit statement.
2. Over the open part the finite-level maps are isomorphisms, so their limit is.

**Acceptance instances.**

- For the Siegel datum it is the identity.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S2/hodge-genuine-minimal-perfectoid-tower`, `PerfectoidShimuraVarieties:S2/hodge-image-compactified-tower`, `PerfectoidShimuraVarieties:S2/image-compactification`, `PerfectoidShimuraVarieties:S2/hodge-open-perfectoid-tower`, `PerfectoidShimuraVarieties:S0/perfectoid-representative`, `DiamondsAndVStacks:D5/limits-and-finite-stage-comparisons`.

**Sources.**

- [George Boxer, Vincent Pilloni, Higher Coleman theory](https://arxiv.org/abs/2110.10251v1), §4.4.27, p. 74. Boxer–Pilloni construct the genuine tower as a diamond limit and map it to the image-compactified one.

### Independence of the symplectic embedding

Target `PerfectoidShimuraVarieties:S2/embedding-independence` (theorem).

The open perfectoid tower S_{K^p} and the genuine minimally compactified perfectoid tower 𝒳*_{K^p} of a Hodge-type datum, with their G(ℚ_p)-actions and their maps to the finite levels, do not depend on the symplectic embedding ι: for two embeddings the representatives are canonically isomorphic, compatibly with the cones, because both represent the diamond lim_{K_p} S^◇_{K^pK_p} (resp. lim 𝒳*^◇_{K^pK_p}) built from the canonical models, which do not involve ι. No such statement is made for the image compactification 𝒳^{*̲}_{K^p}, which depends on ι a priori.

**Hypotheses and conventions.**

- (G, X) a Shimura datum of Hodge type in Deligne's setup (ShimuraData:D4/hodge-type): a closed embedding ι: (G, X) ↪ (GSp_2g, H_g^±) into a Siegel datum, fixed once and for all; Scholze's (G, D) ↪ (Sp_2g, D) setup is the restriction to a connected component and is not used for statements.

**Proof route.**

1. The finite-level canonical models and their minimal compactifications are independent of ι (ShimuraVarieties V6/V8).
2. A perfectoid representative is unique up to unique isomorphism compatible with the cones (PerfectoidSpaces:P7/tilde-limit-perfectoid-uniqueness for the open tower; for the genuine minimal tower, uniqueness of a perfectoid space with given diamond, the diamond functor being fully faithful on perfectoid spaces).

**Acceptance instances.**

- For two embeddings differing by an automorphism of the symplectic space, the induced isomorphism is the identity on the towers.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S2/hodge-open-perfectoid-tower`, `PerfectoidShimuraVarieties:S2/hodge-genuine-minimal-perfectoid-tower`, `PerfectoidSpaces:P7/tilde-limit-perfectoid-uniqueness`, `PerfectoidShimuraVarieties:S0/perfectoid-representative`, `DiamondsAndVStacks:D6/gluing-and-the-diamond-functor`.

**Sources.**

- [Ana Caraiani, Peter Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://arxiv.org/abs/1511.02418v1), §2.1, Theorem 2.1.3(1), p. 12. Caraiani–Scholze prove independence for the period map; the towers are independent by construction.

## S3 — Hodge-type period map and coefficients

Coverage: **planned**.

- T2 supplies the open map and bundle pullback, conditional on its P9 relative-filtration transfer and R09.1/B0 representable flag/torsor interface. S3 imports these inputs; the missing generic flag interface is requested upstream.
- C3.general’s closed Hodge-type toroidal embedding remains requested.
- T5’s modified-model inputs are cited by exact nodes. The p = 2 integral estimate and the stronger k = 1 determinant claim remain conditional or unproved; only a proven ample power is asserted.

### Imported homogeneous flag and Levi torsor: the right-action dictionary

Target `PerfectoidShimuraVarieties:S3/levi-torsor-over-flag-variety` (construction).

Import the representable homogeneous Hodge–Tate flag and its actual parabolic and Levi torsors from AlgebraicModuliForArithmeticGeometry R09.1 / AutomorphicBundles B0. Their existence and general associated-bundle construction belong upstream of T2. This node specializes those interfaces to Shimura data and records the following convention dictionary. Let G be a reductive group over a field F of characteristic 0 (or a p-adic field) with a cocharacter μ defined over F. The Hodge–Tate flag variety is FL_{G,μ} := P_μ\G, with G acting by right translation; its analytification over a p-adic field is FL^{an}. The quotient U_{P_μ}\G → P_μ\G is a right M_μ-torsor (M_μ acting through P_μ/U_{P_μ} ≅ M_μ by left multiplication twisted to a right action m·(U x) = U m⁻¹ x), G-equivariant for right translation. Dictionary: Scholze's and Caraiani–Scholze's flag variety G/P_μ with left G-action is identified with P_μ\G by gP_μ ↦ P_μ g⁻¹. For the Siegel datum the cocharacter is pinned as μ(t) = diag(1_g, t·1_g) (BP26 §3.1), so Ad μ(t)(A B; C D) = (A t⁻¹B; tC D) and P_μ = {(A B; C D) : B = 0} = Stab⟨e_{g+1}, …, e_{2g}⟩, the opposite of the Hodge parabolic P_μ^std = Stab⟨e_1, …, e_g⟩ = {C = 0}; P_μ·x ↦ (the row space of the top g rows of x) identifies P_μ\GSp_2g with the Lagrangian Grassmannian of row spaces, with right action by right multiplication. BP26's convention is π_HT(A, Ψ) = P_μ·g(Ψ)⁻¹ where Ψ(g(Ψ)⟨e_{g+1}, …, e_{2g}⟩) = Lie A(1), and Scholze's Fl (Lagrangian subspaces W ⊆ ℚ_p^{2g}) corresponds to W = g(Ψ)⟨e_{g+1}, …, e_{2g}⟩, whose annihilator W^⊥ for the pairing of row with column vectors is the row space of the top g rows of g(Ψ)⁻¹; this is well defined on P_μ\G exactly because P_μ stabilises ⟨e_{g+1}, …, e_{2g}⟩. The universal P_μ-torsor over FL is G → FL, x ↦ P_μ x (a right P_μ-torsor after x ↦ x⁻¹), and G-equivariant vector bundles on FL attached to P_μ-representations V are G ×^{P_μ} V; for representations inflated from M_μ they are the bundles associated with U_{P_μ}\G.

**Hypotheses and conventions.**

- G reductive, μ a cocharacter defined over the base; the Bruhat decomposition and Schubert cells are ShimuraData:D3/bruhat-integral.
- The exact general homogeneous Hodge–Tate flag and Levi-torsor interface is requested from R09.1, coordinated with B0. B0/homogeneous-hodge-torsor currently supplies the complex Hodge side, not the whole requested opposite-parabolic analytic interface.

**Proof route.**

1. Import the geometric quotient and torsor universal properties from R09.1/B0; the following group-quotient calculations specify the convention but do not construct a scheme or analytic torsor.
2. U_{P_μ} is normal in P_μ with quotient M_μ; P_μ\G is the quotient of U_{P_μ}\G by the free right action of M_μ, which is locally trivial because G → P_μ\G is (Zariski-locally on the big cell) trivial.
3. Equivariance: right translation by G commutes with the left action of P_μ.
4. Dictionary: inversion g ↦ g⁻¹ exchanges G/P_μ and P_μ\G and left with right actions (AutomorphicBundles:B0/hodge-parabolic-convention).

**Planning API.**

- `HodgeTate.FL` (data): FL_{G,μ} = P_μ\G with the right G-action.
- `HodgeTate.leviTorsor` (constructor): U_{P_μ}\G → FL as a G-equivariant right M_μ-torsor.
- `HodgeTate.FL_equivLeftFlag` (equivalence): G/P_μ ≅ P_μ\G, gP_μ ↦ P_μg⁻¹, exchanging left and right actions.
- `HodgeTate.associatedBundle` (constructor): For a P_μ-representation V, the G-equivariant bundle G ×^{P_μ} V on FL; for V inflated from M_μ it is leviTorsor ×^{M_μ} V.
- `HodgeTate.associatedBundle_tensor` (structure): The associated-bundle functor is exact and tensor.
- `HodgeTate.FL_siegel` (compatibility): For GSp_2g with μ(t) = diag(1_g, t·1_g): P_μ = {B = 0} = Stab⟨e_{g+1}, …, e_{2g}⟩, FL is the Lagrangian Grassmannian through P_μ·x ↦ the row space of the top g rows of x, and Scholze's Fl corresponds by W = g⟨e_{g+1}, …, e_{2g}⟩ ↔ P_μ·g⁻¹, W^⊥ being the row space of the top g rows of g⁻¹.

**Unit tests.**

- `FL_gl2_P1` (computation): For GL_2 and μ(t) = diag(1, t), P_μ is lower triangular and FL_{G,μ} ≅ ℙ¹ by P_μ·x ↦ the line of the first row of x; the chart point P_μ·(1 z; 0 1) corresponds to the row (1, z), and g = (a b; c d) acts on the right by z ↦ (b + dz)/(a + cz), since (1, z)g = (a + cz)(1, (b + dz)/(a + cz)); this is the g = 1 case of siegel-graph-chart-and-frame.
- `FL_parabolic_pinned` (non-example): For GL_2 and μ(t) = diag(t, 1) the limit parabolic is upper triangular, and P·x ↦ the line of the first row of x is not well defined on P\GL_2: (1 1; 0 1) ∈ P, so P·(1 1; 0 1) = P·1, but the first rows (1, 1) and (1, 0) span different lines. The pinned μ(t) = diag(1, t) is needed for the row-space dictionary.
- `FL_trivial_mu` (degenerate): For a central cocharacter, U_P = 1 and M_μ = G; the Levi torsor is G → point.
- `FL_left_right_inverse` (non-example): The identity map G/P_μ → P_μ\G does not exist (different quotients); using gP ↦ Pg instead of Pg⁻¹ is not equivariant: it turns the left action into a right action of the opposite group.
- `FL_compact_dual` (compatibility): Over ℂ, FL_{G,μ} is the compact dual of ShimuraData:D3/compact-dual after inversion and passage from the Hodge to the opposite parabolic.

**Acceptance instances.**

- For G = GL_2 and μ(t) = diag(1, t) (the g = 1 case of the pinned Siegel cocharacter): Ad μ(t)(a b; c d) = (a t⁻¹b; tc d), so P_μ = {b = 0} is the lower triangular Borel, the stabiliser of ⟨e_2⟩; FL = ℙ¹ through P_μ·x ↦ the line of the first row of x; M_μ = T the diagonal torus; and U\GL_2 → ℙ¹ is the 𝔾_m²-torsor of frames of the tautological flag.

**Direct prerequisites.** `ShimuraData:D3/compact-dual`, `ShimuraData:D3/bruhat-integral`, `ShimuraData:D3/filtration-parabolic`, `AutomorphicBundles:B0/hodge-parabolic-convention`, `AutomorphicBundles:B0/homogeneous-hodge-torsor`, `AlgebraicModuliForArithmeticGeometry:R09.1`.

**Sources.**

- [George Boxer, Vincent Pilloni, Higher Coleman theory](https://arxiv.org/abs/2110.10251v1), §4.4.10, Remark 4.4.11, p. 66. The right-action convention.
- [George Boxer, Vincent Pilloni, Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §3.1, p. 33. The pinned Siegel cocharacter µ(z) = diag(Id_g, zId_g) and P_µ = Stab⟨e_{g+1}, …, e_{2g}⟩.
- [George Boxer, Vincent Pilloni, Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §3.3, Remark 3.3.1, p. 35. The Siegel right-equivariance computation.

### The Siegel period map: tame level, prime-to-p Hecke operators and the right-action normalisation

Target `PerfectoidShimuraVarieties:S3/siegel-period-map-properties` (theorem).

Let π_HT: 𝒳*_{Γ(p^∞),K^p} → Fl be the Siegel Hodge–Tate period map of S1. (iii) For (K^p)′ ⊆ K^p (both inside level-N subgroups, N ≥ 3 prime to p), π_HT on 𝒳*_{Γ(p^∞),(K^p)′} is the composite of the projection to 𝒳*_{Γ(p^∞),K^p} with π_HT. (iv) For γ ∈ GSp_2g(𝔸_f^p) with γ⁻¹K^pγ inside such a subgroup, π_HT ∘ γ = π_HT: prime-to-p Hecke operators act trivially on Fl. In BP's convention FL = P\GSp_2g with π_HT(A, Ψ) = P·g(Ψ)⁻¹, π_HT((A, Ψ)f) = π_HT((A, Ψ))·f for f ∈ GSp_2g(ℚ_p), the right action (A, Ψ)f = (A, Ψ ∘ f) on the tower.

**Hypotheses and conventions.**

- Siegel datum; K^p as in S1.

**Proof route.**

1. (iii) by construction of π_HT (the Hodge–Tate filtration does not see the tame level).
2. (iv) by the uniqueness of extensions across the boundary (S1 siegel-hodge-tate-period-map) it suffices to check on geometric points outside the boundary, where the Hodge–Tate filtration of A[p^∞] depends only on A up to prime-to-p isogeny (Scholze Proposition 3.3.1; HodgeTateAndCanonicalSubgroups T0).
3. Right action: g(Ψ ∘ f) = f⁻¹g(Ψ) because Ψ ∘ f carries ⟨f⁻¹g(Ψ)e_{g+1}, …⟩ to Lie A(1); hence P·g(Ψ ∘ f)⁻¹ = P·g(Ψ)⁻¹·f.

**Acceptance instances.**

- For g = 1 and γ = diag(ℓ, 1) at a prime ℓ ≠ p, the Hecke translate of a point (E, α) is (E/C, α′) with E → E/C an ℓ-isogeny, and π_HT is unchanged.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S1/siegel-hodge-tate-period-map`, `PerfectoidShimuraVarieties:S1/siegel-main-theorem`, `PerfectoidShimuraVarieties:S3/levi-torsor-over-flag-variety`, `HodgeTateAndCanonicalSubgroups:T0/raynaud-hodge-tate-filtration`.

**Sources.**

- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §3.3.3, Theorem 3.3.18(iii)–(iv) with proof, pp. 1012–1014. Proof of (iv).
- [George Boxer, Vincent Pilloni, Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §3.3, Remark 3.3.1, p. 35. The right-equivariance computation.

### Siegel case: the tautological bundles pull back to Lie A and ω

Target `PerfectoidShimuraVarieties:S3/siegel-tautological-pullback` (theorem).

Let W ⊆ 𝒪_Fl^{2g} be the universal totally isotropic subbundle and ω_Fl = (∧^g W)^∨. (v) Over the open perfectoid Siegel tower 𝒳_{Γ(p^∞),K^p} there is a natural GSp_2g(ℚ_p)-equivariant isomorphism Lie A ⊗ 𝒪(1) ≅ π_HT^*W, equivalently π_HT^*(𝒪^{2g}/W) ≅ ω_{A^∨} through the Hodge–Tate map (the canonical, twist-free form), and π_HT^*W^∨ ≅ ω_A(−1); Scholze states Lie A ≅ π_HT^*W after suppressing Tate twists over ℚ_p^cycl, i.e. after trivialising ℤ_p(1) by the fixed compatible system ζ_{p^∞}, a trivialisation that GSp_2g(ℚ_p) moves through the similitude character. (vi) Over the whole minimally compactified tower 𝒳*_{Γ(p^∞),K^p}, with ω the Hodge line bundle pulled back from finite level, there is a natural GSp_2g(ℚ_p)-equivariant isomorphism π_HT^*ω_Fl ≅ ω(−g), extending the dual top exterior power of (v); both isomorphisms are compatible with change of tame level and prime-to-p Hecke operators.

**Hypotheses and conventions.**

- Siegel datum, K^p as in S1.
- Fargues' bound (Fargues–Genestier–Lafforgue, Théorème II.1.1) is proved only for p ≠ 2; for p = 2 the integral bound of (vi) comes from the induction on g.
- The determinant of π_HT^*W^∨ ≅ ω_A(−1) is ω(−g). A choice of ζ trivializes the Tate line and yields an untwisted underlying-bundle identification; equivariance of that untwisted form requires transporting the linearization, since the action on ζ is through the similitude character.

**Proof route.**

1. (v) By construction of π_HT the Hodge–Tate filtration is the image of Lie A(1) in T_pA ⊗ 𝒪 ≅ 𝒪^{2g}, i.e. π_HT^*W (S1 continuous-hodge-tate-map; HodgeTateAndCanonicalSubgroups T2 for the relative Hodge–Tate sequence); dualising gives the other forms.
2. Integral bound for (vi), after choosing the Tate trivialization and transporting the linearization: ω has the integral structure ω⁺ pulled back from the integral model of X*, and π_HT^*ω_Fl the structure π_HT^*ω_Fl⁺ from the integral model of Fl over ℤ_p; off the boundary there is a constant C depending only on g with p^C ω⁺ ⊆ π_HT^*ω_Fl⁺ ⊆ p^{−C} ω⁺. For p ≠ 2 this follows from Scholze Proposition 3.3.1 (reduction to the p-divisible group through the Raynaud extension) and Fargues' theorem that the cokernel of the Hodge–Tate map T_pG ⊗ 𝒪_C → ω_{G^D} of a p-divisible group over 𝒪_C is killed by p^{1/(p−1)}: one map is integral with an integral inverse up to p^{g/(p−1)} (HodgeTateAndCanonicalSubgroups T0). For every p, alternatively, argue by induction on g: the good-reduction locus is quasi-compact, so the isomorphism is bounded there, and near the boundary Proposition 3.3.1 describes π_HT through the smaller-genus period map.
3. (vi) Embed ω and π_HT^*ω_Fl into j_*j^*ω for j the inclusion of the open tower; on the anticanonical neighbourhood π_HT^*ω_Fl⁺ is trivial and sections bounded for one integral structure are bounded for the other, so ω ⊆ π_HT^*ω_Fl there, and goodness of the boundary (S1 full-level-anticanonical-perfectoid) extends this; translate to the whole tower.
4. Invertibility: locally α(f₁) = h f₂ with |h| ≥ |p|^C off the boundary by the integral bounds, so {|h| ≤ |p|^{C+1}} is open and contained in the boundary, hence empty (the published proof says 'does not meet the boundary'; PAPER-SCHOLZE-15/E23).

**Acceptance instances.**

- For g = 1: ω ≅ π_HT^*𝒪(1) on the perfectoid modular curve, the elliptic statement of elliptic-hodge-tate-and-O1.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S3/siegel-period-map-properties`, `PerfectoidShimuraVarieties:S1/siegel-hodge-tate-period-map`, `PerfectoidShimuraVarieties:S1/full-level-anticanonical-perfectoid`, `HodgeTateAndCanonicalSubgroups:T2/abelian-hodge-tate-sequence`, `HodgeTateAndCanonicalSubgroups:T2/relative-hodge-tate-sequence`, `HodgeTateAndCanonicalSubgroups:T2/hodge-tate-flag-point`, `HodgeTateAndCanonicalSubgroups:T0/semi-abelian-hasse-invariant`, `HodgeTateAndCanonicalSubgroups:T0/hasse-invariant-ordinary-locus`, `HodgeTateAndCanonicalSubgroups:T0/hasse-invariant-minimal-compactification`, `HodgeTateAndCanonicalSubgroups:T0/raynaud-hodge-tate-filtration`, `HodgeTateAndCanonicalSubgroups:T0/fargues-hodge-tate-cokernel`, `AutomorphicBundles:B2/siegel-tautological-sequence`.

**Sources.**

- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §3.3.3, proof of Theorem 3.3.18(vi), p. 1014. The integral bound from Proposition 3.3.1 and Fargues' theorem ([30] = Fargues–Genestier–Lafforgue).
- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §3.3.3, Theorem 3.3.18(v)–(vi) with proof, pp. 1013–1015. Alternative to the Fargues input, covering p = 2.
- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §3.3, p. 1003. Scholze's suppression of Tate twists.

### Siegel graph charts, strict-Iwahori stable domains and the Hodge–Tate frame

Target `PerfectoidShimuraVarieties:S3/siegel-graph-chart-and-frame` (construction).

Conventions of levi-torsor-over-flag-variety: μ(t) = diag(1_g, t·1_g), P_μ = {B = 0}, FL = P_μ\GSp_2g with P_μ·x ↦ the row space of the top g rows of x and right action by right multiplication, π_HT(A, Ψ) = P_μ·g(Ψ)⁻¹ with W = g(Ψ)⟨e_{g+1}, …, e_{2g}⟩ = Ψ⁻¹(Lie A(1)), and the symplectic form ±J of S0 (J = (0 −1_g; 1_g 0)). The graph chart is the open subset of FL of row spaces of (1_g  Z), Z a g × g matrix; such a row space is W^⊥ for W = colspace(−Z; 1_g), and W is Lagrangian exactly when Z = Zᵗ. It is the locus where W is a complement of ⟨e_1, …, e_g⟩, i.e. Scholze's chart for J = {g+1, …, 2g} (the chart containing the image of the anticanonical neighbourhood), and its integral part {|Z_{ij}| ≤ 1} is Scholze's affinoid Fl_{g+1,…,2g}. For γ = (A B; C D) ∈ GSp_2g acting on the right on row vectors, (1 Z)γ = (A + ZC)(1  Z·γ) with Z·γ = (A + ZC)⁻¹(B + ZD) wherever A + ZC is invertible, and Z·γ is again symmetric. For 0 < r ≤ 1 with r ∈ |p|^ℚ put Fl^×(r) := {Z = Zᵗ : dist(Z_{ij}, ℤ_p) ≤ r for all i, j}, a finite disjoint union of closed polydiscs (so Fl^×(1) = Fl_{g+1,…,2g}). Let K_{Iw⁺} be the strict Iwahori level of S1 siegel-open-tower-and-level-quotients (γ mod p diagonal, c(γ) ≡ 1 mod p). Then: (i) for γ ∈ K_{Iw⁺}, det(A + ZC) is a unit of 𝒪⁺ on Fl^×(1) with det(A + ZC) ≡ det A modulo p, and each Fl^×(r) is K_{Iw⁺}-stable. (ii) On the open perfectoid tower 𝒳_{Γ(p^∞),K^p}, the images s = (s_1, …, s_g) of e_1, …, e_g in π_HT^*(𝒪^{2g}/W) ≅ ω_{A^∨} (Hodge–Tate quotient, no twist; s_j(A, Ψ) = HT_A(Ψ(e_j))) are the frame dual to the rows of (1 Z), defined on π_HT⁻¹ of the graph chart, and for γ ∈ K_{Iw⁺}, with γ^*s := s∘R_γ for the right action R_γ(A, Ψ) = (A, Ψ∘γ) (which does not change A), γ^*s = s·(A + ZC) on π_HT⁻¹(Fl^×(r)). (iii) Comparisons. Through the principal polarization λ (unchanged by GSp_2g(ℤ_p)), ω_{A^∨} ≅ ω_A equivariantly, and λ^*s obeys the same law γ^*(λ^*s) = λ^*s·(A + ZC). Through the symplectic form, v ↦ ⟨v, ·⟩|_W gives 𝒪^{2g}/W ≅ W^∨, but ⟨γv, γw⟩ = c(γ)⟨v, w⟩, so the transported frame s′ of π_HT^*W^∨ ≅ ω_A(−1) (with its natural structure; on W^∨ the frame is ⟨e_j, ·⟩|_W = ∓x_{g+j}|_W) satisfies γ^*s′ = c(γ)⁻¹s′·(A + ZC), and c(γ) ∈ 1 + pℤ_p is not 1 on K_{Iw⁺}; trivialising ℤ_p(1) by the generator ζ_Ψ determined by the similitude of Ψ (the fixed ζ_{p^∞} of S1, which R_γ moves to c(γ)ζ_Ψ) gives s′ ⊗ ζ_Ψ, the frame of ω_A induced by the Weil pairing, with the untwisted law γ^*(s′ ⊗ ζ_Ψ) = (s′ ⊗ ζ_Ψ)·(A + ZC). So the first-g-coordinate frame with law A + ZC is a frame of π_HT^*(𝒪^{2g}/W) ≅ ω_{A^∨} ≅ ω_A, not of π_HT^*W^∨ with a fixed Tate trivialisation.

**Hypotheses and conventions.**

- Siegel datum; right action on row vectors (BP26 convention, pinned in levi-torsor-over-flag-variety); the formula is re-derived here in one fixed convention because the sources state only g = 1 (Birkbeck–Heuer–Williams, Lemmas 2.4, 3.19 and Proposition 3.21) and the Hilbert case (Lemmas 5.29, 5.32).
- The consumer OverconvergentAutomorphicForms:O8 requested the frame on π_HT^*W^∨ ≅ h^*ω with a fixed Tate trivialisation; that form is corrected in (iii) (on W^∨ itself the first g coordinate functions vanish at Z = 0, and the transport through the symplectic form costs c(γ)).

**Proof route.**

1. Chart: W = colspace(−Z; 1_g) has W^⊥ = rowspace(1 Z) for the row–column pairing; for v = (−Zy; y), w = (−Zy′; y′) one has vᵗJ₀w = yᵗ(Z − Zᵗ)y′ for J₀ = (0 1_g; −1_g 0), so W is Lagrangian iff Z = Zᵗ. W is complementary to ⟨e_1, …, e_g⟩ iff its lower g × g block is invertible, i.e. iff its Plücker coordinate s_{{g+1,…,2g}} is nonzero; normalising it to 1, the other Plücker coordinates are ± minors of Z, so {|s_{J′}| ≤ |s_J|} is {|Z_{ij}| ≤ 1} (Scholze §3.3, p. 1008: Fl_{g+1,…,2g}(ℚ_p) consists of the M with M ⊕ (ℤ_p^g ⊕ 0) ≅ ℤ_p^{2g}).
2. Matrix identity: (1 Z)·(A B; C D) = (A + ZC, B + ZD) = (A + ZC)(1, (A + ZC)⁻¹(B + ZD)); symmetry of Z·γ because γ ∈ GSp_2g maps Lagrangians to Lagrangians.
3. Unit bound: on Fl^×(1), |Z| ≤ 1 and C ≡ 0 mod p, so A + ZC ≡ A mod p; A mod p is diagonal invertible, so det(A + ZC) ≡ det A ∈ ℤ_p^× and (A + ZC)⁻¹ has entries in 𝒪⁺.
4. Stability: write Z = Z₀ + E with Z₀ ∈ Sym_g(ℤ_p) and |E| ≤ r (choose z_{ij} = z_{ji} ∈ ℤ_p within r of Z_{ij}). Then A + Z₀C ∈ GL_g(ℤ_p), Z₀·γ ∈ Sym_g(ℤ_p), and with M = A + ZC, M₀ = A + Z₀C one has Z·γ − Z₀·γ = M⁻¹E(D − C·(Z₀·γ)), of norm ≤ |E| ≤ r. Hence Z·γ ∈ Fl^×(r); applying this to γ⁻¹ gives equality. The disc {|Z_{ij}| ≤ r} is not stable for r < |p| (γ = (1 p·1_g; 0 1) ∈ K_{Iw⁺} sends 0 to p·1_g), which is why the domain is the distance-to-ℤ_p neighbourhood (BHW Definition 2.2: B_r(ℤ_p : 1), the union of the closed balls of radius r around the points (a : 1), a ∈ ℤ_p).
5. Frame law: s_j is the class of e_j in 𝒪^{2g}/W, and pairs with row i of (1 Z) to δ_{ij}. On the tower R_γ^*ω_{A^∨} = ω_{A^∨} and s_j(A, Ψ∘γ) = HT_A(Ψ(γe_j)); modulo W = colspace(−Z; 1), (u; w) ≡ (u + Zw; 0), so γe_j ≡ Σ_i (A + ZC)_{ij} e_i, i.e. γ^*s = s·(A + ZC). The cocycle relation J_{γγ′}(Z) = J_γ(Z)·J_{γ′}(Z·γ) for J_γ(Z) = A + ZC follows from (1 Z)γγ′ = J_γ(Z)(1 Z·γ)γ′ and R_{γγ′} = R_{γ′}∘R_γ.
6. Comparisons: λ^*: ω_{A^∨} ≅ ω_A is canonical and A, λ are unchanged by R_γ. For s′ = φ(s), φ(v) = ⟨v, ·⟩|_W: the structure maps from the fibre at xγ to the fibre at x are v ↦ γv on 𝒪^{2g} and on W (the identity of T_pA ⊗ 𝒪 and of Lie A(1) under Ψ) and f ↦ f∘γ⁻¹ on W^∨, and ⟨γv, γw⟩ = c(γ)⟨v, w⟩ gives φ_x(γv) = c(γ)·φ_{xγ}(v)∘γ⁻¹, hence γ^*s′ = c(γ)⁻¹s′·(A + ZC). On the tower ⟨v, w⟩·ζ_Ψ = e_λ(Ψv, Ψw) (Weil pairing via λ), and ζ_{Ψ∘γ} = c(γ)ζ_Ψ, so s′ ⊗ ζ_Ψ, the Weil-pairing frame of (Lie A(1))^∨(1) = ω_A, has the untwisted law.

**Planning API.**

- `HodgeTate.siegelGraphChart` (data): The big cell {rowspace(1 Z) : Z = Zᵗ} of FL = P_μ\GSp_2g, i.e. W = colspace(−Z; 1_g) (Scholze's chart for J = {g+1, …, 2g}), with the sub-affinoids Fl^×(r) = {dist(Z_{ij}, ℤ_p) ≤ r}, 0 < r ≤ 1, and Fl^×(1) = Fl_{g+1,…,2g}.
- `HodgeTate.siegelGraphChart_act` (simp): (1 Z)γ = (A + ZC)(1 Z·γ) with Z·γ = (A + ZC)⁻¹(B + ZD).
- `HodgeTate.det_factor_isUnit` (characterisation): For γ ∈ K_{Iw⁺} and Z ∈ Fl^×(1), det(A + ZC) is a unit of 𝒪⁺ congruent to det A modulo p.
- `HodgeTate.siegelGraphChart_stable` (characterisation): Fl^×(r) is stable under K_{Iw⁺} for 0 < r ≤ 1.
- `HodgeTate.hodgeFrame` (constructor): The frame s = (s_1, …, s_g) of π_HT^*(𝒪^{2g}/W) ≅ ω_{A^∨}, s_j(A, Ψ) = HT_A(Ψ(e_j)), dual to the rows of (1 Z), with no Tate twist; its transports λ^*s to ω_A and s′ to π_HT^*W^∨ ≅ ω_A(−1).
- `HodgeTate.hodgeFrame_transform` (relation): For γ ∈ K_{Iw⁺}, over π_HT⁻¹(Fl^×(r)): γ^*s = s·(A + ZC) and γ^*(λ^*s) = λ^*s·(A + ZC), γ^*s′ = c(γ)⁻¹s′·(A + ZC), and the cocycle relation (A + ZC)_{γγ′} = (A + ZC)_γ (A′ + (Z·γ)C′).
- `HodgeTate.graphDistanceDomain` (data): For r ≥ 0, the symmetric-matrix point domain consisting of Z with dist(Z_ij, ℤ_p) ≤ r entrywise. At r = 0 it is the symmetric integral matrices. Analytic affinoid realization belongs to the imported flag/chart geometry.

**Unit tests.**

- `graph_factor_g1` (computation): For g = 1, γ = (a b; c d) and the chart point (1 z): (1 z)γ = (a + zc)(1, (b + zd)/(a + zc)).
- `graph_factor_identity` (degenerate): For γ = 1, A + ZC = 1 and Z·γ = Z.
- `graph_factor_cocycle` (characterisation): For γ, γ′ with the denominators invertible, (A + ZC) for γγ′ equals (A + ZC)·(A′ + (Z·γ)C′) (matrix identity).
- `graph_unit_needs_iwahori` (non-example): For g = 1, γ = (0 1; 1 0) ∉ K_{Iw⁺} and z = 0, A + zC = 0 is not a unit: the bound needs C ≡ 0 mod p.
- `graph_domain_not_disc` (non-example): For g = 1 and r < |p|, γ = (1 p; 0 1) ∈ K_{Iw⁺} sends z = 0 to z·γ = p, so {|z| ≤ r} is not K_{Iw⁺}-stable, while p ∈ ℤ_p lies in Fl^×(r) = {dist(z, ℤ_p) ≤ r}.
- `graph_chart_lagrangian` (characterisation): For g = 2 and the non-symmetric Z = (0 1; 0 0), W = colspace(−Z; 1_2) contains v = (−1, 0, 0, 1)ᵗ and w = (0, 0, 1, 0)ᵗ with vᵗJw = 1 ≠ 0 for J = (0 −1_2; 1_2 0), so W is not Lagrangian: the chart needs Z = Zᵗ (in general vᵗJw = yᵗ(Zᵗ − Z)y′ for v = (−Zy; y), w = (−Zy′; y′)).
- `hodge_frame_similitude` (non-example): For γ = diag(1_g, u·1_g) with u ∈ 1 + pℤ_p, u ≠ 1 (in K_{Iw⁺}, c(γ) = u, A + ZC = 1): γ^*s = s but γ^*s′ = u⁻¹s′, so a frame of π_HT^*W^∨ with a fixed Tate trivialisation does not satisfy the law A + ZC.

**Acceptance instances.**

- g = 1: our coordinate is Z = −z for BHW's z (W = ⟨(−Z, 1)⟩ = ⟨(z, 1)⟩, BHW's line), and BHW's left action is γ·x = x·γ^∨ with γ^∨ = (d −b; −c a); the factor A + ZC for γ^∨ is d − cZ = cz + d, recovering γ^*𝔰 = (c𝔷 + d)𝔰 with 𝔰(E, α) = HT(α(e_1)) = s_1 (BHW (3.4), Lemma 3.19 — whose statement misprints the right-hand side, PerfectoidShimuraVarieties/E24 — and Proposition 3.21).
- g = 1, r < |p|: the disc {|z| ≤ r} is not K_{Iw⁺}-stable (γ = (1 p; 0 1) sends 0 to p), while Fl^×(r) = B_r(ℤ_p : 1) (up to z ↦ −z) is, as in BHW Lemma 2.4.
- det(A + ZC) ≡ det A mod p on Fl^×(1) for γ ∈ K_{Iw⁺}, and for γ = diag(1_g, u·1_g) ∈ K_{Iw⁺} (u ∈ 1 + pℤ_p, c(γ) = u) one has A + ZC = 1, γ^*s = s, while γ^*s′ = u⁻¹s′: the W^∨-frame is not invariant.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S3/siegel-tautological-pullback`, `PerfectoidShimuraVarieties:S3/levi-torsor-over-flag-variety`, `PerfectoidShimuraVarieties:S1/siegel-open-tower-and-level-quotients`, `mathlib:Matrix.fromBlocks`, `mathlib:Matrix.det`, `mathlib:Matrix.J`.

**Sources.**

- [Christopher Birkbeck, Ben Heuer, Chris Williams, Overconvergent Hilbert modular forms via perfectoid modular varieties](https://arxiv.org/abs/1902.03985v4), §2.2, Lemma 2.4, p. 8. The g = 1 model of the stable domain and automorphy factor.
- [Christopher Birkbeck, Ben Heuer, Chris Williams, Overconvergent Hilbert modular forms via perfectoid modular varieties](https://arxiv.org/abs/1902.03985v4), §2.2, Definition 2.2, p. 8. The g = 1 stable domain: the distance-to-ℤ_p neighbourhood, not a disc.
- [Christopher Birkbeck, Ben Heuer, Chris Williams, Overconvergent Hilbert modular forms via perfectoid modular varieties](https://arxiv.org/abs/1902.03985v4), §3.3, Lemma 3.19 and its proof, p. 13. The g = 1 frame transformation.
- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §3.3, p. 1008. Scholze's Plücker charts Fl_J; the chart J = {g+1, …, 2g} is described on the same page.
- [George Boxer, Vincent Pilloni, Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §3.3, p. 35. The Hodge–Tate quotient is ω_{A^t}, untwisted.

### The adic incarnation of T2’s open Hodge-type period map

Target `PerfectoidShimuraVarieties:S3/hodge-open-period-map` (theorem).

Let (G, X) be of Hodge type, K^p sufficiently small, and S_{K^p}/C the open perfectoid representative supplied by S2. The v-sheaf map of HodgeTateAndCanonicalSubgroups:T2/open-tower-hodge-tate-map is represented uniquely by an adic morphism π_HT: S_{K^p} → FL^{an}_{G,μ}. It inherits T2’s G(ℚ_p)-equivariance, prime-to-p Hecke equivariance (trivial action on the flag), embedding independence and geometric-point formula, transported to S0’s right-action convention. Its composite with the Siegel flag embedding equals the Siegel period map. This node identifies the representing analytic morphism; the construction on the open limit v-sheaf belongs to T2.

**Hypotheses and conventions.**

- (G, X) of Hodge type with a fixed embedding into a Siegel datum (ShimuraData:D4/hodge-type); P_μ is the Hodge–Tate parabolic {g : lim_{t→0} Ad μ(t)g exists}, P_μ^std the Hodge parabolic, M_μ = Cent_G(μ) their common Levi.
- K^p sufficiently small (S2); the tensors s_{α,p} are defined over E (Kisin, Deligne absolute Hodge; AutomorphicBundles:B1/absolute-hodge-propagation).
- The open-tower supplier is conditional on its exact P9 completed relative-filtration transfer and R09.1/B0 representable flag/torsor interfaces. A geometric-point assignment is insufficient. Fix C and the untilt in the fully faithful perfectoid-test description.

**Proof route.**

1. Identify S_{K^p}^◇ with S0’s open limit by S2, then import T2/open-tower-hodge-tate-map. Use the analytic flag’s functor of points on perfectoid tests and the supplied fixed-base perfectoid/analytic Yoneda interface to obtain the unique adic morphism; do not assert full faithfulness for arbitrary analytic adic spaces.
2. Transport T2’s equivariance and embedding independence through this representing identification. Compatibility with the Siegel analytic map follows from the same functorial relative filtration, not merely agreement at classical points.

**Acceptance instances.**

- For the Siegel datum it is the restriction of the Siegel π_HT to the open tower.
- For a unitary PEL datum it is the period map of Caraiani–Scholze.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S2/hodge-open-perfectoid-tower`, `PerfectoidShimuraVarieties:S2/embedding-independence`, `PerfectoidShimuraVarieties:S3/levi-torsor-over-flag-variety`, `PerfectoidShimuraVarieties:S3/siegel-period-map-properties`, `AutomorphicBundles:B1/tensor-frame-torsor`, `AutomorphicBundles:B1/absolute-hodge-propagation`, `PerfectoidShimuraVarieties:S0/infinite-level-diamond`, `HodgeTateAndCanonicalSubgroups:T2/open-tower-hodge-tate-map`, `DiamondsAndVStacks:D6/gluing-and-the-diamond-functor`.

**Sources.**

- [Ana Caraiani, Peter Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://arxiv.org/abs/1511.02418v1), §2.1, Theorem 2.1.3(1), p. 12. Factorisation and embedding independence.
- [Ana Caraiani, Peter Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://arxiv.org/abs/1511.02418v1), §2.3, after Lemma 2.3.7, p. 21. The factorisation step.

### The perfectoid incarnation of T2’s Levi and automorphic-bundle pullback

Target `PerfectoidShimuraVarieties:S3/hodge-levi-pullback` (theorem).

On S2’s open Hodge-type perfectoid representative, import T2/open-tower-levi-pullback and identify it with the pullback along S3’s adic π_HT. Thus M_p ≅ M_dR ×^{μ,ℤ_p^×} ℤ_p(1), and an associated irreducible Levi representation V_κ of central μ-weight ⟨μ,κ⟩ satisfies f_p(V_κ) ≅ f_∞(V_κ)(⟨μ,κ⟩), with the supplier’s Hecke linearizations. These identifications are independent of the Siegel embedding. Choosing a Tate generator gives an untwisted underlying-bundle isomorphism only after transporting its linearization. S3 owns the representing identification and compactified extension, rather than reconstructing T2’s open-tower torsor theorem.

**Hypotheses and conventions.**

- (G, X) of Hodge type with a fixed embedding into a Siegel datum (ShimuraData:D4/hodge-type); P_μ is the Hodge–Tate parabolic {g : lim_{t→0} Ad μ(t)g exists}, P_μ^std the Hodge parabolic, M_μ = Cent_G(μ) their common Levi.
- Representations of P_μ are inflated from M_μ (the opposite parabolic forces this; Caraiani–Scholze Remark 2.1.5).

**Proof route.**

1. Pull T2/open-tower-levi-pullback through the S2 representing isomorphism and identify its flag map with hodge-open-period-map. Its universal parabolic/Levi pullback and associated tensor functor commute with that pullback.
2. Retain T2/de-rham-hodge-tate-levi-comparison’s central-cocharacter Tate twist. Extend to compactifications only in hodge-compactified-period-maps with its exact hypotheses.

**Acceptance instances.**

- For the modular curve and V the standard character of M_μ = T giving ω, f_p(V) = π_HT^*𝒪(1) and f_∞(V) = ω, with the twist of elliptic-hodge-tate-and-O1.
- For the Siegel datum and V = ∧^g of the standard representation of GL_g ⊆ M_μ, it recovers siegel-tautological-pullback (vi).

**Direct prerequisites.** `PerfectoidShimuraVarieties:S3/hodge-open-period-map`, `PerfectoidShimuraVarieties:S3/levi-torsor-over-flag-variety`, `AutomorphicBundles:B2/automorphic-vector-bundles-from-representations-of-the-centralizer`, `AutomorphicBundles:B1/filtration-reduction`, `AutomorphicBundles:B4/classical-vb-tate-normalization`, `AutomorphicBundles:B1/embedding-independence`, `HodgeTateAndCanonicalSubgroups:T2/open-tower-levi-pullback`, `HodgeTateAndCanonicalSubgroups:T2/de-rham-hodge-tate-levi-comparison`.

**Sources.**

- [Ana Caraiani, Peter Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://arxiv.org/abs/1511.02418v1), §2.1, Theorem 2.1.3(2), p. 12. Statement of Theorem 2.1.3(2).
- [George Boxer, Vincent Pilloni, Higher Coleman theory (authors' revised manuscript)](https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf), §4.4.23, p. 74. The twisted identification in the authors' manuscript.
- [George Boxer, Vincent Pilloni, Higher Coleman theory (authors' revised manuscript)](https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf), §4.4, Remark 4.4.12, p. 69. The sign of the twist on vector bundles: (π_HT^{tor})^*V_{κ,FL}(−⟨µ, κ⟩) = π^*_{K_p}V_{K^pK_p,κ,Σ}.

### Functoriality of the Hodge-type period map in morphisms of Shimura data

Target `PerfectoidShimuraVarieties:S3/hodge-period-map-datum-functoriality` (theorem).

Let f: (G₁, X₁) → (G₂, X₂) be a morphism of Hodge-type Shimura data, choose cocharacters with f ∘ μ₁ = μ₂, K₁^p, K₂^p with f(K₁^p) ⊆ K₂^p sufficiently small, and f̃: S_{K₁^p} → S_{K₂^p} the induced G₁(ℚ_p)-equivariant map of open perfectoid towers (S0 functoriality of canonical models through the diamond limits). Then π_HT,₂ ∘ f̃ = FL(f) ∘ π_HT,₁, where FL(f): FL_{G₁,μ₁} → FL_{G₂,μ₂} is induced by f (f(P_{μ₁}) ⊆ P_{μ₂}). The identity datum morphism gives the identity, and composition is respected.

**Hypotheses and conventions.**

- (G, X) of Hodge type with a fixed embedding into a Siegel datum (ShimuraData:D4/hodge-type); P_μ is the Hodge–Tate parabolic {g : lim_{t→0} Ad μ(t)g exists}, P_μ^std the Hodge parabolic, M_μ = Cent_G(μ) their common Levi. (for both data).
- Caraiani–Scholze prove only independence of the Siegel embedding; the general datum-morphism statement is proved here by the same construction.

**Proof route.**

1. Choose Siegel embeddings G₁ ↪ GSp(V₁), G₂ ↪ GSp(V₂). (A product embedding of G₁ into GSp(V₁) × GSp(V₂) is not a Siegel datum unless the similitudes agree, ν₁ = ν₂∘f, so it is not used.) As in Caraiani–Scholze Lemma 2.3.7: the faithful representation V₁ of the reductive G₁ realises V₂∘f as eV₁^⊗ for a G₁-invariant idempotent e of the tensor algebra V₁^⊗ (tensors in V₁, V₁^∨ and Tate twists); e is a Hodge tensor, absolute Hodge (AutomorphicBundles:B1/absolute-hodge-propagation), and its p-adic realisation e_p gives f̃^*(V_{2,p} ⊗ 𝒪̂) ≅ e_p(V_{1,p}^⊗ ⊗ 𝒪̂), matching the tensors s_{α,p}.
2. e_p respects the relative Hodge–Tate filtrations: e_p is the image of e_dR under the relative p-adic–de Rham comparison, checked at points over number fields by Blasius and propagated because e_p and e_dR are horizontal (HodgeTateAndCanonicalSubgroups T2). Hence the isomorphism induced by e_p maps the pushout of P_{p,1} along f: P_{μ₁} → P_{μ₂} to f̃^*P_{p,2}, compatibly with the canonical sections given by the trivialisations of the Tate modules over the towers; so π_HT,₂ ∘ f̃ = FL(f) ∘ π_HT,₁ as maps to the sheaf FL_{G₂,μ₂}.
3. Identity and composition follow from the functorial tensor-frame construction. Equality is equality of maps to the flag sheaf; it is not inferred from agreement of underlying topological maps or of points over a single fixed field.

**Acceptance instances.**

- For the inclusion of the Siegel datum into itself it is the identity.
- For the trace embedding of a Hilbert datum into a Siegel datum it gives the compatibility of hilbert-res-flag with the Siegel map.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S3/hodge-open-period-map`, `AutomorphicBundles:B1/absolute-hodge-propagation`, `AutomorphicBundles:B1/embedding-independence`, `ShimuraVarieties:V8/datum-functoriality`, `ShimuraData:D4/datum-morphism`, `DiamondsAndVStacks:D4/isomorphism-criteria-for-v-sheaves-and-stacks`, `HodgeTateAndCanonicalSubgroups:T2/open-tower-hodge-tate-map`, `HodgeTateAndCanonicalSubgroups:T2/hodge-tate-parabolic-reduction`.

**Sources.**

- [Ana Caraiani, Peter Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://arxiv.org/abs/1511.02418v1), §2.3, Lemma 2.3.7 and the construction of π_HT, pp. 20–21. The construction that makes the map functorial.
- [Ana Caraiani, Peter Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://arxiv.org/abs/1511.02418v1), §2.3, proof of Lemma 2.3.7, p. 20. The idempotent argument, applied here to V₂∘f inside V₁^⊗.

### The Hodge-type period map on the image and genuine minimal compactifications and on perfect toroidal towers

Target `PerfectoidShimuraVarieties:S3/hodge-compactified-period-maps` (theorem).

Let (G, X) be of Hodge type. (a) On Scholze's image-compactified tower 𝒳^{*̲}_{K^p} (S2 hodge-image-compactified-tower) there is a G(ℚ_p)-equivariant map π_HT: 𝒳^{*̲}_{K^p} → FL_{G,μ}, pulled back from the Siegel period map through FL_{G,μ} ↪ FL_{GSp,μ̃} (Zariski closed); it is affinoid (FL_{G,μ} has a cover by affinoids whose preimages are good affinoid perfectoid), compatible with tame level and prime-to-p Hecke operators, and π_HT^*ω_Fl ≅ ω(−g) for the fixed Siegel embedding of genus g (untwisted after a chosen Tate trivialization with transported linearization) (Scholze Theorem 4.1.1(iii)–(v)). (b) On the genuine minimally compactified tower 𝒳*_{K^p} (S2 hodge-genuine-minimal-perfectoid-tower), π_HT is the composite 𝒳*_{K^p} → 𝒳^{*̲}_{K^p} → FL_{G,μ}. (c) For a perfect cone decomposition Σ (a cofinal class: those for which Lan's theorem gives Σ̃ and closed immersions of the Hodge-type toroidal compactifications into Siegel ones at all levels), 𝒳^{tor}_{K^p,Σ} ~ lim 𝒳^{tor}_{K^pK_p,Σ} is perfectoid with a closed immersion into the Siegel toroidal tower for Σ̃, π_HT^{tor} is the composite with the map to the minimal compactification, the pullback of the Levi torsor is M_dR^{can} ×^{μ,ℤ_p^×} ℤ_p(1) for the canonical extension M_dR^{can} of the Hodge-type de Rham Levi torsor, pulled back from finite level (Boxer–Pilloni Proposition 4.4.29, after Esnault–Harris), and these isomorphisms are compatible with the G(𝔸_f)-action on the limit over K^p and Σ. The three compactified towers are distinct: the auxiliary normalised models of hodge-tate-formal-models are a fourth object, only their generic fibres being minimal compactifications.

**Hypotheses and conventions.**

- (G, X) of Hodge type with a fixed embedding into a Siegel datum (ShimuraData:D4/hodge-type); P_μ is the Hodge–Tate parabolic {g : lim_{t→0} Ad μ(t)g exists}, P_μ^std the Hodge parabolic, M_μ = Cent_G(μ) their common Levi.
- (c) needs perfect Σ; for general Σ it is not known (Boxer–Pilloni Remark 4.4.28).
- Through (b), the genuine tower uses the perfectoidization gap of S2.

**Proof route.**

1. (a) The Siegel π_HT pulled back to 𝒳^{*̲}_{K^p} lands in FL_{G,μ} over the dense open tower (hodge-open-period-map); FL_{G,μ} is Zariski closed and the perfectoid space is reduced with nowhere dense boundary, so it lands there everywhere (argument as in Scholze Corollary 3.3.17's uniqueness); the remaining properties pull back from the Siegel case.
2. (b) Compose with S2 genuine-to-image-comparison.
3. (c) Lan's closed immersions S^tor_{K^pK_p,Σ} ↪ S̃^tor_{K̃^pK̃_p,Σ̃}, compatible with the level maps and the maps to the minimal compactifications (Lan, Closed immersions of toroidal compactifications of Shimura varieties, Theorem 2.2, as used by Boxer–Pilloni; ShimuraCompactifications C3.general), exhibit the Hodge-type toroidal tower as Zariski closed in the perfectoid Siegel toroidal tower (S1 perfectoid-toroidal-siegel-tower), hence perfectoid. Torsor comparison: the Hodge-type canonical extension of M_dR (AutomorphicBundles:B3/canonical-and-subcanonical-extensions) is an M_μ-reduction of the restriction of the Siegel canonical extension by the datum-functoriality of canonical extensions (AutomorphicBundles:B3.general/general-boundary-functoriality); both M_HT and M_dR^{can} ×^{μ} ℤ_p(1) are M_μ-reductions of the restriction of the Siegel torsor, agree over the open part (hodge-levi-pullback) and equal the Zariski closures of their restrictions.

**Acceptance instances.**

- For the Siegel datum, (a) and (b) are S1 siegel-hodge-tate-period-map and (c) is the toroidal Siegel map.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S3/hodge-open-period-map`, `PerfectoidShimuraVarieties:S3/hodge-levi-pullback`, `PerfectoidShimuraVarieties:S3/siegel-tautological-pullback`, `PerfectoidShimuraVarieties:S2/hodge-image-compactified-tower`, `PerfectoidShimuraVarieties:S2/hodge-genuine-minimal-perfectoid-tower`, `PerfectoidShimuraVarieties:S2/genuine-to-image-comparison`, `PerfectoidShimuraVarieties:S1/perfectoid-toroidal-siegel-tower`, `PerfectoidShimuraVarieties:S1/siegel-hodge-tate-period-map`, `ShimuraCompactifications:C3/level-datum-functoriality`, `ShimuraCompactifications:C3/refinement-map`, `ShimuraCompactifications:C3.general/general-map-descent`, `ShimuraCompactifications:C3.general`, `AutomorphicBundles:B3/canonical-and-subcanonical-extensions`, `AutomorphicBundles:B3.general/general-boundary-functoriality`, `PerfectoidSpaces:P8/closed-loci-in-towers`, `HodgeTateAndCanonicalSubgroups:T6:comparison/hodge-type-comparison-agreement`.

**Sources.**

- [George Boxer, Vincent Pilloni, Higher Coleman theory](https://arxiv.org/abs/2110.10251v1), §4.4.27, p. 74. Perfect cone decompositions.
- [George Boxer, Vincent Pilloni, Higher Coleman theory (authors' revised manuscript)](https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf), §4.4.25, p. 75. The citation of Lan's closed-immersion theorem ([Lan22] = Lan, Math. Res. Lett. 29 (2022)).
- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §4.1, footnote 16, p. 1018. Scholze leaves the factorisation through the Hodge-type flag variety open; it is supplied by the Zariski-closure argument.

### Auxiliary normalised formal models with ample Hodge line and Hodge–Tate sections

Target `PerfectoidShimuraVarieties:S3/hodge-tate-formal-models` (theorem).

Siegel case (Pilloni–Stroh, author's version, Théorème 1.22, after Scholze's proof of Theorem 4.3.1, pp. 1029–1030): put B(g,p) = g/(p − 1) for odd p and B(g,2) = 2g; let n₀ be the least integer > B(g,p) (so n₀ = 2g + 1 if p = 2). For n ≥ n₀ there are normal admissible formal models 𝔛(pⁿ)^{⋆−mod} → 𝔛(pⁿ)^{⋆−HT} of the minimal compactification 𝒳(pⁿ)^⋆ of the level-Γ(pⁿ)K^p Siegel variety (over 𝒪_{ℂ_p}), the first a normalised blow-up on which det ω^{mod} (the subsheaf of det ω generated by Λ^g HT_n, with cokernel killed by p^{g/(p−1)}, resp. 4^g for p = 2) is invertible, the second covered by the affine formal schemes Spf H⁰(𝔘_i(pⁿ), 𝒪) for the Lagrangian Plücker charts i; for some k ≥ 1, det^k ω^{mod} descends to an ample invertible sheaf on 𝔛(pⁿ)^{⋆−HT}, and there are sections t_j of det^k ω^{mod} modulo p^{n₀−g/(p−1)} (modulo p^{n₀−2g} if p = 2) congruent to the k-th powers of the Plücker coordinates of Λ^g HT; the transition maps 𝔛(pⁿ)^{⋆−HT} → 𝔛(p^m)^{⋆−HT} are finite and everything is functorial in n and K^p. Scholze's own version gives, for each n, a level K_p and sections modulo pⁿ. Hodge type (Pilloni–Stroh Proposition 2.5): the normalisation of the schematic closure of the Hodge-type minimal compactification in the Siegel model, with the same ampleness and sections; the Hilbert–Siegel case is Boxer–Calegari–Gee–Pilloni §6.2.1. These are auxiliary normalised compactifications: only their generic fibres are the canonical minimal compactifications; they carry no semi-abelian scheme, boundary stratification or ordinary locus (Pilloni–Stroh Remarque 1.26). The stronger form used by Pilloni (§12.9.1) and Boxer–Calegari–Gee–Pilloni (§6.2.1), with det ω^{mod} itself descending and sections congruent modulo p^ε for every ε > 0 once n ≥ n(ε), is not proved in the cited sources (Pilloni–Stroh Remarque 1.23 states the descent of det ω^{mod} without proof); the consumers' arguments go through with a power of det ω^{mod} and sections modulo a fixed p^{ε′} (PerfectoidShimuraVarieties/E32).

**Hypotheses and conventions.**

- Siegel or Hodge-type (PEL) data; neat tame level; charts indexed by Lagrangian Plücker coordinates only (the published statements use all indices; PAPER-SCHOLZE-15/E16).
- Pilloni–Stroh's published numbering is inferred to send the author's Théorème 1.22 to Theorem 1.16, which is how Pilloni and Boxer–Calegari–Gee–Pilloni cite it.
- At p = 2 the statement with B(g,2) = 2g is conditional on the truncated-group integral estimate reported, but not proved, in Pilloni–Stroh Remarque 1.10. The accepted T5 suppliers retain this gap. The all-prime existence of the perfectoid Siegel tower does not prove this stronger integral model estimate.

**Proof route.**

1. Normalise the formal minimal compactification at level pⁿ (Pilloni–Stroh §1.1 normalisation, Proposition 1.13); Λ^g HT_n generates det ω^{mod} ⊆ det ω up to p^{g/(p−1)} (Fargues), so det ω^{mod} is invertible on the modified model (Corollaire 1.16 for the descent of ω^{mod} and the classes HT(e_i)).
2. Approximate the infinite-level Plücker sections on the Lagrangian charts by finite-level sections (density from S1 siegel-main-theorem (i); Lemma 1.20) and take norms down to level n₀ (Lemma 1.21), giving the t_j for det^k ω^{mod}.
3. The affine charts glue to the Stein factorisation of the semi-ample det^k ω^{mod}, giving 𝔛(pⁿ)^{⋆−HT} with det^k ω^{mod} ample (Théorème 1.22, Remarque 1.25).
4. Hodge type: pull back along the Siegel embedding and normalise (Proposition 2.5).

**Acceptance instances.**

- For g = 1 the Plücker coordinates are HT(e_1), HT(e_2); 𝔛(pⁿ)^{⋆−HT} is the Stein factorisation of the semi-ample det^k ω^{mod} on 𝔛(pⁿ)^{⋆−mod}, and the sections t_1, t_2 have no common zero on 𝔛(pⁿ)^{⋆−HT} modulo p^{n₀−g/(p−1)} (modulo p^{n₀−2g} for p = 2) (Pilloni–Stroh Remarque 1.25).
- The contraction 𝔛(pⁿ)^{⋆−mod} → 𝔛(pⁿ)^{⋆−HT} identifies ordinary with non-ordinary points and interior with boundary points (Pilloni–Stroh Remarque 1.26), so 𝔛(pⁿ)^{⋆−HT} carries no universal semi-abelian scheme and no ordinary locus.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S1/siegel-main-theorem`, `PerfectoidShimuraVarieties:S3/siegel-tautological-pullback`, `AdicSpacesPartII:R2/admissible-blow-up`, `HodgeTateAndCanonicalSubgroups:T5/modified-hodge-bundle`, `HodgeTateAndCanonicalSubgroups:T5/modified-minimal-model`.

**Sources.**

- [Vincent Pilloni, Benoît Stroh, Cohomologie cohérente et représentations Galoisiennes](https://www.imo.universite-paris-saclay.fr/~pilloni/koko.pdf), §1.19, Théorème 1.22 and Remarques 1.23–1.26, PDF pp. 8–10. The modified sheaf and the Hodge–Tate classes descend; Théorème 1.22 follows.
- [Vincent Pilloni, Benoît Stroh, Cohomologie cohérente et représentations Galoisiennes](https://www.imo.universite-paris-saclay.fr/~pilloni/koko.pdf), §1.19, Remarque 1.26, PDF p. 10. The contraction identifies ordinary with non-ordinary points; the t_j are base-point free (Remarque 1.25).
- [Vincent Pilloni, Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), §12.9.1, p. 81. Pilloni's restatement (its locator '[71], p. 72' is an arXiv page of Scholze; the Annals pages are 1029–1030).
- [George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, Abelian surfaces over totally real fields are potentially modular](https://arxiv.org/abs/1812.09269v3), §6.2.1, arXiv pp. 144–145. The Hilbert–Siegel form.
- [Vincent Pilloni, Benoît Stroh, Cohomologie cohérente et représentations Galoisiennes](https://www.imo.universite-paris-saclay.fr/~pilloni/koko.pdf), §1.8, Théorème 1.9 and Remarques 1.10–1.11, p. 5 (author version). Odd-prime cokernel estimate; the p = 2 bound is explicitly an unwritten input.

### The elliptic period map: quotient-line description, π_HT^*𝒪(1) = ω and the automorphy factor cz + d

Target `PerfectoidShimuraVarieties:S3/elliptic-hodge-tate-and-O1` (theorem).

Let 𝒳*_{Γ(p^∞)} be the perfectoid modular curve (g = 1 of S1) over a perfectoid L ⊇ ℚ_p^cycl, with points (E, μ_N-level, α: ℤ_p² ≅ T_pE) and BHW's left action γ·(E, α) = (E, α ∘ γ^∨), γ^∨ = det(γ)γ⁻¹, i.e. γ·x = x·γ^∨ for the right action x·f = (E, α ∘ f) of S0 (γ ↦ γ^∨ is an anti-automorphism, (γδ)^∨ = δ^∨γ^∨, so it turns the right action into a left action). (i) The C-points of the total space of 𝒪(1) over ℙ¹ are pairs (L, y) of a line L ⊆ C² and y ∈ C²/L, and π_HT^*𝒪(1) ≅ ω is the quotient-line identification C²/L ≅ ω_E through HT ∘ α (HT: T_pE → ω_E, L = ker(HT ∘ α)); this form needs no Tate trivialisation. (ii) The section s: (x : y) ↦ (C² → C²/⟨(x, y)⟩, image of (1, 0)) of 𝒪(1) is nowhere zero off ∞ = (1 : 0); for γ = (a b; c d) ∈ Γ₀(p) one has γ^*s = (cz + d)s, where z is the coordinate of (z : 1); hence 𝔰 := π_HT^*s satisfies γ^*𝔰 = (c𝔷 + d)𝔰 on the anticanonical locus and 𝔰(E, α) = HT(α(e_1)). (iii) In Pan's normalisation (V = ℚ_p² the standard representation, Tate module V(1) = V^∨), the relative Hodge–Tate sequence is 0 → ω⁻¹(1) → V(1) ⊗ 𝒪 → ω → 0, the position of ω⁻¹ defines π_HT: 𝒳 → ℙ¹, and the tautological ample ω_Fl pulls back to ω(−1). (iv) Unlike the complex case (γ^*η_can = (cz + d)⁻¹η_can, trivialising ω_E), the p-adic section trivialises ω_{E^∨} and transforms with (cz + d).

**Hypotheses and conventions.**

- Modular curve of tame level K^p ⊆ GL_2(𝔸_f^p) with Γ(N), N ≥ 3, or Γ₁(N), N ≥ 4, prime to p (BHW), or neat K^p (Pan).
- The statement of BHW Lemma 3.19 misprints γ^*s = (cz + d)γ for (cz + d)s (PerfectoidShimuraVarieties/E24).

**Proof route.**

1. Import T2’s open-tower map and quotient-bundle identification. This node identifies its analytic incarnation and the stated convention on S2’s representative; compactified extensions require S3’s extension theorem.
2. (i) is Scholze Theorem 3.3.18(vi) for g = 1 (siegel-tautological-pullback), unwound on points (BHW Lemma 3.17).
3. (ii) The equivariant structure on 𝒪(1) compatible with BHW's action is γ ↦ det(γ)⁻¹γ, so γ⁻¹ acts by γ^∨ and γ^*s(z) = γ^∨(1, 0) = (d, −c) ≡ (cz + d, 0) modulo ⟨(z, 1)⟩ (BHW Lemma 3.19); 𝔰(x) = HT(α(e_1)) (BHW Proposition 3.21).
4. (iii) Pan §3.1.1 from Scholze, with the Tate twists kept; (iv) BHW Remark 3.23.

**Acceptance instances.**

- For γ = (1 0; p 1) ∈ Γ₀(p), γ^*𝔰 = (p𝔷 + 1)𝔰, a unit multiple on the anticanonical locus where |𝔷| ≤ 1.
- The weight-k specialisation: sections of ω^{⊗k} on the anticanonical locus are f𝔰^k with γ^*f = (c𝔷 + d)^{−k}f.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S3/siegel-tautological-pullback`, `PerfectoidShimuraVarieties:S3/levi-torsor-over-flag-variety`, `PerfectoidShimuraVarieties:S1/siegel-hodge-tate-period-map`, `AutomorphicBundles:B4/gl2-hodge-line-comparison`, `ShimuraVarieties:V8/gl2-compact-model`, `HodgeTateAndCanonicalSubgroups:T2/open-tower-hodge-tate-map`, `HodgeTateAndCanonicalSubgroups:T2/open-tower-levi-pullback`.

**Sources.**

- [Christopher Birkbeck, Ben Heuer, Chris Williams, Overconvergent Hilbert modular forms via perfectoid modular varieties](https://arxiv.org/abs/1902.03985v4), §3.3, formula (3.2), Lemma 3.17, Definition 3.18, Lemma 3.19, Proposition 3.21, Remark 3.23, pp. 12–14. BHW's comparison with the complex case.
- [Lue Pan, On locally analytic vectors of the completed cohomology of modular curves II](https://arxiv.org/abs/2209.06366v1), §3.1.1, sequence (3.1.1), p. 17. Pan's twist normalisation.

### The Hecke-equivariant relative Hodge–Tate sequence of the modular curve

Target `PerfectoidShimuraVarieties:S3/hecke-equivariant-hodge-tate-sequence` (comparison).

On the perfectoid modular curve 𝒳_{K^p} over C, let D be the canonical extension of H¹_dR of the universal elliptic curve at finite level, with Fil¹D = ω and gr⁰D = ∧²D ⊗ ω⁻¹. The sequence 0 → ω⁻¹(1) → V(1) ⊗ 𝒪 → ω → 0 depends on an implicit trivialisation c ∈ H⁰(∧²D) (a GL_2(Ẑ)-fixed nowhere vanishing section, on which GL_2(𝔸_f) acts through |det|_𝔸⁻¹) and is not equivariant for the prime-to-p Hecke action; the Hecke-equivariant form is 0 → ∧²D ⊗ ω⁻¹(1) → V(1) ⊗ 𝒪 → ω → 0 (Pan (4.2.1)). Taking ∧² gives 𝒪 ≅ (∧²D)⁻¹ ⊗ 𝒪 ⊗ det(1) with t = c⁻¹ ⊗ 1 ⊗ b for a fixed basis b of ℚ_p(1), and the identifications (4.2.2)–(4.2.3) of Pan are independent of the trivialisations of ∧²D and ℚ_p(1). (Pan prints gr¹D for the subobject; by his own convention Fil¹D = ω it is gr⁰D; PerfectoidShimuraVarieties/E25.)

**Hypotheses and conventions.**

- Modular curve, neat tame level; D with its Hodge filtration and Kodaira–Spencer isomorphism (AutomorphicBundles B2/B3).

**Proof route.**

1. The subobject of the relative Hodge–Tate sequence is identified, Hecke-equivariantly, with gr⁰ of the de Rham bundle tensored with 𝒪(1) (Pan's construction in Pan 2022, 4.1.3); the untwisted form chooses c.
2. Compute the Hecke action on c through the adelic norm of the determinant, and take ∧².

**Acceptance instances.**

- Under the choice of c, (4.2.1) becomes (3.1.1) of elliptic-hodge-tate-and-O1 (iii).

**Direct prerequisites.** `PerfectoidShimuraVarieties:S3/elliptic-hodge-tate-and-O1`, `PerfectoidShimuraVarieties:S3/hodge-levi-pullback`, `AutomorphicBundles:B3/canonical-and-subcanonical-extensions`, `AutomorphicBundles:B2/filtered-de-rham-coefficient`.

**Sources.**

- [Lue Pan, On locally analytic vectors of the completed cohomology of modular curves II](https://arxiv.org/abs/2209.06366v1), §4.2.3, sequences (4.2.1)–(4.2.3), p. 38. The Hecke-equivariant correction.
- [Lue Pan, On locally analytic vectors of the completed cohomology of modular curves II](https://arxiv.org/abs/2209.06366v1), §4.2.3, p. 38. Independence of the trivialisations.

### The Hilbert period map to Res_{𝒪_F/ℤ}ℙ¹ and its factors after splitting

Target `PerfectoidShimuraVarieties:S3/hilbert-res-flag-period-map` (theorem).

Let F be totally real of degree g, G* = Res_{F/ℚ}GL_2 ×_{Res G_m} G_m the Hodge-type Hilbert datum (ShimuraData:D5/hilbert-star-datum) with its trace-form embedding, and 𝒳_{Γ*(p^∞)} the open perfectoid Hilbert tower over a perfectoid L ⊇ ℚ_p^cycl. (i) The flag variety of G* is Res_{𝒪_F|ℤ}ℙ¹, the adic analytification of R ↦ ℙ¹(R ⊗_ℤ 𝒪_F), and π_HT: 𝒳_{Γ*(p^∞)} → Res_{𝒪_F|ℤ}ℙ¹ sends (A, α: 𝒪_p² ≅ T_pA^∨) to the 𝒪_p ⊗ C-line given by 0 → Lie(A^∨)(1) → T_pA^∨ ⊗ C → ω_A → 0 (the dual Tate module, unlike the elliptic case). (ii) ω_{Γ*(p^∞)} = π_HT^*Res_{𝒪_F|ℤ}𝒪(1), Res G_m-equivariantly, with the section s = Res s_ell, 𝔰 = π_HT^*s, 𝔰(A, α) = HT_A(α(1, 0)), and γ^*𝔰 = (c𝔷 + d)𝔰 for γ ∈ Γ*₀(p), where c𝔷 + d: Res Ĝ_a → Res Ĝ_m. (iii) After an extension L′ of L in which F splits (𝒪_F ⊗ L′ = ∏_{v∈Σ} L′, Σ = Hom(𝒪_F, L′)), Res ℙ¹ = (ℙ¹)^Σ, Res 𝒪(1) = ⊕_v π_v^*𝒪(1), s = Σ_v s_v and the coordinates z_v are functions; over L itself the components z_v have no such interpretation. The extension of π_HT to the intermediate and arithmetic Hilbert towers of G = Res_{F/ℚ}GL_2 (through (x, u) ↦ diag(u, 1)·π_HT(x) on the span, polarization invariance and descent) is not part of this node: it is owned by PerfectoidShimuraVarieties:S5/hilbert-period-and-domain-compatibility, which builds on this node.

**Hypotheses and conventions.**

- Totally real F, p arbitrary; 𝒳_{Γ*(p^∞)} is the open perfectoid tower of the Hodge-type (PEL) datum G* (hodge-open-period-map), with BHW's moduli description (A, α: 𝒪_p² ≅ T_pA^∨).

**Proof route.**

1. Import T2’s open-tower map and quotient-bundle identification. This node identifies its analytic incarnation and the stated convention on S2’s representative; compactified extensions require S3’s extension theorem.
2. (i) Caraiani–Scholze Theorem 2.1.3 for G* (hodge-open-period-map), with the flag variety identified with Res ℙ¹ through the 𝒪_F-linear Hodge–Tate filtration (BHW Remark 5.15).
3. (ii) Caraiani–Scholze Theorem 2.1.3(2) in the quotient form (hodge-levi-pullback), fibrewise through HT: 𝒪_p² ⊗ C → T_pA^∨ ⊗ C → ω_A (BHW Proposition 5.25, Lemma 5.32); the automorphy factor is checked after extending L until F splits, where it is the product of elliptic factors (BHW Lemma 5.29).
4. (iii) Base change of Res along a splitting field.

**Acceptance instances.**

- For F = ℚ it is elliptic-hodge-tate-and-O1 (with T_pA^∨ ≅ T_pA through the principal polarization).
- For F real quadratic and p split, after base change Res ℙ¹ = ℙ¹ × ℙ¹ and 𝔰 = 𝔰_1 + 𝔰_2 with each 𝔰_v transforming by c_v𝔷_v + d_v.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S3/hodge-open-period-map`, `PerfectoidShimuraVarieties:S3/hodge-levi-pullback`, `PerfectoidShimuraVarieties:S3/elliptic-hodge-tate-and-O1`, `PerfectoidShimuraVarieties:S3/hodge-period-map-datum-functoriality`, `ShimuraData:D5/hilbert-star-datum`, `ShimuraData:D5/hilbert-trace-embedding`, `AutomorphicBundles:B4/hilbert-coefficient`, `AutomorphicBundles:B4/unsplit-hilbert-descent`, `mathlib:NumberField.RingOfIntegers`, `HodgeTateAndCanonicalSubgroups:T2/open-tower-hodge-tate-map`, `HodgeTateAndCanonicalSubgroups:T2/open-tower-levi-pullback`.

**Sources.**

- [Christopher Birkbeck, Ben Heuer, Chris Williams, Overconvergent Hilbert modular forms via perfectoid modular varieties](https://arxiv.org/abs/1902.03985v4), §5.3, p. 23. The Hilbert flag variety.
- [Christopher Birkbeck, Ben Heuer, Chris Williams, Overconvergent Hilbert modular forms via perfectoid modular varieties](https://arxiv.org/abs/1902.03985v4), §5.4, Remark 5.21, p. 25. Components only after splitting.

### A basis of affinoids of the flag variety with affinoid perfectoid preimages from finite level

Target `PerfectoidShimuraVarieties:S3/affinoid-perfectoid-basis-of-flag-variety` (lemma).

For the Siegel datum (and, by pullback along hodge-compactified-period-maps (a), for Hodge-type data), there is a basis 𝔅 of open affinoid subsets of Fl, stable under finite intersections, such that for every U ∈ 𝔅 the preimage V_∞ = π_HT⁻¹(U) ⊆ 𝒳*_{Γ(p^∞)} is affinoid perfectoid, is the preimage of an affinoid V_{K_p} ⊆ 𝒳*_{K_pK^p} for all sufficiently small K_p, and colim_{K_p} H⁰(V_{K_p}, 𝒪) → H⁰(V_∞, 𝒪) has dense image. For g = 1 one may take 𝔅 = finite intersections of rational subsets of U₁ = {|x| ≤ 1} and U₂ = {|x| ≥ 1}.

**Hypotheses and conventions.**

- Siegel datum with S1's tame level, or Hodge type through the image compactification.

**Proof route.**

1. Take 𝔅 = rational subsets of the Lagrangian charts Fl_J; S1 siegel-main-theorem (i) gives the charts, and rational subsets of good affinoid perfectoids are good (PerfectoidSpaces:P7/good-affinoid-perfectoid-basis, Scholze's survey Proposition 2.22(ii)).
2. On overlapping admissible Plücker charts, express chart membership and rational domains by the corresponding finite inequalities between Plücker coordinates. Their finite intersections are rational domains in a containing chart, and their pullbacks are rational domains in good affinoid perfectoids. Use these explicit inequalities to form an intersection-stable basis; separatedness alone does not imply that intersections of affinoids are rational.

**Acceptance instances.**

- For g = 1 the basis consists of the rational subsets of the two discs of ℙ¹, as in Pan §3.2.1.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S1/siegel-main-theorem`, `PerfectoidShimuraVarieties:S3/hodge-compactified-period-maps`, `PerfectoidSpaces:P7/good-affinoid-perfectoid-basis`.

**Sources.**

- [Lue Pan, On locally analytic vectors of the completed cohomology of modular curves II](https://arxiv.org/abs/2209.06366v1), §3.2.1, pp. 18–19. The basis used by Pan.
- [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §3.1, Theorem 3.1.2(iii), p. 972. Scholze's formulation of the affinoid basis.

## S4 — Pre-abelian perfectoid representability

Coverage: **planned**.

- Gap: the perfectoidization of integral algebras (Bhatt–Scholze 10.11), used in Propositions 5.18–5.19.
- Requests to ShimuraData D4 (connected data, pre-abelian connected type) and ShimuraVarieties V2 (Baily–Borel compactifications for arbitrary arithmetic groups) are open.

### Property 𝒫: perfectoidness of all minimally compactified towers of a datum

Target `PerfectoidShimuraVarieties:S4/property-p` (definition).

A Shimura datum (G, X) satisfies Property 𝒫 if for every compact open K^p ⊆ G(𝔸_f^p) the diamond 𝒳*_{K^p}(G, X) = lim_{K_p} 𝒳*_{K^pK_p}(G, X)^◇ over Spd C is a perfectoid space; equivalently (property-p-full-iff-neutral) the neutral-component diamonds 𝒳*_{K^p}(G, X)⁰ are perfectoid for every K^p. A connected Shimura datum (G, X⁺) satisfies Property 𝒫 if for every arithmetic subgroup Γ the diamond 𝒳*_{Γ,∞}(G, X⁺) = lim_{K_p} 𝒳*_{Γ∩K_p}(G, X⁺)^◇ is perfectoid, with Γ ∩ K_p := Γ ∩ (G(𝔸_f^p)K_p). For the connected definition we take Γ ⊆ G(ℚ)_+ arithmetic with K_p ⊆ G(ℚ_p) compact open; for G adjoint this coincides with Hansen–Johansson's reading Γ ⊆ G^ad(ℚ)^+, and S4 uses their reading only in that case. For G semisimple but not adjoint the towers of Γ and of its image π(Γ) in G^ad are in general not isomorphic (property-p-from-adjoint).

**Hypotheses and conventions.**

- Over C as in Hansen–Johansson §5.3: complex Shimura varieties and their Baily–Borel compactifications base changed along a fixed isomorphism ℂ ≅ ℂ_p to a complete algebraically closed C ⊇ ℂ_p; the comparison with the canonical-model formulation over E ⊆ C is preabelian-reflex-bridge.
- Hansen–Johansson's Definition 5.17 intersects Γ ⊆ G^ad(ℚ)^+ with K_p ⊆ G(ℚ_p), which is consistent only for G = G^ad; the reading above is the one their Proposition 5.18 uses (PerfectoidShimuraVarieties/E16). A connected Shimura datum here has G semisimple, as in Hansen–Johansson §4.1, Remark 4.2, p. 23; it is not an arbitrary reductive group with a positive-dimensional centre.

**Proof route.**

1. Definition; the connected towers are those of PerfectoidShimuraVarieties:S0/connected-component-tower (connectedDatumTower), with minimal compactifications of arithmetic quotients supplied by ShimuraVarieties V2 (request).

**Planning API.**

- `ShimuraTower.PropertyP` (data): The predicate on a Shimura datum: all minimally compactified towers have perfectoid diamonds.
- `ShimuraTower.ConnectedPropertyP` (data): The predicate on a connected datum (G, X⁺): all 𝒳*_{Γ,∞}(G, X⁺) are perfectoid.
- `ShimuraTower.propertyP_iff_neutral` (characterisation): Property 𝒫 holds iff the neutral-component towers are perfectoid for all K^p.
- `ShimuraTower.propertyP_of_adjoint` (functoriality): Property 𝒫 for (G^ad, X⁺) implies it for (G, X) and for (G, X⁺).
- `ShimuraTower.propertyP_hodge` (constructor): Hodge-type data satisfy Property 𝒫.
- `ShimuraTower.propertyP_iso` (functoriality): Property 𝒫 is invariant under isomorphism of (connected) data.

**Unit tests.**

- `propertyP_siegel` (computation): The Siegel datum (GSp_2g, H_g^±) satisfies Property 𝒫.
- `propertyP_torus` (degenerate): A torus datum satisfies Property 𝒫: its towers are profinite sets over Spd C, whose diamonds are affinoid perfectoid (DiamondsAndVStacks:D4/compact-hausdorff-diamonds).
- `propertyP_not_open_only` (non-example): For G = GL_2 the diamond 𝒳*_{K^p}(G, X) is quasicompact (a limit of projective curves, a spatial diamond), while the open tower 𝒳_{K^p}(G, X) is not quasicompact; Property 𝒫 is the statement about the former.
- `propertyP_level_independent` (compatibility): Property 𝒫 at one cofinal level family is Property 𝒫 at all (PerfectoidSpaces:P7/tilde-limit-cofinal-change for diamonds of cofinal subsystems).

**Acceptance instances.**

- The Siegel datum satisfies Property 𝒫 (S2 siegel-tame-level-removal).
- A Hodge-type datum satisfies Property 𝒫 (S2 hodge-genuine-minimal-perfectoid-tower over C, through the identification of the canonical-model towers with the complex towers made in hodge-adjoint-property-p).

**Direct prerequisites.** `PerfectoidShimuraVarieties:S0/infinite-level-diamond`, `PerfectoidShimuraVarieties:S0/connected-component-tower`, `PerfectoidShimuraVarieties:S0/component-set-of-infinite-level`, `ShimuraVarieties:V2`, `ShimuraData:D4/shimura-datum`, `ShimuraData:D4/adjoint-datum`, `ShimuraData:D4`, `PerfectoidSpaces:P7/tilde-limit-cofinal-change`.

**Sources.**

- [David Hansen, Christian Johansson, Perfectoid Shimura varieties and the Calegari–Emerton conjectures](https://arxiv.org/abs/2011.03951v2), §5.3, Proposition 5.16 and Definition 5.17, p. 36. Definition of Property 𝒫.
- [David Hansen, Christian Johansson, Perfectoid Shimura varieties and the Calegari–Emerton conjectures](https://arxiv.org/abs/2011.03951v2), §5.3, Definition 5.17, p. 36. The connected version.

### The full tower is perfectoid iff the neutral-component tower is

Target `PerfectoidShimuraVarieties:S4/property-p-full-iff-neutral` (theorem).

For a Shimura datum (G, X) over C, the following are equivalent: (1) 𝒳*_{K^p}(G, X) is perfectoid for every K^p; (2) 𝒳*_{K^p}(G, X)⁰ is perfectoid for every K^p.

**Hypotheses and conventions.**

- Over C as in Hansen–Johansson §5.3: complex Shimura varieties and their Baily–Borel compactifications base changed along a fixed isomorphism ℂ ≅ ℂ_p to a complete algebraically closed C ⊇ ℂ_p; the comparison with the canonical-model formulation over E ⊆ C is preabelian-reflex-bridge.

**Proof route.**

1. (1 ⇒ 2): 𝒳*_{K^p}(G, X)⁰ = ⋂_{K_p} X_{K_p} = lim_{K_p} X_{K_p}, where X_{K_p} ⊆ 𝒳*_{K^p}(G, X) is the open and closed subfunctor over the finite-level neutral component; it is only closed. For an open affinoid perfectoid U ⊆ 𝒳*_{K^p}(G, X), each U ∩ X_{K_p} is open and closed in U, hence affinoid perfectoid (cut out by an idempotent), and U ∩ 𝒳*_{K^p}(G, X)⁰ = lim_{K_p}(U ∩ X_{K_p}) is a cofiltered limit of affinoid perfectoids, hence affinoid perfectoid (PerfectoidSpaces:P5/cofiltered-limits-of-affinoid-perfectoid-spaces: the limit in perfectoid spaces represents the limit functor); varying U covers 𝒳*_{K^p}(G, X)⁰ (Hansen–Johansson's argument for Proposition 5.16).
2. (2 ⇒ 1): π₀(𝒳*_{K^p}(G, X)) is the profinite set cl(G(ℚ)_+)\G(𝔸_f)/K^p (PerfectoidShimuraVarieties:S0/component-set-of-infinite-level, without the simply connected hypothesis via finiteness of class numbers, Borel); K_p acts with finitely many open orbits; each component is the image of a neutral-component tower at a conjugate tame level under T_{g_p} and a prime-to-p Hecke translation.
3. Apply PerfectoidSpaces:P8/perfectoid-from-perfectoid-components (Hansen–Johansson Lemma 5.1) to the spatial diamond 𝒳*_{K^p}(G, X) with its K_p-action.

**Acceptance instances.**

- For GL_2, both towers are perfectoid (the perfectoid modular curve and its neutral component).

**Direct prerequisites.** `PerfectoidShimuraVarieties:S4/property-p`, `PerfectoidShimuraVarieties:S0/component-set-of-infinite-level`, `PerfectoidShimuraVarieties:S0/connected-component-tower`, `PerfectoidShimuraVarieties:S0/tower-right-action`, `PerfectoidSpaces:P8/perfectoid-from-perfectoid-components`, `PerfectoidSpaces:P5/cofiltered-limits-of-affinoid-perfectoid-spaces`, `ShimuraVarieties:V0/component-decomposition`.

**Sources.**

- [David Hansen, Christian Johansson, Perfectoid Shimura varieties and the Calegari–Emerton conjectures](https://arxiv.org/abs/2011.03951v2), §5.3, Proposition 5.16 with proof, pp. 35–36. The orbit finiteness used with Lemma 5.1.
- [David Hansen, Christian Johansson, Perfectoid Shimura varieties and the Calegari–Emerton conjectures](https://arxiv.org/abs/2011.03951v2), §5.3, proof of Proposition 5.16, p. 36. The (1 ⇒ 2) step through cofiltered limits of affinoid perfectoids.

### Property 𝒫 descends from the adjoint connected datum

Target `PerfectoidShimuraVarieties:S4/property-p-from-adjoint` (theorem).

Let (G, X) be a Shimura datum or a connected Shimura datum with G semisimple. If (G^ad, X⁺) satisfies Property 𝒫, then so does (G, X).

**Hypotheses and conventions.**

- Over C as in Hansen–Johansson §5.3: complex Shimura varieties and their Baily–Borel compactifications base changed along a fixed isomorphism ℂ ≅ ℂ_p to a complete algebraically closed C ⊇ ℂ_p; the comparison with the canonical-model formulation over E ⊆ C is preabelian-reflex-bridge.
- Uses the perfectoidization of integral algebras through PerfectoidSpaces:P8/finite-tower-over-perfectoid-tower (recorded gap).

**Proof route.**

1. Connected case (G semisimple, hence Z = ker π finite): let Γ ⊆ G(ℚ)_+ be arithmetic and π: G → G^ad. Then Γ ∩ K_p acts on X⁺ through π, so 𝒳*_{Γ∩K_p}(G, X⁺) = 𝒳*_{π(Γ∩K_p)}(G^ad, X⁺), and π(Γ) is arithmetic in G^ad (Platonov–Rapinchuk Theorem 4.1). Since π(Γ) ∩ π(K_p) = π(Γ ∩ Z(ℚ_p)K_p) with Z = ker π finite, π(Γ ∩ K_p) has finite index in π(Γ) ∩ π(K_p), so the maps 𝒳*_{π(Γ∩K_p)}(G^ad, X⁺) → 𝒳*_{π(Γ)∩π(K_p)}(G^ad, X⁺) are finite (ShimuraVarieties V2 request), compatible in K_p, with finite transition maps; π(K_p) runs through a cofinal family of compact opens of G^ad(ℚ_p) (π is open on ℚ_p-points with finite kernel; PerfectoidSpaces:P7/compact-open-subgroup-cofinality), so the target limit is 𝒳*_{π(Γ),∞}(G^ad, X⁺), perfectoid by hypothesis, and PerfectoidSpaces:P8/finite-tower-over-perfectoid-tower applies. The two towers need not coincide: if the closure of Γ in G(ℚ_p) contains a central z ∉ Z(ℚ), elements γ ∈ Γ close to z have π(γ) ∈ π(K_p) but no preimage in Γ ∩ K_p, so {π(Γ ∩ K_p)} and {π(Γ) ∩ K′_p} are not mutually cofinal (for instance G = SU(2,1) for ℚ(i)/ℚ, p ≡ 1 mod 12, where Z(ℚ) = 1, Z(ℚ_p) ≅ μ_3 and Γ is dense in K_p by strong approximation); Hansen–Johansson's equality 𝒳_{Γ,∞}(G, X⁺) = 𝒳_{π(Γ),∞}(G^ad, X⁺) is not used.
2. Shimura-datum case: by property-p-full-iff-neutral it suffices to treat neutral components. Choose a congruence Γ = G^ad(ℚ)^+ ∩ K with π(K^p) ⊆ K ∩ G^ad(𝔸_f^p); the neutral component (G(ℚ)_+ ∩ K^pK_p)\X⁺ = π(G(ℚ)_+ ∩ K^pK_p)\X⁺ maps finitely to 𝒳*_{Γ∩π(K_p)}(G^ad, X⁺), compatibly in K_p (finite maps of Baily–Borel compactifications: ShimuraVarieties V2 request).
3. π(K_p) is cofinal in G^ad(ℚ_p), so the target limit is 𝒳*_{Γ,∞}(G^ad, X⁺), perfectoid by hypothesis; apply PerfectoidSpaces:P8/finite-tower-over-perfectoid-tower.

**Acceptance instances.**

- For G = GL_2, (G^ad, X⁺) = (PGL_2, ℍ) and the statement deduces the perfectoid modular curve from the perfectoid tower of PGL_2-congruence quotients of ℍ.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S4/property-p`, `PerfectoidShimuraVarieties:S4/property-p-full-iff-neutral`, `PerfectoidSpaces:P8/finite-tower-over-perfectoid-tower`, `PerfectoidSpaces:P7/compact-open-subgroup-cofinality`, `ShimuraVarieties:V2`, `ShimuraVarieties:V0/stabilizer-arithmetic`.

**Sources.**

- [David Hansen, Christian Johansson, Perfectoid Shimura varieties and the Calegari–Emerton conjectures](https://arxiv.org/abs/2011.03951v2), §5.3, Proposition 5.18 with proof, p. 36. The final step of Proposition 5.18.
- [David Hansen, Christian Johansson, Perfectoid Shimura varieties and the Calegari–Emerton conjectures](https://arxiv.org/abs/2011.03951v2), §5.3, proof of Proposition 5.18, connected case, p. 36. The equality asserted in the connected case, replaced here by the finite-map argument.

### For a Hodge-type datum, the adjoint connected datum has Property 𝒫

Target `PerfectoidShimuraVarieties:S4/hodge-adjoint-property-p` (theorem).

Let (G, X) be a Shimura datum of Hodge type. Then for every arithmetic subgroup Γ ⊆ G^ad(ℚ)^+, the diamond 𝒳*_{Γ,∞}(G^ad, X⁺) = lim_{K_p ⊆ G^ad(ℚ_p)} 𝒳*_{Γ∩K_p}(G^ad, X⁺)^◇ over C is a perfectoid space.

**Hypotheses and conventions.**

- Over C as in Hansen–Johansson §5.3: complex Shimura varieties and their Baily–Borel compactifications base changed along a fixed isomorphism ℂ ≅ ℂ_p to a complete algebraically closed C ⊇ ℂ_p; the comparison with the canonical-model formulation over E ⊆ C is preabelian-reflex-bridge.
- Uses S2 hodge-good-tower-arbitrary-level (stated over C) and PerfectoidSpaces:P8 quotients of good towers; through these, the perfectoidization of integral algebras (recorded gap).

**Proof route.**

1. Identification with the complex towers of §5.3: let σ: E ⊆ ℂ ≅ ℂ_p ⊆ C be the composite of the inclusion of the reflex field in ℂ with the fixed isomorphism, and 𝔭 the place of E it induces. The canonical models Sh_K(G, X) over E (ShimuraVarieties:V6/hodge-canonical) and their minimal compactifications (ShimuraVarieties:V8/minimal-descent, whose E-model induces the complex Baily–Borel compactification) base change along E ⊆ ℂ to the complex Shimura varieties and their Baily–Borel compactifications, compatibly with level maps (ShimuraVarieties:V8/minimal-map-extension); so the S2 towers over C through σ are the towers 𝒳*_{K}(G, X) of §5.3, and the neutral components (Zariski closures of the image of X⁺ × {1}) correspond. preabelian-reflex-bridge cannot be used here, since it depends on this node.
2. Congruence case. Let π: G → G^ad. Choose a congruence Γ′ = K ∩ G(ℚ)_+ with π(Γ′) ⊆ Γ and put Γ″ = Γ′ ∩ G^der(ℚ). Take a cofinal chain K_{p,n} in G(ℚ_p) with K^der_{p,n} = K_{p,n} ∩ G^der(ℚ_p), arranged so that K^der_{p,0} ∩ Z_G(ℚ_p) = {1} and Γ″ ⊆ K^der_{p,0}; then π is injective on Γ″ and π(Γ″ ∩ K_{p,n}) = π(Γ″) ∩ π(K^der_{p,n}).
3. The level-wise finite map of towers 𝒳*_{π(Γ″∩K_{p,n})}(G^ad, X⁺) → 𝒳*_{K∩K_{p,n}}(G, X) lands in a good tower over C (S2 hodge-good-tower-arbitrary-level, through the identification of the first step).
4. Let Γ‴ be the normal core of π(Γ″) in Γ (arithmetic, normal of finite index); Δ_n := (Γ‴ ∩ π(K^der_{p,n}))\(Γ ∩ π(K^der_{p,n})) is finite with injective transition maps, so Δ := Δ_n for n ≫ 0; Δ acts on the tower (𝒳*_{Γ‴∩π(K^der_{p,n})}(G^ad, X⁺))_n with quotients 𝒳*_{Γ∩π(K^der_{p,n})}(G^ad, X⁺). (The published diagram writes π(Γ‴) for Γ‴; PerfectoidShimuraVarieties/E19.)
5. Two applications of PerfectoidSpaces:P8/good-towers-under-finite-maps make the Γ‴-tower good; PerfectoidSpaces:P8/quotient-of-good-tower gives the quotient by Δ perfectoid and equal to lim_n 𝒳*_{Γ∩π(K^der_{p,n})}; π(K^der_{p,n}) is cofinal in G^ad(ℚ_p) because the image of G^der(ℚ_p) is open.
6. Arithmetic case: every arithmetic Γ lies in a congruence Γ′ ⊆ G^ad(ℚ)^+ (Hansen–Johansson Propositions 2.11 and 2.13; Deligne 2.0.14); the maps 𝒳*_{Γ∩K_p} → 𝒳*_{Γ′∩K_p} are finite, and P8/finite-tower-over-perfectoid-tower applies.

**Acceptance instances.**

- For the Siegel datum, the adjoint connected datum is (PGSp_2g, H_g⁺) and Γ = PSp_2g(ℤ)-congruence subgroups: their towers are perfectoid.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S4/property-p-from-adjoint`, `PerfectoidShimuraVarieties:S2/hodge-good-tower-arbitrary-level`, `PerfectoidSpaces:P8/good-towers-under-finite-maps`, `PerfectoidSpaces:P8/quotient-of-good-tower`, `PerfectoidSpaces:P8/finite-tower-over-perfectoid-tower`, `ShimuraVarieties:V2`, `ShimuraVarieties:V6/hodge-canonical`, `ShimuraVarieties:V8/minimal-descent`, `ShimuraVarieties:V8/minimal-map-extension`.

**Sources.**

- [David Hansen, Christian Johansson, Perfectoid Shimura varieties and the Calegari–Emerton conjectures](https://arxiv.org/abs/2011.03951v2), §5.3, Proposition 5.19 with proof (congruence case), pp. 36–37. The first comparison of the proof.
- [David Hansen, Christian Johansson, Perfectoid Shimura varieties and the Calegari–Emerton conjectures](https://arxiv.org/abs/2011.03951v2), §5.3, proof of Proposition 5.19 (arithmetic case), pp. 37–38. The reduction of the arithmetic case to the congruence case.

### Minimally compactified towers of pre-abelian Shimura data are perfectoid

Target `PerfectoidShimuraVarieties:S4/preabelian-minimal-perfectoid` (theorem).

Let (G, X) be a Shimura datum (resp. a connected Shimura datum) of pre-abelian type (ShimuraData:D4/preabelian-type). Then for every compact open K^p ⊆ G(𝔸_f^p) the diamond 𝒳*_{K^p}(G, X) = lim_{K_p} 𝒳*_{K^pK_p}(G, X)^◇ over C is a perfectoid space (resp. for every arithmetic Γ the diamond 𝒳*_{Γ,∞}(G, X⁺) is perfectoid): pre-abelian data satisfy Property 𝒫. This is a representability statement only: no Hodge–Tate period map on these towers is asserted (the revised Hansen–Johansson paper removed it; S6 supplies the abelian-type minimal period map separately). The identification is with the diamond limit; a Scholze–Weinstein tilde-limit statement is not asserted (it is not known even for Hodge type, Boxer–Pilloni §4.4.27).

**Hypotheses and conventions.**

- Over C as in Hansen–Johansson §5.3: complex Shimura varieties and their Baily–Borel compactifications base changed along a fixed isomorphism ℂ ≅ ℂ_p to a complete algebraically closed C ⊇ ℂ_p; the comparison with the canonical-model formulation over E ⊆ C is preabelian-reflex-bridge.
- Pre-abelian type: (G^ad, X⁺) ≅ (G₁^ad, X₁⁺) for a Hodge-type datum (G₁, X₁); no abelian-type hypothesis is used.
- Through Propositions 5.18–5.19, the proof rests on the perfectoidization of integral algebras (recorded gap).

**Proof route.**

1. Choose a Hodge-type (G₁, X₁) with (G₁^ad, X₁⁺) ≅ (G^ad, X⁺) (the 'central isogeny' of the source is G₁^der → G₁^ad ≅ G^ad).
2. hodge-adjoint-property-p gives Property 𝒫 for (G₁^ad, X₁⁺) = (G^ad, X⁺).
3. property-p-from-adjoint gives Property 𝒫 for (G, X).

**Acceptance instances.**

- Abelian-type data (unitary similitude groups, orthogonal groups of signature (n, 2) via GSpin) are pre-abelian, so their minimal towers are perfectoid.
- For a Hodge-type datum it recovers S2 hodge-genuine-minimal-perfectoid-tower over C.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S4/hodge-adjoint-property-p`, `PerfectoidShimuraVarieties:S4/property-p-from-adjoint`, `PerfectoidShimuraVarieties:S4/property-p`, `ShimuraData:D4/preabelian-type`, `ShimuraData:D4/type-implications`, `ShimuraData:D4`.

**Sources.**

- [David Hansen, Christian Johansson, Perfectoid Shimura varieties and the Calegari–Emerton conjectures](https://arxiv.org/abs/2011.03951v2), §5.3, Theorem 5.20 with proof, p. 38. Final step of Theorem 5.20.
- [David Hansen, Christian Johansson, Perfectoid Shimura varieties and the Calegari–Emerton conjectures](https://arxiv.org/abs/2011.03951v2), §1.3, the paragraph after Theorem 1.5, p. 5. The Hodge–Tate period map was removed from the revised version.

### The open pre-abelian tower and the Zariski closed boundary

Target `PerfectoidShimuraVarieties:S4/preabelian-open-tower-and-boundary` (theorem).

Let (G, X) be of pre-abelian type and K^p ⊆ G(𝔸_f^p) compact open, with 𝒳*_{K^p} the perfectoid space of preabelian-minimal-perfectoid. Then: (i) the boundary 𝒵_{K^p} ⊆ 𝒳*_{K^p}, the preimage of the boundary ∂ of any 𝒳*_{K^pK_p} with its induced perfectoid structure, is a Zariski closed embedding (PerfectoidSpaces:P8/zariski-closed-embedding), independent of K_p, and on every affinoid perfectoid open it is strongly Zariski closed; (ii) the open tower 𝒳_{K^p} := 𝒳*_{K^p} ∖ 𝒵_{K^p} is a perfectoid space with 𝒳_{K^p}^◇ ≅ lim_{K_p} 𝒳_{K^pK_p}^◇ (the open S0 diamond); (iii) both identifications are isomorphisms of diamonds, compatible with the G(ℚ_p)-action; no tilde-limit statement is asserted. Hansen–Johansson state the boundary in Theorem 1.5 and invoke its strong Zariski closedness in the proof of Corollary 5.21, p. 38. The finite-level boundary pullback and open-complement argument are supplied explicitly above; E15’s allegation that §5 proves only perfectoidness is rejected.

**Hypotheses and conventions.**

- Over C as in Hansen–Johansson §5.3: complex Shimura varieties and their Baily–Borel compactifications base changed along a fixed isomorphism ℂ ≅ ℂ_p to a complete algebraically closed C ⊇ ℂ_p; the comparison with the canonical-model formulation over E ⊆ C is preabelian-reflex-bridge.
- Pre-abelian type.

**Proof route.**

1. The reduced boundary of 𝒳*_{K^pK_p} is a closed subvariety; its pullback to the perfectoid 𝒳*_{K^p} is a Zariski closed embedding (PerfectoidSpaces:P8/closed-subvariety-pullback-is-zariski-closed); level maps satisfy f⁻¹(∂) = ∂ set-theoretically and a Zariski closed perfectoid subspace depends only on its underlying closed subset, so the result is independent of K_p.
2. Strong Zariski closedness: every Zariski closed subset of an affinoid perfectoid space is strongly Zariski closed (PerfectoidQuotients:Q4/zariski-closed-subsets-are-strongly-zariski-closed; Bhatt–Scholze Theorem 7.4, Remark 7.5).
3. Open tower: preimages of interiors under level maps are interiors, so the open subdiamond of S0 infinite-level-diamond is the complement of the boundary; an open subspace of a perfectoid space is perfectoid.

**Acceptance instances.**

- For the Siegel datum it recovers S1 siegel-main-theorem (ii) over C for the boundary.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S4/preabelian-minimal-perfectoid`, `PerfectoidShimuraVarieties:S0/infinite-level-diamond`, `PerfectoidSpaces:P8/closed-subvariety-pullback-is-zariski-closed`, `PerfectoidSpaces:P8/zariski-closed-embedding`, `PerfectoidQuotients:Q4/zariski-closed-subsets-are-strongly-zariski-closed`.

**Sources.**

- [David Hansen, Christian Johansson, Perfectoid Shimura varieties and the Calegari–Emerton conjectures](https://arxiv.org/abs/2011.03951v2), §1.3, Theorem 1.5, p. 4. Theorem 1.5 asserts the Zariski closed boundary (the sentence continues with the formula).
- [David Hansen, Christian Johansson, Perfectoid Shimura varieties and the Calegari–Emerton conjectures](https://arxiv.org/abs/2011.03951v2), §5.3, proof of Corollary 5.21, p. 38. Strong Zariski closedness of the boundary from Bhatt–Scholze.

### Theorem 1.5 over an arbitrary C with E → C

Target `PerfectoidShimuraVarieties:S4/preabelian-reflex-bridge` (comparison).

Let (G, X) be of pre-abelian type with reflex field E, C/ℚ_p complete algebraically closed and E → C an embedding. Then the tower of adic spaces over Spa C of Sh*_{K^pK_p}(G, X) ⊗_{E} C (canonical models, ShimuraVarieties:V8/minimal-descent) has perfectoid diamond limit X*_{K^p} = lim_{K_p} X*^◇_{K^pK_p} over Spd C, with Zariski closed boundary and open complement as in preabelian-open-tower-and-boundary: this is Hansen–Johansson Theorem 1.5, whose proof in §5.3 works with complex varieties and a fixed ℂ ≅ ℂ_p.

**Hypotheses and conventions.**

- Pre-abelian type, so that canonical models and their minimal compactifications over E exist (ShimuraVarieties V6, V8).
- Choose ℂ ≅ ℂ_p extending E → ℂ_p ⊆ C; complex conjugation and the choice do not affect the statement.

**Proof route.**

1. The canonical models over E base changed along E → ℂ_p ≅ ℂ are the complex Shimura varieties of §5.3 (canonical model property), compatibly with level maps and minimal compactifications (ShimuraVarieties:V8/minimal-descent, minimal-map-extension).
2. Base change from ℂ_p to C preserves perfectoidness of the limit (fibre products with Spd C; good-tower-base-change for the Hodge-type input).
3. Apply preabelian-minimal-perfectoid and preabelian-open-tower-and-boundary.

**Acceptance instances.**

- For the modular curve and C = ℂ_p, it is the perfectoid modular curve over ℂ_p.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S4/preabelian-minimal-perfectoid`, `PerfectoidShimuraVarieties:S4/preabelian-open-tower-and-boundary`, `PerfectoidShimuraVarieties:S2/good-tower-base-change`, `ShimuraVarieties:V8/minimal-descent`, `ShimuraVarieties:V8/minimal-map-extension`, `ShimuraVarieties:V7/general-canonical`.

**Sources.**

- [David Hansen, Christian Johansson, Perfectoid Shimura varieties and the Calegari–Emerton conjectures](https://arxiv.org/abs/2011.03951v2), §1.3, Theorem 1.5, p. 4. Opening of Theorem 1.5.
- [David Hansen, Christian Johansson, Perfectoid Shimura varieties and the Calegari–Emerton conjectures](https://arxiv.org/abs/2011.03951v2), §5.3, conventions, p. 35. §5.3 works over C with complex varieties.

## S5 — The modular and Hilbert towers

Coverage: **planned**.

- H1/H3/H4/H5 finite-level Hilbert pairing, moduli and torsor requests remain. Exact T4 period-map/radius and T5 Igusa-comparison nodes are imported with their inclusive-endpoint and ramified-generator proof gaps; neither integral splitting at ramified p nor arbitrary radius endpoints are inferred.

### The modular-curve tower: comparison with the full-level modular curves, fixed Weil-pairing components and tame level

Target `PerfectoidShimuraVarieties:S5/modular-tower-comparison` (comparison).

For (GL_2, ℍ^±), a tame level K^p prime to p that is the adelic form of one of Heuer's rigidifying tame levels Γ(N) ⊆ Γ^p ⊆ GL_2(ℤ/N), namely K^p = K(N)^p with N ≥ 3 or K^p = K₁(N)^p with N ≥ 4 (Γ₁(3) is not rigidifying: (−2 1; −3 1) ∈ Γ₁(3) has order 3; PerfectoidShimuraVarieties/E35), and K_p = K(pᵐ). For K^p = K(N)^p the S0 tower over C is identified with the analytified full-level modular curves of ShimuraVarieties:V8/gl2-full-level (moduli of (E, P, Q) with an ordered full Npᵐ-basis), compatibly with level maps and Hecke correspondences (V8/gl2-tower-compatibility); for K₁(N)^p it is the quotient of the K(N)^p-tower by the finite group K₁(N)^p/K(N)^p (S0 tower-right-action). The infinite-level diamond S^{*◇}_{K^p,∞} is represented by 𝒳*_{Γ(p^∞)} ×_{Spa ℚ_p} Spa C, where 𝒳*_{Γ(p^∞)} is Scholze's perfectoid modular curve over ℚ_p^cycl (S1 with g = 1), on which the Weil-pairing root is the fixed compatible system (PerfectoidShimuraVarieties:S1/siegel-similitude-comparison); after fixing ℚ_p^cycl → C this is ℤ_p^× × (𝒳*_{Γ(p^∞)} ⊗̂_{ℚ_p^cycl} C), which is also the GL_2-space of Heuer and BHW (moduli of (E, μ, α) with α unrestricted) taken over C, and 𝒳*_{Γ(p^∞)} ⊗̂_{ℚ_p^cycl} C alone is the part over one compatible system ζ of p-power roots of unity. The (R, R⁺)-points of S^◇_{K^p,∞} for perfectoid (R, R⁺) over (C, O_C) are triples (E, tame level, α: ℤ_p² ≅ T_pE), with no condition on the Weil pairing of α. Under this identification the right translation by u ∈ GL_2(ℤ_p) is α ↦ α ∘ u, and BHW's left action γ·α = α ∘ γ^∨ is the right translation by γ^∨ = det(γ)γ⁻¹. Components: for K^p = K(N)^p, π₀ of the infinite-level tower is lim_m (ℤ/Npᵐ)^× = (ℤ/N)^× × ℤ_p^×, identified through the Weil pairing with compatible systems of primitive Npᵐ-th roots of unity (V8/gl2-determinant-pairing) (for K₁(N)^p it is ℤ_p^×); the fibre over a fixed compatible system ζ is the fixed-pairing tower of V8/gl2-fixed-pairing-fibre (connected at each level), its deck group over level K(p) is the image of SL_2-type congruence subgroups, and GL_2(ℤ_p) acts on π₀ through det. For K^p = K(N)^p the tower is a GL_2(ℤ_p)-torsor over the level-K^pGL_2(ℤ_p) curve, because K^pGL_2(ℤ_p) is neat and Z(ℚ) ∩ K^pGL_2(ℤ_p) = {1} (S0 tower-action-kernel).

**Hypotheses and conventions.**

- Modular curve; K^p = K(N)^p with N ≥ 3 or K₁(N)^p with N ≥ 4, N prime to p (BHW §2.1 allows 'Γ1 (N ) for N ≥ 3', but Γ₁(3) is not representable; PerfectoidShimuraVarieties/E35); the elliptic Tate module T_pE is identified with T_pE^∨ by the principal polarization with a sign fixed by the Weil pairing convention of V8 (to be matched with the Hilbert convention α: 𝒪_p² ≅ T_pA^∨ for F = ℚ).

**Proof route.**

1. Finite levels: V8/gl2-full-level and V8/gl2-row-basis-dictionary (right translation by u acts on bases by (P, Q) ↦ (aP + cQ, bP + dQ)).
2. Infinite level: S0 infinite-level-diamond with the S0 perfectoid representative 𝒳*_{Γ(p^∞)} ×_{Spa ℚ_p} Spa C given by S1 (g = 1) through S1/siegel-similitude-comparison; points by S0 infinite-level-diamond (iii) and the moduli description at finite level.
3. Components by S0 component-set-of-infinite-level and connected-component-tower with V8/gl2-determinant-pairing; kernel by S0 tower-action-kernel.

**Acceptance instances.**

- At level K(p), the fixed-pairing component is Γ(Np)\ℍ and the deck group of the level-K(p²) cover of it has order p³.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S0/p-level-tower`, `PerfectoidShimuraVarieties:S0/infinite-level-diamond`, `PerfectoidShimuraVarieties:S0/perfectoid-representative`, `PerfectoidShimuraVarieties:S0/component-set-of-infinite-level`, `PerfectoidShimuraVarieties:S0/connected-component-tower`, `PerfectoidShimuraVarieties:S0/tower-action-kernel`, `PerfectoidShimuraVarieties:S0/tower-right-action`, `PerfectoidShimuraVarieties:S1/perfectoid-siegel-space`, `PerfectoidShimuraVarieties:S1/siegel-similitude-comparison`, `ShimuraVarieties:V8/gl2-full-level`, `ShimuraVarieties:V8/gl2-row-basis-dictionary`, `ShimuraVarieties:V8/gl2-tower-compatibility`, `ShimuraVarieties:V8/gl2-fixed-pairing-fibre`, `ShimuraVarieties:V8/gl2-determinant-pairing`, `HilbertModularVarietiesAndShimuraCurves:H5`.

**Sources.**

- [Christopher Birkbeck, Ben Heuer, Chris Williams, Overconvergent Hilbert modular forms via perfectoid modular varieties](https://arxiv.org/abs/1902.03985v4), §2.1, p. 7. Points of the perfectoid modular curve.
- [Christopher Birkbeck, Ben Heuer, Chris Williams, Overconvergent Hilbert modular forms via perfectoid modular varieties](https://arxiv.org/abs/1902.03985v4), §2.1, display (2.1), pp. 7–8. The GL_2(ℤ_p)-action through γ^∨.
- [Ben Heuer, Cusps and q-expansion principles for modular curves at infinite level](https://arxiv.org/abs/2002.02488v1), §2.1, p. 6. Heuer works at rigidifying tame levels; Γ₁(N) is rigidifying only for N ≥ 4.

### Completed cusp charts of the perfectoid modular curve and the action on q-parameters

Target `PerfectoidShimuraVarieties:S5/modular-cusp-charts-and-q-action` (comparison).

For a cusp x of the compactified modular curve X* of a rigidifying tame level Γ^p in Heuer's sense (Γ(N) ⊆ Γ^p ⊆ GL_2(ℤ/N), N ≥ 3 prime to p, for instance Γ(N) with N ≥ 3 or Γ₁(N) with N ≥ 4, but not Γ₁(3), which contains the element (−2 1; −3 1) of order 3; PerfectoidShimuraVarieties/E35) with Tate parameter D_x and width e_x, the cusp chart of S1 elliptic-cusps-at-infinite-level is identified with the formal Tate-curve neighbourhood of the finite-level comparison (ShimuraVarieties:V8/gl2-cusps-tate, ShimuraCompactifications:C6/modular-formal-cusp-comparison): at level Γ₀(pⁿ) ∩ anticanonical, the chart is D_n with q^{1/pⁿ} the Tate parameter of the anticanonical quotient, and at infinite level (GL_2(ℤ_p) × D_{∞,x})/ℤ_p. The action of Γ₀(p) on the charts at Γ₀(p^∞)-level is through (Γ₀(p) × D_∞)/pℤ_p = Γ₀(p^∞) × D_∞ with the right action of h ∈ pℤ_p by (γ, q^{1/p^m}) ↦ (γ(1 0; h 1), ζ_{p^m}^{h/e_x} q^{1/p^m}) (Heuer Proposition 3.19), i.e. the lower unipotent N⁻(pⁿℤ_p) (not a quotient Γ₀(pⁿ)/Γ₀(p^∞), which is not a group) acts on q-roots by p-power roots of unity, with ζ fixed by the Weil pairing; consequently the Γ₀(pⁿ)-invariant bounded functions on the chart over x are 𝒪_{L_x}[[q^{1/pⁿ}]] (with the completed bounded-series convention and L_x the actual cusp field, including any required tame roots of unity) (BHW Proposition 3.8). The Hodge–Tate period map is locally constant on the charts, (a b; c d), q ↦ (b : d) ∈ ℙ¹(ℤ_p).

**Hypotheses and conventions.**

- Modular curve as in modular-tower-comparison; the sign of h follows Heuer's convention for the right action of the lower unipotent; BHW's adjugate convention exchanges c and −c (PerfectoidShimuraVarieties/E31).

**Proof route.**

1. Identify the finite-level Tate charts (V8/gl2-cusps-tate) with Heuer's D_{n,x} through the Tate curve and its canonical subgroup μ_{pⁿ}.
2. The Γ₀(p)-action and the q-action: Heuer Proposition 3.19 and Theorem 3.22; invariants by Heuer Lemma 3.21-type q-expansion arguments as used in BHW Proposition 3.8.

**Acceptance instances.**

- For n = 1 the Γ₀(p)-invariant bounded functions on the chart over x are 𝒪_L[ζ_d][[q^{1/p}]] = 𝒪⁺(D_1 × μ_d), the bounded functions on the Tate parameter disc of X*_{Γ₀(p)}(ε)_a, which strictly contain the pullback 𝒪_L[ζ_d][[q]] of the bounded functions on the Tate disc of X* (the chart of X*_{Γ₀(p)}(ε)_a has coordinate q^{1/p} and maps to the chart of X* by q^{1/p} ↦ (q^{1/p})^p = q; BHW proof of Proposition 3.8).

**Direct prerequisites.** `PerfectoidShimuraVarieties:S1/elliptic-cusps-at-infinite-level`, `PerfectoidShimuraVarieties:S5/modular-tower-comparison`, `ShimuraVarieties:V8/gl2-cusps-tate`, `ShimuraCompactifications:C6/modular-formal-cusp-comparison`.

**Sources.**

- [Ben Heuer, Cusps and q-expansion principles for modular curves at infinite level](https://arxiv.org/abs/2002.02488v1), §3.4, Proposition 3.19 and Theorem 3.22, pp. 23–25. The Γ₀(p)-action on the Tate parameter spaces at infinite level.
- [Christopher Birkbeck, Ben Heuer, Chris Williams, Overconvergent Hilbert modular forms via perfectoid modular varieties](https://arxiv.org/abs/1902.03985v4), §3.1, proof of Proposition 3.8, pp. 10–11. BHW's use of the cusp charts.

### Modular anticanonical domains, radii and the period coordinate

Target `PerfectoidShimuraVarieties:S5/modular-anticanonical-and-period-compatibility` (comparison).

For the modular curve, the anticanonical tower of S1 (g = 1) and BHW's anticanonical locus agree: 𝒳*_{Γ(p^∞)}(ε) = 𝒳*_{Γ(p^∞)}(ε)_c ⊔ 𝒳*_{Γ(p^∞)}(ε)_a with the anticanonical part the preimage of {D ∩ H₁ = 0} at Γ₀(p)-level; with the bounds of HodgeTateAndCanonicalSubgroups T4 (for m ≥ 1, p^{−m} ≤ r < 1 and ε ≤ 1/(c_p p^m), c_p = 2, 3, 4 for p ≥ 5, p = 3, p = 2), π_HT(𝒳*_{Γ(p^∞)}(ε)_a) ⊆ B_r(ℤ_p : 1), the union of closed balls of radius r around (a : 1), a ∈ ℤ_p; Γ₀(p) preserves B_r(ℤ_p : 1) with z ↦ (az + b)/(cz + d) and |cz + d| = 1; and 𝔷 = π_HT^*z, 𝔰 = π_HT^*s with 𝔰(x) = HT(α(e_1)) (S3 elliptic-hodge-tate-and-O1) satisfy γ^*𝔰 = (c𝔷 + d)𝔰. The radius is attached to the rational prime p (BHW's Proposition 2.6 is not a special case of their Proposition 5.18 as printed, PerfectoidShimuraVarieties/E30; the T4 bounds are used).

**Hypotheses and conventions.**

- Modular curve; ε, r as stated (the canonical-subgroup estimates are owned by HodgeTateAndCanonicalSubgroups T4).

**Proof route.**

1. Identify loci by their moduli conditions (S1 anticanonical-locus-level-p for g = 1 and BHW §2.1).
2. Radius inclusion: T4's canonical-subgroup and Hodge–Tate image bounds (request); off the cusps by the Hodge–Tate cokernel degree, at cusps because cusps are ordinary and map to ℙ¹(ℚ_p) (modular-cusp-charts-and-q-action).
3. Stability and automorphy factor: BHW Lemma 2.4 (|z| ≤ 1, c ∈ pℤ_p, d ∈ ℤ_p^×) and S3 elliptic-hodge-tate-and-O1.

**Acceptance instances.**

- For r = 1/p and p ≥ 5, ε ≤ 1/(2p) suffices.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S5/modular-tower-comparison`, `PerfectoidShimuraVarieties:S5/modular-cusp-charts-and-q-action`, `PerfectoidShimuraVarieties:S1/anticanonical-locus-level-p`, `PerfectoidShimuraVarieties:S3/elliptic-hodge-tate-and-O1`, `HodgeTateAndCanonicalSubgroups:T4/canonical-anticanonical-loci`, `HodgeTateAndCanonicalSubgroups:T4/atkin-lehner-anticanonical`, `HodgeTateAndCanonicalSubgroups:T4/period-map-inclusions`.

**Sources.**

- [Christopher Birkbeck, Ben Heuer, Chris Williams, Overconvergent Hilbert modular forms via perfectoid modular varieties](https://arxiv.org/abs/1902.03985v4), §2.2, Lemma 2.4 and Proposition 2.6, pp. 8–9. BHW's derivation, corrected to T4's bounds.
- [Christopher Birkbeck, Ben Heuer, Chris Williams, Overconvergent Hilbert modular forms via perfectoid modular varieties](https://arxiv.org/abs/1902.03985v4), §2.2, p. 8. Anticanonical locus near the rational points (b : 1).

### The geometric, intermediate and arithmetic Hilbert towers at infinite level

Target `PerfectoidShimuraVarieties:S5/hilbert-three-towers` (construction).

In the setting of the hypotheses, for n ∈ ℤ_{≥0} let X_{Γ*(pⁿ)} (G*-level: α_n with similitude in (ℤ/pⁿ)^×, relative to a chosen generator β of 𝔠𝔡⁻¹(1)), X_{Γ(pⁿ)} (the intermediate space: the G*-variety X with a full G-level α_n: (𝒪_F/pⁿ)² ≅ A^∨[pⁿ], polarization λ fixed) and X_{G,Γ(pⁿ)} (the arithmetic G-variety, polarization class [λ] = 𝒪_F^{×,+}λ) be the finite-level spaces of HilbertModularVarietiesAndShimuraCurves H3–H4, with maps X_{Γ*(pⁿ)} →β₁ X_{Γ(pⁿ)} →β₂ X_{G,Γ(pⁿ)} over X = X → X_G. Their infinite-level diamonds X_{Γ*(p^∞)}, X_{Γ(p^∞)}, X_{G,Γ(p^∞)} are formed as in S0 infinite-level-diamond. The hybrid tower (X_{Γ(pⁿ)})_n is an S0 rigidified moduli tower over the arithmetic tower (X_{G,Γ(pⁿ)})_n with the pro-system of finite groups Δ_{K(pⁿ)} = Δ(pⁿN) = 𝒪_F^{×,+}/((1 + pⁿN𝒪_F)^×)², whose orders are unbounded in n when [F : ℚ] > 1, and are all 1 when F = ℚ (BHW Lemma 8.16(1)); its torsor property at infinite level is hilbert-polarization-torsors. X_{Γ*(p^∞)} is perfectoid by S2 (Hodge type, G* = PEL) and X_{G,Γ(p^∞)} by S4 (G is of abelian type); perfectoidness of X_{Γ(p^∞)} is not asserted here, it is proved in hilbert-mixed-span, which depends on this node. Actions: the level-structure action of G(ℤ_p) = GL_2(𝒪_p) on X_{Γ(p^∞)} by α ↦ α ∘ γ^∨ (a pro-étale G(ℤ_p)-torsor over X), of G*(ℤ_p) on X_{Γ*(p^∞)}, and the polarization action of 𝒪_F^{×,+} on X_{Γ(p^∞)} by λ ↦ ηλ, which factors through Δ(pⁿN) at level n and through the profinite group Δ(p^∞N) = lim_n Δ(pⁿN) at infinite level; 𝒪_F^{×,+} does not act on X_{Γ*(pⁿ)} by changing λ (BHW p. 33).

**Hypotheses and conventions.**

- F totally real of degree g with ring of integers 𝒪_F, different 𝔡, 𝒪_p = 𝒪_F ⊗ ℤ_p; G = Res_{F/ℚ}GL_2, G* = G ×_{Res G_m} G_m; tame level μ_N with N ≥ 4 prime to p and a polarization module 𝔠 (BHW §5.1); L ⊇ ℚ_p^cycl perfectoid; levels at p act on α: 𝒪_p² ≅ T_pA^∨ by α ↦ α ∘ γ^∨, γ^∨ = det(γ)γ⁻¹ (the left action of BHW, equal to the Shimura right translation by γ^∨ under the identification λ⁻¹ ∘ (α ⊗ id)).

**Proof route.**

1. Finite levels and maps: HilbertModularVarietiesAndShimuraCurves H4 (requested).
2. Diamond limits as in S0; the rigidified-tower structure with Δ_{K(pⁿ)} = Δ(pⁿN) is BHW Lemma 8.16(1) (requested from H4) read in S0 rigidified-moduli-tower; X_{Γ*(p^∞)} ~ lim X_{Γ*(pⁿ)} by S2 hodge-genuine-minimal-perfectoid-tower and hodge-open-perfectoid-tower for the PEL datum G* (BHW Theorem 5.11(4)); X_{G,Γ(p^∞)} by the S4 pre-abelian representability theorem, G being of abelian type.
3. The level-structure action is the limit of the finite étale G(ℤ/pⁿ)-torsor structures (BHW §8.4.1).

**Planning API.**

- `HilbertTower.geometric` (data): X_{Γ*(p^∞)} with its G*(ℤ_p)-action.
- `HilbertTower.intermediate` (data): X_{Γ(p^∞)} with the level-structure action of GL_2(𝒪_p) and the polarization action of 𝒪_F^{×,+}.
- `HilbertTower.arithmetic` (data): X_{G,Γ(p^∞)} with the induced action.
- `HilbertTower.beta1` (projection): β₁: X_{Γ*(p^∞)} → X_{Γ(p^∞)}, the inclusion of the similitude-ℤ_p^× locus.
- `HilbertTower.beta2` (projection): β₂: X_{Γ(p^∞)} → X_{G,Γ(p^∞)}, forgetting λ up to 𝒪_F^{×,+}.
- `HilbertTower.levelAction` (instance): The left level-structure action α ↦ α ∘ γ^∨, equal to the S0 right translation by γ^∨.
- `HilbertTower.polAction` (instance): The polarization action η·(A, λ, α) = (A, ηλ, α) on X_{Γ(p^∞)}, factoring through Δ(p^∞N) and commuting with the level action.
- `HilbertTower.isPerfectoid` (characterisation): X_{Γ*(p^∞)} and X_{G,Γ(p^∞)} are perfectoid (for X_{Γ(p^∞)} see hilbert-mixed-span).

**Unit tests.**

- `three_towers_F_eq_Q` (degenerate): For F = ℚ the three towers and β₁, β₂ are identities between copies of the modular tower.
- `beta1_not_surjective` (non-example): Take F = ℚ(√5), p = 3 (inert), n = 1 and tame μ_N level with N ≥ 4 prime to 3, in a fixed polarization component. The Weil-pairing component label of β₁ lies in (ℤ/3)^× inside (𝒪_F/3)^× ≅ 𝔽₉^×: its image has order 2 and the target has order 8, so β₁ misses pairing components. At n = 0 the residue-unit obstruction is trivial; [F : ℚ] = 2 alone does not ensure nonsurjectivity at every level.
- `levelAction_adjugate` (computation): For γ = diag(u, 1), γ^∨ = diag(1, u), so the level action of γ multiplies the second basis vector by u.
- `levelAction_vs_rightTranslation` (compatibility): The level action of γ equals the S0 right translation T_{γ^∨} under α ↔ λ⁻¹ ∘ (α ⊗ id) (BHW Remark 5.5).

**Acceptance instances.**

- For F = ℚ, G* = G = GL_2, Γ* = Γ, and the three towers coincide with the modular tower of modular-tower-comparison.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S0/infinite-level-diamond`, `PerfectoidShimuraVarieties:S0/rigidified-moduli-tower`, `PerfectoidShimuraVarieties:S0/tower-right-action`, `PerfectoidShimuraVarieties:S2/hodge-open-perfectoid-tower`, `PerfectoidShimuraVarieties:S2/hodge-genuine-minimal-perfectoid-tower`, `PerfectoidShimuraVarieties:S4/preabelian-minimal-perfectoid`, `HilbertModularVarietiesAndShimuraCurves:H4`, `HilbertModularVarietiesAndShimuraCurves:H3`, `ShimuraData:D5/hilbert-datum`, `ShimuraData:D5/hilbert-star-datum`.

**Sources.**

- [Christopher Birkbeck, Ben Heuer, Chris Williams, Overconvergent Hilbert modular forms via perfectoid modular varieties](https://arxiv.org/abs/1902.03985v4), §8.2, (8.1), p. 33. The intermediate space.
- [Christopher Birkbeck, Ben Heuer, Chris Williams, Overconvergent Hilbert modular forms via perfectoid modular varieties](https://arxiv.org/abs/1902.03985v4), §8.2.1, Definition 8.8, p. 34. The level-structure action.

### The intermediate Hilbert tower as a contracted product: the ℤ_p^×-torsor span

Target `PerfectoidShimuraVarieties:S5/hilbert-mixed-span` (theorem).

In hilbert-three-towers, let 𝒪_p^× act on X_{Γ(p^∞)} by the level action of diag(η, 1). Then X_{Γ*(p^∞)} × 𝒪_p^× → X_{Γ(p^∞)}, (x, u) ↦ diag(u, 1)·β₁(x), is a ℤ_p^×-torsor for the antidiagonal action t·(x, u) = (diag(t, 1)·x, ut⁻¹), i.e. X_{Γ(p^∞)} = X_{Γ*(p^∞)} ×^{ℤ_p^×} 𝒪_p^×; in particular X_{Γ(p^∞)} is perfectoid. The decomposition X_{Γ(pⁿ)} = X_{Γ*(pⁿ)} × (𝒪_F/pⁿ)^×/(ℤ/pⁿ)^× printed by BHW uses a set-theoretic section of 𝒪_p^× → 𝒪_p^×/ℤ_p^× and is not canonical; the contracted product is.

**Hypotheses and conventions.**

- F totally real of degree g with ring of integers 𝒪_F, different 𝔡, 𝒪_p = 𝒪_F ⊗ ℤ_p; G = Res_{F/ℚ}GL_2, G* = G ×_{Res G_m} G_m; tame level μ_N with N ≥ 4 prime to p and a polarization module 𝔠 (BHW §5.1); L ⊇ ℚ_p^cycl perfectoid; levels at p act on α: 𝒪_p² ≅ T_pA^∨ by α ↦ α ∘ γ^∨, γ^∨ = det(γ)γ⁻¹ (the left action of BHW, equal to the Shimura right translation by γ^∨ under the identification λ⁻¹ ∘ (α ⊗ id)).

**Proof route.**

1. Finite levels: the finite-level Weil-pairing component map of HilbertModularVarietiesAndShimuraCurves H4 (BHW Lemma 8.10 and Corollary 8.11): X_{Γ*(pⁿ)} = X_{Γ(pⁿ)} ×_{(𝒪_F/pⁿ)^×} (ℤ/pⁿ)^× and (𝒪_F/pⁿ)^× × X_{Γ*(pⁿ)} → X_{Γ(pⁿ)} is a (ℤ/pⁿ)^×-torsor for the antidiagonal action.
2. Pass to the limit: limits of compatible finite torsors are torsors under the profinite limit group (S0 infinite-level-diamond (v)), which gives X_{Γ(p^∞)} = X_{Γ*(p^∞)} ×^{ℤ_p^×} 𝒪_p^× as diamonds (BHW Lemma 8.25).
3. Perfectoidness: a quotient of a perfectoid space by a free profinite action need not be perfectoid in general (ℤ_p acting on the perfectoid torus by translation), so use a continuous section s: Q := 𝒪_p^×/ℤ_p^× → 𝒪_p^× of the quotient map of profinite groups (Ribes–Zalesskii Proposition 2.2.2; TauCeti.exists_continuous_section). Then (x, u) ↦ (diag(u·s(ū)⁻¹, 1)·x, ū) is invariant under t·(x, u) = (diag(t, 1)·x, ut⁻¹) and induces an isomorphism X_{Γ*(p^∞)} ×^{ℤ_p^×} 𝒪_p^× ≅ X_{Γ*(p^∞)} × Q, with inverse (y, q) ↦ [(y, s(q))]. The product of a perfectoid space with a profinite set is perfectoid (PerfectoidSpaces:P6/product-with-profinite-set, glued over an affinoid perfectoid cover of X_{Γ*(p^∞)}), so X_{Γ(p^∞)} is perfectoid; the isomorphism depends on s, the contracted product does not.

**Acceptance instances.**

- For F = ℚ, 𝒪_p^× = ℤ_p^× and the span is the identity X_{Γ*(p^∞)} = X_{Γ(p^∞)}.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S5/hilbert-three-towers`, `PerfectoidSpaces:P6/product-with-profinite-set`, `tauceti:TauCeti.exists_continuous_section`, `PerfectoidShimuraVarieties:S0/infinite-level-diamond`, `HilbertModularVarietiesAndShimuraCurves:H4`.

**Sources.**

- [Christopher Birkbeck, Ben Heuer, Chris Williams, Overconvergent Hilbert modular forms via perfectoid modular varieties](https://arxiv.org/abs/1902.03985v4), §8.4.2, Lemma 8.25, p. 39. The ℤ_p^×-torsor X_{Γ*(p^∞)} × 𝒪_p^× → X_{Γ(p^∞)}.
- [Christopher Birkbeck, Ben Heuer, Chris Williams, Overconvergent Hilbert modular forms via perfectoid modular varieties](https://arxiv.org/abs/1902.03985v4), §8.2.3, Corollary 8.11, p. 35. The finite-level statement.

### The 𝒪_p^×-valued Weil pairing of the intermediate Hilbert tower

Target `PerfectoidShimuraVarieties:S5/hilbert-weil-pairing` (construction).

Let β be an 𝒪_p-generator of 𝔠𝔡⁻¹(1) = 𝔠𝔡⁻¹ ⊗ T_pμ_{p^∞}. The 𝒪_F-linearised Weil pairings ẽ_n (with e_{pⁿ} = Tr ∘ ẽ_n) and β give e_{n,β}: X_{Γ(pⁿ)} → (𝒪_F/pⁿ)^×, and e_β := lim e_{n,β}: X_{Γ(p^∞)} → 𝒪_p^× (a map to the profinite perfectoid group). Properties: (i) for γ ∈ GL_2(𝒪_p) acting by the level action and η ∈ 𝒪_F^{×,+} by the polarization action, e_β ∘ γ = det(γ)·e_β and e_β ∘ η = η⁻¹·e_β. The polarization action factors through the profinite group Δ(p^∞N) = lim_m 𝒪_F^{×,+}/((1 + p^mN𝒪_F)^×)², and 𝒪_F^{×,+} ⊆ 𝒪_p^× induces a continuous homomorphism x ↦ x̄: Δ(p^∞N) → 𝒪_p^× = lim_m (𝒪_F/p^m)^× (squares of units ≡ 1 mod p^mN are ≡ 1 mod p^m). Let E(pⁿ) := lim_m (Γ̄₀(pⁿ, p^m) × 𝒪_F^{×,+})/(1 + N𝒪_F)^× (with η ↦ (diag(η, η), η²); n as in hilbert-level-torsors), the profinite group of hilbert-level-torsors; equivalently E(pⁿ) = (Γ₀(pⁿ) × Δ(p^∞N))/Z_∞, with Z_∞ the closure of (1 + N𝒪_F)^× in 𝒪_p^× embedded by z ↦ (diag(z, z), z²), and BHW's (Γ₀(pⁿ) × 𝒪_F^{×,+})/(1 + N𝒪_F)^× is a dense subgroup. Then for (γ, x) ∈ Γ₀(pⁿ) × Δ(p^∞N), e_β ∘ (γ, x) = det(γ)x̄⁻¹·e_β, which is well defined on E(pⁿ) because (diag(z, z), z²) gives z²·z⁻² = 1; and for a character w of 𝒪_p^× the unit w(e_β) ∈ 𝒪⁺(X_{Γ(p^∞)}(ε)_a)^× satisfies (γ, x)^*w(e_β) = w(x̄⁻¹)w(det γ)w(e_β) for (γ, x) ∈ E(pⁿ); (ii) the fibre of e_β over ℤ_p^× is X_{Γ*(p^∞)}; (iii) change of generator: e_{uβ} = u⁻¹e_β for u ∈ 𝒪_p^×, which moves X_{Γ*(p^∞)} to the fibre over u⁻¹ℤ_p^×; (iv) on the arithmetic tower only the class of e_β modulo the closure of 𝒪_F^{×,+} is defined (BHW's map e: X_{G,Γ(p^∞)} → 𝔠𝔡⁻¹(1)^× is not well defined, because changing λ by η multiplies the pairing by η⁻¹; PerfectoidShimuraVarieties/E28).

**Hypotheses and conventions.**

- F totally real of degree g with ring of integers 𝒪_F, different 𝔡, 𝒪_p = 𝒪_F ⊗ ℤ_p; G = Res_{F/ℚ}GL_2, G* = G ×_{Res G_m} G_m; tame level μ_N with N ≥ 4 prime to p and a polarization module 𝔠 (BHW §5.1); L ⊇ ℚ_p^cycl perfectoid; levels at p act on α: 𝒪_p² ≅ T_pA^∨ by α ↦ α ∘ γ^∨, γ^∨ = det(γ)γ⁻¹ (the left action of BHW, equal to the Shimura right translation by γ^∨ under the identification λ⁻¹ ∘ (α ⊗ id)).
- β is an auxiliary choice; the change-of-β law (iii) is stated here (BHW do not state it).

**Proof route.**

1. Finite levels: the 𝒪_F-linear Weil pairing (BHW Definitions 5.6–5.7; HilbertModularVarietiesAndShimuraCurves H1/H4) and the computation of BHW Lemma 8.9 (det γ^∨ = det γ; λ ↦ ηλ multiplies by η⁻¹); pass to the limit (Lemma 8.25).
2. (i) on E(pⁿ): (γ, x) ∈ Γ₀(pⁿ) × Δ(p^∞N) acts as the level action of γ composed with the polarization action of x (which factors through Δ(pᵐN) at level m, BHW Lemma 8.12 and Lemma 8.16(1)); at finite level m the formula is Lemma 8.9 with x̄ mod p^m, and it passes to the limit. The finite-level kernel of Γ̄₀(pⁿ, p^m) × Δ(p^mN) → E(pⁿ, p^m) is the image of Z_m = (1 + N𝒪_F)^×/(1 + p^mN𝒪_F)^× (η² = μ² with η, μ ≡ 1 mod N forces η = μ as N ≥ 3), and limits of short exact sequences of finite groups are exact, which gives E(pⁿ) = (Γ₀(pⁿ) × Δ(p^∞N))/Z_∞. On Z_∞ the character is z²·z⁻² = 1 (Lemma 8.26 on the dense subgroup).
3. (iii) e_{n,uβ} = u⁻¹e_{n,β} from the definition through β⁻¹; (iv) from (i) for η.

**Planning API.**

- `HilbertTower.weilPairing` (constructor): e_β: X_{Γ(p^∞)} → 𝒪_p^×.
- `HilbertTower.weilPairing_level` (simp): e_β ∘ γ = det(γ)·e_β for the level action.
- `HilbertTower.weilPairing_pol` (simp): e_β ∘ η = η⁻¹·e_β for the polarization action.
- `HilbertTower.weilPairing_fibre` (characterisation): e_β⁻¹(ℤ_p^×) = β₁(X_{Γ*(p^∞)}).
- `HilbertTower.weilPairing_changeGenerator` (relation): e_{uβ} = u⁻¹e_β.
- `HilbertTower.weilPairing_E` (simp): e_β ∘ (γ, x) = det(γ)x̄⁻¹e_β for (γ, x) ∈ E(pⁿ) = (Γ₀(pⁿ) × Δ(p^∞N))/Z_∞, with x ↦ x̄ the map Δ(p^∞N) → 𝒪_p^×.
- `HilbertTower.weilPairing_arith` (constructor): The well-defined class of e_β in 𝒪_p^× modulo the closure of 𝒪_F^{×,+} on X_{G,Γ(p^∞)}.

**Unit tests.**

- `weilPairing_F_eq_Q` (degenerate): For F = ℚ, e_β is the ℤ_p^×-valued Weil pairing and the polarization action is trivial.
- `weilPairing_diag` (computation): For γ = diag(u, 1), e_β ∘ γ = u·e_β.
- `weilPairing_scalar_pol` (characterisation): For η ∈ (1 + N𝒪_F)^×, the polarization action of η² equals the level action of diag(η, η)⁻¹ (BHW Lemma 8.12), consistently with det(diag(η, η)⁻¹) = η⁻² = (η²)⁻¹.
- `weilPairing_arith_not_defined` (non-example): For [F : ℚ] ≥ 2 and a totally positive unit η ≠ 1, e_β changes by η⁻¹ ∉ 1 under λ ↦ ηλ, so no 𝒪_p^×-valued map is defined on the arithmetic tower.

**Acceptance instances.**

- For F = ℚ and β the fixed compatible system of roots of unity, e_β is the Weil-pairing map of the modular tower to ℤ_p^×, and det(γ) multiplies it.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S5/hilbert-three-towers`, `PerfectoidShimuraVarieties:S5/hilbert-mixed-span`, `HilbertModularVarietiesAndShimuraCurves:H4`, `HilbertModularVarietiesAndShimuraCurves:H1`.

**Sources.**

- [Christopher Birkbeck, Ben Heuer, Chris Williams, Overconvergent Hilbert modular forms via perfectoid modular varieties](https://arxiv.org/abs/1902.03985v4), §8.4.2, Lemma 8.26, p. 39. The transformation law.
- [Christopher Birkbeck, Ben Heuer, Chris Williams, Overconvergent Hilbert modular forms via perfectoid modular varieties](https://arxiv.org/abs/1902.03985v4), §8.2.2, after (8.2), p. 34. Dependence on the polarization.

### The full-tower profinite polarization torsor and the finite torsor on connected components

Target `PerfectoidShimuraVarieties:S5/hilbert-polarization-torsors` (theorem).

In hilbert-three-towers: (1) β₂: X_{Γ(p^∞)} → X_{G,Γ(p^∞)} is a pro-étale torsor under the profinite group Δ(p^∞N) := lim_n Δ(pⁿN), Δ(pⁿN) = 𝒪_F^{×,+}/((1 + pⁿN𝒪_F)^×)², into which 𝒪_F^{×,+} embeds densely; (2) on identity components, X⁰_{Γ(p^∞)} = X⁰_{Γ*(p^∞)} → X⁰_{G,Γ(p^∞)} is a finite étale torsor under the finite group Δ_∞(N) := ker(Δ(p^∞N) → 𝒪_p^×), the stabiliser of the identity component; for p odd Δ_∞(N) = Δ_n(N) = (1 + pⁿ𝒪_F)^{×,+}/((1 + pⁿN𝒪_F)^×)² for n ≫ 0, while for p = 2 the transition maps Δ_{n+1}(N) → Δ_n(N) need not be injective and Δ_∞(N) is only the kernel above (BHW's proof of Lemma 8.20 assumes an injection Δ_n(N) → Δ(N) that need not exist; PerfectoidShimuraVarieties/E26). The profinite group on the full tower and the finite group on components are different and both statements are needed.

**Hypotheses and conventions.**

- F totally real of degree g with ring of integers 𝒪_F, different 𝔡, 𝒪_p = 𝒪_F ⊗ ℤ_p; G = Res_{F/ℚ}GL_2, G* = G ×_{Res G_m} G_m; tame level μ_N with N ≥ 4 prime to p and a polarization module 𝔠 (BHW §5.1); L ⊇ ℚ_p^cycl perfectoid; levels at p act on α: 𝒪_p² ≅ T_pA^∨ by α ↦ α ∘ γ^∨, γ^∨ = det(γ)γ⁻¹ (the left action of BHW, equal to the Shimura right translation by γ^∨ under the identification λ⁻¹ ∘ (α ⊗ id)).

**Proof route.**

1. (1) Finite levels: X_{Γ(pⁿ)} → X_{G,Γ(pⁿ)} is a finite étale Δ(pⁿN)-torsor (BHW Lemma 8.16(1); H3/H4, the quotient of a free action of a finite group, PerfectoidSpaces:P8/free-action-quotient-is-torsor). So the hybrid tower is an S0 rigidified moduli tower with the pro-system Δ_{K(pⁿ)} = Δ(pⁿN) (whose orders are unbounded in n when [F : ℚ] > 1 (for F = ℚ they are 1)) acting freely, and S0 rigidified-moduli-tower (isTorsor_of_free) makes the limit a pro-étale torsor under Δ_∞ = lim_n Δ(pⁿN) = Δ(p^∞N).
2. (2) On π₀ the map is (𝒪_F/pⁿ)^× → U_n = coker(𝒪_F^{×,+} → (𝒪_F/pⁿ)^×) (BHW Lemma 8.15, with the corrected double-coset argument via Milne 5.17); the stabiliser of the identity component is Δ_∞(N) = ker(Δ(p^∞N) → 𝒪_p^×), finite because units ≡ 1 modulo high powers of p are squares of units ≡ 1 mod pⁿN up to a bounded group; for p odd the transition maps are injective (η ≡ 1 mod pⁿN and η² ≡ 1 mod p^{n+1} force η ≡ 1 mod p^{n+1}) and the orders are bounded, giving stabilisation.
3. Perfectoidness of the quotient by the finite group: S4 (P8/quotient-of-good-tower) or BHW Lemma 8.6.

**Acceptance instances.**

- For F = ℚ, Δ(p^∞N) and Δ_∞(N) are trivial.
- For F = ℚ(√5), N = 4 and p odd: |Δ(4pⁿ)| = k_n, the order of ε = (1+√5)/2 in (𝒪_F/4pⁿ)^×, so Δ(p^∞N) is infinite, while at n = 0 |Δ(4)| = 6 (S0 rigidified-moduli-tower, test rigidified_hilbert_delta_order).

**Direct prerequisites.** `PerfectoidShimuraVarieties:S5/hilbert-three-towers`, `PerfectoidShimuraVarieties:S5/hilbert-mixed-span`, `PerfectoidShimuraVarieties:S0/rigidified-moduli-tower`, `PerfectoidShimuraVarieties:S0/component-set-of-infinite-level`, `PerfectoidShimuraVarieties:S0/connected-component-tower`, `HilbertModularVarietiesAndShimuraCurves:H3`, `HilbertModularVarietiesAndShimuraCurves:H4`, `PerfectoidSpaces:P8/free-action-quotient-is-torsor`, `PerfectoidSpaces:P8/quotient-of-good-tower`, `PerfectoidShimuraVarieties:S4/preabelian-minimal-perfectoid`.

**Sources.**

- [Christopher Birkbeck, Ben Heuer, Chris Williams, Overconvergent Hilbert modular forms via perfectoid modular varieties](https://arxiv.org/abs/1902.03985v4), §8.4, Proposition 8.21, pp. 37–38. The full-tower torsor.
- [Christopher Birkbeck, Ben Heuer, Chris Williams, Overconvergent Hilbert modular forms via perfectoid modular varieties](https://arxiv.org/abs/1902.03985v4), §8.4, Proposition 8.21(4), p. 38. The finite torsor on identity components.

### Deck groups of the Hilbert towers at Γ₀(pⁿ)-level and the central closure Z_∞

Target `PerfectoidShimuraVarieties:S5/hilbert-level-torsors` (theorem).

For n ∈ ℤ_{≥0} ∪ {∞}: (1) X_{Γ(p^∞)} → X_{Γ₀(pⁿ)} is a pro-étale torsor under Γ₀(pⁿ) ⊆ GL_2(𝒪_p) (for n = 0: a G(ℤ_p)-torsor over X); (2) X_{G,Γ(p^∞)} → X_{G,Γ₀(pⁿ)} is a pro-étale torsor under PΓ₀(pⁿ) := Γ₀(pⁿ)/Z_∞, where Z_∞ is the closure of (1 + N𝒪_F)^× (all units ≡ 1 mod N, embedded as scalars) in 𝒪_p^× — the S0 kernel Z_{K^p} ∩ K_p of the G-tower (S0 tower-action-kernel with Z = Res_{F/ℚ}G_m); (3) X_{Γ(p^∞)} → X_{G,Γ₀(pⁿ)} is a pro-étale torsor under E(pⁿ) := lim_m (Γ̄₀(pⁿ, p^m) × 𝒪_F^{×,+})/(1 + N𝒪_F)^× = (Γ₀(pⁿ) × Δ(p^∞N))/Z_∞ (z ↦ (diag(z, z), z²); the limit of the finite-level presentations, the same group as in hilbert-weil-pairing, containing BHW's (Γ₀(pⁿ) × 𝒪_F^{×,+})/(1 + N𝒪_F)^× as a dense subgroup), with exact sequences 0 → Γ₀(pⁿ) → E(pⁿ) → Δ(N) → 0 and 0 → Δ(p^∞N) → E(pⁿ) → PΓ₀(pⁿ) → 0; (4) all statements restrict to the anticanonical loci (ε)_a for n ≥ 1 (not for n = 0: (ε)_a is only Γ₀(p)-stable), the anticanonical locus being Δ-stable because the Hasse invariant does not depend on the polarization. BHW's Lemma 9.2 and the OverconvergentAutomorphicForms O4 nodes that copy it take Z_∞ to be the closure of (1 + N𝒪_F)^{×,+} in '𝒪_p^{×,+}'; the correct group is the closure of (1 + N𝒪_F)^× in 𝒪_p^× (PerfectoidShimuraVarieties/E29).

**Hypotheses and conventions.**

- F totally real of degree g with ring of integers 𝒪_F, different 𝔡, 𝒪_p = 𝒪_F ⊗ ℤ_p; G = Res_{F/ℚ}GL_2, G* = G ×_{Res G_m} G_m; tame level μ_N with N ≥ 4 prime to p and a polarization module 𝔠 (BHW §5.1); L ⊇ ℚ_p^cycl perfectoid; levels at p act on α: 𝒪_p² ≅ T_pA^∨ by α ↦ α ∘ γ^∨, γ^∨ = det(γ)γ⁻¹ (the left action of BHW, equal to the Shimura right translation by γ^∨ under the identification λ⁻¹ ∘ (α ⊗ id)).

**Proof route.**

1. Finite levels: BHW Proposition 8.18 and Lemma 8.19 (H4: level-structure torsors, the ineffective central subgroup Z_n and the PΓ groups); pass to the limit (S0 infinite-level-diamond (v)).
2. Identify Z_∞ with S0's kernel: Z(ℚ) = F^×, Z(ℚ) ∩ K = (1 + N𝒪_F)^× ∩ 𝒪_F^× at full tame level, whose closure in 𝒪_p^× is Z_∞ (S0 tower-action-kernel).
3. Anticanonical restriction: fibre the diagrams with the Δ(N)-torsor X_{Γ₀(pⁿ)}(ε)_a → X_{G,Γ₀(pⁿ)}(ε)_a (ShimuraCompactifications:C6/hilbert-ordinary-polarization-quotient; BHW Lemma 8.5, Remark 8.27).

**Acceptance instances.**

- For F = ℚ and N ≥ 3, Z_∞ = 1 and PΓ₀(pⁿ) = Γ₀(pⁿ).
- For F real quadratic, Z_∞ is infinite (the closure of a rank-one group of units), so X_{G,Γ(p^∞)} is not a Γ₀(pⁿ)-torsor.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S5/hilbert-three-towers`, `PerfectoidShimuraVarieties:S5/hilbert-polarization-torsors`, `PerfectoidShimuraVarieties:S0/tower-action-kernel`, `HilbertModularVarietiesAndShimuraCurves:H4`, `ShimuraCompactifications:C6/hilbert-ordinary-polarization-quotient`.

**Sources.**

- [Christopher Birkbeck, Ben Heuer, Chris Williams, Overconvergent Hilbert modular forms via perfectoid modular varieties](https://arxiv.org/abs/1902.03985v4), §8.4.1, Lemma 8.24 and diagram (8.7), p. 39. The PΓ₀(pⁿ)-torsor.
- [Christopher Birkbeck, Ben Heuer, Chris Williams, Overconvergent Hilbert modular forms via perfectoid modular varieties](https://arxiv.org/abs/1902.03985v4), §8.3, Definition 8.17, p. 36. The central subgroup uses all units ≡ 1 mod N.

### The action of G(ℚ_p) on the Hilbert towers and the change of polarization module

Target `PerfectoidShimuraVarieties:S5/hilbert-gl2-qp-action` (construction).

The level-structure action of G(ℤ_p) = GL_2(𝒪_p) on X_{Γ(p^∞)} extends to an action of G(ℚ_p) = GL_2(F_p) on the disjoint union ⊔_𝔠 X_{𝔠,Γ(p^∞)} over polarization modules: for γ ∈ M_2(𝒪_p) ∩ GL_2(F_p) (after scaling, a scalar x acting by A ↦ A/A[x]), with D = ker(γ on A[pⁿ]) for n ≫ 0 transported through λ⁻¹ ∘ α, γ sends (A, ι, λ, μ_N, α) to (A/D, ι′, λ′, μ′_N, α′), where φ: A → A/D is the quotient isogeny, λ′ is the unique 𝔠𝔟-polarization of A/D compatible with λ, and α′: 𝒪_p² ≅ T_p(A/D)^∨ is the unique isomorphism with φ^∨ ∘ α′ = α ∘ γ^∨ (BHW Lemma 8.23; for γ ∈ GL_2(𝒪_p), φ = id and α′ = α ∘ γ^∨). Equivalently φ^∨(T_p(A/D)^∨) = α(γ^∨𝒪_p²) ⊆ T_pA^∨. This is a left action: γ·(δ·x) = (γδ)·x. Relative to S0, it lies over the right translation by γ^∨ on the arithmetic tower, combined with the change of the component of the polarization class; it permutes the X_{𝔠,Γ(p^∞)} and does not preserve a fixed 𝔠.

**Hypotheses and conventions.**

- F totally real of degree g with ring of integers 𝒪_F, different 𝔡, 𝒪_p = 𝒪_F ⊗ ℤ_p; G = Res_{F/ℚ}GL_2, G* = G ×_{Res G_m} G_m; tame level μ_N with N ≥ 4 prime to p and a polarization module 𝔠 (BHW §5.1); L ⊇ ℚ_p^cycl perfectoid; levels at p act on α: 𝒪_p² ≅ T_pA^∨ by α ↦ α ∘ γ^∨, γ^∨ = det(γ)γ⁻¹ (the left action of BHW, equal to the Shimura right translation by γ^∨ under the identification λ⁻¹ ∘ (α ⊗ id)).
- Compatibility with multiplication is only asserted by BHW ('It is clear from this characterisation of γ and the contravariance'); it is proved directly below. It cannot be read off from the S0 right translations, because the action lives on ⊔_𝔠 X_{𝔠,Γ(p^∞)}, a Δ(p^∞N)-torsor over the Shimura tower, not on the Shimura tower itself.

**Proof route.**

1. Isogenies of HBAVs with kernels D ≅ ⊕𝒪_F/𝔟_i carry unique 𝔠𝔟-polarizations (BHW Lemma 8.22; HilbertModularVarietiesAndShimuraCurves H3, change of 𝔠).
2. Define α′ by φ^∨ ∘ α′ = α ∘ γ^∨ (BHW Lemma 8.23, whose vertical arrows γ^∨ and φ^∨ point up); then φ^∨(T_p(A/D)^∨) = α(γ^∨𝒪_p²), and a p-power isogeny into A^∨ is determined up to unique isomorphism by this lattice.
3. Multiplicativity: for γ, δ, let x′ = δ·x with isogeny φ_δ and level α_δ. The isogeny for γ at x′ has lattice φ_γ^∨(T_pB^∨) = α_δ(γ^∨𝒪_p²), and its image under φ_δ^∨ is α(δ^∨γ^∨𝒪_p²) = α((γδ)^∨𝒪_p²), because (γδ)^∨ = δ^∨γ^∨. So the composite isogeny φ_γ ∘ φ_δ has the lattice of γδ at x, the level structures agree (φ_δ^∨ ∘ φ_γ^∨ ∘ α″ = α ∘ (γδ)^∨), and the polarizations agree by the uniqueness in Lemma 8.22; hence γ·(δ·x) = (γδ)·x. A scalar matrix x·1_2 (x ∈ 𝒪_p ∩ F_p^×) acts by A ↦ A/A[x], whose lattice is x·T_pA^∨ = α((x·1_2)^∨𝒪_p²), so the rescaling into M_2(𝒪_p) is compatible with the lattice description.
4. Compatibility with S0: β₂(γ·x) = T_{γ^∨}(β₂(x)) through the moduli interpretation of the arithmetic Shimura variety (S0 tower-right-action); this is consistent with the left action because T_{(γδ)^∨} = T_{δ^∨γ^∨} = T_{γ^∨} ∘ T_{δ^∨}.

**Planning API.**

- `HilbertTower.qpAction` (constructor): The action of G(ℚ_p) on ⊔_𝔠 X_{𝔠,Γ(p^∞)}.
- `HilbertTower.qpAction_extends` (compatibility): On G(ℤ_p) it is the level-structure action.
- `HilbertTower.qpAction_polModule` (characterisation): γ maps X_{𝔠} to X_{𝔠𝔟} with 𝔟 the product of the elementary divisors of the kernel.
- `HilbertTower.qpAction_eq_translate` (equivalence): Under the dictionary, it is the S0 right translation by γ^∨.

**Unit tests.**

- `qpAction_scalar_p` (computation): γ = p·1 sends 𝔠 to p²𝔠.
- `qpAction_integral` (degenerate): For γ ∈ GL_2(𝒪_p), 𝔟 = 𝒪_F and the action is the level action.
- `qpAction_not_fixed_c` (non-example): For γ = diag(ϖ, 1) with ϖ ∈ F_p^× a local uniformizer of valuation 1 at a non-principal prime 𝔭 | p and valuation 0 at the other primes above p, the polarization module changes to 𝔠𝔭, in a different narrow class, so the action does not preserve X_{𝔠,Γ(p^∞)}.

**Acceptance instances.**

- For γ = p·1 the action sends A to A/A[p] ≅ A with the polarization multiplied by p², i.e. 𝔠 ↦ p²𝔠, the same narrow class.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S5/hilbert-three-towers`, `PerfectoidShimuraVarieties:S0/tower-right-action`, `HilbertModularVarietiesAndShimuraCurves:H3`.

**Sources.**

- [Christopher Birkbeck, Ben Heuer, Chris Williams, Overconvergent Hilbert modular forms via perfectoid modular varieties](https://arxiv.org/abs/1902.03985v4), §8.4.1, Lemmas 8.22–8.23, pp. 38–39. Extension of the action.

### Period maps, coefficient trivializations and anticanonical domains across the Hilbert towers

Target `PerfectoidShimuraVarieties:S5/hilbert-period-and-domain-compatibility` (theorem).

(1) There are Hodge–Tate period maps X_{Γ*(p^∞)} → X_{Γ(p^∞)} → X_{G,Γ(p^∞)} → Res_{𝒪_F|ℤ}ℙ¹ compatible with β₁, β₂: on X_{Γ(p^∞)} the map is (x, u) ↦ diag(u, 1)·π_HT(x) on the span of hilbert-mixed-span (BHW's 'projection to the first factor' is not ℤ_p^×-invariant; PerfectoidShimuraVarieties/E27), it equals (A, α) ↦ α⁻¹(ker HT_A), is invariant under the polarization action (which does not change (A, α)), and descends along the pro-étale Δ(p^∞N)-torsor β₂ to the arithmetic tower (this node proves the descent). (2) The coordinate 𝔷 = π_HT^*z, the section 𝔰 = π_HT^*s of ω = π_HT^*Res 𝒪(1) with 𝔰(A, α) = HT_A(α(1, 0)), and the automorphy factor γ^*𝔰 = (c𝔷 + d)𝔰 extend from X_{Γ*(p^∞)} (γ ∈ Γ*₀(p)) to X_{Γ(p^∞)} (γ ∈ Γ₀(p) ⊆ GL_2(𝒪_p)), with ω pulled back from X. (3) For every rational prime p unramified in F (including p = 2, 3), and for p ramified in F granted the ramified case of the T4 request (BHW's proof of Proposition 5.18 uses P¹(𝒪_p ⊗ 𝒪_C) ≅ P¹(𝒪_C)^Σ, which holds only for p unramified in F; PerfectoidShimuraVarieties/E36), and the T4 bounds (m ≥ 1, p^{−m} ≤ r < 1, ε ≤ 1/(c_p p^m)), with one ε for all 𝔭 | p (the total Hasse invariant): π_HT(X_{Γ*(p^∞)}(ε)_c) ⊆ B_r(1 : p𝒪_p) and π_HT(X_{Γ*(p^∞)}(ε)_a) ⊆ B_r(𝒪_p : 1), and the same inclusions hold on X_{Γ(p^∞)}(ε)_a and X_{G,Γ(p^∞)}(ε)_a through (1); the canonical and anticanonical domains and their radii are compatible with all the comparisons of hilbert-three-towers, hilbert-level-torsors and hilbert-polarization-torsors, and the arithmetic unit action and adjugate level convention are preserved.

**Hypotheses and conventions.**

- F totally real of degree g with ring of integers 𝒪_F, different 𝔡, 𝒪_p = 𝒪_F ⊗ ℤ_p; G = Res_{F/ℚ}GL_2, G* = G ×_{Res G_m} G_m; tame level μ_N with N ≥ 4 prime to p and a polarization module 𝔠 (BHW §5.1); L ⊇ ℚ_p^cycl perfectoid; levels at p act on α: 𝒪_p² ≅ T_pA^∨ by α ↦ α ∘ γ^∨, γ^∨ = det(γ)γ⁻¹ (the left action of BHW, equal to the Shimura right translation by γ^∨ under the identification λ⁻¹ ∘ (α ⊗ id)).
- The radius bounds are HodgeTateAndCanonicalSubgroups T4's (from BHW Proposition 5.18). BHW's proof covers p unramified in F only: it identifies π_HT(z) with a point (a : b) of P¹(𝒪_p ⊗ 𝒪_C) ≅ P¹(𝒪_C)^Σ, and 𝒪_p ⊗_{ℤ_p} 𝒪_C ≅ 𝒪_C^Σ requires 𝒪_p étale over ℤ_p. For p ramified in F the inclusions are an open part of the T4 request, not a consequence of BHW (PerfectoidShimuraVarieties/E36).

**Proof route.**

1. (1a) π_HT on X_{Γ*(p^∞)} is S3 hilbert-res-flag-period-map. By its equivariance, π_HT(diag(t, 1)·x) = diag(t, 1)·π_HT(x): the level action of γ replaces the line α⁻¹(ker HT) by (γ^∨)⁻¹α⁻¹(ker HT), and (γ^∨)⁻¹ = det(γ)⁻¹γ acts on Res ℙ¹ as γ. Hence (x, u) ↦ diag(u, 1)·π_HT(x) on X_{Γ*(p^∞)} × 𝒪_p^× is invariant under t·(x, u) = (diag(t, 1)x, ut⁻¹) (BHW's projection to the first factor is not; PerfectoidShimuraVarieties/E27), and it descends along the ℤ_p^×-torsor X_{Γ*(p^∞)} × 𝒪_p^× → X_{Γ(p^∞)} of hilbert-mixed-span. At u = 1 it is π_HT on X_{Γ*(p^∞)}, which gives compatibility with β₁, and by the same equivariance the descended map is (A, α) ↦ α⁻¹(ker HT_A).
2. (1b) Polarization invariance: the polarization action changes only λ, while α and the Hodge–Tate filtration of T_pA^∨ do not involve λ, so the map on X_{Γ(p^∞)} is invariant under Δ(p^∞N). Descent: β₂: X_{Γ(p^∞)} → X_{G,Γ(p^∞)} is a pro-étale Δ(p^∞N)-torsor (hilbert-polarization-torsors (1)), so X_{G,Γ(p^∞)} is the v-sheaf quotient X_{Γ(p^∞)}/Δ(p^∞N), and the invariant map descends uniquely to π_HT on X_{G,Γ(p^∞)}, compatibly with β₂ (BHW Lemma 8.28, with the descent map corrected as above).
3. (2) The fibre of ω = π_HT^*Res 𝒪(1) at (A, α) is identified through HT_A ∘ α with the quotient line (S3); this description does not involve λ, so it extends to the intermediate tower and the automorphy factor is computed as in BHW Lemma 5.29.
4. (3) T4's inclusions on X_{Γ*(p^∞)} and transport through (1), using that the anticanonical locus is a preimage stable under Δ.

**Acceptance instances.**

- For F = ℚ, (1)–(3) reduce to modular-anticanonical-and-period-compatibility.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S5/hilbert-three-towers`, `PerfectoidShimuraVarieties:S5/hilbert-mixed-span`, `PerfectoidShimuraVarieties:S5/hilbert-polarization-torsors`, `PerfectoidShimuraVarieties:S5/hilbert-level-torsors`, `PerfectoidShimuraVarieties:S3/hilbert-res-flag-period-map`, `HodgeTateAndCanonicalSubgroups:T4/canonical-anticanonical-loci`, `HodgeTateAndCanonicalSubgroups:T4/atkin-lehner-anticanonical`, `HodgeTateAndCanonicalSubgroups:T4/period-map-inclusions`, `HodgeTateAndCanonicalSubgroups:T4/ramified-period-comparison`, `HodgeTateAndCanonicalSubgroups:T5/igusa-full-level-comparison`.

**Sources.**

- [Christopher Birkbeck, Ben Heuer, Chris Williams, Overconvergent Hilbert modular forms via perfectoid modular varieties](https://arxiv.org/abs/1902.03985v4), §8.5, Lemma 8.28, pp. 39–40. The period maps on the three towers.
- [Christopher Birkbeck, Ben Heuer, Chris Williams, Overconvergent Hilbert modular forms via perfectoid modular varieties](https://arxiv.org/abs/1902.03985v4), §5.3, Proposition 5.18, p. 24. The image bounds.
- [Christopher Birkbeck, Ben Heuer, Chris Williams, Overconvergent Hilbert modular forms via perfectoid modular varieties](https://arxiv.org/abs/1902.03985v4), §5.3, proof of Proposition 5.18, p. 24. The proof uses 𝒪_p ⊗ 𝒪_C ≅ 𝒪_C^Σ, valid for p unramified in F.

### The Hilbert towers for F = ℚ are the modular tower

Target `PerfectoidShimuraVarieties:S5/hilbert-f-equals-q-check` (comparison).

For F = ℚ: G* = G = GL_2, Γ* = Γ, Δ(N) = Δ(p^∞N) = Δ_∞(N) = 1, Z_∞ = 1 (N ≥ 3), Res_{ℤ|ℤ}ℙ¹ = ℙ¹, e_β is the Weil pairing, and every statement of hilbert-three-towers through hilbert-period-and-domain-compatibility specialises to modular-tower-comparison, modular-cusp-charts-and-q-action and modular-anticanonical-and-period-compatibility after matching tame levels (BHW's μ_N-structures 𝔡⁻¹ ⊗ μ_N ↪ A[N] versus Γ₁(N)-structures on E, through the principal polarization E ≅ E^∨ with the sign fixed by the Weil pairing).

**Hypotheses and conventions.**

- F = ℚ; N ≥ 4 for BHW's μ_N-convention.

**Proof route.**

1. Specialise each construction (HilbertModularVarietiesAndShimuraCurves H5 identifies the groups and moduli problems with the modular ones).
2. Compare tame levels: μ_N ↪ E[N] is a Γ₁(N)-type structure on E^∨ ≅ E.

**Acceptance instances.**

- The test three_towers_F_eq_Q of hilbert-three-towers.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S5/modular-tower-comparison`, `PerfectoidShimuraVarieties:S5/modular-cusp-charts-and-q-action`, `PerfectoidShimuraVarieties:S5/modular-anticanonical-and-period-compatibility`, `PerfectoidShimuraVarieties:S5/hilbert-period-and-domain-compatibility`, `PerfectoidShimuraVarieties:S5/hilbert-level-torsors`, `HilbertModularVarietiesAndShimuraCurves:H5`.

**Sources.**

- [Christopher Birkbeck, Ben Heuer, Chris Williams, Overconvergent Hilbert modular forms via perfectoid modular varieties](https://arxiv.org/abs/1902.03985v4), §5.1.1, Remark 5.5, p. 19. Level structures on A^∨ versus A.

## S6 — General period maps and the abelian-type minimal extension

Coverage: **planned**.

- Gap: Boxer–Pilloni §3.3 flag-variety dynamics (tubes of Bruhat cells and their normalisation), used by bruhat-levi-reduction and through it by the Bruhat clause of toroidal-hecke-correspondences, has no owner yet.
- Exact accepted T6 finite-level logarithmic comparison, lattice filtration, parabolic reduction, Levi twist and Hodge-type agreement nodes are imported. They do not resolve the tower/effective-deck/log-to-v bridge gap.
- Effective arithmetic central-kernel annihilation and the logarithmic-to-v comparison, including v-covers and analytic torsor descent.
- Auxiliary reflex-torus datum and G^c/Levi fibre-product identities, beyond the existing central-isogeny lift.
- Descent through ramified toroidal finite quotients with trivial boundary inertia on pushed-out fibres.
- Repair the separate-vanishing step of BP Lemma 4.6.20 (E41) in the flag-dynamics supplier.

### Evaluating the Hodge–Tate torsor on perfectoid test objects over the toroidal tower diamond

Target `PerfectoidShimuraVarieties:S6/kummer-to-v-bridge` (lemma).

In the situation of toroidal-tower-diamond (S0.general) and HodgeTateAndCanonicalSubgroups T6:comparison: let P_HT ⊆ G_{pet,p} ×^{G^c(ℚ_p)} G^{c,an} be the P^c_μ-reduction of the pro-Kummer-étale G^c(ℚ_p)-torsor over S^tor_{K,Σ} given by the logarithmic Hodge–Tate filtration. For every perfectoid space S with a map S → S^{tor◇}_{K^p,Σ,∞}, there is a P^{c,an}_μ-torsor P_HT(S) ⊆ G^{c,an} × S, functorial in S and compatible with base change, which étale-locally on S̃ → S is P^{c,an}_μ · g_{S̃} for an element g_{S̃} ∈ G^{c,an}(S̃) unique up to left multiplication by P^{c,an}_μ(S̃); the cocycle p₂^*g · (p₁^*g)⁻¹ ∈ P_μ(S̃ ×_S S̃) describes P_HT(S), and right translation g_{S̃} ↦ g_{S̃}·g by G^{an} carries the embedded reduction P_HT(S) to its translate P_HT(S)·g, inducing an isomorphism of the intrinsic P-torsors. This is the passage from the pro-Kummer-étale site of S^tor_{K,Σ} to the v-site of the diamond that Boxer–Pilloni §4.6.1 presuppose and do not prove.

**Hypotheses and conventions.**

- (G, X) an arbitrary pure Shimura datum (Boxer–Pilloni §4: axioms SV1–SV3), K = K^pK_p neat, Σ a fixed projective K-admissible cone decomposition, smooth for the base cusp lattice at K; at deeper K^pK′_p ⊆ K the same fan is pulled back with its changed cusp lattice and fs logarithmic Kummer charts, without asserting smoothness of every underlying deeper-level space, F/ℚ_p finite splitting G with E(G, X) ⊆ F; G^c = G/Z_s(G), where Z_s(G) is the largest subtorus of the centre Z(G) which is ℝ-split but contains no ℚ-split subtorus (Boxer–Pilloni §4.1.1; Z_s(G) = 1 in the Hodge-type case).

**Proof route.**

1. Use the effective profinite deck group from S0/tower-action-kernel, not an automatically faithful K_p-torsor. To trivialize the pushed-out G^c torsor over the limit, verify that the actual arithmetic central kernel maps to 1 in G^c; the precise logarithmic/effective-deck comparison is a recorded supplier request.
2. On log affinoid perfectoid objects the logarithmic period sheaves have the required evaluations (T6:comparison). Passing from these objects to all perfectoid tests over the tower requires a v-cover comparison and v-descent of analytic P^c_μ-torsors; these are recorded requests, not consequences of evaluating period sheaves alone.
3. Two local frames differ by P_μ on the left. Right translation changes their embedding in the trivial G^c-torsor but preserves the intrinsic torsor through the translated isomorphism.

**Acceptance instances.**

- For Hodge-type data with perfect Σ, P_HT(S) is the pullback of the Hodge–Tate torsor along a map S → S^{tor}_{K^p,Σ} of perfectoid spaces (S3 hodge-compactified-period-maps (c)).

**Direct prerequisites.** `PerfectoidShimuraVarieties:S0.general/toroidal-tower-diamond`, `DiamondsAndVStacks:D4/diamonds-are-v-sheaves`, `PerfectoidShimuraVarieties:S3/levi-torsor-over-flag-variety`, `AutomorphicBundles:B0/central-split-quotient`, `AutomorphicBundles:B0/ineffective-fibre-descent`, `PerfectoidShimuraVarieties:S0/tower-action-kernel`, `HodgeTateAndCanonicalSubgroups:T6:log-sites/log-affinoid-perfectoid`, `HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-log-period-comparison`, `HodgeTateAndCanonicalSubgroups:T6:comparison/lattice-hodge-tate-filtration`, `HodgeTateAndCanonicalSubgroups:T6:comparison/hodge-tate-parabolic-reduction`, `HodgeTateAndCanonicalSubgroups:T6:comparison/finite-levi-torsor`.

**Sources.**

- [George Boxer, Vincent Pilloni, Higher Coleman theory](https://arxiv.org/abs/2110.10251v1), §4.6.1, pp. 87–88. Boxer–Pilloni's description on perfectoid test objects (the sentence continues with the superscript an).

### Boxer–Pilloni's theorem: the Hodge–Tate period map on the general toroidal tower diamond

Target `PerfectoidShimuraVarieties:S6/general-toroidal-period-map` (theorem).

In the situation of kummer-to-v-bridge, the pushed-out coefficient torsor G_{pet,p} is trivial over the toroidal tower diamond S^{tor◇}_{K^p,Σ,∞} = lim_{K′_p ⊆ K_p} (S^tor_{K^pK′_p,Σ})^◇ (S0.general toroidal-tower-diamond), which gives a K_p-equivariant map of v-sheaves π^tor_HT: S^{tor◇}_{K^p,Σ,∞} → FL_{G^c,μ} = P^c_μ\G^c (right action), sending a test object S to the class of g_S of kummer-to-v-bridge. The pullback along π^tor_HT of the M^c_μ-torsor U_{P^c_μ}\G^c → FL is M^{an}_HT, and M^{an}_HT ≅ (M^{an}_dR ×^{μ, ℤ_p^×} ℤ_p(1)) ×_{S^tor_{K^pK_p,Σ}} S^{tor◇}_{K^p,Σ,∞}, the pullback from finite level of the canonical extension of the de Rham Levi torsor twisted by the cyclotomic character through μ (Boxer–Pilloni Theorem 4.4.40 in the authors' revised form; the arXiv v1 statement omits the twist, PerfectoidShimuraVarieties/E20). On the open subdiamond S^◇_{K^p,∞}, π^tor_HT restricts to the Hodge–Tate period map, and for Hodge-type data and perfect Σ it is the map of S3 hodge-compactified-period-maps (c). No perfectoidness of the toroidal diamond, no affineness of π^tor_HT and no factorisation through a minimal compactification are asserted for general data.

**Hypotheses and conventions.**

- (G, X) an arbitrary pure Shimura datum (Boxer–Pilloni §4: axioms SV1–SV3), K = K^pK_p neat, Σ a fixed projective K-admissible cone decomposition, smooth for the base cusp lattice at K; at deeper K^pK′_p ⊆ K the same fan is pulled back with its changed cusp lattice and fs logarithmic Kummer charts, without asserting smoothness of every underlying deeper-level space, F/ℚ_p finite splitting G with E(G, X) ⊆ F; G^c = G/Z_s(G), where Z_s(G) is the largest subtorus of the centre Z(G) which is ℝ-split but contains no ℚ-split subtorus (Boxer–Pilloni §4.1.1; Z_s(G) = 1 in the Hodge-type case).
- Only K_p acts on the fixed-Σ tower; equivariance for G(ℚ_p) is through the Hecke correspondences of toroidal-hecke-correspondences.
- The trivialization is conditional on kummer-to-v-bridge’s effective-deck comparison, annihilation of the arithmetic central kernel in G^c, log-affinoid v-covers and analytic torsor descent; the tower is not assumed to be a faithful K_p-torsor.

**Proof route.**

1. Use kummer-to-v-bridge’s effective-deck comparison and central-kernel annihilation to trivialize the pushed-out G^c coefficient torsor. Its descended P_HT-reduction defines the flag map. The generic finite-level K_p action alone does not supply that trivialization.
2. Pulling back U_P\G → FL recovers P_HT ×^{P} M = M_HT (definition).
3. The finite-level logarithmic comparison M_HT ≅ M_dR ×^{μ,ℤ_p^×} ℤ_p(1) with the canonical extension M_dR (HodgeTateAndCanonicalSubgroups T6:comparison, Boxer–Pilloni §4.4.38–4.4.39 after Diao–Lan–Liu–Zhu Theorem 5.3.1; AutomorphicBundles:B3.general/general-canonical-extension) pulls back to the tower.
4. Comparison with S3: for Hodge-type data, on the open Shimura variety the logarithmic comparison, hence the Hodge–Tate filtration and P_HT, agrees with Caraiani–Scholze's P_μ-reduction P_p built from the universal abelian variety and its Hodge tensors (Boxer–Pilloni Remark 4.4.39; supplied by T6:comparison/hodge-type-comparison-agreement with its open-locus hypotheses), so π^tor_HT restricted to S^◇_{K^p,∞} is S3 hodge-open-period-map. For perfect Σ, π^tor_HT and the map of S3 hodge-compactified-period-maps (c) agree on the open subdiamond; their equaliser is a closed subdiamond (FL is separated) whose underlying closed set contains the dense subset |S^◇_{K^p,∞}| of |S^{tor◇}_{K^p,Σ,∞}| = lim |S^tor_{K^pK′_p,Σ}| (the boundary is nowhere dense at each level), so it is everything, and a closed immersion of diamonds that is surjective on points is an isomorphism (DiamondsAndVStacks:D4/isomorphism-criteria-for-v-sheaves-and-stacks).

**Acceptance instances.**

- For the Siegel datum and any Σ, π^tor_HT is the map of S1 perfectoid-toroidal-siegel-tower composed with the minimal π_HT.
- For a datum of non-abelian type (e.g. with an E₇ factor) the map exists although no perfectoid representative of the toroidal tower is known.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S6/kummer-to-v-bridge`, `PerfectoidShimuraVarieties:S0.general/toroidal-tower-diamond`, `PerfectoidShimuraVarieties:S0.general/general-infinite-level-diamond`, `PerfectoidShimuraVarieties:S3/levi-torsor-over-flag-variety`, `PerfectoidShimuraVarieties:S3/hodge-open-period-map`, `PerfectoidShimuraVarieties:S3/hodge-compactified-period-maps`, `AutomorphicBundles:B3.general/general-canonical-extension`, `AutomorphicBundles:B1.general/general-principal-model`, `DiamondsAndVStacks:D4/isomorphism-criteria-for-v-sheaves-and-stacks`, `HodgeTateAndCanonicalSubgroups:T6:comparison/finite-levi-torsor`, `HodgeTateAndCanonicalSubgroups:T6:comparison/hodge-type-comparison-agreement`.

**Sources.**

- [George Boxer, Vincent Pilloni, Higher Coleman theory](https://arxiv.org/abs/2110.10251v1), §4.4.38–4.4.40, pp. 77–78. Theorem 4.4.40 is deduced from the logarithmic Riemann–Hilbert comparison.
- [George Boxer, Vincent Pilloni, Higher Coleman theory (authors' revised manuscript)](https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf), §4.4.40, Theorem 4.4.40, p. 80. The twisted torsor identification in the authors' manuscript.

### Hecke correspondences on toroidal towers with common cone refinements

Target `PerfectoidShimuraVarieties:S6/toroidal-hecke-correspondences` (theorem).

In the situation of general-toroidal-period-map, for t ∈ G(ℚ_p) and cone decompositions Σ, Σ′ for which there is a common refinement Σ″ of the pullbacks along the two degeneracy maps (any two admissible cone decompositions have a common refinement; ShimuraCompactifications C3.general), there is a correspondence S^tor_{K^pK_p,Σ} ←p₂− S^tor_{K^p(K_p∩tK_pt⁻¹),Σ″} −p₁→ S^tor_{K^pK_p,Σ′}, a map of pro-Kummer-étale torsors p₁^*G_{pet,p} → p₂^*G_{pet,p} locally represented by t, and the induced map p₁^*M^{an}_dR → p₂^*M^{an}_dR of étale torsors, compatible with the period maps of the toroidal tower diamonds and, over the tower, with the Hodge–Tate side through M^{an}_HT = M^{an}_dR ×^{μ,ℤ_p^×} ℤ_p(1). Bruhat clause: assume moreover (G, X) of abelian type, G_{ℚ_p} quasi-split, K_p = K_{p,m′,b′} (m′ > 0, m′ ≥ b′ ≥ 0), 0 ≤ m − n ≤ m′ − 1, F large enough as in bruhat-levi-reduction, w ∈ ^MW and t ∈ T(ℚ_p); then over p₂⁻¹((π^tor_{HT,K_p})⁻¹(]C_{w,k}[_{m,n}K_p)) ∩ p₁⁻¹((π^tor_{HT,K_p})⁻¹(]C_{w,k}[_{m,n}K_p)) the map p₁^*M^{an}_dR → p₂^*M^{an}_dR, compared through the reductions M_{dR,m,n,K_p} of bruhat-levi-reduction, is locally represented by the double coset K^c_{p,w,M_μ}M^{1,c}_{μ,m,n}·wtw⁻¹·K^c_{p,w,M_μ}M^{1,c}_{μ,m,n} (Boxer–Pilloni Proposition 4.6.19, Lemma 4.6.20). No single Σ admits all correspondences.

**Hypotheses and conventions.**

- (G, X) an arbitrary pure Shimura datum (Boxer–Pilloni §4: axioms SV1–SV3), K = K^pK_p neat, Σ a fixed projective K-admissible cone decomposition, smooth for the base cusp lattice at K; at deeper K^pK′_p ⊆ K the same fan is pulled back with its changed cusp lattice and fs logarithmic Kummer charts, without asserting smoothness of every underlying deeper-level space, F/ℚ_p finite splitting G with E(G, X) ⊆ F; G^c = G/Z_s(G), where Z_s(G) is the largest subtorus of the centre Z(G) which is ℝ-split but contains no ℚ-split subtorus (Boxer–Pilloni §4.1.1; Z_s(G) = 1 in the Hodge-type case).
- Boxer–Pilloni state this for abelian type 'for suitable choices of polyhedral cone decomposition'; the compatibility condition is made explicit here (Σ″ refines both pullbacks).
- The Bruhat clause has the hypotheses of bruhat-levi-reduction (abelian type, quasi-split G_{ℚ_p}, K_p = K_{p,m′,b′}, F large), and through it depends on the Boxer–Pilloni §3.3 tubes (recorded gap).

**Proof route.**

1. Construct the correspondence on finite levels with the common refinement (ShimuraCompactifications C3.general) and pass to the diamonds of the towers (S0.general toroidal-tower-diamond, refinement maps are isomorphisms over the open part).
2. Local sections x₂ = x₁t of the pro-étale torsors give the map of G_{pet,p}-torsors; over the Bruhat domains choose P_HT-trivialisations x′_i with x_i = x′_iwh_i, i.e. x′_i = x_ih_i⁻¹w⁻¹, for h_i ∈ G^{1,c}_{m,n}K^c_p (bruhat-levi-reduction); then x′₂ = x′₁·wh₁th₂⁻¹w⁻¹ with wh₁th₂⁻¹w⁻¹ ∈ P^{an,c}_μ; project to M_μ and use the root-group factorisation (Lemma 4.6.20).

**Acceptance instances.**

- For GL_2 and t = diag(p, 1) it is the U_p correspondence on the modular tower, with the period map transforming by t on ℙ¹.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S6/general-toroidal-period-map`, `PerfectoidShimuraVarieties:S6/bruhat-levi-reduction`, `PerfectoidShimuraVarieties:S0.general/toroidal-tower-diamond`, `ShimuraCompactifications:C3/hecke-span`, `ShimuraCompactifications:C3/choice-comparison`, `ShimuraCompactifications:C3.general/general-map-descent`, `AutomorphicBundles:B3.general/general-boundary-functoriality`.

**Sources.**

- [George Boxer, Vincent Pilloni, Higher Coleman theory](https://arxiv.org/abs/2110.10251v1), §4.6.18, Proposition 4.6.19 and Lemma 4.6.20, pp. 94–96. The torsor map attached to t.
- [George Boxer, Vincent Pilloni, Higher Coleman theory (authors' revised manuscript)](https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf), §4.6.18, Proposition 4.6.19 and its proof, pp. 97–98. The relation x₂ = x₁t between the local sections; the revised manuscript states the torsor map for M^{an}_dR.

### Auxiliary data for an abelian-type datum: the Hodge-type cover and Lovering's B₁

Target `PerfectoidShimuraVarieties:S6/abelian-auxiliary-data` (construction).

Let (G, X) be of abelian type (ShimuraData:D4/abelian-type): there are a Hodge-type datum (G₁, X₁) and a central isogeny G₁^der → G^der inducing (G₁^ad, X₁⁺) ≅ (G^ad, X⁺). Let E be the composite of the reflex fields, T = Res_{E/ℚ}G_m, and (Lovering, §4.6) B₁ = G₁ ×_{G₁^ab} T for the map T → G₁^ab induced by μ_{G₁}, with a datum (B₁, X_{B₁}) and maps (B₁, X_{B₁}) → (G₁, X₁), (B₁, X_{B₁}) → (G, X) (through (B, X_B)) inducing isomorphisms on derived groups or central isogenies, so that all three share the flag variety FL_{G,μ} = FL_{G₁,μ_{G₁}} = FL_{B₁,μ_{B₁}} and the adjoint datum. For a morphism of data g: (H, X_H) → (S, X_S) with H^ad = S^ad, compact opens with g(K′) ⊆ K and Σ for S: S(H)_{K′} → S(S)_K is finite étale, Σ induces a cone decomposition for H with S^tor(H)_{K′,Σ} → S^tor(S)_{K,Σ} finite, and if g(K′) is normal in K the map of neutral components is Galois with finite group Δ(K, K′) = Γ^{ad}_K/Γ^{ad}_{K′}, the action extending to S^{tor,0}(H)_{K′,Σ} with quotient S^{tor,0}(S)_{K,Σ} (Boxer–Pilloni Proposition 4.4.42).

**Hypotheses and conventions.**

- (G, X) of abelian type; neat levels; Σ smooth projective.
- This is not the pre-abelian representability argument of S4: it uses the Hodge cover G₁ through a central isogeny of derived groups, Lovering's B₁, Deligne's reconstruction from connected components and finite quotients.
- The existing ShimuraData:D4/central-isogeny-lift supplies a lift through a specified central isogeny, not this auxiliary reflex-torus construction. The complete B₁ construction and its maps are separately requested below.

**Proof route.**

1. Lovering's construction of B₁ and of the maps (Lovering §4.6, Lemma 3.1.6).
2. Proposition 4.4.42: over ℂ both neutral components are X⁺ modulo arithmetic subgroups of the common adjoint group, of finite index in one another; rational parabolics correspond under P ↦ g⁻¹(P) (Harris §2.5), giving finiteness on toroidal charts; normality gives the Galois action.

**Planning API.**

- `AbelianType.hodgeCover` (data): A Hodge-type datum (G₁, X₁) with G₁^der → G^der a central isogeny inducing an isomorphism of adjoint connected data.
- `AbelianType.lovering` (constructor): B₁ = G₁ ×_{G₁^ab} Res_{E/ℚ}G_m with its datum and maps to (G₁, X₁) and (G, X).
- `AbelianType.flag_eq` (equivalence): FL_{G,μ} = FL_{G₁,μ_{G₁}} = FL_{B₁,μ_{B₁}} through the common adjoint group.
- `AbelianType.deltaGroup` (constructor): Δ(K, K′) = Γ^{ad}_K/Γ^{ad}_{K′} for g(K′) normal in K.
- `AbelianType.neutral_galois` (characterisation): The neutral components form a Galois cover with group Δ(K, K′), extending to toroidal compactifications.

**Unit tests.**

- `abelian_aux_hodge_trivial` (degenerate): For the Siegel datum (GSp_2g, H_g^±) with G₁ = G: E = ℚ, T = G_m and T → G^ab = G_m is the identity (the similitude of μ(z) is z), so B₁ = G; for f = id and K′ = K, Δ(K, K) = 1.
- `abelian_aux_hilbert` (computation): For G = Res_{F/ℚ}GL_2 and G₁ = G* (both with reflex field ℚ, so T = G_m → G₁^ab = G_m is an isomorphism and B₁ = G*), K = K(N) = {g ≡ 1 mod N} and K′ = K ∩ G*(𝔸_f): the determinant identifies Δ(K, K′) with (𝒪_F^{×,+} ∩ (1 + N𝒪_F))/(𝒪_F^× ∩ (1 + N𝒪_F))², the denominator coming from the scalar matrices in Γ_K.
- `abelian_aux_not_preabelian_proof` (non-example): A pre-abelian datum that is not of abelian type (an isomorphism of adjoint connected data without a central isogeny of derived groups) has no B₁ of this form; the construction does not apply.

**Acceptance instances.**

- For G = Res_{F/ℚ}GL_2 (Hilbert), G₁ = G* is a Hodge-type cover and Δ is the unit group quotient of S5.

**Direct prerequisites.** `ShimuraData:D4/abelian-type`, `ShimuraData:D4/central-isogeny-lift`, `ShimuraVarieties:V6/abelian-canonical`, `PerfectoidShimuraVarieties:S0/connected-component-tower`, `ShimuraCompactifications:C2.general/general-toroidal-descent`, `ShimuraCompactifications:C3.general/general-map-descent`.

**Sources.**

- [George Boxer, Vincent Pilloni, Higher Coleman theory](https://arxiv.org/abs/2110.10251v1), §4.4.41 and Proposition 4.4.42, pp. 78–80. Proposition 4.4.42(1).

### Fibre products of torsors and the de Rham torsor of B₁

Target `PerfectoidShimuraVarieties:S6/torsor-fibre-product` (lemma).

(i) Let H₁ → H₂ ← H₃ be smooth affine group schemes over a base S with H₁ → H₂ smooth and surjective (in the application G₁ → G₁^ab and M_{μ_{G₁}} → M^{ab}_μ), P_{H_i} étale torsors and isomorphisms θ₁: P_{H₁} ×^{H₁} H₂ ≅ P_{H₂}, θ₃: P_{H₃} ×^{H₃} H₂ ≅ P_{H₂}. Then P_{H₁} ×_{P_{H₂}} P_{H₃} is an étale (H₁ ×_{H₂} H₃)-torsor (Boxer–Pilloni print P_{H₁} ×_{P_{H₂}} P_{H₁}; PerfectoidShimuraVarieties/E22). (ii) In the situation of abelian-auxiliary-data, for K ⊆ B₁(𝔸_f) and Σ for G₁ there are levels K₁, K₂, K₃ and maps π₁: S^tor(B₁)_{K,Σ} → S^tor(G₁)_{K₁,Σ}, π₂: S^tor(B₁)_{K,Σ} → S(T)_{K₂} over S(G₁^ab)_{K₃}, with M_dR(B₁) ≅ π₁^*M_dR(G₁) ×_{π₃^*M_dR(G₁^ab)} π₂^*M_dR(T) canonically, and likewise for M_HT; with M^c_{μ_{B₁}} = M^c_{μ_{G₁}} ×_{M^{ab,c}_{μ}} T^c, constructions for G₁ extend to B₁ by the trivial construction on the zero-dimensional T-Shimura variety (Principle 4.4.44(1)).

**Hypotheses and conventions.**

- Smooth surjectivity of H₁ → H₂ is needed: flatness of H₁ ×_{H₂} H₃ does not suffice (for H₁ = H₃ = 1, H₂ = G_m and two different trivialisations θ₁, θ₃ of P_{H₂} the fibre product is the equaliser of two sections, not a torsor). It holds for G₁ → G₁^ab (quotient by G₁^der) and for M_{μ_{G₁}} → M^{ab}_μ (surjective because M_{μ_{G₁}} contains the centre).
- The compatibility of the c-quotients M^c for B₁ ⊇ Res T is asserted, not proved, in the source; a precise central-character calculation or supplier theorem is still required and is recorded as a gap.

**Proof route.**

1. (i) Étale-locally choose sections p₁ of P_{H₁} and p₃ of P_{H₃}; θ₁(p₁) and θ₃(p₃) differ by a section h₂ of H₂, which lifts étale-locally to H₁ because H₁ → H₂ is smooth and surjective; correcting p₁ by the lift gives a section of the fibre product, on which H₁ ×_{H₂} H₃ acts simply transitively.
2. For (ii), first establish the asserted identity of the coefficient groups and of their Levi quotients after passing to G^c; the auxiliary-datum supplier request records this missing central-character calculation. Given that identity, functoriality gives a morphism of torsors to the fibre product, and the torsor principle in (i) makes it an isomorphism. The group identity does not follow just from the torsor principle.

**Acceptance instances.**

- For T trivial (G₁ with G₁^ab = T) the fibre product is M_dR(G₁).

**Direct prerequisites.** `PerfectoidShimuraVarieties:S6/abelian-auxiliary-data`, `AutomorphicBundles:B1/abelian-canonical-principal-bundle`, `AutomorphicBundles:B1/hodge-canonical-principal-bundle`.

**Sources.**

- [George Boxer, Vincent Pilloni, Higher Coleman theory](https://arxiv.org/abs/2110.10251v1), §4.4.42, paragraph before Theorem 4.4.43, p. 80. The fibre-product torsor (with the misprinted index).
- [George Boxer, Vincent Pilloni, Higher Coleman theory](https://arxiv.org/abs/2110.10251v1), Principle 4.4.44, p. 82. The extension principle.

### Connected towers of abelian-type data: comparison with the Hodge cover and the descent group Δ

Target `PerfectoidShimuraVarieties:S6/abelian-connected-towers-and-descent-group` (theorem).

In the situation of abelian-auxiliary-data: (1) the connected-component towers lim_K S⁰(B₁)_K and lim_K S⁰(G₁)_K are canonically isomorphic, also for minimal and (compatible) toroidal compactifications; (2) for K^p ⊆ B₁(𝔸_f^p) there is (K^p)′ ⊆ G₁(𝔸_f^p) with a finite étale Galois map lim_{K′_p} S⁰(G₁)_{(K^p)′K′_p} → lim_{K_p} S⁰(B₁)_{K^pK_p}; (3) for f: B₁ → G and K ⊆ G(𝔸_f) neat there is K′ with S⁰(B₁)_{K′} → S⁰(G)_K finite étale Galois with group Δ(K, K′), and for K^p there is (K′)^p with lim_{K′_p} S⁰(B₁)_{(K′)^pK′_p} → lim_{K_p} S⁰(G)_{K^pK_p} finite étale Galois; (4) Deligne's reconstruction: S(G, X) = [S⁰(G, X) × 𝒜(G)]/𝒜⁰(G) with 𝒜(G) = G(𝔸_f)/Z(ℚ)⁻ *_{G(ℚ)_+} G^ad(ℚ)⁺ and 𝒜⁰(G) the completion of G^ad(ℚ)⁺ for the congruence topology of G^der(ℚ)_+, the same for minimal compactifications; (5) A⁰(B₁) → A⁰(G) is a continuous surjection whose kernel Δ is profinite, and S⁰(B₁) → S⁰(G) is pro-finite-étale Galois with group Δ; at fixed levels the finite groups Δ(K, K′) of (3) are used, and Δ = lim Δ(K, K′).

**Hypotheses and conventions.**

- (G, X) of abelian type with the data of abelian-auxiliary-data; neat levels.
- Over ℂ ≅ ℂ_p from here on, as in Boxer–Pilloni (rationality is not tracked).

**Proof route.**

1. (1) Connected components depend only on the connected datum, and (G₁^der, X₁⁺) = (B₁^der, X_{B₁}⁺); the congruence topologies on the adjoint group induced from H(ℚ)_+ and H^der(ℚ)_+ coincide (S0 connected-component-tower).
2. (2), (3) Choose decreasing levels and compare images of arithmetic groups in the adjoint group; the finite quotients Δ_n inject into each other, so their limit is finite at fixed tame level; apply abelian-auxiliary-data (Proposition 4.4.42).
3. (4) Deligne's §2.1 reconstruction (ShimuraVarieties:V6/connected-full-equivalence); the minimal compactification has the same components and the group actions extend by normality.
4. (5) Mittag-Leffler for the system of finite groups Δ(K, K′); f⁻¹ of congruence subgroups are congruence, and the kernel of G^der(ℚ)_+ → G^ad(ℚ)⁺ is finite.

**Acceptance instances.**

- For G of Hodge type with G₁ = G, B₁^der = G^der, so A⁰(B₁) = A⁰(G) and Δ is trivial in (5); (3) reduces to the neutral-component deck groups of S0.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S6/abelian-auxiliary-data`, `PerfectoidShimuraVarieties:S6/torsor-fibre-product`, `PerfectoidShimuraVarieties:S0/connected-component-tower`, `PerfectoidShimuraVarieties:S0/tower-action-kernel`, `ShimuraVarieties:V6/connected-full-equivalence`, `ShimuraVarieties:V6/connected-tower`.

**Sources.**

- [George Boxer, Vincent Pilloni, Higher Coleman theory](https://arxiv.org/abs/2110.10251v1), Theorem 4.4.43, §4.4.48 and Lemma 4.4.52, pp. 80–85. The descent group Δ.
- [George Boxer, Vincent Pilloni, Higher Coleman theory](https://arxiv.org/abs/2110.10251v1), §4.4.48, p. 83. Components of the minimal compactification.

### Tilde-limits of connected components, finite quotients and induced towers

Target `PerfectoidShimuraVarieties:S6/tilde-limit-components-and-quotients` (lemma).

Let (X_i)_{i∈I} be a cofiltered system of separated adic spaces locally of finite type over Spa(C, O_C) with finite transition maps, and X a perfectoid space with X ~ lim_i X_i (PerfectoidSpaces:P7/perfectoid-tilde-limit), with projections φ_i. (i) Components (Boxer–Pilloni Lemma 4.4.6): if every X_i has a finite set Π_i of connected components and Π := lim_i Π_i, then for e = (e_i) ∈ Π the subset X_e := ⋂_i φ_i⁻¹(X_{i,e_i}) underlies a perfectoid space, on every affinoid perfectoid U ⊆ X the Zariski-closed subspace cut out by the idempotents 1 − ε_i of the open and closed subsets U ∩ φ_i⁻¹(X_{i,e_i}), and X_e ~ lim_i X_{i,e_i}. (ii) Finite quotients (the tilde-limit half of Boxer–Pilloni Lemma 4.4.7): if a finite group Δ acts compatibly on the X_i and on X, and some X_{i₀} has a Δ-stable cover by pregood affinoids (affinoids V whose preimages φ_{i₀}⁻¹(V) are good affinoid perfectoids, PerfectoidSpaces:P7/good-affinoid-perfectoid), then for i → i₀ the quotients X_i/Δ are adic spaces with finite transition maps, X/Δ is a perfectoid space covered by the φ_{i₀}⁻¹(V)/Δ, and X/Δ ~ lim_i X_i/Δ. (iii) Induction (the step of Boxer–Pilloni Lemma 4.4.50): let H be a profinite group with a decreasing sequence of open normal subgroups H_n, ⋂_n H_n = 1, S ⊆ H a closed subgroup, and (Y_n)_n a tower as above with Y ~ lim_n Y_n perfectoid, S acting compatibly on Y and on each Y_n through S/(S ∩ H_n); put X_n := Y_n ×^{S/(S∩H_n)} (H/H_n), a finite disjoint union of copies of Y_n, and X := Y ×^S H for the right action on Y, with relation (y, h) ∼ (y·s, s⁻¹h). Then X is a perfectoid space, isomorphic to Y × (S\H) after choosing a continuous section σ of H → S\H, and X ~ lim_n X_n, compatibly with the right H-actions. The product carries the action transported through this section, not a trivial action on its Y-factor.

**Hypotheses and conventions.**

- C complete algebraically closed of characteristic 0 (in (ii) |Δ| is invertible, which gives the averaging projector).
- In (ii) the Δ-stable pregood cover is a hypothesis; the application supplies it.

**Proof route.**

1. (i) Good affinoid perfectoids U = Spa(A, A⁺) pulled back from affinoids U_{i₀} = Spa(A_{i₀}, A_{i₀}⁺) cover X (PerfectoidSpaces:P7/good-affinoid-perfectoid-basis). The idempotents ε_i ∈ A_i of the open and closed subsets X_{i,e_i} ∩ U_i cut out Zariski-closed affinoid perfectoids, and U ∩ X_e = lim_i (U ∩ φ_i⁻¹(X_{i,e_i})) is the Zariski-closed affinoid perfectoid cut out by the ideal generated by the 1 − ε_i (PerfectoidSpaces:P8/limit-of-zariski-closed-embeddings), with A → A_e surjective (strongly Zariski closed: PerfectoidQuotients:Q4/zariski-closed-subsets-are-strongly-zariski-closed). So colim A_{i,e_i} = image of colim A_i is dense in A_e, and |U ∩ X_e| = lim |U_i ∩ X_{i,e_i}|; glue over U (PerfectoidSpaces:P7/tilde-limit-gluing).
2. (ii) The quotients X_i/Δ exist with finite quotient maps (PerfectoidSpaces:P8/rigid-quotient-invariant-cover) and X/Δ is perfectoid with |X/Δ| = |X|/Δ (PerfectoidSpaces:P8/perfectoid-quotient-invariant-cover). The map |X|/Δ → lim_i |X_i|/Δ = lim_i |X_i/Δ| (PerfectoidSpaces:P8/invariant-spectrum-homeomorphism) is bijective because the fibres are finite orbits (a cofiltered limit of non-empty finite sets is non-empty) and open because every Δ-stable open of |X| is a union of preimages of Δ-stable opens of some |X_i|. On a Δ-stable good affinoid Spa(A, A⁺) the projector a ↦ |Δ|⁻¹Σ_δ δ·a maps colim A_i onto colim A_i^Δ, which is therefore dense in A^Δ.
3. (iii) Inversion transports the pinned continuous section of H → H/S to a section σ of H → S\H. The isomorphism X → Y × (S\H) is [(y,h)] ↦ (y·(hσ(Sh)⁻¹), Sh), with inverse (y,q) ↦ [(y,σ(q))]; hσ(Sh)⁻¹ belongs to S, so the formula respects the induction relation. Perfectoidness follows from PerfectoidSpaces:P6/product-with-profinite-set. The preimage of the copy Y_n·h ⊆ X_n is (Y ×^{S∩H_n} H_n)·h ≅ Y × ((S ∩ H_n)\H_n). For a good affinoid W = Spa(A,A⁺) pulled back from V ⊆ Y_n, W is S ∩ H_n-stable and the preimage of V·h has ring C⁰((S ∩ H_n)\H_n,A). Continuous sections are locally constant modulo every finite quotient on a sufficiently fine clopen partition; finite-level rings are dense in A. Together these facts give density of the corresponding finite-stage locally constant functions. Compactness gives |X| ≅ lim_n |X_n|; conclude by PerfectoidSpaces:P7/tilde-limit-gluing. The left-coset notation is essential when S is not normal.

**Acceptance instances.**

- For a single connected component (Π a point) (i) is the identity, and for Δ acting trivially (ii) is the identity.
- For the modular curve tower at tame level K^p and H = GL_2(ℤ_p), (iii) with Y the neutral-component tower and S its stabiliser recovers the full perfectoid modular curve from the neutral component when K^p = GL_2(Ẑ^p), where H acts transitively on π₀ through the determinant.

**Direct prerequisites.** `PerfectoidSpaces:P7/perfectoid-tilde-limit`, `PerfectoidSpaces:P7/good-affinoid-perfectoid`, `PerfectoidSpaces:P7/good-affinoid-perfectoid-basis`, `PerfectoidSpaces:P7/tilde-limit-gluing`, `PerfectoidSpaces:P8/limit-of-zariski-closed-embeddings`, `PerfectoidQuotients:Q4/zariski-closed-subsets-are-strongly-zariski-closed`, `PerfectoidSpaces:P8/rigid-quotient-invariant-cover`, `PerfectoidSpaces:P8/perfectoid-quotient-invariant-cover`, `PerfectoidSpaces:P8/invariant-spectrum-homeomorphism`, `PerfectoidSpaces:P6/product-with-profinite-set`.

**Sources.**

- [George Boxer, Vincent Pilloni, Higher Coleman theory](https://arxiv.org/abs/2110.10251v1), §4.4.1, Lemma 4.4.6, p. 64. Connected components of tilde-limits.
- [George Boxer, Vincent Pilloni, Higher Coleman theory](https://arxiv.org/abs/2110.10251v1), §4.4.1, Lemma 4.4.7 with proof, pp. 64–65. Finite quotients of tilde-limits.
- [George Boxer, Vincent Pilloni, Higher Coleman theory](https://arxiv.org/abs/2110.10251v1), §4.4.48, proof of Lemma 4.4.50, p. 84. The induction from neutral components, left as an exercise in the source.

### The abelian-type minimal-compactification period map

Target `PerfectoidShimuraVarieties:S6/abelian-minimal-period-map` (theorem).

Let (G, X) be of abelian type with auxiliary data (G₁, X₁), (B₁, X_{B₁}) (abelian-auxiliary-data), over C = ℂ_p (ℂ ≅ ℂ_p fixed). Then: (1) there is a perfectoid space S̄*(G)_{K^p} ~ lim_{K_p} S*(G)_{K̄^pK_p} (Boxer–Pilloni's image-type compactification, depending on the Siegel embedding of G₁, with finite maps S*_K → S*_{K̄} that are isomorphisms away from the boundary) and the perfectoid space S*(G)_{K^p} = lim_{K_p} S*^◇(G)_{K^pK_p} (genuine minimal compactifications, perfectoid by S4 preabelian-minimal-perfectoid since abelian type is pre-abelian); (2) there is a G(ℚ_p)-equivariant, prime-to-p Hecke-equivariant map π_HT: S*(G)_{K^p} → S̄*(G)_{K^p} → FL_{G,μ}; (3) S̄*(G)_{K^p} → FL_{G,μ} is affinoid: FL_{G,μ} is covered by affinoids whose preimages are good affinoid perfectoid; (4) the maps for B₁, G₁ and G form a commutative diagram over FL_{G,μ} = FL_{G₁} = FL_{B₁}, equivariant for B₁(𝔸_f), G₁(𝔸_f), G(𝔸_f). This is a period-map theorem for abelian-type data, proved by the Hodge cover, Lovering's B₁, Deligne's reconstruction and finite quotients by Δ; it is not the pre-abelian representability proof of S4, and for pre-abelian data that are not of abelian type no minimal period map is asserted.

**Hypotheses and conventions.**

- (G, X) of abelian type; over ℂ_p.
- Finite quotients of tilde-limits use a Δ-invariant cover by pregood affinoids, supplied by affineness of the period map for G₁ and triviality of the Δ-action on FL.

**Proof route.**

1. Hodge input: S3 hodge-compactified-period-maps (a), (b) for (G₁, X₁): perfectoid image-compactified and genuine towers, affinoid π_HT, A(G₁)-equivariance.
2. B₁: each neutral component of S̄*(B₁) is a finite quotient of a neutral component for G₁ (abelian-connected-towers-and-descent-group (2)); connected components of tilde-limits are tilde-limits (tilde-limit-components-and-quotients (i), Boxer–Pilloni Lemma 4.4.6), and finite quotients with an invariant pregood cover are perfectoid tilde-limits (tilde-limit-components-and-quotients (ii), Lemma 4.4.7); induce over the finitely many K_p-orbits on π₀ (S0 connected-component-tower; tilde-limit-components-and-quotients (iii), the induction of Lemma 4.4.50).
3. π_HT for B₁: (x, a) ↦ π_HT(x)·a on S̄^{*,0}(G₁) × 𝒜(B₁), with 𝒜(B₁) acting on FL on the right through B₁^ad(ℚ_p); it is invariant under (x, a)·h = (xh, h⁻¹a) for h ∈ 𝒜⁰(B₁) because π_HT is right 𝒜⁰(G₁)-equivariant (π_HT(xh)·h⁻¹a = π_HT(x)·a), so it descends to [S̄^{*,0}(G₁) × 𝒜(B₁)]/𝒜⁰(B₁), right 𝒜(B₁)-equivariantly (Lemma 4.4.51, whose left-action notation a·π_HT(x) is read in the right convention of S3 levi-torsor-over-flag-variety).
4. G: S̄^{*,0}(G) = S̄^{*,0}(B₁)/Δ with Δ acting trivially on FL; the B₁ period map is Δ-invariant and affinoid, so preimages of its affinoids give a Δ-stable pregood cover, the quotient is a perfectoid tilde-limit (tilde-limit-components-and-quotients (i), (ii)) and π_HT descends 𝒜⁰(G)-equivariantly, then induces to S̄*(G) (tilde-limit-components-and-quotients (iii); Proposition 4.4.53); compose with S*(G) → S̄*(G).

**Acceptance instances.**

- For G = Res_{F/ℚ}GL_2 (Hilbert, abelian type) it recovers on the open part the period map of the arithmetic Hilbert tower descended in PerfectoidShimuraVarieties:S5/hilbert-period-and-domain-compatibility (1).
- For Hodge-type data it is S3 hodge-compactified-period-maps (a), (b).

**Direct prerequisites.** `PerfectoidShimuraVarieties:S6/abelian-auxiliary-data`, `PerfectoidShimuraVarieties:S6/abelian-connected-towers-and-descent-group`, `PerfectoidShimuraVarieties:S6/torsor-fibre-product`, `PerfectoidShimuraVarieties:S6/tilde-limit-components-and-quotients`, `PerfectoidShimuraVarieties:S3/hodge-compactified-period-maps`, `PerfectoidShimuraVarieties:S4/preabelian-minimal-perfectoid`, `PerfectoidShimuraVarieties:S0/connected-component-tower`, `PerfectoidSpaces:P8/perfectoid-quotient-invariant-cover`, `PerfectoidSpaces:P8/affinoid-perfectoid-quotient`, `PerfectoidShimuraVarieties:S3/levi-torsor-over-flag-variety`.

**Sources.**

- [George Boxer, Vincent Pilloni, Higher Coleman theory](https://arxiv.org/abs/2110.10251v1), Theorem 4.4.45, Lemmas 4.4.50–4.4.52 and Proposition 4.4.53, pp. 82–85. Proposition 4.4.53.
- [George Boxer, Vincent Pilloni, Higher Coleman theory](https://arxiv.org/abs/2110.10251v1), §4.4.40, p. 78. Why the minimal period map is proved only for abelian type.

### The Levi torsor of an abelian-type datum from its Hodge cover

Target `PerfectoidShimuraVarieties:S6/abelian-torsor-descent` (theorem).

In the situation of abelian-auxiliary-data, for neat K ⊆ G(𝔸_f), K′ ⊆ B₁(𝔸_f) with f(K′) normal in K and Σ for G: over the neutral toroidal component S^{tor,0}(G)_{K,Σ}, the de Rham Levi torsor M_dR(G, X) is the quotient by Δ(K, K′) of M_dR(B₁) ×^{M^c_{μ_{B₁}}} M^c_{μ_G} over S^{tor,0}(B₁)_{K′,Σ} (after refining Σ so that S^{tor,0}(B₁)_{K′,Σ} → S^{tor,0}(G)_{K,Σ} is finite and generically finite étale with group Δ(K, K′)), and the same holds for M_HT on the towers; with the fibre-product description of torsor-fibre-product this expresses M_HT(G) through M_HT(G₁) and the torus T.

**Hypotheses and conventions.**

- Abelian type; the refinement of Σ is part of the statement (Boxer–Pilloni say 'possibly after refining Σ').
- The necessary triviality of boundary inertia on the pushed-out torsor is a separate supplier obligation; generic Galoisness alone is insufficient.

**Proof route.**

1. Push out M_dR(B₁) along M^c_{μ_{B₁}} → M^c_{μ_G} (functoriality of the de Rham torsor in data morphisms; AutomorphicBundles:B1/abelian-canonical-principal-bundle).
2. The finite toroidal map can ramify at boundary strata. Descent of a locally free torsor through its coarse finite quotient requires the logarithmic descent theorem and trivial action of boundary inertia on the pushed-out fibres; it cannot be justified by ordinary finite étale torsor descent on the interior. Import that precise boundary theorem from the recorded request to AutomorphicBundles B3.general / ShimuraCompactifications C3.general, then descend M_dR and use the logarithmic comparison for M_HT.

**Acceptance instances.**

- For G of Hodge type with B₁ → G an isomorphism on derived groups and Δ trivial, the statement is the identity of M_dR.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S6/torsor-fibre-product`, `PerfectoidShimuraVarieties:S6/abelian-connected-towers-and-descent-group`, `PerfectoidShimuraVarieties:S6/general-toroidal-period-map`, `AutomorphicBundles:B1/abelian-canonical-principal-bundle`.

**Sources.**

- [George Boxer, Vincent Pilloni, Higher Coleman theory](https://arxiv.org/abs/2110.10251v1), Theorem 4.4.43(5) and Remark 4.6.6, pp. 81, 89–90. The abelian/Hodge formulas for M_HT.

### Compatibility of the toroidal and minimal period maps for abelian type

Target `PerfectoidShimuraVarieties:S6/minimal-toroidal-period-map-compatibility` (theorem).

For (G, X) of abelian type over ℂ_p, the composite S^{tor◇}(G)_{K^p,Σ,∞} → S*(G)_{K^p} → FL_{G,μ} of the toroidal-to-minimal map with the minimal period map of abelian-minimal-period-map equals π^tor_HT of general-toroidal-period-map. Boxer–Pilloni assert this in Theorem 4.4.45 without proof (PerfectoidShimuraVarieties/E23).

**Hypotheses and conventions.**

- Abelian type; Σ fixed; the toroidal tower is only a diamond.

**Proof route.**

1. On the open subdiamond both maps are the Hodge–Tate period map of the relative Hodge–Tate filtration: for G₁ by S3 hodge-open-period-map, transported to B₁ and G through torsor-fibre-product and abelian-torsor-descent, compatibly with the descent group Δ.
2. Uniqueness: let Y := S^{tor◇}(G)_{K^p,Σ,∞}. Because FL is separated, the equaliser Z ⊆ Y of the two maps Y → FL^◇ is a closed subdiamond (pullback of the closed diagonal). |Z| is closed and contains |S^◇(G)_{K^p,∞}|, which is dense in |Y| = lim_{K′_p} |S^tor_{K^pK′_p,Σ}| (DiamondsAndVStacks:D4/underlying-topological-space): at each level the boundary is nowhere dense, and the projections from the open limit are surjective (the fibres of the finite étale levels are finite and non-empty). Hence |Z| = |Y|; a closed immersion of diamonds that is surjective on points is bijective on geometric points, hence an isomorphism (DiamondsAndVStacks:D4/isomorphism-criteria-for-v-sheaves-and-stacks), so Z = Y.

**Acceptance instances.**

- For Hodge-type data with perfect Σ it is the factorisation in S3 hodge-compactified-period-maps (c).

**Direct prerequisites.** `PerfectoidShimuraVarieties:S6/abelian-minimal-period-map`, `PerfectoidShimuraVarieties:S6/general-toroidal-period-map`, `PerfectoidShimuraVarieties:S6/abelian-torsor-descent`, `PerfectoidShimuraVarieties:S3/hodge-open-period-map`, `DiamondsAndVStacks:D4/isomorphism-criteria-for-v-sheaves-and-stacks`, `DiamondsAndVStacks:D4/underlying-topological-space`.

**Sources.**

- [George Boxer, Vincent Pilloni, Higher Coleman theory](https://arxiv.org/abs/2110.10251v1), Theorem 4.4.45, p. 82. The asserted compatibility (the sentence continues with 'tor of Theorem 4.4.40').

### Integral structure of the Levi torsor at hyperspecial-type level

Target `PerfectoidShimuraVarieties:S6/integral-levi-reduction` (theorem).

Assume G_{ℚ_p} quasi-split with a reductive model over 𝒪_F, M^c_μ ⊆ M^{c,an}_μ the corresponding quasi-compact open subgroup, and K_p ⊆ G(ℚ_p) ∩ G(𝒪_F). Then the étale M^{c,an}_μ-torsor M^{an}_dR over S^tor_{K^pK_p,Σ} (the canonical extension of the de Rham Levi torsor; general-toroidal-period-map) has a reduction to an étale M^c_μ-torsor M_dR (Boxer–Pilloni Proposition 4.6.3). Over the toroidal tower diamond, M_HT := M_dR ×^{μ,ℤ_p^×} ℤ_p(1) is the M^c_μ-reduction of M^{an}_HT = M^{an}_dR ×^{μ,ℤ_p^×} ℤ_p(1) given by integral trivialisations (the cyclotomic character through μ lands in M^c_μ since μ(ℤ_p^×) ⊆ M_μ(𝒪_F)). The twist by ℤ_p(1) exists only over the tower (ℤ_p(1) is pro-étale, not étale, over S^tor_{K^pK_p,Σ}), so the descent to finite level is performed on the untwisted M_dR.

**Hypotheses and conventions.**

- Abelian type (Boxer–Pilloni §4.5–4.6), quasi-split G_{ℚ_p}, F large enough to split G.
- The descent uses that the étale torsor M^{an}_dR is already defined at finite level, because pro-étale descent is not effective in general (Remark 4.6.5).
- The quotient used to descend the open reduction is by the effective deck group K_p/(Z_{K^p} ∩ K_p). Compatibility of the G^c-torsor with this kernel is the same requested logarithmic/effective-deck comparison as in kummer-to-v-bridge.

**Proof route.**

1. On a perfectoid S over the tower choose integral g_{S̃} ∈ G^c(S̃) (kummer-to-v-bridge); the cocycle p₂^*g_{S̃}·(p₁^*g_{S̃})⁻¹ lies in P^c_μ(S̃ ×_S S̃); its projection to M^c_μ defines a reduction M_HT ⊆ M^{an}_HT over the tower, functorial in S.
2. Untwist: M_dR := M_HT ×^{μ,ℤ_p^×} ℤ_p(−1) is an open subset of M^{an}_dR ×_{S^tor_{K^pK_p,Σ}} S^{tor◇}_{K^p,Σ,∞}.
3. Right multiplication by k ∈ K_p ⊆ G(𝒪_F) replaces g_{S̃} by g_{S̃}k and leaves the cocycle unchanged, so this open is K_p-invariant; since |M^{an}_dR| is the quotient of the pullback by K_p, it descends to an open M_dR ⊆ M^{an}_dR. The action map identifies M^c_μ × M_dR with M_dR × M_dR (checked after pullback), and M_dR → S^tor_{K^pK_p,Σ} is smooth and surjective on geometric points, so M_dR is an étale torsor.

**Acceptance instances.**

- The integral structure is not the one of invariant differentials on an integral model: in the Siegel case (ignoring the centre) M^{an}_dR is the torsor of trivialisations of ω_A, and a differential is integral for M_dR if it lies in the span of the image of the integral Tate module under the Hodge–Tate map (Boxer–Pilloni Remark 4.6.4); for GL_2 at level GL_2(ℤ_p) (ignoring the centre), M_dR is the torsor of generators of the 𝒪⁺-lattice of ω spanned by the Hodge–Tate image of T_pE.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S6/general-toroidal-period-map`, `PerfectoidShimuraVarieties:S6/kummer-to-v-bridge`.

**Sources.**

- [George Boxer, Vincent Pilloni, Higher Coleman theory](https://arxiv.org/abs/2110.10251v1), §4.6, Proposition 4.6.3 and Remark 4.6.5, pp. 88–89. The K_p-invariance that makes the integral reduction descend.
- [George Boxer, Vincent Pilloni, Higher Coleman theory (authors' revised manuscript)](https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf), §4.6.2, proof of Proposition 4.6.3, p. 91. The revised manuscript defines the twisted torsor over perfectoid test objects and untwists before descending.
- [George Boxer, Vincent Pilloni, Higher Coleman theory (authors' revised manuscript)](https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf), §4.6.2, Remark 4.6.4, pp. 90–91. The integral structure is the Hodge–Tate one.

### Reduction of the Levi torsor over Bruhat domains

Target `PerfectoidShimuraVarieties:S6/bruhat-levi-reduction` (theorem).

Assume G_{ℚ_p} quasi-split with P_μ containing a Borel B over ℚ_p, F/ℚ_p finite splitting G with μ over F, a reductive 𝒪_F-model, and K_p = K_{p,m′,b′} (the preimage of B modulo p^{m′} and of U modulo p^{b′}, m′ > 0, m′ ≥ b′ ≥ 0). For w ∈ ^MW let K_{p,w,M_μ} be the image of wK_pw⁻¹ ∩ P_μ in M_μ (it lies in the Iwahori of M_μ(𝒪_F) and has an Iwahori decomposition N × wT_{b′}w⁻¹ × N̄; Proposition 4.6.9), and for 0 ≤ m − n ≤ m′ − 1 let M¹_{μ,m,n} be the elements of M_μ reducing to U_{M_μ} modulo p^{m+ε} for all ε > 0 and to Ū_{M_μ} modulo pⁿ; K_{p,w,M_μ} normalises M¹_{μ,m,n} (Lemma 4.6.11). Then, if F is large enough that the composite Gal(F̄/F) →^{χ_cycl} ℤ_p^× →^{μ} M^{an}_μ factors through K_{p,w,M_μ}M¹_{μ,m,n}, the torsor M_dR has, over (π^tor_{HT,K_p})⁻¹(]C_{w,k}[_{m,n}K_p) ⊆ S^tor_{K^pK_p,Σ}, a reduction M_{dR,m,n,K_p} to an étale torsor under K^c_{p,w,M_μ}M^{1,c}_{μ,m,n} (Proposition 4.6.12 in the authors' revised form; arXiv v1 reduces M_HT); these reductions are compatible in (m, n, K_p) (Proposition 4.6.14); for m = n the pushout M_{dR,n,K_p} := M_{dR,n,n,K_p} ×^{K^c_{p,w,M_μ}M^{1,c}_{μ,n,n}} K^c_{p,w,M_μ}M^c_{μ,n} is a torsor under an affinoid group; and for Hodge-type data with perfect Σ, M_{dR,n,K_p} becomes trivial over Spa(R, R⁺) ×_{S^tor_{K^pK_p,Σ}} S^tor_{K^pK′_p,Σ} for some K′_p ⊆ K_p, a finite flat cover of any pregood affinoid Spa(R, R⁺) (Proposition 4.6.15 in the revised manuscript).

**Hypotheses and conventions.**

- Abelian type (the truncated period map π^tor_{HT,K_p} of Boxer–Pilloni §4.5 is stated for abelian type), quasi-split G_{ℚ_p}.
- The tubes ]C_{w,k}[_{m,n} = P\PwG¹_{m,n} of Bruhat cells and the normalisation Lemma 3.3.15 are Boxer–Pilloni §3.3 flag-variety dynamics, owned by no roadmap yet (gap); the cells C_w themselves are ShimuraData:D3/bruhat-integral.

**Proof route.**

1. ]C_{w,k}[_{m,n}K_p = (P^{an}_μ ∩ wK_pG¹_{m,n}w⁻¹)\wK_pG¹_{m,n}w⁻¹·w (Boxer–Pilloni Corollary 3.3.14, gap).
2. For perfectoid S over the preimage choose g_{S̃} ∈ wG¹_{m,n}K_p (kummer-to-v-bridge); the cocycle lies in P_μ ∩ wG¹_{m,n}K_pw⁻¹ and its image in M_μ lies in K_{p,w,M_μ}M¹_{μ,m,n} (Lemma 4.6.11 via Proposition 4.6.9's root-group decomposition): a reduction M_{HT,m,n,K_p} of M^{an}_HT over the preimage in the tower, which is K_p-invariant.
3. Before descending, twist by the cyclotomic character through μ, which factors through K_{p,w,M_μ}M¹_{μ,m,n} by the hypothesis on F: this gives a K_p-invariant reduction M_{dR,m,n,K_p} of M^{an}_dR over the tower (ℤ_p(1) is only pro-étale over the finite level, so the twisted M_{HT,m,n,K_p} itself does not descend).
4. Descend M_{dR,m,n,K_p} to (π^tor_{HT,K_p})⁻¹(]C_{w,k}[_{m,n}K_p) as in integral-levi-reduction, using that M^{an}_dR is étale at finite level (Remark 4.6.5).
5. Compatibility and pushout by construction; Proposition 4.6.15 by Elkik approximation of sections of the torsor at finite level.

**Acceptance instances.**

- For G = GL_2, w = 1 and K_p = Iwahori, K_{p,1,M_μ} = T(ℤ_p) and the reduction is the torsor of trivialisations of the canonical-subgroup filtration over the ordinary-type domain.
- Example 4.6.10: for G_{ℚ_p} = Res_{ℚ_{p²}/ℚ_p}GL_2 the projected group K_{p,1,M_μ} is the image of B(ℤ_p) in T(ℚ_{p²}) × GL_2(ℚ_{p²}), not a product Iwahori.

**Direct prerequisites.** `PerfectoidShimuraVarieties:S6/integral-levi-reduction`, `PerfectoidShimuraVarieties:S6/general-toroidal-period-map`, `ShimuraData:D3/bruhat-integral`, `ShimuraData:D3/kostant-representatives`, `ShimuraData:D3/schubert-families`.

**Sources.**

- [George Boxer, Vincent Pilloni, Higher Coleman theory (authors' revised manuscript)](https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf), §4.6, Proposition 4.6.12 and its proof, pp. 94–95. The cyclotomic containment hypothesis in the revised manuscript.
- [George Boxer, Vincent Pilloni, Higher Coleman theory](https://arxiv.org/abs/2110.10251v1), §4.6.8, Proposition 4.6.9 and Example 4.6.10, pp. 90–91. Example 4.6.10.

## Outstanding proof inputs

### Perfectoidization of integral algebras over perfectoid rings (Bhatt–Scholze, Prisms and prismatic cohomology, Theorem 1.17(1) = 10.11, with §8.2 and §§10.1–10.2)

Hansen–Johansson Lemma 5.10 (PerfectoidSpaces:P8/integral-extension-of-perfectoid-pair) uses the universal perfectoidization of an integral algebra over a perfectoid ring; through Lemma 5.9 (P8/finite-tower-over-perfectoid-tower) it enters Proposition 5.14 (genuine Hodge-type minimal tower), Propositions 5.18–5.19 and Theorem 5.20. No layer plans it: PerfectoidQuotients Q2/Q4 stop at semiperfectoid quotients and defer integral algebras to a separate late Q5 proposal (PerfectoidQuotients:Q4/completed-integral-closed-quotient), and the red-team finding RT-AREA-padic-1/1 asks for a late stage 'Perfectoidization of integral algebras and J-almost purity' (the pending design job DESIGN-PerfectoidQuotientsPartII). The PerfectoidSpaces P8 packet records the same gap; this packet cites P8's nodes and records the dependence here so that the S2 and S4 nodes are not mistaken for closed. The open Hodge-type tower and Scholze's image-compactified tower do not need it.

Consumers: `PerfectoidShimuraVarieties:S2/siegel-tame-level-removal`, `PerfectoidShimuraVarieties:S2/hodge-genuine-minimal-perfectoid-tower`, `PerfectoidShimuraVarieties:S2/hodge-good-tower-arbitrary-level`, `PerfectoidShimuraVarieties:S4/property-p-from-adjoint`, `PerfectoidShimuraVarieties:S4/hodge-adjoint-property-p`, `PerfectoidShimuraVarieties:S4/preabelian-minimal-perfectoid`, `PerfectoidShimuraVarieties:S6/abelian-minimal-period-map`.

### Boundary strata and finite étaleness in Scholze's Lemma 3.2.35 for general ε

Verified: the ε = 0 case (moduli argument with Lagrangian complements of the anticanonical subgroup, extended by Hartogs) and the g = 1 case (Heuer, Corollary 3.18 and the cusp charts). Not verified: Scholze's general-ε step, which uses an unreferenced description of the boundary strata of 𝒳*_{Γ(p^m)} → 𝒳*_{Γ1(p^m)} through lower-genus Siegel spaces and asserts finite étaleness 'as it is so generically'. It needs constancy of inertia along strata and density of the ordinary locus in each stratum; the strata description is requested from ShimuraCompactifications C5 (Faltings–Chai V; Pilloni–Stroh Appendix A at full level), the argument itself is open (PerfectoidShimuraVarieties/E9).

Consumers: `PerfectoidShimuraVarieties:S1/full-level-anticanonical-perfectoid`.

### Boxer–Pilloni §3.3 flag-variety dynamics: tubes ]C_{w,k}[_{m,n} = P\PwG¹_{m,n} of Bruhat cells and the normalisation Lemma 3.3.15

The reduction of the Levi torsor over Bruhat domains (Boxer–Pilloni Proposition 4.6.12, requested by OverconvergentAutomorphicForms O8) uses Corollary 3.3.14 (the tubes as orbits) and Lemma 3.3.15 (G_{m,0} normalises G¹_{m+k,k}) of Boxer–Pilloni §3.3. The local description of the Hecke correspondences on Bruhat domains (Proposition 4.6.19) uses the same reduction. ShimuraData D3 plans the integral Bruhat stratification and Schubert cells but not their p-adic tubes and the groups G¹_{m,n}; the natural owner is the higher Hida and Coleman theory roadmap (HigherHidaAndColemanTheory, routed from the Pilloni and Boxer–Pilloni extractions but not yet designed). The source proof of Lemma 4.6.20 also requires repair of the false separate-vanishing inference (E41); only cancellation of the opposite-root factors follows.

Consumers: `PerfectoidShimuraVarieties:S6/bruhat-levi-reduction`, `PerfectoidShimuraVarieties:S6/toroidal-hecke-correspondences`.

### Effective deck groups and the logarithmic-to-v torsor bridge

T6:comparison evaluates logarithmic period sheaves on log affinoid perfectoid objects. It does not by itself show that every perfectoid test over the toroidal tower has the required v-cover, or that the arithmetic central kernel annihilates the pushed-out G^c torsor. S0/tower-action-kernel and AutomorphicBundles B0 retain that kernel. Supply the exact comparison, central-kernel annihilation and effective descent before using a tautological frame over the entire tower.

Consumers: `PerfectoidShimuraVarieties:S6/kummer-to-v-bridge`, `PerfectoidShimuraVarieties:S6/general-toroidal-period-map`, `PerfectoidShimuraVarieties:S6/integral-levi-reduction`.

### Auxiliary reflex-torus datum and coefficient Levi fibre products

ShimuraData D4/central-isogeny-lift is narrower than Lovering’s B₁ construction. Supply the norm/cocharacter homomorphism from Res_{E/ℚ}G_m, the auxiliary Shimura datum and both maps, their reflex-field and functoriality properties, and the character-lattice proof that passing to G^c preserves the asserted Levi fibre product. The torsor fibre-product principle only proves (i), not these input identities.

Consumers: `PerfectoidShimuraVarieties:S6/abelian-auxiliary-data`, `PerfectoidShimuraVarieties:S6/torsor-fibre-product`, `PerfectoidShimuraVarieties:S6/abelian-connected-towers-and-descent-group`, `PerfectoidShimuraVarieties:S6/abelian-torsor-descent`.

### Torsor descent through ramified toroidal finite quotients

S6/abelian-torsor-descent uses a finite map which is Galois on the interior but can ramify at the boundary. Prove logarithmic/coarse quotient descent of the canonical pushed-out Levi torsor, including triviality of each boundary inertia action on its fibres, before asserting a locally free descended torsor. Neither finite Galoisness nor ordinary finite étale descent proves this boundary claim.

Consumers: `PerfectoidShimuraVarieties:S6/abelian-torsor-descent`.

### The p = 2 truncated-group integral Hodge–Tate estimate for modified formal models

Pilloni–Stroh Théorème 1.9 proves the bound for p ≥ 3. Remarque 1.10 reports the replacement bound 2 at p = 2 without a written proof. T5/modified-hodge-bundle and T5/modified-minimal-model retain this condition. S3’s threshold n₀ = 2g + 1 and congruence exponent n₀ − 2g are therefore conditional; this does not qualify S1’s independently established all-prime perfectoid representability.

Consumers: `PerfectoidShimuraVarieties:S3/hodge-tate-formal-models`.

## Supplier requests

- **ShimuraCompactifications:C5**: At level K^pΓ(pᵐ) over ℚ for the Siegel datum (K^p contained in a level-N subgroup, N ≥ 3 prime to p): the description of the boundary strata of the minimal compactification X*_{Γ(pᵐ)} and of the map X*_{Γ(pᵐ)} → X*_{Γ₁(pᵐ)} on them through lower-genus Siegel spaces (Faltings–Chai V.2; Pilloni–Stroh Théorème A.11), with the constancy of inertia along each stratum, as used in Scholze, torsion paper, Lemma 3.2.35. The integral minimal and toroidal compactifications at good level are cited from the existing nodes C5/integral-minimal-space, C5/minimal-hodge-ampleness, C5/integral-toroidal-space, C5/valuative-properness and C5/higher-level-toroidal-normalization. Consumers: `PerfectoidShimuraVarieties:S1/full-level-anticanonical-perfectoid`.
- **TorsionCohomologyInfrastructure:TC.0**: Scholze, torsion paper, §2.3: the perfectoid Hebbarkeitssatz (Proposition 2.3.2, Lemma 2.3.4), Corollary 2.3.5 under resolution of singularities, good triples (Definition 2.3.8) and Lemmas 2.3.9–2.3.11 with Corollary 2.3.12 (base good triples, finite normal covers étale away from the boundary, inverse limits, extension of the base field); and the Hartogs statements Proposition 3.2.9 and Lemma 3.2.10 for normal noetherian rings and for the Hasse blow-up (R ⊗̂ ℤ_p^cycl)⟨u⟩/(fu − p^ε). Consumers: `PerfectoidShimuraVarieties:S1/frobenius-trace-estimates`, `PerfectoidShimuraVarieties:S1/canonical-frobenius-lift`, `PerfectoidShimuraVarieties:S1/anticanonical-open-immersions`, `PerfectoidShimuraVarieties:S1/hartogs-for-finite-covers-of-anticanonical-tower`, `PerfectoidShimuraVarieties:S1/characteristic-p-base-triples-good`, `PerfectoidShimuraVarieties:S1/gamma1-level-perfectoid`, `PerfectoidShimuraVarieties:S1/full-level-anticanonical-perfectoid`.
- **ShimuraCompactifications:C3.general**: For a Hodge-type datum with a Siegel embedding (G, X) ↪ (G̃, X̃): for a cofinal set of admissible cone decompositions Σ there are Σ̃ and closed immersions S^tor_{K^pK_p,Σ} ↪ S̃^tor_{K̃^pK̃_p,Σ̃} for all small K_p, compatible with the level transition maps, the closed immersion of the open Shimura varieties and the maps to the minimal compactifications (Lan, Closed immersions of toroidal compactifications of Shimura varieties, Math. Res. Lett. 29 (2022), Theorem 2.2, as used in Boxer–Pilloni §4.4.25 of the revised manuscript). The existing node C3/level-datum-functoriality and C3.general/general-map-descent give the maps; the request is for the closed-immersion property. Consumers: `PerfectoidShimuraVarieties:S3/hodge-compactified-period-maps`.
- **ShimuraVarieties:V2**: Baily–Borel compactifications Sh*_Γ(G, X⁺) of connected Shimura varieties Γ\X⁺ for every arithmetic Γ ⊆ G(ℚ)_+ (also non-congruence and with torsion), over ℂ: normal projective, finite maps Sh*_{Γ₁} → Sh*_{Γ₂} for Γ₁ ⊆ Γ₂ of finite index, the identification Sh*_{Γ₁}/(Γ₂/Γ₁) ≅ Sh*_{Γ₂} for Γ₁ normal in Γ₂, and the finite maps for G → G^ad sending (G(ℚ)_+ ∩ K)\X⁺ to π(Γ)\X⁺ (Hansen–Johansson, §5.3, Propositions 5.18–5.19). Consumers: `PerfectoidShimuraVarieties:S4/property-p`, `PerfectoidShimuraVarieties:S4/property-p-from-adjoint`, `PerfectoidShimuraVarieties:S4/hodge-adjoint-property-p`.
- **ShimuraData:D4**: Connected Shimura data (G, X⁺) (Deligne's conditions on a semisimple G and a G^ad(ℝ)⁺-orbit) with the connected data (G^der, X⁺), (G^ad, X⁺) attached to a Shimura datum, and the pre-abelian notion for connected data: (G, X⁺) is of pre-abelian type if (G^ad, X⁺) ≅ (G̃^ad, X̃⁺) for a Hodge-type datum (Hansen–Johansson Definition 4.1, after Moonen 2.10), agreeing with D4/preabelian-type for full data. Consumers: `PerfectoidShimuraVarieties:S4/property-p`, `PerfectoidShimuraVarieties:S4/preabelian-minimal-perfectoid`.
- **ShimuraVarieties:V8**: For a closed embedding of Shimura data ι: (G, X) ↪ (G′, X′) and K = K′ ∩ G(𝔸_f): the extension Sh*_K(G, X) → Sh*_{K′}(G′, X′) ⊗ E of the canonical-model map to minimal compactifications is finite, and maps the boundary to the boundary and the interior to the interior (used without reference by Scholze §4.1 and Hansen–Johansson Proposition 5.14). Consumers: `PerfectoidShimuraVarieties:S2/hodge-type-embedding-and-siegel-comparison`.
- **HilbertModularVarietiesAndShimuraCurves:H1**: For Hilbert–Blumenthal abelian varieties with 𝔠-polarization: the 𝒪_F-linearised Weil pairing ẽ_n: A[pⁿ] × A^∨[pⁿ] → 𝔡⁻¹ ⊗ μ_{pⁿ} with e_{pⁿ} = Tr ∘ ẽ_n, and the choice of a generator β of 𝔠𝔡⁻¹(1) with its change-of-choice law (Birkbeck–Heuer–Williams Definitions 5.6–5.7). Consumers: `PerfectoidShimuraVarieties:S5/hilbert-weil-pairing`.
- **HilbertModularVarietiesAndShimuraCurves:H3**: The unit group Δ(N) = 𝒪_F^{×,+}/((1 + N𝒪_F)^×)² and the finite étale Δ(N)-torsor from the G*-variety (fixed polarization module) to the arithmetic G-variety, the maps attached to changing 𝔠 by isogenies (Birkbeck–Heuer–Williams Proposition 8.4 and Lemma 8.22). Consumers: `PerfectoidShimuraVarieties:S5/hilbert-three-towers`, `PerfectoidShimuraVarieties:S5/hilbert-polarization-torsors`, `PerfectoidShimuraVarieties:S5/hilbert-gl2-qp-action`.
- **HilbertModularVarietiesAndShimuraCurves:H4**: At finite p-level: the G*, intermediate (G-level with fixed G*-polarization) and arithmetic G Hilbert varieties at levels Γ*(pⁿ), Γ(pⁿ), Γ₀(pⁿ) with the maps β₁, β₂; the level-structure action through γ^∨ = det(γ)γ⁻¹ and the polarization action; the Weil-pairing components (𝒪_F/pⁿ)^× and U_n; the finite torsors under Γ̄₀(p^m, pⁿ), P̄Γ₀(p^m, pⁿ) = Γ̄₀/Z_n (Z_n = (1 + N𝒪_F)^×/(1 + pⁿN𝒪_F)^×), Ē(p^m, pⁿ), Δ(pⁿN) and, on identity components, Δ_n(N) (Birkbeck–Heuer–Williams Lemmas 8.5–8.19, with the corrected stabilisation argument for Δ_n(N) when p = 2). Consumers: `PerfectoidShimuraVarieties:S5/hilbert-three-towers`, `PerfectoidShimuraVarieties:S5/hilbert-mixed-span`, `PerfectoidShimuraVarieties:S5/hilbert-weil-pairing`, `PerfectoidShimuraVarieties:S5/hilbert-polarization-torsors`, `PerfectoidShimuraVarieties:S5/hilbert-level-torsors`.
- **HilbertModularVarietiesAndShimuraCurves:H5**: For F = ℚ: the identification of both Hilbert groups with GL₂ and of the Hilbert moduli and level structures (μ_N-structures on A, Γ(pⁿ)-structures on A^∨) with the modular-curve ones of the full-level modular curves, with the sign conventions of the Weil pairing matched. Consumers: `PerfectoidShimuraVarieties:S5/modular-tower-comparison`, `PerfectoidShimuraVarieties:S5/hilbert-f-equals-q-check`.
- **HodgeTateAndCanonicalSubgroups:T6:comparison**: Compare the pro-Kummer-étale canonical G^c local system with the effective toroidal p-level tower: prove that its actual arithmetic central kernel maps to 1 in G^c, that perfectoid tests over the tower admit v-covers by the requisite log affinoid perfectoid objects, and that the local P^c_μ-reductions descend to functorial analytic torsors on the v-site. Coordinate with AutomorphicBundles B0/ineffective-fibre-descent; do not assume the tower is a faithful K_p-torsor. Consumers: `PerfectoidShimuraVarieties:S6/kummer-to-v-bridge`, `PerfectoidShimuraVarieties:S6/general-toroidal-period-map`, `PerfectoidShimuraVarieties:S6/integral-levi-reduction`.
- **ShimuraData:D4**: For an abelian-type datum and a Hodge-type central derived cover, construct Lovering’s auxiliary B₁ = G₁ ×_{G₁^ab} Res_{E/ℚ}G_m with the specified reflex-norm map, Shimura cocharacter, maps to G₁ and G (through B), and common adjoint flag variety. Prove the compatibility of Z_s, G^c and the Levi fibre-product identity used in S6/torsor-fibre-product; a lift through a fixed central isogeny alone does not supply these statements. Consumers: `PerfectoidShimuraVarieties:S6/abelian-auxiliary-data`, `PerfectoidShimuraVarieties:S6/torsor-fibre-product`, `PerfectoidShimuraVarieties:S6/abelian-connected-towers-and-descent-group`, `PerfectoidShimuraVarieties:S6/abelian-torsor-descent`.
- **AutomorphicBundles:B3.general**: Prove descent of the pushed-out canonical de Rham/Levi torsor under the finite toroidal quotient in Boxer–Pilloni Theorem 4.4.43(5), arXiv v1 pp. 80–81, and Remark 4.6.6, pp. 89–90: identify boundary inertia on compatible toric charts, prove its action on the pushed-out fibres is trivial, and descend as an étale torsor; compare the logarithmic Hodge–Tate torsor. Coordinate the finite ramified quotient hypotheses with ShimuraCompactifications C3.general. Consumers: `PerfectoidShimuraVarieties:S6/abelian-torsor-descent`.
- **DiamondsAndVStacks:D6**: Provide the fully faithful perfectoid-space-to-diamond functor with the analytic base/untilt fixed, so a map between diamonds represented by perfectoid spaces over C lifts uniquely to an analytic morphism. The general analytic diamond-functor statement does not imply full faithfulness for all analytic adic spaces. For S3 also identify maps from a perfectoid space over C to the smooth analytic flag with maps to its diamond on perfectoid tests, using the flag’s actual analytic functor of points; full faithfulness between two perfectoid objects alone does not supply a nonperfectoid target. Consumers: `PerfectoidShimuraVarieties:S2/genuine-to-image-comparison`, `PerfectoidShimuraVarieties:S3/hodge-open-period-map`.
- **AlgebraicModuliForArithmeticGeometry:R09.1**: Provide the reflex-field representable homogeneous Hodge–Tate flag P_μ\G, the universal parabolic torsor, its Levi quotient U_P\G and associated-bundle universal properties, including analytification and the inversion/opposite-parabolic dictionary. Coordinate with AutomorphicBundles B0. This is the generic interface already requested by the accepted T2/open-tower suppliers; construct it upstream of T2, not in S3. Consumers: `PerfectoidShimuraVarieties:S3/levi-torsor-over-flag-variety`.

## Source versions and baseline

Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The 21 baseline declarations below are existing infrastructure. They do not supply perfectoid spaces, diamonds, Shimura canonical models or algebraic flag/torsor geometry.

- `mathlib:CategoryTheory.Functor`, `Mathlib/CategoryTheory/Functor/Basic.lean`: Functors between categories; the p-level tower is a functor from the poset of compact open subgroups of G(ℚ_p).
- `mathlib:CategoryTheory.IsCofiltered`, `Mathlib/CategoryTheory/Filtered/Basic.lean`: Cofiltered categories; the compact open subgroups of G(ℚ_p) under inclusion form a cofiltered poset, the index category of the towers.
- `mathlib:CategoryTheory.Limits.limit`, `Mathlib/CategoryTheory/Limits/HasLimits.lean`: The chosen limit of a functor under [HasLimit F]. This does not establish existence of limits in v-sheaves; DiamondsAndVStacks D5 supplies that existence.
- `mathlib:CongruenceSubgroup.Gamma`, `Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean`: The principal congruence subgroup Γ(N) of SL(2, ℤ), the kernel of reduction modulo N; compared with Γ(pᵐ) ⊆ GL_2(ℤ_p) in the g = 1 test.
- `mathlib:CongruenceSubgroup.Gamma0`, `Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean`: Γ₀(N) ⊆ SL(2, ℤ): lower-left entry ≡ 0 mod N.
- `mathlib:CongruenceSubgroup.Gamma1`, `Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean`: Γ₁(N) ⊆ SL(2, ℤ): a ≡ d ≡ 1 and c ≡ 0 mod N (Gamma1_mem), the same orientation as Scholze's Γ₁(pᵐ).
- `mathlib:IsDedekindDomain.FiniteAdeleRing`, `Mathlib/RingTheory/DedekindDomain/FiniteAdeleRing.lean`: The finite adele ring of a Dedekind domain as a restricted product of completions; G(𝔸_f) and its prime-to-p part are formed from it.
- `mathlib:Matrix.GeneralLinearGroup`, `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean`: GL n R as the units of the matrix ring; GSp_2g is defined as a subgroup of it.
- `mathlib:Matrix.J`, `Mathlib/LinearAlgebra/SymplecticGroup.lean`: The matrix J = fromBlocks 0 (−1) 1 0 of the standard symplectic form (the negative of Scholze's form).
- `mathlib:Matrix.det`, `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean`: The determinant; det(A + ZC) in the strict-Iwahori bound.
- `mathlib:Matrix.fromBlocks`, `Mathlib/Data/Matrix/Block.lean`: Block matrices (A B; C D); the graph-chart computation (1 Z)·(A B; C D).
- `mathlib:Matrix.symplecticGroup`, `Mathlib/LinearAlgebra/SymplecticGroup.lean`: The submonoid of matrices A with A J Aᵀ = J (similitude factor 1); GSp_2g with similitude 1 is this group.
- `mathlib:Module.Grassmannian`, `Mathlib/RingTheory/Grassmannian.lean`: The structure of submodules with finite projective quotient of constant rank k (rankAtStalk), extending Submodule. It supplies a module-valued carrier, not a Grassmannian scheme or the Lagrangian closed subscheme; those geometric constructions are imported from ShimuraData D5.
- `mathlib:MonoidHom.ker`, `Mathlib/Algebra/Group/Subgroup/Ker.lean`: The kernel of a group homomorphism as a subgroup; effective deck groups are quotients by the kernel of the action.
- `mathlib:MulAction.stabilizer`, `Mathlib/GroupTheory/GroupAction/Defs.lean`: The stabilizer subgroup of a point; the stabiliser of the neutral component.
- `mathlib:MulAction.toPermHom`, `Mathlib/Algebra/Group/Action/End.lean`: The permutation homomorphism for a left group action. For the packet’s right translation law T_(gh)=T_h∘T_g, use the opposite group before taking this homomorphism and its kernel.
- `mathlib:NumberField.RingOfIntegers`, `Mathlib/NumberTheory/NumberField/Basic.lean`: The ring of integers 𝒪_F of a number field, the coefficient ring of Hilbert–Blumenthal abelian varieties and of Res_{𝒪_F/ℤ}ℙ¹.
- `mathlib:PadicInt`, `Mathlib/NumberTheory/Padics/PadicIntegers.lean`: The p-adic integers ℤ_[p]; level groups are subgroups of GSp_2g(ℤ_p).
- `mathlib:Subgroup.topologicalClosure`, `Mathlib/Topology/Algebra/Group/Subgroup.lean`: The closure of a subgroup of a topological group as a subgroup; the kernel Z_{K^p} is the closure of the rational central elements.
- `mathlib:frobenius`, `Mathlib/Algebra/CharP/Lemmas.lean`: The ring homomorphism x ↦ x^p for a commutative semiring with ExpChar R p. It supplies scalar Frobenius, not geometric relative Frobenius or its twists; the latter are imported from the finite-level geometry supplier.
- `tauceti:TauCeti.exists_continuous_section`, `TauCeti/Topology/Algebra/Group/Profinite/Section.lean`: For a closed subgroup H of a compact totally disconnected topological group G, the quotient map G → G/H has a continuous section sending the identity coset to 1 (Ribes–Zalesskii, Proposition 2.2.2); used for ℤ_p^× ⊆ 𝒪_p^× to split the contracted product X ×^{ℤ_p^×} 𝒪_p^×.

The 21 baseline declarations were independently rechecked at their pins on 2026-10-10. The bibliography retains the exact source file versions and SHA256 hashes, with new independent read records on that date. Source locators refer to those versions; preprint and published numbering are distinguished. Assertions and proof routes are stated in the roadmap’s own words.

- **sch15**: [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf). Annals of Mathematics 182 (2015), no. 3, 945–1066, published version (doi:10.4007/annals.2015.182.3.3); printed page numbers 945–1066 and the published (arabic) numbering, e.g. Theorem 3.3.18 = arXiv Theorem III.3.18. SHA256 `ebac854f47381c19a987b43b59d2c05cad55c3186c4d8cde067a7be0d06cbd16`.
- **hj25**: [David Hansen, Christian Johansson, Perfectoid Shimura varieties and the Calegari–Emerton conjectures](https://arxiv.org/abs/2011.03951v2). arXiv:2011.03951v2, 29 August 2025 (paper dated 1 September 2025; the revised version, from which the Hodge–Tate period map for pre-abelian data was removed); printed page = PDF page. SHA256 `0054e56be6624b564e1d5a3058e1ef3bbfe5140ca9f06ca64bded18478419cd9`.
- **cs17**: [Ana Caraiani, Peter Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://arxiv.org/abs/1511.02418v1). arXiv:1511.02418v1, 8 November 2015 (published in Ann. of Math. 186 (2017), 649–766; preprint numbering used). SHA256 `aa93df3947e57ab78b070a82d638e70c25ae2ae15aeb60346575e74fdf85b349`.
- **bp21**: [George Boxer, Vincent Pilloni, Higher Coleman theory](https://arxiv.org/abs/2110.10251v1). arXiv:2110.10251v1, 19 October 2021. SHA256 `85526b90c48d0955f2a042f63d619a22584e3801391934504563994733d58596`.
- **bhw**: [Christopher Birkbeck, Ben Heuer, Chris Williams, Overconvergent Hilbert modular forms via perfectoid modular varieties](https://arxiv.org/abs/1902.03985v4). arXiv:1902.03985v4, 10 May 2021 (published in Ann. Inst. Fourier 73 (2023), no. 4, 1709–1794); printed page = PDF page of the arXiv version. SHA256 `8ee48970dc500f60a6409cca0e6d9feeb693071da00a8b37174776717b708dac`.
- **sw13**: [Peter Scholze, Jared Weinstein, Moduli of p-divisible groups](https://arxiv.org/abs/1211.6357v2). arXiv:1211.6357v2, 13 April 2013 (published in Camb. J. Math. 1 (2013), 145–237). SHA256 `984411ef6c3d735a713684d4c9251fbad411a40eab33cefed8ab5c8412b09f6d`.
- **ecd**: [Peter Scholze, Étale cohomology of diamonds](https://arxiv.org/abs/1709.07343v4). arXiv:1709.07343v4. SHA256 `78ca42bba46f1d43c894b0dbfdfb41105efab4959ba5ba6e32e1e5cf7ef33efc`.
- **milne**: [J. S. Milne, Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf). October 23, 2004; revised September 16, 2017 (numbering unchanged from the published version in Harmonic analysis, the trace formula, and Shimura varieties, Clay Math. Proc. 4, 2005). SHA256 `f637e61735ff9cf9730c43d978d8f05185685a37d5e1920fc3347061c83d7c7e`.
- **pan22**: [Lue Pan, On locally analytic vectors of the completed cohomology of modular curves II](https://arxiv.org/abs/2209.06366v1). arXiv:2209.06366v1, 14 September 2022 (published in Ann. of Math. 203 (2026), no. 1, 121–281; not obtained, preprint read). SHA256 `0873b61a758c57a9c5567f8e9ed7d905adcb7b359013a24e680facd1027b31b4`.
- **bcgp21**: [George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, Abelian surfaces over totally real fields are potentially modular](https://arxiv.org/abs/1812.09269v3). arXiv:1812.09269v3, 28 November 2021 (published in Publ. Math. IHÉS 134 (2021), 153–501; statement numbers agree). SHA256 `7c8d74b0628d8b9cc841a853372ca2d0bc18c086ab46d138f75afd15f35689ed`.
- **ps16**: [Vincent Pilloni, Benoît Stroh, Cohomologie cohérente et représentations Galoisiennes](https://www.imo.universite-paris-saclay.fr/~pilloni/koko.pdf). Author's version from V. Pilloni's homepage (published in Ann. Math. Québec 40 (2016), 167–202); PDF page numbers. SHA256 `2c9f90c39f0efacd3fa076ef189b1d552da900d1968e34c3c8b3e551dcb4e3a1`.
- **pil20**: [Vincent Pilloni, Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf). Author's version (113 pages, dated 17 June 2019) from V. Pilloni's homepage (published in Duke Math. J. 169 (2020), no. 9, 1647–1807). SHA256 `4c05724efeab1dbbb108f980ec9a722127d2a8cd2abf6e8c2a6a2251cf0f9f58`.
- **heuer20**: [Ben Heuer, Cusps and q-expansion principles for modular curves at infinite level](https://arxiv.org/abs/2002.02488v1). arXiv:2002.02488v1, 6 February 2020. SHA256 `3408139126f9692a2e6c19729e25b3db431e708936193be1c01c75ebabee30f1`.
- **bpa**: [George Boxer, Vincent Pilloni, Higher Coleman theory (authors' revised manuscript)](https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf). Authors' manuscript from V. Pilloni's homepage (180 pp., PDF dated 3 March 2025), the version cited by OverconvergentAutomorphicForms O8; differs from arXiv v1 by the cyclotomic twists in §4.4 and the renumbering of §4.4.12–4.4.30. SHA256 `d340c9a020cc5fdbca781a8630b6fae35e14607142bed700d6ab82334faa80ae`.
- **bp26**: [George Boxer, Vincent Pilloni, Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf). Authors' version from V. Pilloni's homepage (built 5 November 2025, 65 pages; published in Invent. Math. 244 (2026), 45–141); printed page = PDF page. SHA256 `af70d084612b1b75761694923ef2395752d23b41e0b8b458910d096df4c8c3c6`.

## Source-issue dispositions

REV-PerfectoidShimuraVarieties~2 independently checked all 42 inherited records and added E43. Of 43 records, 41 are confirmed and E7/E15 are rejected. Confirmation of a gap or an incorrect proof step does not mean its conclusion is false. Preprint and published dispositions are distinguished below; no source excerpts are retained.

- **PerfectoidShimuraVarieties/E1** (misprint, confirmed): §3.1, Definition 3.1.1 and the sentence after it, p. 971 (published version). Published Definition 3.1.1, p. 971, uses determinant. For genus two diag(1,1,−1,−1) has determinant 1 and multiplier −1, so the required cyclotomic pairing fibre needs c≡1.
- **PerfectoidShimuraVarieties/E2** (gap, confirmed): §3.3, the paragraph before Lemma 3.3.9 and Theorem 3.3.18(i), p. 1012, with Theorem 3.1.2(iii) and Theorem 4.1.1(i); inherited by Pilloni–Stroh Théorème 1.18(2)–(3), Lemme 1.20 and Théorème 1.22. Scholze’s paragraph before Lemma 3.3.9, p. 1008, invokes symplectic translates of the standard Lagrangian chart. That argument supplies the admissible Lagrangian coordinate charts, not every g-element coordinate subset claimed in Theorem 3.3.18(i). Confirmed as a proof gap, with no counterexample to the all-J conclusion.
- **PerfectoidShimuraVarieties/E3** (misprint, confirmed): §3.2.2, the sentence after Lemma 3.2.13, p. 984. Definition 3.2.12, pp. 983–984, gives the Hasse chart of a blow-up. A proper admissible blow-up would not restrict the generic fibre to a proper Hasse open.
- **PerfectoidShimuraVarieties/E4** (error, confirmed): §3.2.2, proof of Theorem 3.2.15, p. 986. The proof of Theorem 3.2.15, p. 986, assigns the common degree g(g+1)/2 to the two maps. Put n=g(g+1)/2. The base map has generic degree p^n, and the abelian-scheme map adds the canonical-isogeny degree p^g, giving p^{n+g}. The common printed degree is wrong; this calculation says nothing about integral flatness.
- **PerfectoidShimuraVarieties/E5** (misprint, confirmed): §3.2.2, Theorem 3.2.15(iii), p. 986. Theorem 3.2.15(iii), p. 986, describes a subgroup of A[p] as level p. Definition 3.2.7 and the proof index such a canonical subgroup by level one. This is a notation error.
- **PerfectoidShimuraVarieties/E6** (misprint, confirmed): §3.2.2, Theorem 3.2.15(ii), the left arrow of the square, p. 985. In the compactified cartesian square of Theorem 3.2.15(ii), p. 985, the left vertical map must be the generic fibre of the extended Frobenius map on 𝔛*. The unstarred formal base in its printed label is inconsistent with its source and target.
- **PerfectoidShimuraVarieties/E7** (misprint, rejected): §3.2.2, Theorem 3.2.15(i), p. 985. Rejected: Theorem 3.2.15(i) asserts uniqueness of the abelian-scheme diagram, including its isogeny and subgroup, not uniqueness of an arbitrary bare Frobenius lift. The proposed objection discards those data.
- **PerfectoidShimuraVarieties/E8** (gap, confirmed): §3.2.5, Lemma 3.2.31 as used in the proof of Lemma 3.2.30, pp. 999–1000. Lemma 3.2.31 as applied in Lemma 3.2.30, pp. 999–1000, needs the O⁺ restriction map. Arbitrary O-sections on a non-qc ordinary open need not be bounded. The proof only uses idempotents, so the bounded plus-ring version suffices.
- **PerfectoidShimuraVarieties/E9** (gap, confirmed): §3.2.5, proof of Lemma 3.2.35, pp. 1001–1002. Lemma 3.2.35, pp. 1001–1002, invokes boundary stratification and finite étaleness without supplying all the required stratum/inertia comparison. Generic étaleness does not imply that conclusion on the compactified boundary at each radius. The packet preserves that precise missing input.
- **PerfectoidShimuraVarieties/E10** (gap, confirmed): §3.1 p. 975, §3.2.2 p. 987 (proof of Theorem 3.2.15), §3.2.5 pp. 995–1001 (Proposition 3.2.33, Lemma 3.2.35). The boundary Hartogs steps on pp. 987,995–1001 require codimension at least two, which fails in genus one. Heuer Theorem 3.17 and Corollary 3.18 give a separate cusp-chart replacement without assuming the final full-tower theorem.
- **PerfectoidShimuraVarieties/E11** (gap, confirmed): §3.2.5, Theorem 3.2.36, p. 1002. Theorem 3.2.36, p. 1002, needs the p-adically completed colimit of the finite-level plus rings and finite-stage descent of the tilted finite étale covers. Those steps are not contained in a bare identification of the generic affinoid rings; the packet states them separately.
- **PerfectoidShimuraVarieties/E12** (error, confirmed): §4, first paragraph, p. 1016. The first paragraph of §4, p. 1016, infers compactness of the reductive centre and connectedness of G(ℝ) from hypotheses on its adjoint Cartan involution. GL₂ satisfies the latter conditions, but its determinant quotient is ℝˣ and is disconnected and noncompact. A compact-centre hypothesis or the appropriate modified setup is needed.
- **PerfectoidShimuraVarieties/E13** (gap, confirmed): §4.1, Theorem 4.1.1(i) and its proof, pp. 1019–1020. Theorem 4.1.1(i), pp. 1019–1020, needs the completed finite-level plus-ring comparison on its closed Hodge loci. P8/closed-loci-in-towers supplies that nontrivial step in this packet; equality of generic rings alone would not.
- **PerfectoidShimuraVarieties/E14** (misprint, confirmed): §4.1, proof of Theorem 4.1.1, the first displayed limit, p. 1020. In the first limit displayed in the proof of Theorem 4.1.1, p. 1020, the overgroups of K^p live in the ambient Siegel group G′(𝔸_f^p), rather than the Hodge group G(𝔸_f^p). The subsequent ambient-tower construction uses G′.
- **PerfectoidShimuraVarieties/E15** (gap, rejected): §1.3, Theorem 1.5, p. 4, against §5.3. Rejected: Corollary 5.21, p. 38, invokes strong Zariski closedness of the boundary, so the allegation that §5 only proves perfectoidness is false. It does not spell out every finite-level boundary pullback step; this packet supplies those separately using P8 and Q4. Canonical-model comparison remains a different obligation.
- **PerfectoidShimuraVarieties/E16** (error, confirmed): §5.3, Definition 5.17 against the proof of Proposition 5.18 and Theorem 5.20, pp. 36–38. HJ Definition 5.17, p. 36, intersects Γ in the adjoint rational group with a compact open in G(ℚ_p). It is ill-typed without an adjoint or pullback convention. The packet now distinguishes full reductive and connected semisimple data, using the adjoint reading only when G is adjoint.
- **PerfectoidShimuraVarieties/E17** (misprint, confirmed): §5.2, Proposition 5.14 and its proof, p. 34. HJ Proposition 5.14 and proof, p. 34, use finite-adelic K and prime-to-p finite-adelic K^p. Their printed local-field domains do not support those tower indices.
- **PerfectoidShimuraVarieties/E18** (misprint, confirmed): §5.3, Theorem 5.20, p. 38. HJ Theorem 5.20, p. 38, varies tame K^p in G(𝔸_f^p). The full finite-adeles domain printed there is inconsistent with the tame convention.
- **PerfectoidShimuraVarieties/E19** (misprint, confirmed): §5.3, proof of Proposition 5.19, the diagram and the sentence after it, p. 37. HJ Proposition 5.19, pp. 37–38, defines its arithmetic subgroups already in the adjoint group. Reapplying π to them is a notation error.
- **PerfectoidShimuraVarieties/E20** (error, confirmed): §4.4.8, the relative Hodge–Tate filtration and the identification of M_HT, p. 65; also §4.4.25–4.4.26, §4.4.38, Theorem 4.4.40, Propositions 4.4.29, 4.6.3 and 4.6.12 (arXiv v1). BP arXiv v1 §4.4.8, p. 65, and its subsequent torsor comparison omit the Tate line from the Hodge–Tate subspace and the central-cocharacter torsor twist. HigherColeman §4.4.23, p. 74, supplies the revised twist. A chosen underlying trivialization is distinct from a canonical equivariant identification.
- **PerfectoidShimuraVarieties/E21** (error, confirmed): §2.3, proof of Proposition 2.3.9, p. 21 (arXiv v1); published Annals 186 (2017), Proposition 2.3.9 and proof, pp. 673–674. CS Theorem 2.1.3 and Proposition 2.3.9, arXiv pp. 11–12,21 and published pp. 662–663,674, state an untwisted comparison. A Tate generator trivializes the underlying line only; cyclotomic equivariance requires the central μ-twist or a transported linearization.
- **PerfectoidShimuraVarieties/E22** (misprint, confirmed): §4.4, paragraph before Theorem 4.4.43, p. 80. The paragraph before BP Theorem 4.4.43, p. 80, repeats P_H₁ as the third factor. The datum fibre product H₁×_H₂ H₃ requires P_H₁×_P_H₂ P_H₃. Its ambient diagram determines the correction.
- **PerfectoidShimuraVarieties/E23** (gap, confirmed): §4.4, Theorem 4.4.45, last clause, p. 82. BP Theorem 4.4.45, last clause, p. 82, asserts compatibility of the minimal and toroidal period maps. Equality on the open tower alone needs a density and separatedness argument at infinite level; the packet’s S6 compatibility node supplies that argument explicitly.
- **PerfectoidShimuraVarieties/E24** (misprint, confirmed): §3.3, statement of Lemma 3.19, p. 13. BHW arXiv v4 Lemma 3.19, p. 13, puts the matrix γ where the frame section belongs. The proof has multiplication by s. Published Lemma 3.19, p. 1731, has corrected this; it is a version-scoped misprint.
- **PerfectoidShimuraVarieties/E25** (misprint, confirmed): §4.2.3, the sentence before (4.2.1), p. 38. Pan arXiv v1 §4.2.3, p. 38, places the Hodge quotient in the wrong graded degree. The sequence stated in §3.2 yields gr⁰D = ∧²D ⊗ ω⁻¹; gr¹ is the Hodge subline. This verdict is scoped to v1; the published article’s metadata is not evidence about its corrected text.
- **PerfectoidShimuraVarieties/E26** (error, confirmed): §8.4, proof of Lemma 8.20, p. 37 (arXiv v4); published Lemma 8.20, p. 1775. BHW Lemma 8.20, p. 37 (published p. 1775), uses an injection Δ_n(N)→Δ(N) not justified by these unit-square quotients. For ℚ(√5), N=4, p=7, the fundamental unit has orders 6 and 16 modulo 4 and 7; its eighth power gives the stated counterexample. Odd-p transition injectivity and bounded orders supply a different stabilization argument; p=2 retains a separate supplier obligation.
- **PerfectoidShimuraVarieties/E27** (error, confirmed): §8.5, proof of Lemma 8.28, p. 40. In the proof of BHW Lemma 8.28, p. 40, the period map on the mixed span must include the diagonal action diag(u,1). The antidiagonal ℤ_pˣ relation changes the flag, so projection to the first parameter fails to descend.
- **PerfectoidShimuraVarieties/E28** (error, confirmed): §8.2.2, after (8.3), p. 34, and §8.4.2, p. 39. BHW §8, pp. 32–41, changes the Weil pairing under polarization scaling. To descend it to arithmetic moduli its target must divide by the closure of positive units, rather than retain a fixed pairing generator.
- **PerfectoidShimuraVarieties/E29** (error, confirmed): §9, proof of Lemma 9.2, p. 41. BHW Lemma 9.2, p. 41, writes positivity for the p-adic unit group, which has no such ordered real notion. Definition 8.17 uses the closure of all global units congruent to one modulo N, and that is the ineffective central group required here.
- **PerfectoidShimuraVarieties/E30** (gap, confirmed): §2.2, proof of Proposition 2.6, p. 9. BHW Proposition 2.6, pp. 7–9, uses stronger interpolated radius bounds than the stated discrete canonical-subgroup estimates imply. The proof does not establish all endpoints. The packet requests that missing estimate rather than assert it.
- **PerfectoidShimuraVarieties/E31** (gap, confirmed): §3.1, proof of Proposition 3.8, pp. 10–11. BHW Proposition 3.8, pp. 10–11, treats Γ₀(p^∞) inside Γ₀(pⁿ) as a quotient group; this subgroup is not normal. The cusp chart uses a coset relation, with q-root action by the lower unipotent and the cusp width as in Heuer Proposition 3.19 and Theorem 3.22.
- **PerfectoidShimuraVarieties/E32** (gap, confirmed): §12.9.1, p. 81 (and Boxer–Calegari–Gee–Pilloni §6.2.1, arXiv pp. 144–145). Pilloni §12.9.1, author p. 81, and BCGP §6.2.1, pp. 144–145, need the asserted k=1 ample descent and section approximation. PS Théorème 1.22 proves a power of the modified determinant bundle and Remarque 1.23 asserts k=1 without its proof. Scholze pp. 1029–1030 give a level-dependent approximation. The stronger uniform formulation still needs the explicit supplier request.
- **PerfectoidShimuraVarieties/E33** (misprint, confirmed): §12.9.1, p. 81. Pilloni §12.9.1, author p. 81, cites Scholze p. 72 while its bibliography specifies the published Annals article. The construction is Theorem 4.3.1, proof pp. 1029–1030; p. 72 belongs to the preprint numbering.
- **PerfectoidShimuraVarieties/E34** (misprint, confirmed): §1.14, proof of Proposition 1.15, PDF p. 7 (author's version). In PS §1.14, proof of Proposition 1.15, p. 7, the map f has source the modified toroidal model. Its pushforward must be the structure sheaf of that source, not of the modified minimal target.
- **PerfectoidShimuraVarieties/E35** (misprint, confirmed): §2.1, first paragraph, p. 7. BHW tame μ_N rigidity must exclude N=3 for Γ₁-type structure. On y²=x³+1 the order-three automorphism fixes (0,1), an order-three point; thus Γ₁(3) has a nontrivial stabilizer. N≥4 avoids this example.
- **PerfectoidShimuraVarieties/E36** (gap, confirmed): §5.3, proof of Proposition 5.18, p. 24. BHW Proposition 5.18, pp. 23–25, uses an integral embedding decomposition. At a ramified prime 𝒪_p⊗𝒪_C need not be the product of its embedding factors; the different controls the lattice discrepancy. Only the generic splitting is automatic.
- **PerfectoidShimuraVarieties/E37** (error, confirmed): §5.3, proof of Proposition 5.18, connected case, p. 36. HJ Proposition 5.18, pp. 35–37, identifies a semisimple arithmetic tower with its adjoint tower. Finite local central elements not lifted from the rational centre obstruct equality/cofinality of the intersection subgroups; SU(2,1) at p≡1 mod12 supplies the stated witness. The packet uses a finite comparison instead.
- **PerfectoidShimuraVarieties/E38** (gap, confirmed): §3.3.2, proof of Corollary 3.3.12, p. 1009. Scholze Corollary 3.3.12, p. 1009, uses an anticanonical translate-cover identity without establishing it there. Finite-level transitivity on Lagrangian complements gives the interior cover; clopen anticanonical pieces and the absence of boundary interior give the compactified cover. This repairs the proof step, without making an infinite fixed-pairing fibre open.
- **PerfectoidShimuraVarieties/E39** (misprint, confirmed): §3.3.1, proof of Lemma 3.3.8, p. 1008. Scholze Lemma 3.3.8, p. 1008, uses a neighbourhood of rational flags. Lemma 3.3.6, pp. 1006–1007, identifies the rational-flag preimage with the closure of the ordinary locus. Replacing that closure by the ordinary locus would omit higher-rank specializations.
- **PerfectoidShimuraVarieties/E40** (misprint, confirmed): Proposition 3.20, proof, arXiv v1 p. 24; published Documenta Math. 27 (2022), p. 2419. Heuer arXiv v1 Proposition 3.20, p. 24, and published p. 2419 place b/d among units in the proof. γ=1 gives b/d=0. The proposition needs integrality, and the error remains in that published proof.
- **PerfectoidShimuraVarieties/E41** (error, confirmed): Lemma 4.6.20, last sentence of proof, arXiv v1 p. 96; authors’ March 2025 manuscript p. 99. BP Lemma 4.6.20, arXiv v1 p. 96, and HigherColeman p. 99 infer separate vanishing of opposite unipotent factors from their product relation. For t=w=1 and sufficiently small nontrivial u in both indicated root-group neighbourhoods, the two factors u and u⁻¹ satisfy it without vanishing. This refutes that step, not the Hecke lemma.
- **PerfectoidShimuraVarieties/E42** (misprint, confirmed): Proposition 2.3.9, first sentence of proof, arXiv v1 p. 21; published Annals 186 (2017), p. 674. CS Proposition 2.3.9, arXiv p. 21 and published p. 674, calls the Tate character determinant. For GSp₂g the polarization character is c, while determinant is c^g. The printed terminology is wrong beyond genus one.
- **PerfectoidShimuraVarieties/E43** (misprint, confirmed): Remark 5.29(a), p. 65, revised 2017 author PDF. Read and visually checked the arrow in Remark 5.29(a), p. 65; the double-coset forgetful map reverses its printed direction. The linked Jungin Lee errata independently records the same correction. The packet already indexes transition maps correctly.
