# ArithmeticKTheory: downstream dependency wording

Job `FIX-PKG-ArithmeticKTheory~adv2`, issue #11338. Agent: Codex,
session `codex-8czmuK`. The claim bot confirmed this session's claim on
2026-10-20. Complete fix submission; the accepted verdict is retained with
the issue-prescribed `fix-FIX-PKG-ArithmeticKTheory~adv2` provenance.
Independent fix review remains a separate pipeline step.

The maintainer's final instruction scopes this job to de-cycling wording.
The earlier U1–U3 dispositions and qualifications in
[the previous fix handoff](FIX-PKG-ArithmeticKTheory~adv.md) are preserved.
Only the package README, review metadata and this handoff change.
`Suggested.lean` is byte-identical to the claimed revision.

## Finding dispositions

| Finding | Change | Result |
| --- | --- | --- |
| Opening negative sentence parsed as a supplier citation | State the certificate's independence directly, without naming a later roadmap in the ownership paragraph. Name the later applications only in Downstream consumers. | Both certificate bounds still exclude special-value identities. |
| Other backward special-value references | Replace B.8 citations in Exact supplier contracts, §7.5 and Layer 7 Dependencies with the existing primary-source order theorem, K-book VI.10.1, p. 527. Retain the table's VI.10.1–10.2 and VI.10.9–10.10 locators. | The arithmetic order input remains explicit; cyclicity alone is not used to infer an order. |
| Golden-field comparison read as a prerequisite | Keep the certified order and w₂ in §8.9; move the zeta-value comparison to the downstream application. Remove the later roadmap's name from Layer 8 Dependencies. | The computation 4/120=1/30 remains, after the independent certificate. |
| Remaining named later roadmaps | Search the whole README for SpecialValuesBirchTate, K3BlochGroups, Polylogarithms and PeriodsAndSpecialValues. The first two occur once each, only under Downstream consumers, explicitly as consumers. The other two have no named occurrence. | No named later roadmap occurs in a supplier contract, layer or dependency list. The K₃ decomposable/indecomposable boundary is retained. |

The local order-formula citation was checked against Weibel's
[*K-book*](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), combined
author PDF dated 29 August 2013: VI.10.1, p. 527; VI.10.2 and
Table 10.2.1, pp. 528–529; VI.10.9–10.10, p. 533.
The later special-value package's §§8.3–8.5 were also read to confirm
that its higher-value comparison consumes arithmetic group and cohomological
order data. No new mathematical result or owner export is introduced.

## Pass over the touched statements

| Statement or boundary | Instances / countercontrols tried | Result and change |
| --- | --- | --- |
| §7.5 order formulas and conditional table | n=0 and 1 are outside n≥2; the 8a+1 row starts at a=1. At a=0, c₁=c₂=1, giving K₂=ℤ/2, K₃=ℤ/48, K₆=0 and K₇=ℤ/240. | Formulas and degree restrictions unchanged. Replaced only the source's roadmap attribution. |
| §7.5 Vandiver and cyclicity | A finite verified prime range does not imply global Vandiver. A bound on dimension modulo p proves cyclicity, not its exponent. K₄=0 remains unconditional. | All hypotheses, the finite reflection argument, and the separate order input retained. |
| §8.9 golden-field upper bound | Two generators with 2g=2h=0 give a quotient of (ℤ/2)². Dropping a generator can give order two. | Generation and relations remain the upper-bound argument, independent of zeta values. |
| §8.9 golden-field lower bound | The products of g↦(−1,−1) and h↦(1,−1) give all four sign pairs. Keeping only their product gives two. Reversing embeddings permutes coordinates. | Independent lower bound four retained; all sign conventions and Checks unchanged. |
| Downstream golden comparison | Exact rational arithmetic gives 4/120=1/30. Knowing this quotient alone establishes neither generation nor independent sign detection. | Same comparison, relocated after the certificate. |
| Downstream K₃ boundary | Rational rank zero with torsion 48 versus Gaussian rank one with torsion 24; both w₂=24. | Layers 3–5 still precede Bloch analysis; §8.10 and its Checks are unchanged. |
| Mathematical content and Lean agreement | Compare every table, fenced formula, all 62 Checks lists, and the entire Lean file with the claimed revision. | Exact equality in each case; every Checks list still has at least three tests. No signature, variable block, carrier or normalization changed. |

## Validation

- `lean-check research/blueprint/packages/ArithmeticKTheory/Suggested.lean`:
  exit 0 at the shared atlas pins (Tau Ceti f790474, Mathlib 082e2d3).
  Only thirteen declaration-uses-`sorry` warnings; all fourteen examples
  are proved. Seven light definitions and thirteen theorem targets remain
  in 234 lines. Memory available before the check exceeded 20 GB.
- `mech_check.py` was rerun after inspecting the available read-only helper.
  Helper SHA-256:
  `5e32bb7eb73b89a02b94a7a93dcbcf3a67f622b6c9ce23d3ac794d176dccf56f`.
  Its before/after output is identical: 20 Lean declarations, 63 bold
  README targets, 156 candidate identifiers; no missing Check labels,
  round-named labels or empty Lean sections. Its nine absent Lean names
  are unchanged README API targets: `IsRegularPrime.iff_not_dvd_classNumber`,
  `bernoulliTop_eq_abs`, the three `bottCohomologySlot` API names,
  `divisibleSubgroup_directSum`, `divisibleSubgroup_map_le`,
  `evenTwoRank_periodic` and `evenTwoRank_residue_two`. The compact-file
  policy leaves such additional targets in the README. Its single bold
  paragraph without a backticked name is the existing Summary paragraph.
- `python3 scripts/check_sorry_data.py` on `Suggested.lean`: exit 0.
- `python3 scripts/check_blueprint.py` on all eight existing
  ArithmeticKTheory packets: exit 0, zero errors and warnings for each.
  The packets remain unchanged.
- Whole-README section audit: all occurrences of the four later-roadmap
  names are either absent or confined to Downstream consumers. This is
  an explicit text audit; the available mechanical helper does not
  implement the maintainer's dependency parser.
- `python3 research/blueprint/intake.py check-files` on the four issue
  deliverables: zero problems. `git diff --check`: passed.

## Remaining work

No remaining item within this wording fix. The existing conditional
raw/symbol comparison, external supplier contracts and source qualifications
are preserved as documented by the previous fix. The review metadata uses
the requested fix marker and does not assert an independent review by this
session. No suspicious instructions were encountered in fetched text.
No fetched code or private-source passage was copied into the repository.
