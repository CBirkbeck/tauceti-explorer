# Mistakes in Kisin–Pappas–Zhou, *Integral models of Shimura varieties with parahoric level structure, II*

Job ERRATA-PAPER-KISIN-PAPPAS-ZHOU-26. Worker: Claude Code, session `cc-442dc5`, 23 September 2026. The findings are in `PAPER-KISIN-PAPPAS-ZHOU-26.json` beside this file.

**Paper and version read.** Mark Kisin, Georgios Pappas and Rong Zhou, Forum of Mathematics, Pi 14 (2026), e14, 1–89, DOI 10.1017/fmp.2026.10031.
- The version read is the published text, from the Cambridge repository copy (SHA-256 `b3e4bf8b…`). The publisher's own PDF link returned HTML.
- arXiv v3 (SHA-256 `d0834555…`) was compared where the published text is garbled.
- The formula pages 31, 35, 37–38, 41, 60 and 79 were checked on page images, because the PDF text layer drops primes, bars and superscripts.

**Earlier work.**
- The extraction PAPER-KISIN-PAPPAS-ZHOU-26 was a Codex checkpoint (`codex-c83e7a`), completed by this session. It recorded fourteen findings.
- Its E1–E7 are this paper's own printed corrections of Kisin–Pappas 2018 ([KP18]) and Pappas 2023 ([P23]):
  - the connection isomorphism c of [KP18, Lemma 3.1.9];
  - the missing very-good hypothesis in [KP18, 3.2.12 ff.] and [P23];
  - the q^loc torsor claim;
  - the topology in [KP18, Lemma 3.1.17];
  - the component levels in [KP18, Lemma 4.6.13];
  - H♯ in [KP18, 4.6.21].
- Those are mistakes in [KP18] and [P23], not in this paper, and are left to those papers' errata (for [KP18], job #1878).
- The extraction's E8–E14 are E1–E7 here. This job found E8.

**Existing corrections.** None was found. All eight findings are new.
- The journal's article page links no erratum.
- Crossref registers no update.
- arXiv has v1–v3, and v3 (April 2026) is the latest.
- Kisin's preprint page and Zhou's Cambridge page list no correction.

**Effect on the main results.** The main theorems are unaffected.
- **E2 is the only one that reaches a stated result.** It leaves Proposition 4.2.10(2) unproven in characteristic p for general weights.
- **Theorem 4.2.3 still holds** through minuscule weights, so Theorem 1.1.1, the local-model results and the very-good embeddings are unaffected.
- **The rest are slips with clear intended forms.**

## E1 — Remark 4.1.5(2): the surface is not normal (p. 31)

- **What the paper says.** "Consider the normal surface X = Spec k[x, y, x]/(x² + xyz)." The variables are misprinted, and the ring is meant to be k[x, y, z].
- **Why it is wrong.** x² + xyz = x(x + yz), so X is the union of the plane x = 0 and the smooth surface x = −yz, meeting along x = yz = 0. Its local ring at the origin is not a domain, so X is not normal.
- **What stands.** Everything the remark uses:
  - T₀X is 3-dimensional.
  - A formal curve (f, g, h) with f(f + gh) = 0 has f = 0 or f = −gh, so f has no t-term.
  - The tangent cone is Spec k[x, y, z]/(x²).
- **Effect.** Normality is never used, so the example still shows that tangent spaces need not be spanned by formal curves.

## E2 — §4.2.9: the weight criterion fails in characteristic p (p. 35)

- **What the paper says.** W(α) is defined by "X_α v_ϖ′ ≠ 0 for some weight vector v_ϖ′", and the text adds "Equivalently, … ϖ′ and ϖ′ + α are weights of V(ϖ)". The proof of Proposition 4.2.10(2) then says that the pairs with X_α v ≠ 0 "range over all elements of W(α)".
- **The counterexample.** Here k has characteristic p (§4.1.1). Take G = GL₂ and ϖ = (p, 0). The Weyl module V(ϖ) has a basis v₀, …, v_p with X_α v_i = (p − i + 1)v_{i−1}. So X_α v₁ = p·v₀ = 0, although (p − 1, 1) and (p, 0) are both weights. The equivalence fails.
- **Why the proof step fails.** Pairs where X_α vanishes give no bound in the proof, and the relevant module is V(ν)^* = H⁰(ϖ), not V(ϖ). So under either reading the last step of the proof of Proposition 4.2.10(2) fails.
- **The repair.** For minuscule ϖ, adjacent weights span the standard representation of the root SL₂, and X_α acts nontrivially there in every characteristic. So the proof does give the bound over ϖ ∈ S. With Proposition 4.2.13's k_α ≥ j_α, this yields Φ^cur = Φ^tan = Φ^FM, which is Theorem 4.2.3.
- **Effect.** Proposition 4.2.10(2) is not established for arbitrary λ ≼ μ in characteristic p. Neither are the equalities with l_α in (4.2.12), Proposition 4.2.13, Remark 4.2.16 and Corollary 4.2.19, as printed. The later results need only k_α = j_α.

