# REV-TorsionCohomologyInfrastructure~2 — handoff

Completed independent review for issue #9779 by Claude (Opus 5.5), session claude-8sNRLj, 2026-10-14. The bot confirmed the claim in [comment 6175085479](https://github.com/CBirkbeck/tauceti-explorer/issues/9779#issuecomment-6175085479). Branch: claude-8sNRLj-rev-torsion-cohomology-2. This is a complete review, not a checkpoint; no other job was claimed. The plan was written by Codex sessions codex-bMkPh3 and codex-JxYost, and the first review by codex-DnNNA5; this session did none of them.

**Verdict: accepted, with corrections.** The report is `research/blueprint/reviews/REV-TorsionCohomologyInfrastructure~2.md`.

What changed:

- **Nodes.** 11 of the 38 nodes were corrected and 27 verified, with node-specific notes in the packet's `review.checked`.
  - TC.2/classical-hecke-topology now follows Theorem 4.3.1 (rational cusp spaces, p-adic topology).
  - A false acceptance claim in TC.1/formal-cuspidal-lifting was removed.
  - The auxiliary-prime step of Corollary 5.2.6 is explicit in TC.3/ambient-interior-error (new finding E19).
  - TC.2/geometric-amplitude, TC.2/cech-comparison, TC.3/auxiliary-character-realization and the two TC.4 descent nodes cite the supplier nodes their proofs use.
  - The ClassFieldTheory Layer 11 request is narrowed to Tau Ceti's arithmetic-Frobenius normalization.
- **Source findings.** There are now 28. E1 is rejected; E2–E28 are confirmed. E19 and E20 are new; E21–E28 import confirmed PAPER-SCHOLZE-15 findings at TC locators. E17's revised correction was verified on p.954.
- **Reader.** It was re-rendered from the corrected packet with Markdown escaping; about 36 spans had lost characters on the site.
- **Suggested file.** It gained the standard note; it elaborates with proof placeholders as its only warnings.

Follow-ups for others:

- **Sub-layer split.** Apply the TC.3a/TC.3b split in `restructure` before any AG2.4 revision imports the early TC.3 algebra. Otherwise the stage cycle TC.3→AG2.4→AG2.7→TC.3 appears.
- **Requests to TC from IG and IHR.** Three of the five are not stated by any TC node: IG → TC.3 (boundary non-occurrence of an absolutely irreducible residual representation), IHR → TC.3 (the ACC+ normalization of the Siegel Satake identity) and IHR → TC.2 (equivariance for ramified prime-to-p Hecke operators). The report's table records each; they need a later TC revision or a new stage (RT-AREA-langlands-1/9 already proposes a TC.5).
- **IHG requests.** The two requests to IHG.0 and IHG.1 now carry a placement constraint: they must not be planned in IHR.3–IHR.7, which import TC.
- **PerfectoidSpaces--P0.** It is under revision. TC cites five of its node ids (P2 sheaf theorem and integral almost acyclicity, P3 almost purity and étale almost acyclicity, P7 étale-limit theorem); retarget them if that revision renames them.

Checks run:

- `python3 scripts/check_blueprint.py research/blueprint/packets/TorsionCohomologyInfrastructure.json --index <pinned declaration index>`: 0 errors, 0 warnings.
- In-memory `merge_blueprints` of the packet: succeeds, no skipped links. Cycle check over 2,968 reachable nodes: none; `constructionOrder` respected.
- `lean-check research/blueprint/suggested/TorsionCohomologyInfrastructure.lean`: exit 0, 13 proof-placeholder warnings. A `run_cmd` audit of a scratch copy found no placeholder in any statement. `python3 scripts/check_sorry_data.py`: exit 0.
- A Python port of `src/markdown.js` inline rendering: every reader line's visible text equals its unescaped text.
- `python3 research/blueprint/intake.py check-files` on the five changed files: see the pull request.
