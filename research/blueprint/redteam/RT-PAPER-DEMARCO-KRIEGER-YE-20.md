# RT-PAPER-DEMARCO-KRIEGER-YE-20

Red team of the extraction PAPER-DEMARCO-KRIEGER-YE-20: DeMarco, Krieger and Ye, *Uniform
Manin–Mumford for a family of genus 2 curves*, Ann. Math. 191 (2020) 949–1001. The red team is
Claude Code, session `cc-c2c06b`, 30 September 2026, issue #4087. The extraction is by `cc-fb70e5`
and its review by `cc-442dc5`. I did neither.

**Result: 8 findings, 1 medium and 7 low.**

This is a careful extraction with a thorough review:
- **Statements.** Every numbered statement of the published version has an item, with the
  hypotheses the paper states.
- **Source issues.** The 13 recorded source issues all stand.
- **Route 1 has been carried out.** The accepted ArithmeticDynamics blueprint (#2884) has a node for
  each of the route's 34 items. That includes the archimedean escape rate and canonical measure, so
  DY.2's nonarchimedean wording did not strand them.
- **Route 2.** The same blueprint imports the Berkovich line, the Laplacian and the hybrid space from
  TB.0, TB.1 and TB.6, as route 2 intends. No second copy exists.

The findings are about library citations, a few unrecorded misprints, one prerequisite, and
bookkeeping.

## What I read

- **The published article.** 53 pages from the journal site, SHA-256 `7a4bd817…07df`, the file the
  review collated. I read §§1–2 and 7–9 in full, and the statements and the proof steps the items
  rely on in §§3–6.
- **arXiv v2.** SHA-256 `8fc51ac3…bab8`, as in the extraction, for the v2 locators.
- **Page images of pp. 990 and 993.** These matter. Text extraction drops the bars over letters, and
  on p. 993 it turns X(K̄) into X(K). I had noted a slip there, and the image showed there was none.
- **The repository at `9b6bba7`:**
  - the extraction, its review and review JSON;
  - PAPER-DEMARCO-MAVRAKI-YE-26;
  - the ArithmeticDynamics packet (415 nodes) and the TropicalAndBerkovichArithmetic packet (30
    nodes);
  - the stage texts of DY.0–DY.6, TB.0, TB.1, TB.6, RP.0 and RP.5 in the assembled atlas;
  - every other paper extraction, searched for the same machinery.
- **The libraries.** Mathlib `082e2d3` and Tau Ceti `f790474` at the declarations the items cite, and
  at the ones they should cite.

## Findings

**1. Item 10 says Mathlib lacks the absolute Weil height. It has it. (library-claim, medium)**
- The review's post-review correction set item 10 from library to planned. Its note says "the
  absolute height on ℙ¹(ℚ̄) used by the paper is not in the library" and that there is "no Q̄
  version".
- Mathlib at the pin defines `NumberField.absMulHeight₁` and `absLogHeight₁`
  (`Height/NumberField.lean:137`, `:146`). They are the absolute heights of an algebraic number in
  any field of characteristic zero, normalised through ℚ⟮x⟯.
- The accepted ArithmeticDynamics node DY.4/standard-adelic-height-is-the-weil-height uses exactly
  this as the Weil height on ℙ¹(K̄).
- What the library does lack is the absolute height of a pair, h(t₁, t₂) on 𝔸²(ℚ̄).
- **Fix.** Add a library item for the height on ℙ¹(ℚ̄). Restrict item 10 to the height of a pair,
  still planned at RP.0. The same wrong note is in DeMarco–Mavraki–Ye's item /7.

**2. Items 44 and 3 cite definitions for theorems. (library-claim, low)**
- §8.2 needs "x is a torsion image iff x is a root of a division polynomial". Item 44 cites only the
  definition `WeierstrassCurve.ψ`.
- The theorem in both directions is Tau Ceti's: `zsmul_eq_zero_of_evalEval_ψ_eq_zero` and
  `evalEval_ψ_eq_zero_of_zsmul_eq_zero` (`ZSMul.lean:1071`, `:1084`). Mathlib's DivisionPolynomial
  directory has only `Basic.lean` and `Degree.lean`.
- Item 3's "branched exactly over π(E_t[2])" is Tau Ceti's `addOrderOf_eq_two_iff_evalEval_ψ₂_eq_zero`
  (`:1128`).
- **Fix.** Cite these.

**3. Item 11: Tau Ceti's canonical height has a different normalization. (library-claim, low)**
- Tau Ceti's `canonicalHeight` is ½ lim h_K(x(2ⁿP))/4ⁿ, with h_K the unnormalised height over the
  number field K. So it equals [K:ℚ]·ĥ_{E_t}.
- The accepted node DY.6/lattes-map-canonical-height records exactly this factor.
- The review nevertheless says the Tau Ceti theorem "has the normalization ĥ_{E_t} = ½ ĥ_t∘π that
  §9.4 needs". That is false.
- **Fix.** The status can stay library for the zero-locus statement over a fixed K, but the note
  should state the factor and point to the DY.6 node.

**4. A missing r_v on p. 990 is not recorded. (missing, low)**
- The proof of Theorem 7.1 writes "2h(x) = Σ_v |log|x|_v|", without the weights r_v; I checked the
  page image.
- Without the weights the identity fails. For K = ℚ(√2) and x = 2 the unweighted sum is 3 log 2,
  while 2h(2) = 2 log 2.
- The review noticed this but did not register it. Item 10 prints the corrected form without citing
  a source issue.
- **Fix.** Record it as E14.

**5. "(singular) curve" on p. 951 is not recorded. (missing, low)**
- The lift C of the diagonal is singular only over the common branch values: there both projections
  ramify and C is a node, u² = w².
- With disjoint branch sets, which the conjecture's hypothesis allows, C is smooth of genus 5, by
  Riemann–Hurwitz with 8 branch values.
- The review also noticed this and did not register it.
- **Fix.** Record it as E15.

**6. The published-only proof of Proposition 9.2 leaves a gap. (missing, low)**
- The proof takes w to be any preimage in J(X) of (x₀, x₀). To prove the proposition, w must lie on
  j_Q(X).
- Such a w exists, because Φ ∘ j_Q(X) = (π × π)^{-1}(D) contains (P_{t₁}, P_{t₂}). Item 53's note
  makes this repair without recording it.
- **Fix.** Record it as E16.

**7. FRL10 is missing from the prerequisites. (missing, low)**
- The proof of Proposition 3.2 takes the tent-map action from Favre–Rivera-Letelier 2010, §5.1
  (p. 962). The proof of Proposition 3.5 follows the same computation (p. 965).
- The paper is not in the prerequisites, papers.json or any packet's sources.

**8. readSections is stale, and there is no `sourceVersions`. (other, low)**
- readSections still says the published version was not collated, although the review collated it.
- There is no `sourceVersions` list. The two hashes are known: `7a4bd817…` (published) and
  `8fc51ac3…` (arXiv v2).

## What held

- **Hypotheses.** Theorem 3.1's three ranges, Theorems 5.1–5.5 (including b = −log|s|/log|t| ≥ 1 in
  5.5), Theorem 7.1 (0 ≤ b < δ/2) and Theorem 8.1 all match their items.
