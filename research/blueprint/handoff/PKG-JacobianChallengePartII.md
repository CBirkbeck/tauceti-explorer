# PKG-JacobianChallengePartII — supplier gates still unresolved

Refs #7593. Codex (GPT-6), session `codex-c0KRcm`, 11 October 2026.
Branch: `codex-c0KRcm-jacobian-package`. The bot
[confirmed the claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7593#issuecomment-6105949857)
for claim comment `6105948875`. This run claims only this issue.

**Blocked checkpoint.** This continuation independently rechecked the current
supplier trees, their mathematical contracts and the scheduling gate. The
requirements recorded below are still unresolved. Only this handoff changes;
the package cannot meet the upstream ordering and native-signature requirements
within this issue's authorized paths. The predecessor's target correspondence,
source receipts and resumption worklist are retained below.

## Fresh dependency check

The atlas main inspected was
`1e244e56b469b0c84906f48d7f670d09780fd895`, also the clone's starting commit.
Current remote TauCetiRoadmap main was
`4b002f622e9d68b627bdce9f6224897305a68bdc`. The complete directory listings of
the [75 atlas packages](https://github.com/CBirkbeck/tauceti-explorer/tree/1e244e56b469b0c84906f48d7f670d09780fd895/research/blueprint/packages)
and [50 upstream roadmaps](https://github.com/TauCetiProject/TauCetiRoadmap/tree/4b002f622e9d68b627bdce9f6224897305a68bdc/TauCetiRoadmap)
contain neither `AbelianSchemesAndArithmeticModuli` nor
`StableReductionPartII`. The atlas has
`AbelianSchemesAndArithmeticModuliPartII`, which extends its parent and does
not replace the missing parent A1–A3 contracts.

I re-read the accepted supplying nodes and the four consuming JC1/JC7
targets. The dependency contracts remain:

| Required supplier | Exact input that prevents completion |
| --- | --- |
| AbelianSchemesAndArithmeticModuli A1 | Rigidity on arbitrary bases, including nilpotent thickenings, and the relative cube/power comparisons. |
| AbelianSchemesAndArithmeticModuli A2 | Represented dual abelian schemes, normalized Poincaré bundles, biduality and their arbitrary-base-change comparisons. |
| AbelianSchemesAndArithmeticModuli A3 | Finite locally free multiplication by every nonzero integer, including integers not invertible on the base. |
| StableReductionPartII MC.4 | Full symplectic level and the fine smooth-curve scheme with its universal curve, over the fixed cyclotomic pairing component. |

The arithmetic R09.4 supplier is still `needs_changes`, dated 2026-10-09.
The existing AlgebraicModuliForArithmeticGeometry package states relative
Picard-sheaf and descent targets, but its scope sends polarized abelian
moduli to AbelianSchemesAndArithmeticModuli. Its README and Suggested.lean do
not carry the `arith-abelian-scheme`, `arith-relative-abelian-rigidity` or
`arith-relative-dual` contracts imported by the abelian-scheme packet.
Accordingly, a package directory with this name does not settle those inputs.
The predecessor's detailed reconciliation requirement below remains in force.

The direct node prerequisites establish the internal sequence
**JC1 relative Jacobian/base change/polarization → MC.4 full level → MC.4
fine-level scheme → JC7 universal-level Jacobian**. This is a coupled bundle
requirement, rather than an ordering of two whole packages. The queue still
contains neither missing supplier package job, and this job still has
`after: []`. `focus.json` and the upstream tier document still provide no
StableReductionPartII bundle entry. Completion needs the maintainer to arrange
the supplying packages and that bundle before this package is resumed.

The read-only upstream checkout is
`070dc2becd74419e76303ede84b465ed4a69461f`; current Tau Ceti is
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. I read the complete upstream
JacobianChallenge and AlgebraicVectorBundles READMEs, the reviewed A1–A3
library audit, and the actual `AbelianVariety` and
`rigidifiedPicardFunctor` signatures. `AbelianVariety K` has a field base
`Spec K`; the rigidified functor requires a chosen section and makes no
section-free representability assertion. The abelian-variety carrier was
also read at Tau Ceti `f790474`. These interfaces cannot replace the missing
arbitrary-base contracts. No mathematical target was moved or replanned.
The cleared-library index was read; no book or source passage was copied.

## Fresh validation and resumption

- `python3 scripts/check_blueprint.py research/blueprint/packets/JacobianChallengePartII.json`:
  **0 errors, 0 warnings**; 48 nodes, 60 API items, 52 tests, 24 planets,
  11 baseline declarations, 14 gaps and 13 requests. All eight layers are
  planned and none is closed. This is a structural check of the inherited plan.
- `lean-check research/blueprint/packages/JacobianChallengePartII/Suggested.lean`:
  **exit 0; 78 warnings, all `declaration uses sorry`; zero errors and zero
  other warnings.** Available memory was 102 GiB. The wrapper is configured
  for Tau Ceti `f790474` and Mathlib `082e2d3`; the shared Mathlib HEAD was
  independently confirmed as `082e2d37e8b0463410cdb532e111cd43d5a66174`.
  As in the predecessor run, the shared Tau Ceti tree has no Git metadata,
  so its designation is the wrapper's rather than an independently
  authenticated commit. No compiler or language server remains running.
- The checked Suggested.lean SHA-256 is
  `7378b6dd8878a4bbeac2de54baab772c9b6628d82bd1f27257ad91b63cfc6560`.
  Its successful elaboration does not supply the 42 omitted geometric
  targets or the geometric identifications of the existing companions.
- `git diff --check` and the intake `check-files` check on this handoff:
  **passed**. The PR changes only this authorized handoff.

Metadata remains absent so that the intake continues to classify this as a
checkpoint. Fresh inspection of `issues.py:deliverables_complete` confirms
that package completion is determined by the existence of all outputs;
adding metadata while the supplier and signature requirements remain unmet
would falsely classify the job as finished.

Resume from the retained worklist only after the two supplier packages,
arithmetic-contract reconciliation and coupled bundle are available. This
issue permits only its package files and handoff; it cannot make those
external changes. The upstream-tier rule in WORKERS.md permits package
citations to lower-tier packages and members of the same bundle. That rule
and the explicit issue path restriction require this blocked checkpoint.

## Predecessor checkpoint and retained continuation details

Refs #7593. Codex (GPT-6), session `codex-yA3Fsq`, 11 October 2026.
Branch: `codex-yA3Fsq-jacobian-package`.
The bot [confirmed this claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7593#issuecomment-6105807433)
for claim comment `6105806480`. This run takes only this job. At selection,
none of the manager's forty priority issues appeared among the 694 open
`swarm`, `state:available` issues. This package was the first permitted
fallback under WORKERS.md.

**Blocked checkpoint.** The two missing supplier packages and the coupled-bundle
schedule remain unresolved. This continuation independently checked those gates,
found an additional mismatch between the arithmetic supplier packet and its
current package, and validated the inherited Lean file and packet. Only this
handoff changes.
The README and Suggested.lean remain inherited work; their successful checks
are not a claim that the omitted geometry has been prototyped or implemented.

## Evidence checked in this run

Atlas clone and remote main were
`43d1333d8377cdfa82317a22d2a67ec03b9fdab6`; remote TauCetiRoadmap main was
`4b002f622e9d68b627bdce9f6224897305a68bdc`.
The [atlas package tree](https://github.com/CBirkbeck/tauceti-explorer/tree/43d1333d8377cdfa82317a22d2a67ec03b9fdab6/research/blueprint/packages)
has 75 entries and the [upstream roadmap tree](https://github.com/TauCetiProject/TauCetiRoadmap/tree/4b002f622e9d68b627bdce9f6224897305a68bdc/TauCetiRoadmap)
has 50. Neither contains `AbelianSchemesAndArithmeticModuli` or
`StableReductionPartII`. The atlas's existing
`AbelianSchemesAndArithmeticModuliPartII` extends the missing parent; it does
not supply the required parent layers A1–A3.

The accepted parent packet's review is
`independent-review-REV-AbelianSchemesAndArithmeticModuli`, 2026-10-09.
Its A1 relative rigidity and cube/power comparisons and A2 normalized
Poincaré/biduality comparisons require arbitrary bases, including nilpotent
thickenings. JC2 and JC5 additionally consume A3 finite locally free
multiplication by every nonzero integer, including when that integer is not
invertible on the base. This run read the exact
`A1/relative-rigidity-comparison`, `A1/relative-cube-and-power`,
`A2/normalized-poincare-comparison`, `A2/mumford-map-and-biextension` and
`A3/multiplication-and-density` statements and their direct prerequisites.
Field abelian varieties do not supply these arbitrary-base contracts.

### Arithmetic supplier references need reconciliation

The accepted abelian-scheme packet's A1 and A2 nodes consume
`AlgebraicModuliForArithmeticGeometry:R09.4/arith-abelian-scheme`,
`arith-relative-abelian-rigidity` and `arith-relative-dual`. The actual
[R09.4 packet](https://github.com/CBirkbeck/tauceti-explorer/blob/43d1333d8377cdfa82317a22d2a67ec03b9fdab6/research/blueprint/packets/AlgebraicModuliForArithmeticGeometry--R09.4.json)
has review status **needs_changes**, reviewer
`independent-review-REV-AlgebraicModuliForArithmeticGeometry--R09.4`,
2026-10-09. Its
[review report](https://github.com/CBirkbeck/tauceti-explorer/blob/43d1333d8377cdfa82317a22d2a67ec03b9fdab6/research/blueprint/reviews/REV-AlgebraicModuliForArithmeticGeometry--R09.4.md)
requires synchronization of the corrected packet with its definitive reader
before acceptance. The report explicitly leaves relative duality and
finite-flat torsion proof inputs recorded as gaps; it does not reject the
packet merely for those honest gaps.

The current
[AlgebraicModuli package](https://github.com/CBirkbeck/tauceti-explorer/blob/43d1333d8377cdfa82317a22d2a67ec03b9fdab6/research/blueprint/packages/AlgebraicModuliForArithmeticGeometry/README.md)
has no target for the normalized abelian Poincaré bundle or biduality.
Neither its README nor Suggested.lean contains the three `arith-*` target
identifiers above. Its scope instead sends arithmetic abelian moduli to
AbelianSchemesAndArithmeticModuli; its package handoff describes the earlier
A0-extension packet as its input. Thus the presence of an AlgebraicModuli
package is not evidence that these later arithmetic contracts have been
packaged. The existing relative Picard sheaf targets there do not by
themselves give dual abelian-scheme representability and biduality.

Before resuming, reconcile the final owner and accepted supplying package of
each of these three contracts. In particular, carry the actual statements
and native interfaces into the chosen supplying package and update its
consumers consistently. This job cannot change the arithmetic packet, its
reader, the abelian-scheme packet or either supplier package. This is a
dependency check for packaging, not a new independent review of those plans.

### Fine-level ordering

The accepted curve-moduli packet's review is
`independent-review-REV-DESIGN-StableReductionPartII~2`, 2026-10-10.
Freshly read prerequisite lists give this exact sequence:

**JC1 relative Jacobian, base change and principal polarization → MC.4 full
level → MC.4 fine-level scheme → JC7 universal-level Jacobian.**

The fine-level scheme is the fixed symplectic component over
Z[1/N, ζ_N], for g≥2 and N≥3, with its universal smooth projective curve.
The MC.4 nodes explicitly consume JC1, and JC7 explicitly consumes both MC.4
nodes. The two packages therefore need a coupled bundle with this internal
order. Reciprocal dependencies between whole packages would create a cycle;
MC.4 must not become an input to the generic JC0–JC5 construction.

The current queue still has neither `PKG-AbelianSchemesAndArithmeticModuli`
nor `PKG-StableReductionPartII`. `PKG-JacobianChallengePartII` has `after: []`.
Neither `focus.json` nor `upstream/CaraianiNewton.md` names
`StableReductionPartII`; the upstream order document still reports the parent
abelian-scheme package as absent. These scheduling files and supplier outputs
are outside this issue's authorized paths.

The read-only upstream checkout is
`070dc2becd74419e76303ede84b465ed4a69461f`; the current Tau Ceti checkout is
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. This run read the full upstream
JacobianChallenge and AlgebraicVectorBundles READMEs, the reviewed A1–A3
library-audit entries, the relevant upstream Suggested.lean interfaces, and
the actual current `AbelianVariety` and `rigidifiedPicardFunctor` declarations.
The `AbelianVariety` carrier was also read with `git show` at the Tau Ceti
pin `f790474821cf4256814db967cb154e7af3d0c369`. It has a field base
`Spec K`. `rigidifiedPicardFunctor` requires a chosen section and constructs
a functor; it does not supply section-free Picard representability. The
field/pointed Jacobian and general tensor/dual/determinant ownership boundaries
remain intact. No Lake command ran in either read-only checkout.

The cleared-library index was read. BLR and MFK are not cleared, and this run
obtained no copy of either. No new primary-source verification or geometric
proof is claimed. Earlier source receipts and mathematical work remain
attributed to their workers in the
[predecessor handoff at the immutable base](https://github.com/CBirkbeck/tauceti-explorer/blob/43d1333d8377cdfa82317a22d2a67ec03b9fdab6/research/blueprint/handoff/PKG-JacobianChallengePartII.md).

## Validation

- `lean-check research/blueprint/packages/JacobianChallengePartII/Suggested.lean`:
  **exit 0; 78 warnings, all `declaration uses sorry`; zero errors and zero
  other warnings.** Available memory was 97 GiB before checking. The shared
  wrapper designates Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and
  Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Mathlib HEAD was independently
  checked. The shared Tau Ceti build directory has no Git metadata, so this
  run records the wrapper's designation rather than claiming an independent
  Git authentication of that build tree. No compile or language server is
  left running.
- `python3 scripts/check_blueprint.py research/blueprint/packets/JacobianChallengePartII.json`:
  **0 errors, 0 warnings**; 48 nodes, 60 API items, 52 tests, 24 planets,
  11 baseline declarations, 14 gaps and 13 requests. All eight layers are
  planned; none is closed. Existing acceptance remains
  `independent-review-REV-DESIGN-JacobianChallengePartII`, 2026-10-05.
- The inherited README is 100,860 bytes; Suggested.lean is 30,594 bytes.
  Its closing omission list and the predecessor's correspondence still leave
  42 geometric targets without their native signatures, plus the geometric
  identifications of the §2.6 and §5.2–§5.4 companions and supplier input in
  §5.6. Elaboration of the available signatures does not discharge these.
- `git diff --check` and
  `python3 research/blueprint/intake.py check-files research/blueprint/handoff/PKG-JacobianChallengePartII.md`
  are run on the handoff before submission; their results are reported in the PR.

**Metadata remains absent.** Fresh inspection of
`research/blueprint/issues.py:deliverables_complete` shows that a package is
classified complete when all its outputs exist; it does not inspect a blocked
handoff. Adding `topic = "math.AG"` now would misclassify this checkpoint.
Add it when the supplier and prototype requirements have been met.

## Required action and resumption

[WORKERS.md, Upstream tiers](../WORKERS.md#upstream-tiers) requires package
citations to use “the other roadmaps of its bundle and the layers of
lower-tier packages”. The issue says “Change no packet; if the plan has a
mistake, describe it in the handoff note” and authorizes only this package
and handoff. Completion currently requires supplier and scheduling work
outside that scope; this is why the run submits a checkpoint.

Before another continuation, arrange both missing supplier packages and the
coupled bundle, reconcile the arithmetic supplier references above, and gate
this package job on those inputs. The maintainer should keep #7593 unavailable
until those gates are met; workers must not change its labels themselves.
Reconcile the final identifiers and contracts with the README's *Needs* paragraphs. Verify
the combined supplier graph with the JC1 → MC.4 → JC7 order. Then retain all
48 prose targets, express the remaining geometric definitions/API/tests against
their native supplying interfaces, and rerun Lean and submission checks.
Unavailable conditions must not become arbitrary `Prop` fields, empty
predicates or assumed geometric conclusions. Add metadata only at completion.

The inherited proof obligations remain: representability and properness;
polarization descent on nonreduced bases; relative Abel immersion; normalized
Poincaré signs/seesaw; arbitrary-degree-one theta pullbacks and curve-square
calculation; nonsymmetric cube recurrence; actual Picard algebraic equivalence
and relative autoduality; bi-Picard lifts preserving both conditions;
axis-normalized square comparison; and stable rank-g duality before determinants.
The predecessor handoff linked above records exact source locators, proof
receipts, unresolved auxiliary readings and native companion signatures.

## Retained target correspondence

| Package target | Accepted node suffix | Kind |
| --- | --- | --- |
| §0.1 | `degree-locally-constant` | lemma |
| §0.2 | `relative-degree-components` | definition |
| §0.3 | `picard-representability` | theorem |
| §0.4 | `picard-torsors` | construction |
| §1.1 | `jacobian-proper` | lemma |
| §1.2 | `relative-jacobian` | construction |
| §1.3 | `jacobian-base-change` | comparison |
| §1.4 | `principal-polarization` | construction |
| §2.1 | `section-free-abel-map` | construction |
| §2.2 | `degree-abel-map` | construction |
| §2.3 | `pointed-factorization` | lemma |
| §2.4 | `degree-one-closed-immersion` | theorem |
| §2.5 | `nonzero-degree-finite` | theorem |
| §2.6 | `curve-difference` | construction |
| §2.7 | `diagonal-base-change` | comparison |
| §3.1 | `jacobian-poincare` | construction |
| §3.2 | `degree-one-theta` | construction |
| §3.3 | `twice-theta` | construction |
| §3.4 | `theta-inverse-pullback` | theorem |
| §3.5 | `theta-pullback` | theorem |
| §3.6 | `poincare-addition-identity` | theorem |
| §3.7 | `poincare-curve-square` | theorem |
| §3.8 | `theta-doubling-formula` | lemma |
| §3.9 | `poincare-diagonal` | theorem |
| §3.10 | `geometric-twice-theta` | lemma |
| §3.11 | `twice-theta-symmetric` | lemma |
| §3.12 | `twice-theta-zero-rigidified` | lemma |
| §3.13 | `twice-theta-relatively-ample` | theorem |
| §4.1 | `actual-picard-zero` | definition |
| §4.2 | `actual-picard-bizero` | definition |
| §4.3 | `relative-autoduality-pullback` | comparison |
| §4.4 | `actual-to-relative-obstruction` | lemma |
| §4.5 | `actual-pullback-torsion-cokernel` | theorem |
| §4.6 | `bizero-lift-one-factor` | lemma |
| §4.7 | `bizero-pullback-torsion-cokernel` | theorem |
| §4.8 | `axis-normalized-picard` | definition |
| §4.9 | `pointed-square-picard-isomorphism` | comparison |
| §5.1 | `canonical-abel-map` | lemma |
| §5.2 | `universal-shift` | construction |
| §5.3 | `faltings-zhang` | construction |
| §5.4 | `shifted-faltings-zhang` | construction |
| §5.5 | `triangular-coordinate-equivalence` | construction |
| §5.6 | `shifted-power-factorization` | comparison |
| §6.1 | `picard-lie-cohomology` | comparison |
| §6.2 | `curve-jacobian-hodge-bundles` | comparison |
| §6.3 | `hodge-line-isomorphism` | comparison |
| §7.1 | `universal-level-jacobian` | application |
| §7.2 | `universal-faltings-zhang` | application |
