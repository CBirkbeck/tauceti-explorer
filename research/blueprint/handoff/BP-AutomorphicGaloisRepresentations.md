# Handoff: BP-AutomorphicGaloisRepresentations (fifth checkpoint)

Agent: Claude Code, session cc-fb70e5. Refs #685.

- Stages R19.1–R19.6 are all partial. The checker reports no errors and no warnings.
- RS-12 is still **needs_changes**, so the current structure is used.
- Checkpoints 1–4 were merged in #3857, #3859, #3866 and #3870. This checkpoint adds 8 nodes in R19.2, for 31 nodes
  and 16 planets.

## New in checkpoint 5: the proof of Carayol's Theorems (B) and (A)

**Source.** Carayol, Ann. Sci. ÉNS 19 (1986), the Numdam PDF (sha256 d4a5fb6b…, the same file as before; printed page = PDF
page + 407). It was read on its text layer, with the formulas of 2.1.1, 3.1–3.3, 6.6–6.7, 10.6 and 11.2–11.3 checked on the
page images. Read: §1 (the summary of [Ca 3]), §2, §3, §4.1–4.8, §5, 6.4–6.7, §10, 11.1–11.4 and 12.1–12.3.

**Nodes (R19.2):**
- `carayol-sigma-lambda-construction` (construction, planet): ξ = ⊗[(τ_i∘ν)^{(w−k_i+2)/2}·Sym^{k_i−2}ξ_i], the sheaf F_λ,
  σ_λ(π) = Hom_{H(G(𝔸^f),K)}(π_f^K, H¹(M_K ⊗ F̄, F_λ)) of dimension 2, and the decomposition of H¹.
- `carayol-twisting-and-determinant`: σ(χπ) = χ^{−1}σ(π), and det σ(π) = χ_π^{−1}ω^{−1}. §3 gives this only up to a
  quadratic character; 5.5 removes it.
- `carayol-vanishing-cycle-filtration`: 0 → σ₁ → σ_𝔭 → σ₂ → 0 from the vanishing cycles, and 5.6.2–5.6.3.
- `carayol-special-places`: 6.7, and Picard–Lefschetz non-splitting (11.4).
- `carayol-local-fundamental-representation`: 10.6, π_𝔭 ⊗ σ₂(π)_ℂ ≅ 𝒰_ℂ(π̄_𝔭^∨).
- `carayol-ordinary-cuspidal-places`: 11.2–11.3, through a CM form with the same local component.
- `carayol-theorem-b` (planet): cases (a)–(c) of 11.1.
- `carayol-primitive-restriction-lemma`: 12.1.3.
- `carayol-cubic-base-change-of-extraordinary`: 12.2.2, through Tunnell's globalisation and the Artin conjecture.

The Theorem (A) node now has 12.3's proof. The source leaves the case 𝔭 = v (only one discrete-series place) to the reader;
it is written out by quadratic base change split at v.

**Requests (new):**
- HilbertModularVarietiesAndShimuraCurves R18.5: §§7–9 and Brylinski's appendix.
- LefschetzPencilsAndVanishingCycles LPV.0: the vanishing-cycle sequence.
- LefschetzPencilsAndVanishingCycles LPV.7:semistable-curves: Picard–Lefschetz for stable curves.
- GL2AutomorphicRepresentationsAndTransfer R17.4: base change of degree ≤ 3, with its compatibility with restriction,
  which Carayol asserts without a reference.
- GL2AutomorphicRepresentationsAndTransfer R17.5: automorphic induction from CM fields, Tunnell's globalisation and the
  Artin conjecture.

The R18.4, R18.2, R17.3 and R16.3 requests gain the new nodes.

**No new source issues.** Two places are not mistakes and are recorded as hypotheses:
- 12.2.2 says the general "base change = restriction" principle has no reference;
- 12.3.2 is left to the reader.

**Lean.** Three new checked examples:
- dim W = ∏(k_i − 1);
- integrality of (w − k_i + 2)/2;
- the index-3 subgroups of S₄ and A₄.

A missing line break in the earlier comment block is fixed. The file compiles with exit 0; the only warnings are the four
existing `sorry` stubs.

**What remains in R19.2:**
- Carayol §§7–9 and the appendix (R18.5).
- 11.5–11.10 (LPV.7).
- The companion paper [Ca 3] (R18.2).
- Wiles 1988.

The earlier gap notes that [Ca 3] is in the supplied library as references/papers/R02_SS_CarayolBadReduction.pdf.

## Earlier in this job (checkpoint 4)

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
