# Review: PAPER-CAI-FRIEDBERG-KAPLAN-24 (Cai–Friedberg–Kaplan, Doubling constructions: global functoriality for non-generic cuspidal representations)

Job `REV-PAPER-CAI-FRIEDBERG-KAPLAN-24` (issue #1086), by Claude Code, session `cc-39fac3`, 23 September 2026. The extraction was written by session `cc-442dc5`. **Verdict: accept**, after the corrections below, which were made in place. The one route, a Part II of AutomorphicLFunctionsAndLocalFactors, is accepted.

## What was read

- **arXiv v5** (20 May 2024, 60 pp.; "to be published in the Annals"; the same PDF as the extraction, SHA-256 dd49d944…) and its TeX source, read in full again. The published version, Ann. of Math. 200 (2024), 893–966, is paywalled and was not available.
- **Method:**
  - Two checkers split the paper (§§0–3; §4 and Appendix A). Each compared every item with the text and TeX, listed uncovered results and recorded mistakes checked on page images.
  - I verified the proof of Lemma 4.3 and Proposition A.10 in the TeX myself.
  - I checked the planned stages, the Part II title, and the other extractions that use the same Part II id.

## Changes made to the extraction

- **Statements (30 corrected):** groups, weak-transfer, speh, doubling-local, doubling-integral, local-factors, gamma-factor, langlands-quotient-poles, coarse-transfer, functional-T, Z2, Z1-nonvanishing, Z-over-sigma, intertwining-convergence, poles-local, eisenstein-series, M1M2, exponents, global-integral, completed-L, global-fe, bounded, coarse-local, gl-integral, gl-uniqueness, gl-multiplicativity, gl-L-factor, gl-langlands, gl-RS-divides, gl-poles. The note of each says what changed. Most restore missing hypotheses: the field, the groups, unitarity or genericity of τ, and Re(s) ranges.
  - **gl-RS-divides was reversed.** Proposition A.10 says that L^RS(s, π × τ)/𝔏(s, π × τ) is entire, where 𝔏 is the gcd of Theorem A.6. The items had written 𝔏 as "L", which the appendix reserves for the Rankin–Selberg factor.
  - **gl-poles** had dropped "(but may have a pole)".
  - **M1M2:** Lemma 4.3 needs the non-self-duality hypothesis of Theorem 4.1 (E11).
- **Statuses:** the two planned items (rs-factors AL.3, satake SR.4) and the missing ones were checked and are correct. The GL_N converse theorem of Cogdell–Piatetski-Shapiro is planned nowhere; the atlas plans only GL_2, in R16.5.
- **New items (30):**
  - **Planned (2):**
    - the global generalized Speh representation ρ_c(τ) (EndoscopicTransferAndUnitaryTraceComparison:ET.7a, which plans the GL_m residual-spectrum/Speh classification);
    - poles and non-vanishing of global Rankin–Selberg L-functions (AL.3).
  - **Missing (28), routed to the Part II:**
    - the quasi-character χ_π;
    - multiplicity one for the doubling integrals;
    - the normalised intertwining operator;
    - the Langlands classification for G_c and for GL_c;
    - the archimedean Langlands parametrisation;
    - Theorem 3.12 for k = 1 (Yamana);
    - the inductive realisation of the (k, c) functional;
    - matrix coefficients via intertwining integrals;
    - bounds for tempered matrix coefficients;
    - coarse transfers and supercuspidal support;
    - weak transfer of all automorphic representations;
    - twisted Euler products for the converse theorem;
    - the rank-one Siegel Eisenstein series;
    - the constant term of E_{τ,θ,c};
    - Mœglin–Waldspurger's regularity and square-integrability inputs;
    - the Speh–cuspidal intertwining normalisation;
    - holomorphy of b^S;
    - highly ramified twists;
    - globalisation of supercuspidals;
    - the Jacquet–Shalika classification;
    - the crude functional equation;
    - equivariance of (k, c) functions;
    - analytic properties and the ε-factor of the GL_c × GL_k integrals;
    - exponents of unitary generic representations;
    - Dixmier–Malliavin.
  - **Merged:** two duplicate proposals (Dixmier–Malliavin; the (k, c) functional) were merged.
- **Route and brief:**
  - **Shared Part II id.** PAPER-EISCHEN-HARRIS-LI-ETAL-20 routes to the same Part II id, `AutomorphicLFunctionsAndLocalFactorsPartIIDoubling`, under a different title. The brief now says the design job should adopt one title covering both. It also points to the neighbouring Speh-integrals Part II of PAPER-ATOBE-KONDO-YASUDA-22.
  - **Imports.** The brief now imports ET.7a and AL.3, and names what is built here: the GL_N converse theorem, the Langlands classifications, Dixmier–Malliavin, the Mœglin–Waldspurger inputs and Jacquet–Shalika.
  - **Corrections.** A closing paragraph lists the corrections the layers must respect: E1, (3.16), (3.18), Lemma 4.3, Theorem 4.10 and Proposition A.10.
- **Summary:** a closing sentence records the counts after the review.

## Mistakes in the paper (`sourceIssues`, E1–E18)

- **E1**, the extraction's, is confirmed.
  - The gap is real: Lemma 3.16, Theorem A.11 and the appendix's standing assumptions need τ unitary, while χ_π need not be unitary for GSpin.
  - The twist repair is correct; it is the same trick as Theorem A.6(4).
  - The only use is Theorem 3.12, with χ_π unitary.
  - Its quotation of Corollary 3.21, which begins "Assume that", was corrected.
- **E2–E18** are new, recorded against arXiv v5.
  - **E11 (error, the proof):** in the proof of Lemma 4.3, the roles of L(2s, τ × θ^{−1}τ) and L(2s + c′, τ × θ^{−1}τ) are swapped. Holomorphy of M_2(s) needs the first holomorphic and the second non-vanishing. The first needs Theorem 4.1's non-self-duality hypothesis.
  - **E13 (gap):** in the proof of Theorem 4.10, the central-character hypothesis of Theorem 3.10 is not checked at places in S.
  - **E15 (gap):** in the proof of Corollary 4.11, (3.9) is stated for quotients, but a subquotient is used.
  - **E5:** in (3.16) the condition should be a_d > r, not r/2; π = |det|²St on GL₂ = GSpin₃ shows the printed one fails.
  - **E6 and E7:** missing cases in the definition of the L-factor, and the quantifier over generic τ in (3.18).
  - **The rest are misprints:** Υ_{l−2r}, SO_0/SO_1 conventions, s_{k,c}, (A.22), and others.
- **Effect:** none affects the main theorems.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-CAI-FRIEDBERG-KAPLAN-24.result.json` reports no errors.
- `python3 research/blueprint/intake.py check-files` reports no problems.
- Every missing item is routed exactly once.
- Every planned stage id exists in the atlas.
