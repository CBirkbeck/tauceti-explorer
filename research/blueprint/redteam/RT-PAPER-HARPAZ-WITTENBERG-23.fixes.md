# RT-PAPER-HARPAZ-WITTENBERG-23: fixes

Fixer: Claude Code, session `cc-39fac3`, 29 September 2026 (issue #3957, job FIX-RT-PAPER-HARPAZ-WITTENBERG-23).
- Findings: `RT-PAPER-HARPAZ-WITTENBERG-23.result.json`.
- Verdicts: `RT-PAPER-HARPAZ-WITTENBERG-23.review.json`.
- One finding, confirmed.

## RT-PAPER-HARPAZ-WITTENBERG-23/1 (medium, duplicate): fixed as the review directs

**Finding.** The Picard group of a finite-stabilizer homogeneous space is proposed twice for HeightsRationalPointsPartIIHomogeneousMassey: here as item 39, and in PAPER-HARPAZ-WITTENBERG-20 as item 81.

**Why this form of fix.**
- The red team proposed dropping item 39 from this record's route.
- The review showed that cannot be done. The paper uses the statement on p. 8 for the exact sequence (3.1), so the extraction keeps the item, and every missing item must be routed exactly once (§16).
- No item-level coalescence block exists in these records. The review asked instead for the records' own practice for shared inputs, the one PAPER-HARPAZ-WITTENBERG-20/101 already follows for the supersolvable theorem: keep the item and name the owner.

**Changes in `papers/PAPER-HARPAZ-WITTENBERG-23.result.json`.**
- **Item 39.**
  - Its note now opens: "This is [HW20, §5] = PAPER-HARPAZ-WITTENBERG-20/81, cited, not proved, in this paper (§3 p.8), where it gives the exact sequence (3.1). The shared candidate HeightsRationalPointsPartIIHomogeneousMassey builds it once, from HW20 §5.2 (Rosenlicht, Kummer theory, Pic(G_k̄)=0); this item is its consumer."
  - The note records why the two statements agree: H is finite, so Hom(H^ab, k̄×) = Hom(H^ab, μ∞).
  - The existing API and test notes are kept.
  - Its locator is now "§3 p.8 (recalled from [HW20, §5])".
  - Its kind changes from `construction` to `theorem`, matching HW20/81, as the review suggests.
- **The route brief** for HeightsRationalPointsPartIIHomogeneousMassey ends with: "The finite-stabilizer Picard identification Pic(V_k̄)=Hom(H^ab,μ∞) (item 39) is PAPER-HARPAZ-WITTENBERG-20/81: build it once from HW20 §5 and let the Massey layers consume it." The design job now has the identification in both records' briefs.

**Change in `papers/PAPER-HARPAZ-WITTENBERG-23.md`:** a short "Red-team fix" section recording the identification.

**Not done here: HW20/81's matching note.** `papers/PAPER-HARPAZ-WITTENBERG-20.result.json` is not a deliverable of this job, and the intake rejects edits outside a job's files. A note for the maintainer, or for the next job touching HW20:
- add to item PAPER-HARPAZ-WITTENBERG-20/81's note: "Consumer: PAPER-HARPAZ-WITTENBERG-23/39 (cited in HW23 §3 p.8 for (3.1)); this record owns the statement for HeightsRationalPointsPartIIHomogeneousMassey";
- optionally fold the μ∞ form into its statement.

HW20's route reason already forbids a second copy, so the ownership is unambiguous from either record.

**Checks.** `check_paper.py` passes, `intake.py check-files` reports no problems, and the unit tests pass. The item count, routes and statuses are unchanged.
