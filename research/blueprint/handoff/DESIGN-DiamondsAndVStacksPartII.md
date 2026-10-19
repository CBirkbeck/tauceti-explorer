# Handoff: DESIGN-DiamondsAndVStacksPartII

Job: design and blueprint of the new roadmap *Pro-étale descent, diamonds and small v-stacks, Part II: integral
recovery and kimberlite specialization* (issue #3425). Worker: Claude (session claude-Z3Z8gU), 2026-10-19.

## Deliverables

- `research/blueprint/roadmaps/DiamondsAndVStacksPartII.json`: area `padic`, parent `DiamondsAndVStacks`,
  five layers D7–D11 (continuing the parent's D0–D6 numbering).
- `research/blueprint/packets/DiamondsAndVStacksPartII.json`: status `complete`, 73 nodes (19 definitions,
  11 constructions, 32 theorems, 10 lemmas, 1 application), 174 API items, 128 unit tests, 24 planets
  (5/3/5/5/6 per layer), 21 baseline declarations read at the pins, 2 requests, 1 gap, 4 source issues,
  3 restructure proposals, 1 upstream note, and a `routeCoverage` table for the 21 routed paper items.
  `scripts/check_blueprint.py` (with the pinned index): 0 errors, 0 warnings.
- `research/blueprint/readmes/DiamondsAndVStacksPartII.md`: reader document (about 28,000 words), rendered from the
  packet with hand-written introduction, boundaries, conventions and layer introductions.
- `research/blueprint/suggested/DiamondsAndVStacksPartII.lean`: 368 lines. **Compiled** with `lean-check` at Mathlib
  082e2d3 / Tau Ceti f790474: no errors, 23 warnings, all `declaration uses sorry`. `scripts/check_sorry_data.py`
  passes. The pins have no perfectoid spaces or v-sheaves, so the file types only what they can state: the
  minimal-point lemma (SW20 18.3.2), formal adicness / formally closed / formally separated for an abstract adjunction
  `diamond ⊣ red` (namespace `VSheaf`), the pointwise specialization ideal of a valuation (Gleason 4.1), constructible
  density, and the topological core of Gleason's Lemma 4.55. Every other packet name is listed, by layer and carrier,
  in the closing comment "Statements not typed at the pins".

## Coverage

All five stages are `planned` (none `closed`, because of the requests and the gap below).

- D7 (universal homeomorphisms, perfect schemes, olivine spectrum): SW20 10.2.1–10.2.2 under the residue-field
  hypothesis (proved for finite maps), X^⋄ of F_p-schemes, SW20 18.3.1–18.3.2, Gleason's olivine spectrum
  (Definitions 2.1–2.4, Theorem 1, Propositions 2.13–2.36), v-covers of perfect schemes (3.5–3.7), Gleason 2.32.
- D8 (reduction functor): scheme-theoretic v-sheaves, their spaces, ⋄ on them, reduction, reducedness, reduction of
  Huber pairs, empty reduction of qs diamonds, formal adicness (3.20–3.32).
- D9 (specialization): Tate specialization, formalizations, unique formalization, specializing v-sheaves, sp_F,
  prekimberlites, formal schemes as prekimberlites, formal neighbourhoods (4.18–4.22), Heuer's X^{⋄/◦} and SP_F,
  étale formal neighbourhoods and Theorem 4.27.
- D10 (integral recovery): two diamond functors on O_E-schemes, lfft generic fibres, normality of generic fibres,
  de Jong 7.4.1, classical specialization, the maximal diamond open, density of the generic fibre, closed-immersion
  criterion, v-closures (AGLR §2.1), Lourenço's triple theorem (SW20 18.4.2), **SW20 18.4.1**, its proper-scheme form,
  the awn variant (AGLR 2.13–2.18), the flat-closure statement used by KPZ, and the uniqueness application.
- D11 (kimberlites): valuative prekimberlites, smelted kimberlites, kimberlites, formal schemes as kimberlites,
  tubes, spectrality/closedness of sp, permanence, cJ-diamonds, tube density, enough facets, richness, topological
  normality (separate predicates), Lemmas 4.53 and 4.55, normal formal schemes, π-adic and flat π-adic kimberlites,
  AGLR Theorem 2.37, Lemma 2.38, Proposition 2.39.

## What remains

1. **Gap** "Completed residue fields of a general universal homeomorphism" (D7): SW20 §10.2 asserts without proof
   that a universal homeomorphism of analytic adic spaces in characteristic 0 induces isomorphisms of completed residue
   fields. The packet proves it for finite maps locally of finite type and states 10.2.1 under the residue-field
   hypothesis. Recorded also as source issue E1.
2. **Requests** (discharge at the supplier):
   - `SchemeAndStackFoundations:SF.0` — merged TauCetiRoadmap README §0.24 (perfection), §0.21 (completion preserves
     normality, excellence), §0.23 (universal homeomorphisms), §0.26 (absolute weak normalization), §0.23a (étale
     invariance under perfection and thickenings).
   - `AdicSpacesPartII:R0` — finite morphisms of adic spaces locally of finite type and the stalk description of O⁺.
3. The application node D10/uniqueness-of-integral-models takes SW20 Corollary 21.6.10
   (M^v_{GL(Λ),μ_d} = Gr(d, Λ)^♢) as a hypothesis; it defines M^v_{𝒢,μ} as the v-closure (D10/v-closure) in
   GeometricSatakeAndFusion GS0's integral Grassmannian. No roadmap plans v-sheaf local models yet; their owner should be
   the GeometricSatakeAndFusion Part II design (#3354).
4. Lemma-level refinements listed in each coverage record (cutoff-cardinal bookkeeping of Gleason 3.9–3.11; the
   minimal-integral-subring step of 4.53; the image argument of AGLR 2.37).

## Ownership decisions (for the reviewer and downstream designs)

- **Not planned again (owned by the parent):** SW20 Lemma 18.1.1 / 18.1.2 (DiamondsAndVStacks D6.6–D6.7), Example
  18.2.1 / Proposition 18.2.2 (D6.8), Proposition 10.2.3 and rigid seminormalization (D6.9), and GLX Lemma 3.2's repair
  (D5.16). These Scholze–Weinstein route items (131, 132, 69) are cited, see `routeCoverage` and the first restructure
  entry. Upstream PR #820 (head 0cf6a42) was read to confirm D6's exact scope.
- **Imported, not planned:** scheme v-covers and perfect v-descent (ArcTopologyAndDescent AT.1, AT.7); formal schemes,
  Huber's t, Conrad's FS_C and Berthelot generic fibres, the classical specialization map, Grothendieck existence
  (AdicSpacesPartII F0/R1/R2, which upstream are AdicSpacesPartIII F0/R2); partially proper and proper maps of v-stacks
  (DiamondEtaleCohomology C4).
- **Owned here and to be imported downstream:** the whole kimberlite theory (D8–D11). The pending designs
  DESIGN-GeometricSatakeAndFusionPartII (#3354, Gleason–Lourenço connected tubes of local models) and
  DESIGN-HeckeStacksAndLocalShtukasPartII (#3408, rich smelted kimberlite structure of integral shtuka moduli and the
  component bijection) should import D8–D11 and AGLR Theorem 2.37 from here (second restructure entry).
- de Jong 7.4.1 and the lfft generic-fibre comparison are owned here (upstream AdicSpacesPartIII R2.9 states the
  comparison only for locally topologically finite type; see the upstream note).
- The KPZ gap E34 (paper extraction) is closed here by D10/flat-closure-diamond and D10/closed-immersion-criterion
  (source issue E3).

## Source issues recorded

E1 SW20 §10.2 (gap, residue fields), E2 SW20 Remark 21.4.2 (error: "flat with reduced special fibre ⇒ normal" needs a
normal generic fibre; counterexample Spec O_E[x, y]/(y² − x³)), E3 KPZ Lemma 3.4.1 (gap, = PAPER-KISIN-PAPPAS-ZHOU-26/E34),
E4 Gleason Proposition 4.45 (misprint: S ⊂ |F^red|, not |F|).

## Sources read (free copies; URLs and SHA-256 in the packet)

Scholze–Weinstein, Berkeley lectures (authors' copy 27 March 2020; Lectures 10, 18, §21.4); Gleason, Specialization
maps (arXiv:2012.05483v4; §§1–4 in full, §2 statements and the cited proofs); Anschütz–Gleason–Lourenço–Richarz
(arXiv:2201.01234v2, §2); Lourenço, Hebbarkeitssätze (arXiv:1711.06903v1, §§1, 3–4 statements, §6); de Jong, IHÉS 82
(Numdam, §7); Scholze–Weinstein, Moduli of p-divisible groups (arXiv:1211.6357v2, §2.2); Kisin–Pappas–Zhou
(arXiv:2409.03689v3, §§3.1, 3.4); Gleason–Lim–Xu (arXiv:2208.07195v3, §3). No restricted book was needed. Not
consulted: the published Annals of Mathematics Studies edition of the Berkeley lectures and the published version of
Gleason's paper (page numbers are those of the copies read).

## Checks run

`python3 scripts/check_blueprint.py research/blueprint/packets/DiamondsAndVStacksPartII.json` (TAUCETI_BASELINE set):
0 errors, 0 warnings. `lean-check research/blueprint/suggested/DiamondsAndVStacksPartII.lean`: elaborates, only
`sorry` warnings. `python3 scripts/check_sorry_data.py` on the Lean file: passes. A Sonnet cross-check of all 136
cross-roadmap prerequisites against supplier statements flagged one mismatch (a stage-level GS0 citation, replaced
by the exact GS0 nodes) and nine unused citations, which were removed or justified.
