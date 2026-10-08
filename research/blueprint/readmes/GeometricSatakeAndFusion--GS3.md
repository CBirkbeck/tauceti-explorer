# Geometric Satake over the Fargues–Fontaine curve: fusion and the dual group

This part begins with the relative affine Grassmannian, its bounded ULA flat-perverse category, weight functors, convolution and dualizability supplied by the GS0–GS2 part. It constructs coherent fusion, applies relative Tannaka to that category, identifies the integral pinned dual group and its Weil action, and exports the normalized representation and perfect-complex functors. Through the degeneration to the Witt vector affine Grassmannian it also gives Zhu's rational geometric Satake equivalence, for the monoidal structure on H* transported from fusion and over an algebraic closure of F_p. It ends with the rational Frobenius-function comparison with the classical spherical transform.

The six stages in this part are planned at target level. Their prerequisite chains end in the pinned libraries, in exact nodes of another packet, in requested supplier stages, or in the gaps listed below. This is a complete planning pass; the stages remain open for the named refinements. Every declaration has implementation status unchecked. The suggested file is a naming and signature prototype, and it names the geometric conditions it leaves out.

The proof order is convolution closure and rigidity (FS VI.8), then fusion (VI.9), then reconstruction (VI.10). Generic reductivity and integral identification (VI.11) come next, and the Chevalley involution (VI.12) last. The classical comparison follows the geometric and classical constructions. EDC.7 is used on the rational branch, after early Grassmannian smoothness and ULA theory. This order prevents a cycle through GS0, Bun_G smoothness or the decomposition theorem itself.

This is revision round 2 (BP-GeometricSatakeAndFusion--GS3~2). The sections of every declaration below are generated from the packet as its independent review corrected it, so the document and the packet agree. The round adds Zhu's rational Witt category and his Theorem 0.3 as two nodes. It also corrects the characteristic-two rank-one step of FS VI.11.1, whose Lemma VI.11.2 fails at ℓ = 2 (source issue E8), by an invariant count in tensor powers of the standard representation.

## Conventions and boundaries

Let E be a nonarchimedean local field with residue field F_q of characteristic p, and let G/E be connected reductive. Integral constructions start with coefficient rings killed by an integer prime to p. They work prime by prime modulo ℓ^c and then pass to compatible ℓ-adic systems for ℓ≠p. Rational statements use Q_ℓ or an explicitly chosen extension L; the rational Witt category uses Q̄_ℓ. General coefficient extensions for enhanced kernels use a Z_ℓ[r]-algebra Λ with a chosen unit r satisfying r²=q. The Satake theorem itself excludes only ℓ=p. Restrictions on the dual fundamental group in parameter-stack generation are not hypotheses of this theorem.

A Satake object has bounded Schubert support, is universally locally acyclic over its leg base and is flat perverse. Flat means that derived tensor with every coefficient module stays perverse. This category over a ring is not casually replaced by an abelian category. The fibre of a Satake object is a finite projective coefficient module with a continuous Weil action. The foundational relative reconstruction keeps the whole category of these Weil representations as its base; it does not assume that this category is semisimple.

For a dominant tuple μ• put d(μ•)=Σ_i⟨2ρ,μ_i⟩ and ε(μ•)=d(μ•) mod 2. Geometric Frobenius on a finite-field sheaf stalk acts on L(1) by q^{-1}, so the chosen half twist acts by r^{-1}. The transported root-line character on the Weil representation side must be identified through the precise IV.7.3 convention. The packet records that adapter as a gap, because the source's parameter formula uses a positive power of r with |geometric Frobenius|=1. Contravariant stalk and parameter actions must not be identified without checking their direction.

Dominance on coweights uses nonnegative integer combinations of positive coroots. Zhu's notation section misprints this as roots (source issue E10).

The early GS0 owner includes Zhu's original perfect-space construction and explicit deperfections. Its bound and properness nodes are imported; this part constructs none of them again. Zhu's own proof of the rational equivalence builds a monoidal structure on H* from equivariant bimodules (his Proposition 2.20) and a commutativity constraint by the Gelfand trick (Proposition 2.21, Corollary 2.22). That proof is routed to Geometric Satake and Fusion, Part II: the rational Gelfand proof (DESIGN-GeometricSatakeAndFusionPartII). It does not replace the integral VI.9 fusion construction here. This part plans Zhu's Theorem 0.3 for the monoidal structure on H* transported from fusion. The comparison of the two monoidal structures is left to the Part II design, as the restructuring note below says. Root-data representation foundations are imported from upstream ReductiveGroups, from RG2.5 and from LP3; SR.4 owns the classical transform.

## Baseline and ownership

The baseline is Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 with Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. Actual source statements were read, rather than inferred from declaration names. The reviewed AUDIT-21 entries say that the geometric targets remain unbuilt; the abstract ordinary categorical ingredients are partial foundations.

Mathlib supplies monoidal, braided and symmetric categories, strong monoidal and braided functors, rigidity and adjunctions. It also supplies Hopf and bialgebra structures, root pairings, representations, projective modules, flatness and finite-dimensional module categories. These do not supply diamonds, ULA relative perversity or coherent enhanced convolution. Tau Ceti supplies affine group schemes over a commutative ring and reductive affine group schemes over a field. The latter does not define integral reductivity over Z_ℓ.

The existing Tannaka declarations require special care. `tensorAutFunctor` is defined for a given bialgebra over a commutative ring and its finitely generated comodules. `pointsFunctorIsoTensorAutFunctor` and `reconstructedPoint` are the known-Hopf reconstruction comparison over a field. They neither produce a coordinate Hopf algebra from an arbitrary symmetric category nor establish the relative integral Satake criterion. The four exact MC.6 relative nodes supply that abstract theorem, and its neutral reconstruction node supplies the rational Witt case. This part only verifies the Satake hypotheses and applies them. MC.6's finiteness and connectedness recognition nodes supply the DM criteria in characteristic zero. The upstream reductive-group theorem supplies characteristic-zero reductivity.

The early nodes used here are exact nodes of the GS0 packet: the loop/local-Hecke and Schubert-bound nodes, relative perversity and ULA, the integral-family and one-leg comparisons, and hyperbolic localization. So are the Satake category and fibre functor, the convolution diagram, closure and dualizability, rational weight concentration and the Mirković–Vilonen intersections. The RF2 divisor product equation and degree-one divisor moduli are exact node imports. No request for an entire early stage replaces a finer matching node.

## GS3: fusion and finite-set coherence

A partition b:I→K has a blockwise disjoint open U_b: divisors from different blocks are distinct, but divisors in the same block may collide. Its completion rings split over blocks, hence so do the local Grassmannians and Hecke stacks. This is the correct factorization open for iterated fusion, rather than the smaller open on which every leg is distinct.

Restriction from the global Satake category to U_b is fully faithful. The complement has a filtration by smooth partial diagonals of positive codimension. The locally constant purity calculation starts in degree two. Conservatively detecting and t-exact constant terms transport that estimate to the relative perverse category, and the open–closed triangle gives A≅pH⁰Rj_*j*A. This proves extension uniqueness. Existence of a Satake extension is proved separately by the proper chain-of-modifications construction; it does not follow from full faithfulness alone.

The chain E_0→⋯→E_k with projections p_a and composition m gives Rm_*(⊗_a p_a*A_a). On U_b it is the exterior product. The ULA correspondence criterion gives local acyclicity, and the constant-term calculation gives a locally constant perfect total fibre whose degree-zero finite-projective property can be checked on the dense disjoint open. This establishes flat perversity. These steps use the early closure and duality theorem, including the independent VI.8 two-leg degeneration proof. They do not use characteristic-zero decomposition.

Parity is constant on closure relations: dominance differences are sums of coroots and ⟨2ρ,α∨⟩=2. The even and odd loci are therefore clopen. The geometric commutativity is multiplied on two homogeneous summands by (-1)^{ε(A)ε(B)}. The total cohomology before this correction sees the graded Koszul flip; after correction it sees the ordinary flip on ungraded finite projective modules. The resulting dual group is an ordinary group, with no accidental super convention.

For α:I→J, the diagonal Δ_α repeats each j-th divisor on its inverse-image block. Pull back along the base change of the Grassmannian to (Div¹)^J and push forward along its closed immersion into Gr^J_G; this merges the modifications within each block and inserts the unit at empty fibres. The resulting functors have identity and composition comparisons and all their coherent relations. Associativity and permutation equations are checked where divisors are distinct and extend uniquely by full faithfulness. Closed immersions used in these correspondences are the Grassmannian immersions identified in the source footnote; quotient Hecke stacks are not substituted without justification. The operadic/coCartesian packaging is imported from EnhancedDerivedSheaves, and the geometric family is constructed here.

IV.7.3 applies to locally constant perfect complexes. Its degree-zero finite-projective specialization identifies local systems on (Div¹)^I with continuous W_E^I representations. It is not an equivalence of all étale complexes and does not assert a general product theorem for fundamental groups. The fibre functor's split-exact behaviour is inherited from the early VI.7.10 node. Shifted constant terms CT_P[deg_P] are symmetric monoidal for corrected fusion, commute with this fibre and are transitive with additive shifts. Their finite-set coherences are again checked on the disjoint locus. Verdier duality and reversal retain their evaluation and coevaluation data; the internal dual is sw*D.

The declarations below give the exact statements, dependencies, source route, API and tests of this layer.

### Disjoint-leg locus

**Declaration:** `GeometricSatakeAndFusion:GS3:fusion/disjoint-leg-locus` (definition). Atlas planet: Disjoint-leg factorization.

For a finite set I partitioned by b:I→K, define U_b ⊂ (Div¹_X)^I by x_i ≠ x_j whenever b(i) ≠ b(j). It allows coincidences inside one block. Pull the existing local Hecke stack and Satake category back to U_b; denote restriction by j_b*. On U_b, completion along the union of block divisors is the product of the block completions, giving the factorization of Grassmannians and local Hecke stacks.

**Proof route.** Use the divisor product equation and invertibility of distinct divisor ideals to split the completed rings, then the loop quotient and torsor descriptions. An ordered partition gives the same open independently of its ordering; this construction commutes with base change.

**Direct prerequisites.** `RelativeFarguesFontaine:RF2:integral-divisors/product-equation-and-affineness`, `RelativeFarguesFontaine:RF2:untilts/div1-moduli-and-properness`, `GeometricSatakeAndFusion:GS0:loop-geometry/loop-groups-and-local-hecke`.

**Source match.** FS, VI.9 pp226–227; VI.0 p189: Exact defining condition of the blockwise disjoint locus and factorization.

**Uses.** FS VI.9.3–9.4: The exterior product is first defined on this precise open, and convolution supplies its extension. HeckeStacksAndLocalShtukas:HS4: Blockwise factorization must remain valid during repeated collisions within blocks.

**API.**

- `disjointLegLocus` (constructor): For b:I→K and X=Div¹_X, U_b is the subfunctor of X^I satisfying the cross-block inequality.
- `disjointLegLocus_mem` (characterisation): A geometric tuple x lies in U_b iff b(i)≠b(j) implies x_i≠x_j for all i,j.
- `disjointLegLocus_reindex` (functoriality): A bijection of leg sets carries U_b to U_{b∘e}, compatibly with identity and composition.
- `disjointLegLocus_baseChange` (compatibility): Pullback of U_b under S→(Div¹_X)^I is precisely the same cross-block condition on S.

**Unit tests.**

- `test_disjoint_oneBlock` (degenerate): A constant block map gives U_b=X^I.
- `test_disjoint_twoSingletons` (computation): For two singleton blocks, U_b={(x,y):x≠y}.
- `test_disjoint_internalCollision` (non-example): For blocks {1,2} and {3}, (x,x,y) with x≠y lies in U_b; the full pairwise-disjoint locus would reject it.

**Acceptance.** One block gives the whole leg base. Singleton blocks exclude every collision, while a two-element block allows its internal diagonal.

### Restriction across collision diagonals

**Declaration:** `GeometricSatakeAndFusion:GS3:fusion/disjoint-leg-factorization-and-full-faithfulness` (theorem). Atlas planet: Collision extension uniqueness.

For the blockwise disjoint inclusion j_b, restriction j_b*:Sat^I_G(Λ)→Sat_G(U_b,Λ) is fully faithful, and so is restriction of finite projective local systems on the leg base. Every Satake object satisfies A ≅ pH⁰(Rj_b*j_b*A). This is uniqueness and reconstruction for objects already extending; full faithfulness alone asserts no essential surjectivity.

**Proof route.** Filter the complement by smooth partial diagonals of positive ℓ-codimension. Purity makes their i*i! on locally constant perfect complexes lie in degrees ≥2. The conservatively detecting, t-exact constant-term functors reduce the required perverse bound to that local-system bound. Apply the open–closed triangle and perverse truncation to obtain the reconstruction and Hom isomorphisms.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS3:fusion/disjoint-leg-locus`, `GeometricSatakeAndFusion:GS1/relative-perverse-t-structure`, `GeometricSatakeAndFusion:GS1/semi-infinite-orbits-and-hyperbolic-localization`, `GeometricSatakeAndFusion:GS2:correspondences/satake-category-and-fibre-functor`, `VStackSheavesAndLisseCategories:VS1`.

**Source match.** FS, Proposition VI.9.3 pp227–228: Proves the two full-faithfulness assertions by partial diagonal bounds; reconstruction follows in the proof.

**Acceptance.** For two legs the diagonal has codimension one and contributes starting in degree two. A codimension-zero closed component would invalidate the argument; arbitrary restrictions of arbitrary categories are not fully faithful.

### Satake support parity

**Declaration:** `GeometricSatakeAndFusion:GS3:fusion/support-parity` (definition). Atlas planet: Satake parity.

The parity of a Schubert tuple μ• is ε(μ•)=Σ_i⟨2ρ,μ_i⟩ mod 2 in Z/2. Differences along dominance are sums of coroots, whose pairing with 2ρ is even, so parity is constant on a connected-component stratum and defines an open-and-closed even/odd decomposition of the local Hecke stack. For mixed-parity objects use their canonical summands. The correction scalar for homogeneous A,B is (-1)^{ε(A)ε(B)}.

**Proof route.** Use ⟨2ρ,α∨⟩=2 for each simple coroot and dominance differences to prove constancy on closure relations. Disjoint unions add dimensions and hence add parity. Apply the sign separately to the four pairs of canonical summands.

**Direct prerequisites.** `ReductiveGroupsPartII:RG2.5`, `GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness`, `mathlib:RootPairing`.

**Source match.** FS, VI.9 pp228–229: The parity decomposition and exact commutativity correction.

**Uses.** FS VI.9.4: Cancels the Koszul sign seen by total cohomology so that the fibre functor has the ordinary symmetric target. Classical comparison: The same component parity corrects the alternating Frobenius trace of a perverse shift.

**API.**

- `supportParity` (data): The degree sum reduced modulo two, equivalently the dimension parity on each component.
- `supportParity_dominance` (characterisation): Comparable dominant Schubert tuples have equal parity.
- `supportParity_union` (compatibility): Parity on a disjoint union is the sum of the two parities in Z/2.
- `fusionSign` (data): For e,f∈Z/2, the correction is (-1)^{ef}; it is a bicharacter.

**Unit tests.**

- `test_parity_unit` (degenerate): The zero-cocharacter unit has parity zero.
- `test_sign_oddOdd` (computation): The correction on two odd summands is -1.
- `test_sign_evenOdd` (computation): The correction on an even and an odd summand is +1; reducing coefficient rings modulo two makes both signs equal.

**Acceptance.** An odd-dimensional minuscule Schubert object is odd even when its ungraded fibre has even rank. Parity is additive; an odd/odd swap has scalar -1.

### Fusion product and ordinary symmetry

**Declaration:** `GeometricSatakeAndFusion:GS3:fusion/fusion-product-and-sign-rule` (construction). Atlas planet: Fusion product.

For blocks I=⊔_a I_a and A_a∈Sat^{I_a}_G(Λ), use the chain of modifications E_0→⋯→E_k, projections p_a to the a-th modification and composition m. Define the fusion object *_{a}A_a=Rm_*(⊗_a p_a*A_a). The construction is ULA, bounded and flat perverse and restricts to ⊠_a A_a on U_b. It is independent of the order by full faithfulness. Pull back along the duplicated-leg diagonal to obtain the tensor product on Sat^I. Modify its geometric commutativity by (-1)^{ε(A)ε(B)}. This gives a symmetric monoidal structure refining the existing convolution, with total cohomology F^I strong symmetric monoidal into ordinary, ungraded finite projective Weil representations.

**Proof route.** Construct the proper chain-composition correspondence, whose restriction to disjoint blocks is an isomorphism. ULA stability comes from the IV.2 correspondence criterion. Apply constant terms: their total pushforward is locally constant perfect and agrees on the disjoint locus with the degree-zero finite-projective exterior product. Density and VI.7.7 imply flat perversity. Use VI.9.3 for uniqueness of associativity, commutativity and unit comparisons; all relations hold after disjoint restriction. Total cohomology carries the geometric flip to the graded Koszul flip. The component correction cancels that sign and preserves hexagon, involution and unit laws.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS3:fusion/disjoint-leg-factorization-and-full-faithfulness`, `GeometricSatakeAndFusion:GS3:fusion/support-parity`, `GeometricSatakeAndFusion:GS2:correspondences/convolution-diagram`, `GeometricSatakeAndFusion:GS2:Satake-closure/convolution-preserves-satake-and-dualizability`, `VStackSheavesAndLisseCategories:VS1/ula-dualizability-criterion`, `GeometricSatakeAndFusion:GS2:correspondences/satake-category-and-fibre-functor`, `mathlib:CategoryTheory.SymmetricCategory`, `mathlib:CategoryTheory.Functor.Braided`.

**Source match.** FS, Definition/Proposition VI.9.4 pp228–230: Actual extension via convolution, flat-perverse proof and coherent sign-corrected tensor structure.

**Uses.** FS VI.10.1–10.3: Tensor compatibility and the product of bounded left-adjoint generators construct the multi-leg Hopf algebra. ExcursionOperatorsAndSpectralAction: Coherent multi-leg tensor symmetry supplies representations with colliding labels, without semisimplicity.

**API.**

- `fusionProduct` (constructor): The proper chain-composition pushforward for a finite ordered partition.
- `fusionProduct_restrict` (compatibility): Its restriction to U_b is canonically the exterior tensor product.
- `fusionTensor` (structure): Duplicate legs and diagonal pullback give the internal tensor, canonically isomorphic to convolution.
- `fusionBraiding` (structure): Geometric block permutation multiplied on homogeneous summands by (-1)^{ε(A)ε(B)}.
- `fibreFusionIso` (compatibility): F(A*B) ≅ F(A)⊗F(B), respecting the ordinary symmetry, unit and associativity constraints.

**Unit tests.**

