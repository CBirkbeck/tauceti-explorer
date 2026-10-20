# Drinfeld package: completed independent review

Issue [#11513](https://github.com/CBirkbeck/tauceti-explorer/issues/11513). Agent Codex, session `codex-qAzAqq`, 2026-10-20. **Completed review, verdict `needs_changes`; not a checkpoint.** Only this one issue was claimed.

## Done

Read and reviewed the full package against its accepted plans, current upstream roadmaps and library, the binding protocols and two upstream models. Checked the seeded random sample of 15 source locators, all correction sources and all 137 retained targets adversarially. The [review report](../reviews/REV-PKG-DrinfeldModulesAndTModules~codex1.md) records the precise counterexamples, full target-by-target table, ten Lean signature comparisons, source access manifest and commits used. It is sufficient to resume without the deleted scratch directory.

Applied corrections to lattice morphisms, Frobenius linearization, intrinsic Tate modules, local residue-field lifts, section-ring normality, residue-valued Tate duality, Hom projectivity/finiteness, total quotient products, valuation quantifiers, skew invariant factors and the ABP estimates/auxiliaries. Corrected the Hilbert–Serre bridge: Mathlib's rational-series coefficient calculation does not supply the graded-module theorem. Added proved definition examples, including zero/identity morphisms, characteristic ideals and degree-zero span equality. Full details are in the report.

Removed former §8.11 as a duplicate of RestrictedPowerSeries §§3.2, 4.3, 5.1–5.2. Its exact imported contract is in the supplier section; the anchor is stable. Former §§8.12–8.53 are now §§8.11–8.52. No removed-target stub remains. Removed the FunctionFieldArithmetic prerequisite by a direct finite-free lattice proof in §6.2; it remains a consumer. No other ownership transfer or bundle was invented. No packets, link maps or upstream files changed.

The advertised round-one review report and review.json were absent at the claimed base; the report records that fact. The parenthetical Mordell title in the issue does not describe this package. The accepted effective plan has 123 reused plus 11 parent targets, not the author handoff's claimed 123 plus 15.

## Remaining and where to resume

Resolve these three exact supplier contracts before accepting the package upstream:

1. FiniteFieldsAndCharacterSums shared Ore/linearized-polynomial comparison, evaluation, separability and subspace polynomials (FF.4). There is no upstream package; the order-file move of FF.1 does not resolve these.
2. ReductiveGroupsPartII Lang and finite-locally-free Weil restriction (RG2.3.7, RG2.0a.2), needed by §1.3. Draft upstream #785 is not main.
3. MotivesAndAlgebraicCycles §§6.1–6.3 neutral Tannaka over arbitrary fields, needed over imperfect F_q(t). Draft upstream #1313 is not main.

At checked main `c4d22422c3f1aaa3d806c42f432953c26cb91969`, none of these suppliers is present; no Drinfeld earlier-tier/bundle authorization was found in CaraianiNewton. Check current main and the order again, then establish earlier suppliers or ask the maintainer to assign downward ownership. Do not merely reclassify these as already supplied. This review's permitted paths do not authorize editing their packages/packets.

The README also exceeds the issue's 200 KB cap. PACKAGE_REVIEW's newer shape rule overrides older size notes and forbids deleting statements/tests/locators to shrink it. The maintainer should reconcile that issue-specific cap or authorize Parts if it remains binding; the verdict already fails independently on supplier closure.

## Validation

- Final `lean-check research/blueprint/packages/DrinfeldModulesAndTModules/Suggested.lean`: exit 0, 614 lines, 23 `declaration uses sorry` warnings only. One linter warning in an intermediate run was fixed before this final run. No data definition or example is admitted.
- `scripts/check_sorry_data.py`: exit 0.
- Parent `scripts/check_blueprint.py`: 0 errors, 0 warnings; its 18 gaps and 13 requests were not edited and are not a closure certificate.
- Numbered references/anchors and ≥3 prose Checks per definition were checked after renumbering; `git diff --check` passed. Metadata unchanged, `math.NT`.
- Final intake validation on all five changed files plus unchanged metadata: 6 files, 0 problems.

Public copies and hashes are preserved in the report, not their text. The ND public endpoint was inaccessible and was not one of the random sample; no claim to have verified its page locators is made. Carlitz normalizations were independently checked against BP/Pap and the formulas. No uncleared book or source passage was copied. No suspicious instruction was encountered in untrusted material. No Lake build, cache download, language server, upstream edit, or other job was started.
