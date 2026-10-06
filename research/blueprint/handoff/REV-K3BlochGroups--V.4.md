# Handoff: REV-K3BlochGroups--V.4

Finished independent review by Codex, session `codex-bIstYN`, issue
[#6399](https://github.com/CBirkbeck/tauceti-explorer/issues/6399), 2026-10-06.
Verdict: **accepted after corrections**. This is a finished review, not a
checkpoint. The original author was session `codex-n9gXQ0`.

Deliverables are the review report, corrected V.4 packet and suggested file,
plus this handoff. The report records every correction and all individual
node checks. No nodes were added, removed or split. Counts: 16 nodes
(11 theorems, 5 constructions; 5 verified and 11 corrected), 32 API items,
19 tests, 18 baseline declarations, 36 imported parent targets, 7 closure
gaps, 6 requests and 5 independently confirmed source findings. No new
planets; the accepted parent already supplies the six V.4 planets. All
implementation statuses remain unchecked; V.4 remains planned, not closed.

The main corrections are the finite-coefficient Hurewicz direction
K₄coeff→H₄SL, the odd-or-8-divisible range supported by KV11.3.2 for the
Bott-product proof, explicit affine action/unit/e API, typed frame algebra
splitting and decomposability, the expressible infinite/prime-field
hypotheses, and actual power-two group-homology and tensor-zero tests.
Choosing m=8 handles order-two detection without assuming the missing special
mod4 product normalization. The cyclic Chern evaluation still covers all
invertible moduli, including 2 and 4.

Confirmed original findings: KV Exercise11.5's Chern-sign misprint and
Su91 Lemma2.4's explicitly omitted d³ proof. Added scoped findings:
KVI p5's false positive-characteristic cyclotomic surjectivity claim,
KVI5.19's unsupported mod4 product-rule cross-reference, and KIV2.7's
repeated q₁ coefficient where the second factor should be q₂. Public chapter
copies and the dated full author copy were inspected; no separate publisher
edition is claimed. All source URLs, six version hashes, errata searches
and reasons are preserved in the packet/report. Source downloads and scratch
computations are not required for resumption.

The orchestrator/assembly must synchronize the reader
`research/blueprint/readmes/K3BlochGroups--V.4.md`, which this issue does not
authorize editing: its finite-coefficient-square subsection, acceptance test,
L.2/M.7 requests and gap text still use the broader mod4 proof range and
m=4 order-two route. Use the corrected cofinal proof contract; incorporate
new API/tests, findings and counts32/19/18. The intended detector-injectivity
target is unchanged. The original BP handoff is historical.

For closure, resume the seven precisely recorded chains: H.1 Part II group
homology tools; unstable SL₂ symbol coinvariants; algebraically closed
finite-coefficient K-theory; an early Chern slice free of the regulator
cycle; an actual d³ bar calculation; inherited ψ₃/symmetric-group proofs;
and inherited plus/AHSS/enhanced-Tor proofs. Ordinary Tor detection does not
prove the enhanced extension. Route the six existing requests to their owners,
without duplicating their definitions or altering upstream roadmaps.

Validation completed:

- `python3 scripts/check_blueprint.py research/blueprint/packets/K3BlochGroups--V.4.json`:
  zero errors and zero warnings.
- Packet source findings checked with `source_issues.check_issues` and
  `check_errata.versions_checked`: zero errors. The standalone errata-job CLI
  is not a blueprint-packet checker.
- `lean-check research/blueprint/suggested/K3BlochGroups--V.4.lean`:
  exit zero, zero errors, 82 warnings, all declarations using `sorry`.
  The existing build has exact pinned Mathlib; imports are all Mathlib and no
  Tau Ceti module was tested. No language server or library build was run.
- Verified every API/test name and unchecked implementation status, all source
  hashes, review coverage and the dependency/ownership audit. Independent
  normalized C₇ bar/carry-cocycle computation gives weight4 under power2;
  rational five-face and mod3/mod2 Chern-sign computations agree.

Submit as `Refs #6399`; allow swarm intake to apply its normal checks and merge.
No second issue is to be claimed in this process. Scratch is deleted once the
pull request is open; the report and packet retain the durable evidence.
