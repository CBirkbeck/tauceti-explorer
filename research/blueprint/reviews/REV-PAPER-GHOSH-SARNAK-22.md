# REV-PAPER-GHOSH-SARNAK-22 — independent review of the Ghosh–Sarnak extraction

**Verdict: accept, with corrections made in place.** Reviewer: Claude Code, session `cc-442dc5`, 23 September 2026. The extraction was done by session `cc-fb70e5`, and this reviewer did no part of it.

**Paper.** Amit Ghosh and Peter Sarnak, *Integral points on Markoff type cubic surfaces*, Invent. Math. 229 (2022), 689–749, DOI 10.1007/s00222-022-01114-z.
- **The version read.** arXiv v3 (30 May 2022), which the authors call the final version, was fetched on 23 September 2026. Its SHA-256 `e4ddc7a1…3163d` matches the extraction's.
- **Coverage.** The whole paper was read: §§1–10, Appendices A–B and the references.
- **The published version.** Unpaywall lists only arXiv as an open copy, so, like the extraction, this review works from v3.

**Checks run.**
- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-GHOSH-SARNAK-22.result.json` reports `ok` on the corrected file.
- Every library citation was read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` was searched for Markoff, Fricke, Vieta, circle-method and local-density declarations.
- Every cited stage was read in the atlas extracts and checked against `data/restructure/`. RS-07 keeps AN.5, and no restructuring touches the other stages.
- Every recorded mistake was re-checked by the reviewer's own computations (Python with NumPy and SymPy; §6).

## 1. Items

**Fidelity is high.**
- Every numbered result, the lemmas of §§2–9, the propositions of Appendix B and the stated conjectures have items.
- Hypotheses and constants match the printed text. Where the extraction corrected a printed statement, the correction was checked (§4).

**Coverage.** The paper was checked section by section, and no definition or key theorem on the way to Theorems 1.1 and 1.2 is missing:
- §1 context, (1.5)–(1.10) and Remark 1.3;
- Lemmas 2.1–2.2 and the cases k ≤ 3;
- §3 and (3.2);
- (4.1), Theorem 1.1, Proposition 4.1 and Remark 4.2;
- Lemma 5.1, §5.1(1)–(4), Remark 5.2 and §5.2;
- (6.1), Lemmas 6.2–6.4 and Proposition 6.1;
- Lemmas 7.1–7.3 and (1.6);
- (8.1) and Propositions 8.1–8.3;
- §9 through (9.36);
- §10 and Conjectures 10.1–10.2;
- Appendices A and B.

The Landau-type counts, Blomer–Granville and the δ-method, which the paper uses without proof, are items too.

**Corrected statements.**
- **Item 20 ((1.5)).** It said each slice {x₁ = x̂₁} ∩ V_k is an irreducible conic because k is not a square. That holds for |x̂₁| ≥ 3. For |x̂₁| = 2 the slice is the pair of lines (x₂ ∓ x₃)² = k − 4, and the orbit's closure is one line or both. The statement now says so (new finding E20).
- **Item 57 (Propositions B.1–B.2).** The sign factor in B.1(b) and B.2(d) is χ(−1) = (−1/p), not "−1 at p = 3 and +1 for p ≥ 5" (§4, E15).
- **Items 62–63 (Conjectures 10.1–10.2).** They were recorded with kind `definition`. They are now `theorem` items whose statements begin "Conjecture (not proved)". The checker has no conjecture kind.

## 2. Statuses

**Library (4 items, all confirmed at 082e2d3).**
- `hensels_lemma` (Padics/Hensel.lean:461), in the strong form ‖F(a)‖ < ‖F′(a)‖² that E2's repair needs.
- `gaussSum_sq` (GaussSum.lean:222).
- `legendreSym.quadratic_reciprocity`, `ZMod.exists_sq_eq_two_iff` and `ZMod.exists_sq_eq_neg_two_iff` (QuadraticReciprocity.lean:107, 74, 80).
- `Nat.eq_sq_add_sq_iff` (SumTwoSquares.lean:211).

