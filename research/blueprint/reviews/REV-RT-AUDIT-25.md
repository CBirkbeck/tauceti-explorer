# REV-RT-AUDIT-25 — independent verification

Codex — codex-hjdg0j · 2026-09-24 · Refs #1599

Complete: the sole finding, RT-AUDIT-25/1 (medium), is confirmed. [Machine-readable verdict](../redteam/RT-AUDIT-25.review.json).

## Scope and independence

I did none of AUDIT-25, REV-AUDIT-25 or RT-AUDIT-25. The red-team worker is Codex / codex-c83e7a, distinct from this session. Bot reply 5808033857 confirmed claim comment 5808032312; I reread the full issue afterward.

Explorer baseline: `e914a726fdca16f08c95cc04653de892209984a2`. Mathlib pin: `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti pin: `f790474821cf4256814db967cb154e7af3d0c369`. I read the finding, the affected audit row and its reviewed coverage projection, the HE.0 contract, and the relevant pinned declarations with their hypotheses and notation. This verifies the single finding, not the red team's other 234-target checks.

## Evidence

The accepted [AUDIT-25](https://github.com/CBirkbeck/tauceti-explorer/blob/e914a726fdca16f08c95cc04653de892209984a2/research/blueprint/audit/AUDIT-25.result.json) marks HE.0 target index 6 absent and cites `NumberField.Units.torsion` as related evidence. Its note then makes a blanket claim that imaginary-quadratic-order unit computations are unavailable. The reviewed coverage projection repeats that note. [HE.0](https://github.com/CBirkbeck/tauceti-explorer/blob/e914a726fdca16f08c95cc04653de892209984a2/content/campaign/HeegnerPointEulerSystems/README.md#L12) explicitly needs exceptional unit indices for conductor changes and separate treatment of small discriminants, without dividing by unit-group orders in integral statements. A proved exceptional case is therefore relevant.

[`IsCyclotomicExtension.Rat.Three.Units.mem`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/Cyclotomic/Three.lean#L51) proves

```text
u ∈ [1, -1, η, -η, η ^ 2, -η ^ 2]
```

for every `u : (𝓞 K)ˣ`. The context is a field `K`, `[NumberField K]`, `[IsCyclotomicExtension {3} ℚ K]` and `hζ : IsPrimitiveRoot ζ 3`. The [local notation](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/Cyclotomic/Three.lean#L38) defines `η` using the unit of `hζ.toInteger`; it is not a hypothetical unit-group parameter. The proof reduces the number-field unit group to rank zero and then enumerates the powers and negative powers of the primitive root. The actual carrier is the units of the ring of integers, hence the maximal order.

The discriminant identification does not need a new CM theorem. [`IsCyclotomicExtension.Rat.discr_prime`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/Cyclotomic/Basic.lean#L651), with prime `p`, a characteristic-zero field and the indicated cyclotomic extension, gives

```text
NumberField.discr K = (-1) ^ ((p - 1) / 2) * p ^ (p - 2).
```

At `p = 3` this is `-3`. I also read the [general cyclotomic discriminant formula](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/Cyclotomic/Basic.lean#L667) already cited elsewhere in the audit; it agrees. These are number-field discriminants, not merely the discriminant of an arbitrarily chosen power basis.

The finding's additional [`eq_one_or_neg_one_of_unit_of_congruent`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/Cyclotomic/Three.lean#L100) is also present. With `λ = hζ.toInteger - 1`, it assumes `∃ n : ℤ, λ² ∣ (u - n : 𝓞 K)` and concludes `u = 1 ∨ u = -1`. Its proof converts this to the corresponding divisibility by 3. This is a congruence refinement, not a Heegner formula.

By contrast, [`NumberField.Units.torsion`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/Units/Basic.lean#L146) defines the torsion subgroup of `(𝓞 K)ˣ`; that definition alone does not enumerate these units. The newly identified theorem corrects the note's substantive coverage boundary.

## Repair and limits

Add `IsCyclotomicExtension.Rat.Three.Units.mem`, Mathlib, `Mathlib/NumberTheory/NumberField/Cyclotomic/Three.lean`, line 51, with `fit: "special case"`, and replace the blanket absence note with the precise maximal-order third-cyclotomic computation. Keep `NumberField.Units.torsion` as related evidence.

Retain the full exceptional-discriminant Heegner target's `absent` label and HE.0's `partly built` verdict. The cited theorem does not construct arbitrary-conductor orders, their unit indices, conductor-change degree formulas or CM/Heegner relations, and it does not justify division by those indices in integral arguments. Describe the other exceptional case as **not established by this citation**; this review does not claim it is absent throughout both libraries. No roadmap reconstruction or extra mathematical target follows from the finding.

## Validation

All three inspected Mathlib files matched the pinned Git tree. In particular, `Three.lean` has Git blob `05905ab52395a37da0507069d1dba3f1ebd96773`, matching the finding. The declaration index locates `Units.mem` at line 51, independently confirmed in the source. The discriminant specialization was checked directly.

PASS: red-team result and review checkers; two-file intake with zero problems. All 11 input guards matched fresh main `470336c5e85deb65341ede42881e2798f13a6e4f`, both deliverables were absent there, and the bot-confirmed claim still belongs to this worker. Only the two issue deliverables change. No Lean file was changed or compiled, and no new formalization is claimed.
