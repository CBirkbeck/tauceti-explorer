# Étale cohomology of diamonds: dimension and compact objects

This is the C8–C9 part of the roadmap. It is a complete target-level planning pass with both stages planned: the statements and dependency graph below distinguish read source arguments, existing library carriers, supplier contracts, and the proof inputs that remain unclosed. Nothing here is claimed to be formalized. The companion packet is authoritative for declaration identifiers and outstanding requests; the suggested file supplies the signatures that can currently be stated against the pinned carriers.

The programme begins with topological dimension and two field invariants, then proves degree-zero direct image before using it in either the spatial cohomological bound or compact generation. C8 supplies dimension to DiamondSixOperations S0–S1. C9 supplies compact objects to S4 and S6; applications must establish its bounds. The canonical-compactification estimate of S1 and compact generation for Bun_G or solid sheaves are separate results owned by their consumers.

## Conventions and existing libraries

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The existing `topologicalKrullDim` takes values in `WithBot ENat`, including minus infinity for empty spaces and plus infinity for unbounded finite chain lengths. On sober spaces the existing order isomorphism between irreducible closed subsets and points relates it to ECD’s specialization chains. We do not define a second generic Krull dimension.

Field degrees take values in `ENat`; pointwise suprema take values in `WithBot ENat`. Algebraic transcendence degree is the cardinal-valued `Algebra.trdeg`. Topological transcendence degree measures a dense intermediate field and must not be replaced by that algebraic invariant of the completed field itself. Its modified version takes a minimum over further complete algebraically closed extensions; the minimum and the subsequent point/presentation suprema are different operations. Question 21.4 is not an available general monotonicity theorem. The finite intermediate-degree monotonicity theorem and equality with the modified invariant in that case are separate nodes. Temkin’s independent and generating degrees are distinguished; the imported primitive perturbation proof remains an explicit source boundary.

Diamond sites, the actual diamond carrier, continuous profinite modules, constructibility and enhanced derived categories are imported. The pinned `continuousCohomology` already supplies the canonical TopRep-to-TopModuleCat carrier; its existence alone does not supply all-degree comparison, Hochschild–Serre or cohomological dimension. All coefficients in the general compactness statements are commutative rings, following this roadmap’s enhanced coefficient convention. Prime-to-p restrictions occur in the geometric point bound, not by fiat in the conditional compactness theorem.

The generated coverage file has no C8/C9 records. The scoped AUDIT-36 records and the separate accepted REV-AUDIT-36 report were read and checked against direct searches. No diamond dimension, topological transcendence degree, quasi-augmented space or diamond compact-object theorem was found in either pinned source tree. Source statements for the baseline citations below were read. The suggested file elaborates against the pinned Mathlib with only proof-placeholder warnings. It represents 14 nodes and explicitly inventories 49 omitted signatures, including their API and tests, whose owning supplier types are required. Elaboration establishes typing, not proofs; neither stage is closed.

## Proof order and acceptance contracts

1. Reuse dimension and algebraic field carriers; construct the dense and modified topological degrees, including size and choice comparisons.
2. Import strictly totally disconnected geometry and bounded base change. Prove 21.14, then its injection case 21.13, without using compact objects.
3. Compute one-point and closed-point-supported sheaves through the canonical continuous-cohomology carrier. Derive the extension inequality from the shared all-degree spectral sequence.
4. Establish wild/tame and residue/value-group estimates, with every valuation and field-cohomology proof recorded below. Establish the quasi-augmented specialization-chain descent before invoking Scheiderer’s bound.
5. Prove 21.11 by support-sensitive induction and Leray; prove 21.16 using the field bounds. The general open U in 21.11 is part of the induction.
6. For compactness, transfer one common bound to every qc separated étale test object, prove left completeness and coproduct compatibility, then prove generation and both directions of the compact-object characterization.

Acceptance must include the empty dimension convention, a strictly totally disconnected space, a local bound that is not globally uniform, and rejection of a compactness application to a nonspatial diamond or without the required bound. A spectral-constructible stratification is required: an arbitrary point/complement partition of a closed disc is insufficient. A nonmaximal valuation plus ring is retained in 21.16; passing to a rank-one base is a proof step, not a change to the public hypotheses.

## Target coverage and source boundaries

The C8 target chain is fibre dimension → dense-field degree → modified degree → analytic/diamond dimension and local finiteness. The point-presentation, direct-image and wild/residue/tame chains then feed the spatial bound, using the separate quasi-augmented spectral-space descent chain. The topological field-test comparison covers Remark 21.8’s v-stack dimension convention. Caraiani–Scholze’s partially proper dimension and fibre-additivity results form a separate analytic chain; their valuative supplier extension has a Part II proposal. Fargues–Scholze Problem I.11.1 remains a question about Zariski closed perfectoid balls, with PerfectoidSpaces:P4 supplying the subspaces.

The C9 target chain begins with bounded filtered compactness, transfers a single finite cohomological bound to all qc separated étale tests, and derives left completeness, the ordinary/enhanced comparison, coproduct compatibility, detection and generation. Both implications of compact iff perfect-constructible have separate nodes. The finite-field specialization recovers bounded constructible complexes. The dimension-bound application supplies a concrete geometric hypothesis implying the uniform bound d+e; every further application must prove its own hypotheses.

ECD Question 21.4 asks for general monotonicity of the unmodified generating degree. The finite theorem assumes finiteness of the intermediate degree; no inference supplies the infinite case. FS Problem I.11.1 asks for well-behaved dimension and agreement of the three invariants on Zariski closed perfectoid balls. Neither question appears as a theorem or prerequisite.

The suggested modified degree uses genuine complete algebraically closed valued-extension data. Its universe cutoff needs a finite-witness size comparison before it models the unrestricted source minimum. The specialization-chain signature uses the original specialization relation on the existing constructible-topology carrier, with x₀ the generalizing vertex. Its first-vertex projection fails to commute with face zero: ordinary augmented hypercover descent does not supply the required quasi-augmentation theorem.

## C8. Dimension and cohomological bounds

### Dimension through the specialization order

Declaration `DiamondEtaleCohomology:C8/specialization-dimension` (lemma).

For a quasi-sober T0 space X, topologicalKrullDim X equals Order.krullDim of X with its specialization order. Thus on locally spectral spaces it is ECD21.1(i), with empty space valued at minus infinity and unbounded finite chain lengths at plus infinity.

Proof or construction:

1. Apply irreducibleSetEquivPoints and Order.krullDim_eq_of_orderIso. Reversing a finite chain, when comparing the source’s indexing convention, preserves its length.

Dependencies: `mathlib:topologicalKrullDim`, `mathlib:irreducibleSetEquivPoints`, `mathlib:Order.krullDim_eq_of_orderIso`.

Acceptance: The empty space gives bottom, not zero. A one-point sober space gives zero.

Source: ECD, Definition21.1(i), p.122.

### Topological fibre dimension

Declaration `DiamondEtaleCohomology:C8/fibre-dimension` (definition).

For a map f:X′→X of topological spaces, fibreDimension(f) is the supremum, over x∈X, of topologicalKrullDim of the subspace {x′ | f(x′)=x}, in WithBot ENat. For the spectral maps of locally spectral spaces in ECD21.1(ii), this is its dimension.

Proof or construction:

1. Form the fibre subspaces with their induced topology and take the indexed supremum in the existing complete lattice. Use specialization-dimension to compare the source convention.

Dependencies: `mathlib:topologicalKrullDim`, `DiamondEtaleCohomology:C8/specialization-dimension`.

Uses:

- ECD21.6: Compare topological fibre dimension with modified residue-field dimension.
- DiamondSixOperations:S1: Topological dimension is a separate term in the proper-support estimate.

API:

- `fibreDimension_eq_iSup` (characterisation): The invariant is the supremum of the dimensions of the fibre subspaces.
- `fibreDimension_le_iff` (characterisation): fibreDimension(f)≤d iff every fibre has dimension≤d.
- `fibreDimension_homeomorph` (compatibility): A commuting square with homeomorphisms on source and target preserves fibreDimension.
- `fibreDimension_id` (simp): For nonempty X the identity has fibreDimension zero.

Unit tests:

- `fibreDimension_empty` (degenerate): A map with empty domain has fibreDimension bottom.
- `fibreDimension_identity` (computation): The identity on any nonempty topological space has fibreDimension zero.
- `fibreDimension_toPoint` (compatibility): For f:X→PUnit, fibreDimension(f)=topologicalKrullDim X.
- `fibreDimension_emptyTarget` (degenerate): The unique function from the empty space to itself has fibreDimension bottom, despite being an identity.

Acceptance: Retain every stated hypothesis; verify each proof step against its named input.

Source: ECD, Definition21.1(ii), p.122.

### Topological transcendence degree

Declaration `DiamondEtaleCohomology:C8/topological-trdeg` (definition).

For an extension K→L of fields with a topology on L, topologicalTrdeg(K,L)∈ENat is the infimum of finite n admitting an intermediate field A⊆L whose underlying subset is dense and whose Algebra.trdeg over K is at most n. If no such finite n exists the value is infinity. ECD21.2 uses this for extensions of complete algebraically closed nonarchimedean fields with their given continuous embeddings.

Proof or construction:

1. Use the existing IntermediateField carrier and Algebra.trdeg; density refers to the subspace inclusion in L. Take the infimum of the corresponding subset of natural numbers embedded in ENat. The least finite bound equals the source’s least attained finite transcendence degree.

Dependencies: `mathlib:Algebra.trdeg`, `mathlib:IntermediateField`, `mathlib:Dense`.

Uses:

- ECD21.3: Finite dense generators control towers and base change.
- ECD21.5–21.7: The modified invariant measures completed residue-field extensions.

API:

- `topologicalTrdeg_le_iff` (characterisation): For n natural, topologicalTrdeg(K,L)≤n iff some dense intermediate field has Algebra.trdeg≤n.
- `topologicalTrdeg_le_of_dense` (constructor): A dense intermediate field of algebraic transcendence degree≤n gives the corresponding upper bound.
- `topologicalTrdeg_eq_top_iff` (characterisation): The value is infinity iff no dense intermediate field has finite algebraic transcendence degree.
- `topologicalTrdeg_self` (simp): topologicalTrdeg(K,K)=0.
- `topologicalTrdeg_equiv` (functoriality): A K-algebra equivalence that is a homeomorphism preserves the invariant.

Unit tests:

- `topologicalTrdeg_self_test` (computation): For any field K with any topology, the identity extension has value zero.
- `topologicalTrdeg_dense_algebraic` (degenerate): If the image of an algebraic intermediate extension A/K is dense in L, the value is zero, even when L/K is not algebraic.
- `topologicalTrdeg_discrete_one` (compatibility): If L has the discrete topology and Algebra.trdeg K L=1, then topologicalTrdeg(K,L)=1.
- `topologicalTrdeg_discrete_infinite` (non-example): For discrete L with infinite algebraic transcendence degree, the value is infinity, not zero.

Acceptance: Retain every stated hypothesis; verify each proof step against its named input.

Source: ECD, Definition21.2, p.122.

### Finite topological generators

Declaration `DiamondEtaleCohomology:C8/finite-topological-generators` (lemma).

For complete algebraically closed nonarchimedean fields K⊆L and n natural, topologicalTrdeg(K,L)≤n iff there exist n elements of L such that L is the smallest complete algebraically closed subfield of L containing K and those elements.

Proof or construction:

1. For a dense intermediate A/K of transcendence degree at most n, choose a finite transcendence basis and pad its tuple. Any closed algebraically closed intermediate field containing the tuple contains every element algebraic over it, hence A, hence L.
2. Conversely let the tuple have the stated minimality property. The relative algebraic closure of K(tuple) in L is algebraically closed. Its closure is a complete algebraically closed subfield by the characteristic-independent coefficient/root approximation in Conrad §2. Minimality makes that closure L, so the relative algebraic closure is a dense intermediate field of degree at most n.
3. For the approximation step, approximate a monic polynomial by same-degree monic polynomials over the dense algebraically closed subfield. Their roots are uniformly bounded. In a finite splitting extension of the complete field, select a subsequence approaching one of the finitely many roots; completeness returns its limit to the original field. The valued finite-extension norm input is retained in the completion gap.

