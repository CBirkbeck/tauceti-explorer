# PKG-JacobianChallengePartII — supplier checkpoint and Lean package form

Refs #7593. Codex (GPT-6), session `codex-aOWSHx`, 11 October 2026.
Branch: `codex-aOWSHx-jacobian-package`.
The [claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7593#issuecomment-6103948163)
was [confirmed by the bot](https://github.com/CBirkbeck/tauceti-explorer/issues/7593#issuecomment-6103949092).
Only this job was claimed. None of the manager's priority issues was available.
The available top plans and focus package had open submissions; this was the
first fallback package without a pending pull request.

**Blocked checkpoint, with package improvements.** The lower-tier abelian-scheme
package remains absent, and the fine-level dependency still needs a declared
coupled bundle. These changes improve the authorized package files without
moving mathematics from another owner. Metadata remains absent. The package
is not ready for upstream submission.

## Changes made in this run

- Reformat Suggested.lean with `import Mathlib`, the standard representative
  signature note, and `namespace TauCetiRoadmap.JacobianChallengePartII`.
  All 40 named statements use `theorem`, with mathematical docstrings.
- Place the native Layer 5 declarations in their dependency order: shift,
  difference powers, shifted differences, triangular coordinate change, and
  multiplication factorization. Remove duplicate global setup.
- Replace the 42 full geometric interface comment records and five geometric
  identification records with one closing list of the 47 geometric targets
  that still need supplier interfaces. Their exact mathematics, APIs and
  checks remain in the README. A comment is not an elaborated signature.
- Preserve all **82 executable declarations: 10 definitions, 40 theorems,
  32 examples**. A comment-stripped comparison, normalizing whitespace and
  the theorem keyword, confirms that every signature and body is unchanged;
  only their namespace prefix and order change. No test or hypothesis is cut.
- Add the namespace convention to the README. All **48 target statements,
  60 API names and 52 test names** still occur there.

The current [package form instructions](../PACKAGE_REVIEW.md#suggestedlean-in-taucetiroadmap-form-maintainer-2026-10-09--binding-for-packages-reviews-and-ports)
permit genuinely unavailable signatures to be absent and named in a short
closing comment. These honest omissions alone do not establish that packaging
is impossible. The external supplier/bundle gate below is a separate rule.
The inherited geometric proof/interface gaps remain explicit in the accepted
plan and must not be erased by a successful representative Lean check.

## External gate checked afresh

At clone main `553b97ee7f1ebf46fbfecf758ccbb903a63d72e7`, neither
`research/blueprint/packages/AbelianSchemesAndArithmeticModuli/` nor
`research/blueprint/packages/StableReductionPartII/` exists. Fresh GitHub main
directory listings contain 75 atlas package entries and 50 upstream
roadmap entries; neither has these two suppliers. The listings were also
checked at atlas commit `48928d01b026577b63ef377edce9d5b2a34a7493` and upstream
commit `4b002f622e9d68b627bdce9f6224897305a68bdc`, independently of the local
checkout receipts below. Issue searches across
open and closed issues found no package job with either exact title.
The local queue also lacks both package jobs, while
`PKG-JacobianChallengePartII` still has `after: []`.

| Required input | Contract read in the accepted plan | Completion action |
| --- | --- | --- |
| `AbelianSchemesAndArithmeticModuli:A1–A3` | The 89-node parent plan is accepted by `independent-review-REV-AbelianSchemesAndArithmeticModuli`, dated 2026-10-09. A1 supplies arbitrary-base abelian schemes, products and rigidity; A2 supplies both-axis-normalized Poincaré, biduality and arbitrary base change; A3 supplies nonzero finite locally free multiplication, including inseparable cases. | Supply the parent package as a lower-tier input. |
| `StableReductionPartII:MC.4/full-level` and `fine-level-scheme` | The 528-node plan is accepted by `independent-review-REV-DESIGN-StableReductionPartII~2`, dated 2026-10-10. Full level imports JC1's relative Jacobian, base change and polarization. The fine-level scheme provides the smooth projective universal curve on the fixed symplectic component over Z[1/N,ζ_N]. | Declare a coupled bundle with JacobianChallengePartII, keeping separate packages for joint upstream submission. |

The parent Part II package imports A1–A3 and cannot replace the parent.
AlgebraicModuliForArithmeticGeometry's Picard/descent outputs and the Néron
package's nodal semi-abelian outputs are different contracts. Neither
[focus.json](../focus.json) nor the
[upstream order](../upstream/CaraianiNewton.md) declares this coupled bundle.

[WORKERS.md, Upstream tiers](../WORKERS.md#upstream-tiers) permits package
citations to libraries, own layers, bundle partners and lower-tier packages.
Issue #7593 authorizes only this package's three files and this handoff; it
directs plan mistakes to the handoff. Supplying the missing packages or changing
the bundle schedule would edit other jobs' files. The checkpoint follows
[WORKERS.md, Claiming](../WORKERS.md#claiming). The maintainer must resolve the
gate before another package-only continuation can finish.

## Dependency order and conventions to preserve

The coupled chain is

`JC1 relative Jacobian → MC.4 full-level/fine-level scheme → JC7 universal application`.

Do not add reciprocal whole-package scheduling dependencies. A fresh
topological sort visits all **576 nodes and 1,313 explicit internal node edges**
of these two plans. This establishes acyclicity of those explicit edges only;
it does not expand stage references or prove external supplier closure.
StableReductionPartII's additional uses of JC0/JC4/JC6 in MC.6–MC.7 remain
downstream of the general Jacobian construction.

Keep g≥2, N≥3 invertible on the base and the exact symplectic component over
Z[1/N,ζ_N]. Varying the multiplier gives a different moduli problem. Preserve
arbitrary test-scheme base change, including nonreduced bases. Nonzero integer
multiplication stays finite locally free in characteristics dividing the integer;
étaleness requires that integer to be a unit on a positive-dimensional fibre.
JC6's generalized Jacobian may have varying toric rank; do not replace it by a
global extension with a constant-rank torus.

## Current upstream and library boundary

Read the current JacobianChallenge and AlgebraicVectorBundles READMEs in full,
and AlgebraicVectorBundles' suggested-file header and initial interfaces.
The read-only roadmap checkout is
`070dc2becd74419e76303ede84b465ed4a69461f`; current Tau Ceti is
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
Pointed field Jacobians belong to JacobianChallenge. General finite locally
free duals and determinants belong to AlgebraicVectorBundles L0B–L0C;
StableReduction Layer 2 supplies nodal coherent cohomology and duality.
No existing roadmap mathematics was replanned.

Read current
[rigidifiedPicardFunctor](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/AlgebraicGeometry/PicardFunctor/Rigidified.lean#L66)
and
[rigidifiedPicardPoint](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/AlgebraicGeometry/PicardFunctor/Point.lean#L40).
They require a specified section and give rigidified line-class pullback and the
trivial class. They do not establish section-free fppf comparison or relative
representability. The Rigidified module is absent at the atlas Tau Ceti pin,
verified against that commit's tree. Do not introduce a current-only import
into a suggested file elaborated at the older pin.

Read the current
[AbelianVariety carrier](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean#L95):
it requires a field and a scheme over its spectrum. This carrier does not
provide arbitrary-base abelian schemes. The reviewed audit's six
JacobianChallenge layer records distinguish the existing line-class monoid,
affine Picard group and abstract cohomology from the missing global relative
interfaces. These candidate checks do not constitute a new whole-library audit.
No Lake command was run in either read-only checkout.

The cleared-library index was read. No primary mathematical statement is newly
claimed as source-verified in this checkpoint. Earlier source and proof receipts
are inherited from the
[previous handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/553b97ee7f1ebf46fbfecf758ccbb903a63d72e7/research/blueprint/handoff/PKG-JacobianChallengePartII.md).
BLR, Néron Models, and Mumford–Fogarty–Kirwan, Geometric Invariant Theory,
are not cleared in the index; do not obtain another copy. No source file or
passage was copied.

## Validation in this run

- Blueprint checker: **zero errors and warnings**. The accepted packet is
  unchanged: 48 nodes (4 definitions, 13 constructions, 10 lemmas, 11 theorems,
  8 comparisons, 2 applications), 60 APIs, 52 tests, 24 planets, 11 baseline
  declarations, 14 gaps and 13 requests. JC0–JC7 are planned; none is closed.
- README correspondence: all 48 statements, 60 API names and 52 test names
  retained. Executable suggested-file comparison: all 82 declarations retained.
- `lean-check research/blueprint/packages/JacobianChallengePartII/Suggested.lean`:
  **exit 0, 76 warnings, all declaration uses sorry; zero errors or other
  warnings**. Available memory was 98 GiB before the check. The Mathlib source
  pin is `082e2d37e8b0463410cdb532e111cd43d5a66174`; the shared helper identifies
  Tau Ceti `f790474`. This file imports Mathlib. The check is representative
  signature elaboration, not proof or geometric-interface completion.
- Finite-group calculations in scratch: **8,545 assertions passed**. They
  check inverse direction and boundary cases in C5 and S3; the noncommutative
  negative controls confirm why cocycle/translation and power-homomorphism
  statements need their existing commutativity hypotheses.
- Submission path validation: **three allowed files, zero problems**.
  `git diff --check` passes. Metadata remains absent; no plan, queue, label,
  other roadmap, or atlas data file was edited.

### Pass table for the preserved native signatures

| Family | Instances or inspection | Result |
| --- | --- | --- |
| Pointed differences | Identity and inverse; diagonal; three C5 points; translations; S3 negative controls | The orientation y/x is retained. Cocycle and common translation still require commutativity. |
| Universal/shifted differences | One factor, zero translation, repeated point; inspect first and successor projections | Source order and the unchanged first factor agree with the definitions. |
| Triangular coordinates and head-tail split | One, two and three factors in C5 and S3; both inverse compositions | Tail restoration multiplies on the right; commutativity is not introduced for this equivalence. |
| Integer tail multiplication | e=−2, −1, 0, 1, 2; empty tail; S3 power negative control | e=0 collapses the tails; e=1 is identity. The represented homomorphism retains commutativity. |
| Shifted-power factorization | C5, one through three coordinates, all translations, e=−2 through 2; c(x)=[e]x and d(x,y)=y−x | The factorization holds with its explicit Abel-difference identity; no statement about arbitrary unrelated inputs is added. |
| Base change and proper/finite/flat/presentation/surjectivity transfers | Inspect product comparisons, source/target assumptions, and supplier hypotheses; compare every executable declaration | Signatures and assumptions are unchanged. Finite-group calculations do not verify scheme-level descent or these morphism properties. |

## Resume when the gate changes

1. Supply the parent abelian-scheme package; declare the Jacobian/curve-moduli
   bundle and supply its separate StableReductionPartII package.
2. Recheck ownership against the then-current libraries and roadmaps. Keep the
   dependency chain above and import each owner's exact contracts.
3. Complete the README's prose form to the binding package exemplar without
   losing its 48 targets, hypotheses, APIs, checks or locators. Preserve the
   new Lean namespace; names in the document are relative to it.
4. Add geometric signatures as supplier types become expressible; use honest
   representative omissions where the prototyping rule permits them. Retain
   the accepted plan's proof/interface gaps below rather than interpreting
   compilation as their solution. Plan corrections need their owner's action.
5. Repeat source, correspondence, Lean and submission checks, and add
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


The inherited representability/properness inputs include BLR 8.2/1, 8.2/5,
8.4/2–3, 9.2/13, 9.3/5 and MFK 6.9. The pointed relative immersion requires
proof and descent. Relative autoduality needs all-test-scheme identities;
geometric-point checks over fields are insufficient over nonreduced bases.
The axis-normalized comparison still needs the auxiliary Zhang argument or
the full currying/Albanese/seesaw proof. JC6 requires its rank-g comparison
before taking the determinant.

The earlier pointed-difference proof receipts use `GrpObj.comp_div` and the
binary-product laws. The cocycle uses `div_mul_div_cancel'` with arguments
(a(y),a(x),a(z)); translation uses `toUnit_unique` and
`mul_div_mul_left_eq_div`. The base-change proof uses the pulled-back group
object, its Hom monoid homomorphism and `map_div`, then product comparisons.
These inherited proof receipts were not rerun here and are not an implementation
claim or a package deliverable.

## Target correspondence retained

The numbering is unchanged. JC5.5 has its native coordinate interface. JC2.6,
JC5.2–JC5.4 and JC5.6 have native companions with explicit earlier inputs.
The other 42 geometric targets are represented in the README and named in
the short closing comment. None of their former prose comments is counted
as a geometric declaration or test.

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
