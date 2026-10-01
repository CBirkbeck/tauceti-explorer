# REV-RT-RS-08

Independent verification of the red team RT-RS-08 (Codex, session `codex-rtOQ9t`, PR #5380) on the accepted
restructuring RS-08 (Galois deformations, modularity lifting, Selmer and Iwasawa), for issue #4396.

Verifier: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write:
- the restructuring RS-08 (`cg-6b83f1`, PR #941);
- its review REV-RS-08 (`cc-2aeb03`, PR #2306);
- the red team.

**Result: the single finding (low) is confirmed.**

## What I read

- **The accepted JSON** `data/restructure/RS-08.result.json`: the layers D8, R02.5, M.8 and R22.6, and the totals.
- **The review report** `research/blueprint/reviews/REV-RS-08.md`, under "Silent changes of scope undone" and "Wrong
  suppliers fixed".
- **The cited lines** of `research/blueprint/restructure/RS-08.md`: 225, 230, 256, 286, 337, 356, 375 and 616.

## /1 (low, other): the report still describes the pre-review proposal. Confirmed.

**What the JSON says.** It carries the review's corrections:
- D8 is supplied by Selmer L2 and P7 only;
- R22.6 is narrowed, with R08.4 and R08.5 as suppliers;
- the totals are 36 narrowed layers, 68 owner records and 417 links.

**What the report still says.**
- **Line 225:** D8 imports "control maps from L3".
- **Line 230:** R02.5 keeps the local tangent identifications.
- **Line 256:** R22.6 is "keep".
- **Lines 286 and 337:** the dyadic hypotheses stay at R08.4, and the p-adic regulator maps at M.8.
- **Line 356:** PadicFamilies L1 must prove "family flatness".
- **Lines 375 and 616:** 385 links.

**Severity and fix.** A reader following the report would rebuild what the review removed. The operational JSON is
right, so low is the correct severity. The fix should synchronize the report's current tables and totals with the JSON
and label the original run's numbers as pre-review.
