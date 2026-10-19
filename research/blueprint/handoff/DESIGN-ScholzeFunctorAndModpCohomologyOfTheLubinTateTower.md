# Handoff: DESIGN-ScholzeFunctorAndModpCohomologyOfTheLubinTateTower (issue #3455)

Agent: Claude (session claude-I5AE5O), 2026-10-19.

## What was done

A new roadmap `ScholzeFunctorAndModpCohomologyOfTheLubinTateTower` (area `langlands`, no parent), planned at target level from the PAPER-COLMEZ-DOSPINESCU-NIZIOL-23 route of the same name (16 items) and the papers CDN23 use in full and that no other roadmap plans.

- Roadmap definition `research/blueprint/roadmaps/ScholzeFunctorAndModpCohomologyOfTheLubinTateTower.json`: seven layers SZ.0–SZ.6, each with its targets in the description and `requires` derived from the node prerequisites.
- Packet `research/blueprint/packets/ScholzeFunctorAndModpCohomologyOfTheLubinTateTower.json`, status `complete`: 29 nodes (21 theorems, 3 lemmas, 3 definitions, 2 constructions), 39 API items, 20 unit tests, 16 planets, 14 baseline declarations, 7 requests, 1 gap, 3 source issues, a `routeCoverage` list (every route item plus the consumed items routed elsewhere) and one `restructure` (rescope) note. `python3 scripts/check_blueprint.py` reports 0 errors and 0 warnings (run with `--index` on the pinned declaration index).
- Reader `research/blueprint/readmes/ScholzeFunctorAndModpCohomologyOfTheLubinTateTower.md` (about 23,000 words), escaped for the atlas renderer.
- Suggested file `research/blueprint/suggested/ScholzeFunctorAndModpCohomologyOfTheLubinTateTower.lean` (about 200 lines). **It elaborates** with `lean-check` at the pinned Mathlib 082e2d3 / Tau Ceti f790474, `sorry` being the only warning; an appended `run_cmd` audit found no `sorry` in any statement type.

## Layers and what each plans

- SZ.0: equivariant étale sites for towers (Scholze §2, on the site of IG.4), the Gross–Hopkins torsor, Strauch’s connected components, admissible representations of compact p-adic Lie groups.
- SZ.1: Scholze’s sheaf ℱ_π, the functors Sⁱ, the strict-image almost finiteness lemma (Scholze Corollary 3.6), the Frobenius almost-module lemma (Scholze 2013 Lemma 2.12), Scholze’s finiteness theorem (CDN Theorem 3.1 (1)–(2)), Galois action, S⁰, central characters and twists (CDN 3.1 (3)–(4), DPS 7.3–7.4).
- SZ.2: Fust’s theorem (Ext comparison, Shapiro, finiteness, SL₂ vanishing, restriction of admissibility), Moore’s H² of SL₂, the Cartan–Leray spectral sequence (CDN 3.2), its multiplicity form (3.11), the comparison map (3.13).
- SZ.3: Ludwig’s Borel quotient and vanishing theorem.
- SZ.4: globalisation (CDN 4.5 / DPS 8.1 / Gee–Kisin A.3), the definite quaternionic block module with the auxiliary place and occurrence of every block member (CDN 4.7, 4.8, 4.10, the characteristic-zero point supplied here), Paškūnas’s Lemma 6.1, the key local proposition (CDN 4.3).
- SZ.5: functors of finite image, the ascent (CDN 4.13, 4.17), vanishing for almost every π (Theorem 0.9), the finite-length theorem (4.1, Remark 4.2, Corollary 4.21).
- SZ.6: finiteness for every F (4.22), Π^geo_n(ρ̄) and its theorem (4.23 with Lemma 4.24 and the d = 2 statement of Theorem 0.3 (b) via Remark 4.25), Lubin–Tate smooth vectors (4.26, Lemmas 4.27–4.28).

## What remains (precisely)

All seven stages are `planned`; none is `closed` because of the following.

