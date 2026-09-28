# BP-GlobalGaloisDeformations: R04.1–R04.5 (checkpoint 4)

Claude Code — session `cc-39fac3`, 28 September 2026. Refs #743. **Status: partial.**
- R04.1–R04.5 are `source_decomposed`.
- R04.6, G7 and G8 are `not_read`.

This works within RS-08, whose review accepted it. It uses RS-08's narrowed `keeps` for R04.1 and R04.2.

## What is planned

Across R04.1–R04.5 there are 48 nodes (12 definitions, 5 constructions, 12 lemmas, 19 theorems), with 70 API items, 52 unit tests and 20 planets. R04.1–R04.2 account for 20 of the nodes and 8 of the planets (4 per layer).

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

## Checkpoint 3: R04.4 (12 nodes)

- `restriction-ring-map` and `restriction-finiteness`: Gee 3.25–3.26, with BLGGT Lemma 1.2.3's proof specialised to GL_n.
  The example ℤ_p ⋊ {±1} (p odd, n = 1) gives the finite, non-flat map 𝒪⟦Y⟧ → 𝒪, as the stage asks.
- `enlarging-ramification`: closed immersions R_{S′} ↠ R_S, with KW II Proposition 5.11 as the Taylor–Wiles case.
- `change-of-determinant`: twisting isomorphisms. The dyadic obstruction is that ℚ(i) lies in no cyclic quartic field.
- KW II §§2.4–2.6: `diagonalizable-groups`, `free-action-quotient` (Propositions 2.5–2.6) and `truncated-actions`
  (Propositions 2.7–2.8).
- `twisting-action` (§5.1) and `twist-action-free` (Lemma 5.1). The freeness proof avoids Dickson's theorem, and a
  dihedral example has a non-trivial stabiliser.
- `determinant-fixed-on-S` (§4.1.1): these are Newton–Thorne's R′_Q.
- `determinant-twist-torsor` (Lemma 9.4, abstracted): Newton–Thorne's item 60.
- `inertia-rigid-deformations` (§2.7).

Planets: 6 in R04.4.

**Not planned, deliberately:**
- The descent of finiteness in KW II Theorem 10.1 stays in PotentialModularityAndCompatibleSystems R24.1, per RS-08.
- The point-existence lemma behind Corollary 4.7 belongs to DeformationAndDerivedPatchingAlgebra R03.4 and R24.2. It is
  noted in R04.3 `global-dimension-lower-bound`.
- KW II Lemma 7.10 (Hecke characters, Grunwald–Wang) stays with GL2ModularityLifting.
- Smooth resolutions (§2.8) are local.

**New requests:**
- Tau Ceti ClassFieldTheory Layer 12: finiteness of G_V.
- Tau Ceti ModularCurves 0C: affine quotients by finite free group actions.
- DeformationAndDerivedPatchingAlgebra R03.3: excellence and equidimensionality.

**New sources:**
- KW II authors' final version (Khare's UCLA page, May 2009, published numbering). It settles the numbering question left
  open in checkpoint 2: preprint Proposition 4.4 and Lemma 4.5 are Proposition 4.5 and Lemma 4.6.
- BLGGT (arXiv:1010.2561v4).

**New source issue:** E2, a misprint in KW II §2.1 ("surjectivity" for "injectivity").

## Checkpoint 4: R04.5 (8 nodes, 2 planets)

- `taylor-wiles-datum`: the chosen eigenvalue is part of the datum.
- `image-hypotheses`: KW II's cyclotomic irreducibility for p > 2, Gee's SL_2(𝔽_p) with p ≥ 5, and non-solvable image for
  p = 2 are kept distinct. Adequacy and enormous image are left to G7/G8.
- `taylor-wiles-local-cohomology`: KW II Lemma 5.4 and Gee's π_v ∘ φ(Frob_v) ∘ i_v, with Diamond's p = 2 obstruction
  (Ad⁰/Z).
- `odd-taylor-wiles-primes`: KW II Lemma 5.3 and Gee Proposition 5.10. It instantiates R02.6's calculation (KW II
  Lemma 5.2(1)), per RS-08, and uses Chebotarev.
