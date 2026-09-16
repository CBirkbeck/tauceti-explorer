# Review of AUDIT-04

**Job** REV-AUDIT-04 · **Date** 2026-09-16 · **Verdict `accepted`** · **48 corrections**

Baseline: tauceti `f790474`, mathlib `082e2d3`.

Scope: the five roadmaps of `research/blueprint/audit/AUDIT-04.json`: GlobalNumberFields,
GlobalQuadraticForms, LocalFieldsRamification, Multiquadratic and NumberFieldArithmetic. That is 39
layers, 244 targets, 615 declaration citations and 75 duplicate claims. The audit is careful and
mostly right, but it has a recurring weakness: several "absent" claims come from searching only one
library, or only one name. Every error could be fixed in place.

## What was checked

**Every citation, mechanically.** All 615 citations were resolved in the pinned baseline, and no
cited file contains a `sorry` token. At the pin Tau Ceti has no `sorry` in any proof and declares
no axiom. The following problems were found:

- **Wrong instance names (2).** Lean auto-names the anonymous instances
  `instIsNonarchimedeanLocalFieldPadic` and
  `IsNonarchimedeanLocalField.instCompactSpaceSubtypeMemSubringIntegerValueGroupWithZeroValuation`,
  checked with `#synth`. The audit cited `Padic.instIsNonarchimedeanLocalField` and
  `…instCompactSpaceInteger`, which do not exist.
- **Wrong line or file (7).** `ValuationSubring.algebra` (18 → 58), `AlgHom.IsArithFrobAt`
  (29 → 54) and `IsArithFrobAt.exists_of_isInvariant` (45 → 221, cited twice). `Ideal.inertia` was
  cited three times at `Invariant/Basic.lean:539`, which is `inertia_quotient`; it is at
  `Ideal/Defs.lean:154`.
- **Missing from the index but real.** `unitLattice_rank`, `finrank_modTorsion`, `fundSystem` and
  `sigPos` are absent from `declarations.tsv` but exist at the cited lines.

After correction there are 639 citations, all at the exact file and line and at most five per
target. The 40 declarations that were newly cited, renamed or relocated, and 8 more that the new
notes name, were checked in Lean against the pinned Mathlib and a byte-identical Tau Ceti build. All
exist, and their axioms are only `propext`, `Classical.choice` and `Quot.sound`. The one exception,
`autCandidateGenusFieldRealEquivElementaryTwoQuotient`, is in a module not built there and was read
at source.

**The `built` verdicts.** GlobalNumberFields 1 and Multiquadratic 0–3 are confirmed target by
target, including the real-quadratic `Gal(K_gen/K) ≅ Cl(K)/Cl(K)²`
(`autCandidateGenusFieldRealEquivElementaryTwoQuotient`), which the audit had not cited.
**NumberFieldArithmetic 4 is not built.** The audit's own notes admit that `relDiscr_localization`
and the `artinHomAway_ramifiedSupport` adapter are missing. It is now `partly built`. No layer is
`process`.

**The absent and partial claims.** All 151 were searched again by name, by Mathlib naming
convention and by keyword, over the index and both source trees. Five absence claims were wrong:

| Layer · target | Audit said | In the baseline |
|---|---|---|
| GlobalNumberFields 10 · cyclotomic arithmetic | splitting law for ℚ(ζₙ) "not stated anywhere" | Mathlib `NumberField/Cyclotomic/Ideal.lean`: `inertiaDegIn_eq_of_not_dvd` (f = ord_m p), `ramificationIdxIn_eq_of_prime_pow`, and the general `inertiaDegIn_eq` / `ramificationIdxIn_eq`. Only the conductor normalization (ℚ(ζ₆)=ℚ(ζ₃)) is missing |
| GlobalNumberFields 11 · `Pic O` | absent; `ClassGroup` is the maximal-order special case | Mathlib's `ClassGroup R` is defined for every domain, so `ClassGroup O` is the layer's `Pic O`. Mathlib also has `ClassGroup.equivPic`, `CommRing.Pic` and `Pic.mapRingHom`. Now `partial` |
| LocalFieldsRamification 1, 4 · pro-p supplier | "no `IsProP`, no `IsProPSylow`, no `exists_isProPSylow` in either library" | Tau Ceti `Topology/Algebra/Group/Profinite/{ProP,Sylow}`: `IsProP`, `IsProPSylow`, `exists_isProPSylow`, `IsProP.exists_le_isProPSylow`, `IsProPSylow.eq_of_normal`. Three of the four Sylow declarations the layer consumes exist |
| NumberFieldArithmetic 5.7 · integer-ring map | absent, "neither the restricted map nor any instance" | Tau Ceti `adicCompletionIntegersExtension`, with well-definedness and maximal-ideal contraction. Now `partial`; the algebra-instance package is still missing |
| NumberFieldArithmetic 2.7 · `complexConjugationAt` | stabilizer membership and uniqueness absent (only CM) | Mathlib, for any Galois extension: `exists_isConj_of_isRamified`, `mem_stabilizer_mk_iff`, `IsConj.coe_stabilizer_mk` (stabilizer = {1, σ}) |