1. **Gap** `ScholzeFunctorAndModpCohomologyOfTheLubinTateTower/gap/proetale-finite-presentation`: CDN Theorem 2.1 (finite presentation of the duals of H^q_ét(M^ϖ_{n,K}, O_L/p^k)). It is routed to ProetaleCohomologyOfPAdicCurvesAndTowers, whose design DESIGN-ProetaleCohomologyOfPAdicCurvesAndTowers (issue #3410) has not been done and has no stages, so no request could be filed. When that design is accepted, SZ.5/finite-length should cite its node and the gap closes.
2. **Requests** (stage level):
   - `AdicSpacesPartII:R0`: Temkin’s good-germ criterion, for SZ.1/strict-image-almost-finite.
   - `ClassicalAdicEtaleCohomology:H0`: cohomological dimension of |X| for rigid spaces (de Jong–van der Put 2.5.8) and the Hochschild–Serre sequence for rigid spaces over K (3.7.5), for SZ.1/scholze-finiteness, SZ.3/ludwig-vanishing and SZ.5/drinfeld-tower-ascent.
   - `PerfectoidShimuraVarieties:S1`: the supersingular part of the perfectoid modular curve as a union of copies of the Lubin–Tate tower at infinite level, compatibly with the Hodge–Tate map, for SZ.3/borel-quotient (Ludwig §3).
   - `LocalGaloisDeformationRings:R08.6`: existence of potentially Barsotti–Tate lifts of every two-dimensional mod p representation of Gal_K, for SZ.4/residual-globalisation (Gee–Kisin Theorem A.2).
   - Imported without new content: Tau Ceti ClassFieldTheory layers 6 and 7, Chebotarev layer 10.

## Cross-roadmap notes for other jobs

- `CompletedCohomologyAndLocalGlobalCompatibility:R31.4/scholze-functor-and-completed-cohomology-of-shimura-curves` records a gap ‘Scholze’s functor’ naming this design. It can now cite `SZ.1/scholze-functor` and `SZ.1/scholze-finiteness`. This roadmap cites that R31.4 node (Paškūnas Lemma 6.2 and isotypy) from SZ.4 and SZ.6; there is no stage cycle (R31.4 → our SZ.1, our SZ.4 → R31.4).
- PAPER-COLMEZ-DOSPINESCU-NIZIOL-23 also lists Théorèmes 0.2, 0.3, 0.7, 0.9 and Proposition 0.11 under the PadicLocalLanglandsForGL2Qp Part II route. The same statements are planned here (SZ.5/finite-length, SZ.6/geometric-multiplicity-theorem, SZ.6/multiplicity-finiteness-general-F, SZ.5/almost-all-vanishing, SZ.2/comparison-map). The Part II design (issue #3409) should import them by node id and plan only the factorisation of CDN §5 (restructure entry, action `rescope`).
- No upward citations: this roadmap is not in the upstream tiers.

## Source issues recorded

- E1 (misprint, affects nothing): CDN23 cite Fust ‘lemma 6.3’ for finiteness of Hⁱ(SL₂(F), π) (pp. 37 and 46). That number is from Fust’s arXiv v1. In the published Münster J. Math. paper they cite, the lemma is Lemma 6.6.
- E2 (gap, affects the proof): in the proof of CDN Theorem 3.2 (p. 35), CDN use Lemma 23.6 of Étale cohomology of diamonds with ℤ/p^k coefficients. The printed proof of that lemma only covers prime-to-p coefficients (PAPER-SCHOLZE-17/E69). Continuity of étale cohomology (ECD Proposition 14.9) gives the needed identity, and the plan uses that.
- E3 (misprint, affects nothing): CDN (4.15), p. 44, write π₀(M^p_{Dr,∞}) ≅ ℚ_p^×/p^ℤ. The central p acts on π₀ = ℚ_p^× through det = p², so it is ℚ_p^×/p^{2ℤ} (M^p_0 is two copies of Ω). The Shapiro computation after (4.16) should use C⁰(ℤ_p^× ⊔ pℤ_p^×); the conclusions are unchanged.

## Checks run

- `check_blueprint.py` on the packet: 0 errors, 0 warnings.
- `lean-check` on the suggested file: elaborates; only `sorry` warnings; no `sorry` in statement types (run_cmd audit).
- Two Sonnet cross-checks.
  - Supplier contracts: 116 prerequisite pairs, 38 flagged. The real ones were fixed. Smooth induction was replaced by continuous coinduction (`TopRep.coind₁`), and the GL₂(ℚ_p)-only Pontryagin-duality node by Mathlib’s `PontryaginDual`. Filtered-colimit continuity now cites `DiamondsAndVStacks:D0/filtered-colimits-and-cohomology-on-coherent-sites`. Noetherianity of A[[K]] is proved via Cohen’s structure theorem. The supercuspidal point of SZ.4 now uses Henniart types (R16.3), projectivity (R31.1) and Kisin’s local–global compatibility at p (R19.5). Two missing inputs became requests (S1, R08.6), and one became a new node (the Frobenius almost-module lemma).
  - Node claims against the source texts: 12 items, all addressed. Among them: hypotheses restored in the equivariant-site theorem, derived statements marked as derived (S⁰ ≅ π^{SLₙ}, S²(δ∘det), Ludwig (c)–(d)), Moore’s Borel-cochain versus continuous-cochain comparison made explicit, two locators corrected, and the ψ-isotypic form of Paškūnas’s Lemma 6.1 justified. One item led to source issue E3.

## Sources read (URLs and hashes in the packet)

CDN23 published (Forum Math. Pi 11 (2023) e16) and arXiv v2; Scholze, arXiv:1506.04022v1; Ludwig, arXiv:1611.03685v2; Fust, Münster J. Math. 15 (2022) published PDF, with arXiv v1 and v2; Paškūnas, arXiv:1804.07567v3; Dospinescu–Paškūnas–Schraen, arXiv:2201.12922v2; Gee–Kisin, arXiv:1208.3179v5; Strauch, arXiv:math/0611121v1; Moore, Numdam PMIHES_1968__35__5_0. Not read: Temkin (Math. Ann. 2000), de Jong–van der Put (Doc. Math. 1996), Snowden and Calegari (used through the PotentialModularity nodes), Gross–Hopkins (through Scholze and ET.6a).

## Suggested file scope

At the pins only continuous cohomology, topological and smooth discrete representations, SL₂/GL₂(ℚ_p) and ZMod p exist. The file therefore states:
- functors of finite image, with their API and tests;
- generic pairs;
- Moore’s vanishing;
- Fust’s finiteness, and admissibility of restrictions to SL₂.

The towers, Scholze’s sheaf and functor, Ludwig’s quotient, Π^geo and the remaining theorems are targets of the reader with no Lean declaration. Their API items appear in the packet and the reader only.
