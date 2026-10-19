# Roadmap: geometric Satake fusion

**Summary.** This layer constructs symmetric fusion and its functoriality in finite leg sets for the Fargues–Fontaine local Hecke stack. Its input is the bounded, ULA, flat-perverse Satake category with its already constructed convolution, associativity, unit and duals. Its output is the coherent family used by Satake reconstruction, local Hecke operators and excursion operators. The layer is `GeometricSatakeAndFusion:GS3:fusion`.

## Scope and ownership

This part owns the fusion refinement of convolution, the finite-set collision family, its Weil realization and compatibility with constant terms and duality. It imports the geometric carriers and the preceding Satake category; reconstruction of the dual group, normalized Satake equivalences, classical trace comparison and equal-characteristic global-shtuka geometry retain their respective owners.

## Conventions

Let E be a nonarchimedean local field with residue field F_q of characteristic p, and let G/E be connected reductive. E may have equal or mixed characteristic. Arguments requiring a split group or an integral model are made étale-locally on the divisor base and descended; a global split or hyperspecial hypothesis is not imposed. Write Div¹ for the degree-one divisor v-stack over the geometric residue field. For a finite set I, Sat^I_G(Λ) means the existing local-Hecke category over (Div¹)^I of bounded-support ULA flat-perverse objects. All pullbacks and tensor products below are derived when appropriate.

The primary coefficient ring Λ is commutative, discrete and killed by an integer prime to p. Finite-projective local systems, rather than all constructible modules, are the target of total cohomology. For fixed ℓ ≠ p, coefficient-complete ℓ-adic variants use the compatible-reduction adapter of VS3 with its allowed coefficient rings and boundedness hypotheses, preserving boundedness, finite projectivity and the displayed comparisons. Neither integral semisimplicity nor an arbitrary coefficient-change theorem is assumed.

The geometric fibre functor is

\[
 F^I(A)=\bigoplus_{r\in\mathbf Z}H^r R\pi_*\widetilde A,
 \qquad \pi:\mathrm{Gr}^I_G\longrightarrow(\mathrm{Div}^1)^I,
\]

where the tilde denotes pullback from the local Hecke stack. Bounded support gives a finite sum locally. Its target has the ordinary symmetry of **ungraded** modules. Cohomological parity controls the correction to geometric commutativity; module rank does not.

For α:I→J the divisor map and Weil map point from J to I:

\[
 \Delta_\alpha(x)_i=x_{\alpha(i)},\qquad
 d\alpha:W_E^J\longrightarrow W_E^I,\quad
 d\alpha(w)_i=w_{\alpha(i)}.
\]

The Satake functor α_! points from I to J, while its realization is restriction of representations along dα. For α:I→J and β:J→K, d(βα)=dα∘dβ and (βα)_!≅β_!α_!. In categorical composition notation the latter is `α_! ⋙ β_!`.

The Weil topology has open profinite inertia. ClassFieldTheory Layer 9 uses arithmetic degree; geometric degree is its negative. Arithmetic Frobenius acts on Λ(1) by q, geometric Frobenius by q⁻¹. If a square root s²=q is chosen for a downstream half-Tate normalization, geometric Frobenius acts on Λ(1/2) by s⁻¹. The element q is invertible in the stipulated coefficient rings because their torsion order is prime to p. A half-Tate scalar is used only when a square root exists in the chosen coefficient extension. Unnormalized fusion requires no square root. The positive power in the parameter untwisting formula of FS IX.7.1 is a separate cocycle convention, not the stalk scalar of Λ(1).

## Exact supplier contracts

Import the actual GS0/GS1/GS2 nodes listed under each target. In particular `GS2:Satake-closure/convolution-preserves-satake-and-dualizability` and `GS2:Satake-closure/satake-rigidity` precede this layer. FS VI.8.1(iii) proves closure from VI.8.1(i),(ii) and Verdier duality; VI.8.2 obtains duals from IV.2.24, VI.6.2 and VI.7.12. The elementary two-leg degeneration in VI.8.1(ii) is an input to closure, not the coherent fusion construction of this layer.

| Supplier | Required interface |
| --- | --- |
| `RelativeFarguesFontaine:RF2` | Div¹, divisor products and completed rings, ordered base change and the disjoint-completion factorization |
| `GeometricSatakeAndFusion:GS0:loop-geometry` | Loop groups, local Hecke stacks, affine Grassmannians and Schubert bounds |
| `GeometricSatakeAndFusion:GS1` | Relative perversity, conservative shifted hyperbolic localization and descent |
| `GeometricSatakeAndFusion:GS2:correspondences` | Convolution diagram, associativity/unit, fibre functor and Verdier duality |
| `GeometricSatakeAndFusion:GS2:Satake-closure` | Monoidal Satake and left/right dualizability before symmetric fusion |
| `VStackSheavesAndLisseCategories:VS1` | ULA stability; positive-codimension partial-diagonal purity; the exact IV.7.3 locally constant perfect Drinfeld equivalence and its coefficient/diagonal naturality |
| `VStackSheavesAndLisseCategories:VS3` | Adic/ordinary/solid coefficient comparisons in their established range, compatible reductions and transport of the bounded fusion/duality diagrams; lisse-site sheaves are not identified with locally constant perfect complexes |
| `ReductiveGroupsPartII:RG2.5` | Coroot quotient and 2ρ parity; additive Levi degree shifts, using existing root-system theory |
| `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category` | Language for the coherent finite-set family and its operadic packaging |
| `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group` | Existing Weil group/topology/degree; continuous finite-projective representations and Tate convention adapter |

