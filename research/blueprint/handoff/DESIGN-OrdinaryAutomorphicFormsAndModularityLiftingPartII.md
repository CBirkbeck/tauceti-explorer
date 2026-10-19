# Handoff: DESIGN-OrdinaryAutomorphicFormsAndModularityLiftingPartII

Issue #3474. Worker: Claude (session claude-FONCjU). Date: 2026-10-19.

## What is done

A complete target-level design of *Ordinary automorphic forms and ordinary modularity lifting, Part II: dyadic unitary and symplectic ordinary lifting* (BCGP25 §§5–6), parent `OrdinaryAutomorphicFormsAndModularityLifting`, area `langlands`.

- Roadmap definition `research/blueprint/roadmaps/OrdinaryAutomorphicFormsAndModularityLiftingPartII.json`: six layers OL.0–OL.5.
- Packet `research/blueprint/packets/OrdinaryAutomorphicFormsAndModularityLiftingPartII.json`: 29 nodes (8 definitions, 3 constructions, 18 theorems), 71 API items, 45 unit tests, 16 planets, 3 requests, 1 gap, 11 source issues, 2 restructure entries, status `complete`, every stage `planned`.
- Reader document `research/blueprint/readmes/OrdinaryAutomorphicFormsAndModularityLiftingPartII.md` (about 20,000 words), generated from the packet, so the two agree.
- Suggested file `research/blueprint/suggested/OrdinaryAutomorphicFormsAndModularityLiftingPartII.lean` (167 lines).

Endpoints: OL.3/dyadic-ordinary-finiteness and OL.3/dyadic-ordinary-r-equals-t (BCGP Theorem 5.7.14); OL.5/symplectic-ordinary-finiteness and OL.5/symplectic-ordinary-r-equals-t (Theorem 6.3.4).

## Checks run

