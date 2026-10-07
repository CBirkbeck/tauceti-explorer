# REV-RS-01 — review of the RS-01 restructuring (p-adic cohomology theories: A_inf, crystalline, derived de Rham, prismatic)

**Verdict: accepted, with no corrections.** Reviewer: Claude Code, session `cc-442dc5`, 23 September 2026. The proposal was written by ChatGPT Pro, session `astra-20260921-f6b2d8`. This reviewer took no part in it.

> **Corrections (FIX-RT-RS-01, 7 October 2026).** The red team RT-RS-01 showed three statements of this review to be false, and its verification confirmed them (findings /8, /21 and /24). They are corrected in place below, each marked as a correction; the rest of the review is unchanged. The revised proposal (`RS-01.result.json`, pending REV-FIX-RT-RS-01) adds the owner records and links that these corrections call for. This review's verdict concerned the first revision, and it is kept verbatim in the result's `reviewHistory`.

**What was read.**
- `RS-01.json`: seven members, no anchors, and 190 evidence records (95 unordered pairs). The members are AInfCohomology, CohomologyComparisons, CrystallineCohomology, DerivedDeRhamCohomology, PadicHodgeTheory, PerfectoidQuotients and PrismaticCohomology.
- The proposal `RS-01.result.json` (8 layer entries, 19 links, 5 owners) and its report `RS-01.md`:
  - its exact ownership changes for CP.0, CP.5 and CP.3 → CP.2;
  - its table resolving every flagged pair;
  - its conservation ledger for all 61 stages;
  - its consumer section.
- Spot-checked stage texts: CrystallineCohomology CR.3, PrismaticCohomology PR.0 and PR.1, PerfectoidQuotients Q2 and AInfCohomology AI.1.

**Checks run.**
- `python3 scripts/check_restructure.py research/blueprint/restructure/RS-01.result.json` reports `ok`.
- **Coverage.** The 8 layer entries cover the changed stages (2 narrow, 6 explicit keep). The other 53 stages are unchanged, and the conservation ledger lists them.
- **Evidence.** Only 4 of the 95 pairs share an owner entry. The report's table resolves all 95.
- **Forwarding (§15).** Both narrowed layers forward every consumer to every supplier at stage level. *Correction (RT-RS-01/8):* not at node level. Five CP.5 nodes that the proposal sent to AI.5 required the two CP.0 nodes (Witt-vector coherence and the §4.2 specialization dictionary), and CP.0 is not upstream of AI.5. The revision gives those targets to AI.0 and re-points the prerequisites.
- **Application.** `apply_restructurings` with the twelve accepted proposals applied first. All 16 new links apply and none closes a cycle. No reference is made to a dropped stage.

## 1. Duplication

**The finding.** Most of the 95 leads relate a construction to its application, or to a comparison with a genuinely different theory, rather than planning one object twice. The report's table says so pair by pair, and the stage texts bear it out:
- **Q2** says "Import PR.2's independent extension of the smooth-algebra prismatic functor to derived p-complete simplicial commutative algebras". So PerfectoidQuotients applies PrismaticCohomology's construction and does not rebuild it.
- **PR.0** constructs prismatic envelopes "by delta adjunction and derived completion" and then says "compare with the PD envelopes already built in CR.0". These are different envelopes with a comparison, as the table records.
- **AI.1** owns the derived décalage Lη with its ringed-topos hypotheses, and its export "consumed by saturated Dieudonné theory in CR.4" is a handoff.
- **CR.3** keeps only the corrected crystalline tower application, whose termwise-surjectivity caveat is source-specific. The generic derived-tower replacement is DD.1's.

**The real duplicates.** *Correction (RT-RS-01/21):* the original sentence, "Only two stages rebuilt what others own, and the proposal narrows exactly those", was false. Besides CP.0 and CP.5, further stages re-plan supplier targets, in their stage texts or in node plans that existed before RS-01: R06.1, P8:local-rational, Q2, CP.4, AI.6, and CP.2 with AI.5 (Proposition 13.21). These require owner records, which the revised proposal adds. The two narrowed stages are these:
- **CP.0** imports:
  - the integral A_inf/theta/twist package (AI.0:integral);
  - the PD envelope A_cris (CR.0);
  - the rational period rings (R06.1);
  - the integral–rational comparison (AI.0:period-comparison).

  It keeps its geometric comparison functors and their commutativities.
- **CP.5** imports the generic BMS §4.2 specialization package (AI.5). It keeps geometric torsion and lattice recovery. *Correction (RT-RS-01/1):* the package splits between AI.2, which owns the module structure theory through Proposition 4.13, and AI.5, which owns the complex-level lemmas.

## 2. Nothing lost

- **The narrowings.** CP.0 keeps the diagram and the proved identifications among concrete maps. CP.5 keeps its geometric application.
- **Everything else.** The other 59 stages are unchanged.
- **The one new reachability.** CP.3 → CP.2 is a previously unrecorded filtered input to the late crystalline comparison, and the report justifies it. *Correction (RT-RS-01/24):* it is the one new direct dependency, but in the transitive closure it adds four reachable pairs: CP.3 → CP.2, CP.3 → CP.5, P8:local-rational → CP.2 and P8:local-rational → CP.5. The revision also moves the CP.3 node that used CP.2's material (the good-reduction identification) to CP.2.
- **External consumers.** They are untouched.

## 3. Anchors, format

- **Anchors.** The family has none, and no Tau Ceti roadmap is changed, extended or renamed.
- **Format.** The JSON follows PROTOCOL §15.

## Question for the orchestrator

**Many leads, few changes.** *Correction (RT-RS-01/21):* the red team found more ownership repairs than the two narrowings, and the revised proposal records them as owner records and links; the original question follows. 190 evidence records led to only two narrowings, because the leads are mostly supplier–consumer relations in a family built on shared carriers (A_inf, PD envelopes, derived completion, prisms). The review accepts that reading on the spot checks above. Each member's blueprint job should still confirm, declaration by declaration, that it imports and does not reconstruct the carriers named in the table.
