# BP-HabiroNahmSeries--HB.5 handoff

Issue #6508; worker **Codex — codex-i4fN7u**; 6 October 2026.
This is a completed planning pass, not a checkpoint. The packet has
`status: complete`; its sole scoped stage, `HabiroNahmSeries:HB.5`, is
**planned**, with one supplier gap and one request. It is not closed.
All implementation statuses remain unchecked.

The deliverables are the [packet](../packets/HabiroNahmSeries--HB.5.json),
[reader document](../readmes/HabiroNahmSeries--HB.5.md), and
[suggested file](../suggested/HabiroNahmSeries--HB.5.lean).
The accepted 109-node parent packet is unchanged. Its foundational objects and
eleven HB.5 endpoint/proof nodes are imported by their existing IDs.

## What this pass finishes

- The public Zagier chapter is obtained, with the exact real leading constant
  at (29), printed p. 48, and the modular expansion at (28), printed p. 46.
- A positive residue-class majorant, a uniform block-product lower bound, and
  its finite splitting give radial upper bounds at every root order. This
  fills the missing cusp orders without extending the restricted full
  asymptotic-series theorem to even or bad orders.
- The valuation argument covers every finite cusp and infinity, uses
  `v = k/width`, and corrects the Rogers sign. At infinity the order is
  `min Q(n)`, so the bound on C follows from `min Q(n) ≤ Q(0) = C`.
- The arithmetic plan uses one fixed extension
  E = F(X_i^(1/D), ζ_D), its integral symbol η_E, its own exceptional integer,
  the actual Dedekind multiplier, and a fixed power of the root constant.
  Descent through embedding regulators gives zero of the original rational
  class; only the integral η_E is reduced modulo n.

There are **7 new nodes: 1 construction, 4 theorems, and 2 comparisons**,
with **8 API items**, **4 unit tests**, and **8 baseline declarations**.
Two new planets, *Radial asymptotics of Nahm sums* and *Cusp valuation bound*,
join the parent's two planets, for four in the stage. No restructuring is
proposed. The seven canonical parent source findings E14 and E19–E24 retain
their IDs and independent review; new version collation is recorded rather
than creating duplicate findings.

## Precise remaining supplier obligation

The one request is to **HabiroNahmSeries:HB.4**, strengthening the proof of its
existing `kummer-invariance-of-the-expansion`,
`galois-equivariance-of-the-expansion`, and `simplified-form-and-the-unit`.
For the corrected nonzero constant u = Φ_ζ(0), over the fixed E, establish:

1. u^n belongs to E_n.
2. Its image in the Kummer extension is the inverse P_ζ class, with D_ζ(1)
   trivial at the good orders.
3. Its class belongs to the χ^(-1) eigenspace.

The proof must retain rational B and the Gauss factor and give the root-change
and reindexing cancellations. Merely conjugating the formula from ζ to ζ^c
does not establish the eigenspace power law at the original ζ. The new
constant-term comparison and arithmetic bridge explicitly consume these
imported statements conditionally; this pass does not verify their missing
proof. The majorant and all-cusp bound do not depend on this obligation.

Resume with that HB.4 proof and then check the exact imported statement against
the HB.5 comparison. There is no unfinished HB.5 drafting work. An independent
review should first check the bounded total logarithmic loss in the product
estimate, the residue shifts and m² scaling, the width normalization and
infinity argument, and the fixed-field arithmetic hypotheses.

## Sources and validation

Public sources read on 6 October 2026 are CGZ arXiv **1712.04887v3**, especially
§§2.2–2.3 and 7.1/7.3; the **published GZ** article, §§2–4 and 7; and the
author-hosted **published Zagier** chapter, II.3B–C. URLs, file hashes, and read
sections are recorded in the packet. GZ's published (50), p. 233, still has the
sign error, and Proposition 7.1, p. 234, retains the restricted-proof gap.
Published CGZ Section 7 was not obtained from the publisher's public sample;
CGZ findings are scoped to the obtained v3 preprint. The survey's reported
computer search is not an exhaustive all-rational-B,C nonmodularity proof.

`python3 scripts/check_blueprint.py research/blueprint/packets/HabiroNahmSeries--HB.5.json`
passes with **0 errors and 0 warnings**, including the pinned declaration-index
checks. The eight baseline statements were read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`; the Tau Ceti source search used
`f790474821cf4256814db967cb154e7af3d0c369` and the reviewed library audit.

`lean-check research/blueprint/suggested/HabiroNahmSeries--HB.5.lean`
**elaborated successfully**, exit 0, with only the 17 intended admitted-proof
warnings. The file includes the construction, all eight API signatures, all
four test examples, and literal finite-product/series bounds. Missing Bloch,
Rogers and cusp carriers are named precisely in comments; there are no
substitute proposition fields or implementation claims.

Additional scratch checks evaluated the product ratio for primitive orders
1, 2, 3, 4, 5, 6, 8, and 10, t in {0.001, 0.01, 0.1, 1}, and lengths up to
250. They support a uniform positive constant and show why a universal
constant of one is inappropriate at larger orders; they are not proof.
Exact rational arithmetic checked the rank-one residue decomposition and the
infinity-minimum convention. The written proof plans and prototype tests,
rather than these finite samples, are the acceptance criteria.
