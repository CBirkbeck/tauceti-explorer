# PKG-JacobianChallengePartII — blocked supplier checkpoint

Refs #7593. Codex (GPT-6), session `codex-TsQ6lM`, 11 October 2026.
Branch: `codex-TsQ6lM-jacobian-package`.
The bot [confirmed the claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7593#issuecomment-6106326090)
for [claim comment 6106325076](https://github.com/CBirkbeck/tauceti-explorer/issues/7593#issuecomment-6106325076).
This run took only this issue. None of the manager's forty priority issues
was available; this package was the first eligible fallback.

**Blocked checkpoint.** The inherited dependency gates remain unresolved.
This continuation independently checked the supplier contracts, current
package trees, library interfaces and build ordering, and reran the packet
and Lean checks. Only this handoff changes. The package's geometric target
omissions prevent completion; successful elaboration of its existing
companions does not discharge them.

## Evidence and scope

Starting atlas commit: `3c1b280982a2481cd37a45e929918db2ecc0623a`.
Remote TauCetiRoadmap main inspected:
`4b002f622e9d68b627bdce9f6224897305a68bdc`.
The complete [upstream roadmap listing](https://github.com/TauCetiProject/TauCetiRoadmap/tree/4b002f622e9d68b627bdce9f6224897305a68bdc/TauCetiRoadmap)
has 50 entries. Neither it nor the [atlas package tree](https://github.com/CBirkbeck/tauceti-explorer/tree/3c1b280982a2481cd37a45e929918db2ecc0623a/research/blueprint/packages)
contains `AbelianSchemesAndArithmeticModuli` or `StableReductionPartII`.
The existing `AbelianSchemesAndArithmeticModuliPartII` extends its parent;
it does not replace the required parent A1–A3 contracts.

The read-only upstream checkout inspected is
`070dc2becd74419e76303ede84b465ed4a69461f`; the current Tau Ceti checkout is
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
Read both JacobianChallenge and AlgebraicVectorBundles READMEs in full,
the parent Jacobian Suggested.lean and the vector-bundle interface relevant
to fixed-rank determinants, the reviewed A1–A3 library coverage entries,
and the actual current `AbelianVariety` and `rigidifiedPicardFunctor`
signatures. The `AbelianVariety` carrier was also read at Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`: its base is a field's spectrum.
The rigidified functor requires a chosen section and does not assert
section-free representability. Neither supplies the missing arbitrary-base
contracts. No roadmap target was moved, duplicated or replanned.

The cleared-library index was read. This run read no uncleared book and
copied no source passage. No new primary-source proof verification is
claimed. Earlier source receipts, the full 48-target correspondence and
proof work are preserved in the [preceding handoff at this immutable base](https://github.com/CBirkbeck/tauceti-explorer/blob/3c1b280982a2481cd37a45e929918db2ecc0623a/research/blueprint/handoff/PKG-JacobianChallengePartII.md),
which in turn links the earlier detailed source and prototype receipts.

## Exact remaining dependency gates

| Supplier | Required contract |
| --- | --- |
| AbelianSchemesAndArithmeticModuli A1 | Arbitrary-base rigidity, including nilpotent thickenings, and relative cube/power comparisons with the zero-fibre correction for unrigidified lines. |
| AbelianSchemesAndArithmeticModuli A2 | Represented dual abelian schemes, double-normalized Poincaré bundles, biduality and arbitrary-base-change comparisons. |
| AbelianSchemesAndArithmeticModuli A3 | Finite locally free multiplication by every nonzero integer, including integers not invertible on the base. |
| StableReductionPartII MC.4 | Full Jacobi level and the fine smooth-curve scheme with universal curve over the fixed cyclotomic symplectic component. |

These are required by the accepted Jacobian plan and the package's *Needs*
paragraphs. Re-read the supplying A1/A2/A3 statements, the MC.4 `full-level`
and `fine-level-scheme` statements, and the consuming JC7 statements.
A field-only result cannot replace their general-base inputs.

### Arithmetic contract reconciliation

The abelian-scheme packet imports R09.4's `arith-abelian-scheme`,
`arith-relative-abelian-rigidity` and `arith-relative-dual`.
The [R09.4 packet](https://github.com/CBirkbeck/tauceti-explorer/blob/3c1b280982a2481cd37a45e929918db2ecc0623a/research/blueprint/packets/AlgebraicModuliForArithmeticGeometry--R09.4.json)
still has review status **needs_changes**, dated 2026-10-09.
Read its [review report](https://github.com/CBirkbeck/tauceti-explorer/blob/3c1b280982a2481cd37a45e929918db2ecc0623a/research/blueprint/reviews/REV-AlgebraicModuliForArithmeticGeometry--R09.4.md):
it requires synchronization of the corrected packet with its definitive
reader. Honest relative-duality and torsion proof gaps are not themselves
the reason for rejection.

The existing AlgebraicModuliForArithmeticGeometry package does not contain
these three named contracts in its README or Suggested.lean. Its scope
instead sends polarized abelian moduli to AbelianSchemesAndArithmeticModuli.
Its relative Picard-sheaf targets do not alone assert dual abelian-scheme
representability, Poincaré universality or biduality. Before resumption,
reconcile each contract's accepted owner and supplying package, and carry
the actual statements and native interfaces into that package consistently
with its consumers. Those files are outside this issue's authorized paths.

### Coupled curve-level ordering

The direct node prerequisites give the internal sequence

**JC1 relative Jacobian/base change/principal polarization → MC.4 full
level → MC.4 fine-level scheme → JC7 universal-level Jacobian.**

Thus these two roadmaps require a coupled bundle with this internal order.
Reciprocal whole-package dependencies would create a cycle; MC.4 is an
input only to JC7, not to the generic JC0–JC5 construction.
The queue still contains neither `PKG-AbelianSchemesAndArithmeticModuli`
nor `PKG-StableReductionPartII`. This package's `after` remains empty.
Neither `focus.json` nor the upstream tier document supplies a
StableReductionPartII bundle entry. The maintainer must arrange the
supplier packages, bundle and scheduling gates; workers must not change
labels or edit those files from this job.

## Fresh validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/JacobianChallengePartII.json`:
  **0 errors, 0 warnings**; 48 nodes, 60 API items, 52 unit tests,
  24 planets, 11 baseline declarations, 14 gaps and 13 requests.
  All eight stages are planned and none is closed. Acceptance remains
  `independent-review-REV-DESIGN-JacobianChallengePartII`, 2026-10-05.
- `lean-check research/blueprint/packages/JacobianChallengePartII/Suggested.lean`:
  **exit 0; 78 warnings, all `declaration uses sorry`; zero errors and zero
  other warnings.** Available memory was 99 GiB before checking.
  The wrapper designates Tau Ceti `f790474` and Mathlib `082e2d3`;
  shared Mathlib HEAD was independently confirmed as
  `082e2d37e8b0463410cdb532e111cd43d5a66174`. The shared Tau Ceti tree
  has no Git metadata, so its designation is the wrapper's rather than
  an independently authenticated commit. No compiler or language server
  remains running; no Lake command ran in the read-only checkouts.
- Checked Suggested.lean SHA-256:
  `7378b6dd8878a4bbeac2de54baab772c9b6628d82bd1f27257ad91b63cfc6560`.
  It remains 30,594 bytes; the README remains 100,860 bytes.
- `git diff --check` and the intake `check-files` check on this handoff
  are run before submission; their results are recorded in the PR.

The Suggested.lean closing list still omits 42 geometric targets and
requires the geometric identifications of the native companions for
§2.6, §5.2–§5.4 and the supplier input in §5.6. Elaboration validates
only the existing signatures. Metadata remains absent: inspected
`issues.py:deliverables_complete` classifies a package by output existence,
so adding metadata now would incorrectly mark this unfinished job complete.

## Resumption worklist

1. Arrange both supplying packages and the coupled bundle above; reconcile
   the R09.4 arithmetic contracts and gate this job on those inputs.
2. Reconcile final supplier identifiers with every *Needs* paragraph and
   verify the combined JC1 → MC.4 → JC7 prerequisite graph.
3. Preserve all 48 prose targets. Express the omitted geometric definitions,
   API and tests against their supplying native interfaces, and prove the
   geometric identifications of the existing coordinate companions as
   suggested signatures. Do not substitute arbitrary Prop fields, empty
   predicates or assumed geometric conclusions for missing conditions.
4. Retain the mathematical obligations: representability and properness;
   polarization descent on nonreduced bases; relative Abel immersion;
   normalized Poincaré signs/seesaw; arbitrary-degree-one theta pullbacks
   and the curve-square calculation; nonsymmetric cube recurrence; actual
   Picard algebraic equivalence and relative autoduality; bi-Picard lifts
   preserving both fibre conditions; axis-normalized square comparison;
   stable rank-g duality before determinants. Consult the linked predecessor
   handoff for source locators and unresolved auxiliary readings.
5. Rerun Lean and submission checks; add `topic = "math.AG"` only when the
   complete package requirements have been met.

[WORKERS.md, Upstream tiers](../WORKERS.md#upstream-tiers) limits package
citations to existing roadmaps, lower-tier packages and members of the same
bundle. The issue also says “Change no packet; if the plan has a mistake,
describe it in the handoff note” and authorizes only this package and
handoff. The missing supplier outputs, contract reconciliation and bundle
configuration require external changes, so this run submits a blocked
checkpoint and stops after its PR. Keep #7593 unavailable until those gates
are resolved to avoid further identical continuations.
