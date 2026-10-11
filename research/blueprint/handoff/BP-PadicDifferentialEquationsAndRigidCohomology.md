# BP-PadicDifferentialEquationsAndRigidCohomology — handoff

Job #964, agent Codex, session `codex-FXlUXu`, 11 October 2026. The bot confirmed
[the claim](https://github.com/CBirkbeck/tauceti-explorer/issues/964#issuecomment-6108050201).
The work starts from atlas commit `0311207a4c7eb718bd7adaac0013c0c4a832e5a1`.

## Submission status and deliverables

This is a **complete blueprint pass at the binding node budget**, ready for independent review.
It is not a checkpoint or a closed roadmap. The input already contained 304 nodes, exceeding
this issue's 300-node budget; the issue expressly requires adding no nodes, reconciling the
coverage, gaps, document and suggested file, and setting the packet to complete. All 304
inherited IDs are retained. Every node's implementation status is still unchecked.

- [Packet](../packets/PadicDifferentialEquationsAndRigidCohomology.json): status complete;
  50 definitions, 30 constructions, 111 lemmas, 97 theorems, 4 comparisons, 12 applications.
- [Reader](../readmes/PadicDifferentialEquationsAndRigidCohomology.md): the same definitions,
  hypotheses, APIs, tests, proof outlines, prerequisites and source locators in prose.
  Source passages and excerpt blocks were removed; assertions are paraphrased.
- [Suggested Lean](../suggested/PadicDifferentialEquationsAndRigidCohomology.lean): 3,478 lines,
  namespace `TauCeti.RigidCohomology`, Mathlib imports only. Its partial models and unstated
  interfaces are explicitly identified; elaboration is not mathematical implementation.

There are **554 API items, 348 unit tests, 44 planets, 79 baseline declarations, 46 gaps,
9 supplier requests, 24 restructuring proposals, 71 source issues and 34 sources**.

| Stage | Nodes | Planets | Coverage |
| --- | ---: | ---: | --- |
| RD.0 | 26 | 6 | partial |
| RD.1 | 42 | 6 | partial |
| RD.2 | 30 | 6 | partial |
| RD.3 | 22 | 5 | partial |
| RD.4 | 33 | 6 | partial |
| RD.5 | 73 | 6 | partial |
| RD.6 | 67 | 6 | partial |
| RD.7 | 11 | 3 | partial |

## Mathematical and ownership reconciliation

WORKERS' current upstream order puts RD in tier 12 before PadicHodgeTheory in tier 13.
The Laurent coefficient carrier, bounded/integral/Amice carriers, radius norms and their
remaining topology therefore belong to RD.0. The existing
`RD.0/frobenius-lift-on-robba-ring` target now includes that interface; no duplicate carrier
node was added. Higher-tier P7 must import it. This supersedes the older P7 assignment in
RT-AREA-padic-2/31 and RS-26. The Robba–Cohen/Witt comparison remains a separate target.
The broader ring-identification input for Berger's application is an explicit downward-moved
RD.2 gap. Upward P7/PG dependencies and stray VB, Motives, Weil-conjecture and finite-field
character suppliers were removed from active prerequisite lists.

The following stable RD.3-prefixed IDs now have RD.5 as their actual parent and realised stage:

- `RD.3/splitting-of-slope-separated-extensions`
- `RD.3/de-jong-tensor-injectivity`
- `RD.3/de-jong-rank-one-image`
- `RD.3/local-full-faithfulness`
- `RD.3/full-faithfulness-overconvergent-to-convergent`
- `RD.3/full-faithfulness-requires-frobenius`
- `RD.3/punctured-curve-boundary-acceptance`
- `RD.3/etale-cover-of-affine-space`

The seven mixed coefficient/local targets use both RD.1–2 and RD.3; RD.5 is their first common
downstream stage. The eighth target supplies the finite-étale affine-cover input to RD.5 and
RD.6. No node depends on a later stage of this roadmap. External atlas links and owner records
need maintainer reconciliation; this submission does not edit them.

Supplier imports now use exact available F1/R2/R3, CR.2, DWP.0/2/4/7, L2 and arithmetic Swan
node statements rather than treating broad stage labels as proofs. The Nagata and smooth
projective purity requests were answered and removed. The purely schematic alteration input
is requested from the proposed `L5:alterations` owner: that substage is absent from the live
packet, and the existing L5 étale descent node does not supply rigid descent. The former SF.4
node is identified as statement evidence, not silently reinstated as the settled owner.

The corrected tube convention distinguishes classical inverse-image tubes from the interior
of the inverse image under continuous adic specialization. The j† acyclicity statement
requires quasi-Stein intersections over every target affinoid. The affine coefficient
comparison requires a compatible affine lifting and cofinal affinoid neighbourhoods. Dwork
Taylor convergence is on the diagonal tube, not a disc of differences larger than one.
Pointwise weights explicitly require a complex embedding; arbitrary complete coefficient
fields are not asserted to admit one.

Fargues–Fontaine Proposition 11.2.24, p. 378, is not a fully faithful equivalence on all
Frobenius modules, and Lemme 11.2.25, p. 379, requires bijective integral Frobenius. E218/E219
record the independently confirmed findings with their corrected scope. E68/E69 record the
Xu–Zhu author-preprint Dwork sign and p-versus-q errors, by differentiating the displayed
multipliers; they await independent review and version-of-record collation. The first 67
source issues and their numerical evidence remain historical inherited records, not fresh
verification claims.

## Libraries and upstream checked

The pinned baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The 79 inherited declaration statements were
read before reuse. AUDIT-37 is accepted and identifies the roadmap's analytic/cohomological
targets as not built; elementary library fragments do not implement those targets.

Current upstream main was checked at `c251d2e42c66f14c279d1e5c2708c5a91d8c8aec`, and current
Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. AdicSpaces and OperatorTheory reader
roadmaps were read in full; targeted statements were checked in the nine newer roadmaps and
current library. AlgebraicVectorBundles' finite locally free sheaves and DifferentialGeometry's
real-manifold de Rham theory do not provide the rigid coefficient categories. OperatorTheory's
real/complex Hilbert-space ideals do not prove the nonarchimedean nuclear LF trace theorem.
ReductiveGroups' comodule reconstruction is a partial input, not general neutral Tannaka duality.

An additional upstream dependency was checked directly:
[CohomologicalPointCounting PR 196](https://github.com/TauCetiProject/TauCetiRoadmap/pull/196),
head `4bd72379658126cbe9be935656396f0c9dac4de0`, is **open** on 11 October 2026.
TraceFormula Layers 12–13 give the matching all-power constant-sheaf étale trace formula and
arithmetic/cohomological zeta identity. They are absent from the checked main and library.
SF.2's upstreamIntegration entry names this pending PR; it does not prove it is installed.
The packet records a precise gap and request through the registered SF.2 supplier stage.
When upstream adopts it, read its final signatures and replace that request with exact imports.
No duplicate trace/zeta roadmap is proposed here.

## Checks actually run

- `python3 scripts/check_blueprint.py` on the packet: **0 errors, 0 warnings**.
- `scripts/check_errata.py`'s checker on an `errata-v1` view of the packet's source issue/version
  records: **0 errors**; the packet itself correctly remains `blueprint-v1`.
- `research/blueprint/intake.py check-files` on all four deliverables: **0 problems**.
- Stable-ID comparison: no additions or deletions. Prerequisite ordering, cycles and planet limits
  pass. Every API/test name appears in the reader and in a namespace-resolved Lean declaration,
  named example or explicit unstated-interface comment.
- **Lean compiled with exit code 0**, using `lean-check` at the pinned Mathlib build. Its only
  diagnostics are **286 declaration-uses-sorry warnings**. Memory was checked before compilation;
  no build, cache download, library update or language server was started. No compile remains running.
- `git diff --check`: passed.

The suggested file has 367 lines containing explicit unstated-interface notes. In particular,
the Frobenius data record gives algebraic ring maps and a specified coordinate image, but
not a topological Frobenius lift. Extensionality, general reduction, norm preservation and
continuous substitution are not stated from that insufficient record. The three added Laurent
carrier tests are subtype/convolution signatures, including rejection of a nondecaying negative
tail. Finite-dimensional output types in the prototype do not prove cohomological finiteness.

## Precise resumption work

Use each stage's `coverage.remaining` and the gap register as the worklist. No stage is closed.
The independent reviewer should check corrected statements and ownership first; stage follow-ups
must complete the following missing targets and proof interiors before packaging:

- **RD.0:** build the single Laurent carrier's Fréchet/LF and integral weak topologies, continuous
  substitution and full Frobenius API; prove Arabia's lift/homotopy inputs; add open-annulus/disc
  Bézout and closed-ideal/divisor classification with the correct spherical-completeness scope.
- **RD.1:** finish cyclic vectors, differential-break proofs and the Dwork overconvergence argument;
  build the corrected E† completion/isoclinic comparison and equal-characteristic classification;
  add dense-open global slopes, reverse filtration and the Robba kernel–cokernel residue duality.
- **RD.2:** supply the unit-root local-monodromy proof and completed-algebraic-closure input;
  construct André's MC/MCF Tannakian group and its logarithmic solution interface, keeping
  modules admitting Frobenius distinct from modules with a chosen Frobenius structure;
  complete the downward-moved Berger ring identification.
- **RD.3:** prove fibration, frame/compactification independence, gluing and j† acyclicity under
  the stated chart hypotheses; construct the ordinary convergent site and Frobenius-bearing
  crystalline comparison; supply finite étale pushforward, Crew's global unit-root correspondence
  with its precise coefficient/F^n conventions, and Étesse's abelian-scheme overconvergence.
- **RD.4:** finish the rigid and compact-support constructions, supported Poincaré/Gysin inputs,
  log proper-support spectral sequences, algebraic de Rham specialization/cospecialization,
  the special-fibre dagger–Berthelot comparison for AG2.4, and the Igusa theta-cokernel construction.
- **RD.5:** reconcile the moved full-faithfulness targets with dense-open subquotient closure,
  docility and semistable reduction; import the purely schematic alteration owner and construct
  rigid hypercover descent; finish Crew duality and curve index arguments; prove Igusa finiteness
  separately and smooth proper convergent direct images of perfect Frobenius complexes.
- **RD.6:** supply the p-adic trace proof, precise nuclear LF input, index formula and Irr=Swan;
  construct neutral Tannakian and additive-character inputs; add Kummer coefficients and the
  Kloosterman middle-cohomology application with its rank, purity and hypersurface hypotheses.
- **RD.7:** finish crystalline comparison with coefficients and its Frobenius compatibility,
  degreewise rational/integral weight-separated factors, pending étale trace imports and
  point-count precision proofs; supply the Kloosterman semistable realization, with its explicit
  prime/weight bounds and downward-moved period-ring comparison input.

The nine remaining supplier requests concern SF.0 graph closures; CR.3 early crystalline data;
L5 schematic alterations; AlgebraicCurves differential/residue comparison; L4 nuclear LF traces;
ReductiveGroups Lie algebras; F1 polynomial homotopy; R2 formal-projective comparisons; and
SF.2's pending upstream trace/zeta import. Their exact statements and consumers are in the packet.

Maintainer actions include the P7/RS-26 carrier owner update, RD.5 parent/link updates, ordinary
convergent-category ownership at RD.3, the L5:alterations split, DWP number-weight ownership,
and AG2.4 links to RD.4 comparison, RD.5 finiteness and RD.6 weights. RD.0 should provide the
shared residue/primitive interface to RD.2 and ColemanIntegration; the proposal records that
placement without adding a node. F∞ divisibility-colimit and compactified Igusa log-monodromy
extensions belong to their routed Part II, not silently to the parent category here.

## Source reading receipts and limits

Eight additional public sources were read at target-relevant sections in this run. The packet
stores URLs, full SHA-256 hashes, editions and exact sections/pages:

- Fargues–Fontaine author-served text dated 16 April 2017: Pierre Colmez's Préface Théorème 2.30
  and Remarque 2.31, pp. 24–25; Proposition 11.2.24 and Lemme 11.2.25, pp. 378–379;
  Remarque 11.3.4, p. 382. Not collated with the 2018 version of record.
- D'Addezio, arXiv:2012.12879v4: §2.2, p. 6; Proposition 3.3.4, p. 11; Theorems 4.1.6
  and 4.2.6, pp. 12, 14–15; Definition 4.4.1, p. 19; §4.4.11, p. 23;
  proof of Theorem 5.1.6, p. 25.
- Dospinescu–Le Bras, Annals 186: Proposition 6.4 and Robba duality citation, pp. 356–357.
- Guo–Reinecke, Inventiones 236: Definition 2.12, Theorem 2.14, Remark 2.15 and
  Proposition 2.17, pp. 35–37; Theorem 6.13 and proof, pp. 97–98.
- Disegni–Liu author-served journal text: Appendix B.1–B.3, Definitions B.1/B.4,
  Lemmas B.3/B.5/B.6, PDF pp. 113–121; footnote 31, PDF p. 115.
- Xu–Zhu author preprint: §2.1.5, p. 10; §2.2 and Proposition 2.2.5, pp. 11–13;
  §2.9.1, p. 25; Appendix A §A.2, p. 64. Published edition not collated.
- Fresán–Sabbah–Yu preprint: §3.2.2, p. 25; Proposition 5.23, Corollary 5.27
  and Remark 5.28, pp. 49–52. Published edition not collated.
- Pan, arXiv:2209.06366v1: Definition 5.1.6 and Proposition 5.1.7, pp. 53–54.
  Not collated with Annals 203 (2026).

The inherited source spine's September 25 receipts remain unchanged; this run is not a new
full proof audit of that spine. The library clearance index was read. Kedlaya's differential-equations
book and Le Stum's rigid-cohomology book are not cleared there and were not obtained or read.
Their missing proof inputs remain gaps. Berthelot's unpublished finiteness/duality material,
Tsuzuki's cited papers, Étesse–Le Stum and Katz–Messing proof interiors also remain unread
inputs as specified in the gap register. Historical access failures do not certify current
unavailability. No source files or passages are included in the repository. No durable step
requires the run's scratch files; their deletion after PR opening is safe.
