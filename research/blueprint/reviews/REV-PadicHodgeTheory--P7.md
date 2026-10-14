# REV-PadicHodgeTheory--P7

**Verdict: accepted after correction.** Claude, session `claude-N66Hwr`, 14 October 2026. Refs #465. This session did none of BP-PadicHodgeTheory--P7 (Codex `codex-gqQ5AR`, PR #9688, on top of the checkpoint of `cc-442dc5`, PR #2917) and none of the parallel whole-roadmap packet.

I reviewed the [packet](../packets/PadicHodgeTheory--P7.json), the [reader](../readmes/PadicHodgeTheory--P7.md) and the [suggested Lean file](../suggested/PadicHodgeTheory--P7.lean) for the eight stages R06.1–R06.4, P7, P7:annulus-foundations, P8 and P8:local-rational. The packet's `review.checked` gives one verdict per node:

- **300 nodes:** 189 verified and 111 corrected, none added.
- **Corrections:** 44 change the mathematics, a test, a supplier or a source attribution. The other 67 only remove a private "extraction lines" reference from a locator.

The packet stays `complete`. P7 and P8 stay `partial`, and the other six stages stay `planned`. Their 24 gaps and the `remaining` lists are precise records of follow-up work.

## What was checked

- **Mathematics.**
  - **The 58 new nodes:** I read every one in full. I rechecked the conventions they rest on: geometric versus arithmetic Artin reciprocity, labelled Hodge–Tate weights, val_K(α) = Σ_τ h_τ for crystalline characters, and t_N − t_H as the degree.
  - **Unit tests of the new definitions:** I worked out each one, for example the special rank-two (φ, N)-module, the torus admissible pair and the B-pair lattice shift.
  - **The 242 inherited nodes:** I read every statement and the unit tests of every definition, and recomputed the computational tests: weak admissibility of the (e_0, e_1) examples, Fontaine's Weil–Deligne recipe on the Tate-curve matrix, ∇_V on Q_p(r), and the Frobenius on A_cris.
- **Sources.** I fetched public copies of all 40 sources into scratch space; no file or passage is in the repository.
  - **Hashes:** 37 copies match the recorded SHA-256. The published GLX and Heuer PDFs are not served to scripts, so I read arXiv:2208.07195 and arXiv:2307.01303v3 and added those locations. Berger's errata has a newer version, dated 13 October 2026, which is now recorded.
  - **New nodes:** Haiku retrieval agents pulled the cited statements for all 58, and I read the quoted passages myself.
  - **Inherited nodes:** the agents also pulled 88 citations behind the planets and the key R06.3–R06.4 theorems, which I read.
  - **Locator audit:** a text-layer script checked the label and page of all 586 citations that carry a numbered label. It found two wrong pages (Berger 2002 Proposition 2.11; Kedlaya–Liu Definition 2.2.15). Its other flags were parsing artefacts.
  - **Material for later jobs:** the cleared library was not needed, since the four library items cited are free on arXiv.
- **Baseline.** All 75 declarations exist, under the cited names and in the cited modules, at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.
  - A Sonnet agent copied the headers and the variables in force. I compared them with each `provides` text and with how the nodes use them.
  - `spectralNorm_eq_of_equiv` needs no algebraicity hypothesis. `Algebra.normalizedTrace` is the algebraic trace that Tate's estimates extend.
  - `Submodule.dualAnnihilator` was cited by no node. It now supports the dual filtration of R06.2/filtered-vector-spaces.
  - Two `provides` texts pointed at the old Lean file and were corrected.
- **Closure.**
  - Every foreign node cited exists in its supplier packet, and every stage-level citation has a matching request. The node graph is acyclic at stage level after correction 1 below.
  - Cross-roadmap requests were checked against the nodes that cite them.
  - The targets of each stage description are realised. R06.4's weights p and p + 1, p = 2, the [0, p−2] / [0, p−1] distinction and the ordinarity criteria are all present.
- **Granularity, API, tests and planets.** The plan is at target level. Every definition and construction has at least three tests and at least three API items, and every layer has at most six planets, named from the sources.
- **Lean.** `lean-check` elaborates the suggested file at the pins with no errors. Its 18 warnings are all unproved-declaration warnings.

## Corrections

