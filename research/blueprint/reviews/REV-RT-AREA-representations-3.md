# REV-RT-AREA-representations-3

**One finding confirmed, medium, with a corrected fix.** Codex / `codex-7e92bd`, 24 September 2026. Reviewed atlas commit `484485ee359918e196c3bc0a09cd82dc38adf47a`.

The mutual handoff is an extant ownership contradiction. The suggested repair needs more than distinguishing “abstract” and “concrete”: it must name the actual supplier and the remaining comparison. No mathematical implementation or whole-area acceptance is claimed.

## Evidence and verdict

[RootSystems, scope boundary](https://github.com/CBirkbeck/tauceti-explorer/blob/484485ee359918e196c3bc0a09cd82dc38adf47a/content/tau-ceti/RepresentationTheory/RootSystems/README.md#L45) assigns weight/root and coweight/coroot lattices, fundamental weights, dominant integral weights and rho to LieHighestWeight. [LieHighestWeight, library boundary](https://github.com/CBirkbeck/tauceti-explorer/blob/484485ee359918e196c3bc0a09cd82dc38adf47a/content/tau-ceti/RepresentationTheory/LieHighestWeight/README.md#L161) assigns essentially that list back to RootSystems. The same import appears in its introduction (64–67), library bullet (199–203), Layer 1 (352–355) and Layer 2 (384–389). These are directions to implementers, so medium severity is justified without a historical causal theory.

The standing-conventions promise at [LieHighestWeight 114–118](https://github.com/CBirkbeck/tauceti-explorer/blob/484485ee359918e196c3bc0a09cd82dc38adf47a/content/tau-ceti/RepresentationTheory/LieHighestWeight/README.md#L107) establishes intent to construct the integral-weight submodule in the Cartan dual; it does not demonstrate a consistently assigned, complete interface. In particular Layer 1 still says it only fixes rho notation and states integrality, while importing the lattice. The review therefore does **not** endorse the red team's claim that a clear abstract/concrete division already resolves the problem.

[RootSystems Layer 6](https://github.com/CBirkbeck/tauceti-explorer/blob/484485ee359918e196c3bc0a09cd82dc38adf47a/content/tau-ceti/RepresentationTheory/RootSystems/README.md#L356) does contain integral data: the numbered simply connected root datum for each valid Dynkin type, with coordinate character and cocharacter lattices. This is an explicit exception to its overly broad introductory exclusion. It is not automatically the lattice inside an arbitrary Lie algebra's Cartan dual, nor does its existence establish every rho or dominance comparison claimed by the consumer.

This is already documented in the [accepted RootSystems link map, first overlap](https://github.com/CBirkbeck/tauceti-explorer/blob/484485ee359918e196c3bc0a09cd82dc38adf47a/research/blueprint/links/tauceti_TauCetiRoadmap_RepresentationTheory_RootSystems.json). Its resolution is sharper than the submitted fix: retain finite-type coordinate data with RootSystems and the general highest-weight lattice dictionary with LieHighestWeight; reuse library carriers and prove the comparisons. The map's accepted review is by Codex / `codex-c83e7a`. Its presence does not correct the still-conflicting README instructions. This finding is independently corroborated but should be coordinated with that existing resolution, not create another ownership proposal.

[ClassicalGroups Layers 4–5](https://github.com/CBirkbeck/tauceti-explorer/blob/484485ee359918e196c3bc0a09cd82dc38adf47a/content/tau-ceti/RepresentationTheory/ClassicalGroups/README.md#L272) really attribute the Weyl formulas to RootSystems; [LieHighestWeight Layer 6](https://github.com/CBirkbeck/tauceti-explorer/blob/484485ee359918e196c3bc0a09cd82dc38adf47a/content/tau-ceti/RepresentationTheory/LieHighestWeight/README.md#L503) explicitly owns them. That supports the earlier `RT-AREA-representations-1/1`. It does **not** prove the red team's assertion that the lattice handoff caused that error. No causal claim is needed to confirm this finding.

## Corrected fix

1. Record the precise boundary: RootSystems supplies root-system geometry/classification and its numbered finite-type coordinate root data; LieHighestWeight owns the general highest-weight lattice dictionary, rho/dominance interfaces and representation-theoretic comparisons. Distinguish existing library imports from additional comparison obligations.
2. Make the RootSystems scope boundary acknowledge Layer 6. Correct **all six** LieHighestWeight handoff passages listed above, including the conventions' claim to reuse an unnamed abstract lattice. Point to a specific owning milestone and any actual supplier; a bare “shared” statement is insufficient. Preserve the established ownership of the Weyl formulas in LieHighestWeight Layer 6.
3. Reuse the pinned declarations below. Do not commission new root/coroot carriers, a second numbered root datum or another integrality predicate. Check the remaining weight/coweight, fundamental-weight, rho and action-comparison API individually before declaring it absent or supplied. This review does not certify their complete implementation.
4. These are existing `tauceti:` roadmaps. Respect PROTOCOL section 15: record the exact upstream/maintainer correction and downstream supplier contracts in the fix deliverables; do not re-plan the anchors or enlarge RootSystems with an unspecified general weight-lattice development. Coordinate the ClassicalGroups citation correction with the already-confirmed part-1 finding.

## Library checks that constrain the fix

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, directly read:

- [RootDatum](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/RootSystem/Defs.lean#L102): a root pairing over integers on specified carriers; finite generation is supplied separately. This is a datatype, not a construction of the Lie-theoretic weight lattice.
- [RootPairing.rootSpan and corootSpan](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/RootSystem/IsValuedIn.lean#L165): scalar spans, usable at integers. [Base.toWeightBasisInt](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/RootSystem/Base.lean#L406) is a basis of the **root span** under characteristic-zero hypotheses; its elements are simple roots, not fundamental weights. It must not be read by name alone.
- [RootPairing.weylGroupRootRep](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/RootSystem/WeylGroup.lean#L189): the natural action on the root pairing's supplied root-space carrier. It is not itself a comparison to the Cartan-dual integral-weight submodule.

At Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, directly read:

- [DynkinType.simplyConnectedRootDatum and simplyConnectedBase](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/RootSystem/SimplyConnectedRootDatum/Assembly.lean#L74): the datum and numbered base on `Fin rank → ℤ`, for a valid Dynkin type. The definitions already exist at the pin.
- [TauCeti.IsIntegralWeight and closure API](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Lie/Weights/Integrality.lean#L130): integrality of a Cartan-dual linear form against every coroot, with zero/addition/negation/subtraction/integer-scaling lemmas. The surrounding module-integrality theorems use characteristic zero, finite dimension, Killing semisimplicity and a splitting Cartan. Reuse the existing predicate and the actual hypotheses of each declaration.

All six inspected library files byte-match their Git blobs at the pins. The reviewed `data/library-coverage.json` has no direct entries for either anchor; that absence is not evidence of missing code. The three relevant LieHighestWeight atlas stage descriptions agree verbatim with the README.

## Independence, validation and limits

The submitted red team was written by Claude Code / `cc-fb70e5`; this session did none of it. This session previously reviewed unrelated LieGroups and ZigzagPreprojective links in this area. This verification covers only the submitted RootSystems/LieHighestWeight finding, not those earlier links or the red team's other clean claims. The sources and immutable public URLs are recorded in the companion JSON.

**PASS:** red-team checker; exact coverage of the single supplied finding ID with no extras; two-file intake with zero problems. All 18 captured input blobs and both output guards matched fresh main `484485ee359918e196c3bc0a09cd82dc38adf47a`. The bot-confirmed claim and issue instructions were unchanged before publication.

No Lean file was changed or compiled. This is a source-based ownership review, not a proof audit of the cited declarations or an independent red team of all 46 stages.
