# General algebraic K-theory: package review

**Verdict: needs_changes.** The package fails the mandatory Suggested.lean shape gate. It contains data definitions and data instances whose computational fields are supplied by `sorry`, and it develops new construction carriers on top of them. This is a completed gate-rejection review, not mathematical acceptance and not a checkpoint.

Reviewer: Codex — codex-eeiYSO, 2026-10-19. The package was submitted by Codex — codex-NtHmq6 in PR #8160; this reviewer did not write it. The claim for issue #10753 was confirmed by the bot against comment 6267245259.

## Rule applied and scope

The binding **Shape of a roadmap (2026-10-12)** section of `research/blueprint/PACKAGE_REVIEW.md` requires a `needs_changes` verdict without further reading when Suggested.lean contains sorry-bodied data definitions or develops theory. The issue explicitly requires that review method. The file has 1,062 lines, so the 5,000-line limit is satisfied; the content restriction is independently violated.

The shape check is decisive before source verification or mathematical approval. Accordingly, this report does **not** certify the source locators, plan coverage, dependency closure, current-upstream duplication audit, README generality, definition checks or theorem truth. The requested statement-by-statement adversarial mathematics pass has not been performed. An elaborating file cannot discharge that work.

The reviewed package is unchanged from commit `631a49298cef22b79f41df878065ac9218d27169`. Its Suggested.lean SHA-256 is `fa0cbbcb12ab31fd57341fc8c964c5d1bafa33d1764f9aae41ae2431e29e2395`. Only this report and `review.json` are added.

## Blocking findings

All line numbers below refer to `research/blueprint/packages/GeneralAlgebraicKTheory/Suggested.lean` as reviewed. These are directly inspected witnesses, not an exhaustive inventory. Each is sufficient evidence of the shape defect; none depends on a mathematical counterexample.

| Finding | Location and declaration | Concrete defect | Required disposition |
|---|---|---|---|
| GAK-S1 | Lines 61–65, `HomotopyFibre.map` | A based continuous map, including its underlying function, is supplied by `sorry`. | Keep the functorial construction, its equations and checks in the README; omit the unfinished data declaration and its dependents from Lean. |
| GAK-S2 | Lines 93–99, `classifyingSpace_natTrans`, `classifyingSpace_equivalence` | Homotopy and homotopy-equivalence data are supplied by `sorry`. These are not propositions asserting existence. | Keep the constructions in prose; only an existence theorem on fully available carriers is eligible for a sorry proof. |
| GAK-S3 | Lines 111–126, `BasedMap.loop`, `Prespectrum.zero` | The induced loop map and the levels and structure maps of a prespectrum have sorry bodies. | Retain the exact README interfaces and tests; remove unfinished constructions from Lean. |
| GAK-S4 | Lines 169–176, `qCategory` | Although the hom carrier and identity are displayed, the category's composition operation is `sorry` at line 173. Every subsequent category-theoretic expression on Q uses that operation. | Treat the Q-category and its full higher K-theory interface as README targets. Do not keep dependent declarations by merely deleting this instance. |
| GAK-S5 | Lines 256–257 and 264–269, `kGroupAddCommGroup`, `twoEdgeLoop`, `pi1QEquivExactK0` | The group operations, selected loop and additive equivalence are unfinished data; they depend on the new Q-category. | Keep their specifications, orientation convention and checks in prose. Lean statements may not depend on these omitted declarations. |
| GAK-S6 | Lines 313–328, `projBaseChange`, `projBaseChange_id`, `projBaseChange_comp` | A scalar-extension functor and its coherence isomorphisms are given by `sorry`. | Preserve the associative-ring scope in README targets; omit the unfinished functor and dependent signatures. |
| GAK-S7 | Lines 362–378, `stabilizeMatrix`, the `Group (StableGL R)` instance, `stableElementaryMatrix` | Stabilization homomorphisms, stable group operations and chosen elementary elements are supplied by `sorry`. The displayed quotient does not supply these missing operations. | Keep the stable-matrix construction, Whitehead milestones and checks in the README. Do not replace them with an arbitrary group parameter. |
| GAK-S8 | Line 438, `conflationExactStructure` | The exact structure itself is supplied by `sorry`. This finding concerns that data definition, not the separate existence-of-limits propositions above it. | Cite any existing supplying API only after reading it; keep the genuinely new structure as a README construction otherwise. |
| GAK-S9 | Lines 517–518 and 577–585, `ClassicalRelativeK0.difference`, `ClassicalAdditiveK1.map`, `ClassicalAdditiveK1.quillenEquiv` | Additive homomorphisms and a comparison equivalence are supplied by `sorry`; the comparison also depends on the unfinished Q-theory carrier. | Preserve the relative signs, naturality and comparisons in prose; remove unfinished data and dependent Lean statements. |
| GAK-S10 | Lines 650–651 and 741–754, `WaldhausenCategory.ofExact`, `SConstruction.restrict`, `standardTwoStepFlag` | A Waldhausen structure, restriction functor and chosen filtration are unfinished constructions. The S-construction and its cofibration interface also develop the new theory rather than state milestones on existing carriers. | Keep every construction, API and flag check in the README; restrict Lean to the permitted representative subset. |
| GAK-S11 | Lines 806–809 and 885–888, `ringKMap`, `NilCat.forget`, `NilCat.zero` | The induced based map and two functors have sorry bodies. A real-bodied definition of `relativeK` does not repair its dependency on `ringKMap`. | Keep relative K-theory and Nil functor specifications in prose; remove their unfinished data dependencies from Lean. |

