# BP-DeformationAndDerivedPatchingAlgebra--R03.1 handoff

Issue: #6320. Agent: Codex. Session: `codex-FKTc2z`. Branch: `codex-FKTc2z-r03-1`.

This is a completed planning pass for independent review, not a checkpoint or a claim of implementation. The packet has `status: complete`; its sole stage has `coverage: planned`. No proof closure is claimed. Seven precise proof-interface gaps, six supplier requests and three whole-stage cycle boundaries remain explicit under PROTOCOL §0. All seven targets carried forward by the accepted P7 pass are covered. Stop after this job's pull request; this session has no second claim.

## Deliverables and counts

- [Packet](../packets/DeformationAndDerivedPatchingAlgebra--R03.1.json): 106 declarations, comprising 11 definitions, 8 constructions, 50 lemmas and 37 theorems; 61 API items, 57 discriminating tests, six planets, 63 checked baseline declarations and 36 source records.
- [Reader](../readmes/DeformationAndDerivedPatchingAlgebra--R03.1.md): coefficient conventions, proof chains, full declaration catalogue, every definition's uses/API/tests, dependency boundaries, source findings and public source versions.
- [Suggested Lean file](../suggested/DeformationAndDerivedPatchingAlgebra--R03.1.lean): genuine native ring constructions and marked residue data, both full subcategories, definition/construction APIs and tests, named theorem signatures with unfinished proofs.
- This handoff. No other job or campaign files are changed.

The two integrated R03.1 object IDs are retained for their single object declarations. All previously bundled extensions, towers, presentations and tensor properties are split into distinct declarations. Existing P7 graded-ring, finite-length and variable-order helpers are imported by their exact IDs. The generic completed tensor is imported from `AdicSpacesPartII:F0/completed-tensor-product-adic`; only its fixed-residue coefficient packing is planned here. The existing upstream Witt coefficient category and universal elliptic deformation object remain ModularCurves7D-owned, following RS08.

The packet's `stageTargets` maps all seven inherited targets to actual declarations. `targetInventory` accounts for all 135 touching paper-route items: 42 map to own nodes, seven to supplier or baseline interfaces, and 86 lie outside this stage. The original KW generic-fibre regularity conclusion remains R03.4-owned. The patched ring expression is a consumer of the coefficient constructors, not a new R03.1 application object. Regularity, depth, normality, excellence, determinants, cycles, multiplicities and derived module constructions retain their existing owners.

## What is established by this pass

The proposed categories carry actual commutative local rings, actual base algebra structures, actual surjective residue maps and their kernel/base equations. Morphisms preserve those maps; locality and maximal-adic continuity are consequences. `Small` includes a nonzero principal kernel and annihilation by the source maximal ideal. Positive truncation uses exponent n+1, so level zero is the residue field. Complete quotients require a proper ideal contained in the maximal ideal.

The prototypes use native `TrivSqZeroExt`, algebraic equalizers, ideal quotients, `MvPowerSeries`, `eval₂Hom`, `AdicCompletion`, native Witt vectors and native derivations. No missing mathematical notion is replaced by an undefined proposition. The tests distinguish nonsmall square-zero kernels, nonsquare-zero nilpotent kernels, zero objects, non-Artinian complete series rings, base cotangent directions, nonlocal variable evaluations and ramified residue changes.

Tensor construction needs no flatness; exact finite-module tensoring explicitly needs a flat tensor factor. Noetherian completion uses a finitely generated completion ideal and a Noetherian quotient, allowing a non-Noetherian source. Flat algebra completion allows a non-Noetherian, initially nonseparated algebra; faithfulness requires the ideal in the base Jacobson radical. Residue extension is arbitrary, uses an allowed non-Noetherian intermediate local algebra and is chosen data. Finite-generation descent uses the native faithfully flat theorem without assuming the starting module finite.

