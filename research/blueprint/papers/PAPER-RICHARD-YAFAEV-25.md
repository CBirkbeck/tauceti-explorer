# PAPER-RICHARD-YAFAEV-25: Generalised André–Pink–Zannier conjecture for Shimura varieties of abelian type

Rodolphe Richard and Andrei Yafaev, *Generalised André-Pink-Zannier conjecture for Shimura varieties of Abelian type*, [Publications Mathématiques de l'IHÉS 141 (2025), 249–331](https://doi.org/10.1007/s10240-025-00154-4); arXiv [2111.11216](https://arxiv.org/abs/2111.11216). A short announcement of the same result appeared in Comptes Rendus Mathématique 363 (10.5802/crmath.751).

Extraction by Claude Code, session `cc-fb70e5`, 22 September 2026 (issue #1442). Status: **complete**. The whole published article was read and every missing item is routed once. The machine-readable extraction is [PAPER-RICHARD-YAFAEV-25.result.json](PAPER-RICHARD-YAFAEV-25.result.json): 41 items (1 library, 1 planned, 39 missing), 3 routes, 11 prerequisite entries and 6 recorded source issues.

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

## Routes (repaired 30 September 2026)

1. **Existing quantitative Part II `FaltingsFinitenessAndIsogenyTheoremsPartII`**, coalescing with [PAPER-TSIMERMAN-18 route 10](PAPER-TSIMERMAN-18.result.json), with the same parent and title, *Faltings finiteness, semisimplicity and isogeny theorems, Part II: Quantitative isogeny estimates*. Items 11–12 add Masser–Wüstholz's arithmetic refinements and Richard–Yafaev Theorem 4.7/Proposition 4.8. R28.4 supplies only the qualitative comparison; R01.6 supplies Noot specialization and Serre independence. The brief distinguishes these arithmetic refinements from Tsimerman's geometric isogeny-degree bound and records the still-open source/proof obligations.
2. **Source of ArithmeticGaloisRepresentations R01.6.** Items 13–14 retain Serre's independence, connectedness and Mumford–Tate containment, and Noot's specialization. This assignment does not assert that the supplier is formalized.
3. **Part II `HeckeOrbitsAndAndrePinkZannier`**, titled *Complex Shimura varieties and canonical models, Part II: generalised Hecke orbits and the André–Pink–Zannier conjecture*. Its 35 missing items include Hecke orbits/heights from [40], the uniform integral Tate framework with Nori and Serre theory, §§5–8, Appendices A–B, and Theorems 1.3–1.4. It now imports the uniform integral Faltings theorem from the quantitative Part II and owns item 35 next to its p-adic Kempf–Ness consumer. Theorem 1.3 is exported to LD.6.

Item 35 keeps the three propositions' different hypotheses: 7.13 concerns a closed affine finite-presentation scheme and flatness of its **reduction**; 7.14 assumes reduced affine finite-presentation source and target and a flat arrow; 7.15 assumes affine schemes and an integral arrow, without the other two clauses' extra hypotheses. The brief retains the finite-presentation descent from non-Noetherian ℤ̄_p to the integers of a finite extension of ℚ_p, the flat-reduction step for the fibre, and the integral-closure argument. Pinned Mathlib flat/integral morphism and affine-scheme APIs are reused through SF.0's narrowed library contract. SF.0 and the definition of valuative existence do not supply the new point-lifting equivalences.

The repair by Codex `codex-J6LwjP` re-read published pp.260–265 and 310–311, checking the latter page images and reproducing the original PDF hash. This is a selective routing repair, not another full extraction. The [fixes report](../redteam/RT-PAPER-RICHARD-YAFAEV-25.fixes.md) gives both verified findings, the ownership handoffs and validation. Extraction completeness is unchanged; the new routes await independent fix review and their eventual blueprints must close the stated source/proof obligations.

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

The original extraction records that the proofs of Theorem 4.7, Proposition 5.2, Lemma 5.3, Lemmas 7.3–7.4 and 7.10 and Corollary A.5 were checked in detail. Its original correction search found no correction notice or Crossref correction relation; the routing repair did not repeat that search.

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
- Every missing item appears in exactly one route, and no source route takes a planned or library item. The repaired routes cover respectively 2, 2 and 35 missing items; both Part II briefs state their imports, constructions and source obligations.
- The Mathlib citation was read at 082e2d3 (`GroupTheory/Goursat.lean:128`). Planned layer ids were checked against `data/atlas.json`. Prerequisite DOIs were checked against Crossref.
- No Lean was written or compiled; none is a deliverable of this job.

## Historical review (REV-PAPER-RICHARD-YAFAEV-25, 23 September 2026)

The record below applies to the original four routes. It does not approve the three repaired routes above; the independent fix review must assess them. Source issues E1–E6 and their original review are unchanged.

The independent review, by Claude Code (session `cc-7b31c4`, issue #1443), **accepted** this
extraction and all four routes, with one small correction in place. The full record is
[REV-PAPER-RICHARD-YAFAEV-25.md](../reviews/REV-PAPER-RICHARD-YAFAEV-25.md).

The recorded hash reproduces. 41 items, all 39 missing ones routed exactly once; the three source
stage ids, both planned layer ids and the `Subgroup.goursat` citation all check out; 57 of 63
locator checks land exactly and the other six were read (the proof of Theorem 4.7's number-field
case does reach p.263, and Remark 2.1.3 is printed in the paper's section style "2.1.3. Remarks." on
p.253). Every numbered definition, proposition, lemma, corollary and theorem is carried into an
item; only three remarks are not. The Part II title reproduces the parent's atlas title exactly, its
id appears in no other extraction, and no existing layer covers Hecke-orbit geometry or p-adic
geometric invariant theory.

**Correction.** Item 34 called 7.6–7.8 all lemmas; 7.8 is printed as a corollary and 7.9 is a
proposition already covered by item 32, so the name and locator now write the range out.

All six findings are **confirmed**. E6 is a real gap: Lemma 5.12 asserts
`Z_{M^ad}(ad_M(U′)) = Z_M(U′)/Z(M)`, while the proof starts from `m` whose image centralises
`ad_M(U)` — the image of the whole group — and lands in `Z_M(U[e])`; since `ad_M(U[e]) ⊆ ad_M(U)`,
what is proved is the inclusion `Z_{M^ad}(ad_M(U)) ⊆ Z_M(U[e])/Z(M)`, which is what the use at the
top of p.285 needs. The five misprints are each printed as quoted: the circular `M(A, K, d)` on
p.263, the inverted index on p.259, `π_p⁻¹(U_p)` on p.273, the `H_p`/`H_{v′}` and
`1/(2·c(ρ))`/`c(ρ)/2` slips with `Y_k` for `Y_l` on p.280, and `supp` for `sup_p #` on p.275.
