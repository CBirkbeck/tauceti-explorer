# BP-GlobalGaloisDeformations: R04.1–R04.3 (checkpoint 2)

Claude Code — session `cc-39fac3`, 28 September 2026. Refs #743. **Status: partial.**
- R04.1, R04.2 and R04.3 are `source_decomposed`.
- R04.4–R04.6, G7 and G8 are `not_read`.

This works within RS-08, whose review accepted it. It uses RS-08's narrowed `keeps` for R04.1 and R04.2.

## What is planned

There are 20 nodes (6 definitions, 2 constructions, 5 lemmas, 7 theorems), with 34 API items, 25 unit tests and 8 planets (4 per layer).

**R04.1.** The deformation functors, with no representability built in:
- the lifting functor;
- module deformations, and the lemma that they are exactly lifts modulo strict conjugation;
- the strict deformation functor, and strict versus full conjugacy, with the ρ̄ = 1 ⊕ 1 counterexample;
- restriction, including invariance of the framed local restriction;
- fixed-determinant functors;
- change of coefficients;
- the separate determinant deformation functor, and its comparison: an isomorphism only for absolutely irreducible ρ̄;
- tangent spaces.

**R04.2.** Representability:
- Φ_p, and Φ_p for G_{F,S} and G_K;
- the universal lifting ring and the continuous universal lift;
- the universal deformation ring for Schur ρ̄;
- framed = unframed[[n² − 1]], with and without fixed determinant;
- Carayol's theorem;
- fixed-determinant rings, with R^□ ≅ R^□_χ ⊗̂ 𝒪[[G^{ab,(p)}]] for p ∤ n;
- change of residue field.

## Checkpoint 2: R04.3 (8 nodes)

- `local-deformation-problem` and `deformation-problem-ideal` (Gee 3.16–3.17).
- `global-deformation-type` (T-framed deformations of type 𝒮) and `global-framed-ring` (representability).
- `local-to-global-map`: R^loc_{S,T} → R^□T.
- `relative-tangent-space`: H¹_{S,T}(ad⁰), with the dimension formula.
- `local-to-global-presentation`: g = h¹_{S,T}(ad⁰) variables and r(J) ≤ h¹_{S,T}(ad⁰(1)) relations. This is KW II (ESI preprint) Lemma 4.5, whose obstruction-pairing proof is transcribed.
- `global-dimension-lower-bound`: Gee 3.24(3) and KW preprint Proposition 4.4.

New requests: ArithmeticGaloisDuality R02.4 (Poitou–Tate), R02.5 (Selmer complex, Greenberg–Wiles) and R02.6 (KW II numerical inequalities), and LocalGaloisDeformationRings R08.1 (PR #3805).

New source: KW II ESI preprint 1892 (free). RS-08 uses the published numbering (Proposition 4.5, Corollary 4.7), and that correspondence was not checked.

## Requests (RS-08 imports)

- **DeformationAndDerivedPatchingAlgebra R03.1:** coefficient categories. The P7 packet has not read R03.1 yet.
- **DeformationAndDerivedPatchingAlgebra R03.2:** Schlessinger and the framed construction.
- **ArithmeticGaloisDuality R02.3:** finiteness behind Φ_p.
- **ArithmeticGaloisRepresentations R01.1:** continuous representations.
- **IntegralHeckeAndGaloisDeterminants IHG.0:** Chenevier determinants.

## Source issue

**E1 (Kisin, Lecture 1, (1.2)):** Φ_p is misstated as finiteness of Hom(G, 𝔽_p). The notes' own Exercise 1 is correct, and (∏ℤ/p) ⋊ ℤ/2 is a counterexample.

## Suggested Lean file

`suggested/GlobalGaloisDeformations.lean` imports Mathlib only. It compiles with the v4.34.0-rc2 `lean` against the prebuilt Mathlib 082e2d3 oleans, with 0 errors and 13 warnings, all `declaration uses 'sorry'`.

It states `Lift`, `strictKernel`, `Def`, `def_mk_eq_iff`, `LiftDet`, `Lift.restrict`, `framed_restrict_invariant` (a group identity), `IsSchur`, `strict_of_full`, `PhiP`, `exists_unique_normalized` and `strictly_conj_of_trace_eq`. The framed-restriction identity is proved by `group`.

Signatures that need Tau Ceti's continuous cohomology or the R03.1/R03.2 categories (the tangent-space equivalences, pro-representability and `DetDef`) are in a comment block.

## Checks

- `scripts/check_blueprint.py` with the pinned index: 0 errors, 0 warnings.
- `intake.py check-files`: see the PR.

## What a continuation should do

1. **R04.4:** restriction, twisting and change of problem; KW finiteness (Gee Proposition 3.26, BLGGT Lemma 1.2.3).
2. **R04.5–R04.6:** Taylor–Wiles primes and exports.
3. **G7 and G8** from ACC+, arXiv:1812.09999, §6.2 (Definition 6.2.2, Theorem 6.2.3, Lemma 6.2.4, Proposition 6.2.33).

## Sources read

- Gee, arXiv:2202.05818v2, §3 (pp. 11–21).
- Kisin, Lecture 1 (all four pages).
- Chenevier, arXiv:0809.0415v2: Theorem 2.22 (statement) and §3.1.
- Böckle's Luxembourg 2012 notes were checked and do not treat deformation theory.