- `test_fusion_unit` (degenerate): Fusion with the unit is isomorphic to the original object.
- `test_fusion_disjoint` (compatibility): On two distinct divisors fusion is the exterior product, with no additional extension summand supported on the diagonal.
- `test_fusion_oddSymmetry` (non-example): For two odd objects F sends corrected braiding to the ordinary flip; the uncorrected braiding gives its negative when 2 is invertible.

**Acceptance.** For one block recover A itself, and tensor with the zero-modification unit is the original object. Odd/odd braiding is the negative of the geometric flip; after F it is the ordinary flip. The construction uses neither rational decomposition nor rational reductivity.

### CoCartesian finite-set functoriality

**Declaration:** `GeometricSatakeAndFusion:GS3:fusion/finite-set-functoriality-and-constant-terms` (construction). Atlas planet: Finite-set fusion.

For a map α:I→J, let Δ_α:(Div¹)^J→(Div¹)^I repeat the j-th divisor on its inverse-image block. Pull back along Gr^I_G ×_(Div¹)^I (Div¹)^J → Gr^I_G and push forward along the natural closed immersion Gr^I_G ×_(Div¹)^I (Div¹)^J ↪ Gr^J_G. Descending the required loop equivariance defines α_!:Sat^I→Sat^J; the closed immersion is on Grassmannians, not on quotient Hecke stacks. This merges each fibre of α and inserts unit modifications at empty fibres. For permutations it relabels legs, and for disjoint unions it respects exterior fusion. Canonical identity and composition comparisons satisfy the finite-set coherence relations. Together with exterior fusion they give the coCartesian family of symmetric monoidal Satake categories over finite sets.

**Proof route.** Use the diagonal base-change square and its closed Grassmannian immersion to define pull-push, check loop equivariance and descend to the Satake categories. Directly check compositional base change; do not replace this diagram by a closed immersion of quotient Hecke stacks. Compare composite collision orders on the locus of distinct relevant divisors and use VI.9.3 to extend the comparison uniquely. Every coherence diagram reduces to the same disjoint-locus permutation/composition identity; include empty fibres with the unit. Use the imported operadic language to package these comparisons.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS3:fusion/fusion-product-and-sign-rule`, `GeometricSatakeAndFusion:GS3:fusion/disjoint-leg-factorization-and-full-faithfulness`, `RelativeFarguesFontaine:RF2:integral-divisors/product-equation-and-affineness`, `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`, `GeometricSatakeAndFusion:GS0:loop-geometry/loop-groups-and-local-hecke`.

**Source match.** FS, VI.9 pp226–227, including the footnote p227; Proposition VI.9.4 pp228–229: The diagonal pull-push defines arbitrary finite-set maps; the exterior fusion comparison and its symmetry/coherence follow from VI.9.3–VI.9.4.

**Uses.** ExcursionOperatorsAndSpectralAction:ES6–ES7: Excursions use arbitrary label maps, their compositions and unit insertions. HeckeStacksAndLocalShtukas:HS4: Repeated collisions and disjoint unions require coherent families of comparison maps.

**API.**

- `collisionFunctor` (functoriality): The functor α_! associated to any map α:I→J, including empty fibres.
- `collisionFunctor_id` (simp): The identity-map functor is canonically isomorphic to identity.
- `collisionFunctor_comp` (functoriality): (β∘α)_! ≅ α_! followed by β_!, with coherent associativity.
- `collisionFunctor_comp_assoc` (compatibility): For I→J→K→L, the two composition comparisons from the composite functor to the iterated functors agree after the functor associator; retain the full enhanced finite-set coherence.
- `collisionFunctor_union` (compatibility): Disjoint union of maps commutes with exterior fusion, including its corrected permutations.
- `collisionFunctor_unitInsertion` (constructor): An unused target leg is assigned the zero-modification tensor unit.

**Unit tests.**

- `test_collision_threeLegs` (characterisation): The two orders merging three legs to one give the canonical associativity comparison, whose pentagon commutes.
- `test_collision_permutation` (computation): A transposition followed by itself gives the identity relabeling functor and comparison.
- `test_collision_emptyFibre` (degenerate): The map ∅→{1} sends the coefficient unit to the zero-modification object, rather than zero.

**Acceptance.** Three legs colliding successively agree with their single simultaneous collision. Permutation inverse/identity comparisons are inverse, and inserting then forgetting a unit leg is identity.

### Weil realization of total cohomology

**Declaration:** `GeometricSatakeAndFusion:GS3:fusion/drinfeld-fibre-realization` (theorem).

For every finite I, finite projective local systems on (Div¹_X)^I are equivalent to continuous finite projective Λ-representations of W_E^I. Under this equivalence F^I is total cohomology on the Grassmannian over its leg base. It is faithful and conservative and has the inherited split-exact behaviour of VI.7.10, is symmetric monoidal for corrected fusion, and has the collision/permutation coherences. The Drinfeld statement is for locally constant perfect complexes, not all étale complexes or an assertion that fundamental groups commute with products.

**Proof route.** Import IV.7.3 in its DLc form. Restrict to finite-projective local systems in degree zero to obtain VI.9.2. Apply VI.7.10 to the total cohomology functor and VI.9.4 to tensor comparison; cohomological grading is forgotten only after its parity sign is accounted for.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS2:correspondences/satake-category-and-fibre-functor`, `GeometricSatakeAndFusion:GS3:fusion/fusion-product-and-sign-rule`, `GeometricSatakeAndFusion:GS3:fusion/finite-set-functoriality-and-constant-terms`, `VStackSheavesAndLisseCategories:VS1`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`, `RelativeFarguesFontaine:RF2:untilts/div1-moduli-and-properness`, `mathlib:Representation`, `mathlib:Module.Projective`.

**Source match.** FS, Proposition VI.9.2 p226; Theorem IV.7.3 pp165–166 (full faithfulness begins p164): Combines the exact DLc Drinfeld equivalence with the finite-projective degree-zero specialization.

**Acceptance.** For I=∅ the target is finite projective Λ-modules. For singleton I the action is the local Weil action, and for multiple legs the source is W_E^I, not its diagonal copy.

### Symmetric constant terms

**Declaration:** `GeometricSatakeAndFusion:GS3:fusion/symmetric-constant-term` (theorem). Atlas planet: Symmetric constant terms.

For a parabolic P with Levi M, CT_P[deg_P]:Sat^I_G(Λ)→Sat^I_M(Λ) is symmetric monoidal for corrected fusion, commutes with F^I, and is transitive for nested parabolics with the sum of the degree shifts. It respects arbitrary finite-set collision functors, disjoint unions and permutations, with identity, composition and transitivity coherences. The degree is componentwise ⟨2ρ_G−2ρ_M,μ⟩; omission of it changes the weight degrees.

**Proof route.** Use VI.7.13 for landing, degrees and transitivity. Off the collision diagonals the assertion is Künneth and blockwise hyperbolic localization. Use full faithfulness to extend the comparisons and all their equations. Cohomology-degree parity ensures the modified symmetry matches on G and M.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS1/semi-infinite-orbits-and-hyperbolic-localization`, `GeometricSatakeAndFusion:GS2:correspondences/satake-category-and-fibre-functor`, `GeometricSatakeAndFusion:GS3:fusion/fusion-product-and-sign-rule`, `GeometricSatakeAndFusion:GS3:fusion/finite-set-functoriality-and-constant-terms`, `GeometricSatakeAndFusion:GS3:fusion/disjoint-leg-factorization-and-full-faithfulness`, `ReductiveGroupsPartII:RG2.5`.

**Source match.** FS, Proposition VI.9.6 p230; VI.7.13 pp223–224: Precise shifted constant-term compatibility, proved after restriction to disjoint legs. Zhu, Proposition 2.36 and the following paragraph, p454: States, for the rational Witt category, that the weight functor has a unique monoidal structure compatible with the isomorphism of Corollary 2.10 and is then a tensor functor. Zhu indicates that existence follows from the torus-equivariant cohomology argument of his earlier work, relative to his own monoidal structure on H*; this packet obtains the statement by transporting this node, in the rational Witt equivalence node.

**Acceptance.** For P=G the functor is identity. For T⊂M⊂G the two-step weight functor agrees with the direct one with its summed degree shift.

### Fusion and Verdier duality

**Declaration:** `GeometricSatakeAndFusion:GS3:fusion/fusion-verdier-duality` (theorem).

The inversion/reversal sw* is symmetric monoidal for fusion and F^I sw* ≅ F^I. Verdier duality D is a contravariant symmetric monoidal involution, D sw* ≅ sw* D and F^I D ≅ (F^I)^∨. The internal tensor dual of A is sw*D(A). These identifications retain their evaluation, coevaluation and finite-set coherence data; sw* itself need not be identity.

**Proof route.** VI.8.2 supplies convolution duals before fusion; VI.7.12 supplies F(D A)=F(A)^∨. VI.9.4 promotes them through the canonical convolution/fusion comparison. F(sw*A)=F(A) and full faithfulness yield the symmetric involution and its duality coherences.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS3:fusion/fusion-product-and-sign-rule`, `GeometricSatakeAndFusion:GS2:Satake-closure/convolution-preserves-satake-and-dualizability`, `GeometricSatakeAndFusion:GS2:correspondences/satake-category-and-fibre-functor`, `mathlib:CategoryTheory.LeftRigidCategory`.

**Source match.** FS, Corollary VI.9.5 p230; VI.8.2 pp225–226: States the fibre-dual comparison and derives the symmetric involutions from existing rigidity.

**Acceptance.** A torus weight μ is inverted by sw* and internal dual, with the corresponding dual local system. The PGL2 minuscule case distinguishes a symmetric Verdier pairing from the alternating SL2 pairing used in VI.12.

## GS4: reconstruction of the Satake group

The nodes of this section belong to GS4:integral-dual-group. They come first because the rational layer below uses the reconstructed group.

Bounded support is essential to reconstruction. For finite downward-closed Galois-stable bounds W, the restricted fibre functor has a left adjoint L_W, and X_W=L_W(1) is its bounded generator. Linearity over local systems gives L_W(V)=X_W⊗V. The source proof works at finite ℓ-power levels. It uses a uniform torsion bound for the kernel and cokernel of the standard-to-costandard comparison. Product bounds are handled by fusion of singleton generators. Enlarging the bound from W to W′ gives a map X_W′→X_W, and dually a forward map of dual fibres in the colimit system. The finite-piece monad uses F(X_W), whereas the coordinate coalgebra uses its dual. Reversing these produces the wrong reconstruction.

The MC.6 chain assembles H=colim_W F(X_W)^∨ in the relative Ind category. It obtains a commutative bialgebra structure from fusion and then an antipode from rigidity. Its comparison category consists of comodules whose underlying object is a finite-projective continuous Weil representation. The relevant coequalizers are F-split coequalizers; their existence, preservation and reflection must all be verified. The packet isolates the preservation and coefficient-limit work as a refinement, because the source leaves part of it implicit. This is an application of the foundational criterion, not a second abstract Tannaka development.

### Bounded left adjoints

**Declaration:** `GeometricSatakeAndFusion:GS4:integral-dual-group/tannakian-left-adjoint` (construction).

Let W_i⊂X_*(T)^+ be a finite downward-closed Galois-stable bound for each leg and C_W⊂Sat^I its full bounded-support category. The restriction F_W:C_W→Rep_{W_E^I}^{fp}(Λ) has a left adjoint L_W. Put X_W=L_W(1). For each finite projective Weil representation V, L_W(V)≅X_W⊗V (the LocSys action), naturally in V and the bounds. For product bounds, X_{W•} is the fusion product of the singleton X_{W_i}. These are Satake generators, not their dual coordinate coalgebras.

**Proof route.** Reduce to Λ killed by ℓ^c and single-leg bounds using fusion. On the perverse category apply the adjoint functor theorem to total cohomology. Use the standard/costandard objects, their projective stalks and the uniform ℓ-power bound on the kernel/cokernel of Δ_μ→∇_μ in VI.7.5 to show the representing object is ULA and flat perverse. The bound is independent of coefficient reduction. Use the LocSys tensor action to identify L_W(V), and tensor the singleton adjunctions to identify the multileg generator.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS3:fusion/drinfeld-fibre-realization`, `GeometricSatakeAndFusion:GS2:correspondences/satake-category-and-fibre-functor`, `GeometricSatakeAndFusion:GS3:fusion/fusion-product-and-sign-rule`, `GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness`, `EnhancedDerivedSheaves:E5:presentability/presentable-categories`, `mathlib:CategoryTheory.Adjunction`.

**Source match.** FS, Proposition VI.10.1 pp230–232: The bounded left adjunction, LocSys linearity, fusion of generators and coefficient control.

**Uses.** FS VI.10.2–10.3: The dual fibres of bounded representing objects form the relative coordinate Hopf algebra. MC.6 relative-finite-piece-reconstruction: Provides the precise representing objects required by the single-owner abstract criterion.

**API.**

- `boundedLeftAdjoint` (constructor): The functor L_W left adjoint to F_W.
- `boundedLeftAdjunction` (universal-property): Hom(L_W V,A) ≅ Hom(V,F_W A), naturally in V and A, with triangle identities.
- `boundedGenerator` (data): X_W=L_W(1) in the bounded Satake category.
- `boundedLeftAdjoint_tensor` (compatibility): L_W(V) ≅ X_W⊗V, coherently for the LocSys action.
- `boundedGenerator_fusion` (compatibility): For product bounds the generator is the fusion of singleton generators.
- `boundedGenerator_enlarge` (functoriality): For W⊂W′, representability gives X_W′→X_W after the bounded objects are included in Satake. The dual fibre map is (F X_W)^∨→(F X_W′)^∨, the forward arrow in the coordinate-coalgebra diagram.

**Unit tests.**

- `test_generator_zeroBound` (degenerate): For a bound containing only weight zero, the generator is the unit with fibre Λ.
- `test_generator_productBound` (compatibility): Two singleton generators fuse to the generator for their product bound, including its adjunction map.
- `test_generator_dualOrientation` (non-example): The finite-piece coordinate coalgebra is (F_W X_W)^∨, not F_W X_W. For W⊂W′ its transition map points (F X_W)^∨→(F X_W′)^∨, opposite to X_W′→X_W.

**Acceptance.** For the zero-weight bound X_W is the unit. Enlarging bounds gives compatible representing maps; it does not assert a single finite object represents the unbounded functor.

### Relative Tannaka hypotheses for Satake

**Declaration:** `GeometricSatakeAndFusion:GS4:integral-dual-group/relative-tannaka-hypotheses` (theorem).

With A=Rep_{W_E^I}^{fp}(Λ), C=Sat^I_G(Λ), corrected tensor and F^I, verify the hypotheses of MC.6 relative reconstruction: A is rigid symmetric, C is symmetric A-linear, F is strong symmetric A-linear and conservative, C admits coequalizers of F-split pairs and F reflects and preserves these coequalizers, and bounded full subcategories form a filtered cover stable under the A-action and those coequalizers, with restricted F represented by X_W. Sat^I over a general ring is not asserted to be an abelian category.

**Proof route.** F-split diagrams are split after total cohomology. VI.7.10 constructs the relevant kernel/cokernel Satake objects when fibres split or are direct summands, so their coequalizers remain flat perverse and their fibres give the split quotient. Bounds remain bounded under those coequalizers and the LocSys action; enlargement makes the cover filtered. Apply the bounded adjunction to produce the finite-piece monad. Check preservation as well as reflection for the executable MC adapter; the source leaves preservation implicit, so this verification is a separate recorded proof obligation.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS4:integral-dual-group/tannakian-left-adjoint`, `GeometricSatakeAndFusion:GS3:fusion/fusion-product-and-sign-rule`, `GeometricSatakeAndFusion:GS3:fusion/fusion-verdier-duality`, `GeometricSatakeAndFusion:GS2:correspondences/satake-category-and-fibre-functor`, `GeometricSatakeAndFusion:GS2:Satake-closure/convolution-preserves-satake-and-dualizability`, `MotivesAndAlgebraicCycles:MC.6/relative-finite-piece-reconstruction`, `MotivesAndAlgebraicCycles:MC.6/relative-coalgebra-assembly`, `MotivesAndAlgebraicCycles:MC.6/relative-bialgebra-reconstruction`, `MotivesAndAlgebraicCycles:MC.6/relative-rigid-antipode`, `mathlib:CategoryTheory.Monad.HasCoequalizerOfIsSplitPair`, `mathlib:CategoryTheory.Monad.PreservesColimitOfIsSplitPair`, `mathlib:CategoryTheory.Monad.ReflectsColimitOfIsSplitPair`.

**Source match.** FS, VI.10.2–10.3 pp232–235; VI.7.10 pp222–223: Matches the abstract MC chain and identifies the preservation hypothesis needing verification.

**Acceptance.** The relative base A retains all Weil local systems; it is not replaced by Vect or assumed semisimple. A nonsplit exact sequence of finite projective coefficient modules is not treated as an unrestricted cokernel construction in Satake.

### Geometric Satake coordinate Hopf algebra

**Declaration:** `GeometricSatakeAndFusion:GS4:integral-dual-group/geometric-coordinate-hopf-algebra` (construction). Atlas planet: Satake coordinate Hopf algebra.

Apply the imported MC.6 relative reconstruction to Satake. In Ind(A), define H^I_Λ=colim_W (F_W X_W)^∨. It has a canonical commutative bialgebra structure from tensor products and an antipode from Satake rigidity. The comparison is a symmetric equivalence Sat^I_G(Λ)≃Comod_{A,underlying A}(H^I_Λ). Forgetting W_E^I gives an ordinary flat coordinate Hopf algebra and hence an affine flat group scheme G^∨,I_Λ. This reconstructs H from the Satake category; the baseline known-Hopf tensorAutFunctor is only a compatibility comparison once H is constructed.

**Proof route.** Use the four exact MC.6 nodes for finite-piece reconstruction, filtered coalgebra assembly, multiplication and antipode. Do not replan those abstract theorems here. Each dual fibre is finite projective; its filtered colimit is flat. Tensor compatibility yields commutativity and unit/counit; rigidity supplies the antipode equations. The comparison restricts to comodules whose underlying object lies in A, precisely retaining finite projectivity and continuous Weil action. Compare with the existing known-Hopf reconstruction only after extending to a field where its hypotheses hold. Apply the corrected VI.10.2 wording: obtain a bialgebra first, then an antipode on H under rigidity; do not apply an inverse to the base category A. See the known source slips recorded below.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS4:integral-dual-group/relative-tannaka-hypotheses`, `MotivesAndAlgebraicCycles:MC.6/relative-coalgebra-assembly`, `MotivesAndAlgebraicCycles:MC.6/relative-bialgebra-reconstruction`, `MotivesAndAlgebraicCycles:MC.6/relative-rigid-antipode`, `EnhancedDerivedSheaves:E5:presentability/ind-completion`, `mathlib:HopfAlgebra`, `mathlib:Bialgebra`, `tauceti:TauCeti.AffineGroupSchemeCat`, `tauceti:TauCeti.Tannaka.tensorAutFunctor`, `tauceti:TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor`, `mathlib:CategoryTheory.Limits.HasColimit`.

