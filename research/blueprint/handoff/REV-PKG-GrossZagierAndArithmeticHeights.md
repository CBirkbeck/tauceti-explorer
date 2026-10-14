# Handoff: REV-PKG-GrossZagierAndArithmeticHeights

Claude, session `claude-NKgeCb`, completed issue #9217 on 2026-10-14. This is a
finished independent review with verdict **needs_changes**. I did none of
`PKG-GrossZagierAndArithmeticHeights`. One issue claimed; no second job.

## Delivered

- `research/blueprint/reviews/REV-PKG-GrossZagierAndArithmeticHeights.md`:
  checks, every correction, the source table, the adversarial pass, the
  duplication result, the remaining defects and questions for the maintainer.
- `research/blueprint/packages/GrossZagierAndArithmeticHeights/review.json`:
  `independent-review-REV-PKG-GrossZagierAndArithmeticHeights`, 2026-10-14,
  `needs_changes`.
- Package README, corrected in place: 675,240 bytes, 277 targets.
  - Height convention now that of current Tau Ceti (`canonicalHeight` = h_x).
  - Duplicates 7.15 and 7.34 removed; AS.2.23 and AS.2.24 cited instead.
  - New targets 1.5, 4.7 and 5.6 close the former self-contracts.
  - Supplier section in upstream form; standing hypotheses factored into
    (C), (H), (Q), (Q′), (G), (L); rewrite artifacts repaired.
- Package Suggested.lean: `lean-check` exits 0 with 21 `sorry` warnings and
  nothing else. `metadata.toml` is unchanged (`topic = "math.NT"`).

## What the revision must do

The one blocking item is R1/R2 of the report.
- 23 supplier contracts have no matching content in the named supplier, and
  43 have only partial content. The report's table lists each with the
  missing content.
- Layer 2 rests on `ArakelovGeometryAndAbelianHeights:R35.1`, which states no
  targets.
- Layer 9 uses Harris–Kudla (algebraicity of α(f,f_B)), Prasanna Theorem 2.4
  (integrality) and Prasanna Theorem 3.2 (explicit Waldspurger formula), none
  of which any roadmap plans.

For each item, either plan the notion here, with statement, hypotheses,
locator, API and three discriminating Checks, or obtain a supplier target and
re-point the contract to the stage that states it. Candidates for planning
here: Gross's canonical and quasi-canonical lifting lengths (CM.5), Zhang's
ordinary multiplicities (HE.2) and weight-two holomorphic projection (AS.4).
The ordinary CM formal trivializations of the R18.2 contract are planned in
AbelianSchemesAndArithmeticModuliPartII P4; that part can be re-pointed. This
review already re-pointed R12.3 to R13.1 and the ideal-class theta contract to
MP.5.

The Sonnet cross-check table behind R1 (one row per contract, with supplier
README line numbers) was a scratch file and is not kept. Re-derive it by
reading each contract in "Exact supplier contracts" against the supplier's
`research/blueprint/atlas/roadmaps/<S>.json`, packets and package README.

## For the maintainer

- GZ is not in the Caraiani–Newton order. It forms target-level cycles with
  HeegnerPointEulerSystems and GeneralizedHeegnerCycles (report, question 1).
- The accepted packets GZ.0 and GZ.8 still use the f790474 height convention
  and the old target set. Propagating this review's corrections to them is a
  separate job.
- The YZZ 2013 book is neither public nor in the cleared library, so its
  locators remain unverified. Its statements are checked here only through
  CST, Zhang (2010) and Yuan–Zhang (2018).