- `TAUCETI_BASELINE=<pinned index> python3 scripts/check_blueprint.py research/blueprint/packets/OrdinaryAutomorphicFormsAndModularityLiftingPartII.json`: 0 errors, 0 warnings.
- `lean-check` on the suggested file at the pinned build (Mathlib 082e2d3, Tau Ceti f790474): it elaborates; the only warnings are the three `declaration uses 'sorry'` warnings (Lemma 5.3.1 equivalence and its two companion facts). `scripts/check_sorry_data.py`: passed. Real proofs: `trace_one_eq_zero_of_even`, `weightTwist_one`, `weightTwist_mul`, `IsSufficientlyDeep.mono`, `isSufficientlyDeep_bot`, the two dimension identities.
- Dry atlas assembly (patched `build.load_promoted`): 5703 → 5725 stages (6 layers and 16 planets), 15110 → 15172 stage edges, no skipped (cyclic) links.
- Latent-cycle audit on the all-packets stage graph (including the open GSp4NonregularModularityLifting design, PR #10624): the proposed consumer edges GSp4NonregularModularityLifting NR11 → OL.3/OL.5 and AbelianSurfacesModularity AM.1/AM.3/AM.7 → OL.3/OL.4/OL.5 create no cycle; no OL layer reaches itself.

## Item accounting (route 29 of PAPER-BOXER-CALEGARI-GEE-PILLONI-25)

- 5.7-Hecke → OL.1/dyadic-ordinary-hecke-algebra; 5.7.4-control → OL.1/dyadic-hida-theory.
- 5.7.13 → OL.2/sufficiently-deep-level (with Lemma 5.7.12 as OL.2/uniform-fixed-vectors).
- 5.7.14-finite → OL.3/dyadic-ordinary-finiteness; 5.7.14-RT → OL.3/dyadic-ordinary-r-equals-t; 5.7.14-support → OL.3/ihara-avoidance-support (with OL.3/patched-component-structure); 5.7.14-remove-level → OL.3/sacrificial-prime-removal.
- 6.3-selected-problem → OL.4/selected-ordinary-problem (with OL.4/ordinary-seed-datum); 6.3.4-finiteness → OL.5/symplectic-ordinary-finiteness; 6.3.4-RT → OL.5/symplectic-ordinary-r-equals-t; 6.3-component-dominance → OL.5/component-dominance.
- Brief tests: the surviving dyadic Selmer class (OL.0/unavoidable-dual-selmer-class and the `TwoTypePatching.not_all_killed` test); the four dyadic weight components (`DyadicOrdinaryHeckeAlgebra.weightAlgebra_components`; the GSp₄ analogue is owned by LocalGaloisDeformationRings L7/gsp4-ordinary-flag-incidence); arbitrary versus chosen automorphic component (`SelectedProblem.other_component`, `SelectedProblem.needs_uniqueness`); rank-one torus factor (`weightTwist_one`); unnormalised U (`DyadicOrdinaryHeckeAlgebra.unnormalized_U`); depth tests (`IsSufficientlyDeep.*`).

## Moves (items planned here that the extraction had routed elsewhere)

The source routes of the BCGP25 extraction sent several §5–6 items to GlobalGaloisDeformations, AutomorphicFormsOnReductiveGroups, IntegralHeckeAndGaloisDeterminants and ArithmeticGaloisRepresentations; their accepted packets did not take them. Planned here (first `restructure` entry): the Λ-coefficient Ĝ_n-conjugacy problems, µ_v and the dyadic dual Selmer group, Lemmas 5.3.1 and 5.5.3 (OL.0); the p = 2 unitary Hecke theory (OL.1); Lemma 5.7.7, Definition 5.7.11, Proposition 5.7.9, Lemma 5.7.12 (OL.2); GSp₄ problems over Λ with the framing ring, **GSp₄-reasonable** (Whitmore Definition 3.19, which nothing else planned) and Whitmore's Taylor–Wiles places (OL.4).

Imported, not planned again: near adequacy and Proposition 5.5.6 = PotentialAutomorphyInfrastructurePartII PL.4/relaxed-adequacy + PL.3/taylor-wiles-primes-two-adic; Def 5.2.1 = PL.4/strongly-residually-odd; Lemma 5.6.2/5.6.3, Prop 5.6.4 = LocalGaloisDeformationRings R08.2/ihara-avoidance-rings-p2; Prop 5.6.6 = L7/trivial-residual-flag-ring; §6.2 = L7/gsp4-ordinary-flag-incidence, L7/gsp4-ordinary-regularity, L7/gsp4-ordinary-weight-two-components (which contains Lemma 6.2.6); Lemma 6.1.6 ≈ R08.2/gsp4-taylor-wiles-lifts; §6.4 = AbelianSurfacesModularity AM.1; Prop 7.5.3 = EndoscopicTransferAndUnitaryTraceComparison ET.7a/gsp4-solvable-descent-interface.

## For the consumers (second `restructure` entry)

- GSp4NonregularModularityLifting (open PR #10624) records the gap "Regular ordinary support and solvable descent" with intended supplier this roadmap: point NR11 at OL.3/dyadic-ordinary-finiteness, OL.3/dyadic-ordinary-r-equals-t, OL.5/symplectic-ordinary-finiteness, OL.5/symplectic-ordinary-r-equals-t, and its "GSp₄-reasonable" request at OL.4/gsp4-reasonable; solvable descent (Prop 7.5.3) is ET.7a/gsp4-solvable-descent-interface.
- AbelianSurfacesModularity AM.1/allowed-images and AM.7/three-adic-transfer cite "White, Definition 3.19" without a node: import OL.4/gsp4-reasonable. Its request to AbelianSurfacesPotentialModularity AP.5 for the Proposition 7.5.10 inputs should name OL.3 and OL.5 for the regular-weight R = T theorems.

## What remains

- Requests (precise statements in the packet): LocalGaloisDeformationRings L7 (dimension of every component of R^△_v for arbitrary residual representation, used for Lemma 5.7.7 at the original field); LocalGaloisDeformationRings R08.2 (Whitmore's Taylor–Wiles local problem with semisimple Frobenius for GSp₄); SmoothRepresentationsOfLocalGroups SR.3 (local Langlands and Bernstein inertial classes; uniform fixed vectors in finitely many Bernstein components).
- GAP-1: Geraghty's Hecke-side lemmas at l = 2 are taken from BCGP's assertion; Geraghty was not read for this plan.
- Lemma-level refinement of the patching constructions when the roadmap reaches lemma level.

## Source issues found

Eleven, all against BCGP25 arXiv v1 (packet `sourceIssues`). New relative to the extraction: E8 (µ for χ in Proposition 5.5.6 (i)), E9 (H′ for H in the proof of 5.7.14), E10 (gap: the preparation step must also make every lift at T ∖ S_2 unipotently ramified, via Lemma 5.6.2, for the map R′_{L/F,T′} → R^{T,ord} of the last step), E11 (α_p, β_p for α_v, β_v in §6.3). E1–E7 repeat confirmed findings of the extraction (E022–E026, E063, E065) at the nodes they affect.

## Sources read

- BCGP25, arXiv:2502.20645v1, sha256 51d7eacc…5e95c: §5 and §6 completely, §7.5, bibliography.
- Whitmore, arXiv:2205.05062v3, sha256 6a4eae2b…f38123: Definitions 3.15–3.19, Proposition 3.18, Lemma 3.20, §7.3 (Theorems 7.7–7.8, Lemma 7.10, Proposition 7.11, Theorem 7.12). Version 4 renames "Ĝ-reasonable"; cite v3 for BCGP's terminology.
- BCGNT25 (Forum Math. Pi 2025, author copy), sha256 ea12cd0d…cdb2: Lemma 3.2.4.
- Not read: Thorne 2017, Geraghty 2019, BLGGT 2014, Labesse 2011, Shotton 2018, Balaji 2012 (their content enters through BCGP's statements and the supplier packets that plan them).
