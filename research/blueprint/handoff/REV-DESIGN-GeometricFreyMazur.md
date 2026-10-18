# REV-DESIGN-GeometricFreyMazur handoff

Reviewer: Claude, session claude-ftr875 (issue #1725). The review is complete: the packet is `accepted`, and the full account is in `research/blueprint/reviews/REV-DESIGN-GeometricFreyMazur.md`.

## Files changed

- The packet, the roadmap definition and the suggested Lean file of GeometricFreyMazur.
- The review report.

## For the next worker

- **Reader not re-rendered.** The reader `research/blueprint/readmes/GeometricFreyMazur.md` was not a file of this job and still shows the design's text: the generic Source lines, the old prerequisites and the old GF.9 descent route. The report's section "Reader document" lists what to re-render.
- **GF.9 descent route.** It no longer uses full SL₂ image. Hecke containment gives f[p]=λΨ, and σ(f)=±f with p odd forces σ(f)=f. GF.8 keeps the full-monodromy theorems as targets of its own.
- **ModularCurvesPartII duplicates.**
  - GF.0/projective-frames is now an adapter on ModularCurvesPartII:R13.4a/projective-scalar-coarse-quotient.
  - GF.0/hecke-loci takes T_m and its degrees from ModularCurvesPartII:R14.1/projective-boundary-hecke-and-degree.
- **Requests to HyperbolicCurveVolumesAndGonality.** Three requests go to HV, whose own review is `needs_changes`. Its revision should honour them and keep the cited node ids:
  - HV.0: half-plane trigonometry;
  - HV.4: the point-ball comparison;
  - HV.6: gonality domination.
- **New source finding E22** (erratum Proposition 4.2): it is recorded in the packet with a confirmed verdict.

## Checks

- `scripts/check_blueprint.py` with the pinned declaration index: 0 errors, 0 warnings.
- `intake.py check-files`: 0 problems.
- `lean-check`: exit 0, 38 placeholder-proof warnings only.
- In-memory atlas assembly with the packet promoted: builds, with no skipped links.

## Scratch

The scratch scripts (`apply.py` rebuilds the packet from `git show HEAD:`) are not kept, and nothing in them is needed to continue.
