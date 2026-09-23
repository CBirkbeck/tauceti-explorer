# Review: PAPER-DOR-23 (Dor, Exotic monoidal structures and abstractly automorphic representations for GL(2))

Job `REV-PAPER-DOR-23` (issue #1374), by Claude Code, session `cc-39fac3`, 23 September 2026. The extraction was written by session `cc-442dc5`. **Verdict: accept**, after the corrections below, which were made in place. The one route, a new roadmap, is accepted.

## What was read

- **The published version**, Forum Math. Pi 11 (2023), e20, 52 pp., read in full again from a fresh open-access download from Cambridge Core. Its SHA-256 is 769b4966…; it differs from the extraction's hash because Cambridge Core stamps each download.
- **Method:**
  - A checker compared every item with the published text, checking formulas on page images, and listed the uncovered results and candidate mistakes.
  - I checked the substantive findings on the page images myself: (2.4), Construction 3.44, Example 3.55, Warning 3.25, the proofs of Claim 4.3 and Proposition 4.9, the Petersson pairing, and Appendix A.
  - I also checked the statuses, the Mathlib names at 082e2d3 and the route.

## Changes made to the extraction

- **Statements (18 corrected):** 002, 003, 004, 006, 007, 010, 012, 019, 022, 023, 024, 025, 027, 030, 033, 041, 050, 051. The note of each says what changed. These were materially wrong:
  - **003:** the Kirillov embedding goes to S̃(F^×), the uniformly smooth functions, not S(F^×). Principal-series Kirillov functions do not vanish near 0.
  - **004:** "equivalently ∫_{A^×} W_φ(diag(y,1))…" is not in the paper, and it holds only for cusp forms.
  - **010:** the middle entry of (2.4) is diag(y,1)·g₂·diag(y^{−1}det(g₁g₂g₃)^{−1},1). The extraction inverted it, which contradicts (2.12).
  - **027:** the counit uses the diagonal matrix diag(1, −π^{ν(e)}), not an antidiagonal one.
  - **033:** the canonical map of Example 3.55 has source V ⊗ Hom_G(1, V), not 1 ⊗ Hom_G(1, V).
  - **007 and 012:** each lacked a hypothesis (irreducible V; generic irreducible V).
  - **Others:** 022 and 025 had the direction of the Steinberg extensions wrong, 023 and 024 had lost the underline of Hom̲, and 041 had copied the Petersson misprint (E3).
  - **002 and 004** were split: the function-field integrals on S of §4.1 and Remark 4.11 moved to the new item 058.
- **Locators (7):** 004, 006, 012, 038, 042, 048, 050. Locators 002 and 004 were then trimmed to match the split.
- **Statuses:**
  - **001 (library):** confirmed. The library list now also cites CategoryTheory.Mod, CategoryTheory.Mod.forget and CategoryTheory.IsCommMonObj. The category of modules and the forgetful functor used in Claim 4.28 are the bundled Mod, not ModObj.
  - **003:** planned → missing. No stage names the Kirillov model.
  - **004:** planned stages R16.5 → R16.5 and AutomorphicLFunctionsAndLocalFactors:AL.3, since the local integral is the GL₂ × GL₁ case of AL.3.
  - **005:** stays planned. The note records that MetaplecticAutomorphicForms plans characteristic 0 only; the positive-characteristic case is the new item 059.
  - **006:** stays missing. The note records that FunctionFieldArithmetic FA.2 plans the Poisson-summation half.
- **New items (8):**
  - 052 Bernstein–Zelevinsky functors Φ^±, Ψ^± on mirabolic modules (BZ77, Proposition 3.2) (planned: SR.5, AL.3)
  - 053 Bernstein components and the Bernstein centre of Mod(GL_2(F)) (planned: SR.3, R16.2)
  - 054 The Jacquet functor of GL_2(F) (planned: SR.2)
  - 055 Generic irreducible representations of GL_2(F): classification and uniqueness of Whittaker functionals (planned: R16.2)
  - 056 Relative tensor product of smooth G-modules (missing)
  - 057 Transposition acts trivially on the θ-coinvariants of S(M_2(F) × F^×), the Gelfand–Kazhdan step of Claim 3.18 (missing)
  - 058 Global Godement–Jacquet and Jacquet–Langlands zeta integrals on automorphic functions over a function field (missing)
  - 059 The Weil representation over non-archimedean local fields of odd positive characteristic (missing)
- **Route and brief:**
  - Items 003, 056, 057, 058 and 059 were added to the new route, which now has 51 items.
  - The brief's imports were made exact:
    - MetaplecticAutomorphicForms is imported for characteristic 0 only, and the function-field versions are built here.
    - FunctionFieldArithmetic FA.2 and AL.3 are imported.
    - R16.2 and R16.5 are given their actual roles.
    - The Kirillov model, ⊗_G and the Gelfand–Kazhdan step are named as built here.
    - The Mathlib list is extended.
  - The test "1_G ⊛ 1_G = 1_G^St" became the extension 0 → St → 1_G ⊛ 1_G → 1_G → 0 of Remark 3.28.
  - A closing paragraph records the misprints to correct and the Claim A.6 gap.
- **Summary:** the item counts and the source issues were updated.

## Mistakes in the paper (`sourceIssues`, E1–E7)

- **E1** (the extraction's): confirmed on the page image. "(F^×)^{3,Π=1} = {(a, b, c) ∈ F^× | abc = 1}" should read (F^×)³.
- **E2 (misprint):** in the proof of Proposition 4.9, all four displayed integrals run over M_2(F); they must run over M_2(A). An integral over a discrete set is not the Fourier transform that Poisson summation needs.
- **E3 (misprint):** the Petersson pairing is written as ∫_{GL_2(A)} f(g)f′(g^{−T}) d^×g. The integrand is left GL_2(F)-invariant, so the integral must run over GL_2(F)\GL_2(A).
- **E4 (misprint):** in the proof of Claim 4.3, the distinguished vector is 𝟙_{GL_2(O_v)}, not 𝟙_{GL_2(F_v)}, which is not compactly supported.
- **E5 (misprint):** Warning 3.25 reads "the trivial representation St by 𝟙_G". Read: the non-split extension 0 → 𝟙_G → (St over 𝟙_G) → St → 0.
- **E6 (misprint):** the §3 title reads "mdules". This is in print only; arXiv v2 is correct.
- **E7 (gap; affects the proof):** Claim A.6 asserts that E_A is a counital coalgebra, but Appendix A defines no global counit. Its proof appeals to the informal "adjustments described in Remark 3.47". Coassociativity, through the idempotent theorem, also needs μ to be an isomorphism at every place, which is not checked.

E1–E6 affect nothing. E7 affects the proof of Claim A.6, and so Construction A.7, the appendix's result; the theorems of Parts I–II are unaffected.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-DOR-23.result.json` reports no errors.
- `python3 research/blueprint/intake.py check-files` reports no problems.
- Every missing item is routed exactly once.
- Every planned stage id exists in the atlas.
