# Locally analytic distributions, Layer 0: Banach spaces of locally analytic functions (follow-up part)

This document plans layer L0 of the roadmap *Locally analytic distributions, growth, and character spaces* to the level of its key definitions and theorems. It continues the accepted whole-roadmap plan (`research/blueprint/packets/LocallyAnalyticDistributions.json`, reviewed by REV-LocallyAnalyticDistributions). That plan stated L0's targets in eighteen declarations and left three items open; this part plans all three:

- the nonarchimedean locally convex interface (stages, limits, strong duals, the compact-type reflexive duality and the completed tensor theorem for products), which Mathlib's ordered-field `LocallyConvexSpace` does not supply (§§0.A, 0.B, 0.C, 0.D);
- the left-heart strict-sequence comparison and the inputs of Colmez–Nizioł's three-space results: countable orthonormal bases, controlled quotient lifts, separated Ext¹-vanishing (Colmez–Gilles–Nizioł Lemma 2.5) and nuclear Fréchet extension (§§0.B, 0.C). Dierolf–Roelcke's Proposition 3.8, which Colmez–Nizioł cite for the last, concerns real and complex spaces; the nonarchimedean statement is proved here by a lattice argument (E101). One input of the compact-type extension theorem, the strictness of the dual sequence, is not established and is the part's only gap (E102);
- finite-manifold charts, multivariate substitution bounds and the realisation of chart stages as spaces of functions (§0.D).

The nonarchimedean Hahn–Banach theorem is planned here (0.A.5). The predecessor took it from PadicDifferentialEquationsAndRigidCohomology, a roadmap of a higher upstream tier, so the notion moves down into this layer. The eighteen declarations of the predecessor plan are not repeated. They are cited as `L0/<name>` (predecessor), and the new declarations refine them as recorded in the packet's `continuation` field. Together they cover every target the stage states:

| Stage target | Declarations |
| --- | --- |
| Banach spaces of functions analytic on every residue ball of a fixed radius, with Gauss norms | `L0/disc-analytic-functions`, `L0/locally-analytic-radius`, `L0/multivariable-fixed-radius`; 0.D.1 `restricted-power-series-ball`, 0.D.5 `chart-index-banach-stages` |
| a uniform radius from compactness; finite families in a common stage | `L0/compact-uniform-radius`; 0.D.4 `analytic-manifold-atlases`, 0.D.6 `locally-analytic-function-space` |
| independence of charts | `L0/chart-independence`; 0.D.4, 0.D.5, 0.D.6 |
| restriction to smaller balls, continuous inclusions | `L0/radius-restriction-compact`, `L0/locally-analytic-radius`; 0.D.2 `multivariate-substitution-bound`, 0.D.3 `relatively-compact-restriction` |
| tensor products | `L0/product-analytic-tensor`; 0.B.4–0.B.6, 0.C.8 `compact-type-tensor-products`, 0.D.8 `locally-analytic-product` |
| the locally convex inductive-limit topology on C^la(X, K) | `L0/locally-analytic-topology`; 0.A.1, 0.A.2, 0.D.6 |
| the continuous dual and the projective system of Banach duals | `L0/locally-analytic-distributions`, `L0/compact-type-dual-reflexivity`; 0.A.3, 0.C.5, 0.C.7, 0.D.9 `locally-analytic-dual-nuclear` |
| density, and the map from bounded measures | `L0/locally-analytic-topology`, `L0/locally-analytic-distributions`; 0.D.6 |
| equality of functions is not equality of topologies | `L0/locally-analytic-topology`; tests of 0.C.5 and 0.D.5 |
| ℚ_p-analytic against F-analytic functions on O_F | `L0/field-analytic-functions`; 0.A.5, 0.C.1, 0.D.4 |
| the strict-sequence and three-space results (assigned to this layer) | `L0/strict-sequence-comparison`, `L0/banach-three-space`, `L0/banach-splitting`, `L0/frechet-three-space`, `L0/compact-type-three-space`; 0.B.1–0.B.3, 0.C.1–0.C.3, 0.C.9–0.C.11 |

## Conventions

K is a field complete for a nontrivial nonarchimedean absolute value |·|, with ring of integers O_K = {|a| ≤ 1} and a fixed π ∈ K with 0 < |π| < 1 (π = p when K is a finite extension of ℚ_p). A lattice in a K-vector space V is an O_K-submodule L with K·L = V; its gauge is p_L(v) = inf{|a| : v ∈ aL}. Seminorms are nonarchimedean: q(av) = |a|q(v) and q(v + w) ≤ max(q(v), q(w)). NACvx K is the category of K-vector spaces whose topology has a basis of open lattices, with continuous linear maps, and HANACvx K its Hausdorff part; spaces are not assumed Hausdorff unless stated, and the duality theory (§0.C, part of §0.A) assumes K spherically complete, as Schneider's Chapter III does. Every finite extension of ℚ_p is discretely valued and locally compact, hence spherically complete, and all arithmetic statements of the roadmap are over such fields; ℂ_p is not spherically complete.

L(V, W) is the space of continuous linear maps, L_s and L_b its weak and strong topologies, V′_s and V′_b the weak and strong duals. Over a nontrivially normed field the strong topology is Mathlib's topology on `V →L[K] W` (uniform convergence on von Neumann bounded sets) and V′_b is `StrongDual K V`. A sequence is strictly exact if its maps are strict (relatively open onto their images) and exact; strict monomorphisms are topological embeddings and strict epimorphisms open surjections. ⊗_π and ⊗_ι are the projective and inductive tensor products and ⊗̂ their Hausdorff completions; for Fréchet spaces and for spaces of compact type the two agree and ⊗̂ is written without index. c₀(I, K) is Mathlib's `ZeroAtInftyContinuousMap I K` on a discrete I with the sup norm.

A subset B is compactoid if every open lattice L has finitely many v_i with B ⊆ L + Σ O_K v_i; a map is compact if it sends some open lattice into a bounded c-compact submodule (into a compactoid set, for quasi-complete targets). A space of compact type is a locally convex inductive limit of a sequence of Banach spaces with injective compact transitions; a space is nuclear if every open lattice L contains an open lattice M with V̂_M → V̂_L compact. For a manifold M, an index is a partition of M into chart domains with closed-ball images and chosen radii, F_ε(K^r; V) is the Banach space of V-valued power series converging on the closed polydisc of radius ε, and C^an(M, E) is the inductive limit of the index stages. LA(ℤ_p, K) and LA_h(ℤ_p, K) are the predecessor's spaces; for M = ℤ_p they are C^an(ℤ_p, K) and the residue-ball stages.

## How to read this part

Each declaration has its packet id, kind and exact statement. It then gives any hypotheses beyond the conventions, a proof outline, the API and unit tests for definitions and constructions, its uses, its acceptance properties, its direct prerequisites (*Needs*) and its source locators. Locators are printed page numbers of the versions recorded in the packet; statements are in this roadmap's own words. Where a source is wrong or incomplete, the corrected statement is used and the correction is listed at the end. The suggested Lean file `research/blueprint/suggested/LocallyAnalyticDistributions--L0.lean` contains real-bodied light predicates over carriers present at the pins (nonarchimedean local convexity, spherical completeness, discrete valuation, compactoid sets and compact maps, power series on a polydisc and their Gauss norm), the end theorems statable there, and examples; its closing comment lists, by declaration, every other API and test name of this document, which are README targets because their carriers are not at the pins. Two declarations are planets of the layer: 0.C.5 (*Spaces of compact type*) and 0.D.6 (*Locally analytic functions on a manifold*).

## 0.A. Nonarchimedean locally convex spaces, limits and duals

