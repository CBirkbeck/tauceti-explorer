# BP-ModularSymbolsPadicLFunctions: L0–L3 source-decomposed, L4 partial (checkpoint 5)

Claude Code — session `cc-39fac3`, 28 September 2026. Refs #777. **Status: partial.** L0–L3 are `source_decomposed`; L4 is `partial`.

## Checkpoint 5: L3 (6 nodes, 1 planet) and L4 (2 nodes)

Sources: Pollack–Stevens §§5.4, 6.4 and 8.4; Bellaïche, arXiv:0912.2925v1, §1.4 (new source, sha256 recorded); Pollack's
AWS notes §6.

**Scope (RS-08).** The general critical-slope, θ-critical and secondary theory is PadicFamilies L3 (checkpoint 3 of that
packet, merged). These L3 nodes cite it directly and add only the single-form normalisations and comparisons; the new
request to PadicFamilies L3 records the import.

- **`non-theta-critical-lift`** (planet). The eigen-lift of φ^± normalised by specialisation; it equals Bellaïche's L± with
  the scalars fixed. The test excludes X₀(32) at p = 5, which is CM, hence decent (Bellaïche Proposition 2.15(iv)), and
  critical.
- **`critical-slope-interpolation`.** Proposition 6.5, with E6.
- **`critical-slope-non-uniqueness`.** log^{[k]} gives nonzero (k + 1)-admissible distributions vanishing at every z^jχ.
- **`theta-critical-comparison`.** The θ-critical case goes through the top secondary L-function (Bellaïche §1.4.5).
- **`family-comparison-principle`.** Comparisons at a critical point go through the two-variable function on a
  neighbourhood (Bellaïche Theorem 3), not through values.
- **`critical-slope-examples`.** Examples 8.6–8.8, with 8.8 made a theorem by Bellaïche's Remark 1.
- **L4 `level-eleven-examples`.** AWS §6: φ_f = (1/5, −3/2, 1/2), the 11-adic trivial zero with unit linear
  coefficient (μ = 0, λ = 1), and the vanishing Eisenstein L-function.
- **L4 `euler-factor-comparison`.** The two Euler factors at p, one from the distribution and one from p-stabilisation.

**New source issue: E9 (misprint, reaches a stated result).** Bellaïche (5) prints the factors of f_β with α in place of β.
Only arXiv v1 exists on arXiv; the Inventiones version was not obtained, so it is recorded as new.

**New request:** PadicFamilies L3.

**Lean.** A comment block with the L3/L4 signatures, and four proved checks: the vanishing of the polynomial model of
log^{[k]}, the Euler-factor identity ε(p)p^{k−j}/α = β/p^{j+1}, the first Greenberg lift at level 11 modulo 11², and
11 ∤ 1490719231. It compiles with 0 errors and 69 `sorry` warnings (unchanged).

**Totals.** 52 nodes, 80 API items, 63 unit tests, 16 planets, 46 baseline declarations, 13 requests and 9 source issues.
`check_blueprint.py`: 0 errors, 0 warnings.

## Checkpoint 4: L2 (12 nodes, 5 planets)

Source: Pollack–Stevens §§3–6, read in full for these sections, with the displayed formulas of §6 read on the page images.

- **`p-stabilisation`, `refinement`, `refined-eigenline`.** f_α = f° − βf°(pz). U_p f_α = αf_α is proved from Tau Ceti's
  coefficient characterisations (`heckeUCuspNat_…`, `heckeTCuspNat_…`, `CuspForm.qExpansion_levelRaise`). U_p is a
  companion matrix on span(f°, f°(pz)), so the refined eigenline is a line even when α = β.
  - At p | N the refinement is (f, a_p) at level Γ₁(N). Pollack–Stevens' proofs need only Γ₀ ⊆ Σ₀(p) and the U_p formula,
    so they cover this case.
  - The eigenline needs the p-oldspace (ModularForms Layer 4) and level-Np Eisenstein separation (Layer 5), both requested.
