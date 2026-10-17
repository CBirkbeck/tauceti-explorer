# FIX-PKG-ColemanIntegration~adv — completed

Issue: #10180. Agent: Codex. Session: `codex-WBEX5R`.

## Findings and dispositions

The issue-named `reviews/REV-PKG-ColemanIntegration~adv.md` is absent from the checked-out main commit `f1006a6ee89ae55eb94dec63b40f3179c5281a74`. The available reports `REV-PKG-ColemanIntegration.md`, `REV-PKG-ColemanIntegration~2.md` and `REV-PKG-ColemanIntegration~3.md` were read, together with the package's accepted review. The operative new findings are the three explicit manager instructions in #10180. This is their fix report, not an independent review of this worker's changes.

| Finding | Change and disposition |
| --- | --- |
| Dropped computation supplier | Removed the package's sole `ComputationalNumberTheory` citation from Scope. Neither README nor Suggested.lean now cites it. No theorem consumed a separate algorithmic output from it, so no replacement computation hypothesis was necessary. Existing explicit numerical Checks remain worked Checks; no algorithm is added. |
| Dirichlet dependency cycle | Scope and Exact supplier contracts now identify DirichletPadicLFunctions as the earlier supplier of Gauss sums, measures and L-functions. Deleted the reverse dependency in Downstream consumers and the claim in L0.18 that Dirichlet imports Coleman's logarithm. Preserved Coleman's own branch construction L0.15 and specialization L0.18. |
| Compatibility after independent construction | Added the named L0.18 interface `iwasawaLog_eq_normalizedLog`: on a finite extension inside ℂ_p, a homomorphism with the principal-unit series and value zero at p agrees with the restriction of Coleman's Iwasawa branch. L0.14 supplies N ≥ 1 and m with x^N p^(−m) principal; both logarithms multiplied by N have the same value. Thus compatibility uses uniqueness, not a construction dependency. |
| Preserve the rest and elaborate | Retained every original target subsection, API entry, Checks list, worked example and named Lean declaration. Added normalization, unit, torsion, uniqueness and zero-input Checks, mirrored by seven representative Lean examples. Final `lean-check` exits 0 with exactly 73 `declaration uses sorry` warnings and no other diagnostics. Package verdict is accepted as instructed. |

The earlier reports' regulator foundations, finite-word Taylor/gluing corrections, raw regulator signs, nonsplit-divisor examples and Artin parity controls are preserved. There is no new packet change or claim that the packet's historical planned gaps have been discharged.

## Adversarial pass on the touched statements

The Lean statements use the existing real-bodied `IsLogBranch` predicate. Its hypotheses require multiplicativity on nonzero inputs, the principal-unit series and the value at p; none is a free function advertised as a constructed logarithm. Every example in this table is an admitted roadmap signature, not a formal proof of the calculation.

| Statement / location | Instances and calculation | Result and change |
| --- | --- | --- |
| Scope, supplier contracts and Downstream consumers | Follow the dependency with and without a Coleman construction: the Gauss sums, measures and arithmetic L-function exist in the earlier roadmap; Coleman's branch uses only L0.10, L0.13 and L0.14. Odd-p qualifications on imported L-function formulas remain. | The arithmetic edge points into ColemanIntegration. No reverse dependency or dropped supplier remains in either package document. |
| L0.15 branch construction and uniqueness | At x = 1 take N = 1, m = 0; at x = p take N = m = 1. In general N ≥ 1 is nonzero in characteristic zero, so division by N is valid. At p = 2, (−1)^2 = 1 gives 2 log_a(−1) = 0. | The original construction is retained. Added the identity/torsion Check and the Lean example `L 1 = 0 ∧ L (-1) = 0`. No injectivity on all dyadic principal units is asserted. |
| L0.15 zero function and trivial input | The identity 1 is killed by a branch. The zero function fails at p if a ≠ 0; for a = 0, log₃(4) and log₂(5) are nonzero series values. For every p, a sufficiently small p-power principal perturbation has a unique term of least valuation. | Retained the negative-control Lean example for every prime and every parameter. Added its explanation to the README. The trivial-input value alone cannot identify a branch. |
| Same-parameter uniqueness | For arbitrary a, two branches give N(L′(x) − L(x)) = 0 for x ≠ 0 using L0.14. Test a = 0 and a ≠ 0; the argument is unchanged. | Added the `Set.EqOn` example on the nonzero locus and the matching README Check. The hypotheses cover all of ℂ_p, not merely ℚ_p. |
| Unrestricted value at zero | Zero is outside the multiplicative group. The series inputs 1 + u have norm 1 when ‖u‖ < 1, and p is nonzero. Changing a function only at 0 changes none of the predicate's tests. | Added `IsLogBranch p a (Function.update L 0 c)` and README wording. Uniqueness for total functions still requires the existing junk-value normalization `L 0 = 0`. |
| L0.16 sign and valuation normalization | x = p gives b − a; x = p² gives 2(b − a). Test a = b (zero difference), a = 0, b = 1 (differences 1 and 2), and p = 2. These use v_p(p) = 1, not v_p(p) = −1 or a ramified uniformizer normalization. | Added the two-term p² witness in both README and Lean; retained the existing p witness. The arbitrary-parameter signature also specializes to the explicit 0/1 case. |
| L0.16 agreement on units | With ‖x‖ = 1, v_p(x) = 0. Test x = 1, x = −1 at p = 2, nontrivial residue roots of unity, and principal units. Reduction of a unit to finite-order residue followed by the series gives the same value for both branches. | Added the unit Check and the Lean example for arbitrary branch parameters and every norm-one element of ℂ_p. |
| L0.17–L0.18 finite-extension comparison | Test K = ℚ_p, unramified K, and ramified K. If v_K(p) = e, v_K(x) = t and the residue field has q elements, then N = e(q − 1), m = t(q − 1) works. Here q ≥ 2, e ≥ 1, so N ≠ 0; at p = 2, q = 2 causes no division by zero. Principal units give the same series, and x = p gives zero for both normalizations. | Added a named comparison with exactly the finite-extension, homomorphism, series and normalization hypotheses. This does not require ℂ_p to be a local field. It makes no assertion for equal-characteristic DVRs, zero rings or characteristic-p fields. |
| L0.18 dyadic normalization | At p = 2, log₀(−1) = 0 by torsion and log₀(4) = 2 log₀(2) = 0. A branch with log_a(2) = a instead gives log_a(4) = 2a. | Added the dyadic Check and the explicit ℂ_[2] Lean example. The series condition alone does not normalize the value at p. |
| L0.18 odd-prime specialization | At p = 3, 63 = 3² · 7, hence log₀(63) = 2 log₀(3) + log₀(7) = log₀(7). | Retained the README Check and added its explicit ℂ_[3] Lean example. |
| Retained numerical Check L0.15 | Exact rational summation of the first 12 terms of log(1 + 3), reduced modulo 3¹², gives 303798, equal to 3 + 2·3² + 3³ + 2·3⁵ + 2·3⁶ + 3⁸ + 2·3¹⁰ + 3¹¹. For n = 13 the next term has valuation 13; for n ≥ 14, 3^(n−11) > n implies n − v₃(n) ≥ 12. | Independently recomputed the preserved value. This is a worked Check with a tail bound, not a dependency on a computational roadmap. |

