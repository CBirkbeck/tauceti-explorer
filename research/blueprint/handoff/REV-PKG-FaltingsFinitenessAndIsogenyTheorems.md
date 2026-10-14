# Handoff: REV-PKG-FaltingsFinitenessAndIsogenyTheorems

Completed issue #9214 by Codex, session `codex-gRdm3S`, 2026-10-14.
**Verdict: accepted after fixes.** No checkpoint or second job was taken.

The package README and Suggested.lean contain the fixes. The package review.json
records acceptance, and the independent review report records sources, pinned
signatures, definition checks and the complete adversarial pass. Metadata remains
`topic = "math.NT"`. No packets or other workers' files were changed.

The important repairs are the earlier polarization-descent dependency; spreading
generic maps before dense-open extension; explicit all-prime correspondence
compactification; fixed metric and degree normalization; nonnormal finite-index
averaging; monic characteristic versus reciprocal local polynomials; finite-flat
Zarhin graph descent in arbitrary characteristic; integral rather than rational
idempotents; signed Torelli descent; and a separability projector for reduction of
integral centralizers. Finite-field dimension and recovery companions explicitly
assume two is nonzero. Stable-lattice representatives are genuinely stable lattices;
the cyclic Hom statement has a nonzero generator with unique integer coefficients.
The report supplies the exact negative controls and source locators.

Ownership changes:

- Old R28.5.16 `mordell` is deleted as a target. HeightsRationalPointsAndObstructions
  RP.4 owns `RP.4/mordell-faltings` and the conditional Parshin implication.
  The detailed application is retained as a worked example, using R28.5.15.
- Old R28.6.8 Siegel remark is deleted as a section; RP.4 owns
  `RP.4/siegel-theorem`, cited in the scope boundary with Faltings Bemerkung 1.
- Tau Ceti `QuadraticMap.euler_four_squares` is cited as existing infrastructure.
  The retained variant is the matrix-transpose identity and alternating-form
  two-graph construction, not a second quadratic-map identity.
- Jacobians, their principal polarizations, general Arakelov infrastructure and
  field double-centralizer theory remain imports with explicit variant boundaries.

Renumbering: old R28.3.5 is now R28.1.12; the old R28.1.12 is R28.1.13;
old R28.3.6–R28.3.9 become R28.3.5–R28.3.8. The finished document has
60 numbered subsections and six layers. All dependent references were updated.

Current duplication baselines: TauCetiRoadmap
`0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. All nine newer roadmaps and
Completed were included. Elaboration pins: Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.

Validation: lean-check exited zero with 16 sorry warnings and no other warnings;
Suggested.lean is 295 lines with five real-bodied light definitions and no
sorry-defined data. Post-compilation Lean changes only update the closing inventory.
The independent arithmetic and linear-algebra computations, whitespace check and
intake check passed. The public 1984 erratum and deterministic random sample of 15
source sections were verified; Zarhin arXiv:2010.07995v5 supplies the all-characteristic
graph construction. No private book was copied or used as an uncleared source.
No source text, downloaded file or scratch-dependent artifact is committed.

Next step: take the accepted package through the upstream draft-PR lane. No
unfinished fix remains to resume. Heavy interfaces listed in the README are
formalization targets, not implemented Lean constructions. The review report's
public links and locators are sufficient to reproduce its source checks.
