# DESIGN-LieHighestWeightPartII

Complete target-level design for issue #3373, by Codex (GPT-6), session `codex-hbEHD0`, 18 October 2026. The bot confirmed this session’s claim in issue comment 6255680539. This submission is a finished planning pass, not a checkpoint or an implementation claim.

## Result and coverage

The roadmap extends `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight` with the independent Ciubotaru–Harris nilpotent-orbit and weight-pattern direction allowed by the brief. Its definition, packet, full reader and compact suggested file have the common basename `LieHighestWeightPartII`.

There are 28 nodes: 2 definitions, 7 constructions, 2 lemmas and 17 theorems; 39 API items, 32 discriminating definition/construction tests, 23 planets, and 17 individually checked pinned declarations. Every definition/construction has a use-derived API and at least three tests. All 11 routed Ciubotaru–Harris items have an explicit node mapping in `routeCoverage`.

| Layer | Targets | Coverage | Remaining planning work |
| --- | ---: | --- | --- |
| N0 — triples, nilpotent orbits, Jacobson–Morozov and Kostant | 7 | planned | none |
| N1 — restriction, increasing filtration, graded inversion, tensor/exactness | 4 | planned | none |
| N2 — classical partitions and Lie half-spin recognition | 3 | planned | none |
| N3 — necessary diagrams, exact profiles, finite separation, appendix interface | 6 | planned | none |
| N4 — fixed-factor semisimple recognition | 1 | planned | none |
| N5 — half-integrality, geometric patterns, algebraic characters and positive parts | 7 | planned | none |

The packet has zero recorded gaps and 19 supplier-stage requests. It is `complete`, with all six layers `planned` and empty remaining lists. No layer or packet is marked `closed`: the requested interfaces of existing roadmaps still require implementation. All nodes remain `implementationStatus: unchecked`; suggested signatures and numerical experiments are not formal proofs.

## Ownership and supplier interfaces

The packet’s `requests` and the reader’s supplier-contract section give the precise statements and consuming node ids. The 19 contracts are:

- LieHighestWeight Layers 0, 1, 2, 3, 4, 5, 6, 7 and 9: native sl2 theory and invariant forms; Cartan/root spaces; weights; Verma weight support; finite Lie highest-weight modules; complete reducibility; characters and minuscule weights; Chevalley/Serre realization; reductive centralizers.
- ReductiveGroups Layers 1, 2, 3, 4, 6 and 7: algebraic representations and locally finite coordinate comodules; Lie differentiation and adjoint action; centralizers/components and orbit tangent maps; genuine torus character lattices; central isogenies and simple factors; torus/Weyl/root-subgroup/Bruhat structure, including open-cell coordinates and dimensions.
- RootSystems Layers 4, 5 and 6: chambers and opposition; root-system classification; finite Bourbaki integral root models.
- SpinRepresentations Layer 5: the existing complex half-spin construction and its weight identification. No general-field extension of that group representation is requested: the arbitrary-field tests are Lie highest-weight modules supplied by LieHighestWeight.

A root-system isomorphism alone does not give the Lie-algebra isomorphism needed by N2. LieHighestWeight Layer 7’s Chevalley/Serre realization is an explicit additional input. Likewise, Lie highest-weight classification alone does not assert algebraic-group descent. N5 proves the narrower existence of algebraic characters with every allowed dominant leading weight, using regular semi-invariants in the group’s own character lattice. It then separates finite Weyl orbits by invariant Laurent polynomials.

The generic filtered-space category remains with its existing owner, PadicHodgeTheory:R06.2/filtered-vector-spaces. N1 uses native Mathlib FilteredObject and owns only the filtration supplied by a triple; the reader explains reindexing to the existing decreasing convention. No dependency on arithmetic filtered theory or new generic category is introduced.

## Current upstream and library audit

Read LieHighestWeight and ReductiveGroups documents in full and their relevant suggested declarations; checked RootSystems, SpinRepresentations, OrthogonalSpinGroups and the scope of ReductiveGroupsPartII. The read-only roadmap checkout was `0d144d044dacebca17b654695b6f1ad58f159b27`; live main was also inspected at `9a305e195e7870e5136053897997f7538a01121e`, with the relevant highest-weight document unchanged. No separate current nilpotent-orbit roadmap was found.

Pinned baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Actual declarations were read at those commits, including the nonzero condition in Mathlib’s sl2 triple. The reviewed library audit has no direct entry providing the new orbit targets; AF.1/AF.4 supply partial ordinary representation infrastructure.

