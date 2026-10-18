# DESIGN-BCGP18 — Abelian surfaces over totally real fields are potentially modular

Agent: Claude (Opus 5.5), session `claude-miNWKw`. Issue #905. Branch `claude-miNWKw-design-bcgp18`.
This is a complete target-level design pass, ready for independent review; it claims no closure and no implementation.

## Deliverables

- `research/blueprint/roadmaps/AbelianSurfacesPotentialModularity.json`: the roadmap definition, area `langlands`, no parent, eight stages AP.0–AP.7 with `requires` generated from the packet's direct dependencies.
- `research/blueprint/packets/AbelianSurfacesPotentialModularity.json`: 57 nodes (14 definitions, 4 constructions, 38 theorems, 1 application), 127 API items, 71 unit tests, 31 planets, 17 baseline declarations read at the pins, 89 supplier requests, 5 gaps, 3 restructuring proposals; `scripts/check_blueprint.py` with the pinned index reports 0 errors and 0 warnings. All eight stages are `planned`; none is closed. Every `implementationStatus` is `unchecked`.
- `research/blueprint/readmes/AbelianSurfacesPotentialModularity.md`: the reader document (introduction, conventions, sources, corrections table, baseline, supplier contracts, one section per node with statement, hypotheses, proof route, uses, API, unit tests, acceptance, prerequisites and locator; gaps; restructuring). It is generated from the packet together with handwritten framing, so the two agree; packet-derived text is escaped for the atlas Markdown renderer.
- `research/blueprint/suggested/AbelianSurfacesPotentialModularity.lean`: compact companion in the 2026-10-12 shape (light real-bodied definitions over carriers at the pins: the similitude submonoid of the standard alternating form, Iwahori indices, classical-weight integers, Iwahori multiplicities, patching dimension count, ordinarity criterion, Hasse–Weil centre, group orders). **Compiled** with `lean-check` at Mathlib 082e2d3 / Tau Ceti f790474: `sorry` warnings only; `scripts/check_sorry_data.py` clean.

## Brief followed

The issue's brief (DESIGN-BCGP18, 'cover the paper completely') merged with the accepted route 3 of the reviewed extraction `PAPER-BOXER-CALEGARI-GEE-PILLONI-21` (60 items, with its ownership map and corrections). By that route, this roadmap owns §§7.7–10 and the final theorems; Hilbert–Siegel varieties, higher Hida/Coleman theory, integral coherent Hecke complexes, GSp_4 local Langlands and open-image theorems belong to other roadmaps. Also planned here, as the brief assigns: BCGP25 Theorem 1.8.17 (Galois representations of ordinary parallel weight 2 forms, AP.0/weight-two-galois), BCGP25 Lemmas 9.3.6–9.3.7 with the seed curves (AP.7/local-three-seeds), the twisted Siegel moduli (AP.6/twisted-siegel-moduli), the fixed-determinant variant of Proposition 9.1.12 (AP.6/fixed-determinant-extensions), P(ρ̄) and S_6 ≅ Sp_4(F_2) (AP.7/odd-theta-cover), Lemma 10.3.1 and the paramodular conjecture.

### Item map (route 3, 60 items)

