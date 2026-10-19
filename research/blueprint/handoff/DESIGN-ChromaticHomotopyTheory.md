# DESIGN-ChromaticHomotopyTheory — completed target pass

Issue #3478. Worker: Codex, session `codex-8RnBW3`. The claim was confirmed by the bot on 18 October 2026. This submission completes the design pass and is ready for independent review; it is not a checkpoint. No mathematical implementation is claimed.

The new roadmap has fourteen ordered layers, CH.0–CH.13. Every layer is **planned**, none is **closed**, and the packet status is **complete**. There are 63 target/key-input nodes: eight definitions, eighteen constructions, twenty-five theorems, ten comparisons and two applications. The definitions/constructions carry 107 API items and 78 discriminating tests. There are 48 planets, at most six in a layer, and eight baseline declarations. All 34 LMMT items routed to this roadmap have explicit node mappings.

The [reader](../readmes/ChromaticHomotopyTheory.md) contains the full statements, hypotheses, proof outlines, source locators, API, tests, ownership contracts, worked boundary checks and reading record. The [packet](../packets/ChromaticHomotopyTheory.json) contains the same target data, direct dependency graph and propagated remaining obligations. Its coverage records are the starting point for follow-up work.

## Decisions an independent reviewer should check

- Keep `K(0)=HQ` and `T(0)=S[1/p]` distinct on all spectra. The two finite-localization towers agree only on p-local inputs. Height-zero statements and non-p-local examples are explicit.
- Import spectra and Postnikov towers from StableHomotopyKTheory, generic norm/Tate from RefinedTraceMethods RT.2, complex K-theory from RT.4, and algebraic formal modules, height and marked deformations from LubinTateFormalModulesAndQuasiCanonicalLifts. These are not reconstructed here. The small Lean adapter uses existing formal-group points rather than redeclaring algebraic height.
- Morava E-theory realization is CH.7, before the CH.8 smashing theorem which consumes it. Both the node and stage graphs are acyclic.
- The current TauCetiRoadmap and current Tau Ceti sources were read, including roadmaps newer than the atlas snapshot. ModularCurves 4B/4C/7E supply the smooth groupoid, level-three torsor and formal-height inputs. Its scope explicitly excludes the generalized-elliptic boundary and stack needed for compactified Otop. Its coarse compactification is not that carrier.
- Propose **Modular curves, Part II: generalized elliptic moduli and boundary geometry** (G16a) and **Enhanced derived sheaves, Part II: spectral ringed sites** (G16b). The latter supplies sheaves of E∞ rings and quasicoherent spectral modules beyond EDS's ordinary derived sheaves and abstract module categories. Both proposals are recorded in `restructure`; no supplier files were edited and no existing stage is invented.
- Correct routed extraction item `/75`: `BP⟨n⟩→E(n)` is a T(n)-equivalence, not generally an L_n^f-equivalence. Negative rational homotopy distinguishes the latter claim already at n=1. LMMT Corollary 4.12 does not assert the false identity, so this is recorded as a routing correction rather than a published-source error.
- Distinguish raw Tate from localized Tate, K(n)- from T(n)-acyclicity on arbitrary spectra, spectral affineness from ordinary affine geometry, and discriminant inversion from an unsupported integral class Δ. At two retain the extended order-48 group; at three retain the extended order-24 group.
- For generalized Serre theory retain monodromy and explicit convergence conditions. The arbitrary-base fiberwise comparison uses indexed colimits, not an unjustified convergence assertion for periodic coefficients. Hahn's quotient statement uses module cofibers; the printed positive-index theorem does not settle its separate index-zero case.

## Remaining obligations and where to resume

The packet has 21 named gaps, with precise statements and consumers. They propagate to each coverage entry through the internal dependency graph. Follow-up work must discharge these obligations without weakening the stated targets or hiding missing carriers:

| Gaps | Work required |
| --- | --- |
| G1–G2 | Expand nilpotence, thick-subcategory classification and the periodicity construction, including their simultaneous induction and compatibility arguments. |
| G3–G5 | Complete the localization/telescope and coherent Bousfield–Kuhn inputs and the original/sharp connective periodic-vanishing arguments, as specified in their packet entries. |
| G6–G9 | Extract Quillen/Lazard and p-typical realization, horizontal vanishing and smashing, height-one and higher telescope-status proofs, and coherent GHM realization. |
| G11–G13 | Expand cyclic Kahn–Priddy and finite-group reduction, prove raw Tate lower finite-locality, and establish the Euler-inversion/convergence theorem for the KU Tate calculation. |
| G14 | Extract the power-operation and Tate-height descent proofs, including the separate index-zero Bockstein case and the distinction between module cofibers and coefficient-ring quotients. |
| G15 | Obtain a proof of real Bott periodicity and its Clifford/complexification compatibility; ABS uses Bott periodicity and is not cited as its independent proof. |
| G16a–G16b | Supply the two missing geometric/spectral carriers through the proposed Part II roadmaps. |
| G16–G17 | Prove integral Otop gluing, elliptic spectral affineness, discriminant support, finite étale Galois descent and equivariant supersingular comparisons. |
| G18–G20 | Extract the stable James splitting, multiplicative Thom/free E₂ calculation and James-filtered Thom vanishing lines, with their convergence and completion conventions. |

Nine supplier contracts are recorded in `requests`, not sent as messages or separate issues: EnhancedDerivedSheaves E3; StableHomotopyKTheory H.5:spectra; RefinedTraceMethods RT.4:topological; AlgebraicTopology Stages 4, 5 and 8; ModularCurves 7E, 4B and 4C. Read each exact contract before treating the supplier as sufficient. Other imports use already identified supplier nodes. No ownership is moved upward and no existing TauCetiRoadmap target is replanned.

## Sources and checks

Seventeen public sources were read at the sections and theorem/page locators recorded in the reader and packet: LMMT, Hopkins–Smith, Ravenel, Kuhn's telescopic-functor guide and Tate paper, Clausen–Mathew, Hahn, CMNN, CSY, BHM, Mathew–Meier, Behrens, Goerss, ABS, Antolín-Camarena–Barthel, Angelini-Knoll–Quigley, and BHLS. Reading the statement of a deep theorem is not claimed to extract its proof. The missing original proofs and the precise sections not audited are attached to the gaps above. In particular the Hopkins–Smith periodicity construction, original height-one telescope proofs, BHLS construction, horizontal-vanishing proof, real Bott proof, stable James proof and localized Adams/Margolis arguments still need extraction. No restricted book was used. Repository prose contains no source excerpts.

Validation completed on 18 October 2026:

- `python3 scripts/check_blueprint.py research/blueprint/packets/ChromaticHomotopyTheory.json`: zero errors and zero warnings, also when supplied with a declaration index generated from the existing pinned source trees (70,802 Tau Ceti and 246,008 Mathlib entries).
- Separate checks: stage and node acyclicity, stage build order, all 34 route mappings, document/packet statements and API/test coverage, valid JSON, and only the five authorized deliverables.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/ChromaticHomotopyTheory.lean`: passed.
- `lean-check research/blueprint/suggested/ChromaticHomotopyTheory.lean`: **compiled successfully**, exit zero, with only eight expected placeholder-proof warnings. The 70-line file has one light real-bodied point adapter, four end statements and four examples. It supplies no missing spectral carrier. No language server or library build was started.

Independent review should begin with the ownership boundaries and the routed correction, then check the mathematical statements against their locators and the exact obligations in the packet. Packaging must preserve the small suggested-file shape and resolve the required supplier/proof inputs rather than adding abstract stand-ins. Scratch sources and scripts are disposable; nothing needed for review or continuation depends on them.
