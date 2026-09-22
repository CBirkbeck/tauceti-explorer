# Mistakes in Smith, *Algebraic integers with conjugates in a prescribed distribution*

Job ERRATA-PAPER-SMITH-24. Worker: Claude Code, session `cc-fb70e5`, 22 September 2026. The findings are in `PAPER-SMITH-24.json` beside this file.

**Paper and version read.** Alexander Smith, Annals of Mathematics 200 (2024), 71–122, DOI 10.4007/annals.2024.200.1.2.
- **Read:** arXiv 2111.12660v2 of 16 March 2024 (SHA-256 `99b3855a…35a9`), the latest arXiv version and the one the extraction used. Every passage below was re-read there on the page images.
- **Not collated:** the published text.

**Earlier work.** The extraction PAPER-SMITH-24 (partial) noted all five. Several of its other "source checks" were not recorded:
- **p.9:** the discriminant is defined "determinantally", as the fixed-size Sylvester resultant, which does vanish when the degree drops, so the argument is right.
- **p.36:** the singleton-component point depends on the standing hypotheses on Σ and was not established as a mistake.
- **BLPS numbering:** this concerns a cited paper.
- **Remark 5.14's congruence:** this is a citation that still needs checking, not an error found.

**Existing corrections.** None was found:
- Crossref registers no erratum;
- v2 is the latest arXiv version;
- a web search found nothing.

**Effect.** None of these affects the theorems. Four are misprints: a "least" that should be "greatest", a missing absolute value, a missing sign condition and a missing mass factor. One is a small gap in the proof of Theorem 5.11.

## E1. λ_SSS is a greatest, not a least, number (misprint)

On p.1, λ_SSS is "the least real number" such that for every ε > 0 only finitely many totally positive α have tr(α) < (λ_SSS − ε) deg(α). If λ has this property, so does every smaller number. The set has no least element, and the constant meant, bounded by 1.793145 ≤ λ_SSS ≤ 2, is its supremum.

## E2. |P| = exp(−nU) (misprint)

On p.11, "P_{n,μ}(x) = exp(−nU^{μ_n}(x))" should read |P_{n,μ}(x)|. The polynomial takes negative values between its real roots.

## E3. The successive minima are nonnegative (misprint)

Proposition 3.4 defines λ_i as "the least real number so λ_i K contains at least i + 1 linearly independent integer polynomials". K is symmetric, so negative λ qualify too. The successive minima of Minkowski's theorem are the least nonnegative such λ.

## E4. A missing mass factor in (5.5) (misprint)

For a finite measure μ, integrating Lemma 5.2's bound gives U^{μ∗ν_ε} − U^μ ≤ μ(Σ) log(…), not log(…). The paper states the setting for any finite Borel measure but applies it only to sub-probability measures, where the printed bound follows.

## E5. Zero coefficients in the proof of Theorem 5.11 (gap)

**The gap.** λ_Smyth is defined with positive coefficients a_i, but the separation argument yields only a_i ≥ 0. The proof then handles roots x of the Q_i by saying "the right is −∞". That fails when every Q_i vanishing at x has a_i = 0: the term is 0 · (−∞), and δ_x lies outside the class of measures being separated.

**Repair.** Discard the zero-coefficient polynomials. Use continuity at non-isolated points of Σ. At isolated points, perturb with a small positive coefficient, at a small cost in λ.
