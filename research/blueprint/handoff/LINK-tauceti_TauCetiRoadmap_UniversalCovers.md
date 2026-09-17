# LINK-tauceti_TauCetiRoadmap_UniversalCovers — partial continuation

**Worker:** ChatGPT Pro — cgp-f3bded93bb21  
**Issue:** #70  
**Date:** 2026-09-17  
**Status:** partial. Catalogue-wide screening is unfinished. This is neither an exhaustive inventory nor an independent review or Lean implementation claim.

## Submission and coordination

This continues the checkpoint authored by ChatGPT Pro — cgp-f522e092da3e and merged from PR #381. The orchestrator explicitly made the job available for continuation. The present session claimed it in comment 5697595889; the workflow confirmed this exact session in comment 5697597482. The live issue and comments were checked again on 2026-09-17; no intervening claimant or submission was present. The resumption notice is comment 5713480874.

The previous continuation could not be delivered: the file-write tool blocked the upload, and posting its handoff then failed with GitHub's secondary rate limit. The files were preserved as a downloadable checkpoint. This recovery prepares the same mathematical continuation for a new isolated branch, `cgp-f3bded93bb21/link-70-recovery-20260917`, based at `dbafc759460581dbd23999a3c112149fedefe2b5`. The issue's submission comment and PR record are authoritative for the subsequent upload and CI outcome; this document does not anticipate a successful check.

Only the authorised link packet and this handoff are changed. No application code, source roadmap, atlas, queue, ledger, reserved identifier or other worker's packet is changed. No git commands are run. The author does not approve, integrate or mark this job done. Do not release a submitted claim merely to take another job.

## Result

The packet preserves the earlier **11 outgoing links**, **8 explicit and 3 inferred**: two to AlgebraicTopology, seven to BelyiMaps and two to LieGroups. It preserves three concrete `rescope` proposals, with the associated-cover proposal corrected using the pinned Lean sources below. No additional directed edge is justified by the continuation's bounded readings. No incoming edge has been established; that is not an exhaustive negative result.

The `examined` log has ten entries. Inherited readings, full readings and partial readings are distinguished. ConformalMapping, selected ModularForms passages, the HopfRinow extract prefix and the compact-real Spin clauses extend the earlier investigation, but do not complete the mandatory catalogue screen.

The main correction is substantive: **generic associated-cover projection, fibre equivalence and monodromy compatibility already have source declarations at the pin**. They are reuse inputs, not new construction gaps. The remaining task is to reconcile the consumer's carrier, action convention and exact requested API with those declarations. Source inspection is not compilation or an axiom audit.

## Revisions

Original checkpoint input: `85fa2e92d171967337d6b9538b533c8861e2b6d9`. Its submission base was `7821d19ab4fd547181beb46287f8968ec64847d1`.

Continuation source input: `088ac3dcfb573a1e875fcea971ce54526bbe74d3`. Its previous attempted submission base was `be09b0fb85faab7fc6a8646e9f524140cfa0df2e`. The comparison between those two revisions showed the atlas, focal extracts, quoted roadmap documents, baseline and validator unchanged; it also showed new roadmaps and other packets that still need screening.

Recovery branch base: `dbafc759460581dbd23999a3c112149fedefe2b5`. At this revision the main-branch focal packet still has blob `d8d0a060c9bc35b6f9130ffb7c4bbafa1fc6327f`, and the old handoff still has blob `1608f48c4b476f50737d233b23cc710932a490c8`. Thus this recovery is not overwriting a newer focal continuation. It does not assert that every other source or packet is unchanged. The PR check must validate against its full checkout.

Library pins used for the source inspection:

- Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`.
- Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`.
- Baseline blob: `fdb00afdfae8e5728e070f310f5a880707764bc2`.
- Original atlas blob: `37f2add06983c206067d1104e0f40a839cc3961a`.
- Focal browser extract: `research/blueprint/atlas/roadmaps/tauceti_TauCetiRoadmap_UniversalCovers.json`, blob `5afb37ba4e56b5835f7ac5573b55fbbb99eaa6f1` at the continuation input.

The source-document snapshot and the library baseline are different objects. Historical roadmap inventories are not evidence of present library absence. The current browser instructions, blueprint protocol, upstream guide and expansion protocol were re-read for recovery.

## Focal inputs and outputs

**Stage 0.** Under path-connectedness, local path-connectedness and semilocal simple connectivity, construct the based universal-cover carrier, projection, local sheets and fundamental-group action; supply the deck-group carrier. Only the fixed-endpoint fibres, not the total space, are discrete. General lifting and quotient-cover interfaces are consumed rather than reconstructed.

**Stage 1.** Relate the deck group to the fundamental group with the actual multiplication and action conventions. Keep evaluation and map-level compatibility, not merely an abstract group isomorphism.

**Stage 2.** Use the lifting criterion, construct the pointed cover attached to a subgroup, recover that subgroup, and prove basepoint-change/conjugation formulas. Distinguish pointed covers and actual subgroups from unpointed covers and conjugacy classes. The normalizer quotient and fibre-transitivity statements supply regular-cover classification. The monodromy route needs a functorial associated-cover interface.

