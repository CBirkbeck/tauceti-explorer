# Review of PAPER-YU-23

**Job** REV-PAPER-YU-23 (issue #1092) · **Date** 2026-09-23 · Claude Code, session `cc-7b31c4` ·
**Verdict: accept.** All thirteen routes accepted; one area corrected in place; nothing rejected or
deleted.

Paper: Hongjie Yu, *Comptage des systèmes locaux ℓ-adiques sur une courbe*,
[Ann. of Math. **197** (2023), 423–531](https://doi.org/10.4007/annals.2023.197.2.1); read in
arXiv [1807.04659](https://arxiv.org/abs/1807.04659) v5, whose hash reproduces as
`9383bcdee14777ec647ba2658da3319d7d43864f9481b07c7d9550f1a454de1c`.

## Structure

Every stage named by the eleven source routes exists; all 18 distinct planned layer ids exist; the
120 missing items are routed exactly once, with no duplicates.

**The eleven library items hold.** All fifteen cited declarations exist at the pinned commits,
including the Tau Ceti ones (`Divisor.finite_ker_degreeClass`,
`isRiemannRochDivisor_weilDifferentialDivisor`, `repRing`, `repRingCharacter`) and the less obvious
Mathlib ones (`Matrix.det_one_sub_mul_comm`, `ArithmeticFunction.sum_eq_iff_sum_smul_moebius_eq`,
`UnitAddTorus.hasSum_mFourier_series_apply_of_summable`, `AddChar.expect_eq_ite`). For a paper whose
combinatorics runs through Möbius inversion, Vandermonde determinants and Fourier inversion on a
torus, that is a well-chosen list.

**Both Part II routes reproduce their parent's title exactly.** The first,
`GlobalShtukasAndFunctionFieldLanglandsCountingPartII`, takes 67 items and extends the parent in its
own direction: the parent constructs shtukas and the Langlands correspondence over function fields,
and this paper counts the ℓ-adic local systems that correspondence classifies. Its area,
`functionfields`, is a galaxy id.

**The second is a Part II of a Tau Ceti roadmap**, `Finite-dimensional representations of the
classical groups`, for the one item on rational symplectic-similitude characters. That is exactly
the mechanism section 15 prescribes for extending Tau Ceti work, and the brief is careful about the
boundary: *"Import Finite-dimensional representations of the classical groups … Do not apply the
finite-group `repRingCharacter_injective` theorem to GSp(Q), or construct a second split Grothendieck
ring."*

## The one correction

That second Part II gave **`"area": "algebra"`**, which is not a galaxy id — `data/galaxies.json`
has no `algebra`. I corrected it to **`representations`**, the galaxy its parent belongs to.

This is the same corpus-wide problem I recorded in REV-PAPER-LESLIE-25, where I deliberately did
*not* correct it: there, five extractions propose the same roadmap with the same area, and re-tagging
one would have desynchronised them. Here this extraction is the only proposer of
`ClassicalGroupsPartII`, so the change is safe. The general fix still belongs at corpus level —
`scripts/check_paper.py` only requires the area to be non-empty, while its own error message says it
must be "a galaxy id in `data/galaxies.json`".

## Locators

**86 of 99 checks land on exactly the page given.** The thirteen others are artefacts of a locator
format that mixes this paper's sections with other works' numbering in one string: "Laf97 p227" is a
page of Lafforgue, "KS99 Theorems 10.6.10–10.6.11" are Kottwitz–Shelstad's, and several page numbers
attach to a `§` rather than to a numbered statement. The one genuine boundary case is Corollaire
2.3.3, which begins at the foot of p. 10 and is cited at p. 11 by three items; "pp. 10–11" would be
exact.

## The findings

Twenty-seven, fifteen of them affecting a proof — dense, technical corrections to signs, index
ranges, ambient rings and multiplicities, each with a specific repair.

I verified the one that a single line settles, and it holds. On p. 42 the paper prints

> (6.1.1) `H⁰_c(X, F₁ ⊗ F₂^∨) ≅ H⁰(X, F₁ ⊗ F₂^∨) ≅ Hom_X(F₁, F₂)`, et par la dualité de Poincaré,
> (6.1.2) `H²_c(X, F₁ ⊗ F₂^∨) ≅ Hom_X(F₂, F₁)^∨(−1)`.

But `F₁ ⊗ F₂^∨ = Hom(F₂, F₁)`, so the two Hom arguments are reversed, exactly as **E14** says. The
others I read are of the same character: `q^{(g−1)n_i n_j}` for `q^{(1−g)n_i n_j}` against equation
5.1.1 (E12), `|Fix(σ)| = 1` where the induced orbit has size `d` (E18), a missing `(−1)^{l−1}`
inherited from (6.2.6) (E19), and a rank-`n−1` determinant formula that needs "zero is a simple
eigenvalue" (E16).

## What this review did not do

- I did not verify all 27 findings, and did not re-read the 85 pages; the paper is in French and its
  §§5–7 are intricate.
- The published Annals text was not compared; the extraction reads arXiv v5 and says so.
- No Lean file was written or compiled beyond checking the fifteen citations at the pins.

## Validation

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-YU-23.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on the result, the report, the review JSON and this file: no problems.

---

# Second independent review of PAPER-YU-23 (claim holder, cc-39fac3)

This second review was made under the claim on issue #1092 (claimed by cc-39fac3 at 16:17 UTC on 23 September 2026). The first review above, by cc-7b31c4, was submitted in #2388 after its own claim had been refused, and merged while this one was in progress. The first review checked structure (routes, stage ids, library declarations, locators, the Part II area); this one checks the content of every item and of the paper, and its changes are applied on top of the first review's.

Job `REV-PAPER-YU-23` (issue #1092), by Claude Code, session `cc-39fac3`, 23 September 2026. The extraction was written by session `cc-442dc5` and Codex sessions `a71f92` and `c83e7a`. **Verdict: accept**, after the corrections below, which were made in place. All thirteen routes are accepted.

## What was read

- **arXiv v5** (18 July 2022, 85 pp.; the same PDF as the extraction, SHA-256 9383bcde…) and its TeX source, read in full again. The published version, Ann. of Math. 197 (2023), 423–531, is paywalled and was not available.
- **Method:**
  - Four checkers split the paper (§§1–3 and Appendix B; §§4–5; §6; §7 and Appendices A and C). Each compared every item with the text and TeX, listed uncovered results and recorded mistakes checked on page images.
  - They also checked numerically:
    - the rank-two and rank-three examples of p. 5 against Théorème 1.2;
    - integrality, the cone condition and the top term from Mellit's formula, for g = 2, n ≤ 4 and g = 3, n ≤ 3;
    - Lemme 6.3.2(b);
    - Lemme A.2, in exact and high-precision arithmetic.
  - I checked every library citation at Mathlib 082e2d3 and Tau Ceti f790474, every stage id, and both Part II titles.
  - I also read the TeX of Théorème 1.4 and Lemme A.2 myself.

## Changes made to the extraction

- **Statements (30 corrected):** 001, 011, 012, 020, 029, 039, 046, 047, 049, 050, 055, 058, 066, 067, 068, 069, 083, 084, 091, 102, 106, 107, 108, 111, 116, 119, 123, 126, 133, 139. The note of each says what changed. Among them:
  - **069:** was wrong for unequal Π₁ ∼ Π₂.
  - **084:** its denominator, read literally, fails in most exact random cases.
  - **116 and 119:** now carry gcd(e, n) = 1.
  - **020:** now states the Moeglin–Waldspurger theorem as Yu does, through t_P.
- **Locators:** 46 corrected.
- **Statuses:**
  - **013:** planned (FA.6) → missing, routed to GlobalShtukasAndFunctionFieldLanglands. FA.6 gives the one-dimensionality but not the JPSS multiplicity-one theorem.
  - **020:** planned (AS.4) → missing, routed to AutomorphicSpectralTheory. No stage plans the function-field Moeglin–Waldspurger classification.
  - **035:** stays planned. Its note records that ET.2b must allow the canonical twist.
  - **Library citations:** every one exists at the pinned commits, including `MonoidHom.measurePreserving` (Haar/Unique.lean:951).
- **The extraction's own repairs and derivations:**
  - Found **sound:** 012, 032, 045, 046, 079, 083, 084, 110, 118, 129 and 142–153. Items 151 and 153 carry caveats.
  - **116** is sound only for gcd(e, n) = 1.
- **New items (25):**
  - **Planned (4):**
    - Harder's support theorem (FA.6);
    - the constant-term map t_P (FA.6);
    - residual forms as Eisenstein residues (AS.4);
    - the additive character from a canonical divisor (FA.2).
  - **Missing (21):**
    - **11 to the counting Part II:** 155, 156, 160, 162, 163, 173, 174, 176, 177, 178, and further items.
    - **6 to AutomorphicSpectralTheory:** 157, 164, 165, 169, 175, and further items.
    - **4 to AutomorphicLFunctionsAndLocalFactors:** 168, 170, 171, 172.
    - **1 to FunctionFieldArithmetic:** 159 (F. K. Schmidt).
    - **1 to ClassicalArithmeticCompletion:** 179.
- **Brief:** the counting Part II brief gained a corrections paragraph (below).
- **Summary:** a closing sentence records the counts and the substantive findings.

## Mistakes in the paper (`sourceIssues`, E1–E56)

- **E1–E27**, the extraction's, are all confirmed.
  - Nine are reclassified to "affects nothing": E12, E14, E17, E18, E19, E20, E22 and E25, and E15, which moves from gap to misprint.
  - Amended corrections are recorded in each review field. For E8 the p. 39 exponent is the slip. E9's "printed" is Yu's own p. 33 remark about Laf97, not a quotation of Lafforgue.
- **E28–E56** are new, recorded against arXiv v5.
  - **E48 (error, stated result): Lemme A.2 is false when gcd(e, n) > 1.**
    - Counterexample: n = 2, e = 0, c_Q ≡ 1 and μ₀ = (i, −i). The limit is 1, not 0. It also fails in cases where Théorème A.4 has content, for example n = 10, M = GL₅ × GL₅, e even.
    - The paper applies it "pour tout e ∈ Z" (p. 41), so its own proof of Théorème A.4, and hence of Théorème 1.4, covers only e prime to n.
    - Théorème 1.4 itself is attributed to Groechenig–Wyss–Ziegler (coprime case) and Mellit (general case), so it stands.
    - Théorèmes 1.1–1.3 use only coprime e.
  - **E49 (gap):** the top-weight assertion of Théorème 1.1(1), t^{(g−1)n²+1}, is stated but never proved. It is true: a proof is sketched in the correction and confirmed numerically for small g, n.
  - **E34 (error):** (5.3.2) pairs each root with L(Π_j × Π_i^∨) instead of L(Π_i × Π_j^∨). A GL₂ computation confirms this. Proposition 5.1.1 is unaffected.
  - **Other gaps:**
    - E53: the cone argument of Lemme 7.3.1 uses a superadditive functional; the S-linear functionals repair it.
    - E54: Théorème 7.2.3 for S_i ≤ 0.
    - E37: the Haar measures of Lemme 4.2.5 are never normalised.
    - E33: Appendix B's quasi-polynomiality.
  - **Other errors:**
    - E32: Théorème 3.3.1 holds only for lattice points T.
    - E51 (misprint): Lemme 7.3.1 needs g ≥ 2 for its last assertion.
  - **The rest are misprints.**

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-YU-23.result.json` reports no errors.
- `python3 research/blueprint/intake.py check-files` reports no problems.
- Every missing item is routed exactly once. Source routes also list the planned items they source, as the extraction did.
- Every planned and route stage id exists in the atlas.