Dependencies: `DiamondEtaleCohomology:C8/topological-trdeg`.

Acceptance: The case n=0 is compatible with a complete algebraically closed base. Complete and algebraically closed are both retained.

Source: ECD, After Definition21.2 and proof of Lemma21.3, p.122; CONRAD, Theorem 1.1 and §2, pp.1–3.

### Topological transcendence degree in a tower

Declaration `DiamondEtaleCohomology:C8/topological-trdeg-tower` (lemma).

For complete algebraically closed nonarchimedean fields K⊆L⊆M, topologicalTrdeg(K,M)≤topologicalTrdeg(L,M)+topologicalTrdeg(K,L) in ENat.

Proof or construction:

1. An infinite term makes the inequality automatic. For finite terms combine two finite lists from finite-topological-generators.
2. Any complete algebraically closed subfield containing the combined list contains L and then M. Apply finite-topological-generators again.

Dependencies: `DiamondEtaleCohomology:C8/finite-topological-generators`.

Acceptance: Retain every stated hypothesis; verify each proof step against its named input.

Source: ECD, Lemma21.3(i) and proof, p.122.

### Topological transcendence degree after dense compositum

Declaration `DiamondEtaleCohomology:C8/topological-trdeg-base-change` (lemma).

For a commutative square of continuous embeddings K⊆K′ and L⊆L′ of complete algebraically closed nonarchimedean fields, with K′ embedded in L′ and the relative algebraic closure of LK′ dense in L′, topologicalTrdeg(L,L′)≤topologicalTrdeg(K,K′).

Proof or construction:

1. Choose finite topological generators of K′ over K when the bound is finite.
2. The smallest complete algebraically closed subfield of L′ containing L and the generators contains K′; the density assumption then makes it L′.

Dependencies: `DiamondEtaleCohomology:C8/finite-topological-generators`.

Acceptance: An arbitrary unrelated square without dense algebraic compositum is not admitted.

Source: ECD, Lemma21.3(ii) and proof, p.122.

### Modified topological transcendence degree

Declaration `DiamondEtaleCohomology:C8/modified-topological-trdeg` (definition).

For complete algebraically closed nonarchimedean fields K⊆L, modifiedTopologicalTrdeg(K,L) is the minimum in ENat of topologicalTrdeg(K,E) over further complete algebraically closed valued extensions E of L, with compatible continuous embeddings. Equivalently it is the infimum of finite n admitting such E and a dense intermediate field of E over K of algebraic transcendence degree≤n. The implementation must use a proved universe bound for finite witnesses; it may not simply quantify over a proper class.

Proof or construction:

1. Use the finite-witness predicate on natural numbers and take its infimum. The value is infinity if there is no finite witness.
2. Finite-witness size reduction is required before choosing a universe of extension fields; this is recorded as a gap.

Dependencies: `DiamondEtaleCohomology:C8/topological-trdeg`, `DiamondsAndVStacks:D0/completion-cardinality-bound`.

Uses:

- ECD21.5–21.7: Makes residue-field dimension insensitive to enlargement of representatives.
- ECD21.16: The valuation lower bound survives further extensions and therefore descends to this minimum.

API:

- `modifiedTopologicalTrdeg_le_iff` (characterisation): A finite bound n is equivalent to a further extension with topologicalTrdeg at most n.
- `modifiedTopologicalTrdeg_le` (relation): modifiedTopologicalTrdeg(K,L)≤topologicalTrdeg(K,L), using E=L.
- `modifiedTopologicalTrdeg_mono` (functoriality): For K⊆L⊆M, modifiedTopologicalTrdeg(K,L)≤modifiedTopologicalTrdeg(K,M).
- `modifiedTopologicalTrdeg_equiv` (compatibility): Compatible topological valued-field equivalences preserve the invariant.

Unit tests:

- `modifiedTopologicalTrdeg_identity` (computation): The identity extension has value zero.
- `modifiedTopologicalTrdeg_zeroWitness` (degenerate): Any further extension E with topologicalTrdeg(K,E)=0 forces modifiedTopologicalTrdeg(K,L)=0.
- `modifiedTopologicalTrdeg_noFiniteWitness` (non-example): If every further extension has infinite topologicalTrdeg over K, the modified invariant is infinity.
- `modifiedTopologicalTrdeg_vsOriginal` (compatibility): When every further extension E satisfies topologicalTrdeg(K,L)≤topologicalTrdeg(K,E), the modified and original invariants agree; this monotonicity is an explicit hypothesis, not an unconditional theorem.

Acceptance: Retain every stated hypothesis; verify each proof step against its named input.

Source: ECD, Paragraph before Definition21.5, p.123.

### Modified transcendence degree in a tower

Declaration `DiamondEtaleCohomology:C8/modified-trdeg-tower` (lemma).

For complete algebraically closed nonarchimedean fields K⊆L⊆M, modifiedTopologicalTrdeg(K,M)≤modifiedTopologicalTrdeg(L,M)+modifiedTopologicalTrdeg(K,L).

Proof or construction:

1. For finite bounds choose witnesses for both minima.
2. Place the witnesses into compatible complete algebraically closed valued extensions using a valued amalgamation argument, then apply topological-trdeg-tower and the defining infimum. The compatible amalgamation and density details are a recorded gap.

Dependencies: `DiamondEtaleCohomology:C8/modified-topological-trdeg`, `DiamondEtaleCohomology:C8/topological-trdeg-tower`, `DiamondEtaleCohomology:C8/topological-trdeg-base-change`.

Acceptance: Retain every stated hypothesis; verify each proof step against its named input.

Source: ECD, Paragraph before Definition21.5, p.123.

### Modified transcendence degree after base change

Declaration `DiamondEtaleCohomology:C8/modified-trdeg-base-change` (lemma).

In the commutative square and dense-algebraic-compositum situation of21.3(ii), modifiedTopologicalTrdeg(L,L′)≤modifiedTopologicalTrdeg(K,K′).

Proof or construction:

1. Extend a finite witness above K′ and amalgamate over K′ with L′.
2. Apply topological-trdeg-base-change in the enlarged field and the definition of the modified infimum. The valued amalgamation step shares the explicit gap in modified-trdeg-tower.

Dependencies: `DiamondEtaleCohomology:C8/modified-topological-trdeg`, `DiamondEtaleCohomology:C8/topological-trdeg-base-change`.

Acceptance: Retain every stated hypothesis; verify each proof step against its named input.

Source: ECD, Paragraph before Definition21.5 and Remark21.8, p.123.

### Geometric transcendence dimension of an analytic map

Declaration `DiamondEtaleCohomology:C8/analytic-dim-trg` (definition).

For a map f:X′→X of analytic adic spaces, analyticDimTrg(f)∈WithBot ENat is the supremum over x′∈X′ of modifiedTopologicalTrdeg(C(f(x′)),C(x′)), where C(x) is a completed algebraic closure of the completed residue field. The comparison embeddings must lie over the residue-field map.

Proof or construction:

1. Use the stalkwise valued residue fields of upstream AdicSpaces Layer3, then completion and algebraic closure.
2. Take the pointwise supremum; compare choices through common complete algebraically closed extensions using modified-trdeg-base-change. Choice independence still needs the precise valued embedding argument recorded in the gap list.

Dependencies: `DiamondEtaleCohomology:C8/modified-topological-trdeg`, `DiamondEtaleCohomology:C8/modified-trdeg-base-change`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-3-rational-localisation-and-the-structure-presheaf`.

Uses:

- ECD21.6: Bounds topological fibre dimension.
- PAPER-CARAIANI-SCHOLZE-17/69: Keep geometric transcendence dimension distinct from the topological Krull dimension of a partially proper analytic space.

API:

- `analyticDimTrg_le_iff` (characterisation): analyticDimTrg(f)≤d iff every displayed completed residue-field contribution is≤d.
- `analyticDimTrg_equiv` (compatibility): Isomorphic analytic morphisms have the same invariant.
- `analyticDimTrg_empty` (simp): A map with empty source has dimension bottom.
- `analyticDimTrg_field` (simp): For a map of rank-one algebraically closed field spectra, the invariant equals modifiedTopologicalTrdeg of the field extension.

Unit tests:

- `analyticDimTrg_empty_test` (degenerate): Empty analytic source gives bottom.
- `analyticDimTrg_identity_point` (computation): The identity of a nonempty algebraically closed field spectrum has dimension zero.
- `analyticDimTrg_field_test` (compatibility): A compatible extension C⊆D of complete algebraically closed fields gives the field invariant on Spa(D,O_D)→Spa(C,O_C).

Acceptance: Retain every stated hypothesis; verify each proof step against its named input.

Source: ECD, Definition21.5, p.123.

### Topological dimension bounded by geometric transcendence dimension

Declaration `DiamondEtaleCohomology:C8/analytic-dimension-bound` (theorem).

For a morphism f of analytic adic spaces, fibreDimension(f)≤analyticDimTrg(f).

Proof or construction:

1. Use the valuative chain/rationalized-value-group estimate from Huber1.8.5(i).
2. Rationalized value groups do not change on passing to completed algebraic closure and embed under extension; combine with the minimum defining modifiedTopologicalTrdeg. The full Huber proof and the completion comparison remain explicit proof inputs to establish.

Dependencies: `DiamondEtaleCohomology:C8/fibre-dimension`, `DiamondEtaleCohomology:C8/analytic-dim-trg`.

Acceptance: Retain every stated hypothesis; verify each proof step against its named input.

Source: ECD, Lemma21.6 and proof, p.123.

### Geometric transcendence dimension of a diamond map

Declaration `DiamondEtaleCohomology:C8/diamond-dim-trg` (definition).

For f:Y′→Y of diamonds, choose at each y′ over y a quasi-pro-étale field point Spa(C(y),C(y)+)→Y and a quasi-pro-étale point Spa(C(y′),C(y′)+) of its pullback through y′. diamondDimTrg(f) is the supremum of modifiedTopologicalTrdeg(C(y),C(y′)) over y′ in WithBot ENat. Independence of choices is required. For f representable in diamonds between v-stacks, take the supremum over all diamond base changes X→Y.

Proof or construction:

1. Use D4–D5 field-point and quasi-pro-étale presentations.
2. Compare two representatives in a common pullback using modified-trdeg-base-change; the precise comparison and cutoff independence are recorded proof gaps. Take the point supremum, then the test-object supremum for v-stacks.

Dependencies: `DiamondEtaleCohomology:C8/modified-topological-trdeg`, `DiamondEtaleCohomology:C8/modified-trdeg-base-change`, `DiamondsAndVStacks:D5/relative-representability`, `DiamondsAndVStacks:D5`.

Uses:

- DiamondSixOperations:S0: Eligibility requires local finite bounds.
- DiamondSixOperations:S1: A uniform bound controls proper-support pushforward.
- ECD21.16: Bounds maximal-point cohomological dimension.

API:

- `diamondDimTrg_le_iff` (characterisation): For diamond maps, the bound d holds iff every point-field contribution is≤d.
- `diamondDimTrg_vstack` (characterisation): For representable v-stack maps the bound is tested on all diamond base changes.
- `diamondDimTrg_empty` (simp): Empty source gives bottom.
- `diamondDimTrg_point` (compatibility): On compatible algebraically closed field points this is the modified field invariant.
- `diamondDimTrg_representative` (compatibility): Changing the quasi-pro-étale point representatives preserves the value.

Unit tests:

- `diamondDimTrg_empty_test` (degenerate): Empty source gives bottom.
- `diamondDimTrg_identity_point` (computation): The identity of Spa(C,O_C) has value zero.
- `diamondDimTrg_field_test` (compatibility): Spa(D,O_D)→Spa(C,O_C) gives modifiedTopologicalTrdeg(C,D).
- `diamondDimTrg_bottom` (non-example): Nonempty source has value at least zero, never bottom.

Acceptance: Retain every stated hypothesis; verify each proof step against its named input.

Source: ECD, Definition21.7 and Remark21.8, p.123.

### Geometric transcendence dimension under pullback

Declaration `DiamondEtaleCohomology:C8/diamond-dim-base-change` (lemma).

For f representable in diamonds and any base change g, diamondDimTrg(g* f)≤diamondDimTrg(f).

Proof or construction:

1. For diamond maps apply modified-trdeg-base-change to compatible point fields and take their supremum.
2. For v-stacks every test of the pullback is a test of the original morphism.

Dependencies: `DiamondEtaleCohomology:C8/diamond-dim-trg`, `DiamondEtaleCohomology:C8/modified-trdeg-base-change`.

Acceptance: Retain every stated hypothesis; verify each proof step against its named input.

Source: ECD, Remark21.8, p.123.

### Geometric transcendence dimension of a composite

Declaration `DiamondEtaleCohomology:C8/diamond-dim-composition` (lemma).

For composable maps g:Z→Y and f:Y→X representable in diamonds with nonempty Z, diamondDimTrg(f∘g)≤diamondDimTrg(g)+diamondDimTrg(f). For empty Z the composite has bottom dimension; this separates the empty case from arithmetic involving infinity.

Proof or construction:

1. Choose compatible point presentations, apply modified-trdeg-tower, bound both terms by their suprema, then take the supremum over source points and diamond tests.

Dependencies: `DiamondEtaleCohomology:C8/diamond-dim-trg`, `DiamondEtaleCohomology:C8/modified-trdeg-tower`.

Acceptance: Retain every stated hypothesis; verify each proof step against its named input.

Source: ECD, Lemma21.3, modified paragraph and Definitions21.5–21.7, pp.122–123.

### Local finiteness of geometric transcendence dimension

Declaration `DiamondEtaleCohomology:C8/locally-finite-dim-trg` (definition).

For f representable in locally spatial diamonds, LocallyFiniteDimTrg(f) means that after every locally spatial diamond test X→Y, each point of Y′×_Y X has an open neighborhood W and a natural number d with diamondDimTrg(W→X)≤d. Bounds depend on the neighborhood. For maps of locally spatial diamonds, base-change stability makes this equivalent to the source-neighborhood condition before testing.

Proof or construction:

1. Use source neighborhoods in each locally spatial pullback and require a finite natural bound.
2. Use diamond-dim-base-change and the identity test to compare the two formulations.

Dependencies: `DiamondEtaleCohomology:C8/diamond-dim-trg`, `DiamondEtaleCohomology:C8/diamond-dim-base-change`, `DiamondsAndVStacks:D5/relative-representability`.

Uses:

- DiamondSixOperations:S0: One of the eligibility conditions.
- DiamondSixOperations:S4: Target v-descent retains this as a hypothesis on f itself.

API:

- `locallyFiniteDimTrg_of_bound` (constructor): A finite global bound implies the local condition.
- `locallyFiniteDimTrg_openCover` (characterisation): On locally spatial diamond maps, an open source cover with finite bounds is equivalent to the predicate.
- `locallyFiniteDimTrg_baseChange` (functoriality): Base change preserves the predicate.
- `locallyFiniteDimTrg_identity` (simp): Identity morphisms satisfy the predicate.

Unit tests:

- `locallyFiniteDimTrg_empty` (degenerate): Empty source satisfies the predicate.
- `locallyFiniteDimTrg_identity_test` (computation): The identity has bound zero.
- `locallyFiniteDimTrg_localNotUniform` (non-example): A disjoint union of maps of finite but unbounded component dimensions is locally finite without a uniform global finite bound.

Acceptance: Retain every stated hypothesis; verify each proof step against its named input.

Source: ECD, Convention22.1, p.127; Definitions21.7–21.8, p.123.

### Étale acyclicity of strictly totally disconnected spaces

Declaration `DiamondEtaleCohomology:C8/strictly-disconnected-acyclic` (lemma).

For strictly totally disconnected perfectoid X, every abelian étale sheaf F has H^i(X_et,F)=0 for i>0.

Proof or construction:

1. D1 says each étale cover splits. A locally liftable section under a sheaf epimorphism therefore lifts globally, so global sections is exact.
2. Use C0/E1 identification of étale cohomology with the derived global-sections functor.

Dependencies: `DiamondsAndVStacks:D1/strictly-totally-disconnected`, `DiamondEtaleCohomology:C0`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`.