- **`weight-k-distributions`, `specialisation-map`.** The weight-k action, moments (D = bounded sequences), the contraction
  ‖μ|γ‖_{r/pⁿ} ≤ ‖μ‖_r (only for r < p, E8), and the equivariance of ρ_k.
- **`overconvergent-lift`, `slope-decomposition-fibre`, `control-theorem`.** Theorems 4.5 and 5.1, Lemma 5.3,
  Corollary 5.4, Propositions 5.6–5.7 and Theorems 5.9/5.12. Pollack–Stevens cite the first isomorphism of Theorem 5.12
  to their unread critical-slope preprint; it is derived here from the contraction bound.
- **`eigensymbol-admissibility`, `p-adic-l-function`.** Lemma 6.2 and Proposition 6.3 with the distribution relation.
  Pollack–Stevens' φ^± is −(1 ± (−1)^kι)ψ/(2Ω^±), so their ± label is the ι-sign times (−1)^k.
- **`interpolation-and-uniqueness`.** Summing (2) against χ with L1's twisted Mellin formula gives
  L_p(z^jχ) = e·α^{−n}p^{nj}τ(χ)j!/(2πi)^j·L(f_α, χ^{−1}, j+1)/Ω^± with ± = (−1)^jχ(−1) and e = 1 − p^j/α at n = 0.
  This is RJW B.1 with Ω_{B.1} = −Ω/(2πi), independent of j, which closes the normalization question L1 left open.
- **`ordinary-integral-measure`.** Values on balls are α^{−n}·[Y^k]φ(…), the total-mass coefficient, which has no binomial
  denominator. So integral generators give 𝒪⟦ℤ_p^×⟧, and arbitrary bases only 𝒪⟦ℤ_p^×⟧[1/p].

**New source issues (Pollack–Stevens):**
- **E4 (misprint).** (1) and (2) differ by the sign (−1)^jχ(−1), that is on the −-part.
- **E5 (error).** (1) omits the factor 1 − p^j/α at n = 0.
- **E6 (misprint).** Proposition 6.5 (3) prints L(f, χ^{−1}, 1) for L(f, χ^{−1}, j + 1).
- **E7 (misprint).** Definition 6.4 prints S_k(Γ, ℚ̄_p) for S_{k+2}(Γ₀, ℚ̄_p).
- **E8 (error).** The action on A[r] and the contraction need r < p.

All reach nothing. `sourceVersions` now records the Numdam PDF read, with its sha256.

**New requests:**
- LocallyAnalyticDistributions L0 (the spaces) and L2 (admissibility, uniqueness, bounded measures);
- ModularForms Layer 4 (the p-oldspace, and U_p f = a_p f at p | N);
- ModularForms Layer 5 (Eisenstein separation at level Np).

**Lean.** Six new proved checks: the p-stabilisation recurrence, ρ_k-equivariance, the Lemma 5.3 binomial expansion, the
n = 0 factor, the E4 ratio and the E8 pole. There is one new `sorry` declaration, `Sigma0p`, and L2 signatures in a
comment block. It compiles with 0 errors and 69 `sorry` warnings.

**Totals.** 44 nodes, 76 API items, 60 unit tests, 15 planets, 46 baseline declarations, 12 requests and 8 source
issues. `check_blueprint.py`: 0 errors, 0 warnings.

## Checkpoint 3: L1 (6 nodes, 4 planets)

- **`period-lines`.** Lines come first, and a period Ω(φ) exists only after a basis is chosen, with Ω(λφ) = λ⁻¹Ω(φ).
  The eigenspaces are L0's `eigenspace-dimension`.
- **`integral-period-lattices`.** Saturation over a DVR gives the integral period, canonical up to 𝒪^×. It depends on
  the choice between V_k(𝒪) and its dual when p ≤ k. Multiplicity one is needed only for Hecke-module comparisons.