Mathlib already supplies `RootPairing`, `MonoidalCategory`, `BraidedCategory`, `SymmetricCategory`, `Functor.Monoidal`, `Functor.Braided`, `LeftRigidCategory`, `Representation` and `Module.Projective`. The pinned `Representation` is a homomorphism into linear endomorphisms; continuity and finite projectivity are extra conditions. Existing monoidal APIs supply coherence vocabulary, not the geometric construction. The reviewed library audit for this layer finds no mixed-characteristic geometric fusion implementation. The current Tau Ceti library's newform Satake polynomial is a different object; the current roadmap library supplies local Weil and root-system theory, which are imported here. Equal-characteristic global-shtuka fusion retains its separate geometric owner.

## How to read the build

Begin with the disjoint open and restriction uniqueness, then construct parity-corrected fusion by proper convolution. Finite-set transport packages all collisions, including unit insertion. Drinfeld realization identifies the fibre target and its transport direction; shifted constant terms and geometric duality preserve this structure.

## Layer GS3: coherent collision and factorization maps

The six planets are **Disjoint-leg factorization**, **Collision extension uniqueness**, **Satake parity**, **Fusion product**, **Finite-set fusion**, and **Symmetric constant terms**. The following eight targets form one dependency chain with constant terms and duality as output branches. All geometric objects and conditions in this document are part of the specification even when their Lean carriers are not yet present.

### 3.1. Disjoint-leg locus

For a finite set I partitioned by b:I→K, define U_b ⊂ (Div¹_X)^I by x_i ≠ x_j whenever b(i) ≠ b(j). It allows coincidences inside one block. Pull the existing local Hecke stack and Satake category back to U_b; denote restriction by j_b*. On U_b, completion along the union of block divisors is the product of the block completions, giving the factorization of Grassmannians and local Hecke stacks. (FS VI.9 pp226–227; VI.0 p189.)

Use the divisor product equation and invertibility of distinct divisor ideals to split the completed rings, then the loop quotient and torsor descriptions. An ordered partition gives the same open independently of its ordering; this construction commutes with base change.

The intended library namespace is `TauCeti.GeometricSatake`. Its usable interface consists of the following declarations.

- `disjointLegLocus`: For b:I→K and X=Div¹_X, U_b is the subfunctor of X^I satisfying the cross-block inequality.
- `disjointLegLocus_mem`: A geometric tuple x lies in U_b iff b(i)≠b(j) implies x_i≠x_j for all i,j.
- `disjointLegLocus_reindex`: A bijection of leg sets carries U_b to U_{b∘e}, compatibly with identity and composition.
- `disjointLegLocus_baseChange`: Pullback of U_b under S→(Div¹_X)^I is precisely the same cross-block condition on S.

**Checks.**

- `test_disjoint_oneBlock`: A constant block map gives U_b=X^I.
- `test_disjoint_twoSingletons`: For two singleton blocks, U_b={(x,y):x≠y}.
- `test_disjoint_internalCollision`: For blocks {1,2} and {3}, (x,x,y) with x≠y lies in U_b; the full pairwise-disjoint locus would reject it.

**Worked example.** For I={1,2,3}, b=(0,0,1) and x≠y, the tuple (x,x,y) is allowed. The tuple (x,y,x) is excluded, because legs 1 and 3 lie in different blocks. For the empty leg set the condition is vacuous. The algebraic `Set (I → X)` in the suggested file tests this incidence condition; the geometric target is an open sub-v-stack, with its base-change and completion-factorization structure.

The milestone also requires the following acceptance checks.

- One block gives the whole leg base.
- Singleton blocks exclude every collision, while a two-element block allows its internal diagonal.

Consumers use this interface as follows. FS VI.9.3–9.4: The exterior product is first defined on this precise open, and convolution supplies its extension. HeckeStacksAndLocalShtukas:HS4: Blockwise factorization must remain valid during repeated collisions within blocks.

*Needs:* `RelativeFarguesFontaine:RF2:integral-divisors/product-equation-and-affineness`, `RelativeFarguesFontaine:RF2:untilts/div1-moduli-and-properness`, `GeometricSatakeAndFusion:GS0:loop-geometry/loop-groups-and-local-hecke`, `GeometricSatakeAndFusion:GS0:loop-geometry/ordered-leg-base-change`, `GeometricSatakeAndFusion:GS0:loop-geometry/local-hecke-stack`.