Acceptance: All abelian étale sheaves are allowed; arbitrary v-sheaves are not asserted acyclic.

Source: ECD, Remark21.14, p.125.

### Degree-zero direct image for quasi-pro-étale maps

Declaration `DiamondEtaleCohomology:C8/qpetale-direct-image` (theorem).

For a quasicompact separated quasi-pro-étale map j:U→Y of locally spatial diamonds, R^i j_et,* F=0 for every abelian étale sheaf F and i>0.

Proof or construction:

1. Use C1 Corollary16.10 and enough points to reduce to a strictly totally disconnected base.
2. D1 Lemma7.19 and D5 quasi-pro-étale representability make the pulled-back source strictly totally disconnected. Apply strictly-disconnected-acyclic.

Dependencies: `DiamondEtaleCohomology:C1`, `DiamondsAndVStacks:D1/pro-etale-maps-over-std-base`, `DiamondsAndVStacks:D5/quasi-pro-etale-and-fibre-product-permanence`, `DiamondEtaleCohomology:C8/strictly-disconnected-acyclic`.

Acceptance: Keep both quasicompact and separated; this proof does not invoke C9.

Source: ECD, Remark21.14, p.125.

### Degree-zero direct image for a quasicompact injection

Declaration `DiamondEtaleCohomology:C8/injection-direct-image` (lemma).

For a quasicompact injection j:U→Y of locally spatial diamonds, R^i j_et,* F=0 for every abelian étale F and i>0.

Proof or construction:

1. D5 identifies the injection with a pro-constructible generalizing subdiamond. After strictly totally disconnected pullback it is affinoid pro-étale and separated.
2. Apply qpetale-direct-image.

Dependencies: `DiamondEtaleCohomology:C8/qpetale-direct-image`, `DiamondsAndVStacks:D5/injection-and-finite-etale-permanence`.

Acceptance: Includes quasicompact open immersions; no blanket assertion about all open immersions.

Source: ECD, Lemma21.13 and proof, p.125.

### A one-point diamond as a profinite quotient

Declaration `DiamondEtaleCohomology:C8/point-quotient` (theorem).

A quasiseparated diamond Y with exactly one underlying point is Spa(C,O_C)/G for a complete algebraically closed nonarchimedean field C of characteristic p and a profinite group G acting continuously and faithfully on C.

Proof or construction:

1. Choose a quasi-pro-étale field-point surjection. Its relation is quasicompact by quasiseparatedness and is affinoid pro-étale by D1 Lemma7.19, hence Spa(C,O_C)×S for profinite S.
2. The relation composition, identity and inversion give S a continuous group structure; the second projection gives the faithful field action. Descend the equivalence-relation quotient.

Dependencies: `DiamondsAndVStacks:D5/universally-open-presentation`, `DiamondsAndVStacks:D1/pro-etale-maps-over-std-base`, `DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products`, `DiamondsAndVStacks:D5`.

Acceptance: Use the sheaf quotient of an equivalence relation; an arbitrary stack quotient is not a substitute.

Source: ECD, Proposition21.9 and proof, pp.123–124.

### Uniqueness of the profinite point presentation

Declaration `DiamondEtaleCohomology:C8/point-quotient-unique` (lemma).

Two faithful presentations of the same one-point quasiseparated diamond yield isomorphic valued-field/profinite-group pairs. The isomorphism need not be unique.

Proof or construction:

1. Their fibre product is affinoid pro-étale over both field points. Choosing a point gives an isomorphism of fields over Y.
2. Recover each group as the automorphism group of its covering map.

Dependencies: `DiamondEtaleCohomology:C8/point-quotient`, `DiamondsAndVStacks:D1/pro-etale-maps-over-std-base`.

Acceptance: Retain every stated hypothesis; verify each proof step against its named input.

Source: ECD, Proposition21.9, uniqueness paragraph, p.124.

### Sheaves at a diamond point as discrete modules

Declaration `DiamondEtaleCohomology:C8/point-sheaf-equivalence` (comparison).

For Y=Spa(C,O_C)/G as in21.9, abelian étale sheaves on Y are equivalent to discrete abelian groups with continuous G-action. Global sections correspond to G-invariants.

Proof or construction:

1. Étale abelian sheaves on the algebraically closed field point are abelian groups.
2. Descent over Spa(C,O_C)×G is a continuous action on that discrete group; the cocycle condition is the action law. Identify invariant sections.

Dependencies: `DiamondEtaleCohomology:C8/point-quotient`, `DiamondEtaleCohomology:C0`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-0-discrete-modules-and-continuous-sections`.

Acceptance: Retain every stated hypothesis; verify each proof step against its named input.

Source: ECD, Paragraph after Proposition21.9, p.124.

### Point cohomology is canonical continuous cohomology

Declaration `DiamondEtaleCohomology:C8/point-cohomology` (comparison).

Under point-sheaf-equivalence, H^i(Y_et,F) is naturally isomorphic to the underlying abelian group of the pinned continuousCohomology i on the corresponding discrete module through the upstream TopRep dictionary. This holds for all i and commutes with coefficient maps and changes of point presentation.

Proof or construction:

1. The acyclic field cover and Cartan–Leray yield continuous cochains.
2. Use the upstream all-degree comparison to the canonical homogeneous-cochain carrier. Check degree zero against invariants and naturality against coefficient maps.

Dependencies: `DiamondEtaleCohomology:C8/point-sheaf-equivalence`, `DiamondEtaleCohomology:C8/strictly-disconnected-acyclic`, `DiamondsAndVStacks:D0/cech-to-derived-comparison`, `mathlib:continuousCohomology`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`.

Acceptance: Retain every stated hypothesis; verify each proof step against its named input.

Source: ECD, After Proposition21.9, p.124; proof of21.15, p.126.

### Cohomological dimension at a maximal point

Declaration `DiamondEtaleCohomology:C8/point-cd` (definition).

For a maximal point y of a quasiseparated diamond Y and prime ℓ, pointCd(ℓ,y)∈ENat is cd_ℓ(G_y) for any faithful presentation Y_y=Spa(C_y,O_Cy)/G_y. The invariant quantifies over all discrete ℓ-primary torsion modules; no fixed common exponent is imposed.

Proof or construction:

1. Use the maximal-point subdiamond and point-quotient.
2. Apply point-quotient-unique and the supplier’s invariance of cohomological dimension under continuous group isomorphism.

Dependencies: `DiamondEtaleCohomology:C8/point-quotient`, `DiamondEtaleCohomology:C8/point-quotient-unique`, `DiamondEtaleCohomology:C8/point-cohomology`, `DiamondsAndVStacks:D5/injection-and-finite-etale-permanence`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension`.

Uses:

- ECD21.11: The supremum over maximal points controls global cohomology.
- ECD21.15: The generic-point value bounds closed-point-supported sheaves.

API:

- `pointCd_presentation` (characterisation): For every faithful presentation, pointCd(ℓ,y)=cd_ℓ(G_y).
- `pointCd_le_iff` (characterisation): The finite bound n is equivalent to vanishing in degrees>n for all ℓ-primary torsion étale sheaves on Y_y.
- `pointCd_equiv` (compatibility): Isomorphisms of pointed diamonds preserve the invariant.

Unit tests:

- `pointCd_closedField` (computation): The algebraically closed field point Spa(C,O_C) has value zero.
- `pointCd_presentation_test` (compatibility): For every faithful quotient presentation the value is the upstream cd_ℓ of its profinite group.
- `pointCd_unbounded` (non-example): Nonzero ℓ-primary torsion cohomology in arbitrarily high degrees forces infinite pointCd.

Acceptance: Retain every stated hypothesis; verify each proof step against its named input.

Source: ECD, Definition21.10, p.124.

### Closed inclusion of specialization stabilizers

Declaration `DiamondEtaleCohomology:C8/specialization-stabilizers` (lemma).

For a spatial diamond Y whose underlying space is local with closed point s and generic point η, the presentation Spa(C,C+)→Y in21.15 gives profinite groups G_y at the points. If y′ generalizes y, then G_y embeds as a closed subgroup of G_y′; in particular G_s≤G_η.

Proof or construction:

1. The relation is affinoid pro-étale. Its fibre at the unique lift of y is the space of sections over Spa(C,C_y+).
2. Unique generalization induces injective continuous maps of these profinite groups; compact-to-Hausdorff makes the image closed.

Dependencies: `DiamondEtaleCohomology:C8/point-quotient`, `DiamondsAndVStacks:D1/pro-etale-maps-over-std-base`, `DiamondsAndVStacks:D5/universally-open-presentation`, `DiamondsAndVStacks:D5`.

Acceptance: Retain every stated hypothesis; verify each proof step against its named input.

Source: ECD, Proposition21.15, proof first two paragraphs, p.126.

### Cohomology with support at the closed point

Declaration `DiamondEtaleCohomology:C8/closed-point-cohomology` (comparison).

In21.15, an abelian étale sheaf F with zero restriction to Y minus {s} corresponds to a discrete continuous G_s-module, and its cohomology is canonically the continuous cohomology of that module.

Proof or construction:

1. After pullback to Spa(C,C+) the sheaf is supported at the closed point, hence is an abelian group.
2. Descent is precisely the G_s action. Apply Cartan–Leray to identify cohomology, with the same canonical carrier comparison used in point-cohomology.

Dependencies: `DiamondEtaleCohomology:C8/specialization-stabilizers`, `DiamondEtaleCohomology:C8/point-cohomology`, `DiamondsAndVStacks:D0/cech-to-derived-comparison`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`.

