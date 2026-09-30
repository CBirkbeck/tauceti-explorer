# REV-RT-LINK-tauceti_TauCetiRoadmap_ZigzagPreprojective

**Complete: the one finding is confirmed.** The fixer adds one incoming link, QuiverRepresentations Layer 3 → Zigzag Layer 3, to the accepted Zigzag map and retires the matching `alreadyRecorded` entry. The reason in the verdict file sets the scope. It adds two points the red team left out: the Zigzag-side quotation must use its raw indentation, and a pending GEF fix will create an indirect path without making this edge redundant.

- **Job:** Refs #4379.
- **Verifier:** Claude Code, session `cc-f805bf`, 30 September 2026.
- **Independence:** other sessions did the work checked here:
  - the link map (ChatGPT Pro `cgp-0d58f52c658d`);
  - its review (Codex `codex-7e92bd`);
  - the red team (Codex `codex-rtOQ9t`).

  The string `cc-f805bf` occurs in none of the red-team files, the link map or its review.
- **Disclosure:** this session also verified the GrothendieckEulerForms link red team (#4362). That finding covered the same stranded QuiverRepresentations packet, for three different pairs, and it mentioned the Zigzag-hosted pairs in passing.
- **Verdicts:** [`research/blueprint/redteam/RT-LINK-tauceti_TauCetiRoadmap_ZigzagPreprojective.review.json`](../redteam/RT-LINK-tauceti_TauCetiRoadmap_ZigzagPreprojective.review.json).

| Finding | Kind | Severity | Verdict | Scope of fix |
| --- | --- | --- | --- | --- |
| /1 Quiver 3 → Zigzag 3 never reaches the atlas | missing | medium | confirmed | add one link to the Zigzag `links` array with raw quotations; retire `alreadyRecorded[0]`; correct the summary and review narrative; re-review and re-promote |

## Evidence read

- The target link map at main `d870bd36`, with SHA-256 `6c8de93a…d78c`. The promoted `data/links` copy is byte-identical. I read:
  - `alreadyRecorded`;
  - `summary`;
  - the review block;
  - the list of 13 links, all incoming.
- The Zigzag link review, whose row Z2–Z3 records the pair in `alreadyRecorded` "rather than duplicate it".
- The QuiverRepresentations link map, with SHA-256 `91978785…2568`. Its status is `partial` and it has no review block. Its link work was merged only as a partial checkpoint (PR #637).
- Quiver Layer 3, lines 288–294 (projective covers; `cartanMatrix`, `Cᵢⱼ = [Pᵢ : Sⱼ]`), and Zigzag Layer 3, lines 281–291.
- `scripts/build.py` lines 69–75 and `merge_links` in `scripts/decompositions.py`.
- At the Tau Ceti pin `f790474`, I read `IsProjectiveCover` (`ProjectiveCover/Basic.lean` lines 105–111), `exists_isProjectiveCover_of_finiteDimensional` (`Existence.lean` line 194) and `zigzagProjective_projective` (`Zigzag/Projective/Basic.lean` line 145). I also searched the declarations index.

No Lean was compiled; the finding does not need it.

## /1: confirmed

**The gap is real.** `merge_links` reads only `links` from reviewed packets in `data/links`. The pair appears in the Zigzag map only under `alreadyRecorded`. Its only `links` occurrence is in a partial, unreviewed and unpromoted Quiver packet. I ran the production assembler in memory:

- it gives 2,840 stages and 8,007 edges, the same as the red team;
- all 13 focal links are edges and appear in `requires`;
- Quiver 3 → Zigzag 3 is neither, and there is no forward or reverse path between its endpoints.

**The mathematics is right.** Take a finite graph with no isolated vertices.

- The zigzag algebra `Z` is finite-dimensional and `Z/rad Z ≅ k^I`, so `Z` is split basic.
- Each `e_i` is primitive, and `Z e_i` is the projective cover of `S_i`.
- `[P_i : S_j] = dim e_j Z e_i`.

Zigzag 3 uses exactly this. It builds the head and radical layers of `Z e_i`, and it says that at `q = 1` its matrix "is the ordinary composition-factor Cartan matrix". Neither of the other links into Zigzag 3 supplies covers or primitive idempotents:

- Q1 → Z3 gives the unbound module equivalence;
- G4 → Z3 gives K₀ and the Cartan map.

The zigzag Cartan matrix is symmetric, so it cannot reveal the `[P_i:S_j]` versus `[P_j:S_i]` transpose. The convention has to stay explicit.

**The library does not make the edge void.** Tau Ceti has the cover predicate, finite-dimensional existence and the projectivity of `Z e_i`. It has no algebra Cartan matrix and no primitive-idempotent decomposition. The link reason should cite the existing declarations for reuse.

**Challenges to the red team:**
- **Stripped quotation.** The Quiver packet's Zigzag-side quotation reads `…radical\nlayers…`, but the raw text is `…radical\n  layers…`. `check_links.py` passes a scratch copy either way, so the checker will not catch this. The fixer must copy the raw text. The red team's own evidence field quotes only the first line.
- **"No indirect path".** This is true today. However, the confirmed GEF red-team fix adds Quiver 3 → GEF 4, which will give a path Quiver 3 → GEF 4 → Zigzag 3. The direct edge is still warranted, for two reasons:
  - Zigzag 3 uses covers, heads and primitive idempotents directly, while GEF 4 carries only the K₀/Cartan-map frame;
  - a transitive path does not fill Zigzag 3's `requires`.

**Checks on the repair:**
- The Quiver-side quotation is a literal substring of the atlas stage description.
- A scratch copy of the map with 14 links passes `check_links.py` with 0 errors and 0 warnings.
- Merging the link gives 8,008 edges. Merging it a second time also gives 8,008, and `requires` is filled.
- I took the union of the assembled graph, all `requires` entries, every research link map and the proposal. It has 8,118 edges and is acyclic. It already includes Quiver 3 → GEF 4, so the two fixes are acyclic together.

**Authorized scope:**
1. Append one link to the Zigzag `links` array:
   - Quiver `#layer-3-the-structure-of-a-finite-dimensional-algebra` → Zigzag `#layer-3-projectives-graded-cartan-matrices-and-q-euler-forms`, with `inferred` confidence;
   - the reason may follow the Quiver packet's reason, adding that the pinned cover predicate, its existence theorem and `zigzagProjective_projective` are reused;
   - the Zigzag quotation must keep its raw indentation.
2. Handle `alreadyRecorded[0]` in one of two ways:
   - remove it and record it in provenance; or
   - retag it, so it says the host is a partial, unreviewed packet and the pair is now carried in `links`.
3. Correct the summary and review narrative.
4. Get the changed packet independently accepted again and promote it normally.

**Out of scope:**
- the 13 existing links, the seven overlaps and the examined ledger;
- the roadmap READMEs;
- the Quiver packet;
- any GEF edge;
- manual edits to the generated graph.

The fix must not assert hereditary Ext vanishing, finite global dimension, finite dimensionality of preprojective quotients or unconditional Cartan invertibility. If a reviewed Quiver packet is promoted first, the fix is still harmless, because `merge_links` deduplicates ordered pairs.

## Checks

- `python3 scripts/check_redteam.py` on the review file: `ok`.
- `python3 research/blueprint/intake.py check-files` on both deliverables: 0 problems.
- Only these two files are added.

The 13 links and seven overlaps were not re-certified beyond what this finding required.