The Cohen convention is strict characteristic-zero complete DVR with uniformizer p. Imperfect residues are retained. Purely inseparable perfect-hull coefficient change is routed through the Teichmüller embedding process, rather than a separable Cohen lifting assertion. Reducedness after this change remains a separate R03.3 input. Compatible Artinian lifts are constructed before their complete limit; the R03.2 functor comparison keeps the contravariant direction h_B→h_A.

## Exact gaps and where to resume

1. **Homogeneous initial-ideal lifting.** In the R03.3 generic algebra supplier prefix, expose the initial ideal inside the existing graded ring, finite homogeneous generators represented by actual elements, and the correction modulo the next filtration power with controlled coefficient orders. Read Stacks05GH and the packet's correction-sequence/limit nodes. This is needed for Noetherian completion and therefore local tensor/residue-extension packing.
2. **Countable inverse-limit interfaces.** E2 must expose short-exact module tower limits with surjective or Mittag–Leffler left transitions, cofinal-filtration invariance, fixed finite products and pro-isomorphism/lim¹ interfaces. Start with the exact request and Stacks0598, André Lemma1.1.1, PQ Lemma5.15 and Bhatt Lemma5.3. The concrete module inputs are requested without duplicating generic derived-completion or pro-category constructions.
3. **Arbitrary-field prime-field formal smoothness.** Stacks0322 supplies the mathematical assertion, but its differential p-basis/geometric-reducedness chain has not been reduced to pinned declarations. The native perfect-field theorem requires essential finite type and is insufficient. This affects truncated Cohen lifting, compatible coefficient towers and arbitrary-residue coefficient maps.
4. **Relative Cohen structure in an arbitrary complete target.** André §4.4(1) uses Matsumura29.5–29.6. The private book was not available. The public Anscombe–Jahnke6.2/6.7 theorems give Cohen-to-Cohen maps; they do not directly embed a chosen Cohen ring into an arbitrary complete local target compatibly with the prescribed source coefficient map. Preserve the exact square in the packet and find a public proof or obtain the precise supplier interface.
5. **Regular point coordinates and generic tensor interfaces.** The arbitrary-DVR point-based domain proof needs an independent R03.3 regular-coordinate theorem with the specified coefficient section and variable-compatible quotients. It must not depend on the tensor-domain theorem it supplies. The original finite-Q_p generic-fibre regularity statement is a separate R03.4 consumer, not a result of this point argument.
6. **Teichmüller embedding-process infrastructure.** Anscombe–Jahnke4.1 and6.5 were fully read. The p-basis representatives, finite free root-adjunctions, pre-Cohen directed union and perfect Cohen comparison need lemma-level infrastructure. This is the explicit gap behind the chosen map C(k)→W(k^perf), not a separability assumption on k→k^perf.
7. **Local-field diagonal and pseudocompact comparisons.** BIP23 published Lemmas3.35–3.37 need the differential p-basis diagonal completion and pseudocompact Nakayama with actual compatible maps and separated kernels. Finite-module Nakayama and finite-type formal smoothness do not supply them. The relative O-Cohen coefficient bundle must retain the O-uniformizer when O is ramified. The three comparisons distinguish one-variable characteristic-p local-field change from zero-variable finite residue or characteristic-zero field change.

No additional sources were claimed read merely because an earlier paper extraction cited them. The reader's bibliography and packet `readSections` are the precise fresh-reading record. Books cited within the public proofs were not obtained from a private library.

## Supplier cycles requiring maintainer resolution

The current atlas has R03.1→F0 and R03.1→R03.2→R03.3→R03.4. Whole-stage reverse supplier edges would cycle. The packet therefore records valid rescope proposals for independent supplier prefixes, preserving existing node IDs:

- `F0:adic-algebra` supplies the existing generic adic tensor and its prerequisites; the remaining formal-geometry consumers can still import R03.1.
- `R03.3:basic-algebra` supplies the existing graded/finite-length/variable-order nodes and the independent initial-ideal/regular-coordinate requests; its remaining depth and regularity applications keep their forward imports.
- `R03.4:coheight-one-local-algebra` supplies the complete-Noetherian finite-residue coheight-one field fact independently of the coefficient-localization comparison that consumes it.