Acceptance: Retain every stated hypothesis; verify each proof step against its named input.

Source: ECD, Proposition21.15, last proof paragraph, p.126.

### Closed-point support and generic-point cohomological dimension

Declaration `DiamondEtaleCohomology:C8/closed-point-bound` (theorem).

For spatial Y with local underlying space, closed point s and generic point η, an ℓ-torsion étale sheaf F vanishing off s satisfies H^i(Y,F)=0 for i>pointCd(ℓ,η).

Proof or construction:

1. Identify cohomology through closed-point-cohomology.
2. Use specialization-stabilizers and the upstream closed-subgroup inequality cd_ℓ(G_s)≤cd_ℓ(G_η).

Dependencies: `DiamondEtaleCohomology:C8/closed-point-cohomology`, `DiamondEtaleCohomology:C8/specialization-stabilizers`, `DiamondEtaleCohomology:C8/point-cd`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension`.

Acceptance: The statement assumes spatiality and the local underlying space; no arbitrary point-support assertion is substituted.

Source: ECD, Proposition21.15, p.126.

### Cohomological dimension of a profinite extension

Declaration `DiamondEtaleCohomology:C8/extension-cd-bound` (lemma).

For an exact sequence of profinite groups 1→N→G→Q→1 with N closed and normal and the quotient topology on Q, cd_ℓ(G)≤cd_ℓ(N)+cd_ℓ(Q). The coefficient category is all discrete ℓ-primary torsion modules.

Proof or construction:

1. Instantiate the shared all-degree continuous Hochschild–Serre sequence E2^(a,b)=H^a(Q,H^b(N,M))⇒H^(a+b)(G,M).
2. For finite bounds the E2 terms vanish outside the rectangle a≤cd_ℓ(Q), b≤cd_ℓ(N); use convergence to deduce vanishing above the sum. Infinite bounds are automatic.

Dependencies: `ArithmeticGaloisDuality:R02.1`, `ArithmeticGaloisDuality:R02.2`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension`.

Acceptance: Identify the edge maps with canonical restriction/inflation, rather than invoking only a five-term sequence.

Source: ECD, Proposition21.16, final inequality, p.127.

### Wild continuous automorphisms in characteristic p

Declaration `DiamondEtaleCohomology:C8/wild-automorphism` (lemma).

Let C be complete algebraically closed nonarchimedean of characteristic p. If a continuous automorphism γ satisfies γ^(n!)→1 pointwise and acts trivially on C×/(1+C°°), then γ^(p^n)→1 pointwise.

Proof or construction:

1. The source passes to the procyclic profinite closure of γ. Establishing the required topology and compactness is an explicit proof obligation in the gap list.
2. Using profinite Sylow, reduce a non-pro-p factor to a pro-ℓ cyclic group for ℓ≠p.
3. If γ(x)≠x, choose y with the size of γ(x)/x−1. The residue of (g(x)/x−1)/y is a nonzero continuous homomorphism to the additive residue field. Triviality on leading terms proves its additivity. A pro-ℓ group has no nontrivial continuous map to this discrete p-torsion group, a contradiction.

Dependencies: `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-2-profinite-sylow-theory`, `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-3-pro-p-groups-the-maximal-pro-p-quotient-frattini-theory-generation`.

Acceptance: Both pointwise factorial-power convergence and the leading-term action hypothesis are retained.

Source: ECD, Lemma21.17 and proof, p.127.

### The wild kernel is pro-p

Declaration `DiamondEtaleCohomology:C8/wild-kernel-pro-p` (lemma).

For a continuous faithful action of a profinite group G on an algebraically closed complete nonarchimedean field C′ of characteristic p, the closed normal kernel P of its action on C′×/(1+C′°°) is pro-p.

Proof or construction:

1. Each element of P satisfies the factorial-power convergence hypothesis by continuity of the action from a profinite group.
2. Apply wild-automorphism to its procyclic closure. Every finite quotient of P has only p-power-order elements, hence is a p-group; use the upstream finite-quotient criterion.

Dependencies: `DiamondEtaleCohomology:C8/wild-automorphism`, `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-3-pro-p-groups-the-maximal-pro-p-quotient-frattini-theory-generation`, `tauceti:TauCeti.IsProP`.

Acceptance: Retain every stated hypothesis; verify each proof step against its named input.

Source: ECD, Proposition21.16, first proof paragraph, p.126.

### Removing a pro-p kernel from cohomological dimension

Declaration `DiamondEtaleCohomology:C8/prime-to-p-wild-removal` (lemma).

For a closed normal pro-p subgroup P of a profinite G and ℓ≠p, cd_ℓ(G)=cd_ℓ(G/P).

Proof or construction:

1. Finite-quotient averaging and the all-degree coefficient-colimit comparison give H^b(P,M)=0 for b>0 and discrete ℓ-primary torsion M.
2. Hochschild–Serre collapses to H^a(G,M)=H^a(G/P,M^P). This yields one inequality; inflate each G/P module to get the reverse.

Dependencies: `DiamondEtaleCohomology:C8/extension-cd-bound`, `ArithmeticGaloisDuality:R02.1`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension`, `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-3-pro-p-groups-the-maximal-pro-p-quotient-frattini-theory-generation`.

Acceptance: Retain every stated hypothesis; verify each proof step against its named input.

Source: ECD, Proposition21.16, first proof paragraph, p.126.

### The residue action as an absolute Galois group

Declaration `DiamondEtaleCohomology:C8/residue-galois-identification` (lemma).

In21.16, for complete algebraically closed C⊆C′ fixed by a continuous faithful profinite G-action, let k⊆k′ be residue fields and I the kernel of the residue action. Then k0′=(k′)^(G/I) is perfect, k′ is its algebraic closure, and G/I identifies topologically with Gal(k′/k0′).

Proof or construction:

1. Continuity of the action on the discrete residue field makes each orbit finite, so every residue element is algebraic over the invariants.
2. The invariant field is perfect since the unique pth root in k′ of an invariant element is invariant.
3. Apply the profinite infinite-Galois correspondence to the faithful action. The precise infinite-Galois proof and its supplier comparison are recorded as unfinished proof work.

Dependencies: `DiamondEtaleCohomology:C8/wild-kernel-pro-p`.

Acceptance: Retain every stated hypothesis; verify each proof step against its named input.

Source: ECD, Proposition21.16, residue-action paragraph, p.126.

### Residue-field transcendence bound

Declaration `DiamondEtaleCohomology:C8/residue-cd-bound` (theorem).

If k is algebraically closed of characteristic p, F/k is a perfect field extension and ℓ≠p, then cd_ℓ(G_F)≤trdeg(F/k), interpreted in ENat, with infinity for infinite transcendence degree.

Proof or construction:

1. For finite transcendence degree this requires the geometric field cohomological-dimension theorem, its finite-generation reduction and continuity over subfields. ECD invokes the result without supplying these proofs.
2. The exact field-theoretic proof is an explicit gap owned by C8; no local-field cd=2 theorem or fixed finite coefficient case is substituted.

Dependencies: `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension`.

Acceptance: Algebraic extensions of the algebraically closed base give zero; retain ℓ≠p and the all-discrete-torsion scope.

Source: ECD, Proposition21.16, residue-field bound, p.126.

### The tame-inertia character embedding

Declaration `DiamondEtaleCohomology:C8/tame-character-embedding` (theorem).

In21.16, with rational value groups Γ⊆Γ′ and residue fields k⊆k′, the tame quotient I/P embeds continuously into Hom(Γ′/Γ,μ∞(k)). If r=dim_Q(Γ′/Γ) is finite, this character group is the prime-to-p finite-adele group of rank r. The embedding is a closed embedding because I/P is compact.

Proof or construction:

1. The leading-term exact sequence has kernel k′× and quotient Γ′. An inertia element gives the character [v(x)]↦res(g(x)/x), trivial on Γ and independent of x.
2. The kernel is P. Continuity and profiniteness force the character values to be roots of unity, and these lie in k because k is algebraically closed.
3. Identify characters of the Q-vector group Γ′/Γ with the finite-adele module after a basis choice. The topology and this nontrivial character-group computation require the explicit remaining proof decomposition.

Dependencies: `DiamondEtaleCohomology:C8/wild-kernel-pro-p`, `DiamondEtaleCohomology:C8/residue-galois-identification`.

Acceptance: Retain arbitrary rational value-group rank until the finite-dimension hypothesis is used; do not replace Γ′/Γ by a cyclic discrete value group.

Source: ECD, Proposition21.16, tame-inertia paragraph, p.127.

### Cohomological dimension of tame inertia

Declaration `DiamondEtaleCohomology:C8/tame-cd-bound` (lemma).

For ℓ≠p and finite r=dim_Q(Γ′/Γ) in21.16, cd_ℓ(I/P)≤r.

Proof or construction:

1. Use the tame-character-embedding as a closed embedding.
2. Compute the ℓ-cohomological bound for compact subgroups of the prime-to-p adele vector group using ℤ_ℓ^r lattices and the prime-to-ℓ factor, then apply the upstream closed-subgroup bound. The lattice cohomology calculation is an explicit unfinished proof input.

Dependencies: `DiamondEtaleCohomology:C8/tame-character-embedding`, `DiamondEtaleCohomology:C8/extension-cd-bound`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension`.

Acceptance: Retain every stated hypothesis; verify each proof step against its named input.

Source: ECD, Proposition21.16, p.127.

### Residue and value-group transcendence inequality

Declaration `DiamondEtaleCohomology:C8/valuation-transcendence-bound` (theorem).

For complete algebraically closed nonarchimedean C⊆C′, with residue fields k⊆k′ and value groups Γ⊆Γ′, trdeg(k′/k)+dim_Q(Γ′/Γ)≤modifiedTopologicalTrdeg(C,C′), with finite-cardinal ranks interpreted in ENat and infinite ranks as infinity.

Proof or construction:

1. For a finite set of algebraically independent residue classes and rationally independent value classes modulo the base value group, choose lifts a_i and b_j. A nonzero polynomial in their combined lifts groups by b-monomials. Each nonzero coefficient polynomial in the a_i has value in the base group: scale its coefficients to maximal norm one and use residue independence to prevent cancellation. Distinct b-monomials have distinct values modulo the base group, so the resulting sum cannot cancel. The lifts are algebraically independent.
2. Take suprema of finite residue and rational-rank witnesses to obtain the valuation transcendence inequality for each dense intermediate field. Density preserves residue field and value group, since approximating x with error smaller than |x| preserves its value and its leading residue.
3. Algebraic extensions change residue fields algebraically and value groups only by torsion; completion is immediate in rank one. Thus pass through completed algebraic closures and then further valued extensions, where the two ranks only increase. Apply the finite bound to every witness and take the modified infimum. The detailed rank and topology comparisons are recorded for refinement; the cited Bourbaki proof was not accessible.

