# REV-PadicDifferentialEquationsAndRigidCohomology--RD.7 — handoff

Job #9757, agent Claude (Opus 5.5), session `claude-ylTapP`, 14 October 2026. The bot confirmed [the claim](https://github.com/CBirkbeck/tauceti-explorer/issues/9757#issuecomment-6172254467). The plan under review, `BP-PadicDifferentialEquationsAndRigidCohomology--RD.7` (#9749, PR #9785), was written by `claude-n6fYvL`; this session wrote none of it.

## Outcome

The review is complete. Verdict: **accepted, with corrections made in place.** The verdict is in the packet's `review` object and the full report is in [reviews/REV-PadicDifferentialEquationsAndRigidCohomology--RD.7.md](../reviews/REV-PadicDifferentialEquationsAndRigidCohomology--RD.7.md).

- **Nodes.** 13 nodes: 6 verified, 7 corrected, none added.
- **Baseline.** All 6 declarations confirmed at the pins.
- **Source issues.** E701–E704 confirmed; E705–E707 added.
- **Unit tests.** One added, `RigidCohomology.Tuitman.frobeniusPower_order`.
- **Coverage.** RD.7 stays `planned`. Two `remaining` items were added for the assembly and the RD.3 follow-up.

## Corrections, in brief

1. **Coefficients of the comparisons.** Nodes 1–3 now take F-crystals or locally free convergent isocrystals, through Shiho's functor Φ. The isocrystal of a bare crystal need not be convergent; a G_m example is now an acceptance test.
2. **The abelian-variety theorem.** It is re-proved by weight separation. DWP.1 does not state H^i = ∧^i H^1, and the theorem no longer needs Katz–Messing.
3. **Reversed edges.** Two edges to the parent's `RD.7/kedlaya-point-counting-certification` are removed. That node consumes the reduction-bound lemma and the lattice theorem.
4. **Tuitman's matrix convention.** It is now pinned (rows, decreasing twisted product), with a new test and E707.
5. **Locators.** Harvey §3 → §4; the Tuitman, Shiho and Edixhoven page ranges are completed.
6. **Acceptance.** A cycle-class acceptance claim with no planned support is replaced.

## For the next workers

- **Assembly of RD.7.** Add `RD.7/kedlaya-reduction-denominators` and `RD.7/hyperelliptic-integral-frobenius-lattice` to the prerequisites of `RD.7/kedlaya-point-counting-certification`. Remove its Lemma 4.3.5 gap: Edixhoven's notes are public and were read.
- **RD.3 follow-up (#9745).** Decide whether Shiho's Φ for convergent isocrystals without Frobenius gets its own node. It is sketched in `RD.7/tube-to-envelope-comparison-map`, proof step 4, and used by the Frobenius-free variant of Ogus's comparison.
- **Unchanged.** The other `remaining` items and the three gaps (Mieda unread; C_dR/C_st above this tier; Katz–Messing paywalled) are as the blueprint left them.

## Checks run

- **Blueprint checker.** `python3 scripts/check_blueprint.py --index <pinned declarations.tsv>` gives 0 errors and 0 warnings, before and after the review.
- **Cycles.** The union of all PadicDifferentialEquationsAndRigidCohomology packets has no cycle and no upward stage edge, checked by script.
- **Lean.** `lean-check` on the suggested file exits 0, with 15 warnings, all `declaration uses sorry`, before and after the edit. Memory was checked first (82 GB available). No language server, build or cache download was started, and nothing is left running.
- **Unfinished-proof check.** `scripts/check_sorry_data.py` on the suggested file reports ok.
- **Intake.** `research/blueprint/intake.py check-files` on the five changed files.

Nothing from this job's scratch directory is needed later. The source files are public at the URLs in the packet.
