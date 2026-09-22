# REV-PAPER-HARPAZ-WITTENBERG-23 — independent review of the Harpaz–Wittenberg extraction

**Verdict: accept, with corrections made in place.** Reviewer: Claude Code, session `cc-fb70e5`, 22 September 2026. The extraction is by Codex (checkpoint `codex-c83e7a`, continuation `codex-a71f92`); this reviewer did no part of it.

**Paper.** Yonatan Harpaz and Olivier Wittenberg, *The Massey vanishing conjecture for number fields*, Duke Mathematical Journal 172 (2023), 1–41, DOI 10.1215/00127094-2022-0004. The version read is the author final version (https://www.math.univ-paris13.fr/~wittenberg/globalmassey.pdf, 33 pages, revised 9 December 2021). It was fetched on 22 September 2026 and its SHA-256 matches the recorded value (`d95100eb…546f`). The arXiv v2 TeX source of 1904.06512 was used alongside it. The published Duke pagination was not available, as the extraction also records.

**Checks run.**

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-HARPAZ-WITTENBERG-23.result.json` reports `ok` on the corrected file.
- All 156 items were read against the paper. The formula-heavy pages (6, 14, 17, 22 and 27) were checked on page images.
- Finite computations:
  - Lemma 4.13 holds for every σ at (n,p) = (3,2), (3,3), (4,2), (4,3), (5,2) and (6,2).
  - Proposition 6.1 holds at n = 4, 5. At (6,2) it fails for 3 of the 64 σ, as the paper warns it may for n = 6.
  - Example 6.3 gives Sha¹_cyc ≅ Z/2.
  - The extraction's own n = 6 examples (items 76 and 77) and the finite-group part of its Remark 3.4 witness (items 144–148) check out.
- Library claims were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.
- Every cited stage was read in `data/atlas.json` against the accepted restructures (RS-28 and RS-29 touch the cited owners) and `data/roadmap-retirements.json`. Every `tauceti:` anchor was checked against the upstream README headings.
- Every `area` was checked against `data/galaxies.json` and `data/roadmap-classification.json`.
- Other extractions were searched for overlapping routes.

## 1. Items

The extraction is faithful and unusually thorough. No item is mathematically wrong. The corrections are about precision:

- **Item 46 (Remark 3.4).** The statement was the extraction's own explicit witness: an order-512 extension and SL₅₁₃ over C((x))((y))((z)). The paper only asserts that such a homogeneous space and class exist, and says it omits the details. The statement is now the paper's claim, and the witness is kept in the note as a labelled completion.
- **Items 43, 45 and 47.** These now carry §3's standing hypotheses (p. 8): characteristic 0, a semisimple simply connected group, finite stabilizer, and Pic(V_k̄) ≅ Hom(H^ab, k̄^×).
- **Item 27.** This is now Pál–Schlank's Theorem 9.6 for an arbitrary finite embedding problem. The paper applies it to W (p. 22) and T(W) (p. 27) as well as to V.
- **Items 20 and 102.** Item 20 gains the identification Z ≅ F_p via e_{0,n} and the factor-set convention. Item 102 gains its field hypothesis.
- **Item 118.** The note now says that Theorem 7.4 as printed omits "k a number field", and that the scope comes from p. 4.
- **Notes on items 42, 52, 65 and 83.**
  - Item 42's "Correction:" was about outer exponents, not the paper, and is now "Remark:".
  - Item 52's suspected indexing slip is Michailov's, not this paper's, and is marked unverified.
  - Item 65's "Remark 4.8" should be the unnumbered remark after Lemma 4.7 on p. 14. Remark 4.8 on p. 15 concerns the injectivity of α.
  - Item 83's cup order and sign are a convention.
- **Locators.** Twenty-three were off, mostly by one page in §4 and §5, and are now corrected.
- **Coverage.** The proof of Proposition 3.3 reduces to V(k) ≠ ∅ and then imports Lucchini Arteche's Théorème 4.15 (p. 11). That theorem had no item, and it is now item 158.

## 2. Statuses

All ten library citations hold at the pinned commits. The catalogue check found seven status changes, each justified by the owning stage's text:

- **Item 9 (the continuous cochain algebra): planned → missing.**
  - ProfiniteCohomology Layer 3 compares cochains only in "degrees 0, 1, 2".
  - Layer 10's canonical model "has no inhomogeneous cochains".
  - Layer 12 plans only an associativity homotopy (`cupAssocHomotopy`).
  - A Massey product needs a strictly associative cochain algebra.
- **Item 17 (the lifting obstruction): missing → planned** by ProfiniteProPGroups Layer 5, which plans "an extension has a continuous group-theoretic section if and only if its class in H²(G, M) is zero".
- **Item 24 (the torsor T_α): SF.1 → ModularCurves 0D.** 0D plans the equivalence between finite étale K-schemes and finite continuous Galois sets, and RS-29 names it as owner.
- **Item 58 (prime-to-p restriction injectivity): R02.2 → ProfiniteCohomology Layers 6, 10 and 9.** These plan cor∘res = (G : U) and the annihilation of restriction-killed classes. Degrees 1 and 2 are in the library as `explicitCor1_comp_res1` and `explicitCor2_comp_res2`.
- **Items 23 and 81 gain suppliers.** Item 23 adds IG.4 (properness, kept by RS-29). Item 81 adds HL.2, since the paper's local fields include equal characteristic and ClassFieldTheory Layer 5 exports only the mixed-characteristic pairing.
- **Item 40 is split.** The generic Hochschild–Serre Brauer sequence stays planned by SF.2. That citation is weak, because SF.2 never names Hochschild–Serre, and SF.2 should receive a request. The new item 157 records that these homogeneous spaces have only constant geometric units (Rosenlicht); it is missing and belongs to the homogeneous-Massey Part II.

Counts are now 10 library, 15 planned and 133 missing, out of 158 items. Every missing item is routed exactly once.

## 3. Routes

Route 1 (SF.1) is removed because its only item now has a Tau Ceti owner, so the routes are renumbered and the review file gives the old numbers. All nine are accepted.

- **The two Part IIs no longer import each other.** As submitted, the ProfiniteCohomology Part II held the final theorem and imported the homogeneous-Massey Part II, and that Part II in turn imported the first one's finite-matrix layers. The final arithmetic theorems, items 96 (Theorems 1.3/5.1), 118 (Theorem 7.4) and 119, now sit in the homogeneous-Massey Part II.
  - The ProfiniteCohomology Part II ends at Dwyer's correspondence, the refined local lifting theorem at all places, the twisted analogues and the Z/8 counterexample (Theorem 7.5).
  - Both briefs say this, and the imports go one way.
- **Route 7 (ProfiniteCohomology Part II)** gains item 9 and loses item 17. It adds HL.2 and ProfiniteCohomology Layer 9 (Kummer theory) as imports. It now asks for one owner of the items it shares with Merkurjev–Scavia's route 6, a second proposed ProfiniteCohomology Part II: the embedding-problem lifting criterion, the unitriangular filtration, and characteristic-p cohomological dimension.
- **Route 8 (homogeneous-Massey Part II)** gains items 96, 118, 119, 152, 155, 157 and 158. It adds Chebotarev (Layers 9–10), ModularCurves 0C–0D and ProfiniteProPGroups Layer 5 as imports.
- **Areas.** Both Part IIs use `algebraicnt`, which is a valid galaxy id. By the usual convention a Part II takes its parent's galaxy, which would be `homological` for route 7 and `arithmeticgeometry` for route 8. Route 8 was left unchanged because PAPER-HARPAZ-WITTENBERG-20 route 13 gives the same roadmap `algebraicnt`. If the maintainer prefers `arithmeticgeometry`, both routes should change together.

## 4. A shared roadmap id, and what the queue does with it

Route 8's roadmap `HeightsRationalPointsPartIIHomogeneousMassey` is also PAPER-HARPAZ-WITTENBERG-20 route 13. This is deliberate: that brief says to extend this candidate with the complete HW20 foundation.

`research/blueprint/make_queue.py` builds one design job per accepted Part II route and does not merge routes that share an id. Once both reviews accept, it would emit two `DESIGN-HeightsRationalPointsPartIIHomogeneousMassey` jobs, and the second prompt file would overwrite the first. The brief here now says the design job must take both briefs and own the shared items once. The queue script itself needs a merge for shared ids; that is a maintainer decision.

## 5. Mistakes in the paper

These are for the errata job ERRATA-PAPER-HARPAZ-WITTENBERG-23 (#1715), whose findings go in `research/blueprint/errata/PAPER-HARPAZ-WITTENBERG-23.json`. The extraction corrected most of them silently. Each was confirmed at its locator in the author final version. No correction was found in the arXiv versions (v2 is marked final), on the authors' page or in a web search. The Duke version was not compared.

1. **Proposition 2.5, p. 6 (misprint).** "V(k) ≠ 0" should read V(k) ≠ ∅.
2. **§2, p. 6 (misprint).** "a smooth compactification of V^c" should read "of V". Not noted by the extraction.
3. **Lemma 4.7, p. 14 (error at p = 2 only; affects nothing downstream).** "The outer exponent of U¹ is equal to p." Under Definition 3.2's least-divisor convention it is 1 when p = 2. The proof's divisibility step works only for odd p, and the uses need only the factorization through (Z/p)^×.
4. **Proof of Lemma 4.7, p. 14 (misprint).** "Divisible by 9" should read "divides 9".
5. **Proof of Lemma 4.13, p. 17 (misprint).** e_{0,3} should read e_{0,3}^{a₂}.
6. **Proof of Proposition 5.3, p. 19 (misprint).** "The lemma … lifts to Z" should read "the proposition … lifts to U".
7. **Proof of Proposition 5.3, p. 21 (misprint).** ρ_{v,u} (twice) should read ρ_{u,v}. Not noted by the extraction.
8. **Diagram (5.7), p. 22 (misprint).** Br_{1,nr}(W)/Br₀(V) should read Br_{1,nr}(W)/Br₀(W).
9. **Proofs of Theorems 5.1 and 7.4, pp. 22 and 28 (gap; affects the proof).** Proposition 5.3 is stated only for non-archimedean local fields (p. 19) but is applied at every place. The real places are easily handled: complex places trivially, real places with p odd because a p-group admits only the trivial map from C₂, and real places with p = 2 by Tate duality over R.
10. **Lemma 5.5, p. 19 (error in stated generality; affects nothing).** It is stated for arbitrary discrete modules, but it needs C finitely generated. The extraction gives a valid counterexample (item 139). The application has C finite.
11. **Proof of Proposition 6.1, p. 23 (misprint).** "4 × 4" should read 5 × 5.
12. **Proposition 7.3, p. 26 (error in the literal statement; affects nothing).** The bijection must fix the chosen adjacent cocycles. The extraction's counterexample (item 111) is valid, and the existence statements are unaffected.
13. **Theorem 7.4, p. 27 (misprint).** The hypothesis "k a number field" is omitted.
14. **Proof of Theorem 7.4, p. 27 (misprint).** Hom(N_{i+m}, N_i) should read Hom(N_{i+m+1}, N_i).
15. **Proof of Theorem 7.4, p. 28 (misprint).** The external ⊕ counts the corner Z twice; it should be an internal sum.

Also minor:
- p. 3: α₁,…,αₙ should read α₀,…,α_{n−1};
- p. 7: missing words in Theorem 2.6;
- p. 10: Ĥ^ab_v should read Ĥ^ab_v̄;
- p. 20: Γ_k should read Γ_K;
- p. 22: Γ should read Γ_k;
- p. 29: "L ⊂ k̄" should read "L ⊂ Q̄", and "identity" should read "identify".

Remark 3.4 and the n = 6 claims are stated without proof, but the paper says so, so they are not mistakes. The cup order and sign in Lemma 5.5 depend on conventions and are not recorded as a mistake.

## Corrections made in place

- `9` (continuous cochain DGA): planned → missing, added to route 8. ProfiniteCohomology Layer 3 is limited to "degrees 0, 1, 2" and Layer 12 plans only an associativity homotopy; nothing plans the strictly associative cochain algebra a Massey product needs.
- `17` (lifting obstruction u): missing → planned [ProfiniteProPGroups Layer 5], removed from route 8. Layer 5 plans that an extension splits continuously iff its class in H²(G, M) vanishes, and the embedding-problem form.
- `24` (torsor T_α): planned SF.1 → ModularCurves 0D, which plans the finite-étale/Galois-set equivalence and is the RS-29 owner. Route 1 (SF.1), which carried only this item, is dropped.
- `58` (prime-to-p restriction injectivity): planned R02.2 → ProfiniteCohomology Layers 6, 10 and 9 (cor∘res = index; restriction-killed classes annihilated by the index), removed from route 5.
- `23`: added IG.4, which RS-29 keeps as owner of the properness (surjective lift) condition.
- `81`: added HL.2 ("finite-coefficient duality for primes invertible in the relevant fields … ordinary local duality at n=1"); ClassFieldTheory Layer 5 exports only the mixed-characteristic pairing, while the paper's local fields include equal characteristic (p.19).
- `40` split: the generic Hochschild–Serre Brauer sequence (with the constant-unit hypothesis as a hypothesis) stays planned by SF.2 (weak; SF.2 should get a request). New item `157`, that these homogeneous spaces have only constant geometric units, is missing and routed to route 9.
- `152` (splitting-variety fundamental-extension comparison) and `155` (H³(k, k̄^×) = 0 for function fields of curves) moved from route 2 to route 9: SF.2's generic sheaf cohomology plans neither.
- `46` (Remark 3.4): the statement is now the paper's existence claim; the extraction's explicit witness, which the paper does not give, moves to the note as a labelled completion.
- `43`, `45`, `47`: §3's standing hypotheses (p.8) added to the statements.
- `27`: stated as Pál–Schlank Theorem 9.6 for an arbitrary finite embedding problem, since the paper also applies it to W (p.22) and T(W) (p.27), with the U case as the specialization.
- `20`: records the identification Z ≅ F_p via e_{0,n} and the factor-set convention.
- `102`: adds "k of characteristic 0, a, b ∈ k^×" (Example 6.3).
- `118` note: records that Theorem 7.4 as printed omits "k a number field", with the scope taken from p.4.
- `42` note: "Correction:" changed to "Remark:" (the sentence is about outer exponents, not a slip in the paper).
- `83` note: the cup order and sign are presented as a convention, not as a slip in the source.
- `52` note: the suspected indexing slip is attributed to Michailov's paper and marked unverified.
- Locators corrected against the page markers of the author PDF: items 1, 2, 3, 4, 15, 54, 55, 59, 60, 64, 65, 66, 67, 68, 70, 71, 76, 77, 78, 88, 89, 90, 45.
- New item `158`: Lucchini Arteche's Théorème 4.15, which the proof of Proposition 3.3 imports (p.11); missing, routed to route 9.
- Route 1 (SF.1) removed: its only item now has a Tau Ceti owner.
- Routes 8 and 9 no longer import each other: the final arithmetic theorems (items `96`, `118`, `119`) move to route 9, route 8 ends at Dwyer's correspondence, local lifting and the Z/8 counterexample, and both briefs say so. Route 8 adds HL.2 and ProfiniteCohomology Layer 9 imports and a coordination note with Merkurjev–Scavia's ProfiniteCohomology Part II; route 9 adds Chebotarev, ModularCurves 0C–0D and ProfiniteProPGroups Layer 5 imports and records that its roadmap id is shared with PAPER-HARPAZ-WITTENBERG-20 route 13.
- `65` note and the report: the open all-rank outer-exponent question is the unnumbered sentence after Lemma 4.7 (p.14), not Remark 4.8 (p.15, which concerns injectivity of α for n ≤ 6); references corrected.
- Report, "Matrix conventions": the remark on formula (4.2) now says it is correct as printed (entries at distance ≥ 4 lie in U³, so they vanish in B), so it cannot be read as a slip in the paper.
