# BP-ArithmeticGaloisDuality — handoff

Agent: Claude Code — cc-39fac3. Issue #675. First checkpoint, within the RS-08 boundaries, which
its review accepted.

## What is done

**R02.1 (partial).** The packet has 19 nodes:
- 4 constructions, 8 lemmas and 7 theorems;
- 17 API items and 12 unit tests;
- 4 planets;
- 4 baseline declarations;
- 4 requests and no gaps.

R02.1 covers:
- derived limits (lim, lim¹, Mittag-Leffler, the six-term sequence, the Milnor sequence);
- continuous cochains into inverse limits and their lifting along finite surjections;
- the comparison with Mathlib's `continuousCohomology`;
- Tate's inverse-limit theorem;
- continuous sections and long exact sequences;
- rationalisation;
- the discrete quotient V/T and the torsion of H¹(T);
- Harpaz–Wittenberg's pointwise-Hom and splitting-torsor interface, corrected (items 139–143 of
  their extraction).

R02.1 still needs completed tensor products of coefficients with exactness hypotheses.

**Not read:** R02.2–R02.6, D7 and D8. Their coverage records say what to read.

## Source finding

Harpaz–Wittenberg Lemma 5.5 is recorded with `known` = PAPER-HARPAZ-WITTENBERG-23/E10. It was
already in the register; it is not a new finding.

## Requests

Tau Ceti ProfiniteCohomology Layers 3, 4, 5 and 8. These are carried in `requests` with `neededBy`,
not as prerequisites.

## Lean

`research/blueprint/suggested/ArithmeticGaloisDuality.lean` compiles with exit 0; the only warnings
are `sorry` warnings. It was a single run of the pinned Lean v4.34.0-rc2 against the prebuilt Mathlib
at 082e2d3, with no lake.

The file implements towers with lim, lim¹ and the Mittag-Leffler predicate, the lifting and
compactness lemmas, Hom_pt with its topology, and the section torsor. The Milnor, Tate,
rationalisation and torsor-class statements on `continuousCohomology` are sketched in a comment
block: the tower of topological representations they quantify over is not yet a Mathlib object.

## Checks

- `scripts/check_blueprint.py` with the pinned index: 19 nodes, 0 errors, 0 warnings.
- `intake.py check-files`: 4 files, 0 problems.

## Sources

**Read:**
- Rubin, *Euler systems*, Appendix B §2 and I §2.
- The Stacks Project, tags 0594, 0598, 07KW, 07KX, 07KY.
- Harpaz–Wittenberg §5, from the author final version, whose hash matches the extraction.

**Not accessed:**
- Tate (1976), cited through Rubin;
- Jannsen, *Continuous étale cohomology*, which is the source for R02.2;
- Milne, *Arithmetic Duality Theorems*, which is free on the author's site and is the source for
  R02.4.
