# PKG-JacobianChallengePartII — blocked package checkpoint

Refs #7593. Worker: Codex (GPT-6), session `codex-u1FdEf`,
10 October 2026. Branch: `codex-u1FdEf-jacobian-package`.
The bot confirmed [claim comment 6100808589](https://github.com/CBirkbeck/tauceti-explorer/issues/7593#issuecomment-6100808589)
in [comment 6100810020](https://github.com/CBirkbeck/tauceti-explorer/issues/7593#issuecomment-6100810020).
This is the only job claimed in this run. No issue on the manager's priority
list was available; this package was the first eligible fallback kind.

## Result and blocking dependencies

**Checkpoint: two required supplier packages remain absent.** This run changes
only this handoff, updating the supplier revision state and content receipts,
rechecking the two-packet internal dependency graph, and retaining the source
limits, proof worklist and target correspondence. The mathematical
README and Suggested.lean are unchanged. No source proof or omitted geometric
signature is newly certified.

Fresh checks of the local package directories, GitHub's default-branch package
listing, the supplier packets and their issue states establish:

| Required supplier | Current state | What must precede completion |
| --- | --- | --- |
| `AbelianSchemesAndArithmeticModuli:A1–A3` | The 89-node parent plan is independently accepted, dated 2026-10-09. No parent package exists locally or on GitHub main. | Package the parent's arbitrary-base abelian schemes and rigidity (A1), dual/Poincaré/polarization interfaces (A2), and nonzero finite locally free multiplication (A3). Then match the actual packaged contracts to JC1–JC5 and JC7. |
| `StableReductionPartII:MC.4/full-level` and `fine-level-scheme` | The 528-node plan has verdict `needs_changes`, dated 2026-10-05, and no package. Revision [#6378](https://github.com/CBirkbeck/tauceti-explorer/issues/6378) is now submitted; its review [#6395](https://github.com/CBirkbeck/tauceti-explorer/issues/6395) is now claimed. The packet still carries the earlier `needs_changes` verdict pending that review. | Reconcile the reader with the corrected packet, obtain independent acceptance, and package the fixed symplectic component and its universal smooth curve. |

WORKERS.md, **Upstream tiers**, says:

> A package (PROTOCOL.md section 20) cites, for each target, only Mathlib, Tau
> Ceti, its own layers, the other roadmaps of its bundle and the layers of
> lower-tier packages.

Neither missing supplier is an existing Tau Ceti roadmap or library interface.
This issue allows edits only to this package and its handoff, so constructing
or repairing a supplier is outside its deliverables. The accepted plan's
cross-roadmap statements cannot be treated as already packaged inputs.

The queue entry for `PKG-JacobianChallengePartII` currently has `after: []`.
The maintainer should gate #7593 on the supplier prerequisites above to prevent
another unchanged blocking continuation. This worker has changed no queue,
issue label or supplier file.

## Ownership and dependency boundaries

The existing `AbelianSchemesAndArithmeticModuliPartII` package is a consumer of
its parent, not a replacement: its introduction imports A1–A3 and excludes a
second abelian scheme, Picard functor, dual, polarization or quotient
construction. Its Betti branch also imports this roadmap's JC2 and JC7.
Substituting it for its parent would misstate ownership and create a cycle.

`AlgebraicModuliForArithmeticGeometry` and
`NeronModelsAndSemistableAbelianVarieties` have package directories locally and
on GitHub main. They do not supply the two missing contracts. The earlier
package assembly inspected R09's relative-Picard sheafification/base-change
contracts and R11.4's fibrewise semi-abelian Picard identity component. Toric
rank can jump; semi-abelian here does not mean a global constant-rank torus
extension.

JC7 retains the integral fixed symplectic component over Z[1/ℓ,ζ_ℓ], with
g≥2 and ℓ≥3 invertible, its smooth quasi-projective fine scheme, and its smooth
projective universal curve. DGH's characteristic-zero construction does not
replace this target. The actual MC.4/full-level node imports JC1's relative
Jacobian, arbitrary base change and principal polarization; its input here
must stay in JC7, never enter JC0–JC5. A fresh topological sort of the
explicit internal prerequisites of the current two plans visits all 576 nodes
(48 Jacobian and 528 stable-reduction nodes), with no cycle. This scoped check
does not verify external supplier closure or atlas integration. The revised
MC.4 statements still separate the homogeneous level functor from the fixed
symplectic component and still supply its integral smooth universal curve.

## Current upstream and library boundary checks

This continuation read the current upstream JacobianChallenge and
AlgebraicVectorBundles READMEs in full. Earlier assembly inspected their
Suggested.lean files and upstream StableReduction Layer 2 and its J-B/SR-2
contract; those latter inspections are inherited, not repeated here.
The upstream checkout is
`3c18d9fbfceed0dc5c1edb1070a3927152d19e28` and contains neither missing
supplier. Pointed field Jacobians stay with JacobianChallenge; JC6.2 and
JC6.3 import finite locally free duals and determinants from
AlgebraicVectorBundles L0B and L0C. Relative nodal Gorenstein duality,
coherent cohomology/base change and fibrewise relative ampleness stay with
StableReduction Layer 2. No existing upstream target is replanned.

Current Tau Ceti is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
Read `AbelianVariety/Basic.lean`: its `AbelianVariety K` structure takes
`[Field K]` and a group object over Spec K. It is not an arbitrary-base
abelian scheme. A search of its algebraic-geometry sources found no
`AbelianScheme`, `RelativePicard`, `PicardScheme`, `DualAbelian` or
`PoincareBundle` declaration. Consulted all six JacobianChallenge layer
entries of the reviewed `data/library-coverage.json` audit. These are
boundary checks, not a fresh complete library audit; the package cites no
new baseline declaration. Both upstream trees were used read-only, without
Lake.

## Saved deliverables and validation

- README is 80,142 bytes and contains all 48 accepted target statements in
  JC0–JC7, all 60 definition/construction API names, and all 52 test names.
  Its 4 definitions and 13 constructions each retain at least three tests.
  The corrected packet is authoritative: its independent review changed 19
  contracts without regenerating the older reader. Preserve its cohomological
  Brauer interpretation, negative self-Poincaré sign, arbitrary-alpha formulas,
  stable Hodge scope and arbitrary universal-curve pullbacks.
- Suggested.lean is 32,408 bytes, with one import block and standard module
  note. Its executable portion is JC5.5, the actual group-object Hom-valued
  triangular equivalence, five API lemmas and three examples. The other 47
  geometric targets are comment records retaining their names, contracts,
  APIs and tests. No geometric signature elaboration is claimed. Missing
  types must not be replaced by arbitrary predicates or replacement point sets.
- `python3 scripts/check_blueprint.py research/blueprint/packets/JacobianChallengePartII.json`:
  **0 errors, 0 warnings**; 48 nodes, 60 API items, 52 tests, 24 planets,
  14 gaps and 13 requests; all eight stages planned and none closed.
- Fresh exact-string correspondence against the packet found every target
  statement, API name and test name in README, and counted all 47 geometric
  comment records in Suggested.lean. This establishes correspondence, not
  source correctness or geometric typechecking.
- `lean-check research/blueprint/packages/JacobianChallengePartII/Suggested.lean`:
  **exit 0, no errors, nine warnings, all `declaration uses sorry`**.
  Available memory was 98 GB before this single check. The shared Mathlib
  pin was `082e2d37e8`; no Tau Ceti module is imported by this file. No language
  server, project, build, update or cache download was started.
- `metadata.toml` remains absent because this package is incomplete. Its
  eventual contents are exactly `topic = "math.AG"` and a newline. The intake
  completion check therefore treats this submission as a checkpoint.
- `python3 research/blueprint/intake.py check-files` on README,
  Suggested.lean and this handoff: **three files, zero problems**.
  `git diff --check` is clean; only this authorized handoff changes.

## Receipts

The two supplier packet Git blob ids match GitHub's default-branch content
listing: `84b26b1831f0e62fdceb7d84a771862c2e1bd63b` for the parent and
`e8429524de9692de5328036810b499140fb93c53` for StableReductionPartII.
The stable-reduction packet has changed since the preceding checkpoint;
its exact two MC.4 supplier statements and their Jacobian prerequisites were
read again. The abelian-scheme parent packet and both saved Jacobian package
files remain byte-for-byte identical to the preceding checkpoint.
Fresh SHA-256 receipts are:

| File | SHA-256 |
| --- | --- |
| `packets/JacobianChallengePartII.json` | `2da73e3c0831882d8ce8aafb9ac0d468cfefdf784ef8e25b5651a5347d37f275` |
| `packets/AbelianSchemesAndArithmeticModuli.json` | `768adc69448c575ea3b07e4631d532c5177bc7572d030e3e3420bd8d6f67b3ff` |
| `packets/StableReductionPartII.json` | `59451e50405d0079f6d3ad2f662a4914d8407a51f611d08fba1e2cc52a8ba1d8` |
| `packages/JacobianChallengePartII/README.md` | `ddfa5c7a605a616d4a507c23c3e1dd656b7345075038b01a5c0ef3e0ca3e3a78` |
| `packages/JacobianChallengePartII/Suggested.lean` | `ada2203aec5fef3d02a490986708a00641856b98c8338eb9c4b9cac3e03135e0` |

Paths in this table are relative to `research/blueprint/`.

## Inherited source receipts and limits

These are the earlier assembly's receipts and limits, not source reading
newly performed by this continuation. The accepted design review supplies
the source locators. The initial package assembly read DGH
arXiv:2001.10276v3 §6.1, pp.23–25, and its PDF hash agreed with the accepted
receipt. It inspected Milne's 12 June 2021 notes §8, Theorem 8.1 and family
discussion, pp.27–28. The exact 21 August 2024, 126-page Yuan manuscript URL
was unreachable in that run; its mathematical claims and page locators were
retained from the independent review. Annals 203 (2026), pp.15–119, has
different pagination and must be distinguished from that manuscript.

BLR is not in the maintainer's cleared private-library index. Neither the
initial assembler nor this continuation obtained or read another copy.
The accepted printed BLR locators remain bibliographic citations; no scan
link, copied page or source passage is added. Serre, MFK and Zhang auxiliary
proofs remain the source work below. Accepted target-level status does not
close those boundaries.

The initial assembly read all 11 recorded baseline statements at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Invertible sheaves, tensor
products, weighted divisor degree and abstract module-sheaf cohomology are
native objects. The recorded `LineBundleClass` has commutative-monoid
structure; `CommRing.Pic` concerns invertible semimodules rather than a
relative Picard scheme. The native Hom group and `GrpObj.comp_div` support
JC5.5. This continuation does not recertify that complete baseline audit.

Protocol §13 permits omission of a condition whose native types are absent;
it forbids empty `Prop` fields. The accepted design uses honest omission
records for 47 targets. The necessary next step is to use the supplying
geometric interfaces, rather than restate another owner's general theory
inside this package to manufacture typed names.

## Resume when the supplier boundary changes

1. Obtain the AbelianSchemesAndArithmeticModuli parent package and the
   reconciled, independently accepted and packaged StableReductionPartII
   MC.4 supplier. Match their actual layer contracts and signed conventions;
   keep MC.4 out of JC0–JC5.
2. Recheck current upstream/library ownership. Import generic Picard,
   abelian-scheme, actual line-class, invariant-differential, and finite locally
   free dual/determinant APIs from their owners.
3. Preserve all 48 targets and exact corrected hypotheses. Expand expressible
   geometric signatures, API lemmas and examples against actual supplier
   types. Keep any genuinely inexpressible omission explicit.
4. Repeat packet validation, target/API/test correspondence and `lean-check`;
   run the intake file check and diff whitespace check. Add metadata only when
   the package meets the full contract, and submit the complete continuation.

No subsequent worker needs this run's disposable scratch files. The source
proof worklist and target map follow.

The following inherited proof/interface gaps remain open. They remain the authoritative packet's worklist;
ordinary future implementation is distinct from the blocking supplier-package
boundary above.

| Inherited gap | Affected package targets |
| --- | --- |
| Algebraic equivalence of geometric-fibre line classes | JC4.1, JC4.2, JC4.8, JC3.10 |
| Fine-level supplier assembly | JC7.1, JC7.2 |
| Relative Picard representability proof inputs | JC0.3 |
| Relative properness and canonical polarization descent | JC1.1, JC1.4 |
| Relative pointed Abel immersion bridge | JC2.4 |
| Poincaré sign and normalized seesaw | JC3.1, JC3.6, JC3.11 |
| Translated theta pullback calculation | JC3.4, JC3.5 |
| Arbitrary-alpha curve-square computation | JC3.7 |
| Cube recurrence in the theta doubling formula | JC3.8 |
| Relative autoduality over nonreduced bases | JC4.3, JC4.5 |
| Bi-Picard lifting retains the other projection condition | JC4.6, JC4.7 |
| Axis-normalized square comparison proof | JC4.9 |
| Stable relative duality and determinant API | JC6.1, JC6.2, JC6.3 |
| Prototype interfaces absent at the pinned baseline | All targets except JC5.5 |

For the relative representability/properness chain retain BLR 8.2/1, 8.2/5,
8.4/2–3, 9.2/13, 9.3/5 and MFK 6.9 as exact proof inputs. The pointed
relative Abel immersion must be proved and descended. For the theta formulas
retain the arbitrary-degree-one-divisor calculations and the nonsymmetric
cube recurrence. Autoduality must be an all-test-scheme identity over
nonreduced bases; the bi-zero lifts must preserve the other projection's
algebraic-triviality condition. The actual axis-normalized square comparison
requires the Zhang auxiliary lemmas or a full currying/Albanese/seesaw proof.
The Hodge comparison requires the specified rank-g map before taking its
determinant. Do not substitute geometric-point tests for any of these proofs.

## Target correspondence

The numbering follows prerequisite order inside each layer: local degree
constancy precedes the degree components; properness precedes the abelian-scheme
conclusion. No target is dropped. The native item is JC5.5; all other items
have an honest geometric interface record in Suggested.lean.

| Package target | Accepted node suffix | Kind |
| --- | --- | --- |
| JC0.1 | `degree-locally-constant` | lemma |
| JC0.2 | `relative-degree-components` | definition |
| JC0.3 | `picard-representability` | theorem |
| JC0.4 | `picard-torsors` | construction |
| JC1.1 | `jacobian-proper` | lemma |
| JC1.2 | `relative-jacobian` | construction |
| JC1.3 | `jacobian-base-change` | comparison |
| JC1.4 | `principal-polarization` | construction |
| JC2.1 | `section-free-abel-map` | construction |
| JC2.2 | `degree-abel-map` | construction |
| JC2.3 | `pointed-factorization` | lemma |
| JC2.4 | `degree-one-closed-immersion` | theorem |
| JC2.5 | `nonzero-degree-finite` | theorem |
| JC2.6 | `curve-difference` | construction |
| JC2.7 | `diagonal-base-change` | comparison |
| JC3.1 | `jacobian-poincare` | construction |
| JC3.2 | `degree-one-theta` | construction |
| JC3.3 | `twice-theta` | construction |
| JC3.4 | `theta-inverse-pullback` | theorem |
| JC3.5 | `theta-pullback` | theorem |
| JC3.6 | `poincare-addition-identity` | theorem |
| JC3.7 | `poincare-curve-square` | theorem |
| JC3.8 | `theta-doubling-formula` | lemma |
| JC3.9 | `poincare-diagonal` | theorem |
| JC3.10 | `geometric-twice-theta` | lemma |
| JC3.11 | `twice-theta-symmetric` | lemma |
| JC3.12 | `twice-theta-zero-rigidified` | lemma |
| JC3.13 | `twice-theta-relatively-ample` | theorem |
| JC4.1 | `actual-picard-zero` | definition |
| JC4.2 | `actual-picard-bizero` | definition |
| JC4.3 | `relative-autoduality-pullback` | comparison |
| JC4.4 | `actual-to-relative-obstruction` | lemma |
| JC4.5 | `actual-pullback-torsion-cokernel` | theorem |
| JC4.6 | `bizero-lift-one-factor` | lemma |
| JC4.7 | `bizero-pullback-torsion-cokernel` | theorem |
| JC4.8 | `axis-normalized-picard` | definition |
| JC4.9 | `pointed-square-picard-isomorphism` | comparison |
| JC5.1 | `canonical-abel-map` | lemma |
| JC5.2 | `universal-shift` | construction |
| JC5.3 | `faltings-zhang` | construction |
| JC5.4 | `shifted-faltings-zhang` | construction |
| JC5.5 | `triangular-coordinate-equivalence` | construction |
| JC5.6 | `shifted-power-factorization` | comparison |
| JC6.1 | `picard-lie-cohomology` | comparison |
| JC6.2 | `curve-jacobian-hodge-bundles` | comparison |
| JC6.3 | `hodge-line-isomorphism` | comparison |
| JC7.1 | `universal-level-jacobian` | application |
| JC7.2 | `universal-faltings-zhang` | application |

Input SHA-256: `2da73e3c0831882d8ce8aafb9ac0d468cfefdf784ef8e25b5651a5347d37f275`.
