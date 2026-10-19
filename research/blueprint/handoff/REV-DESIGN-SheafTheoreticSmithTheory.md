# Handoff: REV-DESIGN-SheafTheoreticSmithTheory

Refs #3612. Claude, session `claude-dYkRoR`, 19 October 2026. The claim was confirmed by the bot (issue comment 6257586626). Branch `claude-dYkRoR-rev-design-smith-theory`. This review did no work on the design under review (DESIGN-SheafTheoreticSmithTheory, Codex `codex-hlwubh`).

## Outcome

**Accepted, with corrections made in place.** The verdict is in the packet's `review` object. The full report is `research/blueprint/reviews/REV-DESIGN-SheafTheoreticSmithTheory.md`.

- Checks: `check_blueprint.py` with the pinned index gives 0 errors and 0 warnings, and `intake.py check-files` reports no problems.
- Lean: `lean-check` elaborates the suggested file at Tau Ceti f790474 and Mathlib 082e2d3, with 14 `sorry` warnings and nothing else.
- Every source hash matches the packet.

## What changed

- **Matches.** All 65 were rewritten, since each had copied its node's statement, and second sources became separate source entries. Ten node locators were corrected.
- **Test kinds.** Every unit test now has its PROTOCOL section 12 kind.
- **Highest-weight supplier.** Weyl modules, good filtrations and the Donkin–Wang–Mathieu theorem are now requested from the integral highest-weight extension of `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-…`, not from LanglandsParameterStacks LP3, which imports them from the same place. That extension is DESIGN-ReductiveGroupsPartIII, #3357, not yet designed. The roadmap's ST.3 `requires` and prerequisites were changed to match.
- **Source findings.** Three new ones were added:
  - E36: a category slip in Lemma A.3.
  - E37: §4.4 states a weaker hypothesis than LL21 Theorem 5.6.6 needs.
  - E38: over fields of positive characteristic the JMW condition holds only for constant local systems on strata. An Artin–Schreier sheaf on a one-dimensional Bruhat cell has H¹ ≠ 0.

  E15–E35 were confirmed.
- **TV16 special cases.** The vector-space Frobenius twist and the Hom(A,k)^σ ≅ Hom(T⁰A,k) bijection were added, as the TV16 route brief assigns them here.
- **Other edits.**
  - The GS.1 request now says the Grassmannian carrier is needed over a general separably closed base field.
  - Twenty requests point to their upstream TauCetiRoadmap pull request (#908, #1040, #785, #779).
  - Five API items were added; two obligation planets were removed and one renamed.
  - Two restructure entries were added: an ownership note for modular Satake, and the Part III import of tilting modules.
- **Reader.** It was regenerated from the packet with escaping for `src/markdown.js`.
- **Suggested file.** The empty uniqueness clause of `tate_character_extension` was fixed. The formula is now a separate theorem with its needed hypothesis, the easy half of TV (3.4.1) was added, and two docstring locators were corrected.

## For the next jobs

- G1–G5 remain the roadmap's open foundations, and all nine stages stay `planned`. G3, the Mautner–Riche exotic engine, has no owner in the atlas.
- DESIGN-ReductiveGroupsPartIII should plan the highest-weight inputs requested here and import the tilting modules of ST.3.
- The ShtukaTateCohomologyAndGlobalBaseChange Part II (PAPER-FENG-24 route 2) should import ST.3's modular Satake and adopt E38's convention.
- No scratch file is needed to resume. Source PDFs are public; their URLs and hashes are in the packet.
