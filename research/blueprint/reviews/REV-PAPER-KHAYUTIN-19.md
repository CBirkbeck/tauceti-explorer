# Review: PAPER-KHAYUTIN-19 (Khayutin, Joint equidistribution of CM points)

Job `REV-PAPER-KHAYUTIN-19` (issue #1132), by Claude Code, session `cc-39fac3`, 23 September 2026. The extraction was written by session `cc-7b31c4` (PR #1956). **Verdict: accept**, after the corrections below, which were made in place. All five routes are accepted: the four original ones, and one added by the review.

## What was read

- **The published article**, Ann. of Math. 189 (2019), 145–276, read in full. It is the journal's free PDF (https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n1-p04-s.pdf, 132 pages, SHA-256 f22691429c27058f…).
- **arXiv v3** (TeX), which the extraction read. No statement changed between v3 and print. The Annals edition renumbers statements by section (Theorem 14 → Theorem 3.2, Proposition 175 → Proposition B.8, …) and writes 𝔡 for Denom and 𝒥 for Ideals.
- **Method:** two independent checkers each covered half of the items against the published text, with page images for every quoted mistake. I checked the statuses and routes against the atlas myself.

## Changes made to the extraction

- **Locators (111 items):** each now gives the published section, statement number and page, followed by the arXiv v3 number.
- **Statements (59 items corrected).** Each changed item's note says what was wrong. The most important:
  - Items 18 and 24 (Theorems 3.2 and 3.10) had dropped the bounded-conductor hypothesis f_i ≪ 1. Item 18 had also dropped g_∞^{-1}T(R)g_∞ = K_∞ and paraphrased the genericity condition.
  - Item 21 claimed convergence where the paper describes only limit points.
  - Item 15 had the wrong 𝒥(Λ)_0.
  - Item 41 had the wrong archimedean denominator.
  - Item 56 had a wrong condition (3).
  - Items 59, 67 and 69 had wrong descriptions of f_[𝔤], B′_f and the value set of the invariant map.
  - Other items had wrong constants, ranges or hypotheses in §§9–10 and Appendix B.
- **Statuses:**
  - Item 8 changed from planned to missing: AA.4 plans strong approximation, not the reduced-norm description of G(A)/G(A)^+.
  - Library pointers were recorded in notes without changing status: Mathlib `MvPolynomial.schwartz_zippel_totalDegree` (item 76), `ArithmeticFunction.cardFactors` (item 78), and `ZMod.χ₄`, `ZMod.χ₈`, `legendreSym` and `quadraticChar` (item 105).
  - Partial coverage by the Tau Ceti Multiquadratic layer 3 was noted for the maximal-order cases of items 102, 104 and 106.
- **New items (13),** from a coverage check of the published text:
  - PAPER-KHAYUTIN-19/112 Special places and the standing normalisation (♠) → PART
  - PAPER-KHAYUTIN-19/113 Maximal rational tori of B^× and of G → PART
  - PAPER-KHAYUTIN-19/114 The class group of a packet and its identification with Pic(Λ) → HE
  - PAPER-KHAYUTIN-19/115 Volume of a homogeneous toral set → PART
  - PAPER-KHAYUTIN-19/116 The coboundary map and Hilbert 90 → PART
  - PAPER-KHAYUTIN-19/117 A split local quaternion algebra as End_{Q_v}(E_v) → PART
  - PAPER-KHAYUTIN-19/118 Volume of a homogeneous Hecke set → PART
  - PAPER-KHAYUTIN-19/119 The 2-torsion of the Picard group of an imaginary quadratic order → HE
  - PAPER-KHAYUTIN-19/120 2-torsion in Pic(Λ) through local Galois cohomology → HE
  - PAPER-KHAYUTIN-19/121 The small part of the discriminant and the genus weights → PART
  - PAPER-KHAYUTIN-19/122 The ideal-counting function of a quadratic order is of class M(A,B,ε) → SV
  - PAPER-KHAYUTIN-19/123 The main theorem in the range of large minimal ideal norm → PART
  - PAPER-KHAYUTIN-19/124 The main theorem in the range of small minimal ideal norm, by Linnik's method → PART
- **Routes:**
  - items 95 and 108 moved from the sieve source route to a new source route GeometryOfNumbersAndQuadraticArithmetic [GN.2, GN.4].
  - item 8 added to the AdelicAlgebraicGroups AA.4 source route.
  - Part II brief: main theorem restated exactly (the bounded-conductor and archimedean hypotheses restored), published numbering.
- **Source:** a readSections entry now records the published version and its SHA-256.

## Mistakes in the paper (`sourceIssues`, now E1–E34)

- **The extraction's E1–E3** are confirmed in print, each with a review verdict:
  - E1: 'Lemma 5.21' for Proposition 5.21, p. 190. The same sentence also writes |·|_v where the place is p₁.
  - E2: 'principle' for 'principal', five times in print (pp. 167, 186, 214, 215, 261), not three.
  - E3: 'identity' for 'identify', p. 182.
- **31 further mistakes** were found by the review and checked on page images: E4–E34, with 21 misprints, 8 errors and 2 gaps. The substantive ones:
  - E6: the printed O_∞^× contains diag(1, ½), so it is not SO₂(ℝ) and not a group.
  - E13: in Propositions 5.17 and 5.19, 'τ_v = 1 at ramified places' needs a normalisation of ε that the paper never makes.
  - E20: range R₂ in the proof of Theorem 9.7 needs ρ_Q(p^e) ≪ p^e, which the theorem's hypotheses do not give (Q = x²).
  - E25: the proof of Proposition 10.10 uses the false inequality 2κ|D| ≤ A(E). Rescaling η repairs it.
  - E27: Proposition 10.14 has |D|^{−2/3} where its proof gives |D|^{−1/3}.
  - E28: Proposition 10.15 claims κ|ω| log(2|ω|), where only κ|ω|² is proved and used.
  - E30–E34: errors in Appendix B's local densities (Lemma B.4, Proposition B.5, Corollary B.7), confirmed by direct counts of solutions, for example q = x² + y² at p = 5.
- **Effect:** none of these affects the main theorems (Theorems 1.3, 1.4, 3.2, 3.9, 3.10).

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-KHAYUTIN-19.result.json` reports no errors.
- Every missing item is routed exactly once.
- Every planned and route stage id exists in the atlas.
