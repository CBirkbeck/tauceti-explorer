# Independent verification of RT-RS-01

**29 confirmed; three rejected.** Codex session `codex-J6LwjP`, 2 October 2026, job [#4386](https://github.com/CBirkbeck/tauceti-explorer/issues/4386). All four high and 17 medium findings are confirmed, with corrected repair instructions where needed. Eight low findings are confirmed; /25, /26 and /29 are rejected. The machine-readable reasons are in `research/blueprint/redteam/RT-RS-01.review.json`.

I wrote neither RS-01, its accepted review nor this red team. The proposal was by `astra-20260921-f6b2d8`, its review by `cc-442dc5`, and the red team by `cc-c2c06b`. The red team discloses its authorship of the later BMS-paper and area fixes it quotes. I checked the underlying source, accepted decompositions and present packets independently; those fix sentences are not independent evidence. My earlier review of a separate p-adic area fix is not an endorsement of RS-01.

## Evidence and limits

I read every finding's claim, evidence and proposed fix, RS-01's owner/layer/link records, the cited report passages and the accepted review. I inspected the affected raw stage briefs and the current theorem-node statements, hypotheses, prerequisites and relevant acceptance/proof fields. I also read the accepted CP, PH and Q relocation gaps and the targeted AUDIT-37/38 duplicate records. Later unreviewed packets corroborate unresolved boundaries but do not retroactively become inputs of the original proposal.

This verifies the findings, not all 95 original pair decisions or a fresh decomposition of the papers. “Confirmed” identifies work a fixer should perform; it does not apply a restructuring or accept a packet. Semantic dependency problems inside node statements must be distinguished from a cycle in the stored stage graph. No target, roadmap, atlas file, packet or original review was edited in this job.

## Verdicts

| Finding | Verdict | Reason and repair boundary |
|---|---|---|
| /1 | Confirmed | Lemma 4.26 uses Proposition 4.13, which uses Lemma 4.9; putting the latter at AI.5 while AI.5 depends on AI.2 inverts the supplier order. Give AI.2 the module package and AI.5 the complex package. The proof locator is p.42, not p.41. |
| /2 | Confirmed | CP.3's good-reduction node uses CP.2 material in its statement despite listing only library prerequisites; CP.2 explicitly consumes it. Re-home the good-reduction identification/late compatibility to CP.2 or split an early crystalline prefix. Keep the independent deformation at CP.3. |
| /3 | Confirmed | Theorem 14.3's BKF step uses Proposition 13.21, which RS-01 retains in its downstream CP.2. Give the section-qualified base change an explicit upstream owner; a Frobenius-isogeny title alone is insufficient. Do not combine the fix's overlapping owner recipes. |
| /4 | Confirmed | AI.3 plans integral sheaves only for smooth-formal generic fibres; P8:local-rational imports them for all locally noetherian adic spaces. Broaden and name the early integral owner, keeping rational sheaves downstream and using corrected pro-étale covers. |
| /5 | Confirmed | The CP.0 coherence node is neither retained as a construction nor covered by the five owner records. Its lemmas are actual inputs to Lemma 4.9. Assign them upstream and preserve the CP node as provenance/import adapter. |
| /6 | Confirmed | The dictionary's x, W-tilde, Q and generic-tilt/DVR objects are constructions absent from the four imported packages. Place them once upstream of AI.2/AI.5; the CP dictionary then identifies imported maps. |
| /7 | Confirmed | The Breuil–Kisin uniformizer maps are not supplied by the twist package. Retain their construction or name a supplier. Correct the recipe: BMS1 §4.4 uses T↦[pi-flat]^p and Frobenius on W(k), not an unqualified T↦[pi-flat]. |
| /8 | Confirmed | Several moved CP.5 suppliers have explicit CP.0-node prerequisites, although CP.0 is not upstream of AI.2/AI.5. Re-home and forward the generic data consistently with /1, /5 and /6; do not assign it to both proposed alternatives. |
| /9 | Confirmed | The untagged Lemma 4.18/geometric-corollary node falls outside the tagged-only owner record. Give AI.5 its generic half with perfectness, rational freeness and characteristic-zero/root-of-unity assumptions; retain the geometric form at CP.5. |
| /10 | Confirmed | R06.4 comparison is newly inserted, not retained CP.5 scope, and has no supplier path. Prefer deleting that clause; an intentional extension needs sources and imports. |
| /11 | Confirmed | The earlier accepted PH decomposition left the O_C/general-affinoid boundary unresolved. Specify AI.0:integral's special-element imports and CR.0's PD imports at R06.1. Its later blueprint must follow that decision; rational-ring refinements remain its own work. |
| /12 | Confirmed | A late P8/R06.5 supplier cannot feed CP.2 through a return cycle. CP.3 owns the constant-coefficient comparison and agreement; P8 retains its legitimate general lisse-sheaf/family extension and specialization. |
| /13 | Confirmed | The common primitive comparison is explicitly requested but has no named early family owner. BMS1 14.3(iv) uses 5.7; name an early supplier for both branches, with proper-smooth, coefficient and almost hypotheses. |
| /14 | Confirmed | AI.6 needs CP.3's deformation and CP.4 also plans the compatibility. Option (a) is safe. Option (b), making AI.6 import CP.4, creates a cycle with existing AI.6→CP.4; use the safe option or an actual checked split. |
| /15 | Confirmed | CR.6 owns the Hyodo–Kato relation and uniformizer formula also computed in CP.4. CP.4 should transport these through its period comparison, preserving normalization. |
| /16 | Confirmed | PR.8 and CP.4 both plan agreement without the other's input. Give agreement one owner with an explicit PR.8 import; keep exact logarithmic/Kummer-étale scope. |
| /17 | Confirmed | CR.0 is earlier than AI.0:integral, yet its draft explicitly constructs A_cris from that later stage. Build the abstract upstream envelope on available carriers or split the specialization. Generator-dependent descriptions belong downstream; theta carriers do not prove principality. |
| /18 | Confirmed | CR.0 retains derived-PD comparison and its packet requests DD.0/1, but DD.0 does not reach it. Add the acyclic DD.0 input; ordinary PD algebra does not provide derived powers. |
| /19 | Confirmed | The PR.4 ledger asserts logarithm/Chern constructions absent from its brief. CP.6 needs them. Name a source-qualified supplier and import, rather than infer a map from a mention of regulator consumers. |
| /20 | Confirmed | The integral/Tate comparison owner remains inconsistent between Q0's ledger and P1's nodes/import statement. Record P1 as generic supplier with Q0 applications, or a checked split. Keep boundedness and nonzerodivisor assumptions. |
| /21 | Confirmed | “Only two” ownership repairs is contradicted by pre-existing briefs and decomposition gaps. Revise that substantive summary. The spot-check list does not prove that the reviewer read no gap; do not repeat that accusation. |
| /22 | Confirmed | Direct-import bookkeeping only: R06.1 already reaches CP.4 transitively. An explicit B_st/embedding supplier record is safe and must preserve its logarithm convention. |
| /23 | Confirmed | CP.0's unqualified twist/scalar-extension keeps should say comparisons on cohomology/complexes and import coefficient-level maps. The genuine compatibility proof remains. |
| /24 | Confirmed | There are four new reachable pairs, not one; see the recomputation below. Distinguish new direct dependency from new transitive paths. |
| /25 | Rejected | Ignoring keep reasons in the Python transformation is expected: it does not implement theorem statements. RS-01 expressly preserves exact hypotheses and the supplier records; those records still contain the cited restrictions. Explicit owner text is useful under /1 and /9, but no loss is established here. |
| /26 | Rejected | Reusing counterexamples in AI.5 and CP.5 tests different layers of the chain. It does not require two constructions of the surfaces. Preserve the regression cases and give their construction a supplier when built; a missing crystalline input does not justify deleting the early tests. |
| /27 | Confirmed | The CK semistable branch is explicit in the original brief but reduced to shorthand in the narrowed keeps. Spell out its retained log-torsion, ramification and functorial-lattice restrictions. No new proof audit of CK is claimed. |
| /28 | Confirmed | Separate AI.7's S-valued application from CP.1's O_C/A_inf diagram agreement; PR.6 retains its generic uniqueness input. BS v4 §18, Theorem 18.2 (pp.122–123), supplies uniqueness over a perfect prism; retain its hypotheses and justify transport to the S-valued application. |
| /29 | Rejected | BMS1 14.6(i) itself includes geometric crystallinity. CP.2 imports period formalism; R06.5 applies its comparison to algebraic geometry and takes invariants through existing APIs. This is construction/application reuse, not a second general admissibility theorem. |
| /30 | Confirmed | Record admissibility ownership, but R07.3's lattice-correspondence node uses its FL admissibility node and R07.3→R06.4 already holds. Moving the latter downstream and importing it back is cyclic. Keep an early FL supplier or split R07.3; R07.4 can import general admissibility from R06.2 while retaining its specific Kisin work. |
| /31 | Confirmed | The accepted Q decomposition explicitly requests relocation of generic 7.6–7.10 nodes to PR.2. Record that owner, retaining Q2 applications and provenance. Weak initiality must not become unconditional initiality. |
| /32 | Confirmed | Two line ranges run past EOF: FontaineTheta has 213 lines and BDeRham 98. Correct ranges to 118–213 and 1–98; the content claims themselves hold at the pin. |

## Graph checks and repair qualifications

A fresh `assemble(require_distances=False)` yields 2,956 actual stage vertices and 8,563 edges after unioning actual stage edges and prerequisites. It is acyclic and contains every one of RS-01's 19 proposed links. This does not refute the hidden node-statement dependencies in /1–3 or /17.

For /24 I separately used the frozen raw `research/blueprint/atlas/stage-edges.json`, restricted to actual stage vertices: 3,382 edges before RS-01 and 3,398 after its links. Comparing complete reachability gives exactly:

- CP.3→CP.2;
- CP.3→CP.5;
- P8:local-rational→CP.2;
- P8:local-rational→CP.5.

The red team's 3,458 edge count includes endpoints excluded by that stage-only restriction; its four new reachable pairs are nevertheless reproduced. This is a controlled raw-before/after comparison, not an assertion that the current assembled graph still lacks these already installed links.

I also checked a joint candidate edge set: AI.2→CP.5/CP.6, CR.3:Frobenius-isogeny→AI.5/CP.5, CP.3→AI.6, PR.8→CP.4, DD.0→CR.0, PR.4→CP.6 and R06.1→CP.4. All endpoints exist, and adding this set remains acyclic. It does not alone implement the necessary node re-homings, source additions or forwarded proof obligations. The alternative CP.4→AI.6 edge in /14 is cyclic and must not be applied as written. Likewise a return R06.4→R07.3 import cannot be used without splitting the latter.

## Public source and baseline checks

PDFs were fetched on 2 October 2026. Reading was bounded to the evidence passages; no full-paper rereading is claimed.

| Source | Inspected evidence | Pages / bytes / SHA-256 |
|---|---|---|
| [BMS1, arXiv:1602.03148v3](https://arxiv.org/pdf/1602.03148v3) | §2 counterexample statements pp.13/16; Lemmas 3.20–3.21 pp.26–27; coherence package pp.28–30; module/complex specialization pp.35–40; Lemma 4.26 statement/proof pp.41–42, Remark 4.29 and §4.4 normalization p.43; Theorem 5.7 p.47; Proposition 13.21 and 13.23 pp.116–117; Theorem 14.3 proof and 14.5–14.6 pp.120–121. The counterexample constructions and unrelated comparison prerequisites were not fully reproved. | 124 / 1,447,143 / `285f7d2088607688365ca92222dcf44c0acd6c4788dd872fe6a6191b9c4e072a` |
| [Scholze, p-adic Hodge theory for rigid-analytic varieties, author PDF](https://www.math.uni-bonn.de/people/scholze/pAdicHodgeTheory.pdf) | Definition 4.1 p.21, Lemma 4.10 p.26, Theorem 5.1 p.28, Definition 5.9/Lemma 5.10 p.33, Corollary 5.11 p.34, integral part of Definition 6.1 p.35 and Theorem 6.5 p.36. These establish the relevant scope/inputs, not a new full primitive-comparison proof. | 55 / 577,883 / `73dded06286031066e9d98b638e065d650688f1e36e877f4d711331a3508dee3` |
| [Scholze, author erratum](https://www.math.uni-bonn.de/people/scholze/pAdicHodgeErratum.pdf) | All three pages: restricted transfinite covers, removal of incorrect point assertions, and completion before p-inversion in the structural de Rham sheaf. The broadened integral package must use the corrected site. | 3 / 178,436 / `3cfa56b9e3875c04240d97739dccd58091e41f714c101d5470b95172f73cb235` |
| [Bhatt–Scholze, arXiv:1905.08229v4](https://arxiv.org/pdf/1905.08229v4) | Construction 7.6 and 7.7–7.10, pp.56–59; Lemma 17.4 pp.120–121; fresh corrective reading of §18, Notation 18.1, Theorem 18.2 and Lemma 18.3, pp.122–123. Final proof continuation of 7.10 was not reread; the finding concerns assignment of its already decomposed statement. | 125 / 1,333,327 / `1d91a6eb85828feb73f84ab3b27ced17514f0855d61c3bff71ab9d8287891e4a` |

The Mathlib baseline was freshly checked as `082e2d37e8b0463410cdb532e111cd43d5a66174`, and Tau Ceti as `f790474821cf4256814db967cb154e7af3d0c369`. I read the pinned `FontaineTheta.lean` assumptions/construction/surjectivity, all of `BDeRham.lean`, and `Extension/Cotangent/Basic.lean` 35–100. The latter is a presentation-level linear map, not the full derived cotangent complex. Theta requires p prime, p nonunit and p-adic completeness; surjectivity additionally requires Frobenius surjective modulo p. `BDeRham` localizes using the generators of the theta kernel; identification with classical B_dR requires the missing structural results. No Lean was compiled and no new global library-absence claim is made.

## Source-note correction

A fresh reading on 2 October 2026 of BS v4 pp.122–123 corrects the original /28 source note: §18 exists and Theorem 18.2 is the uniqueness supplier. It concerns symmetric monoidal functors on p-completely smooth R-algebras over a perfect prism and morphisms compatible with the Hodge–Tate structure; it imposes no extra Frobenius compatibility. Lemma 17.4 is a different isomorphism criterion and does not replace it. The original receipt did not establish the absence of §18. The confirmed ownership ambiguity and the 29/3 verdict counts remain unchanged.

## Validation

The red-team review checker passes. The intake check passes both deliverables with zero problems. The JSON and report cover all 32 IDs exactly once; whitespace/diff checks pass. Only the two issue deliverables are submitted; these verdicts authorize subsequent fix work through the queue and do not promote anything.