### 3.2. Restriction across collision diagonals

For the blockwise disjoint inclusion j_b, restriction j_b*:Sat^I_G(Λ)→Sat_G(U_b,Λ) is fully faithful, and so is restriction of finite projective local systems on the leg base. Every Satake object satisfies A ≅ pH⁰(Rj_b*j_b*A). This is uniqueness and reconstruction for objects already extending; full faithfulness alone asserts no essential surjectivity. (FS Proposition VI.9.3 pp227–228.)

Filter the complement by smooth partial diagonals of positive ℓ-codimension. Purity makes their i*i! on locally constant perfect complexes lie in degrees ≥2. The conservatively detecting, t-exact constant-term functors reduce the required perverse bound to that local-system bound. Apply the open–closed triangle and perverse truncation to obtain the reconstruction and Hom isomorphisms.

**Checks.** Injectivity and surjectivity on Hom are both required, not just detection of isomorphisms. The reconstruction map is the canonical one into perverse truncation of Rj_*j*. An arbitrary sheaf on the open has no promised Satake extension. In particular, uniqueness across a diagonal cannot be used to establish existence of fusion. The purity input is specific to locally constant perfect complexes along the partial diagonals; it does not assert that every sheaf enjoys the same bound.

The milestone also requires the following acceptance checks.

- For two legs the diagonal has codimension one and contributes starting in degree two.
- A codimension-zero closed component would invalidate the argument; arbitrary restrictions of arbitrary categories are not fully faithful.

*Needs:* `GeometricSatakeAndFusion:GS3:fusion/disjoint-leg-locus`, `GeometricSatakeAndFusion:GS1/relative-perverse-t-structure`, `GeometricSatakeAndFusion:GS1/semi-infinite-orbits-and-hyperbolic-localization`, `GeometricSatakeAndFusion:GS2:correspondences/satake-category-and-fibre-functor`, `VStackSheavesAndLisseCategories:VS1`, `GeometricSatakeAndFusion:GS1/perverse-descent-and-shifted-ct`.

### 3.3. Satake support parity

The parity of a Schubert tuple μ• is ε(μ•)=Σ_i⟨2ρ,μ_i⟩ mod 2 in Z/2. Differences along dominance are sums of coroots, whose pairing with 2ρ is even, so parity is constant on a connected-component stratum and defines an open-and-closed even/odd decomposition of the local Hecke stack. For mixed-parity objects use their canonical summands. The correction scalar for homogeneous A,B is (-1)^{ε(A)ε(B)}. (FS VI.9 pp228–229.)

Use ⟨2ρ,α∨⟩=2 for each simple coroot and dominance differences to prove constancy on closure relations. Disjoint unions add dimensions and hence add parity. Apply the sign separately to the four pairs of canonical summands.

The intended library namespace is `TauCeti.GeometricSatake`. Its usable interface consists of the following declarations.

- `supportParity`: The degree sum reduced modulo two, equivalently the dimension parity on each component.
- `supportParity_dominance`: Comparable dominant Schubert tuples have equal parity.
- `supportParity_union`: Parity on a disjoint union is the sum of the two parities in Z/2.
- `fusionSign`: For e,f∈Z/2, the correction is (-1)^{ef}; it is a bicharacter.

**Checks.**

- `test_parity_unit`: The zero-cocharacter unit has parity zero.
- `test_sign_oddOdd`: The correction on two odd summands is -1.
- `test_sign_evenOdd`: The correction on an even and an odd summand is +1; reducing coefficient rings modulo two makes both signs equal.
- `test_parity_empty`: An empty tuple has parity zero.
- `test_parity_minusculeRank`: The dimension-one PGL₂ minuscule object has parity one, unlike the parity of its rank-two fibre.
- `test_parity_coroot`: Dimension values 1 and 3 have the same parity, testing a simple-coroot change by two.
- `test_sign_characteristicTwo`: The odd/odd integer sign reduces to +1 in Z/2 but not in Z/3; no inversion of two is required.

**Worked example.** The PGL₂ minuscule Schubert variety is P¹ and has odd dimension. Its fibre has rank two, yet its parity is odd. Two such factors therefore receive scalar −1. In characteristic two the scalar becomes +1, and the construction still makes sense without dividing by two: even/odd summands come from clopen supports, not idempotents formed using 1/2. The scalar is a symmetric bicharacter, so correcting both hexagons and the double-braiding identity is possible. In the light Lean signature, dimensions are supplied integers; their geometric origin and descent to components are the root-datum target above.

The milestone also requires the following acceptance checks.

- An odd-dimensional minuscule Schubert object is odd even when its ungraded fibre has even rank.
- Parity is additive; an odd/odd swap has scalar -1.

Consumers use this interface as follows. FS VI.9.4: Cancels the Koszul sign seen by total cohomology so that the fibre functor has the ordinary symmetric target. Classical comparison: The same component parity corrects the alternating Frobenius trace of a perverse shift.

