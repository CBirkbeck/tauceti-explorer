# LINK-SpinRepresentations handoff

Worker: **ChatGPT Pro — cgp-797896f1d145** (w2).
Job: `LINK-tauceti_TauCetiRoadmap_RepresentationTheory_SpinRepresentations`.
Issue: #67. Claim comment: 5696618729; explicit bot acceptance: 5696620345.
Branch: `w2/cgp-797896f1d145/link-spin-representations`.

## Result and integration status

The accompanying `research/blueprint/links/tauceti_TauCetiRoadmap_RepresentationTheory_SpinRepresentations.json` is a links-v1 proposal with **16 incoming links, 2 outgoing links, 6 overlaps, and 211 other roadmaps recorded**. It is ready for independent link review, not integrated or approved. No Lean implementation, library-availability certificate, or theorem proof is claimed. The links describe precisely delimited supplied interfaces, not a claim that every hypothesis needed by the consumer has already been discharged.

Incoming partners are QuadraticFormInvariants, GlobalQuadraticForms, ClassicalGroups, RootSystems, LieHighestWeight, ReductiveGroups and UniversalCovers. Outgoing links supply Clifford finite-dimensionality to QuadraticFormInvariants and the general-field spinor-norm interface to GeometryOfNumbersAndQuadraticArithmetic. Overlaps concern split Clifford structure, classical/Spin branching, the generic gl_n toolkit versus its CAR application, integral versus complex triality, integral CFSG spin carriers, and shared D4 diagram data. No entire roadmap should be merged on this evidence; the concrete rescoping proposals are in the packet.

## Revisions and source recovery

The mathematical input revision and branch base are `06324eb3a84b57956b9a72e2249e0fd9ea654bf7`. The atlas blob is `37f2add06983c206067d1104e0f40a839cc3961a`; the target README blob is `5f6b908d0666e50886082a18f8946808f9a1b761`.

The large atlas could not be returned by the connector file reader. It was recovered, together with source documents and the validator, from the GitHub Pages artifact **10443541694**, workflow run **35089386127**, whose head is the same input commit. The downloaded ZIP SHA-256 is `7f8cffa5a2aa12303e4490f30a406a20312f78feb304896fd392b4c52989b7e8`. Its recovered atlas and target README were checked against their GitHub blob hashes using the blob hashing formula, without running git. The packet records fingerprints for all quoted source documents.

Pinned baseline, read from `research/blueprint/baseline.json`:

- Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`.
- Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`.
- Baseline blob: `fdb00afdfae8e5728e070f310f5a880707764bc2`.

At recheck, `main` was `7821d19ab4fd547181beb46287f8968ec64847d1`. GitHub's comparison with the input showed seven newer commits but no change to `data/atlas.json`, the source roadmaps, baseline, or link validator. The new `research/blueprint/atlas/` files are generated browser extracts, not new roadmap definitions. The updated BROWSER_AGENTS.md was read in full; its blob is `75ae064dee2fdbf87c7331475520ce445604788d`. The links directory remained absent at this recheck; no competing packet was substituted. The claim was still uncontested. A live PR search for SpinRepresentations found a classification checkpoint (#351), not a submission for this link job.

## What was actually read and searched

All 212 atlas summaries were read. All roadmap documents and all 1,968 stage records were searched for the target objects, synonyms and interfaces. The catalogue includes all 60 upstream roadmaps and all 21 algebra-area roadmaps, counting the target. `examined` lists each of the other 211 roadmaps exactly once. Its short `screened` notes mean summary inspection plus document/stage search, **not** a claim to have read every line of every roadmap.

