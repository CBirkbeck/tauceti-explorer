# Review: PAPER-NGODAC-21 (Tuan Ngo Dac, On Zagier–Hoffman's conjectures in positive characteristic)

Job `REV-PAPER-NGODAC-21` (issue #1112), by Claude Code, session `cc-39fac3`, 23 September 2026. The extraction was written by session `cc-442dc5` and Codex sessions `a71f92` and `c83e7a`. **Verdict: accept**, after small corrections made in place. All six routes are accepted.

## What was read

- **The HAL manuscript** hal-03298790v1 (29 March 2021, 26 pp.; the same PDF as the extraction, SHA-256 f6bf74f1…), read in full again. The Annals version, 194 (2021), 361–392, is paywalled.
- **Method:**
  - Two checkers split the paper (§§1–3; §§4–6).
  - They consulted Chang 2014 (arXiv 1207.2326v4), Chang–Papanikolas–Yu 2019 (arXiv 1411.0124v2) and Thakur's published updates for the cited results.
  - They ran the algorithm behind Theorem A on every index up to weight 6 for q = 2 and weight 7 for q = 3, 4, 5. All 444 outputs lie in T_w and agree numerically in K∞. The dimension counts, (2.1) and R₁ were also checked.
  - I checked every library citation at Mathlib 082e2d3 and Tau Ceti f790474, every stage id, and the Part II title. The title is shared exactly with PAPER-CHANG-CHEN-MISHIBA-23 and PAPER-IM-KIM-LE-ETAL-24.

## Changes made to the extraction

- **Statements (7 corrected):** mixed-product, B-operation, C-operation, omega, MZ-weight-separation, prefix-difference-zero, period-power.
  - **mixed-product** lacked the bound c′ ≤ a₋ + b of (2.7), which Lemma 2.9 needs.
  - **B-operation and C-operation** must use the fixed expansions of p. 8 to be well-defined maps.
  - **omega** omitted its simple zeros at θ^{q^k}.
  - **prefix-difference-zero** said "suffix" where the paper means "prefix".
- **Locators (13 corrected):** infinity, chen-coefficient, BC-operation, initial-prefix, finite-rank, entire-ring, L-frobenius-specialize, MZV-property, prefix-Phi, prefix-Psi, normalized-lift, prefix-difference-zero, BC-support. The manuscript has no Lemma 2.11 and no §2.4; (4.1) should be (5.4); and ABP §2.2 should be §2.4.
- **Test:** the chen-coefficient test is wrong. At q = 3, Δ₂(2, 2) = 1, not 2.
- **Statuses:** the library citations all exist at the pinned commits:
  - `RatFunc.inftyValuation`, `RatFunc.CompletionAtInfty` and `inftyValuation.X`/`X_inv`;
  - `PowerSeries.IsRestricted`, `isRestricted_iff'` and `IsRestricted.subring`;
  - `SkewPolynomial` with `monomial_mul_monomial`;
  - `FiniteField.sum_pow_units`;
  - Tau Ceti's `Divisor.dim_eq_degree_add_one_sub_genus_of_two_mul_genus_sub_one_le_degree`.

  The planned stages check.
- **The extraction's own derivations and repairs:** all 13 are sound. They are family-count, depth-one-product, large-entry-reduction, finite-rank, ABP-lifting, constant-denominator, degree-descent, next-weight-relation, explicit-partial-fractions, monic-pair-reindex, monic-frobenius-descent, theta-degree-bound and integral-monic-quotient.
- **New items (4):**
  - the calculus of prefix dominance (missing, Part II);
  - the canonical power-sum product expansions (2.2)–(2.4) (missing, Part II);
  - the prefix and suffix closure of the families (missing, Part II);
  - the twist-fixed field of the fraction field of the Tate algebra (planned, DM.8).
- **Summary:** a closing sentence records the counts after the review.

## Mistakes in the paper (`sourceIssues`, E1–E16)

- **E1–E12**, the extraction's, are all confirmed.
  - E10 is reclassified to "affects nothing".
  - E9 is known, from Thakur's updates, entry 36.
  - E4 is confirmed against ABP (arXiv math/0207168): Theorem 4.2 as restated needs c ≠ 0. The paper's actual matrices have c = 1.
  - E11 stands whether or not Kuan–Lin state it in A[t]; Kuan–Lin is paywalled.
- **E13–E16** are new:
  - two misprints, on printed pp. 4 and 7;
  - the proof on p. 21 cites (4.2) where it uses (5.4);
  - Step 3 of the proofs of Theorems B and D does not treat a one-term relation. That case is trivial by non-vanishing.
- **Effect:** the gaps have verified repairs, and Theorems A, B, D and Corollary C stand.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-NGODAC-21.result.json` reports no errors.
- `python3 research/blueprint/intake.py check-files` reports no problems.
- Every missing item is routed exactly once.
- Every stage id exists in the atlas.
