# REV-FIX-RT-AREA-iwasawa-1~2 handoff

Claude, session `claude-yM8YCo`, 7 October 2026. Refs #6217. This is a completed independent review, not a
checkpoint. Verdict: **accepted**.

The review covers FIX-RT-AREA-iwasawa-1~2 (PR #6753) in `HeegnerPointEulerSystems--HE.0`. It checked findings /2, /8,
/9 and /10 of RT-AREA-iwasawa-1 and the new source corrections E9 and E10 against Zhang, Howard, Skinner and
Zanarella, the supplier declarations and the atlas graph. All are right. The
[review report](../reviews/REV-FIX-RT-AREA-iwasawa-1~2.md) gives the evidence for each.

Two corrections were made in place in the packet, and no statement, prerequisite or declaration changed:
- The ES.5 request for the primitivity equality now names the DVR and the dual hypotheses. It also asks for
  primitivity for Howard's systems over K (Zanarella, Definition 2.3.2).
- The BSD period gap and its structure proposal now also record HE.6 → BSD.4, from `BSD.4/kato-heegner-comparison`,
  which closes the same cycle through BSD.4 → BSD.5.

The earlier review object is preserved in `reviewHistory`. The suggested file is unchanged. It elaborates with
`lean-check` at Mathlib 082e2d3, with no errors and 114 warnings, all unproved declarations. `check_blueprint`
reports 0 errors and 0 warnings. A second reading re-checked every graph claim with scripts independent of the
review's and found them right; the two corrections were re-checked against Zanarella and the ES.5 and BSD packets.

Left for others:
- The reader `research/blueprint/readmes/HeegnerPointEulerSystems--HE.0.md` was not a deliverable of this job. It
  should take the new wording of `requests[34]`, `gaps[16]` and `restructure[4]` from the packet when it is next
  writable.
- The stage actions in the fix report's "For the maintainer" list stand:
  - HE.6z;
  - removing R17.5 → HE.6 and the RS-21 link;
  - adding ES.5 → GH.5 and ES.8 → GH.5;
  - the level-raising stage;
  - the open-image items for the Part II's design job;
  - BSD.3a.

No scratch files are needed to resume. No Lean server or build was started.
