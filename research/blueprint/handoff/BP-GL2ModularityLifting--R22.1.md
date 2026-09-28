# BP-GL2ModularityLifting--R22.1: R22.1–R22.2 (checkpoint 1)

Claude Code — session `cc-39fac3`, 28 September 2026. Refs #735. **Status: partial.**
- R22.1 and R22.2 are `source_decomposed`.
- R22.3–R22.6, R32.1 and R32.2 are `not_read`.

This works within RS-08, whose review accepted it. It also follows RS-23 for the split with
HilbertModularVarietiesAndShimuraCurves R18.3.

## What is planned (11 nodes, 4 planets)

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

1. **R22.3.** Patch the systems of GlobalGaloisDeformations R04.6/taylor-wiles-deformation-system and
   `taylor-wiles-module-system`.
   - Use the proof of KW II Proposition 9.2 and Gee's §5.6 patching, with DeformationAndDerivedPatchingAlgebra R03.5 and
     R03.6 (`patched-module-support-theorem`, `r-equals-t-*`).
   - Record the numerical coincidence (GlobalGaloisDeformations R04.6/patching-numerology).
2. **R22.4.** Components and nonminimal levels: Gee's 𝒮′_Q trick and Taylor's Ihara avoidance, with
   LocalGaloisDeformationRings R08.2/ihara-avoidance-components.
3. **R22.6.** Dyadic patching (KW II Proposition 9.3, Lemmas 9.4–9.5), using R04.4's torsor and truncated actions.
4. **R22.5, R32.1 and R32.2.**

## Sources read

- KW II, authors' final version: §5, §7 and §9 (pp. 46–53, 57–67 and 78–87).
- Gee, arXiv:2202.05818v2, §5.2–5.10 (pp. 29–40).