**Planned.**
- **Item 43 is confirmed.** ExponentialSumsAndCircleMethod ES.3 plans p-adic local densities and singular series.
- **Item 23 (the Fricke trace identity) is changed from `missing` to `planned`.** Tau Ceti BelyiMaps Layer 4 plans "the Fricke trace identity", for A, B ∈ SL(2,ℝ), proved by expanding the eight matrix entries subject to det A = det B = 1.
  - The paper needs it over ℤ and ℤ/pⁿℤ. Because the planned proof is a polynomial identity, the item's note asks the blueprint to state it over any commutative ring.
  - It is removed from route 1, and ClassicalArithmeticCompletion CA.4 imports it rather than planning it a second time.

**Missing.** The reviewer searched both libraries and the atlas for the other missing items and found no owner. The searches covered:
- Markoff, Vieta and character varieties;
- the δ-method, Kloosterman refinement and Blomer–Granville;
- Landau–Ramanujan, Selberg–Delange and Wirsing counts;
- lattice points in these regions.

Tau Ceti's `Fricke` files concern the Fricke involution on modular forms.

## 3. Routes

All five routes are accepted; the reasons are in `PAPER-GHOSH-SARNAK-22.review.json`.
1. **ClassicalArithmeticCompletion CA.1/CA.4.** It owns the elementary level-k arithmetic. It now takes 25 items; the Fricke identity is imported from BelyiMaps.
2. **ExponentialSumsAndCircleMethod ES.3/ES.4.** Theorem 1.2(ii) and its variance argument are a forms-in-many-variables endpoint with its local factors.
3. **GeometryOfNumbersAndQuadraticArithmetic GN.4.** It takes the lattice-point counts of §7 and Blomer–Granville.
4. **AnalyticNumberTheory AN.5.** It takes the multiplicative mean-value counts.
5. **The Markoff Part II of ArithmeticDynamics.** This coalesces with PAPER-MARTIN-25's accepted proposal. Its brief states the final theorems with the corrections of E5–E6 and names its imports by id.

## 4. Mistakes

All nineteen recorded findings are **confirmed**. Each now carries a `review` object with the reviewer's own check. In brief:

- **E1 (Lemmas 7.1–7.2).** Exact counts of R⁺(K) for K = 10⁶ … 10¹¹ fit c₂ = 0.02108, against 1/48 = 0.02083 and the printed 1/36. At K = 10¹⁰ the printed Lemma 7.1 is off by −9.4√K, −97√K and −276√K at a = 10, 100, 1000; the corrected form is off by only 1–20√K.
- **E2 (Proposition 6.1 at 3 and 2).** The two lifts reach only k ≡ 9 (mod 27) and k ≡ 1 (mod 8). The proposition itself holds: M is onto every admissible class modulo 81 and modulo 64.
- **E3, E4, E7, E9, E10, E12–E14.** Each was confirmed at its locator or by the argument given. For E9, 60² − 4 = 2²·29·31.
- **E5 (U₁).** With the corrected matrix A = [[x₂² − 1, −x₂],[x₂, −1]], the base point has a V₁V₃-orbit of size 3 for k = 3 and k = 5.
- **E6 (k = 49).** (1, 4, 8) ∈ V₄₉(ℤ) generates an infinite orbit. V₄₉(ℤ) also has the finite orbit of (0, 0, 7).
- **E8 (Proposition 8.2).** ν = 11 satisfies the hypotheses. 1456 is admissible, not exceptional, and F⁺₁₄₅₆(ℤ) = ∅.
- **E11 (Theorem 1.2(i)).** The families of Proposition 8.1 have constants 0.412 (k < 0) and 0.096 (k > 0) at K = 10¹⁴, so the proof gives ≫, not "at least".
- **E15 (Propositions B.1(b) and B.2(d)): confirmed and extended.** The extraction located the sign error at p = 3 and called the formulas correct for p ≥ 5. The error is at every p ≡ 3 (mod 4):
  - δ₇(49) = 34/49 and δ₇(147) = 36/49, against the printed 36/49 and 34/49;
  - δ₁₁(121) = 98/121, against the printed 100/121;
  - N₃ = −1/49 at (p, k) = (7, 49), against the printed +1/49.

  The correct factor is χ(−1). The finding's correction, locator and reason, and item 57, were rewritten. As before, nothing downstream changes.