Dependencies: `DiamondEtaleCohomology:C8/modified-topological-trdeg`, `mathlib:Algebra.trdeg`.

Acceptance: Retain every stated hypothesis; verify each proof step against its named input.

Source: ECD, Proposition21.16, final proof paragraph, p.127.

### Maximal-point cohomological dimension bound

Declaration `DiamondEtaleCohomology:C8/point-cd-geometric-bound` (theorem).

Let f:Y→Spa(C,C+) be a map of locally spatial diamonds, C complete algebraically closed of characteristic p and C+ an open bounded valuation subring. For a maximal point y and prime ℓ≠p, pointCd(ℓ,y)≤diamondDimTrg(f).

Proof or construction:

1. Reduce to Y_y=Spa(C′,O_C′)/G fixing C, using point-quotient and diamond-dim-base-change.
2. Remove the wild pro-p kernel. Apply extension-cd-bound to the residue quotient and tame inertia.
3. Use residue-cd-bound and tame-cd-bound, then valuation-transcendence-bound and the defining point supremum.

Dependencies: `DiamondEtaleCohomology:C8/point-quotient`, `DiamondEtaleCohomology:C8/point-cd`, `DiamondEtaleCohomology:C8/diamond-dim-trg`, `DiamondEtaleCohomology:C8/diamond-dim-base-change`, `DiamondEtaleCohomology:C8/wild-kernel-pro-p`, `DiamondEtaleCohomology:C8/prime-to-p-wild-removal`, `DiamondEtaleCohomology:C8/residue-galois-identification`, `DiamondEtaleCohomology:C8/residue-cd-bound`, `DiamondEtaleCohomology:C8/tame-cd-bound`, `DiamondEtaleCohomology:C8/valuation-transcendence-bound`, `DiamondEtaleCohomology:C8/extension-cd-bound`.

Acceptance: This is a prime-to-p theorem. Infinite geometric dimension yields no finite bound.

Source: ECD, Proposition21.16, pp.126–127.

### The simplicial space of specialization chains

Declaration `DiamondEtaleCohomology:C8/specialization-chain-space` (construction).

For spectral X, form sp_n(X) from tuples (x0,…,xn) for which xi generalizes xj when i≤j, allowing repetitions, with the subspace topology from the product constructible topology. Deleting and repeating coordinates gives a simplicial topological space. The projection γ_n to x0 takes values in the original topology; γ_0 is the quasi-augmentation and the projections are not an ordinary simplicial augmentation. This chain orientation matches KST; reversing chains preserves the dimension convention of ECD21.1.

Proof or construction:

1. Use Mathlib’s constructible-topology synonym and simplicial-object carrier. Form the specialization-chain subtype of the finite product. Specialization is measured in the original topology, not the Hausdorff patch topology.
2. Coordinate restriction along a monotone ordinal map preserves chains and is continuous; coordinate identities prove the functor laws. For spectral X, the specialization relation is patch-closed, so each chain space is profinite using the D0 patch-space theorem.
3. The first-vertex projection is continuous to the original topology. It changes under the face deleting x0, which is why a quasi-augmentation rather than a Cartesian hypercover is required.

Dependencies: `mathlib:WithConstructibleTopology`, `mathlib:CategoryTheory.SimplicialObject`, `DiamondsAndVStacks:D0/constructible-topology-profinite`.

Uses:

- Scheiderer Corollary4.6, as invoked in ECD21.11: Computes cohomology using finite specialization chains.
- KST Lemma6.6: Normalization removes chains with repeated vertices.

API:

- `specializationChainSpace_zero` (compatibility): The degree-zero space is X with its constructible topology.
- `specializationChainSpace_face` (projection): The ith face deletes the ith entry.
- `specializationChainSpace_degeneracy` (constructor): The ith degeneracy repeats the ith entry.
- `specializationChainSpace_nondegenerate` (characterisation): For a T0 space and a positive-degree chain, absence of an elementary degeneracy preimage is equivalent to pairwise distinct vertices; degree-zero chains are all nondegenerate.

Unit tests:

- `specializationChainSpace_empty` (degenerate): All degrees are empty for empty X.
- `specializationChainSpace_point` (computation): For a one-point space there is exactly one simplex in every degree and no nondegenerate positive-dimensional simplex.
- `specializationChainSpace_discrete` (non-example): For a two-point discrete space every chain is constant; there is no nondegenerate edge.
- `specializationChainSpace_twoPointChain` (computation): For a two-point spectral chain there is exactly one nondegenerate edge, whereas no nondegenerate simplex exists in degree2.

Acceptance: Retain every stated hypothesis; verify each proof step against its named input.

Source: KST, Lemma 6.6 and proof, p.24, citing Scheiderer §2, Remark 2.5, Theorem 4.1 and Proposition 4.7.

### Cohomology from the quasi-augmented chain space

Declaration `DiamondEtaleCohomology:C8/chain-cohomology-comparison` (comparison).

For spectral X and abelian sheaf F on X, H*(X,F) is computed by the cosimplicial section complex Γ(sp_n(X),γ_n*F), whose coefficient transition maps use specialization. Its normalized subcomplex has degree-n sections supported on nondegenerate chains.

Proof or construction:

1. Construct the inverse/direct-image adjunction for the quasi-augmentation, including the coefficient transition maps at the face deleting the first vertex.
2. Prove Scheiderer cohomological descent (Remark2.5 and Theorem4.1), then identify the normalization as in Proposition4.7.
3. These are precise unclosed proof tasks: only the application in KST Lemma6.6 has been read, not Scheiderer’s proofs.

Dependencies: `DiamondEtaleCohomology:C8/specialization-chain-space`, `EnhancedDerivedSheaves:E2`.

Acceptance: Do not replace the quasi-augmentation by an ordinary augmentation; the first-vertex coefficient map must be constructed.

Source: KST, Lemma 6.6 and proof, p.24, citing Scheiderer §2, Remark 2.5, Theorem 4.1 and Proposition 4.7.

### Spectral-space cohomological dimension

Declaration `DiamondEtaleCohomology:C8/spectral-cohomological-bound` (theorem).

For spectral X with topologicalKrullDim X≤d, d natural, and any abelian sheaf F on X, H^i(X,F)=0 for i>d.

Proof or construction:

1. Use specialization-dimension to bound lengths of nondegenerate specialization chains by d.
2. Apply chain-cohomology-comparison; the normalized complex is zero in degrees>d because there are no such nondegenerate chains.

Dependencies: `DiamondEtaleCohomology:C8/specialization-dimension`, `DiamondEtaleCohomology:C8/chain-cohomology-comparison`.

Acceptance: A nonempty zero-dimensional spectral space has no positive cohomology. The Stacks0A3G proof is corroboration, not a replacement for the required quasi-augmented proof.

Source: KST, Lemma 6.6 and proof, p.24, citing Scheiderer §2, Remark 2.5, Theorem 4.1 and Proposition 4.7.

### Dimension drop at the boundary of an open stratum

Declaration `DiamondEtaleCohomology:C8/boundary-dimension-drop` (lemma).

In the constructible-stratum reduction of21.11, the boundary B=closure(V minus U) minus V satisfies dim B<dim(Y minus U) whenever the latter dimension is finite and the boundary is nonempty. Here V is quasicompact open and U is the open on which F vanishes.

Proof or construction:

1. The set V minus U is pro-constructible; use D0 closure-of-pro-constructible to lift a point of its boundary to a proper generalization in V minus U.
2. Every finite chain in B can be prolonged by that proper generalization. Compare chain lengths with specialization-dimension. Empty boundary gives bottom separately.

Dependencies: `DiamondEtaleCohomology:C8/specialization-dimension`, `DiamondsAndVStacks:D0/closure-of-pro-constructible`.

Acceptance: Retain every stated hypothesis; verify each proof step against its named input.

Source: ECD, Proposition21.11, first proof paragraph on p.125.

### Constructible reduction with controlled support

Declaration `DiamondEtaleCohomology:C8/constructible-support-reduction` (lemma).

To prove the21.11 bound for an ℓ-primary torsion sheaf F vanishing on open U, it suffices to treat F=F0/j_U!F0|U with F0 constructible and supported on one locally closed constructible stratum S=V∩Z0, where its pullback to any strictly totally disconnected cover is constant finite ℓ-torsion on the stratum.

Proof or construction:

1. Use filtered-colimit compatibility to reduce to bounded-exponent and constructible coefficients, and dévissage to ℓ-torsion.
2. Use the C7 constructible filtration and the exact extension-by-zero quotient to preserve vanishing on U. Reduce through finite extensions to a single stratum.

Dependencies: `DiamondEtaleCohomology:C7`, `DiamondsAndVStacks:D0/filtered-colimits-and-cohomology-on-coherent-sites`, `DiamondEtaleCohomology:C5`.

Acceptance: The stratification is spectral-constructible. An arbitrary point/complement decomposition of a closed disc does not qualify.

Source: ECD, Proposition21.11, proof p.124.

### The local stalk bound for topological direct image

Declaration `DiamondEtaleCohomology:C8/local-stalk-bound` (lemma).

In21.11 after constructible-support-reduction and replacement by a closed support Z, for g:Y_et→|Y| the sheaves R^i g_*F vanish for i>sup_y pointCd(ℓ,y), with y ranging over maximal points.

Proof or construction:

1. Check stalks by localization at a point. The local valuative space is a chain of specializations.
2. A closed finite-dimensional part Z of that chain is a finite chain. Take the open of generalizations of its generic point; the support-constant hypothesis makes F→j_*j*F an isomorphism.
3. Use injection-direct-image to replace Y by that open, then apply closed-point-bound. The precise localization/continuity interface is requested from C0 and D5.

Dependencies: `DiamondEtaleCohomology:C8/constructible-support-reduction`, `DiamondEtaleCohomology:C8/injection-direct-image`, `DiamondEtaleCohomology:C8/closed-point-bound`, `DiamondEtaleCohomology:C0`, `DiamondsAndVStacks:D5`.

Acceptance: Retain every stated hypothesis; verify each proof step against its named input.

Source: ECD, Proposition21.11, final proof paragraph, p.125.

### Cohomological dimension of a spatial diamond

Declaration `DiamondEtaleCohomology:C8/spatial-cohomological-bound` (theorem).

For a spatial diamond Y, prime ℓ, open U and an ℓ-primary torsion étale sheaf F with F|U=0, H^i(Y,F)=0 for i>dim(|Y| minus |U|)+sup_y pointCd(ℓ,y), where y ranges over maximal points. For empty support the sheaf is zero; if either finite bound fails the assertion supplies no finite vanishing range.

Proof or construction:

1. Use constructible-support-reduction. Write a stratum-supported F as j!F_V and compare it with j_*F_V.
2. The cokernel is supported on the boundary, whose dimension drops by boundary-dimension-drop. The long exact sequence and induction reduce to closed support.
3. Apply the Leray sequence for Y_et→|Y|. Use local-stalk-bound vertically and spectral-cohomological-bound on the closed support horizontally.

Dependencies: `DiamondEtaleCohomology:C8/constructible-support-reduction`, `DiamondEtaleCohomology:C8/boundary-dimension-drop`, `DiamondEtaleCohomology:C8/injection-direct-image`, `DiamondEtaleCohomology:C8/local-stalk-bound`, `DiamondEtaleCohomology:C8/spectral-cohomological-bound`, `DiamondsAndVStacks:D0/cech-to-derived-comparison`.

Acceptance: The induction includes general U, even when the desired application has U empty. This does not assert the3d compactification theorem owned by S1.

Source: ECD, Proposition21.11 and Remark21.12, pp.124–125.

### Dimension of a rank-one closure in a partially proper adic space

Declaration `DiamondEtaleCohomology:C8/partially-proper-closure-dimension` (theorem).

Let X be an adic space partially proper over Spa(K,O_K), K complete nonarchimedean with residue field k. For rank-one x∈X, the topological dimension of closure{x} equals trdeg(k(x)/k), where k(x) is the residue field of O_K(x) for the completed residue field K(x).

Proof or construction:

