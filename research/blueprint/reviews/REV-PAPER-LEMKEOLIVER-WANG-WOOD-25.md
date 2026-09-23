# REV-PAPER-LEMKEOLIVER-WANG-WOOD-25: review of the Lemke Oliver–Wang–Wood extraction

**Verdict: accept, after corrections made in place.** Both routes are accepted. All six recorded source issues are confirmed, and ten new ones are added. None affects the main theorems.
- **Paper.** Lemke Oliver–Wang–Wood, *The average size of 3-torsion in class groups of 2-extensions*, Forum Math. Pi 13 (2025) e19.
- **Extraction.** cc-fb70e5, issue #1352.
- **Reviewer.** Claude Code, session cc-442dc5, which took no part in the extraction.

## Sources read

- **The paper.** The whole published article, 43 pages, open access.
  - The review's copy has SHA-256 `1e4d93b2…780b`, where the extraction's has `7fe1974e…e8`. Cambridge Core stamps every download with a line giving the IP address and time, so no two downloads have the same hash; the text is the same.
  - Crossref records no update or correction relation, and the article page lists none.
- **Ellenberg–Venkatesh.** The preprint of *Reflection principles and bounds for class group torsion*, for its Lemmas 2.2 and 2.3, which the paper imports in relative form.

**Method.** The reading was split across three read-only helper agents of this session: §§1, 2, 7 and 8; §3; and §§4–6. Every discrepancy they reported and every new finding below was then re-read by the reviewer at the page image. Each counterexample was checked with PARI/GP.

## 1. Items

The 35 items cover every definition and theorem on the way to Theorems 1.1, 1.2, 6.1 and 8.1. Nothing is missing. Ten items needed corrections:
- **Item 7 (Ellenberg–Venkatesh).** The extraction gave an absolute version with threshold 1/(4ℓ([L:ℚ] − 1)) and no unramified condition. [EV07] states both lemmas relative to K/K₀:
  - the height bound is H(λ) ≫ Norm(D_{K/K₀})^{1/(2(d−1))};
  - the torsion lemma needs δ < 1/(2ℓ(d − 1)) and unramified primes not extended from a proper subfield containing K₀.

  The paper's (2.2) is the case K₀ = ℚ.
- **Item 8 (Lemma 2.1).**
  - The a_i, b_i must be positive (E7).
  - Condition (3) says that some power of ℘_i and some power of ℘̄_i are each extended from a prime of H, possibly different primes. It does not require a single prime.
- **Item 13.** The note now says where 𝔄_F, 𝔅_F, c_{αβ} and sgn are defined (p.12).
- **Item 14 (Lemma 3.11).** The bound is now stated away from the poles (E9).
- **Item 15 (Lemma 3.13, Proposition 3.12).** The item gives Lemma 3.13 with the weight |Aut_{O_F}(R)|⁻¹ (E10), and the conductor sum over all 𝔮 (E11).
- **Item 16 (Lemma 4.1).** The count is of nontrivial zeros, for t ≥ 0, as printed.
- **Item 17 (Theorem 4.2).** "Log-free" is dropped from the name and from the summary. The printed exponent is c(1 − σ) + ε, and the paper does not call it log-free; only [TZ21] would allow ε = 0.
- **Item 35 (Theorem 8.1).** The paper's examples satisfy different cases, so they are now listed by case:
  - H ≠ C₂ in its regular representation, and nilpotent H without a transposition, satisfy case (1);
  - p-groups with p ≠ 5 odd satisfy case (2).
- **Items 20 and 21.** Locators tidied: the Brauer–Siegel, Landau and Friedman–Skoruppa inputs (item 20) are also used in the proof of Lemma 5.8 on p.25, and the Klüners–Wang inputs (item 21) are on p.23.

## 2. Statuses

The three library items are correct, read at Mathlib 082e2d3:
- `NumberField.classNumber` (ClassNumber.lean:64);
- `NumberField.Units.regulator` (Units/Regulator.lean:266);
- `NumberField.Units.exist_unique_eq_mul_prod` (Units/DirichletTheorem.lean:506).

The planned items are right: AN.8 plans Shintani zeta functions, AN.4 Hecke L-function basics, and IG.4 Shafarevich's theorem.

Neither library has any of the missing items. Searches covered Shintani or prehomogeneous zeta functions, zero-density estimates, Malle and Klüners counts, Brauer–Siegel, ℓ-torsion bounds and class-group averages. No Tau Ceti roadmap owns them either: GlobalNumberFields defers the analytic continuation of Hecke L-functions.