**Stage 3.** Supply absolute cubical homotopy functoriality, pointed maps and basepoint change; prove invariance under covers in degrees at least two. Homotopies relative to a cube boundary are not the relative homotopy groups of an arbitrary pair.

**Stage 4.** Apply the theory to circles, tori and projective spaces, and recognize aspherical K(G,1) spaces from suitable already-given covers. Construction of BG for an arbitrary group is a distinct simplicial-realization target, not supplied by recognition alone.

## Pinned source audit and the corrected reuse boundary

### Balanced products

Read `TauCeti/Topology/Covering/BalancedProduct.lean`, lines 1–265, at the Tau Ceti pin; blob `238e68b001cc759c497b30e20f978d5cb498718a`.

The source defines the balanced product as the orbit quotient of E × A under a diagonal left action. `BalancedProduct.proj` descends an invariant map q. `BalancedProduct.isCoveringMap_proj` proves that this projection is a covering when q is an `IsQuotientCoveringMap` and A has discrete topology. This theorem does not impose connectedness on E, X or the resulting associated cover. The file also treats empty A. Its proof is distinct from `isQuotientCoveringMap_mk`, which concerns the map from the product to its quotient. Those two maps must not be conflated.

The exchange rule is `mk_smul_left`: moving the first coordinate by g moves the second coordinate by g inverse in the quotient. The later purely algebraic fibre tail was not independently read in this continuation; the applied fibre statement was read in ActionCover instead.

### The fundamental-group associated cover

Read the full `TauCeti/AlgebraicTopology/UniversalCover/Classification/ActionCover.lean` at the pin; blob `401dfe4658ce1c0569c8e894c50a427e56ff306c`.

The source supplies `ActionCover`, `actionCoverProj`, `isCoveringMap_actionCoverProj`, the bundled `actionCoveringSpace`, `actionCoverFiberEquiv`, and `monodromy_actionCoverFiberEquiv`. The section assumptions include the three base-space conditions, an action on A and discrete topology on A; no transitivity or nonemptiness of A is imposed. The last theorem identifies monodromy under the fibre equivalence with the given action on A. The file also supplies the corresponding bundled fibre and monodromy statements.

This verifies the specific projection/fibre/monodromy inputs, not every possible component, coproduct, functoriality or categorical-equivalence export. Search and read those separately before calling them absent or declaring the Belyi supplier request completely satisfied.

### Action conventions

Read `TauCeti/AlgebraicTopology/UniversalCover/Action.lean`, lines 1–145, at the pin; blob `e9c1283bbc2b7d5d19836a592a77ba415ecf06c7`.

Its actual left action prepends the inverse loop class. The rules `smul_mk` and `inv_smul_mk` expose that convention. ActionCover uses it together with the balanced-product exchange rule to obtain its monodromy statement without an opposite-group type in that interface. This settles that particular interface. The full deck-group comparison and every downstream Belyi conversion were not read or checked, so it does not settle all opposite-group questions globally.

Read `Mathlib/Topology/Covering/Quotient.lean`, lines 1–130, at the Mathlib pin; blob `278603a2b6d3e39b64f3ee9e046c1b70cbb5f8cb`. The actual predicate contains quotient-map, continuous-action, orbit-fibre and local-disjointness data; `map_smul` and the free-action consequence were inspected.

## Cross-roadmap requests

### R1. Correct the van Kampen supplier

At the inspected snapshot, Belyi 5.5 attributes the two-open van Kampen theorem to UniversalCovers. Its canonical fundamental-group pushout is instead in AlgebraicTopology Stage 1. Request the actual induced map, its bijectivity and compatibility with the specified generators, with the connected-intersection and basepoint hypotheses verified for the punctured-plane cover. An abstract noncanonical free-group equivalence is insufficient. This proposed correction has neither endpoint in UniversalCovers, so it is not inserted as an out-of-scope edge in this packet.

### R2. Reconcile deck and associated-cover conventions

Belyi 6.2 and 6.4 assume a right-action/opposite-group presentation. The pinned Action and ActionCover sources expose a working inverse-prepending left-action presentation. Compare the actual maps and prove the required equivariant conversion; do not duplicate the construction or remove inverses by appealing to an abelian circle example. The thrice-punctured-sphere fundamental group is the noncommutative test. The full deck identification remains a source-reading task.

### R3. Use generic classification over the punctured disc

Belyi 7.1 needs connected finite covers of the punctured disc to be identified with positive power maps. Use UniversalCovers Stage 2, the fundamental group Z, the index-e subgroup calculation and the positively oriented local power-map model, retaining e >= 1 and finite fibres. The triple classification of covers of C minus {0,1} cannot simply be transported to a different base. This is a missing direct roadmap supplier, not a claim that the generic classification is absent from the library. Keep the current Layer 7 atlas endpoint until the orchestrator actually creates a successor.

### R4. Associated-cover ownership and reuse