| Item | Statement | Node(s) |
| --- | --- | --- |
| 2 | Theorem 1.1.2 | AP.6/hasse-weil-genus-two |
| 3 | Theorem 1.1.3 | AP.6/potential-automorphy |
| 4 | Theorem 1.1.4 | AP.6/genus-one-quadratic |
| 5 | Theorem 1.1.5 | AP.7/infinitely-many-modular |
| 6 | Theorem 1.1.7 | AP.7/ordinary-surface-modularity |
| 7 | the three residually modular cases | AP.7/residual-modularity-cases |
| 8 | §1.2 defect (exposition) | reader introduction; AP.3/patching-datum |
| 10 | §1.2 local–global compatibility of Hida complexes | AP.2/hida-hecke-galois |
| 29 | Theorem 2.7.3 | AP.6/gl2-quadratic-galois |
| 101 | Hypotheses 7.7.1, 7.8.1, v_0 | AP.1/standing-hypotheses |
| 103 | Definition 7.8.8 | AP.1/weights |
| 104 | Proposition 7.8.11 | AP.1/finite-free-balanced |
| 105 | Proposition 7.9.1 | AP.2/doubling-surjections |
| 106 | Theorem 7.9.4 | AP.2/hida-hecke-galois |
| 107 | Proposition 7.9.8 | AP.2/taylor-wiles-descent |
| 108 | Proposition 7.11.2 | AP.3/patched-mcm |
| 110 | Hypothesis 7.13.1, Definition 7.13.4 | AP.4/lifting-hypotheses |
| 111 | Proposition 7.13.5 | AP.4/iwahori-multiplicities |
| 112 | Theorem 7.13.6 | AP.4/multiplicity-theorem |
| 113 | Theorem 8.2.1, Corollary 8.2.2 | AP.5/gluing-theorem, AP.5/automorphy-of-rho |
| 114 | Lemmas 8.2.3, 8.2.5 | AP.5/analytic-continuation-descent |
| 115 | Lemmas 8.2.7–8.2.11 | AP.5/connected-components |
| 117 | Lemma 8.3.2 | AP.5/solvable-descent |
| 118 | Theorem 8.4.1 | AP.5/main-lifting-theorem |
| 119 | Definition 8.5.1, Theorem 8.5.2 | AP.5/twisted-ordinary, AP.5/twisted-lifting-theorem |
| 120 | Definition 9.1.1 | AP.0/automorphic-compatible-system |
| 121 | Definition 9.1.8 | AP.0/modular-gsp4-representation |
| 124 | §9.2 Galois types, challenging | AP.6/galois-types |
| 125 | Lemma 9.2.2 | AP.6/big-image |
| 126 | Definition 9.2.3 | AP.6/good-primes |
| 127 | Lemma 9.2.7 | AP.6/pq-switch, AP.6/fixed-determinant-extensions |
| 128 | Theorem 9.2.8 | AP.6/potential-modularity |
| 129 | Theorem 9.3.1 | AP.6/potential-automorphy |
| 130 | Theorem 9.3.4 | AP.6/genus-one-quadratic |
| 131 | Proposition 9.4.1, Definition 9.4.2 | AP.6/kummer-surfaces (Definition 9.4.2 as exposition in the reader) |
| 132 | Proposition 10.1.1 | AP.7/ordinary-surface-modularity |
| 133 | Proposition 10.1.3 | AP.7/residual-modularity-cases |
| 134 | Theorem 10.2.1 | AP.7/fixed-three-torsion |
| 135 | Definition 10.2.2, Proposition 10.2.3, Lemma 10.2.4 | AP.7/odd-theta-cover |
| 136 | Theorem 10.2.6 | AP.7/infinitely-many-modular |
| 137 | Lemma 10.3.1, Conjecture 10.4.3 | AP.7/paramodular-lemma, AP.7/paramodular-conjecture |
| 138 | Lemma 10.3.2 | AP.7/motives-conditional |
| 139 | Expected Lemma 10.4.4, Lemma 10.4.6 | AP.7/fake-surface-examples |
| 140 | §1.4.2 higher genus (exposition) | reader introduction |
| 173 | Definition 9.1.6 | AP.0/automorphic-abelian-variety |
| 175 | Proposition 9.2.1 | AP.6/non-challenging-automorphy |
| 176 | Lemmas 9.2.5–9.2.6 | AP.6/good-prime-density |
| 177 | Corollary 9.3.3 | AP.6/hasse-weil-genus-two |
| 178 | Theorem 10.1.4 | AP.7/mod-five-quadratic |
| 190 | twisted moduli | AP.6/twisted-siegel-moduli |
| 315 | Lemmas 7.5.25–7.5.27 | AP.7/dihedral-crossing |
| 317 | §7.7 deformation problems | AP.1/deformation-problems |
| 318 | Definition 7.8.2 | AP.1/tame-levels |
| 320 | §7.8 Hecke algebras and modules | AP.1/hecke-modules |
| 322 | Corollary 7.9.6 | AP.2/ordinary-weight-two-corollary |
| 324 | §7.11 patching | AP.3/patching-datum |
| 327 | §7.13 primes and eigenspaces | AP.4/eigenspaces |
| 329 | Proposition 7.13.9 | AP.4/doubling-injection |
| 330 | Proposition 7.13.11 | AP.4/regular-weight-dimensions |
| 331 | Definition 2.8.2, Remark 2.8.3 | AP.0/abelian-surface-system |