*Needs:* `ReductiveGroupsPartII:RG2.5`, `GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness`, `mathlib:RootPairing`.

### 3.4. Fusion product and ordinary symmetry

For blocks I=⊔_a I_a and A_a∈Sat^{I_a}_G(Λ), use the chain of modifications E_0→⋯→E_k, projections p_a to the a-th modification and composition m. Define the fusion object *_{a}A_a=Rm_*(⊗_a p_a*A_a). The construction is ULA, bounded and flat perverse and restricts to ⊠_a A_a on U_b. It is independent of the order by full faithfulness. Apply the fold map I ⊔ I → I (diagonal pullback and the Grassmannian pushforward) to obtain the internal tensor on Sat^I. Modify its geometric commutativity by (-1)^{ε(A)ε(B)}. This gives a symmetric monoidal structure refining the existing convolution, with total cohomology F^I strong symmetric monoidal into ordinary, ungraded finite-projective local systems (with Weil realization in the next target). (FS Proposition VI.9.4 pp228–229; parity convention p228; VI.8.1–VI.8.2 pp224–226.)

Construct the proper chain-composition correspondence, whose restriction to disjoint blocks is an isomorphism. ULA stability comes from the IV.2 correspondence criterion. Apply constant terms: their total pushforward is locally constant perfect and agrees on the disjoint locus with the degree-zero finite-projective exterior product. Density and VI.7.7 imply flat perversity. Use VI.9.3 for uniqueness of associativity, commutativity and unit comparisons; all relations hold after disjoint restriction. Total cohomology carries the geometric flip to the graded Koszul flip. The component correction cancels that sign and preserves hexagon, involution and unit laws.

The intended library namespace is `TauCeti.GeometricSatake`. Its usable interface consists of the following declarations.

- `fusionProduct`: The proper chain-composition pushforward for a finite ordered partition.
- `fusionProduct_restrict`: Its restriction to U_b is canonically the exterior tensor product.
- `fusionTensor`: Duplicate legs and diagonal pullback give the internal tensor, canonically isomorphic to convolution.
- `fusionBraiding`: Geometric block permutation multiplied on homogeneous summands by (-1)^{ε(A)ε(B)}.
- `fibreFusionIso`: F(A*B) ≅ F(A)⊗F(B), respecting the ordinary symmetry, unit and associativity constraints.
- `fusionProduct_interchange`: Exterior fusion is compatible with componentwise convolution through the interchange isomorphism; units and associators commute with it. This is the monoidal-functor structure of VI.9.4, in addition to internal symmetric fusion.

**Checks.**

- `test_fusion_unit`: Fusion with the unit is isomorphic to the original object.
- `test_fusion_disjoint`: On two distinct divisors fusion is the exterior product, with no additional extension summand supported on the diagonal.
- `test_fusion_oddSymmetry`: For two odd objects F sends corrected braiding to the ordinary flip; the uncorrected braiding gives its negative when 2 is invertible.
- `test_fusion_mixedParity`: For A=A_even ⊕ A_odd the braiding acts blockwise, negatively only on the odd/odd block. No homogeneous parity is assigned to A as a whole.

**Interchange and coherence.** On each Satake category the initial tensor is convolution. The exterior fusion multifunctor respects componentwise convolution through its interchange comparison. Internal fusion is obtained by composing exterior fusion with the fold collision map, and its tensor/unit comparisons identify it with that convolution. The associator pentagon, unit triangle, two hexagons, symmetry involution, interchange and fibre-functor tensor diagrams all commute as natural transformations. For mixed parity, apply the sign to each pair of canonical summands. Existence is supplied by proper chain convolution and the flat-perverse criterion VI.7.7; full faithfulness supplies only uniqueness and equations once extensions exist.

The milestone also requires the following acceptance checks.

- For one block recover A itself, and tensor with the zero-modification unit is the original object.
- Odd/odd braiding is the negative of the geometric flip; after F it is the ordinary flip.
- The construction uses neither rational decomposition nor rational reductivity.
- Both hexagons, the pentagon, triangle, double-braiding identity and monoidal interchange commute as diagrams of natural transformations; equality of object isomorphism classes is insufficient.

Consumers use this interface as follows. FS VI.10.1–10.3: Tensor compatibility and the product of bounded left-adjoint generators construct the multi-leg Hopf algebra. ExcursionOperatorsAndSpectralAction: Coherent multi-leg tensor symmetry supplies representations with colliding labels, without semisimplicity.

*Needs:* `GeometricSatakeAndFusion:GS3:fusion/disjoint-leg-factorization-and-full-faithfulness`, `GeometricSatakeAndFusion:GS3:fusion/support-parity`, `GeometricSatakeAndFusion:GS2:correspondences/convolution-diagram`, `GeometricSatakeAndFusion:GS2:Satake-closure/convolution-preserves-satake-and-dualizability`, `VStackSheavesAndLisseCategories:VS1/ula-dualizability-criterion`, `GeometricSatakeAndFusion:GS2:correspondences/satake-category-and-fibre-functor`, `mathlib:CategoryTheory.SymmetricCategory`, `mathlib:CategoryTheory.Functor.Braided`, `GeometricSatakeAndFusion:GS2:correspondences/satake-fibre-functor`, `GeometricSatakeAndFusion:GS2:correspondences/convolution-associativity-and-unit`, `mathlib:CategoryTheory.MonoidalCategory`, `mathlib:CategoryTheory.Functor.Monoidal`, `mathlib:CategoryTheory.BraidedCategory`, `VStackSheavesAndLisseCategories:VS3`.

