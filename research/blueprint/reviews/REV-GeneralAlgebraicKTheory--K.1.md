# REV-GeneralAlgebraicKTheory--K.1 — independent review

Reviewer: Claude Code, session cc-fb70e5 (issue #414; claim comment 5872818073, confirmed by the bot). The blueprint under review
(BP-GeneralAlgebraicKTheory--K.1, PR #2883) was written by another session, cc-7b31c4. Date: 2026-09-28.

**Verdict: accepted after corrections.** Of the 33 nodes, 8 were corrected (3 mathematically) and 25 verified, and none was added. Every
baseline citation is in the pinned index, and `check_blueprint --index` gives 0 errors and 0 warnings. No source mistakes were found in the
cited passages.

## What was checked

- **Sources.** Weibel's chapter files `Kbook.II.pdf`, `Kbook.IV.pdf` and `Kbook.V.pdf`, whose three sha256s reproduce the packet's.
- **Excerpts.** All 54 were compared mechanically with the source by searching for six-word runs. Every excerpt below 35% agreement was
  then read at its passage. Page numbers are right throughout (chapter page = PDF page), unlike the same session's K.6 and N.7 packets.

## Mathematical corrections

1. **`plus-equals-Q` and `no-natural-product-splitting`.** Both said that the *realisation* BQA is B(S⁻¹S), and that BQP(R) is
   K₀(R) × BGL(R)⁺. The source says the **loop space**: Theorem IV.7.1 gives ΩBQA ≃ B(S⁻¹S), and Corollary IV.7.2 gives
   ΩBQP(R) ≃ K₀(R) × BGL(R)⁺. BQA itself is connected, with π₁ = K₀ (the packet's own `pi1-BQ-equals-K0`), so the unlooped statement is
   false. The packet's excerpts of 7.1 and 7.2 had dropped the Ω; they are re-pulled. The proof steps already had the loop space. The
   first acceptance test of `plus-equals-Q` and the `explicit-low-degree-models` excerpt are fixed in the same way.
2. **`S-construction`.** It said "the zeroth and first terms are trivial", but S₁C = C and only S₀C = 0. The source says: "The maps ∂₀, ∂₁
   from C = S₁C to 0 = S₀C are trivial."

## Citation corrections

Five paraphrased excerpts were re-pulled verbatim:

- Definition 8.3.1 and the low terms (IV.67);
- §8.6 with Exercises 8.5(c)–8.6 (IV.69, IV.74);
- Remark 2.2.1 (V.14);
- Exercise 5.1 (V.37–38);
- the projection-formula passage on V.25, which belongs to the proof of Corollary 3.7.3, not to §3.5.

Test kinds were added to all 43 tests; none had one.

## Suggested Lean file

The only change is a docstring on `plus_eq_Q` recording the loop-space form. The file is placeholder-heavy (`True` theorems) because
spaces, spectra and `BGL⁺` are absent from both pinned libraries. Not compiled.

## Node-by-node

| node | verdict | note |
|---|---|---|
| `K.1/exact-categories-and-Q-construction` | verified | verified: statement, prerequisites and locators checked against the chapter files; excerpts match the source up to elisions. |
| `K.1/Q-construction-universal-property` | verified | verified: statement, prerequisites and locators checked against the chapter files; excerpts match the source up to elisions. |
| `K.1/small-models-and-transport` | verified | verified: statement, prerequisites and locators checked against the chapter files; excerpts match the source up to elisions. |
| `K.1/pi1-BQ-equals-K0` | verified | verified: statement, prerequisites and locators checked against the chapter files; excerpts match the source up to elisions. |
| `K.1/K-groups-of-exact-categories` | verified | verified: statement, prerequisites and locators checked against the chapter files; excerpts match the source up to elisions. |
| `K.1/elementary-properties-of-K-groups` | verified | verified: statement, prerequisites and locators checked against the chapter files; excerpts match the source up to elisions. |
| `K.2:plus/scalar-extension-and-functoriality` | verified | verified: statement, prerequisites and locators checked against the chapter files; excerpts match the source up to elisions. |
| `K.2:plus/extension-category-and-the-fibration` | verified | verified: statement, prerequisites and locators checked against the chapter files; excerpts match the source up to elisions. |
| `K.2:plus/plus-equals-Q` | corrected | corrected: the statement and the first acceptance test said the realisation BQA (resp. BQP(R)) is B(S⁻¹S) (resp. K0(R) × BGL(R)+); the source has the LOOP SPACE ΩBQA — BQA is connected with π1 = K0, so the unlooped statement is false. The excerpts had dropped the Ω; re-pulled verbatim (Theorem 7.1 and Corollary 7.2, pp. IV.61–62). The proof steps already had the loop space. |
| `K.2:plus/cofinality-of-projective-modules` | verified | verified: statement, prerequisites and locators checked against the chapter files; excerpts match the source up to elisions. |
| `K.2:low-degree-comparisons/explicit-low-degree-models` | corrected | corrected citation: the Corollary 7.2 excerpt had dropped the Ω; re-pulled. |
| `K.2:low-degree-comparisons/matsumoto-is-field-specific` | verified | verified: statement, prerequisites and locators checked against the chapter files; excerpts match the source up to elisions. |
| `K.2/functorial-K-theory-of-a-ring` | verified | verified: statement, prerequisites and locators checked against the chapter files; excerpts match the source up to elisions. |
| `K.2/no-natural-product-splitting` | corrected | corrected: 'the realisation of Q … is homotopy equivalent to K0 × BGL+' → its LOOP SPACE (the realisation is connected); excerpt re-pulled with the Ω. |
| `K.3/additivity-for-exact-categories` | verified | verified: statement, prerequisites and locators checked against the chapter files; excerpts match the source up to elisions. |
| `K.3/resolution-theorem` | verified | verified: statement, prerequisites and locators checked against the chapter files; excerpts match the source up to elisions. |
| `K.3/transfer-maps-and-projection-formula` | corrected | verified; the p. V.25 excerpt was a paraphrase and belongs to the proof of Corollary 3.7.3, not to §3.5 — re-pulled and relabelled. |
| `K.3/devissage-theorem` | verified | verified: statement, prerequisites and locators checked against the chapter files; excerpts match the source up to elisions. |
| `K.3/abelian-localization-theorem` | corrected | verified; Exercise 5.1 re-pulled verbatim (it runs over pp. V.37–38). |
| `K.3/cofinality-degree-zero-correction` | verified | verified: statement, prerequisites and locators checked against the chapter files; excerpts match the source up to elisions. |
| `K.4:construction/waldhausen-categories` | verified | verified: statement, prerequisites and locators checked against the chapter files; excerpts match the source up to elisions. |
| `K.4:construction/S-construction` | corrected | corrected: 'the zeroth and first terms are trivial' — S1C = C, only S0C = 0 (the source: 'the maps ∂0, ∂1 from C = S1C to 0 = S0C are trivial'); the paraphrased excerpts of 8.3.1 and of the low terms re-pulled verbatim. |
| `K.4:construction/K-theory-space-of-a-waldhausen-category` | verified | verified: statement, prerequisites and locators checked against the chapter files; excerpts match the source up to elisions. |
| `K.4:construction/iS-versus-Q` | corrected | verified; the excerpt was a paraphrase stitched from §8.6 and the exercises — re-pulled verbatim from both. |
| `K.4/waldhausen-additivity` | verified | verified: statement, prerequisites and locators checked against the chapter files; excerpts match the source up to elisions. |
| `K.4/delooping-and-the-spectrum` | verified | verified: statement, prerequisites and locators checked against the chapter files; excerpts match the source up to elisions. |
| `K.4/fibration-theorem` | verified | verified: statement, prerequisites and locators checked against the chapter files; excerpts match the source up to elisions. |
| `K.4/approximation-theorem` | verified | verified: statement, prerequisites and locators checked against the chapter files; excerpts match the source up to elisions. |
| `K.4/gillet-waldhausen` | corrected | verified; Remark 2.2.1 excerpt re-pulled verbatim (it had been abridged). |
| `K.5/relative-K-theory` | verified | verified: statement, prerequisites and locators checked against the chapter files; excerpts match the source up to elisions. |
| `K.5/relative-versus-support` | verified | verified: statement, prerequisites and locators checked against the chapter files; excerpts match the source up to elisions. |
| `K.5/nonunital-rings-and-unitisation` | verified | verified: statement, prerequisites and locators checked against the chapter files; excerpts match the source up to elisions. |
| `K.5/excision-and-its-failure` | verified | verified: statement, prerequisites and locators checked against the chapter files; excerpts match the source up to elisions. |

## Questions for the orchestrator

1. The readme `readmes/GeneralAlgebraicKTheory--K.1.md` is not a deliverable of this review, so it was not edited. It should get the
   loop-space and S₁C corrections.
2. All three of cc-7b31c4's K-theory packets (N.7, K.6, K.1) had mathematical slips in statements whose proof steps or sources were right.
   A sweep of that session's other packets for the same pattern may be worthwhile.
