# Review: PAPER-JIANG-ZHANG-20 (Jiang–Zhang, Arthur parameters and cuspidal automorphic modules of classical groups)

Job `REV-PAPER-JIANG-ZHANG-20` (issue #1124), by Claude Code, session `cc-39fac3`, 23 September 2026. The extraction was written by session `cc-d67081`. **Verdict: accept**, after the corrections below, which were made in place. All seven routes are accepted.

## What was read

- **The published version**, Ann. of Math. 191 (2020), 739–827, 89 pp., read in full. It is free on the Annals site (SHA-256 c016d972…). The extraction had read arXiv v4 only.
- **Method:**
  - Two checkers split the paper (§§1–4; §§5–7 with the appendices). They compared every item with print and with the v4 TeX, gave each its published locator, and recorded mistakes checked on page images.
  - I verified the Theorem 5.7 finding myself on p. 791.
  - I checked the planned stages and the routes. The Gan–Gross–Prasad roadmap is proposed under the same id and title by five other extractions.

## Changes made to the extraction

- **Locators:** all 78 items now give the published section, number and page (journal page = PDF page + 738), followed by the arXiv v4 page.
- **Statements (25 corrected):** relevant-pairs, bessel-uniqueness, bessel-periods, arthur-parameters, bessel-modules, prop-2-2, explicit-bessel-data, lemma-2-4, prop-2-5, global-zeta-integral, bessel-functional-factorization, whittaker-induction-map, local-l-factor, zeta-integral-formula, special-data, thm-5-3, bessel-normalization, prop-5-6, prop-6-3, thm-6-6, twisted-descent, partitions-p-phi, thm-7-1, grs-descent, soudry-nonvanishing. The fixes include:
  - dropped complex conjugates in the periods;
  - the parity conditions on the Arthur parameters;
  - the hypotheses of (4.49);
  - 𝔪 written as m;
  - index slips.

  Print renumbers (A.8) as (A.9) and rewords Proposition 5.5.
- **Statuses:** the planned items check against their stages.
- **New items (10):**
  - **Planned (1):** global Arthur packets of pure inner forms and relevant parameters (ML.4).
  - **Missing (9):**
    - 5 to TwistedAutomorphicDescents: the generalized Bruhat decomposition, the inner Bessel datum, holomorphy of tempered local L-factors, holomorphy of the ramified normalizing factors, and Jiang–Liu–Savin's Bessel non-vanishing;
    - 3 to AutomorphicSpectralTheory: the normalized GL × GL intertwiners, standard intertwiners for tempered data, and CKPSS normalized intertwiners for generic data;
    - 1 to GanGrossPrasad: automorphic members of generic global packets are cuspidal.
- **Brief:** the TwistedAutomorphicDescents brief gained a corrections paragraph.
- **Summary:** a closing paragraph records the counts after the review and the main finding.

## Mistakes in the paper (`sourceIssues`, E1–E26)

- **E1–E5**, the extraction's, are all confirmed and still present in print.
  - **E3:** print cites the joint work with Soudry as [43], "in preparation".
  - **E4:** the generic even orthogonal case is now proved by Chen–Zou (arXiv:2103.07956).
- **E6–E26** are new.
  - **E26 (gap, stated result): Theorem 5.7 for unitary groups.** The proof shows L(s, τ × σ^∨) is holomorphic and non-zero at 1/2, then adds "and so is L(s, τ × σ)" with no argument.
    - For unitary groups these are different central values: L(1/2, τ × BC(σ)^c) against L(1/2, τ × BC(σ)). For GL₁ they are L(1/2, χμ) and L(1/2, χμ⁻¹).
    - The argument proves the statement with σ^∨, which matches the paper's sesquilinear Bessel period. For orthogonal groups nothing changes.
  - **Errors:**
    - E7: Proposition 2.5 needs y_κ, not y_{−κ}; there is a counterexample over Q, and the authors' commented-out TeX agrees.
    - E12: the ℓ = 0 Bessel module is used inconsistently with its definition.
    - E21: Section 7.2's "without (H_m, σ)" fails for U_{2n}, though Corollary 7.2 still holds.
  - **E22:** a gap in the v4 proof of Proposition 5.6, which print repairs. It is recorded as known: corrected in print.
  - **The rest are misprints.** Some are new in print: "general" for "generic" (p. 753), "greatest common denominator" (p. 780), and As ⊗ ξ^m (p. 780).

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json` reports no errors.
- `python3 research/blueprint/intake.py check-files` reports no problems.
- Every missing item is routed exactly once.
- Every stage id exists in the atlas.