**Source match.** FS, Propositions VI.10.2–VI.10.3 pp232–235: Relative reconstruction and its application; the coordinate object uses the dual of the bounded represented fibre.

**Uses.** FS VI.11.1: The affine group whose geometric fibre and integral model must be identified. Normalized Satake equivalence: Comodule reconstruction supplies the finite-projective representation category before pinned identification.

**API.**

- `satakeCoordinateHopf` (constructor): H^I_Λ is the filtered colimit of dual bounded-generator fibres, with its commutative Hopf structure.
- `satakeCoaction` (data): Every A has its functorial H-coaction on F^I(A).
- `satakeComoduleEquivalence` (equivalence): The comparison is a symmetric equivalence with H-comodules whose underlying object is in A.
- `satakeCoordinateHopf_tensor` (structure): Tensor of coactions uses the Hopf multiplication, and the unit coaction uses its unit.
- `satakeCoordinateHopf_antipode` (compatibility): The coaction on the internal dual is obtained using the antipode; both antipode identities hold.

**Unit tests.**

- `test_hopf_trivialGroup` (degenerate): For the trivial G, H=Λ and the geometric affine group is the trivial group.
- `test_hopf_torus` (computation): For split T, H=Λ[X_*(T)], with Δ(e^μ)=e^μ⊗e^μ and counit(e^μ)=1.
- `test_hopf_torusAntipode` (computation): The torus antipode sends e^μ to e^{-μ}; using the identity antipode fails for a nonzero G_m weight.

**Acceptance.** Weight-zero bounds contribute the coefficient unit; a split torus gives Λ[X_*(T)]. The antipode restricts to e^μ↦e^{-μ} for a torus. The group over Λ is affine flat; finite type and reductivity require separate arguments.

### Multileg and coefficient reconstruction

**Declaration:** `GeometricSatakeAndFusion:GS4:integral-dual-group/multileg-and-coefficient-reconstruction` (theorem).

There are canonical Hopf isomorphisms H^I_Λ≅⊗_{i∈I}H^{i}_Λ and H^I_Λ⊗_ΛΛ′≅H^I_{Λ′} for the source coefficient changes. They commute with leg permutations, fusion/collision maps, comultiplication, counit and antipode. First work modulo ℓ^c, assemble compatible levels to construct H_{Z_ℓ} and its affine flat group, and recover torsion coefficient rings by base change. Prime-to-p finite coefficient decompositions are assembled componentwise. This is an ℓ-adic reconstruction theorem, not an integral decomposition theorem.

**Proof route.** The product formula for X_W in VI.10.1 gives the dual tensor formula on finite pieces; pass to filtered colimits. Use the uniform standard/costandard torsion control from VI.7.5 in the coefficient comparison of the bounded adjunction. The comparison respects all representing maps and thus Hopf operations. Perform compatible reduction modulo ℓ^c and then ℓ-adic passage; use the CRT decomposition for prime-to-p torsion. The detailed coefficient-limit adapter remains a signature gap.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS4:integral-dual-group/tannakian-left-adjoint`, `GeometricSatakeAndFusion:GS4:integral-dual-group/geometric-coordinate-hopf-algebra`, `GeometricSatakeAndFusion:GS3:fusion/finite-set-functoriality-and-constant-terms`, `GeometricSatakeAndFusion:GS2:correspondences/satake-category-and-fibre-functor`, `mathlib:Module.Flat`.

**Source match.** FS, VI.10.3 pp234–235; VI.11.1 proof p235: The product statement, coefficient compatibility and reduction to the ℓ-adic group are stated and used here.

**Acceptance.** For I=∅ the empty tensor is Λ. For I={1,2}, interchanging factors is the ordinary Hopf flip after the parity correction. Reduction of the Z_ℓ group modulo ℓ^c equals the directly reconstructed group, for every c≥1.

## GS4: geometric rational reductivity and the rational Witt category

The rational branch forgets Weil descent and takes a geometric splitting fibre. It transports through the ULA integral-family comparison to bounded Witt Schubert perfections. Their proper finite-type models and resolutions are where the scheme decomposition theorem applies. Equivariance and connected stabilizers leave only the constant local systems on Schubert strata. IC parity and the boundary-degree bounds give the geometric semisimple decomposition. This does not split arbitrary Weil representations and gives no integral or mod-ℓ decomposition theorem.

Recognizing the generic group takes three distinct steps. Finite generation of the dominant monoid and the top constituent of convolution give a tensor generator, hence finite type by DM 2.20. The unbounded sequence nμ in the tensor powers of every nontrivial highest-weight object rules out finite tensor hulls, hence connectedness by DM 2.22. Both criteria are applied in characteristic zero, which DM 2.22 requires. Once finite type and connectedness are known, geometric semisimplicity and the characteristic-zero reductivity criterion of the upstream ReductiveGroups layer give reductivity; DM 2.23 states the same criterion as proreductivity. Omitting either of the first two steps would give a weaker conclusion.

Zhu's rational Satake category is the category of L⁺G-equivariant perverse Q̄_ℓ-sheaves on the Witt vector affine Grassmannian over an algebraically closed field k. Over k an algebraic closure of F_q, with O = W(k)⊗_{W(F_q)}O_E, FS identify the perverse objects of the local Hecke stack over Spd k with exactly these sheaves (p219). Inverting ℓ and extending scalars then identifies Zhu's category with the idempotent completion of the rationalized FS Satake category of Spd k. Every simple IC_μ comes from an integral standard object, since rationally the standard object of μ is simple. Transporting the parity-corrected fusion symmetry makes Zhu's category neutral Tannakian with fibre functor H*. Its group is the generic fibre of the integral Satake group, so it is connected reductive by the previous node. For a torus, the Witt Grassmannian is the discrete set of coweights and the category is that of graded vector spaces. Zhu states his results for any algebraically closed k and any finite totally ramified F over W(k)[1/p]. For k an algebraic closure of F_p every such F comes from a finite extension of Q_p, and every reductive group over O is split, so the comparison covers that k. A larger algebraically closed k is a recorded gap: it needs invariance under extension of the algebraically closed base field, or Zhu's own proof, which the Part II design owns.

### Geometric rational semisimplicity

**Declaration:** `GeometricSatakeAndFusion:GS4:rational-reductivity/rational-semisimplicity` (theorem). Atlas planet: Geometric Satake semisimplicity.

After forgetting Weil descent and taking a geometric splitting fibre, the rational Satake category is the direct sum over dominant μ of copies of finite-dimensional Q_ℓ-vector spaces generated by the simple IC_μ. For each bounded object the sum is finite. Convolution of the IC objects is semisimple. EDC.7 is applied on finite-type proper models/resolutions of bounded Witt Schubert perfections over an algebraic closure of a finite field and transported through perfection and the integral-family comparison. No semisimplicity of Weil representations, integral Satake objects or mod-ℓ Satake objects follows.

**Proof route.** Use VI.6.7 to transport geometric Satake to the Witt fibre. Equivariance and connected Schubert stabilizers make simple equivariant local systems constant, so simples are IC_μ. Import the rational decomposition theorem on proper finite-type models, using Demazure/affine-flag parity and the IC boundary bounds in VI.7.5. Zhu Lemma 2.1 and Proposition 2.2 give the rational mixed-characteristic semisimple calculation. Transport the resulting splitting through perfection and the ULA comparison. Preserve geometric/Weil distinction throughout.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS1/integral-family-comparison`, `GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness`, `GeometricSatakeAndFusion:GS1/relative-perverse-t-structure`, `GeometricSatakeAndFusion:GS2:correspondences/satake-category-and-fibre-functor`, `GeometricSatakeAndFusion:GS3:fusion/fusion-product-and-sign-rule`, `EtaleDualityAndPerverseSheaves:EDC.7`.

**Source match.** FS, VI.7.5 pp219–221; VI.11.1 proof pp235–236: The geometric rational IC splitting used to recognize the generic group. Zhu, Lemma 2.1 p430 and Proposition 2.2 p432; context pp430–432: Independent rational Witt-fibre calculation, with scheme decomposition as an imported input.

**Acceptance.** The minuscule PGL2 object is the shifted constant sheaf on P¹ and is geometrically simple. Nontrivial unipotent continuous Weil actions can give nonsplit local systems even over Q_ℓ; these do not contradict geometric semisimplicity.

### Reductivity of the generic Satake group

**Declaration:** `GeometricSatakeAndFusion:GS4:rational-reductivity/generic-fibre-reductivity` (theorem). Atlas planet: Generic Satake reductivity.

The geometric generic fibre G^∨_{Q_ℓ} is a connected reductive group of finite type. Finite dominant-monoid generators give a tensor generator (including its dual), so MC.6/DM 2.20 gives finite type. For every nontrivial IC highest weight the highest weights nμ in tensor powers grow, ruling out a nontrivial finite tensor hull; MC.6/DM 2.22 gives connectedness. Having established finite type and connectedness, use geometric semisimplicity and the characteristic-zero reductivity criterion from the existing ReductiveGroups owner. DM 2.23 also expresses the semisimplicity criterion as proreductivity; no additional general pro-group theorem is assigned to the upstream finite-type stage.

**Proof route.** Choose finite generators for dominant weights, and use the highest-weight constituent IC_{μ+ν} of convolution to generate all simples by tensor operations/subquotients. For a nonzero dominant weight all nμ are distinct and occur, so its generated tensor category is not finite; apply the characteristic-zero connectedness test to rule out finite quotients. After finite type and connectedness are established, apply the characteristic-zero semisimplicity/reductivity criterion from the existing ReductiveGroups layer. DM 2.23 provides the corresponding connected proreductive statement.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS4:rational-reductivity/rational-semisimplicity`, `GeometricSatakeAndFusion:GS4:integral-dual-group/geometric-coordinate-hopf-algebra`, `MotivesAndAlgebraicCycles:MC.6/tannaka-finiteness-recognition`, `MotivesAndAlgebraicCycles:MC.6/tannaka-connectedness-recognition`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups`, `ReductiveGroupsPartII:RG2.5`, `tauceti:TauCeti.reductiveAffineGroupSchemeProperty`.

**Source match.** FS, VI.11.1 proof pp235–236: Source proof separates finite type, connectedness and reductivity. DM, Propositions 2.20, 2.22, 2.23 pp24–27: General criteria are imported from their single owners, and used with characteristic zero. Zhu, §2.5 p454, first paragraph: For the rational Witt category Zhu obtains a connected reductive Tannakian group by the same finite-type, connectedness and semisimplicity argument; the rational Witt node below identifies his group with this generic fibre.

**Acceptance.** For G a split torus the group is its dual torus, not a semisimple group. Semisimplicity alone would allow disconnected or infinite proreductive groups; the preceding two recognition steps are necessary.

### Rational Witt Satake category as a neutral Tannakian category

**Declaration:** `GeometricSatakeAndFusion:GS4:rational-reductivity/witt-rational-tannakian-category` (comparison).

Let Sat^Witt_G be Zhu's category P_{L⁺G}(Gr_G) of L⁺G-equivariant perverse Q̄_ℓ-sheaves with bounded support on the Witt vector affine Grassmannian of G over k, with convolution ⋆, unit IC_0 and total cohomology H*. (i) The one-leg comparison over Spd k identifies Sat^Witt_G, compatibly with ⋆ and H*, with the Q̄_ℓ-linear idempotent completion of the rationalization Sat_G(Hck_{Spd k}, Z_ℓ) ⊗ Q̄_ℓ (Hom groups tensored with Q̄_ℓ). (ii) Transporting the parity-corrected fusion symmetry and the Satake duals through (i) makes Sat^Witt_G a semisimple rigid symmetric monoidal abelian category with End(IC_0) = Q̄_ℓ, and H* an exact faithful symmetric monoidal functor to finite-dimensional Q̄_ℓ-vector spaces with the ordinary flip; thus (Sat^Witt_G, H*) is a neutral Tannakian category. (iii) Its Tannakian group Aut^⊗(H*) is canonically the base change to Q̄_ℓ of the generic fibre of the Satake group of Spd k, and so is a connected reductive group of finite type. The monoidal structure on H* is the one transported from fusion; it is not identified with the structure of Zhu's Proposition 2.20.

**Hypotheses.** E is a finite extension of Q_p with residue field F_q; k is an algebraic closure of F_q; O = W(k) ⊗_{W(F_q)} O_E, the integers of the completed maximal unramified extension of E, which is totally ramified over W(k). G is a split connected reductive group over O_E, and also denotes its base change to O. ℓ ≠ p, and Q̄_ℓ is the union of the finite extensions of Q_ℓ. Zhu allows any algebraically closed k and any finite totally ramified F over W(k)[1/p]. For k an algebraic closure of F_p every such F is the completed maximal unramified extension of a finite extension E of Q_p (finite extensions of the completion of the henselian field Q_p^ur come from finite extensions of Q_p^ur), and every reductive group over the strictly henselian ring O is split, so the comparison route covers Zhu's setting for this k. For a larger algebraically closed k it is not covered here (gap "Zhu's equivalence outside the FS comparison").

**Proof route.** Zhu's ring W_O(R) = W(R) ⊗_{W(k)} O equals W(R) ⊗_{W(F_q)} O_E, so his Gr_G is the Witt vector affine Grassmannian of G over k. Over Spd k the local Hecke stack has the Witt Grassmannian as its underlying diamond, and Scholze's full embedding of étale sheaves on perfect schemes identifies its perverse objects with Zhu's L⁺G-equivariant perverse sheaves (FS p219). Compatibility with convolution, the unit and duals comes from the one-leg comparison node, and with total cohomology from the Satake cohomology functor. Pass to rational coefficients through the rational lattice category, whose Hom groups are the integral Hom groups tensored with Q_ℓ; the perverse t-structure passes to this localisation, so rationalised Satake objects are perverse and their Hom groups in the heart are the integral ones tensored with Q_ℓ. Then pass to Q̄_ℓ as a colimit over finite extensions. Every simple IC_μ is in the image: the rational standard object of μ has simple top IC_μ and no maps to objects supported on smaller strata, so by geometric semisimplicity it equals IC_μ. Transport the corrected fusion braiding, the unit and the Satake duals sw*D through (i). Semisimplicity and End(IC_0) = Q̄_ℓ come from geometric rational semisimplicity; exactness and faithfulness of H* from the Satake fibre functor. Apply neutral Tannaka reconstruction. The bounded left adjoints commute with change of coefficients, so the coordinate Hopf algebra of (Sat^Witt_G, H*) is the scalar extension of the integral Satake Hopf algebra of Spd k. Its group is the generic fibre of the integral Satake group, which is connected reductive by the generic reductivity node. Zhu reaches the same conclusion through the argument of Mirković–Vilonen §7 applied to his own constraint; that route belongs to the Part II design.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS2:Satake-closure/one-leg-satake-comparison`, `GeometricSatakeAndFusion:GS1/integral-family-comparison`, `AdicCoefficientsAndComparisons:L0/rational-constructible-coefficients`, `GeometricSatakeAndFusion:GS2:correspondences/satake-fibre-functor`, `GeometricSatakeAndFusion:GS2:Satake-closure/satake-rigidity`, `GeometricSatakeAndFusion:GS3:fusion/fusion-product-and-sign-rule`, `GeometricSatakeAndFusion:GS4:rational-reductivity/rational-semisimplicity`, `GeometricSatakeAndFusion:GS4:rational-reductivity/generic-fibre-reductivity`, `GeometricSatakeAndFusion:GS4:integral-dual-group/multileg-and-coefficient-reconstruction`, `MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction`.

**Source match.** Zhu, §2 opening p429; §2.1.1 p430; §2.5 p454, first paragraph: Standing hypotheses (k algebraically closed, G connected reductive over O), the definition of the Satake category as a colimit over bounded pieces, and the statement that it is a neutral Tannakian category with fibre functor H* whose group is connected reductive. FS, VI.7 p219 after the proof of Proposition VI.7.4; Remark I.2.14 p17: Identifies perverse sheaves on the local Hecke stack over Spd k with Zhu's equivariant perverse sheaves on the Witt Grassmannian, and notes that the degeneration gives a new proof of Zhu's theorem.

**Acceptance.** For a split torus T: Gr_T is discrete with points X_*(T); an object of Sat^Witt_T is a finitely supported family (V_λ) of finite-dimensional Q̄_ℓ-spaces, H* sends it to ⊕_λ V_λ, and Aut^⊗(H*) = T̂. For G = PGL₂ the minuscule object is Q̄_ℓ[1] on P¹, and H* of it is two-dimensional, in degrees −1 and 1. Without the parity correction two odd objects would be exchanged with a Koszul sign under H*, and the reconstruction would be a super-Tannakian category rather than a neutral Tannakian one.

## GS4: integral dual group, normalization and exports

The torus calculation gives the group algebra Λ[X_*(T)]. In rank one the PGL₂ minuscule Schubert variety P¹ gives the SL₂ standard representation, with fibre Z_ℓ⊕Z_ℓ(-1). Its generic fibre is SL₂, and the integral rank-one identification is a separate node. The special-fibre image H ⊂ SL₂ must be shown to be SL₂, after which the flat-module lemma VI.11.3 lifts the isomorphism. The source's Lemma VI.11.2 uses only two facts: H contains the diagonal torus, and its irreducibles are told apart by highest weights. This suffices for ℓ odd, after replacing H by its reduced image under a power of Frobenius, but not for ℓ = 2. Over F₂ the normalizer N(T) of the diagonal torus has both properties: its irreducibles are the trivial representation and the induced representations with weights ±n, and its component group Z/2 has no other irreducible in characteristic two. So do the preimages of N(T) under powers of the Frobenius isogeny, which are not reduced. The corrected argument counts invariants. Over F₂, Hom(1, B₁^{⋆n}) is the top Borel–Moore homology of the base-point fibre of the n-step convolution map, so its dimension is the characteristic-zero multiplicity of the trivial representation in V^{⊗n}. That multiplicity is also the number of SL₂-invariants of the tilting module V^{⊗n}. If H lay in the a-th Frobenius preimage of N(T), the summand T(6·2^a − 2) of V^{⊗n}, for n = 6·2^a − 2, would contribute an invariant that SL₂ does not have, by Donkin's tensor product formula. The packet records the lemma's failure as source issue E8, the tilting facts as a request to LP3, and the geometric count as the gap "Rank-one special-fibre image at ℓ = 2". Component refinement for a general rank-one group uses a diagonalizable group with character group π₁(G). The source calls it a torus, but π₁ can have torsion (source issue E1).

