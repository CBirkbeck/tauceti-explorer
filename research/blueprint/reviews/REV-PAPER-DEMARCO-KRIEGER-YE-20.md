# REV-PAPER-DEMARCO-KRIEGER-YE-20: review of the DeMarco–Krieger–Ye extraction

**Verdict: accept, after corrections made in place.** All three routes are accepted. All eight recorded source issues are confirmed. Two of them had their corrections revised (E5 and E7) and one had its reason narrowed (E8). Five new issues are added, and four new items.
- **Paper.** DeMarco–Krieger–Ye, *Uniform Manin–Mumford for a family of genus 2 curves*, Ann. Math. 191 (2020) 949–1001.
- **Extraction.** cc-fb70e5, issue #1127.
- **Reviewer.** Claude Code, session cc-442dc5, which took no part in the extraction.

## Sources read

- **arXiv 1901.09945v2**, whole, with the same SHA-256 as the extraction (`8fc51ac3…bab8`).
- **The published version.** The extraction reported it inaccessible, but the journal site serves it (annals-v191-n3-p05-s.pdf, 53 pages, SHA-256 `7a4bd817…07df`). It was collated at every recorded mistake and at the new ones; the same text is there each time. It differs from v2 as follows:
  - **Remark 1.3.** It is inserted, so v2's Conjecture 1.3, Theorems 1.4–1.7, Proposition 1.8 and Theorem 1.9 become Conjecture 1.4, Theorems 1.5–1.8, Proposition 1.9 and Theorem 1.10.
  - **§8.4.** New: Proposition 8.3, no uniform bound on the order of common torsion images.
  - **§9.5.** New: Proposition 9.2, the same for Theorem 1.1.
- **Method.** The reading was split across three read-only helper agents of this session:
  - §§1–2 and 8.2–9;
  - §§3–6;
  - §§7–8.1 with Proposition 3.5.

  Every discrepancy and new finding was then checked by the reviewer at the page image, by hand or with PARI/GP.

## 1. Items

Most statements match. Corrections made in place:
- **Item 2.** Adds the form of Raynaud's theorem used after Conjecture 1.3 (a curve of genus ≥ 2 in an abelian variety).
- **Item 4.** Its note needed t₁ transcendental: an algebraic common image lies in π(E_t^tors) for all t only then.
- **Items 15, 16, 18, 19 and 22 (§2).**
  - Item 15: the metric formula needs r₁ ≥ r₂.
  - Item 16: the Laplacian is distribution-valued, and the positivity statement is the intended one, not the printed one (E9).
  - Item 18: the metric determined by the measures is unique only up to constants.
  - Item 19: adds the equality case of Proposition 2.2 and the continuity of E_v used on p.37.
  - Item 22: states its hypotheses.
- **Items 26–34 (§§3–5).**
  - Item 26: (3.1) holds for |t(t − 1)|_v ≥ 1, not |t|_v ≥ 1. For p = 3, t = 4, z = 1 the latter gives the wrong value.
  - Item 27: gives the ranges of (3.4)–(3.5), and the diameter |Δ_t|^{1/6} of the potentially-good support point with its proof. The resultant of f_t is Δ_t².
  - Items 29 and 31: restore C > 1, a ≥ b and M > 1.
  - Item 34: starts on p.27.
- **Items 40, 46 and 49.**
  - Item 40: counts multiplicity.
  - Item 46: records the origins O_i over the common branch value, and that ker Φ has three *nontrivial* elements.
  - Item 49: now covers Néron–Tate heights on abelian varieties, including invariance under torsion translation, which E8's correction uses.
- **Published numbering.** Items 4–9 and 42 now carry the published numbering and pages.

**New items:**
- **50. Standard projections of arbitrary elliptic curves.** Used by Corollary 8.2 and Proposition 9.1. Missing; routed to DY.6.
- **51. Hyperelliptic involution and Weierstrass points of genus-2 curves.** Planned by Tau Ceti AlgebraicCurves layers 10–11.
- **52. Proposition 8.3 of the published version.** Missing; routed to DY.6.
- **53. Proposition 9.2 of the published version.** Missing; routed to the uniformity Part II.

## 2. Statuses

- **Mathlib (082e2d3).**
  - `WeierstrassCurve` (Weierstrass.lean:77) with a₂ = −(1+t), a₄ = t;
  - `WeierstrassCurve.ψ` (DivisionPolynomial/Basic.lean:401);
  - `Projectivization.logHeight` (Height/Projectivization.lean:51).