## 3. Routes

Every missing item is routed exactly once (24 + 5 = 29).

- **1. ArithmeticStatistics ST.3/ST.5: accept.** ST.3 owns class-group moments by discriminant and signature, so it takes:
  - Theorems 1.1, 1.2, 6.1 and 8.1;
  - the tail estimates and the relative Ellenberg–Venkatesh lemma that serve only them.

  ST.5 owns the heuristic models, so the Cohen–Lenstra–Martinet prediction and §7 go there.
- **2. AnalyticNumberTheory AN.3/AN.4/AN.8: accept.** The Shintani lemmas go to AN.8, the zero-density family to AN.3, and the residue, regulator and prime-ideal bounds to AN.4.

## 4. Mistakes in the paper

The six recorded issues are confirmed at their locators:
- **E1** (gap, Lemma 2.1). The boxes do not control the block sums t_i. The proposed pigeonhole on Nm_{L/K}(α_i) modulo d-th powers repairs it. Rescaling by units of K alone would not, since it moves t by d·Log of a unit.
- **E2.** d = [L : K], not [L : ℚ].
- **E3.** The exponents are mispaired. Its reason is incomplete: the contradiction also needs ℘̄_r to have negative valuation, because condition (3) forbids both primes being extended, not either one.
- **E4.** ℚ(√2) and ℚ(√−2) both have |Disc| = 8. The same sentence also writes L/F for K/F.
- **E5.** O_L should be O_F, and "Lemma 5.1" should be Theorem 5.1.
- **E6.** An independent PARI computation reproduces 1.4230 (the proof's formula) against 1.4167 (the displayed C_G). The weighted 3-torsion averages over quadratic fields with |D| ≤ 30000 are 1.003921 (real) and 1.054918 (imaginary).

The extraction missed ten mistakes. I found and confirmed them:

| id | kind | where | what |
|---|---|---|---|
| E7 | misprint | Lemma 2.1, p.7 | "integers a_i, b_i" must be positive: a_i = b_i = 0 would give Cl_{L/K}[ℓ] = 0, false for ℚ(√−23), ℓ = 3 |
| E8 | error | proof of Lemma 2.1, p.9 | [O_L^* : O^*O_K^*] ≤ d^d fails: index 8 > 4 for K = ℚ(ζ₇)⁺, L = K(√2) (PARI); the bound is d^{r₁(K)+r₂(K)} |
| E9 | error | Lemma 3.11, p.14 | the convexity bound is claimed at the poles s = 1, 5/6 |
| E10 | error | Lemma 3.13, p.16 | weight must be \|Aut_{O_F}(R)\|⁻¹; for ℚ × ℚ(i), index 5, the printed sides are 1 and 3/2; also R ⊗_ℚ F for R ⊗_{O_F} F |
| E11 | gap | proof of Prop. 3.12, p.18 | sums only square-free 𝔮, but ℚ(∛3) has discriminant −3·9² |
| E12 | error | §3.4, p.19 | the Datskovsky–Wright bijection is with disc(L/F) = disc(K/F), not square-free discriminants: ℚ(√−26) gives disc −104 |
| E13 | misprint | proof of Lemma 4.3, p.21 | σ₁ lacks the max(·, 1/2) of the statement |
| E14 | error | proof of Lemma 5.8, p.25 | N_k(C₂, X) ≤ h₂(k)·#ideals fails: ℚ(ζ₂₉)⁺ has h = 1, narrow class group (ℤ/2)³ (PARI); the factor is O(h₂(k)) |
| E15 | error | §7.2, p.39 | the general prediction omits the Gaussian binomials [a_i choose j]_q; Example 7.2 (a_i ≤ 1) is unaffected |
| E16 | error | §1, p.2 | O(X^{1/2+ε}) is not known for A₄-quartics (best about X^{0.778}); o(X) holds |

Each is written up with its quotation, correction and reason in the extraction's `sourceIssues`.

Four smaller slips are noted in the extraction's notes but not registered:
- "Theorem 7.1" is printed for Proposition 7.1 (p.5);
- a dangling "then for all" in Theorem 6.11;
- F^u(G) is used but never defined;
- the absolute-value bars are missing in Theorem 8.1.

## Checks

- `python3 scripts/check_paper.py` on the extraction: ok.
- The intake `check-files` on the four deliverables passes.

Lean: none.
