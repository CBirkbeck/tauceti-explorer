# Handoff: ASM-HabiroCohomologyFoundations (issue #237)

Assembly of the roadmap *q-Hodge filtrations and Habiro cohomology* from its two reviewed parts, HQ.1–HQ.7 (REV-HabiroCohomologyFoundations--HQ.1, #2903) and HQ.8 (REV-HabiroCohomologyFoundations--HQ.8). Worker: Claude Code, session cc-38267a. I took no part in either part or in their reviews.

## Files

- `research/blueprint/readmes/HabiroCohomologyFoundations.md`: the full roadmap document (new).
- `research/blueprint/suggested/HabiroCohomologyFoundations.lean`: the joined suggested Lean file (new).
- `research/blueprint/packets/HabiroCohomologyFoundations--HQ.1.json` and `--HQ.8.json`: prose counts corrected; see below.
- `research/blueprint/handoff/ASM-HabiroCohomologyFoundations.md`: this note.

## What was done

- **The roadmap document.** Both reviews ended `needs_changes` for one reason only: the part documents still described the uncorrected packets, which had grown from 66 to 118 nodes and from 15 to 17. The assembled document is therefore generated from the two corrected packets, so that it agrees with them node for node: every statement, hypothesis, proof outline, API item, unit test, acceptance check, dependency and source excerpt. The introduction is written for it: purpose and scope, boundaries against the supplier and consumer roadmaps, conventions, sources with their versions and hashes, the pinned library declarations, and a layer overview. The closing sections merge both parts' source issues, gaps, requests and structural proposals. All 429 excerpts appear verbatim.
- **Notation.** The parts wrote `qdR`/`q-dR`, `qΩ`/`q-Ω`, `qHdg`/`q-Hdg`, `qW_m`/`q-W_m` and 'decalage'/'décalage'. The document uses Wagner's hyphenated forms and 'décalage' throughout its prose, and says so under Conventions; Lean names, code spans and literal excerpts keep their own form. The packets are unchanged in this respect.
- **Cross-part prerequisites.** Every HQ.8 prerequisite pointing into part one names an existing HQ.1 node id, and HQ.1 never refers to HQ.8; nothing needed fixing. The node graph and the stage graph are acyclic, checked against atlas `requires` and `stageEdges` and the node prerequisites of every packet on main, with the reviewed HabiroRings packet (PR #2907).
- **`check_blueprint.py --index`**: 0 errors and 0 warnings on both part packets.
- **The Lean file.**
  - It is the two reviewed part files, joined with one module note, one import block (the union, 52 Mathlib modules) and the two bodies in order, part one then part two.
  - Both are in the namespace `TauCeti.HabiroCohomology`, and no name clashes.
  - It elaborates with `lake env lean` against Mathlib 082e2d3 with exit code 0; the only warnings are 428 `declaration uses 'sorry'`, the parts' 425 and 3.
  - Part one's `set_option autoImplicit false` is kept: it only makes elaboration stricter.

## Changes to the part packets

No node's mathematics was changed, and no review verdict was touched. Only prose counts that predated the reviews were corrected:

- **Coverage notes.** Seven coverage notes opened with the pre-review node count. They now give the actual count and how many nodes the review added:
  - HQ.1: 18 nodes, 10 added;
  - HQ.2: 11, 3 added;
  - HQ.3: 24, 10 added;
  - HQ.4: 30, 17 added;
  - HQ.5: 25, 11 added;
  - HQ.5-trace: 5, 1 added;
  - HQ.8: 17, 2 added.
- **Summaries.** HQ.1's summary said 'Sixty-six nodes' and 'Three misprints'; it now gives 118 nodes and 29 source issues. HQ.8's said 'Fifteen nodes'; it now says seventeen.

## Structural proposals of the parts

- **The restructuring proposal for this family has not been accepted, so this packet follows the current atlas** (HQ.1, note-structure-not-accepted). The proposal RS-10 assigns this roadmap a narrowed HQ.1 and HQ.4 and moves the positive-degree q-de Rham-Witt theory to a draft roadmap on q-Witt vectors. Its recorded review status is that changes are needed: the report requires removing seven existing atlas edges, sixty-five supplier links for the narrowed layers are missing, and three of its target roadmaps, including the q-Witt one and the analytic Habiro stack, are not in the atlas at all. The job instruction is then to work with the current structure and say so, which is what this packet does: HQ.4 plans the positive-degree q-de Rham-Witt complex, its Frobenii, its ghost maps and its etale base change, and HQ.1 plans the whole global gluing. A worker who picks up this roadmap after RS-10 is accepted must not plan that material a second time in the q-Witt roadmap; the thirteen nodes of HQ.4 and the first six of HQ.1 are exactly what would move.
- **HQ.2 is asked to prove a statement about objects defined in HQ.3** (HQ.1, propose-link). The stage text of HQ.2 assigns the proposition comparing the underived q-de Rham complex with the q-Hodge completion of the derived one and with the decalage of the q-Hodge complex. Both halves of that statement quantify over pairs of an algebra and a chosen q-Hodge filtration, which is the object HQ.3 defines, and the second half mentions the Habiro-Hodge complex, which HQ.3 constructs. The packet follows the stage text and places the node in HQ.2, with prerequisites on three HQ.3 nodes. Either the atlas should record a supply edge from HQ.3 to HQ.2 for this statement, or the statement should move to HQ.3; as things stand the layer ordering suggests a dependency that runs the other way.
- **HQ.5 carries three independent bodies of work** (HQ.1, propose-split). HQ.5 asks for the smooth existence theorem with its dimension-dependent inversion of small primes and its partial-operad multiplicativity; for the quasi-regular existence theory under condition (R) with its own construction, its own base change and its own monoidality; and for the export of the completed cohomology object to the coefficient roadmap. The three share only the definition of a q-Hodge filtration: the smooth theory works with a truncation adjunction on filtered objects, the quasi-regular theory with one-categorical preimages inside static rings, and the export with the etale specialisation of the descent theorem. For the atlas they would read better as three sub-layers, and the fourteen nodes of this packet already fall into the three groups of six, six and two.
- **HQ.7 is audited as a process layer but is planned here as two nodes** (HQ.1, note-audit-verdict). The reviewed library audit gives HQ.7 the verdict that it is a process layer, and the job instruction says that such a layer is not mathematics and should get no nodes. This packet nevertheless plans two nodes for it, as the packet for the coefficient roadmap did for its own acceptance layer: the acceptance suite is a list of statements with concrete witnesses, each naming the node it exercises, and the executable boundary is a statement about what the suggested Lean file does and does not prove. Both are checkable claims rather than process. The alternative would be to close HQ.7 with no nodes and to move the acceptance tests into the acceptance lists of the nodes they exercise, where most of them already appear; that would be a reasonable restructuring but would lose the four structural checks, which are about the roadmap as a whole and belong to no single node.
- **The syntomic squares belong to the trace roadmap, not to this atlas** (HQ.8, note-ownership). The stage text names the trace roadmap's quasi-syntomic comparison among the inputs and fixes the order in which it may be used. This packet takes that further: the squares whose corners are topological, namely those relating topological Hochschild homology and its variants to prismatic cohomology, are stated by that roadmap and not here, and this atlas records only the staging rule and the fact that its own squares do not depend on them. If the atlas were later to absorb those squares it would have to absorb their hypotheses as well, and the risk the staging rule guards against would return. The recommendation is to leave the syntomic squares where they are and to ask that roadmap to state them in the seven-item form.
- **There is no etale square, and the reason should be recorded in the atlas rather than inferred** (HQ.8, note-missing-square). The stage text lists the global compatibility of the classical comparisons among the inputs, and a reader may expect a square with an etale corner. There is none, because the only available route is the A-infinity square followed by the classical comparisons, and the composite is an equivalence only along a composite of base changes neither of which is conservative. This packet records that in the information-loss ledger and in a gap. A cleaner structure would be for the stage text itself to say that the etale corner is reached only through the perfectoid base, so that the absence is visible before a worker starts.
- **HQ.8 mixes a discipline and a list of theorems** (HQ.8, propose-split). Three of the fifteen nodes fix a discipline: what a square records, what the atlas does not prove, and the staging rule; two more are the ledger and the acceptance suite. The remaining ten are the squares and the theorem that they commute. For the atlas the two halves would read better as sub-layers, one for the record and the discipline and one for the squares, since a reader who wants the comparison statements does not need the discipline first, while a reviewer checking the discipline does not need the squares.

## Requests of the parts

| Supplier | Part | Needed by |
|---|---|---|
| `AInfCohomology:AI.1` | HQ.1 | 7 nodes |
| `AnalyticHabiroStack:HS.3` | HQ.1 | 1 node |
| `CohomologyComparisons:CP.1` | HQ.1 | 0 nodes |
| `CohomologyComparisons:CP.6` | HQ.1 | 0 nodes |
| `CrystallineCohomology:CR.0` | HQ.1 | 7 nodes |
| `CrystallineCohomology:CR.2` | HQ.1 | 4 nodes |
| `CrystallineCohomology:CR.4` | HQ.1 | 2 nodes |
| `DerivedDeRhamCohomology:DD.0` | HQ.1 | 3 nodes |
| `DerivedDeRhamCohomology:DD.1` | HQ.1 | 15 nodes |
| `DerivedDeRhamCohomology:DD.2` | HQ.1 | 27 nodes |
| `DerivedDeRhamCohomology:DD.3` | HQ.1 | 2 nodes |
| `DerivedDeRhamCohomology:DD.4` | HQ.1 | 6 nodes |
| `EnhancedDerivedSheaves:E0` | HQ.1 | 1 node |
| `EnhancedDerivedSheaves:E1` | HQ.1 | 2 nodes |
| `EnhancedDerivedSheaves:E4` | HQ.1 | 1 node |
| `EnhancedDerivedSheaves:E5` | HQ.1 | 7 nodes |
| `EnhancedDerivedSheaves:E5:abstract` | HQ.1 | 6 nodes |
| `EnhancedDerivedSheaves:E5:presentability` | HQ.1 | 1 node |
| `HabiroCyclotomicCompletions:HC.1` | HQ.1 | 0 nodes |
| `HabiroCyclotomicCompletions:HC.3` | HQ.1 | 1 node |
| `HabiroRings:HR.1` | HQ.1 | 0 nodes |
| `HabiroRings:HR.2` | HQ.1 | 0 nodes |
| `HabiroRings:HR.3` | HQ.1 | 0 nodes |
| `HabiroRings:HR.4` | HQ.1 | 5 nodes |
| `HabiroRings:HR.5` | HQ.1 | 0 nodes |
| `PerfectoidQuotients:Q3` | HQ.1 | 1 node |
| `PrismaticCohomology:PR.0` | HQ.1 | 10 nodes |
| `PrismaticCohomology:PR.2` | HQ.1 | 2 nodes |
| `PrismaticCohomology:PR.3` | HQ.1 | 8 nodes |
| `PrismaticCohomology:PR.6` | HQ.1 | 21 nodes |
| `RefinedTraceMethods:RT.4:Habiro-comparison` | HQ.1 | 1 node |
| `RefinedTraceMethods:RT.4:q-Hodge` | HQ.1 | 3 nodes |
| `RefinedTraceMethods:RT.6` | HQ.1 | 1 node |
| `AInfCohomology:AI.1` | HQ.8 | 3 nodes |
| `AInfCohomology:AI.3` | HQ.8 | 1 node |
| `CohomologyComparisons:CP.1` | HQ.8 | 1 node |
| `CohomologyComparisons:CP.6` | HQ.8 | 1 node |
| `CrystallineCohomology:CR.4` | HQ.8 | 1 node |
| `DerivedDeRhamCohomology:DD.1` | HQ.8 | 1 node |
| `DerivedDeRhamCohomology:DD.2` | HQ.8 | 1 node |
| `PrismaticCohomology:PR.0` | HQ.8 | 2 nodes |
| `PrismaticCohomology:PR.1` | HQ.8 | 1 node |
| `PrismaticCohomology:PR.3` | HQ.8 | 3 nodes |
| `PrismaticCohomology:PR.6` | HQ.8 | 4 nodes |
| `RefinedTraceMethods:RT.6` | HQ.8 | 1 node |

The needs themselves are in the roadmap document's Requests section and in the packets.

## For the orchestrator

- **Promotion.** The reason both part reviews gave for `needs_changes` was the stale part documents, and this assembled document replaces them. Whether that is enough to change the verdicts is for a reviewer to decide; this job did not change them.
- **The part documents are superseded.** `readmes/HabiroCohomologyFoundations--HQ.1.md` and `--HQ.8.md` describe the uncorrected packets. They are not among this job's files, so they were not edited, but they should not be promoted.
- **A stale note in HabiroRings.** REV-HabiroRings (PR #2907, merged) added the restructure entry 'The HabiroCohomologyFoundations HQ.1 packet makes HQ.3 and HQ.5 depend on HR.6'. It was checked against a copy of main taken before the HQ.1 review (#2903) removed those edges. With the current packets there is no such cycle, and that entry and the matching paragraph of REV-HabiroRings.md are obsolete. They are outside this job's files and should be removed.
