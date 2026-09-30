# REV-RT-LINK-tauceti_Completed_EffectiveBounds

Independent verification of the red-team result `RT-LINK-tauceti_Completed_EffectiveBounds`
on the link map of **Effective arithmetic bounds and geometry of numbers**
(`tauceti:Completed/EffectiveBounds`). Reviewer: Claude Code, session `cc-c2c06b`,
30 September 2026, at repository revision `561b3632`. Issue #4356.

**The red team reports no findings**, so there is nothing to confirm or reject, and
`RT-LINK-tauceti_Completed_EffectiveBounds.review.json` carries an empty `findings` list.

A clean result is still a claim, so I tested its `checked` list. **Every claim I tested
holds.** I also tried two leads of my own. Neither establishes a missing link, so I record
no new observation.

## Independence

I did none of the three jobs this review must avoid: the link map (ChatGPT Pro,
`cgp-a70a276fbaff`), its review (Codex, `codex-hjdg0j`) and the red team (Codex,
`codex-rtOQ9t`).

## What I tested

**The target is the one the red team read.** The link map's SHA-256 at `561b3632` is
`a1493c80…8805`. That is the red team's recorded target hash, and it is also the hash of
the file at the red team's revision `9cabc408`. The map has not changed since the red team
read it.

**The quotations.** Six of the seven evidence quotes are literal substrings of their stage
descriptions in `data/atlas.json`. The seventh, "(shared with the effective-bounds
roadmap).", is not in the Multiquadratic Layer 2 description. It is on line 26 of
`content/tau-ceti/Multiquadratic/README.md`, the roadmap's migration list, where it
qualifies `units_sq_index_le` and `index_powMonoidHom_two_le_of_closure`. PROTOCOL.md
section 10 allows a quote from the roadmap's document, so the red team is right to accept
it.

**The pinned declarations.** The five cited files have the blob hashes the link map
records, at Tau Ceti `f790474` and Mathlib `082e2d3`. I read each statement at the pins,
and each line number the red team gives is exact:

| Declaration | Where | What it says |
| --- | --- | --- |
| `NumberField.units_sq_index_le` | `EffectiveBounds/UnitSquares/Basic.lean:62` | `(Subgroup.square (𝓞 F)ˣ).index ≤ 2 ^ finrank ℚ F` for every number field `F`. This bounds integral units only, not `F^×/F^×2`. |
| `finite_and_ncard_le_of_subset_box_of_separated` | `GeometryOfNumbers/Doubling.lean:186` | Assumes `0 < r i`, `0 < ε ≤ c`, `S ⊆ box r c`, and strict separation `ε * r i < ‖x i - y i‖` in some coordinate. Concludes `S` is finite with `#S ≤ (4c/ε)^(2#ι)`. |
| `ncard_inter_box_two_le_pow_mul_ncard_inter_box_one` | `Doubling.lean:343` | Takes finiteness of `Λ ∩ box r 2` as a hypothesis. The constant is `49^#ι`. |
| `ncard_setOf_finiteDimensional_abs_discr_le_le` | `EffectiveBounds/HermiteCount/Basic.lean:172` | Counts finite-dimensional intermediate fields of a characteristic-zero `A` with `|discr| ≤ N`, bounded by `(2C+1)^(D+1)·D`. The generating step is at `:139`. |
| `regulator_eq_one_of_rank_eq_zero`, `one_le_regulator_of_rank_eq_zero` | `EffectiveBounds/Regulator.lean` | Rank zero only. The proof is the empty determinant. |
| `regulator`, `regulator_pos` | Mathlib `Units/Regulator.lean:266, 286` | The regulator is the covolume of the unit lattice, and it is positive. |
| `regOfFamily`, `regOfFamily_div_regulator` | Mathlib `Units/Regulator.lean:142, 361` | `regOfFamily u` is `0` off `IsMaxRank u`. The ratio identity has no full-rank hypothesis, and on a deficient family both sides are `0`. So the red team is right that full rank is needed before the identity certifies a positive index. |
| `NumberField.finite_of_discr_bdd` | Mathlib `Discriminant/Basic.lean:496` | Finiteness of the same carrier as the Tau Ceti count. |

