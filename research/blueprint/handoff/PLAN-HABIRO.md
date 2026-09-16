# PLAN-HABIRO — handoff

Job: **PLAN-HABIRO** (planning; no packets). Date: 2026-09-16.
Status: **complete; awaiting independent review (REV-PLAN-HABIRO) and the user's decisions D1–D15.**

## Deliverables

- `research/blueprint/plans/HABIRO.md`: the plan, with sections (a)–(g) and appendices: provenance, conventions,
  target statements with locators, baseline inventory, the dependency chain, the proposed roadmaps,
  stage-by-stage treatment of the six existing roadmaps, blueprint order, open questions, and decisions.
- Five new roadmap definitions (PROTOCOL §7 schema, `status: draft`) in `research/blueprint/roadmaps/`:
  - `QWittVectors.json` (QW.0–QW.7, group `cohomology`);
  - `SolidAnalyticRings.json` (SA.0–SA.4, `foundations`);
  - `AnalyticStacks.json` (AS.0–AS.4, `foundations`);
  - `RingStacksAndTransmutation.json` (RS.0–RS.3, `foundations`);
  - `AnalyticHabiroStack.json` (HS.0–HS.4, `motivic`).
- This note.

No other repository file was edited. No git command and no Lean or lake command was run. No PDF, extracted
text or private path is in the repository; the notes are cited by title, author, course and date.

## Baseline and inputs

- Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`; Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`.
- GSWZ arXiv:2412.04241v2 (PDF and TeX e-print fetched 2026-09-16). SHA-256 values are in plan §1.1.
- Ong's notes of Scholze's V5A2: all four supplied versions compared word by word; the plan follows the
  6 March 2025 version. The campaign library copy has the same text. One true statement from the 1 Dec 2024
  version, $K_3(K)\otimes\mathbb Q\cong K_3(\mathcal O_K)\otimes\mathbb Q$, was dropped later; it is recorded in plan §1.2.
- Ong's notes of Scholze's V5A4 (one version).
- References followed: plan §1.3, with hashes. Sources that blueprint jobs still need to fetch: plan §1.4
  (notably Ayoub, Astérisque 314, for RS.2; the correct Efimov DT paper for HB.8; Bhatt–Lurie arXiv:2201.06124
  for RS.1).

## Checks performed

In scratch:

- The five JSON files load. Each has exactly the §7 keys, a summary of at least 40 words, a valid group,
  `status: draft`, and sources with `https` URLs.
- Every `requires` entry resolves to an atlas stage (`data/atlas.json`) or a stage of the new roadmaps.
  Every roadmap used by a stage is listed in `prerequisites`.
- The union graph (atlas `stages[].requires` + `stageEdges` + the new stages) is **acyclic**.
- It stays acyclic after applying **all** requirement changes proposed in plan §6, including those to
  neighbours (PR.5 ← RS.0, VS2 ← SA, QM.0 ← HC.1, Z.3 ← QW.1).
- No match for the checker's private-path pattern, no absolute local path of any kind, and no Lean code.
- Stage descriptions avoid "optional", "deferred", "later" and "TODO".
- `scripts/check_blueprint.py`'s `world()` reads `research/blueprint/roadmaps/*.json` by `id` and
  `stages[].key`, which these files provide. No packet was written, so the checker itself was not run.
- Every baseline declaration cited in plan §4.1 was re-read in its source file at the pinned commits. Line
  numbers are those of the pinned files.

## What the next jobs need to know

1. **REV-PLAN-HABIRO.** Points most worth checking:
   - the stage-move tables (plan §6), against the current atlas stage texts;
   - the boundary between QW.7 and HQ.2/HQ.3 in Wagner v2 §3.4 (the $q$-dRW-only statements go to QW.7; those
     involving $q\Omega^{(m)}$ or $q\mathrm{dR}$ go to HQ.2);
   - the reordering of AnalyticStacks: Scholze's proof of Theorem 9.15 needs the analytic-stack formalism, so
     analytic stacks are AS.2 and the solid formalism on schemes and discrete adic spaces is AS.3;
   - the source-status wording in AnalyticHabiroStack;
   - the readings flagged in plan §8 items 9 and 16 (V5A4 Definition 8.4, Example 8.6, and the Nahm-sum
     conventions).
2. **Restructure proposals** for the orchestrator (`RESTRUCTURE.md`):
   - rescope HabiroRings, HabiroNumberFields, HabiroNahmSeries and HabiroCohomologyFoundations as in plan §6;
   - add HQ.9;
   - split PrismaticCohomology PR.0 into a δ-ring prefix and the perfect-prism part (D10);
   - PR.5 imports RS.0 (D13);
   - move QM.0's $q$-binomial identities to HC.1 (D11);
   - text fix in CR.4 ("Habiro HQ.4" → "QWittVectors QW.5").
   The existing six roadmaps' atlas entries were not edited, as the rules require.
3. **Queue.** Blueprint jobs should follow the two tracks of plan §7. Recommended parts: QWittVectors
   {QW.0–QW.4}, {QW.5–QW.7}; AnalyticStacks {AS.0–AS.2}, {AS.3–AS.4}; HabiroCohomologyFoundations
   {HQ.1–HQ.3}, {HQ.4–HQ.9}.
4. **Gaps to expect.** AnalyticHabiroStack rests on statements without written proofs (plan §8 items 8–10;
   decision D4). Its blueprint will contain `gap` entries unless a written account appears; schedule it last.
   HQ.4 has a gap for identifying Wagner's Habiro–Hodge complex with V5A4's Koszul complex (§8 item 5), and for
   the full proof of V5A4 Theorem 5.7 (§8 item 7).
5. **Reserved ids used by the plan.** `K3BlochGroups:V.3/*`, `K3BlochGroups:V.4/suslin-exact-sequence` and
   `Polylogarithms:P.1/*` (from `reserved-ids.json`) are the intended suppliers for the Bloch-group inputs.

## Decisions for the user

The fifteen decisions, with recommended defaults, are in plan §9. The definitions follow the defaults:

- D1: create the five roadmaps;
- D2: $q$-Witt theory moves to QW;
- D3: a single Taylor-glued construction in HR.1, specialised by HB.6;
- D4: unwritten analytic results are targets with gap status;
- D5: V5A2 Lectures 10–12 go into HB.9, Lecture 9 is excluded;
- D6: the exclusion list;
- D7: GW25 becomes HQ.9, while GW26 and Bouis–Gazda are recorded only;
- D8–D9: GSWZ's conventions, with modules indexed by $K_3(K)$;
- D10–D14: the neighbour adjustments;
- D15: the order and parts.
