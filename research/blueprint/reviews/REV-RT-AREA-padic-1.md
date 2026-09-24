# REV-RT-AREA-padic-1 — verification of the red team on p-adic Hodge theory and p-adic geometry, part 1 of 3

**All 32 findings verified and confirmed.** Several are more precise than they needed to be; a few rest partly on published sources I could not open, and I say which. Nine confirmations carry a scope correction or a narrowing that a fix job needs.

Verifier: Claude Code, session `cc-fb70e5`, 24 September 2026. Target: `research/blueprint/redteam/RT-AREA-padic-1.result.json` — 32 findings (4 high, 22 medium, 6 low) on AdicEtaleGeometry, AdicSpacesPartII, DiamondsAndVStacks, FarguesFontaineDiamonds, HodgeTateAndCanonicalSubgroups, PerfectoidQuotients, PerfectoidSpaces and RelativeFarguesFontaine — 63 stages, 32 routed papers. **Eligibility:** `cc-fb70e5` appears 0 times in that file and in `RT-AREA-padic-1.md`.

## Disclosure

Earlier in this session I red-teamed the **AdicSpaces link map** (`RT-LINK-tauceti_TauCetiRoadmap_AdicSpaces`), whose overlaps table covers several roadmaps of this area — `AdicSpacesPartII:R0`, `AdicEtaleGeometry:A2`, `PerfectoidSpaces:P4`, `FarguesFontaineDiamonds:F2`, `RelativeFarguesFontaine:RF1`, `DiamondsAndVStacks:D0`. That is prior familiarity with these roadmaps, not my own work under review: the link map is a different artefact and my findings there concerned its evidence pointers.

I checked every finding's `where` against that list. **One verdict touches ground I had seen before** — finding **/10**, on `TropicalAndBerkovichArithmetic:TB.0`, which appeared in that job's omissions screen where I recorded its scope. I took no position there on whether TB.0 and D5 both construct the Berkovich spectrum, and the verdict rests on the two stage texts read afresh. No other verdict overlaps.

## What I checked, and what I could not

I opened the atlas evidence for **every** finding: each cited stage's text, its `requires`, the ancestry the claim turns on, the RS records it quotes, and the paper routes and item notes it relies on. Ownership claims were searched under several descriptions, not just the finding's name for the object. Ancestry ran against a graph built once, indexing all four stage-id forms — necessary because files under `research/blueprint/roadmaps/` store keys bare while references qualify them.

**What I did not verify:** the published-source quotations — Bhatt–Scholze, André, Fargues–Scholze, Scholze 2012/2013, BMS1, SW20, BLR, Elkik and the Scholze torsion notes. Those are a substantial part of this red team's evidence. Where a finding's atlas half holds but its source half is load-bearing, the verdict says so: **/1, /2, /3, /6, /14, /16, /18, /19, /24, /28**.

## The four high findings

All confirmed. Two deserve particular note.

**/1** turned on a distinction a coarse search would have inverted. `almost purity` returns 10 files, which looks like coverage — but reading them shows nearly all are the stage-edge title of `PerfectoidSpaces:P3`, "Almost purity and étale tilting", propagated into consumers. P3 owns the **classical** theorem; `J-almost` and `arbitrary ideal` return **0 files**. Likewise Q2 plans "the universal perfectoidization of **7.3**" and Q4 "Prove **BS22 Theorem 7.4**" — both semiperfectoid, neither reaching Thm 10.11 for integral algebras. `arc-sheaf` is 0.

**/2**'s process evidence is stronger than the finding presents. `PAPER-ANDRE-18.review.json` has paper verdict `revise` with its `PerfectoidRamification` route **rejected**; and ANDRE-18-B's *accepted* review states the gap itself — it adds its theorem "without duplicating the generic root algebra, tubular comparison or **Abhyankar theorem** … the proposed imports **remain missing, not falsely planned**." I add that `BHATT-18` route[7] proposes the same id, so **three** papers propose `PerfectoidRamification`: one rejected, one accepted reusing the id, one unreviewed.

## Where the findings are sharper than they had to be