Recursive inspection of the exact imported packet nodes found no R03.1 node in their closures: five nodes for the F0 tensor; seven, one, two and four for the four P7 helpers. This supports an independent-prefix proposal; it does not assert that adding whole-stage backedges is safe. No R03.1→E2 path was found in the current stage graph; the E2 module-tower supplier link is separately proposed. The R03.2 represented-functor request is a forward consumer comparison, not a prerequisite of the independent ring-side formal-smoothness predicate.

No foreign packet, upstream roadmap or stage graph was edited. Accepting and assigning these supplier prefixes is maintainer/restructuring work.

## Source findings

Eight source issues are recorded with their versions and bounded correction searches. E1–E4 are Stacks degree/orientation/arrow slips; E5 corrects the false exact generator expression in the proof of Stacks06SC to a congruence; E6 is the injectivity/surjectivity slip in the KW author copy; E7 corrects the target residue-field label in published Anscombe–Jahnke6.7. They await this job's independent review.

E8 carries the existing atlas finding `PAPER-BOCKLE-IYENGAR-PASKUNAS-23/E11`: published BIP Lemma3.35 omits the finite extension κ(p)/κ(p₀). The counterexample R=F_p[[t]], A=R[x], p=p₀=0 produces two diagonal cotangent directions. The corrected condition appears in the node and the actual Lean signature. The earlier atlas verification is cited as known; no self-review verdict was added. Lemmas3.36–3.37 remain separately stated. The source is *On local Galois deformation rings*, by Böckle, **Ashwin** Iyengar and Paškūnas, Forum of Mathematics, Pi11 (2023), e30, doi:10.1017/fmp.2023.25.

The current Stacks0328 historical proof repair and the explicit compatible lifting square in032A were checked and are not falsely reported as new gaps in those proofs. All PDF and online source hashes and access dates are retained in the packet; no scratch source file is needed to locate the passages.

## Prototype and checks

The suggested file **elaborates with only the expected unfinished-proof warnings**, using:

`lean-check research/blueprint/suggested/DeformationAndDerivedPatchingAlgebra--R03.1.lean`

The final successful run used the shared pinned Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, after the memory check reported 97 GB available. Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` was source-audited. The shared compiled Tau Ceti checkout differs from that pin, so the prototype imports Mathlib only; no Tau compilation at its pinned commit is claimed. No build/update/cache command or language server was used. All node implementation statuses stay unchecked.

Six named signatures are explicitly omitted pending actual supplier types: `Complete.modularCurves_witt_comparison`, `Complete.tensor_isDomain_at_regular_point`, `Completion.hom_pro_comparison`, `Completion.hom_lim_one_zero`, `Completion.ocohen_basechange` and `Completion.finite_residue_basechange`. The file names these omissions; the packet's `prototypeAudit` explains each. The flat finite-module comparison states its underlying R-linear equivalence with canonical tensor values; completed coefficient compatibility remains part of the definitive target. The corrected local-field comparison states its underlying ring equivalence; the definitive target also fixes the completed-local coefficient-algebra structure.

Validation commands and results:

- `python3 scripts/check_blueprint.py research/blueprint/packets/DeformationAndDerivedPatchingAlgebra--R03.1.json`: zero errors, zero warnings; 106 nodes, 61 API items, 57 tests, six planets, seven gaps, six requests, one planned stage.
- The shared `source_issues.check_issues` and `check_errata.versions_checked` validators pass for all eight findings and 36 source-version records.
- Catalogue, API/test names and all nonomitted named theorem signatures checked for agreement with the packet. The internal prerequisite graph is acyclic. The external supplier-prefix limitations are recorded rather than concealed.
- Only the four authorized deliverable/handoff paths are changed. Push and submission use the session-prefixed branch and `Refs #6320`; the automated Swarm checks and intake handle submission and review routing.

The next action after intake is independent review of this complete planning pass. Any continuation should resolve the explicit interfaces and stage boundaries, then refine their proof inputs and implement the declarations before claiming source-decomposed or closed coverage.
