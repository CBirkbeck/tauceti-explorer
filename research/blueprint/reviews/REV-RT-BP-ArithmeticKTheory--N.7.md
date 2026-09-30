# Independent verification: ArithmeticKTheory N.7 red-team findings

Job: `REV-RT-BP-ArithmeticKTheory--N.7`; issue #4428.
Agent: Codex — codex-a71f92. Date: 2026-09-30.
Verdict: **both findings confirmed**, one medium and one low.

This verifies the two reported findings. It does not certify every arithmetic
theorem in the packet or repeat the original red-team's whole-library census.

## Independence and revisions

The blueprint was authored by Claude Code cc-7b31c4 ([PR #2881](https://github.com/CBirkbeck/tauceti-explorer/pull/2881)),
its independent review by Claude Code cc-fb70e5 ([PR #3333](https://github.com/CBirkbeck/tauceti-explorer/pull/3333)),
and the red team by Claude Code cc-c2c06b ([PR #4908](https://github.com/CBirkbeck/tauceti-explorer/pull/4908),
issue #4429). Read their attribution and claim/submission records; none is this
session's work.

Read the accepted 202-line suggested file at
`9cd6197f34b5f9b5d6c0bef9e030cc7e1a62c5ca`, and the complete current
226-line file at atlas commit
`0b4172110f86a14331ddf065536514089abfc957`.
An intervening [fix, PR #5221](https://github.com/CBirkbeck/tauceti-explorer/pull/5221),
changed N.8. The finding's original count is accurate for its accepted target,
but the remaining fix must use the current revision.

| Evidence | Accepted target | Current revision |
| --- | --- | --- |
| Named theorems concluding `True` | 14 | 6, all in N.7 |
| Records containing only `dummy : Unit` | 2 | 0 |
| `VandiverConjecture … : Prop := by sorry` | Present | Still present |

## Finding 1: meaningful suggested contracts (medium)

**Confirmed**, with the already completed N.8 portion explicitly excluded from
the remaining correction.

The historical file contains exactly the fourteen theorem names reported and
the two dummy structures. The current file still contains:

- `herbrand_ribet`
- `tameKernel_no_l_torsion`
- `residue_field_units_prime_to_l`
- `even_K_no_l_torsion`
- `modl_K_free_over_bott`
- `vandiver_iff_K4i_vanishes`

Each concludes `True`, so it imposes no restriction on the intended arithmetic
objects or hypotheses. The surrounding mathematical prose does not make that
Lean signature a statement of the named theorem. The Vandiver declaration at
line 162 uses precisely the uninterpreted `Prop`-valued `sorry` pattern
forbidden by PROTOCOL §13.

The complete `certified-example-format` node requires field invariants,
an imported N.6 order certificate, and origin/labelling information. Neither
historical `Unit` record carries these data. The current N.8 section instead
states the mathematical interfaces as comments and identifies the missing
carriers and N.6 owner. That portion is already repaired; it should be kept.

Personally read these actual declarations and their standing assumptions at
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`:

- [`NumberField.maximalRealSubfield`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean#L125):
  the subfield fixed as real under all complex embeddings.
- [`NumberField.classNumber`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/ClassNumber.lean#L64):
  the finite cardinality of the ring-of-integers class group.
- [`NumberField.of_subfield`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/Basic.lean#L79),
  and the [`CyclotomicField` number-field instance](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Cyclotomic/Basic.lean#L707).
  Together they supply the field types needed for the class-number condition.
- [`IsCyclotomicExtension.Rat.inertiaDeg_span_zeta_sub_one'`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/Cyclotomic/Ideal.lean#L231):
  under the prime/cyclotomic/primitive-root assumptions it states inertia degree
  one at `(ζ−1)`. Read the standing variables and adjacent prime/ramification
  declarations, not merely the theorem name.

The condition therefore has the mathematical signature
`¬ ℓ ∣ NumberField.classNumber (NumberField.maximalRealSubfield (CyclotomicField ℓ ℚ))`.
This is a checked carrier-level description, not a claim of elaboration.

**Correct remaining fix:** use the single owner-supplied Vandiver predicate;
replace the six remaining `True` declarations with actual mathematical
contracts when their carriers exist. Otherwise write the precise mathematics
in comments with missing objects and supplier names, as the current N.8 does.
A bare `eigenspace : Type := by sorry` does not yet provide the class-group
action needed to state Herbrand–Ribet; either give that interface meaning or
record the pending theorem in a precise comment. Correct the header's N.7
placeholder endorsement. Do not recreate the removed N.8 structures or a second
N.6 certificate construction.

This is a real prototype-contract gap of limited scope, so retain medium
severity. It does not assert that the packet's arithmetic theorem is false.

## Finding 2: Vandiver ownership (low)

**Confirmed.** Read the complete `vandiver-separation` node, its hypotheses,
proof steps and three internal prerequisites, and all packet requests.
A whole-packet exact search returns zero occurrences of
`IntegralIwasawaTheory`.

Read the [IntegralIwasawaTheory campaign's L0 and L3](https://github.com/CBirkbeck/tauceti-explorer/blob/0b4172110f86a14331ddf065536514089abfc957/content/campaign/IntegralIwasawaTheory/README.md),
and their full stage contracts in its atlas extract. L3 explicitly assigns
the definition of Vandiver(p) by nondivisibility of the maximal real cyclotomic
class number to that roadmap. L0 supplies the underlying cyclotomic arithmetic.
The [ArithmeticKTheory N.7 stage](https://github.com/CBirkbeck/tauceti-explorer/blob/0b4172110f86a14331ddf065536514089abfc957/research/blueprint/atlas/roadmaps/ArithmeticKTheory.json)
already imports L0 but does not thereby import L3's predicate.

Explanatory restatement of the conjecture in prose is legitimate. The defect is
the separately declared predicate with no owner/supplier interface.
Add an L3 request and prerequisite, reuse its predicate in the suggested file,
and retain here the comparisons, conditional K-theory consequences and
separation discipline. Do not assume or attempt to prove Vandiver itself.

Checked the native atlas's stage-edge graph: there is no path from N.7 to L3,
so adding L3 → N.7 introduces no cycle in that graph. This is a focused
dependency check, not certification of all overlaid packet dependencies.

## Validation and scope

Both exact finding IDs occur once in the review, with verdict and reason.
The mandatory `scripts/check_redteam.py` CLI passes against the real dotted
result/review filenames using the repaired checker from main. Intake checks
and `git diff --check` pass.

Current source fingerprints (SHA-256):

- Packet: `cdb95be2c403f417c7acb5a0e1b6d21dbd1ef529ffe072ca0b235f8d7d487e75`.
- Suggested file: `92cb7aca628fa7bd792fe711ff54f365f5386699c99f678b4791fcfc383012f6`.
- Red-team result: `9e6437c33b842646c20f4e565facc70187d1b6f496a2921cf34ec550ca621a31`.
- Historical accepted suggested file:
  `82b61ea2abc0bdf1753fda8c410df7abd5fa2c8e1f2a4312fdbcb4839108960e`.

No Lean was compiled, no build was started, and no formalisation is claimed.
These findings rest on the actual repository contracts and pinned library
statements; no fresh Weibel-book reading or whole-packet arithmetic audit is
claimed. Only the two verification deliverables are changed.
