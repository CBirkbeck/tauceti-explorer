# REV-RT-AUDIT-31 — verification of the red team on library audit AUDIT-31

**The single finding is confirmed at medium severity. One refinement recommended for the fix text, drawn from the upstream document itself. The red team's negative results were independently reproduced rather than taken on trust: all eight of its census figures are exact, and all 98 declaration citations hold at the pins.**

Verifier: Claude Code, session `cc-fb70e5`, 24 September 2026. Target: `RT-AUDIT-31`, the red team on library audit AUDIT-31 (Arithmetic Galois representations and conductors). `cc-fb70e5` wrote neither the audit nor this red team.

## The finding — confirmed

**RT-AUDIT-31/1, `error`, medium.** The audit's duplicate note for the upstream `EllipticCurves` Layer 4 entry reads:

> "Owns Tate's algorithm over a DVR, the algorithmic (Ogg) exponent `v(Δ) − m + 1` **and its identification with the ramification-theoretic conductor**, and Néron–Ogg–Shafarevich; **that identification is the elliptic-curve conductor comparison asked** [for by R01.3]…"

The upstream document says the opposite, in terms. It first separates the two notions —

> "The **algorithmic (Ogg) exponent** `v(Δ) − m + 1` … — **called that, not "the conductor", until identified with the ramification-theoretic conductor**"

— and then excludes the identification explicitly:

> "The **ramification-theoretic** conductor and its identification with this algorithmic `f_p` … is a **separate, related project**, cited (Saito) for context only"

That is an **explicit exclusion rather than silence** about a prerequisite, which is the distinction the finding rests on, and it is the right distinction to draw.

**The scoping claim checks out too**, and I verified it rather than accepting it: R01.3's target "Comparison with the conductor of an elliptic curve, including wild contributions at 2 and 3" carries `library: "absent"`, and the layer's verdict is `not built`. So nothing would be *wrongly built* from this error. What it risks is the opposite — a worker **skipping** a comparison the audit tells them is already owned upstream, since the note asserts outright that "that identification is the elliptic-curve conductor comparison asked" for. **Medium is the right severity for that shape of error.**

## A refinement for the fix text

The upstream document locates the historical gap more precisely than the finding does. Both residue characteristics 2 and 3 bring wild complications, but:

> "only the **mixed characteristic `(0, 2)`** case was missing from Ogg's proof: Silverman does residue characteristic `3` and refers `2` to Saito (Duke 1988), whose arithmetic-surface proof is uniform in the residue characteristic"

The fix's phrase "including wild contributions at 2 and 3" is correct as a statement of R01.3's obligation, and the proposed replacement note is otherwise accurate — I would apply it as written. Adding the literature split would tell the eventual worker where each case comes from: Silverman for residue characteristic 3, Saito (Duke 1988) for 2, with the mixed-characteristic `(0,2)` case the one Ogg's proof did not cover.

The rest of the fix's instructions are right and should be kept: retain the target's `absent` classification, retain the layer's `not built` verdict, refresh the matching entry in the integrated coverage data, and do **not** remove the comparison from planning as an already-owned upstream proof.

## The negative results, reproduced

The red team's summary claims a census, and I recomputed every figure in it from the audit. All eight match exactly:

| claim | reproduced |
|---|---|
| 47 layers | **47** |
| 160 targets | **160** |
| 98 citations | **98** |
| 76 distinct declarations | **76** |
| 65 pinned files | **65** |
| 59 duplication references | **59** |
| 44 not-built / 3 process verdicts | **44 / 3** |
| 151 absent / 9 partial target classifications | **151 / 9** |

And I checked the citations themselves rather than only the count. **All 98 hold**: for each, the cited name is present within ±4 lines of its cited line in its cited file — the 52 Tau Ceti citations read straight out of the pinned commit `f790474…`, the 46 Mathlib ones against a local tree. No missing file, no absent name, no drifted line.

So the red team's negative conclusion — that "no change to the 44 not-built / 3 process verdicts or the 151 absent / 9 partial target classifications is supported by this check" — is well founded, and its single finding is correctly scoped to the ownership note alone.

## What I did not do

I did not re-derive the conductor mathematics, though the substance is standard and the documents agree with it: Ogg's formula, its wild-characteristic gaps, and Saito's uniform arithmetic-surface proof. The Mathlib half of the citation check used a local tree rather than the pinned `082e2d3`, so line agreement there is evidence rather than proof; the Tau Ceti half was read at the pin itself. I sampled neither the 59 duplication references beyond the one the finding concerns nor the audit's prose summaries.
