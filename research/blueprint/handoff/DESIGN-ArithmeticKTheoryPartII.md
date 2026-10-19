# DESIGN-ArithmeticKTheoryPartII — completed planning pass

Issue: [#3437](https://github.com/CBirkbeck/tauceti-explorer/issues/3437). Worker: Codex, session `codex-2LdeNX`. The bot confirmed this session's claim before work began. This is a finished design pass for independent review, not a checkpoint or an implementation.

## Delivered and checked

The new roadmap is `ArithmeticKTheoryPartII`, in area `ktheory`, with parent `ArithmeticKTheory`. The definition, packet, reader and suggested file agree on nine layers and 42 targets: 29 theorems, nine constructions, three definitions and one comparison. There are 48 API items, 36 discriminating definition/construction tests, 40 planets and eight checked baseline declarations. All 36 continuation items from `PAPER-FENG-GALATIUS-VENKATESH-22` have a target/import crosswalk in `routing.items`. Its provisional owner name `ArithmeticKTheoryPartIISymplecticGaloisAction` becomes this issue's required owner; no second continuation is introduced.

Every definition and construction has uses, an API and at least three tests. The reader gives every target's statement, hypotheses, proof route, exact prerequisites, acceptance Checks and journal locator. Target prerequisite chains end in checked library declarations, existing supplier nodes, requested supplier interfaces or the explicit gaps below. The local target graph is acyclic. No stage is marked closed and every implementation status is unchecked.

Validation on 2026-10-19:

- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticKTheoryPartII.json`: zero errors and zero warnings, using the available pinned declaration index.
- `lean-check research/blueprint/suggested/ArithmeticKTheoryPartII.lean`: exit zero at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`; nine expected admitted-proof warnings, no other warnings or errors. Available memory was 86 GiB before compilation. No build or language server was started.
- The 95-line suggested file has two light real-bodied formulas on existing representation/linear-map carriers, three API statements and six examples. Missing KSp, spectra, moduli and realization carriers remain full reader targets, following the current PACKAGE_REVIEW shape. It contains no admitted data definitions.
- JSON parsing, deliverable path checks, relative reader links, source-item coverage, planet bounds and local dependency consistency were checked. Compilation verifies only the suggested native-carrier interface, not the roadmap mathematics.

## Coverage and resumption

The packet status is **complete** as a target-level planning pass. Independent review starts from the reader and the matching packet. It must assess the mathematical supplier contracts and source findings before any layer can be called closed.

| Layer | Status | Exact outstanding boundary |
| --- | --- | --- |
| AK2.0 | planned | Integrate the arithmetic even-group tables, tensor/Adams operations, Artin/class-field adapters and relative homology contracts. |
| AK2.1 | planned | Integrate symplectic-to-unitary topology, corrected Hermitian splitting and compatible Moore telescopes. |
| AK2.2 | planned | Integrate the existing CM classification/Serre tensor and narrow-class-field sign-prime adapters. |
| AK2.3 | planned | Integrate the preceding topology and splitting contracts. The independent Hodge-unit argument precedes the splitting; CM generation uses that splitting. |
| AK2.4 | planned | Resolve G1 and integrate ppav atlas, graded realization and spectrum coherence contracts. |
| AK2.5 | planned | Integrate the CM lift-product adapter and native/FGV relative-bar comparison. |
| AK2.6 | planned | Resolve the propagated action obligation and integrate the Artin–Bott/relative-homology interfaces. |
| AK2.7 | planned | Integrate continuous compact homology, local pair comparison, finite-field sphere-unit input and conditional Vandiver control. |
| AK2.8 | planned | Integrate stable symplectic finite-type/stability, safe-range topology and Bernoulli control. G2 and G3 retain the excluded source boundaries. |

Three mathematical obligations remain explicit:

- **G1:** EH.6's existing strictification gap G7 propagates to the graded ppav Γ-diagram. Supply product, Γ-map, automorphism, coefficient-tower and limit coherence. At (p=3), realize the pointed Moore smash before completion and desuspension; separate homotopy-group comparisons do not give a spectrum action. Review the rational-basepoint compatibility too.
- **G2:** The printed Hurewicz endpoint (2p-2) crosses a possible (P^1) Postnikov extension. The plan uses an integral finite-type spectrum and proves only the range (1\leq i\leq2p-3). Prove the endpoint directly or retain this smaller range. The characteristic-number application needs only even degrees at most (2p-4).
- **G3:** The factorial integrality argument does not cover the source's equality boundary (p=\max n_j). The planned characteristic-number theorem assumes (p>\max n_j). A boundary extension needs a different integral argument; no falsity claim is made about the printed conclusion.

## Supplier ownership and requests

All 24 requests are precise contracts in the packet and reader. They have not been posted as new issues or edited into another owner's files. Rescope proposals preserve the existing owners and propose their Part II interfaces where their present statements do not suffice.

- **R1, R16:** ArithmeticKTheory N.6/N.7 — exact Bott/étale tables, comparison ranges and Bernoulli bridge; N.3's finite-generation node is imported directly.
- **R2–R3:** GeneralAlgebraicKTheory K.7 and SchemeKTheoryOperations S.6 — coherent tensor multiplication and duality/Adams/transfer compatibility.
- **R4–R5:** RefinedTraceMethods RT.4:topological and GeometryOfNumbersAndQuadraticArithmetic GN.6 — symplectic/unitary comparison and the odd-primary Hermitian splitting with its factor two.
- **R6, R13a, R21, R23:** StableHomotopyKTheory H.4–H.6 — compatible v₁ telescopes and finite-type/Postnikov inputs, low-range Eilenberg–MacLane calculations, additive spectrum adjunction, and the already-owned strict projective/symplectic Γ models. R23 is an import contract, not a new local definition of those models.
- **R7–R9:** Current upstream ClassFieldTheory Layers 11/13 and Chebotarev Layer 10 — Artin normalization, full/p/narrow class-field adapters and prescribed Frobenius/sign choices. Their existing theories are never replanned.
- **R10–R11:** PELModuli M1/M2 — ppav stacks, selected factors, full-level atlases, rigidified Hilbert-polynomial pieces and classifying maps.
- **R12:** ComplexMultiplicationAndExplicitReciprocity CM.2 — the polarized groupoid lift-product formula with arithmetic Artin normalization; CM.1 Serre tensor and CM.2 classification remain direct imports.
- **R13–R14:** ArithmeticGaloisDuality R02.2/R02.1 — relative homological Hochschild–Serre/native-bar conventions and completed continuous relative homology, with the lisse-sheaf comparison.
- **R15, R19:** IntegralIwasawaTheory I.5/L3 — the exact nonzero-kernel Bernoulli specialization and conditional finite-level Vandiver control.
- **R17–R18:** BorelRegulators R.3 and KTheoryFiniteLocalFields L.1 — symplectic stable integral/rational homology and the precise sphere-unit comparison, beyond the existing SL and finite-group order statements.
- **R20, R22:** Current upstream AlgebraicTopology and EtaleHomotopyTypes EH.6 — integral products/cap classes/Bocksteins and coherent graded arithmetic realization. Exact existing EH.5/EH.6 nodes are also imported.

No mathematics was moved out of a higher-tier roadmap. No existing roadmap or library declaration is replanned. Current TauCetiRoadmap main `0d144d044dacebca17b654695b6f1ad58f159b27`, including the nine post-snapshot roadmaps, and current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were checked read-only. The complete GrothendieckEulerForms and AlgebraicVectorBundles README/Suggested pairs supplied current structural models; ProfiniteArithmetic's compact-module boundary was checked. The packet's baseline audit and upstream notes preserve those boundaries.

## Sources, corrections and review priorities

Read in full: Tony Feng, Søren Galatius and Akshay Venkatesh, *The Galois action on symplectic K-theory*, Inventiones Mathematicae 230 (2022), 225–319, including Appendix A.1–A.5. Locators use the [version-of-record PDF](https://link.springer.com/content/pdf/10.1007/s00222-022-01127-8.pdf), read on 2026-10-19, SHA-256 `5da9a2b28d13b2b22a262a81650188025020d92238ec2b47404d177ef91d7b4d`. All statements and findings are in our own words. No source passage or section-by-section source summary is included.

The packet restates and checks extraction findings E1–E18 against that published text and adds **E19**, the fractional-ideal morphism scalar: allow fraction-field units carrying one ideal to another, rather than just ring units. The (2\mathbb Z\to3\mathbb Z) test detects the distinction. These are findings for independent review, without self-issued review verdicts. Bounded publisher/arXiv and title-plus-erratum searches found no published correction; this asserts neither novelty nor exhaustive absence.

Review especially the factor-two hyperbolic normalization, the inverse-action native bar adapter, the distinction between the p-Hilbert field and the full CM Hilbert field, coefficient coherence at (q=3), and the three gaps. The reader explicitly converts Tau Ceti's positive compatible-structure convention to FGV's linear-first Hermitian convention: for (\omega=\operatorname{Im}h), its compatible structure is −(J_H), since (\omega(v,J_Hv)=-h(v,v)). It also distinguishes a unique conjugation-fixed prime under Vandiver from uniqueness among all primes under regularity.

The primary paper's secondary books and articles were not independently read. Their generic inputs stay with the named suppliers and exact open contracts; they are not claimed verified from those sources here. No restricted book was used. No source download, extracted text, private path or scratch-only dependency is needed to resume review.
