# REV-PAPER-GAMBURD-MAGEE-RONAN-19: review of the Gamburd–Magee–Ronan extraction

**Verdict: accept, after corrections made in place.**
- **Paper:** Gamburd–Magee–Ronan, *An asymptotic formula for integer points on Markoff–Hurwitz varieties*, Ann. of Math. 190 (2019).
- **Extraction:** by cc-fb70e5, issue #1139.
- **Reviewer:** Claude Code, session cc-442dc5, which took no part in the extraction.
- **Outcome:**
  - All three routes are accepted.
  - The nine recorded source issues are confirmed, E1 with an amended repair.
  - Eight new ones are added.

## Method

I read the whole of arXiv v3; its SHA-256 matches the extraction's. The Annals version is paywalled. The printed page numbers equal the PDF pages, so the "p.N" locators are valid.

The reading was split across three read-only helper agents of this session, one each for §§1–2, §3 and §§4–5. I then checked every correction below myself at its locator, on the page image wherever a formula mattered.

The small counterexamples were re-run by exact computation:
- (1, 1, 2) for E3;
- the λ₂-orbit of (1, 3, 6, 15) for E12;
- z = (6, 22, 262, 34582) for E7;
- 2(ζ(2) − 5/4) ≈ 0.790 < λ₂ = 1 for E8.

## 1. Items

The 43 items are faithful and complete. No key definition or theorem on the way to Theorems 3, 10 and 13 lacks an item. The corrections:

- **Item 12 (Lemma 20).** Lemma 20 needs x unexceptional (E13).
- **Item 20 (Lemma 27).** It holds only with ≤ in the coordinates 1, …, n − 3 (E12).
- **Item 21 (Lemma 28).** The proof gives ±2ε, not ±ε (E11).
- **Item 22 (Lemma 29).** The error term is O(exp(βa^δ + (1 + δ)a)); the text layer had lost the exponent δ.
- **Item 33.** Schauder–Tychonoff needs a Hausdorff space.
- **Item 34 (Lemma 44).** It uses L_{ℜ(s)} on the right (E15).
- **Item 40.** The Kato decomposition is (1 − L_s)⁻¹ = λ_s(1 − λ_s)⁻¹P_s + (1 − L′_s)⁻¹ (E16).
- **Item 41.** Lalley's leading term is h_{β₀}e^{β₀a}/(β₀|λ′_{β₀}|) (E16).
- **Item 43.** (5.1) holds for i ≤ n − 2. The auxiliary bounds on w and the passage from ∆₀ to ∆ are now stated (E17).
- **Notes.**
  - Item 6: the cited Aut(V) theorems concern automorphisms of ℂⁿ preserving the polynomial, not of the fibre V(ℂ).
  - Item 23: the geodesic length is 2 log R + O(1) (E14).
- **Locators.** Items 8, 15 and 30.

## 2. Statuses

- **Library.** `Real.summable_one_div_nat_rpow` (Analysis/PSeries.lean:317) is the p-series test (item 31).
- **Planned.** PM.4 plans the Gauss map and its invariant measure (item 30).
- **Missing items.** I searched both libraries and every atlas layer text for transfer operators, Ruelle–Perron–Frobenius theory, renewal theorems, Kato perturbation, Schauder–Tychonoff and Markoff–Hurwitz equations. None exists. Mathlib has only unrelated Schauder bases, and Tau Ceti only Perron's formula.

## 3. Routes

- **1. CA.4: accept.** This is elementary descent, in the direction PAPER-MARTIN-25 established.
- **2. ArithmeticDynamicsPartIIMarkoff: accept.** The Part II was accepted through two earlier extractions, and its design job is #1700.
  - The brief states Theorem 3 exactly and imports Theorem 13.
  - It now carries the amended positivity argument and E10–E13.
- **3. New Part II, ProbabilisticAndMetricNumberTheoryPartIITransferOperators: accept.**
  - Nothing in the atlas owns this mathematics, and PM.4 is the natural parent.
  - No functional-analysis roadmap exists to take Kato perturbation or Schauder–Tychonoff.
  - The brief states its six final theorems exactly. It now also records E15–E17, and that β₀ = β depends on E1.

## 4. Mistakes in the paper

**E1 (gap, affects the proof): confirmed, and the repair is amended.** No argument anywhere shows c⋆ > 0 or c > 0. The original repair had two problems:
- **Wrong half of (3.25).** It quoted the half of (3.25) that bounds M from above. A lower bound on M needs the other half, together with the λ = e case.
- **Only at special points.** It proved positivity only at points with large α. Positivity must then be carried to every z, via M(z, a) ≥ M(μz, a − d_μ) for μ ∈ Λ′.

The same positivity is needed on p.40, where β₀ ≠ β is excluded by contradiction with Baragar's bounds.

**E2–E9: confirmed.** Two need qualifications:
- **E6.** C₁ depends on k′ as well as on n.
- **E8.** The printed step fails for every s > 1, and the printed λ_s bound is false outright. The locator is p.43.

The E2 display also has F(a) where F(a′) is meant.

**New issues, all checked by me and all harmless to the theorems:**
- **E10 (gap), p.33.** The proof of Proposition 30 sums a per-term error O(α⁻² log(…)) over the infinite set S_Λ, and the sum diverges for n = 3. The fix uses the ℝ₊-invariance of h, which makes the error relative, together with Σ((γ.w)_n/w_n)^{−β} < ∞.
- **E11 (misprint), pp.29–30.** Lemma 28 and (3.26) should have 2ε instead of ε, and τ⋆^L instead of τ⋆.
- **E12 (error), p.28.** Lemma 27's strict inequality is false when a = 1 and some z_i = 1 with i ≤ n − 3. Along (1, 3, 6, 15) → (1, 6, 15, 87) → … the coordinate z₁ stays 1 while α grows. The proof only gives ≤.
- **E13 (error), p.18.**
  - Lemma 20 fails for exceptional x with a repeated maximum, for example (1, m, m) with n = 3, a = 2, k = 1.
  - So V(ℤ₊) − K₀ has infinitely many exceptional orbits.
  - The proof also has Θ_x where Θ_{x′} is meant.
- **E14 (misprint), p.9.** A Markoff number m has trace 3m, so its simple closed geodesic has length 2 log m + O(1), not log m.
- **E15 (misprint), p.41.** Lemma 44 needs L_{ℜ(s)} on the right; for complex s the printed L_s[|f|] is complex-valued.
- **E16 (misprint), p.40.**
  - The printed resolvent decomposition cannot hold at g = h_s.
  - The leading constant should be h/(β₀|λ′_{β₀}|). For n = 3 at w = (0, 1, 1), direct enumeration gives N/e^{2a} ≈ 0.304.
- **E17 (misprints), pp.44 and 49.**
  - (5.1) should range over i ≤ n − 2.
  - (5.5) and (5.9) are missing squares in their denominators; the proofs on pp.49 and 53 use the squares.
  - On p.49, "C₁ ≤ C_k" should read C₁ ≥ C_k, and −2w_i should read −2w₁.

## Checks

- `python3 scripts/check_paper.py`: ok.
- Intake `check-files` on the four deliverables: passes.

Lean: none.
