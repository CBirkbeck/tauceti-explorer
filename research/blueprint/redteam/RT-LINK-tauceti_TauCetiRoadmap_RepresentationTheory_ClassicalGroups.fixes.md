# RT-LINK-tauceti_TauCetiRoadmap_RepresentationTheory_ClassicalGroups: fixes

Fixer: Claude Code, session `cc-f805bf`, 30 September 2026 (issue #5038).
- Findings: [`RT-LINK-tauceti_TauCetiRoadmap_RepresentationTheory_ClassicalGroups.result.json`](RT-LINK-tauceti_TauCetiRoadmap_RepresentationTheory_ClassicalGroups.result.json).
- Verdicts: [`RT-LINK-tauceti_TauCetiRoadmap_RepresentationTheory_ClassicalGroups.review.json`](RT-LINK-tauceti_TauCetiRoadmap_RepresentationTheory_ClassicalGroups.review.json) and the report `research/blueprint/reviews/REV-RT-LINK-tauceti_TauCetiRoadmap_RepresentationTheory_ClassicalGroups.md`, whose authorized scope this fix follows.
- Base: `91d6892`. One finding, confirmed.

The only edited file is the link map `research/blueprint/links/tauceti_TauCetiRoadmap_RepresentationTheory_ClassicalGroups.json`. As in the Grothendieck/Euler and SemisimpleAlgebras link fixes, the promoted copy in `data/links` is not edited. It was byte-identical to the research file before this fix, and normal independent acceptance and promotion carry the revised packet there. This fix does not edit the generated graph, the SchurWeyl packet or either roadmap README.

## /1 (medium, missing): the diagonal tensor-action owner is settled by the pin, and ClassicalGroups Layer 1 → SchurWeyl Layer 8 is missing

**Rechecked at the base.**
- `overlaps[4]`, added by the review, still said "The present contracts do not decide ownership, so this is an overlap proposal, not a new directed dependency" and "Keep permutation action, commutation and image-level double centralizer in SchurWeyl."
- Its two quotations are raw text that occurs exactly once in the current stage description and in the README: ClassicalGroups README lines 202–203 (`tensorPowerRep n d`, "the `d`-fold tensor power of `stdRep` (diagonal action)") and SchurWeyl README line 348 (`glAction d n g = PiTensorProduct.map (fun _ => g)`). SchurWeyl's `tensorSpace d n = ⨂[ℂ] (_ : Fin n), (Fin d → ℂ)` has dimension `d` and degree `n`, so the two constructions agree with the parameter names swapped.
- Pinned Tau Ceti `f790474`, read for this fix:
  - `TauCeti/RepresentationTheory/Tensor/Power.lean`: `Representation.tensorPower` (line 100), `tensorPower_apply` (line 106, `ρ.tensorPower d g = PiTensorProduct.map fun _ : Fin d => ρ g`);
  - `TauCeti/RepresentationTheory/ClassicalGroups/TensorPower.lean`: `TauCeti.tensorPowerRep k n d := (stdRep k n).tensorPower d` (line 55), `tensorPowerFDRep` (line 60), `commute_permTensorAction_tensorPowerRep` (line 67, whose docstring calls it "the first Layer 2 target of the classical-groups roadmap") and `commute_permTensorActionAlgHom_tensorPowerRep` (line 74);
  - `TauCeti/RepresentationTheory/Symmetric/TensorAction/Basic.lean`: `reindexRepresentation` (line 48), `permTensorAction` (line 107);
  - `TauCeti/RepresentationTheory/Symmetric/TensorAction/GeneralLinear.lean`: line 8 is `public import TauCeti.RepresentationTheory.ClassicalGroups.TensorPower`, and the GL/S_d mutual-centralizer theorems (lines 67, 77, 91, 103, 113, 126) are stated with `tensorPowerRep k n d` under `[Field k] [Infinite k] [NeZero (d ! : k)]`, with `n` the dimension and `d` the degree. ℂ satisfies these hypotheses.
- The in-memory production assembly (`build.assemble(require_distances=False)`) gives 2,840 stages and 8,253 distinct stage edges. The red team's 8,007 is lower because other link packets were promoted since. The edge ClassicalGroups Layer 1 → SchurWeyl Layer 8 is absent, and there is no path in either direction through the edges and `requires` entries. No other link map lists the pair.

**Changes.**

1. **One link appended** to `links` (now 13), with `inferred` confidence:
   - source `tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups#layer-1-functorial-constructions-and-tensor-powers`;
   - target `tauceti:TauCetiRoadmap/RepresentationTheory/SchurWeyl#layer-8-schur-weyl-duality`;
   - `origin`: `added-by-FIX-RT-LINK-tauceti_TauCetiRoadmap_RepresentationTheory_ClassicalGroups`.

   The evidence is the two quotations of `overlaps[4]`, copied unchanged with their paths and locators. Neither quotation names the other roadmap, so the confidence is `inferred`. The reason sets the scope the red team gave and the verifier endorsed:
   - **What is exported.** Only the early diagonal tensor-power action and its carrier/convention comparison, over k = ℂ, with dimension n and degree d. It says that SchurWeyl's displayed names `d, n` are reversed and that the consumer identifies its carrier with `⨂[ℂ]^d (Fin n → ℂ)` instead of defining a second action.
   - **Pinned supplier and consumer.** It cites `Representation.tensorPower`/`tensorPower_apply`, `TauCeti.tensorPowerRep`/`tensorPowerFDRep`, and the `GeneralLinear.lean` import of `ClassicalGroups.TensorPower`. It keeps that consumer's field hypotheses `[Field k] [Infinite k] [NeZero (d ! : k)]`.
   - **Commutation.** Following the verifier's refinement, the existing `commute_permTensorAction_tensorPowerRep` and `commute_permTensorActionAlgHom_tensorPowerRep` are consumed as pinned API and commissioned again on neither side. They are not made a Layer-1 export, and no ClassicalGroups Layer 2 edge is added.
   - **Excluded.** No reverse ClassicalGroups Layer 2 → SchurWeyl Layer 8 edge, and no demand for ClassicalGroups' Weyl construction, highest-weight classification or character theory. The Young-image, highest-weight and character-theory boundaries stay separate. The link does not certify the rest of SchurWeyl Layer 8 or commission its image-level double centralizer, which the pin already provides.

2. **`overlaps[4]` revised.** Its stages, `detail`, `recommendation` (`rescope`), evidence and `addedBy` are unchanged. The `proposal` now says:
   - the pinned library settles ownership: ClassicalGroups Layer 1 supplies the constructor and SchurWeyl Layer 8 consumes it, through the new link;
   - neither side commissions another constructor; the existing `Representation.tensorPower` / `TauCeti.tensorPowerRep` API and the permutation-commutation results are consumed, which replaces the older wording that kept the commutation in SchurWeyl;
   - the n/d convention match, as before;
   - the image-level double centralizer stays a SchurWeyl Layer 8 statement that the pin already states, so it is not commissioned again;
   - the separate boundaries and the absence of a reverse edge.

   A new field `revisedBy` names this job.

3. **Summary.** The first sentence now counts "one outgoing link added by the red-team fix". A closing sentence records the scoped pinned-library check, the resolved constructor boundary and the new outgoing link. The rest is unchanged.

4. **Provenance.** `libraryAssessment` keeps the original statement (no declaration-availability claims in the mapping) as history. It then lists the declarations and files read at `f790474` for this fix, says that they settle the constructor boundary and support the new link, and says that no other availability claim is made. `readingBoundary` gains one sentence: the fix read those Lean declarations and no others. The other provenance fields are unchanged.

5. **SchurWeyl `examined` note.** One sentence is appended: the fix resolves the constructor overlap from the pinned library and adds the one outgoing link, limited to the diagonal action. The other 216 examined entries are unchanged.

6. **Review narrative.** In `review.notes`, a red-team correction is appended. It says that the confirmed finding showed that the pin settles the ownership the review-added overlap left open, that the packet now carries the new link and a revised proposal, and that the `added` entry is kept as history. It also says that the review's status and date are historical and do not represent a review of this revision, which needs renewed independent acceptance before promotion. `review.status`, `reviewer`, `date`, `removed`, `added` and `counts` are unchanged.

7. **Fix provenance.** A new `redteamFix` object, following the Grothendieck/Euler precedent, records the job, finding, verification file, agent, session, date, base, scope and the validation numbers below.

**Not changed (out of scope).**
- the twelve original links (checked equal field by field);
- overlaps 0–3, `unresolvedInterfaces` and `alreadyRecorded`;
- both roadmap READMEs, the SchurWeyl link packet and `data/links`;
- the generated atlas data.

The verifier's limits are followed: the edge is scoped to the diagonal action and its convention comparison, the commutation is consumed and not re-commissioned, the GL/S_d consumer keeps its field hypotheses, and no reverse or classification edge is added.

**For the maintainer.** The revised packet needs renewed independent acceptance and promotion. The existing review signature does not cover the changed text.

## Validation

- `python3 scripts/check_links.py` on the edited map: 13 links, 5 overlaps, 217 examined; **0 errors, 0 warnings**.
- In memory, merging the edited packet with `merge_links` into the assembled atlas gives **8,253 → 8,254** edges. The one new edge is exactly ClassicalGroups Layer 1 → SchurWeyl Layer 8. A second merge gives **8,254** again. SchurWeyl Layer 8's `requires` now contains ClassicalGroups Layer 1, and the merge's own cycle check passes.
- I took the union of the assembled edges, every `requires` entry and the `links` of all 36 research link maps, with the edited map in place of the old one. It has **8,362** distinct pairs (8,361 without the new pair) and is **acyclic**.
- `python3 research/blueprint/intake.py check-files` on both deliverables (link map and this report): 0 problems. `git diff --check` passes.
- The edit was applied by one script that asserts these preconditions:
  - twelve links and five overlaps, with the pair absent from `links`;
  - `overlaps[4]` on exactly this pair, with the old proposal sentences;
  - the exact old summary, `libraryAssessment`, `readingBoundary`, SchurWeyl examined note and review notes;
  - no existing `redteamFix`.

  It checks both quotations as unique raw substrings of the current stage descriptions and READMEs. It also asserts that every other key is unchanged. It edits the file line by line, keeping its one-entry-per-line layout, and checks that the result parses to exactly the intended object.

No Lean file is involved; nothing was compiled or built. The graph numbers describe the tested effect of the revised packet, not a promotion performed by this fix.
