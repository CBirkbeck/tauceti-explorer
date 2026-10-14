# REV-PKG-SieveMethodsAndPrimePatterns handoff

Issue #9240. Independent reviewer: Claude (Opus 5.5), session `claude-0KXWey`, 2026-10-14. This is
a completed package review with verdict **accepted after corrections**, not a checkpoint. No second
job was taken, and the accepted packet is unchanged.

The full record is in [the review report](../reviews/REV-PKG-SieveMethodsAndPrimePatterns.md):
- the six criteria;
- more than fifty locators checked against public copies;
- the supplier and duplication audits;
- the adversarial-pass table;
- every change.

The machine verdict is in [review.json](../packages/SieveMethodsAndPrimePatterns/review.json).

What changed:
- The README is regrouped into subsections whose titles say what they hold. No title repeats, and
  all 224 targets are kept in dependency order.
- Repeated standing hypotheses are stated once per subsection.
- The prose is cleaned, and the process residue is removed.
- Locators are fixed in Kedlaya Ch. 15, the Heath-Brown sieve lectures §§2–4, Heath-Brown 1995,
  Khayutin and Koymans–Milovic, and the dead Jutila link is replaced.
- The supplier contracts now say plainly which plan-level requests their owners do not yet state.
- In `Suggested.lean`, one false unit test (`discrepancy 10 3`, value 1, not 1/2) is corrected.

Validation:
- `lean-check` exits 0 with 101 `sorry` warnings only, at the pins Mathlib
  `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
  `f790474821cf4256814db967cb154e7af3d0c369`.
- All 199 Mathlib names cited by the README elaborate at the pin.
- The intake file check reports 0 problems.

Current-library comparison: TauCetiRoadmap main and Tau Ceti `a91d3aaf`.

For the maintainer, before a draft PR:
1. Three plan-level requests are not met by their owners' current plans:
   - GeometryOfNumbersAndQuadraticArithmetic Layer 4: the curvature-uniform planar lattice-point
     estimate, sliced-domain counts and the codimension-two count;
   - AdditiveCombinatorics AC.1: the BGS squarefree sum-product theorem and the SL₂ flattening
     input;
   - AdelicAlgebraicGroups Layer 4: strong approximation for a finitely generated Zariski-dense
     subgroup.

   They are carried as explicit hypotheses. Send them to their owners or move the notions down;
   either needs a plan change.
2. This roadmap is outside the CaraianiNewton order. Its atlas suppliers AnalyticNumberTheory,
   FiniteFieldsAndCharacterSums, AdditiveCombinatorics, ExponentialSumsAndCircleMethod and
   GeometryOfNumbersAndQuadraticArithmetic are not yet Tau Ceti roadmaps.

All sources used were public; no restricted book was used. The scratch downloads and scripts are
disposable, because every result needed to continue is in the report.
