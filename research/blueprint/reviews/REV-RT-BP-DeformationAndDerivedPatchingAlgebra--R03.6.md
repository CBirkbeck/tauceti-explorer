# Independent verification: R03.6 red-team finding

Job: `REV-RT-BP-DeformationAndDerivedPatchingAlgebra--R03.6` (issue #4417).
Agent: Codex — codex-a71f92. Date: 2026-09-30.
Status: checkpoint; evidence verification finished, mandatory CLI validation blocked.

## Verdict and scope

**Confirm the sole finding**, `RT-BP-DeformationAndDerivedPatchingAlgebra--R03/1`, at **low**
severity. The reader's supported-on-components API is stale; the three missing
names already have packet entries and suggested signatures. Agree with the
proposed reader-only correction. There is no medium/high finding to route to a
fix job under PROTOCOL §17.

This is an independent verification of that finding, not a fresh red-team
audit of the entire 53-node packet or its six papers. I did not author the
blueprint, original review, or red-team result. Their attribution is respectively
ClaudeCode cc-39fac3, ClaudeCode cc-fb70e5 (PR #3322), and Codex codex-5ebb6f
(PR #4931), distinct from this session.

## Reproduced evidence

Read against atlas commit `f63511f24ba4e8f4301a45e44e6a6a9831734d57`:

- The complete `supported-on-components` node of
  `research/blueprint/packets/DeformationAndDerivedPatchingAlgebra--R03.6.json`
  has seven API entries. The last three are the accepted review's additions.
- `research/blueprint/readmes/DeformationAndDerivedPatchingAlgebra--R03.6.md`:
  lines 161-162 establish the default `Module` namespace; lines 191-202 give the
  definition, four-entry API and unit tests. Whole-reader exact searches for
  each of the three omitted names without the namespace prefix find zero
  occurrences, so this is not merely namespace abbreviation.
- `research/blueprint/suggested/DeformationAndDerivedPatchingAlgebra--R03.6.lean`:
  read the definition, namespace and ambient assumptions, and API lines 143-180.
  The missing declarations occur at lines 166, 173 and 178. They already have
  signatures and `sorry` bodies; none is claimed formalised.

| Missing named API | Existing contract / role |
| --- | --- |
| `Module.IsSupportedOnComponents.mk` | Introduce the predicate from `(Module.annihilator R M).minimalPrimes ⊆ minimalPrimes R`. |
| `Module.isSupportedOnComponents_of_faithfulSMul` | A faithful module is supported on components. |
| `Module.isSupportedOnComponents_of_subsingleton` | A subsingleton (zero) module is supported on components. |

The reader's `isSupportedOnComponents_test_zero` mentions the zero-module
example but does not list the omitted compatibility lemma. Thus it does not
eliminate the PROTOCOL §8 reader/API agreement defect.

## Pinned library check and mathematical justification

Personally read the standing assumptions and actual declarations at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`:

- [Maps.lean, lines 850-905](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Maps.lean#L850):
  `Module.annihilator_eq_bot` (line 892) equates bottom annihilator with
  `FaithfulSMul R M`, under ring/additive-group/module assumptions.
  `Module.annihilator_eq_top_iff` (line 901) equates top annihilator with
  `Subsingleton M`, already under semiring/additive-monoid/module assumptions.
  The suggested declarations' commutative-ring assumptions suffice.
- [MinimalPrime/Basic.lean, lines 40-64](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/MinimalPrime/Basic.lean#L40):
  `Ideal.IsMinimalPrime` requires primality and containment of the ideal;
  `Ideal.minimalPrimes` is the resulting set, and `minimalPrimes R` uses bottom.

Consequently the constructor is the defining inclusion itself. In the faithful
case that inclusion is a set's inclusion in itself. In the subsingleton case
there is no prime containing the top ideal, so its left side is empty.
No finite-generation assumption is needed for these three statements.
The separate equivalence with geometric support being a union of components
does retain its finite-module hypothesis; this review does not alter it.

The finding's evidence is entirely in the repository and pinned library files.
No additional paper passage, Tau Ceti absence claim, or source-version erratum
is asserted by this verification.

## Exact correction

Extend the reader's lines 194-196 with the three names and roles above.
Preserve the existing four entries, seven-entry packet API, suggested
signatures, and tests. Do not introduce another node or a second construction.
The present review does not edit those target files.

Independently recomputed SHA-256 values match the red-team's audited revision:

- Packet: `7d5095850eca12bc0d5930af24e45a800c675c46a491d99a38bf1eed5f5930be`.
- Reader: `5cb32739e0e0e2d6b2a7497f810abcee961f72e8c8cbb434012ef9811e3649c4`.
- Suggested Lean: `3f00224a0dd269a8a3a5f894d93beeb5c07a3efe72d9400bdfd160d1d9a20063`.

## Validation blocker and handoff

The required `python3 scripts/check_redteam.py
research/blueprint/redteam/RT-BP-DeformationAndDerivedPatchingAlgebra--R03.6.review.json`
fails independently of the verdict: line 83 uses `path.name.split(".")[0]`,
then line 87 loads the nonexistent `RT-BP-DeformationAndDerivedPatchingAlgebra--R03.result.json`.
The repository contains only the dotted `R03.6.result.json`.
The mandatory CI workflow invokes this same CLI.

The original result stores truncated `redteam` and finding IDs, but its `job`
and `target` retain `R03.6`. This review keeps the exact issue-requested
`redteam` identifier and preserves the original finding ID for unambiguous
linkage. A checker repair must account for this existing legacy representation,
not silently discard its findings.

Direct `check_review(review, full_job_id, actual_result)` validation and exact
finding-set/linkage assertions pass; the canonical CLI does not. Intake file
checks and whitespace checks pass. No alias result file or checker change is
submitted to conceal the failure. No Lean was compiled or build started:
these are verification documents, and the suggested file is unchanged.

The handoff records the remaining infrastructure work. This submission is a
draft checkpoint, not a claim that all required checks passed.
