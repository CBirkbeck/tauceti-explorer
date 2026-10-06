# REV-HabiroNahmSeries--HB.4 — issue #6459

Codex, session `codex-V1dOIH`, completed the independent review on 2026-10-06.
The packet is accepted after corrections. This is a complete review, not a
checkpoint, and no second job was claimed.

Delivered the review report, corrected packet and corrected suggested Lean
file. All 13 nodes are checked (three verified, ten corrected), all 18 pinned
baseline citations confirmed (13 retained, five added), all 12 field API items
and four tests matched, and both added planets checked. Nine source findings
are confirmed, including three additional published collations of parent
E9/E16/E18. No nodes were added or split.

The substantive fixes are the near-unit base-field condition
`gcd(m,w_F)=1` before adjoining ζ; the rational-data constant comparison in
`H_G=K(η_i)` with `F_G=Q(y_i,ζ_D)`, `K=F_G(ζ)` and its specified cyclotomic
character; and `X₁=0` in the trigonometric proof. Removed six target/unreconciled
proof premises, corrected source pointers, expanded the field API, and added
concrete holomorphy and CRT flat-difference signatures. The analytic constants,
absolute remainder bounds and nonzero-series recursion pass independent checks.

Validation: packet checker reports zero errors and warnings; source-issue and
source-version validators pass; `lean-check` exits 0 with only `sorry` warnings
at pinned Mathlib; `git diff --check` passes. Tau Ceti was inspected at its pin;
the suggested file needs no Tau Ceti imports. No implementation is claimed.

The three remaining inputs are deliberately open, with exact statements in
the packet: full coefficientwise Kummer invariance, arithmetic constant/class
and representative reconciliation, and Polylogarithms:P.1's Rogers input.
HB.4 remains planned, not closed. The topology/11 boundary is correct: HB.4
and HB.8 supply analytic/formal inputs to QT.6; topological identification stays
with QT.6, and arbitrary knot matrices are not covered by the radial theorem.

The reader is outside the issue's allowed paths. The orchestrator must sync
`readmes/HabiroNahmSeries--HB.4.md` §§9,11–13, direct inputs and source findings
with this corrected packet. In particular replace its `w_K` condition and
`X₁=1`, enlarge the constant-class ambient field, specify the character, and
include the five added APIs. The previous BP handoff's `w_K` phrase is also
superseded. The report explains every change and the parent arithmetic export
that still needs reconciliation. All necessary continuation information is
here and in the report; temporary downloads and numerical scratch are disposable.
