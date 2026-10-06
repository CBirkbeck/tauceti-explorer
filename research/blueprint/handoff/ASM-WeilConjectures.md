# Handoff: ASM-WeilConjectures (issue #262)

This job assembles the roadmap *Weil conjectures and cohomological zeta functions* from its two reviewed parts:

- WC.0–WC.5 with WC.5:power-sum-converse and WC.5:surface-alternative, written by BP-WeilConjectures--WC.0 (with checkpoints #2943 and #2961) and corrected and accepted by REV-WeilConjectures--WC.0 on 6 October 2026;
- WC.6–WC.7, written by BP-WeilConjectures--WC.6 (with checkpoint #2956) and corrected and accepted by REV-WeilConjectures--WC.6 on 6 October 2026.

Worker: Claude (Opus 5.5), session claude-uT7E14. I took no part in either part or in their reviews.

## Files

- `research/blueprint/readmes/WeilConjectures.md`: the full roadmap document (about 44,000 words).
- `research/blueprint/suggested/WeilConjectures.lean`: the two parts' suggested files, joined into one.
- `research/blueprint/handoff/ASM-WeilConjectures.md`: this note.

The part packets are not deliverables of this job (`queue.json` lists only the three files above), and they are unchanged. Editing them would put non-deliverable paths in the pull request and change reviewed files. The edits they need are listed below for a job that owns them. ASM-HabiroRings and ASM-HabiroCyclotomicCompletions made the same choice.

## What was done

- **The roadmap document** is generated from the two packets as their reviews left them, so it agrees with them node for node.
  - All 74 nodes (54 + 20) are there: every statement, hypothesis, proof outline, API item, unit test, acceptance check, use, dependency, library record, suggested-file status and source. Within each layer the nodes are ordered so that every node follows the nodes of its layer that it uses, and each node lists the nodes of the roadmap that use it.
  - A scripted check finds in the document every node id, declaration name, API and test name, all 263 prerequisites, all 27 request suppliers, all 19 source-issue ids with their printed text, all 66 baseline references, every source id and all 106 literal excerpts verbatim.
  - REV-WeilConjectures--WC.0 asked that its part's reader be brought in line with the corrected packet (four API items and a test it added; the removed "flat" hypothesis, Layer 15 twist claim and (3.10) remark). Generating the node text from the packet does this, so none of the WC.0 part document's node text is reused. The WC.6 part document is topical prose; its content that the nodes do not carry (the valuation pair, the crystalline imports with φ^f, the acceptance matrix) is carried into the WC.6 and WC.7 overviews.
  - **New sections.** Purpose and scope; Boundaries (suppliers, consumers with the node answering each request filed with this roadmap, the RS-17 owners, reconciliation notes); Conventions; Sources (every alias, edition, hash and section read); the 65 pinned declarations; a layer overview with the path to the main theorems; a written overview for each of the ten layers; and closing sections on cross-part prerequisites, gaps (each with its current status), requests, imports, source issues, structural proposals, upstream notes, dependencies, what the blueprint does not claim, and the Lean file.
  - **Assembly notes.** 27 nodes are followed by an Assembly note, which carries a cross-part fact or a reviewer's point to the node it concerns and changes no packet.
- **Notation.** The WC.6 packet writes ASCII (ell, Q_ell, Fbarq, chi, Delta, >=, tensor, P^1, etale); its prose is printed in the WC.0 part's notation (ℓ, Q_ℓ, F̄_q, χ, Δ, ≥, ⊗, P¹, étale). The WC.0 packet's prose lost the spaces before many numerals ("Proposition1.3", "is1", "denominator1−T"); they are restored. Ids, slugs, Lean names, locators and excerpts are untouched (a masking step protects them). The Conventions section records both parts' conventions: q = p^a versus p^f, X versus X_0, Π_i versus "canonical P_i".
- **Cross-part prerequisites.** The WC.0 part never cites the WC.6 part. The WC.6 part cites the stages WC.1 (4 nodes), WC.2 (2), WC.3 (2), WC.4 (1) and WC.5 (7), with a request to each. Statement against statement:
  - WC.3 → `WC.3/degreewise-pure-factor-extraction`: exact (no projectivity or smoothness in its hypotheses).
  - WC.1 → `WC.1/normalized-integral-zeta-presentation`, `WC.1/zeta-function-euler-product-and-point-counts`, `WC.1/cohomological-formula-from-the-trace-formula`: exact.
  - WC.2 → `WC.2/signed-zeta-functional-equation` and `WC.2/functional-equation-multiplier-descent`: exact for `WC.6/smooth-proper-functional-equation`; **not answered** for `WC.6/homology-manifold-weil-assembly`, because the WC.2 node assumes smoothness and takes its pairing from EDC.2:pairings, while the homology-manifold node's pairing comes from EDC.1:biduality. That request stays open.
  - WC.4 → `WC.4/betti-comparison-in-a-supplied-family`: exact.
  - WC.5 → `WC.5/extension-count-recurrence`, with `WC.1/cohomological-formula-from-the-trace-formula` for the all-power trace identity and the reduced, weight-separated presentation for pole orders.
  - The node graph of both parts is acyclic, also through every node of every other packet that it reaches.
- **`check_blueprint.py`**, with the pinned declaration index: 0 errors and 0 warnings on both part packets (unchanged). `intake.py check-files` passes on the three deliverables.
- **The Lean file.**
  - One standard note, one import block (the union of the two, Mathlib only; neither part imported Tau Ceti), and the packets' names throughout.
  - Ordered by layer: WC.1 (groupoid mass, signed configurations, the rational-descent, Fatou and Möbius cores), WC.2 cores, the WC.3 core, WC.5 cores and polynomial counts in `TauCeti.PointCounting`; the numerical child in one `TauCeti.FiniteSpectrum` block (the WC.0 file had two); the WC.6 part's examples last. The declarations are the parts' text unchanged.
  - The WC.6 part's examples, which name no declaration, move from its working namespace `TauCetiRoadmap.WeilConjectures.WC6` to `TauCeti.AlgebraicGeometry.WeilZeta`, the namespace its packet gives its declarations.
  - The head note lists the 45 omitted geometric declarations (25 of the WC.0 part, 20 of the WC.6 part) by name, so every declaration name of both packets appears in the file; every API and unit-test name of the three definitions appears too.
  - `lean-check` at the pinned Mathlib 082e2d3 exits 0. Its only warnings are 97 `declaration uses 'sorry'`, the parts' 79 and 18. More than 90 GB of memory was available; one check ran.

## Edits the part packets need (not deliverables here)

No reviewed mathematics changed in this job. Items 1–7 change prerequisites only; items 8–10 are structural and wait for the maintainer.

1. **`WC.6/purity-for-proper-smooth-varieties`.** Replace the stage prerequisites `WeilConjectures:WC.1` and `WeilConjectures:WC.3` by `WeilConjectures:WC.1/normalized-integral-zeta-presentation`, `WeilConjectures:WC.1/cohomological-formula-from-the-trace-formula` and `WeilConjectures:WC.3/degreewise-pure-factor-extraction`. In step 3 drop "The currently integrated WC.3 node is only stated for projective X; that exact statement alone does not discharge this application" and cite the extraction node.
2. **`WC.6/homology-manifold-weil-assembly`.** The same replacement for WC.1 and WC.3. Keep the stage `WeilConjectures:WC.2`; the WC.6 part's WC.2 request should name only this node in `neededBy`, and say that WC.2 must state its signed assembly for a graded Frobenius space with a perfect q^d-similitude pairing, not only for smooth X.
3. **`WC.6/smooth-proper-functional-equation`.** Replace the stage `WeilConjectures:WC.2` by `WeilConjectures:WC.2/signed-zeta-functional-equation` and `WeilConjectures:WC.2/functional-equation-multiplier-descent`.
4. **WC.7 nodes citing the stage `WeilConjectures:WC.5`.** Replace it, node by node:
   - `projective-space-degree-factors` and `kunneth-product-agreement`: `WeilConjectures:WC.1/cohomological-formula-from-the-trace-formula` and `WeilConjectures:WC.5/extension-count-recurrence`;
   - `multiplicative-group-compact-support-agreement`, `all-extension-counts-from-cycles` and `rational-surface-picard-count-criterion`: `WeilConjectures:WC.1/cohomological-formula-from-the-trace-formula` (they use only the all-power trace identity);
   - `curve-zeta-jacobian-agreement`: `WeilConjectures:WC.5/extension-count-recurrence` (see also item 8);
   - `geometric-weil-assembly`: see item 6.
5. **`WC.7/zeta-from-base-field-algebraic-cycles`.** Replace `WeilConjectures:WC.1` by `WeilConjectures:WC.1/cohomological-formula-from-the-trace-formula`.
6. **`WC.7/geometric-weil-assembly`.** Replace `WeilConjectures:WC.1` by the two WC.1 nodes of item 1, `WeilConjectures:WC.4` by `WeilConjectures:WC.4/betti-comparison-in-a-supplied-family`, and `WeilConjectures:WC.5` as in item 4.
7. **The WC.6 part's requests and records.** After items 1–6, its requests to WC.1, WC.3, WC.4 and WC.5 are answered and can be removed, and the WC.2 request narrowed (item 2). The first remaining item of the WC.6 coverage record (WC.1/WC.3 stage requests) and the first item of the gap "Supplier proof and example closure" (the generic WC.3 extraction) are then done. In the WC.0 packet, the source `vdbe` has the wrong title: arXiv:math/0505178 is van den Bogaart–Edixhoven, *Algebraic stacks whose number of points over finite fields is a polynomial* (checked against the arXiv record; the WC.6 packet's `vdbe05-v3` has it right). The WC.0 upstream note on `DWP.0/characteristic-power-series-and-traces` is answered by REV-DeligneWeightsAndPurity--DWP.0's correction of that node.
8. **Overlaps** (document, "Structural proposals" 5–7). `WC.6/smooth-proper-functional-equation` restates the two WC.2 nodes; `WC.7/curve-zeta-jacobian-agreement` restates `WC.1/curve-zeta-numerator-without-rh`; `WC.7/finite-etale-permutation-factors` restates the dimension-zero half of `WC.5/components-and-dimension-zero`. Each WC.6-part node should cite the WC.0-part node and keep only what it adds (the identification of Δ through the canonical factors; the canonical P_1 and its reciprocity; the canonical P_0). These narrow statements, so they need a re-review.
9. **Stage order** (proposal 8). `WC.2/equivariant-polynomial-duality` → `WC.4/equivariant-polynomial-point-counts` → `WC.5/polynomial-counts-over-z-and-tate-cohomology` run against the layer order; read at stage level, with the atlas links WC.2 → WC.3 → WC.4 and the node edges WC.4 → WC.5, they would close the stage cycles WC.2 → WC.3 → WC.4 → WC.2 and WC.4 → WC.5 → WC.4. The proposal moves both equivariant nodes into WC.5 (new ids; no other packet cites them). WC.5 already shows six planets, so their planets would go or WC.5 would get a polynomial-count sub-layer.
10. **Namespaces.** The geometric declarations of WC.0–WC.5 are in `TauCeti.PointCounting` and those of WC.6–WC.7 in `TauCeti.AlgebraicGeometry.WeilZeta`. One namespace for both would be better; the choice is the maintainer's, and the Lean file keeps the packets' names until the packets change.

## Structural proposals and requests

All are given in full in the document, each with its status.

| Proposal | Where recorded | Status |
|---|---|---|
| WC.7 keeps its mathematics; only process wording leaves the display | WC.6 part | awaiting the maintainer |
| Narrow `WC.6/purity-for-proper-smooth-varieties` to an adapter of DWP.7 (ii) | DWP.7 part (accepted) | awaiting the maintainer; RS-17's owner rows support it |
| Link WC.3 → RD.7, one weight-separation lemma for every characteristic-zero field | RD packet (unreviewed) | satisfied on this side by `WC.3/degreewise-pure-factor-extraction`; RS-17 records the link |
| Étale duality Part II for stacks, with an edge to `WC.6/purity-for-smooth-proper-dm-stacks` | EDC.0 part | awaiting the maintainer; both parts' stack gaps wait for it |
| Overlaps 5–7 and stage order 8 | this assembly | edits above |

**Requests.** 27 in all: 12 in the WC.0 part, 15 in the WC.6 part. Five WC.6-part requests are to this roadmap's own stages and are answered within it except the WC.2 one for homology manifolds. The others stand with SF.1 (two), SF.2, SF.5 (two), EDC.1:biduality, EDC.2:pairings (two), EDC.3, EDC.4, EDC.8 (two), DWP.4, DWP.10, RG2.3, R01.5, R06.2, FA.3, and the Tau Ceti layers LocalFieldsRamification 0, EllipticCurves 3, NumberFieldArithmetic 6 and AlgebraicCurves 12.

**Requests other roadmaps file with this one** (document, Boundaries, Consumers): DWP.0 part (WC.1, WC.7), DWP.7 (WC.3), RD (WC.1, WC.3), FiniteFieldsAndCharacterSums (WC.0, WC.3, WC.5:power-sum-converse), FF.3 (WC.5), NeronModelsPartII G.4 (WC.7) and ES7 (WC.2) are answered by named nodes. EllipticRegulators ER.7's request to WC.5 is only half answered: the bound for curves is here, but it needs the Eichler–Shimura identification of a_ℓ(f) with Frobenius traces, which belongs to the owner of the modular curves.

## For the maintainer

- **The private repository.** WC.0's gap "Private WC snapshot audit" can only be closed by supplying the `CBirkbeck/WeilConjectures` snapshot or by removing the audit from the stage text.
- **PR196 identifiers.** Four WC.0-part gaps and the WC.6 part's SF.2 request all wait for atlas identifiers of PR196's layers (FrobeniusGeometry 4–7, EllAdicRealization 4–10, TraceFormula 7–15, EtaleBaseChange 7–9, ComplexComparison 10–12).
- **Owners without stages.** The stacks Part II and the three Schröer routes (NumericalPicardAndContractionDescent, EnriquesSurfacesAndIntegralNonexistence, GenusOneFibrationsAndRationalEllipticSurfaces) have no stages; four gaps wait for them.
- **Suppliers not yet accepted.** Five cited DWP nodes sit in the DWP.0 part, which its review returned for a revision of its reader; the RD packet and the R06.5 part are unreviewed. If their reviews change those statements, the consuming nodes need rechecking.
- **WC.7's display.** The atlas still shows WC.7's original stage text, including process wording the WC.6 part proposes to drop.

## Checks

- `python3 scripts/check_blueprint.py research/blueprint/packets/WeilConjectures--WC.0.json research/blueprint/packets/WeilConjectures--WC.6.json` (pinned index): 0 errors, 0 warnings.
- `python3 research/blueprint/intake.py check-files` on the three deliverables: no problems.
- `lean-check research/blueprint/suggested/WeilConjectures.lean`: exit 0, 97 `sorry` warnings and nothing else.
- Scripted completeness check of the document against both packets (all ids, names, prerequisites, requests, gaps, source issues, baseline references and excerpts): nothing missing.
- Node-graph cycle check through all packets: no cycle reaches a WeilConjectures node.

The scratch generator (the node renderer and the hand-written sections) is not needed by a later job: the document is the deliverable, and any regeneration after packet edits can follow the structure described above.
