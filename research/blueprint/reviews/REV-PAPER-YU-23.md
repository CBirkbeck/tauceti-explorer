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