### 3.5. CoCartesian finite-set functoriality

For a map α:I→J, let Δ_α:(Div¹)^J→(Div¹)^I repeat the j-th divisor on its inverse-image block. Pull back along Gr^I_G ×_(Div¹)^I (Div¹)^J → Gr^I_G and push forward along the natural closed immersion Gr^I_G ×_(Div¹)^I (Div¹)^J ↪ Gr^J_G. Descending the required loop equivariance defines α_!:Sat^I→Sat^J; the closed immersion is on Grassmannians, not on quotient Hecke stacks. This merges each fibre of α and inserts unit modifications at empty fibres. For permutations it relabels legs, and for disjoint unions it respects exterior fusion. Canonical identity and composition comparisons satisfy the finite-set coherence relations. Together with exterior fusion they give the coCartesian family of symmetric monoidal Satake categories over finite sets. For the fold I ⊔ I → I its comparison with exterior fusion identifies the resulting product with convolution; the unique map ∅→I carries the coefficient unit to the unit object. (FS VI.9 pp226–227, including the footnote p227; Proposition VI.9.4 pp228–229.)

Use the diagonal base-change square and its closed Grassmannian immersion to define pull-push, check loop equivariance and descend to the Satake categories. Directly check compositional base change; do not replace this diagram by a closed immersion of quotient Hecke stacks. Compare exterior fusion followed by collision with fusion of the collided blocks, first where the distinct surviving target blocks are disjoint. Within each collapsed block use the chain-composition/base-change and associativity diagrams from GS2; do not restrict the source to the pairwise-distinct locus, whose pullback along a genuine collision is empty. Every coherence diagram reduces to the same disjoint-locus permutation/composition identity; include empty fibres with the unit. Use the imported operadic language to package these comparisons.

The intended library namespace is `TauCeti.GeometricSatake`. Its usable interface consists of the following declarations.

- `collisionFunctor`: The functor α_! associated to any map α:I→J, including empty fibres.
- `collisionFunctor_id`: The identity-map functor is canonically isomorphic to identity.
- `collisionFunctor_comp`: (β∘α)_! ≅ α_! followed by β_!, with coherent associativity.
- `collisionFunctor_comp_assoc`: For I→J→K→L, the two composition comparisons from the composite functor to the iterated functors agree after the functor associator; retain the full enhanced finite-set coherence.
- `collisionFunctor_union`: Disjoint union of maps commutes with exterior fusion, including its corrected permutations.
- `collisionFunctor_unitInsertion`: An unused target leg is assigned the zero-modification tensor unit.

**Checks.**

- `test_collision_threeLegs`: The two orders merging three legs to one give the canonical associativity comparison, whose pentagon commutes.
- `test_collision_permutation`: A transposition followed by itself gives the identity relabeling functor and comparison.
- `test_collision_emptyFibre`: The map ∅→{1} sends the coefficient unit to the zero-modification object, rather than zero.

**Collision diagram.** Put B_I=(Div¹)^I. For α:I→J use

\[
 \mathrm{Gr}^I_G\ \longleftarrow\
 \mathrm{Gr}^I_G\times_{B_I}B_J\ \lhook\joinrel\longrightarrow\ \mathrm{Gr}^J_G.
\]

Pull back on the left, push forward on the right, and descend the loop equivariance. The right arrow is a closed immersion of Grassmannians; the analogous assertion for the quotient Hecke stacks is not used. For a genuine collision, the pullback of the source pairwise-disjoint open is empty. Composition within a collapsed block must therefore use the convolution/base-change diagrams, not an empty-open uniqueness argument. Uniqueness on the locus where the distinct **surviving blocks** are disjoint then extends the exterior comparisons.

For α:I→J, β:J→K, γ:K→L, write c(α,β):(βα)_!⇒α_!⋙β_!. The two composites from (γβα)_! to α_!⋙(β_!⋙γ_!) agree, using the functor associator on the path through (α_!⋙β_!)⋙γ_!. Include the identity triangles. Disjoint-union compatibility uses the actual block-sum map α⊔β and commutes with these comparisons and corrected permutations. The enhanced packaging retains higher coherence, rather than choosing unrelated pairwise isomorphisms.

**Worked examples.** A fold {1,2}→{*} tensors the factors. An injection {1}→{1,2} inserts the tensor unit in the unused leg; it does not tensor with zero. The unique ∅→{*} sends Λ to the zero-modification object. There is no map from a nonempty set to ∅. Applying a transposition twice is identity, including its comparison map. Merging four singleton blocks in the five parenthesizations gives the associator pentagon.