The maximal torus, Borel filtration, simple roots, coroots and reflections come from weight functors and minimal-Levi constant terms. The convex-hull bound excludes extra roots, giving the generic dual root datum. Integral recovery uses the dual torus and rank-one Levi integral points to generate the maximal bounded subgroup. A preserved lattice extends a generic representation to its finite-type integral image. The general Prasad–Yu theorem belongs to RG2.3; it is requested there with its full residue-characteristic-two condition. In characteristic two the argument first uses G_ad, whose dual is simply connected, and then recovers the original group through component and central-character data. A generic isomorphism alone cannot identify an integral model. The supplier contracts for lattice preservation, hyperspecial maximal boundedness and torus/rank-one generation over the completed unramified coefficient ring are recorded as a separate gap.

The canonical identification has a geometric root line Λ(1). Varying the original split pinning over its parameter family proves independence, and finite Galois descent handles nonsplit groups. The geometric Weil action and the usual pinned action are distinguished. A chosen half Tate character κ gives t_G=(2ρ̂_G)(κ), whose adjoint image conjugates the pinned action into the geometric action. The semidirect comparison and the normalized Satake functor keep the action convention. The Levi correction is the ratio t_M^{-1}t_G, and the source's parameter formula is compared separately. Products, adjoint-isomorphism maps and Weil restriction have their own naturality nodes. Finite-index induction for Weil restriction is not a strong monoidal functor on arbitrary representations, so the compatibility keeps its conjugate-leg geometric diagram.

Zhu's Theorem 0.3 follows at the geometric point Spd k with Q̄_ℓ coefficients. The generic root datum and the isomorphism theorem for pinned split groups identify the Tannakian group of the rational Witt category with Ĝ. The weight functor then has a unique monoidal structure compatible with H*, and IC_μ corresponds to V_μ. Only the generic fibre is used, so neither the integral rank-one identification nor its characteristic-two step is a prerequisite of this theorem. It is stated for the monoidal structure on H* transported from fusion. Zhu's own Proposition 2.36 proves the tensor structure on the weight functor by torus-equivariant cohomology, relative to his own monoidal structure; that route belongs to the Part II design.

Reversal acts by the pinned Chevalley involution followed by conjugation by ρ̂(-1) in the adjoint torus. The rank-one proof compares the symmetric Verdier pairing with the alternating SL₂ pairing and finds a minus sign on each simple root line. The sign matters for the canonical fibre comparison, even though conjugacy quotients forget it.

The enhanced export is the local functor of FS IX.2. It sends V to D(S_V)^∨, using Verdier duality relative to the prescribed local Hecke projection. The enhanced convolution uses pullback, tensor and π♮ and is monoidal; the Satake image carries its fusion symmetry. Highest-weight base change and universal stable completion extend the exact representation functor to Perf(B(Ĝ⋊Q)^I), relative to Perf(BQ^I). The general LP3 and LP4 inputs required here are distinct from their restricted Donkin and parameter-stack generation results. HS1 consumes this local export to construct the global Hecke action. The values of the extension lie in the stable idempotent closure of these kernels. The universal property gives only this containment; it neither lifts arbitrary enhanced morphisms or idempotents nor makes the functor fully faithful, so no equality of the essential image with that closure is asserted. The uniqueness statement concerns an isomorphism of restriction functors along the representation embedding, not agreement on objects.

### Torus and rank-one identification

**Declaration:** `GeometricSatakeAndFusion:GS4:integral-dual-group/torus-and-rank-one-identification` (theorem).

For a split torus T, Sat_T is the category of finitely supported X_*(T)-graded finite projective Weil representations and G^∨_T is its dual torus. Constant terms give a closed immersion of this torus into G^∨_G. For G=PGL₂ the minuscule Schubert variety is P¹, its fibre is Z_ℓ⊕Z_ℓ(-1) with torus weights ±1, and the generic fibre G^∨_{Q_ℓ} is SL(Q_ℓ⊕Q_ℓ(-1)) with geometric root line Q_ℓ(1). The integral and special-fibre statement is the separate node rank-one-integral-identification. For general semisimple rank one recover the central/component grading by the diagonalizable group with character group π₁(G), which can have torsion.

**Proof route.** The torus calculation is the character grading and group-algebra Hopf computation. For each top Schubert weight its rank-one weight quotient gives the closed torus immersion. For PGL₂ use H⁰/H² of P¹, evaluation and determinant: the torus acts with weights ±1, so G^∨ maps to SL(Z_ℓ⊕Z_ℓ(-1)). The generic fibre is connected reductive of rank one, the minuscule object tensor-generates, so this representation is faithful, and the group is not a torus because the representation is irreducible of dimension two. So G^∨_{Q_ℓ} → SL₂ is a closed immersion of a three-dimensional connected group, hence an isomorphism, with geometric root pinning. The map to G_ad is componentwise an isomorphism on Grassmannians; refinement of π₁(G_ad)-grading to π₁(G)-grading recovers the central diagonalizable factor.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS3:fusion/symmetric-constant-term`, `GeometricSatakeAndFusion:GS3:fusion/fusion-verdier-duality`, `GeometricSatakeAndFusion:GS4:integral-dual-group/multileg-and-coefficient-reconstruction`, `GeometricSatakeAndFusion:GS4:rational-reductivity/generic-fibre-reductivity`, `ReductiveGroupsPartII:RG2.5`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`, `mathlib:RootPairing`.

**Source match.** FS, VI.11.1 proof pp235–237: Torus case and generic rank-one calculation; the component-grading statement uses source issue E1. Zhu, §2.5 p454, second paragraph: The rational Witt torus case: the Grassmannian of a torus is the discrete set of coweights, its Satake category is graded vector spaces and the Tannakian group is the dual torus.

**Acceptance.** For G=G_m the weight n gives the character z↦z^n. For G=PGL₂ the generic group is SL₂, not PGL₂: the minuscule representation is two-dimensional with weights ±1. For G=PGL₂ the component group Z/2 corresponds to μ₂, which is diagonalizable and not a torus.

### Integral rank-one identification

**Declaration:** `GeometricSatakeAndFusion:GS4:integral-dual-group/rank-one-integral-identification` (theorem).

For G = PGL₂ and every ℓ ≠ p, the representation on the fibre Z_ℓ⊕Z_ℓ(-1) of the minuscule object is an isomorphism G^∨_{Z_ℓ} ≅ SL(Z_ℓ⊕Z_ℓ(-1)). Its special fibre G^∨_{F_ℓ} → SL₂ is surjective. The image H contains the diagonal torus T and its irreducibles are separated by highest weights in Z≥0; for ℓ odd this forces H = SL₂ (VI.11.2). For ℓ = 2 these properties leave the case that the reduced subgroup of H is the normalizer N(T), with H inside a Frobenius preimage of N(T). That case is excluded because Hom(1, B₁^{⋆n}) over F₂ has the characteristic-zero dimension for every n, while a Frobenius preimage of N(T) has more invariants in a suitable V^{⊗n}. For a split G of semisimple rank one the integral identification follows through G → G_ad ≅ PGL₂ and the component grading.

**Proof route.** Reduce G^∨ modulo ℓ and let H be the image of G^∨_{F_ℓ} in SL₂. Every irreducible representation of G^∨_{F_ℓ} is a simple Satake object B_μ of highest weight μ, so the irreducibles of H are separated by highest weights in Z≥0. Replace H by its image H′ under a high power r of the Frobenius isogeny: H′ is reduced, contains T and is a quotient of H, so its irreducibles pull back to irreducibles of H with highest weights multiplied by ℓ^r; and H′ = SL₂ forces H = SL₂ by dimension. The identity component of the smooth group H′ is T, a Borel or SL₂ by the structure theory of SL₂. T and the Borels have irreducibles of negative highest weight; if H′° = T then H′ ⊂ N(T). For ℓ odd the sign character of N(T) is a second irreducible of highest weight 0, so H′ = SL₂. For ℓ = 2, if H′ = N(T) then H lies in H_a, the preimage of N(T) under the a-th Frobenius power, for some a. Put n = 6·2^a − 2. By Donkin's tensor product formula T(n) ≅ T(2^{a+1} − 2) ⊗ T(4)^{[a]}, and T(2^{a+1} − 2) restricted to the a-th Frobenius kernel is the injective hull of the trivial module, so T(n)^{H_a} ≅ T(4)^{N(T)}. This is nonzero, because w is an involution of the two-dimensional weight-zero space of T(4). But T(n)^{SL₂} = 0, because T(4) has no ∇(0) in a good filtration. T(n) is a summand of the tilting module V^{⊗n}, so dim (V^{⊗n})^H > dim (V^{⊗n})^{SL₂}, which is the characteristic-zero multiplicity of the trivial representation. On the Satake side (V^{⊗n})^{G^∨} = Hom(1, B₁^{⋆n}). Here B₁ is the shifted constant sheaf on P¹ and B₁^{⋆n} is the pushforward of the shifted constant sheaf along the semismall n-step convolution map from a smooth source, so this Hom is the top Borel–Moore homology of the fibre over the base point. It is free on its components of top dimension, whatever the coefficients, so its dimension over F₂ is the characteristic-zero count. Since G^∨ acts through H, this contradicts the previous step, and H′ = SL₂ also for ℓ = 2 (this replaces the ℓ = 2 case of VI.11.2, source issue E8). The map G^∨_{Z_ℓ} → SL₂ is an isomorphism on generic fibres and surjective on special fibres, so on coordinate rings it is injective modulo ℓ and an isomorphism after inverting ℓ; the flat-module lemma VI.11.3 makes it an isomorphism. For semisimple rank one use G → G_ad ≅ PGL₂ and refine the component grading.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS4:integral-dual-group/torus-and-rank-one-identification`, `GeometricSatakeAndFusion:GS4:integral-dual-group/multileg-and-coefficient-reconstruction`, `GeometricSatakeAndFusion:GS4:integral-dual-group/geometric-coordinate-hopf-algebra`, `GeometricSatakeAndFusion:GS3:fusion/fusion-product-and-sign-rule`, `GeometricSatakeAndFusion:GS2:correspondences/convolution-diagram`, `GeometricSatakeAndFusion:GS2:correspondences/rational-special-fibre-convolution`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `LanglandsParameterStacks:LP3`, `mathlib:Module.Flat`.

**Source match.** FS, VI.11.1 proof pp236–237; Lemmas VI.11.2–VI.11.3 p237: Special-fibre image and its lift by the flat-module lemma; the ℓ = 2 case of Lemma VI.11.2 is replaced as in source issue E8.

**Acceptance.** The normalizer of the diagonal torus in SL₂ over F₂, and its preimage under the Frobenius isogeny, both have irreducibles of highest weights 0, 1, 2, …, each once; torus containment and injectivity of highest weights cannot tell them from SL₂ at ℓ = 2. For a = 0 the count is n = 4: (V^{⊗4})^{N(T)} is three-dimensional (w permutes the six weight-zero basis tensors freely), against two SL₂-invariants and two characteristic-zero invariants. A map of flat Z_ℓ-modules that is injective modulo ℓ and an isomorphism after inverting ℓ is an isomorphism; injectivity modulo ℓ alone is not enough.

### Weight torus and generic root datum

**Declaration:** `GeometricSatakeAndFusion:GS4:integral-dual-group/generic-root-datum` (theorem).

Under the torus inclusion, weight-functor grading identifies X^*(T^∨)=X_*(T). The stabilizer of the cohomological grading is the maximal torus and the weight filtration defines a Borel. The symmetric constant-term maps for minimal Levis identify each simple coroot of G with a simple root of G^∨ and each simple root with its coroot; their Weyl reflections agree. Convex-hull bounds for weights of IC_μ exclude additional roots. Thus G^∨_{Q_ℓ} has the dual root datum and its generic pinning has root line Q_ℓ(1).

**Proof route.** Use the weight grading and highest-weight line to identify the torus and chosen positive filtration. Insert the already identified rank-one Levi groups via CT and compare the common torus; this gives roots, coroots and simple reflections. The possible weight set in each representation is contained in the convex hull of the Weyl orbit of μ. An additional root would violate these rank-one reflection/weight bounds. Apply the pinned classification from the upstream reductive-group roadmap.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS4:integral-dual-group/torus-and-rank-one-identification`, `GeometricSatakeAndFusion:GS3:fusion/symmetric-constant-term`, `GeometricSatakeAndFusion:GS4:rational-reductivity/generic-fibre-reductivity`, `GeometricSatakeAndFusion:GS1/semi-infinite-orbits-and-hyperbolic-localization`, `ReductiveGroupsPartII:RG2.5`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`.

**Source match.** FS, VI.11.1 proof p238: The rank-one Levi and weight-bound argument identifies the complete generic root datum. Zhu, §2.5 pp454–455, after Proposition 2.36: Rational Witt version: the dual torus is a maximal torus of the Tannakian group, the filtration on H* defines a Borel containing it, and the group is the dual group by the argument of Mirković–Vilonen §7.

**Acceptance.** In type A₁ the root character is twice the standard SL₂ weight, rather than the standard weight. For a torus there are no roots and the entire group is the weight torus.

### Integral recovery and the adjoint reduction

**Declaration:** `GeometricSatakeAndFusion:GS4:integral-dual-group/integral-recovery-and-adjoint-reduction` (theorem).

The generic dual identification extends to an isomorphism G^∨_{Z_ℓ}≅Ĝ_{Z_ℓ} for every ℓ≠p. Over the completed maximal unramified extension, the dual torus and rank-one Levi integral images generate Ĝ(Z̆_ℓ); this maximal bounded subgroup preserves a lattice in every finite-dimensional generic representation. The associated finite-type images recover the integral model via the RG2.3 Prasad–Yu closed-immersion criterion and VI.11.3 flat-module injection. At ℓ=2 first perform this step for G_ad, whose dual is simply connected, and then recover the original G from its component/central grading. One cannot apply Prasad–Yu directly to an arbitrary dual group in characteristic two.

**Proof route.** Use integral CT Levi maps and the dual torus to obtain the full hyperspecial/maximal bounded subgroup; include the torus separately for semisimple rank zero. Import the generation/Iwasawa result from RG2.4 and integral-points topology from RG2.0. Extend a generic faithful representation using a preserved lattice. The map from Ĝ to its finite-type schematic image is generically a closed immersion. PY applies if ℓ≠2 or the generic fibre over an algebraic closure has no normal algebraic subgroup isomorphic to SO_{2n+1}; simple connectedness suffices. For G_ad this exception is absent. Surjectivity on integral points and the flat-module lemma force equality of coordinate rings. Reconstruct arbitrary G by refining the component grading, as in the rank-one/central argument.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS4:integral-dual-group/generic-root-datum`, `GeometricSatakeAndFusion:GS4:integral-dual-group/torus-and-rank-one-identification`, `GeometricSatakeAndFusion:GS4:integral-dual-group/rank-one-integral-identification`, `GeometricSatakeAndFusion:GS4:integral-dual-group/multileg-and-coefficient-reconstruction`, `ReductiveGroupsPartII:RG2.3`, `ReductiveGroupsPartII:RG2.0`, `ReductiveGroupsPartII:RG2.4`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`, `mathlib:Module.Flat`.

**Source match.** FS, VI.11.1 proof pp238–239; Lemma VI.11.4 p238: Source integral recovery, exception and reduction to the adjoint case. PY, Corollary 1.3 pp2–3; proof §5.4 p12: The general criterion is requested from RG2.3, not owned by this application.

**Acceptance.** The theorem includes ℓ=2 when p≠2 and includes groups whose dual has torsion fundamental group. The torus case does not rely on a nonexistent rank-one Levi. Generic equality by itself would also allow defective integral models; this proof uses integral points and the closed-immersion theorem.

### Canonical pinned dual identification

**Declaration:** `GeometricSatakeAndFusion:GS4:integral-dual-group/dual-group-identification` (theorem). Atlas planet: Pinned geometric dual group.

There is a canonical W_E-equivariant isomorphism G^∨_Λ≅Ĝ_Λ^{geom} for the prime-to-p torsion and compatible ℓ-adic coefficients above. The geometric pinning identifies each simple root line with Λ(1); it carries the cyclotomic Weil action as well as the action on the pinned dual root datum. The isomorphism is independent of a chosen splitting pinning of G and descends from a finite Galois splitting extension to nonsplit G. It is an integral theorem and uses no exclusion on the order of π₁(Ĝ).

