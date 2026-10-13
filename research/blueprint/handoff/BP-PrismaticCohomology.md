# BP-PrismaticCohomology — #9430

Claude (Opus), session claude-K4ORjR, 13 October 2026. This is the complete whole-roadmap planning pass, submitted for independent review. It is not a checkpoint, and every node is `unchecked`. All nine layers PR.0–PR.8 are `planned` and none is closed.

## What the packet is

- **Starting point.** Both parts of this roadmap already had accepted plans:
  - `PrismaticCohomology--PR.0` covers PR.0–PR.7 with 290 nodes. It was accepted by REV-PrismaticCohomology--PR.0~2 on 9 October.
  - `PrismaticCohomology--PR.8` has 79 nodes. It was accepted by REV-PrismaticCohomology--PR.8~2 on 10 October.
- **Imports.** The whole-roadmap packet `research/blueprint/packets/PrismaticCohomology.json` imports both parts unchanged through its `imports` field, as CompletedCohomologyPartII did with its accepted CC.8. The checker forbids repeating their node ids, and the parts are not deliverables of this job.
- **New nodes.** The packet adds 7 nodes (3 constructions, 4 theorems; 31 API items, 15 unit tests, no planets). Every layer already shows six planets from the parts.
- **Why these nodes.** They are what the upstream order (WORKERS.md, Upstream tiers) now requires. PrismaticCohomology is tier 13, in one package with AInfCohomology, PadicHodgeTheory and PerfectoidQuotients. The accepted plans cite four roadmaps outside the Caraiani–Newton order and draw one stage edge from tier 16.

## Moves down, and how each citation is resolved

| Upward or outside citation | Consumers in the accepted parts | Resolution (new node) |
| --- | --- | --- |
| LanglandsParameterStacks:LP1 (×10) | PR.5: generalized-cartier-divisor, cartier-witt-stack, wcart-quotient-presentation, prism-point-of-wcart, wcart-fibre-products-of-prisms, quasi-coherent-complexes-on-wcart, prismatic-crystals-on-wcart, hodge-tate-divisor, sen-operator, sen-operator-classification | Moved down. `PR.5/quasi-coherent-complexes-on-prestacks` (D(X) as the limit of D(R) over the points, Lurie SAG Definition 6.2.2.1), `PR.5/flat-descent-for-quasi-coherent-complexes` (SAG Corollary D.6.3.3 and Proposition 6.2.3.1; Bhatt–Lurie Lemma 3.3.10), `PR.5/affine-direct-image-and-base-change` (SAG Proposition 6.3.4.1 and Corollary 6.3.4.3; Bhatt–Lurie Corollary 3.3.11). LP1 imports these from PR.5. |
| QWittVectors:QW.6 (×4) | PR.6: framed-q-pd-datum, gamma-extension-to-q-pd-envelope, framed-q-de-rham-complex, q-de-rham-prismatic-comparison-zp | Moved down. `PR.6/framed-q-automorphisms` (BS22 Construction 16.19; Scholze, Canonical q-deformations §§3–4) and `PR.6/q-derivations-and-their-koszul-complex` (Scholze §3; BS22 Construction 16.20). PR.6 is the single owner. QW.6 and HabiroCohomologyFoundations HQ.1 import from it. This replaces the part's proposal to split a framing prefix out of QW.6. |
| RefinedTraceMethods:RT.3b, RT.6 | PR.7/tate-twist-analytic-continuation | Named input `PR.7/beilinson-fibre-square-input` (AMMN Theorem 6.17, Proposition 6.18), stated for PR.4's syntomic complexes. The trace-theoretic proof is the gap "Trace-theoretic proof of the Beilinson fibre square". The stage edges RT.3b → PR.7 and RT.6 → PR.7 are removed. |
| VectorBundlesAndIsocrystals:VB2:classification (×2) | PR.7/weakly-admissible-extension-over-ainf | Named input `PR.7/fargues-fontaine-slope-zero-input` (Fargues–Fontaine Corollary 11.2.22, Proposition 10.5.6, Theorem 8.2.10 (1), as the F-crystals paper cites them). It lives over Tau Ceti's AdicSpaces Layer 6 curve. The proof is the gap "Classification of vector bundles on the Fargues–Fontaine curve". |
| HodgeTateAndCanonicalSubgroups:T6:log-sites → PR.8 (stage edge only) | none | The edge is removed. The PR.8~2 revision already planned the log adic foundations inside PR.8. |

`restructure` R1–R5 records these moves. R6 maps the 39 bare stage citations of PR.0–PR.7 in the PR.8 packet to node ids, verified to exist, in 41 rows:
- rows 1–40 follow the ASM-PrismaticCohomology table;
- rows 37 and 40 are already resolved in the accepted revision;
- row 27 maps to DerivedDeRhamCohomology:DD.5/quasiregular-semiperfectoid-rings;
- row 31 maps to PR.2/qrsp-prism;
- row 41 adds the PR.5 citation of `absolute-log-prismatic-site`, which the table missed.

Row 5 (`prelog-prismatic-envelope`, envelopes of non-regular ideals) has no supplying node, and PR.8's coverage record says what its revision must do. R7 declares the six intra-roadmap layer edges that node prerequisites use (PR.5/PR.6 → PR.4; PR.4–PR.7 → PR.8).

**Applying the re-pointings.** They change prerequisites of accepted part nodes. They are applied when those packets are next revised, or by promotion of this packet together with the restructure records. No part packet was edited.

## Maintainer-added sources and red-team findings

