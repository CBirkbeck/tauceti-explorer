# PKG-JacobianChallengePartII — blocked package checkpoint

Refs #7593. Worker: Codex (GPT-6), session `codex-7IZkJR`,
10 October 2026. Branch: `codex-7IZkJR-jacobian-package`.
The bot confirmed [claim comment 6102083908](https://github.com/CBirkbeck/tauceti-explorer/issues/7593#issuecomment-6102083908)
in [comment 6102085282](https://github.com/CBirkbeck/tauceti-explorer/issues/7593#issuecomment-6102085282).
Only this job was claimed. No manager-priority issue was available; the eligible
fallback was this package job. This continuation builds on the native JC5
checkpoint inherited from session `codex-jwecba`.

## Result

**Blocked checkpoint with an expanded native JC5.6 interface.** Tail
multiplication now has the actual scheme isomorphism
H:A^{n+1}_S≅A×_S A^n_S and the morphism identity
D≫H=H≫(id_A×[e]^n). This supplies the scheme-level identification behind
the existing conditional finite, flat, locally finitely presented and
surjective product transfers. For commutative A the represented-point map is
a bundled group homomorphism; it agrees with the scheme morphism, is natural
in every test scheme and commutes with arbitrary base change through the
finite-product comparison. No reduced-base restriction is introduced.

The README adds nine companion API entries and six discriminating tests:
three for H and its inverse, and three for the point homomorphism at e=2, −1
and 0. H is a coordinate helper for this factorization, not a second general
product or abelian-scheme theory. Its projection identities and tests have no
unnecessary group-object hypothesis. The point homomorphism keeps the
commutativity hypothesis; powering a general noncommutative group is not a
homomorphism. The genus application still uses e=2g−2≠0, with no requirement
that e be invertible on the base.

All new definitions, identities and examples were separately checked with
actual proofs in disposable scratch. The roadmap file deliberately keeps
admitted proofs, as PROTOCOL §13 requests. This verifies the elementary
native coordinate interface, not the missing canonical geometric inputs or
the abelian-scheme multiplication theorem.

The inherited native JC5.2–JC5.4 maps and JC5.5 triangular isomorphism remain.
There are still **43 targets represented solely by omission records**, four
partial canonical-geometric-identification records for JC5.2–JC5.4/JC5.6, and
the fully expressible generic JC5.5 coordinate interface. The genus-one
canonical-bundle identification remains omitted. No substitute Picard scheme,
empty predicate, point-set model or duplicated general supplier was added.
`metadata.toml` remains absent because the full package boundary is unmet.

## Blocking supplier boundary

Both required supplier packages remain absent locally and from GitHub main's
complete package-directory listing, freshly checked on 10 October 2026.
Neither required native interface is supplied by current upstream roadmaps or
by the current Tau Ceti library.

| Required supplier | Current state | What completion needs |
| --- | --- | --- |
| `AbelianSchemesAndArithmeticModuli:A1–A3` | Its 89-node parent plan is independently accepted, dated 2026-10-09. Its parent package is absent. | Package arbitrary-base abelian schemes and rigidity (A1), dual/Poincaré/polarization interfaces (A2), and nonzero finite locally free multiplication (A3); match their contracts to JC1–JC5 and JC7. |
| `StableReductionPartII:MC.4/full-level` and `fine-level-scheme` | Its revised 528-node plan is accepted, dated 2026-10-10, by `independent-review-REV-DESIGN-StableReductionPartII~2`. Its package is absent. | Package the fixed symplectic component over Z[1/N,ζ_N] with its smooth universal curve as part of the coupled bundle below. The earlier revision gate is resolved. |

[WORKERS.md](../WORKERS.md), **Upstream tiers**, says: “A package
(PROTOCOL.md section 20) cites, for each target, only Mathlib, Tau Ceti, its own
layers, the other roadmaps of its bundle and the layers of lower-tier
packages.” Its same section permits tightly coupled roadmaps to go upstream
together as a bundle. Accepted target-level plans do not supply those
packaged contracts. The issue permits only this package's three deliverables
and this handoff. Writing either missing supplier or editing the queue/bundle
is outside this job. Completion requires external supplier and scheduling
work, so this submission is a checkpoint under WORKERS.md **Claiming**, item 4,
and the user's explicit blocked-job checkpoint instruction.

## Schedule the coupled pair together

Do not gate this job solely on completion of StableReductionPartII: that
roadmap also imports this one. The contracts give the mathematical chain

`JC1 relative Jacobian → MC.4 full-level/fine-level scheme → JC7 universal application`.

StableReductionPartII also imports JC1 in `MC.6/smooth-torelli`; JC6 in
`MC.6/jacobian-hodge-comparison` and `compactified-torelli`; and JC0/JC4/JC6
in `MC.7/level-picard-parameter` and `picard-triples-comparison`. A sequential
prerequisite between the two entire packages would be circular. Declare and
schedule a **JacobianChallengePartII–StableReductionPartII bundle**, retaining
the separate package directories and sending them upstream together. Package
the AbelianSchemesAndArithmeticModuli parent and the bundle's other external
suppliers first.

A fresh topological sort of the explicit internal prerequisites in both plans
visited all 576 nodes (48 Jacobian and 528 stable-reduction nodes), with 1,313
explicit node prerequisite edges and no cycle. This scoped check establishes
neither external supplier closure nor acyclicity of the whole atlas. The MC.4
supplier remains confined to JC7; it cannot enter JC0–JC5.

The local queue still gives `PKG-JacobianChallengePartII` an empty `after`
list. It has no `PKG-AbelianSchemesAndArithmeticModuli` or
`PKG-StableReductionPartII` entry. No bundle for this pair appears in
`focus.json` or the Caraiani–Newton order file. Resolve those boundaries
before assigning another continuation of #7593. These are recommendations
for the maintainer; this worker did not edit scheduling files.

The existing AbelianSchemesAndArithmeticModuliPartII package imports its
parent A1–A3 and excludes a duplicate abelian-scheme, Picard, dual or
polarization construction. Its Betti branch imports JC2 and JC7. It cannot
replace the missing parent. AlgebraicModuliForArithmeticGeometry and
NeronModelsAndSemistableAbelianVarieties have package directories; their
relative-Picard/descent and semi-abelian contracts do not supply the two
missing contracts. In JC6 toric rank can jump; semi-abelian does not assert a
global constant-rank torus extension.

## Ownership and library checks

Read the current JacobianChallenge and AlgebraicVectorBundles READMEs in full
and checked their suggested-interface boundaries. Pointed field Jacobians
remain in JacobianChallenge. General finite locally free duals and
determinants remain in AlgebraicVectorBundles L0B–L0C. Nodal Gorenstein
duality, cohomology/base-change and positivity belong to StableReduction's
shared supplier table and Layer 2. Its smooth restrictions are not separate
constructions. No current upstream roadmap is replanned.

Read-only upstream is `81207c7f16d5abf770f13a7d2bdcdb465c030787`;
current Tau Ceti is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
The public GitHub roadmap paths remain `TauCetiRoadmap/<Name>`; the differing
local checkout layout does not justify changing the README's public links.
Read current `AbelianVariety/Basic.lean`: its base is a field, not an arbitrary
scheme. Searching current algebraic-geometry sources found no `AbelianScheme`,
`RelativePicard`, `PicardScheme`, `DualAbelian` or `PoincareBundle` declaration.
Neither read-only tree was used to run Lake.

Read all six JacobianChallenge records of the reviewed library audit and the
11 baseline declaration statements at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Confirmed both checkout commits.
Native Hom-group/precomposition laws, finite-product projections and lifts,
pullback group-object transport, and product comparisons supply the new
interface. `LineBundleClass` is a commutative monoid, `CommRing.Pic` concerns
ring-module classes, abstract sheaf cohomology is not relative duality, and
the field `AbelianVariety` is not the missing abelian-scheme supplier. These
are boundary checks, not a new complete library audit.

## Source reading and limits

This continuation freshly read [Yuan arXiv:2108.05625v4](https://arxiv.org/pdf/2108.05625v4),
30 April 2024, 125 pages: §4.6.2 pp.96–97 and the proof of Theorem 4.17(5)
p.98. The shift, degree-difference and triangular formulas explain the
coordinate factorization and its tailwise multiplication. Maximal variation
and dimension hypotheses belong to the nondegeneracy result; they are not
hypotheses of these algebraic coordinate constructions. No nondegeneracy
theorem is added. This source's SHA-256 is
`a4e4c3d79e0912b62961a4b45b08e1e5c6957b0b64af7da74647c8ff9361e11e`.

The exact 21 August 2024, 126-page Yuan manuscript remained an inherited
source-access limitation; this worker did not reread that version. Retain its
accepted claims and original locators and label supplementary arXiv-v4
locators separately. The Annals 203 (2026), pp.15–119 version has different
pagination. Neither is passed off as the exact manuscript.

DGH v3 §6.1 pp.23–25, equations (6.3)–(6.5), and Yuan v4 §2.2.1 pp.29–30,
Theorem 2.10 and proof pp.37–39 remain reading inherited from the previous
checkpoint, not fresh reading by this continuation. The inherited DGH source
receipt is `5fc8e86f53ee43e9d18e8239a8db986bff74115ddb947abef4902a72dde338a4`.
Milne's 12 June 2021 notes §8, Theorem 8.1 and family discussion pp.27–28
remain inherited reading from the initial assembly.

BLR is not cleared by the private-library index. This worker did not obtain
or read another copy. Its printed locators are inherited bibliographic
citations; no scan, source passage or private-library file was added. The
Serre, MFK and Zhang auxiliary proof work below remains open. All roadmap
prose is in the workers' own words; no source excerpt is reproduced.

## Fresh validation and receipts

- README: 89,715 bytes. Exact correspondence finds all 48 accepted target
  statements, 60 API names and 52 test names. All 17 definition/construction
  nodes retain at least three tests. The nine added companion API names and
  six tests match their native declarations/examples. The packet is unchanged.
  Preserve its cohomological Brauer interpretation, negative self-Poincaré
  sign, arbitrary-alpha identities, stable Hodge scope and arbitrary
  universal-curve pullbacks. The older reader predates 19 review corrections;
  the corrected packet governs.
- Suggested.lean: 53,574 bytes. No `axiom`, `opaque` or `sorryAx` declaration
  was introduced. No empty geometric predicate replaces an omitted signature.
- `python3 scripts/check_blueprint.py research/blueprint/packets/JacobianChallengePartII.json`:
  **0 errors, 0 warnings**; 48 nodes, 60 API items, 52 tests, 24 planets,
  14 gaps, 13 requests; all eight stages planned, none closed.
- `lean-check research/blueprint/packages/JacobianChallengePartII/Suggested.lean`:
  **exit 0, 65 warnings, all `declaration uses sorry`; no errors or other
  warnings**. Available memory was 98 GB before this single check. It used the
  existing pinned build. No language server, new project, build, update or
  cache download was started, and no compile remains running.
- The disposable native sanity file elaborated with actual proofs of H and its
  inverse, the split identity, point-homomorphism laws, represented-point
  comparison, naturality, arbitrary-base-change comparison and all six new
  examples. It contained no admitted proof. `#print axioms` for H, the split
  identity, points and base change listed only `propext`, `Classical.choice`
  and `Quot.sound`, with no `sorryAx`. Unused-simp linter warnings in that
  disposable proof file do not occur in Suggested.lean. The supplier's
  canonical geometry and multiplication theorem were not proved.
- `python3 research/blueprint/intake.py check-files` on README, Suggested.lean
  and this handoff: **three files, zero problems**. `git diff --check` is
  clean; only these three authorized files change.
- `metadata.toml` remains absent. Add exactly `topic = "math.AG"` and a newline
  only when the full package contract is met. Do not promote this checkpoint
  as a completed package.

Paths in the receipt table are relative to `research/blueprint/`.

| File | SHA-256 |
| --- | --- |
| `packets/JacobianChallengePartII.json` | `2da73e3c0831882d8ce8aafb9ac0d468cfefdf784ef8e25b5651a5347d37f275` |
| `packets/AbelianSchemesAndArithmeticModuli.json` | `768adc69448c575ea3b07e4631d532c5177bc7572d030e3e3420bd8d6f67b3ff` |
| `packets/StableReductionPartII.json` | `423a7fe842942862b21c2167a1f2791717ac9d972e3b9de5697c6f496370ffaf` |
| `packages/JacobianChallengePartII/README.md` | `db9ed9907665d547479f0ae48b5a696803bf6d96b99e43d0b6765c96a719b933` |
| `packages/JacobianChallengePartII/Suggested.lean` | `69cfadb65b2866050468cc34b1c33e3876852d976c62e71c63e70ffaaa748b05` |

## Reproduce the native checks

Use `Pi.hom_ext` and `Pi.lift_π` for the inverse identities and represented
points. For H's inverse fields split a `Fin (n+1)` index with `Fin.cases`;
for the split identity first use `prod.hom_ext`, then `Pi.hom_ext` on the tail.
`GrpObj.comp_zpow` identifies the projected tail with composition by [e].
Qualify `CategoryTheory.Limits.Pi.map`; unqualified `Pi.map` resolves to a
function-level construction. The point homomorphism laws use `mul_zpow`,
which requires the commutativity instance. All six examples reduce by
projection or function extensionality, with the empty tail handled by
`Fin.elim0`.

For arbitrary base change, install the pulled-back `GrpObj` instance in the
proof as well as the statement. Project the finite-product comparison,
simplify `PreservesProduct.iso_hom`, `piComparison_comp_π`, `Pi.lift_π`,
then use `Functor.map_comp`. Split the head case; in a tail coordinate apply
`GrpObj.comp_zpow` and the comparison-projection identity, then use
`((Over.pullback f).homMonoidHom).map_zpow`. This verifies compatibility for
negative e as well as nonnegative e. No scratch file needs to survive.

The inherited factorization proof projects the non-head coordinate, uses
`GrpObj.comp_div`, `GrpObj.comp_zpow` and `mul_div_mul_right_eq_div`, and
precomposes the supplied equality
`(prod.snd ≫ c) / (prod.fst ≫ c) = d ^ e`
with the lift of coordinates 0 and i. This preserves the source order, sign
and positive tail scaling. Inherited native properness follows `Over.w`
and `IsProper.of_comp`; it does not require a new point-set argument.

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