- **E16 (Proposition B.2(e)).** With χ((k − 4)/p^μ) the formula matches counts modulo 5⁵.
- **E17 (Proposition B.4(d)).** The corrected N_l match counts:
  - p = 5, (a₁, a₂) = (3, 7): N₂ = −1/25;
  - p = 3, (4, 5): N₂ = 2/9 and N₃ = −1/27.

  Proposition B.5(d) gives δ₃ = 50/27, as counted.
- **E18 (Proposition B.12).** Counts modulo 2⁹ give:
  - 3/4 for k = 1, 9 and 9/4 for k = 5, 13;
  - 11/8 for k = 16, 32;
  - 1 for k = 24, 48;
  - 5/2 for k = 8, 40;
  - 11/4 for k = 20, and 7/4 for k = 36 and −12.

  So only the qualitative bound δ₂ ≥ 3/4 survives.
- **E19 (δ₂(a₁, a₂) at θ = 0).** δ₂ = 5/4 for (4, 3), (4, 5) and (12, 3), and 3/2 at θ = 3.

**New: E20 (error, affects nothing).**
- **The claim.** §5.2.1 says the Zariski closure of the orbit "contains the conic section {x₁ = x̂₁} ∩ V_k".
- **Why it fails.** For |x̂₁| = 2 the slice is a pair of lines, and for x̂₁ = 2 the parabolic element preserves x₂ − x₃. For example, at k = 5 the orbit of (2, 1, 0) is {(2, 1 + n, n)}.
- **Why nothing breaks.** The finiteness argument only needs a curve in the plane, so it is unaffected.

No published correction exists. The extraction's `searched` lists cover the journal page, the arXiv versions and Crossref. The review checked Crossref again on 23 September 2026 and found no update-to or erratum relation for the DOI.

## 5. Corrections made in place

- **Item 23.** `missing` changed to `planned` at `tauceti:TauCetiRoadmap/BelyiMaps#layer-4-triangle-groups`, with a note on stating it over any commutative ring. It was removed from route 1, whose reason now says CA.4 imports it.
- **Items 62–63.** Kind changed from `definition` to `theorem`, with statements marked "Conjecture (not proved)".
- **Item 20.** The slice statement was corrected for |x̂₁| = 2, and the note cites E20.
- **Item 57.** The sign factor ε_p = χ(−1) and the B.2(d) term 1 − χ(−k/p^μ) are now stated for all odd p.
- **E15.** Its locator, correction and reason were extended to every p ≡ 3 (mod 4).
- **E20.** Added.
- **Summary.** It now counts twenty findings and names the planned Fricke identity.
- **Report.** `PAPER-GHOSH-SARNAK-22.md` has a review note, the planned Fricke identity, route 1's new count (25), and the E15 and E20 entries.

The corrected file has 63 items (4 library, 2 planned, 57 missing), five routes and twenty findings. Every missing item is routed exactly once.

## 6. Computations

All counts are exact.
- **Symbolic.** SymPy checked:
  - the factorisation and symmetries of Δ in (3.1);
  - all three identities (4.1), on the surface M = k;
  - the parametric families on U₁ (ε = ±1) and U₂.
- **Lemma 6.4.** Brute force for every α, β modulo p ≤ 13.
- **Densities at odd p.** δ_p(k) was computed by completing the square and counting modulo 3⁷, 5⁵, 7⁴ and 11⁴ (and 13⁴). The N_l are differences of successive levels.
- **Pair densities.** δ_p(a₁, a₂) was computed by convolving the value counts of f_{a₁} and f_{a₂} modulo p^l.
- **p = 2.** Densities were computed by brute force modulo 2⁹ (single surfaces) and modulo 2¹⁰ (pairs).
- **R⁺(K).** Computed by exact summation over (a, m) with integer square roots.
- **The families of Proposition 8.1.** Counted with a smallest-prime-factor sieve up to 8 × 10⁶.
