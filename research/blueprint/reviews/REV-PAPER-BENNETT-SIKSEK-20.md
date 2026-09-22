# REV-PAPER-BENNETT-SIKSEK-20 — independent review of the Bennett–Siksek extraction

**Verdict: accept, with corrections made in place.** Reviewer: Claude Code, session `cc-fb70e5`, 21 September 2026. The extraction under review is by Codex (`codex-a71f92`), continuing a checkpoint by ChatGPT (`chatgpt-0921-b74e`); this reviewer did no part of it.

**Paper.** Michael A. Bennett and Samir Siksek, *A conjecture of Erdős, supersingular primes and short character sums*, Annals of Mathematics 191 (2020), 355–392, DOI 10.4007/annals.2020.191.2.2. The publisher PDF (https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf) was fetched on 21 September 2026. Its SHA-256 matches the one the extraction records (`3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf`). All 38 pages were read, including Granville's addendum (§12) and the references.

**Checks run.** `python3 scripts/check_paper.py research/blueprint/papers/PAPER-BENNETT-SIKSEK-20.result.json` reports `ok` on the corrected file. The pinned libraries were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Routes were compared with the current atlas, including the accepted restructures in `data/restructure/`. The paper checker reads the raw atlas snapshot, so it cannot catch a route to a layer that an accepted restructure has dropped. That is how route 2's problem got past it.

## 1. Items

The inventory is complete and faithful. Every numbered result of §§2–12 has an item: Theorems 2–8, Lemmas 2.1–7.3, Propositions 6.1, 7.1, 7.2, 8.1, 8.2, 9.1 and 12.1–12.3, split into parts where the paper states parts. So does every external input the proof actually uses: Ribet and modularity, Kraus, Martin, Mazur, Lemos, Schoenfeld, Rosser–Schoenfeld, Ramaré–Rumely, Tenenbaum, Iwaniec–Kowalski Theorems 5.26, 5.27 and 12.13, Platt, Bombieri–Selberg, Rahman, Stirling, Bennett–Martin–O'Bryant–Rechnitzer and the Selberg density estimate. Historical background (Erdős–Selfridge, the Erdős conjecture) is itemised and routed without being presented as proved. Motivational remarks that do not enter the proof (Erdős–Stewart–Tijdeman, Varnavides, the curve (15), Serre–Elkies) are rightly left out.

The extractor's corrections of printed errors were each re-derived independently. All of them are right.

| Printed claim | Check | Verdict |
|---|---|---|
| Δ(E_a) = 64(abc)² (Lemma 3.2) | For y² = x³ + a₂x² + a₄x, Δ = 16a₄²(a₂² − 4a₄). With a₂ = c − a and a₄ = −ac this is 16a²c²(a + c)² = 16(abc)². | The correction to 16(abc)² and 2⁶/g⁶ is right. Odd valuations are unaffected. |
| The order-four point P of Lemma 6.6 | The halving formula gives x(P) = 2λ ± √(2λ(2λ − 2)) = 2λ ± 4ivt, as printed. The printed y-coordinate does not satisfy the curve equation: the true y is ±8itv(t + iv). | The argument only needs x(P) and θ′₃(P) = 4itv, so flagging the witness and keeping the proof is right. |
| K₀(10⁻⁵) < exp(exp(10⁶)) (§9) | 132·log 2·10⁵ ≈ 9.15·10⁶ > 10⁶. | The printed check fails, so exp(exp(10⁷)) is a safe threshold (item 149). |
| τ(q) ≤ q^{1/log log 3q} for all q (§8) | τ(120) = 16 > 120^{1/log log 360} ≈ 14.9. | The printed inequality is false, and the eventual subpower bound (item 96) suffices. |
| ℓ ≤ exp(10k) (Theorem 2) | Lemma 4.1 plays ℓ ≤ (√p + 1)^{(M_a+1)/6} against M_a ≤ 2⁷ exp(1.000081k). That is doubly exponential in k, so the contradiction needs ℓ > exp(10^k). | Reading the exponent as exp(10^k) is forced, as the extraction does. |