- **Tau Ceti (f790474).** `canonicalHeight` (CanonicalHeight.lean:124) and `canonicalHeight_eq_zero_iff_isOfFinAddOrder` (:338). The latter has the normalization ĥ_{E_t} = ½ ĥ_t∘π that §9.4 needs.
- **Planned layers.** DY.1, DY.4, TB.0–TB.1, RP.0, RP.5, Tau Ceti AlgebraicCurves 7 and JacobianChallenge D and F are right.
- **Missing.** Nothing in the atlas plans Berkovich potential theory, the hybrid space or the Arakelov–Zhang energy.

## 3. Routes

Every missing item is routed exactly once (34 + 2 + 4 = 40).

- **1. ArithmeticDynamics DY.2, DY.4 and DY.6: accept.** Theorem 7.1 must be carried with the repaired η_v above 2 and the corrected (7.5).
- **2. TropicalAndBerkovichArithmetic TB.0, TB.1 and TB.6: accept.** The hybrid space is a Berkovich spectrum of a hybrid Banach ring, so TB.0 is right for it.
- **3. HeightsRationalPointsAndObstructionsPartII: accept, amended.** The brief adds Proposition 9.2 and the Tau Ceti AlgebraicCurves import. Stoll's curve y² = x⁶ + 130x³ + 13 is bielliptic, since x⁶f(c/x) = 13f(x) for c³ = 13, so the acceptance "B ≥ 34" is right.

## 4. Mistakes in the paper

**The recorded issues.** All are confirmed at their locators in both versions. Revisions:
- **E4** (1/8 should be 1/16). A helper agent built an explicit instance: K = ℚ(√2, √3, √5, √7), with s and t products of fundamental units. There the maximum is 26.09, below (1/8) log(1/δ) = 49.45 but above (1/16) log(1/δ) = 24.72.
- **E5** ((7.5)). The extraction's correction was still false. Bounding place by place gives
  - Σ_v −r_v log η_v ≤ **4**(h(t₁) + h(1 − t₁) + h(t₂) + h(1 − t₂)) − log c(ε′).

  For K = ℚ(ω), t₁ = 2, t₂ = −ω the left side is 3 log 2 − log c(ε′). The printed next display is exactly this bound divided by 2|F|, so nothing downstream changes.
- **E6.** The missing ε′ is already absorbed by the paper's own choice ε′ < ε/16.
- **E7** (η_v at places above 2). Confirmed as an error that matters; the repair η_v := |2|_v·min{…} is correct and sufficient.
  - ψ₃(ω, t) = −(t² − (6ω² − 4)t − (3ω − 4)).
  - The resultant of f_t is Δ_t², so the potentially-good support point has diameter |Δ_t|^{1/6}.
  - The reason is corrected on two points. First, supersingularity is not why the torsion lands in the bad disk. Second, the counterexample alone gives a loss divided by |F|, but in general the loss is a constant. When |t_i(t_i − 1)|_v = 1 above 2, every torsion image other than ∞ is integral, because |f_t(x)| = |x|/|4| for |x| > 1. So the regularized measure is the Gauss point, and ĥ_{t_i} · h_{F,η} ≥ (1/3) log 2 whatever F is.
- **E8.** The reason is narrowed: the identity holds for the Weierstrass point paired with Q and fails for the other four. A helper agent checked this over F₇₃ with explicit addition.

**Five further mistakes.** All were found by helper agents and checked by the reviewer:

| id | kind | where | what |
|---|---|---|---|
| E9 | misprint | §2.7, p.12 (pub. p.961) | "(ν₁,ν₂)_v ≥ 0 with equality iff ν₁ = ν₂" is false (take ν and −ν); intended: (ν,ν)_v ≥ 0 with equality iff ν = 0 |
| E10 | misprint | §2.3, p.8 (pub. p.956) | type II/III are r ∈ / ∉ \|ℂ_v^×\|, not rational/irrational r (D(0,1/2) in ℂ₃ is type III) |
| E11 | gap | §2.6, p.10 (pub. pp.958–959) | the justification of (2.7) proves only "measures ⇒ height"; the converse follows from (1.3) or [PST] |
| E12 | misprint | (3.5), p.17 (pub. p.965) | the middle range is printed \|4\| < \|z\| < \|t/4\|, empty for \|t\| ≤ \|16\|; it is \|t/4\| < \|z\| < \|4\| |
| E13 | misprint | (5.4)–(5.5), p.29 (pub. p.978) | i = 0, …, n should be n − 1 |

None affects a stated theorem.

**Noted but not registered:**
- the Diag in (2.14);
- "(singular) curve" after Conjecture 1.3;
- a typo on p.47;
- the missing r_v on p.41;
- the loose factor 16 in §9.3;
- several cosmetic slips in §§5–6.

## Checks

- `python3 scripts/check_paper.py` on the extraction: ok.
- The intake `check-files` on the four deliverables passes.

Lean: none.