1. The valuative partial-properness criterion identifies closure{x} with the Zariski–Riemann space of k(x)/k.
2. Its dimension is the algebraic transcendence degree. Both the precise valuation-space comparison and its dimension proof are explicit missing proof decompositions; CS17 gives this route in one paragraph.

Dependencies: `DiamondEtaleCohomology:C8/specialization-dimension`, `AdicEtaleGeometry:A2`, `mathlib:Algebra.trdeg`.

Acceptance: Retain every stated hypothesis; verify each proof step against its named input.

Source: CS17, Proposition4.2.19 and proof, pp.711–712.

### Dimension of a partially proper adic space

Declaration `DiamondEtaleCohomology:C8/partially-proper-dimension` (theorem).

For X partially proper over Spa(K,O_K), dim X is the supremum of trdeg(k(x)/k) over its points. The supremum convention includes empty X and infinite dimension; any asserted finite maximum must be justified by attainment.

Proof or construction:

1. Every point of an analytic adic space generalizes to a rank-one point; each finite specialization chain therefore lies below one.
2. Apply partially-proper-closure-dimension and take the supremum. The source writes maximal transcendence degree; this plan uses the uniform supremum convention of21.1.

Dependencies: `DiamondEtaleCohomology:C8/partially-proper-closure-dimension`, `AdicEtaleGeometry:A2`.

Acceptance: Retain every stated hypothesis; verify each proof step against its named input.

Source: CS17, Proposition4.2.19 and proof, pp.711–712.

### Closure dimension along a partially proper analytic map

Declaration `DiamondEtaleCohomology:C8/partially-proper-fibre-dimension` (theorem).

For a map f:X→Y of partially proper adic spaces over Spa(K,O_K), rank-one x∈X and y=f(x), dim closure_X{x}=dim closure_Y{y}+dim closure_(X_y){x}. Closures here are topological closures; X_y is the fibre over the rank-one point.

Proof or construction:

1. Apply partially-proper-closure-dimension to source, target and fibre.
2. Apply the read baseline trdeg_add_eq to k⊆k(y)⊆k(x). Its conversion from cardinal ranks to ENat, including infinite rank, remains a comparison obligation.

Dependencies: `DiamondEtaleCohomology:C8/partially-proper-closure-dimension`, `mathlib:Algebra.trdeg`, `AdicEtaleGeometry:A2`, `mathlib:trdeg_add_eq`.

Acceptance: Retain every stated hypothesis; verify each proof step against its named input.

Source: CS17, Proposition4.2.21 and proof, p.712.

### Finite topological transcendence degree is monotone

Declaration `DiamondEtaleCohomology:C8/topological-trdeg-finite-monotonicity` (theorem).

For complete algebraically closed nonarchimedean fields K⊆L⊆M, if topologicalTrdeg(K,L) is finite then topologicalTrdeg(K,L)≤topologicalTrdeg(K,M).

Hypotheses: All field inclusions preserve the given nonarchimedean valuations..

Proof or construction:

1. If the ambient degree is infinite there is nothing to prove. For finite degrees, identify ECD’s dense-field invariant with Temkin’s generating degree using finite-topological-generators.
2. Temkin Theorem 3.2.3 identifies the finite generating degree with the independent degree, whose monotonicity is Lemma 2.2.2. The perturbation argument of Theorem 3.2.1 prevents the generating degree from falling below that independent degree.

Dependencies: `DiamondEtaleCohomology:C8/finite-topological-generators`.

Acceptance: Retain the stated finite bound and check the degenerate identity case.

Source: ECD, Paragraph immediately after Question 21.4, p.123; TEMKIN, Lemma 2.2.2; Theorems 3.2.1 and 3.2.3, pp.6–8.

### The modified and original finite degrees agree

Declaration `DiamondEtaleCohomology:C8/modified-trdeg-finite-equality` (theorem).

For a complete algebraically closed nonarchimedean extension K⊆L with finite topologicalTrdeg(K,L), modifiedTopologicalTrdeg(K,L)=topologicalTrdeg(K,L).

Hypotheses: All field inclusions preserve the given nonarchimedean valuations..

Proof or construction:

1. The identity further extension gives the upper bound. Every further extension E has degree at least the finite degree of L by topological-trdeg-finite-monotonicity.
2. Take the infimum over those extensions for the lower bound. This does not assert equality when the original degree is infinite.

Dependencies: `DiamondEtaleCohomology:C8/modified-topological-trdeg`, `DiamondEtaleCohomology:C8/topological-trdeg-finite-monotonicity`.

Acceptance: Retain the stated finite bound and check the degenerate identity case.

Source: ECD, Finite-degree paragraph and modified invariant before Definition 21.5, p.123.

### Topological fibre dimension can be tested on field points

Declaration `DiamondEtaleCohomology:C8/topological-dimension-field-tests` (theorem).

For f:Y′→Y representable in locally spatial diamonds, define its topological fibre dimension as the supremum of fibreDimension(f×Y X) over locally spatial diamond tests X→Y. The same supremum is obtained by restricting to X=Spa(C,C+) for complete algebraically closed perfectoid fields C and open bounded valuation subrings C+.

Proof or construction:

1. Use the geometric field-point/localization presentations of D5 to represent each fibre of a locally spatial diamond test.
2. The fibre topology and its specialization chains are preserved by this point presentation; take the two suprema. The presentation and universe comparisons are imported through an exact D5 request.

Dependencies: `DiamondEtaleCohomology:C8/fibre-dimension`, `DiamondsAndVStacks:D5`.

Acceptance: For a diamond target the identity test recovers its ordinary fibre dimension. Empty source has bottom; every plus ring allowed by the statement is retained.

Source: ECD, Remark 21.8, second paragraph, p.123.

## C9. Compact objects under uniform bounds

### Constructible sheaves and bounded filtered colimits

Declaration `DiamondEtaleCohomology:C9/bounded-filtered-compactness` (theorem).

Let Y be spatial and F a constructible étale sheaf of F_ℓ-vector spaces. For a filtered system C_j in D_et(Y,F_ℓ), uniformly in D^{≥−n} for one n, the canonical map colim_j Hom(F[0],C_j)→Hom(F[0],colim_j C_j) is an isomorphism.

Proof or construction:

1. Use bounded cohomological descent to a strictly totally disconnected cover; the one common lower bound controls totalization.
2. The C7 filtration reduces F by finitely many triangles to j!F_ℓ for quasicompact open j.
3. Adjunction reduces the comparison to filtered-colimit compatibility of cohomology on the coherent étale site.

Dependencies: `DiamondEtaleCohomology:C0`, `DiamondEtaleCohomology:C7`, `EnhancedDerivedSheaves:E2/hypercovers-and-cohomological-descent`, `DiamondsAndVStacks:D0/filtered-colimits-and-cohomology-on-coherent-sites`.

Acceptance: A family with no common lower bound is outside this theorem. ℓ need only be prime; no prime-to-p assertion is smuggled into this conditional theorem.

Source: ECD, Proposition20.9 and proof, pp.116–117.

### The same cohomological bound on étale test objects

Declaration `DiamondEtaleCohomology:C9/uniform-test-bound` (lemma).

Let Λ be a commutative ring and Y spatial. Suppose one natural N satisfies H^i(Y,F)=0 for i>N and every étale Λ-module sheaf F. Then the same N works for every quasicompact separated étale j:U→Y and every étale Λ-module sheaf on U.

Proof or construction:

1. Apply qpetale-direct-image to the underlying abelian sheaf; it is compatible with Λ-module structure.
2. Leray gives H^i(U,F)=H^i(Y,j_*F). Apply the bound on Y, without replacing N by a bound depending on U.

Dependencies: `DiamondEtaleCohomology:C8/qpetale-direct-image`, `DiamondsAndVStacks:D0/cech-to-derived-comparison`.

Acceptance: The same N must work simultaneously for every test object and every coefficient sheaf.

Source: ECD, First proof paragraphs of20.10 and20.17, pp.117,121.

### Left completeness under the uniform bound

Declaration `DiamondEtaleCohomology:C9/left-completeness` (theorem).

For Y and Λ satisfying uniform-test-bound, the unbounded ordinary derived category D(Y_et,Λ) is left-complete.

Proof or construction:

1. Quasicompact separated étale objects form a basis of the site. The same finite cohomological bound holds on this basis.
2. Apply the finite-cohomological-dimension Postnikov convergence criterion from E2. The cited Stacks0719 statement is for ringed spaces, so its site-level form is explicitly requested.

Dependencies: `DiamondEtaleCohomology:C9/uniform-test-bound`, `DiamondEtaleCohomology:C0`, `EnhancedDerivedSheaves:E2`.

Acceptance: This is Postnikov left completion, not the right adjoint to the étale inclusion.

Source: ECD, Propositions20.10 and20.17, pp.117,121.

### The ordinary and enhanced étale categories agree

Declaration `DiamondEtaleCohomology:C9/ordinary-derived-comparison` (comparison).

Under the same hypotheses, the canonical comparison D(Y_et,Λ)→D_et(Y,Λ) is an equivalence, compatibly with the enhanced ordinary-derived comparison and adequate cutoff changes.

Proof or construction:

1. C2 identifies D_et with the left completion of D(Y_et,Λ), using14.15.
2. Compose with left-completeness; retain the actual comparison natural transformation rather than an unrelated equivalence.

