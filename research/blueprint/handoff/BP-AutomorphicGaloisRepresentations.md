# Handoff: BP-AutomorphicGaloisRepresentations (fourth checkpoint)

Agent: Claude Code, session cc-fb70e5. Refs #685.

- Stages R19.1–R19.6 are all partial. The checker reports no errors and no warnings.
- RS-12 is still **needs_changes**, so the current structure is used.
- Checkpoint 1 was merged in #3857 (13 nodes), checkpoint 2 in #3859 (18 nodes) and checkpoint 3 in #3866 (21 nodes). This
  checkpoint adds 1 node in R19.1, for 22 nodes and 14 planets.

## New in checkpoint 4

- `R19.1/integral-structure-of-the-newform-premotive` (construction). Source: Diamond–Flach–Guo arXiv v2 §§1.2, 4.5 and 5.3–5.4.
  - The S-integral premotivic structure 𝓜(N, ψ)_{M,!} for S ⊇ {ℓ | Nk!}, with lattices in the Betti, de Rham, λ-adic and
    Fontaine–Laffaille realisations.
  - Fil^{k−1} is the cusp forms with q-expansion in O_S[[q]], and it is dual to the integral Hecke algebra (Lemma 5.5(a)).
  - 𝓜_g = 𝓜(N, ψ)_{M,!}[I_g], with K ⊗ 𝓜_g = M_g, G_ℚ-stable lattices with Fontaine–Laffaille descriptions at λ ∉ S, and
    Fil^{k−1}𝓜_{g,dR} = O_S·g.
  - Acceptance: 11a1, S = {2, 11}.
- Source issue **E3** (new): DFG arXiv v2 prints the excluded set as S_N = {ℓ ∤ Nk!} (Theorem 2.4, p. 24) and
  S′ = {p | p ∤ N′k!} (p. 30), the complements of their own definitions on pp. 13 and 27. Both were checked on the page images.
  The ÉNS 2004 text has no counterpart.
- The R19.1 coverage item on integral lattices is replaced by the one that remains: the coefficient-field descent. The R14.3
  request now also asks for the S-integral versions.

## Earlier in this job (checkpoint 3)


## New in this checkpoint

All three nodes are for F = ℚ in weight two. They come from Darmon–Diamond–Taylor, *Fermat's Last Theorem* (2007 revision), which
was already a source.

- `R19.6/full-weight-two-hecke-algebra-and-its-galois-representations` (construction).
  - Sources: DDT §4.1 and Lemmas 1.37–1.39.
  - The full Hecke algebra 𝕋 of Γ_H(N) acts faithfully and is finite free.
  - T_ℓ(J_Γ) ⊗ ℚ_ℓ is free of rank two over 𝕋_{ℚ_ℓ}, which gives ρ_𝔭 over 𝕋_K/𝔭 and, for ℓ odd, the residual ρ_𝔪.
  - Its non-example shows that 𝕋_K is not reduced. At Γ₀(88), T₂ acts on the old space of 11a1 through K[u]/(u²(u² + 2u + 2)).
- `R19.6/hecke-algebra-representation-classical` (planet).
  - Source: DDT Lemma 3.27, under the hypotheses (a)–(e) of §3.3.
  - It constructs ρ^mod_Σ : G_ℚ → GL₂(𝕋_Σ) over the reduced Hecke algebra, using complex conjugation and the matrix-entry
    argument. It also gives the surjection R_Σ ↠ 𝕋_Σ and properties (b) and (c).
  - Acceptance: DDT Example 3.28, 57B at ℓ = 3.
  - It is the F = ℚ counterpart of the quaternionic node, and it avoids Carayol's descent.
- `R19.6/reduced-hecke-algebra-as-a-localisation` (planet).
  - Sources: DDT Lemma 4.6 and Proposition 4.7, due to Wiles.
  - It proves 𝕋_Σ ≅ 𝕋_𝔪 at level N_Σ = ℓ^δ N(ρ̄) ∏_{p∈Σ−{ℓ}} p².
  - A hypothesis explains why u_p = 0 is a simple root in every case (p ∤ N_f, p ∥ N_f, p² | N_f).
  - Acceptance: ρ̄_{11a1,3} with Σ = {2} at level 44. The level-88 contrast shows why the exponent is 2.

Other changes:

- The R19.6 coverage record is updated. Its stale item on V_ℓ(A_f) is removed, since checkpoint 2 read DDT Lemma 1.48 for it.
- The stale gap "The weight-two decomposition of V_l(A_f) has no source read" is removed for the same reason.
- A new gap records that DDT leave Lemma 3.27(a)–(c) as an exercise.
- The roadmap document is regenerated for these sections. The node sections use the same renderer format as before.

## What remains

- **R19.1:** the coefficient-field descent; Deligne–Serre §8; Scholl's Kuga–Sato realisation (GH.0 request).
- **R19.2:** Carayol §§1–12 and the bad-reduction paper; Wiles 1988 [W2], which is quoted through Skinner–Wiles.
- **R19.3:** Saito's proof of purity; the compatible-system carrier (R24.5).
- **R19.4:** Carayol's proof; the comparison of σ with Saito's σ̌_h.
- **R19.5:** the endpoint weight; Kisin's corollary (JAMS 2008), which is quoted through KW II.
- **R19.6:**
  - Carayol's descent (Contemp. Math. 165, not public), matched with Chenevier's Theorem B plus the IHG.1 residue-field descent;
  - the determinant law over a non-reduced localised Hecke algebra, for general level;
  - the type-Σ verification in DDT Lemma 3.27 (the gap);
  - the Taylor–Wiles variant 𝕋_Q (DDT Proposition 4.10), whose consumer is GL2ModularityLifting R22.2.

## Requests made in this checkpoint

- ModularCurvesPartII R14.2: 𝕋_ℤ on J_Γ and T_ℓ(J_Γ), faithfulness, freeness, and rank two over 𝕋_ℚ.
- GlobalGaloisDeformations R04.3: R_Σ for type-Σ liftings.
- SerreWeightAndLevelOptimisation R20.6: DDT Theorem 3.15.
- AlgebraicModularFormsAndSerreWeights R15.2: the generation Lemma 4.1.
- Tau Ceti ModularForms layer 4: the newform decomposition and the old-space polynomial.

The existing R01.1 and R01.6 requests now also list the new construction.

## Suggested Lean file

It imports Mathlib only. It was compiled with `lake env lean` against the Mathlib 082e2d3 build, with exit code 0. Its only
warnings are the `sorry` placeholders of the planned declarations.

This checkpoint adds checks on:

- the 57B trace table (every pair is congruent mod 3);
- σ₀(8) = 4, and the square of u(u² + 2u + 2) against u²(u² + 2u + 2);
- N_Σ = 44 and the simple root at u = 0 mod 3.

It also replaces the one `sorry` in an example by a proof, `mul_self_eq_one_iff`.

## Source issues

E3 is new in checkpoint 4 (see above). E1 and E2 are unchanged. The note for PadicHodgeTheory/E50 was applied in that packet's checkpoint 3 (#3868).

## Sources

Darmon–Diamond–Taylor was re-downloaded and its SHA-256 matches the packet's record (254f6e29…). Newly read:

- §1.6, Lemmas 1.37–1.39 (pp. 40–42);
- §3.3 (pp. 93–95), with hypothesis (c), det ρ̄ = ε, checked on the page image;
- §4.1 (pp. 106–111);
- §4.2 (pp. 112–113).
