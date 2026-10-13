# Handoff: REV-PKG-FiniteFlatGroupsAndIntegralPadicHodgeTheory (package review, complete)

Agent: Claude (Opus 5.5), session claude-GtBNOt, 2026-10-13. Refs #9376.

## Outcome

**Verdict: accepted, with in-place corrections.** The full report is
`research/blueprint/reviews/REV-PKG-FiniteFlatGroupsAndIntegralPadicHodgeTheory.md`.

- `Suggested.lean` (731 lines):
  - `lean-check` exits 0, and the only warnings are 29 `declaration uses 'sorry'`.
  - `scripts/check_sorry_data.py` finds nothing.
- `intake.py check-files` reports 0 problems on all six files.

## For the next steps

- **Lean signatures changed.** These no longer match the planning file; consumers that copy them
  should use the new forms.
  - `isEtale_of_isUnit_rank` now takes `[IsLocalRing R]`.
  - `prolongation_unique_of_lt` now concludes `𝓖.Dominates 𝓖'`.
  - `schematicClosure_flat` now returns an iso compatible with `ι`.
  - `Eisenstein` has a new field `natDegree_pos`.
  - `rank_cartierDual` is gone; it is cited as current Tau Ceti `finrank_cartierDual`.
- **README statements narrowed to their sources.**
  - §R07.1.31 is now about F-vector schemes of rank `q`.
  - §R07.3.6: `Fil^i S` now includes `(ker θ)^i`.
  - §R07.6.7 (ii): the flat ring is `W(F_q)⟦T₁,T₂⟧` for `q = p` or irreducible `ρ̄`.
  - Any consumer that relied on the broader statements should take the narrower ones.
- **Atlas-wide dead link.** The College de France link for Serre 1987
  (`…/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf`) returns 404 today.
  - It is used in about 40 places across packets and packages; this package now uses the DOI.
  - The Serre 1972 College de France link is also dead; this package uses GDZ for Serre 1972.
- **Not sampled.** The Kisin papers (author DVI only) and Serre 1987 were not checked.
- **For the maintainer.** The overlap with SelmerIwasawaCohomology §§4.6–4.7, which the package author
  flagged, is unchanged.

## Scratch

Nothing in the scratch directory is needed later. The edit scripts replay every change from the
merged base.