Dependencies: `DiamondEtaleCohomology:C9/left-completeness`, `DiamondEtaleCohomology:C2`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`.

Acceptance: Retain every stated hypothesis; verify each proof step against its named input.

Source: ECD, Propositions20.10 and20.17, pp.117,121.

### Global sections preserves coproducts under a uniform bound

Declaration `DiamondEtaleCohomology:C9/global-sections-coproducts` (lemma).

Under the same hypotheses, for every quasicompact separated étale U→Y, RΓ(U,−) on D(U_et,Λ) commutes with arbitrary coproducts.

Proof or construction:

1. For uniformly bounded-below complexes use coherent-site filtered-colimit compatibility and exactness of coproducts; finite sums are automatic.
2. The same cohomological bound N controls the finite truncation window contributing to each output degree, independent of the family member.
3. Use left completeness and that window estimate to remove the lower bound. The precise general-Λ truncation lemma is requested from E2;20.9 is the F_ℓ precursor, not a proof by itself for arbitrary Λ.

Dependencies: `DiamondEtaleCohomology:C9/uniform-test-bound`, `DiamondEtaleCohomology:C9/left-completeness`, `DiamondsAndVStacks:D0/filtered-colimits-and-cohomology-on-coherent-sites`, `EnhancedDerivedSheaves:E2`.

Acceptance: Do not exchange an arbitrary product or limit with a coproduct. The finite cohomological window is essential.

Source: ECD, Propositions20.10 and20.17, pp.117,121.

### Compactness of étale extension-by-zero generators

Declaration `DiamondEtaleCohomology:C9/etale-constant-compact` (lemma).

Under the same hypotheses, j!Λ is compact for every quasicompact separated étale j:U→Y.

Proof or construction:

1. C5 étale adjunction identifies derived Hom(j!Λ,−) with RΓ(U,−).
2. Apply global-sections-coproducts. Exactness identifies the triangulated coproduct criterion with the enhanced compactness criterion supplied by E3.

Dependencies: `DiamondEtaleCohomology:C9/global-sections-coproducts`, `EnhancedDerivedSheaves:E3`, `DiamondEtaleCohomology:C5`.

Acceptance: Retain every stated hypothesis; verify each proof step against its named input.

Source: ECD, Proposition20.17, p.121.

### Étale test objects detect zero complexes

Declaration `DiamondEtaleCohomology:C9/etale-generators-detect-zero` (lemma).

Under the same hypotheses, if RΓ(U,A)=0 for every quasicompact separated étale U→Y then A=0 in D_et(Y,Λ).

Proof or construction:

1. Use ordinary-derived-comparison.
2. Cohomology sheaves are detected on the coherent étale basis via stalks. Use the uniform truncation estimates to relate the derived-section tests to those stalks, then conservativity of cohomology.

Dependencies: `DiamondEtaleCohomology:C9/ordinary-derived-comparison`, `DiamondEtaleCohomology:C9/uniform-test-bound`, `DiamondEtaleCohomology:C0`, `EnhancedDerivedSheaves:E2`.

Acceptance: Retain every stated hypothesis; verify each proof step against its named input.

Source: ECD, Proposition20.17, second proof paragraph, p.121.

### Compact generation under bounded cohomological dimension

Declaration `DiamondEtaleCohomology:C9/compact-generators` (theorem).

For spatial Y of bounded Λ-cohomological dimension, Λ commutative, D_et(Y,Λ) is compactly generated by a set of objects j!Λ with j ranging over quasicompact separated étale maps to Y in an adequate cutoff skeleton.

Proof or construction:

1. Use etale-constant-compact and etale-generators-detect-zero.
2. Use C0 size bounds and E3’s generator criterion to pass from the test family to a small generating set. Check compatibility when enlarging the cutoff.

Dependencies: `DiamondEtaleCohomology:C9/etale-constant-compact`, `DiamondEtaleCohomology:C9/etale-generators-detect-zero`, `DiamondEtaleCohomology:C0`, `EnhancedDerivedSheaves:E3`.

Acceptance: Spatiality and a uniform cohomological bound are hypotheses. No Bun_G or solid-sheaf compact-generation theorem follows merely from this declaration.

Source: ECD, Proposition20.17, p.121.

### Compact objects are perfect-constructible

Declaration `DiamondEtaleCohomology:C9/compact-implies-perfect-constructible` (lemma).

Under compact-generators, every compact A∈D_et(Y,Λ) is perfect-constructible in the C7 sense.

Proof or construction:

1. The generators j!Λ are perfect-constructible by C7.
2. The E3 compact-generation theorem makes A a retract of a finite extension of shifts and finite sums of generators.
3. Use C7 stability of perfect-constructibility under these operations and retracts.

Dependencies: `DiamondEtaleCohomology:C9/compact-generators`, `EnhancedDerivedSheaves:E3`, `DiamondEtaleCohomology:C7`.

Acceptance: Retain every stated hypothesis; verify each proof step against its named input.

Source: ECD, Proposition20.17, p.121.

### Compactness of extensions of perfect local systems

Declaration `DiamondEtaleCohomology:C9/perfect-local-system-compact` (lemma).

Under the same bounded-cohomological-dimension hypotheses, j!L is compact when j:U→Y is quasicompact separated étale and L∈D_et(U,Λ) is locally constant with perfect values.

Proof or construction:

1. C5 adjunction and C3 tensor/Hom identify derived Hom(j!L,−) with RΓ(U,L^∨⊗^L_Λ j*−).
2. Perfect local systems are dualizable and tensoring with L^∨ preserves coproducts by E1/C7.
3. Apply global-sections-coproducts.

Dependencies: `DiamondEtaleCohomology:C9/global-sections-coproducts`, `DiamondEtaleCohomology:C7`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `DiamondEtaleCohomology:C5`, `DiamondEtaleCohomology:C3`.

Acceptance: Retain every stated hypothesis; verify each proof step against its named input.

Source: ECD, Proposition20.17, end of proof, pp.121–122.

### Perfect-constructible objects are compact

Declaration `DiamondEtaleCohomology:C9/perfect-constructible-implies-compact` (lemma).

Under the same hypotheses every perfect-constructible A∈D_et(Y,Λ) is compact.

Proof or construction:

1. Import the C7 finite filtration20.16, with pieces j!(L|Z), Z constructible closed in U.
2. Resolve L|Z by the two-term extension-by-zero triangle for U minus Z. Its open immersion is quasicompact because Z is constructible closed.
3. Reduce to perfect-local-system-compact and use stability under finite triangles.

Dependencies: `DiamondEtaleCohomology:C9/perfect-local-system-compact`, `DiamondEtaleCohomology:C7`, `DiamondEtaleCohomology:C5`.

Acceptance: An arbitrary closed Z without constructibility does not justify the quasicompact complement step.

Source: ECD, Proposition20.17, last proof paragraph, pp.121–122.

### Characterization of compact étale complexes

Declaration `DiamondEtaleCohomology:C9/compact-iff-perfect-constructible` (theorem).

For a spatial diamond Y of bounded Λ-cohomological dimension, Λ commutative, A∈D_et(Y,Λ) is compact iff A is perfect-constructible.

Proof or construction:

1. Combine compact-implies-perfect-constructible and perfect-constructible-implies-compact.

Dependencies: `DiamondEtaleCohomology:C9/compact-implies-perfect-constructible`, `DiamondEtaleCohomology:C9/perfect-constructible-implies-compact`.

Acceptance: Over a general coefficient ring, bounded constructible is not substituted for perfect-constructible.

Source: ECD, Proposition20.17, p.121.

### Compact complexes with finite-field coefficients

Declaration `DiamondEtaleCohomology:C9/finite-field-compact-objects` (theorem).

For spatial Y with one bound N on H^i(Y,F) for all ℓ-torsion étale sheaves F, A∈D_et(Y,F_ℓ) is compact iff it is bounded with constructible cohomology sheaves.

Proof or construction:

1. Apply compact-iff-perfect-constructible with Λ=F_ℓ.
2. Use C7’s equivalence between perfect-constructible and bounded constructible over a field; finite-dimensional vector spaces have finite projective resolutions.

Dependencies: `DiamondEtaleCohomology:C9/compact-iff-perfect-constructible`, `DiamondEtaleCohomology:C7`.

Acceptance: The field-coefficient equivalence must not be exported unchanged to an arbitrary Λ.

Source: ECD, Proposition20.10, p.117.

### Compact generation from finite dimension bounds

Declaration `DiamondEtaleCohomology:C9/compact-generation-from-dimension-bounds` (application).

Let Y be a spatial diamond over Spa(C,C+), C complete algebraically closed perfectoid of characteristic p. Let ℓ≠p be prime and d,e natural with dim |Y|≤d and diamondDimTrg(Y→Spa(C,C+))≤e. Then one bound d+e works for all ℓ-torsion étale sheaves on Y and every qc separated étale test U→Y. Consequently D_et(Y,F_ℓ) is left-complete and compactly generated, with compact objects precisely the bounded constructible complexes.

Proof or construction:

1. Apply point-cd-geometric-bound at every maximal point, then spatial-cohomological-bound with empty U to get d+e.
2. Apply uniform-test-bound to retain that same N on every qc separated étale object, then the C9 comparison, generation and compact-object characterization.

Dependencies: `DiamondEtaleCohomology:C8/point-cd-geometric-bound`, `DiamondEtaleCohomology:C8/spatial-cohomological-bound`, `DiamondEtaleCohomology:C9/uniform-test-bound`, `DiamondEtaleCohomology:C9/compact-generators`, `DiamondEtaleCohomology:C9/finite-field-compact-objects`.

Acceptance: Spa(C,O_C) has d=e=0 and recovers perfect complexes over F_ℓ. A union of components with unbounded dimensions fails the uniform-bound hypotheses.

Source: ECD, Propositions 21.11 and 21.16 combined with 20.10, pp.117,124,126.

## Owning suppliers

Accepted RS-05 assigns the all-degree Hochschild–Serre sequence to R02.1 and coefficient/convergence compatibility to R02.2, although the current descriptive headings reverse them. The requests specify the mathematical contracts and follow that binding assignment. C5 owns étale extension by zero; C3 owns tensor and internal Hom. C7 imports the early point-quotient and specialization-stabilizer nodes at declaration granularity to avoid a cycle through all of C8.

- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-0-discrete-modules-and-continuous-sections`: Discrete continuous module dictionary, including invariants, morphisms and exactness, on the canonical TopRep carrier. The equivalence of diamond sheaves with this category is proved in C8. Consumers: `DiamondEtaleCohomology:C8/point-sheaf-equivalence`.
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`: All-degree cohomology of discrete profinite modules on continuousCohomology, its comparison with the continuous Čech/cochain model, finite-quotient and coefficient filtered-colimits, coefficient naturality and dimension shifting. Consumers: `DiamondEtaleCohomology:C8/point-cohomology`, `DiamondEtaleCohomology:C8/closed-point-cohomology`, `DiamondEtaleCohomology:C8/extension-cd-bound`, `DiamondEtaleCohomology:C8/prime-to-p-wild-removal`, `DiamondEtaleCohomology:C8/residue-cd-bound`.
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension`: ENat-valued cd_ℓ on all discrete ℓ-primary torsion modules, its vanishing characterization, invariance under continuous group isomorphism, and monotonicity for closed subgroups. Consumers: `DiamondEtaleCohomology:C8/point-cd`, `DiamondEtaleCohomology:C8/closed-point-bound`, `DiamondEtaleCohomology:C8/extension-cd-bound`, `DiamondEtaleCohomology:C8/prime-to-p-wild-removal`, `DiamondEtaleCohomology:C8/residue-cd-bound`, `DiamondEtaleCohomology:C8/tame-cd-bound`.
- `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-2-profinite-sylow-theory`: Existence of pro-ℓ Sylow subgroups and their use inside a procyclic profinite group; retain the continuous subgroup topology. Consumers: `DiamondEtaleCohomology:C8/wild-automorphism`.
- `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-3-pro-p-groups-the-maximal-pro-p-quotient-frattini-theory-generation`: The finite-quotient characterization of pro-p and its closed-subgroup/quotient stability; exclude continuous homomorphisms from a pro-ℓ group to discrete p-torsion groups for distinct primes. Consumers: `DiamondEtaleCohomology:C8/wild-automorphism`, `DiamondEtaleCohomology:C8/wild-kernel-pro-p`, `DiamondEtaleCohomology:C8/prime-to-p-wild-removal`.
- `ArithmeticGaloisDuality:R02.1`: As assigned by accepted RS-05, supply the all-degree continuous Hochschild–Serre sequence for a closed normal profinite subgroup and discrete torsion coefficients, converging to the canonical upstream carrier, with edge maps. Consumers: `DiamondEtaleCohomology:C8/extension-cd-bound`, `DiamondEtaleCohomology:C8/prime-to-p-wild-removal`.
- `ArithmeticGaloisDuality:R02.2`: As assigned by accepted RS-05, supply the discrete/compact coefficient comparison and the convergence/edge-map compatibility needed when specializing Hochschild–Serre to discrete ℓ-primary torsion modules. No compact-coefficient limit interchange without its convergence hypotheses. Consumers: `DiamondEtaleCohomology:C8/extension-cd-bound`.
- `tauceti:TauCetiRoadmap/AdicSpaces#layer-3-rational-localisation-and-the-structure-presheaf`: The actual adic carrier, local stalks, residue-field valuations and valuation-compatible maps. Completing and algebraically closing those fields, with compatible embeddings, remains a separate C8 proof obligation. Consumers: `DiamondEtaleCohomology:C8/analytic-dim-trg`.
- `AdicEtaleGeometry:A2`: Comparison with the valuative partial-properness criterion of CS17 Remark4.2.20 and rank-one generalizations. CS17 allows general analytic partially proper adic spaces, beyond the supplier’s explicit noetherian scope; the extension of the geometric supplier is recorded in restructure and remains unresolved. Consumers: `DiamondEtaleCohomology:C8/partially-proper-closure-dimension`, `DiamondEtaleCohomology:C8/partially-proper-dimension`, `DiamondEtaleCohomology:C8/partially-proper-fibre-dimension`.
- `DiamondsAndVStacks:D5`: Localization of a spatial diamond at a point, its chain of generalizations, the field-point presentation, and continuity of sheaf cohomology for these localizations. Existing D5 packet nodes give presentations/permanence but not this precise local-cohomology contract. Consumers: `DiamondEtaleCohomology:C8/local-stalk-bound`.
- `EnhancedDerivedSheaves:E2`: For a coherent site whose generating basis has one finite bound N for cohomology of all module sheaves, prove Postnikov left completeness and the uniform truncation estimate used to show derived global sections commutes with arbitrary coproducts. Supply the site-level form of Stacks0719; the ringed-space statement alone is insufficient. Supply generic cosimplicial section complexes, normalization and comparison with sheaf cohomology once C8 proves its quasi-augmented descent theorem. An ordinary Cartesian hypercover theorem does not establish that theorem. Consumers: `DiamondEtaleCohomology:C9/left-completeness`, `DiamondEtaleCohomology:C9/global-sections-coproducts`, `DiamondEtaleCohomology:C9/etale-generators-detect-zero`, `DiamondEtaleCohomology:C8/chain-cohomology-comparison`.
- `EnhancedDerivedSheaves:E3`: In the relevant stable presentable category, compact generators detecting zero generate; compact objects are the retract-closed finite stable closure of those generators. Identify preservation of coproducts by exact derived Hom with the enhanced compactness criterion, and retain size/cutoff comparisons. Consumers: `DiamondEtaleCohomology:C9/etale-constant-compact`, `DiamondEtaleCohomology:C9/compact-generators`, `DiamondEtaleCohomology:C9/compact-implies-perfect-constructible`.
- `DiamondEtaleCohomology:C0`: Coherent étale sites with enough points, bounded comparisons and continuity at localizations, plus size bounds for a skeleton of qc separated étale test objects. Consumers: `DiamondEtaleCohomology:C8/strictly-disconnected-acyclic`, `DiamondEtaleCohomology:C8/point-sheaf-equivalence`, `DiamondEtaleCohomology:C8/local-stalk-bound`, `DiamondEtaleCohomology:C9/bounded-filtered-compactness`, `DiamondEtaleCohomology:C9/left-completeness`, `DiamondEtaleCohomology:C9/etale-generators-detect-zero`, `DiamondEtaleCohomology:C9/compact-generators`.
- `DiamondEtaleCohomology:C1`: Corollary16.10 in the quasi-pro-étale case, with the actual base-change transformation on all abelian étale sheaves used to prove21.13/21.14. Consumers: `DiamondEtaleCohomology:C8/qpetale-direct-image`.
- `DiamondEtaleCohomology:C2`: The canonical14.15 identification of D_et with Postnikov left completion, with enhancement and cutoff compatibility. Consumers: `DiamondEtaleCohomology:C9/ordinary-derived-comparison`.
- `DiamondEtaleCohomology:C3`: Derived tensor/internal Hom and their comparison maps, used with the separate C5 étale extension-by-zero adjunction. Consumers: `DiamondEtaleCohomology:C9/perfect-local-system-compact`.
- `DiamondEtaleCohomology:C7`: Spectral-constructible and perfect-constructible definitions; constructible approximation and20.8/20.16 filtrations; stability under finite triangles/retracts; dualizability of perfect local systems; over F_ℓ the bounded-constructible equivalence. Prove full faithfulness in20.15 before20.16 and essential surjectivity. Its filtration proof uses point quotients and specialization stabilizers; import the named C8 point-quotient and specialization-stabilizers nodes, whose prerequisites do not include C7, rather than the entire C8 stage. This avoids a stage-level cycle. Consumers: `DiamondEtaleCohomology:C8/constructible-support-reduction`, `DiamondEtaleCohomology:C9/bounded-filtered-compactness`, `DiamondEtaleCohomology:C9/compact-implies-perfect-constructible`, `DiamondEtaleCohomology:C9/perfect-local-system-compact`, `DiamondEtaleCohomology:C9/perfect-constructible-implies-compact`, `DiamondEtaleCohomology:C9/finite-field-compact-objects`.
- `DiamondEtaleCohomology:C5`: Exact étale extension by zero of 19.1, its pullback adjunction, open-support triangle and base-change comparison. This is available before general proper pushforward or Rf!. Consumers: `DiamondEtaleCohomology:C8/constructible-support-reduction`, `DiamondEtaleCohomology:C9/etale-constant-compact`, `DiamondEtaleCohomology:C9/perfect-local-system-compact`, `DiamondEtaleCohomology:C9/perfect-constructible-implies-compact`.
- `DiamondsAndVStacks:D5`: Quasi-pro-étale algebraically closed field-point presentations through a given diamond point; localization and preservation of fibre specialization chains. Supply the field-point evaluation in Remark 21.8 and the one-point/local presentation used in 21.9/21.15. The general universally-open presentation node does not alone specify this exact contract. Consumers: `DiamondEtaleCohomology:C8/diamond-dim-trg`, `DiamondEtaleCohomology:C8/point-quotient`, `DiamondEtaleCohomology:C8/specialization-stabilizers`, `DiamondEtaleCohomology:C8/topological-dimension-field-tests`.

