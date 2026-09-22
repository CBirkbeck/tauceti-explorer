# PAPER-RICHARD-YAFAEV-25: Generalised André–Pink–Zannier conjecture for Shimura varieties of abelian type

Rodolphe Richard and Andrei Yafaev, *Generalised André-Pink-Zannier conjecture for Shimura varieties of Abelian type*, [Publications Mathématiques de l'IHÉS 141 (2025), 249–331](https://doi.org/10.1007/s10240-025-00154-4); arXiv [2111.11216](https://arxiv.org/abs/2111.11216). A short announcement of the same result appeared in Comptes Rendus Mathématique 363 (10.5802/crmath.751).

Extraction by Claude Code, session `cc-fb70e5`, 22 September 2026 (issue #1442). Status: **complete**. The whole published article was read and every missing item is routed once. The machine-readable extraction is [PAPER-RICHARD-YAFAEV-25.result.json](PAPER-RICHARD-YAFAEV-25.result.json): 41 items (1 library, 1 planned, 39 missing), 4 routes, 11 prerequisite entries and 6 recorded source issues.

**Source.** The published open-access article (CC BY 4.0), pp.249–331, SHA-256 `3f3af58def7bb398b3d365ecf828a6571a9477fd7f2b7b891706f146fec05b9e`, read in full on 2026-09-22.

## What the paper proves

- **Theorem 1.3.** In a Shimura variety of abelian type, a subvariety containing a Zariski-dense set of points of a generalised Hecke orbit is a finite union of weakly special subvarieties. This is the generalised André–Pink–Zannier conjecture, a case of Zilber–Pink.
- **Theorem 1.4.** The same holds for any point satisfying the new *uniform integral Tate conjecture* (Definitions 2.1, 2.3). This hypothesis says that the centralisers and semisimplicity of the ℓ-adic and mod-p Galois images, and of their bounded-index subgroups, are those of the Mumford–Tate group, uniformly in p.

The proof follows the authors' earlier paper *Height functions on Hecke orbits* ([40]). That paper reduces the conjecture, via Pila–Zannier, to polynomial lower bounds for Galois orbits in Hecke orbits. Here those bounds are proved unconditionally for abelian type:

1. **Functoriality and abelian type (§4).** The hypothesis passes along Hecke orbits, subdata, central quotients and products (Propositions 4.1–4.5). It holds for A_g (Corollaries 4.10–4.11), using:
   - a uniform integral Faltings theorem (Theorem 4.7): Ẑ[U′] has bounded index in the commutant of End(A) for every bounded-index U′, proved via Masser–Wüstholz and extended to fields of finite type by Noot's specialization;
   - Serre's ℓ-independence and connectedness results.
2. **Galois bounds (§5, Theorem 5.1).** The index [φ(U) : φ(U) ∩ K] polynomially dominates the Hecke height H_f(φ). The proof is prime by prime (Theorem 5.4):
   - for each p, by closed orbits and functoriality of heights;
   - for almost all p, by Lie-algebra tuples adapted to the Nori group of U(p) (Proposition 5.5);
   - relative stability estimates (Theorem 6.1) compare p-adic heights of two vectors with the same stabiliser, with a constant depending only on weights;
   - a torus argument handles the central part.
3. **p-adic Kempf–Ness (§7, Theorem 7.1).** For smooth reductive F ≤ G over ℤ_p and v with closed generic and special orbits and the right stabilisers, g·v is integral iff g is integral on G/F = Spec ℤ_p[G]^F, and G/F is smooth. The proof uses Seshadri's GIT over ℤ_p.
4. **§8 and the appendices.** §8 gives convexity estimates on apartments. Appendix A covers complete reducibility and closed orbits of Lie algebra tuples (Serre, McNinch). Appendix B covers ℓ-independence consequences of the Tate property.

## What the atlas already has

- **Library.** Mathlib has Goursat's lemma (`Subgroup.goursat`).
- **Planned.** ReductiveGroupsPartII RG2.3–RG2.4 plan hyperspecial models and the Cartan decomposition.
- **Adjacent layers.** ShimuraVarieties V0–V7 cover Shimura varieties and Hecke correspondences. FaltingsFinitenessAndIsogenyTheorems R28.4 covers Faltings' isogeny theorem, and LD.6 covers André–Oort-type applications.
- **Not in the atlas.** Hecke-orbit heights, Galois bounds, Nori theory, complete reducibility, and GIT over ℤ_p.

## Routes

1. **Source of FaltingsFinitenessAndIsogenyTheorems R28.4.** It covers Masser–Wüstholz's refinements of the Tate conjecture, and the uniform integral Faltings theorem over fields of finite type (Theorem 4.7, Proposition 4.8).
2. **Source of ArithmeticGaloisRepresentations R01.6.** It covers Serre's ℓ-independence, connectedness and Mumford–Tate containment of Galois images of abelian varieties, and Noot's specialization.
3. **Source of SchemeAndStackFoundations SF.0.** It covers the flatness and integrality lifting criteria of Propositions 7.13–7.15.
4. **New Part II `HeckeOrbitsAndAndrePinkZannier`**, titled *Complex Shimura varieties and canonical models, Part II: generalised Hecke orbits and the André–Pink–Zannier conjecture*.
   - It takes Hecke orbits and heights from [40], the uniform integral Tate framework with Nori and Serre theory, §§5–8, Appendices A–B, and Theorems 1.3 and 1.4.
   - The existing ShimuraVarieties Part IIs cover integral models, Honda–Tate theory and Kuga–Satake, so this is a new direction.
   - Theorem 1.3 is exported to LD.6 as a proven Zilber–Pink case.

## Source issues (`sourceIssues` E1–E6)

- **E6** (gap, affects the proof of Lemma 5.12).
  - **The claim.** The lemma claims Z_{M^ad}(ad_M(U′)) = Z_M(U′)/Z(M) for U′ = U[e].
  - **What the proof shows.** The proof treats m whose image centralises ad_M(U), not ad_M(U[e]). So it establishes only Z_{M^ad}(ad_M(U)) ⊆ Z_M(U[e])/Z(M). Homomorphisms U[e] → Z(M^der) need not extend to U, so the stated equality is not covered.
  - **Why nothing breaks.** The inclusion suffices for the one application, Lemma 5.11, where the Tate hypothesis makes Z_M(V[e]) = Z(M).
- **E1–E5** (misprints):
  - **E1:** in the proof of Theorem 4.7, M(A,K,d) should be M′(A,K,d).
  - **E2:** in Proposition 4.3, the index [U′ : U(p)] is reversed.
  - **E3:** U_p† := π_p⁻¹(U_p) should be π_p⁻¹(U(p)†).
  - **E4:** in Corollary 5.8's proof, the hypothesis on H_p should be on H_{v′} and the exponent 1/(2c(ρ)) should be c(ρ)/2; also, in H_Y, Y_k should be Y_l.
  - **E5:** in claim (30), "supp" should be "sup".

The proofs of Theorem 4.7, Proposition 5.2, Lemma 5.3, Lemmas 7.3–7.4 and 7.10 and Corollary A.5 were checked in detail. No correction notice is listed, and Crossref has no correction relation.

## Prerequisites not yet covered

- Richard–Yafaev, *Height functions on Hecke orbits* (arXiv:2109.13718). This paper completes it.
- Masser–Wüstholz 1995, and Nori 1987.
- Serre: *Complète réductibilité*, and the ℓ-independence criterion.
- Seshadri 1977, and Noot 1995.
- McNinch 2007, and Tits 1979.
- Edixhoven–Yafaev 2003, and Orr 2015.

Links and reasons are in the JSON.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-RICHARD-YAFAEV-25.result.json`: ok.
- Every missing item appears in exactly one route, and no source route takes a planned or library item. The Part II brief is 246 words.
- The Mathlib citation was read at 082e2d3 (`GroupTheory/Goursat.lean:128`). Planned layer ids were checked against `data/atlas.json`. Prerequisite DOIs were checked against Crossref.
- No Lean was written or compiled; none is a deliverable of this job.