- **`twisted-mellin-formula`.** Σχ(a)·2πi∫_{i∞}^{a/m} f(z)(z − a/m)^j dz = τ(χ)j!/(−2πi)^j·L(f, χ̄, j+1). Birch's lemma
  and the Mellin transform are transcribed, with every convention explicit.
  - **Checked numerically** with PARI/GP 2.17.2 (cypari2 via uv, in scratch) for characters of order 3 and 6 modulo 7:
    11a1 to 10⁻¹⁴, and the level-5 weight-4 newform (j = 0, 1, 2) to 10⁻¹¹.
  - The χ-reading fails.
- **`critical-value-algebraicity`.** The sign is ε = (−1)^{k−j}χ(−1), derived from L0's ι and V_k conventions.
- **`p-stabilised-euler-factors`.** L(f_α, s) = (1 − βp^{−s})L(f°, s).
- **`rjw-b1-comparison`.** The exact identity: for n ≥ 1, B.1's right side is (−1)^{j+1}/(2πiΩ) times the Riemann sum
  through a/pⁿ, and −ε(−1)^k/(2πiΩ) times the sum through −a/pⁿ.
  - **Consequence for L2:** normalize the distribution through −a/pⁿ, as Pollack–Stevens (1) does. Otherwise B.1 needs a
    period depending on j.
  - n = 0 gives the two Euler factors.

**Transcription caution.** Text extraction drops overbars. AWS (2), (7), AWS p. 13 and RJW B.1 all print χ̄; this was
read on the page images, and they agree with the verified formula. The roadmap stage text's quotation of B.1 drops the
bar. No source issue is recorded.

**New source:** RJW, arXiv:2309.15692v2.

**New request:** Tau Ceti ModularForms Layer 7 (L-functions, Mellin and twists).

**Lean:** three proved checks, for the period rescaling, the Mellin constant and the B.1 conversion constant. It compiles
with 0 errors and 68 `sorry` warnings (unchanged).

## What changed since checkpoint 1

**Duplication removed.** AUDIT-26, the reviewed library audit, lists Tau Ceti's ModularForms Layer 8 as a duplicate of this layer. The checkpoint-1 nodes `steinberg-module`, `unimodular-map`, `manin-surjectivity` and `manin-relations` planned Layer 8's Div⁰ and Manin theory, so they are withdrawn. The packet now requests these from Layer 8:
- Div⁰ with the degree sequence;
- Manin's theorem;
- the fundamental-domain presentation;
- 𝕄 and the period map.

The suggested Lean file keeps `Delta0`, `unimodularMap` and friends only as labelled stand-ins, so the Hom-side API can be stated.

