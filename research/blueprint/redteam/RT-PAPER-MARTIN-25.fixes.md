# RT-PAPER-MARTIN-25: fixes

Fixer: Claude Code, session `cc-39fac3`, 29 September 2026 (issue #3955, job FIX-RT-PAPER-MARTIN-25).
- Findings: `RT-PAPER-MARTIN-25.result.json`.
- Verdicts: `RT-PAPER-MARTIN-25.review.json`.
- One finding, confirmed.

## RT-PAPER-MARTIN-25/1 (medium, missing): already fixed upstream; verified, no change to Martin's files

**Finding.** `make_queue.py` created one design and one review job per accepted route. Four accepted routes point to ArithmeticDynamicsPartIIMarkoff: Chen, Gamburd–Magee–Ronan, Martin and Ghosh–Sarnak. So regeneration produced duplicate `DESIGN-ArithmeticDynamicsPartIIMarkoff` jobs whose single prompt kept only the last paper's brief, losing Martin's 35 item references. The finding and the review both locate the defect in the queue generator, not in Martin's extraction, and say not to rewrite that extraction.

**What I verified at origin/main (29 September 2026).**
1. **The generator is fixed.** Commit 7685a59f (28 September 2026, "Queue: one design job per Part II parent, and per new roadmap") makes `paper_designs` group every Part II proposal for the same parent into one job, and every new-roadmap proposal with the same id into one job. Commits 4d2c057a and 2b93a6ff refine the prompts.
2. **Regression tests exist.** Commit 7685a59f adds `PaperDesigns` to `tests/test_papers_queue.py`:
   - `test_every_part_ii_proposal_for_one_parent_is_one_design`: two proposals give one design, and both briefs are kept;
   - `test_a_parent_that_already_has_a_part_ii_gets_a_part_iii_built_on_it`;
   - `test_a_new_roadmap_several_papers_call_for_is_one_design`.
   The unit suite passes at this commit.
3. **The live queue is right.**
   - `research/blueprint/queue.json` has no duplicate job ids.
   - `DESIGN-ArithmeticDynamicsPartIIMarkoff` and its review are `superseded`, with the note "folded into DESIGN-ArithmeticDynamicsPartII: one design per Part II parent (2026-09-28)".
   - The single pending job is `DESIGN-ArithmeticDynamicsPartII`, issue #3367, with review `REV-DESIGN-ArithmeticDynamicsPartII`.
4. **Nothing is lost.** Issue #3367 lists all four Markoff routes with their item counts (Chen 13, Gamburd–Magee–Ronan 18, Martin 35, Ghosh–Sarnak 5, so all 71 references), plus DeMarco–Mavraki–Ye's bifurcation route. Each entry quotes the opening of its brief and points to "Full brief and items: research/blueprint/papers/<paper>.result.json, the route to ArithmeticDynamicsPartIIMarkoff". Martin's complete brief and its 35 items stay in `PAPER-MARTIN-25.result.json` route 2, unchanged, which the design job is told to read.

**Changes.** None to `papers/PAPER-MARTIN-25.result.json` or `papers/PAPER-MARTIN-25.md`, as the finding and review require; this report is the only file. `make_queue.py` and its tests are not deliverables of this job, and the maintainer's commits above already contain the requested repair and regression.

**For the maintainer.**
- The finding also asked the regression to check all 71 item references for this destination. The current prompt points to each paper's full item list instead of inlining them (commit 4d2c057a, "quote a proposal's brief briefly and point to the full brief"), which preserves provenance.
- If an inline check is wanted, a test could assert that the combined prompt names each of the four source result files and item counts 13/18/35/5.