The milestone also requires the following acceptance checks.

- Three legs colliding successively agree with their single simultaneous collision.
- Permutation inverse/identity comparisons are inverse, and inserting then forgetting a unit leg is identity.
- The two paths for I→J→K→L agree after the functor associator; the block-sum comparison uses α ⊔ β, rather than an unrelated map with the same cardinalities.

Consumers use this interface as follows. ExcursionOperatorsAndSpectralAction:ES6–ES7: Excursions use arbitrary label maps, their compositions and unit insertions. HeckeStacksAndLocalShtukas:HS4: Repeated collisions and disjoint unions require coherent families of comparison maps.

*Needs:* `GeometricSatakeAndFusion:GS3:fusion/fusion-product-and-sign-rule`, `GeometricSatakeAndFusion:GS3:fusion/disjoint-leg-factorization-and-full-faithfulness`, `RelativeFarguesFontaine:RF2:integral-divisors/product-equation-and-affineness`, `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`, `GeometricSatakeAndFusion:GS0:loop-geometry/loop-groups-and-local-hecke`, `GeometricSatakeAndFusion:GS0:loop-geometry/ordered-leg-base-change`, `GeometricSatakeAndFusion:GS0:loop-geometry/grassmannian`, `mathlib:CategoryTheory.MonoidalCategory`, `mathlib:CategoryTheory.Functor.Monoidal`, `VStackSheavesAndLisseCategories:VS3`.

### 3.6. Weil realization of total cohomology

For every finite I, finite-projective Λ-local systems on (Div¹)^I are equivalent to continuous finite-projective Λ-representations of W_E^I. Under this equivalence F^I=⊕_r H^r Rπ_* (after pullback to Gr) is exact, faithful and conservative. A map f in Satake has a kernel if ker F^I(f) is a direct summand of F^I(A), and similarly for cokernels; no general abelian or semisimple assertion is made. F^I is strong symmetric monoidal for corrected fusion. For α:I→J, F^J α_! ≅ Res_{dα} F^I, where dα:W_E^J→W_E^I sends (w_j) to (w_{α(i)}); these comparisons respect identities, composition, permutations, exterior products and units. The Drinfeld equivalence applies to locally constant perfect complexes, not all étale complexes. (FS Proposition VI.9.2 p226; Proposition IV.7.3 pp165–166 (full faithfulness begins p164); VI.7.10 p222; VI.9 pp226–227; VI.11.1 pp235–236 and its proof p239; IX.7.1 pp334–335.)

The torsion coefficient ring is discrete, killed by an integer prime to p; continuity is for the Weil topology and the discrete module topology. An ℓ-adic version requires compatible reductions and complete coefficient modules, not an arbitrary topologized Representation abbreviation.

Import IV.7.3 in its DLc form. Restrict to finite-projective local systems in degree zero to obtain VI.9.2. Apply VI.7.10 to the total cohomology functor and VI.9.4 to tensor comparison; cohomological grading is forgotten only after its parity sign is accounted for. For α:I→J compare the divisor diagonal with B(dα); pullback of representations is restriction in the displayed direction. Use the naturality in IV.7.3 and the cohomological collision square in VI.9 pp226–227. Fix the Tate stalk convention separately from the parameter cocycle: arithmetic Frobenius acts on Λ(1) by q and geometric Frobenius by q⁻¹. VI.11 pp235–236,239 identifies the P¹ root line Hom(H²,H⁰)=Λ(1). No square root of q enters unnormalized fusion; choosing s²=q gives geometric half-Tate stalk scalar s⁻¹, while the positive-power formula in IX.7.1 pp334–335 concerns parameter untwisting. A formal transport adapter remains a named supplier obligation.

**Drinfeld scope.** The imported statement is the equivalence D_lc(X×BW_E^I,Λ)≃D_lc(X×(Div¹)^I,Λ) for every small v-stack X and finite I, for locally constant perfect complexes (FS IV.7.3). Taking the finite-projective degree-zero part gives VI.9.2. It is not an equivalence on all D_et: diagonal-supported sheaves are a test that the larger statement fails. No fundamental-group product shortcut replaces the theorem.

**Direction tests.** A fold {1,2}→{*} corresponds to the diagonal W_E→W_E², so a product representation restricts to the diagonal action on its tensor product. An injection {1}→{1,2} corresponds to projection W_E²→W_E, so the unused factor acts trivially. For I=∅ the group is trivial and the target is finite-projective Λ-modules. For three leg maps, the order reverses on Weil products and agrees with successive representation restrictions.

**Tate check.** H⁰(P¹)=Λ and H²(P¹)=Λ(−1); hence Hom(H²,H⁰)=Λ(1). Geometric Frobenius acts on this root line by q⁻¹. Taking q=2 in Λ=Z/5 distinguishes this value (3) from q (2); it is a coefficient-convention test, not a geometric example with new assumptions on E. FS VI.11 pp235–236,239 supplies the geometric root-line identification. The exact transport through the Drinfeld equivalence and its compatible ℓ-adic reductions belongs to the VS1/Weil adapter. The parameter formula of IX.7.1 must retain its separate untwisting direction.

