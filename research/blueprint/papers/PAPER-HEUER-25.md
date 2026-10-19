# PAPER-HEUER-25: A p-adic Simpson correspondence for smooth proper rigid varieties

Ben Heuer, [Inventiones mathematicae 240 (2025), 261–312](https://doi.org/10.1007/s00222-025-01321-4); [arXiv:2307.01303v3](https://arxiv.org/abs/2307.01303v3).

This is the current reader for the [machine-readable extraction](PAPER-HEUER-25.result.json), revised by Codex, session `codex-whankc`, on 19 October 2026 for [FIX-RT-PAPER-HEUER-25, issue #5692](https://github.com/CBirkbeck/tauceti-explorer/issues/5692). It incorporates the 44 confirmed red-team findings, with the verifier’s qualifications. Finding /24 was rejected and is not applied. The [fixes report](../redteam/RT-PAPER-HEUER-25.fixes.md) gives a finding-by-finding account. Historical independent verdicts retain their attribution; the new fixes and source issues await the independent fix review.

The extraction is complete: **86 items: 3 library, 20 planned, 63 missing; 12 routes; 17 bibliographic inputs; 24 source issues**. Every missing item has exactly one route. “Complete” describes extraction coverage, not proof closure or implementation. Items added in this fix are 49–81, 83, and 85–88; existing item IDs remain stable.

## The theorem and its choices

Throughout, K is a complete algebraically closed extension of Q_p and Ω̃_X=Ω¹_X(−1). Write B for a coherent algebra on the analytic/étale space and ℬ=ν^*B for its completed pro-étale pullback. These are different sheaves, especially when the finite spectral space X′=Spa_{O_X}(B) is non-reduced (Remark 2.6, p. 270).

For smooth proper X/K, a flat B_dR^+/ξ²-lift 𝕏 and an exponential Exp give an exact tensor equivalence

`S_{𝕏,Exp}: Vect(X_proét,Ô_X) ≃ Higgs(X)`.

A Higgs object is an analytic vector bundle E with θ:E→E⊗Ω̃_X and θ∧θ=0 (Definition 1.2(2), p. 262). This common definition is already planned at HodgeStructuresPartII H.0/twisted-higgs. An exponential means a group-homomorphic section of log:1+m_K→K **agreeing with the convergent series on p^αm_K**, where α=1/(p−1) for p≥3 and α=2 for p=2 (Definition 3.19, p. 293). A continuous splitting alone does not impose that agreement (E18).

Naturality has specified data. For continuous K→K′ with compatible exponentials, smooth proper X′/K′ with lift 𝕏′, and f:X′→X admitting a lift f̃:𝕏′→𝕏, Theorem 5.1(2), pp. 304–305, supplies a transformation

`t_f̃: f^* ∘ S_{𝕏,Exp} ⇒ S_{𝕏′,Exp′} ∘ f^*`,

compatible with composition of lifted morphisms. Remark 5.2, p. 305, explains the dependence on the chosen lift and exponential.

For (E,θ)=S(V), Theorem 5.5, pp. 307–308, identifies Rν_*V with the Higgs complex in D(X_ét), hence RΓ(X_proét,V) with derived Higgs cohomology. Taking V=Ô_X gives the lift-dependent split Hodge–Tate decomposition. CohomologyComparisons CP.3 supplies the spectral sequence, not that choice-dependent splitting. Proposition 5.3, pp. 305–306, connects ν^*E and V as fibres at two K-points of a bundle over X times a connected smooth parameter space.

The representation corollary uses another theorem: Line bundles in the v-topology, Theorem 5.2, v2 p. 22, identifies continuous π_1(X,x)-representations with the **pro-finite-étale** subcategory of v-vector bundles. Composing its embedding with Simpson gives a fully faithful exact tensor functor into Higgs bundles (item 54). That input is not an equivalence from representations onto every pro-étale bundle.

## Construction and proof interfaces

The spectral algebra B_θ is the image of Sym(Ω̃_X^∨) in End(E), and is coherent, commutative and O_X-torsion-free. Its tautological section τ_θ recovers θ (Definition 4.1, pp. 297–298). Canonical enlargement through B′ is used only when B′ is also coherent and torsion-free (Remark 4.2, E24).

Theorem 2.4, pp. 268–269, gives the multiplicative Hodge–Tate sequence

`0 → Pic_{X′} → Pic_{ℬ,proét} → H⁰(X,B⊗Ω̃_X)⊗_K G_a → 0`.

The proof first computes the pushforwards of ℬ and ℬ^× and constructs the lift’s Higgs–Tate torsor. The local R¹ν_*Ô(1)≅Ω¹ identification must send Kummer classes to dlog; without that normalization the asserted section is unspecified (Proposition 2.15, pp. 277–278; Scholze survey Lemma 3.24). Normalize the multiplicative map by the ordinary logarithm on 1+2pℬ^+, so HTlog∘exp=HT_B on its small additive domain. The paper’s shorthand proves existence of an isomorphism but does not fix this convention; no additional false-theorem claim is made from it.

Proper base change and the Kummer boundary prove right exactness. On P=Pic_{X′}, [p] is a finite étale torsor over its open and closed image with kernel H¹_ét(X′,μ_p); on G=P⁰ the torsor group is only G[p]. To obtain surjectivity on G, put N=P/G and Q=coker([p] on G) in étale sheaves. The constant Kummer boundary is zero on G, so the snake sequence gives N[p]↠Q. Lemma 2.21 makes the quotient map G→Q constant and therefore zero, giving Q=0. Fargues’s derivative and finite-kernel criteria then give finite étaleness. Openness of an arbitrary analytic subgroup would not by itself prove closedness (items 24,78,81; E7,E14).

The representable reduction P_𝕏 exists without assuming Pic_{X′} representable (Theorem 3.2, pp. 283–285); B there need not be torsion-free. For the subsequent canonical module construction, B is torsion-free. Rigidify at a finite multiset M of K-points where evaluation on B(X) is injective, and choose a finite lifted set 𝕄⊆𝕏(B_dR^+/ξ²) whose reduction is M. These are points of 𝕏, not of X over a period ring. Forgetful maps and their derivatives control independence of the rigidifying set (Lemma 3.17, p. 292). Only such rigidifications give uniqueness of compatible isomorphisms.

The cited rigid-group exponential theorem applies to **locally p-divisible** G (HWZ v2 Theorem 6.12, p. 35). Sheaf-surjectivity/local p-divisibility is stronger than surjectivity on K-points. The groups P_𝕏⁰ and (P_𝕏^M)⁰ used here meet the stronger hypothesis. For general G with infinitely many components, [p] surjective only implies that Ĝ⁰ is analytic p-divisible, not that the entire topological p-torsion group Ĝ has finite [p] (E15–E16). These corrected inputs construct the canonically rigidified L_B of Theorem 3.22, pp. 294–297, including algebra-map, lifted-pullback and tensor compatibility. Pullbacks/products use maximal torsion-free quotients, and the tensor action has the **sum** tautological section.

Locally fix a toric chart f. The coordinate map ρ_f and integral Higgs lattice depend on that chart. The local functor LS_f goes from small pro-étale bundles to small Higgs bundles; its **inverse** constructs a tower representation from (E,θ) using exp(ρ_f(θ)) (Theorem 4.4, p. 299). Apply it only on its f-small domain. The 2p bound in Lemma 4.6 ensures exponential convergence, while the quantitative constant in Moduli spaces v2 Definition 6.2 can be stronger. Lemma 6.4 allows further tower passage until that actual bound holds, for both chart uses in the canonical-field argument. The global inverse untwists V by L_{B_V}^{−1}; the planned analytic–étale vector-bundle equivalence completes descent (Proposition 4.13 and Theorem 5.1, pp. 303–305).

The derived comparison has distinct inputs (items 43,46,66–69,75–76). Cartan–Leray starts with completed-tower coefficients. Small-representation decompletion removes those coefficients after inverting p; its integral version has uniformly bounded p-power kernel/cokernel, not an integral isomorphism in every degree. Continuous Koszul cohomology uses a complete lattice and its inverse-limit topology. Generic Koszul algebra is shared with DD.1, and its quotient resolution uses regular polynomial-coordinate generators. Mathlib supplies Noetherian polynomial/adic-completion flatness; analytic Tate-algebra flatness and sheaf transport are separate missing interfaces. Finally the closed Tate radius must have exponent β>1/(p−1), rather than lie on the exponential boundary (E4).

## Existing foundations and requested extensions

The library entries cite declarations personally read at Mathlib `082e2d3`:

| Item | Declaration and exact use |
| --- | --- |
| 14 | `ContinuousLinearMap.isOpenMap`: complete normed-space open mapping, with surjectivity. |
| 64 | `Module.FinitePresentation.exists_free_localizedModule_powers`: localize a finite module over a Noetherian domain at its nonzero elements into the fraction field; finite presentation and freeness there give a nonzero principal localization. No claim about the full arbitrary R→S generic-freeness theorem. |
| 75 | `AdicCompletion.flat_of_isNoetherian` and `MvPolynomial.isNoetherianRing`: Noetherian coefficients, a finite variable type, then ideal-adic completion. Affinoid Noetherianity and analytic transport are separate imports. |

No Lean file changes or compiled instantiations accompany this extraction. Tau Ceti’s pin remains `f790474`. The current read-only upstream audit used TauCetiRoadmap `0d144d0` and Tau Ceti `a91d3aa`. AdicSpaces and AlgebraicVectorBundles were read in their current README/Suggested.lean form. Scheme vector-bundle infrastructure is reused; it does not contain the rigid pro-étale Simpson correspondence. No library builds were run.

The planned entries now include the shared H.0 Higgs definition; PD.7’s four constructible/proper-base-change targets; AI.1’s topology-sensitive continuous-cochains/Koszul theorem; RZ.5’s rigid smooth modification; relative coherent GAGA; analytic–étale vector-bundle and Kummer/Picard comparisons; the first-order period sheaf with θ and its Tate-twisted kernel; toric charts; and the previously recorded site, almost-purity and continuity inputs. A requested extension is still **missing**, even where a neighbouring contract is planned.

## Routes in machine-file order

| Route | Owner and items | Purpose |
| --- | --- | --- |
| 1 | PadicHodgeTheory P8:local-rational — 6,71 | Request normalized local comparison and early primitive/singular comparison. CP.3 consumes these; the later P8 suffix cannot be their first construction. Coordinate BMS18 route 14 and Scholze13/Zavyalov precedents. |
| 2 | DiamondsAndVStacks D2 — 50 | One early generic perfectoid vector-bundle descent supplier. Later RF2/VB1 applications import it; they are not imported back into D2. |
| 3 | AdicSpacesPartII R2–R3 — 10,11,62,63,65 | Analytic coherent base change, integral/formal models, and the coherent analytic–étale refinement. Abbes proof suppliers remain unread. |
| 4 | PadicHodgeTheoryPartIIPadicSimpson — 48 missing items | The six non-abelian layers described above: spectral/Picard constructions, reductions and rigidifications, exponentials, local twisting, global and derived equivalence. Its full brief names every import by title and ID. |
| 5 | HodgeStructuresPartII H.0 — 3, planned | Source of the existing twisted-Higgs node. Replaces the obsolete duplicate Part II proposal. |
| 6 | ClassicalAdicEtaleCohomologyPartII PD.7 — 12,85–87, planned | Reuse BH 3.10, BH 3.15, BH 3.25 and Heuer’s constant-sheaf application. The existing G3 gap records the singular primitive supplier. Replaces the consolidated mod-p Part II candidate. |
| 7 | PadicHodgeTheory P8 — 44 | Only the later relative completed-pro-étale base-change application. |
| 8 | AInfCohomology AI.3 — 49 | Request the broader affinoid perfectoid basis beyond smooth formal generic fibres. |
| 9 | DiamondsAndVStacks D6 — 53 | Request full faithfulness for seminormal rigid spaces **over Spd K**, separately from site equivalence. |
| 10 | AlgebraicModuliForArithmeticGeometry A0-extension — 55 | General proper-scheme Picard representability, only for the algebraisable example; the abelian degree-zero A2 input is too narrow. |
| 11 | ClassicalAdicEtaleCohomology H0 — 13,73 | Request exact finite pushforward with the finite-fibre stalk formula, and explicit nilpotent invariance. |
| 12 | AdicSpacesPartIIPartII RZ.5 — 72 | Request the SNC-boundary refinement, importing the already planned rigid modification 88. Algebraic R09.7 is not an automatic analytic supplier. |

The three main cross-extraction reconciliations remain maintainer actions outside this fix’s allowed paths: generic perfectoid descent in Scholze–Weinstein/121 versus the early D2 supplier; seminormal full faithfulness in Howe–Klevdal/026 versus Scholze–Weinstein/69; and moving the older local/primitive-comparison precedents to the early P8 contract. The [handoff](../handoff/FIX-RT-PAPER-HEUER-25.md) identifies the files and exact contracts. This extraction records each requested owner without changing unrelated packets.

## Texts checked and limits

All access dates below are 19 October 2026. The published [DOI PDF](https://link.springer.com/content/pdf/10.1007/s00222-025-01321-4.pdf) was read in full, journal pp. 261–312, SHA-256 `7608fff18ccbc47b96bd54cfe01f31f8ccd9953889834cc9f6c39787563175cd`. The [v3 PDF](https://arxiv.org/pdf/2307.01303v3), SHA-256 `df8caac5ee92e8bcd5a4f9de8dcd5901d61d5f6f4f5c1c3c5bd6b65880e18943`, was compared at the source-issue loci. Earlier reviewer access limits are historical, not a statement that the published version remains unchecked.

| Source | Checked input |
| --- | --- |
| [Scholze, p-adic Hodge theory](https://arxiv.org/pdf/1205.3463) and [survey](https://arxiv.org/pdf/1303.5948) | Pro-étale basis/continuity; arithmetic Faltings Corollary 6.14; survey Theorem 3.17, Proposition 3.23 and Lemma 3.24, pp. 19–22. The full rigid-resolution proof remains an external supplier. |
| [Kedlaya–Liu II](https://arxiv.org/pdf/1602.06899) | Theorem 3.5.8, PDF p. 76: generic perfectoid site equivalence. |
| [Berkeley Lectures](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf) | Proposition 10.2.3, printed p. 78: seminormal full faithfulness with its map to Spd K. |
| [Line bundles in the v-topology v2](https://arxiv.org/pdf/2012.07918v2) | Theorem 5.2, p. 22: the pro-finite-étale representation subcategory. |
| [HWZ v2](https://arxiv.org/pdf/2308.13456v2) | Lemma 6.2, Definitions 6.4/6.8, Propositions 6.5/6.10, Theorem 6.12, pp. 30–35. |
| [Fargues, author PDF](https://webusers.imj-prg.fr/~laurent.fargues/Groupesanalytiques.pdf) | Lemmes 1/5, Corollaire 4 and Théorème 1.2, author-PDF pp. 10–11,16–17. |
| [Gerritzen](https://www.numdam.org/item/CM_1977__35_1_23_0.pdf) | §2 Satz 1, p. 28; §3 Satz 2, p. 31, including the image of its decomposition formula. |
| [Diamantine Picard functors v4](https://arxiv.org/pdf/2103.16557v4) | Corollary 2.9(3–5), p. 7 and proof p. 28, with its smooth-proper scope retained. |
| [Bhatt–Hansen](https://arxiv.org/pdf/2101.09759) | Theorems 3.10/3.15 and Lemma 3.25, PDF pp. 17–20,25: locally bounded constructibility, Cartesian base change and bounded proper extension invariance. |
| Heuer, Moduli spaces, cleared arXiv:2207.13819v2 | Definitions 2.19/6.2, Lemma 6.4, Theorem 6.5, Lemmas 6.9/6.11, especially pp. 33–38. Lemma 6.9 was 6.7 in v1. |
| Bosch–Lütkebohmert–Raynaud, Néron Models, cleared copy | §8.2 Theorem 3, p. 211: arbitrary proper-scheme Picard representability. |
| Huber, Étale Cohomology of Rigid Analytic Varieties and Adic Spaces, cleared copy | §2.6, Proposition 2.6.1, Example 2.6.2 and Proposition 2.6.3, pp. 138–140: geometric/rank-one stalks and finite pushforward. Openness is imported from the planned A1 contract. |
| Abbes, Éléments de géométrie rigide I | **Not read**: only the public restatement in Heuer Lemma 2.7, p. 270, of Proposition 4.8.18(ii), Proposition 5.9.17 and Theorem 2.11.5. The uncleared book was not obtained. |

No cleared source file or passage was copied to the repository or scratch. Contextual discussions of Simpson’s complex correspondence and Hartl–Lütkebohmert’s representability examples were removed from the proof-prerequisite list. The survey entry now identifies singular finiteness and Kummer/dlog normalization rather than treating its spectral sequence as the lift-dependent splitting.

## Source issues and publication collation

There are **17 misprints, 2 errors and 5 gaps**. E8, E17 and E23 are preprint slips corrected in the published text; the other 21 remain at their recorded journal loci. Existing E1–E13 retain their historical independent review objects; the fresh `collation` records are separate from those verdicts. E14–E24 await independent fix review. No correction was linked on the publisher page on 19 October 2026; arXiv still listed v3 as its latest version. The machine file contains the evidence and exact reach of each issue.

| Issue | Locus and repair |
| --- | --- |
| E1 | §2.2, journal p. 268: replace the flattening-paper reference with Néron Models §8.2 Theorem 3, p. 211. |
| E2 | Theorem 3.14 proof, p. 290: the rigidification product is indexed by M, not all X. |
| E3 | Theorem 4.8 proof, p. 302: compare θ_V with the alternative θ′_V, not θ_{V′}. |
| E4 | Lemma 5.7, pp. 308–310: use a closed radius with β>1/(p−1). At the boundary, exponential coefficients along n=p^k do not approach zero; log(1+T)/T also has a root at ζ_p−1 and is not a unit. At p=2 the source’s α=2 already suffices. |
| E5 | §1.2, p. 263: Scholze survey Theorem 3.20 gives a spectral sequence; it does not prove the lift-dependent splitting attributed to it. |
| E6 | Proposition 2.9(i), p. 273: almost purity is Scholze Perfectoid spaces Theorem 7.9, not 5.2. |
| E7 | §2.7 after diagram (8), p. 281 (v3 p. 14): this is Theorem 2.4(3–5), not Theorem 3.2. Replace μ_{p^n} by μ_p and restrict the torsor to the image; see also E14. |
| E8 | Lemma 2.21, v3 p. 13: the h/g naming slip is already corrected in journal p. 280. |
| E9 | After Corollary 2.11, p. 274: only left exactness is established there. |
| E10 | Theorem 4.4, p. 299: the displayed formula describes LS_f^{-1}. |
| E11 | Lemma 4.6, pp. 299–300: the action must retain the factor x after the exponential. |
| E12 | Proposition 4.13 proof, p. 303: HTlog(L_{τ,f}⊗L^{-1}) adds HTlog(L^{-1}); inversion already contributes the minus sign. |
| E13 | Theorem 5.1 proof, p. 304: use B_V consistently, not B_v. |
| E14 | Corollary 2.19, p. 279: the identity-component torsor group is Pic⁰[p]. An Enriques surface at p=2 has Pic⁰=0 but Pic[2]=Z/2. The corrected sheaf argument retains finite étaleness. |
| E15 | §3.3, p. 293: the analytic p-divisibility criterion concerns Ĝ⁰ in general. Infinite p-kernel on a constant sum of Q_p/Z_p disproves the whole-group claim; the connected applications survive. |
| E16 | Theorem 3.20, p. 293: HWZ proves the locally p-divisible version. The weaker K-point hypothesis has a missing justification; the cited example is not a disproof of the K-point conclusion. |
| E17 | Remark 2.22, v3 p. 14: replace the cross in B×Ω̃ by a tensor product; already corrected in journal p. 281. |
| E18 | §1.1, p. 261: add agreement with the small convergent exponential to the introductory gloss. Definition 3.19 already has the correct condition. |
| E19 | Lemma 2.16 proof, p. 277: the logarithmic derivation adds T_i a_i, not a_i. |
| E20 | Lemma 3.5 proof, p. 287: choose a connected affinoid component where the section is nonzero before applying domain generic freeness. |
| E21 | Lemma 3.17 proof, p. 292: the rigidified object is defined in Definition 3.12(2) and Theorem 3.14(2). |
| E22 | §4.1/Proposition 4.7, pp. 299–301: specify fixed-chart smallness and the actual quantitative bound; convergence in 2p is insufficient by itself. |
| E23 | Definition 4.1, v3 p. 25: B_τ should be B_θ; corrected in journal p. 298. |
| E24 | Remark 4.2, p. 298: require torsion-free B′ for the canonical L_{B′} construction. |

The logarithmic scaling clarification from finding /30 is recorded in items 19–20, without adding a source error: composing the inverse of exp(p·−) with an unscaled inclusion differs from log by a scalar. Choosing log on 1+2pℬ^+ fixes both the p=2 convention and the compatibility required by the later construction.

Validation: `python3 scripts/check_paper.py research/blueprint/papers/PAPER-HEUER-25.result.json` passes. Source-version metadata is checked separately using `scripts.check_errata.versions_checked`. The reader’s counts and route/item references were checked against the JSON. No blueprint packet or Lean deliverable changed.
