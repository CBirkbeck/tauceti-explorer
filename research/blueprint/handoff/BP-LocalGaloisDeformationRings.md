# BP-LocalGaloisDeformationRings: R08.1 (first checkpoint)

Claude Code — session `cc-39fac3`, 28 September 2026. Refs #770. **Status: partial.**
- R08.1 is `source_decomposed`.
- L7, L8 and R08.2–R08.6 are `not_read`.

This works within RS-08, whose review accepted it.

## What is planned

There are 7 nodes (5 theorems, 2 lemmas) and 3 planets:
- `local-lifting-ring`;
- `local-tangent-obstruction`, the dimension bound from local duality and the Euler characteristic;
- `local-fixed-determinant`;
- `local-forget-framing`;
- `archimedean-rings-p-odd`;
- `archimedean-odd-ring-p2`, the explicit ring 𝒪[[a, b, c]]/(a² + bc − 1), matching KW II Proposition 3.3 as quoted by Tung;
- `local-residue-field-change`.

The generic functors and theorems are reused from the GlobalGaloisDeformations packet (#3804, merged), per RS-08.

**Requests:**
- Tau Ceti ClassFieldTheory Layer 5: local Tate duality and the local Euler characteristic.
- DeformationAndDerivedPatchingAlgebra R03.2: relations versus obstructions.
- DeformationAndDerivedPatchingAlgebra R03.1: completed tensor products.

## Suggested Lean file

`suggested/LocalGaloisDeformationRings.lean` imports Mathlib only. It compiles against the pinned Mathlib 082e2d3 oleans with 0 errors and 3 `sorry` warnings. Its two matrix examples are proved by `simp`.

The ring-level signatures, which use the GlobalGaloisDeformations functors, are in a comment block.

## Checks

- `check_blueprint.py` with the pinned index, and with the merged GlobalGaloisDeformations packet present: 0 errors, 0 warnings.
- `intake.py check-files`: see the PR.

## What a continuation should do

1. **R08.2 (ℓ ≠ p):**
   - the unrestricted rings: flat, reduced, complete intersection of relative dimension n² (Shotton, arXiv; BLGGT Lemma 1.3.4 via Tung Lemma 3.2.8);
   - inertial-type components;
   - Steinberg and minimally ramified conditions.
2. **R08.3:** potentially semistable rings (Kisin, "Potentially semi-stable deformation rings", on arXiv or the author's page).
3. **R08.4–R08.6, L7 and L8.**

## Sources read

- Gee, arXiv:2202.05818v2, §3.1–3.19.
- Kisin, Lecture 1.
- Tung, arXiv:1908.06174v3, §3.2.5.
