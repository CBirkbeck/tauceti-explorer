# REV-FIX-RT-RS-20~3

Independent review of FIX-RT-RS-20~3 (Codex, session `codex-5ebb6f`, PR #5593), the fix of the three confirmed findings
of RT-RS-20~3 on the restructuring proposal RS-20 (Fargues–Fontaine curves), for issue #5550.

Reviewer: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write the fix. I did verify the red team it fixes:
REV-RT-RS-20~3 (PR #5367), whose verdicts stated the corrections that this fix applies. I wrote none of the proposal or
its earlier reviews.

**Verdict: accepted.** All three fixes are right, and `RS-20.result.json` passes `check_restructure.py`. My `review`
object is added; the fix had already moved REV-RS-20~3's acceptance to `reviewHistory`. One correction:
`fixRevision.review` said "Awaiting REV-FIX-RT-RS-20~3" and now points to the top-level review.

## What I checked

- **The fix itself.** The full diff of `RS-20.result.json` in PR #5593:
  - the RF0:integral-Y reason and RF2:untilts keeps, reason and `suppliedBy`;
  - the new VB3:general-BC keep entry;
  - two new owner records and the rescoped generic-interpretation target;
  - twelve new link directives;
  - `nodeReconciliation`, `fixSources`, and the archived review.

  I also read the fixes report and the handoff addendum.
- **Ownership semantics.** PROTOCOL §15 says a narrowed layer "names the layers that now supply what it lost". In
  `scripts/restructure.py`, `suppliedBy` is recorded but creates no edge. So naming the downstream VB3:general-BC as the
  owner of the moved property creates no cycle. REV-RS-20~2 accepted the same pattern for VB1.
- **The graph.** I applied every accepted restructuring, with this RS-20 in place of the promoted one, to
  `data/atlas.json`. All 51 RS-20 edges land, none is skipped, and the stage graph is acyclic.

## The findings

- **/1 (high, integral chart algebra): fixed.** The RF0:integral-Y reason and `nodeReconciliation[0]` replace
  `proofSteps[2]` of `chart-cover-perfectoidness-and-sheafiness` by FS II.1.1's algebra (printed p. 48, which I read for
  the red-team verification): (W_OE(R⁺) ⊗̂ O_E∞)[(π/[ϖ])^{1/p^m}]^∧_[ϖ], with s_m = π_m/v_m.
  - **The fix keeps the reciprocal correction** t₁♯ = π/[ϖ].
  - **The three acceptance checks are right.** I verified each:
    - s_m^p = s_{m−1}, since v_m^p = [ϖ^{1/p^{m−1}}];
    - |s_m| = 1 on |π| = |[ϖ]|;
    - π_m − v_m s_m = 0.
- **/2 (Div¹ properties): fixed.**
  - **What RF2:untilts keeps.** Only the Div¹ moduli definition and its comparisons.
  - **Where FS II.1.21 goes.** It moves to the existing late stage VB3:general-BC, with an owner record and inputs from
    RF2:untilts, C4 (ECD 18.3) and S5 (ECD 24.5). It is exported to HS0 and VS1.
  - **No cycle.** C4, S5 and VB3:general-BC reach none of the early consumers: RF2:untilts, RF2, RF3,
    RF4:vector-bundles, VB1, BG0 and GS0:loop-geometry.
  - **GS0:loop-geometry needs no link.** Its text uses Div¹ leg divisors and relative properness of bounded Schubert
    diamonds, not FS II.1.21.
  - **The duplicate is resolved.** The unintegrated RF2:div1-properness proposal of RT-AREA-padic-1/17 is explicitly
    replaced, so there is one property owner.
- **/3 (R06.1 reuse): fixed.**
  - **The new import.** R06.1 is added to RF2:untilts' `suppliedBy`, with an owner record scoped to the matching
    mixed-characteristic p-typical affinoid case, the link R06.1 → RF2:untilts, and six access links. R06.1 is not
    downstream of RF2:untilts.
  - **What RF2 keeps.** The all-E coefficient comparison, arbitrary-base descent, the integral and equal-characteristic
    constructions, and the graded lines. This respects RT-AREA-padic-2/21's rejection of a blanket replacement.

## Checks

- `check_restructure.py research/blueprint/restructure/RS-20.result.json`: ok, before and after the review object.
- **Assembled graph:** all 51 RS-20 edges present, nothing skipped, acyclic.
- **Not done:** no Lean file is involved, and nothing was compiled. The node payload moves remain with the RF0 and VB3
  blueprint jobs.