The complete SpinRepresentations, ClassicalGroups and RootSystems READMEs were read. All ten target stage descriptions were checked against the target document and read in full. Every retained link and overlap was decided after reading the full candidate stage descriptions. Additional relevant conventions and stages were read in LieHighestWeight, ReductiveGroups, QuadraticFormInvariants, GlobalQuadraticForms, UniversalCovers, LieGroups, CFSGStatement, SemisimpleAlgebras, CompactGroups and AlgebraicTopology. The CAR worked examples in LieHighestWeight and the CFSG L1 diagram-permutation table were checked separately. EndoscopicTransfer ET.2/ET.2b and the relevant arithmetic, lattice, coding and Floer passages were also examined.

The two evidence quotes on each link are verbatim source substrings. Each carries its repository path and one-based start/end lines at the input revision. The extra CFSG/Spin overlap also includes two located excerpts. References to books inside a roadmap were not treated as independently verified source theorems: this job verifies roadmap-to-roadmap interfaces, not the underlying bibliographies. No declaration-level claim was made from current Mathlib documentation or from a roadmap's potentially stale library inventory.

## Target stage input/output audit

| Layer | Inputs | Outputs and boundaries |
| --- | --- | --- |
| 0 | Clifford universal property, exterior algebra, invertibility of 2 for comparison | Parity grading, multiplicative degree filtration, associated-graded exterior comparison and dimension. The module equivalence is not a graded-algebra isomorphism. |
| 1 | Regular quadratic forms, characteristic not 2, normal forms, the construction/matrix-unit portion of layer 4 | Explicit full/even Clifford matrix or product structure. Numerical layer order is not dependency order. |
| 2 | Isometries, reflections, Cartan–Dieudonne, generator embedding and parity | Twisted-conjugation covers; complex surjectivity and kernel; general-field spinor-norm image. Topological universality is separate. |
| 3 | Polar-form normalization, Clifford generators and orthogonal Lie algebra | Bivector Lie realization and generator action. The differential statement additionally needs an actual group/Lie comparison. |
| 4 | Complex maximal-isotropic splitting, dual pairing, creation/contraction and parity | Spinor and half-spin modules, matrix units, irreducibility. The odd full-Clifford action is not faithful. |
| 5 | Layers 3/4, B/D root datum and numbering, Cartan/Borel and highest-weight theory | Fundamental highest weights and formal characters. Lie-module identification precedes the separately justified group statement. |
| 6 | Clifford structure, spin modules, classical standard modules | Exceptional low-rank group isomorphisms, including defining equations and both image inclusions. Root-system coincidence alone is insufficient. |
| 7 | Real signature convention, Clifford tensor/even operations, qualified covers and topology | Real algebra periodicity/classification and compact Spin universality with rank restrictions. This is not a proof of topological K-theory Bott periodicity. |
| 8 | D4 data, diagram action, fundamental modules, octonions and an actual group-automorphism lifting theorem | Representation/group triality distinguished; invariant trilinear form. The Clifford/Chevalley comparison is additional work. |
| 9 | Bivector realization, invariant forms, semisimple and reductive highest-weight/isotypic/Pieri tools | Kostant/CAR decomposition for the correct action. Left multiplication is not the commutator action; the gl_n central character is not silently discarded. |

## Unresolved interfaces and rescoping instructions

1. **Weight-lattice ownership.** RootSystems README lines 45–50 assigns the lattice/fundamental-weight apparatus to LieHighestWeight, while LieHighestWeight lines 163–168 assigns it back to RootSystems. RootSystems layer 6 nevertheless explicitly supplies the named integral B/D root data and their fundamental-weight basis. Retain that qualified input edge, but assign the generic lattice construction and prove the concrete Cartan-to-root-datum comparison. Neither circular prose reference is a completed supplier.

2. **D4 diagram action and actual group triality.** Spin layer 8 requests the graph symmetry from RootSystems; RootSystems does not explicitly target that automorphism. CFSG L1 does specify the outer-node cycle `(0 2 3)`, fixing index 1, and asks for its Cartan-matrix compatibility. Share that combinatorial contract under RootSystems layer 6, extend it to the simply connected integral root datum, and use ReductiveGroups layer 9's pinned-group lifting theorem. Spin must identify its Clifford-defined complex group with the pinned Chevalley group before transport. Keep CFSG Frobenius commutation and twisted fixed points downstream; do not make their whole finite-field construction a prerequisite of complex triality.