## Findings for the maintainer

1. **HigherHidaAndColemanTheory does not cover BCGP §§4–6.** The extraction routes 85 items (Theorem 4.6.1, Lemma 4.5.17, the doubling Theorem 5.8.6, Theorems 6.5.8, 6.6.4, 6.6.5, Lemma 6.5.18, the weight space Λ_I, the p-rank strata) to HigherHidaAndColemanTheory, but its design (#10100) plans Boxer–Pilloni for GSp_{2g}/Q and Pilloni's Klingen complex over Q only. This packet files them as Part II contracts at its stages I3, X8, C4, B7 and proposes (restructure) either a revision of that roadmap absorbing route 2 or a Part II of it. The B7 contract is stated after localization at a non-Eisenstein ideal (extraction E162).
2. **Four supplier Part IIs are undesigned** (HilbertSiegelModularVarieties, GSp4LocalLanglandsAndGaloisRepresentations, IntegralCoherentHeckeComplexes, OpenImageTheoremsForAbelianVarieties). Their parent design jobs are pending (#3433, #3345, #3423, #3406). The packet's requests sit at the parent stages HilbertModularVarietiesAndShimuraCurves:H4, ModularityAndLanglandsExtensions:ML.4/ML.5, AutomorphicBundles:B5, FaltingsFinitenessAndIsogenyTheorems:R28.4, each prefixed "Part II"; re-point them when those stages exist.
3. **Upstream overlap avoided.** Current TauCetiRoadmap main (0d144d0) has the GSp_4 spin polynomial (SmoothRepresentationsOfLocalGroups SR.4.5, `SpinPolynomial.reciprocal`), the positive Klingen Hecke algebra (SR.1.4) and reductive pseudocharacters, operator localization and spin conventions (IntegralHeckeAndGaloisDeterminants IHG.0, IHG.2, IHG.3). These are cited, not restated; BCGP's T_{v,1}, T_{v,2} are SR.4.5's T₂, T₁. The GSp_4 pseudocharacter interpolation over affinoids for Theorem 1.8.17 is an extension of IHG.0/IHG.4's stated scope and is requested as such.
4. **Duplicate design job.** #3472 (DESIGN-AbelianSurfacesPotentialModularity) writes the same four files; per the extraction's fix report it should be superseded by this job.
5. **Consumers to re-point.** GSp4NonregularModularityLifting and AbelianSurfacesModularity (designs pending) should import from here the items listed in the restructure entry; the 2025 extraction's routes for P(ρ̄), the twisted moduli and Lemmas 9.3.6–9.3.7 are to be re-pointed here.
6. **Gaps.** Deuring's existence theorem for ordinary elliptic curves over F_q with prescribed trace (needed by the corrected Lemma 9.2.7; proposed owner EllipticCurves, Part II, design #3398); cohomology of Kummer surfaces (Proposition 9.4.1; no K3 owner yet); Arthur's classification for GSp_4 remains conditional (carried, not planned).

## Sources read

- BCGP18, arXiv:1812.09269v3 (sha256 7c8d74b0…, matching the extraction), read 2026-10-18: §§7.7–7.9, the §7.13 statements, §8 (pp. 235–250), §9.2–9.3 key proofs and §10.2 in full; all node locators checked automatically against the PDF text (every cited statement number found on its cited pages; the one flag, 'before Theorem 10.2.1, p. 268', is correct as written).
- BCGP25, arXiv:2502.20645v1 (sha256 51d7eacc…), read 2026-10-18: Theorem 1.8.17 and its proof (pp. 13–14), the location of Lemmas 9.3.4–9.3.7 and Remark 9.4.4.
- No source issues beyond the extraction's were found; `sourceIssues` is empty and the reader's corrections table cites the extraction's E-numbers.

## What a follow-up does

All eight stages are planned. The review should check the statements against the paper and the supplier contracts against their owners. After acceptance, the open work is the supplier side: the Part II designs above, the HigherHida revision, and the two gaps. No per-stage follow-up of this roadmap is needed at target level.
