# PKG-JacobianChallengePartII — supplier gate remains blocked

Refs #7593. Worker: Codex (GPT-6), session `codex-3btIYC`,
10 October 2026. Branch: `codex-3btIYC-jacobian-package`.
The [claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7593#issuecomment-6103118962)
was [confirmed by the bot](https://github.com/CBirkbeck/tauceti-explorer/issues/7593#issuecomment-6103119935).
None of the manager's priority issues was available when jobs were selected.
The permitted fallback order selected a package; only this issue was claimed.

**Blocked checkpoint.** Only this handoff changes. The README and Suggested.lean
are preserved, and metadata remains absent. This run freshly checked the
supplier gate, current-library candidates and the combined dependency graph.
The implementation and source-reading receipts below are inherited from the
previous worker; they are retained so a continuation can reproduce that work.
This checkpoint does not claim a new mathematical review of every target.

## Concrete gate for the maintainer

At atlas main `2f72a720f2267c51753f5c38d9fb5954b407a424`, both required
supplier package directories are absent. This was checked against the complete
[package directory listing](https://github.com/CBirkbeck/tauceti-explorer/tree/2f72a720f2267c51753f5c38d9fb5954b407a424/research/blueprint/packages),
as well as the local clone. The current upstream directory listing also has
neither supplier nor JacobianChallengePartII.

| Required input | Freshly inspected contract | Action needed before package completion |
| --- | --- | --- |
| `AbelianSchemesAndArithmeticModuli:A1–A3` | The 89-node parent plan is accepted by `independent-review-REV-AbelianSchemesAndArithmeticModuli`, dated 2026-10-09. A1–A3 are planned. A2's `normalized-poincare-comparison` retains both axis trivializations, biduality and arbitrary base change; A3's `multiplication-and-density` retains finite local freeness for every nonzero integer, including inseparable multiplication. | Queue and supply the parent package, then place it before the Jacobian/curve-moduli bundle. The existing Part II package explicitly imports these parent objects and does not replace it. |
| `StableReductionPartII:MC.4/full-level` and `fine-level-scheme` | The 528-node plan is accepted by `independent-review-REV-DESIGN-StableReductionPartII~2`. `full-level` directly imports JC1's Jacobian, base change and principal polarization. `fine-level-scheme` supplies the universal smooth genus-g curve on the fixed symplectic component over Z[1/N,ζ_N]. | Declare a coupled bundle with JacobianChallengePartII and supply both package directories together. Retain the fixed component and the prime-to-level hypotheses. |

The local queue has `PKG-JacobianChallengePartII` with `after: []`; it has
neither `PKG-AbelianSchemesAndArithmeticModuli` nor `PKG-StableReductionPartII`.
The [focus file](../focus.json) and [upstream order](../upstream/CaraianiNewton.md)
do not declare the Jacobian/StableReductionPartII pair as a bundle.

The necessary order is:

1. Supply the parent abelian-scheme package and reconcile its supplier contracts.
2. Declare the JacobianChallengePartII–StableReductionPartII bundle, with
   separate package directories and joint upstream submission.
3. Resume this package against those exact contracts; keep MC.4 confined to JC7.

Do not add mutual whole-package `after` edges: MC.4 uses JC1, and JC7 uses MC.4.
A fresh topological sort of the two plans visited all **576 nodes and 1,313
explicit internal node edges** without a cycle. The return dependencies also
include JC6 → MC.6 and JC0/JC4/JC6 → MC.7. This check omits external supplier
closure and stage-reference expansion; it does not certify the whole atlas.

[WORKERS.md, Upstream tiers](../WORKERS.md#upstream-tiers) limits package
citations to existing libraries, own layers, bundle partners and lower-tier
packages. Issue #7593 permits only the Jacobian package files and this handoff,
and explicitly directs plan corrections to the handoff. Creating either
supplier package, changing the scheduling files or moving their targets here
would exceed that scope. The blocked-checkpoint rule therefore applies.
Suppress package eligibility until this gate changes; another package-only
continuation cannot settle it. No queue, label, packet or other roadmap changed.

## Current-library candidate check

The read-only roadmaps remain at
`070dc2becd74419e76303ede84b465ed4a69461f`, and current Tau Ceti remains at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
JacobianChallenge and AlgebraicVectorBundles READMEs were freshly read in full.
Their source trees and suggested files were searched for the missing suppliers.
Pointed field Jacobians remain with JacobianChallenge; general duals and
determinants remain with AlgebraicVectorBundles L0B–L0C.

There is a useful current-library interface that a continuation should reuse:
[rigidifiedPicardFunctor](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/AlgebraicGeometry/PicardFunctor/Rigidified.lean#L66).
Its statement takes a morphism f:X→S, a specified section x₀:S→X and the section
identity. Its values are classes of bundles rigidified along the base-changed
section. The module supplies pullback functoriality; it does not establish its
comparison with the section-free fppf Picard quotient or representability.
[rigidifiedPicardPoint](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/AlgebraicGeometry/PicardFunctor/Point.lean#L40)
gives the trivial rigidified class and its pullback law. Both files were read.
The Rigidified module is absent at the atlas pin `f790474`; it cannot be imported
into the present pinned Lean check. This distinction corrects any reading of
the older handoff as claiming that current Tau Ceti has no pointed Picard functor.

The current
[AbelianVariety declaration](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean#L95)
still requires a field K and an object over Spec K. Its proper geometrically
integral group-scheme data do not supply arbitrary-base abelian schemes,
relative duals or the represented section-free curve Picard scheme. Neither
candidate removes the supplier gate, and no second generic theory was planned.
No Lake command was run in either read-only checkout.

## Fresh checks and preserved work

- `python3 scripts/check_blueprint.py research/blueprint/packets/JacobianChallengePartII.json`:
  exit 0; zero errors and warnings. The unchanged plan retains 48 nodes,
  60 API items, 52 tests, 24 planets, 14 gaps and 13 requests; all eight stages
  are planned and none closed.
- Exact correspondence finds all 48 target statements, all 60 API names and
  all 52 test names in README. Suggested.lean retains **42 geometric omission
  records and five geometric identification records**, plus the native JC5.5
  interface. Comment records are not elaborated geometric signatures.
- `lean-check research/blueprint/packages/JacobianChallengePartII/Suggested.lean`:
  exit 0; **76 warnings, all declaration uses sorry; no errors or other warnings**.
  Available memory was 94 GiB before the single check. The shared helper
  documents Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`; the Mathlib
  source commit was independently read as
  `082e2d37e8b0463410cdb532e111cd43d5a66174`.
  No language server, library build, update or cache download was started;
  the check has finished.
- README remains 92,897 bytes and Suggested.lean 57,243 bytes. Their hashes
  and the three plan hashes agree with the receipt table retained below.
  The successful check certifies the existing native portion, not the omitted
  geometric mathematics or prerequisite closure.
- Swarm file validation reports one allowed file and zero problems;
  `git diff --check` passes. Only this handoff is submitted.

No new paper statement or source issue is asserted in this continuation.
The cleared-source index was read; no book or source passage was copied.
The inherited resumption list and proof directions below remain necessary
after scheduling changes. Add `topic = "math.AG"` only with a complete package.

## Inherited checkpoint from session codex-Mmjb3H

Everything below records that earlier session's work and verification, not
additional work performed by session `codex-3btIYC`.

Refs #7593. Worker: Codex (GPT-6), session `codex-Mmjb3H`,
10 October 2026. Branch: `codex-Mmjb3H-jacobian-package`.
The bot confirmed [claim comment 6102713790](https://github.com/CBirkbeck/tauceti-explorer/issues/7593#issuecomment-6102713790)
in [comment 6102715155](https://github.com/CBirkbeck/tauceti-explorer/issues/7593#issuecomment-6102715155).
Only this job was claimed. None of the manager-priority issues was available;
WORKERS.md's eligible fallback order selected this package. This continuation
builds on the checkpoint from session `codex-7IZkJR`.

## Result and remaining boundary

**Blocked checkpoint with a native pointed-difference companion for JC2.6.**
The helper `RelativeJacobian.CurveDifference.pointedMap` is the actual
scheme morphism p₂;a / p₁;a built from an earlier degree-one Abel morphism
as typed input. The seven companion lemma signatures state evaluation,
diagonal vanishing, swap/inverse, the additive-order cocycle, invariance
under translation by a base section, naturality in the test scheme, and
arbitrary base change with the canonical binary-product comparison.
Four examples test equal inputs, both signs of the identity Abel map,
triangle cancellation and translation invariance.

The cocycle and base-section translation assume commutativity; the other
signatures require only a group object. Every point is a morphism from an
arbitrary test scheme, so these statements retain nilpotent test bases.
The formulas use Mathlib's native Hom group operations. They do not construct
a second generic Picard, torsor or abelian-scheme theory. The helper must be
identified with the geometric section-free difference after a degree-one
normalization. The nontrivial genus-one torsor test remains a geometric
obligation; no chosen Abel morphism is manufactured for such a torsor.

All seven identities and all four new tests were independently elaborated
with actual proofs in disposable scratch. The roadmap signatures use `sorry`
as PROTOCOL §13 requires. This validates the coordinate companion, not the
canonical Picard identification or the missing suppliers. The existing
native JC5.2–JC5.6 interfaces remain unchanged.

All 48 target statements, 60 original API names and 52 original test names
remain in the README; all 17 definition/construction targets retain at least
three tests. The corrected packet, rather than the older reader document,
governs those targets. Suggested.lean now has 42 targets represented solely
by geometric omission records, five partial geometric-identification records
(JC2.6, JC5.2–JC5.4, JC5.6), and the native generic JC5.5 coordinate interface.
`metadata.toml` remains absent. This is not a completed package.

## Freshly verified external blockers

Freshly read the complete package-directory list on GitHub main and checked
local package paths on 10 October 2026. The following required packages are
still absent. Accepted target-level plans do not replace packaged supplier
contracts or express the missing native geometric types.

| Required supplier | Evidence | Completion requirement |
| --- | --- | --- |
| `AbelianSchemesAndArithmeticModuli:A1–A3` | The 89-node parent plan is accepted, 2026-10-09, by `independent-review-REV-AbelianSchemesAndArithmeticModuli`; its parent package directory is absent. | Package arbitrary-base abelian schemes and rigidity, the dual/Poincaré/polarization interface, and nonzero finite locally free multiplication. |
| `StableReductionPartII:MC.4/full-level` and `fine-level-scheme` | The revised 528-node plan is accepted, 2026-10-10, by `independent-review-REV-DESIGN-StableReductionPartII~2`; its package directory is absent. | Package the smooth universal curve on the fixed symplectic component over Z[1/N,ζ_N], within the coupled bundle below. |

[WORKERS.md](../WORKERS.md), **Upstream tiers**, requires that a package cite
only Mathlib, Tau Ceti, its own layers, other roadmaps of its bundle and
lower-tier packages. It permits tightly coupled roadmaps to go upstream
together. This issue authorizes edits only to the three Jacobian package
files and this handoff. Supplying either absent package or changing the
bundle schedule is outside that scope. This is an external block, so the
submission is a checkpoint under WORKERS.md **Claiming**, item 4, and the
user's blocked-job instruction.

The local queue still has `PKG-JacobianChallengePartII` with `after: []`, and
no `PKG-AbelianSchemesAndArithmeticModuli` or `PKG-StableReductionPartII` job.
Neither focus.json nor the Caraiani–Newton ordering declares this pair as a
bundle. The maintainer should resolve these boundaries before assigning
another continuation; repeated assignment alone cannot finish the package.

## Coupled scheduling and ownership

The mathematical chain is

`JC1 relative Jacobian → MC.4 full-level/fine-level scheme → JC7 universal application`.

StableReductionPartII additionally imports JC1 in MC.6/smooth-torelli,
JC6 in MC.6/jacobian-hodge-comparison and compactified-torelli, and
JC0/JC4/JC6 in MC.7/level-picard-parameter and picard-triples-comparison.
A whole-package prerequisite in either direction would be circular. Declare
a JacobianChallengePartII–StableReductionPartII bundle, keep its two package
directories, and send them upstream together after the external suppliers.
A fresh topological sort visited all 576 nodes and 1,313 explicit internal
prerequisite edges without a cycle. This scoped check does not establish
external supplier closure or acyclicity of the whole atlas. MC.4 remains
confined to JC7 and cannot become an input to JC0–JC5.

AlgebraicModuliForArithmeticGeometry and
NeronModelsAndSemistableAbelianVarieties have package directories. Their
relative-Picard/descent and semi-abelian interfaces do not replace the absent
A1–A3 and MC.4 contracts. The existing
AbelianSchemesAndArithmeticModuliPartII package imports the missing parent;
it does not supply it. Retain JC6's possible variation of toric rank; do not
assert a global constant-rank torus extension.

Read the current JacobianChallenge and AlgebraicVectorBundles READMEs in
full and checked their Suggested.lean boundaries. Pointed field Jacobians
belong to JacobianChallenge; general finite locally free duals and
determinants belong to AlgebraicVectorBundles L0B–L0C. StableReduction Layer 2
owns nodal Gorenstein duality, cohomology/base change and positivity. None of
that existing roadmap work was replanned or edited. No ownership move is
introduced by this continuation.

The read-only upstream checkout was
`070dc2becd74419e76303ede84b465ed4a69461f`, and current Tau Ceti was
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Current AbelianVariety/Basic.lean
still bundles an object over Spec K with K a field. Searching its
algebraic-geometry sources supplied no arbitrary-base AbelianScheme,
RelativePicard, PicardScheme, DualAbelian or PoincareBundle interface.
Neither read-only checkout was used to run Lake.

Read all six JacobianChallenge records of the reviewed library audit and
the 11 baseline declaration statements at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`; confirmed those source commits.
LineBundleClass is a commutative monoid, CommRing.Pic is an affine
ring-module Picard group, and abstract scheme-module sheaf cohomology is not
relative duality. These boundary checks do not constitute a new complete
library audit.

## Source reading and proof receipts

Freshly read [Yuan, arXiv:2108.05625v4](https://arxiv.org/pdf/2108.05625v4),
30 April 2024, 125 pages: §2.2.1 pp.29–30 and Theorem 2.10(2) with its
proof pp.37–38. These give the degree-one Abel point formula, the difference
order, and the diagonal-section interpretation. The companion identities
follow from those formulas by group cancellation; the arithmetic theorem's
metric and genus hypotheses are not added to that algebraic calculation.
The PDF's SHA-256 is
`a4e4c3d79e0912b62961a4b45b08e1e5c6957b0b64af7da74647c8ff9361e11e`.
The README labels supplementary arXiv-v4 locators separately.

The 21 August 2024, 126-page Yuan manuscript remains an inherited access
limitation; this worker did not read that version or the differently
paginated Annals 203 (2026), pp.15–119 article. DGH v3 §6.1 pp.23–25,
Yuan v4 §4.6.2 pp.96–98, and Milne's 12 June 2021 notes §8, Theorem 8.1,
pp.27–28 remain reading inherited from earlier checkpoints. They were not
freshly reread here. BLR is not cleared in the private-library index, so no
other copy was obtained. Its exact locators remain inherited bibliographic
citations. No source passage, PDF or private filesystem path was added to
the repository.

The new scratch proof uses GrpObj.comp_div and the native binary-product
projection laws. The cocycle is `div_mul_div_cancel'` with the explicitly
ordered arguments (a(y),a(x),a(z)). Translation factors a base section
through the terminal object of Over S and uses toUnit_unique plus
mul_div_mul_left_eq_div. For arbitrary base change, install the pulled-back
group-object instance, express Functor.map via its homMonoidHom, apply
map_div, and simplify PreservesLimitPair.iso_hom and the product projections.
All four examples follow those identities. The proof file had no admitted
proof, errors or warnings; `#print axioms` for cocycle, translation and base
change listed only propext, Classical.choice and Quot.sound, with no sorryAx.
Scratch is disposable; these directions suffice to reproduce the checks.

## Fresh validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/JacobianChallengePartII.json`:
  **0 errors, 0 warnings**; 48 nodes, 60 API items, 52 tests, 24 planets,
  14 gaps, 13 requests, eight stages planned and none closed. No packet changed.
- Target correspondence checks find all 48 exact statements and all 60 API
  and 52 test names. Native names were resolved against their Lean namespaces;
  omitted signatures retain explicit records. The seven new companion lemma
  signatures and four examples agree with the README. Comment records are
  not counted as elaborated geometric signatures.
- `lean-check research/blueprint/packages/JacobianChallengePartII/Suggested.lean`:
  **exit 0, 76 warnings, all declaration uses sorry; no errors or other
  warnings**. Available memory was 101 GB before this single check. Only the
  existing pinned build was used, with no new project, build, update, cache
  download or language server. No compile remains running.
- The disposable pointed-difference proof file separately elaborated with
  actual proofs and no warnings. No proof file is a package deliverable.
- README: 92,897 bytes; Suggested.lean: 57,243 bytes. No axiom, opaque or
  sorryAx declaration or empty Prop-valued replacement was introduced.
- Intake file checks passed: **three files, zero problems**.
  `git diff --check` passed.
  Only README, Suggested.lean and this handoff change. Metadata remains absent;
  add exactly `topic = "math.AG"` only when the full package contract is met.

Paths in the receipt table are relative to research/blueprint/.

| File | SHA-256 |
| --- | --- |
| `packets/JacobianChallengePartII.json` | `2da73e3c0831882d8ce8aafb9ac0d468cfefdf784ef8e25b5651a5347d37f275` |
| `packets/AbelianSchemesAndArithmeticModuli.json` | `768adc69448c575ea3b07e4631d532c5177bc7572d030e3e3420bd8d6f67b3ff` |
| `packets/StableReductionPartII.json` | `423a7fe842942862b21c2167a1f2791717ac9d972e3b9de5697c6f496370ffaf` |
| `packages/JacobianChallengePartII/README.md` | `3f58b6ac5d6115a965d1097135b7b5b24a8c1febd84c98f208b4c429ecbf716a` |
| `packages/JacobianChallengePartII/Suggested.lean` | `1ecd3c773a3c8f1074a86979f61f18cccd9786893750fb87f14cac96ec03c0c6` |

## Resume after supplier scheduling changes


1. Arrange the parent abelian-scheme package and the declared coupled bundle,
   avoiding circular whole-package prerequisites. Use the accepted revised
   StableReductionPartII plan. Match actual packaged contracts and conventions;
   keep MC.4 confined to JC7.
2. Recheck current upstream and library ownership. Import generic Picard,
   abelian-scheme, actual-line-class, invariant-differential and finite locally
   free dual/determinant interfaces from their owners.
3. Preserve all 48 targets and corrected hypotheses. Expand native geometric
   signatures, API lemmas and tests using supplier types. PROTOCOL §13 permits
   honest omissions when native types are absent; absence of a type is not
   successful elaboration of its geometric signature.
4. Repeat correspondence, packet, Lean, intake and diff checks. Add metadata
   when the full package contract is satisfied and submit the continuation.

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
| Prototype interfaces absent at the pinned baseline | 42 solely omitted targets; canonical-input identifications in JC2.6 and JC5.2–JC5.4 and the geometric supplier theorem in JC5.6 |

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
conclusion. No target is dropped. JC5.5 has the native generic coordinate
interface. JC2.6, JC5.2–JC5.4 and JC5.6 have native portions with explicit earlier
inputs and retained geometric-identification records. The other 42 targets
have honest geometric omission records in Suggested.lean.

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