| Target or field | Correction and reason |
|---|---|
| R06.2/crystalline-ordinary-slope-criterion, R06.2/maximal-monodromy-ordinary-criterion | **Stage cycle.** Both cited R06.3/colmez-fontaine-proof-via-robba, which made R06.2 → R06.3 → R06.2 a cycle. Neither needs essential surjectivity. The representation is given, and they only need the lemma that a weakly admissible subobject D′ of an admissible D is admissible. That lemma follows from the bigness criterion: D/D′ is weakly admissible, so dim D = dim V_st(D) ≤ dim V_st(D′) + dim V_st(D/D′) ≤ dim D. Both nodes now cite R06.2/colmez-fontaine-bigness-criterion and R06.2/weakly-admissible-category-abelian. The gap, the coverage line and restructure Proposal 9 are updated. BLGHT Lemma 2.2(2) is the c = 0 case; the general consecutive range follows by twisting. |
| R06.1/crystalline-period-ring | **False unit test.** `Bcris_not_field` asserted that ξ is a non-unit of B_cris. In fact t = ξ·u with u = Σ (−1)^{n−1}((n−1)!/n) ξ^{[n−1]} w^n ∈ p^{−1}A_cris, so ξ^{−1} = u·t^{−1} ∈ B_cris. It is replaced by `Bcris_xi_unit_not_plus`: ξ is a non-unit of B_cris^+ but a unit of B_cris. |
| P7:annulus-foundations/annulus-derivation | The image of d/dT is all of the series with zero T^{−1}-coefficient only on open intervals. On I = {1}, Σ p^k T^{p^k−1} has no primitive. The statement is qualified, and that series is added as a non-example test. |
| R06.1/tate-trace-almost-surjective, R06.1/tate-sen-axioms-cyclotomic | The proofs use upper numbering, Herbrand's theorem and the different, but the first node had no prerequisites. Added the Tau Ceti LocalFieldsRamification layer 3 that the packet's own request already named for both. |
| P7/fontaine-dif-module, R06.3/de-rham-iff-dif-connection-trivial | "Not flat" and "trivial (flat)" corrected to "not trivial" and "has a full set of horizontal sections". One-variable connections are always integrable, so flatness is not the property that distinguishes de Rham representations. |
| P8:local-rational/primitive-comparison-mod-p | Aligned with Scholze Theorem 5.1, which is stated for étale cohomology with C^+/p coefficients. The pro-étale and O_C/p forms are stated as consequences. |
| R06.3/rank-two-potentially-semistable-types | CDN23 put the slopes into their definitions of the supercuspidal and special types. The statement now says so; the slope-free predicates are kept and related to theirs. |
| R06.1/breuil-completed-semistable-rings | P_l is Kato's (3.2) or Tsuji's §1.6 construction, and the explicit description is in Breuil §§2, 4. Statement, locator and match corrected (Disegni–Liu §B.5 and footnote 39). |
| R06.2/admissible-fundamental-sequence | The admissible case is Colmez–Nizioł Remark 5.5(iii)–(iv) in §5.1.3, not §5.2.1. CDN20b §§0.2–0.4 do not state it, so CDN20b is recorded as a consumer (§0.4, Théorème 0.8). |
| P7/classical-b-pair | Ding §2.1 uses B-pairs without defining them. Added Kedlaya–Liu Definition 9.3.11 and Theorem 9.5.8(c) as the defining source. |
| R06.3/filtered-module-robba-equivalence | Added an acceptance item for the lattice lemma that Berger's October 2026 errata adds to the proof of Théorème III.2.3 (new source issue E44). |
| R06.1/cp-integers-p-adically-complete, R06.1/de-rham-period-ring | The acceptance items claimed that BDeRham was checked in Lean. At the pins Mathlib's `BDeRham` has no ring instance (`lean-check` fails to synthesize `CommRing`), and the items now say so. |
| Locators and matches (the rest of the 44) | <ul><li>**Scholze 2013:** Lemma 5.3 is on p. 28 and Lemma 5.8 on p. 33. Proposition 3.15 is on p. 19 and Corollary 3.17 on pp. 20–21. Theorem 8.4 has no part (i).</li><li>**Zavyalov:** the result is Lemma 5.5.1, not Proposition 5.5.1.</li><li>**Berger 2008:** IV.2.2 is a Proposition, not a Théorème.</li><li>**BIP:** they cite Conrad Proposition B.4, not Theorem B.4.</li><li>**Fontaine 2004:** Théorème 3.17 is on p. 66.</li><li>**CDN:** the footnotes are 12–13 in CDN23 and 4–5 in CDN20b.</li><li>**Berger 2002:** Proposition 2.11 is on p. 19.</li><li>**Kedlaya–Liu:** Definition 2.2.15 is on p. 33 and Definition 4.1.3(a) on p. 103.</li><li>**Brinon–Conrad:** there is no Remark 8.2.5; the formulas follow Definition 8.2.5. Theorem 8.3.6 is on pp. 120–121, and Theorem 9.1.10 gives only (Fil^0 B_cris)^{φ=1} = Q_p.</li><li>**Fontaine–Ouyang:** Proposition A1 is stated on p. 140.</li><li>**Ding:** Lemma 2.1 is on p. 10.</li><li>**GLX and Heuer:** arXiv locations added.</li></ul> |
| 83 locators | Removed references to line numbers of a private text extraction. They point to nothing a reader can open. |
| Sources | The Fontaine–Ouyang address in the packet no longer resolves. The file at the new address (`~fontaine/galoisrep.pdf`) has the recorded SHA-256, so the URL is updated. Berger's errata list dated 13 October 2026 is recorded in `sourceVersions` and in the reader. |
| Suggested file | The existential `bdrPlus_exists_theta` is replaced by the real-bodied `thetaDR`: evaluation at level one of Mathlib's adic completion, followed by `RingHom.kerLift` of `fontaineThetaInvertP`. The file now also states the packet's `thetaDR_coe` and `thetaDR_surjective` and the test `thetaDR_teichmuller`. |
| Reader | Every edited node section was regenerated from the packet; a script confirms that the statement, hypotheses, proof route, prerequisites, sources, tests and acceptance blocks of all 300 sections, and the printed and corrected fields of every source issue, match the packet. The introduction, the Colmez–Fontaine paragraph, the Lean-companion paragraph and Proposal 9 are updated. |

