# BP-K3BlochGroups--V.1 — completed planning pass

Issue #6381. Worker: Codex, session `codex-gJs6Vl`. The bot confirmed the claim before work began. This is a complete target-level planning submission, not a checkpoint. Scope is exactly `K3BlochGroups:V.1`; no other part or parent packet is edited.

## Delivered

The packet, reader and suggested file share the suffix `K3BlochGroups--V.1`. The accepted parent packet remains authoritative for its existing IDs. Ten new nodes refine those targets: five theorems, two comparisons, two constructions and one application. The constructions have thirteen API items and eight unit tests. Four planets mark the homological comparison, bar-cycle model, Suslin lemma and elementary-homology quotient. All implementation statuses remain unchecked.

The canonical comparison fixes the composite and inverse directions, rather than choosing an abstract isomorphism. Evaluation uses Mathlib's existing integral unnormalised cycles and homology projection. Equality has a finite four-chain boundary certificate. Ring maps transport certificates. Finite-stage lifting accounts separately for finite support and eventual equality; it assumes neither finite-stage injectivity nor a uniform stable rank.

The topology imports the accepted homotopy foundation's finer classifying-space, plus-UCE and fibre-LES nodes. It requests the exact normalization bridge and based naturality. The general H-space lift belongs to upstream UniversalCovers; V.1 records only its ring-specific application. The generic H-space lemma has no ring-cover prerequisite. Its ring application uses the actual simply connected covering model, the external integral K-product and the natural outgoing map through Steinberg-to-elementary homology.

The explicit `K2SymbolsBrauer:T.1:classical → K3BlochGroups:V.1` edge and stable-UCE imports resolve confirmed finding RT-AREA-ktheory-1/29 without duplicating the supplier. The current atlas has no reverse dependency path for that edge or the proposed supplier inputs. The later K.2 low-degree comparison, which consumes V, is not imported.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/K3BlochGroups--V.1.json`: zero errors, zero warnings.
- `lean-check research/blueprint/suggested/K3BlochGroups--V.1.lean`: exit status zero; twenty-five warnings, all declarations using `sorry`, and no errors. This used the shared existing build and exact pinned Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The file imports only Mathlib. Tau Ceti sources were inspected at exact pin `f790474821cf4256814db967cb154e7af3d0c369`; no Tau Ceti module is imported by the suggested file.
- All thirteen construction API names and eight test names occur in the suggested file. Its algebraic transport signatures use existing carriers and actual additive maps/isomorphisms. Definitive topological signatures whose suppliers have no Lean API are explicitly omitted under Protocol §13. Compilation does not establish the mathematical comparisons.
- Twenty-one cited baseline declarations were read at the pin. The reviewed audit, full issue, protocols, links/restructuring inputs, supplier decompositions, and upstream AlgebraicTopology and UniversalCovers documents were read. Public Zulip/archive searches and targeted open Mathlib PR title searches found no relevant Hopf/Whitehead/plus implementation proposal; existing bar vocabulary is preserved.
- Source-version validation passes for the new source finding. Only the issue's four deliverables are submitted. `git diff --check` was run before submission.

## Open boundaries and where to resume

The packet is **complete**; V.1 is **planned**, not closed. Three gaps and ten supplier requests remain. Independent review should check the refinements and source finding before a follow-up closes these boundaries.

1. **G1:** supply the generic Hopf, Whitehead and low-degree wedge calculation once in the early homotopy foundation. Hatcher Examples 4.51–4.52 and Exercise 37 give the route read here; full Hilton–Milnor is unnecessary. The extension brief includes infinite-wedge finite-subcomplex reduction, unordered Whitehead indexing and H-space additivity.
2. **G2:** source and decompose the compatible finite-set BPQ/sphere-unit package, stable η's transposition class and precomposition/action equality. The K-book cites a proof not acquired in this pass. A bare spectra carrier or abstract BPQ isomorphism does not discharge this gap. Coordinate this shared package with the parent's V.4 needs; K.7 retains ownership of K-products.
3. **G3:** discharge the accepted supplier's relative-plus/UCE proof and based-naturality boundaries. Request exact CW/Hurewicz/cover APIs, normalized-to-unnormalised bar comparison and the K.2/K.7 compatibilities from their existing owners. Do not recreate those theories in V.1.

The two foundational extension briefs coordinate with RS-33's proposed AlgebraicTopology Part II structure. RS-33 was still under review in the inputs inspected; no acceptance or new stage IDs are assumed. The restructuring/design worker assigns the missing owner nodes. A V.1 follow-up then replaces gap/request references with their precise outputs and instantiates the canonical topological Lean interfaces. The complete list is in packet `coverage.remaining` and the reader's supplier table.

## Source finding requiring independent review

`K3BlochGroups/E31` concerns Exercise IV.1.25 in the author-hosted standalone Chapter IV. As printed, the simply connected identity fibration `point → S³ → S³` contradicts the asserted exact sequence: the π₃ map and Hurewicz map are both isomorphisms. The corrected map formulation assumes simply connected CW-type source and target, surjectivity on π₂, and **H₃(source;ℤ)=0**. The reader gives the mapping-cylinder relative-Hurewicz argument. A wedge of two-spheres satisfies these hypotheses, so the chosen Suslin proof route does not use the false exercise.

The finding is awaiting independent review; this worker gives no review verdict. The source was read on 2026-10-05 at [Weibel's author chapter](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.IV.pdf), SHA-256 `9f1c1b8cccfe19d547c27dd04c61f198fd7a0cddd0018a0b84442b00fa575248`. The AMS version-of-record text was not obtained (403); author errata links returned 404 and the archived link was inaccessible. Searches found no correction. E31 is confined to the author chapter and does not assert an error in the unavailable printed edition. Existing parent findings E1–E30 are not copied.

The second source was [Hatcher's author-hosted Algebraic Topology](https://pi.math.cornell.edu/~hatcher/AT/AT.pdf), read 2026-10-05, SHA-256 `bebb3032bf9021b956da3bd070eb6c67dc662cf849be9cdf6679f677560e5618`. The reader and packet preserve the exact passages, locators, mathematical reasoning, hashes and version limitations. No later worker needs this run's disposable source downloads or scratch notes.