The current Tau Ceti library at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` already has the four trace/orthogonality/first-bracket results in `TauCeti/Algebra/Lie/Killing/AdNilpotent.lean` named in `upstreamNotes`; this file is absent at the pin. N0 reuses these facts and plans completion to the full triple. Ordinary sl2, PBW, Verma, highest-weight, root-system and spin theories are imported rather than redeveloped.

## Mathematical checks and boundaries

The increasing filtration is W_i=Σ_(j≤i)M_j. Printed CH appendix entries mean graded dimensions d_i, and sl2 multiplicities are d_n−d_(n+2), n≥0. The reader corrects the cumulative/graded confusion, the ascending-coordinate type-D root convention, and the unsupported E8-to-Levi inference for E6/E7. The recognition quantifier is over finite Lie modules; a half-spin module need not descend to SO. The semisimple proof uses modules supported on individual simple factors and does not permit an outer permutation of those factors.

The exceptional proof uses a finite **necessary** candidate set, not an orbit classification. An independent exact-integer computation of root reflection closure, opposition, profiles and nonnegative sl2 multiplicities found candidate/profile counts 7/7, 28/28, 34/34, 274/274 and 245/245 for G2,F4,E6,E7,E8. Root counts are 12,48,72,126,240. Dropping opposition in E6 gives 212 candidates and only 123 profiles. A separate check against the identified public SLA diagrams, adding zero, gives orbit-data/profile counts 5/5,16/16,21/21,45/45,70/70. These numerical computations are evidence for the planned exact certificate theorem, not proofs in Lean. The reproducible algorithm, Cartan conventions, support bound and counts are in the reader; no scratch files are needed.

The 91 CH appendix rows are implementation targets of the profile/triple checker. This run did not mechanically verify all 91 printed rows or their root-vector witnesses. Their printed Bala–Carter names are opaque keys; the output certifies a representative’s characteristic and profile, without claiming the semantic Bala–Carter classification. N3 separation is independent of this table ingestion.

## Sources and corrections

The packet and reader contain exact versions, URLs, hashes, dates, locators and statements in the author’s own words. Read CH arXiv:2311.15300v1, §§2.1–2.2 pp.6–7, §6.12 p.24, §10.1 p.32 and appendix pp.35–37; Bălibanu §5 pp.13–17; Sommers §§2.1–2.4 pp.11–13 and §3.1 pp.15–16; de Graaf arXiv:math/0702193v2 §§2–3 pp.2–5; the identified public SLA exceptional data; Milne’s 2018 v2.00 Reductive Groups notes at the locators recorded in the packet; and Jantzen’s second edition, Part II §§2.1–2.7 pp.175–179, in the maintainer-cleared copy, read in place. No private book file or passage is reproduced.

Six source issues are recorded in paraphrase: the three CH corrections already independently confirmed in PAPER-CIUBOTARU-HARRIS-26; Bălibanu’s strict-triangular wording for the neutral element; Milne RG §20.30’s missing characteristic-zero hypothesis for simple characters; and §17.59’s erroneous PGL Picard-group assertion. Author errata and available versions were checked as recorded. No claim of new discovery is made.

The later Annals 204 (2026), 545–601 revision was identified through article metadata but not obtained or collated. CH corrections are explicitly scoped to v1. Collingwood–McGovern was not cleared or read and is not cited as a verified source. The plan’s arguments do not require it. No missing source blocks a target-level proof plan.

## Independent successor briefs

The issue allows this pass to complete its first independent direction. The packet’s `restructure` preserves the other directions with complete briefs and all routed item ids, rather than silently discarding them:

1. Treat `LieHighestWeightPartIINilpotentOrbits` as an alias of the claimed roadmap id, not a duplicate package. Its 11 CH items are mapped here.
2. `PadicEnvelopingAlgebras`: 42 items, comprising all 39 Fu items and BCGP 2.2.29, 2.2.34-flat, 2.2.35. Own integral central reductions, multiplicity estimates and weighted PBW completions, exact kernels/norms/radius maps and the split reductive Arens–Michael extension. Preserve odd-prime/very-good-prime hypotheses where required; do not extend Fu’s dyadic uniform-group assertions or assert all-real Noetherianity. Ordinary highest-weight/PBW is imported. NoncommutativeAnalyticDistributions consumes this owner, not conversely.
3. `LieHighestWeightPartIICompletedCategoryO`: all 136 routed BCGP items. Own ordinary/parabolic category O, Lie homology, the completed/solid Schubert and twisted-Verma constructions, the actual representation categories, horizontal center and the HCS/derived localization comparisons. Import the completion owner above and analytic distribution/solid duality suppliers. Preserve the λ+1 shift, the weak exponential non-Liouville condition and singular-character cases. The false BCGP Lemma 2.7.5 and constrained-fibre membership in the singular Klingen argument remain explicit obligations of that successor, not results asserted by this roadmap.

The packet contains the full successor briefs and item inventories; those are the durable starting points for their design issues. This worker did not claim or open any second job.

## Validation and next step

- `python3 scripts/check_blueprint.py research/blueprint/packets/LieHighestWeightPartII.json`: zero errors, zero warnings; all six layers planned.
- `python3 research/blueprint/intake.py check-files` on the five deliverables: zero problems.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/LieHighestWeightPartII.lean`: passed.
- Packet/reader target-id, API/test, stage, route-inventory and supplier-consumer consistency checks: passed; the node graph is acyclic.
- The unchanged 144-line suggested file elaborated successfully using `lean-check` at the pinned libraries, after checking available memory. Its only diagnostics were 12 permitted placeholder-proof warnings. No language server or library build was started.

Next is independent review of this completed plan. The reviewer should scrutinize the algebraic extension/triple arguments, the precise existing-roadmap contracts, the candidate-set injectivity theorem and its proposed proof-assistant certificate, and the Lie-versus-group/isogeny distinctions. Packaging follows acceptance and the programme’s upstream dependency order. There is no unfinished planning pass to resume.