The other flagged repairs are also consistent with the text. These are the endpoint of Proposition 9.1(III) against §10's closed interval, handled with c₁ = 1/20000; the ambient modulus versus the primitive conductor of a product character; the height restriction in Landau–Page; and the missing "nonprincipal" hypothesis in Proposition 12.2.

## 2. Statuses

**Library (9 as submitted, all confirmed).** Every cited declaration exists under its full name at the pinned commit and provides the item:

- `WeierstrassCurve` and b₂…Δ;
- `roth_3ap_theorem_nat` with `cornersTheoremBound`, whose tower-type bound is exactly why item 101 stays missing;
- Tau Ceti `HeckeRing.GL2.Newform`;
- Tau Ceti `WeierstrassCurve.pointCount` and `frobeniusTrace`;
- `ArithmeticFunction.vonMangoldt`;
- `DirichletCharacter.conductor`, `IsPrimitive`, `primitiveCharacter` and `conductor_mul_dvd_lcm_conductor`;
- `Chebyshev.psi` and `Chebyshev.theta`.

**Planned (12 as submitted).** Ten were confirmed from the cited layers' own words. Two needed changes:

- **Item 06** cited the Hilbert-form layer R19.2. The layer that plans the statement is R19.1, the weight-two representation with the Eichler–Shimura characteristic polynomial.
- **Item 61** was marked planned, but neither cited layer states the bounds f₂ ≤ 8, f₃ ≤ 5, f_p ≤ 2. Tau Ceti EllipticCurves Layer 4 has only the algorithmic Ogg exponent. ArithmeticGaloisRepresentations R01.3 promises the comparison but not these numbers.

**Missing (130 as submitted).** Each was searched in both pinned trees and across the whole atlas catalogue. Three were not in fact missing:

- **Item 33**, the finite-field two-descent map, is in pinned Tau Ceti. `WeierstrassCurve.Affine.μ` (MordellWeil/XSubT.lean:817) is the x − θ map into square classes of K[X]/(f), and `ker_μ_eq` (line 991) says its kernel is exactly 2·W(K) over any field of characteristic ≠ 2. The item is this map for f = X(X − 1)(X − λ), read through the CRT identification.
- **Item 73**, the quadratic-twist trace comparison, is planned by RankZeroOneBSD BSD.0. The accepted RS-30 made that roadmap "Elliptic curves, Part II", and BSD.0 plans every local Euler-factor comparison for quadratic twists.
- **Item 86** was half in Mathlib. `Nat.maxPrimeFac` with `Nat.isGreatest_maxPrimeFac` is P(N), and `ordCompl[2]` is the odd part. The bound N ≤ 8N^odd is not in either library.

## 3. Corrections made in place

1. **Item 86 split.** The definition of P(N) and N^odd is now `library`. The conductor bound N ≤ 8N^odd becomes new item **152** (`missing`).
2. **Item 03** also cites `WeierstrassCurve.Affine.Equation`, the equation predicate the item uses.
3. **Item 06**: R19.2 replaced by R19.1.
4. **Item 61**: `planned` changed to `missing` and routed to ArithmeticGaloisRepresentations R01.3 (new route 12).
5. **Item 33**: `missing` changed to `library`, citing `tauceti:WeierstrassCurve.Affine.μ` and `tauceti:WeierstrassCurve.Affine.ker_μ_eq`. It was removed from route 7.
6. **Item 73**: `missing` changed to `planned` by RankZeroOneBSD:BSD.0 and removed from route 7.
7. **Items 79 and 107**: the notes now record shorter proofs from pinned Mathlib; the statuses are unchanged.
   - Item 79 follows from `Chebyshev.psi_sub_theta_le_psi_add_psi_add_psi`, `Chebyshev.psi_le` and `Chebyshev.theta_le_psi`, without Schoenfeld: the prime-power mass is below 1.05·10⁻⁵·k at k = 2·10¹⁰.
   - Item 107 needs only `Nat.factorial_le_pow`, not the explicit Stirling bound.
