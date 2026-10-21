# Roadmap: locally analytic representations of p-adic reductive groups

This roadmap builds the theory of locally analytic representations of p-adic Lie groups, and of the groups G = 𝐆(L) of rational points of reductive groups over a finite extension L of ℚ_p in particular, on the locally convex vector spaces over a p-adic coefficient field E. It is the representation theory on which the locally analytic p-adic Langlands programme runs: Emerton's eigenvarieties and Jacquet modules, the local models of Breuil–Hellmann–Schraen, Ding's p-adic Hodge parameters, Pan's locally analytic completed cohomology and the higher Coleman theory of Boxer–Calegari–Gee–Pilloni all take their representations, their admissibility conditions and their extension groups from here.

The development has three parts. The foundations (Layers LR.0–LR.3) define locally analytic representations, the distribution algebra D(G, E) of a non-compact group and its module structure, admissibility with the Schneider–Teitelbaum anti-equivalence to coadmissible modules, locally algebraic representations, Ext groups computed among D(G, E)-modules, locally analytic vectors of Banach representations with their derived functors, and the solid version of the theory. The structure theory (Layers LR.4–LR.6) builds locally analytic parabolic induction and Schraen's spectral sequence, the Orlik–Strauch functors F^G_P(M, π_P) with their exactness, irreducibility and Jordan–Hölder series, and Emerton's locally analytic Jacquet functor with the adjunction theorems of Emerton and Breuil. The application (Layers LR.7–LR.9) is Ding's analysis of the extension groups of the locally analytic principal series of GL_n(L): the representations π_alg(φ, h) ⊆ π_1(φ, h) ⊆ π(φ, h), the maps ζ_w : Hom(T(L), E) → Ext¹(π_alg, π_1), their compatibility with parabolic induction and their decomposition over the embeddings of L. These are exactly the GL_n-side inputs of the comparison with Galois deformations made by PadicHodgeParametersInLocallyAnalyticRepresentations.

**Independent review (2026-10-19): accepted as partial.** All 82 original targets were checked and one admissible external-tensor theorem was added. The 83 targets below are specifications for formalisation. Ten explicit proof or supplier gaps remain; acceptance does not assert gap-free closure. Every definition comes with the API it needs and with checks that a plausible wrong definition fails; every theorem carries its hypotheses, its source by theorem, section and page, and the earlier targets, library declarations and supplier layers it rests on. The companion [Suggested.lean](../suggested/LocallyAnalyticRepresentationsOfLocalGroups.lean) proposes Lean forms for the light definitions and checks that can be stated against the pinned libraries; it is not the roadmap and not exhaustive, and this document is definitive.

## Scope and ownership

This roadmap owns:

- locally analytic representations of locally L- and ℚ_p-analytic groups on barrelled spaces, the derived Lie algebra action and its decomposition over the embeddings of L, the distribution algebra D(G, E) of a non-compact group and its separately continuous module structure on representations, the duality between representations of compact type and nuclear Fréchet D(G, E)-modules, matrix coefficients, and completed external tensor products;
- coadmissible D(G, E)-modules for non-compact G, admissible and strongly admissible representations, the Schneider–Teitelbaum anti-equivalence and its abelian category, locally algebraic representations, Ext groups of admissible representations with their exact sequences and the identification of Ext¹ with extensions, dual-number self-extensions and tautological and universal extensions;
- admissible Banach representations of non-compact groups, locally analytic vectors, very strong admissibility, and the derived functors R^iLA;
- the solid representation theory of Boxer–Calegari–Gee–Pilloni §2.2 (solid representations of analytic and locally profinite groups, smooth and λ-smooth objects, solid locally analytic vectors and their derived functor, integrable LB Lie representations);
- locally analytic parabolic induction and principal series, Ext between characters of a torus, homology under a unipotent radical and Schraen's spectral sequence;
- the Orlik–Strauch functors in their locally ℚ_p-analytic form, including the extension to products of groups over different fields that Breuil–Hellmann–Schraen require;
- the noncompact extension of imported compact character varieties, essentially admissible representations, Emerton's Jacquet functor, closed induction, balanced maps and the adjunction theorems;
- Ding's §3.1 for GL_n(L).

It imports the following contracts, subject to the supplier refinements listed below:

- **Compact distribution algebras.** D(H, E) for compact H, the embedding of U(g), the Iwasawa algebra inside it, Fréchet–Stein algebras, coadmissible modules with Theorems A and B, the Banach steps and Frommer's theorem, and the duality between admissible Banach representations of compact groups and finitely generated Iwasawa modules: LocallyAnalyticDistributionsPartII ND.0–ND.3 and ND.6.
- **Locally convex foundations.** Nonarchimedean locally convex spaces, compact-type and nuclear Fréchet spaces and their duality, strict morphisms, completed tensor products, locally analytic functions on manifolds and their duals, the Hahn–Banach theorem over spherically complete fields, and the Mellin transform for compact abelian groups: LocallyAnalyticDistributions L0, L1, L3.
- **Smooth representations.** Smooth and admissible representations, smooth parabolic induction, Jacquet modules and Jacquet's lemma, generic irreducibility, the Bernstein centre and Ding's maps 𝒥_w and smooth tangent spaces: SmoothRepresentationsOfLocalGroups SR.0–SR.3, including SR.3/part-ii-ordered-character-map and SR.3/part-ii-principal-series-tangent.
- **p-adic groups.** The topology of 𝐆(L), congruence subgroups and the Iwasawa decomposition: ReductiveGroupsPartII RG2.0 and RG2.4; parabolics, Levi subgroups and Weyl groups: Tau Ceti ReductiveGroups Layer 7.
- **Lie theory.** U(g), Verma modules and their simple quotients, finite-dimensional irreducibles, the centre and Harish-Chandra, gl_n: Tau Ceti LieHighestWeight Layers 3, 4, 7, 9.
- **Rigid and solid carriers.** Quasi-Stein spaces with Theorems A and B: AdicSpacesPartII R3; solid E-vector spaces, analytic rings and solid group rings: SolidAnalyticRings SA.1, SA.2, SA.4.

Two inputs have owners that are designated but not yet designed; they are stated below as exact contracts. **Category O** (full and parabolic BGG category O for g ⊗_{ℚ_p} E, generalised Verma modules, Verma multiplicities and Kostant's theorem) belongs to the Part II of LieHighestWeight proposed as LieHighestWeightPartIICompletedCategoryO. **Solid functional analysis** (Smith and LS spaces, Banach–Smith and Fréchet–LS duality, and their comparison with the classical notions) belongs to the Part II of LocallyAnalyticDistributions proposed as LocallyAnalyticDistributionsPartIIQuasiAbelianFunctionalAnalysis.

Not in this roadmap: the trianguline variety and (φ, Γ)-modules (TriangulineVarietyAndItsLocalModel); Ding's comparison of these extension groups with Galois deformations and the Hodge parameters themselves (PadicHodgeParametersInLocallyAnalyticRepresentations); completed cohomology and its locally analytic vectors as global objects (the CompletedCohomology roadmaps and LocallyAnalyticCompletedCohomology); category O and its analytic localisation; locally analytic Steinberg representations; and the dimension theory of coadmissible modules (Schneider–Teitelbaum 2003, §8), which no target here uses.

## Conventions

1. **Fields.** L/ℚ_p is finite (Ding writes K), d_L=[L:ℚ_p], and E/ℚ_p is finite containing every embedding σ:L→E. Write Σ_L for these embeddings. Then g⊗_{ℚ_p}E=∏_σ g_σ, with g_σ=g⊗_{L,σ}E.
2. **Analyticity.** Unqualified locally analytic means locally ℚ_p-analytic. Locally L-analytic and locally σ-analytic are specified separately. Algebraic rational-point charts give the canonical L-analytic structure; the topology and group law alone do not determine it.
3. **Representations and duals.** Spaces are barrelled Hausdorff locally convex E-spaces; admissible representations have compact type. The strong dual V′ is a left distribution module through the contragredient action, so a central character χ on V becomes χ^{-1} on V′.
4. **Extensions.** Ext^i_G(V₁,V₂)=Ext^i_{D(G,E)}(V₂′,V₁′) in abstract left modules. Ext¹ is identified with admissible extensions using the Banach-step/inverse-limit theorem below. Topological unipotent homology is not identified with the dual of abstract Tor on V′.
5. **Induction and Jacquet.** Inductions are unnormalised: f(pg)=p·f(g), with right translation by G. In the GL_n application induction is from the lower Borel B^−, and J_B uses the upper Borel B. The Hecke action is the average [N₀:mN₀m^{-1}]^{-1}∑_n nm on N₀-invariants. With δ_P(m)=|det(Ad(m)|n)|, the inverse index is δ_P(m) for contracting m. Breuil's unaveraged convention is translated explicitly in the adjunction target.
6. **Weights and permutations.** T⊆B is diagonal/upper triangular, θ=(0,−1,…,1−n), λ=h−θ for strictly dominant h, and w(φ)_i=φ_{w^{-1}(i)}. Accordingly C(w,s_{i,σ}) has subset label w^{-1}({1,…,i}); compatible refinements of a P-filtration form a left coset W_Pw₀. Category-O input has weight −s·λ and its inducing character has weight +s·λ. The Weyl transition identity is ζ_{w₂}∘(w₂w₁^{-1})=ζ_{w₁} on the specified character subspace. These directions matter for cycles of order greater than two.
7. **Characters.** η=1⊠|·|_L⊠⋯⊠|·|_L^{n−1}, δ_B=|·|_L^{n−1}⊠⋯⊠|·|_L^{1−n}, and ε=N_{L/ℚ_p}(·)|·|_L. Here |ϖ_L|_L=p^{−[L₀:ℚ_p]}. Hom, Hom_sm and Hom_σ denote additive character spaces; z^μ denotes a multiplicative algebraic character. A singleton grade carries its own smooth character ψ_k with positional weight h_k, which need not use the original character φ_k.
8. **Solid coefficients.** Fix a strongly inaccessible cardinal κ. Mod(E) means solid modules over E_■=(E,O_E)_■; E retains its p-adic topology. A discrete group M^disc does not give the coefficient space V a discrete topology. For a group over ℚ_p put O_{𝔾_r,E}=O_{𝔾_r}⊗_{ℚ_p}E before tensoring over E.
9. **Finite slope and endpoints.** The finite-slope universal property uses Rep^{zla.c}(Z), with a Z-stable BH exhaustion. Endpoint parabolics of block sizes n−1 and 1 require n≥2. Proposed declaration names use the TauCeti namespace; nothing below claims these theories are already formalised.

## Baseline and supplier contracts

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Every baseline declaration below was read at its pin. `CategoryTheory.Abelian.Ext` requires the relevant `HasExt` instance; `GroupLieAlgebra` needs the manifold differentiability assumptions (in particular `minSmoothness 𝕜 3`). Analytic `LieGroup` gives the group structure on an already supplied analytic manifold. These interfaces do not supply locally analytic representation theory or its functional analysis.

- `mathlib:CategoryTheory.Abelian.Ext` in `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean`: Ext^n(X, Y) in an abelian category with enough structure (here ModuleCat over D(G, E)), with the long exact sequences used for Ext^i_G.
- `mathlib:DualNumber` in `Mathlib/Algebra/DualNumber.lean`: The dual numbers R[ε]/(ε²), the coefficient ring of self-extensions and deformed characters.
- `mathlib:GroupLieAlgebra` in `Mathlib/Geometry/Manifold/GroupLieAlgebra.lean`: The Lie algebra of a Lie group as the tangent space at 1 with the bracket of invariant vector fields; analytic groups over non-archimedean fields included.
- `mathlib:LieGroup` in `Mathlib/Geometry/Manifold/Algebra/LieGroup.lean`: Lie groups modelled on a normed space over a nontrivially normed field, with analytic smoothness available over ℚ_p and its finite extensions.
- `mathlib:ModuleCat` in `Mathlib/Algebra/Category/ModuleCat/Basic.lean`: The category of modules over a ring, used for abstract D(G, E)-modules.
- `mathlib:TopModuleCat` in `Mathlib/Algebra/Category/ModuleCat/Topology/Basic.lean`: Topological modules over a topological ring, the coefficients of continuous cohomology.
- `mathlib:UniversalEnvelopingAlgebra` in `Mathlib/Algebra/Lie/UniversalEnveloping.lean`: The universal enveloping algebra U(L) of a Lie algebra over a commutative ring.
- `mathlib:UniversalEnvelopingAlgebra.lift` in `Mathlib/Algebra/Lie/UniversalEnveloping.lean`: The universal property: Lie algebra maps L → A correspond to algebra maps U(L) → A.
- `mathlib:continuousCohomology` in `Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean`: Continuous group cohomology H^n_cont(G, A) of a topological group with coefficients in a topological representation (TopRep k G).

Tau Ceti's `VermaModule` and `irreducibleQuotient` in `TauCeti/Algebra/Lie/HighestWeight/Verma.lean` have the Killing-Lie-algebra and chosen-base hypotheses. Their use for split reductive ∏_σ gl_n over finite E needs the explicit LieHighestWeight refinement below. The full current LieHighestWeight and ReductiveGroups documents, the nine post-snapshot roadmaps and the current Tau Ceti library were checked for ownership overlap. Existing targets are imported.

Compact distribution algebras, coadmissibility and analytic functional analysis are imported from LocallyAnalyticDistributions and its Part II. Compact character-space geometry belongs to PadicMeasuresIwasawaAlgebras L0a; Fourier/Mellin belongs to LocallyAnalyticDistributions L3. LR.6 adds the discrete lattice factor of a noncompact abelian group. Category O and solid functional analysis retain their designated Part II owners. The requests below are exact additional contracts; stage-level plans are not treated as established implementations.

- **`tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-3-enveloping-algebra-verma-modules-and-lλ`.** U(g) for a reductive (split) Lie algebra over a field of characteristic 0, the PBW theorem, Verma modules M(μ) with their universal property and unique simple quotients L(μ), for g ⊗_{ℚ_p} E = ∏_σ g_σ (products of copies of gl_n and split reductive algebras); generalised Verma modules are requested from the category-O owner (gap 'Category O and Kostant homology'). The present upstream roadmap assumes an algebraically closed characteristic-zero field (and its semisimple Killing hypothesis); provide the split finite-E forms, with scalar extension/descent, before applying this interface over E/ℚ_p. For gl_n separate the central torus from the semisimple factor. Needed by: `LR.0/derived-lie-action`, `LR.4/unipotent-homology`, `LR.5/orlik-strauch-functor`, `LR.5/orlik-strauch-irreducibility`.
- **`tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-4-the-classification-of-finite-dimensional-irreducibles`.** The classification of finite-dimensional irreducible representations of split reductive g by dominant integral highest weight, used for L(λ) with λ dominant for Res_{L/ℚ_p}GL_n ×_{ℚ_p} E = ∏_σ GL_n. The present upstream roadmap assumes an algebraically closed characteristic-zero field (and its semisimple Killing hypothesis); provide the split finite-E forms, with scalar extension/descent, before applying this interface over E/ℚ_p. For gl_n separate the central torus from the semisimple factor. Needed by: `LR.1/locally-algebraic-representation`, `LR.4/principal-series`, `LR.7/pi-alg`.
- **`tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-7-the-center-of-ul-harish-chandra-freudenthal-and-serres-relations`.** The centre Z(U(g)) and the Harish-Chandra isomorphism with the dot action, distinct infinitesimal characters for distinct dominant weights; used for the vanishing of Ext between locally algebraic representations of different weights. The present upstream roadmap assumes an algebraically closed characteristic-zero field (and its semisimple Killing hypothesis); provide the split finite-E forms, with scalar extension/descent, before applying this interface over E/ℚ_p. For gl_n separate the central torus from the semisimple factor. Needed by: `LR.1/locally-algebraic-ext`.
- **`tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-9-reductive-lie-algebras-and-gl_n`.** gl_n as a reductive Lie algebra with its Cartan, Borel and parabolic subalgebras, dominance and the dot action of S_n; products over the embeddings σ ∈ Σ_L. The present upstream roadmap assumes an algebraically closed characteristic-zero field (and its semisimple Killing hypothesis); provide the split finite-E forms, with scalar extension/descent, before applying this interface over E/ℚ_p. For gl_n separate the central torus from the semisimple factor. Needed by: `LR.7/gln-conventions`.
- **`tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`.** Finite-dimensional algebraic representations of an affine group scheme as comodules, and their restriction to rational points; used for locally algebraic representations and as the algebraic model of BCGP's analytic coactions. Needed by: `LR.0/locally-analytic-representation`, `LR.1/locally-algebraic-representation`, `LR.3/solid-analytic-group-representation`.
- **`tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation`.** The Lie algebra Lie(𝐆) of a smooth affine group and the adjoint representation, identified with the tangent space at 1 of 𝐆(L). Needed by: `LR.0/rational-points-analytic-group`.
- **`tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.** Parabolic subgroups, Levi decompositions, opposite parabolics and the Weyl group of a split reductive group over L, in particular the standard parabolics of GL_n. Needed by: `LR.4/principal-series`, `LR.5/orlik-strauch-functor`, `LR.7/gln-conventions`.
- **`SolidAnalyticRings:SA.1`.** Solid abelian groups and solid E-vector spaces (light condensed, κ-small), with the solid tensor product and internal Hom; Mod(E) of BCGP §2.2. Needed by: `LR.3/solid-analytic-group-representation`, `LR.3/solid-group-representation`.
- **`SolidAnalyticRings:SA.2`.** Analytic rings and the analytic ring structure of affinoid algebras (O(𝔾))_■ used for base change of solid modules. Needed by: `LR.3/solid-analytic-group-representation`.
- **`SolidAnalyticRings:SA.4`.** The analytic ring E_■ = (E, O_E)_■ for a finite extension E/ℚ_p and solid group rings E_■[M] of profinite groups as solid E-algebras (lim of O_E[M/N], inverted p). Needed by: `LR.3/banach-analytic-comparison`, `LR.3/solid-analytic-group-representation`, `LR.3/solid-group-representation`.
- **`LocallyAnalyticDistributionsPartII:ND.3/arens-michael-envelope`.** The topological Arens–Michael completion Û(g), its action on LB modules, and the pairing with distributions of the analytic group germ; integrability in BCGP Definition 3.4.2 starts with such a completed-module structure. Needed by: `LR.3/integrable-lb-lie-representation`.
- **`LocallyAnalyticDistributions:L3/mellin-adic-comparison`.** Supply the rigid/adic character-space comparison assumed conditionally in this node, including compact torsion characters and coefficient extension/descent. LR.6 constructs the discrete ℤ^r factor itself and imports the compact Fourier/Mellin theory; it does not redevelop the compact owner’s construction. Needed by: `LR.6/character-variety`.
- **`SmoothRepresentationsOfLocalGroups:SR.3/generic-irreducibility`.** Refine the current complex-coefficient Zariski-open theorem to the explicit GL_n(L) principal-series criterion over a finite p-adic coefficient field E: for E-valued φ with φ_i/φ_j∉{1,|·|_L}, the unnormalised lower-Borel induction of φη is absolutely irreducible and independent of all permutations of φ, with E-rational intertwining isomorphisms and End=E. Include coefficient extension/descent; the abstract existence of a nonempty open subset does not imply this criterion. Needed by: `LR.7/pi-alg`, `LR.7/principal-series-constituents`, `LR.8/parabolic-constituents`.
- **`SmoothRepresentationsOfLocalGroups:SR.2/principal-series-jacquet`.** Supply the finite-E form and explicit normalisation conversion of the regular principal-series Jacquet calculation: for the unnormalised lower-Borel I_sm(φ)=Ind_{B^-}^G φη, its unnormalised N^- Jacquet module is ⊕_w w(φ)η, with distinct characters, and the corresponding upper-Borel module is ⊕_w w(φ)ηδ_B. The current upstream statement is over ℂ and uses normalised induction and Jacquet functors. Establish splitting and coefficient descent in this E-valued setting. Needed by: `LR.7/constituent-ext-lines`, `LR.7/ext-ps1`.
- **`SmoothRepresentationsOfLocalGroups:SR.3/finite-length`.** Supply finite length of admissible smooth finite-length parabolic induction for the finite p-adic coefficient field E used by the Orlik–Strauch arguments, with scalar extension/descent. The current upstream target states this over ℂ. Needed by: `LR.5/orlik-strauch-jordan-holder`, `LR.7/principal-series-constituents`.
- **`PadicMeasuresIwasawaAlgebras:L0a`.** Provide the compact abelian ℚ_p-analytic character-space carrier, its universal character and torsion-component coefficient extension/descent, in finite-dimensional product form for Z_0. LR.6 imports this geometry and L3 Mellin, then constructs only the noncompact discrete ℤ^r factor. The current PMIA packet leaves L0a partial with no nodes. Needed by: `LR.6/character-variety`.

## How to read the build

Each target includes its full statement, hypotheses, acceptance examples, proof sketch, sources and direct prerequisites. Definitions and constructions also give their uses, namespace, API and at least three discriminating checks. A sourced theorem can have an explicit open proof contract; the coverage and open-input lists identify these. Layer examples repeat selected acceptance checks with concrete parameters. The companion suggested Lean file contains only light forms over existing carriers, and its elementary arithmetic does not formalise the stated representation-theoretic dimension theorems.

## Layer LR.0: Locally analytic representations and the distribution algebra of a p-adic group

The p-adic Lie group 𝐆(L) of a smooth affine group, locally L- and ℚ_p-analytic representations on barrelled spaces with their derived Lie algebra action, the distribution algebra D(G, E) of a non-compact group, its module structure on representations, the Schneider–Teitelbaum duality for representations of compact type, continuity of matrix coefficients, weak versus strong convergence of sequences, and completed external tensor products. The rational-point structure is canonical relative to algebraic analytic charts. External tensor products here concern compact-type spaces; admissibility is the later LR.1 target.

**Coverage:** partial. Supply the complete normed-space Schur-property proof used by weak-sequential-convergence (DLB17 Lemme 5.10, p. 29); the earlier compactoid sketch is withdrawn.

#### Rational points of a smooth affine group are a locally analytic group (`rational-points-analytic-group`, theorem)

Let L/ℚ_p be finite and 𝐆 a smooth affine group scheme of finite type over L. Then G = 𝐆(L), with the topology of ReductiveGroupsPartII RG2.0, carries the canonical structure of locally L-analytic group (a Lie group over L in the sense of Schneider, §13; in Mathlib, a LieGroup modelled on L^d with analytic smoothness) induced by the algebraic charts, with its usual topology. For every closed immersion 𝐆 ↪ GL_N it is a closed analytic submanifold of the open subset GL_N(L) ⊂ M_N(L), its tangent space at 1 is Lie(𝐆) ⊂ gl_N(L) with the commutator bracket, and the closed subgroups P(L), M_P(L), N_P(L), T(L) attached to a parabolic P = M_P N_P and a maximal torus T are locally analytic subgroups with Lie algebras p, m_P, n_P, t. Restricting scalars along ℚ_p ⊆ L makes G a locally ℚ_p-analytic group of dimension [L:ℚ_p]·dim 𝐆 whose ℚ_p-Lie algebra is g viewed over ℚ_p. If E/ℚ_p contains the images of all embeddings σ : L → E (the set Σ_L, of cardinality d_L = [L:ℚ_p]) then L ⊗_{ℚ_p} E ≅ ∏_{σ∈Σ_L} E, x ⊗ y ↦ (σ(x)y)_σ, and hence g ⊗_{ℚ_p} E ≅ ∏_σ g_σ with g_σ := g ⊗_{L,σ} E, and U(g ⊗_{ℚ_p} E) ≅ ⊗_σ U(g_σ).

*Hypotheses and conventions.* L/ℚ_p finite; 𝐆 smooth affine over L (reductive from LR.4 on). Canonical means compatible with regular and étale algebraic charts; the topology and group law alone do not determine an L-analytic atlas.

*Acceptance examples.* For 𝐆 = GL_n the analytic structure is that of the open subset GL_n(L) ⊂ M_n(L) and g = gl_n(L). For L ≠ ℚ_p and 𝐆 = 𝔾_m, G = L^× has dimension 1 over L and d_L over ℚ_p, and Lie(G) ⊗_{ℚ_p} E ≅ E^{Σ_L}. For a nontrivial automorphism σ of a finite Galois extension L/ℚ_p, transporting the additive atlas by σ preserves the topological group but changes its L-analytic structure. The canonical statement therefore requires algebraic compatibility.

*Proof sketch.* In a neighbourhood of each rational point of a smooth closed affine subgroup of GL_N, choose N² − d defining equations with independent differentials and a Zariski neighbourhood on which their zero locus agrees with the subgroup. Apply the analytic inverse function theorem (SCHN11 Proposition 6.4, pp. 42–43) to the equations together with complementary coordinates. Corollary 4.5, p. 24, alone provides topological charts and is insufficient for analyticity. Multiplication and inversion are restrictions of the analytic operations of GL_N(L), so 𝐆(L) is a Lie group over L; its tangent space at 1 is the kernel of the Jacobian, i.e. Lie(𝐆)(L) (ReductiveGroups Layer 2), with the commutator bracket (SCHN11 §14). Regular transition maps between these algebraic local charts are L-analytic. This proves independence of the immersion and uniqueness among atlases compatible with the algebraic charts; no uniqueness claim for arbitrary topologically compatible L-analytic group structures is used. Restriction of scalars: an L-analytic chart L^d ⊃ U is a ℚ_p-analytic chart of ℚ_p^{d·d_L}; the decomposition of L ⊗_{ℚ_p} E is the Chinese remainder theorem for the separable extension L/ℚ_p split by E.

*Sources.* [SCHN11](#references), §13, Corollary 13.3 and Examples 1)–3), p. 90: GL_n(K) is a Lie group as the open submanifold det ≠ 0 of K^{n²}; Lie groups have a well-defined dimension. [SCHN11](#references), §4, Corollary 4.5, p. 24: An implicit-function statement: a strictly differentiable map with surjective derivative has zero set locally a graph, which gives the submanifold charts used for 𝐆(L) ⊂ GL_N(L). [SCHN11](#references), §14, Exercise ii, p. 101: For nonarchimedean K, gl_n(K) is the Lie algebra of GL_n(K). [BR16](#references), §2, (3), p. 7: States the decomposition L ⊗_{ℚ_p} E ≅ ∏_σ E and deduces g ⊗_{ℚ_p} E ≅ ∏_σ g_σ and U(g ⊗_{ℚ_p} E) ≅ ⊗_σ U(g_σ) for the ℚ_p-Lie algebra of G(L). [SCHN11](#references), §6, Proposition 6.4, pp. 42–43: The analytic inverse function theorem upgrades the local smooth algebraic coordinate presentation to analytic submanifold charts.

*Needs.* `ReductiveGroupsPartII:RG2.0/points-topological-group`, `ReductiveGroupsPartII:RG2.0/general-linear-points-homeomorphism`, `LocallyAnalyticDistributions:L0/analytic-manifold-atlases`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation`, `mathlib:LieGroup`, `mathlib:GroupLieAlgebra`.

#### Locally analytic representations (`locally-analytic-representation`, definition)

Let F ∈ {ℚ_p, L} be the field of analyticity, G a locally F-analytic group (LR.0/rational-points-analytic-group, by restriction of scalars when F = ℚ_p), and E ⊇ F a complete, spherically complete nonarchimedean field (a finite extension of ℚ_p in every application). A locally F-analytic representation of G over E is a barrelled Hausdorff locally convex E-vector space V with an action of G by continuous E-linear maps such that for every v ∈ V the orbit map ρ_v : G → V, g ↦ g·v, is a locally F-analytic V-valued function (an element of C^{F-an}(G, V), LocallyAnalyticDistributions L0). Morphisms are continuous G-equivariant E-linear maps; this gives the category Rep^{la}_E(G) (Rep^{F-la}_E(G) when F must be named). V is of compact type, LB or Banach when its underlying space is. Unqualified 'locally analytic' means locally ℚ_p-analytic, the convention of Ding, of Breuil–Hellmann–Schraen and of Boxer–Calegari–Gee–Pilloni; 'locally L-analytic' (Schneider–Teitelbaum, Orlik–Strauch) is the case F = L.

*Hypotheses and conventions.* Barrelledness makes the action map G × V → V continuous (Banach–Steinhaus), so the topology and the action interact as for Banach representations. For F = L, E must contain L; for F = ℚ_p no condition on E beyond ℚ_p ⊆ E.

*Uses.* ST03 §6, p. 33: admissible representations are defined as locally analytic representations on spaces of compact type with coadmissible dual. Ding, §3.1.1, p. 33: all GL_n(K)-representations of §3.1 are locally ℚ_p-analytic over E. Orlik–Strauch, §4.1, p. 18: F^G_P takes values in locally analytic representations. BCGP25 §2.2.27: the classical counterpart of solid locally analytic vectors (LR.3). PadicHodgeParametersInLocallyAnalyticRepresentations, input contract LA1: carrier of every GL_n(K)-representation in Ding's comparison. LocallyAnalyticCompletedCohomology LA.0–LA.3: locally analytic vectors of completed cohomology are locally analytic representations of GL_2(ℚ_p).

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
- `LocallyAnalyticRep.sigma_not_L_analytic` (non-example): For an embedding σ : L → E distinct from the chosen inclusion, the multiplicative character x ↦ σ(x) of L^× on E is locally ℚ_p-analytic and fails L-linearity of the derivative at 1, hence is not locally L-analytic.
- `LocallyAnalyticRep.ofSmooth_compat` (compatibility): For a smooth representation π of G of countable dimension (SR.0/is-smooth) with the finest locally convex topology, LocallyAnalyticRep.ofSmooth π has the same underlying G-module, and its orbit maps are locally constant.

*Acceptance examples.* Every finite-dimensional algebraic representation of 𝐆 over E, restricted to G = 𝐆(L), is locally L-analytic (orbit maps are polynomial in matrix entries).

*Proof sketch.* Locally analytic V-valued functions on a locally F-analytic manifold are those that are, on a cover by charts, sums of convergent power series with coefficients in BH-subspaces of V (LocallyAnalyticDistributions L0/locally-analytic-function-space); the definition only asks this of orbit maps. Continuity of G × V → V: each g acts continuously and the orbit maps are continuous; for barrelled V the equicontinuity of {g : g ∈ K} for compact K follows from the Banach–Steinhaus theorem (L0/barrelled-banach-steinhaus), as in ST02 §3.

*Sources.* [ST02](#references), §3, definition of a locally analytic G-representation, p. 12: Defines a locally analytic representation as a barrelled Hausdorff locally convex space with continuous linear G-action whose orbit maps are locally analytic V-valued functions. [EM17](#references), §3.6, Definition 3.6.9, p. 72: Reformulates the definition: a topological action on a barrelled Hausdorff locally convex space for which the natural map V_la → V is a bijection. [OS15](#references), §4.1, p. 18: Writes Rep^la_K(G) for locally analytic representations of G on barrelled locally convex Hausdorff K-vector spaces, the target of F^G_P. [DING25](#references), §3.1.1, p. 33: Works throughout with locally ℚ_p-analytic representations of GL_n(K) over E.

*Needs.* `LR.0/rational-points-analytic-group`, `LocallyAnalyticDistributions:L0/nonarchimedean-locally-convex-spaces`, `LocallyAnalyticDistributions:L0/locally-analytic-function-space`, `LocallyAnalyticDistributions:L0/barrelled-banach-steinhaus`, `LocallyAnalyticDistributions:L0/compact-type-spaces`, `LocallyAnalyticDistributions:L0/spherically-complete-fields`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/is-smooth`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`.

*Planet:* Locally analytic representation.

#### The derived action of the Lie algebra (`derived-lie-action`, construction)

Let V be a locally F-analytic representation of G with F-Lie algebra g. For x ∈ g and v ∈ V put x·v := (d/dt)(exp(tx)·v)|_{t=0}, using the exponential of G near 1 (SCHN11 §18) and the analyticity of the orbit map. Then x ↦ (v ↦ x·v) is an F-linear Lie algebra homomorphism g → End_cont(V), which extends to an E-algebra homomorphism U(g ⊗_F E) → End_cont(V). It satisfies g(x·v) = (Ad(g)x)·(g·v) for g ∈ G, commutes with every morphism of locally analytic representations, and coincides with the action of the distributions x̃ ∈ D(G, E) of LocallyAnalyticDistributionsPartII ND.1/lie-algebra-in-distributions under the module structure of LR.0/distribution-module-structure. For F = ℚ_p and E splitting L, U(g ⊗_{ℚ_p} E) = ⊗_σ U(g_σ) acts, so V decomposes its Lie action into components indexed by Σ_L. On spaces of functions the convention is (x·f)(g) = (d/dt) f(exp(−tx)g)|_{t=0} for the left regular action, as in Breuil.

*Hypotheses and conventions.* The exponential is defined on a neighbourhood of 0 in g; only the germ at t = 0 enters.

*Uses.* Ding, §3.1.4, p. 44: locally σ-analytic means the 𝔤𝔩_n(K) ⊗_{ℚ_p} E-action factors through 𝔤𝔩_n(K) ⊗_{K,σ} E; g_{Σ∖σ}-algebraic means U(g_{Σ∖σ})-finite algebraic. Orlik–Strauch, §3–4; Breuil, socle I, Lemma 2.1: U(g)-action on induced representations defines the subspace killed by ker(φ). Schraen 2011, (4.40): Lie algebra homology H_q(n, −) of locally algebraic vectors.

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

*Acceptance examples.* On a finite-dimensional algebraic representation the derived action is the differential of the algebraic action (ReductiveGroups Layer 2).

*Proof sketch.* Differentiate the analytic orbit maps. For fixed x, the difference quotients are pointwise bounded continuous linear operators on the barrelled space V; Banach–Steinhaus gives equicontinuity and continuity of their pointwise limit (ST02 §3, pp. 12–13). Differentiate the group commutator identity in two variables to obtain the Lie bracket relation; differentiate conjugation to obtain Ad-equivariance. These steps use the analytic group charts, before any distribution-module construction. Apply UniversalEnvelopingAlgebra.lift to extend the action. After LR.0/distribution-module-structure is constructed, its scalar integration formula identifies the distribution x̃ acting on v with the same orbit derivative. This is a later compatibility result, not an input to the construction.

*Sources.* [ST02](#references), §2–3, the derived action of g, pp. 9–13: Defines the action of g on C^an(H, K) by (xf)(g) = (d/dt) f(exp(−tx)g)|₀ and on locally analytic representations through distributions, extending to U(g). [BR16](#references), §2, (5), p. 8: Fixes the convention (x·f)(g) = (d/dt) f(exp(−tx)g)|_{t=0} and extends it to U(g ⊗_{ℚ_p} E). [DING25](#references), §3.1.4, p. 44: Uses the derived 𝔤𝔩_n(K) ⊗_{ℚ_p} E-action to define locally σ-analytic and g_{Σ_K∖{σ}}-algebraic representations.

*Needs.* `LR.0/locally-analytic-representation`, `LR.0/rational-points-analytic-group`, `LocallyAnalyticDistributionsPartII:ND.1/lie-algebra-in-distributions`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-3-enveloping-algebra-verma-modules-and-lλ`, `mathlib:UniversalEnvelopingAlgebra`, `mathlib:UniversalEnvelopingAlgebra.lift`, `LocallyAnalyticDistributions:L0/barrelled-banach-steinhaus`.

#### The distribution algebra of a locally analytic group (`distribution-algebra`, construction)

Let G be a locally F-analytic group (not necessarily compact) and H ⊆ G a compact open subgroup. C^{F-an}(G, E) = ∏_{gH ∈ G/H} C^{F-an}(gH, E) as locally convex spaces, and D(G, E) := C^{F-an}(G, E)′_b is the locally convex direct sum ⊕_{gH∈G/H} δ_g ∗ D(H, E), where D(H, E) is the Fréchet algebra of LocallyAnalyticDistributionsPartII ND.1/distribution-algebra. Convolution λ ∗ μ = m_*(λ ⊗̂ μ) makes D(G, E) an associative unital E-algebra with unit δ_1 and separately continuous multiplication; δ_g ∗ δ_h = δ_{gh}; E[G] → D(G, E) is injective with dense image; for open H′ ⊆ G, D(H′, E) is a subalgebra and D(G, E) is free as a right D(H′, E)-module with summands δ_g D(H′, E) indexed by gH′, and free as a left module with summands D(H′, E)δ_g indexed by H′g; U(g ⊗_F E) ⊂ D(H, E) ⊂ D(G, E); and g ↦ g⁻¹ induces an anti-involution, so left modules suffice. For F = ℚ_p and L ≠ ℚ_p the closed embedding C^{L-an} ⊂ C^{ℚ_p-an} dualises to a surjection D_{ℚ_p}(G, E) ↠ D_L(G, E). Unless stated otherwise D(G, E) is the ℚ_p-analytic algebra.

*Hypotheses and conventions.* E spherically complete, so that strong duals behave as in LocallyAnalyticDistributions L0. Separate continuity only: for noncompact G the multiplication on the direct sum is not jointly continuous in general, and nothing below uses joint continuity.

*Uses.* Ding, §3.1.1, p. 33: Ext^i_{GL_n(K)}(V_1, V_2) is defined as Ext^i in abstract D(GL_n(K), E)-modules. ST03 §6, p. 31: coadmissible D(G, K)-modules for noncompact G. Schraen 2011, Définition 3.1, p. 65: Ext groups of locally analytic representations of GL_3(ℚ_p) via D(G)-modules. Breuil, Ext¹, §2.1, p. 10: D_σ(H, E)-modules and Lemme 2.1.1.

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

*Acceptance examples.* For compact G the construction returns the Fréchet algebra of ND.1/distribution-algebra.

*Proof sketch.* The product decomposition of C^an(G, E) over the cosets of H and the duality between products and locally convex direct sums give D(G, E) = ⊕ δ_g ∗ D(H, E). Convolution is defined coset by coset from ND.1/distribution-algebra and m_* (LocallyAnalyticDistributions L0/locally-analytic-pullback); associativity and the unit follow from the compact case and δ_g ∗ δ_h = δ_{gh} (ST02 Proposition 2.3). Density of E[G] and freeness over D(H′, E) reduce to ND.1/open-subgroup-decomposition for the compact pieces.

*Sources.* [ST02](#references), §2, Proposition 2.3, p. 9: For any locally L-analytic G, (D(G, K), ∗) is an associative algebra with unit δ_1 and separately continuous multiplication; it is a Fréchet algebra if G is compact. [ST02](#references), §3, Lemma 3.1, p. 13: Dirac distributions span a dense subspace and D(G, K) = ⊕_{g∈G/H} δ_g ∗ D(H, K) for a compact open H. [BR16](#references), §2, proof of Lemma 2.2, p. 9: Uses C^{ℚ_p-an}(G(L), V) = ∏_i C^{ℚ_p-an}(G_i, V) and D(G(L), E) = ⊕_i D(G_i, E) for a disjoint cover by compact opens.

*Needs.* `LocallyAnalyticDistributionsPartII:ND.1/distribution-algebra`, `LocallyAnalyticDistributionsPartII:ND.1/lie-algebra-in-distributions`, `LocallyAnalyticDistributionsPartII:ND.1/open-subgroup-decomposition`, `LocallyAnalyticDistributions:L0/locally-analytic-dual-nuclear`, `LocallyAnalyticDistributions:L0/locally-convex-limits`, `LocallyAnalyticDistributions:L0/field-analytic-functions`, `LR.0/rational-points-analytic-group`.

*Planet:* Distribution algebra of a p-adic Lie group.

#### Locally analytic representations are D(G, E)-modules (`distribution-module-structure`, theorem)

Let V be a locally F-analytic representation of G over E. There is a unique separately continuous bilinear map D(G, E) × V → V, (μ, v) ↦ μ ∗ v, making V a left D(G, E)-module, with δ_g ∗ v = g·v, extending the derived action of U(g ⊗_F E) (LR.0/derived-lie-action), and characterised by λ(μ ∗ v) = μ(g ↦ λ(g·v)) for all λ ∈ V′. For fixed v the map D(G, E) → V, μ ↦ μ ∗ v, is continuous (the integration map of the orbit). Every continuous G-equivariant linear map between locally analytic representations is D(G, E)-linear.

*Hypotheses and conventions.* V barrelled (part of the definition of a locally analytic representation).

*Acceptance examples.* For V = C^an(G, E) with left translation, μ ∗ f is the convolution of μ with f (ST02 §3).

*Proof sketch.* For fixed v and a compact chart meeting the support of μ, factor the analytic orbit map through a Banach (BH) subspace of V. Integrate its convergent power series there against the restricted distribution and sum over the finitely many supporting charts. ST02 §2–3, pp. 8, 12–13, proves independence of the choices. This does not assume a global identity C^an(G,V) = C^an(G,E) ⊗̂ V for arbitrary barrelled V. Separate continuity in μ is continuity of the integration map; in v it follows from barrelledness and Banach–Steinhaus. δ_g ∗ v = g·v by evaluation; the module axioms hold on Dirac distributions and extend by density of E[G] (LR.0/distribution-algebra). The formula λ(μ ∗ v) = μ(λ ∘ ρ_v) holds by construction; uniqueness follows from Hahn–Banach (L0/nonarchimedean-hahn-banach). G-maps commute with Dirac distributions, hence with all of D(G, E).

*Sources.* [ST02](#references), §3, Proposition 3.2, p. 13: The map (μ, v) ↦ μ ∗ v is separately continuous, V is a D(G, K)-module extending the U(g)-action, and continuous G-maps are D(G, K)-linear. [DLB17](#references), §5.2, proof of Lemme 5.9, p. 29: Uses the continuity of μ ↦ μ ∗ w from D(G) to W and the integration formula λ(μ ∗ w) = ∫ λ(g·w) dμ(g) for λ ∈ W*.

*Needs.* `LR.0/locally-analytic-representation`, `LR.0/distribution-algebra`, `LR.0/derived-lie-action`, `LocallyAnalyticDistributions:L0/barrelled-banach-steinhaus`, `LocallyAnalyticDistributions:L0/nonarchimedean-hahn-banach`.

#### Schneider–Teitelbaum duality for representations of compact type (`compact-type-duality`, theorem)

The functor V ↦ V′_b is an anti-equivalence between locally F-analytic representations of G on E-vector spaces of compact type, with continuous G-maps, and separately continuous D(G, E)-modules whose underlying space is a nuclear Fréchet space, with continuous D(G, E)-linear maps. The D(G, E)-module structure on V′_b is the contragredient of LR.0/distribution-module-structure, composed with the anti-involution g ↦ g⁻¹.

*Hypotheses and conventions.* E spherically complete, so that compact-type and nuclear Fréchet spaces are reflexive and in duality (LocallyAnalyticDistributions L0/compact-type-nuclear-duality).

*Acceptance examples.* For G compact and V = C^an(G, E), the dual is D(G, E) itself, free of rank one.

*Proof sketch.* Compact-type spaces and nuclear Fréchet spaces are anti-equivalent under the strong dual (L0/compact-type-nuclear-duality). A locally analytic structure on V gives a separately continuous D(G, E)-module structure on V′_b by transposition (LR.0/distribution-module-structure). Conversely a separately continuous D(G, E)-module structure on a nuclear Fréchet M gives a G-action on M′_b by restriction to Dirac distributions, and the orbit maps are locally analytic by the reflexivity argument of ST02 Corollary 3.3.

*Sources.* [ST02](#references), §3, Corollary 3.3, p. 14: The functor V ↦ V′_b is an anti-equivalence between locally analytic representations on spaces of compact type and separately continuous D(G, K)-modules on nuclear Fréchet spaces.

*Needs.* `LR.0/distribution-module-structure`, `LocallyAnalyticDistributions:L0/compact-type-nuclear-duality`, `LocallyAnalyticDistributions:L0/compact-type-spaces`, `LocallyAnalyticDistributions:L0/nuclear-spaces`.

*Planet:* Duality for representations of compact type.

#### Continuity of matrix-coefficient maps (`matrix-coefficient-continuity`, theorem)

Let W be a locally F-analytic representation of G on an E-space of compact type and λ ∈ W′. Then the map F_λ : W → C^{F-an}(G, E), w ↦ (g ↦ λ(g·w)), is well defined, G-equivariant for the right regular action, and continuous.

*Hypotheses and conventions.* W of compact type, hence reflexive.

*Acceptance examples.* For W = C^an(G, E) and λ = evaluation at 1, F_λ is the identity of C^an(G, E) (up to the inversion convention).

*Proof sketch.* F_λ(w) is locally analytic because it is λ composed with the orbit map ρ_w. For compact open H ⊆ G, C^an(H,E) is of compact type and reflexive, so transposition and the separately continuous dual distribution action prove continuity of W → C^an(gH,E). Taking the product over G/H gives continuity into C^an(G,E). The full function space need not be of compact type or reflexive when G is noncompact. Equivariance is the identity λ(gh·w) = (F_λ(h·w))(g).

*Sources.* [DLB17](#references), §5.2, Lemme 5.9 and its proof, pp. 28–29: For a locally analytic representation W of compact type and a continuous linear form λ, the matrix-coefficient map W → LA(G) is continuous; the proof uses reflexivity and the continuity of μ ↦ μ ∗ w.

*Needs.* `LR.0/distribution-module-structure`, `LR.0/compact-type-duality`, `LocallyAnalyticDistributions:L0/compact-type-dual-reflexivity`.

#### Weakly null sequences are null over a spherically complete field (`weak-sequential-convergence`, theorem)

Let E be spherically complete and V a Hausdorff locally convex E-vector space. A sequence (v_n) in V converges to 0 if and only if λ(v_n) → 0 for every λ ∈ V′.

*Hypotheses and conventions.* Spherical completeness of E is essential: it gives the Hahn–Banach theorem (L0/nonarchimedean-hahn-banach), on which the argument rests.

*Acceptance examples.* In c_0(ℕ, E) the unit vectors e_n do not tend to 0 weakly (pair with the bounded sequence (1, 1, …) ∈ ℓ^∞ = c_0′), consistently with ‖e_n‖ = 1.

*Proof sketch.* Strong convergence implies weak convergence. Conversely, reduce to the seminormed quotients V_q := V/ker q for the continuous seminorms q; weak convergence passes to V_q because continuous forms on V_q are continuous forms on V. The remaining nonarchimedean Schur step is exactly the open proof contract: weak nullness in each seminormed quotient implies convergence in its norm over a spherically complete field. DLB17 Lemme 5.10, p. 29, states this without proof. Neither weak compactness of the sequence together with 0 nor the listed compactoid supplier alone supplies that implication. The node records the sourced statement, not a completed compactoid proof.

*Sources.* [DLB17](#references), §5.2, Lemme 5.10, p. 29: Asserts, without proof, that in a locally convex space over a spherically complete field a sequence tends to 0 if and only if it tends weakly to 0.

*Needs.* `LocallyAnalyticDistributions:L0/nonarchimedean-locally-convex-spaces`, `LocallyAnalyticDistributions:L0/spherically-complete-fields`, `LocallyAnalyticDistributions:L0/nonarchimedean-hahn-banach`, `LocallyAnalyticDistributions:L0/compactoid-compact-maps`.

#### Completed external tensor products of representations (`completed-external-tensor`, construction)

Let V_i be a locally F-analytic representation of G_i on a space of compact type, i = 1, 2. The completed tensor product V_1 ⊗̂_E V_2 (projective and inductive completed tensor products agree for these spaces) is of compact type and is a locally analytic representation of G_1 × G_2 with (g_1, g_2)(v_1 ⊗ v_2) = g_1v_1 ⊗ g_2v_2. Its strong dual is V_1′_b ⊗̂_E V_2′_b as a module over D(G_1 × G_2, E) ⊇ D(G_1, E) ⊗_E D(G_2, E) (for compact opens, D(H_1 × H_2, E) = D(H_1, E) ⊗̂_E D(H_2, E)). Admissibility of the external product is the later LR.1/admissible-external-tensor theorem; restriction along the diagonal G → G × G gives the internal completed tensor product, in particular the twist V ⊗ χ by a locally analytic character χ.

*Hypotheses and conventions.* Both spaces are of compact type. Exactness below concerns strict short exact sequences of compact-type spaces. No assertion for arbitrary semi-complete LB representations is made.

*Uses.* Ding, §3.1.3, (3.19) and (3.26), pp. 40–42: the Levi representation ⊗̂_i π_1(φ_{F_P,i}, h^i) and the extension construction of ζ_{F_P}. BHS, §5.2, p. 390: Orlik–Strauch representations of products G_1(K_1) × G_2(K_2). Ding, §3.1.2: twists by locally analytic characters such as z^λ and (1 + ψε).

*API* (namespace `TauCeti.LocallyAnalytic`):

- `LocallyAnalyticRep.extTensor` (constructor): V_1 ⊠̂ V_2 as a representation of G_1 × G_2.
- `LocallyAnalyticRep.extTensor_dual` (characterisation): (V_1 ⊠̂ V_2)′_b ≅ V_1′_b ⊗̂ V_2′_b as D(G_1 × G_2, E)-modules.
- `LocallyAnalyticRep.extTensor_functorial` (functoriality): Functorial in both factors; exact in each factor for strict short exact sequences of compact-type representations.
- `LocallyAnalyticRep.twist` (constructor): V ⊗ χ := restriction of V ⊠̂ χ along the diagonal, for a locally analytic character χ.

**Checks.**

- `extTensor_trivial` (degenerate): V ⊠̂ E (trivial one-dimensional representation of the trivial group) is V.
- `extTensor_finiteDim` (computation): For finite-dimensional V_1, V_2 the completed tensor product is the algebraic tensor product with the product action.
- `extTensor_smooth` (compatibility): For smooth admissible π_1, π_2 with the finest locally convex topology, π_1 ⊠̂ π_2 is the smooth external tensor product π_1 ⊗ π_2 of SmoothRepresentationsOfLocalGroups.
- `twist_char_char` (computation): For characters, χ ⊗ χ′ is the product character χχ′.

*Acceptance examples.* For G_2 = 1 and V_2 = E, V_1 ⊗̂ E = V_1.

*Proof sketch.* Completed tensor products of compact-type spaces are of compact type and dual to the completed tensor products of the nuclear Fréchet duals (LocallyAnalyticDistributions L0/compact-type-tensor-products). Use the compact-type Banach presentations and Emerton Proposition 3.6.18, p. 74 (via Propositions 3.5.15 and 3.6.12): completed tensor products of analytic vectors have analytic orbit maps for the product group. Density of elementary tensors alone does not prove this, since analytic vectors need not be closed. Strict exactness and strong-dual compatibility are supplied by the compact-type tensor-product and nuclear-duality theorems. Admissibility is proved only after admissibility has been defined in LR.1/admissible-external-tensor.

*Sources.* [EM17](#references), §1.1, Proposition 1.1.31, p. 18: For semi-complete LB-spaces the natural map from the inductive to the projective tensor product is a topological isomorphism, which is why Ding writes the completed tensor product without specifying it. [DING25](#references), §3.1.3, (3.19) and footnote to ⊗̂, p. 40: Uses ⊗̂_{i} π_1(φ_{F_P,i}, h^i), the completed injective (equivalently projective) tensor product over E, as a representation of L_P(K) = ∏_i GL_{n_i}(K), citing Emerton Proposition 1.1.31. [BHS19](#references), §5.2, p. 390: Writes the Orlik–Strauch representation of a product group G_p = ∏_v G_v as the completed tensor product ⊗̂_v F^{G_v}_{B_v}(…). [EM17](#references), §1.1, Proposition 1.1.32, pp. 18–19: Completed compact-type tensor products and their nuclear Fréchet strong duals are compatible. [EM17](#references), §3.6, Proposition 3.6.18, p. 74: Analytic-vector tensor compatibility supplies analytic orbit maps on the completed tensor product, rather than a closure argument.

*Needs.* `LR.0/locally-analytic-representation`, `LR.0/compact-type-duality`, `LocallyAnalyticDistributions:L0/compact-type-tensor-products`, `LocallyAnalyticDistributions:L0/locally-analytic-product`, `LocallyAnalyticDistributions:L0/projective-tensor-product`, `LocallyAnalyticDistributions:L0/inductive-tensor-product`.

### Examples

- **Rational points of a smooth affine group are a locally analytic group.** For 𝐆 = GL_n the analytic structure is that of the open subset GL_n(L) ⊂ M_n(L) and g = gl_n(L).
- **Rational points of a smooth affine group are a locally analytic group.** For L ≠ ℚ_p and 𝐆 = 𝔾_m, G = L^× has dimension 1 over L and d_L over ℚ_p, and Lie(G) ⊗_{ℚ_p} E ≅ E^{Σ_L}.
- **Rational points of a smooth affine group are a locally analytic group.** For a nontrivial automorphism σ of a finite Galois extension L/ℚ_p, transporting the additive atlas by σ preserves the topological group but changes its L-analytic structure. The canonical statement therefore requires algebraic compatibility.
- **Locally analytic representations.** Every finite-dimensional algebraic representation of 𝐆 over E, restricted to G = 𝐆(L), is locally L-analytic (orbit maps are polynomial in matrix entries).
- **The derived action of the Lie algebra.** On a finite-dimensional algebraic representation the derived action is the differential of the algebraic action (ReductiveGroups Layer 2).
- **The distribution algebra of a locally analytic group.** For compact G the construction returns the Fréchet algebra of ND.1/distribution-algebra.
- **Locally analytic representations are D(G, E)-modules.** For V = C^an(G, E) with left translation, μ ∗ f is the convolution of μ with f (ST02 §3).
- **Schneider–Teitelbaum duality for representations of compact type.** For G compact and V = C^an(G, E), the dual is D(G, E) itself, free of rank one.
- **Continuity of matrix-coefficient maps.** For W = C^an(G, E) and λ = evaluation at 1, F_λ is the identity of C^an(G, E) (up to the inversion convention).
- **Weakly null sequences are null over a spherically complete field.** In c_0(ℕ, E) the unit vectors e_n do not tend to 0 weakly (pair with the bounded sequence (1, 1, …) ∈ ℓ^∞ = c_0′), consistently with ‖e_n‖ = 1.
- **Completed external tensor products of representations.** For G_2 = 1 and V_2 = E, V_1 ⊗̂ E = V_1.

### Dependencies

`LocallyAnalyticDistributions:L0`, `LocallyAnalyticDistributionsPartII:ND.0`, `LocallyAnalyticDistributionsPartII:ND.1`, `ReductiveGroupsPartII:RG2.0`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-3-enveloping-algebra-verma-modules-and-lλ`.

## Layer LR.1: Admissible representations, locally algebraic representations and Ext groups

Coadmissible D(G, E)-modules for non-compact G, admissible and strongly admissible locally analytic representations, the Schneider–Teitelbaum anti-equivalence and the abelian category it gives, locally algebraic representations π ⊗ W, Ext groups computed among abstract D(G, E)-modules with Breuil's identification of Ext¹ with extensions, the dual-number structure of self-extensions and tautological and universal extensions, and Schraen's computation of Ext between locally algebraic representations. The compact distribution algebra D(H,E) is used for finite-generation closure; noncompact D(G,E) is used for the Ext definition. External tensor admissibility is for the product group.

**Coverage:** planned. The finite-E split highest-weight supplier refinement remains an explicit contract for the locally algebraic tensor classification.

#### Coadmissible modules over the distribution algebra of a p-adic group (`coadmissible-module`, definition)

Let G be a locally F-analytic group. A left D(G, E)-module M is coadmissible if, for one (equivalently every) compact open subgroup H ⊆ G, its restriction to D(H, E) is a coadmissible module over the Fréchet–Stein algebra D(H, E) (LocallyAnalyticDistributionsPartII ND.2/coadmissible-module, ND.2/frechet-stein-distribution). It then carries the canonical Fréchet topology of the D(H, E)-module, independent of H, for which D(G, E) acts separately continuously. 𝒞_G denotes the full subcategory of Mod(D(G, E)) of coadmissible modules.

*Hypotheses and conventions.* Independence of H: for H ⊆ H′ compact open, D(H′, E) is finite free over D(H, E), so a D(H′, E)-module is coadmissible iff it is coadmissible over D(H, E) (ST03 Lemma 3.8, via ND.2/coadmissible-theorems).

*Uses.* ST03 §6, Theorem 6.3: the essential image of the dual of admissible representations. Ding, §3.1.1, p. 33: V^∨ is coadmissible over D(H, E) for any compact open H ⊆ GL_n(K). DLB17 §1.1 and §3.2: Schneider–Teitelbaum's Lemma 3.6 on submodules of coadmissible modules.

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

*Acceptance examples.* For G compact, 𝒞_G is the category of coadmissible D(G, E)-modules of ND.2.

*Proof sketch.* Apply ND.2/coadmissible-theorems (the last statement, coadmissibility along a continuous map of Fréchet–Stein algebras with coadmissible target) to D(H, E) → D(H′, E). The canonical topology does not depend on H because D(H ∩ H′, E)-linear maps between coadmissible modules are continuous and strict (ND.2/coadmissible-theorems).

*Sources.* [ST03](#references), §6, definition of coadmissible D(G, K)-modules, p. 31: Calls a D(G, K)-module coadmissible if it is coadmissible over D(H, K) for every compact open H; because D(H′, K) is finite free over D(H, K) for H ⊆ H′, Lemma 3.8 shows one H suffices.

*Needs.* `LocallyAnalyticDistributionsPartII:ND.2/coadmissible-module`, `LocallyAnalyticDistributionsPartII:ND.2/coadmissible-theorems`, `LocallyAnalyticDistributionsPartII:ND.2/frechet-stein-distribution`, `LR.0/distribution-algebra`.

#### Admissible locally analytic representations (`admissible-representation`, definition)

A locally F-analytic representation V of G over E is admissible if V is of compact type and its strong dual V′_b, with the module structure of LR.0/compact-type-duality, is a coadmissible D(G, E)-module whose canonical topology is the strong topology (equivalently, V is admissible as a representation of one, or every, compact open subgroup). It is strongly admissible if moreover V′ is finitely generated over D(H, E) for a compact open H (Emerton). Rep^a_E(G) denotes the full subcategory of admissible representations.

*Hypotheses and conventions.* Compact type is part of the definition; for compact-type spaces Emerton's and Schneider–Teitelbaum's admissibility agree.

*Uses.* Ding, §3.1.1, p. 33: the category in which Ext^1_{GL_n(K)} is computed. Orlik–Strauch, Proposition 4.8, p. 22: F^G_P(M, V) is admissible, and strongly admissible for V of finite length. Emerton, Jacquet II, Definition 0.12: very strongly admissible representations are admissible ones with a Banach embedding. Colmez–Dospinescu–Nizioł, Remark 1.6 (route not in scope): finite length admissible representations of GL_{d+1}.

*API* (namespace `TauCeti.LocallyAnalytic`):

- `IsAdmissible` (data): The predicate on a locally analytic representation of compact type: its strong dual is coadmissible.
- `IsStronglyAdmissible` (data): The dual is finitely generated over D(H, E) for a compact open H.
- `isAdmissible_restrict` (functoriality): Restriction to an open subgroup preserves admissibility; admissibility can be tested on one compact open.
- `IsStronglyAdmissible.isAdmissible` (other): For compact-type V, a finite generating set of V′ gives a continuous surjection D(H,E)^m → V′. The Fréchet open mapping theorem makes it a strict quotient with closed kernel, hence a coadmissible quotient; therefore V is admissible (EM17 Proposition 6.2.4, p. 118).
- `isAdmissible_of_finiteDimensional` (example): Every finite-dimensional locally analytic representation is admissible.
- `isAdmissible_smooth` (compatibility): A smooth representation with the finest locally convex topology is admissible as a locally analytic representation iff it is admissible as a smooth representation (SR.0/admissible).
- `IsTopologicallyIrreducible` (data): V ≠ 0 has no closed G-stable subspaces other than 0 and V; for admissible V this holds iff V′ is a simple D(G, E)-module.

**Checks.**

- `isAdmissible_regular` (computation): For H compact, C^{F-an}(H, E) with left translation is admissible with dual D(H, E) free of rank one.
- `isAdmissible_zero` (degenerate): The zero representation is admissible.
- `not_isAdmissible_compactInduction` (non-example): For G noncompact, the smooth compact induction c-Ind_H^G 1 (with the finest locally convex topology) is not admissible: its H-invariants are infinite-dimensional.
- `isAdmissible_smooth_compat` (compatibility): For π smooth with the finest topology: IsAdmissible π ↔ π admissible in the sense of SmoothRepresentationsOfLocalGroups SR.0/admissible.

*Acceptance examples.* C^{F-an}(H, E) for compact H with left translation is admissible: its dual D(H, E) is free of rank one.

*Proof sketch.* Independence of the compact open subgroup is LR.1/coadmissible-module. A coadmissible module carries a unique Fréchet topology for which the action is continuous (ND.2/coadmissible-theorems), so 'with the strong topology' is a condition only on V, not extra data.

*Sources.* [ST03](#references), §6, definition of admissible G-representations, p. 33; Introduction, p. 1: Defines admissible representations as locally analytic representations on spaces of compact type with coadmissible strong dual; for noncompact G it suffices to test one compact open subgroup. [EM17](#references), §6.1, Definition 6.1.1, p. 110; §6.2, Definition 6.2.1, p. 117: Emerton's admissible and strongly admissible locally analytic representations: complete LB-spaces whose duals are finitely generated over the distribution algebras of analytic open subgroups. [ST03](#references), §6, Theorem 6.6, p. 35: An admissible-smooth representation with the finest locally convex topology is admissible, and an admissible representation with trivial derived action is admissible-smooth.

*Needs.* `LR.0/locally-analytic-representation`, `LR.0/compact-type-duality`, `LR.1/coadmissible-module`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/admissible`.

*Planet:* Admissible locally analytic representation.

#### Schneider–Teitelbaum anti-equivalence (`admissible-anti-equivalence`, theorem)

The functor V ↦ V′_b is an anti-equivalence between Rep^a_E(G) and the category 𝒞_G of coadmissible D(G, E)-modules (with all D(G, E)-linear maps, which are automatically continuous for the canonical topologies).

*Acceptance examples.* Under the anti-equivalence, the trivial representation corresponds to E with augmentation action, and C^an(H, E) to D(H, E).

*Proof sketch.* LR.0/compact-type-duality is an anti-equivalence onto separately continuous D(G, E)-modules on nuclear Fréchet spaces. For D(H,E), the canonical Fréchet topology of a coadmissible module is nuclear by ST03 Lemma 6.1, pp. 31–32, using the compact transition maps of the distribution-algebra presentation. Its action is separately continuous, and module maps are continuous. Restricting to compact opens gives the noncompact statement. Nuclearity is specific to distribution algebras here, not to arbitrary Fréchet–Stein algebras.

*Sources.* [ST03](#references), §6, Theorem 6.3 and its proof, pp. 33–34: The functor from admissible representations to coadmissible modules, V ↦ V′, is an anti-equivalence; the proof restricts the anti-equivalence of ST02 Corollary 3.3 to the essential image. [ST03](#references), §6, Lemma 6.1, pp. 31–32: The canonical topology of a coadmissible distribution module is nuclear Fréchet, which is needed to apply compact-type duality.

*Needs.* `LR.1/admissible-representation`, `LR.1/coadmissible-module`, `LR.0/compact-type-duality`.

*Planet:* Schneider–Teitelbaum anti-equivalence.

#### The abelian category of admissible representations (`admissible-abelian-category`, theorem)

(i) Rep^a_E(G) is abelian; kernels and images of morphisms are the algebraic kernels and images with the subspace topology. (ii) Every morphism is strict with closed image. (iii) A closed G-stable subspace of an admissible representation is admissible, and so is the quotient by it. (iv) Dually, for a coadmissible M and a submodule N, N is coadmissible ⇔ M/N is ⇔ N is closed; for compact open H, a finitely generated D(H,E)-submodule of a coadmissible D(H,E)-module is coadmissible, finitely generated left ideals of D(H,E) are closed, and finitely presented D(H,E)-modules are coadmissible. (v) A topologically irreducible admissible V has simple dual; an admissible V has finite length if V′ is of finite length as a module, and Jordan–Hölder holds in Rep^a_E(G).

*Hypotheses and conventions.* The finite-generation and finite-presentation assertions are over the compact-open algebra D(H,E); finite presentation over noncompact D(G,E) alone does not imply coadmissibility.

*Acceptance examples.* The locally analytic principal series of GL_2(ℚ_p) of a dominant weight has the locally algebraic representation as a closed subrepresentation and an admissible quotient (LR.4).

*Proof sketch.* Transport the abelian structure of 𝒞_G (ND.2/coadmissible-theorems, LR.1/coadmissible-module) through the anti-equivalence LR.1/admissible-anti-equivalence. Strictness: the dual of a coadmissible map is a continuous map between compact-type spaces whose dual is strict, so it is strict by the duality of strict morphisms (LocallyAnalyticDistributions L0/strict-morphisms-quasi-abelian). (iii) and (iv) are ST03 Lemma 3.6 transported; (v) follows from (i) and the artinian/noetherian properties of finite-length objects.

*Sources.* [ST03](#references), §6, Proposition 6.4, p. 34: Admissible representations form an abelian category with algebraic kernels and images, every map is strict with closed image, and the category is closed under passage to closed invariant subspaces. [ST03](#references), §3, Lemma 3.6, p. 11: For a coadmissible module and a submodule, coadmissibility of the submodule, of the quotient, and closedness are equivalent. [DLB17](#references), §1.1, p. 4, and §10, pp. 52, 55–56: Uses these properties of coadmissible modules and admissible representations of GL_2(ℚ_p): finitely generated submodules are coadmissible, finitely generated ideals are closed, maps have closed image.

*Needs.* `LR.1/admissible-anti-equivalence`, `LocallyAnalyticDistributionsPartII:ND.2/coadmissible-theorems`, `LocallyAnalyticDistributions:L0/strict-morphisms-quasi-abelian`.

#### Admissibility of completed external tensor products (`admissible-external-tensor`, theorem)

For admissible locally F-analytic representations V_i of G_i on E-spaces of compact type, the completed external tensor product V_1 ⊠̂_E V_2 is admissible for G_1 × G_2. This asserts external admissibility only; restriction to the diagonal need not preserve admissibility.

*Hypotheses and conventions.* E is a finite extension of ℚ_p; use compatible compact-open distribution-algebra Fréchet–Stein presentations for H_1, H_2 and H_1 × H_2.

*Acceptance examples.* For V_i=C^an(H_i,E), the result is C^an(H_1 × H_2,E), whose dual is the regular distribution module. A product of two infinite-dimensional admissible representations is covered, whereas no inference of admissibility after diagonal restriction is allowed.

*Proof sketch.* The compact-type tensor theorem identifies the strong dual with M_1 ⊗̂_E M_2. For compatible radii, D_r(H_1 × H_2,E) is D_r(H_1,E) ⊗̂_E D_r(H_2,E) by the product chart and power-series norm. The module at radius r is M_{1,r} ⊗̂_E M_{2,r}, finitely generated over the product Banach algebra by pairs of generators. Finite presentations, strict completed tensor products over E, and flat transition base changes identify the radius-transition maps. Taking inverse limits recovers M_1 ⊗̂ M_2 by nuclearity. This is a coadmissible system; apply the anti-equivalence.

*Sources.* [DING25](#references), §3.1.3, (3.19), p. 40: The Levi representation is the completed external tensor product of admissible block representations. [BHS19](#references), §5.2, p. 390: The Orlik–Strauch representation for the product group is expressed as an admissible completed external tensor product. [EM17](#references), §1.1, Proposition 1.1.32, pp. 18–19; §6.1, Theorem 6.1.20, p. 116: Compact-type tensor duality and the coherent distribution-module criterion give the proof route above; the admissibility assertion is derived from these inputs, not quoted as an assertion of Proposition 1.1.32.

*Needs.* `LR.0/completed-external-tensor`, `LR.1/admissible-anti-equivalence`, `LocallyAnalyticDistributionsPartII:ND.2/frechet-stein-distribution`, `LocallyAnalyticDistributionsPartII:ND.2/coadmissible-theorems`, `LocallyAnalyticDistributions:L0/locally-analytic-product`, `LocallyAnalyticDistributions:L0/compact-type-tensor-products`.

#### Locally algebraic representations (`locally-algebraic-representation`, construction)

Let G = 𝐆(L) with 𝐆 split reductive over L and E splitting L, and let W be a finite-dimensional algebraic representation of (Res_{L/ℚ_p}𝐆) ×_{ℚ_p} E over E (equivalently of the E-group ∏_{σ∈Σ_L} 𝐆 ×_{L,σ} E), restricted to G. For a smooth admissible representation π of G over E, π ⊗_E W with the diagonal action and the finest locally convex topology is an admissible locally ℚ_p-analytic representation, called locally algebraic. The locally W-algebraic vectors of a locally analytic V are the images of Hom_g(W, V) ⊗ W → V; V is locally algebraic if it is generated by them. If π is irreducible and W is irreducible then π ⊗ W is topologically irreducible (even simple as an E[G]-module).

*Hypotheses and conventions.* E large enough that the algebraic representations of (Res_{L/ℚ_p}𝐆) ×_{ℚ_p} E are absolutely irreducible over E. π smooth admissible; without admissibility π ⊗ W is still locally analytic but not admissible.

*Uses.* Ding, §3.1.2, p. 34: π_alg(φ, h) = π_sm(φ) ⊗_E L(λ) ≅ I_sm(w(φ)) ⊗_E L(λ), the socle of every PS(w(φ), h). Ding, Proposition 3.3: Ext^1_lalg, the locally algebraic self-extensions. Emerton, Jacquet I, Proposition 4.3.6: J_P(X ⊗ W) ≅ X_N ⊗ W_N. Schraen 2011, Proposition 4.7: Ext groups between locally algebraic representations.

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

*Acceptance examples.* For GL_2(ℚ_p), Sym^k E² ⊗ St is an irreducible infinite-dimensional locally algebraic representation.

*Proof sketch.* π with its finest locally convex topology is an admissible locally analytic representation with trivial derived action (ST03 Theorem 6.6; EM17 Proposition 6.3.2), and the tensor product of an admissible representation with a finite-dimensional locally analytic one is admissible (EM17 Proposition 6.1.5); conversely every admissible locally W-algebraic representation is U ⊗_{End(W)} W with U admissible smooth (EM17 Proposition 6.3.10). Irreducibility (ST01 Prop. 3.4): every nonzero vector can be moved by elements of a small unipotent subgroup into E_λ ⊗ π^U (highest weight line), and E_λ ⊗ v generates E ⊗ π.

*Sources.* [ST01](#references), §3, Proposition 3.4 and its proof, p. 13: If E is an irreducible rational representation and V an irreducible smooth representation then E ⊗ V is simple as a module over the group ring; the proof uses highest weights and smooth vectors. [ST01](#references), §3, Corollary 3.5, p. 14: For split semisimple simply connected G, the U(g)-finite topologically irreducible representations are exactly E ⊗ V with E irreducible algebraic and V irreducible smooth. [DING25](#references), §3.1.2, p. 34: Defines π_alg(φ, h) = π_sm(φ) ⊗_E L(λ), an irreducible locally algebraic representation. [ST03](#references), §6, Theorem 6.6, p. 35: Admissible-smooth representations with the finest locally convex topology are admissible with trivial derived action, and admissible representations with trivial derived action are of this form. [EM17](#references), §6.1, Proposition 6.1.5, p. 112; §6.3, Propositions 6.3.2, 6.3.6, 6.3.10, pp. 122–124: Tensoring an admissible representation with a finite-dimensional one preserves admissibility; admissible U(g)-trivial representations are admissible smooth; V_{W-lalg} is closed with its finest topology; admissible locally W-algebraic representations are U ⊗_B W with U admissible smooth.

*Needs.* `LR.1/admissible-representation`, `LR.0/derived-lie-action`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/admissible`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-character`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-4-the-classification-of-finite-dimensional-irreducibles`.

*Planet:* Locally algebraic representation.

#### Ext groups of admissible locally analytic representations (`ext-groups`, definition)

For admissible locally analytic representations V_1, V_2 of G over E put Ext^i_G(V_1, V_2) := Ext^i_{D(G,E)}(V_2′, V_1′), Ext computed in the abelian category Mod(D(G, E)) of all (abstract) left D(G, E)-modules. Variants: for a character χ of the centre Z(G) through which Z(G) acts on V_1 and V_2, Ext^i_{G,χ} is computed over D(G, E) ⊗_{D(Z(G),E)} χ^{-1}; for locally algebraic V_1, V_2, Ext^1_lalg(V_1, V_2) ⊆ Ext^1_G(V_1, V_2) is the subspace of classes whose extension (LR.1/ext1-extensions) is locally algebraic. Ext^i_G is E-linear, contravariant in V_1 and covariant in V_2.

*Hypotheses and conventions.* Arguments are reversed: the dual is contravariant. Ext is taken among all D(G, E)-modules, not among coadmissible ones; LR.1/ext1-extensions shows that Ext^1 nevertheless classifies extensions of admissible representations. The fixed-character algebra uses χ^{-1} because the chosen left strong dual is contragredient: Z acts on V′ by χ^{-1} when it acts on V by χ.

*Uses.* Ding, Propositions 3.3, 3.6, 3.8, 3.11, 3.12, 3.16, 3.18, 3.19: every dimension count of §3.1. Schraen 2011, Corollaire 4.9: the abutment of the spectral sequence for Ext into a parabolic induction. PadicHodgeParametersInLocallyAnalyticRepresentations, contract LA1: Ext¹ with push-forward, pull-back and the Hom–Ext exact sequences.

*API* (namespace `TauCeti.LocallyAnalytic`):

- `Ext` (data): Ext^i_G(V_1, V_2) := Ext^i_{D(G,E)}(V_2′, V_1′), an E-vector space.
- `Ext.zero_eq_hom` (characterisation): Ext^0_G(V_1, V_2) ≅ Hom_G(V_1, V_2).
- `Ext.pushforward` (functoriality): A morphism V_2 → V_2′ induces Ext^i_G(V_1, V_2) → Ext^i_G(V_1, V_2′), functorially.
- `Ext.pullback` (functoriality): A morphism V_1′ → V_1 induces Ext^i_G(V_1, V_2) → Ext^i_G(V_1′, V_2), functorially.
- `Ext.covariantSequence` (relation): A short exact sequence 0 → U → V → W → 0 in Rep^a_E(G) gives the long exact sequence 0 → Hom(X, U) → Hom(X, V) → Hom(X, W) → Ext^1(X, U) → ⋯.
- `Ext.contravariantSequence` (relation): The long exact sequence in the first variable.
- `Ext.centralChar` (data): Ext^i_{G,χ}, computed over D(G, E) ⊗_{D(Z,E)} χ^{-1}, with the natural map Ext^i_{G,χ} → Ext^i_G.
- `Ext.lalg` (data): Ext^1_lalg(V_1, V_2) ⊆ Ext^1_G(V_1, V_2) for locally algebraic V_1, V_2.

**Checks.**

- `Ext_trivialGroup` (degenerate): For G = 1, Ext^i_G(V_1, V_2) = 0 for i > 0 and Hom_E(V_1, V_2) for i = 0 (finite-dimensional V_i).
- `Ext_Zp_trivial` (computation): For G = ℤ_p and V_1 = V_2 = E trivial, Ext^1_G(E, E) ≅ Hom_cont(ℤ_p, E) = E, one-dimensional.
- `Ext_Qpx_vs_smooth` (non-example): For G = ℚ_p^× and the trivial character, Ext^1_G(1, 1) ≅ Hom(ℚ_p^×, E) is two-dimensional (spanned by the valuation and log_p), while the smooth Ext^1 is one-dimensional (the valuation only): locally analytic Ext is not smooth Ext.
- `Ext_zero_hom` (characterisation): Ext^0_G(V_1, V_2) = Hom_G(V_1, V_2) for admissible V_1, V_2.
- `Ext_central_dual` (computation): For G=ℚ_p^× and χ(x)=x, the strong dual of χ has character x^{-1}. Fixed-character Ext must therefore use the quotient with dual character χ^{-1}; the quotient with χ has no such module.

*Acceptance examples.* Ext^0_G(V_1, V_2) = Hom_G(V_1, V_2) by LR.1/admissible-anti-equivalence.

*Proof sketch.* Mod(D(G, E)) is a Grothendieck abelian category with enough projectives (free modules), so Ext^i is defined (mathlib CategoryTheory.Abelian.Ext over ModuleCat D(G, E)). A strict short exact sequence of admissible representations dualises to a short exact sequence of coadmissible modules (LR.1/admissible-abelian-category), giving the long exact sequences in each variable.

*Sources.* [DING25](#references), §3.1.1, p. 33: Sets Ext^i_{GL_n(K)}(V_1, V_2) := Ext^i_{D(GL_n(K),E)}(V_2^∨, V_1^∨) in the abelian category of abstract D(GL_n(K), E)-modules, and Ext^1_lalg for locally algebraic extensions. [SCH11](#references), §3, Définition 3.1 and (3.2), p. 65: Defines Ext^n_G(V, W) = Ext^n_{M(G)}(W′, V′) in the abelian category of D(G)-modules, with a derived-category description. [SCH11](#references), §4, Corollaire 4.9, (4.38), p. 82: Uses the variant Ext_{G,χ} with fixed central character.

*Needs.* `LR.1/admissible-anti-equivalence`, `LR.0/distribution-algebra`, `mathlib:CategoryTheory.Abelian.Ext`, `mathlib:ModuleCat`.

*Planet:* Ext groups of admissible representations.

#### Ext¹ classifies extensions of admissible representations (`ext1-extensions`, theorem)

For admissible locally ℚ_p-analytic representations V_1, V_2 of G over E (on spaces of compact type), Ext^1_G(V_1, V_2) is canonically isomorphic to the group of Yoneda classes of extensions 0 → V_2 → V → V_1 → 0 in the category of admissible locally ℚ_p-analytic representations of G (strict exact sequences). The same holds for locally σ-analytic representations with D_σ(G, E) in place of D(G, E).

*Acceptance examples.* For G = ℤ_p, the nonsplit extension of E by E with a ↦ (1 a; 0 1) corresponds to the generator of Ext^1(E, E) = E.

*Proof sketch.* An extension of admissible representations dualises to an extension of coadmissible modules, hence a class in Ext^1_{D(G,E)}. Conversely restrict an abstract extension of the duals to D(H,E) for compact open H. Apply the flat Banach-step base changes and compare it with the inverse limit of the resulting extensions. Exactness of the coadmissible inverse-limit rows and a diagram chase recover the original middle module with its canonical topology, as in BR19 Lemma 2.1.1, pp. 10–11. Finite generation at each step alone would not justify this recovery. Dualise the resulting coadmissible extension using LR.1/admissible-anti-equivalence and strictness.

*Sources.* [BR19](#references), §2.1, Lemme 2.1.1 and proof, pp. 10–11: For admissible locally σ-analytic representations Π_1, Π_2 of compact type, the extensions of Π_1 by Π_2 in admissible locally σ-analytic representations are Ext^1 of the duals over D_σ(H, E). [DING25](#references), §3.1.1, p. 33: Cites Breuil's Lemma 2.1.1 to identify Ext^1_{GL_n(K)}(V_1, V_2) with the group of extensions of admissible locally ℚ_p-analytic representations.

*Needs.* `LR.1/ext-groups`, `LR.1/admissible-abelian-category`, `LocallyAnalyticDistributions:L0/compact-type-three-space`, `LocallyAnalyticDistributionsPartII:ND.2/coadmissible-theorems`.

#### Self-extensions as dual-number modules and tautological extensions (`self-extension-dual-numbers`, construction)

(i) For Ṽ ∈ Ext^1_G(V, V), the endomorphism ε : Ṽ ↠ V → V ↪ Ṽ (projection followed by inclusion) satisfies ε² = 0 and makes Ṽ a G-equivariant module over E[ε]/(ε²), free with ker ε = im ε = V. (ii) If Ext^1_G(V_1, V_2) is finite-dimensional and U ⊆ Ext^1_G(V_1, V_2) is a subspace, the tautological extension of V_1 ⊗_E U by V_2 is the extension whose class in Ext^1_G(V_1 ⊗_E U, V_2) = Hom_E(U, Ext^1_G(V_1, V_2)) is the inclusion U ↪ Ext^1_G(V_1, V_2); for U = Ext^1_G(V_1, V_2) it is the universal extension of V_1 ⊗_E Ext^1_G(V_1, V_2) by V_2. (iii) For a locally analytic character χ of an abelian group T and ψ ∈ Hom(T, E), the E[ε]/(ε²)-valued character χ(1 + ψε) is a self-extension of χ, and this gives Hom(T, E) ≅ Ext^1_T(χ, χ) (LR.4/torus-ext).

*Uses.* Ding, §3.1.1 and §3.2.2: the universal extension carries the action of the deformation ring and is matched with a subspace of Π_∞. PadicHodgeParametersInLocallyAnalyticRepresentations PH.5: A_D-actions on universal extensions and the identification of the annihilator with π_min(D). Ding, Lemma 3.5(2): pull-back along a nonsplit self-extension π̃_alg(φ, h) of π_alg(φ, h).

*API* (namespace `TauCeti.LocallyAnalytic`):

- `SelfExt.eps` (data): ε : Ṽ → Ṽ, the composite of the quotient map and the inclusion.
- `SelfExt.eps_sq` (simp): ε ∘ ε = 0.
- `SelfExt.dualNumberModule` (instance): Ṽ is a G-equivariant DualNumber E-module.
- `SelfExt.ker_eq_range` (characterisation): ker ε = range ε = V, so Ṽ is free over E[ε].
- `tautologicalExtension` (constructor): For U ⊆ Ext^1_G(V_1, V_2) finite-dimensional, the extension of V_1 ⊗ U by V_2 representing the inclusion.
- `universalExtension` (constructor): tautologicalExtension for U = Ext^1_G(V_1, V_2).
- `tautologicalExtension_functorial` (functoriality): Pullback along U′ ⊆ U restricts the classifying inclusion. Pushout along f : V_2 → W gives classifying map f_*|_U; identify it with a tautological extension only when this map is injective, or explicitly pull back from its image.
- `deformedCharacter` (constructor): χ(1 + ψε) as a self-extension of χ, for ψ ∈ Hom(T, E).

**Checks.**

- `tautologicalExtension_zero` (degenerate): For U = 0 the tautological extension is V_2 itself (the split extension of 0 by V_2).
- `tautologicalExtension_line` (computation): For U = E·c spanned by one class c, the tautological extension of V_1 ⊗ U ≅ V_1 by V_2 is the extension representing c.
- `SelfExt.split_free` (characterisation): For the split self-extension V ⊕ V, ε(a, b) = (0, a) and V ⊕ V ≅ V ⊗_E E[ε] as E[ε]-modules.
- `deformedCharacter_eps` (computation): On χ(1 + ψε) = E[ε] with t acting by χ(t)(1 + ψ(t)ε), the endomorphism ε is multiplication by ε, and the class in Ext^1_T(χ, χ) is ψ.

*Acceptance examples.* For U′ ⊆ U, pull back the extension along V_1 ⊗ U′ → V_1 ⊗ U. For f : V_2 → W, its pushout represents the map U → Ext¹_G(V_1,W) obtained by applying f_* to the inclusion. If that map has a kernel, it is not automatically the tautological extension indexed by its image; passing to that image changes the quotient and requires a further pullback comparison.

*Proof sketch.* ε² = 0 because the composite V ↪ Ṽ ↠ V is zero; ker ε = V (sub) = im ε by exactness, so Ṽ ≅ V ⊗_E E[ε] as E[ε]-modules after choosing a linear splitting. Ext^1_G(V_1 ⊗ U, V_2) = Hom_E(U, Ext^1_G(V_1, V_2)) for finite-dimensional U by additivity; the tautological extension is the Yoneda representative of the inclusion (LR.1/ext1-extensions).

*Sources.* [DING25](#references), §3.1.1, p. 34: Equips any Ṽ ∈ Ext^1(V, V) with the natural E[ε]/ε²-structure ε : Ṽ ↠ V → V ↪ Ṽ, and defines tautological and universal extensions for subspaces of a finite-dimensional Ext^1. [DING25](#references), §3.1.2, Proposition 3.3 and its proof, pp. 35–36: Uses the deformed characters w(φ)ηz^λ(1 + ψε) and their inductions as elements of Ext^1.

*Needs.* `LR.1/ext1-extensions`, `LR.1/ext-groups`, `mathlib:DualNumber`.

#### Ext groups between locally algebraic representations (`locally-algebraic-ext`, theorem)

Let G = 𝐆(L) with 𝐆 split reductive, F_λ, F_μ irreducible finite-dimensional algebraic representations of (Res_{L/ℚ_p}𝐆) ×_{ℚ_p} E of highest weights λ, μ, and W_1, W_2 smooth admissible representations of G. (1) If λ ≠ μ then Ext^n_G(F_λ ⊗ W_1, F_μ ⊗ W_2) = 0 for all n. (2) If W_1, W_2 have trivial central character and i_0 is the least i with Ext^i_{∞,1}(W_1, W_2) ≠ 0 (smooth Ext with trivial central character), then Ext^n_{G,λ}(F_λ ⊗ W_1, F_λ ⊗ W_2) ≅ Ext^{i_0}_{∞,1}(W_1, W_2) for n = i_0 and vanishes for n ≠ i_0, n ≤ i_0 + 2. In particular, for central character fixed, Ext^1_{lalg,Z}(π_alg, π_alg) → Ext^1_{G,Z}(π_alg, π_alg) is an isomorphism.

*Hypotheses and conventions.* Central characters fixed in (2); E large enough to split the algebraic representations.

*Acceptance examples.* For GL_2(ℚ_p), Ext^1(Sym^k ⊗ 1, Sym^{k'} ⊗ 1) = 0 for k ≠ k'.

*Proof sketch.* The centre Z(g) of U(g ⊗ E) acts on F_λ ⊗ W through the infinitesimal character of λ (LieHighestWeight Layer 7); distinct dominant λ ≠ μ have distinct infinitesimal characters, and an element of Z(g) acting by different scalars kills the Ext groups (the standard central-character argument, as for SR.0:derived-extension/central-ext-vanishing). For λ = μ, Schraen computes Ext_{G,λ} through the Hochschild–Serre spectral sequence for g ⊂ D(G) and Lie algebra cohomology of F_λ, which is concentrated in degrees where it reduces to smooth Ext (SCH11 Prop. 4.7 proof).

*Sources.* [SCH11](#references), §4, Proposition 4.7, pp. 79–80: Ext between F_λ ⊗ W_1 and F_μ ⊗ W_2 vanishes for λ ≠ μ; with trivial central characters, Ext_{G,λ} is computed by the first nonvanishing smooth Ext in a range of degrees. [DING25](#references), §3.1.2, proof of Proposition 3.3, (3.6), p. 36: Cites Schraen Proposition 4.7 for Ext^1_{lalg,Z}(π_alg, π_alg) ≅ Ext^1_{GL_n(K),Z}(π_alg, π_alg).

*Needs.* `LR.1/ext-groups`, `LR.1/locally-algebraic-representation`, `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension/central-ext-vanishing`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-7-the-center-of-ul-harish-chandra-freudenthal-and-serres-relations`.

### Examples

- **Coadmissible modules over the distribution algebra of a p-adic group.** For G compact, 𝒞_G is the category of coadmissible D(G, E)-modules of ND.2.
- **Admissible locally analytic representations.** C^{F-an}(H, E) for compact H with left translation is admissible: its dual D(H, E) is free of rank one.
- **Schneider–Teitelbaum anti-equivalence.** Under the anti-equivalence, the trivial representation corresponds to E with augmentation action, and C^an(H, E) to D(H, E).
- **The abelian category of admissible representations.** The locally analytic principal series of GL_2(ℚ_p) of a dominant weight has the locally algebraic representation as a closed subrepresentation and an admissible quotient (LR.4).
- **Admissibility of completed external tensor products.** For V_i=C^an(H_i,E), the result is C^an(H_1 × H_2,E), whose dual is the regular distribution module.
- **Admissibility of completed external tensor products.** A product of two infinite-dimensional admissible representations is covered, whereas no inference of admissibility after diagonal restriction is allowed.
- **Locally algebraic representations.** For GL_2(ℚ_p), Sym^k E² ⊗ St is an irreducible infinite-dimensional locally algebraic representation.
- **Ext groups of admissible locally analytic representations.** Ext^0_G(V_1, V_2) = Hom_G(V_1, V_2) by LR.1/admissible-anti-equivalence.
- **Ext¹ classifies extensions of admissible representations.** For G = ℤ_p, the nonsplit extension of E by E with a ↦ (1 a; 0 1) corresponds to the generator of Ext^1(E, E) = E.
- **Self-extensions as dual-number modules and tautological extensions.** For U′ ⊆ U, pull back the extension along V_1 ⊗ U′ → V_1 ⊗ U. For f : V_2 → W, its pushout represents the map U → Ext¹_G(V_1,W) obtained by applying f_* to the inclusion. If that map has a kernel, it is not automatically the tautological extension indexed by its image; passing to that image changes the quotient and requires a further pullback comparison.
- **Ext groups between locally algebraic representations.** For GL_2(ℚ_p), Ext^1(Sym^k ⊗ 1, Sym^{k'} ⊗ 1) = 0 for k ≠ k'.

### Dependencies

`LocallyAnalyticDistributions:L0`, `LocallyAnalyticDistributionsPartII:ND.2`, `LocallyAnalyticRepresentationsOfLocalGroups:LR.0`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`, `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-4-the-classification-of-finite-dimensional-irreducibles`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-7-the-center-of-ul-harish-chandra-freudenthal-and-serres-relations`.

## Layer LR.2: Locally analytic vectors of Banach representations and their derived functors

Admissible Banach representations of non-compact groups, G_n-analytic and locally analytic vectors, the Schneider–Teitelbaum theorem (density, strong admissibility, exactness), very strongly admissible representations, and Pan's derived functors R^iLA with the long exact sequence and the strong LA-acyclicity of admissible Banach representations.

**Coverage:** partial. Supply the analytic-vector C^{(m)} filtration comparison and strict cochain/tensor argument in Pan Theorem 2.2.3, plus the compact-group derived cohomology comparison of RJRC22 Theorem 1.5. See the derived-analytic-vector proof gap.

#### Admissible Banach representations of p-adic groups (`admissible-banach-representation`, definition)

Let G be a locally ℚ_p-analytic group and E/ℚ_p finite with ring of integers O_E. A Banach representation of G over E is an E-Banach space B with a G-action by continuous linear maps such that G × B → B is continuous. It is admissible if its restriction to one (equivalently every) compact open subgroup H is admissible in the sense of LocallyAnalyticDistributionsPartII ND.6/banach-iwasawa-duality, i.e. B′ is finitely generated over E[[H]] = E ⊗_{O_E} O_E[[H]]; it is unitary if it has a G-invariant open bounded lattice. Ban^adm_E(G) is the category of admissible Banach representations with continuous G-maps; it is abelian, every morphism is strict, and B ↦ B′ is an anti-equivalence of the unitary admissible part with finitely generated E[[H]]-modules carrying a compatible G-action (Schneider–Teitelbaum).

*Hypotheses and conventions.* Admissibility does not require unitarity; finite-dimensional continuous representations are admissible Banach representations. Independence of H: for H′ ⊆ H open, E[[H]] is finite free over E[[H′]].

*Uses.* ST03 §7, Theorem 7.1: the source category of V ↦ V_an. BHS, §5.1–5.2: Π̂ = Ŝ(U^p, L)_{m^S}, an admissible unitary Banach representation of G_p, and its locally analytic vectors. Pan I, §2.2: R^iLA of admissible Banach representations. Emerton, Jacquet II, Definition 0.12: the Banach target of a very strongly admissible representation.

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

*Acceptance examples.* For compact G, Ban^adm_E(G) is the category of ND.6/banach-iwasawa-duality.

*Proof sketch.* For compact open H′ ⊆ H, E[[H]] is a finite free E[[H′]]-module, so finite generation of B′ over E[[H]] and over E[[H′]] are equivalent; this gives independence of H. Abelianness and strictness are ND.6/banach-iwasawa-duality for compact open H together with the open mapping theorem (LocallyAnalyticDistributions L0/banach-open-mapping-lifts).

*Sources.* [ST02B](#references), §3, definition of admissibility and Lemma 3.4, pp. 13–14: For compact G, a Banach representation is admissible when (E/L)^H is of cofinite type for a bounded invariant lattice L; equivalently the dual is finitely generated over K[[G]]. [ST03](#references), §7, p. 38: Works with admissible Banach representations of a (not necessarily compact) group G, tested on a compact open subgroup. [EM17](#references), §6.2, Proposition 6.2.4, p. 118: Considers admissible continuous representations of G on Banach spaces.

*Needs.* `LocallyAnalyticDistributionsPartII:ND.6/banach-iwasawa-duality`, `LocallyAnalyticDistributions:L0/banach-open-mapping-lifts`, `LR.0/rational-points-analytic-group`.

#### Analytic and locally analytic vectors of a Banach representation (`analytic-vectors`, construction)

Let B be a Banach representation of G over E, G_0 ⊆ G a compact open subgroup carrying an integral saturated p-valuation with an ordered basis (LocallyAnalyticDistributionsPartII ND.0), and G_n = G_0^{p^n}. C^an(G_n, B) is the Banach space of B-valued functions given in the coordinates of the ordered basis by power series Σ b_k x^k with p^{n|k|} b_k → 0, normed by sup ‖p^{n|k|} b_k‖, and C^an(G_n, B) ≅ C^an(G_n, ℚ_p) ⊗̂_{ℚ_p} B. The G_n-analytic vectors B^{G_n-an} are the vectors whose orbit map lies in C^an(G_n, B); equivalently B^{G_n-an} = (C^an(G_n, ℚ_p) ⊗̂_{ℚ_p} B)^{G_n} for the diagonal action, embedded in B by evaluation at 1, with the norm ‖·‖_{G_n}. B^{la} := colim_n B^{G_n-an} with the inductive-limit topology is the space of locally analytic vectors; it is G-stable, independent of G_0, carries a continuous injection B^la → B, and is a locally analytic representation of G on an LB-space. The derived g-action on B^{G_n-an} is bounded: ‖D(x)‖_{G_n} ≤ C_{D,n}‖x‖_{G_n}.

*Hypotheses and conventions.* Fix the integral saturated p-valued subgroup G_0. The spaces and norms are independent of its ordered basis (Pan §2.1.1, p. 11); changing G_0 changes the presentation but not B^la. The stated bounded Lie action on a radius space uses n ≥ 1 (Lemma 2.1.8).

*Uses.* ST03 §7, Theorem 7.1: V_an of an admissible Banach representation. BHS §5.1–5.2: Π^an, the locally ℚ_p-analytic vectors of completed cohomology. DLB17 §1.1 and §3.2: density of locally analytic vectors in admissible Banach representations of GL_2(ℚ_p). Pan I §2.2 and LocallyAnalyticCompletedCohomology LA.0–LA.3: LA(B) = B^la, the zeroth derived locally analytic functor.

*API* (namespace `TauCeti.LocallyAnalytic`):

- `analyticVectors` (data): B^{G_n-an} with its norm ‖·‖_{G_n}, a Banach space continuously injecting into B.
- `analyticVectors_mono` (relation): B^{G_n-an} ⊆ B^{G_{n+1}-an} and ‖v‖_{G_{n+1}} ≤ ‖v‖_{G_n}.
- `laVectors` (data): B^la := colim_n B^{G_n-an}, an LB-space with a continuous G-equivariant injection into B.
- `laVectors_isLocallyAnalytic` (other): B^la is a locally analytic representation of G.
- `laVectors_independent` (characterisation): B^la does not depend on G_0 or on the ordered basis.
- `laVectors_functor` (functoriality): B ↦ B^la is a left exact functor from Banach representations to locally analytic representations.
- `laVectors_eq_of_isLocallyAnalytic` (characterisation): v ∈ B^la iff the orbit map g ↦ g·v is locally analytic B-valued.
- `lieAction_bounded` (other): For n ≥ 1 and x ∈ g, x acts boundedly on B^{G_n-an}; the bound may depend on x and n.

**Checks.**

- `laVectors_finiteDim` (degenerate): For finite-dimensional B, B^la = B.
- `laVectors_trivial` (degenerate): For the trivial action, B^{G_n-an} = B for all n and B^la = B.
- `laVectors_continuousFunctions` (computation): For G = ℤ_p and B = C(ℤ_p, E) with translation, B^la = C^la(ℤ_p, E), the locally analytic functions (Amice).
- `laVectors_proper` (non-example): For B = C(ℤ_p, E), B^la ≠ B: a continuous function that is not locally analytic is not a locally analytic vector.
- `analyticNorm_basis_independent` (computation): Two ordered bases of the same saturated p-valued G_0 give the same G_n-analytic norm under the integral coordinate changes of Pan §2.1.1, p. 11. This does not assert equality for unrelated G_0.

*Acceptance examples.* For B finite-dimensional, B^la = B; for B = C(ℤ_p, E) with translation, B^la = C^la(ℤ_p, E) (Amice, LocallyAnalyticDistributions L0).

*Proof sketch.* Independence of the ordered basis: coordinates of the first and second kind differ by power series with ℤ_p-coefficients (Pan I §2.1.1, via SCHN11 §34). B^{G_n-an} ⊆ B^{G_{n+1}-an} with ‖·‖_{G_{n+1}} ≤ ‖·‖_{G_n} (Pan I Lemma 2.1.5), so the colimit is an LB-space; G-stability follows by conjugating G_0. Orbit maps of vectors of B^{G_n-an} are analytic on cosets of G_n, so B^la is locally analytic (LR.0/locally-analytic-representation); the Lie bound is Pan I Lemma 2.1.8.

*Sources.* [PAN22](#references), §2.1.1, §2.1.4, Lemma 2.1.5, Definition 2.1.6, Remark 2.1.7, Lemma 2.1.8, pp. 10–12: Defines C^an(G_n, B), the G_n-analytic vectors as invariants of C^an(G_n, B) or by analyticity of orbit maps, B^la = ⋃ B^{G_n-an} with the direct-limit topology, independence of G_0, and the bound on the Lie action. [EM17](#references), §3.5, Definition 3.5.3, p. 64: Defines V_la as the locally convex inductive limit of V_{H-an} over analytic open subgroups H. [ST03](#references), §7, definition of V_an, p. 38: Calls v analytic if its orbit map is locally analytic, and writes V_an for these vectors.

*Needs.* `LR.2/admissible-banach-representation`, `LR.0/locally-analytic-representation`, `LocallyAnalyticDistributionsPartII:ND.0/p-valued-analytic-structure`, `LocallyAnalyticDistributionsPartII:ND.0/ordered-basis-chart`, `LocallyAnalyticDistributions:L0/locally-analytic-function-space`, `LocallyAnalyticDistributions:L0/locally-convex-limits`.

*Planet:* Locally analytic vectors.

#### Locally analytic vectors of admissible Banach representations (`admissible-banach-analytic-vectors`, theorem)

Let B be an admissible Banach representation of G over E. Then: (i) B^la is dense in B; (ii) B^la is a strongly admissible locally analytic representation of G; (iii) as a D(H,E)-module, (B^la)′ ≅ D(H,E) ⊗_{E[[H]]} B′ for a compact open H, with the compatible G-action inherited from B; (iv) the functor Ban^adm_E(G) → Rep^a_E(G), B ↦ B^la, is exact.

*Acceptance examples.* For B = C(G_0, E) (G_0 compact), B^la = C^la(G_0, E) with dual D(G_0, E) = D(G_0, E) ⊗_{E[[G_0]]} E[[G_0]].

*Proof sketch.* Reduce to G compact. The dual of B^la is computed Banach level by level; D(G, E) is (faithfully) flat over E[[G]] (ND.2/faithful-flatness), which gives (iii) and the exactness (iv). (iii) shows (B^la)′ is finitely generated over D(G, E), hence (ii); faithful flatness and the injectivity E[[G]] ⊂ D(G, E) (ND.1/iwasawa-to-distributions) give injectivity of B′ → (B^la)′, i.e. density (i).

*Sources.* [ST03](#references), §7, Theorem 7.1, p. 38: For compact G, Theorem 7.1 gives density, strong admissibility, the dual D(G,E) ⊗_{E[[G]]} B′, and exactness. For general G these conclusions are checked after restriction to compact open H; the displayed base change then uses D(H,E). [EM17](#references), §6.2, Proposition 6.2.4, p. 118: If V is an admissible continuous Banach representation then V_la is strongly admissible. [DLB17](#references), §1.1, p. 4: Uses the density of Π^an in Π for admissible Banach representations of GL_2(ℚ_p).

*Needs.* `LR.2/analytic-vectors`, `LR.2/admissible-banach-representation`, `LR.1/admissible-representation`, `LocallyAnalyticDistributionsPartII:ND.2/faithful-flatness`, `LocallyAnalyticDistributionsPartII:ND.1/iwasawa-to-distributions`.

*Planet:* Schneider–Teitelbaum density theorem.

#### Very strongly admissible representations (`very-strongly-admissible`, definition)

An admissible locally analytic representation V of G over E is very strongly admissible if there is a continuous G-equivariant E-linear injection V → B into an admissible Banach representation B of G. Very strongly admissible representations are strongly admissible; for compact G the converse holds; closed subrepresentations of very strongly admissible representations are very strongly admissible; and for every admissible Banach representation Π, Π^la (= Π^an) is very strongly admissible.

*Hypotheses and conventions.* The Banach target need not be unitary.

*Uses.* Emerton, Jacquet II, Theorem 0.13: the target of the adjunction must be very strongly admissible. Ding, proof of Lemma 3.2, pp. 34–35: irreducible constituents of PS(w(φ), h) are very strongly admissible, as subrepresentations of principal series (Emerton, Jacquet II, Proposition 2.1.2). Breuil, socle II, Théorème 4.3: the adjunction for Orlik–Strauch representations needs Π very strongly admissible.

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

*Acceptance examples.* Every finite-dimensional locally analytic representation is very strongly admissible (it is itself an admissible Banach representation).

*Proof sketch.* Strong admissibility: the injection V → B factors through B^la, which is strongly admissible (LR.2/admissible-banach-analytic-vectors), and V is a closed subrepresentation of it (morphisms of admissible representations have closed image, LR.1/admissible-abelian-category). Π^an ⊂ Π is the required injection for Π admissible Banach.

*Sources.* [EMJ2](#references), Introduction, Definition 0.12 and the remark after it, p. 3: Defines very strongly admissible as admitting a continuous equivariant injection into an admissible continuous Banach representation; such representations are strongly admissible, and conversely for compact G (citing EM17 Proposition 6.5.9). [BHS19](#references), §5.2, p. 390: Takes Π̂^an, a very strongly admissible locally ℚ_p-analytic representation in the sense of Emerton's Definition 0.12, as the input of Emerton's adjunction.

*Needs.* `LR.1/admissible-representation`, `LR.2/admissible-banach-representation`, `LR.2/admissible-banach-analytic-vectors`.

*Planet:* Very strongly admissible representation.

#### Derived functors of locally analytic vectors (`derived-analytic-vectors`, definition)

For a Banach representation B of G (with G_0, G_n as in LR.2/analytic-vectors) put R^iLA(B) := colim_n H^i_cont(G_n, B ⊗̂_{ℚ_p} C^an(G_n, ℚ_p)), continuous group cohomology for the diagonal action. R^0LA(B) = B^la. B is LA-acyclic if R^iLA(B) = 0 for all i ≥ 1, and strongly LA-acyclic if for every i ≥ 1 the direct system (H^i_cont(G_n, B ⊗̂ C^an(G_n, ℚ_p)))_n is essentially zero (for each n the transition map to some m ≥ n is zero). These do not depend on G_0.

*Hypotheses and conventions.* Continuous cohomology of the profinite group G_n with coefficients in a Banach representation (mathlib continuousCohomology over TopModuleCat).

*Uses.* Pan I, Lemma 2.2.2 and Theorem 2.2.3: long exact sequences and acyclicity of admissible representations. BCGP25, Remark 2.2.28: the derived functor V ↦ V^{Rla} of solid representations (LR.3/solid-analytic-vectors). LocallyAnalyticCompletedCohomology LA.0–LA.2: acyclicity of locally analytic vectors on covers by small opens. CompletedCohomologyPartII CC.6/analytic-classical-comparison: the generic derived locally analytic functor of the classical comparison.

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

*Acceptance examples.* For finite-dimensional continuous B, Pan Theorem 2.2.3, p. 14, implies higher R^iLA(B)=0. Analytic functions are not the full continuous coinduced module, so a continuous Shapiro argument alone would not prove this.

*Proof sketch.* H^0_cont(G_n, B ⊗̂ C^an(G_n)) = (C^an(G_n, B))^{G_n} = B^{G_n-an}, so R^0LA(B) = B^la. Independence of G_0: G_n for two choices are cofinal in each other, and the systems are isomorphic as ind-objects.

*Sources.* [PAN22](#references), §2.2, Definition 2.2.1, pp. 12–13: Defines R^iLA(B) as the colimit over n of H^i_cont(G_n, B ⊗̂ C^an(G_n, ℚ_p)), with LA-acyclic and strongly LA-acyclic B; these do not depend on G_0. [RJRC22](#references), §1.2.3, Theorem 1.5 and Corollary 1.6, p. 5; §4.4, Definition 4.40, p. 39: Defines the derived locally analytic vectors C^{Rla} of solid representations, whose cohomology recovers R^iLA for Banach representations, and compares continuous cohomology of V and of V^la when V has no higher locally analytic vectors.

*Needs.* `LR.2/analytic-vectors`, `mathlib:continuousCohomology`, `mathlib:TopModuleCat`, `LocallyAnalyticDistributions:L0/projective-tensor-product`.

*Planet:* Derived locally analytic vectors.

#### Long exact sequence of derived locally analytic vectors (`la-long-exact-sequence`, theorem)

(1) A short exact sequence 0 → M_0 → M_1 → M_2 → 0 of Banach representations of G with continuous (hence strict) G-maps gives a long exact sequence 0 → M_0^la → M_1^la → M_2^la → R^1LA(M_0) → R^1LA(M_1) → R^1LA(M_2) → ⋯. (2) For a bounded complex M^• of Banach representations with strict G-maps, if each M^q and each H^q(M^•) is LA-acyclic then H^q(M^•)^la = H^q((M^•)^la). (3) If 0 → B → M^0 → M^1 → ⋯ is exact with strict maps and each M^q is LA-acyclic, then R^iLA(B) = H^i((M^•)^la); if moreover each M^q is strongly LA-acyclic and the systems (H^i((M^•)^{G_n-an}))_n are essentially zero for i ≥ 1, then B is strongly LA-acyclic.

*Acceptance examples.* Applied to 0 → B → C(G_0, E)^{⊕d} → C → 0 for admissible B it is the first step of the proof of LR.2/admissible-la-acyclic.

*Proof sketch.* Strictness bounds the p-torsion in the cohomology of the unit balls, so M^• ⊗̂ C^an(G_n, ℚ_p) stays exact; taking continuous G_n-cohomology and the colimit over n gives (1). (2) and (3) follow from (1) by induction on the length, showing kernels and images are LA-acyclic.

*Sources.* [PAN22](#references), §2.2, Lemma 2.2.2 and its proof, p. 13: Gives the long exact sequence for strict short exact sequences of Banach representations, the comparison of cohomology of complexes with locally analytic vectors under LA-acyclicity, and the acyclic-resolution computation of R^iLA.

*Needs.* `LR.2/derived-analytic-vectors`, `LocallyAnalyticDistributions:L0/banach-open-mapping-lifts`, `mathlib:continuousCohomology`.

#### Admissible Banach representations are strongly LA-acyclic (`admissible-la-acyclic`, theorem)

Every admissible Banach representation B of G is strongly LA-acyclic, and so is B ⊗̂_{ℚ_p} M for every ℚ_p-Banach space M with trivial G-action. If G is compact, the inclusion B^la → B also induces H^i_cont(G, B^la) ≅ H^i_cont(G, B) for all i (continuous cohomology of B equals that of its locally analytic vectors).

*Hypotheses and conventions.* The cohomology comparison here is restricted to compact G, as in RJRC22 Theorem 1.5 and Corollary 1.6. The strong LA-acyclicity statement is local on compact opens and applies to general G.

*Acceptance examples.* For B = C(G_0, E), R^iLA(B) = 0 for i ≥ 1 and B^la = C^la(G_0, E).

*Proof sketch.* Embed B G_0-equivariantly into C(G_0, ℚ_p)^{⊕d} with admissible quotient C (admissibility). C(G_0, ℚ_p) ≅ C(G_n, ℚ_p)^{⊕d_n} as G_n-representations, so its H^1 with coefficients in ⊗̂ C^an(G_n) vanishes by Shapiro's lemma; the long exact sequence (LR.2/la-long-exact-sequence) and Colmez–Dospinescu's comparison of G_n-analytic vectors with the C^{(m)} filtration show the transition maps H^1 → H^1 vanish; induct on i. For B ⊗̂ M, H^•_cont(G_n, B ⊗̂ M) = H^•_cont(G_n, B) ⊗̂ M because the cochain complex of B is strict (finite generation of H^•_cont(G_n, B°) over ℤ_p). The compact-group cohomology comparison uses the derived locally analytic vector/cohomology theorem of RJRC22 Theorem 1.5 and Corollary 1.6, p. 5, followed by the vanishing of higher analytic vectors. This is a separate non-routine comparison input; see the recorded proof contract. No noncompact comparison is inferred merely by restriction.

*Sources.* [PAN22](#references), §2.2, Theorem 2.2.3 and Corollary 2.2.4 with proofs, pp. 13–14: Admissible Banach representations are strongly LA-acyclic, via an embedding into C(G_0, ℚ_p)^{⊕d}, Shapiro's lemma and Colmez–Dospinescu's control of analytic vectors; the statement persists after completed tensor product with a trivial Banach space. [RJRC22](#references), §1.2.3, Corollary 1.6, p. 5: If V has no higher locally analytic vectors (as for admissible representations) then H^i_cont(G, V) = H^i_cont(G, V^la).

*Needs.* `LR.2/la-long-exact-sequence`, `LR.2/admissible-banach-representation`, `mathlib:continuousCohomology`.

### Examples

- **Admissible Banach representations of p-adic groups.** For compact G, Ban^adm_E(G) is the category of ND.6/banach-iwasawa-duality.
- **Analytic and locally analytic vectors of a Banach representation.** For B finite-dimensional, B^la = B; for B = C(ℤ_p, E) with translation, B^la = C^la(ℤ_p, E) (Amice, LocallyAnalyticDistributions L0).
- **Locally analytic vectors of admissible Banach representations.** For B = C(G_0, E) (G_0 compact), B^la = C^la(G_0, E) with dual D(G_0, E) = D(G_0, E) ⊗_{E[[G_0]]} E[[G_0]].
- **Very strongly admissible representations.** Every finite-dimensional locally analytic representation is very strongly admissible (it is itself an admissible Banach representation).
- **Derived functors of locally analytic vectors.** For finite-dimensional continuous B, Pan Theorem 2.2.3, p. 14, implies higher R^iLA(B)=0. Analytic functions are not the full continuous coinduced module, so a continuous Shapiro argument alone would not prove this.
- **Long exact sequence of derived locally analytic vectors.** Applied to 0 → B → C(G_0, E)^{⊕d} → C → 0 for admissible B it is the first step of the proof of LR.2/admissible-la-acyclic.
- **Admissible Banach representations are strongly LA-acyclic.** For B = C(G_0, E), R^iLA(B) = 0 for i ≥ 1 and B^la = C^la(G_0, E).

### Dependencies

`LocallyAnalyticDistributions:L0`, `LocallyAnalyticDistributionsPartII:ND.0`, `LocallyAnalyticDistributionsPartII:ND.1`, `LocallyAnalyticDistributionsPartII:ND.2`, `LocallyAnalyticDistributionsPartII:ND.6`, `LocallyAnalyticRepresentationsOfLocalGroups:LR.0`, `LocallyAnalyticRepresentationsOfLocalGroups:LR.1`.

## Layer LR.3: Solid representations of p-adic groups

Boxer–Calegari–Gee–Pilloni §2.2: solid representations of Stein analytic groups by coaction and the distribution algebra D(𝔾), the Banach comparison, solid representations of locally profinite groups through the solidified group ring, smooth and λ-smooth representations with the comparison after forgetting the group topology and enough injectives, solid locally analytic vectors and their derived functor, and integrable LB representations of Lie algebras. Coefficients retain their p-adic topology. Integrable LB objects are modules over Û(g), with actions on shrinking group germs.

**Coverage:** partial. Discharge the SolidAnalyticRings stage-level contracts and the separate solid functional-analysis contract; identify the classical derived Banach analytic vectors with the solid derived construction.

#### Solid representations of an analytic group (`solid-analytic-group-representation`, definition)

Let 𝔾 be a Stein analytic group over Spa(E, O_E) (the analytification of an affine algebraic group over E, or a quasi-compact affinoid open subgroup of one; quasi-Stein and Stein as in AdicSpacesPartII R3), with Fréchet Hopf algebra of functions O_𝔾 ∈ Mod(E). A solid representation of 𝔾 is a solid E-vector space V with a coaction c : V → V ⊗_E O_𝔾 satisfying coassociativity (c ⊗ id) ∘ c = (id ⊗ μ) ∘ c and counitality (id ⊗ e) ∘ c = id; Mod_𝔾(E) denotes their category, B_𝔾(E) and LB_𝔾(E) the full subcategories of representations on Banach and LB spaces. The distribution algebra is D(𝔾) := Hom_E(O_𝔾, E) = O_𝔾^∨, with product dual to the comultiplication, and every V ∈ Mod_𝔾(E) is a D(𝔾)-module through V ⊗ D(𝔾) → V ⊗ O_𝔾 ⊗ D(𝔾) → V. Four predicates on a group action are kept distinct: an analytic 𝔾-action (a coaction as above), a continuous action of the locally profinite group 𝔾(E) (LR.3/solid-group-representation), analyticity at a Banach stage (LR.3/solid-analytic-vectors), and an algebraic coaction (ReductiveGroups Layer 1).

*Hypotheses and conventions.* Solid conventions (BCGP25 §2.2, recalled from Rodrigues Jacinto–Rodríguez Camargo): a fixed strongly inaccessible cardinal κ bounds all profinite sets; E/ℚ_p finite; Mod(E) is the category of solid E-vector spaces, modules over the analytic ring E_■ = (E, O_E)_■ of SolidAnalyticRings SA.4; tensor products and internal Homs are solid. This is not the predicate IsSolid on arbitrary condensed modules over a general ring.

*Uses.* BCGP25 §2.2.19: Banach representations of a quasi-compact 𝔾 are the same as Banach D(𝔾)-modules. BCGP25 §2.2.27: V^{M_r-an} = H⁰(M_r, O_{𝔾_r} ⊗ V), the analytic vectors for the polydisc subgroups 𝔾_r. BCGP25 §3.4.2: integrable LB Lie representations integrate to shrinking 𝔾_r.

*API* (namespace `TauCeti.LocallyAnalytic.Solid`):

- `SolidRep` (constructor): A solid E-vector space with a coassociative counital coaction V → V ⊗ O_𝔾.
- `SolidRep.toDistModule` (functoriality): A faithful functor Mod_𝔾(E) → Mod(D(𝔾)) given by pairing the coaction with distributions. Exactness requires the flatness and underlying-exactness inputs of the solid supplier contract; it is not part of this assertion.
- `SolidRep.ofAlgebraic` (coercion): An algebraic representation of an affine algebraic group, with the analytified coaction.
- `SolidRep.Banach` (data): The full subcategory B_𝔾(E) of representations on Banach spaces.
- `SolidRep.restrict` (functoriality): Restriction along an open analytic subgroup 𝔾′ ⊆ 𝔾 (pull back along O_𝔾 → O_{𝔾′}).

**Checks.**

- `SolidRep.trivial` (degenerate): The trivial representation E with c(v) = v ⊗ 1 is a solid representation, and D(𝔾) acts on it through the augmentation (evaluation at e).
- `SolidRep.algebraic_compat` (compatibility): For 𝔾 = 𝔾_m^an and V = E with c(v) = v ⊗ T^k, the restriction to ℤ_p^× = 𝔾_m(ℤ_p)-points is the algebraic character x ↦ x^k.
- `SolidRep.regular` (computation): For V=O_𝔾 and coaction the Hopf comultiplication, a distribution acts by pairing one tensor factor with a translation kernel. This is the distribution action on functions, not a convolution product of two functions.
- `SolidRep.not_profinite_rep` (non-example): A representation of the locally profinite group 𝔾(E) need not come from a coaction of 𝔾: the character of ℤ_p trivial on p²ℤ_p and nontrivial on pℤ_p is smooth but not analytic for 𝔾 = ℤ_p + p𝔻, since a rigid function on the disc p𝔻 that is locally constant on pℤ_p is constant.

*Acceptance examples.* Analytifying an algebraic coaction gives a solid analytic representation. The converse for arbitrary finite-dimensional analytic representations is not asserted; for a small additive analytic disc, nonpolynomial exponential characters provide analytic examples.

*Proof sketch.* The coaction axioms are those of an algebraic comodule (ReductiveGroups Layer 1) with O_𝔾 a Fréchet Hopf algebra in Mod(E). The D(𝔾)-module structure is the composite of the coaction with evaluation O_𝔾 ⊗ D(𝔾) → E, associative because the product of D(𝔾) is dual to μ.

*Sources.* [BCGP25](#references), §2.2.15–2.2.18, Definition 2.2.17 and Remark 2.2.18, pp. 21–22: Recalls algebraic representations as comodules, defines quasi-Stein and Stein adic spaces, and for a Stein analytic group defines solid representations by an O_G-coaction, the distribution algebra D(G) = Hom(O_G, E) and the functor to D(G)-modules. [RJRC22](#references), §1.2.2, pp. 3–4: Defines analytic and locally analytic vectors of solid representations via affinoid and Stein group neighbourhoods, with C(𝔾, K) and D(𝔾, K) = O(𝔾)^∨.

*Needs.* `SolidAnalyticRings:SA.4`, `SolidAnalyticRings:SA.1`, `AdicSpacesPartII:R3/quasi-stein-space`, `AdicSpacesPartII:R3/quasi-stein-theorems-a-b`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`, `SolidAnalyticRings:SA.2`.

#### Banach representations of a quasi-compact analytic group (`banach-analytic-comparison`, theorem)

For a quasi-compact analytic group 𝔾 and a Banach space V, Hom_E(D(𝔾), V) = O_𝔾 ⊗_E V; consequently every D(𝔾)-module structure on V comes from a unique coaction, and the functor of LR.3/solid-analytic-group-representation restricts to an equivalence B_𝔾(E) ≃ B(D(𝔾)) between Banach representations of 𝔾 and D(𝔾)-modules whose underlying space is Banach.

*Hypotheses and conventions.* Solid conventions (BCGP25 §2.2, recalled from Rodrigues Jacinto–Rodríguez Camargo): a fixed strongly inaccessible cardinal κ bounds all profinite sets; E/ℚ_p finite; Mod(E) is the category of solid E-vector spaces, modules over the analytic ring E_■ = (E, O_E)_■ of SolidAnalyticRings SA.4; tensor products and internal Homs are solid. This is not the predicate IsSolid on arbitrary condensed modules over a general ring. Quasi-compactness of 𝔾 makes O_𝔾 a Banach space and D(𝔾) a Smith space; this is the input taken from the solid functional analysis recorded in the gap 'Solid functional analysis'.

*Acceptance examples.* For 𝔾 = 1 both sides are the category of Banach spaces.

*Proof sketch.* D(𝔾) = O_𝔾^∨ is a Smith space, so Hom_E(D(𝔾), V) = O_𝔾 ⊗_E V for Banach V (RJRC22 Corollary 3.17). A module map D(𝔾) ⊗ V → V corresponds to V → Hom(D(𝔾), V) = O_𝔾 ⊗ V, and the module axioms correspond to the comodule axioms.

*Sources.* [BCGP25](#references), §2.2, Remark 2.2.19, p. 22: For quasi-compact G and Banach V, Hom(D(G), V) = O_G ⊗ V (citing RJRC22 Corollary 3.17), so D(G)-module structures on V give G-actions and B_G(E) ≃ B(D(G)). [RJRC22](#references), §3, Corollary 3.17: For V Banach and W Smith, the internal Hom and tensor product are related so that Hom(W, V) = W^∨ ⊗ V; applied with W = D(𝔾) a Smith space.

*Needs.* `LR.3/solid-analytic-group-representation`, `SolidAnalyticRings:SA.4`.

#### Solid representations of a locally profinite group (`solid-group-representation`, definition)

Let M be a locally profinite group, viewed as a condensed group, E[M] its condensed group ring and E_■[M] its solidification: for compact M, E_■[M] = (lim_N O_E[M/N])[1/p] over open normal N; in general E_■[M] = E[M] ⊗_{E[M_0]} E_■[M_0] for any compact open M_0 ⊆ M. A representation of M on a solid E-vector space is a solid E_■[M]-module; equivalently a solid E-vector space V with an action map M × V → V of condensed sets satisfying the group action axioms. Mod_M(E) denotes this category.

*Hypotheses and conventions.* Solid conventions (BCGP25 §2.2, recalled from Rodrigues Jacinto–Rodríguez Camargo): a fixed strongly inaccessible cardinal κ bounds all profinite sets; E/ℚ_p finite; Mod(E) is the category of solid E-vector spaces, modules over the analytic ring E_■ = (E, O_E)_■ of SolidAnalyticRings SA.4; tensor products and internal Homs are solid. This is not the predicate IsSolid on arbitrary condensed modules over a general ring.

*Uses.* BCGP25 §2.2.23–2.2.27: the ambient category of smooth, λ-smooth and locally analytic solid representations. BCGP25 §3–4 (higher Coleman theory): solid representations of M = T^+(ℚ_p), G(ℚ_p) on coherent cohomology complexes.

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

*Acceptance examples.* A continuous representation of M on a complete locally convex E-vector space gives, through the condensed-set functor, an object of Mod_M(E).

*Proof sketch.* For compact M, E_■[M] is the rational Iwasawa algebra with its weak (compact) topology as a solid algebra; the induction formula defines E_■[M] for general M independently of M_0 because E_■[M_0] is free over E_■[M_1] for M_1 ⊆ M_0 open (finite index). Action maps M × V → V of condensed sets correspond to E[M]-module structures, and solidity of V makes them extend uniquely to E_■[M].

*Sources.* [BCGP25](#references), §2.2.20, Definition 2.2.21 and Remark 2.2.22, p. 22: Defines E_■[M] as the solidified group ring (an inverse limit of rational group rings for compact M, induced from a compact open in general) and representations as solid E_■[M]-modules, equivalently condensed action maps. [RJRC22](#references), §1.2.2, p. 3: For compact G, K_■[G] = (lim O_K[G/N])[1/p], the classical Iwasawa algebra with the weak topology; G-representations on solid spaces are solid K_■[G]-modules, and continuous representations on complete locally convex spaces embed.

*Needs.* `SolidAnalyticRings:SA.1`, `SolidAnalyticRings:SA.4`, `LR.0/rational-points-analytic-group`, `PadicMeasuresIwasawaAlgebras:L1/finite-projection`.

*Planet:* Solid representation.

#### Smooth and λ-smooth solid representations (`solid-smooth-representation`, definition)

For V ∈ Mod_M(E) put V^sm := colim_N V^N over compact open subgroups N ⊆ M (invariants in Mod(E)); V is smooth if V^sm → V is an isomorphism; Mod^sm_M(E) is the full subcategory of smooth representations. For a continuous character λ : M → E^× and E(−λ) the corresponding one-dimensional representation of λ^{-1}, V is λ-smooth if V ⊗_E E(−λ) is smooth; Mod^{λ-sm}_M(E) is the category of λ-smooth representations, and if λ ⊗ λ′^{-1} is smooth then Mod^{λ-sm}_M(E) and Mod^{λ′-sm}_M(E) are canonically equivalent (equal as subcategories).

*Hypotheses and conventions.* Solid conventions (BCGP25 §2.2, recalled from Rodrigues Jacinto–Rodríguez Camargo): a fixed strongly inaccessible cardinal κ bounds all profinite sets; E/ℚ_p finite; Mod(E) is the category of solid E-vector spaces, modules over the analytic ring E_■ = (E, O_E)_■ of SolidAnalyticRings SA.4; tensor products and internal Homs are solid. This is not the predicate IsSolid on arbitrary condensed modules over a general ring.

*Uses.* BCGP25 §2.2.24–2.2.25: the comparison with the discrete group and enough injectives. BCGP25 §2.2.27: V^sm ⊆ V^la ⊆ V. BCGP25 §3–4: λ-smooth T^+-representations for weights λ in higher Coleman theory.

*API* (namespace `TauCeti.LocallyAnalytic.Solid`):

- `smoothPart` (data): V^sm := colim_N V^N with the natural map to V.
- `IsSmooth` (data): V^sm → V is an isomorphism.
- `IsLambdaSmooth` (data): V ⊗ E(−λ) is smooth.
- `isLambdaSmooth_iff_of_smooth_ratio` (characterisation): If λ/λ′ is smooth then IsLambdaSmooth λ V ↔ IsLambdaSmooth λ′ V.
- `smoothPart_functor` (functoriality): V ↦ V^sm is right adjoint to the inclusion of smooth representations.
- `smoothPart_compat` (compatibility): For countable-dimensional classical smooth representations with the finest locally convex E-topology, solid smooth vectors agree with SR.0/smooth-vectors. This does not equip a nonzero E-vector space with a discrete coefficient topology.

**Checks.**

- `IsSmooth.trivial` (degenerate): The trivial representation E is smooth; for M = 1 every representation is smooth.
- `not_IsSmooth_algebraic` (non-example): For M = ℤ_p^× and k ≠ 0, the character x ↦ x^k on E is not smooth (no open subgroup acts trivially), but it is x^k-smooth.
- `IsLambdaSmooth.self` (computation): The character λ itself, as a representation E(λ), is λ-smooth.
- `smoothPart_compat_discrete` (compatibility): For π=⊕_{j∈ℕ} E with its locally convex direct-sum topology and trivial M-action, smoothPart π=π. The summands are p-adic E, rather than discrete E.

*Acceptance examples.* A countable-dimensional classical smooth representation with its finest locally convex E-topology gives a solid smooth object, via its presentation as a filtered union of finite-dimensional E-spaces. E itself always retains its p-adic topology.

*Proof sketch.* V^N is a closed subobject of V in Mod(E); filtered colimits exist, so V^sm is defined, with a natural map to V. If λ/λ′ is smooth then V ⊗ E(−λ) and V ⊗ E(−λ′) differ by tensoring with a smooth character, which preserves smoothness.

*Sources.* [BCGP25](#references), §2.2.23, p. 22: Defines V^sm = colim_N V^N over compact open subgroups and smoothness as V^sm ≅ V. [BCGP25](#references), §2.2, Definition 2.2.26 and the following note, p. 23: Defines λ-smooth representations by smoothness of V ⊗ E(−λ), and notes that characters with smooth ratio give canonically equivalent categories.

*Needs.* `LR.3/solid-group-representation`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/is-smooth`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-vectors`.

#### Smooth solid representations are smooth representations of the discrete group (`solid-smooth-discrete-comparison`, theorem)

Let M_disc be M with the discrete topology and Mod^sm_{M_disc}(E) the category of E[M_disc]-modules V in Mod(E) with V = colim_N V^{N_disc}. Restriction along M_disc → M induces an equivalence Mod^sm_M(E) ≃ Mod^sm_{M_disc}(E).

*Hypotheses and conventions.* Solid conventions (BCGP25 §2.2, recalled from Rodrigues Jacinto–Rodríguez Camargo): a fixed strongly inaccessible cardinal κ bounds all profinite sets; E/ℚ_p finite; Mod(E) is the category of solid E-vector spaces, modules over the analytic ring E_■ = (E, O_E)_■ of SolidAnalyticRings SA.4; tensor products and internal Homs are solid. This is not the predicate IsSolid on arbitrary condensed modules over a general ring. The subscript disc changes the topology of the group M only. The coefficient ring remains the solid analytic ring E_■ on both sides.

*Acceptance examples.* For M = ℤ_p the smooth objects on both sides are colimits of representations of the finite groups ℤ/p^n.

*Proof sketch.* The functor Mod_M(E) → Mod_{M_disc}(E) preserves smoothness. Inverse: for smooth V over M_disc and a cofinal system of open normal M_n ⊆ M_0, V^{M_n} is an E[M_0/M_n]-module and (M_0)_disc/(M_n)_disc = M_0/M_n, so the action extends uniquely to M_0; pass to the colimit and use E[M] = E[M_disc] ⊗_{E[(M_0)_disc]} E[M_0].

*Sources.* [BCGP25](#references), §2.2.23, Lemma 2.2.24 and its proof, p. 22: The categories of smooth solid M-representations and of smooth M_disc-representations are equivalent: on N-invariants for open normal N ⊆ M_0 the M_0/N-action is that of a finite group, so the discrete action extends uniquely.

*Needs.* `LR.3/solid-smooth-representation`, `LR.3/solid-group-representation`.

#### Smooth solid representations form a Grothendieck category (`solid-smooth-grothendieck`, theorem)

With the fixed cardinal bound κ on profinite sets, Mod^sm_M(E) is a Grothendieck abelian category; ⊕_{S,N} E_■[M] ⊗_{E_■[N]} E_■[S] over κ-small profinite (totally disconnected) S and compact open N ⊆ M (with N acting trivially on E_■[S]) is a generator, since Hom(E_■[M] ⊗_{E_■[N]} E_■[S], V) = V^N(S). In particular Mod^sm_M(E) has enough injectives.

*Hypotheses and conventions.* Solid conventions (BCGP25 §2.2, recalled from Rodrigues Jacinto–Rodríguez Camargo): a fixed strongly inaccessible cardinal κ bounds all profinite sets; E/ℚ_p finite; Mod(E) is the category of solid E-vector spaces, modules over the analytic ring E_■ = (E, O_E)_■ of SolidAnalyticRings SA.4; tensor products and internal Homs are solid. This is not the predicate IsSolid on arbitrary condensed modules over a general ring.

*Acceptance examples.* For classical countable-dimensional smooth representations given the finest locally convex E-topology, the terms with S a point are the usual compact inductions c-Ind_N^M E of the smooth supplier, with p-adic E coefficients. The additional profinite S detect all solid sections.

*Proof sketch.* Colimits exist and filtered colimits are exact (AB5) because both hold in Mod(E) and invariants under compact open N commute with filtered colimits of smooth objects. The displayed generator corepresents V ↦ V^N(S); every V is a quotient of a sum of these. A Grothendieck abelian category has enough injectives.

*Sources.* [BCGP25](#references), §2.2, Lemma 2.2.25 and its proof, pp. 22–23: The category of smooth solid representations is Grothendieck abelian with generator built from compact inductions of free solid modules on profinite sets, hence has enough injectives (Stacks Tag 079H). [BCGP25](#references), §2.2, paragraph before Lemma 2.2.25, p. 22: The argument uses the set-theoretic restriction to κ-small profinite sets.

*Needs.* `LR.3/solid-smooth-discrete-comparison`, `LR.3/solid-smooth-representation`, `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension/grothendieck-abelian`.

#### Locally analytic vectors of solid representations (`solid-analytic-vectors`, construction)

Assume M = 𝔾(ℚ_p) for an analytic group 𝔾 over Spa(ℚ_p, ℤ_p) with a fundamental system of quasi-compact open subgroups 𝔾_r (r ≥ 0), each a polydisc, and put M_r := 𝔾_r(ℚ_p), a fundamental system of compact open subgroups. Put O_{𝔾_r,E} := O_{𝔾_r} ⊗_{ℚ_p} E. For V ∈ Mod_M(E), O_{𝔾_r,E} ⊗_E V carries three commuting actions of M_r: ∗_l (left translation on 𝔾_r), ∗_r (right translation) and ∗_V (from V; this one extends to M, which acts on {M_r} by conjugation). Define V^{M_r-an} := H^0(M_r, O_{𝔾_r,E} ⊗_E V) for the diagonal action ∗_l ⊗ ∗_V; it keeps the residual action ∗_r of M_r, which commutes with ∗_l ⊗ ∗_V, and evaluation at e gives an M_r-equivariant injection V^{M_r-an} → V. Then V^la := colim_r V^{M_r-an} ∈ Mod_M(E), with natural injections V^sm → V^la → V. The derived functor is V^{Rla} := hocolim_r RHom_{E_■[M_r]}(E, V ⊗^L_E O_{𝔾_r,E}) (Rodrigues Jacinto–Rodríguez Camargo), with H^0(V^{Rla}) = V^la; for V a Banach representation, V^la is the classical space of locally analytic vectors (LR.2/analytic-vectors) and H^i(V^{Rla}) = R^iLA(V) (LR.2/derived-analytic-vectors).

*Hypotheses and conventions.* Solid conventions (BCGP25 §2.2, recalled from Rodrigues Jacinto–Rodríguez Camargo): a fixed strongly inaccessible cardinal κ bounds all profinite sets; E/ℚ_p finite; Mod(E) is the category of solid E-vector spaces, modules over the analytic ring E_■ = (E, O_E)_■ of SolidAnalyticRings SA.4; tensor products and internal Homs are solid. This is not the predicate IsSolid on arbitrary condensed modules over a general ring. The polydisc subgroups 𝔾_r come from an ordered-basis chart of a uniform open subgroup (RJRC22 Remark 1.4), consistent with the G_n of LR.2/analytic-vectors. Every occurrence of O_{𝔾_r} with E-coefficients means O_{𝔾_r,E}=O_{𝔾_r} ⊗_{ℚ_p} E, including in the derived formula. The derived Banach comparison is the proof contract recorded under derived analytic vectors.

*Uses.* BCGP25 §2.2.27–2.2.28: locally analytic vectors and the derived functor V^{Rla} of solid representations. BCGP25 §§3–4: derived locally analytic vectors of completed cohomology complexes and the comparison with coherent cohomology. CompletedCohomologyPartII CC.6/analytic-classical-comparison: RHom_g(W^∨, RΓ_{completed, la}) uses derived locally analytic vectors of a complex.

*API* (namespace `TauCeti.LocallyAnalytic.Solid`):

- `analyticVectorsSolid` (data): V^{M_r-an} := H⁰(M_r, O_{𝔾_r} ⊗ V) with its residual M_r-action.
- `laVectorsSolid` (data): V^la := colim_r V^{M_r-an} in Mod_M(E).
- `smoothPart_le_la_le` (relation): Natural injections V^sm → V^la → V.
- `derivedLaVectors` (data): V^{Rla} := hocolim_r RHom_{E_■[M_r]}(E, V ⊗^L_E O_{𝔾_r,E}) in D(E_■[M]).
- `derivedLaVectors_zero` (characterisation): H⁰(V^{Rla}) = V^la.
- `laVectorsSolid_banach` (compatibility): For V Banach, laVectorsSolid V is LR.2/analytic-vectors' B^la (as a solid space) and H^i(V^{Rla}) = R^iLA(V).
- `laVectorsSolid_functor` (functoriality): V ↦ V^la is a left exact functor Mod_M(E) → Mod_M(E), M-equivariant for conjugation of the 𝔾_r.

**Checks.**

- `laVectorsSolid_smooth` (computation): For V smooth, V^sm = V^la = V.
- `laVectorsSolid_trivial` (degenerate): For the trivial representation E, V^{M_r-an} = E for every r.
- `laVectorsSolid_banach_compat` (compatibility): For B = C(ℤ_p, E) with translation, laVectorsSolid B = C^la(ℤ_p, E), as in LR.2/analytic-vectors.
- `laVectorsSolid_not_all` (non-example): For B = C(ℤ_p, E), V^la → V is not surjective.
- `laVectorsSolid_residual_action` (computation): For the analytic character χ : M_r → E^×, the invariant function with value v at e is f(g)=χ(g)v. Right translation by h evaluates to χ(h)v; multiplying again by χ(h) would incorrectly give χ(h)^2v.

*Acceptance examples.* For V = O_{𝔾_0} with the right regular action, V^{M_0-an} = V.

*Proof sketch.* O_{𝔾_r,E} ⊗_E V is a solid M_r-representation for each of the three actions; invariants for ∗_l ⊗ ∗_V are a left exact functor. Evaluation at e intertwines the residual right-translation action ∗_r on the invariant functions with the given action on V. There is no extra tensor factor ∗_V in this residual action. An invariant function is its orbit function and is determined by its value at e. For Banach V, O_{𝔾_r,E} ⊗_E V is the completed projective tensor product (RJRC22 §1.2.2), so the invariants are V^{G_r-an} of LR.2/analytic-vectors; the derived version is computed by continuous cohomology, giving R^iLA.

*Sources.* [BCGP25](#references), §2.2.27 and Remark 2.2.28, p. 23: Defines V^{M_r-an} as H⁰(M_r, O_{G_r} ⊗ V) for the diagonal of left translation and the given action, notes the surviving right-translation action, defines V^la as the colimit with V^sm → V^la → V, and refers to RJRC22 §4.4 for the derived functor V^{Rla}. [RJRC22](#references), §4.4, Definition 4.40, p. 39; §1.2.2, p. 4; Theorem 1.5, p. 5: Defines V^la and C^{Rla} as colimit and homotopy colimit of (derived) analytic vectors over the group neighbourhoods G(h), notes that H⁰(V^{Rla}) is Emerton's V_la for Banach V, and compares group cohomology with that of derived locally analytic vectors.

*Needs.* `LR.3/solid-group-representation`, `LR.3/solid-analytic-group-representation`, `LR.3/solid-smooth-representation`, `LR.2/analytic-vectors`, `LR.2/derived-analytic-vectors`, `LocallyAnalyticDistributionsPartII:ND.0/ordered-basis-chart`.

*Planet:* Solid locally analytic vectors.

#### Integrable LB representations of a Lie algebra (`integrable-lb-lie-representation`, definition)

Let g be the E-Lie algebra of the analytic group germ 𝔾_e. An LB representation here is a continuous module V over the Arens–Michael completion Û(g), presented by an increasing sequence of Banach subspaces V_r with injective transition maps. It is integrable if these subspaces are g-stable and, after a cofinal reindexing, V_r carries an analytic action of a shrinking analytic subgroup 𝔾_r whose derivative is the given action and whose restriction agrees with the action at later stages. The result is an action of the analytic group germ on V: each stage integrates on a suitable neighbourhood. This does not assert an action of one fixed 𝔾_r on all of V.

*Hypotheses and conventions.* Solid conventions (BCGP25 §2.2, recalled from Rodrigues Jacinto–Rodríguez Camargo): a fixed strongly inaccessible cardinal κ bounds all profinite sets; E/ℚ_p finite; Mod(E) is the category of solid E-vector spaces, modules over the analytic ring E_■ = (E, O_E)_■ of SolidAnalyticRings SA.4; tensor products and internal Homs are solid. This is not the predicate IsSolid on arbitrary condensed modules over a general ring. The completed enveloping algebra Û(g) and its germ-distribution identification are imported from LocallyAnalyticDistributionsPartII ND.3/arens-michael-envelope. Parabolic category O is an application context in BCGP, not data in the definition of integrability.

*Uses.* BCGP25 §3.4–3.5: the analytic localisation of category O objects and the comparison with locally analytic vectors in higher Coleman theory.

*API* (namespace `TauCeti.LocallyAnalytic.Solid`):

- `IsIntegrable` (data): A continuous Û(g)-module on an LB space admits a Banach filtration with compatible analytic integrations on shrinking group neighbourhoods.
- `IsIntegrable.integrate` (constructor): The compatible actions on Banach stages define an analytic group-germ action. A fixed-neighbourhood action on all of V requires additional uniform-radius data.
- `IsIntegrable.unique` (extensionality): Two integrations with the same differentiated action agree after shrinking on each Banach stage; uniqueness is as a group-germ action.
- `IsIntegrable.laVectors` (compatibility): Every vector lies in a Banach stage analytic for a suitable subgroup neighbourhood. If a compatible fixed-group action is separately supplied, these vectors lie in its locally analytic part.

**Checks.**

- `IsIntegrable.finiteDim` (computation): A finite-dimensional algebraic representation of 𝔾 is integrable.
- `IsIntegrable.zero` (degenerate): The zero module is integrable.
- `not_IsIntegrable_verma` (non-example): The ordinary infinite-dimensional Verma module for sl₂ with its finest countable-dimensional LB topology does not admit such a structure: every Banach subspace is finite-dimensional, while the freely acting lowering operator has no nonzero finite-dimensional stable subspace. In particular it is not silently an admissible Û(g)-module.
- `IsIntegrable_completed_verma_dual` (computation): The completed Verma dual in BCGP Proposition 3.4.3, p. 53, is an integrable LB representation. The completion and topology distinguish it from the ordinary finest-topology Verma module.

*Acceptance examples.* A finite-dimensional algebraic representation of 𝔾 is integrable for the constant filtration.

*Proof sketch.* Uniqueness of the integration: two analytic 𝔾_r-actions with the same derivative agree on 𝔾_r for r large (the exponential is a local isomorphism near 0; LR.0/rational-points-analytic-group). Banach analytic representations are Banach D(𝔾_r)-modules (LR.3/banach-analytic-comparison), so integrability is a condition on the g-action extending to D(𝔾_r) on V_r.

*Sources.* [BCGP25](#references), §3.4, Definition 3.4.2 and Proposition 3.4.3, pp. 52–53: Defines LB representations as modules over Û(g), and integrability by compatible Banach-stage actions of shrinking groups. The completed Verma dual is integrable.

*Needs.* `LR.3/solid-analytic-vectors`, `LR.3/banach-analytic-comparison`, `LR.0/derived-lie-action`, `LocallyAnalyticDistributionsPartII:ND.3/arens-michael-envelope`.

*Planet:* Integrable LB Lie representation.

### Examples

- **Solid representations of an analytic group.** Analytifying an algebraic coaction gives a solid analytic representation. The converse for arbitrary finite-dimensional analytic representations is not asserted; for a small additive analytic disc, nonpolynomial exponential characters provide analytic examples.
- **Banach representations of a quasi-compact analytic group.** For 𝔾 = 1 both sides are the category of Banach spaces.
- **Solid representations of a locally profinite group.** A continuous representation of M on a complete locally convex E-vector space gives, through the condensed-set functor, an object of Mod_M(E).
- **Smooth and λ-smooth solid representations.** A countable-dimensional classical smooth representation with its finest locally convex E-topology gives a solid smooth object, via its presentation as a filtered union of finite-dimensional E-spaces. E itself always retains its p-adic topology.
- **Smooth solid representations are smooth representations of the discrete group.** For M = ℤ_p the smooth objects on both sides are colimits of representations of the finite groups ℤ/p^n.
- **Smooth solid representations form a Grothendieck category.** For classical countable-dimensional smooth representations given the finest locally convex E-topology, the terms with S a point are the usual compact inductions c-Ind_N^M E of the smooth supplier, with p-adic E coefficients. The additional profinite S detect all solid sections.
- **Locally analytic vectors of solid representations.** For V = O_{𝔾_0} with the right regular action, V^{M_0-an} = V.
- **Integrable LB representations of a Lie algebra.** A finite-dimensional algebraic representation of 𝔾 is integrable for the constant filtration.

### Dependencies

`AdicSpacesPartII:R3`, `LocallyAnalyticDistributionsPartII:ND.0`, `LocallyAnalyticRepresentationsOfLocalGroups:LR.0`, `LocallyAnalyticRepresentationsOfLocalGroups:LR.2`, `PadicMeasuresIwasawaAlgebras:L1`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`, `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension`, `SolidAnalyticRings:SA.1`, `SolidAnalyticRings:SA.2`, `SolidAnalyticRings:SA.4`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`, `LocallyAnalyticDistributionsPartII:ND.3`.

## Layer LR.4: Locally analytic parabolic induction, principal series and Schraen's spectral sequence

Locally analytic parabolic induction and its admissibility, transitivity and locally algebraic and σ-analytic variants, locally analytic principal series, Ext between locally analytic characters of a torus, homology under a unipotent radical, and Schraen's spectral sequence for Ext into a parabolic induction. Homology uses the topological complex with Hausdorff hypotheses. Kostant homology is obtained by dualising cohomology with the chosen radical. The stated spectral sequence restricts its inducing input to the source’s locally algebraic range.

**Coverage:** partial. Supply category O and the dualised, radical-specific Kostant formulas from their owner, and the finite-E smooth principal-series Jacquet refinement; the topological homology and restricted spectral-sequence targets are stated with their exact hypotheses.

#### Locally analytic parabolic induction (`locally-analytic-induction`, construction)

Let G = 𝐆(L) with 𝐆 connected reductive over L, P = M_P N_P a parabolic subgroup (so P\G is compact by the Iwasawa decomposition G = P·K_0, ReductiveGroupsPartII RG2.4), and U a locally F-analytic representation of P on a space of compact type. The locally analytic induction is (Ind_P^G U)^{F-an} := {f ∈ C^{F-an}(G, U) : f(pg) = p·f(g) for p ∈ P, g ∈ G}, with G acting by right translation (g·f)(h) = f(hg). It is a closed subspace of C^{F-an}(G, U), of compact type, and a locally F-analytic representation of G. If U is inflated from a locally analytic representation of M_P which is admissible (respectively strongly admissible, very strongly admissible), the induction has the corresponding property. Induction is transitive, (Ind_P^G (Ind_Q^P U)^an)^an ≅ (Ind_Q^G U)^an for Q ⊆ P, exact on strict short exact sequences, and contains (Ind_P^G π)^∞ ⊗ W, the locally algebraic induction (Ind_P^G π ⊗ W|_P)^{lalg}, for π smooth admissible of M_P inflated to P and W algebraic of 𝐆. Parabolic inductions are unnormalised ('droites'). For F = ℚ_p and σ ∈ Σ_L the locally σ-analytic induction (Ind_P^G U)^{σ-an} ⊆ (Ind_P^G U)^{ℚ_p-an} consists of the functions whose derived g ⊗_{ℚ_p} E-action factors through g_σ (LR.9/sigma-analytic-representation).

*Hypotheses and conventions.* P\G compact (Iwasawa decomposition), so that functions are determined on a compact set and the induction is of compact type. U is of compact type. An arbitrary infinite-dimensional Banach U does not acquire this property merely by taking analytic functions: constant U-valued functions already give a closed copy of U in the local function space.

*Uses.* Ding, §3.1.2–3.1.4: PS(w(φ), h), the parabolic inductions (3.19) and their σ-analytic variants. Orlik–Strauch §3, Breuil socle I (4): F^G_P(M, π_P) is a closed subrepresentation of (Ind_P^G W′ ⊗ π_P)^an. Emerton, Jacquet II, §2: the closed induction I_P^G(U) ⊆ Ind_P^G U and the adjunction. LocallyAnalyticCompletedCohomology (Pan II §5.1.10): locally analytic induction from the Borel of GL_2(ℚ_p) as an equivariant sheaf on ℙ^1(ℚ_p).

*API* (namespace `TauCeti.LocallyAnalytic`):

- `laInd` (constructor): (Ind_P^G U)^{F-an} as a locally analytic representation of G.
- `laInd_isAdmissible` (other): For U inflated from M_P and admissible (respectively strongly or very strongly admissible), laInd U has the corresponding property (EMJ2 Proposition 2.1.2).
- `laInd_trans` (relation): (Ind_P^G (Ind_Q^P U)^an)^an ≅ (Ind_Q^G U)^an for Q ⊆ P.
- `laInd_exact` (functoriality): U ↦ (Ind_P^G U)^an is an exact functor on strict short exact sequences, compatible with morphisms.
- `laInd_lalg` (compatibility): The tensor identity sends f ⊗ w to (g ↦ f(g) ⊗ g·w), giving (Ind_P^G π)^∞ ⊗ W ↪ (Ind_P^G(π ⊗ W|_P))^an with the locally algebraic image.
- `laInd_sigma` (data): (Ind_P^G U)^{σ-an} ⊆ (Ind_P^G U)^{ℚ_p-an} for σ ∈ Σ_L.
- `laInd_dual` (characterisation): The strong dual is the Hausdorff completed balanced tensor product D(G,E) ⊗̂_{D(P,E)} U′ with the appropriate locally convex tensor topology. The algebraic tensor maps densely to it; do not assert an algebraic isomorphism for general U. For finite-dimensional inducing data the standard finite-generation argument may identify the algebraic tensor with the completed one.
- `laInd_smooth_compat` (compatibility): For U smooth admissible, the smooth vectors of (Ind_P^G U)^an are the smooth induction (Ind_P^G U)^∞ of SR.2/smooth-induction.

**Checks.**

- `laInd_trivial_P` (degenerate): For P = G, (Ind_G^G U)^an = U.
- `laInd_GL2_P1` (computation): For G = GL_2(ℚ_p), P = B^- and a character χ, (Ind_{B^-}^G χ)^an ≅ C^an(ℙ^1(ℚ_p), E) as a topological vector space.
- `laInd_trivialChar_contains_constants` (computation): For U = 1 the trivial character, (Ind_P^G 1)^an contains the constant functions as the unique closed one-dimensional subrepresentation.
- `laInd_not_smooth` (non-example): For a locally analytic but non-smooth character χ = z^λ (λ ≠ 0 algebraic), (Ind_{B^-}^G χ)^an has no nonzero smooth vectors, whereas (Ind χ)^∞ is defined only for smooth χ.
- `laInd_tensor_identity` (computation): For GL₂, W=E² and smooth f, at p∈P the image function takes value f(p) ⊗ p·w. Taking f(p) ⊗ w would fail P-equivariance when p·w≠w.

*Acceptance examples.* For G = GL_2(ℚ_p), P = B^- and a locally analytic character χ, (Ind_{B^-}^G χ)^an ≅ C^an(ℙ^1(ℚ_p), E) as topological vector spaces.

*Proof sketch.* Choose local analytic sections of G → P\G over a finite disjoint compact-open cover. The induction is topologically a finite product of compact-base analytic function spaces with compact-type coefficients U, hence of compact type. Closedness in C^an(G,U) alone does not give compact type for noncompact G. For U inflated from M_P, EMJ2 Proposition 2.1.2 proves preservation of the three admissibility conditions using analytic Banach-stage embeddings and the compact-base description. The general dual uses a completed balanced tensor product; BR16 Lemma 2.2 identifies only a dense algebraic image for arbitrary smooth inducing coefficients. Transitivity: the map f ↦ (g ↦ f(g)(1)) is an isomorphism, as for smooth induction (SR.2/induction-in-stages). For f in the smooth induction and w ∈ W, send f ⊗ w to the function g ↦ f(g) ⊗ g·w. Its P-transformation and right G-equivariance give the tensor identity and the locally algebraic injection. The constant function g ↦ f(g) ⊗ w would not satisfy the required transformation law.

*Sources.* [EMJ2](#references), §2.1, Proposition 2.1.2, p. 21: If U is admissible (respectively strongly, very strongly admissible) then Ind_P^G U is admissible (respectively strongly, very strongly admissible). [BR16](#references), §2, (4), p. 8: Defines (Ind_P^G W′ ⊗ π_P)^{ℚ_p-an} as locally ℚ_p-analytic functions with f(pg) = p·f(g), with the inductive-limit topology on W′ ⊗ π_P and G acting by right translation; parabolic inductions are unnormalised. [DING25](#references), §3.1.2, p. 34; §3.1.3, (3.19), p. 40; §3.1.4, p. 44: Uses (Ind_{B^-(K)}^{GL_n(K)} −)^{ℚ_p-an}, locally algebraic induction (−)^{lalg}, transitivity of parabolic induction and locally σ-analytic induction. [BR16](#references), §2, Lemma 2.2 and proof, pp. 9–10: The algebraic tensor description has dense image in the strong dual for general smooth coefficients; the topology/completion must be retained.

*Needs.* `LR.0/locally-analytic-representation`, `LR.1/admissible-representation`, `LR.2/very-strongly-admissible`, `ReductiveGroupsPartII:RG2.4/iwasawa-decomposition`, `SmoothRepresentationsOfLocalGroups:SR.2/smooth-induction`, `SmoothRepresentationsOfLocalGroups:SR.2/induction-in-stages`, `LocallyAnalyticDistributions:L0/locally-analytic-function-space`, `LocallyAnalyticDistributions:L0/compact-type-spaces`.

*Planet:* Locally analytic parabolic induction.

#### Locally analytic principal series (`principal-series`, construction)

Let 𝐆 be split reductive over L with split maximal torus 𝐓 ⊆ 𝐁 = 𝐓𝐍 (Borel, unipotent radical 𝐍) and opposite Borel 𝐁^-, G = 𝐆(L), T = 𝐓(L). For a locally ℚ_p-analytic character χ : T → E^×, inflated to B^- = B^-(L), the locally analytic principal series is PS(χ) := (Ind_{B^-}^G χ)^{ℚ_p-an} (LR.4/locally-analytic-induction). Its derivative dχ ∈ Hom(t ⊗_{ℚ_p} E, E) = ∏_σ t_σ^* is its weight. For χ = χ_sm z^λ with χ_sm smooth and λ = (λ_{σ,i})_{σ∈Σ_L, 1≤i≤n} an algebraic weight (for GL_n, z^λ(diag(t_1, …, t_n)) = ∏_{σ,i} σ(t_i)^{λ_{σ,i}}), and λ dominant with respect to 𝐁, PS(χ) contains (Ind_{B^-}^G χ_sm)^∞ ⊗_E L(λ) as its locally algebraic vectors, where L(λ) is the irreducible algebraic representation of (Res_{L/ℚ_p}𝐆) ×_{ℚ_p} E of highest weight λ.

*Hypotheses and conventions.* E splits L and contains the values of χ. Unnormalised induction from the lower Borel B^-, Ding's convention.

*Uses.* Ding, Proposition 3.1: constituents and socle of PS(w(φ), h). BHS §5.2, p. 395: irreducible constituents of the principal series attached to companion points. LocallyAnalyticDistributionsPartII ND.5/principal-series-eigenfunction: the SL_2-principal series inside C^la(G, ℚ_p)[λ] (compact G); this node is its global version.

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

*Acceptance examples.* For GL_2(ℚ_p) and χ = z^λ with λ = (k, 0), k ≥ 0, PS(χ)_lalg = (Ind_{B^-}^G 1)^∞ ⊗ Sym^k(E²).

*Proof sketch.* PS(χ) is admissible, very strongly admissible when χ is (characters are finite-dimensional, LR.2/very-strongly-admissible), by LR.4/locally-analytic-induction. The locally algebraic vectors are computed by the inclusion of LR.4/locally-analytic-induction with W = L(λ): for dominant λ the highest-weight line of L(λ) is the unique B^--stable quotient line (n^- lowers weights), on which B^- acts by z^λ; Frobenius reciprocity identifies (Ind χ_sm)^∞ ⊗ L(λ) with the locally algebraic induction.

*Sources.* [DING25](#references), §3.1.2, p. 34: Defines PS(w(φ), h) := (Ind_{B^-(K)}^{GL_n(K)} w(φ)ηz^λ)^{ℚ_p-an} and its socle π_alg(φ, h) = I_sm(w(φ)) ⊗_E L(λ). [OS10](#references), Introduction, p. 3; Theorem 3.1.3, p. 13: Proves that Ind_P^G(V) is topologically irreducible when U(g) ⊗_{U(p)} V′ is irreducible, the irreducibility criterion for principal series. [BR16](#references), §2, (4) and Corollary 2.5, pp. 8–11: Treats (Ind_P^G W′ ⊗ π_P)^{ℚ_p-an} and its socle.

*Needs.* `LR.4/locally-analytic-induction`, `LR.1/locally-algebraic-representation`, `SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-4-the-classification-of-finite-dimensional-irreducibles`.

*Planet:* Locally analytic principal series.

#### Ext groups between locally analytic characters of a torus (`torus-ext`, theorem)

Let T = 𝐓(L) for a split torus 𝐓 ≅ 𝔾_m^n over L, and χ, χ′ : T → E^× locally ℚ_p-analytic characters. (1) If χ ≠ χ′ then Ext^i_T(χ, χ′) = 0 for all i. (2) Ext^1_T(χ, χ) ≅ Hom(T, E), the E-vector space of locally ℚ_p-analytic additive characters T → E, via ψ ↦ χ(1 + ψε) (LR.1/self-extension-dual-numbers). (3) dim_E Hom(L^×, E) = 1 + d_L, dim_E Hom_sm(L^×, E) = 1 and dim_E Hom_σ(L^×, E) = 2 for σ ∈ Σ_L, where Hom_sm consists of smooth (locally constant) and Hom_σ of locally σ-analytic characters (dψ factoring through Lie(L^×) ⊗_{L,σ} E); hence dim Hom(T, E) = n(1 + d_L) and dim Hom_sm(T, E) = n. (4) Hom_{g′}(GL_n) := {ψ ∈ Hom(T(L), E) : ψ − ψ_0 ∘ det ∈ Hom_sm(T(L), E) for some ψ_0 ∈ Hom(L^×, E)} has dimension n + d_L.

*Hypotheses and conventions.* T abelian, so D(T, E) is commutative.

*Acceptance examples.* For n = 1 and L = ℚ_p, Ext^1_{ℚ_p^×}(1, 1) is two-dimensional, spanned by the valuation and log_p.

*Proof sketch.* (1): D(T, E) is commutative; if χ ≠ χ′ there is t ∈ T with χ(t) ≠ χ′(t) (or x ∈ t with dχ(x) ≠ dχ′(x)); the central element δ_t − χ(t) acts by 0 on χ and invertibly on χ′, hence by both 0 and an isomorphism on the Ext groups. (2): a self-extension of the character χ is a two-dimensional representation, upper triangular with a locally analytic additive character in the corner; normalising by χ gives ψ. (3): L^× ≅ ϖ^ℤ × μ × (1 + ϖ^m O_L) with 1 + ϖ^m O_L ≅ O_L ≅ ℤ_p^{d_L} for m large; additive characters are the valuation (smooth) and the E-linear combinations of σ ∘ log (σ ∈ Σ_L). (4): Hom_{g′} is the sum of Hom_sm(T, E) (dimension n) and det^*Hom(L^×, E) (dimension 1 + d_L), meeting in det^*Hom_sm(L^×, E) (dimension 1).

*Sources.* [DING25](#references), §3.1.2, proof of Lemma 3.5, p. 37: Recalls that Ext^i_{T(K)}(χ, χ′) = 0 for all i when χ ≠ χ′. [DING25](#references), §2.1, p. 9: Defines Hom(H, E), Hom_sm(H, E) and Hom_σ(H, E) for a locally K-analytic group H and records dim Hom_sm(K^×, E) = 1, dim Hom_σ(K^×, E) = 2, dim Hom(K^×, E) = 1 + d_K. [DING25](#references), §2.3.1, (2.17), p. 18: Defines Hom_{g′}(T(K), E) as the characters differing from ψ_0 ∘ det by a smooth character.

*Needs.* `LR.1/ext-groups`, `LR.1/self-extension-dual-numbers`, `LR.0/derived-lie-action`, `LR.0/distribution-algebra`.

#### Homology of locally analytic representations under a unipotent radical (`unipotent-homology`, construction)

For a locally analytic N-representation V, define H_q(N,V) as the homology, with its subquotient topology, of Kohlhaase’s topological bar complex B_•(N,V) ⊗̃_{D(N,E),ι} E. The bar construction is the standard simplicial resolution of the free/forgetful cotriple F(X)=D(N,E) ⊗̂_{E,ι} X; its differential is the alternating sum of faces. These homology spaces need not be Hausdorff. If V is of compact type and is a P=M_PN_P-representation, then Hausdorff H_q(N_P,V) are compact-type locally analytic M_P-representations. For V=W ⊗ π locally algebraic, H_q(N_P,V) ≅ H_q(n_P,W) ⊗_E J_{N_P}(π), where J is the unnormalised smooth Jacquet module. For finite-dimensional W, compute the Lie homology by the M_P-equivariant duality H_q(n_P,W) ≅ H^q(n_P,W∨)∨ and Kostant’s cohomology theorem, keeping the dual and the exterior-root action.

*Hypotheses and conventions.* Use the locally convex topological bar construction of SCH11 Remark 3.9, p. 68, with the indicated balanced tensor topology; no identification with the dual of abstract Tor(E,V′) is claimed. For the locally analytic Levi action assume compact type and Hausdorff homology as in SCH11 p. 82. Kostant cohomology and finite-dimensional duality are the category-O supplier contract.

*Uses.* Schraen 2011, Corollaire 4.9: the E_2-terms Ext^p_{M_P}(H_q(N_P, Σ), ρ). Ding, proof of Lemma 3.5, p. 37: H_1(N^-(K), π_alg(φ, h)) and the separatedness hypothesis. Ding 2019, Lemma 2.26: vanishing of Ext^1 into inductions of non-adjacent weights.

*API* (namespace `TauCeti.LocallyAnalytic`):

- `unipotentHomology` (data): H_q(N,V) as a possibly non-Hausdorff locally convex space with its induced Levi action; for compact-type V and Hausdorff homology it is a compact-type locally analytic Levi representation.
- `unipotentHomology_zero` (characterisation): H_0(N, V) = V_N, the coinvariants (with the quotient topology).
- `unipotentHomology_lalg` (relation): H_q(N_P, W ⊗ π) ≅ H_q(n_P, W) ⊗_E J_{N_P}(π).
- `unipotentHomology_IsHausdorff` (data): The predicate that every H_q(N, V) is Hausdorff (the separatedness hypothesis of LR.4/schraen-spectral-sequence).
- `unipotentHomology_lalg_hausdorff` (example): For locally algebraic V, every H_q(N_P, V) is Hausdorff (finite-dimensional algebraic times smooth with finest topology).

**Checks.**

- `unipotentHomology_trivialN` (degenerate): For N = 1, H_0 = V and H_q = 0 for q > 0.
- `unipotentHomology_GL2_alg` (computation): For W=Sym^k(E²), k≥0, lower N⁻ has H₀ weight (k,0) and H₁ weight (−1,k+1). Upper N has H₀ weight (0,k) and H₁ weight (k+1,−1). H₁ includes the exterior Lie-root factor and is not just a weight line of W.
- `unipotentHomology_smooth` (non-example): For π=1 and GL₂ with upper N, H₁(N,π) is the Lie-root line of weight (1,−1), although positive smooth homology vanishes. For general π, H_q(n,E) ⊗ J_N(π) may vanish when the smooth Jacquet module vanishes.
- `unipotentHomology_lalg_hausdorff_test` (characterisation): For Σ = W ⊗ π locally algebraic (W finite-dimensional algebraic, π smooth admissible with its finest topology), every H_q(N_P, Σ) is Hausdorff, so the hypothesis of LR.4/schraen-spectral-sequence holds.

*Acceptance examples.* For upper N in GL₂ and W=Sym^k(E²), H₀(n,W) has weight (0,k); for lower N⁻ it has weight (k,0). The Levi action must remember which radical was used.

*Proof sketch.* Form the free/forgetful cotriple resolution and its face and degeneracy maps; apply the topological balanced coinvariant tensor with E and take homology with its quotient topology (SCH11 Remark 3.9, p. 68). The Hausdorff compact-type result and locally analytic Levi action are the argument preceding Corollary 4.9, p. 82. Abstract algebraic Tor on V′ is a different expression and is not substituted for this construction. For W ⊗ π: N acts on π smoothly; the homology splits as Lie algebra homology of W tensored with the coinvariants of the smooth part, which are the Jacquet module (exactness of J_N, SR.2/jacquet-lemma).

*Sources.* [SCH11](#references), §3, p. 68: Recalls Kohlhaase's definition of the homology groups of a locally analytic representation as the homology of the complex (B_q(G, V) ⊗̃ D(G), ι_K)_q. [SCH11](#references), §4, (4.40)–(4.42) and Théorème 4.10, p. 82: For locally algebraic Σ = ψ_alg ⊗ ψ_∞: H_q(n, ψ_alg ⊗ ψ_∞) = H_q(n, ψ_alg) ⊗ ψ_∞ and H_q(N, Σ) = H_q(n, ψ_alg) ⊗ J_N(ψ_∞); Kostant's theorem computes H_q(n, F_λ).

*Needs.* `LR.0/distribution-algebra`, `LR.1/ext-groups`, `LR.1/locally-algebraic-representation`, `SmoothRepresentationsOfLocalGroups:SR.2/jacquet-module`, `SmoothRepresentationsOfLocalGroups:SR.2/jacquet-lemma`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-3-enveloping-algebra-verma-modules-and-lλ`.

*Planet:* Homology under a unipotent radical.

#### Schraen's spectral sequence for Ext into a parabolic induction (`schraen-spectral-sequence`, theorem)

Let G be split reductive, P = M_P N_P a parabolic subgroup, Σ an admissible locally analytic representation of G and ρ an irreducible locally algebraic representation of M_P (inflated to P). If H_q(N_P, Σ) is Hausdorff for every q ≥ 0, there is a spectral sequence E_2^{p,q} = Ext^p_{M_P}(H_q(N_P, Σ), ρ) ⇒ Ext^{p+q}_G(Σ, (Ind_P^G ρ)^an). If moreover the centre Z of G acts on Σ and ρ through a character χ, the same holds with Ext_{M_P,χ} and Ext_{G,χ}.

*Hypotheses and conventions.* H_q(N_P, Σ) Hausdorff for all q (holds for locally algebraic Σ and for self-extensions of locally algebraic representations whose restriction to the derived group is locally algebraic). The source proves derived induction reciprocity for irreducible locally algebraic ρ via the finite-resolution condition (FIN), SCH11 pp. 80–81. The same argument extends to finite successive extensions of such ρ because (FIN) and the required Tor vanishing are extension-stable. For the Ext notation of LR.1, also require each H_q(N_P,Σ) admissible as an M_P-representation; Hausdorff compact type by itself does not imply admissibility. This holds in the locally algebraic finite-length principal-series applications once the finite-E smooth Jacquet supplier contract is supplied.

*Acceptance examples.* For Σ = W ⊗ π locally algebraic, the E_2-terms are Ext^p_{M_P}(H_q(n_P, W) ⊗ J_{N_P}(π), ρ), computed by LR.4/torus-ext when M_P = T.

*Proof sketch.* Use the (FIN) resolution for ρ′ and Tor_q^{D(P)}(D(G),ρ′)=0 for q>0, SCH11 (4.28)–(4.32), pp. 80–81. This gives derived Frobenius reciprocity for the specified locally algebraic ρ; it is not an assertion of unrestricted flatness over D(P). Derive: Ext_G(Σ, Ind ρ) = Ext_{D(P)}(ρ′, Σ′), and the Hochschild–Serre spectral sequence for D(N_P) ⊆ D(P) with Hausdorff homology identifies the E_2-terms (SCH11 §4).

*Sources.* [SCH11](#references), §4, Corollaire 4.9, (4.37)–(4.38), p. 82: Corollary 4.9 uses the preceding irreducible locally algebraic ρ and compact-type Σ. Hausdorff unipotent homology supplies locally analytic Levi coefficients. The statement here further restricts these to admissible coefficients to fit LR.1’s Ext notation. [DING25](#references), §3.1.2, proof of Lemma 3.5, (3.8), p. 37: Applies Schraen's spectral sequence for G = Res_{K/ℚ_p}GL_n, checking the separatedness hypothesis for π_alg(φ, h) and its self-extensions (locally algebraic after restriction to SL_n(K)).

*Needs.* `LR.4/unipotent-homology`, `LR.4/locally-analytic-induction`, `LR.1/ext-groups`.

*Planet:* Schraen's spectral sequence.

### Examples

- **Locally analytic parabolic induction.** For G = GL_2(ℚ_p), P = B^- and a locally analytic character χ, (Ind_{B^-}^G χ)^an ≅ C^an(ℙ^1(ℚ_p), E) as topological vector spaces.
- **Locally analytic principal series.** For GL_2(ℚ_p) and χ = z^λ with λ = (k, 0), k ≥ 0, PS(χ)_lalg = (Ind_{B^-}^G 1)^∞ ⊗ Sym^k(E²).
- **Ext groups between locally analytic characters of a torus.** For n = 1 and L = ℚ_p, Ext^1_{ℚ_p^×}(1, 1) is two-dimensional, spanned by the valuation and log_p.
- **Homology of locally analytic representations under a unipotent radical.** For upper N in GL₂ and W=Sym^k(E²), H₀(n,W) has weight (0,k); for lower N⁻ it has weight (k,0). The Levi action must remember which radical was used.
- **Schraen's spectral sequence for Ext into a parabolic induction.** For Σ = W ⊗ π locally algebraic, the E_2-terms are Ext^p_{M_P}(H_q(n_P, W) ⊗ J_{N_P}(π), ρ), computed by LR.4/torus-ext when M_P = T.

### Dependencies

`LocallyAnalyticDistributions:L0`, `LocallyAnalyticRepresentationsOfLocalGroups:LR.0`, `LocallyAnalyticRepresentationsOfLocalGroups:LR.1`, `LocallyAnalyticRepresentationsOfLocalGroups:LR.2`, `ReductiveGroupsPartII:RG2.4`, `SmoothRepresentationsOfLocalGroups:SR.2`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-3-enveloping-algebra-verma-modules-and-lλ`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-4-the-classification-of-finite-dimensional-irreducibles`.

## Layer LR.5: Orlik–Strauch functors

The Orlik–Strauch functor F^G_P(M, π_P) in Breuil's locally ℚ_p-analytic form, its exactness and transitivity, the irreducibility criterion and uniqueness, Jordan–Hölder series, socles and full faithfulness, the extension to products of groups over different fields, and the vanishing of Ext¹ into inductions from weights at Bruhat distance at least two. The ℚ_p-analytic irreducibility assumptions are distinguished from the original L-analytic bounds. The cited full-faithfulness theorem is only L-analytic with trivial smooth input.

**Coverage:** partial. Supply the category-O/Verma-layer contract and finite-E smooth finite-length induction; do not use the L-analytic trivial-input full-faithfulness theorem outside its stated scope.

#### Vanishing of Ext¹ into inductions from non-adjacent weights (`ext-vanishing-long-weyl`, theorem)

Let 𝐆 = Res_{L/ℚ_p}GL_n with the notation of Ding, μ ∈ X^+ dominant, π a smooth admissible representation of G = GL_n(L), W := L(μ) ⊗_E π, s ∈ S_n^{|Σ_L|} ≅ W_{Σ_L}, I ⊆ Δ such that s·μ is dominant for the Levi L_I of the standard parabolic P_I, and π_I a finite-length smooth representation of L_I(L). If lg(s) > 1 then (1) Ext^1_G(W, (Ind_{P_I^-}^G L(s·μ)_I ⊗ π_I)^{ℚ_p-an}) = 0 and (2) Ext^1_G(W, F^G_{P_I^-}(L^-(−s·μ), π_I)) = 0. Consequently, push-forward along an injection V ↪ V′ of admissible representations whose cokernel has only constituents of the form F^G_{P_J^-}(L^-(−s·μ), π′) with lg(s) > 1 is an isomorphism on Ext^1_G(W, −).

*Hypotheses and conventions.* lg(s) > 1: weights at distance at least two in the Bruhat order from μ do not meet H_0 or H_1(N_I, W).

*Acceptance examples.* For n = 2 there is no s with lg(s) > 1 in a single factor, so the statement has content only for n ≥ 3 or d_L ≥ 2.

*Proof sketch.* For the lower unipotent radical of P_I⁻, apply the correctly dualised Kostant formula to W=L(μ)⊗π. The degree-r Levi weights are w·μ for the relevant Levi-dominant representatives of length r. These are the lower-radical weights, not an unadjusted upper-radical formula. For r ∈ {0, 1} the weights w·μ with lg(w) ≤ 1 differ from s·μ when lg(s) > 1, so Ext^r_{L_I}(H_i(N_I, W), L(s·μ)_I ⊗ π_I) = 0 (LR.1/locally-algebraic-ext); Schraen's spectral sequence (separatedness holds for locally algebraic W) gives (1). F^G_{P_I}(L^-(−s·μ), π_I) is a subrepresentation of the induction whose quotient has no locally algebraic vectors, so Hom_G(W, quotient) = 0 and (2) follows from (1). Use the finite-length version of the spectral-sequence target, obtained by dévissage in the locally algebraic inducing representation. For the final push-forward isomorphism, each cokernel factor has no locally algebraic vectors, so Hom_G(W,−)=0 as well as Ext¹_G(W,−)=0; both terms of the long exact sequence are required.

*Sources.* [DING19](#references), §2.3.2, Lemma 2.26 and its proof, p. 29: For lg(s) > 1, Ext^1 from a locally algebraic L(μ) ⊗ π into the parabolic induction of L(s·μ)_I ⊗ π_I and into F^G_{P_I}(L(−s·μ), π_I) vanishes, by Schraen's spectral sequence, Kostant's theorem and Schraen's Proposition 4.7. [DING19](#references), §2.3.2, proof of Proposition 2.27, p. 29: Deduces push-forward isomorphisms by dévissage from Lemma 2.26. [DING25](#references), §3.1.2, proofs of Lemma 3.5 and Proposition 3.6 and (3.10), pp. 37–38: Cites [32, Lem. 2.26] (Ding 2019) for the push-forward isomorphisms used to define (3.10) and to compute Ext^1(π_alg, C(I, s_{i,σ})).

*Needs.* `LR.4/schraen-spectral-sequence`, `LR.1/locally-algebraic-ext`, `LR.1/locally-algebraic-representation`, `LR.5/orlik-strauch-functor`.

#### The Orlik–Strauch functor (`orlik-strauch-functor`, construction)

Let M ∈ O^p_alg and π_P a smooth admissible representation of L_P(L) over E, inflated to P(L). Choose a finite-dimensional U(p ⊗_{ℚ_p} E)-stable subspace W ⊆ M generating M, so that there is an exact sequence 0 → ker(φ) → U(g ⊗ E) ⊗_{U(p ⊗ E)} W → M → 0; W carries the unique algebraic action of (Res_{L/ℚ_p}P) ×_{ℚ_p} E lifting the p ⊗ E-action, restricted to P(L), and W′ = Hom_E(W, E) the dual action. An element x ⊗ w of U(g ⊗ E) ⊗_E W acts on C^{ℚ_p-an}(G, W′ ⊗ π_P) by f ↦ (g ↦ (x·f)(g)(w)) with the derived action of LR.0/derived-lie-action, and this descends to U(g ⊗ E) ⊗_{U(p ⊗ E)} W on the induction. The Orlik–Strauch representation is F^G_P(M, π_P) := (Ind_{P(L)}^{G(L)} W′ ⊗_E π_P)^{ker(φ)}, the closed subspace of the locally ℚ_p-analytic induction (LR.4/locally-analytic-induction) annihilated by ker(φ). It is a closed G(L)-stable subspace, independent of the choice of W, admissible, strongly admissible when π_P has finite length, and very strongly admissible when π_P is. Write F^G_P(M) := F^G_P(M, 1).

*Hypotheses and conventions.* 𝐆 split connected reductive over L, B = TN ⊆ P = L_P N_P a Borel and a parabolic (standard or opposite), E/ℚ_p finite splitting L; O^p_alg is the category of the gap 'Category O and Kostant homology' for the ℚ_p-Lie algebra g ⊗_{ℚ_p} E = ∏_σ g_σ: finitely generated U(g ⊗ E)-modules, direct sums of simple algebraic U(l_P ⊗ E)-modules, locally finite for n_P ⊗ E. The theory of Orlik–Strauch is for locally L-analytic representations of G(L); Breuil extends it to the locally ℚ_p-analytic setting used here (Breuil states p > 3 if G has factors not of type A; no restriction for GL_n).

*Uses.* Ding, Proposition 3.1 and (3.1), p. 34: C(w, u) := F^{GL_n}_{B^-}(L^-(−u·λ), w(φ)η), the constituents of PS(w(φ), h). BHS, (5.3), p. 387 and §5.2–5.4: F^{G_p}_{B_p}(δ) and the multiplicities m_{δ,Π} of companion constituents. Colmez–Dospinescu–Nizioł, Remark 1.6 (route not in scope): finiteness of length of duals of differential forms on the Drinfeld space. PadicHodgeParametersInLocallyAnalyticRepresentations, contract LA2 and LA6: the constituents C(I, s_{i,σ}) and the Orlik–Strauch/Jacquet–Emerton compatibility (3.10).

*API* (namespace `TauCeti.LocallyAnalytic`):

- `orlikStrauch` (constructor): F^G_P(M, π_P) := (Ind_P^G W′ ⊗ π_P)^{ker φ}, a closed subrepresentation of the induction.
- `orlikStrauch_indep` (extensionality): F^G_P(M, π_P) does not depend on the generating subspace W ⊆ M.
- `orlikStrauch_map` (functoriality): Contravariant in M ∈ O^p_alg and covariant in π_P, with map_id and map_comp.
- `orlikStrauch_isAdmissible` (other): F^G_P(M, π_P) is admissible; strongly admissible if π_P has finite length; very strongly admissible if π_P is.
- `orlikStrauch_verma` (example): F^G_P(U(g ⊗ E) ⊗_{U(p ⊗ E)} W, π_P) = (Ind_P^G W′ ⊗ π_P)^an.
- `orlikStrauch_finiteDim` (example): For M finite-dimensional algebraic (so M ∈ O^g_alg), F^G_P(M, π_P) ≅ M′ ⊗_E (Ind_P^G π_P)^∞, locally algebraic.
- `orlikStrauch_dual` (characterisation): Start with the completed balanced induction dual D(G,E) ⊗̂_{D(P,E)} (W ⊗ π_P′). The annihilator of the differential-equation kernel is the closed D(G)-span of the induced relations, giving the Hausdorff quotient dual to F^G_P(M,π_P). BR16 Lemma 2.2 gives a dense image from the corresponding algebraic tensor, not an algebraic isomorphism in this generality.

**Checks.**

- `orlikStrauch_zero` (degenerate): F^G_P(0, π_P) = 0 and F^G_P(M, 0) = 0.
- `orlikStrauch_verma_test` (computation): For a Verma module M^-(μ) = U(g ⊗ E) ⊗_{U(b^- ⊗ E)} μ with μ an algebraic weight and a smooth character χ of T, F^G_{B^-}(M^-(μ), χ) = (Ind_{B^-}^G z^{−μ} χ)^an, the principal series of LR.4/principal-series.
- `orlikStrauch_finiteDim_test` (computation): For λ dominant, F^G_{B^-}(L^-(−λ), χ) = F^G_{B^-}(L(λ)^∨, χ) ≅ L(λ) ⊗ (Ind_{B^-}^G χ)^∞, the locally algebraic representation.
- `orlikStrauch_Lanalytic_compat` (compatibility): For L = ℚ_p the representation is the Orlik–Strauch F^G_P(M, π_P) of OS15 for the L-analytic group G(ℚ_p).
- `orlikStrauch_not_induction` (non-example): For λ dominant and the simple quotient L^-(−λ) of the Verma module, F^G_{B^-}(L^-(−λ), χ) is a proper closed subrepresentation of (Ind_{B^-}^G z^λ χ)^an, not the whole induction.

*Acceptance examples.* For a generalised Verma module M = U(g ⊗ E) ⊗_{U(p ⊗ E)} W one has ker(φ) = 0 and F^G_P(M, π_P) = (Ind_P^G W′ ⊗ π_P)^an.

*Proof sketch.* The derived U(g ⊗ E)-action on C^an(G, W′ ⊗ π_P) and the pairing with W give continuous maps x ⊗ w : C^an(G, W′ ⊗ π_P) → C^an(G, π_P); on the induction they factor through U(g ⊗ E) ⊗_{U(p ⊗ E)} W (BR16 Lemma 2.1), so the annihilator of ker(φ) is defined and closed. It is G-stable because the left-derivative action (5) of BR16 commutes with right translation. Independence of W and admissibility follow from the analytic norm-completion presentations of OS15 §4 and BR16 Theorem 2.3(i), with the closed annihilator relations in the completed induction dual. BR16 Lemma 2.2 alone gives only a dense algebraic image. Very strong admissibility follows by the closed subrepresentation of the induction, applying EMJ2 Proposition 2.1.2 to W′⊗π_P via the finite-dimensional algebraic tensor identity.

*Sources.* [OS15](#references), Introduction, p. 3; §4.1, p. 18: Defines F^G_P(M, V) = Ind^G_P(W′ ⊗_K V)^d as the subspace of the induction killed by the kernel d of U(g) ⊗_{U(p)} W → M, and the functor F^G_P(M) = (D(G) ⊗_{D(g,P)} M)′ for the L-analytic setting. [OS15](#references), §4, Proposition 4.8, p. 22; §3, Proposition 3.3(i), p. 11: F^G_P(M, V) is admissible for every M and smooth admissible V, strongly admissible if V has finite length. [BR16](#references), §2, Lemmas 2.1–2.2 and Theorem 2.3(i), pp. 7–10: Extends the construction to the locally ℚ_p-analytic setting for Res_{L/ℚ_p}G with g ⊗_{ℚ_p} E = ∏_σ g_σ, defining F^G_P(M, π_P) = (Ind W′ ⊗ π_P)^{ker φ} and proving independence of W.

*Needs.* `LR.4/locally-analytic-induction`, `LR.0/derived-lie-action`, `LR.1/admissible-representation`, `LR.2/very-strongly-admissible`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-3-enveloping-algebra-verma-modules-and-lλ`, `SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

*Planet:* Orlik–Strauch functor.

#### Exactness and functoriality of the Orlik–Strauch functor (`orlik-strauch-exactness`, theorem)

F^G_P : O^p_alg × Rep^{∞,adm}_E(L_P(L)) → Rep^a_E(G(L)) is a bifunctor, contravariant in M and covariant in π_P, and exact in each argument.

*Hypotheses and conventions.* 𝐆 split connected reductive over L, B = TN ⊆ P = L_P N_P a Borel and a parabolic (standard or opposite), E/ℚ_p finite splitting L; O^p_alg is the category of the gap 'Category O and Kostant homology' for the ℚ_p-Lie algebra g ⊗_{ℚ_p} E = ∏_σ g_σ: finitely generated U(g ⊗ E)-modules, direct sums of simple algebraic U(l_P ⊗ E)-modules, locally finite for n_P ⊗ E.

*Acceptance examples.* Applied to 0 → K → M^-(−λ) → L^-(−λ) → 0 it gives 0 → F(L^-(−λ), χ) → PS → F(K, χ) → 0.

*Proof sketch.* For exactness in M, choose compatible finite-dimensional P-stable generating spaces and diagrams of generalised Verma presentations. Pass to the analytic norm completions where the flatness theorem applies, prove exactness there, and recover the locally analytic representations by the compact-type duality (OS15 Proposition 4.2, pp. 18–19; BR16 Theorem 2.3(ii)). This does not assert blanket flatness of D(G) over D(g,P) on arbitrary modules. For the smooth variable, use an analytic section on compact charts and the presentation with analytic-function factor and algebraic smooth tensor factor; exactness of the latter preserves the finite differential-equation kernel (OS15 Proposition 4.9(a), p. 22). Dualise with strictness of the admissible category.

*Sources.* [OS15](#references), Introduction, main theorem (i)–(ii), p. 3; §4, Proposition 4.9(a), p. 22: F^G_P is functorial in both arguments, contravariant in M and covariant in V, and exact in both arguments. [BR16](#references), §2, Theorem 2.3(ii), p. 10: The construction (M, π_P) ↦ F^G_P(M, π_P) is functorial and exact in both arguments in the locally ℚ_p-analytic setting. [OS15](#references), §4, Proposition 4.2, pp. 18–19: Exactness in the category-O variable is proved through generating-space presentations and analytic completions.

*Needs.* `LR.5/orlik-strauch-functor`, `LR.1/admissible-abelian-category`, `SmoothRepresentationsOfLocalGroups:SR.2/induction-exactness`.

#### Transitivity of the Orlik–Strauch functor along parabolics (`orlik-strauch-transitivity`, theorem)

If Q ⊇ P are parabolic subgroups and M ∈ O^q_alg ⊆ O^p_alg, then F^G_P(M, π_P) ≅ F^G_Q(M, i^{L_Q}_{P ∩ L_Q}(π_P)) for every smooth admissible π_P, where i^{L_Q}_{P∩L_Q}(π_P) = (Ind_{P(L) ∩ L_Q(L)}^{L_Q(L)} π_P)^∞ is smooth parabolic induction (of finite length when π_P is).

*Hypotheses and conventions.* 𝐆 split connected reductive over L, B = TN ⊆ P = L_P N_P a Borel and a parabolic (standard or opposite), E/ℚ_p finite splitting L; O^p_alg is the category of the gap 'Category O and Kostant homology' for the ℚ_p-Lie algebra g ⊗_{ℚ_p} E = ∏_σ g_σ: finitely generated U(g ⊗ E)-modules, direct sums of simple algebraic U(l_P ⊗ E)-modules, locally finite for n_P ⊗ E.

*Acceptance examples.* For P = B, Q = G and M = L(λ)^∨ finite-dimensional: F^G_B(L(λ)^∨, χ) ≅ L(λ) ⊗ (Ind_B^G χ)^∞.

*Proof sketch.* For M ∈ O^q_alg one may take W ⊆ M stable under q, so the induction from P factors through Q by transitivity of locally analytic induction (LR.4/locally-analytic-induction); the condition 'killed by ker φ' only involves the algebraic part along L_Q, and on the smooth part the inner induction is the smooth one.

*Sources.* [OS15](#references), Introduction, main theorem (iii), p. 3; §4, Proposition 4.9(b), p. 22: For M ∈ O^q_alg, F^G_P(M, V) = F^G_Q(M, i^{L_Q}_{L_P}(V)) with smooth induction in the middle. [BR16](#references), §2, (8), p. 10: The same identity in the locally ℚ_p-analytic setting, by the proof of OS Proposition 4.10(b).

*Needs.* `LR.5/orlik-strauch-functor`, `LR.4/locally-analytic-induction`, `SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction`, `SmoothRepresentationsOfLocalGroups:SR.2/induction-in-stages`.

#### The Orlik–Strauch irreducibility theorem (`orlik-strauch-irreducibility`, theorem)

Let M ∈ O^p_alg and π_P a smooth admissible representation of L_P(L). Then F^G_P(M, π_P) is topologically irreducible if and only if M is simple and, for the parabolic Q ⊇ P maximal for M (the largest Q with M ∈ O^q_alg), the smooth induction i^{L_Q}_{P∩L_Q}(π_P) is irreducible. In particular, for M simple with maximal parabolic P and π_P irreducible, F^G_P(M, π_P) is irreducible. Moreover F^G_{Q_1}(M_1, π_{Q_1}) ≅ F^G_{Q_2}(M_2, π_{Q_2}) for simple M_i with maximal parabolics Q_i and finite-length π_{Q_i} if and only if M_1 ≅ M_2 (hence Q_1 = Q_2) and π_{Q_1} ≅ π_{Q_2}. For this locally ℚ_p-analytic form assume p > 3 if 𝐆 has any factors not of type A, as in BR16 §1, p. 6; there is no restriction for GL_n. In the original locally L-analytic OS15 theorem the sharper bounds are p > 2 for B,C,F₄ and p > 3 for G₂.

*Hypotheses and conventions.* 𝐆 split connected reductive over L, B = TN ⊆ P = L_P N_P a Borel and a parabolic (standard or opposite), E/ℚ_p finite splitting L; O^p_alg is the category of the gap 'Category O and Kostant homology' for the ℚ_p-Lie algebra g ⊗_{ℚ_p} E = ∏_σ g_σ: finitely generated U(g ⊗ E)-modules, direct sums of simple algebraic U(l_P ⊗ E)-modules, locally finite for n_P ⊗ E. The stated ℚ_p-analytic result uses Breuil’s conservative p>3 assumption for every non-A factor. The sharper locally L-analytic bounds are recorded separately and are not silently promoted to this extension.

*Acceptance examples.* For GL_2(ℚ_p), λ dominant and s the simple reflection, F^G_{B^-}(L^-(−s·λ), χ) is irreducible: the 'non-locally-algebraic' constituent of PS(z^λ χ).

*Proof sketch.* Reduce by LR.5/orlik-strauch-transitivity to P maximal for M. OS15 Theorem 5.3: for M simple with P maximal, D(G_0) ⊗_{D(g, P_0)} M is a simple D(G_0)-module for a compact open G_0, via a careful analysis of the D(g, P_0)-module structure and Jantzen-type arguments; then irreducibility under G follows (OS15 Theorems 5.3, 5.8). Uniqueness (BR16 Cor. 2.7): the n-invariants of the dual recover the highest weight of M and π_Q′ (BR16 Proposition 2.4).

*Sources.* [OS15](#references), Introduction, main theorem (iv) and the remark after it, pp. 3–4; §5, Assumption 5.1, p. 25; Theorem 5.8, p. 37: F^G_P(M, V) is topologically irreducible iff M is simple and the smooth induction to the maximal parabolic for M is irreducible, under p > 2 for types B, C, F_4 and p > 3 for G_2; the authors know no counterexample for small p. [BR16](#references), §2, Theorem 2.3(iii) and Corollary 2.7, pp. 10–12: In the ℚ_p-analytic setting, F^G_P(M, π_P) is irreducible for M simple, P maximal for M and π_P irreducible; F^G_{Q_1}(M_1, π_{Q_1}) ≅ F^G_{Q_2}(M_2, π_{Q_2}) iff M_1 ≅ M_2 and π_{Q_1} ≅ π_{Q_2}.

*Needs.* `LR.5/orlik-strauch-exactness`, `LR.5/orlik-strauch-transitivity`, `SmoothRepresentationsOfLocalGroups:SR.3/finite-length`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-3-enveloping-algebra-verma-modules-and-lλ`.

*Planet:* Orlik–Strauch irreducibility theorem.

#### Jordan–Hölder series and socles of Orlik–Strauch representations (`orlik-strauch-jordan-holder`, theorem)

(1) For M ∈ O^p_alg with Jordan–Hölder series M = M^0 ⊋ M^1 ⊋ … ⊋ M^{r+1} = 0 there is a filtration of F^G_P(M, π_P) by closed subrepresentations with graded pieces F^G_P(M^i/M^{i+1}, π_P); refining it gives a Jordan–Hölder series whose irreducible constituents are the F^G_{Q_i}(M^i/M^{i+1}, π′) for π′ running over the constituents of i^{L_{Q_i}}_{P∩L_{Q_i}}(π_P), Q_i the maximal parabolic of M^i/M^{i+1}; the multiplicity of F^G_Q(L, π_Q) is [M : L]·[i^{L_Q}_{P∩L_Q}(π_P) : π_Q]. (2) (Socle.) For W an irreducible algebraic representation of L_P of highest weight λ_W, M the simple quotient of U(g ⊗ E) ⊗_{U(p ⊗ E)} W with maximal parabolic Q ⊇ P, and π_P of finite length: soc_G F^G_P(M, π_P) = F^G_Q(M, soc_{L_Q} i^{L_Q}_{P∩L_Q} π_P) = soc_G (Ind_P^G W′ ⊗ π_P)^an. (3) H^0(N_Q(L), F^G_Q(M, π_Q)′) ≅ W(Q) ⊗_E π_Q′ as L_Q(L)-representations, W(Q) the irreducible algebraic representation of L_Q of highest weight λ_W. (4) (Full faithfulness, L-analytic case.) For M_1, M_2 ∈ O^p_alg, Hom_{O^p_alg}(M_1, M_2) → Hom_G(F^G_P(M_2), F^G_P(M_1)) is bijective.

*Hypotheses and conventions.* 𝐆 split connected reductive over L, B = TN ⊆ P = L_P N_P a Borel and a parabolic (standard or opposite), E/ℚ_p finite splitting L; O^p_alg is the category of the gap 'Category O and Kostant homology' for the ℚ_p-Lie algebra g ⊗_{ℚ_p} E = ∏_σ g_σ: finitely generated U(g ⊗ E)-modules, direct sums of simple algebraic U(l_P ⊗ E)-modules, locally finite for n_P ⊗ E. Use the residue-characteristic hypotheses of LR.5/orlik-strauch-irreducibility. In (1), require π_P finite length so that the refined series is finite. Part (4) is only the locally L-analytic result with trivial smooth argument, OR19 Theorem 1, p. 2; no ℚ_p-analytic or arbitrary-smooth-argument extension is used downstream.

*Acceptance examples.* For GL_2(ℚ_p) and λ dominant: PS(z^λ χ) has length 2 when (Ind χ)^∞ is irreducible, with socle L(λ) ⊗ (Ind χ)^∞ and cosocle F(L^-(−s·λ), χ).

*Proof sketch.* (1): exactness (LR.5/orlik-strauch-exactness) turns a Jordan–Hölder series of M into a filtration; each graded piece is F^G_P(M_i, π_P) with M_i simple, which by transitivity equals F^G_{Q_i}(M_i, i(π_P)), and exactness in the second argument plus irreducibility (LR.5/orlik-strauch-irreducibility) refine it. (2)–(3): BR16 Proposition 2.4 computes N_Q-invariants of the dual; an irreducible subrepresentation F^G_Q(M, π_Q) gives a quotient W(Q) ⊗ π_Q′ of W(Q) ⊗ i(π_P)′, so π_Q lies in the socle of the smooth induction; constituents with other M̃ are excluded by comparing torus weights of highest weight vectors (BR16 Cor. 2.5). (4): Orlik's Casselman–Jacquet-type functor G^G_P(U) = colim_k H^0(u_P^k, U′) is almost a section of F^G_P (OR19).

*Sources.* [OS15](#references), §6.2, (6.2.1) and the following discussion, pp. 41–42: From a Jordan–Hölder series of M one gets a filtration of F^G_P(M, V) with graded pieces F^G_P(M^i/M^{i+1}, V); refining gives a Jordan–Hölder series with constituents F^G_{Q_i}(M^i/M^{i+1}, v^{Q_i}_Q). [BR16](#references), §2, Proposition 2.4 and Corollary 2.5 with proof, pp. 10–12: Computes H^0(N_Q, F^G_Q(M, π_Q)′) = W(Q) ⊗ π_Q′ and the socle of F^G_P(M, π_P) and of the induction. [OR19](#references), Introduction, Theorem 1, p. 2: For M_1, M_2 ∈ O^p_alg the map Hom(M_1, M_2) → Hom_G(F^G_P(M_2), F^G_P(M_1)) is bijective. [BHS19](#references), §5.2, p. 395: Uses the structure of Verma modules and the Orlik–Strauch theory to list the irreducible constituents of F^{G_p}_{B_p}(δ_{R,w}).

*Needs.* `LR.5/orlik-strauch-irreducibility`, `LR.5/orlik-strauch-exactness`, `LR.5/orlik-strauch-transitivity`, `LR.1/admissible-abelian-category`, `SmoothRepresentationsOfLocalGroups:SR.3/finite-length`.

*Planet:* Orlik–Strauch Jordan–Hölder theorem.

#### Orlik–Strauch theory for products of groups over different fields (`orlik-strauch-products`, theorem)

Let G = G_1(L_1) × G_2(L_2) with 𝐆_i split reductive over finite extensions L_i/ℚ_p (not necessarily equal) and E splitting L_1 and L_2. With g ⊗_{ℚ_p} E = (g_1 ⊗ E) × (g_2 ⊗ E), parabolics P = P_1 × P_2 and O^p_alg defined for g ⊗ E, the constructions and results of LR.5 hold for locally ℚ_p-analytic representations of G over E: F^G_P(M_1 ⊠ M_2, π_1 ⊠ π_2) ≅ F^{G_1}_{P_1}(M_1, π_1) ⊗̂_E F^{G_2}_{P_2}(M_2, π_2); the exactness, transitivity, irreducibility, Jordan–Hölder and socle statements. The product versions of LR.6 are treated after those adjunctions are defined; they are not prerequisites for this LR.5 target.

*Hypotheses and conventions.* 𝐆 split connected reductive over L, B = TN ⊆ P = L_P N_P a Borel and a parabolic (standard or opposite), E/ℚ_p finite splitting L; O^p_alg is the category of the gap 'Category O and Kostant homology' for the ℚ_p-Lie algebra g ⊗_{ℚ_p} E = ∏_σ g_σ: finitely generated U(g ⊗ E)-modules, direct sums of simple algebraic U(l_P ⊗ E)-modules, locally finite for n_P ⊗ E. This is a genuine proof obligation: the source asserts the extension after an examination of the proofs and gives no argument.

*Acceptance examples.* For G_2 = 1 the statement is the theory of LR.5 for G_1(L_1).

*Proof sketch.* Enveloping algebras and root data factor over the groups and embeddings. Simple category-O objects are external tensor products of simple objects; arbitrary finite-length objects need not be pure tensors and are handled by finite extensions and exactness. For M = M_1 ⊠ M_2 choose W = W_1 ⊠ W_2; the induction from P_1 × P_2 is the completed tensor product of the inductions (LR.0/completed-external-tensor), and ker(φ) = ker(φ_1) ⊗ U_2 + U_1 ⊗ ker(φ_2), giving the tensor product formula. For simple objects, run the irreducibility and invariant-weight arguments factor by factor, using the product Bruhat and Iwasawa decompositions and compact-open analytic distribution presentations. Extend the finite-length statements using the exact functors. LR.6 adjunctions require their own later product argument, as indicated in BHS Remark 5.1.2; they are not used here.

*Sources.* [BHS19](#references), §5.1, Remark 5.1.2, p. 388: The Orlik–Strauch results used are stated only for G(K) with G split reductive over K and L splitting K, but are needed for products G_1(K_1) × G_2(K_2) with K_1 ≠ K_2; an examination of the proofs (and of the results of Orlik–Strauch and Emerton on which they rely) shows that they extend when L splits K_1 and K_2. [BHS19](#references), §5.2, p. 390: Writes F^{G_p}_{B_p}{L(−μ), ε_sm δ^{-1}_{B_p}} ≃ ⊗̂_{v∈S_p} F^{G_v}_{B_v}{L(−μ_v), ε_sm δ^{-1}_{B_v}} for the product group G_p = ∏_v G_v.

*Needs.* `LR.5/orlik-strauch-jordan-holder`, `LR.0/completed-external-tensor`, `LR.1/admissible-external-tensor`.

### Examples

- **Vanishing of Ext¹ into inductions from non-adjacent weights.** For n = 2 there is no s with lg(s) > 1 in a single factor, so the statement has content only for n ≥ 3 or d_L ≥ 2.
- **The Orlik–Strauch functor.** For a generalised Verma module M = U(g ⊗ E) ⊗_{U(p ⊗ E)} W one has ker(φ) = 0 and F^G_P(M, π_P) = (Ind_P^G W′ ⊗ π_P)^an.
- **Exactness and functoriality of the Orlik–Strauch functor.** Applied to 0 → K → M^-(−λ) → L^-(−λ) → 0 it gives 0 → F(L^-(−λ), χ) → PS → F(K, χ) → 0.
- **Transitivity of the Orlik–Strauch functor along parabolics.** For P = B, Q = G and M = L(λ)^∨ finite-dimensional: F^G_B(L(λ)^∨, χ) ≅ L(λ) ⊗ (Ind_B^G χ)^∞.
- **The Orlik–Strauch irreducibility theorem.** For GL_2(ℚ_p), λ dominant and s the simple reflection, F^G_{B^-}(L^-(−s·λ), χ) is irreducible: the 'non-locally-algebraic' constituent of PS(z^λ χ).
- **Jordan–Hölder series and socles of Orlik–Strauch representations.** For GL_2(ℚ_p) and λ dominant: PS(z^λ χ) has length 2 when (Ind χ)^∞ is irreducible, with socle L(λ) ⊗ (Ind χ)^∞ and cosocle F(L^-(−s·λ), χ).
- **Orlik–Strauch theory for products of groups over different fields.** For G_2 = 1 the statement is the theory of LR.5 for G_1(L_1).

### Dependencies

`LocallyAnalyticRepresentationsOfLocalGroups:LR.0`, `LocallyAnalyticRepresentationsOfLocalGroups:LR.1`, `LocallyAnalyticRepresentationsOfLocalGroups:LR.2`, `LocallyAnalyticRepresentationsOfLocalGroups:LR.4`, `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-3-enveloping-algebra-verma-modules-and-lλ`.

## Layer LR.6: Emerton's Jacquet functor, closed induction and the adjunction theorems

Rigid character varieties of abelian locally analytic groups, essentially admissible representations, finite slope parts, Emerton's locally analytic Jacquet functor J_P with its admissibility and locally algebraic computation, the closed induction I_P^G, balanced maps, Emerton's adjunction theorem and Breuil's adjunction for Orlik–Strauch representations. Finite-slope universal properties require a stable BH exhaustion. Hecke operators are averaged; the Breuil adjunction converts from the unaveraged convention. The closed/full-induction Jacquet equality is restricted to the quasi-split Borel case.

**Coverage:** partial. Discharge the rigid/adic compact character-space carrier comparison. The averaged Hecke convention, opposite inducing parabolic and Breuil modulus conversion are fixed in this packet.

#### The rigid character variety of an abelian locally analytic group (`character-variety`, construction)

Let Z be an abelian locally F-analytic group which is topologically finitely generated, equivalently Z ≅ Z_0 × Λ with Z_0 compact open (the maximal compact subgroup) and Λ ≅ ℤ^r discrete. The functor Ẑ on rigid analytic spaces X over F, Ẑ(X) = characters Z → O(X)^× that are locally analytic over every affinoid open of X, is representable by a strictly quasi-Stein rigid space, Ẑ ≅ Ẑ_0 × 𝔾_m^{r,an}. Its ring of functions C^an(Ẑ, E) is a Fréchet–Stein algebra, and integration against characters gives a continuous injective algebra map D(Z, E) → C^an(Ẑ, E) with dense image, an isomorphism when Z is compact (the Mellin transform). For T = 𝐓(L) a split torus, T̂ parametrises the locally ℚ_p-analytic characters of T, and a point δ ∈ T̂(E) has weight dδ ∈ ∏_σ t_σ^*.

*Hypotheses and conventions.* Z topologically finitely generated (true for the centre of a Levi of a reductive group and for T = 𝐓(L)). For L ≠ ℚ_p and F = L the compact part needs the Lubin–Tate Fourier theory of Schneider–Teitelbaum; the ℚ_p-analytic case used here reduces to products of ℤ_p-characters (LocallyAnalyticDistributions L3).

*Uses.* Emerton, Jacquet I, Definition 3.2.1: the finite slope part is defined as Z^+-equivariant maps from C^an(Ẑ, E). Emerton, Memoir, Definition 6.4.9: essentially admissible representations are coadmissible over C^an(Ẑ, E) ⊗̂ D(H, E). BHS, §5.1, p. 386: the dual of J_B(Π) is a coherent sheaf on T̂; eigenvarieties are schematic supports. Ding, §3.1.2 and §4: characters δ = w(φ)ηz^λ(1 + ψε) as E[ε]-points of T̂.

*API* (namespace `TauCeti.LocallyAnalytic`):

- `characterVariety` (data): The strictly quasi-Stein rigid character space. An adic presentation is permitted only after the compact character-space supplier’s rigid/adic comparison has been established.
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

*Acceptance examples.* For Z = ℤ_p (F = ℚ_p), Ẑ is the open unit disc via χ ↦ χ(1) − 1, and D(ℤ_p, E) ≅ O(open disc) (Amice).

*Proof sketch.* Decompose Z=Z_0×Λ (EM17 Proposition 6.4.1, p. 124). The discrete factor has character variety 𝔾_m^r. For compact Z_0 import the compact character-space/Mellin construction; after a finite coefficient extension splitting the finite torsion characters it is a finite disjoint union of open polydiscs in the ℚ_p-analytic case. Descend to E if that splitting is not already present. Use the quasi-Stein affinoid exhaustion with noetherian Banach function algebras and flat restriction maps of EM17 Propositions 6.4.5–6.4.6, pp. 126–127, to obtain the Fréchet–Stein algebra. Theorems A and B alone are not a substitute for these noetherian and flatness checks. The adic supplier requires its stated rigid/adic comparison contract. D(Z_0, E) ≅ C^an(Ẑ_0, E) by the Mellin transform (L3/mellin-frechet-isomorphism); D(Λ, E) = E[Λ] is dense in O(𝔾_m^r) (EM17 Prop. 6.4.6).

*Sources.* [EM17](#references), §6.4, Proposition 6.4.1, p. 124; Definition 6.4.2, p. 125; Propositions 6.4.5–6.4.6, pp. 126–127: Characterises topologically finitely generated abelian locally analytic groups as Z_0 × Λ, defines the character functor Ẑ, proves it is representable by a strictly quasi-Stein rigid space, and gives the dense injection D_la(Z, K) → C^an(Ẑ, K), an isomorphism for compact Z (via Schneider–Teitelbaum's Fourier theory).

*Needs.* `LR.0/distribution-algebra`, `LocallyAnalyticDistributions:L3/mellin-frechet-isomorphism`, `LocallyAnalyticDistributions:L3/mellin-adic-comparison`, `AdicSpacesPartII:R3/quasi-stein-space`, `AdicSpacesPartII:R3/quasi-stein-theorems-a-b`, `AdicSpacesPartII:R3/quasi-stein-theorem-a`, `LocallyAnalyticDistributionsPartII:ND.2/frechet-stein-algebra`, `PadicMeasuresIwasawaAlgebras:L0a`.

*Planet:* Character variety of a torus.

#### Essentially admissible representations (`essentially-admissible`, definition)

Let G be a locally analytic group whose centre Z is topologically finitely generated, and H a compact open subgroup. A locally analytic representation V of G on a space of compact type is essentially admissible if the Z-action satisfies the equivalent conditions of Emerton (it extends to a separately continuous C^an(Ẑ, E)-module structure; equivalently V is a union of an increasing sequence of Z-stable BH-subspaces) and, for one (equivalently every) H, the dual V′_b is a coadmissible module over the Fréchet–Stein algebra C^an(Ẑ, E) ⊗̂_E D(H, E). Every admissible representation is essentially admissible; Rep^es_E(G) is abelian.

*Hypotheses and conventions.* Compact type; topologically finitely generated centre.

*Uses.* Emerton, Jacquet I, Theorem 0.5: J_P takes essentially admissible G-representations to essentially admissible M-representations. BHS §5.1: the dual of J_B(Π^an) is a coherent sheaf on T̂ whose support is an eigenvariety.

*API* (namespace `TauCeti.LocallyAnalytic`):

- `IsEssentiallyAdmissible` (data): The Z-action extends to C^an(Ẑ, E) and V′ is coadmissible over C^an(Ẑ, E) ⊗̂ D(H, E).
- `IsAdmissible.isEssentiallyAdmissible` (other): Admissible ⇒ essentially admissible.
- `essentiallyAdmissible_coherentSheaf` (equivalence): V ↦ V′ identifies Rep^es_E(G) with coadmissible C^an(Ẑ) ⊗̂ D(H)-modules with compatible G-action, i.e. G-equivariant coherent sheaves on Ẑ with D(H)-structure.
- `essentiallyAdmissible_abelian` (instance): Rep^es_E(G) is an abelian category with strict morphisms.

**Checks.**

- `essAdm_character` (computation): Under this roadmap’s contragredient left-dual convention, the dual of the character χ is the skyscraper at χ^{-1} in Ẑ. If the geometric parameter is labelled by χ instead, the inversion automorphism of Ẑ must be applied explicitly.
- `essAdm_admissible` (compatibility): Every admissible representation is essentially admissible (EM17 Prop. 6.4.10).
- `essAdm_not_admissible` (non-example): Take G=Z=ℤ discrete, H={1} and V=O(𝔾_m^an)′_b with the contragredient universal character action. It is essentially admissible since its dual is the regular rank-one O(𝔾_m^an)-module. Admissibility for H={1} would force its dual to be finite-dimensional over E, which it is not (EM17 p. 129). Non-finite-generation by itself would not disprove coadmissibility for a general nontrivial H.
- `essAdm_zero` (degenerate): The zero representation is essentially admissible.

*Acceptance examples.* Every character is essentially admissible; for G=ℤ discrete the universal character family O(𝔾_m^an)′ is essentially admissible and infinite-dimensional, hence not admissible.

*Proof sketch.* The C^an(Ẑ, E)-structure, if it exists, is unique (EM17 Prop. 6.4.7). Admissible ⇒ essentially admissible: V is the union of the Z-stable images of V_{H_n-an}, so condition (iii) of EM17 Prop. 6.4.7 holds, and the dual is coadmissible already over D(H, E) (EM17 Prop. 6.4.10).

*Sources.* [EM17](#references), §6.4, Proposition 6.4.7, Definition 6.4.9, Proposition 6.4.10, pp. 127–129: Gives three equivalent conditions for the Z-action to extend to C^an(Ẑ, K), defines essentially admissible representations by coadmissibility of the dual over C^an(Ẑ, K) ⊗̂ D(H, K), and shows admissible representations are essentially admissible. [EMJ1](#references), Introduction, p. 778: The Jacquet module of an admissible representation is essentially admissible but need not be admissible.

*Needs.* `LR.6/character-variety`, `LR.1/admissible-representation`, `LocallyAnalyticDistributionsPartII:ND.2/coadmissible-module`, `LR.0/compact-type-duality`.

*Planet:* Essentially admissible representation.

#### The finite slope part of a Z^+-representation (`finite-slope-part`, construction)

Let Z be a topologically finitely generated abelian locally analytic group and Z^+ ⊆ Z a submonoid containing a compact open subgroup Z_0 and generating Z as a group. For V a Hausdorff locally convex representation of Z^+ of compact type, the finite slope part is V_fs := L_{b,Z^+}(C^an(Ẑ, E), V), the Z^+-equivariant continuous linear maps (Z acts on C^an(Ẑ, E) through Z ⊆ C^an(Ẑ, E)^×), with the strong topology; evaluation at 1 gives a Z^+-equivariant map V_fs → V. V ↦ V_fs is right adjoint to the forgetful functor from locally analytic Z-representations (of compact type, with the C^an(Ẑ)-structure) to topological Z^+-representations.

*Hypotheses and conventions.* Z^+ generates Z as a group and contains a compact open subgroup.

*Uses.* Emerton, Jacquet I, Definition 3.4.5: J_P(V) := (V^{N_0})_fs with Z^+ = Z_M^+ acting by Hecke operators. BHS §5.1 and Ding §4: the finite slope part of completed cohomology at an eigenvariety point.

*API* (namespace `TauCeti.LocallyAnalytic`):

- `finiteSlopePart` (data): V_fs := L_{b,Z^+}(C^an(Ẑ, E), V).
- `finiteSlopePart_eval` (projection): The Z^+-equivariant map V_fs → V, evaluation at 1 ∈ C^an(Ẑ, E).
- `finiteSlopePart_adjunction` (universal-property): Hom_Z(U,V_fs) ≅ Hom_{Z^+}(U,V) for U ∈ Rep^{zla.c}(Z), with a Z-stable BH exhaustion and the resulting O(Ẑ)-structure.
- `finiteSlopePart_leftExact` (functoriality): V ↦ V_fs is left exact and additive.
- `finiteSlopePart_of_la` (characterisation): If Z^+=Z and V ∈ Rep^{zla.c}(Z), then evaluation V_fs→V is an isomorphism.

**Checks.**

- `finiteSlopePart_Z` (degenerate): For Z^+=Z and V ∈ Rep^{zla.c}(Z), V_fs=V; the stable BH exhaustion is part of the test data.
- `finiteSlopePart_zero_operator` (non-example): If z ∈ Z^+ acts by 0 on V then V_fs = 0, since z acts invertibly on C^an(Ẑ, E).
- `finiteSlopePart_finiteDim` (computation): For Z=ℤ, Z^+=ℕ and generator acting by u on finite-dimensional V, V_fs=im(u^N) for N sufficiently large, the Fitting invertible part. A nilpotent u gives zero and an invertible u gives V; after splitting E this is the sum of generalised eigenspaces with nonzero eigenvalue.

*Acceptance examples.* For V ∈ Rep^{zla.c}(Z) and Z^+=Z, evaluation identifies V_fs with V. Here zla means an exhaustive increasing sequence of Z-stable BH subspaces, equivalently the required O(Ẑ)-module structure.

*Proof sketch.* C^an(Ẑ, E) is a locally analytic Z-representation on which Z acts invertibly; maps out of it equivariant for Z^+ are the universal way to make the Z^+-action invertible and locally analytic. For U in Rep^{zla.c}(Z), its Z-stable BH exhaustion gives the continuous O(Ẑ)-module structure. Use this structure to extend the orbit functional associated with a Z^+-map U→V, obtaining a unique map U→V_fs. This argument requires Rep^{zla.c}, not merely a compact-type locally analytic action.

*Sources.* [EMJ1](#references), §3.2, Definition 3.2.1 and the following discussion, p. 796: Defines V_fs := L_{b,Z^+}(C^an(Ẑ, K), V) for V in Rep^{top.c}(Z^+), constructing the right adjoint of the forgetful functor from Rep^{zla.c}(Z). [EMJ1](#references), §3.2, Propositions 3.2.4–3.2.15 (cited in the construction of J_P), pp. 797–803: Establishes the properties of the finite slope part used to define J_P.

*Needs.* `LR.6/character-variety`, `LocallyAnalyticDistributions:L0/bounded-sets-strong-dual`, `LocallyAnalyticDistributions:L0/compact-type-spaces`.

#### Emerton's locally analytic Jacquet functor (`jacquet-emerton-functor`, construction)

Let G be split reductive (or any p-adic reductive group), P = M N a parabolic with Levi M, Z_M the centre of M, N_0 ⊆ N a compact open subgroup, and M^+ := {m ∈ M : m N_0 m^{-1} ⊆ N_0}, Z_M^+ := Z_M ∩ M^+. For a locally analytic representation V of P of compact type, the N_0-invariants V^{N_0} carry the Hecke action of M^+ by π_{N_0,m}(v) = [N_0:mN_0m^{-1}]^{-1} Σ_{n ∈ N_0/mN_0m^{-1}} nm·v, and the Jacquet–Emerton module is J_P(V) := (V^{N_0})_fs (the finite slope part for Z_M^+), a locally analytic representation of M (with its Z_M-action locally analytic). J_P is the right adjoint, twisted by the modulus character δ_P, of C^sm_c(N, −): for U in Rep^{zla.c}(M), Hom_P(C^sm_c(N, U), V) ≅ Hom_M(U(δ_P), J_P(V)). Composing with restriction gives J_P : Rep^{la.c}(G) → Rep^{zla.c}(M). It is left exact, independent of N_0, and agrees with the smooth Jacquet module (SmoothRepresentationsOfLocalGroups SR.2/jacquet-module) on admissible smooth representations.

*Hypotheses and conventions.* Compact-type representations; the Hecke operators require N_0 compact open and M^+ the contracting monoid. δ_P(m)=|det(Ad(m)|n)|_L. For m contracting N_0, δ_P(m)=[N_0:mN_0m^{-1}]^{-1}. All Jacquet modules in this roadmap use Emerton’s averaged action.

*Uses.* Ding, Lemma 3.2(1), p. 34: Hom_{T(K)}(z^{s_{i,σ}·λ} w(φ)ηδ_B, J_B(C(I, s_{i,σ}))) ≅ E. BHS §5.1–5.2: J_{B_p}(Π̂^an) and its dual coherent sheaf on T̂, whose support defines the eigenvariety. PadicHodgeParametersInLocallyAnalyticRepresentations, contract LA6: the Jacquet–Emerton/Orlik–Strauch compatibility (3.10).

*API* (namespace `TauCeti.LocallyAnalytic`):

- `jacquetEmerton` (data): J_P(V) := (V^{N_0})_fs as a locally analytic representation of M.
- `jacquetEmerton_adjunction` (universal-property): Hom_P(C^sm_c(N, U), V) ≅ Hom_M(U(δ_P), J_P(V)) for U ∈ Rep^{zla.c}(M).
- `jacquetEmerton_leftExact` (functoriality): J_P is additive and left exact.
- `jacquetEmerton_indep` (extensionality): J_P(V) does not depend on N_0.
- `jacquetEmerton_smooth` (compatibility): On admissible smooth representations, J_P agrees with the smooth Jacquet module V_N.
- `jacquetEmerton_canonicalLift` (projection): Evaluation J_P(V)→V^{N_0}⊆V is M_0N_0-equivariant for M_0 normalising N_0. It is not asserted to be M-equivariant for the original action on V; the M-action on J_P is reconstructed from the averaged Hecke action.

**Checks.**

- `jacquetEmerton_smooth_test` (compatibility): For π smooth admissible, J_P(π) ≅ π_N (SR.2/jacquet-module).
- `jacquetEmerton_P_eq_G` (degenerate): For P=G, N=1 and V ∈ Rep^{zla.c}(G), J_G(V)=V. The centre must have a stable BH exhaustion; a bare locally analytic compact-type action is not the hypothesis of the finite-slope identity.
- `jacquetEmerton_character_PS` (computation): For a locally analytic character χ of T, χδ_B is a T-eigenline in J_B((Ind_{B^-}^G χ)^an) (EMJ2 Lemma 0.3 with P = B).
- `jacquetEmerton_finiteDim_GL2` (computation): For GL_2(ℚ_p) and W = Sym^k(E²), J_B(W) = W^{N} = the highest-weight line, the character z^{(k,0)} of T (EMJ1 Proposition 4.3.6 with X = 1).
- `jacquetEmerton_Hecke_average_GL2` (computation): Let G=GL₂(ℚ_p), P=B upper triangular, N_0=N(ℤ_p), m=diag(p,1), V=E trivial. The index is p, the sum is p·id and π_{N_0,m}=id. An unaveraged sum would twist J_B(1) and fail J_B(1)=1.

*Acceptance examples.* For V = π smooth admissible, J_P(π) = π_N, the smooth Jacquet module (unnormalised).

*Proof sketch.* V^{N_0} is a closed Z_M^+-stable subspace with Hecke action (EMJ1 §3.3); its finite slope part is defined by LR.6/finite-slope-part. Independence of N_0 and the adjunction (0.4) are EMJ1 §3.4–3.5 (Theorem 3.5.6). Agreement with the smooth Jacquet module: for admissible smooth V, Jacquet's lemma identifies V^{N_0} with finite slope Hecke action and its finite slope part with V_N (SR.2/jacquet-lemma, SR.2/jacquet-invariants).

*Sources.* [EMJ1](#references), Introduction, Theorem 0.3 and (0.4), p. 777: C^sm_c(N, −) has a right adjoint; J_P is defined as this right adjoint twisted by the modulus character, with the adjunction isomorphism (0.4); J_P is left exact and additive and agrees with the usual Jacquet module on admissible smooth representations. [EMJ1](#references), §3.4, Definition 3.4.5, p. 806: Defines J_P(V) := (V^{N_0})_fs for V in Rep^{la.c}(P). [EMJ1](#references), §3.4, Definitions 3.4.1–3.4.2 and Lemma 3.4.3, p. 806; (3.4.8), p. 807: The Hecke operator is the Haar average of mv, with inverse-index factor; evaluation is M_0N_0-equivariant.

*Needs.* `LR.6/finite-slope-part`, `LR.6/essentially-admissible`, `LR.0/locally-analytic-representation`, `SmoothRepresentationsOfLocalGroups:SR.2/jacquet-module`, `SmoothRepresentationsOfLocalGroups:SR.2/modulus-character`, `ReductiveGroupsPartII:RG2.4/iwahori-factorization`.

*Planet:* Emerton's Jacquet functor.

#### Admissibility and computations of Emerton's Jacquet modules (`jacquet-emerton-properties`, theorem)

(1) J_P takes essentially admissible G-representations to essentially admissible M-representations, and J_P : Rep^es_E(G) → Rep^es_E(M) is additive and left exact. (2) If W is a finite-dimensional algebraic representation of G with B = End_G(W) and X an admissible smooth representation of G over B, then J_P(X ⊗_B W) ≅ X_N ⊗_B W^N, with X_N the smooth Jacquet module and W^N = W^{N_0} the N-invariants (locally algebraic representations have locally algebraic Jacquet modules). (3) For G quasi-split and P a Borel: a topologically irreducible very strongly admissible V with J_P(V) ≠ 0 is a subquotient of the locally analytic induction of a locally analytic character of the torus; and an admissible representation of finite length with very strongly admissible constituents has finite-dimensional J_P(V). (4) For Π admissible Banach, J_B(Π^la)′ is a coadmissible C^an(T̂, E)-module, i.e. a coherent sheaf on T̂ with a compatible T-action.

*Acceptance examples.* For π_alg = I_sm(φ) ⊗ L(λ) of GL_n(L) with φ generic, J_B(π_alg) ≅ J_N(I_sm(φ)) ⊗ L(λ)^N is a direct sum of n! distinct characters of T (SmoothRepresentationsOfLocalGroups SR.2/principal-series-jacquet and genericity).

*Proof sketch.* (1) is EMJ1 Theorem 4.2.32: compactness of Hecke operators on the BH-subspaces V_{H-an} (EMJ1 §2) gives coadmissibility of the dual of the finite slope part. (2) is EMJ1 Proposition 4.3.6, from Jacquet's lemma for X (SR.2/jacquet-lemma) and W^{N_0} = W^N. (3) is EMJ1 Theorem 0.6 and EMJ2 Corollaries 0.14–0.15, via the adjunction LR.6/emerton-adjunction. (4) combines (1) for P = B with LR.6/essentially-admissible's description of essentially admissible T-representations as coherent sheaves on T̂.

*Sources.* [EMJ1](#references), Introduction, Theorem 0.5, p. 777; §4.2, Theorem 4.2.32, p. 828: J_P takes essentially admissible representations to essentially admissible ones, giving an additive left exact functor Rep^es(G) → Rep^es(M). [EMJ1](#references), §4.3, Propositions 4.3.4 and 4.3.6, p. 834; Introduction §0.13, p. 779: For X admissible smooth and W algebraic, J_P(X⊗_B W) ≅ X_N⊗_B W^N, using invariants of W, not its coinvariants. [EMJ1](#references), Introduction, Theorem 0.6, p. 778: For G quasi-split and P Borel, an irreducible admissible representation embedding in an admissible Banach representation with J_P(V) ≠ 0 is a subquotient of a locally analytic principal series. [EMJ2](#references), Introduction, Corollaries 0.14–0.15, p. 4: Under the same hypotheses such V is a quotient of I_P^G(U) for a finite-dimensional U, and finite-length admissible representations with very strongly admissible constituents have finite-dimensional J_P. [BHS19](#references), §5.1, p. 386: Uses that the continuous dual of J_{B_p}(Π̂^an) is a coherent sheaf on T̂_p.

*Needs.* `LR.6/jacquet-emerton-functor`, `LR.6/essentially-admissible`, `LR.1/locally-algebraic-representation`, `LR.2/admissible-banach-analytic-vectors`, `LR.2/very-strongly-admissible`, `LR.4/principal-series`, `LR.6/emerton-adjunction`.

#### Emerton's closed induction I_P^G (`closed-induction`, construction)

For U ∈ Rep^{zla.c}(M) (a locally analytic representation of M of compact type on which Z_M acts locally analytically), Lemma 0.3 of Emerton gives a closed M-equivariant embedding U(δ_P) → J_P((Ind_{P^-}^G U)^an) (here P^- is opposite to P, and the induction is the locally analytic induction of LR.4). Composing with the canonical lifting J_P(Ind U) → Ind U, the closed G-subrepresentation I_{P^-}^G(U) ⊆ (Ind_{P^-}^G U)^an generated by the image is Emerton's closed induction. Equivalently it is the closed G-subrepresentation generated by the functions supported on the big cell P^- N with locally constant compactly supported restriction to N (EMJ2 Lemma 2.8.3). When G is quasi-split and P is a Borel, the inclusion induces J_P(I_{P^-}^G(U)) ≅ J_P((Ind_{P^-}^G U)^an).

*Hypotheses and conventions.* The conventions match Ding: induction from P^- = B^- of characters of T, Jacquet module for P = B. U ∈ Rep^{zla.c}(M): the centre has a stable BH exhaustion, not just a locally analytic action. The Jacquet equality from EMJ2 Corollary 5.1.4 is only claimed for quasi-split G and a Borel P.

*Uses.* Ding, Lemma 3.2(2): I_{B^-}(z^{s_{i,σ}·λ} w(φ)η) ≅ C(I, s_{i,σ}). Ding, Proposition 3.3 and Remark 3.7: ζ_w(ψ) = I_{B^-}(w(φ)ηz^λ(1 + ψε)) as self-extensions and extensions of π_alg by subrepresentations of PS_1. Emerton, Jacquet II, Theorem 0.13: the source of the adjunction.

*API* (namespace `TauCeti.LocallyAnalytic`):

- `closedInduction` (constructor): I_{P^-}^G(U) ⊆ (Ind_{P^-}^G U)^an, a closed subrepresentation.
- `closedInduction_le` (relation): I_{P^-}^G(U) ⊆ (Ind_{P^-}^G U)^an; the inclusion is in general proper (for U smooth, I(U) is the smooth induction).
- `closedInduction_jacquet` (characterisation): For quasi-split G and Borel P, J_P(I(U)) ≅ J_P((Ind U)^an).
- `closedInduction_functorial` (functoriality): Functorial in U.
- `closedInduction_lalg` (example): For U = χ_sm z^λ with λ dominant, I(U) = (Ind χ_sm)^∞ ⊗ L(λ).
- `closedInduction_deformed` (example): For a deformed character U = δ(1 + ψε), I(U) is an E[ε]-module and, for δ = w(φ)ηz^λ, ψ = ψ_1 + ψ_0 ∘ det with ψ_1 smooth: I(U) ≅ (Ind w(φ)η(1 + ψ_1ε))^∞ ⊗ L(λ) ⊗ (1 + εψ_0 ∘ det).

**Checks.**

- `closedInduction_smooth` (computation): For U a smooth character χ, I_{B^-}^G(χ) = (Ind_{B^-}^G χ)^∞, the smooth induction, a proper subspace of the locally analytic one.
- `closedInduction_dominant` (computation): For U = z^λ with λ dominant, I_{B^-}^G(U) = (Ind 1)^∞ ⊗ L(λ).
- `closedInduction_zero` (degenerate): I(0) = 0.
- `closedInduction_nondominant` (non-example): For GL₂(ℚ_p), λ=(1,1), s·λ=(0,2) and U=z^{s·λ}χ_sm, the lower Verma M^-(−s·λ) is simple. Hence I(U)=F_{B^-}^G(L^-(−s·λ),χ_sm) is the whole locally analytic induction. In contrast I(z^λχ_sm) is the proper locally algebraic subrepresentation. Non-dominance does not imply a proper closed induction.

*Acceptance examples.* For U = z^λ χ_sm with λ dominant, I_{B^-}^G(U) is the locally algebraic subrepresentation (Ind χ_sm)^∞ ⊗ L(λ) of the principal series.

*Proof sketch.* EMJ2 Lemma 0.3 provides the closed embedding; its image lifts canonically into Ind U (LR.6/jacquet-emerton-functor), and the closed span of its G-translates is I(U). Lemma 2.8.3 identifies the generators with smooth compactly supported functions on the big cell; Corollary 5.1.4 computes J_P of I(U).

*Sources.* [EMJ2](#references), Introduction, the definition of I_P^G(U) and Lemma 0.3, p. 2: Defines I_P^G(U) as the closed G-subrepresentation of Ind_P^G U generated by the image of U under the canonical lifting of J_P(Ind_P^G U), using the closed embedding U(δ) → J_P(Ind_P^G U). [EMJ2](#references), §2.8, Lemma 2.8.3, pp. 44–45: Describes I_P^G(U) as the closed G-subrepresentation generated by the image of the closed embedding (2.8.2) of compactly supported smooth functions on the big cell. [EMJ2](#references), §5.1, Corollary 5.1.4, p. 60: For quasi-split G and a Borel, the closed induction has the same Jacquet module as the full induction; no arbitrary-parabolic version is inferred. [DING25](#references), §3.1.2, Lemma 3.2(2), Proposition 3.3, Remark 3.7, pp. 34–38: Uses I_{B^-(K)}^{GL_n(K)}(δ) for characters δ and for deformed characters δ(1 + ψε), e.g. I(w(φ)ηz^λ(1 + ψε)) ≅ (Ind w(φ)η(1 + ψ_1ε))^sm ⊗ L(λ) ⊗ (1 + εψ_0 ∘ det).

*Needs.* `LR.6/jacquet-emerton-functor`, `LR.4/locally-analytic-induction`, `SmoothRepresentationsOfLocalGroups:SR.2/smooth-induction`.

*Planet:* Emerton's closed induction.

#### Balanced maps into a Jacquet module (`balanced-map`, definition)

Let U ∈ Rep^{zla.c}(M) and V a locally analytic representation of G. A continuous M-equivariant map U(δ_P) → J_P(V) is balanced if the kernel of the induced (g, P)-map U(g) ⊗_{U(p)} U → U(g) ⊗_{U(p)} J_P(V) → V (via the canonical lifting) contains the kernel of the natural map U(g) ⊗_{U(p)} U → (Ind_{P^-}^G U)^an. L_M(U(δ_P), J_P(V))^bal denotes the subspace of balanced maps; it depends on J_P(V) as the Jacquet module of V, contains the image of Hom_G(I_{P^-}^G(U), V), and the balanced condition does not depend on N_0. U is allowable if, for all finite-dimensional algebraic M-representations W_1, W_2, every A[M]-linear map U ⊗ W_1 → U ⊗ W_2 is strict (A = End_M(U)).

*Hypotheses and conventions.* The condition concerns only the Lie algebra; it is automatic for smooth U and V.

*Uses.* Emerton, Jacquet II, Theorem 0.13: the adjunction is an isomorphism onto balanced maps. Ding, §3.1.2 and §4.1: the adjunction for characters δ (one-dimensional U) used to produce injections of GL_n(K)-representations from eigenvariety tangent computations.

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
- `isBalanced_of_injective` (characterisation): If the map U(g)⊗_{U(p)}U→I(U) is injective, every equivariant map U(δ_P)→J_P(V) is balanced. For GL₂ with upper positive roots one may use U=z^{(0,2)}: it is dot-antidominant and the relevant Verma is simple. A merely weak antidominance assertion including weight 0 would not suffice.

*Acceptance examples.* For U and V smooth every map is balanced, recovering the smooth Frobenius reciprocity (0.2) of EMJ2.

*Proof sketch.* The canonical lifting J_P(V) → V^{N_0} ⊆ V and the U(g)-action on V give the (g, P)-map; its kernel is compared with that of U(g) ⊗ U → Ind U. Maps coming from I(U) → V are balanced because they factor through the image of U(g) ⊗ U in Ind U (EMJ2 (0.7)).

*Sources.* [EMJ2](#references), Introduction, Definition 0.8, Question 0.9 and Definition 0.11, p. 3: Defines balanced maps by comparing the kernels of U(g) ⊗_{U(p)} U → V and of the map to the induction, notes that the image of Hom(I_P^G(U), V) consists of balanced maps and that the condition is independent of N_0, and defines allowable U.

*Needs.* `LR.6/jacquet-emerton-functor`, `LR.6/closed-induction`, `LR.0/derived-lie-action`.

#### Emerton's adjunction theorem (`emerton-adjunction`, theorem)

If U ∈ Rep^{zla.c}(M) is allowable and V is a very strongly admissible locally analytic representation of G, then the map Hom_G(I_{P^-}^G(U), V) → L_M(U(δ_P), J_P(V))^bal induced by J_P is an isomorphism. In particular, for a locally analytic character δ of T and P = B: Hom_G(I_{B^-}^G(δ), V) ≅ Hom_T(δδ_B, J_B(V))^bal.

*Hypotheses and conventions.* U allowable; V very strongly admissible (the Banach embedding controls growth).

*Acceptance examples.* For U = δ a smooth character and V smooth admissible, the theorem is the smooth Frobenius reciprocity Hom_G((Ind δ)^∞, V) ≅ Hom_T(δδ_B, V_N).

*Proof sketch.* Injectivity: I(U) is generated by the image of U, which is determined by its Jacquet-module image. Surjectivity: a balanced map defines a (g, P)-map on U(g) ⊗ C^sm_c(N, U) factoring through the coimage I(U)^lp(N); EMJ2 Corollary 4.3.3 extends it continuously to I(U)(N) using very strong admissibility, and G-equivariance spreads it to I(U).

*Sources.* [EMJ2](#references), Introduction, Theorem 0.13, p. 4; sketch of proof, p. 4: For allowable U and very strongly admissible V the map (0.10) from G-maps out of I_P^G(U) to balanced maps into J_P(V) is an isomorphism; the proof passes through the (g, P)-invariant subspace of functions supported on the big cell. [EMJ2](#references), §4.3, Corollary 4.3.3, p. 58: For very strongly admissible V, an isomorphism L_G(X, V) → L_(g,P)(X^lp(N), V) on which the proof of Theorem 0.13 rests. [DING25](#references), §3.1.2, Lemma 3.2 and §4.1, p. 61: Uses Emerton's Definition 0.8 and Theorem 0.13 to pass between T-eigenvectors in J_B and G-maps from I_{B^-}^G.

*Needs.* `LR.6/balanced-map`, `LR.6/closed-induction`, `LR.2/very-strongly-admissible`.

*Planet:* Emerton's adjunction theorem.

#### Breuil's adjunction for Orlik–Strauch representations (`orlik-strauch-jacquet-adjunction`, theorem)

Let Q=MN be the Jacquet parabolic, Q⁻ its opposite (the inducing parabolic), W a finite-dimensional algebraic M-representation inflated to Q⁻, and π a smooth admissible finite-length M-representation. For very strongly admissible Π there is a natural isomorphism Hom_G(F^G_{Q⁻}((U(g_E)⊗_{U(q⁻_E)}W)^∨, π δ_Q^{-1}),Π) ≅ Hom_M(W′⊗π,J_Q(Π)). Equivalently the right side is Hom_{M^+}(W′⊗π,Π^{N_0}) for the averaged Hecke action. Breuil writes the same result with unaveraged Hecke operators and untwisted smooth inducing π; multiplying that action by δ_Q converts to this formula. The σ-analytic variant holds. For products, BHS Lemma 5.2.1 gives Hom_G(F^G_{B⁻}(Hom_E(M_0,E)^{u∞}, V δ_B^{-1}),Π) ≅ Hom_{T^+}(V,Hom_{U(g)}(M_0,Π)^{U_0}) for category-O M_0 and smooth finite-length admissible T-representation V, with the averaged Hecke action.

*Hypotheses and conventions.* 𝐆 split connected reductive over L, B = TN ⊆ P = L_P N_P a Borel and a parabolic (standard or opposite), E/ℚ_p finite splitting L; O^p_alg is the category of the gap 'Category O and Kostant homology' for the ℚ_p-Lie algebra g ⊗_{ℚ_p} E = ∏_σ g_σ: finitely generated U(g ⊗ E)-modules, direct sums of simple algebraic U(l_P ⊗ E)-modules, locally finite for n_P ⊗ E. Π very strongly admissible; π_P of finite length. Use the ℚ_p-analytic residue-characteristic assumptions of LR.5. The restricted BHS smooth input ensures the Orlik–Strauch functor stays in its declared admissible domain; the source’s broader smooth statement may be treated after extending that domain. The superscript ∨ on the category-O module denotes the restricted BGG dual defined by a root-reversing anti-involution that fixes the Cartan, as in BR15 pp. 14–15; it preserves highest weights and simple modules. It is distinct from the ordinary contragredient W′, which negates torus weights.

*Acceptance examples.* For Q=B, W has weight −s_{i,σ}·λ, π=w(φ)ηδ_B, and Π=C(I,s_{i,σ}). The formula gives Hom_T(z^{s_{i,σ}·λ}w(φ)ηδ_B,J_B(Π))≅E as in Ding Lemma 3.2, with the corrected positive inducing weight. The negative weight belongs to the category-O input, not to the inducing character.

*Proof sketch.* Apply BR15 Proposition 4.2: identify the compactly supported locally polynomial vectors of the differential-equation kernel with the appropriate restricted category-O dual tensored with C_c^∞(N,π). It is polynomially generated in bounded degree. EMJ2 Corollary 4.3.3 extends the resulting (g,Q)-map into Π continuously; this is not a blanket identification with I(U). The compact-support/Jacquet adjunction (EMJ1 Theorem 3.5.6) gives the positive-monoid Hom. BR15 §4, (18), p. 13, uses the unaveraged sum, so replace its π by π δ_Q^{-1} to obtain the averaged-Jacquet formula. BHS (5.9), p. 391, writes δ_B times the sum and its Lemma 5.2.1 already includes exactly this inverse-modulus twist. For products, use the compact-base tensor description from LR.5/orlik-strauch-products and run this polynomial-generation and growth argument on the factors; BHS Remark 5.1.2, p. 388, records the extension. No LR.6 result is used earlier in LR.5.

*Sources.* [BR15](#references), §4, (18), p. 13; Proposition 4.2 and Théorème 4.3, pp. 13–15: Breuil’s positive-monoid Hom uses the unaveraged Hecke sum, explicitly distinguished from Emerton’s action on p. 13. Translating to the averaged J_Q requires the inverse-modulus twist on the smooth Orlik–Strauch argument and the opposite inducing parabolic. [BR15](#references), §4, Remarque 4.4(i)–(ii), pp. 15–16: Remarque 4.4 rewrites the unaveraged convention using a Jacquet functor and gives the σ-analytic variant. In this packet the averaged convention is fixed throughout, with its explicit modulus conversion. [BHS19](#references), §5.2, Lemma 5.2.1 and its proof, pp. 391–392: For M in category O and V a smooth representation of T_p, Hom_G(F^{G_p}_{B_p}(Hom(M, L)^{u∞}, V δ^{-1}), Π̂^an) ≃ Hom_{T_p^+}(V, Hom_{U(g)}(M, Π̂^an)^{U_0}), functorially in M, using Breuil's Proposition 4.2 and the very strong admissibility.

*Needs.* `LR.6/emerton-adjunction`, `LR.5/orlik-strauch-functor`, `LR.5/orlik-strauch-products`.

*Planet:* Breuil's adjunction for Orlik–Strauch representations.

### Examples

- **The rigid character variety of an abelian locally analytic group.** For Z = ℤ_p (F = ℚ_p), Ẑ is the open unit disc via χ ↦ χ(1) − 1, and D(ℤ_p, E) ≅ O(open disc) (Amice).
- **Essentially admissible representations.** Every character is essentially admissible; for G=ℤ discrete the universal character family O(𝔾_m^an)′ is essentially admissible and infinite-dimensional, hence not admissible.
- **The finite slope part of a Z^+-representation.** For V ∈ Rep^{zla.c}(Z) and Z^+=Z, evaluation identifies V_fs with V. Here zla means an exhaustive increasing sequence of Z-stable BH subspaces, equivalently the required O(Ẑ)-module structure.
- **Emerton's locally analytic Jacquet functor.** For V = π smooth admissible, J_P(π) = π_N, the smooth Jacquet module (unnormalised).
- **Admissibility and computations of Emerton's Jacquet modules.** For π_alg = I_sm(φ) ⊗ L(λ) of GL_n(L) with φ generic, J_B(π_alg) ≅ J_N(I_sm(φ)) ⊗ L(λ)^N is a direct sum of n! distinct characters of T (SmoothRepresentationsOfLocalGroups SR.2/principal-series-jacquet and genericity).
- **Emerton's closed induction I_P^G.** For U = z^λ χ_sm with λ dominant, I_{B^-}^G(U) is the locally algebraic subrepresentation (Ind χ_sm)^∞ ⊗ L(λ) of the principal series.
- **Balanced maps into a Jacquet module.** For U and V smooth every map is balanced, recovering the smooth Frobenius reciprocity (0.2) of EMJ2.
- **Emerton's adjunction theorem.** For U = δ a smooth character and V smooth admissible, the theorem is the smooth Frobenius reciprocity Hom_G((Ind δ)^∞, V) ≅ Hom_T(δδ_B, V_N).
- **Breuil's adjunction for Orlik–Strauch representations.** For Q=B, W has weight −s_{i,σ}·λ, π=w(φ)ηδ_B, and Π=C(I,s_{i,σ}). The formula gives Hom_T(z^{s_{i,σ}·λ}w(φ)ηδ_B,J_B(Π))≅E as in Ding Lemma 3.2, with the corrected positive inducing weight. The negative weight belongs to the category-O input, not to the inducing character.

### Dependencies

`AdicSpacesPartII:R3`, `LocallyAnalyticDistributions:L0`, `LocallyAnalyticDistributions:L3`, `LocallyAnalyticDistributionsPartII:ND.2`, `LocallyAnalyticRepresentationsOfLocalGroups:LR.0`, `LocallyAnalyticRepresentationsOfLocalGroups:LR.1`, `LocallyAnalyticRepresentationsOfLocalGroups:LR.2`, `LocallyAnalyticRepresentationsOfLocalGroups:LR.4`, `LocallyAnalyticRepresentationsOfLocalGroups:LR.5`, `ReductiveGroupsPartII:RG2.4`, `SmoothRepresentationsOfLocalGroups:SR.2`, `PadicMeasuresIwasawaAlgebras:L0a`.

## Layer LR.7: Ext groups of the locally analytic principal series of GL_n

Ding §3.1.1–3.1.2: conventions for GL_n(L), the locally algebraic representation π_alg(φ, h), the principal series PS(w(φ), h) with its constituents C(w, u) and socles, the constituents C(I, s_{i,σ}), PS_1 and π_1(φ, h), the self-extensions of π_alg, the one-dimensional Ext¹ with constituents, the maps ζ_w, Ext¹(π_alg, PS_1) and Ext¹(π_alg, π_1), the amalgam π(φ, h), and the filtration Ext¹_g ⊆ Ext¹_{g′} ⊆ Ext¹_w. The inverse-image subset labels, positive inducing weights and Weyl transition maps are fixed by the stated conventions. The second-socle-layer transport and finite-E supplier refinements remain explicit proof contracts.

**Coverage:** partial. Prove the restricted first-two-socle-layer transport for ℚ_p-analytic Orlik–Strauch with generic smooth argument; discharge finite-E smooth and highest-weight supplier refinements and the category-O contract. Locate and read the Breuil–Qian input for the unused reverse Ext¹ direction, or omit that imported direction in a future scope revision.

#### Weights, twists and parameter spaces for GL_n(L) (`gln-conventions`, definition)

Fix n ≥ 1, L, E, Σ_L and d_L as above; T ⊆ B ⊆ GL_n is the diagonal torus in the upper Borel, B^- the lower Borel, N and N^- their unipotent radicals. (i) θ := (0, −1, …, 1 − n); for a standard parabolic P ⊇ B with Levi L_P ≅ GL_{n_1} × ⋯ × GL_{n_r}, θ^P := (0^{n_1}, (−n_1)^{n_2}, …, (−(n_1 + ⋯ + n_{r−1}))^{n_r}), an algebraic character of L_P, with θ^B = θ; for 1 ≤ i ≤ n − 1, P_i is the maximal parabolic whose Levi L_i ≅ GL_i × GL_{n−i} has simple roots {1, …, n−1} ∖ {i}. (ii) For a character φ = φ_1 ⊠ ⋯ ⊠ φ_n of T(L) and w ∈ S_n, w(φ) := φ_{w^{-1}(1)} ⊠ ⋯ ⊠ φ_{w^{-1}(n)}; φ is generic if φ_iφ_j^{-1} ∉ {1, |·|_L} for i ≠ j, where |·|_L is the unramified character with |ϖ_L|_L = p^{−[L_0:ℚ_p]}. (iii) δ_B = |·|_L^{n−1} ⊠ ⋯ ⊠ |·|_L^{n+1−2i} ⊠ ⋯ ⊠ |·|_L^{1−n}; η := 1 ⊠ |·|_L ⊠ ⋯ ⊠ |·|_L^{n−1} = |·|_L^{-1} ∘ θ; ε := N_{L/ℚ_p}(·)|·|_L (the cyclotomic character through local class field theory sending a uniformiser to a geometric Frobenius). (iv) A weight h = (h_{σ,i}) ∈ ℤ^{Σ_L × {1,…,n}} is strictly dominant if h_{σ,1} > ⋯ > h_{σ,n} for every σ; then λ := h − θ^{[L:ℚ_p]}, λ_{σ,i} = h_{σ,i} + i − 1, is dominant; z^μ is the algebraic character diag(t_i) ↦ ∏_{σ,i} σ(t_i)^{μ_{σ,i}}; W_Σ := S_n^{Σ_L} acts on weights by the dot action u·μ := u(μ + ρ) − ρ, lg(u) := Σ_σ lg(u_σ), and s_{i,σ} is the simple reflection (i, i+1) in the σ-factor. (v) Hom(T(L), E), Hom_sm(T(L), E) and Hom_σ(T(L), E) are the locally ℚ_p-analytic, smooth and locally σ-analytic additive characters, and Hom_{g′}(T(L), E) := {ψ : ψ − ψ_0 ∘ det ∈ Hom_sm(T(L), E) for some ψ_0 ∈ Hom(L^×, E)}; Hom_{σ,g′} := Hom_{g′} ∩ Hom_σ.

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ. Ding's K and E are this roadmap's L and E; Ding's d_K is d_L.

*Uses.* Ding, §§3.1.2–3.1.4: every construction and dimension count of §3.1 is in this notation. PadicHodgeParametersInLocallyAnalyticRepresentations, contracts LA2–LA5: θ_P constant −Σ_{k<i} n_k on block i and the twist ε^{-1} ∘ θ_P; labels I over all nonempty proper subsets of {1, …, n}.

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

*Acceptance examples.* η z^λ = z^h · (ε^{-1} ∘ θ) as characters of T(L) (the computation is in LR.7/principal-series-ps).

*Proof sketch.* η = |·|_L^{-1} ∘ θ: the i-th entry of θ is 1 − i, so |·|_L^{−(1−i)} = |·|_L^{i−1}. λ dominant: h_{σ,i} ≥ h_{σ,i+1} + 1 gives λ_{σ,i} = h_{σ,i} + i − 1 ≥ h_{σ,i+1} + i = λ_{σ,i+1}. dim Hom_{g′}(T(L), E) = n + d_L by LR.4/torus-ext (4).

*Sources.* [DING25](#references), §3.1.1, pp. 33–34: Fixes θ, θ^P, P_i, w(φ), genericity, δ_B, η = |·|_K^{-1} ∘ θ and the dominant weight conventions. [DING25](#references), §2.1, p. 9: Fixes Σ_K, d_K, z^k, |·|_K with |ϖ_K|_K = p^{−[K_0:ℚ_p]}, ε = N_{K/ℚ_p}(·)|·|_K, and Hom, Hom_sm, Hom_σ. [DING25](#references), §2.3.1, (2.17), p. 18: Defines Hom_{g′}(T(K), E).

*Needs.* `LR.4/torus-ext`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-character`, `SmoothRepresentationsOfLocalGroups:SR.2/modulus-character`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-9-reductive-lie-algebras-and-gl_n`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

#### The locally algebraic representation π_alg(φ, h) (`pi-alg`, construction)

For φ generic, I_sm(φ) := (Ind_{B^-(L)}^{GL_n(L)} φη)^∞ is an absolutely irreducible smooth admissible representation, I_sm(φ) ≅ I_sm(w(φ)) =: π_sm(φ) for all w ∈ S_n (the smooth representation attached to the Weil–Deligne representation ⊕φ_i by the classical local Langlands correspondence), and π_alg(φ, h) := π_sm(φ) ⊗_E L(λ) is an irreducible locally algebraic representation of GL_n(L), isomorphic to I_sm(w(φ)) ⊗_E L(λ) for every w. Fix isomorphisms π_alg(φ, h) ≅ L(λ) ⊗_E I_sm(w(φ)) for all w ((3.2) of Ding); the constructions of LR.7–LR.9 are independent of these choices up to the scalars that cancel in Ext¹ (Ding Remark 3.4). End_G(π_alg(φ, h)) = E.

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ.

*Uses.* Ding, Proposition 3.1(2): the socle of every PS(w(φ), h). Ding, Propositions 3.3, 3.6, 3.8: the first argument of every Ext^1 group of §3.1. PadicHodgeParametersInLocallyAnalyticRepresentations, contract LA2: A = π_alg(φ, h) with End(A) ≅ E.

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

*Acceptance examples.* For n = 1, π_alg(φ, h) = φ_1 z^{h_1}, a character.

*Proof sketch.* Irreducibility and independence of the order of the generic smooth principal series: SR.3/generic-irreducibility (Bernstein–Zelevinsky). π_alg(φ, h) is admissible and topologically irreducible by LR.1/locally-algebraic-representation (ST01 Proposition 3.4); End = E by Schur's lemma for absolutely irreducible admissible representations.

*Sources.* [DING25](#references), §3.1.1, p. 33, and §3.1.2, p. 34: For generic φ, I_sm(φ) is absolutely irreducible, independent of the order of φ, and corresponds to ⊕φ_i; π_alg(φ, h) := π_sm(φ) ⊗_E L(λ) is irreducible locally algebraic. [DING25](#references), §3.1.2, (3.2), p. 35; Remark 3.4: Fixes isomorphisms π_alg(φ, h) ≅ L(λ) ⊗ I_sm(w(φ)) for all w; ζ_w does not depend on the choice.

*Needs.* `LR.7/gln-conventions`, `LR.1/locally-algebraic-representation`, `SmoothRepresentationsOfLocalGroups:SR.3/generic-irreducibility`, `SmoothRepresentationsOfLocalGroups:SR.2/smooth-induction`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-4-the-classification-of-finite-dimensional-irreducibles`.

*Planet:* Locally algebraic representation π_alg(φ, h).

#### The locally analytic principal series PS(w(φ), h) and its constituents C(w, u) (`principal-series-ps`, construction)

For w ∈ S_n put PS(w(φ), h) := (Ind_{B^-(L)}^{GL_n(L)} w(φ)ηz^λ)^{ℚ_p-an} = (Ind_{B^-(L)}^{GL_n(L)} w(φ)z^h(ε^{-1} ∘ θ))^{ℚ_p-an} (LR.4/principal-series). For u ∈ W_Σ = S_n^{Σ_L} put C(w, u) := F^{GL_n}_{B^-}(L^-(−u·λ), w(φ)η), where M^-(μ) := U(gl_{n,Σ_L}) ⊗_{U(b^-_{Σ_L})} μ is the Verma module for b^- and L^-(μ) its simple quotient (for μ antidominant, L^-(μ) is finite-dimensional, isomorphic to L(−μ)^∨). Then PS(w(φ), h) = F^{GL_n}_{B^-}(M^-(−λ), w(φ)η), and π_alg(φ, h) = C(w, 1) ⊆ PS(w(φ), h) through the fixed isomorphisms.

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ.

*Uses.* Ding, Proposition 3.1: constituents and socle filtration of PS(w(φ), h). Ding, (3.10) and Remark 3.9: Ext^1(π_alg, PS) and the amalgam π(φ, h). PadicHodgeParametersInLocallyAnalyticRepresentations, contract LA2: PS(w(φ), h) and its embeddings.

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

*Acceptance examples.* For n = 1, PS(φ, h) = C(1, 1) = φ_1 z^{h_1}.

*Proof sketch.* The two expressions agree: on t = diag(t_1, …, t_n), z^θ(t) = ∏_i N_{L/ℚ_p}(t_i)^{1−i} and (ε^{-1} ∘ θ)(t) = ∏_i ε(t_i)^{i−1} = ∏_i (N_{L/ℚ_p}(t_i)|t_i|_L)^{i−1}, so z^θ·(ε^{-1} ∘ θ) = ∏_i |t_i|_L^{i−1} = η and z^h(ε^{-1} ∘ θ) = z^λ z^θ (ε^{-1} ∘ θ) = z^λ η. PS = F(M^-(−λ), w(φ)η) is LR.5/orlik-strauch-functor for a Verma module (ker φ = 0), with W the weight −λ, W′ = z^λ; C(w, 1) = F(L^-(−λ), w(φ)η) ≅ L(λ) ⊗ I_sm(w(φ)) by LR.5/orlik-strauch-transitivity with Q = G.

*Sources.* [DING25](#references), §3.1.1, p. 33 (Verma modules M^-(μ), L^-(μ), L(−μ)^∨) and §3.1.2, p. 34 (PS(w(φ), h), C(w, u)): Defines the principal series, its two expressions, and the Orlik–Strauch representations C(w, u) attached to the simple quotients L^-(−u·λ).

*Needs.* `LR.7/pi-alg`, `LR.4/principal-series`, `LR.5/orlik-strauch-functor`, `LR.5/orlik-strauch-transitivity`.

*Planet:* Locally analytic principal series PS(w(φ), h).

#### Constituents and socle of the locally analytic principal series (Ding, Proposition 3.1) (`principal-series-constituents`, theorem)

For w ∈ S_n: (1) the irreducible constituents of PS(w(φ), h) are the C(w, u), u ∈ W_Σ, which are pairwise non-isomorphic, and those with lg(u) = 1 have multiplicity one; (2) soc_G PS(w(φ), h) ≅ I_sm(w(φ)) ⊗_E L(λ) ≅ π_alg(φ, h); (3) soc_G (PS(w(φ), h)/π_alg(φ, h)) ≅ ⊕_{u ∈ W_Σ, lg(u)=1} C(w, u); (4) for w, w′ ∈ S_n and u, u′ with lg(u) = lg(u′) = 1, C(w, u) ≅ C(w′, u′) if and only if u = u′ = s_{i,σ} for some i ∈ {1, …, n−1}, σ ∈ Σ_L, and w(w′)^{-1} lies in the Weyl group of L_{P_i}.

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ. The composition factors of M^-(−λ) are the L^-(−u·λ), u ∈ W_Σ, each with multiplicity given by Kazhdan–Lusztig polynomials, and multiplicity one for lg(u) ≤ 1; the socle/cosocle structure of the Verma module: inputs of the gap 'Category O and Kostant homology' (Humphreys Chapters 4–6, 8).

*Acceptance examples.* For n = 2, L = ℚ_p: PS(w(φ), h) is a nonsplit extension of C(w, s) by π_alg(φ, h), and C(1, s) ≇ C(s, s).

*Proof sketch.* (1): by LR.5/orlik-strauch-jordan-holder the constituents of F(M^-(−λ), w(φ)η) are F^G_{Q_u}(L^-(−u·λ), i(w(φ)η)) over composition factors of the Verma module; for u ≠ 1 the maximal parabolic of L^-(−u·λ) is a proper one, and genericity makes the smooth induction to it irreducible, so C(w, u) is irreducible (LR.5/orlik-strauch-irreducibility); multiplicities are Verma multiplicities, one when lg(u) ≤ 1. For (2), apply BR16 Corollary 2.5, pp. 11–12, to the simple quotient of the lower Verma and the generic smooth input. For (3), Ding Proposition 3.1(3), p. 34, verifies the claimed second socle layer, but the proposed proof by full faithfulness is not closed: OR19 Theorem 1 is locally L-analytic with trivial smooth argument. The ℚ_p-analytic result with this generic smooth argument needs the precise first-two-layer transport contract recorded in the gaps; it is not deduced from that narrower theorem. (4): by LR.5/orlik-strauch-irreducibility (uniqueness), C(w, s_{i,σ}) = F^G_{P_i^-}(L^-(−s_{i,σ}·λ), i^{L_i}(w(φ)η)) is determined by the smooth induction to L_i, which is invariant exactly under the Weyl group of L_{P_i}.

*Sources.* [DING25](#references), §3.1.2, Proposition 3.1 and its proof, p. 34: States (1)–(4); (1) and (4) follow from Orlik–Strauch with the standard facts on constituents of Verma modules (Humphreys, Chapter 6), (2) and (3) from Orlik's Theorem 1. [BR16](#references), §2, Corollaries 2.5 and 2.7, pp. 11–12: Socle of F^G_P(M, π_P) and of the induction, and the uniqueness criterion for F^G_{Q_i}(M_i, π_{Q_i}).

*Needs.* `LR.7/principal-series-ps`, `LR.5/orlik-strauch-jordan-holder`, `LR.5/orlik-strauch-irreducibility`.

*Planet:* Constituents of the principal series.

#### The constituents C(I, s_{i,σ}) (`constituent-labels`, construction)

For 1 ≤ i ≤ n − 1, σ ∈ Σ_L and I ⊆ {1, …, n} with #I = i, all C(w, s_{i,σ}) with w^{-1}({1, …, i}) = I are isomorphic (LR.7/principal-series-constituents (4)); their common isomorphism class is C(I, s_{i,σ}). The C(I, s_{i,σ}) are pairwise distinct for distinct (I, i, σ), and C(I, s_{i,σ}) ≅ soc_G (Ind_{B^-(L)}^{GL_n(L)} z^{s_{i,σ}·λ} w(φ)η)^{ℚ_p-an} for any w with w^{-1}({1, …, i}) = I. The labels run over all nonempty proper subsets I ⊂ {1, …, n} (#I = i determines i), giving (2^n − 2)·d_L constituents in total.

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ.

*Uses.* Ding, (3.3), Proposition 3.8 and Lemma 3.10: the second socle layer of π_1(φ, h) and of the parabolic inductions. PadicHodgeParametersInLocallyAnalyticRepresentations, contract LA2: labels use all nonempty proper I ⊂ {1, …, n}, not I ⊂ {1, …, n−1}.

*API* (namespace `TauCeti.LocallyAnalytic.GLn`):

- `constituentLabel` (constructor): C(I, s_{i,σ}) for I ⊂ {1, …, n} nonempty proper, i = #I, σ ∈ Σ_L.
- `constituentLabel_eq` (characterisation): C(w, s_{i,σ}) ≅ C(w^{-1}({1, …, i}), s_{i,σ}).
- `constituentLabel_injective` (extensionality): C(I, s_{i,σ}) ≅ C(I′, s_{i′,σ′}) iff (I, σ) = (I′, σ′).
- `constituentLabel_socle` (characterisation): C(I, s_{i,σ}) ≅ soc (Ind_{B^-}^G z^{s_{i,σ}·λ}w(φ)η)^an for w^{-1}({1, …, i}) = I.
- `card_constituentLabels` (other): The number of labels is (2^n − 2)d_L.
- `constituentSubset` (data): Light indexing form: constituentSubset(w,i)={j | w(j)<i} in zero-based Fin n, the inverse image w^{-1}({0,…,i−1}). Membership is equivalent to w(j)<i; the bounds 1≤i<n give a nonempty proper label. The suggested Lean file only states this finite-set carrier, not the representation C(I,s).

**Checks.**

- `card_constituentLabels_n2` (computation): For n = 2 there are 2d_L labels; for n = 3 there are 6d_L.
- `constituentLabel_n1` (degenerate): For n = 1 there are no labels (no simple reflections).
- `constituentLabel_not_n_minus_one` (non-example): The labels are not the subsets of {1, …, n−1}: for n = 2, I = {2} is a label (giving C({2}, s_{1,σ}) ≅ C(s, s_{1,σ})), although {2} ⊄ {1}.
- `constituentLabel_eq_test` (characterisation): For n = 3, w = (1 3) (so w({1}) = {3}): C(w, s_{1,σ}) ≅ C({3}, s_{1,σ}).
- `constituentLabel_cycle` (computation): For n=3 let w=(1 2 3) and w′=(2 3)w. They are in the same left W_1-coset, and w^{-1}({1})=(w′)^{-1}({1})={3}. Hence both label C({3},s_{1,σ}), although their forward images of {1} are {2} and {3}.
- `constituentLabel_positive_weight` (computation): For GL₂(ℚ_p), h=(1,0), λ=(1,1) and s·λ=(0,2). C(w,s)=F(L^−(0,−2),w(φ)η) has algebraic central weight +2, agreeing with induction of z^{(0,2)}w(φ)η. Induction of z^{(0,−2)} has central weight −2 and cannot contain it.

*Acceptance examples.* For n = 2 the labels are I = {1}, {2} with i = 1, giving C({1}, s_{1,σ}) and C({2}, s_{1,σ}) for each σ: 2d_L constituents.

*Proof sketch.* The equality criterion in Proposition 3.1(4) is w(w′)^{-1}∈W_i, so w and w′ lie in the same left coset W_iw. This is equivalent to w^{-1}({1,…,i})=(w′)^{-1}({1,…,i}). It gives well-definedness and distinctness; the forward-image convention printed immediately after that proposition is inconsistent with its permutation action. Socle realisation: by LR.5/orlik-strauch-jordan-holder (2) the socle of (Ind z^{s·λ}w(φ)η)^an is F^G_{P_i^-}(L^-(−s_{i,σ}·λ), soc i^{L_i}(w(φ)η)), which is C(w, s_{i,σ}). Count: Σ_{i=1}^{n−1} binom(n, i) = 2^n − 2 subsets, times d_L embeddings.

*Sources.* [DING25](#references), §3.1.2, the paragraph after Proposition 3.1 and (3.1), pp. 34–35: The source defines the labels and socle realisation. Two corrections are necessary: the label is w^{-1}({1,…,i}) by Proposition 3.1(4), and the inducing weight is +s_{i,σ}·λ by Orlik–Strauch duality. These are recorded in E12–E13, rather than silently attributed to the printed formulas. [DING25](#references), §3.1.2, p. 35: Counts (2^n − 2)d_K constituents C(I, s_{i,σ}) in π_1(φ, h)/π_alg(φ, h). [DING25](#references), §3.1.2, (3.1) and Lemma 3.2, pp. 34–35; §3.1.4, p. 44: The positive inducing weight is forced by the definition F(L^−(−s·λ),w(φ)η) and its contravariance. The negative inducing signs in (3.1) and Lemma 3.2 are corrected here; the positive sign on p. 44 is consistent. See sourceIssues E5 and E13.

*Needs.* `LR.7/principal-series-constituents`, `LR.5/orlik-strauch-jordan-holder`.

#### Jacquet–Emerton modules and closed inductions of the constituents (Ding, Lemma 3.2) (`constituent-jacquet`, theorem)

Let w ∈ S_n with w^{-1}({1, …, i}) = I. (1) Hom_{T(L)}(z^{s_{i,σ}·λ}w(φ)ηδ_B, J_B(C(I, s_{i,σ}))) ≅ E. (2) I_{B^-(L)}^{GL_n(L)}(z^{s_{i,σ}·λ}w(φ)η) ≅ C(I, s_{i,σ}). (Ding prints T(ℚ_p) for T(L) in (1); see sourceIssues.)

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ.

*Acceptance examples.* For n = 2, L = ℚ_p: I_{B^-}^G(z^{s·λ}φη) ≅ C(1, s) = C({1}, s).

*Proof sketch.* Every constituent of PS(w(φ), h) embeds into some locally analytic principal series (LR.5/orlik-strauch-jordan-holder (2)), so it is very strongly admissible (LR.4/locally-analytic-induction with LR.2/very-strongly-admissible). (1): LR.6/orlik-strauch-jacquet-adjunction with P = B computes Hom_T(z^{s·λ}w(φ)ηδ_B, J_B(C)) as Hom_G(C(I, s), C) = E. (2): the T-eigenline of (1) lies in J_B(C(I, s)) ⊆ J_B((Ind z^{s·λ}w(φ)η)^an) because Hom_T into J_B of every other constituent vanishes; by the definition of I_{B^-}^G (LR.6/closed-induction) its G-span is the socle C(I, s).

*Sources.* [DING25](#references), §3.1.2, Lemma 3.2 and its proof, pp. 34–35: Each constituent of PS is a subrepresentation of a principal series, hence very strongly admissible (Emerton, Jacquet II, Proposition 2.1.2); (1) follows from Breuil's Theorem 4.3 and Remark 4.4(i), and (2) from (1), the vanishing of Hom from the other constituents, and the definition of I_{B^-}^G. [DING25](#references), §3.1.2, (3.1) and Lemma 3.2, pp. 34–35; §3.1.4, p. 44: The positive inducing weight is forced by the definition F(L^−(−s·λ),w(φ)η) and its contravariance. The negative inducing signs in (3.1) and Lemma 3.2 are corrected here; the positive sign on p. 44 is consistent. See sourceIssues E5 and E13.

*Needs.* `LR.7/constituent-labels`, `LR.6/orlik-strauch-jacquet-adjunction`, `LR.6/closed-induction`, `LR.2/very-strongly-admissible`, `LR.4/locally-analytic-induction`.

#### The representations PS_1(w(φ), h) and π_1(φ, h) (`ps1-and-pi1`, construction)

PS_1(w(φ), h) ⊆ PS(w(φ), h) is the unique subrepresentation with socle π_alg(φ, h) and cosocle ⊕_{1≤i≤n−1, σ∈Σ_L} C(w, s_{i,σ}). Using the fixed isomorphisms π_alg(φ, h) ≅ L(λ) ⊗ I_sm(w(φ)) ↪ PS_1(w(φ), h), the amalgamated sum ⊕^{w∈S_n}_{π_alg(φ,h)} PS_1(w(φ), h) has a unique quotient π_1(φ, h) with socle π_alg(φ, h). π_1(φ, h) is an extension of ⊕_{i, σ, #I=i} C(I, s_{i,σ}) ((2^n − 2)d_L constituents, each once) by π_alg(φ, h), with tautological injections π_alg(φ, h) ↪ π_1(φ, h) and PS_1(w(φ), h) ↪ π_1(φ, h); it depends only on (φ, h). End_G(π_1(φ, h)) = E, and restriction to the socle gives End(π_1) ≅ End(π_alg) = E.

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ.

*Uses.* Ding, Propositions 3.6–3.8 and Theorem 3.21: Ext^1(π_alg, π_1(φ, h)) carries the Hodge parameters. PadicHodgeParametersInLocallyAnalyticRepresentations, contract LA2: V = π_1(φ, h), its first two socle layers, End(π) → End(V) → End(A) ≅ E.

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

*Acceptance examples.* For n = 2, L = ℚ_p: π_1(φ, h) is the amalgam of PS_1(φ, h) = PS(φ, h) and PS_1(s(φ), h) = PS(s(φ), h) over π_alg, with cosocle C({1}, s) ⊕ C({2}, s).

*Proof sketch.* Existence and uniqueness of PS_1: by LR.7/principal-series-constituents (2)–(3), the preimage in PS of soc(PS/π_alg) is the required subrepresentation. Put A=π_alg. The finite amalgam M has A with composition multiplicity one, because each PS_1 has one A and the amalgamation identifies those copies. Every subrepresentation disjoint from A has no A composition factor; finite sums retain that property and remain disjoint from A. Finite length therefore gives a largest such R. The image of A is essential in M/R, so its socle is A; conversely a quotient retaining A with that socle must kill exactly R. To identify repeated C(w,s)-extensions and obtain each C(I,s) once, use the rank-one constituent identifications and compatible embeddings in BH20 Proposition 5.9, pp. 27–28, together with the first-two-layer contract. This is not a consequence of an arbitrary lattice argument or of an unread Ext-dimension assertion. End = E: an endomorphism minus the scalar by which it acts on the socle kills the socle, so its image is a subrepresentation isomorphic to a quotient of π_1/π_alg = ⊕ C(I, s); since soc(π_1) = π_alg contains no C(I, s), the image is 0.

*Sources.* [DING25](#references), §3.1.2, (3.2)–(3.3) and the paragraph before them, p. 35: Defines PS_1(w(φ), h) by its socle and cosocle, forms the amalgamated sum over π_alg(φ, h) and its unique quotient π_1(φ, h) with socle π_alg(φ, h), an extension of the (2^n − 2)d_K constituents C(I, s_{i,σ}) by π_alg(φ, h). [BH20](#references), §5, Proposition 5.9 and proof, pp. 27–28: Compatible maps between the principal-series pieces identify the repeated rank-one constituents in the common-socle quotient.

*Needs.* `LR.7/constituent-labels`, `LR.7/principal-series-constituents`, `LR.1/admissible-abelian-category`.

*Planet:* The representation π_1(φ, h).

#### Self-extensions of π_alg(φ, h) (Ding, Proposition 3.3) (`self-extensions`, theorem)

(1) For w ∈ S_n and ψ ∈ Hom_{g′}(T(L), E), I_{B^-(L)}^{GL_n(L)}(w(φ)ηz^λ(1 + ψε)) is an extension of π_alg(φ, h) by itself, and ζ_w : Hom_{g′}(T(L), E) → Ext^1_{GL_n(L)}(π_alg(φ, h), π_alg(φ, h)), ψ ↦ I_{B^-}(w(φ)ηz^λ(1 + ψε)), is bijective and restricts to Hom_sm(T(L), E) ≅ Ext^1_lalg(π_alg, π_alg); hence dim Ext^1_lalg = n and dim Ext^1_{GL_n(L)}(π_alg, π_alg) = n + d_L. Explicitly, for ψ = ψ_1 + ψ_0 ∘ det with ψ_1 smooth, I(w(φ)ηz^λ(1 + ψε)) ≅ (Ind_{B^-} w(φ)η(1 + ψ_1ε))^∞ ⊗ L(λ) ⊗_{E[ε]} (1 + εψ_0 ∘ det). (2) For w_1, w_2 ∈ S_n, ζ_{w_2} ∘ (w_2w_1^{-1}) = ζ_{w_1} on Hom_{g′}(T(L), E), where w_2w_1^{-1} acts by permuting coordinates. ζ_w does not depend on the isomorphisms (3.2).

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ.

*Acceptance examples.* For n = 1: Ext^1_{L^×}(χ, χ) = Hom(L^×, E) of dimension 1 + d_L, Ext^1_lalg of dimension 1.

*Proof sketch.* The canonical embedding w(φ)ηz^λ(1 + ψε)δ_B ↪ J_B((Ind …)^an) factors through (Ind w(φ)η(1 + ψ_1ε))^∞ ⊗ L(λ) ⊗ (1 + εψ_0 ∘ det); by the definition of I (LR.6/closed-induction) this is the closed induction, an E[ε]-self-extension of π_alg. With central character fixed, Ext^1_{lalg,Z} ≅ Ext^1_{G,Z} (LR.1/locally-algebraic-ext), and smooth theory gives Hom_sm(T/Z, E) ≅ Ext^1_{lalg,Z} (dimension n − 1); comparing 0 → Hom_sm(T/Z) → Hom_{g′}(T) → Hom(Z(L), E) → 0 with 0 → Ext^1_Z → Ext^1 → Hom(Z(L), E) → 0 shows ζ_w bijective. On smooth characters, SR.3/part-ii-ordered-character-map gives 𝒥_{w_2}∘p_{w_2w_1^{-1}}=𝒥_{w_1}, where p is the permutation of the parameter torus. Its differential gives ζ_{w_2}∘(w_2w_1^{-1})=ζ_{w_1}. Determinant twists are invariant under permutations, extending the identity to Hom_{g′}. The opposite composition printed in the original packet was not the source diagram.

*Sources.* [DING25](#references), §3.1.2, Proposition 3.3, (3.4)–(3.6), its proof and Remark 3.4, pp. 35–36: Constructs ζ_w through Emerton's closed induction of deformed characters, proves bijectivity using Schraen's Proposition 4.7 for the fixed-central-character part and a comparison of exact sequences with Hom(Z(K), E), and proves (2) through the tangent maps of the Bernstein-centre maps 𝒥_w of Caraiani–Emerton–Gee–Geraghty–Paškūnas–Shin Lemma 3.22.

*Needs.* `LR.7/pi-alg`, `LR.6/closed-induction`, `LR.1/locally-algebraic-ext`, `LR.1/self-extension-dual-numbers`, `LR.7/gln-conventions`, `SmoothRepresentationsOfLocalGroups:SR.3/part-ii-ordered-character-map`, `SmoothRepresentationsOfLocalGroups:SR.3/part-ii-principal-series-tangent`, `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension/central-ext-vanishing`.

#### One-dimensional extension groups with a constituent (Ding, Lemma 3.5) (`constituent-ext-lines`, theorem)

For every C(I, s_{i,σ}): (1) dim_E Ext^1_{GL_n(L)}(C(I, s_{i,σ}), π_alg(φ, h)) = dim_E Ext^1_{GL_n(L)}(π_alg(φ, h), C(I, s_{i,σ})) = 1; more precisely Ext^1(π_alg, C(I, s_{i,σ})) ≅ Ext^1(π_alg, (Ind_{B^-} z^{s_{i,σ}·λ}w(φ)η)^an) ≅ Hom_{T(L)}(H_1(N^-(L), π_alg), z^{s_{i,σ}·λ}w(φ)η) ≅ E. (2) For a nonsplit π̃_alg(φ, h) ∈ Ext^1(π_alg, π_alg), pull-back along π̃_alg ↠ π_alg is a bijection Ext^1(π_alg, C(I, s_{i,σ})) ≅ Ext^1(π̃_alg, C(I, s_{i,σ})).

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ. The equality dim Ext^1(C(I, s_{i,σ}), π_alg) = 1 (extensions in the other direction) is quoted by Ding from Breuil–Qian (arXiv 2024, Proposition 5.1.14 with Lemma 3.2.4(ii)); no target of this roadmap uses that direction, and it is recorded as an imported statement with the gap 'Breuil–Qian dimension'.

*Acceptance examples.* For n = 2, L = ℚ_p: Ext^1(π_alg, C({1}, s)) and Ext^1(π_alg, C({2}, s)) are each one-dimensional.

*Proof sketch.* Schraen's spectral sequence for Σ = π_alg and ρ = δ := z^{s·λ}w(φ)η (separatedness: π_alg is locally algebraic) has E_2^{p,q} = Ext^p_T(H_q(N^-, π_alg), δ) (LR.4/schraen-spectral-sequence). H_q(N^-, π_alg) = H_q(n^-, L(λ)) ⊗ J_{N^-}(I_sm(φ)) with J_{N^-}(I_sm(φ)) ≅ ⊕_{w′} w′(φ)η (SR.2/principal-series-jacquet) and Kostant (LR.4/unipotent-homology); Ext between distinct torus characters vanishes (LR.4/torus-ext), so in total degree 1 only Hom_T(H_1(N^-, π_alg), δ) ≅ Hom_T(δ, δ) = E survives. Push-forward along C(I, s) ↪ (Ind δ)^an is an isomorphism on Ext^1(π_alg, −) because the other constituents have lg ≥ 2 relative to λ (LR.5/ext-vanishing-long-weyl). (2): the same computation with π̃_alg (whose restriction to SL_n(L) is locally algebraic, so separatedness holds) gives Ext^1(π̃_alg, C(I, s)) ≅ Hom_T(w(φ)ηz^{s·λ}(1 + ψε), w(φ)ηz^{s·λ}) with ψ = ζ_w^{-1}(π̃_alg) ≠ 0, which is one-dimensional; the pull-back is injective by dévissage, hence bijective.

*Sources.* [DING25](#references), §3.1.2, Lemma 3.5 and its proof, (3.7)–(3.9), pp. 36–37: States (1)–(2); proves (2) and the second equality of (1) with Schraen's spectral sequence (the separatedness hypothesis holds for π_alg and its self-extensions), the vanishing of Ext between distinct torus characters, Schraen's (4.40)–(4.42), the classical Jacquet module of I_sm(φ) and Ding's Lemma 2.26; the first equality is quoted from Breuil–Qian Proposition 5.1.14 and Lemma 3.2.4(ii).

*Needs.* `LR.7/self-extensions`, `LR.7/constituent-labels`, `LR.4/schraen-spectral-sequence`, `LR.4/unipotent-homology`, `LR.4/torus-ext`, `LR.5/ext-vanishing-long-weyl`, `SmoothRepresentationsOfLocalGroups:SR.2/principal-series-jacquet`.

#### The maps ζ_w : Hom(T(L), E) → Ext^1(π_alg(φ, h), π_1(φ, h)) (`zeta-w`, construction)

For w ∈ S_n, sending ψ ∈ Hom(T(L), E) to (Ind_{B^-(L)}^{GL_n(L)} w(φ)ηz^λ(1 + ψε))^{ℚ_p-an} ∈ Ext^1(PS(w(φ), h), PS(w(φ), h)), pulling back along π_alg(φ, h) ↪ PS(w(φ), h) and using the push-forward isomorphism Ext^1(π_alg, PS_1(w(φ), h)) ≅ Ext^1(π_alg, PS(w(φ), h)) (Ding 2019, Lemma 2.26: the constituents of PS/PS_1 have lg ≥ 2) gives the map (3.10) Hom(T(L), E) → Ext^1(π_alg, PS_1(w(φ), h)); composing with push-forward along PS_1(w(φ), h) ↪ π_1(φ, h) gives ζ_w : Hom(T(L), E) → Ext^1_{GL_n(L)}(π_alg(φ, h), π_1(φ, h)) ((3.11)). Equivalently, I_{B^-}(w(φ)ηz^λ(1 + ψε)) ⊆ (Ind w(φ)ηz^λ(1 + ψε))^an is an extension of π_alg by a subrepresentation V ⊆ PS_1(w(φ), h), and ζ_w(ψ) is its push-forward along V ↪ PS_1 ↪ π_1 (Remark 3.7). ζ_w does not depend on the isomorphisms (3.2).

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ.

*Uses.* Ding, Propositions 3.6, 3.8, 3.12 and Theorem 3.21: the GL_n-side counterpart of κ_w^{-1}; t_{φ,h} = ⊕_w ζ_w. PadicHodgeParametersInLocallyAnalyticRepresentations, contracts LA3 and LA6: injective ζ_w : H_T → B with images B_w, and the character-to-Ext compatibility (3.10).

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

*Acceptance examples.* On Hom_{g′}(T(L), E), ζ_w is the composite of the bijection of LR.7/self-extensions with push-forward along π_alg ↪ π_1 (Ding, Proposition 3.6(2)).

*Proof sketch.* (Ind w(φ)ηz^λ(1 + ψε))^an is an E[ε]-self-extension of PS(w(φ), h) (LR.1/self-extension-dual-numbers, LR.4/locally-analytic-induction); pull back along π_alg ↪ PS. The push-forward Ext^1(π_alg, PS_1) → Ext^1(π_alg, PS) is an isomorphism by LR.5/ext-vanishing-long-weyl and dévissage; invert it, then push forward to π_1. Remark 3.7: the closed induction I(w(φ)ηz^λ(1 + ψε)) (LR.6/closed-induction) lies in the deformed induction and maps onto π_alg with kernel inside PS_1, giving the same class.

*Sources.* [DING25](#references), §3.1.2, (3.10)–(3.11), p. 37–38, and Remark 3.7, p. 38: Constructs (3.10) and ζ_w from the deformed principal series and Ding's Lemma 2.26, notes independence of (3.2), and gives the equivalent description through Emerton's closed induction.

*Needs.* `LR.7/ps1-and-pi1`, `LR.7/self-extensions`, `LR.5/ext-vanishing-long-weyl`, `LR.6/closed-induction`, `LR.1/self-extension-dual-numbers`.

*Planet:* The maps ζ_w.

#### Ext^1(π_alg, PS_1) is Hom(T(L), E) (Ding, Proposition 3.6) (`ext-ps1`, theorem)

(1) For w ∈ S_n the map (3.10) Hom(T(L), E) → Ext^1_{GL_n(L)}(π_alg(φ, h), PS_1(w(φ), h)) is bijective; in particular dim_E Ext^1(π_alg, PS_1(w(φ), h)) = n + n·d_L = dim Hom(T(L), E). Equivalently ζ_w : Hom(T(L), E) ≅ Ext^1(π_alg, PS(w(φ), h)). (2) ζ_w restricted to Hom_{g′}(T(L), E) equals (3.4) followed by the push-forward Ext^1(π_alg, π_alg) ↪ Ext^1(π_alg, π_1(φ, h)).

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ.

*Acceptance examples.* For n = 2, L = ℚ_p: dim Ext^1(π_alg, PS_1(φ, h)) = 4.

*Proof sketch.* Schraen's spectral sequence for Σ = π_alg, ρ = w(φ)ηz^λ: E_2^{0,1} = Hom_T(H_1(N^-, π_alg), ρ) = 0 (the weights of H_1 are s·λ-type, different from λ), and E_2^{1,0} = Ext^1_T(H_0(N^-, π_alg), ρ) = Ext^1_T(ρ, ρ) ≅ Hom(T(L), E) (LR.4/torus-ext), the other characters of H_0 contributing nothing. Hence Ext^1(π_alg, PS(w(φ), h)) ≅ Hom(T(L), E), and the push-forward from PS_1 is an isomorphism (LR.5/ext-vanishing-long-weyl); the resulting map agrees with (3.10) by construction. (2): both maps send ψ ∈ Hom_{g′} to the class of the locally algebraic-twisted closed induction (LR.7/self-extensions, LR.7/zeta-w).

*Sources.* [DING25](#references), §3.1.2, Proposition 3.6 and its proof, p. 38: Proves (1) by the argument of Lemma 3.5 (Schraen's spectral sequence and Ding 2019 Lemma 2.26) and notes (2) is clear; Remark 3.9 restates (1) with PS in place of PS_1.

*Needs.* `LR.7/zeta-w`, `LR.7/constituent-ext-lines`, `LR.4/schraen-spectral-sequence`, `LR.5/ext-vanishing-long-weyl`.

#### The extension group Ext^1(π_alg(φ, h), π_1(φ, h)) (Ding, Proposition 3.8) (`ext-pi1`, theorem)

(1) There is an exact sequence 0 → Ext^1(π_alg, π_alg) → Ext^1(π_alg, π_1(φ, h)) → ⊕_{1≤i≤n−1, σ∈Σ_L, I⊆{1,…,n}, #I=i} Ext^1(π_alg, C(I, s_{i,σ})) → 0 (the source prints I ⊆ {1, …, n−1}; see sourceIssues), so dim_E Ext^1_{GL_n(L)}(π_alg(φ, h), π_1(φ, h)) = n + (2^n − 1)d_L. (2) The map t_{φ,h} := (ζ_w)_w : ⊕_{w∈S_n} Hom(T(L), E) → Ext^1(π_alg, π_1(φ, h)) is surjective. (3) (Remark 3.9.) The push-forward Ext^1(π_alg, π_1(φ, h)) → Ext^1(π_alg, π(φ, h)) is an isomorphism (LR.7/finite-slope-amalgam), so (2) holds with π(φ, h) in place of π_1(φ, h).

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ.

*Acceptance examples.* For n = 2, L = ℚ_p: dim Ext^1(π_alg, π_1) = 2 + 3 = 5, while ⊕_{w} Hom(T, E) has dimension 8.

*Proof sketch.* Dévissage of 0 → π_alg → π_1 → ⊕ C(I, s) → 0 with Hom(π_alg, C(I, s)) = 0 gives the left part of the sequence; it suffices to show the last map surjective. For each w, 0 → Ext^1(π_alg, π_alg) → Ext^1(π_alg, PS_1(w(φ), h)) → ⊕_{i,σ} Ext^1(π_alg, C(w, s_{i,σ})) is exact (3.14), and by dimensions (n + d_L, n + nd_L and (n−1)d_L one-dimensional terms; LR.7/self-extensions, LR.7/ext-ps1, LR.7/constituent-ext-lines) the last map is surjective. Every C(I, s_{i,σ}) is a C(w, s_{i,σ}) for some w, so varying w covers the target (3.15); this gives (1) and, with LR.7/ext-ps1, the surjectivity (2). The dimension is (n + d_L) + (2^n − 2)d_L.

*Sources.* [DING25](#references), §3.1.2, Proposition 3.8, (3.12)–(3.15) and its proof, pp. 38–39: Proves the exact sequence by dévissage, surjectivity of the last map by comparing dimensions in (3.14) and covering the targets by varying w in (3.15), and surjectivity of t_{φ,h}; the dimension n + (2^n − 1)d_K follows from Lemma 3.5 and Proposition 3.6. [DING25](#references), §3.1.2, Remark 3.9, (3.16), p. 39: Replaces π_1(φ, h) by π(φ, h) via the push-forward isomorphism.

*Needs.* `LR.7/ext-ps1`, `LR.7/constituent-ext-lines`, `LR.7/self-extensions`, `LR.7/ps1-and-pi1`, `LR.1/ext-groups`.

*Planet:* Ext¹(π_alg, π_1) and the surjection t_{φ,h}.

#### The amalgam π(φ, h) of the principal series (`finite-slope-amalgam`, construction)

π(φ, h) is the unique quotient of the amalgamated sum ⊕^{w∈S_n}_{π_alg(φ,h)} PS(w(φ), h) (over the fixed π_alg ↪ PS(w(φ), h)) with socle π_alg(φ, h); it is the representation π(ρ)^{fs} of Breuil–Herzig (Definition 5.7) in this setting. π_1(φ, h) is the subrepresentation formed by the first two layers of the socle filtration of π(φ, h), and push-forward along π_1(φ, h) ↪ π(φ, h) is an isomorphism Ext^1(π_alg, π_1(φ, h)) ≅ Ext^1(π_alg, π(φ, h)).

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ.

*Uses.* Ding, Theorem 1.1 and §3.2: the Hodge parameters are stated with π(φ, h) while proofs use π_1(φ, h). Breuil–Herzig, Definition 5.7: the finite slope part Π(ρ)^{fs} of the conjectural p-adic correspondence.

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

*Acceptance examples.* For n = 2 (and d_L = 1), π(φ, h) = π_1(φ, h) since PS has length 2.

*Proof sketch.* Each principal series has A=π_alg with composition multiplicity one (the length-zero Verma constituent), so the finite amalgam M also does. A subrepresentation disjoint from A has no A composition factor, and finite sums of these subrepresentations remain disjoint. Finite length gives their largest sum R. Then A embeds essentially into M/R and soc(M/R)=A. Any quotient of M preserving this socle kills precisely R; this proves uniqueness. Admissibility is preserved by the finite sums and quotients. Its socle filtration: the first layer is π_alg, the second ⊕ C(I, s) (LR.7/principal-series-constituents (3)), so the first two layers form π_1. Push-forward isomorphism: the constituents of π(φ, h)/π_1(φ, h) are C(w, u) with lg(u) ≥ 2, for which Ext^1(π_alg, −) and Hom(π_alg, −) vanish (LR.5/ext-vanishing-long-weyl).

*Sources.* [DING25](#references), §3.1.2, Remark 3.9 and (3.16), p. 39: Defines π(φ, h) as the unique quotient of the amalgamated sum of the PS(w(φ), h) with socle π_alg(φ, h), identifies it with π(ρ)^{fs} of Breuil–Herzig Definition 5.7, notes π_1 is its first two socle layers, and proves the push-forward isomorphism via Ding 2019 Lemma 2.26. [BH20](#references), §5, Definition 5.7(i)–(iv), pp. 26–27: Defines M(w_alg, F) as the largest subrepresentation of a principal series whose constituents beyond the socle avoid C_soc(ρ), the amalgams M(ρ)_C over common socles, their unique quotients with socle C, and Π(ρ)^{fs} as the direct sum.

*Needs.* `LR.7/ps1-and-pi1`, `LR.7/principal-series-constituents`, `LR.5/ext-vanishing-long-weyl`.

#### The filtration Ext^1_g ⊆ Ext^1_{g′} ⊆ Ext^1_w of Ext^1(π_alg, π_1) (`ext-filtration`, definition)

Inside Ext^1(π_alg(φ, h), π_1(φ, h)) define Ext^1_g (respectively Ext^1_{g′}, respectively Ext^1_w = Ext^1_{T_w}) as the image of Ext^1_lalg(π_alg, π_alg) (respectively of Ext^1(π_alg, π_alg), respectively of ζ_w), T_w being the B-filtration of ⊕φ_i attached to w. Then ζ_w : Hom(T(L), E) ≅ Ext^1_w (3.17); Ext^1_g ⊆ Ext^1_{g′} ⊆ Ext^1_w for every w, of dimensions n, n + d_L and n(1 + d_L); and for w_1, w_2, ζ_{w_2} ∘ (w_2w_1^{-1}) = ζ_{w_1} on Hom_{g′}(T(L), E) (3.18).

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ.

*Uses.* Ding, §3.2: the comparison matches Ext^1_0 ⊆ Ext^1_g ⊆ Ext^1_{g′} ⊆ Ext^1_w ⊆ Ext^1 on the Galois side with this filtration. PadicHodgeParametersInLocallyAnalyticRepresentations, contract LA3: B_g ≤ B_{g′} ≤ B_w with dim B_g = n, dim B_{g′} = n + d_K and Σ_w B_w = B.

*API* (namespace `TauCeti.LocallyAnalytic.GLn`):

- `extG` (data): Ext^1_g(π_alg, π_1), the image of Ext^1_lalg(π_alg, π_alg).
- `extGPrime` (data): Ext^1_{g′}(π_alg, π_1), the image of Ext^1(π_alg, π_alg).
- `extW` (data): Ext^1_w(π_alg, π_1) := range ζ_w.
- `extG_le_extGPrime` (relation): Ext^1_g ⊆ Ext^1_{g′} ⊆ Ext^1_w for every w.
- `finrank_ext_filtration` (other): dim Ext^1_g = n, dim Ext^1_{g′} = n + d_L, dim Ext^1_w = n(1 + d_L).
- `iSup_extW` (characterisation): Σ_w Ext^1_w = Ext^1(π_alg, π_1) (LR.7/ext-pi1 (2)).
- `zeta_weyl` (relation): ζ_{w_2} ∘ (w_2w_1^{-1}) = ζ_{w_1} on Hom_{g′}(T(L), E).

**Checks.**

- `ext_filtration_dims_n2` (computation): For n = 2, L = ℚ_p: dim Ext^1_g = 2, dim Ext^1_{g′} = 3, dim Ext^1_w = 4, dim Ext^1 = 5.
- `ext_filtration_n1` (degenerate): For n = 1, Ext^1_{g′} = Ext^1_w = Ext^1 = Hom(L^×, E) and Ext^1_g = Hom_sm(L^×, E).
- `extW_ne_ext` (non-example): For n ≥ 2 a single Ext^1_w is a proper subspace of Ext^1(π_alg, π_1): n(1 + d_L) < n + (2^n − 1)d_L.
- `extGPrime_common` (characterisation): Ext^1_{g′} is the same subspace for every w (independent of w), although the parametrisations ζ_w differ by the permutation w_2w_1^{-1}.
- `zeta_weyl_cycle` (computation): For n=3, w_1=1, w_2=(1 2 3), and the first-coordinate smooth additive character ψ_1, the action sends ψ_1 to ψ_2. The identity is ζ_{(123)}(ψ_2)=ζ_1(ψ_1); equivalently ζ_{(123)}(ψ_1)=ζ_1(ψ_3). A transposition-only test would not detect the reversed transition.

*Acceptance examples.* For n = 2, L = ℚ_p: dimensions 2 ⊆ 3 ⊆ 4 inside 5.

*Proof sketch.* Push-forward Ext^1(π_alg, π_alg) → Ext^1(π_alg, π_1) is injective (Hom(π_alg, π_1/π_alg) = 0), giving Ext^1_g ⊆ Ext^1_{g′}; LR.7/ext-ps1 (2) gives Ext^1_{g′} ⊆ Ext^1_w. ζ_w is injective: it factors through the bijection of LR.7/ext-ps1 followed by the push-forward PS_1 ↪ π_1, injective on Ext^1 by dévissage; (3.18) is LR.7/self-extensions (2).

*Sources.* [DING25](#references), §3.1.2, (3.17)–(3.18), p. 39: Defines Ext^1_g ⊆ Ext^1_{g′} ⊆ Ext^1_w as images of Ext^1_lalg(π_alg, π_alg), Ext^1(π_alg, π_alg) and ζ_w, records ζ_w : Hom(T(K), E) ≅ Ext^1_w and the commutative square (3.18).

*Needs.* `LR.7/ext-pi1`, `LR.7/ext-ps1`, `LR.7/self-extensions`.

### Examples

- **Weights, twists and parameter spaces for GL_n(L).** η z^λ = z^h · (ε^{-1} ∘ θ) as characters of T(L) (the computation is in LR.7/principal-series-ps).
- **The locally algebraic representation π_alg(φ, h).** For n = 1, π_alg(φ, h) = φ_1 z^{h_1}, a character.
- **The locally analytic principal series PS(w(φ), h) and its constituents C(w, u).** For n = 1, PS(φ, h) = C(1, 1) = φ_1 z^{h_1}.
- **Constituents and socle of the locally analytic principal series (Ding, Proposition 3.1).** For n = 2, L = ℚ_p: PS(w(φ), h) is a nonsplit extension of C(w, s) by π_alg(φ, h), and C(1, s) ≇ C(s, s).
- **The constituents C(I, s_{i,σ}).** For n = 2 the labels are I = {1}, {2} with i = 1, giving C({1}, s_{1,σ}) and C({2}, s_{1,σ}) for each σ: 2d_L constituents.
- **Jacquet–Emerton modules and closed inductions of the constituents (Ding, Lemma 3.2).** For n = 2, L = ℚ_p: I_{B^-}^G(z^{s·λ}φη) ≅ C(1, s) = C({1}, s).
- **The representations PS_1(w(φ), h) and π_1(φ, h).** For n = 2, L = ℚ_p: π_1(φ, h) is the amalgam of PS_1(φ, h) = PS(φ, h) and PS_1(s(φ), h) = PS(s(φ), h) over π_alg, with cosocle C({1}, s) ⊕ C({2}, s).
- **Self-extensions of π_alg(φ, h) (Ding, Proposition 3.3).** For n = 1: Ext^1_{L^×}(χ, χ) = Hom(L^×, E) of dimension 1 + d_L, Ext^1_lalg of dimension 1.
- **One-dimensional extension groups with a constituent (Ding, Lemma 3.5).** For n = 2, L = ℚ_p: Ext^1(π_alg, C({1}, s)) and Ext^1(π_alg, C({2}, s)) are each one-dimensional.
- **The maps ζ_w : Hom(T(L), E) → Ext^1(π_alg(φ, h), π_1(φ, h)).** On Hom_{g′}(T(L), E), ζ_w is the composite of the bijection of LR.7/self-extensions with push-forward along π_alg ↪ π_1 (Ding, Proposition 3.6(2)).
- **Ext^1(π_alg, PS_1) is Hom(T(L), E) (Ding, Proposition 3.6).** For n = 2, L = ℚ_p: dim Ext^1(π_alg, PS_1(φ, h)) = 4.
- **The extension group Ext^1(π_alg(φ, h), π_1(φ, h)) (Ding, Proposition 3.8).** For n = 2, L = ℚ_p: dim Ext^1(π_alg, π_1) = 2 + 3 = 5, while ⊕_{w} Hom(T, E) has dimension 8.
- **The amalgam π(φ, h) of the principal series.** For n = 2 (and d_L = 1), π(φ, h) = π_1(φ, h) since PS has length 2.
- **The filtration Ext^1_g ⊆ Ext^1_{g′} ⊆ Ext^1_w of Ext^1(π_alg, π_1).** For n = 2, L = ℚ_p: dimensions 2 ⊆ 3 ⊆ 4 inside 5.

### Dependencies

`LocallyAnalyticRepresentationsOfLocalGroups:LR.1`, `LocallyAnalyticRepresentationsOfLocalGroups:LR.2`, `LocallyAnalyticRepresentationsOfLocalGroups:LR.4`, `LocallyAnalyticRepresentationsOfLocalGroups:LR.5`, `LocallyAnalyticRepresentationsOfLocalGroups:LR.6`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`, `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension`, `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-4-the-classification-of-finite-dimensional-irreducibles`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-9-reductive-lie-algebras-and-gl_n`.

## Layer LR.8: Parabolic induction and the amalgamation of π_1

Ding §3.1.3: Levi data of a P-filtration and the induction (3.19), the constituents of a parabolic induction, π_{F_P}(φ, h), Ext¹(π_alg, π_{F_P}), the map ζ_{F_P} and its bijectivity, and the amalgamation of the two endpoint parabolics into π_1(φ, h). The tensor-extension kernel has one π_1 factor and π_alg in the other factors. Smooth characters of singleton grades follow the filtration order; endpoint parabolics require n≥2.

**Coverage:** planned. Uses the outstanding LR.7 first-two-layer and supplier contracts. The local tensor-extension kernel, ordered singleton factors and Weyl transitions are corrected; no additional locally hidden tensor-filtration gap remains.

#### Levi data of a P-filtration and the parabolic induction (3.19) (`parabolic-levi-data`, construction)

Let P ⊇ B be a standard parabolic with Levi L_P = diag(GL_{n_1}, …, GL_{n_r}) and Weyl group W_P. A P-filtration F_P of ⊕_{i=1}^n φ_i is an ordering of the φ_i into consecutive blocks of sizes n_1, …, n_r; put φ_{F_P,i} := ⊗_{φ_j ∈ gr^i F_P} φ_j, h^i := (h_{n_1+⋯+n_{i−1}+1}, …, h_{n_1+⋯+n_i}) and λ^i the corresponding dominant weight. LR.7 applied to (φ_{F_P,i}, h^i) gives π_alg(φ_{F_P,i}, h^i) ⊆ π_1(φ_{F_P,i}, h^i) for GL_{n_i}(L); for n_i=1, put k=n_1+⋯+n_{i−1}+1 and let ψ_k be the unique smooth character in gr^i F_P; both representations equal ψ_k z^{h_k}. For an arbitrary filtration ψ_k need not be the original φ_k. The source’s missing +1 is also corrected (E4). Fixing compatible isomorphisms (transitivity of parabolic induction, matching (3.2) for all w ∈ W_Pw_0 refining F_P, with w_0 any one such ordering), there is an injection π_alg(φ, h) ≅ (Ind_{P^-(L)}^{GL_n(L)} (⊠_i π_alg(φ_{F_P,i}, h^i)) ε^{-1} ∘ θ^P)^{lalg} ↪ (Ind_{P^-(L)}^{GL_n(L)} (⊗̂_i π_1(φ_{F_P,i}, h^i)) ε^{-1} ∘ θ^P)^{ℚ_p-an} ((3.19)), with ⊗̂ the completed tensor product of LR.0/completed-external-tensor.

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ.

*Uses.* Ding, Lemma 3.10 and (3.21)–(3.27): constituents of the parabolic induction, π_{F_P}(φ, h) and ζ_{F_P}. PadicHodgeParametersInLocallyAnalyticRepresentations, contract LA4: θ_P constant −Σ_{k<i} n_k on block i and the twist ε^{-1} ∘ θ_P; completed external tensor products.

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
- `leviWeight_n1_block` (computation): For n=3, blocks (2,1), and ordered tuple (φ_3,φ_1,φ_2), the singleton block starts at k=3 and its representation is φ_2 z^{h_3}. The weight is indexed by its position and the character by the grade, so neither φ_3 z^{h_3} nor index k−1 is correct.
- `thetaP_block` (computation): For n = 3 and blocks (2, 1), θ^P = (0, 0, −2).

*Acceptance examples.* For P = B, every n_i = 1 and the injection is π_alg(φ, h) ↪ PS(w(φ), h) for the w attached to F_P.

*Proof sketch.* Transitivity of parabolic induction (LR.4/locally-analytic-induction) identifies I_sm(w(φ)) ⊗ L(λ) with the induction from P^- of ⊠_i I_sm(w_i(φ_{F_P,i})) ⊗ L(λ^i) twisted by ε^{-1} ∘ θ^P; the twist corrects the shift between λ and (λ^i)_i. Choose a refinement T_{w_0} of F_P, whose ordered tuple is ψ_k=φ_{w_0^{-1}(k)}. All refinements form the left coset W_Pw_0. Choose the block isomorphisms first and transport by transitivity to that coset; it is W_P itself only for the standard filtration. π_alg(φ_{F_P,i}, h^i) ↪ π_1(φ_{F_P,i}, h^i) and exactness of induction give (3.19).

*Sources.* [DING25](#references), §3.1.3, the paragraph before Lemma 3.10 and (3.19), p. 40: Defines F_P, φ_{F_P,i}, h^i, λ^i, the GL_{n_i}(K)-representations π_alg(φ_{F_P,i}, h^i) ⊆ π_1(φ_{F_P,i}, h^i), the compatible isomorphisms and the injection (3.19) into the parabolic induction of ⊗̂_i π_1(φ_{F_P,i}, h^i) twisted by ε^{-1} ∘ θ^P.

*Needs.* `LR.7/ps1-and-pi1`, `LR.7/gln-conventions`, `LR.4/locally-analytic-induction`, `LR.0/completed-external-tensor`, `LR.1/admissible-external-tensor`.

#### Which constituents C(I, s_{i,σ}) occur in a parabolic induction (Ding, Lemma 3.10) (`parabolic-constituents`, theorem)

For 1 ≤ i ≤ n − 1, σ ∈ Σ_L and I ⊆ {1, …, n} with #I = i, C(I, s_{i,σ}) is an irreducible constituent of (Ind_{P^-}^{GL_n} (⊗̂_j π_1(φ_{F_P,j}, h^j)) ε^{-1} ∘ θ^P)^{ℚ_p-an} if and only if either (1) there is k with n_1 + ⋯ + n_{k−1} + 1 ≤ i ≤ n_1 + ⋯ + n_k − 1 and {j : φ_j ∈ Fil_{F_P}^{k−1}} ⊆ I ⊆ {j : φ_j ∈ Fil_{F_P}^k}, or (2) i = n_1 + ⋯ + n_k for some k ≤ r − 1 and I = {j : φ_j ∈ Fil_{F_P}^k}. Each such constituent has multiplicity one and lies in the socle of the quotient of the induction by π_alg(φ, h).

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ. Multiplicity one of L^-(−s_{i,σ}·λ) in the parabolic Verma module and its position in the cosocle of the kernel to L^-(−λ) are inputs of the gap 'Category O and Kostant homology'.

*Acceptance examples.* For P = B: the condition reduces to I = w^{-1}({1, …, i}) for the w attached to F_P, i.e. the C(w, s_{i,σ}) of PS_1(w(φ), h).

*Proof sketch.* Case (2) (i at a block boundary): the constituents come from V_0 = induction of ⊠_i π_alg(φ_{F_P,i}, h^i); they are F of the constituents L^-(−s_{i,σ}·λ) of the parabolic Verma module, multiplicity one and in the cosocle of the kernel, hence in the socle of the quotient by π_alg (LR.5/orlik-strauch-jordan-holder). Case (1) (i inside a block): V_I := induction of ⊠_{i≠k} π_alg ⊠ C(I, s_{i,σ})_k embeds into (Ind z^{s·λ}w(φ)η)^an for w^{-1}({1, …, i}) = I, whose socle is C(I, s) with multiplicity one; a closed subrepresentation W of the principal series shows C(I, s) lies in the socle of the quotient by π_alg. Every C(I, s) in the induction comes from V_0 or a V_I by exactness and Orlik–Strauch, with multiplicity one.

*Sources.* [DING25](#references), §3.1.3, Lemma 3.10 and its proof, pp. 40–41: Characterises the constituents C(I, s_{i,σ}) of the parabolic induction, using Orlik–Strauch, multiplicity one of L^-(−s_{i,σ}·λ) in the parabolic Verma module U(gl_{n,Σ_K}) ⊗_{U(p_{Σ_K})} (−λ), (3.1) and transitivity of parabolic induction.

*Needs.* `LR.8/parabolic-levi-data`, `LR.7/constituent-labels`, `LR.5/orlik-strauch-jordan-holder`, `LR.5/orlik-strauch-transitivity`.

#### The subrepresentation π_{F_P}(φ, h) and Ext^1_{F_P} (`pi-fp`, construction)

Let S_{F_P} be the set of constituents C(I, s_{i,σ}) satisfying LR.8/parabolic-constituents; #S_{F_P} = (Σ_{i=1}^r (2^{n_i} − 2) + (r − 1))·d_L ((3.21)). π_{F_P}(φ, h) is the unique subrepresentation of the parabolic induction (3.19) with socle π_alg(φ, h) and π_{F_P}(φ, h)/π_alg(φ, h) ≅ ⊕_{C∈S_{F_P}} C. For P = B and F_P = T_w, π_{F_P}(φ, h) ≅ PS_1(w(φ), h). The injection π_alg ↪ π_{F_P} extends uniquely to π_{F_P}(φ, h) ↪ π_1(φ, h); Ext^1_{F_P}(π_alg, π_1) denotes the image of the (injective) push-forward Ext^1(π_alg, π_{F_P}) → Ext^1(π_alg, π_1), and Ext^1_{F_P,g′} := ζ_{F_P}(∏_i Ext^1_{g′}(π_alg(φ_{F_P,i}, h^i), π_1(φ_{F_P,i}, h^i))) (LR.8/zeta-fp).

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ.

*Uses.* Ding, Propositions 3.11–3.13: Ext^1(π_alg, π_{F_P}) and the amalgamation π_F ⊕ π_G → π_1. PadicHodgeParametersInLocallyAnalyticRepresentations, contract LA4: π_F with its inclusion and the normalised images B_F.

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

*Acceptance examples.* For P = G: S_{F_P} is all (2^n − 2)d_L labels and π_{F_P} = π_1.

*Proof sketch.* Existence and uniqueness: LR.8/parabolic-constituents puts every C ∈ S_{F_P} in the socle of the quotient by π_alg with multiplicity one; take the preimage. Count: within block k, i ranges over n_{<k} + 1, …, n_{≤k} − 1 and I over the subsets between consecutive filtration steps, giving Σ_k (2^{n_k} − 2); at the r − 1 block boundaries there is one I each; times d_L. Extension to π_1: both have socle π_alg and the constituents of π_{F_P}/π_alg are among those of π_1/π_alg, each once (Hom computations with multiplicity one).

*Sources.* [DING25](#references), §3.1.3, (3.21), the definition of π_{F_P}(φ, h) and the remarks after it, pp. 40–41: Counts S_{F_P}, defines π_{F_P}(φ, h) by its socle and second layer, identifies it with PS_1(w(φ), h) for P = B, and extends π_alg ↪ π_{F_P} uniquely to π_{F_P} ↪ π_1. [DING25](#references), §3.1.3, the definitions after Proposition 3.11 and after Proposition 3.12, pp. 41–43: Defines Ext^1_{F_P}(π_alg, π_1) as the image of (3.22) and Ext^1_{F_P,g′} through ζ_{F_P}.

*Needs.* `LR.8/parabolic-constituents`, `LR.7/ps1-and-pi1`, `LR.1/admissible-abelian-category`.

#### The extension group Ext^1(π_alg, π_{F_P}) (Ding, Proposition 3.11) (`ext-pi-fp`, theorem)

dim_E Ext^1_{GL_n(L)}(π_alg(φ, h), π_{F_P}(φ, h)) = n + d_L·r + d_L·Σ_{i=1}^r (2^{n_i} − 2), and the push-forward Ext^1(π_alg, π_{F_P}) → Ext^1(π_alg, π_1) is injective.

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ.

*Acceptance examples.* For P = B: dim Ext^1(π_alg, PS_1(w(φ), h)) = n + nd_L (matching LR.7/ext-ps1).

*Proof sketch.* 0 → Ext^1(π_alg, π_{F_P}) → Ext^1(π_alg, π_1) → Ext^1(π_alg, ⊕_{C∉S_{F_P}} C) is exact since Hom(π_alg, C) = 0. The last map is surjective by LR.7/ext-pi1 (1); each Ext^1(π_alg, C) is one-dimensional (LR.7/constituent-ext-lines), so dim = n + (2^n − 1)d_L − ((2^n − 2)d_L − #S_{F_P}) = n + d_L + #S_{F_P}, which equals the formula by (3.21).

*Sources.* [DING25](#references), §3.1.3, Proposition 3.11 and its proof, (3.22)–(3.23), p. 41: By dévissage of 0 → π_{F_P} → π_1 → ⊕_{C∉S_{F_P}} C → 0 the push-forward is injective and the next map surjective (Proposition 3.8(1)); the dimension follows from Proposition 3.8(1), Lemma 3.5(1) and (3.21).

*Needs.* `LR.8/pi-fp`, `LR.7/ext-pi1`, `LR.7/constituent-ext-lines`.

#### The parabolic induction map ζ_{F_P} (`zeta-fp`, construction)

Write A_i=π_alg(φ_{F_P,i},h^i), B_i=π_1(φ_{F_P,i},h^i). Locally analytic induction twisted by ε^{-1}∘θ^P and pullback along (3.19) give Ext¹_{L_P}(⊠_i A_i,⊗̂_i B_i)→Ext¹_G(π_alg,(Ind …)^an)≅Ext¹_G(π_alg,π_{F_P}), as in (3.25). For extensions 0→B_i→X_i→A_i→0, filter ⊗̂_i X_i by the number of B-factors. Quotienting by filtration degree at least two gives 0→⊕_i(B_i⊠⊗̂_{j≠i}A_j)→V→⊠_i A_i→0. Map this kernel to ⊗̂_i B_i using each A_j↪B_j and addition, and push out. This gives (3.26) with its tensor factors corrected, and then ζ_{F_P}:∏_i Ext¹(A_i,B_i)→Ext¹_{F_P}(π_alg,π_1) by (3.27).

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ.

*Uses.* Ding, Proposition 3.12 and Theorem 3.21: the extension theory is multiplicative along the Levi, which drives the induction on n in the main theorem. PadicHodgeParametersInLocallyAnalyticRepresentations, contract LA4: ζ_F : ∏ B(M_i) ≅ B_F and compatible-refinement spanning.

*API* (namespace `TauCeti.LocallyAnalytic.GLn`):

- `leviExtMap` (data): (3.26): ∏_i Ext^1(π_alg,i, π_1,i) → Ext^1_{L_P}(⊠_i π_alg,i, ⊗̂_i π_1,i).
- `inductionExtMap` (data): (3.25): Ext^1_{L_P}(…) → Ext^1(π_alg, π_{F_P}).
- `zetaFP` (data): ζ_{F_P} := push-forward ∘ (3.25) ∘ (3.26).
- `zetaFP_linear` (structure): ζ_{F_P} is E-linear from the finite product of extension spaces, formed by adding the extension induced from each coordinate.
- `zetaFP_B` (example): For P = B, ζ_{F_P} = ζ_w for the w with T_w = F_P.

**Checks.**

- `zetaFP_G` (degenerate): For P = G (r = 1), ζ_{F_P} is the identity of Ext^1(π_alg, π_1).
- `zetaFP_B_test` (compatibility): For P=B and refinement with ordered smooth characters ψ_i=φ_{w^{-1}(i)}, the source is ∏_i Ext¹_{GL₁}(ψ_i z^{h_i},ψ_i z^{h_i})=Hom(T(L),E), and ζ_{F_P}=ζ_w.
- `zetaFP_dim_source` (computation): For n = 3 and blocks (2, 1): the source has dimension (2 + 3d_L) + (1 + d_L) = 3 + 4d_L, equal to n + d_L·r + d_L·Σ(2^{n_i} − 2) = 3 + 2d_L + 2d_L.
- `tensorExtension_one_factor` (computation): With a single factor, V=X_1 and its kernel is B_1. The alternative tensor expression printed between (3.25) and (3.26) would give A_1 and does not define the input extension.
- `tensorExtension_three_factors` (computation): For three vector-space extensions with dim A_i=1 and dim B_i=2, the degree-one kernel has dimension 2+2+2=6. The reversed expression has dimension 4+4+4=12 and fails the tensor filtration.

*Acceptance examples.* For P = B, ζ_{F_P} on ∏_i Hom(L^×, E) = Hom(T(L), E) is ζ_w (LR.8/zeta-fp-bijective (2)).

*Proof sketch.* Strict exactness of completed compact-type external tensor products gives the tensor filtration and its first graded piece ⊕_i B_i⊠⊗̂_{j≠i}A_j. The quotient and pushout stay in the admissible category by LR.1/admissible-external-tensor and LR.1/admissible-abelian-category. This construction is additive and E-linear in the tuple of extension classes, not a multilinear product of them. Exact induction and pullback give (3.25). The push-forward Ext^1(π_alg, π_{F_P}) → Ext^1(π_alg, Ind …) is bijective because the constituents of Ind/π_{F_P} have lg ≥ 2 (LR.5/ext-vanishing-long-weyl).

*Sources.* [DING25](#references), §3.1.3, (3.25)–(3.27) and the construction between them, p. 42: The construction of (3.25)–(3.27) is followed with the first tensor-filtration kernel corrected to ⊕_i B_i⊠⊗̂_{j≠i}A_j; the printed reversed factors fail even for one factor (E14).

*Needs.* `LR.8/pi-fp`, `LR.8/parabolic-levi-data`, `LR.0/completed-external-tensor`, `LR.5/ext-vanishing-long-weyl`, `LR.4/locally-analytic-induction`, `LR.1/admissible-external-tensor`, `LR.1/admissible-abelian-category`.

*Planet:* The parabolic induction map ζ_{F_P}.

#### ζ_{F_P} is bijective and compatible with the weight maps (Ding, Proposition 3.12) (`zeta-fp-bijective`, theorem)

(1) ζ_{F_P} : ∏_i Ext^1(π_alg(φ_{F_P,i}, h^i), π_1(φ_{F_P,i}, h^i)) → Ext^1_{F_P}(π_alg(φ, h), π_1(φ, h)) is bijective. (2) For every w such that T_w is compatible with F_P, the square with top ∏_i Hom(T(L) ∩ L_{P,i}(L), E) ≅ Hom(T(L), E), vertical maps (3.17) for each GL_{n_i} and for GL_n, and bottom ∏_i Ext^1_{T_{w,i}} ≅ Ext^1_w induced by ζ_{F_P}, commutes. (3) For w_1, w_2 with T_{w_1}, T_{w_2} compatible with F_P, ζ_{w_2} ∘ (w_2w_1^{-1}) = ζ_{w_1} on Hom_{P,g′}(T(L), E) ≅ Ext^1_{F_P,g′} ((3.30)). (4) ⊕_{T_w ⊆ F_P} Ext^1_w → Ext^1_{F_P} is surjective ((3.29)).

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ.

*Acceptance examples.* For P = B both sides equal Hom(T(L), E) ≅ Ext^1_w, of dimension n(1 + d_L).

*Proof sketch.* (2): for ψ = (ψ_i), (1 + ψε) = ⊠_i (1 + ψ_iε) and transitivity of parabolic induction identify both paths around (3.28). (4): each C ∈ S_{F_P} lies in some PS_1(w(φ), h) with T_w compatible with F_P; the argument of LR.7/ext-pi1 gives surjectivity, hence ζ_{F_P} is surjective by (2). (1): both sides have dimension n + d_L r + d_L Σ(2^{n_i} − 2) (LR.7/ext-pi1 for each GL_{n_i}, LR.8/ext-pi-fp).

*Sources.* [DING25](#references), §3.1.3, Proposition 3.12, (3.28)–(3.30) and its proof, pp. 42–43: Proves commutativity of (3.28) from the factorisation 1 + ψε = ⊠_i (1 + ψ_iε) and transitivity of induction, surjectivity of (3.29) as in Proposition 3.8, and bijectivity of ζ_{F_P} by comparing dimensions with Propositions 3.8 and 3.11; records (3.30).

*Needs.* `LR.8/zeta-fp`, `LR.8/ext-pi-fp`, `LR.7/ext-filtration`, `LR.7/ext-pi1`.

*Planet:* Bijectivity of ζ_{F_P}.

#### The two endpoint parabolics amalgamate to π_1(φ, h) (Ding, Proposition 3.13) (`endpoint-amalgamation`, theorem)

Let F be the filtration ⊕_{i≤n−1} φ_i ⊂ ⊕_i φ_i (parabolic P_{n−1}, Levi GL_{n−1} × GL_1) and G the filtration φ_n ⊂ ⊕_i φ_i (parabolic P_1, Levi GL_1 × GL_{n−1}). Then C(I, s_{i,σ}) occurs in π_F(φ, h) iff I ⊆ {1, …, n−1}, and in π_G(φ, h) iff I = I_1 ∪ {n} with I_1 ⊆ {1, …, n−1}; hence π_1/π_alg ≅ (π_F/π_alg) ⊕ (π_G/π_alg), and there are natural exact sequences 0 → π_alg(φ, h) → π_F(φ, h) ⊕ π_G(φ, h) → π_1(φ, h) → 0 and 0 → Ext^1_{g′}(π_alg, π_1) → Ext^1_F(π_alg, π_1) ⊕ Ext^1_G(π_alg, π_1) → Ext^1(π_alg, π_1) → 0, the first map b ↦ (b, −b). By LR.8/zeta-fp-bijective, ζ_F : Ext^1_{GL_{n−1}}(π_alg(φ^1, h^1), π_1(φ^1, h^1)) × Hom(L^×, E) ≅ Ext^1_F and similarly ζ_G. (The source prints P_1 and P_2 for the two parabolics; they are P_{n−1} and P_1 — see sourceIssues.)

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ. n≥2, so the endpoint parabolics and their blocks of sizes n−1 and 1 exist.

*Acceptance examples.* For n = 2, F = G = B-filtrations T_1 and T_s, π_F = PS_1(φ, h), π_G = PS_1(s(φ), h), and the first sequence is the amalgam defining π_1.

*Proof sketch.* Lemma 3.10 (LR.8/parabolic-constituents) for F and G gives the two constituent sets, which partition the (2^n − 2)d_L labels: a nonempty proper I either avoids n or contains it. The first sequence follows since π_F and π_G meet exactly in π_alg inside π_1; applying Ext^1(π_alg, −) and Hom(π_alg, π_1) = E gives the second sequence up to right exactness. Right exactness: dim Ext^1_F + dim Ext^1_G − dim Ext^1_{g′} = n + (2^n − 1)d_L by LR.8/ext-pi-fp, LR.7/self-extensions and LR.7/ext-pi1.

*Sources.* [DING25](#references), §3.1.3, the final paragraph, Proposition 3.13 and Remark 3.14, pp. 43–44: Describes the constituents of π_F and π_G via Lemma 3.10, splits π_1/π_alg, and states the two exact sequences, the right exactness of the second following by comparing dimensions (Propositions 3.3(1), 3.8(1), 3.11); Remark 3.14 gives ζ_F and ζ_G.

*Needs.* `LR.8/zeta-fp-bijective`, `LR.8/pi-fp`, `LR.7/ext-pi1`, `LR.7/self-extensions`.

*Planet:* Amalgamation of the endpoint parabolics.

### Examples

- **Levi data of a P-filtration and the parabolic induction (3.19).** For P = B, every n_i = 1 and the injection is π_alg(φ, h) ↪ PS(w(φ), h) for the w attached to F_P.
- **Which constituents C(I, s_{i,σ}) occur in a parabolic induction (Ding, Lemma 3.10).** For P = B: the condition reduces to I = w^{-1}({1, …, i}) for the w attached to F_P, i.e. the C(w, s_{i,σ}) of PS_1(w(φ), h).
- **The subrepresentation π_{F_P}(φ, h) and Ext^1_{F_P}.** For P = G: S_{F_P} is all (2^n − 2)d_L labels and π_{F_P} = π_1.
- **The extension group Ext^1(π_alg, π_{F_P}) (Ding, Proposition 3.11).** For P = B: dim Ext^1(π_alg, PS_1(w(φ), h)) = n + nd_L (matching LR.7/ext-ps1).
- **The parabolic induction map ζ_{F_P}.** For P = B, ζ_{F_P} on ∏_i Hom(L^×, E) = Hom(T(L), E) is ζ_w (LR.8/zeta-fp-bijective (2)).
- **ζ_{F_P} is bijective and compatible with the weight maps (Ding, Proposition 3.12).** For P = B both sides equal Hom(T(L), E) ≅ Ext^1_w, of dimension n(1 + d_L).
- **The two endpoint parabolics amalgamate to π_1(φ, h) (Ding, Proposition 3.13).** For n = 2, F = G = B-filtrations T_1 and T_s, π_F = PS_1(φ, h), π_G = PS_1(s(φ), h), and the first sequence is the amalgam defining π_1.

### Dependencies

`LocallyAnalyticRepresentationsOfLocalGroups:LR.0`, `LocallyAnalyticRepresentationsOfLocalGroups:LR.1`, `LocallyAnalyticRepresentationsOfLocalGroups:LR.4`, `LocallyAnalyticRepresentationsOfLocalGroups:LR.5`, `LocallyAnalyticRepresentationsOfLocalGroups:LR.7`.

## Layer LR.9: Locally σ-analytic theory

Ding §3.1.4: locally σ-analytic and g_{Σ_L∖{σ}}-algebraic representations, π_{1,σ}(φ, h) and PS_{1,σ}(w(φ), h), σ-analytic self-extensions and Ext¹ with PS_{1,σ} and π_1, the decomposition of Ext¹(π_alg, π_1) modulo Ext¹_g over embeddings, and the σ-analytic parabolic compatibility and amalgamation. Algebraic factors away from σ keep their own highest weights; the σ-analytic inducing weight is positive. Endpoint statements require n≥2.

**Coverage:** planned. Uses the outstanding LR.7 category-O/first-two-layer and finite-E supplier contracts. The σ-analytic comparisons and endpoint statements have the corrected weights and n≥2 restriction.

#### Locally σ-analytic and g_{Σ_L∖{σ}}-algebraic representations (`sigma-analytic-representation`, definition)

Let σ ∈ Σ_L. A locally ℚ_p-analytic representation V of a locally L-analytic group G over E is locally σ-analytic if the derived action of g ⊗_{ℚ_p} E = ∏_τ g_τ (LR.0/derived-lie-action) factors through g_σ = g ⊗_{L,σ} E, and g_{Σ_L∖{σ}}-algebraic if, for every v ∈ V, U(g_{Σ_L∖{σ}})·v is a finite-dimensional algebraic representation of g_{Σ_L∖{σ}} := ∏_{τ≠σ} g_τ. D_σ(G, E) is the quotient of D(G, E) acting on locally σ-analytic representations (the dual of the locally σ-analytic functions). For g_{Σ_L∖{σ}}-algebraic V, W, Ext^1_σ(V, W) ⊆ Ext^1_G(V, W) is the subspace of g_{Σ_L∖{σ}}-algebraic extensions; for admissible locally σ-analytic V, W it is Ext^1_{D_σ(G,E)}(W′, V′) (Breuil). For characters, Hom_σ(T(L), E) is the space of locally σ-analytic additive characters, and Hom_{σ,g′} := Hom_{g′} ∩ Hom_σ. (Ind_P^G U)^{σ-an} is the locally σ-analytic induction (LR.4/locally-analytic-induction).

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ.

*Uses.* Ding, Lemma 3.15 and Propositions 3.16–3.20: the σ-parts of all Ext^1 groups of §3.1. PadicHodgeParametersInLocallyAnalyticRepresentations, contract LA5: π_{1,σ}, B_σ and the decomposition ⊕_σ(B_σ/B_g) ≅ B/B_g. Breuil, socle II, Remarque 4.4(ii): the σ-analytic version of the adjunction.

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
- `not_sigma_character` (non-example): For L≠ℚ_p and τ≠σ, the multiplicative character L^×→E^×, x↦τ(x), is locally ℚ_p-analytic but not locally σ-analytic. The additive map τ:L→E is not a one-dimensional multiplicative representation of the additive group.
- `zalg_twist` (computation): For an algebraic character z^μ of T(L) with μ_τ = 0 for τ ≠ σ, z^μ is locally σ-analytic; if μ_τ ≠ 0 for some τ ≠ σ it is g_{Σ∖σ}-algebraic but not locally σ-analytic.

*Acceptance examples.* For L = ℚ_p (Σ_L = {σ}), every locally ℚ_p-analytic representation is locally σ-analytic and g_∅-algebraic, and Ext^1_σ = Ext^1.

*Proof sketch.* The derived action decomposes along g ⊗_{ℚ_p} E ≅ ∏_τ g_τ (LR.0/rational-points-analytic-group); both conditions are conditions on that action. Ext^1_σ is a subspace: g_{Σ∖σ}-algebraic extensions are closed under Baer sum and scalar multiplication.

*Sources.* [DING25](#references), §3.1.4, the first paragraph, p. 44: Defines locally σ-analytic and g_{Σ_K∖{σ}}-algebraic representations, Ext^1_σ and Hom_{σ,g′}(T(K), E). [BR19](#references), §2.1, the definitions and Lemme 2.1.1, p. 10: Works with locally σ-analytic representations, D_σ(H, E)-modules and proves Ext^1_{H,σ}(Π_1, Π_2) ≅ Ext^1_{D_σ(H,E)}(Π_2′, Π_1′) for admissible ones.

*Needs.* `LR.0/derived-lie-action`, `LR.1/ext1-extensions`, `LR.1/ext-groups`, `LR.4/locally-analytic-induction`, `LR.7/gln-conventions`.

*Planet:* Locally σ-analytic representation.

#### The g_{Σ_L∖{σ}}-algebraic parts π_{1,σ}(φ, h) and PS_{1,σ}(w(φ), h) (`pi1-sigma`, construction)

For σ ∈ Σ_L, π_{1,σ}(φ, h) ⊆ π_1(φ, h) is the subrepresentation which is an extension of ⊕_{1≤i≤n−1, #I=i} C(I, s_{i,σ}) (fixed σ, all I) by π_alg(φ, h); PS_{1,σ}(w(φ), h) ⊆ PS_1(w(φ), h) is the subrepresentation with constituents π_alg(φ, h) and C(w, s_{i,σ}), 1 ≤ i ≤ n−1, and PS_{1,σ}(w(φ), h) = PS_1(w(φ), h) ∩ ((Ind_{B^-} w(φ)ηz^{λ_σ})^{σ-an} ⊗_E L(λ^σ)) with λ_σ the σ-component of λ and λ^σ := (λ_τ)_{τ≠σ}. Moreover C(I, s_{i,σ}) ≅ F^{GL_n}_{B^-}(L^-(−s_{i,σ}·λ_σ), w(φ)η) ⊗_E L(λ^σ), with F^{GL_n}_{B^-}(L^-(−s_{i,σ}·λ_σ), w(φ)η) ↪ (Ind_{B^-} w(φ)ηz^{s_{i,σ}·λ_σ})^{σ-an} (the source drops the minus sign; see sourceIssues). π_{1,σ}(φ, h) is the unique quotient of ⊕^{w}_{π_alg(φ,h)} PS_{1,σ}(w(φ), h) with socle π_alg(φ, h), it is g_{Σ_L∖{σ}}-algebraic, and it is the maximal g_{Σ_L∖{σ}}-algebraic subrepresentation of π_1(φ, h). For a P-filtration, π_{F_P,σ}(φ, h) := π_{F_P}(φ, h) ∩ π_{1,σ}(φ, h), the maximal g_{Σ∖σ}-algebraic subrepresentation of π_{F_P}.

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ.

*Uses.* Ding, Propositions 3.16–3.20: the σ-analytic Ext computations. PadicHodgeParametersInLocallyAnalyticRepresentations, contract LA5: π_{1,σ}, its amalgam over A and maximal partially algebraic subrepresentations.

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

*Acceptance examples.* For L = ℚ_p, π_{1,σ}(φ, h) = π_1(φ, h) and PS_{1,σ} = PS_1.

*Proof sketch.* L^-(−s_{i,σ}·λ) = L^-_σ(−s_{i,σ}·λ_σ) ⊠ (⊠_{τ≠σ} L^-_τ(−λ_τ)) with finite-dimensional factors for τ ≠ σ, which gives the tensor decomposition of C(I, s_{i,σ}) and its g_{Σ∖σ}-algebraicity. The constituents C(I, s_{i,τ}) with τ ≠ σ are not g_{Σ∖σ}-algebraic (their τ-component is infinite-dimensional), so the maximal g_{Σ∖σ}-algebraic subrepresentation of π_1 is π_{1,σ}; similarly for PS_{1,σ} inside the σ-analytic induction.

*Sources.* [DING25](#references), §3.1.4, pp. 44–45: Writes C(I, s_{i,σ}) as a σ-analytic Orlik–Strauch representation tensored with L(λ^σ), defines π_{1,σ}(φ, h) and PS_{1,σ}(w(φ), h), and shows π_{1,σ} is the unique quotient of the amalgam of the PS_{1,σ} with socle π_alg and the maximal g_{Σ∖σ}-algebraic subrepresentation of π_1. [DING25](#references), §3.1.4, the paragraph before Proposition 3.19, p. 46: Defines π_{F_P,σ}(φ, h) := π_{F_P}(φ, h) ∩ π_{1,σ}(φ, h). [DING25](#references), §3.1.2, (3.1) and Lemma 3.2, pp. 34–35; §3.1.4, p. 44: The positive inducing weight is forced by the definition F(L^−(−s·λ),w(φ)η) and its contravariance. The negative inducing signs in (3.1) and Lemma 3.2 are corrected here; the positive sign on p. 44 is consistent. See sourceIssues E5 and E13.

*Needs.* `LR.9/sigma-analytic-representation`, `LR.7/ps1-and-pi1`, `LR.8/pi-fp`, `LR.5/orlik-strauch-functor`.

*Planet:* The representation π_{1,σ}(φ, h).

#### σ-analytic self-extensions of π_alg (Ding, Lemma 3.15) (`sigma-self-extensions`, theorem)

dim_E Ext^1_σ(π_alg(φ, h), π_alg(φ, h)) = n + 1, and (3.4) induces an isomorphism Hom_{σ,g′}(T(L), E) ≅ Ext^1_σ(π_alg(φ, h), π_alg(φ, h)).

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ.

*Acceptance examples.* For n = 1: Ext^1_σ(χ, χ) = Hom_σ(L^×, E), of dimension 2.

*Proof sketch.* Ext^1_{Z}(π_alg, π_alg) ⊆ Ext^1_lalg ⊆ Ext^1_σ (LR.1/locally-algebraic-ext), giving 0 → Ext^1_Z → Ext^1_σ → Hom_σ(Z(L), E) → 0, so dim Ext^1_σ = (n − 1) + 2 = n + 1. ζ_w of LR.7/self-extensions restricts to an injection Hom_{σ,g′} → Ext^1_σ between spaces of the same dimension n + 1.

*Sources.* [DING25](#references), §3.1.4, Lemma 3.15 and its proof, p. 45: With central character fixed the extensions are locally algebraic (Schraen Proposition 4.7), giving 0 → Ext^1_{GL_n,Z} → Ext^1_σ → Hom_σ(Z(K), E) → 0; (3.4) restricts injectively and both sides have dimension n + 1.

*Needs.* `LR.9/sigma-analytic-representation`, `LR.7/self-extensions`, `LR.1/locally-algebraic-ext`.

#### Ext^1_σ(π_alg, PS_{1,σ}) is Hom_σ(T(L), E) (Ding, Proposition 3.16 and Remark 3.17) (`sigma-ext-ps1`, theorem)

For w ∈ S_n, the map (3.10) induces an isomorphism Hom_σ(T(L), E) ≅ Ext^1_σ(π_alg(φ, h), PS_{1,σ}(w(φ), h)), both of dimension 2n. Moreover the last map in 0 → Ext^1_σ(π_alg, π_alg) → Ext^1_σ(π_alg, PS_{1,σ}(w(φ), h)) → ⊕_{i=1}^{n−1} Ext^1_σ(π_alg, C(w, s_{i,σ})) is surjective, and Ext^1_σ(π_alg, C(w, s_{i,σ})) ≅ Ext^1_{GL_n(L)}(π_alg, C(w, s_{i,σ})) (the source writes C(w(φ), s_{i,σ}); see sourceIssues).

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ.

*Acceptance examples.* For n = 1: Ext^1_σ(χ, χ) = Hom_σ(L^×, E), dimension 2 = 2n.

*Proof sketch.* For ψ ∈ Hom_σ(T(L), E), I(w(φ)ηz^λ(1 + ψε)) ⊆ (Ind w(φ)ηz^{λ_σ}(1 + ψε))^{σ-an} ⊗ L(λ^σ) is g_{Σ∖σ}-algebraic (LR.6/closed-induction, LR.9/pi1-sigma), so (3.10) restricts to Hom_σ → Ext^1_σ(π_alg, PS_{1,σ}), injective by LR.7/ext-ps1. Dévissage: dim Ext^1_σ(π_alg, PS_{1,σ}) ≤ (n + 1) + (n − 1)·1 (LR.9/sigma-self-extensions, LR.7/constituent-ext-lines); the source has dimension 2n, so the map is bijective and the last map surjective.

*Sources.* [DING25](#references), §3.1.4, Proposition 3.16, (3.31)–(3.32) and its proof, and Remark 3.17, pp. 45–46: For ψ ∈ Hom_σ, the closed induction of w(φ)ηz^λ(1 + ψε) lies in the σ-analytic induction tensored with L(λ^σ), so (3.10) restricts injectively; dévissage bounds the dimension by (n + 1) + (n − 1) = 2n, forcing bijectivity; Remark 3.17 records surjectivity of the last map and the identification of the σ- and full Ext^1 with C(w, s_{i,σ}).

*Needs.* `LR.9/pi1-sigma`, `LR.9/sigma-self-extensions`, `LR.7/zeta-w`, `LR.7/constituent-ext-lines`, `LR.6/closed-induction`.

#### The σ-part of Ext^1(π_alg, π_1) and the decomposition over embeddings (Ding, Proposition 3.18) (`sigma-ext-pi1`, theorem)

Let Ext^1_σ(π_alg, π_1) (respectively Ext^1_{σ,g′}) be the image of Ext^1_σ(π_alg, π_{1,σ}) (respectively Ext^1_σ(π_alg, π_alg)) under the injective push-forward; then Ext^1_{σ,g′} = Ext^1_{g′} ∩ Ext^1_σ. (1) 0 → Ext^1_σ(π_alg, π_alg) → Ext^1_σ(π_alg, π_1(φ, h)) → ⊕_{1≤i≤n−1, I⊆{1,…,n}, #I=i} Ext^1(π_alg, C(I, s_{i,σ})) → 0 is exact (the source prints I ⊆ {1, …, n−1}), and dim_E Ext^1_σ(π_alg, π_1) = n + 2^n − 1. (2) t_{φ,h} restricts to a surjection ⊕_{w∈S_n} Hom_σ(T(L), E) ↠ Ext^1_σ(π_alg, π_1). (3) ⊕_{τ∈Σ_L} Ext^1_τ(π_alg, π_1) → Ext^1_{GL_n(L)}(π_alg, π_1) is surjective and induces ⊕_{τ∈Σ_L} (Ext^1_τ/Ext^1_g) ≅ Ext^1/Ext^1_g, both of dimension (2^n − 1)d_L.

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ.

*Acceptance examples.* For L = ℚ_p (d_L = 1) the statements reduce to LR.7/ext-pi1.

*Proof sketch.* (1): as LR.7/ext-pi1, with PS_{1,σ} in place of PS_1 and LR.9/sigma-ext-ps1 for the surjectivity onto each one-dimensional Ext^1(π_alg, C(I, s_{i,σ})); dimension (n + 1) + (2^n − 2). (2): from LR.9/sigma-ext-ps1 and the covering argument of LR.7/ext-pi1. (3): comparing the sequences of LR.7/ext-pi1 and (1), the C(I, s_{i,τ})-components of Ext^1/Ext^1_{g′} are covered by Ext^1_τ, and Ext^1_{g′}/Ext^1_g = Hom(Z(L), E)/Hom_sm is spanned by the Hom_τ(Z(L)); hence (3.34) is surjective, and (3.35) is a surjection between spaces of dimension (2^n − 1)d_L.

*Sources.* [DING25](#references), §3.1.4, the definitions before Proposition 3.18, Proposition 3.18, (3.33)–(3.35) and its proof, p. 46: Defines Ext^1_σ(π_alg, π_1) and Ext^1_{σ,g′}, proves (1) as Proposition 3.8(1), (2) from Proposition 3.16 and Remark 3.17, and (3) by comparing (3.12) with (3.33) and dimensions.

*Needs.* `LR.9/sigma-ext-ps1`, `LR.7/ext-pi1`, `LR.7/ext-filtration`, `LR.9/pi1-sigma`.

*Planet:* Decomposition of Ext¹ over embeddings.

#### The σ-analytic theory is compatible with parabolic induction (Ding, Proposition 3.19) (`sigma-parabolic`, theorem)

Let Ext^1_{σ,F_P}(π_alg, π_1) be the image of Ext^1_σ(π_alg, π_{F_P,σ}); it equals Ext^1_σ(π_alg, π_1) ∩ Ext^1_{F_P}(π_alg, π_1). (1) dim_E Ext^1_{σ,F_P}(π_alg(φ, h), π_1(φ, h)) = n + r + Σ_{i=1}^r (2^{n_i} − 2). (2) ζ_{F_P} induces an isomorphism ∏_i Ext^1_σ(π_alg(φ_{F_P,i}, h^i), π_1(φ_{F_P,i}, h^i)) ≅ Ext^1_{σ,F_P}(π_alg(φ, h), π_1(φ, h)) (the source prints π_1(φ, λ) in (3.36); see sourceIssues), compatibly with the weight maps Hom_σ(T(L) ∩ L_{P,i}(L), E) for every w with T_w compatible with F_P.

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ.

*Acceptance examples.* For P = G: the statement is LR.9/sigma-ext-pi1 (1).

*Proof sketch.* Dévissage and LR.8/parabolic-constituents bound dim Ext^1_{σ,F_P} ≤ (n + 1) + (Σ(2^{n_i} − 2) + r − 1). ζ_{F_P} (LR.8/zeta-fp-bijective) restricts injectively to the σ-parts, and the source has dimension Σ_i (n_i + 2^{n_i} − 1) = n + r + Σ(2^{n_i} − 2) by LR.9/sigma-ext-pi1 (1) for each GL_{n_i}; so it is bijective.

*Sources.* [DING25](#references), §3.1.4, the paragraph before Proposition 3.19, Proposition 3.19, (3.36) and its proof, pp. 46–47: Defines Ext^1_{σ,F_P}, proves the dimension bound by dévissage with Lemma 3.10 (for fixed σ, #{C ∈ S_{F_P}} = Σ(2^{n_i} − 2) + (r − 1)), shows (3.27) restricts injectively to the σ-parts, and concludes by Proposition 3.18(1) and (3.28).

*Needs.* `LR.9/sigma-ext-pi1`, `LR.8/zeta-fp-bijective`, `LR.8/parabolic-constituents`, `LR.9/pi1-sigma`.

#### σ-analytic amalgamation of the endpoint parabolics (Ding, Proposition 3.20) (`sigma-amalgamation`, theorem)

With F and G as in LR.8/endpoint-amalgamation there is a natural exact sequence 0 → π_alg(φ, h) → π_{F,σ}(φ, h) ⊕ π_{G,σ}(φ, h) → π_{1,σ}(φ, h) → 0, and consequently 0 → Ext^1_{σ,g′}(π_alg, π_1) → Ext^1_{σ,F}(π_alg, π_1) ⊕ Ext^1_{σ,G}(π_alg, π_1) → Ext^1_σ(π_alg, π_1) → 0.

*Hypotheses and conventions.* Setting of LR.7: L/ℚ_p finite (Ding's K), d_L = [L:ℚ_p], E/ℚ_p finite containing all embeddings Σ_L = {σ : L → E}; G = GL_n(L) with upper Borel B = TN, lower Borel B^- = TN^-, all inductions locally ℚ_p-analytic and unnormalised; φ a generic smooth character of T(L), h strictly dominant, λ = h − θ. n≥2, so the endpoint parabolics and their blocks of sizes n−1 and 1 exist.

*Acceptance examples.* For L = ℚ_p it is LR.8/endpoint-amalgamation.

*Proof sketch.* Intersect the sequence of LR.8/endpoint-amalgamation with π_{1,σ}: the second layer of π_{1,σ} splits as the σ-constituents of π_F and of π_G. Right exactness of the Ext sequence by dimensions: dim Ext^1_{σ,F} = dim Ext^1_{σ,G} = n + 2^{n−1} (LR.9/sigma-parabolic with r = 2 and blocks of sizes n − 1 and 1), dim Ext^1_{σ,g′} = n + 1 (LR.9/sigma-self-extensions), and 2(n + 2^{n−1}) − (n + 1) = n + 2^n − 1 = dim Ext^1_σ (LR.9/sigma-ext-pi1).

*Sources.* [DING25](#references), §3.1.4, Proposition 3.20 and (3.37), p. 47: States the σ-analytic analogue of Proposition 3.13 for the representations and their Ext^1 groups.

*Needs.* `LR.9/sigma-parabolic`, `LR.8/endpoint-amalgamation`, `LR.9/pi1-sigma`.

*Planet:* σ-analytic amalgamation.

### Examples

- **Locally σ-analytic and g_{Σ_L∖{σ}}-algebraic representations.** For L = ℚ_p (Σ_L = {σ}), every locally ℚ_p-analytic representation is locally σ-analytic and g_∅-algebraic, and Ext^1_σ = Ext^1.
- **The g_{Σ_L∖{σ}}-algebraic parts π_{1,σ}(φ, h) and PS_{1,σ}(w(φ), h).** For L = ℚ_p, π_{1,σ}(φ, h) = π_1(φ, h) and PS_{1,σ} = PS_1.
- **σ-analytic self-extensions of π_alg (Ding, Lemma 3.15).** For n = 1: Ext^1_σ(χ, χ) = Hom_σ(L^×, E), of dimension 2.
- **Ext^1_σ(π_alg, PS_{1,σ}) is Hom_σ(T(L), E) (Ding, Proposition 3.16 and Remark 3.17).** For n = 1: Ext^1_σ(χ, χ) = Hom_σ(L^×, E), dimension 2 = 2n.
- **The σ-part of Ext^1(π_alg, π_1) and the decomposition over embeddings (Ding, Proposition 3.18).** For L = ℚ_p (d_L = 1) the statements reduce to LR.7/ext-pi1.
- **The σ-analytic theory is compatible with parabolic induction (Ding, Proposition 3.19).** For P = G: the statement is LR.9/sigma-ext-pi1 (1).
- **σ-analytic amalgamation of the endpoint parabolics (Ding, Proposition 3.20).** For L = ℚ_p it is LR.8/endpoint-amalgamation.

### Dependencies

`LocallyAnalyticRepresentationsOfLocalGroups:LR.0`, `LocallyAnalyticRepresentationsOfLocalGroups:LR.1`, `LocallyAnalyticRepresentationsOfLocalGroups:LR.4`, `LocallyAnalyticRepresentationsOfLocalGroups:LR.5`, `LocallyAnalyticRepresentationsOfLocalGroups:LR.6`, `LocallyAnalyticRepresentationsOfLocalGroups:LR.7`, `LocallyAnalyticRepresentationsOfLocalGroups:LR.8`.

## Downstream consumers

PadicHodgeParametersInLocallyAnalyticRepresentations states its locally analytic inputs as six contracts; their intended providers are listed below, subject to the explicit proof and supplier gaps. This partial review does not close those downstream contracts.

- **LA1**: LR.1 *Admissible locally analytic representations*, LR.1 *Schneider–Teitelbaum anti-equivalence*, LR.1 *Ext groups of admissible locally analytic representations*, LR.1 *Ext¹ classifies extensions of admissible representations*, LR.1 *Self-extensions as dual-number modules and tautological extensions*, LR.0 *Completed external tensor products of representations* and LR.1 *Admissibility of completed external tensor products*.
- **LA2**: LR.7 *The locally algebraic representation π_alg(φ, h)*, LR.7 *The locally analytic principal series PS(w(φ), h) and its constituents C(w, u)*, LR.7 *Constituents and socle of the locally analytic principal series (Ding, Proposition 3.1)*, LR.7 *The constituents C(I, s_{i,σ})*, LR.7 *The representations PS_1(w(φ), h) and π_1(φ, h)*, LR.7 *The amalgam π(φ, h) of the principal series*, LR.7 *One-dimensional extension groups with a constituent (Ding, Lemma 3.5)*, LR.7 *Self-extensions of π_alg(φ, h) (Ding, Proposition 3.3)*, LR.7 *The extension group Ext^1(π_alg(φ, h), π_1(φ, h)) (Ding, Proposition 3.8)*.
- **LA3**: LR.7 *The maps ζ_w : Hom(T(L), E) → Ext^1(π_alg(φ, h), π_1(φ, h))*, LR.7 *Ext^1(π_alg, PS_1) is Hom(T(L), E) (Ding, Proposition 3.6)*, LR.7 *The extension group Ext^1(π_alg(φ, h), π_1(φ, h)) (Ding, Proposition 3.8)*, LR.7 *The filtration Ext^1_g ⊆ Ext^1_{g′} ⊆ Ext^1_w of Ext^1(π_alg, π_1)*, LR.7 *Self-extensions of π_alg(φ, h) (Ding, Proposition 3.3)*.
- **LA4**: LR.8 *Levi data of a P-filtration and the parabolic induction (3.19)*, LR.8 *The subrepresentation π_{F_P}(φ, h) and Ext^1_{F_P}*, LR.8 *The extension group Ext^1(π_alg, π_{F_P}) (Ding, Proposition 3.11)*, LR.8 *The parabolic induction map ζ_{F_P}*, LR.8 *ζ_{F_P} is bijective and compatible with the weight maps (Ding, Proposition 3.12)*, LR.8 *The two endpoint parabolics amalgamate to π_1(φ, h) (Ding, Proposition 3.13)*, LR.6 *Emerton's closed induction I_P^G*, LR.0 *Completed external tensor products of representations* and LR.1 *Admissibility of completed external tensor products*.
- **LA5**: LR.9 *Locally σ-analytic and g_{Σ_L∖{σ}}-algebraic representations*, LR.9 *The g_{Σ_L∖{σ}}-algebraic parts π_{1,σ}(φ, h) and PS_{1,σ}(w(φ), h)*, LR.9 *σ-analytic self-extensions of π_alg (Ding, Lemma 3.15)*, LR.9 *Ext^1_σ(π_alg, PS_{1,σ}) is Hom_σ(T(L), E) (Ding, Proposition 3.16 and Remark 3.17)*, LR.9 *The σ-part of Ext^1(π_alg, π_1) and the decomposition over embeddings (Ding, Proposition 3.18)*, LR.9 *The σ-analytic theory is compatible with parabolic induction (Ding, Proposition 3.19)*, LR.9 *σ-analytic amalgamation of the endpoint parabolics (Ding, Proposition 3.20)*.
- **LA6**: LR.7 *The maps ζ_w : Hom(T(L), E) → Ext^1(π_alg(φ, h), π_1(φ, h))*, LR.7 *Ext^1(π_alg, PS_1) is Hom(T(L), E) (Ding, Proposition 3.6)*, LR.7 *Self-extensions of π_alg(φ, h) (Ding, Proposition 3.3)*, LR.6 *Emerton's closed induction I_P^G*, LR.6 *Emerton's adjunction theorem*, LR.6 *Breuil's adjunction for Orlik–Strauch representations*.

LocallyAnalyticCompletedCohomology (locally analytic vectors and R^iLA of Pan I §2) and CompletedCohomologyPartII CC.6 (derived locally analytic vectors in the classical comparison) take their inputs from LR.2 and LR.3. LocalGlobalCompatibilityPartIIEigenvarietyCompanions takes very strong admissibility, the Orlik–Strauch theory for products and Breuil's adjunction (Breuil–Hellmann–Schraen §5) from LR.2, LR.5 and LR.6. LieHighestWeightPartIICompletedCategoryO's analytic localisation (Boxer–Calegari–Gee–Pilloni §§3.5–3.6) takes LR.3 and LR.5.

## Source corrections

All entries are paraphrases. The packet records the texts read, hashes and searches for existing corrections. A rejected allegation is retained so that it cannot silently propagate.

- **E1 — DING25, Proposition 3.8(1), display (3.12), p. 38; also the diagram (3.15), p. 39, and Proposition 3.18(1), (3.33), p. 46 (published version) (confirmed).** The index set is I ⊂ {1, …, n} with #I = i, as in the definition of C(I, s_{i,σ}) on p. 34 and in Lemma 3.10. Review reason: Confirmed at (3.12), (3.15) and (3.33). The correct label set has all n indices: its 2^n−2 nonempty proper subsets give the dimension asserted by the source; n=2 detects the omitted singleton.
- **E2 — DING25, Lemma 3.2(1) and its proof, pp. 34–35 (published version) (confirmed).** Hom over T(K), the torus of GL_n(K). Review reason: Confirmed the ambient-torus typo in Lemma 3.2: the group of the representation and the adjunction is T(K), not its Q_p-point subgroup. The inducing-weight sign is a separate correction E13.
- **E3 — DING25, §3.1.3, the two inductions displayed in the last paragraph, p. 43 (published version) (confirmed).** They are from P_{n−1}^- (Levi GL_{n−1} × GL_1) and from P_1^- (Levi GL_1 × GL_{n−1}), the parabolics of the filtrations F and G of Proposition 3.13. Review reason: Confirmed from the displayed Levi factors: GL_{n−1}×GL_1 belongs to P_{n−1}, and GL_1×GL_{n−1} to P_1, in the source’s own notation.
- **E4 — DING25, §3.1.3, the case n_i = 1 before Lemma 3.10, p. 40 (published version) (confirmed).** The positional weight index is k=n_1+⋯+n_{i−1}+1. The smooth factor is the unique character in gr^i F_P, which equals the original φ_k only for a standard-order filtration. Review reason: Confirmed the missing block-start +1. For an arbitrary filtration, additionally use the unique smooth character of that grade, rather than the original position-labelled φ; only the weight index is positional.
- **E5 — DING25, §3.1.4, the embedding displayed after the description of C(I, s_{i,σ}), p. 44 (published version) (rejected).** Keep the printed positive inducing weight +s_{i,σ}·λ_σ. The proposed change to a negative weight is rejected; correct the inconsistent negative signs elsewhere instead (E13). No mathematical correction to the σ-labelled simple module is required. Review reason: Rejected. Contravariance sends the category-O weight −s·λ to the positive inducing weight +s·λ. For GL₂, λ=(1,1) and s·λ=(0,2), the constituent has central weight +2, whereas the proposed negative character has weight −2. The positive sign on p. 44 is correct. The σ subscript merely identifies the Lie factor and need not be removed. The inconsistent negative signs elsewhere are E13.
- **E6 — DING25, §3.1.2, p. 35 (amalgamated sum before (3.3)); §3.1.4, pp. 44–45 (description and characterisation of π_{1,σ}); (3.36), p. 47 (published version) (confirmed).** π_alg(φ, h) and π_1(φ, h). Review reason: Confirmed against the definitions indexed by h and λ=h−θ; the occurrences in the amalgam descriptions and (3.36) need h.
- **E7 — DING25, (3.28) and Remark 3.17, pp. 45–46 (published version) (confirmed).** C(w, s_{i,σ}). Review reason: Confirmed as a notational input mismatch: the defined first argument of C is a permutation w; the character w(φ) is used separately by its Orlik–Strauch definition.
- **E8 — DING25, proof of Proposition 3.6(1), p. 38 (published version) (confirmed).** [32, Lem. 2.26] (Ding, Simple L-invariants for GL_n), as on pp. 37 and 39. Review reason: Confirmed by the bibliography and the actual statement of DING19 Lemma 2.26, p. 29: the needed long-Weyl Ext vanishing is in reference [32], not [31].
- **E9 — DING25, §3.1.2, the paragraph defining π_1(φ, h) before (3.3), p. 35 (published version) (confirmed).** Proposition 3.1 (3) and (4). Review reason: Confirmed: the applicable four-part statement on p. 34 is Proposition 3.1; the reference to a Lemma 3.1 is a numbering slip.
- **E10 — DLB17, §3.3, proof of Théorème 3.2, p. 17 (arXiv:1509.00606v2) (confirmed).** In logarithmic generators the norm is p^{h−1}, so the associated valuation weight is h−1; a fixed Lie-basis change contributes bounded constants. Write the convergence condition as |a_α|‖𝔛^α‖_h→0 and choose h so these weights dominate the continuity bound. Do not compare the valuation weight c_h itself with p^{h−1}. Review reason: Confirmed at arXiv v2 p. 17. For b=g−1 with radius p^{−1/p^h}, the norm of log(1+b) is the supremum of p^{v_p(m)−m/p^h}; it is p^{h−1}, attained at m=p^h. Thus the corresponding valuation weight is h−1, up to basis constants, rather than a number exceeding p^{h−1}.
- **E11 — BCGP25, §2.2.27, p. 23 (arXiv:2502.20645v1) (confirmed).** Evaluate on O_{G_r} ⊗ V, the radius of the analytic vectors being constructed (or introduce r′ with its restriction map). Review reason: Confirmed at arXiv v1 p. 23: evaluation belongs to the same radius r used to define the analytic vectors, while r′ is not introduced there.
- **E12 — DING25, §3.1.2, the label paragraph after Proposition 3.1(4), p. 34 (published version) (confirmed).** Use the inverse image I=w^{-1}({1,…,i}) with the stated action w(φ)_j=φ_{w^{-1}(j)}. Review reason: Proposition 3.1(4) gives left cosets W_iw, which preserve the inverse image. For w=(123) and w′=(23)w in S₃ these inverse images of {1} both equal {3}, but the forward images are {2} and {3}.
- **E13 — DING25, §3.1.2, (3.1), Lemma 3.2, (3.8)–(3.9), pp. 34–37; proof of Lemma 3.10, p. 40 (published version) (confirmed).** Use +s_{i,σ}·λ in the inducing character, retaining −s_{i,σ}·λ on the category-O simple module. The positive sign on p. 44 is consistent. Review reason: The functor uses the dual of its finite-dimensional generating space. For GL₂ with λ=(1,1), s·λ=(0,2), the constituent has algebraic central weight +2; the negative induction has weight −2 and cannot contain it. Kostant homology in (3.9) also has the positive weight.
- **E14 — DING25, §3.1.3, construction between (3.25) and (3.26), p. 42 (published version) (confirmed).** For extensions of A_i=π_alg,i by B_i=π_1,i, the tensor product modulo terms with at least two B-factors has kernel ⊕_i B_i⊠⊗̂_{j≠i}A_j. Push this to ⊗̂_i B_i using A_j↪B_j and sum the maps. Review reason: For one factor the kernel must be B_1, whereas the reversed expression gives A_1. For three factors with dim A_i=1, dim B_i=2, the correct first graded piece has dimension 6 and the reversed expression has dimension 12. The corrected construction preserves (3.26)–(3.27).

## Open inputs

- **Category O, Verma layers and dualised Kostant formulas (owner LieHighestWeightPartIICompletedCategoryO, not designed).** The Orlik–Strauch layers and Ding's computations need, for g ⊗_{ℚ_p} E = ∏_σ g_σ with g split reductive: (a) the categories O and O^p_alg (finitely generated U(g ⊗ E)-modules, semisimple algebraic over l_P ⊗ E, locally finite over n_P ⊗ E; Orlik–Strauch §2.5, Breuil socle I §2 (i)–(iii)), abelian and artinian, closed under subobjects and quotients, O^q_alg ⊆ O^p_alg for q ⊇ p; (b) generalised Verma modules U(g) ⊗_{U(p)} W, their unique simple quotients, the maximal parabolic of a simple object and the classification of simple objects by highest weight (Humphreys §§9.3–9.4, Theorem 1.3); (c) for gl_n: the composition factors of the Verma module M^-(−λ), λ dominant, are the L^-(−u·λ), u ∈ W, with multiplicity one when lg(u) ≤ 1, the second radical layer is ⊕_{lg(u)=1} L^-(−u·λ), and multiplicity one of L^-(−s_{i,σ}·λ) in the parabolic Verma modules U(g) ⊗_{U(p)} (−λ) used in Ding's Lemma 3.10 (Humphreys Chapters 4–6, 8–9); (d) Kostant cohomology with the chosen positive roots, and homology obtained by H_q(n_P,W)=H^q(n_P,W∨)∨. The radical, dual and root twists must be fixed explicitly; the unadjusted cohomological w·λ formula is not a homology formula (Schraen Théorème 4.10, pp. 82–83). Upstream LieHighestWeight excludes full category O; the accepted LieHighestWeightPartII packet proposes the split-off roadmap LieHighestWeightPartIICompletedCategoryO as its owner (restructure, 'one algebraic completion owner and one category-O consumer'), which has no design job yet. Until it exists these statements are imported as this contract; no node of this roadmap plans them. Also supply the restricted BGG dual associated to a root-reversing anti-involution fixing the Cartan, with exactness, involutivity and preservation of simple highest-weight modules (BR15 pp. 14–15). This dual is distinct from the ordinary contragredient. Needed by: `LR.5/orlik-strauch-functor`, `LR.5/orlik-strauch-irreducibility`, `LR.5/orlik-strauch-jordan-holder`, `LR.4/unipotent-homology`, `LR.5/ext-vanishing-long-weyl`, `LR.7/principal-series-constituents`, `LR.8/parabolic-constituents`.
- **Solid functional analysis (owner LocallyAnalyticDistributionsPartIIQuasiAbelianFunctionalAnalysis, not designed).** BCGP §2.2 rests on solid functional analysis recalled from Rodrigues Jacinto–Rodríguez Camargo: Banach, Smith, Fréchet, LB and LS spaces as solid E-vector spaces and their equivalence with the classical notions (BCGP Proposition 2.2.9, RJRC22 Theorem 3.40), Banach–Smith duality and Hom(W, V) = W^∨ ⊗ V for W Smith and V Banach (RJRC22 Corollary 3.17), trace-class and compact maps and compact-type objects (BCGP Definitions 2.2.10–2.2.12, Proposition 2.2.13), flatness (BCGP Lemma 2.2.14). The accepted LocallyAnalyticDistributionsPartII packet proposes the owner LocallyAnalyticDistributionsPartIIQuasiAbelianFunctionalAnalysis (its restructure entry 1), which has no design job yet. LR.3 imports these statements as this contract. Needed by: `LR.3/banach-analytic-comparison`, `LR.3/solid-analytic-vectors`, `LR.3/solid-analytic-group-representation`, `LR.3/solid-group-representation`.
- **Proof of Dospinescu–Le Bras, Lemme 5.10.** DLB17 Lemme 5.10, p. 29, states that weakly null sequences in a Hausdorff locally convex space over a spherically complete field are null, without a proof. After passage to seminormed quotients, the missing input is the nonarchimedean Schur property for normed spaces. The existing compactoid supplier does not by itself show that the weakly compact sequence together with 0 is compactoid. Supply a complete proof or a cleared, exact published locator; the earlier suggested compactoid argument is withdrawn. No uncleared book was read. Needed by: `LR.0/weak-sequential-convergence`.
- **Breuil–Qian: Ext^1(C(I, s_{i,σ}), π_alg) is one-dimensional.** Ding's Lemma 3.5(1) quotes from Breuil–Qian (Splitting and expliciting the de Rham complex of the Drinfeld space, arXiv 2024, Proposition 5.1.14 with Lemma 3.2.4(ii)) that Ext^1(C(I, s_{i,σ}), π_alg(φ, h)) is one-dimensional, and proves only the other direction Ext^1(π_alg, C(I, s_{i,σ})) by Schraen's spectral sequence. No target of this roadmap or of its consumers' contracts uses the first direction; the paper was not read. The direction is stated in LR.7/constituent-ext-lines as an imported statement. Needed by: `LR.7/constituent-ext-lines`.
- **Derived analytic vectors: analytic-radius comparison and compact-group cohomology.** Pan Theorem 2.2.3, pp. 13–14, uses the Colmez–Dospinescu C^(m) filtration and its quantitative comparison with G_n-analytic norms to make the cohomology transition maps zero. The packet supplies no source-located target for that comparison. A follow-up must state the two-sided filtration bounds, the radius shifts and their tensor compatibility for B ⊗̂ M, and prove them from the cited Colmez–Dospinescu result. Separately realise the continuous cochain/solid derived comparison of RJRC22 Theorem 1.5 and Corollary 1.6 for compact G. The source statements of the acyclicity and compact comparison targets are verified; their proof closure remains partial. Needed by: `LR.2/admissible-la-acyclic`, `LR.2/derived-analytic-vectors`, `LR.3/solid-analytic-vectors`.
- **Rigid character-space carrier comparison.** The supplier LocallyAnalyticDistributions L3/mellin-adic-comparison explicitly conditions its adic realisation on a rigid/adic bridge. LR.6’s noncompact character-space construction is source-verified in EM17 Propositions 6.4.1–6.4.6, pp. 124–127, but the supplier carrier comparison must be discharged before those rigid function spaces can be identified with the adic quasi-Stein interface used in the packet. The compact character space remains owned by its supplier. Needed by: `LR.6/character-variety`, `LR.6/essentially-admissible`, `LR.6/finite-slope-part`.
- **First two socle layers for the ℚ_p-analytic Orlik–Strauch functor.** Ding Proposition 3.1(3), p. 34, states the second socle layer used here, but its cited OR19 Theorem 1, p. 2, is a locally L-analytic full-faithfulness theorem with trivial smooth argument. Establish the needed restricted consequence for the ℚ_p-analytic functor with generic finite-length smooth principal-series argument: the first two radical layers of M^−(−λ) give exactly soc(PS) and soc(PS/π_alg), with no additional simple subobjects. BR16 Corollary 2.5 proves the first socle; it does not by itself supply the second. This is an open proof contract, not a claimed general full-faithfulness extension. Needed by: `LR.7/principal-series-constituents`, `LR.7/ps1-and-pi1`, `LR.7/finite-slope-amalgam`.
- **Finite-E smooth principal-series supplier refinements.** The current upstream SmoothRepresentationsOfLocalGroups targets principal-series-jacquet, finite-length and generic-irreducibility were read in SR.2.2 and SR.3.1. They use ℂ; generic-irreducibility asserts an unspecified nonempty Zariski-open set. They do not state the E-valued GL_n ratio criterion, all-permutation isomorphisms or the unnormalised Jacquet decompositions needed by Ding §3.1.2. These source-verified consumer statements remain conditional on the three exact requests. They are owned by the smooth supplier, rather than re-planned in LR.7. Needed by: `LR.7/pi-alg`, `LR.7/principal-series-constituents`, `LR.8/parabolic-constituents`, `LR.7/constituent-ext-lines`, `LR.7/ext-ps1`, `LR.5/orlik-strauch-jordan-holder`.
- **Split finite-E highest-weight and Harish–Chandra interfaces.** Current LieHighestWeight layers 3, 4 and 7 are stated over an algebraically closed characteristic-zero field with their semisimple hypotheses. LR.1 and LR.7 use split reductive algebras ∏_σ gl_n over finite E/ℚ_p. Refine the supplier to construct E-rational highest-weight modules, their absolute irreducibility and classification, PBW/Verma interfaces and the Harish–Chandra centre with dot action, proving extension/descent from an algebraic closure and treating the reductive centre. No algebraically closed-field theorem is silently applied to finite E. Needed by: `LR.1/locally-algebraic-representation`, `LR.4/principal-series`, `LR.7/gln-conventions`, `LR.7/pi-alg`.
- **Solid analytic foundational supplier contracts.** SolidAnalyticRings SA.1, SA.2 and SA.4 are stage-level plans, with no target-level packet available in this checkout. The three existing requests specify the strongly-inaccessible/light-condensed conventions, solid E_■-modules, analytic affinoid base change and profinite group rings used by BCGP §§2.2.1–2.2.8. These are planned supplier contracts, not checked implementations or established target-level closure. The separate solid functional-analysis gap supplies Banach/Smith/LB compatibility and flatness. Needed by: `LR.3/solid-analytic-group-representation`, `LR.3/solid-group-representation`, `LR.3/solid-smooth-representation`, `LR.3/banach-analytic-comparison`, `LR.3/solid-analytic-vectors`, `LR.3/integrable-lb-lie-representation`.

## References

- [ST02] P. Schneider, J. Teitelbaum, *Locally analytic distributions and p-adic representation theory, with applications to GL2*, J. Amer. Math. Soc. 15 (2002), 443–468; arXiv:math/9912073v1, whose numbering agrees with the published text; page numbers are those of the arXiv PDF [Text](https://arxiv.org/pdf/math/9912073).
- [ST03] P. Schneider, J. Teitelbaum, *Algebras of p-adic distributions and admissible representations*, Invent. Math. 153 (2003), 145–196; arXiv:math/0206056v1; page numbers are those of the arXiv PDF [Text](https://arxiv.org/pdf/math/0206056).
- [ST02B] P. Schneider, J. Teitelbaum, *Banach space representations and Iwasawa theory*, Israel J. Math. 127 (2002), 359–380; arXiv:math/0005066v1 [Text](https://arxiv.org/pdf/math/0005066).
- [ST01] P. Schneider, J. Teitelbaum (with an appendix by D. Prasad), *U(g)-finite locally analytic representations*, Represent. Theory 5 (2001), 111–128; arXiv:math/0005072v1 [Text](https://arxiv.org/pdf/math/0005072v1).
- [EM17] M. Emerton, *Locally analytic vectors in representations of locally p-adic analytic groups*, Mem. Amer. Math. Soc. 248 (2017), no. 1175; author's copy (analytic.pdf), whose printed page numbers equal the PDF page numbers [Text](http://www.math.uchicago.edu/~emerton/pdffiles/analytic.pdf).
- [EMJ1] M. Emerton, *Jacquet modules of locally analytic representations of p-adic reductive groups I. Construction and first properties*, Ann. Sci. École Norm. Sup. (4) 39 (2006), 775–839, version of record from Numdam (printed page = PDF page + 774) [Text](https://www.numdam.org/item/10.1016/j.ansens.2006.08.001.pdf).
- [EMJ2] M. Emerton, *Jacquet modules of locally analytic representations of p-adic reductive groups II. The relation to parabolic induction*, Preprint (2007), author's copy (jacquet-two.pdf), whose printed page numbers equal the PDF page numbers [Text](http://www.math.uchicago.edu/~emerton/pdffiles/jacquet-two.pdf).
- [OS15] S. Orlik, M. Strauch, *On Jordan–Hölder series of some locally analytic representations*, J. Amer. Math. Soc. 28 (2015), 99–157; arXiv:1001.0323, whose printed page numbers equal the PDF page numbers [Text](https://arxiv.org/pdf/1001.0323).
- [OS10] S. Orlik, M. Strauch, *On the irreducibility of locally analytic principal series representations*, Represent. Theory 14 (2010), 713–746; arXiv:math/0612809 [Text](https://arxiv.org/pdf/math/0612809).
- [OR19] S. Orlik, *On some properties of the functors F^G_P from Lie algebra to locally analytic representations*, arXiv:1802.07514v2 (cited by Ding as [54]) [Text](https://arxiv.org/pdf/1802.07514v2).
- [BR16] C. Breuil, *Vers le socle localement analytique pour GL_n I*, Ann. Inst. Fourier 66 (2016), 633–685; author's copy (socleI.pdf), cited by its own page numbers [Text](https://www.imo.universite-paris-saclay.fr/~christophe.breuil/PUBLICATIONS/socleI.pdf).
- [BR15] C. Breuil, *Vers le socle localement analytique pour GL_n II*, Math. Ann. 361 (2015), 741–785; author's copy (socleII.pdf), cited by its own page numbers [Text](https://www.imo.universite-paris-saclay.fr/~christophe.breuil/PUBLICATIONS/socleII.pdf).
- [BR19] C. Breuil, *Ext^1 localement analytique et compatibilité local-global*, Amer. J. Math. 141 (2019), 611–703; author's copy (Ext1.pdf), cited by its own page numbers [Text](https://www.imo.universite-paris-saclay.fr/~christophe.breuil/PUBLICATIONS/Ext1.pdf).
- [SCH11] B. Schraen, *Représentations localement analytiques de GL3(Qp)*, Ann. Sci. École Norm. Sup. (4) 44 (2011), 43–145, version of record from Numdam (printed page = PDF page + 41) [Text](https://www.numdam.org/item/10.24033/asens.2140.pdf).
- [DING25] Y. Ding, *p-adic Hodge parameters in the crystabelline representations of GL_n*, Publ. Math. IHÉS 142 (2025), version of record (74 pp.), whose printed page numbers equal the PDF page numbers; arXiv:2407.21237 compared for §3.1 [Text](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf).
- [DING19] Y. Ding, *Simple L-invariants for GL_n*, Trans. Amer. Math. Soc. 372 (2019), 7993–8042; arXiv:1807.10862v2 (page numbers of the arXiv PDF) [Text](https://arxiv.org/pdf/1807.10862v2).
- [BH20] C. Breuil, F. Herzig, *Towards the finite slope part for GL_n*, Int. Math. Res. Not. IMRN 2020, 10495–10552; arXiv:1806.02695 [Text](https://arxiv.org/pdf/1806.02695).
- [BHS19] C. Breuil, E. Hellmann, B. Schraen, *A local model for the trianguline variety and applications*, Publ. Math. IHÉS 130 (2019), 299–412, version of record from Numdam (printed page = PDF page + 298) [Text](https://www.numdam.org/item/10.1007/s10240-019-00111-y.pdf).
- [DLB17] G. Dospinescu, A.-C. Le Bras, *Revêtements du demi-plan de Drinfeld et correspondance de Langlands p-adique*, Ann. of Math. 186 (2017), 321–411; arXiv:1509.00606v2 (page numbers of the arXiv PDF) [Text](https://arxiv.org/pdf/1509.00606v2).
- [BCGP25] G. Boxer, F. Calegari, T. Gee, V. Pilloni, *Modularity theorems for abelian surfaces*, arXiv:2502.20645v1 (2025); page numbers of the arXiv PDF [Text](https://arxiv.org/pdf/2502.20645v1).
- [RJRC22] J. Rodrigues Jacinto, J. E. Rodríguez Camargo, *Solid locally analytic representations of p-adic Lie groups*, Represent. Theory 26 (2022), 962–1024; arXiv:2110.11916 (page numbers of the arXiv PDF) [Text](https://arxiv.org/pdf/2110.11916).
- [PAN22] L. Pan, *On locally analytic vectors of the completed cohomology of modular curves*, Forum Math. Pi 10 (2022), e7; arXiv:2008.07099v3 (page numbers of the arXiv PDF) [Text](https://arxiv.org/pdf/2008.07099v3).
- [SCHN11] P. Schneider, *p-Adic Lie Groups*, Grundlehren der mathematischen Wissenschaften 344, Springer, 2011 (the maintainer's cleared copy; cited by printed page).
