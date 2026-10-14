# BP-BunGAndNewtonStrata~3: revision round 3

Issue #9302. Agent: Claude, session `claude-2Fl0Hn`, 14 October 2026. Branch `claude-2Fl0Hn-bung-rev3`. One job claimed; no second job.

## What the review asked for and what this round changed

The independent review REV-BunGAndNewtonStrata~2 (Codex, `codex-RH698u`) verified the mathematics of all 98 nodes. It withheld acceptance for one concrete reason: under PROTOCOL §13 the suggested file had typed signatures for only ten nodes. The other 88 nodes appeared only as a comment register, which supplied names and contracts but no definitions, API lemmas, theorem signatures or examples. The review asked for actual §13 coverage built on the existing owners' interfaces, keeping the general-field source qualifications and the exact requests.

This round does that, and changes no node statement, prerequisite, source, request, gap list or planet.

- **Suggested file** (`research/blueprint/suggested/BunGAndNewtonStrata.lean`, 3432 lines). Every node declaration, all 191 API items and all 119 unit tests appear under their packet names. API items are declarations; each test is an `example` preceded by a `-- <test name>` line. A `#check` of all 289 declaration and API names succeeds, and a script found every test name in the file. The old 900-line register is gone.
  - **Native cores kept.** Rounds 1–2's typed cores are unchanged: twisted conjugacy, the representative groupoid, the centralizer functor, the trivialized Frobenius tensor family, Kottwitz descent, GL_n slope data and the slope protorus.
  - **Algebraic layers (BG0/BG1).** These are typed over a `LocalDatum` owner interface:
    - its fields are upstream RG2.1.5 π₁(G)_I with Frobenius and κ̃, the RG2.4 based root datum of the quasi-split form with Galois action, roots and dominant chamber, VB0 slope morphisms, split ranks, a Borel and the Newton Levi;
    - on top of it, these have real bodies: B(G), N(G) with the positive-coroot cone order, κ and ν on B(G), μ♯ and μ◇, `Basic`, `NewtonOrder` (with its partial order), `Acceptable`, `Ordinary`, `DecentRepresentative`, `Defect`, `TorusSpecial`, `IsMinuscule`, `IsQuasiSplit`, the unramified norm, and the Levi, Iwahori–Weyl and parahoric data.
  - **Geometric layers (BG0 bundles, BG2–BG4).** These are typed over owner interfaces in the form of the accepted DiamondsAndVStacks suggested file:
    - `ExactTensorCat` and `CurveSite`: D1–D2 site, topologies and geometric points; RF2/VB1 curve bundles, pullback, the structure-sheaf and isocrystal-to-bundle functors; VB0 rank, slope and Brauer invariant; VB2/VB4 slopes and degree;
    - `StackGeometry`: Mathlib pseudofunctors with Mathlib's `IsStack` as the D0 carrier; D0/D3/D4/D5 operations and predicates; VS0 Artin and ℓ-cohomological smoothness with dimension;
    - `SlopeFiltrations` (VB4), `GrassmannianInterface` (GS0, RF4), `EtaleSites` (D2/D6/RF2, ET.0, C1), and the torsor interfaces (R09.3, D3).
  - **Real-bodied geometric definitions.** G-bundles and their pullback; G-isocrystals; extension of structure group; the point map B(G) → Bun_G(C)/≅ and the geometric class; the lower-set Newton topology; S-points of strata; HN-split and filtered charts; the filtered automorphism subgroups H^{≥λ} and H^{>λ} over a coefficient ring; the full automorphism group as `Aut` of E_b.
  - **Admitted bodies.** Prestack-valued constructions are typed with admitted bodies, because their bodies are D0 stackification or D3 sub-prestack constructions: `Bun.stack`, `BunContext.substack`, `HNGraded.stack`, `FullAutomorphism.stack` and `kernelStack`, `GIsocrystalFamily.stack`, the chart stacks and maps, `BunContext.diagonal`, `Bun.extendMap`, and the Grassmannian induced maps. Their objects are described by API theorems (`Bun.stack_obj`, `BunContext.substack_obj`).
  - **How owner fields are read.** Statements involving owner fields are asserted for the owners' instantiations. Where a statement first took an unconstrained function or prestack as an argument, that input was moved into the owner structure it belongs to, or replaced by a named construction, so no theorem quantifies over arbitrary data in place of an owner's object.
