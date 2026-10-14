# Independent package review: ColemanIntegration, revision 2

Job: `REV-PKG-ColemanIntegration~2` (#9204). Reviewer: Codex, session
`codex-cLjWwD`. Date: 2026-10-14. Verdict: **needs_changes**.

This is a completed rejection at the mandatory Lean shape gate, not a checkpoint
or an acceptance of the mathematics. The package needs a replacement of its
construction-heavy Lean before the remaining acceptance checks can proceed.

## Binding reason for rejection

[PACKAGE_REVIEW.md, Shape of a roadmap (2026-10-12)](../PACKAGE_REVIEW.md)
allows light definitions over existing carriers, end theorems and milestones.
It prohibits developing theory and requires a `needs_changes` verdict on such
development, “without further reading.” This rule overrides the earlier request
to put the package's heavy constructions into Lean. The rule concerns content,
not merely length or whether a data definition has a real body.

Two independently sufficient violations remain in
[Suggested.lean](../packages/ColemanIntegration/Suggested.lean):

| Block | Concrete development in the file | Required disposition |
| --- | --- | --- |
| `Words`, lines 417–508 | Recursive `shuffle`, a new `WordAlgebra`, its multiplication and `CommRing` laws, a derivation `D`, a depth filtration and the resulting surjectivity/kernel theory. | Keep the word-algebra construction, API, Checks and milestones in README L1.12–L1.16. The Lean file may only state milestones whose carriers already have the required pinned structure. |
| `BlochAlgebra`, lines 777–874 | Free symbols, five-term relation subgroup, pre-Bloch quotient, functorial quotient map, antisymmetric tensor quotient, descending boundary, its kernel and a descending dilogarithm evaluation. | Keep the field-general specification and discriminating Checks in README L2.Fb. These constructions and their dependent declarations do not belong in the representative-signature file. |

Writing a new ring structure on `Finsupp` is a construction even though `Finsupp`
exists in Mathlib. Similarly, having general quotient and tensor APIs does not
make the successive Bloch-group constructions existing APIs. The quotient lifts
depend on new well-definedness proofs. Their real bodies do not remove this
development from the file.

Targeted searches at both supplied pins, and in the current Tau Ceti library and
upstream roadmap checkout including `Completed`, found no declarations named
`WordAlgebra`, `ShuffleAlgebra`, `PreBlochGroup`, `fiveTermSubgroup`,
`AntisymmetricSquare` or `dilogEvaluation`. More importantly, the file itself
constructs the operations and quotients rather than importing those structures.
This targeted search is not the required mathematical duplication audit of every
README target.

The next revision must write the Lean file to the prescribed shape and retain
the full README specification. Replacing these constructions with sorry'd
carriers or opaque placeholders would also fail the gate. Check the other
construction blocks, including Frobenius iteration and chosen polylogarithms,
against the same rule; this rejection does not certify them as light.

## Mathematical correction applied

README L0.7 already assumes `0 < r`, but `discAnalytic` and its constant-function
example quantified over every `r : ENNReal`. At `r = 0`, the proposed carrier is
empty: any membership witness contains `HasFPowerSeriesOnBall F P a 0`, whose
`r_pos` field asserts `0 < 0`. In particular it cannot be a subalgebra, since its
carrier cannot contain zero. Elaboration with sorry proofs concealed this
contradiction.

The definition now takes `(hr : 0 < r)`. The constant-function example takes the
same hypothesis; the README signature and Check agree. A further README Check
and a fully proved Lean example exclude an analytic-series witness at radius
zero, including for a constant function. Radius infinity remains permitted.

The supplier statement was read directly in pinned Mathlib
`Mathlib/Analysis/Analytic/Basic.lean`, `HasFPowerSeriesOnBall`, lines 74–80.
The negative control uses its actual `r_pos` projection. It introduces no new
axiom and has no sorry proof.

## Checks and their limits

Read the worker, blueprint, package-review and upstream rules, the issue, the
previous independent report and review object, and the revision author's
handoff. Compared the package's opening, ownership, supplier contracts and
representative declarations with the ArithmeticDirichletSeries and
ContourIntegration upstream models. Read the complete submitted Lean file.
The metadata remains the fitting single line `topic = "math.NT"`.

The previous report's R1 has received new README subsections L3.Fa.1–L3.Fd.2.
Their presence does not establish that all motivic and regulator dependencies
are closed. R2's demand for heavy Lean construction signatures is superseded
by the binding 2026-10-12 shape rule. Heavy targets can and must remain fully
specified in the README without construction declarations in Lean.

The gate ends the substantive acceptance audit. No certification is given for
the random source sample, all author-flagged source discrepancies, plan/API
coverage, every dependency and current duplication, every definition's Checks,
or the full adversarial mathematics pass. The source pages opened before the
gate are not counted as completed locator verification. In particular the
author's flags about the cyclotomic basis range, the character twist and the
dyadic regulator input still require independent checking after the gate clears.

The bounded adversarial checks supporting this report are:

| Statement or convention | Instance or comparison | Result |
| --- | --- | --- |
| `discAnalytic` is a subalgebra | `r = 0`; even the zero or constant function needs a series witness | False as submitted; fixed by requiring positive radius. |
| Constant functions belong to `discAnalytic` | Positive `r`, including infinity, versus zero | Added the missing positive-radius binder and the proved zero-radius negative control. |
| New word-algebra operations are representative signatures | Compare the recursive product and new `CommRing` instance with imported pinned structures | Fails the mandatory shape rule; retained as a reported blocker, without asserting mathematical falsity. |
| Bloch quotient maps are representative signatures | Trace symbols → relation quotient → tensor quotient → boundary → kernel/evaluation | Fails the same rule; these are successive constructions. No claim about the truth of their sorry'd well-definedness proofs. |

Independent validation:

- Initial `lean-check`: exit 0; 98 warnings, all `declaration uses sorry`; no errors or other diagnostics.
- Final `lean-check`: exit 0; the same 98 warnings, no errors or other diagnostics. The new negative control is proved.
- Final Lean length: 1,172 lines, below both this issue's approximate 1,500-line limit and the binding 5,000-line ceiling. The content gate still fails.
- No README targets, API names, existing Checks or packet files were removed or changed beyond the L0.7 clarification and additional Check.

File-validation results are recorded in the handoff. A passing elaboration
checks types, not the truth of the admitted statements or compliance with the
content rule. The package is not ready for a TauCetiRoadmap draft PR.
