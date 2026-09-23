# REV-PAPER-DIMITROV-GAO-HABEGGER-21: review of the Dimitrov–Gao–Habegger extraction

**Verdict: accept, after corrections made in place.** All eight routes are accepted, one with a corrected acceptance test.
- **Status change.** One status changes: the absolute Weil height moves from library to planned.
- **Items.** Twenty items are corrected and five added.
- **Source issues.** E1–E6 are confirmed, E6 with a revised repair, and ten new issues are added.
- **Paper.** Dimitrov–Gao–Habegger, *Uniformity in Mordell–Lang for curves*, Ann. Math. 194 (2021) 237–298.
- **Extraction.** cc-fb70e5, issue #1109.
- **Reviewer.** Claude Code, session cc-442dc5, which took no part in the extraction.

## Sources read

- **The paper.** arXiv 2001.10276v3, whole, with the same SHA-256 as the extraction (`5fc8e86f…a338a4`). The Annals article page offers the PDF only by subscription, so the published text was not collated. Crossref records no correction.
- **David–Philippon**, Comment. Math. Helv. 77 (2002), p.643: Rémond's theorem, which the paper uses after Theorem 1.1.
- **Gao**, arXiv 1810.12929, Theorem 1.3, for E3 and item 25.
- **Method.** Three read-only helper agents of this session split the paper:
  - §§1–2 and Appendix B;
  - §§3–5 and Appendix A;
  - §§6–8.

  Every new finding and every correction was then checked by the reviewer at the page image or re-derived.

## 1. Items

The statements are mathematically right. Corrections made in place:
- **Hypotheses and scope.**
  - Items 36–38 now carry the §3 setting (X closed, irreducible, dominating S, over ℚ̄). Item 37 records that Proposition 4.3 uses dominance and the projectively normal symmetric presentation, but not (Hyp).
  - Item 22 adds (Hyp) and that Δ is the domain of a Betti map; item 25 adds that it is over ℚ̄, and lists Gao's hypotheses.
  - Item 26 requires S regular; item 29 is restricted to abelian schemes over a regular base, which is all the paper uses; item 34 holds for any line bundle.
- **Torelli (item 12).** The extraction repeated the paper's "not injective as we have level structure". In fact τ(C,α) = τ(C′,α′) iff (C′,α′) ≅ (C,±α), so τ is injective on points when g = 2 (E11). The StableReduction Part II acceptance test had the reason backwards and is corrected.
- **Notation, locators and paraphrases.**
  - Items 13 (M ≥ 1; locator p.28) and 18/20 (N ∈ ℤ; item 18 at pp.9–10).
  - Items 33, 41 and 43: locators.
  - Items 39–40: h_{S̄}, not h_S.
  - Item 50: the quasi-section factorization is restated the right way round.
  - Item 62: only ℚ̄-isomorphism classes form a finite set.

**New items:**
- **64. The Height Machine**, planned by RP.0.
- **65. [N]*L ≅ L^{⊗N²}**, planned by Tau Ceti JacobianChallenge layer E.
- **66. Mumford's projective normality**, cited on p.13. Missing; routed to A2.
- **67. Rémond's bound** ([DP02, p.643]). It handles the small-height curves, the polynomial growth in d, and the E6 repair. Missing; routed to the uniformity Part II.
- **68. Faltings/modular/theta height comparisons**, planned by ArakelovGeometryAndAbelianHeights R35.3/R35.5.

## 2. Statuses

**Item 6 was wrongly marked library.** The absolute logarithmic Weil height on ℙⁿ(ℚ̄) is not in Mathlib.
- `Projectivization.logHeight` (NumberTheory/Height/Projectivization.lean:51) is defined for a field with `Height.AdmissibleAbsValues`.
- For a number field it is the product over its places, not normalized by the degree. Mathlib's own TODO lists finite extensions as future work.
- RP.0 plans "normalized absolute heights", so the item is now planned by RP.0.

The other planned layers were checked against `data/atlas.json`. They are right: PELModuli M5–M6, R09.5, R09.7, RP.0, RP.1, RP.4, RP.5, and Tau Ceti AlgebraicCurves layer 11.

## 3. Routes

Every missing item is routed exactly once (6 + 3 + 6 + 1 + 10 + 25 + 2 + 1 = 54). The Part II ids and titles agree with the other papers that propose them (YUAN-26, GAO-HABEGGER-19, GAO-GE-KUHNE-26, DEMARCO-KRIEGER-YE-20, DEMARCO-MAVRAKI-YE-26). All routes are accepted; the StableReductionPartII acceptance test is corrected (E11).

## 4. Mistakes in the paper

**The recorded issues.** E1–E5 are confirmed at their locators. E6 is confirmed as a gap, but its correction is revised:
- **The gap.** The proof of Theorem 1.4 applies Raynaud curve by curve, which does not bound the torsion uniformly in P₀.
- **The extraction's repair was wrong in three ways.** It needed Raynaud's theorem for subvarieties, not the cited curve paper. It misplaced the components of the D₁ preimage. And it claimed that g = 2 requires Kühne's later theorem.
- **The actual fix.** Rémond's bound, which the paper already uses after Theorem 1.1, does the job. With X = C − P₀ and Γ the torsion subgroup, the count is at most (2^{34}·h₀(Jac C)·deg C)^{4g^5}, which is independent of P₀, for every g ≥ 2.

**Ten further mistakes**, found by helper agents and checked by the reviewer:

| id | kind | where | what |
|---|---|---|---|
| E7 | misprint | pp.17–18 | ϑ (on S) and θ = ϑ∘π are swapped twice |
| E8 | error | p.17 | extending ϑ by 0 off K is not smooth when dim S < m; any smooth extension works |
| E9 | error | (4.13), p.21 | the bound is 0 when D′ = 0; use max{1, D′} |
| E10 | gap | pp.39–40 | the final Height Machine step compares heights on the resolution; valid over S by a Serre global-generation argument |
| E11 | error | p.6 | "not injective as we have level structure" is false for g = 2 |
| E12 | misprint | p.6 | the target of D_M is 𝔄_g^{[M]} ×_{A_g} M_g |
| E13 | misprint | p.4 | the ball count is (1 + 2√(c₀c₃))^ρ, as on p.34 |
| E14 | gap | pp.11–12 | the proof of Proposition 2.7 is incomplete; see below |
| E15 | gap | p.43 | the second dévissage must pick x over S′^{sm} (Lemma B.3) |
| E16 | misprint | p.27 | the Betti map target is T^{2Mg} |

On E14: the proof infers non-isolated fibres from rank < 2d, which fails for real-analytic maps, and asserts complex curves C_x tangent to the kernel. The statement holds pointwise instead. From (2.1), ker ω|_{T_xX} = ker db_Δ|_{T_xX}, since da(v) + Z·db(v) = 0 forces db(v) = da(v) = 0.

None affects a stated theorem.

**Noted but not registered:**
- ĥ_{Ā} for ĥ_𝓐 (p.40);
- "basis" for a spanning set (pp.13, 24, 46);
- a missing db in the p.10 computation;
- s for s₀ (p.12);
- the Ξ_s points dropped from the final count;
- the loose shrinking steps in the fourth and fifth dévissages;
- typos.

## Checks

- `python3 scripts/check_paper.py` on the extraction: ok.
- The intake `check-files` on the four deliverables passes.

Lean: none.
