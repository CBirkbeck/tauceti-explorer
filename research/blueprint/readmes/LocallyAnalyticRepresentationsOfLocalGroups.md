# Roadmap: locally analytic representations of p-adic reductive groups

This roadmap builds the theory of locally analytic representations of p-adic Lie groups, and of the groups G = 𝐆(L) of rational points of reductive groups over a finite extension L of ℚ_p in particular, on the locally convex vector spaces over a p-adic coefficient field E. It is the representation theory on which the locally analytic p-adic Langlands programme runs: Emerton's eigenvarieties and Jacquet modules, the local models of Breuil–Hellmann–Schraen, Ding's p-adic Hodge parameters, Pan's locally analytic completed cohomology and the higher Coleman theory of Boxer–Calegari–Gee–Pilloni all take their representations, their admissibility conditions and their extension groups from here.

The development has three parts. The foundations (Layers LR.0–LR.3) define locally analytic representations, the distribution algebra D(G, E) of a non-compact group and its module structure, admissibility with the Schneider–Teitelbaum anti-equivalence to coadmissible modules, locally algebraic representations, Ext groups computed among D(G, E)-modules, locally analytic vectors of Banach representations with their derived functors, and the solid version of the theory. The structure theory (Layers LR.4–LR.6) builds locally analytic parabolic induction and Schraen's spectral sequence, the Orlik–Strauch functors F^G_P(M, π_P) with their exactness, irreducibility and Jordan–Hölder series, and Emerton's locally analytic Jacquet functor with the adjunction theorems of Emerton and Breuil. The application (Layers LR.7–LR.9) is Ding's analysis of the extension groups of the locally analytic principal series of GL_n(L): the representations π_alg(φ, h) ⊆ π_1(φ, h) ⊆ π(φ, h), the maps ζ_w : Hom(T(L), E) → Ext¹(π_alg, π_1), their compatibility with parabolic induction and their decomposition over the embeddings of L. These are exactly the GL_n-side inputs of the comparison with Galois deformations made by PadicHodgeParametersInLocallyAnalyticRepresentations.

The targets below are specifications for formalisation. Every definition comes with the API it needs and with checks that a plausible wrong definition fails; every theorem carries its hypotheses, its source by theorem, section and page, and the earlier targets, library declarations and supplier layers it rests on. The companion [Suggested.lean](../suggested/LocallyAnalyticRepresentationsOfLocalGroups.lean) proposes Lean forms for the light definitions and checks that can be stated against the pinned libraries; it is not the roadmap and not exhaustive, and this document is definitive.

## Scope and ownership

This roadmap owns:

- locally analytic representations of locally L- and ℚ_p-analytic groups on barrelled spaces, the derived Lie algebra action and its decomposition over the embeddings of L, the distribution algebra D(G, E) of a non-compact group and its separately continuous module structure on representations, the duality between representations of compact type and nuclear Fréchet D(G, E)-modules, matrix coefficients, and completed external tensor products;
- coadmissible D(G, E)-modules for non-compact G, admissible and strongly admissible representations, the Schneider–Teitelbaum anti-equivalence and its abelian category, locally algebraic representations, Ext groups of admissible representations with their exact sequences and the identification of Ext¹ with extensions, dual-number self-extensions and tautological and universal extensions;
- admissible Banach representations of non-compact groups, locally analytic vectors, very strong admissibility, and the derived functors R^iLA;
- the solid representation theory of Boxer–Calegari–Gee–Pilloni §2.2 (solid representations of analytic and locally profinite groups, smooth and λ-smooth objects, solid locally analytic vectors and their derived functor, integrable LB Lie representations);
- locally analytic parabolic induction and principal series, Ext between characters of a torus, homology under a unipotent radical and Schraen's spectral sequence;
- the Orlik–Strauch functors in their locally ℚ_p-analytic form, including the extension to products of groups over different fields that Breuil–Hellmann–Schraen require;
- rigid character varieties, essentially admissible representations, Emerton's Jacquet functor, closed induction, balanced maps and the adjunction theorems;
- Ding's §3.1 for GL_n(L).

It imports, and does not restate:

- **Compact distribution algebras.** D(H, E) for compact H, the embedding of U(g), the Iwasawa algebra inside it, Fréchet–Stein algebras, coadmissible modules with Theorems A and B, the Banach steps and Frommer's theorem, and the duality between admissible Banach representations of compact groups and finitely generated Iwasawa modules: LocallyAnalyticDistributionsPartII ND.0–ND.3 and ND.6.
- **Locally convex foundations.** Nonarchimedean locally convex spaces, compact-type and nuclear Fréchet spaces and their duality, strict morphisms, completed tensor products, locally analytic functions on manifolds and their duals, the Hahn–Banach theorem over spherically complete fields, and the Mellin transform for compact abelian groups: LocallyAnalyticDistributions L0, L1, L3.
- **Smooth representations.** Smooth and admissible representations, smooth parabolic induction, Jacquet modules and Jacquet's lemma, generic irreducibility, the Bernstein centre and Ding's maps 𝒥_w and smooth tangent spaces: SmoothRepresentationsOfLocalGroups SR.0–SR.3, including SR.3/part-ii-ordered-character-map and SR.3/part-ii-principal-series-tangent.
- **p-adic groups.** The topology of 𝐆(L), congruence subgroups and the Iwasawa decomposition: ReductiveGroupsPartII RG2.0 and RG2.4; parabolics, Levi subgroups and Weyl groups: Tau Ceti ReductiveGroups Layer 7.
- **Lie theory.** U(g), Verma modules and their simple quotients, finite-dimensional irreducibles, the centre and Harish-Chandra, gl_n: Tau Ceti LieHighestWeight Layers 3, 4, 7, 9.
- **Rigid and solid carriers.** Quasi-Stein spaces with Theorems A and B: AdicSpacesPartII R3; solid E-vector spaces, analytic rings and solid group rings: SolidAnalyticRings SA.1, SA.2, SA.4.

Two inputs have owners that are designated but not yet designed; they are stated below as exact contracts. **Category O** (full and parabolic BGG category O for g ⊗_{ℚ_p} E, generalised Verma modules, Verma multiplicities and Kostant's theorem) belongs to the Part II of LieHighestWeight proposed as LieHighestWeightPartIICompletedCategoryO. **Solid functional analysis** (Smith and LS spaces, Banach–Smith and Fréchet–LS duality, and their comparison with the classical notions) belongs to the Part II of LocallyAnalyticDistributions proposed as LocallyAnalyticDistributionsPartIIQuasiAbelianFunctionalAnalysis.

Not in this roadmap: the trianguline variety and (φ, Γ)-modules (TriangulineVarietyAndItsLocalModel); Ding's comparison of these extension groups with Galois deformations and the Hodge parameters themselves (PadicHodgeParametersInLocallyAnalyticRepresentations); completed cohomology and its locally analytic vectors as global objects (the CompletedCohomology roadmaps and LocallyAnalyticCompletedCohomology); category O and its analytic localisation; locally analytic Steinberg representations; and the dimension theory of coadmissible modules (Schneider–Teitelbaum 2003, §8), which no target here uses.

## Conventions

1. **Fields.** p is a prime, L/ℚ_p a finite extension (the field of definition of the group, written K by Ding), d_L = [L : ℚ_p], and E/ℚ_p a finite coefficient field containing the images of all embeddings σ : L → E, forming the set Σ_L with |Σ_L| = d_L. Then L ⊗_{ℚ_p} E ≅ ∏_{σ} E and g ⊗_{ℚ_p} E ≅ ∏_σ g_σ with g_σ = g ⊗_{L,σ} E. Where Schneider–Teitelbaum, Emerton or Orlik–Strauch write K for the coefficient field, this document writes E.
2. **Analyticity.** 'Locally analytic' without qualification means locally ℚ_p-analytic (Ding, Breuil–Hellmann–Schraen, Boxer–Calegari–Gee–Pilloni); 'locally L-analytic' is the Schneider–Teitelbaum and Orlik–Strauch notion; 'locally σ-analytic' means the derived action factors through g_σ. D(G, E) is the ℚ_p-analytic distribution algebra.
3. **Representations.** Representations are on barrelled Hausdorff locally convex E-vector spaces; admissible representations are on spaces of compact type. V′ is the continuous dual with the strong topology, a left D(G, E)-module through the contragredient action (the anti-involution g ↦ g⁻¹ turns right into left modules).
4. **Ext groups.** Ext^i_G(V_1, V_2) := Ext^i_{D(G,E)}(V_2′, V_1′), computed among all abstract left D(G, E)-modules; arguments are reversed by duality.
5. **Induction.** All parabolic inductions are unnormalised: (Ind_P^G U)^an = {f ∈ C^an(G, U) : f(pg) = p·f(g)}, with G acting by right translation (g·f)(h) = f(hg). Principal series are induced from the lower Borel B^-, and Jacquet modules are taken along the upper Borel B, as in Ding. On functions, the Lie algebra acts by (x·f)(g) = (d/dt) f(exp(−tx)g)|_{t=0}.
6. **GL_n.** T ⊆ B ⊆ GL_n are the diagonal torus and the upper triangular Borel, N and N^- the unipotent radicals of B and B^-. θ = (0, −1, …, 1 − n); θ^P is constant −(n_1 + ⋯ + n_{k−1}) on the k-th block of a standard parabolic with Levi GL_{n_1} × ⋯ × GL_{n_r}; P_i is the maximal parabolic with Levi GL_i × GL_{n−i}. w(φ)_i = φ_{w⁻¹(i)}; η = 1 ⊠ |·|_L ⊠ ⋯ ⊠ |·|_L^{n−1}; δ_B = |·|_L^{n−1} ⊠ ⋯ ⊠ |·|_L^{1−n}; |·|_L is unramified with |ϖ_L|_L = p^{−[L_0:ℚ_p]}; ε = N_{L/ℚ_p}(·)|·|_L. For strictly dominant h, λ = h − θ, λ_{σ,i} = h_{σ,i} + i − 1; z^μ(diag(t_i)) = ∏_{σ,i} σ(t_i)^{μ_{σ,i}}; the dot action is u·μ = u(μ + ρ) − ρ for u ∈ S_n^{Σ_L}, with lg(u) = Σ_σ lg(u_σ).
7. **Character spaces.** Hom(H, E), Hom_sm(H, E) and Hom_σ(H, E) are the locally ℚ_p-analytic, smooth and locally σ-analytic additive characters; dim Hom(L^×, E) = 1 + d_L, dim Hom_sm(L^×, E) = 1, dim Hom_σ(L^×, E) = 2; Hom_{g′}(T(L), E) consists of the ψ with ψ − ψ_0 ∘ det smooth.
8. **Solid conventions.** In LR.3 a fixed uncountable strong limit cardinal κ bounds all profinite sets; Mod(E) is the category of solid E-vector spaces (modules over E_■), and tensor products and Homs are solid.
9. **Names.** All new declarations live under `TauCeti.`; the namespaces named in each target are proposals following Mathlib's conventions.

## Exact supplier contracts

**From Mathlib** (`082e2d37e8b0463410cdb532e111cd43d5a66174`). `LieGroup` (Lie groups modelled on a normed space over a nontrivially normed field; analytic smoothness over ℚ_p and its finite extensions) and `GroupLieAlgebra` (the tangent space at 1 with the bracket of invariant vector fields); `UniversalEnvelopingAlgebra` with `UniversalEnvelopingAlgebra.lift`; `ModuleCat` and `CategoryTheory.Abelian.Ext` for abstract D(G, E)-modules and their Ext groups; `TopModuleCat` and `continuousCohomology` for continuous cohomology of Banach representations; `DualNumber` for self-extensions. Locally convex spaces over p-adic fields are taken from LocallyAnalyticDistributions L0, not from Mathlib's ordered-field `LocallyConvexSpace`.

**From Tau Ceti** (`f790474821cf4256814db967cb154e7af3d0c369`). Verma modules `TauCeti.VermaModule` and their simple quotients `TauCeti.irreducibleQuotient` for Killing Lie algebras with a chosen base (TauCeti/Algebra/Lie/HighestWeight/Verma.lean) are the implemented part of LieHighestWeight Layer 3; the reductive and gl_n versions used here are LieHighestWeight Layer 9 targets.

**From LocallyAnalyticDistributionsPartII.** ND.0/p-valued-analytic-structure, ND.0/ordered-basis-chart, ND.1/distribution-algebra, ND.1/lie-algebra-in-distributions, ND.1/open-subgroup-decomposition, ND.1/iwasawa-to-distributions, ND.2/frechet-stein-algebra, ND.2/coadmissible-module, ND.2/coadmissible-theorems, ND.2/frechet-stein-distribution, ND.2/faithful-flatness, ND.6/banach-iwasawa-duality, exactly as stated there; Frommer's description of D_r(G, E) over U_r(g, E) is ND.3/frommer-theorem.

**From LocallyAnalyticDistributions.** L0/nonarchimedean-locally-convex-spaces, L0/locally-convex-limits, L0/bounded-sets-strong-dual, L0/spherically-complete-fields, L0/nonarchimedean-hahn-banach, L0/strict-morphisms-quasi-abelian, L0/compact-type-spaces, L0/nuclear-spaces, L0/compact-type-nuclear-duality, L0/compact-type-tensor-products, L0/compact-type-three-space, L0/compact-type-dual-reflexivity, L0/projective-tensor-product, L0/inductive-tensor-product, L0/compactoid-compact-maps, L0/barrelled-banach-steinhaus, L0/banach-open-mapping-lifts, L0/analytic-manifold-atlases, L0/locally-analytic-function-space, L0/locally-analytic-product, L0/locally-analytic-dual-nuclear, L0/field-analytic-functions; L3/mellin-frechet-isomorphism and L3/mellin-adic-comparison.

**From SmoothRepresentationsOfLocalGroups.** SR.0:abelian-category/is-smooth, smooth-vectors, admissible, smooth-character; SR.0:derived-extension/grothendieck-abelian, central-ext-vanishing; SR.2/smooth-induction, induction-in-stages, induction-exactness, parabolic-induction, modulus-character, jacquet-module, jacquet-lemma, principal-series-jacquet; SR.3/generic-irreducibility, finite-length, part-ii-ordered-character-map (the maps 𝒥_w with 𝒥_{w_2} ∘ p_{w_2,w_1} = 𝒥_{w_1}), part-ii-principal-series-tangent (the smooth tangent ζ_w and its Weyl compatibility).

**From ReductiveGroupsPartII.** RG2.0/points-topological-group, RG2.0/general-linear-points-homeomorphism; RG2.4/iwasawa-decomposition (P\G compact), RG2.4/iwahori-factorization.

**From AdicSpacesPartII.** R3/quasi-stein-space, R3/quasi-stein-theorem-a, R3/quasi-stein-theorems-a-b.

**From SolidAnalyticRings.** SA.1 (solid abelian groups and solid tensor products), SA.2 (analytic rings and base change), SA.4 (E_■ and solid group rings of profinite groups).

**Contract: category O and Kostant homology** (owner: LieHighestWeightPartIICompletedCategoryO). For g split reductive over L and g ⊗_{ℚ_p} E = ∏_σ g_σ: (a) the categories O and O^p_alg — finitely generated U(g ⊗ E)-modules which are direct sums of simple algebraic U(l_P ⊗ E)-modules and locally finite over n_P ⊗ E — abelian, artinian, closed under subobjects and quotients, with O^q_alg ⊆ O^p_alg for q ⊇ p; (b) generalised Verma modules U(g ⊗ E) ⊗_{U(p ⊗ E)} W, their unique simple quotients, the maximal parabolic of a simple object, and the classification of simple objects by highest weight; simple objects of the product are external tensor products over σ; (c) for gl_n: the composition factors of M^-(−λ) (λ dominant) are the L^-(−u·λ), u ∈ S_n^{Σ_L}, with multiplicity one for lg(u) ≤ 1, its second radical layer is ⊕_{lg(u)=1} L^-(−u·λ), and L^-(−s_{i,σ}·λ) has multiplicity one in the parabolic Verma modules U(g ⊗ E) ⊗_{U(p ⊗ E)} (−λ) and lies in the cosocle of the kernel to L^-(−λ); (d) Kostant's theorem H_q(n_P, L(λ)) ≅ ⊕_{w ∈ W^P, lg(w) = q} L_{M_P}(w·λ).

**Contract: solid functional analysis** (owner: LocallyAnalyticDistributionsPartIIQuasiAbelianFunctionalAnalysis). Banach, Smith, Fréchet, LB and LS spaces as solid E-vector spaces and the equivalence of solid and classical Fréchet spaces; the anti-equivalence between Fréchet and LS spaces under V ↦ V^∨ extending Banach–Smith duality; Hom_E(W, V) = W^∨ ⊗ V for W Smith and V Banach; trace-class and compact maps and compact-type objects; flatness of Smith, Banach, LB, LS spaces and of Fréchet spaces of compact type.

## How to read the build

The layers LR.0–LR.9 are in dependency order. Each target has its own heading, followed by its statement with all hypotheses; for a definition or construction, its uses, its API as named lemmas and its checks (the unit tests, one bullet each); a proof sketch; its sources with their locators; and *Needs*: the earlier targets, library declarations and supplier layers it rests on. Each layer ends with worked examples and its dependencies. Nothing is optional.

## Layer LR.0: Locally analytic representations and the distribution algebra of a p-adic group

The p-adic Lie group 𝐆(L) of a smooth affine group, locally L- and ℚ_p-analytic representations on barrelled spaces with their derived Lie algebra action, the distribution algebra D(G, E) of a non-compact group, its module structure on representations, the Schneider–Teitelbaum duality for representations of compact type, continuity of matrix coefficients, weak versus strong convergence of sequences, and completed external tensor products.

#### Rational points of a smooth affine group are a locally analytic group (`rational-points-analytic-group`, theorem)

Let L/ℚ_p be finite and 𝐆 a smooth affine group scheme of finite type over L. Then G = 𝐆(L), with the topology of ReductiveGroupsPartII RG2.0, carries a unique structure of locally L-analytic group (a Lie group over L in the sense of Schneider, §13; in Mathlib, a LieGroup modelled on L^d with analytic smoothness) compatible with its topology. For every closed immersion 𝐆 ↪ GL_N it is a closed analytic submanifold of the open subset GL_N(L) ⊂ M_N(L), its tangent space at 1 is Lie(𝐆) ⊂ gl_N(L) with the commutator bracket, and the closed subgroups P(L), M_P(L), N_P(L), T(L) attached to a parabolic P = M_P N_P and a maximal torus T are locally analytic subgroups with Lie algebras p, m_P, n_P, t. Restricting scalars along ℚ_p ⊆ L makes G a locally ℚ_p-analytic group of dimension [L:ℚ_p]·dim 𝐆 whose ℚ_p-Lie algebra is g viewed over ℚ_p. If E/ℚ_p contains the images of all embeddings σ : L → E (the set Σ_L, of cardinality d_L = [L:ℚ_p]) then L ⊗_{ℚ_p} E ≅ ∏_{σ∈Σ_L} E, x ⊗ y ↦ (σ(x)y)_σ, and hence g ⊗_{ℚ_p} E ≅ ∏_σ g_σ with g_σ := g ⊗_{L,σ} E, and U(g ⊗_{ℚ_p} E) ≅ ⊗_σ U(g_σ).

*Hypotheses and conventions.* L/ℚ_p finite; 𝐆 smooth affine over L (reductive from LR.4 on). Uniqueness is of the analytic structure compatible with the topology and the group law.

*Proof sketch.* Choose a closed immersion 𝐆 ↪ GL_N cut out by f_1, …, f_m. Smoothness of 𝐆 of dimension d gives Jacobian rank N² − d at every point of 𝐆(L), so the implicit-function corollary (SCHN11 Cor. 4.5) gives submanifold charts on 𝐆(L) ⊂ GL_N(L) (SCHN11 §13 Example 3). Multiplication and inversion are restrictions of the analytic operations of GL_N(L), so 𝐆(L) is a Lie group over L; its tangent space at 1 is the kernel of the Jacobian, i.e. Lie(𝐆)(L) (ReductiveGroups Layer 2), with the commutator bracket (SCHN11 §14). Uniqueness: two compatible analytic structures share a saturated p-valued open subgroup, on which the analytic structure is unique (ND.0/p-valued-analytic-structure). Restriction of scalars: an L-analytic chart L^d ⊃ U is a ℚ_p-analytic chart of ℚ_p^{d·d_L}; the decomposition of L ⊗_{ℚ_p} E is the Chinese remainder theorem for the separable extension L/ℚ_p split by E.

*Sources.* SCHN11, §13, Corollary 13.3 and Examples 1)–3), p. 93: GL_n(K) is a Lie group as the open submanifold det ≠ 0 of K^{n²}; Lie groups have a well-defined dimension. SCHN11, §4, Corollary 4.5, p. 28: An implicit-function statement: a strictly differentiable map with surjective derivative has zero set locally a graph, which gives the submanifold charts used for 𝐆(L) ⊂ GL_N(L). SCHN11, §14, Exercise ii, p. 104: For nonarchimedean K, gl_n(K) is the Lie algebra of GL_n(K). BR16, §2, (3), p. 7: States the decomposition L ⊗_{ℚ_p} E ≅ ∏_σ E and deduces g ⊗_{ℚ_p} E ≅ ∏_σ g_σ and U(g ⊗_{ℚ_p} E) ≅ ⊗_σ U(g_σ) for the ℚ_p-Lie algebra of G(L).

*Needs.* `ReductiveGroupsPartII:RG2.0/points-topological-group`; `ReductiveGroupsPartII:RG2.0/general-linear-points-homeomorphism`; `LocallyAnalyticDistributions:L0/analytic-manifold-atlases`; `LocallyAnalyticDistributionsPartII:ND.0/p-valued-analytic-structure`; Tau Ceti ReductiveGroups Layer 2; Mathlib `LieGroup`; Mathlib `GroupLieAlgebra`.

#### Locally analytic representations (`locally-analytic-representation`, definition)

Let F ∈ {ℚ_p, L} be the field of analyticity, G a locally F-analytic group (LR.0/rational-points-analytic-group, by restriction of scalars when F = ℚ_p), and E ⊇ F a complete, spherically complete nonarchimedean field (a finite extension of ℚ_p in every application). A locally F-analytic representation of G over E is a barrelled Hausdorff locally convex E-vector space V with an action of G by continuous E-linear maps such that for every v ∈ V the orbit map ρ_v : G → V, g ↦ g·v, is a locally F-analytic V-valued function (an element of C^{F-an}(G, V), LocallyAnalyticDistributions L0). Morphisms are continuous G-equivariant E-linear maps; this gives the category Rep^{la}_E(G) (Rep^{F-la}_E(G) when F must be named). V is of compact type, LB or Banach when its underlying space is. Unqualified 'locally analytic' means locally ℚ_p-analytic, the convention of Ding, of Breuil–Hellmann–Schraen and of Boxer–Calegari–Gee–Pilloni; 'locally L-analytic' (Schneider–Teitelbaum, Orlik–Strauch) is the case F = L.

*Hypotheses and conventions.* Barrelledness makes the action map G × V → V continuous (Banach–Steinhaus), so the topology and the action interact as for Banach representations. For F = L, E must contain L; for F = ℚ_p no condition on E beyond ℚ_p ⊆ E.

*Uses.* ST03 §6, p. 33: admissible representations are defined as locally analytic representations on spaces of compact type with coadmissible dual; Ding, §3.1.1, p. 33: all GL_n(K)-representations of §3.1 are locally ℚ_p-analytic over E; Orlik–Strauch, §4.1, p. 18: F^G_P takes values in locally analytic representations; BCGP25 §2.2.27: the classical counterpart of solid locally analytic vectors (LR.3); PadicHodgeParametersInLocallyAnalyticRepresentations, input contract LA1: carrier of every GL_n(K)-representation in Ding's comparison; LocallyAnalyticCompletedCohomology LA.0–LA.3: locally analytic vectors of completed cohomology are locally analytic representations of GL_2(ℚ_p).

*API* (namespace `TauCeti.LocallyAnalytic`):

- `LocallyAnalyticRep` (constructor): Bundles V, the action ρ : G →* (V →L[E] V) and the proof that every orbit map lies in C^{F-an}(G, V).
- `LocallyAnalyticRep.orbit_mem` (projection): For every v, (g ↦ ρ g v) ∈ C^{F-an}(G, V).
- `LocallyAnalyticRep.continuous_action` (structure): For barrelled V the action map G × V → V is jointly continuous.
- `LocallyAnalyticRep.Hom` (instance): Continuous G-equivariant E-linear maps form the morphisms of a category Rep^{la}_E(G), additive and E-linear.
- `LocallyAnalyticRep.closedSubrep` (constructor): A closed G-stable subspace of a locally analytic representation of compact type, with the induced action, is locally analytic, and so is the quotient by it.
- `LocallyAnalyticRep.restrict` (functoriality): Restriction along a locally analytic homomorphism H → G (in particular to closed analytic subgroups) is a functor Rep^{la}_E(G) → Rep^{la}_E(H).
- `LocallyAnalyticRep.restrictScalars` (compatibility): A locally L-analytic representation is locally ℚ_p-analytic; this inclusion of categories is full.
- `LocallyAnalyticRep.ofSmooth` (coercion): A smooth representation (SmoothRepresentationsOfLocalGroups SR.0) of countable dimension, with the finest locally convex topology, is locally analytic, with locally constant orbit maps.
- `LocallyAnalyticRep.ofAlgebraic` (example): A finite-dimensional algebraic representation W of 𝐆 ×_L E (ReductiveGroups Layer 1), restricted to G, is locally L-analytic.

**Checks.**

- `LocallyAnalyticRep.zero` (degenerate): V = 0, and more generally any barrelled V with the trivial action, is a locally analytic representation.
- `LocallyAnalyticRep.char_Zp` (computation): For p odd and G = ℤ_p, the character a ↦ (1 + p)^a = exp(a·log(1 + p)) on V = E is locally ℚ_p-analytic (its orbit map is a convergent power series on all of ℤ_p).
- `LocallyAnalyticRep.translation_not_la` (non-example): The translation representation of ℤ_p on the Banach space C(ℤ_p, E) of continuous functions is continuous but not locally analytic: the orbit map of a continuous function that is not locally analytic is not locally analytic.
- `LocallyAnalyticRep.sigma_not_L_analytic` (non-example): For L ≠ ℚ_p and an embedding σ : L → E different from the inclusion, the character x ↦ σ(x) of the additive group L on V = E is locally ℚ_p-analytic but not locally L-analytic.
- `LocallyAnalyticRep.ofSmooth_compat` (compatibility): For a smooth representation π of G of countable dimension (SR.0/is-smooth) with the finest locally convex topology, LocallyAnalyticRep.ofSmooth π has the same underlying G-module, and its orbit maps are locally constant.

*Proof sketch.* Locally analytic V-valued functions on a locally F-analytic manifold are those that are, on a cover by charts, sums of convergent power series with coefficients in BH-subspaces of V (LocallyAnalyticDistributions L0/locally-analytic-function-space); the definition only asks this of orbit maps. Continuity of G × V → V: each g acts continuously and the orbit maps are continuous; for barrelled V the equicontinuity of {g : g ∈ K} for compact K follows from the Banach–Steinhaus theorem (L0/barrelled-banach-steinhaus), as in ST02 §3.

*Sources.* ST02, §3, definition of a locally analytic G-representation, p. 12: Defines a locally analytic representation as a barrelled Hausdorff locally convex space with continuous linear G-action whose orbit maps are locally analytic V-valued functions. EM17, §3.6, Definition 3.6.9, p. 72: Reformulates the definition: a topological action on a barrelled Hausdorff locally convex space for which the natural map V_la → V is a bijection. OS15, §4.1, p. 18: Writes Rep^la_K(G) for locally analytic representations of G on barrelled locally convex Hausdorff K-vector spaces, the target of F^G_P. DING25, §3.1.1, p. 33: Works throughout with locally ℚ_p-analytic representations of GL_n(K) over E.

*Needs.* LR.0 *Rational points of a smooth affine group are a locally analytic group*; `LocallyAnalyticDistributions:L0/nonarchimedean-locally-convex-spaces`; `LocallyAnalyticDistributions:L0/locally-analytic-function-space`; `LocallyAnalyticDistributions:L0/barrelled-banach-steinhaus`; `LocallyAnalyticDistributions:L0/compact-type-spaces`; `LocallyAnalyticDistributions:L0/spherically-complete-fields`; `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/is-smooth`; Tau Ceti ReductiveGroups Layer 1.

*Planet:* Locally analytic representation.

#### The derived action of the Lie algebra (`derived-lie-action`, construction)

Let V be a locally F-analytic representation of G with F-Lie algebra g. For x ∈ g and v ∈ V put x·v := (d/dt)(exp(tx)·v)|_{t=0}, using the exponential of G near 1 (SCHN11 §18) and the analyticity of the orbit map. Then x ↦ (v ↦ x·v) is an F-linear Lie algebra homomorphism g → End_cont(V), which extends to an E-algebra homomorphism U(g ⊗_F E) → End_cont(V). It satisfies g(x·v) = (Ad(g)x)·(g·v) for g ∈ G, commutes with every morphism of locally analytic representations, and coincides with the action of the distributions x̃ ∈ D(G, E) of LocallyAnalyticDistributionsPartII ND.1/lie-algebra-in-distributions under the module structure of LR.0/distribution-module-structure. For F = ℚ_p and E splitting L, U(g ⊗_{ℚ_p} E) = ⊗_σ U(g_σ) acts, so V decomposes its Lie action into components indexed by Σ_L. On spaces of functions the convention is (x·f)(g) = (d/dt) f(exp(−tx)g)|_{t=0} for the left regular action, as in Breuil.

*Hypotheses and conventions.* The exponential is defined on a neighbourhood of 0 in g; only the germ at t = 0 enters.

*Uses.* Ding, §3.1.4, p. 44: locally σ-analytic means the 𝔤𝔩_n(K) ⊗_{ℚ_p} E-action factors through 𝔤𝔩_n(K) ⊗_{K,σ} E; g_{Σ∖σ}-algebraic means U(g_{Σ∖σ})-finite algebraic; Orlik–Strauch, §3–4; Breuil, socle I, Lemma 2.1: U(g)-action on induced representations defines the subspace killed by ker(φ); Schraen 2011, (4.40): Lie algebra homology H_q(n, −) of locally algebraic vectors.

*API* (namespace `TauCeti.LocallyAnalytic`):

- `LocallyAnalyticRep.lieAction` (data): The map g → End_cont(V), x ↦ (v ↦ (d/dt)(exp(tx)·v)|₀).
- `LocallyAnalyticRep.lieAction_lie` (relation): lieAction ⁅x, y⁆ = lieAction x ∘ lieAction y − lieAction y ∘ lieAction x.
- `LocallyAnalyticRep.envelopingAction` (universal-property): The unique E-algebra map U(g ⊗_F E) → End_cont(V) extending lieAction.
- `LocallyAnalyticRep.lieAction_conj` (relation): ρ g ∘ lieAction x ∘ ρ g⁻¹ = lieAction (Ad g x).
- `LocallyAnalyticRep.Hom.map_lieAction` (functoriality): Morphisms of locally analytic representations commute with the derived action.
- `LocallyAnalyticRep.lieAction_eq_dist` (compatibility): lieAction x v = x̃ ∗ v with x̃ ∈ D(G, E) as in ND.1/lie-algebra-in-distributions.
- `LocallyAnalyticRep.lieAction_sigma` (other): For F = ℚ_p and E splitting L, the action of g ⊗_{ℚ_p} E = ∏_σ g_σ splits into commuting actions of the g_σ.

**Checks.**

- `lieAction_smooth` (degenerate): On a smooth representation (locally constant orbit maps) the derived action is zero.
- `lieAction_character_Qp` (computation): For G = ℚ_p^× and the character χ(x) = x^k on E, the element 1 ∈ g = ℚ_p acts by multiplication by k; for the smooth character x ↦ |x| it acts by 0.
- `lieAction_sigma_character` (computation): For G = L^× (F = ℚ_p) and the character x ↦ σ(x)^k, the component g_τ of g ⊗_{ℚ_p} E acts by k if τ = σ and by 0 if τ ≠ σ.
- `lieAction_algebraic` (compatibility): On a finite-dimensional algebraic representation W of 𝐆 ×_L E the derived action of g ⊗_L E is the differential of the algebraic action (ReductiveGroups Layer 2).

*Proof sketch.* The orbit map ρ_v is locally analytic, so t ↦ exp(tx)·v is analytic near 0 and its derivative exists in V; continuity in v follows from ST02 Proposition 3.2 (LR.0/distribution-module-structure), since x·v = x̃ ∗ v. The bracket relation is that of ND.1/lie-algebra-in-distributions (x̃ ∗ ỹ − ỹ ∗ x̃ = [x, y]~) transported by the module structure; the universal property of U (mathlib UniversalEnvelopingAlgebra.lift) gives the extension. Ad-equivariance: δ_g ∗ x̃ ∗ δ_{g⁻¹} = (Ad(g)x)~ (ND.1).

*Sources.* ST02, §2–3, the derived action of g, pp. 9–13: Defines the action of g on C^an(H, K) by (xf)(g) = (d/dt) f(exp(−tx)g)|₀ and on locally analytic representations through distributions, extending to U(g). BR16, §2, (5), p. 8: Fixes the convention (x·f)(g) = (d/dt) f(exp(−tx)g)|_{t=0} and extends it to U(g ⊗_{ℚ_p} E). DING25, §3.1.4, p. 44: Uses the derived 𝔤𝔩_n(K) ⊗_{ℚ_p} E-action to define locally σ-analytic and g_{Σ_K∖{σ}}-algebraic representations.

*Needs.* LR.0 *Locally analytic representations*; LR.0 *Rational points of a smooth affine group are a locally analytic group*; `LocallyAnalyticDistributionsPartII:ND.1/lie-algebra-in-distributions`; Tau Ceti LieHighestWeight Layer 3; Mathlib `UniversalEnvelopingAlgebra`; Mathlib `UniversalEnvelopingAlgebra.lift`.

#### The distribution algebra of a locally analytic group (`distribution-algebra`, construction)

Let G be a locally F-analytic group (not necessarily compact) and H ⊆ G a compact open subgroup. C^{F-an}(G, E) = ∏_{gH ∈ G/H} C^{F-an}(gH, E) as locally convex spaces, and D(G, E) := C^{F-an}(G, E)′_b is the locally convex direct sum ⊕_{gH∈G/H} δ_g ∗ D(H, E), where D(H, E) is the Fréchet algebra of LocallyAnalyticDistributionsPartII ND.1/distribution-algebra. Convolution λ ∗ μ = m_*(λ ⊗̂ μ) makes D(G, E) an associative unital E-algebra with unit δ_1 and separately continuous multiplication; δ_g ∗ δ_h = δ_{gh}; E[G] → D(G, E) is injective with dense image; for open H′ ⊆ G, D(H′, E) is a subalgebra and D(G, E) is a free left and right D(H′, E)-module on any set of coset representatives; U(g ⊗_F E) ⊂ D(H, E) ⊂ D(G, E); and g ↦ g⁻¹ induces an anti-involution, so left modules suffice. For F = ℚ_p and L ≠ ℚ_p the closed embedding C^{L-an} ⊂ C^{ℚ_p-an} dualises to a surjection D_{ℚ_p}(G, E) ↠ D_L(G, E). Unless stated otherwise D(G, E) is the ℚ_p-analytic algebra.

*Hypotheses and conventions.* E spherically complete, so that strong duals behave as in LocallyAnalyticDistributions L0. Separate continuity only: for noncompact G the multiplication on the direct sum is not jointly continuous in general, and nothing below uses joint continuity.

*Uses.* Ding, §3.1.1, p. 33: Ext^i_{GL_n(K)}(V_1, V_2) is defined as Ext^i in abstract D(GL_n(K), E)-modules; ST03 §6, p. 31: coadmissible D(G, K)-modules for noncompact G; Schraen 2011, Définition 3.1, p. 65: Ext groups of locally analytic representations of GL_3(ℚ_p) via D(G)-modules; Breuil, Ext¹, §2.1, p. 10: D_σ(H, E)-modules and Lemme 2.1.1.

*API* (namespace `TauCeti.DistributionAlgebra`):

- `DistributionAlgebra.D` (data): D(G, E) = C^an(G, E)′_b with convolution, for a locally analytic group G.
- `DistributionAlgebra.dirac` (constructor): g ↦ δ_g, a group homomorphism G → D(G, E)^×.
- `DistributionAlgebra.decomp_coset` (characterisation): D(G, E) ≅ ⊕_{gH∈G/H} δ_g ∗ D(H, E) for every compact open H, as locally convex spaces and as left D(H, E)-modules.
- `DistributionAlgebra.separatelyContinuous_mul` (structure): Convolution is separately continuous; D(G, E) is a locally convex E-algebra.
- `DistributionAlgebra.ofOpen` (functoriality): For H′ ⊆ G open, D(H′, E) → D(G, E) is an injective algebra map, compatible with composition of inclusions.
- `DistributionAlgebra.free_over_open` (characterisation): D(G, E) is free as left and as right D(H′, E)-module with basis δ_{g_i} for coset representatives g_i.
- `DistributionAlgebra.ofCompact` (compatibility): For compact G, D(G, E) is the Fréchet algebra of ND.1/distribution-algebra.
- `DistributionAlgebra.restrictScalars` (compatibility): For F = ℚ_p and the group of L-points, the transpose of C^{L-an} ⊂ C^{ℚ_p-an} is a surjective algebra map D_{ℚ_p}(G, E) → D_L(G, E).

**Checks.**

- `DistributionAlgebra.discrete` (degenerate): For G discrete (dimension 0, H = {1}), D(G, E) is the group algebra E[G] with its finest locally convex topology.
- `DistributionAlgebra.compact_compat` (compatibility): For G = ℤ_p, D(G, E) equals the commutative Fréchet algebra of LocallyAnalyticDistributions L0/L1 (isomorphic by the Amice transform to rigid functions on the open unit disc).
- `DistributionAlgebra.Qp_not_frechet` (non-example): For G = ℚ_p (additive), D(G, E) = ⊕_{a∈ℚ_p/ℤ_p} δ_a ∗ D(ℤ_p, E) is a countable direct sum of Fréchet spaces, not a Fréchet space, and is not finitely generated over D(ℤ_p, E).
- `DistributionAlgebra.dirac_mul` (computation): δ_g ∗ δ_h = δ_{gh}, and for x ∈ g, δ_g ∗ x̃ ∗ δ_{g⁻¹} = (Ad(g)x)~.

*Proof sketch.* The product decomposition of C^an(G, E) over the cosets of H and the duality between products and locally convex direct sums give D(G, E) = ⊕ δ_g ∗ D(H, E). Convolution is defined coset by coset from ND.1/distribution-algebra and m_* (LocallyAnalyticDistributions L0/locally-analytic-pullback); associativity and the unit follow from the compact case and δ_g ∗ δ_h = δ_{gh} (ST02 Proposition 2.3). Density of E[G] and freeness over D(H′, E) reduce to ND.1/open-subgroup-decomposition for the compact pieces.

*Sources.* ST02, §2, Proposition 2.3, p. 9: For any locally L-analytic G, (D(G, K), ∗) is an associative algebra with unit δ_1 and separately continuous multiplication; it is a Fréchet algebra if G is compact. ST02, §3, Lemma 3.1, p. 13: Dirac distributions span a dense subspace and D(G, K) = ⊕_{g∈G/H} δ_g ∗ D(H, K) for a compact open H. BR16, §2, proof of Lemma 2.2, p. 9: Uses C^{ℚ_p-an}(G(L), V) = ∏_i C^{ℚ_p-an}(G_i, V) and D(G(L), E) = ⊕_i D(G_i, E) for a disjoint cover by compact opens.

*Needs.* `LocallyAnalyticDistributionsPartII:ND.1/distribution-algebra`; `LocallyAnalyticDistributionsPartII:ND.1/lie-algebra-in-distributions`; `LocallyAnalyticDistributionsPartII:ND.1/open-subgroup-decomposition`; `LocallyAnalyticDistributions:L0/locally-analytic-dual-nuclear`; `LocallyAnalyticDistributions:L0/locally-convex-limits`; `LocallyAnalyticDistributions:L0/field-analytic-functions`; LR.0 *Rational points of a smooth affine group are a locally analytic group*.

*Planet:* Distribution algebra of a p-adic Lie group.

#### Locally analytic representations are D(G, E)-modules (`distribution-module-structure`, theorem)

Let V be a locally F-analytic representation of G over E. There is a unique separately continuous bilinear map D(G, E) × V → V, (μ, v) ↦ μ ∗ v, making V a left D(G, E)-module, with δ_g ∗ v = g·v, extending the derived action of U(g ⊗_F E) (LR.0/derived-lie-action), and characterised by λ(μ ∗ v) = μ(g ↦ λ(g·v)) for all λ ∈ V′. For fixed v the map D(G, E) → V, μ ↦ μ ∗ v, is continuous (the integration map of the orbit). Every continuous G-equivariant linear map between locally analytic representations is D(G, E)-linear.

*Hypotheses and conventions.* V barrelled (part of the definition of a locally analytic representation).

*Proof sketch.* For v ∈ V the orbit map ρ_v ∈ C^an(G, V); integration against μ, defined on C^an(G, V) through the completed tensor product C^an(G, E) ⊗̂ V (LocallyAnalyticDistributions L0), gives μ ∗ v := μ(ρ_v) (ST02 §3). Separate continuity in μ is continuity of the integration map; in v it follows from barrelledness and Banach–Steinhaus. δ_g ∗ v = g·v by evaluation; the module axioms hold on Dirac distributions and extend by density of E[G] (LR.0/distribution-algebra). The formula λ(μ ∗ v) = μ(λ ∘ ρ_v) holds by construction; uniqueness follows from Hahn–Banach (L0/nonarchimedean-hahn-banach). G-maps commute with Dirac distributions, hence with all of D(G, E).

*Sources.* ST02, §3, Proposition 3.2, p. 13: The map (μ, v) ↦ μ ∗ v is separately continuous, V is a D(G, K)-module extending the U(g)-action, and continuous G-maps are D(G, K)-linear. DLB17, §5.2, proof of Lemme 5.9, p. 29: Uses the continuity of μ ↦ μ ∗ w from D(G) to W and the integration formula λ(μ ∗ w) = ∫ λ(g·w) dμ(g) for λ ∈ W*.

*Needs.* LR.0 *Locally analytic representations*; LR.0 *The distribution algebra of a locally analytic group*; LR.0 *The derived action of the Lie algebra*; `LocallyAnalyticDistributions:L0/barrelled-banach-steinhaus`; `LocallyAnalyticDistributions:L0/nonarchimedean-hahn-banach`.

#### Schneider–Teitelbaum duality for representations of compact type (`compact-type-duality`, theorem)

The functor V ↦ V′_b is an anti-equivalence between locally F-analytic representations of G on E-vector spaces of compact type, with continuous G-maps, and separately continuous D(G, E)-modules whose underlying space is a nuclear Fréchet space, with continuous D(G, E)-linear maps. The D(G, E)-module structure on V′_b is the contragredient of LR.0/distribution-module-structure, composed with the anti-involution g ↦ g⁻¹.

*Hypotheses and conventions.* E spherically complete, so that compact-type and nuclear Fréchet spaces are reflexive and in duality (LocallyAnalyticDistributions L0/compact-type-nuclear-duality).

*Proof sketch.* Compact-type spaces and nuclear Fréchet spaces are anti-equivalent under the strong dual (L0/compact-type-nuclear-duality). A locally analytic structure on V gives a separately continuous D(G, E)-module structure on V′_b by transposition (LR.0/distribution-module-structure). Conversely a separately continuous D(G, E)-module structure on a nuclear Fréchet M gives a G-action on M′_b by restriction to Dirac distributions, and the orbit maps are locally analytic by the reflexivity argument of ST02 Corollary 3.3.

*Sources.* ST02, §3, Corollary 3.3, p. 14: The functor V ↦ V′_b is an anti-equivalence between locally analytic representations on spaces of compact type and separately continuous D(G, K)-modules on nuclear Fréchet spaces.

*Needs.* LR.0 *Locally analytic representations are D(G, E)-modules*; `LocallyAnalyticDistributions:L0/compact-type-nuclear-duality`; `LocallyAnalyticDistributions:L0/compact-type-spaces`; `LocallyAnalyticDistributions:L0/nuclear-spaces`.

*Planet:* Duality for representations of compact type.

#### Continuity of matrix-coefficient maps (`matrix-coefficient-continuity`, theorem)

Let W be a locally F-analytic representation of G on an E-space of compact type and λ ∈ W′. Then the map F_λ : W → C^{F-an}(G, E), w ↦ (g ↦ λ(g·w)), is well defined, G-equivariant for the right regular action, and continuous.

*Hypotheses and conventions.* W of compact type, hence reflexive.

*Proof sketch.* F_λ(w) is locally analytic because it is λ composed with the orbit map ρ_w. By reflexivity of W and of C^an(G, E) it suffices to show that the transpose D(G, E) → W′_b, μ ↦ (w ↦ μ(F_λ(w))) = (w ↦ λ(μ ∗ w)), is continuous; this is μ ↦ μ̌ ∗ λ for the contragredient module structure on W′_b, which is separately continuous by LR.0/compact-type-duality. Equivariance is the identity λ(gh·w) = (F_λ(h·w))(g).

*Sources.* DLB17, §5.2, Lemme 5.9 and its proof, pp. 28–29: For a locally analytic representation W of compact type and a continuous linear form λ, the matrix-coefficient map W → LA(G) is continuous; the proof uses reflexivity and the continuity of μ ↦ μ ∗ w.

*Needs.* LR.0 *Locally analytic representations are D(G, E)-modules*; LR.0 *Schneider–Teitelbaum duality for representations of compact type*; `LocallyAnalyticDistributions:L0/compact-type-dual-reflexivity`.

#### Weakly null sequences are null over a spherically complete field (`weak-sequential-convergence`, theorem)

Let E be spherically complete and V a Hausdorff locally convex E-vector space. A sequence (v_n) in V converges to 0 if and only if λ(v_n) → 0 for every λ ∈ V′.

*Hypotheses and conventions.* Spherical completeness of E is essential: it gives the Hahn–Banach theorem (L0/nonarchimedean-hahn-banach), on which the argument rests.

*Proof sketch.* Strong convergence implies weak convergence. Conversely, reduce to the seminormed quotients V_q := V/ker q for the continuous seminorms q; weak convergence passes to V_q because continuous forms on V_q are continuous forms on V. In V_q, {v_n} ∪ {0} is weakly compact; over a spherically complete field a weakly convergent sequence is compactoid and the weak and the q-topologies agree on compactoid sets (the compactoid theory of LocallyAnalyticDistributions L0/compactoid-compact-maps), so q(v_n) → 0. The source states the lemma without proof; this sketch is recorded as the gap 'Proof of Dospinescu–Le Bras, Lemme 5.10'.

*Sources.* DLB17, §5.2, Lemme 5.10, p. 29: Asserts, without proof, that in a locally convex space over a spherically complete field a sequence tends to 0 if and only if it tends weakly to 0.

*Needs.* `LocallyAnalyticDistributions:L0/nonarchimedean-locally-convex-spaces`; `LocallyAnalyticDistributions:L0/spherically-complete-fields`; `LocallyAnalyticDistributions:L0/nonarchimedean-hahn-banach`; `LocallyAnalyticDistributions:L0/compactoid-compact-maps`.

#### Completed external tensor products of representations (`completed-external-tensor`, construction)

Let V_i be a locally F-analytic representation of G_i on a space of compact type, i = 1, 2. The completed tensor product V_1 ⊗̂_E V_2 (projective and inductive completed tensor products agree for these spaces) is of compact type and is a locally analytic representation of G_1 × G_2 with (g_1, g_2)(v_1 ⊗ v_2) = g_1v_1 ⊗ g_2v_2. Its strong dual is V_1′_b ⊗̂_E V_2′_b as a module over D(G_1 × G_2, E) ⊇ D(G_1, E) ⊗_E D(G_2, E) (for compact opens, D(H_1 × H_2, E) = D(H_1, E) ⊗̂_E D(H_2, E)). If V_1 and V_2 are admissible, so is V_1 ⊗̂_E V_2; restriction along the diagonal G → G × G gives the internal completed tensor product, in particular the twist V ⊗ χ by a locally analytic character χ.

*Hypotheses and conventions.* Compact-type (or semi-complete LB) spaces, so that the inductive and projective completed tensor products agree.

*Uses.* Ding, §3.1.3, (3.19) and (3.26), pp. 40–42: the Levi representation ⊗̂_i π_1(φ_{F_P,i}, h^i) and the extension construction of ζ_{F_P}; BHS, §5.2, p. 390: Orlik–Strauch representations of products G_1(K_1) × G_2(K_2); Ding, §3.1.2: twists by locally analytic characters such as z^λ and (1 + ψε).

*API* (namespace `TauCeti.LocallyAnalytic`):

- `LocallyAnalyticRep.extTensor` (constructor): V_1 ⊠̂ V_2 as a representation of G_1 × G_2.
- `LocallyAnalyticRep.extTensor_dual` (characterisation): (V_1 ⊠̂ V_2)′_b ≅ V_1′_b ⊗̂ V_2′_b as D(G_1 × G_2, E)-modules.
- `LocallyAnalyticRep.extTensor_admissible` (other): Admissible ⊠̂ admissible is admissible.
- `LocallyAnalyticRep.extTensor_functorial` (functoriality): Functorial and exact in each variable for strict short exact sequences.
- `LocallyAnalyticRep.twist` (constructor): V ⊗ χ := restriction of V ⊠̂ χ along the diagonal, for a locally analytic character χ.

**Checks.**

- `extTensor_trivial` (degenerate): V ⊠̂ E (trivial one-dimensional representation of the trivial group) is V.
- `extTensor_finiteDim` (computation): For finite-dimensional V_1, V_2 the completed tensor product is the algebraic tensor product with the product action.
- `extTensor_smooth` (compatibility): For smooth admissible π_1, π_2 with the finest locally convex topology, π_1 ⊠̂ π_2 is the smooth external tensor product π_1 ⊗ π_2 of SmoothRepresentationsOfLocalGroups.
- `twist_char_char` (computation): For characters, χ ⊗ χ′ is the product character χχ′.

*Proof sketch.* Completed tensor products of compact-type spaces are of compact type and dual to the completed tensor products of the nuclear Fréchet duals (LocallyAnalyticDistributions L0/compact-type-tensor-products). Orbit maps of elementary tensors are products of locally analytic functions, hence locally analytic on G_1 × G_2 (L0/locally-analytic-product); the closed span of elementary tensors is everything and barrelledness gives the rest. Admissibility: for compact opens H_i the dual M_1 ⊗̂ M_2 of coadmissible modules is coadmissible over D(H_1, E) ⊗̂ D(H_2, E) = D(H_1 × H_2, E), Banach step by Banach step (ND.2/coadmissible-theorems: coherent sheaves (M_{1,n} ⊗ M_{2,n})).

*Sources.* EM17, §1.1, Proposition 1.1.31, p. 18: For semi-complete LB-spaces the natural map from the inductive to the projective tensor product is a topological isomorphism, which is why Ding writes the completed tensor product without specifying it. DING25, §3.1.3, (3.19) and footnote to ⊗̂, p. 40: Uses ⊗̂_{i} π_1(φ_{F_P,i}, h^i), the completed injective (equivalently projective) tensor product over E, as a representation of L_P(K) = ∏_i GL_{n_i}(K), citing Emerton Proposition 1.1.31. BHS19, §5.2, p. 390: Writes the Orlik–Strauch representation of a product group G_p = ∏_v G_v as the completed tensor product ⊗̂_v F^{G_v}_{B_v}(…).

*Needs.* LR.0 *Locally analytic representations*; LR.0 *Schneider–Teitelbaum duality for representations of compact type*; `LocallyAnalyticDistributions:L0/compact-type-tensor-products`; `LocallyAnalyticDistributions:L0/locally-analytic-product`; `LocallyAnalyticDistributions:L0/projective-tensor-product`; `LocallyAnalyticDistributions:L0/inductive-tensor-product`.

### Examples

- (Rational points of a smooth affine group are a locally analytic group) For 𝐆 = GL_n the analytic structure is that of the open subset GL_n(L) ⊂ M_n(L) and g = gl_n(L).
- (Rational points of a smooth affine group are a locally analytic group) For L ≠ ℚ_p and 𝐆 = 𝔾_m, G = L^× has dimension 1 over L and d_L over ℚ_p, and Lie(G) ⊗_{ℚ_p} E ≅ E^{Σ_L}.
- (Locally analytic representations) Every finite-dimensional algebraic representation of 𝐆 over E, restricted to G = 𝐆(L), is locally L-analytic (orbit maps are polynomial in matrix entries).
- (The derived action of the Lie algebra) On a finite-dimensional algebraic representation the derived action is the differential of the algebraic action (ReductiveGroups Layer 2).
- (The distribution algebra of a locally analytic group) For compact G the construction returns the Fréchet algebra of ND.1/distribution-algebra.
- (Locally analytic representations are D(G, E)-modules) For V = C^an(G, E) with left translation, μ ∗ f is the convolution of μ with f (ST02 §3).
- (Schneider–Teitelbaum duality for representations of compact type) For G compact and V = C^an(G, E), the dual is D(G, E) itself, free of rank one.
- (Continuity of matrix-coefficient maps) For W = C^an(G, E) and λ = evaluation at 1, F_λ is the identity of C^an(G, E) (up to the inversion convention).
- (Weakly null sequences are null over a spherically complete field) In c_0(ℕ, E) the unit vectors e_n do not tend to 0 weakly (pair with the bounded sequence (1, 1, …) ∈ ℓ^∞ = c_0′), consistently with ‖e_n‖ = 1.
- (Completed external tensor products of representations) For G_2 = 1 and V_2 = E, V_1 ⊗̂ E = V_1.

### Dependencies

This layer rests on: `LocallyAnalyticDistributions:L0`; `LocallyAnalyticDistributionsPartII:ND.0`; `LocallyAnalyticDistributionsPartII:ND.1`; `ReductiveGroupsPartII:RG2.0`; `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`; Tau Ceti ReductiveGroups Layer 1; Tau Ceti ReductiveGroups Layer 2; Tau Ceti LieHighestWeight Layer 3.

## Layer LR.1: Admissible representations, locally algebraic representations and Ext groups

Coadmissible D(G, E)-modules for non-compact G, admissible and strongly admissible locally analytic representations, the Schneider–Teitelbaum anti-equivalence and the abelian category it gives, locally algebraic representations π ⊗ W, Ext groups computed among abstract D(G, E)-modules with Breuil's identification of Ext¹ with extensions, the dual-number structure of self-extensions and tautological and universal extensions, and Schraen's computation of Ext between locally algebraic representations.

#### Coadmissible modules over the distribution algebra of a p-adic group (`coadmissible-module`, definition)

Let G be a locally F-analytic group. A left D(G, E)-module M is coadmissible if, for one (equivalently every) compact open subgroup H ⊆ G, its restriction to D(H, E) is a coadmissible module over the Fréchet–Stein algebra D(H, E) (LocallyAnalyticDistributionsPartII ND.2/coadmissible-module, ND.2/frechet-stein-distribution). It then carries the canonical Fréchet topology of the D(H, E)-module, independent of H, for which D(G, E) acts separately continuously. 𝒞_G denotes the full subcategory of Mod(D(G, E)) of coadmissible modules.

*Hypotheses and conventions.* Independence of H: for H ⊆ H′ compact open, D(H′, E) is finite free over D(H, E), so a D(H′, E)-module is coadmissible iff it is coadmissible over D(H, E) (ST03 Lemma 3.8, via ND.2/coadmissible-theorems).

*Uses.* ST03 §6, Theorem 6.3: the essential image of the dual of admissible representations; Ding, §3.1.1, p. 33: V^∨ is coadmissible over D(H, E) for any compact open H ⊆ GL_n(K); DLB17 §1.1 and §3.2: Schneider–Teitelbaum's Lemma 3.6 on submodules of coadmissible modules.

*API* (namespace `TauCeti.LocallyAnalytic`):

- `IsCoadmissible` (data): The predicate on D(G, E)-modules: coadmissible over D(H, E) for a chosen compact open H.
- `isCoadmissible_iff_restrict` (characterisation): IsCoadmissible M ↔ IsCoadmissible over D(H, E) for every compact open H.
- `Coadmissible.abelian` (instance): 𝒞_G is an abelian full subcategory of Mod(D(G, E)), closed under finite sums, kernels, cokernels and images.
- `Coadmissible.canonicalTopology` (structure): The canonical Fréchet topology, independent of H; D(G, E)-linear maps between coadmissible modules are continuous and strict.
- `Coadmissible.submodule_iff_closed` (characterisation): For N ⊆ M coadmissible: N is coadmissible ⇔ M/N is coadmissible ⇔ N is closed (ST03 Lemma 3.6).

**Checks.**

- `isCoadmissible_compact` (compatibility): For G compact, IsCoadmissible agrees with TauCeti.FrechetStein.IsCoadmissible for D(G, E) (ND.2/coadmissible-module).
- `isCoadmissible_discrete` (degenerate): For G discrete (H = {1}, D(H, E) = E) the coadmissible D(G, E) = E[G]-modules are exactly the finite-dimensional ones.
- `not_isCoadmissible_regular` (non-example): For G noncompact, D(G, E) itself is not coadmissible: as a D(H, E)-module it is free of infinite rank (one generator per coset of H).
- `isCoadmissible_character` (computation): For a locally analytic character χ of G, the one-dimensional module E on which δ_g acts by χ(g⁻¹) is coadmissible.

*Proof sketch.* Apply ND.2/coadmissible-theorems (the last statement, coadmissibility along a continuous map of Fréchet–Stein algebras with coadmissible target) to D(H, E) → D(H′, E). The canonical topology does not depend on H because D(H ∩ H′, E)-linear maps between coadmissible modules are continuous and strict (ND.2/coadmissible-theorems).

*Sources.* ST03, §6, definition of coadmissible D(G, K)-modules, p. 31: Calls a D(G, K)-module coadmissible if it is coadmissible over D(H, K) for every compact open H; because D(H′, K) is finite free over D(H, K) for H ⊆ H′, Lemma 3.8 shows one H suffices.

*Needs.* `LocallyAnalyticDistributionsPartII:ND.2/coadmissible-module`; `LocallyAnalyticDistributionsPartII:ND.2/coadmissible-theorems`; `LocallyAnalyticDistributionsPartII:ND.2/frechet-stein-distribution`; LR.0 *The distribution algebra of a locally analytic group*.

#### Admissible locally analytic representations (`admissible-representation`, definition)

A locally F-analytic representation V of G over E is admissible if V is of compact type and its strong dual V′_b, with the module structure of LR.0/compact-type-duality, is a coadmissible D(G, E)-module whose canonical topology is the strong topology (equivalently, V is admissible as a representation of one, or every, compact open subgroup). It is strongly admissible if moreover V′ is finitely generated over D(H, E) for a compact open H (Emerton). Rep^a_E(G) denotes the full subcategory of admissible representations.

*Hypotheses and conventions.* Compact type is part of the definition; for compact-type spaces Emerton's and Schneider–Teitelbaum's admissibility agree.

*Uses.* Ding, §3.1.1, p. 33: the category in which Ext^1_{GL_n(K)} is computed; Orlik–Strauch, Proposition 4.8, p. 22: F^G_P(M, V) is admissible, and strongly admissible for V of finite length; Emerton, Jacquet II, Definition 0.12: very strongly admissible representations are admissible ones with a Banach embedding; Colmez–Dospinescu–Nizioł, Remark 1.6 (route not in scope): finite length admissible representations of GL_{d+1}.

*API* (namespace `TauCeti.LocallyAnalytic`):

- `IsAdmissible` (data): The predicate on a locally analytic representation of compact type: its strong dual is coadmissible.
- `IsStronglyAdmissible` (data): The dual is finitely generated over D(H, E) for a compact open H.
- `isAdmissible_restrict` (functoriality): Restriction to an open subgroup preserves admissibility; admissibility can be tested on one compact open.
- `IsStronglyAdmissible.isAdmissible` (other): Strongly admissible implies admissible (finitely generated over a Fréchet–Stein algebra and Fréchet implies coadmissible after closing; Emerton §6.2).
- `isAdmissible_of_finiteDimensional` (example): Every finite-dimensional locally analytic representation is admissible.
- `isAdmissible_smooth` (compatibility): A smooth representation with the finest locally convex topology is admissible as a locally analytic representation iff it is admissible as a smooth representation (SR.0/admissible).
- `IsTopologicallyIrreducible` (data): V ≠ 0 has no closed G-stable subspaces other than 0 and V; for admissible V this holds iff V′ is a simple D(G, E)-module.

**Checks.**

- `isAdmissible_regular` (computation): For H compact, C^{F-an}(H, E) with left translation is admissible with dual D(H, E) free of rank one.
- `isAdmissible_zero` (degenerate): The zero representation is admissible.
- `not_isAdmissible_compactInduction` (non-example): For G noncompact, the smooth compact induction c-Ind_H^G 1 (with the finest locally convex topology) is not admissible: its H-invariants are infinite-dimensional.
- `isAdmissible_smooth_compat` (compatibility): For π smooth with the finest topology: IsAdmissible π ↔ π admissible in the sense of SmoothRepresentationsOfLocalGroups SR.0/admissible.

*Proof sketch.* Independence of the compact open subgroup is LR.1/coadmissible-module. A coadmissible module carries a unique Fréchet topology for which the action is continuous (ND.2/coadmissible-theorems), so 'with the strong topology' is a condition only on V, not extra data.

*Sources.* ST03, §6, definition of admissible G-representations, p. 33; Introduction, p. 1: Defines admissible representations as locally analytic representations on spaces of compact type with coadmissible strong dual; for noncompact G it suffices to test one compact open subgroup. EM17, §6.1, Definition 6.1.1, p. 110; §6.2, Definition 6.2.1, p. 117: Emerton's admissible and strongly admissible locally analytic representations: complete LB-spaces whose duals are finitely generated over the distribution algebras of analytic open subgroups. ST03, §6, Theorem 6.6, p. 35: An admissible-smooth representation with the finest locally convex topology is admissible, and an admissible representation with trivial derived action is admissible-smooth.

*Needs.* LR.0 *Locally analytic representations*; LR.0 *Schneider–Teitelbaum duality for representations of compact type*; LR.1 *Coadmissible modules over the distribution algebra of a p-adic group*; `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/admissible`.

*Planet:* Admissible locally analytic representation.

#### Schneider–Teitelbaum anti-equivalence (`admissible-anti-equivalence`, theorem)

The functor V ↦ V′_b is an anti-equivalence between Rep^a_E(G) and the category 𝒞_G of coadmissible D(G, E)-modules (with all D(G, E)-linear maps, which are automatically continuous for the canonical topologies).

*Proof sketch.* LR.0/compact-type-duality is an anti-equivalence onto separately continuous D(G, E)-modules on nuclear Fréchet spaces. A coadmissible module with its canonical topology is such a module (ND.2/coadmissible-theorems), and every D(G, E)-linear map between coadmissible modules is continuous, so 𝒞_G is a full subcategory of the target; by definition it is the essential image of Rep^a_E(G).

*Sources.* ST03, §6, Theorem 6.3 and its proof, pp. 33–34: The functor from admissible representations to coadmissible modules, V ↦ V′, is an anti-equivalence; the proof restricts the anti-equivalence of ST02 Corollary 3.3 to the essential image.

*Needs.* LR.1 *Admissible locally analytic representations*; LR.1 *Coadmissible modules over the distribution algebra of a p-adic group*; LR.0 *Schneider–Teitelbaum duality for representations of compact type*.

*Planet:* Schneider–Teitelbaum anti-equivalence.

#### The abelian category of admissible representations (`admissible-abelian-category`, theorem)

(i) Rep^a_E(G) is abelian; kernels and images of morphisms are the algebraic kernels and images with the subspace topology. (ii) Every morphism is strict with closed image. (iii) A closed G-stable subspace of an admissible representation is admissible, and so is the quotient by it. (iv) Dually, for a coadmissible M and a submodule N, N is coadmissible ⇔ M/N is ⇔ N is closed; a finitely generated submodule of a coadmissible module is coadmissible, finitely generated left ideals of D(H, E) are closed, and finitely presented D(G, E)-modules are coadmissible. (v) A topologically irreducible admissible V has simple dual; an admissible V has finite length if V′ is of finite length as a module, and Jordan–Hölder holds in Rep^a_E(G).

*Proof sketch.* Transport the abelian structure of 𝒞_G (ND.2/coadmissible-theorems, LR.1/coadmissible-module) through the anti-equivalence LR.1/admissible-anti-equivalence. Strictness: the dual of a coadmissible map is a continuous map between compact-type spaces whose dual is strict, so it is strict by the duality of strict morphisms (LocallyAnalyticDistributions L0/strict-morphisms-quasi-abelian). (iii) and (iv) are ST03 Lemma 3.6 transported; (v) follows from (i) and the artinian/noetherian properties of finite-length objects.

*Sources.* ST03, §6, Proposition 6.4, p. 34: Admissible representations form an abelian category with algebraic kernels and images, every map is strict with closed image, and the category is closed under passage to closed invariant subspaces. ST03, §3, Lemma 3.6, p. 11: For a coadmissible module and a submodule, coadmissibility of the submodule, of the quotient, and closedness are equivalent. DLB17, §1.1, p. 4, and §10, pp. 52, 55–56: Uses these properties of coadmissible modules and admissible representations of GL_2(ℚ_p): finitely generated submodules are coadmissible, finitely generated ideals are closed, maps have closed image.

*Needs.* LR.1 *Schneider–Teitelbaum anti-equivalence*; `LocallyAnalyticDistributionsPartII:ND.2/coadmissible-theorems`; `LocallyAnalyticDistributions:L0/strict-morphisms-quasi-abelian`.

#### Locally algebraic representations (`locally-algebraic-representation`, construction)

Let G = 𝐆(L) with 𝐆 split reductive over L and E splitting L, and let W be a finite-dimensional algebraic representation of (Res_{L/ℚ_p}𝐆) ×_{ℚ_p} E over E (equivalently of the E-group ∏_{σ∈Σ_L} 𝐆 ×_{L,σ} E), restricted to G. For a smooth admissible representation π of G over E, π ⊗_E W with the diagonal action and the finest locally convex topology is an admissible locally ℚ_p-analytic representation, called locally algebraic. The locally W-algebraic vectors of a locally analytic V are the images of Hom_g(W, V) ⊗ W → V; V is locally algebraic if it is generated by them. If π is irreducible and W is irreducible then π ⊗ W is topologically irreducible (even simple as an E[G]-module).

*Hypotheses and conventions.* E large enough that the algebraic representations of (Res_{L/ℚ_p}𝐆) ×_{ℚ_p} E are absolutely irreducible over E. π smooth admissible; without admissibility π ⊗ W is still locally analytic but not admissible.

*Uses.* Ding, §3.1.2, p. 34: π_alg(φ, h) = π_sm(φ) ⊗_E L(λ) ≅ I_sm(w(φ)) ⊗_E L(λ), the socle of every PS(w(φ), h); Ding, Proposition 3.3: Ext^1_lalg, the locally algebraic self-extensions; Emerton, Jacquet I, Proposition 4.3.6: J_P(X ⊗ W) ≅ X_N ⊗ W_N; Schraen 2011, Proposition 4.7: Ext groups between locally algebraic representations.

*API* (namespace `TauCeti.LocallyAnalytic`):

- `locallyAlgebraic` (constructor): π ⊗_E W as an admissible locally analytic representation.
- `locallyAlgebraic_isAdmissible` (other): π admissible smooth ⇒ π ⊗ W admissible.
- `locallyAlgebraic_irreducible` (characterisation): π, W irreducible ⇒ π ⊗ W topologically irreducible.
- `lalgVectors` (data): V_{W-lalg}, the image of Hom_g(W, V) ⊗ W → V, and V_lalg := ⊕_W V_{W-lalg} over irreducible W.
- `lalgVectors_functorial` (functoriality): V ↦ V_lalg is a left exact subfunctor of the identity on Rep^{la}_E(G).
- `lieAction_locallyAlgebraic` (compatibility): On π ⊗ W the derived action of g ⊗_{ℚ_p} E is 1 ⊗ (differential of W).

**Checks.**

- `locallyAlgebraic_trivialW` (degenerate): For W the trivial representation, π ⊗ W = π is smooth.
- `locallyAlgebraic_trivialPi` (degenerate): For π the trivial character, π ⊗ W = W is finite-dimensional algebraic.
- `locallyAlgebraic_reducible` (non-example): If π = π_1 ⊕ π_2 is reducible then π ⊗ W ≅ (π_1 ⊗ W) ⊕ (π_2 ⊗ W) is reducible: irreducibility of π is needed.
- `lalgVectors_ps` (computation): For GL_2(ℚ_p) and a dominant algebraic weight λ, the locally algebraic vectors of (Ind_{B^-}^G χ_sm z^λ)^an are (Ind_{B^-}^G χ_sm)^∞ ⊗ L(λ).

*Proof sketch.* π with its finest locally convex topology is an admissible locally analytic representation with trivial derived action (ST03 Theorem 6.6; EM17 Proposition 6.3.2), and the tensor product of an admissible representation with a finite-dimensional locally analytic one is admissible (EM17 Proposition 6.1.5); conversely every admissible locally W-algebraic representation is U ⊗_{End(W)} W with U admissible smooth (EM17 Proposition 6.3.10). Irreducibility (ST01 Prop. 3.4): every nonzero vector can be moved by elements of a small unipotent subgroup into E_λ ⊗ π^U (highest weight line), and E_λ ⊗ v generates E ⊗ π.

*Sources.* ST01, §3, Proposition 3.4 and its proof, p. 13: If E is an irreducible rational representation and V an irreducible smooth representation then E ⊗ V is simple as a module over the group ring; the proof uses highest weights and smooth vectors. ST01, §3, Corollary 3.5, p. 14: For split semisimple simply connected G, the U(g)-finite topologically irreducible representations are exactly E ⊗ V with E irreducible algebraic and V irreducible smooth. DING25, §3.1.2, p. 34: Defines π_alg(φ, h) = π_sm(φ) ⊗_E L(λ), an irreducible locally algebraic representation. ST03, §6, Theorem 6.6, p. 35: Admissible-smooth representations with the finest locally convex topology are admissible with trivial derived action, and admissible representations with trivial derived action are of this form. EM17, §6.1, Proposition 6.1.5, p. 112; §6.3, Propositions 6.3.2, 6.3.6, 6.3.10, pp. 122–124: Tensoring an admissible representation with a finite-dimensional one preserves admissibility; admissible U(g)-trivial representations are admissible smooth; V_{W-lalg} is closed with its finest topology; admissible locally W-algebraic representations are U ⊗_B W with U admissible smooth.

*Needs.* LR.1 *Admissible locally analytic representations*; LR.0 *The derived action of the Lie algebra*; `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/admissible`; `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-character`; Tau Ceti ReductiveGroups Layer 1; Tau Ceti LieHighestWeight Layer 4.

*Planet:* Locally algebraic representation.

#### Ext groups of admissible locally analytic representations (`ext-groups`, definition)

For admissible locally analytic representations V_1, V_2 of G over E put Ext^i_G(V_1, V_2) := Ext^i_{D(G,E)}(V_2′, V_1′), Ext computed in the abelian category Mod(D(G, E)) of all (abstract) left D(G, E)-modules. Variants: for a character χ of the centre Z(G) through which Z(G) acts on V_1 and V_2, Ext^i_{G,χ} is computed over D(G, E) ⊗_{D(Z(G),E)} χ; for locally algebraic V_1, V_2, Ext^1_lalg(V_1, V_2) ⊆ Ext^1_G(V_1, V_2) is the subspace of classes whose extension (LR.1/ext1-extensions) is locally algebraic. Ext^i_G is E-linear, contravariant in V_1 and covariant in V_2.

*Hypotheses and conventions.* Arguments are reversed: the dual is contravariant. Ext is taken among all D(G, E)-modules, not among coadmissible ones; LR.1/ext1-extensions shows that Ext^1 nevertheless classifies extensions of admissible representations.

*Uses.* Ding, Propositions 3.3, 3.6, 3.8, 3.11, 3.12, 3.16, 3.18, 3.19: every dimension count of §3.1; Schraen 2011, Corollaire 4.9: the abutment of the spectral sequence for Ext into a parabolic induction; PadicHodgeParametersInLocallyAnalyticRepresentations, contract LA1: Ext¹ with push-forward, pull-back and the Hom–Ext exact sequences.

*API* (namespace `TauCeti.LocallyAnalytic`):

- `Ext` (data): Ext^i_G(V_1, V_2) := Ext^i_{D(G,E)}(V_2′, V_1′), an E-vector space.
- `Ext.zero_eq_hom` (characterisation): Ext^0_G(V_1, V_2) ≅ Hom_G(V_1, V_2).
- `Ext.pushforward` (functoriality): A morphism V_2 → V_2′ induces Ext^i_G(V_1, V_2) → Ext^i_G(V_1, V_2′), functorially.
- `Ext.pullback` (functoriality): A morphism V_1′ → V_1 induces Ext^i_G(V_1, V_2) → Ext^i_G(V_1′, V_2), functorially.
- `Ext.covariantSequence` (relation): A short exact sequence 0 → U → V → W → 0 in Rep^a_E(G) gives the long exact sequence 0 → Hom(X, U) → Hom(X, V) → Hom(X, W) → Ext^1(X, U) → ⋯.
- `Ext.contravariantSequence` (relation): The long exact sequence in the first variable.
- `Ext.centralChar` (data): Ext^i_{G,χ}, computed over D(G, E) ⊗_{D(Z,E)} χ, with the natural map Ext^i_{G,χ} → Ext^i_G.
- `Ext.lalg` (data): Ext^1_lalg(V_1, V_2) ⊆ Ext^1_G(V_1, V_2) for locally algebraic V_1, V_2.

**Checks.**

- `Ext_trivialGroup` (degenerate): For G = 1, Ext^i_G(V_1, V_2) = 0 for i > 0 and Hom_E(V_1, V_2) for i = 0 (finite-dimensional V_i).
- `Ext_Zp_trivial` (computation): For G = ℤ_p and V_1 = V_2 = E trivial, Ext^1_G(E, E) ≅ Hom_cont(ℤ_p, E) = E, one-dimensional.
- `Ext_Qpx_vs_smooth` (non-example): For G = ℚ_p^× and the trivial character, Ext^1_G(1, 1) ≅ Hom(ℚ_p^×, E) is two-dimensional (spanned by the valuation and log_p), while the smooth Ext^1 is one-dimensional (the valuation only): locally analytic Ext is not smooth Ext.
- `Ext_zero_hom` (characterisation): Ext^0_G(V_1, V_2) = Hom_G(V_1, V_2) for admissible V_1, V_2.

*Proof sketch.* Mod(D(G, E)) is a Grothendieck abelian category with enough projectives (free modules), so Ext^i is defined (mathlib CategoryTheory.Abelian.Ext over ModuleCat D(G, E)). A strict short exact sequence of admissible representations dualises to a short exact sequence of coadmissible modules (LR.1/admissible-abelian-category), giving the long exact sequences in each variable.

*Sources.* DING25, §3.1.1, p. 33: Sets Ext^i_{GL_n(K)}(V_1, V_2) := Ext^i_{D(GL_n(K),E)}(V_2^∨, V_1^∨) in the abelian category of abstract D(GL_n(K), E)-modules, and Ext^1_lalg for locally algebraic extensions. SCH11, §3, Définition 3.1 and (3.2), p. 65: Defines Ext^n_G(V, W) = Ext^n_{M(G)}(W′, V′) in the abelian category of D(G)-modules, with a derived-category description. SCH11, §4, Corollaire 4.9, (4.38), p. 82: Uses the variant Ext_{G,χ} with fixed central character.

*Needs.* LR.1 *Schneider–Teitelbaum anti-equivalence*; LR.0 *The distribution algebra of a locally analytic group*; Mathlib `CategoryTheory.Abelian.Ext`; Mathlib `ModuleCat`.

*Planet:* Ext groups of admissible representations.

#### Ext¹ classifies extensions of admissible representations (`ext1-extensions`, theorem)

For admissible locally ℚ_p-analytic representations V_1, V_2 of G over E (on spaces of compact type), Ext^1_G(V_1, V_2) is canonically isomorphic to the group of Yoneda classes of extensions 0 → V_2 → V → V_1 → 0 in the category of admissible locally ℚ_p-analytic representations of G (strict exact sequences). The same holds for locally σ-analytic representations with D_σ(G, E) in place of D(G, E).

*Proof sketch.* An extension of admissible representations dualises to an extension of coadmissible modules, hence a class in Ext^1_{D(G,E)}. Conversely an abstract extension 0 → V_1′ → M → V_2′ → 0 of D(G, E)-modules has M coadmissible (coadmissible modules are closed under extensions: restrict to D(H, E) and use that an extension of finitely generated modules at each Banach level is finitely generated, ND.2/coadmissible-theorems), so M = V′ for an admissible V (LR.1/admissible-anti-equivalence), and V is an extension of V_1 by V_2 with strict maps (LR.1/admissible-abelian-category; compact type is preserved by strict extensions, LocallyAnalyticDistributions L0/compact-type-three-space).

*Sources.* BR19, §2.1, Lemme 2.1.1, p. 10: For admissible locally σ-analytic representations Π_1, Π_2 of compact type, the extensions of Π_1 by Π_2 in admissible locally σ-analytic representations are Ext^1 of the duals over D_σ(H, E). DING25, §3.1.1, p. 33: Cites Breuil's Lemma 2.1.1 to identify Ext^1_{GL_n(K)}(V_1, V_2) with the group of extensions of admissible locally ℚ_p-analytic representations.

*Needs.* LR.1 *Ext groups of admissible locally analytic representations*; LR.1 *The abelian category of admissible representations*; `LocallyAnalyticDistributions:L0/compact-type-three-space`.

#### Self-extensions as dual-number modules and tautological extensions (`self-extension-dual-numbers`, construction)

(i) For Ṽ ∈ Ext^1_G(V, V), the endomorphism ε : Ṽ ↠ V → V ↪ Ṽ (projection followed by inclusion) satisfies ε² = 0 and makes Ṽ a G-equivariant module over E[ε]/(ε²), free with ker ε = im ε = V. (ii) If Ext^1_G(V_1, V_2) is finite-dimensional and U ⊆ Ext^1_G(V_1, V_2) is a subspace, the tautological extension of V_1 ⊗_E U by V_2 is the extension whose class in Ext^1_G(V_1 ⊗_E U, V_2) = Hom_E(U, Ext^1_G(V_1, V_2)) is the inclusion U ↪ Ext^1_G(V_1, V_2); for U = Ext^1_G(V_1, V_2) it is the universal extension of V_1 ⊗_E Ext^1_G(V_1, V_2) by V_2. (iii) For a locally analytic character χ of an abelian group T and ψ ∈ Hom(T, E), the E[ε]/(ε²)-valued character χ(1 + ψε) is a self-extension of χ, and this gives Hom(T, E) ≅ Ext^1_T(χ, χ) (LR.4/torus-ext).

*Uses.* Ding, §3.1.1 and §3.2.2: the universal extension carries the action of the deformation ring and is matched with a subspace of Π_∞; PadicHodgeParametersInLocallyAnalyticRepresentations PH.5: A_D-actions on universal extensions and the identification of the annihilator with π_min(D); Ding, Lemma 3.5(2): pull-back along a nonsplit self-extension π̃_alg(φ, h) of π_alg(φ, h).

*API* (namespace `TauCeti.LocallyAnalytic`):

- `SelfExt.eps` (data): ε : Ṽ → Ṽ, the composite of the quotient map and the inclusion.
- `SelfExt.eps_sq` (simp): ε ∘ ε = 0.
- `SelfExt.dualNumberModule` (instance): Ṽ is a G-equivariant DualNumber E-module.
- `SelfExt.ker_eq_range` (characterisation): ker ε = range ε = V, so Ṽ is free over E[ε].
- `tautologicalExtension` (constructor): For U ⊆ Ext^1_G(V_1, V_2) finite-dimensional, the extension of V_1 ⊗ U by V_2 representing the inclusion.
- `universalExtension` (constructor): tautologicalExtension for U = Ext^1_G(V_1, V_2).
- `tautologicalExtension_functorial` (functoriality): Compatible with push-forward along V_2 → V_2′ and pull-back along U′ ⊆ U.
- `deformedCharacter` (constructor): χ(1 + ψε) as a self-extension of χ, for ψ ∈ Hom(T, E).

**Checks.**

- `tautologicalExtension_zero` (degenerate): For U = 0 the tautological extension is V_2 itself (the split extension of 0 by V_2).
- `tautologicalExtension_line` (computation): For U = E·c spanned by one class c, the tautological extension of V_1 ⊗ U ≅ V_1 by V_2 is the extension representing c.
- `SelfExt.split_free` (characterisation): For the split self-extension V ⊕ V, ε(a, b) = (0, a) and V ⊕ V ≅ V ⊗_E E[ε] as E[ε]-modules.
- `deformedCharacter_eps` (computation): On χ(1 + ψε) = E[ε] with t acting by χ(t)(1 + ψ(t)ε), the endomorphism ε is multiplication by ε, and the class in Ext^1_T(χ, χ) is ψ.

*Proof sketch.* ε² = 0 because the composite V ↪ Ṽ ↠ V is zero; ker ε = V (sub) = im ε by exactness, so Ṽ ≅ V ⊗_E E[ε] as E[ε]-modules after choosing a linear splitting. Ext^1_G(V_1 ⊗ U, V_2) = Hom_E(U, Ext^1_G(V_1, V_2)) for finite-dimensional U by additivity; the tautological extension is the Yoneda representative of the inclusion (LR.1/ext1-extensions).

*Sources.* DING25, §3.1.1, p. 34: Equips any Ṽ ∈ Ext^1(V, V) with the natural E[ε]/ε²-structure ε : Ṽ ↠ V → V ↪ Ṽ, and defines tautological and universal extensions for subspaces of a finite-dimensional Ext^1. DING25, §3.1.2, Proposition 3.3 and its proof, pp. 35–36: Uses the deformed characters w(φ)ηz^λ(1 + ψε) and their inductions as elements of Ext^1.

*Needs.* LR.1 *Ext¹ classifies extensions of admissible representations*; LR.1 *Ext groups of admissible locally analytic representations*; Mathlib `DualNumber`.

#### Ext groups between locally algebraic representations (`locally-algebraic-ext`, theorem)

Let G = 𝐆(L) with 𝐆 split reductive, F_λ, F_μ irreducible finite-dimensional algebraic representations of (Res_{L/ℚ_p}𝐆) ×_{ℚ_p} E of highest weights λ, μ, and W_1, W_2 smooth admissible representations of G. (1) If λ ≠ μ then Ext^n_G(F_λ ⊗ W_1, F_μ ⊗ W_2) = 0 for all n. (2) If W_1, W_2 have trivial central character and i_0 is the least i with Ext^i_{∞,1}(W_1, W_2) ≠ 0 (smooth Ext with trivial central character), then Ext^n_{G,λ}(F_λ ⊗ W_1, F_λ ⊗ W_2) ≅ Ext^{i_0}_{∞,1}(W_1, W_2) for n = i_0 and vanishes for n ≠ i_0, n ≤ i_0 + 2. In particular, for central character fixed, Ext^1_{lalg,Z}(π_alg, π_alg) → Ext^1_{G,Z}(π_alg, π_alg) is an isomorphism.

*Hypotheses and conventions.* Central characters fixed in (2); E large enough to split the algebraic representations.

*Proof sketch.* The centre Z(g) of U(g ⊗ E) acts on F_λ ⊗ W through the infinitesimal character of λ (LieHighestWeight Layer 7); distinct dominant λ ≠ μ have distinct infinitesimal characters, and an element of Z(g) acting by different scalars kills the Ext groups (the standard central-character argument, as for SR.0:derived-extension/central-ext-vanishing). For λ = μ, Schraen computes Ext_{G,λ} through the Hochschild–Serre spectral sequence for g ⊂ D(G) and Lie algebra cohomology of F_λ, which is concentrated in degrees where it reduces to smooth Ext (SCH11 Prop. 4.7 proof).

*Sources.* SCH11, §4, Proposition 4.7, pp. 79–80: Ext between F_λ ⊗ W_1 and F_μ ⊗ W_2 vanishes for λ ≠ μ; with trivial central characters, Ext_{G,λ} is computed by the first nonvanishing smooth Ext in a range of degrees. DING25, §3.1.2, proof of Proposition 3.3, (3.6), p. 36: Cites Schraen Proposition 4.7 for Ext^1_{lalg,Z}(π_alg, π_alg) ≅ Ext^1_{GL_n(K),Z}(π_alg, π_alg).

*Needs.* LR.1 *Ext groups of admissible locally analytic representations*; LR.1 *Locally algebraic representations*; `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension/central-ext-vanishing`; Tau Ceti LieHighestWeight Layer 7.

### Examples

- (Coadmissible modules over the distribution algebra of a p-adic group) For G compact, 𝒞_G is the category of coadmissible D(G, E)-modules of ND.2.
- (Admissible locally analytic representations) C^{F-an}(H, E) for compact H with left translation is admissible: its dual D(H, E) is free of rank one.
- (Schneider–Teitelbaum anti-equivalence) Under the anti-equivalence, the trivial representation corresponds to E with augmentation action, and C^an(H, E) to D(H, E).
- (The abelian category of admissible representations) The locally analytic principal series of GL_2(ℚ_p) of a dominant weight has the locally algebraic representation as a closed subrepresentation and an admissible quotient (LR.4).
- (Locally algebraic representations) For GL_2(ℚ_p), Sym^k E² ⊗ St is an irreducible infinite-dimensional locally algebraic representation.
- (Ext groups of admissible locally analytic representations) Ext^0_G(V_1, V_2) = Hom_G(V_1, V_2) by LR.1/admissible-anti-equivalence.
- (Ext¹ classifies extensions of admissible representations) For G = ℤ_p, the nonsplit extension of E by E with a ↦ (1 a; 0 1) corresponds to the generator of Ext^1(E, E) = E.
- (Self-extensions as dual-number modules and tautological extensions) Pushing the universal extension forward along V_2 → V_2′ and pulling back along U ⊆ Ext^1 gives the tautological extension for the image of U.
- (Ext groups between locally algebraic representations) For GL_2(ℚ_p), Ext^1(Sym^k ⊗ 1, Sym^{k'} ⊗ 1) = 0 for k ≠ k'.

### Dependencies

This layer rests on: `LocallyAnalyticDistributions:L0`; `LocallyAnalyticDistributionsPartII:ND.2`; LR.0; `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`; `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension`; Tau Ceti ReductiveGroups Layer 1; Tau Ceti LieHighestWeight Layer 4; Tau Ceti LieHighestWeight Layer 7.

## Layer LR.2: Locally analytic vectors of Banach representations and their derived functors

Admissible Banach representations of non-compact groups, G_n-analytic and locally analytic vectors, the Schneider–Teitelbaum theorem (density, strong admissibility, exactness), very strongly admissible representations, and Pan's derived functors R^iLA with the long exact sequence and the strong LA-acyclicity of admissible Banach representations.

#### Admissible Banach representations of p-adic groups (`admissible-banach-representation`, definition)

Let G be a locally ℚ_p-analytic group and E/ℚ_p finite with ring of integers O_E. A Banach representation of G over E is an E-Banach space B with a G-action by continuous linear maps such that G × B → B is continuous. It is admissible if its restriction to one (equivalently every) compact open subgroup H is admissible in the sense of LocallyAnalyticDistributionsPartII ND.6/banach-iwasawa-duality, i.e. B′ is finitely generated over E[[H]] = E ⊗_{O_E} O_E[[H]]; it is unitary if it has a G-invariant open bounded lattice. Ban^adm_E(G) is the category of admissible Banach representations with continuous G-maps; it is abelian, every morphism is strict, and B ↦ B′ is an anti-equivalence of the unitary admissible part with finitely generated E[[H]]-modules carrying a compatible G-action (Schneider–Teitelbaum).

*Hypotheses and conventions.* Admissibility does not require unitarity; finite-dimensional continuous representations are admissible Banach representations. Independence of H: for H′ ⊆ H open, E[[H]] is finite free over E[[H′]].

*Uses.* ST03 §7, Theorem 7.1: the source category of V ↦ V_an; BHS, §5.1–5.2: Π̂ = Ŝ(U^p, L)_{m^S}, an admissible unitary Banach representation of G_p, and its locally analytic vectors; Pan I, §2.2: R^iLA of admissible Banach representations; Emerton, Jacquet II, Definition 0.12: the Banach target of a very strongly admissible representation.

*API* (namespace `TauCeti.LocallyAnalytic`):

- `BanachRep` (constructor): A Banach space B with a continuous action G × B → B by linear maps.
- `BanachRep.IsAdmissible` (data): B′ finitely generated over E[[H]] for a compact open H.
- `BanachRep.IsUnitary` (data): B has a G-stable open bounded O_E-lattice.
- `BanachRep.isAdmissible_iff_restrict` (characterisation): Admissibility for G iff for one, iff for every, compact open subgroup.
- `BanachRep.abelian` (instance): Admissible Banach representations form an abelian category with strict morphisms.
- `BanachRep.ofCompact` (compatibility): For compact G, IsAdmissible agrees with ND.6/banach-iwasawa-duality.

**Checks.**

- `BanachRep.finiteDim_admissible` (computation): Every finite-dimensional continuous representation of G is an admissible Banach representation.
- `BanachRep.continuousFunctions_admissible` (computation): For compact H, C(H, E) with left translation is admissible: its dual is E[[H]], free of rank one.
- `BanachRep.trivial_c0_not_admissible` (non-example): c_0(ℕ, E) with the trivial action of ℤ_p is not admissible: its dual is not finitely generated over E[[ℤ_p]] (every element is killed by the augmentation ideal).
- `BanachRep.zero` (degenerate): The zero representation is admissible and unitary.

*Proof sketch.* For compact open H′ ⊆ H, E[[H]] is a finite free E[[H′]]-module, so finite generation of B′ over E[[H]] and over E[[H′]] are equivalent; this gives independence of H. Abelianness and strictness are ND.6/banach-iwasawa-duality for compact open H together with the open mapping theorem (LocallyAnalyticDistributions L0/banach-open-mapping-lifts).

*Sources.* ST02B, §3, definition of admissibility and Lemma 3.4, pp. 13–14: For compact G, a Banach representation is admissible when (E/L)^H is of cofinite type for a bounded invariant lattice L; equivalently the dual is finitely generated over K[[G]]. ST03, §7, p. 38: Works with admissible Banach representations of a (not necessarily compact) group G, tested on a compact open subgroup. EM17, §6.2, Proposition 6.2.4, p. 118: Considers admissible continuous representations of G on Banach spaces.

*Needs.* `LocallyAnalyticDistributionsPartII:ND.6/banach-iwasawa-duality`; `LocallyAnalyticDistributions:L0/banach-open-mapping-lifts`; LR.0 *Rational points of a smooth affine group are a locally analytic group*.

#### Analytic and locally analytic vectors of a Banach representation (`analytic-vectors`, construction)

Let B be a Banach representation of G over E, G_0 ⊆ G a compact open subgroup carrying an integral saturated p-valuation with an ordered basis (LocallyAnalyticDistributionsPartII ND.0), and G_n = G_0^{p^n}. C^an(G_n, B) is the Banach space of B-valued functions given in the coordinates of the ordered basis by power series Σ b_k x^k with p^{n|k|} b_k → 0, normed by sup ‖p^{n|k|} b_k‖, and C^an(G_n, B) ≅ C^an(G_n, ℚ_p) ⊗̂ B. The G_n-analytic vectors B^{G_n-an} are the vectors whose orbit map lies in C^an(G_n, B); equivalently B^{G_n-an} = (C^an(G_n, ℚ_p) ⊗̂ B)^{G_n} for the diagonal action, embedded in B by evaluation at 1, with the norm ‖·‖_{G_n}. B^{la} := colim_n B^{G_n-an} with the inductive-limit topology is the space of locally analytic vectors; it is G-stable, independent of G_0, carries a continuous injection B^la → B, and is a locally analytic representation of G on an LB-space. The derived g-action on B^{G_n-an} is bounded: ‖D(x)‖_{G_n} ≤ C_{D,n}‖x‖_{G_n}.

*Hypotheses and conventions.* p-valued G_0 with an ordered basis (ND.0); the norms depend on the basis, the spaces do not.

*Uses.* ST03 §7, Theorem 7.1: V_an of an admissible Banach representation; BHS §5.1–5.2: Π^an, the locally ℚ_p-analytic vectors of completed cohomology; DLB17 §1.1 and §3.2: density of locally analytic vectors in admissible Banach representations of GL_2(ℚ_p); Pan I §2.2 and LocallyAnalyticCompletedCohomology LA.0–LA.3: LA(B) = B^la, the zeroth derived locally analytic functor.

*API* (namespace `TauCeti.LocallyAnalytic`):

- `analyticVectors` (data): B^{G_n-an} with its norm ‖·‖_{G_n}, a Banach space continuously injecting into B.
- `analyticVectors_mono` (relation): B^{G_n-an} ⊆ B^{G_{n+1}-an} and ‖v‖_{G_{n+1}} ≤ ‖v‖_{G_n}.
- `laVectors` (data): B^la := colim_n B^{G_n-an}, an LB-space with a continuous G-equivariant injection into B.
- `laVectors_isLocallyAnalytic` (other): B^la is a locally analytic representation of G.
- `laVectors_independent` (characterisation): B^la does not depend on G_0 or on the ordered basis.
- `laVectors_functor` (functoriality): B ↦ B^la is a left exact functor from Banach representations to locally analytic representations.
- `laVectors_eq_of_isLocallyAnalytic` (characterisation): v ∈ B^la iff the orbit map g ↦ g·v is locally analytic B-valued.
- `lieAction_bounded` (other): Each x ∈ g acts on B^{G_n-an} by a bounded operator.

**Checks.**

- `laVectors_finiteDim` (degenerate): For finite-dimensional B, B^la = B.
- `laVectors_trivial` (degenerate): For the trivial action, B^{G_n-an} = B for all n and B^la = B.
- `laVectors_continuousFunctions` (computation): For G = ℤ_p and B = C(ℤ_p, E) with translation, B^la = C^la(ℤ_p, E), the locally analytic functions (Amice).
- `laVectors_proper` (non-example): For B = C(ℤ_p, E), B^la ≠ B: a continuous function that is not locally analytic is not a locally analytic vector.

*Proof sketch.* Independence of the ordered basis: coordinates of the first and second kind differ by power series with ℤ_p-coefficients (Pan I §2.1.1, via SCHN11 §34). B^{G_n-an} ⊆ B^{G_{n+1}-an} with ‖·‖_{G_{n+1}} ≤ ‖·‖_{G_n} (Pan I Lemma 2.1.5), so the colimit is an LB-space; G-stability follows by conjugating G_0. Orbit maps of vectors of B^{G_n-an} are analytic on cosets of G_n, so B^la is locally analytic (LR.0/locally-analytic-representation); the Lie bound is Pan I Lemma 2.1.8.

*Sources.* PAN22, §2.1.1, §2.1.4, Lemma 2.1.5, Definition 2.1.6, Remark 2.1.7, Lemma 2.1.8, pp. 10–12: Defines C^an(G_n, B), the G_n-analytic vectors as invariants of C^an(G_n, B) or by analyticity of orbit maps, B^la = ⋃ B^{G_n-an} with the direct-limit topology, independence of G_0, and the bound on the Lie action. EM17, §3.5, Definition 3.5.3, p. 64: Defines V_la as the locally convex inductive limit of V_{H-an} over analytic open subgroups H. ST03, §7, definition of V_an, p. 38: Calls v analytic if its orbit map is locally analytic, and writes V_an for these vectors.

*Needs.* LR.2 *Admissible Banach representations of p-adic groups*; LR.0 *Locally analytic representations*; `LocallyAnalyticDistributionsPartII:ND.0/p-valued-analytic-structure`; `LocallyAnalyticDistributionsPartII:ND.0/ordered-basis-chart`; `LocallyAnalyticDistributions:L0/locally-analytic-function-space`; `LocallyAnalyticDistributions:L0/locally-convex-limits`.

*Planet:* Locally analytic vectors.

#### Locally analytic vectors of admissible Banach representations (`admissible-banach-analytic-vectors`, theorem)

Let B be an admissible Banach representation of G over E. Then: (i) B^la is dense in B; (ii) B^la is a strongly admissible locally analytic representation of G; (iii) (B^la)′ = D(G, E) ⊗_{E[[H]]} B′ for a compact open H; (iv) the functor Ban^adm_E(G) → Rep^a_E(G), B ↦ B^la, is exact.

*Proof sketch.* Reduce to G compact. The dual of B^la is computed Banach level by level; D(G, E) is (faithfully) flat over E[[G]] (ND.2/faithful-flatness), which gives (iii) and the exactness (iv). (iii) shows (B^la)′ is finitely generated over D(G, E), hence (ii); faithful flatness and the injectivity E[[G]] ⊂ D(G, E) (ND.1/iwasawa-to-distributions) give injectivity of B′ → (B^la)′, i.e. density (i).

*Sources.* ST03, §7, Theorem 7.1, p. 38: For an admissible Banach representation V: V_an is dense, is strongly admissible, its dual is D(G, K) ⊗_{K[[G]]} V′, and V ↦ V_an is exact. EM17, §6.2, Proposition 6.2.4, p. 118: If V is an admissible continuous Banach representation then V_la is strongly admissible. DLB17, §1.1, p. 4: Uses the density of Π^an in Π for admissible Banach representations of GL_2(ℚ_p).

*Needs.* LR.2 *Analytic and locally analytic vectors of a Banach representation*; LR.2 *Admissible Banach representations of p-adic groups*; LR.1 *Admissible locally analytic representations*; `LocallyAnalyticDistributionsPartII:ND.2/faithful-flatness`; `LocallyAnalyticDistributionsPartII:ND.1/iwasawa-to-distributions`.

*Planet:* Schneider–Teitelbaum density theorem.

#### Very strongly admissible representations (`very-strongly-admissible`, definition)

An admissible locally analytic representation V of G over E is very strongly admissible if there is a continuous G-equivariant E-linear injection V → B into an admissible Banach representation B of G. Very strongly admissible representations are strongly admissible; for compact G the converse holds; closed subrepresentations of very strongly admissible representations are very strongly admissible; and for every admissible Banach representation Π, Π^la (= Π^an) is very strongly admissible.

*Hypotheses and conventions.* The Banach target need not be unitary.

*Uses.* Emerton, Jacquet II, Theorem 0.13: the target of the adjunction must be very strongly admissible; Ding, proof of Lemma 3.2, pp. 34–35: irreducible constituents of PS(w(φ), h) are very strongly admissible, as subrepresentations of principal series (Emerton, Jacquet II, Proposition 2.1.2); Breuil, socle II, Théorème 4.3: the adjunction for Orlik–Strauch representations needs Π very strongly admissible.

*API* (namespace `TauCeti.LocallyAnalytic`):

- `IsVeryStronglyAdmissible` (data): ∃ admissible Banach B and a continuous G-equivariant injection V → B.
- `IsVeryStronglyAdmissible.isStronglyAdmissible` (other): Very strongly admissible implies strongly admissible.
- `isVeryStronglyAdmissible_iff_compact` (characterisation): For compact G, very strongly admissible ⇔ strongly admissible.
- `IsVeryStronglyAdmissible.closedSubrep` (functoriality): Closed subrepresentations inherit very strong admissibility.
- `isVeryStronglyAdmissible_laVectors` (example): Π^la is very strongly admissible for Π admissible Banach.

**Checks.**

- `vsa_finiteDim` (computation): A finite-dimensional locally analytic representation is very strongly admissible.
- `vsa_zero` (degenerate): The zero representation is very strongly admissible.
- `vsa_laVectors` (characterisation): For Π admissible Banach, Π^la → Π exhibits Π^la as very strongly admissible.
- `vsa_compact_iff` (compatibility): For G compact, IsVeryStronglyAdmissible V ↔ IsStronglyAdmissible V (Emerton, Memoir, Proposition 6.5.9).

*Proof sketch.* Strong admissibility: the injection V → B factors through B^la, which is strongly admissible (LR.2/admissible-banach-analytic-vectors), and V is a closed subrepresentation of it (morphisms of admissible representations have closed image, LR.1/admissible-abelian-category). Π^an ⊂ Π is the required injection for Π admissible Banach.

*Sources.* EMJ2, Introduction, Definition 0.12 and the remark after it, p. 3: Defines very strongly admissible as admitting a continuous equivariant injection into an admissible continuous Banach representation; such representations are strongly admissible, and conversely for compact G (citing EM17 Proposition 6.5.9). BHS19, §5.2, p. 390: Takes Π̂^an, a very strongly admissible locally ℚ_p-analytic representation in the sense of Emerton's Definition 0.12, as the input of Emerton's adjunction.

*Needs.* LR.1 *Admissible locally analytic representations*; LR.2 *Admissible Banach representations of p-adic groups*; LR.2 *Locally analytic vectors of admissible Banach representations*.

*Planet:* Very strongly admissible representation.

#### Derived functors of locally analytic vectors (`derived-analytic-vectors`, definition)

For a Banach representation B of G (with G_0, G_n as in LR.2/analytic-vectors) put R^iLA(B) := colim_n H^i_cont(G_n, B ⊗̂_{ℚ_p} C^an(G_n, ℚ_p)), continuous group cohomology for the diagonal action. R^0LA(B) = B^la. B is LA-acyclic if R^iLA(B) = 0 for all i ≥ 1, and strongly LA-acyclic if for every i ≥ 1 the direct system (H^i_cont(G_n, B ⊗̂ C^an(G_n, ℚ_p)))_n is essentially zero (for each n the transition map to some m ≥ n is zero). These do not depend on G_0.

*Hypotheses and conventions.* Continuous cohomology of the profinite group G_n with coefficients in a Banach representation (mathlib continuousCohomology over TopModuleCat).

*Uses.* Pan I, Lemma 2.2.2 and Theorem 2.2.3: long exact sequences and acyclicity of admissible representations; BCGP25, Remark 2.2.28: the derived functor V ↦ V^{Rla} of solid representations (LR.3/solid-analytic-vectors); LocallyAnalyticCompletedCohomology LA.0–LA.2: acyclicity of locally analytic vectors on covers by small opens; CompletedCohomologyPartII CC.6/analytic-classical-comparison: the generic derived locally analytic functor of the classical comparison.

*API* (namespace `TauCeti.LocallyAnalytic`):

- `RLA` (data): R^iLA(B) as an E-vector space, functorial in B.
- `RLA_zero` (characterisation): R^0LA(B) = B^la.
- `IsLAAcyclic` (data): R^iLA(B) = 0 for all i ≥ 1.
- `IsStronglyLAAcyclic` (data): The systems (H^i_cont(G_n, B ⊗̂ C^an(G_n)))_n are essentially zero for i ≥ 1.
- `IsStronglyLAAcyclic.isLAAcyclic` (other): Strongly LA-acyclic implies LA-acyclic.
- `RLA_independent` (characterisation): R^iLA(B) does not depend on G_0.

**Checks.**

- `RLA_zero_eq_la` (characterisation): R^0LA(B) = B^la (LR.2/analytic-vectors).
- `RLA_finiteDim` (computation): For finite-dimensional B, R^iLA(B) = 0 for every i ≥ 1.
- `RLA_finiteGroup` (degenerate): For G finite (dimension 0, G_n = 1 for n ≫ 0), R^iLA(B) = 0 for i ≥ 1 and R^0LA(B) = B.
- `RLA_strong_implies` (characterisation): A strongly LA-acyclic B is LA-acyclic.

*Proof sketch.* H^0_cont(G_n, B ⊗̂ C^an(G_n)) = (C^an(G_n, B))^{G_n} = B^{G_n-an}, so R^0LA(B) = B^la. Independence of G_0: G_n for two choices are cofinal in each other, and the systems are isomorphic as ind-objects.

*Sources.* PAN22, §2.2, Definition 2.2.1, pp. 12–13: Defines R^iLA(B) as the colimit over n of H^i_cont(G_n, B ⊗̂ C^an(G_n, ℚ_p)), with LA-acyclic and strongly LA-acyclic B; these do not depend on G_0. RJRC22, §1.2.3, Theorem 1.5 and Corollary 1.6, p. 5; §4.4, Definition 4.40, p. 39: Defines the derived locally analytic vectors C^{Rla} of solid representations, whose cohomology recovers R^iLA for Banach representations, and compares continuous cohomology of V and of V^la when V has no higher locally analytic vectors.

*Needs.* LR.2 *Analytic and locally analytic vectors of a Banach representation*; Mathlib `continuousCohomology`; Mathlib `TopModuleCat`; `LocallyAnalyticDistributions:L0/projective-tensor-product`.

*Planet:* Derived locally analytic vectors.

#### Long exact sequence of derived locally analytic vectors (`la-long-exact-sequence`, theorem)

(1) A short exact sequence 0 → M_0 → M_1 → M_2 → 0 of Banach representations of G with continuous (hence strict) G-maps gives a long exact sequence 0 → M_0^la → M_1^la → M_2^la → R^1LA(M_0) → R^1LA(M_1) → R^1LA(M_2) → ⋯. (2) For a bounded complex M^• of Banach representations with strict G-maps, if each M^q and each H^q(M^•) is LA-acyclic then H^q(M^•)^la = H^q((M^•)^la). (3) If 0 → B → M^0 → M^1 → ⋯ is exact with strict maps and each M^q is LA-acyclic, then R^iLA(B) = H^i((M^•)^la); if moreover each M^q is strongly LA-acyclic and the systems (H^i((M^•)^{G_n-an}))_n are essentially zero for i ≥ 1, then B is strongly LA-acyclic.

*Proof sketch.* Strictness bounds the p-torsion in the cohomology of the unit balls, so M^• ⊗̂ C^an(G_n, ℚ_p) stays exact; taking continuous G_n-cohomology and the colimit over n gives (1). (2) and (3) follow from (1) by induction on the length, showing kernels and images are LA-acyclic.

*Sources.* PAN22, §2.2, Lemma 2.2.2 and its proof, p. 13: Gives the long exact sequence for strict short exact sequences of Banach representations, the comparison of cohomology of complexes with locally analytic vectors under LA-acyclicity, and the acyclic-resolution computation of R^iLA.

*Needs.* LR.2 *Derived functors of locally analytic vectors*; `LocallyAnalyticDistributions:L0/banach-open-mapping-lifts`; Mathlib `continuousCohomology`.

#### Admissible Banach representations are strongly LA-acyclic (`admissible-la-acyclic`, theorem)

Every admissible Banach representation B of G is strongly LA-acyclic, and so is B ⊗̂_{ℚ_p} M for every ℚ_p-Banach space M with trivial G-action. Consequently, for such B, H^i_cont(G, B) = H^i_cont(G, B^la) for all i (continuous cohomology of B equals that of its locally analytic vectors).

*Proof sketch.* Embed B G_0-equivariantly into C(G_0, ℚ_p)^{⊕d} with admissible quotient C (admissibility). C(G_0, ℚ_p) ≅ C(G_n, ℚ_p)^{⊕d_n} as G_n-representations, so its H^1 with coefficients in ⊗̂ C^an(G_n) vanishes by Shapiro's lemma; the long exact sequence (LR.2/la-long-exact-sequence) and Colmez–Dospinescu's comparison of G_n-analytic vectors with the C^{(m)} filtration show the transition maps H^1 → H^1 vanish; induct on i. For B ⊗̂ M, H^•_cont(G_n, B ⊗̂ M) = H^•_cont(G_n, B) ⊗̂ M because the cochain complex of B is strict (finite generation of H^•_cont(G_n, B°) over ℤ_p).

*Sources.* PAN22, §2.2, Theorem 2.2.3 and Corollary 2.2.4 with proofs, pp. 13–14: Admissible Banach representations are strongly LA-acyclic, via an embedding into C(G_0, ℚ_p)^{⊕d}, Shapiro's lemma and Colmez–Dospinescu's control of analytic vectors; the statement persists after completed tensor product with a trivial Banach space. RJRC22, §1.2.3, Corollary 1.6, p. 5: If V has no higher locally analytic vectors (as for admissible representations) then H^i_cont(G, V) = H^i_cont(G, V^la).

*Needs.* LR.2 *Long exact sequence of derived locally analytic vectors*; LR.2 *Admissible Banach representations of p-adic groups*; Mathlib `continuousCohomology`.

### Examples

- (Admissible Banach representations of p-adic groups) For compact G, Ban^adm_E(G) is the category of ND.6/banach-iwasawa-duality.
- (Analytic and locally analytic vectors of a Banach representation) For B finite-dimensional, B^la = B; for B = C(ℤ_p, E) with translation, B^la = C^la(ℤ_p, E) (Amice, LocallyAnalyticDistributions L0).
- (Locally analytic vectors of admissible Banach representations) For B = C(G_0, E) (G_0 compact), B^la = C^la(G_0, E) with dual D(G_0, E) = D(G_0, E) ⊗_{E[[G_0]]} E[[G_0]].
- (Very strongly admissible representations) Every finite-dimensional locally analytic representation is very strongly admissible (it is itself an admissible Banach representation).
- (Derived functors of locally analytic vectors) For B finite-dimensional, R^iLA(B) = 0 for i ≥ 1 (B ⊗ C^an(G_n) is coinduced, Shapiro's lemma).
- (Long exact sequence of derived locally analytic vectors) Applied to 0 → B → C(G_0, E)^{⊕d} → C → 0 for admissible B it is the first step of the proof of LR.2/admissible-la-acyclic.
- (Admissible Banach representations are strongly LA-acyclic) For B = C(G_0, E), R^iLA(B) = 0 for i ≥ 1 and B^la = C^la(G_0, E).

### Dependencies

This layer rests on: `LocallyAnalyticDistributions:L0`; `LocallyAnalyticDistributionsPartII:ND.0`; `LocallyAnalyticDistributionsPartII:ND.1`; `LocallyAnalyticDistributionsPartII:ND.2`; `LocallyAnalyticDistributionsPartII:ND.6`; LR.0; LR.1.

## Layer LR.3: Solid representations of p-adic groups

Boxer–Calegari–Gee–Pilloni §2.2: solid representations of Stein analytic groups by coaction and the distribution algebra D(𝔾), the Banach comparison, solid representations of locally profinite groups through the solidified group ring, smooth and λ-smooth representations with the discrete comparison and enough injectives, solid locally analytic vectors and their derived functor, and integrable LB representations of Lie algebras.

#### Solid representations of an analytic group (`solid-analytic-group-representation`, definition)

Let 𝔾 be a Stein analytic group over Spa(E, O_E) (the analytification of an affine algebraic group over E, or a quasi-compact affinoid open subgroup of one; quasi-Stein and Stein as in AdicSpacesPartII R3), with Fréchet Hopf algebra of functions O_𝔾 ∈ Mod(E). A solid representation of 𝔾 is a solid E-vector space V with a coaction c : V → V ⊗_E O_𝔾 satisfying coassociativity (c ⊗ id) ∘ c = (id ⊗ μ) ∘ c and counitality (id ⊗ e) ∘ c = id; Mod_𝔾(E) denotes their category, B_𝔾(E) and LB_𝔾(E) the full subcategories of representations on Banach and LB spaces. The distribution algebra is D(𝔾) := Hom_E(O_𝔾, E) = O_𝔾^∨, with product dual to the comultiplication, and every V ∈ Mod_𝔾(E) is a D(𝔾)-module through V ⊗ D(𝔾) → V ⊗ O_𝔾 ⊗ D(𝔾) → V. Four predicates on a group action are kept distinct: an analytic 𝔾-action (a coaction as above), a continuous action of the locally profinite group 𝔾(ℚ_p) (LR.3/solid-group-representation), analyticity at a Banach stage (LR.3/solid-analytic-vectors), and an algebraic coaction (ReductiveGroups Layer 1).

*Hypotheses and conventions.* Solid conventions (BCGP25 §2.2, recalled from Rodrigues Jacinto–Rodríguez Camargo): a fixed uncountable strong limit cardinal κ bounds all profinite sets; E/ℚ_p finite; Mod(E) is the category of solid E-vector spaces, modules over the analytic ring E_■ = (E, O_E)_■ of SolidAnalyticRings SA.4; tensor products and internal Homs are solid. This is not the predicate IsSolid on arbitrary condensed modules over a general ring.

*Uses.* BCGP25 §2.2.19: Banach representations of a quasi-compact 𝔾 are the same as Banach D(𝔾)-modules; BCGP25 §2.2.27: V^{M_r-an} = H⁰(M_r, O_{𝔾_r} ⊗ V), the analytic vectors for the polydisc subgroups 𝔾_r; BCGP25 §3.4.2: integrable LB Lie representations integrate to shrinking 𝔾_r.

*API* (namespace `TauCeti.LocallyAnalytic.Solid`):

- `SolidRep` (constructor): A solid E-vector space with a coassociative counital coaction V → V ⊗ O_𝔾.
- `SolidRep.toDistModule` (functoriality): The functor Mod_𝔾(E) → Mod(D(𝔾)), exact and faithful.
- `SolidRep.ofAlgebraic` (coercion): An algebraic representation of an affine algebraic group, with the analytified coaction.
- `SolidRep.Banach` (data): The full subcategory B_𝔾(E) of representations on Banach spaces.
- `SolidRep.restrict` (functoriality): Restriction along an open analytic subgroup 𝔾′ ⊆ 𝔾 (pull back along O_𝔾 → O_{𝔾′}).

**Checks.**

- `SolidRep.trivial` (degenerate): The trivial representation E with c(v) = v ⊗ 1 is a solid representation, and D(𝔾) acts on it through the augmentation (evaluation at e).
- `SolidRep.algebraic_compat` (compatibility): For 𝔾 = 𝔾_m^an and V = E with c(v) = v ⊗ T^k, the restriction to ℤ_p^× = 𝔾_m(ℤ_p)-points is the algebraic character x ↦ x^k.
- `SolidRep.regular` (computation): O_𝔾 with c = μ is a solid representation (the right regular representation), and its D(𝔾)-module structure is the convolution action.
- `SolidRep.not_profinite_rep` (non-example): A representation of the locally profinite group 𝔾(ℚ_p) need not come from a coaction of 𝔾: the character of ℤ_p trivial on p²ℤ_p and nontrivial on pℤ_p is smooth but not analytic for 𝔾 = ℤ_p + p𝔻, since a rigid function on the disc p𝔻 that is locally constant on pℤ_p is constant.

*Proof sketch.* The coaction axioms are those of an algebraic comodule (ReductiveGroups Layer 1) with O_𝔾 a Fréchet Hopf algebra in Mod(E). The D(𝔾)-module structure is the composite of the coaction with evaluation O_𝔾 ⊗ D(𝔾) → E, associative because the product of D(𝔾) is dual to μ.

*Sources.* BCGP25, §2.2.15–2.2.18, Definition 2.2.17 and Remark 2.2.18, pp. 21–22: Recalls algebraic representations as comodules, defines quasi-Stein and Stein adic spaces, and for a Stein analytic group defines solid representations by an O_G-coaction, the distribution algebra D(G) = Hom(O_G, E) and the functor to D(G)-modules. RJRC22, §1.2.2, pp. 3–4: Defines analytic and locally analytic vectors of solid representations via affinoid and Stein group neighbourhoods, with C(𝔾, K) and D(𝔾, K) = O(𝔾)^∨.

*Needs.* `SolidAnalyticRings:SA.4`; `SolidAnalyticRings:SA.1`; `AdicSpacesPartII:R3/quasi-stein-space`; `AdicSpacesPartII:R3/quasi-stein-theorems-a-b`; Tau Ceti ReductiveGroups Layer 1; `SolidAnalyticRings:SA.2`.

#### Banach representations of a quasi-compact analytic group (`banach-analytic-comparison`, theorem)

For a quasi-compact analytic group 𝔾 and a Banach space V, Hom_E(D(𝔾), V) = O_𝔾 ⊗_E V; consequently every D(𝔾)-module structure on V comes from a unique coaction, and the functor of LR.3/solid-analytic-group-representation restricts to an equivalence B_𝔾(E) ≃ B(D(𝔾)) between Banach representations of 𝔾 and D(𝔾)-modules whose underlying space is Banach.

*Hypotheses and conventions.* Solid conventions (BCGP25 §2.2, recalled from Rodrigues Jacinto–Rodríguez Camargo): a fixed uncountable strong limit cardinal κ bounds all profinite sets; E/ℚ_p finite; Mod(E) is the category of solid E-vector spaces, modules over the analytic ring E_■ = (E, O_E)_■ of SolidAnalyticRings SA.4; tensor products and internal Homs are solid. This is not the predicate IsSolid on arbitrary condensed modules over a general ring. Quasi-compactness of 𝔾 makes O_𝔾 a Banach space and D(𝔾) a Smith space; this is the input taken from the solid functional analysis recorded in the gap 'Solid functional analysis'.

*Proof sketch.* D(𝔾) = O_𝔾^∨ is a Smith space, so Hom_E(D(𝔾), V) = O_𝔾 ⊗_E V for Banach V (RJRC22 Corollary 3.17). A module map D(𝔾) ⊗ V → V corresponds to V → Hom(D(𝔾), V) = O_𝔾 ⊗ V, and the module axioms correspond to the comodule axioms.

*Sources.* BCGP25, §2.2, Remark 2.2.19, p. 22: For quasi-compact G and Banach V, Hom(D(G), V) = O_G ⊗ V (citing RJRC22 Corollary 3.17), so D(G)-module structures on V give G-actions and B_G(E) ≃ B(D(G)). RJRC22, §3, Corollary 3.17: For V Banach and W Smith, the internal Hom and tensor product are related so that Hom(W, V) = W^∨ ⊗ V; applied with W = D(𝔾) a Smith space.

*Needs.* LR.3 *Solid representations of an analytic group*; `SolidAnalyticRings:SA.4`.

#### Solid representations of a locally profinite group (`solid-group-representation`, definition)

Let M be a locally profinite group, viewed as a condensed group, E[M] its condensed group ring and E_■[M] its solidification: for compact M, E_■[M] = (lim_N O_E[M/N])[1/p] over open normal N; in general E_■[M] = E[M] ⊗_{E[M_0]} E_■[M_0] for any compact open M_0 ⊆ M. A representation of M on a solid E-vector space is a solid E_■[M]-module; equivalently a solid E-vector space V with an action map M × V → V of condensed sets satisfying the group action axioms. Mod_M(E) denotes this category.

*Hypotheses and conventions.* Solid conventions (BCGP25 §2.2, recalled from Rodrigues Jacinto–Rodríguez Camargo): a fixed uncountable strong limit cardinal κ bounds all profinite sets; E/ℚ_p finite; Mod(E) is the category of solid E-vector spaces, modules over the analytic ring E_■ = (E, O_E)_■ of SolidAnalyticRings SA.4; tensor products and internal Homs are solid. This is not the predicate IsSolid on arbitrary condensed modules over a general ring.

*Uses.* BCGP25 §2.2.23–2.2.27: the ambient category of smooth, λ-smooth and locally analytic solid representations; BCGP25 §3–4 (higher Coleman theory): solid representations of M = T^+(ℚ_p), G(ℚ_p) on coherent cohomology complexes.

*API* (namespace `TauCeti.LocallyAnalytic.Solid`):

- `SolidGroupRing` (data): E_■[M] for a locally profinite M.
- `SolidGroupRing.ofCompact` (characterisation): For compact M, E_■[M] = (lim_N O_E[M/N])[1/p].
- `SolidGroupRing.induced` (characterisation): E_■[M] = E[M] ⊗_{E[M_0]} E_■[M_0] for every compact open M_0.
- `SolidMRep` (constructor): A solid E_■[M]-module.
- `SolidMRep.ofContinuous` (coercion): A continuous representation on a complete locally convex space gives a solid representation.
- `SolidMRep.abelian` (instance): Mod_M(E) is abelian, with all limits and colimits, computed on underlying solid spaces.

**Checks.**

- `SolidGroupRing.trivial` (degenerate): For M = 1, E_■[M] = E and Mod_M(E) = Mod(E).
- `SolidGroupRing.finite` (computation): For M finite, E_■[M] = E[M], the usual group algebra.
- `SolidGroupRing.Zp` (computation): For M = ℤ_p, E_■[M] = O_E[[T]][1/p] with T = [1] − 1 (Iwasawa algebra, weak topology).
- `SolidMRep.ofContinuous_compat` (compatibility): For a continuous Banach representation B of a compact M, the E_■[M]-module structure restricts on E[M] to the given action, and on the classical Iwasawa algebra to the action of ND.6/banach-iwasawa-duality.

*Proof sketch.* For compact M, E_■[M] is the rational Iwasawa algebra with its weak (compact) topology as a solid algebra; the induction formula defines E_■[M] for general M independently of M_0 because E_■[M_0] is free over E_■[M_1] for M_1 ⊆ M_0 open (finite index). Action maps M × V → V of condensed sets correspond to E[M]-module structures, and solidity of V makes them extend uniquely to E_■[M].

*Sources.* BCGP25, §2.2.20, Definition 2.2.21 and Remark 2.2.22, p. 22: Defines E_■[M] as the solidified group ring (an inverse limit of rational group rings for compact M, induced from a compact open in general) and representations as solid E_■[M]-modules, equivalently condensed action maps. RJRC22, §1.2.2, p. 3: For compact G, K_■[G] = (lim O_K[G/N])[1/p], the classical Iwasawa algebra with the weak topology; G-representations on solid spaces are solid K_■[G]-modules, and continuous representations on complete locally convex spaces embed.

*Needs.* `SolidAnalyticRings:SA.1`; `SolidAnalyticRings:SA.4`; LR.0 *Rational points of a smooth affine group are a locally analytic group*; `PadicMeasuresIwasawaAlgebras:L1/finite-projection`.

*Planet:* Solid representation.

#### Smooth and λ-smooth solid representations (`solid-smooth-representation`, definition)

For V ∈ Mod_M(E) put V^sm := colim_N V^N over compact open subgroups N ⊆ M (invariants in Mod(E)); V is smooth if V^sm → V is an isomorphism; Mod^sm_M(E) is the full subcategory of smooth representations. For a continuous character λ : M → E^× and E(−λ) the corresponding one-dimensional representation of λ^{-1}, V is λ-smooth if V ⊗_E E(−λ) is smooth; Mod^{λ-sm}_M(E) is the category of λ-smooth representations, and if λ ⊗ λ′^{-1} is smooth then Mod^{λ-sm}_M(E) and Mod^{λ′-sm}_M(E) are canonically equivalent (equal as subcategories).

*Hypotheses and conventions.* Solid conventions (BCGP25 §2.2, recalled from Rodrigues Jacinto–Rodríguez Camargo): a fixed uncountable strong limit cardinal κ bounds all profinite sets; E/ℚ_p finite; Mod(E) is the category of solid E-vector spaces, modules over the analytic ring E_■ = (E, O_E)_■ of SolidAnalyticRings SA.4; tensor products and internal Homs are solid. This is not the predicate IsSolid on arbitrary condensed modules over a general ring.

*Uses.* BCGP25 §2.2.24–2.2.25: the comparison with the discrete group and enough injectives; BCGP25 §2.2.27: V^sm ⊆ V^la ⊆ V; BCGP25 §3–4: λ-smooth T^+-representations for weights λ in higher Coleman theory.

*API* (namespace `TauCeti.LocallyAnalytic.Solid`):

- `smoothPart` (data): V^sm := colim_N V^N with the natural map to V.
- `IsSmooth` (data): V^sm → V is an isomorphism.
- `IsLambdaSmooth` (data): V ⊗ E(−λ) is smooth.
- `isLambdaSmooth_iff_of_smooth_ratio` (characterisation): If λ/λ′ is smooth then IsLambdaSmooth λ V ↔ IsLambdaSmooth λ′ V.
- `smoothPart_functor` (functoriality): V ↦ V^sm is right adjoint to the inclusion of smooth representations.
- `smoothPart_compat` (compatibility): On discrete representations V^sm is the smooth part of SR.0/smooth-vectors.

**Checks.**

- `IsSmooth.trivial` (degenerate): The trivial representation E is smooth; for M = 1 every representation is smooth.
- `not_IsSmooth_algebraic` (non-example): For M = ℤ_p^× and k ≠ 0, the character x ↦ x^k on E is not smooth (no open subgroup acts trivially), but it is x^k-smooth.
- `IsLambdaSmooth.self` (computation): The character λ itself, as a representation E(λ), is λ-smooth.
- `smoothPart_compat_discrete` (compatibility): For a smooth representation π of SR.0 with the discrete condensed structure, smoothPart π = π.

*Proof sketch.* V^N is a closed subobject of V in Mod(E); filtered colimits exist, so V^sm is defined, with a natural map to V. If λ/λ′ is smooth then V ⊗ E(−λ) and V ⊗ E(−λ′) differ by tensoring with a smooth character, which preserves smoothness.

*Sources.* BCGP25, §2.2.23, p. 22: Defines V^sm = colim_N V^N over compact open subgroups and smoothness as V^sm ≅ V. BCGP25, §2.2, Definition 2.2.26 and the following note, p. 23: Defines λ-smooth representations by smoothness of V ⊗ E(−λ), and notes that characters with smooth ratio give canonically equivalent categories.

*Needs.* LR.3 *Solid representations of a locally profinite group*; `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/is-smooth`; `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-vectors`.

#### Smooth solid representations are smooth representations of the discrete group (`solid-smooth-discrete-comparison`, theorem)

Let M_disc be M with the discrete topology and Mod^sm_{M_disc}(E) the category of E[M_disc]-modules V in Mod(E) with V = colim_N V^{N_disc}. Restriction along M_disc → M induces an equivalence Mod^sm_M(E) ≃ Mod^sm_{M_disc}(E).

*Hypotheses and conventions.* Solid conventions (BCGP25 §2.2, recalled from Rodrigues Jacinto–Rodríguez Camargo): a fixed uncountable strong limit cardinal κ bounds all profinite sets; E/ℚ_p finite; Mod(E) is the category of solid E-vector spaces, modules over the analytic ring E_■ = (E, O_E)_■ of SolidAnalyticRings SA.4; tensor products and internal Homs are solid. This is not the predicate IsSolid on arbitrary condensed modules over a general ring.

*Proof sketch.* The functor Mod_M(E) → Mod_{M_disc}(E) preserves smoothness. Inverse: for smooth V over M_disc and a cofinal system of open normal M_n ⊆ M_0, V^{M_n} is an E[M_0/M_n]-module and (M_0)_disc/(M_n)_disc = M_0/M_n, so the action extends uniquely to M_0; pass to the colimit and use E[M] = E[M_disc] ⊗_{E[(M_0)_disc]} E[M_0].

*Sources.* BCGP25, §2.2.23, Lemma 2.2.24 and its proof, p. 22: The categories of smooth solid M-representations and of smooth M_disc-representations are equivalent: on N-invariants for open normal N ⊆ M_0 the M_0/N-action is that of a finite group, so the discrete action extends uniquely.

*Needs.* LR.3 *Smooth and λ-smooth solid representations*; LR.3 *Solid representations of a locally profinite group*.

#### Smooth solid representations form a Grothendieck category (`solid-smooth-grothendieck`, theorem)

With the fixed cardinal bound κ on profinite sets, Mod^sm_M(E) is a Grothendieck abelian category; ⊕_{S,N} E_■[M] ⊗_{E_■[N]} E_■[S] over κ-small profinite (totally disconnected) S and compact open N ⊆ M (with N acting trivially on E_■[S]) is a generator, since Hom(E_■[M] ⊗_{E_■[N]} E_■[S], V) = V^N(S). In particular Mod^sm_M(E) has enough injectives.

*Hypotheses and conventions.* Solid conventions (BCGP25 §2.2, recalled from Rodrigues Jacinto–Rodríguez Camargo): a fixed uncountable strong limit cardinal κ bounds all profinite sets; E/ℚ_p finite; Mod(E) is the category of solid E-vector spaces, modules over the analytic ring E_■ = (E, O_E)_■ of SolidAnalyticRings SA.4; tensor products and internal Homs are solid. This is not the predicate IsSolid on arbitrary condensed modules over a general ring.

*Proof sketch.* Colimits exist and filtered colimits are exact (AB5) because both hold in Mod(E) and invariants under compact open N commute with filtered colimits of smooth objects. The displayed generator corepresents V ↦ V^N(S); every V is a quotient of a sum of these. A Grothendieck abelian category has enough injectives.

*Sources.* BCGP25, §2.2, Lemma 2.2.25 and its proof, pp. 22–23: The category of smooth solid representations is Grothendieck abelian with generator built from compact inductions of free solid modules on profinite sets, hence has enough injectives (Stacks Tag 079H). BCGP25, §2.2, paragraph before Lemma 2.2.25, p. 22: The argument uses the set-theoretic restriction to κ-small profinite sets.

*Needs.* LR.3 *Smooth solid representations are smooth representations of the discrete group*; LR.3 *Smooth and λ-smooth solid representations*; `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension/grothendieck-abelian`.

#### Locally analytic vectors of solid representations (`solid-analytic-vectors`, construction)

Assume M = 𝔾(ℚ_p) for an analytic group 𝔾 over Spa(ℚ_p, ℤ_p) with a fundamental system of quasi-compact open subgroups 𝔾_r (r ≥ 0), each a polydisc, and put M_r := 𝔾_r(ℚ_p), a fundamental system of compact open subgroups. For V ∈ Mod_M(E), O_{𝔾_r} ⊗_E V carries three commuting actions of M_r: ∗_l (left translation on 𝔾_r), ∗_r (right translation) and ∗_V (from V; this one extends to M, which acts on {M_r} by conjugation). Define V^{M_r-an} := H^0(M_r, O_{𝔾_r} ⊗ V) for the diagonal action ∗_l ⊗ ∗_V; it keeps the residual action ∗_r of M_r, which commutes with ∗_l ⊗ ∗_V, and evaluation at e gives an M_r-equivariant injection V^{M_r-an} → V. Then V^la := colim_r V^{M_r-an} ∈ Mod_M(E), with natural injections V^sm → V^la → V. The derived functor is V^{Rla} := hocolim_r RHom_{E_■[M_r]}(E, V ⊗^L O_{𝔾_r}) (Rodrigues Jacinto–Rodríguez Camargo), with H^0(V^{Rla}) = V^la; for V a Banach representation, V^la is the classical space of locally analytic vectors (LR.2/analytic-vectors) and H^i(V^{Rla}) = R^iLA(V) (LR.2/derived-analytic-vectors).

*Hypotheses and conventions.* Solid conventions (BCGP25 §2.2, recalled from Rodrigues Jacinto–Rodríguez Camargo): a fixed uncountable strong limit cardinal κ bounds all profinite sets; E/ℚ_p finite; Mod(E) is the category of solid E-vector spaces, modules over the analytic ring E_■ = (E, O_E)_■ of SolidAnalyticRings SA.4; tensor products and internal Homs are solid. This is not the predicate IsSolid on arbitrary condensed modules over a general ring. The polydisc subgroups 𝔾_r come from an ordered-basis chart of a uniform open subgroup (RJRC22 Remark 1.4), consistent with the G_n of LR.2/analytic-vectors.

*Uses.* BCGP25 §2.2.27–2.2.28: locally analytic vectors and the derived functor V^{Rla} of solid representations; BCGP25 §§3–4: derived locally analytic vectors of completed cohomology complexes and the comparison with coherent cohomology; CompletedCohomologyPartII CC.6/analytic-classical-comparison: RHom_g(W^∨, RΓ_{completed, la}) uses derived locally analytic vectors of a complex.

*API* (namespace `TauCeti.LocallyAnalytic.Solid`):

- `analyticVectorsSolid` (data): V^{M_r-an} := H⁰(M_r, O_{𝔾_r} ⊗ V) with its residual M_r-action.
- `laVectorsSolid` (data): V^la := colim_r V^{M_r-an} in Mod_M(E).
- `smoothPart_le_la_le` (relation): Natural injections V^sm → V^la → V.
- `derivedLaVectors` (data): V^{Rla} := hocolim_r RHom_{E_■[M_r]}(E, V ⊗^L O_{𝔾_r}) in D(E_■[M]).
- `derivedLaVectors_zero` (characterisation): H⁰(V^{Rla}) = V^la.
- `laVectorsSolid_banach` (compatibility): For V Banach, laVectorsSolid V is LR.2/analytic-vectors' B^la (as a solid space) and H^i(V^{Rla}) = R^iLA(V).
- `laVectorsSolid_functor` (functoriality): V ↦ V^la is a left exact functor Mod_M(E) → Mod_M(E), M-equivariant for conjugation of the 𝔾_r.

**Checks.**

- `laVectorsSolid_smooth` (computation): For V smooth, V^sm = V^la = V.
- `laVectorsSolid_trivial` (degenerate): For the trivial representation E, V^{M_r-an} = E for every r.
- `laVectorsSolid_banach_compat` (compatibility): For B = C(ℤ_p, E) with translation, laVectorsSolid B = C^la(ℤ_p, E), as in LR.2/analytic-vectors.
- `laVectorsSolid_not_all` (non-example): For B = C(ℤ_p, E), V^la → V is not surjective.

*Proof sketch.* O_{𝔾_r} ⊗ V is a solid M_r-representation for each of the three actions; invariants for ∗_l ⊗ ∗_V are a left exact functor. Evaluation at e intertwines ∗_r ⊗ ∗_V on the invariants with ∗_V on V and is injective (a function invariant under the diagonal action is determined by its value at e). For Banach V, O_{𝔾_r} ⊗ V is the completed projective tensor product (RJRC22 §1.2.2), so the invariants are V^{G_r-an} of LR.2/analytic-vectors; the derived version is computed by continuous cohomology, giving R^iLA.

*Sources.* BCGP25, §2.2.27 and Remark 2.2.28, p. 23: Defines V^{M_r-an} as H⁰(M_r, O_{G_r} ⊗ V) for the diagonal of left translation and the given action, notes the surviving right-translation action, defines V^la as the colimit with V^sm → V^la → V, and refers to RJRC22 §4.4 for the derived functor V^{Rla}. RJRC22, §4.4, Definition 4.40, p. 39; §1.2.2, p. 4; Theorem 1.5, p. 5: Defines V^la and C^{Rla} as colimit and homotopy colimit of (derived) analytic vectors over the group neighbourhoods G(h), notes that H⁰(V^{Rla}) is Emerton's V_la for Banach V, and compares group cohomology with that of derived locally analytic vectors.

*Needs.* LR.3 *Solid representations of a locally profinite group*; LR.3 *Solid representations of an analytic group*; LR.3 *Smooth and λ-smooth solid representations*; LR.2 *Analytic and locally analytic vectors of a Banach representation*; LR.2 *Derived functors of locally analytic vectors*; `LocallyAnalyticDistributionsPartII:ND.0/ordered-basis-chart`.

*Planet:* Solid locally analytic vectors.

#### Integrable LB representations of a Lie algebra (`integrable-lb-lie-representation`, definition)

Let g be the Lie algebra of the analytic group 𝔾 of LR.3/solid-analytic-vectors, Q ⊇ B a parabolic with Lie algebra q, O(g, q) the parabolic category O (the Levi acts locally finitely and the Cartan semisimply), λ a character of q, and O(g, q)_{λ-alg} the subcategory whose weights differ from λ by algebraic characters. An LB representation of g is integrable if it admits a presentation V = colim_r V_r by an increasing sequence of Banach subspaces with injective transition maps, each V_r stable under g and integrating to an analytic action of 𝔾_r (for r large) whose derivative is the given g-action, compatibly with the restriction maps 𝔾_{r+1} ⊆ 𝔾_r. Integrable LB representations form a full subcategory of g-modules on LB spaces; the integration is unique when it exists.

*Hypotheses and conventions.* Solid conventions (BCGP25 §2.2, recalled from Rodrigues Jacinto–Rodríguez Camargo): a fixed uncountable strong limit cardinal κ bounds all profinite sets; E/ℚ_p finite; Mod(E) is the category of solid E-vector spaces, modules over the analytic ring E_■ = (E, O_E)_■ of SolidAnalyticRings SA.4; tensor products and internal Homs are solid. This is not the predicate IsSolid on arbitrary condensed modules over a general ring. Category O(g, q) is the algebraic category O of the gap 'Category O and Kostant homology'; this node only uses its definition.

*Uses.* BCGP25 §3.4–3.5: the analytic localisation of category O objects and the comparison with locally analytic vectors in higher Coleman theory.

*API* (namespace `TauCeti.LocallyAnalytic.Solid`):

- `IsIntegrable` (data): An LB g-module admits a Banach filtration integrating to compatible 𝔾_r-actions.
- `IsIntegrable.integrate` (constructor): The resulting locally analytic action of M_r on V (r large).
- `IsIntegrable.unique` (extensionality): Two integrations of the same g-action agree on 𝔾_r for r large.
- `IsIntegrable.laVectors` (compatibility): For an integrable V, V = V^la for the integrated action (LR.3/solid-analytic-vectors).

**Checks.**

- `IsIntegrable.finiteDim` (computation): A finite-dimensional algebraic representation of 𝔾 is integrable.
- `IsIntegrable.zero` (degenerate): The zero module is integrable.
- `not_IsIntegrable_verma` (non-example): A Verma module M(μ) for g = sl_2 with its finest LB structure is not integrable: an integrable module is a union of finite-dimensional 𝔾_r-stable subspaces only when it is locally finite, and f acts freely on M(μ), so M(μ) has no nonzero finite-dimensional g-stable subspace; with the finest topology every Banach subspace of the countable-dimensional M(μ) is finite-dimensional.

*Proof sketch.* Uniqueness of the integration: two analytic 𝔾_r-actions with the same derivative agree on 𝔾_r for r large (the exponential is a local isomorphism near 0; LR.0/rational-points-analytic-group). Banach analytic representations are Banach D(𝔾_r)-modules (LR.3/banach-analytic-comparison), so integrability is a condition on the g-action extending to D(𝔾_r) on V_r.

*Sources.* BCGP25, §3.4.2, p. 53: Introduces parabolic category O(g, q), its λ-algebraic subcategory, and LB representations of g with an injective Banach filtration integrating to shrinking subgroups G_r, compatible with restriction and with the differentiated action.

*Needs.* LR.3 *Locally analytic vectors of solid representations*; LR.3 *Banach representations of a quasi-compact analytic group*; LR.0 *The derived action of the Lie algebra*.

*Planet:* Integrable LB Lie representation.

### Examples

- (Solid representations of an analytic group) For 𝔾 the analytification of an affine algebraic group and V finite-dimensional, a solid representation is an algebraic representation followed by analytification of the coaction.
- (Banach representations of a quasi-compact analytic group) For 𝔾 = 1 both sides are the category of Banach spaces.
- (Solid representations of a locally profinite group) A continuous representation of M on a complete locally convex E-vector space gives, through the condensed-set functor, an object of Mod_M(E).
- (Smooth and λ-smooth solid representations) For V discrete (a smooth representation of SmoothRepresentationsOfLocalGroups SR.0 with the discrete condensed structure), V is smooth in this sense.
- (Smooth solid representations are smooth representations of the discrete group) For M = ℤ_p the smooth objects on both sides are colimits of representations of the finite groups ℤ/p^n.
- (Smooth solid representations form a Grothendieck category) For E-vector spaces with the discrete structure the generator reduces to the compact inductions c-Ind_N^M E used in SmoothRepresentationsOfLocalGroups SR.0:derived-extension/grothendieck-abelian.
- (Locally analytic vectors of solid representations) For V = O_{𝔾_0} with the right regular action, V^{M_0-an} = V.
- (Integrable LB representations of a Lie algebra) A finite-dimensional algebraic representation of 𝔾 is integrable for the constant filtration.

### Dependencies

This layer rests on: `AdicSpacesPartII:R3`; `LocallyAnalyticDistributionsPartII:ND.0`; LR.0; LR.2; `PadicMeasuresIwasawaAlgebras:L1`; `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`; `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension`; `SolidAnalyticRings:SA.1`; `SolidAnalyticRings:SA.2`; `SolidAnalyticRings:SA.4`; Tau Ceti ReductiveGroups Layer 1.

## Layer LR.4: Locally analytic parabolic induction, principal series and Schraen's spectral sequence

Locally analytic parabolic induction and its admissibility, transitivity and locally algebraic and σ-analytic variants, locally analytic principal series, Ext between locally analytic characters of a torus, homology under a unipotent radical, and Schraen's spectral sequence for Ext into a parabolic induction.

#### Locally analytic parabolic induction (`locally-analytic-induction`, construction)

Let G = 𝐆(L) with 𝐆 connected reductive over L, P = M_P N_P a parabolic subgroup (so P\G is compact by the Iwasawa decomposition G = P·K_0, ReductiveGroupsPartII RG2.4), and U a locally F-analytic representation of P on a space of compact type. The locally analytic induction is (Ind_P^G U)^{F-an} := {f ∈ C^{F-an}(G, U) : f(pg) = p·f(g) for p ∈ P, g ∈ G}, with G acting by right translation (g·f)(h) = f(hg). It is a closed subspace of C^{F-an}(G, U), of compact type, and a locally F-analytic representation of G. If U is admissible (respectively strongly admissible, very strongly admissible) so is the induction. Induction is transitive, (Ind_P^G (Ind_Q^P U)^an)^an ≅ (Ind_Q^G U)^an for Q ⊆ P, exact on strict short exact sequences, and contains (Ind_P^G π)^∞ ⊗ W, the locally algebraic induction (Ind_P^G π ⊗ W|_P)^{lalg}, for π smooth admissible of M_P inflated to P and W algebraic of 𝐆. Parabolic inductions are unnormalised ('droites'). For F = ℚ_p and σ ∈ Σ_L the locally σ-analytic induction (Ind_P^G U)^{σ-an} ⊆ (Ind_P^G U)^{ℚ_p-an} consists of the functions whose derived g ⊗_{ℚ_p} E-action factors through g_σ (LR.9/sigma-analytic-representation).

*Hypotheses and conventions.* P\G compact (Iwasawa decomposition), so that functions are determined on a compact set and the induction is of compact type. U of compact type; for U Banach the induction is a space of compact type only after passing to locally analytic functions.

*Uses.* Ding, §3.1.2–3.1.4: PS(w(φ), h), the parabolic inductions (3.19) and their σ-analytic variants; Orlik–Strauch §3, Breuil socle I (4): F^G_P(M, π_P) is a closed subrepresentation of (Ind_P^G W′ ⊗ π_P)^an; Emerton, Jacquet II, §2: the closed induction I_P^G(U) ⊆ Ind_P^G U and the adjunction; LocallyAnalyticCompletedCohomology (Pan II §5.1.10): locally analytic induction from the Borel of GL_2(ℚ_p) as an equivariant sheaf on ℙ^1(ℚ_p).

*API* (namespace `TauCeti.LocallyAnalytic`):

- `laInd` (constructor): (Ind_P^G U)^{F-an} as a locally analytic representation of G.
- `laInd_isAdmissible` (other): U admissible (strongly, very strongly) ⇒ (Ind_P^G U)^an admissible (strongly, very strongly).
- `laInd_trans` (relation): (Ind_P^G (Ind_Q^P U)^an)^an ≅ (Ind_Q^G U)^an for Q ⊆ P.
- `laInd_exact` (functoriality): U ↦ (Ind_P^G U)^an is an exact functor on strict short exact sequences, compatible with morphisms.
- `laInd_lalg` (compatibility): (Ind_P^G π)^∞ ⊗ W ↪ (Ind_P^G (π ⊗ W|_P))^an, with image the locally algebraic induction.
- `laInd_sigma` (data): (Ind_P^G U)^{σ-an} ⊆ (Ind_P^G U)^{ℚ_p-an} for σ ∈ Σ_L.
- `laInd_dual` (characterisation): ((Ind_P^G U)^an)′ ≅ D(G, E) ⊗_{D(P, E)} U′ as D(G, E)-modules.
- `laInd_smooth_compat` (compatibility): For U smooth admissible, the smooth vectors of (Ind_P^G U)^an are the smooth induction (Ind_P^G U)^∞ of SR.2/smooth-induction.

**Checks.**

- `laInd_trivial_P` (degenerate): For P = G, (Ind_G^G U)^an = U.
- `laInd_GL2_P1` (computation): For G = GL_2(ℚ_p), P = B^- and a character χ, (Ind_{B^-}^G χ)^an ≅ C^an(ℙ^1(ℚ_p), E) as a topological vector space.
- `laInd_trivialChar_contains_constants` (computation): For U = 1 the trivial character, (Ind_P^G 1)^an contains the constant functions as the unique closed one-dimensional subrepresentation.
- `laInd_not_smooth` (non-example): For a locally analytic but non-smooth character χ = z^λ (λ ≠ 0 algebraic), (Ind_{B^-}^G χ)^an has no nonzero smooth vectors, whereas (Ind χ)^∞ is defined only for smooth χ.

*Proof sketch.* Choose a locally analytic section of G → P\G over a finite disjoint cover by compact opens (P\G compact, RG2.4/iwasawa-decomposition); this identifies the induction with C^{F-an}(P\G, U) as a topological vector space, hence of compact type (LocallyAnalyticDistributions L0). Right translation is locally analytic (orbit maps of f are locally analytic in g by the chart description); admissibility is EMJ2 Prop. 2.1.2: the dual is D(G, E) ⊗_{D(P, E)} U′ restricted to a compact open, coadmissible. Transitivity: the map f ↦ (g ↦ f(g)(1)) is an isomorphism, as for smooth induction (SR.2/induction-in-stages). The locally algebraic subspace: f ↦ f ⊗ w for f smooth and w ∈ W gives (Ind π)^∞ ⊗ W → (Ind (π ⊗ W|_P))^an, injective with closed image.

*Sources.* EMJ2, §2.1, Proposition 2.1.2, p. 21: If U is admissible (respectively strongly, very strongly admissible) then Ind_P^G U is admissible (respectively strongly, very strongly admissible). BR16, §2, (4), p. 8: Defines (Ind_P^G W′ ⊗ π_P)^{ℚ_p-an} as locally ℚ_p-analytic functions with f(pg) = p·f(g), with the inductive-limit topology on W′ ⊗ π_P and G acting by right translation; parabolic inductions are unnormalised. DING25, §3.1.2, p. 34; §3.1.3, (3.19), p. 40; §3.1.4, p. 44: Uses (Ind_{B^-(K)}^{GL_n(K)} −)^{ℚ_p-an}, locally algebraic induction (−)^{lalg}, transitivity of parabolic induction and locally σ-analytic induction.

*Needs.* LR.0 *Locally analytic representations*; LR.1 *Admissible locally analytic representations*; LR.2 *Very strongly admissible representations*; `ReductiveGroupsPartII:RG2.4/iwasawa-decomposition`; `SmoothRepresentationsOfLocalGroups:SR.2/smooth-induction`; `SmoothRepresentationsOfLocalGroups:SR.2/induction-in-stages`; `LocallyAnalyticDistributions:L0/locally-analytic-function-space`; `LocallyAnalyticDistributions:L0/compact-type-spaces`.

*Planet:* Locally analytic parabolic induction.

#### Locally analytic principal series (`principal-series`, construction)

Let 𝐆 be split reductive over L with split maximal torus 𝐓 ⊆ 𝐁 = 𝐓𝐍 (Borel, unipotent radical 𝐍) and opposite Borel 𝐁^-, G = 𝐆(L), T = 𝐓(L). For a locally ℚ_p-analytic character χ : T → E^×, inflated to B^- = B^-(L), the locally analytic principal series is PS(χ) := (Ind_{B^-}^G χ)^{ℚ_p-an} (LR.4/locally-analytic-induction). Its derivative dχ ∈ Hom(t ⊗_{ℚ_p} E, E) = ∏_σ t_σ^* is its weight. For χ = χ_sm z^λ with χ_sm smooth and λ = (λ_{σ,i})_{σ∈Σ_L, 1≤i≤n} an algebraic weight (for GL_n, z^λ(diag(t_1, …, t_n)) = ∏_{σ,i} σ(t_i)^{λ_{σ,i}}), and λ dominant with respect to 𝐁, PS(χ) contains (Ind_{B^-}^G χ_sm)^∞ ⊗_E L(λ) as its locally algebraic vectors, where L(λ) is the irreducible algebraic representation of (Res_{L/ℚ_p}𝐆) ×_{ℚ_p} E of highest weight λ.

*Hypotheses and conventions.* E splits L and contains the values of χ. Unnormalised induction from the lower Borel B^-, Ding's convention.

*Uses.* Ding, Proposition 3.1: constituents and socle of PS(w(φ), h); BHS §5.2, p. 395: irreducible constituents of the principal series attached to companion points; LocallyAnalyticDistributionsPartII ND.5/principal-series-eigenfunction: the SL_2-principal series inside C^la(G, ℚ_p)[λ] (compact G); this node is its global version.

*API* (namespace `TauCeti.LocallyAnalytic`):

- `principalSeries` (constructor): PS(χ) := (Ind_{B^-}^G χ)^{ℚ_p-an}.
- `principalSeries_weight` (data): The weight dχ ∈ ∏_σ t_σ^* of a locally analytic character χ.
- `principalSeries_lalg` (compatibility): For χ = χ_sm z^λ with λ dominant, PS(χ)_lalg = (Ind_{B^-}^G χ_sm)^∞ ⊗ L(λ).
- `principalSeries_twist` (relation): PS(χ ⊗ (ψ ∘ det)) ≅ PS(χ) ⊗ ψ ∘ det for a character ψ of L^× (GL_n).
- `principalSeries_isVSA` (other): PS(χ) is very strongly admissible.
- `principalSeries_deformed` (constructor): PS(χ(1 + ψε)) for ψ ∈ Hom(T, E), an extension of PS(χ) by itself (LR.1/self-extension-dual-numbers).

**Checks.**

- `principalSeries_GL1` (degenerate): For 𝐆 = GL_1 (B = T = G), PS(χ) = χ.
- `principalSeries_GL2_trivial` (computation): For GL_2(ℚ_p) and χ = 1, PS(1)_lalg = (Ind_{B^-}^G 1)^∞, a nonsplit extension of the smooth Steinberg representation by the trivial character.
- `principalSeries_weight_alg` (computation): For χ = z^λ algebraic, the weight dχ equals λ (as an element of ∏_σ t_σ^*).
- `principalSeries_antidominant_no_lalg` (non-example): If λ is not dominant, PS(χ_sm z^λ) has no nonzero locally algebraic vectors: the Verma module U(g ⊗ E) ⊗_{U(b^- ⊗ E)} (−λ) has no nonzero finite-dimensional quotient.

*Proof sketch.* PS(χ) is admissible, very strongly admissible when χ is (characters are finite-dimensional, LR.2/very-strongly-admissible), by LR.4/locally-analytic-induction. The locally algebraic vectors are computed by the inclusion of LR.4/locally-analytic-induction with W = L(λ): for dominant λ the highest-weight line of L(λ) is the unique B^--stable quotient line (n^- lowers weights), on which B^- acts by z^λ; Frobenius reciprocity identifies (Ind χ_sm)^∞ ⊗ L(λ) with the locally algebraic induction.

*Sources.* DING25, §3.1.2, p. 34: Defines PS(w(φ), h) := (Ind_{B^-(K)}^{GL_n(K)} w(φ)ηz^λ)^{ℚ_p-an} and its socle π_alg(φ, h) = I_sm(w(φ)) ⊗_E L(λ). OS10, Introduction, p. 3; Theorem 3.1.3, p. 13: Proves that Ind_P^G(V) is topologically irreducible when U(g) ⊗_{U(p)} V′ is irreducible, the irreducibility criterion for principal series. BR16, §2, (4) and Corollary 2.5, pp. 8–11: Treats (Ind_P^G W′ ⊗ π_P)^{ℚ_p-an} and its socle.

*Needs.* LR.4 *Locally analytic parabolic induction*; LR.1 *Locally algebraic representations*; `SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction`; Tau Ceti ReductiveGroups Layer 7; Tau Ceti LieHighestWeight Layer 4.

*Planet:* Locally analytic principal series.

#### Ext groups between locally analytic characters of a torus (`torus-ext`, theorem)

Let T = 𝐓(L) for a split torus 𝐓 ≅ 𝔾_m^n over L, and χ, χ′ : T → E^× locally ℚ_p-analytic characters. (1) If χ ≠ χ′ then Ext^i_T(χ, χ′) = 0 for all i. (2) Ext^1_T(χ, χ) ≅ Hom(T, E), the E-vector space of locally ℚ_p-analytic additive characters T → E, via ψ ↦ χ(1 + ψε) (LR.1/self-extension-dual-numbers). (3) dim_E Hom(L^×, E) = 1 + d_L, dim_E Hom_sm(L^×, E) = 1 and dim_E Hom_σ(L^×, E) = 2 for σ ∈ Σ_L, where Hom_sm consists of smooth (locally constant) and Hom_σ of locally σ-analytic characters (dψ factoring through Lie(L^×) ⊗_{L,σ} E); hence dim Hom(T, E) = n(1 + d_L) and dim Hom_sm(T, E) = n. (4) Hom_{g′}(GL_n) := {ψ ∈ Hom(T(L), E) : ψ − ψ_0 ∘ det ∈ Hom_sm(T(L), E) for some ψ_0 ∈ Hom(L^×, E)} has dimension n + d_L.

*Hypotheses and conventions.* T abelian, so D(T, E) is commutative.

*Proof sketch.* (1): D(T, E) is commutative; if χ ≠ χ′ there is t ∈ T with χ(t) ≠ χ′(t) (or x ∈ t with dχ(x) ≠ dχ′(x)); the central element δ_t − χ(t) acts by 0 on χ and invertibly on χ′, hence by both 0 and an isomorphism on the Ext groups. (2): a self-extension of the character χ is a two-dimensional representation, upper triangular with a locally analytic additive character in the corner; normalising by χ gives ψ. (3): L^× ≅ ϖ^ℤ × μ × (1 + ϖ^m O_L) with 1 + ϖ^m O_L ≅ O_L ≅ ℤ_p^{d_L} for m large; additive characters are the valuation (smooth) and the E-linear combinations of σ ∘ log (σ ∈ Σ_L). (4): Hom_{g′} is the sum of Hom_sm(T, E) (dimension n) and det^*Hom(L^×, E) (dimension 1 + d_L), meeting in det^*Hom_sm(L^×, E) (dimension 1).

*Sources.* DING25, §3.1.2, proof of Lemma 3.5, p. 37: Recalls that Ext^i_{T(K)}(χ, χ′) = 0 for all i when χ ≠ χ′. DING25, §2.1, p. 9: Defines Hom(H, E), Hom_sm(H, E) and Hom_σ(H, E) for a locally K-analytic group H and records dim Hom_sm(K^×, E) = 1, dim Hom_σ(K^×, E) = 2, dim Hom(K^×, E) = 1 + d_K. DING25, §2.3.1, (2.17), p. 18: Defines Hom_{g′}(T(K), E) as the characters differing from ψ_0 ∘ det by a smooth character.

*Needs.* LR.1 *Ext groups of admissible locally analytic representations*; LR.1 *Self-extensions as dual-number modules and tautological extensions*; LR.0 *The derived action of the Lie algebra*; LR.0 *The distribution algebra of a locally analytic group*.

#### Homology of locally analytic representations under a unipotent radical (`unipotent-homology`, construction)

For a locally analytic group N and a locally analytic representation V of N, the homology H_q(N, V) is the q-th homology of Kohlhaase's complex (B_q(N, V) ⊗̃ D(N, E))_q, a complex of locally convex spaces whose underlying abstract homology is Tor_q^{D(N,E)}(E, V′)′-dual to the Ext groups of LR.1/ext-groups; it carries the topology of a subquotient and need not be Hausdorff. For a parabolic P = M_P N_P of a reductive G, H_q(N_P, V) of a locally analytic representation V of P is a locally analytic representation of M_P. For V = W ⊗ π locally algebraic (W algebraic, π smooth): H_q(N_P, W ⊗ π) = H_q(n_P, W) ⊗_E J_{N_P}(π), with J_{N_P}(π) the smooth Jacquet module (SmoothRepresentationsOfLocalGroups SR.2/jacquet-module) and H_q(n_P, W) Lie algebra homology, given by Kostant's theorem as ⊕_{w ∈ W^P, lg(w) = q} L_{M_P}(w·λ) for W = L(λ).

*Hypotheses and conventions.* Kostant's theorem on n-homology of finite-dimensional irreducible modules is an input recorded in the gap 'Category O and Kostant homology'.

*Uses.* Schraen 2011, Corollaire 4.9: the E_2-terms Ext^p_{M_P}(H_q(N_P, Σ), ρ); Ding, proof of Lemma 3.5, p. 37: H_1(N^-(K), π_alg(φ, h)) and the separatedness hypothesis; Ding 2019, Lemma 2.26: vanishing of Ext^1 into inductions of non-adjacent weights.

*API* (namespace `TauCeti.LocallyAnalytic`):

- `unipotentHomology` (data): H_q(N, V), a locally analytic representation of M_P when N = N_P.
- `unipotentHomology_zero` (characterisation): H_0(N, V) = V_N, the coinvariants (with the quotient topology).
- `unipotentHomology_lalg` (relation): H_q(N_P, W ⊗ π) ≅ H_q(n_P, W) ⊗_E J_{N_P}(π).
- `unipotentHomology_IsHausdorff` (data): The predicate that every H_q(N, V) is Hausdorff (the separatedness hypothesis of LR.4/schraen-spectral-sequence).
- `unipotentHomology_lalg_hausdorff` (example): For locally algebraic V, every H_q(N_P, V) is Hausdorff (finite-dimensional algebraic times smooth with finest topology).

**Checks.**

- `unipotentHomology_trivialN` (degenerate): For N = 1, H_0 = V and H_q = 0 for q > 0.
- `unipotentHomology_GL2_alg` (computation): For GL_2(ℚ_p), W = Sym^k(E²) and N = N_{B^-}: H_0(n, W) and H_1(n, W) are the two extremal weight lines of W (Kostant for sl_2), so H_1(N, W ⊗ π) = (weight line) ⊗ J_N(π).
- `unipotentHomology_smooth` (non-example): For V = π smooth, H_0(N_P, π) = J_{N_P}(π) (the smooth Jacquet module of SR.2), but H_q(N_P, π) = H_q(n_P, E) ⊗ J_{N_P}(π) is nonzero for 0 ≤ q ≤ dim n_P: locally analytic homology of a smooth representation is not smooth homology, which vanishes in positive degrees.
- `unipotentHomology_lalg_hausdorff_test` (characterisation): For Σ = W ⊗ π locally algebraic (W finite-dimensional algebraic, π smooth admissible with its finest topology), every H_q(N_P, Σ) is Hausdorff, so the hypothesis of LR.4/schraen-spectral-sequence holds.

*Proof sketch.* Kohlhaase's complex is a resolution of the trivial D(N, E)-module by completed tensor products of D(N, E) (SCH11 §3), so its homology computes Tor over D(N, E) on the algebraic level. For W ⊗ π: N acts on π smoothly; the homology splits as Lie algebra homology of W tensored with the coinvariants of the smooth part, which are the Jacquet module (exactness of J_N, SR.2/jacquet-lemma).

*Sources.* SCH11, §3, p. 68: Recalls Kohlhaase's definition of the homology groups of a locally analytic representation as the homology of the complex (B_q(G, V) ⊗̃ D(G), ι_K)_q. SCH11, §4, (4.40)–(4.42) and Théorème 4.10, p. 82: For locally algebraic Σ = ψ_alg ⊗ ψ_∞: H_q(n, ψ_alg ⊗ ψ_∞) = H_q(n, ψ_alg) ⊗ ψ_∞ and H_q(N, Σ) = H_q(n, ψ_alg) ⊗ J_N(ψ_∞); Kostant's theorem computes H_q(n, F_λ).

*Needs.* LR.0 *The distribution algebra of a locally analytic group*; LR.1 *Ext groups of admissible locally analytic representations*; LR.1 *Locally algebraic representations*; `SmoothRepresentationsOfLocalGroups:SR.2/jacquet-module`; `SmoothRepresentationsOfLocalGroups:SR.2/jacquet-lemma`; Tau Ceti LieHighestWeight Layer 3.

*Planet:* Homology under a unipotent radical.

#### Schraen's spectral sequence for Ext into a parabolic induction (`schraen-spectral-sequence`, theorem)

Let G be split reductive, P = M_P N_P a parabolic subgroup, Σ an admissible locally analytic representation of G and ρ an admissible locally analytic representation of M_P (inflated to P). If H_q(N_P, Σ) is Hausdorff for every q ≥ 0, there is a spectral sequence E_2^{p,q} = Ext^p_{M_P}(H_q(N_P, Σ), ρ) ⇒ Ext^{p+q}_G(Σ, (Ind_P^G ρ)^an). If moreover the centre Z of G acts on Σ and ρ through a character χ, the same holds with Ext_{M_P,χ} and Ext_{G,χ}.

*Hypotheses and conventions.* H_q(N_P, Σ) Hausdorff for all q (holds for locally algebraic Σ and for self-extensions of locally algebraic representations whose restriction to the derived group is locally algebraic).

*Proof sketch.* Frobenius reciprocity for locally analytic induction: Hom_G(Σ, (Ind_P^G ρ)^an) = Hom_P(Σ, ρ) = Hom_{M_P}(H_0(N_P, Σ), ρ), dually ((Ind ρ)^an)′ = D(G) ⊗_{D(P)} ρ′ (LR.4/locally-analytic-induction). Derive: Ext_G(Σ, Ind ρ) = Ext_{D(P)}(ρ′, Σ′), and the Hochschild–Serre spectral sequence for D(N_P) ⊆ D(P) with Hausdorff homology identifies the E_2-terms (SCH11 §4).

*Sources.* SCH11, §4, Corollaire 4.9, (4.37)–(4.38), p. 82: Under the hypothesis that all H_q(N, Σ) are Hausdorff, gives the spectral sequence Ext^p_L(H_q(N, Σ), ρ) ⇒ Ext^{p+q}_G(Σ, Ind_P^G(ρ)), and its fixed-central-character variant. DING25, §3.1.2, proof of Lemma 3.5, (3.8), p. 37: Applies Schraen's spectral sequence for G = Res_{K/ℚ_p}GL_n, checking the separatedness hypothesis for π_alg(φ, h) and its self-extensions (locally algebraic after restriction to SL_n(K)).

*Needs.* LR.4 *Homology of locally analytic representations under a unipotent radical*; LR.4 *Locally analytic parabolic induction*; LR.1 *Ext groups of admissible locally analytic representations*.

*Planet:* Schraen's spectral sequence.

### Examples

- (Locally analytic parabolic induction) For G = GL_2(ℚ_p), P = B^- and a locally analytic character χ, (Ind_{B^-}^G χ)^an ≅ C^an(ℙ^1(ℚ_p), E) as topological vector spaces.
- (Locally analytic principal series) For GL_2(ℚ_p) and χ = z^λ with λ = (k, 0), k ≥ 0, PS(χ)_lalg = (Ind_{B^-}^G 1)^∞ ⊗ Sym^k(E²).
- (Ext groups between locally analytic characters of a torus) For n = 1 and L = ℚ_p, Ext^1_{ℚ_p^×}(1, 1) is two-dimensional, spanned by the valuation and log_p.
- (Homology of locally analytic representations under a unipotent radical) For V = W algebraic and N = N_B, H_0(N, W) = W_N, the coinvariants, a character of T of weight the lowest weight of W.
- (Schraen's spectral sequence for Ext into a parabolic induction) For Σ = W ⊗ π locally algebraic, the E_2-terms are Ext^p_{M_P}(H_q(n_P, W) ⊗ J_{N_P}(π), ρ), computed by LR.4/torus-ext when M_P = T.

### Dependencies

This layer rests on: `LocallyAnalyticDistributions:L0`; LR.0; LR.1; LR.2; `ReductiveGroupsPartII:RG2.4`; `SmoothRepresentationsOfLocalGroups:SR.2`; Tau Ceti ReductiveGroups Layer 7; Tau Ceti LieHighestWeight Layer 3; Tau Ceti LieHighestWeight Layer 4.

## Layer LR.5: Orlik–Strauch functors

The Orlik–Strauch functor F^G_P(M, π_P) in Breuil's locally ℚ_p-analytic form, its exactness and transitivity, the irreducibility criterion and uniqueness, Jordan–Hölder series, socles and full faithfulness, the extension to products of groups over different fields, and the vanishing of Ext¹ into inductions from weights at Bruhat distance at least two.

#### Vanishing of Ext¹ into inductions from non-adjacent weights (`ext-vanishing-long-weyl`, theorem)

Let 𝐆 = Res_{L/ℚ_p}GL_n with the notation of Ding, μ ∈ X^+ dominant, π a smooth admissible representation of G = GL_n(L), W := L(μ) ⊗_E π, s ∈ S_n^{|Σ_L|} ≅ W_{Σ_L}, I ⊆ Δ such that s·μ is dominant for the Levi L_I of the standard parabolic P_I, and π_I a finite-length smooth representation of L_I(L). If lg(s) > 1 then (1) Ext^1_G(W, (Ind_{P_I^-}^G L(s·μ)_I ⊗ π_I)^{ℚ_p-an}) = 0 and (2) Ext^1_G(W, F^G_{P_I^-}(L^-(−s·μ), π_I)) = 0. Consequently, push-forward along an injection V ↪ V′ of admissible representations whose cokernel has only constituents of the form F^G_{P_J^-}(L^-(−s·μ), π′) with lg(s) > 1 is an isomorphism on Ext^1_G(W, −).

*Hypotheses and conventions.* lg(s) > 1: weights at distance at least two in the Bruhat order from μ do not meet H_0 or H_1(N_I, W).

*Proof sketch.* By Kostant's theorem, H_r(N_I, W) ≅ J_{P_I}(π) ⊗ ⊕_{lg(w)=r, w·μ I-dominant} L(w·μ)_I (LR.4/unipotent-homology). For r ∈ {0, 1} the weights w·μ with lg(w) ≤ 1 differ from s·μ when lg(s) > 1, so Ext^r_{L_I}(H_i(N_I, W), L(s·μ)_I ⊗ π_I) = 0 (LR.1/locally-algebraic-ext); Schraen's spectral sequence (separatedness holds for locally algebraic W) gives (1). F^G_{P_I}(L^-(−s·μ), π_I) is a subrepresentation of the induction whose quotient has no locally algebraic vectors, so Hom_G(W, quotient) = 0 and (2) follows from (1).

*Sources.* DING19, §2.3.2, Lemma 2.26 and its proof, p. 29: For lg(s) > 1, Ext^1 from a locally algebraic L(μ) ⊗ π into the parabolic induction of L(s·μ)_I ⊗ π_I and into F^G_{P_I}(L(−s·μ), π_I) vanishes, by Schraen's spectral sequence, Kostant's theorem and Schraen's Proposition 4.7. DING19, §2.3.2, proof of Proposition 2.27, p. 29: Deduces push-forward isomorphisms by dévissage from Lemma 2.26. DING25, §3.1.2, proofs of Lemma 3.5 and Proposition 3.6 and (3.10), pp. 37–38: Cites [32, Lem. 2.26] (Ding 2019) for the push-forward isomorphisms used to define (3.10) and to compute Ext^1(π_alg, C(I, s_{i,σ})).

*Needs.* LR.4 *Schraen's spectral sequence for Ext into a parabolic induction*; LR.1 *Ext groups between locally algebraic representations*; LR.1 *Locally algebraic representations*; LR.5 *The Orlik–Strauch functor*.

#### The Orlik–Strauch functor (`orlik-strauch-functor`, construction)

Let M ∈ O^p_alg and π_P a smooth admissible representation of L_P(L) over E, inflated to P(L). Choose a finite-dimensional U(p ⊗_{ℚ_p} E)-stable subspace W ⊆ M generating M, so that there is an exact sequence 0 → ker(φ) → U(g ⊗ E) ⊗_{U(p ⊗ E)} W → M → 0; W carries the unique algebraic action of (Res_{L/ℚ_p}P) ×_{ℚ_p} E lifting the p ⊗ E-action, restricted to P(L), and W′ = Hom_E(W, E) the dual action. An element x ⊗ w of U(g ⊗ E) ⊗_E W acts on C^{ℚ_p-an}(G, W′ ⊗ π_P) by f ↦ (g ↦ (x·f)(g)(w)) with the derived action of LR.0/derived-lie-action, and this descends to U(g ⊗ E) ⊗_{U(p ⊗ E)} W on the induction. The Orlik–Strauch representation is F^G_P(M, π_P) := (Ind_{P(L)}^{G(L)} W′ ⊗_E π_P)^{ker(φ)}, the closed subspace of the locally ℚ_p-analytic induction (LR.4/locally-analytic-induction) annihilated by ker(φ). It is a closed G(L)-stable subspace, independent of the choice of W, admissible, strongly admissible when π_P has finite length, and very strongly admissible when π_P is. Write F^G_P(M) := F^G_P(M, 1).

*Hypotheses and conventions.* 𝐆 split connected reductive over L, B = TN ⊆ P = L_P N_P a Borel and a parabolic (standard or opposite), E/ℚ_p finite splitting L; O^p_alg is the category of the gap 'Category O and Kostant homology' for the ℚ_p-Lie algebra g ⊗_{ℚ_p} E = ∏_σ g_σ: finitely generated U(g ⊗ E)-modules, direct sums of simple algebraic U(l_P ⊗ E)-modules, locally finite for n_P ⊗ E. The theory of Orlik–Strauch is for locally L-analytic representations of G(L); Breuil extends it to the locally ℚ_p-analytic setting used here (Breuil states p > 3 if G has factors not of type A; no restriction for GL_n).

*Uses.* Ding, Proposition 3.1 and (3.1), p. 34: C(w, u) := F^{GL_n}_{B^-}(L^-(−u·λ), w(φ)η), the constituents of PS(w(φ), h); BHS, (5.3), p. 387 and §5.2–5.4: F^{G_p}_{B_p}(δ) and the multiplicities m_{δ,Π} of companion constituents; Colmez–Dospinescu–Nizioł, Remark 1.6 (route not in scope): finiteness of length of duals of differential forms on the Drinfeld space; PadicHodgeParametersInLocallyAnalyticRepresentations, contract LA2 and LA6: the constituents C(I, s_{i,σ}) and the Orlik–Strauch/Jacquet–Emerton compatibility (3.10).

*API* (namespace `TauCeti.LocallyAnalytic`):

- `orlikStrauch` (constructor): F^G_P(M, π_P) := (Ind_P^G W′ ⊗ π_P)^{ker φ}, a closed subrepresentation of the induction.
- `orlikStrauch_indep` (extensionality): F^G_P(M, π_P) does not depend on the generating subspace W ⊆ M.
- `orlikStrauch_map` (functoriality): Contravariant in M ∈ O^p_alg and covariant in π_P, with map_id and map_comp.
- `orlikStrauch_isAdmissible` (other): F^G_P(M, π_P) is admissible; strongly admissible if π_P has finite length; very strongly admissible if π_P is.
- `orlikStrauch_verma` (example): F^G_P(U(g ⊗ E) ⊗_{U(p ⊗ E)} W, π_P) = (Ind_P^G W′ ⊗ π_P)^an.
- `orlikStrauch_finiteDim` (example): For M finite-dimensional algebraic (so M ∈ O^g_alg), F^G_P(M, π_P) ≅ M′ ⊗_E (Ind_P^G π_P)^∞, locally algebraic.
- `orlikStrauch_dual` (characterisation): F^G_P(M, π_P)′ is the quotient of D(G, E) ⊗_{D(P, E)} (W ⊗ π_P′) by the image of D(G, E) ⊗ ker(φ) (BR16 Lemma 2.2).

**Checks.**

- `orlikStrauch_zero` (degenerate): F^G_P(0, π_P) = 0 and F^G_P(M, 0) = 0.
- `orlikStrauch_verma_test` (computation): For a Verma module M^-(μ) = U(g ⊗ E) ⊗_{U(b^- ⊗ E)} μ with μ an algebraic weight and a smooth character χ of T, F^G_{B^-}(M^-(μ), χ) = (Ind_{B^-}^G z^{−μ} χ)^an, the principal series of LR.4/principal-series.
- `orlikStrauch_finiteDim_test` (computation): For λ dominant, F^G_{B^-}(L^-(−λ), χ) = F^G_{B^-}(L(λ)^∨, χ) ≅ L(λ) ⊗ (Ind_{B^-}^G χ)^∞, the locally algebraic representation.
- `orlikStrauch_Lanalytic_compat` (compatibility): For L = ℚ_p the representation is the Orlik–Strauch F^G_P(M, π_P) of OS15 for the L-analytic group G(ℚ_p).
- `orlikStrauch_not_induction` (non-example): For λ dominant and the simple quotient L^-(−λ) of the Verma module, F^G_{B^-}(L^-(−λ), χ) is a proper closed subrepresentation of (Ind_{B^-}^G z^λ χ)^an, not the whole induction.

*Proof sketch.* The derived U(g ⊗ E)-action on C^an(G, W′ ⊗ π_P) and the pairing with W give continuous maps x ⊗ w : C^an(G, W′ ⊗ π_P) → C^an(G, π_P); on the induction they factor through U(g ⊗ E) ⊗_{U(p ⊗ E)} W (BR16 Lemma 2.1), so the annihilator of ker(φ) is defined and closed. It is G-stable because the left-derivative action (5) of BR16 commutes with right translation. Independence of W and admissibility: BR16 Theorem 2.3(i) via the dual description D(G, E) ⊗_{D(g,P)} … (BR16 Lemma 2.2; OS15 §4.1, Proposition 4.8). Very strong admissibility: closed subrepresentation of the very strongly admissible induction (LR.4/locally-analytic-induction).

*Sources.* OS15, Introduction, p. 3; §4.1, p. 18: Defines F^G_P(M, V) = Ind^G_P(W′ ⊗_K V)^d as the subspace of the induction killed by the kernel d of U(g) ⊗_{U(p)} W → M, and the functor F^G_P(M) = (D(G) ⊗_{D(g,P)} M)′ for the L-analytic setting. OS15, §4, Proposition 4.8, p. 22; §3, Proposition 3.3(i), p. 11: F^G_P(M, V) is admissible for every M and smooth admissible V, strongly admissible if V has finite length. BR16, §2, Lemmas 2.1–2.2 and Theorem 2.3(i), pp. 7–10: Extends the construction to the locally ℚ_p-analytic setting for Res_{L/ℚ_p}G with g ⊗_{ℚ_p} E = ∏_σ g_σ, defining F^G_P(M, π_P) = (Ind W′ ⊗ π_P)^{ker φ} and proving independence of W.

*Needs.* LR.4 *Locally analytic parabolic induction*; LR.0 *The derived action of the Lie algebra*; LR.1 *Admissible locally analytic representations*; LR.2 *Very strongly admissible representations*; Tau Ceti LieHighestWeight Layer 3; `SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction`; Tau Ceti ReductiveGroups Layer 7.

*Planet:* Orlik–Strauch functor.

#### Exactness and functoriality of the Orlik–Strauch functor (`orlik-strauch-exactness`, theorem)

F^G_P : O^p_alg × Rep^{∞,adm}_E(L_P(L)) → Rep^a_E(G(L)) is a bifunctor, contravariant in M and covariant in π_P, and exact in each argument.

*Hypotheses and conventions.* 𝐆 split connected reductive over L, B = TN ⊆ P = L_P N_P a Borel and a parabolic (standard or opposite), E/ℚ_p finite splitting L; O^p_alg is the category of the gap 'Category O and Kostant homology' for the ℚ_p-Lie algebra g ⊗_{ℚ_p} E = ∏_σ g_σ: finitely generated U(g ⊗ E)-modules, direct sums of simple algebraic U(l_P ⊗ E)-modules, locally finite for n_P ⊗ E.

*Proof sketch.* Dually F^G_P(M, π_P)′ = D(G) ⊗_{D(g,P)} (M ⊗ π_P′) (BR16 Lemma 2.2, OS15 §4.1); D(G) is flat over the relevant subalgebra and M ↦ M ⊗ π_P′ is exact, giving exactness on duals. Exactness of the dual functor on coadmissible modules is exactness of F^G_P by LR.1/admissible-anti-equivalence.

*Sources.* OS15, Introduction, main theorem (i)–(ii), p. 3; §4, Proposition 4.9(a), p. 22: F^G_P is functorial in both arguments, contravariant in M and covariant in V, and exact in both arguments. BR16, §2, Theorem 2.3(ii), p. 10: The construction (M, π_P) ↦ F^G_P(M, π_P) is functorial and exact in both arguments in the locally ℚ_p-analytic setting.

*Needs.* LR.5 *The Orlik–Strauch functor*; LR.1 *The abelian category of admissible representations*; `SmoothRepresentationsOfLocalGroups:SR.2/induction-exactness`.

#### Transitivity of the Orlik–Strauch functor along parabolics (`orlik-strauch-transitivity`, theorem)

If Q ⊇ P are parabolic subgroups and M ∈ O^q_alg ⊆ O^p_alg, then F^G_P(M, π_P) ≅ F^G_Q(M, i^{L_Q}_{P ∩ L_Q}(π_P)) for every smooth admissible π_P, where i^{L_Q}_{P∩L_Q}(π_P) = (Ind_{P(L) ∩ L_Q(L)}^{L_Q(L)} π_P)^∞ is smooth parabolic induction (of finite length when π_P is).

*Hypotheses and conventions.* 𝐆 split connected reductive over L, B = TN ⊆ P = L_P N_P a Borel and a parabolic (standard or opposite), E/ℚ_p finite splitting L; O^p_alg is the category of the gap 'Category O and Kostant homology' for the ℚ_p-Lie algebra g ⊗_{ℚ_p} E = ∏_σ g_σ: finitely generated U(g ⊗ E)-modules, direct sums of simple algebraic U(l_P ⊗ E)-modules, locally finite for n_P ⊗ E.

*Proof sketch.* For M ∈ O^q_alg one may take W ⊆ M stable under q, so the induction from P factors through Q by transitivity of locally analytic induction (LR.4/locally-analytic-induction); the condition 'killed by ker φ' only involves the algebraic part along L_Q, and on the smooth part the inner induction is the smooth one.

*Sources.* OS15, Introduction, main theorem (iii), p. 3; §4, Proposition 4.9(b), p. 22: For M ∈ O^q_alg, F^G_P(M, V) = F^G_Q(M, i^{L_Q}_{L_P}(V)) with smooth induction in the middle. BR16, §2, (8), p. 10: The same identity in the locally ℚ_p-analytic setting, by the proof of OS Proposition 4.10(b).

*Needs.* LR.5 *The Orlik–Strauch functor*; LR.4 *Locally analytic parabolic induction*; `SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction`; `SmoothRepresentationsOfLocalGroups:SR.2/induction-in-stages`.

#### The Orlik–Strauch irreducibility theorem (`orlik-strauch-irreducibility`, theorem)

Let M ∈ O^p_alg and π_P a smooth admissible representation of L_P(L). Then F^G_P(M, π_P) is topologically irreducible if and only if M is simple and, for the parabolic Q ⊇ P maximal for M (the largest Q with M ∈ O^q_alg), the smooth induction i^{L_Q}_{P∩L_Q}(π_P) is irreducible. In particular, for M simple with maximal parabolic P and π_P irreducible, F^G_P(M, π_P) is irreducible. Moreover F^G_{Q_1}(M_1, π_{Q_1}) ≅ F^G_{Q_2}(M_2, π_{Q_2}) for simple M_i with maximal parabolics Q_i and finite-length π_{Q_i} if and only if M_1 ≅ M_2 (hence Q_1 = Q_2) and π_{Q_1} ≅ π_{Q_2}. Residue-characteristic hypotheses: p > 2 if the root system of 𝐆 has components of type B, C or F_4, and p > 3 if it has components of type G_2 (none for GL_n).

*Hypotheses and conventions.* 𝐆 split connected reductive over L, B = TN ⊆ P = L_P N_P a Borel and a parabolic (standard or opposite), E/ℚ_p finite splitting L; O^p_alg is the category of the gap 'Category O and Kostant homology' for the ℚ_p-Lie algebra g ⊗_{ℚ_p} E = ∏_σ g_σ: finitely generated U(g ⊗ E)-modules, direct sums of simple algebraic U(l_P ⊗ E)-modules, locally finite for n_P ⊗ E. The residue-characteristic hypotheses are those of OS15 Assumption 5.1 (Breuil assumes p > 3 whenever 𝐆 has factors not of type A).

*Proof sketch.* Reduce by LR.5/orlik-strauch-transitivity to P maximal for M. OS15 Theorem 5.3: for M simple with P maximal, D(G_0) ⊗_{D(g, P_0)} M is a simple D(G_0)-module for a compact open G_0, via a careful analysis of the D(g, P_0)-module structure and Jantzen-type arguments; then irreducibility under G follows (OS15 Theorems 5.3, 5.8). Uniqueness (BR16 Cor. 2.7): the n-invariants of the dual recover the highest weight of M and π_Q′ (BR16 Proposition 2.4).

*Sources.* OS15, Introduction, main theorem (iv) and the remark after it, pp. 3–4; §5, Assumption 5.1, p. 25; Theorem 5.8, p. 37: F^G_P(M, V) is topologically irreducible iff M is simple and the smooth induction to the maximal parabolic for M is irreducible, under p > 2 for types B, C, F_4 and p > 3 for G_2; the authors know no counterexample for small p. BR16, §2, Theorem 2.3(iii) and Corollary 2.7, pp. 10–12: In the ℚ_p-analytic setting, F^G_P(M, π_P) is irreducible for M simple, P maximal for M and π_P irreducible; F^G_{Q_1}(M_1, π_{Q_1}) ≅ F^G_{Q_2}(M_2, π_{Q_2}) iff M_1 ≅ M_2 and π_{Q_1} ≅ π_{Q_2}.

*Needs.* LR.5 *Exactness and functoriality of the Orlik–Strauch functor*; LR.5 *Transitivity of the Orlik–Strauch functor along parabolics*; `SmoothRepresentationsOfLocalGroups:SR.3/finite-length`; Tau Ceti LieHighestWeight Layer 3.

*Planet:* Orlik–Strauch irreducibility theorem.

#### Jordan–Hölder series and socles of Orlik–Strauch representations (`orlik-strauch-jordan-holder`, theorem)

(1) For M ∈ O^p_alg with Jordan–Hölder series M = M^0 ⊋ M^1 ⊋ … ⊋ M^{r+1} = 0 there is a filtration of F^G_P(M, π_P) by closed subrepresentations with graded pieces F^G_P(M^i/M^{i+1}, π_P); refining it gives a Jordan–Hölder series whose irreducible constituents are the F^G_{Q_i}(M^i/M^{i+1}, π′) for π′ running over the constituents of i^{L_{Q_i}}_{P∩L_{Q_i}}(π_P), Q_i the maximal parabolic of M^i/M^{i+1}; the multiplicity of F^G_Q(L, π_Q) is [M : L]·[i^{L_Q}_{P∩L_Q}(π_P) : π_Q]. (2) (Socle.) For W an irreducible algebraic representation of L_P of highest weight λ_W, M the simple quotient of U(g ⊗ E) ⊗_{U(p ⊗ E)} W with maximal parabolic Q ⊇ P, and π_P of finite length: soc_G F^G_P(M, π_P) = F^G_Q(M, soc_{L_Q} i^{L_Q}_{P∩L_Q} π_P) = soc_G (Ind_P^G W′ ⊗ π_P)^an. (3) H^0(N_Q(L), F^G_Q(M, π_Q)′) ≅ W(Q) ⊗_E π_Q′ as L_Q(L)-representations, W(Q) the irreducible algebraic representation of L_Q of highest weight λ_W. (4) (Full faithfulness, L-analytic case.) For M_1, M_2 ∈ O^p_alg, Hom_{O^p_alg}(M_1, M_2) → Hom_G(F^G_P(M_2), F^G_P(M_1)) is bijective.

*Hypotheses and conventions.* 𝐆 split connected reductive over L, B = TN ⊆ P = L_P N_P a Borel and a parabolic (standard or opposite), E/ℚ_p finite splitting L; O^p_alg is the category of the gap 'Category O and Kostant homology' for the ℚ_p-Lie algebra g ⊗_{ℚ_p} E = ∏_σ g_σ: finitely generated U(g ⊗ E)-modules, direct sums of simple algebraic U(l_P ⊗ E)-modules, locally finite for n_P ⊗ E. (4) is stated by Orlik for locally L-analytic representations and the trivial smooth argument; its ℚ_p-analytic extension is part of the obligation of LR.5/orlik-strauch-products' Remark-5.1.2-type examination of proofs.

*Proof sketch.* (1): exactness (LR.5/orlik-strauch-exactness) turns a Jordan–Hölder series of M into a filtration; each graded piece is F^G_P(M_i, π_P) with M_i simple, which by transitivity equals F^G_{Q_i}(M_i, i(π_P)), and exactness in the second argument plus irreducibility (LR.5/orlik-strauch-irreducibility) refine it. (2)–(3): BR16 Proposition 2.4 computes N_Q-invariants of the dual; an irreducible subrepresentation F^G_Q(M, π_Q) gives a quotient W(Q) ⊗ π_Q′ of W(Q) ⊗ i(π_P)′, so π_Q lies in the socle of the smooth induction; constituents with other M̃ are excluded by comparing torus weights of highest weight vectors (BR16 Cor. 2.5). (4): Orlik's Casselman–Jacquet-type functor G^G_P(U) = colim_k H^0(u_P^k, U′) is almost a section of F^G_P (OR19).

*Sources.* OS15, §6.2, (6.2.1) and the following discussion, pp. 41–42: From a Jordan–Hölder series of M one gets a filtration of F^G_P(M, V) with graded pieces F^G_P(M^i/M^{i+1}, V); refining gives a Jordan–Hölder series with constituents F^G_{Q_i}(M^i/M^{i+1}, v^{Q_i}_Q). BR16, §2, Proposition 2.4 and Corollary 2.5 with proof, pp. 10–12: Computes H^0(N_Q, F^G_Q(M, π_Q)′) = W(Q) ⊗ π_Q′ and the socle of F^G_P(M, π_P) and of the induction. OR19, Introduction, Theorem 1, p. 1: For M_1, M_2 ∈ O^p_alg the map Hom(M_1, M_2) → Hom_G(F^G_P(M_2), F^G_P(M_1)) is bijective. BHS19, §5.2, p. 395: Uses the structure of Verma modules and the Orlik–Strauch theory to list the irreducible constituents of F^{G_p}_{B_p}(δ_{R,w}).

*Needs.* LR.5 *The Orlik–Strauch irreducibility theorem*; LR.5 *Exactness and functoriality of the Orlik–Strauch functor*; LR.5 *Transitivity of the Orlik–Strauch functor along parabolics*; LR.1 *The abelian category of admissible representations*; `SmoothRepresentationsOfLocalGroups:SR.3/finite-length`.

*Planet:* Orlik–Strauch Jordan–Hölder theorem.

#### Orlik–Strauch theory for products of groups over different fields (`orlik-strauch-products`, theorem)

Let G = G_1(L_1) × G_2(L_2) with 𝐆_i split reductive over finite extensions L_i/ℚ_p (not necessarily equal) and E splitting L_1 and L_2. With g ⊗_{ℚ_p} E = (g_1 ⊗ E) × (g_2 ⊗ E), parabolics P = P_1 × P_2 and O^p_alg defined for g ⊗ E, the constructions and results of LR.5 and LR.6 hold for locally ℚ_p-analytic representations of G over E: F^G_P(M_1 ⊠ M_2, π_1 ⊠ π_2) ≅ F^{G_1}_{P_1}(M_1, π_1) ⊗̂_E F^{G_2}_{P_2}(M_2, π_2); the exactness, transitivity, irreducibility, Jordan–Hölder and socle statements; and Emerton's adjunction and Breuil's adjunction (LR.6) for very strongly admissible representations of G.

*Hypotheses and conventions.* 𝐆 split connected reductive over L, B = TN ⊆ P = L_P N_P a Borel and a parabolic (standard or opposite), E/ℚ_p finite splitting L; O^p_alg is the category of the gap 'Category O and Kostant homology' for the ℚ_p-Lie algebra g ⊗_{ℚ_p} E = ∏_σ g_σ: finitely generated U(g ⊗ E)-modules, direct sums of simple algebraic U(l_P ⊗ E)-modules, locally finite for n_P ⊗ E. This is a genuine proof obligation: the source asserts the extension after an examination of the proofs and gives no argument.

*Proof sketch.* The ℚ_p-Lie algebra of G is the product of those of the factors and U(g ⊗ E) = U(g_1 ⊗ E) ⊗ U(g_2 ⊗ E); O^p_alg for the product is generated by external tensor products M_1 ⊠ M_2. For M = M_1 ⊠ M_2 choose W = W_1 ⊠ W_2; the induction from P_1 × P_2 is the completed tensor product of the inductions (LR.0/completed-external-tensor), and ker(φ) = ker(φ_1) ⊗ U_2 + U_1 ⊗ ker(φ_2), giving the tensor product formula. Each proof of LR.5–LR.6 uses only the structure of g ⊗ E as a product of split reductive algebras, the Bruhat and Iwasawa decompositions of each factor, and distribution algebras of compact opens, all of which are compatible with products; the irreducibility proof (OS15 §5) runs factor by factor because simple objects of O^p_alg for the product are external tensor products.

*Sources.* BHS19, §5.1, Remark 5.1.2, p. 388: The Orlik–Strauch results used are stated only for G(K) with G split reductive over K and L splitting K, but are needed for products G_1(K_1) × G_2(K_2) with K_1 ≠ K_2; an examination of the proofs (and of the results of Orlik–Strauch and Emerton on which they rely) shows that they extend when L splits K_1 and K_2. BHS19, §5.2, p. 390: Writes F^{G_p}_{B_p}{L(−μ), ε_sm δ^{-1}_{B_p}} ≃ ⊗̂_{v∈S_p} F^{G_v}_{B_v}{L(−μ_v), ε_sm δ^{-1}_{B_v}} for the product group G_p = ∏_v G_v.

*Needs.* LR.5 *Jordan–Hölder series and socles of Orlik–Strauch representations*; LR.0 *Completed external tensor products of representations*.

### Examples

- (Vanishing of Ext¹ into inductions from non-adjacent weights) For n = 2 there is no s with lg(s) > 1 in a single factor, so the statement has content only for n ≥ 3 or d_L ≥ 2.
- (The Orlik–Strauch functor) For a generalised Verma module M = U(g ⊗ E) ⊗_{U(p ⊗ E)} W one has ker(φ) = 0 and F^G_P(M, π_P) = (Ind_P^G W′ ⊗ π_P)^an.
- (Exactness and functoriality of the Orlik–Strauch functor) Applied to 0 → K → M^-(−λ) → L^-(−λ) → 0 it gives 0 → F(L^-(−λ), χ) → PS → F(K, χ) → 0.
- (Transitivity of the Orlik–Strauch functor along parabolics) For P = B, Q = G and M = L(λ)^∨ finite-dimensional: F^G_B(L(λ)^∨, χ) ≅ L(λ) ⊗ (Ind_B^G χ)^∞.
- (The Orlik–Strauch irreducibility theorem) For GL_2(ℚ_p), λ dominant and s the simple reflection, F^G_{B^-}(L^-(−s·λ), χ) is irreducible: the 'non-locally-algebraic' constituent of PS(z^λ χ).
- (Jordan–Hölder series and socles of Orlik–Strauch representations) For GL_2(ℚ_p) and λ dominant: PS(z^λ χ) has length 2 when (Ind χ)^∞ is irreducible, with socle L(λ) ⊗ (Ind χ)^∞ and cosocle F(L^-(−s·λ), χ).
- (Orlik–Strauch theory for products of groups over different fields) For G_2 = 1 the statement is the theory of LR.5 for G_1(L_1).

### Dependencies

This layer rests on: LR.0; LR.1; LR.2; LR.4; `SmoothRepresentationsOfLocalGroups:SR.2`; `SmoothRepresentationsOfLocalGroups:SR.3`; Tau Ceti ReductiveGroups Layer 7; Tau Ceti LieHighestWeight Layer 3.

## Layer LR.6: Emerton's Jacquet functor, closed induction and the adjunction theorems

Rigid character varieties of abelian locally analytic groups, essentially admissible representations, finite slope parts, Emerton's locally analytic Jacquet functor J_P with its admissibility and locally algebraic computation, the closed induction I_P^G, balanced maps, Emerton's adjunction theorem and Breuil's adjunction for Orlik–Strauch representations.

#### The rigid character variety of an abelian locally analytic group (`character-variety`, construction)

Let Z be an abelian locally F-analytic group which is topologically finitely generated, equivalently Z ≅ Z_0 × Λ with Z_0 compact open (the maximal compact subgroup) and Λ ≅ ℤ^r discrete. The functor Ẑ on rigid analytic spaces X over F, Ẑ(X) = characters Z → O(X)^× that are locally analytic over every affinoid open of X, is representable by a strictly quasi-Stein rigid space, Ẑ ≅ Ẑ_0 × 𝔾_m^{r,an}. Its ring of functions C^an(Ẑ, E) is a Fréchet–Stein algebra, and integration against characters gives a continuous injective algebra map D(Z, E) → C^an(Ẑ, E) with dense image, an isomorphism when Z is compact (the Mellin transform). For T = 𝐓(L) a split torus, T̂ parametrises the locally ℚ_p-analytic characters of T, and a point δ ∈ T̂(E) has weight dδ ∈ ∏_σ t_σ^*.

*Hypotheses and conventions.* Z topologically finitely generated (true for the centre of a Levi of a reductive group and for T = 𝐓(L)). For L ≠ ℚ_p and F = L the compact part needs the Lubin–Tate Fourier theory of Schneider–Teitelbaum; the ℚ_p-analytic case used here reduces to products of ℤ_p-characters (LocallyAnalyticDistributions L3).

*Uses.* Emerton, Jacquet I, Definition 3.2.1: the finite slope part is defined as Z^+-equivariant maps from C^an(Ẑ, E); Emerton, Memoir, Definition 6.4.9: essentially admissible representations are coadmissible over C^an(Ẑ, E) ⊗̂ D(H, E); BHS, §5.1, p. 386: the dual of J_B(Π) is a coherent sheaf on T̂; eigenvarieties are schematic supports; Ding, §3.1.2 and §4: characters δ = w(φ)ηz^λ(1 + ψε) as E[ε]-points of T̂.

*API* (namespace `TauCeti.LocallyAnalytic`):

- `characterVariety` (data): Ẑ as a strictly quasi-Stein rigid (or adic) space over F.
- `characterVariety_points` (characterisation): Ẑ(E) = locally analytic characters Z → E^×.
- `characterVariety_prod` (relation): Ẑ ≅ Ẑ_0 × 𝔾_m^{r,an} for Z = Z_0 × ℤ^r.
- `mellin` (data): The injective dense algebra map D(Z, E) → C^an(Ẑ, E), δ_z ↦ (χ ↦ χ(z)).
- `mellin_iso_compact` (characterisation): For compact Z the Mellin map is an isomorphism of Fréchet algebras (LocallyAnalyticDistributions L3).
- `characterVariety_frechetStein` (instance): C^an(Ẑ, E) is a Fréchet–Stein algebra.
- `characterVariety_tangent` (relation): The tangent space of Ẑ at χ is Hom(Z, E) (LR.4/torus-ext), via χ(1 + ψε).

**Checks.**

- `characterVariety_Zp` (computation): For Z = ℤ_p, Ẑ is the open unit disc and C^an(Ẑ, E) ≅ D(ℤ_p, E).
- `characterVariety_Z` (computation): For Z = ℤ discrete, Ẑ = 𝔾_m^an and D(ℤ, E) = E[t, t^{-1}] is dense in, but not equal to, O(𝔾_m^an).
- `characterVariety_trivial` (degenerate): For Z = 1, Ẑ is a point.
- `characterVariety_tangent_test` (characterisation): For Z = L^× (F = ℚ_p) the tangent space at any point has dimension 1 + d_L, matching LR.4/torus-ext.

*Proof sketch.* Z ≅ Z_0 × Λ (EM17 Prop. 6.4.1); Λ̂ = 𝔾_m^r and Ẑ_0 is the character space of the compact group, a finite disjoint union of open polydiscs in the ℚ_p-analytic case (LocallyAnalyticDistributions L3/mellin-adic-comparison). C^an(Ẑ, E) = C^an(Ẑ_0, E) ⊗̂ C^an(𝔾_m^r, E) is the ring of functions of a quasi-Stein space, Fréchet–Stein by Theorems A and B (AdicSpacesPartII R3). D(Z_0, E) ≅ C^an(Ẑ_0, E) by the Mellin transform (L3/mellin-frechet-isomorphism); D(Λ, E) = E[Λ] is dense in O(𝔾_m^r) (EM17 Prop. 6.4.6).

*Sources.* EM17, §6.4, Proposition 6.4.1, p. 124; Definition 6.4.2, p. 125; Propositions 6.4.5–6.4.6, pp. 126–127: Characterises topologically finitely generated abelian locally analytic groups as Z_0 × Λ, defines the character functor Ẑ, proves it is representable by a strictly quasi-Stein rigid space, and gives the dense injection D_la(Z, K) → C^an(Ẑ, K), an isomorphism for compact Z (via Schneider–Teitelbaum's Fourier theory).

*Needs.* LR.0 *The distribution algebra of a locally analytic group*; `LocallyAnalyticDistributions:L3/mellin-frechet-isomorphism`; `LocallyAnalyticDistributions:L3/mellin-adic-comparison`; `AdicSpacesPartII:R3/quasi-stein-space`; `AdicSpacesPartII:R3/quasi-stein-theorems-a-b`; `AdicSpacesPartII:R3/quasi-stein-theorem-a`; `LocallyAnalyticDistributionsPartII:ND.2/frechet-stein-algebra`.

*Planet:* Character variety of a torus.

#### Essentially admissible representations (`essentially-admissible`, definition)

Let G be a locally analytic group whose centre Z is topologically finitely generated, and H a compact open subgroup. A locally analytic representation V of G on a space of compact type is essentially admissible if the Z-action satisfies the equivalent conditions of Emerton (it extends to a separately continuous C^an(Ẑ, E)-module structure; equivalently V is a union of an increasing sequence of Z-stable BH-subspaces) and, for one (equivalently every) H, the dual V′_b is a coadmissible module over the Fréchet–Stein algebra C^an(Ẑ, E) ⊗̂_E D(H, E). Every admissible representation is essentially admissible; Rep^es_E(G) is abelian.

*Hypotheses and conventions.* Compact type; topologically finitely generated centre.

*Uses.* Emerton, Jacquet I, Theorem 0.5: J_P takes essentially admissible G-representations to essentially admissible M-representations; BHS §5.1: the dual of J_B(Π^an) is a coherent sheaf on T̂ whose support is an eigenvariety.

*API* (namespace `TauCeti.LocallyAnalytic`):

- `IsEssentiallyAdmissible` (data): The Z-action extends to C^an(Ẑ, E) and V′ is coadmissible over C^an(Ẑ, E) ⊗̂ D(H, E).
- `IsAdmissible.isEssentiallyAdmissible` (other): Admissible ⇒ essentially admissible.
- `essentiallyAdmissible_coherentSheaf` (equivalence): V ↦ V′ identifies Rep^es_E(G) with coadmissible C^an(Ẑ) ⊗̂ D(H)-modules with compatible G-action, i.e. G-equivariant coherent sheaves on Ẑ with D(H)-structure.
- `essentiallyAdmissible_abelian` (instance): Rep^es_E(G) is an abelian category with strict morphisms.

**Checks.**

- `essAdm_character` (computation): Every locally analytic character of an abelian Z (G = Z) is essentially admissible, with dual a skyscraper at the point χ ∈ Ẑ.
- `essAdm_admissible` (compatibility): Every admissible representation is essentially admissible (EM17 Prop. 6.4.10).
- `essAdm_not_admissible` (non-example): For G = T = ℚ_p^× and V = O(Ẑ)′ (dual of the functions on the character variety, the 'universal' family of characters), V is essentially admissible but not admissible: its dual is not finitely generated over D(H, E) for H = ℤ_p^×.
- `essAdm_zero` (degenerate): The zero representation is essentially admissible.

*Proof sketch.* The C^an(Ẑ, E)-structure, if it exists, is unique (EM17 Prop. 6.4.7). Admissible ⇒ essentially admissible: V is the union of the Z-stable images of V_{H_n-an}, so condition (iii) of EM17 Prop. 6.4.7 holds, and the dual is coadmissible already over D(H, E) (EM17 Prop. 6.4.10).

*Sources.* EM17, §6.4, Proposition 6.4.7, Definition 6.4.9, Proposition 6.4.10, pp. 127–129: Gives three equivalent conditions for the Z-action to extend to C^an(Ẑ, K), defines essentially admissible representations by coadmissibility of the dual over C^an(Ẑ, K) ⊗̂ D(H, K), and shows admissible representations are essentially admissible. EMJ1, Introduction, p. 778: The Jacquet module of an admissible representation is essentially admissible but need not be admissible.

*Needs.* LR.6 *The rigid character variety of an abelian locally analytic group*; LR.1 *Admissible locally analytic representations*; `LocallyAnalyticDistributionsPartII:ND.2/coadmissible-module`; LR.0 *Schneider–Teitelbaum duality for representations of compact type*.

*Planet:* Essentially admissible representation.

#### The finite slope part of a Z^+-representation (`finite-slope-part`, construction)

Let Z be a topologically finitely generated abelian locally analytic group and Z^+ ⊆ Z a submonoid containing a compact open subgroup Z_0 and generating Z as a group. For V a Hausdorff locally convex representation of Z^+ of compact type, the finite slope part is V_fs := L_{b,Z^+}(C^an(Ẑ, E), V), the Z^+-equivariant continuous linear maps (Z acts on C^an(Ẑ, E) through Z ⊆ C^an(Ẑ, E)^×), with the strong topology; evaluation at 1 gives a Z^+-equivariant map V_fs → V. V ↦ V_fs is right adjoint to the forgetful functor from locally analytic Z-representations (of compact type, with the C^an(Ẑ)-structure) to topological Z^+-representations.

*Hypotheses and conventions.* Z^+ generates Z as a group and contains a compact open subgroup.

*Uses.* Emerton, Jacquet I, Definition 3.4.5: J_P(V) := (V^{N_0})_fs with Z^+ = Z_M^+ acting by Hecke operators; BHS §5.1 and Ding §4: the finite slope part of completed cohomology at an eigenvariety point.

*API* (namespace `TauCeti.LocallyAnalytic`):

- `finiteSlopePart` (data): V_fs := L_{b,Z^+}(C^an(Ẑ, E), V).
- `finiteSlopePart_eval` (projection): The Z^+-equivariant map V_fs → V, evaluation at 1 ∈ C^an(Ẑ, E).
- `finiteSlopePart_adjunction` (universal-property): Hom_Z(U, V_fs) ≅ Hom_{Z^+}(U, V) for U a locally analytic Z-representation of compact type.
- `finiteSlopePart_leftExact` (functoriality): V ↦ V_fs is left exact and additive.
- `finiteSlopePart_of_la` (characterisation): If Z^+ = Z and V is locally analytic of compact type then V_fs = V.

**Checks.**

- `finiteSlopePart_Z` (degenerate): For Z^+ = Z acting locally analytically, V_fs = V.
- `finiteSlopePart_zero_operator` (non-example): If z ∈ Z^+ acts by 0 on V then V_fs = 0, since z acts invertibly on C^an(Ẑ, E).
- `finiteSlopePart_finiteDim` (computation): For V finite-dimensional with z ∈ Z^+ acting by u, V_fs is the sum of the generalised eigenspaces of u for nonzero eigenvalues.

*Proof sketch.* C^an(Ẑ, E) is a locally analytic Z-representation on which Z acts invertibly; maps out of it equivariant for Z^+ are the universal way to make the Z^+-action invertible and locally analytic. Adjunction: a Z^+-map U → V from a locally analytic Z-representation U extends uniquely through C^an(Ẑ) ⊗̂ U → U.

*Sources.* EMJ1, §3.2, Definition 3.2.1 and the following discussion, p. 796: Defines V_fs := L_{b,Z^+}(C^an(Ẑ, K), V) for V in Rep^{top.c}(Z^+), constructing the right adjoint of the forgetful functor from Rep^{zla.c}(Z). EMJ1, §3.2, Propositions 3.2.4–3.2.15 (cited in the construction of J_P), pp. 797–803: Establishes the properties of the finite slope part used to define J_P.

*Needs.* LR.6 *The rigid character variety of an abelian locally analytic group*; `LocallyAnalyticDistributions:L0/bounded-sets-strong-dual`; `LocallyAnalyticDistributions:L0/compact-type-spaces`.

#### Emerton's locally analytic Jacquet functor (`jacquet-emerton-functor`, construction)

Let G be split reductive (or any p-adic reductive group), P = M N a parabolic with Levi M, Z_M the centre of M, N_0 ⊆ N a compact open subgroup, and M^+ := {m ∈ M : m N_0 m^{-1} ⊆ N_0}, Z_M^+ := Z_M ∩ M^+. For a locally analytic representation V of P of compact type, the N_0-invariants V^{N_0} carry the Hecke action of M^+ by π_{N_0, m}(v) = Σ_{n ∈ N_0/mN_0m^{-1}} nm·v, and the Jacquet–Emerton module is J_P(V) := (V^{N_0})_fs (the finite slope part for Z_M^+), a locally analytic representation of M (with its Z_M-action locally analytic). J_P is the right adjoint, twisted by the modulus character δ_P, of C^sm_c(N, −): for U in Rep^{zla.c}(M), Hom_P(C^sm_c(N, U), V) ≅ Hom_M(U(δ_P), J_P(V)). Composing with restriction gives J_P : Rep^{la.c}(G) → Rep^{zla.c}(M). It is left exact, independent of N_0, and agrees with the smooth Jacquet module (SmoothRepresentationsOfLocalGroups SR.2/jacquet-module) on admissible smooth representations.

*Hypotheses and conventions.* Compact-type representations; the Hecke operators require N_0 compact open and M^+ the contracting monoid.

*Uses.* Ding, Lemma 3.2(1), p. 34: Hom_{T(K)}(z^{−s_{i,σ}·λ} w(φ)ηδ_B, J_B(C(I, s_{i,σ}))) ≅ E; BHS §5.1–5.2: J_{B_p}(Π̂^an) and its dual coherent sheaf on T̂, whose support defines the eigenvariety; PadicHodgeParametersInLocallyAnalyticRepresentations, contract LA6: the Jacquet–Emerton/Orlik–Strauch compatibility (3.10).

*API* (namespace `TauCeti.LocallyAnalytic`):

- `jacquetEmerton` (data): J_P(V) := (V^{N_0})_fs as a locally analytic representation of M.
- `jacquetEmerton_adjunction` (universal-property): Hom_P(C^sm_c(N, U), V) ≅ Hom_M(U(δ_P), J_P(V)) for U ∈ Rep^{zla.c}(M).
- `jacquetEmerton_leftExact` (functoriality): J_P is additive and left exact.
- `jacquetEmerton_indep` (extensionality): J_P(V) does not depend on N_0.
- `jacquetEmerton_smooth` (compatibility): On admissible smooth representations, J_P agrees with the smooth Jacquet module V_N.
- `jacquetEmerton_canonicalLift` (projection): The canonical lifting J_P(V) → V^{N_0} ⊆ V (evaluation at 1).

**Checks.**

- `jacquetEmerton_smooth_test` (compatibility): For π smooth admissible, J_P(π) ≅ π_N (SR.2/jacquet-module).
- `jacquetEmerton_P_eq_G` (degenerate): For P = G (N = 1), J_G(V) = V_fs for the centre, which is V when V is locally analytic of compact type with Z_G acting locally analytically.
- `jacquetEmerton_character_PS` (computation): For a locally analytic character χ of T, χδ_B is a T-eigenline in J_B((Ind_{B^-}^G χ)^an) (EMJ2 Lemma 0.3 with P = B).
- `jacquetEmerton_finiteDim_GL2` (computation): For GL_2(ℚ_p) and W = Sym^k(E²), J_B(W) = W^{N} = the highest-weight line, the character z^{(k,0)} of T (EMJ1 Proposition 4.3.6 with X = 1).

*Proof sketch.* V^{N_0} is a closed Z_M^+-stable subspace with Hecke action (EMJ1 §3.3); its finite slope part is defined by LR.6/finite-slope-part. Independence of N_0 and the adjunction (0.4) are EMJ1 §3.4–3.5 (Theorem 3.5.6). Agreement with the smooth Jacquet module: for admissible smooth V, Jacquet's lemma identifies V^{N_0} with finite slope Hecke action and its finite slope part with V_N (SR.2/jacquet-lemma, SR.2/jacquet-invariants).

*Sources.* EMJ1, Introduction, Theorem 0.3 and (0.4), p. 777: C^sm_c(N, −) has a right adjoint; J_P is defined as this right adjoint twisted by the modulus character, with the adjunction isomorphism (0.4); J_P is left exact and additive and agrees with the usual Jacquet module on admissible smooth representations. EMJ1, §3.4, Definition 3.4.5, p. 806: Defines J_P(V) := (V^{N_0})_fs for V in Rep^{la.c}(P).

*Needs.* LR.6 *The finite slope part of a Z^+-representation*; LR.6 *Essentially admissible representations*; LR.0 *Locally analytic representations*; `SmoothRepresentationsOfLocalGroups:SR.2/jacquet-module`; `SmoothRepresentationsOfLocalGroups:SR.2/modulus-character`; `ReductiveGroupsPartII:RG2.4/iwahori-factorization`.

*Planet:* Emerton's Jacquet functor.

#### Admissibility and computations of Emerton's Jacquet modules (`jacquet-emerton-properties`, theorem)

(1) J_P takes essentially admissible G-representations to essentially admissible M-representations, and J_P : Rep^es_E(G) → Rep^es_E(M) is additive and left exact. (2) If W is a finite-dimensional algebraic representation of G with B = End_G(W) and X an admissible smooth representation of G over B, then J_P(X ⊗_B W) ≅ X_N ⊗_B W^N, with X_N the smooth Jacquet module and W^N = W^{N_0} the N-invariants (locally algebraic representations have locally algebraic Jacquet modules). (3) For G quasi-split and P a Borel: a topologically irreducible very strongly admissible V with J_P(V) ≠ 0 is a subquotient of the locally analytic induction of a locally analytic character of the torus; and an admissible representation of finite length with very strongly admissible constituents has finite-dimensional J_P(V). (4) For Π admissible Banach, J_B(Π^la)′ is a coadmissible C^an(T̂, E)-module, i.e. a coherent sheaf on T̂ with a compatible T-action.

*Proof sketch.* (1) is EMJ1 Theorem 4.2.32: compactness of Hecke operators on the BH-subspaces V_{H-an} (EMJ1 §2) gives coadmissibility of the dual of the finite slope part. (2) is EMJ1 Proposition 4.3.6, from Jacquet's lemma for X (SR.2/jacquet-lemma) and W^{N_0} = W^N. (3) is EMJ1 Theorem 0.6 and EMJ2 Corollaries 0.14–0.15, via the adjunction LR.6/emerton-adjunction. (4) combines (1) for P = B with LR.6/essentially-admissible's description of essentially admissible T-representations as coherent sheaves on T̂.

*Sources.* EMJ1, Introduction, Theorem 0.5, p. 777; §4.2, Theorem 4.2.32, p. 828: J_P takes essentially admissible representations to essentially admissible ones, giving an additive left exact functor Rep^es(G) → Rep^es(M). EMJ1, §4.3, Propositions 4.3.4 and 4.3.6, p. 834; Introduction §0.13, p. 779: For X admissible smooth and W algebraic, J_P(X ⊗_B W) ≅ X_N ⊗_B W_N. EMJ1, Introduction, Theorem 0.6, p. 778: For G quasi-split and P Borel, an irreducible admissible representation embedding in an admissible Banach representation with J_P(V) ≠ 0 is a subquotient of a locally analytic principal series. EMJ2, Introduction, Corollaries 0.14–0.15, p. 4: Under the same hypotheses such V is a quotient of I_P^G(U) for a finite-dimensional U, and finite-length admissible representations with very strongly admissible constituents have finite-dimensional J_P. BHS19, §5.1, p. 386: Uses that the continuous dual of J_{B_p}(Π̂^an) is a coherent sheaf on T̂_p.

*Needs.* LR.6 *Emerton's locally analytic Jacquet functor*; LR.6 *Essentially admissible representations*; LR.1 *Locally algebraic representations*; LR.2 *Locally analytic vectors of admissible Banach representations*; LR.2 *Very strongly admissible representations*; LR.4 *Locally analytic principal series*.

#### Emerton's closed induction I_P^G (`closed-induction`, construction)

For U ∈ Rep^{zla.c}(M) (a locally analytic representation of M of compact type on which Z_M acts locally analytically), Lemma 0.3 of Emerton gives a closed M-equivariant embedding U(δ_P) → J_P((Ind_{P^-}^G U)^an) (here P^- is opposite to P, and the induction is the locally analytic induction of LR.4). Composing with the canonical lifting J_P(Ind U) → Ind U, the closed G-subrepresentation I_{P^-}^G(U) ⊆ (Ind_{P^-}^G U)^an generated by the image is Emerton's closed induction. Equivalently it is the closed G-subrepresentation generated by the functions supported on the big cell P^- N with locally constant compactly supported restriction to N (EMJ2 Lemma 2.8.3). The inclusion induces J_P(I_{P^-}^G(U)) ≅ J_P((Ind_{P^-}^G U)^an).

*Hypotheses and conventions.* The conventions match Ding: induction from P^- = B^- of characters of T, Jacquet module for P = B.

*Uses.* Ding, Lemma 3.2(2): I_{B^-}(z^{−s_{i,σ}·λ} w(φ)η) ≅ C(I, s_{i,σ}); Ding, Proposition 3.3 and Remark 3.7: ζ_w(ψ) = I_{B^-}(w(φ)ηz^λ(1 + ψε)) as self-extensions and extensions of π_alg by subrepresentations of PS_1; Emerton, Jacquet II, Theorem 0.13: the source of the adjunction.

*API* (namespace `TauCeti.LocallyAnalytic`):

- `closedInduction` (constructor): I_{P^-}^G(U) ⊆ (Ind_{P^-}^G U)^an, a closed subrepresentation.
- `closedInduction_le` (relation): I_{P^-}^G(U) ⊆ (Ind_{P^-}^G U)^an; the inclusion is in general proper (for U smooth, I(U) is the smooth induction).
- `closedInduction_jacquet` (characterisation): J_P(I(U)) ≅ J_P((Ind U)^an).
- `closedInduction_functorial` (functoriality): Functorial in U.
- `closedInduction_lalg` (example): For U = χ_sm z^λ with λ dominant, I(U) = (Ind χ_sm)^∞ ⊗ L(λ).
- `closedInduction_deformed` (example): For a deformed character U = δ(1 + ψε), I(U) is an E[ε]-module and, for δ = w(φ)ηz^λ, ψ = ψ_1 + ψ_0 ∘ det with ψ_1 smooth: I(U) ≅ (Ind w(φ)η(1 + ψ_1ε))^∞ ⊗ L(λ) ⊗ (1 + εψ_0 ∘ det).

**Checks.**

- `closedInduction_smooth` (computation): For U a smooth character χ, I_{B^-}^G(χ) = (Ind_{B^-}^G χ)^∞, the smooth induction, a proper subspace of the locally analytic one.
- `closedInduction_dominant` (computation): For U = z^λ with λ dominant, I_{B^-}^G(U) = (Ind 1)^∞ ⊗ L(λ).
- `closedInduction_zero` (degenerate): I(0) = 0.
- `closedInduction_nondominant` (non-example): For U = z^{−s·λ}χ with λ dominant and s a simple reflection, I(U) is the irreducible socle F^G_{B^-}(L^-(−s·λ), χ) of the principal series (Ding, Lemma 3.2(2)), not the whole induction.

*Proof sketch.* EMJ2 Lemma 0.3 provides the closed embedding; its image lifts canonically into Ind U (LR.6/jacquet-emerton-functor), and the closed span of its G-translates is I(U). Lemma 2.8.3 identifies the generators with smooth compactly supported functions on the big cell; Corollary 5.1.4 computes J_P of I(U).

*Sources.* EMJ2, Introduction, the definition of I_P^G(U) and Lemma 0.3, p. 2: Defines I_P^G(U) as the closed G-subrepresentation of Ind_P^G U generated by the image of U under the canonical lifting of J_P(Ind_P^G U), using the closed embedding U(δ) → J_P(Ind_P^G U). EMJ2, §2.8, Lemma 2.8.3, pp. 44–45: Describes I_P^G(U) as the closed G-subrepresentation generated by the image of the closed embedding (2.8.2) of compactly supported smooth functions on the big cell. EMJ2, §5.1, Corollary 5.1.4, p. 60: The inclusion I_P^G(U) ⊆ Ind_P^G U induces J_P(I_P^G(U)) ≅ J_P(Ind_P^G U). DING25, §3.1.2, Lemma 3.2(2), Proposition 3.3, Remark 3.7, pp. 34–38: Uses I_{B^-(K)}^{GL_n(K)}(δ) for characters δ and for deformed characters δ(1 + ψε), e.g. I(w(φ)ηz^λ(1 + ψε)) ≅ (Ind w(φ)η(1 + ψ_1ε))^sm ⊗ L(λ) ⊗ (1 + εψ_0 ∘ det).

*Needs.* LR.6 *Emerton's locally analytic Jacquet functor*; LR.4 *Locally analytic parabolic induction*; `SmoothRepresentationsOfLocalGroups:SR.2/smooth-induction`.

*Planet:* Emerton's closed induction.

#### Balanced maps into a Jacquet module (`balanced-map`, definition)

Let U ∈ Rep^{zla.c}(M) and V a locally analytic representation of G. A continuous M-equivariant map U(δ_P) → J_P(V) is balanced if the kernel of the induced (g, P)-map U(g) ⊗_{U(p)} U → U(g) ⊗_{U(p)} J_P(V) → V (via the canonical lifting) contains the kernel of the natural map U(g) ⊗_{U(p)} U → (Ind_{P^-}^G U)^an. L_M(U(δ_P), J_P(V))^bal denotes the subspace of balanced maps; it depends on J_P(V) as the Jacquet module of V, contains the image of Hom_G(I_{P^-}^G(U), V), and the balanced condition does not depend on N_0. U is allowable if, for all finite-dimensional algebraic M-representations W_1, W_2, every A[M]-linear map U ⊗ W_1 → U ⊗ W_2 is strict (A = End_M(U)).

*Hypotheses and conventions.* The condition concerns only the Lie algebra; it is automatic for smooth U and V.

*Uses.* Emerton, Jacquet II, Theorem 0.13: the adjunction is an isomorphism onto balanced maps; Ding, §3.1.2 and §4.1: the adjunction for characters δ (one-dimensional U) used to produce injections of GL_n(K)-representations from eigenvariety tangent computations.

*API* (namespace `TauCeti.LocallyAnalytic`):

- `IsBalanced` (data): The kernel condition on a map U(δ_P) → J_P(V).
- `balancedMaps` (data): L_M(U(δ_P), J_P(V))^bal as a subspace.
- `isBalanced_of_induction` (characterisation): Maps in the image of Hom_G(I(U), V) are balanced.
- `isBalanced_indep` (extensionality): The condition does not depend on N_0.
- `IsAllowable` (data): Every A[M]-linear map U ⊗ W_1 → U ⊗ W_2 is strict.
- `isAllowable_finiteDim` (example): Finite-dimensional U, in particular characters, are allowable.

**Checks.**

- `isBalanced_smooth` (degenerate): If U and V are smooth then every map U(δ_P) → J_P(V) is balanced.
- `isAllowable_character` (computation): A locally analytic character of T is allowable (maps between finite-dimensional spaces are strict).
- `balanced_dominant_character` (computation): For U = z^λ with λ dominant and V = PS(z^λ), the map z^λδ_B → J_B(V) of Lemma 0.3 is balanced, and its image corresponds to I(U) = (Ind 1)^∞ ⊗ L(λ) ⊆ V.
- `isBalanced_of_injective` (characterisation): If U(g) ⊗_{U(p)} U → (Ind_{P^-}^G U)^an is injective (for instance U a character of T of antidominant weight, so that the Verma module is simple), every M-equivariant map U(δ_P) → J_P(V) is balanced: the balanced condition only bites when the generalised Verma module U(g) ⊗_{U(p)} U is reducible.

*Proof sketch.* The canonical lifting J_P(V) → V^{N_0} ⊆ V and the U(g)-action on V give the (g, P)-map; its kernel is compared with that of U(g) ⊗ U → Ind U. Maps coming from I(U) → V are balanced because they factor through the image of U(g) ⊗ U in Ind U (EMJ2 (0.7)).

*Sources.* EMJ2, Introduction, Definition 0.8, Question 0.9 and Definition 0.11, p. 3: Defines balanced maps by comparing the kernels of U(g) ⊗_{U(p)} U → V and of the map to the induction, notes that the image of Hom(I_P^G(U), V) consists of balanced maps and that the condition is independent of N_0, and defines allowable U.

*Needs.* LR.6 *Emerton's locally analytic Jacquet functor*; LR.6 *Emerton's closed induction I_P^G*; LR.0 *The derived action of the Lie algebra*.

#### Emerton's adjunction theorem (`emerton-adjunction`, theorem)

If U ∈ Rep^{zla.c}(M) is allowable and V is a very strongly admissible locally analytic representation of G, then the map Hom_G(I_{P^-}^G(U), V) → L_M(U(δ_P), J_P(V))^bal induced by J_P is an isomorphism. In particular, for a locally analytic character δ of T and P = B: Hom_G(I_{B^-}^G(δ), V) ≅ Hom_T(δδ_B, J_B(V))^bal.

*Hypotheses and conventions.* U allowable; V very strongly admissible (the Banach embedding controls growth).

*Proof sketch.* Injectivity: I(U) is generated by the image of U, which is determined by its Jacquet-module image. Surjectivity: a balanced map defines a (g, P)-map on U(g) ⊗ C^sm_c(N, U) factoring through the coimage I(U)^lp(N); EMJ2 Corollary 4.3.3 extends it continuously to I(U)(N) using very strong admissibility, and G-equivariance spreads it to I(U).

*Sources.* EMJ2, Introduction, Theorem 0.13, p. 4; sketch of proof, p. 4: For allowable U and very strongly admissible V the map (0.10) from G-maps out of I_P^G(U) to balanced maps into J_P(V) is an isomorphism; the proof passes through the (g, P)-invariant subspace of functions supported on the big cell. EMJ2, §4.3, Corollary 4.3.3, p. 58: For very strongly admissible V, an isomorphism L_G(X, V) → L_(g,P)(X^lp(N), V) on which the proof of Theorem 0.13 rests. DING25, §3.1.2, Lemma 3.2 and §4.1, p. 61: Uses Emerton's Definition 0.8 and Theorem 0.13 to pass between T-eigenvectors in J_B and G-maps from I_{B^-}^G.

*Needs.* LR.6 *Balanced maps into a Jacquet module*; LR.6 *Emerton's closed induction I_P^G*; LR.2 *Very strongly admissible representations*.

*Planet:* Emerton's adjunction theorem.

#### Breuil's adjunction for Orlik–Strauch representations (`orlik-strauch-jacquet-adjunction`, theorem)

Let W be a finite-dimensional algebraic representation of P over E (a U(p ⊗ E)-module through p ↠ l_P), π_P a smooth admissible representation of L_P(L) of finite length, and Π a very strongly admissible locally ℚ_p-analytic representation of G(L). There is a natural isomorphism Hom_G(F^G_P((U(g ⊗ E) ⊗_{U(p ⊗ E)} W)^∨, π_P), Π) ≅ Hom_{L_P(L)^+}(W′ ⊗_E π_P, Π^{N_{P,0}}), equivalently ≅ Hom_{L_P(L)}(W′ ⊗_E π_P, J_P(Π)). The same holds for locally σ-analytic Π with σ-analytic Orlik–Strauch representations, and (BHS) for M ∈ O of the form Hom(M, E)^{u∞}: Hom_G(F^G_B(Hom(M, E)^{u∞}, V δ_B^{-1}), Π) ≅ Hom_{T^+}(V, Hom_{U(g)}(M, Π)^{U_0}), functorially in M.

*Hypotheses and conventions.* 𝐆 split connected reductive over L, B = TN ⊆ P = L_P N_P a Borel and a parabolic (standard or opposite), E/ℚ_p finite splitting L; O^p_alg is the category of the gap 'Category O and Kostant homology' for the ℚ_p-Lie algebra g ⊗_{ℚ_p} E = ∏_σ g_σ: finitely generated U(g ⊗ E)-modules, direct sums of simple algebraic U(l_P ⊗ E)-modules, locally finite for n_P ⊗ E. Π very strongly admissible; π_P of finite length.

*Proof sketch.* For W = character and P = B this is Emerton's adjunction (LR.6/emerton-adjunction) combined with the identification of F^G_B((U(g) ⊗ W)^∨, π) with I(W′ ⊗ π)-type closed inductions; in general Breuil reduces to EMJ2 Theorem 0.13 via Hom_{L_P^+}(W′ ⊗ π_P, Π^{N_P^0}) = Hom_{L_P}(W′ ⊗ π_P, J_P(Π)) (BR15 Rem. 4.4(i), using the proof of EMJ1 Theorem 3.5.6). BHS Lemma 5.2.1 deduces the functorial version in M from BR15 Proposition 4.2 together with LR.5/orlik-strauch-products.

*Sources.* BR15, §4, Théorème 4.3, p. 14: For W finite-dimensional algebraic of P, π_P smooth admissible of finite length and Π very strongly admissible, Hom_G(F^G_P((U(g) ⊗_{U(p)} W)^∨, π_P), Π) ≅ Hom_{L_P(L)^+}(W′ ⊗ π_P, Π^{N_P^0}). BR15, §4, Remarque 4.4(i)–(ii), pp. 15–16: Rewrites the isomorphism with the Jacquet–Emerton functor J_P, and states the analogue for locally σ-analytic representations. BHS19, §5.2, Lemma 5.2.1 and its proof, pp. 391–392: For M in category O and V a smooth representation of T_p, Hom_G(F^{G_p}_{B_p}(Hom(M, L)^{u∞}, V δ^{-1}), Π̂^an) ≃ Hom_{T_p^+}(V, Hom_{U(g)}(M, Π̂^an)^{U_0}), functorially in M, using Breuil's Proposition 4.2 and the very strong admissibility.

*Needs.* LR.6 *Emerton's adjunction theorem*; LR.5 *The Orlik–Strauch functor*; LR.5 *Orlik–Strauch theory for products of groups over different fields*.

*Planet:* Breuil's adjunction for Orlik–Strauch representations.

### Examples

- (The rigid character variety of an abelian locally analytic group) For Z = ℤ_p (F = ℚ_p), Ẑ is the open unit disc via χ ↦ χ(1) − 1, and D(ℤ_p, E) ≅ O(open disc) (Amice).
- (Essentially admissible representations) A character χ of T is essentially admissible; so is the regular-type representation C^an(Ẑ, E)′ of T, which is not admissible.
- (The finite slope part of a Z^+-representation) For V a locally analytic Z-representation (Z^+ = Z), V_fs = V.
- (Emerton's locally analytic Jacquet functor) For V = π smooth admissible, J_P(π) = π_N, the smooth Jacquet module (unnormalised).
- (Admissibility and computations of Emerton's Jacquet modules) For π_alg = I_sm(φ) ⊗ L(λ) of GL_n(L) with φ generic, J_B(π_alg) ≅ J_N(I_sm(φ)) ⊗ L(λ)^N is a direct sum of n! distinct characters of T (SmoothRepresentationsOfLocalGroups SR.2/principal-series-jacquet and genericity).
- (Emerton's closed induction I_P^G) For U = z^λ χ_sm with λ dominant, I_{B^-}^G(U) is the locally algebraic subrepresentation (Ind χ_sm)^∞ ⊗ L(λ) of the principal series.
- (Balanced maps into a Jacquet module) For U and V smooth every map is balanced, recovering the smooth Frobenius reciprocity (0.2) of EMJ2.
- (Emerton's adjunction theorem) For U = δ a smooth character and V smooth admissible, the theorem is the smooth Frobenius reciprocity Hom_G((Ind δ)^∞, V) ≅ Hom_T(δδ_B, V_N).
- (Breuil's adjunction for Orlik–Strauch representations) Applied with P = B, W the character z^{−s_{i,σ}·λ}-weight and Π = C(I, s_{i,σ}) it gives Ding's Lemma 3.2(1): Hom_T(z^{−s_{i,σ}·λ} w(φ)ηδ_B, J_B(C(I, s_{i,σ}))) ≅ E (Ding cites BR15 Théorème 4.3 and Remarque 4.4(i)).

### Dependencies

This layer rests on: `AdicSpacesPartII:R3`; `LocallyAnalyticDistributions:L0`; `LocallyAnalyticDistributions:L3`; `LocallyAnalyticDistributionsPartII:ND.2`; LR.0; LR.1; LR.2; LR.4; LR.5; `ReductiveGroupsPartII:RG2.4`; `SmoothRepresentationsOfLocalGroups:SR.2`.

## Layer LR.7: Ext groups of the locally analytic principal series of GL_n

Ding §3.1.1–3.1.2: conventions for GL_n(L), the locally algebraic representation π_alg(φ, h), the principal series PS(w(φ), h) with its constituents C(w, u) and socles, the constituents C(I, s_{i,σ}), PS_1 and π_1(φ, h), the self-extensions of π_alg, the one-dimensional Ext¹ with constituents, the maps ζ_w, Ext¹(π_alg, PS_1) and Ext¹(π_alg, π_1), the amalgam π(φ, h), and the filtration Ext¹_g ⊆ Ext¹_{g′} ⊆ Ext¹_w.

#### Weights, twists and parameter spaces for GL_n(L) (`gln-conventions`, definition)

Fix n ≥ 1, L, E, Σ_L and d_L as above; T ⊆ B ⊆ GL_n is the diagonal torus in the upper Borel, B^- the lower Borel, N and N^- their unipotent radicals. (i) θ := (0, −1, …, 1 − n); for a standard parabolic P ⊇ B with Levi L_P ≅ GL_{n_1} × ⋯ × GL_{n_r}, θ^P := (0^{n_1}, (−n_1)^{n_2}, …, (−(n_1 + ⋯ + n_{r−1}))^{n_r}), an algebraic character of L_P, with θ^B = θ; for 1 ≤ i ≤ n − 1, P_i is the maximal parabolic whose Levi L_i ≅ GL_i × GL_{n−i} has simple roots {1, …, n−1} ∖ {i}. (ii) For a character φ = φ_1 ⊠ ⋯ ⊠ φ_n of T(L) and w ∈ S_n, w(φ) := φ_{w^{-1}(1)} ⊠ ⋯ ⊠ φ_{w^{-1}(n)}; φ is generic if φ_iφ_j^{-1} ∉ {1, |·|_L} for i ≠ j, where |·|_L is the unramified character with |ϖ_L|_L = p^{−[L_0:ℚ_p]}. (iii) δ_B = |·|_L^{n−1} ⊠ ⋯ ⊠ |·|_L^{n+1−2i} ⊠ ⋯ ⊠ |·|_L^{1−n}; η := 1 ⊠ |·|_L ⊠ ⋯ ⊠ |·|_L^{n−1} = |·|_L^{-1} ∘ θ; ε := N_{L/ℚ_p}(·)|·|_L (the cyclotomic character through local class field theory sending a uniformiser to a geometric Frobenius). (iv) A weight h = (h_{σ,i}) ∈ ℤ^{Σ_L × {1,…,n}} is strictly dominant if h_{σ,1} > ⋯ > h_{σ,n} for every σ; then λ := h − θ^{[L:ℚ_p]}, λ_{σ,i} = h_{σ,i} + i − 1, is dominant; z^μ is the algebraic character diag(t_i) ↦ ∏_{σ,i} σ(t_i)^{μ_{σ,i}}; W_Σ := S_n^{Σ_L} acts on weights by the dot action u·μ := u(μ + ρ) − ρ, lg(u) := Σ_σ lg(u_σ), and s_{i,σ} is the simple reflection (i, i+1) in the σ-factor. (v) Hom(T(L), E), Hom_sm(T(L), E) and Hom_σ(T(L), E) are the locally ℚ_p-analytic, smooth and locally σ-analytic additive characters, and Hom_{g′}(T(L), E) := {ψ : ψ − ψ_0 ∘ det ∈ Hom_sm(T(L), E) for some ψ_0 ∈ Hom(L^×, E)}; Hom_{σ,g′} := Hom_{g′} ∩ Hom_σ.

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ. Ding's K and E are this roadmap's L and E; Ding's d_K is d_L.

*Uses.* Ding, §§3.1.2–3.1.4: every construction and dimension count of §3.1 is in this notation; PadicHodgeParametersInLocallyAnalyticRepresentations, contracts LA2–LA5: θ_P constant −Σ_{k<i} n_k on block i and the twist ε^{-1} ∘ θ_P; labels I over all nonempty proper subsets of {1, …, n}.

*API* (namespace `TauCeti.LocallyAnalytic.GLn`):

- `theta` (data): θ ∈ ℤ^n, θ_i = 1 − i.
- `thetaParabolic` (data): θ^P ∈ ℤ^n for a composition (n_1, …, n_r) of n: constant −(n_1 + ⋯ + n_{k−1}) on the k-th block.
- `lambdaOfH` (data): λ := h − θ, λ_{σ,i} = h_{σ,i} + i − 1.
- `permuteCharacter` (data): w(φ)_i := φ_{w^{-1}(i)}.
- `IsGeneric` (data): φ_iφ_j^{-1} ∉ {1, |·|_L} for i ≠ j.
- `eta` (data): η := |·|_L^{-1} ∘ θ.
- `homGPrime` (data): Hom_{g′}(T(L), E) as a subspace of Hom(T(L), E).
- `finrank_homGPrime` (other): dim_E Hom_{g′}(T(L), E) = n + d_L; dim Hom(T(L), E) = n(1 + d_L); dim Hom_sm(T(L), E) = n.
- `permuteCharacter_mul` (relation): (w_1w_2)(φ) = w_1(w_2(φ)).

**Checks.**

- `theta_two` (computation): For n = 2, θ = (0, −1); for n = 3 and the composition (1, 2), θ^P = (0, −1, −1), while θ^B = θ = (0, −1, −2).
- `lambdaOfH_example` (computation): For n = 2, L = ℚ_p and h = (1, 0), λ = (1, 1).
- `permuteCharacter_cycle` (computation): For n = 3 and the cycle w = (1 2 3) (1 ↦ 2 ↦ 3 ↦ 1), w(φ) = φ_3 ⊠ φ_1 ⊠ φ_2.
- `not_IsGeneric` (non-example): φ = φ_1 ⊠ φ_1|·|_L is not generic (its smooth principal series is reducible).
- `finrank_homGPrime_GL1` (degenerate): For n = 1, Hom_{g′}(T(L), E) = Hom(L^×, E), of dimension 1 + d_L.

*Proof sketch.* η = |·|_L^{-1} ∘ θ: the i-th entry of θ is 1 − i, so |·|_L^{−(1−i)} = |·|_L^{i−1}. λ dominant: h_{σ,i} ≥ h_{σ,i+1} + 1 gives λ_{σ,i} = h_{σ,i} + i − 1 ≥ h_{σ,i+1} + i = λ_{σ,i+1}. dim Hom_{g′}(T(L), E) = n + d_L by LR.4/torus-ext (4).

*Sources.* DING25, §3.1.1, pp. 33–34: Fixes θ, θ^P, P_i, w(φ), genericity, δ_B, η = |·|_K^{-1} ∘ θ and the dominant weight conventions. DING25, §2.1, p. 9: Fixes Σ_K, d_K, z^k, |·|_K with |ϖ_K|_K = p^{−[K_0:ℚ_p]}, ε = N_{K/ℚ_p}(·)|·|_K, and Hom, Hom_sm, Hom_σ. DING25, §2.3.1, (2.17), p. 18: Defines Hom_{g′}(T(K), E).

*Needs.* LR.4 *Ext groups between locally analytic characters of a torus*; `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-character`; `SmoothRepresentationsOfLocalGroups:SR.2/modulus-character`; Tau Ceti LieHighestWeight Layer 9; Tau Ceti ReductiveGroups Layer 7.

#### The locally algebraic representation π_alg(φ, h) (`pi-alg`, construction)

For φ generic, I_sm(φ) := (Ind_{B^-(L)}^{GL_n(L)} φη)^∞ is an absolutely irreducible smooth admissible representation, I_sm(φ) ≅ I_sm(w(φ)) =: π_sm(φ) for all w ∈ S_n (the smooth representation attached to the Weil–Deligne representation ⊕φ_i by the classical local Langlands correspondence), and π_alg(φ, h) := π_sm(φ) ⊗_E L(λ) is an irreducible locally algebraic representation of GL_n(L), isomorphic to I_sm(w(φ)) ⊗_E L(λ) for every w. Fix isomorphisms π_alg(φ, h) ≅ L(λ) ⊗_E I_sm(w(φ)) for all w ((3.2) of Ding); the constructions of LR.7–LR.9 are independent of these choices up to the scalars that cancel in Ext¹ (Ding Remark 3.4). End_G(π_alg(φ, h)) = E.

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ.

*Uses.* Ding, Proposition 3.1(2): the socle of every PS(w(φ), h); Ding, Propositions 3.3, 3.6, 3.8: the first argument of every Ext^1 group of §3.1; PadicHodgeParametersInLocallyAnalyticRepresentations, contract LA2: A = π_alg(φ, h) with End(A) ≅ E.

*API* (namespace `TauCeti.LocallyAnalytic.GLn`):

- `smoothPS` (constructor): I_sm(φ) := (Ind_{B^-}^G φη)^∞.
- `smoothPS_irreducible` (characterisation): φ generic ⇒ I_sm(φ) absolutely irreducible and I_sm(φ) ≅ I_sm(w(φ)) for all w.
- `piAlg` (constructor): π_alg(φ, h) := π_sm(φ) ⊗_E L(λ).
- `piAlg_irreducible` (characterisation): π_alg(φ, h) is topologically irreducible and End_G(π_alg) = E.
- `piAlg_iso_w` (relation): The fixed isomorphisms π_alg(φ, h) ≅ L(λ) ⊗ I_sm(w(φ)), w ∈ S_n.
- `piAlg_twist` (relation): π_alg(φ ⊗ (χ ∘ det), h) ≅ π_alg(φ, h) ⊗ χ ∘ det for a smooth character χ of L^×.

**Checks.**

- `piAlg_n1` (degenerate): For n = 1, π_alg(φ, h) = φ_1 z^{h_1}.
- `piAlg_GL2` (computation): For n = 2, L = ℚ_p, h = (1, 0): λ = (1, 1), L(λ) = det, and π_alg(φ, h) = I_sm(φ) ⊗ det, an infinite-dimensional irreducible representation.
- `piAlg_nongeneric_reducible` (non-example): If φ_1 = φ_2|·|_L then I_sm(φ) is reducible (it contains a twist of the Steinberg representation or of a character), so the construction requires genericity.
- `piAlg_lalg` (compatibility): π_alg(φ, h) is locally algebraic: (π_alg)_lalg = π_alg (LR.1/locally-algebraic-representation).

*Proof sketch.* Irreducibility and independence of the order of the generic smooth principal series: SR.3/generic-irreducibility (Bernstein–Zelevinsky). π_alg(φ, h) is admissible and topologically irreducible by LR.1/locally-algebraic-representation (ST01 Proposition 3.4); End = E by Schur's lemma for absolutely irreducible admissible representations.

*Sources.* DING25, §3.1.1, p. 33, and §3.1.2, p. 34: For generic φ, I_sm(φ) is absolutely irreducible, independent of the order of φ, and corresponds to ⊕φ_i; π_alg(φ, h) := π_sm(φ) ⊗_E L(λ) is irreducible locally algebraic. DING25, §3.1.2, (3.2), p. 35; Remark 3.4: Fixes isomorphisms π_alg(φ, h) ≅ L(λ) ⊗ I_sm(w(φ)) for all w; ζ_w does not depend on the choice.

*Needs.* LR.7 *Weights, twists and parameter spaces for GL_n(L)*; LR.1 *Locally algebraic representations*; `SmoothRepresentationsOfLocalGroups:SR.3/generic-irreducibility`; `SmoothRepresentationsOfLocalGroups:SR.2/smooth-induction`; Tau Ceti LieHighestWeight Layer 4.

*Planet:* Locally algebraic representation π_alg(φ, h).

#### The locally analytic principal series PS(w(φ), h) and its constituents C(w, u) (`principal-series-ps`, construction)

For w ∈ S_n put PS(w(φ), h) := (Ind_{B^-(L)}^{GL_n(L)} w(φ)ηz^λ)^{ℚ_p-an} = (Ind_{B^-(L)}^{GL_n(L)} w(φ)z^h(ε^{-1} ∘ θ))^{ℚ_p-an} (LR.4/principal-series). For u ∈ W_Σ = S_n^{Σ_L} put C(w, u) := F^{GL_n}_{B^-}(L^-(−u·λ), w(φ)η), where M^-(μ) := U(gl_{n,Σ_L}) ⊗_{U(b^-_{Σ_L})} μ is the Verma module for b^- and L^-(μ) its simple quotient (for μ antidominant, L^-(μ) is finite-dimensional, isomorphic to L(−μ)^∨). Then PS(w(φ), h) = F^{GL_n}_{B^-}(M^-(−λ), w(φ)η), and π_alg(φ, h) = C(w, 1) ⊆ PS(w(φ), h) through the fixed isomorphisms.

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ.

*Uses.* Ding, Proposition 3.1: constituents and socle filtration of PS(w(φ), h); Ding, (3.10) and Remark 3.9: Ext^1(π_alg, PS) and the amalgam π(φ, h); PadicHodgeParametersInLocallyAnalyticRepresentations, contract LA2: PS(w(φ), h) and its embeddings.

*API* (namespace `TauCeti.LocallyAnalytic.GLn`):

- `PS` (constructor): PS(w(φ), h) := (Ind_{B^-}^G w(φ)ηz^λ)^an.
- `PS_eq` (relation): w(φ)ηz^λ = w(φ)z^h(ε^{-1} ∘ θ), so the two definitions agree.
- `PS_eq_orlikStrauch` (characterisation): PS(w(φ), h) = F^{GL_n}_{B^-}(M^-(−λ), w(φ)η).
- `constituent` (constructor): C(w, u) := F^{GL_n}_{B^-}(L^-(−u·λ), w(φ)η) for u ∈ W_Σ.
- `constituent_one` (example): C(w, 1) ≅ π_alg(φ, h).

**Checks.**

- `PS_eq_character` (computation): On diag(t_1, …, t_n): η(t)z^λ(t) = z^h(t)·∏_i ε(t_i)^{i−1}, i.e. ηz^λ = z^h (ε^{-1} ∘ θ).
- `PS_n1` (degenerate): For n = 1, PS(φ, h) = φ_1 z^{h_1} = C(1, 1).
- `constituent_infinite` (non-example): For u ≠ 1, C(w, u) is infinite-dimensional and not locally algebraic (L^-(−u·λ) is infinite-dimensional because −u·λ is not antidominant).
- `PS_GL2_length` (computation): For n = 2, L = ℚ_p: PS(φ, h) has exactly two constituents, π_alg(φ, h) = C(1, 1) and C(1, s).
- `PS_dual_verma` (compatibility): PS(w(φ), h) agrees with LR.5/orlik-strauch-functor applied to the Verma module M^-(−λ), whose kernel of φ is 0.

*Proof sketch.* The two expressions agree: on t = diag(t_1, …, t_n), z^θ(t) = ∏_i N_{L/ℚ_p}(t_i)^{1−i} and (ε^{-1} ∘ θ)(t) = ∏_i ε(t_i)^{i−1} = ∏_i (N_{L/ℚ_p}(t_i)|t_i|_L)^{i−1}, so z^θ·(ε^{-1} ∘ θ) = ∏_i |t_i|_L^{i−1} = η and z^h(ε^{-1} ∘ θ) = z^λ z^θ (ε^{-1} ∘ θ) = z^λ η. PS = F(M^-(−λ), w(φ)η) is LR.5/orlik-strauch-functor for a Verma module (ker φ = 0), with W the weight −λ, W′ = z^λ; C(w, 1) = F(L^-(−λ), w(φ)η) ≅ L(λ) ⊗ I_sm(w(φ)) by LR.5/orlik-strauch-transitivity with Q = G.

*Sources.* DING25, §3.1.1, p. 33 (Verma modules M^-(μ), L^-(μ), L(−μ)^∨) and §3.1.2, p. 34 (PS(w(φ), h), C(w, u)): Defines the principal series, its two expressions, and the Orlik–Strauch representations C(w, u) attached to the simple quotients L^-(−u·λ).

*Needs.* LR.7 *The locally algebraic representation π_alg(φ, h)*; LR.4 *Locally analytic principal series*; LR.5 *The Orlik–Strauch functor*; LR.5 *Transitivity of the Orlik–Strauch functor along parabolics*.

*Planet:* Locally analytic principal series PS(w(φ), h).

#### Constituents and socle of the locally analytic principal series (Ding, Proposition 3.1) (`principal-series-constituents`, theorem)

For w ∈ S_n: (1) the irreducible constituents of PS(w(φ), h) are the C(w, u), u ∈ W_Σ, which are pairwise non-isomorphic, and those with lg(u) = 1 have multiplicity one; (2) soc_G PS(w(φ), h) ≅ I_sm(w(φ)) ⊗_E L(λ) ≅ π_alg(φ, h); (3) soc_G (PS(w(φ), h)/π_alg(φ, h)) ≅ ⊕_{u ∈ W_Σ, lg(u)=1} C(w, u); (4) for w, w′ ∈ S_n and u, u′ with lg(u) = lg(u′) = 1, C(w, u) ≅ C(w′, u′) if and only if u = u′ = s_{i,σ} for some i ∈ {1, …, n−1}, σ ∈ Σ_L, and w(w′)^{-1} lies in the Weyl group of L_{P_i}.

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ. The composition factors of M^-(−λ) are the L^-(−u·λ), u ∈ W_Σ, each with multiplicity given by Kazhdan–Lusztig polynomials, and multiplicity one for lg(u) ≤ 1; the socle/cosocle structure of the Verma module: inputs of the gap 'Category O and Kostant homology' (Humphreys Chapters 4–6, 8).

*Proof sketch.* (1): by LR.5/orlik-strauch-jordan-holder the constituents of F(M^-(−λ), w(φ)η) are F^G_{Q_u}(L^-(−u·λ), i(w(φ)η)) over composition factors of the Verma module; for u ≠ 1 the maximal parabolic of L^-(−u·λ) is a proper one, and genericity makes the smooth induction to it irreducible, so C(w, u) is irreducible (LR.5/orlik-strauch-irreducibility); multiplicities are Verma multiplicities, one when lg(u) ≤ 1. (2)–(3): F is contravariant and fully faithful on O_alg (LR.5/orlik-strauch-jordan-holder (2), (4)), so the socle and second socle layer of PS correspond to the cosocle L^-(−λ) of M^-(−λ) and the second radical layer ⊕_{lg(u)=1} L^-(−u·λ). (4): by LR.5/orlik-strauch-irreducibility (uniqueness), C(w, s_{i,σ}) = F^G_{P_i^-}(L^-(−s_{i,σ}·λ), i^{L_i}(w(φ)η)) is determined by the smooth induction to L_i, which is invariant exactly under the Weyl group of L_{P_i}.

*Sources.* DING25, §3.1.2, Proposition 3.1 and its proof, p. 34: States (1)–(4); (1) and (4) follow from Orlik–Strauch with the standard facts on constituents of Verma modules (Humphreys, Chapter 6), (2) and (3) from Orlik's Theorem 1. BR16, §2, Corollaries 2.5 and 2.7, pp. 11–12: Socle of F^G_P(M, π_P) and of the induction, and the uniqueness criterion for F^G_{Q_i}(M_i, π_{Q_i}).

*Needs.* LR.7 *The locally analytic principal series PS(w(φ), h) and its constituents C(w, u)*; LR.5 *Jordan–Hölder series and socles of Orlik–Strauch representations*; LR.5 *The Orlik–Strauch irreducibility theorem*.

*Planet:* Constituents of the principal series.

#### The constituents C(I, s_{i,σ}) (`constituent-labels`, construction)

For 1 ≤ i ≤ n − 1, σ ∈ Σ_L and I ⊆ {1, …, n} with #I = i, all C(w, s_{i,σ}) with w({1, …, i}) = I are isomorphic (LR.7/principal-series-constituents (4)); their common isomorphism class is C(I, s_{i,σ}). The C(I, s_{i,σ}) are pairwise distinct for distinct (I, i, σ), and C(I, s_{i,σ}) ≅ soc_G (Ind_{B^-(L)}^{GL_n(L)} z^{−s_{i,σ}·λ} w(φ)η)^{ℚ_p-an} for any w with w({1, …, i}) = I. The labels run over all nonempty proper subsets I ⊂ {1, …, n} (#I = i determines i), giving (2^n − 2)·d_L constituents in total.

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ.

*Uses.* Ding, (3.3), Proposition 3.8 and Lemma 3.10: the second socle layer of π_1(φ, h) and of the parabolic inductions; PadicHodgeParametersInLocallyAnalyticRepresentations, contract LA2: labels use all nonempty proper I ⊂ {1, …, n}, not I ⊂ {1, …, n−1}.

*API* (namespace `TauCeti.LocallyAnalytic.GLn`):

- `constituentLabel` (constructor): C(I, s_{i,σ}) for I ⊂ {1, …, n} nonempty proper, i = #I, σ ∈ Σ_L.
- `constituentLabel_eq` (characterisation): C(w, s_{i,σ}) ≅ C(w({1, …, i}), s_{i,σ}).
- `constituentLabel_injective` (extensionality): C(I, s_{i,σ}) ≅ C(I′, s_{i′,σ′}) iff (I, σ) = (I′, σ′).
- `constituentLabel_socle` (characterisation): C(I, s_{i,σ}) ≅ soc (Ind_{B^-}^G z^{−s_{i,σ}·λ}w(φ)η)^an for w({1, …, i}) = I.
- `card_constituentLabels` (other): The number of labels is (2^n − 2)d_L.

**Checks.**

- `card_constituentLabels_n2` (computation): For n = 2 there are 2d_L labels; for n = 3 there are 6d_L.
- `constituentLabel_n1` (degenerate): For n = 1 there are no labels (no simple reflections).
- `constituentLabel_not_n_minus_one` (non-example): The labels are not the subsets of {1, …, n−1}: for n = 2, I = {2} is a label (giving C({2}, s_{1,σ}) ≅ C(s, s_{1,σ})), although {2} ⊄ {1}.
- `constituentLabel_eq_test` (characterisation): For n = 3, w = (1 3) (so w({1}) = {3}): C(w, s_{1,σ}) ≅ C({3}, s_{1,σ}).

*Proof sketch.* Well-definedness and distinctness: LR.7/principal-series-constituents (4). Socle realisation: by LR.5/orlik-strauch-jordan-holder (2) the socle of (Ind z^{−s·λ}w(φ)η)^an is F^G_{P_i^-}(L^-(−s_{i,σ}·λ), soc i^{L_i}(w(φ)η)), which is C(w, s_{i,σ}). Count: Σ_{i=1}^{n−1} binom(n, i) = 2^n − 2 subsets, times d_L embeddings.

*Sources.* DING25, §3.1.2, the paragraph after Proposition 3.1 and (3.1), pp. 34–35: Defines C(I, s_{i,σ}) as the common class of the C(w, s_{i,σ}) with w({1, …, i}) = I, notes they are pairwise distinct, and realises C(I, s_{i,σ}) as the socle of the principal series of z^{−s_{i,σ}·λ}w(φ)η (citing Orlik's Theorem 1). DING25, §3.1.2, p. 35: Counts (2^n − 2)d_K constituents C(I, s_{i,σ}) in π_1(φ, h)/π_alg(φ, h).

*Needs.* LR.7 *Constituents and socle of the locally analytic principal series (Ding, Proposition 3.1)*; LR.5 *Jordan–Hölder series and socles of Orlik–Strauch representations*.

#### Jacquet–Emerton modules and closed inductions of the constituents (Ding, Lemma 3.2) (`constituent-jacquet`, theorem)

Let w ∈ S_n with w({1, …, i}) = I. (1) Hom_{T(L)}(z^{−s_{i,σ}·λ}w(φ)ηδ_B, J_B(C(I, s_{i,σ}))) ≅ E. (2) I_{B^-(L)}^{GL_n(L)}(z^{−s_{i,σ}·λ}w(φ)η) ≅ C(I, s_{i,σ}). (Ding prints T(ℚ_p) for T(L) in (1); see sourceIssues.)

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ.

*Proof sketch.* Every constituent of PS(w(φ), h) embeds into some locally analytic principal series (LR.5/orlik-strauch-jordan-holder (2)), so it is very strongly admissible (LR.4/locally-analytic-induction with LR.2/very-strongly-admissible). (1): LR.6/orlik-strauch-jacquet-adjunction with P = B computes Hom_T(z^{−s·λ}w(φ)ηδ_B, J_B(C)) as Hom_G(C(I, s), C) = E. (2): the T-eigenline of (1) lies in J_B(C(I, s)) ⊆ J_B((Ind z^{−s·λ}w(φ)η)^an) because Hom_T into J_B of every other constituent vanishes; by the definition of I_{B^-}^G (LR.6/closed-induction) its G-span is the socle C(I, s).

*Sources.* DING25, §3.1.2, Lemma 3.2 and its proof, pp. 34–35: Each constituent of PS is a subrepresentation of a principal series, hence very strongly admissible (Emerton, Jacquet II, Proposition 2.1.2); (1) follows from Breuil's Theorem 4.3 and Remark 4.4(i), and (2) from (1), the vanishing of Hom from the other constituents, and the definition of I_{B^-}^G.

*Needs.* LR.7 *The constituents C(I, s_{i,σ})*; LR.6 *Breuil's adjunction for Orlik–Strauch representations*; LR.6 *Emerton's closed induction I_P^G*; LR.2 *Very strongly admissible representations*; LR.4 *Locally analytic parabolic induction*.

#### The representations PS_1(w(φ), h) and π_1(φ, h) (`ps1-and-pi1`, construction)

PS_1(w(φ), h) ⊆ PS(w(φ), h) is the unique subrepresentation with socle π_alg(φ, h) and cosocle ⊕_{1≤i≤n−1, σ∈Σ_L} C(w, s_{i,σ}). Using the fixed isomorphisms π_alg(φ, h) ≅ L(λ) ⊗ I_sm(w(φ)) ↪ PS_1(w(φ), h), the amalgamated sum ⊕^{w∈S_n}_{π_alg(φ,h)} PS_1(w(φ), h) has a unique quotient π_1(φ, h) with socle π_alg(φ, h). π_1(φ, h) is an extension of ⊕_{i, σ, #I=i} C(I, s_{i,σ}) ((2^n − 2)d_L constituents, each once) by π_alg(φ, h), with tautological injections π_alg(φ, h) ↪ π_1(φ, h) and PS_1(w(φ), h) ↪ π_1(φ, h); it depends only on (φ, h). End_G(π_1(φ, h)) = E, and restriction to the socle gives End(π_1) ≅ End(π_alg) = E.

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ.

*Uses.* Ding, Propositions 3.6–3.8 and Theorem 3.21: Ext^1(π_alg, π_1(φ, h)) carries the Hodge parameters; PadicHodgeParametersInLocallyAnalyticRepresentations, contract LA2: V = π_1(φ, h), its first two socle layers, End(π) → End(V) → End(A) ≅ E.

*API* (namespace `TauCeti.LocallyAnalytic.GLn`):

- `PS1` (constructor): PS_1(w(φ), h) ⊆ PS(w(φ), h).
- `PS1_socle` (characterisation): soc PS_1 = π_alg(φ, h) and PS_1/π_alg ≅ ⊕_{i,σ} C(w, s_{i,σ}).
- `piOne` (constructor): π_1(φ, h), the unique quotient of the amalgamated sum with socle π_alg(φ, h).
- `piOne_socle` (characterisation): soc π_1 = π_alg and π_1/π_alg ≅ ⊕_{(I, i, σ)} C(I, s_{i,σ}), multiplicity one.
- `PS1_to_piOne` (data): The injection PS_1(w(φ), h) ↪ π_1(φ, h) extending the fixed π_alg ↪ PS_1.
- `piOne_end` (characterisation): End_G(π_1(φ, h)) = E; restriction to the socle is an isomorphism End(π_1) ≅ End(π_alg).
- `piOne_indep` (extensionality): π_1(φ, h) does not depend on the choice of the isomorphisms (3.2), up to isomorphism.

**Checks.**

- `piOne_n1` (degenerate): For n = 1, PS_1 = π_1 = π_alg = φ_1 z^{h_1}.
- `piOne_length_n2` (computation): For n = 2 the length of π_1(φ, h) is 1 + 2d_L.
- `piOne_length_n3` (computation): For n = 3 the length of π_1(φ, h) is 1 + 6d_L, and PS_1(w(φ), h) has length 1 + 2d_L.
- `PS1_not_PS` (non-example): For n ≥ 3, PS_1(w(φ), h) ≠ PS(w(φ), h): constituents C(w, u) with lg(u) ≥ 2 lie outside PS_1.

*Proof sketch.* Existence and uniqueness of PS_1: by LR.7/principal-series-constituents (2)–(3), the preimage in PS of soc(PS/π_alg) is the required subrepresentation. Amalgam: the PS_1(w(φ), h) share the socle π_alg via the fixed isomorphisms; the amalgamated sum is admissible of finite length (LR.1/admissible-abelian-category), and its quotient by the largest subrepresentation meeting the socle trivially, modulo identifying isomorphic C(w, s_{i,σ}) across w (LR.7/principal-series-constituents (4)), is π_1, unique with socle π_alg. End = E: an endomorphism minus the scalar by which it acts on the socle kills the socle, so its image is a subrepresentation isomorphic to a quotient of π_1/π_alg = ⊕ C(I, s); since soc(π_1) = π_alg contains no C(I, s), the image is 0.

*Sources.* DING25, §3.1.2, (3.2)–(3.3) and the paragraph before them, p. 35: Defines PS_1(w(φ), h) by its socle and cosocle, forms the amalgamated sum over π_alg(φ, h) and its unique quotient π_1(φ, h) with socle π_alg(φ, h), an extension of the (2^n − 2)d_K constituents C(I, s_{i,σ}) by π_alg(φ, h).

*Needs.* LR.7 *The constituents C(I, s_{i,σ})*; LR.7 *Constituents and socle of the locally analytic principal series (Ding, Proposition 3.1)*; LR.1 *The abelian category of admissible representations*.

*Planet:* The representation π_1(φ, h).

#### Self-extensions of π_alg(φ, h) (Ding, Proposition 3.3) (`self-extensions`, theorem)

(1) For w ∈ S_n and ψ ∈ Hom_{g′}(T(L), E), I_{B^-(L)}^{GL_n(L)}(w(φ)ηz^λ(1 + ψε)) is an extension of π_alg(φ, h) by itself, and ζ_w : Hom_{g′}(T(L), E) → Ext^1_{GL_n(L)}(π_alg(φ, h), π_alg(φ, h)), ψ ↦ I_{B^-}(w(φ)ηz^λ(1 + ψε)), is bijective and restricts to Hom_sm(T(L), E) ≅ Ext^1_lalg(π_alg, π_alg); hence dim Ext^1_lalg = n and dim Ext^1_{GL_n(L)}(π_alg, π_alg) = n + d_L. Explicitly, for ψ = ψ_1 + ψ_0 ∘ det with ψ_1 smooth, I(w(φ)ηz^λ(1 + ψε)) ≅ (Ind_{B^-} w(φ)η(1 + ψ_1ε))^∞ ⊗ L(λ) ⊗_{E[ε]} (1 + εψ_0 ∘ det). (2) For w_1, w_2 ∈ S_n, ζ_{w_2} = ζ_{w_1} ∘ (w_2w_1^{-1}) on Hom_{g′}(T(L), E), where w_2w_1^{-1} acts by permuting coordinates. ζ_w does not depend on the isomorphisms (3.2).

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ.

*Proof sketch.* The canonical embedding w(φ)ηz^λ(1 + ψε)δ_B ↪ J_B((Ind …)^an) factors through (Ind w(φ)η(1 + ψ_1ε))^∞ ⊗ L(λ) ⊗ (1 + εψ_0 ∘ det); by the definition of I (LR.6/closed-induction) this is the closed induction, an E[ε]-self-extension of π_alg. With central character fixed, Ext^1_{lalg,Z} ≅ Ext^1_{G,Z} (LR.1/locally-algebraic-ext), and smooth theory gives Hom_sm(T/Z, E) ≅ Ext^1_{lalg,Z} (dimension n − 1); comparing 0 → Hom_sm(T/Z) → Hom_{g′}(T) → Hom(Z(L), E) → 0 with 0 → Ext^1_Z → Ext^1 → Hom(Z(L), E) → 0 shows ζ_w bijective. (2) reduces to Hom_sm: the maps 𝒥_w (SR.3/part-ii-ordered-character-map) satisfy 𝒥_{w_2} = (w_2w_1^{-1}) ∘ 𝒥_{w_1}, and their tangent maps are the ζ_w (SR.3/part-ii-principal-series-tangent).

*Sources.* DING25, §3.1.2, Proposition 3.3, (3.4)–(3.6), its proof and Remark 3.4, pp. 35–36: Constructs ζ_w through Emerton's closed induction of deformed characters, proves bijectivity using Schraen's Proposition 4.7 for the fixed-central-character part and a comparison of exact sequences with Hom(Z(K), E), and proves (2) through the tangent maps of the Bernstein-centre maps 𝒥_w of Caraiani–Emerton–Gee–Geraghty–Paškūnas–Shin Lemma 3.22.

*Needs.* LR.7 *The locally algebraic representation π_alg(φ, h)*; LR.6 *Emerton's closed induction I_P^G*; LR.1 *Ext groups between locally algebraic representations*; LR.1 *Self-extensions as dual-number modules and tautological extensions*; LR.7 *Weights, twists and parameter spaces for GL_n(L)*; `SmoothRepresentationsOfLocalGroups:SR.3/part-ii-ordered-character-map`; `SmoothRepresentationsOfLocalGroups:SR.3/part-ii-principal-series-tangent`; `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension/central-ext-vanishing`.

#### One-dimensional extension groups with a constituent (Ding, Lemma 3.5) (`constituent-ext-lines`, theorem)

For every C(I, s_{i,σ}): (1) dim_E Ext^1_{GL_n(L)}(C(I, s_{i,σ}), π_alg(φ, h)) = dim_E Ext^1_{GL_n(L)}(π_alg(φ, h), C(I, s_{i,σ})) = 1; more precisely Ext^1(π_alg, C(I, s_{i,σ})) ≅ Ext^1(π_alg, (Ind_{B^-} z^{−s_{i,σ}·λ}w(φ)η)^an) ≅ Hom_{T(L)}(H_1(N^-(L), π_alg), z^{−s_{i,σ}·λ}w(φ)η) ≅ E. (2) For a nonsplit π̃_alg(φ, h) ∈ Ext^1(π_alg, π_alg), pull-back along π̃_alg ↠ π_alg is a bijection Ext^1(π_alg, C(I, s_{i,σ})) ≅ Ext^1(π̃_alg, C(I, s_{i,σ})).

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ. The equality dim Ext^1(C(I, s_{i,σ}), π_alg) = 1 (extensions in the other direction) is quoted by Ding from Breuil–Qian (arXiv 2024, Proposition 5.1.14 with Lemma 3.2.4(ii)); no target of this roadmap uses that direction, and it is recorded as an imported statement with the gap 'Breuil–Qian dimension'.

*Proof sketch.* Schraen's spectral sequence for Σ = π_alg and ρ = δ := z^{−s·λ}w(φ)η (separatedness: π_alg is locally algebraic) has E_2^{p,q} = Ext^p_T(H_q(N^-, π_alg), δ) (LR.4/schraen-spectral-sequence). H_q(N^-, π_alg) = H_q(n^-, L(λ)) ⊗ J_{N^-}(I_sm(φ)) with J_{N^-}(I_sm(φ)) ≅ ⊕_{w′} w′(φ)η (SR.2/principal-series-jacquet) and Kostant (LR.4/unipotent-homology); Ext between distinct torus characters vanishes (LR.4/torus-ext), so in total degree 1 only Hom_T(H_1(N^-, π_alg), δ) ≅ Hom_T(δ, δ) = E survives. Push-forward along C(I, s) ↪ (Ind δ)^an is an isomorphism on Ext^1(π_alg, −) because the other constituents have lg ≥ 2 relative to λ (LR.5/ext-vanishing-long-weyl). (2): the same computation with π̃_alg (whose restriction to SL_n(L) is locally algebraic, so separatedness holds) gives Ext^1(π̃_alg, C(I, s)) ≅ Hom_T(w(φ)ηz^{−s·λ}(1 + ψε), w(φ)ηz^{−s·λ}) with ψ = ζ_w^{-1}(π̃_alg) ≠ 0, which is one-dimensional; the pull-back is injective by dévissage, hence bijective.

*Sources.* DING25, §3.1.2, Lemma 3.5 and its proof, (3.7)–(3.9), pp. 36–37: States (1)–(2); proves (2) and the second equality of (1) with Schraen's spectral sequence (the separatedness hypothesis holds for π_alg and its self-extensions), the vanishing of Ext between distinct torus characters, Schraen's (4.40)–(4.42), the classical Jacquet module of I_sm(φ) and Ding's Lemma 2.26; the first equality is quoted from Breuil–Qian Proposition 5.1.14 and Lemma 3.2.4(ii).

*Needs.* LR.7 *Self-extensions of π_alg(φ, h) (Ding, Proposition 3.3)*; LR.7 *The constituents C(I, s_{i,σ})*; LR.4 *Schraen's spectral sequence for Ext into a parabolic induction*; LR.4 *Homology of locally analytic representations under a unipotent radical*; LR.4 *Ext groups between locally analytic characters of a torus*; LR.5 *Vanishing of Ext¹ into inductions from non-adjacent weights*; `SmoothRepresentationsOfLocalGroups:SR.2/principal-series-jacquet`.

#### The maps ζ_w : Hom(T(L), E) → Ext^1(π_alg(φ, h), π_1(φ, h)) (`zeta-w`, construction)

For w ∈ S_n, sending ψ ∈ Hom(T(L), E) to (Ind_{B^-(L)}^{GL_n(L)} w(φ)ηz^λ(1 + ψε))^{ℚ_p-an} ∈ Ext^1(PS(w(φ), h), PS(w(φ), h)), pulling back along π_alg(φ, h) ↪ PS(w(φ), h) and using the push-forward isomorphism Ext^1(π_alg, PS_1(w(φ), h)) ≅ Ext^1(π_alg, PS(w(φ), h)) (Ding 2019, Lemma 2.26: the constituents of PS/PS_1 have lg ≥ 2) gives the map (3.10) Hom(T(L), E) → Ext^1(π_alg, PS_1(w(φ), h)); composing with push-forward along PS_1(w(φ), h) ↪ π_1(φ, h) gives ζ_w : Hom(T(L), E) → Ext^1_{GL_n(L)}(π_alg(φ, h), π_1(φ, h)) ((3.11)). Equivalently, I_{B^-}(w(φ)ηz^λ(1 + ψε)) ⊆ (Ind w(φ)ηz^λ(1 + ψε))^an is an extension of π_alg by a subrepresentation V ⊆ PS_1(w(φ), h), and ζ_w(ψ) is its push-forward along V ↪ PS_1 ↪ π_1 (Remark 3.7). ζ_w does not depend on the isomorphisms (3.2).

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ.

*Uses.* Ding, Propositions 3.6, 3.8, 3.12 and Theorem 3.21: the GL_n-side counterpart of κ_w^{-1}; t_{φ,h} = ⊕_w ζ_w; PadicHodgeParametersInLocallyAnalyticRepresentations, contracts LA3 and LA6: injective ζ_w : H_T → B with images B_w, and the character-to-Ext compatibility (3.10).

*API* (namespace `TauCeti.LocallyAnalytic.GLn`):

- `zetaPS1` (data): (3.10): Hom(T(L), E) → Ext^1(π_alg, PS_1(w(φ), h)).
- `zeta` (data): ζ_w : Hom(T(L), E) → Ext^1(π_alg(φ, h), π_1(φ, h)).
- `zeta_linear` (structure): ζ_w is E-linear.
- `zeta_eq_closedInduction` (characterisation): ζ_w(ψ) is the push-forward of the closed induction I_{B^-}(w(φ)ηz^λ(1 + ψε)) (Remark 3.7).
- `zeta_indep` (extensionality): ζ_w does not depend on the isomorphisms (3.2).
- `zeta_restrict_gPrime` (compatibility): On Hom_{g′}(T(L), E), ζ_w = (push-forward along π_alg ↪ π_1) ∘ (ζ_w of LR.7/self-extensions).

**Checks.**

- `zeta_zero` (degenerate): ζ_w(0) is the split extension (zero class).
- `zeta_smooth` (computation): For ψ ∈ Hom_sm(T(L), E), ζ_w(ψ) is the push-forward of the locally algebraic extension (Ind w(φ)η(1 + ψε))^∞ ⊗ L(λ) of π_alg by itself.
- `zeta_n1` (degenerate): For n = 1, π_1 = π_alg = φ_1z^{h_1} and ζ_1 : Hom(L^×, E) → Ext^1(χ, χ) is the isomorphism of LR.4/torus-ext.
- `zeta_not_injective_sum` (non-example): For n = 2, L = ℚ_p, the sum ζ_1 + ζ_s : Hom(T, E)^2 → Ext^1(π_alg, π_1) is not injective: the source has dimension 8 and the target n + (2^n − 1)d_L = 5.

*Proof sketch.* (Ind w(φ)ηz^λ(1 + ψε))^an is an E[ε]-self-extension of PS(w(φ), h) (LR.1/self-extension-dual-numbers, LR.4/locally-analytic-induction); pull back along π_alg ↪ PS. The push-forward Ext^1(π_alg, PS_1) → Ext^1(π_alg, PS) is an isomorphism by LR.5/ext-vanishing-long-weyl and dévissage; invert it, then push forward to π_1. Remark 3.7: the closed induction I(w(φ)ηz^λ(1 + ψε)) (LR.6/closed-induction) lies in the deformed induction and maps onto π_alg with kernel inside PS_1, giving the same class.

*Sources.* DING25, §3.1.2, (3.10)–(3.11), p. 37–38, and Remark 3.7, p. 38: Constructs (3.10) and ζ_w from the deformed principal series and Ding's Lemma 2.26, notes independence of (3.2), and gives the equivalent description through Emerton's closed induction.

*Needs.* LR.7 *The representations PS_1(w(φ), h) and π_1(φ, h)*; LR.7 *Self-extensions of π_alg(φ, h) (Ding, Proposition 3.3)*; LR.5 *Vanishing of Ext¹ into inductions from non-adjacent weights*; LR.6 *Emerton's closed induction I_P^G*; LR.1 *Self-extensions as dual-number modules and tautological extensions*.

*Planet:* The maps ζ_w.

#### Ext^1(π_alg, PS_1) is Hom(T(L), E) (Ding, Proposition 3.6) (`ext-ps1`, theorem)

(1) For w ∈ S_n the map (3.10) Hom(T(L), E) → Ext^1_{GL_n(L)}(π_alg(φ, h), PS_1(w(φ), h)) is bijective; in particular dim_E Ext^1(π_alg, PS_1(w(φ), h)) = n + n·d_L = dim Hom(T(L), E). Equivalently ζ_w : Hom(T(L), E) ≅ Ext^1(π_alg, PS(w(φ), h)). (2) ζ_w restricted to Hom_{g′}(T(L), E) equals (3.4) followed by the push-forward Ext^1(π_alg, π_alg) ↪ Ext^1(π_alg, π_1(φ, h)).

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ.

*Proof sketch.* Schraen's spectral sequence for Σ = π_alg, ρ = w(φ)ηz^λ: E_2^{0,1} = Hom_T(H_1(N^-, π_alg), ρ) = 0 (the weights of H_1 are s·λ-type, different from λ), and E_2^{1,0} = Ext^1_T(H_0(N^-, π_alg), ρ) = Ext^1_T(ρ, ρ) ≅ Hom(T(L), E) (LR.4/torus-ext), the other characters of H_0 contributing nothing. Hence Ext^1(π_alg, PS(w(φ), h)) ≅ Hom(T(L), E), and the push-forward from PS_1 is an isomorphism (LR.5/ext-vanishing-long-weyl); the resulting map agrees with (3.10) by construction. (2): both maps send ψ ∈ Hom_{g′} to the class of the locally algebraic-twisted closed induction (LR.7/self-extensions, LR.7/zeta-w).

*Sources.* DING25, §3.1.2, Proposition 3.6 and its proof, p. 38: Proves (1) by the argument of Lemma 3.5 (Schraen's spectral sequence and Ding 2019 Lemma 2.26) and notes (2) is clear; Remark 3.9 restates (1) with PS in place of PS_1.

*Needs.* LR.7 *The maps ζ_w : Hom(T(L), E) → Ext^1(π_alg(φ, h), π_1(φ, h))*; LR.7 *One-dimensional extension groups with a constituent (Ding, Lemma 3.5)*; LR.4 *Schraen's spectral sequence for Ext into a parabolic induction*; LR.5 *Vanishing of Ext¹ into inductions from non-adjacent weights*.

#### The extension group Ext^1(π_alg(φ, h), π_1(φ, h)) (Ding, Proposition 3.8) (`ext-pi1`, theorem)

(1) There is an exact sequence 0 → Ext^1(π_alg, π_alg) → Ext^1(π_alg, π_1(φ, h)) → ⊕_{1≤i≤n−1, σ∈Σ_L, I⊆{1,…,n}, #I=i} Ext^1(π_alg, C(I, s_{i,σ})) → 0 (the source prints I ⊆ {1, …, n−1}; see sourceIssues), so dim_E Ext^1_{GL_n(L)}(π_alg(φ, h), π_1(φ, h)) = n + (2^n − 1)d_L. (2) The map t_{φ,h} := (ζ_w)_w : ⊕_{w∈S_n} Hom(T(L), E) → Ext^1(π_alg, π_1(φ, h)) is surjective. (3) (Remark 3.9.) The push-forward Ext^1(π_alg, π_1(φ, h)) → Ext^1(π_alg, π(φ, h)) is an isomorphism (LR.7/finite-slope-amalgam), so (2) holds with π(φ, h) in place of π_1(φ, h).

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ.

*Proof sketch.* Dévissage of 0 → π_alg → π_1 → ⊕ C(I, s) → 0 with Hom(π_alg, C(I, s)) = 0 gives the left part of the sequence; it suffices to show the last map surjective. For each w, 0 → Ext^1(π_alg, π_alg) → Ext^1(π_alg, PS_1(w(φ), h)) → ⊕_{i,σ} Ext^1(π_alg, C(w, s_{i,σ})) is exact (3.14), and by dimensions (n + d_L, n + nd_L and (n−1)d_L one-dimensional terms; LR.7/self-extensions, LR.7/ext-ps1, LR.7/constituent-ext-lines) the last map is surjective. Every C(I, s_{i,σ}) is a C(w, s_{i,σ}) for some w, so varying w covers the target (3.15); this gives (1) and, with LR.7/ext-ps1, the surjectivity (2). The dimension is (n + d_L) + (2^n − 2)d_L.

*Sources.* DING25, §3.1.2, Proposition 3.8, (3.12)–(3.15) and its proof, pp. 38–39: Proves the exact sequence by dévissage, surjectivity of the last map by comparing dimensions in (3.14) and covering the targets by varying w in (3.15), and surjectivity of t_{φ,h}; the dimension n + (2^n − 1)d_K follows from Lemma 3.5 and Proposition 3.6. DING25, §3.1.2, Remark 3.9, (3.16), p. 39: Replaces π_1(φ, h) by π(φ, h) via the push-forward isomorphism.

*Needs.* LR.7 *Ext^1(π_alg, PS_1) is Hom(T(L), E) (Ding, Proposition 3.6)*; LR.7 *One-dimensional extension groups with a constituent (Ding, Lemma 3.5)*; LR.7 *Self-extensions of π_alg(φ, h) (Ding, Proposition 3.3)*; LR.7 *The representations PS_1(w(φ), h) and π_1(φ, h)*; LR.1 *Ext groups of admissible locally analytic representations*.

*Planet:* Ext¹(π_alg, π_1) and the surjection t_{φ,h}.

#### The amalgam π(φ, h) of the principal series (`finite-slope-amalgam`, construction)

π(φ, h) is the unique quotient of the amalgamated sum ⊕^{w∈S_n}_{π_alg(φ,h)} PS(w(φ), h) (over the fixed π_alg ↪ PS(w(φ), h)) with socle π_alg(φ, h); it is the representation π(ρ)^{fs} of Breuil–Herzig (Definition 5.7) in this setting. π_1(φ, h) is the subrepresentation formed by the first two layers of the socle filtration of π(φ, h), and push-forward along π_1(φ, h) ↪ π(φ, h) is an isomorphism Ext^1(π_alg, π_1(φ, h)) ≅ Ext^1(π_alg, π(φ, h)).

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ.

*Uses.* Ding, Theorem 1.1 and §3.2: the Hodge parameters are stated with π(φ, h) while proofs use π_1(φ, h); Breuil–Herzig, Definition 5.7: the finite slope part Π(ρ)^{fs} of the conjectural p-adic correspondence.

*API* (namespace `TauCeti.LocallyAnalytic.GLn`):

- `piFS` (constructor): π(φ, h), the unique quotient of the amalgam of the PS(w(φ), h) with socle π_alg.
- `piOne_le_piFS` (relation): π_1(φ, h) ↪ π(φ, h), the first two socle layers.
- `ext_piOne_piFS` (characterisation): Push-forward Ext^1(π_alg, π_1) → Ext^1(π_alg, π) is an isomorphism.
- `piFS_eq_BreuilHerzig` (compatibility): π(φ, h) ≅ π(ρ)^{fs} of BH20 Definition 5.7 for the crystabelline ρ attached to (φ, h).

**Checks.**

- `piFS_n2` (computation): For n = 2, L = ℚ_p: π(φ, h) = π_1(φ, h).
- `piFS_n1` (degenerate): For n = 1, π(φ, h) = π_alg(φ, h) = φ_1z^{h_1}.
- `piFS_ne_piOne_n3` (non-example): For n = 3, π(φ, h) ≠ π_1(φ, h): it contains constituents C(w, u) with lg(u) = 2, which are not in π_1.
- `ext_piOne_piFS_test` (characterisation): dim Ext^1(π_alg, π(φ, h)) = n + (2^n − 1)d_L.

*Proof sketch.* The amalgamated sum is admissible of finite length (LR.1/admissible-abelian-category); its quotient by the largest subrepresentation meeting the socle π_alg trivially has socle π_alg and is unique. Its socle filtration: the first layer is π_alg, the second ⊕ C(I, s) (LR.7/principal-series-constituents (3)), so the first two layers form π_1. Push-forward isomorphism: the constituents of π(φ, h)/π_1(φ, h) are C(w, u) with lg(u) ≥ 2, for which Ext^1(π_alg, −) and Hom(π_alg, −) vanish (LR.5/ext-vanishing-long-weyl).

*Sources.* DING25, §3.1.2, Remark 3.9 and (3.16), p. 39: Defines π(φ, h) as the unique quotient of the amalgamated sum of the PS(w(φ), h) with socle π_alg(φ, h), identifies it with π(ρ)^{fs} of Breuil–Herzig Definition 5.7, notes π_1 is its first two socle layers, and proves the push-forward isomorphism via Ding 2019 Lemma 2.26. BH20, §5, Definition 5.7(i)–(iv), pp. 26–27: Defines M(w_alg, F) as the largest subrepresentation of a principal series whose constituents beyond the socle avoid C_soc(ρ), the amalgams M(ρ)_C over common socles, their unique quotients with socle C, and Π(ρ)^{fs} as the direct sum.

*Needs.* LR.7 *The representations PS_1(w(φ), h) and π_1(φ, h)*; LR.7 *Constituents and socle of the locally analytic principal series (Ding, Proposition 3.1)*; LR.5 *Vanishing of Ext¹ into inductions from non-adjacent weights*.

#### The filtration Ext^1_g ⊆ Ext^1_{g′} ⊆ Ext^1_w of Ext^1(π_alg, π_1) (`ext-filtration`, definition)

Inside Ext^1(π_alg(φ, h), π_1(φ, h)) define Ext^1_g (respectively Ext^1_{g′}, respectively Ext^1_w = Ext^1_{T_w}) as the image of Ext^1_lalg(π_alg, π_alg) (respectively of Ext^1(π_alg, π_alg), respectively of ζ_w), T_w being the B-filtration of ⊕φ_i attached to w. Then ζ_w : Hom(T(L), E) ≅ Ext^1_w (3.17); Ext^1_g ⊆ Ext^1_{g′} ⊆ Ext^1_w for every w, of dimensions n, n + d_L and n(1 + d_L); and for w_1, w_2, ζ_{w_2} = ζ_{w_1} ∘ (w_2w_1^{-1}) on Hom_{g′}(T(L), E) (3.18).

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ.

*Uses.* Ding, §3.2: the comparison matches Ext^1_0 ⊆ Ext^1_g ⊆ Ext^1_{g′} ⊆ Ext^1_w ⊆ Ext^1 on the Galois side with this filtration; PadicHodgeParametersInLocallyAnalyticRepresentations, contract LA3: B_g ≤ B_{g′} ≤ B_w with dim B_g = n, dim B_{g′} = n + d_K and Σ_w B_w = B.

*API* (namespace `TauCeti.LocallyAnalytic.GLn`):

- `extG` (data): Ext^1_g(π_alg, π_1), the image of Ext^1_lalg(π_alg, π_alg).
- `extGPrime` (data): Ext^1_{g′}(π_alg, π_1), the image of Ext^1(π_alg, π_alg).
- `extW` (data): Ext^1_w(π_alg, π_1) := range ζ_w.
- `extG_le_extGPrime` (relation): Ext^1_g ⊆ Ext^1_{g′} ⊆ Ext^1_w for every w.
- `finrank_ext_filtration` (other): dim Ext^1_g = n, dim Ext^1_{g′} = n + d_L, dim Ext^1_w = n(1 + d_L).
- `iSup_extW` (characterisation): Σ_w Ext^1_w = Ext^1(π_alg, π_1) (LR.7/ext-pi1 (2)).
- `zeta_weyl` (relation): ζ_{w_2} = ζ_{w_1} ∘ (w_2w_1^{-1}) on Hom_{g′}(T(L), E).

**Checks.**

- `ext_filtration_dims_n2` (computation): For n = 2, L = ℚ_p: dim Ext^1_g = 2, dim Ext^1_{g′} = 3, dim Ext^1_w = 4, dim Ext^1 = 5.
- `ext_filtration_n1` (degenerate): For n = 1, Ext^1_{g′} = Ext^1_w = Ext^1 = Hom(L^×, E) and Ext^1_g = Hom_sm(L^×, E).
- `extW_ne_ext` (non-example): For n ≥ 2 a single Ext^1_w is a proper subspace of Ext^1(π_alg, π_1): n(1 + d_L) < n + (2^n − 1)d_L.
- `extGPrime_common` (characterisation): Ext^1_{g′} is the same subspace for every w (independent of w), although the parametrisations ζ_w differ by the permutation w_2w_1^{-1}.

*Proof sketch.* Push-forward Ext^1(π_alg, π_alg) → Ext^1(π_alg, π_1) is injective (Hom(π_alg, π_1/π_alg) = 0), giving Ext^1_g ⊆ Ext^1_{g′}; LR.7/ext-ps1 (2) gives Ext^1_{g′} ⊆ Ext^1_w. ζ_w is injective: it factors through the bijection of LR.7/ext-ps1 followed by the push-forward PS_1 ↪ π_1, injective on Ext^1 by dévissage; (3.18) is LR.7/self-extensions (2).

*Sources.* DING25, §3.1.2, (3.17)–(3.18), p. 39: Defines Ext^1_g ⊆ Ext^1_{g′} ⊆ Ext^1_w as images of Ext^1_lalg(π_alg, π_alg), Ext^1(π_alg, π_alg) and ζ_w, records ζ_w : Hom(T(K), E) ≅ Ext^1_w and the commutative square (3.18).

*Needs.* LR.7 *The extension group Ext^1(π_alg(φ, h), π_1(φ, h)) (Ding, Proposition 3.8)*; LR.7 *Ext^1(π_alg, PS_1) is Hom(T(L), E) (Ding, Proposition 3.6)*; LR.7 *Self-extensions of π_alg(φ, h) (Ding, Proposition 3.3)*.

### Examples

- (Weights, twists and parameter spaces for GL_n(L)) η z^λ = z^h · (ε^{-1} ∘ θ) as characters of T(L) (the computation is in LR.7/principal-series-ps).
- (The locally algebraic representation π_alg(φ, h)) For n = 1, π_alg(φ, h) = φ_1 z^{h_1}, a character.
- (The locally analytic principal series PS(w(φ), h) and its constituents C(w, u)) For n = 1, PS(φ, h) = C(1, 1) = φ_1 z^{h_1}.
- (Constituents and socle of the locally analytic principal series (Ding, Proposition 3.1)) For n = 2, L = ℚ_p: PS(w(φ), h) is a nonsplit extension of C(w, s) by π_alg(φ, h), and C(1, s) ≇ C(s, s).
- (The constituents C(I, s_{i,σ})) For n = 2 the labels are I = {1}, {2} with i = 1, giving C({1}, s_{1,σ}) and C({2}, s_{1,σ}) for each σ: 2d_L constituents.
- (Jacquet–Emerton modules and closed inductions of the constituents (Ding, Lemma 3.2)) For n = 2, L = ℚ_p: I_{B^-}^G(z^{−s·λ}φη) ≅ C(1, s) = C({1}, s).
- (The representations PS_1(w(φ), h) and π_1(φ, h)) For n = 2, L = ℚ_p: π_1(φ, h) is the amalgam of PS_1(φ, h) = PS(φ, h) and PS_1(s(φ), h) = PS(s(φ), h) over π_alg, with cosocle C({1}, s) ⊕ C({2}, s).
- (Self-extensions of π_alg(φ, h) (Ding, Proposition 3.3)) For n = 1: Ext^1_{L^×}(χ, χ) = Hom(L^×, E) of dimension 1 + d_L, Ext^1_lalg of dimension 1.
- (One-dimensional extension groups with a constituent (Ding, Lemma 3.5)) For n = 2, L = ℚ_p: Ext^1(π_alg, C({1}, s)) and Ext^1(π_alg, C({2}, s)) are each one-dimensional.
- (The maps ζ_w : Hom(T(L), E) → Ext^1(π_alg(φ, h), π_1(φ, h))) On Hom_{g′}(T(L), E), ζ_w is the composite of the bijection of LR.7/self-extensions with push-forward along π_alg ↪ π_1 (Ding, Proposition 3.6(2)).
- (Ext^1(π_alg, PS_1) is Hom(T(L), E) (Ding, Proposition 3.6)) For n = 2, L = ℚ_p: dim Ext^1(π_alg, PS_1(φ, h)) = 4.
- (The extension group Ext^1(π_alg(φ, h), π_1(φ, h)) (Ding, Proposition 3.8)) For n = 2, L = ℚ_p: dim Ext^1(π_alg, π_1) = 2 + 3 = 5, while ⊕_{w} Hom(T, E) has dimension 8.
- (The amalgam π(φ, h) of the principal series) For n = 2 (and d_L = 1), π(φ, h) = π_1(φ, h) since PS has length 2.
- (The filtration Ext^1_g ⊆ Ext^1_{g′} ⊆ Ext^1_w of Ext^1(π_alg, π_1)) For n = 2, L = ℚ_p: dimensions 2 ⊆ 3 ⊆ 4 inside 5.

### Dependencies

This layer rests on: LR.1; LR.2; LR.4; LR.5; LR.6; `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`; `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension`; `SmoothRepresentationsOfLocalGroups:SR.2`; `SmoothRepresentationsOfLocalGroups:SR.3`; Tau Ceti ReductiveGroups Layer 7; Tau Ceti LieHighestWeight Layer 4; Tau Ceti LieHighestWeight Layer 9.

## Layer LR.8: Parabolic induction and the amalgamation of π_1

Ding §3.1.3: Levi data of a P-filtration and the induction (3.19), the constituents of a parabolic induction, π_{F_P}(φ, h), Ext¹(π_alg, π_{F_P}), the map ζ_{F_P} and its bijectivity, and the amalgamation of the two endpoint parabolics into π_1(φ, h).

#### Levi data of a P-filtration and the parabolic induction (3.19) (`parabolic-levi-data`, construction)

Let P ⊇ B be a standard parabolic with Levi L_P = diag(GL_{n_1}, …, GL_{n_r}) and Weyl group W_P. A P-filtration F_P of ⊕_{i=1}^n φ_i is an ordering of the φ_i into consecutive blocks of sizes n_1, …, n_r; put φ_{F_P,i} := ⊗_{φ_j ∈ gr^i F_P} φ_j, h^i := (h_{n_1+⋯+n_{i−1}+1}, …, h_{n_1+⋯+n_i}) and λ^i the corresponding dominant weight. LR.7 applied to (φ_{F_P,i}, h^i) gives π_alg(φ_{F_P,i}, h^i) ⊆ π_1(φ_{F_P,i}, h^i) for GL_{n_i}(L); for n_i = 1 both equal φ_{n_1+⋯+n_{i−1}+1} z^{h_{n_1+⋯+n_{i−1}+1}} (the source prints the index without the +1; see sourceIssues). Fixing compatible isomorphisms (transitivity of parabolic induction, matching (3.2) for all w ∈ W_P), there is an injection π_alg(φ, h) ≅ (Ind_{P^-(L)}^{GL_n(L)} (⊠_i π_alg(φ_{F_P,i}, h^i)) ε^{-1} ∘ θ^P)^{lalg} ↪ (Ind_{P^-(L)}^{GL_n(L)} (⊗̂_i π_1(φ_{F_P,i}, h^i)) ε^{-1} ∘ θ^P)^{ℚ_p-an} ((3.19)), with ⊗̂ the completed tensor product of LR.0/completed-external-tensor.

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ.

*Uses.* Ding, Lemma 3.10 and (3.21)–(3.27): constituents of the parabolic induction, π_{F_P}(φ, h) and ζ_{F_P}; PadicHodgeParametersInLocallyAnalyticRepresentations, contract LA4: θ_P constant −Σ_{k<i} n_k on block i and the twist ε^{-1} ∘ θ_P; completed external tensor products.

*API* (namespace `TauCeti.LocallyAnalytic.GLn`):

- `PFiltration` (data): An ordering of φ_1, …, φ_n into blocks of sizes n_1, …, n_r.
- `leviCharacter` (data): φ_{F_P,i}, the characters of the i-th block.
- `leviWeight` (data): h^i and λ^i.
- `parabolicInduction` (constructor): (Ind_{P^-}^G (⊗̂_i π_1(φ_{F_P,i}, h^i)) ε^{-1} ∘ θ^P)^an.
- `piAlg_to_parabolic` (data): The injection (3.19).
- `PFiltration.compatible` (data): T_w is compatible with F_P (refines it).

**Checks.**

- `leviData_B` (degenerate): For P = B, each block has size 1 and the parabolic induction is PS(w(φ), h) for the w with T_w = F_P.
- `leviData_G` (degenerate): For P = G (r = 1), the parabolic induction is π_1(φ, h) itself and (3.19) is π_alg ↪ π_1.
- `leviWeight_n1_block` (computation): For a block of size 1 starting at position k = n_1 + ⋯ + n_{i−1} + 1, π_alg(φ_{F_P,i}, h^i) = φ_k z^{h_k} (not φ_{k−1} z^{h_{k−1}}).
- `thetaP_block` (computation): For n = 3 and blocks (2, 1), θ^P = (0, 0, −2).

*Proof sketch.* Transitivity of parabolic induction (LR.4/locally-analytic-induction) identifies I_sm(w(φ)) ⊗ L(λ) with the induction from P^- of ⊠_i I_sm(w_i(φ_{F_P,i})) ⊗ L(λ^i) twisted by ε^{-1} ∘ θ^P; the twist corrects the shift between λ and (λ^i)_i. Compatibility for all w ∈ W_P is arranged by choosing the GL_{n_i}-isomorphisms first and transporting. π_alg(φ_{F_P,i}, h^i) ↪ π_1(φ_{F_P,i}, h^i) and exactness of induction give (3.19).

*Sources.* DING25, §3.1.3, the paragraph before Lemma 3.10 and (3.19), p. 40: Defines F_P, φ_{F_P,i}, h^i, λ^i, the GL_{n_i}(K)-representations π_alg(φ_{F_P,i}, h^i) ⊆ π_1(φ_{F_P,i}, h^i), the compatible isomorphisms and the injection (3.19) into the parabolic induction of ⊗̂_i π_1(φ_{F_P,i}, h^i) twisted by ε^{-1} ∘ θ^P.

*Needs.* LR.7 *The representations PS_1(w(φ), h) and π_1(φ, h)*; LR.7 *Weights, twists and parameter spaces for GL_n(L)*; LR.4 *Locally analytic parabolic induction*; LR.0 *Completed external tensor products of representations*.

#### Which constituents C(I, s_{i,σ}) occur in a parabolic induction (Ding, Lemma 3.10) (`parabolic-constituents`, theorem)

For 1 ≤ i ≤ n − 1, σ ∈ Σ_L and I ⊆ {1, …, n} with #I = i, C(I, s_{i,σ}) is an irreducible constituent of (Ind_{P^-}^{GL_n} (⊗̂_j π_1(φ_{F_P,j}, h^j)) ε^{-1} ∘ θ^P)^{ℚ_p-an} if and only if either (1) there is k with n_1 + ⋯ + n_{k−1} + 1 ≤ i ≤ n_1 + ⋯ + n_k − 1 and {j : φ_j ∈ Fil_{F_P}^{k−1}} ⊆ I ⊆ {j : φ_j ∈ Fil_{F_P}^k}, or (2) i = n_1 + ⋯ + n_k for some k ≤ r − 1 and I = {j : φ_j ∈ Fil_{F_P}^k}. Each such constituent has multiplicity one and lies in the socle of the quotient of the induction by π_alg(φ, h).

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ. Multiplicity one of L^-(−s_{i,σ}·λ) in the parabolic Verma module and its position in the cosocle of the kernel to L^-(−λ) are inputs of the gap 'Category O and Kostant homology'.

*Proof sketch.* Case (2) (i at a block boundary): the constituents come from V_0 = induction of ⊠_i π_alg(φ_{F_P,i}, h^i); they are F of the constituents L^-(−s_{i,σ}·λ) of the parabolic Verma module, multiplicity one and in the cosocle of the kernel, hence in the socle of the quotient by π_alg (LR.5/orlik-strauch-jordan-holder). Case (1) (i inside a block): V_I := induction of ⊠_{i≠k} π_alg ⊠ C(I, s_{i,σ})_k embeds into (Ind z^{−s·λ}w(φ)η)^an for w({1, …, i}) = I, whose socle is C(I, s) with multiplicity one; a closed subrepresentation W of the principal series shows C(I, s) lies in the socle of the quotient by π_alg. Every C(I, s) in the induction comes from V_0 or a V_I by exactness and Orlik–Strauch, with multiplicity one.

*Sources.* DING25, §3.1.3, Lemma 3.10 and its proof, pp. 40–41: Characterises the constituents C(I, s_{i,σ}) of the parabolic induction, using Orlik–Strauch, multiplicity one of L^-(−s_{i,σ}·λ) in the parabolic Verma module U(gl_{n,Σ_K}) ⊗_{U(p_{Σ_K})} (−λ), (3.1) and transitivity of parabolic induction.

*Needs.* LR.8 *Levi data of a P-filtration and the parabolic induction (3.19)*; LR.7 *The constituents C(I, s_{i,σ})*; LR.5 *Jordan–Hölder series and socles of Orlik–Strauch representations*; LR.5 *Transitivity of the Orlik–Strauch functor along parabolics*.

#### The subrepresentation π_{F_P}(φ, h) and Ext^1_{F_P} (`pi-fp`, construction)

Let S_{F_P} be the set of constituents C(I, s_{i,σ}) satisfying LR.8/parabolic-constituents; #S_{F_P} = (Σ_{i=1}^r (2^{n_i} − 2) + (r − 1))·d_L ((3.21)). π_{F_P}(φ, h) is the unique subrepresentation of the parabolic induction (3.19) with socle π_alg(φ, h) and π_{F_P}(φ, h)/π_alg(φ, h) ≅ ⊕_{C∈S_{F_P}} C. For P = B and F_P = T_w, π_{F_P}(φ, h) ≅ PS_1(w(φ), h). The injection π_alg ↪ π_{F_P} extends uniquely to π_{F_P}(φ, h) ↪ π_1(φ, h); Ext^1_{F_P}(π_alg, π_1) denotes the image of the (injective) push-forward Ext^1(π_alg, π_{F_P}) → Ext^1(π_alg, π_1), and Ext^1_{F_P,g′} := ζ_{F_P}(∏_i Ext^1_{g′}(π_alg(φ_{F_P,i}, h^i), π_1(φ_{F_P,i}, h^i))) (LR.8/zeta-fp).

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ.

*Uses.* Ding, Propositions 3.11–3.13: Ext^1(π_alg, π_{F_P}) and the amalgamation π_F ⊕ π_G → π_1; PadicHodgeParametersInLocallyAnalyticRepresentations, contract LA4: π_F with its inclusion and the normalised images B_F.

*API* (namespace `TauCeti.LocallyAnalytic.GLn`):

- `SFP` (data): S_{F_P}, the constituents of LR.8/parabolic-constituents.
- `card_SFP` (other): #S_{F_P} = (Σ_i (2^{n_i} − 2) + (r − 1))d_L.
- `piFP` (constructor): π_{F_P}(φ, h).
- `piFP_to_piOne` (data): The unique extension π_{F_P} ↪ π_1 of π_alg ↪ π_1.
- `piFP_B` (example): π_{T_w}(φ, h) ≅ PS_1(w(φ), h).
- `extFP` (data): Ext^1_{F_P}(π_alg, π_1), the image of Ext^1(π_alg, π_{F_P}).

**Checks.**

- `card_SFP_B` (computation): For P = B (all n_i = 1): #S_{F_P} = (n − 1)d_L, the C(w, s_{i,σ}).
- `card_SFP_G` (degenerate): For P = G (r = 1): #S_{F_P} = (2^n − 2)d_L, and π_{F_P} = π_1.
- `card_SFP_maximal` (computation): For n = 3 and P = P_2 (blocks (2, 1)): #S_{F_P} = ((2² − 2) + 0 + 1)d_L = 3d_L.
- `piFP_ne_piOne` (non-example): For P = B and n ≥ 2, π_{F_P} = PS_1(w(φ), h) is a proper subrepresentation of π_1(φ, h) (its second layer has (n − 1)d_L of the (2^n − 2)d_L constituents).

*Proof sketch.* Existence and uniqueness: LR.8/parabolic-constituents puts every C ∈ S_{F_P} in the socle of the quotient by π_alg with multiplicity one; take the preimage. Count: within block k, i ranges over n_{<k} + 1, …, n_{≤k} − 1 and I over the subsets between consecutive filtration steps, giving Σ_k (2^{n_k} − 2); at the r − 1 block boundaries there is one I each; times d_L. Extension to π_1: both have socle π_alg and the constituents of π_{F_P}/π_alg are among those of π_1/π_alg, each once (Hom computations with multiplicity one).

*Sources.* DING25, §3.1.3, (3.21), the definition of π_{F_P}(φ, h) and the remarks after it, pp. 40–41: Counts S_{F_P}, defines π_{F_P}(φ, h) by its socle and second layer, identifies it with PS_1(w(φ), h) for P = B, and extends π_alg ↪ π_{F_P} uniquely to π_{F_P} ↪ π_1. DING25, §3.1.3, the definitions after Proposition 3.11 and after Proposition 3.12, pp. 41–43: Defines Ext^1_{F_P}(π_alg, π_1) as the image of (3.22) and Ext^1_{F_P,g′} through ζ_{F_P}.

*Needs.* LR.8 *Which constituents C(I, s_{i,σ}) occur in a parabolic induction (Ding, Lemma 3.10)*; LR.7 *The representations PS_1(w(φ), h) and π_1(φ, h)*; LR.1 *The abelian category of admissible representations*.

#### The extension group Ext^1(π_alg, π_{F_P}) (Ding, Proposition 3.11) (`ext-pi-fp`, theorem)

dim_E Ext^1_{GL_n(L)}(π_alg(φ, h), π_{F_P}(φ, h)) = n + d_L·r + d_L·Σ_{i=1}^r (2^{n_i} − 2), and the push-forward Ext^1(π_alg, π_{F_P}) → Ext^1(π_alg, π_1) is injective.

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ.

*Proof sketch.* 0 → Ext^1(π_alg, π_{F_P}) → Ext^1(π_alg, π_1) → Ext^1(π_alg, ⊕_{C∉S_{F_P}} C) is exact since Hom(π_alg, C) = 0. The last map is surjective by LR.7/ext-pi1 (1); each Ext^1(π_alg, C) is one-dimensional (LR.7/constituent-ext-lines), so dim = n + (2^n − 1)d_L − ((2^n − 2)d_L − #S_{F_P}) = n + d_L + #S_{F_P}, which equals the formula by (3.21).

*Sources.* DING25, §3.1.3, Proposition 3.11 and its proof, (3.22)–(3.23), p. 41: By dévissage of 0 → π_{F_P} → π_1 → ⊕_{C∉S_{F_P}} C → 0 the push-forward is injective and the next map surjective (Proposition 3.8(1)); the dimension follows from Proposition 3.8(1), Lemma 3.5(1) and (3.21).

*Needs.* LR.8 *The subrepresentation π_{F_P}(φ, h) and Ext^1_{F_P}*; LR.7 *The extension group Ext^1(π_alg(φ, h), π_1(φ, h)) (Ding, Proposition 3.8)*; LR.7 *One-dimensional extension groups with a constituent (Ding, Lemma 3.5)*.

#### The parabolic induction map ζ_{F_P} (`zeta-fp`, construction)

Taking (Ind_{P^-}^{GL_n} − ⊗ ε^{-1} ∘ θ^P)^an and pulling back along (3.19) gives Ext^1_{L_P(L)}(⊠_i π_alg(φ_{F_P,i}, h^i), ⊗̂_i π_1(φ_{F_P,i}, h^i)) → Ext^1_{GL_n(L)}(π_alg(φ, h), (Ind … )^an) ≅ Ext^1(π_alg, π_{F_P}) ((3.25); the last isomorphism is the push-forward, bijective by Ding 2019 Lemma 2.26 and LR.8/parabolic-constituents). For (π̃_i) ∈ ∏_i Ext^1_{GL_{n_i}(L)}(π_alg(φ_{F_P,i}, h^i), π_1(φ_{F_P,i}, h^i)), the completed tensor product ⊗̂_i π̃_i has a quotient V which is an extension of ⊠_i π_alg(φ_{F_P,i}, h^i) by ⊕_i (⊗̂_{j≠i} π_1(φ_{F_P,j}, h^j) ⊠ π_alg(φ_{F_P,i}, h^i)); its push-forward to ⊗̂_i π_1 gives (3.26). The composite is ζ_{F_P} : ∏_i Ext^1(π_alg(φ_{F_P,i}, h^i), π_1(φ_{F_P,i}, h^i)) → Ext^1_{F_P}(π_alg(φ, h), π_1(φ, h)) ((3.27)).

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ.

*Uses.* Ding, Proposition 3.12 and Theorem 3.21: the extension theory is multiplicative along the Levi, which drives the induction on n in the main theorem; PadicHodgeParametersInLocallyAnalyticRepresentations, contract LA4: ζ_F : ∏ B(M_i) ≅ B_F and compatible-refinement spanning.

*API* (namespace `TauCeti.LocallyAnalytic.GLn`):

- `leviExtMap` (data): (3.26): ∏_i Ext^1(π_alg,i, π_1,i) → Ext^1_{L_P}(⊠_i π_alg,i, ⊗̂_i π_1,i).
- `inductionExtMap` (data): (3.25): Ext^1_{L_P}(…) → Ext^1(π_alg, π_{F_P}).
- `zetaFP` (data): ζ_{F_P} := push-forward ∘ (3.25) ∘ (3.26).
- `zetaFP_linear` (structure): ζ_{F_P} is E-linear (multilinear components assembled additively).
- `zetaFP_B` (example): For P = B, ζ_{F_P} = ζ_w for the w with T_w = F_P.

**Checks.**

- `zetaFP_G` (degenerate): For P = G (r = 1), ζ_{F_P} is the identity of Ext^1(π_alg, π_1).
- `zetaFP_B_test` (compatibility): For P = B, ∏_i Ext^1_{GL_1}(φ_iz^{h_i}, φ_iz^{h_i}) = Hom(T(L), E) and ζ_{F_P} = ζ_w (LR.7/zeta-w).
- `zetaFP_dim_source` (computation): For n = 3 and blocks (2, 1): the source has dimension (2 + 3d_L) + (1 + d_L) = 3 + 4d_L, equal to n + d_L·r + d_L·Σ(2^{n_i} − 2) = 3 + 2d_L + 2d_L.

*Proof sketch.* Exactness of locally analytic induction and of the completed tensor product (LR.4/locally-analytic-induction, LR.0/completed-external-tensor) give (3.25) and (3.26). The push-forward Ext^1(π_alg, π_{F_P}) → Ext^1(π_alg, Ind …) is bijective because the constituents of Ind/π_{F_P} have lg ≥ 2 (LR.5/ext-vanishing-long-weyl).

*Sources.* DING25, §3.1.3, (3.25)–(3.27) and the construction between them, p. 42: Builds the map from Levi Ext^1 to Ext^1(π_alg, π_{F_P}) by parabolic induction and pull-back along (3.19), the map from a product of GL_{n_i} Ext^1 groups by an extension construction on completed tensor products, and their composite ζ_{F_P}.

*Needs.* LR.8 *The subrepresentation π_{F_P}(φ, h) and Ext^1_{F_P}*; LR.8 *Levi data of a P-filtration and the parabolic induction (3.19)*; LR.0 *Completed external tensor products of representations*; LR.5 *Vanishing of Ext¹ into inductions from non-adjacent weights*; LR.4 *Locally analytic parabolic induction*.

*Planet:* The parabolic induction map ζ_{F_P}.

#### ζ_{F_P} is bijective and compatible with the weight maps (Ding, Proposition 3.12) (`zeta-fp-bijective`, theorem)

(1) ζ_{F_P} : ∏_i Ext^1(π_alg(φ_{F_P,i}, h^i), π_1(φ_{F_P,i}, h^i)) → Ext^1_{F_P}(π_alg(φ, h), π_1(φ, h)) is bijective. (2) For every w such that T_w is compatible with F_P, the square with top ∏_i Hom(T(L) ∩ L_{P,i}(L), E) ≅ Hom(T(L), E), vertical maps (3.17) for each GL_{n_i} and for GL_n, and bottom ∏_i Ext^1_{T_{w,i}} ≅ Ext^1_w induced by ζ_{F_P}, commutes. (3) For w_1, w_2 with T_{w_1}, T_{w_2} compatible with F_P, ζ_{w_2} = ζ_{w_1} ∘ (w_2w_1^{-1}) on Hom_{P,g′}(T(L), E) ≅ Ext^1_{F_P,g′} ((3.30)). (4) ⊕_{T_w ⊆ F_P} Ext^1_w → Ext^1_{F_P} is surjective ((3.29)).

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ.

*Proof sketch.* (2): for ψ = (ψ_i), (1 + ψε) = ⊠_i (1 + ψ_iε) and transitivity of parabolic induction identify both paths around (3.28). (4): each C ∈ S_{F_P} lies in some PS_1(w(φ), h) with T_w compatible with F_P; the argument of LR.7/ext-pi1 gives surjectivity, hence ζ_{F_P} is surjective by (2). (1): both sides have dimension n + d_L r + d_L Σ(2^{n_i} − 2) (LR.7/ext-pi1 for each GL_{n_i}, LR.8/ext-pi-fp).

*Sources.* DING25, §3.1.3, Proposition 3.12, (3.28)–(3.30) and its proof, pp. 42–43: Proves commutativity of (3.28) from the factorisation 1 + ψε = ⊠_i (1 + ψ_iε) and transitivity of induction, surjectivity of (3.29) as in Proposition 3.8, and bijectivity of ζ_{F_P} by comparing dimensions with Propositions 3.8 and 3.11; records (3.30).

*Needs.* LR.8 *The parabolic induction map ζ_{F_P}*; LR.8 *The extension group Ext^1(π_alg, π_{F_P}) (Ding, Proposition 3.11)*; LR.7 *The filtration Ext^1_g ⊆ Ext^1_{g′} ⊆ Ext^1_w of Ext^1(π_alg, π_1)*; LR.7 *The extension group Ext^1(π_alg(φ, h), π_1(φ, h)) (Ding, Proposition 3.8)*.

*Planet:* Bijectivity of ζ_{F_P}.

#### The two endpoint parabolics amalgamate to π_1(φ, h) (Ding, Proposition 3.13) (`endpoint-amalgamation`, theorem)

Let F be the filtration ⊕_{i≤n−1} φ_i ⊂ ⊕_i φ_i (parabolic P_{n−1}, Levi GL_{n−1} × GL_1) and G the filtration φ_n ⊂ ⊕_i φ_i (parabolic P_1, Levi GL_1 × GL_{n−1}). Then C(I, s_{i,σ}) occurs in π_F(φ, h) iff I ⊆ {1, …, n−1}, and in π_G(φ, h) iff I = I_1 ∪ {n} with I_1 ⊆ {1, …, n−1}; hence π_1/π_alg ≅ (π_F/π_alg) ⊕ (π_G/π_alg), and there are natural exact sequences 0 → π_alg(φ, h) → π_F(φ, h) ⊕ π_G(φ, h) → π_1(φ, h) → 0 and 0 → Ext^1_{g′}(π_alg, π_1) → Ext^1_F(π_alg, π_1) ⊕ Ext^1_G(π_alg, π_1) → Ext^1(π_alg, π_1) → 0, the first map b ↦ (b, −b). By LR.8/zeta-fp-bijective, ζ_F : Ext^1_{GL_{n−1}}(π_alg(φ^1, h^1), π_1(φ^1, h^1)) × Hom(L^×, E) ≅ Ext^1_F and similarly ζ_G. (The source prints P_1 and P_2 for the two parabolics; they are P_{n−1} and P_1 — see sourceIssues.)

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ.

*Proof sketch.* Lemma 3.10 (LR.8/parabolic-constituents) for F and G gives the two constituent sets, which partition the (2^n − 2)d_L labels: a nonempty proper I either avoids n or contains it. The first sequence follows since π_F and π_G meet exactly in π_alg inside π_1; applying Ext^1(π_alg, −) and Hom(π_alg, π_1) = E gives the second sequence up to right exactness. Right exactness: dim Ext^1_F + dim Ext^1_G − dim Ext^1_{g′} = n + (2^n − 1)d_L by LR.8/ext-pi-fp, LR.7/self-extensions and LR.7/ext-pi1.

*Sources.* DING25, §3.1.3, the final paragraph, Proposition 3.13 and Remark 3.14, pp. 43–44: Describes the constituents of π_F and π_G via Lemma 3.10, splits π_1/π_alg, and states the two exact sequences, the right exactness of the second following by comparing dimensions (Propositions 3.3(1), 3.8(1), 3.11); Remark 3.14 gives ζ_F and ζ_G.

*Needs.* LR.8 *ζ_{F_P} is bijective and compatible with the weight maps (Ding, Proposition 3.12)*; LR.8 *The subrepresentation π_{F_P}(φ, h) and Ext^1_{F_P}*; LR.7 *The extension group Ext^1(π_alg(φ, h), π_1(φ, h)) (Ding, Proposition 3.8)*; LR.7 *Self-extensions of π_alg(φ, h) (Ding, Proposition 3.3)*.

*Planet:* Amalgamation of the endpoint parabolics.

### Examples

- (Levi data of a P-filtration and the parabolic induction (3.19)) For P = B, every n_i = 1 and the injection is π_alg(φ, h) ↪ PS(w(φ), h) for the w attached to F_P.
- (Which constituents C(I, s_{i,σ}) occur in a parabolic induction (Ding, Lemma 3.10)) For P = B: the condition reduces to I = w({1, …, i}) for the w attached to F_P, i.e. the C(w, s_{i,σ}) of PS_1(w(φ), h).
- (The subrepresentation π_{F_P}(φ, h) and Ext^1_{F_P}) For P = G: S_{F_P} is all (2^n − 2)d_L labels and π_{F_P} = π_1.
- (The extension group Ext^1(π_alg, π_{F_P}) (Ding, Proposition 3.11)) For P = B: dim Ext^1(π_alg, PS_1(w(φ), h)) = n + nd_L (matching LR.7/ext-ps1).
- (The parabolic induction map ζ_{F_P}) For P = B, ζ_{F_P} on ∏_i Hom(L^×, E) = Hom(T(L), E) is ζ_w (LR.8/zeta-fp-bijective (2)).
- (ζ_{F_P} is bijective and compatible with the weight maps (Ding, Proposition 3.12)) For P = B both sides equal Hom(T(L), E) ≅ Ext^1_w, of dimension n(1 + d_L).
- (The two endpoint parabolics amalgamate to π_1(φ, h) (Ding, Proposition 3.13)) For n = 2, F = G = B-filtrations T_1 and T_s, π_F = PS_1(φ, h), π_G = PS_1(s(φ), h), and the first sequence is the amalgam defining π_1.

### Dependencies

This layer rests on: LR.0; LR.1; LR.4; LR.5; LR.7.

## Layer LR.9: Locally σ-analytic theory

Ding §3.1.4: locally σ-analytic and g_{Σ_L∖{σ}}-algebraic representations, π_{1,σ}(φ, h) and PS_{1,σ}(w(φ), h), σ-analytic self-extensions and Ext¹ with PS_{1,σ} and π_1, the decomposition of Ext¹(π_alg, π_1) modulo Ext¹_g over embeddings, and the σ-analytic parabolic compatibility and amalgamation.

#### Locally σ-analytic and g_{Σ_L∖{σ}}-algebraic representations (`sigma-analytic-representation`, definition)

Let σ ∈ Σ_L. A locally ℚ_p-analytic representation V of a locally L-analytic group G over E is locally σ-analytic if the derived action of g ⊗_{ℚ_p} E = ∏_τ g_τ (LR.0/derived-lie-action) factors through g_σ = g ⊗_{L,σ} E, and g_{Σ_L∖{σ}}-algebraic if, for every v ∈ V, U(g_{Σ_L∖{σ}})·v is a finite-dimensional algebraic representation of g_{Σ_L∖{σ}} := ∏_{τ≠σ} g_τ. D_σ(G, E) is the quotient of D(G, E) acting on locally σ-analytic representations (the dual of the locally σ-analytic functions). For g_{Σ_L∖{σ}}-algebraic V, W, Ext^1_σ(V, W) ⊆ Ext^1_G(V, W) is the subspace of g_{Σ_L∖{σ}}-algebraic extensions; for admissible locally σ-analytic V, W it is Ext^1_{D_σ(G,E)}(W′, V′) (Breuil). For characters, Hom_σ(T(L), E) is the space of locally σ-analytic additive characters, and Hom_{σ,g′} := Hom_{g′} ∩ Hom_σ. (Ind_P^G U)^{σ-an} is the locally σ-analytic induction (LR.4/locally-analytic-induction).

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ.

*Uses.* Ding, Lemma 3.15 and Propositions 3.16–3.20: the σ-parts of all Ext^1 groups of §3.1; PadicHodgeParametersInLocallyAnalyticRepresentations, contract LA5: π_{1,σ}, B_σ and the decomposition ⊕_σ(B_σ/B_g) ≅ B/B_g; Breuil, socle II, Remarque 4.4(ii): the σ-analytic version of the adjunction.

*API* (namespace `TauCeti.LocallyAnalytic.GLn`):

- `IsSigmaAnalytic` (data): The derived g ⊗ E-action factors through g_σ.
- `IsAlgebraicAway` (data): U(g_{Σ∖σ})·v is finite-dimensional algebraic for every v.
- `extSigma` (data): Ext^1_σ(V, W) ⊆ Ext^1_G(V, W).
- `homSigma` (data): Hom_σ(T(L), E) and Hom_{σ,g′}(T(L), E).
- `isAlgebraicAway_of_lalg` (example): Locally algebraic representations are g_{Σ∖σ}-algebraic for every σ.
- `sigmaInduction` (constructor): (Ind_P^G U)^{σ-an} ⊆ (Ind_P^G U)^{ℚ_p-an}.
- `extSigma_eq_Dsigma` (compatibility): For admissible locally σ-analytic V, W, Ext^1_σ(V, W) ≅ Ext^1_{D_σ(G,E)}(W′, V′) (BR19 Lemme 2.1.1).

**Checks.**

- `sigma_Qp` (degenerate): For L = ℚ_p, IsSigmaAnalytic and IsAlgebraicAway hold for every locally ℚ_p-analytic representation, and Ext^1_σ = Ext^1.
- `homSigma_dim` (computation): dim Hom_σ(L^×, E) = 2 (valuation and σ ∘ log), and dim Hom_{σ,g′}(T(L), E) = n + 1.
- `not_sigma_character` (non-example): For L ≠ ℚ_p and τ ≠ σ, the character x ↦ τ(x) of the additive group L is locally ℚ_p-analytic but not locally σ-analytic.
- `zalg_twist` (computation): For an algebraic character z^μ of T(L) with μ_τ = 0 for τ ≠ σ, z^μ is locally σ-analytic; if μ_τ ≠ 0 for some τ ≠ σ it is g_{Σ∖σ}-algebraic but not locally σ-analytic.

*Proof sketch.* The derived action decomposes along g ⊗_{ℚ_p} E ≅ ∏_τ g_τ (LR.0/rational-points-analytic-group); both conditions are conditions on that action. Ext^1_σ is a subspace: g_{Σ∖σ}-algebraic extensions are closed under Baer sum and scalar multiplication.

*Sources.* DING25, §3.1.4, the first paragraph, p. 44: Defines locally σ-analytic and g_{Σ_K∖{σ}}-algebraic representations, Ext^1_σ and Hom_{σ,g′}(T(K), E). BR19, §2.1, the definitions and Lemme 2.1.1, p. 10: Works with locally σ-analytic representations, D_σ(H, E)-modules and proves Ext^1_{H,σ}(Π_1, Π_2) ≅ Ext^1_{D_σ(H,E)}(Π_2′, Π_1′) for admissible ones.

*Needs.* LR.0 *The derived action of the Lie algebra*; LR.1 *Ext¹ classifies extensions of admissible representations*; LR.1 *Ext groups of admissible locally analytic representations*; LR.4 *Locally analytic parabolic induction*; LR.7 *Weights, twists and parameter spaces for GL_n(L)*.

*Planet:* Locally σ-analytic representation.

#### The g_{Σ_L∖{σ}}-algebraic parts π_{1,σ}(φ, h) and PS_{1,σ}(w(φ), h) (`pi1-sigma`, construction)

For σ ∈ Σ_L, π_{1,σ}(φ, h) ⊆ π_1(φ, h) is the subrepresentation which is an extension of ⊕_{1≤i≤n−1, #I=i} C(I, s_{i,σ}) (fixed σ, all I) by π_alg(φ, h); PS_{1,σ}(w(φ), h) ⊆ PS_1(w(φ), h) is the subrepresentation with constituents π_alg(φ, h) and C(w, s_{i,σ}), 1 ≤ i ≤ n−1, and PS_{1,σ}(w(φ), h) = PS_1(w(φ), h) ∩ ((Ind_{B^-} w(φ)ηz^{λ_σ})^{σ-an} ⊗_E L(λ^σ)) with λ_σ the σ-component of λ and λ^σ := (λ_τ)_{τ≠σ}. Moreover C(I, s_{i,σ}) ≅ F^{GL_n}_{B^-}(L^-(−s_{i,σ}·λ_σ), w(φ)η) ⊗_E L(λ^σ), with F^{GL_n}_{B^-}(L^-(−s_{i,σ}·λ_σ), w(φ)η) ↪ (Ind_{B^-} w(φ)ηz^{−s_{i,σ}·λ_σ})^{σ-an} (the source drops the minus sign; see sourceIssues). π_{1,σ}(φ, h) is the unique quotient of ⊕^{w}_{π_alg(φ,h)} PS_{1,σ}(w(φ), h) with socle π_alg(φ, h), it is g_{Σ_L∖{σ}}-algebraic, and it is the maximal g_{Σ_L∖{σ}}-algebraic subrepresentation of π_1(φ, h). For a P-filtration, π_{F_P,σ}(φ, h) := π_{F_P}(φ, h) ∩ π_{1,σ}(φ, h), the maximal g_{Σ∖σ}-algebraic subrepresentation of π_{F_P}.

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ.

*Uses.* Ding, Propositions 3.16–3.20: the σ-analytic Ext computations; PadicHodgeParametersInLocallyAnalyticRepresentations, contract LA5: π_{1,σ}, its amalgam over A and maximal partially algebraic subrepresentations.

*API* (namespace `TauCeti.LocallyAnalytic.GLn`):

- `piOneSigma` (constructor): π_{1,σ}(φ, h) ⊆ π_1(φ, h).
- `PS1Sigma` (constructor): PS_{1,σ}(w(φ), h) ⊆ PS_1(w(φ), h).
- `piOneSigma_maximal` (characterisation): π_{1,σ} is the maximal g_{Σ∖σ}-algebraic subrepresentation of π_1.
- `constituentLabel_sigma_decomp` (relation): C(I, s_{i,σ}) ≅ F^{GL_n}_{B^-}(L^-(−s_{i,σ}·λ_σ), w(φ)η) ⊗ L(λ^σ).
- `piFPSigma` (constructor): π_{F_P,σ}(φ, h) := π_{F_P} ∩ π_{1,σ}.
- `piOneSigma_amalgam` (characterisation): π_{1,σ} is the unique quotient with socle π_alg of the amalgam of the PS_{1,σ}(w(φ), h).

**Checks.**

- `piOneSigma_Qp` (degenerate): For L = ℚ_p, π_{1,σ} = π_1 and PS_{1,σ} = PS_1.
- `piOneSigma_length` (computation): π_{1,σ}(φ, h) has length 1 + (2^n − 2), and PS_{1,σ}(w(φ), h) length n.
- `piOneSigma_not_other` (non-example): For d_L ≥ 2 and τ ≠ σ, C(I, s_{i,τ}) is not a constituent of π_{1,σ}(φ, h).
- `piOne_eq_sum_sigma` (characterisation): π_1(φ, h) is the amalgamated sum over π_alg of the π_{1,σ}(φ, h), σ ∈ Σ_L (its second layer is the disjoint union of theirs).

*Proof sketch.* L^-(−s_{i,σ}·λ) = L^-_σ(−s_{i,σ}·λ_σ) ⊠ (⊠_{τ≠σ} L^-_τ(−λ_τ)) with finite-dimensional factors for τ ≠ σ, which gives the tensor decomposition of C(I, s_{i,σ}) and its g_{Σ∖σ}-algebraicity. The constituents C(I, s_{i,τ}) with τ ≠ σ are not g_{Σ∖σ}-algebraic (their τ-component is infinite-dimensional), so the maximal g_{Σ∖σ}-algebraic subrepresentation of π_1 is π_{1,σ}; similarly for PS_{1,σ} inside the σ-analytic induction.

*Sources.* DING25, §3.1.4, pp. 44–45: Writes C(I, s_{i,σ}) as a σ-analytic Orlik–Strauch representation tensored with L(λ^σ), defines π_{1,σ}(φ, h) and PS_{1,σ}(w(φ), h), and shows π_{1,σ} is the unique quotient of the amalgam of the PS_{1,σ} with socle π_alg and the maximal g_{Σ∖σ}-algebraic subrepresentation of π_1. DING25, §3.1.4, the paragraph before Proposition 3.19, p. 46: Defines π_{F_P,σ}(φ, h) := π_{F_P}(φ, h) ∩ π_{1,σ}(φ, h).

*Needs.* LR.9 *Locally σ-analytic and g_{Σ_L∖{σ}}-algebraic representations*; LR.7 *The representations PS_1(w(φ), h) and π_1(φ, h)*; LR.8 *The subrepresentation π_{F_P}(φ, h) and Ext^1_{F_P}*; LR.5 *The Orlik–Strauch functor*.

*Planet:* The representation π_{1,σ}(φ, h).

#### σ-analytic self-extensions of π_alg (Ding, Lemma 3.15) (`sigma-self-extensions`, theorem)

dim_E Ext^1_σ(π_alg(φ, h), π_alg(φ, h)) = n + 1, and (3.4) induces an isomorphism Hom_{σ,g′}(T(L), E) ≅ Ext^1_σ(π_alg(φ, h), π_alg(φ, h)).

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ.

*Proof sketch.* Ext^1_{Z}(π_alg, π_alg) ⊆ Ext^1_lalg ⊆ Ext^1_σ (LR.1/locally-algebraic-ext), giving 0 → Ext^1_Z → Ext^1_σ → Hom_σ(Z(L), E) → 0, so dim Ext^1_σ = (n − 1) + 2 = n + 1. ζ_w of LR.7/self-extensions restricts to an injection Hom_{σ,g′} → Ext^1_σ between spaces of the same dimension n + 1.

*Sources.* DING25, §3.1.4, Lemma 3.15 and its proof, p. 45: With central character fixed the extensions are locally algebraic (Schraen Proposition 4.7), giving 0 → Ext^1_{GL_n,Z} → Ext^1_σ → Hom_σ(Z(K), E) → 0; (3.4) restricts injectively and both sides have dimension n + 1.

*Needs.* LR.9 *Locally σ-analytic and g_{Σ_L∖{σ}}-algebraic representations*; LR.7 *Self-extensions of π_alg(φ, h) (Ding, Proposition 3.3)*; LR.1 *Ext groups between locally algebraic representations*.

#### Ext^1_σ(π_alg, PS_{1,σ}) is Hom_σ(T(L), E) (Ding, Proposition 3.16 and Remark 3.17) (`sigma-ext-ps1`, theorem)

For w ∈ S_n, the map (3.10) induces an isomorphism Hom_σ(T(L), E) ≅ Ext^1_σ(π_alg(φ, h), PS_{1,σ}(w(φ), h)), both of dimension 2n. Moreover the last map in 0 → Ext^1_σ(π_alg, π_alg) → Ext^1_σ(π_alg, PS_{1,σ}(w(φ), h)) → ⊕_{i=1}^{n−1} Ext^1_σ(π_alg, C(w, s_{i,σ})) is surjective, and Ext^1_σ(π_alg, C(w, s_{i,σ})) ≅ Ext^1_{GL_n(L)}(π_alg, C(w, s_{i,σ})) (the source writes C(w(φ), s_{i,σ}); see sourceIssues).

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ.

*Proof sketch.* For ψ ∈ Hom_σ(T(L), E), I(w(φ)ηz^λ(1 + ψε)) ⊆ (Ind w(φ)ηz^{λ_σ}(1 + ψε))^{σ-an} ⊗ L(λ^σ) is g_{Σ∖σ}-algebraic (LR.6/closed-induction, LR.9/pi1-sigma), so (3.10) restricts to Hom_σ → Ext^1_σ(π_alg, PS_{1,σ}), injective by LR.7/ext-ps1. Dévissage: dim Ext^1_σ(π_alg, PS_{1,σ}) ≤ (n + 1) + (n − 1)·1 (LR.9/sigma-self-extensions, LR.7/constituent-ext-lines); the source has dimension 2n, so the map is bijective and the last map surjective.

*Sources.* DING25, §3.1.4, Proposition 3.16, (3.31)–(3.32) and its proof, and Remark 3.17, pp. 45–46: For ψ ∈ Hom_σ, the closed induction of w(φ)ηz^λ(1 + ψε) lies in the σ-analytic induction tensored with L(λ^σ), so (3.10) restricts injectively; dévissage bounds the dimension by (n + 1) + (n − 1) = 2n, forcing bijectivity; Remark 3.17 records surjectivity of the last map and the identification of the σ- and full Ext^1 with C(w, s_{i,σ}).

*Needs.* LR.9 *The g_{Σ_L∖{σ}}-algebraic parts π_{1,σ}(φ, h) and PS_{1,σ}(w(φ), h)*; LR.9 *σ-analytic self-extensions of π_alg (Ding, Lemma 3.15)*; LR.7 *The maps ζ_w : Hom(T(L), E) → Ext^1(π_alg(φ, h), π_1(φ, h))*; LR.7 *One-dimensional extension groups with a constituent (Ding, Lemma 3.5)*; LR.6 *Emerton's closed induction I_P^G*.

#### The σ-part of Ext^1(π_alg, π_1) and the decomposition over embeddings (Ding, Proposition 3.18) (`sigma-ext-pi1`, theorem)

Let Ext^1_σ(π_alg, π_1) (respectively Ext^1_{σ,g′}) be the image of Ext^1_σ(π_alg, π_{1,σ}) (respectively Ext^1_σ(π_alg, π_alg)) under the injective push-forward; then Ext^1_{σ,g′} = Ext^1_{g′} ∩ Ext^1_σ. (1) 0 → Ext^1_σ(π_alg, π_alg) → Ext^1_σ(π_alg, π_1(φ, h)) → ⊕_{1≤i≤n−1, I⊆{1,…,n}, #I=i} Ext^1(π_alg, C(I, s_{i,σ})) → 0 is exact (the source prints I ⊆ {1, …, n−1}), and dim_E Ext^1_σ(π_alg, π_1) = n + 2^n − 1. (2) t_{φ,h} restricts to a surjection ⊕_{w∈S_n} Hom_σ(T(L), E) ↠ Ext^1_σ(π_alg, π_1). (3) ⊕_{τ∈Σ_L} Ext^1_τ(π_alg, π_1) → Ext^1_{GL_n(L)}(π_alg, π_1) is surjective and induces ⊕_{τ∈Σ_L} (Ext^1_τ/Ext^1_g) ≅ Ext^1/Ext^1_g, both of dimension (2^n − 1)d_L.

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ.

*Proof sketch.* (1): as LR.7/ext-pi1, with PS_{1,σ} in place of PS_1 and LR.9/sigma-ext-ps1 for the surjectivity onto each one-dimensional Ext^1(π_alg, C(I, s_{i,σ})); dimension (n + 1) + (2^n − 2). (2): from LR.9/sigma-ext-ps1 and the covering argument of LR.7/ext-pi1. (3): comparing the sequences of LR.7/ext-pi1 and (1), the C(I, s_{i,τ})-components of Ext^1/Ext^1_{g′} are covered by Ext^1_τ, and Ext^1_{g′}/Ext^1_g = Hom(Z(L), E)/Hom_sm is spanned by the Hom_τ(Z(L)); hence (3.34) is surjective, and (3.35) is a surjection between spaces of dimension (2^n − 1)d_L.

*Sources.* DING25, §3.1.4, the definitions before Proposition 3.18, Proposition 3.18, (3.33)–(3.35) and its proof, p. 46: Defines Ext^1_σ(π_alg, π_1) and Ext^1_{σ,g′}, proves (1) as Proposition 3.8(1), (2) from Proposition 3.16 and Remark 3.17, and (3) by comparing (3.12) with (3.33) and dimensions.

*Needs.* LR.9 *Ext^1_σ(π_alg, PS_{1,σ}) is Hom_σ(T(L), E) (Ding, Proposition 3.16 and Remark 3.17)*; LR.7 *The extension group Ext^1(π_alg(φ, h), π_1(φ, h)) (Ding, Proposition 3.8)*; LR.7 *The filtration Ext^1_g ⊆ Ext^1_{g′} ⊆ Ext^1_w of Ext^1(π_alg, π_1)*; LR.9 *The g_{Σ_L∖{σ}}-algebraic parts π_{1,σ}(φ, h) and PS_{1,σ}(w(φ), h)*.

*Planet:* Decomposition of Ext¹ over embeddings.

#### The σ-analytic theory is compatible with parabolic induction (Ding, Proposition 3.19) (`sigma-parabolic`, theorem)

Let Ext^1_{σ,F_P}(π_alg, π_1) be the image of Ext^1_σ(π_alg, π_{F_P,σ}); it equals Ext^1_σ(π_alg, π_1) ∩ Ext^1_{F_P}(π_alg, π_1). (1) dim_E Ext^1_{σ,F_P}(π_alg(φ, h), π_1(φ, h)) = n + r + Σ_{i=1}^r (2^{n_i} − 2). (2) ζ_{F_P} induces an isomorphism ∏_i Ext^1_σ(π_alg(φ_{F_P,i}, h^i), π_1(φ_{F_P,i}, h^i)) ≅ Ext^1_{σ,F_P}(π_alg(φ, h), π_1(φ, h)) (the source prints π_1(φ, λ) in (3.36); see sourceIssues), compatibly with the weight maps Hom_σ(T(L) ∩ L_{P,i}(L), E) for every w with T_w compatible with F_P.

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ.

*Proof sketch.* Dévissage and LR.8/parabolic-constituents bound dim Ext^1_{σ,F_P} ≤ (n + 1) + (Σ(2^{n_i} − 2) + r − 1). ζ_{F_P} (LR.8/zeta-fp-bijective) restricts injectively to the σ-parts, and the source has dimension Σ_i (n_i + 2^{n_i} − 1) = n + r + Σ(2^{n_i} − 2) by LR.9/sigma-ext-pi1 (1) for each GL_{n_i}; so it is bijective.

*Sources.* DING25, §3.1.4, the paragraph before Proposition 3.19, Proposition 3.19, (3.36) and its proof, pp. 46–47: Defines Ext^1_{σ,F_P}, proves the dimension bound by dévissage with Lemma 3.10 (for fixed σ, #{C ∈ S_{F_P}} = Σ(2^{n_i} − 2) + (r − 1)), shows (3.27) restricts injectively to the σ-parts, and concludes by Proposition 3.18(1) and (3.28).

*Needs.* LR.9 *The σ-part of Ext^1(π_alg, π_1) and the decomposition over embeddings (Ding, Proposition 3.18)*; LR.8 *ζ_{F_P} is bijective and compatible with the weight maps (Ding, Proposition 3.12)*; LR.8 *Which constituents C(I, s_{i,σ}) occur in a parabolic induction (Ding, Lemma 3.10)*; LR.9 *The g_{Σ_L∖{σ}}-algebraic parts π_{1,σ}(φ, h) and PS_{1,σ}(w(φ), h)*.

#### σ-analytic amalgamation of the endpoint parabolics (Ding, Proposition 3.20) (`sigma-amalgamation`, theorem)

With F and G as in LR.8/endpoint-amalgamation there is a natural exact sequence 0 → π_alg(φ, h) → π_{F,σ}(φ, h) ⊕ π_{G,σ}(φ, h) → π_{1,σ}(φ, h) → 0, and consequently 0 → Ext^1_{σ,g′}(π_alg, π_1) → Ext^1_{σ,F}(π_alg, π_1) ⊕ Ext^1_{σ,G}(π_alg, π_1) → Ext^1_σ(π_alg, π_1) → 0.

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ.

*Proof sketch.* Intersect the sequence of LR.8/endpoint-amalgamation with π_{1,σ}: the second layer of π_{1,σ} splits as the σ-constituents of π_F and of π_G. Right exactness of the Ext sequence by dimensions: dim Ext^1_{σ,F} = dim Ext^1_{σ,G} = n + 2^{n−1} (LR.9/sigma-parabolic with r = 2 and blocks of sizes n − 1 and 1), dim Ext^1_{σ,g′} = n + 1 (LR.9/sigma-self-extensions), and 2(n + 2^{n−1}) − (n + 1) = n + 2^n − 1 = dim Ext^1_σ (LR.9/sigma-ext-pi1).

*Sources.* DING25, §3.1.4, Proposition 3.20 and (3.37), p. 47: States the σ-analytic analogue of Proposition 3.13 for the representations and their Ext^1 groups.

*Needs.* LR.9 *The σ-analytic theory is compatible with parabolic induction (Ding, Proposition 3.19)*; LR.8 *The two endpoint parabolics amalgamate to π_1(φ, h) (Ding, Proposition 3.13)*; LR.9 *The g_{Σ_L∖{σ}}-algebraic parts π_{1,σ}(φ, h) and PS_{1,σ}(w(φ), h)*.

*Planet:* σ-analytic amalgamation.

### Examples

- (Locally σ-analytic and g_{Σ_L∖{σ}}-algebraic representations) For L = ℚ_p (Σ_L = {σ}), every locally ℚ_p-analytic representation is locally σ-analytic and g_∅-algebraic, and Ext^1_σ = Ext^1.
- (The g_{Σ_L∖{σ}}-algebraic parts π_{1,σ}(φ, h) and PS_{1,σ}(w(φ), h)) For L = ℚ_p, π_{1,σ}(φ, h) = π_1(φ, h) and PS_{1,σ} = PS_1.
- (σ-analytic self-extensions of π_alg (Ding, Lemma 3.15)) For n = 1: Ext^1_σ(χ, χ) = Hom_σ(L^×, E), of dimension 2.
- (Ext^1_σ(π_alg, PS_{1,σ}) is Hom_σ(T(L), E) (Ding, Proposition 3.16 and Remark 3.17)) For n = 1: Ext^1_σ(χ, χ) = Hom_σ(L^×, E), dimension 2 = 2n.
- (The σ-part of Ext^1(π_alg, π_1) and the decomposition over embeddings (Ding, Proposition 3.18)) For L = ℚ_p (d_L = 1) the statements reduce to LR.7/ext-pi1.
- (The σ-analytic theory is compatible with parabolic induction (Ding, Proposition 3.19)) For P = G: the statement is LR.9/sigma-ext-pi1 (1).
- (σ-analytic amalgamation of the endpoint parabolics (Ding, Proposition 3.20)) For L = ℚ_p it is LR.8/endpoint-amalgamation.

### Dependencies

This layer rests on: LR.0; LR.1; LR.4; LR.5; LR.6; LR.7; LR.8.

## Downstream consumers

PadicHodgeParametersInLocallyAnalyticRepresentations states its locally analytic inputs as six contracts; they are met as follows.

- **LA1**: LR.1 *Admissible locally analytic representations*, LR.1 *Schneider–Teitelbaum anti-equivalence*, LR.1 *Ext groups of admissible locally analytic representations*, LR.1 *Ext¹ classifies extensions of admissible representations*, LR.1 *Self-extensions as dual-number modules and tautological extensions*, LR.0 *Completed external tensor products of representations*.
- **LA2**: LR.7 *The locally algebraic representation π_alg(φ, h)*, LR.7 *The locally analytic principal series PS(w(φ), h) and its constituents C(w, u)*, LR.7 *Constituents and socle of the locally analytic principal series (Ding, Proposition 3.1)*, LR.7 *The constituents C(I, s_{i,σ})*, LR.7 *The representations PS_1(w(φ), h) and π_1(φ, h)*, LR.7 *The amalgam π(φ, h) of the principal series*, LR.7 *One-dimensional extension groups with a constituent (Ding, Lemma 3.5)*, LR.7 *Self-extensions of π_alg(φ, h) (Ding, Proposition 3.3)*, LR.7 *The extension group Ext^1(π_alg(φ, h), π_1(φ, h)) (Ding, Proposition 3.8)*.
- **LA3**: LR.7 *The maps ζ_w : Hom(T(L), E) → Ext^1(π_alg(φ, h), π_1(φ, h))*, LR.7 *Ext^1(π_alg, PS_1) is Hom(T(L), E) (Ding, Proposition 3.6)*, LR.7 *The extension group Ext^1(π_alg(φ, h), π_1(φ, h)) (Ding, Proposition 3.8)*, LR.7 *The filtration Ext^1_g ⊆ Ext^1_{g′} ⊆ Ext^1_w of Ext^1(π_alg, π_1)*, LR.7 *Self-extensions of π_alg(φ, h) (Ding, Proposition 3.3)*.
- **LA4**: LR.8 *Levi data of a P-filtration and the parabolic induction (3.19)*, LR.8 *The subrepresentation π_{F_P}(φ, h) and Ext^1_{F_P}*, LR.8 *The extension group Ext^1(π_alg, π_{F_P}) (Ding, Proposition 3.11)*, LR.8 *The parabolic induction map ζ_{F_P}*, LR.8 *ζ_{F_P} is bijective and compatible with the weight maps (Ding, Proposition 3.12)*, LR.8 *The two endpoint parabolics amalgamate to π_1(φ, h) (Ding, Proposition 3.13)*, LR.6 *Emerton's closed induction I_P^G*, LR.0 *Completed external tensor products of representations*.
- **LA5**: LR.9 *Locally σ-analytic and g_{Σ_L∖{σ}}-algebraic representations*, LR.9 *The g_{Σ_L∖{σ}}-algebraic parts π_{1,σ}(φ, h) and PS_{1,σ}(w(φ), h)*, LR.9 *σ-analytic self-extensions of π_alg (Ding, Lemma 3.15)*, LR.9 *Ext^1_σ(π_alg, PS_{1,σ}) is Hom_σ(T(L), E) (Ding, Proposition 3.16 and Remark 3.17)*, LR.9 *The σ-part of Ext^1(π_alg, π_1) and the decomposition over embeddings (Ding, Proposition 3.18)*, LR.9 *The σ-analytic theory is compatible with parabolic induction (Ding, Proposition 3.19)*, LR.9 *σ-analytic amalgamation of the endpoint parabolics (Ding, Proposition 3.20)*.
- **LA6**: LR.7 *The maps ζ_w : Hom(T(L), E) → Ext^1(π_alg(φ, h), π_1(φ, h))*, LR.7 *Ext^1(π_alg, PS_1) is Hom(T(L), E) (Ding, Proposition 3.6)*, LR.7 *Self-extensions of π_alg(φ, h) (Ding, Proposition 3.3)*, LR.6 *Emerton's closed induction I_P^G*, LR.6 *Emerton's adjunction theorem*, LR.6 *Breuil's adjunction for Orlik–Strauch representations*.

LocallyAnalyticCompletedCohomology (locally analytic vectors and R^iLA of Pan I §2) and CompletedCohomologyPartII CC.6 (derived locally analytic vectors in the classical comparison) take their inputs from LR.2 and LR.3. LocalGlobalCompatibilityPartIIEigenvarietyCompanions takes very strong admissibility, the Orlik–Strauch theory for products and Breuil's adjunction (Breuil–Hellmann–Schraen §5) from LR.2, LR.5 and LR.6. LieHighestWeightPartIICompletedCategoryO's analytic localisation (Boxer–Calegari–Gee–Pilloni §§3.5–3.6) takes LR.3 and LR.5.

## Source corrections

- **Y. Ding, Proposition 3.8(1), display (3.12), p. 38; also the diagram (3.15), p. 39, and Proposition 3.18(1), (3.33), p. 46 (published version)** (misprint). The direct sum on the right is indexed by I ⊂ {1, …, n−1} with #I = i. Correction: The index set is I ⊂ {1, …, n} with #I = i, as in the definition of C(I, s_{i,σ}) on p. 34 and in Lemma 3.10. Reason: With I ⊂ {1, …, n−1} the sum has (2^{n−1} − 1)d_K terms, while the stated dimension n + (2^n − 1)d_K needs (2^n − 2)d_K one-dimensional terms; e.g. for n = 2 it would omit C({2}, s_{1,σ}). No published correction was found; the targets above use the corrected statement.
- **Y. Ding, Lemma 3.2(1) and its proof, pp. 34–35 (published version)** (misprint). Hom is taken over T(ℚ_p). Correction: Hom over T(K), the torus of GL_n(K). Reason: J_B(C(I, s_{i,σ})) and the characters z^{−s·λ}w(φ)ηδ_B are representations of T(K); over T(ℚ_p) the space would be larger than E when K ≠ ℚ_p. No published correction was found; the targets above use the corrected statement.
- **Y. Ding, §3.1.3, the two inductions displayed in the last paragraph, p. 43 (published version)** (misprint). The inductions are from P_1^- and from P_2^-. Correction: They are from P_{n−1}^- (Levi GL_{n−1} × GL_1) and from P_1^- (Levi GL_1 × GL_{n−1}), the parabolics of the filtrations F and G of Proposition 3.13. Reason: With the convention that P_i has Levi GL_i × GL_{n−i}, the Levi of the first induction (π_1(φ^1, h^1) ⊠ φ_nz^{h_n}) is GL_{n−1} × GL_1. No published correction was found; the targets above use the corrected statement.
- **Y. Ding, §3.1.3, the case n_i = 1 before Lemma 3.10, p. 40 (published version)** (misprint). For n_i = 1, π_alg(φ_{F_P,i}, h^i) = π_1(φ_{F_P,i}, h^i) is written φ_{n_1+⋯+n_{i−1}} z^{h_{n_1+⋯+n_{i−1}}}. Correction: The index is n_1 + ⋯ + n_{i−1} + 1. Reason: For i = 1 the printed index is the empty sum 0, which is not an index; the i-th block starts at position n_1 + ⋯ + n_{i−1} + 1. No published correction was found; the targets above use the corrected statement.
- **Y. Ding, §3.1.4, the embedding displayed after the description of C(I, s_{i,σ}), p. 44 (published version)** (misprint). F(L^-_σ(−s_{i,σ}·λ_σ), w(φ)η) embeds into the σ-analytic induction of w(φ)ηz^{s_{i,σ}·λ_σ}. Correction: The character is w(φ)ηz^{−s_{i,σ}·λ_σ} (minus sign), and L^- carries no subscript σ. Reason: Compare (3.1): C(I, s_{i,σ}) is the socle of the induction of z^{−s_{i,σ}·λ}w(φ)η. No published correction was found; the targets above use the corrected statement.
- **Y. Ding, §3.1.2, p. 35 (amalgamated sum before (3.3)); §3.1.4, pp. 44–45 (description and characterisation of π_{1,σ}); (3.36), p. 47 (published version)** (misprint). π_alg(φ, λ) is written in the amalgamated sums and in the extension describing π_{1,σ}; π_1(φ, λ) in the target of (3.36). Correction: π_alg(φ, h) and π_1(φ, h). Reason: The representations are indexed by the strictly dominant h; λ = h − θ is never used as their index elsewhere. No published correction was found; the targets above use the corrected statement.
- **Y. Ding, (3.28) and Remark 3.17, pp. 45–46 (published version)** (misprint). The constituents are written C(w(φ), s_{i,σ}). Correction: C(w, s_{i,σ}). Reason: C(w, u) is indexed by w ∈ S_n (p. 34), not by the permuted character. No published correction was found; the targets above use the corrected statement.
- **Y. Ding, proof of Proposition 3.6(1), p. 38 (published version)** (misprint). The proof cites [31, Lem. 2.26]. Correction: [32, Lem. 2.26] (Ding, Simple L-invariants for GL_n), as on pp. 37 and 39. Reason: [31] is Ding's GL_2(L) companion-points paper; the lemma used (vanishing of Ext^1 into inductions from weights at Bruhat distance ≥ 2) is Lemma 2.26 of [32]. No published correction was found; the targets above use the corrected statement.
- **Y. Ding, §3.1.2, the paragraph defining π_1(φ, h) before (3.3), p. 35 (published version)** (misprint). The description of π_1(φ, h) is justified 'by Lemma 3.1 (3) (4)'. Correction: Proposition 3.1 (3) and (4). Reason: The statement is Proposition 3.1 on p. 34; there is no Lemma 3.1. No published correction was found; the targets above use the corrected statement.
- **G. Dospinescu, A.-C. Le Bras, §3.3, proof of Théorème 3.2, p. 17 (arXiv:1509.00606v2)** (error). Elements of U_h(𝔤) are written uniquely as Σ a_α 𝔛^α with v_p(a_α) − c_h|α| → ∞, for a constant c_h > p^{h−1} depending only on h. Correction: c_h = h − 1 + O(1) (exactly h − 1 when 𝔛_j = log g_{i,j}), i.e. |a_α|‖𝔛^α‖_h → 0 with ‖𝔛_j‖_h of size p^{h−1}; the proof only needs p^{c_h} > C for h large. Reason: With the norm ‖Σ a_α b^α‖_h = sup |a_α| p^{−|α|/p^h}, ‖log g_{i,j}‖_h is about p^{h−1} (LocallyAnalyticDistributionsPartII ND.3: ‖log(1 + b_i)‖_{r_n} = p^{n−1}), so the valuation weight is h − 1, not p^{h−1}. No published correction was found; the targets above use the corrected statement.
- **G. Boxer, F. Calegari, T. Gee, V. Pilloni, §2.2.27, p. 23 (arXiv:2502.20645v1)** (misprint). The evaluation map at e is written on O_{G_{r′}} ⊗ V with r′ not defined. Correction: Evaluate on O_{G_r} ⊗ V, the radius of the analytic vectors being constructed (or introduce r′ with its restriction map). Reason: V^{M_r-an} is defined as invariants in O_{G_r} ⊗ V; no r′ appears before. No published correction was found; the targets above use the corrected statement.

## Open inputs

- **Category O and Kostant homology.** Stated as the contract of the same name under *Exact supplier contracts*; it is planned by the Part II of LieHighestWeight on completed category O, and LR.4, LR.5, LR.7 and LR.8 cite it.
- **Solid functional analysis.** Stated as the contract of the same name; it is planned by the Part II of LocallyAnalyticDistributions on quasi-abelian functional analysis, and LR.3 cites it.
- **Weakly null sequences.** Dospinescu–Le Bras state LR.0 *Weakly null sequences are null over a spherically complete field* without proof; the argument sketched there (and a gliding-hump proof for c_0(I) over any complete field) is the one to formalise, and the exact reference in the literature on non-archimedean compactoids is to be fixed.
- **Ext¹ in the other direction.** That Ext¹(C(I, s_{i,σ}), π_alg(φ, h)) is one-dimensional is quoted by Ding from Breuil–Qian (Proposition 5.1.14 with Lemma 3.2.4(ii)); no target here uses that direction.

## References

- [ST02] P. Schneider, J. Teitelbaum, *Locally analytic distributions and p-adic representation theory, with applications to GL2*, J. Amer. Math. Soc. 15 (2002), 443–468; arXiv:math/9912073v1, whose numbering agrees with the published text; page numbers are those of the arXiv PDF. https://arxiv.org/pdf/math/9912073
- [ST03] P. Schneider, J. Teitelbaum, *Algebras of p-adic distributions and admissible representations*, Invent. Math. 153 (2003), 145–196; arXiv:math/0206056v1; page numbers are those of the arXiv PDF. https://arxiv.org/pdf/math/0206056
- [ST02B] P. Schneider, J. Teitelbaum, *Banach space representations and Iwasawa theory*, Israel J. Math. 127 (2002), 359–380; arXiv:math/0005066v1. https://arxiv.org/pdf/math/0005066
- [ST01] P. Schneider, J. Teitelbaum (with an appendix by D. Prasad), *U(g)-finite locally analytic representations*, Represent. Theory 5 (2001), 111–128; arXiv:math/0005072v1. https://arxiv.org/pdf/math/0005072v1
- [EM17] M. Emerton, *Locally analytic vectors in representations of locally p-adic analytic groups*, Mem. Amer. Math. Soc. 248 (2017), no. 1175; author's copy (analytic.pdf), whose printed page numbers equal the PDF page numbers. http://www.math.uchicago.edu/~emerton/pdffiles/analytic.pdf
- [EMJ1] M. Emerton, *Jacquet modules of locally analytic representations of p-adic reductive groups I. Construction and first properties*, Ann. Sci. École Norm. Sup. (4) 39 (2006), 775–839, version of record from Numdam (printed page = PDF page + 774). https://www.numdam.org/item/10.1016/j.ansens.2006.08.001.pdf
- [EMJ2] M. Emerton, *Jacquet modules of locally analytic representations of p-adic reductive groups II. The relation to parabolic induction*, Preprint (2007), author's copy (jacquet-two.pdf), whose printed page numbers equal the PDF page numbers. http://www.math.uchicago.edu/~emerton/pdffiles/jacquet-two.pdf
- [OS15] S. Orlik, M. Strauch, *On Jordan–Hölder series of some locally analytic representations*, J. Amer. Math. Soc. 28 (2015), 99–157; arXiv:1001.0323, whose printed page numbers equal the PDF page numbers. https://arxiv.org/pdf/1001.0323
- [OS10] S. Orlik, M. Strauch, *On the irreducibility of locally analytic principal series representations*, Represent. Theory 14 (2010), 713–746; arXiv:math/0612809. https://arxiv.org/pdf/math/0612809
- [OR19] S. Orlik, *On some properties of the functors F^G_P from Lie algebra to locally analytic representations*, arXiv:1802.07514v2 (cited by Ding as [54]). https://arxiv.org/pdf/1802.07514v2
- [BR16] C. Breuil, *Vers le socle localement analytique pour GL_n I*, Ann. Inst. Fourier 66 (2016), 633–685; author's copy (socleI.pdf), cited by its own page numbers. https://www.imo.universite-paris-saclay.fr/~christophe.breuil/PUBLICATIONS/socleI.pdf
- [BR15] C. Breuil, *Vers le socle localement analytique pour GL_n II*, Math. Ann. 361 (2015), 741–785; author's copy (socleII.pdf), cited by its own page numbers. https://www.imo.universite-paris-saclay.fr/~christophe.breuil/PUBLICATIONS/socleII.pdf
- [BR19] C. Breuil, *Ext^1 localement analytique et compatibilité local-global*, Amer. J. Math. 141 (2019), 611–703; author's copy (Ext1.pdf), cited by its own page numbers. https://www.imo.universite-paris-saclay.fr/~christophe.breuil/PUBLICATIONS/Ext1.pdf
- [SCH11] B. Schraen, *Représentations localement analytiques de GL3(Qp)*, Ann. Sci. École Norm. Sup. (4) 44 (2011), 43–145, version of record from Numdam (printed page = PDF page + 41). https://www.numdam.org/item/10.24033/asens.2140.pdf
- [DING25] Y. Ding, *p-adic Hodge parameters in the crystabelline representations of GL_n*, Publ. Math. IHÉS 142 (2025), version of record (74 pp.), whose printed page numbers equal the PDF page numbers; arXiv:2407.21237 compared for §3.1. https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf
- [DING19] Y. Ding, *Simple L-invariants for GL_n*, Trans. Amer. Math. Soc. 372 (2019), 7993–8042; arXiv:1807.10862v2 (page numbers of the arXiv PDF). https://arxiv.org/pdf/1807.10862v2
- [BH20] C. Breuil, F. Herzig, *Towards the finite slope part for GL_n*, Int. Math. Res. Not. IMRN 2020, 10495–10552; arXiv:1806.02695. https://arxiv.org/pdf/1806.02695
- [BHS19] C. Breuil, E. Hellmann, B. Schraen, *A local model for the trianguline variety and applications*, Publ. Math. IHÉS 130 (2019), 299–412, version of record from Numdam (printed page = PDF page + 298). https://www.numdam.org/item/10.1007/s10240-019-00111-y.pdf
- [DLB17] G. Dospinescu, A.-C. Le Bras, *Revêtements du demi-plan de Drinfeld et correspondance de Langlands p-adique*, Ann. of Math. 186 (2017), 321–411; arXiv:1509.00606v2 (page numbers of the arXiv PDF). https://arxiv.org/pdf/1509.00606v2
- [BCGP25] G. Boxer, F. Calegari, T. Gee, V. Pilloni, *Modularity theorems for abelian surfaces*, arXiv:2502.20645v1 (2025); page numbers of the arXiv PDF. https://arxiv.org/pdf/2502.20645v1
- [RJRC22] J. Rodrigues Jacinto, J. E. Rodríguez Camargo, *Solid locally analytic representations of p-adic Lie groups*, Represent. Theory 26 (2022), 962–1024; arXiv:2110.11916 (page numbers of the arXiv PDF). https://arxiv.org/pdf/2110.11916
- [PAN22] L. Pan, *On locally analytic vectors of the completed cohomology of modular curves*, Forum Math. Pi 10 (2022), e7; arXiv:2008.07099v3 (page numbers of the arXiv PDF). https://arxiv.org/pdf/2008.07099v3
- [SCHN11] P. Schneider, *p-Adic Lie Groups*, Grundlehren der mathematischen Wissenschaften 344, Springer, 2011 (the maintainer's cleared copy; cited by printed page).
