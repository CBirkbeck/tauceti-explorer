# REV-RS-10 — review of the RS-10 restructuring (Habiro rings and Habiro cohomology)

**Verdict: needs changes.** Reviewer: Claude Code, session `cc-442dc5`, 23 September 2026. The proposal was written by Codex, session `codex-c83e7a`. This reviewer took no part in it. No correction was made in place, because the main problem needs a design choice by the author.

**What was read.**
- `RS-10.json`: five members (ArithmeticQuantumTopology, HabiroCohomologyFoundations, HabiroCyclotomicCompletions, HabiroNumberFields, HabiroRings), no anchors, and 52 evidence records (26 unordered pairs).
- The proposal `RS-10.result.json` (38 layer entries, 78 links, 18 owners) and its report `RS-10.md`, including its "Before and after", evidence and consumer sections.
- The three draft roadmaps the proposal names as suppliers, in `research/blueprint/roadmaps/`: QWittVectors, SolidAnalyticRings and AnalyticHabiroStack, all with status `draft`.

**Checks run.**
- `python3 scripts/check_restructure.py research/blueprint/restructure/RS-10.result.json` reports `ok`. The checker accepts stages of the draft roadmaps.
- **Coverage.** Every one of the 38 member stages has an entry (11 narrow, 27 keep).
- **Evidence.**
  - 19 of the 26 pairs share an owner entry.
  - The other 7 are explained in the report as different APIs or handoffs, not duplicates: HQ.3/HR.4, HQ.5/HR.5, HQ.5/HR.6, HQ.7/HC.6, HQ.7/HR.7, HC.6/HR.7 and HB.6/HR.5-number-field-comparison. The review accepts those explanations.
- **Forwarding (§15).** For each narrowed layer, a link from each supplier to each atlas consumer was looked for.
- **Application.** `apply_restructurings` with the twelve accepted proposals in `data/restructure/` applied first. 33 new edges apply and 27 links are skipped: 26 because their source is a draft-roadmap stage absent from the atlas, and 1, HQ.3 → HQ.4, because it would close a cycle.

## 1. What is right

The ownership analysis is careful and the evidence is fully resolved.
- The ordinary cyclotomic completions stay in HabiroCyclotomicCompletions.
- HR.1 builds the early Taylor ring, HB.6 specializes it arithmetically, and HR.5 and HR.5-number-field-comparison identify the constructions.
- The trace-dependent existence case moves to HQ.5-trace.
- The test stages keep their different APIs.

The external exports listed in the report are preserved. The draft QWittVectors roadmap is the natural owner of Λ-theory and q-Witt theory, if it is accepted.

## 2. Required changes

1. **The HQ.3/HQ.4 order cannot be represented.**
   - **What the report asks.** "Remove old supplier → consumer" for seven existing edges, including HQ.4 → HQ.3, with the instruction "Apply removals to both `stages[].requires` and all integrated edge records".
   - **Why that cannot happen.** PROTOCOL §15 has no field for removing an edge, and `scripts/restructure.py` only adds links or attaches evidence to existing edges.
   - **The consequence.** With HQ.4 → HQ.3 retained, the proposal's HQ.3 → HQ.4 link is skipped as a cycle. The new split cannot be ordered: HQ.3 owns "the descent application formerly in HQ.4", and the narrowed HQ.4 keeps its "comparison with HQ.3".
   - **Choices.**
     - Re-scope HQ.3 and HQ.4 so that the existing direction HQ.4 → HQ.3 remains valid. For example, HQ.3 could absorb the whole framed application instead of HQ.4 comparing with HQ.3.
     - Or ask the orchestrator explicitly for a removal mechanism, stated outside the §15 JSON.
   - **The other six removals.** They are CR.4 → HQ.4, HR.4 → HQ.4, HQ.6 → HQ.7, M.1 → HB.6, and the two KU-habiroring edges. They would also not happen, so the proposal should say that these coarse edges stay, and confirm that this is acceptable. In particular, HQ.7's tests would still wait for HQ.6's analytic comparison.