**Proof route.** Initially identify split pinned groups by the integral torus/rank-one calculation. Vary the pinning over its flag/pinning parameter family. The locally constant Satake/constant-term comparisons are fully faithful under pullback along this family, so the identification is independent of the parameter. Rank-one H⁰/H² duality canonically identifies the geometric root line with Λ(1). Apply finite Galois descent, keeping the action on root datum and the cyclotomic action on root lines distinct, and use the coefficient base-change theorem.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS4:integral-dual-group/integral-recovery-and-adjoint-reduction`, `GeometricSatakeAndFusion:GS3:fusion/symmetric-constant-term`, `GeometricSatakeAndFusion:GS3:fusion/drinfeld-fibre-realization`, `ReductiveGroupsPartII:RG2.5`, `VStackSheavesAndLisseCategories:VS1`.

**Source match.** FS, Theorem VI.11.1 p235 and canonical-pinning/descent proof pp238–239: Canonical integral identification with the geometrically twisted dual, including pinning independence and descent.

**Acceptance.** For PGL₂, arithmetic action on the dual root vector is cyclotomic, even when the pinned root datum has trivial action. For nonsplit tori this recovers the dual character lattice with its actual Weil action.

### Rational Witt vector geometric Satake equivalence

**Declaration:** `GeometricSatakeAndFusion:GS4:integral-dual-group/witt-rational-satake-equivalence` (theorem). Atlas planet: Witt vector geometric Satake.

In the setting of the rational Witt Tannakian category, let Ĝ be the split dual group over Q̄_ℓ with the dual Borel B̂ ⊃ T̂ of its pinned dual root datum. There is an equivalence of Q̄_ℓ-linear symmetric monoidal categories S: Sat^Witt_G → Rep_{Q̄_ℓ}(Ĝ) onto finite-dimensional algebraic representations, with an isomorphism of tensor functors H* ≅ (forget ∘ S). Under S: (a) the weight functor CT = ⊕_λ CT_λ, viewed as a functor to Sat^Witt_T, has a unique monoidal structure for which the isomorphism H*_T ∘ CT ≅ H* is monoidal; it is then symmetric and corresponds to restriction to T̂, CT_λ(A) being the λ-weight space of S(A); (b) the filtration of H* by semi-infinite orbits corresponds to the B̂-stable filtration by weights; (c) IC_μ corresponds to the irreducible representation V_μ of highest weight μ, so dim CT_λ(IC_μ) = dim V_μ(λ); (d) for a torus, S is the grading equivalence with Rep(T̂). This is Zhu's Theorem 0.3, with Corollary 2.22 and §2.5, for the monoidal structure on H* transported from fusion; its agreement with the structure of Zhu's Proposition 2.20 is not asserted.

**Hypotheses.** E is a finite extension of Q_p with residue field F_q; k is an algebraic closure of F_q; O = W(k) ⊗_{W(F_q)} O_E, the integers of the completed maximal unramified extension of E, which is totally ramified over W(k). G is a split connected reductive group over O_E, and also denotes its base change to O. ℓ ≠ p, and Q̄_ℓ is the union of the finite extensions of Q_ℓ. Zhu allows any algebraically closed k and any finite totally ramified F over W(k)[1/p]. For k an algebraic closure of F_p every such F is the completed maximal unramified extension of a finite extension E of Q_p (finite extensions of the completion of the henselian field Q_p^ur come from finite extensions of Q_p^ur), and every reductive group over the strictly henselian ring O is split, so the comparison route covers Zhu's setting for this k. For a larger algebraically closed k it is not covered here (gap "Zhu's equivalence outside the FS comparison"). Dominance on coweights uses nonnegative integer combinations of positive coroots (source issue E10); Rep_{Q̄_ℓ}(Ĝ) means algebraic representations on finite-dimensional Q̄_ℓ-vector spaces, with no Weil action.

**Proof route.** The generic root datum node identifies the root datum of the Tannakian group of the rational Witt category with the dual root datum, with its torus, Borel and simple root lines; the isomorphism theorem for pinned split groups gives Aut^⊗(H*) ≅ Ĝ over Q̄_ℓ. Neutral Tannaka reconstruction turns this into S with forget ∘ S ≅ H*. Only the generic fibre is used: the integral rank-one identification, integral recovery and the ℓ = 2 input are not prerequisites. For (a): transport the symmetric constant term for B through the one-leg comparison and to Q̄_ℓ; it commutes with the fibre functors. Uniqueness: H*_T is faithful, so the monoidal structure on CT is determined by the monoidal isomorphism H*_T ∘ CT ≅ H*. Symmetry: the commutativity constraints on both sides are detected by H*, as in the uniqueness part of Zhu's Proposition 2.21. The torus case identifies Rep(T̂) with graded spaces, so CT is restriction to T̂. For (b) and (c): the stabilizer of the cohomological filtration is B̂ by the generic root datum node. The weights of IC_μ lie in the convex hull of Wμ and μ occurs once, since S_μ ∩ Gr_{≤μ} is irreducible of dimension ⟨2ρ, μ⟩ by the Mirković–Vilonen count; so S(IC_μ) is the irreducible module of highest weight μ by the characteristic-zero highest-weight classification. For (b): the semi-infinite filtration is split by the weight functors (Zhu Corollary 2.10, with its proof as corrected in source issue E11, or the Satake fibre functor node), so by (a) it corresponds to the sums of the weight spaces V(λ′) over λ′ ≥ λ, which are B̂-stable because the root groups of B̂ raise weights by positive coroots of G. Zhu's own route to the same identification (torus case, Proposition 2.36 by torus-equivariant cohomology, then the maximal torus and Borel argument of Mirković–Vilonen §7) uses his monoidal structure on H* and his Gelfand commutativity constraint (§§2.3–2.4). That proof is routed to the Part II design and is not used here.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS4:rational-reductivity/witt-rational-tannakian-category`, `GeometricSatakeAndFusion:GS4:integral-dual-group/generic-root-datum`, `GeometricSatakeAndFusion:GS4:integral-dual-group/torus-and-rank-one-identification`, `GeometricSatakeAndFusion:GS3:fusion/symmetric-constant-term`, `GeometricSatakeAndFusion:GS2:Satake-closure/one-leg-satake-comparison`, `GeometricSatakeAndFusion:GS0:Witt-geometry/semi-infinite-intersections-and-MV-cycles`, `GeometricSatakeAndFusion:GS1/rational-weight-concentration`, `MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction`, `ReductiveGroupsPartII:RG2.5`, `LanglandsParameterStacks:LP3`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`.

**Source match.** Zhu, Theorem 0.3 p408 (with source issue E9); Corollary 2.22 p444; §2.5 pp454–455; §0.5 p412: The mixed characteristic geometric Satake equivalence with Q̄_ℓ coefficients, its symmetric monoidal form, the identification with the dual group through the torus case, the tensor constant term and the Borel, and the notation Ĝ ⊃ B̂ ⊃ T̂, V_μ, V_μ(λ). FS, Remark I.2.14 p17; VI introduction pp188–189: Fargues and Scholze note that their theorem, through the Witt degeneration, reproves Zhu's equivalence, and that the Satake categories over Spd O_C, Spd C and Spd k agree.

**Acceptance.** For a split torus T, S is the equivalence between X_*(T)-graded spaces and representations of T̂, with CT the identity. For G = PGL₂ the minuscule object goes to the standard representation of SL₂, with CT_{±μ} one-dimensional. For G = GL_n and μ = (1,0,…,0) the closed Schubert variety is P^{n−1}; S(IC_μ) is the standard representation, with the n coordinate weights each of multiplicity one. With the Koszul-signed symmetry instead of the parity-corrected one, the reconstruction would give a supergroup, not Ĝ.

### Normalized integral Satake equivalence

**Declaration:** `GeometricSatakeAndFusion:GS4:integral-dual-group/normalized-satake-equivalence` (construction). Atlas planet: Normalized Satake equivalence.

Choose r∈Λ× with r²=q and the associated half Tate local system. Let χ_Tate be the Weil character of the geometric root line Λ(1) under IV.7.3 and κ its chosen square root. The half twist on a sheaf stalk has geometric Frobenius eigenvalue r^{-1}; identifying that stalk convention with κ under Drinfeld realization is the recorded convention obligation. Put t_G(w)=(2ρ̂_G)(κ(w)) in Ĝ (projected to Ĝ_ad for conjugation). The geometric action is Ad(t_G(w)) composed with the usual pinned action. The semidirect comparison (g,w)↦(g t_G(w),w) identifies the geometrically twisted semidirect group with the pinned one. Combining it with reconstruction gives Sat^I_G(Λ)≃Rep^{fp,cont}_Λ((Ĝ⋊W_E)^I). Equivalently an algebraic representation of (Ĝ⋊Q)^I, for a finite quotient Q through which the pinned action factors, gives its normalized Satake object; Q is not substituted for all continuous Weil representations.

**Proof route.** Use the root-line action in VI.11.1 to express geometric versus pinned action through the adjoint cocharacter 2ρ̂, without requiring ρ̂ itself to be a cocharacter of Ĝ. The identity t(wv)=t(w)·w(t(v)) verifies the semidirect multiplication comparison. Tensor and dual compatibility follow from the Hopf comparison and corrected fusion. Transport the chosen half twist and Frobenius convention through the Drinfeld equivalence. The precise stalk-action versus parameter-action orientation is recorded as a supplier/signature obligation rather than identified silently.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS4:integral-dual-group/dual-group-identification`, `GeometricSatakeAndFusion:GS4:integral-dual-group/geometric-coordinate-hopf-algebra`, `GeometricSatakeAndFusion:GS4:integral-dual-group/multileg-and-coefficient-reconstruction`, `GeometricSatakeAndFusion:GS3:fusion/drinfeld-fibre-realization`, `GeometricSatakeAndFusion:GS3:fusion/fusion-verdier-duality`, `ReductiveGroupsPartII:RG2.5`, `mathlib:CategoryTheory.Functor.Monoidal`, `mathlib:Representation`.

**Source match.** FS, Theorem VI.0.2 p190; VI.11.1 p235; IX.2 p321: The source normalizes the geometric action using a chosen square root and exports finite-projective representations.

**Uses.** HeckeStacksAndLocalShtukas:HS1: Uses normalized kernels indexed by finite projective representations. ExcursionOperatorsAndSpectralAction:ES6–ES7: Requires a finite-set coherent pinned Weil convention, including chosen half twists.

**API.**

- `normalizedSatakeEquivalence` (equivalence): The strong symmetric equivalence with continuous finite-projective representations of the usual pinned Weil semidirect group.
- `normalizedSatakeObject` (constructor): The inverse equivalence applied to a representation V of (Ĝ⋊Q)^I.
- `normalizedSatake_fibre` (compatibility): The underlying fibre is V with the specified half-Tate normalization, compatibly with Weil action.
- `normalizedSatake_tensor` (compatibility): S_{V⊗W} ≅ S_V*S_W and S_1 ≅ unit.
- `normalizedSatake_dual` (compatibility): S_{V∨} is the internal dual sw*D(S_V).
- `normalizationCocycle` (data): t_G(w)=(2ρ̂_G)(κ(w)); the cocycle identity gives the semidirect comparison.

**Unit tests.**

- `test_normalized_torus` (computation): For T=G_m, weight n is the point object on component n, with no ρ twist.
- `test_normalized_pgl2` (computation): For the standard SL₂ representation its PGL₂ Satake sheaf is Λ[1](1/2) on P¹, with Frobenius eigenvalues r^{-1},r.
- `test_normalized_rootChoice` (non-example): Changing the chosen square root from r to -r multiplies an odd component by -1; it does not leave all normalized objects canonically fixed.

**Acceptance.** For PGL₂ the normalized minuscule object is IC(P¹)=Λ[1](1/2) and its two Frobenius eigenvalues are r^{-1},r. For a torus 2ρ̂=0, so normalization leaves its weight characters unchanged. Changing r to -r changes the odd-component half twists by the central parity element (2ρ̂)(-1).

### Levi naturality and normalization

**Declaration:** `GeometricSatakeAndFusion:GS4:integral-dual-group/levi-naturality` (theorem).

For P with Levi M, CT_P[deg_P] intertwines geometric Satake with restriction along ĤM^{geom}→Ĝ^{geom}. Under the chosen normalized semidirect comparisons, the map from the pinned M-group to the pinned G-group is (m,w)↦(ι(m)t_M(w)^{-1}t_G(w),w). Here t_G/t_M=(2ρ̂_G−2ρ̂_M)(κ(w)) centralizes ĤM. Nested Levis multiply these correction cocycles and their degree shifts add. Thus this is a naturality theorem with a specified Weil correction, not unqualified restriction along the untwisted inclusion.

**Proof route.** Transport the geometric CT map through the two explicit semidirect comparison isomorphisms; multiply the two cocycles in the common torus. The difference of half-sums pairs trivially with the Levi roots, so the correction centralizes the Levi. Coherence follows from CT transitivity and cancellation of the intermediate cocycle. Compare the result with the source parameter convention in IX.7.1, where |geometric Frobenius|=1 and the parameter map is written with (2ρ̂_G−2ρ̂_M)(r)^{|w|}; the inverse action/parameter translation is an explicitly recorded boundary.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS4:integral-dual-group/normalized-satake-equivalence`, `GeometricSatakeAndFusion:GS3:fusion/symmetric-constant-term`, `GeometricSatakeAndFusion:GS4:integral-dual-group/generic-root-datum`, `ReductiveGroupsPartII:RG2.5`.

**Source match.** FS, VI.9.6 p230; VI.11.1 pp238–240; IX.7.1 p334: Geometric CT is natural; the source explicitly displays the correction in its parameter convention.

**Acceptance.** For M=G the correction is one and CT is identity. For a three-step Levi chain the intermediate half-sum cancels and gives the direct correction.

### Naturality for adjoint-isomorphism maps

**Declaration:** `GeometricSatakeAndFusion:GS4:integral-dual-group/adjoint-isomorphism-naturality` (theorem).

For f:G′→G inducing an isomorphism on adjoint groups, componentwise pushforward of the corresponding bounded Grassmannian sheaves intertwines normalized Satake with restriction along the dual map Ĝ→Ĝ′. Component refinements, central characters, Weyl actions, tensor constraints, half twists and finite-set collisions commute with this comparison. This includes central isogenies and the adjoint reduction used for integral recovery; no inverse equivalence for a general central isogeny is asserted.

**Proof route.** The map of Grassmannians is a componentwise isomorphism; its essential change is the map of component gradings. Pushforward corresponds to forgetting/refining the appropriate dual central character. The common adjoint root system identifies the half-sum cocycles, so normalizations commute with the dual map. Prove tensor and finite-set comparisons on disjoint loci and extend uniquely.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS4:integral-dual-group/normalized-satake-equivalence`, `GeometricSatakeAndFusion:GS4:integral-dual-group/torus-and-rank-one-identification`, `GeometricSatakeAndFusion:GS3:fusion/finite-set-functoriality-and-constant-terms`, `ReductiveGroupsPartII:RG2.5`, `GeometricSatakeAndFusion:GS0:loop-geometry/loop-groups-and-local-hecke`.

**Source match.** FS, VI.11.1 proof pp237–239; IX.6.1 pp330–331: The source uses exactly this Satake naturality to compare the global Hecke kernels.

**Acceptance.** For SL₂→PGL₂, component/central-character information distinguishes the two representation categories. For an isomorphism f the comparison reduces to the usual pullback identification.

### Product naturality

**Declaration:** `GeometricSatakeAndFusion:GS4:integral-dual-group/product-naturality` (theorem).

For G=G₁×G₂ the external product of Grassmannian sheaves and normalized Satake identify Ĝ with Ĝ₁×Ĝ₂ and carry V₁⊠V₂ to S_{V₁}⊠S_{V₂}. Tensor, fibre, root pinning, Weil action and all finite-set operations agree. This is a statement for external products and their induced categorical comparison, not a claim every representation is itself an external tensor product.

**Proof route.** The loop/torsor and bounded Schubert constructions split as products; Künneth splits total cohomology and constant terms. The Hopf reconstruction and root pinning split, and 2ρ̂ is the pair of half-sum cocharacters. Verify comparisons on exterior product generators and retain the coherent tensor data.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS4:integral-dual-group/normalized-satake-equivalence`, `GeometricSatakeAndFusion:GS3:fusion/finite-set-functoriality-and-constant-terms`, `ReductiveGroupsPartII:RG2.5`, `GeometricSatakeAndFusion:GS0:loop-geometry/loop-groups-and-local-hecke`.

**Source match.** FS, IX.6.2 p331; VI.10.3 pp234–235: Gives the product compatibility; the local comparison follows from product geometry and Hopf reconstruction.

**Acceptance.** The product with the trivial group recovers the same Satake functor. For G_m×G_m the weight (a,b) is the exterior product of the two point objects.

### Weil restriction naturality

**Declaration:** `GeometricSatakeAndFusion:GS4:integral-dual-group/weil-restriction-naturality` (theorem).

For a finite separable E′/E and G=Res_{E′/E}G′, the dual pinned group is the product of conjugates of Ĝ′ indexed by embeddings E′→Ē, with its permutation Weil action. After pullback to the E′ divisor base, the closed Grassmannian immersion for the chosen embedding and proper pushforward implement the representation procedure: project to Ĝ′, inflate from Ĝ′⋊W_{E′} to Ĝ⋊W_{E′}, then induce to Ĝ⋊W_E. This comparison is compatible with total cohomology, tensor/collision coherences and the two field-specific half twists; it is not an equivalence replacing W_E by W_{E′} without induction.

**Proof route.** Import the group-scheme Weil restriction and its pinned dual permutation datum. Use the pullback of the divisor leg base and the chosen-embedding closed Grassmannian immersion. The proper pushforward is finite-index induction on Weil representations by the Drinfeld realization, matching IX.6.3. Track residue degree f via q_{E′}=q_E^f and compatible half-root choices. Construct the finite-set/tensor comparisons through the geometric correspondences, not by claiming induction is strong monoidal on arbitrary representations; its compatibility uses the particular Hecke/factorization diagram.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS4:integral-dual-group/normalized-satake-equivalence`, `GeometricSatakeAndFusion:GS3:fusion/finite-set-functoriality-and-constant-terms`, `GeometricSatakeAndFusion:GS0:loop-geometry/loop-groups-and-local-hecke`, `ReductiveGroupsPartII:RG2.5`, `ReductiveGroupsPartII:RG2.0a`.

**Source match.** FS, IX.6.3 pp331–332: Precise chosen-embedding inflation/induction and its geometric divisor/Grassmannian map.

**Acceptance.** For E′=E the construction is identity. For a quadratic induced torus the two geometric character factors are permuted by W_E; forgetting that permutation fails. Half roots must satisfy r_{E′}=r_E^f when compatible normalization is claimed.

### Chevalley involution with its inner sign

**Declaration:** `GeometricSatakeAndFusion:GS4:integral-dual-group/chevalley-involution` (theorem). Atlas planet: Chevalley involution.

Under canonical dual identification, sw* acts by Ad(ρ̂(-1))∘θ on Ĝ, where θ is the pinned Chevalley involution with lattice action μ↦−w₀μ and ρ̂(-1) is evaluated in the adjoint dual torus. It commutes with the geometric Weil action. Internal dual is sw*D, not sw* alone. The inner correction affects the canonical tensor/fibre comparison although it disappears after quotienting dual parameters by conjugacy.

**Proof route.** Reduce via adjoint-isomorphism maps to the simply connected dual and then by rank-one constant terms to PGL₂. Compare the symmetric Verdier pairing on Λ[1](1/2) with the alternating invariant pairing on the SL₂ standard representation. Their ratio acts diagonally as (u,-u), so each simple-root line is multiplied by -1. An automorphism preserving torus/filtration is torus-inner; these rank-one signs identify it with ρ̂(-1). Reassemble using the root datum and canonical pinning.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS4:integral-dual-group/dual-group-identification`, `GeometricSatakeAndFusion:GS4:integral-dual-group/normalized-satake-equivalence`, `GeometricSatakeAndFusion:GS3:fusion/fusion-verdier-duality`, `GeometricSatakeAndFusion:GS3:fusion/symmetric-constant-term`, `GeometricSatakeAndFusion:GS4:integral-dual-group/torus-and-rank-one-identification`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`.

**Source match.** FS, Proposition VI.12.1 and proof pp239–241: Includes the rank-one pairing computation and the essential inner sign.

**Acceptance.** For PGL₂ the root-line sign is -1, so omitting ρ̂(-1) gives the wrong fibre comparison when 2 is invertible. For a torus w₀=1 and θ inverts characters; for coefficients of characteristic two the inner signs reduce to one.

### Perfect-complex Satake extension

**Declaration:** `GeometricSatakeAndFusion:GS4:integral-dual-group/enhanced-perfect-satake-extension` (construction). Atlas planet: Perfect Satake kernels.

Fix ℓ≠p, a finite quotient Q of W_E through which the pinned action on Ĝ factors, and a Z_ℓ[r]-algebra Λ with r²=q. Compose normalized Satake on finite projective representations of (Ĝ⋊Q)^I with A↦D(A)^∨, using Verdier duality relative to Hck^I_G→[(Div¹)^I/L⁺G]. This is an exact Rep_Λ(Q^I)-linear monoidal functor into the enhanced local Hecke convolution category D■(Hck^I_G,Λ). Using LP3 highest-weight base change and LP4 the universal stable completion of the finite-projective exact representation category, extend it uniquely to a Perf(BQ^I_Λ)-linear exact monoidal functor Perf(B(Ĝ⋊Q)^I_Λ)→D■(Hck^I_G,Λ), coherent in I. Its fusion comparisons give symmetry on the Satake image. Its values lie in the stable idempotent closure of these Satake kernels. Equality with that closure, full faithfulness, and an equivalence with the whole enhanced category are not supplied by this extension theorem.