- **Arithmetic I re-derived.**
  - α = 1/512 in Remark 6.4.
  - The (7.6) bookkeeping.
  - The review's corrected (7.5): coefficient 4, then +log 2 once E7's repair applies.
  - |Δ_t|^{1/6} ≥ |2|·min{1, |t(t − 1)|} in the potentially good range.
  - The Jacobi-model maps of Proposition 9.1 and their three common branch values.
- **Source issues.** E1–E13 stand. The ArithmeticDynamics packet re-records them as known, with the
  extraction's ids, so none is recorded twice.
- **The review's other "noted but not registered" slips.** None is a mistake:
  - the factor 16 in §9.3 is a valid, generous bound;
  - the doubled "on" on p. 997 is a typo, not a mathematical slip;
  - "∖ Diag" in (2.14) is harmless, read as the diagonal of type I points.
- **Duplication.** No other extraction routes the Arakelov–Zhang pairing, Berkovich potential
  theory, the hybrid space, Fili's metric or Zhang's inequality on ℙ¹ elsewhere. DeMarco–Mavraki–Ye's
  Yuan–Zhang items are different statements, and they go to a different Part II.
- **Route 3.** Its coalescence with the uniformity Part II, and its account of Proposition 9.1,
  match pp. 995–996.

## Validation

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-DEMARCO-KRIEGER-YE-20.result.json`: ok.
- No Lean was compiled.
