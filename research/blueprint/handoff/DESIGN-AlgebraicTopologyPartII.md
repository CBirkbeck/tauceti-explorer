# DESIGN-AlgebraicTopologyPartII — handoff

Issue: #3401. Agent: Codex, session `codex-qPJYQX`. Claim comment 6256883590 was confirmed by bot comment 6256884993. This submission is the completed target-level planning pass, ready for independent review; it is not a closed proof plan or an implementation.

## Delivered and checked

The [roadmap definition](../roadmaps/AlgebraicTopologyPartII.json), [packet](../packets/AlgebraicTopologyPartII.json), [reader](../readmes/AlgebraicTopologyPartII.md) and [suggested signatures](../suggested/AlgebraicTopologyPartII.lean) cover all three accepted continuations. The routing index accounts for all 22 Browning–Sawin items, 49 Benoist–Wittenberg items and 31 Benoist19 items, exactly once each. Shared real-locus objects have one owner.

There are 75 targets: 4 definitions, 13 constructions, 56 theorems and 2 comparisons; 51 API items; 51 discriminating unit tests; 73 planets, with at most six per layer; and 11 checked baseline declarations. All implementation statuses remain `unchecked`. Packet status is `complete`. Every layer AT2.1–AT2.16 has coverage `planned`; none is `closed`. There are 14 explicit gaps and 14 supplier requests. The source and signature indices explain the narrower scope of the compact Lean file.

The library baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Statements were read in the pinned source files. The current read-only TauCetiRoadmap checkout was also inspected at `0d144d044dacebca17b654695b6f1ad58f159b27`, together with the current Tau Ceti library, to avoid replanning the nine roadmaps newer than the atlas snapshot. In particular, ordinary AlgebraicTopology, RealAlgebraicGeometry, DifferentialGeometry, AlgebraicVectorBundles and GeometricTopology interfaces are reused. The reviewed library audit was screened; no AlgebraicTopologyPartII audit entry exists. The partly built SF.2 audit does not establish supported semialgebraic cohomology or exceptional operations.

Validation on 19 October 2026:

- `scripts/check_blueprint.py` against the pinned baseline: 0 errors, 0 warnings; 16 of 16 layers planned.
- `lean-check` on the suggested file: exit 0, with only six warnings that declarations use `sorry`. The file has real-bodied light definitions, theorem signatures and worked examples; no data definition has a missing body. This checks elaboration, not the truth of the milestone signatures.
- Intake `check-files`, JSON/route/dependency consistency checks and `git diff --check` are recorded with the submission. The handoff and other four deliverables are the only repository changes.

## Ownership and dependency decisions

The real-locus direction remains **SF.2 carriers → this topology → SF.6 comparison → MC.2 cycle classes**. The generic owner is still `SchemeAndStackFoundations:key/equivariant-sheaf-cohomology`; its existing ringed-space construction needs a requested extension, not a duplicate definition. A free-abelian-group classifying model is not a C₂ Borel model.

EDC.6 and the finite-field trace suppliers feed only the independent configuration strand. Ordinary finite-cover theory, cochains, CW pairs, duality and native homotopy shifts are imported. No configuration theorem is a prerequisite of the real-locus prefix. The tangent characteristic classes and rational minimal-model work are additional targets, with explicit proof gaps, rather than assertions that those notions already exist upstream.

The 14 requests in the packet retain these owners:

- R1: EDC.6 comparison for configuration local systems, with supports and Frobenius.
- R2–R4: FF.2 compact trace, FF.3 factorization/Frobenius orbits, and FA.5 the affine-line Euler product.
- R5: LD.6 semialgebraic geometry, finite-cover sites and dimension over arbitrary real closed fields, extending the current real-number CAD topology.
- R6: SF.0 native scheme and affine-chart inputs.
- R7: the reserved SF.2 owner, extended by supports, extension by zero, finite-group spectral sequences and Borel approximations, generic exceptional-operation foundations, and Ext-stalk compatibility.
- R8–R13: the existing ordinary AlgebraicTopology stages 2 and 4–8. These are reuse/interface requests, not replacement topology plans.
- R14: the existing GeometricTopology manifold and relative-transversality interfaces.

The ordinary Ehresmann theorem has an accepted ownership promise to MappingClassGroupsAndCanonicalRepresentations, but no usable atlas stage ID. G12 records this instead of inventing one. The equivariant and controlled-pair adapters remain here. No notion was silently moved out of a higher-tier supplier. Two explicit restructuring decisions remain for review: resolve the Ehresmann owner, and either supply a genuinely topological affine bound here or move the late affine application downstream of SF.6 without making the real-locus prefix circular. The Picard specialization of the near-top theorem belongs downstream to SF.6/MC.2.

## Exact open leaves and where to resume

The reader's “Remaining proof obligations” section and each gap's `neededBy` list are authoritative. Resume by independently checking the target statements and these leaves, preserving the complete 102-item routing index:

1. **G1, tame bouquets:** finish the controlled-at-infinity, local Milnor-fibre and thimble-attachment reduction behind Broughton's theorem. A homology calculation alone does not prove a sphere bouquet.
2. **G2, Hilton and Serre:** read and decompose the remaining basic-product proof and the loop-space spectral sequence. Native homotopy shifts supply neither.
3. **G3, rational models:** establish the nilpotent finite-type model existence and dual-homotopy theorem used by the loop cohomology target.
4. **G4, semialgebraic sites:** verify arbitrary-field finite-cover gluing, quotient and comparison inputs, including non-quasiprojective loci; ordinary singular topology applies only over ℝ.
5. **G5, exceptional operations:** decompose f-soft acyclicity, small-sum preservation, finite cohomological dimension and representability at the existing generic SF.2 owner. Retain the semialgebraic orientation specialization here.
6. **G6, affine dimension:** supply the topological affine-complex cohomological bound or execute the stated downstream restructuring. The paper's étale proof cannot justify a reverse dependency on SF.6.
7. **G7, relative affine vanishing:** inspect Scheiderer Corollary 18.11, especially the first vanishing degree and filtered-coefficient hypotheses. High-degree restriction alone is insufficient.
8. **G8, squares and Wu:** verify the supported semialgebraic square operations, Thom identity and arbitrary-real-closed spreading/comparison proof.
9. **G9, tangent characteristic classes:** connect Thom-defined Stiefel–Whitney classes to the imported orientation and tangent carriers, including the surface Euler parity formula.
10. **G10, Picard specialization:** prove the downstream Picard-to-ordinary-cohomology implication. The topological theorem already states its ordinary odd-order hypothesis explicitly.
11. **G11, quartics:** obtain the ordinary quartic Betti/action input and semialgebraic fixed-point trace proof. The target records a conditional rank calculation and does not assert torsion-freeness.
12. **G12, ordinary Ehresmann:** resolve the promised supplier's ID and horizontal-flow contract before closing the equivariant adapter.
13. **G13, pairs:** verify invariant compatible control data and the actual divisor-family hypotheses in Benoist Proposition 6.6; separately check the integral lift's normalization on the application open set.
14. **G14, common lifts:** verify the cochain chase for the explicitly typed δ and ζ lifts of γ, the plus sign and the indeterminacy image in Benoist (4.3)–(4.5). Jannsen's cited lemma has not been obtained.

The key corrected conventions must survive review: include fixed points in cycle counts; distinguish ordinary from compact cohomology in the first trace formula; use weighted diagonal extraction; require n≥4 for the full double-loop Betti series; retain finite stalks for algebraic perfect duality; distinguish supports from the real-locus pair; and use the minus sign in the integral trace lift. Reduction ℤ/n(1)→F₂ is identity in H¹ but scalar n/2 modulo two in H². The circle extension is an extension of abelian sheaves: a global lift of its quotient unit does not imply a splitting (constant ℤ/4 detects this).

## Sources read and boundaries

The reader and packet record public URLs, exact versions, SHA-256 hashes, read dates and inspected sections. Results are stated in original prose with theorem/section/page locators; no source passages or source files are included.

- Browning–Sawin: configuration and arrangement inputs in §§1–3 and the §7 Euler/rational-loop argument.
- Benoist–Wittenberg: §§1.1–1.5 and 1.6.3–1.6.4, plus the cited near-top and quartic applications.
- Benoist19: §§2–4, Proposition 6.6 and §§7–8, including the corrected trace-lift and transport gates.
- Church–Ellenberg–Farb: Proposition 3.3 and Theorem 3.7.
- Broughton: Theorem 1.2, Definition 3.1 and the relevant §4 retraction/gradient-flow inputs through printed p.229; the continuation and Milnor attachment inputs remain G1. Its published Theorem 1.2, p.219, is the locator used here.
- Hilton: Theorem A/basic products and the cited proof conclusion/Corollary 4.10; unread internal proof leaves remain G2.
- Serre: Chapter V §3 Proposition 3 and §6 Lemma 7/Corollary 2; Chapter IV spectral-sequence prerequisites remain G2.
- Sullivan: introduction and §11 loop models; the earlier model-existence proof leaves remain G3.
- Pham: Part I §2 Theorem 1 and the deformation-retraction lemma, pp.337–338, supply the explicit Fermat join model without invoking an uncleared book.
- Edmundo–Prelli: arXiv v3 §§2.2, 4.1–4.2, with its own theorem numbering. The f-soft/representability prerequisites remain G5; the field-only remark is not used to claim integral perfect duality.
- Mather: §11 Proposition 11.1 and its proof; control-data prerequisites remain G13.

Unread or unavailable inputs are precisely the proof continuations above and the cited Scheiderer, Delfs/Epstein/Raynaud, Jannsen and ordinary quartic/fixed-point inputs named by the gaps. No private-library source was used. The eleven source corrections inherited from the accepted extractions are recorded and rechecked in `sourceIssues`; this job makes no new author-notification request.