**Proof route.** First define the exact representation functor over Z_ℓ[r] and compose with relative Verdier dual followed by internal dual. The enhanced target convolution uses pullback, tensor and π♮, which have the required infinity-category coherence. Import the relative highest-weight base-change equivalence Perf(B(Ĝ⋊Q)^I_{Z_ℓ[r]}) ⊗_{Perf(BQ^I_{Z_ℓ[r]})} Perf(BQ^I_Λ) ≅ Perf(B(Ĝ⋊Q)^I_Λ). Import the free stable/idempotent completion universal property for exact finite-projective representations, then extend the kernel functor and its finite-set comparisons uniquely. The general all-prime LP3/LP4 inputs are requested, not replaced by restricted parameter-stack generation. The free stable/idempotent completion gives containment of the image in the stable idempotent closure of the representation kernels. It does not lift arbitrary enhanced morphisms or idempotents, so it does not prove equality of that closure with the essential image.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS4:integral-dual-group/normalized-satake-equivalence`, `GeometricSatakeAndFusion:GS3:fusion/finite-set-functoriality-and-constant-terms`, `GeometricSatakeAndFusion:GS3:fusion/fusion-verdier-duality`, `LanglandsParameterStacks:LP3`, `LanglandsParameterStacks:LP4`, `EnhancedDerivedSheaves:E5:abstract/stable-infinity-category`, `EnhancedDerivedSheaves:E5:abstract/exact-functors`, `EnhancedDerivedSheaves:E5:abstract/idempotent-completion`, `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`, `VStackSheavesAndLisseCategories:VS3`, `DiamondSixOperations:S6`.

**Source match.** FS, IX.2 p321: Exact relative Perf base change and stable completion used to export the local Satake kernel functor.

**Uses.** HeckeStacksAndLocalShtukas:HS1: Imports this local enhanced kernel functor, then constructs the global Hecke action; it does not own the extension. FS IX.2: Scalar extension and stable exactness are used before applying global Hecke correspondences.

**API.**

- `perfectSatakeFunctor` (constructor): The exact Perf(BQ^I)-linear monoidal functor on Perf(B(Ĝ⋊Q)^I).
- `perfectSatake_onRepresentation` (compatibility): On a finite-projective representation V its value is D(S_V)^∨ in local enhanced convolution.
- `perfectSatake_baseChange` (functoriality): Scalar extension Λ→Λ′ commutes with the functor through the specified relative Perf base-change equivalence.
- `perfectSatake_exact` (structure): The extension preserves zero objects, cofibres, shifts and retracts.
- `perfectSatake_finiteSets` (compatibility): The extension of all collision, permutation and unit comparisons has the same composition coherences.
- `perfectSatake_unique` (universal-property): Restriction along the representation embedding identifies the space of exact linear monoidal extensions with that of exact linear monoidal representation functors. A specified coherent isomorphism of restriction functors extends uniquely in this sense; agreement of object values alone is insufficient.

**Unit tests.**

- `test_perfect_unit` (degenerate): The trivial representation gives the convolution unit.
- `test_perfect_shift` (compatibility): V[1] gives D(S_V)^∨[1]; it is not represented by an unrelated perverse object in degree zero.
- `test_perfect_badPrimeAllowed` (non-example): For G=SL₂ and ℓ=2≠p, whose dual PGL₂ has π₁ of order two, this extension remains in scope; no π₁ invertibility predicate is imposed.

**Acceptance.** A degree-zero finite projective V goes to D(S_V)^∨ with the specified relative duality. The coefficient unit maps to the convolution unit and a shift V[1] maps to the kernel shift. The statement holds at ℓ dividing π₁(Ĝ) torsion or |Q|; it uses none of the spectral-action exclusions.

## GS4: comparison with classical Satake

Assume G is unramified with a reductive integral model and hyperspecial K, and choose rational coefficients containing r=√q. Frobenius descent is additional structure on an object; geometric ULA comparison does not supply a specified trace of an arbitrary geometric object. Use an actual finite-type bounded special-fibre model and the existing constructible Frobenius trace theorem.

There are two normalization factors. IC_μ=j_{!*}L[d_μ](d_μ/2) has leading raw trace (-1)^{d_μ}r^{-d_μ}. Multiplying the alternating trace by the component parity sign leaves leading coefficient r^{-d_μ}. For the unit this is +1, and for an odd minuscule object it removes the negative sign of the perverse shift. This normalized trace is compatible with convolution because parities add and the trace formula identifies proper pushforward with point summation.

SR.4 supplies the classical transform; this part does not reconstruct it. Fix vol(K)=1 and vol(N(O_E))=1. In the split case S(f)(t)=δ_B(t)^{1/2}∫_N f(tn)dn with δ_B(λ(π))^{1/2}=q^{-⟨ρ,λ⟩}. The shifted weight functor and its half twist give precisely this modulus. Zhu's IC weight calculation and Gross's triangular formula identify S(τ_{IC_μ}) with χ_μ, for the canonical constant-sheaf and IC Frobenius descents; a rescaled descent rescales the trace. For minuscule μ, τ=r^{-d_μ}1_{Kμ(π)K} and the lower terms vanish. For nonminuscule μ the IC function has lower strata; it is not an unscaled double-coset indicator.

The nonsplit unramified comparison must retain the relative/Frobenius-twisted character datum of SR.4. Gross's split calculation is not cited as a proof of that descent. The packet plans the theorem and records the exact source-adapter refinement. This downstream comparison is never a prerequisite of integral Satake, fusion, rational reductivity or the classical transform.

### Normalized Frobenius function

**Declaration:** `GeometricSatakeAndFusion:GS4:classical-Satake-comparison/normalized-frobenius-function` (definition). Atlas planet: Normalized Frobenius function.

Assume G is unramified with a reductive O_E-model and hyperspecial K=G(O_E), and work rationally over a field L containing Q_ℓ and a chosen r with r²=q. A bounded Satake object A with a specified Frobenius descent structure is represented on its finite-type special-fibre model. For homogeneous support parity ε(A), define τ_A(g)=(-1)^{ε(A)} Σ_i(-1)^i Tr(Frob_q;H^i(A_{ḡ})); add this over even/odd summands. Geometric Frobenius acts on L(1) by q^{-1}; for the explicit IC formulas use the canonical Frobenius descent of the constant sheaf on the open Schubert stratum, and the sheaf IC_μ is normalized as j_{!*}L[d_μ](d_μ/2), d_μ=⟨2ρ,μ⟩, using r^{-d_μ} for the half twist. The function is K-biinvariant with bounded double-coset support. A geometric object without Frobenius descent has no specified trace function.

**Proof route.** Use the finite-type special-fibre model and Frobenius-equivariant constructible realization, rather than counting points of an arbitrary diamond. Compute alternating stalk trace, multiply by the component parity, and use hyperspecial loop equivariance for K-biinvariance and bounded Schubert support for compact support. The half twist supplies r^{-d_μ}, and the perverse shift supplies (-1)^{d_μ}; the parity factor cancels the latter.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS3:fusion/support-parity`, `GeometricSatakeAndFusion:GS1/integral-family-comparison`, `GeometricSatakeAndFusion:GS4:integral-dual-group/normalized-satake-equivalence`, `SchemeAndStackFoundations:SF.2`, `SmoothRepresentationsOfLocalGroups:SR.4`.

**Source match.** Zhu, §2.2 pp434–436, equations (2.2.7)–(2.2.10): Relates IC weight cohomology to the spherical transform, with rational coefficients. Gross, §3 pp6–8, (3.3), (3.4), (3.6), (3.13); §8 pp15–16 for choices of normalization: Modulus/half-root and minuscule coefficients; the packet separately tracks the perverse parity sign. Section 8 distinguishes central parameter normalizations.

**Uses.** Classical Satake comparison: Compares the constructed geometric equivalence with the classical SR.4 transform using fixed normalization. Gross (3.13): Checks the leading/minuscule coefficient rather than equating IC basis functions with unscaled double-coset indicators.

**API.**

- `normalizedTraceFunction` (constructor): The parity-corrected alternating geometric Frobenius stalk trace of a Frobenius-descended Satake object.
- `normalizedTrace_add` (simp): Direct sums add trace functions, with parity correction applied separately to the two component summands.
- `normalizedTrace_halfTwist` (compatibility): For any integer d, twisting the specified descent by (d/2) multiplies the geometric Frobenius trace by r^{-d}.
- `normalizedTrace_biinvariant` (characterisation): Values are constant on K-double cosets and vanish outside finitely many bounded relative positions.
- `normalizedTrace_minuscule` (example): For a minuscule μ with canonical constant-sheaf IC Frobenius descent, τ_{IC_μ}=r^{-d_μ}1_{Kμ(π)K}; scaling the descent scales this function.

**Unit tests.**

- `test_trace_unit` (degenerate): τ_unit=1_K with coefficient +1. Use the canonical constant-sheaf/IC Frobenius descent.
- `test_trace_torusWeight` (computation): For G_m and weight n, τ is 1_{π^n O_E^×}. Use the canonical constant-sheaf/IC Frobenius descent.
- `test_trace_oddMinuscule` (non-example): For split PGL₂ and its minuscule d=1, τ=r^{-1}1_{Kμ(π)K}, whereas the raw alternating trace is -r^{-1}1_{Kμ(π)K}. Use the canonical constant-sheaf/IC Frobenius descent.

**Acceptance.** The zero-weight object gives the characteristic function of K. For a split torus weight μ the function is the characteristic function of μ(π)K. For odd minuscule d, the uncorrected alternating trace is negative; the normalized function has leading coefficient r^{-d}. These formulas use the canonical constant-sheaf/IC Frobenius descent; scaling that descent scales the trace.

### Frobenius trace and convolution

**Declaration:** `GeometricSatakeAndFusion:GS4:classical-Satake-comparison/trace-convolution` (theorem).

Normalize Haar measure on G(E) by vol(K)=1. For Frobenius-descended rational Satake objects, τ_{A*B}=τ_A*τ_B, where the right side is spherical Hecke convolution with this measure; unit maps to 1_K. The same assertion holds for the existing convolution via its fusion comparison. This is additive on the Grothendieck group of the exact Frobenius-descended category, not an equivalence between all Weil sheaves and arbitrary functions.

**Proof route.** On the finite-type bounded convolution correspondence use Künneth for stalk tensor traces and the proper/compact-support Frobenius trace formula for pushforward. The rational point sum matches double-coset convolution with vol(K)=1. Parity adds under convolution, so its correction factors multiply. The correspondence trace comparison descends through the perfection/model identifications.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS4:classical-Satake-comparison/normalized-frobenius-function`, `GeometricSatakeAndFusion:GS3:fusion/fusion-product-and-sign-rule`, `GeometricSatakeAndFusion:GS2:correspondences/convolution-diagram`, `SchemeAndStackFoundations:SF.2`, `SmoothRepresentationsOfLocalGroups:SR.4`.

**Source match.** Zhu, §2.1 pp430–433 and §2.2 pp434–436: Convolution is proper bounded pushforward, and the trace comparison uses this geometric construction. Gross, §2–§3 pp3–7, measure convention quoted in §3: The imported classical transform uses a specified compact-subgroup Haar normalization; no new transform is constructed here.

**Acceptance.** For a torus, the two weight indicator functions convolve to the sum-weight indicator. Rescaling Haar measure would change the product and destroy the unit test.

### Frobenius trace and normalized constant terms

**Declaration:** `GeometricSatakeAndFusion:GS4:classical-Satake-comparison/trace-constant-term` (theorem).

In the split case choose B=TN and dn on N(E) with vol(N(O_E))=1. The classical transform imported from SR.4 is S(f)(t)=δ_B(t)^{1/2}∫_N f(tn)dn, where δ_B(λ(π))^{1/2}=q^{-⟨ρ,λ⟩}. For a Frobenius-descended normalized IC object, S(τ_A) is the weight-by-weight Frobenius character of its normalized cohomology fibre, with the shifted constant-term degree ⟨2ρ,λ⟩ and the matching half Tate normalization included. Here normalized fibre means the weight fibre of the transported normalized dual representation: the geometric cohomological Weil twist must be undone; it is not the unmodified ungraded total-cohomology trace. The corresponding statement for a Levi uses deg_P and the difference ρ_G−ρ_M. For unramified nonsplit G descend this formula using the relative Weyl/Frobenius datum supplied by SR.4; the split integral over N is not copied verbatim with absolute weights.

**Proof route.** The compact-support trace formula on each semi-infinite weight intersection turns CT into the N-integral. Cohomological degree shift gives (-1)^{deg}, and the normalized half twist and Haar modulus give q^{-⟨ρ,λ⟩}. Apply Zhu (2.2.7)–(2.2.10) to the IC weight calculation. Track ordinary character rather than a supercharacter using the parity correction. For nonsplit unramified groups use the Frobenius-equivariant model and relative SR.4 transform; the exact descent/source adapter is recorded as a gap.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS4:classical-Satake-comparison/normalized-frobenius-function`, `GeometricSatakeAndFusion:GS3:fusion/symmetric-constant-term`, `GeometricSatakeAndFusion:GS4:integral-dual-group/levi-naturality`, `SchemeAndStackFoundations:SF.2`, `SmoothRepresentationsOfLocalGroups:SR.4`, `ReductiveGroupsPartII:RG2.5`.

**Source match.** Gross, §3 pp6–8, equations (3.4), (3.5), (3.6): Exact classical modulus and transform conventions. Zhu, §2.2 pp434–436, equations (2.2.7)–(2.2.10): The rational IC/weight calculation underlying classical comparison, not a construction of integral fusion.

**Acceptance.** For a split torus N=1 and δ=1, so the transform is identity on weight indicators. For a split minuscule μ, the coefficient of each extremal weight matches the normalized representation character; omitting the half twist inserts q^{⟨ρ,μ⟩}.

### Classical and geometric Satake comparison

**Declaration:** `GeometricSatakeAndFusion:GS4:classical-Satake-comparison/classical-satake-comparison` (theorem). Atlas planet: Classical Satake comparison.

For the unramified/hyperspecial finite-field setting, the diagram from Frobenius-descended rational Satake objects to spherical Hecke functions by τ and to normalized dual representations by Satake commutes with the SR.4 spherical transform and Frobenius character on the dual torus. In the split IC basis with its canonical constant-sheaf Frobenius descent, S(τ_{IC_μ})=χ_μ and S(1_{Kμ(π)K})=q^{⟨ρ,μ⟩}χ_μ plus lower dominant characters; for minuscule μ the lower terms vanish. The nonsplit statement uses the appropriate Frobenius-twisted/relative character datum of SR.4. Both constructions precede this comparison; none of integral reconstruction, rational reductivity, SR.4 or fusion depends on it.