- **/19**'s arithmetic is exact: AI.2 has **72** ancestors with the `RF4:vector-bundles` edge and **24** without — precisely the "from 24 to 72" claimed — with `VectorBundlesAndIsocrystals` absent.
- **/9** flags its own subtlety, and I nearly mistook it for an error: R5's prose cites `ClassicalAdicEtaleCohomology C0`, which **does not exist** (that roadmap's keys are `H0, H1, …, H5`), while the machine-readable edge is `H0`. The finding says exactly that.
- **/11** is a three-way records mismatch: RS-05 names D5 "the canonical owner of Diamond canonical compactification geometry"; **D5's own text hands it to C4** ("Canonical compactifications **in C4** are not assumed to remain spatial"); and **C4 still constructs it**.
- **/16** I could adjudicate without the source because the atlas contradicts itself: RF2 writes `Spd(Ĕ)/φ^ℤ` **over Perf_Fq** while F4 writes `Div¹ = Spd ℚ_p/φ^ℤ`. Both cannot hold over the same base, and F4 independently uses the Spd(E) form, so RF2 is the side to correct.
- **/29** is flatly checkable and flatly wrong in the packet: its coverage note says Tau Ceti "has **no** adic-space or sheaf-trace primitives", while the tree has **118** files matching `Huber`, **91** matching `AdicSpace`/`Spa(`, and directories `AlgebraicGeometry/AdicSpace` and `RingTheory/Huber/Padic`.

## Corrections and narrowings the fix jobs need

| finding | correction |
|---|---|
| **/4, /22** | Not two independent owners: **S6 depends on T6** and **S3 depends on T2**, so both are a stage re-planning an imported result. Frame the fix as "S6 consumes T6:comparison" and "S3 consumes T2", not as an ownership contest. |
| **/9, /32** | The dangling `ClassicalAdicEtaleCohomology C0` citation appears in **at least two** stages (R5 and T1). **Sweep for it** rather than patch one line. |
| **/13** | The Part II id collision also hits a **second id the finding does not name**, `HeckeStacksAndLocalShtukasIntegralPartII`, from the same two papers. Fix both. |
| **/2** | Three papers propose `PerfectoidRamification` (ANDRE-18 rejected, ANDRE-18-B accepted reusing the id, BHATT-18 unreviewed). Resolving the supplier means resolving all three. |
| **/5** | Confirmed as an observation, but **do not delete planned work on this review's strength**. Mark the two Scholze 2012 deformation nodes as an optional alternative route and drop the corresponding obligation from RS-05's P0 narrowing; I did not open Scholze 2012 or ECD to confirm the cotangent route is strictly unnecessary at P1's generality. |
| **/21** | The blocker is real and recorded (RS-20's review notes end "The RF3 positive-section covering/twist lemma still has no…"), and it genuinely cannot be solved inside RF3. But the proposed four-part split across RF3, VB1, VB2:ampleness and VB3 is a **design proposal**; my verdict does not endorse it over REV-RS-20~2's other options. |
| **/6, /14, /18** | Confirmed on the **structural** half only. The edge/scope mismatches are real; whether ECD 6.4(iv) needs nothing from Q4, whether all seven ZAVYALOV items are non-noetherian, and the FS interval details rest on sources I did not open. |
| **/28** | Confirmed only that the citation exists as quoted and that the gap itself says "**not read**". Whether II.1–II.2 is the **wrong** range needs the Scholze torsion paper. Settle the range before rewriting the citation. |
| **/29** | I read the Tau Ceti tree at `787733ab`, not the pinned `f790474`. The substance is unaffected at this scale, but the file-and-line citations are the finding's. |

## Assessment of the red team as a whole

This is disciplined work of a different shape from a purely structural red team: a large share of its findings turn on **process records** — accepted and rejected routes, RS owner entries, Part II ids, decomposition gaps, `make_queue` behaviour — rather than on stage ancestry alone, and those records checked out wherever I could open them. Three findings quote an artefact **against itself**: /7 cites the extraction's own note that "one home should be chosen", /2 cites an accepted review recording that its imports "remain missing", /11 sets a restructuring's owner entry against the stage text it assigns. That is the most reliable evidence available in this corpus.

Its two mathematical-content findings (/16, /19) are also its most exact, and neither overreaches: /16 is verifiable as an internal inconsistency even without the source, and /19's structural consequence follows from ancestor counts I reproduced exactly.

32 findings with no rejections is a high rate, and I looked for reasons to reject. What I found instead, repeatedly, was that the findings had anticipated the obvious objection — /9 naming its own `C0`/`H0` discrepancy, /27 declining to call an unreviewed proposal accepted duplication, /21 presenting its re-ordering as one option among those a review had already tabled. Where I disagreed it was about **scope of the fix**, not about the facts, which is why nine verdicts carry a narrowing rather than a rejection.
