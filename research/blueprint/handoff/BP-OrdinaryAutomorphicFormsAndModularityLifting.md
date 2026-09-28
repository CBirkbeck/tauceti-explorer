# BP-OrdinaryAutomorphicFormsAndModularityLifting: R21.2 source-decomposed; R21.1, R21.3–R21.5 partial (checkpoint 4)

Claude Code — session `cc-39fac3`, 28 September 2026. Refs #962. **Status: partial.**
- R21.2 is `source_decomposed`.
- R21.1, R21.3, R21.4 and R21.5 are `partial`.
- R21.6 is `not_read`.

## Checkpoint 4: 6 nodes (R21.4: 3, R21.5: 3)

Source: Skinner–Wiles §§4.4–4.6 and the statements of Propositions 8.1 and 8.4, with the proof of 8.4, read on the page
images.

**R21.4:**
- `p2-criterion` (planet): Proposition 4.2, with its three-step proof.
- `property-p1`: Proposition 8.4, reducing (P1) to Proposition 8.1.
- `main-theorem` (planet).

**R21.5:**
- `hypothesis-h`.
- `theorem-a` (planet).
- `theorem-b` (planet), conditional on Hypothesis H.

**Gaps (3 new):**
- Proposition 8.1 (§§5–8). This is **temporary**: the source is in hand and these sections are the next checkpoint.
- Washington's theorem for ℓ ≠ p. No stage plans it.
- Waldschmidt's bound δ_L ≤ d_L/2. No stage plans it.

**New request:** GL2AutomorphicRepresentationsAndTransfer R17.4 (solvable base change).

**Source issues:**
- E5 is extended: the "Lemma/Proposition 2.12" drift recurs in the proof of Proposition 4.2.
- **E7:** "(vi)" for "(iv)" in the proof of Theorem B.

**Lean.** One checked test, the arithmetic of Theorem B's (4.23) ⇒ (4.24). It compiles with 0 errors, 0 warnings and no
`sorry`.

**Totals.** 54 nodes, 88 API items, 62 unit tests, 22 planets, 12 requests, 4 gaps and 7 source issues.
`check_blueprint.py`: 0 errors, 0 warnings.

## What a continuation should do (after checkpoint 4)

1. **Skinner–Wiles §§5–8 (R21.4):**
   - §5 formal patching (Propositions 5.7–5.9; import DeformationAndDerivedPatchingAlgebra R03.5–R03.6);
   - §6 cohomology estimates (Proposition 6.10; GlobalGaloisDeformations R04.5);
   - §7 (Propositions 7.1 and 7.3);
   - §8 (Lemma 8.2, congruence maps, Proposition 8.1).

   Then remove the temporary gap.
2. **R21.5:** Dieulefait–Pacetti's p = 3 branch and Khare's use of Theorem A.
3. **R21.6:** exports and the independence check.

## Checkpoint 3: 14 nodes (R21.2: 8, R21.3: 1, R21.4: 4)

Source: Skinner–Wiles §2.2, §§3.5–3.8, §§4.1–4.3 (with the opening of §4.4) and Appendix A, read on the page images.

**R21.2 (now source_decomposed):**
- `characteristic-p-primes-auxiliary`: Proposition 3.20.
- `auxiliary-trace-identity`: Lemma 3.21.
- `deformation-hecke-rings`: §3.6, U_{𝒟_Q}, T_{𝒟_Q}, T^min and M_{𝒟_Q}.
- `minimal-hecke-ring-decomposition`: Proposition 3.23, Corollary 3.24 and Lemma 3.25.
- `hecke-module-duality`: §3.7. Skinner–Wiles quote 𝒪[[G(U)]]-freeness from Proposition 3.3, which is not justified
  (PadicFamilies E11). The identifications need only Frobenius reciprocity and Λ′-freeness, and the node says so.
- `ihara-lemma-quaternionic` (planet): Lemma 3.26. The request to R18.3 now also asks for strong approximation for G^D_1
  and Eichler's norm theorem.
- `ihara-exact-sequence`: Lemmas 3.27–3.28.
- `level-raising-congruence-modules`: Lemma 3.29.

**R21.3:** `reducible-locus-dimension` (Lemmas 2.7–2.9).

**R21.4 (partial):**
- `pro-modular-prime` (planet).
- `good-pair-and-nice-primes` (planet): (G), nice deformations and primes, (P1) and (P2).
- `raynaud-connectedness-corollary`: Corollary A.2. Proposition A.1 (Raynaud) is a **gap**: no roadmap plans
  Grothendieck–Raynaud connectedness.
