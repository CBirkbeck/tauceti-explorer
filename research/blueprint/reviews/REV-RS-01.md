# REV-RS-01 — review of the RS-01 restructuring (p-adic cohomology theories: A_inf, crystalline, derived de Rham, prismatic)

**Verdict: accepted, with no corrections.** Reviewer: Claude Code, session `cc-442dc5`, 23 September 2026. The proposal was written by ChatGPT Pro, session `astra-20260921-f6b2d8`. This reviewer took no part in it.

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
- **Forwarding (§15).** Both narrowed layers forward every consumer to every supplier.
- **Application.** `apply_restructurings` with the twelve accepted proposals applied first. All 16 new links apply and none closes a cycle. No reference is made to a dropped stage.

## 1. Duplication

**The finding.** Most of the 95 leads relate a construction to its application, or to a comparison with a genuinely different theory, rather than planning one object twice. The report's table says so pair by pair, and the stage texts bear it out:
- **Q2** says "Import PR.2's independent extension of the smooth-algebra prismatic functor to derived p-complete simplicial commutative algebras". So PerfectoidQuotients applies PrismaticCohomology's construction and does not rebuild it.
- **PR.0** constructs prismatic envelopes "by delta adjunction and derived completion" and then says "compare with the PD envelopes already built in CR.0". These are different envelopes with a comparison, as the table records.
- **AI.1** owns the derived décalage Lη with its ringed-topos hypotheses, and its export "consumed by saturated Dieudonné theory in CR.4" is a handoff.
- **CR.3** keeps only the corrected crystalline tower application, whose termwise-surjectivity caveat is source-specific. The generic derived-tower replacement is DD.1's.

**The real duplicates.** Only two stages rebuilt what others own, and the proposal narrows exactly those:
- **CP.0** imports:
  - the integral A_inf/theta/twist package (AI.0:integral);
  - the PD envelope A_cris (CR.0);
  - the rational period rings (R06.1);
  - the integral–rational comparison (AI.0:period-comparison).

  It keeps its geometric comparison functors and their commutativities.
- **CP.5** imports the generic BMS §4.2 specialization package (AI.5). It keeps geometric torsion and lattice recovery.

## 2. Nothing lost

- **The narrowings.** CP.0 keeps the diagram and the proved identifications among concrete maps. CP.5 keeps its geometric application.
- **Everything else.** The other 59 stages are unchanged.
- **The one new reachability.** CP.3 → CP.2 is a previously unrecorded filtered input to the late crystalline comparison, and the report justifies it.
- **External consumers.** They are untouched.

## 3. Anchors, format

- **Anchors.** The family has none, and no Tau Ceti roadmap is changed, extended or renamed.
- **Format.** The JSON follows PROTOCOL §15.

## Question for the orchestrator

**Many leads, few changes.** 190 evidence records led to only two narrowings, because the leads are mostly supplier–consumer relations in a family built on shared carriers (A_inf, PD envelopes, derived completion, prisms). The review accepts that reading on the spot checks above. Each member's blueprint job should still confirm, declaration by declaration, that it imports and does not reconstruct the carriers named in the table.