- **Added sources.** The issue lists sources and items from:
  - BS22: items 48, 52b, 52c, 53, 97, 110, 111;
  - BM23: 009;
  - ALB23: 11, 25, 29, 31, 42–47, 127, 134, 152, 154, 155;
  - CDN: in-syntomic;
  - BMS2: 012–014, 069, 070, 074, 087, 088, 098, 102–104.

  Every one of them is planned by a node of the accepted PR.0 part (its `routedItems`). The packet repeats the map under `maintainerSources`, and the document has it as a table. Nothing new was needed.
- **Red-team findings.** The ten findings are RT-AREA-padic-2/4, /6, /24, /25, /26, /27, /28, /29, /30 and RT-AREA-etale/28. Each is handled in the accepted part (its `redTeamFindings`, repeated in this packet). Two are resolved differently now, because QWittVectors and VectorBundlesAndIsocrystals are outside the upstream order:
  - **RT-AREA-etale/28.** The single owner of the framed q-de Rham machinery is PR.6, not a QW.6 prefix.
  - **RT-AREA-padic-2/30 (b).** The request to the owner of the Fargues–Fontaine dictionary is replaced by the named input above.

  The remaining findings stand as handled in the part:
  - /6: BS22 Theorem 9.1 for arbitrary formal schemes;
  - /24: the arc-topology gap;
  - /25: SF.2, H0 and H1 suppliers;
  - /26: Corollary 5.5 through DD.3;
  - /27: Theorem 6.4's hypothesis, with Corollary 15.4 in PR.3;
  - /28: owners for the twists, the absolute Nygaard filtration and the syntomic complexes;
  - /29: the WCart quotient presentation, now on the PR.5 nodes added here instead of LP1;
  - /4: the R07.4 Kisin targets cited by PR.7.

## What remains

- **Recorded gaps.** The two new gaps are the named inputs above. The accepted parts' gaps stand: 25 in PR.0–PR.7 and 3 in PR.8, the most important being the arc and arc_p topology with arc-descent (Bhatt–Mathew Corollary 6.17, BS22 Proposition 8.10). The atlas still has no ArcTopologyAndDescent roadmap. That material is a candidate for moving down into PR.4 in a later plan, at 4–6 targets.
- **Part revisions.**
  - Apply R1–R4 and R6 to the part packets.
  - Withdraw the part requests to LP1, QW.6, RT.3b, RT.6 and VB2:classification.
  - Decide row 5 of R6.
- **Requests.** The new nodes cite existing nodes of EnhancedDerivedSheaves, SchemeAndStackFoundations, DiamondsAndVStacks, DerivedDeRhamCohomology, AInfCohomology and PadicHodgeTheory. The only request is to Tau Ceti's AdicSpaces Layer 6 (the curve itself).

## Files

- **Packet.** `research/blueprint/packets/PrismaticCohomology.json`. `check_blueprint.py` with the pinned declaration index reports 0 errors and 0 warnings. The 7 Mathlib declarations it cites were confirmed in the index and their modules at 082e2d3.
- **Document.** `research/blueprint/readmes/PrismaticCohomology.md` replaces the 7 October assembly document, which predated both accepted revisions and still carried source excerpts. The new document has:
  - a new front matter: summary, scope and ownership with the moves, conventions, exact supplier contracts by tier, build order;
  - a section for each layer PR.0–PR.8, each opening with an overview, then the new targets in full (statement, hypotheses, proof outline, sources, uses, API, Checks, acceptance, prerequisites), then the accepted targets of that layer, taken verbatim from the two accepted part readers;
  - the re-pointing table, named inputs, requests, the source and red-team maps and references;
  - the part readers' records, as Appendices A and B.

  It contains no excerpts and no local paths, and `intake.py check-files` reports 0 problems.
- **Lean.** `research/blueprint/suggested/PrismaticCohomology.lean` (235 lines) is written to the 2026-10-12 shape:
  - real-bodied light definitions `DeltaStructure` (with `frob`, `IsDistinguished`, `IsPrismIdeal`) and `QFraming` (with `qDeriv`);
  - milestone theorems: BS22 Lemma 2.25, the δ-structures of ℤ and ℤ_p, the q-derivative laws;
  - three discriminating examples;
  - a closing list of every untyped packet name, grouped by missing carrier.

  `lean-check` at Mathlib 082e2d3 exits 0, with 20 warnings, all `declaration uses 'sorry'`. `check_sorry_data.py` passes. The 737 KB joined file it replaces contained sorry'd data definitions. The full typed prototypes of the accepted parts remain in `PrismaticCohomology--PR.0.lean` and `--PR.8.lean`.

## Sources read for this pass (13 October 2026)

| Source | Read | SHA-256 |
| --- | --- | --- |
| Lurie, *Spectral Algebraic Geometry* (Feb. 2018 PDF) | §§6.2.2–6.2.3, 6.3.4 and D.6.3 | `515109098ae5…` |
| Bhatt–Lurie, arXiv 2201.06120 | §3.3 | `0b1beeb20c29…` |
| Scholze, arXiv 1606.01796 | §§3–4 | `ce060b41e28f…` |
| AMMN, arXiv 2003.12541 | Theorem 6.17 with proof, Propositions 6.18–6.21 | `2a0224b2e8b7…` |
| Bhatt–Scholze, arXiv 1905.08229v4 | Lemma 2.25, Lemma 3.1, Proposition 3.13, Theorems 1.8–1.18, 16.17–16.22, 17.2, for locators | — |

The full hashes are in the packet. Fargues–Fontaine was not reopened: its three locators are those the F-crystals paper prints, as the accepted part already recorded. No new source mistakes were found, so `sourceIssues` is empty.
