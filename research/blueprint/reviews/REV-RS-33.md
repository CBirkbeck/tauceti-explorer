# REV-RS-33 — independent restructuring review

Verdict: **accepted**, with eighteen forwarding links added. Refs #865. Reviewer: Claude Code, session
`cc-58621d`, 29 September 2026. Proposal author: Codex, session `codex-a71f92` (#902). This session did
not write RS-33 and has no other work on this family.

## 1. The extension

`StableHomotopyKTheory` (H) becomes "Algebraic topology of spaces and manifolds, Part II: homotopy
foundations for algebraic K-theory". Its base is the Tau Ceti anchor AlgebraicTopology (AT), which
becomes its first roadmap prerequisite. All twelve stage ids are kept, and seven stages are narrowed.

**Rule 3 applies and is satisfied.**
- **Title.** It is the anchor's exact title followed by ", Part II: …".
- **Base stops before the extension.** No anchor stage has an H ancestor on the current assembled
  atlas; Tau Ceti stages never depend on campaign stages. So the extension starts where its base stops,
  and the defect that sent RS-12 and RS-09 back cannot arise.
- **Application.** `scripts/restructure.py` applies `extends` to a Tau Ceti base, since the anchor is
  in the assembled roadmaps. RS-06 did the same for ModularCurvesPartII over Tau Ceti ModularCurves.
- **The document agrees.** H's own document already opens "Part II to AlgebraicTopology".

## 2. Ownership checked against the anchors

I read the following:
- the member document in full and all twelve stage entries;
- the twenty-five owner records, the links, the family file and the report;
- every anchor stage the proposal imports.

Each import is a real owner:

| Import | Anchor stage and what it plans |
| --- | --- |
| Local systems and twisted chains (H.1) | AT2: "Define a local coefficient system as a functor from Mathlib's fundamental groupoid … Construct twisted singular chains" |
| van Kampen (H.1, H.3) | AT1: van Kampen through the fundamental groupoid |
| Excision (H.3) | AT3: subdivision, excision and Mayer–Vietoris |
| Cellular chains and exact couple (H.1, H.6) | AT4: cellular chains, the skeletal filtration exact couple and the cellular-to-singular comparison |
| Serre fibrations (H.2, H.3) | AT5: the disc-lifting Serre-fibration carrier and "the first-quadrant homology Serre spectral sequence with monodromy local system", over a finite CW base |
| Kan and cubical homotopy, based-pair LES, Hurewicz, Whitehead (H.1–H.3) | AT8: Kan homotopy groups, "prove `TopCat.toSSet.obj X` is Kan", the cubical comparison, relative groups and the based-pair sequence, Hurewicz and Whitehead |
| Coverings and K(G,1) recognition (H.1–H.3) | UniversalCovers 2–4: the lifting criterion, the π_n API and K(G,1) recognition, which says "Constructing a K(G,1) for an arbitrary group is outside this roadmap", so H.1 rightly keeps BG and its bar construction |

**Distinctions worth recording.** The report draws four, and I agree with each:
- the fibre LES is not the based-pair LES;
- a quasi-fibration is not a Serre fibration;
- H.6's convergence is not AT4's skeletal special case;
- the concrete spectrum model and smash product (H.5:spectra) are not the abstract EDS E0/E5 structures.

The `keeps` texts retain every target of the member document: the tests, the Bockstein and Milnor
sequences with nonzero torsion and lim¹ terms, the strictification-independence of group completion,
and the pointed-set end terms.

**Consistency with accepted RS-18.**
- KTheoryLowDegrees Z.1 owns the K0-level complements and cofinality, which H.4 imports while keeping
  the homotopy-level cofinal stabilization.
- GeneralAlgebraicKTheory K.7 owns the ring external K-products. The concrete smash product stays in
  H.5:spectra, which K.7 consumes, as the report says.

**The K.4 node alignment.**
- **The inversion is real.** In `data/decompositions/GeneralAlgebraicKTheory.json` the node
  `K.4/relative-S-construction-fibration-and-delooping` has parent K.4 and links into
  `H.5:S-delooping/iterated-S-construction-omega-spectrum`, while H.5:S-delooping → K.4 is a stage
  edge. So a late parent feeds an earlier stage.
- **The fix fits the contract.** The proposal moves that node and `K.4/waldhausen-additivity-theorem`
  to K.4:construction, which precedes H.5:S-delooping. K.4:construction's own text plans "additivity
  and the delooping theorem".
- The alignment is recorded for integration, not applied here, and that is correct.

## 3. Correction: forwarding for consumers added after the snapshot

The proposal's method is direct links from each named supplier of a narrowed layer to each of its
consumers. At its snapshot (`35e01e96`, 21 September) that set was complete. On the current atlas there
are consumers it could not have seen. The ArithmeticKTheory, HabiroNumberFields and K3BlochGroups
blueprints were promoted on 25 September (`317bafa5`). Their node prerequisites made these stage edges:
- H.1 and H.2 → K3BlochGroups V.1;
- H.3 and H.6 → K3BlochGroups V.4;
- H.6 → ArithmeticKTheory N.5 and N.6;
- H.6 → HabiroNumberFields HB.1 and HB.2.

I extended the proposal's own method to them with eighteen links. The link AT stage 4 → V.4 serves both
H.3 and H.6, so it is added once.

| Narrowed layer | Added supplier → consumer links |
| --- | --- |
| H.1 | UniversalCovers stage 4 → V.1 |
| H.2 | UniversalCovers stage 3 → V.1 |
| H.3 | AT1, AT2, AT3, AT4, AT5, AT8 and UniversalCovers stage 2 → V.4 |
| H.6 | AT4 and ArithmeticGaloisDuality R02.1 → N.5, N.6, HB.1, HB.2; R02.1 → V.4 |

Each is a shortcut of an existing path (supplier → narrowed layer → consumer), so no cycle can arise.
All 174 links were re-tested together on the current atlas and are acyclic.

**One link is inert.** The link from `UPSTREAM:Mathlib-homotopy-and-category-theory` to H.1 names an
upstream sentinel, not a stage; it is already in H.1's `requires` in `data/atlas.json`.
`restructure.py` records it under `skippedLinks`, which is harmless.

## 4. Notes for the orchestrator

1. At application, perform the two parent-only node alignments in the GeneralAlgebraicKTheory
   decomposition that the H.5:S-delooping entry records. Keep the node ids, statements and links.
2. The source gaps the report preserves stay open:
   - the delooping and fibration sources;
   - the plus universal property's target class;
   - the product-realization hypotheses;
   - convergence and fracture.

   Acceptance of this restructuring does not close them.

## 5. Checks and inputs

- `python3 scripts/check_restructure.py research/blueprint/restructure/RS-33.result.json`: ok, before
  and after the correction.
- Graph and forwarding checks were run on the atlas as `scripts/build.py` assembles it at `1aa253a8`.
- Intake file validation on the two deliverables: 0 problems.
- Changes to the proposal: eighteen links and the `review` object. No decision, layer or owner changed.

Pre-review inputs at `1aa253a843acbba60939bacebc51361823c2341f` (SHA-256):

| Input | SHA-256 |
| --- | --- |
| RS-33.result.json | `29afa659b05cc669cd67160f1667dc63d7319716b3ae50743576705dfb9b6df2` |
| RS-33.md | `eee31c707c69a08ed5d67690eaddaf78fb6c88f0dffcc742a22b20e7ef42917e` |
| RS-33.json | `d7c8c6746c5836f4ba38bbcab54e00d0ec537d188df3f90c92105bc63fbc9a6b` |
| StableHomotopyKTheory/README.md | `da54320d434b2ba28f4d12fa79baf790dca02184922ab77d814cc1005c1c24bb` |
| tau-ceti/AlgebraicTopology/README.md | `f894faf00311049f7032eb488d43c75bcfeffbafc528010e72b9b679ca0bef3f` |
| GeneralAlgebraicKTheory decomposition | `6f4955f3b16cd3c8ec496094097e69e87866bf38d8bf7d0a3b65e188149efada` |
| data/atlas.json | `62ab6c2ccb94ee9c4d99813da02b69656941721d30fc29384e2b7e6e86361c56` |

No Lean file is a deliverable; no Lean was run.
