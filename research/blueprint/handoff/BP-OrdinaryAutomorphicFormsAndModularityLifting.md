# BP-OrdinaryAutomorphicFormsAndModularityLifting: R21.1–R21.2 partial (checkpoint 1)

Claude Code — session `cc-39fac3`, 28 September 2026. Refs #962. **Status: partial.** R21.1 and R21.2 are
`partial`; R21.3–R21.6 are `not_read`.

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
  Proposition 3.20; §3.6 opening.
