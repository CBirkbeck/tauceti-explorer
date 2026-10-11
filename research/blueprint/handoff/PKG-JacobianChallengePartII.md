# PKG-JacobianChallengePartII — supplier and scheduling checkpoint

Refs #7593. Codex (GPT-6), session `codex-SILxkg`, 11 October 2026.
Branch: `codex-SILxkg-jacobian-package`.
The bot [confirmed this claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7593#issuecomment-6105147526)
for claim comment `6105146576`. This is the only claim in this run; no second
job is taken.

**Blocked checkpoint.** The inherited README and suggested signatures are
preserved. This continuation freshly verifies the external supplier and
scheduling gates and reruns validation. It adds no geometric declaration and
makes no completion or upstream-readiness claim. The required fixes are outside
this job's four authorized paths.

## Current evidence and the exact gates

The clone and the remotely checked atlas main are
`763d46d25cf18f42a878f7e8b6e242ab2b575f83`. The remote TauCetiRoadmap main is
`4b002f622e9d68b627bdce9f6224897305a68bdc`.
Fresh GitHub directory listings pinned to those commits contain 75 atlas
package entries and 50 upstream roadmap entries. Neither listing contains
`AbelianSchemesAndArithmeticModuli` or `StableReductionPartII`.
`AbelianSchemesAndArithmeticModuliPartII` exists among the atlas packages, but
its extension does not replace the required parent owner.

The local accepted suppliers were read at the same atlas commit:

| Required supplier | Accepted contract and consumer | Gate to resolve outside this job |
| --- | --- | --- |
| `AbelianSchemesAndArithmeticModuli:A1–A3` | The parent packet was accepted by `independent-review-REV-AbelianSchemesAndArithmeticModuli` on 2026-10-09. A1 supplies arbitrary-base rigidity and cube/power comparisons; A2 supplies double-normalized Poincaré and biduality; A3 supplies finite locally free multiplication by nonzero integers, including inseparable cases. The corresponding basic carriers imported from `AlgebraicModuliForArithmeticGeometry:R09.4` do not replace these additional parent targets. | Provide the parent roadmap package with these exact layer contracts as the lower-tier supplier. This job cannot re-plan its parent's mathematics. |
| `StableReductionPartII:MC.4/full-level` and `fine-level-scheme` | The supplier packet was accepted by `independent-review-REV-DESIGN-StableReductionPartII~2` on 2026-10-10. `full-level` explicitly imports JC1's relative Jacobian, base change and principal polarization; `fine-level-scheme` imports `full-level` and supplies the smooth quasi-projective scheme and universal smooth projective curve over the fixed symplectic component Z[1/N, ζ_N], g≥2, N≥3. JC7 consumes this scheme. | Provide the separate curve-moduli package and declare a coupled bundle for joint upstream submission. Its reference back to JC1 rules out treating the entire supplier package as an independently lower-tier prerequisite. |

The exact dependency sequence is **JC1 → MC.4 full level → MC.4 fine-level
scheme → JC7**. The generic JC0–JC5 construction remains independent of MC.4.
Do not create reciprocal whole-package `after` dependencies: use the coupled
bundle while preserving the internal mathematical order.

The queue still gives `PKG-JacobianChallengePartII` `after: []` and contains no
exact `PKG-AbelianSchemesAndArithmeticModuli` or `PKG-StableReductionPartII`
job. `focus.json` and `upstream/CaraianiNewton.md` do not declare this coupled
bundle. The upstream order document explicitly reports the parent package as
not yet present. This explains why a continuation is selectable despite the
same external gates recorded by earlier checkpoints.

**Maintainer scheduling action:** arrange the missing supplier package jobs and
the bundle, and gate further package continuations on those inputs. Simply
releasing this job again cannot supply its missing owners. No labels, queue
entries, supplier files or bundle schedule were changed by this worker.

[WORKERS.md, Upstream tiers](../WORKERS.md#upstream-tiers) says:
“A package (PROTOCOL.md section 20) cites, for each target, only Mathlib, Tau
Ceti, its own layers, the other roadmaps of its bundle and the layers of
lower-tier packages.” It also requires dependencies to go upstream first or
together in their bundle. The issue authorizes only this package and handoff
and says: “Change no packet; if the plan has a mistake, describe it in the
handoff note.” These are the binding reasons a complete package cannot be
submitted within this job's scope. The blocked checkpoint follows
[WORKERS.md, Claiming](../WORKERS.md#claiming).

## Validation in this continuation

- `lean-check research/blueprint/packages/JacobianChallengePartII/Suggested.lean`
  completed with **exit 0, 78 warnings, all `declaration uses sorry`, zero
  errors and zero other warnings**. `free -g` showed 100 GiB available before
  the check. The designated shared build uses Mathlib
  `082e2d37e8b0463410cdb532e111cd43d5a66174` and the worker wrapper's Tau Ceti
  pin `f790474821cf4256814db967cb154e7af3d0c369`. Mathlib HEAD was checked;
  the build's Tau Ceti source directory has no Git metadata, so this run does
  not claim a new independent Git authentication of that tree. No build or
  language server was started and no process was left running.
- `python3 scripts/check_blueprint.py research/blueprint/packets/JacobianChallengePartII.json`
  completed with **0 errors and 0 warnings**: 48 nodes, 60 API items,
  52 tests, 24 planets, 11 baseline declarations, 14 gaps and 13 requests.
  All eight layers are planned, none closed. Its existing acceptance is
  `independent-review-REV-DESIGN-JacobianChallengePartII`, 2026-10-05.
- The README remains 100,860 bytes; the suggested file remains 30,594 bytes.
  The inherited file has 84 executable declarations (10 definitions,
  41 theorem signatures and 33 examples). Successful signature elaboration
  does not discharge the geometric proof and interface obligations below.
- `git diff --check` and `python3 research/blueprint/intake.py check-files`
  on this handoff pass. Only this authorized handoff is changed.

**Metadata remains absent.** The fresh reading of
`research/blueprint/issues.py:deliverables_complete` confirms that, for a
package, existence of every output is enough to report completion. It does
not read the blocked handoff. Adding the otherwise straightforward
`topic = "math.AG"` now would therefore misclassify this checkpoint as a
complete package. Add it only when the supplier and package conditions hold.

## Current-library and ownership check

The read-only roadmap checkout is
`070dc2becd74419e76303ede84b465ed4a69461f`, and its current Tau Ceti dependency
is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. This run read the complete
JacobianChallenge and AlgebraicVectorBundles READMEs, the reviewed parent
A1–A3 audit entries, and the current declarations of `AbelianVariety` and
`rigidifiedPicardFunctor`. No Lake command was run in those checkouts.

`AbelianVariety K` still has a field base `Spec K`; it does not supply the
arbitrary-base abelian-scheme contract. `rigidifiedPicardFunctor` explicitly
requires a chosen section and constructs a functor, not the section-free
Picard representability theorem. Field and pointed Jacobians remain owned by
JacobianChallenge; general finite locally free duals and determinants remain
owned by AlgebraicVectorBundles L0A–L0C. No new local stand-in was introduced
for these owners. The README's current-library actual line-bundle class group
and its distinction from the older compile pin are retained.

The cleared-library index was read. BLR and MFK are not cleared and were
neither obtained nor read. No primary-paper verification or finite-coordinate
calculation is claimed as new in this continuation. Their inherited receipts,
including the Yuan v4 source hash and the prior 516 inverse-composite checks,
are available in the [predecessor handoff at this run's immutable base](https://github.com/CBirkbeck/tauceti-explorer/blob/763d46d25cf18f42a878f7e8b6e242ab2b575f83/research/blueprint/handoff/PKG-JacobianChallengePartII.md).
No source passage or private filesystem path is copied into the deliverables.

## Where to resume

Resume after the parent package, the fine-level supplier package and the
coupled bundle are supplied. Reconcile their final layer identifiers and
contracts with every *Needs* paragraph. Verify the combined supplier graph
for cycles using the JC1 → MC.4 → JC7 order. Resolve any change to the accepted
mathematics through its owner; this job is not authorized to edit its packet.
Retain all 48 prose targets and their discriminating tests, reconcile native
interfaces with the pinned libraries, and rerun Lean, packet and submission
checks. Add metadata only when honest package completion is possible.

The retained native signatures cover the pointed difference companion (§2.6),
shifted maps and factorization companions (§5.2–§5.6). The remaining geometric
targets stay in the README and the suggested file's closing comment. Such
comments do not count as elaborated geometric declarations or unit tests.
Unavailable conditions must never become arbitrary `Prop` fields, empty
predicates or assumed geometric conclusions.

### Inherited proof/interface obligations

| Inherited gap | Affected targets |
| --- | --- |
| Algebraic equivalence of geometric-fibre actual line classes | §4.1, §4.2, §4.8, §3.10 |
| Fine-level supplier assembly | §7.1, §7.2 |
| Relative Picard representability proof inputs | §0.3 |
| Relative properness and canonical polarization descent | §1.1, §1.4 |
| Relative pointed Abel immersion bridge | §2.4 |
| Poincaré sign and normalized seesaw | §3.1, §3.6, §3.11 |
| Translated theta pullback calculation | §3.4, §3.5 |
| Arbitrary-alpha curve-square computation | §3.7 |
| Nonsymmetric cube recurrence in theta doubling | §3.8 |
| Relative autoduality over nonreduced bases | §4.3, §4.5 |
| Bi-Picard lifts preserving the other projection condition | §4.6, §4.7 |
| Axis-normalized square comparison proof | §4.9 |
| Stable relative duality and determinant API | §6.1, §6.2, §6.3 |
| Native geometric prototypes absent at the pin | 42 omitted targets; identifications in §2.6, §5.2–§5.4 and supplier theorem in §5.6 |

The inherited representability/properness inputs include BLR 8.2/1, 8.2/5,
8.4/2–3, 9.2/13, 9.3/5 and MFK 6.9. The pointed relative immersion requires
proof and descent. Relative autoduality must be an identity on all test schemes,
including nonreduced bases. The axis-normalized comparison needs the auxiliary
Zhang argument or the full currying/Albanese/seesaw proof. Layer 6 needs its
specified rank-g comparison before taking a determinant.

Earlier pointed-difference proof receipts use `GrpObj.comp_div` and binary
product laws. The cocycle uses `div_mul_div_cancel'` on (a(y),a(x),a(z));
translation uses `toUnit_unique` and `mul_div_mul_left_eq_div`. The base-change
proof uses the pulled-back group object, its Hom monoid homomorphism and
`map_div`, then product comparisons. These are inherited proof receipts,
not an implementation claim.

### Target correspondence

The native §5.5 interface is present. §2.6, §5.2–§5.4 and §5.6 have native
companions taking their earlier geometric inputs explicitly. The other 42
geometric targets remain in the README and the short closing comment. Comments
are not counted as elaborated geometric declarations or tests.

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