- `taylor-wiles-generator-count`: KW II Proposition 5.5 and Gee's count, in their separate conventions.
- `dyadic-linear-disjointness` (KW II Proposition 5.6 and Lemmas 5.7–5.9) and `dyadic-taylor-wiles-primes` (KW II
  Lemma 5.10 (a)–(h)).
- `taylor-wiles-inertia-action`: KW II Proposition 5.11 and Lemma 5.12.

**New requests:**
- Tau Ceti Chebotarev Layer 10. It is a request only; tauceti ids cannot be prerequisites.
- ArithmeticGaloisRepresentations R01.4: Dickson, and H¹(SL_2(𝔽_{2^r}), Ad) = 0.

**Lean.** Three proved checks: the Frobenius eigenvalue on E₁₂, tr 1 = 0 in characteristic 2, and KW II's R₄.

## Requests (RS-08 imports)

- **DeformationAndDerivedPatchingAlgebra R03.1:** coefficient categories. The P7 packet has not read R03.1 yet.
- **DeformationAndDerivedPatchingAlgebra R03.2:** Schlessinger and the framed construction.
- **ArithmeticGaloisDuality R02.3:** finiteness behind Φ_p.
- **ArithmeticGaloisRepresentations R01.1:** continuous representations.
- **IntegralHeckeAndGaloisDeterminants IHG.0:** Chenevier determinants.

## Source issues

**E2 (KW II final version, §2.1, p. 6):** the converse of the closed-immersion criterion should use the injectivity of
Sp_C(F[ε]) → Sp_B(F[ε]), not its surjectivity.

**E1 (Kisin, Lecture 1, (1.2)):** Φ_p is misstated as finiteness of Hom(G, 𝔽_p). The notes' own Exercise 1 is correct, and (∏ℤ/p) ⋊ ℤ/2 is a counterexample.

## Suggested Lean file

`suggested/GlobalGaloisDeformations.lean` imports Mathlib only. It compiles with the v4.34.0-rc2 `lean` against the prebuilt Mathlib 082e2d3 oleans, with 0 errors and 17 warnings, all `declaration uses 'sorry'`.

It states `Lift`, `strictKernel`, `Def`, `def_mk_eq_iff`, `LiftDet`, `Lift.restrict`, `framed_restrict_invariant` (a group identity), `IsSchur`, `strict_of_full`, `PhiP`, `exists_unique_normalized` and `strictly_conj_of_trace_eq`. The framed-restriction identity is proved by `group`.

Checkpoint 3 adds `Lift.twist`, `Lift.twist_apply`, `Lift.trace_twist` and `Lift.twist_smul`. It also adds three proved
checks:
- (1 + X)² − 1 ∈ (2, X)², the truncation isomorphism at p = 2, m = 1;
- det(c • M) = c² det M;
- the diag(1, −1) conjugation identities behind the dihedral stabiliser.

Signatures that need Tau Ceti's continuous cohomology or the R03.1/R03.2 categories (the tangent-space equivalences, pro-representability and `DetDef`) are in a comment block.

## Checks

- `scripts/check_blueprint.py` with the pinned index: 0 errors, 0 warnings.
- `intake.py check-files`: see the PR.

## What a continuation should do

1. **R04.6:** exports for patching (KW II §9–10 data, including the real-place data at p = 2), using the R04.3
   presentation and the R04.5 data.
2. **G7 and G8** from ACC+, arXiv:1812.09999, §6.2 (Definition 6.2.2, Theorem 6.2.3, Lemma 6.2.4, Proposition 6.2.33).

## Sources read

- Gee, arXiv:2202.05818v2, §3 (pp. 11–21).
- Kisin, Lecture 1 (all four pages).
- Chenevier, arXiv:0809.0415v2: Theorem 2.22 (statement) and §3.1.
- KW II authors' final version: §§2, 4, 5, 7.2–7.3, Lemma 7.10, the proof of Proposition 9.3 and §10.1.
- BLGGT, arXiv:1010.2561v4, §1.2 (Lemma 1.2.3).
- Böckle's Luxembourg 2012 notes were checked and do not treat deformation theory.