**Proof route.** Use the normalized trace/constant-term equality to identify all weight coefficients with the dual character, then apply the already constructed SR.4 isomorphism. The IC leading term is r^{-d_μ} times the top double-coset indicator, so the triangular comparison agrees with Gross (3.9)–(3.13) and Zhu (2.2.7)–(2.2.10). Descend the commuting diagram with Frobenius and the pinned action in the unramified nonsplit case. Keep this source match as a named refinement rather than pretending the split Gross preprint proves it.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS4:integral-dual-group/normalized-satake-equivalence`, `GeometricSatakeAndFusion:GS4:classical-Satake-comparison/trace-convolution`, `GeometricSatakeAndFusion:GS4:classical-Satake-comparison/trace-constant-term`, `GeometricSatakeAndFusion:GS4:rational-reductivity/rational-semisimplicity`, `SmoothRepresentationsOfLocalGroups:SR.4`.

**Source match.** Gross, §3 pp7–8, Proposition 3.6 and (3.13): The triangular and minuscule classical formulas. Zhu, §2.2 pp434–436, (2.2.7)–(2.2.10): The geometric IC character comparison provides the downstream rational bridge.

**Acceptance.** For G_m and weight n both paths give z^n. For PGL₂ minuscule μ, S(r^{-1}1_{Kμ(π)K}) is the SL₂ standard character z+z^{-1}. An unnormalized odd perverse trace would give its negative and fails the comparison.

## Supplier contracts and open refinements

The stage-level requests below are used only where no exact finer node supplies the statement. Every request names its consumers in the packet. Existing supplier nodes with stricter or different scope are not treated as sufficient.

- **`VStackSheavesAndLisseCategories:VS1`.** IV.7.3 equivalence D_Lc(X×BW_E^I,Λ) ≅ D_Lc(X×(Div¹)^I,Λ) for locally constant perfect complexes, with degree-zero finite-projective specialization; positive-codimension partial-diagonal purity; ULA/hyperbolic-localization base change. Preserve the distinction from all D_et and explicitly identify the transported Tate character and its stalk/parameter action convention. Needed by `GS3:fusion/disjoint-leg-factorization-and-full-faithfulness`, `GS3:fusion/drinfeld-fibre-realization`, `GS4:integral-dual-group/dual-group-identification`.
- **`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`.** Local Weil group W_E, topology, inertia and geometric-Frobenius degree, product continuous finite-projective representation categories and Tate character convention. Existing Tau Ceti owner is imported, never reconstructed here. Needed by `GS3:fusion/drinfeld-fibre-realization`.
- **`ReductiveGroupsPartII:RG2.5`.** Pinned integral dual group/root datum, simple Levi and central-isogeny dual maps, finite pinned Weil action, product/Weil-restriction dual data, half-sum cocharacters and import the characteristic-zero highest-weight convex-hull bounds from the existing ReductiveGroups representation theory. Expose that upstream supplier rather than duplicate it in RG2.5. This is RG2.5, not the buildings or double-coset stage. Also the pinned split dual group over a characteristic-zero field with its dual Borel B̂ ⊃ T̂, as used by Zhu's §0.5 notation. Needed by `GS3:fusion/support-parity`, `GS3:fusion/symmetric-constant-term`, `GS4:rational-reductivity/generic-fibre-reductivity`, `GS4:integral-dual-group/torus-and-rank-one-identification`, `GS4:integral-dual-group/generic-root-datum`, `GS4:integral-dual-group/dual-group-identification`, `GS4:integral-dual-group/normalized-satake-equivalence`, `GS4:integral-dual-group/levi-naturality`, `GS4:integral-dual-group/adjoint-isomorphism-naturality`, `GS4:integral-dual-group/product-naturality`, `GS4:integral-dual-group/weil-restriction-naturality`, `GS4:classical-Satake-comparison/trace-constant-term`, `GS4:integral-dual-group/witt-rational-satake-equivalence`.
- **`ReductiveGroupsPartII:RG2.3`.** Prasad–Yu closed-immersion criterion (author preprint Cor1.3, published Cor5.2 cited by FS VI11.4): R a DVR, H/R reductive, H′/R affine finite type, f:H→H′ generically a closed immersion; assume residue characteristic ≠2 OR no normal algebraic subgroup of H_{K̄} is isomorphic to SO_{2n+1} (n≥1). Then f is a closed immersion. Simple connectedness of the generic derived group suffices at characteristic two. Add this general theorem alongside the existing Bruhat–Tits/parahoric material in RG2.3. Needed by `GS4:integral-dual-group/integral-recovery-and-adjoint-reduction`.
- **`ReductiveGroupsPartII:RG2.0`.** For split Chevalley groups over Z̆_ℓ, integral points are the hyperspecial/maximal bounded subgroup and preserve a lattice in a given finite-dimensional generic representation; identify continuity and completed-unramified conventions. Needed by `GS4:integral-dual-group/integral-recovery-and-adjoint-reduction`.
- **`ReductiveGroupsPartII:RG2.4`.** The split Chevalley integral points over Z̆_ℓ are generated by the dual torus and rank-one Levi integral points; provide the Iwasawa/root-subgroup argument used in FS VI11.1. Include the torus in rank zero. Needed by `GS4:integral-dual-group/integral-recovery-and-adjoint-reduction`.
- **`tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups`.** For finite-type connected affine groups in characteristic zero, semisimplicity of finite-dimensional representations implies reductivity (equivalently linear reductivity here). Apply this existing upstream criterion only after the MC.6/DM finite-type and connectedness steps; do not attribute a general infinite pro-group theorem to this finite-type stage. Needed by `GS4:rational-reductivity/generic-fibre-reductivity`.
- **`tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`.** Pinned integral Chevalley–Demazure groups and isomorphism classification by based root datum, rank-one root maps and the pinned Chevalley involution; cite the existing upstream construction. By base change, also the isomorphism theorem for pinned split reductive groups over a field of characteristic zero, used by the rational Witt equivalence. Needed by `GS4:integral-dual-group/torus-and-rank-one-identification`, `GS4:integral-dual-group/generic-root-datum`, `GS4:integral-dual-group/integral-recovery-and-adjoint-reduction`, `GS4:integral-dual-group/chevalley-involution`, `GS4:integral-dual-group/witt-rational-satake-equivalence`.
- **`EtaleDualityAndPerverseSheaves:EDC.7`.** Rational pure-IC/decomposition theorem for the finite-type proper models/resolutions of bounded Witt Schubert spaces over an algebraic closure of a finite field, with parity/IC-boundary calculation and transport through perfection. No integral/mod-ℓ or arithmetic Weil semisimplicity. Needed by `GS4:rational-reductivity/rational-semisimplicity`.
- **`LanglandsParameterStacks:LP3`.** General integral highest-weight theorem implying relative base change Perf(B(Ĝ⋊Q)^I_{Z_ℓ[r]}) tensor over Perf(BQ^I_{Z_ℓ[r]}) with Perf(BQ^I_Λ) ≅ Perf(B(Ĝ⋊Q)^I_Λ), for every ℓ≠p and coefficient Z_ℓ[r]-algebra Λ, without inverting π₁(Ĝ) torsion or |Q|. Existing prime-to-ℓ solvable Donkin-subgroup generation does not supply this theorem. Needed by `GS4:integral-dual-group/enhanced-perfect-satake-extension`.
- **`LanglandsParameterStacks:LP4`.** Universal stable idempotent completion of the exact category of finite-projective (Ĝ⋊Q)^I representations is Perf(B(Ĝ⋊Q)^I), with exact linear monoidal functor extension and finite-set coherence. This is the ordinary classifying-stack input of FS IX2 p321, not the parameter-stack Perf generation theorem subject to ℓ∤|π₁(Ĝ)_tors|. Needed by `GS4:integral-dual-group/enhanced-perfect-satake-extension`.
- **`SmoothRepresentationsOfLocalGroups:SR.4`.** Already constructed spherical Hecke algebra and normalized Satake transform for unramified G/E and hyperspecial K, vol(K)=1, vol(N(O_E))=1, δ_B(λ(π))^{1/2}=q^{-⟨ρ,λ⟩}; specify split and nonsplit relative/Frobenius-twisted versions and sqrt(q). This packet only compares with it. Needed by `GS4:classical-Satake-comparison/normalized-frobenius-function`, `GS4:classical-Satake-comparison/trace-convolution`, `GS4:classical-Satake-comparison/trace-constant-term`, `GS4:classical-Satake-comparison/classical-satake-comparison`.
- **`SchemeAndStackFoundations:SF.2`.** Integrate the existing CohomologicalPointCounting/PR196 TraceFormula finite-field constructible trace theorem, together with proper/compact-support pushforward and Künneth, on finite-type bounded models, with geometric Frobenius and Q_ℓ(1) eigenvalue q^{-1}. Supply the exact site/perfection comparison; do not construct another general trace formula. Needed by `GS4:classical-Satake-comparison/normalized-frobenius-function`, `GS4:classical-Satake-comparison/trace-convolution`, `GS4:classical-Satake-comparison/trace-constant-term`.
- **`ReductiveGroupsPartII:RG2.0a`.** Finite separable affine group-scheme Weil restriction, its base-change/product-of-conjugates and induced Weil action, with compatibility of field-specific divisors and residue degree. Needed by `GS4:integral-dual-group/weil-restriction-naturality`.
- **`VStackSheavesAndLisseCategories:VS3`.** The enhanced D■ coefficient interpretation, adic reduction and scalar extension for local Hecke stacks over Z_ℓ[r]-algebras, and the relative D(A)^∨ kernel comparison used in IX2. Needed by `GS4:integral-dual-group/enhanced-perfect-satake-extension`.
- **`DiamondSixOperations:S6`.** Relative Verdier duality on the bounded constructible local Hecke charts with the eligible coefficient/base hypotheses; compare its ℓ-adic extension with the enhanced internal dual. The source S6 alone does not assert arbitrary-ring enhanced biduality. Needed by `GS4:integral-dual-group/enhanced-perfect-satake-extension`.
- **`LanglandsParameterStacks:LP3`.** Characteristic-zero specialization of the highest-weight theory: for a split connected reductive group over a field of characteristic zero, the irreducible finite-dimensional representations are the V_μ, one for each dominant weight μ, and V_μ has highest weight μ with multiplicity one; over such a field the Weyl module of μ is V_μ. The convex-hull bound on weights is the RG2.5 import used by generic-root-datum, not requested here. Needed by `GS4:integral-dual-group/witt-rational-satake-equivalence`.
- **`tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`.** For an affine algebraic group H over a field, the identity component H° is a normal subgroup with finite étale quotient π₀(H), trivial exactly when H is connected. For a closed subgroup scheme H of an affine algebraic group over a perfect field of characteristic p, the image of H under a sufficiently high power of the relative Frobenius is reduced, equals the Frobenius twist of the reduced subgroup of H, and is a quotient of H, so its representations pull back to H. Used in characteristic ℓ, including ℓ = 2. Needed by `GS4:integral-dual-group/rank-one-integral-identification`.
- **`tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.** Smooth connected closed subgroups of SL₂ over a field that contain the diagonal torus T are T, the two Borel subgroups containing T and SL₂; each Borel is its own normalizer; N(T)/T ≅ Z/2, generated by the class of w with w² = −1, and the extension splits exactly in characteristic two. Needed by `GS4:integral-dual-group/rank-one-integral-identification`.
- **`LanglandsParameterStacks:LP3`.** Tilting modules of SL₂ over a field of characteristic p, used at p = 2: indecomposable tilting modules T(n) and their characters; Donkin's tensor product formula T(2p^a − 2 + p^a λ) ≅ T(2p^a − 2) ⊗ T(λ)^{[a]}; the restriction of T(2p^a − 2) to the a-th Frobenius kernel is the injective hull of the trivial module; tensor powers of the natural representation are tilting; and for a module with a good filtration the dimension of the invariants is its ∇(0)-multiplicity, equal to the characteristic-zero multiplicity of the trivial representation. Needed by `GS4:integral-dual-group/rank-one-integral-identification`.

All six stages have coverage **planned**; none is declared closed. Their remaining lists name the gaps below.

- `GeometricSatakeAndFusion:GS3`: planned; remaining: Formal geometric and enhanced carriers in the suggested signatures; Drinfeld and Frobenius convention adapter.
- `GeometricSatakeAndFusion:GS3:fusion`: planned; remaining: Formal geometric and enhanced carriers in the suggested signatures; Drinfeld and Frobenius convention adapter.
- `GeometricSatakeAndFusion:GS4`: planned; remaining: Formal geometric and enhanced carriers in the suggested signatures; Drinfeld and Frobenius convention adapter; Bounded adjunction coefficient and coequalizer verification; RG2.3 needs the general Prasad–Yu scope addition; General relative Perf(BG) suppliers at all primes; Enhanced convolution and coefficient duality adapter; Classical comparison on unramified nonsplit groups; Finite-model Frobenius trace handoff; Weil-restriction local tensor comparison; Integral-point supplier refinement; Rank-one special-fibre image at ℓ = 2; Zhu's equivalence outside the FS comparison.
- `GeometricSatakeAndFusion:GS4:classical-Satake-comparison`: planned; remaining: Formal geometric and enhanced carriers in the suggested signatures; Classical comparison on unramified nonsplit groups; Finite-model Frobenius trace handoff.
- `GeometricSatakeAndFusion:GS4:integral-dual-group`: planned; remaining: Formal geometric and enhanced carriers in the suggested signatures; Drinfeld and Frobenius convention adapter; Bounded adjunction coefficient and coequalizer verification; RG2.3 needs the general Prasad–Yu scope addition; General relative Perf(BG) suppliers at all primes; Enhanced convolution and coefficient duality adapter; Weil-restriction local tensor comparison; Integral-point supplier refinement; Rank-one special-fibre image at ℓ = 2; Zhu's equivalence outside the FS comparison.
- `GeometricSatakeAndFusion:GS4:rational-reductivity`: planned; remaining: Formal geometric and enhanced carriers in the suggested signatures; Zhu's equivalence outside the FS comparison.

### Formal geometric and enhanced carriers in the suggested signatures

Pinned libraries lack Div¹ local Hecke diamonds, flat-perverse ULA Satake categories, continuous Weil local systems, affine root-pinned integral dual identification and the stable enhanced D■/Perf(BG) carriers. The suggested file uses the imported carriers as category/type parameters, with every missing geometric or enhanced hypothesis explicitly omitted and named in comments. It gives no replacement Prop certificate. Actual formal carrier and condition signatures remain a refinement for each node; the numerical locus/parity/trace conventions can already be expressed.

Needed by `GS3:fusion/disjoint-leg-locus`, `GS3:fusion/disjoint-leg-factorization-and-full-faithfulness`, `GS3:fusion/support-parity`, `GS3:fusion/fusion-product-and-sign-rule`, `GS3:fusion/finite-set-functoriality-and-constant-terms`, `GS3:fusion/drinfeld-fibre-realization`, `GS3:fusion/symmetric-constant-term`, `GS3:fusion/fusion-verdier-duality`, `GS4:integral-dual-group/tannakian-left-adjoint`, `GS4:integral-dual-group/relative-tannaka-hypotheses`, `GS4:integral-dual-group/geometric-coordinate-hopf-algebra`, `GS4:integral-dual-group/multileg-and-coefficient-reconstruction`, `GS4:rational-reductivity/rational-semisimplicity`, `GS4:rational-reductivity/generic-fibre-reductivity`, `GS4:integral-dual-group/torus-and-rank-one-identification`, `GS4:integral-dual-group/generic-root-datum`, `GS4:integral-dual-group/integral-recovery-and-adjoint-reduction`, `GS4:integral-dual-group/dual-group-identification`, `GS4:integral-dual-group/normalized-satake-equivalence`, `GS4:integral-dual-group/levi-naturality`, `GS4:integral-dual-group/adjoint-isomorphism-naturality`, `GS4:integral-dual-group/product-naturality`, `GS4:integral-dual-group/weil-restriction-naturality`, `GS4:integral-dual-group/chevalley-involution`, `GS4:integral-dual-group/enhanced-perfect-satake-extension`, `GS4:classical-Satake-comparison/normalized-frobenius-function`, `GS4:classical-Satake-comparison/trace-convolution`, `GS4:classical-Satake-comparison/trace-constant-term`, `GS4:classical-Satake-comparison/classical-satake-comparison`, `GS4:rational-reductivity/witt-rational-tannakian-category`, `GS4:integral-dual-group/witt-rational-satake-equivalence`, `GS4:integral-dual-group/rank-one-integral-identification`.

### Drinfeld and Frobenius convention adapter

VS1 has ULA nodes but no finer IV7.3 node matching the full locally constant perfect Drinfeld statement. Request that exact statement and the action of the Tate root line under its equivalence. Check the contravariant stalk-action convention against the positive-power parameter formula in IX7.1 before a formal normalized Levi comparison; do not silently equate the two actions.

Needed by `GS3:fusion/drinfeld-fibre-realization`, `GS4:integral-dual-group/normalized-satake-equivalence`, `GS4:integral-dual-group/levi-naturality`.

### Bounded adjunction coefficient and coequalizer verification

The source VI10.1 proof uses standard/costandard objects and a uniform coefficient-independent ℓ-torsion bound in VI7.5; the early Satake node supplies their carrier but does not isolate this bound or the full ℓ-adic adapter. The outlined proof here must be refined to establish the bound, coefficient inverse-limit compatibility and preservation (not just reflection) of F-split coequalizers required by the MC executable adapter.

Needed by `GS4:integral-dual-group/tannakian-left-adjoint`, `GS4:integral-dual-group/relative-tannaka-hypotheses`, `GS4:integral-dual-group/geometric-coordinate-hopf-algebra`, `GS4:integral-dual-group/multileg-and-coefficient-reconstruction`.

### RG2.3 needs the general Prasad–Yu scope addition

Current RG2.3 scope is parahoric/congruence models and does not yet explicitly own the general affine finite-type closed-immersion theorem. The request records its exact no-normal-SO-odd hypothesis and proposes this single owner. The GS application retains its G_ad reduction for ℓ=2.

Needed by `GS4:integral-dual-group/integral-recovery-and-adjoint-reduction`, `GS4:integral-dual-group/dual-group-identification`.

### General relative Perf(BG) suppliers at all primes

LP3 existing Donkin nodes require a prime-to-ℓ solvable group; LP4 existing parameter-stack generation/colimit nodes require the dual fundamental-group exclusion. Neither supplies the general FS IX2 p321 relative classifying-stack base-change and free stable completion used here. Requested LP3/LP4 additions must be proved with their all-ℓ≠p scope and Q-equivariant coefficient hypotheses.

Needed by `GS4:integral-dual-group/enhanced-perfect-satake-extension`.

### Enhanced convolution and coefficient duality adapter

D■ convolution is an enhanced monoidal structure using pullback/tensor/π♮, and its relation to ordinary perverse convolution is A↦D(A)^∨ with specified relative Verdier duality. S6/VS3 need the exact general coefficient adapter. Symmetry is carried by the Satake image, not asserted on the whole enhanced convolution category.

Needed by `GS4:integral-dual-group/enhanced-perfect-satake-extension`.

### Classical comparison on unramified nonsplit groups

Gross supplies the split transform normalization and Zhu the split Witt IC calculation. The source-to-node proof for the unramified nonsplit Frobenius/relative Weyl version is not established from those excerpts alone. SR4 supplies the classical nonsplit transform; refine its geometric trace-descent comparison with the pinned Weil action and relative weights, without using this comparison as an input to either theorem.

Needed by `GS4:classical-Satake-comparison/trace-constant-term`, `GS4:classical-Satake-comparison/classical-satake-comparison`.

### Finite-model Frobenius trace handoff

The classical bridge requires a Frobenius-equivariant finite-type special-fibre model and the existing ordinary constructible trace theorem, not only geometric ULA equivalence. SF.2 integrates these suppliers but no exact trace/model transport node is isolated in its current packet; the request records the needed contract and the missing source-level adapter.

Needed by `GS4:classical-Satake-comparison/normalized-frobenius-function`, `GS4:classical-Satake-comparison/trace-convolution`, `GS4:classical-Satake-comparison/trace-constant-term`.

### Weil-restriction local tensor comparison

IX6.3 gives the precise chosen-embedding inflation/induction and local Grassmannian map. A detailed compatibility of that procedure with the field-specific half-root choices and multi-leg factorization remains to be refined. Finite-index induction is not itself a strong monoidal functor; the comparison must retain the conjugate-leg geometric diagram.

Needed by `GS4:integral-dual-group/weil-restriction-naturality`.

### Integral-point supplier refinement

RG2.0 supplies local/integral point topology and RG2.4 supplies Iwasawa/Cartan decompositions, but their present stage text does not explicitly give lattice preservation, hyperspecial maximal boundedness and torus/rank-one generation over the completed maximal unramified coefficient DVR used in VI.11.1 p238. The existing requests identify the stronger exact contract; these remain scope additions or imported upstream consequences to expose, not an already matching node.

Needed by `GS4:integral-dual-group/integral-recovery-and-adjoint-reduction`.

### Rank-one special-fibre image at ℓ = 2

FS Lemma VI.11.2 does not exclude, at ℓ = 2, a special-fibre image whose reduced subgroup is the normalizer of the diagonal torus (source issue E8). The replacement argument counts invariants in tensor powers. Its group-theoretic inputs are requested from LP3 (tilting modules of SL₂ in characteristic two) and from the Tau Ceti ReductiveGroups layers 3 and 7. Its geometric input is isolated by no supplier node: with F₂ coefficients, Hom(1, B₁^{⋆n}) is the top Borel–Moore homology of the fibre over the base point of the semismall n-step convolution map, computed on the Witt special fibre and transported through the one-leg comparison. The rational Witt equivalence uses only the generic fibre and is not affected.

Needed by `GS4:integral-dual-group/rank-one-integral-identification`, `GS4:integral-dual-group/integral-recovery-and-adjoint-reduction`, `GS4:integral-dual-group/dual-group-identification`.

### Zhu's equivalence outside the FS comparison

Zhu states his equivalence for any algebraically closed k and any finite totally ramified F over W(k)[1/p], and for his own monoidal structure on H*. The comparison planned here covers k an algebraic closure of F_p, with the monoidal structure transported from fusion. A larger algebraically closed k needs either the invariance of these equivariant perverse categories under extension of algebraically closed base field, which no supplier node states, or Zhu's own Gelfand proof, routed to the Part II design (DESIGN-GeometricSatakeAndFusionPartII). That design must also state its rational equivalence for its own monoidal structure, or prove that the two monoidal structures on H* agree.

Needed by `GS4:rational-reductivity/witt-rational-tannakian-category`, `GS4:integral-dual-group/witt-rational-satake-equivalence`.

## Structure, red-team findings and source corrections