- `pro-modularity-key-proposition` (planet): Proposition 4.1.

**New source issues (misprints that reach nothing).**
- **E5.** The proof of Proposition 4.1 cites "Proposition 2.12" for Corollary 2.12.
- **E6.** The proof of Proposition 4.2 cites "Proposition 3.14" for Proposition 3.18.

**Lean.** One checked test: the dimension count in the proof of Proposition 4.1 under (G). It compiles with 0 errors,
0 warnings and no `sorry`.

**Totals.** 48 nodes, 85 API items, 59 unit tests, 19 planets, 11 requests, 1 gap and 6 source issues.
`check_blueprint.py`: 0 errors, 0 warnings.

## What a continuation should do (after checkpoint 3)

1. **R21.4, remaining:**
   - §4.4 (Proposition 4.2) and §4.5 (Main Theorem);
   - §5 formal patching (import DeformationAndDerivedPatchingAlgebra R03.5/R03.6, and keep only the arithmetic here);
   - §6 cohomology estimates (with GlobalGaloisDeformations R04.5);
   - §7 nice primes at minimum level;
   - §8 raising the level, with Proposition 8.4 = (P1).
2. **R21.5:** Theorems A and B (§4.6); Khare 2006; Dieulefait–Pacetti.
3. **R21.1 remainder:** Hida's H¹ towers and R18.4.

## Checkpoint 2: R21.3 (19 nodes, 6 planets)

Source: Skinner–Wiles §§2.1, 2.3–2.5 and §3.3, read on the page images (the OCR layer is too noisy for the formulas).

**RS-08 for R21.3.** The ordinary Galois families and deformation rings are planned here, in the source's own
formalism: Wiles pseudo-representations {a, d, x}, which suit the residually reducible case.
- IHG.0 pseudocharacters are compared only through the trace.
- The local nearly ordinary rings for χ ⊕ 1 (Lemma 2.2, Corollary 2.3) are requested from LocalGaloisDeformationRings
  L8.
- Representability for Schur ρ_c and the fixed-determinant rings are GlobalGaloisDeformations R04.2 nodes.
- Mazur's unframed presentation, the Euler characteristic and Schlessinger's criteria are requested from R04.3, R02.3
  and R03.2.

**Deformations.**
- `deformation-datum`: ρ_c is Schur and nonsplit.
- `deformation-of-type` (planet): R_𝒟, R_{𝒟_Q} and R^min, with R_{𝒟_Q} ≅ R^min ⊗ 𝒪[N_Σ].
- `permissible-extension`.
- `global-presentation-bound` (planet): Proposition 2.4, g − r ≥ d + δ_F − 2t − 3#ℳ.
- `matrix-entry-subring`: Lemmas 2.5–2.6.
- `ramification-types`: A, B, B′ and C.

**Pseudo-deformations.**
- `pseudo-representation` (planet).
- `universal-pseudo-deformation`: Lemma 2.10. The proof's bound is sharper than the stated one.
- `pseudo-to-deformation-map`.
- `pseudo-deformation-localisation`: Proposition 2.11 and Corollary 2.12.
- `lattice-reduction-lemma`: Lemma 2.13 and Corollary 2.14.
- `pseudo-deformation-lifting` (planet): Proposition 2.15.
- `deformation-iwasawa-algebra`: §2.5.

**Hecke side (§3.3).**
- `hida-family-representation` (planet): (3.4), with the property (vi) argument transcribed.
- `hecke-pseudo-representation`: (3.5) and (3.6).
- `permissible-residual-comparison`: this closes the uniqueness and ρ̄_m ≅ χ ⊕ 1 deferral left by
  R21.2/permissible-maximal-ideal, whose acceptance note now points here.
- `hecke-generation` (planet): Lemma 3.11 and Corollaries 3.12–3.13.
- `level-type-control`: Propositions 3.14–3.15, moved from R21.2.
- `inertia-character-constraints`: Lemma 3.16.
- `family-twisting`: Lemma 3.17.

**New source issues (both misprints that reach nothing).**
- **E3.** Lemma 3.11 prints T_y = (β_i − α_i)(…) for (β_i − α_i)^{−1}(…). With α_i ≡ 1 and β_i ≡ χ(g_i), the printed
  expression is (β_i − α_i)²T_y; §2.5 has the right form.
