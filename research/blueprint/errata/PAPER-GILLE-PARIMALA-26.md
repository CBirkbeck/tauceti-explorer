# Mistakes in Gille–Parimala, *A local-global principle for twisted flag varieties*

Job ERRATA-PAPER-GILLE-PARIMALA-26. Worker: Claude Code, session `cc-fb70e5`, 22 September 2026. The findings are in `PAPER-GILLE-PARIMALA-26.json` beside this file.

**Paper and versions.** P. Gille and R. Parimala, Inventiones mathematicae 244 (2026), 617–641, DOI 10.1007/s00222-026-01403-x.
- **Extraction base:** the HAL v5 author manuscript of 26 December 2025. It could not be re-read here: HAL now answers with an anti-bot challenge, and the manuscript is not on the authors' pages.
- **Read instead:** every finding below was re-read in arXiv 2301.07572v3 of 24 March 2023 (19 pages, SHA-256 `35c492fe…acd9`), the latest arXiv version, where the passages are present with the same numbering. The extraction had found each of them in HAL v5 as well.
- **Not collated:** the published text.

HAL v5 has "Theorem 4.5(2)" where v3 has Theorem 4.4(2) and Corollary 4.5(2). The published version shifts by one: Example 5.1(b) and Proposition 6.2 there are v3's Example 4.1 and Proposition 5.2.

**Author's errata.** Gille's page has "Errata et compléments", dated 26 May 2026. Its entry for this paper corrects two points, recorded here as E4 and E8 with the erratum as `known`. Its example in E4 is itself wrong: the series it gives lies in the fraction field it is meant to avoid. A valid witness is supplied.

**Not recorded.** The extraction also flagged points that appear only in HAL v5 or in the published appendices, which could not be checked here:
- the codimension condition in Theorem B.1 (item 138);
- a normality step in Proposition 3.11(2) and Claim 3.12 (item 57);
- the wording on unipotent torsors (item 26), which is fine in v3: "trivial since G_{j−1} is affine";
- "open subgroup of G(F₀)⁺" (item 44), which v3 words correctly;
- the tameness justification (item 99);
- a residue-field shortcut (item 145).

A later worker with access to HAL v5 or the published text should check them.

**Effect.** The main theorems stand. E6 misstates a stated characterization of the Tits index; its corrected form follows from part (1). E8 is a gap the authors have repaired. The rest are misprints.

## E1. The unit ball in Lemma 3.2 (misprint)

Part (3) prints "V = Inf{v ∈ V[1/t] | |v| ≥ 0}", and the proof of (2) says |v| = 0 for v′ ∉ tR̂₀. The intended statements are V = {v ∈ V[1/t] : |v| ≤ 1} and |v′| = 1.

## E2. V for W in Proposition 3.3 (misprint)

Hypothesis (ii) reads Df^b₀ : (F₀)^a → (F₀)^c and Df^a₀(V[1/t]^a) + Df^b₀(V[1/t]^b) = (F₀)^c. It should be (F₀)^b and W[1/t]^b: the conclusion and the proof use V^a × W^b. Literally, the statement fails, for example V = R̂₀, W = 0, f(v, w) = w.

## E3. The gluing in Theorem 3.9 (misprint)

From x₁ = h₁h₂.x₂ the proof concludes "h₁⁻¹.x₁ = h₂⁻¹.x₂". The correct identity is h₁⁻¹.x₁ = h₂.x₂.

## E4. Frac(k[x][[t]]) is not k(x)((t)) (error; corrected by the authors, but with a wrong example)

Example 4.1 states F_U = Frac(k[x][[t]]) = k(x)((t)). Gille's erratum corrects this, citing Σ_{n≥1} tⁿ/xⁿ as an element of the complement.

**The erratum's example fails.** That series equals t/(x − t), which is in the fraction field.

**A correct witness.** Σ tⁿ/x^{n!}. Write any quotient as a/b with b₀ ≠ 0, and let m = ord_x(b₀). The recursion for its coefficients c_n gives ord_x(c_n) ≥ −m(n + 1), a linear bound that the orders n! exceed.

## E5. f₁ and f₂ in the proof of Lemma 4.3(2) (misprint)

The proof says "f₂ belongs to R̂_P so belongs to V" and then "f₂ belongs to W". The first should be f₁: it is the part in x⁻¹, hence in R̂_P.

## E6. The direction of inclusions in Theorem 4.4(2) (error)

The Tits index is characterized as "the smallest ⋆-stable subset … such that Δ₀(G) ⊂ Δ₀(G_{F_U}) for each U and Δ₀(G) ⊂ Δ₀(G_{F_P}) for each P". Corollary 4.5(2) has the same wording, and the proof uses the same inclusion.

**Why it is wrong.** Minimal parabolics shrink over extension fields, so the local types are contained in the global one. The smallest stable subset contained in all of them is empty.

**Correction.** The smallest ⋆-stable subset containing every Δ₀(G_{F_U}) and Δ₀(G_{F_P}). With this, the proof works via part (1) applied to Par_Θ.

## E7. Aut_I(G₀)/T₀ is not finite (misprint)

In the proof of Proposition 5.2, the finite group S₀ is described as "an extension of the finite constant group Aut_I(G₀)/T₀ by a finite subgroup of T₀". Aut_I(G₀) contains the adjoint group, so the finite group meant is N_{Aut_I(G₀)}(T₀)/T₀.

## E8. The completed local ring in Proposition 5.2 (gap; corrected by the authors)

The proof takes "the local ring A = R_P". The loop-torsor argument needs the completion of R_P. The authors' erratum makes exactly this replacement and explains why the valuation completions agree.
