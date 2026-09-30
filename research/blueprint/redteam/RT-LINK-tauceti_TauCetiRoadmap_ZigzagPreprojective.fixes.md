# RT-LINK-tauceti_TauCetiRoadmap_ZigzagPreprojective: fixes

Fixer: Claude Code, session `cc-f805bf`, 30 September 2026 (issue #5042).
- Findings: [`RT-LINK-tauceti_TauCetiRoadmap_ZigzagPreprojective.result.json`](RT-LINK-tauceti_TauCetiRoadmap_ZigzagPreprojective.result.json).
- Verdicts: [`RT-LINK-tauceti_TauCetiRoadmap_ZigzagPreprojective.review.json`](RT-LINK-tauceti_TauCetiRoadmap_ZigzagPreprojective.review.json), whose authorized scope this fix follows.
- Base: `4965fe1`. One finding, confirmed.

The only edited file is `research/blueprint/links/tauceti_TauCetiRoadmap_ZigzagPreprojective.json`. As in the Grothendieck/Euler link fix, the promoted copy in `data/links` is not edited: it was byte-identical to the research file before this fix, and normal independent acceptance and promotion carry the revised packet there. This fix does not edit the generated graph.

## /1 (medium, missing): Quiver Layer 3 → Zigzag Layer 3 never reaches the atlas

**Rechecked at the base.** The QuiverRepresentations link packet is still `partial`, has no review block and has no `data/links` counterpart, so it has not been accepted and integrated since the red team. Its `links` array is the only place the pair appears. The in-memory production assembly (`build.assemble(require_distances=False)`) gives 2,840 stages and 8,249 distinct stage edges. The pair is not an edge and not in Zigzag Layer 3's `requires`, and there is no forward or reverse path between its endpoints. So a single canonical pair is added here; no duplicate arises.

**Changes.**

1. **One link appended** to `links` (now 14), with `inferred` confidence:
   - source `tauceti:TauCetiRoadmap/RepresentationTheory/QuiverRepresentations#layer-3-the-structure-of-a-finite-dimensional-algebra`;
   - target `tauceti:TauCetiRoadmap/ZigzagPreprojective#layer-3-projectives-graded-cartan-matrices-and-q-euler-forms`.

   The reason starts with the Quiver packet's reason, verbatim, which the verifier checked accurate. It then adds four points:
   - the pinned Tau Ceti declarations `IsProjectiveCover`, `exists_isProjectiveCover_of_finiteDimensional` and `zigzagProjective_projective` are reused, not re-planned;
   - the pin has no algebra-level Cartan matrix or primitive-idempotent decomposition, which remain Quiver Layer 3 work;
   - Zigzag keeps as explicit obligations the finite-dimensional split/basic hypotheses, the graded refinement of the covers, the left-module convention and the `[P_i:S_j]` versus `[P_j:S_i]` transpose, which the symmetric zigzag Cartan matrix hides;
   - the dependency asserts neither finite global dimension nor unconditional Cartan invertibility. The inherited sentence already excludes hereditary Ext vanishing and finite dimensionality of arbitrary preprojective quotients.

   The two quotations are copied from the current stage descriptions, each occurring exactly once there. Following the map's other links, each also has a `sourcePath` and a `locator` (Quiver README lines 288–289, Zigzag README lines 281–282):
   - Quiver side: "Build `projectiveCover M`: a projective `P` with an\n  essential epimorphism `P ↠ M` (superfluous kernel), **unique up to isomorphism**";
   - Zigzag side: "Define the indecomposable graded left projective `P_i = Z e_i`, its simple head, socle, radical\n  layers, grading shifts, and all homogeneous `Hom(P_i,P_j{d})` spaces."

   The Zigzag quotation keeps the raw `radical\n  layers` indentation. The Quiver packet's copy of it has the indentation stripped, and it is not reused.

2. **`alreadyRecorded[0]` retagged, not removed.** Of the two options the verifier allowed, I chose to retag it, as the Grothendieck/Euler fix did for its hosted entries. Its `packet`, `blob` and `reviewRecheck` fields are kept as provenance. A new `state` field reads `research-only-at-review; now-carried-in-this-packet-links`. The new `note` says three things:
   - the host is a partial, unreviewed research packet with no promoted counterpart;
   - the pair is now carried in this packet's `links`;
   - the sibling packet is not accepted or promoted by this entry.

3. **Summary corrected.** The sentence saying the link was "already held in the QuiverRepresentations packet, recorded here without duplication" now says three things: the pair was recorded only in `alreadyRecorded`; its host is partial and unreviewed, so it never reached the atlas; and this fix carries it as a fourteenth incoming link, with the 13 reviewed links and seven overlaps unchanged.

4. **Review narrative corrected.** In `review.notes`, the sentences "confirmed the already-recorded QuiverRepresentations3-to-Zigzag3 link without duplicating it. No additional exact edge established." are replaced. The new text says three things: the review confirmed the dependency but left it in `alreadyRecorded`; the confirmed red-team finding showed the pair was not covered in the atlas; and the fix now adds it. `review.status`, `reviewer`, `date`, `removed` and `added` are unchanged, as history. The notes say they do not represent a review of this revision, which needs renewed independent acceptance before promotion. The original reviewer is not credited with reviewing the new link.

5. **Fix provenance.** A new `redteamFix` object, following the Grothendieck/Euler precedent, records the job, finding, verification file, agent, session, date, base, scope and the validation numbers below.

**Not changed (out of scope).** The 13 original links (checked equal field by field), the seven overlaps, the examined ledger, both roadmap READMEs, the QuiverRepresentations packet and any Grothendieck/Euler edge.

**Indirect path.** The verifier noted that the Grothendieck/Euler fix adds Quiver 3 → GEF 4. That fix has since reached the GEF research packet on main, but its promoted `data/links` copy still has no Quiver 3 → GEF 4 link, so there is still no Quiver 3 → Zigzag 3 path in the assembled graph. The union check below already includes that pair, through the Quiver research packet. Once it is promoted, the path Quiver 3 → GEF 4 → Zigzag 3 will exist. The direct edge is still needed, for two reasons: Zigzag 3 uses covers, heads and primitive idempotents directly, and a transitive path does not put Quiver 3 in Zigzag 3's `requires`.

## Validation

- `python3 scripts/check_links.py` on the edited map: 14 links, 7 overlaps, 218 examined; **0 errors, 0 warnings**.
- In memory, merging the edited packet with `merge_links` into the assembled atlas gives **8,249 → 8,250** edges, and the one new edge is exactly Quiver 3 → Zigzag 3. A second merge gives **8,250** again. Zigzag 3's `requires` now contains Quiver 3, and the merge's own cycle check passes.
- I took the union of the assembled edges, every `requires` entry, every research link map's `links` and the edited map. It has **8,360** distinct pairs and is **acyclic**.
- `python3 research/blueprint/intake.py check-files` on both deliverables: 0 problems.
- The edit was applied by one script that asserts the preconditions (13 links, the pair absent from `links`, the exact old summary and review sentences, the Quiver packet still partial and unreviewed), checks the quotations as unique literal substrings and checks the locators. It also asserts that every other key is unchanged and that the file keeps its two-space formatting.

No Lean file is involved; nothing was compiled or built. The graph numbers describe the tested effect of the revised packet, not a promotion performed by this fix.
