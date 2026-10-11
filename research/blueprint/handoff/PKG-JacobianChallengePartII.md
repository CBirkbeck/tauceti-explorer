# PKG-JacobianChallengePartII — blocked checkpoint

Refs [#7593](https://github.com/CBirkbeck/tauceti-explorer/issues/7593).
Codex (GPT-6), session `codex-oONN1X`, 11 October 2026.
Branch: `codex-oONN1X-jacobian-package`.
Base atlas commit: `897618096af2bb002a83d22044f03ed8e63fd066`.
The bot [confirmed this claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7593#issuecomment-6108390640),
identifying claim comment 6108389640.

**The package remains blocked and unfinished.** This submission updates only
this handoff after checking the current supplier contracts and rerunning the
existing validations. The required supplier packages are absent, and the
coupled Jacobian/moduli bundle has not been assigned. The issue permits only
the three package files and this handoff: writing the suppliers, reconciling
their plans or changing the tier/queue records is outside its scope.

The [previous handoff at this run's base](https://github.com/CBirkbeck/tauceti-explorer/blob/897618096af2bb002a83d22044f03ed8e63fd066/research/blueprint/handoff/PKG-JacobianChallengePartII.md)
retains the links to earlier mathematical receipts and signature work. Follow
that immutable chain when resuming. This run makes no new mathematical or
source-reading claim.

## Selection and claim

The complete open `swarm`, `state:available` inventory contained no issue from
the manager's forty-issue priority list. No available finished-plan review or
package review was eligible. The focused package #7462 appeared in the first
inventory, but another session claimed it before this worker claimed anything.
A refreshed inventory left #7593 as the available package ahead of new
blueprint/design jobs. Reviews of fixes are later in WORKERS.md's ordering.
Only #7593 was claimed; the bot's confirmation was verified before work began.

## Current prerequisite evidence

Read the supplied current `JacobianChallenge` and `AlgebraicVectorBundles`
READMEs in full and inspected their suggested interfaces. The supplied
read-only roadmap tree is at
`c251d2e42c66f14c279d1e5c2708c5a91d8c8aec`, and the current Tau Ceti tree is at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Neither tree was changed, and no
Lake command was run there. The cleared-library index was read; no book or
source passage was copied or downloaded.

A fresh GitHub API check found upstream main at
[`4b002f622e9d68b627bdce9f6224897305a68bdc`](https://github.com/TauCetiProject/TauCetiRoadmap/tree/4b002f622e9d68b627bdce9f6224897305a68bdc/TauCetiRoadmap).
Neither required supplier below appears in its roadmap or Completed directory
listing. Neither exact package directory exists in this atlas checkout, and
neither corresponding `PKG-` job is in `research/blueprint/queue.json`.

| Missing package | Required interface |
| --- | --- |
| AbelianSchemesAndArithmeticModuli, A1–A3 | Arbitrary-base abelian schemes; rigidity on nonreduced bases; products and translations; square/cube formulas; relative duals and the Poincaré bundle normalized on both zero axes; biduality, seesaw and base change; finite locally free nonzero integer multiplication, torsion and Weil pairings. |
| StableReductionPartII, MC.4 | Full symplectic Jacobi level in the specified cyclotomic pairing component, and a fine smooth-curve scheme carrying its universal curve. |

The accepted `AbelianSchemesAndArithmeticModuliPartII` package cannot replace
its parent: its scope explicitly imports A1–A3, and its Betti applications
consume this roadmap's JC2 and JC7. The parent packet imports still lower
contracts from `AlgebraicModuliForArithmeticGeometry:R09.4`:

- A1/relative-products-and-dimension imports `arith-abelian-scheme` and
  `arith-relative-abelian-rigidity`.
- A1/relative-rigidity-comparison imports those same contracts.
- A2/normalized-poincare-comparison imports `arith-relative-dual`.

The R09.4 packet's review remains `needs_changes`. A fresh exact-name search
found none of these three contracts in the existing
`AlgebraicModuliForArithmeticGeometry` package README or Suggested.lean.
Its package name and metadata do not establish these particular supplies.

The coupled node dependencies were re-read in both accepted packets:

1. JC1/relative-jacobian, JC1/jacobian-base-change and
   JC1/principal-polarization supply StableReductionPartII:MC.4/full-level.
2. MC.4/full-level supplies MC.4/fine-level-scheme.
3. Both MC.4 nodes supply JC7/universal-level-jacobian, followed by
   JC7/universal-faltings-zhang.

Thus separate whole-roadmap prerequisites would cycle. A coupled bundle must
preserve this internal order, with the generic Jacobian before full-level
moduli and the universal application after it. No such assignment is recorded
in `focus.json` or the upstream tier document. The package queue entry still
has `after: []`; its availability does not certify supplier readiness.

The reviewed A1–A3 library audit was checked as a lead, then compared with
current source statements. `AbelianVariety` in
`TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean` has a field parameter and
an underlying group object over that field's spectrum. It does not provide
an arbitrary-base abelian scheme. `rigidifiedPicardFunctor` in
`TauCeti/AlgebraicGeometry/PicardFunctor/Rigidified.lean` requires an actual
section and takes rigidified line-bundle classes. It does not supply the
section-free represented Picard sheaf or relative duality required here.
Focused searches of both current algebraic-geometry trees found no native
abelian-scheme, relative-Jacobian or Poincaré declaration replacing these
contracts. The audit's old blanket absence claim about Picard functors is
not used as a statement about the current library.

WORKERS.md's upstream-tier rules permit package targets to cite the libraries,
their own layers, assigned bundle members or lower-tier packages. PROTOCOL
sections 3, 15 and 20 require precise suppliers, unique ownership and agreement
with the accepted plan. Rebuilding these external owners in this package
would violate those boundaries. Missing implementation alone is not the
blocking condition; missing admissible supplying packages and the unassigned
coupled order are.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/JacobianChallengePartII.json`:
  **0 errors, 0 warnings**; 48 nodes, 60 API items, 52 tests, 24 planets,
  11 baseline declarations, 14 gaps and 13 requests. All eight stages are
  planned; none is closed. No packet was changed.
- Fresh `lean-check research/blueprint/packages/JacobianChallengePartII/Suggested.lean`:
  **exit 0, zero errors, 78 warnings, all declaration-uses-sorry warnings**.
  `free -g` reported 86 GiB available before the check. The designated shared
  wrapper was used; its Mathlib source commit was verified as
  `082e2d37e8b0463410cdb532e111cd43d5a66174`. No compiler or language server
  remains running.
- Compile-log SHA-256:
  `7d35bef0cb39d3cb978f4b5f9bc06ddb07312df90c935d6c759f7cd06408ca47`.
- The concluding omission inventory lists 47 of 48 targets. The triangular
  coordinate equivalence is the sole unlisted target. Five listed targets
  have native group-coordinate companions requiring the stated geometric
  identifications; the other 42 lack geometric signatures. Successful
  elaboration of this subset does not complete the package.
- README: 100,860 bytes; SHA-256
  `3d9ffe9f4d262b9a27b5fa9f78d31956e19fd5d9024a56e087e64598c93e73c2`.
- Suggested.lean: 30,594 bytes; SHA-256
  `7378b6dd8878a4bbeac2de54baab772c9b6628d82bd1f27257ad91b63cfc6560`.
- Accepted packet SHA-256:
  `2da73e3c0831882d8ce8aafb9ac0d468cfefdf784ef8e25b5651a5347d37f275`.

## Resume conditions

The maintainer needs to reconcile the R09.4 contracts, supply the A1–A3 and
MC.4 owner packages, and record the coupled bundle with the node order above.
Gate this package job on those conditions; another release with identical
inputs leaves the same blocker. This submission changes no labels, queue
records or other jobs' files.

Once those inputs exist, resume the earlier mathematical receipts and the
accepted plan. Supply the geometric signatures against their owners' actual
interfaces, preserve all 48 prose targets and their API/tests, retain the
section-free, sign, characteristic and nonreduced-base controls, and rerun the
blueprint and Lean checks. Add `topic = "math.AG"` to metadata.toml only when
those package requirements are met. Metadata remains absent because the
package is incomplete and the intake's existence-based classifier would
otherwise mark it finished.
