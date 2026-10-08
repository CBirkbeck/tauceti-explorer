# REV-Polylogarithms--P.3~2 — handoff

Issue #7066; Claude (Opus 5.5), session `claude-xDizZM`, 8 October 2026. Completed
independent review of revision round 2 of `BP-Polylogarithms--P.3` (plan by Codex
`codex-mZTIGY`, revision by Codex `codex-IkzlXJ`, first review by Codex `codex-ThUx40`).
This is not a checkpoint. The report is
[REV-Polylogarithms--P.3~2](../reviews/REV-Polylogarithms--P.3~2.md).

**Verdict: accepted.** 27 nodes: 15 verified, 12 corrected. 73 API items, 37 tests,
15 named theorems, 44 baseline citations confirmed at the pinned Mathlib, 3 planets in
this part. One stage, planned, not closed: six gaps and five supplier requests remain.
Every implementation status is `unchecked`.

## What changed in the files

- **Packet.** The normalisation against Goncharov's M₃ was wrong in two statements (it
  followed the constant 3/2 printed in Goncharov–Rudenko's Proposition 7.2); it is now
  M₃=−(1/90)·Alt₆[T]₃, r₆=18·M₃. E-P3-05 is reclassified as a sign convention. Three source
  findings are added (E-P3-06, E-P3-07, E-P3-08). Five API items added to
  `generic-vector-configurations`; stock acceptance and `uses` sentences replaced; four
  locators corrected; planet **Triple ratio** proposed. The first review object is kept in
  `reviewHistory`.
- **Suggested file.** Constants corrected in `geometric_trilogarithm_comparison` and the
  configuration cochain; `[Infinite F]` added to two theorems; `configDelete_mk`,
  `configProject_mk` and `projectiveDual_generic` added; a stale comment removed.
- **Reader.** Declaration blocks regenerated from the corrected packet; the introduction,
  the normalisation section, the list of findings and the coverage section rewritten to
  agree with it.

## Checks run

`python3 scripts/check_blueprint.py` on the packet, with and without the pinned declaration
index: 0 errors, 0 warnings. `lean-check` on the suggested file in the existing build at
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`: exit status 0, 195 warnings, all
`declaration uses sorry`. A trial assembly of the atlas with the corrected packet and reader
succeeds. The exact and numerical computations behind the verdicts are described in the
report, which contains a self-contained script for the new normalisation finding.

## What a follow-up should do

Nothing remains for this review. The work that closes P.3 is the six gaps of the packet.
The first one is now a single identity, Alt₆[T]₃=−90·M₃ in B₃(F) for generic six-tuples;
proving it means writing out, with coefficients, the bookkeeping of Goncharov–Rudenko §7.3
(their Lemma 7.4 is right; their Proposition 7.2 has the wrong constant). The other five are
as the revision left them: the analytic proof of the 22-term identity, the higher
differentials of Goncharov's §9.2, the primitive symbol adapter for Suslin's theorem, the
exact regulator-class normalisation, and the unconditional transfer on the complex.

At assembly the parent's statements need the three reconciliations in the packet's
`upstreamNotes`.
