# RT-LINK-tauceti_TauCetiRoadmap_RepresentationTheory_SemisimpleAlgebras: fixes

Fixer: Claude Code, session `cc-f805bf`, 30 September 2026 (issue #5040).
- Findings: [`RT-LINK-tauceti_TauCetiRoadmap_RepresentationTheory_SemisimpleAlgebras.result.json`](RT-LINK-tauceti_TauCetiRoadmap_RepresentationTheory_SemisimpleAlgebras.result.json).
- Verdicts: [`RT-LINK-tauceti_TauCetiRoadmap_RepresentationTheory_SemisimpleAlgebras.review.json`](RT-LINK-tauceti_TauCetiRoadmap_RepresentationTheory_SemisimpleAlgebras.review.json), whose authorized scope this fix follows.
- Base: `e7374e7`. One finding, confirmed.

The edited files are the link map `research/blueprint/links/tauceti_TauCetiRoadmap_RepresentationTheory_SemisimpleAlgebras.json` and the review report `research/blueprint/reviews/REV-LINK-tauceti_TauCetiRoadmap_RepresentationTheory_SemisimpleAlgebras.md`, which receives an appended correction note. As in the Grothendieck/Euler, ZigzagPreprojective and StablePeriodicCurved link fixes, the promoted copy in `data/links` is not edited. It was byte-identical to the research file before this fix, and normal independent acceptance and promotion carry the revised packet there. This fix does not edit the generated graph or the QuiverRepresentations packet.

## /1 (medium, missing): SemisimpleAlgebras Layer 2 → Quiver Layer 3 never reaches the atlas

**Rechecked at the base.** The QuiverRepresentations link packet is still `partial`. It has no review block and no `data/links` counterpart, so it has not been accepted or promoted since the red team. It is still the only packet that lists the pair under `links`. The in-memory production assembly (`build.assemble(require_distances=False)`) gives 2,840 stages and 8,252 distinct stage edges. The count is higher than the red team's 8,007 because other link packets were promoted in the meantime. Both endpoints are present, but the edge is not. There is no forward or reverse path between the endpoints through the edges and `requires` entries. So one canonical pair is added here, and no duplicate arises.

**Changes.**

1. **One link appended** to `links` (now 6), with `inferred` confidence:
   - source `tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-2-artin-wedderburn-assembled-with-uniqueness`;
   - target `tauceti:TauCetiRoadmap/RepresentationTheory/QuiverRepresentations#layer-3-the-structure-of-a-finite-dimensional-algebra`;
   - `origin`: `restored-from-alreadyRecorded-by-FIX-RT-LINK-tauceti_TauCetiRoadmap_RepresentationTheory_SemisimpleAlgebras`.

   The evidence is the two-sided evidence from `alreadyRecorded[0]`, copied unchanged. I checked that each quotation is raw text that occurs exactly once in the current stage description and in its README (SemisimpleAlgebras README lines 222–223, Quiver README lines 285–287):
   - supplier side: "the\n  chosen index is in bijection with isomorphism classes of simple \`R\`-modules (via Layer 1.5)";
   - consumer side: "and its Wedderburn decomposition indexes the simple\n  modules; over \`[IsAlgClosed k]\` the blocks are matrix algebras over \`k\`. Consume\n  [semisimple algebras](../SemisimpleAlgebras/README.md) for the Wedderburn side."

   The confidence stays `inferred`, as the reviewed `alreadyRecorded` entry had it: only the consumer names the supplier.

   The reason starts with the reviewed `alreadyRecorded[0]` reason, verbatim. That text applies the Wedderburn presentation and the block/simple-module indexing to A/J(A). It leaves to the quiver owner the passage between simple A-modules and simple A/J(A)-modules and the lifting and projective-cover results. The reason then adds the scope the red team set and the verifier endorsed:
   - **What is exported.** Only the Wedderburn presentation and the canonical block/simple-module dictionary, applied to the semisimple quotient A/J(A) of a finite-dimensional k-algebra A, never to A itself.
   - **Pinned reuse, not supplied by the link.** Semisimplicity of A/J(A) is the pinned Tau Ceti radical-quotient API: `TauCeti.isNilpotent_jacobson` and `TauCeti.isSemisimpleRing_quotient_jacobson` in `TauCeti/RingTheory/Jacobson/FiniteDimensional.lean` at `f790474`. I read both declarations there. This is the shared subproblem of the packet's existing Layer 0 / Quiver Layer 3 overlap.
   - **Coefficients.** Over a general field the blocks' division rings are retained. Only over `[IsAlgClosed k]` are the blocks matrix algebras over k.
   - **Kept by QuiverRepresentations.** The transport between simple A-modules and simple A/J(A)-modules, primitive-idempotent lifting, semiperfectness, projective covers, basic algebras and Morita reduction, and the Gabriel presentation.
   - **Excluded.** The link does not ask SemisimpleAlgebras to reprove Mathlib's Wedderburn existence theorem.

2. **`alreadyRecorded[0]` kept as superseded provenance.** Its `kind`, `file`, `reason`, `confidence` and `evidence` are unchanged, as history. Two fields are new:
   - `state`: `superseded; restored-to-links`;
   - `supersededNote`: the file it names is a partial, unreviewed research packet with no promoted counterpart; the pair is now carried in this packet's `links`; it should be deduplicated again only after a reviewed, promoted QuiverRepresentations packet carries the edge; and the entry does not accept or promote that packet.

   The packet has no `reviewFollowUp` field, so the follow-up is recorded in this note and not in a new field.

3. **Summary corrected.** The old summary spoke of "a checked reference to the existing QuiverRepresentations link" and said review "removes one duplicate proposal". It now says four things:
   - the packet has six prerequisite links, to CharacterTheory, QuadraticFormInvariants and QuiverRepresentations;
   - the review had moved the Quiver pair to `alreadyRecorded`, deferring to a partial, unreviewed research packet with no promoted counterpart, so that research proposal never became an atlas edge;
   - the fix restores it as a sixth link, scoped to A/J(A);
   - the five reviewed links and three overlaps are unchanged.

   The rest of the summary, on baseline reuse and consumer adapters, is unchanged.

4. **Quiver `examined` note corrected.** The original note is kept. A sentence is appended: the QuiverRepresentations research packet also lists the edge but is partial and unreviewed, so the edge is carried in this packet's `links`, with the `alreadyRecorded` entry kept as superseded provenance. The other 216 examined entries are unchanged.

5. **Review narrative corrected.** In `review.notes`, a passage is added after "one valid Quiver edge deduplicated into alreadyRecorded". It says five things:
   - the review said removing the Quiver proposal removed no graph edge;
   - the pair's only other host is a partial, unreviewed research packet with no promoted counterpart, so the pair was not in the atlas: a research proposal is not a promoted graph edge;
   - the fix restores it as a sixth link;
   - the `removed` entry is history;
   - the review's status and date are historical and do not represent a review of this revision, which needs renewed independent acceptance before promotion.

   `review.status`, `reviewer`, `date`, `removed` and `added` are unchanged. The original reviewer is not credited with reviewing the restored link.

6. **Fix provenance.** A new `redteamFix` object, following the Grothendieck/Euler and StablePeriodicCurved precedents, records the job, finding, verification file, agent, session, date, base, scope and the validation numbers below.

7. **Review report corrected, minimally.** The finding also names the Quiver row of `research/blueprint/reviews/REV-LINK-tauceti_TauCetiRoadmap_RepresentationTheory_SemisimpleAlgebras.md`. The verifier asked for the prior review's graph claim to be corrected, not for the review to be redone. So the existing text, verdicts, status and date are unchanged. A section headed "Correction by FIX-RT-LINK-tauceti_TauCetiRoadmap_RepresentationTheory_SemisimpleAlgebras (30 September 2026)" is appended. It does four things:
   - it names the three stale statements: the opening's "the exact QuiverRepresentations pair is already present in that roadmap's packet", the Quiver row's "Removing this proposal removes no graph edge" and the validation line "The Quiver edge already belongs to the before graph";
   - it explains why they fail: the host is a partial, unreviewed, unpromoted research packet, and the review's graph test used the union of research proposals, not the promoted graph;
   - it says the pair is now carried in the packet's `links`, with the review's A/J(A) scope and quiver-owned obligations kept;
   - it says the review does not cover the revised packet, which needs renewed independent acceptance before promotion.

**Not changed (out of scope).** The following are unchanged:
- the five original links (checked equal field by field);
- the three overlaps, `inputClarifications` (G1–G6), `provenance`, `reviewBaseline` and the other examined entries;
- both roadmap READMEs;
- the QuiverRepresentations packet, which this fix does not approve or promote.

The verifier's limits are followed: the pair stays scoped to A/J(A) with the quiver-owned obligations, the unrelated Quiver packet is not accepted wholesale, and the generated graph is not edited.

**For the maintainer.**
- The revised packet needs renewed independent acceptance and promotion. The existing review signature does not republish the changed text.
- The verifier in the StablePeriodicCurved fix suggested that `check_links.py` or `promote.py` should flag a `deduplicatedLinks`, `existingLinks` or `alreadyRecorded` entry whose host packet is not promoted. This fix does not change scripts. The suggestion stands: the same failure has now needed a fix in four packets (Grothendieck/Euler, ZigzagPreprojective, StablePeriodicCurved and this one).

## Validation

- `python3 scripts/check_links.py` on the edited map: 6 links, 3 overlaps, 217 examined; **0 errors, 0 warnings**.
- In memory, merging the edited packet with `merge_links` into the assembled atlas gives **8,252 → 8,253** edges. The one new edge is exactly SemisimpleAlgebras Layer 2 → Quiver Layer 3. A second merge gives **8,253** again. Quiver Layer 3's `requires` now contains SemisimpleAlgebras Layer 2, and the merge's own cycle check passes.
- I took the union of the assembled edges, every `requires` entry, every research link map's `links` and the edited map (36 link maps). It has **8,361** distinct pairs and is **acyclic**. The new pair adds nothing to this count, because the partial Quiver research packet already lists it.
- `python3 research/blueprint/intake.py check-files` on all three deliverables (link map, review report, this report): 0 problems. `git diff --check` passes.
- The edit was applied by one script that asserts these preconditions:
  - five links, with the pair absent from `links`;
  - one `alreadyRecorded` entry for exactly this pair;
  - the Quiver packet still partial and unreviewed, with no `data/links` copy;
  - the exact old summary, examined and review sentences.

  It checks both quotations as unique literal substrings of the stage descriptions and READMEs. It also asserts that every other key is unchanged. It edits the file textually, keeping its two-space layout and its one-line examined entries, and checks that the result parses to exactly the intended object.

No Lean file is involved; nothing was compiled or built. The graph numbers describe the tested effect of the revised packet, not a promotion performed by this fix.