A `sorry` used only to prove a proposition is a different issue from these examples: the evidence above identifies actual functions, maps, operations, objects and equivalences. Replacing `def` with `noncomputable def`, or supplying arbitrary data through a hypothesis, does not fix the shape violation. Nor does writing the missing development in Lean: the roadmap is the specification of that work, not its implementation.

## Gate-pass and adversarial-pass record

| Statement or check | Instances or evidence inspected | Result | Change |
|---|---|---|---|
| Maximum file length | Counted 1,062 physical lines. | Passes the size limit. | None. |
| Data definitions have real bodies | Direct inspection of GAK-S1–S11, including the selected map, spectrum, functor and homomorphism bodies. | Fails the mandatory shape gate. | Recorded `needs_changes`; no mathematical targets or checks deleted. |
| All operations underlying a carrier are supplied | `qCategory.comp`, the `StableGL` group instance and their dependent declarations. | Fails; displaying a quotient or object type is insufficient. | Recorded dependent declarations as part of the required rewrite. |
| Suggested.lean states rather than develops theory | Q composition, stable matrices, relative presentation groups, Waldhausen and S-construction interfaces. | New construction development exceeds the permitted representative subset. | Rewrite required; no new theory developed during review. |
| Pinned elaboration | Ran the unchanged file with `lean-check`; helper reported Mathlib `082e2d37e8`. | Exit 0; 116 warnings, all `declaration uses sorry`; no errors. | None. |
| Degenerate-case and convention audit of every mathematical statement | Trivial groups, ranks 0/1, indices 0/1/2, zero modules, unit ideals, fields/DVRs, characteristic 2, and two-term sign witnesses. | Not performed: mandatory shape-gate rejection precedes this audit. No assertion of mathematical success is made. | Required after the shape rewrite. |
| Sources, prerequisite closure and duplication | Source locators, plan targets, current Tau Ceti roadmaps/library, and mathematical-object searches. | Not certified by this gate review. | Required after the shape rewrite. |

## Repair and resumption

Preserve the entire README's targets, hypotheses, locators, APIs, discriminating Checks and worked examples. Rewrite Suggested.lean to retain only light definitions with real bodies on carriers present at the pins, plus end theorems and layer milestones statable on those carriers. For example, the displayed integer sign and two-term arithmetic formulas are candidates for that subset, subject to mathematical review; this report does not approve them merely because they are short.

Move every heavy construction and its full intended signature into the README if it is not already there, and list omitted interfaces in the closing Lean comment. Remove any Lean declaration that mentions an omitted carrier or operation. A collection of arbitrary parameters with no construction contract is not an acceptable replacement. Reconcile the surviving Lean examples with the README and retain every omitted example as a precise prose Check.

Then rerun `lean-check`, perform the complete source/plan/dependency/current-library review and the statement-by-statement adversarial pass required by issue #10753, and record the outcomes before acceptance. No claim that the README is otherwise correct or complete follows from this report. The review gate itself is complete; the package requires revision.

## Validation

- `lean-check research/blueprint/packages/GeneralAlgebraicKTheory/Suggested.lean`: exit 0, 116 sorry warnings, no errors.
- `python3 research/blueprint/intake.py check-files research/blueprint/packages/GeneralAlgebraicKTheory/review.json research/blueprint/reviews/REV-PKG-GeneralAlgebraicKTheory~adv.md`: 2 files, 0 problems.
- `git diff --check`: passed.
