# Handoff: BP-CompletedCohomologyAndLocalGlobalCompatibility

Issue #700. Worker: Claude (session claude-fWu5Pn), 2026-10-18.

## What was delivered

- `research/blueprint/packets/CompletedCohomologyAndLocalGlobalCompatibility.json`: status `complete`, 47 nodes (14 constructions, 30 theorems, 1 comparison, 2 applications), 100 API items, 55 unit tests, 22 planets, 28 baseline declarations read at Mathlib 082e2d3, 6 requests, 7 gaps, 5 source issues. All six stages are `planned`; their `remaining` lists name what is still open. `check_blueprint.py` reports 0 errors and 0 warnings, run with the pinned index `~/tauceti-swarm/workers/baseline/declarations.tsv`.
- `research/blueprint/readmes/CompletedCohomologyAndLocalGlobalCompatibility.md`: about 35,000 words, generated from the packet. It adds a hand-written introduction (purpose, conventions, ownership table, sources, layer overview) and an introduction to each layer. Every target gives its statement, hypotheses, API, tests, uses, proof sketch, checks, *Needs* and sources. The text was escaped for the site renderer and checked with a Python port of its inline parser: nothing unintended is read as emphasis, mathematics or a link.
- `research/blueprint/suggested/CompletedCohomologyAndLocalGlobalCompatibility.lean`: 330 lines. It holds light real-bodied definitions over Mathlib carriers (completion, quaternionic function spaces with central character, weighted forms, Hecke closures, Eisenstein ideals, pro-modular primes, multiplicity spaces and the evaluation map, patched supports). It also states the milestones that can be stated at the pins: DLB Lemmes 4.5 and 13.1, Emerton–Paškūnas Lemma 6.2, the pro-modular facts and the injectivity of evaluation. Tests are `example`s, and a register lists the README targets. **Compiled**: `lean-check` at Mathlib 082e2d37e8 / Tau Ceti f790474 elaborates it, with `sorry` as the only warning. A `run_cmd` audit found no `sorry` in any declaration type or definition body (62 constants).

## How the plan is organised

- **R31.1:** the modular-curve carrier is CompletedCohomologyPartII's CC.2 object along CC.8's modular realisation. RT-AREA-automorphic-1/16 is resolved as CC.8 already adopted it. This layer adds the GL₂-specific facts: Ĥ⁰, Ĥ²_c = 0, surjectivity of Ĥ¹_c → Ĥ¹, and Emerton §5.3's non-Eisenstein injectivity and C(K_p, O)^r. It also builds the Shimura-curve and definite-quaternionic carriers, the latter over totally real F (Pan, Tung, CDN), with DLB's B̄ over Q as the case F = Q.
- **R31.2:** Emerton's Theorem 7.4.2, with its degree and vanishing inputs made explicit; density of algebraic vectors; the newform comparison with the level-11 example; Nakamura Lemmas 2.9–2.11 (answers KatoEulerSystems); DLB Lemmes 4.5–4.7; typed quaternionic modules (CC1).
- **R31.3:** T(K^p) and T_{ρ̄,Σ}, identified with CC.8's completed Hecke algebra (RT-AREA-automorphic-1/18 resolved); Hecke determinants and ρ^m; φ_Σ; Galois factorisation (Prop 5.5.3, Prop 6.1.12); classical points; the quaternionic big Hecke algebra; Pan's Eisenstein localisation and pro-modular primes (CC2).
- **R31.4:** local Langlands families over T and Mazur's principle in families (Thm 6.2.4); the multiplicity module X(θ); Emerton's Thm 6.2.13 and Thm 1.2.1 (decomposition id kept); Thm 1.2.6 (moved here from R31.3, see below); Nakamura's dual compatibility; the DLB quaternionic compatibility (RT-AREA-langlands-3/4); Pan's semisimple compatibility (CC3); the CDN comparison with Scholze's functor, which is conditional.
- **R31.5:** the CEGGPS patched module for GL_n(F); typed patched modules; Emerton–Paškūnas support (a union of components, not full support); Tung's full support for odd p and for p = 2; quaternionic patched completed homology; Pan's Thm 4.1.7 and §8 (CC4).
- **R31.6:** promodularity with Fontaine–Mazur (decomposition id kept); Böckle's R = T; the global proof of Emerton's Thm 3.3.22; DLB's Thm 5.5; the globalisation audit (CC5); the export table.

The decomposition's five node ids are kept, except `R31.3/mod-p-multiplicity-…`, which became `R31.4/mod-p-multiplicity-and-serre-s-adelic-reformulation`. Theorem 1.2.6 is a corollary of Theorem 6.2.13, as the decomposition reviewer flagged; the packet's `decompositionNodeMap` records the move.

