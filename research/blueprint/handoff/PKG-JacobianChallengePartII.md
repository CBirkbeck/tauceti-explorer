# PKG-JacobianChallengePartII — blocked checkpoint

Refs [#7593](https://github.com/CBirkbeck/tauceti-explorer/issues/7593).
Codex (GPT-6), session `codex-ydYTd7`, 11 October 2026.
Branch: `codex-ydYTd7-jacobian-package`.
The bot [confirmed this claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7593#issuecomment-6107081786)
for claim comment 6107080695. Base atlas commit:
`3bb796f9d239e9568caaf90e1f4c18fe2bfcb2ab`.

**Blocked checkpoint; the package is unfinished.** This submission changes
only the handoff. Its supplier and bundle conditions remain unsatisfied.
The README and Suggested.lean are unchanged, and metadata remains absent.
The mathematical continuation evidence is preserved in the
[preceding handoff at this immutable base](https://github.com/CBirkbeck/tauceti-explorer/blob/3bb796f9d239e9568caaf90e1f4c18fe2bfcb2ab/research/blueprint/handoff/PKG-JacobianChallengePartII.md),
including links to the earlier primary-source receipts and proof work. This
run makes no new primary-source verification or implementation claim.

## Selection and authorization

The open `swarm`, `state:available` inventory contained none of the manager's
forty listed issues. There were no eligible plan or package reviews and no
available `top` or `focus` jobs among the permitted kinds. The fallback
package inventory contained #7592 and #7593. Another session won #7592;
the bot rejected this session's request before work began. This session held
only the confirmed #7593 claim and takes no second job.

The issue authorizes only this package's README, Suggested.lean, metadata and
handoff, and explicitly forbids packet edits. WORKERS.md's upstream-tier
rule permits package citations to existing roadmaps, lower-tier packages and
assigned bundle members. Supplying the missing packages, reconciling the
supplier ownership, or configuring a bundle is outside those four paths.
PROTOCOL §§3, 15 and 20 require genuine supplying targets and agreement with
the accepted plan. Admitting new local stand-ins would not discharge these
conditions.

## Independent checks in this continuation

Read both current upstream **JacobianChallenge** and **AlgebraicVectorBundles**
READMEs in full and inspected their Suggested.lean interfaces. The parent
owns the field/pointed Jacobian and its prerequisite tower; vector bundles
own the general dual and determinant constructions. Their targets remain
imports. The read-only upstream checkout is
`070dc2becd74419e76303ede84b465ed4a69461f`; current Tau Ceti is
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Neither checkout was modified;
no Lake command was run there. Read the cleared-library index; no restricted
source was copied.

GitHub's TauCetiRoadmap main remains
`4b002f622e9d68b627bdce9f6224897305a68bdc`. Its
[roadmap-directory listing](https://github.com/TauCetiProject/TauCetiRoadmap/tree/4b002f622e9d68b627bdce9f6224897305a68bdc/TauCetiRoadmap)
contains neither **AbelianSchemesAndArithmeticModuli** nor
**StableReductionPartII**. Both corresponding atlas package directories
are absent. Exact job-ID comparison in `queue.json` finds neither
`PKG-AbelianSchemesAndArithmeticModuli` nor `PKG-StableReductionPartII`;
`PKG-JacobianChallengePartII` is pending with `after: []`.

There is an accepted **AbelianSchemesAndArithmeticModuliPartII** package.
Its README's “Scope and dependencies” explicitly imports the parent's
A1–A3 objects; it does not supply them. It also consumes JC2 and JC7.
Consequently its existing package cannot replace the absent parent package
or be treated as a lower prerequisite of the Jacobian package.

Read the exact A1–A3 supplying statements and their dependencies, the MC.4
full-level and fine-scheme statements, JC1 and JC7's relevant contracts,
and the R09.4 statements and review report. The abelian-scheme review is
accepted (9 October); the stable-reduction review is accepted (10 October).
R09.4 remains **needs_changes** (9 October): its corrected packet and
prototype still need reader synchronization. The completed
AlgebraicModuliForArithmeticGeometry package contains none of the three
named contracts below; its general Picard sheaf does not by itself provide
relative dual representability or biduality.

Read the A1–A3 entries in the reviewed library audit and the current native
`AbelianVariety` carrier and `rigidifiedPicardFunctor` statements. The
former has a field parameter and a group object over its spectrum; the
latter requires a specified section. These inspected declarations do not
provide the required arbitrary-base and section-free contracts. The audit's
older absence assertion about all Picard functors is not used as a current
library claim.

## Contracts and the required dependency order

| Supplier | Required output |
| --- | --- |
| AbelianSchemesAndArithmeticModuli A1 | Arbitrary-base abelian schemes, relative rigidity including nilpotent thickenings, translation decomposition, and normalized square/cube/integer power formulas. |
| AbelianSchemesAndArithmeticModuli A2 | Represented relative duals, Poincaré trivializations on both zero axes, evaluation/biduality, seesaw, polarization signs and arbitrary base change. |
| AbelianSchemesAndArithmeticModuli A3 | Nonzero integer multiplication finite locally free of rank absolute-value(n)^(2g), including inseparable cases, together with scheme-theoretic torsion and Weil pairing. |
| StableReductionPartII MC.4 | Full Jacobi level and the fine smooth-curve scheme with universal curve on the specified cyclotomic symplectic component. |

A1–A3 import R09.4's `arith-abelian-scheme`,
`arith-relative-abelian-rigidity` and `arith-relative-dual`. Reconcile each
of these with its accepted supplying owner/package before claiming an
available provider.

The exact consuming edges require:

**JC1 relative Jacobian/base change/principal polarization → MC.4 full level
→ MC.4 fine-level scheme → JC7 universal-level Jacobian.**

`StableReductionPartII:MC.4/full-level` explicitly lists the three JC1
nodes. `JacobianChallengePartII:JC7/universal-level-jacobian` explicitly
lists MC.4/full-level and MC.4/fine-level-scheme. This is an acyclic order of
individual targets, but reciprocal whole-package prerequisites would cycle.
Neither `focus.json` nor the current tier document assigns these two
roadmaps to a coupled bundle. Keep MC.4 out of the generic JC1 construction.

## Validation and completion boundary

- `python3 scripts/check_blueprint.py research/blueprint/packets/JacobianChallengePartII.json`:
  **0 errors, 0 warnings**. It reports 48 targets, 60 API items, 52 unit tests,
  24 planets, 11 baseline declarations, 14 gaps and 13 requests. All eight
  stages are planned; none is closed. Its acceptance is a completed planning
  pass, not a supplier-package or signature-completeness certificate.
- Fresh `lean-check research/blueprint/packages/JacobianChallengePartII/Suggested.lean`:
  **exit 0, 78 declaration-uses-sorry warnings, zero errors and zero other
  warnings**. Memory preflight: 97 GiB available. The shared wrapper reports
  pinned Mathlib `082e2d37e8`. No compiler remains running.
- README: 100,860 bytes; SHA-256
  `3d9ffe9f4d262b9a27b5fa9f78d31956e19fd5d9024a56e087e64598c93e73c2`.
- Suggested.lean: 30,594 bytes; SHA-256
  `7378b6dd8878a4bbeac2de54baab772c9b6628d82bd1f27257ad91b63cfc6560`.

Read the closing signature inventory: 47 geometric targets still need
supplier interfaces or geometric identifications. Five have coordinate
companions (curve difference, universal shift, Faltings–Zhang, shifted
Faltings–Zhang and shifted-power factorization); 42 have no corresponding
geometric signature. The triangular equivalence is the remaining target.
Successful elaboration of the companions does not establish these omitted
constructions. No mathematical target is changed in this continuation.

Metadata remains absent because this is an unfinished package; its presence
would make the intake's existence test classify the package as complete.
The handoff file check and `git diff --check` are recorded in the PR.

## Resume after these external changes

1. Supply the A1–A3 and MC.4 owner packages/interfaces and reconcile their
   R09.4 imports with accepted owning targets.
2. Assign the coupled JacobianChallengePartII/StableReductionPartII bundle,
   with the internal JC1 → MC.4 → JC7 order, and gate this package on its
   prerequisites. A reciprocal pair of whole-package `after` entries is
   insufficient.
3. Resume the geometric signature/identification work from the immutable
   preceding handoff, retaining all 48 prose targets, their API/tests and
   the characteristic/sign/section-free controls. Replace supplier references
   only by contracts that actually provide the stated generality.
4. Run the blueprint, Lean and submission checks, and add
   `topic = "math.AG"` only when the package requirements are met.

Releasing this job against the same supplier tree cannot complete the
package. The required external change is a supplier/bundle amendment, not
another repetition of the coordinate compilation or source search.
