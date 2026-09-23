# REV-ERRATA-PAPER-SMITH-24 — review of the mistakes recorded in Smith (Annals 2024)

**Verdict: all five recorded findings confirmed. Two more were added (E6, E7).** Reviewer: Claude Code, session `cc-442dc5`, 23 September 2026. The errata job and the extraction were done by session `cc-fb70e5`, and this reviewer did neither.

**Source.** Alexander Smith, *Algebraic integers with conjugates in a prescribed distribution*, Annals of Mathematics 200 (2024), 71–122, DOI 10.4007/annals.2024.200.1.2.
- **The version read.** arXiv 2111.12660v2 (16 March 2024, the latest version) was fetched on 23 September 2026. Its SHA-256 `99b3855a…35a9` matches the errata file's.
- **Coverage.** The whole paper (47 pages) was read, so that missed mistakes could be looked for, not only the five locators.
- **The published version.** Unpaywall reports the article as closed, with no open copy besides arXiv.
- **Existing corrections.** Crossref registers no erratum, and v2 is the latest arXiv version.

**Checks run.** `python3 scripts/check_errata.py research/blueprint/errata/PAPER-SMITH-24.json` reports `ok`.

## The recorded findings

- **E1 (misprint, nothing): confirmed.** On p.1, "least" should be "greatest".
  - The property defining λ_SSS passes to every smaller λ, so there is no least such number.
  - Its supremum has the property: given ε, take a λ in the set within ε/2 of the supremum.
- **E2 (misprint, nothing): confirmed.** On p.11, −nU^{μ_n}(x) = log|P_{n,μ}(x)|, so the identity needs the absolute value. (2.8), which the sentence proves, already has it.
- **E3 (misprint, nothing): confirmed.** In Proposition 3.4, K is centrally symmetric, so λK = |λ|K and the minimum must be over λ ≥ 0.
- **E4 (misprint, nothing): confirmed.** In (5.5), integrating Lemma 5.2(2) against μ multiplies the constant by μ(Σ).
  - The constant is log((1 + 2√ε + ε)/(1 − ε)) > 0, so the printed bound holds for μ(Σ) ≤ 1.
  - Every use (Proposition 5.7, and μ_± on p.36) has mass at most 1.
- **E5 (gap, the proof): confirmed.** The separation theorem gives a_i ≥ 0, and at a root of a Q_i with a_i = 0 the printed "−∞" argument fails, since δ_x ∉ M_N. The recorded repair works:
  - discard the zero coefficients;
  - use continuity at non-isolated points of Σ;
  - at isolated points, add η log|Q_i| for a small η > 0. This costs O(η) on compact parts, and the growth condition (5.11) absorbs it elsewhere.

## Added

- **E6 (error, nothing).** The proof of Proposition 2.5 (p.36) decomposes Σ into "its set of isolated points" and an increasing union of compact finite unions of intervals. A one-point component need not be isolated.
  - **Counterexample.** Σ = {0} ∪ ⋃_{n≥1}[1/(2n+1), 1/(2n)] ∪ [1, 6] meets the proposition's hypotheses: countably many components, and capacity ≥ 5/4. Yet 0 is neither isolated nor in any finite union of intervals inside Σ.
  - **Correction.** Use the one-point components, a countable set, which is all the argument needs.
  - **History.** The extraction had flagged this point. The errata job set it aside as depending on the standing hypotheses, but the example satisfies them.
- **E7 (misprint, nothing).** In the same paragraph, "since I(μ) > −∞" should be "since I(μ) < ∞".
  - With the paper's convention I(μ) = ∫∫ −log|z − w|, it is finite energy from above that prevents mass on capacity-zero sets, and I(μ) ≤ 0 (Proposition 5.7) supplies it.
  - The printed condition holds for every compactly supported measure. It is the condition of Ransford's opposite sign convention.

## Also checked, and correct

- **Example 5.16, the numerical heart of Theorem 1.1.** Recomputed with the rounded parameters a = 0.087353, b = 4.411076, γ = 0.215485, at 40-digit precision:
  - C = −1.2859·10⁻⁷ < 0;
  - ∫ log|x| dμ = 1.4513·10⁻⁶ > 0;
  - ∫ x dμ = 1.8983031 ∈ (1.898303, 1.898304).

  Quadrature confirms U^μ(z) + γ log|z| = C on [a, b] to 10⁻³⁰, and U^μ(z) + γ log|z| < C off it. So the hypotheses of Proposition 5.15 hold, with Q₁ = z and a₁ = γ.
- **Lemma 2.3's constant.** C₀(η⁻¹ + 2(1 − η)⁻¹ + log 3).
- **Proposition 3.5's energy identity.**
- **Lemma 3.8's final exponent.** The dropped factor exp((n − m/2)I(μ)) is absorbed into n^{−Cn}.
- **The Eisenstein step in §4.1.**
- **Lemma 4.5's parity adjustment and Lemma 4.7's bounds.**
- **Lemma 5.2.** Checked via (5.2)–(5.4).
- **The principle-of-domination steps in Lemma 5.10 and the proof of Proposition 2.5.**
- **Proposition 5.13's shift by 2√q.**
- **A remark on Corollary 3.7.** Proposition 3.6 gives min_i ‖w^n Q_i‖ ≤ n^C exp(n²I(μ)/(2(n + 1))). That is at most n^C exp(nI(μ)/2) only when I(μ) ≥ 0, but the case I(μ) < 0 is the conclusion itself. So the proof is sound, and nothing is recorded.

## Changes made

- **`PAPER-SMITH-24.json`.**
  - A `review` object (verdict, reason, by) was added to E1–E5.
  - E6 and E7 were added, with verdicts.
- **`PAPER-SMITH-24.md`.**
  - A review note was added, pointing out that the "p.36 singleton-component point" it had set aside is E6.
  - Explanations of E6 and E7 were added.