Ranks, modules, ideals and compactness parameters do not occur in these touched branch signatures. Characteristic p and the zero ring do not instantiate `PadicComplex` at a prime; p = 0 and p = 1 fail the standing primality hypothesis. No newly touched statement silently quantifies over those cases.

## Sources and library boundary

All descriptions above are in this worker's own words. Public source versions read on 2026-10-17:

| Source | Passages checked | SHA-256 of PDF |
| --- | --- | --- |
| Hidekazu Furusho, [p-adic multiple zeta values I, v2](https://arxiv.org/pdf/math/0304085v2) | §2.1, printed p. 7: logarithm branches, their normalization and local derivative. | `fd2391bd4dbf328667f0fb1b46d979c4814892c2c2cd14051de8d674d4c5b9fb` |
| Joaquín Rodrigues Jacinto and Chris Williams, [An introduction to p-adic L-functions, v2](https://arxiv.org/pdf/2309.15692v2) | Definition 5.18 and Remark 5.19, printed p. 35: arithmetic L-function normalization; Theorem 6.1, p. 36 and its proof, p. 38: the logarithmic formula and primitive. The comparison interface is the explicit uniqueness consequence of L0.14–L0.17, not a claim that RJW states that interface verbatim. | `efa1e10168fb092ffb072bbf147f85f07bea72d2a8f4907d6e9e4fd559c039c4` |

At the pins (Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`), the imported `TauCeti.Analysis.Normed.Algebra.LogOneAdd.Basic` was read: it provides the series already used here; its existing radius theorem has a continuous ℚ≥0-scalar-action hypothesis. The shared build's module matches that pinned source. No substitute logarithm series is introduced.

The current read-only roadmap checkout (`0d144d044dacebca17b654695b6f1ad58f159b27`), including Completed, and current library (`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`) were searched for the affected branch objects and normalization. Read `TauCeti/NumberTheory/LocalField/Logarithm.lean`, including `TauCeti.hasSum_log_of_mem_unitFiltration_one`: its local-field logarithm has the principal-unit series on finite extensions. This is already acknowledged in Scope. It is not a branch on ℂ_p; no existing target was removed or replanned by this fix. The reviewed coverage audit and the upstream LocalGaloisGroups and ArithmeticDirichletSeries packages were also consulted.

## Validation and continuation

- `lean-check research/blueprint/packages/ColemanIntegration/Suggested.lean`: exit 0; 73 warnings, all `declaration uses sorry`; no other diagnostics.
- `python3 scripts/check_blueprint.py research/blueprint/packets/ColemanIntegration.json`: exit 0; 177 nodes, 257 packet API items, 134 packet tests; zero errors and warnings. The packet is unchanged.
- `python3 scripts/check_sorry_data.py research/blueprint/packages/ColemanIntegration/Suggested.lean`: exit 0. The file has 644 lines, real-bodied light definitions, no `lemma`, `True` placeholder or `#print axioms`.
- Mechanical preservation comparison against the base: all 197 target headings, all 394 original API bullet entries, all 65 original Checks headings, and all 48 named Lean declarations remain. There are now 395 API entries, 66 Checks headings and 46 Lean examples (formerly 39).
- Exact rational arithmetic confirms the retained log₃(4) value and the tail estimate above.
- All four deliverables pass the intake file check; `git diff --check` passes.

No unresolved finding from the issue's manager instructions remains. The independently constructed Dirichlet logarithm belongs to that package's parallel fix; this submission changes only Coleman's side of the interface. No second job was claimed, and no checkpoint or follow-up implementation is required for #10180.
