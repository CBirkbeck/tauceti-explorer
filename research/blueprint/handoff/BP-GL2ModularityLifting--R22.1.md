# BP-GL2ModularityLifting--R22.1: R22.1–R22.6 and R32.1–R32.2 (checkpoint 4)

Claude Code — session `cc-fb70e5`, 29 September 2026 (checkpoint 4); checkpoints 1–3 by session `cc-39fac3`. Refs #735.
**Status: partial.**
- R22.1–R22.6, R32.1 and R32.2 are `source_decomposed`.
- Every stage in scope is now source-decomposed. The packet status stays `partial`, following the practice of the other
  packets; the maintainer can decide when to send it to review.

## Checkpoint 4: R32.1–R32.2 (11 nodes, 4 planets)

**Sources:**
- Dieulefait–Pacetti (sha 0c6850d…), §1.2, Lemma 1.13 and every appeal to Theorem 1.4 in §2.
- Kisin, *The Fontaine–Mazur conjecture for GL₂*: fmc.dvi on his Harvard page (sha 663d83e…), read through a DVI
  extraction (introduction, §1.2, §1.7, §2.2).
- Gee–Kisin, arXiv:1208.3179v5 (sha 65cb579…), Appendix B.
- Emerton, lg.pdf (sha bf4f855…), §1.2, Theorem 3.3.22 and §§7.3–7.4.
- Paškūnas, arXiv:1209.5205v3 (sha fce17b3…), §1.
- Hu–Tan, arXiv:1309.1658v2 (sha d36f237…), §1 and §6.
- Tung, arXiv:1803.07451v4 (sha 22017bc…), introduction, Theorem 1.2 and §4.

**R32.1 (6 nodes):**
- `lifting-statement-table` (definition, planet): DP Theorems 1.4–1.7 as four Props.
- `quadratic-cyclotomic-irreducibility`: DP Lemma 1.13.
- `non-solvable-residual-image`.
- `hodge-tate-and-oddness-normalisation`.
- `residual-modularity-forms` (comparison): every source states its theorem twice, once assuming ρ̄ modular and once
  taking residual modularity from Khare–Wintenberger. Only the first form is admissible.
- `exceptional-local-cases` (comparison): the local exclusions of Kisin, Emerton, Paškūnas, Hu–Tan and Tung, and how they
  are removed.

**R32.2 (5 nodes):**
- `kisin-multiplicity-criterion` (planet): Kisin (2.2.10), (2.2.14) and (2.2.16), as Gee–Kisin B.5.1 corrects them.
- `kisin-fontaine-mazur-totally-split` (planet): Kisin (2.2.17), printed (2.2.18).
- `odd-prime-de-rham-lifting` (planet): Tung 4.7 and Hu–Tan 6.3, every odd p including 3.
- `odd-prime-statement-over-q`: DP 1.4 over ℚ.
- `application-requirements`: every use of DP 1.4, including the p = 3 uses in Paso 3 and Lemma 2.3.

**Findings:**
- **E2–E6: Kisin's FM paper.** Gee–Kisin Appendix B already corrects all five, and each was checked in the DVI. The most
  serious is E6: Lemma (2.2.1) is false.
- **E7 and E8: new citation slips in DP.**
  - E7: the Emerton theorem that removes Kisin's (1.2.6) is 3.3.22, not 1.2.1.
  - E8: the theorems DP cite take residual modularity from Khare–Wintenberger. The admissible forms are Kisin (2.2.18),
    Hu–Tan 6.3 and Tung 4.7.
- **Audit points** for R31.6 and R32.6/globalisation-dependency-audit:
  - Emerton's promodularity (Theorem 1.2.3, §7.3) uses Serre's conjecture. His §7.4 (Theorem 3.3.22) uses only an
    auxiliary CM-induced modular ρ̄ and the weight part for it.
  - Tung's Theorem 1.2 rests on [CEG+16] patching, Emerton–Paškūnas and BLGG13 A.4.1. These are requested from R31.5 and
    were not checked.

**New requests:**
- PadicLocalLanglandsForGL2Qp R30.6: Breuil–Mézard for p > 2, Kisin's local inequality, and Emerton 3.3.22.
- CompletedCohomologyAndLocalGlobalCompatibility R31.5: Tung's global inputs.
- SerreWeightAndLevelOptimisation R20.6: Gee's Theorem 4.4.12.