- **E4.** (3.7) twists T_0(𝔭_i) by Ψ_P(λ)^{−1}, inconsistent with T_y ↦ T_yΨ_P(y) and with (3.4)(vi); it should be
  Ψ_P(λ).

**Also changed.**
- R21.1's `quaternionic-nearly-ordinary-hecke-algebra` now cites PadicFamilies L5/`totally-real-weight-algebra` (#3843,
  which must merge first).
- The R19.4 request now also lists the R21.3 consumers.

**Lean.** Three new checked tests: the fourth pseudo-representation identity, the upper-triangular formula for ψ₂ (§2.5
and E3), and a numeric E3 counterexample. It compiles with 0 errors, 0 warnings and no `sorry`.

**Totals.** 35 nodes, 69 API items, 50 unit tests, 14 planets, 12 baseline declarations, 11 requests and 4 source
issues. `check_blueprint.py`: 0 errors, 0 warnings.

## What a continuation should do (after checkpoint 2)

1. **R21.4 (pro-modularity and R = T):** Skinner–Wiles §4 (pro-modular primes, good data, (P1) and (P2), the key
   proposition, the Main Theorem), §5 (formal patching), §§6–8 (cohomology estimates, nice primes, raising the level) and
   the appendix (Raynaud's connectedness). Bring in §2.2 (Lemmas 2.7–2.9) and §§3.5–3.8 (Proposition 3.20, Lemma 3.21,
   the rings T_Σ, the congruence maps).
2. **R21.5:** Theorems A and B (§4.6); Khare 2006 and Dieulefait–Pacetti for the uses.
3. **R21.1 remainder** as below.

# Checkpoint 1

## Scope and restructuring

The roadmap is in family RS-08, whose proposal is accepted. Its `keeps` are followed:
- **R21.1** only applies the ordinary projector to actual arithmetic modules. The projector API is PadicFamilies L0a,
  cited node by node.
- **R21.2** keeps the nearly ordinary and Eisenstein statements. Hida's cuspidal totally real control is requested from
  PadicFamilies L5.
- **Definite quaternionic forms** (X(U), H⁰, Hecke operators, change of level, stabilisers, Taylor–Wiles freeness)
  belong to HilbertModularVarietiesAndShimuraCurves R18.3, whose stage text claims them. They are requested, not
  re-planned.

## Source

Skinner–Wiles, *Residually reducible representations and modular forms*, Publ. Math. IHÉS 89 (1999).
- The copy read is the Numdam open-access scan, sha256 recorded; printed page = PDF page + 3.
- Its text layer is OCR and noisy. Excerpts are verbatim from the text layer, and every formula was read on the page
  images: Proposition 3.3, Corollary 3.4, Lemma 3.10, Proposition 3.18 and Lemma 3.19 at 110–220 dpi.

## Checkpoint 1: 15 nodes, 8 planets

**R21.1 (8 nodes).**
- `projector-exponent-comparison`: Skinner–Wiles' e = lim T₀(p)^{p^n(p^m−1)} is L0a's lim T₀(p)^{n!}.
- `quaternionic-ordinary-projector` (planet): e on H⁰(X(U_a), R) for R finite, 𝒪 or K/𝒪, natural for level change.
- `ordinary-part-kills-norm-forms`: T₀(p) is p-divisible on norm-factoring forms.
- `quaternionic-nearly-ordinary-hecke-algebra` (planet): T₂(U_a, 𝒪) = eT(U_a, 𝒪), T_∞(U, 𝒪) and the Λ′_𝒪-structure.
- `ordinary-hecke-adjoint-pairing`: the c_U-weighted pairing, adjoints t⁺, and the perfect ordinary pairing.
- `ordinary-trace-compatibility`: traces, and their adjunction with restriction.
- `ordinary-level-independence`: the Γ₀(p^a) level drop, via the matrix identity in the Lean file.
- `ordinary-towers-duality` (planet): M_∞ ≅ Hom_𝒪(H_∞, K/𝒪).

**R21.2 (7 nodes).**
- `nearly-ordinary-representations` (planet): v-good lines, nearly ordinary and ordinary.
- `nearly-ordinary-hecke-algebra-comparison`: the v-good-line and e definitions agree, and arithmetic points of weight
  two correspond to nearly ordinary π.
- `permissible-maximal-ideal` (planet), in Hecke-theoretic form (3.9). The equivalence with ρ̄_m ≅ χ ⊕ 1 and uniqueness
  are deferred to R21.3: they need det ρ̄_m to pin S(ℓ) mod m.