- **Packet** (`research/blueprint/packets/BunGAndNewtonStrata.json`).
  - Every node's `prototype` now records its status (`typed-over-local-datum`, 42 nodes; `typed-over-owner-interfaces`, 56 nodes), its declarations, its tests, and a note naming the interface used and any admitted-body constructions.
  - `suggestedLean` records revision 3's scope and elaboration.
  - G08 is retitled "Owner-interface instantiation at the pins". It now states what remains: instantiating the parameters with the owners' carriers once those exist at the pins.
  - The coverage `remaining` lines and the summary are updated to match.
  - Two node texts changed: the Newton-map proof step now names the `LocalDatum` field carrying the representative slope morphism, and one acceptance line of the isocrystal-family node now refers to the typed v-stack theorem.
  - The `review` object is left in place for the next reviewer.
- **Reader** (`research/blueprint/readmes/BunGAndNewtonStrata.md`). The 98 per-node "Lean formulation" lines are regenerated from the packet. The stage-target and coverage text, the G08 section and the suggested-file section are updated. A closing "Revision 3" section records this round.

## Unchanged and still open

All seven stages remain `planned`; none is closed. G01–G12 and the 47 supplier requests are unchanged. The confirmed red-team findings are implemented as before, and the review confirmed them:

- **RT-AREA-geomlanglands/10:** z-extension foundations are imported from upstream RG2.1.5.
- **RT-AREA-geomlanglands/11:** connected-centre basic-to-adjoint surjectivity is `ConnectedCenterBasicInnerForms`.
- **RT-AREA-geomlanglands/32:** BG0/BG1 own the algebraic B(G), ν, κ, J_b and B(G,{μ}), and IG.0 and ET.5 import them.

G08 now records instantiation, not missing signatures. A follow-up should replace each owner-interface field by the owner's carrier when that carrier exists at the pins:

- VB0's exported exact symmetric monoidal isocrystal category;
- VB1's relative analytic bundle category;
- RF/D's perfectoid site, curve and v-stack structures;
- VS0/VS1's Artin and cohomological-smoothness interfaces;
- the RG2.1 local Frobenius comparison.

One test, `FilteredAutomorphism.testNonAffine`, is stated in an abstract additive category with objects `O(n)`, because quasi-coherent bundles on `P¹` are not at the Mathlib pin.

## Checks

- `python3 scripts/check_blueprint.py research/blueprint/packets/BunGAndNewtonStrata.json` (with the baseline declaration index): **0 errors, 0 warnings**.
- `lean-check research/blueprint/suggested/BunGAndNewtonStrata.lean`: **exit 0, 435 declaration-uses-sorry warnings, no other warnings or errors**. Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Memory available at compile time: 109 GB. No language server, build, update or cache fetch was run.
- Name coverage: `#check` of all 289 packet declaration and API names after the file (no errors), and a script found every one of the 119 test names as a `-- <name>` line before an `example`.
- No private paths in the deliverables. The packet contains no `sorry`.

## Sources

No source was newly read, because this round changes no mathematical content. The library index for cleared books was not needed. The Lean signatures were checked against the pinned Mathlib and Tau Ceti trees: `ReductiveCommHopfAlgCat`, `TauCeti.ExactStructure`, `Pseudofunctor.IsStack`, `Topology.lowerSet`, `UpperSemicontinuous`, `IsLocallyConstant`, `topologicalKrullDim`, `isIsomorphicSetoid` and `Preadditive.moduleEndLeft`. The owner suggested files read for the interface form were DiamondsAndVStacks, VStackSheavesAndLisseCategories, VectorBundlesAndIsocrystals (VB0/VB3), RelativeFarguesFontaine (RF0/RF4), GeometricSatakeAndFusion (GS0) and HeckeStacksAndLocalShtukas.