**The consumer nodes.** The ArithmeticStatistics packet's SHA-256 is `6be34952…d025`, as
reported. Its node `ST.0/number-fields-ordered-by-discriminant` cites the Tau Ceti count
in its statement and prerequisites, but its proof steps use only
`mathlib:NumberField.finite_of_discr_bdd`, and the packet is `partial` and unreviewed. The
red team leaves this as a citation rather than a missing edge. That is the right call: the
node draws no numerical conclusion from the count. The ClassicalArithmeticCompletion node
`CA.5/fundamental-units-from-regulator-bound` assumes `IsMaxRank u` and `R(u) < 2L` with
`L ≤ R_K`. It uses only Mathlib's regulator declarations, as reported, so it does not
depend on the unspecified positive-rank inequality of Layer 3.

**The regulator counterexample.** I recomputed `log((1+√5)/2) = 0.4812118250596…`. This
agrees with the LMFDB value quoted for field 2.2.5.1, and it is below 1. The claim
`1 ≤ R_K` fails at positive rank, and the link map already disallows it (follow-up R1).

**The production graph.** I ran `scripts.build.assemble(require_distances=False)` in memory
at `561b3632`. It gives **2840 stages and 8007 distinct stage edges**, the red team's
figures exactly. It has three edges out of EffectiveBounds Layer 1: to Multiquadratic
Layer 2, and to NumberFieldArithmetic Layers 3 and 8. Each edge is also in its target's
`requires` list. So the two `alreadyRecorded` links really are in the graph. That matters,
because the sibling red team on OrthogonalL2Bases found an `alreadyRecorded` entry that
was not in the graph.

**Checkers and audit.** `check_links.py` on the target reports 0 errors and 0 warnings.
The reviewed library audit (AUDIT-03, `data/library-coverage.json`) marks Layers 0–2 built
and Layer 3 partly built, with no positive-rank regulator lower bound in either library.
This agrees with the map's follow-up R1.

## Two leads the red team did not list, and why they fail

**QuadraticFormInvariants Layer 9.** This is a Tau Ceti roadmap whose Layer 9 prerequisites
name `TauCeti/NumberTheory/EffectiveBounds/TraceForm.lean`. Its document says
`Tr_*⟨1⟩ ≅ ⟨2, 2d⟩` "is proved through this API". That looked like a consumer naming its
supplier. At `f790474`, however, the file says it "declares no new results". It holds two
`example`s over `ℂ/ℝ` (`Tr I = 0` and `disc {1, I} = -4`). Its own docstring puts the
reusable criterion and the discriminant formula in `TauCeti.FieldTheory.Trace`, which is not
an output of any EffectiveBounds layer. Layer 9 therefore uses the effective-bounds file
only as a worked example to mirror (its own words: "the archimedean sibling"). The link map
chose "the named generic trace library is the appropriate input", and I agree.

**HilbertModularVarietiesAndShimuraCurves H4.** The stage says "Prove the unit-square
comparison and eventual stabilization of the finite groups `Δ_n(N)`". It does not say which
unit group, or which congruence subgroup of it, is squared. `units_sq_index_le` bounds the
squares in the full `(𝓞_F)ˣ` only, so the stage text supports no exact match, and an
`inferred` link needs one (PROTOCOL.md section 10). The link map's note ("needs comparison
maps, not just the cardinal bound") stands. If H4's blueprint later cites the abstract
lemma behind the bound, its link job should record the edge.

**Packet-wide search.** Across `research/blueprint/packets` and `data/blueprints`, the only
packet that cites any EffectiveBounds declaration is the ST.0 node above.

## Verdict

There are no findings to verify. The clean result is well founded on everything I tested,
and no fix job follows from it.

## Validation

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-LINK-tauceti_Completed_EffectiveBounds.review.json`: ok.
- No Lean was compiled. None was needed for this report-only job.
