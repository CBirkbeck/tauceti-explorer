# PAPER-ESNAULT-GROECHENIG-20 — handoff (closed)

Opened by Codex, session `codex-a71f92`, 22 September 2026 (checkpoint, PR #1945). **Closed** by Claude Code, session `cc-fb70e5`, 22 September 2026. Issue #1466. Status of the extraction: **complete**. Nothing is outstanding for a further worker; this file is kept because a submission never deletes a file, and it is superseded by the report, [PAPER-ESNAULT-GROECHENIG-20.md](../papers/PAPER-ESNAULT-GROECHENIG-20.md).

## How the nine gates were resolved

The published paper was re-read in full and every statement re-verified against it, independently of the first pass.

- **G1, G2, G5, G6, G8** of the checkpoint were defects in the **published paper**, not unfinished extraction. PROTOCOL §18 handles those with `sourceIssues` plus items stated in corrected form; both are in place, and an extractor cannot close them without repairing the paper. They survive as `gaps` G1–G5, each naming the items that carry the corrected statement, for the design jobs to act on.
- **G3, G4, G9** and half of **G5** asked for the proof interiors of *prerequisite* papers — Ogus–Vologodsky, Lan–Sheng–Zuo, Sun–Yang–Zuo, Xu, Faltings, Abe, Abe–Esnault, Langer, Simpson, Langer–Simpson, André, Brunebarbe–Klingler–Totaro — to be extracted here. That is what the `prerequisites` list is for, and its 33 entries now say which statement of each is quoted and where. The job instruction is to read what the paper relies on far enough to know exactly what an input says, not to extract those papers.
- **G7** was neither: it is a design decision about geometric versus arithmetic isomorphism classes in §7's counting argument. It survives as `gaps` G6, with the paper's own normalisation (Definition 7.2, Proposition 7.4(3)) recorded in items 111 and 114.

## What the second pass changed

All ten source findings were re-verified and all survived; each had been recorded with a two- or three-word fragment in place of the printed sentence, so all ten were rewritten with quotations. E2, E3, E4 and E6 gained sharper witnesses; nine further slips joined E10; pages 106, 119 and 133 were read as 300 dpi images. The reused pending Part II `HodgeStructuresPartII` had area `arithmeticgeometry` here against `algebraicgeometry` in the two papers that already propose the same roadmap, and was corrected. The two lumped prerequisite entries were replaced by 23 real ones.

## Checks at closing

`scripts/check_paper.py`: ok, with `"status": "complete"`. `research/blueprint/intake.py check-files` on the deliverable paths: 0 problems. `python3 -m unittest tests.test_check_paper`: 9 tests, OK. No Lean file was compiled; none belongs to a paper issue.