## E3 — weights written as cocharacters (pp. 34–35, 41)

- **What the paper says.**
  - Definition 4.2.6, §4.2.9 and the proof of Proposition 4.2.10(2) put the dominant weights ν and ϖ in X_*(T)⁺, and call ϖ a "dominant cocharacter".
  - Conversely, Proposition 4.3.9 writes λ ∈ X^*(T)₊.
- **The intended form.** ϖ is the highest weight of V(ϖ) and is paired with the cocharacters λ and μ, and §4.2.11 writes X^*(T)⁺ for these weights. So ν and ϖ are characters, and λ is a cocharacter.

## E4 — types B and D: lattices and fundamental weights (pp. 37–38)

- **What the paper says.** For type B_n, "We identify P^∨ and P with Z^n", yet the same display gives ϖ_n = (1/2, …, 1/2) ∉ Z^n. In types B and D the fundamental weights are printed as ϖ_i = Σ_{j=1}^i e_i.
- **The correction.** P = Z^n + Z·(1/2, …, 1/2), and ϖ_i = Σ_{j=1}^i e_j, as printed correctly for type C. The case check uses the intended weights.

## E5 — type D: the last simple root and the sign of μ (pp. 38–39)

- **What the paper says.** α_n = e_{n−1} + e_{n−1}; and, for type D^H_n, μ = sϖ^∨_{n−1} + tϖ^∨_n = (r/2, …, r/2, q/2) with q = s − t.
- **The correction.** α_n = e_{n−1} + e_n. With the printed ϖ_{n−1} = (1/2, …, 1/2, −1/2) and ϖ_n = (1/2, …, 1/2), the last coordinate of μ is (t − s)/2.
- **Effect.** The case check never uses that coordinate, and exchanging s and t is the diagram automorphism.

## E6 — Corollary 4.2.19 computes k_{−α}, not k_α (p. 40)

- **What the paper says.** "k_α = min_{ϖ∈S} ⟨μ, ϖ⟩ − ⟨λ, ϖ_α⟩ = l_α."
- **The correction.** Lemma 4.2.18 minimizes over W(−α), so the formula computes k_{−α} = l_{−α}. Both uses read it that way: the proof of Proposition 4.3.9 and Remark 4.3.14.
- **A check.** For GL₂ and λ = μ = (1, 0), the minimum is 0 = k_{−α}, while k_α = 1.

## E7 — the proof of Lemma 7.2.8 (p. 79)

- **The garbled sentence.** In the published proof, one sentence was garbled in typesetting: "we have h = ∏_{σ:F→R,σ} ×V_{R,σ} → R. We also have an isomorphism Let h ∈ X; then considering h as a H′_{R,σ} is the weight homomorphism for h_σ." arXiv v3 (p. 82) has it intact: h = ∏_σ h_σ with h_σ: S → H′_{R,σ}, h_σ(i) is a Cartan involution of H′_{R,σ}/w_σ(R)^×, and w_σ is the weight homomorphism.
- **The base change.** Bil_{H^c}(V) ⊗_Q F should be ⊗_Q R.
- **The choice of Ψ.** "Ψ ∈ Bil_{H^c} ∩ ∏ U_σ" means a Ψ in Bil_{H^c}(V) whose image in Bil_{H^c}(V) ⊗_Q R lies in the open, nonempty set ∏ U_σ. Such a Ψ exists by density.

## E8 — the proof of Proposition 5.3.11: an ill-defined arrow (p. 60)

- **What the paper says.** "the base change of c by the map Ŵ(R_G/𝔞_G) → Ŵ(k[[u]]) → Ŵ(k[ε]) induced by a*_(2): R_G → k[[u]] → k[ε]".
- **Why the arrow is not defined.** 𝔞_G = 𝔪_G² + π_E R_G maps into (u²), not to 0, in k[[u]]. So there is no map R_G/𝔞_G → k[[u]].
- **The intended map.** It is Ŵ(R_G/𝔞_G) → Ŵ(k[ε]), induced by the composite R_G → k[[u]] → k[ε], which kills 𝔪_G² and π_E. The preceding display, c_{Ŵ(k[ε])} = c ⊗_{Ŵ(R_G/𝔞_G), a*_(2)} Ŵ(k[ε]), already uses exactly this map.
- **Effect.** The argument is unchanged.