## Red-team findings (how each is handled)

- **RT-AREA-automorphic-1/16:** fix (a), as adopted by the accepted CC.8 packet. R31.1 imports `CC.8/arithmetic-tower-realisation` and `CC.8/hilbert-finite-local-system-input` and does not prove the tower identification again.
- **RT-AREA-automorphic-1/18:** CC.8 now plans the completed Hecke algebra, its semilocal product and the residual localisation. R31.3 specialises these, with no second construction. See the packet's `findingsCoverage`.
- **RT-AREA-langlands-3/4:** the definite quaternionic tower is planned in full and its local–global compatibility is proved (DLB §13; Pan §3.5), not inherited by analogy. A sub-layer presentation `R31.Q` is proposed in `restructure`.

## Requests made (stage-level; suppliers without exact nodes)

- **PadicLocalLanglandsForGL2Qp R30.2, R30.3, R30.4, R30.5, R30.6.** This roadmap has no packet (BP issue #970). The requests state exact local inputs: Emerton's admissible-module lemmas and Ord_B; MF, Colmez's π̄ and the explicit mod p correspondence; irreducibility of B, Colmez's locally algebraic vectors and Berger–Breuil; Kisin's equivalence, Π^{univ}, Paškūnas's blocks, P_B, P̃ and Theorem 1.10; and the local Breuil–Mézard statements. **R30.6 must not import R31.5** (the stage cycle R30.6 → R31.4 → R31.5); the request explains this.
- **SmoothRepresentationsOfLocalGroups SR.5:** unconditional co-Whittaker families for n = 2, the mod p fibre, and Lemma B.10. Also noted in `upstreamNotes`.
- **ModularCurvesPartII R14.6:** Ribet's Eisenstein component group and the action of Frob_ℓ on the toric part, for Mazur's principle in R31.4.
- **CompletedCohomologyPartII CC.8:** extend `definite-unitary-degree-zero` from LLHLM's GL₃ to rank-n CHT/Thorne definite unitary groups, for CEGGPS.

## Ownership moves (for the maintainer and the consumers)

- **Pan's pro-modular primes and nice-prime conditions** move down from GL2ModularityLifting R32.4 into R31.3/R31.5. `GL2ModularityLifting:R32.4/nice-prime` should import R31.5/pan-patching-at-a-nice-prime's statement.
- **Emerton's Theorem 3.3.22, potentially crystalline non-crystabelline case,** is owned by R31.6 because its proof is global. R30.4 states only Colmez's cases. Emerton's proof uses the weight part of Serre's conjecture for an auxiliary CM-induced ρ̄. The node instead picks ρ̄ so that W is Serre's minimal weight, and uses only Edixhoven's theorem (SerreWeightAndLevelOptimisation R20.3).
- **The CEGGPS GL_n patched module** is planned once here. The Part II design (#3459, `DESIGN-CompletedCohomologyAndLocalGlobalCompatibilityPartII`) should import it and plan only the patched eigenvariety and Ding's (4.14). Ding's routed items 4.1-eigenvariety and 4.2-classicality-input are therefore assigned to that design (`routeCoverage`).
- **R31.6 was audited as a process layer.** It is kept for its mathematics: Thms 1.2.3–1.2.4, Böckle, Thm 3.3.22, DLB 5.5. Its audit supplies `GL2ModularityLifting:R32.6/globalisation-dependency-audit`, the existing owner, as R32.6's request asks.

## Consumer requests answered

The packet's `requestLedger` maps every request addressed to R31 to the nodes that answer it. The requests come from GL2ModularityLifting R22.1, R32.3 and R32.6; KatoEulerSystems L2; and LocallyAnalyticCompletedCohomology LA.2, LA.5 and LA.12. Each is marked answered or partly answered. The partial ones are:

- the Eisenstein maximal ideal after ordinary seed points (Pan Prop 5.6.1, a gap);
- the uninspected globalisation leaves of the audit (a gap).

## Gaps (what a follow-up must do)

1. **Scholze's functor:** owner-in-waiting `DESIGN-ScholzeFunctorAndModpCohomologyOfTheLubinTateTower`. Re-point R31.4/scholze-functor-… once that design has stages.
2. **R30 has no plan.** Once BP-PadicLocalLanglandsForGL2Qp is written, replace the five stage requests by node ids.
3. **Pan Prop 5.6.1:** the Eisenstein congruence for the ordinary Hilbert Hecke algebra. Suggested owner: OrdinaryAutomorphicFormsAndModularityLifting R21.
4. **Uninspected globalisation leaves:** read them and finish the CC5 classification. They are Calegari 3.2, Snowden 8.2.1 with its inputs, KW II Thm 6.1 and Lemma 3.5, Paškūnas Lemma 3.29, EG14 Prop A.2 and Cor A.7, and BLGG13 Thm A.4.1.
5. **Emerton's Appendix C coadmissibility theory:** used through R31.4/multiplicity-module only. Suggested owner: CompletedCohomologyPartII CC.3 (follow-up).
6. **Böckle Cor 3.8 and Diamond–Flach–Guo** were not read; they are cited through Nakamura Thm 2.1 and Emerton §7.3.
7. **Emerton's Thm 6.1.2** is attributed in the source to a manuscript in preparation. Existence is supplied by Cor 6.4.13 with Thms 6.4.16 and 6.4.20, or by Emerton–Helm Prop 6.2.4. The mod p fibre needs SR.5.

Further remaining items are in each stage's `remaining` list:

- the p = 2 boundary Eisenstein computation (R14.3 is stated for residue characteristic at least 3);
- non-parallel quaternionic weights (R18.3 is stated for parallel weight);
- the R14.6 and CC.8 requests above.

## Checks run

- `check_blueprint.py` with the pinned index: 0 errors, 0 warnings.
- Node-level cycle check over all packets: no cycle through R31 nodes. Stage-level cycles through R31 already exist in the atlas, for example R31.2 → KatoEulerSystems L2 → … → R18.3/R18.4 → R31.1 through Kato's request and the atlas edge R18.4 → R31.1. This packet creates none at node level.
- **Sonnet supplier-contract cross-check** of 171 (citing, foreign) pairs: 4 real mismatches were fixed.
  - The quaternionic node no longer cites the unitary dual interface.
  - The Shimura-curve Eichler–Shimura input is now R19.2/carayol-sigma-lambda-construction.
  - Tung's ordinary R = T is now OrdinaryAutomorphicForms R21.1/R21.3, not PL.2.
  - Böckle now cites R08.6/export-fontaine-laffaille-irreducible.
  - Of the 29 weaker generality caveats, the significant ones are recorded in node hypotheses or proof steps. These include the underived locally analytic vectors, made legitimate here by exactness on admissible representations, and R18.3's even-degree and parallel-weight setting.
- **Sonnet locator sweep** against the downloaded texts (see below).
- **Manual re-reads:** Tung (odd p) Thm 1.2, Thm 4.1–Thm 4.7 (this corrected R31.5/full-support-odd-p: Cor 4.3 gives V̌(Π_y) ≅ r_x, and Prop 4.4 has one excepted component removed only by Cor 4.6); Pan Props 4.2.4, 4.3.2, 4.5.8, 4.7.7, Lemmas 4.8.2–4.8.5, Prop 8.4.9, Cor 8.4.10; Emerton §7.4, where the auxiliary ρ̄ and the weight part of Serre's conjecture are used.

## Sources read (all free; fetched 2026-10-18 into scratch, SHA-256 in the packet)

Emerton lg.pdf (2011 draft, §§1, 3.3, 4.4, 5, 6.1–6.4, 7) · Emerton PAMQ author draft (coates.pdf, §7.2–7.4) · Emerton, Invent. 2006, author draft (§§2.1–2.2, 4.3) · Calegari–Emerton survey §1.1 · Nakamura arXiv v2 §2 · DLB arXiv v2 §§4.1, 5.1, 13 · CDN arXiv v2 §§3.1, 4.1 · Ding arXiv v2 §4.1–4.2 · CEGGPS arXiv v5 §§1–2, 4 · Emerton–Paškūnas arXiv v3 §§1, 6 · Pan arXiv v2 §§1, 3–4, 5.6, 8 · Tung arXiv:1803.07451v4 · Tung arXiv:1908.06174v3 §§4–8 · Serre 1987 §3.4. No restricted book was needed; nothing from ~/atlas-library was used.

## Source issues recorded

- E1: Emerton lg p. 47 prints det = S_ℓ where ℓS_ℓ is meant. New.
- E2: Emerton's Thm 6.1.2 cites the unavailable reference [42]. New.
- E3: DLB Lemme 4.7 has the wrong level. Known from the extraction.
- E4: DLB Lemme 5.6 has η̄_p where the condition is on the Galois character of χ. Known from the extraction.
- E5: Nakamura's 'Proposition 2.5' is Corollary 2.5. Known from the extraction.

## Not done

- No restructuring file was edited. The proposals are in the packet's `restructure`.
- Only this issue's four deliverables were changed.