**For the part R32.3 packet (#736).** Its nodes `R32.3/dyadic-de-rham-modularity-lifting` and
`R32.6/transfer-residually-irreducible-odd` have the stage `GL2ModularityLifting:R32.2` as a prerequisite. They can now
cite `R32.2/odd-prime-de-rham-lifting` and `R32.2/odd-prime-statement-over-q`. Its gap "Kisin, Emerton, Hu–Tan and Tung
(p = 3) are not read" is partly closed here: the statements and Emerton's §7 are read, and Tung's global inputs remain.

**Lean.** 13 new checked examples:
- p* = −3 at p = 3, and p* ≡ 1 mod 4;
- 5 ∤ |S₄|, and S₅ is not solvable;
- −1 ≠ 1 in 𝔽_p for p > 2, while −1 = 1 in 𝔽₂;
- Hodge–Tate weight normalisation, and x² = 1 on 𝔽₃^×;
- the invariance of tr²/det under central scaling (the E6 step);
- 19² = 1 in 𝔽₅ (E4);
- the bad-dihedral primes in Paso 1, and w ≥ 5.

The signatures of the new declarations are in the comment block. The file compiles with 0 errors and 0 warnings.

This works within RS-08, whose review accepted it. It also follows RS-23 for the split with
HilbertModularVarietiesAndShimuraCurves R18.3.

## Checkpoint 3: R22.5–R22.6 (15 nodes, 7 planets)

**R22.5 (7 nodes):**
- `kw-residual-modularity`: KW II's (α) and (β), the residual input. "ρ̄ modular" → (α), (β) is the weight part of Serre's
  conjecture, left to PotentialModularityAndCompatibleSystems R24.4 with KW I Theorem 4.1.
- `solvable-base-change-reduction`: Gee 4.25 and 4.27. The automorphic input is requested from
  GL2AutomorphicRepresentationsAndTransfer R17.4.
- `kw-odd-prime-lifting`: KW II Theorem 9.7 for p > 2, with types (A), (B) and (C). It uses no Theorem 10.1 and no
  potential modularity.
- `component-patching`: Kisin's patching on one component. This is Annals (3.3.1), (3.4.11) and (3.4.12), reusing R22.3.
- `kisin-potentially-bt-lifting`: Annals (3.5.5), (3.5.7) and (3.5.8), including "strongly residually modular", the
  residue-field condition and the p = 5 condition.
- `fontaine-laffaille-lifting`: Gee Theorem 5.2, via R22.4's Ihara avoidance.
- `ordinary-overlap`: case (C) and ordinary weight p + 1 are the exact overlap with R21.4, which is requested.

**R22.6 (8 nodes):**
- `dyadic-oddness`: at p = 2, oddness is det ρ(c) = −1 on the lift. It is not ρ̄(c) ≠ 1.
- `dyadic-patched-ring`, `dyadic-patched-torsor`, `dyadic-r-equals-t`: KW II Proposition 9.3 and Lemmas 9.4–9.6, on
  GlobalGaloisDeformations R04.4/R04.6.
- `kw-dyadic-lifting`: Theorem 9.7 at p = 2, which is KW I Theorem 4.1(1).
- `kisin-dyadic-component-criterion`: Kisin 2-adic (3.2.9).
- `kisin-dyadic-bt-lifting`: Kisin 2-adic (3.3.5), (0.9) and (0.1).
- `hypothesis-h`: KW I's Hypothesis (H) at p = 2, derived from (0.1). The finite-order and even determinant follow
  because G_ℚ^{ab} is generated by inertia; "potentially crystalline of weight 2 = potentially BT" is requested from
  FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4.

**Source issue E1 (misprint):** Kisin's (0.9)(2) and (3.3.5)(2) say "Barsotti-Tate" for potentially Barsotti–Tate. This
is scoped to the preprint DVI, because the Inventiones text was not accessible. `sourceVersions` records the file read.

**Sources.**
- New:
  - KW I (authors' version);
  - Kisin's Annals and Inventiones papers, as DVI files from his page. There are no TeX tools on the server, so they were
    read with a small DVI-to-text extraction script kept in scratch.
- Extended: KW II (§3.1, §8.2, the rest of §9 and §10) and Gee (§4.24–4.27).

**New requests:**
- OrdinaryAutomorphicFormsAndModularityLifting R21.4;
- LocalGaloisDeformationRings R08.4, R08.5 and R08.6 (Fontaine–Laffaille rings for unramified F_v);
- SerreWeightAndLevelOptimisation R20.6 (Kisin's type and level changes);
- GL2AutomorphicRepresentationsAndTransfer R17.4;
- FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4;
- AutomorphicGaloisRepresentations R19.6 (Steinberg at p is type (C)).

**Lean:** 6 new proved checks and a longer signature comment block. It compiles with 0 errors and 0 warnings.

## Checkpoint 2: R22.3–R22.4 (9 nodes, 6 planets)

**R22.3:**
- `arithmetic-patching-data`.
- `patched-ring-and-module`: KW II Proposition 9.2 (I).
- `patched-support`: the depth count, via R03.6's maximal-depth nodes.
- `minimal-ring-finite`: Proposition 9.2 (II), minimal level only.
- `generic-fibre-r-equals-t`: Proposition 9.2 (III), by Auslander–Buchsbaum.

**R22.4:**
- `ihara-avoidance-comparison`: Gee's 𝒮_Q/𝒮′_Q, using LocalGaloisDeformationRings R08.2.
- `support-transfer-mod-lambda`: R03.6's nearly-faithful-lift-from-special-fibre and patching descent.
- `modularity-from-full-support`: Gee Lemma 5.7.
- `integral-r-equals-t-when-smooth`: KW II §4.2 remarks, with R03.3's free-of-maximal-depth-regular-local.

**New requests:**
- DeformationAndDerivedPatchingAlgebra R03.5: abstract patching, not yet planned.
- DeformationAndDerivedPatchingAlgebra R03.3: Auslander–Buchsbaum over R_∞[1/p].

**Lean:** a new `omega` check of the dimension count; still 0 errors, 0 warnings.

## Checkpoint 1: what is planned (11 nodes, 4 planets)

**R22.1 (5 nodes):**
- `minimal-level-data`: D, U, W_k, ψ and 𝔪 from π fitting the lifting data. This is actual eigenform data, and no R = T
  field.
- `hecke-points-local-conditions`: every 𝒪′-point satisfies the lifting data at each v ∈ S (KW II Lemmas 7.2 and 7.7,
  Corollary 7.8).
- `deformation-to-hecke-map`: KW II Lemma 9.1 and Gee §5.6, via GlobalGaloisDeformations
  R04.6/factorization-through-local-conditions.
- `deformation-to-hecke-surjective`: from the T_v = traces of Frobenius.
- `framed-hecke-module`: 𝕋^□ and M^□.

**R22.2 (6 nodes):**
- `auxiliary-level-groups`: Δ_v = Δ′_v/(N-torsion), with N the isotropy exponent; for p ≥ 5 unramified (Gee), Δ_v = Δ′_v.
- `auxiliary-hecke-algebra`: the Hensel roots A_v, B_v and the eigenvalue choice α̃_v, with R̄^ψ_{S∪Q} ↠ 𝕋_{ψ,Q}(U_Q)_𝔪.
- `delta-actions-agree`: Gee Proposition 5.8(1), the principal-series computation.
- `delta-freeness-at-taylor-wiles-level`: KW II Corollary 7.5 and Gee Propositions 5.8(2) and 5.9.
- `taylor-wiles-module-system`: the finite-level input to R22.3.
- `dyadic-twists-of-forms`: KW II Proposition 7.6, and compatibility with the R-side twists.

## Requests

- **HilbertModularVarietiesAndShimuraCurves R18.6 (R18.3 content):** quaternionic forms and Hecke algebras, JL points,
  isotropy, the freeness criterion (Lemma 7.4), the Ihara-type lemma (Lemma 7.1) and the dyadic twist (Proposition 7.6).
  RS-23 keeps these in R18.3.
- **AutomorphicGaloisRepresentations R19.6:** ρ_𝔪 over 𝕋, and local–global compatibility away from p and at p.
- **SerreWeightAndLevelOptimisation R20.6:** π fitting the lifting data (KW II Theorem 8.4).
- **LocalGaloisDeformationRings R08.6:** the local conditions.

The GlobalGaloisDeformations nodes of R04.4–R04.6 are reused directly, from PRs #3809, #3811 and #3815, all merged.

## Suggested Lean file

`suggested/GL2ModularityLifting--R22.1.lean` imports Mathlib only. It compiles with the v4.34.0-rc2 `lean` against the
prebuilt Mathlib 082e2d3 oleans, with 0 errors and 0 warnings.
- It has two proved checks: the Hensel factorisation identity, and χ² = 1 ⇒ (χz)² = z².
- The objects depend on unplanned suppliers (R18, R19), so their signatures are in a comment block.

## Checks

- `check_blueprint.py` with the pinned index, and with the merged GlobalGaloisDeformations and
  LocalGaloisDeformationRings packets present: 0 errors, 0 warnings.
- `intake.py check-files`: see the PR.

## What a continuation should do

1. **Done in checkpoint 2:** R22.3 and R22.4. What follows is kept for reference. R22.3 patches the systems of
   GlobalGaloisDeformations R04.6/taylor-wiles-deformation-system and `taylor-wiles-module-system`.
   - Use the proof of KW II Proposition 9.2 and Gee's §5.6 patching, with DeformationAndDerivedPatchingAlgebra R03.5 and
     R03.6 (`patched-module-support-theorem`, `r-equals-t-*`).
   - Record the numerical coincidence (GlobalGaloisDeformations R04.6/patching-numerology).
2. **R22.4.** Components and nonminimal levels: Gee's 𝒮′_Q trick and Taylor's Ihara avoidance, with
   LocalGaloisDeformationRings R08.2/ihara-avoidance-components.
3. **Done in checkpoint 3:** R22.5 and R22.6.
4. **Done in checkpoint 4:** R32.1 and R32.2. What is left is supplier work: the three requests above, and the audit of
   Tung's global inputs (R31.6).

## Sources read

- KW II, authors' final version: §5, §7 and §9 (pp. 46–53, 57–67 and 78–87).
- Gee, arXiv:2202.05818v2, §5.2–5.10 (pp. 29–40), §4.24–4.27 (p. 29).
- KW II §3.1, §8 opening and §8.2, §9.1.3, §9.2 and §10.1–10.2.
- KW I (authors' version): Theorem 4.1 and §9.
- Kisin, Annals (DVI): introduction, §3.3, §3.4 (3.4.11)–(3.4.12) and §3.5.
- Kisin, 2-adic (DVI): introduction, (3.2.9), and §3.3.
- Checkpoint 4: the sources listed in its section above.
