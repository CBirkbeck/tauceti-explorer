# Completed cohomology and p-adic local–global compatibility over Q, Part II: locally analytic vectors

This roadmap develops Lue Pan's study of the locally analytic vectors in the completed cohomology of modular curves, from his two papers: 'On locally analytic vectors of the completed cohomology of modular curves' (Forum of Mathematics, Pi 10 (2022), e7; here Pan I) and its sequel '… II' (Annals of Mathematics 203 (2026), 121–281; here Pan II). It is a Part II of Completed cohomology and p-adic local–global compatibility over Q (CompletedCohomologyAndLocalGlobalCompatibility, layers R31.1–R31.6), which builds completed cohomology, its Hecke algebra and Emerton's local–global compatibility. This roadmap starts where that one stops: it studies the GL₂(Q_p)-locally analytic vectors of completed cohomology through p-adic Hodge theory on the perfectoid modular curve, and it reproves Emerton's classicality theorem without the p-adic local Langlands correspondence.

The two papers fit together as follows. Pan I shows that the locally analytic functions on the perfectoid modular curve, pushed forward to the flag variety Fl = P¹ along the Hodge–Tate period map, satisfy a first-order differential equation coming from relative Sen theory; so the horizontal nilpotent subalgebra kills them and the horizontal Cartan subalgebra acts (θ\_h). That action is the Sen operator, and computing n-cohomology weight by weight describes the isotypic parts of H̃¹(K^p, C)^la by overconvergent modular forms, proves classicality in weight one, the Fontaine–Mazur conjecture in the irregular case and Gouvêa's conjecture. Pan II constructs two differential operators on the weight sheaves — d_{k+1} along the modular curve and d̄\_{k+1} along the flag variety — whose composite, the intertwining operator I_k, is Fontaine's operator N up to a nonzero rational scalar. Classicality of de Rham representations then becomes a statement about ker I¹\_k, which is computed stratum by stratum over Fl = P¹(Q_p) ⊔ Ω: on Ω through the supersingular uniformization and the Lubin–Tate–Drinfeld duality (quaternionic forms), on P¹(Q_p) through the rigid cohomology of Igusa curves. The same computation gives geometric descriptions of Π\_ρ^la in the supercuspidal case (Breuil–Strauch) and the principal series case (Berger–Breuil–Emerton), uniformly as H¹ of a de Rham complex on Fl modulo its Hodge filtration.

## Reading the plan

Each layer below states its targets and then lists its nodes: definitions and constructions with their API and unit tests, and theorems with hypotheses, a proof route, acceptance checks and prerequisites. Every node cites the place in Pan I (published pagination) or Pan II (arXiv v1 pagination) where its content is stated or proved, described in our own words. Prerequisites are nodes of this roadmap, nodes of other roadmaps' accepted plans, library declarations at the pinned commits, or layers of other roadmaps with a stated contract (the section 'Supplier contracts'). What other roadmaps own is cited, never restated; where Pan's papers are the source of a statement another roadmap already plans, that roadmap's node is imported by id.

## Conventions

- C = C_p is the completion of an algebraic closure of Q_p (Pan I §3 allows any complete algebraically closed nonarchimedean C of characteristic zero; from §5 on C = C_p with its G_{Q_p}-action).
- K^p ⊂ GL₂(A_f^p) is a neat tame level contained in a principal level-N subgroup, N ≥ 3 prime to p; X_{K^p} is the perfectoid modular curve (with cusps) of infinite level at p over C, and π\_HT: X_{K^p} → Fl = P¹ its Hodge–Tate period map. GL₂(Q_p) acts on Fl on the right through the total space.
- V = Q_p² is the standard representation, normalised so that the étale local system attached to V is the first relative étale cohomology of the universal elliptic curve; the Tate module is V(1) = V\*. The relative Hodge–Tate sequence is 0 → ω^{−1}(1) → V(1) ⊗ O → ω → 0; Hecke-equivariantly the subobject is ∧²D ⊗ ω^{−1}(1).
- Hodge–Tate weights: the p-adic cyclotomic character has Hodge–Tate weight −1 (Pan I p. 4). PadicHodgeTheory R06.2 uses the opposite sign; translate weights by a sign when importing.
- g = gl₂(C) ⊃ b (upper triangular) ⊃ n = C·u₊, h = diagonal, u₊ = (0 1; 0 0), h = diag(1, −1), z = 1. A weight χ = (n₁, n₂) is the character diag(a, d) ↦ n₁a + n₂d; χ(h) = n₁ − n₂. The dot action is w·μ = w(μ + ρ) − ρ, and −w·(−χ) = (n₂ + 1, n₁ − 1).
- e₁, e₂ ∈ H⁰(X_{K^p}, ω\_{K^p}) are the fake Hasse invariants (images of the standard basis), x = e₂/e₁ the coordinate on Fl, ∞ ∈ Fl the zero of e₁ (whose Borel is b), and t the invertible function from the Weil pairing on which GL₂(Q_p) acts by ε\_p∘det.
- O_{K^p} = π\_{HT\*}O; superscripts la, sm, lalg denote GL₂(Q_p)-locally analytic, smooth and locally algebraic sections; O^{la,χ} is the χ-isotypic part for the horizontal Cartan action θ\_h. W·e₁^ae₂^bt^c denotes the twist of a B × G_{Q_p}-module by the characters e₁, e₂ (of B, with their Galois action) and t, as in Pan I Remark 5.2.7.
- Locally analytic vectors are taken for the Q_p-analytic structure of GL₂(Q_p); for a compact p-adic Lie group G with uniform G_0 and G_n = G_0^{p^n}, B^la = colim B^{G_n-an} with the inductive-limit topology.

## Layer overview

| Layer | Title | Source |
| --- | --- | --- |
| [LA.0](#la0) | Relative Sen theory and locally analytic coverings | Pan I §§2–3 |
| [LA.1](#la1) | The perfectoid modular curve, the sheaf O^la and the horizontal Cartan action | Pan I §§4.1–4.2; Pan II §3.1 |
| [LA.2](#la2) | Local structure of O^la and completed cohomology | Pan I §§4.3–4.4, 5.1; Pan II §3.2 |
| [LA.3](#la3) | Geometric Sen theory and the topology of the cohomology | Pan I §5.1; Pan II §§3.3–3.4 |
| [LA.4](#la4) | n-cohomology, overconvergent forms and the μ-isotypic decomposition | Pan I §§5.2–5.4 |
| [LA.5](#la5) | Weight-one classicality and Gouvêa's conjecture | Pan I §6 |
| [LA.6](#la6) | The differential operators d and d̄ and the intertwining operator | Pan II §§4.1–4.3 |
| [LA.7](#la7) | The n-invariants of ker I¹\_k and their finiteness | Pan II §4.4 |
| [LA.8](#la8) | The ordinary stratum: the operators over P¹(Q_p) | Pan II §5.1 |
| [LA.9](#la9) | The supersingular stratum: Lubin–Tate and Drinfeld towers | Pan II §§5.2–5.4 |
| [LA.10](#la10) | Spectral decomposition, de Rham complexes and vanishing cycles | Pan II §§5.5–5.6 |
| [LA.11](#la11) | The intertwining operator is Fontaine's operator | Pan II §6 |
| [LA.12](#la12) | Classicality and the locally analytic vectors of Π\_ρ | Pan II §7 |

## Sources and editions

- **Pan I** — Lue Pan, *On locally analytic vectors of the completed cohomology of modular curves*. Forum of Mathematics, Pi 10 (2022), e7, 1–82, open-access version of record, doi:10.1017/fmp.2022.1; page numbers are the printed (= PDF) pages; compared with arXiv:2008.07099v3. [https://doi.org/10.1017/fmp.2022.1](https://doi.org/10.1017/fmp.2022.1) (SHA-256 `61549f3aa31342994049b2d4780009f722c96b6331d0db6dd5bede0453bc293e`, read 2026-10-18).
- **Pan II** — Lue Pan, *On locally analytic vectors of the completed cohomology of modular curves II*. Annals of Mathematics 203 (2026), no. 1, 121–281 (doi:10.4007/annals.2026.203.1.3, not obtained); read in arXiv:2209.06366v1 (14 September 2022), the only arXiv version; all locators are its labels and pages. [https://arxiv.org/abs/2209.06366v1](https://arxiv.org/abs/2209.06366v1) (SHA-256 `0873b61a758c57a9c5567f8e9ed7d905adcb7b359013a24e680facd1027b31b4`, read 2026-10-18).

Pan II's locators are the labels and pages of arXiv v1; the Annals version (161 pages) was not obtained and its numbering may differ (see Gaps). Pan I's locators are the pages of the open-access version of record, where printed page = PDF page; arXiv:2008.07099v3 numbers its statements identically with pages offset by up to six.

### Corrections used here

The reviewed extraction PAPER-PAN-26 records the mistakes of Pan II; the nodes use the corrected forms. One further misprint, in Pan I, was found while writing this plan and is recorded in the packet's source issues.

| Where | Correction used here | Record |
| --- | --- | --- |
| Pan II Theorem 5.3.8, p. 65 | the coefficients in the norm bound are the c_{i,j,k} of the expansion (printed d_{i,j,k}) | PAPER-PAN-26/E1 |
| Pan II Theorem 5.3.17(1), p. 67 | d̄^{k+1}\_Dr is linear over the D_p^×-smooth sections (printed subscript LT) | PAPER-PAN-26/E2 |
| Pan II Theorem 5.2.6, footnote 3, p. 58 | the plan follows the complete proof by reduction to modular curves, not the Higgs-field argument that rests on a deferred compatibility | PAPER-PAN-26/E3 |
| Pan II Proposition 6.1.20, Corollary 6.1.21, pp. 91–92 | read with B⁺\_dR/(t^{k+1}) (printed B⁺\_dR/(t^k)) | PAPER-PAN-26/E4 |
| Pan II §4.2.3, p. 38 | the Hecke-equivariant subobject of the Hodge–Tate sequence is gr⁰D ⊗ ω^{−1} = ∧²D ⊗ ω^{−1} | PerfectoidShimuraVarieties E25 |
| Pan I Theorem 5.4.2(1), p. 64 | N_{k,w} ≅ M†\_{2−k} unless k = 2 (printed 'unless k ≠ 2') | LocallyAnalyticCompletedCohomology/E1 (new) |

## Baseline

Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174, Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Neither library has perfectoid spaces in the generality used here, adic or pro-étale period sheaves, locally analytic vectors of p-adic Lie group representations, modular curves as adic spaces, Hodge–Tate period maps, overconvergent modular forms, Lubin–Tate or Drinfeld towers, or rigid cohomology; these are targets of the supplier roadmaps named in each layer. The current TauCetiRoadmap main and Tau Ceti library were searched as well: none of their roadmaps plans locally analytic vectors, completed cohomology or perfectoid Shimura varieties; RepresentationTheory/LieHighestWeight (Harish-Chandra isomorphism, layer 7) and SmoothRepresentationsOfLocalGroups (smooth induction, SR.2) are cited where used. The declarations below were read in their source files at the pinned commits.

- `mathlib:cyclotomicCharacter` (Mathlib/NumberTheory/Cyclotomic/CyclotomicCharacter.lean): The p-adic cyclotomic character (L ≃+\* L) →\* Z_p^× of a field with all p-power roots of unity; G_{Q_p} acts on t, e₁, e₂ through it, and the Sen operator of C(j) is j.
- `mathlib:Matrix.GeneralLinearGroup` (Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean): GL(n, R) as the units of the matrix ring; GL_2(Q_p) = GeneralLinearGroup (Fin 2) ℚ\_[p] acting on the perfectoid modular curve and on V = Q_p².
- `mathlib:Matrix.trace` (Mathlib/LinearAlgebra/Matrix/Trace.lean): The trace of a square matrix; the Lie algebra of GL_2(Q_p) acts on t by X·t = tr(X)t.
- `mathlib:IsCompactOperator` (Mathlib/Analysis/Normed/Operator/Compact/Basic.lean): A map is compact if some neighbourhood of 0 maps into a compact set; over a finite extension K of Q_p (locally compact) this agrees with Schneider's compact operators between K-Banach spaces used for the decompleted K-forms (not over C, which is not locally compact).
- `mathlib:ModularForm` (Mathlib/NumberTheory/ModularForms/Basic.lean): Complex holomorphic modular forms of weight k for a subgroup Γ of SL_2(ℤ); after C ≅ ℂ and GAGA, the classical forms M_k(K^pK_p) at finite level.
- `mathlib:Polynomial.derivative` (Mathlib/Algebra/Polynomial/Derivative.lean): The formal derivative of polynomials, a linear map R[X] → R[X]; on the n-finite part the operator d̄\_{k+1} is a multiple of the (k + 1)-st derivative in x.

## Supplier contracts

Each line is a layer of another roadmap that this plan cites as a prerequisite, with the exact statement needed. Node-level imports (prerequisites that are nodes of other accepted plans) are listed in the nodes themselves.

- **AlgebraicModularFormsAndSerreWeights:R15.1** (for LA.4/smooth-automorphic-sheaves): Coherent cohomology of the compactified modular curves with automorphic coefficients: for K = K^pK_p and k ∈ Z, the finite-dimensional spaces H^i(X_{K,C}, ω^k) (i = 0, 1), their GAGA comparison with the complex-analytic spaces of modular forms, their GL_2(A_f)-equivariant transition maps in K and the prime-to-p Hecke action (Pan I §1, p. 3, and Lemma 5.3.5, p. 60).
- **CompletedCohomologyAndLocalGlobalCompatibility:R31.1** (for LA.2/completed-cohomology-as-perfectoid-cohomology): R31.1 specialises completed cohomology to modular curves: for a tame level K^p, H̃^i(K^p, Z_p) = lim_n colim_{K_p} H^i(Y_{K^pK_p}(C), Z/p^n) with its continuous admissible GL_2(Q_p)- and Hecke actions, vanishing for i ≥ 2, unchanged when Y is replaced by the compactified curves (Pan I §4.4.1, pp. 43–44), and with O_C- and C-coefficient versions H̃^i(K^p, O_C) = H̃^i(K^p, Z_p) ⊗̂ O_C, H̃^i(K^p, C) (Pan I p. 45).
- **CompletedCohomologyAndLocalGlobalCompatibility:R31.3** (for LA.12/multiplicity-space-pi-rho, LA.5/pro-modular-representations): The big Hecke algebra of completed cohomology of modular curves and its Galois determinant: for a tame level K^p = K_SK^S with K^S hyperspecial outside a finite set S ∋ p, T(K^p) = lim_{K_p} image of Z_p[GL_2(A_f^S)//K^S] in End H¹(Y_{K^pK_p}(C), Z_p), independent of S; a two-dimensional determinant D_S of G_{Q,S} valued in T(K^p); for λ: T(K^p) → Q̄\_p the semisimple odd ρ\_λ: G_{Q,S} → GL_2(Q̄\_p) with det = λ∘D_S and tr ρ\_λ(Frob_l) = λ(T_l)l^{−1} for l ∉ S (Frob_l geometric); and the Eichler–Shimura relation giving H̃¹(K^p, Q̄\_p)[p_λ] = ρ\_λ(−1) ⊗ Hom_{G_Q}(ρ\_λ(−1), H̃¹(K^p, Q̄\_p)) for irreducible ρ\_λ (Pan I §6.1.1, pp. 67–68; Pan II §7.1.4, pp. 116–117).
- **CompletedCohomologyAndLocalGlobalCompatibility:R31.4** (for LA.12/principal-series-description, LA.12/special-case-claim, LA.12/supercuspidal-description, LA.5/local-global-compatibility-at-eisenstein-ideals): Emerton's p-adic local–global compatibility for completed H¹ of modular curves, in the form Pan uses: H̃¹(K^p, Q̄\_p)[p_λ] is described through the p-adic local Langlands correspondence Π(ρ|G_{Q_p}) (Pan I §6.3, Pan II Remarks 7.3.6, 7.3.9, 7.3.11), and the weak form needed after localising at a possibly Eisenstein maximal ideal (Pan I Theorem 6.3.5, Corollary 6.3.6).
- **CompletedCohomologyAndLocalGlobalCompatibility:R31.6** (for LA.5/irregular-fontaine-mazur): Emerton's promodularity theorem: for p > 2 and a continuous irreducible odd ρ: G_Q → GL_2(Q̄\_p) unramified outside finitely many primes, with ρ̄|G_{Q(μ\_p)} irreducible and (ρ̄|G_{Q_p})^{ss} irreducible or η₁ ⊕ η₂ with η₁/η₂ ≠ 1, ω^{±1}, ρ is pro-modular (Emerton 2011, Theorem 1.2.3; Pan I Theorem 6.4.8).
- **LocallyAnalyticDistributions:L0** (for LA.0/acyclicity-for-covers-by-small-opens, LA.0/acyclicity-of-locally-analytic-vectors, LA.0/differential-equation, LA.0/locally-analytic-covering, LA.0/relative-sen-operator, LA.1/locally-analytic-sheaf, LA.1/modular-coverings-are-locally-analytic, LA.2/locally-analytic-completed-cohomology, LA.2/power-series-expansion, LA.3/banach-sen-operator, LA.3/cohomology-is-hausdorff-lb, LA.3/lb-topology-on-cohomology, LA.5/infinitesimal-character-of-eigenspaces, LA.8/cokernel-of-d-on-rational-points): Locally analytic vectors of representations, at the generality of Pan I §2 and Pan II §2 (the owner named by the extraction PAPER-PAN-26, route 11, is the proposed roadmap LocallyAnalyticRepresentationsOfLocalGroups, whose design has not run; L0 is the existing layer that already supplies the locally convex foundations and is named by CompletedCohomologyPartII CC.6 as the owner of the derived locally-analytic functor): for a compact p-adic Lie group G with a uniform open subgroup G_0 and G_n = G_0^{p^n}, the Banach space C^an(G_n, B) of B-valued analytic functions with its norm, the G_n-analytic vectors B^{G_n-an} of a Q_p-Banach representation B and B^la = colim_n B^{G_n-an} with the inductive-limit topology (Pan I Definition 2.1.6, p. 11), the Lie-algebra action and its bound (Pan I Lemmas 2.1.5 and 2.1.8), R^iLA(B) = colim_n H^i_cont(G_n, B ⊗̂ C^an(G_n, Q_p)), LA-acyclicity and strong LA-acyclicity (Pan I Definition 2.2.1, pp. 11–12), the long exact sequence and the two acyclicity transfers of Pan I Lemma 2.2.2, strong LA-acyclicity of admissible Banach representations and of their completed tensor products with trivial Banach spaces (Pan I Theorem 2.2.3 and Corollary 2.2.4, pp. 12–13); and for Hausdorff LB-space representations the locally analytic vectors and the criteria of Pan II §2 (Proposition 2.1.5, Proposition 2.2.3, Corollary 2.2.4, Lemma 2.2.5, Proposition 2.3.3, Corollary 2.3.4, Proposition 2.3.6, pp. 12–17). Locally analytic induction from the Borel B ⊂ GL_2(Q_p) of a Hausdorff LB-space representation on which B acts locally analytically, as a GL_2(Q_p)-equivariant sheaf on P¹(Q_p) with global sections the induced representation (Pan II §5.1.10, p. 55; the extraction PAPER-PAN-26 routes this to the proposed LocallyAnalyticRepresentationsOfLocalGroups).
- **PadicHodgeTheory:P8** (for LA.11/p-adic-legendre-relation): Scholze's comparison of the two B⁺\_dR-lattices (Proposition 7.9 of 'p-adic Hodge theory for rigid-analytic varieties'), in its logarithmic form on the modular curve: V̂\_log ⊗ B⁺\_dR ⊇ (D_dR,log ⊗ OB⁺\_dR,log)^{∇=0} ⊇ V̂\_log ⊗ ker θ, and the resulting inclusion of the determinant of the de Rham bundle into t times the determinant of V (Pan I (4.1.2), Pan II §§6.4.1–6.4.2 and the proof of Lemma 6.4.6; extraction item /567, routed to the PadicHodgeTheory Part II).
- **PadicHodgeTheory:R06.2** (for LA.11/sheaf-fontaine-operator): Part II (PadicHodgeTheoryPartII; its design DESIGN-PadicHodgeTheoryPartII has not run, and the extraction PAPER-PAN-26 route 12 proposing it has no review verdict yet): Fontaine's almost de Rham theory in the generality of Pan II §6.1 — Banach B⁺\_dR/(t^k)-modules W with continuous semilinear G_K-action, flatness and graded pieces W_i = W_0(i) (§6.1.2); the decompletion W ↦ W^K and Fontaine's generalisation of Sen theory (Proposition 6.1.5, Lemmas 6.1.6–6.1.7); kernels and cokernels of strict maps (Proposition 6.1.8); Hodge–Tate modules of weights 0, l (Definition 6.1.9, §6.1.10, Lemma 6.1.11); the Fontaine operator N_W: W_{0,0} → W_{0,−k}(k) of a flat Hodge–Tate B⁺\_dR/(t^{k+1})-module of weights 0, k from the action of Lie Gal(K_∞/K) on the generalised 0-eigenspace E_0(W^K) (§6.1.12, Definition 6.1.13, Remark 6.1.14); N_W = 0 iff V is de Rham for W = V ⊗ B⁺\_dR/(t^{k+1}) (Theorem 6.1.16, Fontaine); the LB-module versions (§6.1.17, Proposition 6.1.18, §6.1.19) and exactness with compatibility of Fontaine operators (Proposition 6.1.20, Corollary 6.1.21, read with B⁺\_dR/(t^{k+1}) — the printed B⁺\_dR/(t^k) is the misprint E4 of the extraction). PadicHodgeTheory already owns Fontaine's classification of B_dR-representations (P7/fontaine-bdr-indecomposable-classification) and almost C-representations (R06.2); the request is for the Banach and LB extension and the operator N_W.
- **PadicLocalLanglandsForGL2Qp:R30.4** (for LA.12/principal-series-description, LA.12/special-case-claim, LA.5/local-global-compatibility-at-eisenstein-ideals, LA.5/up-eigenvector-from-kirillov-model): Colmez's Kirillov model for the locally analytic vectors of Π(V): for a two-dimensional E-representation V of G_{Q_p}, a P-equivariant embedding C_c(Q_p^×, D⁻\_dif(V))^Γ → Π(V)^la_E, P the mirabolic subgroup (Colmez 2010, Chapitre VI; Pan I Theorem 6.4.3), and the bijection between two-dimensional absolutely irreducible E-representations of G_{Q_p} and nonordinary admissible unitary E-Banach representations of GL_2(Q_p) (Colmez–Dospinescu–Paškūnas, Theorem 1.1; Pan I p. 73). For the comparisons of Pan II Remarks 7.3.6, 7.3.9 and 7.3.11 only: the locally analytic vectors of Π(V) for V two-dimensional absolutely irreducible — Π(V)^la ⊗̂ C = Ind_B^{GL_2(Q_p)} D_cris(V)/π\_p in the crystalline principal series case and Emerton's conjectured structure in the semistable special case (Liu–Xie–Zhang 2012, Colmez 2014; extraction item /565), and Breuil's locally analytic representation Σ(2, L) attached to an L-invariant (Breuil 2004, §§2–3; item /566).
- **PadicLocalLanglandsForGL2Qp:R30.6** (for LA.12/supercuspidal-description, LA.5/local-global-compatibility-at-eisenstein-ideals): Paškūnas's and Paškūnas–Tung's results on blocks of locally admissible representations of GL_2(Q_p) with a central character: the finite map from the pseudodeformation ring R^{ps,ζε\_p}\_{ρ̄\_𝔅} to the Bernstein centre Z_𝔅 compatible with Colmez's functor, and the faithful exact functor m to R^{ps}-modules sending admissible representations to finitely generated modules (Pan I Theorem 6.3.3, quoting Paškūnas–Tung, Theorem 1.2). For the comparison of Pan II Remark 7.3.6 only: the Breuil–Strauch conjecture as proved by Dospinescu–Le Bras (Annals 2017, Théorème 1.4), describing Π(ρ\_p)^la for de Rham ρ\_p of Hodge–Tate weights 0, 1 with supercuspidal π\_p through the compactly supported cohomology of the Drinfeld tower.
- **PerfectoidShimuraVarieties:S5** (for LA.9/kernel-on-omega-is-quaternionic): The supersingular uniformization of the perfectoid modular curve at infinite level (the extraction PAPER-PAN-26, route 3, accepted, names S3/S5 as its owner, but the accepted packet has no node for it): with E₀ supersingular over F̄\_p, D = End(E₀) ⊗ Q (ramified at p and ∞, D ⊗ Q_p = D_p) and K^p viewed in (D ⊗ A_f^p)^× via a fixed trivialisation of H¹\_ét(E₀, A_f^p), a GL_2(Q_p)-equivariant isomorphism, functorial in K^p, π\_HT^{-1}(Ω) ≅ D^×\\(M_{LT,∞} × (D ⊗ A_f^p)^×/K^p) identifying π\_HT with π\_{LT,HT} and ω\_{K^p}|Ω with the pull-back of ω\_LT, D^× acting through the main involution (Pan II Theorem 5.4.2, from Scholze 2015 Lemma III.3.6 and Rapoport–Zink); and its consequence that π\_HT^{-1}(Ω) is a finite disjoint union of copies of the height-zero Lubin–Tate space M^{(0)}\_{LT,∞}, GL_2(Q_p)⁰-equivariantly (Pan II Lemma 5.4.4).
- **tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-7-the-center-of-ul-harish-chandra-freudenthal-and-serres-relations** (for LA.1/flag-variety-lie-algebra-bundles, LA.1/horizontal-cartan-action, LA.6/operator-dbar): Existing Tau Ceti layer, cited as it stands: the centre Z(U(g)) and the Harish-Chandra isomorphism Z(U(g)) ≅ S(h)^{W·} with the dot action w·μ = w(μ + ρ) − ρ, for g = gl_2 and sl_2 over C (Pan I §4.2.6, p. 37).

### What other roadmaps own

- Completed cohomology, its admissibility, the big Hecke algebra and Emerton's local–global compatibility: CompletedCohomologyAndLocalGlobalCompatibility R31.1–R31.6 and CompletedCohomologyPartII CC.0–CC.8.
- The perfectoid modular curve, the Hodge–Tate period map, ω = π\_HT\*O(1), the Hecke-equivariant Hodge–Tate sequence and the affinoid basis 𝔅: PerfectoidShimuraVarieties S1, S3, S5.
- The pro-Kummer-étale site, the log period sheaves OB⁺\_dR,log with connection, Poincaré lemma, log Faltings extension and log Riemann–Hilbert: HodgeTateAndCanonicalSubgroups T6:log-sites and T6:comparison.
- Period rings B⁺\_dR, t, Tate–Sen theory, Sen's operator for finite-dimensional representations and Fontaine's classification of B_dR-representations: PadicHodgeTheory R06.1, R06.2, P7, P8. Fontaine's almost de Rham theory for Banach and LB modules is requested from its Part II.
- The Lubin–Tate and Drinfeld towers at infinite level, their period maps and duality, Gross–Hopkins vector fields, and the coincidence of GL₂- and D_p^×-local analyticity with the exchange of d and d̄ (Pan II Corollary 5.3.9, Theorem 5.3.20): EndoscopicTransferAndUnitaryTraceComparison ET.6a.
- Graded locally analytic decompletion of period sheaves and the comparison of completed cohomology with period-sheaf cohomology (Pan II Proposition 6.3.9, Proposition 7.2.3, Lemmas 7.2.4–7.2.6): CohomologyComparisons CP.6.
- Rigid cohomology of Igusa curves with Sym^k coefficients, its finiteness and the log-rigid comparison: PadicDifferentialEquationsAndRigidCohomology RD.4, RD.5.
- Quaternionic forms and Jacquet–Langlands, local Langlands for GL₂: GL2AutomorphicRepresentationsAndTransfer R16.3, R17.1, R17.3. Smooth induction as a sheaf on H\\G: SmoothRepresentationsOfLocalGroups SR.2.
- The de Rham bundle, its canonical extension and Kodaira–Spencer: AbelianSchemesAndArithmeticModuli A4, AutomorphicBundles B3, AlgebraicModularFormsAndSerreWeights R15.1.
- Colmez's functor, Kirillov model, Paškūnas–Tung blocks and the descriptions of Π(V)^la (Liu–Xie–Zhang, Colmez, Dospinescu–Le Bras, Breuil's Σ(2, L)): PadicLocalLanglandsForGL2Qp R30.3–R30.6. These are used only in Pan I §6 and in the comparisons of Pan II Remarks 7.3.6–7.3.11, never in the proof of the classicality theorem.
- Locally analytic vectors of Banach and LB representations and R^iLA: requested at LocallyAnalyticDistributions L0 pending the design of LocallyAnalyticRepresentationsOfLocalGroups.

<a id="la0"></a>

## LA.0. Relative Sen theory and locally analytic coverings

For a log G-Galois pro-étale perfectoid covering X̃ = Spa(B, B⁺) of a small smooth affinoid curve X over C (G a compact p-adic Lie group, p-power ramification along at most one point), base change the Kummer tower of a chart X → T¹ or B¹, prove that the result satisfies the Berger–Colmez Tate–Sen conditions, construct the relative Sen operator φ\_V on B_∞ ⊗ V for finite-dimensional V, and deduce the differential equation: an element θ ∈ B ⊗ Lie(G), canonical up to A^×, functorial in (G, X̃), annihilating the locally analytic vectors B^la (Pan I Theorem 3.1.2). Define locally analytic coverings through Faltings's extension (FE) (Pan I Definition 3.5.4), prove θ ≠ 0 for them, and prove that R^iLA(B) = 0 for i ≥ 1 exactly for locally analytic coverings, with strong LA-acyclicity, and its Čech version on non-small affinoids (Pan I Theorem 3.6.1, Corollary 3.6.10). The general theory of locally analytic vectors and of R^iLA is imported.

**Depends on.** HodgeTateAndCanonicalSubgroups:T6:comparison, HodgeTateAndCanonicalSubgroups:T6:log-sites, LocallyAnalyticDistributions:L0, PadicHodgeTheory:P7, PadicHodgeTheory:R06.1, PerfectoidSpaces:P3, PerfectoidSpaces:P7.

### LA.0/log-galois-perfectoid-covering — Log G-Galois pro-étale perfectoid coverings of a small affinoid curve

*Definition.*

**Statement.** Let C be a complete algebraically closed nonarchimedean field of characteristic zero whose norm restricts to the p-adic norm, X = Spa(A, A⁺) a one-dimensional smooth affinoid adic space over Spa(C, O_C) and G a compact p-adic Lie group. A log G-Galois pro-étale perfectoid covering of X is an affinoid perfectoid X̃ = Spa(B, B⁺) over C together with a finite set S of classical points of X and an inverse system (X_i)\_{i∈I} of finite Galois coverings X_i = Spa(B_i, B_i⁺) → X unramified outside S, such that X̃ ~ lim X_i in Scholze's sense, B⁺ is the p-adic completion of colim B_i⁺, and lim Gal(X_i/X) = G; when S is nonempty, the ramification index of X_i → X at each point of S is a power of p and these indices are unbounded in i. The affinoid X is small when S has at most one element and there is an étale map X → T¹ = Spa(C⟨T^{±1}⟩, O_C⟨T^{±1}⟩) (if S is empty) or X → B¹ = Spa(C⟨T⟩, O_C⟨T⟩) sending S to 0 (otherwise) that factors as a composite of rational embeddings and finite étale maps. G acts continuously on the Banach algebra B, so B is a Q_p-Banach representation of G.

**Hypotheses.**
- C is complete and algebraically closed of characteristic zero, with |p| = 1/p.
- X is smooth of dimension one over Spa(C, O_C); the étale map to T¹ or B¹ is part of the data of smallness.

**Construction or proof.**
- Form the inverse system and its tilde-limit; the perfectoid condition is on the completed colimit B⁺, not on any finite level.
- Record G as the inverse limit of the finite Galois groups, with its profinite topology and p-adic Lie structure.
- Record smallness as the existence of the chart X → T¹ or B¹; the construction of the element θ depends on that chart only up to a unit of A (LA.0/differential-equation).

**Uses.**
- Pan I Theorem 3.1.2, p. 14: the input of the differential equation theorem.
- Pan I §4.2, p. 33: the preimage in the perfectoid modular curve of a small affinoid of finite-level modular curve containing at most one cusp.
- Pan II §5.2.5 and §5.3.5, pp. 57 and 63: the Lubin–Tate and Drinfeld towers at infinite level over small affinoids.

**API.**
- `LogGaloisPerfectoidCovering` (structure): The data (X, G, S, (X_i), X̃) with the tilde-limit and Galois-group identification.
- `LogGaloisPerfectoidCovering.banach` (projection): The Q_p-Banach representation B = O(X̃) of G, with unit ball B⁺ = completed colim B_i⁺.
- `LogGaloisPerfectoidCovering.quotient` (functoriality): For a closed normal subgroup H of G with X̃^H = Spa(B^H, (B⁺)^H) again a covering, the quotient covering with group G/H.
- `LogGaloisPerfectoidCovering.restrict` (functoriality): Restriction to a rational open subset of X (which is again small for the restricted chart) and to an open subgroup of G (the covering of X_{G_0} = Spa(B^{G_0}, (B⁺)^{G_0})).
- `SmallAffinoidCurve.chart` (data): The étale chart f₁: X → T¹ or B¹ through rational embeddings and finite étale maps, sending S to 0.

**Unit tests.**
- `LogGaloisPerfectoidCovering.torus_example` (computation): For X = T¹ and X̃ = Spa(C⟨T^{±1/p^∞}⟩, O_C⟨T^{±1/p^∞}⟩) with Z_p acting through a compatible system of p-power roots of unity, the data form a covering with S empty and G ≅ Z_p, and the G-locally analytic vectors of B are the smooth vectors ∪\_m C⟨T^{±1/p^m}⟩ (Pan I Example 3.1.6).
- `LogGaloisPerfectoidCovering.disc_example` (computation): For X = B¹ with S = {0} and X̃ = Spa(C⟨T^{1/p^∞}⟩, O_C⟨T^{1/p^∞}⟩), the ramification index at 0 of the m-th level is p^m, unbounded, so the data form a covering.
- `LogGaloisPerfectoidCovering.trivial_group` (degenerate): If G is trivial then X̃ = X, which is perfectoid only if X is; a smooth affinoid curve over C is not perfectoid, so G is never trivial.
- `LogGaloisPerfectoidCovering.bounded_ramification_excluded` (non-example): A tower of Kummer coverings of B¹ of bounded ramification index at 0 is not an instance: its completed colimit is not perfectoid and the unboundedness hypothesis fails.

**Acceptance.**
- Pan I Example 3.1.6 (the torus with all p-power roots of T, G ≅ Z_p) is an instance with S empty.
- A finite Galois covering with bounded ramification at a point of S is not an instance.

**Prerequisites.** PerfectoidSpaces:P7/tilde-limit-perfectoid-uniqueness; HodgeTateAndCanonicalSubgroups:T6:log-sites/pro-kummer-etale-site.

**Source.** Pan I, §3.1.1, p. 13: The setup: a smooth affinoid curve over C, a compact p-adic Lie group G and a 'log G-Galois pro-étale perfectoid covering' with ramification of p-power order along a finite set S; the smallness condition through an étale chart to the torus or the disc.

### LA.0/tate-sen-for-the-kummer-tower — The Kummer tower satisfies the Tate–Sen conditions

*Theorem.*

**Statement.** Let X̃ = Spa(B, B⁺) → X be a log G-Galois pro-étale perfectoid covering of a small affinoid curve, with chart f₁: X → Y ∈ {T¹, B¹}. Let Y_n = Spa(C⟨T^{±1/p^n}⟩) (resp. Spa(C⟨T^{1/p^n}⟩)), Y_∞ their completed limit with Galois group Γ ≅ Z_p, and X_n = X ×\_Y Y_n, X_∞ = X ×\_Y Y_∞, X̃\_∞ = Spa(B_∞, B_∞⁺) the completed colimit of the normalised fibre products X_{G_0,n}. Then: (1) the completed tensor product of A_n⁺ with R⁺ over R_n⁺ injects into A_∞⁺ with cokernel killed by p^{C_n}, C_n → 0, and (A_∞, A_∞⁺) is perfectoid; (2) Tate's normalised traces tr_{X,m}: A_∞ → A_m are continuous A_m-linear Γ-equivariant left inverses with tr_{X,m}(x) → x, and for a generator γ of p^mΓ the operator γ − 1 is invertible on ker(tr_{X,m}) with inverse of norm at most p^{c_m}, c_m → 0; (3) the p^nΓ-analytic vectors of A_∞ are A_n; (4) B_∞ satisfies the Tate–Sen conditions of Berger–Colmez for the group G × Γ with H_0 = G, Λ\_{H,n} = B_{H,n} and R_{H,n} the normalised traces, with arbitrarily small constants; (5) (B_∞)^Γ = B.

**Hypotheses.**
- X̃ → X is a log G-Galois pro-étale perfectoid covering of a small affinoid curve with a fixed chart f₁.

**Construction or proof.**
- (1) is Scholze's Lemma 4.5 of 'p-adic Hodge theory for rigid-analytic varieties' applied along the rational embeddings and finite étale maps of f₁ (Pan I Lemma 3.2.3).
- The traces on the standard tower send T^{l/p^k} ((l, p) = 1) to p^{n−m}T^{l/p^k} for k ≤ m and to 0 otherwise; normalise and base change along f₁ (Pan I §3.2.1–3.2.2).
- (3): apply the trace to an analytic vector; the action of p^nΓ on A_m factors through the finite quotient, so analyticity forces invariance (Pan I Lemma 3.2.5).
- By the rigid Abhyankar lemma X_{G_0,n} → Y_n is unramified for n large, so the finite levels are finite étale and the traces extend; almost purity gives (TS1) (Pan I §3.2.6 and Proposition 3.2.7).
- (5) follows from almost purity applied to the Γ-covering X̃\_∞ → X̃ (Pan I Lemma 3.2.9).

**Acceptance.**
- For X = T¹ and G trivialised to the Kummer tower itself, (3) recovers the statement that the Γ-locally analytic vectors in C⟨T^{±1/p^∞}⟩ are the smooth vectors.

**Prerequisites.** LA.0/log-galois-perfectoid-covering; PadicHodgeTheory:R06.1/tate-sen-axioms-cyclotomic; PerfectoidSpaces:P3/almost-purity-theorem; HodgeTateAndCanonicalSubgroups:T6:log-sites/rigid-abhyankar; HodgeTateAndCanonicalSubgroups:T6:log-sites/log-perfectoid-almost-acyclicity.

**Source.** Pan I, §3.2.1–3.2.2, Lemma 3.2.3, Lemma 3.2.5, §3.2.6, Proposition 3.2.7, Lemma 3.2.9, pp. 15–18: Construction of the base-changed Kummer tower, its normalised traces, the identification of analytic vectors with finite levels, the Tate–Sen conditions for G × Γ and the invariants (B_∞)^Γ = B.

### LA.0/relative-sen-operator — The relative Sen operator φ\_V

*Construction.*

**Statement.** In the situation of LA.0/tate-sen-for-the-kummer-tower, for every finite-dimensional continuous representation V of G over Q_p there is a unique B_∞-linear action φ\_V: Lie(Γ) → End_{B_∞}(B_∞ ⊗\_{Q_p} V) extending the natural action of Lie(Γ) on the G-smooth, Γ-locally analytic vectors of B_∞ ⊗ V. It commutes with G × Γ, is functorial in V and satisfies φ\_{V₁⊗V₂} = φ\_{V₁} ⊗ 1 + 1 ⊗ φ\_{V₂}; it depends only on the restriction of V to an open subgroup of G and descends to a B-linear action on (B_∞ ⊗ V)^Γ = B ⊗ V. Construction: for a G-stable lattice T ⊂ V and G_0 acting trivially on T/pT, the Tate–Sen decompletion gives for n ≥ n(G_0) a unique free B⁺\_{G_0,n}-submodule D⁺\_{G_0,n}(T) of (B_∞)° ⊗ T of rank dim V, fixed by G_0, G × Γ-stable, spanning after base change, with a basis moved by Γ − 1 into p^cD⁺ (c < 1/2); then (γ − 1)^m D⁺ ⊂ pD⁺ for m large, so p^{m′}Γ acts analytically on D⁺ ⊗ Q_p for m′ large by Amice's criterion, and φ\_V is the B_∞-linear extension of the derived action.

**Hypotheses.**
- V is a finite-dimensional continuous Q_p-representation of the compact p-adic Lie group G.
- The chart f₁ is fixed; a change of chart rescales the result by a unit of A (LA.0/differential-equation).

**Construction or proof.**
- Apply Berger–Colmez's decompletion (BC08 Proposition 3.3.1) to (B_∞)° ⊗ T with constants c₁, c₂, c₃ = c small (Pan I Proposition 3.2.11).
- Use Amice's criterion that (γ − 1)^m(B°) ⊂ pB° makes the action analytic on p^hZ_p (Pan I Example 2.1.9).
- Identify the p^mΓ-analytic vectors of (B_∞ ⊗ V)^{G_0} with B_{G_0,m} ⊗ D⁺ (Pan I Lemma 3.2.12) and extend scalars.
- Check functoriality and the tensor rule on the Γ-locally analytic G-fixed vectors (Pan I Propositions 3.2.13–3.2.14).

**Uses.**
- Pan I §3.3.1, p. 20: applied to the finite-dimensional pieces V_k of C^an(G_0, Q_p) and passed to the limit, it produces the differential operator θ.
- Pan I Theorem 4.2.4, p. 36: computed for the standard representation of K_p ⊂ GL_2(Q_p) on the modular curve, it gives the explicit θ.

**API.**
- `RelativeSen.phi` (data): φ\_V(x) ∈ End_{B_∞}(B_∞ ⊗ V) for x ∈ Lie(Γ).
- `RelativeSen.phi_unique` (characterisation): φ\_V is the unique B_∞-linear action extending the derived Γ-action on G-smooth Γ-analytic vectors.
- `RelativeSen.phi_comm` (compatibility): φ\_V(x) commutes with the semilinear action of every element of G × Γ.
- `RelativeSen.phi_map` (functoriality): For a G-map ψ: V → W, (1 ⊗ ψ) ∘ φ\_V(x) = φ\_W(x) ∘ (1 ⊗ ψ).
- `RelativeSen.phi_tensor` (relation): φ\_{V₁ ⊗ V₂}(x) = φ\_{V₁}(x) ⊗ 1 + 1 ⊗ φ\_{V₂}(x).
- `RelativeSen.phi_restrict` (compatibility): φ\_V depends only on the restriction of V to any open subgroup of G.

**Unit tests.**
- `RelativeSen.phi_trivial` (degenerate): For V the trivial one-dimensional representation, φ\_V = 0.
- `RelativeSen.phi_unipotent` (computation): For G = Γ acting on the base change X̃' = X ×\_{f₂,Y} Y_∞ along a second chart f₂ and V = Q_p² with γ ↦ (1 1; 0 1), φ\_V(log γ) is the matrix (0 a; 0 0) with a ∈ A^× the comparison unit of the two charts (Pan I Lemma 3.4.3).
- `RelativeSen.phi_dual` (compatibility): φ\_{V\*} = −φ\_V^t on B_∞ ⊗ V\*, so the evaluation pairing V ⊗ V\* → Q_p is annihilated.
- `RelativeSen.phi_not_derived_action` (non-example): φ\_V is not the derived action of Γ on B_∞ ⊗ V: on B_∞ itself the derived Γ-action is nonzero on Γ-analytic vectors outside B, while φ\_{trivial} = 0.

**Acceptance.**
- For V the unipotent representation of Γ = G with γ ↦ (1 1; 0 1), φ\_V is multiplication by the element a ∈ A^× comparing two charts (Pan I Lemma 3.4.3).

**Prerequisites.** LA.0/tate-sen-for-the-kummer-tower; PadicHodgeTheory:P7/sen-module; LocallyAnalyticDistributions:L0.

**Source.** Pan I, Proposition 3.2.11, Lemma 3.2.12, Propositions 3.2.13–3.2.14, pp. 18–20: Decompletion of B_∞ ⊗ T by the Tate–Sen formalism and the construction of the Lie(Γ)-action φ\_V, with its uniqueness, commutation, functoriality and tensor compatibility.

### LA.0/differential-equation — Locally analytic vectors satisfy the relative Sen differential equation

*Theorem.* Planet: *Relative Sen differential equation*.

**Statement.** Let X̃ = Spa(B, B⁺) be a log G-Galois pro-étale perfectoid covering of a small affinoid curve X = Spa(A, A⁺) with a fixed chart. There is an element θ = θ\_X̃ ∈ B ⊗\_{Q_p} Lie(G), the image of a generator of Lie(Γ) under a map φ\_X̃: Lie(Γ) → B ⊗ Lie(G), such that: (1) θ annihilates the G-locally analytic vectors B^la, for the B-linear extension of the Lie(G)-action; (2) for a closed normal subgroup H with X̃^H a covering, θ\_X̃ ≡ θ\_{X̃^H} modulo B ⊗ Lie(H); (3) θ ≠ 0 when X̃ is a locally analytic covering (LA.0/theta-nonzero); (4) a different chart changes θ by a unit of A, so A^×θ is intrinsic; (5) for every finite-dimensional V, the Lie(Γ)-action on B_∞ ⊗ V induced by θ through the infinitesimal G-action equals φ\_V; (6) a D ∈ B_∞ ⊗ Lie(G) killing the G × Γ-locally analytic vectors of B_∞ is 0, and a D ∈ B_∞ ⊗ Lie(G × Γ) killing them is a multiple bd with b ∈ B_∞ and d in the image of φ\_{X̃\_∞}.

**Hypotheses.**
- X̃ → X is a log G-Galois pro-étale perfectoid covering of a small affinoid curve; θ is determined only up to A^×.

**Construction or proof.**
- Apply LA.0/relative-sen-operator to the finite-dimensional, two-sided-translation-stable subspaces V_k of C^an(G_0, Q_p) whose union is dense and multiplicative (Pan I Proposition 2.1.3), and pass to the completed limit, obtaining φ\_{G_0} on B_∞ ⊗̂ C^an(G_0, Q_p) (Pan I §3.3.1).
- The multiplicativity of the V_k makes φ\_{G_0}(x) a right-invariant derivation commuting with Γ, hence an element of B ⊗ Lie(G_0) (Pan I Proposition 3.3.3, Corollary 3.3.4, using (B_∞)^Γ = B).
- On B^{G_0-an} = (B_∞ ⊗̂ C^an(G_0))^{G_0 × Γ} the Lie(Γ)-action is trivial, giving (1) (Pan I Corollary 3.3.5).
- Matrix coefficients V ⊗ V\* → C^an(G_0) give (5) (Pan I Corollary 3.3.6); (2) is functoriality of the construction (Corollary 3.3.9); (6) is Proposition 3.3.10 and Corollary 3.3.11.
- For (4), compare the two Γ-cohomology identifications of H¹(G' × Γ, B'\_∞) through the two charts; the discrepancy a ∈ A^× is computed by the unipotent representation (Pan I Lemma 3.4.3, Proposition 3.4.5).

**Acceptance.**
- For X = T¹ and X̃ the Kummer tower with G ≅ Z_p, θ = (dT/T) ⊗ 1, a generator of Lie(G) (Pan I Example 3.1.6).
- On the perfectoid modular curve θ is the explicit matrix of LA.1/theta-on-the-modular-curve.

**Prerequisites.** LA.0/relative-sen-operator; LA.0/log-galois-perfectoid-covering; LocallyAnalyticDistributions:L0.

**Source.** Pan I, Theorem 3.1.2, p. 14; proof in §§3.3–3.4, pp. 20–25: Statement of the differential equation: an element θ of B ⊗ Lie(G) annihilating the locally analytic vectors, functorial in (G, X̃), nonzero for locally analytic coverings, well defined up to A^×; its construction from the Tate–Sen decompletion and its uniqueness. Pan I, Remark 3.1.5 and Remark 3.1.7, pp. 14–15: θ is naturally a log Higgs field in B ⊗\_A Ω¹\_A(S) ⊗ Lie(G)(−1), the Higgs field of the p-adic Simpson correspondence in the Tannakian sense.

### LA.0/locally-analytic-covering — Locally analytic coverings

*Definition.*

**Statement.** Let X̃ → X be a log G-Galois pro-étale perfectoid covering of a small affinoid curve with chart f₁ and Kummer group Γ = Z_pγ. Let V₁ = Q_p² with γ acting by (1 1; 0 1), an extension of Q_p by Q_p. Tensoring with B_∞ and taking Γ-invariants gives a G-equivariant exact sequence (FE) of Banach spaces (exact by almost purity and continuous, hence strict by the open mapping theorem): 0 → B → (B_∞ ⊗ V₁)^Γ → B → 0, whose connecting map B^{G_0} → H¹\_cont(G_0, B) is an isomorphism for every open subgroup G_0; up to a unit of A it is independent of f₁, and when X is defined over a finite extension of Q_p it is the log Faltings extension of X̃, with the quotient identified with B ⊗\_A Ω¹\_A(S). X̃ is a locally analytic covering of X if the following equivalent conditions hold: (1) (FE) stays exact on G_0-analytic vectors for some uniform open G_0; (2) (FE) stays exact on G-locally analytic vectors; (3) there is a G-locally analytic z ∈ B_∞ with γ(z) = z − 1. Equivalently, H¹\_cont(G, B^la) → H¹\_cont(G, B) is an isomorphism.

**Hypotheses.**
- X is small with a fixed chart; the notion does not depend on the chart.

**Construction or proof.**
- Exactness of (FE) is almost purity; the connecting map is computed through H^i_cont(G, B) ≅ H^i_cont(G × Γ, B_∞) ≅ H^i_cont(Γ, A) (Pan I §3.5.1).
- The three conditions all say that 1 ∈ B lifts to a G-locally analytic vector (z, 1) of (B_∞ ⊗ V₁)^Γ (Pan I Proposition 3.5.3).
- The intrinsic reformulation uses Hochschild–Serre for {1} × Γ ⊂ G × Γ and the vanishing of H¹\_cont(G, (B_∞)^la) (Pan I Remark 3.5.5).

**Uses.**
- Pan I Proposition 3.5.6, p. 26: nonvanishing of θ.
- Pan I Theorem 3.6.1, p. 27: the criterion for LA-acyclicity of B.
- Pan I Corollary 4.2.3, p. 35: the modular-curve case.

**API.**
- `IsLocallyAnalyticCovering` (data): The predicate on a log G-Galois pro-étale perfectoid covering of a small affinoid curve.
- `IsLocallyAnalyticCovering.iff_exists_z` (characterisation): X̃ is locally analytic iff some G-locally analytic z ∈ B_∞ satisfies γ(z) = z − 1.
- `IsLocallyAnalyticCovering.iff_H1` (characterisation): X̃ is locally analytic iff H¹\_cont(G, B^la) → H¹\_cont(G, B) is bijective.
- `IsLocallyAnalyticCovering.chart_independent` (compatibility): The predicate does not depend on the chart f₁.
- `FaltingsSequence.connecting_iso` (relation): The connecting map of (FE) on G_0-cohomology is an isomorphism B^{G_0} ≅ H¹\_cont(G_0, B) for every open G_0.

**Unit tests.**
- `IsLocallyAnalyticCovering.kummer` (computation): The Kummer tower X_∞ → X itself (G = Γ) is a locally analytic covering, which is the situation of Berger–Colmez where the condition always holds (Pan I Remark 3.6.9).
- `IsLocallyAnalyticCovering.unramified_finite` (degenerate): If X̃ → X factors through a finite étale cover with G finite, X̃ is not perfectoid; so no finite covering is an instance.
- `IsLocallyAnalyticCovering.modular` (compatibility): The preimage in the perfectoid modular curve of a small affinoid of X_{K^pK_p} whose Hodge–Tate image lies in an affinoid of Fl is a locally analytic covering (Pan I Corollary 4.2.3).
- `IsLocallyAnalyticCovering.not_all` (non-example): For a covering on which φ\_X̃ = 0 there is no z, so φ\_X̃ ≠ 0 is necessary; Pan I Proposition 3.5.6 is the contrapositive.

**Acceptance.**
- The perfectoid modular curve over a small affinoid whose Hodge–Tate image lies in an affinoid of Fl is a locally analytic covering (LA.1/modular-coverings-are-locally-analytic).

**Prerequisites.** LA.0/relative-sen-operator; HodgeTateAndCanonicalSubgroups:T6:comparison/log-faltings-extension; LocallyAnalyticDistributions:L0.

**Source.** Pan I, §3.5.1 with the sequence (FE), Remark 3.5.2, Proposition 3.5.3, Definition 3.5.4, Remark 3.5.5, pp. 25–26: The extension (FE) obtained from the unipotent representation of Γ, its relation with the log Faltings extension, the three equivalent conditions and the definition of a locally analytic covering, with the intrinsic H¹ criterion.

### LA.0/theta-nonzero — The differential operator is nonzero on locally analytic coverings

*Theorem.*

**Statement.** If X̃ → X is a locally analytic covering, then φ\_X̃: Lie(Γ) → B ⊗ Lie(G) is nonzero; equivalently θ\_X̃ ≠ 0.

**Hypotheses.**
- X̃ → X is a locally analytic covering of a small affinoid curve.

**Construction or proof.**
- If φ\_X̃ = 0, Lie(Γ) acts trivially on the Γ-locally analytic vectors of (B_∞)^{G_0-an} for all small G_0 (Pan I Lemma 3.3.2).
- Then no G_0-analytic z with γ(z) = z − 1 exists, contradicting condition (3) of LA.0/locally-analytic-covering (Pan I Proposition 3.5.6).

**Acceptance.**
- For the Kummer tower θ = (dT/T) ⊗ 1 ≠ 0.

**Prerequisites.** LA.0/differential-equation; LA.0/locally-analytic-covering.

**Source.** Pan I, Proposition 3.5.6 with proof, pp. 26–27: Nonvanishing of φ\_X̃ for locally analytic coverings.

### LA.0/acyclicity-of-locally-analytic-vectors — Taking locally analytic vectors of B is exact exactly for locally analytic coverings

*Theorem.*

**Statement.** Let X̃ = Spa(B, B⁺) be a log G-Galois pro-étale perfectoid covering of a small affinoid curve X. Then R^iLA(B) = 0 for all i ≥ 1 if and only if X̃ is a locally analytic covering, and in that case B is strongly LA-acyclic. More precisely H^i_cont(G_0, B ⊗̂ C^an(G_0, Q_p)) ≅ H^i_cont(Γ, (B_∞)^{G_0-an}) functorially in G_0, so these vanish for i ≥ 2, and R¹LA(B) = colim_{n,k} H¹\_cont(Γ, (B_∞)^{(G_n × p^kΓ)-an}).

**Hypotheses.**
- X is small; LA-acyclicity is with respect to the uniform subgroups G_n of G.

**Construction or proof.**
- Tensoring (FE) with C^an(G_n) and taking G_n-cohomology shows that LA-acyclicity forces (FE) to stay exact on locally analytic vectors (Pan I §3.6.2).
- Hochschild–Serre for {1} × Γ and G_0 × {1} in G_0 × Γ, with almost purity, gives the isomorphism of Pan I Lemma 3.6.4; Γ ≅ Z_p has cohomological dimension one.
- Replace (B_∞)^{G_0-an} by its p^kΓ-analytic part using that γ − 1 is invertible on the kernel of the trace (Pan I Lemma 3.6.6).
- Given z with γ(z) = z − 1, approximate it by z_0 at finite level and solve φ\_γ(y) = x by the convergent series −Σ φ\_γ^{(m)}(x)(z − z_0)^{m+1}/(m+1)!; then x ∈ (γ − 1)(…) because φ\_γ = (γ − 1)Σ(−1)^m(γ − 1)^m/(m + 1) (Pan I §3.6.7, Lemma 3.6.8).

**Acceptance.**
- For the Kummer tower, B = A_∞ is strongly LA-acyclic for Γ (Berger–Colmez, Théorème 3.4, as Pan I Remark 3.6.9 notes).

**Prerequisites.** LA.0/locally-analytic-covering; LA.0/tate-sen-for-the-kummer-tower; HodgeTateAndCanonicalSubgroups:T6:log-sites/log-perfectoid-almost-acyclicity; LocallyAnalyticDistributions:L0.

**Source.** Pan I, Theorem 3.6.1 with §§3.6.2–3.6.8, Lemma 3.6.4, Lemma 3.6.6, Lemma 3.6.8, pp. 27–29: The equivalence between vanishing of R^iLA(B) and the locally analytic covering condition, with strong LA-acyclicity, proved by reduction to Γ-cohomology of analytic vectors and an explicit primitive.

### LA.0/acyclicity-for-covers-by-small-opens — Locally analytic sections and Čech cohomology on non-small affinoids

*Theorem.*

**Statement.** Let X̃ = Spa(B, B⁺) → X = Spa(A, A⁺) be a log G-Galois pro-étale perfectoid covering of a (not necessarily small) affinoid curve, and suppose X is covered by small rational opens X_1, …, X_k whose preimages are locally analytic coverings. Let π: X̃ → X, Õ = π\_\*O_X̃, Õ\_n its subsheaf of G_n-analytic sections and Õ^la = colim Õ\_n. Then (1) R^iLA(B) = H^i(X, Õ^la) = Ȟ^i(X, Õ^la) for all i, so B is LA-acyclic iff Ȟ^i(X, Õ^la) = 0 for i ≥ 1; (2) if the Čech systems {Ȟ^i(𝔘\_0, Õ\_n)}\_n are essentially zero for i > 0 (𝔘\_0 = {X_i}), then B is strongly LA-acyclic.

**Hypotheses.**
- X admits a finite cover by small rational opens with locally analytic preimages.

**Construction or proof.**
- Let 𝔅 be the small rational opens contained in some X_i: a basis stable under intersection on which Õ^la has vanishing higher Čech cohomology, because B → C•(𝔘, Õ) is strictly exact (almost acyclicity) with LA-acyclic terms (LA.0/acyclicity-of-locally-analytic-vectors).
- Cartan's criterion (Godement, Corollaire 4, p. 176) then computes H^i by Čech cohomology for the finite cover 𝔘\_0.
- Apply the derived-functor transfer of Pan I Lemma 2.2.2(3) to B → C•(𝔘\_0, Õ) (Pan I Corollary 3.6.10).

**Acceptance.**
- On the perfectoid modular curve this gives the strong LA-acyclicity of O_{K^p}(U) for U ∈ 𝔅 (LA.2/la-acyclicity-on-the-basis).

**Prerequisites.** LA.0/acyclicity-of-locally-analytic-vectors; HodgeTateAndCanonicalSubgroups:T6:log-sites/log-perfectoid-almost-acyclicity; LocallyAnalyticDistributions:L0.

**Source.** Pan I, Corollary 3.6.10 with proof, pp. 29–30: Removal of the smallness hypothesis: R^iLA(B) is the (Čech) cohomology of the locally analytic subsheaf, and strong acyclicity follows from essential vanishing of Čech cohomology of the analytic pieces.

<a id="la1"></a>

## LA.1. The perfectoid modular curve, the sheaf O^la and the horizontal Cartan action

On the perfectoid modular curve X_{K^p} with Hodge–Tate period map π\_HT: X_{K^p} → Fl = P¹, construct the fake Hasse invariants e₁, e₂, the coordinate x = e₂/e₁ and the function t; identify Faltings's extension with the relative Hodge–Tate sequence up to −1 (Pan I Theorem 4.2.2); prove that preimages of small affinoids are locally analytic coverings and compute θ = (x x²; −1 −x) (Pan I Corollary 4.2.3, Theorem 4.2.4). Define O_{K^p} = π\_{HT\*}O and its subsheaves O^la_{K^p} and O^sm_{K^p}, the bundles g⁰ ⊃ b⁰ ⊃ n⁰ on Fl, prove that n⁰ acts trivially on O^la (Pan I Theorem 4.2.7), construct the horizontal Cartan action θ\_h of h = b⁰/n⁰ with its Harish-Chandra compatibility and the weight sheaves O^{la,χ} (Pan I Corollary 4.2.8), and the twists ω^{k,la} with the Hecke-equivariant Hodge–Tate sequence (Pan II §3.1, §4.2.3).

**Depends on.** LA.0, AlgebraicModularFormsAndSerreWeights:R15.1, AutomorphicBundles:B3, HodgeTateAndCanonicalSubgroups:T6:comparison, LocallyAnalyticDistributions:L0, PerfectoidShimuraVarieties:S1, PerfectoidShimuraVarieties:S3, PerfectoidShimuraVarieties:S5, tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-7-the-center-of-ul-harish-chandra-freudenthal-and-serres-relations.

### LA.1/fake-hasse-invariants — The fake Hasse invariants e₁, e₂, the coordinate x and the function t

*Construction.*

**Statement.** Fix a tame level K^p ⊂ GL_2(A_f^p) contained in a level-N subgroup with N ≥ 3 prime to p, and let X_{K^p} be the perfectoid modular curve over C (with cusps, infinite level at p), ω\_{K^p} the pull-back of the Hodge bundle ω from finite level, V = Q_p² the standard representation of GL_2(Q_p) and π\_HT: X_{K^p} → Fl = P¹ the Hodge–Tate period map defined by the position of ω^{-1}\_{K^p}(1) in the relative Hodge–Tate sequence 0 → ω^{-1}\_{K^p}(1) → V(1) ⊗ O_{X_{K^p}} → ω\_{K^p} → 0. After fixing a generator of Z_p(1), the images of the standard basis e₁, e₂ of V are sections e₁, e₂ ∈ H⁰(X_{K^p}, ω\_{K^p}) (the fake Hasse invariants), pulled back from O(1) on Fl; x := e₂/e₁ is the standard coordinate of Fl = P¹. The Weil pairing gives a map X_{K^p} → Isom(Z_p, Z_p(1)) ≅ Z_p^×, hence a function t ∈ H⁰(X_{K^p}, O) well defined up to Z_p^×; G_{Q_p} acts on t, e₁, e₂ through the cyclotomic character, GL_2(Q_p) acts on t through ε\_p ∘ det with ε\_p(x) = x|x|, and GL_2(A_f) acts on t through ε ∘ det. Write u₊ = (0 1; 0 0), h = diag(1, −1), z = diag(1, 1); then u₊ · x = 1, h · e₁ = e₁, u₊ · e₁ = 0, z · t = 2t. For n ≥ 1 fix t_n at level Γ(p^n) with ‖t − t_n‖ ≤ p^{−n}.

**Hypotheses.**
- K^p is neat and contained in the principal level-N subgroup for some N ≥ 3 prime to p.
- Pan's normalisation: the étale local system attached to V is the first relative étale cohomology of the universal elliptic curve, so the Tate module is V(1) = V\*; the cyclotomic character has Hodge–Tate weight −1.

**Construction or proof.**
- The perfectoid curve and its tower are those of PerfectoidShimuraVarieties S5 (Pan I Theorem 4.1.2).
- The relative Hodge–Tate sequence and π\_HT come from Scholze's period map on the anticanonical tower, with the quotient-line description of S3 (Pan I Theorem 4.1.6).
- Evaluate the surjection V(1) ⊗ O → ω on e₁, e₂ ∈ V with the fixed basis of Z_p(1); the GL_2(Q_p)- and Galois-actions are read off from the twist (Pan I §4.2.1, p. 35).
- Construct t from the Weil pairing on each finite level and pass to the limit; compute its transformation laws (Pan I §4.3.1, p. 38).

**Uses.**
- Pan I §4.3.5–4.3.9, pp. 39–41: the expansion variables x − x_n, log(e₁/e_{1,n}), log(t/t_n).
- Pan II Theorem 3.2.2, p. 19: the description of weight-χ sections as t^{n₁}e₁^{n₂−n₁}Σc_i(x − x_n)^i.
- Pan II §6.4, pp. 103–109: the period x̃ lifting x and the Legendre relation.

**API.**
- `ModularCurve.fakeHasse` (data): e₁, e₂ ∈ H⁰(X_{K^p}, ω\_{K^p}), the images of the standard basis of V under V(1) ⊗ O → ω\_{K^p}.
- `ModularCurve.fakeHasse_smul` (functoriality): For g = (a b; c d) ∈ GL_2(Q_p), g\*(e₁, e₂) = (e₁, e₂)·g in the right action of Pan I §4.1.5, so x transforms by a fractional linear map.
- `ModularCurve.tFunction` (data): t ∈ H⁰(X_{K^p}, O)^× with |t| = 1, defined by the Weil pairing up to Z_p^×.
- `ModularCurve.tFunction_smul` (relation): GL_2(Q_p) acts on t by ε\_p ∘ det, GL_2(A_f) by ε ∘ det, and σ ∈ G_{Q_p} by the cyclotomic character; hence (a b; c d) · t = (a + d) t on the Lie algebra.
- `ModularCurve.lie_on_coordinates` (simp): u₊ · x = 1, u₊ · e₁ = 0, h · e₁ = e₁, z · t = 2t.
- `ModularCurve.fakeHasse_generates` (characterisation): e₁ generates ω\_{K^p} on π\_HT^{-1}(U) for U ⊂ U₁ = {|x| ≤ 1}, and e₂ does on π\_HT^{-1}(U) for U ⊂ U₂ = {|x| ≥ 1}.

**Unit tests.**
- `ModularCurve.lie_x` (computation): u₊ · x = 1 and h · x = −2x for the infinitesimal action of b on x = e₂/e₁.
- `ModularCurve.lie_t_centre` (computation): The Lie algebra acts on t by the trace (ModularCurve.lieOnT): z · t = 2t.
- `ModularCurve.lie_t_coroot` (computation): h · t = 0, since tr h = 0.
- `ModularCurve.galois_x` (compatibility): G_{Q_p} fixes x, since it scales e₁ and e₂ by the same cyclotomic factor.
- `ModularCurve.e1_not_smooth` (non-example): e₁ is GL_2(Q_p)-locally analytic but not smooth: h · e₁ = e₁ ≠ 0, so e₁ is not annihilated by gl_2(Q_p) and is not fixed by any open subgroup.

**Acceptance.**
- On U₁ = {|x| ≤ 1}, e₁ generates ω\_{K^p} and the matrix θ of LA.1/theta-on-the-modular-curve is (x x²; −1 −x).
- The derivatives u₊ · x = 1 and z · t = 2t hold on every U ∈ 𝔅.

**Prerequisites.** PerfectoidShimuraVarieties:S5/modular-tower-comparison; PerfectoidShimuraVarieties:S3/elliptic-hodge-tate-and-O1; PerfectoidShimuraVarieties:S1/elliptic-cusps-at-infinite-level; mathlib:cyclotomicCharacter; mathlib:Matrix.GeneralLinearGroup; mathlib:Matrix.trace.

**Source.** Pan I, Theorem 4.1.2, Theorem 4.1.6, §4.2.1 (before Theorem 4.2.4) and §4.3.1, pp. 30–38: The perfectoid modular curve, the relative Hodge–Tate sequence and π\_HT; the fake-Hasse invariants e₁, e₂ as images of the standard basis; the function t from the Weil pairing with its Galois, GL_2(Q_p) and adelic transformation laws; the basis u₊, h, z of b with u₊·x = 1, h·e₁ = e₁, z·t = 2t. Pan II, §3.2.1, p. 19: The same function t, obtained from the second exterior power of the Hodge–Tate sequence after fixing a basis of Q_p(1), and the coordinate x = e₂/e₁.

### LA.1/flag-variety-lie-algebra-bundles — The bundles g⁰ ⊃ b⁰ ⊃ n⁰ on the flag variety

*Construction.*

**Statement.** Let g = gl_2(C), Fl the flag variety of GL_2 over C (also its adic space). For a C-point x of Fl let b_x ⊃ n_x be the corresponding Borel and nilpotent subalgebras. Put g⁰ := O_Fl ⊗\_C g, b⁰ := {f ∈ g⁰ : f_x ∈ b_x for all x} and n⁰ := {f ∈ g⁰ : f_x ∈ n_x for all x}, GL_2-equivariant vector bundles of ranks 4, 3, 1 for the adjoint action. Fix the rational Borel b of upper triangular matrices, its nilradical n and the Cartan h of diagonal matrices. Then b⁰/n⁰ ≅ O_Fl ⊗\_C h canonically, the global sections of b⁰/n⁰ being h with trivial GL_2-action. On the chart x = e₂/e₁ of U₁ the line n⁰ is generated by the matrix (x x²; −1 −x).

**Hypotheses.**
- GL_2 acts on Fl on the right through its action on the total space (Pan I §4.1.5).

**Construction or proof.**
- Define the subbundles pointwise by the incidence condition and check local freeness on the two standard charts.
- Compute that the section (x x²; −1 −x) of g⁰ over U₁ lies in n_x at every point (it is nilpotent with kernel the line of x).
- The quotient b⁰/n⁰ is a trivial bundle with fibre h because any two Borels are conjugate by a unique element of the unipotent radical up to the torus (Beilinson–Bernstein's construction, Pan I §4.2.6).

**Uses.**
- Pan I Theorem 4.2.7, p. 37: n⁰ annihilates O^la_{K^p}.
- Pan I Corollary 4.2.8, p. 37: b⁰/n⁰ = O_Fl ⊗ h gives the horizontal Cartan action.
- Pan II §4.2.1–4.2.2, pp. 37–38: Beilinson–Bernstein localisation produces d̄₁ from u₊.

**API.**
- `FlagBundle.gZero` (data): g⁰ = O_Fl ⊗\_C g with its GL_2-equivariant structure.
- `FlagBundle.bZero` (data): b⁰ ⊂ g⁰, the subbundle of pointwise Borel elements.
- `FlagBundle.nZero` (data): n⁰ ⊂ b⁰, the line subbundle of pointwise nilpotent-radical elements.
- `FlagBundle.bZero_quot_nZero` (equivalence): b⁰/n⁰ ≅ O_Fl ⊗\_C h, GL_2-equivariantly with trivial action on h.
- `FlagBundle.nZeroGenerator` (characterisation): On U₁ with coordinate x, n⁰ is generated by (x x²; −1 −x).
- `FlagBundle.equivariant` (functoriality): g · b⁰ = b⁰ and g · n⁰ = n⁰ for g ∈ GL_2(C) acting by translation on Fl and conjugation on g.

**Unit tests.**
- `FlagBundle.nZero_sq` (computation): (x x²; −1 −x)² = 0 for every x.
- `FlagBundle.nZero_at_infinity` (computation): At x = 0 the fibre n_0 is spanned by (0 0; 1 0); at x = ∞ it is spanned by u₊ = (0 1; 0 0), the limit of x^{−2}(x x²; −1 −x), so ∞ is the point whose Borel is the rational upper-triangular b.
- `FlagBundle.nZero_trace` (computation): The generator (x x²; −1 −x) has trace 0, as an element of sl₂ must.
- `FlagBundle.ranks` (degenerate): rank g⁰ = 4, rank b⁰ = 3, rank n⁰ = 1 and rank b⁰/n⁰ = 2 = dim h.
- `FlagBundle.n_not_constant` (non-example): n⁰ is not the constant subbundle O_Fl ⊗ n: its fibre at x = 0 is the lower nilpotent, not n = C·u₊.

**Acceptance.**
- The section (x x²; −1 −x) is nilpotent: its square is 0.
- Over U₂ the generator of n⁰ is obtained by applying the Weyl element (0 1; 1 0).

**Prerequisites.** tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-7-the-center-of-ul-harish-chandra-freudenthal-and-serres-relations.

**Source.** Pan I, §4.2.6, pp. 36–37: Definition of g⁰, b⁰, n⁰ on Fl following Beilinson–Bernstein, the natural action of g⁰ on O^la_{K^p}, and the identification b⁰/n⁰ = O_Fl ⊗ h. Pan I, §4.3.2, p. 39: On a chart where e₁ generates ω, the operator θ is (x x²; −1 −x), a generator of n⁰.

### LA.1/faltings-extension-is-hodge-tate-sequence — Faltings's extension is the relative Hodge–Tate sequence, up to sign

*Theorem.*

**Statement.** On the pro-Kummer-étale site of X = X_{K^pGL_2(Z_p)} (log structure from the cusps C), let OB⁺\_{dR,log} be the positive log structural de Rham sheaf. The first graded piece of the Poincaré sequence 0 → B⁺\_dR → OB⁺\_{dR,log} → OB⁺\_{dR,log} ⊗ Ω¹\_X(C) → 0 is the log Faltings extension 0 → Ô\_X(1) → gr¹OB⁺\_{dR,log} → Ô\_X ⊗ Ω¹\_X(C) → 0. After tensoring with ω^{-1} and using the Kodaira–Spencer isomorphism ω ≅ ω^{-1} ⊗ Ω¹\_X(C), it becomes an extension of ω ⊗ Ô\_X by ω^{-1} ⊗ Ô\_X(1). There is an isomorphism of Ô\_X-modules ω^{-1} ⊗ gr¹OB⁺\_{dR,log} ≅ V̂\_log(1) ⊗ Ô\_X under which this extension class is −1 times the class of the relative Hodge–Tate sequence 0 → ω^{-1} ⊗ Ô\_X(1) → V̂\_log(1) ⊗ Ô\_X → ω ⊗ Ô\_X → 0.

**Hypotheses.**
- The relative log de Rham comparison V̂\_log ⊗ OB_{dR,log} ≅ D_{dR,log} ⊗ OB_{dR,log} holds with D_{dR,log} the canonical extension (unipotent monodromy at the cusps).

**Construction or proof.**
- Tensor V̂\_log with the Poincaré sequence and take gr¹; use the inclusion of gr¹(D_{dR,log} ⊗ OB⁺\_{dR,log}) and Griffiths transversality (Pan I proof of Theorem 4.2.2).
- The composite gr¹D_{dR,log} ⊗ Ô → gr⁰D_{dR,log} ⊗ Ô ⊗ Ω¹(C) is the Kodaira–Spencer isomorphism, so ∇ is surjective and V̂\_log(1) ⊗ Ô ≅ gr⁰(D_{dR,log}) ⊗ gr¹OB⁺\_{dR,log}.
- Compare the two projections of gr¹(D_{dR,log} ⊗ OB⁺\_{dR,log}) to get the sign −1.

**Acceptance.**
- Restricted to the ordinary locus over a finite extension, this is Faltings's Theorem 5 of 'p-adic Hodge theory' (1988), as Pan I §4.2 notes.

**Prerequisites.** HodgeTateAndCanonicalSubgroups:T6:comparison/log-faltings-extension; HodgeTateAndCanonicalSubgroups:T6:comparison/log-poincare; HodgeTateAndCanonicalSubgroups:T6:comparison/log-riemann-hilbert; AlgebraicModularFormsAndSerreWeights:R15.1/logarithmic-kodaira-spencer; AutomorphicBundles:B3/canonical-and-subcanonical-extensions; PerfectoidShimuraVarieties:S3/elliptic-hodge-tate-and-O1.

**Source.** Pan I, §4.1.3 (sequences (4.1.1)–(4.1.3)), Remark 4.1.4, §4.2.1, Theorem 4.2.2 with proof, pp. 31–35: The relative log de Rham comparison with the canonical extension, the relative Hodge–Tate filtration obtained from Scholze's Proposition 7.9 in the log setting, the log Faltings extension, and the identification of the two extensions up to −1 through Kodaira–Spencer.

### LA.1/modular-coverings-are-locally-analytic — Preimages of small affinoids in the perfectoid modular curve are locally analytic coverings

*Theorem.*

**Statement.** Let K_p ⊂ GL_2(Q_p) be open, X an affinoid of X_{K^pK_p} containing at most one cusp, small in the sense of LA.0/log-galois-perfectoid-covering, whose preimage X̃ ⊂ X_{K^p} is a log K_p-Galois pro-étale perfectoid covering, and suppose π\_HT(X̃) is contained in an affinoid open of Fl. Then X̃ is a locally analytic covering of X. Such X form a basis of the topology of X_{K^pK_p}.

**Hypotheses.**
- π\_HT(X̃) lies in an affinoid of Fl, so ω\_{K^p} is generated on X̃ by some e ∈ V(1) ⊗ C.

**Construction or proof.**
- Global sections of the relative Hodge–Tate sequence on X̃ stay exact since H¹(X̃, ω^{-1} ⊗ Ô(1)) = 0 (Diao–Lan–Liu–Zhu, Theorem 5.4.3).
- The middle term is V(1) ⊗ H⁰(X̃, Ô), on which K_p acts algebraically, and a vector e ∈ V(1) ⊗ C maps to a generator of ω; so the sequence stays exact on K_p-locally analytic vectors, and after multiplying by e so does the twisted one.
- By LA.1/faltings-extension-is-hodge-tate-sequence this twisted sequence is Faltings's extension (FE) up to −1; apply criterion (2) of LA.0/locally-analytic-covering.

**Acceptance.**
- Every U ∈ 𝔅 gives such coverings after shrinking to small rational subsets (Scholze 2015 Lemma 5.2).

**Prerequisites.** LA.1/faltings-extension-is-hodge-tate-sequence; LA.0/locally-analytic-covering; PerfectoidShimuraVarieties:S3/affinoid-perfectoid-basis-of-flag-variety; LocallyAnalyticDistributions:L0.

**Source.** Pan I, Corollary 4.2.3 with proof, p. 35: On a small affinoid with Hodge–Tate image in an affinoid, the global sections of the relative Hodge–Tate sequence stay exact after taking locally analytic vectors, so the preimage is a locally analytic covering. Pan I, §4.2, opening paragraph, p. 33: Small affinoids with at most one cusp whose preimages are log K_p-Galois pro-étale perfectoid coverings form a basis, by Theorem 4.1.2 and Scholze's Lemma 5.2.

### LA.1/theta-on-the-modular-curve — The relative Sen operator of the modular tower

*Theorem.*

**Statement.** In the situation of LA.1/modular-coverings-are-locally-analytic, let e generate ω\_{K^p} on X̃ and view e₁/e, e₂/e as functions on X̃. Then, up to a unit of O(X̃), the element θ ∈ O(X̃) ⊗\_{Q_p} Lie(K_p) of LA.0/differential-equation is (1/e²)·(e₁e₂  e₂²; −e₁²  −e₁e₂) ∈ gl_2(O(X̃)). When e = e₁ this is (x x²; −1 −x) with x = e₂/e₁.

**Hypotheses.**
- X is small with a fixed chart; the identification of Z_p(1) with Z_p is fixed.

**Construction or proof.**
- Compute θ through the standard representation V, as Pan I Remark 3.3.7 allows: φ\_V is determined on (B_∞ ⊗ V)^{K_p, Γ-la}.
- By LA.1/faltings-extension-is-hodge-tate-sequence the sequence 0 → B·e^{-1} → B ⊗ V → B·e → 0, base-changed to B_∞ and K_p-invariants, is Faltings's extension on X_∞, which is A_∞ ⊗ (a nonsplit self-extension of Q_p) by Diao–Lan–Liu–Zhu §2.
- So φ\_V(x) kills B·e^{-1} and maps B ⊗ V onto B·e^{-1}; f = (e₂/e)e₁ − (e₁/e)e₂ generates B·e^{-1}; normalise φ\_V(x)(e) = f and read off the matrix (Pan I proof of Theorem 4.2.4).

**Acceptance.**
- The matrix is nilpotent of rank one with kernel the line ω^{-1}(1) of the Hodge–Tate filtration, as a point of n⁰ must be.

**Prerequisites.** LA.1/modular-coverings-are-locally-analytic; LA.0/differential-equation; LA.1/fake-hasse-invariants.

**Source.** Pan I, Theorem 4.2.4 with proof and Remark 4.2.5, p. 36: Explicit formula for θ on the modular tower, computed from the standard representation and Faltings's extension; θ is the Higgs field attached by the p-adic Simpson correspondence to the universal local system.

### LA.1/locally-analytic-sheaf — The sheaves O_{K^p}, O^la_{K^p} and O^sm_{K^p} on the flag variety

*Definition.* Planet: *Locally analytic sheaf O^la*.

**Statement.** Let O_{K^p} := π\_{HT\*}O_{X_{K^p}}, a sheaf of C-Banach algebras on the analytic site of Fl with a GL_2(Q_p)-action and prime-to-p Hecke action. For a quasi-compact open U ⊂ Fl choose an open subgroup K_p ⊂ GL_2(Q_p) stabilising U and let O^la_{K^p}(U) be the K_p-locally analytic vectors of the Q_p-Banach representation O_{K^p}(U) (independent of K_p); this is a sheaf, GL_2(Q_p)- and Hecke-equivariant, with a natural action of Lie(GL_2(Q_p)) and of g⁰ = O_Fl ⊗ g by (f ⊗ X)·s = f(X·s). O_Fl → O_{K^p} lands in O^la_{K^p}. The subsheaf O^sm_{K^p} of GL_2(Q_p)-smooth sections is colim_{K_p} π\_{HT\*}π\_{K_p}^{-1}O_{X_{K^pK_p}}. More generally, for a sheaf ω^k_{K^p} = ω\_{K^p}^{⊗k}, ω^{k,la}\_{K^p} and ω^{k,sm}\_{K^p} are its locally analytic and smooth subsheaves of π\_{HT\*}ω^k_{K^p} (the Banach structure on sections over U ∈ 𝔅 coming from a generator of ω\_Fl on U).

**Hypotheses.**
- The locally analytic vectors are taken for the Q_p-analytic structure of GL_2(Q_p) (not a C-analytic one).

**Construction or proof.**
- Existence of K_p stabilising U follows from compactness; independence of K_p from Pan I Remark 2.1.7.
- Left exactness of taking locally analytic vectors and the sheaf property of π\_{HT\*}O⁺ give the sheaf property.
- O_Fl(U) is a continuous quotient of a Tate algebra on which some K_p acts trivially modulo p, so it consists of analytic vectors by Amice's criterion (Pan I §4.2.6).

**Uses.**
- Pan I Theorem 4.4.6, p. 45: H^i(Fl, O^la_{K^p}) computes the locally analytic vectors of completed cohomology.
- Pan II §§3–6: every construction of the second paper is a sheaf on Fl built from O^la_{K^p}.

**API.**
- `LASheaf.O` (data): O_{K^p} = π\_{HT\*}O_{X_{K^p}} as a sheaf of C-Banach algebras with GL_2(Q_p)-action.
- `LASheaf.la` (data): O^la_{K^p} ⊂ O_{K^p}, sections U ↦ O_{K^p}(U)^{K_p-la}.
- `LASheaf.sm` (data): O^sm_{K^p} ⊂ O^la_{K^p}, the GL_2(Q_p)-smooth sections.
- `LASheaf.gZero_action` (structure): The O_Fl-linear action of g⁰ on O^la_{K^p} extending the Lie algebra action.
- `LASheaf.flag_incl` (constructor): O_Fl → O^la_{K^p}.
- `LASheaf.hecke` (functoriality): Prime-to-p Hecke operators act on O^la_{K^p} and commute with GL_2(Q_p); changing K^p gives the transition maps.
- `LASheaf.galois` (structure): G_{Q_p} acts semilinearly, commuting with GL_2(Q_p) and Hecke operators (Pan II §3.3.1).

**Unit tests.**
- `LASheaf.global_sections` (computation): H⁰(Fl, O^la_{K^p}) = colim_{K_p} H⁰(X_{K^pK_p}, O_{X_{K^pK_p}}), the smooth (indeed locally constant) functions on the components.
- `LASheaf.sm_sub_la` (compatibility): O^sm_{K^p} ⊂ O^la_{K^p} and O^sm_{K^p}(U) is exactly the part annihilated by gl_2(Q_p) (Pan II §1.2.6).
- `LASheaf.flag_in_la` (compatibility): The image of O_Fl(U) lies in O^la_{K^p}(U) for every quasi-compact U.
- `LASheaf.la_ne_sm` (non-example): O^la_{K^p} ≠ O^sm_{K^p}: t is a GL_2(Q_p)-locally analytic section with z · t = 2t ≠ 0, so t is not smooth.

**Acceptance.**
- H⁰(Fl, O^la_{K^p}) = colim_{K_p} H⁰(X_{K^pK_p}, O), the locally analytic vectors of H̃⁰(K^p, C) (Pan I Corollary 5.1.3 and Theorem 4.4.6).

**Prerequisites.** LA.1/fake-hasse-invariants; LA.1/flag-variety-lie-algebra-bundles; PerfectoidShimuraVarieties:S3/affinoid-perfectoid-basis-of-flag-variety; LocallyAnalyticDistributions:L0.

**Source.** Pan I, §4.2.6, pp. 36–37: Definition of O_{K^p} = π\_{HT\*}O and of its subsheaf O^la_{K^p} of locally analytic sections, its g⁰-action and the inclusion of O_Fl. Pan I, Definition 5.3.2 and Remarks 5.3.3–5.3.4, pp. 59–60: The subsheaf of GL_2(Q_p)-smooth sections of π\_{HT\*}ω^k and its description as push-forward of the colimit of finite-level pull-backs. Pan II, §1.2.6 and §3.1.2, pp. 7–8 and 18: O^sm_{K^p}, Ω^{1,sm}\_{K^p}(C) and the sheaves ω^{k,la}\_{K^p}, ω^{k,sm}\_{K^p}.

### LA.1/horizontal-nilpotent-acts-trivially — The horizontal nilpotent subalgebra annihilates O^la

*Theorem.* Planet: *n⁰ annihilates O^la*.

**Statement.** n⁰ acts trivially on O^la_{K^p}: for every open U and every local section f of n⁰ and s of O^la_{K^p}, f·s = 0.

**Hypotheses.**
- Statement on the sheaf level; it suffices to check it on U ∈ 𝔅.

**Construction or proof.**
- On U ∈ 𝔅 shrink to small affinoids whose preimages are locally analytic coverings (LA.1/modular-coverings-are-locally-analytic).
- By LA.0/differential-equation θ kills the locally analytic vectors, and by LA.1/theta-on-the-modular-curve θ is a generator of n⁰ (up to a unit).
- Conceptually: φ\_V kills ω^{-1}(1) and maps ω isomorphically onto it, and π\_HT is defined by the position of ω^{-1}(1), so O·θ ⊃ n⁰ tautologically (Pan I proof of Theorem 4.2.7).

**Acceptance.**
- Pan I Lemma 4.3.3: a section of O^la killed by the rational Borel b is fixed by an open subgroup of GL_2(Q_p) (LA.2/borel-invariants-are-smooth).

**Prerequisites.** LA.1/theta-on-the-modular-curve; LA.1/locally-analytic-sheaf; LA.1/flag-variety-lie-algebra-bundles.

**Source.** Pan I, Theorem 4.2.7 with proof, p. 37; Theorem 1.0.10, p. 7: n⁰ acts trivially on O^la_{K^p}, deduced from the explicit θ.

### LA.1/horizontal-cartan-action — The horizontal Cartan action θ\_h and the weight sheaves

*Construction.* Planet: *Horizontal Cartan action θ\_h*.

**Statement.** Since n⁰ acts trivially on O^la_{K^p}, b⁰/n⁰ = O_Fl ⊗ h acts, and h → H⁰(Fl, b⁰/n⁰) gives an action θ\_h of h on O^la_{K^p} commuting with g. −θ\_h extends the action of Z(U(sl_2)) to S(h₀) through the Harish-Chandra isomorphism (with the sign coming from n_x-coinvariants), and θ\_h restricted to the centre z of g is the action of z ⊂ g. On U ⊂ U₁ (e₁ a generator) θ\_h(diag(a, d)) acts as the element (d  (d − a)x; 0  a) of O_Fl(U) ⊗ g. For a weight χ: h → C, χ(diag(a, d)) = n₁a + n₂d, written χ = (n₁, n₂), O^{la,χ}\_{K^p} is the χ-isotypic subsheaf (θ\_h(H)s = χ(H)s); likewise ω^{k,la,χ}\_{K^p}. In terms of the expansion of LA.2/power-series-expansion, θ\_h(diag(a, d)) acts on coefficients by c_{i,j,k} ↦ d(j + 1)c_{i,j+1,k} + (a + d)(k + 1)c_{i,j,k+1}. On ω^{k,sm}\_{K^p} θ\_h is trivial and on ω\_Fl it is the character diag(a, d) ↦ d.

**Hypotheses.**
- Weights are C-linear functionals on h; Pan II uses only integral weights.

**Construction or proof.**
- Global sections of b⁰/n⁰ are GL_2-invariant, so the induced action commutes with g (Pan I Corollary 4.2.8).
- The Harish-Chandra compatibility is Beilinson–Bernstein's computation for twisted D-modules on Fl, applied to coinvariants.
- The coordinate formula follows from [ (d (d−a)x; 0 a), (x x²; −1 −x) ] = (a − d)(x x²; −1 −x) and [diag(a,d), u₊] = (a − d)u₊ (Pan I §5.1.1).

**Uses.**
- Pan I Theorem 5.1.8, p. 48: θ\_h(diag(0, 1)) is the Sen operator.
- Pan I Theorem 5.4.2, p. 64: the μ-isotypic decomposition by weights.
- Pan II §§4–6: every operator of the second paper is a map between weight sheaves O^{la,χ}.

**API.**
- `ThetaH.action` (data): θ\_h: h → End(O^la_{K^p}), commuting with g, GL_2(Q_p), Hecke and G_{Q_p}.
- `ThetaH.weightSheaf` (constructor): O^{la,χ}\_{K^p} := {s : θ\_h(H)s = χ(H)s for all H ∈ h}, and ω^{k,la,χ}\_{K^p} likewise.
- `ThetaH.centre` (compatibility): θ\_h(z) = z for z in the centre of g.
- `ThetaH.harishChandra` (compatibility): −θ\_h restricted to Z(U(sl_2)) equals the action of Z(U(sl_2)) through the Harish-Chandra isomorphism.
- `ThetaH.coordinate` (simp): On U ⊂ U₁, θ\_h(diag(a, d)) = (d (d − a)x; 0 a) ∈ O_Fl(U) ⊗ g.
- `ThetaH.coordinate_bracket` (relation): [θ\_h(diag(a, d)), (x x²; −1 −x)] = (a − d)(x x²; −1 −x), matching [diag(a, d), u₊] = (a − d)u₊.
- `Weight` (structure): Integral weights χ = (n₁, n₂) with eval, χ(h) = n₁ − n₂, the t-twist, the dot action w·χ = (n₂ − 1, n₁ + 1), the reflection −w·(−χ) = (n₂ + 1, n₁ − 1) and their Harish-Chandra invariants (n₁ + n₂, (n₁ − n₂ ± 1)²).
- `ThetaH.twist_t` (relation): Multiplication by t^k maps O^{la,(n₁,n₂)} isomorphically onto O^{la,(n₁+k,n₂+k)} (Pan II Remark 3.2.4).

**Unit tests.**
- `ThetaH.t_weight` (computation): t ∈ H⁰(X_{K^p}, O) lies in O^{la,(1,1)}\_{K^p}: θ\_h(diag(a, d))t = (a + d)t.
- `ThetaH.flag_weight_zero` (computation): O_Fl ⊂ O^{la,(0,0)}\_{K^p} and O^sm_{K^p} ⊂ O^{la,(0,0)}\_{K^p}.
- `ThetaH.basic_section` (computation): For χ = (n₁, n₂) and U ⊂ U₁ with N large, (t/t_N)^{n₁}(e₁/e_{1,N})^{n₂−n₁} is a section of O^{la,χ}\_{K^p}(U) (the case c₀ = 1, c_i = 0 for i > 0 of Pan I Lemma 5.1.2(2) and Theorem 4.3.9).
- `ThetaH.not_lie_action` (non-example): θ\_h(h) is not the infinitesimal action of h ∈ gl_2(Q_p): on x = e₂/e₁ the Lie action gives h·x = −2x while θ\_h(h)x = 0 since x ∈ O_Fl ⊂ O^{la,(0,0)}.

**Acceptance.**
- On t: θ\_h(diag(a, d))t = (a + d)t, so t ∈ O^{la,(1,1)}\_{K^p}; on e₁ (as section of ω) the weight is (0, 1), consistent with ω\_Fl having character d.

**Prerequisites.** LA.1/horizontal-nilpotent-acts-trivially; LA.1/flag-variety-lie-algebra-bundles; tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-7-the-center-of-ul-harish-chandra-freudenthal-and-serres-relations.

**Source.** Pan I, Corollary 4.2.8 and Remark 4.2.10, pp. 37–38: Definition of θ\_h through b⁰/n⁰, its relation with Z(U(g)) via Harish-Chandra, and the twisted D-module viewpoint with the χ-components O^{la,χ}\_{K^p}. Pan I, §5.1.1, pp. 46–47: The coordinate formula for θ\_h and its effect on the expansion coefficients. Pan II, §3.1.1–3.1.2 and §3.2.1, pp. 17–19: θ\_h, the weight convention χ = (n₁, n₂) with only integral weights, the sheaves O^{la,χ}\_{K^p} and ω^{k,la,χ}\_{K^p}, and the weights of ω^{k,sm} and ω\_Fl.

### LA.1/automorphic-twists — Twists of O^la by automorphic bundles and the Hecke-equivariant Hodge–Tate sequence

*Construction.*

**Statement.** Fix k ∈ Z. On U ∈ 𝔅 a generator of ω\_Fl identifies O_{X_{K^p}}(π\_HT^{-1}U) with ω^k_{K^p}(π\_HT^{-1}U), giving a Banach structure independent of the generator and hence ω^{k,la}\_{K^p}. There are two h-equivariant descriptions as twists: on the flag variety, ω^{k,la}\_{K^p}(−k) = O^la_{K^p} ⊗\_{O_Fl} ω\_Fl^{⊗k}; on the modular curves, ω^{k,la}\_{K^p} = ω^{k,sm}\_{K^p} ⊗\_{O^sm_{K^p}} O^la_{K^p}. Hecke-equivariantly, the relative Hodge–Tate sequence must be written 0 → ∧²D ⊗ ω^{-1}(1) → V(1) ⊗ O → ω → 0 with D the canonical extension of H¹\_dR of the universal elliptic curve, since the implicit trivialisation of ∧²D shifts the prime-to-p Hecke action by the adelic norm.

**Hypotheses.**
- k is an integer; U ∈ 𝔅.

**Construction or proof.**
- The Banach structure is transported by a generator; independence because two generators differ by a unit of O_Fl(U) acting by an analytic automorphism.
- The flag-variety twist is the pull-back π\_HT\*ω\_Fl = ω(−1) (S3/elliptic-hodge-tate-and-O1).
- The modular-curve twist is LA.2/locally-algebraic-sheaves' twisting isomorphism (Pan II Lemma 3.2.8).
- The Hecke-equivariant form is the import S3/hecke-equivariant-hodge-tate-sequence (Pan II §4.2.3).

**Uses.**
- Pan II §4.1, pp. 33–37: the operators d_{k+1} are maps between twisted sheaves.
- Pan II Definition 4.3.1, p. 41: the intertwining operator lands in a twist O^{la,(1,−k)}(k).

**API.**
- `Twist.omegaLa` (data): ω^{k,la}\_{K^p}, the locally analytic sections of π\_{HT\*}ω^k_{K^p}.
- `Twist.flag_iso` (equivalence): ω^{k,la}\_{K^p}(−k) ≅ O^la_{K^p} ⊗\_{O_Fl} ω\_Fl^{⊗k}, h-equivariantly.
- `Twist.curve_iso` (equivalence): ω^{k,la}\_{K^p} ≅ ω^{k,sm}\_{K^p} ⊗\_{O^sm_{K^p}} O^la_{K^p}, h-equivariantly.
- `Twist.mul` (structure): ω^{k,la} ⊗ ω^{l,la} → ω^{k+l,la}, adding weights.
- `Twist.hecke_equivariant_sequence` (compatibility): The Hecke-equivariant relative Hodge–Tate sequence with subobject ∧²D ⊗ ω^{-1}(1).

**Unit tests.**
- `Twist.k_zero` (degenerate): For k = 0 both isomorphisms are the identity of O^la_{K^p}.
- `Twist.e1_section` (computation): e₁ is a section of ω^{1,la}\_{K^p} of weight (0, 1) (from ω\_Fl), and e₁^k ∈ ω^{k,la,(0,k)}\_{K^p}.
- `Twist.flag_and_curve_agree` (compatibility): Composing the two isomorphisms identifies O^la ⊗ ω\_Fl^k(k) with ω^{k,sm} ⊗ O^la compatibly with the inclusion of ω^{k,sm}\_{K^p}(U) ⊗ O_Fl(U) on both sides.
- `Twist.naive_sequence_not_hecke` (non-example): The sequence 0 → ω^{-1}(1) → V(1) ⊗ O → ω → 0 with the trivialisation of ∧²D is not equivariant for the prime-to-p Hecke action; its subobject must be ∧²D ⊗ ω^{-1}(1).

**Acceptance.**
- The h-action on ω^{k,sm}\_{K^p} is trivial and on ω\_Fl is diag(a, d) ↦ d, so both descriptions have the same weights.

**Prerequisites.** LA.1/locally-analytic-sheaf; LA.1/horizontal-cartan-action; PerfectoidShimuraVarieties:S3/hecke-equivariant-hodge-tate-sequence; PerfectoidShimuraVarieties:S3/elliptic-hodge-tate-and-O1.

**Source.** Pan II, §3.1.2, p. 18: The two descriptions of ω^{k,la}\_{K^p} as twists of O^la_{K^p}, on the flag variety and on modular curves, with their h-weights. Pan II, §4.2.3, sequences (4.2.1)–(4.2.3), p. 38: The Hecke-equivariant correction of the relative Hodge–Tate sequence by ∧²D.

<a id="la2"></a>

## LA.2. Local structure of O^la and completed cohomology

Prove that Borel-invariant locally analytic sections are smooth (Pan I Lemma 4.3.3); the power-series expansion of sections of O^la along x − x_n, log(e₁/e_{1,n}), log(t/t_n) with explicit norm bounds (Pan I Theorem 4.3.9) and the Banach algebras O_n(U){x, e₁, t}; strong LA-acyclicity of O_{K^p}(U) on the basis 𝔅 (Pan I Proposition 4.3.15); Scholze's comparison of completed cohomology with H^i(X_{K^p}, O⁺) (Pan I Theorem 4.4.2, Corollary 4.4.3); and H̃^i(K^p, C)^la ≅ H^i(Fl, O^la_{K^p}) (Pan I Theorem 4.4.6). In weight χ: the description of sections of O^{la,χ} (Pan I Lemma 5.1.2, Pan II Theorem 3.2.2, Corollary 3.2.3), the cohomology of O^{la,χ} against the χ-part of H¹ (Pan I Corollary 5.1.3), the locally algebraic subsheaves and the twisting isomorphism (Pan II §3.2.5–3.2.9), and the essential vanishing of Čech cohomology of the analytic pieces with the extension to the larger cover (Pan II Proposition 3.2.11, Corollary 3.2.13).

**Depends on.** LA.0, LA.1, CompletedCohomologyAndLocalGlobalCompatibility:R31.1, CompletedCohomologyPartII:CC.2, CompletedCohomologyPartII:CC.5, DiamondsAndVStacks:D2, HodgeTateAndCanonicalSubgroups:T6:comparison, LocallyAnalyticDistributions:L0, PadicHodgeTheory:P8, PerfectoidShimuraVarieties:S3, PerfectoidShimuraVarieties:S5.

### LA.2/borel-invariants-are-smooth — Borel-invariant locally analytic sections are smooth

*Theorem.*

**Statement.** Let U ∈ 𝔅 with e₁ generating ω\_{K^p} on π\_HT^{-1}(U). If f ∈ O^la_{K^p}(U) is annihilated by the rational Borel subalgebra b of gl_2(Q_p), then f is annihilated by gl_2(Q_p), i.e. f is fixed by an open subgroup of GL_2(Q_p).

**Hypotheses.**
- U ∈ 𝔅 and e₁ generates ω\_{K^p} on π\_HT^{-1}(U); the case where e₂ generates follows by the Weyl element.

**Construction or proof.**
- θ(f) = 0 by the differential equation, with θ = (x x²; −1 −x) (LA.1/theta-on-the-modular-curve).
- Since b·f = 0, θ(f) = (0 0; −1 0)·f, so the lower nilpotent kills f too and gl_2 = b + C·(0 0; 1 0) kills f (Pan I Lemma 4.3.3).
- An alternative avoids θ: Tate's normalised traces on the anticanonical tower descend a b-invariant section to finite level (Pan I Remark 4.3.4).

**Acceptance.**
- Applied to e₁/e_{1,n}-free expansions, it shows the coefficients c_{i,j,k} of LA.2/power-series-expansion come from finite level.

**Prerequisites.** LA.1/theta-on-the-modular-curve; LA.1/locally-analytic-sheaf; LA.0/differential-equation.

**Source.** Pan I, Lemma 4.3.3 and Remark 4.3.4, p. 39: A locally analytic section killed by the upper-triangular Borel subalgebra is killed by gl_2(Q_p), by the differential equation, or alternatively by Tate traces on the anticanonical tower.

### LA.2/power-series-expansion — Power-series expansion of locally analytic functions on the perfectoid modular curve

*Theorem.* Planet: *Power-series expansion of O^la*.

**Statement.** Let U ∈ 𝔅 with e₁ generating ω\_{K^p} on V_∞ = π\_HT^{-1}(U), V_∞ the preimage of an affinoid V_{K_p}, G_0 ⊂ K_p uniform with G_n = G_0^{p^n}, V_{G_n} the preimage at level G_n, and choose r(n) increasing and approximations x_n, e_{1,n}, t_n at level G_{r(n)} with ‖x − x_n‖, ‖e₁ − e_{1,n}‖, ‖t − t_n‖ ≤ p^{−n} (also in the G_{r(n)}-analytic norms). For every G_m-analytic f ∈ O^la_{K^p}(U) there is N = N(f), bounded in terms of m, and for every n ≥ N unique c^{(n)}\_{i,j,k}(f) ∈ H⁰(V_{G_{r(n)}}, O) with ‖c^{(n)}\_{i,j,k}(f)‖ ≤ p^{(n−1)(i+j+k)}‖f‖\_{G_m} such that f = Σ\_{i,j,k≥0} c^{(n)}\_{i,j,k}(f) (x − x_n)^i (log(e₁/e_{1,n}))^j (log(t/t_n))^k in the G_{r(n)}-analytic vectors. Conversely any family c_{i,j,k} at level G_{r(n)} with ‖c_{i,j,k}‖ ≤ C′p^{(n−1)(i+j+k)} defines a G_{r(n)}-analytic section with these coefficients.

**Hypotheses.**
- U ∈ 𝔅, e₁ generates ω on V_∞; n ≥ N(f).

**Construction or proof.**
- Expand along n: D_x(s) = Σ\_l (−1)^l(x − x_{n″})^l(u₊)^l s/l! kills u₊ and f = Σ\_i D_x((u₊)^i f/i!)(x − x_{n″})^i, using u₊·x = 1 and the Lie-action bound (Pan I §4.3.6).
- Expand the u₊-invariant coefficients along h with log(e₁/e_{1,n′}) (h·log = 1, u₊·log = 0), then along z with log(t/t_n) (z·log = 2) (Pan I §§4.3.7–4.3.8).
- The resulting coefficients are killed by b, hence smooth by LA.2/borel-invariants-are-smooth, hence at finite level; uniqueness from applying the same operators (Pan I proof of Theorem 4.3.9).

**Acceptance.**
- For f = (t/t_n)^{a} with a ∈ Z_p the expansion has c_{0,0,k} = a^k/k! and all other coefficients zero, since (t/t_n)^a = exp(a log(t/t_n)).

**Prerequisites.** LA.2/borel-invariants-are-smooth; LA.1/fake-hasse-invariants; PerfectoidShimuraVarieties:S3/affinoid-perfectoid-basis-of-flag-variety; LocallyAnalyticDistributions:L0.

**Source.** Pan I, §4.3.5–§4.3.8 and Theorem 4.3.9, pp. 39–42: Explicit power-series description of the sections of O^la_{K^p} over U ∈ 𝔅 along x − x_n, log(e₁/e_{1,n}), log(t/t_n), with coefficients at finite level, norm bounds and the converse. Pan II, §3.2.1–Theorem 3.2.2, pp. 19–20: The same description restated for the weight-χ parts.

### LA.2/analytic-banach-algebras — The Banach algebras O_n(U){x, e₁, t} and the spaces A_n

*Definition.*

**Statement.** For U, V_{G_n}, x_n, e_{1,n}, t_n as in LA.2/power-series-expansion and n > 0, O_n(U){x, e₁, t} ⊂ O^la_{K^p}(U) is the set of f = Σ c_{i,j,k}(x − x_n)^i (log(e₁/e_{1,n}))^j (log(t/t_n))^k with c_{i,j,k} ∈ H⁰(V_{G_{r(n)}}, O) and ‖c_{i,j,k}‖ ≤ C′p^{(n−1)(i+j+k)}, normed by ‖f‖\_n = sup ‖c_{i,j,k}p^{(n−1)(i+j+k)}‖ (a C-Banach algebra, independent of the choice of x_n, e_{1,n}, t_n). Its unit ball is ∏\_{i,j,k} H⁰(V_{G_{r(n)}}, O⁺) as a topological Z_p-module. For each m there is n with G_m-analytic vectors ⊂ O_n(U){x, e₁, t} ⊂ G_{r(n)}-analytic vectors, so O^la_{K^p}(U) = colim_n O_n(U){x, e₁, t}. In weight χ = (n₁, n₂), A_n ⊂ O^{la,χ}\_{K^p}(U) is the subspace of t^{n₁}e₁^{n₂−n₁}Σ\_i c_i(x − x_n)^i with ‖e₁^{n₂−n₁}c_i p^{(n−1)i}‖ bounded (c_i ∈ H⁰(V_{G_{r(n)}}, ω^{n₁−n₂})), a Banach space, and O^{la,χ}\_{K^p}(U) = colim A_n as LB-spaces; B_n ⊂ ω^{k,la,χ}(U) is defined likewise and H⁰(V_{G_{r(n)}}, ω^k) ⊗ A_n = B_n.

**Hypotheses.**
- U ∈ 𝔅 with e₁ a generator; the weight χ is integral for A_n.

**Construction or proof.**
- Norm and completeness follow from the product description of the unit ball (Pan I Definition 4.3.10).
- Independence of choices: changing x_n, e_{1,n}, t_n rescales by power series with bounded coefficients (Pan I Remark 4.3.11).
- The sandwich between analytic vectors is Theorem 4.3.9 with Remark 4.3.12; A_n is the weight-χ slice (Pan II §3.2.7, displays (3.2.1)–(3.2.2)).

**Uses.**
- Pan I Lemma 4.3.14 and Proposition 4.3.15, p. 43: Čech complexes of the unit balls are computed termwise from finite level.
- Pan II Proposition 3.2.11, pp. 22–23: essential vanishing of Čech cohomology of the weight-χ pieces.
- Pan II Proposition 3.3.8, p. 26: the Hodge–Tate decomposition of A_n by its K-structure.

**API.**
- `AnalyticBanach.On` (data): O_n(U){x, e₁, t} as a C-Banach algebra with norm ‖·‖\_n.
- `AnalyticBanach.coeff` (projection): The continuous coefficient maps f ↦ c^{(n)}\_{i,j,k}(f) into H⁰(V_{G_{r(n)}}, O).
- `AnalyticBanach.unitBall_equiv` (equivalence): Unit ball ≅ ∏\_{i,j,k} H⁰(V_{G_{r(n)}}, O⁺) via f ↦ (c_{i,j,k}p^{(n−1)(i+j+k)}).
- `AnalyticBanach.sandwich` (compatibility): For each m there is n with O_{K^p}(U)^{G_m-an} ⊂ O_n(U){x, e₁, t} ⊂ O_{K^p}(U)^{G_{r(n)}-an}, continuously.
- `AnalyticBanach.colim` (characterisation): O^la_{K^p}(U) = colim_n O_n(U){x, e₁, t}, and O^{la,χ}(U) = colim_n A_n as LB-spaces.
- `AnalyticBanach.twist` (relation): H⁰(V_{G_{r(n)}}, ω^k) ⊗ A_n = B_n.

**Unit tests.**
- `AnalyticBanach.constant` (degenerate): Sections pulled back from level G_{r(n)} are the f with c_{i,j,k} = 0 unless i = j = k = 0, and ‖f‖\_n is their sup norm.
- `AnalyticBanach.x_expansion` (computation): x ∈ O_n(U){x, e₁, t} with c_{0,0,0} = x_n, c_{1,0,0} = 1 and all other coefficients zero, so ‖x‖\_n = max(‖x_n‖, p^{n−1}).
- `AnalyticBanach.norm_decreases` (compatibility): The inclusion O_n(U){x, e₁, t} → O_{n+1}(U){x, e₁, t} has norm at most 1 when the choices at level n + 1 refine those at level n.
- `AnalyticBanach.not_sup_norm` (non-example): ‖·‖\_n is not the supremum norm of functions: x − x_n has ‖x − x_n‖\_n = p^{n−1} (coefficient c_{1,0,0} = 1) while |x − x_n| ≤ p^{−n} pointwise on V_∞.

**Acceptance.**
- A_n ≅ O⁺(V_{G_{r(n)}})[[(x − x_n)/p^{n−1}]] ⊗ Q_p after fixing a generator of ω^{n₁−n₂} at level G_{r(n)} (Pan II (3.2.2)).

**Prerequisites.** LA.2/power-series-expansion.

**Source.** Pan I, Definition 4.3.10, Remarks 4.3.11–4.3.12, p. 42: The Banach algebras of convergent expansions, their norms, the product description of the unit ball, independence of choices and the sandwich between analytic vectors. Pan II, §3.2.7 with (3.2.1)–(3.2.2), pp. 20–21: The weight-χ Banach spaces A_n and B_n, the LB-structure as their colimit and the formal power series model.

### LA.2/la-acyclicity-on-the-basis — Strong LA-acyclicity of O_{K^p}(U)

*Theorem.*

**Statement.** For every U ∈ 𝔅, the K_p-Banach representation O_{K^p}(U) is strongly LA-acyclic. Moreover for a finite rational cover 𝔘 of V_{K_p}, Ȟ^i(𝔘, ∏\_{i,j,k} O⁺\_{r(n)}) ⊗ Q_p = 0 and the systems {Ȟ^i(𝔘, Õ\_n)}\_n are essentially zero for i ≥ 1.

**Hypotheses.**
- U ∈ 𝔅; Õ\_n is the sheaf of G_n-analytic sections of the push-forward to V_{K_p}.

**Construction or proof.**
- The map φ\_n from ∏ O⁺\_{r(n)} ⊗ Q_p to Õ^la given by the expansion is an isomorphism onto its image, sandwiched between analytic pieces (LA.2/analytic-banach-algebras).
- Tate acyclicity at finite level kills Ȟ^i of the unit balls up to bounded p-power (Pan I Lemma 4.3.14).
- Cover V_{K_p} by small rational opens whose preimages are locally analytic coverings (LA.1/modular-coverings-are-locally-analytic) and apply LA.0/acyclicity-for-covers-by-small-opens (Pan I Proposition 4.3.15).

**Acceptance.**
- Consequently H^j(U, O^la_{K^p}) = 0 for j > 0 and U ∈ 𝔅.

**Prerequisites.** LA.2/analytic-banach-algebras; LA.1/modular-coverings-are-locally-analytic; LA.0/acyclicity-for-covers-by-small-opens.

**Source.** Pan I, §4.3.13, Lemma 4.3.14, Proposition 4.3.15, pp. 42–43: Sheaf-theoretic form of the expansion, essential vanishing of Čech cohomology of the analytic pieces, and strong LA-acyclicity of O_{K^p}(U) for U ∈ 𝔅.

### LA.2/completed-cohomology-as-perfectoid-cohomology — Completed cohomology is the cohomology of O⁺ on the perfectoid modular curve

*Theorem.*

**Statement.** For every i there are natural GL_2(Q_p)- and prime-to-p-Hecke-equivariant almost isomorphisms of O_C-modules H̃^i(K^p, Z/p^n) ⊗ O_C/p^n ≅ H^i(X_{K^p}, O⁺/p^n) (analytic topology) and H̃^i(K^p, Z_p) ⊗̂ O_C ≅ H^i(X_{K^p}, O⁺). Hence H̃^i(K^p, C) := H̃^i(K^p, Z_p) ⊗̂ C ≅ H^i(X_{K^p}, O), a Q_p-Banach representation of GL_2(Q_p).

**Hypotheses.**
- K^p is as in LA.1/fake-hasse-invariants; X_{K^p} is the compactified perfectoid curve, which is harmless because the restriction from compactified to open curves is an isomorphism on colim_{K_p} H^i(−, Z/p^n).

**Construction or proof.**
- Compare singular and étale cohomology at finite level and apply the (log) primitive comparison theorem, then pass to the colimit over K_p, as in Scholze's Theorem IV.2.1 (Pan I Theorem 4.4.2).
- Compute H^i(X_{K^p}, O⁺) and H^i(X_{K^p}, O⁺/p^n) by one Čech complex on a finite affinoid perfectoid cover (almost acyclicity) and pass to the limit with the bounded-torsion lemma CC.2/complete-torsion-free-complex-control (Pan I Corollary 4.4.3, Lemma 4.4.4).
- H̃^i(K^p, Z_p) is p-torsion free here (Pan I Remark 4.4.5), which simplifies the limit argument.

**Acceptance.**
- For i = 0 both sides are the locally constant functions on π\_0(X_{K^p}) = lim π\_0(X_{K^pK_p}) with values in O_C, up to almost zero.

**Prerequisites.** CompletedCohomologyAndLocalGlobalCompatibility:R31.1; CompletedCohomologyPartII:CC.2/coefficient-limit-completion; CompletedCohomologyPartII:CC.2/complete-torsion-free-complex-control; PadicHodgeTheory:P8/early-primitive-comparison-and-finiteness; HodgeTateAndCanonicalSubgroups:T6:comparison/log-primitive-comparison; DiamondsAndVStacks:D2/higher-v-acyclicity; PerfectoidShimuraVarieties:S5/modular-tower-comparison.

**Source.** Pan I, §4.4.1, Theorem 4.4.2, Corollary 4.4.3, Lemma 4.4.4, Remark 4.4.5, pp. 43–45: Completed cohomology of modular curves, its almost identification with the analytic cohomology of O⁺/p^n and O⁺ on the perfectoid modular curve via the primitive comparison theorem, and the limit lemma for bounded torsion.

### LA.2/locally-analytic-completed-cohomology — Locally analytic vectors of completed cohomology as cohomology on the flag variety

*Theorem.* Planet: *H̃^i(K^p,C)^la = H^i(Fl, O^la)*.

**Statement.** For every i there are natural GL_2(Q_p)- and Hecke-equivariant isomorphisms H̃^i(K^p, C) ≅ H^i(Fl, O_{K^p}) and H̃^i(K^p, C)^la ≅ H^i(Fl, O^la_{K^p}), both computed by the Čech complex of any finite cover of Fl by elements of 𝔅 (for instance {U₁, U₂}).

**Hypotheses.**
- The locally analytic vectors are for GL_2(Q_p); H̃^i(K^p, Z_p) is an admissible GL_2(Q_p)-representation.

**Construction or proof.**
- R^jπ\_{HT\*}O = 0 for j > 0 by almost acyclicity on the affinoid perfectoid preimages of U ∈ 𝔅, so H^i(X_{K^p}, O) = H^i(Fl, O_{K^p}) (Pan I proof of Theorem 4.4.6).
- H^j(U, O^la_{K^p}) = 0 for U ∈ 𝔅, j > 0, by LA.2/la-acyclicity-on-the-basis and Cartan's criterion; so Čech complexes compute both cohomologies.
- The Čech complex of O_{K^p} is strict (bounded torsion of H^i(Fl, O⁺\_{K^p})), its terms are LA-acyclic and its cohomology H̃^i(K^p, C) is LA-acyclic by admissibility (Schneider–Teitelbaum, Pan I Corollary 2.2.4); Pan I Lemma 2.2.2(2) gives the claim.

**Acceptance.**
- Theorem 1.0.9 of Pan I is this statement; for i = 0 it recovers H⁰(Fl, O^la) = colim H⁰(X_{K^pK_p}, O).

**Prerequisites.** LA.2/completed-cohomology-as-perfectoid-cohomology; LA.2/la-acyclicity-on-the-basis; CompletedCohomologyPartII:CC.5/banach-admissibility; DiamondsAndVStacks:D2/higher-v-acyclicity; LocallyAnalyticDistributions:L0.

**Source.** Pan I, Theorem 4.4.6 with proof, pp. 45–46; Theorem 1.0.9, p. 6: The isomorphisms H̃^i(K^p, C) ≅ H^i(Fl, O_{K^p}) and H̃^i(K^p, C)^la ≅ H^i(Fl, O^la_{K^p}), proved by Čech complexes on 𝔅 and the acyclicity of taking locally analytic vectors.

### LA.2/weight-sheaves — The weight sheaves O^{la,χ} and their sections

*Definition.* Planet: *Weight sheaves O^{la,χ}*.

**Statement.** For a weight χ = (n₁, n₂) of h, O^{la,χ}\_{K^p} ⊂ O^la_{K^p} is the χ-isotypic subsheaf for θ\_h (LA.1/horizontal-cartan-action); likewise ω^{k,la,χ}\_{K^p}. On U ∈ 𝔅 with e₁ a generator: H^i(h, O^la_{K^p}(U) ⊗ χ) = 0 for i ≥ 1, and every f ∈ O^{la,χ}\_{K^p}(U) is (t/t_N)^{n₁}(e₁/e_{1,N})^{n₂−n₁}Σ\_{i≥0} c^{(n)}\_i(f)(x − x_n)^i for n > N large, with c^{(n)}\_i(f) ∈ H⁰(V_{G_{r(n)}}, O) and ‖c^{(n)}\_i(f)‖ ≤ C′p^{(n−1)i}. For integral χ this reads f = t^{n₁}e₁^{n₂−n₁}Σ\_i c_i(x − x_n)^i with c_i ∈ H⁰(V_{G_{r(n)}}, ω^{n₁−n₂}), every G_n-analytic vector arises this way and f = 0 iff all c_i = 0; for ω^{k,la,χ} the c′\_i lie in H⁰(V_{G_{r(n)}}, ω^{n₁−n₂+k}). The n-finite part, the f with finitely many nonzero c_i at some level, is dense and equals ω^{n₁−n₂+k,sm}\_{K^p}(U) ⊗\_{Q_p} M^∨\_{(n₂,n₁)}, M^∨ the dual Verma-type module of polynomials in x. Multiplication by t^k identifies O^{la,(n₁,n₂)} with O^{la,(n₁+k,n₂+k)}.

**Hypotheses.**
- χ is a C-linear functional on h; integrality n₁, n₂ ∈ Z is assumed in Pan II and wherever ω-coefficients are used.

**Construction or proof.**
- Since θ\_h(diag(a, d)) acts on expansion coefficients by c_{i,j,k} ↦ d(j+1)c_{i,j+1,k} + (a + d)(k+1)c_{i,j,k+1}, the χ-isotypic condition fixes the j- and k-dependence as the binomial expansions of (t/t_N)^{n₁}(e₁/e_{1,N})^{n₂−n₁} (Pan I §5.1.1, Lemma 5.1.2).
- The h-cohomology vanishing follows from the same coefficient recursion (Pan I Lemma 5.1.2(1)).
- For integral weights rewrite with e₁^{n₂−n₁}t^{n₁} and ω-valued coefficients (Pan II Theorem 3.2.2, Corollary 3.2.3, Remark 3.2.4).

**Uses.**
- Pan I §§5.2–5.4: n-cohomology is computed weight by weight.
- Pan II §4: d_{k+1}, d̄\_{k+1} and I_k are maps between weight sheaves.
- Pan II §6.2.3: the χ̃\_k-isotypic parts of the period sheaves.

**API.**
- `WeightSheaf.mk` (constructor): O^{la,χ}\_{K^p} as the χ-eigensheaf of θ\_h; ω^{k,la,χ}\_{K^p} likewise.
- `WeightSheaf.expansion` (characterisation): Every section over U is t^{n₁}e₁^{n₂−n₁}Σ\_i c_i(x − x_n)^i with c_i ∈ H⁰(V_{G_{r(n)}}, ω^{n₁−n₂}) and the stated bounds, uniquely.
- `WeightSheaf.h_cohomology` (other): H^i(h, O^la(U) ⊗ χ) = 0 for i ≥ 1, so taking χ-parts is exact on O^la(U).
- `WeightSheaf.twist_t` (relation): ·t^k: O^{la,(n₁,n₂)} ≅ O^{la,(n₁+k,n₂+k)}.
- `WeightSheaf.nfinite` (equivalence): ω^{k,la,χ}(U)^{n-fin} ≅ ω^{n₁−n₂+k,sm}(U) ⊗ M^∨\_{(n₂,n₁)}, dense in ω^{k,la,χ}(U).
- `WeightSheaf.mul` (structure): O^{la,χ} · O^{la,χ′} ⊂ O^{la,χ+χ′}.

**Unit tests.**
- `WeightSheaf.t_power` (computation): t^{n₁}e₁^{n₂−n₁} (with e₁ read through ω) lies in O^{la,(n₁,n₂)}(U)·ω^{n₂−n₁}, and t ∈ O^{la,(1,1)}.
- `WeightSheaf.zero_weight` (compatibility): O_Fl ⊂ O^{la,(0,0)} and O^sm ⊂ O^{la,(0,0)}; O^{la,(0,0)}(U) ∩ ker(gl_2) = O^sm(U).
- `WeightSheaf.global_sections` (computation): H⁰(Fl, O^{la,χ}) = 0 unless χ(h) = 0 (Pan I Corollary 5.1.3(1)).
- `WeightSheaf.not_lie_weight` (non-example): O^{la,χ} is not the χ-weight space for the Lie action of the diagonal torus of gl_2(Q_p): x ∈ O^{la,(0,0)} but h·x = −2x for the Lie action.

**Acceptance.**
- For χ = (0, 0), O^{la,(0,0)}(U) ⊃ O_Fl(U) ⊗ O^sm(U) with dense image (Pan II Theorem 1.2.7, first claim).

**Prerequisites.** LA.2/power-series-expansion; LA.1/horizontal-cartan-action; LA.1/automorphic-twists.

**Source.** Pan I, §5.1.1 and Lemma 5.1.2, pp. 46–47: θ\_h on the expansion coefficients, vanishing of h-cohomology and the explicit form of χ-isotypic sections. Pan II, §3.2.1, Theorem 3.2.2, Corollary 3.2.3, Remark 3.2.4, pp. 19–20: Integral weights, the explicit description of sections of O^{la,χ} and ω^{k,la,χ} with coefficients in ω^{n₁−n₂(+k)} at finite level, the dense n-finite part as ω^{sm} ⊗ M^∨ and twisting by t.

### LA.2/locally-algebraic-subsheaves — Locally algebraic subsheaves and the twisting isomorphism

*Definition.*

**Statement.** For k ≥ 0 and χ = (0, k), the k-th symmetric power of V(1) → ω\_{K^p} gives Sym^k V(k) → ω^k_{K^p}, the natural map from H⁰(Fl, ω\_Fl^k)(k), and hence an injective map Sym^k V(k) ⊗ ω^{−k,sm}\_{K^p} → O^{la,(0,k)}\_{K^p} whose image O^{lalg,(0,k)}\_{K^p} is exactly the GL_2(Q_p)-locally algebraic vectors of O^{la,(0,k)}; for χ = (n₁, n₁ + k) twist by t^{n₁}. There is a natural isomorphism ω^{k,sm}\_{K^p} ⊗\_{O^sm_{K^p}} O^{la,χ}\_{K^p} ≅ ω^{k,la,χ}\_{K^p} (and without weights ω^{k,sm} ⊗\_{O^sm} O^la ≅ ω^{k,la}).

**Hypotheses.**
- k ≥ 0 for the locally algebraic part; χ integral.

**Construction or proof.**
- The map is injective and lands in weight (0, k) by the weight computation of e₁, e₂ (Pan II §3.2.5).
- Locally algebraic vectors are characterised by the n-finite, algebraic expansions of LA.2/weight-sheaves (Pan II Definition 3.2.6).
- The twisting isomorphism is the colimit of H⁰(V_{G_{r(n)}}, ω^k) ⊗ A_n = B_n (Pan II Lemma 3.2.8, Remark 3.2.9).

**Uses.**
- Pan II Proposition 4.2.9, pp. 40–41: ker d̄\_{k+1} is the locally algebraic subsheaf.
- Pan II §5.2.13 and §5.3.15: the analogues on the Lubin–Tate and Drinfeld towers.

**API.**
- `LocAlg.sheaf` (data): O^{lalg,χ}\_{K^p} ⊂ O^{la,χ}\_{K^p} for χ = (n₁, n₁ + k), k ≥ 0.
- `LocAlg.equiv` (equivalence): Sym^kV(k) ⊗ ω^{−k,sm}\_{K^p} · t^{n₁} ≅ O^{lalg,(n₁,n₁+k)}\_{K^p}.
- `LocAlg.characterisation` (characterisation): A section of O^{la,χ} is locally algebraic iff it lies in O^{lalg,χ}.
- `LocAlg.twist_iso` (equivalence): ω^{k,sm} ⊗\_{O^sm} O^{la,χ} ≅ ω^{k,la,χ}.

**Unit tests.**
- `LocAlg.k_zero` (degenerate): O^{lalg,(0,0)}\_{K^p} = O^sm_{K^p}.
- `LocAlg.k_one` (computation): For k = 1, the sections e₁·s and e₂·s with s ∈ ω^{−1,sm} span O^{lalg,(0,1)} and correspond to V(1) ⊗ ω^{−1,sm}.
- `LocAlg.algebraic_vectors` (compatibility): GL_2(Q_p) acts on O^{lalg,(0,k)} through Sym^kV(k) ⊗ (smooth), so its vectors are locally algebraic in the sense of Emerton.
- `LocAlg.negative_k` (non-example): For χ = (0, k) with k < 0 the locally algebraic part is 0: the expansion has no polynomial terms of negative degree.

**Acceptance.**
- For k = 0, O^{lalg,(0,0)} = O^sm.

**Prerequisites.** LA.2/weight-sheaves; LA.2/analytic-banach-algebras; LA.1/automorphic-twists.

**Source.** Pan II, §3.2.5, Definition 3.2.6, Lemma 3.2.8, Remark 3.2.9, pp. 20–21: The locally algebraic subsheaf as the image of Sym^kV(k) ⊗ ω^{−k,sm}, and the isomorphism ω^{k,sm} ⊗\_{O^sm} O^{la,χ} = ω^{k,la,χ}.

### LA.2/cech-cohomology-essentially-zero — Essential vanishing of Čech cohomology of the analytic pieces, and extension to the larger cover

*Theorem.*

**Statement.** Let 𝔘 be a finite cover of some U ∈ 𝔅 by elements of 𝔅 and G_0 = 1 + p^mM_2(Z_p) stabilising its members. For i ≥ 1 and n ≥ 0 the map Ȟ^i(𝔘, O^{G_n-an,χ}\_{K^p}) → Ȟ^i(𝔘, O^{G_m-an,χ}\_{K^p}) is zero for m large. For the covers 𝔘 = {U₁ = {|x| ≤ 1}, U₂ = {|x| ≥ 1}} and 𝔘′ = {U′₁ = {|x| ≤ |p^{−1}|}, U′₂ = {|x| ≥ |p|}} of Fl, for every n there is m ≥ n such that the image of Ȟ¹(𝔘, O^{G_n-an,χ}) in Ȟ¹(𝔘, O^{G_m-an,χ}) lies in the image of Ȟ¹(𝔘′, O^{G_m-an,χ}): every G_n-analytic section s on U₁ ∩ U₂ has G_m-analytic s_i on U_i with s + s₁ + s₂ extending G_m-analytically to U′₁ ∩ U′₂.

**Hypotheses.**
- χ integral; U′\_i are diag(p, 1)^{±1}-translates of U_i, so the results for 𝔅 apply to them.

**Construction or proof.**
- Replace sections over each U_I by the Banach spaces A_{I,n}; the Čech complex becomes a countable product of Čech complexes of O⁺ at level G_{r(n)}, killed in positive degree by a power of p by Tate acyclicity (Pan II Proposition 3.2.11).
- Apply Proposition 3.2.11 to the cover {U₁, U′₁ ∩ U₂} of U′₁ and then to {U₂, U′₁ ∩ U′₂} of U₂ (Pan II Corollary 3.2.13).

**Acceptance.**
- In degree 0 there is no essential vanishing: Ȟ⁰ is the sections, which grow with n.

**Prerequisites.** LA.2/analytic-banach-algebras; LA.2/weight-sheaves.

**Source.** Pan II, §3.2.10, Proposition 3.2.11, §3.2.12, Corollary 3.2.13, pp. 22–23: Čech complexes of the G_n-analytic subsheaves, essential vanishing of their higher cohomology, the two covers 𝔘 and 𝔘′ and the extension of sections to the larger cover.

### LA.2/cohomology-of-weight-sheaves — Cohomology of O^{la,χ} against the χ-part of completed cohomology

*Theorem.*

**Statement.** (1) θ\_h(h) = 0 and θ\_h(z) = z on H⁰(Fl, O^la_{K^p}); in particular H⁰(Fl, O^{la,χ}) = 0 if χ(h) ≠ 0. (2) If χ(h) ≠ 0 then H¹(Fl, O^{la,χ}) = H¹(Fl, O^la)\_χ, the χ-isotypic part for θ\_h. If χ(h) = 0, χ = (n₁, n₁), there is a g-equivariant exact sequence 0 → colim_{K_p} H⁰(X_{K^pK_p}, O)·(t/t_N)^{n₁} → H¹(Fl, O^{la,χ}) → H¹(Fl, O^la)\_χ → 0.

**Hypotheses.**
- The Čech complex of {U₁, U₂} computes both sides (LA.2/locally-analytic-completed-cohomology).

**Construction or proof.**
- Global sections of O^la are smooth functions on the components, of weight given by t-powers (Pan I Corollary 5.1.3(1)).
- Apply h-cohomology to the two-term Čech complex using the vanishing H^i(h, O^la(U) ⊗ χ) = 0 of LA.2/weight-sheaves (Pan I Corollary 5.1.3(2) and footnote 2).

**Acceptance.**
- For χ = (0, 0) the extra term is H̃⁰(K^p, C)^sm, the source of the k = 1 discrepancy in Pan II §1.2.5 and (3.4.1).

**Prerequisites.** LA.2/weight-sheaves; LA.2/locally-analytic-completed-cohomology.

**Source.** Pan I, Corollary 5.1.3 with footnote 2, pp. 47–48: Weights on global sections and the relation between H¹ of O^{la,χ} and the χ-part of H¹ of O^la, with the extra H⁰ term when χ(h) = 0. Pan II, display (3.4.1), p. 32: The same sequence in weight (0, 0), quoted from Pan I Corollary 5.1.3(2).

<a id="la3"></a>

## LA.3. Geometric Sen theory and the topology of the cohomology

Define Sen operators and Hodge–Tate weights for semilinear C-Banach representations through the decompletion W ↦ W^K (Pan I Definition 5.1.5, Pan II §3.3); prove that θ\_h(diag(0, 1)) is the unique Sen operator on O^la_{K^p}(U) and on H^i(Fl, O^la_{K^p}) = H̃^i(K^p, C)^la (Pan I Theorems 5.1.8, 5.1.11), that the G_n-analytic vectors of O^{la,(n₁,n₂)}(U) are Hodge–Tate of weight −n₂ and their Čech cohomology too (Pan II Propositions 3.3.8, 3.4.10), and that restriction to a strictly smaller open is compact after decompletion (Pan II Proposition 3.3.10). Topologise H^i(Fl, O^{la,χ}) as an LB-space through the strict Čech complexes of analytic vectors and prove it Hausdorff, with compact transition maps and analytic vectors coming from a finite level (Pan II §3.4).

**Depends on.** LA.1, LA.2, LocallyAnalyticDistributions:L0, LocallyAnalyticDistributions:L4, PadicHodgeTheory:P7, PadicHodgeTheory:R06.1, PadicHodgeTheory:R06.2.

### LA.3/banach-sen-operator — Sen operators and Hodge–Tate weights of semilinear C-Banach representations

*Definition.* Planet: *Sen operator on C-Banach representations*.

**Statement.** Let K ⊂ C be a finite extension of Q_p, K_∞ the maximal Z_p-extension of K in K(μ\_{p^∞}) (fixed field of the kernel H_K of the projection ε̃\_p of the cyclotomic character to 1 + 2pZ_p), so Gal(K_∞/K) ≅ Z_p with Lie algebra identified with Q_p through the cyclotomic character. For a C-Banach space W with continuous semilinear G_K-action let W^K be the K-Banach space of G_{K_∞}-fixed, G_K-analytic vectors and φ\_K: C ⊗̂\_K W^K → W the induced map. When φ\_K is an isomorphism, the action of 1 ∈ Lie Gal(K_∞/K) on W^K is K-linear; its C-linear extension is the Sen operator θ\_Sen of W. More generally (Pan I Definition 5.1.5) a continuous C-linear θ\_Sen on W is a Sen operator if it extends the action of 1 ∈ Q_p = Lie Gal(Q_p(μ\_{p^∞})/Q_p) on the G_{K(μ\_{p^∞})}-smooth, G_K-locally analytic vectors, and for W = colim W_n (C-Banach, increasing) θ is a Sen operator if it preserves each W_n and is one there. W is Hodge–Tate of weights {w₁, …, w_n} ⊂ Z if for some finite L ⊃ K, φ\_L is an isomorphism and θ\_Sen acts semisimply on W^L with eigenvalues −w₁, …, −w_n, all eigenspaces nonzero; then W = ⊕ C ⊗̂\_L W^L_{−w_i}, independent of L. W has pure Hodge–Tate–Sen weight k ∈ C if −k is a Sen operator.

**Hypotheses.**
- Convention (Pan I p. 4 and Pan II): the cyclotomic character has Hodge–Tate weight −1; PadicHodgeTheory R06.2 uses +1, so weights here are the negatives of the R06.2 weights.

**Construction or proof.**
- For finite-dimensional W this is Sen's operator: Sen proves existence and uniqueness (Pan I Remark 5.1.7; PadicHodgeTheory P7/sen-module).
- Base change of a trivial-action Banach space: if X^K = X then (C ⊗̂\_K X)^K = X (Pan II Proposition 3.3.3).
- Kernels, closed subspaces and strict quotients of maps between representations with φ\_K an isomorphism again have φ\_K an isomorphism (Pan II Corollary 3.3.4), by exactness of C ⊗̂\_K (−) on Banach spaces (orthonormal bases).
- Tate's normalised trace gives L ⊗\_K W^K = W^L for finite L/K, so the notion does not depend on K (Pan II §3.3.2).

**Uses.**
- Pan I Theorems 5.1.8 and 5.1.11, pp. 48–49: θ\_h(diag(0, 1)) is the Sen operator.
- Pan II Proposition 3.3.8, p. 26: the analytic vectors of O^{la,χ}(U) are Hodge–Tate of weight −n₂.
- Pan II §6.1, pp. 84–92: Fontaine's operator for Banach B⁺\_dR/(t^k)-modules generalises this decompletion.

**API.**
- `BanachSen.decompletion` (data): W ↦ W^K, the G_{K_∞}-fixed G_K-analytic vectors, a K-Banach space.
- `BanachSen.phi` (constructor): φ\_K: C ⊗̂\_K W^K → W.
- `BanachSen.senOperator` (data): θ\_Sen ∈ End_C(W), when φ\_K is an isomorphism.
- `BanachSen.IsHodgeTate` (characterisation): W is Hodge–Tate of weights {w_i} iff φ\_L is an isomorphism and θ\_Sen is semisimple on W^L with eigenvalues −w_i.
- `BanachSen.ker_coker` (functoriality): For a continuous C-linear G-map φ between representations with φ\_K bijective, ker φ and the quotient by a strict image again have φ\_K bijective.
- `BanachSen.base_change` (simp): (C ⊗̂\_K X)^K = X when X^K = X.
- `BanachSen.finite_dim` (compatibility): For dim_C W < ∞ the Sen operator is Sen's operator of PadicHodgeTheory P7/sen-module (with the sign convention fixed above).

**Unit tests.**
- `BanachSen.tate_twist` (computation): C(j) has Sen operator multiplication by j, hence is Hodge–Tate of weight −j here (and +j in R06.2's convention).
- `BanachSen.trivial` (degenerate): C ⊗̂\_{Q_p} X with X a Q_p-Banach space with trivial action is Hodge–Tate of weight 0, with Sen operator 0.
- `BanachSen.finite_dim_agrees` (compatibility): For W = C ⊗\_{Q_p} V with V a finite-dimensional p-adic representation, θ\_Sen is Sen's operator of V.
- `BanachSen.not_derivative_of_full_action` (non-example): The Sen operator is not the derivative of the whole G_K-action: for an unramified character Q_p(μ) with μ(Frob) of infinite order, G_K acts nontrivially on C(μ) but θ\_Sen = 0, as inertia acts trivially.

**Acceptance.**
- For W = C(j), W^K = K·b_j with b_j a basis of Q_p(j), on which 1 ∈ Lie Gal(K_∞/K) acts by j; so θ\_Sen = j and C(j) has Hodge–Tate weight −j in this convention.

**Prerequisites.** PadicHodgeTheory:P7/sen-module; PadicHodgeTheory:R06.1/tate-sen-theorem; PadicHodgeTheory:R06.1/ax-sen-tate-invariants; PadicHodgeTheory:R06.2/arithmetic-sen-descent-for-coefficients; PadicHodgeTheory:R06.2/plan/hodge-tate-weight-convention; mathlib:cyclotomicCharacter; LocallyAnalyticDistributions:L0.

**Source.** Pan I, §5.1.4, Definition 5.1.5, Remarks 5.1.6–5.1.7, p. 48: Definition of a Sen operator on C-Banach spaces and their increasing unions with semilinear Galois action, and of pure Hodge–Tate–Sen weight. Pan II, §3.3.2–Definition 3.3.6 and Remark 3.3.7, pp. 24–26: The field K_∞, the decompletion W ↦ W^K, Proposition 3.3.3, Corollary 3.3.4, the Sen operator and the definition of Hodge–Tate C-Banach representations with their weight decomposition.

### LA.3/theta-h-is-the-sen-operator — θ\_h(diag(0, 1)) is the Sen operator

*Theorem.* Planet: *θ\_h is the Sen operator*.

**Statement.** G_{Q_p} acts continuously on X_{K^p}, commuting with GL_2(Q_p) and Hecke operators, hence on O^la_{K^p} and O^{la,χ}\_{K^p}; for U ∈ 𝔅 the affinoids V_{G_n} and their preimages are defined over a finite extension K of Q_p. Then θ\_h(diag(0, 1)) is the unique Sen operator on O_{K^p}(U)^la, and on H^i(Fl, O^la_{K^p}) = H̃^i(K^p, C)^la for every i. In particular, for every finite-dimensional C-semilinear G_{Q_p}-subrepresentation of H̃^i(K^p, C)^la it agrees with Sen's operator.

**Hypotheses.**
- U ∈ 𝔅; K is a finite extension over which V_{G_0} is defined (Pan II §3.3.1).

**Construction or proof.**
- Write sections by the expansion of LA.2/power-series-expansion; G_K acts on t, e₁, e₂ through the cyclotomic character and fixes x (Pan II §3.3.1).
- Compute the derivative of the G_K-action on the decompleted expansions and compare with the coordinate formula for θ\_h (Pan I Theorem 5.1.8, by explicit calculation; Remark 5.1.10).
- Pass to H¹ through the two-term Čech complex of {U₁, U₂} with the bounds of Pan I Lemma 5.1.13 (Pan I Theorem 5.1.11).

**Acceptance.**
- On t, θ\_h(diag(0, 1))t = t and G_{Q_p} acts on t through the cyclotomic character, whose Sen operator is 1: consistent.

**Prerequisites.** LA.3/banach-sen-operator; LA.1/horizontal-cartan-action; LA.2/power-series-expansion; LA.2/locally-analytic-completed-cohomology.

**Source.** Pan I, Theorem 5.1.8, Remarks 5.1.9–5.1.10, Theorem 5.1.11, Lemma 5.1.13, Remarks 5.1.14–5.1.16, pp. 48–51: θ\_h(diag(0,1)) is the unique Sen operator on O_{K^p}(U)^la and on H̃^i(K^p, C)^la, proved by explicit calculation. Pan II, §3.3.1, pp. 23–24: The Galois action on the sheaves and the fields of definition of the affinoids in 𝔅.

### LA.3/analytic-vectors-are-hodge-tate — The analytic vectors of O^{la,(n₁,n₂)} are Hodge–Tate of weight −n₂

*Theorem.*

**Statement.** For an integral weight χ = (n₁, n₂) and U ∈ 𝔅, the C-Banach space of G_n-analytic vectors of O^{la,χ}\_{K^p}(U) is Hodge–Tate of weight −n₂ for every n ≥ 0, and so is the Banach space A_n of LA.2/analytic-banach-algebras. Consequently the Čech cohomology Ȟ^\*(O^{G_n-an,χ}\_{K^p}) for {U₁, U₂} is Hodge–Tate of weight −n₂.

**Hypotheses.**
- K contains μ\_{p²} and x_n is defined over K.

**Construction or proof.**
- G_K acts on t, e₁, e₂ by the cyclotomic character and fixes x, so A_n is G_K-stable; its K-form A_{n,K} of series with G_K-invariant coefficients carries the n₂-th power of the cyclotomic character, and A_n = C ⊗̂\_K A_{n,K} by Pan II Proposition 3.3.3 (Pan II Proposition 3.3.8, Lemma 3.3.9).
- Taking G_n-analytic vectors commutes with this base change.
- Čech cohomology inherits the property by Pan II Corollary 3.3.4 (Pan II Proposition 3.4.10).

**Acceptance.**
- Consistency with LA.3/theta-h-is-the-sen-operator: θ\_h(diag(0, 1)) acts on O^{la,(n₁,n₂)} by n₂, the Sen operator, i.e. weight −n₂.

**Prerequisites.** LA.3/banach-sen-operator; LA.2/analytic-banach-algebras; LA.2/weight-sheaves.

**Source.** Pan II, Proposition 3.3.8 and Lemma 3.3.9, pp. 26–27: The G_n-analytic vectors of O^{la,χ}(U) and the spaces A_n are Hodge–Tate of weight −n₂. Pan II, §3.4.9 and Proposition 3.4.10, p. 30: The Čech cohomology of the analytic pieces is Hodge–Tate of weight −n₂.

### LA.3/decompleted-restriction-is-compact — Restriction to a strictly smaller open is compact after decompletion

*Theorem.*

**Statement.** Let χ be integral and U, U′ ∈ 𝔅 be stable under G_0 = 1 + p^lM_2(Z_p), l ≥ 2, with preimages coming from affinoids defined over a finite extension K, and suppose U is a strict neighbourhood of U′ (the closure of U′ lies in U). Then for every n the G_n-analytic vectors of O^{la,χ}(U) and O^{la,χ}(U′) are the base change from K of their K-forms, and the restriction map from the K-form of level n over U to the K-form of level m over U′ is compact for m ≥ n large.

**Hypotheses.**
- U′ ⋐ U strictly; the K-forms are those of LA.3/analytic-vectors-are-hodge-tate.

**Construction or proof.**
- The K-forms are spaces of power series in x − x_n with coefficients in finite-level affinoid algebras over K (LA.3/analytic-vectors-are-hodge-tate).
- Restriction along a strict neighbourhood is compact on the finite-level affinoid algebras, and multiplication of the variable by a topologically nilpotent element is compact (LocallyAnalyticDistributions L4/pan-tate-compactness).

**Acceptance.**
- Over C instead of K the restriction is not compact: C is not locally compact over K, which is why the decompletion is needed.

**Prerequisites.** LA.3/analytic-vectors-are-hodge-tate; LocallyAnalyticDistributions:L4/pan-tate-compactness; mathlib:IsCompactOperator.

**Source.** Pan II, Proposition 3.3.10 and Remark 3.3.11, p. 27: Compactness of restriction to a strictly smaller open after passing to the K-forms of the analytic vectors.

### LA.3/lb-topology-on-cohomology — The LB-space structure on H^i(Fl, O^{la,χ})

*Definition.* Planet: *LB-space structure on H^i(Fl, O^{la,χ})*.

**Statement.** Let G_0 = 1 + p²M_2(Z_p), G_n = G_0^{p^n}. The restriction O_{K^p}(U₁) → O_{K^p}(U₁₂) is a closed embedding, hence so is the map on G_n-analytic vectors, and the two-term Čech complex of G_n-analytic vectors (of weight χ) for {U₁, U₂} is strict; its cohomology Ȟ^\*(O^{G_n-an,χ}\_{K^p}) is a C-Banach space with an analytic G_n-action. The colimit over n is the Čech complex of O^{la,χ}\_{K^p}, which computes H^i(Fl, O^{la,χ}\_{K^p}); give H^i(Fl, O^{la,χ}) the inductive-limit (LB) topology of colim_n Ȟ^i(O^{G_n-an,χ}). For O^la itself (no weight) the same recipe gives an LB structure on H^i(Fl, O^la_{K^p}) equivalent to that of H^i(Fl, O_{K^p})^la = H̃^i(K^p, C)^la (Pan II Remark 3.4.6); a topology on H^i(Fl, ω^{k,la,χ}) is defined the same way (Remark 3.4.7, not used).

**Hypotheses.**
- χ integral; the cover {U₁, U₂} of Fl.

**Construction or proof.**
- Injectivity of O(U₁) → O(U₁₂): a kernel element extends to a global section vanishing on U₂, which is SL_2(Q_p)-invariant (H̃⁰ has trivial SL_2-action, Emerton) and SL_2(Q_p)·U₂ = Fl (Pan II Lemma 3.4.2).
- Strictness: a map i is strict iff (i, w∘i) is, for a continuous involution w — applied to the Weyl element (Pan II Lemma 3.4.3).
- Taking G_n-analytic vectors preserves closed embeddings (Pan II Lemma 2.3.2, imported) and the weight-χ part is a direct factor (Pan II §3.4.4, Definition 3.4.5).
- Equivalence with the topology of H̃^i(K^p, C)^la for O^la by strong LA-acyclicity of O_{K^p}(U_i) and of H⁰(Fl, O_{K^p}) (Pan II Remark 3.4.6); the twisted sheaves by the same strictness argument (Remarks 3.4.7–3.4.8).

**Uses.**
- Pan II Proposition 3.4.11, pp. 30–31: the Hausdorff property.
- Pan II §4.3–4.4: continuity and strictness of H¹(I_k) and finiteness of n-invariants.
- Pan II §6.2.8–6.2.13: the same construction for the period sheaves.

**API.**
- `LBCohomology.levelComplex` (data): The strict two-term complex O^{G_n-an,χ}(U₁) ⊕ O^{G_n-an,χ}(U₂) → O^{G_n-an,χ}(U₁₂).
- `LBCohomology.levelCohomology` (data): Ȟ^i(O^{G_n-an,χ}), a C-Banach space with analytic G_n-action.
- `LBCohomology.topology` (instance): The LB topology on H^i(Fl, O^{la,χ}) = colim_n Ȟ^i(O^{G_n-an,χ}).
- `LBCohomology.weyl_strict` (characterisation): A continuous map i of Banach spaces is strict iff (i, w∘i) is strict for a continuous involution w.
- `LBCohomology.compare` (compatibility): The comparison map H^i(Fl, O^{la,χ}) → H^i(Fl, O_{K^p}) is continuous.

**Unit tests.**
- `LBCohomology.degree_zero` (degenerate): For i = 0, Ȟ⁰(O^{G_n-an,χ}) is the G_n-analytic vectors of H⁰(Fl, O^{la,χ}), so the LB topology is the colimit of these Banach spaces.
- `LBCohomology.restriction_injective` (computation): O_{K^p}(U₁) → O_{K^p}(U₁₂) is injective: the constant function 1 on U₁ restricts to 1, and a section vanishing on U₁₂ vanishes on U₁ by SL_2(Q_p)-invariance.
- `LBCohomology.banach_case` (compatibility): When H^i(Fl, O^{la,χ}) → H^i(Fl, O_{K^p}) is injective, the LB topology is finer than the subspace topology from the Banach space H̃^i(K^p, C).
- `LBCohomology.not_subspace_topology` (non-example): In weight (0, 0) the LB topology on H¹(Fl, O^{la,(0,0)}) cannot be the subspace topology from H¹(Fl, O_{K^p}), since the comparison map is not injective there: its kernel contains the image of colim_{K_p} H⁰(X_{K^pK_p}, O) (Pan I Corollary 5.1.3(2)).

**Acceptance.**
- For i = 0 the topology is that of H⁰(Fl, O^{la,χ}) as a subspace of the locally analytic vectors of H̃⁰(K^p, C).

**Prerequisites.** LA.2/locally-analytic-completed-cohomology; LA.2/weight-sheaves; LA.2/cohomology-of-weight-sheaves; LocallyAnalyticDistributions:L0.

**Source.** Pan II, §3.4.1–Remark 3.4.8, pp. 28–30: Closed embedding of restriction maps, the Weyl-involution strictness criterion, strictness of the Čech complexes of analytic vectors and Definition 3.4.5 of the LB-structure, with its comparison to the other natural topology.

### LA.3/cohomology-is-hausdorff-lb — H^i(Fl, O^{la,χ}) is a Hausdorff LB-space with compact transition maps

*Theorem.*

**Statement.** (1) H^i(Fl, O^{la,χ}\_{K^p}) is a Hausdorff LB-space; the map to H^i(Fl, O_{K^p}) is injective except when i = 1 and χ(h) = 0. (2) In weight (0, 0), the transition maps i_{n,m} on the G_K-invariants of Ȟ¹(O^{G_n-an,(0,0)}) are compact for m large, and ker i_{n,m} stabilises to the kernel of the map to H¹(Fl, O^{la,(0,0)}), a closed subspace. (3) For every n the G_n-analytic vectors of H^i(Fl, O^{la,χ}) lie in the image of Ȟ^i(O^{G_m-an,χ}) for some m ≥ n.

**Hypotheses.**
- χ integral; the K-forms come from a finite extension K over which the opens of the covers are defined.

**Construction or proof.**
- Away from i = 1, χ(h) = 0 the target is Banach and the map injective (Pan I Corollary 5.1.3(2)); by twisting with t reduce the remaining case to (0, 0) (Pan II Proposition 3.4.11).
- Compactness (Cartan–Serre): by LA.2/cech-cohomology-essentially-zero the image of level n lies in the image from 𝔘′ at level m; on G_K-invariants this persists because the images are Hodge–Tate of weight 0, and restriction along the strict neighbourhood U′₁ ∩ U′₂ ⋑ U₁ ∩ U₂ is compact (LA.3/decompleted-restriction-is-compact); conclude by Pan II Lemma 2.2.5 (Pan II Lemma 3.4.13(1)).
- Stabilisation of kernels from the exact sequence (3.4.1) whose extra term is smooth, so finite-dimensional on G_{n+1}-invariants (Pan II Lemma 3.4.13(2)); a compact LB-system with closed stabilising kernels is Hausdorff (Pan II Corollary 2.2.4, imported).
- (3) via Proposition 2.1.5 of Pan II applied to the Banach subspace of G_n-analytic vectors (Pan II Proposition 3.4.14).

**Acceptance.**
- Decompletion of degree-one Čech cohomology: Ȟ¹(O^{G_n-an,(0,0)}) is the C-base change of its G_K-invariants (Pan II Lemma 3.4.12).

**Prerequisites.** LA.3/lb-topology-on-cohomology; LA.3/decompleted-restriction-is-compact; LA.3/analytic-vectors-are-hodge-tate; LA.2/cech-cohomology-essentially-zero; LA.2/cohomology-of-weight-sheaves; LocallyAnalyticDistributions:L0.

**Source.** Pan II, Proposition 3.4.11, Lemmas 3.4.12–3.4.13, (3.4.1), Proposition 3.4.14, pp. 30–33: The cohomology of O^{la,χ} is a Hausdorff LB-space, the degree-one transition maps are compact with stabilising kernels, and analytic vectors come from a finite level.

<a id="la4"></a>

## LA.4. n-cohomology, overconvergent forms and the μ-isotypic decomposition

Define overconvergent modular forms of weight χ as the fibre at ∞ of O^{la,χ} and compare them with the classical M†\_k(K^p) (Pan I Definitions 5.2.3, 5.2.5, Proposition 5.2.6), the smooth sheaves ω^{k,sm} with H^i(Fl, ω^{k,sm}) = colim H^i(X_{K^pK_p}, ω^k) and M_k(K^p) (Pan I Lemma 5.3.5, Definition 5.3.8); compute the n-coinvariants and n-invariants of O^{la,χ} (Pan I Propositions 5.2.10, 5.2.12), the n-cohomology of H¹ for general and for integral weights (Pan I Theorems 5.2.15, 5.3.11, 5.3.13, 5.3.16, 5.3.18), and prove the Hodge–Tate decomposition of H̃¹(C)^la_μ into overconvergent forms of weights k and 2 − k and coherent cohomology (Pan I Theorem 5.4.2) and its weight-one variant with the nilpotent Sen operator (Pan I Theorem 5.4.6).

**Depends on.** LA.1, LA.2, LA.3, AlgebraicModularFormsAndSerreWeights:R15.1, HodgeTateAndCanonicalSubgroups:T3, HodgeTateAndCanonicalSubgroups:T4, ModularCurvesPartII:R13.4a.

### LA.4/smooth-automorphic-sheaves — Smooth automorphic sheaves and classical modular forms at infinite level

*Definition.*

**Statement.** For k ∈ Z let ω^{k,sm}\_{K^p} ⊂ π\_{HT\*}ω^k_{K^p} be the GL_2(Q_p)-smooth sections (equivalently π\_{HT\*} of colim_{K_p} π\_{K_p}^{-1}ω^k). Then H^i(Fl, ω^{k,sm}\_{K^p}) ≅ colim_{K_p} H^i(X_{K^pK_p}, ω^k) for all i, H¹(Fl, ω^{k,sm}) = 0 for k ≥ 2, and the stalk colim_{U∋∞} ω^{k,sm}(U) is the space M†\_k(K^p) of LA.4/overconvergent-modular-forms. The space of classical modular forms of weight k and tame level K^p is M_k(K^p) := H⁰(Fl, ω^{k,sm}\_{K^p}) = colim_{K_p} H⁰(X_{K^pK_p}, ω^k); write M_k = colim_{K^p} M_k(K^p) and H¹(ω^k) = colim_K H¹(X_{K,C}, ω^k), with their GL_2(A_f)-actions.

**Hypotheses.**
- X_{K^pK_p} are the compactified modular curves over C; ω is the Hodge bundle extended over the cusps.

**Construction or proof.**
- π\_{K_p}: X_{K^p} → X_{K^pK_p} has the property that π\_{HT\*} of the colimit of pull-backs is computed on 𝔅, where the preimages come from finite level (Pan I Remark 5.3.4).
- Compute H^i(Fl, ω^{k,sm}) on the Čech complex of {U₁, U₂}: its terms are colimits of finite-level sections over the preimages, so the cohomology is the colimit of finite-level coherent cohomology (Pan I Lemma 5.3.5).
- H¹(X_K, ω^k) = 0 for k ≥ 2 on curves (degree of ω^k exceeds that of the canonical bundle; Pan I Corollary 5.3.6).
- Stalk at ∞: neighbourhoods of ∞ in Fl pull back to strict neighbourhoods of the canonical locus (Pan I Lemmas 5.2.8–5.2.9, 5.3.7).

**Uses.**
- Pan I Theorems 5.3.11–5.4.6, pp. 61–67: the classical terms M_k and H¹(ω^k) in the μ-isotypic decomposition.
- Pan II §4.1, §4.4, §5.5: the operators θ\_{k+1} and d_{k+1} restricted to smooth sections, and the classical-forms term of ker I¹\_k.

**API.**
- `SmoothAut.sheaf` (data): ω^{k,sm}\_{K^p}, the smooth sections of π\_{HT\*}ω^k.
- `SmoothAut.cohomology_iso` (equivalence): H^i(Fl, ω^{k,sm}\_{K^p}) ≅ colim_{K_p} H^i(X_{K^pK_p}, ω^k), GL_2(Q_p)- and Hecke-equivariantly.
- `SmoothAut.classicalForms` (data): M_k(K^p) = H⁰(Fl, ω^{k,sm}\_{K^p}).
- `SmoothAut.h1_vanish` (other): H¹(Fl, ω^{k,sm}\_{K^p}) = 0 for k ≥ 2.
- `SmoothAut.stalk_infinity` (characterisation): colim_{U∋∞} ω^{k,sm}(U) = M†\_k(K^p).
- `SmoothAut.classical_to_oc` (constructor): M_k(K^p) → M†\_k(K^p), restriction to a neighbourhood of ∞, injective.

**Unit tests.**
- `SmoothAut.weight_zero` (computation): M_0(K^p) = colim_{K_p} H⁰(X_{K^pK_p}, O), the locally constant functions on π\_0(X_{K^p}).
- `SmoothAut.weight_negative` (degenerate): M_k(K^p) = 0 for k < 0, since ω has positive degree on every compactified modular curve.
- `SmoothAut.gaga` (compatibility): After C ≅ ℂ, M_k(K^p) is the colimit over K_p of the classical holomorphic modular forms of weight k and level K^pK_p (GAGA, R15.1/all-weight-analytic-comparison).
- `SmoothAut.not_la_sections` (non-example): ω^{k,sm} ≠ ω^{k,la}: e₁^k is a locally analytic but not smooth section of ω^k_{K^p} for k ≠ 0.

**Acceptance.**
- For k = 0, M_0(K^p) = colim H⁰(X_{K^pK_p}, O) = H⁰(Fl, O^la) (locally constant functions on components).

**Prerequisites.** LA.1/locally-analytic-sheaf; LA.1/automorphic-twists; AlgebraicModularFormsAndSerreWeights:R15.1/hodge-bundle-with-tate-curve-normalization; AlgebraicModularFormsAndSerreWeights:R15.1/all-weight-analytic-comparison; AlgebraicModularFormsAndSerreWeights:R15.1; mathlib:ModularForm.

**Source.** Pan I, Definition 5.3.2, Remarks 5.3.3–5.3.4, Lemma 5.3.5, Corollary 5.3.6, Lemma 5.3.7, Definition 5.3.8, pp. 59–60: The smooth subsheaf ω^{k,sm}, its cohomology as the colimit of coherent cohomology at finite level, vanishing of H¹ for k ≥ 2, its stalk at ∞ and the definition of M_k(K^p). Pan I, §1, p. 2–3: M_k and H¹(ω^k) as colimits over all levels, with their GL_2(A_f)-actions.

### LA.4/overconvergent-modular-forms — Overconvergent modular forms of weight χ at infinite level

*Definition.* Planet: *Overconvergent modular forms M†\_χ*.

**Statement.** For a weight χ, M†\_χ(K^p) := H⁰(Fl, O^{la,χ}\_{K^p}/m_∞O^{la,χ}\_{K^p}), the fibre of O^{la,χ} at ∞ ∈ Fl, with its actions of G_{Q_p}, the upper triangular Borel B ⊂ GL_2(Q_p) and prime-to-p Hecke operators. For k ∈ Z, M†\_k(K^p) := colim_n M†\_k(K^pΓ(p^n)), where M†\_k(K^pΓ(p^n)) is the space of sections of ω^k on strict neighbourhoods of X_{K^pΓ(p^n),c}, the tube of the non-supersingular points of the Katz–Mazur components indexed by surjections (Z/p^n)² → Z/p^n killing (1, 0); then colim_n M†\_k(K^pΓ₁(p^n)) = M†\_k(K^p)^{N_0} with N_0 = (1 Z_p; 0 1), and M†\_k(K^p) is recovered by inverting diag(p^{-1}, 1). For χ = (n₁, n₂) integral with k = n₁ − n₂, multiplication by e₂^{−k}t^{n₁} is an isomorphism φ\_χ: M†\_k(K^p) → M†\_χ(K^p) with (g₁, g₂)·φ\_χ(f) = φ\_χ((g₁, g₂)·f) d^{−k} ε\_p(ad)^{n₁} ε\_p(g₂)^{n₁−k} for g₁ = (a b; 0 d) ∈ B and g₂ ∈ G_{Q_p}.

**Hypotheses.**
- ∞ ∈ Fl is the point whose Borel is the rational upper-triangular Borel; m_∞ is its maximal ideal sheaf.

**Construction or proof.**
- The fibre at ∞ is computed from the expansions of LA.2/weight-sheaves on neighbourhoods of ∞, where e₂ is a generator.
- Preimages of neighbourhoods of ∞ are strict neighbourhoods of the canonical locus at all levels (Pan I Lemmas 5.2.8–5.2.9), identifying the fibre with sections of ω^k (Pan I Proposition 5.2.6).
- Comparison with the classical definitions through the Γ₁(p^n) canonical loci (Pan I §5.2.4, Remark 5.2.13 for other definitions in non-integral weight).

**Uses.**
- Pan I Theorems 5.3.11–5.4.6, pp. 61–66: the overconvergent summands of the μ-isotypic parts.
- Pan I Theorems 6.2.2 and 6.4.11, pp. 69, 78: classicality and Gouvêa's conjecture.
- Pan II §4.4 and Lemma 5.1.2: the n-invariants and the stalk at ∞ of O^{la,χ}.

**API.**
- `Overconvergent.ofWeight` (data): M†\_χ(K^p) = H⁰(Fl, O^{la,χ}/m_∞O^{la,χ}).
- `Overconvergent.integral` (data): M†\_k(K^p) = colim_n M†\_k(K^pΓ(p^n)).
- `Overconvergent.phi` (equivalence): φ\_χ: M†\_k(K^p) ≅ M†\_χ(K^p), multiplication by e₂^{−k}t^{n₁}, with the stated B × G_{Q_p}-twist.
- `Overconvergent.N0_invariants` (characterisation): M†\_k(K^p)^{N_0} = colim_n M†\_k(K^pΓ₁(p^n)).
- `Overconvergent.Up` (data): U_p = Σ\_{i=0}^{p−1}(p i; 0 1) acting on N_0-invariants.
- `Overconvergent.hecke` (functoriality): Prime-to-p Hecke operators and G_{Q_p} act and commute with B.
- `Overconvergent.classical` (constructor): M_k(K^p) ↪ M†\_k(K^p).

**Unit tests.**
- `Overconvergent.classical_inclusion` (compatibility): The restriction of a classical form of weight k to a strict neighbourhood of the canonical locus gives the inclusion M_k(K^p) ⊂ M†\_k(K^p), compatible with Hecke operators.
- `Overconvergent.weight_shift` (computation): For χ = (n₁ + 1, n₂ + 1), φ\_χ = t·φ\_{(n₁,n₂)}, so M†\_{(n₁+1,n₂+1)} = M†\_{(n₁,n₂)}·t.
- `Overconvergent.ordinary_level` (computation): For k ∈ Z, M†\_k(K^p)^{N_0} is the colimit over n of overconvergent forms of weight k and level K^pΓ₁(p^n) in the usual sense (sections on strict neighbourhoods of the Γ₁(p^n) canonical locus).
- `Overconvergent.not_ordinary_locus` (non-example): Sections of ω^k defined only on the canonical (ordinary) locus itself, not on a strict neighbourhood, are p-adic modular forms but not overconvergent; they are not in M†\_k(K^p).

**Acceptance.**
- Classical forms embed: M_k(K^p) ⊂ M†\_k(K^p) (LA.4/smooth-automorphic-sheaves).

**Prerequisites.** LA.2/weight-sheaves; LA.4/smooth-automorphic-sheaves; HodgeTateAndCanonicalSubgroups:T4/canonical-anticanonical-loci; HodgeTateAndCanonicalSubgroups:T3/hasse-neighbourhood; ModularCurvesPartII:R13.4a/affine-open-identification.

**Source.** Pan I, Definition 5.2.3, §5.2.4, Definition 5.2.5, Proposition 5.2.6, Remark 5.2.7, Lemmas 5.2.8–5.2.9, Remark 5.2.13, pp. 52–57: Overconvergent forms of weight χ as the fibre of O^{la,χ} at ∞, the integral-weight definition by strict neighbourhoods of the canonical locus, the comparison with Γ₁(p^n) and the isomorphism φ\_χ with its equivariance. Pan II, §4.4.6, p. 44: Overconvergent and classical forms at infinite tame level on strict neighbourhoods of the canonical locus, as used for the n-invariants.

### LA.4/n-coinvariants-at-infinity — The n-coinvariants of O^{la,χ} are a skyscraper at ∞

*Theorem.*

**Statement.** Let χ = (n₁, n₂). (1) (O^{la,χ}\_{K^p})\_n is a skyscraper sheaf supported at ∞, hence has no H¹. (2) n(O^{la,χ}) ⊂ m_∞O^{la,χ}, giving an exact sequence 0 → (i_∞)\_\*N_χ → (O^{la,χ})\_n → (i_∞)\_\*M†\_χ(K^p) → 0, on whose kernel h acts by (n₂ + 1, n₁ − 1); it splits naturally if χ(h) ≠ 1. (3) N_χ = 0 if χ(h) ∉ {0, −1, −2, …} and χ(h) is p-adically non-Liouville. (4) If χ(h) ∈ {0, −1, −2, …}, (O^{la,χ})\_n ≅ (i_∞)\_\*M†\_χ ⊕ (i_∞)\_\*M†\_χ·(e₁/e₂)^{1−χ(h)}.

**Hypotheses.**
- n = C·u₊ is the nilradical of the rational Borel; non-Liouville in Clark's sense.

**Construction or proof.**
- Away from ∞, u₊ acts on expansions in x by ∂/∂x up to units, which is surjective; so the coinvariants vanish off ∞ (Pan I Proposition 5.2.10(1)).
- At ∞ use the coordinate 1/x with e₂ a generator; u₊ acts by a first-order operator with weight shift, whose cokernel is computed coefficientwise; the Liouville condition controls division by χ(h) + j (Pan I Proposition 5.2.10(2)–(4), Remark 5.2.11).

**Acceptance.**
- For χ = (0, 0): (O^{la,(0,0)})\_n ≅ (i_∞)\_\*M†\_0 ⊕ (i_∞)\_\*M†\_0·(e₁/e₂).

**Prerequisites.** LA.4/overconvergent-modular-forms; LA.2/weight-sheaves.

**Source.** Pan I, Proposition 5.2.10 and Remark 5.2.11, pp. 55–56: Structure of the n-coinvariants of O^{la,χ}: a skyscraper at ∞ built from overconvergent forms, with the extra summand for nonpositive integral χ(h) and its vanishing for non-Liouville weights.

### LA.4/n-invariants-local — Local form of the n-invariants of O^{la,χ}

*Theorem.*

**Statement.** (1) If ∞ ∉ U (e₁ a generator) and N is large, every f ∈ O^{la,χ,n}(U) is (t/t_N)^{n₁}(e₁/e_{1,N})^{n₂−n₁}c with c at finite level G_{r(n)}. (2) If e₂ generates on U ∈ 𝔅 and χ(h) ∈ {0, −1, −2, …}, every f ∈ O^{la,χ,n}(U) is (t/t_N)^{n₁}(e₁/e_{2,N})^{n₂−n₁}c with c at finite level. (3) h acts on O^{la,χ,n}(U) by (n₂, n₁) for every open U. (4) If χ(h) ∉ {0, −1, −2, …} the stalk of O^{la,χ,n} at ∞ is zero. Consequently, for χ(h) = k ≥ 2, multiplication by t^{−n₁}e₁^k gives an exact sequence 0 → O^{la,χ,n} → ω^{k,sm} → (i_∞)\_\*M†\_k(K^p) → 0.

**Hypotheses.**
- χ integral for (2) and the consequence.

**Construction or proof.**
- n-invariance kills all positive powers of x − x_n in the expansion of LA.2/weight-sheaves (Pan I Proposition 5.2.12(1)–(2)).
- Weights from θ\_h on the leading coefficient (Pan I Proposition 5.2.12(3)); at ∞ the polynomial in 1/x cannot be n-invariant unless χ(h) is a nonpositive integer (5.2.12(4)).
- The exact sequence: off ∞ the map is an isomorphism onto ω^{k,sm}, and the cokernel is the stalk of ω^{k,sm} at ∞ (Pan I §5.3.10).

**Acceptance.**
- Taking cohomology for k ≥ 2 gives H¹(Fl, O^{la,χ,n}) ≅ M†\_k(K^p)/M_k(K^p) (Pan I §5.3.10).

**Prerequisites.** LA.4/overconvergent-modular-forms; LA.4/smooth-automorphic-sheaves; LA.2/weight-sheaves.

**Source.** Pan I, Proposition 5.2.12, p. 57; §5.3.10, pp. 60–61: The n-invariant sections of O^{la,χ} come from finite level after twisting by t and e-powers, carry weight (n₂, n₁), and vanish at ∞ for nonintegral or positive χ(h); for k ≥ 2 they embed into ω^{k,sm} with cokernel M†\_k at ∞.

### LA.4/n-cohomology-general-weight — n-coinvariants and n-invariants of H¹(Fl, O^{la,χ}) in general weight

*Theorem.*

**Statement.** Let χ = (n₁, n₂); (−)\_n denotes n-coinvariants and (−)^n n-invariants. (1) The n-coinvariants vanish: (H¹(Fl, O^la)^χ)\_n = H¹(Fl, O^{la,χ})\_n = 0 if χ(h) ≠ 0. (2) If χ(h) ≠ 0, 1 there is a natural Hecke-equivariant weight decomposition of C[B]-modules of the n-invariants H¹(Fl, O^la)^{χ,n} = H¹(Fl, O^{la,χ})^n = (M†\_χ(K^p) ⊗\_C n\*) ⊕ W₂, where M†\_χ ⊗ n\* has weight (n₁ − 1, n₂ + 1) and W₂ has weight (n₂, n₁).

**Hypotheses.**
- n has dimension one, so H⁰(n, −) = (−)^n and H¹(n, −) = (−)\_n ⊗ n\* are the only n-cohomology groups.

**Construction or proof.**
- Apply n-cohomology to 0 → O^{la,χ}(U₁) ⊕ O^{la,χ}(U₂) → O^{la,χ}(U₁₂) → H¹(Fl, O^{la,χ}) → 0 (Pan I footnote 3, p. 52); the coinvariants H¹(Fl, O^{la,χ})\_n = H¹(Fl, (O^{la,χ})\_n) vanish since the coinvariant sheaf is a skyscraper (Pan I proof of Theorem 5.2.15).
- Use LA.4/n-coinvariants-at-infinity and LA.4/n-invariants-local, with the weights to separate the two pieces (Pan I §5.2.1, Theorem 5.2.15, Remark 5.2.14).

**Acceptance.**
- Weight bookkeeping: the two weights (n₁ − 1, n₂ + 1) and (n₂, n₁) are exchanged by the dot action of the Weyl element, as Harish-Chandra predicts for a module with infinitesimal character.

**Prerequisites.** LA.4/n-coinvariants-at-infinity; LA.4/n-invariants-local; LA.2/cohomology-of-weight-sheaves.

**Source.** Pan I, §5.2.1, Theorem 5.2.15, Remark 5.2.14, pp. 51–59: n-coinvariants vanish for χ(h) ≠ 0, and the n-invariants of H¹ split into overconvergent forms of weight χ twisted by n\* and a second piece of the Weyl-reflected weight.

### LA.4/n-cohomology-integral-weight — n-invariants of H¹ in integral weight

*Theorem.*

**Statement.** Let χ = (n₁, n₂) be integral and k = χ(h) = n₁ − n₂. All maps are Hecke- and B × G_{Q_p}-equivariant. (k ≥ 2) H¹(Fl, O^la)^{χ,n} = H¹(Fl, O^{la,χ})^n = M†\_k(K^p)·e₁^{−1}e₂^{−k+1}t^{n₁} ⊕ (M†\_k(K^p)/M_k(K^p))·e₁^{−k}t^{n₁}. (k ≤ −1) H¹(Fl, O^{la,χ})^n = M†\_k(K^p)·e₁^{−1}e₂^{−k+1}t^{n₁} ⊕ N_{k,1}·e₁^{−k}t^{n₁} with 0 → colim_{K_p} H¹(X_{K^pK_p}, ω^k) → N_{k,1} → M†\_k(K^p) → 0. (k = 0) the n-coinvariants (H¹(Fl, O^la)^χ)\_n vanish and the n-invariants are H¹(Fl, O^la)^{χ,n} = N_{2,w}·e₁^{−1}e₂t^{n₁} ⊕ N_{0,1}·t^{n₁} with 0 → M†\_0/M_0 → N_{2,w} → M_0 → 0 and 0 → colim H¹(X_{K^pK_p}, O) → N_{0,1} → M†\_0/M_0 → 0. (k = 1) there is an exact sequence 0 → N₁·e₁^{−1}t^{n₁} → H¹(Fl, O^la)^{χ,n} → M†\_1(K^p)·e₁^{−1}t^{n₁} → 0 with 0 → M†\_1/M_1 → N₁ → colim H¹(X_{K^pK_p}, ω) → 0, and the weight-(n₁ − 1, n₁) part is the pull-back of M_1(K^p)·e₁^{−1}t^{n₁}.

**Hypotheses.**
- χ integral; the twists ·e₁^ae₂^bt^c record the B × G_{Q_p}-action as in Pan I Remark 5.2.7.

**Construction or proof.**
- Reduce to n₁ = 0 by twisting with t^{−n₁} (Pan I §5.3.9).
- k ≥ 2: H¹ of the exact sequence of LA.4/n-invariants-local with H¹(ω^{k,sm}) = 0 (Pan I §5.3.10, Theorem 5.3.11).
- k ≤ −1: the same with H⁰(ω^{k,sm}) = 0 and H¹(ω^{k,sm}) = colim H¹(X, ω^k) (Pan I Theorem 5.3.13).
- k = 0: compute via F = n(O^{la,0}) and the sequence (5.3.1) from LA.2/cohomology-of-weight-sheaves, tracking the image of M_0 (Pan I Proposition 5.3.15, Theorem 5.3.16).
- k = 1: ω^{1,sm} has both H⁰ and H¹ (Pan I §5.3.17, Theorem 5.3.18).

**Acceptance.**
- For k ≥ 2 the overconvergent part M†\_k/M_k is the quotient by classical forms, matching Coleman's classicality: on finite-slope U_p-eigenspaces of small slope it vanishes.

**Prerequisites.** LA.4/n-cohomology-general-weight; LA.4/n-invariants-local; LA.4/smooth-automorphic-sheaves; LA.2/cohomology-of-weight-sheaves.

**Source.** Pan I, §5.3.1–Theorem 5.3.18, pp. 59–64: Complete determination of the n-cohomology of H¹(Fl, O^{la,χ}) for integral weights in the four ranges k ≥ 2, k ≤ −1, k = 0, k = 1, in terms of classical, overconvergent and coherent H¹ terms.

### LA.4/hodge-tate-decomposition-of-isotypic-parts — The μ-isotypic decomposition of H̃¹(K^p, C)^la (p-adic Shimura isomorphism)

*Theorem.* Planet: *p-adic Shimura isomorphism*.

**Statement.** Let μ = (k₁, k₂) ∈ h\*, viewed as a character of b, and k := −μ(h) ≠ 1. There is a natural decomposition H̃¹(K^p, C)^la_μ = M_{μ,1} ⊕ M_{μ,w} into pieces of Hodge–Tate–Sen weights −k₁ and 1 − k₂, with M_{μ,w} = M†\_{μ+2ρ}(K^p) ⊗\_C n\* unless k = 2. If k ∈ Z, writing M_{μ,1} = N_{k,1}·e₁^{−k}t^{k₂} and M_{μ,w} = N_{k,w}·e₁^{−1}e₂^{k−1}t^{k₁+1}: (1) N_{k,w} ≅ M†\_{2−k}(K^p) for k ≠ 2, and 0 → M†\_0/M_0 → N_{2,w} → M_0 → 0; (2) for k ≤ −1, 0 → colim_{K_p} H¹(X_{K^pK_p}, ω^k) → N_{k,1} → M†\_k(K^p) → 0; (3) for k = 0, 0 → colim H¹(X_{K^pK_p}, O) → N_{0,1} → M†\_0/M_0 → 0; (4) for k ≥ 2, N_{k,1} ≅ M†\_k(K^p)/M_k(K^p). All maps are Hecke- and B × G_{Q_p}-equivariant. Passing to the colimit over K^p gives Pan I Theorem 1.0.1: H̃¹(C)^la_{μ\_k} = N_{k,1}·e₁^{−k}t^k ⊕ N_{k,w}(k − 1)·e₁^{−1}e₂^{k−1}t for μ\_k(a b; 0 d) = kd.

**Hypotheses.**
- k ≠ 1; for k ∉ Z only the M_{μ,w} half is identified (Pan I Theorem 5.4.2 and p. 4).

**Construction or proof.**
- The μ-isotypic part for b lies in the n-invariants (μ kills n) and is cut out there by the h-weights: θ\_h and the infinitesimal action are related by Harish-Chandra (LA.1/horizontal-cartan-action) (Pan I §5.4.1).
- Since θ\_h(diag(0, 1)) is the Sen operator (LA.3/theta-h-is-the-sen-operator), the decomposition by θ\_h-weights is a Hodge–Tate–Sen decomposition.
- Read off the pieces from LA.4/n-cohomology-general-weight and LA.4/n-cohomology-integral-weight (Pan I Theorem 5.4.2).

**Acceptance.**
- For k = 0 (μ = 0) the weight-0 piece contains colim H¹(X, O), the classical H¹ of the structure sheaf, as in the complex Eichler–Shimura decomposition.

**Prerequisites.** LA.4/n-cohomology-integral-weight; LA.4/n-cohomology-general-weight; LA.3/theta-h-is-the-sen-operator; LA.2/locally-analytic-completed-cohomology.

**Source.** Pan I, §5.4.1 and Theorem 5.4.2, p. 64; Theorem 1.0.1, pp. 3–4: The Hodge–Tate–Sen decomposition of the μ-isotypic part of the locally analytic completed cohomology into overconvergent and classical pieces, a p-adic analogue of the Shimura isomorphism.

### LA.4/weight-one-isotypic-part — The singular weight μ(h) = −1 and the nilpotent Sen operator

*Theorem.* Planet: *Weight-one isotypic part*.

**Statement.** Let μ = (k₁, k₁ + 1), so μ(h) = −1. There is an exact sequence 0 → N₁·e₁^{−1}t^{k₁+1} → H̃¹(K^p, C)^la_μ → M†\_1(K^p)·e₁^{−1}t^{k₁+1} → 0 with 0 → M†\_1/M_1 → N₁ → colim_{K_p} H¹(X_{K^pK_p}, ω) → 0; the weight-(k₁ + 1, k₁) part H̃¹(K^p, C)^{la,(k₁+1,k₁)}\_μ is the pull-back of M_1(K^p)·e₁^{−1}t^{k₁+1}. The Sen operator on H̃¹(K^p, C)^la_μ is nilpotent, factors through the quotient M†\_1·e₁^{−1}t and maps it to M†\_1/M_1·e₁^{−1}t ⊂ N₁·e₁^{−1}t. Passing to the colimit over K^p, (H̃¹(C)^la_{μ₁})^{G_{Q_p}} lies in H̃¹(C)^{la,(1,0)}\_{μ₁} (Pan I Theorem 1.0.2).

**Hypotheses.**
- μ(h) = −1, the singular weight where Hodge–Tate–Sen weights coincide.

**Construction or proof.**
- θ\_h(h) − 1 = −(h + 1) on the n-part of the auxiliary sheaf F₂ of §5.4.3 (Pan I Lemma 5.4.4); compute the kernels as in §5.4.5.
- Combine with LA.4/n-cohomology-integral-weight in the case k = 1 (Pan I Theorem 5.4.6).

**Acceptance.**
- The extension does not split in general, reflecting non-Hodge–Tate representations with equal Hodge–Tate–Sen weights.

**Prerequisites.** LA.4/n-cohomology-integral-weight; LA.3/theta-h-is-the-sen-operator.

**Source.** Pan I, §5.4.3, Lemma 5.4.4, §5.4.5, Theorem 5.4.6, pp. 64–67; Theorem 1.0.2, p. 4: The μ-isotypic part for μ(h) = −1 as an extension of overconvergent weight-one forms by N₁, the identification of the weight-(k₁+1, k₁) part with the classical pull-back, and the nilpotent Sen operator.

<a id="la5"></a>

## LA.5. Weight-one classicality and Gouvêa's conjecture

From the μ-isotypic decomposition and Galois representations of the big Hecke algebra: pro-modular and pro-cohomological representations (Pan I Definition 6.1.2, Lemmas 6.1.3–6.1.4) and the infinitesimal character of H̃¹(C)^la[p_λ] (Pan I Proposition 6.1.5); classicality of a weight-one overconvergent eigensystem with a U_p-eigenvector and Hodge–Tate weights 0, 0 (Pan I Theorem 6.2.2); the weak local–global compatibility at possibly Eisenstein maximal ideals (Pan I Theorem 6.3.5, Corollary 6.3.6); existence of a U_p-eigenvector by Colmez's Kirillov model (Pan I Corollaries 6.4.4, 6.4.6); classicality of every pro-modular ρ with Hodge–Tate weights 0, 0 (Pan I Theorem 6.4.7), the Fontaine–Mazur conjecture in the irregular case (Pan I Theorem 6.4.8, Corollary 6.4.9) and Gouvêa's conjecture with its converse (Pan I Theorem 6.4.11).

**Depends on.** LA.1, LA.2, LA.3, LA.4, AlgebraicModularFormsAndSerreWeights:R15.2, AutomorphicGaloisRepresentations:R19.1, CompletedCohomologyAndLocalGlobalCompatibility:R31.3, CompletedCohomologyAndLocalGlobalCompatibility:R31.4, CompletedCohomologyAndLocalGlobalCompatibility:R31.6, CompletedCohomologyPartII:CC.8, LocallyAnalyticDistributions:L0, ModularCurvesPartII:R14.6, PadicLocalLanglandsForGL2Qp:R30.4, PadicLocalLanglandsForGL2Qp:R30.6.

### LA.5/pro-modular-representations — Pro-modular and pro-cohomological Galois representations

*Definition.*

**Statement.** Let T(K^p) be the big Hecke algebra of tame level K^p acting on completed cohomology, D_S its two-dimensional Galois determinant and, for a Z_p-algebra map λ: T(K^p) → Q̄\_p, ρ\_λ: G_{Q,S} → GL_2(Q̄\_p) the attached semisimple odd representation (tr ρ\_λ(Frob_l) = λ(T_l)l^{−1}, det ρ\_λ = λ∘D_S) and p_λ = ker(λ ⊗ Q̄\_p). A continuous ρ: G_Q → GL_2(Q̄\_p) is pro-modular if ρ ≅ ρ\_λ for some K^p and λ, and pro-cohomological if Hom_{G_Q}(ρ(−1), H̃¹(K^p, Q̄\_p)) ≠ 0 for some K^p. An irreducible pro-cohomological ρ is pro-modular; for irreducible pro-modular ρ = ρ\_λ the following are equivalent: ρ is pro-cohomological; H̃¹(K^p, Q̄\_p)[p_λ] ≠ 0; H̃¹(K^p, C)[p_λ] ≠ 0. Moreover H̃¹(K^p, Q̄\_p)[p_λ] ⊗̂ C ≅ H̃¹(K^p, C)[p_λ], and H̃¹(K^p, Q̄\_p)[p_λ] = ρ\_λ(−1) ⊗ Hom_{G_Q}(ρ\_λ(−1), H̃¹(K^p, Q̄\_p)) (Boston–Lenstra–Ribet), with the centre A_f^× acting through det(ρ\_λ)ε^{−1}.

**Hypotheses.**
- S is a finite set of primes containing p with K^p = K_SK^S, K^S hyperspecial.

**Construction or proof.**
- The Hecke algebra and its determinant are imported (R31.3, CC.8).
- Eichler–Shimura relation and Boston–Lenstra–Ribet give the ρ\_λ(−1)-isotypic decomposition (Pan I §6.1.1).
- Lemma 6.1.4: choose generators g_1, …, g_s of p_λ; 0 → H̃¹[p_λ] → H̃¹ → ⊕H̃¹ is strict, so it stays exact after completed tensor product with C (Pan I Lemmas 6.1.3–6.1.4).

**Uses.**
- Pan I Proposition 6.1.5 and Theorems 6.2.2–6.4.11: the setting of all global applications.
- Pan II §7.1, Theorem 7.1.2: Π\_ρ and the classicality theorem.

**API.**
- `ProModular` (data): ρ is pro-modular if ρ ≅ ρ\_λ for some K^p and λ: T(K^p) → Q̄\_p.
- `ProCohomological` (data): ρ is pro-cohomological if Hom_{G_Q}(ρ(−1), H̃¹(K^p, Q̄\_p)) ≠ 0 for some K^p.
- `ProCohomological.proModular` (relation): irreducible and pro-cohomological ⇒ pro-modular.
- `ProModular.proCohomological_iff` (characterisation): For irreducible ρ = ρ\_λ: pro-cohomological ⇔ H̃¹(K^p, Q̄\_p)[p_λ] ≠ 0 ⇔ H̃¹(K^p, C)[p_λ] ≠ 0.
- `ProModular.isotypic` (equivalence): H̃¹(K^p, Q̄\_p)[p_λ] = ρ\_λ(−1) ⊗ Hom_{G_Q}(ρ\_λ(−1), H̃¹(K^p, Q̄\_p)).
- `ProModular.completedTensor` (compatibility): H̃¹(K^p, Q̄\_p)[p_λ] ⊗̂\_{Q̄\_p} C ≅ H̃¹(K^p, C)[p_λ].

**Unit tests.**
- `ProModular.classical_eigenform` (computation): For a cuspidal eigenform f of weight 2 and tame level K^p, the system λ\_f of its Hecke eigenvalues gives ρ\_{λ\_f} = ρ\_f (the Eichler–Shimura representation), which is pro-cohomological.
- `ProModular.twist` (compatibility): If ρ is pro-modular then so is ρ ⊗ ε^j for j ∈ Z, via twisting completed cohomology by t^j.
- `ProModular.central_character` (computation): The centre A_f^× acts on H̃¹(K^p, Q̄\_p)[p_λ] through det(ρ\_λ)ε^{−1}.
- `ProModular.nonsplit_not_promodular` (non-example): A nonsplit reducible ρ is never pro-modular, since every ρ\_λ is semisimple; pro-modularity is not a property of ρ^ss alone.

**Acceptance.**
- The representation attached to a cuspidal eigenform of weight k ≥ 2 and tame level K^p is pro-modular and pro-cohomological (its system of eigenvalues occurs in classical cohomology).

**Prerequisites.** CompletedCohomologyAndLocalGlobalCompatibility:R31.3; CompletedCohomologyPartII:CC.8/completed-hecke-algebra; ModularCurvesPartII:R14.6/special-fibre-eichler-shimura; AutomorphicGaloisRepresentations:R19.1/lambda-adic-representation-of-a-weight-k-eigenform; LA.2/locally-analytic-completed-cohomology.

**Source.** Pan I, §6.1.1, Definition 6.1.2, Lemmas 6.1.3–6.1.4, pp. 67–68: The big Hecke algebra, the Galois representations ρ\_λ, the definitions of pro-modular and pro-cohomological representations, and the equivalent nonvanishing conditions with the completed tensor comparison.

### LA.5/infinitesimal-character-of-eigenspaces — Infinitesimal character of the locally analytic eigenspaces

*Theorem.*

**Statement.** Let ρ = ρ\_λ be pro-cohomological and irreducible with Hodge–Tate–Sen weights (a, b) at p. Then H̃¹(K^p, C)^la[p_λ] ≠ 0, and as a representation of GL_2(Q_p) it has infinitesimal character {(−a − 1, −b), (−b − 1, −a)} ⊂ h\* (an orbit for the dot action).

**Hypotheses.**
- Hodge–Tate–Sen weights in Pan's convention (cyclotomic weight −1).

**Construction or proof.**
- ρ is defined over a finite E; H̃¹(K^p, Q_p)[p_λ] ∩ H̃¹ ⊗ E is a nonzero admissible representation, so it has nonzero locally analytic vectors (Schneider–Teitelbaum, imported).
- det ρ has Hodge–Tate–Sen weight a + b, so the centre acts by z ↦ −(a + b) − 1.
- The relation between θ\_h, Z(U(g)) and the Sen operator (LA.1/horizontal-cartan-action, LA.3/theta-h-is-the-sen-operator) determines the infinitesimal character (Pan I Proposition 6.1.5).

**Acceptance.**
- For ρ attached to an eigenform of weight k + 1 (weights 0, k), the infinitesimal character is {(−1, −k), (−k − 1, 0)}, that of (Sym^{k−1} of the dual of the standard representation) up to the twist, as in Pan II §1.2.2.

**Prerequisites.** LA.5/pro-modular-representations; LA.1/horizontal-cartan-action; LA.3/theta-h-is-the-sen-operator; LocallyAnalyticDistributions:L0.

**Source.** Pan I, Proposition 6.1.5 and Remark 6.1.6, pp. 68–69: Nonvanishing and infinitesimal character of the locally analytic λ-eigenspace, from Schneider–Teitelbaum, the centre and the Sen interpretation of θ\_h; compare Dospinescu–Paškūnas–Schraen.

### LA.5/weight-one-classicality-with-up-eigenvector — Classicality of weight-one overconvergent eigensystems with a U_p-eigenvector

*Theorem.*

**Statement.** Let ρ = ρ\_λ be pro-modular of tame level K^p. If M†\_1(K^p)^{N_0}[p_λ] contains a nonzero U_p-eigenvector and ρ|G_{Q_p} is Hodge–Tate of weights 0, 0, then ρ comes from a classical weight-one eigenform: M_1(K^p)[p_λ] ≠ 0. In particular an overconvergent weight-one eigenform of finite slope whose Galois representation is Hodge–Tate at p is classical (no assumption that the U_p-eigenvalue is nonzero).

**Hypotheses.**
- ρ\_λ|G_{Q_p} Hodge–Tate with weights 0, 0; a nonzero U_p-eigenvector in the N_0-invariants of M†\_1(K^p)[p_λ].

**Construction or proof.**
- Reduce to ρ irreducible and normalise K^p = ∏K_l with K_l = Γ₁(l^m) at l ∈ S∖{p}; the operators U_l are integral over T(K^p) (Pan I Lemma 6.2.5).
- Extend λ to λ′ on T̃(K^p)[U_p]; by the q-expansion principle and transitivity of A_S on components, the λ′-eigenspace in the ψ-isotypic M†\_1 at Γ₁(p^n)-level is one-dimensional (Pan I Lemma 6.2.6).
- By Eichler–Shimura, H̃¹(K^p, C)^la_{μ₁}[p_{λ·t}] = ρ\_λ ⊗ W; Hodge–Tate of weights 0, 0 puts it inside the weight-(1, 0) part, which by LA.4/weight-one-isotypic-part maps to M_1·e₁^{−1}t if λ is not classical — the N_0-invariant λ′-eigenspaces would then have dimension 1 on one side and ≥ dim ρ = 2 on the other, a contradiction (Pan I Theorem 6.2.2 and its proof, sketched on p. 5).

**Acceptance.**
- In the ordinary case this recovers Buzzard–Taylor's classicality theorem (Pan I Remark 6.2.3).

**Prerequisites.** LA.5/pro-modular-representations; LA.4/weight-one-isotypic-part; LA.4/overconvergent-modular-forms; AlgebraicModularFormsAndSerreWeights:R15.2/q-expansion-principle-and-its-vanishing-theorem; ModularCurvesPartII:R14.6/special-fibre-eichler-shimura.

**Source.** Pan I, Theorem 6.2.2, Remark 6.2.3, §6.2.4, Lemmas 6.2.5–6.2.6 and the end of §6.2, pp. 69–71; proof sketch after Theorem 1.0.3, p. 5: Classicality of a pro-modular Hodge–Tate weight-(0,0) eigensystem admitting a U_p-eigenvector in weight-one overconvergent forms, by a multiplicity-one comparison through the weight-one isotypic decomposition.

### LA.5/local-global-compatibility-at-eisenstein-ideals — Weak local–global compatibility for completed H¹, including Eisenstein maximal ideals

*Theorem.*

**Statement.** Fix K^p, a finite extension E/Q_p with ring O, a central character ζ and a maximal ideal m of T(K^p) ⊗ O with block 𝔅\_m. Then H̃¹(K^p, E/O)\_{ζ′,m} lies in Mod^{ladm}\_{G,ζ}(O)[𝔅\_m], so the pseudodeformation ring R^{ps,ζε\_p}\_{ρ̄\_{m,p}} acts on it through the Bernstein centre of the block (τ\_p), and this action agrees with the action through the global Hecke algebra and the Galois determinant (τ′\_p). Consequently, for ρ = ρ\_λ pro-modular and irreducible, H̃¹(K^p, Q̄\_p)[p_λ] ≠ 0 (ρ is pro-cohomological) and: if ρ|G_{Q_p} is irreducible, H̃¹(K^p, Q̄\_p)[p_λ] ≅ Π(ρ|G_{Q_p})^{⊕d} for some d; if ρ|G_{Q_p} is reducible, H̃¹(K^p, Q̄\_p)[p_λ] has an ordinary subrepresentation.

**Hypotheses.**
- E is enlarged so that m has residue field F and the reduction of the Galois determinant at p comes from a semisimple ρ̄\_{m,p}; 𝔅\_m is the block attached to ρ̄\_{m,p} by the semisimple mod p correspondence, hence a block containing an absolutely irreducible representation, to which Paškūnas–Tung (Pan I Theorem 6.3.3) applies.
- ζ′ is a character of A_f^×/det(K^p)Q_{>0}^× whose restriction ζ to Q_p^× is congruent to (det ρ̄\_{m,p})ω^{−1}; H̃¹(K^p, −)\_{ζ′,m} is the part localised at m on which the centre acts by ζ′.

**Construction or proof.**
- Import Paškūnas–Tung's map R^{ps} → Z_𝔅 and the faithful exact functor m (Pan I Theorem 6.3.3).
- Compare the two R^{ps}-actions on H̃¹\_{ζ′,m} using density of GL_2(Z_p)-algebraic vectors and semisimplicity of the Hecke action on them (Pan I Theorem 6.3.5, Lemmas 6.3.8–6.3.9).
- Deduce the description of the λ-eigenspace via the Colmez–Dospinescu–Paškūnas bijection (Pan I Corollary 6.3.6, Remark 6.3.7).

**Acceptance.**
- For m non-Eisenstein this is a weak form of Emerton's local–global compatibility (R31.4); the point of Pan I §6.3 is that it holds after localising at an Eisenstein m.

**Prerequisites.** LA.5/pro-modular-representations; CompletedCohomologyAndLocalGlobalCompatibility:R31.4; PadicLocalLanglandsForGL2Qp:R30.6; PadicLocalLanglandsForGL2Qp:R30.4.

**Source.** Pan I, §6.3.1–Remark 6.3.7, Lemmas 6.3.8–6.3.9, pp. 71–75: Generalisation of Emerton's local–global compatibility to possibly Eisenstein maximal ideals through Paškūnas–Tung, and its consequence for the λ-eigenspaces of completed H¹.

### LA.5/up-eigenvector-from-kirillov-model — Nonzero N_0-invariant locally analytic vectors killed by U_p

*Theorem.*

**Statement.** Let Π be an irreducible admissible unitary Banach representation of GL_2(Q_p) over a finite extension of Q_p. Then Π^{la,N_0} ≠ 0 and contains a nonzero U_p-eigenvector. For Π = Π(V) attached to a two-dimensional absolutely irreducible V this follows from Colmez's P-equivariant embedding C_c(Q_p^×, D⁻\_dif(V))^Γ → Π(V)^la_E: its N_0-invariants contain nonzero vectors annihilated by U_p.

**Hypotheses.**
- Π irreducible admissible unitary; the ordinary and finite-dimensional cases are treated directly.

**Construction or proof.**
- Import Colmez's Kirillov model (Pan I Theorem 6.4.3) and compute N_0-invariants of compactly supported functions (Pan I Corollary 6.4.4, Remark 6.4.5).
- For the other irreducible Π (characters and ordinary Π) compute directly (Pan I Corollary 6.4.6).

**Acceptance.**
- A U_p-eigenvector of eigenvalue 0 occurs, which is why Theorem 6.2.2 does not assume a nonzero eigenvalue.

**Prerequisites.** PadicLocalLanglandsForGL2Qp:R30.4; LA.5/local-global-compatibility-at-eisenstein-ideals.

**Source.** Pan I, §6.4.1–Corollary 6.4.6, pp. 75–77: Colmez's Kirillov model gives nonzero U_p-eigenvectors (even in the kernel of U_p) among the N_0-invariant locally analytic vectors of irreducible admissible unitary Banach representations.

### LA.5/weight-one-classicality — Hodge–Tate pro-modular representations of weights 0, 0 are classical of weight one

*Theorem.* Planet: *Weight-one classicality*.

**Statement.** Let ρ = ρ\_λ be pro-modular and irreducible with ρ|G_{Q_p} Hodge–Tate of weights 0, 0. Then ρ is classical: M_1(K^p)[p_λ] ≠ 0 for some tame level K^p.

**Hypotheses.**
- ρ irreducible, pro-modular; Hodge–Tate (not merely Hodge–Tate–Sen) of weights 0, 0 at p.

**Construction or proof.**
- By LA.5/local-global-compatibility-at-eisenstein-ideals, H̃¹(K^p, Q̄\_p)[p_λ] is a sum of copies of Π(ρ|G_{Q_p}) or has an ordinary subrepresentation.
- By LA.5/up-eigenvector-from-kirillov-model its locally analytic N_0-invariants contain a U_p-eigenvector, which by LA.4/weight-one-isotypic-part gives one in M†\_1(K^p)^{N_0}[p_λ].
- Apply LA.5/weight-one-classicality-with-up-eigenvector (Pan I Theorem 6.4.7; Remark 6.4.12 sketches a second proof in the nonordinary case).

**Acceptance.**
- Conversely the representation of a classical weight-one eigenform is Hodge–Tate of weights 0, 0 at p (Deligne–Serre), so the theorem characterises them among pro-modular ρ.

**Prerequisites.** LA.5/weight-one-classicality-with-up-eigenvector; LA.5/up-eigenvector-from-kirillov-model; LA.5/local-global-compatibility-at-eisenstein-ideals; AutomorphicGaloisRepresentations:R19.1/weight-one-artin-representation.

**Source.** Pan I, Theorem 6.4.7 with proof and Remark 6.4.12, pp. 77–79; Theorem 1.0.4, p. 5: Every irreducible pro-modular ρ that is Hodge–Tate of weights 0, 0 at p comes from a classical weight-one eigenform.

### LA.5/irregular-fontaine-mazur — The Fontaine–Mazur conjecture in the irregular case

*Theorem.* Planet: *Fontaine–Mazur in the irregular case*.

**Statement.** Let p > 2 and ρ: G_Q → GL_2(Q̄\_p) continuous, irreducible and odd, unramified outside finitely many primes, with ρ̄|G_{Q(μ\_p)} irreducible and (ρ̄|G_{Q_p})^{ss} either irreducible or η₁ ⊕ η₂ with η₁/η₂ ≠ 1, ω^{±1}. Then ρ is pro-modular; if moreover ρ|G_{Q_p} is Hodge–Tate of weights 0, 0, then ρ is the representation attached to a classical cuspidal eigenform of weight one, and in particular has finite image.

**Hypotheses.**
- p > 2; ρ odd; the two residual conditions of Emerton's promodularity theorem.

**Construction or proof.**
- Pro-modularity is Emerton's Theorem 1.2.3 (imported from R31.6; Pan I Theorem 6.4.8).
- Apply LA.5/weight-one-classicality (Pan I Corollary 6.4.9).
- Finite image by Deligne–Serre (R19.1/weight-one-artin-representation).

**Acceptance.**
- Pilloni–Stroh proved this earlier by other means (Pan I Remark 1.0.6); the conditions could be relaxed via promodularity over totally real fields (Remark 6.4.10).

**Prerequisites.** LA.5/weight-one-classicality; CompletedCohomologyAndLocalGlobalCompatibility:R31.6; AutomorphicGaloisRepresentations:R19.1/weight-one-artin-representation.

**Source.** Pan I, Theorem 6.4.8, Corollary 6.4.9, Remark 6.4.10, p. 78; Theorem 1.0.5 and Remark 1.0.6, pp. 5–6: Promodularity under Emerton's hypotheses and the resulting proof of the Fontaine–Mazur conjecture for Hodge–Tate weights 0, 0.

### LA.5/gouvea-conjecture — Gouvêa's conjecture: Hodge–Tate–Sen weights of overconvergent eigenforms

*Theorem.* Planet: *Gouvêa's conjecture*.

**Statement.** Let ρ = ρ\_λ be irreducible and pro-modular of tame level K^p with Hodge–Tate–Sen weights a, b at p. (1) If M†\_{(n₁,n₂)}(K^p)[p_λ] ≠ 0 then (n₁, n₂) = (−a, −b − 1) or (−b, −a − 1); in particular if M†\_k(K^p)[p_λ] ≠ 0 for some k ∈ Z then {a, b} = {0, k − 1}. (2) Conversely, if ρ|G_{Q_p} is irreducible, then M†\_{(n₁,n₂)}(K^p)[p_λ] ≠ 0 for (n₁, n₂) = (−a, −b − 1) and (−b, −a − 1).

**Hypotheses.**
- For (2), ρ|G_{Q_p} irreducible (so that the Kirillov-model input applies).

**Construction or proof.**
- (1): an eigenvector in M†\_χ gives, through LA.4/hodge-tate-decomposition-of-isotypic-parts, a vector of H̃¹(C)^la[p_λ] of known θ\_h-weight; compare with the infinitesimal character of LA.5/infinitesimal-character-of-eigenspaces and the Sen interpretation.
- (2): local–global compatibility gives Π(ρ|G_{Q_p}) inside H̃¹[p_λ], and the Kirillov model gives N_0-invariant locally analytic vectors of the right weights, which LA.4/hodge-tate-decomposition-of-isotypic-parts places in M†\_χ (Pan I Theorem 6.4.11).

**Acceptance.**
- For a classical eigenform of weight k ≥ 2 the Hodge–Tate weights are 0, k − 1, consistent with (1) (Pan I Remark 1.0.8; Howe obtained the easier direction independently).

**Prerequisites.** LA.5/infinitesimal-character-of-eigenspaces; LA.5/up-eigenvector-from-kirillov-model; LA.5/local-global-compatibility-at-eisenstein-ideals; LA.4/hodge-tate-decomposition-of-isotypic-parts; LA.4/overconvergent-modular-forms.

**Source.** Pan I, Theorem 6.4.11, p. 78; Theorem 1.0.7 and Remark 1.0.8, p. 6: The Hodge–Tate–Sen weights of the Galois representation of an overconvergent eigenform of weight k are 0, k − 1, with a converse when ρ|G_{Q_p} is irreducible.

<a id="la6"></a>

## LA.6. The differential operators d and d̄ and the intertwining operator

Construct the smooth de Rham bundle and the characteristic-zero theta operators θ'\_{k+1}, θ\_{k+1} from Kodaira–Spencer; prove the existence and uniqueness of the O_Fl-linear operator d_{k+1}: ω^{−k,la,(0,0)} → ω^{k+2,la,(0,0)} extending θ'\_{k+1} along the modular curve (Pan II Theorem 4.1.4) and the O^sm-linear operator d̄\_{k+1} along the flag variety obtained from u₊ by Beilinson–Bernstein localisation and BGG (Pan II Theorem 4.2.7), with d̄\_{k+1} surjective and its kernel locally algebraic (Pan II Proposition 4.2.9); the density of O^sm ⊗ O_Fl in O^{la,(0,0)}; and define the intertwining operator I_k = d̄'\_{k+1} ∘ d_{k+1}: O^{la,(−k,0)} → O^{la,(1,−1−k)}(k+1) and I¹\_k = H¹(I_k) (Pan II Definitions 4.3.1, 4.3.3).

**Depends on.** LA.1, LA.2, LA.3, LA.4, AbelianSchemesAndArithmeticModuli:A4, AlgebraicModularFormsAndSerreWeights:R15.1, AutomorphicBundles:B3, PerfectoidShimuraVarieties:S3, tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-7-the-center-of-ul-harish-chandra-freudenthal-and-serres-relations.

### LA.6/smooth-de-rham-bundle — The de Rham bundle at finite and infinite level, with Kodaira–Spencer

*Construction.*

**Statement.** Let D be the canonical extension to the compactified modular curve X = X_{K^pK_p} of the relative H¹\_dR of the universal elliptic curve, with Hodge filtration Fil¹D = ω, gr⁰D = ∧²D ⊗ ω^{−1}, and logarithmic Gauss–Manin connection ∇: D → D ⊗ Ω¹\_X(C) (C the cusps). Kodaira–Spencer: the composite ω → D → D ⊗ Ω¹\_X(C) → gr⁰D ⊗ Ω¹\_X(C) is an isomorphism, i.e. ω² ⊗ (∧²D)^{−1} ≅ Ω¹\_X(C). Since D is compatible with change of K_p, D^sm_{K^p} := π\_{HT\*}colim_{K_p}π\_{K_p}^{-1}D is a locally free O^sm_{K^p}-module on Fl with Fil¹ = ω^{1,sm}\_{K^p} and a connection into D^sm ⊗ Ω¹\_{K^p}(C)^sm (Ω¹\_{K^p}(C)^sm the colimit of log differentials), and Kodaira–Spencer gives ω^{2,sm} ⊗ (∧²D^sm)^{−1} ≅ Ω¹\_{K^p}(C)^sm. The line bundle ∧²D^sm_{K^p} is trivial but not Hecke-equivariantly; D₀ := H⁰(Fl, ∧²D^sm_{K^p}) is free of rank one over M_0(K^p), with GL_2(A_f) acting on a generator through the inverse adelic norm of the determinant.

**Hypotheses.**
- K = K^pK_p neat; D is Deligne's canonical extension of the relative H¹\_dR, which carries a logarithmic connection (Pan II §4.1.2).

**Construction or proof.**
- Import the relative de Rham bundle (A4), its canonical extension with log connection (B3) and the log Kodaira–Spencer isomorphism (R15.1) (Pan II §4.1.2).
- Pull back to all finite levels, take the colimit and push forward along π\_HT (Pan II §4.1.3).
- D₀ and the adelic action: a global horizontal invertible section of ∧²D exists at each finite level and transforms by |det|^{−1} (Pan II Definition 4.4.11).

**Uses.**
- Pan II §4.1.2, p. 34: construction of θ'\_{k+1}, θ\_{k+1}.
- Pan II Theorem 4.1.4, p. 35: the targets of d_{k+1} are twisted by (∧²D^sm)^{−k−1}.
- Pan II Proposition 4.4.12, p. 46: D₀^{−k−1} twists the targets of θ\_{k+1}.

**API.**
- `SmoothDeRham.D` (data): D^sm_{K^p}, locally free over O^sm_{K^p} of rank two, with Fil¹ = ω^{1,sm} and gr⁰ = ∧²D^sm ⊗ ω^{−1,sm}.
- `SmoothDeRham.connection` (structure): ∇: D^sm → D^sm ⊗ Ω¹\_{K^p}(C)^sm, satisfying Griffiths transversality.
- `SmoothDeRham.kodairaSpencer` (equivalence): ω^{2,sm} ⊗ (∧²D^sm)^{−1} ≅ Ω¹\_{K^p}(C)^sm.
- `SmoothDeRham.D0` (data): D₀ = H⁰(Fl, ∧²D^sm_{K^p}), free of rank one over M_0(K^p).
- `SmoothDeRham.levels` (functoriality): Compatible with change of K_p and K^p and with Hecke correspondences.

**Unit tests.**
- `SmoothDeRham.rank` (degenerate): D^sm has rank 2 and ∧²D^sm rank 1; gr¹ = ω^{1,sm}, gr⁰ = ∧²D^sm ⊗ ω^{−1,sm}.
- `SmoothDeRham.ks_degree` (computation): At finite level of genus g with c cusps, deg Ω¹\_X(C) = 2g − 2 + c = 2 deg ω, consistent with Kodaira–Spencer ω² ≅ Ω¹\_X(C) (∧²D trivial).
- `SmoothDeRham.D0_action` (computation): GL_2(A_f) acts on a generator of D₀ through ‖det‖\_A^{−1}, so the twist by D₀^{−k−1} shifts Hecke eigenvalues by the (k + 1)-st power of the norm.
- `SmoothDeRham.not_hecke_trivial` (non-example): ∧²D^sm_{K^p} ≅ O^sm_{K^p} as sheaves, but not Hecke-equivariantly; identifying it with O^sm breaks the Hecke equivariance of d_{k+1}.

**Acceptance.**
- For k = 0 the operator θ₁ built from it (LA.6/theta-operators) is the derivation d: O_X → Ω¹\_X(C) composed with Kodaira–Spencer.

**Prerequisites.** AbelianSchemesAndArithmeticModuli:A4/abelian-h1-de-rham; AutomorphicBundles:B3/canonical-and-subcanonical-extensions; AutomorphicBundles:B3/logarithmic-connection-extension; AlgebraicModularFormsAndSerreWeights:R15.1/logarithmic-kodaira-spencer; PerfectoidShimuraVarieties:S3/hecke-equivariant-hodge-tate-sequence; LA.1/locally-analytic-sheaf.

**Source.** Pan II, §4.1.2–4.1.3, pp. 34–35: The canonical extension D with Hodge filtration and Gauss–Manin connection, the Kodaira–Spencer isomorphism, and the smooth de Rham bundle D^sm_{K^p} on Fl. Pan II, Definition 4.4.11, p. 45: D₀ = H⁰(Fl, ∧²D^sm_{K^p}), free of rank one over M_0(K^p) with the inverse adelic norm action.

### LA.6/theta-operators — The characteristic-zero theta operators θ'\_{k+1} and θ\_{k+1}

*Construction.*

**Statement.** For k ≥ 0, Kodaira–Spencer makes Fil¹Sym^kD → Sym^kD ⊗ Ω¹\_X(C) → (Sym^kD/Fil^k) ⊗ Ω¹\_X(C) an isomorphism, so every section s of gr⁰Sym^kD = ω^{−k} ⊗ (∧²D)^k has a unique lift s̃ ∈ Sym^kD with ∇\_k(s̃) ∈ Fil^kSym^kD ⊗ Ω¹\_X(C) = ω^k ⊗ Ω¹\_X(C). This defines θ'\_{k+1}: ω^{−k} ⊗ (∧²D)^k → ω^k ⊗ Ω¹\_X(C), a logarithmic differential operator of order k + 1; applied to Sym^kD^\* it gives θ\_{k+1}: ω^{−k} → ω^{k+2} ⊗ (∧²D)^{−k−1}. Both are compatible with change of level and define operators on ω^{−k,sm}\_{K^p} and on M†\_{−k}(K^p) → M†\_{k+2}(K^p) ⊗ D₀^{−k−1}.

**Hypotheses.**
- k ≥ 0; characteristic zero.

**Construction or proof.**
- Unique lift by the Kodaira–Spencer isomorphism (Pan II §4.1.2).
- Order k + 1: in a local coordinate the lift involves k derivatives and ∇\_k one more.
- Pass to the colimit over K_p and to stalks at ∞ (overconvergent forms).

**Uses.**
- Pan II Theorem 4.1.4, p. 35: d_{k+1} extends θ\_{k+1}.
- Pan II Proposition 4.4.12, Lemmas 4.4.13–4.4.14: the n-invariants of ker I¹\_k.
- Pan II §5.1, Proposition 5.1.8: the cokernel of θ\_{k+1} on the canonical locus is rigid cohomology of Igusa curves.

**API.**
- `ThetaOp.thetaPrime` (data): θ'\_{k+1}: ω^{−k} ⊗ (∧²D)^k → ω^k ⊗ Ω¹\_X(C).
- `ThetaOp.theta` (data): θ\_{k+1}: ω^{−k} → ω^{k+2} ⊗ (∧²D)^{−k−1}.
- `ThetaOp.lift_unique` (characterisation): θ'\_{k+1}(s) = ∇\_k(s̃) for the unique lift s̃ with ∇\_k(s̃) ∈ Fil^k ⊗ Ω¹.
- `ThetaOp.level` (functoriality): Compatible with pull-back along change of level and with prime-to-p Hecke operators (with the D₀ twist).
- `ThetaOp.onQExpansion` (other): The normalised action a_n ↦ n^{k+1}a_n of θ\_{k+1} on q-expansion coefficients (Bol), killing exactly the constants.
- `ThetaOp.overconvergent` (constructor): θ\_{k+1}: M†\_{−k}(K^p) → M†\_{k+2}(K^p) ⊗ D₀^{−k−1}, and on classical forms M_{−k} → M_{k+2} ⊗ D₀^{−k−1}.

**Unit tests.**
- `ThetaOp.k_zero` (degenerate): θ₁: O_X → ω² ⊗ (∧²D)^{−1} ≅ Ω¹\_X(C) is the exterior derivative.
- `ThetaOp.bol` (computation): On q-expansions at a cusp, θ\_{k+1}(Σa_nq^n) = c_k Σ n^{k+1}a_nq^n for a nonzero rational c_k (Bol's identity).
- `ThetaOp.kernel_classical` (compatibility): The kernel of θ\_{k+1} on M†\_{−k}(K^p) is M_{−k}(K^p) (zero for k > 0) (Pan II Lemma 4.4.13).
- `ThetaOp.not_serre_derivative` (non-example): θ\_{k+1} is not the Serre derivative ϑ − kE₂/12 of weight −k: it has order k + 1 and changes weight by 2k + 2, not 2.

**Acceptance.**
- θ₁ = d followed by Kodaira–Spencer; on q-expansions θ\_{k+1} is a nonzero multiple of (q d/dq)^{k+1}, Bol's identity.

**Prerequisites.** LA.6/smooth-de-rham-bundle; AlgebraicModularFormsAndSerreWeights:R15.1/logarithmic-kodaira-spencer; LA.4/overconvergent-modular-forms; LA.4/smooth-automorphic-sheaves.

**Source.** Pan II, §4.1.2, p. 34: Construction of θ'\_{k+1} and θ\_{k+1} from Kodaira–Spencer and the Gauss–Manin connection on Sym^kD; θ₁ is the derivation.

### LA.6/operator-d — The differential operator d_{k+1} along the modular curve

*Construction.* Planet: *Differential operator d_{k+1}*.

**Statement.** Let χ = (n₁, n₂) be integral with k = n₂ − n₁ ≥ 0. There is a unique natural continuous operator d_{k+1}: O^{la,χ}\_{K^p} → ω^{2k+2,la,χ}\_{K^p} ⊗ (∧²D^sm)^{−k−1} = O^{la,χ}\_{K^p} ⊗\_{O^sm} (Ω¹\_{K^p}(C)^sm)^{⊗(k+1)} such that (1) d_{k+1} is O_Fl-linear and (2) d_{k+1}(t^{n₁}e₁^ie₂^{k−i}s) = t^{n₁}e₁^ie₂^{k−i}θ\_{k+1}(s) for every smooth s of ω^{−k,sm}\_{K^p} and 0 ≤ i ≤ k. It commutes with GL_2(Q_p) and prime-to-p Hecke operators. Twisting by ω\_Fl^{−k}(−k) gives the equivalent d′\_{k+1}: ω^{−k,la,χ′} → ω^{k+2,la,χ′} ⊗ (∧²D^sm)^{−k−1}, χ′ = (n₁, n₁), with d′\_{k+1}(t^{n₁}s) = t^{n₁}θ\_{k+1}(s). For k = 0, d₁: O^{la,(0,0)} → O^{la,(0,0)} ⊗\_{O^sm} Ω^{1,sm}\_{K^p}(C) is the unique continuous O_Fl-linear extension of the derivation d of O^sm. The surjection Sym^kD^{\*,(0,0)} → ω^{−k,la,(0,0)} has a unique continuous left inverse r_k with ∇\_k∘r_k landing in Fil^k ⊗ Ω¹.

**Hypotheses.**
- χ integral with n₂ − n₁ = k ≥ 0.

**Construction or proof.**
- k = 0, locally: on U ∈ 𝔅 with e₁ a generator and f = t^{n₁}Σc_i(x − x_n)^i ∈ A_n, set d_n(f) = t^{n₁}(Σ(x − x_n)^i dc_i − Σ(i + 1)c_{i+1}(x − x_n)^i dx_n); continuity of d bounds p^{(n−1)i}dc_i, and d_{n+1}|\_{A_n} = d_n on the dense polynomial part (Pan II proof of Theorem 4.1.4).
- O_Fl-linearity: commutes with polynomials in x on U₁ = Spa C⟨x⟩, then with O_Fl(U₁) by continuity, and with rational subdomains by density of C⟨x⟩[1/g].
- General k: on D^{χ′} = D^sm ⊗ O^{la,χ′} extend the filtration, use d₁ to build ∇\_{χ′} whose Kodaira–Spencer composite is an isomorphism, and repeat the construction of θ\_{k+1} on Sym^k of the dual (Pan II proof of Theorem 4.1.4, Remark 4.1.5).
- The splitting r_k: (f ↦ (f mod Fil¹, ∇\_kf mod Fil^k)) is an isomorphism by Kodaira–Spencer, hence an isometry by open mapping (Pan II Lemma 4.1.6).

**Uses.**
- Pan II Definition 4.3.1, p. 41: I_k = d̄′\_{k+1} ∘ d_{k+1}.
- Pan II §§5.1–5.4: kernel and cokernel of d_{k+1} on each Newton stratum.
- Pan II §6.4: the first comparison identifies d_{k+1} with one half of the Fontaine operator.

**API.**
- `OperatorD.d` (data): d_{k+1}: O^{la,χ} → O^{la,χ} ⊗\_{O^sm} (Ω¹(C)^sm)^{⊗(k+1)}.
- `OperatorD.flag_linear` (characterisation): d_{k+1}(fs) = f·d_{k+1}(s) for f ∈ O_Fl.
- `OperatorD.on_smooth` (simp): d_{k+1}(t^{n₁}e₁^ie₂^{k−i}s) = t^{n₁}e₁^ie₂^{k−i}θ\_{k+1}(s) for smooth s.
- `OperatorD.unique` (extensionality): A continuous O_Fl-linear operator with the property on smooth sections equals d_{k+1}.
- `OperatorD.equivariant` (functoriality): d_{k+1} commutes with GL_2(Q_p), prime-to-p Hecke operators and G_{Q_p}.
- `OperatorD.twisted` (relation): d′\_{k+1} is d_{k+1} twisted by ω\_Fl^{−k}(−k); each determines the other.
- `OperatorD.splitting` (other): r_k: ω^{−k,la,(0,0)} → Sym^kD^{\*,(0,0)}, the continuous splitting with ∇\_k∘r_k ∈ Fil^k ⊗ Ω¹.

**Unit tests.**
- `OperatorD.k_zero_smooth` (degenerate): For k = 0 and s ∈ O^sm, d₁(s) = ds, the derivative at finite level.
- `OperatorD.flag_kernel` (computation): For k = 0, O_Fl ⊂ ker d₁: d₁(f) = f·d₁(1) = 0.
- `OperatorD.local_formula` (computation): On U with e₁ a generator, d₁(t^{n₁}Σc_i(x − x_n)^i) = t^{n₁}(Σ(x − x_n)^idc_i − Σ(i + 1)c_{i+1}(x − x_n)^idx_n).
- `OperatorD.not_lie_derivative` (non-example): d₁ is not the Lie-algebra action of any element of gl_2(Q_p) ⊗ O: it kills O_Fl (on which u₊ acts as d/dx) and is nonzero on O^sm (on which gl_2 acts by 0).

**Acceptance.**
- Uniqueness: two O_Fl-linear continuous extensions agree on the dense image of O^sm ⊗ O_Fl (LA.6/smooth-tensor-flag-is-dense).

**Prerequisites.** LA.6/theta-operators; LA.6/smooth-de-rham-bundle; LA.2/weight-sheaves; LA.2/analytic-banach-algebras; LA.1/automorphic-twists.

**Source.** Pan II, Theorem 4.1.4, Remark 4.1.5, proof pp. 35–36, Lemma 4.1.6, p. 37; Theorem 1.2.7(1), p. 8: Existence and uniqueness of the O_Fl-linear operator d_{k+1} extending θ\_{k+1}, its local formula for k = 0, the twisted d′\_{k+1} and the canonical continuous splitting r_k.

### LA.6/operator-dbar — The differential operator d̄\_{k+1} along the flag variety

*Construction.* Planet: *Differential operator d̄\_{k+1}*.

**Statement.** Ω¹\_Fl ≅ ω\_Fl^{−2} ⊗ det GL_2-equivariantly. By Beilinson–Bernstein localisation differential operators on Fl act on O^{la,(0,0)}\_{K^p}; the derivation d/dx acts as u₊, giving d̄₁: O^{la,(0,0)} → O^{la,(0,0)} ⊗\_{O_Fl} Ω¹\_Fl, s ↦ u₊(s) ⊗ dx where e₁ is invertible: the O^sm-linear extension of the de Rham differential of Fl. For χ = (n₁, n₂) integral with k = n₂ − n₁ ≥ 0 and −w·(−χ) = (n₂ + 1, n₁ − 1) there is a natural continuous operator d̄\_{k+1}: O^{la,χ} → (∧²D^sm)^{k+1} ⊗ ω^{−2k−2,la,−w·(−χ)}(k + 1) = O^{la,χ} ⊗ (Ω¹\_Fl)^{⊗(k+1)}, formally the (k + 1)-st power of the derivation of Fl, with (1) d̄\_{k+1} O^sm-linear and (2) d̄\_{k+1}(s) = c·(u₊)^{k+1}(s) ⊗ (dx)^{k+1} for a nonzero rational c wherever x is regular; it commutes with GL_2(Q_p), Hecke operators and d_{k+1}. Construction (BGG): λ\_k denotes the common infinitesimal character of O^{la,(0,0)} ⊗ ω\_Fl^k and its twist by (Ω¹\_Fl)^{k+1}; the Hodge–Tate sequence gives 0 → ∧²D^sm ⊗ ω^{−1,la,(1,0)} → V ⊗ O^{la,(0,0)} → ω^{1,la,(0,1)}(−1) → 0, its Sym^k-version φ\_{k,1}: Sym^kV ⊗ O^{la,(0,0)} → ω^{k,la,(0,k)}(−k) and φ\_{k,2}, both isomorphisms on λ\_k-isotypic parts; d̄\_{k+1} is the λ\_k-isotypic part of Sym^kV ⊗ d̄₁ transported along them.

**Hypotheses.**
- Two weights (n₁, n₂), (k₁, k₂) of O^la have the same infinitesimal character iff n₁ + n₂ = k₁ + k₂ and (n₁ − n₂ − 1)² = (k₁ − k₂ − 1)² (Harish-Chandra with θ\_h).

**Construction or proof.**
- d̄₁ from Beilinson–Bernstein: u₊ is d/dx on O_Fl (Pan II §§4.2.1–4.2.2).
- The λ\_1-isotypic part of the middle term of the Hodge–Tate sequence is canonically its quotient; taking λ\_1-parts of V ⊗ d̄₁ gives d̄₂, identified with (u₊)² ⊗ (dx)² up to a nonzero rational constant (Pan II §4.2.4, (4.2.4)).
- General k with Sym^kV and the filtration by (∧²D^sm)^i ⊗ ω^{k−2i,la,(i,k−i)}(i − k), of which only i = 0 is λ\_k-isotypic (Pan II §4.2.5, Lemma 4.2.6).
- Properties and commutation with d_{k+1} from the explicit formulae (Pan II Theorem 4.2.7, Remark 4.2.8).

**Uses.**
- Pan II Proposition 4.2.9, p. 40: surjectivity and locally algebraic kernel.
- Pan II Definition 4.3.1, p. 41: I_k = d̄′\_{k+1} ∘ d_{k+1}.
- Pan II §5.2–5.3: on Ω, d̄ is exchanged with d under Lubin–Tate–Drinfeld duality.

**API.**
- `OperatorDbar.dbar` (data): d̄\_{k+1}: O^{la,χ} → O^{la,χ} ⊗\_{O_Fl} (Ω¹\_Fl)^{⊗(k+1)}.
- `OperatorDbar.smooth_linear` (characterisation): d̄\_{k+1}(sf) = s·d̄\_{k+1}(f) for s ∈ O^sm.
- `OperatorDbar.local` (simp): d̄\_{k+1}(f) = c(u₊)^{k+1}(f) ⊗ (dx)^{k+1} wherever x is regular, c ∈ Q^×.
- `OperatorDbar.flag_restriction` (compatibility): On O_Fl ⊗ ω\_Fl^k, d̄\_{k+1} is the GL_2-equivariant (k + 1)-st derivative ω\_Fl^k → ω\_Fl^{−k−2} ⊗ det^{k+1}.
- `OperatorDbar.commute` (relation): d̄\_{k+1} ∘ d_{k+1} = d_{k+1} ∘ d̄\_{k+1} after the identifications (4.2.3).
- `OperatorDbar.equivariant` (functoriality): Commutes with GL_2(Q_p), prime-to-p Hecke operators and G_{Q_p}.
- `OperatorDbar.isotypic` (other): φ\_{k,1}, φ\_{k,2} are isomorphisms on λ\_k-isotypic parts; φ\_{k,1} has a U(g)-equivariant left inverse φ′\_k.

**Unit tests.**
- `OperatorDbar.k_zero_flag` (degenerate): For k = 0, d̄₁ restricted to O_Fl is the exterior derivative of Fl, and d̄₁ kills O^sm.
- `OperatorDbar.polynomial` (computation): On U ⊂ U₁, d̄\_{k+1}(t^{n₁}e₁^{k}x^j s) = c·j(j − 1)⋯(j − k)t^{n₁}e₁^kx^{j−k−1}s ⊗ (dx)^{k+1} for s ∈ ω^{−k,sm} (u₊ kills t, e₁ and s, and u₊·x = 1), so polynomials of degree ≤ k in x are killed.
- `OperatorDbar.polynomial_sharp` (computation): In characteristic zero (d/dx)^{k+1} does not kill x^{k+1}, so on the n-finite part the kernel of d̄\_{k+1} is exactly the polynomials of degree ≤ k in x, the shadow of Sym^kV.
- `OperatorDbar.infinitesimal_character` (compatibility): Source and target have the same infinitesimal character: (n₁ − n₂ − 1)² = (n₂ + 1 − n₁ + 1 − 1)² holds for the weights χ and −w·(−χ).
- `OperatorDbar.not_O_Fl_linear` (non-example): d̄\_{k+1} is not O_Fl-linear: d̄₁(x·1) = dx ≠ x·d̄₁(1) = 0.

**Acceptance.**
- On O_Fl ⊂ O^{la,(0,0)}, d̄₁ is the de Rham differential d: O_Fl → Ω¹\_Fl.

**Prerequisites.** LA.1/flag-variety-lie-algebra-bundles; LA.1/horizontal-cartan-action; LA.1/automorphic-twists; LA.6/smooth-de-rham-bundle; tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-7-the-center-of-ul-harish-chandra-freudenthal-and-serres-relations; PerfectoidShimuraVarieties:S3/hecke-equivariant-hodge-tate-sequence; mathlib:Polynomial.derivative.

**Source.** Pan II, §§4.2.1–4.2.5, Lemma 4.2.6, Theorem 4.2.7, Remark 4.2.8, pp. 37–40; Theorem 1.2.7(2), p. 8: d̄₁ from Beilinson–Bernstein localisation, the BGG construction of d̄\_{k+1} through λ\_k-isotypic parts of Sym^kV ⊗ O^la, and its properties: O^sm-linear, a rational multiple of (u₊)^{k+1}(dx)^{k+1}, equivariant, commuting with d_{k+1}.

### LA.6/dbar-is-surjective-with-locally-algebraic-kernel — d̄\_{k+1} is surjective with locally algebraic kernel

*Theorem.*

**Statement.** For χ = (n₁, n₂) integral with k = n₂ − n₁ ≥ 0, d̄\_{k+1}: O^{la,χ} → O^{la,χ} ⊗ (Ω¹\_Fl)^{k+1} is surjective, and its kernel is O^{lalg,χ} = Sym^kV(k) ⊗ ω^{−k,sm}·t^{n₁}. Hence the d̄-resolution 0 → Sym^kV(k) ⊗ ω^{−k,sm}\_{K^p} → O^{la,(0,k)}\_{K^p} → O^{la,(0,k)}\_{K^p} ⊗ (Ω¹\_Fl)^{k+1} → 0; for k = 0, 0 → O^sm → O^{la,(0,0)} → O^{la,(0,0)} ⊗ Ω¹\_Fl → 0.

**Hypotheses.**
- By equivariance it suffices to argue where e₁ generates.

**Construction or proof.**
- Surjectivity: u₊ is surjective on O^{la,χ}(U) where e₁ generates (Pan I Proposition 5.2.9, expansion in x − x_n).
- Kernel: it is gl_2-stable and killed by (u₊)^{k+1}, so locally finite; an infinitesimal-character computation identifies it with the Sym^kV-isotypic part, i.e. LA.2/locally-algebraic-subsheaves (Pan II Proposition 4.2.9, Remark 4.2.10).

**Acceptance.**
- For k = 0 this is a 'Dolbeault' resolution of O^sm by O^{la,(0,0)}, the analogue of ∂̄ on the complex upper half-plane.

**Prerequisites.** LA.6/operator-dbar; LA.2/locally-algebraic-subsheaves; LA.2/weight-sheaves.

**Source.** Pan II, Proposition 4.2.9 with proof and Remark 4.2.10, pp. 40–41: Surjectivity of d̄\_{k+1} and identification of its kernel with the locally algebraic subsheaf, giving the d̄-resolution.

### LA.6/smooth-tensor-flag-is-dense — O^sm ⊗ O_Fl is dense in O^{la,(0,0)}

*Theorem.*

**Statement.** The natural map O^sm_{K^p} ⊗\_C O_Fl → O^{la,(0,0)}\_{K^p} has dense image (on sections over every U ∈ 𝔅).

**Hypotheses.**
- Weight (0, 0).

**Construction or proof.**
- By LA.2/weight-sheaves a section of weight (0, 0) is Σc_i(x − x_n)^i with c_i at finite level, i.e. smooth; finite sums lie in O^sm(U) ⊗ O_Fl(U) and are dense in A_n.

**Acceptance.**
- Hence d₁ and d̄₁ are determined by their values on O^sm (where d̄₁ = 0, d₁ = d) and on O_Fl (where d₁ = 0, d̄₁ = d).

**Prerequisites.** LA.2/weight-sheaves; LA.2/analytic-banach-algebras.

**Source.** Pan II, Theorem 1.2.7, first sentence, p. 8; Corollary 3.2.3, p. 20: Density of the image of O^sm ⊗ O_Fl in O^{la,(0,0)}, from the n-finite description.

### LA.6/intertwining-operator — The intertwining operator I_k and I¹\_k

*Definition.* Planet: *Intertwining operator I_k*.

**Statement.** For χ = (n₁, n₂) integral with k = n₂ − n₁ ≥ 0, I_k: O^{la,χ}\_{K^p} → O^{la,−w·(−χ)}\_{K^p}(k + 1) is d̄′\_{k+1} ∘ d_{k+1}, where d̄′\_{k+1} = d̄\_{k+1} ⊗ 1 (meaningful since d̄\_{k+1} is O^sm-linear) and the target is identified through the Kodaira–Spencer isomorphisms Ω¹\_{K^p}(C)^sm ≅ ω^{2,sm} ⊗ (∧²D^sm)^{−1}, Ω¹\_Fl ≅ ω\_Fl^{−2} ⊗ det and π\_HT\*ω\_Fl = ω(−1); equivalently I_k = (d_{k+1} ⊗ 1) ∘ d̄\_{k+1}. It commutes with GL_2(Q_p) and Hecke operators. I¹\_k := H¹(I_k): H¹(Fl, O^{la,χ}) → H¹(Fl, O^{la,−w·(−χ)})(k + 1); for k > 0 both sides are locally analytic vectors of the Banach cohomology, so I¹\_k is a map H̃¹(K^p, C)^{la,χ} → H̃¹(K^p, C)^{la,−w·(−χ)}(k + 1); for k = 0 it factors through the quotient by colim H⁰(X_{K^pK_p}, O) of (3.4.1), giving I′\_0.

**Hypotheses.**
- χ integral, k = n₂ − n₁ ≥ 0; in the introduction's indexing, I_{k−1}: O^{la,(1−k,0)} → O^{la,(1,−k)}(k).

**Construction or proof.**
- Compose the operators of LA.6/operator-d and LA.6/operator-dbar and identify the target (Pan II Definition 4.3.1, §1.2.9).
- Commutation of d and d̄ gives the second description (Pan II Remark 4.2.8).
- Cohomology through the Čech complex; the identification of H¹ for k > 0 and the factorisation for k = 0 use LA.2/cohomology-of-weight-sheaves (Pan II Definition 4.3.3, §4.3.4).

**Uses.**
- Pan II §4.4: ker I¹\_k and its n-invariants.
- Pan II §5: ker I¹\_k stratum by stratum and its spectral decomposition.
- Pan II Theorem 6.2.6: I_{k−1} is the Fontaine operator up to a rational scalar.

**API.**
- `Intertwining.I` (data): I_k = d̄′\_{k+1} ∘ d_{k+1}: O^{la,χ} → O^{la,−w·(−χ)}(k + 1).
- `Intertwining.I_comm` (relation): I_k = (d_{k+1} ⊗ 1) ∘ d̄\_{k+1}.
- `Intertwining.I1` (data): I¹\_k = H¹(I_k), continuous for the LB topologies.
- `Intertwining.I1_completed` (compatibility): For k > 0, I¹\_k is a map H̃¹(K^p, C)^{la,χ} → H̃¹(K^p, C)^{la,−w·(−χ)}(k + 1).
- `Intertwining.I0prime` (constructor): I′\_0: H̃¹(K^p, C)^{la,(0,0)} → H̃¹(K^p, C)^{la,(1,−1)}(1), the factorisation of I¹\_0.
- `Intertwining.equivariant` (functoriality): I_k and I¹\_k commute with GL_2(Q_p), prime-to-p Hecke operators and G_{Q_p} (with the twist (k + 1)).

**Unit tests.**
- `Intertwining.kills_lalg` (computation): I_k kills O^{lalg,χ}: d̄\_{k+1} vanishes on it (LA.6/dbar-is-surjective-with-locally-algebraic-kernel) and I_k = (d ⊗ 1) ∘ d̄.
- `Intertwining.kills_flag` (degenerate): For k = 0, I_0 kills O_Fl and O^sm: d₁ kills O_Fl and d̄₁ kills O^sm.
- `Intertwining.weights` (compatibility): Source and target weights χ and −w·(−χ) = (n₂ + 1, n₁ − 1) are exchanged by the dot action of the nontrivial Weyl element, as an intertwining operator between principal-series-type objects should.
- `Intertwining.not_zero` (non-example): I_0 ≠ 0: on (x − x_n)·s with s ∈ O^sm nonconstant, d̄₁ gives s ⊗ dx and then d₁ gives ds ⊗ dx ≠ 0.

**Acceptance.**
- I_k is a GL_2(Q_p)-equivariant map between sheaves with the same infinitesimal character; Pan II Remark 4.3.2 anticipates that I¹\_k is the Fontaine operator (LA.11/intertwining-operator-is-fontaine-operator).

**Prerequisites.** LA.6/operator-d; LA.6/operator-dbar; LA.2/cohomology-of-weight-sheaves; LA.3/lb-topology-on-cohomology.

**Source.** Pan II, §1.2.9, p. 8; Definition 4.3.1, Remark 4.3.2, Definition 4.3.3, §4.3.4, pp. 41–42: The intertwining operator as the composite of the two differential operators, its target through Kodaira–Spencer, the induced map I¹\_k on H¹ and its variant I′\_0.

<a id="la7"></a>

## LA.7. The n-invariants of ker I¹\_k and their finiteness

Reduce ker I¹\_k to ker H¹(d_{k+1}) (Pan II Lemmas 4.4.2, 4.4.4); compute the n-invariants of O^{la,χ} and of its cohomology in terms of overconvergent forms at infinite level and the classical theta operator (Pan II Proposition 4.4.7, Corollary 4.4.8, §4.4.10); define D₀ (Pan II Definition 4.4.11) and give the weight decomposition of (ker I¹\_k)^n (Pan II Proposition 4.4.12, Lemmas 4.4.13–4.4.14); prove that it is classical (Pan II Theorem 4.4.15) and that the analytic n-invariants are finite-dimensional on each eigenspace (Pan II Corollary 4.4.18, Lemmas 4.4.19–4.4.21).

**Depends on.** LA.1, LA.2, LA.3, LA.4, LA.6, AutomorphicGaloisRepresentations:R19.1, ModularCurvesPartII:R13.5.

### LA.7/kernel-of-i-is-kernel-of-hd — ker I¹\_k = ker H¹(d_{k+1}), and the homological lemma

*Theorem.*

**Statement.** For χ = (n₁, n₂) with k = n₂ − n₁ ≥ 0, ker I¹\_k = ker H¹(d_{k+1}). More generally, for a map X: F → G of sheaves of abelian groups on a space of cohomological dimension one there are natural maps r: H⁰(G) → H⁰(coker X) and δ: ker r = H⁰(X(F)) → H¹(ker X) and a short exact sequence 0 → coker δ → ker H¹(X) → coker r → 0; in particular (1) if H¹(ker X) = 0 then ker H¹(X) = coker r, and (2) if H⁰(G) = 0 then 0 → H¹(ker X) → ker H¹(X) → H⁰(coker X) → 0. In terms of the hypercohomology H\*(X) of the two-term complex, ker H¹(X) = H¹(X)/Fil¹ with Fil¹ the image of H⁰(G).

**Hypotheses.**
- Fl has cohomological dimension one for sheaves of abelian groups on its analytic site, as used in Pan II §4.4.

**Construction or proof.**
- Since I_k = d̄′\_{k+1} ∘ d_{k+1} and d̄′\_{k+1} is surjective (LA.6/dbar-is-surjective-with-locally-algebraic-kernel), it suffices that H¹ of ker d̄′\_{k+1} = Sym^kV(k) ⊗ ω^{k+2,la} ⊗ (∧²D^sm)^{−k−1}-type sheaf vanish, which reduces to H¹(Fl, ω^{k+2,sm}) = 0 for k ≥ 0 (Pan II Lemma 4.4.2, with Pan I Corollary 5.3.6).
- The homological lemma is a diagram chase with the factorisation F → X(F) → G (Pan II Lemma 4.4.4, Remark 4.4.5).

**Acceptance.**
- Applied to X = d_{k+1} it gives the exact sequence for H¹(Fl, O^{la,χ})^n of Pan II §4.4.10.

**Prerequisites.** LA.6/intertwining-operator; LA.6/dbar-is-surjective-with-locally-algebraic-kernel; LA.4/smooth-automorphic-sheaves.

**Source.** Pan II, Lemma 4.4.2, Lemma 4.4.4 and Remark 4.4.5, pp. 42–43: Reduction of ker I¹\_k to ker H¹(d_{k+1}) by surjectivity of d̄′ and vanishing of H¹ of its kernel, and the homological lemma for maps of sheaves on a space of cohomological dimension one.

### LA.7/n-invariants-of-weight-sheaves — n-invariants and n-coinvariants of O^{la,(0,k)} and the classical theta operator

*Theorem.*

**Statement.** For χ = (0, k), k ≥ 0, all isomorphisms O^sm-linear: (1) (O^{la,χ})^n = ω^{−k,sm}·e₁^k via s ↦ e₁^ks; (2) (O^{la,χ})\_n = (i_∞)\_\*M†\_{−k}(K^p)·e₂^k ⊕ (i_∞)\_\*M†\_{−k}(K^p)·e₁^{1+k}e₂^{−1}; (3) H⁰(Fl, O^{la,χ}) = 0 unless k = 0, when it is H⁰(Fl, O^sm); hence H⁰(Fl, u₊(O^{la,χ})) = 0. For ω^{2k+2,la,χ}: (O^n) = ω^{k+2,sm}·e₁^k, n-coinvariants built from M†\_{k+2}, and H⁰ = Sym^kV(k) ⊗ M_{k+2}(K^p), whose map to the n-coinvariants factors through M_{k+2}·e₂^k → M†\_{k+2}·e₂^k. Consequently there is an exact sequence 0 → H¹(Fl, ω^{−k,sm})·e₁^k → H¹(Fl, O^{la,χ})^n → (M†\_{−k}/M_{−k})·e₁^{−1}e₂^{k+1} ⊕ M†\_{−k}·e₁^k → 0, the n-invariants of H¹(Fl, ω^{2k+2,la,χ}) are (M†\_{k+2}/M_{k+2})·e₁^{−1}e₂^{k+1} ⊕ M†\_{k+2}·e₁^k, and H¹(d_{k+1}) is compatible with θ\_{k+1} ⊕ θ\_{k+1} on these descriptions (after trivialising ∧²D^sm).

**Hypotheses.**
- ∞ ∈ Fl is the zero of e₁; the twists ·e₁^ae₂^b denote B × G_{Q_p}-twists as in Pan II §4.4.6.

**Construction or proof.**
- (1)–(3) are Pan I Propositions 5.2.6, 5.2.9–5.2.12 and Corollary 5.1.3 in this normalisation (Pan II Proposition 4.4.7, LA.4/n-coinvariants-at-infinity, LA.4/n-invariants-local).
- For ω^{2k+2,la,χ} use that H⁰ of the target of d̄′\_{k+1} vanishes, so H⁰ is that of ker d̄′\_{k+1} (Pan II Corollary 4.4.8, Remark 4.4.9).
- Apply LA.7/kernel-of-i-is-kernel-of-hd's homological lemma to u₊ and functoriality to d_{k+1} (Pan II §4.4.10).

**Acceptance.**
- A constant (non-horizontal) Cartan action on H¹(Fl, O^{la,χ})^n splits it into weights (k, 0) and (−1, k + 1), different from θ\_h (Pan II §4.4.10).

**Prerequisites.** LA.7/kernel-of-i-is-kernel-of-hd; LA.4/n-coinvariants-at-infinity; LA.4/n-invariants-local; LA.4/overconvergent-modular-forms; LA.6/theta-operators.

**Source.** Pan II, Proposition 4.4.7, Corollary 4.4.8, Remark 4.4.9, §4.4.10, pp. 44–45: The n-invariants, n-coinvariants and H⁰ of O^{la,(0,k)} and ω^{2k+2,la,(0,k)}, the resulting description of the n-invariants of H¹ and the compatibility of H¹(d_{k+1}) with θ\_{k+1}.

### LA.7/kernel-n-invariants-decomposition — The weight decomposition of (ker I¹\_k)^n

*Theorem.*

**Statement.** There is a natural Hecke- and B-equivariant weight decomposition (ker I¹\_k)^n = A_{(k,0)}·e₁^k ⊕ A_{(−1,k+1)}·e₁^{−1}e₂^{k+1}, where A_{(−1,k+1)} is the kernel of θ\_{k+1}: M†\_{−k}(K^p)/M_{−k}(K^p) → (M†\_{k+2}(K^p)/M_{k+2}(K^p)) ⊗ D₀^{−k−1} and A_{(k,0)} sits in an exact sequence 0 → colim_{K_p} H¹(X_{K^pK_p}, ω^{−k}) → A_{(k,0)} → M†\_{−k}(K^p) → M†\_{k+2}(K^p) ⊗ D₀^{−k−1}, the last map θ\_{k+1}. Moreover ker(θ\_{k+1}: M†\_{−k} → M†\_{k+2} ⊗ D₀^{−k−1}) = M_{−k}(K^p), in particular θ\_{k+1} is injective on M†\_{−k} for k > 0.

**Hypotheses.**
- χ = (0, k), k ≥ 0; D₀ as in LA.6/smooth-de-rham-bundle.

**Construction or proof.**
- Snake lemma applied to the diagram of §4.4.10 (Pan II Proposition 4.4.12).
- k = 0: θ₁ is essentially the derivation, whose kernel on a strict neighbourhood of the canonical locus is locally constant functions, i.e. global functions since Igusa curves are irreducible (Pan II Lemma 4.4.13).
- k ≥ 1: dim ker θ\_{k+1} at level Γ(p^n) ≤ (k + 1)·#π₀ (an order-(k + 1) linear ODE away from the cusps), so the kernel is a finite-dimensional smooth GL_2(A_f^p)-representation factoring through det; a nonzero kernel would give a spherical eigensystem with consecutive Hodge–Tate weights at gap k + 1 > 1, contradicting Pan's 2020 theorem (Pan II Lemma 4.4.14).

**Acceptance.**
- For k > 0, M_{−k}(K^p) = 0, so A_{(k,0)} = colim H¹(X_{K^pK_p}, ω^{−k}) (Pan II Remark 4.4.16).

**Prerequisites.** LA.7/n-invariants-of-weight-sheaves; LA.6/theta-operators; LA.6/smooth-de-rham-bundle; ModularCurvesPartII:R13.5/igusa-components; AutomorphicGaloisRepresentations:R19.1/lambda-adic-representation-of-a-weight-k-eigenform.

**Source.** Pan II, Proposition 4.4.12, Lemmas 4.4.13–4.4.14 with proofs, pp. 46–47: Snake-lemma decomposition of the n-invariants of ker I¹\_k and the kernel of θ\_{k+1} on overconvergent forms (classical forms of weight −k).

### LA.7/n-invariants-are-classical — The n-invariants of ker I¹\_k are classical

*Theorem.* Planet: *n-invariants of ker I¹\_k are classical*.

**Statement.** For χ = (0, k): (ker I¹\_k)^n = A_{(k,0)}·e₁^k ⊕ A_{(−1,k+1)}·e₁^{−1}e₂^{k+1}, where A_{(−1,k+1)} embeds through θ\_{k+1} into M_{k+2}(K^p) ⊗ D₀^{−k−1} and 0 → colim_{K_p} H¹(X_{K^pK_p}, ω^{−k}) → A_{(k,0)} → M_{−k}(K^p) → 0. All maps are Hecke- and B-equivariant. In particular every system of Hecke eigenvalues occurring in (ker I¹\_k)^n comes from an automorphic form on GL_2(A). For k > 0, A_{(k,0)} = colim H¹(X_{K^pK_p}, ω^{−k}); for k = 0 there is a natural GL_2(Q_p)-equivariant splitting A_{(0,0)} = colim H¹(X_{K^pK_p}, O) ⊕ M_0(K^p).

**Hypotheses.**
- χ = (0, k).

**Construction or proof.**
- Combine LA.7/kernel-n-invariants-decomposition with the kernel of θ\_{k+1}: its image in M†\_{k+2} ⊗ D₀^{−k−1} of the kernel of the quotient map is classical (Pan II Theorem 4.4.15).
- Remark 4.4.16 for the shape of A_{(k,0)}; the cokernel of θ\_{k+1} (hence a sharper description of A_{(−1,k+1)}) is only known on its primitive part (Coleman), Remark 4.4.17.

**Acceptance.**
- Through Serre duality, colim H¹(X, ω^{−k}) is dual to cusp forms of weight k + 2, so all eigensystems are those of weight-(k + 2) forms.

**Prerequisites.** LA.7/kernel-n-invariants-decomposition.

**Source.** Pan II, Theorem 4.4.15, Remarks 4.4.16–4.4.17, p. 47: Classicality of the Hecke action on the n-invariants of ker I¹\_k, with the shape of the two weight pieces.

### LA.7/finiteness-of-analytic-n-invariants — Finiteness of the analytic n-invariants of ker I¹\_k

*Theorem.* Planet: *Finiteness of analytic n-invariants*.

**Statement.** Let K_p = 1 + p^lM_2(Z_p), l ≥ 2. Then (1) the n-invariants of the K_p-analytic vectors of ker I¹\_k are finite-dimensional, and (2) the n-finite K_p-analytic vectors (killed by a power of u₊) form a finitely generated U(g)-module. Ingredients: (a) there are m > 0 and an affinoid strict neighbourhood V of the canonical locus X_{K^pΓ(p^m),c} such that the K_p-analytic vectors in M†\_{−k}/M_{−k}·e₁^{−1}e₂^{k+1} come from H⁰(V, ω^{−k}); (b) after deepening the level, the preimage of each component of V meets each connected component of X_{K^pΓ(p^{m″})} in a connected set or not at all; (c) every fibre of the map from the preimage of V in X_{K^p} to the profinite set S₁ = lim π₀ has at least three classical points in its Hodge–Tate image.

**Hypotheses.**
- K_p = 1 + p^lM_2(Z_p) with l ≥ 2.

**Construction or proof.**
- K_p-analytic vectors of a smooth representation are its K_p-invariants, so the K_p-analytic vectors of M_{k+2}(K^p) and of the H¹ term are finite-dimensional coherent cohomology at level K^pK_p (proper curve) (Pan II Corollary 4.4.18).
- (a): by LA.3/cohomology-is-hausdorff-lb (Pan II Proposition 3.4.14) the analytic vectors come from a Čech group at level Γ(p^m); only the U₂-term contributes in weight (−1, k + 1), and evaluation at ∞ in the coordinate y = 1/x is the constant term (Pan II Lemma 4.4.19).
- (b): sl_2(Q_p) acts trivially on locally analytic functions on S₁, by evaluating the first-order differential equation at three points with distinct coordinates (c) (Pan II Lemmas 4.4.20–4.4.21, Pan I Theorem 4.2.4).
- Hence a section in the kernel of H⁰(V, ω^{k+2}) → M†\_{k+2}/M_{k+2} is Γ(p^m)-fixed and lies in the finite-dimensional M_{k+2}(K^pΓ(p^m)).

**Acceptance.**
- This is Pan II Theorem 1.1.14's local input; Dospinescu–Paškūnas–Schraen proved the finiteness by a representation-theoretic method (Pan II Remark 7.1.3).

**Prerequisites.** LA.7/n-invariants-are-classical; LA.3/cohomology-is-hausdorff-lb; LA.2/weight-sheaves; LA.1/theta-on-the-modular-curve; ModularCurvesPartII:R13.5/igusa-components.

**Source.** Pan II, Corollary 4.4.18, Lemmas 4.4.19–4.4.21 and Remark 4.4.22, pp. 48–51: Finiteness of the analytic n-invariants of ker I¹\_k: analytic vectors come from a fixed strict neighbourhood, components become connected deeper in the tower, and three classical points in each fibre force sl_2-triviality.

<a id="la8"></a>

## LA.8. The ordinary stratum: the operators over P¹(Q_p)

On the Newton stratification Fl = P¹(Q_p) ⊔ Ω compute the stalk of O^{la,χ} at ∞ as a completed tensor product with overconvergent forms (Pan II Lemma 5.1.2), the kernel of d_{k+1} there (Pan II Proposition 5.1.4), and its cokernel through the rigid cohomology of Igusa curves (Pan II Proposition 5.1.8), giving the cokernel sheaves on P¹(Q_p) as smooth and locally analytic inductions from the Borel (Pan II §§5.1.9–5.1.10, Corollaries 5.1.11–5.1.12). The rigid cohomology of Igusa curves and its finiteness are imported.

**Depends on.** LA.2, LA.4, LA.6, LA.7, IgusaVarietiesAndTorsionConcentration:IG.3, LocallyAnalyticDistributions:L0, PadicDifferentialEquationsAndRigidCohomology:RD.4, PadicDifferentialEquationsAndRigidCohomology:RD.5, SmoothRepresentationsOfLocalGroups:SR.2.

### LA.8/newton-stratification — The Newton stratification of the flag variety and the stalk at ∞

*Construction.*

**Statement.** Fl = P¹ = P¹(Q_p) ⊔ Ω with Ω the Drinfeld upper half-plane; ∞ ∈ P¹(Q_p) is the zero of e₁ with coordinate y = e₁/e₂. The stalk of O_Fl at ∞ is colim_n O_C[[y/p^n]][1/p], each a C-Banach space, and the stalk of ω^{l,sm}\_{K^p} at ∞ is M†\_l(K^p). Write O_{Fl,∞} ⊗̂ M†\_l for the colimit of the completed tensor products, whose elements are Σ\_i c_iy^i with c_i ∈ ω^l(U) for a strict affinoid neighbourhood U of some canonical locus and c_ip^{mi} bounded. Then the stalk of O^{la,(n₁,n₂)}\_{K^p} at ∞ is ω^{n₂−n₁}\_{Fl,∞} ⊗̂ M†\_{n₁−n₂}(K^p)(n₂ − n₁)·t^{n₁}, and that of ω^{l,la,(n₁,n₂)} is the same with M†\_{n₁−n₂+l}. By GL_2(Q_p)-equivariance the same holds at every point of P¹(Q_p).

**Hypotheses.**
- The fibres of π\_HT over P¹(Q_p) are perfect Igusa curves and over Ω profinite sets (Newton strata correspond, IG.3).

**Construction or proof.**
- After the Weyl element, a section near ∞ is t^{n₁}e₂^{n₂−n₁} times a power series in y − y_n by LA.2/weight-sheaves; shrink so that y_n = 0 (Pan II Lemma 5.1.2, as in Pan I Proposition 5.2.10).
- GL_2(Q_p) acts transitively on P¹(Q_p).

**Uses.**
- Pan II Proposition 5.1.4, p. 53: ker d_{k+1} at ∞ is 1 ⊗ ker θ\_{k+1}.
- Pan II Proposition 5.1.8, p. 54: coker d_{k+1} at ∞ is rigid cohomology of Igusa curves.
- Pan II §5.4: the computation over Ω through the supersingular uniformization.

**API.**
- `NewtonStrata.rational` (data): P¹(Q_p) ⊂ Fl, closed, profinite, GL_2(Q_p)-stable.
- `NewtonStrata.omega` (data): Ω = Fl ∖ P¹(Q_p), the Drinfeld upper half-plane, open.
- `NewtonStrata.stalk_infinity` (equivalence): (O^{la,(n₁,n₂)})\_∞ ≅ ω^{n₂−n₁}\_{Fl,∞} ⊗̂ M†\_{n₁−n₂}(K^p)(n₂ − n₁)·t^{n₁}.
- `NewtonStrata.stalk_twisted` (equivalence): (ω^{l,la,(n₁,n₂)})\_∞ ≅ ω^{n₂−n₁}\_{Fl,∞} ⊗̂ M†\_{n₁−n₂+l}(K^p)(n₂ − n₁)·t^{n₁}.
- `NewtonStrata.equivariant` (functoriality): g ∈ GL_2(Q_p) maps the stalk at ∞ to the stalk at ∞·g.

**Unit tests.**
- `NewtonStrata.weight_zero` (computation): The stalk of O^{la,(0,0)} at ∞ is O_{Fl,∞} ⊗̂ M†\_0(K^p), and that of O^sm is M†\_0(K^p).
- `NewtonStrata.twist_t` (compatibility): Multiplying by t shifts (n₁, n₂) to (n₁ + 1, n₂ + 1) and leaves n₂ − n₁ unchanged, consistent with the formula.
- `NewtonStrata.not_finite_level` (non-example): The stalk is not ω\_{Fl,∞} ⊗ M_{n₁−n₂} (classical forms): sections near ∞ involve overconvergent forms, which are not classical in general.
- `NewtonStrata.omega_points` (degenerate): Ω contains no Q_p-rational point; every C-point of Ω has coordinate x ∉ P¹(Q_p).

**Acceptance.**
- For l = 0, χ = (0, 0): the stalk is O_{Fl,∞} ⊗̂ M†\_0(K^p).

**Prerequisites.** LA.2/weight-sheaves; LA.4/overconvergent-modular-forms; IgusaVarietiesAndTorsionConcentration:IG.3/newton-strata-correspond.

**Source.** Pan II, Introduction to §5 and §5.1.1, Lemma 5.1.2, pp. 51–53: The Newton stratification Fl = P¹(Q_p) ⊔ Ω, and the stalk of O^{la,χ} at ∞ as a completed tensor product of the stalk of O_Fl with overconvergent forms.

### LA.8/kernel-of-d-on-rational-points — The kernel of d_{k+1} over P¹(Q_p)

*Theorem.*

**Statement.** Under LA.8/newton-stratification the stalk of d_{k+1} at ∞ is 1 ⊗ θ\_{k+1}. Hence (ker d_{k+1})|\_{P¹(Q_p)} = 0 for k ≥ 1, and (ker d₁)|\_{P¹(Q_p)} = (O_Fl ⊗ M_0(K^p))|\_{P¹(Q_p)}·t^{n₁} (an ordinary tensor product).

**Hypotheses.**
- χ = (n₁, n₂) integral with k = n₂ − n₁ ≥ 0.

**Construction or proof.**
- θ\_{k+1} is injective on M†\_{−k} for k ≥ 1 and has kernel the classical weight-zero forms for k = 0 (Pan II Lemma 4.4.13, LA.7/kernel-n-invariants-decomposition); completed tensor product with the stalk of O_Fl preserves this (Pan II §5.1.3, Proposition 5.1.4).
- GL_2(Q_p) acts transitively on P¹(Q_p).

**Acceptance.**
- Consistent with Remark 5.4.17: d₁ computes de Rham cohomology of the fibres, which over P¹(Q_p) are Igusa curves with H⁰\_dR = locally constant functions.

**Prerequisites.** LA.8/newton-stratification; LA.6/operator-d; LA.7/kernel-n-invariants-decomposition.

**Source.** Pan II, §5.1.3 and Proposition 5.1.4, p. 53: The kernel of d_{k+1} on the rational points vanishes for k ≥ 1 and is O_Fl ⊗ M_0 for k = 0.

### LA.8/cokernel-of-d-on-rational-points — The cokernel of d_{k+1} over P¹(Q_p) and the ordinary sheaf

*Theorem.* Planet: *Cokernel of d via rigid cohomology of Igusa curves*.

**Statement.** Let H¹\_rig(Ig(K^p), Sym^k) be the colimit over the Igusa tower of the rigid cohomology of Igusa curves with coefficients in the overconvergent F-isocrystal Sym^kD (RD.4/igusa-theta-cokernel), finite-dimensional at each finite level (RD.5/igusa-theta-cokernel-finite). (1) The stalk of coker d_{k+1} at ∞ is ω^k_{Fl,∞} ⊗ H¹\_rig(Ig(K^p), Sym^k)(k)·t^{n₁}. (2) Let H¹\_ord(K^p, k) be the GL_2(Q_p)-equivariant sheaf on P¹(Q_p) given by smooth induction from B of the smooth B-representation H¹\_rig(Ig(K^p), Sym^k) (sections over U: smooth f on π^{-1}(U) ⊂ GL_2(Q_p) with f(bg) = b·f(g), π the orbit map of ∞). Then (coker d_{k+1})|\_{P¹(Q_p)} = (ω^k_Fl ⊗ H¹\_ord(K^p, k)(k)·t^{n₁})|\_{P¹(Q_p)}, whose global sections are the locally analytic induction from B of H¹\_rig(Ig(K^p), Sym^k)(k)·(e′₂)^kt^{n₁}; for d′\_{k+1} with χ = (−k, 0), (coker d′\_{k+1})|\_{P¹(Q_p)} = (ω\_Fl^{−k−2} ⊗ H¹\_ord(K^p, k)(k) ⊗ det^{k+1}·t^{−k})|\_{P¹(Q_p)} with global sections the locally analytic induction of H¹\_rig(Ig(K^p), Sym^k)(k)·(e′₁)^{k+1}(e′₂)^{−1}t^{−k}. Here e′₁, e′₂ are the characters (a b; 0 d) ↦ a, d of B without Galois action.

**Hypotheses.**
- The image of θ\_{k+1} at each finite level is closed with finite-dimensional cokernel (Coleman, RD.5); the B-action on H¹\_rig(Ig, Sym^k)·(e′₂)^l is locally analytic for its LB structure.

**Construction or proof.**
- Closed image and finite-dimensional cokernel at each level, the open mapping theorem and completed tensor product with the stalk of O_Fl; take the colimit (Pan II Proposition 5.1.8).
- Spread over P¹(Q_p) by equivariance as a smooth induction (Pan II §5.1.9, SR.2/l-sheaf-model) and compute global sections as locally analytic inductions (Pan II §5.1.10, Corollaries 5.1.11–5.1.12).

**Acceptance.**
- For k = 0 the cokernel at ∞ is ω⁰ ⊗ H¹\_rig(Ig(K^p)), the rigid cohomology of the (open) Igusa curves (Pan II §1.1.9).

**Prerequisites.** LA.8/newton-stratification; LA.6/operator-d; PadicDifferentialEquationsAndRigidCohomology:RD.4/igusa-theta-cokernel; PadicDifferentialEquationsAndRigidCohomology:RD.5/igusa-theta-cokernel-finite; PadicDifferentialEquationsAndRigidCohomology:RD.5/log-rigid-comparison-for-curves; SmoothRepresentationsOfLocalGroups:SR.2/l-sheaf-model; SmoothRepresentationsOfLocalGroups:SR.2/smooth-induction; LocallyAnalyticDistributions:L0.

**Source.** Pan II, §5.1.5–Corollary 5.1.12, pp. 53–55: Rigid cohomology of Igusa curves with Sym^k coefficients, the cokernel of d_{k+1} at ∞, the ordinary sheaf H¹\_ord as a smooth induction, locally analytic induction from B, and the cokernel sheaves of d_{k+1} and d′\_{k+1} on P¹(Q_p).

<a id="la9"></a>

## LA.9. The supersingular stratum: Lubin–Tate and Drinfeld towers

On the Lubin–Tate tower at infinite level: the local differential equation (Pan II Theorem 5.2.6) and the power-series description of locally analytic vectors (Pan II Theorem 5.2.8, Corollary 5.2.10), the sheaves on Ω and the operators d^{k+1}\_LT, d̄^{k+1}\_LT with kernel and image (Pan II Theorems 5.2.15–5.2.16). On the Drinfeld side: the differential equation and the power-series description (Pan II Theorems 5.3.6, 5.3.8), the agreement of the two Cartan actions (Pan II Corollary 5.3.13, Lemma 5.3.14) and the operator d̄^{k+1}\_Dr (Pan II Theorem 5.3.17); with the duality theorems imported, the identification of ker d_{k+1} on Ω with D_p^×-smooth sections (Pan II Corollary 5.3.21). Through the supersingular uniformization at infinite level (Pan II Theorem 5.4.2, Lemma 5.4.4): d_{k+1} is surjective on Ω and I¹\_k is surjective (Pan II Corollaries 5.4.6–5.4.8), ker d_{k+1} on Ω is quaternionic forms (Pan II Proposition 5.4.12) and the global kernels of d_{k+1} and d'\_{k+1} (Pan II Proposition 5.4.15, Corollary 5.4.16).

**Depends on.** LA.0, LA.1, LA.2, LA.6, LA.8, EndoscopicTransferAndUnitaryTraceComparison:ET.6a, GL2AutomorphicRepresentationsAndTransfer:R17.3, HodgeTateAndCanonicalSubgroups:T6:comparison, PerfectoidShimuraVarieties:S5.

### LA.9/lubin-tate-locally-analytic-sheaves — Locally analytic sheaves on Ω from the Lubin–Tate tower

*Construction.*

**Statement.** Let M_{LT,∞} be the Lubin–Tate tower at infinite level for height-two formal groups over F̄\_p, with Hodge–Tate period map π\_{LT,HT} onto Ω ⊂ Fl and Gross–Hopkins period map, M^{(0)}\_{LT,∞} the height-zero part (stable under GL_2(Q_p)⁰ × O_{D_p}^×, GL_2(Q_p)⁰ the determinant-unit subgroup) and π^{(0)}\_{LT,HT} its period map to Ω. There is a basis of affinoids of Ω whose preimages are affinoid perfectoid and pulled back from finite level, so LA.0 applies. Define O_LT = π^{(0)}\_{LT,HT\*}O, O^la_LT (GL_2(Q_p)⁰-locally analytic sections), O^sm_LT (smooth: the colimit of finite levels), the O_{D_p}^×-smooth and D_p^×-locally analytic subsheaves, ω\_LT, ω\_Dr and their la/sm parts (with ω\_{LT,∞}(−1) ≅ ω\_{Dr,∞}^{−1}), the action θ\_{LT,h} of h (through b⁰/n⁰, using LA.9/lubin-tate-differential-equation), the weight sheaves O^{la,χ}\_LT, the GL_2-locally algebraic subsheaf O^{lalg,χ}\_LT spanned by t^{n₁}e₁^ie₂^{k−i}s (s smooth, 0 ≤ i ≤ k, k = n₂ − n₁ ≥ 0), equal to Sym^kV(k) ⊗ ω^{−k,sm}\_LT·t^{n₁}, its D_p^×-analogue spanned by t^{n₁}f₁^if₂^{k−i}s (s D_p^×-smooth, f₁, f₂ a basis of sections of the tautological bundle of the Drinfeld flag variety Fl′), and Ω¹\_LT (the colimit of differentials, ≅ ω^{2,sm}\_LT by Kodaira–Spencer) with its derivation d_LT. The coordinates x = e₂/e₁ (e₁ invertible on M_{LT,∞} since the image is Ω), t, and on the Drinfeld side y = f₂/f₁ and t′, admit finite-level approximations x_n, e_{1,n}, t_n, y_n, f_{1,n}, t′\_n.

**Hypotheses.**
- Height two, p-adic; the Lubin–Tate and Drinfeld towers and their period maps are those of ET.6a.

**Construction or proof.**
- Embed height-zero Lubin–Tate spaces into modular curves and invoke Scholze's Theorem III.1.2 for the affinoid basis (Pan II §5.2.12).
- Define the sheaves and the horizontal actions as in LA.1 (Pan II §§5.2.5, 5.2.7, 5.2.12–5.2.14).
- The D_p^×-side objects through the Drinfeld tower and Fl′ (Pan II §§5.3.5, 5.3.7, 5.3.12, 5.3.15).

**Uses.**
- Pan II Theorems 5.2.15–5.2.16 and 5.3.17: the operators on the supersingular stratum.
- Pan II §5.4: pulled back through the uniformization, these sheaves compute O^la_{K^p} on Ω.

**API.**
- `LTSheaf.O` (data): O_LT, a GL_2(Q_p)⁰-equivariant sheaf on Ω with O_{D_p}^×-action.
- `LTSheaf.la` (data): O^la_LT and its weight parts O^{la,χ}\_LT for θ\_{LT,h}.
- `LTSheaf.sm` (data): O^sm_LT (GL_2-smooth) and O^{D-sm}\_LT (O_{D_p}^×-smooth).
- `LTSheaf.lalg` (equivalence): O^{lalg,χ}\_LT = Sym^kV(k) ⊗ ω^{−k,sm}\_LT·t^{n₁}; the D_p^×-locally algebraic analogue with H⁰(Fl′, ω^k_{Fl′}).
- `LTSheaf.derivation` (structure): d_LT: O^sm_LT → Ω¹\_LT and Ω¹\_LT ≅ ω^{2,sm}\_LT (Kodaira–Spencer).
- `LTSheaf.omega_duality` (relation): ω\_{LT,∞}(−1) ≅ ω\_{Dr,∞}^{−1}, inducing isomorphisms of the la, sm and D_p^×-sm parts.

**Unit tests.**
- `LTSheaf.e1_invertible` (computation): e₁ is invertible on M_{LT,∞}: the image of π\_{LT,HT} is Ω, which avoids ∞ = {e₁ = 0}.
- `LTSheaf.t_weight` (compatibility): t ∈ O^{la,(1,1)}\_LT and O_{D_p}^× acts on t through the reduced norm.
- `LTSheaf.k_zero` (degenerate): O^{lalg,(0,0)}\_LT = O^sm_LT.
- `LTSheaf.smooth_differ` (non-example): O^sm_LT ≠ O^{D-sm}\_LT: x ∈ O_Ω is fixed by D_p^× hence D_p^×-smooth, but not GL_2(Q_p)⁰-smooth (u₊·x = 1).

**Acceptance.**
- O^sm_LT ⊂ O^la_LT and O_Ω ⊂ O^{la,(0,0)}\_LT; t is fixed by O_{D_p}^× up to the reduced norm.

**Prerequisites.** EndoscopicTransferAndUnitaryTraceComparison:ET.6a/lubin-tate-tower; EndoscopicTransferAndUnitaryTraceComparison:ET.6a/drinfeld-tower; EndoscopicTransferAndUnitaryTraceComparison:ET.6a/period-morphisms; EndoscopicTransferAndUnitaryTraceComparison:ET.6a/infinite-level-moduli; EndoscopicTransferAndUnitaryTraceComparison:ET.6a/perfectoid-limit; LA.0/log-galois-perfectoid-covering; LA.1/flag-variety-lie-algebra-bundles.

**Source.** Pan II, §§5.2.2–5.2.5, 5.2.7, 5.2.12–5.2.14, pp. 55–61: The Lubin–Tate tower and its period maps, the local setting, coordinates, and the sheaves O_LT, O^la_LT, O^sm_LT, O^{lalg,χ}\_LT, Ω¹\_LT on Ω. Pan II, §§5.3.5, 5.3.7, 5.3.12, 5.3.15, pp. 63–67: The Drinfeld side: the local setting for D_p^×, θ\_{Dr,h}, coordinates y, f₁, t′, the D_p^×-smooth and D_p^×-locally algebraic sheaves.

### LA.9/lubin-tate-differential-equation — The differential equation on the Lubin–Tate and Drinfeld towers

*Theorem.*

**Statement.** (1) For an open affinoid X of M_LT with preimage X̃ = Spa(B, B⁺) in M_{LT,∞} (a GL_2(Z_p)-Galois pro-étale perfectoid covering), the element θ\_X̃ of LA.0/differential-equation is a generator of n⁰ up to a unit of B; equivalently n⁰ kills B^la. (2) For an affinoid Y of M_Dr whose preimage Ỹ in M_{Dr,∞} has Hodge–Tate image in an affinoid of Fl′ (such Y form a basis), Ỹ is an O_{D_p}^×-Galois pro-étale perfectoid covering and the operator annihilating the D_p^×-locally analytic vectors is a generator of n⁰\_{D_p} up to a unit.

**Hypotheses.**
- Smallness in LA.0 can be removed here (Pan II §5.2.5).

**Construction or proof.**
- Embed the height-zero Lubin–Tate space into a modular curve and use LA.1/theta-on-the-modular-curve (Pan II proof of Theorem 5.2.6).
- Conceptual alternative (Harris): the Higgs field of the standard representation is computed from (D(G), ∇\_LT); it kills Fil⁰ = ω\_LT^{−1} and induces the Kodaira–Spencer isomorphism (Pan II Proposition 5.2.3) on the quotient — this route needs the compatibility of Liu–Zhu's Higgs bundle with Pan I's Higgs field, deferred by the author (footnote 3, p. 58; source issue E3 of the extraction).
- The Drinfeld case is the same, Kodaira–Spencer holding for the Drinfeld tower (Pan II Theorem 5.3.6).

**Acceptance.**
- Hence b⁰/n⁰ acts and θ\_{LT,h}, θ\_{Dr,h} are defined (LA.9/lubin-tate-locally-analytic-sheaves).

**Prerequisites.** LA.0/differential-equation; LA.1/theta-on-the-modular-curve; EndoscopicTransferAndUnitaryTraceComparison:ET.6a/lubin-tate-tower; EndoscopicTransferAndUnitaryTraceComparison:ET.6a/drinfeld-tower; EndoscopicTransferAndUnitaryTraceComparison:ET.6a/period-morphisms; HodgeTateAndCanonicalSubgroups:T6:comparison/log-higgs-functor.

**Source.** Pan II, §5.2.5, Proposition 5.2.3, Theorem 5.2.6 with proof and footnote 3, pp. 56–58: The relative Sen operator of the Lubin–Tate tower generates n⁰, by reduction to modular curves, with a conceptual Higgs-field proof that rests on a deferred compatibility. Pan II, §5.3.5 and Theorem 5.3.6, pp. 63–64: The same on the Drinfeld tower for D_p^×.

### LA.9/lubin-tate-and-drinfeld-power-series — Power-series descriptions on both towers and the agreement of the Cartan actions

*Theorem.*

**Statement.** (1) (Lubin–Tate) For every n and coefficients c_{i,j,k} at level G_{r(n)} with ‖c_{i,j,k}‖p^{(n−1)(i+j+k)} bounded, Σc_{i,j,k}(x − x_n)^i(log(e₁/e_{1,n}))^j(log(t/t_n))^k converges in the G_{r(n)}-analytic vectors of B, and every G_n-analytic vector arises so; consequently B^la ⊂ B^{D_p^×-la}. (2) (Drinfeld) The same with (y − y_n), log(f₁/f_{1,n}), log(t/t′\_n) and H_n = 1 + p^nO_{D_p} describes the H_n-analytic vectors (the coefficients denoted c_{i,j,k}; the printed d_{i,j,k} in the norm bound is a misprint, extraction E1). (3) θ\_{LT,h} = θ\_{Dr,h} on O^la_LT: both vanish on the smooth and on the D_p^×-smooth structure sheaves, θ\_{LT,h}(h) is 0 on ω^sm_LT and −1 on the D_p^×-smooth part, and symmetrically.

**Hypotheses.**
- G_n = Γ(p^n); the coordinates of LA.9/lubin-tate-locally-analytic-sheaves.

**Construction or proof.**
- (1) is the proof of LA.2/power-series-expansion with the Lubin–Tate coordinates (Pan II Theorem 5.2.8); D_p^× fixes x and e₁ and acts on t through the reduced norm, giving the inclusion (Pan II Corollary 5.2.10, Remark 5.2.11).
- (2) likewise with roles exchanged (Pan II Theorem 5.3.8).
- (3): the centres agree, both are first-order operators, so compare on finite-level sections, x, e₁/e_{1,n} and t, which generate by (1) (Pan II Corollary 5.3.13, Lemma 5.3.14) — by explicit calculation (Remark 5.3.10 notes an intrinsic proof would be preferable).

**Acceptance.**
- Combined with ET.6a's duality, B^la = B^{D_p^×-la} (Pan II Corollary 5.3.9, owned by ET.6a/analytic-vectors-under-duality).

**Prerequisites.** LA.9/lubin-tate-differential-equation; LA.9/lubin-tate-locally-analytic-sheaves; LA.2/power-series-expansion; EndoscopicTransferAndUnitaryTraceComparison:ET.6a/gross-hopkins-vector-fields.

**Source.** Pan II, Theorem 5.2.8, Corollary 5.2.10, Remark 5.2.11, pp. 59–60: Power-series description of locally analytic vectors on the Lubin–Tate tower and the inclusion of GL_2-analytic into D_p^×-analytic vectors. Pan II, Theorem 5.3.8, Remarks 5.3.10–5.3.11, Corollary 5.3.13, Lemma 5.3.14, pp. 65–66: The Drinfeld-side description and the agreement of the two Cartan actions, by explicit calculation.

### LA.9/supersingular-differential-operators — The operators d_LT, d̄\_LT and d̄\_Dr on the supersingular stratum

*Theorem.*

**Statement.** Let χ = (n₁, n₂) integral with k = n₂ − n₁ ≥ 0. (1) There is a unique natural continuous O_Ω-linear operator d^{k+1}\_LT: O^{la,χ}\_LT → O^{la,χ}\_LT ⊗ (Ω¹\_LT)^{k+1} with d^{k+1}\_LT(t^{n₁}e₁^ie₂^{k−i}s) = t^{n₁}e₁^ie₂^{k−i}(d_LT)^{k+1}(s) for smooth s ∈ ω^{−k,sm}\_LT, 0 ≤ i ≤ k. (2) There is a natural continuous O^sm_LT-linear operator d̄^{k+1}\_LT: O^{la,χ}\_LT → O^{la,χ}\_LT ⊗ (Ω¹\_Ω)^{k+1}, equal to c(u₊)^{k+1}(s) ⊗ (dx)^{k+1} for some c ∈ Q^×; it is surjective, GL_2(Z_p)-equivariant, with kernel O^{lalg,χ}\_LT. (3) There is a natural continuous operator d̄^{k+1}\_Dr: O^{la,χ}\_LT → O^{la,χ}\_LT ⊗ (Ω¹\_LT)^{k+1}, linear over the D_p^×-smooth structure sheaf, equal to c(u′₊)^{k+1}(s) ⊗ (dy′)^{k+1} (u′₊ ∈ Lie D_p^× ⊗ C the nilpotent carrying f₂ to f₁, y′ = f₂/f₁), surjective, O_{D_p}^×-equivariant, with kernel the D_p^×-locally algebraic subsheaf H⁰(Fl′, ω^k_{Fl′}) ⊗ (D_p^×-smooth part of ω^k_LT)·t^{n₁}. Property (1)′ of d̄\_Dr is linearity over the D_p^×-smooth sections (the printed subscript LT in Pan II Theorem 5.3.17(1) is a misprint for Dr, extraction E2). The analogue of d along the Drinfeld side is not needed (Remark 5.3.18).

**Hypotheses.**
- χ integral with k ≥ 0; a basis f₁, f₂ of the tautological sections on Fl′ is fixed for (3).

**Construction or proof.**
- (1): repeat LA.6/operator-d with the Lubin–Tate data (Pan II Theorem 5.2.15).
- (2): repeat LA.6/operator-dbar and LA.6/dbar-is-surjective-with-locally-algebraic-kernel on Ω (Pan II Theorem 5.2.16).
- (3): the same on the Drinfeld side, the roles of O_Ω, Ω¹\_Ω played by the smooth structure sheaf and Ω¹\_LT (Pan II §5.3.16, Theorem 5.3.17).

**Acceptance.**
- d^{k+1}\_LT restricted to O^sm_LT ⊗ ω^{−k} is (d_LT)^{k+1}, the classical operator θ\_{k+1} on the Lubin–Tate tower.

**Prerequisites.** LA.9/lubin-tate-and-drinfeld-power-series; LA.6/operator-d; LA.6/operator-dbar; LA.6/dbar-is-surjective-with-locally-algebraic-kernel.

**Source.** Pan II, Theorems 5.2.15–5.2.16, p. 61: The operators d^{k+1}\_LT and d̄^{k+1}\_LT on the Lubin–Tate side, with surjectivity and locally algebraic kernel of d̄. Pan II, §5.3.16, Theorem 5.3.17, Remark 5.3.18, p. 67: The operator d̄^{k+1}\_Dr on the Drinfeld side, linear over D_p^×-smooth sections, surjective with D_p^×-locally algebraic kernel.

### LA.9/kernel-of-d-on-omega — d_LT is surjective with D_p^×-locally algebraic kernel

*Theorem.*

**Statement.** With c′ ∈ Q^× the constant of Pan II Theorem 5.3.20 (d̄^{k+1}\_Dr = c′d^{k+1}\_LT, imported from ET.6a/analytic-vectors-under-duality), d^{k+1}\_LT is surjective and its kernel is the D_p^×-locally algebraic subsheaf H⁰(Fl′, ω^k_{Fl′})(k) ⊗ (D_p^×-smooth part of ω^{−k}\_Dr)·t^{n₁}.

**Hypotheses.**
- The duality statements of Pan II Corollary 5.3.9 and Theorem 5.3.20 as stated in ET.6a/analytic-vectors-under-duality.

**Construction or proof.**
- Transport LA.9/supersingular-differential-operators (3) along d̄\_Dr = c′d_LT (Pan II §5.3.19, Corollary 5.3.21).

**Acceptance.**
- This is the step where the Lubin–Tate–Drinfeld duality exchanges the two operators: the kernel of the 'holomorphic' d on Ω is computed from the 'anti-holomorphic' d̄ on the dual tower.

**Prerequisites.** LA.9/supersingular-differential-operators; EndoscopicTransferAndUnitaryTraceComparison:ET.6a/analytic-vectors-under-duality; EndoscopicTransferAndUnitaryTraceComparison:ET.6a/el-duality.

**Source.** Pan II, §5.3.19, Theorem 5.3.20, Corollary 5.3.21, p. 67: Comparison of d̄\_Dr with d_LT up to a rational constant and the resulting surjectivity and kernel of d_LT.

### LA.9/kernel-on-omega-is-quaternionic — Through the supersingular uniformization, ker d on Ω is quaternionic forms

*Theorem.* Planet: *ker d on Ω = quaternionic forms*.

**Statement.** Let D be the definite quaternion algebra over Q ramified at {p, ∞} with D ⊗ Q_p = D_p and X_{K^p} = D^×\\(D ⊗ A_f^p)^×/K^p ≅ a finite disjoint union of O_{D_p}^×-orbits. Through the supersingular uniformization (requested from PerfectoidShimuraVarieties S5), O_{K^p}|\_Ω is the sheaf of O_{D_p}^×-equivariant maps from X_{K^p} to O_LT, and ker d_{k+1}|\_Ω the equivariant maps into ker d^{k+1}\_LT. Hence: (1) d_{k+1}|\_Ω is surjective and coker d_{k+1} is supported on P¹(Q_p), given by LA.8/cokernel-of-d-on-rational-points; (2) coker I_k is supported on P¹(Q_p) and I¹\_k is surjective; (3) for χ = (n₁, n₂), k = n₂ − n₁ ≥ 0, there is a Hecke- and GL_2(Q_p)⁰-equivariant isomorphism ker d_{k+1}|\_Ω ≅ (A_{D,(−n₁,−n₂)}^{K^p} ⊗ (D_p^×-smooth part of ω^{−k}\_Dr))^{O_{D_p}^×}(n₂)·|det|^{n₁}det^{n₁}, where A_{D,−χ} are the quaternionic forms with coefficients in the dual W_{(−n₁,−n₂)} of the algebraic representation of D_p^× of highest weight (n₂, n₁); it extends to a GL_2(Q_p)-equivariant isomorphism after summing the bundle over its Z-translates.

**Hypotheses.**
- K^p inside a level-N subgroup, N ≥ 3 prime to p, so that O_{D_p}^× acts freely on X_{K^p}.

**Construction or proof.**
- Uniformization: π\_HT^{-1}(Ω) ≅ ⊔ copies of M^{(0)}\_{LT,∞} (Pan II Theorem 5.4.2, Lemma 5.4.4) identifies θ\_h with θ\_{LT,h} and d_{k+1} with d^{k+1}\_LT (§5.4.5).
- Surjectivity from LA.9/kernel-of-d-on-omega (Pan II Corollaries 5.4.6–5.4.7); I¹\_k surjective since H¹ of sheaves on the profinite P¹(Q_p) vanishes and H¹ is right exact on Fl (Pan II Corollary 5.4.8, Remark 5.4.9).
- Write equivariant maps as invariants of smooth maps and split off the locally finite coefficient (Pan II §5.4.10, Proposition 5.4.12, Remark 5.4.13); quaternionic forms are those of R17.3 (Pan II Definition 5.4.11).

**Acceptance.**
- The perversity-type statement: H¹ of the complex I_k is supported on the zero-dimensional P¹(Q_p) and H⁰ on a set of dimension ≤ 1 (Pan II Remark 5.4.9).

**Prerequisites.** LA.9/kernel-of-d-on-omega; LA.9/lubin-tate-locally-analytic-sheaves; LA.8/cokernel-of-d-on-rational-points; LA.6/intertwining-operator; PerfectoidShimuraVarieties:S5; GL2AutomorphicRepresentationsAndTransfer:R17.3/definite-infinity.

**Source.** Pan II, §5.4.1, Theorem 5.4.2, §5.4.3, Lemma 5.4.4, §5.4.5, Corollaries 5.4.6–5.4.8, Remark 5.4.9, pp. 68–70: The supersingular uniformization at infinite level, surjectivity of d_{k+1} on Ω and of I¹\_k. Pan II, §5.4.10, Definition 5.4.11, Proposition 5.4.12, Remark 5.4.13, pp. 70–72: Quaternionic forms A_{D,−χ}, A¹, A^c and the identification of ker d_{k+1} on Ω with invariants of quaternionic forms tensor the D_p^×-smooth bundle.

### LA.9/global-kernel-of-d — The global kernels of d_{k+1} and d′\_{k+1}

*Theorem.*

**Statement.** Let j: Ω → Fl be the open embedding. For k ≥ 1, ker d_{k+1} = j_!(the sheaf of LA.9/kernel-on-omega-is-quaternionic). For k = 0, ker d₁ = j_!(the same sheaf with A^c_D, the part not factoring through the reduced norm, in place of A_D) ⊕ O_Fl ⊗ M_0(K^p)·t^{n₁}. Twisting by (Ω¹\_Fl)^{k+1} gives the analogous descriptions of ker d′\_{k+1}. Over Ω, d₁ computes the de Rham cohomology of the profinite fibres of π\_HT, and over P¹(Q_p) that of Igusa curves.

**Hypotheses.**
- χ = (n₁, n₂) integral with k = n₂ − n₁ ≥ 0.

**Construction or proof.**
- Combine LA.8/kernel-of-d-on-rational-points with LA.9/kernel-on-omega-is-quaternionic (Pan II §5.4.14, Proposition 5.4.15).
- For k = 0 identify the image of O_Ω ⊗ M_0 inside the invariants with the A¹-part, A¹ = smooth functions of the reduced norm = M_0 (Pan II Corollary 5.4.16, Remark 5.4.17).

**Acceptance.**
- The A_D-part being j_! (extension by zero) is why compactly supported cohomology of the Drinfeld tower appears in LA.10.

**Prerequisites.** LA.9/kernel-on-omega-is-quaternionic; LA.8/kernel-of-d-on-rational-points; GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl.

**Source.** Pan II, §5.4.14, Proposition 5.4.15, Corollary 5.4.16, Remark 5.4.17, pp. 72–73: Global description of ker d_{k+1} and ker d′\_{k+1} as extension by zero of the quaternionic sheaf on Ω, plus O_Fl ⊗ M_0 for k = 0.

<a id="la10"></a>

## LA.10. Spectral decomposition, de Rham complexes and vanishing cycles

The three-step filtration of ker I¹\_k (Pan II Lemma 5.5.2, Theorem 5.5.4); systems of Hecke eigenvalues of classical and quaternionic forms; the generalised-eigenspace decomposition of ker I¹\_k (Pan II Theorem 5.5.7 = Theorem 1.2.3, Lemma 5.5.8, Corollary 5.5.9); the two-term de Rham complex DR_k on Fl with its Hodge filtration given by classical forms and the description of H¹(DR_k) (Pan II §5.5.10, Lemma 5.5.11, Definition 5.5.12, Proposition 5.5.13, Corollary 5.5.14); the compactly supported de Rham cohomology of the Drinfeld tower and the p-adic vanishing-cycle exact sequence, with the honesty of the Igusa eigenspaces (Pan II Definition 5.6.5, Theorem 5.6.7, Corollary 5.6.11).

**Depends on.** LA.4, LA.6, LA.7, LA.8, LA.9, AlgebraicModularFormsAndSerreWeights:R15.2, AutomorphicGaloisRepresentations:R19.1, GL2AutomorphicRepresentationsAndTransfer:R16.3, GL2AutomorphicRepresentationsAndTransfer:R17.3, PadicDifferentialEquationsAndRigidCohomology:RD.5.

### LA.10/three-step-filtration — The three-step filtration of ker I¹\_k

*Theorem.*

**Statement.** For χ = (−k, 0), k ≥ 0, there are natural short exact sequences 0 → ker H¹(d̄\_{k+1}) → ker I¹\_k → ker H¹(d′\_{k+1}) → 0 and 0 → H¹(Fl, ker d′\_{k+1}) → ker H¹(d′\_{k+1}) → H⁰(coker d′\_{k+1}) → 0, with ker H¹(d′\_{k+1}) the first hypercohomology of d′\_{k+1}. Hence an increasing three-step filtration of ker I¹\_k with graded pieces (1) Sym^kV ⊗ H¹(Fl, ω^{−k,sm}\_{K^p})·ε^{−k}; (2) H¹(Fl, ker d′\_{k+1}) = (H¹(j_!(D_p^×-smooth part of ω^{k+2}\_Dr)) ⊗ A_{D,(k,0)})^{O_{D_p}^×} twisted by det^{k+1} and ε\_p^{−k}; (3) H⁰(coker d′\_{k+1}) = the locally analytic induction from B of H¹\_rig(Ig(K^p), Sym^k)·ε^{−k}(e′₁)^{k+1}(e′₂)^{−1}. For k = 0 the pieces are H¹(O^sm), the A^c-part plus a copy of M_0(K^p), and the induction of H¹\_rig(Ig(K^p))·e′₁(e′₂)^{−1}. All Hecke- and GL_2(Q_p)-equivariant.

**Hypotheses.**
- χ = (−k, 0); ε denotes the twist by t as in Pan II §5.5.3.

**Construction or proof.**
- Use I_k = d′\_{k+1} ∘ d̄\_{k+1} with d̄ surjective; H⁰ of the target of d′\_{k+1} vanishes; apply the homological lemma (Pan II Lemma 5.5.2, LA.7/kernel-of-i-is-kernel-of-hd).
- Identify the pieces with LA.6/dbar-is-surjective-with-locally-algebraic-kernel, LA.9/global-kernel-of-d and LA.8/cokernel-of-d-on-rational-points (Pan II Theorem 5.5.4).

**Acceptance.**
- Taking k = 0 and a weight-two cuspidal eigensystem λ with π\_p supercuspidal, piece (3) vanishes at λ (LA.10/vanishing-cycle-sequence).

**Prerequisites.** LA.7/kernel-of-i-is-kernel-of-hd; LA.6/dbar-is-surjective-with-locally-algebraic-kernel; LA.9/global-kernel-of-d; LA.8/cokernel-of-d-on-rational-points; LA.6/intertwining-operator.

**Source.** Pan II, §5.5.1, Lemma 5.5.2, §5.5.3, Theorem 5.5.4, pp. 73–74: The two factorisations of I_k, the filtration from d′ ∘ d̄ and the three graded pieces: coherent H¹ of smooth forms, compactly supported quaternionic cohomology on Ω, and the induction of rigid cohomology of Igusa curves.

### LA.10/hecke-eigensystems — Systems of spherical Hecke eigenvalues of weight k

*Definition.*

**Statement.** Let S ∋ p be finite with K_l maximal for l ∉ S, T_l, S_l the double-coset operators and T^S the Z_p-algebra they generate; T^S acts on O^la_{K^p}, commuting with θ\_h, I_k, d_{k+1}, d̄\_{k+1}. σ^{K^p}\_k is the spectrum of T^S on M_k(K^p) (semisimple), σ^{K^p}\_{k,n} that on M_k(K^p)·t^n. For k ≥ 2, H¹(Fl, ω^{2−k,sm}) decomposes over the eigensystems of cuspidal automorphic representations whose infinitesimal character at ∞ matches the algebraic representation of highest weight (k − 2, 0), a subset of σ^{K^p}\_{k,k−1}; on quaternionic forms A_{D,(k,0)} (k ≥ 1) the action is semisimple and the eigensystems are those of cuspidal π with matching infinitesimal character and π\_p special or supercuspidal (Jacquet–Langlands), a subset of σ^{K^p}\_{k+2,1}; for k = 0 a quaternionic eigenform either factors through the reduced norm (weight zero) or transfers to a weight-two cuspidal eigenform. For an eigensystem λ: T^S → C and a T^S-module M, M[λ] and M̃[λ] are the eigenspace and generalised eigenspace. D₀ = M_0(K^p)·c with GL_2(A_f) acting on c through ‖det‖^{−1}.

**Hypotheses.**
- S contains p and the primes where K^p is not maximal.

**Construction or proof.**
- Semisimplicity on classical forms (Petersson) and on coherent H¹ (Hodge–Tate decomposition of étale cohomology with Sym^{k−2} coefficients) (Pan II §5.5.5).
- Jacquet–Langlands for the quaternionic forms (R17.3).

**Uses.**
- Pan II Theorem 5.5.7, pp. 76–77: the index set of the generalised eigenspace decomposition.
- Pan II Theorem 7.1.2, p. 116: the eigensystem of ρ is classical.

**API.**
- `HeckeSpectrum.algebra` (data): T^S = Z_p[T_l, S_l : l ∉ S], acting on O^la_{K^p} and on all the cohomology groups above.
- `HeckeSpectrum.sigma` (data): σ^{K^p}\_{k,n} ⊂ Hom(T^S, C), the eigensystems on M_k(K^p)·t^n.
- `HeckeSpectrum.eigenspace` (constructor): M[λ] and the generalised eigenspace M̃[λ] for a T^S-module M.
- `HeckeSpectrum.commutes` (compatibility): T^S commutes with θ\_h, d_{k+1}, d̄\_{k+1}, I_k and GL_2(Q_p).
- `HeckeSpectrum.quaternionic` (relation): The eigensystems of A_{D,(k,0)} (k ≥ 1) are those of cuspidal π with matching infinitesimal character and π\_p special or supercuspidal.

**Unit tests.**
- `HeckeSpectrum.semisimple_classical` (computation): T^S acts semisimply on M_k(K^p), so M_k(K^p) = ⊕\_{λ∈σ\_k} M_k(K^p)[λ] and generalised eigenspaces equal eigenspaces there.
- `HeckeSpectrum.twist` (compatibility): σ^{K^p}\_{k,n} is σ^{K^p}\_k twisted by the n-th power of ε∘det: λ(T_l) is multiplied by l^n.
- `HeckeSpectrum.weight_zero` (degenerate): σ^{K^p}\_0 consists of the characters of T^S on locally constant functions on components: T_l acts by l + 1 times a character of the norm.
- `HeckeSpectrum.not_all` (non-example): An eigensystem of a cuspidal π with π\_p principal series does not occur in A_{D,(k,0)}: Jacquet–Langlands only transfers π with π\_p discrete series.

**Acceptance.**
- The eigensystem of a weight-two newform f of level prime to S lies in σ^{K^p}\_{2,1}.

**Prerequisites.** LA.4/smooth-automorphic-sheaves; AlgebraicModularFormsAndSerreWeights:R15.2/integral-hecke-operators-from-q-expansions; GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl; GL2AutomorphicRepresentationsAndTransfer:R17.3/definite-infinity; AutomorphicGaloisRepresentations:R19.1/newform-rank-two-realisation.

**Source.** Pan II, §5.5.5–5.5.6, pp. 75–76: The spherical Hecke algebra T^S, its semisimple spectra σ^{K^p}\_{k,n} on classical forms, on coherent H¹ and on quaternionic forms, with the Jacquet–Langlands description; D₀ explicitly.

### LA.10/spectral-decomposition — Spectral decomposition of ker I¹\_k

*Theorem.* Planet: *Spectral decomposition of ker I¹\_k*.

**Statement.** For χ = (−k, 0), ker I¹\_k has a natural generalised eigenspace decomposition ker I¹\_k = ⊕\_λ (ker I¹\_k)~[λ] indexed by σ^{K^p}\_{k+2,1} for k ≥ 1 and by σ^{K^p}\_{2,1} ∪ σ^{K^p}\_0 for k = 0; the same holds for ker I′\_0. Moreover, for every λ in the spectrum of H¹\_rig(Ig(K^p), Sym^k), the n-invariants of H⁰(Fl, (coker d′\_{k+1})~[λ]) are nonzero. This is Theorem 1.2.3: ker N decomposes over eigensystems of eigenforms of weight k + 1 and those of colim H⁰(Y(K^pK_p)(C), Q_p) (in the introduction's indexing).

**Hypotheses.**
- χ = (−k, 0).

**Construction or proof.**
- By LA.10/three-step-filtration decompose each graded piece: the first two by LA.10/hecke-eigensystems; the third is a colimit of finite-dimensional Hecke-stable spaces (RD.5), so it decomposes (Pan II proof of Theorem 5.5.7).
- Bound the spectrum: if λ lay outside, Fil² would vanish at λ and the generalised eigenspace would be H⁰ of the cokernel, whose n-invariants are nonzero (Pan II Lemma 5.5.8); but LA.7/n-invariants-are-classical forces λ classical — contradiction.
- For I′\_0, pass to the quotient (Pan II Corollary 5.5.9).

**Acceptance.**
- Alternatively the third piece could be bounded by Coleman's results or by independence of l for Igusa curves (Pan II remark in the proof of Theorem 5.5.7).

**Prerequisites.** LA.10/three-step-filtration; LA.10/hecke-eigensystems; LA.7/n-invariants-are-classical; PadicDifferentialEquationsAndRigidCohomology:RD.5/igusa-theta-cokernel-finite.

**Source.** Pan II, Theorem 5.5.7, Lemma 5.5.8, Corollary 5.5.9, pp. 76–77; Theorem 1.2.3, p. 7: The generalised eigenspace decomposition of ker I¹\_k over classical eigensystems, with the spectrum bounded through the classicality of n-invariants.

### LA.10/de-rham-complex-drk — The de Rham complexes DR_k and D_k and the Hodge filtration

*Construction.* Planet: *de Rham complex DR_k*.

**Statement.** For k ≥ 0 let DR_k be the two-term complex d_{k+1}: O^{la,(−k,0)}\_{K^p} → (target of d_{k+1}) on Fl, DR′\_k that of d′\_{k+1}, and D_k the two-term complex θ\_{k+1}: ω^{−k,sm}\_{K^p} → ω^{k+2,sm} ⊗ (∧²D^sm)^{−k−1}. Fil¹DR_k is the target placed in degree 1. Then ker H¹(d_{k+1}) = H¹(DR_k)/Fil¹H¹(DR_k), H⁰(d_{k+1}) = 0, and Fil¹H¹(DR_k) = H⁰(target) ≅ Sym^kV ⊗ M_{k+2}(K^p)(k) ⊗ D₀^{−k−1}·t^{−k}, embedded by i_H through the locally algebraic inclusion. D_k is quasi-isomorphic to the de Rham complex of Sym^kD^{\*,sm}, H¹(D_k) = colim of finite-level de Rham cohomology H¹\_dR(X_{K^pK_p}, Sym^kD^\*) with 0 → H⁰(target) → H¹(D_k) → H¹(ω^{−k,sm}) → 0, H²(D_k) = 0, and T^S acts semisimply on H¹(D_k). d̄\_{k+1} gives an exact triangle D_k ⊗ Sym^kV·ε^{−k} → DR_k → DR′\_k, so 0 → H¹(D_k) ⊗ Sym^kV·ε^{−k} → H¹(DR_k) → H¹(DR′\_k) → 0, and i_H describes the classical Hodge filtration of H¹(D_k).

**Hypotheses.**
- k ≥ 0; hypercohomology on the analytic site of Fl.

**Construction or proof.**
- Hodge filtration via Remark 4.4.5; H⁰(d_{k+1}) = 0 since H⁰ of the source vanishes for k ≠ 0 and is M_0·t^{n₁}, killed by d₁, for k = 0 (Pan II §5.5.10, Lemma 5.5.11, Definition 5.5.12).
- D_k and its semisimplicity: the inclusion ω^{−k,sm} ⊂ Sym^kD^{\*,sm} is a quasi-isomorphism onto the de Rham complex; Hecke semisimplicity from the Shimura isomorphism over C (Pan II §5.6.1, Proposition 5.6.2).
- The triangle from d̄ commuting with d (Pan II §5.6.3, Remark 5.6.12).

**Uses.**
- Pan II Proposition 5.5.13, Corollary 5.5.14: the description of H¹(DR_k) and the eigenspaces.
- Pan II Remark 1.1.13 and Theorem 7.3.2–7.3.7: Π\_ρ^la ⊗̂ C = H¹(DR_{k−1})[λ]/Fil¹.

**API.**
- `DeRhamComplex.DR` (data): DR_k = [O^{la,(−k,0)} → O^{la,(−k,0)} ⊗ (Ω¹(C)^sm)^{k+1}] via d_{k+1}.
- `DeRhamComplex.D` (data): D_k = [ω^{−k,sm} → ω^{k+2,sm} ⊗ (∧²D^sm)^{−k−1}] via θ\_{k+1}.
- `DeRhamComplex.hodgeFil` (structure): Fil¹H¹(DR_k) = image of H⁰(target), embedded by i_H.
- `DeRhamComplex.kernel_quotient` (equivalence): ker H¹(d_{k+1}) = H¹(DR_k)/Fil¹H¹(DR_k).
- `DeRhamComplex.D_deRham` (equivalence): H¹(D_k) ≅ colim_{K_p} H¹\_dR(X_{K^pK_p}, Sym^kD^\*).
- `DeRhamComplex.triangle` (relation): D_k ⊗ Sym^kV·ε^{−k} → DR_k → DR′\_k → is an exact triangle.
- `DeRhamComplex.semisimple` (other): T^S acts semisimply on H¹(D_k).

**Unit tests.**
- `DeRhamComplex.k_zero` (degenerate): For k = 0, D_0 = [O^sm → Ω^{1,sm}(C)], whose H¹ is colim H¹\_dR(X_{K^pK_p}) with Fil¹ = colim H⁰(X, Ω¹(C)) = M_2(K^p) ⊗ D₀^{−1}.
- `DeRhamComplex.no_H0` (computation): H⁰(DR_k) = ker H⁰(d_{k+1}) = 0 for k ≥ 1, since H⁰(Fl, O^{la,(−k,0)}) = 0.
- `DeRhamComplex.classical_hodge` (compatibility): Under H¹(D_k) ⊗ Sym^kV ⊂ H¹(DR_k), Fil¹ restricts to the Hodge filtration Fil¹H¹\_dR(X, Sym^kD^\*) = H⁰(X, ω^{k+2} ⊗ (∧²D)^{−k−1}).
- `DeRhamComplex.cohomology_ignores_fil` (non-example): H¹(DR_k)[λ] alone does not determine the Hodge filtration: its quotient by Fil¹ is the relevant object (Pan II Remark 1.1.13), so 'H¹(DR_k)' is not a substitute for ker I¹\_k.

**Acceptance.**
- For k = 0, H¹(D_0) = colim H¹\_dR(X_{K^pK_p}) and its Fil¹ is colim H⁰(X_{K^pK_p}, ω²) (Pan II Remark 1.1.13).

**Prerequisites.** LA.6/operator-d; LA.6/operator-dbar; LA.6/theta-operators; LA.6/smooth-de-rham-bundle; LA.7/kernel-of-i-is-kernel-of-hd; LA.10/hecke-eigensystems.

**Source.** Pan II, §5.5.10, Lemma 5.5.11, Definition 5.5.12, pp. 77–78: The de Rham complex DR_k of d_{k+1}, its Hodge filtration and Fil¹ given by classical forms of weight k + 2. Pan II, §5.6.1, Proposition 5.6.2, §5.6.3, Remark 5.6.12, pp. 79–83: The complex D_k of θ\_{k+1}, its identification with de Rham cohomology of Sym^kD^\* at finite level, semisimplicity of the Hecke action, the triangle D_k ⊗ Sym^kV → DR_k → DR′\_k, and the Hodge filtration.

### LA.10/de-rham-cohomology-and-eigenspaces — H¹(DR_k) and the eigenspaces in the supercuspidal and principal series cases

*Theorem.*

**Statement.** There is a natural exact sequence 0 → (H¹(j_!(D_p^×-smooth part of ω^{−k}\_Dr)) ⊗ A^c_{D,(k,0)})^{O_{D_p}^×}·ε\_p^{−k} → H¹(DR_k) → H⁰(Fl, ω^k_Fl ⊗ H¹\_ord(K^p, k))·ε^{−k} → 0, the quotient being the locally analytic induction from B of H¹\_rig(Ig(K^p), Sym^k)·ε^{−k}(e′₂)^k. Let λ ∈ σ^{K^p}\_{k+2,1} come from a cuspidal π. (1) If π\_p is supercuspidal, H¹\_rig(Ig(K^p), Sym^k)·t^{−k}[λ] = 0 and (ker I¹\_k)~[λ] = (ker I¹\_k)[λ] = (quaternionic term)[λ]/i_H(Fil¹)[λ], an extension of the invariants term by Sym^kV ⊗ H¹(ω^{−k,sm})·ε^{−k}[λ]. (2) If π\_p is a principal series (the cuspidal quaternionic part vanishes at λ), (ker I¹\_k)~[λ] = (ker I¹\_k)[λ] = (induction of H¹\_rig(Ig(K^p), Sym^k)·ε^{−k}(e′₂)^k)[λ]/i_H(Fil¹)[λ]. In both cases H¹(DR_k)[λ] is its own generalised eigenspace and ker I¹\_k[λ] = H¹(DR_k)[λ]/Fil¹. The special case (π\_p a twist of Steinberg) is expected but not proved directly (Pan II Remark 5.5.15).

**Hypotheses.**
- λ comes from a cuspidal π with π\_p supercuspidal or principal series; the honesty of Igusa eigenspaces (LA.10/vanishing-cycle-sequence).

**Construction or proof.**
- Proposition 5.5.13 from the three-step filtration and Lemma 5.5.11.
- Corollary 5.5.14 using the vanishing of the Igusa term at supercuspidal λ and the honesty of eigenspaces from Corollary 5.6.11 (LA.10/vanishing-cycle-sequence).
- The uniform sheaf-theoretic reading with j_!ν\_\*(L_ss ⊗ ω^k) and i_!(L_ord ⊗ ω^k) is Remark 5.5.16.

**Acceptance.**
- The two cases exhibit Π\_ρ^la-type objects as quotients by the Hodge filtration, matching Pan II Theorems 7.3.2 and 7.3.7.

**Prerequisites.** LA.10/de-rham-complex-drk; LA.10/three-step-filtration; LA.10/spectral-decomposition; LA.10/vanishing-cycle-sequence; GL2AutomorphicRepresentationsAndTransfer:R16.3/principal-series-parameter; GL2AutomorphicRepresentationsAndTransfer:R16.3/supercuspidal-parameter.

**Source.** Pan II, Proposition 5.5.13, Corollary 5.5.14, Remarks 5.5.15–5.5.16, pp. 78–79: Two-step description of H¹(DR_k) by compactly supported quaternionic cohomology on Ω and the induction of Igusa rigid cohomology, and the honest eigenspaces of ker I¹\_k when π\_p is supercuspidal or a principal series.

### LA.10/compactly-supported-de-rham-drinfeld — Compactly supported de Rham cohomology of the Drinfeld tower

*Definition.*

**Statement.** Let DR_dR be the complex d: (D_p^×-smooth structure sheaf on Ω) → Ω¹\_Dr (≅ ω²\_Dr ⊗ det by Kodaira–Spencer) and j: Ω → Fl. H^i_{dR,c}(M^{(0)}\_{Dr,∞}) := H^i(Fl, j_!DR_dR); since only H¹ of each term is nonzero, H^i_{dR,c} is the (i − 1)-st cohomology of H¹(j_!O^{D-sm}) → H¹(j_!Ω¹\_Dr). The same recipe at finite level gives H^i_{dR,c}(M^{(0)}\_{Dr,n}) with H^i_{dR,c}(M^{(0)}\_{Dr,∞}) = colim_n. GL_2(Q_p)⁰ acts on H²\_{dR,c} through det and O_{D_p}^× through the reduced norm.

**Hypotheses.**
- The finite-level Drinfeld spaces are partially proper, so their de Rham cohomology is computed naively.

**Construction or proof.**
- Definition by j_! (Pan II Definition 5.6.5).
- At finite level Serre duality gives H^i_dR dual to H^{2−i}\_{dR,c}, and the result agrees with the compactly supported cohomology of Colmez–Dospinescu–Nizioł (Pan II §5.6.9, explanatory; owned by the proposed ProetaleCohomologyOfPAdicCurvesAndTowers).
- H⁰\_dR is the continuous functions on π₀, so H²\_{dR,c} is abelian (Pan II Lemma 5.6.10).

**Uses.**
- Pan II Lemma 5.6.6 and Theorem 5.6.7: the supersingular map SS_k and the vanishing-cycle sequence.
- Pan II Theorem 7.3.2: the description of Π\_ρ^la in the supercuspidal case.

**API.**
- `DrinfeldDRc.complex` (data): DR_dR = [O^{D-sm}\_Ω → Ω¹\_Dr].
- `DrinfeldDRc.H` (data): H^i_{dR,c} = H^i(Fl, j_!DR_dR).
- `DrinfeldDRc.finite_level` (compatibility): H^i_{dR,c}(M^{(0)}\_{Dr,∞}) = colim_n H^i_{dR,c}(M^{(0)}\_{Dr,n}).
- `DrinfeldDRc.top_abelian` (other): GL_2(Q_p)⁰ acts on H²\_{dR,c} through det and O_{D_p}^× through the reduced norm.
- `DrinfeldDRc.serre_duality` (relation): At finite level H^i_dR is dual to H^{2−i}\_{dR,c}.

**Unit tests.**
- `DrinfeldDRc.degree_zero` (degenerate): H⁰\_{dR,c} = 0: a global section of j_!O^{D-sm} is a section on Ω whose support is closed in Fl, but the support of a nonzero section is a union of components whose closure meets P¹(Q_p).
- `DrinfeldDRc.top_finite` (computation): At level n, H²\_{dR,c}(M^{(0)}\_{Dr,n}) is dual to H⁰\_dR = locally constant functions on π₀(M^{(0)}\_{Dr,n}), a finite set, so it is finite-dimensional.
- `DrinfeldDRc.concentrated` (compatibility): H^i_{dR,c} vanishes outside i ∈ {1, 2}, since j_!O and j_!Ω¹ have only H¹ on Fl.
- `DrinfeldDRc.not_ordinary_cohomology` (non-example): H¹\_{dR,c} differs from H¹\_dR = H¹ of the uncompactified complex: the latter has H⁰\_dR ≠ 0 contributions and is dual to H¹\_{dR,c}, not equal to it.

**Acceptance.**
- H²\_{dR,c} is finite-dimensional at each finite level.

**Prerequisites.** LA.9/lubin-tate-locally-analytic-sheaves; LA.9/global-kernel-of-d.

**Source.** Pan II, Definition 5.6.5, §5.6.9, Lemma 5.6.10, pp. 81–83: Compactly supported de Rham cohomology of the height-zero Drinfeld tower as hypercohomology of j_! of the de Rham complex, its finite-level interpretation and the abelian action on H²\_{dR,c}.

### LA.10/vanishing-cycle-sequence — The p-adic vanishing-cycle exact sequence and honest Igusa eigenspaces

*Theorem.* Planet: *p-adic vanishing-cycle sequence*.

**Statement.** For k ≥ 1 there is a natural exact sequence 0 → (H¹\_{dR,c}(M^{(0)}\_{Dr,∞}) ⊗ A_{D,(k,0)})^{O_{D_p}^×} → H¹(D_k) → Ind_B^{GL_2(Q_p)}H¹\_rig(Ig(K^p), Sym^k) → (H²\_{dR,c} ⊗ A_{D,(k,0)})^{O_{D_p}^×} → 0 (twists as in Pan II; the induction is the smooth one, the global sections of the ordinary sheaf H¹\_ord), and for k = 0 the same with A^c and an extra summand M_0(K^p) in the last term. Consequently, if λ comes from a cuspidal π and the generalised λ-eigenspace of H¹\_rig(Ig(K^p), Sym^k) is nonzero, then (1) it is an honest eigenspace and (2) π\_p is a principal series or special.

**Hypotheses.**
- k ≥ 0; cuspidal eigensystems λ.

**Construction or proof.**
- Snake lemma for d̄\_{k+1} on the kernel–cokernel sequences of DR_k and DR′\_k gives (5.6.1) with maps SS_k, ORD_k (Pan II §5.6.3).
- ker ORD_k = Sym^kV ⊗ the induction (Pan II Lemma 5.6.4); the supersingular map is quasi-isomorphic to Sym^kV ⊗ DR_dR on the λ\_k-isotypic part, identifying ker SS_k and coker SS_k with H¹\_{dR,c}, H²\_{dR,c} terms (Pan II Lemma 5.6.6); remove Sym^kV by taking smooth parts after tensoring with its dual (Pan II Theorem 5.6.7).
- At λ the outer terms are Hecke-semisimple; non-semisimplicity in the middle would force a full induction from B in the last term, contradicting LA.10/compactly-supported-de-rham-drinfeld's abelian H²\_{dR,c}; a nonzero map from π\_p to the induction excludes supercuspidal π\_p (Pan II Corollary 5.6.11).

**Acceptance.**
- This is the p-adic analogue of Carayol's l-adic vanishing-cycle sequence for modular curves (Pan II Remark 5.6.8), comparable through Colmez–Dospinescu–Nizioł.

**Prerequisites.** LA.10/de-rham-complex-drk; LA.10/compactly-supported-de-rham-drinfeld; LA.8/cokernel-of-d-on-rational-points; LA.9/global-kernel-of-d; LA.10/hecke-eigensystems; GL2AutomorphicRepresentationsAndTransfer:R16.3/steinberg-monodromy.

**Source.** Pan II, §5.6.3, Lemma 5.6.4, Lemma 5.6.6, Theorem 5.6.7, Remark 5.6.8, Corollary 5.6.11, pp. 80–83: The p-adic vanishing-cycle sequence relating de Rham cohomology of modular curves, compactly supported de Rham cohomology of the Drinfeld tower with quaternionic forms, and the induction of Igusa rigid cohomology; honesty of Igusa eigenspaces and exclusion of supercuspidal π\_p.

<a id="la11"></a>

## LA.11. The intertwining operator is Fontaine's operator

Construct the truncated relative period sheaves B⁺\_{dR,k} on the perfectoid modular curve and their locally analytic isotypic parts for the infinitesimal character χ̃\_k (Pan II §§6.2.1–6.2.3, Lemma 6.2.2), the Fontaine operator N_k on them (Pan II Definition 6.2.5), their cohomology and its comparison with completed cohomology (Pan II Lemma 6.2.9–Proposition 6.2.17), and prove that I_{k−1} equals N_k up to a nonzero rational scalar (Pan II Theorem 6.2.6 = Theorem 1.2.10): the reduction to two comparisons through OB⁺\_dR and the Kodaira–Spencer presentation (Pan II §6.3), the first comparison through the period x̃ and the p-adic Legendre relation (Pan II §6.4), and the second comparison through Faltings's extension (Pan II §6.5). Fontaine's operator for Banach and LB B⁺\_dR/(t^k)-modules is imported.

**Depends on.** LA.1, LA.2, LA.3, LA.6, AlgebraicModularFormsAndSerreWeights:R15.1, CohomologyComparisons:CP.6, HodgeTateAndCanonicalSubgroups:T6:comparison, PadicHodgeTheory:P8, PadicHodgeTheory:R06.1, PadicHodgeTheory:R06.2.

### LA.11/relative-period-sheaves-on-the-flag-variety — Truncated relative period sheaves and their locally analytic isotypic parts

*Construction.*

**Statement.** On X_{K^p}, A_inf assigns to an affinoid perfectoid V the Witt vectors of the tilt of O⁺(V), with θ onto O⁺; B⁺\_dR is the ker θ-adic completion of A_inf[1/p], with Fontaine's t generating the relative kernel, so gr^iB⁺\_dR = O(i). Push forward along π\_HT to get B⁺\_dR on Fl with gr^i = O_{K^p}(i), and truncate: B⁺\_{dR,k} = B⁺\_dR/(t^k). For U ∈ 𝔅, B⁺\_{dR,k}(U) is a flat Banach B⁺\_dR/(t^k)-module with unit ball the image of A_inf, with GL_2(Q_p)- and (for K large) G_K-action; B^{+,la}\_{dR,k} is the locally analytic subsheaf, with g-action, and for an infinitesimal character χ̃ of Z = Z(U(g)), B^{+,la,χ̃}\_{dR,k} its χ̃-isotypic part. Then gr^iB^{+,la}\_{dR,k} ≅ O^la_{K^p}(i) and gr^iB^{+,la,χ̃}\_{dR,k} ≅ O^{la,χ̃}\_{K^p}(i) for 0 ≤ i ≤ k − 1; both sheaves are flat over B⁺\_dR/(t^k). The restriction B⁺\_{dR,k}(U₁) → B⁺\_{dR,k}(U₁₂) is a closed embedding, strict for the t-adic filtration; so are the maps on G_n-analytic χ̃-isotypic sections (closed embeddings) and on locally analytic χ̃-isotypic sections (closed embeddings, strict for the t-adic filtration); their Čech cohomology for {U₁, U₂} computes H\*(Fl, B⁺\_{dR,k}) and H\*(Fl, B^{+,la,χ̃}\_{dR,k}), flat over B⁺\_dR/(t^k) with gr^iH\* = H\*(gr^i), and H\*(Fl, B^{+,la,χ̃}\_{dR,k}) is Hausdorff.

**Hypotheses.**
- B⁺\_dR is the ker θ-adic completion of A_inf[1/p] on affinoid perfectoid opens, as in Scholze 2013 §6; χ̃ an infinitesimal character, viewed as a W-orbit in h\* by Harish-Chandra.

**Construction or proof.**
- Construction and graded pieces from Scholze's period sheaves (Pan II §6.2.1).
- gr^i commutes with locally analytic vectors by LA-acyclicity of O_{K^p}(U) (LA.2/la-acyclicity-on-the-basis); with χ̃-parts by a Koszul-complex vanishing of Ext_Z(χ̃, −) after Harish-Chandra embeds Z in a polynomial ring in two variables, using the h-cohomology vanishing of LA.2/weight-sheaves (Pan II Lemma 6.2.2).
- Strictness from LA.3/lb-topology-on-cohomology's Lemmas 3.4.2–3.4.3 on graded pieces (Pan II Lemma 6.2.9, Corollaries 6.2.10–6.2.11); cohomology and Hausdorffness from LA.3/cohomology-is-hausdorff-lb (Pan II Definition 6.2.12, Proposition 6.2.13).

**Uses.**
- Pan II Definition 6.2.5: the Fontaine operator N_k.
- Pan II §6.3: resolution by the Poincaré lemma sequence.
- Pan II Theorem 7.2.2: comparison with completed cohomology with B⁺\_{dR,k} coefficients.

**API.**
- `PeriodSheaf.B` (data): B⁺\_{dR,k} on Fl, a sheaf of flat Banach B⁺\_dR/(t^k)-algebras with GL_2(Q_p)-action.
- `PeriodSheaf.la_isotypic` (data): B^{+,la,χ̃}\_{dR,k} ⊂ B^{+,la}\_{dR,k} ⊂ B⁺\_{dR,k}.
- `PeriodSheaf.gr` (equivalence): gr^iB^{+,la,χ̃}\_{dR,k} ≅ O^{la,χ̃}\_{K^p}(i), 0 ≤ i < k.
- `PeriodSheaf.flat` (other): B⁺\_{dR,k}(U) and B^{+,la,χ̃}\_{dR,k}(U) are flat over B⁺\_dR/(t^k).
- `PeriodSheaf.cohomology` (characterisation): H\*(Fl, B^{+,la,χ̃}\_{dR,k}) is computed by the strict Čech complex of {U₁, U₂}, is flat with gr^iH\* = H\*(gr^i), and is Hausdorff.
- `PeriodSheaf.galois` (structure): For U ∈ 𝔅 and K large, G_K acts on B⁺\_{dR,k}(U) semilinearly, commuting with GL_2(Q_p).

**Unit tests.**
- `PeriodSheaf.k_one` (degenerate): B⁺\_{dR,1} = O_{K^p} and B^{+,la,χ̃}\_{dR,1} = O^{la,χ̃}\_{K^p}.
- `PeriodSheaf.t_multiplication` (computation): Multiplication by t induces gr^i ≅ gr^{i+1}(−1), i.e. O^{la}(i) → O^{la}(i + 1) is the identity up to the twist.
- `PeriodSheaf.absolute` (compatibility): The global constants B⁺\_dR(C)/(t^k) → H⁰(Fl, B⁺\_{dR,k}) are the absolute truncated de Rham periods of R06.1.
- `PeriodSheaf.not_split` (non-example): B^{+,la}\_{dR,2} is not O^la ⊕ O^la(1) as a g × G_K-module: the extension is the source of the Fontaine operator, which is nonzero (LA.11/intertwining-operator-is-fontaine-operator).

**Acceptance.**
- For k = 1, B⁺\_{dR,1} = O_{K^p} and the statements reduce to LA.2–LA.3.

**Prerequisites.** PadicHodgeTheory:R06.1/plan/bdr-plus-of-perfectoid-affinoid-algebras; PadicHodgeTheory:R06.1/plan/fontaine-element-t; LA.2/la-acyclicity-on-the-basis; LA.2/weight-sheaves; LA.3/lb-topology-on-cohomology; LA.3/cohomology-is-hausdorff-lb; LA.1/horizontal-cartan-action.

**Source.** Pan II, §6.2.1, Lemma 6.2.2, §6.2.8, Lemma 6.2.9, Corollaries 6.2.10–6.2.11, Definition 6.2.12, Proposition 6.2.13, pp. 92–96: The relative period sheaves B⁺\_{dR,k} on the infinite-level modular curve and Fl, their locally analytic χ̃-isotypic subsheaves with graded pieces O^{la,χ̃}(i), flatness, strict Čech complexes and their cohomology.

### LA.11/infinitesimal-character-chi-k — The infinitesimal character χ̃\_k and the Hodge–Tate decomposition

*Definition.*

**Statement.** For k ≥ 1, χ̃\_k is the dot-orbit {(0, 1 − k), (−k, 1)} ⊂ h\*, the infinitesimal character of Sym^{k−1} of the dual of the standard representation. On the χ̃\_k-isotypic part, θ\_h satisfies a quadratic relation, giving O^{la,χ̃\_k}\_{K^p} = O^{la,(1−k,0)}\_{K^p} ⊕ O^{la,(1,−k)}\_{K^p}, Hodge–Tate of weights 0 and k respectively, so the χ̃\_k-isotypic part is Hodge–Tate of weights 0, k. Correspondingly B^{+,la,χ̃\_k}\_{dR,k+1}(U), a Hausdorff LB-space module over B⁺\_dR/(t^{k+1}) (a colimit of flat Banach modules), is Hodge–Tate of weights 0, k and satisfies the hypotheses of the LB Fontaine construction (Pan II §6.1.17).

**Hypotheses.**
- Harish-Chandra: Z(U(g)) ≅ S(h)^{W·}; θ\_h relates to Z as in LA.1/horizontal-cartan-action.

**Construction or proof.**
- Compute the Harish-Chandra image of Sym^{k−1}(V\*) (Pan II §6.2.3).
- The two θ\_h-weights in the orbit give the decomposition; Hodge–Tate weights from LA.3/analytic-vectors-are-hodge-tate (weight −n₂: 0 for (1 − k, 0), k for (1, −k)).

**Uses.**
- Pan II Definition 6.2.5: N_k is defined on the χ̃\_k-isotypic part.
- Pan II §1.2.2 and Theorem 7.1.2: the χ̃\_k-part of completed cohomology carries the Fontaine operator.

**API.**
- `ChiTilde.orbit` (data): χ̃\_k = {(0, 1 − k), (−k, 1)} as a W·-orbit in h\*.
- `ChiTilde.decomposition` (equivalence): O^{la,χ̃\_k} = O^{la,(1−k,0)} ⊕ O^{la,(1,−k)}.
- `ChiTilde.orbit_dot` (relation): The second representative is the dot reflection of the first.
- `ChiTilde.matches_theta_weights` (compatibility): The Harish-Chandra invariants of χ̃\_k equal the θ\_h-invariants of the weight (1 − k, 0), whose reflection is (1, −k).
- `ChiTilde.hodgeTate` (characterisation): O^{la,(1−k,0)} has Hodge–Tate weight 0 and O^{la,(1,−k)} weight k.
- `ChiTilde.periodModule` (compatibility): B^{+,la,χ̃\_k}\_{dR,k+1}(U) is a Hausdorff LB-module over B⁺\_dR/(t^{k+1}), Hodge–Tate of weights 0, k, satisfying the hypotheses of Pan II §6.1.17.

**Unit tests.**
- `ChiTilde.k_one` (computation): χ̃\_1 = {(0, 0), (−1, 1)}: the dot action w·μ = w(μ + ρ) − ρ with ρ = (1/2, −1/2) sends (0, 0) to (−1, 1).
- `ChiTilde.sym_power` (compatibility): χ̃\_k is the infinitesimal character of Sym^{k−1}V\*, whose highest weight is (0, 1 − k).
- `ChiTilde.weights_differ` (degenerate): The two Hodge–Tate weights 0 and k differ by k ≥ 1, so the decomposition is canonical (distinct Sen eigenvalues).
- `ChiTilde.not_single_weight` (non-example): O^{la,χ̃\_k} is not a single weight sheaf: it is the sum of two weight sheaves exchanged by the dot action.

**Acceptance.**
- For k = 1, χ̃\_1 = {(0, 0), (−1, 1)}, the trivial infinitesimal character, and O^{la,χ̃\_1} = O^{la,(0,0)} ⊕ O^{la,(1,−1)}.

**Prerequisites.** LA.1/horizontal-cartan-action; LA.3/analytic-vectors-are-hodge-tate; LA.11/relative-period-sheaves-on-the-flag-variety.

**Source.** Pan II, §6.2.3, p. 94: The infinitesimal character χ̃\_k, the quadratic relation for θ\_h on the isotypic part and the decomposition into the two weight sheaves of Hodge–Tate weights 0 and k. Pan II, §1.2.2, p. 6: Π\_ρ^la has infinitesimal character χ̃\_k and H̃¹(K^p, Q_p)^{la,χ̃\_k} is Hodge–Tate of weights 0, k (from Pan I Proposition 6.1.5).

### LA.11/sheaf-fontaine-operator — The Fontaine operator N_k on O^{la,(1−k,0)}

*Definition.* Planet: *Fontaine operator N_k*.

**Statement.** For U ∈ 𝔅 the module B^{+,la,χ̃\_k}\_{dR,k+1}(U) satisfies the hypotheses of the LB-space Fontaine construction (requested from the PadicHodgeTheory Part II), giving a Fontaine operator O^{la,(1−k,0)}\_{K^p}(U) → O^{la,(1,−k)}\_{K^p}(U)(k); by functoriality these glue to N_k: O^{la,(1−k,0)}\_{K^p} → O^{la,(1,−k)}\_{K^p}(k). Concretely: on the G_{K_∞}-fixed G_K-analytic vectors, the action ∇ of 1 ∈ Lie Gal(K_∞/K) on the generalised 0-eigenspace E_0 is an extension of the weight-0 graded piece by the twisted weight-k piece on which ∇ acts trivially, and ∇ induces the map between them, extended C-linearly. On cohomology, H¹(Fl, B^{+,la,χ̃\_k}\_{dR,k+1}) is Hodge–Tate of weights 0, k and its Fontaine operator is H¹(N_k); for k ≥ 2, H¹(Fl, B^{+,la,χ̃\_k}\_{dR,k+1}) = H¹(Fl, B⁺\_{dR,k+1})^{la,χ̃\_k}, and for k = 1 these differ by Ext¹\_Z, Ext²\_Z(χ̃\_1, H⁰(Fl, B⁺\_{dR,2})^la).

**Hypotheses.**
- k ≥ 1; U ∈ 𝔅 with G_K acting.

**Construction or proof.**
- Apply the LB Fontaine construction of Pan II §6.1.19 to B^{+,la,χ̃\_k}\_{dR,k+1}(U) (Pan II §6.2.4, Definition 6.2.5).
- On Čech complexes use Proposition 6.1.20 and Corollary 6.1.21 (with B⁺\_dR/(t^{k+1})) (Pan II §6.2.14).
- The comparison with Banach cohomology follows Pan I Theorem 4.4.6 and Corollary 5.1.3; the Ext terms vanish for k ≥ 2 because sl_2(Q_p) acts trivially on H⁰ (Pan II §6.2.16, Proposition 6.2.17).

**Uses.**
- Pan II Theorem 6.2.6, p. 94: N_k = c_kI_{k−1}.
- Pan II §1.2.2 and §7: N on completed cohomology detects de Rham representations.

**API.**
- `FontaineSheaf.N` (data): N_k: O^{la,(1−k,0)}\_{K^p} → O^{la,(1,−k)}\_{K^p}(k), a continuous map of sheaves.
- `FontaineSheaf.local` (characterisation): N_k(U) is the Fontaine operator of the Hodge–Tate module B^{+,la,χ̃\_k}\_{dR,k+1}(U).
- `FontaineSheaf.H1` (compatibility): H¹(N_k) is the Fontaine operator of H¹(Fl, B^{+,la,χ̃\_k}\_{dR,k+1}).
- `FontaineSheaf.banach` (equivalence): For k ≥ 2, H¹(Fl, B^{+,la,χ̃\_k}\_{dR,k+1}) = H¹(Fl, B⁺\_{dR,k+1})^{la,χ̃\_k}.
- `FontaineSheaf.equivariant` (functoriality): N_k commutes with GL_2(Q_p), prime-to-p Hecke operators and G_{Q_p}.

**Unit tests.**
- `FontaineSheaf.de_rham_vanishing` (compatibility): For V ⊂ H̃¹(K^p, Q_p)^{la,χ̃\_k} two-dimensional irreducible, the restriction of H¹(N_k) to (V ⊗ C)\_0 is Fontaine's N_V, zero iff V is de Rham.
- `FontaineSheaf.split_case` (degenerate): If B^{+,la,χ̃\_k}\_{dR,k+1}(U) were split as a sum of Tate twists of its graded pieces (as for W = C ⊕ C(k) with trivial extension), N would be 0.
- `FontaineSheaf.k_one_weights` (computation): For k = 1, N_1: O^{la,(0,0)} → O^{la,(1,−1)}(1), the same source and target as I_0.
- `FontaineSheaf.not_zero` (non-example): N_k ≠ 0: by LA.11/intertwining-operator-is-fontaine-operator it is a nonzero multiple of I_{k−1}, which is nonzero (LA.6/intertwining-operator).

**Acceptance.**
- For W = V ⊗ B⁺\_dR/(t^{k+1}) with V two-dimensional of Hodge–Tate weights 0, k, the same recipe gives Fontaine's N_W, which vanishes iff V is de Rham (Pan II Theorem 6.1.16).

**Prerequisites.** LA.11/relative-period-sheaves-on-the-flag-variety; LA.11/infinitesimal-character-chi-k; PadicHodgeTheory:R06.2.

**Source.** Pan II, §6.2.4, Definition 6.2.5, §6.2.14, Corollary 6.2.15, §6.2.16, Proposition 6.2.17, pp. 94–96: The Fontaine operator on the χ̃\_k-isotypic period sheaves, its cohomological version and the comparison with the locally analytic vectors of Banach cohomology. Pan II, §1.2.1 and §6.1.12–Theorem 6.1.16, pp. 6 and 88–90: Fontaine's operator N for a Hodge–Tate representation of weights 0, k and its vanishing criterion for de Rham representations.

### LA.11/log-period-sheaf-presentation — The log de Rham period sheaf on the modular curve: Kodaira–Spencer presentation

*Theorem.*

**Statement.** Let V₀ ⊂ X_{K^pK_p} be an affinoid with preimage V_∞ = π\_HT^{-1}(U), U ∈ 𝔅, and OB⁺\_dR (log, of Diao–Lan–Liu–Zhu) with its Poincaré sequence 0 → B⁺\_dR → OB⁺\_dR → OB⁺\_dR ⊗ Ω¹\_{V₀}(C) → 0 and log Faltings extension. By Kodaira–Spencer, Ω¹\_{V₀}(C) ≅ ω², hence O(V_∞) ⊗ Ω¹\_{V₀}(C) ≅ O(V_∞) after a choice of generator; gr^kOB⁺\_dR(V_∞) = Sym^k(gr¹) is filtered with graded pieces O(V_∞)(i), i = 0, …, k; and for X ∈ Fil¹OB⁺\_dR(V_∞) mapping to a generator of O(V_∞) ⊗ Ω¹\_{V₀}(C), B⁺\_dR(V_∞)[[X]] → OB⁺\_dR(V_∞) is an isomorphism, of filtered groups with X in degree one. The truncations OB⁺\_{dR,k}(U) are finite B⁺\_{dR,k}(U)-modules and Banach algebras with unit ball the image of A_inf(V_∞)[[X]]; their locally analytic and χ̃-isotypic parts have graded pieces as in CP.6/pan-graded-analytic-decompletion.

**Hypotheses.**
- The log structure of the cusps; V₀ small enough that ω is trivial on it.

**Construction or proof.**
- Import OB⁺\_dR,log, its connection, Poincaré lemma and the toric power-series model (T6:comparison) (Pan II §6.3.5–6.3.6).
- Kodaira–Spencer makes Ω¹\_{V₀}(C) trivial, and Sym of Faltings's extension gives the filtration; the toric model gives the presentation (Pan II (6.3.3)).
- Graded pieces commute with analytic vectors and decompletion (CP.6/pan-graded-analytic-decompletion, Pan II Proposition 6.3.9).

**Acceptance.**
- For k = 1, gr¹OB⁺\_dR(V_∞) is the log Faltings extension of O(V_∞) ⊗ Ω¹ by O(V_∞)(1), identified by LA.1/faltings-extension-is-hodge-tate-sequence with the Hodge–Tate sequence.

**Prerequisites.** HodgeTateAndCanonicalSubgroups:T6:comparison/structural-log-period-plus; HodgeTateAndCanonicalSubgroups:T6:comparison/log-poincare; HodgeTateAndCanonicalSubgroups:T6:comparison/log-faltings-extension; HodgeTateAndCanonicalSubgroups:T6:comparison/toric-structural-period-model; AlgebraicModularFormsAndSerreWeights:R15.1/logarithmic-kodaira-spencer; CohomologyComparisons:CP.6/pan-graded-analytic-decompletion; LA.1/faltings-extension-is-hodge-tate-sequence; LA.11/relative-period-sheaves-on-the-flag-variety.

**Source.** Pan II, §§6.3.5–6.3.8 with (6.3.2)–(6.3.3), pp. 99–101: The structural log de Rham period sheaf on the modular curve, its Poincaré sequence and Faltings extension, the Kodaira–Spencer trivialisation of Ω¹, the filtration of gr^k and the presentation B⁺\_dR[[X]] ≅ OB⁺\_dR, and the truncated sheaves OB⁺\_{dR,k}.

### LA.11/reduction-to-two-comparisons — Reduction of N_k = c_kI_{k−1} to two comparisons

*Theorem.*

**Statement.** Let M be an abelian group with an endomorphism N, N² = 0, M′ ⊂ ker N a subgroup containing N(M), M″ = M/M′, so N induces N_{M′}: M″ → M′. Suppose M₁ ⊃ M carries N₁ with N₁² = 0 and N₁|\_M = N, θ: M₁ → M″ extends the quotient map, M′₁ ⊂ ker θ is N₁-stable with M′₁ ∩ M = M′ and N₁(M′₁) ⊂ M′, M′₂ = M′₁/M′ ⊂ M₂ = M₁/M with quotient map π, and s: M″ → ker N₁ is a right inverse of θ with π∘s(M″) ⊂ M′₂; then N_{M′} = −N_{1,M′} ∘ (π ∘ s) as maps M″ → M′. Applied to E_0 of the χ̃\_k-isotypic decompleted period module, the truncated Poincaré sequence and its gr^k-part, and a section s_{k+1} of E_0(θ\_log) (LA.11/first-comparison), this gives N_k(U) = −N′\_k ∘ (E_0(∇\_log) ∘ s_{k+1}), where N′\_k is the Lie-algebra action on the middle term of the gr^k sequence. Hence Theorem 6.2.6 follows from (A) E_0(∇\_log) ∘ s_{k+1} = d_k on O^{la,(1−k,0)}(U)^{G_K} and (B) N′\_k = c_kd̄′\_k for some c_k ∈ Q_p^×.

**Hypotheses.**
- U ∈ 𝔅 with e₁ invertible on its preimage and G_K acting.

**Construction or proof.**
- Linear algebra (Pan II §6.3.2, Lemma 6.3.3, Remark 6.3.4).
- Generalised eigenspace decomposition for 1 ∈ Lie Gal(K_∞/K) on the decompleted isotypic sections and the main diagram of two exact rows (Pan II §§6.3.10–6.3.11).
- Read off the reduction (Pan II §6.3.12, Propositions 6.3.13–6.3.14); the case k = 1 is sketched first in §6.3.1.

**Acceptance.**
- For k = 1, (A) reads E_0(∇\_log) ∘ s₂ = d₁ and (B) N′\_1 = c₁d̄′₁.

**Prerequisites.** LA.11/log-period-sheaf-presentation; LA.11/sheaf-fontaine-operator; CohomologyComparisons:CP.6/pan-graded-analytic-decompletion.

**Source.** Pan II, §6.3.1–§6.3.4, §§6.3.10–6.3.12, Propositions 6.3.13–6.3.14, pp. 97–103: The linear-algebra mechanism expressing an operator through a section, and the reduction of the identity N_k = c_kI_{k−1} to the comparison of E_0(∇\_log) ∘ s_{k+1} with d_k and of N′\_k with d̄′\_k.

### LA.11/p-adic-legendre-relation — The p-adic Legendre relation and the period x̃

*Theorem.* Planet: *p-adic Legendre relation*.

**Statement.** The relative de Rham comparison provides O_{V₀}-linear period maps l_n: Sym^nD ⊗ Sym^n(V\*) → OB⁺\_dR(U). (1) An element of OB⁺\_dR(U) is invertible iff its image under θ\_log is; if θ\_log(y) has norm ≤ 1 and a_n → 0 in O_{V₀}, Σa_ny^n converges in OB⁺\_{dR,k}(U). (2) For k = 1 and e₁ invertible on the preimage, with f₁ a section of D generating gr⁰, x̃ := −l₁(f₁ ⊗ e₁\*)/l₁(f₁ ⊗ e₂\*) is G_K-fixed with θ\_log(x̃) = x. (3) (Legendre) For g₁, g₂ ∈ D and v₁, v₂ ∈ V\*, l₁(g₁ ⊗ v₁)l₁(g₂ ⊗ v₂) − l₁(g₁ ⊗ v₂)l₁(g₂ ⊗ v₁) ∈ t·OB⁺\_dR(U); hence ∇\_log of φ₁(x) lies in t·OB⁺\_dR(U) ⊗ Ω¹, and x̃ mod t is independent of f₁. (4) There is a G_K × G_0-equivariant map φ₁ from the decompleted weight-(0, 0) sections to OB⁺\_dR(U) with θ\_log ∘ φ₁ = id, linear over finite-level functions, continuous into each truncation, with φ₁(x) ≡ x̃ mod t.

**Hypotheses.**
- U ∈ 𝔅 with e₁ invertible on the preimage; f₁ fixed.

**Construction or proof.**
- (1): completeness for the ker θ\_log-adic topology and a Teichmüller-type splitting, as Berger–Colmez Lemme 4.9 (Pan II Lemmas 6.4.2–6.4.3).
- (2): l₁(f₁ ⊗ e₂\*) has invertible θ\_log-image, so is invertible (Pan II §6.4.4).
- (3): the determinant of the de Rham bundle lands in t times the determinant of V — Scholze's lattice comparison (requested) (Pan II §6.4.5, Lemma 6.4.6, §6.4.7).
- (4): build φ₁ from x̃ and the expansion of LA.2/weight-sheaves (Pan II Proposition 6.4.8).

**Acceptance.**
- The name: over C the analogous relation between periods of an elliptic curve is Legendre's relation ω₁η₂ − ω₂η₁ = 2πi, with t playing 2πi.

**Prerequisites.** LA.11/log-period-sheaf-presentation; PadicHodgeTheory:P8/horizontal-relative-periods; HodgeTateAndCanonicalSubgroups:T6:comparison/log-riemann-hilbert; LA.2/weight-sheaves; PadicHodgeTheory:P8.

**Source.** Pan II, §6.4.1–Proposition 6.4.8, pp. 103–107: Period maps from the relative de Rham comparison, invertibility and convergence in OB⁺\_dR, the period x̃ lifting the coordinate x, the p-adic Legendre relation and the section φ₁ in weight zero.

### LA.11/first-comparison — First comparison: E_0(∇\_log) ∘ s_{k+1} = d_k

*Theorem.*

**Statement.** For k ≥ 1 define s_{k+1} := (l′\_{k−1} mod Fil^{k+1}) ∘ ψ\_{k−1}, where l′\_n extends l_n linearly over the decompleted weight-(0, 0) sections using φ₁ and ψ\_{k−1} is the canonical splitting of LA.6/operator-d (Pan II Lemma 4.1.6) transported to the period side; it takes values in the locally analytic χ̃\_k-isotypic part with θ\_log ∘ s_{k+1} = id. Then ∇\_log ∘ s_{k+1} lands in Fil^{k−1} of the truncated structural sheaf tensor Ω¹\_{V₀}(C) and equals d_k under the identification with O^{la,(1−k,0)}(U) ⊗ (Ω¹\_{V₀}(C))^{⊗k}.

**Hypotheses.**
- k ≥ 1; the choices of LA.11/p-adic-legendre-relation.

**Construction or proof.**
- Construct s_{k+1} following §4.1 (Pan II §6.4.9, Definition 6.4.10).
- It suffices to prove the identity modulo t, since reduction mod t is injective on G_K-invariants of the truncated isotypic structural sheaf (Pan II Lemma 6.4.12).
- Modulo t it is the commutativity of an explicit diagram, using that l′\_{k−1} mod t extends C-linearly (Pan II Lemma 6.4.13, Proposition 6.4.11).

**Acceptance.**
- For k = 1, s₂ = φ₁ and the identity says ∇\_log(φ₁(f)) ≡ d₁(f) — the derivative along the modular curve is the log connection on periods.

**Prerequisites.** LA.11/p-adic-legendre-relation; LA.11/reduction-to-two-comparisons; LA.6/operator-d.

**Source.** Pan II, §6.4.9, Definition 6.4.10, Proposition 6.4.11, Lemmas 6.4.12–6.4.13, pp. 107–109: Construction of the section s_{k+1} and the proof that ∇\_log ∘ s_{k+1} = d_k, by reduction modulo t to an explicit diagram.

### LA.11/second-comparison — Second comparison: N′\_k = c_kd̄′\_k with c_k ∈ Q^×

*Theorem.*

**Statement.** The gr^k Poincaré sequence 0 → gr^kB^{+,la}\_dR(U) → gr^kOB^{+,la}\_dR(U) → gr^{k−1}OB^{+,la}\_dR(U) ⊗ Ω¹\_{V₀}(C) → 0 stays exact after taking χ̃\_k-isotypic parts, G_{K_∞}-fixed G_K-analytic vectors and G_K-invariants; Z acts on gr^kB^{+,la}\_dR(U)^{G_K,z_k} through χ̃\_k, and on gr^{k−1}OB^{+,la}\_dR(U)^{G_K,z_k} the χ̃\_k-generalised eigenspace is honest and equals O^{la,(1−k,0)}(U)^{G_K} ⊗ Ω¹\_{V₀}(C)^{⊗(k−1)}. The shifted Casimir induces Ñ\_k between the outer terms O^{la,(1−k,0)}(U)^{G_K} ⊗ Ω¹\_{V₀}(C)^{⊗k} and O^{la,(1,−k)}(U)(k)^{G_K}, N′\_k = Ñ\_k/(2k), and Ñ\_k = c d̄′\_k for some c ∈ Q^×. Hence N′\_k = c_kd̄′\_k with c_k ∈ Q^×.

**Hypotheses.**
- U ∈ 𝔅 with e₁ invertible; the trivialisation of ∧²D fixed.

**Construction or proof.**
- Exactness by an equivariant splitting of the locally analytic Faltings extension (Faltings) for k = 1 and symmetric powers in general (Pan II Proposition 6.5.2, Lemma 6.5.3).
- The quadratic relation for θ\_Sen, which is θ\_h of the lower-right idempotent (LA.3/theta-h-is-the-sen-operator), controls the Z-action (Pan II Proposition 6.5.4, Corollary 6.5.5).
- Compare N′\_k with Ñ\_k (Pan II §6.5.6, Lemma 6.5.7).
- Both Ñ\_k and d̄′\_k are continuous O^sm-linear and preserve the dense n-finite parts, where they come from g-maps M^∨\_{(0,1−k)} → M^∨\_{(−k,1)}(k) between category-O modules; such maps form a one-dimensional space and neither is zero (Verma module of highest weight −ρ, translation functors), so they are proportional; Q-structures give c ∈ Q^× (Pan II §6.5.8–Remark 6.5.13, Lemmas 6.5.9–6.5.12).

**Acceptance.**
- The n-finite part of the Hodge–Tate sequence is ω^{2,sm} ⊗ (0 → M^∨\_{(−1,1)}(1) → V(1) ⊗ M^∨\_{(0,−1)} → M^∨\_{(0,0)} → 0) (Pan II Lemma 6.5.10).

**Prerequisites.** LA.11/reduction-to-two-comparisons; LA.11/log-period-sheaf-presentation; LA.6/operator-dbar; LA.2/weight-sheaves; LA.3/theta-h-is-the-sen-operator; HodgeTateAndCanonicalSubgroups:T6:comparison/log-faltings-extension.

**Source.** Pan II, §6.5.1–Remark 6.5.13, Propositions 6.5.2, 6.5.4, Lemmas 6.5.3, 6.5.7, 6.5.9, 6.5.10, 6.5.12, Corollary 6.5.5, pp. 110–115: Exactness of the gr^k Poincaré sequence after taking invariants, the action of the centre, the operator Ñ\_k from the shifted Casimir, and its proportionality with d̄′\_k through category O, with a rational constant.

### LA.11/intertwining-operator-is-fontaine-operator — The intertwining operator is Fontaine's operator

*Theorem.* Planet: *Intertwining operator = Fontaine operator*.

**Statement.** For every integer k ≥ 1 there is c_k ∈ Q_p^× (in fact in Q^×, Pan II Remark 6.5.13) with N_k = c_kI_{k−1} as maps O^{la,(1−k,0)}\_{K^p} → O^{la,(1,−k)}\_{K^p}(k). On cohomology: for k ≥ 2, I¹\_{k−1} = c_k^{−1}N on H̃¹(K^p, C)^{la,(1−k,0)} = W_0 → W_k(k); for k = 1, the restriction of I¹\_0 to H¹(Fl, O^{la,(0,0)})[λ\_τ] agrees with c₁^{−1}N on W_0[λ\_τ] (Theorem 1.2.10).

**Hypotheses.**
- k ≥ 1; for k = 1 the statement on cohomology is on λ\_τ-isotypic parts because H¹(Fl, O^{la,(0,0)}) → W_0 is not an isomorphism (extra H̃⁰ term).

**Construction or proof.**
- Local identity on U ∈ 𝔅 from LA.11/reduction-to-two-comparisons with (A) LA.11/first-comparison and (B) LA.11/second-comparison: N_k(U) = −c_k d̄′\_k ∘ d_k, i.e. a rational multiple of I_{k−1} (Pan II Theorem 6.2.6).
- Glue over 𝔅 and pass to H¹ through LA.11/sheaf-fontaine-operator (Pan II Corollary 6.2.15); the constant is rational (Remark 6.5.13; Remark 6.2.7 notes it is not needed).

**Acceptance.**
- Consequence: for V ⊂ H̃¹(K^p, Q_p)^{la,χ̃\_k} two-dimensional irreducible, V is de Rham iff I¹\_{k−1} vanishes on (V ⊗ C)\_0.

**Prerequisites.** LA.11/reduction-to-two-comparisons; LA.11/first-comparison; LA.11/second-comparison; LA.11/sheaf-fontaine-operator; LA.6/intertwining-operator.

**Source.** Pan II, Theorem 6.2.6, Remark 6.2.7, Corollary 6.2.15, pp. 94–96; Theorem 1.2.10, p. 8: N_k is a nonzero rational multiple of the intertwining operator I_{k−1}, on sheaves and on cohomology.

<a id="la12"></a>

## LA.12. Classicality and the locally analytic vectors of Π\_ρ

Compare completed cohomology with the cohomology of the truncated period sheaves (Pan II Theorem 7.2.2, Lemma 7.2.7, with Proposition 7.2.3 and Lemmas 7.2.4–7.2.6 imported) and obtain the Fontaine operator N on H̃¹(K^p, Q_p)^{la,χ̃\_k} (Pan II §1.2.2). Prove Emerton's classicality theorem — an absolutely irreducible two-dimensional ρ appearing in completed cohomology and de Rham at p with Hodge–Tate weights 0, k > 0 comes from a cuspidal eigenform of weight k + 1 — and the finiteness of the n-invariants of Π\_ρ (Pan II Theorem 7.1.2 = Theorems 1.1.2, 1.1.14), the description of Π\_ρ^la ⊗̂ C in the supercuspidal case (Breuil–Strauch) and the principal series case (Berger–Breuil–Emerton) (Pan II Theorems 7.3.2, 7.3.7), and the uniform description as H¹(DR_{k−1})[λ]/Fil¹ (Pan II Remarks 1.1.13, 7.3.10). The special case is recorded as the conditional claim of Pan II Remark 7.3.11.

**Depends on.** LA.10, LA.11, LA.2, LA.5, LA.7, LA.8, AutomorphicGaloisRepresentations:R19.1, CohomologyComparisons:CP.6, CompletedCohomologyAndLocalGlobalCompatibility:R31.3, CompletedCohomologyAndLocalGlobalCompatibility:R31.4, CompletedCohomologyPartII:CC.4, CompletedCohomologyPartII:CC.5, GL2AutomorphicRepresentationsAndTransfer:R16.3, GL2AutomorphicRepresentationsAndTransfer:R17.3, PadicDifferentialEquationsAndRigidCohomology:RD.4, PadicLocalLanglandsForGL2Qp:R30.4, PadicLocalLanglandsForGL2Qp:R30.6.

### LA.12/multiplicity-space-pi-rho — The Banach representation Π\_ρ and its locally analytic vectors

*Definition.*

**Statement.** Let E/Q_p be finite and ρ: G_Q → GL_2(E) continuous, two-dimensional, absolutely irreducible. Π\_ρ := Hom_{E[G_Q]}(ρ, H̃¹(K^p, E)) with H̃¹(K^p, E) = H̃¹(K^p, Z_p) ⊗ E, an admissible E-Banach representation of GL_2(Q_p); H̃¹(K^p, E)[ρ] is the image of the evaluation map ρ ⊗ Π\_ρ → H̃¹(K^p, E). Π\_ρ^la is its subspace of GL_2(Q_p)-locally analytic vectors. With λ the cyclotomic twist of the Hecke eigensystem with ρ\_λ(−1) = ρ, H̃¹(K^p, E)[ρ] is the λ-isotypic part, and H̃¹(K^p, E)[ρ] ⊗̂ C = W_0 ⊕ W_k (Hodge–Tate weights 0, k) when ρ|G_{Q_p} has Hodge–Tate weights 0, k. If ρ is attached to a cuspidal eigenform, fixing τ: E → C gives an irreducible π^∞ = ⊗′π\_l of GL_2(A_f), the finite part of an automorphic representation, with (π^∞)^{K^p} the λ\_τ-part of M_{k+2} ⊗ D₀^{−1}.

**Hypotheses.**
- ρ appears in H̃¹(K^p, E), i.e. Π\_ρ ≠ 0.

**Construction or proof.**
- Admissibility from that of completed cohomology (CC.5); Π\_ρ^la ≠ 0 by Schneider–Teitelbaum (Pan II §1.2.2).
- The λ-isotypic decomposition from LA.5/pro-modular-representations (Pan II §7.2.1).
- π^∞ from the classical eigensystem (Pan II §7.3.1).

**Uses.**
- Pan II Theorem 1.1.2 = 7.1.2: classicality and finiteness.
- Pan II Theorems 1.1.7, 1.1.10, 7.3.2, 7.3.7: the geometric descriptions of Π\_ρ^la.

**API.**
- `PiRho` (data): Π\_ρ = Hom_{E[G_Q]}(ρ, H̃¹(K^p, E)), an admissible E-Banach GL_2(Q_p)-representation.
- `PiRho.la` (data): Π\_ρ^la, its locally analytic vectors.
- `PiRho.isotypic` (equivalence): ρ ⊗ Π\_ρ ≅ H̃¹(K^p, E)[ρ] = H̃¹(K^p, E)[p_λ].
- `PiRho.hodgeTate` (characterisation): H̃¹(K^p, E)[ρ] ⊗̂ C = W_0 ⊕ W_k when ρ|G_{Q_p} is Hodge–Tate of weights 0, k.
- `PiRho.automorphic` (constructor): For classical ρ and τ: E → C, the GL_2(A_f)-representation π^∞ with (π^∞)^{K^p} = (M_{k+2} ⊗ D₀^{−1})[λ\_τ].

**Unit tests.**
- `PiRho.nonzero_la` (computation): If Π\_ρ ≠ 0 then Π\_ρ^la ≠ 0 (Schneider–Teitelbaum, admissibility).
- `PiRho.twist` (compatibility): Π\_{ρ⊗ε} ≅ Π\_ρ ⊗ (twist by t): twisting ρ by the cyclotomic character corresponds to multiplying completed cohomology by t.
- `PiRho.zero` (degenerate): If ρ does not occur in H̃¹(K^p, E) then Π\_ρ = 0.
- `PiRho.not_galois_rep` (non-example): Π\_ρ is a representation of GL_2(Q_p) (and of Hecke operators), not of G_Q: the G_Q-action is absorbed by Hom_{G_Q}(ρ, −).

**Acceptance.**
- For ρ attached to a weight-two newform of tame level K^p, Π\_ρ is the multiplicity space studied by Emerton, and Π\_ρ^la ≠ 0.

**Prerequisites.** LA.5/pro-modular-representations; CompletedCohomologyPartII:CC.5/banach-admissibility; LA.2/locally-analytic-completed-cohomology; CompletedCohomologyAndLocalGlobalCompatibility:R31.3.

**Source.** Pan II, §1.1.1, §1.1.5, pp. 2–3; §7.1.1, §7.2.1, §7.3.1, pp. 115–122: Completed cohomology with E-coefficients, the multiplicity space Π\_ρ, its locally analytic vectors, the λ-isotypic part and the automorphic representation π^∞ attached to a classical ρ.

### LA.12/period-cohomology-comparison — Completed cohomology with period coefficients and the de Rham kernel

*Theorem.*

**Statement.** Let ρ be as in LA.12/multiplicity-space-pi-rho with ρ|G_{Q_p} de Rham of Hodge–Tate weights 0, k (k > 0), and λ as there. (1) For k ≥ 1 there is a natural G_{Q_p}-equivariant isomorphism of B⁺\_{dR,k}-modules H̃^i(K^p, B⁺\_{dR,k}) ≅ H^i(Fl, B⁺\_{dR,k}) (imported: CP.6/pan-truncated-period-isomorphism, Pan II Proposition 7.2.3). (2) The locally analytic λ-isotypic part of H̃¹(K^p, B⁺\_{dR,k+1} ⊗ E) is H¹(Fl, B^{+,la,χ̃\_k}\_{dR,k+1}) ⊗ E at λ. (3) (Theorem 7.2.2) There is a natural GL_2(Q_p)-equivariant isomorphism (H̃¹(K^p, E)[ρ] ⊗̂ C)\_0^{la} ≅ (ker I¹\_{k−1} ⊗ E)[λ] between the locally analytic vectors of the Hodge–Tate weight-0 part and the λ-part of ker I¹\_{k−1}. More generally, on H̃¹(K^p, Q_p)^{la,χ̃\_k} ⊗̂ C = W_0 ⊕ W_k there is a natural continuous N: W_0 → W_k(k), equal to c_k^{−1}I¹\_{k−1}, whose restriction to (V ⊗ C)\_0 is Fontaine's operator of V for every two-dimensional irreducible G_Q-subrepresentation V (Pan II §1.2.2).

**Hypotheses.**
- ρ\_λ has Hodge–Tate weights −1, k − 1 (Pan's convention), so the locally analytic vectors of the isotypic part have infinitesimal character χ̃\_k.

**Construction or proof.**
- (1): the comparison map on the étale site and the limit arguments are imported (CP.6/pan-etale-site-truncated-comparison-map, pan-bounded-torsion-inverse-limit, pan-completed-coefficient-and-flag-descent; CC.4/completed-coefficient-interchange).
- (2): infinitesimal character χ̃\_k by LA.5/infinitesimal-character-of-eigenspaces, then (1) with LA.11/sheaf-fontaine-operator's comparison with Banach cohomology (Pan II Lemma 7.2.7).
- (3): ρ de Rham makes Fontaine's operator of the λ-part vanish (Fontaine, requested with the PadicHodgeTheory Part II); by functoriality and LA.11/intertwining-operator-is-fontaine-operator that operator is I¹\_{k−1} on the weight-0 part, which is therefore exactly the kernel (Pan II proof of Theorem 7.2.2).

**Acceptance.**
- For k = 1 the statement is on the λ\_τ-isotypic part, where H¹(Fl, O^{la,(0,0)})[λ\_τ] = W_0[λ\_τ] (Pan II §1.2.5).

**Prerequisites.** LA.12/multiplicity-space-pi-rho; CohomologyComparisons:CP.6/pan-truncated-period-isomorphism; CohomologyComparisons:CP.6/pan-etale-site-truncated-comparison-map; CohomologyComparisons:CP.6/pan-bounded-torsion-inverse-limit; CohomologyComparisons:CP.6/pan-completed-coefficient-and-flag-descent; CompletedCohomologyPartII:CC.4/completed-coefficient-interchange; LA.5/infinitesimal-character-of-eigenspaces; LA.11/sheaf-fontaine-operator; LA.11/intertwining-operator-is-fontaine-operator.

**Source.** Pan II, §7.2.1, Theorem 7.2.2, Proposition 7.2.3, Lemma 7.2.7 and the conclusion, pp. 117–120: Completed cohomology with truncated period-sheaf coefficients equals the cohomology on Fl; the locally analytic λ-part is the cohomology of the χ̃\_k-isotypic period sheaf; for de Rham ρ the weight-0 locally analytic part is ker I¹\_{k−1} at λ. Pan II, §1.2.2, p. 6: The Fontaine operator N on the χ̃\_k-isotypic locally analytic completed cohomology and its compatibility with Fontaine's operator of each two-dimensional subrepresentation.

### LA.12/classicality-theorem — Emerton's classicality theorem, proved geometrically, and finiteness of n-invariants

*Theorem.* Planet: *Emerton's classicality theorem (geometric proof)*.

**Statement.** Let ρ: G_Q → GL_2(E) be continuous, two-dimensional and absolutely irreducible, such that (1) ρ appears in H̃¹(K^p, E), and (2) ρ|G_{Q_p} is de Rham with Hodge–Tate weights 0 and k for some k > 0. Then (1) ρ arises from a cuspidal eigenform of weight k + 1; (2) for K_p = 1 + p^nM_2(Z_p) with n ≥ 2, the n-invariants of the K_p-analytic vectors of H̃¹(K^p, E)[ρ] (equivalently of Π\_ρ) form a finite-dimensional E-vector space. The proof uses no input from the p-adic local Langlands correspondence.

**Hypotheses.**
- Hodge–Tate weights in Pan's convention; ρ absolutely irreducible; no hypothesis on ρ̄ or on ρ|G_{Q_p} beyond de Rham with distinct weights 0, k.

**Construction or proof.**
- By LA.12/period-cohomology-comparison the weight-0 locally analytic part of H̃¹(K^p, E)[ρ] ⊗̂ C is (ker I¹\_{k−1})[λ], nonzero since Π\_ρ^la ≠ 0.
- By LA.10/spectral-decomposition the generalised eigenspaces of ker I¹\_{k−1} occur only at classical eigensystems of weight k + 1 (or weight-zero ones, excluded by irreducibility), so λ is classical (Pan II proof of Theorem 7.1.2).
- Finiteness from LA.7/finiteness-of-analytic-n-invariants.

**Acceptance.**
- Theorem 1.1.2 is a case of the Fontaine–Mazur conjecture (Pan II Remark 1.1.4); Emerton proved it via local–global compatibility and p-adic local Langlands, Dospinescu–Paškūnas–Schraen proved the finiteness by representation theory (Remark 7.1.3).

**Prerequisites.** LA.12/period-cohomology-comparison; LA.10/spectral-decomposition; LA.7/finiteness-of-analytic-n-invariants; AutomorphicGaloisRepresentations:R19.1/newform-rank-two-realisation.

**Source.** Pan II, Theorem 7.1.2, Remark 7.1.3 and the proof after Theorem 7.2.2, pp. 116–118; Theorems 1.1.2 and 1.1.14, Remarks 1.1.3–1.1.4, pp. 2–5: Classicality of two-dimensional de Rham representations with distinct Hodge–Tate weights appearing in completed cohomology, and finiteness of the n-invariants of analytic vectors, by the geometric route.

### LA.12/supercuspidal-description — Π\_ρ^la in the supercuspidal case (Breuil–Strauch)

*Theorem.* Planet: *Breuil–Strauch (supercuspidal case)*.

**Statement.** Let ρ be as in LA.12/classicality-theorem with k ≥ 1 and suppose the attached π\_p is supercuspidal; let π′\_p be its Jacquet–Langlands transfer to D_p^×. Then there is a GL_2(Q_p)⁰-equivariant isomorphism (upgraded to a GL_2(Q_p)-equivariant one by summing over Z-translates as in LA.9/kernel-on-omega-is-quaternionic) (H̃¹(K^p, C)[λ\_τ])\_0^{la} ≅ (π^{∞,p})^{K^p} ⊗ [(H¹(Fl, j_!(D_p^×-smooth part of ω^{−k+1}\_Dr)) ⊗ π′\_p)^{O_{D_p}^×}(twisted)]/(Sym^{k−1}V\* ⊗ π\_p), the embedding of π\_p coming from the position of the Hodge filtration of ρ|G_{Q_p}, with a short exact sequence whose sub is (π^∞)^{K^p} ⊗ Sym^{k−1}V\*. For k = 1 the quaternionic term is (H¹(P¹, j_!π^{(0)}\_{Dr,n\*}O) ⊗ π′\_p)^{O_{D_p}^×} and, by the vanishing-cycle sequence, its subspace from H¹\_{dR,c} is D_dR(ρ|G_{Q_p}) ⊗ π\_p with π\_p embedded as Fil¹D_dR ⊗ π\_p; with Emerton's local–global compatibility this is the Breuil–Strauch conjecture for ρ|G_{Q_p} in dual form (proved in general by Dospinescu–Le Bras). Since H̃¹(K^p, E)^la is admissible, the quaternionic cohomology is 'admissible' over C, although C is not spherically complete.

**Hypotheses.**
- π\_p supercuspidal; k ≥ 1 (introduction: k = 1, i.e. weight 2).

**Construction or proof.**
- Combine LA.12/period-cohomology-comparison with LA.10/de-rham-cohomology-and-eigenspaces (1), moving the away-from-p factor out using new vectors (Pan II proof of Theorem 7.3.2).
- GL_2(Q_p)-equivariance from the extension in Pan II Remark 5.4.13 (Remark 7.3.3); the whole Hom space is determined by the weight-0 part (Remark 7.3.4); admissibility remark (Remark 7.3.5).
- Comparison with Breuil–Strauch through LA.10/vanishing-cycle-sequence, Emerton's local–global compatibility and Dospinescu–Le Bras (Pan II Remark 7.3.6; inputs requested, used for the comparison only).

**Acceptance.**
- Theorem 1.1.7 is the case k = 1: Π\_ρ^la ⊗̂ C ≅ (π^{∞,p})^{K^p} ⊗ (colim_n H¹(P¹, j_!π^{(0)}\_{Dr,n\*}O)^{O_{D_p}^×} ⊗ π′\_p)/π\_p.

**Prerequisites.** LA.12/period-cohomology-comparison; LA.10/de-rham-cohomology-and-eigenspaces; LA.10/vanishing-cycle-sequence; LA.10/compactly-supported-de-rham-drinfeld; GL2AutomorphicRepresentationsAndTransfer:R16.3/supercuspidal-parameter; GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl; CompletedCohomologyAndLocalGlobalCompatibility:R31.4; PadicLocalLanglandsForGL2Qp:R30.6.

**Source.** Pan II, §7.3.1, Theorem 7.3.2, Remarks 7.3.3–7.3.6, pp. 121–123; Theorem 1.1.7 and Remark 1.1.8, p. 4: Geometric description of the locally analytic vectors in the supercuspidal case through compactly supported cohomology of the Drinfeld tower and quaternionic forms, and its relation to the Breuil–Strauch conjecture.

### LA.12/principal-series-description — Π\_ρ^la in the principal series case (Berger–Breuil–Emerton)

*Theorem.* Planet: *Berger–Breuil–Emerton (principal series)*.

**Statement.** Let ρ be as in LA.12/classicality-theorem with k ≥ 1 and π\_p a principal series. Then there is a GL_2(Q_p)-equivariant isomorphism (H̃¹(K^p, C)[λ\_τ])\_0^{la} ≅ (Ind_B^{GL_2(Q_p)}(H¹\_rig(Ig(K^p), Sym^{k−1})·ε^{−k+1}(e′₂)^{k−1})^{la})[λ]/((π^∞)^{K^p} ⊗ Sym^{k−1}V\*), with the corresponding short exact sequence whose quotient is the induction twisted by ε^{−k+1}(e′₁)^k(e′₂)^{−1} at λ. Moreover for k = 1 (and in the same way for general k with Sym^{k−1} coefficients) H¹\_rig(Ig(K^p))[λ] ≅ (π^{∞,p})^{K^p} ⊗ D_cris(ρ|G_{Q_p}) (D_cris over a sufficiently ramified cyclotomic extension, with the Weil-group action made B-equivariant by the congruence relation), so (H̃¹(K^p, C)[λ\_τ])\_0^{la} ≅ (π^{∞,p})^{K^p} ⊗ Ind_B^{GL_2(Q_p)}D_cris(ρ|G_{Q_p})/π\_p with π\_p embedded through Fil¹; with Emerton's local–global compatibility this is the Berger–Breuil–Emerton conjecture, proved by Liu–Xie–Zhang and Colmez.

**Hypotheses.**
- π\_p a principal series; k ≥ 1.

**Construction or proof.**
- Combine LA.12/period-cohomology-comparison with LA.10/de-rham-cohomology-and-eigenspaces (2) (Pan II Theorem 7.3.7, Remark 7.3.8).
- H¹\_rig(Ig) as log rigid cohomology of the Igusa tower, the log rigid–log crystalline comparison and Carayol's congruence relation (Pan II Remark 7.3.9; RD.4).

**Acceptance.**
- Theorem 1.1.10 is the case k = 1: Π\_ρ^la ⊗̂ C ≅ (Ind_B^{GL_2(Q_p)}H¹\_rig(Ig(K^p))[λ\_τ])^{la}/i_π((π^∞)^{K^p}).

**Prerequisites.** LA.12/period-cohomology-comparison; LA.10/de-rham-cohomology-and-eigenspaces; LA.8/cokernel-of-d-on-rational-points; GL2AutomorphicRepresentationsAndTransfer:R16.3/principal-series-parameter; PadicDifferentialEquationsAndRigidCohomology:RD.4/proper-log-rigid-convergent-comparison; CompletedCohomologyAndLocalGlobalCompatibility:R31.4; PadicLocalLanglandsForGL2Qp:R30.4.

**Source.** Pan II, Theorem 7.3.7, Remarks 7.3.8–7.3.9, pp. 123–124; Theorem 1.1.10 and Remark 1.1.11, pp. 4–5: Geometric description of the locally analytic vectors in the principal series case as a quotient of the locally analytic induction of Igusa rigid cohomology, and its identification with Ind D_cris modulo π\_p.

### LA.12/uniform-de-rham-description — The uniform description Π\_ρ^la ⊗̂ C = H¹(DR_{k−1})[λ]/Fil¹

*Theorem.* Planet: *Π\_ρ^la = H¹(DR)/Fil¹*.

**Statement.** In both the supercuspidal and the principal series cases, Π\_ρ^la ⊗̂ C ≅ H¹(DR_{k−1})[λ]/Fil¹H¹(DR_{k−1})[λ], with DR_{k−1} the two-term de Rham complex of d_k on Fl and Fil its Hodge filtration; for k = 1, Fil¹H¹(DR_0)[λ] = Fil¹colim_{K_p}H¹\_dR(X_{K^pK_p})[λ] = (π^∞)^{K^p}. Thus the Breuil–Strauch and Berger–Breuil–Emerton descriptions are two instances of one statement; H¹(DR_{k−1})[λ] itself does not see the Hodge filtration, in analogy with Kashiwara–Schmid's constructions for real groups.

**Hypotheses.**
- π\_p supercuspidal or a principal series.

**Construction or proof.**
- ker I¹\_{k−1}[λ] = H¹(DR_{k−1})[λ]/Fil¹ in both cases (LA.10/de-rham-cohomology-and-eigenspaces, Pan II Remark 5.5.15) and LA.12/period-cohomology-comparison (Pan II Remarks 1.1.13, 7.3.10).

**Acceptance.**
- The expected special-case analogue is LA.12/special-case-claim.

**Prerequisites.** LA.12/period-cohomology-comparison; LA.12/supercuspidal-description; LA.12/principal-series-description; LA.10/de-rham-complex-drk.

**Source.** Pan II, Remark 1.1.13, p. 5; Remark 7.3.10, p. 124; Remarks 5.5.15–5.5.16, p. 79: The uniform description of Π\_ρ^la ⊗̂ C as H¹ of the de Rham complex on the flag variety modulo its Hodge filtration.

### LA.12/special-case-claim — Claim (conditional): the special case

*Theorem.*

**Statement.** Claim, sketched but not proved in the source (Remark 7.3.11; Remarks 1.2.4 and 5.5.15 assert that it can be shown with p-adic local Langlands inputs): let k = 1, π\_p special and ρ|G_{Q_p} absolutely irreducible. Then the inclusion (H̃¹(K^p, C)[λ\_τ])\_0^{la} ⊂ (ker I¹\_0)~[λ\_τ] of LA.12/period-cohomology-comparison is an equality, so the generalised eigenspace is the eigenspace. Sketch given by the author: Emerton's local–global compatibility identifies the left side with (π^{∞,p})^{K^p} ⊗̂ Π(ρ|G_{Q_p})^la, whose structure is known by Liu–Xie–Zhang and Colmez; a Serre-duality analysis would identify Fil² of the three-step filtration with (π^{∞,p})^{K^p} ⊗̂ Σ(2, L) (Breuil) and gr³ with the induction in Emerton's conjectural sequence.

**Hypotheses.**
- Conditional on Emerton's local–global compatibility, the Liu–Xie–Zhang–Colmez description of Π(V)^la in the special case, Breuil's Σ(2, L), and the unproved Serre-duality analysis of Pan II Remark 7.3.11.

**Construction or proof.**
- The three-step filtration at λ\_τ (LA.10/three-step-filtration) has graded pieces (π^{p,∞})^{K^p} ⊗ π\_p, the quaternionic term and the Igusa induction (Pan II Remark 7.3.11).
- Compare piece by piece with the p-adic local Langlands description (inputs requested from R31.4 and R30.4); the identification of Fil² and gr³ is asserted, not proved, in the source.

**Acceptance.**
- Recorded as a gap: a direct proof is asked for in Pan II Remark 5.5.15.

**Prerequisites.** LA.12/period-cohomology-comparison; LA.10/three-step-filtration; CompletedCohomologyAndLocalGlobalCompatibility:R31.4; PadicLocalLanglandsForGL2Qp:R30.4.

**Source.** Pan II, Remark 7.3.11, pp. 124–125; Remark 1.1.12, p. 5; Remark 1.2.4, p. 7; Remark 5.5.15, p. 79: The special case: the paper claims, with a sketch relying on p-adic local Langlands inputs, that the generalised eigenspace is an eigenspace; it is not proved.

## Gaps

- **Locally analytic vectors of Banach and LB representations have no designed owner.** Pan I §2 (G_n-analytic vectors, R^iLA, (strong) LA-acyclicity, Theorem 2.2.3) and Pan II §2 (Hausdorff LB-spaces and their locally analytic vectors, compact-type criteria, the Cartan–Serre lemma, Proposition 2.3.6) are routed by the extraction PAPER-PAN-26 (route 11, no review verdict yet) to the proposed roadmap LocallyAnalyticRepresentationsOfLocalGroups, whose design job (DESIGN-LocallyAnalyticRepresentationsOfLocalGroups, issue #3411) has not run. Until it does, the need is filed at LocallyAnalyticDistributions:L0, the layer that owns the locally convex foundations and that CompletedCohomologyPartII CC.6 already names as owner of the derived locally-analytic functor; re-point the requests when the new roadmap's stages exist. Needed by: LA.0/relative-sen-operator, LA.0/differential-equation, LA.0/locally-analytic-covering, LA.0/acyclicity-of-locally-analytic-vectors, LA.0/acyclicity-for-covers-by-small-opens, LA.1/modular-coverings-are-locally-analytic, LA.1/locally-analytic-sheaf, LA.2/power-series-expansion, LA.2/locally-analytic-completed-cohomology, LA.3/banach-sen-operator, LA.3/lb-topology-on-cohomology, LA.3/cohomology-is-hausdorff-lb, LA.5/infinitesimal-character-of-eigenspaces, LA.8/cokernel-of-d-on-rational-points.
- **Fontaine's almost de Rham theory for Banach and LB modules has no designed owner.** Pan II §6.1 (Banach and LB B⁺\_dR/(t^k)-modules, decompletion, the Fontaine operator N_W and Fontaine's criterion Theorem 6.1.16) is routed by PAPER-PAN-26 route 12 to a PadicHodgeTheory Part II whose design (DESIGN-PadicHodgeTheoryPartII, issue #3426) has not run. Filed at PadicHodgeTheory:R06.2, which owns almost C-representations; re-point when the Part II exists. Proposition 6.1.20 and Corollary 6.1.21 are to be read with B⁺\_dR/(t^{k+1}) (extraction E4). Needed by: LA.11/sheaf-fontaine-operator.
- **Scholze's lattice comparison (Proposition 7.9) in log form.** The inclusion of the determinant of the de Rham bundle into t times the determinant of V, from the two B⁺\_dR-lattices of Scholze's Proposition 7.9 in the logarithmic setting, is routed with the PadicHodgeTheory Part II (extraction item /567); filed at PadicHodgeTheory:P8. Needed by: LA.11/p-adic-legendre-relation.
- **The supersingular uniformization at infinite level is not planned by its owner.** PAPER-PAN-26 route 3 (accepted) makes PerfectoidShimuraVarieties S3/S5 the owner of Pan II Theorem 5.4.2 and Lemma 5.4.4 (π\_HT^{-1}(Ω) as a finite union of height-zero Lubin–Tate spaces at infinite level), but the accepted PerfectoidShimuraVarieties packet has no node for them. Requested at PerfectoidShimuraVarieties:S5. Needed by: LA.9/kernel-on-omega-is-quaternionic.
- **The special case of the description of Π\_ρ^la is only claimed.** Pan II Remark 7.3.11 claims, with a sketch, that when π\_p is special (k = 1, ρ|G_{Q_p} absolutely irreducible) the generalised eigenspace (ker I¹\_0)~[λ\_τ] equals the locally analytic weight-zero part; the sketch rests on Emerton's local–global compatibility, Liu–Xie–Zhang and Colmez, Breuil's Σ(2, L) and an unproved Serre-duality analysis. Remark 5.5.15 asks for a direct proof. The plan records the claim as conditional; the supercuspidal and principal series cases are complete. Needed by: LA.12/special-case-claim.
- **The published Annals text of Pan II was not obtained.** Pan II is cited in arXiv:2209.06366v1 (the only arXiv version, 127 pages); the Annals version (2026, 161 pages) is behind a paywall and its numbering may differ. All Pan II locators are v1 labels and pages. Pan I is cited in its open-access version of record. Needed by: LA.1/locally-analytic-sheaf, LA.1/horizontal-cartan-action, LA.2/power-series-expansion, LA.2/weight-sheaves, LA.3/banach-sen-operator, LA.3/theta-h-is-the-sen-operator, LA.3/lb-topology-on-cohomology, LA.4/overconvergent-modular-forms, LA.6/operator-d, LA.6/operator-dbar, LA.6/intertwining-operator, LA.7/n-invariants-are-classical, LA.7/finiteness-of-analytic-n-invariants, LA.8/cokernel-of-d-on-rational-points, LA.9/kernel-on-omega-is-quaternionic, LA.10/spectral-decomposition, LA.10/de-rham-complex-drk, LA.10/vanishing-cycle-sequence, LA.11/sheaf-fontaine-operator, LA.11/p-adic-legendre-relation, LA.11/intertwining-operator-is-fontaine-operator, LA.12/classicality-theorem, LA.12/supercuspidal-description, LA.12/principal-series-description, LA.12/uniform-de-rham-description.

## Open questions recorded by the source

- An intrinsic proof that GL₂(Q_p)- and D_p^×-local analyticity coincide, and that the two Cartan actions agree (Pan II Remark 5.3.10 and the proof of Corollary 5.3.13); the available proofs are explicit calculations. Dospinescu and Rodriguez Camargo obtained the coincidence independently.
- A description of the cokernel of θ\_{k+1} on the canonical locus beyond Coleman's primitive part, which would sharpen the summand A_{(−1,k+1)} (Pan II Remark 4.4.17).
- A simpler construction of d₁ and d̄₁ through B⁺\_dR/(t²), suggested by Rodriguez Camargo after the work was finished (Pan II §1.3.3); this plan follows Pan's construction, which is the one proved in full.
- Generalisations beyond GL₂(Q_p) and a possible filtered equivariant derived category on Fl for a p-adic Langlands correspondence (Pan II Remarks 1.1.3 and 5.5.16) are programmatic and not planned.

## Restructuring proposals

- **rescope: EndoscopicTransferAndUnitaryTraceComparison, LocallyAnalyticCompletedCohomology.** The accepted node EndoscopicTransferAndUnitaryTraceComparison:ET.6a/analytic-vectors-under-duality states Pan II Corollary 5.3.9 (GL_2(Q_p)- and D_p^×-locally analytic vectors coincide) and Theorem 5.3.20 (d̄\_Dr = c′d_LT). Its proof steps use Pan II Theorems 5.2.8, 5.3.8 and the uniqueness in Theorem 5.2.15, which this roadmap plans at LA.9 (lubin-tate-and-drinfeld-power-series, supersingular-differential-operators) on top of Pan I's relative Sen theory (LA.0); ET.6a lists none of them as prerequisites. This plan imports the ET.6a node rather than duplicating it. *Proposal:* Move the statement into LA.9 as a node of this roadmap (keeping ET.6a/el-duality, period-morphisms and gross-hopkins-vector-fields in ET.6a as its inputs), or let ET.6a/analytic-vectors-under-duality list LA.9/lubin-tate-and-drinfeld-power-series and LA.9/supersingular-differential-operators as prerequisites. Either way the dependency points from Pan's local analysis to the duality comparison.
- **rescope: CohomologyComparisons, LocallyAnalyticCompletedCohomology.** The accepted nodes CohomologyComparisons:CP.6/pan-graded-analytic-decompletion (Pan II Proposition 6.3.9), pan-truncated-period-isomorphism (Proposition 7.2.3), pan-etale-site-truncated-comparison-map (Lemma 7.2.4), pan-bounded-torsion-inverse-limit and pan-completed-coefficient-and-flag-descent (Lemmas 7.2.5–7.2.6) are statements about Pan's sheaves O^{la,χ̃}\_{K^p}, B⁺\_{dR,k} and OB⁺\_{dR,k} on the flag variety, which this roadmap constructs (LA.1, LA.2, LA.11). This plan imports them by id. *Proposal:* Keep them in CP.6 but have them cite LA.2/weight-sheaves and LA.11/relative-period-sheaves-on-the-flag-variety as prerequisites; or move them into LA.11 and LA.12 of this roadmap, leaving CP.6 the general period-sheaf comparison.
- **rescope: CompletedCohomologyAndLocalGlobalCompatibility, LocallyAnalyticCompletedCohomology.** Route 1 of PAPER-PAN-26 is meant for this design (DESIGN-PAN), but the queue's grouping by parent also feeds it to DESIGN-CompletedCohomologyAndLocalGlobalCompatibilityPartII (issue #3459), as the extraction's own fix noted. *Proposal:* Drop PAPER-PAN-26 route 1 from DESIGN-CompletedCohomologyAndLocalGlobalCompatibilityPartII; that design should import this roadmap's layers for anything from Pan's papers.
- **rescope: LocallyAnalyticDistributions, LocallyAnalyticCompletedCohomology.** The requests for locally analytic vectors of Banach and LB representations (Pan I §2, Pan II §2) and for locally analytic induction from B are filed at LocallyAnalyticDistributions:L0 only because their routed owner LocallyAnalyticRepresentationsOfLocalGroups is undesigned. *Proposal:* When DESIGN-LocallyAnalyticRepresentationsOfLocalGroups runs, it should plan these items (extraction items /100–/116, /357) and this roadmap's LA.0, LA.2, LA.3, LA.8 requests should be re-pointed to its stages.

