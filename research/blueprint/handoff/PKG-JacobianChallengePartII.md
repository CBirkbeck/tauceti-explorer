# PKG-JacobianChallengePartII — blocked supplier checkpoint

Refs #7593. Worker: Codex (GPT-6), session `codex-83QEvV`,
10 October 2026. Branch: `codex-83QEvV-jacobian-package`.
The [claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7593#issuecomment-6103217179)
was [confirmed by the bot](https://github.com/CBirkbeck/tauceti-explorer/issues/7593#issuecomment-6103218440).
None of the manager's priority issues was available; the eligible fallback
order selected this package. Only this issue was claimed.

**Blocked checkpoint.** The package cannot meet the supplier rules within the
four deliverable paths authorized by #7593. This submission consolidates the
handoff into a resumption note and verifies the external block afresh. It
changes only this handoff. The existing README and Suggested.lean are preserved;
metadata remains absent. This is not a completed package or a new independent
mathematical review.

## Maintainer action needed before another continuation

At atlas main `303b02c8bda26170394f9f96f6c691391a2f8611`, the complete
[package directory listing](https://github.com/CBirkbeck/tauceti-explorer/tree/303b02c8bda26170394f9f96f6c691391a2f8611/research/blueprint/packages)
and the local clone contain neither required supplier package below.
The live upstream TauCetiRoadmap directory listing also contains neither.
Fresh GitHub issue searches across open and closed issues found no roadmap
package issue with either supplier's exact name. The local queue has neither
package job, and `PKG-JacobianChallengePartII` still has `after: []`.

| Required input | Contract freshly read in the accepted plan | Completion action |
| --- | --- | --- |
| `AbelianSchemesAndArithmeticModuli:A1–A3` | The 89-node parent plan is accepted by `independent-review-REV-AbelianSchemesAndArithmeticModuli`, dated 2026-10-09. A1 supplies arbitrary-base abelian schemes and rigidity; A2 supplies relative duals, both-axis-normalized Poincaré, biduality and arbitrary base change; A3 supplies nonzero finite locally free multiplication, including inseparable cases. | Queue and supply the parent package before the Jacobian/curve-moduli bundle. |
| `StableReductionPartII:MC.4/full-level` and `fine-level-scheme` | The 528-node plan is accepted by `independent-review-REV-DESIGN-StableReductionPartII~2`, dated 2026-10-10. Full level imports JC1's relative Jacobian, base change and principal polarization; the fine-level scheme supplies the smooth projective universal genus-g curve on the fixed symplectic component over Z[1/N,ζ_N]. | Declare the coupled bundle with JacobianChallengePartII and supply both separate package directories for joint upstream submission. |

The existing `AbelianSchemesAndArithmeticModuliPartII` package explicitly
imports A1–A3 from its parent; its completed Poincaré, Betti and finite-field
branches do not replace the parent contract. AlgebraicModuliForArithmeticGeometry
and NeronModelsAndSemistableAbelianVarieties have packages, but their relative
Picard/descent and nodal semi-abelian outputs do not supply these missing inputs.
The [focus file](../focus.json) and [upstream order](../upstream/CaraianiNewton.md)
do not declare the JacobianChallengePartII–StableReductionPartII bundle.

[WORKERS.md, Upstream tiers](../WORKERS.md#upstream-tiers) permits package
citations to libraries, own layers, bundle partners and lower-tier packages.
Its [claiming rule](../WORKERS.md#claiming) requires a checkpoint when stopping
unfinished work. Issue #7593 authorizes only the Jacobian package's three files
and this handoff, and directs plan mistakes here. Supplying the missing packages,
changing the bundle schedule or transferring their mathematics into this
roadmap would exceed the issue's scope. Do not schedule another package-only
continuation until this external gate changes. No queue, label or other
roadmap was changed by this worker.

## Dependency order and exact conventions

The essential dependency chain is

`JC1 relative Jacobian → MC.4 full-level/fine-level scheme → JC7 universal application`.

Do not add reciprocal whole-package prerequisites. A fresh topological sort of
both plans visited all **576 nodes and 1,313 explicit internal node edges**.
There is no cycle among those edges. This scoped check excludes external
supplier closure and expansion of stage references, so it does not establish
acyclicity or closure of the whole atlas.

StableReductionPartII also imports JC1 in MC.6/smooth-torelli, JC6 in
MC.6/jacobian-hodge-comparison and compactified-torelli, and JC0/JC4/JC6 in
MC.7/level-picard-parameter and picard-triples-comparison. Keep MC.4's reverse
supply confined to JC7; do not use it to construct JC0–JC5.

Preserve g≥2, N≥3 invertible on the base, and the fixed symplectic pairing
component over Z[1/N,ζ_N]. A homogeneous level functor with varying multiplier
is a different moduli problem. Arbitrary test-scheme base change, including
nonreduced bases, is required. Nonzero multiplication remains finite locally
free when the characteristic divides its integer; étaleness needs a unit.
For JC6 allow the nodal generalized Jacobian's toric rank to vary; do not
replace it by a global extension with a constant-rank torus.

## Current upstream and library boundary

Freshly read the current JacobianChallenge and AlgebraicVectorBundles READMEs
in full. The read-only roadmap checkout is
`070dc2becd74419e76303ede84b465ed4a69461f`; current Tau Ceti is
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Pointed field Jacobians belong to
JacobianChallenge. General finite locally free duals and determinants belong
to AlgebraicVectorBundles L0B–L0C. StableReduction Layer 2 owns nodal relative
duality and coherent curve theory. No existing roadmap target was replanned.

Freshly read
[rigidifiedPicardFunctor](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/AlgebraicGeometry/PicardFunctor/Rigidified.lean#L66)
and
[rigidifiedPicardPoint](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/AlgebraicGeometry/PicardFunctor/Point.lean#L40).
The functor takes f:X→S, a specified section x₀:S→X and its section identity.
Its values are rigidified line-bundle classes on base changes; its maps are
pullbacks. The point is the trivial rigidified class. Neither file establishes
section-free fppf Picard comparison or representability. The Rigidified module
is absent at the atlas pin `f790474821cf4256814db967cb154e7af3d0c369`, verified
against that commit's tree. It is a current interface to reuse once the pin
allows it, not a substitute for the missing supplier.

The current
[AbelianVariety declaration](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean#L95)
was also read. Its data require a field K and an object over Spec K, so this
candidate does not supply arbitrary-base abelian schemes or relative duals.
Searching the current algebraic-geometry sources for AbelianScheme,
RelativePicard, PicardScheme, DualAbelian and PoincareBundle found no matching
interface. These candidate checks are not a complete new library audit.
No Lake command was run in either read-only checkout.

Read all six JacobianChallenge records in the reviewed library audit. The
pin's actual-line-class monoid, affine `CommRing.Pic` and abstract sheaf
cohomology do not imply a global Picard group, relative representability or
proper pushforward/duality. Earlier workers' detailed baseline and primary
source receipts remain available in the
[previous handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/303b02c8bda26170394f9f96f6c691391a2f8611/research/blueprint/handoff/PKG-JacobianChallengePartII.md).
They are inherited receipts, not fresh source reading by this session.
The cleared-library index was read; no source file or passage was copied.

## Checks completed in this run

- `python3 scripts/check_blueprint.py research/blueprint/packets/JacobianChallengePartII.json`:
  exit 0, **zero errors and warnings**. The unchanged accepted plan has
  48 nodes, 60 API items, 52 tests, 24 planets, 14 gaps and 13 requests;
  all eight stages are planned, none closed.
- Exact README correspondence: all **48 target statements, 60 API names and
  52 test names** occur. Suggested.lean retains **42 geometric interface
  omission records and five geometric identification records** plus the
  native JC5.5 interface. Comments are not elaborated geometric signatures.
- `lean-check research/blueprint/packages/JacobianChallengePartII/Suggested.lean`:
  exit 0, **76 warnings, all declaration uses sorry; zero errors or other
  warnings**. Available memory was 91 GiB before this single check. The
  Mathlib source commit was independently verified as
  `082e2d37e8b0463410cdb532e111cd43d5a66174`. The helper identifies the shared
  environment with Tau Ceti `f790474`; this file imports only Mathlib modules.
  The shared environment's root is not a Git checkout, so no root Git revision
  was inferred. No build, update, cache download or language server was started;
  the elaboration has finished.
- The Lean check certifies the existing native portion. It does not certify
  the omitted geometric signatures, missing supplier packages or proof closure.
- Swarm file validation: **one allowed file, zero problems**.
  `git diff --check` passes. Only this handoff changes.

The three plan and two package hashes match the previous receipts:

| Path relative to research/blueprint/ | SHA-256 |
| --- | --- |
| `packets/JacobianChallengePartII.json` | `2da73e3c0831882d8ce8aafb9ac0d468cfefdf784ef8e25b5651a5347d37f275` |
| `packets/AbelianSchemesAndArithmeticModuli.json` | `768adc69448c575ea3b07e4631d532c5177bc7572d030e3e3420bd8d6f67b3ff` |
| `packets/StableReductionPartII.json` | `423a7fe842942862b21c2167a1f2791717ac9d972e3b9de5697c6f496370ffaf` |
| `packages/JacobianChallengePartII/README.md` | `3f58b6ac5d6115a965d1097135b7b5b24a8c1febd84c98f208b4c429ecbf716a` |
| `packages/JacobianChallengePartII/Suggested.lean` | `1ecd3c773a3c8f1074a86979f61f18cccd9786893750fb87f14cac96ec03c0c6` |

README remains 92,897 bytes and Suggested.lean 57,243 bytes.
No new paper statement, source issue, ownership move or implementation claim
is made in this checkpoint.

## Resume after the external gate changes

1. Supply the parent abelian-scheme package and declare the coupled bundle,
   with separate package directories and joint submission. Match the exact
   packaged contracts above; avoid reciprocal whole-package scheduling edges.
2. Recheck current upstream and Tau Ceti ownership. Import Picard,
   abelian-scheme, actual-line-class, invariant-differential and finite locally
   free dual/determinant interfaces from their owners.
3. Preserve all 48 targets and their hypotheses. Replace the geometric
   omission and identification records with native signatures, API lemmas
   and tests as their supplier types become expressible. PROTOCOL §13 allows
   honest omissions; compilation of comments does not discharge §20's package.
4. Retain the authoritative plan's 14 explicit proof/interface gaps below.
   They concern source-proof inputs as well as missing signature types.
5. Repeat correspondence, packet, Lean, intake and diff checks. Add exactly
   `topic = "math.AG"` when the complete package contract is met.

| Inherited gap | Affected targets |
| --- | --- |
| Algebraic equivalence of geometric-fibre actual line classes | JC4.1, JC4.2, JC4.8, JC3.10 |
| Fine-level supplier assembly | JC7.1, JC7.2 |
| Relative Picard representability proof inputs | JC0.3 |
| Relative properness and canonical polarization descent | JC1.1, JC1.4 |
| Relative pointed Abel immersion bridge | JC2.4 |
| Poincaré sign and normalized seesaw | JC3.1, JC3.6, JC3.11 |
| Translated theta pullback calculation | JC3.4, JC3.5 |
| Arbitrary-alpha curve-square computation | JC3.7 |
| Nonsymmetric cube recurrence in theta doubling | JC3.8 |
| Relative autoduality over nonreduced bases | JC4.3, JC4.5 |
| Bi-Picard lifts preserving the other projection condition | JC4.6, JC4.7 |
| Axis-normalized square comparison proof | JC4.9 |
| Stable relative duality and determinant API | JC6.1, JC6.2, JC6.3 |
| Native geometric prototypes absent at the pin | 42 omitted targets; identifications in JC2.6, JC5.2–JC5.4 and supplier theorem in JC5.6 |

The representability/properness proof inputs recorded by the accepted plan
include BLR 8.2/1, 8.2/5, 8.4/2–3, 9.2/13, 9.3/5 and MFK 6.9. Neither book
is cleared in the maintainer's index for this run; do not obtain another copy.
Use the supplied index and freely authorized references when continuing, and
preserve exact unresolved proof obligations rather than treating these citations
as fresh reading. The pointed relative immersion requires proof and descent;
autoduality requires all-test-scheme identities over nonreduced bases; the
axis-normalized comparison requires the auxiliary Zhang argument or a full
currying/Albanese/seesaw proof. JC6 requires its rank-g comparison before
forming its determinant. Geometric-point checks do not replace these inputs.

The earlier native pointed-difference proof can be reproduced with
`GrpObj.comp_div` and the binary-product laws. The cocycle uses
`div_mul_div_cancel'` with the ordered arguments (a(y),a(x),a(z)); translation
uses `toUnit_unique` and `mul_div_mul_left_eq_div`. For base change, install the
pulled-back group object, use its Hom monoid homomorphism and `map_div`, then
simplify `PreservesLimitPair.iso_hom` and product projections. Earlier receipts
record an actual proof with no sorryAx; that scratch proof was not rerun here
and is not a package deliverable.

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