The milestone also requires the following acceptance checks.

- For I=∅ the target is finite projective Λ-modules.
- For singleton I the action is the local Weil action, and for multiple legs the source is W_E^I, not its diagonal copy.
- For α:{1,2}→{*}, dα is the diagonal W_E→W_E²; for an inclusion {1}→{1,2}, dα is projection W_E²→W_E. These directions agree with collision and insertion.
- H⁰(P¹)=Λ, H²(P¹)=Λ(−1), hence the root line Hom(H²,H⁰) has geometric scalar q⁻¹; the positive-power parameter normalization is not this stalk action.

*Needs:* `GeometricSatakeAndFusion:GS2:correspondences/satake-category-and-fibre-functor`, `GeometricSatakeAndFusion:GS3:fusion/fusion-product-and-sign-rule`, `GeometricSatakeAndFusion:GS3:fusion/finite-set-functoriality-and-constant-terms`, `VStackSheavesAndLisseCategories:VS1`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`, `RelativeFarguesFontaine:RF2:untilts/div1-moduli-and-properness`, `mathlib:Representation`, `mathlib:Module.Projective`, `GeometricSatakeAndFusion:GS2:correspondences/satake-fibre-functor`, `VStackSheavesAndLisseCategories:VS3`.

### 3.7. Symmetric constant terms

For a parabolic P with Levi M, CT_P[deg_P]:Sat^I_G(Λ)→Sat^I_M(Λ) is symmetric monoidal for corrected fusion, commutes with F^I, and is transitive for nested parabolics with the sum of the degree shifts. It respects arbitrary finite-set collision functors, disjoint unions and permutations, with identity, composition and transitivity coherences. The degree is componentwise ⟨2ρ_G−2ρ_M,μ⟩; omission of it changes the weight degrees. (FS Proposition VI.9.6 p230; Proposition VI.7.13 pp223–224; VI.11 p236.)

Use VI.7.13 for landing, degrees and transitivity. Off the collision diagonals the assertion is Künneth and blockwise hyperbolic localization. Use full faithfulness to extend the comparisons and all their equations. Cohomology-degree parity ensures the modified symmetry matches on G and M.

**Checks and normalization.** For P=G the degree vanishes and all comparison maps reduce to identities. For nested Levis M′⊂M⊂G, the two degree functions add to the direct one, and the transitivity comparison respects tensor, finite-set collision, permutations and the fibre comparison. The symmetry on both sides uses each group's own support parity; the degree shift is essential for the Koszul comparison. This is the integral Fargues–Fontaine statement of VI.9.6, not a rational Witt or classical Satake transform theorem. Normalized dual-Levi parameter maps and square roots of q belong to GS4.

The milestone also requires the following acceptance checks.

- For P=G the functor is identity.
- For T⊂M⊂G the two-step weight functor agrees with the direct one with its summed degree shift.
- On each component the shifts for G→M→M′ sum to ⟨2ρ_G−2ρ_M′,μ⟩. The shift is integral; neither a half-Tate choice nor an unshifted functor replaces it.
- The collision/constant-term square commutes for a fold and an injection, with compatibility between this square and nested-parabolic composition.

*Needs:* `GeometricSatakeAndFusion:GS1/semi-infinite-orbits-and-hyperbolic-localization`, `GeometricSatakeAndFusion:GS2:correspondences/satake-category-and-fibre-functor`, `GeometricSatakeAndFusion:GS3:fusion/fusion-product-and-sign-rule`, `GeometricSatakeAndFusion:GS3:fusion/finite-set-functoriality-and-constant-terms`, `GeometricSatakeAndFusion:GS3:fusion/disjoint-leg-factorization-and-full-faithfulness`, `ReductiveGroupsPartII:RG2.5`, `GeometricSatakeAndFusion:GS2:correspondences/satake-verdier-duality`, `GeometricSatakeAndFusion:GS2:correspondences/satake-fibre-functor`, `VStackSheavesAndLisseCategories:VS3`.

### 3.8. Fusion and Verdier duality

The inversion/reversal sw* is symmetric monoidal for fusion and F^I sw* ≅ F^I. Verdier duality D is a contravariant symmetric monoidal involution, D sw* ≅ sw* D and F^I D ≅ (F^I)^∨. The internal tensor dual of A is sw*D(A). These identifications retain their evaluation, coevaluation and finite-set coherence data; sw* itself need not be identity. (FS Corollary VI.9.5 pp229–230; VI.8.2 pp225–226.)

VI.8.2 supplies convolution duals before fusion; VI.7.12 supplies F(D A)=F(A)^∨. VI.9.4 promotes them through the canonical convolution/fusion comparison. F(sw*A)=F(A) and full faithfulness yield the symmetric involution and its duality coherences.

**Duality check.** For a torus, describe an object by its support weight μ and local system L. Relative Verdier duality sends it to (μ,L∨); inversion sends it to (−μ,L). Thus the internal dual is (−μ,L∨). This distinguishes D, sw* and their composite even though F(sw*A)≅F(A). The evaluation and coevaluation maps must be the transported GS2 rigid maps and satisfy both triangle identities; dual modules seen by F alone do not identify these geometric maps. The involution and its duality comparison are natural and compatible with leg transport.

The milestone also requires the following acceptance checks.

- A torus weight μ is inverted by sw* and internal dual, with the corresponding dual local system.
- The PGL2 minuscule case distinguishes a symmetric Verdier pairing from the alternating SL2 pairing used in VI.12.
- Both evaluation/coevaluation triangle identities commute with the convolution-to-fusion comparison and finite-set transport. A fibre-duality isomorphism alone does not specify the internal dual.
- For a torus, sw* sends weight μ to −μ while D preserves the support weight and dualizes its local system; sw*D therefore sends (μ,L) to (−μ,L∨).

*Needs:* `GeometricSatakeAndFusion:GS3:fusion/fusion-product-and-sign-rule`, `GeometricSatakeAndFusion:GS2:Satake-closure/convolution-preserves-satake-and-dualizability`, `GeometricSatakeAndFusion:GS2:correspondences/satake-category-and-fibre-functor`, `mathlib:CategoryTheory.LeftRigidCategory`, `GeometricSatakeAndFusion:GS2:correspondences/satake-verdier-duality`, `GeometricSatakeAndFusion:GS2:Satake-closure/satake-rigidity`, `VStackSheavesAndLisseCategories:VS3`.

### Examples

The block tuple (x,x,y) with x≠y, the dimension-one PGL₂ minuscule object, the empty-set unit insertion, the diagonal Weil action for a fold, and the torus pair (μ,L) with dual (−μ,L∨) above are the principal acceptance examples. Together they distinguish internal from cross-block collision, dimension from rank, units from zero, representation restriction from induction, and Verdier duality from the internal dual. The displayed Z/5 computation distinguishes inverse Tate stalk action from the parameter-normalization direction.

### Dependencies

GS0:loop-geometry → GS1 → GS2:correspondences → GS2:Satake-closure precedes the fusion layer, with the additional RF2, VS1, RG2.5 and E5 interfaces named above. The eight subsections follow their packet prerequisite graph; the constant-term and duality branches do not feed the initial closure theorem. ClassFieldTheory Layer 9 supplies the Weil group, while the sheaf-theoretic owner supplies Drinfeld transport.

## Suggested Lean and supplier completion

The associated suggested file states only the incidence, integer-parity and sign interfaces whose carriers exist at the pins, in the namespace `TauCetiRoadmap.GeometricSatakeAndFusion`. Its finite-function examples test leg-map direction using existing function composition. The intended final library names above are in `TauCeti.GeometricSatake`. The geometric construction/API tests remain specifications in this reader. The closing comment in the suggested file lists the geometric targets whose carriers are supplied by the earlier roadmaps.

The required VS1 output is the exact IV.7.3 locally constant perfect equivalence with its degree-zero finite-projective specialization, naturality in finite products/diagonals, transported Tate stalk convention and compatible ℓ-adic reductions. VS3 supplies the coefficient comparisons and complete-ring hypotheses; it does not replace the locally constant perfect Drinfeld assertion by a statement about every lisse-site sheaf. The required geometric carriers and hypotheses are those in the opening conventions and supplier contracts. Abstract category and module APIs alone do not supply these constructions. The packet records these as two explicit supplier/carrier gaps and makes no claim of closure or implementation.

## Downstream consumers

The GS4 reconstruction uses ordinary symmetric fibre cohomology and multi-leg tensor compatibility. `HeckeStacksAndLocalShtukas:HS1` and `HS4` use collision, unit and duality comparisons for Hecke kernels. `ExcursionOperatorsAndSpectralAction` uses arbitrary leg maps and their coherent compositions. These consumers import this single fusion interface rather than constructing different symmetries.

## References and pinned inventory

- Laurent Fargues and Peter Scholze, [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), author-hosted 356-page version, SHA-256 `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`, read 19 October 2026. Printed and physical pages agree. The locators above refer to this version. IV.7, VI.7–VI.9, the stated VI.11 pages and IX.7.1 were read for the displayed contracts; no result about the unread published edition is asserted.
- Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` are the packet pins. The actual Mathlib category, root-pairing, representation and projective-module declarations were read, including their hypotheses.
- Current TauCetiRoadmap main, commit `0d144d044dacebca17b654695b6f1ad58f159b27`, and current Tau Ceti, commit `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, were checked for overlap. The imported Weil and root-system owners are identified under scope and supplier contracts. The newform Satake polynomial is a scalar representation-theoretic object, with no mixed-characteristic geometric fusion implementation found by the recorded object-level scan.
