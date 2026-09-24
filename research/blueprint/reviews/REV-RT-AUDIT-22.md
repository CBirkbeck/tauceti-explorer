# REV-RT-AUDIT-22

**Complete verification: 0 confirmed, 1 rejected.** Codex — `codex-hjdg0j`, 24 September 2026. Refs #1593.

I did none of AUDIT-22, REV-AUDIT-22 or RT-AUDIT-22. My claim comment was 5805285618, confirmed by the bot in 5805287191. This review checks the one submitted finding; it does not certify the red team's broader claims about 528 citations, absence searches or duplication.

Reviewed explorer snapshot: [`3dcb6b7ce261241b86cf77bdba48108ac45d6b10`](https://github.com/CBirkbeck/tauceti-explorer/tree/3dcb6b7ce261241b86cf77bdba48108ac45d6b10). Inputs read: the red-team JSON and report, the complete three disputed audit layers and two control layers, their roadmap summaries, REV-AUDIT-22, the audit format in `make_audit_jobs.py`, and the coverage exporter. Library files were byte-compared against public raw files at the full pins below; their statements and surrounding variables were read, not merely their names.

## RT-AUDIT-22/1 — rejected

The reusable results exist, but their availability and limitations are already recorded at target level. Each disputed target is `partial`, with explicit declarations and a note. The finding's shortened target quotations omit requirements that explain this status:

| Audit location | What the pinned declarations provide | What their statements do not provide |
| --- | --- | --- |
| ProfiniteProPGroups layer 4, target 6 (zero-based) | `Module.equiv_free_prod_directSum`: for a finite module over a commutative principal ideal domain, an algebraic linear equivalence with a finite free part and cyclic prime-power quotients. | The continuous Z_p-action on an abelian pro-p group, the passage from topological finite generation to `Module.Finite`, a topological decomposition, and uniqueness of rank/elementary divisors. The audit explicitly records these boundaries. |
| DGAInfinity layer 8, target 1 | `AInfinityAlgebra` stores an uncurved nonunital algebra's grading, operations, their suspended Taylor map and a square-zero condition. The cited `IsSuspension` theorem proves square-zero iff the Stasheff sums vanish on homogeneous inputs, assuming the operations have degree 2−n and the Taylor map is their suspension. | It does not by itself construct that data from an arbitrary coderivation or supply the target's additional identification with brace solutions in arity-complete Hochschild cochains. The audit's note distinguishes these exact issues. A structure field is not a proof of a construction. |
| DGAInfinity layer 10, target 3 | For an existing sesquilinear pairing over a commutative ring, `LeftNumericalQuotient` quotients by its left radical; `numericalPairing_nondegenerate` proves that the induced pairing between the left and right quotients is nondegenerate. | It does not construct K0(Perf C), its Euler pairing, or the target's identification through Serre duality. Nondegeneracy of the pairing between two quotients does not identify their radicals or quotient modules. The note says this. |

The cited source statements are at:

- [Mathlib PID structure theorem and its assumptions](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/PID.lean#L257) (variables at lines 58–73).
- [Tau Ceti A-infinity structure](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Homology/AInfinity/Algebra.lean#L54) and [square-zero/Stasheff theorem](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Homology/AInfinity/Coderivation.lean#L362).
- [Tau Ceti quotient definition](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/SesquilinearForm/NumericalQuotient/Basic.lean#L138) and [induced nondegeneracy theorem](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/SesquilinearForm/NumericalQuotient/Basic.lean#L317).

These four files contain no `sorry` or axiom declaration. This is a source-level check of the cited statements and their proofs, not an audit of every transitive dependency.

The two control layers have the claimed counts: Demushkin classification has seven targets and no declarations; DGA layer 9 has five and none. This establishes that `not built` alone does not distinguish reusable inputs, but the audit format does not promise that distinction. Its target-level fields carry that information. `make_audit_jobs.py` defines `partial` as something close existing with the missing part stated; it reserves `partly built` for at least one present and one missing target. The preceding independent review explicitly removed reused input mathematics from E0's present targets for the same reason. DGA's roadmap summary additionally names the reusable A-infinity core and the general numerical-quotient library.

There is a separate presentation boundary worth stating accurately. `scripts/merge_library_audit.py` retains each target's status and note, but its `evidence` list admits only exact/more-general declarations whose **target** is fully present (`mathlib`, `tauceti`, or `both`). That predicate is independent of the layer verdict. An extra layer-level `reuse` field is not exported at all; a new verdict is outside the exporter's four accepted values and would cause it to skip the layer. Thus neither suggested audit-only change remedies that consumer behavior. A future feature could expose partial-target declarations explicitly, with a consumer change and a defined display, but this finding establishes no incorrect or missing audit evidence to fix.

## Limits and validation

The red-team report itself says it checked Mathlib at `30a58f79`, not the required pin, despite its broader headline. I did not rely on that check: all four relevant files were independently fetched at the required full pins. A name/line match and content-word overlap also do not establish statement coverage or mathematical nonduplication; this review does not endorse those global conclusions.

Validation: `python3 scripts/check_redteam.py research/blueprint/redteam/RT-AUDIT-22.result.json research/blueprint/redteam/RT-AUDIT-22.review.json`; `python3 research/blueprint/intake.py check-files research/blueprint/redteam/RT-AUDIT-22.review.json research/blueprint/reviews/REV-RT-AUDIT-22.md`. One review verdict covers the one finding exactly. Only the two issue-authorized deliverables change. No Lean file was changed or compiled, and no formalization is claimed. No findings remain unverified.
