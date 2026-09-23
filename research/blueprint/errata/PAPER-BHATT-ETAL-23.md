# Mistakes in Bhatt–Ma–Patakfalvi–Schwede–Tucker–Waldron–Witaszek, *Globally +-regular varieties and the minimal model program for threefolds in mixed characteristic*

Job ERRATA-PAPER-BHATT-ETAL-23. Worker: Claude Code, session `cc-442dc5`, 23 September 2026. The findings are in `PAPER-BHATT-ETAL-23.json` beside this file.

**Paper and version read.** Publ. Math. IHÉS 138 (2023), 69–227, DOI 10.1007/s10240-023-00140-8. The version read is the open-access Springer PDF (SHA-256 `a07fcb79…`). Each locator was re-read, and arXiv v2 and v3 were compared where the extraction did so.

**Earlier work.**
- The extraction PAPER-BHATT-ETAL-23 (complete; its last continuation was this session) recorded E1–E8. They are kept here with everything they say.
- Two classifications are changed to match the standard of PROTOCOL §18, with the old value kept in `previousAffects`:
  - **E6: "nothing" → "a stated result".** Theorem 2.13 and Proposition 2.14 are false as printed for T = X.
  - **E8: "nothing" → "the proof".** Lemma 2.36 is applied outside its stated hypotheses, although the conclusion holds.

**Existing corrections.** None was found, so all eight findings are new.
- Crossref registers no update for the DOI.
- The Springer article page links no correction.
- arXiv 2012.15801 stops at v3 (December 2022), which predates publication.

**Effect on the main results.** The MMP for threefolds, the vanishing theorems and the applications are unaffected.
- **E1 reaches a stated result.** Lemma 2.56's second assertion is false; only a lower bound holds, and the uses need only that.
- **E6 reaches a stated result.** Theorem 2.13 and Proposition 2.14 need T nowhere dense, which holds in every application.
- **E8 is a proof step** with a one-line repair.
- **The rest are misprints or definitional slips** with clear intended forms.

## E1 — Lemma 2.56, second assertion (p. 101)

- **The error.** The paper asserts an equality for Seshadri-type constants ε_sa(A; x). The counterexample with Λ = 0 comes from the blow-up of A² at the origin, followed by a second blow-up at a point of the exceptional curve.
- **What holds instead.** Only the bound ε(A; x) ≥ k − γ for small δ, which is all the applications use.

## E2 — Proposition 6.28, the "resp." case (p. 154)

- **The misprint.** The resp. conclusion should read "completely purely globally +-regular", with the pure boundary the strict transform of S. arXiv v2 has it right.
- **Why the printed form is false.** Take X = Y = Spec k[[t]] and S = V(t). Then (X, S) is purely globally +-regular but not globally +-regular.

## E3 — the proof of Lemma 4.28: the twist has the wrong sign (p. 128)

- **The misprint.** Corollary 3.7 gives vanishing only for negative twists, so the line bundle should be the inverse, f*(K_X + S + B − M).
- **Effect.** The lemma is marked as not used later.

## E4 — Theorem 9.28(c): strict against non-strict (p. 206)

- **The misprint.** The bound −4d_Γ < (K_X + Δ)·Γ should be −4d_Γ ≤ (K_X + Δ)·Γ.
- **Why.** This is what the proof gives, and every other statement of the bound in the paper is non-strict.

## E5 — Theorem 10.6: β(1) = 393 should be 373 (p. 216)

- **The misprint.** β(1) should be 373, as in Theorem K.
- **Why.** The proof's two conditions hold for all primes p > 373.

## E6 — Theorem 2.13 and Proposition 2.14: T must be nowhere dense (p. 85)

- **The error.** For T = X, g⁻¹(T) = Y is not a divisor.
- **The correction.** Add that T contains no irreducible component of X.
- **Effect.** Every application uses a nowhere-dense T: the support of a boundary, or a blow-up centre.

## E7 — Definition 2.19: Fix(D) needs |D| ≠ ∅ (p. 88)

- **The slip.** The minimum over |D| exists only when |D| is nonempty; for O(−1) on P¹ it is empty.
- **Effect.** The uses in §8 are over an affine base, where |D| ≠ ∅.

## E8 — the proof of Lemma 4.20: Lemma 2.36 applied outside its hypotheses (p. 122)

- **The problem.** Lemma 2.36 assumes D_Y and D_X are Q-Cartier. In Lemma 4.20, Y is only normal, so D_Y = ⌈π*L + A_Y⌉ need not be Q-Cartier.
- **The repair.** The proof of Lemma 2.36 uses only that D_X is Q-Cartier: f_*O_Y(D_Y) ⊆ O_X(f_*D_Y) always holds, and D_Y ≥ f*D_X gives the reverse inclusion. With that form the step, and the lemma, stand.
