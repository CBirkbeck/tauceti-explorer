# BP-ModularSymbolsPadicLFunctions: L0 source-decomposed (checkpoint 2)

Claude Code — session `cc-39fac3`, 28 September 2026. Refs #777. **Status: partial.** L0 is `source_decomposed`; L1–L4 are `not_read`.

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

It was compiled once with the v4.34.0-rc2 `lean` against the prebuilt Mathlib 082e2d3 oleans: **0 errors**, 68 warnings, all `declaration uses 'sorry'`.

New signatures:
- `bsymbols`, `res`, `eisSymbols`;
- `toH1`, `H1par`, `ker_toH1`, `range_toH1`, `symbols_le_of_le`;
- `diamond` and its API, `symbolsChar`;
- `vkPairing`;
- `periodSymbol`, `periodSymbol_toH1_injective`, `finrank_H1par_eq_two_mul`.

## What a continuation should do

1. **Integral lattices in L1.** Compare Symb_Γ(V_k(ℤ)) with Hom(𝕄, ℤ) through divided powers, since `polynomial-duality` only holds after inverting k!.
2. **Stage L1** (periods and critical values):
   - coefficient fields and ± eigenspaces over K_f, using `eigenspace-dimension`;
   - period lines and periods Ω_f^±;
   - saturated integral lattices;
   - the Mellin formula with twists (AWS §2.8 gives the untwisted case);
   - algebraicity;
   - the RJW B.1 comparison.
3. **Stage L2:** distributions D_k (needs LocallyAnalyticDistributions), specialisation, and the control theorem (PS §§3–5). `symbols-generator-values` is the input for PS Theorem 5.1.
4. **Stages L3–L4.**

## Sources read

- Pollack–Stevens 2011 (Numdam), §§2.1–2.6, 3.4, 5.1.
- Wiese, arXiv:1809.04645v1, §§1.2–1.3, 4.3–4.5, 5, 6, 7.1–7.5.
- Pollack, AWS 2011 notes, §2.
- Sage `pollack_stevens` source, only for the sign cross-check.

Not used: Ash–Stevens (Duke 1986), which is not freely available. The topological comparison it proves is requested from R14.3.