**New nodes.** 18 L0 nodes plan Pollack–Stevens' Hom-side symbols for arbitrary coefficient modules. Layer 8 does not plan these, and L2 needs them for distributions:
- `symbols-coset-description`, `symbols-generator-values` (PS Corollaries 2.7/2.10, sign-corrected) and `symbols-base-change`;
- `boundary-symbols`, `symbols-to-cohomology`, `symbols-cohomology-sequence` (the integral exact sequence), `parabolic-cohomology` and `symbols-mod-eisenstein`;
- `symbols-level-descent`: integral for symbols, and for cohomology after inverting the index;
- `diamond-operators`, `hecke-operators-gamma1`, `nebentypus-symbols` and `nebentypus-decomposition`;
- `symbols-coinvariants-duality` and `polynomial-duality`: V_k ≅ Hom(Sym^k, ·) only when k! is invertible;
- `period-symbol`, `parabolic-cohomology-dimension`, `eichler-shimura-isomorphism` (Wiese's proof) and `eigenspace-dimension`.

**Totals.**
- 26 nodes, 49 API items, 39 unit tests, 6 planets and 42 baseline declarations.
- 7 requests and 3 source issues.
- `check_blueprint.py`: 0 errors, 0 warnings.

## Source issues (Pollack–Stevens 2011)

- **E1 (error).** Theorem 2.6/Corollary 2.7 and Theorem 2.9/Corollary 2.10 print the D∞ relation with the wrong sign.
  - *Correct form:* Σ(γ_i^{-1} − 1)D_i + ΣD′_i + ΣD″_i = (1 − T^{-1})D∞, and v∞|Δ = Σ v_i|(1 − γ_i) − Σ v′_i − Σ v″_i.
  - *Why:* this is what the paper's own boundary relation on p. 11 gives. For Γ₀(2), the printed relation forces 2D′₁ = 0.
  - *Corroboration:* Pollack's AWS notes (footnote 10, Γ₀(11)) and the Sage implementation (v∞ = −μ) both use the corrected sign.
- **E2 (misprint).** p. 11 prints (γ′_i + 1)e_i for (γ′_i + 1)e′_i.
- **E3 (misprint).** Corollary 2.10 prints γ′_i for γ″_i in the three-term relation, and undefined m′_i, m″_i.

No erratum turned up on Numdam or in the Crossref record.

## Requests

- **ModularForms Layer 8, four requests:**
  - Div⁰ with its GL₂⁺(ℚ) action and the degree sequence;
  - Manin's theorem for Div⁰ itself;
  - the fundamental-domain presentation for Div⁰ itself, with the corrected sign;
  - 𝕄 with Hecke and diamond operators and `periodMap′` with its milestones.
- **ModularForms Layer 5:** cuspidal and Eisenstein eigensystems are distinct. Hecke's bound only gives this in weight > 2.
- **ModularForms 10C:** the dimension formula for S_k(Γ₁(N)).
- **ModularCurvesPartII R14.3:** Symb_Γ(V) ≅ H¹_c(Y_Γ, Ṽ) (Ash–Stevens Proposition 4.2). This is the L0 target "functorial comparison with the analytic modular-curve carrier".

## Suggested Lean file

`suggested/ModularSymbolsPadicLFunctions.lean` imports Mathlib only; there are no Tau Ceti oleans at `f790474` on this server. Tau Ceti declarations (`diamondOp`, `cuspFormCharSpace`, the Petersson and multiplicity-one results) are cited in the packet, not imported.

It was compiled with the v4.34.0-rc2 `lean` against the prebuilt Mathlib 082e2d3 oleans: **0 errors**, 69 warnings at checkpoint 4 (68 before), all `declaration uses 'sorry'`.

New signatures:
- `bsymbols`, `res`, `eisSymbols`;
- `toH1`, `H1par`, `ker_toH1`, `range_toH1`, `symbols_le_of_le`;
- `diamond` and its API, `symbolsChar`;
- `vkPairing`;
- `periodSymbol`, `periodSymbol_toH1_injective`, `finrank_H1par_eq_two_mul`.

## What a continuation should do

1. **Finish L4.** Tame twists, coefficient embeddings and level change with the ℓ-Euler factors (Mazur–Tate–Teitelbaum
   1986; RJW §§6–8), and both refinements at a good supersingular prime with a worked example.
2. **Integral lattices.** Compare Symb_Γ(V_k(ℤ)) with Hom(𝕄, ℤ) through divided powers. `polynomial-duality` holds only
   after inverting k!, and `integral-period-lattices` records the dependence.
3. **Check E9 against the Inventiones text** if it can be obtained.

## Sources read

- Pollack–Stevens 2011 (Numdam), §§2.1–2.6, 3–6, §8.4 (Examples 8.6–8.8), the §8 examples for X₀(11), and the references.
- Wiese, arXiv:1809.04645v1, §§1.2–1.3, 4.3–4.5, 5, 6, 7.1–7.5.
- Pollack, AWS 2011 notes, §§2 and 6.
- Bellaïche, arXiv:0912.2925v1, §1.4 (pp. 5–11).
- Sage `pollack_stevens` source, only for the sign cross-check.

Not used: Ash–Stevens (Duke 1986), which is not freely available. The topological comparison it proves is requested from R14.3.
