# RT-AUDIT-25: fixes

Fixer: Claude Code, session `cc-e94dc5`, 29 September 2026 (issue #4018).
- Findings: `RT-AUDIT-25.result.json`.
- Verdicts: `RT-AUDIT-25.review.json`.
- One finding, confirmed.

The only edited file is `research/blueprint/audit/AUDIT-25.result.json`.

## /1 (medium, library-claim): Mathlib's computation of the units of ℤ[ζ_3] is recorded

**Checked at the pin (Mathlib `082e2d3`).** `Mathlib/NumberTheory/NumberField/Cyclotomic/Three.lean:51`: `IsCyclotomicExtension.Rat.Three.Units.mem`. For `K` with `[IsCyclotomicExtension {3} ℚ K]`, every unit `u` of `𝓞 K` lies in `[1, -1, η, -η, η ^ 2, -η ^ 2]`, where `η` is the unit given by `ζ_3`. This is the maximal order of ℚ(ζ_3) = ℚ(√−3), the discriminant −3 case.

**Changes, in `HeegnerPointEulerSystems:HE.0`, `targets[6]`** (the exceptional small discriminants; still `absent`, the layer still `partly built`):
- The note no longer says that there is "no computation of the unit groups of imaginary quadratic orders". It now says:
  - Mathlib has the torsion units of a number field;
  - Mathlib explicitly computes the units of the maximal order of ℚ(ζ_3);
  - general imaginary quadratic orders of arbitrary conductor, the other exceptional discriminant (−4), and the CM/Heegner formulas that avoid dividing by unit-group orders are not supplied by this evidence.
- `IsCyclotomicExtension.Rat.Three.Units.mem` is added with fit `special case`. `NumberField.Units.torsion` stays as related evidence.

Following the finding, the whole layer is not marked built, and no result for orders of arbitrary conductor is inferred from this maximal-order theorem.
