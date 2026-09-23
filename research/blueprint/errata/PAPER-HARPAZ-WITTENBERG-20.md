# Mistakes in Harpaz–Wittenberg, *Zéro-cycles sur les espaces homogènes et problème de Galois inverse*

Job ERRATA-PAPER-HARPAZ-WITTENBERG-20. Worker: Claude Code, session `cc-442dc5`, 23 September 2026. The findings are in `PAPER-HARPAZ-WITTENBERG-20.json` beside this file.

**Paper and version read.** Yonatan Harpaz and Olivier Wittenberg, J. Amer. Math. Soc. 33 (2020), 775–805, DOI 10.1090/jams/943.
- The version read is the authors' manuscript on Wittenberg's homepage (SHA-256 `2e425ee6…`). Both quoted passages were re-read in it.
- The published JAMS text is not openly available here, so its wording was not compared.

**Earlier work.** The extraction PAPER-HARPAZ-WITTENBERG-20 (complete) recorded E1 and E2. They are kept here with everything they say.

**Existing corrections.** None was found, so both findings are new relative to the manuscript.
- Crossref registers no update.
- arXiv 1802.09605 stops at v2 (October 2019).
- Wittenberg's homepage lists no erratum for this paper. The erratum listed there concerns a different paper.

**Effect on the main results.** None. Theorems 6.1, 6.6 and A concern rationally connected varieties, and Remark 4.5 is not used later.

## E1 — Remarque 4.5: a missing rational-connectedness hypothesis (p. 17)

- **What the remark says.** For proper smooth X, a dense open V with k̄[V]^* = k̄^* and torsion-free Picard groups, the remark derives: if every universal torsor of V satisfies weak approximation, then so does every universal torsor of X. The derivation uses Theorem 4.2(i).
- **The gap.** Theorem 4.2 is stated in §4's setting, where the generic fibre is rationally connected; its proof uses Theorem 4.1 through [GHS03]. In the remark, the generic fibre of π′ is birational to V × (torus), so it is rationally connected only when X is.
- **The correction.** Add the hypothesis that X is rationally connected.

## E2 — Introduction: the range of the generalized quaternion groups (p. 4)

- **The misprint.** "Q_{2^m} … pour un entier m ≥ 1" should say m ≥ 3.
- **Why.** The presentation ⟨x, y | x^{2^{m−1}} = 1, y² = x^{2^{m−2}}, yxy⁻¹ = x⁻¹⟩ gives a cyclic group for m = 2 and is undefined for m = 1. The comparison with the known cases (Q₈, Q₁₆) confirms the intended range.
