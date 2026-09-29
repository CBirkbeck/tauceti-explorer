# PAPER-HEUER-25: A p-adic Simpson correspondence for smooth proper rigid varieties

Ben Heuer, *A p-adic Simpson correspondence for smooth proper rigid varieties*, [Inventiones mathematicae 240 (2025), 261–312](https://doi.org/10.1007/s00222-025-01321-4); arXiv [2307.01303](https://arxiv.org/abs/2307.01303).

Extraction by Claude Code, session `cc-fb70e5`, 29 September 2026 (issue #1220). Status: **complete**. Every missing item is routed once.

The machine-readable extraction is [PAPER-HEUER-25.result.json](PAPER-HEUER-25.result.json). It has:
- 43 items: 1 library, 4 planned, 38 missing;
- 4 routes: one new Part II and three sources of existing layers;
- 18 prerequisite entries;
- 4 recorded mistakes: 3 misprints and 1 gap.

## Sources read

- **The published version**, open access under CC BY 4.0, read in full: 52 pages (pp. 261–312). Item locators are the journal's pages.
- **Other versions:** arXiv v3 (21 January 2025) precedes publication and was not compared line by line.
- **Errata:** the Springer page shows no correction, and Crossref records no update.
- **Checks:** all four mistakes were checked on page images, and the exp/log valuations behind E4 were recomputed exactly.

## What the paper proves

**Main theorem (Theorem 5.1 = 1.1).**
- Setting: X is smooth and proper over K, complete and algebraically closed over Q_p.
- Choices: a B_dR^+/ξ²-lift 𝕏 of X, and an exponential for K (a continuous splitting of log : 1 + m_K → K).
- Statement: these give an exact tensor equivalence between pro-étale vector bundles and Higgs bundles. Here θ : E → E ⊗ Ω^1(−1) with θ ∧ θ = 0.
- Naturality: the equivalence is natural in all the data.
- Comparison: RΓ(X_proét, V) = Dolbeault cohomology (Theorem 5.5).
- Scope: this generalises Faltings's curve case to every dimension and to rigid spaces. A model over a discretely valued field gives a canonical lift.

**How the proof goes.**
- **The spectral algebra.** A Higgs field makes E a module over B = image(Sym^•Ω̃^∨ → End E), a coherent commutative algebra with tautological section τ_B.
- **The multiplicative Hodge–Tate sequence (Theorem 2.4).** The pro-étale Picard functor of B sits in 0 → Pic_{X′} → Pic_{B,proét} → H^0(X, B ⊗ Ω̃) ⊗ G_a → 0.
  - Right exactness is geometric: the boundary map into R²π_*O^× is killed because it factors through a locally constant sheaf.
  - The Higgs–Tate torsor of the lift splits the Lie-algebra sequence (Proposition 2.15).
- **Building L_B.**
  - Always representable: a reduction P_𝕏 to Pic_{X′}[p^∞] (Theorem 3.2).
  - Unique up to unique isomorphism: rigidifications at finitely many points lifted to B_dR^+/ξ² (Theorem 3.14).
  - The exponential of p-divisible rigid groups (Fargues; Heuer–Werner–Zhang) then gives L_B with HTlog(L_B) = τ_B (Theorem 3.22).
- **The two functors.**
  - Higgs to pro-étale: (E, θ) ↦ ν*E ⊗ L_B.
  - Pro-étale to Higgs: untwist by L_B^{−1}, using Rodríguez Camargo's canonical Higgs field on pro-étale bundles (Theorem 4.8).
  - The local correspondence on toric charts proves both functors well defined and mutually inverse (§4).

## What the atlas already has

**Library (1 item).** The Banach open mapping theorem (`ContinuousLinearMap.isOpenMap`).

**Planned (4 items).**
- The pro-étale site and completed structure sheaf: AdicSpacesPartII R4, AInfCohomology AI.3.
- Kiehl finiteness: AdicSpacesPartII R3.
- Proper base change: DiamondEtaleCohomology C5.
- Exactness of finite pushforward: ClassicalAdicEtaleCohomology H0.

**Missing everywhere.** Higgs bundles in p-adic geometry, and any p-adic Simpson correspondence. PAPER-LIU-ZHU-17 routes the one exception, Liu–Zhu's arithmetic functor for Q_p-local systems, to HodgeTateAndCanonicalSubgroups T6:comparison.

## Routes

1. **New Part II `PadicHodgeTheoryPartIIPadicSimpson`** (33 missing).
   - Title: "P-adic Hodge theory and geometric comparison, Part II: the p-adic Simpson correspondence for smooth proper rigid spaces". Parent: PadicHodgeTheory. Area: `padic`.
   - **Layers:**
     1. Higgs bundles and spectral algebras;
     2. the pro-étale Picard functor and the multiplicative Hodge–Tate sequence;
     3. P_𝕏 and rigidified Picard functors;
     4. Fargues's p-divisible rigid groups and the exponential, giving L_B;
     5. the local correspondence and the canonical Higgs field;
     6. the equivalence and the cohomological comparison.
   - **For the design job:** the brief asks it to compare with Liu–Zhu's arithmetic functor rather than rebuild it.
2. **Source of PadicHodgeTheory [P8]** (2 missing). Scholze's Rν_*Ô = Ω̃^n, the primitive comparison, finiteness and the Hodge–Tate decomposition, and the Faltings extension. This matches how PAPER-LIU-ZHU-17 routes the Faltings extension.
3. **Source of DiamondsAndVStacks [D2]** (1 missing). Kedlaya–Liu: vector bundles agree on the pro-étale and v-sites.
4. **Source of AdicSpacesPartII [R2, R3]** (2 missing). Finite formal models of coherent algebras (Lemma 2.7), and rigid and pro-étale cohomology and base change for proper spaces.

## Source issues (`sourceIssues` E1–E4)

**E4 (gap, proof of Lemma 5.7, pp. 308–310, p ≥ 3).**
- The comparison uses the Tate algebra O_U⟨p^{−α}∂⟩ with α = 1/(p − 1). That is the closed disc on whose boundary exp diverges: in y = p^{−α}∂, the coefficient of y^{p^k} in exp(∂) has valuation exactly 1/(p − 1).
- Consequences:
  - the cocycle γ_i ↦ exp(∂_i) does not lie in the algebra;
  - log(1 + T)/T has a unit coefficient at z^{p−1}, and vanishes at ζ_p − 1 on the disc, so it is not a unit;
  - hence T ↦ exp(∂) − 1 is undefined.
- **Repair:** any strictly smaller radius, β > 1/(p − 1), after a further étale localisation, repairs the argument. The p = 2 choice α = 2 already works.

**Misprints (affect nothing).**
- E1: "[7, §8.2]" for Grothendieck–Murre–Oort representability. Reference [7] is Bosch–Lütkebohmert's flattening paper; Néron Models §8.2 is meant.
- E2: "∏_{x∈X}" should be ∏_{x∈M} in the proof of Theorem 3.14.
- E3: "θ_V = θ_{V′}" should be θ_V = θ′_V in the proof of Theorem 4.8.

## Prerequisites not yet covered

Eighteen entries:
- Faltings (Adv. Math. 2005);
- Scholze: Forum Pi 2013, the perfectoid survey, Publ. IHÉS 2012;
- Fargues (Math. Ann. 2019);
- Heuer–Werner–Zhang (arXiv 2308.13456);
- Heuer: moduli spaces (arXiv 2207.13819), rank one (Compos. 2024), v-line bundles (Forum Sigma 2022), relative Hodge–Tate (arXiv 2402.00842);
- Rodríguez Camargo (arXiv 2205.02016);
- Kedlaya–Liu (arXiv 1602.06899);
- Abbes–Gros–Tsuji (Annals of Math. Studies 193);
- Liu–Zhu (Invent. 2017);
- Guo (JEMS 2023);
- Bhatt–Hansen (Compos. 2022);
- Hartl–Lütkebohmert (Crelle 2000);
- Simpson (Publ. IHÉS 1992).

Every DOI was checked against Crossref.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-HEUER-25.result.json` reports no errors.
- Every planned and route stage id exists in `data/atlas.json`.
- The Mathlib citation was found in the pinned index at Mathlib 082e2d3.
