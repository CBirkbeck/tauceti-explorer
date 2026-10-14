# Handoff: BP-ClassicalArithmeticCompletion--CA.2

Job: blueprint follow-up of layer CA.2 (*Sequences and generating functions*) of
ClassicalArithmeticCompletion, issue #9666. Worker: Claude (session claude-ZmmAC5), 2026-10-14.

Deliverables:
- `research/blueprint/packets/ClassicalArithmeticCompletion--CA.2.json`: 20 nodes, status `complete`, CA.2 `planned`.
- `research/blueprint/readmes/ClassicalArithmeticCompletion--CA.2.md`: the reader document, rendered from the packet.
- `research/blueprint/suggested/ClassicalArithmeticCompletion--CA.2.lean`: 409 lines.

The first-pass packet `ClassicalArithmeticCompletion.json` is not edited. Its 61 CA.2 nodes are
cited by id.

## What is closed

All three open items of the first pass's CA.2 coverage record are planned, and the 20-target
review frontier is resolved.

- **Lawrence–Sawin items 66–67.** `eulerian-numbers` (definition; planet). `eulerian-basic-identities`:
  the row sum n!, symmetry, recurrence, Worpitzky, A(n, 1), ascents. `eulerian-unimodal`, with an
  elementary proof from the recurrence. Lemmas C.1–C.5 at their exact ranges (`eulerian-power-bounds`,
  `eulerian-small-descent-bounds`, `eulerian-square-separation`, `eulerian-ratio-bound`). The
  definition counts descents and has A(0, 0) = 1. That value is kept apart from Lawrence–Sawin's
  "A(n, q) = 0 unless q < n" (used only for n ≥ 1) and from Stanley's shifted A(0, k) = δ_{0k}.
  Checked numerically for n ≤ 70. C.5 fails at n = 10, so the threshold is sharp.
- **Yu items 103–105 and 179.** `generalized-binomial-divisibility` (Lemme 7.2.2, with the absorption
  identity for `Ring.choose`). `p-free-factorial` (definition; planet). `p-free-factorial-binomial-factorisation`
  covers both identities, with the sign (−1)^{m(p−1)}. `luo-zhu-congruence` (planet) keeps the
  exclusion p = 2, α = 1 and the separate mod-4 formula. All four were checked numerically.
- **Review frontier.** `frontierResponse` dispositions all 20 targets:
  - 14 were resolved by the first pass or its third review, or were splitting demands that target
    level supersedes.
  - 3 now have new supplier nodes:
    - `formal-sine-cosine-identities`: the pinned Mathlib has no formal sin′/cos′ lemmas.
    - `bernoulli-coefficients-do-not-decay`: divergence for |z| ≥ 2π via `hasSum_zeta_nat`.
    - `tangent-coefficients-do-not-decay`: divergence for |z| ≥ π/2.
  - 3 name their Mathlib suppliers (Taylor series, p-adic digits, Cartier).

## What remains (the one gap)

**Ward's strong divisibility at primes dividing W₂W₃, and for singular attached curves.** The
`ward-strong-divisibility` node (planet) states Ward's theorem as an iff: normEDS b c d with bc ≠ 0
is strongly divisible iff gcd(c, db) = 1. The supporting nodes:
- `eds-attached-curve`: the explicit curve y² + ((d + b⁴)/(bc))xy + by = x³ + (c/b²)x², with
  ψₙ(0, 0) = normEDS b c d n and Δ = −D(b, c, d)/(b⁴c³).
- `division-polynomials-at-a-nonsingular-point`: from Tau Ceti's `zsmul_point_eq_smulEval`; includes
  Ayad's coprimality.
- `eds-zero-set-is-a-subgroup`.
- `reduction-filtration-of-an-integral-weierstrass-equation`: from Streng's thesis, for a non-minimal
  integral model.
- `eds-strong-divisibility-at-good-primes`: the theorem at primes p ∤ bc with Δ ≠ 0.

The proof is planned only at primes p ∤ bc with Δ ≠ 0. At p | bc the point can have singular
reduction on every integral model. Example: b = 1, c = 3, d = 1 at 3, where v₃ jumps from 1 to 4
at n = 6. No public proof was found; the search list is in the gap's detail. A continuation needs
a public proof, or a proof assembled from Stange's singular-reduction valuation formulas
(arXiv:1108.3051 §§7–10) or from the recursion modulo p^V. Numerical evidence: 1552 sequences, no
failure.

## Requests and restructure proposals

- **Requests to Tau Ceti's EllipticCurves**, Layer 1 (formal group law) and Layer 4 (Ê(𝔪) ≅ E₁).
  Both are used for an arbitrary integral equation. An upstream note says Layer 4 could drop
  minimality.
- **Restructure (rescope), the AdditiveCombinatorics request.** AC.4/w-trick-and-goldston-yildirim-majorant
  requests the maximal divisor order from CA.2. That is AnalyticNumberTheory:AN.5/divisor-maximal-order
  (accepted), so it is not planned here. Re-point the AC prerequisite.
- **Restructure (rescope), wiring at assembly.** Add the three supplier nodes to the prerequisites of
  CA.2/secant-plus-tangent-formal-identity, CA.2/bernoulli-generating-function-on-its-disc and
  CA.2/secant-plus-tangent-on-its-disc.
- **Restructure (split), CA.2 sub-layers.** Ten planets now fall on CA.2: six in the first pass and
  four here. The proposal divides CA.2 into four sub-layers (2a recurrences and divisibility
  sequences, 2b special numbers, 2c digits and automata, 2d Farey) with at most six planets each.

## Source issues

- **E1201 (misprint, known):** in Luo–Zhu arXiv:1611.06506v1 Lemma 4.6, the factor p^α(n − 1) is
  doubled. It is corrected in arXiv:2106.02882v1, Lemma 3.1.
- **E1202 (error, new):** Silverman's 2007 ICMS slide 1 states strong divisibility without
  gcd(W₃, W₄) = 1 and without absolute values.

## Checks

- **`check_blueprint.py`:** 0 errors, 0 warnings, run with the declaration index. All 64 baseline
  declarations were looked up in the index, and their statements were read at the pins.
- **`lean-check`:** the suggested file elaborates against Mathlib 082e2d3 / Tau Ceti f790474 with
  exit 0. The only warnings are `declaration uses sorry` (76).
- **Name coverage:** every packet API item and unit test appears in the Lean file, as a declaration
  or as a "Unit test" docstring.
- **`check_sorry_data.py` and `intake.py check-files`:** clean.

## Sources read (all public; SHA-256 in the packet)

- Stanley EC1, §1.4, §1.6.1, Exercises 1.49–1.50.
- Lawrence–Sawin, arXiv v5: §3 and Appendices A–C, as listed in the packet.
- Yu, arXiv v5: §7.2.2, pp. 67, 71–72.
- Luo–Zhu: arXiv:2106.02882v1 §3 and arXiv:1611.06506v1 §4.
- Stange, arXiv:1108.3051v4.
- Silverman–Stephens, math/0402415.
- Silverman, math/0404412.
- Silverman–Stange, 1001.5303.
- Bhakta–Loughran–Rydin Myerson–Nakahara, 2109.03746.
- Streng's master's thesis.
- Silverman's ICMS slides.
- DLMF §24.9.

Missing: Ward's 1948 memoir, and the theses of Shipsey and Swart, none of them freely available.