The four confirmed red-team findings handed to this job are handled as follows.

- **RT-AREA-geomlanglands/1** (closure before fusion). The fusion nodes import monoidal convolution and dualizability from the GS2:Satake-closure nodes of the GS0 packet, as FS VI.8 precedes VI.9. The first proposal below reverses the atlas edge between GS2:Satake-closure and GS3:fusion.
- **RT-AREA-geomlanglands/16** (Prasad–Yu). The general closed-immersion criterion, with its residue-characteristic-two condition, is requested from RG2.3 next to the Bruhat–Tits material there, so that both Prasad–Yu inputs have one owner. The adjoint reduction at ℓ = 2 is part of the integral recovery node. This round also corrects the ℓ = 2 rank-one step on which that recovery rests (source issue E8).
- **RT-AREA-geomlanglands/17** (Tannakian reconstruction planned twice). The integral reconstruction imports the four relative MC.6 nodes, and the rational Witt category imports MC.6's neutral reconstruction node. The DM finiteness and connectedness criteria are imported from MC.6's recognition nodes. No reconstruction theorem is planned here.
- **RT-AREA-geomlanglands/19** (owner of the perfect-complex extension). GS4:integral-dual-group owns the local extension, with requests to LP3 for highest-weight base change and to LP4 for the stable completion at all primes ℓ ≠ p; HS1 imports the export. The integral highest-weight theory is imported from LP3 only, never from a second owner.

The packet records these restructuring proposals.

- **rescope** (GeometricSatakeAndFusion). RT-AREA-geomlanglands/1: the atlas edge GS3:fusion→GS2:Satake-closure conflicts with FS VI8 preceding VI9 and would make imported rigidity cyclic. Proposal: Remove GS3:fusion as a prerequisite of GS2:Satake-closure; rename its title from Closure after fusion to Convolution closure and rigidity. Add GS2:Satake-closure→GS3:fusion. Preserve the independent VI8 two-leg degeneration proof, which does not use the constructed VI9 fusion tensor.
- **rescope** (ReductiveGroupsPartII, LanglandsParameterStacks, GeometricSatakeAndFusion). RT-AREA-geomlanglands/16 and /19 identify inputs not covered by the present supplier statements. Proposal: Add general Prasad–Yu Cor5.2 (author preprint Cor1.3) to RG2.3 alongside PY02/Bruhat–Tits. Add general classifying-stack highest-weight base change to LP3 and free stable exact representation completion to LP4, separately from their restricted parameter-stack generation. GS4 retains only the Satake applications; HS1 imports its enhanced kernel export.
- **rescope** (GeometricSatakeAndFusion, GeometricSatakeAndFusionPartII). The Zhu route (PAPER-ZHU-17 route 18) sends Zhu's Gelfand symmetry proof to a Part II and asks it to export that symmetry to the GS4 rational equivalence. GS4 now plans the rational Witt equivalence (GS4:integral-dual-group/witt-rational-satake-equivalence) with the monoidal structure on H* transported from fusion. Zhu's monoidal structure (Proposition 2.20, from equivariant bimodules) and his constraint (Proposition 2.21) are a different construction; Zhu states without proof that the three known monoidal structures agree in equal characteristic (§2.3.1), and neither source proves that the mixed-characteristic structures agree. Proposal: The Part II design states its rational Witt equivalence for its own monoidal structure on H* and imports the GS4 node only for comparison, or plans the agreement of the two monoidal structures as a theorem of its own; it does not feed its symmetry into GS4 as a prerequisite. GS4 keeps the transported statement and the FS degeneration proof. The Part II also owns Zhu's equivalence for algebraically closed k larger than an algebraic closure of F_p, unless the invariance of these categories under extension of algebraically closed base field is planned elsewhere.

The source issues found or reused are recorded in the packet with their searches. Each is stated in our own words.

- **GeometricSatakeAndFusion/E1** (misprint; FS, Author-hosted 356-page PDF, VI.11.1 rank-one proof, printed p237; affects the proof). The source describes it as a split torus having the specified character group. Correction: Use the split diagonalizable group with character group π₁(G); it is a torus only when this character group is torsion-free. Reason: For G=PGL₂ the preceding text gives π₁(G)=Z/2, whose diagonalizable group is μ₂. No torus has torsion character group. The fibre-product/component-grading argument is valid with diagonalizable groups. Status: new.
- **GeometricSatakeAndFusion/E2** (misprint; FS, Chapter VI, §VI.10, proof of Proposition VI.10.2, p. 234 (author-hosted 356-page copy, same passage as arXiv v4); affects nothing). Under rigidity of 𝒞, the source claims that 𝒜 has an inverse. It gives F(X_i)^∨ ≅ F(X_i^∨) ≅ ℋom(X_i, X_i^∨) ≅ ℋom(X_i ⊗ X_i, 1); swapping the factors is said to supply the required involution of 𝒜. Correction: The antipode belongs to the reconstructed algebra ℋ, not to the base category 𝒜: under rigidity of 𝒞 the displayed chain of identifications for F(X_i)^∨, followed by exchanging the two factors, gives an involution of each F(X_i)^∨, and these assemble to the antipode of ℋ. Reason: 𝒜 is the base symmetric monoidal category and is not inverted anywhere. The object under construction is ℋ = colim F(X_i)^∨: the two preceding sentences of the proof give it a commutative multiplication and then call it a Hopf algebra. The inverse that is needed is the antipode of ℋ, induced on each F(X_i)^∨ by the displayed isomorphisms. Status: PAPER-FARGUES-SCHOLZE-21/E46 (already recorded and independently confirmed in the atlas; not a newly discovered erratum).
- **GeometricSatakeAndFusion/E3** (misprint; FS, Chapter VI, §VI.10, proof of Proposition VI.10.2, p. 234, first sentence of the page's second paragraph (author-hosted 356-page copy, same passage as arXiv v4); affects nothing). The source claims that unpacking the definitions gives ℋ a Hopf algebra structure, with 𝒞 precisely its symmetric monoidal representation category in 𝒜. Correction: Unwinding the definitions gives ℋ only a bialgebra structure, with 𝒞 equal to its symmetric monoidal category of representations in 𝒜; ℋ becomes a Hopf algebra once the antipode is obtained from rigidity in the next step. Reason: In general Proposition VI.10.2 asserts only a bialgebra structure on ℋ, with commutative multiplication and associative comultiplication; it asserts a Hopf structure only under the additional hypothesis that 𝒞 is rigid, and the proof produces the antipode in the next sentence from that hypothesis. Without rigidity ℋ need not be Hopf: with 𝒜 = Vect_k and 𝒞 the finite-dimensional comodules of the bialgebra 𝒪(M_n) of the matrix monoid (a filtered union of comodule categories of finite-dimensional subcoalgebras, each represented by the dual algebra), ℋ = 𝒪(M_n) has no antipode. The next sentence carries PAPER-FARGUES-SCHOLZE-21/E46; the two could be merged. Status: PAPER-FARGUES-SCHOLZE-21/E108 (already recorded and independently confirmed in the atlas; not a newly discovered erratum).
- **GeometricSatakeAndFusion/E4** (misprint; FS, Chapter VI, §VI.11, proof of Lemma VI.11.3, p. 237 (author-hosted 356-page copy, same passage as arXiv v4); affects nothing). In the proof the element of N to be divided by a power of ℓ is introduced as x, but the equation is then written ℓ^k n = f(m), with n never defined. Correction: The element to be divided is x itself: for x ∈ N choose the least k such that ℓ^k·x lies in f(M), say ℓ^k·x = f(m). The letter n in the printed sentence should be x. Reason: The element of N is named x in the same sentence; n is never introduced. Status: PAPER-FARGUES-SCHOLZE-21/E48 (already recorded and independently confirmed in the atlas; not a newly discovered erratum).
- **GeometricSatakeAndFusion/E5** (misprint; FS, Chapter VI, §VI.11, proof of Theorem VI.11.1, p. 237, last paragraph (author-hosted 356-page copy, same passage as arXiv v4); affects nothing). In the step for a simple coroot a, the parabolic attached to the minimal Levi M_a is written as a subgroup of B (P_a ⊂ B). Correction: The parabolic attached to M_a contains the Borel: P_a ⊃ B, not P_a ⊂ B. Reason: A parabolic whose Levi M_a strictly contains T strictly contains a Borel, so P_a ⊂ B is impossible. On p239, in the canonical-pinning argument, the source has the containment the right way round (P_a contains B, with Levi M_a). Status: PAPER-FARGUES-SCHOLZE-21/E49 (already recorded and independently confirmed in the atlas; not a newly discovered erratum).
- **GeometricSatakeAndFusion/E6** (misprint; FS, Chapter IX, §IX.6.2, Proposition IX.6.2, p. 331, top row of the diagram (author-hosted 356-page copy, same passage as arXiv v4); affects nothing). 𝒵^spec(G₁, Λ) ⊗_Λ 𝒵^spec(G₂, Λ) ⟶ 𝒵^geom(G₁, Λ) ⊗_Λ 𝒵^geom(G₁, Λ). Correction: 𝒵^spec(G₁, Λ) ⊗_Λ 𝒵^spec(G₂, Λ) ⟶ 𝒵^geom(G₁, Λ) ⊗_Λ 𝒵^geom(G₂, Λ). Reason: The horizontal map is the tensor product of the maps for G₁ and G₂, so the second factor must be 𝒵^geom(G₂, Λ). Status: PAPER-FARGUES-SCHOLZE-21/E66 (already recorded and independently confirmed in the atlas; not a newly discovered erratum).
- **GeometricSatakeAndFusion/E7** (misprint; FS, Chapter IX, §IX.6.2, Proposition IX.6.2, second paragraph, p. 331 (author-hosted 356-page copy, same passage as arXiv v4); affects nothing). In the consequence stated after the diagram, A₁ and A₂ are both taken in D_lis(Bun_G, L) for the product group G, while the conclusion assigns to a constituent of A₁ ⊠ A₂ the parameter (φ_{A₁}, φ_{A₂}) into Ĝ₁(L) × Ĝ₂(L). Correction: The two objects live over the two factors: A₁ is an object of D_lis(Bun_{G₁}, L) and A₂ an object of D_lis(Bun_{G₂}, L), so that A₁ ⊠ A₂ lies over Bun_{G₁} × Bun_{G₂} = Bun_G. Reason: A₁ ⊠ A₂ lies on Bun_G = Bun_{G₁} × Bun_{G₂}, and φ_{A_i} has values in Ĝ_i. So A_i must be a sheaf on Bun_{G_i}, as in Proposition VII.7.10. Status: PAPER-FARGUES-SCHOLZE-21/E67 (already recorded and independently confirmed in the atlas; not a newly discovered erratum).
- **GeometricSatakeAndFusion/E8** (error; FS, Chapter VI, §VI.11, Lemma VI.11.2 and its proof, p. 237 (author-hosted 356-page copy, same text as arXiv v4); affects a stated result). The lemma says that a closed subgroup H of SL₂ over F_ℓ which contains the diagonal torus, and whose irreducible representations are told apart by their highest weights (all in Z≥0), is all of SL₂. The proof reduces to reduced H and then deduces that H is connected from Deligne–Milne, Corollary 2.22, and highest weights. Correction: The lemma holds for ℓ odd. For ℓ = 2 its hypotheses give only that H = SL₂ or that the reduced subgroup of H is N(T), the normalizer of the diagonal torus T: N(T) and its preimages under powers of the Frobenius isogeny satisfy them. In the proof of Theorem VI.11.1 for G = PGL₂ the second case can be excluded by counting invariants. If H lies in the a-th Frobenius preimage of N(T), put n = 6·2^a − 2: the tilting module T(n), a summand of V^{⊗n}, has nonzero H-invariants but no SL₂-invariants, so V^{⊗n} would have more invariants than in characteristic zero. But Hom(1, B₁^{⋆n}) with F₂ coefficients has exactly the characteristic-zero dimension, since it is the top Borel–Moore homology of the fibre over the base point of the n-step convolution map. Reason: For ℓ = 2, N(T) = T ⋊ Z/2 is a closed subgroup of SL₂ over F₂ containing T. Its irreducible representations are the trivial one and, for each n ≥ 1, the two-dimensional induced representation with weights ±n: a weight-zero irreducible is a representation of Z/2, and in characteristic two only the trivial one is irreducible. The highest weights 0, 1, 2, … are distinct, so N(T) satisfies the hypothesis, but N(T) ≠ SL₂. The non-reduced preimage of N(T) under the Frobenius isogeny is a second counterexample: its irreducibles also have highest weights 0, 1, 2, … once each. The proof fails at the connectedness step: Deligne–Milne Corollary 2.22 assumes characteristic zero, and for ℓ = 2 the component group of N(T) contributes no second irreducible of highest weight zero. For ℓ odd its sign character does, and after replacing H by its reduced image under a high power of Frobenius the remaining cases (T, the two Borels) have irreducibles of negative highest weight, so the lemma is true for ℓ odd. With the invariant count above, which uses the tilting theory of SL₂ in characteristic two, Theorem VI.11.1 survives at ℓ = 2. Status: new.
- **GeometricSatakeAndFusion/E9** (misprint; Zhu, §0.2 pp407–408, setting of Theorem 0.3 (publisher PDF); affects nothing). The introduction states the Satake equivalence of Theorem 0.3 for a reductive group over O without requiring the residue field k to be algebraically closed. Correction: Assume that k is algebraically closed and G connected reductive, as Section 2 does on p429; equivalently, base change the affine Grassmannian to an algebraic closure of k. Reason: Over a finite k the equivariant perverse sheaves supported at the base point are the continuous Galois representations; this category is not semisimple (Frobenius can act by a unipotent block), and H* forgets the Galois action, so it is not full and cannot be an equivalence onto Rep(Ĝ). The body proves the theorem only over an algebraically closed field. The nodes of this packet carry the hypothesis. Status: PAPER-ZHU-17/E35 (already recorded in the extraction of this paper and confirmed by its independent review; reused here, not newly discovered).
- **GeometricSatakeAndFusion/E10** (misprint; Zhu, §0.5 p412, the dominance order on coweights; affects nothing). The order λ ≤ μ on coweights is defined using nonnegative combinations of positive roots. Correction: Use nonnegative integer combinations of positive coroots; the order lives on X_•. Reason: λ and μ are coweights, so μ − λ lies in the coweight lattice, where roots do not live. The coroot order is the one used in the rest of the paper, and the highest-weight statements of this packet use it. Status: PAPER-ZHU-17/E2 (already recorded in the extraction of this paper and confirmed by its independent review; reused here, not newly discovered).
- **GeometricSatakeAndFusion/E11** (error; Zhu, proof of Corollary 2.10, p436 (publisher PDF); affects the proof). The proof splits H* into the weight pieces using a second filtration defined from cohomology with supports in the boundary of the opposite semi-infinite orbits, and asserts that it is complementary to the first. Correction: Use the images of cohomology with supports in the closures of the opposite semi-infinite orbits, as Mirković–Vilonen do; with that filtration the two are complementary and Corollary 2.10 follows. Reason: The printed second filtration vanishes in the degree of the λ-piece and consists of pieces for larger weights, which lie inside the first filtration. Corollary 2.10 itself is right, and Proposition 2.36, used by the rational Witt equivalence node, is stated through its isomorphism. Status: PAPER-ZHU-17/E51 (already recorded in the extraction of this paper and confirmed by its independent review; reused here, not newly discovered).

## Sources read and prototype validation

All external texts were downloaded from the public URLs below into scratch space, never into the repository. The packet records their SHA-256 values and exact read sections. The FS, Zhu and Deligne–Milne files read in this round have the same hashes as those of the first round and its review. Prasad–Yu was read in the author preprint, whose Corollary 1.3 is the result that FS cites as Corollary 5.2 of the published version; no statement is attributed to the unread published file. FS appeared as Astérisque 466 (2026); that edition was not read, and source issue E8 is scoped to the author copy, which has the same text as arXiv v4.

- [Laurent Fargues and Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). Author-hosted 356-page PDF; contents match arXiv:2102.13459v4; physical and printed page numbers agree. Read: Remark I.2.14 p17; IV.7 pp164–166; the VI introduction pp187–190; VI.6.5–VI.6.8 pp214–215; VI.7 pp215–224, including the comparison with the Witt Grassmannian on p219; VI.8–VI.12 pp224–242 in full; IX.2 p321; IX.6.1–IX.6.3 pp330–332; IX.7.1 pp334–335.
- [Xinwen Zhu, Affine Grassmannians and the geometric Satake in mixed characteristic](https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf). Annals of Mathematics 185 (2017), pp403–492; publisher PDF, printed page = physical page + 402. Read: §0.2 pp407–409 (Theorem 0.3); §0.5 pp411–412; §2 opening and §2.1 pp429–433; §2.2 pp433–436; the statements of Lemma 2.18, Propositions 2.20–2.21 and Corollary 2.22 in §§2.3–2.4 pp440–444; §2.5 pp454–455. Rational coefficients only.
- [Benedict H. Gross, On the Satake isomorphism](https://people.math.harvard.edu/~gross/preprints/sat.pdf). Author preprint, 17 pages; printed and physical pages agree. Read: §2 pp3–5 through (2.9); §3 pp6–8; §4 pp8–9 through (4.4), Kazhdan–Lusztig polynomials and the IC basis; §8 pp15–16.
- [Gopal Prasad and Jiu-Kang Yu, On quasi-reductive group schemes](https://math.stanford.edu/~conrad/papers/qrg.pdf). Author-hosted preprint. Read: introduction pp1–3, Theorem 1.2 and Corollary 1.3 with the residue-characteristic-two exception; §5.3–§5.4 pp11–12.
- [Pierre Deligne and James S. Milne, Tannakian categories](https://www.math.columbia.edu/~dejong/tannakian/Deligne-Milne-Tannakian-Categories.pdf). Author-hosted notes revised 15 August 2012. Read: §2 pp24–27, Proposition 2.20, Corollary 2.22, whose characteristic-zero hypothesis matters for source issue E8, and Proposition 2.23 with proofs.

The upstream ReductiveGroups and RepresentationTheory/RootSystems documents were read in full to calibrate scope and density. Every touching blueprint link-map record was inspected. Their screening results do not replace the explicit source dependencies found here.

The suggested file uses the existing categorical, module, Hopf, root-pairing and affine-group vocabulary, and names the geometric conditions it omits. The shared pinned build lacks compiled Tau Ceti Tannaka and affine-group modules. The file was therefore checked by inlining the pinned Tau Ceti sources of its imports ahead of it in a scratch file and elaborating that file at Mathlib 082e2d3. The suggested part produced no error and no warning other than the expected warnings for its placeholder proofs. The inlined Tau Ceti text itself reported about a dozen proof errors (notation and instance clashes from merging 127 modules under one import set, and one heartbeat timeout); none of them is in a declaration the suggested file names. Elaboration checks the signatures only, not the omitted geometric conditions.
