# PKG-JacobianChallengePartII — blocked checkpoint

Refs [#7593](https://github.com/CBirkbeck/tauceti-explorer/issues/7593).
Codex (GPT-6), session `codex-XJoo31`, 11 October 2026.
Branch: `codex-XJoo31-jacobian-package`.
Base atlas commit: `1c06f95484a07926ea860dbcec1344dc75b9c275`.
The bot [confirmed this claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7593#issuecomment-6107794216),
identifying claim comment 6107792936.

**Blocked checkpoint; this package is unfinished.** This run changes only
this handoff. The missing supplier packages and coupled-bundle assignment
remain absent after fresh checks. No packet, roadmap document or suggested
file was amended. No source-reading or implementation progress is claimed.

The [preceding handoff at the immutable base](https://github.com/CBirkbeck/tauceti-explorer/blob/1c06f95484a07926ea860dbcec1344dc75b9c275/research/blueprint/handoff/PKG-JacobianChallengePartII.md)
links to the earlier mathematical receipts and signature work. Retain that
chain when resuming; the worker scratch directory is not part of the handoff.

## Selection and authorization

Checked all forty manager-priority issues individually. Every one was closed
or labelled `state:submitted`; none was available. The complete open `swarm`,
`state:available` inventory contained 683 issues. No eligible blueprint/new
roadmap review or package review, and no allowed `top` or `focus` job, was
available. This package was the first permitted fallback class in WORKERS.md's
ordering, ahead of new blueprint/design work. Only #7593 was claimed.

The issue permits changes only to the package README, Suggested.lean,
metadata and this handoff, and explicitly prohibits packet changes.
WORKERS.md, “Upstream tiers”, requires a roadmap's dependencies to be upstream
already, unless assigned to a coupled bundle; package targets cite the
libraries, their own layers, assigned bundle members or lower-tier packages.
PROTOCOL §§3, 15 and 20 require real supplying statements, unique ownership
and agreement with the accepted plan. Supplying the missing owner packages,
changing the supplying contracts or assigning a bundle is outside these four
paths. Those are the blocking conditions, rather than the mere fact that
upstream targets have not yet been implemented.

## Fresh evidence and the minimum unblock

Read the supplied current JacobianChallenge and AlgebraicVectorBundles
READMEs in full. Inspected the accepted Jacobian plan, package interfaces,
the relevant supplier plans, the reviewed A1–A3 library audit, the current
native library declarations, focus/tier records and queue entries. The
read-only roadmap tree is at `c251d2e42c66f14c279d1e5c2708c5a91d8c8aec`;
the supplied current Tau Ceti library is at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Neither tree was changed and no
Lake command ran there. The cleared-library index was read; no restricted
source was fetched, copied or quoted.

GitHub main was checked independently through its current
[roadmap-directory listing](https://github.com/TauCetiProject/TauCetiRoadmap/tree/4b002f622e9d68b627bdce9f6224897305a68bdc/TauCetiRoadmap),
at `4b002f622e9d68b627bdce9f6224897305a68bdc`. Neither of the following
supplier roadmaps is present there. Neither exact package directory exists
in the atlas either, and neither exact `PKG-` job ID exists in queue.json.

| Missing supplier | Required mathematical contract |
| --- | --- |
| AbelianSchemesAndArithmeticModuli A1 | Arbitrary-base abelian schemes, nonreduced-base rigidity, translations, products and normalized square/cube formulas. |
| AbelianSchemesAndArithmeticModuli A2 | Relative dual representability, universal Poincaré bundle normalized on both zero axes, biduality, sign conventions, seesaw and arbitrary base change. |
| AbelianSchemesAndArithmeticModuli A3 | Nonzero integer multiplication finite locally free of rank absolute-value(n)^(2g), including inseparable cases; scheme-theoretic torsion and Weil pairing. |
| StableReductionPartII MC.4 | Full symplectic Jacobi level and a fine smooth-curve scheme with its universal curve in the chosen cyclotomic pairing component. |

The accepted AbelianSchemesAndArithmeticModuliPartII package is not a
replacement for the missing parent. Its “Scope and dependencies” explicitly
imports A1–A3 and its downstream Betti part consumes JC2/JC7. The supplying
parent packet itself imports the lower R09.4 owners for the relative carrier,
rigidity and dual. In particular its A1/relative-products-and-dimension and
A1/relative-rigidity-comparison consume R09.4/arith-abelian-scheme and
R09.4/arith-relative-abelian-rigidity; A2/normalized-poincare-comparison
consumes R09.4/arith-relative-dual. The R09.4 packet review remains
`needs_changes`. Searching the existing AlgebraicModuliForArithmeticGeometry
package README and Suggested.lean found none of those three named contracts.
A package with the same roadmap name does not by itself supply them.

The actual coupled node order is:

1. JC1/relative-jacobian, JC1/jacobian-base-change and
   JC1/principal-polarization.
2. StableReductionPartII:MC.4/full-level, whose prerequisites list all three
   JC1 nodes, followed by MC.4/fine-level-scheme.
3. JC7/universal-level-jacobian, whose prerequisites include both MC.4 nodes,
   followed by JC7/universal-faltings-zhang.

Reciprocal whole-package dependencies would cycle. A maintainer-assigned
bundle must preserve this internal order. Neither focus.json nor the tier
record assigns this bundle. The queued `PKG-JacobianChallengePartII` still
has `after: []`, so its availability does not establish supplier readiness.

The current library does not remove these contracts. Read
`AbelianVariety` in TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean: it has
a field parameter and a group object over that field's spectrum. Read
`rigidifiedPicardFunctor` in PicardFunctor/Rigidified.lean: it requires a
chosen section and returns classes rigidified along it. Neither is the
section-free represented Picard sheaf or the arbitrary-base duality interface
needed here. A focused declaration search in both current algebraic-geometry
source trees found no native abelian-scheme, relative-Jacobian or universal
Poincaré declaration replacing the required contracts. The older audit's
blanket absence claim about Picard functors is not adopted as a current claim.

**Maintainer action:** reconcile and supply the R09.4 contracts, package the
A1–A3 and MC.4 owners, and record the coupled bundle/order before releasing
this package for completion. Gate the package job on those conditions. A
subsequent worker can verify those changes read-only before resuming the
mathematics; repeatedly releasing the job with unchanged inputs cannot
satisfy the supplier rule. This run does not change queue entries or labels.

## Validation and remaining work

- `python3 scripts/check_blueprint.py research/blueprint/packets/JacobianChallengePartII.json`:
  **0 errors, 0 warnings**; 48 nodes, 60 API items, 52 tests, 24 planets,
  11 baseline declarations, 14 gaps and 13 requests. All eight stages are
  planned; none is closed. The packet remains the accepted target-level plan.
- Fresh `lean-check research/blueprint/packages/JacobianChallengePartII/Suggested.lean`:
  **exit 0, 78 declaration-uses-sorry warnings, zero errors and zero other
  warnings**. Memory preflight: 99 GiB available. Used the shared wrapper's
  designated Tau Ceti f790474 / Mathlib 082e2d3 build; no compiler remains
  running. No private build or language server was started.
- The suggested file's concluding omission list accounts for 47 of the
  48 targets. Five have native group-coordinate companions requiring the
  geometric identifications; 42 have no geometric signature. The triangular
  coordinate equivalence is the remaining target. Elaboration alone does
  not discharge this missing signature inventory.
- README: 100,860 bytes; SHA-256
  `3d9ffe9f4d262b9a27b5fa9f78d31956e19fd5d9024a56e087e64598c93e73c2`.
  Suggested.lean: 30,594 bytes; SHA-256
  `7378b6dd8878a4bbeac2de54baab772c9b6628d82bd1f27257ad91b63cfc6560`.
  Accepted packet SHA-256:
  `2da73e3c0831882d8ce8aafb9ac0d468cfefdf784ef8e25b5651a5347d37f275`.

Metadata remains absent: the package is incomplete and the intake's
existence-based classifier would otherwise mark it finished. Once the
external prerequisites change, resume the prior handoff's mathematical
receipts, supply the geometric signatures without replacing conditions by
empty Prop fields, preserve all 48 prose targets with their API/tests and
characteristic/sign/section-free controls, then rerun the blueprint and Lean
checks. Add `topic = "math.AG"` only when the complete package requirements
are met.