2. **65 §15 forwarding links are missing.** §15 says that "every layer that relied on it gets a link from the new supplier". For the eleven narrowed layers, these supplier → consumer pairs have no link and no existing edge:

- HQ.1 (10): QW.1 → HQ.2; QW.1 → HQ.8; QW.6 → HQ.2; QW.6 → HQ.8; HR.1 → HQ.2; HR.1 → HQ.8; HC.1 → HQ.2; HC.1 → HQ.8; PR.6 → HQ.2; PR.6 → HQ.8
- HQ.4 (17): QW.2 → HQ.3; QW.2 → HQ.5; QW.2 → HQ.8; QW.2 → HR.6; QW.6 → HQ.3; QW.6 → HQ.5; QW.6 → HQ.8; QW.6 → HR.6; HR.3 → HQ.5; HR.3 → HQ.8; HR.3 → HR.6; HR.1 → HQ.3; HR.1 → HQ.5; HR.1 → HQ.8; HR.1 → HR.6; HR.5 → HQ.3; HR.5 → HQ.8
- HQ.5 (4): HQ.5-trace → HR.6; HR.5 → HQ.5-trace; HR.5 → HQ.6; HR.5 → HQ.8
- HC.5 (1): HR.2 → HC.6
- HC.6 (1): HB.6 → QT.4
- HB.6 (12): HR.1 → HB.7; HR.1 → HR.5-number-field-comparison; HC.1 → HB.7; HC.1 → HR.5-number-field-comparison; HC.3 → HB.7; HC.3 → HR.5-number-field-comparison; HC.4 → HB.7; HC.4 → KU-habiroring; HC.4 → HR.5-number-field-comparison; HC.5 → HB.7; HC.5 → KU-habiroring; HC.5 → HR.5-number-field-comparison
- HR.1 (1): HC.3 → HR.2
- HR.2 (7): HC.1 → HQ.3; HC.2 → HQ.3; HC.2 → HR.3; DD.1 → HQ.3; DD.1 → HR.3; SA.1 → HQ.3; SA.1 → HR.3
- HR.3 (2): HC.1 → HR.4; HC.4 → HR.4
- HR.4 (4): QW.2 → HR.5; QW.3 → HQ.4; QW.3 → HR.5; QW.4 → HQ.4
- HR.5 (6): HC.1 → HR.5-number-field-comparison; HC.1 → HR.6; HC.3 → HR.5-number-field-comparison; HC.3 → HR.6; HR.1 → HR.5-number-field-comparison; HR.1 → HR.6

   Add them, or justify each omission in the report as it already does for two pure transfers. Those two are HC.6's late test moving to HB.6 (so no HB.6 → QT.4) and HQ.5-trace. Where a forwarded link would itself close a cycle, say so.
3. **The draft roadmaps must land first.** HQ.1, HQ.4, HR.1 and HR.4 hand Λ-rings, q-Witt rings, q-de Rham–Witt and animated q-Witt forms to QWittVectors QW.1–QW.7, and HR.2 hands the light-solid comparison to SolidAnalyticRings SA.1. These roadmaps are drafts, not atlas roadmaps, so all 26 links from them are skipped, and the targets would have no atlas owner if RS-10 were applied now. The proposal should state that it is to be applied together with, or after, the acceptance of QWittVectors and SolidAnalyticRings. Alternatively it could keep those targets in HQ.1, HQ.4, HR.1, HR.2 and HR.4 until then.

## Questions for the orchestrator

1. **Edge removal.** Should §15 gain an edge-removal field, or should proposals always be written so that no existing atlas edge has to be removed? RS-10 is the first reviewed proposal that depends on removals.
2. **Ordering against draft roadmaps.** Should proposals that narrow layers in favour of draft roadmaps (`research/blueprint/roadmaps/`, status `draft`) be held until those roadmaps are accepted into the atlas?
