# PKG-JacobianChallengePartII — blocked package checkpoint

Refs #7593. Worker: Codex (GPT-6), session `codex-m7fMYr`,
10 October 2026. Branch: `codex-m7fMYr-jacobian-package`.
The bot confirmed [claim comment 6101496141](https://github.com/CBirkbeck/tauceti-explorer/issues/7593#issuecomment-6101496141)
in [comment 6101497337](https://github.com/CBirkbeck/tauceti-explorer/issues/7593#issuecomment-6101497337).
This is the only job claimed in this run. None of the manager's listed issues
was available; this package was the first eligible fallback kind.

## Result and remaining supplier boundary

**Blocked checkpoint with a native JC5.5 improvement.** This continuation adds
the scheme isomorphism representing the triangular coordinate equivalence,
its two Hom-coordinate comparisons, an arbitrary-base-change signature and
three scheme-morphism examples. The README explains the actual fibre-power
construction and its inverse. These declarations elaborate using native
schemes, group objects and products at the pinned Mathlib baseline. The other
47 geometric targets still have honest omission records, rather than native
signatures. The packet, suppliers, queue and issue labels are unchanged.

Both required supplier packages remain absent from the local directories and
GitHub main's complete package listing, freshly checked on 10 October 2026.
Neither supplier occurs among the existing upstream roadmaps or as the required
native interface in the current Tau Ceti library.

| Required supplier | Current state | What completion needs |
| --- | --- | --- |
| `AbelianSchemesAndArithmeticModuli:A1–A3` | Its 89-node parent plan is independently accepted, dated 2026-10-09. The parent package is absent. | Package arbitrary-base abelian schemes and rigidity (A1), dual/Poincaré/polarization interfaces (A2), and nonzero finite locally free multiplication (A3); match the contracts to JC1–JC5 and JC7. |
| `StableReductionPartII:MC.4/full-level` and `fine-level-scheme` | Its revised 528-node plan is now **accepted**, dated 2026-10-10, by `independent-review-REV-DESIGN-StableReductionPartII~2`. Review [#6395](https://github.com/CBirkbeck/tauceti-explorer/issues/6395) is `state:done`; revision [#6378](https://github.com/CBirkbeck/tauceti-explorer/issues/6378) is `state:submitted`. Its package is absent. | Package the fixed symplectic component over Z[1/N,ζ_N] with its smooth universal curve, as part of the coupled bundle described below. The earlier rejection and reader-reconciliation gate are resolved. |

WORKERS.md, **Upstream tiers**, permits package citations only to Mathlib,
Tau Ceti, the package's own layers, its declared bundle and lower-tier packages.
Its earlier sentence permits tightly coupled roadmaps to go upstream together
as a bundle. The issue allows only this package's three deliverables and this
handoff. Writing either missing supplier, or changing the bundle/queue, lies
outside this issue's deliverables. An accepted target-level plan is not a
packaged supplier and does not remove this boundary.

## Scheduling correction: package the coupled pair together

Do not gate this job solely on completion of the StableReductionPartII package:
that supplier also imports this roadmap. The actual contracts give the chain

`JC1 relative Jacobian → MC.4 full-level/fine-level scheme → JC7 universal application`.

StableReductionPartII also imports JC1 in `MC.6/smooth-torelli`, JC6 in
`MC.6/jacobian-hodge-comparison` and `compactified-torelli`, and JC0/JC4/JC6
in `MC.7/level-picard-parameter` and `picard-triples-comparison`.
These are sequential mathematical layers, but the two whole-roadmap packages
cannot each be required to precede the other. The maintainer needs to declare
and schedule a **JacobianChallengePartII–StableReductionPartII bundle**,
with the packages retaining their separate directories and going upstream
together, and arrange the missing AbelianSchemesAndArithmeticModuli parent
package and the bundle's other external suppliers first.

A fresh topological sort of the explicit internal prerequisites in the two
plans visits all 576 nodes (48 Jacobian and 528 stable-reduction nodes), with
no cycle. This scoped test establishes neither external supplier closure nor
absence of a cycle elsewhere in the atlas. The MC.4 dependency stays in JC7;
it cannot enter JC0–JC5.

The local queue still gives `PKG-JacobianChallengePartII` an empty `after`
list. It has no `PKG-AbelianSchemesAndArithmeticModuli` or
`PKG-StableReductionPartII` entry, and no bundle for this pair appears in
`focus.json` or the Caraiani–Newton order file. Arrange those jobs and the
bundle before assigning another continuation of #7593. This is a scheduling
recommendation for the maintainer, not an edit made by this worker.

## Ownership and upstream checks

The existing AbelianSchemesAndArithmeticModuliPartII package imports its parent
A1–A3 and excludes a second abelian-scheme, Picard, dual or polarization
construction. Its Betti branch also imports JC2 and JC7. It cannot replace the
missing parent. AlgebraicModuliForArithmeticGeometry and
NeronModelsAndSemistableAbelianVarieties already have package directories;
their relative-Picard/descent and semi-abelian contracts do not supply either
missing contract. In JC6 toric rank can jump: semi-abelian does not assert a
global constant-rank torus extension.

Read the current JacobianChallenge and AlgebraicVectorBundles READMEs in full,
JacobianChallenge's full Suggested.lean, and StableReduction's supplier table
and Layer 2. Checked AlgebraicVectorBundles' suggested dual/determinant
interfaces and searched current upstream suggested files for the new coordinate
construction. Pointed field Jacobians stay with JacobianChallenge. General
finite locally free duals and determinants stay with AlgebraicVectorBundles
L0B–L0C. The nodal Gorenstein duality, cohomology/base-change and positivity
contracts follow StableReduction's shared supplier table and Layer 2; their
smooth restrictions are not separate constructions. No existing upstream
target is replanned.

The read-only upstream checkout is
`81207c7f16d5abf770f13a7d2bdcdb465c030787`. Its local directories are at its
root, but **public GitHub main still uses `TauCetiRoadmap/<Name>`**. Verified
that layout through GitHub's contents API and retained the README's valid
public links; local layout does not justify rewriting them.

Current Tau Ceti is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
Read the full pinned `AbelianVariety/Basic.lean`: `AbelianVariety K` requires a field
and a group object over Spec K, rather than an arbitrary-base abelian scheme.
Searching its algebraic-geometry sources found no `AbelianScheme`,
`RelativePicard`, `PicardScheme`, `DualAbelian` or `PoincareBundle`
declaration. Read all six JacobianChallenge layer records of the reviewed
`data/library-coverage.json` audit. These are boundary checks, not a new complete
library audit. Neither read-only upstream tree was used to run Lake.

## Saved deliverables and fresh validation

- README is 81,912 bytes. Exact-string correspondence finds all 48 accepted
  target statements in JC0–JC7, all 60 API names and all 52 test names. Its four
  definitions and thirteen constructions each retain at least three tests.
  Preserve the corrected packet's cohomological Brauer interpretation, negative
  self-Poincaré sign, arbitrary-alpha formulas, stable Hodge scope and arbitrary
  universal-curve pullbacks. The older reader was not regenerated after the
  independent review's 19 contract corrections; the packet governs.
- Suggested.lean is 35,461 bytes. JC5.5 retains its native group-object
  Hom-valued triangular equivalence, with five API lemmas and three examples.
  `TriangularCoordinateEquivalence.schemeIso` now gives the representing
  isomorphism of actual finite products in `Over S`, hence fibre-power schemes.
  Its inverse multiplies by the head on the right, so it needs no commutativity.
  Two coordinate lemmas compare its forward and inverse maps with the earlier
  equivalence. `schemeIso_baseChange` uses `PreservesProduct.iso` and the
  transported `Functor.grpObjObj` instance for any new-base morphism.
  Three additional examples test the one-factor identity, two-factor inverse
  and small diagonal; the immutable packet's original tests are unchanged.
  The other **47 geometric targets remain comment records**, with their contracts,
  APIs and tests. Compiling comments does not check those signatures. No empty
  predicate or replacement point-set type was introduced.
- Read the actual Hom-group and precomposition laws, finite-product
  `piObj`/`Pi.π`/`Pi.lift`/`Pi.lift_π`/`Pi.hom_ext`,
  `PreservesProduct.iso`, `Functor.grpObjObj` and the Cartesian pullback
  instances at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`.
  These supply actual morphism groups, fibre-power products and transported
  group objects, rather than a substitute point-set model.
- `python3 scripts/check_blueprint.py research/blueprint/packets/JacobianChallengePartII.json`:
  **0 errors, 0 warnings**; 48 nodes, 60 API items, 52 tests, 24 planets,
  14 gaps and 13 requests; all eight stages planned, none closed.
- `lean-check research/blueprint/packages/JacobianChallengePartII/Suggested.lean`:
  **exit 0, sixteen warnings, all `declaration uses sorry`; no errors or other
  warnings**. Available memory was 98 GB before this single check. It uses the
  existing shared pinned build; the file imports Mathlib and no Tau Ceti module.
  No language server, new project, build, update or cache download was started,
  and no compile remains running.
- A separate disposable native sanity check also elaborated with only `sorry`
  warnings. In it the Hom-equivalence inverse fields and both scheme-isomorphism
  inverse fields were discharged by group cancellation and `Pi.hom_ext`.
  The scheme proof reduces projections with `Pi.lift_π`, then uses
  `MonObj.comp_mul`/`GrpObj.comp_div` and `div_mul_cancel`/
  `mul_div_cancel_right`; neither proof assumes commutativity. This verifies
  the coordinate formulas, not the omitted geometry or the admitted API.
  Suggested.lean intentionally retains admitted roadmap proofs.
- `metadata.toml` remains absent because this is a blocked, incomplete package.
  Add exactly `topic = "math.AG"` and a newline only when the package contract
  is met. Do not promote this checkpoint as a completed package.
- `python3 research/blueprint/intake.py check-files` on the saved README,
  Suggested.lean and this handoff: **three files, zero problems**.
  `git diff --check` is clean; only this issue's README, Suggested.lean and
  handoff change.

## Receipts and inherited source limits

The two supplier packet Git blobs match GitHub main: parent
`84b26b1831f0e62fdceb7d84a771862c2e1bd63b`, revised StableReductionPartII
`35c3d433946e096ccaee0b9739a3e249e51507dc`.
The revised StableReductionPartII packet retains its accepted review; the
earlier revision gate is resolved. Current SHA-256 receipts follow; paths are relative to
`research/blueprint/`.

| File | SHA-256 |
| --- | --- |
| `packets/JacobianChallengePartII.json` | `2da73e3c0831882d8ce8aafb9ac0d468cfefdf784ef8e25b5651a5347d37f275` |
| `packets/AbelianSchemesAndArithmeticModuli.json` | `768adc69448c575ea3b07e4631d532c5177bc7572d030e3e3420bd8d6f67b3ff` |
| `packets/StableReductionPartII.json` | `423a7fe842942862b21c2167a1f2791717ac9d972e3b9de5697c6f496370ffaf` |
| `packages/JacobianChallengePartII/README.md` | `103fd6ff777ddaea54abbd12fc3721379f551d9583fcfe7063d1307e52c4501a` |
| `packages/JacobianChallengePartII/Suggested.lean` | `1ff13b5293256199c0a47d04ce3e9c9bb001cd1f79889f6ee668c8204ef9a42a` |

The following source receipts and limits are inherited from the initial
assembly, not reading performed by this continuation. DGH arXiv:2001.10276v3
§6.1, pp.23–25, was read and its hash matched the accepted source receipt.
Milne's 12 June 2021 notes §8, Theorem 8.1 and family discussion, pp.27–28,
were inspected. Yuan's exact 21 August 2024, 126-page manuscript URL was
unreachable then; its claims and locators remain those of the independent
review. Annals 203 (2026), pp.15–119, uses different pagination.

BLR is absent from the cleared private-library index. This continuation did
not obtain or read another copy. Its accepted printed locators remain
bibliographic citations; no scan link, copied page or source passage is added.
Serre, MFK and Zhang auxiliary proofs remain in the worklist below.

The initial assembly read the 11 recorded baseline statements at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Its invertible-sheaf,
tensor-product, weighted-divisor-degree and abstract-cohomology boundaries
remain inherited evidence. `LineBundleClass` is a commutative monoid;
`CommRing.Pic` concerns ring-module classes, not a relative Picard scheme.
This run freshly checked the native group-object, product and base-change
statements described above, and the field-only abelian-variety boundary.
Target-level acceptance does not close the source/proof gaps below.

## Resume after supplier scheduling changes

1. Arrange the parent abelian-scheme package and the declared coupled bundle,
   rather than a circular pair of package prerequisites. Use the now-accepted
   StableReductionPartII plan. Match actual packaged contracts and conventions;
   keep its MC.4 supplier confined to JC7.
2. Recheck current upstream and library ownership. Import generic Picard,
   abelian-scheme, actual-line-class, invariant-differential, and finite locally
   free dual/determinant interfaces from their owners. Do not construct those
   general theories again inside this package.
3. Preserve all 48 targets and corrected hypotheses. Expand expressible native
   geometric signatures, API lemmas and examples using supplier types. Protocol
   §13 permits honest omissions where native types are absent and forbids empty
   `Prop` fields; absence of types is not successful signature elaboration.
4. Repeat validation and correspondence, run `lean-check` and the intake/diff
   checks, add metadata when complete, and submit the completed continuation.

No subsequent worker needs this run's disposable scratch files. The inherited
source-proof worklist and target map follow.

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
