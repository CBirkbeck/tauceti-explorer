# REV-PAPER-BAKKER-TSIMERMAN-16 — independent review of the Bakker–Tsimerman extraction

**Verdict: accept, with corrections made in place.** Reviewer: Claude Code, session `cc-fb70e5`, 21 September 2026. This reviewer did no part of the extraction.

**Paper.** Benjamin Bakker and Jacob Tsimerman, *p-torsion monodromy representations of elliptic curves over geometric function fields*, Annals of Mathematics 184 (2016), 709–744, DOI 10.4007/annals.2016.184.3.2, together with the authors' five-page erratum (https://benjamin-bakker.github.io/P.torsion.erratum.pdf). Both files were fetched on 21 September 2026, and their SHA-256 values match those the extraction records: `814976ee…f40a` for the paper and `db8effa1…acc1` for the erratum. The whole paper and the whole erratum were read. Pages with dense formulas (713, 718, 732, 735, 740, 742 and erratum pp. 3–4) were rendered and read as images.

**Checks run.**

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-BAKKER-TSIMERMAN-16.result.json` reports `ok` on the corrected file.
- Library claims were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.
- Every cited stage was checked against `data/restructure/`. Only RS-29 is relevant: it narrows InverseGalois IG.0 and IG.3.

## 1. Items

Fidelity is high:

- Every numbered result of the paper and every proposition of the erratum has an item.
- Hypotheses, constants and exponents match the printed text, and the erratum's changes are applied in the right places. These are Heegner-only repulsion with h₀ = 1; the conjugate-diagonal route for anti-Heegner points; the new proof of Proposition 25; and the corrected bicusp exponents p^{−1−2δ₂} and p^{−1−2δ₃+3δ₁} with 3δ₁ < 2δ₃.
- The proof chain of Theorem 29 (items 84–90) is broken down faithfully.
- The extraction's own corrections of printed slips were confirmed: σ₁(m) versus ψ(m) for the degree of the cyclic Hecke correspondence, Lemma 15's order-three case, the Riemann–Hurwitz step of Theorem 29, and the inverted ratio sinh(ρ/2)/sinh(ε) on erratum p. 3.

What needed correction was local.

**Statements.**

- **Items 13 and 30.** The paper's definition for the cusped surface (p. 718) is "the infimum of the lengths of closed geodesics … homotopically nontrivial in the smooth compactification". It has no factor ½, yet Lemma 5's 2 log p + O(1) holds only for half the length, since the translation lengths are 4 log p + O(1). The extraction had silently halved and dropped the nontriviality condition. Both statements now state the ½ explicitly and restore "homotopically nontrivial in X(p)".
- **Items 38–40.** Lemmas 10 and 11 assume only "take δ < 1/2", with γ ∈ G(p) ≅ PGL₂(F_p). The items had added smallness and large-p conditions and restricted γ to PSL₂(F_p).
- **Item 41.** Proposition 12(a) is for *distinct* cusps.
- **Item 109.** The area of a cofinite quotient is 2π(2g − 2 + s + Σ(1 − 1/m_j)). The item's wording about subtracting Σ 1/m_j was garbled.

**Locators.**

- Item 37 is in §3.3, "Heights", p. 721. The paper has no §3.4, and the extraction's `readSections` repeats the error.
- Item 35 is in §3.2, equations (2)–(3), p. 721.
- The page ranges of items 10, 31, 33 and 34 were corrected.

**Notes.**

- **Item 45.** Only the *repulsion* claim of Remark 16 is false. Its first clause, that Hecke curves contain no anti-Heegner points, is true and the erratum uses it.
- **Items 82 and 98.** Equation (9) is among "the remarks preceding Theorem 29". With it, g < N gives gon ≤ ⌊(N + 2)/2⌋ < N for N ≥ 3, so Corollary 30's reuse of M_N is correct for N ≥ 3.

**Missing supporting items, now added as 113–120:**

- **113:** the CM± coset criterion from the proof of Proposition 14. This is where the erratum's h₀ correction sits.
- **114:** Hecke divisors H_m ⊂ Z(p), and the notion of a non-Hecke curve.
- **115:** Hecke curves contain no anti-Heegner points.
- **116:** the Kobayashi-metric facts behind Proposition 7 and equation (2).
- **117:** the potential identity behind Proposition 23. The printed prefactor −1/2π there is inconsistent with the stated d^c normalisation.
- **118:** the uniformisation maps i_p and γ_p, and ker γ_p.
- **119:** Hermann's theorem that Z(p) is of general type for p > 11, which makes the minimal model of Corollary 32 unique.
- **120:** the cusp and genus counts of X(p) used in Lemma 28. These were checked at p = 5 (genus 0) and p = 7 (genus 3).

## 2. Statuses

**Library (7 as submitted, 6 confirmed).**

- **Confirmed:**
  - `UpperHalfPlane.dist_eq` (curvature −1);
  - `UpperHalfPlane.volume_def` and `volume_eq_lintegral`;
  - Tau Ceti `pseudoHyperbolicExpr_map_le` (Schwarz–Pick);
  - the Tau Ceti finite-stabiliser lemmas `Subgroup.isCyclic_stabilizer`, `stabilizerDeriv_injective`, `orderOf_stabilizerDeriv` and `exists_isPrimitiveRoot_stabilizerDeriv`;
  - Tau Ceti's function-field Riemann–Roch (`isRiemannRochDivisor_weilDifferentialDivisor`, `exists_isRiemannRochDivisor`);
  - Tau Ceti's canonical degree (`degree_weilDifferentialDivisor`, `degreeClass_canonicalClass`).
- **Not confirmed: item 09.** The cited Tau Ceti declarations exist, but `hyperbolicDist = artanh p` is half the curvature −1 distance, as the library's own ClosedForm file notes. The factor-two bridge the item states is not a declaration, so it is `missing` and routed to route 2, whose brief already requires the conversion.

**Planned (9 as submitted).**

- **Confirmed:**
  - item 18: Néron n-gons (R13.1);
  - item 27: Hecke push–pull (R14.1 and SF.5);
  - item 79: the curve/function-field/analytic dictionary (AlgebraicCurves Layer 12 and C4);
  - item 80: Riemann–Hurwitz (FuchsianOrbifolds Layer 5 and AlgebraicCurves Layer 7).
- **Item 17 changed to `missing`.** R12.6 plans compatibility of the comparison with complex conjugation for the upstream curves only. It does not construct the involution on the projectively framed Y(p), which is itself missing (item 15).
- **Item 109:** the citation now names FuchsianOrbifolds Layers 2, 4 and 6. The quotient area formula is Layer 4, and the (π/3)·index formula needs Layer 6.
- **Item 110:** Layer 4 added for the "underlying surface P¹" clause.
- **Items 83 and 103** are partly planned. Notes now record the unplanned clauses as design obligations:
  - item 83: projectivity of Zⁿ/S_n;
  - item 103: the comparison over C with topological covers, where Tau Ceti has the topological Galois category.

**Missing.** No missing item is fully supplied by either library. The useful near misses are now named in the notes:

- gonality ingredients: Tau Ceti Weierstrass gaps and the genus-zero criterion;
- the matrix height: Mathlib's `Matrix.seminormedAddCommGroup`, as a local instance.

## 3. Corrections made in place

- Item 09: `library` changed to `missing` — Tau Ceti's PoincareDisc distance is artanh of the pseudo-hyperbolic distance, half the curvature −1 distance, so the factor-two bridge the item states is not a declaration; routed to route 2, whose brief already requires that conversion.
- Item 17: `planned` changed to `missing` — R12.6 plans conjugation-compatibility of the comparison for the upstream curves only, not the involution on the projectively framed Y(p); routed with item 15 as a source of ModularCurvesPartII (route 1, which now also names R12.6).
- Item 109: statement repaired to area = 2π(2g − 2 + s + Σ(1 − 1/m_j)); planned citation extended from FuchsianOrbifolds Layer 2 to Layers 2, 4 and 6, which together plan the quotient area and the index formula.
- Item 110: FuchsianOrbifolds Layer 4 added to the citation for the "underlying surface is P¹" clause, which Layer 2 does not cover.
- Items 83, 103 and 37: notes record what the cited layers or Mathlib cover and what remains a design obligation; statuses unchanged.
- Items 13 and 30: the cusped injectivity radius is now stated with the factor ½ that Lemma 5 needs (the printed definition on p.718 omits it) and with the condition "homotopically nontrivial in X(p)" restored.
- Items 38–41: hypotheses restored to the printed ones (δ < 1/2 in Lemmas 10–11, γ ∈ G(p) ≅ PGL₂(F_p), distinct cusps in Proposition 12(a)).
- Notes on items 45, 82 and 98 corrected: only the repulsion claim of Remark 16 is false (Hecke curves still avoid anti-Heegner points), and equation (9) justifies reusing M_N in Corollary 30 for N ≥ 3.
- Locators corrected: item 37 (§3.3, p.721 — the paper has no §3.4), item 35 (§3.2, equations (2)–(3), p.721), and the page ranges of items 10, 31, 33 and 34.
- Eight supporting items added (113–120): the CM± coset criterion, Hecke divisors and non-Hecke curves, the absence of anti-Heegner points on Hecke curves, Kobayashi-metric facts, the potential identity behind Proposition 23, the maps i_p and γ_p, Hermann's general-type theorem, and the cusp/genus counts of X(p); routed to routes 3, 3, 3, 2, 2, 3, 3 and 1 respectively.

The corrected file has 120 items: 6 library, 8 planned and 106 missing. Every missing item is routed exactly once.

## 4. Routes

All five routes are accepted; the reasons are in `PAPER-BAKKER-TSIMERMAN-16.review.json`. A catalogue-wide search found no layer that plans any of the following:

- a congruence spectral gap or a bound towards Selberg's conjecture;
- the Gelbart–Jacquet symmetric-square lift;
- gonality or the Li–Yau estimate;
- positive currents or Lelong numbers;
- Frey–Mazur-type rigidity or the diagonal quotient surface Z(p).

The three Part IIs are therefore justified, as extensions of FuchsianOrbifolds, of ModularCurves (a sibling of ModularCurvesPartII, which it imports) and of AutomorphicSpectralTheory. The two source routes, to ModularCurvesPartII and SchemeAndStackFoundations SF.4, name layers that own their items.

Two points for later restructuring:

- Gonality is algebraic-curve theory placed in the hyperbolic-volumes Part II beside the Li–Yau bound that uses it.
- The spectral-gap Part II is a single-theorem roadmap.
