# RT-RS-15: fixes

Fixer: Claude Code, session `cc-39fac3`, 29 September 2026 (issue #3995, job FIX-RT-RS-15).
- Findings: `RT-RS-15.result.json`.
- Verdicts: `RT-RS-15.review.json`.
- One finding, confirmed.

## RT-RS-15/1 (medium, error): the dependent narrowing is withheld; the edge replacement and its tests are for the maintainer

**Finding.** RS-15 narrows `VectorBundlesAndIsocrystals:VB3:general-BC` and names `VB4` as a supplier. That is only sound together with an atomic replacement of the prerequisite `VB3:general-BC → VB4` by `VB4 → VB3:general-BC`. `scripts/restructure.py` cannot delete a stage edge. It writes the narrowing first, then skips the reverse link because the old edge closes a cycle, and it has no rollback. So the live atlas has the layer narrowed, with VB4 in `suppliedBy`, while the old edge survives and the new one is absent.

The fix asks for three things:
1. an atomic, maintainer-authorized replacement, with no invented, ignored JSON deletion key;
2. until that is executable, rejecting or withholding the whole dependent narrowing rather than accepting skipped supplier links;
3. regression tests of the real `apply_restructurings` and `assemble` paths.

The review confirmed the finding end to end. It adds that the tool should refuse to apply a proposal's narrowings when any of its links is skipped, and fail loudly.

**What I verified at origin/main (29 September 2026).** Nothing upstream has changed since the red team:
- `scripts/restructure.py` was last changed on 21 September 2026 (7b87394a) and still has no edge deletion. It still applies layers before links and records `skippedLinks` without rollback.
- `data/restructure/RS-15.result.json` is still byte-identical to the accepted research file (blob `5af94784`).

I reran `apply_restructurings` read-only on the promoted proposals and reproduced the red team's record: five links, skipped `[VB4, VB3:general-BC]`, and `general-BC` narrowed.

**What I changed.**

1. `research/blueprint/restructure/RS-15.result.json`:
   - **`layers[VB3:general-BC]`** is now `keep`, with no `keeps` or `suppliedBy`.
     - Its reason cites RT-RS-15/1 and explains that the narrowing is withheld together with the reverse link until the edge replacement can be applied atomically.
     - It points to where the accepted target is recorded.
     - It carries the accepted corrections that do not depend on the deletion, so they still bind blueprint work on the layer: `BC([E_1 → E_0])` is degree-zero hypercohomology with `E_1` in degree −1, with its three test complexes; and in the positive-slope-resolution node, FS II.3.1's "degree 1/r" reads "semistable of slope 1/r".
   - **`layers[VB4]`**: in its reason, the sentence "DELETE general-BC as a prerequisite and export VB4 to general-BC instead, atomically" now says:
     - the correction is atomic and withheld with the narrowing;
     - the existing prerequisite stays until then;
     - the proposal adds no `VB4 → general-BC` link.

     The rest of the reason, including its local-system corrections, is unchanged.
   - **`links[1]`** (`VB4 → VB3:general-BC`, "ADD ONLY AFTER deleting general-BC -> VB4 …") is removed, so no RS-15 link can be silently skipped. Fourteen links remain.
   - **Not changed:** both roadmap decisions, the two `owners` entries, the other fourteen links and the `review` block.
     - The owners are the accepted ownership. The red team found the ownership split and all retained targets justified.
     - The remaining links are true dependencies in either graph and close no cycle.

   No deletion key or other new field was added.

2. `research/blueprint/restructure/RS-15.md`:
   - a new section "Red-team fix: the narrowing is withheld". It explains the change and records verbatim the accepted `narrow` entry (keeps, suppliedBy, reason) and the withheld link with its reason. It states the reinstatement condition: the narrowing and the link go live only in the same integration that deletes the old edge and its mirrored `requires` and consumer entries, retains `VB3:projectivized-properness → VB4`, and adds `VB4 → VB3:general-BC`, with no skipped RS-15 link;
   - small corrections to the Summary, the integration contract, the conservation-ledger rows for `general-BC` and `VB4`, the link-delta row for `VB4 → general-BC`, and the validation note.

**Checks.**
- `python3 scripts/check_restructure.py research/blueprint/restructure/RS-15.result.json` passes.
- `python3 research/blueprint/intake.py check-files` passes on the three deliverables.
- The unit suite passes.
- I ran the real `apply_restructurings` read-only against `data/atlas.json`, with the fixed file both alone and in place of the promoted copy among all 23 promoted proposals. I also ran `build.assemble(require_distances=False)` with the fixed file substituted for the promoted copy. In every run:
  - RS-15 adds five links, with `skippedLinks` empty and no narrowed layer;
  - `general-BC` has no `restructured` annotation;
  - the old edge and its mirrored `requires` and consumer entries are intact, consistently with the kept layer;
  - all seventeen member stages survive, and the graph is acyclic.
- Deleting the old edge and adding the reverse link in that graph leaves `general-BC` with no path to `VB4`, so the withheld integration is acyclic.

**For the maintainer.** None of these files is a deliverable of this job.

1. **Promotion.** The live copy `data/restructure/RS-15.result.json` still has the accepted file with the narrowing. The build keeps applying the partial integration until the fixed file is promoted (after its next accepted review, per `promote.py`) or the replacement below lands.
2. **Tool fix.** Make restructuring transactional in `scripts/restructure.py`, as the review suggests. Before writing any `restructured` annotation, check every link of the proposal. If any is skipped, whether for a cycle or a missing end, apply none of the proposal's narrowings or drops and fail the build rather than record `skippedLinks` and continue.
3. **Integration.** To reinstate the accepted RS-15, give the maintainer's integration a supported way to replace an edge. Remove `VB3:general-BC → VB4` from `stageEdges`, `VB4.requires` and `general-BC`'s consumers in the same step that adds `VB4 → VB3:general-BC`. Then restore the recorded `narrow` entry and link from RS-15.md.
4. **Regression tests** (`tests/test_restructure.py`), from the finding, against the real `apply_restructurings` and `assemble` paths:
   - the old edge is absent and the new edge present, with reciprocal `requires` and consumers;
   - RS-15 has no skipped link;
   - all 17 stages, the 23 inherited nodes and the twelve external exports are retained;
   - the graph is acyclic;
   - a negative control: the reverse link without the deletion is rejected, and none of the proposal's narrowings is applied.
