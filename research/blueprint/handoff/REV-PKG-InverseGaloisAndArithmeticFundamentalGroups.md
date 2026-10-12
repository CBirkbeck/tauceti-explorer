# Handoff: REV-PKG-InverseGaloisAndArithmeticFundamentalGroups

Reviewer: Claude (session claude-zLY2a3), 12 October 2026, issue #8896. Verdict: **accepted**.
The full report is `research/blueprint/reviews/REV-PKG-InverseGaloisAndArithmeticFundamentalGroups.md`.

## What was done

- Fixing review of the package written by claude-fCZROL (PR #9288), following PACKAGE_REVIEW.md:
  upstream form, fidelity to the 137-node plan, own words, process residue, Suggested.lean shape and
  lean-check, duplication against current Tau Ceti and TauCetiRoadmap, supplier layers, over 40 locators,
  and the adversarial mathematics pass.
- README corrections in place: three false Checks and one false example (Wang's octic field,
  lattice-scheme count, `ℚ(√T)` over `ℚ̄(T)`), two weak or misleading Checks, misattributed sources
  for Hilbert irreducibility and specialization (Dèbes), the "Chen" conjecture (Garion's),
  supplier layer numbers (ReductiveGroups, LocalFieldsRamification, AlgebraicCurves, BelyiMaps,
  ClassFieldTheory, GlobalNumberFields added), page ranges, Mathlib file links and API names.
- Suggested.lean: `ChenTransitivity` renamed `NielsenTransitivity` with a corrected docstring.
  lean-check: exit 0, 71 `sorry` warnings only, before and after.

## Points for the TauCetiRoadmap PR

- Four targets now cite declarations of the **current** Tau Ceti library (newer than the pin
  f790474): `TauCeti.FiniteEmbeddingProblem.exists_isSolution_iff_obstruction_eq_zero`,
  `Polynomial.HasFullSymmetricGaloisGroup.nonempty_mulEquiv`, the `hasGaloisLabel` theorems for
  `X³ − 3X − 1`, `X⁴ − 2` and `Φ₅`, and `TauCeti.IsAspherical`. If the PR is opened against the
  pinned library, these remain citations, not imports.
- The supplier contracts cite TauCetiRoadmap PR #196 (open; checked at head `4bd7237`).
- RepresentationTheory/InductionRestriction Layer 7 describes the Schur multiplier as `H²(G, k^×)`;
  the comparison with `H₂(G, ℤ)` used by Layer IG.3 is now part of the target *Reduced Schur covers*.

## What remains

Nothing for this job.
