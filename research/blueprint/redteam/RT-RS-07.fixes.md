# RT-RS-07: fixes

Fixer: Claude Code, session `cc-39fac3`, 29 September 2026 (issue #3994, job FIX-RT-RS-07).
- Findings: `RT-RS-07.result.json`.
- Verdicts: `RT-RS-07.review.json`.
- One finding, confirmed.

## RT-RS-07/1 (medium, error): the dependent AN.3 narrowing is withheld; the edge replacement and its tests are for the maintainer

**Finding.** RS-07 narrows `AnalyticNumberTheory:AN.3` with `SieveMethodsAndPrimePatterns:SV.2` among its suppliers. That rests on replacing the prerequisite AN.3 → SV.2 by SV.2 → AN.3. `scripts/restructure.py` cannot delete a stage edge. It writes the narrowing first, then skips SV.2 → AN.3 as cycle-closing, so the live atlas has AN.3 narrowed while the old edge survives and the new one is absent.

The fix asks the maintainer, or an authorized integration fixer, to apply the edge-removal ledger atomically and to test it. It also says that appending the reverse edge, or marking the supplier as intentionally skipped, does not implement the plan.

The review confirmed the finding and adds two points:
- a regression test must not assert that RS-07 skips no links. Its 16 other skipped links are library (`UPSTREAM:`) addresses, skipped by design; the assertion to use is that no link between two stages is skipped;
- the engine should refuse a proposal's narrowings when such a link is skipped, and fail loudly, since this is the second instance of the RT-RS-15/1 mechanism.

**What I verified at origin/main (29 September 2026).** Nothing upstream has changed:
- `scripts/restructure.py` was last changed on 21 September 2026 and still has no edge deletion;
- `data/restructure/RS-07.result.json` is byte-identical to the accepted research file (blob `12525b6d`).

I reran `apply_restructurings` read-only on the promoted proposals and reproduced the record: 29 links, 17 skipped entries including `[SV.2, AN.3]`, and AN.3 narrowed.

**What I changed.** This is the same repair as FIX-RT-RS-15 (PR #4459, merged), since the finding asks for coordination with RT-RS-15/1. It is the proposal-level form of the engine rule the review recommends: no narrowing stands on a skipped link between two stages.

1. `research/blueprint/restructure/RS-07.result.json`:
   - **`layers[AN.3]`** is now `keep`, with no `keeps` or `suppliedBy`.
     - Its reason cites RT-RS-07/1 and RT-RS-15/1, says the narrowing and the reverse link are withheld until the edge replacement can be applied atomically, and points to where they are recorded.
     - It carries the obligations that do not depend on the deletion: AN.3 takes the RH/GRH statement register of the dropped AN.6 (whose drop still names AN.3 as a supplier), without assuming it; it consumes Perron inversion from ArithmeticDirichletSeries Layer 6; and Bombieri–Vinogradov stays with SV.3.
   - **`layers[SV.2]`**: the sentence "Delete the old requires AN.3 …" now says the deletion is part of the accepted atomic replacement, withheld with the AN.3 narrowing, so the existing prerequisite stays and the proposal adds no SV.2 → AN.3 link. SV.2's own narrowing is unchanged: its suppliers are library addresses, and it does not depend on the reversal.
   - **`links[11]`** (SV.2 → AN.3, "apply only after deleting the old reverse AN.3 -> SV.2 edge") is removed. 57 links remain.
   - **Not changed:** the roadmap decisions, the other 20 layer decisions, the 32 `owners` entries and the `review` block.

   No deletion key or other new field was added.
2. `research/blueprint/restructure/RS-07.md`:
   - a new section "Red-team fix: the AN.3 narrowing is withheld". It records verbatim the accepted `narrow` entry (keeps, suppliedBy, reason) and the withheld link. It states the reinstatement condition: the narrowing and the link go live only in the same integration that deletes AN.3 → SV.2 from the edges, `requires` and consumers, retains SV.1 → SV.2 and AN.2 → AN.3, and adds SV.2 → AN.3, preserving the routes into SV.3;
   - notes in section 6, item 2, the AN.3 ledger row and section 8;
   - corrected counts in section 1. The counts first printed there (7 kept, 12 narrowed, 31 owners, 57 links) did not match the accepted JSON (6, 13, 32, 58). After the fix the JSON has 7 kept, 12 narrowed, 3 dropped, 32 owners and 57 links.

**Checks.**
- `scripts/check_restructure.py` passes on the fixed file.
- `research/blueprint/intake.py check-files` passes on the three deliverables.
- The unit suite passes.
- I ran the real `apply_restructurings` read-only against `data/atlas.json`, with the fixed file alone and in place of the promoted copy among all promoted proposals. I also ran `build.assemble(require_distances=False)` with the fixed file substituted for the promoted copy. In every run:
  - RS-07 adds 31 links alone, and 29 among all proposals;
  - it skips 16 links, all to library addresses, and none between two stages;
  - AN.3 has no `restructured` annotation, and SV.2 is narrowed;
  - AN.3 → SV.2 and SV.2's `requires AN.3` are intact, consistently with the kept layer;
  - all 22 member stages survive, and the graph is acyclic.
- Deleting AN.3 → SV.2 and adding SV.2 → AN.3 in the assembled graph also leaves it acyclic.

**For the maintainer.** None of these files is a deliverable of this job, and the notes are shared with RT-RS-15.fixes.md.

1. **Promotion.** `data/restructure/RS-07.result.json` still has the partial narrowing until the fixed file is promoted (after its next accepted review) or the replacement lands.
2. **Tool fix.** Make `apply_restructurings` transactional. Before writing any `restructured` annotation, check every link of the proposal. If a link between two stages would be skipped, apply none of the proposal's narrowings or drops and fail the build. Skips of `UPSTREAM:`/`tauceti:` addresses that are not atlas stages stay allowed, as the review notes.
3. **Integration.** Give the maintainer's integration a supported way to replace an edge, and use it for AN.3 → SV.2 ⇒ SV.2 → AN.3. Then restore the recorded AN.3 entry and link from RS-07.md.
4. **Regression tests** (`tests/test_restructure.py`), against RS-07 alone, all promoted proposals and full assembly:
   - the old edge is absent and the new edge present, with matching `requires`, consumers and scope/import metadata;
   - no link between two stages is skipped (not "no skipped links", which fails here by design);
   - all 22 member stages and the accepted decompositions' nodes are retained;
   - the graph is acyclic;
   - a negative control: the reverse link without the deletion is rejected, and none of the proposal's narrowings is applied.