Seven presence claims overstated what exists, and each is now `partial`:

- **NumberFieldArithmetic 1.1.** The decomposition-group criterion is proved only over ℚ.
- **NumberFieldArithmetic 3.6.** There is no converse of `irreducible_map_of_irreducible_minpoly`.
- **NumberFieldArithmetic 4.2.** `relDiscr_localization` is not stated, although every step exists:
  `Algebra.trace_localization`, Tau Ceti `map_differentIdeal_eq_differentIdeal` and
  `Ideal.spanIntNorm_localization`.
- **NumberFieldArithmetic 4.3.** The adapter and the tower monotonicity are missing.
- **NumberFieldArithmetic 5.2.** There is no `Module.Finite`.
- **NumberFieldArithmetic 7.2.** The splitting law for 2 by `d mod 8` is missing:
  `ncard_primesOver_quadratic_iff` assumes `p ≠ 2`.
- **GlobalQuadraticForms 1.1.** Base change along two representatives of a real place is missing.

The load-bearing absences hold. There is no Hilbert symbol, Hasse invariant, Witt ring or
Hasse–Minkowski theorem. There is no local compactness or cocompactness of adeles, no strong
approximation and no idele norm. There are no Hecke characters or infinity types. There is no
power-saving lattice count and no local ramification filtration, Herbrand function or Hasse–Arf.

Other entries were completed:

- Tau Ceti's function-field `Place.ramificationGroup` and `ker_ramificationResidueHom`, as related
  to the local lower filtration.
- Mathlib's `spectralNorm.normedField` and `spectralNorm_unique_field_norm_ext`.
- The field-generic `squareClass_of_sq_mem`, in place of the ℚ-only `squareClass_of_sqrt_mem`.
- `valuation_liesOver`, the non-deprecated `sum_ramification_inertia_eq_finrank`, and
  `galEquivZMod_stabilizer`.

The four roadmap summaries were brought in line with the corrected entries.

**The duplicates.** All 75 resolve to atlas stages, and none points at the retired
`FoundationsAndLibraryIntegration`. Changes:

- **One wrong stage.** GlobalNumberFields 3 cited `GeometryOfNumbersAndQuadraticArithmetic:GN.2`,
  which is quadratic-form local-global theory. It is replaced by `GN.4`, *Lattice points and
  homogeneous dynamics*.
- **Two notes corrected.** GlobalQuadraticForms 4 consumes weak approximation rather than
  restating it. AlgebraicCurves 1 defers the product formula to its Layer 3.
- **Eight overlaps added:**
  - `FunctionFieldArithmetic:FA.2`, for GlobalNumberFields 5 and 6: function-field adeles, their
    cocompactness and the compact degree-zero idele class group.
  - `HeegnerPointEulerSystems:HE.0`, for GlobalNumberFields 11: `Pic(O_c)` and conductor change.
  - AlgebraicCurves Layer 8, for LocalFieldsRamification 3 (function-field `G_i` and Hilbert's
    different formula, with a scope wall naming this roadmap) and NumberFieldArithmetic 1.5
    (composita).
  - ClassFieldTheory Layer 9, for LocalFieldsRamification 4: it imports inertia and
    `1 → I_K → G_K → Ẑ → 1` by name.
  - Chebotarev Layer 4, for NumberFieldArithmetic 2.6: the cyclotomic Frobenius formula.
  - PolynomialGaloisGroups Layer 5, for NumberFieldArithmetic 3.9–3.10: it names
    `exists_gal_fullCycleType_eq_factorizationType`.

Left unchanged: a few cited declarations are `private`, for example `exists_mixed_approximation`.
In each case a public exact declaration is cited beside them.

## Most important finding

**The audit twice declared absent, in Mathlib and Tau Ceti alike, results that one of the
libraries already proves.** The splitting and ramification law for cyclotomic fields, which the
audit called "not stated anywhere", is a complete Mathlib file (`NumberField/Cyclotomic/Ideal.lean`).
The pro-p Sylow theory, which the audit said the Local Fields roadmap "has nothing to check against",
is sorry-free in Tau Ceti. In the other direction it marked NumberFieldArithmetic Layer 4 `built`
while its own notes listed missing milestones. Later batches should grep both source trees under
the target's concept name before writing "absent". The phrases "not stated anywhere" and "in either
library" should be backed by that search, and a `built` verdict should never coexist with a note
that says "not found".
