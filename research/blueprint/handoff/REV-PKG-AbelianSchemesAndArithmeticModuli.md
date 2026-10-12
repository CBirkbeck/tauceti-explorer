# REV-PKG-AbelianSchemesAndArithmeticModuli — handoff

Issue [#8893](https://github.com/CBirkbeck/tauceti-explorer/issues/8893). Agent: Claude (Opus 5.5), session
**claude-fiVDgX**, branch **claude-fiVDgX-rev-pkg-abelian-schemes**. The bot confirmed the claim on 2026-10-12. This
is the complete review job, not a checkpoint. The verdict is **accepted**, with the corrections applied in the package.

## Deliverables

- `research/blueprint/packages/AbelianSchemesAndArithmeticModuli/README.md` (corrected in place)
- `research/blueprint/packages/AbelianSchemesAndArithmeticModuli/Suggested.lean` (corrected in place)
- `research/blueprint/packages/AbelianSchemesAndArithmeticModuli/metadata.toml` (unchanged, `math.AG`)
- `research/blueprint/packages/AbelianSchemesAndArithmeticModuli/review.json`
- `research/blueprint/reviews/REV-PKG-AbelianSchemesAndArithmeticModuli.md`, the full report, which has the
  locator table and the adversarial-pass table

## Checks run

- `lean-check` on `Suggested.lean`, before and after the edits: exit 0, 41 `declaration uses 'sorry'` warnings and
  nothing else, at Mathlib 082e2d37e8 and Tau Ceti f790474.
- `python3 research/blueprint/intake.py check-files` on the deliverables: 0 problems.
- A 9-word shingle own-words check against all downloaded sources: only titles and stock phrases match.
- A Lean↔README name alignment script: every declaration is named in the README.

## Removals for duplication (for the maintainer)

- **Riemann forms:** the planned `RiemannForm` structure is the same object as current Tau Ceti's
  `TauCeti.AlmostComplexStructure.IsRiemannForm` (`Geometry/Hodge/WeightOne/RiemannForm`).
  - The structure was removed from `Suggested.lean`.
  - README A5.2 now builds on the Tau Ceti predicate. It keeps the Hermitian form, principality, scaling, pullback
    and the homological weight `−1` adapter.
  - A5.5 and A5.7 cite `latticeHodgeStructureEquiv` and `isRiemannForm_iff_isPolarization`.
- **Kept variants**, each now stating how it differs from Tau Ceti:
  - `IsAbelianIsogeny` against pinned `TauCeti.GroupScheme.IsIsogeny`, which covers group schemes over `Spec R`.
  - A5.4(1) against the current symplectic-basis theorem over a field.

## Points for the maintainer

- AlgebraicModuli package README (`picard_zero_criterion` paragraph): it refers to §7.8 for the algebraic-space
  neutral component. The construction is in §7.9 (`spaceSectionComponentCriterion`).
- ModularCurves 2D (upstream) calls `P ↦ O([P] − [0])` the canonical principal polarisation. That map is
  `−φ_{O(0)}`. This roadmap pins the Mumford sign and records the comparison at A0.2(3).
- Milne's *Abelian Varieties* (2008), Proposition 14.4(b), states level rigidity on the points `A_n(k^al)` for every
  `n ≥ 3`, and that form is false when the characteristic divides `n`. A6.18 now states the group-scheme form and
  records the restriction.

Nothing remains open for this job.
