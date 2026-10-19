# Handoff: #6217 requires a scope decision before redispatch

Refs #6217. Job `REV-FIX-RT-AREA-iwasawa-1~2`.
Codex — **codex-mFu2rq**, 19 October 2026.
Branch `codex-mFu2rq-review-iwasawa`; input `2432b6dd277d7824449e26d8e7815aaef5ac2cb4`.
[Claim confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/6217#issuecomment-6258801622).
Submission: **blocked checkpoint**. No second job was claimed.

The existing HE.0 mathematical fix review is accepted and unchanged. Do not
repeat that audit to reproduce this scheduling blocker. The published
issue assigns three outputs; the queue now requires twelve packets and
25 outputs. WORKERS.md limits edits to issue-named files, and intake excludes
the queue and generator from swarm output paths. A session clarification
asked for authorization to apply the concrete repair; no reply had arrived
at checkpoint preparation. No out-of-scope edit was made.

The [report](../reviews/REV-FIX-RT-AREA-iwasawa-1~2.md) records the current
completion predicate, packet check, 59 tests, and a fresh full generator
replay. No Lean file changed or was recompiled in this session; the prior
checkpoint records successful compilation with only admission warnings.
No mathematical verdict or implementation claim is added.

## Concrete repair awaiting authorization

The following patch is **not applied**. It restores only the issued fix and
review output arrays from commit `88f9bcd44`, and prevents the generator
from expanding existing following rounds. It preserves every state and
review verdict. It is refreshed against the current queue, including the
new ModularIwasawaMainConjectures and AutomorphicPadicLFunctions assignments.

```diff
--- a/research/blueprint/queue.json
+++ b/research/blueprint/queue.json
@@ -99425,44 +99425,7 @@
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
-    "research/blueprint/packets/ModularIwasawaMainConjectures.json",
-    "research/blueprint/readmes/ModularIwasawaMainConjectures.md",
-    "research/blueprint/suggested/ModularIwasawaMainConjectures.lean",
-    "research/blueprint/packets/RankZeroOneBSD--BSD.0.json",
-    "research/blueprint/readmes/RankZeroOneBSD--BSD.0.md",
-    "research/blueprint/suggested/RankZeroOneBSD--BSD.0.lean",
-    "research/blueprint/handoff/BP-RankZeroOneBSD--BSD.0~2.md",
-    "research/blueprint/packets/HeegnerPointEulerSystems--HE.8b.json",
-    "research/blueprint/readmes/HeegnerPointEulerSystems--HE.8b.md",
-    "research/blueprint/suggested/HeegnerPointEulerSystems--HE.8b.lean",
-    "research/blueprint/packets/AutomorphicPadicLFunctions.json",
-    "research/blueprint/readmes/AutomorphicPadicLFunctions.md",
-    "research/blueprint/suggested/AutomorphicPadicLFunctions.lean",
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
@@ -99491,29 +99454,7 @@
    "outputs": [
     "research/blueprint/reviews/REV-FIX-RT-AREA-iwasawa-1~2.md",
     "research/blueprint/packets/HeegnerPointEulerSystems--HE.0.json",
-    "research/blueprint/packets/HeegnerPointEulerSystems--HE.8c.json",
-    "research/blueprint/packets/HeegnerPointEulerSystems--HE.8.json",
-    "research/blueprint/packets/GrossZagierAndArithmeticHeights.json",
-    "research/blueprint/packets/HeightsRationalPointsAndObstructions.json",
-    "research/blueprint/packets/ModularIwasawaMainConjectures.json",
-    "research/blueprint/packets/RankZeroOneBSD--BSD.0.json",
-    "research/blueprint/packets/HeegnerPointEulerSystems--HE.8b.json",
-    "research/blueprint/packets/AutomorphicPadicLFunctions.json",
-    "research/blueprint/packets/EulerSystemsAndKolyvaginSystems.json",
-    "research/blueprint/packets/SelmerIwasawaCohomology.json",
-    "research/blueprint/packets/KatoEulerSystems.json",
-    "research/blueprint/suggested/HeegnerPointEulerSystems--HE.0.lean",
-    "research/blueprint/suggested/HeegnerPointEulerSystems--HE.8c.lean",
-    "research/blueprint/suggested/HeegnerPointEulerSystems--HE.8.lean",
-    "research/blueprint/suggested/GrossZagierAndArithmeticHeights.lean",
-    "research/blueprint/suggested/HeightsRationalPointsAndObstructions.lean",
-    "research/blueprint/suggested/ModularIwasawaMainConjectures.lean",
-    "research/blueprint/suggested/RankZeroOneBSD--BSD.0.lean",
-    "research/blueprint/suggested/HeegnerPointEulerSystems--HE.8b.lean",
-    "research/blueprint/suggested/AutomorphicPadicLFunctions.lean",
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

## After authorization

1. Apply the narrow patch, preserving current state metadata. Review its
   wider effects: the dry-run candidate preserves 48 existing assignments'
   output arrays, generates eleven separate fix/review pairs and removes
   none. Do not install the entire dry-run queue.
2. Verify that only the two intended queue arrays and the selector changed.
   The issued fix/review arrays must have four/three paths respectively.
3. Run the real `issues.deliverables_complete` on the restored review. Its
   existing attributed HE.0 verdict should make it true. Do not assign
   review verdicts to unexamined additional packets.
4. Replay regeneration read-only: the restored arrays must survive and the
   newly available mathematical work must enter a separate third round.
   Check the dependency and independence contracts of the added reviews.
5. Run `test_redteam_queue`, `test_issues` and `test_followups`, and reconcile
   published instructions with the resulting queue through maintainer
   intake. The repair touches paths normal swarm intake does not accept.

Alternatively publish a new expanded mathematical assignment identifying
which additional fixes to review. Until one of these decisions is made,
this is an administrative scope blocker, not unfinished HE.0 mathematics.
The full patch and evidence survive scratch deletion; no process remains.
