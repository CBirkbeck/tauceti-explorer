# BP-GlobalGaloisDeformations: R04.1–R04.2 (first checkpoint)

Claude Code — session `cc-39fac3`, 28 September 2026. Refs #743. **Status: partial.**
- R04.1 and R04.2 are `source_decomposed`.
- R04.3–R04.6, G7 and G8 are `not_read`.

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

## Requests (RS-08 imports)

- **DeformationAndDerivedPatchingAlgebra R03.1:** coefficient categories. The P7 packet has not read R03.1 yet.
- **DeformationAndDerivedPatchingAlgebra R03.2:** Schlessinger and the framed construction.
- **ArithmeticGaloisDuality R02.3:** finiteness behind Φ_p.
- **ArithmeticGaloisRepresentations R01.1:** continuous representations.
- **IntegralHeckeAndGaloisDeterminants IHG.0:** Chenevier determinants.

## Source issue

**E1 (Kisin, Lecture 1, (1.2)):** Φ_p is misstated as finiteness of Hom(G, 𝔽_p). The notes' own Exercise 1 is correct, and (∏ℤ/p) ⋊ ℤ/2 is a counterexample.

## Suggested Lean file

`suggested/GlobalGaloisDeformations.lean` imports Mathlib only. It compiles with the v4.34.0-rc2 `lean` against the prebuilt Mathlib 082e2d3 oleans, with 0 errors and 11 warnings, all `declaration uses 'sorry'`.

It states `Lift`, `strictKernel`, `Def`, `def_mk_eq_iff`, `LiftDet`, `Lift.restrict`, `framed_restrict_invariant` (a group identity), `IsSchur`, `strict_of_full`, `PhiP`, `exists_unique_normalized` and `strictly_conj_of_trace_eq`. The framed-restriction identity is proved by `group`.

Signatures that need Tau Ceti's continuous cohomology or the R03.1/R03.2 categories (the tangent-space equivalences, pro-representability and `DetDef`) are in a comment block.

## Checks

- `scripts/check_blueprint.py` with the pinned index: 0 errors, 0 warnings.
- `intake.py check-files`: see the PR.

## What a continuation should do

1. **R04.3:**
   - the global ring with local conditions: T-framed deformations of type S (Gee 3.20–3.22), and the presentation over the completed tensor product R^loc_{S,T} (Gee §3.23);
   - tangent and obstruction spaces via the adjoint cohomology with local conditions;
   - KW II Proposition 4.5 and Corollary 4.7. The published KW II is not free; use Gee §3.24 onwards and CHT08 (arXiv) for the proofs.
2. **R04.4–R04.6.**
3. **G7 and G8** from ACC+, arXiv:1812.09999, §6.2 (Definition 6.2.2, Theorem 6.2.3, Lemma 6.2.4, Proposition 6.2.33).

## Sources read

- Gee, arXiv:2202.05818v2, §3 (pp. 11–21).
- Kisin, Lecture 1 (all four pages).
- Chenevier, arXiv:0809.0415v2: Theorem 2.22 (statement) and §3.1.
- Böckle's Luxembourg 2012 notes were checked and do not treat deformation theory.
