# DESIGN-StableHomotopyKTheoryPartII

Issue: #3482. Author: Codex, session `codex-ZpzkTT`. This is a completed design pass for independent review, not a checkpoint or an implementation claim.

The four deliverables define one continuation of StableHomotopyKTheory, merging all 16 routed PowerOperationsAndSegalConjecture items. There are eight layers and 44 target nodes: 3 definitions, 11 constructions and 30 theorems; 55 API contracts, 50 discriminating unit tests, 34 planets and 12 pinned baseline declarations. Every definition/construction has at least three tests. All implementation statuses remain unchecked.

## Closure and requests

- PO.1, PO.2, PO.3 and PO.8 are closed at target granularity.
- PO.4, PO.5, PO.6 and PO.7 are planned. The packet is `complete`, with no internal gaps and three explicit supplier requests.
- `RefinedTraceMethods:RT.2`: name the basic E∞ Tate-valued Frobenius and its functorial, unit-normalized interface. Existing Tate diagonal and THH Frobenius nodes are imported; this roadmap owns the refinements and comparisons.
- `RefinedTraceMethods:RT.4:Habiro-comparison`: provide the finite étale/free Witt-ring input for the already planned spectral étale lifting equivalence, including uniqueness of the Frobenius lift by reduction.
- `ChromaticHomotopyTheory:CH.9`: provide the exact height-one KU-local-sphere raw-Tate rationality specialization and the equivariant unit/module comparison. Localized Tate vanishing is not substituted for raw rationality.

The reviewer should verify these interfaces and the full finite-type Singer/Adams route, the uniform pro-constant extension to arbitrary-dimensional vector spaces, the all-integer representation twists, and the free-loop totalization connectivity. Review all four source findings, especially E4, the new distinction between categorical compactness and the finite/dualizable p-complete class used by the spherical Witt example. E1–E3 re-record already extracted misprints with corrected formulas; E4 does not assert the original theorem under actual categorical compactness is false.

## Baseline and ownership audit

Read the reviewed H.5/H.6/RT.2 library audit, the exact supplying packet nodes and stage descriptions, and the cited declarations at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Also searched the current read-only TauCetiRoadmap checkout, including the newer roadmaps, and the current Tau Ceti library. Read the AlgebraicTopology and UniversalCovers reader documents as upstream examples. Spectra, the stable Steenrod algebra, spectral Adams/Singer theory and representation-twisted spectral cohomology remain absent at the pins; existing ordinary Witt vectors/Frobenius and finite inverse-system theory are imported.

Generic Tate/cyclotomic constructions, KU, generic Thom theory, cohomology products and monoidal infrastructure retain their existing owners. No notion was moved from a higher tier. No restructure or upstream edit is proposed. The new roadmap's exact node prerequisites and stage requirements identify every imported interface.

## Verification and compact shape

`python3 scripts/check_blueprint.py research/blueprint/packets/StableHomotopyKTheoryPartII.json` passes with zero errors. Its two warnings are the two citations of `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality` without supplier requests. That stage is already an upstream roadmap with the required cohomology/products targets, so requesting it anew would duplicate existing work. It is deliberately not listed as a pinned-library declaration.

`lean-check research/blueprint/suggested/StableHomotopyKTheoryPartII.lean` passed at the pinned build; its only diagnostic is the expected declaration-with-`sorry` warning. Available memory exceeded 20 GB before the check. The 54-line companion has one proposed end theorem on the existing finite type-valued tower carrier and two proved baseline Witt Frobenius examples. It contains no fake spectral carriers, axioms, heavy constructions, or data definitions with missing bodies. The reader is definitive for every spectral statement and its API/tests, as required by the current compact-shape instructions. No background Lean process remains.

The reader and packet were checked for matching statements, hypotheses, proof steps, API/test contracts, dependencies, source locators, planets and routed-item coverage. Planet counts by layer are 5, 6, 4, 5, 5, 2, 5 and 2. Only the four named deliverables and this handoff are submitted.

## Sources

Primary public files read: Nikolaus–Scholze §§III.1, IV.1, IV.3.7 and the invoked I.2/II.4 inputs; the entire published 2019 correction; Lunøe-Nielsen–Rognes inverse-limit Adams, algebraic/topological Singer and comparison proofs; Adams–Gunawardena–Miller's cyclic Singer Tor argument; BMMS VIII.1, VIII.2 and VIII.4; Milnor's Hopf/dual calculation; Cartan exposés 14–16; Kuhn §6 and Malkiewich Proposition 2.22 with proof. Exact read ranges, public URLs, file hashes and access date are in the packet/reader. BMMS locators explicitly use scan PDF page numbers. No required source was unavailable, no uncleared book was used, and no source file or passage is included.

The next action is independent review and resolution of the three supplier requests, followed by the programme's packaging stage. This run claims no further job.