## Source issues

I checked all 44 entries at their locators: **43 confirmed, 1 rejected, 1 added**. Every entry now has a `review` object naming this job. The `printed` fields of E1, E5–E7, E9–E11, E21, E25–E29, E31, E32 and E36–E40 described cut-off text fragments or carried PDF artefacts, and are now stated in my own words.

| Entry | Verdict |
|---|---|
| E1, E3–E7, E9, E10, E35 | Confirmed; each correction is listed in Berger 2008 Appendix B or in Berger's errata. |
| E2, E8, E39 | Confirmed by direct check. E2 and E8 are not listed in either. E39 is the E1 phenomenon in Berger's introduction. |
| **E11** | **Rejected.** The printed condition gives a basis φ(x_1), …, φ(x_d) of B^{†,pr} ⊗ D_r. So det φ(A)·det Mat(φ) is a unit, and Mat(φ) ∈ GL_d already follows. The errata only calls the generation wording preferable. |
| E12, E19 | Confirmed. The uncompleted tensor product in Scholze Proposition 8.5 is visible on the rendered page. |
| E20 | Confirmed: trace 0 and determinant 4p give X² + 4p. |
| E24, E31, E37 | Confirmed. For E37 I rendered Fontaine–Ouyang p. 16: the geometric Frobenius acts on E(−1) by q^{−1}, which inverts Deligne's relation. |
| E32 | Confirmed, with the locator corrected. The proof of Théorème V.2.1 cites Théorème IV.2.4, an immediate consequence of Proposition IV.2.2, whose proof uses Corollaire III.2.5. |
| E40 | Confirmed, with the description corrected. Example 4.4.4 is an exercise asking to prove that [ε] − 1 generates ker θ for p = 2. By Proposition 4.4.3 that needs v_R(ε − 1) = 1, but v_R(ε − 1) = p/(p − 1) = 2. |
| E41 | Confirmed. Exact acyclicity of Ã^+ = W(O^+) would make O^+ acyclic on perfectoid subdomains. For an Artin–Schreier extension of perfectoid fields of characteristic p, the Čech complex then gives H² = O_K^+/m_K ≠ 0. |
| E42 | Confirmed. Qian's Lemma 4.2 omits BLGHT's consecutive-weight hypothesis. A weakly admissible rank-two (φ, N)-module with N ≠ 0, jumps {0, r}, r ≥ 3 odd, and Fil^r ≠ ker N is irreducible. |
| E43 | Confirmed: the proof of Corollary 9.3.14 cites the étale-only Theorem 9.3.13. |
| **E44 (new)** | Berger 2008, proof of Théorème III.2.3 (p. 16): the identification of each localization lattice with Fil^0 of the recovered filtration is asserted without argument. The October 2026 errata supplies the lemma. Gap, affects the proof, known. |

## Assigned red-team findings

