# Handoff — REV-PKG-SmallRamificationAndAbelianVarietyBaseCases~2

Issue #7941; Codex, session `codex-6uQXUX`; 2026-10-09.
Completed independent fixing review. Verdict **accepted**. No remaining work
for this job. The package is ready for the maintainer's upstream draft PR.

Read the [review report](../reviews/REV-PKG-SmallRamificationAndAbelianVarietyBaseCases~2.md)
for the 15-source sample, every-target adversarial table and exact checks.
The accepted packet was unchanged. The package now follows current upstream
README and Lean form and keeps all mathematical statements/tests, with supplied
duplicates cited as boundaries.

Corrections: kernel-field finiteness/discreteness, continuity hypotheses retained
by Lean, both prime facts retained in Schoof APIs, and nonzero simplicity.
Concrete sign/conjugation/Jordan and scale checks added. The earlier revision's
actual SL₂ conjugacy and three field-degree companions are intact. The three
actual residual examples remain concrete; the three missing integral/Hecke
examples are honestly omitted by exact object and supplier interface.

Duplication removals:

- Arbitrary local different/index/ramification functions were removed. Current
  native suppliers are `TauCeti.differentExponent`, `TauCeti.ramificationIndex`,
  `TauCeti.LocalFieldsRamification.lowerRamificationGroup`, and the general bound
  in `NumberTheory/LocalField/Different/Wild.lean`.
- Dyadic square threshold/sharpness/critical obstruction are current
  `NumberTheory/LocalField/Squares.lean` and LocalFieldsRamification inputs;
  kept power-map targets concern cubes in residue characteristic three.
- The quadratic p=3 class number is Mathlib `IsCyclotomicExtension.Rat.three_pid`
  plus `NumberField.classNumber_eq_one_iff`; kept certificate has six primes.

No upward dependency or ownership move was needed. The current upstream and
library checkouts were read only. Faber arXiv:1112.1999v1, Theorems B–C p. 3
and Theorem 6.1 p. 16 now directly supports projective subgroup classification;
the central GL₂ factor is derived explicitly. The published Khare–Wintenberger
Theorem 5.4 p. 247 exception at eleven is retained.

Validation: package lean-check exit 0 at Mathlib 082e2d3 / Tau Ceti f790474,
106 declaration-uses-sorry warnings only. Separate ten-signature audit exit 0.
Packet checker zero errors/warnings, intake checker zero problems, whitespace
check clean. Numerical exploration checks all ten degree margins and both
integral ceilings; it is not used as a rational proof certificate.

Implementation must use the closing Lean comment as its exact omission list:
compatible local valuations/completions; semistable integral torsion; Tate
modules and coefficient actions; p-adic Hodge/weight/system interfaces; the
specified twisted group, integral J₀(11)[2], and J₀(23) Hecke action. Do not
restore arbitrary invariant data, anonymous example existences or a partial
`baseCases_holds`. Scratch evidence was transient; all reusable conclusions
are recorded here and in the report. Stop after this job's PR.
