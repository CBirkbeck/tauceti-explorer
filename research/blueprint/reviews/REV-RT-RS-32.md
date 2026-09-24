# REV-RT-RS-32 — independent finding verification

Complete: **0 confirmed, 0 rejected**. RT-RS-32 contains no findings, so the
review preserves an empty findings array. There is no correction decision to
invent or fix job to request. This does not turn the clean structural report
into a certificate of source-proof closure.

Agent: Codex — `codex-hjdg0j`, 2026-09-24, issue #1632. Claim 5805701440
was confirmed by bot comment 5805702894, after which the issue was reread.
The original author `astra-7c41e9`, reviewer `codex-a71f92`, and red-team
worker `codex-c83e7a` are all different sessions from this verifier.

Read the full [red-team result](../redteam/RT-RS-32.result.json) and
[report](../redteam/RT-RS-32.md), the complete
[accepted review](REV-RS-32.md), and the accepted proposal's roadmap,
layer, owner and review records. Input snapshot: `443f0908889df6c59287ffe16725579138240183`.
The result is complete, targets RS-32, has
nonempty checked evidence and exactly zero findings. The report agrees.
The accepted review explicitly supersedes the original proposal report's
three-narrow/six-owner/20-link counts and deferred C4 note; those are not
additional live decisions. The current result has nine stages, four
narrowings, seven owners and 72 links.

## Independent checks of the reported boundaries

Read the complete C0, C2, C3, C4 and R11.3 stage descriptions and the analytic
toric anchor's scope, completion and ownership sections. The four narrowed
contracts retain arithmetic admissibility and refinement existence;
quotient/gluing/descent; compatible Hecke maps and qualified higher direct
images; and relative degeneration/effectivity. R11.3 explicitly constructs
local Raynaud extensions and uniformisation with polarization and lattice
hypotheses. Its import into C4 does not discharge relative cusp effectivity.
The anchor's finite regular complex scope is not silently enlarged to infinite
arithmetic fans, singular analytic geometry or integral properness.

As bounded additional checks, independently read the two cited declarations
and ambient hypotheses at the full Tau Ceti pin, then fetched both source
files and compared their bytes with the copies read. Access: 2026-09-24.

| Declaration | Verified statement and source hash |
| --- | --- |
| [TauCeti.Toric.Fan](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Geometry/Toric/Algebraic/Fan/Basic.lean#L78) | The structure contains `finite_cones : cones.Finite` for cones on an integral lattice in a real module. This is finiteness of the cone set itself, not merely of arithmetic orbits. SHA-256 `ec2884ef9afe244681207ee300f4a1068c5a2666114b4a1c217aa37dbecd440f`. |
| [TauCeti.SplitTorus.groupScheme](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/SplitTorus/Scheme.lean#L65) | The finite-rank group scheme is over a commutative base ring, with `Finite sigma` and base/index type in the same universe. It is not restricted to fields. SHA-256 `93da528133b53869b9b06f4a3066b1167e700063d364d1fa45ac65071c1938e9`. |

These facts support the report's two stated distinctions. No other reviewed
audit citation or absence assertion is newly certified here. Mathlib remains
pinned at `082e2d37e8b0463410cdb532e111cd43d5a66174`.

## Independent structural controls

Rebuilt the graph from atlas edges, stage dependency/consumer fields,
per-roadmap extracts, proposed-roadmap stages and all link packets. All nine
member action keys, seven owners and 72 distinct non-self proposal pairs
resolve. Every owner has its handoff to the former stage. Every supplier of
each narrowed stage has an edge to that stage and all its immediate consumers
in the union: C0 has four consumers, C2 six, C3 six and C4 eight.

The graph has 4,440 baseline pairs; three proposal pairs already occur, and
the union has 4,509. No proposal edge has a return path. Including the links
of all other accepted restructurings gives 7,053 pairs, again with no return
path for an RS-32 edge. These independently reproduce the red team's counts.
As a negative control, adding C0 → the anchor's Layer 0 yields a cycle with
its supplier link. These checks address new proposal cycles, not all legacy
catalogue cycles or the mathematics of unrelated edges.

## Validation and limits

- `scripts/check_restructure.py` passes on RS-32.
- `scripts/check_redteam.py` passes on the result and this review.
- `research/blueprint/intake.py check-files` passes for the two deliverables.
- Finding coverage is exact: the input and review ID sets are both empty.
- Governing instructions match those read for the preceding job. Publication
  checks input immutability and exact two-file scope against the current base.

This verification does not claim to have repeated the red team's 102-target
audit inspection, 109 consumer-search contexts, every roadmap target, or the
proofs of AMRT, Pink, Faltings–Chai and Lan. Those remain within the original
report's evidence and limits. No new mathematical finding was established by
the bounded checks above. No Lean file was changed or compiled; nothing is
claimed formalized. The proposal, original review and red-team result remain
unchanged.