- `eisenstein-ideal-existence` (planet): Proposition 3.18 with the full proof chain. Chai's form, Hilbert Eisenstein
  series and Deligne–Ribet are requested from AutomorphicPadicLFunctions L3, and local–global compatibility from
  AutomorphicGaloisRepresentations R19.4.
- `permissible-weight-algebra`: the character D (Skinner–Wiles' det ρ^mod) is built from the central action, so R21.2
  does not depend on R21.3; Λ_𝒪 is free over Λ′_𝒪.
- `permissible-localisation-finite` (planet): Lemma 3.10, with the Auslander–Buchsbaum step made explicit.
- `auxiliary-level-freeness` (planet): Lemma 3.19 and (3.12)–(3.13).

**Source issues (Skinner–Wiles, both new, both reach nothing).**
- **E1.** Λ_𝒪 is free of rank p^{Σ r_j} over Λ′_𝒪; the paper prints Σ r_j.
- **E2.** H⁺_∞(U_a) should read H⁺_∞(U).

No erratum was found on Numdam or in Crossref (filter=updates).

**Requests (6):**
- HilbertModularVarietiesAndShimuraCurves R18.3;
- GL2AutomorphicRepresentationsAndTransfer R17.3 (Jacquet–Langlands–Shimizu) and R16.6 (Hilbert modular forms, local
  newforms, Hida's unit-eigenline criterion);
- PadicFamilies L5 (Skinner–Wiles Proposition 3.3, Corollary 3.4, Proposition 3.7, Lemma 3.8, Corollary 3.9, and Wiles'
  Λ-adic forms);
- AutomorphicPadicLFunctions L3;
- AutomorphicGaloisRepresentations R19.4.

**Totals.** 15 nodes, 31 API items, 21 unit tests, 8 planets, 12 baseline declarations, 6 requests and 2 source
issues. `check_blueprint.py`: 0 errors, 0 warnings.

## Suggested Lean file

`suggested/OrdinaryAutomorphicFormsAndModularityLifting.lean` imports Mathlib only. It was compiled with the
v4.34.0-rc2 `lean` against the prebuilt Mathlib 082e2d3 oleans: **0 errors, 0 warnings, no `sorry`**.

It contains:
- genuine definitions of the weighted pairing and of the trace along a map of finite sets, with the proved adjunction
  Σ_y f(πy)g(y) = Σ_x f(x)(tr g)(x);
- the R21.1/R21.2 signatures in a comment block;
- five checked tests:
  - u^{p(p−1)} = 1 in ℤ/25;
  - p-nilpotence in ℤ/125;
  - the level-drop matrix identity;
  - deg((X + 1)^5 − 1) = 5 (for E1);
  - Ramanujan's congruence mod 691 at ℓ = 2, 3.

## What a continuation should do

1. **R21.3 (the next checkpoint).** Skinner–Wiles §3.3 (Hida's ρ_Q, (3.4), the pseudo-representation (3.5), Lemma 3.11,
   Corollaries 3.12–3.13) and §2 (deformation data, R_𝒟, pseudo-deformations, Proposition 2.15). Then move the
   Galois-dependent R21.2 statements there: Propositions 3.14–3.15, Lemmas 3.16–3.17, Proposition 3.20 and Lemma 3.21.
   Close `permissible-maximal-ideal`'s equivalence with ρ̄_m ≅ χ ⊕ 1 and its uniqueness.
2. **R21.1 remainder.** Hida's H¹ towers for modular curves (ModularCurvesPartII R14.3) and the indefinite cohomology of
   R18.4. Hida's ASENS 1986 paper (Numdam) is the free source for the ℚ case.
3. **PadicFamilies L5**, same lane: plan Skinner–Wiles Proposition 3.3, Corollary 3.4, Proposition 3.7 and Lemma 3.8
   there, so this packet's request is met.
4. **R21.4–R21.6.** Skinner–Wiles §§4–8 and the appendix; Khare 2006 (arXiv math/0504080) for the level-one use;
   Dieulefait–Pacetti (arXiv:2108.07577) for the p = 3 branch.

## Sources read

- Skinner–Wiles 1999 (Numdam): the introduction; §2.1 opening; §2.5; §§3.1–3.2 in full; §3.4; §3.5 through
  Proposition 3.20; §3.6 opening (checkpoint 1). Checkpoint 2 adds §§2.1, 2.3–2.5 and §3.3 in full.
