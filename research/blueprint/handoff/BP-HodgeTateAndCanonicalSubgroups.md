# BP-HodgeTateAndCanonicalSubgroups — handoff

Claude (Opus 5.5), session `claude-NEhd3x`, 14 October 2026. Refs #9423; the bot confirmed the claim. This is the complete whole-roadmap planning pass, ready for independent review. It is not a checkpoint, and nothing is claimed to be implemented.

## Deliverables

- [Packet](../packets/HodgeTateAndCanonicalSubgroups.json): `part: null`, scope all nine stages (T0–T6, T6:comparison, T6:log-sites), `status: complete`. Every stage is planned and none is closed.
- [Reader](../readmes/HodgeTateAndCanonicalSubgroups.md): the whole-roadmap document. It has:
  - front matter: purpose, scope, boundaries, the place in the upstream order, conventions, sources, and a layer table;
  - each layer, with a new overview, the four new targets in full, and the accepted part sections, reproduced with notes that mark the effective-plan corrections;
  - the effective prerequisites and corrections, the effective requests and gaps, the maintainer-source and red-team maps, and the restructuring proposals;
  - Appendices A and B, holding the two parts' records (conventions, quantitative contracts, sources, source-issue ledgers, routing proposals);
  - Appendix C, holding the outgoing target.
- [Suggested Lean](../suggested/HodgeTateAndCanonicalSubgroups.lean): 778 lines in the 2026-10-12 shape. It has 15 light real-bodied definitions over pinned carriers, 6 milestones (2 proved outright) and 11 examples. A generated closing index lists the plan's 768 other declaration names by layer and target.

The accepted parts stay unchanged and live:
- `HodgeTateAndCanonicalSubgroups--T0` (T0–T5, 66 targets, accepted by REV-…--T0~2 on 8 October, SHA-256 `f815772f…`);
- `HodgeTateAndCanonicalSubgroups--T6` (68 targets, accepted by REV-…--T6~2 on 9 October, SHA-256 `d758e741…`).

Promotion merges the nodes of all promoted packets of a roadmap (`scripts/blueprints.py`, `merge_blueprints`). This packet therefore carries only its four new nodes in `nodes`. The imported targets are listed in `importedNodes`, and the effective plan is spelled out in `assembly`, as in the accepted AInfCohomology whole-roadmap packet:
- `importedPrerequisites` gives the definitive prerequisites of all 133 effective imported targets; 52 differ from the parts.
- `importedNodeCorrections` gives field replacements for six targets.
- `outgoingImportedNodes`, `requestResolutions`, `supplierIdUpdates` and `withdrawnRequests` record the rest.

The effective plan has 137 targets: 58 theorems, 40 constructions, 22 definitions, 13 lemmas, 3 comparisons and 1 application. It has 408 API items, 224 definition tests, 37 planets, 42 baseline declarations, 25 supplier requests and 23 gaps.

