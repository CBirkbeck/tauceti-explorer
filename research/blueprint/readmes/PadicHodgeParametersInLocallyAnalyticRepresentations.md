# p-adic Hodge parameters in locally analytic representations of GL_n

The classical smooth representation together with the Hodge–Tate weights fixes a locally algebraic representation, but in rank at least three it leaves Hodge flags undetermined. This roadmap records how Ding’s comparison detects those extra parameters inside extensions of locally analytic representations. Its first output is a canonical surjection t_D:B→Q. The kernel selects π_min(D), whose embeddingwise pieces recover precisely the modified objects D_σ. A second description realizes the same representation as the maximal-ideal annihilator of a universal extension with an Artinian action.

This is a local comparison roadmap. Its two input theories are the locally analytic representation theory of GL_n(K) planned by LocallyAnalyticRepresentationsOfLocalGroups and the trianguline deformation theory planned by TriangulineVarietyAndItsLocalModel. Neither roadmap has been designed yet, so the reader states exactly what is imported from each (contracts LA1–LA6 and TR1–TR5) and records two gaps. Everything those inputs rest on that the atlas already plans is consumed from its owner: distribution algebras and coadmissible modules (LocallyAnalyticDistributionsPartII ND.1–ND.2), Robba and rank-one modules, Herr Ext and the étale equivalence (PhiGammaModulesAndIwasawaCohomology PG.1–PG.3 and PG.7), labelled de Rham realizations and the modified object D_σ (PadicHodgeTheory P7), the (φ,Γ)-module deformation rings (LocalGaloisDeformationRings R08.1), the principal-series Bernstein centre with its ordered-character maps (SmoothRepresentationsOfLocalGroups SR.3), and Harish-Chandra theory (Tau Ceti's LieHighestWeight, Layers 7 and 9). No layer is closed and no theorem is implemented. In rank two the kernel is zero and π_min=π_1, so this construction adds no Hodge parameter. It is expected to be far smaller than the full locally analytic representation of a p-adic correspondence. Ding’s global applications in §4 belong to the separate local-global compatibility roadmap.

The six layers follow mathematical dependencies: common refinement parameters; comparison and kernel; minimal extensions and scalar characters; parabolic and embedding compatibility; recovery; universal Artinian actions. The definitive targets, APIs, discriminating tests, source corrections and ownership boundaries are in research/blueprint/readmes/PadicHodgeParametersInLocallyAnalyticRepresentations.md. Every source statement is restated in our own words, with locators in the published 74-page version.

## Conventions and the statement being planned

Fix a prime p, a finite extension K/Q_p of degree d_K, and a finite coefficient extension E/Q_p containing the images of every embedding σ:K↪E. Write Σ_K for those embeddings and G=GL_n(K), with n≥1. The smooth tuple φ=(φ_i) is generic: φ_i/φ_j is neither 1 nor |·|_K for i≠j. For each σ, the integers h_{1,σ}>⋯>h_{n,σ} are strictly ordered. The object D belongs to the imported class ΦΓ_nc(φ,h): it is crystabelline and every refinement is noncritical. These are the standing hypotheses H. They are required throughout, except in the elementary permutation, tuple and numerical statements where weaker hypotheses are explicitly given.

Use geometric reciprocity: |ϖ_K|_K=p^{−[K_0:Q_p]} and ε(x)=N_{K/Q_p}(x)|x|_K. Put θ_i=1−i and λ_{i,σ}=h_{i,σ}+i−1. The algebraic character z^k is x↦∏_σσ(x)^{k_σ}. A permutation acts by w(φ)_i=φ_{w⁻¹(i)}; therefore w(n)=1 places φ_n first. For a standard parabolic P with blocks n_i, θ_P is constant −Σ_{k<i}n_k on its i-th block. All induced block comparisons carry ε⁻¹∘θ_P.

The main fixed objects are A=π_alg(φ,h)=π_sm(φ)⊗L(λ), V=π_1(φ,h), B=Ext¹_G(A,V), and Q=Ext¹(D,D)/Ext¹_0(D,D). Here Ext¹_0 is the common kernel of the trianguline parameter maps. Every Q_* is the image of the named deformation subspace modulo that same kernel. Every B_* is the supplier’s specified Ext image. The σ condition means algebraic, or de Rham of fixed weights, at every embedding other than σ. H_T=Hom_la(T(K),E) consists of additive locally Q_p-analytic characters; H_char=Hom_la(K×,E) has dimension 1+d_K, its smooth subspace dimension 1, and its σ-analytic subspace dimension 2.

The comparison is a surjection B→Q, not a map onto the full deformation tangent. Its kernel K_D has dimension c_nd_K, c_n=2^n−n(n+1)/2−1. The tautological class K_D↪B defines an extension of K_D⊗A by V. Recovering that embedded subspace, rather than its abstract dimension, is what retains Hodge information. No claim here identifies π_min with a full local Langlands representation.

## Ownership and exact supplier contracts

The following are import contracts, not definitions or proof targets of this roadmap. Their original mathematical statements are read at the published locators listed below. Their owners must establish them before the conditional comparison targets can be implemented. What the atlas already plans is consumed node by node: the distribution algebras and coadmissible modules of `LocallyAnalyticDistributionsPartII:ND.1/distribution-algebra` and `ND.2/coadmissible-theorems`; the Artinian Robba category, rank-one modules, Herr Ext and the étale equivalence of `PhiGammaModulesAndIwasawaCohomology:PG.7/relative-category`, `PG.7/rank-one-characters`, `PG.1/rank-one-dictionary`, `PG.3/herr-ext` and `PG.2/etale-tilde-equivalence`; the modified object D_σ of `PadicHodgeTheory:P7/embedding-selective-crystalline-modification`; the (φ,Γ)-module deformation rings of `LocalGaloisDeformationRings:R08.1/phi-gamma-module-deformation-rings`; and the principal-series Bernstein centre of `SmoothRepresentationsOfLocalGroups:SR.3/part-ii-principal-series-completion`, `part-ii-ordered-character-map` and `part-ii-principal-series-tangent`. They do not imply the specialized contracts below, which is why those remain.

### LA1 — LocallyAnalyticRepresentationsOfLocalGroups (design #3411)

The category of admissible locally Q_p-analytic E-representations of GL_n(K), strong continuous duality with coadmissible distribution modules, and Ext¹ as Yoneda extensions; its identification with Ext in the category of abstract distribution modules with arguments reversed. Supply push-forward, pullback, exact Hom–Ext sequences, finite coefficient tensor products, tautological extension classes and subspace detection under scalar endomorphisms. The distribution algebras D(H,E) of compact open H⊂GL_n(K), their Fréchet–Stein structure and the abelian category of coadmissible modules are LocallyAnalyticDistributionsPartII ND.1/distribution-algebra and ND.2/coadmissible-theorems, consumed from there; this contract is the passage to GL_n(K), admissibility and the Ext calculus.

Source boundary: §3.1.1, p. 33; Remark 3.9 and (3.16), p. 39.

### LA2 — LocallyAnalyticRepresentationsOfLocalGroups (design #3411)

Supply π_sm(φ), L(λ), A, PS(w(φ),h), PS_1, C(I,s_{i,σ}), V=π_1(φ,h), π(φ,h), the specified embeddings and first two socle layers. Supply End(π)→End(V)→End(A)≃E, Ext¹(A,V)≃Ext¹(A,π), and Lemma 3.5(2) with constituent dévissage used for push-forward surjectivity. Labels use all nonempty proper I⊂{1,…,n}, not I⊂{1,…,n−1}.

Source boundary: §3.1.2, Propositions 3.1,3.3, Lemma 3.5, Proposition 3.8, Remark 3.9, pp. 34–39.

### LA3 — LocallyAnalyticRepresentationsOfLocalGroups (design #3411)

Supply injective ζ_w:H_T→B with images B_w; dim B=n+(2^n−1)d_K, dim B_w=n(1+d_K), and Σ_wB_w=B. Supply common B_g and B_g′, B_g≤B_g′≤B_w, with dim B_g=n and dim B_g′=n+d_K. Supply smooth parameter compatibility and Weyl invariance on actual block determinant directions.

Source boundary: §3.1.2, (3.10), (3.17), (3.18), Proposition 3.8, pp. 37–39; §3.1.3, (3.30), p. 43.

### LA4 — LocallyAnalyticRepresentationsOfLocalGroups (design #3411)

Supply normalized parabolic Ext images B_F, the isomorphism ζ_F:∏B(M_i)≃B_F, compatible-refinement spanning, and 0→B_g′→B_F⊕B_G→B→0 for the two endpoint parabolics, with first arrow b↦(b,−b). Supply π_F and its inclusion, Emerton induction I_{P⁻}^G, completed external tensor product, and their extension-class compatibilities. Use θ_P constant −Σ_{k<i}n_k on block i and twist ε⁻¹∘θ_P.

Source boundary: §3.1.3, Propositions 3.12–3.13 and (3.27)–(3.30), pp. 42–44.

### LA5 — LocallyAnalyticRepresentationsOfLocalGroups (design #3411)

Supply π_{1,σ}, Ext¹_σ(A,π_{1,σ}) and its image B_σ⊂B, with algebraicity at every τ≠σ, dim B_σ=n+2^n−1. Supply the partially algebraic Hom–Ext and parabolic compatibilities, the common smooth space, and ⊕_σ(B_σ/B_g)≃B/B_g. Supply the analogous amalgamation of π_{1,σ} over A and its maximal partial algebraic subrepresentations.

Source boundary: §3.1.4, Propositions 3.16, 3.18, 3.19 and 3.20, pp. 44–47.

### LA6 — LocallyAnalyticRepresentationsOfLocalGroups (design #3411)

Supply the Jacquet–Emerton/Orlik–Strauch character-to-Ext compatibility (3.10), Proposition 3.6(1), Remark 3.7 and the surjectivity in (3.14), including their use on the universal character extension. The completed principal-series Bernstein centre Ĥ_φ, the maps 𝒥_w and their smooth tangent compatibility are already planned in SmoothRepresentationsOfLocalGroups SR.3 (part-ii-principal-series-centre, part-ii-ordered-character-map, part-ii-principal-series-completion, part-ii-principal-series-tangent) and are consumed from there.

Source boundary: §3.1.2, Proposition 3.3(2), Proposition 3.6 and Remark 3.7, pp. 35–38; §3.2.2, p. 57.

### TR1 — TriangulineVarietyAndItsLocalModel (design #3412)

Supply ΦΓ_nc(φ,h): generic noncritical crystabelline (φ,Γ)-modules over R_{K,E}, all of whose refinements are noncritical, with the bijection between refinements and triangulations and the saturated D_1 and quotient C_1 of (2.1)–(2.2) carrying the weights used in PH.1. The theory includes nonétale objects. The Robba ring, rank-one modules R_{K,E}(δ) with the criterion that R_{K,E}(δ) is de Rham exactly when δ is locally algebraic, Ext¹ as first-order deformations, labelled de Rham realizations and B-pairs are already planned (PhiGammaModulesAndIwasawaCohomology PG.1/rank-one-dictionary, PG.3/herr-ext, PG.7/rank-one-characters; PadicHodgeTheory P7/labelled-bdr-realisation, P7/b-pair-robba-equivalence) and are consumed from there.

Source boundary: §2.1, pp. 9–11; §2.2, (2.1)–(2.2), p. 11.

### TR2 — TriangulineVarietyAndItsLocalModel (design #3412)

Supply Ext¹, Ext¹_w, Ext¹_g, the common Ext¹_0=ker κ_w, its dimension n(n−1)d_K/2+1−n, and the quotient Q and its actual subspaces Q_w,Q_g,Q_g′. Supply κ_w:Q_w≃H_T, dim Q=n+n(n+1)d_K/2, dim Q_w=n(1+d_K), dim Q_g=n, and spanning by the Q_w. Supply Q_g′ and the parameter compatibility corresponding to B_g′. The deformation rings R_D,R_{D,w},R_{D,g}, their tangent spaces Ext¹,Ext¹_w,Ext¹_g, the parameter maps and Proposition 2.10(2)–(3), in the form of the first-order Cartesian square (3.55), are already planned in LocalGaloisDeformationRings R08.1/phi-gamma-module-deformation-rings; this contract is the rest: the dimension formulas of Proposition 2.10(1), Lemma 2.11, Ext¹_0, the quotient subspaces and Proposition 2.12.

Source boundary: §2.3.1, Proposition 2.10, Lemma 2.11, Proposition 2.12 and (2.12)–(2.16), pp. 15–18.

### TR3 — TriangulineVarietyAndItsLocalModel (design #3412)

Supply parabolic quotient spaces Q_F, κ_F:Q_F≃∏Q(M_i), compatible-refinement spanning and invariance on block determinant directions, with the explicit parameter normalization used by ζ_F. The correct block dimension is Σ_i[n_i+n_i(n_i+1)d_K/2].

Source boundary: §2.3.1, Corollaries 2.14–2.15 and (2.19)–(2.21), pp. 19–20.

### TR4 — TriangulineVarietyAndItsLocalModel (design #3412)

The modified object D_σ itself (Proposition 2.5(1): D⊂D_σ, D_σ[1/t]=D[1/t], the σ-Hodge filtration retained and every other embedding's weights replaced by h_{n,τ}) is already planned in PadicHodgeTheory P7/embedding-selective-crystalline-modification and is consumed from there. Supply the deformation-level theory: Q_σ for deformations de Rham of fixed weights away from σ, dim Q_σ=n+n(n+1)/2, the embeddings in Q, the deformation map 𝔗_σ of Propositions 2.23–2.24 with Q_σ(D)≃Q_σ(D_σ) respecting parabolic decompositions (Corollary 2.27), and the surjections ⊕_wQ_{σ,w}(D)↠Q_σ(D) and ⊕_wQ_{σ,w}(D_σ)↠Q_σ(D_σ) (Corollary 2.40). Away from σ the modified weights are repeated; a globally regular theorem cannot be invoked anew on D_σ.

Source boundary: §2.2, Proposition 2.5 and (2.7), pp. 13–14; §2.3.2, Lemma 2.16, Proposition 2.17, Corollaries 2.18–2.19, pp. 20–21; Propositions 2.23–2.24 and Corollary 2.27, pp. 23–25; Corollary 2.40, p. 32.

### TR5 — TriangulineVarietyAndItsLocalModel (design #3412)

Supply the higher-intertwining relation L(D_σ,D_{1,σ},C_{1,σ}) as a specified embedded subspace of V(D_{1,σ},C_{1,σ})_σ, the exact sequence (2.42), and Corollary 2.38(1): equality of such embedded relations with fixed identified blocks determines D_σ. Supply the n≤2 base case. The étale equivalence used for the K=Q_p consequence is PhiGammaModulesAndIwasawaCohomology PG.2/etale-tilde-equivalence, consumed directly by PH.4/recovery.

Source boundary: §2.4, (2.39)–(2.42), Corollaries 2.38–2.40, pp. 29–32; proof of Theorem 3.34, p. 56.

### TR6 — Already planned: LocalGaloisDeformationRings:R08.1/phi-gamma-module-deformation-rings and SmoothRepresentationsOfLocalGroups:SR.3 (part-ii nodes)

Representability and formal smoothness of R_D,R_{D,w},R_{D,g},R_δ,R_{δ,g} for possibly nonétale D, the tangent–Ext identifications and the first-order Cartesian square (3.55) are LocalGaloisDeformationRings R08.1/phi-gamma-module-deformation-rings. The completed centre Ĥ_φ, the isomorphisms 𝒥_w:Ĥ_φ≃R_{w(φ),g} and their reordering compatibility are SmoothRepresentationsOfLocalGroups SR.3/part-ii-principal-series-completion, part-ii-ordered-character-map and part-ii-principal-series-tangent. Nothing here is left to design #3412 beyond the Lemma 2.11 input of TR2.

Source boundary: §3.2.2, pp. 56–57; Proposition 2.10(2),(3) and Lemma 2.11, pp. 16–17.

### HC — TauCetiRoadmap/RepresentationTheory/LieHighestWeight, Layers 7 and 9

Supply the split reductive gl_n Harish–Chandra isomorphism and its highest-weight evaluation normalization over finite E/Q_p, including the scalar matrix direction, tensoring over all embeddings, and descent of identities from a splitting/algebraic closure if used. The regular Sen-root-to-invariant-polynomial tangent isomorphism is proved in PH.2/scalar-characters using a Vandermonde determinant.

Source boundary: Ding Proposition 3.26 and (3.46)–(3.47), pp. 51–52; upstream LieHighestWeight Layers 7,9.

### Unresolved input chains

LocallyAnalyticRepresentationsOfLocalGroups (design #3411) and TriangulineVarietyAndItsLocalModel (design #3412) have no roadmap definition or stage yet. Gaps G-LA and G-TR record exactly what each must still supply: LA1–LA6 less the distribution-algebra and Bernstein-centre parts named above, and TR1–TR5 less the Robba, rank-one, de Rham, modified-object and deformation-ring parts named above. Contract TR6 is already met by existing nodes. When the two designs exist, point the consuming targets at their exact nodes; never invent supplier ids or duplicate their theory here.

G-HC separately records the finite-E reductive application of the existing highest-weight roadmap. Its central projection is already in current Tau Ceti; the full normalized isomorphism needed by the scalar-character argument is not supplied by that fact alone. No layer is marked closed. The plan covers all six layers, with these exact gaps retained, and makes no implementation claim.

## What the libraries and upstream roadmaps already provide

- **Pinned Mathlib 082e2d3 and Tau Ceti f790474; declaration index and source statements read.** Eight elementary declarations are listed in baseline. No Robba/noncritical trianguline or Ding/Emerton/Orlik–Strauch category declaration found at the pins. Do not confuse abstract Mathlib representations or analytic functions with the required admissible category.
- **data/library-coverage.json; LocallyAnalyticDistributions:L0–L4 and LocallyAnalyticDistributionsPartII stages.** The reviewed audit leaves locally analytic function/distribution foundations incomplete; it does not provide Ding’s GL_n Ext system. Distribution/category and specialized Harish–Chandra work is imported from its owners rather than replanned.
- **Current TauCetiRoadmap main, RepresentationTheory/InductionRestriction README and Suggested.lean.** Owns algebraic induction/restriction, projection and Mackey theory. These concern Rep and finite-index/finite-group inputs; they are not the locally analytic Emerton functor I. No targets are copied from it.
- **Current TauCetiRoadmap main, RepresentationTheory/LieHighestWeight README and Suggested.lean, Layers 3,7,9.** Owns Verma modules, highest weights, central characters, Harish–Chandra and split gl_n transfer. PH.2 imports these. Layer 7’s semisimple setup and Layer 9’s scalar-center bridge require an explicit finite-E reductive application, recorded in G-HC.
- **Current Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039; Algebra/Lie/HighestWeight/CentralCharacter/HarishChandra.lean and DotOrbit.lean.** TauCeti.hcProjection is an implemented algebra map from the enveloping-algebra center to SymmetricAlgebra; hcProjection_mem_dotInvariants proves containment in the dot-invariants. Neither is re-planned. They are later than the pin and do not supply the full Harish–Chandra isomorphism required by Proposition 3.26.
- **Current upstream roadmap directory, including the nine additions beyond the atlas snapshot and LocalGaloisGroups.** Searched target names and relevant Suggested declarations. LocalGaloisGroups supplies local-field/Galois foundations, not the Robba deformation quotient or local analytic Ext comparison. No current upstream roadmap or current Tau Ceti declaration already plans the comparison targets.
- **PhiGammaModulesAndIwasawaCohomology PG.1, PG.2, PG.3, PG.7 (accepted packet).** Consumed nodes: PG.7/relative-category (Artinian-coefficient Robba modules), PG.7/rank-one-characters, PG.1/rank-one-dictionary, PG.3/herr-ext (Ext¹ as first-order deformations) and PG.2/etale-tilde-equivalence. They do not assert Ding's quotient, de Rham or σ identities, the embedded recovery relation or the noncritical class ΦΓ_nc; those remain TR contracts.
- **PadicHodgeTheory P7 (accepted packets PadicHodgeTheory and PadicHodgeTheory--P7).** Already plans, for Ding's §2.1–2.2, labelled de Rham realizations, B-pairs with their Robba equivalence and Herr comparison, and the modified object D_σ of Proposition 2.5(1) (P7/embedding-selective-crystalline-modification). PH.3/modified-comparison consumes the last; the deformation-level 𝔗_σ remains contract TR4.
- **LocalGaloisDeformationRings R08.1 and SmoothRepresentationsOfLocalGroups SR.3 (accepted packets).** R08.1/phi-gamma-module-deformation-rings plans the (φ,Γ)-module deformation rings of §3.2.2 and the square (3.55); SR.3/part-ii-principal-series-centre, -ordered-character-map, -principal-series-completion and -principal-series-tangent plan Ĥ_φ, 𝒥_w and their tangents. PH.5/first-order-algebras consumes them, so contract TR6 and the smooth half of LA6 are already met.
- **LocallyAnalyticDistributionsPartII ND.1–ND.2 (accepted packet).** Plans D(G,K) for compact G, Fréchet–Stein algebras and coadmissible modules. These are the foundation of LA1 and are consumed by PH.0/comparison-presentation, PH.2/minimal-extensions and PH.5/universal-extensions in place of LocallyAnalyticDistributions:L0, which is one level further down. The admissible category of the noncompact GL_n(K) is not planned there.

The baseline commits are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. All eight baseline statements below were read at those commits and checked by full name against the index. Current upstream was inspected read-only; no build was run there.

| Pinned declaration | Reused capability |
| --- | --- |
| `Equiv.Perm` | Permutation equivalences on the actual finite type Fin n. |
| `LinearMap` | Linear maps between existing modules, for the comparison once its input carriers exist. |
| `Submodule` | Actual submodules closed under zero, addition and scalar multiplication. |
| `LinearMap.ker` | The actual kernel submodule of a linear map. |
| `LinearMap.quotKerEquivOfSurjective` | The quotient by the kernel is linearly equivalent to the target of a surjective linear map. |
| `LinearMap.finrank_range_add_finrank_ker` | Rank-nullity for a linear map with finite-dimensional domain. |
| `TrivSqZeroExt` | The existing square-zero E-algebra E⊕M; use M=Q∨ after establishing the genuine Artinian tangent identification. |
| `Module.Dual` | The E-linear dual, distinguishing cotangent from tangent. |

## Layers and targets

Every target below includes its own statement, source, dependency chain and checks. For definitions and constructions, the API names are proposed library names, and the tests are mathematical specifications that a wrong definition would fail. Heavy objects remain README targets until their actual carriers exist; no axiomatic stand-in is introduced in Lean.

## PH.0 — Refinement parameters and the common presentation

Define endpoint refinement families and determinant-pullback block character directions; prove their telescoping spanning formula. Form the two surjective maps from the sum of quotient trianguline tangents to representation Ext and quotient deformation space. This layer imports all underlying representation and deformation objects.

Layer prerequisites: `LocallyAnalyticDistributionsPartII:ND.1`, `LocallyAnalyticDistributionsPartII:ND.2`, `PhiGammaModulesAndIwasawaCohomology:PG.3`, `PhiGammaModulesAndIwasawaCohomology:PG.7`.

### PH.0/endpoint-refinements — Endpoint refinement families

**Definition.** For n≥1, define S_end={w∈S_n | w(n)=n} and S_start={w∈S_n | w(n)=1}. The paper uses w(φ)_i=φ_{w⁻¹(i)}, so these are exactly the refinements placing φ_n last or first. S_end is the standard subgroup S_{n−1}; S_start is a coset, and each has (n−1)! elements. Suggested Lean uses Fin(m+1), with m=n−1.

Hypotheses: n≥1; permutations act by w(φ)_i=φ_{w⁻¹(i)}.

Prerequisites: `mathlib:Equiv.Perm`.

**Proof or construction.**

1. Identify S_end with permutations of the complement of n.
2. Choose a permutation moving n to 1 and translate S_end to S_start; verify the permutation convention before using these families in induction.

**Check.** Check both cardinalities and their membership tests. Do not substitute w⁻¹(n)=1 for w(n)=1.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `endRefinements` | constructor | The subset of Equiv.Perm(Fin(m+1)) fixing Fin.last m. |
| `startRefinements` | constructor | The subset whose permutations send Fin.last m to 0. |
| `endpoint_membership` | simp | Membership is the stated image equation, with no inverse permutation. |
| `endpoint_card` | equivalence | Each family is equivalent to Equiv.Perm(Fin m) and has m! elements. |

**Discriminating tests.**

- `rank_one_endpoints`: At n=1 both subsets contain the unique permutation and have cardinality one.
- `rank_two_distinction`: At n=2 S_end={id}, while S_start consists of the transposition; id is not in S_start.
- `rank_three_endpoint_count`: At n=3 both families have cardinality two; a 3-cycle sending 3 to 2 belongs to neither.

**Uses.** PH.1/comparison-map: Indexes the two rank n−1 comparison maps before gluing. PH.0/character-spanning: For an interior placement, a block Weyl permutation moves φ_n to one of these endpoint positions.

**Source.** Ding [DING25], §3.2.1, proof of Theorem 3.21, pp. 48–50 (S′_{n−1} on p. 48). The two endpoint families supply the two inductive parabolic comparisons.

### PH.0/block-characters — Block character subspaces

**Definition.** Identify H_T with H_char^n, H_char=Hom_la(K×,E), by ψ(t)=Σ_i ψ_i(t_i). For 1≤j<n put H_j={ (a,…,a,b,…,b) : a,b∈H_char }, with j entries a, and H_Z={ (a,…,a) }. These are images of pullback along the two block determinants and the full determinant. They realize the character spaces of the Levi centers inside H_T; they are not obtained by reversing restriction along Z_j⊂T. For 0≤j≤n define blockTuple(n,j,a,b)_i=a for i<j and b otherwise (zero-based).

Hypotheses: K,E as in H; n≥1. For the tuple model alone, an additive commutative group suffices.

Prerequisites: `mathlib:LinearMap`, `mathlib:Submodule`.

**Proof or construction.**

1. Use the product decomposition T(K)=(K×)^n to identify additive characters with tuples.
2. Pull a character of K××K× back by (∏_{i≤j}t_i,∏_{i>j}t_i); differentiate if a center restriction is used.
3. Restriction to scalar blocks multiplies the corresponding characters by j and n−j, invertible over E.

**Check.** Keep H_Z⊂H_j explicit. Use locally Q_p-analytic additive characters; dimensions are 1+d_K per coordinate.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `blockTuple` | constructor | blockTuple(n,j,a,b) is the actual tuple, including j=0 and j=n. |
| `blockTuple_apply` | projection | Its i-th coordinate is a if i<j, and b otherwise. |
| `block_character_pullback` | compatibility | Under H_T≅H_char^n this tuple pulls back (a,b) through the two block determinants. |
| `block_character_range` | characterisation | For 0<j<n its range is H_j; the full determinant gives H_Z. |
| `block_character_linear` | structure | The map (a,b)↦blockTuple(n,j,a,b) is E-linear. |
| `diagonal_in_block` | relation | blockTuple(n,j,a,a) is the diagonal tuple, hence H_Z≤H_j. |

**Discriminating tests.**

- `empty_first_block`: blockTuple(n,0,a,b) is constantly b, so swapping the inequality gives a wrong answer.
- `full_first_block`: blockTuple(n,n,a,b) is constantly a.
- `rank_three_block`: blockTuple(3,1,a,b)=(a,b,b); if a≠b it is not diagonal.
- `center_overlap`: For n=3 the nonzero tuple (a,a,a) lies in H_1∩H_2, so their sum is not direct.

**Uses.** PH.0/character-spanning: Gives generators for the corrected spanning assertion. PH.1/comparison-map: Lets an arbitrary refinement be compared to endpoint refinements on directions fixed by a block Weyl group.

**Source.** Ding [DING25], §2.1, p. 9; Corollary 2.15 and (2.21), pp. 19–20; proof of Theorem 3.21, (3.43), pp. 49–50. Block-constant character directions are the common subspaces on which the parabolic intertwining squares apply; the embedding is made explicit here.

Atlas planet: **Block character directions**.

### PH.0/character-spanning — Levi-center character spanning

**Theorem.** H_T=H_Z+Σ_{j=1}^{n−1}H_j. More precisely, for v=(v_0,…,v_{n−1}) in H_char^n, v is the constant tuple v_{n−1} plus Σ_{j=1}^{n−1}blockTuple(n,j,v_{j−1}−v_j,0). This also holds over any additive commutative group. The sum is a spanning sum with overlaps, not a direct-sum isomorphism as printed in (3.43).

Hypotheses: n≥1; H_char an additive commutative group, specialized to Hom_la(K×,E).

Prerequisites: `PH.0/block-characters`.

**Proof or construction.**

1. At coordinate i the terms with j>i telescope to v_i−v_{n−1}.
2. Each summand is a two-block character; for n=1 only the constant summand remains.
3. For an interior position i and split j, the block containing i reaches either 1 or n, so its Weyl group contains a permutation sending i to an endpoint.

**Check.** Check the coordinate formula rather than a dimension-only argument. At n=3,d_K=1, H_T has dimension 6 while the printed direct sum has dimension 10.

**Source.** Ding [DING25], §3.2.1, proof of Theorem 3.21, (3.43) and following paragraph, pp. 49–50. A telescoping proof supplies exactly the spanning consequence used to finish the factorization, repairing source issue E1.

Atlas planet: **Levi-center character spanning**.

### PH.0/comparison-presentation — Refinement presentation of the comparison

**Construction.** Set C=⊕_{w∈S_n}Q_w, with a_w:Q_w↪Q the quotient deformation inclusion and κ_w:Q_w≃ₗH_T the imported parameter isomorphism. Define R_D:C→B by Σ_w ζ_wκ_w and s_D:C→Q by Σ_w a_w. Both are surjective, by the separate representation and deformation spanning theorems. This constructs the common presentation; it does not yet assert ker(R_D)≤ker(s_D).

Hypotheses: H and the notation fixed above.

Prerequisites: `PhiGammaModulesAndIwasawaCohomology:PG.7/relative-category`, `PhiGammaModulesAndIwasawaCohomology:PG.3/herr-ext`, `mathlib:LinearMap`, `LocallyAnalyticDistributionsPartII:ND.1/distribution-algebra`, `LocallyAnalyticDistributionsPartII:ND.2/coadmissible-theorems`, `PhiGammaModulesAndIwasawaCohomology:PG.7/rank-one-characters`.

**Proof or construction.**

1. The representation-side Ext groups are Ext groups of strong duals, which are coadmissible modules over the distribution algebras D(H,E) of compact open H⊂GL_n(K): import those algebras, their Fréchet–Stein structure and the abelian category of coadmissible modules from LocallyAnalyticDistributionsPartII ND.1–ND.2. The admissible category of GL_n(K) itself and the objects A, V, ζ_w are contracts LA1–LA3 (gap G-LA).
2. Use the common Ext¹_0 quotient on every deformation term, before defining C.
3. Compose κ_w with the imported injective ζ_w:H_T→B, then use the direct-sum map.
4. Import Proposition 3.8(2) for R_D and Proposition 2.12 for s_D; these are different supplier facts. The trianguline parameters use the rank-one modules R_{K,E}(δ) of PhiGammaModulesAndIwasawaCohomology PG.7/rank-one-characters, and Ext¹ is the first-order deformation space of PG.3/herr-ext.

**Check.** Retain both maps and their restrictions to every summand. The target Q is the quotient, not the full tangent Ext¹(D,D).

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `comparisonPresentation` | constructor | C and the two E-linear maps R_D,s_D are built from the genuine imported Ext spaces. |
| `presentation_refinement` | projection | R_D∘in_w=ζ_wκ_w and s_D∘in_w=a_w. |
| `presentation_surjective` | structure | R_D and s_D are surjective by the two supplier spanning results. |
| `presentation_reindex` | functoriality | Permuting refinement labels transports the diagram through the same permutation of direct-sum factors. |

**Discriminating tests.**

- `rank_one_presentation`: For n=1 C=Q_1 and κ_1,ζ_1 identify both maps with the sole character parameter.
- `zero_class`: A parameter with κ_w=0 is zero in Q_w, so every summand maps its zero class to zero.
- `quotient_dimension`: At n=3,d_K=1 the target Q has dimension 9, while the full Ext¹(D,D) has dimension 10.
- `opposite_sum_relations`: If two summands represent the same quotient deformation, s_D sends their difference to zero; this alone does not say R_D does.

**Uses.** PH.1/comparison-map: Factorization means s_D=t_D R_D and requires proving the kernel inclusion. PH.5/first-order-algebras: The trianguline tangent spanning implies the dual first-order algebra map is injective.

**Source.** Ding [DING25], §2.3.1, (2.14)–(2.16) and Proposition 2.12, pp. 17–18; §3.1.2, Proposition 3.8 and (3.17), pp. 38–39; §3.2.1, (3.38), p. 47. The two input theories give surjections from the same direct sum; the roadmap owns their comparison.

Atlas planet: **Refinement comparison presentation**.

## PH.1 — Ding’s comparison and its kernel

Glue the two endpoint block comparisons under rank induction, prove compatibility with every refinement using block-character spanning, and obtain the unique surjection t_D. Compute its kernel dimension c_n d_K and its transversality to every trianguline direction.

Layer prerequisites: `PH.0`.

### PH.1/kernel-multiplicity — The kernel multiplicity coefficient

**Definition.** For n≥1 define c_n=2^n−(n(n+1)/2+1), with subtraction in N. The inequality n(n+1)/2+1≤2^n identifies this with the corresponding integer difference.

Hypotheses: n≥1; only natural-number arithmetic is used.

Prerequisites: natural-number arithmetic.

**Proof or construction.**

1. Induct on n to establish the bound, then evaluate the expression in N.

**Check.** Check c_1=c_2=0,c_3=1,c_4=5,c_5=16.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `kernelMultiplicity` | constructor | The natural-number expression displayed above. |
| `kernelMultiplicity_bound` | characterisation | For n≥1 the subtrahend is at most 2^n, so natural subtraction agrees with integer subtraction. |
| `kernelMultiplicity_small` | example | Its values at n=1,2,3,4,5 are 0,0,1,5,16. |

**Discriminating tests.**

- `low_rank_zero`: c_1=c_2=0.
- `first_parameter`: c_3=1 and c_4=5, excluding the erroneous replacement 2n for 2^n.
- `rank_five_value`: c_5=16.
- `nonnegative_bound`: At n=1 the bound is equality; at n=3 the excess is exactly one.

**Uses.** PH.1/kernel-dimension: Gives the coefficient multiplying d_K. PH.2/minimal-extensions: Counts copies of A in the quotient of the minimal extension.

**Source.** Ding [DING25], §3.2.1, Remark 3.22(1), p. 50. This is the numerical coefficient of the comparison kernel.

### PH.1/endpoint-gluing — Gluing the two endpoint comparisons

**Construction.** For n≥2 assume the comparison theorem in smaller ranks. Put F=(D_1⊂D), G=(R(φ_n z^{h_1})⊂D), where D_1 has parameters φ_1,…,φ_{n−1} and weights h_1,…,h_{n−1}, while C_1=D/R(φ_n z^{h_1}) has those parameters and weights h_2,…,h_n. Via ζ_F,κ_F and ζ_G,κ_G define t_F:B_F→Q_F↪Q and t_G:B_G→Q_G↪Q by the smaller-rank comparisons and the rank-one character map. These maps agree on B_g′. Hence there is a unique τ_D:B→Q restricting to both, by 0→B_g′→B_F⊕B_G→B→0 with anti-diagonal first arrow. It satisfies the refinement equation for w(n)=n or w(n)=1.

Hypotheses: H and the notation fixed above; n≥2; the smaller-rank comparison theorem is the strong-induction hypothesis, not a same-rank prerequisite..

Prerequisites: `PH.0/endpoint-refinements`.

**Proof or construction.**

1. Transport smaller-rank comparison through the two block isomorphisms (2.19),(3.27).
2. On the common B_g′ the parameter equations (2.13),(3.18) identify the two maps.
3. Their sum kills (b,−b); descend using Proposition 3.13 and check the two endpoint families.

**Check.** Both maps must agree on B_g′, not merely on B_g. Use C_1 weights h_2,…,h_n; using the top weights twice changes the second comparison.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `endpointComparison` | constructor | τ_D is the descended linear map on the sum presentation of B. |
| `endpointComparison_restrict` | projection | Its restrictions to B_F and B_G are t_F and t_G. |
| `endpointComparison_unique` | extensionality | Those restrictions determine τ_D because B_F+B_G=B. |
| `endpointComparison_refinement` | compatibility | τ_Dζ_wκ_w=a_w for refinements in either endpoint family. |

**Discriminating tests.**

- `overlap_sign`: The pair (b,−b), b∈B_g′, maps to zero.
- `rank_two_blocks`: At n=2 both block comparisons are rank-one character maps and the endpoint families exhaust S_2.
- `distinct_block_weights`: For h=(3,1,−2), the two rank-two weights are (3,1) and (1,−2), respectively.

**Uses.** PH.1/all-refinements: Supplies the map known on endpoint refinements. PH.1/comparison-map: Provides the inductive construction before verifying all refinements.

**Source.** Ding [DING25], §3.2.1, (3.40)–(3.41), pp. 48–49; Proposition 3.13, p. 44. The inductive block maps glue along the representation-theoretic exact sequence.

### PH.1/all-refinements — Compatibility beyond the endpoint refinements

**Theorem.** Under the smaller-rank induction hypothesis, the glued τ_D satisfies τ_Dζ_wκ_w=a_w for every w∈S_n, including 1<w(n)<n.

Hypotheses: H and the notation fixed above; n≥2; τ_D is the endpoint map constructed using smaller-rank comparisons..

Prerequisites: `PH.1/endpoint-gluing`, `PH.0/character-spanning`.

**Proof or construction.**

1. For a split j, choose in its block Weyl group a permutation moving the position w(n) to an endpoint of {1,…,n}.
2. Use Corollary 2.15 and (3.30) to compare the two refinement maps on the determinant-pullback block directions H_j. The changed refinement is an endpoint refinement, where compatibility is established.
3. Apply the same assertion on H_Z and then the telescoping spanning identity to obtain compatibility on all H_T.

**Check.** This step must handle every block direction, not infer all refinements just from the two endpoint families. Use a spanning sum with common diagonal directions; the false direct-sum assertion (3.43) is unnecessary.

**Source.** Ding [DING25], §3.2.1, (3.42)–(3.43) and the concluding paragraph of Theorem 3.21, pp. 49–50. Block Weyl compatibility and character spanning extend the glued comparison to every refinement.

### PH.1/comparison-map — Ding’s comparison map

**Construction.** There is a unique surjective E-linear map t_D:B→Q with t_D∘R_D=s_D. Equivalently, t_Dζ_wκ_w=a_w for every w. The map is canonical for the fixed parameter conventions, and its restriction B_w→Q_w is κ_w⁻¹ζ_w⁻¹. Replacing V by π(φ,h) through the imported Ext isomorphism (3.16) gives the same comparison.

Hypotheses: H and the notation fixed above.

Prerequisites: `PH.0/comparison-presentation`, `PH.0/endpoint-refinements`, `PH.0/character-spanning`, `mathlib:LinearMap.quotKerEquivOfSurjective`, `PH.1/endpoint-gluing`, `PH.1/all-refinements`.

**Proof or construction.**

1. Use strong induction on n, with the sole character comparison at n=1.
2. At n≥2 apply endpoint-gluing using the smaller-rank comparisons. Apply all-refinements to the resulting τ_D; this proves every refinement equation and hence s_D=τ_D R_D.
3. Surjectivity follows from the surjectivity of s_D; uniqueness follows from that of R_D. Transport through the supplier Ext isomorphism (3.16) for the full π(φ,h) version.

**Check.** Do not assume the desired kernel inclusion as a hypothesis. Check all refinements after the two endpoint families, and preserve the block-induction twists.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `comparisonMap` | constructor | The unique linear map B→Q satisfying the refinement equations. |
| `comparisonMap_refinement` | compatibility | t_Dζ_wκ_w=a_w as actual linear maps. |
| `comparisonMap_surjective` | structure | Every quotient deformation is t_D(b) for some b∈B. |
| `comparisonMap_unique` | extensionality | Two maps satisfying every refinement equation are equal, since R_D is onto. |
| `comparisonMap_full_principal_series` | compatibility | Transport through B≃Ext¹_G(A,π(φ,h)) preserves t_D. |

**Discriminating tests.**

- `rank_one_comparison`: For n=1 t_D is a character-parameter isomorphism; its kernel is zero.
- `refinement_restriction`: For b=ζ_w(ψ), t_D(b)=a_w(κ_w⁻¹ψ), so it is independent of an extension presentation.
- `mixed_relation`: For c∈ker R_D the constructed map gives s_D(c)=0; this is the new theorem, not an input.
- `full_series_transport`: Push V into π(φ,h); computing t_D on any ζ_w(ψ) yields the same quotient deformation.

**Uses.** PH.2/minimal-extensions: Its kernel selects the extension carrying Hodge information. PH.3/parabolic-comparison: Restriction to parabolic Ext images compares the graded blocks. PH.5/universal-artinian-action: The dual map t_D∨ defines the radical action.

**Source.** Ding [DING25], §3.2.1, Theorem 3.21, (3.39)–(3.43), pp. 48–50; Remark 3.22(2), p. 50. The comparison is obtained by rank induction and gluing, with the source’s false direct-sum replaced by a proved spanning identity.

Atlas planet: **Ding’s comparison map**.

### PH.1/kernel-dimension — Dimension of the Hodge-parameter kernel

**Theorem.** Put c_n=2^n−n(n+1)/2−1, a nonnegative integer for n≥1 (natural implementation: 2^n−(n(n+1)/2+1)). Then dim_E ker(t_D)=c_n d_K. The input dimensions are dim B=n+(2^n−1)d_K and dim Q=n+n(n+1)d_K/2. In particular c_1=c_2=0, c_3=1, c_4=5, c_5=16; π_min carries no extra kernel parameter at n≤2.

Hypotheses: H and the notation fixed above.

Prerequisites: `PH.1/comparison-map`, `mathlib:LinearMap.finrank_range_add_finrank_ker`, `PH.1/kernel-multiplicity`.

**Proof or construction.**

1. Apply rank-nullity to the surjective t_D.
2. Subtract the two supplier dimension formulas, using integer arithmetic before identifying the nonnegative result with its natural expression.
3. Verify n(n+1)/2+1≤2^n for n≥1 and the small-rank values.

**Check.** Use 2^n rather than 2n. For n=3,d_K=2 the kernel dimension is 2, with one direction for each embedding.

**Source.** Ding [DING25], §3.2.1, Remark 3.22(1), p. 50; input dimensions in (2.16), p. 17 and Proposition 3.8(1), p. 38. The size of the kernel is the excess of representation extensions over quotient deformations.

Atlas planet: **Hodge-parameter kernel dimension**.

### PH.1/refinement-transversality — Kernel transversality to a refinement

**Theorem.** For every refinement w, ker(t_D)∩B_w=0. Consequently ker(t_D)∩B_g=0 and ker(t_D)∩B_g′=0, since B_g≤B_g′≤B_w. Thus t_D maps B_w isomorphically onto Q_w and B_g onto Q_g.

Hypotheses: H and the notation fixed above.

Prerequisites: `PH.1/comparison-map`.

**Proof or construction.**

1. On B_w use t_Dζ_w=a_wκ_w⁻¹, where a_w is injective.
2. Restrict to the two common subspaces; do not use dimension alone to infer the intersection vanishes.

**Check.** Check transversality for every w. A kernel can be nonzero while meeting every individual B_w trivially; the B_w form an overlapping spanning family.

**Source.** Ding [DING25], §3.2.1, Lemma 3.23 and Corollary 3.24, p. 50. Each refinement maps injectively even though gluing their extension spaces creates a kernel.

Atlas planet: **Refinement transversality**.

## PH.2 — The minimal extension and its scalar characters

Construct the tautological kernel extension π_min and its finite-slope pushout; identify its Ext group with Q, characterize it by socle layers and refinement maps, and prove the determinant-normalized group-center and infinitesimal-character scalar actions.

Layer prerequisites: `PH.1`, `LocallyAnalyticDistributionsPartII:ND.2`, `PhiGammaModulesAndIwasawaCohomology:PG.1`, `PhiGammaModulesAndIwasawaCohomology:PG.7`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-7-the-center-of-ul-harish-chandra-freudenthal-and-serres-relations`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-9-reductive-lie-algebras-and-gl_n`.

### PH.2/minimal-extensions — Minimal and finite-slope kernel extensions

**Construction.** Let K_D=ker(t_D)⊂B. Define π_min(D) as the tautological extension 0→V→π_min(D)→K_D⊗_E A→0 whose class in Ext¹_G(K_D⊗A,V)≃Hom_E(K_D,B) is the inclusion. Define π_fs(D) by pushing this class through V↪π(φ,h). Then π_fs(D)≃π_min(D)⊕_Vπ(φ,h). These are extensions with identified subobject and quotient; their underlying isomorphism class is independent of a basis of K_D. Because End_G(π(φ,h))→End_G(V)→End_G(A) are E, either representation determines the subspace K_D in the fixed B.

Hypotheses: H and the notation fixed above.

Prerequisites: `PH.1/comparison-map`, `PH.1/kernel-dimension`, `LocallyAnalyticDistributionsPartII:ND.2/coadmissible-theorems`.

**Proof or construction.**

1. Apply the imported tautological-extension construction to K_D↪B; it is a contravariant coefficient Hom identification, not an arbitrary choice of c_nd_K extensions.
2. Push out along V↪π(φ,h) and use (3.16) to identify its class with the same inclusion.
3. The scalar endomorphism restrictions imply isomorphic such extensions determine the same embedded subspace, after identifying their intrinsic socle layers.

**Check.** Require the class to be the inclusion rather than a zero or unspecified class. Do not assert that π_fs or π_min is the full locally analytic correspondence.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `minimalExtension` | constructor | Construct the extension from the inclusion K_D↪Ext¹_G(A,V). |
| `minimalExtension_exact` | structure | The kernel and quotient are V and K_D⊗A, with the displayed exact sequence. |
| `minimalExtension_class` | characterisation | Under Ext¹(K_D⊗A,V)≃Hom(K_D,B), its class sends k to k. |
| `minimalExtension_basis_independent` | equivalence | Changing a basis of K_D transports the same extension class. |
| `finiteSlopeKernelExtension` | constructor | Push the kernel extension out to π(φ,h); its class is the transported inclusion. |
| `finiteSlopeKernelExtension_pushout` | universal-property | π_fs is the amalgamated pushout of π_min and π(φ,h) over V. |
| `minimalExtension_detects_kernel` | characterisation | Its isomorphism class determines the embedded K_D using the scalar endomorphism identifications. |

**Discriminating tests.**

- `rank_two_no_extra_quotient`: For n=2 K_D=0, hence π_min(D)≃V and π_fs(D)≃π(φ,h).
- `rank_three_extra_copy`: For n=3,K=Q_p the quotient is a single A and its class is a nonzero generator of the one-dimensional K_D.
- `nonzero_kernel_not_split`: If K_D≠0, a split extension would represent the zero map K_D→B and cannot be the inclusion.
- `pushout_quotient_unchanged`: Passing to π_fs changes the subobject from V to π(φ,h), but its quotient remains K_D⊗A.

**Uses.** PH.2/ext-pushforward: The boundary map in the extension’s Hom–Ext sequence is the kernel inclusion. PH.4/recovery: An isomorphism of minimal representations detects equality of kernels. PH.5/annihilator-realisation: The same extension is the maximal-ideal annihilator in the universal extension.

**Source.** Ding [DING25], §3.1.1, p. 33 (tautological extensions); §3.1.2, Remark 3.9 and (3.16), p. 39; §3.2.1, definitions and (3.44), p. 50. The comparison-specific kernel selects two tautological extensions; the generic extension machinery is imported.

Atlas planet: **Minimal kernel extension**.

### PH.2/ext-pushforward — Push-forward to the minimal extension

**Construction.** The natural map f_D:B→Ext¹_G(A,π_min(D)) is surjective and has kernel K_D. Via Hom_G(A,K_D⊗A)≃K_D, the connecting homomorphism is k↦k, so 0→K_D→B→Ext¹_G(A,π_min(D))→0 is exact. Define B_*^min=f_D(B_*) for *=g,w,F_P and for the specified σ subspaces; they are images under this map. The induced quotient comparison t_D^min:Ext¹_G(A,π_min(D))≃ₗQ satisfies t_D^min f_D=t_D.

Hypotheses: H and the notation fixed above.

Prerequisites: `PH.2/minimal-extensions`, `mathlib:LinearMap.quotKerEquivOfSurjective`.

**Proof or construction.**

1. Use the genuine Hom–Ext sequence for 0→V→π_min→K_D⊗A→0 and the scalar End_G(A) identification.
2. Compute the boundary from the defining extension class: it is inclusion of K_D in B.
3. Use the supplier’s Lemma 3.5(2) and the constituent dévissage invoked on p. 50 to establish surjectivity of f_D; exactness alone does not establish it.
4. Factor t_D through f_D and use equality of kernels and surjectivity to obtain the quotient isomorphism.

**Check.** Surjectivity is a substantive supplier input, not a formal consequence of the displayed left exact sequence (3.45). The filtered Ext symbols on π_min are defined as images, especially for parabolic and σ conditions.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `minimalPushforward` | constructor | f_D is functorial push-forward along V↪π_min(D). |
| `minimalPushforward_kernel` | characterisation | ker f_D=K_D, with the boundary map equal to the inclusion. |
| `minimalPushforward_surjective` | structure | f_D is onto by the specified constituent argument. |
| `minimalExtImage` | constructor | For any named input B_* set B_*^min=range(f_D\|B_*). |
| `minimalExtComparison` | equivalence | The unique linear equivalence Ext¹_G(A,π_min(D))≃Q making the triangle commute. |

**Discriminating tests.**

- `rank_one_pushforward`: When K_D=0, f_D is the identity after π_min≃V.
- `kernel_generator_killed`: Each k∈K_D pushes to the split class; a class with t_D(b)≠0 does not.
- `refinement_image_injective`: The restriction f_D|B_w is injective by transversality, even if the full f_D has nonzero kernel.
- `image_convention`: B_F^min is the image of the parabolic input under f_D; it is not defined by postulating a filtration on every extension.

**Uses.** PH.2/ext-refinement-isomorphisms: Transports individual refinement and de Rham comparisons. PH.2/intrinsic-characterisation: Produces the bijective comparison in the characterization. PH.3/parabolic-minimal-extension: The parabolic square after push-forward uses these images.

**Source.** Ding [DING25], §3.2.1, (3.45) and paragraph following it, p. 50; Corollary 3.25(2), p. 51; Lemma 3.5(2), pp. 36–37. Pushing to the tautological kernel extension kills exactly the comparison kernel and nothing else.

Atlas planet: **Minimal-extension Ext comparison**.

### PH.2/ext-refinement-isomorphisms — Refinement comparison after push-forward

**Theorem.** For *=g and *=w for every refinement, t_D^min restricts to B_*^min≃ₗQ_*. The parametrization ζ_w^min=f_Dζ_w:H_T≃ₗB_w^min satisfies t_D^minζ_w^min=a_wκ_w⁻¹ as a map to Q. In particular no individual trianguline direction is lost on π_min.

Hypotheses: H and the notation fixed above.

Prerequisites: `PH.2/ext-pushforward`, `PH.1/refinement-transversality`.

**Proof or construction.**

1. Injectivity of f_D on B_w follows from K_D∩B_w=0.
2. Use the original refinement comparison to identify its image with Q_w and restrict to the smooth-character de Rham subspace for g.

**Check.** The g-space has dimension n, while the unrestricted trianguline image has dimension n(1+d_K). Use quotient deformations throughout.

**Source.** Ding [DING25], §3.2.1, Corollary 3.24, p. 50 and Corollary 3.25(2), p. 51. The two types of deformation subspaces survive intact after quotienting by K_D.

### PH.2/intrinsic-characterisation — Socle and refinement characterization

**Theorem.** Among extensions 0→V→Π→A^{⊕c_nd_K}→0, π_min(D) is the unique representation up to G-isomorphism satisfying (i) soc_GΠ≃A and soc_G(Π/A)≃soc_G(V/A), and (ii) a bijection Ext¹_G(A,Π)≃ₗQ whose restriction to every refinement image, parametrized by the induced ζ_w, is κ_w⁻¹ followed by Q_w↪Q. The second condition includes that the induced refinement parametrizations are isomorphisms onto those images.

Hypotheses: H and the notation fixed above.

Prerequisites: `PH.2/minimal-extensions`, `PH.2/ext-pushforward`, `PH.2/ext-refinement-isomorphisms`.

**Proof or construction.**

1. The tautological extension has no additional simple subobjects or second-socle constituents: nonzero coefficient directions represent nonzero classes, and Lemma 3.5(2) controls lifts through the C(I,s) constituents.
2. For any candidate use (i) to identify the intrinsic first two socle layers with the fixed V and recover its extension coefficient subspace L⊂B.
3. Condition (ii) makes its push-forward comparison agree with t_D on every B_w. The presentation is onto, so the maps agree on B and L=K_D.
4. The class-inclusion description of the kernel extension now identifies the candidate with π_min(D).

**Check.** State both socle conditions and the refinementwise compatibility; equality of dimensions alone is insufficient. The uniqueness is of representations with the stated properties, not of an arbitrarily chosen extension cocycle.

**Source.** Ding [DING25], §3.2.1, Corollary 3.25, p. 51, using Lemma 3.5(2), p. 37. The minimal representation is characterized by its socle layers and the quotient-deformation comparison.

Atlas planet: **Socle and refinement characterization**.

### PH.2/central-character — The determinant-normalized character

**Definition.** With θ_i=1−i, λ_{i,σ}=h_{i,σ}+i−1 and N=n(n−1)/2, define |λ|_σ=Σ_iλ_{i,σ} and χ_D(x)=(∏_σσ(x)^{|λ|_σ})|x|_K^N∏_iφ_i(x). Here |ϖ_K|_K=p^{−[K_0:Q_p]} and geometric reciprocity identifies ε(x)=N_{K/Q_p}(x)|x|_K. The tuple |λ| lies in Z^{Σ_K}; it is not a scalar obtained by summing over embeddings. Then det D≃R_{K,E}(χ_D ε^{−N}).

Hypotheses: H and the notation fixed above.

Prerequisites: `PH.0/comparison-presentation`, `PhiGammaModulesAndIwasawaCohomology:PG.1/rank-one-dictionary`, `PhiGammaModulesAndIwasawaCohomology:PG.7/rank-one-characters`.

**Proof or construction.**

1. Form the coordinate sums in Z^{Σ_K}, then the algebraic character z^{|λ|}.
2. Compute Σ_iλ_{i,σ}−N=Σ_ih_{i,σ} at each σ; the norm powers cancel in χ_Dε^{−N}.
3. Use the rank-one parameter of det D (PhiGammaModulesAndIwasawaCohomology PG.7/rank-one-characters) and the geometric-Frobenius normalization ε=N_{K/Q_p}|·|_K of PG.1/rank-one-dictionary.

**Check.** The central matrix xI_n acts via this character; no extra power of χ_D is taken. Retain the geometric Frobenius and cyclotomic conventions from p. 9.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `weightSum` | constructor | \|λ\|:Σ_K→Z sends σ to Σ_iλ_{i,σ}. |
| `centralCharacter` | constructor | χ_D is the product of the algebraic, norm and smooth factors displayed above. |
| `centralCharacter_apply` | projection | Evaluation at x equals the displayed product, with each embedding separately indexed. |
| `centralCharacter_determinant` | compatibility | χ_Dε^{−N} is the determinant parameter of the imported Robba module. |
| `centralCharacter_refinement_invariant` | functoriality | Permuting the φ_i leaves χ_D unchanged. |

**Discriminating tests.**

- `rank_one_character`: For n=1,N=0 one has χ_D=φ_1z^{h_1}.
- `two_embeddings_distinct`: At n=2 with λ_σ=(2,0), λ_τ=(5,1), the weight tuple is (2,6), not the scalar 8 or the constant tuple (8,8).
- `rank_three_cyclotomic_twist`: At n=3,N=3, multiplication by ε^{−3} cancels |·|_K^3 and lowers each embedding exponent by 3.
- `refinement_swap`: Swapping φ_1,φ_2 does not change their product or χ_D.

**Uses.** PH.2/scalar-characters: Identifies the scalar action of the group center and relates it to determinant deformations.

**Source.** Ding [DING25], §2.1, p. 9; §3.1.2, p. 34 (λ); §3.2.1, paragraph before Proposition 3.26, p. 51. The displayed determinant character is corrected to have an embedding-indexed exponent.

Atlas planet: **Determinant-normalized character**.

### PH.2/scalar-characters — Central and infinitesimal characters

**Theorem.** The action of Z(G)≃K× on π_min(D) is the scalar character χ_D, and the center Z(U(g_{Σ_K})) acts by ξ_λ, the character of L(λ). To prove the infinitesimal assertion, define d_Sen:Q→X_h from the coefficients of the first-order Sen roots h_{i,σ}+εa_{i,σ}, and d_inf:B→X_{ξ_λ} from the first-order central action on an extension of A by V. With Harish–Chandra normalized so that weight μ corresponds to ξ_{μ−θ}, HC induces X_h≃X_{ξ_λ}, and d_inf=HC∘d_Sen∘t_D. Consequently d_inf vanishes on K_D. The group-center tangent map factors through the determinant tangent in the same way.

Hypotheses: H and the notation fixed above.

Prerequisites: `PH.2/central-character`, `PH.2/minimal-extensions`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-7-the-center-of-ul-harish-chandra-freudenthal-and-serres-relations`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-9-reductive-lie-algebras-and-gl_n`.

**Proof or construction.**

1. The imported scalar action on A,V and Hom_G(A,V)=E lets a central element act on an extension by a scalar plus a multiple of the canonical square-zero map; it need not act semisimply on an arbitrary extension.
2. Strictly separated h at every embedding makes the invariant-polynomial map étale there; prove the tangent isomorphism using the nonzero Vandermonde determinant, not the bare fact that the invariant ring is polynomial.
3. Check d_infζ_w=HC d_Sen a_wκ_w⁻¹ on each character parameter by differentiated induction/Jacquet compatibility; (3.38) is onto, so the square commutes globally.
4. For the tautological kernel extension the off-diagonal central operator is the functional obtained by restricting that tangent map to K_D. It vanishes, proving actual scalar actions.

**Check.** Both central actions are scalar on π_min, stronger than a generalized-character assertion. The Harish–Chandra normalization and the shift λ=h−θ must match; algebraic closure of E is not assumed.

**Source.** Ding [DING25], §3.2.1, Proposition 3.26 and (3.46)–(3.47), pp. 51–52. Sen-weight variation matches infinitesimal-character variation through t_D; the kernel extension has zero variation.

Atlas planet: **Central and infinitesimal characters**.

## PH.3 — Parabolic and embedding compatibility

Compare parabolic block kernels and their maximal push-forward subextensions. Construct the σ comparison and maximal partial algebraic minimal representation, split the kernel by embeddings and amalgamate over A. Transport comparison to D_σ without imposing regularity at the modified embeddings.

Layer prerequisites: `PH.2`, `PadicHodgeTheory:P7`.

### PH.3/parabolic-comparison — Compatibility with parabolic induction

**Theorem.** For a standard P with Levi ∏_iGL_{n_i}, a saturated P-filtration F_P of D, and M_i=gr_iF_P, t_D restricts to a surjection t_{D,F}:B_F→Q_F. The square (∏_iB(M_i) →^{∏t_{M_i}} ∏_iQ(M_i); B_F →^{t_{D,F}} Q_F) commutes, with left vertical ζ_F an isomorphism and right vertical κ_F⁻¹ an isomorphism. Thus ζ_F induces ⊕_iker(t_{M_i})≃ker(t_D)∩B_F. The arrows retain the ε⁻¹∘θ_P twist in their construction.

Hypotheses: H and the notation fixed above.

Prerequisites: `PH.1/comparison-map`.

**Proof or construction.**

1. Use the imported compatible-refinement spanning of B_F and Q_F.
2. Check the square on each compatible triangulation using (2.20) and (3.28), then extend linearly.
3. Apply the two block identifications to identify kernels as embedded subspaces, not merely equal dimensions.

**Check.** At P=G this is t_D itself; at P=B it gives the zero kernel of a refinement. For block ranks 1 and 2 all block kernels vanish.

**Source.** Ding [DING25], §3.2.1, Proposition 3.27, (3.48)–(3.49), pp. 52–53; inputs Corollary 2.14, pp. 19–20 and Proposition 3.12, pp. 42–43. The comparison commutes with the actual block-deformation and parabolic-induction maps.

Atlas planet: **Parabolic comparison**.

### PH.3/parabolic-minimal-extension — The parabolic minimal subrepresentation

**Construction.** Set K_{D,F}=ker t_D∩B_F, and define π_min,F(D)⊂π_min(D) by the tautological extension of K_{D,F}⊗A by V. It is maximal among subextensions obtained by push-forward from π_F(φ,h)↪V. There is an injection I_{P⁻}^G((⊠̂_iπ_min(M_i))⊗(ε⁻¹∘θ_P))↪π_min,F(D). Its quotient multiplicity is d_KΣ_ic_{n_i}. The block Ext square remains commutative and all four comparison/vertical arrows become isomorphisms after push-forward to the corresponding minimal representations, using the image definition of the F-filtered Ext space.

Hypotheses: H and the notation fixed above.

Prerequisites: `PH.3/parabolic-comparison`, `PH.2/minimal-extensions`, `PH.2/ext-pushforward`.

**Proof or construction.**

1. Restrict the universal class-inclusion extension along K_{D,F}⊂K_D.
2. A subextension comes from π_F exactly when its class image lies in B_F; the largest such subspace is K_D∩B_F.
3. Apply the imported Emerton parabolic induction to the block kernel extensions, with the completed tensor product and fixed twists, and compare extension classes through ζ_F.
4. Use the block kernel equality to identify the quotient and the push-forward Ext images.

**Check.** Use Emerton’s functor I, distinct from the full locally analytic induction. Maximality is among push-forward subextensions, not among arbitrary subrepresentations.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `parabolicMinimalExtension` | constructor | Take the kernel-subspace extension for K_D∩B_F. |
| `parabolicMinimalExtension_inclusion` | structure | Its injection into π_min restricts to id_V and has quotient inclusion (K_D∩B_F)⊗A→K_D⊗A. |
| `parabolicMinimalExtension_maximal` | universal-property | Every subextension pushed from π_F factors through this one. |
| `parabolicMinimalExtension_induction` | compatibility | The displayed normalized Emerton induction of block π_min injects. |
| `parabolicMinimalExtComparison` | equivalence | After the named push-forwards the block square consists of linear isomorphisms. |

**Discriminating tests.**

- `borel_minimal`: For P=B all n_i=1, hence π_min,F=V.
- `whole_group_minimal`: For P=G the construction returns π_min(D).
- `rank_three_proper_parabolic`: For n=3 a proper maximal Levi has ranks (2,1) or (1,2), so π_min,F=V although dim K_D=d_K.
- `rank_four_three_plus_one`: For ranks (3,1) the quotient has multiplicity d_K, whereas the full rank-four quotient has multiplicity 5d_K.

**Uses.** PH.3/modified-ext-comparison: Supplies the blockwise σ-minimal square. PH.4/recovery-relation: The two rank n−1 subextensions π⁻ and π⁺ form the recovery relation.

**Source.** Ding [DING25], §3.2.1, Remark 3.28 and its diagram, p. 53. The parabolic intersection kernel defines a maximal subextension and receives induced block minimal representations.

Atlas planet: **Parabolic minimal extension**.

### PH.3/sigma-comparison — Comparison for one embedding

**Construction.** For σ∈Σ_K let B_σ be the imported image of Ext¹_σ(A,π_{1,σ}) in B, with σ meaning algebraic along every τ≠σ, and Q_σ the imported quotient space of deformations de Rham at all τ≠σ. Define t_{D,σ}=t_D|B_σ:B_σ↠Q_σ. It satisfies the σ-refinement equations and, for every F_P, the σ-block square of Corollary 3.29(2), so ⊕_iker t_{M_i,σ}≃ker t_{D,σ}∩B_{σ,F}. Moreover dim Q_σ=n+n(n+1)/2, dim B_σ=n+2^n−1 and dim ker t_{D,σ}=c_n.

Hypotheses: H and the notation fixed above.

Prerequisites: `PH.1/comparison-map`, `PH.3/parabolic-comparison`, `PH.1/kernel-dimension`.

**Proof or construction.**

1. Import σ-refinement spanning and compatible character-parameter identifications on both sides.
2. On each σ-character generator the full comparison equation has image in Q_σ. Representation-side spanning proves t_D(B_σ)⊂Q_σ; deformation-side spanning (Corollary 2.40) proves surjectivity of that restriction.
3. Restrict the parabolic square using the imported σ-block identifications, then use the supplied dimensions.

**Check.** The σ condition means de Rham/algebraic away from σ, not at σ. B_σ is an image, because V itself need not be algebraic away from σ.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `sigmaComparison` | constructor | Restrict t_D with codomain Q_σ, justified on all σ-refinement generators. |
| `sigmaComparison_refinement` | compatibility | t_{D,σ}ζ_w(ψ)=a_wκ_w⁻¹ψ for ψ∈Hom_σ(T(K),E). |
| `sigmaComparison_kernel` | characterisation | ker t_{D,σ}=K_D∩B_σ. |
| `sigmaComparison_dimension` | structure | Its kernel has dimension c_n, independent of d_K. |
| `sigmaComparison_parabolic` | compatibility | The block square commutes for B_{σ,F}, with direct-sum block kernels. |

**Discriminating tests.**

- `single_embedding`: For K=Q_p, B_σ=B and Q_σ=Q, so t_{D,σ}=t_D.
- `two_embedding_kernel`: For n=3,d_K=2, each σ-kernel has dimension one, against full kernel dimension two.
- `borel_sigma_kernel`: For P=B the σ-parabolic kernel is zero.
- `algebraic_away_from_sigma`: A deformation varying Sen weights only at σ can lie in Q_σ; a variation at a different τ cannot.

**Uses.** PH.3/sigma-minimal-extension: Selects the σ kernel extension. PH.3/modified-comparison: Composes with the imported embedding modification.

**Source.** Ding [DING25], §3.2.1, (3.50), Corollary 3.29 and Remark 3.30(1), pp. 53–54; σ input conventions, pp. 20 and 44–46. The restriction compares the two partially analytic/de Rham theories and keeps their block maps.

Atlas planet: **Single-embedding comparison**.

### PH.3/sigma-minimal-extension — The minimal representation for one embedding

**Construction.** Via Ext¹_σ(A,π_{1,σ})≃B_σ identify K_{D,σ}=ker t_{D,σ} as an embedded extension subspace. Define π_min(D)_σ by 0→π_{1,σ}→π_min(D)_σ→K_{D,σ}⊗A→0 with class inclusion. Its natural map to π_min(D) is injective, and its image is precisely the maximal g_{Σ_K∖{σ}}-algebraic subrepresentation. The quotient multiplicity is c_n.

Hypotheses: H and the notation fixed above.

Prerequisites: `PH.3/sigma-comparison`, `PH.2/minimal-extensions`.

**Proof or construction.**

1. Use the imported injective Ext push-forward for π_{1,σ}↪V, then the tautological extension of the inverse-image kernel.
2. Compare classes to obtain the natural injection, and use the imported maximal algebraic-away-from-σ criterion for the constituent structure to identify the image.

**Check.** The subobject is π_{1,σ}, not V. For n≤2 the result is π_{1,σ}, with zero extra quotient.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `sigmaMinimalExtension` | constructor | Construct the extension inside the imported algebraic-away-from-σ category. |
| `sigmaMinimalExtension_class` | characterisation | Its class is K_{D,σ}↪Ext¹_σ(A,π_{1,σ}). |
| `sigmaMinimalExtension_inclusion` | structure | The injection into π_min transports the class through π_{1,σ}↪V and K_{D,σ}↪K_D. |
| `sigmaMinimalExtension_maximal` | universal-property | Every g_{Σ_K∖{σ}}-algebraic subrepresentation of π_min lies in its image. |
| `sigmaMinimalExtension_quotient` | projection | The quotient by π_{1,σ} is K_{D,σ}⊗A, of multiplicity c_n. |

**Discriminating tests.**

- `single_embedding_minimal`: For K=Q_p the σ-minimal representation is all of π_min.
- `rank_two_sigma_minimal`: For n=2 it equals π_{1,σ}, not the whole V unless there is only one embedding.
- `rank_three_sigma_quotient`: For every σ at n=3 the quotient is one A.
- `wrong_subobject_rejected`: At d_K>1 replacing π_{1,σ} by V imports constituents nonalgebraic at τ≠σ and violates maximal partial algebraicity.

**Uses.** PH.3/sigma-kernel-splitting: These are the summands amalgamated over the shared socle A. PH.4/recovery: They isolate the parameter recoverable at a fixed embedding.

**Source.** Ding [DING25], §3.2.1, Remark 3.30(2), p. 54, using §3.1.4, pp. 44–46. The σ kernel extension is an intrinsic partially algebraic subrepresentation of the full minimal object.

Atlas planet: **Single-embedding minimal extension**.

### PH.3/sigma-kernel-splitting — Decomposition over the embeddings

**Theorem.** The inclusions induce an isomorphism ⊕_{σ∈Σ_K}K_{D,σ}≃K_D. Consequently π_min(D)≃⊕^{σ∈Σ_K}_Aπ_min(D)_σ, the amalgamated sum over their common socle A. This is not the ordinary direct sum of representations.

Hypotheses: H and the notation fixed above.

Prerequisites: `PH.3/sigma-minimal-extension`, `PH.1/refinement-transversality`.

**Proof or construction.**

1. Since K_D∩B_g=0, its projection into B/B_g is injective; the same holds for each σ-kernel.
2. Use the imported isomorphism ⊕_σ(B_σ/B_g)≃B/B_g of Proposition 3.18(3) to prove injectivity of the sum of kernels.
3. Both sides have dimension c_nd_K, giving surjectivity.
4. The constituent amalgamation V≃⊕_Aπ_{1,σ} and the class-inclusion description identify the pushout extension with π_min.

**Check.** The shared B_g is quotiented before claiming a direct sum of extension spaces. The quotient multiplicities add, while the socle A is counted only once.

**Source.** Ding [DING25], §3.2.1, Corollary 3.31, p. 54, with Proposition 3.18(3), p. 46. The Hodge kernel splits by embeddings, and its extensions glue by amalgamation.

Atlas planet: **Embedding decomposition**.

### PH.3/modified-comparison — Comparison with the modified Hodge object

**Construction.** Import D_σ=𝔗_σ(D): its σ-Hodge filtration is retained, while every τ≠σ weight becomes h_{n,τ}; it has the same localized Robba module and D↪D_σ. The imported deformation isomorphism 𝔗_σ:Q_σ(D)≃Q_σ(D_σ) defines t_{D_σ}=𝔗_σt_{D,σ}. It has the same embedded kernel K_{D,σ} and depends only on the isomorphism class of D_σ. The block comparison also transports, giving ⊕_iker t_{M_{i,σ}}≃ker t_{D_σ}∩B_{σ,F}, with M_{i,σ}=𝔗_σ(M_i) in the source’s induced weight conventions.

Hypotheses: H and the notation fixed above.

Prerequisites: `PH.3/sigma-comparison`, `PadicHodgeTheory:P7/embedding-selective-crystalline-modification`.

**Proof or construction.**

1. Use the modified object D_σ of PadicHodgeTheory P7/embedding-selective-crystalline-modification (Proposition 2.5(1)) and the deformation-level modification with Corollary 2.27 (contract TR4); this roadmap gives no new definition of 𝔗_σ.
2. Compose with its quotient-deformation isomorphism, so the kernel is unchanged.
3. Check the σ-refinement presentation in Corollary 3.32(1); it is determined by D_σ and the fixed (φ,h) representation side, and its surjection makes the kernel intrinsic.
4. Transport the σ-parabolic square, using the supplier’s compatible modifications of each graded block.

**Check.** D_σ generally lacks regular weights away from σ; never reapply a theorem requiring globally regular weights directly to D_σ. Its input comparison is transported from D, rather than falsely calling t_D with h unchanged.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `modifiedComparison` | constructor | Compose t_{D,σ} with the genuine isomorphism Q_σ(D)→Q_σ(D_σ). |
| `modifiedComparison_kernel` | characterisation | ker t_{D_σ}=ker t_{D,σ} as subspaces of the fixed B_σ. |
| `modifiedComparison_isomorphism_invariant` | functoriality | An isomorphism D_σ≃D′_σ identifies the σ-refinement diagrams and hence the kernels. |
| `modifiedComparison_parabolic` | compatibility | The transported block square and (3.51) identify embedded parabolic kernels. |

**Discriminating tests.**

- `identity_modification`: For K=Q_p, 𝔗_σ(D)=D and the comparison is unchanged.
- `equal_sigma_objects`: If D_σ≃D′_σ, the two kernels are equal in B_σ, not merely isomorphic vector spaces.
- `forget_other_filtrations`: Varying a τ-Hodge flag with τ≠σ while retaining D_σ leaves this kernel unchanged.
- `nonregular_modified_weights`: For d_K>1,n>1, the repeated weights h_{n,τ} at τ≠σ exclude treating D_σ as a globally regular input.

**Uses.** PH.3/modified-ext-comparison: Identifies the minimal representation Ext target with Q_σ(D_σ). PH.4/recovery: Proves the easy direction from equality of modified objects to equality of minimal representations.

**Source.** Ding [DING25], §2.2, Proposition 2.5 and (2.7), p. 13; §3.2.1, Corollary 3.32 and (3.51), p. 55. The comparison uses the already-owned modification functor and preserves its kernel.

Atlas planet: **Modified Hodge comparison**.

### PH.3/modified-ext-comparison — Minimal Ext isomorphisms for a modified object

**Theorem.** There are canonical isomorphisms Ext¹_σ(A,π_min(D)_σ)≃Q_σ(D)≃Q_σ(D_σ). For every F_P they fit the block square (3.52), whose lower left is the image Ext¹_{σ,F}(A,π_min,F(D)_σ) of the specified parabolic σ space. Every vertical block identification and every horizontal comparison in that diagram is an isomorphism.

Hypotheses: H and the notation fixed above.

Prerequisites: `PH.3/modified-comparison`, `PH.3/sigma-minimal-extension`, `PH.3/parabolic-minimal-extension`, `PH.2/ext-pushforward`.

**Proof or construction.**

1. Repeat the tautological-kernel Hom–Ext argument inside the imported partially algebraic extension category, with the same supplier surjectivity input.
2. Transport the codomain by 𝔗_σ and apply the σ-parabolic square; define the bottom-left filtered space as an image.

**Check.** Retain the maximal partial algebraic subrepresentation in the lower left. The block isomorphisms have the same normalization used in the recovery relation.

**Source.** Ding [DING25], §3.2.1, Corollary 3.33 and diagram (3.52), p. 55. The minimal extension realizes the modified quotient deformation space and its block decompositions.

## PH.4 — Recovery of modified Hodge parameters

Extract from the two parabolic minimal subextensions the embedded higher-intertwining relation in its fixed block ambient space. Prove π_min(D)_σ≃π_min(D′)_σ exactly when D_σ≃D′_σ, and deduce the full family and K=Q_p consequences.

Layer prerequisites: `PH.3`, `PhiGammaModulesAndIwasawaCohomology:PG.2`.

### PH.4/recovery-relation — The embedded relation detected by the representation

**Construction.** Fix σ and n≥3. Let F=(D_1⊂D) and G=(R(φ_n z^{h_1})⊂D), with C_1=D/R(φ_n z^{h_1}). Inside Π=π_min(D)_σ let π⁻ and π⁺ be the two subextensions obtained from K_{D_σ,F} and K_{D_σ,G}, both with subobject π_{1,σ}. Define L_Π=ker[Ext¹_σ(A,π⁻)⊕Ext¹_σ(A,π⁺)→Ext¹_σ(A,Π)], where the arrow is the sum of push-forwards. The block isomorphisms identify its ambient space with V(D_{1,σ},C_{1,σ})_σ=(Q_σ(D_{1,σ})×Hom_σ(K×,E))⊕(Q_σ(C_{1,σ})×Hom_σ(K×,E)), and identify its image with the imported embedded relation L(D_σ,D_{1,σ},C_{1,σ}) in that same ambient space. This ambient identification depends only on the fixed block objects and conventions.

Hypotheses: H and the notation fixed above.

Prerequisites: `PH.3/modified-ext-comparison`, `PH.3/parabolic-minimal-extension`, `mathlib:LinearMap.ker`.

**Proof or construction.**

1. Construct π⁻,π⁺ as the tautological subextensions selected by the two intersections.
2. Use the σ-minimal Ext isomorphisms for their block comparisons to form the middle vertical isomorphism in (3.54).
3. Use the imported exact relation sequence (2.42) and the compatible comparison on Π to identify the kernel as an embedded subspace.
4. When D_σ is replaced by D′_σ with the same block data and same π⁻,π⁺, the middle isomorphism is unchanged, giving equality of relation subspaces.

**Check.** An abstract isomorphism between the two L-spaces carries no recovery information; their equality inside the specified V is required. Use the signs implicit in the sum of push-forwards and the supplier’s relation convention: the first arrow into a two-term presentation is anti-diagonal.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `minimalRecoveryRelation` | constructor | The kernel of the specified sum of σ push-forward maps. |
| `minimalRecoveryRelation_membership` | characterisation | A pair lies in L_Π iff the sum of its two pushed-forward extension classes is zero. |
| `minimalRecoveryRelation_ambient` | equivalence | The two block comparisons identify its ambient space with the fixed V(D_{1,σ},C_{1,σ})_σ. |
| `minimalRecoveryRelation_galois` | compatibility | Under this ambient isomorphism its image equals the supplier’s L(D_σ,D_{1,σ},C_{1,σ}). |
| `minimalRecoveryRelation_invariance` | functoriality | Replacing Π by an isomorphic minimal object with the same block identifications preserves the embedded relation. |

**Discriminating tests.**

- `opposite_refinement_pair`: For a class appearing in both subextensions, the pair of its two lifts with opposite signs maps to zero.
- `embedded_not_abstract`: Distinct one-dimensional subspaces of the same ambient V are abstractly isomorphic but must not be identified by this construction.
- `rank_three_block_base`: At n=3 both blocks have rank two and their kernel extensions are trivial; the relation of their Ext maps still detects the rank-three parameter.
- `isomorphic_input_transport`: An isomorphism preserving the block comparison maps transports the kernel to the same ambient relation, not an unspecified conjugate subspace.

**Uses.** PH.4/recovery: Turns equality of minimal kernels into equality of the Galois relation, the induction step of recovery.

**Source.** Ding [DING25], §3.2.1, proof of Theorem 3.34, (3.53)–(3.54), p. 56; §2.4, (2.42) and Corollary 2.38, p. 32. The representation remembers the same embedded higher-intertwining relation that classifies the modified Hodge object.

Atlas planet: **Embedded recovery relation**.

### PH.4/recovery — Recovery of the modified Hodge parameters

**Theorem.** For D,D′∈ΦΓ_nc(φ,h) and σ∈Σ_K, π_min(D)_σ≃_Gπ_min(D′)_σ iff D_σ≃D′_σ. Consequently π_min(D)≃_Gπ_min(D′) iff D_σ≃D′_σ for every σ. If K=Q_p this recovers D itself, and for an étale D=D_rig(ρ) it recovers ρ via the separately imported fully faithful correspondence. No claim of full recovery of D from the family of abstract D_σ-isomorphism classes for general K is made.

Hypotheses: H and the notation fixed above.

Prerequisites: `PH.4/recovery-relation`, `PH.3/modified-comparison`, `PH.3/sigma-kernel-splitting`, `PH.2/minimal-extensions`, `PhiGammaModulesAndIwasawaCohomology:PG.2/etale-tilde-equivalence`.

**Proof or construction.**

1. If D_σ≃D′_σ, the modified refinement presentation gives equal kernels, hence isomorphic σ kernel extensions.
2. For the converse induct on n. At n≤2 the kernels vanish and the imported modified Hodge objects with fixed parameters are all isomorphic.
3. For n≥3, an isomorphism of σ minimal representations identifies the embedded kernels using the intrinsic socle and scalar-endomorphism property. Intersect with the two parabolic images and apply the block kernel formula; induction identifies D_{1,σ},C_{1,σ} for the two inputs.
4. The invariant ambient map of the recovery-relation construction now gives equality of the two Galois relation subspaces. Import Corollary 2.38(1) to identify D_σ and D′_σ.
5. Extract maximal partial algebraic subrepresentations and apply the amalgamation theorem to pass between the fixed-σ and full statements.
6. For K=Q_p, 𝔗_σ is the identity; for étale D=D_rig(ρ) pass from D to ρ through the étale equivalence of PhiGammaModulesAndIwasawaCohomology PG.2/etale-tilde-equivalence, applied with E-coefficients.

**Check.** State both directions with their actual logical direction, correcting the reversed labels in the printed proof. Use equality of embedded relation subspaces, not a dimension count or an abstract linear equivalence. Specialize to K=Q_p only after using 𝔗_σ=id there.

**Source.** Ding [DING25], §3.2.1, Theorem 3.34 and proof, p. 56; §2.4, Corollary 2.38(1), p. 32. The kernel representation detects exactly the modified objects; a single embedding gives complete local recovery.

Atlas planet: **Recovery of Hodge parameters**.

## PH.5 — Universal extensions and first-order Artinian actions

Form A_D and A_{D,w} as first-order algebra fiber products, equip the universal refinement extensions with their parameter-ring actions, and construct the unique A_D-action on the full universal extension. Identify its maximal-ideal annihilator with π_min(D).

Layer prerequisites: `PH.1`, `PH.2`, `LocallyAnalyticDistributionsPartII:ND.2`, `LocalGaloisDeformationRings:R08.1`, `SmoothRepresentationsOfLocalGroups:SR.3`.

### PH.5/first-order-algebras — The comparison Artinian algebras

**Construction.** Import the actual universal deformation rings R_D,R_{D,w},R_{D,g} for all (possibly nonétale) Robba modules, their natural surjections, and the character rings R_{δ},R_{δ,g}. For δ=w(φ)z^h the square with top R_δ/m²→R_{δ,g}/m² and bottom R_{D,w}/m²→R_{D,g}/m² is Cartesian, with vertical parameter maps. Let A_0=Ĥ_φ/m² be the completed smooth Bernstein-center algebra. The embedding A_0↪R_{D,g}/m² is independent of w. Define A_D=(R_D/m²)×_{R_{D,g}/m²}A_0 and A_{D,w}=(R_{D,w}/m²)×_{R_{D,g}/m²}A_0. Then A_{D,w}≃R_{w(φ)z^h}/m², their tangent spaces are Q and Q_w respectively, and I_w=ker(A_D↠A_{D,w}). The map A_D→∏_wA_{D,w} is injective. All are augmented local Artinian E-algebras with square-zero maximal ideal. A_D embeds in R_D/m²; it is not in general a quotient of that algebra.

Hypotheses: H and the notation fixed above.

Prerequisites: `PH.0/comparison-presentation`, `mathlib:TrivSqZeroExt`, `mathlib:Module.Dual`, `LocalGaloisDeformationRings:R08.1/phi-gamma-module-deformation-rings`, `SmoothRepresentationsOfLocalGroups:SR.3/part-ii-principal-series-completion`, `SmoothRepresentationsOfLocalGroups:SR.3/part-ii-ordered-character-map`, `SmoothRepresentationsOfLocalGroups:SR.3/part-ii-principal-series-tangent`.

**Proof or construction.**

1. Import R_D,R_{D,w},R_{D,g},R_δ,R_{δ,g}, their formal smoothness, tangent identifications and the Cartesian square (3.55) from LocalGaloisDeformationRings R08.1/phi-gamma-module-deformation-rings, which treats possibly nonétale Robba modules; do not substitute unrestricted Galois deformation rings.
2. Take Ĥ_φ, the maps 𝒥_w and Ĥ_φ≃R_{w(φ),g} from SmoothRepresentationsOfLocalGroups SR.3 (part-ii-principal-series-completion, part-ii-ordered-character-map), and twist by z^{−h}. The composite A_0→R_{D,g}/m² is independent of w by the reordering compatibility of SR.3/part-ii-principal-series-tangent together with Lemma 2.11 (contract TR2).
3. Form the actual algebra fiber products with their structure maps. Their tangent spaces are Ext¹(D,D)/Ext¹_0 and the analogous trianguline quotient, by the supplier’s smooth parameter and Ext¹_0 identifications.
4. Use the canonical residue E-section and square-zero maximal ideal: cotangent is Q∨ and the algebra is E⊕Q∨ with square-zero multiplication, consuming TrivSqZeroExt.
5. Dualizing the spanning map ⊕_wQ_w↠Q shows A_D→∏A_{D,w} injective.

**Check.** Keep tangent Q=Hom_E(m_A,E) and cotangent m_A=Q∨ distinct. The initial rings are complete local rings; only their first neighborhoods and the fiber products here are Artinian. At n=3,d_K=1, dim_E A_D=10 while dim_E(R_D/m²)=11, exhibiting the missing Ext¹_0 direction.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `comparisonArtinAlgebra` | constructor | A_D is the displayed E-algebra fiber product with the named augmentation. |
| `refinementArtinAlgebra` | constructor | A_{D,w} is the corresponding trianguline fiber product. |
| `comparisonArtinAlgebra_pullback` | universal-property | A map S→A_D is a pair of E-algebra maps S→R_D/m² and S→A_0 whose composites to R_{D,g}/m² agree. |
| `comparisonArtinAlgebra_tangent` | equivalence | Hom_E(m_{A_D},E)≃Q and m_{A_D}≃Q∨; similarly for w. |
| `refinementArtinIdeal` | constructor | I_w is the actual kernel of the natural surjection A_D→A_{D,w}. |
| `comparisonArtinAlgebra_joint_injective` | characterisation | An element mapping to zero in every A_{D,w} is zero. |
| `refinementArtinAlgebra_character` | compatibility | A_{D,w}≃R_{w(φ)z^h}/m², respecting the residue E and cotangent identifications. |

**Discriminating tests.**

- `square_zero_neighborhood`: For x,y in the maximal ideal of A_D, xy=0; the residue scalars still multiply as in E.
- `rank_one_character_ring`: At n=1 the sole refinement quotient is A_D itself and I_w=0.
- `rank_three_dimension`: For n=3,d_K=1 the tangent dimensions are dim Q=9 and dim Q_w=6, so dim_E A_D=10, dim_E A_{D,w}=7 and dim_E I_w=3.
- `tangent_variance`: A_D↠A_{D,w} induces the injection Q_w↪Q on tangents, reversing the ring arrow.
- `zero_common_ideal`: The intersection ⋂_wI_w is zero, although an individual I_w can be nonzero.

**Uses.** PH.5/universal-artinian-action: Supplies the algebra acting on the universal extension and its refinement quotients. PH.5/annihilator-realisation: The maximal ideal cuts out the minimal representation.

**Source.** Ding [DING25], §3.2.2, deformation rings and (3.55), pp. 56–57, especially the A_0,A_D,A_{D,w},I_w paragraph on p. 57. The first-order fiber products remove the invisible de Rham directions and retain all trianguline quotients.

Atlas planet: **Comparison Artinian algebras**.

### PH.5/universal-extensions — Universal extensions for the comparison

**Construction.** Let U=π_1(φ,h)^univ be the tautological extension 0→V→U→B⊗A→0 corresponding to id_B. For each w let U_w⊂U be its inverse image over B_w⊗A; it is the tautological extension with class B_w↪B. Set δ_w=w(φ)z^h(ε⁻¹∘θ), and let δ̃_w^univ be the character self-extension 0→δ_w→δ̃_w^univ→H_T⊗δ_w→0 corresponding to id_{H_T}. Under A_{D,w}≃R_{w(φ)z^h}/m², x∈m_{A_{D,w}}≃H_T∨ acts on the torus extension by quotient, contraction by x, then inclusion of δ_w. On U_w use the same formula via ζ_w:H_T≃B_w and A↪V↪U_w. Scalars act by the given E-structure.

Hypotheses: H and the notation fixed above.

Prerequisites: `PH.2/minimal-extensions`, `PH.5/first-order-algebras`, `LocallyAnalyticDistributionsPartII:ND.2/coadmissible-theorems`.

**Proof or construction.**

1. Use the supplier’s general tautological-extension construction with the whole B and with B_w.
2. The inclusion B_w⊂B gives U_w as an actual subextension. Since Σ_wB_w=B, these subrepresentations generate U.
3. Define the torus radical operator from H_T∨ evaluation; its square and all pairwise radical products vanish because the quotient kills the included δ_w.
4. The same quotient–contraction–inclusion construction on U_w gives an algebra action, with cotangent transported contragrediently through ζ_w.

**Check.** The quotient is B⊗A, not B∨⊗A. The radical is dual to the tangent, so its evaluation is correctly oriented. The torus character δ_w has the ε⁻¹∘θ twist, though the parameter-ring isomorphism uses its inverse fixed twist.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `comparisonUniversalExtension` | constructor | U is the actual extension with class id_B in Hom_E(B,B). |
| `refinementUniversalExtension` | constructor | U_w is the inverse-image subextension over B_w⊗A. |
| `comparisonUniversalExtension_class` | characterisation | Pulling back along b:A→B⊗A represents the class b∈B. |
| `torusUniversalExtension` | constructor | The self-extension of δ_w uses id_{H_T}, with its displayed exact sequence. |
| `refinementRadicalAction` | compatibility | For x∈m_{A_{D,w}} the endomorphism is i_A∘(x∘ζ_w⁻¹⊗id_A)∘p_w. |
| `universalExtension_generated` | structure | The smallest G-subrepresentation containing every U_w is U. |

**Discriminating tests.**

- `zero_parameter_pullback`: Pulling U back along the zero coefficient A→B⊗A yields the split extension.
- `specified_parameter_pullback`: Pulling back along a nonzero b gives exactly b, rejecting the constant or dual-basis-inverted extension.
- `radical_composition_zero`: For all radical x,y on U_w, x∘y=0 since p_w i_A=0.
- `nonzero_evaluation`: If x(ζ_w⁻¹b)≠0 and a≠0, applying x to any lift of b⊗a yields that nonzero scalar times the included a.

**Uses.** PH.5/induction-universal-extension: Compares the torus extension and U_w via Emerton induction. PH.5/universal-artinian-action: The U_w actions determine the unique action on the generated U.

**Source.** Ding [DING25], §3.2.2, universal extension definitions, p. 57; natural actions and (3.57), p. 58; general tautological extensions, p. 33. The universal extensions and their refinement radical actions provide the carriers for the Artinian comparison.

Atlas planet: **Universal comparison extensions**.

### PH.5/induction-universal-extension — Induction of the universal character extension

**Theorem.** Emerton induction I_{B⁻}^G(δ̃_w^univ) is the universal extension of A⊗Ext¹_G(A,PS_1(w(φ),h)) by PS_1(w(φ),h). Pushing out along PS_1(w(φ),h)↪V gives I_{B⁻}^G(δ̃_w^univ)⊕_{PS_1}V≃U_w. The induced injection I_{B⁻}^G(δ̃_w^univ)↪U_w is A_{D,w}-equivariant for the radical actions just defined.

Hypotheses: H and the notation fixed above.

Prerequisites: `PH.5/universal-extensions`.

**Proof or construction.**

1. Use the imported character-to-Ext isomorphism (3.10) and Remark 3.7 to see the induced extension has quotient A^{⊕n(1+d_K)} and a subobject contained in PS_1.
2. Because every class in Ext¹(A,PS_1) comes from it, constituent dévissage and the surjectivity in (3.14) force that subobject to be all PS_1.
3. Identify the tautological classes under ζ_w, then push out and compare the explicit radical evaluation maps.

**Check.** Universality forces the full PS_1 subobject; a generic adjunction assertion alone does not. Keep I_{B⁻}^G distinct from full locally analytic principal-series induction.

**Source.** Ding [DING25], §3.2.2, Lemma 3.35, (3.56)–(3.57), p. 58; Proposition 3.6(1) and Remark 3.7, p. 38. The universal character extension induces the universal refinement extension, with its action preserved.

Atlas planet: **Universal character induction**.

### PH.5/universal-artinian-action — Ding’s universal Artinian action

**Construction.** There is a unique E-algebra action of the augmented algebra A_D on U commuting with G such that every natural U_w↪U[I_w] is A_{D,w}×G-equivariant. Here U[I]={u | xu=0 for all x∈I}. Explicitly, for x∈m_{A_D}≃Q∨ the action is U→^{p}B⊗A→^{t_D⊗id}Q⊗A→^{x⊗id}A↪U. This ends in U; the w-dependent final codomain printed in (3.58) is not the definition of an endomorphism of U.

Hypotheses: H and the notation fixed above.

Prerequisites: `PH.5/first-order-algebras`, `PH.5/universal-extensions`, `PH.5/induction-universal-extension`, `PH.1/comparison-map`.

**Proof or construction.**

1. The displayed radical operators commute with G, kill V and have image in A⊂V, so their products are zero. Together with scalar E this defines an action of the actual first-order algebra A_D.
2. The refinement equation for t_D identifies their restriction to U_w with the prescribed quotient action; elements of I_w therefore annihilate U_w.
3. All U_w generate U, so any two actions with the asserted restrictions coincide. No equality U_w=U[I_w] is required or claimed.

**Check.** Use the canonical inclusions U_w; existence of unrelated equivariant injections would not determine an action. State uniqueness among E-algebra actions with the given scalar E-structure.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `universalArtinianAction` | constructor | The E-algebra homomorphism A_D→End_G(U) has the stated radical formula. |
| `universalArtinianAction_radical` | projection | For x∈Q∨, x·u=i_A((x⊗id_A)((t_D⊗id_A)(p(u)))). |
| `universalArtinianAction_refinement` | compatibility | U_w maps into U[I_w] and the induced action is the fixed A_{D,w} action. |
| `universalArtinianAction_unique` | extensionality | Agreement on the prescribed U_w actions implies equality on U. |
| `universalArtinianAction_base` | simp | Every radical element kills V, and each a∈E acts as its original scalar. |

**Discriminating tests.**

- `radical_kills_base`: Every x∈m_{A_D} kills the full V inside U, not only its socle A.
- `refinement_ideal_kills`: For x∈I_w and u∈U_w the action is zero because the tangent character factors through Q_w.
- `visible_parameter_action`: If t_D(b)≠0 and a≠0, some x∈Q∨ acts nontrivially on any lift of b⊗a.
- `kernel_parameter_action`: For b∈K_D all radical elements kill every lift of b⊗a.
- `two_radical_factors`: For x,y∈m_{A_D}, x(yu)=0 for every u, matching m_{A_D}²=0.

**Uses.** PH.5/annihilator-realisation: Computes the maximal-ideal annihilator as the kernel extension. LocalGlobalCompatibilityPartIIEigenvarietyCompanions (consumer brief): Supplies the local algebra action to be compared with global tangent actions; no global theorem is planned here.

**Source.** Ding [DING25], §3.2.2, Theorem 3.36 and (3.58), pp. 58–59. The comparison map glues the first-order refinement actions into a unique global action.

Atlas planet: **Universal Artinian action**.

### PH.5/annihilator-realisation — The minimal representation as an annihilator

**Theorem.** For the action just constructed, U[m_{A_D}]=p⁻¹(K_D⊗A), and this subrepresentation is canonically the kernel extension π_min(D). Thus π_min(D)≃U[m_{A_D}]. The equality concerns the maximal-ideal annihilator, not a quotient U/m_{A_D}U or an entire refinement annihilator.

Hypotheses: H and the notation fixed above.

Prerequisites: `PH.5/universal-artinian-action`, `PH.2/minimal-extensions`.

**Proof or construction.**

1. By the radical formula a vector u is annihilated iff every x∈Q∨ contracts (t_D⊗id_A)p(u) to zero.
2. Finite-dimensional dual separation in Q and exactness of tensoring over E identify this joint kernel with K_D⊗A.
3. The preimage under p has tautological extension class the inclusion K_D↪B, so it is π_min(D).

**Check.** At n≤2 the annihilator is exactly V, since K_D=0. At n=3,K=Q_p its quotient by V is one A, although U/V has multiplicity dim B=10.

**Source.** Ding [DING25], §3.2.2, Corollary 3.37, p. 59, with the action (3.58), p. 58. The radical kills exactly the comparison-kernel coefficients, recovering the minimal extension.

Atlas planet: **Minimal representation as an annihilator**.

## Worked checks across layers

| Rank n | c_n | dim B for K=Q_p | dim Q for K=Q_p | dim K_D |
| --- | --- | --- | --- | --- |
| 1 | 0 | 2 | 2 | 0 |
| 2 | 0 | 5 | 5 | 0 |
| 3 | 1 | 10 | 9 | 1 |
| 4 | 5 | 19 | 14 | 5 |
| 5 | 16 | 36 | 20 | 16 |

For n=3 and d_K=2, dim B=17 and dim Q=15. The two-dimensional kernel is the direct sum of its two one-dimensional σ-kernels. Each B_w has dimension 9 and meets the kernel in zero. Each proper maximal parabolic has block ranks 2 and 1, so its kernel intersection is zero. Thus the new parameter lives in relations between the parabolic images; it cannot be recovered by looking only at one block kernel. The embedded relation of PH.4 is essential.

The character-spanning check can be seen in rank three: (a,b,c)=(c,c,c)+(a−b,0,0)+(b−c,b−c,0). The diagonal is already in both block subspaces. Hence the spanning argument works, while the printed direct-sum dimension cannot. This is the repair used in PH.1/all-refinements.

At n=3,K=Q_p, A_D has E-dimension 10, and every A_{D,w} has dimension 7; dim I_w=3. In contrast R_D/m² has dimension 11. An element of the radical of A_D acts on U by first applying t_D to its coefficient b∈B and then contracting with Q∨. If b∈K_D every such action is zero; if t_D(b)≠0 some dual functional detects it. Consequently U[m] has quotient one copy of A over V, whereas U/V has ten copies. This distinguishes an annihilator from a quotient and A_D from the raw deformation neighborhood.

For d_K>1, D_σ deliberately has repeated weights at τ≠σ. Its transported σ quotient is still meaningful, but H cannot be reapplied directly to D_σ as a regular object. The recovery theorem detects the family of modified objects. Only when K=Q_p does the sole modification equal D and give full recovery by this argument.

## Suggested Lean coverage

The companion file imports individual Mathlib modules and has four light real-bodied definitions: `endRefinements`, `startRefinements`, `blockTuple`, and `kernelMultiplicity`. It states `endpoint_membership`, `endpoint_card`, `blockTuple_apply`, `diagonal_in_block`, `character_spanning`, `kernelMultiplicity_bound`, and `finrank_kernel_of_comparison_dimensions`, and gives every discriminating test of the three PH.0–PH.1 definitions as a named `example`. The last theorem is only the rank-nullity consequence for an existing linear map with the stated dimensions and surjectivity. It does not formalize the comparison or define any missing Ext category.

PH.0’s permutation and tuple statements and PH.1’s numerical statements therefore have Lean signatures. The common presentation, endpoint gluing, actual comparison, and every representation, Hodge and Artinian target remain in this reader, because their carriers require the supplier contracts. The file has no data definitions without bodies, opaque carriers, proposition-field packages or auxiliary theory development. It elaborates with `lean-check` at the pinned shared build (19 October 2026, exit 0, proof-admission warnings only). Every packet node remains `implementationStatus: unchecked`.

## Source verification and repairs

[DING25] Yiwen Ding, *p-Adic Hodge parameters in the crystabelline representations of GL_n*, Publications Mathématiques de l’IHÉS 142 (2025), 1–74, DOI [10.1007/s10240-025-00156-2](https://doi.org/10.1007/s10240-025-00156-2). The [published open PDF](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf) was read on 19 October 2026; SHA-256 `741a49c0677a77b22c9759a016e215882b70dc760eb9e41fd2fe45cc633d05ba`. Printed and PDF page numbers coincide.

Read for this design: the introduction; the hypotheses and quotient/modification/parabolic input statements on pp. 9–21; the modification input on pp. 24–25 and relation statements and maps on pp. 30–32; all representation input contracts on pp. 33–47; and the comparison/recovery/universal-extension arguments on pp. 47–59. No proof audit of the intermediate higher-intertwining theory on pp. 25–29 is claimed: its exact recovery input is assigned to TR5. The global arguments after the start of §4 on p. 59 are outside scope.

The extraction is a routing inventory, not a substitute for the published paper. Its early composite and theorem equation labels drift: the composite is (3.38), p. 47, and Theorem 3.21’s equation is (3.39), p. 48. Proposition 3.27 uses (3.48)–(3.49), pp. 52–53; the σ comparison uses (3.50), pp. 53–54; Theorem 3.34 and (3.53)–(3.54) are on p. 56. The targets above use the published labels.

### E1 — error at DING25, published version: Theorem 3.21 proof, (3.43), pp. 49–50

Printed claim, paraphrased: The full character space is identified with a direct sum of all maximal-Levi-center character spaces and the group-center character space.

Correction: Use a spanning sum of determinant-pullback block character subspaces, with common diagonal directions, and the telescoping identity of PH.0/character-spanning.

Reason: Each two-block character space already contains the diagonal. The proposed sum has dimension (2n−1)(1+d_K), whereas H_T has dimension n(1+d_K); at n=3,d_K=1 these are 10 and 6. The coordinate telescoping proof supplies exactly what the comparison proof uses.

Reach: the proof. Review verdict: confirmed. Checked at p. 49: (3.43) asserts Hom(T(K),E)≅⊕_{j=1}^{n−1}Hom(Z_j(K),E)⊕Hom(Z(K),E). The right side has dimension (2n−1)(1+d_K) against n(1+d_K), so the isomorphism fails for every n≥2. The determinant-pullback subspaces only span, with overlaps along the diagonal, and the closing argument on p. 50 needs only that spanning, which the telescoping identity of PH.0/character-spanning supplies.

### E2 — misprint at DING25, published version: paragraph defining χ_D before Proposition 3.26, p. 51

Printed claim, paraphrased: The exponent denoted |λ| is described with a summation over embeddings, although it is then used as an embedding-indexed algebraic weight.

Correction: Define |λ|_σ=Σ_iλ_{i,σ} for each σ.

Reason: For n=2 and two embeddings with λ=(2,0) and (5,1), the exponents must be 2 and 6. A scalar sum cannot recover the determinant parameter at both embeddings.

Reach: nothing. Review verdict: confirmed. Checked at p. 51: |λ| is defined as a sum over both i and σ, while z^k requires k∈Z^{Σ_K}. With |λ|_σ=Σ_iλ_{i,σ} the character is exactly the central character of π_sm(φ)⊗L(λ) (η contributes |·|_K^{n(n−1)/2}), and χ_Dε^{−n(n−1)/2} has exponents Σ_ih_{i,σ}, the determinant parameter; both recomputed.

### E3 — misprint at DING25, published version: Theorem 3.36 proof, (3.58), p. 58

Printed claim, paraphrased: The radical operator on the full universal extension ends in a refinement-indexed universal extension.

Correction: The final inclusion is A↪U, the same full universal extension as the domain.

Reason: A ring action on U is an endomorphism of U; the displayed formula has no chosen w. On restriction to U_w the formula agrees with its existing action.

Reach: nothing. Review verdict: confirmed. Checked at p. 58: the composition (3.58), which is to define an endomorphism of π_1(φ,h)^univ for x in the cotangent space of A_D, ends in π_1(φ,h)^univ_w although no w is fixed; the subscript is a slip, and the restriction to each U_w agrees with (3.57).

### E4 — misprint at DING25, published version: Theorem 3.34 proof, second relation after (3.54), p. 56

Printed claim, paraphrased: After replacing D_σ by D′_σ the displayed relation still has D_σ in its first slot.

Correction: Use L(D′_σ,D_{1,σ},C_{1,σ}). Both relation subspaces are images of the same kernel through the same ambient isomorphism.

Reason: The proof compares two potentially different objects. Its conclusion requires equality of their embedded relations, not an abstract isomorphism of spaces of the same dimension.

Reach: nothing. Review verdict: confirmed. Checked at p. 56: after replacing D_σ by D′_σ the text again writes ℒ(D_σ,D_{1,σ},C_{1,σ}); the next sentence compares ℒ(D_σ,…) with ℒ(D′_σ,…) inside V(D_{1,σ},C_{1,σ})_σ, so the first slot must be D′_σ.

### E5 — misprint at DING25, published version: Theorem 3.34 proof, first paragraph, p. 56

Printed claim, paraphrased: The easy implication is labeled only-if and the inductive implication if, in the reverse order from the equivalence as stated.

Correction: D_σ≃D′_σ implies equality of comparisons by Corollary 3.32. The converse, starting from isomorphic minimal representations, is the induction.

Reason: Corollary 3.32 transports comparison under a modified-object isomorphism; it cannot itself recover the object from a representation.

Reach: nothing. Review verdict: confirmed. Checked at p. 56: Corollary 3.32(1) gives D_σ≅D′_σ ⇒ Ker t_{D_σ}=Ker t_{D′_σ} ⇒ π_min(D)_σ≅π_min(D′)_σ, the 'if' half of the stated equivalence; the induction proves the 'only if' half. The printed labels are swapped.

### E6 — misprint at DING25, published version: Corollary 2.14 proof, final dimension comparison, p. 19

Printed claim, paraphrased: The dimension comparison for the quotient parabolic tangent has a term d_K dim(B∩L_P)−n and then identifies it with the block dimensions.

Correction: Use dim Q_F=n+d_K dim(B∩L_P)=Σ_i[n_i+n_i(n_i+1)d_K/2]; the block terms are quotient Ext dimensions.

Reason: Subtracting dim Ext¹_0 from Proposition 2.13 and using the parabolic block ranks gives this formula. For P=B it is n(1+d_K), while the printed expression would be n(d_K−1).

Reach: the proof. Review verdict: confirmed. Checked at p. 19: subtracting dim Ext¹_0=n(n−1)d_K/2+1−n from dim Ext¹_{F_P}=1+d_K dim P gives d_K dim(B∩L_P)+n=Σ_i[n_i+n_i(n_i+1)d_K/2]; the printed −n is a sign slip (for P=B it would give n(d_K−1) against n(1+d_K)). The bijectivity concluded from the comparison is right, so this review reclassifies the finding from error to misprint.

### E7 — misprint at DING25, published version: Proposition 3.8, (3.12) and (3.15), pp. 38–39; Proposition 3.18(1), (3.33), p. 46

Printed claim, paraphrased: The subset index for C(I,s_{i,σ}) is restricted to {1,…,n−1} in the exact sequences (3.12) and (3.33) and in diagram (3.15).

Correction: Use I⊂{1,…,n} with 1≤|I|≤n−1, consistently with the definition on p. 34.

Reason: At n=2 both singleton subsets label constituents, while the printed index omits one. Summing all binomial coefficients for proper nonempty subsets gives 2^n−2 and the stated dimension formula.

Reach: a stated result. Review verdict: confirmed. Checked at pp. 35, 38, 39 and 46: π_1 has the (2^n−2)d_K constituents C(I,s_{i,σ}) with I⊂{1,…,n}, #I=i (p. 35), and dim n+(2^n−1)d_K uses all of them, whereas I⊂{1,…,n−1} gives only 2^{n−1}−1 labels for each σ. The review found the same slip in (3.33) of Proposition 3.18(1), p. 46, and added it to the locator.

### E8 — misprint at DING25, published version: Lemma 2.11 proof, last parameter of the displayed triangulation, p. 16

Printed claim, paraphrased: The last rank-one parameter carries the first Hodge weight again.

Correction: Its algebraic factor is z^{h_n}, the n-th ordered weight, rather than z^{h_1}.

Reason: The ordered weights in a noncritical triangulation are h_1,…,h_n. The next page uses the corresponding h_k and h_{k+1} in the simple-reflection comparison.

Reach: nothing. Review verdict: confirmed. Checked at p. 16: the displayed triangulation of D̃ ends with the factor z^{h_1}; noncriticality and the following page's use of h_k and h_{k+1} require z^{h_n}.

### E9 — misprint at DING25, published version: parabolic-induction paragraph after (3.30), p. 43

Printed claim, paraphrased: The parabolic labels on the two endpoint induction expressions do not match their displayed Levi factors.

Correction: The expression with the rank n−1 block first uses P_{n−1}; the expression with the rank-one block first uses P_1, with P_i defined by deleting simple root i.

Reason: Their Levi shapes are (n−1,1) and (1,n−1), respectively, and p. 33 fixes this indexing. The intrinsic filtrations F and G remain the ones used in PH.1.

Reach: nothing. Review verdict: confirmed. Checked at p. 43 on the rendered page: the two inductions are labelled P_1^- and P_2^-, while p. 33 defines P_i by deleting simple root i, so the Levi shapes (n−1,1) and (1,n−1) belong to P_{n−1} and P_1.

### E10 — misprint at DING25, published version: definition of the σ-relation subspace before Corollary 2.38, pp. 31–32

Printed claim, paraphrased: The relation subspace attached to the modified object is named with D_{2,σ} in its third slot.

Correction: Write ℒ(D_σ,D_{1,σ},C_{1,σ})_σ, the notation used in Corollary 2.38 and in (2.42) immediately afterwards.

Reason: No object D_{2,σ} is defined; the ambient space V(D_{1,σ},C_{1,σ})_σ and the defining condition involve only D_{1,σ} and C_{1,σ}.

Reach: nothing. Review verdict: confirmed. Found and checked by this review at pp. 31–32 of the published PDF.

### E11 — gap at DING25, published version: proof of Proposition 3.26, the bijection HC:X_h→X_{ξ_λ}, p. 51

Printed claim, paraphrased: The map between the tangent spaces of U(t_{Σ_K}) at h and of its Weyl invariants at the image point is said to be bijective because the invariants form a polynomial algebra.

Correction: The tangent map of Spec U(t_{Σ_K})→Spec U(t_{Σ_K})^{W} is bijective at h because h is regular: at each σ the Jacobian of the elementary symmetric polynomials at (h_{1,σ},…,h_{n,σ}) is, up to sign, the Vandermonde determinant ∏_{i<j}(h_{i,σ}−h_{j,σ}), which is nonzero since h is strictly dominant.

Reason: Polynomiality of the invariants alone does not give the bijection: for n=2 at a point with equal coordinates the Jacobian of (x_1+x_2,x_1x_2) is singular, so the tangent map is not injective there. Under the paper's standing hypothesis the claim holds, and PH.2/scalar-characters uses the Vandermonde argument.

Reach: the proof. Review verdict: confirmed. Found and checked by this review at p. 51 of the published PDF; the regularity argument was verified directly.

### E12 — misprint at DING25, published version: the two endpoint inductions in the paragraph after (3.30), p. 43

Printed claim, paraphrased: In both displayed endpoint inductions the cyclotomic twist is attached to the other Levi block: ε on the rank n−1 block in the first, and ε^{n−1} on the rank-one block in the second.

Correction: With the normalization ε^{−1}∘θ_P fixed in (3.19), p. 40, the twist is 1⊠ε^{n−1} for the Levi shape (n−1,1) and 1⊠(ε∘det) for (1,n−1): the inductions are of π_1(φ^1,h^1)⊠φ_nz^{h_n}ε^{n−1} and of φ_nz^{h_1}⊠(π_1(φ^1,h^2)⊗ε∘det).

Reason: θ_P is (0,…,0,−(n−1)) and (0,−1,…,−1) for these two parabolics (p. 33), and only these twists put π_alg(φ,h) in the socle. At n=2 the printed first induction has algebraic part z^{(h_1+1,h_2)}, whereas PS(φ,h) on p. 34 has z^λ=z^{(h_1,h_2+1)}. The representations π_F and π_G used later are fixed intrinsically by Lemma 3.10 and (3.19), so nothing downstream changes.

Reach: nothing. Review verdict: confirmed. Found and checked by this review at pp. 33, 34, 40 and 43 of the published PDF (rendered page 43); recomputed at n=2.

The Springer record, the published PDF, a targeted title and DOI search for errata, and the arXiv listing (versions v1 and v2) were checked on 19 October 2026. No published corrigendum was located.

## Routed-item coverage and planets

All 24 items routed to this roadmap by PAPER-DING-25 have targets. This table is an ownership/coverage map, not a sequential synopsis of the source. Extra nodes isolate definitions and the two gluing milestones.

| Routed item suffix | Target ids within this roadmap |
| --- | --- |
| `3.2-RT` | `PH.0/comparison-presentation` |
| `3.2-thm-3-21` | `PH.1/endpoint-gluing`, `PH.1/all-refinements`, `PH.1/comparison-map` |
| `3.2-Sn-1-prime` | `PH.0/endpoint-refinements` |
| `3.2-span-Zj` | `PH.0/block-characters`, `PH.0/character-spanning` |
| `3.2-remark-3-22` | `PH.1/kernel-multiplicity`, `PH.1/kernel-dimension` |
| `3.2-lemma-3-23` | `PH.1/refinement-transversality` |
| `3.2-pimin` | `PH.2/minimal-extensions` |
| `3.2-fD` | `PH.2/ext-pushforward` |
| `3.2-cor-3-24` | `PH.2/ext-refinement-isomorphisms` |
| `3.2-cor-3-25` | `PH.2/intrinsic-characterisation` |
| `3.2-chi-D` | `PH.2/central-character` |
| `3.2-prop-3-26` | `PH.2/scalar-characters` |
| `3.2-prop-3-27` | `PH.3/parabolic-comparison` |
| `3.2-remark-3-28` | `PH.3/parabolic-minimal-extension` |
| `3.2-cor-3-29` | `PH.3/sigma-comparison` |
| `3.2-remark-3-30` | `PH.3/sigma-minimal-extension` |
| `3.2-cor-3-31` | `PH.3/sigma-kernel-splitting` |
| `3.2-cor-3-32-33` | `PH.3/modified-comparison`, `PH.3/modified-ext-comparison` |
| `3.2-thm-3-34` | `PH.4/recovery-relation`, `PH.4/recovery` |
| `3.2-cartesian` | `PH.5/first-order-algebras` |
| `3.2-univ-ext` | `PH.5/universal-extensions` |
| `3.2-lemma-3-35` | `PH.5/induction-universal-extension` |
| `3.2-thm-3-36` | `PH.5/universal-artinian-action` |
| `3.2-cor-3-37` | `PH.5/annihilator-realisation` |

Planets are the named definitions, constructions and theorems shown beside the targets; at most six occur in any layer, and indexing devices or numerical coefficients carry none. The packet is authoritative for their ids. Packaging waits for the missing supplier designs and their exact references.
