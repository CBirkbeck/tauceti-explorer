# REV-RT-PAPER-GROECHENIG-WYSS-ZIEGLER-20

Independent verification of the red team RT-PAPER-GROECHENIG-WYSS-ZIEGLER-20 (Codex, session `codex-rtOQ9t`, PR #5422) on
the extraction PAPER-GROECHENIG-WYSS-ZIEGLER-20 (Groechenig–Wyss–Ziegler, *Mirror symmetry for moduli spaces of Higgs
bundles via p-adic integration*, Invent. Math. 221 (2020), 505–596), for issue #4169.

Verifier: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write:
- the extraction (`cc-39fac3`, PR #2013);
- its review REV-PAPER-GROECHENIG-WYSS-ZIEGLER-20 (PR #2524);
- the red team.

None of the findings cites work of mine.

**Result: all six findings confirmed.** /1–/4 and /6 are high and /5 medium. None refutes the main mirror-symmetry theorem.

## What I read

- **The paper.** The published open-access PDF (<https://doi.org/10.1007/s00222-020-00957-8>), SHA-256
  `f2231145…3e07`, equal to the extraction's. I read:
  - Lemma 2.7 (pp. 516–517);
  - Definitions 2.13 and 2.14 (pp. 522–523), with the page images of (4) and Definition 2.14(b);
  - Lemma 3.7 (p. 531);
  - Theorem 7.23 and its proof (p. 589).
- **The extraction.** Items /9, /13, /15, /23, /66 and /76, and E1 and E12.

## The findings

- **/1 (high): Lemma 2.7(a).** Ordinary central extensions over Y ignore the Γ-action on Y. For C₂ acting freely on
  Y = C₂ there are four such extensions of C₂ by μ₂, but H²([Y/Γ], μ₂) = H²(pt, μ₂) = 0.
- **/2 (high): Lemma 2.7(c).** The surjection onto Ext¹ over k̄ takes no Galois invariants. For k = R, Γ = C₃ and
  A = μ₃, H²([pt/C₃], μ₃) = H²(C₃, μ₃)^{C₂} = 0, because conjugation inverts μ₃, while Ext¹_C(C₃, μ₃) ≅ C₃.
- **/3 (high): Definition 2.14(b).** The point-count side omits the weights 1/|Aut(x)|. For BC₂ over F₃ the printed sum
  is 2, but the trace is 1.
- **/4 (high): Lemma 3.7.** The second factors do not always pair to zero. For F = Q₃ and Γ = C₂, the class −3 lies in
  the second factor, but (−3, −3)₃ = (−3, −1)₃ = (−1/3) = −1.
- **/5 (medium): Theorem 7.23.** Purity plus equal point counts gives only isomorphic semisimplifications. The Frobenius
  actions I₂ and J₂ are pure with equal traces but not isomorphic.
- **/6 (high): unapplied corrections.**
  - **Item /66** still states the printed sign "(as printed)" that E12 corrects.
  - **Item /15(c)** still states the s-independence that E1 shows fails for q = p^k.
  - §18 requires corrected statements in items.
