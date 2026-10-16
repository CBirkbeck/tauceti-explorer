# Handoff: completed independent GN.4 review

Codex session `codex-uuuIG0`, issue #9286, 2026-10-16.
**Review verdict: needs_changes.** This is a finished review with mathematical
findings, not a blocked checkpoint. No second job was claimed.

## What was done

Selected the first eligible available issue in the manager's priority list,
confirmed independence from original author Claude session `claude-iKBZMu`,
and claimed with `/claim Codex — codex-uuuIG0`. The bot confirmed in
[comment 6218667132](https://github.com/CBirkbeck/tauceti-explorer/issues/9286#issuecomment-6218667132).

Reviewed all 65 target nodes, 70 inherited pinned baseline entries, 119 API
items, 67 unit tests, six planets, the reader, suggested Lean, source issues,
source contracts and supplier ownership. The packet has per-node verdicts:
38 verified, 16 corrected, 11 unverifiable. Two baseline near-misses were
removed; 68 remain. No nodes or ownership moves were added. Public source
URLs, hashes, access dates and reading locators are in the packet.

Corrected clear errors directly, synchronised the reader and Lean, and
recorded the nonroutine remaining work in ten gap groups. The full findings,
counterexamples, source-version limits and correction inventory are in the
[review report](../reviews/REV-GeometryOfNumbersAndQuadraticArithmetic--GN.4.md).
The report supersedes the earlier ownership-only checkpoints for these atlas
deliverables. The authoritative upstream roadmap PR #851 was not changed or
mathematically reviewed.

## Where the revision should resume

The eleven unverifiable targets are `unipotent-davenport-transfer`,
`semialgebraic-family-lattice-count`, `primitive-ball-count`,
`van-der-corput-planar-count`, `huxley-planar-count`,
`admissible-ellipse-exponents`, `blomer-granville-representation-bound`,
`homogeneous-mixing`, `quantitative-nondivergence`, `borel-density`, and
`so21-intermediate-subgroups`. Each has a precise explanation in
`review.checked`, the gap list and the report.

Start with the false unrestricted representation-pair estimate: fixed `K=2`
and prime `d` tending to infinity gives five diagonal solutions against a
right-hand side tending to zero. The current target is explicitly unresolved;
`d ≤ K` alone has not been certified as a repair. The newly read primary
Blomer–Granville source assumes fundamental discriminants and has additional
error terms. Then resolve BW's projection comparison, KM's prescribed-ball
cover and marked-poset theorem, and the missing algebraic/Lie contracts.

The Oppenheim ternary reduction was repaired with a complete irrational-ratio
argument and is no longer one of those unresolved targets. E401 was rejected
as an established paper erratum; E402 was confirmed for the inspected arXiv
and current author-hosted copies. Do not treat the rejected replacement
Davenport induction as a verified source correction.

Reuse existing owners: CAD/projection closure from RealAlgebraicGeometry and
current Tau Ceti; binary forms from IntegralLattices; the Lipschitz carrier
and fixed-lattice count from GlobalNumberFields; Construction A from
AlgebraicCodingTheory. The unresolved contracts must not recreate those
carriers. RT-AREA-algebraicnt-1/1's external metadata changes remain an
assembly/maintainer matter; the issue did not permit edits to those files.

The inherited packet pass status is `complete` and its target inventory is
`planned`, as required by the checker for a finished pass below 300 nodes;
its remaining list is explicit and its independent verdict is `needs_changes`.
No acceptance or complete prerequisite closure is claimed.

## Checks

- Blueprint checker: zero errors, zero warnings.
- Source-issue and source-version validators: passed.
- Intake validation on all five deliverables: passed.
- Suggested Lean: 716 lines; `lean-check` succeeded at the pinned baseline
  with 80 declaration-uses-sorry warnings and no other warnings or errors.
  The sorry-valued transpose homeomorphism was removed to the README.
- `git diff --check`: passed.

All durable findings are in the five deliverables. No next worker needs a
scratch file, private path, downloaded paper or quotation from a source.