3. **Group versus Lie algebra.** Choose an analytic route with the needed complex-linearity comparison or an algebraic group-scheme route. Construct the smooth/affine carrier and prove that differentiating the restricted spin representation gives the bivector action. LieGroups' real Lie functor alone is not this complex comparison. Half-spin does not become an SO representation merely because its Lie algebra is so.

4. **CAR dependency cycle.** LieHighestWeight layer 9 supplies generic gl_n classification, dual-standard Pieri and isotypic criteria to Spin layer 9. Its worked example, lines 797–803, refers back to Spin's CAR module and highest-weight calculation. Keep the forward toolkit edge, and move the reverse application to a later substage rather than adding a reverse aggregate edge. Before applying reductive complete reducibility, prove the central CAR action semisimple; its scalar computation supplies this hypothesis. Preserve the trace-form and half-integral central-weight conventions.

5. **Spin branching and GT boundary.** ClassicalGroups layer 6 points Spin branching to this roadmap, but Spin layer 5 provides only the stated first Lie-level B-to-D restriction, not the full group-level branching/normalized GT package. Assign explicit subgroup embeddings, both parity steps, group/Lie compatibility and the GT comparison. Do not label the existing layer a supplier of the stronger theorem.

6. **Integral carriers.** CFSG L0 and ReductiveGroups layer 9 need integral Chevalley matrices, group-scheme faithfulness and positive-characteristic specialization. Complex Clifford irreducibility does not supply these. Keep both scopes, share a future integral model and compare its complex specialization. Likewise keep QFI's general-field central simplicity/Brauer invariants distinct from Spin's split matrix models.

7. **Compact topology and coarse internal stages.** Spin layer 7 proposes simple connectivity from sphere path-connectedness; a complete proof needs more. Supply the appropriate fibration/low-homotopy induction and its initial cases, or another full proof. AlgebraicTopology layer 5's homological Serre spectral sequence is not a homotopy exact sequence, so no false supplier edge was added. Separately, split layer 4's Fock construction/matrix-unit argument from the consequences of layer 1's structure theorem when implementing their order. The current atlas has no recorded stage edges touching Spin, so its cycle check cannot by itself diagnose these internal substage issues.

These are concrete remaining mathematical/interface tasks, not omissions concealed by `state:done`. The packet records their qualifications without editing another owner's roadmap or inventing reserved stage IDs.

## Validation actually performed

From the reconstructed input tree, with only the authorized packet added:

```sh
python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_RepresentationTheory_SpinRepresentations.json
```

Result: **18 links, 6 overlaps, 211 examined; 0 errors, 0 warnings**. An additional session-local audit checked exact catalogue coverage and uniqueness, all **38 raw excerpts and line locators**, source blob hashes, and absence of duplicate edges against `stageEdges` and available link packets. It passed. The repository validator checked the proposed graph against recorded edges for cycles.

The local packet SHA-256 before upload is `bf0b58b967e12e5bdf78060e001d84c01ba6a5fff86c580bc5446f78504fb68f`. GitHub file equality and PR checks must be reported from their actual results, not inferred from this local pass. No Lean build, independent mathematical review, or CI pass is asserted here. A structural validator is not a proof of the mathematical link judgments.

## Integration and resumption

Only the link JSON and this handoff are authorized repository changes. No git command, default-branch push, merge, approval, issue closure or done-state change was performed. The handoff records a produced proposal, not an independent review of our own work. The maintainer/orchestrator should arrange independent review of all 18 arrows and six overlaps, resolve the named ownership questions, and integrate accepted links. A later worker should recheck input revisions and existing packets before amending this file; do not recompute over another worker's newer output or release this session's submitted claim merely to start another job.
