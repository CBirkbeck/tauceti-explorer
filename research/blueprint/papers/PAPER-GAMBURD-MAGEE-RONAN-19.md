# PAPER-GAMBURD-MAGEE-RONAN-19: An asymptotic formula for integer points on Markoff–Hurwitz varieties

Alex Gamburd, Michael Magee and Ryan Ronan, *An asymptotic formula for integer points on Markoff-Hurwitz varieties*, [Annals of Mathematics 190 (2019), 751–809](https://doi.org/10.4007/annals.2019.190.3.2); arXiv [1603.06267](https://arxiv.org/abs/1603.06267).

Extraction by Claude Code, session `cc-fb70e5`, 22 September 2026 (issue #1139). Status: **complete**. The whole paper was read and every missing item is routed once. The machine-readable extraction is [PAPER-GAMBURD-MAGEE-RONAN-19.result.json](PAPER-GAMBURD-MAGEE-RONAN-19.result.json): 43 items (1 library, 1 planned, 41 missing), 3 routes, 14 prerequisite entries and 9 recorded source issues.

**Source.** arXiv v3 (13 June 2018, 57 pages), SHA-256 `965e264e260ca42bbaa5a65f789e5cc6eb6117d70d7219603a3b855d29ba997a`, read in full on 2026-09-22. The Annals version is paywalled and was not available, so locators are v3 pages.

## What the paper proves

Let V be the Markoff–Hurwitz variety x₁² + … + x_n² = a x₁⋯x_n + k, with n ≥ 3 and a ≥ 1, and let E be its exceptional families (which exist only for a ∈ {1, 2}).

- **Theorem 3.** |(V(ℤ) − E) ∩ B(R)| = c(log R)^β + o((log R)^β) with c > 0. Here β = β(n) is Baragar's exponent, for which only (log R)^{β+o(1)} was known (Theorem 2). This answers Silverman's first question.
- **Theorem 13.** For the linear semigroup Γ′, N(y, a) = h(y)e^{βa}(1 + o(1)).
- **Theorem 10.** β is the unique s > 1 admitting a conformal probability measure for Γ′ on ∆ = H/ℝ₊.

The proof has three layers.

1. **Descent and moves (§2).**
   - The moves m_j replace x_j by the other root a∏_{i≠j}x_i − x_j.
   - Outside a compact set they behave predictably (Proposition 16), which gives infinite descent (Corollary 17).
   - After normalising z = a^{1/(n−2)}x, the moves generate a free semigroup Λ of piecewise polynomial maps on ordered tuples (Lemma 18).
   - Multiplicities are handled by admissible sequences (Lemmas 19–20), which reduces Theorem 3 to counting finitely many Λ-orbits.
2. **Linearisation (§3).**
   - Acceleration replaces the generators by λ^A_{n−1}λ_j, in the manner of Zorich's acceleration. The accelerated count M satisfies a renewal equation (3.7).
   - After L ≈ ca/log a iterations, α(z) = ∏_{j≤n−2}z_j grows doubly exponentially (Lemma 24).
   - A Zagier-type fit f(z) (Lemmas 25–28) then compares log log of the nonlinear orbit with the linear semigroup Γ′ = ⟨γ^A_{n−1}γ_j⟩₊ on the hyperplane H to within ε(a).
   - This gives Proposition 21, and hence Theorem 3.
3. **Transfer operators (§§4–5).**
   - Γ′ generalises continued fractions: it is the Gauss map for n = 3 and the Rauzy gasket for n = 4.
   - The transfer operator L_s[f](w) = Σ_{j,A}(1 + (A + 1)(1 − w_j))^{−s}f(γ^A_{n−1}γ_j.w) is studied on C¹(∆). The main tools are:
     - a Ruelle–Perron–Frobenius theorem (Theorem 37), via the Ionescu-Tulcea–Marinescu inequality (Lemma 44);
     - Pollicott's Wielandt theorem, with a non-lattice property from fixed points (Theorem 39, Proposition 40);
     - monotonicity of λ_s (Proposition 41);
     - Lalley's contour-shifting renewal method (§4.3).
   - All of this rests on uniform contraction (Proposition 43). It is proved in §5 through a core/cusp decomposition of ∆, ten explicit ℓ¹ Jacobian bounds and Lemma 46, the two-step bound 24/25.

## What the atlas already has

- **Library.** Mathlib has p-series summability (`Real.summable_one_div_nat_rpow`).
- **Planned.**
  - ProbabilisticAndMetricNumberTheory PM.4 plans the Gauss map and its invariant measure, which is the n = 3 case (Examples 32, 35).
  - ClassicalArithmeticCompletion CA.4 already receives the Markoff equation and descent from PAPER-MARTIN-25 and PAPER-GHOSH-SARNAK-22.
  - The accepted Part II `ArithmeticDynamicsPartIIMarkoff` (design pending) owns Markoff actions.
- **Not in the atlas.** No stage mentions transfer operators, Ruelle–Perron–Frobenius theory, renewal theorems, iterated function systems, Kato perturbation theory or Schauder–Tychonoff, and no other extraction proposes them. Tau Ceti f790474 has none of these either.

## Routes

1. **Source of ClassicalArithmeticCompletion CA.4** (5 items): the Markoff–Hurwitz equation and moves, the exceptional families, the reduction to positive tuples, Proposition 16 and infinite descent. This is elementary descent, in the direction PAPER-MARTIN-25 established.
2. **Part II `ArithmeticDynamicsPartIIMarkoff`** (18 items), coalesced with PAPER-MARTIN-25 and PAPER-GHOSH-SARNAK-22 under the same id and title. It takes the orbit counting for Markoff–Hurwitz moves:
   - Aut(V);
   - the semigroup Λ, freeness, multiplicities and regularisation;
   - acceleration and the renewal equation;
   - Lemmas 22–29, Propositions 21 and 30, and Theorem 3;
   - the cited Theorems 1 (McShane–Rivin) and 2 (Baragar);
   - the geodesic-counting connections.

   The brief imports Theorem 13 from route 3. It asks for an explicit positivity proof (E1) and lists regression cases.
3. **New Part II `ProbabilisticAndMetricNumberTheoryPartIITransferOperators`** (18 items), titled *Probabilistic, metric and ergodic number theory, Part II: transfer operators, renewal and multidimensional continued fractions* (galaxy `analytic`). It covers:
   - the semigroups Γ, Γ′ and the count N(y, a);
   - Theorems 13 and 10 and Remark 14;
   - the renewal equation and L_s;
   - Lemma 33 with Schauder–Tychonoff, Lemmas 36 and 44, Theorem 37, the limit set, Theorem 39 and Propositions 40–41;
   - Kato perturbation and Lalley's method;
   - Proposition 43 and §5.

   PM.4 stops at the one-dimensional Gauss map, and this is the natural extension in its direction. The brief asks for existence of β to be proved directly, since λ_s → ∞ as s ↓ 1, rather than through Baragar. It also asks for the sketched proofs (Theorem 37, §4.3) to be written out for countably many branches.

## Source issues (`sourceIssues` E1–E9)

None affects the truth of Theorems 3, 10 or 13.

- **E1** (gap, affects the proof of Theorem 3).
  - **The problem.** Proposition 21 asserts c⋆ > 0, but Proposition 30 only proves convergence and boundedness. Baragar's (log R)^{β+o(1)} does not force c > 0.
  - **Repair.** Run Lemmas 26–28 with a fixed ε₀ at a point with α(z) large. This gives M(z, a) ≥ N(f(z), a − 2ε₀) ≫ e^{βa}, since h is positive on the compact ∆.
- **E2** (misprint). (3.5) should sum from A₀ = 0, and the prefactor log z_n⁽⁰⁾ should be (log z_n⁽⁰⁾)^β.
- **E3** (error, nothing). In Proposition 16(3), the parenthesis "holds for all x ∈ V(ℤ₊)" is false: for n = 3, a = 1, k = 4, x = (1, 1, 2) is unexceptional and m₂(x) = x. The proof itself puts such points in K₀.
- **E4** (misprints, index ranges).
  - In the definition of admissible sequences, "l ≤ 2" should be "l ≥ 2".
  - Lemma 20 has λ_j for j ≤ n − 2, and §3.1 for j ≤ n; both should be j ≤ n − 1.
- **E5** (misprint). The Claim in Lemma 23 drops the exponent L − 1 on (c₀ + x), and its sums should start at A₁ = 0.
- **E6** (misprint). Lemma 25 says "k′ ≥ 0", but k′ can be negative. The estimate survives.
- **E7** (error, nothing). Lemma 27's "(λ′z⁽⁰⁾)_{n−2} ≥ z_{n−1}⁽⁰⁾ for any nonidentity λ′" fails for powers of λ_{n−1}. It holds for the accelerated words actually used.
- **E8** (misprint). §4.5 should read λ_s ≤ 2^s(n − 2)Σ(3 + A)^{−s}. The printed 2(n − 2)Σ… is false for s ≥ 2; the conclusion λ_s → 0 is unaffected.
- **E9** (misprints in §5.3). "β(w) < 2/3" should be β ≤ 3/2, "C_j" should be C_{n−2}, and "= 4/5" should be "≤ 4/5".

**Also checked and correct:**
- Lemma 31 (the action formula) and Lemma 22;
- the eigenvector in Proposition 40;
- Examples 7–9 and 35;
- all ten bounds (5.1)–(5.10) and Lemma 46, numerically, on random points of ∆_core and ∆_cusp for n = 4–7. The largest two-step norm observed was 0.64, against the claimed 24/25.

As a sanity check on Theorem 3, counting the orbit of (1, 1, 1, 1) for n = a = 4, k = 0 up to R = 10^640 gives local growth exponents 2.42–2.45. This is inside Baragar's interval (2.430, 2.477).

No erratum is listed, Crossref has no update relation, and v3 is the last arXiv version.

## Prerequisites not yet covered

- Baragar 1994/1998, and Zagier 1982.
- McShane–Rivin 1995.
- Lalley 1989, Pollicott 1984 and Liverani 1995.
- Kato's perturbation theory.
- Avila–Hubert–Skripchenko 2016, and Arnoux–Starosta 2013 (the Rauzy gasket).
- Horowitz 1975, and Hu–Tan–Zhang 2018 (Aut(V)).
- Wirsing 1974.
- Magee 2020.

Links and reasons are in the JSON.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-GAMBURD-MAGEE-RONAN-19.result.json`: ok.
- Every missing item appears in exactly one route, and no route takes a planned or library item. The two briefs are 403 and 401 words.
- The Mathlib citation was read at 082e2d3 (`Analysis/PSeries.lean:317`). Layer ids were checked against `data/atlas.json`, and prerequisite DOIs against Crossref (two initially mistyped DOIs were corrected).
- No Lean was written or compiled; none is a deliverable of this job.
