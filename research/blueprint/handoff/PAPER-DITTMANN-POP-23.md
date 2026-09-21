# PAPER-DITTMANN-POP-23 handoff

Codex `codex-a71f92`, issue #1099, 21 September 2026.
Partial checkpoint; no claim that the roadmap or a Lean implementation is complete.

## Done

Read all 19 pages of Dittmann–Pop arXiv:2012.01307v2 and the selected original
inputs recorded with hashes in the result. Extracted 116 items, 40
definitions/constructions with 120 API and 120 test contracts, and six
acyclic routes. Ten actual library inputs and five planned imports are
separated from 101 missing items, each routed once. Reused patch compactness,
function-field discreteness/place dictionaries, approximation and prescribed
poles. Checked live supplier stages, current L5 decomposition and reserved IDs.
The paper checker and finite/structural regressions passed.

## Resume here

1. G1–G2: original Jannsen/KS/Suwa Hasse–Gersten chain, completed/henselian
   comparison, characteristic-two dimension≤3 use of Cossart–Piltant, and
   ILO Exposé X Theorem2.4's exact degree/base-extension hypotheses.
   PAPER-JANNSEN-16 is already queued; do not request it twice.
2. G3: EKM subform/cancellation and Kato's quadratic-Witt comparison;
   coefficient-field/cohomology-continuity/real-place descent inputs;
   Kuhlmann–Novacoski Theorem1.2 proof (only its statement was read).
3. G4: original Rumely and Pop low-dimensional formulas, Poonen's earlier
   elliptic/arithmetic inputs, AKNS §3.1 and coding lemmas. Verify the
   dimension-one/two bi-interpretability reduction, not only single axioms.
4. G5: finish exact library/supplier matching for number-field strong
   approximation off a finite place and general Krull-domain/inseparable
   normalization/prolongation interfaces. Function-field approximation is
   already built; never duplicate it.
5. G6: independently check the full-rank flag repair in §5 and the total-
   inverse finite-language QFA bridge; retain the torus condition in the
   residue specialization.
6. G7: if obtainable, collate the published typeset paper against the final
   author version; revalidate proposed Part II ownership on current main.

## Guardrails

Use b_a=UNION of balls and O_a=INTERSECTION of rings. Empty V_a yields O_a=K
and must be rejected. Characteristic two uses a quadratic last Pfister
factor, not an all-diagonal form. Non-dyadic includes equal characteristic
two. All auxiliary adjunctions are root fields, possibly trivial.
The general resolution assumption applies only in characteristic two and
dimension greater than three. Finitely generated as a field is not
finitely generated as a ring.

## Deliverables and checks

Only the result, report and this handoff are submitted. Re-run
`python3 scripts/check_paper.py research/blueprint/papers/PAPER-DITTMANN-POP-23.result.json`
after changes. No Lean file was required or compiled. JSON tests are
planning contracts, not assertions that a formal test suite has passed.
The report describes the finite scratch regressions in reproducible terms.
