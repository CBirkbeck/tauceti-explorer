# NC.6 independent review handoff

Job `REV-AnabelianGeometryAndNonabelianChabauty--NC.6`, issue
[#6304](https://github.com/CBirkbeck/tauceti-explorer/issues/6304).
Reviewer Claude (Opus 5.5), session `claude-5GhqUO`. The input was written by
session `claude-HtuEFb` (#6347). This is a completed review, not a checkpoint.
No second job was claimed.

## Outcome

The corrected packet is accepted as a complete target-level pass, with NC.6
planned, three recorded gaps and four requests.
- All 18 nodes have verdicts: 4 verified, 14 corrected, none added or removed.
- All 7 pinned Mathlib declarations are confirmed.
- There are 44 API items and 26 tests (one replaced) in the packet; I added
  one Lean example for the new test.

Source findings: of the input's eleven, eight are confirmed and
E-NC6-kim-h1-notation is rejected (the published text prints H₁ correctly).
The two BDMTV duplicates of EffectiveDiophantineMethods E21/E30 are removed.
Three new Kim 2009 findings are added and confirmed:
- pseudo-null does not imply finitely generated over Z_p (p.131);
- cd₂(G_T) at p = 2 (p.124);
- the open-curve weight filtration in Lemma 6 (p.124).

## Main corrections

- Tangential base points in NC.2–NC.4 are a new gap. Nodes 13 and 15 now use
  integral base points; node 17 cites `NC.4/iterated-coordinates` and
  ColemanIntegration L1/L2 instead of the proper-curve `NC.4/depth-one-period`.
- New request: the Gysin sequence of a punctured curve, to
  EtaleDualityAndPerverseSheaves EDC.3. The Künneth request to EDC.0 is
  widened to cover Weil restrictions.
- QM.6 is added for the trace formula in Proposition 2.
- The Observation 4 step is corrected, and the Greenberg gap retired.
- `h2-growth-bound` covers p = 2 and gives the Hodge–Tate weights in R06.2's
  sign convention.
- The weak-Jannsen node covers genus zero and the field of the cusps.
- The unsupported p-adic clause of the injectivity theorem is removed.
- The Linton–Nyberg-Brodda locator is corrected to p.62.
- The restructure links now include NC.2 and NC.3; no node uses NC.1 or NC.5.

## Checks

- `check_blueprint`: 0 errors, 0 warnings.
- `lean-check`: exit 0, 42 `sorry`-only warnings, no errors (pinned shared
  build, Mathlib 082e2d37e8).

## Where to resume (downstream)

The reader document is outside this job's deliverables. Synchronize it from
the accepted packet, using the checklist at the end of the review report.

Open items:
- the tangential base-point extension of NC.2–NC.4;
- the four requests: N.5 Soulé, EDC.0 Künneth, EDC.3 Gysin, D7
  Hochschild–Serre;
- the Labute and Bloch–Kato source gaps.

The sources are public arXiv files and the EMS publisher PDF. Their SHA-256
receipts are in the packet, so no scratch file is needed.