The predecessor plan left the topology of Layer 0 as an interface to be imported. Mathlib has no nonarchimedean locally convex theory: its LocallyConvexSpace needs an ordered scalar field, and its PolynormableSpace allows seminorms with the ordinary triangle inequality, which over ℚ_p gives strictly more spaces. The targets below give the category NACvx K of spaces with a basis of open O_K-lattices, its limits, bounded sets and weak and strong duals (compared with Mathlib's von Neumann bornology and bounded-convergence topology), spherical completeness, and the Hahn–Banach theorem, which Mathlib states only for scalar fields satisfying IsRCLikeNormedField.

### 0.A.1 Nonarchimedean locally convex spaces

`LocallyAnalyticDistributions:L0/nonarchimedean-locally-convex-spaces` · Definition.

A locally convex K-vector space (in the nonarchimedean sense) is a K-vector space V with a topology for which the translates v + L of the members L of some family 𝓛 of lattices form a basis, where 𝓛 is stable under nonzero scalar multiples (for L ∈ 𝓛 and a ∈ K^× some member lies in aL) and under finite intersections (up to containment). Equivalently the topology is the one defined by a family of seminorms q : V → ℝ_{≥0} with q(av) = |a|q(v) and the strict triangle inequality q(v + w) ≤ max(q(v), q(w)): the gauge p_L(v) = inf{|a| : v ∈ aL} of a lattice L is such a seminorm, a lattice is open exactly when its gauge is continuous, and the sets {v : q_{1}(v), …, q_{r}(v) ≤ ε} are open lattices defining the seminorm topology. Addition and scalar multiplication are continuous. NACvx K denotes the category of these spaces with continuous K-linear maps and HANACvx K its full subcategory of Hausdorff spaces; V is Hausdorff exactly when the open lattices intersect in {0}, equivalently when the continuous seminorms separate points. Subspaces carry the restricted seminorms and quotients V/U the quotient seminorms q̄(v + U) = inf_{u∈U} q(v + u); V/U is Hausdorff exactly when U is closed. The separation sep V = V/closure{0} is left adjoint to the inclusion HANACvx K → NACvx K. Kernels in both categories are the algebraic kernels with the subspace topology; the cokernel of f : V → W is W/f(V) with the quotient topology in NACvx K and W/closure(f(V)) in HANACvx K. Over an ultrametric normed field these spaces are exactly the topological vector spaces whose topology is given by seminorms satisfying the strict triangle inequality; Mathlib's PolynormableSpace, which admits seminorms satisfying only the ordinary triangle inequality, is strictly larger, and Mathlib's ordered-field LocallyConvexSpace does not apply.

*Proof outline.*
1. From lattices to seminorms: for a lattice L the gauge p_L is a seminorm with {p_L < 1} ⊆ L ⊆ {p_L ≤ 1} (Schneider, Lemma 2.2), so the gauges of a defining family of lattices define the same topology (Proposition 4.4).
2. From seminorms to lattices: finite intersections {q_{i_1}, …, q_{i_r} ≤ ε} are lattices (Lemma 4.2), stable under scaling and intersection, and they define the seminorm topology (Proposition 4.3); continuity of the vector operations is Lemma 4.1, and Lemma 4.5 gives the criterion for openness of a lattice and continuity of a seminorm.
3. Hausdorff criterion and separation: the closure of {0} is the intersection of the open lattices (Lemma 4.6); a continuous linear map into a Hausdorff space vanishes on it, which gives the universal property of sep V.
4. Subspace and quotient topologies are again locally convex, defined by restricted and quotient seminorms (Schneider §5.B); the quotient is Hausdorff iff the subspace is closed.
5. Cokernels: a continuous g : W → Z with g∘f = 0 factors uniquely and continuously through W/f(V); when Z is Hausdorff g vanishes on closure(f(V)), so the Hausdorff cokernel is W/closure(f(V)).
6. Comparison with Mathlib: an ultrametric seminorm is in particular a Mathlib Seminorm, so these spaces are PolynormableSpace; the converse fails by the ℓ¹ test below, because an open O_K-submodule of a seminorm topology must be absorbed by the seminorm balls.

*API.*
- `TauCeti.NALocallyConvex.IsOKSubmodule` (data): An O_K-submodule of V written with the closed unit ball of K: contains 0, closed under addition and under scalars of norm ≤ 1.
- `TauCeti.NALocallyConvex.IsNALocallyConvex` (constructor): The predicate on a topological K-vector space V: the zero neighbourhoods have a basis of open O_K-submodules (lattices), and the vector operations are continuous; NACvx K is the full subcategory of these spaces.
- `TauCeti.NALocallyConvex.isNALocallyConvex_iff_seminorms` (characterisation): V is nonarchimedean locally convex iff its topology is defined (Mathlib WithSeminorms) by a family of seminorms each of which is IsNonarchimedean (strict triangle inequality).
- `TauCeti.NALocallyConvex.gauge_isOpen_iff` (characterisation): For a lattice L in such a V: L is open iff its gauge p_L is continuous, and {p_L < 1} ⊆ L ⊆ {p_L ≤ 1}.
- `TauCeti.NALocallyConvex.IsNALocallyConvex.polynormableSpace` (compatibility): Every nonarchimedean locally convex space is a Mathlib PolynormableSpace; the converse is false (see the ℓ¹ test).
- `TauCeti.NALocallyConvex.naKernel` (data): The kernel of a continuous linear map, with the subspace topology, is a kernel in NACvx K and in HANACvx K.
- `TauCeti.NALocallyConvex.naCokernel` (data): W/f(V) with the quotient topology, the cokernel of f in NACvx K.
- `TauCeti.NALocallyConvex.haCokernel` (data): W/closure(f(V)) with the quotient topology, the cokernel of f in HANACvx K.
- `TauCeti.NALocallyConvex.separate` (constructor): sep V = V/closure{0}, Hausdorff, with the quotient map V → sep V.
- `TauCeti.NALocallyConvex.separate_lift` (universal-property): Every continuous linear map from V to a Hausdorff space factors uniquely through sep V.
- `TauCeti.NALocallyConvex.separate_eq_self_iff` (characterisation): V → sep V is an isomorphism iff V is Hausdorff.
- `TauCeti.NALocallyConvex.quotient_t2_iff` (characterisation): For a subspace U, V/U is Hausdorff iff U is closed.

*Unit tests.*
- `NALocallyConvexTests.naTopology_line` (computation): On K the closed balls {|x| ≤ r} (r > 0) are open lattices whose gauges agree with |·| up to the value group, and the lattice topology is the norm topology; the zero space is Hausdorff.
- `NALocallyConvexTests.naTopology_product` (computation): On K^ℕ with the product topology the coordinate seminorms |x_n| define the topology; the unit vectors e_n tend to 0 although their sup norms equal 1, so the product topology is not the sup-norm topology.
- `NALocallyConvexTests.naCokernel_dense` (non-example): For the inclusion of finitely supported sequences into c₀(ℕ, K) with the inherited norm, the NACvx cokernel is a nonzero space with the indiscrete topology, while the Hausdorff cokernel is 0.
- `NALocallyConvexTests.lp_one_not_naLocallyConvex` (non-example): ℓ¹(ℕ, ℚ_p) with the norm Σ|x_n| is a normed ℚ_p-space (so a Mathlib PolynormableSpace) that is not nonarchimedean locally convex: every open O_K-submodule contains a·e_n for one fixed a ≠ 0 and all n, hence the sums a(e_1 + … + e_N) of norm N|a|, so none lies in the unit ball.

*Uses.* This packet: limits, bounded sets, strictness, left hearts and tensor products of Layer 0: every topological statement of the layer is made in NACvx K or HANACvx K; Schneider–Teitelbaum 1999, §1, printed p. 2: LC(K), with lattices and open O_K-submodules, is the setting of spaces of compact type and their duals; Colmez–Gilles–Nizioł 2023, §2.1.1–2.1.2, printed p. 7; Colmez–Nizioł Appendix A: C_K and CH_K are the quasi-abelian categories in which the three-space statements are made.

*Acceptance.* The four unit tests below. On every example in the tests the lattice description and the seminorm description give the same open sets.

*Needs:* Mathlib `Seminorm`; Mathlib `WithSeminorms`; Mathlib `PolynormableSpace`; Mathlib `IsNonarchimedean`; Mathlib `IsUltrametricDist`; Mathlib `lp`.

*Sources:* Schneider, *Nonarchimedean Functional Analysis* (author notes), §2, Lemma 2.2, printed p. 11; §4, Lemmas 4.1–4.2 and Propositions 4.3–4.4, printed pp. 17–19, Lemmas 4.5–4.6, printed pp. 19–20; §5 (subspaces, quotients, direct sums), printed pp. 26–29: Lattice-defined topologies, the gauge of a lattice, the equivalence with families of nonarchimedean seminorms, the Hausdorff criterion, and the subspace and quotient constructions. Colmez–Gilles–Nizioł (arXiv:2308.07712v2), §2.1.1–2.1.2, printed p. 7: The category C_K of locally convex K-spaces and its Hausdorff subcategory CH_K; cokernels in CH_K use closures of images. Colmez–Dospinescu–Nizioł (arXiv:1801.06686v2), §2.1.1, printed pp. 7–8: Locally convex means a basis of O_K-submodule neighbourhoods; spaces are not assumed separated; kernels and cokernels are taken algebraically with the induced topologies.

### 0.A.2 Locally convex inductive and projective limits

`LocallyAnalyticDistributions:L0/locally-convex-limits` · Construction.

Let (V_h, f_{hk}) be a diagram in NACvx K. (i) The locally convex inductive limit lim→ V_h is the algebraic colimit V with the finest locally convex topology making all structure maps j_h : V_h → V continuous: a lattice of V is open iff its preimage in every V_h is open; a linear map out of V is continuous iff all composites with the j_h are; a seminorm on V is continuous iff all its pullbacks are; when V = Σ_h j_h(V_h) and the V_h carry defining lattice families, the sums Σ_h j_h(L_h) form a defining family; the locally convex direct sum ⊕_h V_h is the case of the discrete diagram. (ii) The projective limit lim← V_h is the subspace of compatible families in ∏_h V_h with the initial topology, defined by the seminorms q∘pr_h; it is the limit in NACvx K and is Hausdorff (and closed in the product) when all V_h are. (iii) For an increasing sequence V_1 ⊆ V_2 ⊆ … with T_{n+1}|V_n = T_n (a strict inductive limit), the limit topology induces T_n on V_n, the limit is Hausdorff if every V_n is, each V_n is closed if closed in V_{n+1}, and in that case a subset is bounded iff it lies and is bounded in one V_m. An inductive limit of Hausdorff spaces need not be Hausdorff; for injective compact transition maps it is (compact-type-spaces). A separated colimit is obtained by applying sep.

*Proof outline.*
1. Final topology: the lattices whose preimages are all open form a defining family; continuity of maps and seminorms out of V is Schneider Lemma 5.1(i)–(ii) and the basis by sums of lattices is Lemma 5.1(iii).
2. Direct sums: Lemma 5.2 compares ⊕ and ∏; Lemma 5.3 gives subspaces, quotients and closedness of sums, and Corollary 5.4 the Hausdorff property.
3. Strict inductive limits: Proposition 5.5 extends open lattices step by step (L_{n+m} = V_{n+m} ∩ L_{n+m+1}) to get the induced topology, Hausdorffness and closedness; Proposition 5.6 is the bounded-set criterion, proved by contradiction with a sequence escaping every V_n.
4. Projective limits: the initial topology is defined by the pulled-back seminorms, and compatible families form a closed subspace of the product when the V_h are Hausdorff.

*API.*
- `TauCeti.NALocallyConvex.naInductiveLimit` (constructor): The algebraic colimit of a diagram in NACvx K with the finest locally convex topology making the structure maps continuous.
- `TauCeti.NALocallyConvex.naInductiveLimit_lift` (universal-property): Compatible continuous linear maps V_h → W induce a unique continuous linear map lim→ V_h → W.
- `TauCeti.NALocallyConvex.naInductiveLimit_continuous_iff` (characterisation): A linear map out of lim→ V_h is continuous iff each composite with a structure map is continuous; likewise for seminorms.
- `TauCeti.NALocallyConvex.naInductiveLimit_isOpen_lattice_iff` (characterisation): A lattice of lim→ V_h is open iff its preimage in every V_h is open.
- `TauCeti.NALocallyConvex.naProjectiveLimit` (constructor): The compatible families in ∏ V_h with the initial topology.
- `TauCeti.NALocallyConvex.naProjectiveLimit_lift` (universal-property): Compatible continuous maps W → V_h induce a unique continuous map W → lim← V_h.
- `TauCeti.NALocallyConvex.naProjectiveLimit_topology` (characterisation): The topology of lim← V_h is defined by the seminorms q∘pr_h for continuous seminorms q on V_h.
- `TauCeti.NALocallyConvex.strictInductiveLimit_induced` (relation): For a strict inductive sequence the limit induces the given topology on each V_n.
- `TauCeti.NALocallyConvex.strictInductiveLimit_bounded_iff` (characterisation): If each V_n is closed in V_{n+1}, a subset of the strict limit is bounded iff it lies and is bounded in some V_m.

*Unit tests.*
- `NALocallyConvexTests.naLimit_constant` (degenerate): The constant diagram with identity maps on K has both limits K with its norm topology; the constant zero diagram has zero limits.
- `NALocallyConvexTests.naLimit_product` (computation): The projective limit of K^n under deletion of the last coordinate is K^ℕ with the product topology; the family (1, 1, 1, …) lies in it but not in c₀(ℕ, K), and (π^{−n})_n lies in it but not in ℓ^∞(ℕ, K), so the limit is neither.
- `NALocallyConvexTests.naLimit_directSum_bounded` (non-example): In the strict inductive limit K^(ℕ) = ⋃ K^n (the locally convex direct sum) the set {e_n : n ∈ ℕ} is not bounded, since it lies in no K^m; in the product K^ℕ it is bounded, so the two topologies on finitely supported sequences differ.

*Uses.* This packet: compact-type-spaces and locally-analytic-function-space: LA(X, K) is the locally convex inductive limit of its Banach index stages; This packet: compact-type-nuclear-duality: strong duals of compact-type spaces are the projective limits of the stage duals; LocallyAnalyticDistributions:L0/locally-analytic-radius: LA(ℤ_p, L) = lim→ LA_h carries the inductive-limit topology.

*Acceptance.* The three unit tests below.

*Needs:* 0.A.1 `nonarchimedean-locally-convex-spaces`.

*Sources:* Schneider, *Nonarchimedean Functional Analysis* (author notes), §5, Lemma 5.1, printed p. 27; Lemmas 5.2–5.3, printed pp. 27–28; Corollary 5.4, Propositions 5.5–5.6, printed pp. 29–30: Final and initial locally convex topologies, direct sums, strict inductive limits with their induced topologies and bounded sets. Emerton (arXiv:math/0405137v1), §1.1, Definition 1.1.16 and the paragraph after it, printed p. 13, arXiv:math/0405137v1: LF- and LB-spaces as locally convex inductive limits of sequences of Fréchet and Banach spaces; spaces of compact type are LB-spaces.

### 0.A.3 Bounded sets and the strong dual

`LocallyAnalyticDistributions:L0/bounded-sets-strong-dual` · Definition.

For V in NACvx K a subset B ⊆ V is bounded if every open lattice L absorbs it: B ⊆ aL for some a ∈ K. For V, W in NACvx K let L(V, W) be the continuous linear maps and, for a family 𝔅 of bounded subsets covering V, give L(V, W) the 𝔅-topology defined by the lattices L(B, M) = {f : f(B) ⊆ M}, B ∈ 𝔅, M an open lattice of W. With 𝔅 the finite subsets this is the weak topology L_s(V, W); with all bounded subsets it is the strong topology L_b(V, W). V′_s = L_s(V, K) and V′_b = L_b(V, K) are the weak and strong duals; both are Hausdorff. A linear map f is continuous iff for every continuous seminorm p on W some continuous seminorm q on V has p∘f ≤ q; for normed V and W the strong topology is the operator-norm topology; the transpose f′ : W′_b → V′_b of a continuous f is continuous; V is bornological if every lattice absorbing all bounded sets is open, metrizable spaces are bornological, and for bornological V and complete Hausdorff W the space L_b(V, W) is complete. Over a nontrivially normed ultrametric field K, bounded subsets are exactly Mathlib's von Neumann bounded subsets (Bornology.IsVonNBounded K), and the strong topology on L(V, W) is Mathlib's default topology on V →L[K] W, which is the topology of uniform convergence on von Neumann bounded sets; V′_b is Mathlib's StrongDual K V with that topology.

*Proof outline.*
1. Boundedness and the 𝔅-topologies: Schneider §6 defines bounded sets and the 𝔅-topologies; Proposition 6.1 is the seminorm criterion for equicontinuity, hence continuity.
2. Normed case: Remark 6.7 identifies the strong topology on L(V, W) with the operator norm when V, W are normed.
3. Bornological spaces: Propositions 6.13–6.14 characterise bornological spaces and show metrizable spaces are bornological; Proposition 7.16 gives completeness of L_b(V, W).
4. Transpose: Remark 16.1(ii) computes the preimage of L(B, o) under f′ as L(f(B), o).
5. Mathlib comparison: an open lattice is a zero neighbourhood and every zero neighbourhood contains an open lattice, so 'absorbed by every open lattice' coincides with 'absorbed by every zero neighbourhood'; Mathlib's ContinuousLinearMap.topologicalSpace is UniformConvergenceCLM over the von Neumann bounded sets, the same basic lattices L(B, M).

*API.*
- `TauCeti.NALocallyConvex.naBounded_iff_isVonNBounded` (compatibility): In a nonarchimedean locally convex space over a nontrivially normed ultrametric field, B is absorbed by every open lattice iff Bornology.IsVonNBounded K B.
- `TauCeti.NALocallyConvex.strongTopology_eq` (compatibility): The strong topology on L(V, W) is Mathlib's topology on V →L[K] W (uniform convergence on von Neumann bounded sets).
- `TauCeti.NALocallyConvex.weakDualTopology` (constructor): The weak topology L_s(V, W) of pointwise convergence.
- `TauCeti.NALocallyConvex.strongDual_normed` (compatibility): For normed V the strong dual is the dual normed space with the operator norm.
- `TauCeti.NALocallyConvex.transpose_continuous` (functoriality): For continuous f : V → W the transpose W′_b → V′_b is continuous, with (g∘f)′ = f′∘g′ and id′ = id.
- `TauCeti.NALocallyConvex.continuous_iff_seminorm_le` (characterisation): A linear map is continuous iff each continuous seminorm of the target, composed with it, is dominated by a continuous seminorm of the source.
- `TauCeti.NALocallyConvex.IsBornological` (constructor): V is bornological if every lattice absorbing all bounded subsets is open; metrizable spaces are bornological.
- `TauCeti.NALocallyConvex.strongDual_complete` (other): If V is bornological then V′_b is Hausdorff and complete.

*Unit tests.*
- `NALocallyConvexTests.strongDual_c0` (computation): For V = c₀(ℕ, K) the strong dual is ℓ^∞(ℕ, K) with the sup norm, the functional attached to b being a ↦ Σ b_n a_n.
- `NALocallyConvexTests.weak_ne_strong` (non-example): The coordinate functionals e_n^* on c₀(ℕ, K) tend to 0 in V′_s (pointwise) but have norm 1, so they do not tend to 0 in V′_b: the weak and strong duals differ.
- `NALocallyConvexTests.bounded_product` (characterisation): In K^ℕ with the product topology a subset is bounded iff each coordinate projection of it is bounded; the set {p^{-n} e_n : n ∈ ℕ} is bounded in K^ℕ (each coordinate takes only two values) but not in c₀(ℕ, ℚ_p), where the norms are p^n.
- `NALocallyConvexTests.bounded_normed` (compatibility): In a normed space V over K, B is bounded iff sup_{b∈B} ‖b‖ < ∞, in agreement with Mathlib's characterisation of von Neumann bounded sets in normed spaces.

*Uses.* This packet: compact-type-spaces: regularity of compact-type limits is a statement about bounded sets; LocallyAnalyticDistributions:L0/locally-analytic-distributions: D(ℤ_p, L) is the continuous dual; for finite L/ℚ_p its topology is the strong dual topology; Colmez–Gilles–Nizioł 2023, §2.1.3, printed p. 7: L_s and L_b, V′_s and V′_b, reflexivity.

*Acceptance.* The four unit tests below. For V = c₀(ℕ, K) the operator norm on V′ is the sup norm of the coefficient sequence (Colmez, Proposition I.1.6).

*Needs:* 0.A.1 `nonarchimedean-locally-convex-spaces`; Mathlib `Bornology.IsVonNBounded`; Mathlib `ContinuousLinearMap.topologicalSpace`; Mathlib `StrongDual`; Mathlib `ZeroAtInftyContinuousMap`.

*Sources:* Schneider, *Nonarchimedean Functional Analysis* (author notes), §6: definition of bounded sets and of the 𝔅-topologies, Proposition 6.1, printed p. 32; Remark 6.7, printed p. 35; Propositions 6.13–6.14, printed pp. 38–39; Proposition 7.16, printed p. 49; §9, definition of V′_s and V′_b and Proposition 9.1, printed p. 58; Remark 16.1, printed p. 97: Bounded sets, weak and strong topologies, continuity criterion, operator norm, bornological spaces, completeness of L_b and continuity of transposes. Colmez, *Fonctions d'une variable p-adique* (author PDF), §I.1.3, Proposition I.1.6, printed p. 6: The dual of c₀(I, L) is ℓ^∞(I, L), isometrically.

### 0.A.4 Spherically complete fields

`LocallyAnalyticDistributions:L0/spherically-complete-fields` · Definition.

K is spherically complete if every decreasing sequence of closed balls B_{r_1}(c_1) ⊇ B_{r_2}(c_2) ⊇ … (r_n > 0) in K has nonempty intersection; equivalently every family of pairwise intersecting closed balls has nonempty intersection. Spherically complete fields are complete. A field whose value group |K^×| is discrete (then |K^×| = r^ℤ for some 0 < r < 1) is spherically complete; finite extensions of ℚ_p are discretely valued and locally compact, hence spherically complete. ℂ_p is not spherically complete: a dense sequence (a_n) can be avoided by a nested sequence of balls with radii decreasing to a positive limit.

*Proof outline.*
1. Pairwise criterion: order the radii of a pairwise intersecting family and use that of two intersecting balls the one of smaller radius is contained in the other (Schneider Lemma 1.3, from Lemma 1.1).
2. Discretely valued fields: radii of a decreasing sequence of balls lie in the discrete set |K^×| ∪ {0}, so they either stabilise (the intersection contains a ball) or tend to 0 (the centres form a Cauchy sequence) (Lemma 1.6, with Lemma 1.4 for the shape of the value group).
3. ℂ_p: enumerate a dense sequence (a_n) and choose nested balls B_n of diameters decreasing to a positive limit with a_n ∉ B_n; a point in the intersection would have a ball around it avoiding the dense sequence (Schneider §1, printed pp. 7–8).

*API.*
- `TauCeti.NALocallyConvex.IsSphericallyComplete` (constructor): For a normed field K: every antitone sequence of closed balls of positive radii has nonempty intersection.
- `TauCeti.NALocallyConvex.isSphericallyComplete_iff_pairwise` (characterisation): Equivalently, every family of pairwise intersecting closed balls (positive radii) has nonempty intersection.
- `TauCeti.NALocallyConvex.IsSphericallyComplete.completeSpace` (other): A spherically complete ultrametric field is complete.
- `TauCeti.NALocallyConvex.isSphericallyComplete_of_discrete` (other): A complete ultrametric field with discrete value group is spherically complete.
- `TauCeti.NALocallyConvex.Padic.isSphericallyComplete` (example): ℚ_p (and every finite extension) is spherically complete.
- `TauCeti.NALocallyConvex.IsDiscretelyValued` (other): The nonzero absolute values of K form the group r^ℤ for some 0 < r < 1.
- `TauCeti.NALocallyConvex.Padic.isDiscretelyValued` (example): ℚ_p is discretely valued, with r = 1/p.

*Unit tests.*
- `NALocallyConvexTests.sphericallyComplete_Qp` (computation): ℚ_p is spherically complete: the closed balls B_{p^{-n}}(Σ_{k<n} p^k) are nested with intersection {Σ p^k} = {1/(1 − p)}.
- `NALocallyConvexTests.sphericallyComplete_complete` (characterisation): Every spherically complete ultrametric field is complete: the balls B_{ε_n}(x_n) attached to a Cauchy sequence with ε_n = sup_{m≥n}|x_m − x_n| (perturbed to be positive) are nested.
- `NALocallyConvexTests.not_sphericallyComplete_Cp` (non-example): ℂ_p is complete but not spherically complete.
- `NALocallyConvexTests.sphericallyComplete_constant_radius` (degenerate): If all radii equal r, nested closed balls of radius r coincide (every point of an ultrametric ball is a centre), so the intersection is nonempty in every ultrametric field; the condition has content only for strictly decreasing radii with positive limit.

*Uses.* This packet: nonarchimedean-hahn-banach: spherical completeness is the hypothesis of the Hahn–Banach theorem; Schneider, Nonarchimedean Functional Analysis, Chapter III preamble, printed p. 73: the duality theory of compact-type and nuclear spaces is developed over spherically complete fields; Colmez–Nizioł Appendix A, Remark A.2 and Proposition A.4: the splitting and compact-type extension statements carry a spherical completeness alternative.

*Acceptance.* The four unit tests below.

*Needs:* nothing beyond the conventions.

*Sources:* Schneider, *Nonarchimedean Functional Analysis* (author notes), §1: definition of spherical completeness, the ℂ_p construction and Lemma 1.3, printed pp. 7–8; Lemma 1.4 and Lemma 1.6, printed pp. 8–9: The definition, the pairwise intersection criterion, discretely valued fields are spherically complete, finite extensions of ℚ_p are, and ℂ_p is not.

### 0.A.5 The nonarchimedean Hahn–Banach theorem

`LocallyAnalyticDistributions:L0/nonarchimedean-hahn-banach` · Theorem.

Let K be spherically complete, U a K-vector space, q a nonarchimedean seminorm on U and U_0 ⊆ U a subspace. Every linear form ℓ_0 : U_0 → K with |ℓ_0(v)| ≤ q(v) on U_0 extends to a linear form ℓ on U with |ℓ(v)| ≤ q(v) for all v. Consequences: (a) if V is a Hausdorff nonarchimedean locally convex space and v_0 ≠ 0, some continuous linear form takes the value 1 at v_0; (b) every continuous linear form on a subspace V_0 ⊆ V (subspace topology) extends to a continuous linear form on V; (c) every finite-dimensional subspace of a Hausdorff V is topologically complemented; (d) for an ultrametric normed space V, a continuous linear form on a subspace extends with the same operator norm (take q = ‖ℓ_0‖·‖·‖). Without spherical completeness the theorem fails: there are nonzero locally convex spaces with no nonzero continuous linear form. Mathlib's Hahn–Banach theorems (Mathlib.Analysis.Normed.Module.HahnBanach, Mathlib.Analysis.LocallyConvex.HahnBanach) assume IsRCLikeNormedField and do not apply to ℚ_p; this theorem is therefore planned here.

*Hypotheses beyond the conventions.* K spherically complete (finite extensions of ℚ_p qualify).

*Proof outline.*
1. One step: for v_1 ∉ U_0 the balls B(v) = {a : |a − ℓ_0(v)| ≤ q(v − v_1)}, v ∈ U_0, intersect pairwise by the strict triangle inequality, so by spherical completeness (pairwise form) some b lies in all of them; setting ℓ(v_1) = b keeps |ℓ| ≤ q on U_0 + Kv_1 (Schneider, Proposition 9.2). If q(v_0 − v_1) = 0 for some v_0 the intersection is the single point ℓ_0(v_0).
2. Zorn's lemma over pairs (U_1, ℓ_1) extending ℓ_0 with |ℓ_1| ≤ q finishes the proof.
3. (a) choose a continuous seminorm with q(v_0) = 1 and extend av_0 ↦ a (Corollary 9.3); (b) dominate ℓ_0 by the restriction of a continuous seminorm of V (Corollary 9.4); (c) extend coordinate projections of a finite-dimensional subspace (Corollary 9.5).
4. Continuity of the extension follows from the seminorm bound (Proposition 6.1).

*API.*
- `TauCeti.NALocallyConvex.exists_extension_of_le_seminorm` (other): Proposition 9.2: extension of a linear form dominated by a nonarchimedean seminorm, over a spherically complete field.
- `TauCeti.NALocallyConvex.exists_extension_norm_eq` (other): Norm-preserving extension of continuous linear forms from a subspace of an ultrametric normed space.
- `TauCeti.NALocallyConvex.exists_dual_eq_one` (other): For v ≠ 0 in an ultrametric normed space some continuous linear form takes the value 1 at v.

*Acceptance.* For K = ℚ_p, U = ℚ_p² with the max norm, U_0 = ℚ_p × 0 and ℓ_0(x, 0) = x, every ℓ(x, y) = x + cy with |c| ≤ 1 is an extension: the extension is not unique. Applied to the closed proper subspace c₀(ℕ, K) of ℓ^∞(ℕ, K), (a) for ℓ^∞/c₀ gives a nonzero continuous linear form on ℓ^∞ vanishing on c₀, the key step of Schneider Proposition 11.1 (c₀ is not reflexive). With K = ℂ_p (not spherically complete) the statement is not asserted.

*Needs:* 0.A.4 `spherically-complete-fields`; 0.A.1 `nonarchimedean-locally-convex-spaces`; 0.A.3 `bounded-sets-strong-dual`.

*Sources:* Schneider, *Nonarchimedean Functional Analysis* (author notes), §9, Proposition 9.2 (Hahn–Banach), printed pp. 58–59; Corollaries 9.3–9.4, printed p. 59; Corollary 9.5, printed p. 60; preface, printed p. 2: The extension theorem for seminorm-dominated forms over a spherically complete field, its corollaries on separation, extension from subspaces and complements of finite-dimensional subspaces, and the failure without spherical completeness. Schneider, *Nonarchimedean Functional Analysis* (author notes), §1, Lemma 1.3, printed p. 8: Pairwise intersecting balls have a common point in a spherically complete field; used in the extension step.

## 0.B. Strict morphisms, the left heart and tensor products

Colmez–Nizioł state their extension results for exact sequences of the left heart LH(C_K). The targets below build the quasi-abelian categories NACvx K and HANACvx K, Schneiders' strict derived category with its left t-structure and heart, and show that an extension of classical objects is a strict short exact sequence; this is the comparison the predecessor node `L0/strict-sequence-comparison` recorded as an input. The second half gives the projective and inductive tensor products, their agreement for Fréchet spaces and for semi-complete LB-spaces, and the c₀ tensor identities used stage by stage.

### 0.B.1 Strict morphisms and the quasi-abelian categories NACvx and HANACvx

`LocallyAnalyticDistributions:L0/strict-morphisms-quasi-abelian` · Construction.

A morphism f : V → W of NACvx K is strict if the induced bijection V/ker f → f(V) is a homeomorphism for the quotient and subspace topologies, equivalently f is relatively open: for every open lattice L of V some open lattice M of W has M ∩ f(V) ⊆ f(L). This is Mathlib's Topology.IsStrictMap for linear maps (the factorisation onto the range is a quotient map; for linear maps this is equivalent to V/ker f → range f being a homeomorphism). In HANACvx K, where the image is closure(f(V)), f is strict iff it is strict in NACvx K and f(V) is closed. Both NACvx K and HANACvx K are quasi-abelian: they are additive with kernels and cokernels, a pullback of a strict epimorphism is a strict epimorphism and a pushout of a strict monomorphism is a strict monomorphism. Strict monomorphisms are the topological embeddings (closed embeddings in HANACvx K) and strict epimorphisms the open surjections (surjections onto Hausdorff quotients in HANACvx K). A sequence V′ → V → V″ is strictly exact if the first map is strict and its image is the kernel of the second; a sequence of Hausdorff spaces is strictly exact in HANACvx K iff it is strictly exact in NACvx K. The short strictly exact sequences make both categories exact categories in Quillen's sense, the notion that the Tau Ceti roadmap GrothendieckEulerForms plans as ExactStructure in its Layer 0 (tauceti:TauCetiRoadmap/GrothendieckEulerForms#layer-0-intrinsic-exact-structures-and-conflation-exact-functors); that notion is cited, not planned here.

*Proof outline.*
1. Relative openness: for linear maps the quotient-to-image comparison is open iff the images of open lattices contain traces of open lattices on f(V) (Colmez–Dospinescu–Nizioł §2.1.1); Mathlib's LinearMap.isStrictMap_iff_isHomeomorph_quotKerEquivRange gives the comparison with Topology.IsStrictMap.
2. Pullbacks: the pullback of g : W → Z along a strict epimorphism f : V → Z is the subspace {(v, w) : f(v) = g(w)} of V × W; its projection to W is open onto W because f is open and surjective, by intersecting product lattices.
3. Pushouts: for a strict monomorphism f : E → F and g : E → G the pushout is (F ⊕ G)/{(f(e), −g(e))}; given an open lattice L_G of G choose, using that E has the topology induced from F, an open lattice L_F of F with f^{-1}(L_F) ⊆ g^{-1}(L_G); then the image of L_F ⊕ L_G meets G in L_G, so G → pushout is a topological embedding. In the Hausdorff category the graph is closed and the embedding is closed.
4. Hausdorff strict exactness: kernels agree in both categories and for Hausdorff spaces a strict morphism of NACvx K with closed image is strict in HANACvx K, which gives the comparison of strictly exact sequences (Colmez–Gilles–Nizioł §2.1.2).

*API.*
- `TauCeti.NALocallyConvex.naStrict_iff_relativelyOpen` (characterisation): A continuous linear map is strict iff it is relatively open onto its image; equivalently Mathlib's Topology.IsStrictMap.
- `TauCeti.NALocallyConvex.haStrict_iff_closed_and_naStrict` (characterisation): Between Hausdorff spaces, f is strict in HANACvx K iff f is strict in NACvx K and has closed image.
- `TauCeti.NALocallyConvex.naStrict_pullback` (relation): Pullbacks of strict epimorphisms in NACvx K are strict epimorphisms.
- `TauCeti.NALocallyConvex.naStrict_pushout` (relation): Pushouts of strict monomorphisms in NACvx K are strict monomorphisms.
- `TauCeti.NALocallyConvex.haStrict_pullback` (relation): The same for HANACvx K.
- `TauCeti.NALocallyConvex.haStrict_pushout` (relation): The same for HANACvx K (closed embeddings).
- `TauCeti.NALocallyConvex.naQuasiAbelian` (instance): NACvx K is quasi-abelian.
- `TauCeti.NALocallyConvex.haQuasiAbelian` (instance): HANACvx K is quasi-abelian.
- `TauCeti.NALocallyConvex.haStrictExact_iff` (characterisation): A sequence of Hausdorff spaces is strictly exact in HANACvx K iff it is strictly exact in NACvx K.
- `TauCeti.NALocallyConvex.naExactStructure` (compatibility): With the short strictly exact sequences as conflations, NACvx K and HANACvx K carry an exact structure (Schneiders Remark 1.1.11), an ExactStructure in the sense of the Tau Ceti roadmap GrothendieckEulerForms, Layer 0; this roadmap uses only the quasi-abelian structure and does not plan exact categories.

*Unit tests.*
- `NALocallyConvexTests.strict_split_line` (computation): K → K², x ↦ (x, 0), followed by (x, y) ↦ y is strictly exact; its pullback along 0 → K is K and its pushout along K → 0 is K.
- `NALocallyConvexTests.strict_dense_inclusion` (non-example): The inclusion of finitely supported sequences into c₀(ℕ, K) with the inherited norm is strict in NACvx K (a topological embedding) but not strict in HANACvx K, since its image is dense and proper.
- `NALocallyConvexTests.strict_diagonal_failure` (non-example): On c₀(ℕ, ℚ_p) the operator T(x)_n = p^n x_n is continuous and injective with dense proper image but not relatively open: ‖e_n‖ = 1 while ‖T e_n‖ = p^{-n} → 0, so its inverse on the image is discontinuous and T is not a Topology.IsStrictMap.

*Uses.* This packet: strict-derived-category-left-heart: the strict derived category and the left heart are built from strictly exact complexes; Colmez–Nizioł Appendix A, printed pp. 58–59: exact sequences of LH(C_K) with classical terms are strict short exact sequences; This packet: banach-open-mapping-lifts: continuous surjections of Banach spaces are strict epimorphisms.

*Acceptance.* The three unit tests below.

*Needs:* 0.A.1 `nonarchimedean-locally-convex-spaces`; 0.A.2 `locally-convex-limits`; Mathlib `Topology.IsStrictMap`; Mathlib `LinearMap.isStrictMap_iff_isHomeomorph_quotKerEquivRange`.

*Sources:* Colmez–Dospinescu–Nizioł (arXiv:1801.06686v2), §2.1.1, printed pp. 7–8: C_K is quasi-abelian; kernels, cokernels, images and coimages are algebraic with induced topologies; a morphism is strict iff relatively open. Colmez–Gilles–Nizioł (arXiv:2308.07712v2), §2.1.1–2.1.2, printed p. 7: C_K and CH_K are quasi-abelian; in CH_K cokernels and images use closures; strict exactness in CH_K and C_K agree. Schneiders, *Quasi-abelian categories and sheaves*, §1.1.2, Definition 1.1.3, printed p. 8; Proposition 1.1.7, printed p. 11; Definition 1.1.9 and Remarks 1.1.10–1.1.11, printed p. 13: The axioms of a quasi-abelian category (stability of strict epimorphisms under pullback and strict monomorphisms under pushout), stability of strict epimorphisms under composition, strictly exact sequences, and the exact-category structure given by the short strictly exact sequences.

### 0.B.2 The strict derived category and the left heart

`LocallyAnalyticDistributions:L0/strict-derived-category-left-heart` · Construction.

Let E be NACvx K or HANACvx K (quasi-abelian). In the homotopy category K(E) of cochain complexes, the strictly exact complexes form a saturated null system, and the derived category is the Verdier quotient D(E) = K(E)/N(E); a strict quasi-isomorphism is a morphism with strictly exact mapping cone. D(E) carries the left t-structure: D^{≤0} consists of the complexes strictly exact in positive degrees, D^{≥0} of those strictly exact in negative degrees; the truncations send E to (… → E^{n−1} → ker d^n → 0) and to (0 → coim d^{n−1} → E^n → …), so the cohomology object LH^n(E) is the monomorphism coim d^{n−1} → ker d^n placed in degrees −1, 0, and LH^n(E) = 0 iff E is strictly exact in degree n. The heart LH(E) is abelian; each object is represented by a monomorphism E_1 → E_0 (E_0 in degree 0), two representations being identified through squares that are both cartesian and cocartesian. The functor I : E → LH(E), V ↦ [0 → V], is fully faithful; a sequence V′ → V → V″ of E is strictly exact iff I(V′) → I(V) → I(V″) is exact in LH(E). The classical part C : LH(E) → E sends [E_1 → E_0] to coker(E_1 → E_0); C is left adjoint to I and C∘I ≅ id, so E is reflective in LH(E). An object [E_1 → E_0] lies in the essential image of I (is classical) iff E_1 → E_0 is strict; classical objects are stable under subobjects and extensions; and I induces an equivalence D(E) ≃ D(LH(E)). In NACvx K a non-Hausdorff cokernel stays classical, while in HANACvx K the classical part is the Hausdorff cokernel.

*Proof outline.*
1. Null system: a triangle with two strictly exact vertices in a degree has its third vertex strictly exact there, by a cartesian-square argument (Schneiders Proposition 1.2.14, Corollary 1.2.15); define D(E) as the quotient (Definition 1.2.16).
2. t-structure: Lemma 1.2.17 transfers the t-structure of K(E) to the quotient; Definition 1.2.18 names it; Proposition 1.2.19 computes the truncations and LH^n; Corollary 1.2.20 characterises vanishing and the aisles by strict exactness.
3. Heart: Corollary 1.2.21 describes LH(E) as a localisation of the category of monomorphisms; Definitions 1.2.22–1.2.26 define representations, I and C.
4. Adjunction and exactness: Proposition 1.2.27 (C ⊣ I, C∘I ≅ id), Corollary 1.2.28 (I fully faithful, reflects and preserves strict exactness).
5. Classical objects: Proposition 1.2.29 (strict representations, stability under subobjects and extensions); Proposition 1.2.32 (D(E) ≃ D(LH(E))).
6. Carriers: use Mathlib's HomotopyCategory of cochain complexes indexed by ℤ, which is pretriangulated for additive categories, its localisation at the strict quasi-isomorphisms (Functor.IsLocalization), and Mathlib's TStructure, which requires a pretriangulated category; the strict-exactness predicate comes from strict-morphisms-quasi-abelian.

*API.*
- `TauCeti.NALocallyConvex.naStrictDerivedCategory` (constructor): D(NACvx K) as the localisation of the homotopy category of cochain complexes at the strict quasi-isomorphisms.
- `TauCeti.NALocallyConvex.naStrictDerivedCategory_acyclic_iff_zero` (characterisation): A complex is zero in D(NACvx K) iff it is strictly exact.
- `TauCeti.NALocallyConvex.naLeftTStructure_truncation` (data): The left t-structure with the truncations τ^{≤n} (ending in ker d^n) and τ^{≥n} (starting with coim d^{n−1}).
- `TauCeti.NALocallyConvex.naLeftCohomology_monoModel` (characterisation): LH^n(E) is represented by coim d^{n−1} → ker d^n, and vanishes iff E is strictly exact in degree n.
- `TauCeti.NALocallyConvex.naLeftHeart` (constructor): The heart LH(NACvx K), an abelian category.
- `TauCeti.NALocallyConvex.naHeartEmbedding` (data): I : NACvx K → LH(NACvx K), V ↦ [0 → V].
- `TauCeti.NALocallyConvex.naHeartEmbedding_fullyFaithful` (other): I is fully faithful.
- `TauCeti.NALocallyConvex.naHeartEmbedding_exact_iff_strictExact` (characterisation): V′ → V → V″ is strictly exact iff its image under I is exact.
- `TauCeti.NALocallyConvex.naClassicalPart` (data): C : LH(NACvx K) → NACvx K, [E_1 → E_0] ↦ coker, left adjoint to I with C∘I ≅ id.
- `TauCeti.NALocallyConvex.naHeart_classical_iff_strict` (characterisation): [E_1 → E_0] is in the essential image of I iff E_1 → E_0 is strict.
- `TauCeti.NALocallyConvex.naHeartEmbedding_extensionClosed` (relation): The essential image of I is closed under subobjects and extensions.
- `TauCeti.NALocallyConvex.haLeftHeart` (constructor): The same construction for HANACvx K, with the same API under the prefix ha; its classical part is the Hausdorff cokernel.

*Unit tests.*
- `NALocallyConvexTests.heart_split_line` (computation): The split sequence K → K² → K gives in either heart the extension of I(K) by I(K) with middle term I(K²).
- `NALocallyConvexTests.heart_identity` (degenerate): [K → K] (identity) is zero in the derived category and in the heart, while [0 → K] = I(K) is not zero.
- `NALocallyConvexTests.derived_split` (computation): The complex K → K² → K (split, strictly exact) is zero in D(NACvx K); its two-term truncation [K → K²] represents the classical object I(K).
- `NALocallyConvexTests.heart_dense_diagonal` (non-example): [c₀ → c₀] with T(x)_n = p^n x_n is not classical in either heart (T is not strict), although its Hausdorff cokernel is 0; replacing it by its classical part loses the object. The finitely supported inclusion into c₀ (strict in NACvx K) is classical in LH(NACvx K), with non-Hausdorff classical part.

*Uses.* Colmez–Nizioł Appendix A, Propositions A.1, A.3, A.4, printed pp. 58–59: the three-space statements are made for exact sequences of LH(C_K); This packet: left-heart-classical-extensions: extensions of classical objects are strict short exact sequences; Colmez–Gilles–Nizioł 2023, §2.1.1, printed p. 7: cohomology objects H̃^n(E) = (coim d^{n−1} → ker d^n) and the notion of classical cohomology.

*Acceptance.* The four unit tests below.

*Needs:* 0.B.1 `strict-morphisms-quasi-abelian`; Mathlib `HomotopyCategory`; Mathlib `CategoryTheory.Functor.IsLocalization`; Mathlib `CategoryTheory.Triangulated.TStructure`.

*Sources:* Schneiders, *Quasi-abelian categories and sheaves*, §1.2: Proposition 1.2.14 and Corollary 1.2.15, printed pp. 20–21; Definition 1.2.16 and Lemma 1.2.17, printed pp. 21–22; Definition 1.2.18 and Proposition 1.2.19, printed pp. 23–24; Corollaries 1.2.20–1.2.21, printed pp. 24–25; Definitions 1.2.22–1.2.24, printed p. 25; Definition 1.2.26 and Proposition 1.2.27, printed p. 26; Corollary 1.2.28, printed p. 27; Proposition 1.2.29, printed pp. 28–29; Proposition 1.2.32, printed p. 30: The derived category of a quasi-abelian category, its left t-structure, the left heart, the embedding I, the classical part C and their properties. Colmez–Dospinescu–Nizioł (arXiv:1801.06686v2), §2.1.1, printed pp. 8–9: The same construction for C_K: truncations, LH(C_K), the embedding I and the classical part, and the facts that classical objects are closed under extensions and that strict exactness is detected in LH(C_K).

### 0.B.3 Extensions of classical objects are strict short exact sequences

`LocallyAnalyticDistributions:L0/left-heart-classical-extensions` · Lemma.

Let 0 → A′ → A → A″ → 0 be an exact sequence in LH(NACvx K) with A′ = I(V_1) and A″ = I(V_2) classical. Then A is classical, A ≅ I(V) with V = C(A), and 0 → V_1 → V → V_2 → 0 is strictly exact in NACvx K: V_1 → V is a topological embedding onto the kernel and V → V_2 an open surjection. If V_1 and V_2 are Hausdorff then V_1 is closed in V, V is Hausdorff and the sequence is strictly exact in HANACvx K. Conversely every strict short exact sequence of NACvx K gives an exact sequence in LH(NACvx K). Hence an exact sequence of LH(C_K) with classical outer terms, as in Colmez–Nizioł Appendix A, is the same as a strict short exact sequence of locally convex spaces, and statements about it are statements about strict extensions.

*Proof outline.*
1. Classicality of A: classical objects are closed under extensions (Schneiders Proposition 1.2.29(c)).
2. Strict exactness: apply Corollary 1.2.28 to 0 → I(V_1) → I(V) → I(V_2) → 0, which is exact, so 0 → V_1 → V → V_2 → 0 is strictly exact; the converse is the other direction of Corollary 1.2.28.
3. Hausdorff case: V_1 is the kernel of a continuous map to the Hausdorff space V_2, hence closed; a vector of V outside V_1 is separated from 0 through V_2, and a nonzero vector of V_1 by the subspace topology, so V is Hausdorff; strict exactness in HANACvx K follows from strict-morphisms-quasi-abelian.

*Acceptance.* For the split sequence K → K² → K the middle classical part is K². The finitely supported inclusion c_c(ℕ, K) → c₀(ℕ, K) is a strict monomorphism of NACvx K with non-Hausdorff cokernel; its extension sequence lives in NACvx K but not in HANACvx K, so Hausdorff outer terms are needed for the last assertion.

*Needs:* 0.B.2 `strict-derived-category-left-heart`; 0.B.1 `strict-morphisms-quasi-abelian`.

*Sources:* Schneiders, *Quasi-abelian categories and sheaves*, Corollary 1.2.28, printed pp. 27–28; Proposition 1.2.29(c), printed pp. 28–29: I detects strict exactness, and classical objects are closed under extensions. Colmez–Dospinescu–Nizioł (arXiv:1801.06686v2), §2.1.1, facts (1) and (2), printed pp. 8–9: The same two facts, stated for C_K. Colmez–Nizioł, *The C_st-conjecture* (author PDF), Appendix A, Propositions A.1, A.3 and A.4, printed pp. 58–59: The exact sequences of LH(C_K) whose middle terms are studied; this lemma identifies them with strict extensions.

### 0.B.4 The projective tensor product and its completion

`LocallyAnalyticDistributions:L0/projective-tensor-product` · Construction.

For V, W in NACvx K, V ⊗_{K,π} W is the algebraic tensor product with the locally convex topology defined by the lattices L ⊗_{O_K} M (images of L ⊗ M) for open lattices L ⊆ V, M ⊆ W; equivalently by the tensor seminorms (p ⊗ q)(u) = inf{max_i p(v_i)q(w_i) : u = Σ v_i ⊗ w_i}, and p_L ⊗ p_M = p_{L⊗M}. It represents jointly continuous bilinear maps: a bilinear β : V × W → U is jointly continuous iff the linear map V ⊗_π W → U is continuous. (p ⊗ q)(v ⊗ w) = p(v)q(w), and p ⊗ q is a norm iff p and q are; V ⊗_π W is Hausdorff when V and W are, and for subspaces V_0 ⊆ V, W_0 ⊆ W the projective topology on V_0 ⊗ W_0 is the subspace topology. The completed projective tensor product V ⊗̂_{K,π} W is the Hausdorff completion; it represents jointly continuous bilinear maps into complete Hausdorff spaces, and the algebraic tensor product is dense in it. For Banach spaces it is the Banach space completion of V ⊗ W for the tensor norm.

*Proof outline.*
1. Universal property: Schneider Lemma 17.1 characterises joint continuity by lattices, which is the definition of the projective topology.
2. Gauges: Lemma 17.2 computes p_L ⊗ p_M = p_{L⊗M}; Lemma 17.3 and Proposition 17.4 give the pure-tensor formula and the norm criterion; Corollary 17.5 gives Hausdorffness and the subspace property.
3. Completion: the Hausdorff completion of Schneider Proposition 7.5 (Mathlib's UniformSpace.Completion on the uniform structure of the topological group) composes the universal property with completeness of the target.
4. Banach case: Colmez §I.1.4 defines the tensor valuation as the best value over all expressions, which is the norm p ⊗ q.

*API.*
- `TauCeti.NALocallyConvex.projectiveTensor` (constructor): V ⊗_{K,π} W on Mathlib's TensorProduct K V W with the projective topology.
- `TauCeti.NALocallyConvex.projectiveTensor_tmul` (simp): The canonical bilinear map (v, w) ↦ v ⊗ w is jointly continuous.
- `TauCeti.NALocallyConvex.projectiveTensor_lift` (universal-property): A jointly continuous bilinear map V × W → U induces a continuous linear map V ⊗_π W → U.
- `TauCeti.NALocallyConvex.projectiveTensor_lift_unique` (extensionality): Two continuous linear maps from V ⊗_π W agreeing on pure tensors are equal.
- `TauCeti.NALocallyConvex.projectiveTensor_pureNorm` (relation): (p ⊗ q)(v ⊗ w) = p(v)q(w); for normed factors ‖v ⊗ w‖_π = ‖v‖‖w‖.
- `TauCeti.NALocallyConvex.projectiveTensor_t2` (other): V ⊗_π W is Hausdorff if V and W are.
- `TauCeti.NALocallyConvex.completedProjectiveTensor` (constructor): V ⊗̂_{K,π} W, the Hausdorff completion.
- `TauCeti.NALocallyConvex.completedProjectiveTensor_lift` (universal-property): Jointly continuous bilinear maps into complete Hausdorff spaces factor uniquely through V ⊗̂_π W.
- `TauCeti.NALocallyConvex.completedProjectiveTensor_dense` (other): The algebraic tensor product has dense image in V ⊗̂_π W.

*Unit tests.*
- `NALocallyConvexTests.projectiveTensor_pure` (computation): For normed V and W, ‖v ⊗ w‖_π = ‖v‖·‖w‖, and K ⊗̂_π V ≅ V via a ⊗ v ↦ av. A sum formula without the ultrametric maximum would give ‖e_1 ⊗ f_1 + e_2 ⊗ f_2‖ = 2 for orthonormal vectors instead of 1.
- `NALocallyConvexTests.projectiveTensor_zero` (degenerate): 0 ⊗̂_π V = 0, including V = 0; the unique bilinear map out of 0 × V factors uniquely.
- `NALocallyConvexTests.projectiveTensor_completion` (non-example): In c₀(ℕ, K) ⊗̂_π c₀(ℕ, K) the convergent sum Σ_n p^n e_n ⊗ e_n is the diagonal array p^n at (n, n) of c₀(ℕ², K), whose coefficient matrix has infinite rank; it is not in the algebraic tensor product, so the uncompleted product is not the completed one.

*Uses.* This packet: c0-completed-tensor: stagewise tensor products of c₀ spaces are identified with c₀ of product index sets; This packet: inductive-tensor-product and compact-type-tensor-products: the projective and inductive topologies are compared and the compact-type product is computed; LocallyAnalyticDistributions:L0/locally-analytic-radius: LA_h(ℤ_p, L) = L ⊗̂_{ℚ_p} LA_h(ℤ_p, ℚ_p).

*Acceptance.* The three unit tests below.

*Needs:* 0.A.1 `nonarchimedean-locally-convex-spaces`; Mathlib `TensorProduct`; Mathlib `UniformSpace.Completion`.

*Sources:* Schneider, *Nonarchimedean Functional Analysis* (author notes), §17, Lemma 17.1, printed p. 109; Lemmas 17.2–17.3, printed p. 111; Proposition 17.4, printed p. 112; Corollary 17.5, printed p. 113; Proposition 7.5, printed p. 43: The projective tensor product topology, its gauge seminorms, the pure tensor formula, Hausdorffness, compatibility with subspaces, and the Hausdorff completion. Colmez, *Fonctions d'une variable p-adique* (author PDF), §I.1.4, printed p. 6: The completed tensor product of two L-Banach spaces through the tensor valuation.

### 0.B.5 The inductive tensor product and its comparison with the projective one

`LocallyAnalyticDistributions:L0/inductive-tensor-product` · Construction.

For V, W in NACvx K, V ⊗_{K,ι} W is V ⊗ W with the finest locally convex topology for which the canonical bilinear map is separately continuous; it represents separately continuous bilinear maps, and V ⊗̂_{K,ι} W is its Hausdorff completion, representing them into complete Hausdorff targets. The identity V ⊗_ι W → V ⊗_π W is continuous. (a) For Fréchet spaces V and W the two topologies coincide. (b) Inductive tensor products commute with locally convex inductive limits: for V = lim→ V_i and W = lim→ W_j the natural map lim→_{(i,j)} V_i ⊗_ι W_j → V ⊗_ι W is a topological isomorphism. (c) For semi-complete LB-spaces V and W (countable inductive limits of Banach spaces, sequentially complete), in particular for spaces of compact type, V ⊗_ι W = V ⊗_π W; so for spaces of compact type ⊗̂ denotes either completion. In general the two differ.

*Hypotheses beyond the conventions.* For (c): K spherically complete, as in Emerton (0.1).

*Proof outline.*
1. Universal property and the comparison map: separate continuity is weaker than joint continuity, so the inductive topology is finer (Schneider §17.A).
2. (a) A separately continuous bilinear map on a product of Fréchet spaces is jointly continuous, by a Banach–Steinhaus argument on the family of maps v ↦ β(v, w_n) for a null sequence (w_n) (Schneider Proposition 17.6).
3. (b) Compatible separately continuous maps out of the V_i ⊗ W_j assemble, and the universal property of the inductive tensor topology identifies the two topologies (Emerton Lemma 1.1.30).
4. (c) For semi-complete LB-spaces, every separately continuous bilinear map is jointly continuous, by the Bourbaki argument that Emerton adapts using his Corollary 1.1.23 and Proposition 1.1.24 (Emerton Proposition 1.1.31).

*API.*
- `TauCeti.NALocallyConvex.inductiveTensor` (constructor): V ⊗_{K,ι} W, the finest locally convex topology making the canonical bilinear map separately continuous.
- `TauCeti.NALocallyConvex.inductiveTensor_lift` (universal-property): Separately continuous bilinear maps V × W → U correspond to continuous linear maps V ⊗_ι W → U.
- `TauCeti.NALocallyConvex.completedInductiveTensor_lift` (universal-property): The same for complete Hausdorff U and the completion V ⊗̂_ι W.
- `TauCeti.NALocallyConvex.inductiveTensor_to_projective` (relation): The identity V ⊗_ι W → V ⊗_π W is continuous.
- `TauCeti.NALocallyConvex.frechetTensor_pi_eq_iota` (equivalence): For Fréchet V and W the identity V ⊗_ι W → V ⊗_π W is a homeomorphism.
- `TauCeti.NALocallyConvex.inductiveTensor_inductiveLimit` (equivalence): lim→ V_i ⊗_ι W_j ≅ (lim→ V_i) ⊗_ι (lim→ W_j).
- `TauCeti.NALocallyConvex.lbTensor_iota_eq_pi` (equivalence): For semi-complete LB-spaces (in particular of compact type) the identity V ⊗_ι W → V ⊗_π W is a homeomorphism.

*Unit tests.*
- `NALocallyConvexTests.inductiveTensor_banach` (compatibility): For Banach V and W the inductive and projective tensor topologies coincide with the tensor-norm topology.
- `NALocallyConvexTests.inductiveTensor_point` (degenerate): K ⊗_ι V ≅ V and 0 ⊗_ι V = 0.
- `NALocallyConvexTests.inductiveTensor_ne_projective` (non-example): On K^(ℕ) (locally convex direct sum) × K^ℕ (product) the pairing (x, y) ↦ Σ x_n y_n is separately continuous but not jointly continuous: a zero neighbourhood of the product constrains only finitely many coordinates, so for x = a_{N+1} e_{N+1} in a basic lattice ⊕ a_n O_K and y = c e_{N+1} with |c| large the value is unbounded. Hence K^(ℕ) ⊗_ι K^ℕ ≠ K^(ℕ) ⊗_π K^ℕ.

*Uses.* This packet: compact-type-tensor-products and locally-analytic-product: the product of compact-type function spaces is computed stagewise and the two tensor topologies agree; LocallyAnalyticDistributions:L0/product-analytic-tensor: LA(X, K) ⊗̂_ι LA(Y, K) ≅ LA(X × Y, K); Kohlhaase 2011, Proposition 1.2 (strict LF case), as recorded in the predecessor node: the general compact-type comparison is supplied here instead of extending the strict LF statement.

*Acceptance.* The three unit tests below.

*Needs:* 0.B.4 `projective-tensor-product`; 0.A.2 `locally-convex-limits`.

*Sources:* Schneider, *Nonarchimedean Functional Analysis* (author notes), §17.A, definition of separately continuous maps and of the inductive tensor product, printed pp. 108–109; Proposition 17.6, printed pp. 113–114: The inductive tensor product topology, its universal property, and its agreement with the projective one for Fréchet spaces. Emerton (arXiv:math/0405137v1), §1.1, Lemma 1.1.30 and Proposition 1.1.31, arXiv:math/0405137v1: Inductive tensor products commute with locally convex inductive limits; for semi-complete LB-spaces the inductive and projective tensor topologies agree.

### 0.B.6 Completed tensor products of c₀ spaces

`LocallyAnalyticDistributions:L0/c0-completed-tensor` · Comparison.

For a set I and a K-Banach space B (K ⊆ ℂ_p closed, or any complete nonarchimedean K), c₀(I, K) ⊗̂_π B is isometrically isomorphic to c₀(I, B), sending e_i ⊗ b to the family with b at i and 0 elsewhere. Consequently c₀(I, K) ⊗̂_π c₀(J, K) ≅ c₀(I × J, K) isometrically (e_i ⊗ e_j ↦ e_{(i,j)}); if (e_i) and (f_j) are orthonormal bases of B_1 and B_2 then (e_i ⊗ f_j) is an orthonormal basis of B_1 ⊗̂ B_2; for closed subfields L ⊆ K′ of ℂ_p an orthonormal basis of an L-Banach space B stays orthonormal in K′ ⊗̂_L B; and for a complete ultrametric Banach K-algebra A with isometric scalar action, c₀(I, K) ⊗̂_π A ≅ c₀(I, A). These isomorphisms are natural in B. In particular LA_h(ℤ_p, L) = L ⊗̂_{ℚ_p} LA_h(ℤ_p, ℚ_p) for every closed L ⊆ ℂ_p, and the stages of several-variable analytic functions on products of charts are the completed tensor products of the factor stages.

*Proof outline.*
1. The algebraic tensor product c₀(I, K) ⊗ B is the space of families in c₀(I, B) spanning a finite-dimensional subspace of B, which contains the finitely supported families and is dense (Colmez, proof of Proposition I.1.8).
2. The tensor norm equals the sup norm on it: one inequality is the triangle inequality for each expression; for the other, choose a basis of the finite-dimensional span and split off the finitely many large coordinates (Colmez, proof of Proposition I.1.8).
3. Completeness of c₀(I, B) and density give the isometric isomorphism; the corollaries on bases and scalar extension follow (Colmez, Corollary I.1.9).
4. The c₀(I × J) form is the case B = c₀(J, K); the algebra case uses the same proof with coefficients in A.

*Acceptance.* c0Tensor_basis: e_2 ⊗ e_3 has coefficient 1 at (2, 3) and 0 at (3, 2); e_2 ⊗ a has norm ‖a‖. c0Tensor_empty: I = ∅ gives 0 after any scalar extension; a singleton I gives B. c0Tensor_infinite: the array with p^n at (n, n) and 0 elsewhere lies in c₀(ℕ², K) and is the completed sum Σ p^n e_n ⊗ e_n; the array constantly 1 on ℕ² is excluded by the c₀ condition.

*Needs:* 0.B.4 `projective-tensor-product`; Mathlib `ZeroAtInftyContinuousMap`.

*Sources:* Colmez, *Fonctions d'une variable p-adique* (author PDF), §I.1.4, Proposition I.1.8, printed p. 6, and Corollary I.1.9, printed p. 7: c₀(I, L) ⊗̂_L B is isometric to c₀(I, B); orthonormal bases of tensor products and of scalar extensions.

## 0.C. Banach spaces, compact type, nuclearity and the three-space inputs

These targets supply the proof inputs of the predecessor's three-space theorems (`L0/banach-three-space`, `L0/banach-splitting`, `L0/frechet-three-space`, `L0/compact-type-three-space`) and the compact-type duality behind `L0/compact-type-dual-reflexivity`: orthonormal bases of Banach spaces, controlled lifts and complements, compactoid sets and compact maps (compared with Mathlib's IsCompactOperator over locally compact fields), spaces of compact type, nuclear spaces and their anti-equivalence, completed tensor products of spaces of compact type, nuclearity of strict extensions, the splitting of finite-rank extensions, and the duality step for compact-type extensions with its open strictness input.

### 0.C.1 Orthonormal bases of Banach spaces

`LocallyAnalyticDistributions:L0/banach-c0-models` · Theorem.

(a) If K is discretely valued, every K-Banach space V is topologically isomorphic to c₀(X, K) for some set X, and isometrically so when ‖V‖ ⊆ |K|; any norm can be replaced by an equivalent one with values in |K| (round up to the next value), and c₀(X) ≅ c₀(Y) forces |X| = |Y|. (b) For any K, a K-Banach space containing a dense subspace of countably infinite dimension (a Banach space of countable type) is topologically isomorphic to c₀(ℕ, K); more precisely, for every 0 < r < 1 it has a basis (v_n) with ‖Σ a_n v_n‖ ≥ r·max_n ‖a_n v_n‖ and, after scaling, ε ≤ ‖v_n‖ ≤ 1 for some ε > 0. In Mathlib's terms c₀(X, K) is ZeroAtInftyContinuousMap X K for discrete X with the sup norm. For L discretely valued, a family (e_i) in the unit ball is an orthonormal basis of an L-Banach space B with ‖B‖ = |L| iff its reductions form a basis of the residue-field vector space B_0/π_L B_0.

*Proof outline.*
1. Universal property of c₀(X): a bounded map X → V into a Hausdorff quasi-complete space extends uniquely to a continuous linear map c₀(X) → V (Schneider §10, printed pp. 66–67).
2. (a) Normalise ‖V‖ ⊆ |K|; lift a basis of the residue vector space B_1(0)/B^-_1(0) to the unit ball; the induced map from c₀(X) is an isometry (a residue computation for finite sums) with dense image, by successive approximation using that 0 is the only accumulation point of |K| (Proposition 10.1, Remark 10.2); Lemma 10.3 compares cardinalities.
3. (b) Choose an increasing flag V_n of finite-dimensional subspaces with dense union and, given 0 < r = r_1 < r_2 < … < 1, inductively pick v_n ∈ V_n with ‖v_n + w‖ ≥ (r_n/r_{n+1})‖v_n‖ for w ∈ V_{n−1}; this yields the r-orthogonality estimate and an isomorphism c₀(ℕ) → V (Proposition 10.4).
4. Residue criterion: Colmez Proposition I.1.5 lifts a residue basis digit by digit and checks the isometry.

*API.*
- `TauCeti.NALocallyConvex.nonempty_equiv_c0_of_countableType` (equivalence): An infinite-dimensional K-Banach space of countable type is isomorphic to c₀(ℕ, K).

*Acceptance.* c₀(ℕ, K) itself, with the unit vectors. LA_h(ℤ_p, L) has the explicit orthonormal basis e_{h,n} of LocallyAnalyticDistributions:L0/locally-analytic-radius. ℓ^∞(ℕ, ℚ_p) is isomorphic to c₀(X) for an uncountable X by (a), but it is not of countable type, and it is not isomorphic to c₀(ℕ) by Lemma 10.3: the countability hypothesis of (b) cannot be dropped.

*Needs:* 0.A.1 `nonarchimedean-locally-convex-spaces`; Mathlib `ZeroAtInftyContinuousMap`.

*Sources:* Schneider, *Nonarchimedean Functional Analysis* (author notes), §10: the universal property of c₀(X), printed pp. 66–67; Proposition 10.1 and Remark 10.2, printed pp. 67–68; Lemma 10.3, printed pp. 68–69; Proposition 10.4, printed pp. 69–70: Banach spaces over discretely valued fields are c₀(X); Banach spaces of countable type over any field are c₀(ℕ). Colmez, *Fonctions d'une variable p-adique* (author PDF), §I.1.2, Proposition I.1.5 and its proof, printed pp. 4–5: Over a discretely valued L every L-Banach space has orthonormal bases, characterised by reduction modulo the uniformiser.

### 0.C.2 Open mapping and controlled lifts for Banach spaces

`LocallyAnalyticDistributions:L0/banach-open-mapping-lifts` · Theorem.

Let f : V → W be a continuous K-linear surjection. (a) If V is Fréchet and W Hausdorff and barrelled (for instance Fréchet or Banach), f is open; a quotient of a Fréchet (Banach) space by a closed subspace is Fréchet (Banach) with the quotient seminorms (norm). (b) If V and W are K-Banach spaces there is C > 0 such that every w ∈ W has a preimage v with ‖v‖ ≤ C‖w‖ (controlled lift). (c) Consequently, if W ≅ c₀(X, K) with unit vectors e_x, there are v_x ∈ V with f(v_x) = e_x and sup_x ‖v_x‖ ≤ C, and s(Σ a_x e_x) = Σ a_x v_x is a continuous linear section of f. Over a nontrivially normed field, (a) for Banach spaces and (b) are Mathlib's ContinuousLinearMap.isOpenMap and ContinuousLinearMap.exists_preimage_norm_le, which make no archimedean assumption.

*Proof outline.*
1. (a) Schneider Proposition 8.3 (quotients) and Proposition 8.6 (open mapping, via the closed graph theorem, Proposition 8.5); for Banach spaces it is Mathlib's ContinuousLinearMap.isOpenMap.
2. (b) openness gives a ball of radius δ in the image of the unit ball; scaling by elements of K^× of absolute value comparable to ‖w‖ gives C = |π|^{-1}δ^{-1}, or directly Mathlib's ContinuousLinearMap.exists_preimage_norm_le.
3. (c) the family (v_x) is bounded, so the universal property of c₀(X) gives s; f∘s is the identity on unit vectors and hence on c₀(X) by continuity (Schneider, proof of Proposition 10.5).

*Acceptance.* For f : K² → K, (x, y) ↦ x + y, with the max norm, C = 1 works (lift w to (w, 0)). For the dense injection T(x)_n = p^n x_n of c₀(ℕ, ℚ_p), which is not surjective, no C exists on its image: the surjectivity hypothesis is needed.

*Needs:* Mathlib `ContinuousLinearMap.isOpenMap`; Mathlib `ContinuousLinearMap.exists_preimage_norm_le`; 0.C.1 `banach-c0-models`; 0.B.1 `strict-morphisms-quasi-abelian`.

*Sources:* Schneider, *Nonarchimedean Functional Analysis* (author notes), §8, Proposition 8.3, printed p. 53; Propositions 8.5–8.6, printed pp. 54–55; §10, universal property of c₀(X), printed pp. 66–67, and proof of Proposition 10.5, printed p. 71: Quotients of Fréchet and Banach spaces, the closed graph and open mapping theorems, and the bounded lift of unit vectors used to build a section. Colmez–Dospinescu–Nizioł (arXiv:1801.06686v2), §2.1.2, printed p. 9: The open mapping theorem for LF-spaces, and that a morphism of Fréchet spaces is strict iff its image is closed.

### 0.C.3 Complemented subspaces and split Banach extensions

`LocallyAnalyticDistributions:L0/banach-complemented-subspaces` · Theorem.

Let V be a K-Banach space and U ⊆ V a closed subspace. If (a) K is discretely valued, or (b) V/U is of countable type (for instance V of countable type), then U is complemented: there is a continuous projector P of V onto U, i.e. Mathlib's Submodule.ClosedComplemented U holds. Consequently a strict short exact sequence 0 → V_1 → V → V_2 → 0 of K-Banach spaces splits topologically under (a), or under (b) when V_2 is of countable type. In this roadmap K is a finite extension of ℚ_p, so (a) always applies. Colmez–Nizioł, Remark A.2 state the splitting when K is spherically complete or V_1, V_2 are separable; the spherically complete alternative is used here only through (a) (see source issue E103).

*Proof outline.*
1. V/U is Banach (banach-open-mapping-lifts (a)); by banach-c0-models it is isomorphic to c₀(X) in case (a) and to c₀(ℕ) in case (b).
2. Lift the unit vectors with bounded norms and build the section s (banach-open-mapping-lifts (c)); then P = id − s∘g∘pr is a continuous projector onto U, where g : V/U ≅ c₀(X) (Schneider Proposition 10.5).
3. A split strict sequence is isomorphic to V_1 ⊕ V_2, which is the conclusion of the splitting statement.

*API.*
- `TauCeti.NALocallyConvex.closedComplemented_of_isDiscretelyValued` (other): Over a discretely valued K every closed subspace of a K-Banach space is complemented (Submodule.ClosedComplemented).
- `TauCeti.NALocallyConvex.closedComplemented_of_countableType` (other): The same for a Banach space of countable type, a special case of (b).

*Acceptance.* Over ℚ_p (discretely valued) c₀(ℕ, ℚ_p) is complemented in ℓ^∞(ℕ, ℚ_p), unlike the real case, where c₀ is not complemented in ℓ^∞ (Phillips). The non-Banach exact sequence 0 → LC(ℤ_p) → LA(ℤ_p) → LA(ℤ_p) → 0 of spaces of compact type, with d/dx as second map, does not split (Kohlhaase, Corollary 4.3, recalled in Colmez–Nizioł Remark A.6): the Banach hypothesis is essential. For a finite-dimensional U the statement also follows from Hahn–Banach (Schneider Corollary 9.5).

*Needs:* 0.C.1 `banach-c0-models`; 0.C.2 `banach-open-mapping-lifts`; Mathlib `Submodule.ClosedComplemented`.

*Sources:* Schneider, *Nonarchimedean Functional Analysis* (author notes), §10, definition of complemented subspaces and Proposition 10.5, printed p. 71: Closed subspaces of Banach spaces are complemented when the field is discretely valued or the space is of countable type. Colmez–Nizioł, *The C_st-conjecture* (author PDF), Appendix A, Remark A.2, printed p. 58, and Remark A.6, printed p. 59: The splitting statement for Banach extensions, and the non-split compact-type example.

### 0.C.4 Compactoid sets and compact maps

`LocallyAnalyticDistributions:L0/compactoid-compact-maps` · Definition.

Let K be spherically complete and V, W Hausdorff locally convex. A subset B ⊆ V is compactoid if for every open lattice L there are v_1, …, v_m ∈ V with B ⊆ L + O_K v_1 + … + O_K v_m. An O_K-submodule A is c-compact if for every decreasingly filtered family of open lattices L_i the map A → lim← A/(L_i ∩ A) is surjective; for a bounded O_K-submodule, c-compact is equivalent to compactoid and complete. Compactoid submodules are bounded, and closures, submodules, finite sums and continuous linear images of compactoid submodules are compactoid. A continuous linear map f : V → W is compact if some open lattice L ⊆ V has f(L) contained in a bounded c-compact submodule (its closure is bounded and c-compact); if W is quasi-complete this means f(L) is compactoid. Compositions h∘f∘g with f compact are compact, and a compact map into a closed subspace stays compact there. Between Banach spaces f is compact iff its transpose f′ is compact iff f″ maps (V′_b)′ into W. When K is locally compact (finite over ℚ_p), a subset of a Banach space is compactoid iff it is totally bounded, so a continuous linear map between K-Banach spaces is compact in this sense iff it is a Mathlib IsCompactOperator.

*Hypotheses beyond the conventions.* K spherically complete (Schneider, Chapter III, works under this hypothesis); for the comparison with IsCompactOperator, K locally compact.

*Proof outline.*
1. Definitions and permanence: Schneider §12 (c-compact submodules, Lemma 12.1; compactoids, Lemma 12.4; Proposition 12.7 for the equivalence c-compact and bounded ⇔ compactoid and complete).
2. Compact maps: definition and Remark 16.3, Remark 16.7 (ideal property), Lemma 16.4 (duality for Banach spaces), Schneider §16.
3. Locally compact K: if B ⊆ L + O_K v_1 + … + O_K v_m with L an ε-ball, the compact set O_K v_1 + … + O_K v_m is covered by finitely many ε-balls, so B is totally bounded; conversely a finite ε-net lies in the O_K-span of finitely many vectors. A relatively compact image of a ball is then the Mathlib condition that the preimage of a compact set is a zero neighbourhood. This comparison is a direct argument, not a cited statement.

*API.*
- `TauCeti.NALocallyConvex.IsCompactoid` (constructor): B ⊆ V is compactoid: every zero neighbourhood U has finitely many v_i with B ⊆ U + {Σ a_i v_i : |a_i| ≤ 1}.
- `TauCeti.NALocallyConvex.IsCompactoid.isVonNBounded` (other): Compactoid sets are bounded.
- `TauCeti.NALocallyConvex.IsCompactoid.closure` (other): The closure of a compactoid set is compactoid.
- `TauCeti.NALocallyConvex.IsCompactoid.image` (functoriality): Continuous linear images of compactoid sets are compactoid.
- `TauCeti.NALocallyConvex.IsCompactoid.add` (other): Finite sums of compactoid sets are compactoid.
- `TauCeti.NALocallyConvex.IsCCompact` (constructor): c-compact O_K-submodules (surjectivity onto inverse limits of quotients by open lattices).
- `TauCeti.NALocallyConvex.isCCompact_iff_isCompactoid` (characterisation): A bounded O_K-submodule is c-compact iff it is compactoid and complete.
- `TauCeti.NALocallyConvex.IsNACompactMap` (constructor): f is compact: some zero neighbourhood has image contained in a bounded c-compact submodule.
- `TauCeti.NALocallyConvex.IsNACompactMap.comp` (relation): h∘f∘g is compact if f is.
- `TauCeti.NALocallyConvex.isNACompactMap_dual_iff` (characterisation): Between Banach spaces f is compact iff f′ is compact.
- `TauCeti.NALocallyConvex.isCompactoid_iff_totallyBounded` (compatibility): Over a locally compact K, a subset of a normed K-space is compactoid iff it is totally bounded.
- `TauCeti.NALocallyConvex.isNACompactMap_iff_isCompactOperator` (compatibility): Over a locally compact K, a continuous linear map between K-Banach spaces is compact iff it is a Mathlib IsCompactOperator.

*Unit tests.*
- `NALocallyConvexTests.compactoid_finiteDim` (degenerate): In K^n every bounded set is compactoid, and the identity of K^n is a compact map.
- `NALocallyConvexTests.compactoid_decay` (computation): {x ∈ c₀(ℕ, ℚ_p) : |x_n| ≤ p^{-n} for all n} is compactoid: modulo the ball of radius p^{-N} it lies in the O-span of e_0, …, e_{N−1}.
- `NALocallyConvexTests.not_compactoid_unitBall` (non-example): The unit ball of c₀(ℕ, ℚ_p) is bounded but not compactoid: modulo the ball of radius 1/p its image in the residue space is the infinite-dimensional 𝔽_p-space of finitely supported sequences.
- `NALocallyConvexTests.diagonal_compact` (computation): The diagonal operator x ↦ (p^n x_n) on c₀(ℕ, ℚ_p) is compact (it maps the unit ball into the compactoid set of the previous test), while the identity of c₀(ℕ, ℚ_p) is not.

*Uses.* This packet: compact-type-spaces: the transition maps of a compact-type presentation are injective compact maps; This packet: nuclear-spaces: nuclearity asks the canonical maps between completed lattice spaces to be compact; LocallyAnalyticDistributions:L0/radius-restriction-compact and this packet's relatively-compact-restriction: restriction to a smaller radius is a compact map.

*Acceptance.* The four unit tests below.

*Needs:* 0.A.1 `nonarchimedean-locally-convex-spaces`; 0.A.3 `bounded-sets-strong-dual`; 0.A.4 `spherically-complete-fields`; Mathlib `IsCompactOperator`.

*Sources:* Schneider, *Nonarchimedean Functional Analysis* (author notes), §12: definition of c-compact submodules and Lemma 12.1, printed p. 74; definition of compactoid submodules and Lemma 12.4, printed p. 77; Proposition 12.7, printed p. 79; Remark 12.8 and the Example after it, printed p. 81: c-compact and compactoid submodules and their permanence properties, the comparison c-compact and bounded ⇔ compactoid and complete, and the decaying-sequence example. Schneider, *Nonarchimedean Functional Analysis* (author notes), §16: definition of compact maps and Remarks 16.1–16.3, printed p. 97; Lemma 16.4, printed pp. 97–98; Remark 16.7, printed p. 102: Compact maps, their duality for Banach spaces and the ideal property. Schneider–Teitelbaum 1999 (arXiv:math/9912073v1), §1, Definition, printed p. 3: Compactoid sets, c-compact submodules, compact maps and spaces of compact type. Colmez–Gilles–Nizioł (arXiv:2308.07712v2), §2.1.5, Definition 2.2 and Lemma 2.3, printed p. 8: Compactoid sets, compact maps and spaces of compact type (c-compact submodules are not defined there), with the remark that for quasi-complete targets compactness means a compactoid image of a lattice.

### 0.C.5 Spaces of compact type

`LocallyAnalyticDistributions:L0/compact-type-spaces` · Definition. Planet: *Spaces of compact type*.

Let K be spherically complete. A locally convex K-vector space V is of compact type if it is isomorphic to the locally convex inductive limit of a sequence V_1 → V_2 → … of Hausdorff locally convex spaces with injective compact transition maps; one may take the V_n to be Banach spaces. Such a V is Hausdorff, complete, bornological and reflexive; it is regular: every bounded subset of V is the image of a bounded subset of some V_m; its strong dual V′_b is a Fréchet space and the natural map V′_b → lim← (V_n)′_b is a topological isomorphism. Closed subspaces U and the quotients V/U of a space of compact type are of compact type, and the dual sequence 0 → (V/U)′_b → V′_b → U′_b → 0 is algebraically exact with strict maps. Countable locally convex direct sums and finite products of spaces of compact type are of compact type. Spaces of compact type are nuclear, so their bounded subsets are compactoid. An infinite-dimensional Banach space is never of compact type (it is not reflexive).

*Hypotheses beyond the conventions.* K spherically complete.

*Proof outline.*
1. Hausdorff and regular: Schneider Lemma 16.9, by building open lattices inductively with Remark 16.8 so as to avoid a given vector, respectively a sequence escaping every stage.
2. Reflexive, bornological, complete, and the dual as a projective limit: Schneider Proposition 16.10 and Schneider–Teitelbaum Theorem 1.1.
3. Subspaces, quotients and the strict dual sequence: Schneider–Teitelbaum Proposition 1.2(i); direct sums: Proposition 1.2(ii).
4. Nuclearity: Schneider Proposition 19.9 (compact inductive limits are nuclear), and bounded = compactoid by Proposition 19.2.
5. Banach spaces: an infinite-dimensional Banach space over a spherically complete field is not reflexive (Schneider Proposition 11.1).

*API.*
- `TauCeti.NALocallyConvex.IsCompactType` (constructor): V is of compact type: it is isomorphic to the locally convex inductive limit of a sequence of Banach spaces with injective compact transition maps.
- `TauCeti.NALocallyConvex.CompactTypePresentation` (data): A chosen presentation (V_n, i_n) of a space of compact type by Banach stages.
- `TauCeti.NALocallyConvex.IsCompactType.t2Space` (other): Spaces of compact type are Hausdorff.
- `TauCeti.NALocallyConvex.IsCompactType.bounded_stage` (characterisation): Every bounded subset of V is the image of a bounded subset of some stage (regularity).
- `TauCeti.NALocallyConvex.IsCompactType.completeSpace` (other): Spaces of compact type are complete.
- `TauCeti.NALocallyConvex.IsCompactType.reflexive` (other): The duality map V → (V′_b)′_b is a topological isomorphism.
- `TauCeti.NALocallyConvex.IsCompactType.bornological` (other): Spaces of compact type are bornological.
- `TauCeti.NALocallyConvex.IsCompactType.strongDual_eq_lim` (equivalence): V′_b ≅ lim← (V_n)′_b topologically; in particular V′_b is Fréchet.
- `TauCeti.NALocallyConvex.IsCompactType.closedSubspace` (other): Closed subspaces of spaces of compact type are of compact type.
- `TauCeti.NALocallyConvex.IsCompactType.quotient` (other): Quotients of spaces of compact type by closed subspaces are of compact type.
- `TauCeti.NALocallyConvex.IsCompactType.dual_strictExact` (relation): For U ⊆ V closed, 0 → (V/U)′_b → V′_b → U′_b → 0 is exact with strict maps.
- `TauCeti.NALocallyConvex.IsCompactType.directSum` (other): Countable locally convex direct sums of spaces of compact type are of compact type.

*Unit tests.*
- `NALocallyConvexTests.compactType_finiteDim` (degenerate): K^n with the constant presentation is of compact type, and so is 0.
- `NALocallyConvexTests.compactType_directSum` (computation): K^(ℕ) = ⋃ K^n with the locally convex direct sum topology is of compact type (finite-dimensional stages, injective transitions, compact since finite rank); its strong dual is K^ℕ with the product topology.
- `NALocallyConvexTests.compactType_LA` (compatibility): LA(ℤ_p, K) = lim→ LA_h(ℤ_p, K) is of compact type, the restrictions LA_h → LA_{h+1} being injective and compact (relatively-compact-restriction).
- `NALocallyConvexTests.not_compactType_banach` (non-example): c₀(ℕ, K) is not of compact type: spaces of compact type are reflexive and an infinite-dimensional Banach space over a spherically complete field is not.
- `NALocallyConvexTests.compactType_unbounded_sequence` (non-example): In LA(ℤ_p, ℚ_p) the functions f_n = p^n·binom(x, p^{2n}) tend to 0 uniformly but are not bounded in any LA_h (their LA_h-norms grow, by Amice's basis), so by regularity {f_n} is not bounded in LA(ℤ_p, ℚ_p) and (f_n) does not converge there.

*Uses.* This packet: locally-analytic-function-space: C^an(X, K) for compact X is of compact type; This packet: compact-type-nuclear-duality: the anti-equivalence with nuclear Fréchet spaces; LocallyAnalyticDistributions:L0/compact-type-three-space: the outer terms of the extension theorem; Colmez–Gilles–Nizioł 2023, Remark 1.3(ii): for a Stein curve X, compactly supported pro-étale cohomology is of compact type.

*Acceptance.* The five unit tests below.

*Needs:* 0.C.4 `compactoid-compact-maps`; 0.A.2 `locally-convex-limits`; 0.A.3 `bounded-sets-strong-dual`; 0.A.5 `nonarchimedean-hahn-banach`.

*Sources:* Schneider–Teitelbaum 1999 (arXiv:math/9912073v1), §1: Definition, Theorem 1.1 and Proposition 1.2, printed p. 3: Spaces of compact type are Hausdorff, complete, bornological and reflexive with Fréchet strong dual equal to the projective limit of the stage duals; closed subspaces, quotients and countable direct sums; strictness of the dual sequence. Schneider, *Nonarchimedean Functional Analysis* (author notes), §16, Lemma 16.9, printed p. 103, Proposition 16.10, printed p. 104; Proposition 11.1, printed p. 72; Propositions 19.2 and 19.9, printed pp. 129–131: Hausdorffness and regularity of compact inductive limits, their reflexivity and duals, non-reflexivity of infinite-dimensional Banach spaces, and nuclearity. Colmez–Gilles–Nizioł (arXiv:2308.07712v2), §2.1.5, Definition 2.2(3) and the paragraph after Lemma 2.3, printed p. 8: The definition with Banach stages, and the summary of the properties. Emerton (arXiv:math/0405137v1), §1.1, Definition 1.1.16 and the paragraph after it, printed pp. 13–14; Theorem 1.1.17, printed p. 14, arXiv:math/0405137v1: Spaces of compact type are LB-spaces whose defining sequence can be taken of Banach spaces with injective compact transitions; a continuous surjection from a Hausdorff LF-space onto a Hausdorff space is strict iff the target is an LF-space.

### 0.C.6 Nuclear spaces

`LocallyAnalyticDistributions:L0/nuclear-spaces` · Definition.

Let K be spherically complete. For an open lattice L of a locally convex V let V̂_L be the Hausdorff completion of V for the gauge p_L (a K-Banach space); for open lattices M ⊆ L there is a canonical map V̂_M → V̂_L. V is nuclear if for every open lattice L there is an open lattice M ⊆ L with V̂_M → V̂_L compact; equivalently every continuous linear map from V to a K-Banach space is compact; equivalently (for the compactoid formulation) for every open lattice L there is an open lattice M ⊆ L such that M is compactoid modulo L: for every n there are finitely many v_i with M ⊆ π^n L + Σ O_K v_i. Finite-dimensional spaces and weak topologies are nuclear; a nuclear Banach space is finite-dimensional. In a nuclear space bounded and compactoid subsets coincide; quasi-complete nuclear spaces are semi-reflexive and nuclear Fréchet spaces are reflexive. Subspaces and quotients by closed subspaces of nuclear spaces are nuclear; arbitrary products and countable locally convex direct sums of nuclear spaces are nuclear; compact projective limits and compact inductive limits are nuclear; projective tensor products of nuclear spaces are nuclear. A Fréchet space is nuclear iff it is the projective limit of a sequence of Banach spaces with compact transition maps.

*Hypotheses beyond the conventions.* K spherically complete.

*Proof outline.*
1. Definition and the Banach case: Schneider §19, printed pp. 127–128.
2. Equivalent criterion: Proposition 19.5 (every map to a Banach space is compact).
3. Bounded = compactoid and reflexivity: Proposition 19.2 and Corollary 19.3.
4. Permanence: Proposition 19.4 (subspaces, quotients), Proposition 19.7 (products, countable sums), Proposition 19.9 (compact limits), Proposition 19.11 (projective tensor products, using Lemma 18.12 and Lemma 19.10).
5. Fréchet characterisation: a compact projective limit of Banach spaces is a reflexive Fréchet space (Corollary 16.6) and nuclear (Proposition 19.9); conversely for nuclear Fréchet V the spaces V̂_{L_n} for a decreasing basis of lattices with compact transitions present V.
6. The compactoid formulation is Colmez–Gilles–Nizioł Definition 2.4; for complete Banach targets compactness of V̂_M → V̂_L means the image of M is compactoid in V̂_L (Schneider Proposition 12.7).

*API.*
- `TauCeti.NALocallyConvex.IsNuclear` (constructor): V is nuclear: every open lattice L contains an open lattice M with V̂_M → V̂_L compact.
- `TauCeti.NALocallyConvex.isNuclear_iff_compact_to_banach` (characterisation): V is nuclear iff every continuous linear map from V to a K-Banach space is compact.
- `TauCeti.NALocallyConvex.isNuclear_iff_compactoid_lattice` (characterisation): V is nuclear iff every open lattice L contains an open lattice M that is compactoid modulo π^n L for every n.
- `TauCeti.NALocallyConvex.IsNuclear.isCompactoid_of_bounded` (characterisation): In a nuclear space bounded sets are compactoid.
- `TauCeti.NALocallyConvex.IsNuclear.reflexive_of_frechet` (other): Nuclear Fréchet spaces are reflexive.
- `TauCeti.NALocallyConvex.IsNuclear.subspace` (other): Subspaces of nuclear spaces are nuclear.
- `TauCeti.NALocallyConvex.IsNuclear.quotient` (other): Quotients by closed subspaces are nuclear.
- `TauCeti.NALocallyConvex.isNuclear_pi` (instance): Products of nuclear spaces are nuclear.
- `TauCeti.NALocallyConvex.isNuclear_directSum` (instance): Countable locally convex direct sums of nuclear spaces are nuclear.
- `TauCeti.NALocallyConvex.isNuclear_compactLimit` (other): Compact projective and inductive limits are nuclear.
- `TauCeti.NALocallyConvex.isNuclear_projectiveTensor` (other): V ⊗_π W is nuclear if V and W are.
- `TauCeti.NALocallyConvex.finiteDimensional_of_isNuclear_banach` (other): A nuclear Banach space is finite-dimensional.

*Unit tests.*
- `NALocallyConvexTests.nuclear_finiteDim` (degenerate): K^n is nuclear.
- `NALocallyConvexTests.nuclear_product` (computation): K^ℕ with the product topology is a nuclear Fréchet space: each continuous seminorm factors through finitely many coordinates, so every V̂_L is finite-dimensional.
- `NALocallyConvexTests.not_nuclear_c0` (non-example): c₀(ℕ, K) is not nuclear: its identity map to itself, a map to a Banach space, is not compact.
- `NALocallyConvexTests.nuclear_openDisc` (computation): The Fréchet space R⁺ of power series converging on the open unit disc, with the Gauss norms at radii r < 1, is nuclear: restriction from radius r′ to radius r < r′ is compact, with the monomial T^n scaled by (r/r′)^n.

*Uses.* This packet: compact-type-nuclear-duality: nuclear Fréchet spaces are exactly the strong duals of spaces of compact type; This packet: nuclear-three-space: nuclearity of the middle term of a strict extension; LocallyAnalyticDistributions:L1 (open-disc functions) and L3 (Mellin transform): D(ℤ_p, K) ≅ R⁺ is a nuclear Fréchet space.

*Acceptance.* The four unit tests below.

*Needs:* 0.C.4 `compactoid-compact-maps`; 0.A.2 `locally-convex-limits`; 0.B.4 `projective-tensor-product`.

*Sources:* Schneider, *Nonarchimedean Functional Analysis* (author notes), §19: definition of V̂_L and of nuclear spaces and the Banach case, printed pp. 127–128; Remark 19.1, printed p. 128; Propositions 19.2, 19.4 and Corollary 19.3, printed p. 129; Proposition 19.5, printed p. 130; Proposition 19.7, Corollary 19.8 and Proposition 19.9, printed p. 131; Lemma 19.10 and Proposition 19.11, printed pp. 132–133; Corollary 16.6, printed p. 102: Nuclear spaces and their permanence properties. Colmez–Gilles–Nizioł (arXiv:2308.07712v2), §2.1.5, Definition 2.4 and the paragraph after it, printed pp. 8–9: Nuclearity in terms of images of lattices modulo π^n L, and the list of permanence properties. Emerton (arXiv:math/0405137v1), §1.1, Proposition 1.1.28, printed p. 16, arXiv:math/0405137v1: Completed tensor products of nuclear Fréchet spaces are nuclear Fréchet.

### 0.C.7 Duality between spaces of compact type and nuclear Fréchet spaces

`LocallyAnalyticDistributions:L0/compact-type-nuclear-duality` · Theorem.

Let K be spherically complete. (i) A K-Fréchet space is the strong dual of a space of compact type iff it is nuclear. (ii) V ↦ V′_b is an anti-equivalence from the category of spaces of compact type to the category of nuclear Fréchet spaces, with quasi-inverse F ↦ F′_b; for spaces of compact type V and W the transpose L_b(V, W) → L_b(W′_b, V′_b) is a topological isomorphism. (iii) Both classes are reflexive; on them the strong dual coincides with the stereotype dual (uniform convergence on compactoid sets). (iv) For a projective system of Banach spaces (V_n) with compact transitions and dense projections, P : lim→ (V_n)′_b → (lim← V_n)′_b is a topological isomorphism and lim← V_n is a reflexive Fréchet space; dually, for a compact inductive system the map (lim→ V_n)′_b → lim← (V_n)′_b is a topological isomorphism.

*Hypotheses beyond the conventions.* K spherically complete.

*Proof outline.*
1. (i) Schneider–Teitelbaum Theorem 1.3, through Komatsu's and Gruson–van der Put's results; the compact-limit description of nuclear Fréchet spaces is in nuclear-spaces.
2. (ii) Applying the strong dual twice gives the identity by reflexivity, and the transpose is continuous with continuous inverse (Corollary 1.4).
3. (iii) Reflexivity: Schneider Proposition 16.10 and Corollary 19.3; stereotype duals: in reflexive (hence Montel) spaces bounded sets are compactoid (Colmez–Gilles–Nizioł Lemma 2.8).
4. (iv) Schneider Proposition 16.5 for projective systems (Hahn–Banach gives surjectivity of P, Lemma 16.4 reflexivity) and Proposition 16.10(iii) for inductive systems.

*Acceptance.* K^(ℕ) and K^ℕ are dual to each other. LA(ℤ_p, K) (compact type) and D(ℤ_p, K) (nuclear Fréchet, isomorphic to R⁺ through the Amice transform) are dual to each other, and LA(ℤ_p, K) is the strong dual of D(ℤ_p, K). c₀(ℕ, K) is neither of compact type nor nuclear, and is not reflexive: the hypotheses of the duality are needed.

*Needs:* 0.C.5 `compact-type-spaces`; 0.C.6 `nuclear-spaces`; 0.A.5 `nonarchimedean-hahn-banach`; 0.A.3 `bounded-sets-strong-dual`.

*Sources:* Schneider–Teitelbaum 1999 (arXiv:math/9912073v1), §1, Theorem 1.3 and Corollary 1.4, printed p. 4: A Fréchet space is the strong dual of a space of compact type iff it is nuclear; the anti-equivalence and the isomorphism L_b(V, W) ≅ L_b(W′_b, V′_b). Schneider, *Nonarchimedean Functional Analysis* (author notes), §16, Proposition 16.5, printed p. 100, Corollary 16.6, printed p. 102, Proposition 16.10, printed p. 104; Corollary 19.3, printed p. 129: Duality for compact projective and inductive limits; reflexivity. Colmez–Gilles–Nizioł (arXiv:2308.07712v2), §2.1.5, the anti-equivalence and Lemma 2.8, printed pp. 9–10: The anti-equivalence between C_{c,K} and C_{nF,K}, and the identification of strong and stereotype duals for these spaces.

### 0.C.8 Completed tensor products of spaces of compact type

`LocallyAnalyticDistributions:L0/compact-type-tensor-products` · Theorem.

Let K be spherically complete and V = lim→ V_n, W = lim→ W_n spaces of compact type presented by Banach spaces with injective compact transitions. Then (i) V ⊗_ι W = V ⊗_π W (inductive-tensor-product (c)) and the natural map lim→ (V_n ⊗̂ W_n) → V ⊗̂ W is a topological isomorphism; the transitions V_n ⊗̂ W_n → V_{n+1} ⊗̂ W_{n+1} are injective and compact, so V ⊗̂ W is of compact type; (ii) its strong dual is V′_b ⊗̂ W′_b, a nuclear Fréchet space. For nuclear Fréchet spaces F and G, F ⊗̂ G is nuclear Fréchet. These statements make no claim about tensor products of general LF-spaces.

*Hypotheses beyond the conventions.* K spherically complete.

*Proof outline.*
1. Lemma 1.1.30 of Emerton (tensor products commute with inductive limits) identifies the algebraic stage limit with V ⊗ W topologically; the completed stages are again an injective compact system (tensor products of compact maps are compact, Schneider Lemma 18.12), so their limit is of compact type and complete, and it is the completion of V ⊗ W (Emerton Proposition 1.1.32(i)).
2. Duality: Emerton Proposition 1.1.32(ii); nuclearity of the Fréchet tensor product: Emerton Proposition 1.1.28 and Schneider Proposition 19.11.
3. The diagonal choice of stages (V_n ⊗ W_n) is cofinal in the double system (V_m ⊗ W_n).

*Acceptance.* K^(ℕ) ⊗̂ K^(ℕ) = K^(ℕ×ℕ) (compact type), dual to K^ℕ ⊗̂ K^ℕ = K^{ℕ×ℕ}. For the analytic stages on ℤ_p and ℤ_p, the stage tensor products are c₀(ℕ²)-type spaces (c0-completed-tensor) and the limit is LA(ℤ_p², K) (locally-analytic-product). The pairing example of inductive-tensor-product shows that for a direct sum against a product the two tensor topologies differ, so compact type on both factors is used.

*Needs:* 0.B.5 `inductive-tensor-product`; 0.B.6 `c0-completed-tensor`; 0.C.5 `compact-type-spaces`; 0.C.7 `compact-type-nuclear-duality`; 0.C.6 `nuclear-spaces`.

*Sources:* Emerton (arXiv:math/0405137v1), §1.1, Proposition 1.1.28, printed p. 16; Lemma 1.1.30, Propositions 1.1.31–1.1.32, printed pp. 17–18, arXiv:math/0405137v1: Tensor products of nuclear Fréchet spaces and of spaces of compact type; the stage-limit description and the duality between them. Schneider, *Nonarchimedean Functional Analysis* (author notes), §18, Lemma 18.12, printed p. 126; Proposition 19.11, printed p. 133: Completed tensor products of compact maps between Banach spaces are compact; projective tensor products of nuclear spaces are nuclear.

### 0.C.9 Nuclearity of strict extensions

`LocallyAnalyticDistributions:L0/nuclear-three-space` · Theorem.

Let 0 → A → B → C → 0 be a strict short exact sequence of nonarchimedean locally convex K-spaces (A carries the topology induced from B and B → C is open and surjective). If A and C are nuclear, then B is nuclear. In particular a strict extension of nuclear Fréchet spaces is a nuclear Fréchet space (the Fréchet property being Colmez–Nizioł Proposition A.3). This is the nonarchimedean counterpart of Dierolf–Roelcke Proposition 3.8, which is proved for real and complex locally convex spaces by absolutely summable sequences; Colmez–Nizioł use it for nonarchimedean Fréchet spaces without comment (source issue E101). The proof below uses only lattices.

*Hypotheses beyond the conventions.* Nuclearity in the lattice form of nuclear-spaces (for every open lattice L there is an open lattice M ⊆ L with M compactoid modulo π^n L for all n); K spherically complete when this is compared with Schneider's definition.

*Proof outline.*
1. Let L be an open lattice of B. Since A is nuclear there is an open lattice M_A of A, M_A ⊆ L ∩ A, such that for every n there is a finite set F_n ⊆ A with M_A ⊆ π^n(L ∩ A) + O_K F_n. Because A carries the induced topology, there is an open lattice L′ ⊆ L of B with L′ ∩ A ⊆ M_A.
2. Since B → C is open, π_C(L′) is an open lattice of C; since C is nuclear there is an open lattice M_C ⊆ π_C(L′) such that for every n there is a finite set G_n ⊆ B with M_C ⊆ π^n π_C(L′) + O_K π_C(G_n).
3. Put M = L′ ∩ π_C^{-1}(M_C), an open lattice of B contained in L. Fix n and b ∈ M. Then π_C(b) = π^n π_C(l′) + Σ_g λ_g π_C(g) with l′ ∈ L′ and λ_g ∈ O_K, so a := b − π^n l′ − Σ_g λ_g g lies in A. Choose k_n ≥ 0 with G_n ⊆ π^{-k_n} L′ (a finite set is absorbed by a lattice); then a ∈ π^{-k_n} L′ ∩ A ⊆ π^{-k_n} M_A ⊆ π^n (L ∩ A) + O_K π^{-k_n} F_{n+k_n}.
4. Hence b ∈ π^n L + O_K G_n + O_K π^{-k_n} F_{n+k_n}, a finite O_K-span modulo π^n L, for every n: M is compactoid modulo L, and B is nuclear.
5. Fréchet case: B is Fréchet by Colmez–Nizioł Proposition A.3 (LocallyAnalyticDistributions:L0/frechet-three-space), and nuclear by the above.

*Acceptance.* A = K, C = c₀(ℕ, K): B = K ⊕ c₀ is not nuclear, consistent with C not being nuclear. The non-split strict sequence 0 → tR⁺ → R⁺ → R⁺/t → 0 of Colmez–Nizioł Remark A.6 has nuclear Fréchet terms throughout, as the theorem requires. For A finite-dimensional the statement is also Colmez–Gilles–Nizioł Lemma 2.5(2) (finite-rank-strict-splitting).

*Needs:* 0.C.6 `nuclear-spaces`; 0.B.1 `strict-morphisms-quasi-abelian`; `L0/frechet-three-space` (predecessor).

*Sources:* Dierolf–Roelcke 1981 (DML-E scan), Proposition 3.8 and its proof, printed p. 30 (Collect. Math. 32 (1981)): For real or complex locally convex spaces, nuclearity of a subspace and of the quotient implies nuclearity of the space; the proof lifts summable sequences through the quotient map. Colmez–Nizioł, *The C_st-conjecture* (author PDF), Appendix A, proof of Proposition A.4, printed p. 59: Nuclearity of the middle term of a strict extension of nuclear Fréchet spaces is asserted by citing Dierolf–Roelcke Proposition 3.8. Colmez–Gilles–Nizioł (arXiv:2308.07712v2), §2.1.5, Definition 2.4, printed p. 8: Nuclearity in terms of images of lattices modulo π^n L, the form used in the proof.

### 0.C.10 Strict extensions by finite-dimensional spaces split

`LocallyAnalyticDistributions:L0/finite-rank-strict-splitting` · Lemma.

Let K be spherically complete. (1) A strict short exact sequence 0 → V → W → W′ → 0 of locally convex K-spaces with V finite-dimensional and W′ Hausdorff splits topologically: W ≅ V ⊕ W′. Equivalently, every extension of a Hausdorff space by K in LH(NACvx K) is trivial (the separated Ext¹-vanishing used by Colmez–Nizioł for Proposition A.4). (2) Consequently, if W′ is nuclear Fréchet (respectively of compact type), so is W. (3) In a map of strict exact sequences of complete Hausdorff spaces from 0 → V → W → W′ → 0 to 0 → V_1 → W_1 → W′_1 → 0 with V, V_1 finite-dimensional and the second sequence split, compactness of the map on the quotients implies compactness of the map on the middle terms. (4) For any strict short exact sequence 0 → W_1 → W → W_2 → 0 the restriction W′ → W_1′ of continuous linear forms is surjective (Hahn–Banach), so the algebraic dual sequence 0 → W_2′ → W′ → W_1′ → 0 is exact.

*Hypotheses beyond the conventions.* K spherically complete.

*Proof outline.*
1. (1) Reduce to dim V = 1. W is Hausdorff; by Hahn–Banach there is a continuous linear form λ on W not vanishing on V. The map V ⊕ ker λ → W is a continuous bijection, and it is open: for an open lattice U of W and an open lattice V_0 of V, (U ∩ ker λ) + π^N V_0 is the preimage under λ of an open subset of K within U for N large (Colmez–Gilles–Nizioł, proof of Lemma 2.5).
2. (2) W ≅ V ⊕ W′ with V finite-dimensional, and finite products preserve nuclear Fréchet spaces and spaces of compact type.
3. (3) Colmez–Gilles–Nizioł Lemma 2.7: correct f_W by a section of the split bottom sequence and use compactoid images.
4. (4) Schneider Corollary 9.4 extends continuous forms from the subspace W_1; equivalently push the extension out along the form and split it by (1).

*Acceptance.* 0 → K → K ⊕ c₀ → c₀ → 0 splits, as (1) requires. For the strict sequence 0 → c_c(ℕ, K) → c₀(ℕ, K) → c₀/c_c → 0 the quotient is not Hausdorff and the subspace not finite-dimensional; (1) does not apply.

*Needs:* 0.A.5 `nonarchimedean-hahn-banach`; 0.B.3 `left-heart-classical-extensions`; 0.C.5 `compact-type-spaces`; 0.C.6 `nuclear-spaces`.

*Sources:* Colmez–Gilles–Nizioł (arXiv:2308.07712v2), §2.1.5, Lemma 2.5 and its proof, printed p. 9; Lemma 2.7, printed p. 9: Strict extensions of Hausdorff spaces by finite-rank spaces split, so nuclear Fréchet and compact type pass to them; compactness of maps between such extensions. Schneider, *Nonarchimedean Functional Analysis* (author notes), §9, Corollaries 9.3–9.5, printed pp. 59–60: Separation by continuous linear forms, extension from subspaces and complements of finite-dimensional subspaces. Colmez–Nizioł, *The C_st-conjecture* (author PDF), Appendix A, proof of Proposition A.4, printed p. 59: The vanishing of Ext¹(W_2, K) for separated W_2 is cited from this lemma.

### 0.C.11 Duality step for strict extensions of spaces of compact type

`LocallyAnalyticDistributions:L0/compact-type-extension-duality` · Lemma.

Let K be spherically complete and 0 → W_1 → W → W_2 → 0 a strict short exact sequence with W_1 and W_2 of compact type. (a) W is Hausdorff, W_1 is closed in W, the dual sequence 0 → (W_2)′ → W′ → (W_1)′ → 0 is algebraically exact, the transposes (W_2)′_b → W′_b and W′_b → (W_1)′_b are continuous, and the image of (W_2)′ is the annihilator of W_1, closed in W′_b. (b) Suppose (H1) the strong dual sequence 0 → (W_2)′_b → W′_b → (W_1)′_b → 0 is strictly exact. Then W′_b is a nuclear Fréchet space, its strong dual W″ = (W′_b)′_b is of compact type, and the double dual sequence 0 → W_1 → W″ → W_2 → 0 (through the duality isomorphisms W_i ≅ (W_i′_b)′_b) is strictly exact. (c) Suppose moreover (H2) the canonical map W → W″ is continuous (for instance W barrelled). Then W → W″ is a topological isomorphism and W is of compact type. Neither (H1) nor (H2) is established here for a general strict extension; both are recorded as the gap 'Strict duality for extensions of spaces of compact type'. Colmez–Nizioł's proof of Proposition A.4 uses them without proof (source issue E102).

*Hypotheses beyond the conventions.* K spherically complete.

*Proof outline.*
1. (a) Hausdorffness and closedness of W_1 are left-heart-classical-extensions; algebraic exactness is finite-rank-strict-splitting (4) together with the universal property of the quotient topology; continuity of transposes is bounded-sets-strong-dual; the annihilator of W_1 is closed in the weak topology, hence in the strong one.
2. (b) Under (H1), W′_b is a strict extension of the nuclear Fréchet spaces (W_1)′_b and (W_2)′_b, hence Fréchet (LocallyAnalyticDistributions:L0/frechet-three-space) and nuclear (nuclear-three-space); so W″ is of compact type (compact-type-nuclear-duality).
3. Double dual: the image U of (W_1′_b)′_b → W″ is the annihilator of (W_2)′_b, a closed subspace of the space of compact type W″; restriction W″ → (W_2′_b)′_b is surjective (Hahn–Banach) with kernel U, and it and the bijection (W_1′_b)′_b → U are open by the open mapping theorem for LF-spaces (Colmez–Dospinescu–Nizioł §2.1.2), since all four spaces are of compact type (Schneider–Teitelbaum Proposition 1.2(i) for U). With the duality isomorphisms this gives the strict sequence 0 → W_1 → W″ → W_2 → 0.
4. (c) Under (H2) the canonical map W → W″ is a morphism of strict extensions inducing the identity on W_1 and W_2; by the five lemma in LH(NACvx K) it is an isomorphism there, hence (left-heart-classical-extensions) a topological isomorphism, and W is of compact type.

*Acceptance.* If W = W_1 ⊕ W_2 topologically, (H1) and (H2) hold and W is of compact type by compact-type-spaces (finite direct sums). If W_1 is finite-dimensional, finite-rank-strict-splitting gives the conclusion without (H1) or (H2).

*Needs:* 0.C.7 `compact-type-nuclear-duality`; 0.C.9 `nuclear-three-space`; 0.C.10 `finite-rank-strict-splitting`; 0.B.3 `left-heart-classical-extensions`; 0.A.3 `bounded-sets-strong-dual`; `L0/frechet-three-space` (predecessor).

*Sources:* Colmez–Nizioł, *The C_st-conjecture* (author PDF), Appendix A, Proposition A.4 and its proof, printed pp. 58–59: The compact-type extension theorem, proved by passing to stereotype duals, using Proposition A.3 and nuclearity of the dual middle term, and dualising back with the five lemma in LH(C_K). Schneider–Teitelbaum 1999 (arXiv:math/9912073v1), §1, Proposition 1.2(i), printed p. 3: Closed subspaces of spaces of compact type are of compact type, with strict dual sequence. Colmez–Dospinescu–Nizioł (arXiv:1801.06686v2), §2.1.2, printed p. 9: Open mapping theorem for continuous surjections between LF-spaces. Emerton (arXiv:math/0405137v1), §1.1, Theorem 1.1.17, printed p. 14, arXiv:math/0405137v1: A continuous surjection from a Hausdorff LF-space onto a Hausdorff LF-space is strict. Colmez–Gilles–Nizioł (arXiv:2308.07712v2), §2.1.5, Lemma 2.8, printed p. 10: Strong and stereotype duals agree for spaces of compact type and nuclear Fréchet spaces.

## 0.D. Charts, indices and locally analytic functions on manifolds

The predecessor plan gives the one-variable spaces LA_h(ℤ_p, L) and a coefficient model c₀(S × ℕ^d) for finitely many polydiscs. The targets below give the chart-level carriers: power series on a closed polydisc with Banach coefficients, the substitution bound and compact restriction, analytic atlases (compared with Mathlib's analytic manifolds), indices and their Banach stages, the space C^an(M, E) as an inductive limit that depends only on the manifold, pullbacks and multiplications as maps of functions, products, and distributions on compact manifolds.

### 0.D.1 Power series converging on a closed polydisc

`LocallyAnalyticDistributions:L0/restricted-power-series-ball` · Construction.

For ε > 0, r ∈ ℕ and a K-Banach space V, F_ε(K^r; V) is the space of formal power series f = Σ_α X^α v_α (α ∈ ℕ^r, v_α ∈ V) with ε^{|α|}‖v_α‖ → 0 along the cofinite filter, normed by ‖f‖_ε = max_α ε^{|α|}‖v_α‖. It is a K-Banach space whose limits are computed coefficientwise, and for ε = |c| with c ∈ K^× the map (a_α) ↦ Σ a_α c^{−|α|} X^α is an isometry c₀(ℕ^r, K) ≅ F_ε(K^r; K). Evaluation f ↦ f̃(x) = Σ x^α v_α at x in the closed polydisc B_ε(0) ⊆ K^r (max norm) is continuous of norm ≤ 1. A continuous bilinear map V_1 × V_2 → V induces a continuous bilinear Cauchy product F_ε(K^r; V_1) × F_ε(K^r; V_2) → F_ε(K^r; V) compatible with evaluation; F_ε(K^r; K) is a commutative K-algebra with multiplicative norm ‖fg‖_ε = ‖f‖_ε‖g‖_ε. Re-expanding f at another point y ∈ B_ε(0) gives a series in F_ε(K^r; V) with the same norm and the same function on the ball. In characteristic 0 the identity theorem holds: f̃ determines f, so F_ε(K^r; V) is a space of functions on B_ε(0). For V = K this is Mathlib's MvPowerSeries.IsRestricted at the constant radius ε, and ‖f‖_ε is Mathlib's MvPowerSeries.gaussNorm with the absolute value and the constant radius ε. In one variable, re-centred at a, this is the space An(B(a, s), L) of LocallyAnalyticDistributions:L0/disc-analytic-functions for ε = p^{−s}.

*Hypotheses beyond the conventions.* For the identity theorem, K has characteristic 0.

*Proof outline.*
1. Banach property and coefficientwise limits: Schneider, p-Adic Lie Groups §5, printed pp. 25–26, identifying F_ε with a weighted c₀ space; the norm depends only on the topology of V (Remark after the definition).
2. Evaluation: Remark 5.1 bounds |f̃(x)| by ‖f‖_ε for x ∈ B_ε(0).
3. Cauchy products and multiplicativity: Proposition 5.2 and Proposition 5.3 (the lexicographically minimal multi-indices attaining the two norms give a coefficient of the product attaining the product norm).
4. Change of centre: Corollary 5.5; identity theorem: Corollary 5.8.
5. Mathlib: with c = (fun _ ↦ ε), t.prod (c · ^ ·) = ε^{|t|}, so MvPowerSeries.IsRestricted c f is the decay condition and gaussNorm is ‖f‖_ε.

*API.*
- `TauCeti.LocallyAnalytic.restrictedBall` (constructor): F_ε(K^r; V): power series in r variables with coefficients in V and ε^{|α|}‖v_α‖ → 0, with the norm max_α ε^{|α|}‖v_α‖.
- `TauCeti.LocallyAnalytic.gaussNormBall` (data): ‖f‖_ε as Mathlib's MvPowerSeries.gaussNorm with the absolute value and the constant radius ε.
- `TauCeti.LocallyAnalytic.mul_mem_restrictedBall` (structure): F_ε(K^r; K) is closed under multiplication.
- `TauCeti.LocallyAnalytic.restrictedBall_norm_eq` (simp): ‖f‖_ε = max_α ε^{|α|}‖v_α‖; for V = K it equals MvPowerSeries.gaussNorm ‖·‖ (fun _ ↦ ε) f.
- `TauCeti.LocallyAnalytic.restrictedBall_iff_isRestricted` (compatibility): For V = K, f ∈ F_ε(K^r; K) iff MvPowerSeries.IsRestricted (fun _ ↦ ε) f.
- `TauCeti.LocallyAnalytic.restrictedBall_c0Equiv` (equivalence): For ε = |c|, c ∈ K^×, F_ε(K^r; K) ≅ c₀(ℕ^r, K) isometrically, a_α ↦ a_α c^{−|α|} X^α.
- `TauCeti.LocallyAnalytic.restrictedBall_eval` (data): Evaluation at x ∈ B_ε(0), continuous linear of norm ≤ 1.
- `TauCeti.LocallyAnalytic.restrictedBall_eval_injective` (characterisation): In characteristic 0, f ↦ f̃ is injective (identity theorem).
- `TauCeti.LocallyAnalytic.restrictedBall_norm_mul` (relation): ‖fg‖_ε = ‖f‖_ε ‖g‖_ε for scalar-valued f, g, and (fg)~ = f̃ g̃.
- `TauCeti.LocallyAnalytic.restrictedBall_reexpand` (other): For y ∈ B_ε(0) the re-expansion of f at y lies in F_ε(K^r; V), has the same norm and the same function.

*Unit tests.*
- `LocallyAnalyticTests.restrictedBall_monomial` (computation): ‖X^α‖_ε = ε^{|α|}; for ε = 1/p and α = (2, 1), ‖X_1² X_2‖_ε = p^{−3}.
- `LocallyAnalyticTests.restrictedBall_geometric` (non-example): Σ_n X^n is not in F_1(K; K), but it is in F_ε(K; K) for every ε < 1, so the closed disc of radius 1 is not covered by the open-disc series.
- `LocallyAnalyticTests.restrictedBall_sup_not_K_points` (non-example): For f = X^p − X in F_1(ℚ_p; ℚ_p), ‖f‖_1 = 1 while |f̃(x)| ≤ 1/p for every x ∈ ℤ_p: the norm is not the supremum over K-points (it is over ℂ_p-points), so a definition by sup over B_ε(0) ∩ K^r is wrong.
- `LocallyAnalyticTests.restrictedBall_mul` (computation): ‖(1 + pX)·X‖_1 = ‖1 + pX‖_1·‖X‖_1 = 1, and ‖(X − 1)²‖_1 = 1, as multiplicativity requires.
- `LocallyAnalyticTests.restrictedBall_zero_vars` (degenerate): For r = 0, F_ε(K^0; V) = V with its norm.

*Uses.* This packet: chart-index-banach-stages: the Banach stage attached to a chart of radius ε is F_ε(K^m; E) transported by the chart; LocallyAnalyticDistributions:L0/multivariable-fixed-radius: its coefficient model c₀(S × ℕ^d) is the product over charts of these spaces in normalised coordinates; LocallyAnalyticDistributions:L4/affinoid-analytic-stage: coefficients in an affinoid Banach algebra.

*Acceptance.* The five unit tests below.

*Needs:* Mathlib `MvPowerSeries.IsRestricted`; Mathlib `MvPowerSeries.gaussNorm`; Mathlib `ZeroAtInftyContinuousMap`; `L0/disc-analytic-functions` (predecessor).

*Sources:* Schneider, *p-Adic Lie Groups* (cleared library copy), §5: definition of F_ε(K^r; V), printed pp. 25–26; Remark 5.1 and Proposition 5.2, printed pp. 27–28; Proposition 5.3, printed pp. 28–29; Corollary 5.5, printed p. 31; Corollary 5.8, printed p. 33: Power series converging on a closed polydisc with values in a Banach space, evaluation, Cauchy products, multiplicativity of the norm, change of centre and the identity theorem (cleared copy in the maintainer's library). Schneider–Teitelbaum 1999 (arXiv:math/9912073v1), §2, the Banach algebra O(φ_i(D_i)) and the identification F_φ(V) ≅ O(φ(D)) ⊗̂ V, printed p. 6: Functions on an affinoid ball with values in a BH-space as completed tensor products. Colmez, *Fonctions d'une variable p-adique* (author PDF), §I.4.1, Propositions I.4.2–I.4.3, printed pp. 13–14: The one-variable case with Gauss valuation, multiplicativity and the maximum principle.

### 0.D.2 Substitution of power series on polydiscs

`LocallyAnalyticDistributions:L0/multivariate-substitution-bound` · Theorem.

Let g = (g_1, …, g_n) ∈ F_δ(K^r; K^n) with ‖g‖_δ = max_i ‖g_i‖_δ ≤ ε. Then for every K-Banach space V the substitution f(Y) = Σ_β Y^β v_β ↦ f∘g(X) = Σ_β g(X)^β v_β is a well-defined continuous linear map F_ε(K^n; V) → F_δ(K^r; V) of operator norm ≤ 1, and (f∘g)~(x) = f̃(g̃(x)) for x ∈ B_δ(0). The constant term of g need not vanish: the hypothesis says that g maps B_δ(0) into B_ε(0) with norm control. Special cases: restriction from radius ε to a radius δ ≤ ε (g = X), translation to a centre y ∈ B_ε(0), and the affine changes of variable x ↦ a + cx of residue-ball charts; the norm bound gives the refinement inclusions of chart indices and the stagewise pullback of locally analytic maps. Mathlib's MvPowerSeries.subst requires substituted series with nilpotent constant coefficients and does not cover this case.

*Proof outline.*
1. Proposition 5.3 gives ‖g^β‖_δ = Π ‖g_i‖_δ^{β_i} ≤ ε^{|β|}, so Σ_β g^β v_β converges in F_δ(K^r; V) with ‖f∘g‖_δ ≤ max_β ε^{|β|}‖v_β‖ = ‖f‖_ε (Schneider, p-Adic Lie Groups, Proposition 5.4).
2. Evaluation is continuous (Remark 5.1) and multiplicative, so (f∘g)~ = f̃∘g̃ on B_δ(0).
3. The radius-restriction and change-of-centre cases are g = X with δ ≤ ε and g = X + y (Corollary 5.5).

*Acceptance.* stagePullback_affine: over ℤ_3, with f(y) = y² in F_1 and g(x) = 1 + 3x (‖g‖_1 = 1), f∘g = 1 + 6x + 9x², of norm 1; the constant and both nonconstant coefficients are retained. The norm hypothesis is needed: for g(x) = x/p (‖g‖_1 = p) and f(y) = Σ_n p^n y^n ∈ F_1, the composite Σ_n x^n is not in F_1. For g = X and δ < ε the map is the restriction, of norm ≤ 1, compact by relatively-compact-restriction.

*Needs:* 0.D.1 `restricted-power-series-ball`.

*Sources:* Schneider, *p-Adic Lie Groups* (cleared library copy), §5, Proposition 5.4 and its proof, printed pp. 29–30; Corollary 5.5, printed p. 31: Substitution F_ε(K^n; V) → F_δ(K^r; V) along g with ‖g‖_δ ≤ ε has operator norm at most 1 and is compatible with evaluation; change of centre. Schneider–Teitelbaum 1999 (arXiv:math/9912073v1), §2, printed pp. 5–6: Charts with affinoid-ball images and their transition maps underlie the index construction.

### 0.D.3 Restriction to smaller polydiscs is compact

`LocallyAnalyticDistributions:L0/relatively-compact-restriction` · Lemma.

Let 0 < δ < ε. The restriction map F_ε(K^m; K) → F_δ(K^m; K) (same centre) satisfies ‖f − T_N f‖_δ ≤ (δ/ε)^N ‖f‖_ε, where T_N f is the truncation of f to total degree < N; hence it is a compact map, the image of the unit ball being compactoid. Consequently, if a finite index I of a compact manifold is a relatively compact refinement of a finite index J (every ball of I has radius strictly smaller than a ball of J containing it, after re-centring), the inclusion F_J(K) → F_I(K) is injective and compact; more generally a relatively compact morphism of affinoid rigid spaces induces a compact map on Banach spaces of analytic functions. In particular LA_h(ℤ_p, K) → LA_{h+1}(ℤ_p, K) is injective and compact.

*Proof outline.*
1. Truncation estimate: a coefficient v_α with |α| ≥ N contributes δ^{|α|}‖v_α‖ ≤ (δ/ε)^{|α|} ε^{|α|}‖v_α‖ ≤ (δ/ε)^N ‖f‖_ε.
2. The image of the unit ball therefore lies, modulo the ball of radius (δ/ε)^N, in the bounded set of polynomials of degree < N with coefficients bounded by ε^{−|α|}, which is contained in a finitely generated O_K-module: the image is compactoid (compactoid-compact-maps).
3. Re-centring at a point of the smaller ball preserves norms (Corollary 5.5 of Schneider's p-Adic Lie Groups), so the same bound holds for balls inside balls; a finite product of compact maps is compact.
4. Injectivity: the identity theorem on the smaller ball (restricted-power-series-ball). The affinoid formulation is Emerton Proposition 2.1.16.

*Acceptance.* For m = 1, ε = 1 and δ = 1/p the unit vectors X^n have images of norm p^{−n} → 0: the restriction is a compact diagonal operator. For δ = ε the restriction is the identity of an infinite-dimensional Banach space, which is not compact: strict inequality of radii is needed. This gives the compactness input of LocallyAnalyticDistributions:L0/radius-restriction-compact with the explicit constant 1 in normalised coordinates.

*Needs:* 0.D.1 `restricted-power-series-ball`; 0.C.4 `compactoid-compact-maps`.

*Sources:* Emerton (arXiv:math/0405137v1), §2.1, Definition 2.1.15 and Proposition 2.1.16, printed p. 31, arXiv:math/0405137v1: A relatively compact morphism of affinoid rigid spaces induces a compact map between the Banach spaces of analytic functions. Schneider, *p-Adic Lie Groups* (cleared library copy), §5, Corollary 5.5, printed p. 31: Re-expansion at another point of the ball preserves the norm. Schneider, *Nonarchimedean Functional Analysis* (author notes), §12, Remark 12.8 and the Example after it, printed p. 81: Sets of sequences with geometrically decaying coefficients are compactoid.

### 0.D.4 Locally analytic manifolds, charts and atlases

`LocallyAnalyticDistributions:L0/analytic-manifold-atlases` · Definition.

Let M be a Hausdorff topological space. An n-dimensional chart for M is a triple (U, φ, K^n) with U ⊆ M open and φ : U → K^n a homeomorphism onto an open subset. Two charts are compatible if both transition maps φ_2∘φ_1^{-1} and φ_1∘φ_2^{-1} are locally analytic on their domains (locally given by convergent power series); compatible charts with intersecting domains have the same dimension. An atlas is a family of pairwise compatible charts covering M; atlases are equivalent if their union is an atlas; each equivalence class has a unique maximal atlas, and a (locally K-analytic) manifold is M with a maximal atlas. A map between manifolds is locally analytic if it is so in charts; open subsets and finite products of manifolds are manifolds. M is paracompact iff it is strictly paracompact (every open covering is refined by a covering by pairwise disjoint open subsets), and then it is a disjoint union of open subsets each of which is the domain of a chart whose image is a closed ball; in particular every compact manifold is, for every open covering, a finite disjoint union of chart domains with ball images refining it. Over a finite extension F of ℚ_p the ring O_F is a manifold over F of dimension 1 and, by restriction of scalars through a ℤ_p-basis, a manifold over ℚ_p of dimension [F : ℚ_p] (LocallyAnalyticDistributions:L0/field-analytic-functions compares the two). A K-analytic manifold structure of dimension n on M amounts to a Mathlib ChartedSpace (Fin n → K) M with HasGroupoid for contDiffGroupoid ω, where ω-smoothness is analyticity because K^n is complete; Mathlib's IsManifold 𝓘(K, Fin n → K) ω M is then the same notion.

*Proof outline.*
1. Compatibility and dimension: Schneider, p-Adic Lie Groups, Lemma 7.1 (by the chain rule the derivatives of the two transition maps are inverse linear maps, so the dimensions agree); equivalence of atlases and maximal atlases: Remark 7.2 and Lemma 7.3; refinements of atlases: Remark 7.4.
2. Manifolds and maps: §8, Remark 8.1 (restriction of charts), Lemmas 8.3–8.4 (locally analytic maps and composition); open submanifolds and products are manifolds, and they are paracompact when M is (Corollary 8.8).
3. Paracompactness: Remark 8.6 (ultrametric spaces are strictly paracompact, compact spaces paracompact) and Proposition 8.7 (paracompact ⇔ strictly paracompact ⇔ the topology is given by a metric with the strict triangle inequality); a strictly paracompact manifold is a disjoint union of chart domains with ball images, by refining a chart covering by disjoint balls (Lemma 1.4) and restricting charts (Remark 8.1); compact manifolds are strictly paracompact (Schneider–Teitelbaum §2, printed p. 5).
4. Mathlib: a chart in this sense is a PartialHomeomorph with open source and target; the analytic groupoid condition is contDiffGroupoid ω (Mathlib.Geometry.Manifold.IsManifold.Basic), and for maps between open subsets of complete spaces ContDiffOn ω is analyticity (the ω-case of ContDiffWithinAt).

*API.*
- `TauCeti.LocallyAnalytic.AnalyticChart` (constructor): A chart (U, φ, K^n): U open, φ a homeomorphism of U onto an open subset of K^n.
- `TauCeti.LocallyAnalytic.AnalyticChart.Compatible` (characterisation): Two charts are compatible iff their transition maps are locally analytic in both directions; compatible charts with meeting domains have equal dimension.
- `TauCeti.LocallyAnalytic.AnalyticAtlas` (structure): A covering family of pairwise compatible charts; equivalence of atlases; the maximal atlas of an atlas.
- `TauCeti.LocallyAnalytic.AnalyticManifold` (constructor): A Hausdorff space with a maximal analytic atlas.
- `TauCeti.LocallyAnalytic.LocallyAnalyticMap` (constructor): Maps that are locally analytic in charts; closed under composition, with identities.
- `TauCeti.LocallyAnalytic.AnalyticManifold.prod` (instance): Products of manifolds are manifolds, with product charts.
- `TauCeti.LocallyAnalytic.AnalyticManifold.exists_finite_ball_partition` (characterisation): A compact manifold has, refining any open covering, a finite partition into chart domains with closed-ball images.
- `TauCeti.LocallyAnalytic.analyticManifold_iff_isManifold` (compatibility): An n-dimensional analytic manifold structure is the same as ChartedSpace (Fin n → K) M with IsManifold 𝓘(K, Fin n → K) ω M.

*Unit tests.*
- `LocallyAnalyticTests.atlas_Zp_balls` (computation): On ℤ_p the charts (a + p^hℤ_p, x ↦ x), a ∈ {0, …, p^h − 1}, form an atlas equivalent to the single chart (ℤ_p, id), for every h.
- `LocallyAnalyticTests.chart_square` (non-example): For p odd, x ↦ x² is locally analytic on ℤ_p but is not a chart on any neighbourhood of 0 (it is not injective there); on 1 + pℤ_p it is a chart compatible with the identity, by local invertibility (derivative 2x a unit).
- `LocallyAnalyticTests.atlas_OF` (computation): For F/ℚ_p unramified quadratic with ℤ_p-basis (1, u) of O_F, the chart O_F → ℤ_p², a + bu ↦ (a, b), makes O_F a ℚ_p-manifold of dimension 2 = [F : ℚ_p].
- `LocallyAnalyticTests.atlas_empty_point` (degenerate): The empty space and a point (dimension 0, chart to K^0) are manifolds, and their maximal atlases are unique.

*Uses.* This packet: chart-index-banach-stages and locally-analytic-function-space: indices are families of charts of a manifold; the function space depends only on the maximal atlas; LocallyAnalyticDistributions:L0/compact-uniform-radius, analytic-chart-pullback and chart-independence: compact manifolds through finite chart systems, pullback along analytic maps and independence of the atlas; Schneider–Teitelbaum 1999, §2, printed pp. 5–7: C^an(M, V) and D(M, K) for locally L-analytic manifolds.

*Acceptance.* The four unit tests below.

*Needs:* Mathlib `ChartedSpace`; Mathlib `contDiffGroupoid`; Mathlib `IsManifold`; 0.D.1 `restricted-power-series-ball`.

*Sources:* Schneider, *p-Adic Lie Groups* (cleared library copy), §7, Lemma 7.1, printed p. 45, Remark 7.2 and Lemma 7.3, printed p. 46, Remark 7.4, printed p. 47; §8, Remark 8.1, printed p. 47, Lemmas 8.3–8.4, printed p. 50, Remark 8.6 and Proposition 8.7, printed pp. 51–55, Corollary 8.8, printed p. 56; §1, Lemma 1.4; Proposition 6.4, printed pp. 42–43 (for the chart_square test): Charts, compatibility, atlases, maximal atlases, manifolds, locally analytic maps, products, and the characterisation of paracompact manifolds as the strictly paracompact ones (cleared copy in the maintainer's library). Schneider–Teitelbaum 1999 (arXiv:math/9912073v1), §2, printed p. 5: Strictly paracompact locally L-analytic manifolds, with compact manifolds as the main example.

### 0.D.5 Indices and their Banach stages

`LocallyAnalyticDistributions:L0/chart-index-banach-stages` · Construction.

Let M be a paracompact manifold and E a K-Banach space. For a chart c = (U, φ, K^m) and ε > 0 with φ(U) = B_ε(a) a closed ball, F_{(c,ε)}(E) is the space of functions f : U → E such that f∘φ^{-1}(x) = F(x − a) for some F ∈ F_ε(K^m; E), with ‖f‖ = ‖F‖_ε; it is a Banach space, independent of the centre a. An index I = {(c_i, ε_i)}_{i∈I} is a family of such charts whose domains U_i are pairwise disjoint and cover M; its stage is F_I(E) = Π_i F_{(c_i,ε_i)}(E) ⊆ C^an(M, E) with the product topology (a Banach space iff I is finite, which is automatic for compact M). An index I is finer than J if every U_i lies in some V_j with ψ_j∘φ_i^{-1}(x) = F_{ij}(x − a_i) and ‖F_{ij} − F_{ij}(0)‖_{ε_i} ≤ δ_j; then F_J(E) ⊆ F_I(E) and the inclusion is continuous, of norm ≤ 1 factorwise; any two indices have a common finer index; and the topology of F_J(E) is in general strictly finer than the one induced from F_I(E). For M = ℤ_p and the index I_h of residue balls a + p^hℤ_p with the identity charts and radius p^{−h}, F_{I_h}(K) = LA_h(ℤ_p, K) isometrically; the coefficient model of a finite index with normalised coordinates is c₀(S × ℕ^d, K) as in LocallyAnalyticDistributions:L0/multivariable-fixed-radius.

*Hypotheses beyond the conventions.* M paracompact (strictly paracompact), E a K-Banach space; ST99 use V-indices with BH-subspaces V_i ⊆ V for a general Hausdorff locally convex V.

*Proof outline.*
1. Banach stages and independence of the centre: Schneider, p-Adic Lie Groups §10, using the identity theorem and Corollary 5.5.
2. Refinement: Lemma 10.1 (F_J ⊆ F_I, by substituting the transition expansions with Proposition 5.4), Lemma 10.2 (common refinement: cover the chart overlaps by small disjoint balls on which the transition maps expand, then shrink radii so that the transition norms are ≤ δ_j), Lemma 10.3 (continuity of the inclusion, of norm ≤ 1 by Proposition 5.4), and the remark after it (the topologies differ).
3. Schneider–Teitelbaum describe the same stages through V-indices {(D_i, φ_i, V_i)} with F_{φ_i}(V_i) ≅ O(φ_i(D_i)) ⊗̂ V_i (§2, printed pp. 5–6).
4. Comparison with LA_h: on a + p^hℤ_p the identity chart has image B_{p^{−h}}(a), and F_{p^{−h}}(K; K) at centre a is the space An(B(a, h), K) of the predecessor, with the same Gauss norm.

*API.*
- `TauCeti.LocallyAnalytic.AnalyticIndex` (constructor): A family of charts with ball images and radii whose domains partition M.
- `TauCeti.LocallyAnalytic.indexStage` (constructor): F_I(E) = Π_i F_{(c_i,ε_i)}(E) with the product topology, as a subspace of the E-valued functions on M.
- `TauCeti.LocallyAnalytic.indexStage_eval` (data): Each element of F_I(E) is a function M → E; evaluation at a point is continuous.
- `TauCeti.LocallyAnalytic.indexStage_isBanach` (other): For a finite index F_I(E) is a Banach space with the max of the chart norms.
- `TauCeti.LocallyAnalytic.AnalyticIndex.Finer` (structure): The refinement preorder on indices.
- `TauCeti.LocallyAnalytic.indexStage_mono` (relation): If I is finer than J then F_J(E) ⊆ F_I(E), with continuous inclusion of norm ≤ 1.
- `TauCeti.LocallyAnalytic.exists_common_refinement` (other): Any two indices have a common finer index; for compact M it can be taken finite.
- `TauCeti.LocallyAnalytic.indexStage_Zp_eq_LAh` (compatibility): For M = ℤ_p and the residue-ball index of level h, F_{I_h}(K) = LA_h(ℤ_p, K) isometrically.

*Unit tests.*
- `LocallyAnalyticTests.indexStage_Zp` (compatibility): For M = ℤ_p and the level-h residue-ball index, the indicator of a + p^hℤ_p lies in F_{I_h}(K) with norm 1, and the function equal to x on p^hℤ_p and 0 elsewhere has norm p^{−h}, the Gauss norm of the coordinate on that ball, matching LA_h.
- `LocallyAnalyticTests.indexStage_point_empty` (degenerate): For M a point, F_I(E) = E; for M empty, F_I(E) = 0.
- `LocallyAnalyticTests.indexStage_not_embedding` (non-example): The inclusion LA_0(ℤ_p, ℚ_p) → LA_1(ℤ_p, ℚ_p) is not a topological embedding: f_n = (x^p − x)^n has LA_0-norm 1 for all n but LA_1-norm at most p^{−n}, since on each a + pℤ_p the expansion of x^p − x at a has coefficients of size ≤ 1/p after the radius weight.
- `LocallyAnalyticTests.indexStage_refinement_norm` (computation): For I finer than J the inclusion F_J(E) → F_I(E) has norm ≤ 1 on each factor, and for the identity index refinement ℤ_p ⊇ a + pℤ_p the function x maps to the family x|_{a+pℤ_p} with the same norm 1.

*Uses.* This packet: locally-analytic-function-space: C^an(M, E) is the locally convex inductive limit of the stages F_I(E); LocallyAnalyticDistributions:L0/multivariable-fixed-radius and compact-uniform-radius: the finite-chart stages of compact manifolds and the existence of a common stage; LocallyAnalyticDistributions:L4/affinoid-analytic-stage: stages with coefficients in an affinoid Banach algebra.

*Acceptance.* The four unit tests below.

*Needs:* 0.D.1 `restricted-power-series-ball`; 0.D.2 `multivariate-substitution-bound`; 0.D.4 `analytic-manifold-atlases`; `L0/locally-analytic-radius` (predecessor).

*Sources:* Schneider, *p-Adic Lie Groups* (cleared library copy), §10: the spaces F_{(c,ε)}(E), the definitions of an index and of a finer index, printed pp. 75–77; Lemmas 10.1–10.2, printed pp. 77–78; Lemma 10.3 and the remark after it, printed p. 79: Banach stages attached to indices of a manifold, their inclusions under refinement and the existence of common refinements (cleared copy in the maintainer's library). Schneider–Teitelbaum 1999 (arXiv:math/9912073v1), §2, V-indices and F_I(V), printed pp. 5–6: The same stages for BH-subspaces of a Hausdorff locally convex V. Emerton (arXiv:math/0405137v1), §2.1, Definition 2.1.25 and the paragraphs before it, printed p. 35, arXiv:math/0405137v1: Analytic partitions of a manifold into charts with ball images, refinements, and relatively compact refinements.

### 0.D.6 Locally analytic functions on a manifold

`LocallyAnalyticDistributions:L0/locally-analytic-function-space` · Construction. Planet: *Locally analytic functions on a manifold*.

Let M be a paracompact K-analytic manifold and E a K-Banach space. The space of locally analytic functions C^an(M, E) = ⋃_I F_I(E), the union over all indices of M, carries the locally convex inductive limit topology of the stages F_I(E) along the refinement order. It is Hausdorff; evaluation at each point is continuous; for every partition M = ⊔_j M_j into open subsets, C^an(M, E) = Π_j C^an(M_j, E) topologically; and the map C^an(M, E) → C(M, E) is a continuous injection with dense image (locally constant functions are locally analytic). For a Hausdorff locally convex V, C^an(M, V) is the inductive limit over indices and BH-subspaces of V. The space depends only on the manifold, i.e. on the maximal atlas: any atlas gives cofinal indices, so two atlases defining the same manifold give the same locally convex space. If M is compact: every index can be refined to a finite one, every finite family of functions lies in a common stage, and a sequence of finite indices I_1 ≤ I_2 ≤ … in which each is a relatively compact refinement of the previous is cofinal, so C^an(M, K) = lim→ F_{I_n}(K) is of compact type; its strong dual D(M, K) = C^an(M, K)′_b is a nuclear Fréchet space equal to lim← F_{I_n}(K)′_b. For M = ℤ_p this is LA(ℤ_p, K) = lim→ LA_h(ℤ_p, K) of the predecessor, with the same topology.

*Hypotheses beyond the conventions.* M paracompact; for the compact-type statements M compact and K spherically complete.

*Proof outline.*
1. Inductive limit: Schneider, p-Adic Lie Groups §12, printed p. 84 (using Lemmas 10.1–10.3 to form the inductive system); Hausdorffness and evaluation: Proposition 12.1 and Corollary 12.2; disjoint decompositions: Proposition 12.5 (also Schneider–Teitelbaum §2 after Féaux de Lacroix).
2. Dense injection into C(M, E): Emerton Proposition 2.1.26.
3. Independence of the atlas: the indices are formed from charts of the maximal atlas, and Lemma 10.2 shows that the indices built from any atlas are cofinal; chart-wise, the identity of M is locally analytic and its stagewise substitutions have norm ≤ 1 (multivariate-substitution-bound), so it induces continuous maps between the two inductive limits in both directions.
4. Compact M: finite indices are cofinal (strict paracompactness and compactness); a finite family of functions lies in a common stage by taking a common refinement; relatively compact refinements give compact injective transitions (relatively-compact-restriction), so the limit is of compact type (Emerton, discussion after Definition 2.1.25; Schneider–Teitelbaum Lemma 2.1); the dual statement is compact-type-spaces and compact-type-nuclear-duality.
5. M = ℤ_p: the residue-ball indices I_h are cofinal among indices of ℤ_p (every ball chart of ℤ_p is refined by residue balls, and the transition expansions are affine), so the two inductive limits agree (chart-index-banach-stages).

*API.*
- `TauCeti.LocallyAnalytic.locallyAnalytic` (constructor): C^an(M, E), the union of the index stages with the locally convex inductive limit topology.
- `TauCeti.LocallyAnalytic.mem_locallyAnalytic_iff` (characterisation): f ∈ C^an(M, E) iff f lies in F_I(E) for some index I, iff f is locally given in charts by convergent power series.
- `TauCeti.LocallyAnalytic.locallyAnalytic_t2` (other): C^an(M, E) is Hausdorff.
- `TauCeti.LocallyAnalytic.eval_continuous` (simp): Evaluation at a ∈ M is a continuous linear map C^an(M, E) → E.
- `TauCeti.LocallyAnalytic.locallyAnalytic_disjointUnion` (equivalence): For a partition M = ⊔ M_j into open subsets, C^an(M, E) ≅ Π_j C^an(M_j, E).
- `TauCeti.LocallyAnalytic.locallyAnalytic_toContinuous` (coercion): The inclusion C^an(M, E) → C(M, E) is a continuous injection with dense image.
- `TauCeti.LocallyAnalytic.locallyAnalytic_atlas_independent` (characterisation): Two atlases defining the same manifold give the same locally convex space.
- `TauCeti.LocallyAnalytic.exists_common_stage` (other): For compact M, finitely many locally analytic functions lie in a common finite stage.
- `TauCeti.LocallyAnalytic.locallyAnalytic_isCompactType` (other): For compact M, C^an(M, K) is of compact type, presented by a cofinal sequence of relatively compact finite refinements.
- `TauCeti.LocallyAnalytic.locallyAnalytic_Zp_eq_LA` (compatibility): C^an(ℤ_p, K) = LA(ℤ_p, K) = lim→ LA_h(ℤ_p, K) as locally convex spaces.

*Unit tests.*
- `LocallyAnalyticTests.locallyAnalytic_point_empty` (degenerate): C^an(point, K) = K and C^an(∅, K) = 0.
- `LocallyAnalyticTests.locallyAnalytic_disjoint` (computation): ℤ_p = ⊔_{a mod p} (a + pℤ_p) gives C^an(ℤ_p, K) ≅ Π_a C^an(a + pℤ_p, K); the indicator of 1 + pℤ_p corresponds to the family (0, 1, 0, …, 0).
- `LocallyAnalyticTests.locallyAnalytic_locallyConstant` (compatibility): Every locally constant function M → K (Mathlib's LocallyConstant) is locally analytic, and the locally constant functions are dense in C(M, K) for compact M.
- `LocallyAnalyticTests.locallyAnalytic_not_uniform` (non-example): The topology of C^an(ℤ_p, ℚ_p) is not the subspace topology from C(ℤ_p, ℚ_p): p^n·binom(x, p^{2n}) tends to 0 uniformly but not in C^an(ℤ_p, ℚ_p).
- `LocallyAnalyticTests.locallyAnalytic_exp_stage` (non-example): For p odd, the function equal to exp(x) = Σ x^n/n! on pℤ_p and to 0 on the other residue balls is locally analytic: it lies in the level-1 stage (the series converges on the closed ball of radius 1/p, since |1/n!|·p^{−n} → 0) but not in the level-0 stage, because a single series at 0 agreeing with exp on pℤ_p is the exponential series, which diverges at x = 1.

*Uses.* LocallyAnalyticDistributions:L0/compact-uniform-radius, chart-independence and compact-type-dual-reflexivity: common stages, independence of the atlas and the compact-type duality for compact manifolds; LocallyAnalyticDistributions:L1/distribution-pushforward and L3/mellin-frechet-isomorphism: distributions on compact abelian p-adic analytic groups are the strong duals of these spaces; Schneider–Teitelbaum 1999, Theorem 2.2 (integration), printed p. 7: vector-valued locally analytic functions as maps out of D(M, K).

*Acceptance.* The five unit tests below.

*Needs:* 0.D.5 `chart-index-banach-stages`; 0.A.2 `locally-convex-limits`; 0.C.5 `compact-type-spaces`; 0.C.7 `compact-type-nuclear-duality`; 0.D.3 `relatively-compact-restriction`; Mathlib `LocallyConstant`.

*Sources:* Schneider, *p-Adic Lie Groups* (cleared library copy), §12: the inductive limit topology, printed p. 84; Proposition 12.1 and Corollary 12.2, printed p. 85; Proposition 12.5, printed p. 88: C^an(M, E) as the locally convex inductive limit of the index stages; continuity of evaluation; Hausdorffness; product decomposition for disjoint open coverings (cleared copy in the maintainer's library). Schneider–Teitelbaum 1999 (arXiv:math/9912073v1), §2: definition of C^an(M, V), the compatibility with disjoint coverings and the definition of D(M, K), printed pp. 5–6; Lemma 2.1, printed p. 6: For compact M, C^an(M, K) is of compact type and D(M, K) is the Fréchet projective limit of the stage duals. Emerton (arXiv:math/0405137v1), §2.1, Definition 2.1.25 and the paragraphs after it, printed pp. 35–36; Proposition 2.1.26, printed p. 36, arXiv:math/0405137v1: C^la(X, V) as an inductive limit over analytic partitions; for compact X a cofinal sequence of relatively compact refinements and the compact-type property; the dense continuous injection into C(X, V).

### 0.D.7 Pullback and multiplication of locally analytic functions

`LocallyAnalyticDistributions:L0/locally-analytic-pullback` · Theorem.

Let g : M → N be a locally analytic map of paracompact manifolds and E a K-Banach space. (i) For every index J of N there is an index I of M such that f ↦ f∘g maps F_J(E) into F_I(E) with norm ≤ 1 on each factor; hence g^* : C^an(N, E) → C^an(M, E) is a continuous linear map, with (g∘h)^* = h^*∘g^* and id^* = id. (ii) For a fixed a ∈ C^an(M, K), multiplication by a is a continuous endomorphism of C^an(M, E), mapping F_I(E) into F_{I′}(E) for a common refinement I′ of I and a stage containing a, with bound the stage norm of a. These are maps of actual functions, in contrast with transposes of arbitrary given continuous maps; both preserve bounded sets, so their transposes are continuous on strong duals.

*Proof outline.*
1. (i) Around each point choose a chart of M inside g^{-1} of a chart domain V_j of J on which ψ_j∘g∘φ^{-1} expands as G(x − a) with ‖G − G(0)‖ ≤ δ_j (shrinking the radius, as in Lemma 10.2); refine to a disjoint family; substitution has norm ≤ 1 (multivariate-substitution-bound). Continuity on the inductive limit follows from the universal property (locally-convex-limits) (Schneider, p-Adic Lie Groups, Proposition 12.4(ii)).
2. Functoriality holds on functions and hence on the inductive limits.
3. (ii) Take a common refinement of I and of an index whose stage contains a; on each ball the Cauchy product of Proposition 5.2 is bounded by ‖a‖ times the norm.
4. Bounded sets: continuous linear maps send bounded sets to bounded sets, and transposes are continuous on strong duals (bounded-sets-strong-dual).

*Acceptance.* stagePullback_affine: on ℤ_3, pulling y² back along x ↦ 1 + 3x gives 1 + 6x + 9x². stagePullback_point_empty: a constant map with value b pulls f back to f(b)·1; the pullback from the empty manifold has zero codomain. stagePullback_radius: pulling the indicator of 1 + 3ℤ_3 back along x ↦ 3x gives 0, not the indicator; a definition acting on global polynomial coefficients without refining charts would get this wrong. stageMultiplier: multiplying x by 1 + x gives x + x², multiplication by 1_{1+3ℤ_3} is an idempotent projector and multiplication by x is not idempotent.

*Needs:* 0.D.6 `locally-analytic-function-space`; 0.D.2 `multivariate-substitution-bound`; 0.D.5 `chart-index-banach-stages`; 0.D.1 `restricted-power-series-ball`; 0.A.3 `bounded-sets-strong-dual`.

*Sources:* Schneider, *p-Adic Lie Groups* (cleared library copy), §12, Proposition 12.4 and its proof, printed pp. 86–87; §10, Lemma 10.2, printed pp. 77–78; §5, Propositions 5.2 and 5.4, printed pp. 27–30: Continuity of pullback along locally analytic maps, via stagewise substitution with norm ≤ 1 (cleared copy in the maintainer's library). Emerton (arXiv:math/0405137v1), §2.1, contravariant functoriality of C^la(X, V) in X, after Definition 2.1.25, printed p. 36, arXiv:math/0405137v1: C^la(X, V) is contravariantly functorial in X.

### 0.D.8 Locally analytic functions on products

`LocallyAnalyticDistributions:L0/locally-analytic-product` · Comparison.

Let K be spherically complete and X, Y compact K-analytic manifolds. The external product (f, g) ↦ ((x, y) ↦ f(x)g(y)) induces a topological isomorphism C^an(X, K) ⊗̂ C^an(Y, K) ≅ C^an(X × Y, K), where ⊗̂ is the completed projective tensor product, equal to the inductive one because both factors are of compact type. At the level of stages: for finite indices I of X and J of Y with equal radii on each pair of charts, the product charts form a finite index I × J of X × Y and F_I(K) ⊗̂ F_J(K) ≅ F_{I×J}(K) isometrically, F_ε(K^m; K) ⊗̂ F_ε(K^n; K) ≅ F_ε(K^{m+n}; K) being the c₀(ℕ^m) ⊗̂ c₀(ℕ^n) ≅ c₀(ℕ^{m+n}) identification. Product indices are cofinal among indices of X × Y.

*Hypotheses beyond the conventions.* K spherically complete; X and Y compact.

*Proof outline.*
1. Stages: the product chart (U_i × V_j, φ_i × ψ_j) has image B_ε(a) × B_ε(b) = B_ε((a, b)) for the max norm; the monomials X^α Y^β ↔ (X, Y)^{(α,β)} give the isometry by c0-completed-tensor.
2. Cofinality: product charts form an atlas of X × Y; given any finite index of X × Y, cover by product charts inside its chart domains on which the transition expansions satisfy the refinement bound, and use compactness to take finitely many disjoint ones (as in Schneider, p-Adic Lie Groups, Lemma 10.2); equalise radii by shrinking.
3. Limits: choose cofinal relatively compact sequences I_n, J_n; then the I_n × J_n are cofinal in X × Y, and lim→ (F_{I_n}(K) ⊗̂ F_{J_n}(K)) = C^an(X, K) ⊗̂ C^an(Y, K) by compact-type-tensor-products, while the left side is C^an(X × Y, K) by locally-analytic-function-space.
4. This is a derivation from the cited stage and limit results; it is not stated in this form in the sources read. Emerton Proposition 2.1.28 gives the related C^la(X, V) ≅ C^la(X, K) ⊗̂ V for V of compact type.

*Acceptance.* analyticTensor_monomial: x² ⊗ y³ maps to x²y³, with coefficient 1 at the multi-index (2, 3). analyticTensor_point_empty: a point factor gives the identity and an empty factor gives 0. analyticTensor_infinite: Σ p^n x^n y^n is in the stage of the closed unit polydisc but is not a finite sum of pure tensors; the array of coefficients all 1 is excluded from that stage.

*Needs:* 0.D.6 `locally-analytic-function-space`; 0.B.5 `inductive-tensor-product`; 0.B.6 `c0-completed-tensor`; 0.C.8 `compact-type-tensor-products`; 0.D.5 `chart-index-banach-stages`.

*Sources:* Emerton (arXiv:math/0405137v1), §1.1, Lemma 1.1.30 and Propositions 1.1.31–1.1.32, printed pp. 17–18; §2.1, Proposition 2.1.28, printed p. 37, arXiv:math/0405137v1: Compact-type tensor products as limits of stage tensor products; C^la(X, V) ≅ C^la(X, K) ⊗̂ V for V of compact type. Colmez, *Fonctions d'une variable p-adique* (author PDF), §I.1.4, Proposition I.1.8 and Corollary I.1.9, printed pp. 6–7: Completed tensor products of c₀ spaces and of orthonormal bases. Schneider, *p-Adic Lie Groups* (cleared library copy), §10, Lemma 10.2, printed pp. 77–78: Common refinements of indices.

### 0.D.9 Distributions on a compact manifold

`LocallyAnalyticDistributions:L0/locally-analytic-dual-nuclear` · Comparison.

Let K be spherically complete and X a compact K-analytic manifold. C^an(X, K) is of compact type and reflexive; D(X, K) = C^an(X, K)′_b is a nuclear Fréchet space, the natural map D(X, K) → lim← F_{I_n}(K)′_b over a cofinal sequence of relatively compact finite indices is a topological isomorphism, and C^an(X, K) = D(X, K)′_b. The Dirac distributions δ_x (x ∈ X) are elements of D(X, K) and span a dense subspace. For compact X and Y, D(X × Y, K) ≅ D(X, K) ⊗̂ D(Y, K) with δ_{(x,y)} ↦ δ_x ⊗ δ_y. Transposes of the continuous maps g^* and of multiplications by locally analytic functions are continuous on strong duals; g_* = (g^*)′ sends δ_x to δ_{g(x)}. For X = ℤ_p and K finite over ℚ_p, D(ℤ_p, K) is the space of LocallyAnalyticDistributions:L0/locally-analytic-distributions, with the projective-limit topology equal to the strong dual topology.

*Hypotheses beyond the conventions.* K spherically complete; X compact.

*Proof outline.*
1. Compact type, reflexivity and the projective-limit description: locally-analytic-function-space and compact-type-nuclear-duality (Schneider–Teitelbaum Lemma 2.1, Theorem 1.1, Corollary 1.4).
2. Density of Dirac distributions: a continuous linear form on D(X, K) is evaluation at some f ∈ C^an(X, K) by reflexivity, and it vanishes on all δ_x iff f = 0; apply Hahn–Banach (nonarchimedean-hahn-banach, Corollary 9.3).
3. Products: dualise locally-analytic-product with compact-type-tensor-products (ii).
4. Transposes: bounded-sets-strong-dual and locally-analytic-pullback; g_*δ_x = δ_{g(x)} by evaluation.
5. Comparison with the predecessor: for X = ℤ_p the stages are the LA_h (locally-analytic-function-space), so the projective limit is lim← D_h.

*Acceptance.* D(point, K) = K, with δ_pt ↦ 1. For X = ℤ_p, δ_a is the distribution of the predecessor's dirac_mem test, and φ ↦ φ′(0) is a continuous linear form on C^an(ℤ_p, K), an element of D(ℤ_p, K) that is not a bounded measure. For X = Y = ℤ_p, δ_a ⊗ δ_b corresponds to δ_{(a,b)} in D(ℤ_p², K).

*Needs:* 0.D.6 `locally-analytic-function-space`; 0.C.7 `compact-type-nuclear-duality`; 0.C.8 `compact-type-tensor-products`; 0.D.8 `locally-analytic-product`; 0.D.7 `locally-analytic-pullback`; 0.A.5 `nonarchimedean-hahn-banach`; `L0/locally-analytic-distributions` (predecessor).

*Sources:* Schneider–Teitelbaum 1999 (arXiv:math/9912073v1), §2: the definition of D(M, K), Lemma 2.1 and the Dirac distributions, printed pp. 6–7; §1, Theorem 1.1 and Corollary 1.4, printed pp. 3–4: Distributions on a compact manifold form the Fréchet strong dual of a space of compact type, presented as a projective limit of stage duals. Emerton (arXiv:math/0405137v1), §1.1, Proposition 1.1.32(ii), printed p. 18, arXiv:math/0405137v1: The strong dual of a completed tensor product of spaces of compact type is the completed tensor product of the duals.

## Dependencies

Inside this roadmap: the predecessor's L0 nodes `L0/disc-analytic-functions` (0.D.1), `L0/locally-analytic-radius` (0.D.5), `L0/locally-analytic-distributions` (0.D.9) and `L0/frechet-three-space` (0.C.9, 0.C.11). This part adds no prerequisite on another roadmap. The predecessor's citation of PadicDifferentialEquationsAndRigidCohomology `RD.5/nonarchimedean-hahn-banach` in `L0/banach-splitting` is an upward citation in the upstream tier order, and is replaced by 0.A.5. PadicMeasuresIwasawaAlgebras L0 and L2 (bounded measures, the Mahler basis) remain the predecessor's lower-tier suppliers. On the libraries, Mathlib only: seminorms, `WithSeminorms` and `PolynormableSpace`, `IsNonarchimedean`, `IsUltrametricDist`, von Neumann bounded sets and the bounded-convergence topology, `StrongDual`, `ZeroAtInftyContinuousMap`, `Topology.IsStrictMap` with its linear-map characterisation, the homotopy category, localisation and t-structures, `TensorProduct`, `UniformSpace.Completion`, the Banach open mapping theorem with controlled preimages, `Submodule.ClosedComplemented`, `IsCompactOperator`, `MvPowerSeries.IsRestricted` and `gaussNorm`, `ChartedSpace`, `contDiffGroupoid` and `IsManifold`, and `LocallyConstant`. The Tau Ceti roadmap GrothendieckEulerForms plans Quillen exact structures (its Layer 0), and 0.B.1 notes that the strictly exact sequences of NACvx K form one; it plans no quasi-abelian left heart. Neither the current TauCetiRoadmap checkout nor the current Tau Ceti library has nonarchimedean locally convex spaces, spherical completeness, compactoid sets, spaces of compact type, nuclear spaces or nonarchimedean Hahn–Banach, so nothing here duplicates upstream. Downstream, Layers 1–4 of this roadmap consume 0.C.7 and 0.D.9 through `L0/compact-type-dual-reflexivity`, and 0.D.8 through `L0/product-analytic-tensor`. The pending shared Part II on quasi-abelian functional analysis should import §§0.A–0.C rather than plan them again (packet `restructure`).

## Acceptance tests for the layer

- ℓ¹(ℕ, ℚ_p) is a Mathlib PolynormableSpace but not nonarchimedean locally convex: no open O_K-submodule lies in its unit ball (0.A.1).
- For the finitely supported sequences inside c₀(ℕ, K), the cokernel in NACvx K is nonzero and the Hausdorff cokernel is 0 (0.A.1); the inclusion is strict in NACvx K but not in HANACvx K (0.B.1).
- The diagonal operator x ↦ (p^n x_n) on c₀(ℕ, ℚ_p) is compact (0.C.4) but not strict (0.B.1); [c₀ → c₀] along it is a non-classical object of the left heart (0.B.2).
- ℚ_p and its finite extensions are spherically complete; ℂ_p is not (0.A.4), and over it the Hahn–Banach statement of 0.A.5 is not asserted.
- Over ℚ_p, c₀(ℕ) is complemented in ℓ^∞(ℕ) (0.C.3), unlike the real case; the compact-type sequence 0 → LC(ℤ_p) → LA(ℤ_p) → LA(ℤ_p) → 0 does not split.
- K^(ℕ) and K^ℕ are dual to each other, of compact type and nuclear Fréchet respectively (0.C.5–0.C.7); c₀(ℕ, K) is neither.
- On K^(ℕ) × K^ℕ the pairing Σ x_n y_n is separately but not jointly continuous, so the inductive and projective tensor products differ there (0.B.5); for spaces of compact type they agree (0.C.8).
- LA_0(ℤ_p, ℚ_p) → LA_1(ℤ_p, ℚ_p) is continuous and injective but not a topological embedding: (x^p − x)^n has norm 1 in the first and at most p^{−n} in the second (0.D.5).
- p^n·binom(x, p^{2n}) tends to 0 uniformly but is unbounded in every LA_h, so it does not converge in LA(ℤ_p, ℚ_p) (0.C.5, 0.D.6).
- Over ℤ_3, pulling y² back along x ↦ 1 + 3x gives 1 + 6x + 9x², and pulling 1_{1+3ℤ_3} back along x ↦ 3x gives 0 (0.D.2, 0.D.7).
- Σ p^n x^n y^n lies in the closed-polydisc stage of ℤ_p² but is not a finite sum of pure tensors (0.D.8).
- In a strict extension 0 → A → B → C → 0 with A and C nuclear, B is nuclear; with A = K and C = c₀ it is not (0.C.9).

## Source corrections

Three findings, all in Colmez–Nizioł's Appendix A, are new: they are not in the errata register, and the arXiv versions repeat the text. They are scoped to the author PDF and arXiv v4; the Duke version of record was not read. They concern proofs and a remark; the statements this roadmap uses hold, except for the compact-type extension theorem, whose proof remains incomplete (gap).
- **E101** (gap; Appendix A, proof of Proposition A.4, printed p. 59 (author PDF; the same in arXiv:2108.12785v4)). To see that the dual W* of the middle term is nuclear, the proof cites Dierolf–Roelcke, Proposition 3.8, for p-adic (nonarchimedean) nuclear Fréchet spaces. Correction: Dierolf–Roelcke prove that nuclearity is a three-space property for real and complex locally convex spaces; the nonarchimedean case needs its own argument. It holds over every nonarchimedean field by the lattice proof of LocallyAnalyticDistributions:L0/nuclear-three-space. Reason: Dierolf–Roelcke's proof (printed p. 30) works with summable and absolutely summable sequences in the sense of Pietsch, i.e. the Grothendieck–Pietsch characterisation of nuclearity over ℝ or ℂ, and lifts summable sequences through the quotient using quotient seminorms; that characterisation is not available for nonarchimedean scalars as used. The nonarchimedean statement follows instead by choosing lattices M_A, L′, M_C as in the node and absorbing finitely many lifted vectors.
- **E102** (gap; Appendix A, proof of Proposition A.4, printed p. 59 (author PDF; the same in arXiv:2108.12785v4)). The proof passes to stereotype duals of 0 → W1 → W → W2 → 0 and asserts an exact sequence 0 → W2* → W* → W1* → Ext¹(W2, K) in LH(C_K); it then applies Proposition A.3 to conclude that W* is Fréchet, and finally compares W with its double dual by the five lemma in LH(C_K). Correction: Exactness of the dual sequence as vector spaces follows from Hahn–Banach, but its exactness in LH(C_K), i.e. strictness for the stereotype (here equal to strong) topologies, is not justified when W is not yet known to be of compact type, and Proposition A.3 needs it; the final step also needs the canonical map W → W** to be continuous. A complete proof must supply (H1) strictness of the dual sequence and (H2) continuity of W → W**; with them the argument goes through (LocallyAnalyticDistributions:L0/compact-type-extension-duality). Reason: No derived Hom functor of C_K with values in LH(C_K) carrying the stereotype topology is constructed in the paper, and topological exactness of duals is not a formal consequence of strictness of the original sequence: the known case, a closed subspace of a space of compact type (Schneider–Teitelbaum 1999, Proposition 1.2(i)), is proved through the compact-type structure of the middle term, which is what Proposition A.4 is to establish.
- **E103** (gap; Appendix A, Remark A.2, printed p. 58 (author PDF; the same in arXiv:2108.12785v4)). The remark asserts without proof that a strict extension of Banach spaces splits if K is spherically complete or if both outer spaces have a dense subspace of countable dimension. Correction: Schneider, Nonarchimedean Functional Analysis, Proposition 10.5 proves the splitting when K is discretely valued or when the quotient is of countable type. The case of a spherically complete K with dense value group is not covered by that proof and is not used in this roadmap, whose coefficient fields are finite over ℚ_p. Reason: Schneider's proof identifies the quotient with c₀(X) (Proposition 10.1 needs a discrete valuation, Proposition 10.4 countable type) and lifts its unit vectors boundedly. An Ingleton-type extension of the identity of W1 would need W1 to be spherically complete as a normed space, which fails for c₀(ℕ, K) when |K^×| is dense: nested balls around Σ_{i≤n} a_i e_i with radii r_n decreasing to r > 0 and |a_i| = r_{i−1} have no common point in c₀.

## Gap

**Strict duality for extensions of spaces of compact type.** For a strict short exact sequence 0 → W1 → W → W2 → 0 of locally convex K-spaces (K spherically complete) with W1 and W2 of compact type, two inputs are not established: (H1) the strong dual sequence 0 → W2′_b → W′_b → W1′_b → 0 is strictly exact; (H2) the canonical map W → (W′_b)′_b is continuous (it suffices that W be barrelled). With them, compact-type-extension-duality proves that W is of compact type, which is Colmez–Nizioł Proposition A.4; Colmez–Nizioł use both without proof (E102). Equivalent forms of (H1): every bounded subset of W2 is the image of a bounded subset of W, together with W′_b being Fréchet. Known special cases: W1 finite-dimensional (finite-rank-strict-splitting) and split extensions. No other target of the roadmap depends on the compact-type three-space theorem: it has no consumers in this or any other packet.

## References

- Peter Schneider, *Nonarchimedean Functional Analysis*. Author's lecture notes, version 25.10.2005 (166 pages), the text of the Springer monograph (Springer Monographs in Mathematics, 2002). Printed page numbers are cited; they are the PDF page numbers minus 9. <https://www.uni-muenster.de/IVV5WS/WebHop/user/pschnei/lectnotes/nfa.pdf>
- Peter Schneider, Jeremy Teitelbaum, *Locally analytic distributions and p-adic representation theory, with applications to GL2*. arXiv:math/9912073v1 (published in J. Amer. Math. Soc. 15 (2002), 443–468); printed page numbers of the preprint. <https://arxiv.org/pdf/math/9912073v1>
- Pierre Colmez, Wiesława Nizioł, *On the cohomology of p-adic analytic spaces, II: The C_st-conjecture*. Author PDF (CN5.pdf) of the Duke Math. J. 2025 article, compared for Appendix A with arXiv:2108.12785v4; printed page numbers of the author PDF. <https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf>
- Pierre Colmez, Sally Gilles, Wiesława Nizioł, *Arithmetic duality for p-adic pro-étale cohomology of analytic curves*. arXiv:2308.07712v2 (25 August 2023), the latest arXiv version at the time of reading. <https://arxiv.org/pdf/2308.07712v2>
- Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, *Cohomology of p-adic Stein spaces*. arXiv:1801.06686v2 (published in Invent. Math. 219 (2020), 873–985); printed page numbers of the preprint. <https://arxiv.org/pdf/1801.06686v2>
- Jean-Pierre Schneiders, *Quasi-abelian categories and sheaves*. Mémoires de la SMF 76 (1999), Numdam, doi:10.24033/msmf.389. <https://www.numdam.org/item/10.24033/msmf.389.pdf>
- Matthew Emerton, *Locally analytic vectors in representations of locally p-adic analytic groups*. arXiv:math/0405137v1 (7 May 2004), the only arXiv version (published in Mem. Amer. Math. Soc. 248 (2017), where numbering may differ); printed page numbers of the preprint. <https://arxiv.org/pdf/math/0405137v1>
- Pierre Colmez, *Fonctions d'une variable p-adique*. Author's PDF on his IMJ-PRG page (47 pages, page numbers equal to the PDF page numbers); published in Astérisque 330 (2010). <https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf>
- Peter Schneider, *p-Adic Lie Groups*. Grundlehren der mathematischen Wissenschaften 344, Springer, 2011; read in the copy cleared by the maintainer (not freely available); printed page numbers.
- Walter Roelcke, Susanne Dierolf, *On the three-space-problem for topological vector spaces*. Collectanea Mathematica 32 (1981), 13–35; scanned published version from the Spanish digital mathematics library DML-E (image PDF, read as rendered page images). <http://dmle.icmat.es/pdf/COLLECTANEAMATHEMATICA_1981_32_01_02.pdf>
