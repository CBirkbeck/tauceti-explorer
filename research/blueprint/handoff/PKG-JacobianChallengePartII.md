# PKG-JacobianChallengePartII — supplier gates remain unresolved

Refs #7593. Codex (GPT-6), session `codex-muxB8O`, 11 October 2026.
Branch: `codex-muxB8O-jacobian-package`.
The bot [confirmed this session's claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7593#issuecomment-6106498972)
for [comment 6106497969](https://github.com/CBirkbeck/tauceti-explorer/issues/7593#issuecomment-6106497969).
This run claimed only this job. None of the manager's forty priority issues was
available. The first eligible fallback review, #454, had been claimed by another
session when its issue was reread; this package was available.

**Blocked checkpoint, not a finished package.** Only this handoff changes.
Independent inspection of the current supplier statements, package trees, library
interfaces and dependency order confirms the inherited blockers. The existing
README and Suggested.lean retain all earlier work. Successful elaboration of the
available coordinate signatures does not supply the omitted geometric definitions,
APIs, tests and comparisons. No new primary-source proof verification is claimed.

## Inspection receipts

Atlas base inspected: `648bad59a0682103ee6dbcbf0686c085e5757349`.
Remote TauCetiRoadmap main, checked through the GitHub API:
`4b002f622e9d68b627bdce9f6224897305a68bdc`.
The [complete roadmap directory](https://github.com/TauCetiProject/TauCetiRoadmap/tree/4b002f622e9d68b627bdce9f6224897305a68bdc/TauCetiRoadmap)
contains neither `AbelianSchemesAndArithmeticModuli` nor `StableReductionPartII`.
The [atlas package directory at the inspected base](https://github.com/CBirkbeck/tauceti-explorer/tree/648bad59a0682103ee6dbcbf0686c085e5757349/research/blueprint/packages)
also has neither supplier package. Its `AbelianSchemesAndArithmeticModuliPartII`
extends the parent; it does not replace the required parent A1–A3 contracts.

The read-only upstream checkout is `070dc2becd74419e76303ede84b465ed4a69461f`.
Read its JacobianChallenge and AlgebraicVectorBundles READMEs in full.
JacobianChallenge Layers D–F supply the field/pointed boundary; AlgebraicVectorBundles
L0B–L0C already own general duals and determinants. These are imported, not replanned.

The current Tau Ceti checkout is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
Read the [AbelianVariety carrier](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean#L95)
and [rigidifiedPicardFunctor signature and pullback API](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/AlgebraicGeometry/PicardFunctor/Rigidified.lean#L57).
The former is over a field's spectrum; the latter requires a specified section.
Neither supplies arbitrary-base abelian-scheme duality or section-free Picard
representability. The AbelianVariety statement was also read with `git show` at
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.
Read the reviewed A1–A3 entries in `data/library-coverage.json`, then checked the
present interfaces instead of treating the older audit's absence claims as current
implementation facts. Current rigidified Picard classes still do not discharge the
required geometric contracts.

Read the cleared-library index. No restricted book or source passage was copied.
The [preceding handoff at this immutable base](https://github.com/CBirkbeck/tauceti-explorer/blob/648bad59a0682103ee6dbcbf0686c085e5757349/research/blueprint/handoff/PKG-JacobianChallengePartII.md)
preserves earlier source receipts, the full 48-target correspondence, proof work
and links to previous continuations. This run does not supersede that proof work.

## Exact external gates

| Supplier | Contract required in its package |
| --- | --- |
| AbelianSchemesAndArithmeticModuli A1 | Arbitrary-base abelian-scheme carrier, products and translations, rigidity including nilpotent thickenings, relative square/cube and power formulas; unrigidified lines retain the zero-fibre correction. |
| AbelianSchemesAndArithmeticModuli A2 | Represented dual abelian schemes, Poincaré bundles normalized along both zero axes, biduality, evaluation/polarization signs, seesaw and arbitrary-base-change comparisons. |
| AbelianSchemesAndArithmeticModuli A3 | Multiplication by every nonzero integer finite locally free, including when that integer is not invertible on the base; scheme-theoretic torsion and Weil pairing. |
| StableReductionPartII MC.4 | Full Jacobi level and the fine smooth-curve scheme with universal curve on the specified cyclotomic symplectic component. |

Read these contracts in the accepted supplying packets, including
`A1/relative-rigidity-comparison`, `A1/relative-cube-and-power`,
`A2/normalized-poincare-comparison`, `A3/multiplication-and-density`,
`MC.4/full-level` and `MC.4/fine-level-scheme`. Compared their exact statements
and prerequisites with this package's *Needs* paragraphs. Restricting to field
abelian varieties or assuming multiplication is étale would change the targets.

### Reconcile the arithmetic owner

The abelian-scheme packet imports R09.4's `arith-abelian-scheme`,
`arith-relative-abelian-rigidity` and `arith-relative-dual`.
The [R09.4 packet](https://github.com/CBirkbeck/tauceti-explorer/blob/648bad59a0682103ee6dbcbf0686c085e5757349/research/blueprint/packets/AlgebraicModuliForArithmeticGeometry--R09.4.json)
still has review status **needs_changes**, dated 9 October 2026.
Its [review report](https://github.com/CBirkbeck/tauceti-explorer/blob/648bad59a0682103ee6dbcbf0686c085e5757349/research/blueprint/reviews/REV-AlgebraicModuliForArithmeticGeometry--R09.4.md)
requires synchronization of the corrected statements and definitive reader;
honest relative-duality and torsion proof gaps are not the reason for that verdict.

Read those three statements and searched the current AlgebraicModuliForArithmeticGeometry
package. Neither its README nor its Suggested.lean contains the three named
contracts. Its scope sends polarized abelian moduli to AbelianSchemesAndArithmeticModuli.
Relative Picard sheaves alone do not assert dual abelian-scheme representability,
Poincaré universality or biduality. Reconcile each contract's accepted owner and
supplying package, and carry its actual statements and native interfaces there
consistently. No ownership move is made in this checkpoint.

### Configure the coupled curve-level order

The directly read prerequisites force the sequence

**JC1 relative Jacobian/base change/principal polarization → MC.4 full level
→ MC.4 fine-level scheme → JC7 universal-level Jacobian.**

MC.4/full-level explicitly imports the three JC1 results. These packages need a
coupled bundle with this internal order; reciprocal whole-package requirements
would create a cycle. MC.4 is an input only to JC7, not to the generic construction.
The current tier document and `focus.json` have no such bundle assignment.
The queue contains neither `PKG-AbelianSchemesAndArithmeticModuli` nor
`PKG-StableReductionPartII`; `PKG-JacobianChallengePartII` still has `after: []`.

The maintainer must arrange the supplier packages, reconcile contract ownership,
and configure the bundle and queue gates. Those files are outside this issue's
four authorized deliverables. The [WORKERS.md upstream-tier rules](../WORKERS.md#upstream-tiers)
permit package citations only to existing roadmaps, lower-tier packages and bundle
members. The issue also says to change no packet and to describe plan mistakes in
the handoff. The missing supplier outputs and bundle configuration are therefore
an external block, rather than a time limit or a need for user approval.

## Fresh validation of preserved work

- `python3 scripts/check_blueprint.py research/blueprint/packets/JacobianChallengePartII.json`:
  **0 errors, 0 warnings**; 48 nodes, 60 API items, 52 unit tests, 24 planets,
  11 baseline declarations, 14 gaps and 13 requests. All eight stages are
  planned; none is closed. Acceptance remains
  `independent-review-REV-DESIGN-JacobianChallengePartII`, 5 October 2026.
- `lean-check research/blueprint/packages/JacobianChallengePartII/Suggested.lean`:
  **exit 0; 78 warnings, all declaration uses sorry; zero errors and zero
  other warnings.** Available memory was 97 GiB. The wrapper waited for a shared
  slot and completed; no compiler remains running. No Lake command ran in either
  read-only checkout and no language server started. The wrapper designates Tau
  Ceti `f790474` and Mathlib `082e2d3`. Shared Mathlib HEAD was confirmed as
  `082e2d37e8b0463410cdb532e111cd43d5a66174`; the shared Tau Ceti tree has no
  Git metadata, so its commit designation is the wrapper's.
- Preserved Suggested.lean SHA-256:
  `7378b6dd8878a4bbeac2de54baab772c9b6628d82bd1f27257ad91b63cfc6560`.
  Preserved README SHA-256:
  `3d9ffe9f4d262b9a27b5fa9f78d31956e19fd5d9024a56e087e64598c93e73c2`.
  They remain 30,594 and 100,860 bytes respectively.
- The Suggested.lean closing inventory lists **47 distinct geometric targets**
  requiring supplier interfaces or geometric identifications. Five have coordinate
  companions: curve difference, universal shift, Faltings–Zhang, shifted
  Faltings–Zhang and shifted-power factorization. The other 42 have no such typed
  companion; the triangular equivalence is the one remaining target. Compilation
  certifies none of the omitted geometric comparisons.
- `git diff --check` and intake `check-files` are run on this handoff before
  submission; results are recorded in the PR.

Metadata remains absent because the package is unfinished. The intake's
`deliverables_complete` currently classifies packages by the existence of every
listed output. Adding the final missing file would misclassify this checkpoint
as complete.

## Resume only after the supplier gates change

1. Supply A1–A3 and MC.4 in their owner packages, reconcile the R09.4 contracts,
   and configure the coupled bundle and queue gates.
2. Reconcile final supplier identifiers with every *Needs* paragraph. Check the
   combined JC1 → MC.4 → JC7 graph without a whole-package cycle.
3. Preserve all 48 prose targets. Express the 42 omitted signatures, their APIs
   and tests against supplying native interfaces. Add the geometric identifications
   of the five coordinate companions. A general group-object morphism supplied as
   an input does not construct the relative Abel map. Use no arbitrary Prop field
   or assumed geometric conclusion in place of a missing condition.
4. Preserve representability/properness, nonreduced-base polarization descent,
   Abel immersion, Poincaré signs/normalization/seesaw, arbitrary-degree-one theta
   pullbacks and the curve-square computation, the nonsymmetric cube recurrence,
   actual Picard equivalence/autoduality, bi-Picard lifts preserving both fibre
   conditions, axis-normalized square comparison, and rank-g bundle duality before
   determinants. Earlier source locators and auxiliary proof readings are linked above.
5. Rerun Lean and submission checks; add `topic = "math.AG"` when the complete
   package requirements are met.

The maintainer should gate #7593 on these concrete supplier changes before releasing
it again. An unchanged supplier tree leaves the same blocker; another identical
validation run will not complete the package.
