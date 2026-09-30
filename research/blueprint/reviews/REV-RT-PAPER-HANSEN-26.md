# REV-RT-PAPER-HANSEN-26

**Complete: the single finding is confirmed, with a corrected scope.** Route 3 does carry the parent's title from before RS-22. But the stale prefix is on twelve routes, not thirteen, and route titles name nothing in the queue. The authorised change is route 3's title only. The rest goes to the maintainer.

- **Job:** Refs #4527.
- **Verifier:** Claude Code, session `cc-f805bf`, 30 September 2026.
- **Independence:** other sessions did the earlier work on this paper:
  - the extraction PAPER-HANSEN-26 (cc-39fac3);
  - its review REV-PAPER-HANSEN-26 (cc-fb70e5);
  - the red team RT-PAPER-HANSEN-26 (cc-c2c06b).

  The string `cc-f805bf` occurs in none of the red-team, extraction or review files for this paper.
- **Disclosure:** this session wrote PAPER-FARGUES-SCHOLZE-21. The red team cites that extraction: its route 11 joins this extraction's route 1 (the StableCenter Part II of ExcursionOperatorsAndSpectralAction). The finding concerns route 3, not route 1. PAPER-FARGUES-SCHOLZE-21 has no route to HeckeStacksAndLocalShtukas. This verdict does not judge any route or item of PAPER-FARGUES-SCHOLZE-21, nor the red team's statement that route 1's coalescence with it is consistent.
- **Verdicts:** [`research/blueprint/redteam/RT-PAPER-HANSEN-26.review.json`](../redteam/RT-PAPER-HANSEN-26.review.json). `python3 scripts/check_redteam.py` on it reports `ok`.

| Finding | Severity | Verdict |
| --- | --- | --- |
| /1: route 3 uses the parent's pre-RS-22 title | low | confirmed; fix route 3's title only; the other routes and the queue generator are maintainer notes |

## Evidence

**Paper.**
- I read [the published article](https://doi.org/10.1017/fmp.2026.10028), fetched 30 September 2026: Forum Math. Pi 14 (2026) e10, 14 pages. This is the version the extraction recorded.
- Its SHA-256 is `3b6a8f71…4941`. This differs from the extraction's and the review's hashes, as the extraction's `sourceVersions` note predicts: Cambridge Core stamps every page of each download.
- A reproducible hash is recorded in the verdict file: the text with the stamp lines removed.
- I read the abstract, §1 and §2.2. The paper uses the character formula of [HKW22, Theorem 6.5.2], and needs it "in its most general form" for Proposition 2.7(ii). So route 3's substance holds. The finding concerns only the title.

**Repository.** Read at `317cfd3d`. None of the files involved has changed since the red team's input `7cd697e4`. No Lean was compiled.

## /1: route 3's title (confirmed, low)

**What holds.**
- Route 3's title is "Hecke correspondences and local shtuka cohomology, Part II: the Lefschetz–Verdier trace formula and the Kottwitz conjecture". It was copied from PAPER-HANSEN-KALETHA-WEINSTEIN-22's route 1.
- The accepted RS-22 renamed the parent "Hecke correspondences on the Fargues–Fontaine curve and local shtuka cohomology". REV-RS-22 was committed on 23 September at 12:26 UTC. That is after HKW22's extraction (00:25 the same day) and six days before this extraction and its review.
- `scripts/build.py` applies accepted restructurings, including titles, so the published atlas shows the new title.
- §16 asks for "<that roadmap's title>, Part II: …". The review checked this prefix for route 1 but not for route 3.
- Low severity is right. Nothing about the item, its status or its owner changes.

**Against the red team.**
- **The count.** There are twelve part-ii routes to this parent in nine extractions, not thirteen: GLX26 R11 and R12, HANSEN-26 R3, HKW22 R1, HE-21 R10, KISIN-17 R7, KPZ26 R7, SW20 R4, VANHOFTEN-24 R7 and R9, and ZHU-17 R15 and R17. The red team's own list, plus this route, also gives twelve.
- **"The atlas shows the new title."** Only the assembled atlas does. The raw snapshot `data/atlas.json` still has the old title, and `make_queue.py` reads that snapshot without applying restructurings.
- **Route titles do not name anything.** `make_queue.paper_designs` groups part-ii routes by parent. So the Kottwitz, Integral and AffineDeligneLusztig proposals all feed one pending job, `DESIGN-HeckeStacksAndLocalShtukasPartII`. That job's title comes from the parent's title in the raw snapshot, and the route titles are only quoted in its list of proposals. The queue therefore already names the job "Hecke correspondences and local shtuka cohomology, Part II", and editing the route would not change that. The red team says the generator "should derive the prefix" from the parent. It already does, but from the snapshot taken before the restructuring.
- **Keeping HKW22 in step.** This is not needed for coalescing, which goes by parent.

**Authorised fix.** A low finding creates no FIX-RT job. If the file is next edited for another reason, make one change in `research/blueprint/papers/PAPER-HANSEN-26.result.json`:
- change the title of route 3 to "Hecke correspondences on the Fargues–Fontaine curve and local shtuka cohomology, Part II: the Lefschetz–Verdier trace formula and the Kottwitz conjecture";
- keep the route at position 3, and leave its id, parent, area, items, brief and reason unchanged;
- re-run `check_paper.py`.

The `.md` does not quote the title and stays as it is, as does the paper review. HKW22 and the other ten routes are outside this red team's target.

**Maintainer notes, not fixer edits:**
- `make_queue.py` should take Part II design-job titles from the atlas after applying the accepted restructurings. `DESIGN-HeckeStacksAndLocalShtukasPartII` currently has the pre-RS-22 name.
- The twelve route titles, including VANHOFTEN-24's older "Hecke stacks and local shtukas" prefix, can be retitled in one sweep.

## Checks

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-HANSEN-26.review.json`: ok.
- `python3 research/blueprint/intake.py check-files` on both files: 0 problems.
