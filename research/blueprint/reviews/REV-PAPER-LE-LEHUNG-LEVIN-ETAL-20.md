# Review of PAPER-LE-LEHUNG-LEVIN-ETAL-20 — checkpoint

**Job** REV-PAPER-LE-LEHUNG-LEVIN-ETAL-20 (issue #1403) · **Date** 2026-09-23 · Claude Code, session
`cc-7b31c4` · **Partial: a checkpoint, not a completed review.** The structural review is complete
and one correction is made; four of the 132 findings carry verdicts. No `review.json` is written, and
the remaining findings are listed below for the next worker.

Paper: Daniel Le, Bao V. Le Hung, Brandon Levin and Stefano Morra, *Serre weights and Breuil's
lattice conjecture in dimension three*,
[Forum of Mathematics, Pi **8** (2020), e5](https://doi.org/10.1017/fmp.2020.1), 135 pages. The
recorded hash of the authors' copy of the published version reproduces as
`848f3b73d80dbfe24af8bf863207b2bd426b74851f3e13e95d8e89f152cbbec0`, and I re-extracted all 135 pages;
the printed page numbers coincide with the PDF's.

## What is complete

**Structure.** 593 items (562 missing, 25 planned, 6 library). Every missing item is routed exactly
once, all stage ids of the five source routes exist, all 25 planned layer ids exist, both Part II
parents exist and both proposed titles reproduce their parents' atlas titles exactly, and
`scripts/check_paper.py` passes. All six library items' declarations resolve at the pins:
`minimalPrimes`, Tau Ceti's `socle` with `isSemisimpleModule_socle` and `le_socle_of_isSemisimpleModule`,
`Submodule.eq_bot_of_le_smul_of_le_jacobson_bot`, `localCohomology` with `isoOfSameRadical`, and
`AlgebraicGeometry.tildeEquiv`.

**Correction.** The `GenericGL3SerreWeightsAndLattices` route carried `"area": "modular"`. That is
the parent roadmap's atlas **group**, not a galaxy id — and `PAPER-LE-LEHUNG-LEVIN-ETAL-23`, which
proposes the same roadmap id, uses `automorphic`. The area is now `automorphic`. (The two files give
that shared id slightly different topic halves in the title — "generic GL3 weights and Breuil
lattices" here against "generic Breuil–Mézard, Serre weights and GL3 lattices" there — which the
design job will have to settle; the parent prefix matches in both.)

**Locators.** Of 461 name-and-page checks, 401 land on exactly the page given once the paper's
small-caps theorem headers are normalised. I read a sample of the other 60 and they are right too:
they are deliberately precise rather than loose — "proof of Proposition 3.2.1, p.29" (statement on
p.28), "paragraph before Lemma 3.6.10, published p.58" (the lemma is on p.59), "proof of Theorem
4.2.1, Claim 2, published p.81". I found no locator error.

**Findings, mechanically.** For 113 of the 132 findings the quoted `printed` text is located at its
own locator page by an automated search of the extracted text. The other 19 are quotations of
displays, matrix entries or symbol-heavy formulas that this PDF's fonts do not render into readable
text (E05–E09, E11, E12, E31, E43, E45–E47, E49, E53, E54, E60, E77, E126), together with E14, which
the record itself places in the arXiv versions only.

## Verdicts recorded

Four findings are verified in substance and carry `review` objects:

- **E32** (error, a stated result). Corollary 2.3.11 on p.22 opens "Let `w̃ ∈ W_a t_η`", while
  Proposition 3.4.2 on p.35 states its conclusion for any shape `w̃ ∈ W̃^∨` and its proof invokes that
  corollary. The hypothesis the correction adds is exactly what the invoked result requires.
- **E96** (gap, the proof). The proof of Theorem 5.3.1 on p.124 is "Given Theorems 5.3.3 and 3.5.3,
  the proof of [LLHLM18, Theorem 7.4] goes through unchanged", and §6(16) on p.130 says of that very
  result that "Theorem 7.4, which was omitted, uses the same techniques". The proof relied on was not
  printed in the source cited.
- **E13** and **E14** (misprints, arXiv only). The published text has "Deligne–Lusztig" correctly on
  p.1 and no misspelling in the introduction on p.3, which is consistent with the record's own
  statement that both are in the arXiv versions and not in the published one.

## What remains

The other 128 findings are **not** given verdicts here. Their quoted text is located as described
above, but the register should carry only what a reviewer has checked in substance, and these are
substantial: 89 misprints whose defect is a statement-level slip in surrounding mathematics, 32 gaps
and 11 errors, several resting on computations (E86's Gröbner bases over `F_101` and `F_1009`, E67's
alcove counterexample from Table 5, E57's `p ∈ {2h−2, 2h−1}` case). Sixteen of them — E101–E106,
E110–E112, E114, E116, E118–E120, E124, E132 — concern §6, the paper's own addendum to [LLHLM18], and
checking those needs [LLHLM18] itself as well; I read §6 on pp.128–133 and confirmed that each quoted
addendum item is printed there, but not that the recorded defect in it is right.

A next worker should take the findings in that order — §§2–5 first, then §6 with [LLHLM18] open — and
can rely on the structural work above as done.
