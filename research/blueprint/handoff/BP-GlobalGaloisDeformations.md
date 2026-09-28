# BP-GlobalGaloisDeformations: R04.1–R04.6, G7 and G8 (checkpoint 7)

Claude Code — session `cc-39fac3`, 28 September 2026. Refs #743. **Status: partial.**
- R04.1–R04.6, G7 and G8 are `source_decomposed`.
- The packet stays `partial` because of open requests.

## Checkpoint 7: G8 (4 nodes) and G7 (7 nodes), 3 planets

**G8, from ACC+ §6.2 (arXiv v2):**
- `variable-determinant-problem`: Definition 6.2.2.
- `variable-determinant-representability`: Theorem 6.2.3 and Lemma 6.2.4, with n²|T| − 1 framing variables.
- `variable-determinant-presentation`: Proposition 6.2.24, with ad ρ̄ coefficients.
- `fixed-versus-variable-determinant`: stated as separate theorems. The quotient map holds always; the product with
  𝒪⟦G^{ab}_{F,S}(p)⟧ holds only for p ∤ n with twist-stable local problems. The p | n failure is shown in k[ε].

**G7, from CHT08 §2 and ACC+:**
- `polarized-deformation-problem`: 𝒢_n, Lemma 2.1.1's pairings, the fixed multiplier and the Schur condition.
- `polarized-representability`: Proposition 2.2.9, with n²|T| framing variables, since the centraliser is trivial.
- `polarized-tangent-obstruction`: Lemmas 2.2.11 and 2.3.4, and the failure of the scalar/trace-zero splitting for p | n.
- `polarized-presentation`: Corollaries 2.2.12, 2.2.13 and 2.3.5, kept separate from the p-torsion-free and reduced
  generic-fibre quotients.
- `taylor-wiles-local-diamond`: ACC+ §6.2.18 and Lemma 6.2.19, in rank n.
- `enormous-taylor-wiles-primes`: Lemma 6.2.31.
- `enormous-taylor-wiles-presentation`: Proposition 6.2.32, g = qn − n²[F⁺ : ℚ], with the export of Δ_{Q_N}.

**Numbering note:** arXiv v1 and v2 both number enormous image and the presentation as Definition 6.2.28 and Proposition
6.2.32. The stage text's 6.2.29 and 6.2.33 presumably follow the published version, which was not read. Locators use v2.

**New requests:**
- ArithmeticGaloisRepresentations G7: polarizations, 𝒢_n and enormous image.
- ArithmeticGaloisDuality D7: the Euler characteristic over G_{F⁺,S}.
- ArithmeticGaloisDuality D8: Selmer complexes and dual Selmer counts in all ranks.

The existing R02.4, Chebotarev and R03.2 requests gain the new consumers.

**Lean:** three new proved checks: (1 + aε)^3 = 1 in characteristic 3 (so cube roots do not exist in 1 + 𝔪), the trace
of the identity in M₃(𝔽₃) is 0, and the ACC+ count. It compiles with 0 errors, and the `sorry` count is unchanged.

This works within RS-08, whose review accepted it. It uses RS-08's narrowed `keeps` for R04.1 and R04.2.

## What is planned

Across R04.1–R04.6 there are 54 nodes (13 definitions, 8 constructions, 12 lemmas, 21 theorems), with 85 API items, 64 unit tests and 23 planets. R04.1–R04.2 account for 20 of the nodes and 8 of the planets (4 per layer).

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

## Checkpoint 5: R04.6 (6 nodes, 3 planets)

- `kw-deformation-data`: KW II §9.1.1, including the odd real places at p = 2. The relative dimension is 3|S|.
- `trace-subring-universal-representation`: KW II Proposition 4.1 and Carayol.
- `factorization-through-local-conditions`: the deformation half of KW II Lemma 9.1. The Hecke side is R22.1.
- `taylor-wiles-deformation-system`: KW II (∗∗) with the y-variables, and Gee's version.
- `patching-numerology`: h + j − d = h + |S| − 1, 2h + 1 = h + j + t − d, and Gee's 4#T + r.
- `dyadic-patching-data`: KW II Proposition 9.3 at finite level.

Patching itself (R_∞, M_∞) is not planned here: it is GL2ModularityLifting R22.3/R22.6. Global finiteness is
PotentialModularityAndCompatibleSystems R24.1.

**New request:** LocalGaloisDeformationRings R08.6, the local rings of KW II's lifting data.

**Lean:** three proved numerology checks.

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

1. **Done in checkpoint 7:** G7 and G8.
2. **Open requests**, which keep the packet `partial`:
   - ArithmeticGaloisDuality R02.3–R02.6, D7 and D8;
   - ArithmeticGaloisRepresentations R01.1, R01.4 and G7;
   - LocalGaloisDeformationRings R08.1 and R08.6;
   - the Tau Ceti class field theory and Chebotarev layers.
   A reviewer can check the G7/G8 statements against ACC+ v2 and CHT08.

## Sources read

- Gee, arXiv:2202.05818v2, §3 (pp. 11–21).
- Kisin, Lecture 1 (all four pages).
- Chenevier, arXiv:0809.0415v2: Theorem 2.22 (statement) and §3.1.
- ACC+, arXiv:1812.09999v2: §6 introduction, §6.2.1, §6.2.18–6.2.24, §6.2.27–6.2.32 (pp. 135–151).
- CHT08 (Numdam): §2.1–2.3 (pp. 7–33).
- KW II authors' final version: §§2, 4, 5, 7.2–7.3, Lemma 7.10, the proof of Proposition 9.3 and §10.1.
- BLGGT, arXiv:1010.2561v4, §1.2 (Lemma 1.2.3).
- Böckle's Luxembourg 2012 notes were checked and do not treat deformation theory.
