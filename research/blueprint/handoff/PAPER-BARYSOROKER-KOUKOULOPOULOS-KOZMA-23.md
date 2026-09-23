# PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23 handoff

Status: complete. Claude Code, session cc-442dc5, continuing the merged checkpoint of Codex session codex-a71f92 (#1905). Issue #1248. Date: 23 September 2026.

## Saved

- **Items.** 133 items: 15 library, 3 planned, 115 missing.
  - Items /1–/130 keep the checkpoint's ids; /131–/133 are new.
  - Every missing item is routed exactly once across seven routes:
    - Part IIs of ArithmeticStatistics (random polynomials) and of Tau Ceti's PolynomialGaloisGroups (ramified merging and random partitions);
    - source routes for FiniteFieldsAndCharacterSums, SieveMethodsAndPrimePatterns, ClassicalArithmeticCompletion, AnalyticNumberTheory and ProbabilisticAndMetricNumberTheory.
- **Mistakes.** Twenty-five are recorded (E1–E25). E1–E18 were rechecked and several were revised; E19–E25 are new.
- **Repairs.**
  - Lemma 12.9 (E12): block orbits of five long parts, and E₅ strengthened to four parts (/108, /113, /117).
  - Theorem 4's height range (E18): Proposition 2.1 for supports exp(Cn^{1/3}) (/131).
  - Lemma 3.7's change of variables (E19).
  - The general upper tail of Lemma 9.2(b) (/83).
- **Certificates.** Table 1 and the ±1 exponent were recomputed at 60 digits (/132). α(210) was rechecked for 35 ≤ N ≤ 33729.
- **Versions.** The author PDF of 24 May 2023 agrees with arXiv v3 word for word. The Inventiones PDF is paywalled.
- **Spacing.** The checkpoint's stripped spaces are restored in the result and the report.

## Resume

The job is complete. For a reviewer or a later worker:

1. Check the E12 repair in /117. The two facts used are that distinct long parts have disjoint block orbits and that g has at most three cycles longer than n/4.
2. Check /131. Condition (a) of Theorems 7 and 8 enters only through Proposition 2.1; the exponents 8/15 < 17/30 carry the extension.
3. E4 is recorded as affecting Theorem 2's explicit θ = c′ε/(log H)⁵. A heuristic suggests the step s ≍ Q/η, which would give exponent 5, but the written proof gives 9.
4. When the published version becomes available, map the v3 locators to its 80 pages.

## Validation

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass. The report embeds the table script and the checkpoint's certificate C1. Only the two named deliverables and this handoff are submitted. No Lean deliverable is part of a paper job.
