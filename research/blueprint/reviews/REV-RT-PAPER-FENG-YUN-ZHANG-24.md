# REV-RT-PAPER-FENG-YUN-ZHANG-24

**Complete: the single finding is confirmed, but on corrected grounds and with a corrected fix.** Item 31's Grothendieck–Lefschetz half is planned by none of its cited stages. The red team blames R34.1 and RS-17, but the item never cited R34.1 for the trace formula. The misattribution is to EDC.8, and it dates from the extraction. The planned list cannot name PR196, so the fix is SF.2 plus a note, following four accepted extractions.

- **Job:** Refs #4141.
- **Verifier:** Claude Code, session `cc-f805bf`, 30 September 2026.
- **Independence:** other sessions did the earlier work on this paper:
  - the extraction PAPER-FENG-YUN-ZHANG-24 (cc-fb70e5);
  - its review REV-PAPER-FENG-YUN-ZHANG-24 (cc-442dc5);
  - the red team RT-PAPER-FENG-YUN-ZHANG-24 (cc-c2c06b).

  The string `cc-f805bf` occurs in none of the red-team, extraction or review files for this paper.
- **Disclosure:** this session red-teamed PAPER-YUN-ZHANG-17 (PR #4961), which compared this extraction:
  - its /2 is on the shared GlobalShtukas Part II grouping;
  - its /3 corrects this extraction's item 32 note on the Octahedron Lemma;
  - its /8(a) named PR196 as the scheme-level owner of the Grothendieck–Lefschetz formula in YZ17, which is the owner confirmed here.

  This verdict does not judge those findings, nor items 26, 27 or 32.
- **Verdicts:** [`research/blueprint/redteam/RT-PAPER-FENG-YUN-ZHANG-24.review.json`](../redteam/RT-PAPER-FENG-YUN-ZHANG-24.review.json). `python3 scripts/check_redteam.py` on it reports `ok`.

| Finding | Severity | Verdict |
| --- | --- | --- |
| /1: item 31's trace-formula half has no planner among its cited stages | low | confirmed; add SF.2 and rewrite item 31's note; the paper review is not edited |

## Evidence

**Paper.**
- I read [arXiv 2103.11514v4](https://arxiv.org/abs/2103.11514v4), fetched 30 September 2026. Its SHA-256 is `c6a65b8c…182b8`, the same as the extraction's hash for v4. The extraction records that v4 has the same 112 numbered statements as the published version.
- [The version of record](https://doi.org/10.1007/s00222-023-01228-y) was not read: link.springer.com returned an HTML bot-check page instead of the PDF. The finding is about owners, not a quoted statement, so the preprint is enough.
- The paper uses the Grothendieck–Lefschetz formula by name twice:
  - in the proof of Theorem 5.3: "By the Grothendieck-Lefschetz trace formula, we have Tr(Fr, K^Eis_d(T)_Q) = …";
  - in the proof of Proposition 5.6, with (5.10).
- It uses the function-sheaf dictionary in §12 (Theorems 12.1–12.2).
- Proposition 11.8 generalizes [YZ17, Proposition A.12], the Frobenius-graph formula. The proof reduces the stack base to a scheme by a smooth scheme cover.

**Repository.** Read at `8044fa30`. None of the files involved has changed since the red team's input `113e7bcb` or up to origin/main `5a2aecc2`. The pinned baseline's declarations.tsv has no trace-formula declaration, so PR196 is an upstream roadmap contract, not library code. No Lean was compiled.

## /1: item 31 (confirmed, low)

**What holds.**
- Item 31 bundles correspondences and the Grothendieck–Lefschetz formula with the sheaf-to-function dictionary. It is planned at EDC.8 and R34.1.
- EDC.8 plans correspondences, their composition and the trace class. But it says: "Ordinary Frobenius point counting is still PR196 TraceFormula's theorem … An arbitrary fixed-point set does not supply a numerical trace."
- R34.1 plans no trace formula. So the formula has no planner among the cited stages.
- REV-PAPER-YUN-ZHANG-19 made the same call on the parallel item YZ19/120.
- Low is right: PR196 already owns the theorem, so only the citation changes.

**Against the red team.**
- **Item 31 does not cite R34.1 for the trace formula.** Its note says "R34.1 the Frobenius/weight conventions", and it sends the trace formula to EDC.8 through YZ17 A.12. The misattribution is to EDC.8.
- **RS-17 is not the cause.** At the extraction's commit, `c6116e19` (22 September, before REV-RS-17 on 23 September at 13:13 UTC), R34.1 already had no trace formula, and EDC.8 already excluded point counting. RS-17 keeps "Arithmetic/geometric Frobenius … normalization" in R34.1, which is exactly the use the note cites it for. The review missed an error that was there from the extraction.
- **"WC.0 and WC.1 import from it"** is half right. WC.1 requires the TraceFormula; WC.0 requires EllAdicRealization and FrobeniusGeometry.
- **PR196 cannot go in the planned list.** `scripts/check_paper.py` rejects any planned entry that "is not a layer of the atlas". The atlas convention is SF.2, the integration owner of the CohomologicalPointCounting suppliers, with PR196 named in the note. The accepted DELIGNE-74, SCHMIDT-STIX-16, BERGSTROM-FABER-PAYNE-24 and LIU-WOOD-ZUREICKBROWN-24 all do this.
- **The red team missed the stack question.**
  - Herm_{2d} and Lagr_{2d} are algebraic stacks, and EDC is scheme-only (RT-AREA-etale/3, confirmed).
  - For item 31 this is harmless: the paper uses the formula stalkwise at k-points, and does its own reduction to schemes, which is item 27.
  - General stack sheaf theory belongs to RT-AREA-etale's proposed stacks Part II (ST.1–ST.6). That fix's edit 9, to this extraction's route 1 brief, is still waiting for a verdict.

**Authorised fix.** A low finding creates no FIX-RT job. If the files are next edited for another reason, make these changes.

1. In `research/blueprint/papers/PAPER-FENG-YUN-ZHANG-24.result.json`, item 31 only:
   - add `SchemeAndStackFoundations:SF.2` to `planned`, keeping EDC.8 and R34.1;
   - rewrite the note to say that:
     - EDC.8 plans correspondences, their composition and trace classes;
     - the Grothendieck–Lefschetz formula and the trace function on schemes are PR196 TraceFormula's theorem, integrated at SF.2 as in the four extractions above;
     - R34.1 supplies the Frobenius normalization it keeps after RS-17;
     - YZ17 A.12 is PAPER-YUN-ZHANG-17/35, which is missing, and its generalization is item 27 in the Part II;
   - keep the id, name, statement, locator and status (planned);
   - re-run `check_paper.py`.
2. In `PAPER-FENG-YUN-ZHANG-24.md`:
   - add SF.2 (the PR196 trace formula) to the "Planned" bullet;
   - correct "none is restructured or retired" to say that RS-17 narrowed R34.1 to Frobenius normalization adapters, which is the use cited.

**Not authorised:**
- editing REV-PAPER-FENG-YUN-ZHANG-24.md, which records that review;
- removing R34.1;
- splitting item 31 or making it missing;
- touching route 1 or other extractions.

The stack extension belongs to RT-AREA-etale's fix and its pending verdicts.

## Checks

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-FENG-YUN-ZHANG-24.review.json`: ok.
- `python3 research/blueprint/intake.py check-files` on both files: 0 problems.
