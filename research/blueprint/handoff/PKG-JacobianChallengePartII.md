# PKG-JacobianChallengePartII — blocked package checkpoint

Refs #7593. Worker: Codex (GPT-6), session `codex-jwecba`,
10 October 2026. Branch: `codex-jwecba-jacobian-package`.
The bot confirmed [claim comment 6101759889](https://github.com/CBirkbeck/tauceti-explorer/issues/7593#issuecomment-6101759889)
in [comment 6101761117](https://github.com/CBirkbeck/tauceti-explorer/issues/7593#issuecomment-6101761117).
This continuation holds the same claim and submits only this job.

## Result and remaining supplier boundary

**Blocked checkpoint with native JC5.2–JC5.4 constructions and a JC5.6
factorization signature.** The shift, Faltings–Zhang and shifted Faltings–Zhang
maps now use actual morphisms and fibre-power schemes in Over(S). Their
canonical Abel and section-free difference morphisms are typed inputs from
JC5.1 and JC2.6. Their API and tests include arbitrary-base-change comparisons,
the pointed comparison and native properness hypotheses. The earlier JC5.5
scheme isomorphism is reused. JC5.6 has the actual shifted-power and tail maps,
a coordinate identity with the earlier degree-difference equality as an
explicit hypothesis, and conditional native finite/flat/presentation/surjective
transfers from integer multiplication.

These additions do not construct the geometric inputs or the supplier's
nonzero multiplication isogeny. The file still has **43 targets represented
solely by omission records**, four partial geometric-identification records
for JC5.2–JC5.4/JC5.6, and the fully expressible generic JC5.5 coordinate
interface. In particular the genus-one canonical-bundle identification remains
omitted; its expressible zero-Abel consequence is an additional example.
Elaboration checks the native signatures, not the missing geometry or the
admitted proofs. No substitute Picard scheme, empty predicate, point-set model
or duplicate general abelian-scheme construction was added.

Both required supplier packages remain absent from the local directories and
GitHub main's complete package listing, freshly checked on 10 October 2026.
Neither supplier occurs among the existing upstream roadmaps or as the required
native interface in the current Tau Ceti library.

| Required supplier | Current state | What completion needs |
| --- | --- | --- |
| `AbelianSchemesAndArithmeticModuli:A1–A3` | Its 89-node parent plan is independently accepted, dated 2026-10-09. The parent package is absent. | Package arbitrary-base abelian schemes and rigidity (A1), dual/Poincaré/polarization interfaces (A2), and nonzero finite locally free multiplication (A3); match the contracts to JC1–JC5 and JC7. |
| `StableReductionPartII:MC.4/full-level` and `fine-level-scheme` | Its revised 528-node plan is accepted, dated 2026-10-10, by `independent-review-REV-DESIGN-StableReductionPartII~2`. Its package is absent. | Package the fixed symplectic component over Z[1/N,ζ_N] with its smooth universal curve, as part of the coupled bundle described below. The earlier revision gate is resolved. |

WORKERS.md, **Upstream tiers**, permits package citations only to Mathlib,
Tau Ceti, the package's own layers, its declared bundle and lower-tier packages.
Its earlier sentence permits tightly coupled roadmaps to go upstream together
as a bundle. The issue allows only this package's three deliverables and this
handoff. Writing either missing supplier, or changing the bundle/queue, lies
outside this issue's deliverables. An accepted target-level plan is not a
packaged supplier and does not remove this boundary. The job cannot be completed
within this run without that external scheduling and supplier work, so this
submission is a checkpoint; `metadata.toml` remains absent.

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
plans visits all 576 nodes (48 Jacobian and 528 stable-reduction nodes)
and 1,313 explicit node prerequisite edges, with no cycle. This scoped test establishes neither external supplier closure nor
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
Read the full pinned and current `AbelianVariety/Basic.lean`: `AbelianVariety K` requires a field
and a group object over Spec K, rather than an arbitrary-base abelian scheme.
Searching its algebraic-geometry sources found no `AbelianScheme`,
`RelativePicard`, `PicardScheme`, `DualAbelian` or `PoincareBundle`
declaration. Read all six JacobianChallenge layer records of the reviewed
`data/library-coverage.json` audit. These are boundary checks, not a new complete
library audit. Neither read-only upstream tree was used to run Lake.

## Saved deliverables and fresh validation

- README is 86,222 bytes. Exact-string correspondence finds all 48 accepted
  target statements, all 60 API names and all 52 test names. Its four
  definitions and thirteen constructions retain at least three tests each.
  Suggested.lean contains the same names, either as declarations/examples in
  their namespaces or as honest geometric omission records. Preserve the
  corrected packet's cohomological Brauer interpretation, negative self-Poincaré
  sign, arbitrary-alpha formulas, stable Hodge scope and arbitrary
  universal-curve pullbacks. The older reader was not regenerated after the
  independent review's 19 corrections; the packet governs.
- Suggested.lean is 48,954 bytes. The native JC5 additions and their precise
  input boundaries are described above and in the README. The first shift
  uses source order A×X; the shifted fibre-power map uses X^m×A with m=n+1.
  FZ uses source coordinates 0 and i.succ, so its differences have the prescribed
  sign. The factorization's tail map raises each tail morphism to e, fixing
  its head. It does not erase the factor e=2g−2. The helper B and D definitions
  each have at least three native examples. All geometric contract records
  are retained, including the supplier-dependent tests.
- Freshly read the native Hom-group/precomposition laws, finite-product
  universal property, binary/finite product comparisons, pullback group-object
  transport, and `AlgebraicGeometry.IsProper.of_comp` at Mathlib
  `082e2d37e8b0463410cdb532e111cd43d5a66174`. Native morphism properties are
  `IsFinite`, `Flat`, `LocallyOfFinitePresentation` and `Surjective`.
  The conditional product transfers are signatures with admitted proofs;
  no finite locally free multiplication theorem was proved here.
- `python3 scripts/check_blueprint.py research/blueprint/packets/JacobianChallengePartII.json`:
  **0 errors, 0 warnings**; 48 nodes, 60 API items, 52 tests, 24 planets,
  14 gaps and 13 requests; all eight stages planned, none closed.
- `lean-check research/blueprint/packages/JacobianChallengePartII/Suggested.lean`:
  **exit 0, fifty warnings, all `declaration uses sorry`; no errors or other
  warnings**. Available memory was 101 GB before this single check. It used the
  existing pinned build, Mathlib `082e2d3` and Tau Ceti `f790474`; the file
  imports Mathlib and no Tau Ceti module. No language server, new project,
  build, update or cache download was started. No compile remains running.
- A disposable native sanity file also elaborated successfully. In it the
  triangular equivalence and scheme-isomorphism inverse fields, the new
  coordinate and test identities, all three new base-change lemmas, the pointed
  comparison, native properness and the factorization were discharged with
  actual proofs. `#print axioms` for the factorization, three base-change
  lemmas and properness listed only `propext`, `Classical.choice` and
  `Quot.sound`, with no `sorryAx`. The supplier property transfers remain
  admitted even there. This verifies the elementary native algebra and
  comparisons, not the canonical geometric identifications. The roadmap file
  intentionally retains `sorry` proofs as PROTOCOL §13 requests.
- `metadata.toml` remains absent. Add exactly `topic = "math.AG"` and a newline
  only when the full package contract is met. Do not promote this checkpoint
  as a completed package.
- `python3 research/blueprint/intake.py check-files` on README, Suggested.lean
  and this handoff: **three files, zero problems**.
  `git diff --check` is clean; only these three authorized files change.

The native sanity proofs reduce equality of fibre-power morphisms with
`Pi.hom_ext` and `Pi.lift_π`. Binary-product composition requires
`prod.comp_lift_assoc` after reassociation. Base-change proofs use
`Functor.map_mul`, product projections and the following comparison: mapping
`prod.lift p q` equals the lift of the two mapped morphisms followed by
`(PreservesLimitPair.iso F X X).inv`. Prove that comparison by composing with
its `.hom` and checking both projections. The FZ properness proof transfers
the source's `IsProper` instance through `Over.w`, then applies
`IsProper.of_comp` to the target structure morphism.

The factorization proof is especially short after projection. The head
simplifies directly. In a non-head coordinate, simplify with
`GrpObj.comp_div`, `GrpObj.comp_zpow` and `mul_div_mul_right_eq_div`, then
precompose the supplied equality
`(prod.snd ≫ c) / (prod.fst ≫ c) = d ^ e`
with `prod.lift (prod.fst ≫ p₀) (prod.fst ≫ pᵢ)` on X^{n+1}×A. This fixes the
source order, sign and positive tail scaling without relying on an admitted
API lemma. These proof routes suffice to reproduce the checks; no subsequent
worker needs the disposable scratch files.

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
| `packages/JacobianChallengePartII/README.md` | `751cb25d2df6add023ddbcaa435e3f428e15c9e36598fc916a2ee7c6d79b2f8f` |
| `packages/JacobianChallengePartII/Suggested.lean` | `402615c7e00217bcfb8f055f48391dd6d473d1a3bfb6a5674051c8997fb6038c` |

Fresh reading in this continuation:

| Source actually read | Locators | SHA-256 |
| --- | --- | --- |
| [DGH arXiv:2001.10276v3](https://arxiv.org/pdf/2001.10276v3) | §6.1 pp.23–25, including equations (6.3)–(6.5), properness and the pointed fibre comparison | `5fc8e86f53ee43e9d18e8239a8db986bff74115ddb947abef4902a72dde338a4` |
| [Yuan arXiv:2108.05625v4](https://arxiv.org/pdf/2108.05625v4), 30 April 2024, 125 pages | §2.2.1 pp.29–30; Theorem 2.10 and proof pp.37–39; §4.6.2, Theorem 4.17 and proof pp.96–98 | `a4e4c3d79e0912b62961a4b45b08e1e5c6957b0b64af7da74647c8ff9361e11e` |

The DGH hash matches the accepted source receipt. The supplementary Yuan
version directly supplies the shift, section-free difference, fibre-power
coordinates and triangular factorization used in the new native signatures.
Its maximal-variation and dimension hypotheses belong to the nondegeneracy
conclusions, not to these algebraic constructions. No arithmetic nondegeneracy
theorem is added here.

Yuan's exact 21 August 2024, 126-page manuscript URL remained unreachable in
this run. Its accepted claims and original locators are preserved; the README
labels supplementary arXiv-v4 locators separately. Annals 203 (2026), pp.15–119,
has different pagination. Neither the arXiv copy nor the journal metadata is
passed off as the exact manuscript. Milne's 12 June 2021 notes §8, Theorem 8.1
and family discussion pp.27–28 remain inherited reading from the initial
assembly, not fresh reading by this continuation.

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
| Prototype interfaces absent at the pinned baseline | 43 solely omitted targets; canonical-input identifications in JC5.2–JC5.4 and the geometric supplier theorem in JC5.6 |

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
interface. JC5.2–JC5.4 and JC5.6 now have native portions with explicit earlier
inputs and retained geometric-identification records. The other 43 targets
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
