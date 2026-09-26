# REV-AdicSpacesPartII — handoff

Date: 2026-09-26. Agent: ChatGPT (GPT-6 Astra Pro).
Session: `gpt6-20260926-a73f2c`. Issue: #344.

## Status

**Partial checkpoint, not a completed independent review and not accepted.**
The useful output is `research/blueprint/reviews/REV-AdicSpacesPartII.md`.
The packet and suggested Lean file remain unchanged; no promotion verdict has
been written. Retain this job for continuation after checkpoint intake.

## Established result

The Hausdorff-input lemma `AdicSpacesPartII:R0/strict-complex-completion-exact`
is applied to possibly non-Hausdorff terms in
`R0/noetherian-rod-laurent-cech-strict` and
`R0/noetherian-rod-module-completion-tensor`.

A nonempty counterexample chart starts with B = Z_p × Z_p and fractions with
denominator (p,1), numerator (1,1). Its algebraic localisation has topology
with neighbourhoods Q_p × p^n Z_p, separation kernel Q_p × {0}, and separated
completion Z_p. A second example uses Z/ell Z with its p-adic module topology,
ell different from p. These disprove the separation obligations, not the
classical sheafiness theorem.

The report supplies a proof of strict exactness after Hausdorff completion
without separated inputs, corrects the small-lift neighbourhood quantifiers,
and names every directly affected node and the suggested signature to change.
It also supplies three concrete regression examples.

## Input snapshots and checks

- Main snapshot: `28ed861858ba244d26285021d0761ed56384a958`.
- Packet blob: `ef78e07f190e99151beba41edf6bdff09f506aad`.
- Suggested Lean blob: `48d3c1bd7f2c84c74d4c2c7bbd5a33cb0d7961a1`.
- Mathlib pin: `082e2d37e8b0463410cdb532e111cd43d5a66174`.
- Tau Ceti pin: `f790474821cf4256814db967cb154e7af3d0c369`.

Read the pinned completion and strict-map definitions and the Tau Ceti
localisation ring/ideal/neighbourhood definitions. Read relevant Wedhorn PDF
text; inspected the page image of Theorem 8.28. Other page-image requests and
independent access to Huber 1994 did not succeed. These limits are detailed in
the report. This is not verification of all source excerpts or baseline claims.

Neither `check_blueprint.py` nor Lean was run. Only the review report and this
handoff are submitted. No production files, queue state, labels or issues were
manually changed or closed.

## Exact continuation

Start by independently checking report H1 and integrating its strengthened
completion lemma into the packet and suggested file, or document a reasoned
rejection. Add the three regression checks. Then continue the all-node review,
including the library coverage audit and all 35 author-recorded source issues.
There are no full-node `verified` verdicts to inherit from this checkpoint.
The author reports 494 nodes; this review did not independently recount them.

When all required coverage is justified, write the packet's actual `review`
object with reviewer `independent-review-REV-AdicSpacesPartII`, run the checker,
and report compilation honestly. This checkpoint does not satisfy that final
acceptance gate.

## Access note

The packet is too large for `fetch_file` and `fetch_blob`. The connected
GitHub generic fetch of `/repos/CBirkbeck/tauceti-explorer/git/blobs/` followed
by the packet blob SHA returned its decoded content, which was readable in
ranges through the response-resource reader. Line-range `fetch_file` worked
for the suggested file. Do not treat an empty large-file `content` field as an
empty packet or replace the packet with a fragment.
