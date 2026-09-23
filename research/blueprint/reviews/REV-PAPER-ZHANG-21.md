# Review: PAPER-ZHANG-21 (Wei Zhang, Weil representation and Arithmetic Fundamental Lemma)

Job `REV-PAPER-ZHANG-21` (issue #1108), by Claude Code, session `cc-39fac3`, 23 September 2026. The extraction was written by session `cc-442dc5` and Codex session `a71f92`. **Verdict: accept**, after the corrections below, which were made in place. All eleven routes are accepted.

## What was read

- **The published version**, Ann. of Math. 193 (2021), 863–978, 116 pp., read in full again. It came from the public YMSC mirror, with the same SHA-256 (6f8ac537…) as the extraction's.
- **Method:**
  - Four checkers split the paper (§§1–5; §§6–10; §§11–12; §§13–15 with Appendices A and B). Each compared every item with the text, listed uncovered results and recorded mistakes checked on page images.
  - They consulted the author's preprint (AFL2019.pdf) and Mihatsch–Zhang, J. Eur. Math. Soc. (doi:10.4171/JEMS/1375).
  - I read Theorem 13.9, Theorem 15.1 and Proposition 4.12 myself, together with the proof step at issue.
  - I checked every library citation at the pinned commits, every stage id, and the four Part II titles. The titles are shared consistently with the other unitary-RTF extractions.

## Changes made to the extraction

- **Statements (53 corrected):** 2, 3, 4, 5, 7, 9, 12, 16, 27, 30, 31, 33, 36, 38, 43, 44, 54, 55, 64, 70, 71, 83, 84, 87, 90, 92–95, 97–103, 106, 108–114, 116, 119, 120, 126, 129, 130, 136, 137, 148. The note of each says what changed.
- **Locators:** 69 corrected, mostly by adding pages.
- **Library citations (items 141–148):** all exist at the pinned commits. This includes `Matrix.det_fromBlocks₂₂`, `Matrix.aeval_self_charpoly`, `fourier_gaussian_pi`, `SchwartzMap.tsum_eq_tsum_fourier` and `RingTheory.Sequence.IsWeaklyRegular`.
- **The extraction's own repairs:**
  - Found **sound:** 97, 99, 100, 102, 106, 109, 111, 119–122, 125 and 126.
  - Item 101's construction was **incomplete**; the full repaired construction is in its note.
- **New items (28):**
  - **3 planned:**
    - self-dual hermitian lattices (GN.2);
    - hermitian spaces with prescribed local data (GN.2);
    - strong approximation for SL₂ (AA.4).
  - **25 missing:**
    - 14 to JacquetRallisRelativeTraceComparison;
    - 7 to UnitaryKudlaRapoportCycles;
    - 2 to UnitaryRapoportZinkSpacesAndRSZModels;
    - 1 to FormalSupportedIntersections;
    - 1 to AutomorphicFormsOnReductiveGroups.
- **Brief:** the JacquetRallis brief now lists the corrections its layers must respect (below).
- **Summary:** a closing paragraph records the counts after the review and the main finding.

## Mistakes in the paper (`sourceIssues`, E1–E60)

- **E1–E28**, the extraction's, are all confirmed, with some reclassified:
  - E2 and E9 now affect nothing.
  - E12 now affects a stated result. For ψ(x) = e^{2πix}, (12.4), Lemmas 12.5 and 12.11 and "φ̂ = φ" are false as printed. Mihatsch–Zhang, §7.2, footnote 5, corrects the Gaussian.
  - E25 is an error in [47], Zhang 2014, and affects nothing here.
  - E5's page is 886.
  - E28's repair is sound, but Proposition 4.12(ii) formally needs q ≥ n + 1 there; its proof does not use the bound.
- **E29–E60** are new.
  - **E36 (gap), Proposition 4.12(i) and Proposition 2.7(i) at q = n.**
    - The proof chooses ξ ∈ F¹ with det(1 − ξg′) a unit. It also needs 1 − ξd to be a unit. Both can hold only if q + 1 > n + 1.
    - Counterexample at q = n = 3: F = Q₃(i), g′ = diag(1, −1, i), u₀ = v₁ + v₂ + v₃ with norms (1, 1, −1). Then d = −i, and the only admissible class ξ ≡ i gives 1 − ξd ≡ 0.
    - So the printed proof of the AFL (Theorem 15.1(a), for p ≥ n) has a gap at p = n. The FL at q = n (Theorem 13.9(a)) is covered by Beuzart-Plessis's independent proof. Every case with q ≥ n + 1 is unaffected.
  - **E38 (gap):** Theorem 5.5 is proved as printed only for q ≥ n. Mihatsch proves it in general (Algebra Number Theory 16 (2022)).
  - **Errors in stated results:**
    - E33: Lemmas 4.3(iii) and 4.9(iii) need det(1 − g) ≠ 0.
    - E34: Lemma 4.10's "srs" is false; there is an exact counterexample over Q₃(i).
    - E40: Proposition 7.9(b)'s étaleness away from Ram(α) is false.
    - E47: Lemma 12.6 omits the archimedean transfer-factor phase, e^{imπ/4} for n = 2.
  - **Errors in proofs:**
    - E44: (8.11) needs 4π, not 2π; this is the geometric side of E12.
    - E39: (9.12) double-counts complex places.
  - **Other gaps:**
    - E37: Lemma 5.4.
    - E45: (8.14).
    - E50: Theorem 12.9.
    - E51: Propositions 2.7(ii) and 4.12(ii) are used outside their printed q-bound.
    - E52: the global η̃ is never required to be unramified outside S.
    - E60: Lemma B.1's noetherian reduction.
  - **E46 (misprint):** §11.4 and §12.5 use opposite sign conventions for the action on V′, which the derivative comparison must reconcile.
  - **The rest are misprints.**

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-ZHANG-21.result.json` reports no errors.
- `python3 research/blueprint/intake.py check-files` reports no problems.
- Every missing item is routed exactly once. Source routes also list the planned items they source, as the extraction did.
- Every stage id exists in the atlas.
