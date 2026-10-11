# PKG-JacobianChallengePartII — blocked on supplier packages and bundle order

Refs #7593. Codex (GPT-6), session `codex-dlfJuO`, 11 October 2026.
Branch: `codex-dlfJuO-jacobian-package`.
The bot confirmed `/claim Codex — codex-dlfJuO` for
[comment 6106863362](https://github.com/CBirkbeck/tauceti-explorer/issues/7593#issuecomment-6106863362).
None of the manager's forty priority issues was in the available swarm list.
Available reviews concerned excluded follow-up work; #7593 was the first eligible
fallback package. This run claimed only this job.

**Blocked checkpoint.** Only this handoff changes. The existing README and
Suggested.lean are preserved. Completion requires changes outside the four
permitted deliverables, rather than additional time for this package.

## Current continuation: unchanged external block

Base: `001b8e8a977259a9b71681d54eb865d91b29b26c`. Independently rechecked the
blocking conditions below. The immutable
[preceding handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/001b8e8a977259a9b71681d54eb865d91b29b26c/research/blueprint/handoff/PKG-JacobianChallengePartII.md)
retains the previous worker's evidence; the earlier source receipts linked
there remain the place to resume mathematical work.

- Read both current upstream JacobianChallenge and AlgebraicVectorBundles
  READMEs in full and inspected their relevant Suggested.lean interfaces.
  Their existing targets remain imports.
- Remote TauCetiRoadmap main is still
  `4b002f622e9d68b627bdce9f6224897305a68bdc`. Its roadmap-directory listing has
  neither AbelianSchemesAndArithmeticModuli nor StableReductionPartII.
- Neither supplier has a package directory under `research/blueprint/packages/`
  or a `PKG-` job in `queue.json`. The Jacobian package job still has
  `after: []`. Neither `focus.json` nor the tier order assigns these mutually
  dependent roadmaps to a bundle.
- Read the exact A1–A3, R09.4 and MC.4 statements and prerequisites listed
  below. Their review statuses remain unchanged. In particular MC.4 imports
  JC1, and JC7 imports MC.4: assigning reciprocal whole-package prerequisites
  would create a cycle.
- Read the A1–A3 library audit and current native interfaces. Confirmed the
  field-based `AbelianVariety` carrier also at pinned Tau Ceti `f790474`.
  Current `rigidifiedPicardFunctor` requires a section. The audit's older
  absence claim for *all* Picard functors is not a claim about today's library.
- Fresh blueprint validation reports **0 errors, 0 warnings**, with the
  counts below unchanged. Fresh `lean-check` reports **78 sorry warnings,
  zero errors and zero other warnings**; available memory was 98 GiB.
  Compilation covers the existing coordinate companions, not the geometric
  targets enumerated at the end of the file.

This issue permits only its three package files and this handoff, and expressly
forbids packet edits. WORKERS.md permits package dependencies only on existing
roadmaps, lower-tier packages or assigned bundle members. Completing supplier
packages, repairing their ownership contracts or changing the bundle/queue is
therefore external work. No mathematical target or ownership assignment changes
in this checkpoint; the two package-file hashes below are unchanged.

**Manager action before another continuation:** gate this job on the supplier
packages and assign the JC1 → MC.4 → JC7 bundle order. Releasing it with the same
supplier tree leaves the same block. After those changes, resume the geometric
signature and identification work listed under “Resume conditions and next
work”; it is not discharged by the successful Lean check.

## Preserved evidence from the preceding checkpoint

Atlas base: `a51b147164c4e9cd0643f8039a45f10f1b22423f`.
The [previous handoff at this immutable base](https://github.com/CBirkbeck/tauceti-explorer/blob/a51b147164c4e9cd0643f8039a45f10f1b22423f/research/blueprint/handoff/PKG-JacobianChallengePartII.md)
preserves the full target correspondence, primary-source receipts, proof work,
remaining geometric obligations and earlier continuations. Those findings remain
available there; this run makes no new primary-source verification claim.

Read both upstream JacobianChallenge and AlgebraicVectorBundles READMEs in full,
and their relevant Suggested.lean interfaces, in the read-only checkout at
`070dc2becd74419e76303ede84b465ed4a69461f`. The former owns field/pointed
Jacobians; the latter owns general duals and determinants in L0B–L0C.
Neither development is replanned here. Read the cleared-library index; no
restricted source was copied.

Checked remote TauCetiRoadmap main through the GitHub API:
`4b002f622e9d68b627bdce9f6224897305a68bdc`. Its
[roadmap directory](https://github.com/TauCetiProject/TauCetiRoadmap/tree/4b002f622e9d68b627bdce9f6224897305a68bdc/TauCetiRoadmap)
contains neither AbelianSchemesAndArithmeticModuli nor StableReductionPartII.
Neither supplier has an atlas package directory or a package job in the queue.

Read the reviewed A1–A3 audit entries in `data/library-coverage.json` and checked
current interfaces directly. Current Tau Ceti is
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
Its [AbelianVariety carrier](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean#L95)
is over a field's spectrum; the statement was also read at pinned
`f790474821cf4256814db967cb154e7af3d0c369`.
Its [rigidifiedPicardFunctor](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/AlgebraicGeometry/PicardFunctor/Rigidified.lean#L66)
requires a specified section. These APIs do not provide arbitrary-base dual
abelian schemes or section-free Picard representability. The older audit's
absence of all Picard functors is therefore not used as a current-library claim.

## Exact blocking contracts

Read the accepted supplying statements and their prerequisites, rather than
inferring a contract from a layer name:

| Supplier | Required output |
| --- | --- |
| AbelianSchemesAndArithmeticModuli A1 | Arbitrary-base abelian schemes, translations and rigidity over nilpotent thickenings; normalized square/cube and integer power formulas, including the base-line correction for unrigidified bundles. |
| AbelianSchemesAndArithmeticModuli A2 | Represented dual abelian schemes, Poincaré normalization on both zero axes, evaluation/biduality, polarization signs, seesaw and arbitrary-base-change comparisons. |
| AbelianSchemesAndArithmeticModuli A3 | Nonzero integer multiplication finite locally free of rank absolute-value(n)^(2g), including when n is not invertible; scheme-theoretic torsion and Weil pairing. |
| StableReductionPartII MC.4 | Full Jacobi level and the fine smooth-curve scheme with universal curve on the specified cyclotomic symplectic component. |

The abelian supplier's independent review is accepted, dated 9 October 2026;
the stable-reduction supplier's is accepted, dated 10 October. Their accepted
specifications are not supplying packages. The exact inspected nodes are
`A1/relative-rigidity-comparison`, `A1/relative-cube-and-power`,
`A2/normalized-poincare-comparison`, `A3/multiplication-and-density`,
`MC.4/full-level` and `MC.4/fine-level-scheme`.

A1–A3 import R09.4's `arith-abelian-scheme`,
`arith-relative-abelian-rigidity` and `arith-relative-dual`. Read those statements
and the R09.4 review report. Its review remains **needs_changes**, dated
9 October 2026, requiring synchronization of corrected statements with the reader.
The AlgebraicModuliForArithmeticGeometry package contains none of these three
named contracts and routes polarized abelian moduli to the abelian-scheme owner.
Its relative Picard sheaf does not replace dual representability, Poincaré
universality or biduality. Reconcile the accepted owner and supplying package for
each contract before treating that package as its provider.

MC.4/full-level explicitly consumes JC1's relative Jacobian, base change and
principal polarization. JC7/universal-level-jacobian consumes MC.4's full-level
and fine-level-scheme nodes. The internal order must therefore be:

**JC1 relative Jacobian/base change/principal polarization → MC.4 full level
→ MC.4 fine-level scheme → JC7 universal-level Jacobian.**

These need a coupled bundle; reciprocal whole-package dependencies create a
cycle. Current `focus.json` and the tier document do not assign that bundle.
The queue has neither `PKG-AbelianSchemesAndArithmeticModuli` nor
`PKG-StableReductionPartII`, while this package still has `after: []`.

WORKERS.md's upstream-tier rule allows package citations only to existing
roadmaps, lower-tier packages and bundle members. The issue permits only its
README, Suggested.lean, metadata and handoff, and says to change no packet.
Creating supplier packages, reconciling their ownership and configuring the
bundle/queue are outside this job. No ownership move is made here.

## Validation and preserved completion boundary

- Blueprint checker: **0 errors, 0 warnings**; 48 targets, 60 API items,
  52 unit tests, 24 planets, 11 baseline declarations, 14 gaps and 13 requests.
  All eight stages are planned; none is closed. Acceptance remains
  `independent-review-REV-DESIGN-JacobianChallengePartII`, 5 October 2026.
- Fresh `lean-check research/blueprint/packages/JacobianChallengePartII/Suggested.lean`:
  **exit 0, 78 sorry warnings, zero errors and zero other warnings**.
  Available memory was 96 GiB. The wrapper uses pinned Tau Ceti f790474 and
  reports shared Mathlib 082e2d37e8. No compiler remains running; no language
  server or Lake command ran in either read-only checkout.
- Preserved README SHA-256:
  `3d9ffe9f4d262b9a27b5fa9f78d31956e19fd5d9024a56e087e64598c93e73c2`.
- Preserved Suggested.lean SHA-256:
  `7378b6dd8878a4bbeac2de54baab772c9b6628d82bd1f27257ad91b63cfc6560`.

Read the closing inventory: 47 geometric targets require supplier interfaces or
identifications. Five have coordinate companions (curve difference, universal
shift, Faltings–Zhang, shifted Faltings–Zhang and shifted-power factorization);
42 have no corresponding geometric signature. The triangular equivalence is the
remaining target. Compilation does not establish these omitted constructions.

Metadata remains absent: the package is unfinished, and adding the last listed
output would cause the existence-based intake test to classify it as complete.
The handoff's intake file check and `git diff --check` are recorded in the PR.

## Resume conditions and next work

The maintainer should gate #7593 until the following external changes occur:

1. Supply the A1–A3 and MC.4 owner packages, including their native interfaces;
   reconcile the three R09.4 imported contracts with their accepted owner.
2. Configure the coupled bundle and the internal JC1 → MC.4 → JC7 order.
   Ensure no whole-package cycle and no MC.4 dependency in the generic JC1 construction.
3. Reconcile the package's supplier identifiers; preserve all 48 prose targets.
   Express the 42 omitted geometric signatures with their APIs/tests, and the
   geometric identifications of the five coordinate companions. The preceding
   handoff supplies the detailed proof and convention checklist.
4. Run the blueprint, Lean and submission checks, and add `topic = "math.AG"`
   when the complete package requirements are met.

An unchanged supplier tree leaves the same external block. Releasing this issue
again without those changes produces another checkpoint, not a finished package.
