# REV-RS-19 — review of the RS-19 restructuring (Étale duality, perverse sheaves and endoscopic transfer)

**Verdict: accepted, with no corrections.** Reviewer: Claude Code, session `cc-442dc5`, 23 September 2026. The proposal was written by ChatGPT, session `astra-d49b2f`. This reviewer took no part in it.

**What was read.**
- `RS-19.json`: two members, no anchors, and its evidence leads.
- The proposal `RS-19.result.json` and its report `RS-19.md`.
- Both member documents with all their layer descriptions: EndoscopicTransferAndUnitaryTraceComparison ET.0–ET.7b (15 stages) and EtaleDualityAndPerverseSheaves EDC.0–EDC.8 (13 stages).
- LefschetzPencilsAndVanishingCycles LPV.6.
- Every edge in `data/atlas.json` that touches a dropped stage.
- The three outside documents that mention ET.2a: GeometricSatakeAndFusion, IgusaVarietiesAndTorsionConcentration and the EDC introduction.
- The neighbouring proposal RS-17 (unreviewed), which also links EDC.5, EDC.6 and LPV.6 into ET.
- `scripts/restructure.py`, to see how a drop and a link into a dropped stage are applied.

**Checks run.**
- `python3 scripts/check_restructure.py research/blueprint/restructure/RS-19.result.json` reports `ok`.
- A reachability check on `data/atlas.json` stage edges, with the dropped stages removed and the proposed links added.

## 1. Duplication

The leads are all of one kind. ET.2a says in its own text that it re-exports EDC's scheme foundation. It builds nothing of its own.
- **ET.2a:duality-perversity / EDC.0–EDC.6 and LPV.6.** This stage imports "the same source coefficient categories and operators": exceptional pullback, dualizing complexes, biduality, smooth purity, cycle classes, weak Lefschetz, the perverse t-structure, recollement, IC and the nearby-cycle perverse exactness. EDC.0–EDC.6 and LPV.6 own every one of these.
- **ET.2a:pure-decomposition / EDC.7.** This stage re-exports pure IC, geometric semisimplicity, the decomposition theorem and relative hard Lefschetz. EDC.7 owns them.
- **ET.2a and ET.2.** These are aggregates of the two stages above, and ET.2 also includes ET.2b.

**Nothing independent is dropped.** ET.2b keeps all the Hitchin, affine Springer, Picard, product-formula, δ-regularity and support constructions. EDC.7 supplies only the general theorem that ET.2b applies. The rest of ET (stable conjugacy, transfer, the fundamental lemma, stabilization, Igusa trace formula, local correspondence and the two-tower realization) has no EDC counterpart.

**Owners.** The thirteen owner entries each have exactly one owner, and each owner is the layer the member documents already describe. EDC.8 is named as the owner of general cohomological correspondences and trace classes; ET.5 keeps the contracting-boundary Fujiwara application. RS-17 is consistent: it keeps LPV.6's IG.4 filtered-colimit support extension, which is exactly RS-19's LPV.6 owner entry.

## 2. Nothing lost

Every one of the 28 family stages has an entry: 24 are kept and four dropped.

**The drops.** The atlas records these edges at the dropped stages:
- **Inputs.** EDC.5, EDC.6 and LPV.6 → ET.2a:duality-perversity; EDC.7 → ET.2a:pure-decomposition; ET.2b → ET.2.
- **Internal edges.** ET.2a:duality-perversity and ET.2a:pure-decomposition → ET.2a, and ET.2a → ET.2.
- **Surviving consumers.** ET.2a:duality-perversity → ET.5 and ET.2a:pure-decomposition → ET.2b. ET.2 has no consumer.

**The splices.** Each surviving consumer gets a direct link from every input of the stage it lost: EDC.5, EDC.6 and LPV.6 → ET.5, and EDC.7 → ET.2b. The `suppliedBy` lists name the actual suppliers. Naming EDC.0–EDC.4 as well needs no extra link: EDC.0–EDC.2 already reach EDC.5, and EDC.3–EDC.4 reach EDC.6, so all five reach ET.5 through the new links.

**Outside mentions.** Three outside documents mention ET.2a, and none has an atlas edge to it:
- GeometricSatakeAndFusion (GS1) imports EDC.4–EDC.5 directly and mentions ET.2a only in a parenthesis.
- IgusaVarietiesAndTorsionConcentration's owners section imports EDC.5–EDC.6 and LPV.6 directly and says ET.2a "only reexports" that foundation.
- EDC's introduction names itself the owner of the material "previously grouped into" ET.2a.

## 3. Links, anchors, format

- **Links.** All eight endpoints resolve, and all four links are new edges. None closes a cycle: ET.5 and ET.2b do not reach EDC.5, EDC.6, EDC.7 or LPV.6. The existing edges ET.4, EDC.8, IG.0, IG.1 → ET.5 and R09.4 → ET.2b are untouched.
- **Anchors and extensions.** There are no anchors, no Tau Ceti roadmap changes, and no roadmap is extended, merged or retired.
- **Format.** The JSON follows PROTOCOL §15. Four drops each have `suppliedBy`, there are no narrowings, and each of the thirteen owners is a single stage.

## Notes for the orchestrator

1. **RS-17 restates two edges into a stage RS-19 drops.** RS-17 (unreviewed) has links EDC.5 and EDC.6 → ET.2a:duality-perversity. It also adds the same three ET.5 links as RS-19, with the reason "compatible with the separately submitted RS-19 removal".
   - **If both are applied.** `scripts/restructure.py` keeps a dropped stage in `stages` and only hides it. So RS-17's two links would add evidence to the existing edges into the hidden stage. They would not be skipped.
   - **Why this is harmless.** It changes no dependency, but REV-RS-17 should remove those two links.
   - **The ET.5 links.** They coincide, so applying both proposals gives each ET.5 edge two evidence records and no duplicate edge.
2. **Redundant `formerly` entries.** Each owner's `formerly` list includes the owner itself, as well as the dropped aggregates it replaces. This is harmless and was not changed.
3. **Stale parentheticals.** The three outside mentions of ET.2a in §2 describe it as a re-export. Once RS-19 is applied they will point at a hidden stage, and their blueprints should drop them. This review may not edit those documents.
