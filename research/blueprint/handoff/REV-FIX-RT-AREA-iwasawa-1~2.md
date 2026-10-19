# Handoff: #6217 remains blocked on published versus queued scope

Refs #6217. Job `REV-FIX-RT-AREA-iwasawa-1~2`.
Codex — **codex-iAhOWA**, 19 October 2026.
Branch: `codex-iAhOWA-review-iwasawa-fixes`.
Input: `1634ea539f881e9dd1a96cacedcd866a4ccad598`.
[Claim confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/6217#issuecomment-6258129912).
Submission: **blocked checkpoint**. No second job was claimed.

## Resume after the scope decision

The HE.0 mathematical fix review is already accepted. Its attributed verdict
and Lean signatures remain unchanged. The live issue permits one packet and
three outputs, but the queue requires ten packets and 21 outputs. Do not
repeat the completed HE.0 source audit to reproduce this scheduling failure.

The [review report](../reviews/REV-FIX-RT-AREA-iwasawa-1~2.md) records fresh
packet and Lean checks, the full generator replay and the wider effects.
New verification beyond the preceding checkpoint establishes that all 46
other changed generated records retain exactly their existing queue output
lists, and identifies the eleven new fix/review pairs and their dependencies.

A scope clarification was requested; no authorization had arrived at
checkpoint preparation. WORKERS.md restricts edits to issue-named files.
Queue and generator changes need an explicit scope decision and maintainer
intake; they are outside normal swarm output paths. This is not an automatic
approval-review rejection.

After authorization, apply the following patch, inspect the wider effects
listed in the report, and reconcile the published instructions. Alternatively
publish an expanded mathematical assignment specifying the additional fixes.
No generated job state or mathematical verdict should be changed by hand.

## Complete proposed patch

This patch is a proposal, **not applied**. The queue portion restores only
the two issued `outputs` arrays from commit `88f9bcd44`; the selector repair
prevents regeneration from expanding them again. Context is from the input
commit above. It is sufficient to reconstruct the candidate after scratch
is deleted. Do not replace the whole queue with an experimental regeneration.

```diff
--- a/research/blueprint/queue.json
+++ b/research/blueprint/queue.json
@@ -98934,38 +98934,7 @@
     "research/blueprint/redteam/RT-AREA-iwasawa-1.fixes-2.md",
     "research/blueprint/packets/HeegnerPointEulerSystems--HE.0.json",
     "research/blueprint/readmes/HeegnerPointEulerSystems--HE.0.md",
-    "research/blueprint/suggested/HeegnerPointEulerSystems--HE.0.lean",
-    "research/blueprint/packets/HeegnerPointEulerSystems--HE.8c.json",
-    "research/blueprint/readmes/HeegnerPointEulerSystems--HE.8c.md",
-    "research/blueprint/suggested/HeegnerPointEulerSystems--HE.8c.lean",
-    "research/blueprint/packets/HeegnerPointEulerSystems--HE.8.json",
-    "research/blueprint/readmes/HeegnerPointEulerSystems--HE.8.md",
-    "research/blueprint/suggested/HeegnerPointEulerSystems--HE.8.lean",
-    "research/blueprint/handoff/BP-HeegnerPointEulerSystems--HE.0~2.md",
-    "research/blueprint/packets/GrossZagierAndArithmeticHeights.json",
-    "research/blueprint/readmes/GrossZagierAndArithmeticHeights.md",
-    "research/blueprint/suggested/GrossZagierAndArithmeticHeights.lean",
-    "research/blueprint/packets/HeightsRationalPointsAndObstructions.json",
-    "research/blueprint/readmes/HeightsRationalPointsAndObstructions.md",
-    "research/blueprint/suggested/HeightsRationalPointsAndObstructions.lean",
-    "research/blueprint/handoff/BP-HeightsRationalPointsAndObstructions~2.md",
-    "research/blueprint/packets/RankZeroOneBSD--BSD.0.json",
-    "research/blueprint/readmes/RankZeroOneBSD--BSD.0.md",
-    "research/blueprint/suggested/RankZeroOneBSD--BSD.0.lean",
-    "research/blueprint/handoff/BP-RankZeroOneBSD--BSD.0~2.md",
-    "research/blueprint/packets/HeegnerPointEulerSystems--HE.8b.json",
-    "research/blueprint/readmes/HeegnerPointEulerSystems--HE.8b.md",
-    "research/blueprint/suggested/HeegnerPointEulerSystems--HE.8b.lean",
-    "research/blueprint/packets/EulerSystemsAndKolyvaginSystems.json",
-    "research/blueprint/readmes/EulerSystemsAndKolyvaginSystems.md",
-    "research/blueprint/suggested/EulerSystemsAndKolyvaginSystems.lean",
-    "research/blueprint/packets/SelmerIwasawaCohomology.json",
-    "research/blueprint/readmes/SelmerIwasawaCohomology.md",
-    "research/blueprint/suggested/SelmerIwasawaCohomology.lean",
-    "research/blueprint/packets/KatoEulerSystems.json",
-    "research/blueprint/readmes/KatoEulerSystems.md",
-    "research/blueprint/suggested/KatoEulerSystems.lean",
-    "research/blueprint/handoff/BP-KatoEulerSystems~2.md"
+    "research/blueprint/suggested/HeegnerPointEulerSystems--HE.0.lean"
    ],
    "after": [
     "FIX-RT-AREA-iwasawa-1"
@@ -98994,25 +98963,7 @@
    "outputs": [
     "research/blueprint/reviews/REV-FIX-RT-AREA-iwasawa-1~2.md",
     "research/blueprint/packets/HeegnerPointEulerSystems--HE.0.json",
-    "research/blueprint/packets/HeegnerPointEulerSystems--HE.8c.json",
-    "research/blueprint/packets/HeegnerPointEulerSystems--HE.8.json",
-    "research/blueprint/packets/GrossZagierAndArithmeticHeights.json",
-    "research/blueprint/packets/HeightsRationalPointsAndObstructions.json",
-    "research/blueprint/packets/RankZeroOneBSD--BSD.0.json",
-    "research/blueprint/packets/HeegnerPointEulerSystems--HE.8b.json",
-    "research/blueprint/packets/EulerSystemsAndKolyvaginSystems.json",
-    "research/blueprint/packets/SelmerIwasawaCohomology.json",
-    "research/blueprint/packets/KatoEulerSystems.json",
-    "research/blueprint/suggested/HeegnerPointEulerSystems--HE.0.lean",
-    "research/blueprint/suggested/HeegnerPointEulerSystems--HE.8c.lean",
-    "research/blueprint/suggested/HeegnerPointEulerSystems--HE.8.lean",
-    "research/blueprint/suggested/GrossZagierAndArithmeticHeights.lean",
-    "research/blueprint/suggested/HeightsRationalPointsAndObstructions.lean",
-    "research/blueprint/suggested/RankZeroOneBSD--BSD.0.lean",
-    "research/blueprint/suggested/HeegnerPointEulerSystems--HE.8b.lean",
-    "research/blueprint/suggested/EulerSystemsAndKolyvaginSystems.lean",
-    "research/blueprint/suggested/SelmerIwasawaCohomology.lean",
-    "research/blueprint/suggested/KatoEulerSystems.lean"
+    "research/blueprint/suggested/HeegnerPointEulerSystems--HE.0.lean"
    ],
    "after": [
     "FIX-RT-AREA-iwasawa-1~2"
--- a/research/blueprint/make_queue.py
+++ b/research/blueprint/make_queue.py
@@ -2212,7 +2212,7 @@
             earlier_report, report = report, f"research/blueprint/redteam/{rt}.fixes-{k}.md"
             # A round an earlier run made is kept as it was made, though its files may now carry a later
             # round's verdict: the rounds after it are then still found, and a later send-back still counts.
-            made = previous_jobs.get(following) if following in states and not (missing or sent_back) else None
+            made = previous_jobs.get(following)
             if made:
                 sent_back = made.get("after") == [review]
             why = (f"This is round {k} of the fix. The review of round {k - 1} sent it back: make the corrections research/blueprint/reviews/{review}.md asks for.\n"
```

## Verification to repeat after applying

1. Check that the affected fix and review have exactly four and three output
   paths, respectively, with no other queue record or state changed.
2. Run `issues.deliverables_complete` on the restored review record: it
   should return true using the existing accepted HE.0 verdict.
3. Replay the generator without installing its output. The repaired selector
   preserves those lists and generates a separate third fix/review round.
4. Run `test_redteam_queue`, `test_issues` and `test_followups`: the candidate
   passes all 59 tests, with one skipped. This does not certify the additional
   mathematical work generated by the queue.

Fresh `check_blueprint.py`: zero errors/warnings. Fresh `lean-check`: exit 0,
114 admission warnings and no other warning or error. No new source audit or
implementation claim is made. Only the report and this handoff are changed;
no process remains running and no scratch artifact needs retention.