## Refinements needed for closure

- **Characteristic-independent completion and finite extension norms.** Conrad’s complete coefficient/root approximation proof has been read and supplies a characteristic-independent route for the closure of an algebraically closed subfield. The pinned IsAlgClosed.of_denseRange requires CharZero and cannot be cited in characteristic p. Spell out the norm on a finite splitting extension and its compatibility with the original complete rank-one valuation before formalizing the adapted argument.
- **Universe bounds, valued amalgamation and point choices.** Prove finite extension-witness size reduction using the read D0 completion-cardinality bound; construct compatible complete algebraically closed valued amalgams for the two modified21.3 inequalities; prove independence of completed residue-field closures and of quasi-pro-étale point representatives; prove cutoff independence for representable v-stack tests. Split these into individual lemmas before closure. No universal monotonicity answer to Question21.4 is assumed.
- **Huber valuative dimension and completion lemmas.** Read Huber1.8.5(i), prove the chain/rational-value-group estimate, and separately prove the completion/algebraic-closure comparisons and their compatibility with maps on the existing adic carrier. General analytic completed residue fields must be constructed from the upstream stalkwise fields; A0 tensor products do not supply them.
- **Temkin primitive perturbation source boundary.** Temkin §§2–3 and ECD’s finite-degree paragraph were read. Finite intermediate-degree monotonicity and finite modified/original equality are explicit nodes. The proof of Temkin Lemma 3.1.6 imports Temkin 2010 Lemma 6.3.2; its primitive-field perturbation proof has not been read. Refine that precise input before claiming source closure; retain the distinction between independent and generating degree for infinite extensions.
- **Wild, residue and tame proof interiors.** In21.17 justify the topology and compactness of the procyclic closure and split the leading-term residue homomorphism computation. For21.16 prove the infinite-Galois identification, the transcendence-degree bound on residue-field Galois cohomology, the tame character topology and finite-adele identification, and the cohomological bound on its compact lattices. These are owned field/Kummer arguments, not supplied by a bare five-term sequence or discrete local-field inertia.
- **Valuation rank and completion comparisons.** The polynomial leading-term proof is now explicit in valuation-transcendence-bound. Refine residue independence, rational value-group independence, cardinal-to-ENat conversion, algebraic-extension torsion and completion immediacy. Bourbaki VI.10.3 Corollary 1 has not been read; no claim of an independently closed library proof is made.
- **Scheiderer quasi-augmented descent proof.** The1992 article, DOI10.1016/0022-4049(92)90062-K, was located on its open-archive publisher page, but the PDF endpoint returned403. The author bibliography has no PDF link. Read §§2–4, especially Remark2.5, Theorem4.1 and Corollary4.6. Construct the quasi-augmentation adjunction and prove descent with the precise hypotheses; then separate normalization into a named lemma. KST Lemma6.6 supplies the specialization-chain and normalized-support argument only. Stacks0A3G proves the desired bound by another method and does not close this required source route.
- **CS17 valuation-space comparison in general analytic scope.** Read and prove the Zariski–Riemann description of a rank-one closure and its transcendence-degree dimension formula, and establish the supplier’s partial-properness criterion beyond noetherian analytic spaces. The generic algebraic tower equality is already in the pinned library; only its ENat/infinite-rank conversion and geometric application are new.
- **Finite-window and generation interfaces.** The detailed site-level left-completion and coproduct proof, compact-generator criterion and retract characterization remain open requests to E2/E3. For detect-zero spell out the stalk/derived-section argument using the uniform bound; do not use a cohomology presheaf as though it were already a sheaf.
- **Suggested signatures remain incomplete.** The suggested file states all signatures/API/tests representable with the pinned topology and normed-field carriers, including the modified invariant with genuine extension data. Analytic, diamond, site and enhanced-category declarations need the absent owning supplier types; these conditions are omitted under PROTOCOL §13, with a per-node inventory. Group cohomological dimension and the tame character/value-group topology likewise need their imported interfaces. No arbitrary proposition field or assumed theorem package fills these omissions.

## Atlas planets

- DiamondEtaleCohomology:C8: **Topological transcendence degree**, `DiamondEtaleCohomology:C8/topological-trdeg`.
- DiamondEtaleCohomology:C8: **Modified topological transcendence degree**, `DiamondEtaleCohomology:C8/modified-topological-trdeg`.
- DiamondEtaleCohomology:C8: **Geometric transcendence dimension**, `DiamondEtaleCohomology:C8/diamond-dim-trg`.
- DiamondEtaleCohomology:C8: **Maximal-point cohomological dimension**, `DiamondEtaleCohomology:C8/point-cd-geometric-bound`.
- DiamondEtaleCohomology:C8: **Spectral-space cohomological dimension**, `DiamondEtaleCohomology:C8/spectral-cohomological-bound`.
- DiamondEtaleCohomology:C8: **Cohomological dimension of a spatial diamond**, `DiamondEtaleCohomology:C8/spatial-cohomological-bound`.
- DiamondEtaleCohomology:C9: **Compact generators**, `DiamondEtaleCohomology:C9/compact-generators`.
- DiamondEtaleCohomology:C9: **Compact étale complexes**, `DiamondEtaleCohomology:C9/compact-iff-perfect-constructible`.

## Sources and corrections

- Peter Scholze, [Étale cohomology of diamonds](https://arxiv.org/pdf/1709.07343v4), arXiv:1709.07343v4, 14 April 2026. Read 6 October 2026: §21, printed pp.122–127, complete; §20 Propositions 20.9, 20.10 and 20.17 statements and proofs; 20.16 proof ending; Convention 22.1 and 22.2–22.3 as consumer context.
- Ana Caraiani and Peter Scholze, [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), Annals of Mathematics186 (2017),649–766. Read 6 October 2026: §4.2, Propositions4.2.19 and4.2.21, Remark4.2.20, printed pp.711–712.
- Shane Kelly, Shuji Saito and Georg Tamme, [On pro-cdh descent on derived schemes](https://www.lcv.ne.jp/~smaki/articles/Derived-pro-cdh.pdf), Author-hosted manuscript, downloaded 6 October 2026. Read 6 October 2026: Lemma6.6 and proof, p.24. This describes the specialization-chain argument but imports Scheiderer Remark2.5 and Theorem4.1; those imported proofs have not been read.
- The Stacks Project Authors, [The Stacks Project](https://stacks.math.columbia.edu/), Online version accessed 6 October 2026. Read 6 October 2026: Tags0A3G and0719, full statements and proofs. Tag0A3G uses a different argument from the required quasi-augmented route; Tag0719 is stated for ringed spaces, so a site-level supplier is still required.
- Michael Temkin, [Topological transcendence degree](https://arxiv.org/pdf/1610.09162v2), arXiv:1610.09162v2; published J. Algebra 568 (2021), 35–60. Read 6 October 2026: §2.1–2.2: independent versus generating degrees; §3.1–3.2: perturbations, Theorems 3.2.1 and 3.2.3 and their proofs. Lemma 3.1.6 imports Temkin 2010 Lemma 6.3.2; that earlier proof is an explicit source boundary.
- Brian Conrad, [Completion of algebraic closure](https://math.stanford.edu/~conrad/248APage/handouts/algclosurecomp.pdf), Stanford Math 248A handout, author-hosted text. Read 6 October 2026: Entire handout: Theorem 1.1 and §2 coefficient/root approximation proof; the argument works in arbitrary characteristic.
- Laurent Fargues and Peter Scholze, [Geometrization of the local Langlands correspondence](https://arxiv.org/pdf/2102.13459v4), arXiv:2102.13459v4. Read 6 October 2026: §I.11, introductory dimension discussion and Problem I.11.1, printed pp.41–42. This is a problem, not an equality theorem.

The packet records two source issues scoped to the read ECD v4: the leading-term denominator in 21.16 must be the principal-unit subgroup, and the generator map j in 20.17 has target Y. Their corrected statements are used here. No collation with a published version of record or published correction is asserted.
