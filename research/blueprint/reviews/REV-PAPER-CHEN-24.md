# Review: PAPER-CHEN-24 (W. Y. Chen, Nonabelian level structures, Nielsen equivalence, and Markoff triples)

Job `REV-PAPER-CHEN-24` (issue #1074), by Claude Code, session `cc-39fac3`, 23 September 2026. The extraction was written by session `cc-7b31c4`. **Verdict: accept**, after the corrections below, which were made in place. All six routes are accepted.

## What was read

- **arXiv v2** (19 June 2021, 96 pp.; the same PDF as the extraction, SHA-256 f60283b0…) and its TeX source, read in full again. The published version, Ann. of Math. 199 (2024), 301–443, is paywalled and was not available.
- **Method:**
  - Two checkers split the paper (§§1–3 with the background items; §§4–6). Each compared every item with the text and TeX, listed uncovered results and recorded mistakes checked on page images.
  - I verified the substantive findings myself:
    - Theorem 1.1.2 and Theorem 2.5.2(4) in the TeX, and the S₃ counterexample;
    - the proof of Lemma 4.12.2;
    - E1, by recomputing the γ₀-orbits on 𝕏*(p) for p ≤ 31;
    - the Meiri–Puder constant, Theorem 5.5.9's hypothesis and the D_{2k} count.
  - I checked every library citation at Mathlib 082e2d3 and Tau Ceti f790474, and every stage id.
  - McCullough–Wanderley (Glasgow Math. J. 55 (2013)) was read for Conjecture 1.1.4.

## Changes made to the extraction

- **Statements (51 corrected):** 3, 4, 7, 16, 17, 21, 24, 26–31, 34, 35, 41, 47, 49, 52–55, 57, 58, 60, 62, 65, 68, 71–74, 78, 81–83, 85, 90, 91, 93–96, 101, 102, 104, 105, 107, 109, 110, 112. The note of each says what changed. The material ones:
  - **4:** the factor 2 is gained when ϕ∘γ_{−I} ≠ ϕ. The item copied the paper's reversed condition (E3).
  - **7:** the T-classification conjecture uses the weak trace invariant for non-exceptional q, and [MW13] verified it for q ≤ 101 (E5).
  - **16:** the prime must satisfy p ≥ 5, not merely be odd.
  - **71:** φ(k)/2 copies, not φ(k)²; and d′ = 1.
  - **94:** the Meiri–Puder constant is 32√(p+1), not (3/2)√(p+1).
  - **95:** the hypothesis is ord_ℓ(q(q²−1)) = r+s; the item's q(q−1) version fails at q = 13.
  - **96:** the item repeated the E1 count.
  - **65:** I(G) is taken over generating pairs only.
  - **78:** Tr_* is not injective.
  - **101 and 102:** hypotheses added to Lemma 6.1.3 and Proposition 6.1.4.
  - **Missing base field:** items 3, 17, 52 and 54–55 lacked the standing base (k algebraically closed of characteristic 0), and items 26 and 29–30 lacked the invertibility of |G|.
- **Locators (40 corrected):** most on pp. 42–89, where the extraction's pages were one or two off. E1 and E2 are on p. 83.
- **Statuses:**
  - **108 (library):** it cited `mathlib:EllipticCurve`, which names no declaration at 082e2d3. It now cites `WeierstrassCurve.IsElliptic` and `WeierstrassCurve.Δ`.
  - **110:** library → planned (InverseGaloisAndArithmeticFundamentalGroups:IG.3). The paper uses the algebraic Galois correspondence for three-point covers, which IG.3 plans, not the permutation-triple combinatorics that Tau Ceti has.
  - **107 (library):** restricted to what Mathlib provides (FreeGroup, FreeGroup.Red, MulAut). Nielsen's theorem Out(F₂) ≅ GL₂(ℤ) became item 123.
  - **Other citations:** checked and correct (items 106, 109, 111, and the planned stages).
- **New items (8):**
  - 116 Galois groups of the components of the reduced ramification divisor over a scheme (Proposition 2.2.6) (missing → NonabelianLevelStructures)
  - 117 Bounds on the obstructions d_X and m_X (missing → NonabelianLevelStructures)
  - 118 Prime-to-p fundamental group of a punctured elliptic curve (planned: IG.1)
  - 119 Rigidity of curves with many marked points and representability of M_{g,n} (missing → AlgebraicModuliForArithmeticGeometry)
  - 120 Level-one modular forms as sections of powers of the Hodge bundle; dim M₁₂(SL₂(ℤ)) = 2 (planned: R15.1, Tau Ceti ModularForms 10C)
  - 121 The level conics C₁(a)_t and the free action of rot₁ (missing → NonabelianLevelStructures)
  - 122 Sign twists and the PSL₂(F_p)-structures of trace invariant −2 (missing → NonabelianLevelStructures)
  - 123 Nielsen's theorem: Out(F₂) ≅ GL₂(ℤ) and Out⁺(F₂) ≅ SL₂(ℤ) (missing → NonabelianLevelStructures)
- **Routes and briefs:**
  - The NonabelianLevelStructures brief gained a paragraph of corrections its layers must respect:
    - Theorem 1.1.2's factor 2;
    - Lemma 4.12.2 for j ≥ 1;
    - p ≥ 5;
    - Tr_*;
    - Theorem 5.5.9;
    - the Meiri–Puder constant;
    - the §6.1 hypotheses.

    It also gained two imports: Nielsen's theorem and IG.1.
  - The ArithmeticDynamicsPartIIMarkoff route brief now restricts connectedness to p ≥ 5.
  - Routes 2 and 6 import from each other at different layers, which the design jobs must order: the congruence leads to finiteness of E_bgs, which leads to connectedness and the genus.
- **Summary:** the item counts and the source issues were updated.

## Mistakes in the paper (`sourceIssues`, E1–E38)

- **E1 and E2**, the extraction's two, are confirmed; both are on p. 83.
  - **E1:** only (3,3,6) is fixed by γ₀, so |𝔣⁻¹(0)| = (deg 𝔣 + 2)/3. The printed (deg 𝔣 − 3)/3 is never an integer.
- **E3–E38** are new, all recorded against arXiv v2. The published text could not be checked.
- **Errors affecting a stated result:**
  - **E3:** Theorem 1.1.2's last sentence is reversed. The mod 2ℓ^k strengthening holds when ϕ∘γ_{−I} ≠ ϕ. G = ℤ/2 or S₃ is a counterexample.
  - **E7 and E31:** Theorem 1.2.9 and Theorem 5.5.7(b) include p = 2, 3, for which the stacks are empty.
  - **E27:** Proposition 5.2.5 asserts that Tr_* is injective, but γ_{−I} and inner automorphisms act trivially.
  - **E36:** Lemma 6.1.3(c),(d) need m_R to be G-stable. Counterexample: R = k × k with the swap.
  - **E37:** Proposition 6.1.4 needs faithfulness on local rings, not only on fibres.
- **Gaps:**
  - **E10:** Lemma 2.4.1(a); the generic-finiteness step yields a stratification, not an open cover.
  - **E12:** Proposition 3.4.3(a), which lacks properness.
  - **E26:** Lemma 4.12.2 for j ≥ 1, where the proof gives only ℤ/ℓ^k × ℤ/ℓ^{k−2j}. So Corollary 4.12.5(a) is proved with j replaced by 2j.
- **Other errors (affecting nothing downstream):**
  - E4 is the p. 4 sentence behind E3.
  - E5: Conjecture 1.1.4 misstates [MW13].
  - E9: Proposition 3.2.2(a) needs e ≥ 2.
  - E13: the map M_{g,n} → M_g is not proper.
  - E25: for D_{2k}, d′ is 1, not 2.
  - E30: Lemma 5.3.1(3).
  - E32: the proof of Theorem 5.5.7(a) calls (3,3,3) fixed by Aut(Π); what is needed is a stabiliser element of determinant −1.
  - E34: the proof of Theorem 5.5.8 misdescribes 𝕄(F₃).
- **The rest are misprints**, among them:
  - E6: "genus ≥ 2 for p ≥ 11" should read p ≥ 13;
  - E8: a primitive r-th, not e-th, root of unity at nodes;
  - E20: G_m = A¹ − {0};
  - E29: the matrix of γ_∞;
  - E38: subfields, not divisibility, in Dickson's classification.
- **Effect:** none affects the Markoff results (Theorems 1.2.5–1.2.7), which use j = 0 and p ≥ 5.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-CHEN-24.result.json` reports no errors.
- `python3 research/blueprint/intake.py check-files` reports no problems.
- Every missing item is routed exactly once.
- Every planned and route stage id exists in the atlas.