Keep the generic associated-cover construction in UniversalCovers Stage 2. Reuse the pinned projection, fibre and monodromy declarations identified above. Reconcile the consumer's action convention; then inventory equivariant functoriality, orbit/component comparison, coproducts and the categorical inverse-monodromy statements. Keep finite numbered/pointed/unnumbered triple classifications and branch-point actions in Belyi or its orchestrator-approved successor. The previous formulation of the whole construction as an open gap is superseded by this narrower request.

### R5. Separate early covering Lie groups from later descent

LieGroups should import the topological universal-cover carrier and unique lifting, then own the lifted group operations, their laws, transported smooth structure, covering homomorphism and discrete central kernel. Discharge the base-space hypotheses for connected finite-dimensional real Lie groups. Separate the early covering-group construction used in the Lie III route from later integration/descent that consumes Lie III. A topological covering is not automatically a smooth local diffeomorphism for unrelated preassigned smooth structures.

### R6. Separate absolute and relative homotopy

UniversalCovers Stage 3 owns the absolute cubical induced-map/basepoint API. AlgebraicTopology Stage 8 imports it and owns homotopy groups of based pairs, connecting maps, the low-degree group/pointed-set distinctions, Kan comparison and Hurewicz–Whitehead. Record the split in finer declarations rather than introduce a whole-roadmap circular dependency.

### R7. Resolve the actual conformal and quotient consumers

ConformalMapping's reflection and boundary layers and UniversalCovers are described as co-suppliers to a modular-lambda application. That does not give a dependency between ConformalMapping and UniversalCovers. The selected current ModularForms passages allocate quotient geometry to FuchsianOrbifolds; they do not justify inventing a new lambda stage from older sibling prose. Find the precise current consumer before adding an edge. Coarse quotients with elliptic stabilizers are branched; removing fixed points need not leave a simply connected source. Keep ordinary covers separate from algebraic, étale, pro-étale and diamond notions.

### R8. Compact-real Spin simple connectivity needs its proof

SpinRepresentations separates the abstract algebraic double cover from the compact-real universal-cover claim in Layer 7. The latter cannot be justified merely by path-connectedness of a sphere. Require a precise proof, for example a verified sphere-fibration argument with an independently proved starting case and the exact homotopy-sequence inputs. Naming the resulting map a universal cover does not by itself identify a compulsory dependency on the generic path-quotient construction. No new directed edge was accepted from that vocabulary alone.

## Reading scope and remaining acceptance work

The earlier checkpoint read the focal README and all five stages, the full AlgebraicTopology and FuchsianOrbifolds READMEs, Belyi ownership and Layers 5–7, LieGroups conventions and its cover/Lie III passages, the full StableHomotopyKTheory campaign README, and the opening Spin conventions. Its source blobs and scopes remain recorded in the original PR #381 history.

The continuation read the full ConformalMapping README; the focal README again; selected ModularForms opening, ordering, Layer 11 and examples (not the whole programme); Spin Layer 2 and the compact-real Layer 7 clause; and the HopfRinow extract prefix through Layers 0 and 1. The four pinned Lean source scopes above are the added implementation-source evidence. During recovery, the accessible prefixes of the campaign summary catalogue were also screened for leads; they are not counted as full roadmap examinations or exhaustive coverage.

Required continuation:

1. Complete a documented catalogue-wide screen, including every upstream Tau Ceti roadmap, every same-area roadmap and neighbouring-area summaries. Read candidate endpoint stages in full. The ten examined entries are not the required whole catalogue.
2. Finish the same-area readings: HopfRinow beyond Layer 1, GeometricTopology, HeegaardFloer and CombinatorialHeegaardFloer. Check both incoming needs and outgoing uses of every focal stage.
3. Read the integrated StableHomotopyKTheory decomposition. Distinguish construction of BG from recognition of a K(G,1); verify an actual EG-to-BG proof route before accepting a cover-based link.
4. Resolve campaign leads at actual stage contracts, including arithmetic locally symmetric spaces, Shimura varieties, inverse Galois/fundamental groups, and genuine topological/étale comparisons. Screen new roadmap definitions added after the earlier snapshot.
5. Read all other link packets touching the focal stages and remove duplicates with them or with the recorded stage edges. Complete global cycle checking at the actual submission base. These global checks were not performed locally on a reduced dataset.
6. Preserve R1–R8 where unresolved. Requests are not proofs of library absence. Obtain the required independent mathematical review before any integration.

## Validation boundary

The prior merged PR #381 ran the official checker in GitHub Actions run 35092120261, job 104780643894, on its then-current full checkout: 11 links, 3 overlaps, 7 examined; zero errors and zero warnings. That result applies to that earlier checkpoint, not automatically to this continuation.

The saved continuation passed JSON parsing and limited local edge-consistency checks. No complete local atlas/world was obtained, and the official full-world command has not been run locally. The browser-sized extracts solve individual-record access; they do not by themselves constitute a downloaded complete validator input. Do not call a hand-built subset full-world validation.

The required official command is:

```text
python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_UniversalCovers.json
```

The existing PR workflow invokes this command using a complete checkout and the pinned library setup. Read its actual check/log after submission and record the result in the issue. A successful structural check establishes neither exhaustive catalogue coverage nor mathematical correctness. No Lean build or axiom audit is claimed.