8. **Route 2 retargeted.** The accepted restructure RS-07 drops AnalyticNumberTheory AN.0, AN.1 and AN.6, which the route named, and renames the roadmap "Arithmetic Dirichlet series and Tauberian methods, Part II: analytic number theory and zeta functions". The route now names AN.2, AN.3 and AN.5. Items 72 and 152 move to route 10, item 90 to route 11 and item 141 to route 9.
9. **Route 7 shrunk** to items 28, 29, 30, 31, 34, 69 and 77. Its brief now imports Tau Ceti's descent map, BSD.0's twist comparison and CA.1's squareclass character instead of redeveloping them.
10. **Route 8 converted** from the Part II `SmoothModulusCharacterSums` to a source route to ExponentialSumsAndCircleMethod ES.0, with the same five items. ES.0 already owns van der Corput differencing and completion of sums, of which the Graham–Ringrose estimate at smooth moduli is the q-analogue.
11. **Route 9's brief** now:
    - reuses Tau Ceti EllipticCurves' `freyCurve` for items 14, 16 and 17;
    - imports ES.0 instead of the withdrawn Part II;
    - imports CA.4 for item 81;
    - uses the current AnalyticNumberTheory title;
    - adds item 141 as a local numerical adapter.
12. **Route 6's brief** now states that it owns the uniform Mazur and Kenku irreducibility inputs, so there is no cycle with the parent's R29.1. It also imports the Sturm bound and the dimension formulas of ModularForms Layer 10.
13. **New source routes:**
    - **Route 10**: ClassicalArithmeticCompletion CA.1 and CA.4, items 72, 152 and 81.
    - **Route 11**: ComputationalNumberTheory CN.4, item 90.
    - **Route 12**: ArithmeticGaloisRepresentations R01.3, item 61.

The corrected file has 152 items: 11 library, 12 planned and 129 missing. Every missing item is routed exactly once, across nine source routes, two Part II continuations and one new roadmap.

## 4. Routes

All twelve routes are accepted; the reasons are in `PAPER-BENNETT-SIKSEK-20.review.json`.

- **Two Part IIs are justified.** Route 6 is justified because no layer owns Kraus, Martin, the uniform irreducibility cutoffs or Lemos. Route 7 is justified because Elliptic curves is a Tau Ceti roadmap and cannot be re-planned. Route 7 is thin, and should be considered for merging with other Elliptic curves Part II material at the next restructuring.
- **The new roadmap, route 9, is justified.** Nothing in the atlas treats perfect powers in arithmetic progressions by the modular method. Its brief states Theorem 2 exactly: ℓ ≤ exp(10^k) for prime ℓ, and finiteness for each fixed large k, not nonexistence.

## 5. For the design jobs

**Near misses in the pinned libraries.** These are useful as lemmas but do not change any status:

| Items | Declarations | Why it falls short |
|---|---|---|
| 45 | `Orthonormal.sum_inner_products_le` | Bessel's inequality is only the orthonormal special case. |
| 65, 102 | `Chebyshev.theta_le_log4_mul_x`, `Chebyshev.pi_ge`, `Chebyshev.pi_le_log4_mul_div` | Much weaker constants. |
| 141 | `Stirling.le_factorial_stirling` | Lower bound only. |
| 100, 140 | `Nat.count_modEq_card` | The reduction from r ∣ a + nd to a residue class is missing. |
| 72 | Tau Ceti `fundamentalDiscriminant`, `genusCharFun` | Unbundled functions, not Dirichlet characters. |
| 81 | `not_fermat_42` | Covers x⁴ + y⁴ = z², a different equation. |

**Partial overlaps to cite rather than re-own:**

- Items 59–60: the reducibility-to-isogeny step of EllipticCurveModularity R29.1.
- Item 08: the norm argument of R29.3.
- Item 57: ModularForms Layer 10C dimension formulas.
- Item 10: the Sturm bound of ModularForms Layer 10.
- Item 28: the six Möbius substitutions of λ in ModularCurves 9E.
- Item 69: CM.5's supersingular reduction of CM curves.