This reader also does what the assembly job ASM-HodgeTateAndCanonicalSubgroups (#240) was queued to do: it joins T0–T5 and T6 into one document with an introduction and reconciled cross-part prerequisites. The two jobs share the reader and suggested-file paths. If #240 is still open, the maintainer may retire it, or let it build on this document.

## What this pass adds and why

**Upstream order.** In research/blueprint/upstream/CaraianiNewton.md this roadmap is tier 16. The parts contained five citations of a higher-tier roadmap and one of a roadmap outside the order.

- **PerfectoidShimuraVarieties S0 (tier 17).** The citations of S0/p-level-tower, S0/tower-right-action and S0/infinite-level-diamond come from T2/open-tower-hodge-tate-map, T5/igusa-full-level-comparison and T5/aip-hodge-tate-comparison. The three constructions move down into T2 as T2/p-level-tower, T2/tower-right-action and T2/infinite-level-diamond. They rest only on:
  - ShimuraVarieties V1/V8 (tier 13);
  - AdicSpacesPartII R1 and DiamondsAndVStacks D4–D6 (tier 3);
  - Mathlib (cofiltered categories, limits, `Functor.Initial.limitIso`).

  Their API names (`ShimuraTower.*`) are kept, so PerfectoidShimuraVarieties only has to repoint its 41 internal citations of the three ids. The layer edge becomes T2 → S0, superseding the T0–T5 part's proposed S0 → T2. T2 already shows six planets, so the restructure entry proposes a sub-layer T2:tower that would carry the planet "Infinite-level Shimura diamond".
- **OverconvergentAutomorphicForms O5/O6 (outside the 94).** T5/aip-hodge-tate-comparison was the sheaf-level BHW Theorem 7.14, which O5 owns by its stage text and plans as O5/geometric-aip-comparison. That node is listed as outgoing. T5 now ends with T5/aip-torsor-hodge-tate-comparison, which is BHW Lemma 7.12 with diagram (7.2):
  - the twisted section s ∘ u_n lies over Atkin–Lehner (or over the forgetful map when n = ∞);
  - it is Γ₀*(p)-equivariant through cz + d ∈ B_m;
  - it carries κ-eigenfunctions to functions with the κ⁻¹(cz + d) law.

  The new node carries the T5 planet, as 'AIP torsor comparison morphism'. The requests to O5 and O6 are withdrawn.

After these changes no effective prerequisite and no request points upward or outside the order. The build checks this (`assembly.upstreamOrder`).

**Request resolutions (16).** A Sonnet cross-check split the parts' 30 requests into 121 items. I adopted only items whose candidate statement I read and found complete, and only from accepted packets of tier ≤ 16. The exact nodes were added to the consumers' effective prerequisites. A citation of a whole stage was removed from a target's prerequisites only when exact nodes replaced all of it. Every request that still has open items keeps them, rewritten as a precise remaining need. The resolutions:
- R07.2: BT₁ Hasse theory, LF, Hasse–Witt duality, F/V over characteristic-p rings.
- A3: Weil pairing; resolved in full.
- A4: H¹_dR.
- A2: dual and polarisations.
- P8: relative Hodge–Tate filtration.
- C5: Lan Definition 8.5 and Theorem 8.7.
- H2: Hasse ideal and normalized formal neighbourhoods, through C6 and R2.
- H4: full-level moduli, Γ₀ and the adjugate action.
- R07.6: Illusie obstruction and DD.0.
- C4: semi-abelian Verschiebung determinant and character sheaf.
- B1: Hodge tensor realizations.
- R2: strict transforms.
- CR.5:log-algebra: through ComplexComparisonPartII C5, log structures on ringed sites.
- P8: Scholze's Theorem 5.1.
- V8.general: canonical models, disjoint reflex fields, simply connected reduction, Gᶜ.
- The T6 part's requests to its own T1/T2 become exact internal citations.

**Supplier ids (27 ids, 39 citations).** The parts cited ids that their suppliers have since replaced: the unaccepted PadicHodgeTheory--P7 draft and the ShimuraCompactifications--C0 part. They are mapped through the suppliers' own continuation maps:
- PadicHodgeTheory.json `predecessorTargets` and `supersededTargets`, and the enclosing targets of its `proofDependencies`;
- ShimuraCompactifications.json `continuation.nodeIdMap`.

**Ownership found.** The accepted whole-roadmap ShimuraCompactifications plan (tier 15) moved the Verschiebung determinant of semi-abelian groups down into C4/roadmap/semiabelian-hasse-boundary-comparison. It did so because its C6 cited this roadmap's T0. That is the existence and base-change statement T0/semi-abelian-hasse-invariant recorded as a gap. T0 now cites it, keeps the named section Ha(G/S) with its API and tests, and the restructure records the owner.

**Maintainer-added sources (47 items).**

| Status | Items | Where |
| --- | ---: | --- |
| Covered by imported targets | 26 | the parts' nodes |
| Covered after a correction here | 4 | listed below |
| Owned elsewhere by existing nodes | 9 | R07.2/bt1-hasse-invariant (five Pilloni items); PerfectoidShimuraVarieties S1 (Scholze items 39–41, Theorem 3.2.15, and item 61) |
| Requested | 1 | Pilloni Lemma 6.3.4.1, from R07.2 |
| Rerouted by confirmed red-team fixes | 7 | CS17 items 52, 53, 143; BCGP-25 Theorem 4.4.1, four items |

The four corrections, each checked on the source page:
- T0/fargues-degree gains the degree 1/(p+1) of an order-p subgroup of a supersingular E[p] over W(l) (Pilloni 2020 p. 48), computed from the Newton polygon of [p].
- T0/fargues-hodge-tate-cokernel states the case of a subgroup H of a p-divisible group G. G/H is p-divisible and the cokernel for H is a quotient of the one for G/H, so no embedding hypothesis is needed (Fargues 2010 Théorème 7, PDF p. 26; Pilloni 2020 p. 92).
- T5/modified-plus-sheaf gains Pilloni's Remark 12.7.1.1 (p. 77).
- T2/open-tower-hodge-tate-map gains the continuity API item that is Scholze's Lemma III.3.4 (arXiv v2, p. 55).

The packet's `maintainerSources` and the reader table give every item.

**Red-team findings.** RT-AREA-padic-1/4, /22, /23, /24, /25 and /26 are handled as the parts recorded. /22 is strengthened by the tower move, and /24's P8 citations now point to exact PadicHodgeTheory nodes. `redTeamFindings` gives each.

## For the maintainer and the next revisions

1. When the T0–T5 part is next revised, apply `assembly.importedPrerequisites` and `importedNodeCorrections`, and retire T5/aip-hodge-tate-comparison. Its planet passes to the new T5 node as 'AIP torsor comparison morphism'. Until then the old node stays live in the atlas; the promotion dry run shows T5 with six planets and one skipped link, O5 → T5, coming from that node.
2. PerfectoidShimuraVarieties: retire S0/p-level-tower, S0/tower-right-action and S0/infinite-level-diamond in favour of the T2 ids, with the same API names.
3. OverconvergentAutomorphicForms O5/geometric-aip-comparison: import T5/aip-torsor-hodge-tate-comparison.
4. ShimuraCompactifications C6/hilbert-hasse-boundary-comparison and C6/hilbert-boundary-ordinary still cite this roadmap's T0 stage. Their content is C4's node, so they should cite C4.
5. The Scholze–Weinstein classification items (CS17 52, 53, 143) have no owner node. The FiniteFlat stage proposed by RT-AREA-padic-1/25 was not created, and VectorBundlesAndIsocrystals is outside the Caraiani–Newton order. IgusaVarietiesAndTorsionConcentration IG.3 still requests them from T2 and from VB2. An owner inside the order is needed, for instance a FiniteFlat Part II.
6. BCGP-25 Theorem 4.4.1 (four items): TorsionCohomologyInfrastructure TC.2 and the HigherHidaAndColemanTheory design have no nodes yet.
7. Pilloni 2020 Lemma 6.3.4.1 (the normalized multiplicative determinant pullback) is assigned to R07.2 by RT-AREA-padic-1/26, but no R07.2 node states it; the request stays open.
8. Some effective prerequisites cite nodes of supplier packets whose review is `needs_changes`:
   - PerfectoidSpaces--P0 (P0–P3 almost mathematics, perfectoid algebras, almost purity), 16 citations; PerfectoidSpaces is now Tau Ceti pull request #818;
   - ShimuraData D3 (compact dual, filtration parabolic), 4 citations.

   They are the suppliers' current plans and were not changed here.
9. Source-issue ids: both parts number from the same sequence, and HodgeTateAndCanonicalSubgroups/E14–E26 occur in both with different content (`inheritedSourceIssues.collidingIds`). This pass found no new mistake; `sourceIssues` is empty.

## Checks

- `python3 scripts/check_blueprint.py --index <pinned declaration index> research/blueprint/packets/HodgeTateAndCanonicalSubgroups.json`: 0 errors, 0 warnings. The five new Mathlib baseline declarations were read at 082e2d37.
- Effective-graph check, a scratch script over `importedNodes`, `importedPrerequisites` and `nodes`:
  - every prerequisite resolves; none cites the outgoing node;
  - the graph is acyclic, and no same-roadmap edge runs against the atlas layer order;
  - none of the 101 induced cross-roadmap stage edges closes a cycle with the atlas.
- Reader check: every field of the new nodes, every corrected field, every effective target, request, gap, maintainer item and red-team entry appears in the reader, and all 241 internal links resolve. The reader has no excerpts and no local paths. A Sonnet proofread of the newly written text was applied.
- Promotion dry run: `scripts/build.py assemble(require_distances=False)` over data/blueprints plus this packet succeeds: 138 declarations and 38 planets, at most six per layer. These are the 137 targets and 37 planets of the effective plan plus the still-live T5/aip-hodge-tate-comparison.
- `lean-check research/blueprint/suggested/HodgeTateAndCanonicalSubgroups.lean`: exit 0 at Mathlib 082e2d37e8 and Tau Ceti f790474, four warnings, all for proofs left open. `scripts/check_sorry_data.py` passes.
- `research/blueprint/intake.py check-files` on the four deliverables: 4 files, 0 problems.

## Sources read for this pass (14 October 2026)

Every file's SHA-256 matched the receipt recorded in the packets.

| Source | Read | SHA-256 |
| --- | --- | --- |
| Birkbeck–Heuer–Williams, arXiv:1902.03985v4 | §7.1–7.2: Lemma 7.2 – Theorem 7.14, pp. 29–31 | `8ee48970…` |
| Milne, Introduction to Shimura varieties (2017 revision) | §5, Theorem 5.28, Remark 5.29, p. 65 | `f637e617…` |
| Scholze, Étale cohomology of diamonds, arXiv v4 | Lemma 11.22, pp. 63–64 | `78ca42bb…` |
| Caraiani–Scholze, arXiv:1511.02418v1 | §2.1, Theorem 2.1.2, PDF pp. 10–11 | `aa93df39…` |
| Fargues 2010, author copy | §9, Théorèmes 6–7, PDF p. 26 | `67b58427…` |
| Pilloni 2020, author copy | §7.4.2 pp. 47–48; §12.7.1 p. 77; Lemma 14.1.1 p. 92 | `4c05724e…` |
| Scholze, torsion paper, arXiv:1306.2070v2 | Lemma III.3.4, p. 55 | `e15abf4e…` |

No restricted source was used.