| Finding | Outcome in this packet |
|---|---|
| RT-AREA-langlands-2/17 | R06.4/two-dimensional-ordinarity-criterion and the weight-p and weight-(p+1) branch nodes own all of KW II Lemma 3.5, including the Berger–Li–Zhu case, as gaps or requests where the integral input is missing. The restructure records R08.5/R08.6 and R21.5 as importers. |
| RT-AREA-padic-1/20, 2/21 | R06.1/bdr-plus-of-perfectoid-affinoid-algebras imports P1/fontaine-theta-and-primitive-kernel and does not reprove it. R06.1/bdr-plus-complete-dvr is stated for arbitrary algebraically closed complete C. R06.1 → RF2:untilts is proposed in `restructure`. |
| RT-AREA-padic-1/24, 2/3 | Primitive comparison (Scholze Theorem 5.1, Corollary 5.11, the K(π,1) theorem, Lemma 4.12 route) and its A_inf and B_dR^+ lifts are P8:local-rational targets, with no CP.3, CP.4, AI.4 or AI.5 inputs. The log version is proposed as HodgeTateAndCanonicalSubgroups T6:log-primitive. |
| RT-AREA-padic-2/18 | Berger's route is fixed. R06.2 keeps the proposition, and R06.3/colmez-fontaine-proof-via-robba proves it from M(D), the RD.2 slope filtration and PG.2. |
| RT-AREA-padic-2/19 | The R06.3 nodes cite PG.2 and R01.2, and Berger's bridge (D†_rig(V), ∇_V, N_dR(V)) is planned in P7 and R06.3. The R06.3 requires are proposed in `restructure`. |
| RT-AREA-padic-2/20 | The Tate–Sen theorem, Tate's traces (built on `Algebra.normalizedTrace`) and Tate's C(ψ) criterion are R06.1 and R06.2 targets. The missing ramification supplier is now cited. |

## Questions and actions for the orchestrator

1. **Two accepted plans for the same layers.** `PadicHodgeTheory.json` covers the same eight stages plus R06.5–R06.6 and was accepted on 13 October by REV-PadicHodgeTheory. Only 3 of its node ids also occur here, although about 165 node titles nearly coincide. If both are promoted, the atlas will show two decompositions of each layer. The queued ASM-PadicHodgeTheory joins this part and R06.5 into `readmes/PadicHodgeTheory.md`, the file that holds the accepted whole-roadmap reader. One plan must be chosen as authoritative before assembly. The corrections of the two reviews should then be carried across:
   - **This review's:** the ξ ∈ B_cris^× test, the cycle repair, the annulus image and E44.
   - **The other review's:** the placement of the Sen module, the weight-zero theorem and lisse Z_p-sheaves.
2. **Tiers.** PadicHodgeTheory is in tier 13. The following must be resolved at packaging:
   - **Upward citations:** CohomologyComparisons CP.3/CP.4 (tier 14), cited by P8/proper-smooth-de-rham-comparison-application and P8/algebraic-analytic-period-comparison, and GL2AutomorphicRepresentationsAndTransfer R16.3 (tier 15), cited by R06.3/rank-two-potentially-semistable-types.
   - **Roadmaps outside the 94:** PhiGammaModulesAndIwasawaCohomology (PG.0–PG.6, about 38 citations), RelativeFarguesFontaine RF0–RF4, VectorBundlesAndIsocrystals VB2 and VB4, and BunGAndNewtonStrata BG1.
3. **Undeclared atlas edges.** P7 → R06.3 (26 node citations) and R06.3 → R06.4 (7). Every other stage edge the nodes induce is already implied by the atlas `requires`.
4. **Unaccepted suppliers.** Eight node ids (four of P1, three of P3, one of P7) are cited from `PerfectoidSpaces--P0.json`, whose review is `needs_changes`. Retarget them if that packet renames them.
5. **RT-RS-01/30.** Ownership of Fontaine–Laffaille's rational admissibility proof between R07.3 and R06.4, and R07.4's general Colmez–Fontaine supplier, are still open, as the packet records.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/PadicHodgeTheory--P7.json`: **0 errors, 0 warnings**. The packet has 300 nodes, 373 tests, 75 baseline declarations, 24 gaps, 48 requests and 44 planets.
- The source issues pass `check_errata`'s `versions_checked` and `check_issues` for the roadmap with no errors.
- Separate scripts confirm:
  - the stage graph induced by node prerequisites is acyclic;
  - every stage-level foreign citation has a matching request;
  - every reader section reproduces its packet node.
- `lean-check research/blueprint/suggested/PadicHodgeTheory--P7.lean`: **elaborated, no errors**. Its 18 warnings are all unproved-declaration warnings. The check ran in the shared build at the pins after `free -g`, with no language server or build.
