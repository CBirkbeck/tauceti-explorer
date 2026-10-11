# PKG-JacobianChallengePartII — prose package and external supplier checkpoint

Refs #7593. Codex (GPT-6), session `codex-d9d4xD`, 11 October 2026.
Branch: `codex-d9d4xD-jacobian-package`.
The [claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7593#issuecomment-6104197192)
was confirmed by the bot at 01:28:41 UTC. Only this job was claimed.
None of the manager's priority issues was available. The higher-priority fallback
#673 and focus package #7462 already had open submissions, so they were skipped.

**Blocked checkpoint with a rewritten README.** The parent abelian-scheme
package is still absent, and the fine-level dependency still lacks a declared
coupled bundle. These are external changes beyond this job's four authorized
paths. The package is not ready for upstream submission.

## Changes in this run

- Rewrite the README to the binding TauCetiRoadmap prose form: scope and
  ownership, conventions, exact contracts, a prose build order, eight numbered
  layers, and examples and dependencies at the end of each layer. Remove the
  target-order table and the catalogue fields. Attach the locator to each claim,
  retain its proof/construction argument, and give its dependencies as *Needs*.
  Named properties now explain the use of each object's interface; all checks
  remain as individual bullets. Add worked examples and downstream consumers.
- Preserve all **48 accepted statements, 60 API statements and 52 planned test
  statements**, plus every inherited companion API/check. A whitespace-normalized
  comparison, allowing only the change from JCk.n to §k.n and the layer-reference
  spelling, finds every statement intact. All **141 inherited mathematical
  names** remain. The README is about 99.5 KB, within this job's 200 KB limit.
- Use the public Yuan **arXiv v4** PDF throughout the README, with locators
  verified in that version. Its shifted-map discussion is pp. 96–98 and its
  appendix comparison is pp. 108–110; these replace the older author-copy
  pp. 98–99 and 109–111. No mathematical hypothesis changes with that switch.
- Correct the stale statement that actual line-bundle classes only have a
  commutative monoid. Current Tau Ceti `LineBundle.Class` supplies a
  **CommGroup**, actual dual inversion, representative surjectivity and the
  trivial-class criterion. Cite `mk_eq_mk_iff`, `mk_surjective`,
  `mk_tensorProduct`, `inv_mk` and `mk_eq_one_iff` directly. Relative
  sheafification, representability and geometric algebraic-equivalence
  subgroups remain additional constructions. No target is removed: the kept
  field theta construction explicitly extends the parent to arbitrary α,
  and the family targets extend the field/pointed parent to arbitrary bases.
- Suggested.lean is unchanged. Its **82 executable declarations** are still
  10 definitions, 40 theorems and 32 examples in
  `TauCetiRoadmap.JacobianChallengePartII`; the closing comment names the
  unavailable geometric targets. The binding representative-signature rule
  permits these omissions. They alone do not block packaging.

**Metadata remains absent deliberately.** The fitting future line is
`topic = "math.AG"`. `research/blueprint/issues.py:deliverables_complete`
checks package completion by the presence of all output files, without reading
the blocked handoff. Adding metadata would falsely mark this externally blocked
package complete and advance it to review. The README and this handoff are the
only changed files; no packet, queue, bundle schedule or other package is edited.

## Gate checked afresh

The clone base is `ea03e4c6caa79afc9c9ee7a49b579965c2ade755`.
Fresh main listings were read at atlas
`1d9a35d4fcca796fe0e97e34812d7dec1412ac56` and upstream
`4b002f622e9d68b627bdce9f6224897305a68bdc`.
They contain 75 atlas package entries and 50 upstream roadmap entries;
neither includes `AbelianSchemesAndArithmeticModuli` or
`StableReductionPartII`. The local queue lacks both exact package jobs;
`PKG-JacobianChallengePartII` still has `after: []`.
The Part II abelian-moduli package imports A1–A3 and cannot supply its parent.
Neither focus.json nor the Caraiani–Newton order declares the required
Jacobian/curve-moduli bundle.

| Required contract | Accepted input read | Action outside this job |
| --- | --- | --- |
| `AbelianSchemesAndArithmeticModuli:A1–A3` | The 89-node parent plan is accepted by `independent-review-REV-AbelianSchemesAndArithmeticModuli`, 2026-10-09. A1 supplies arbitrary-base abelian schemes, relative products and rigidity; A2 supplies both-axis-normalized Poincaré and biduality; A3 supplies nonzero finite locally free multiplication, including inseparable cases. | Supply the parent package as the lower-tier input. |
| `StableReductionPartII:MC.4/full-level` and `fine-level-scheme` | The 528-node plan is accepted by `independent-review-REV-DESIGN-StableReductionPartII~2`, 2026-10-10. Full level consumes JC1's Jacobian, base change and polarization. The fine-level scheme supplies the smooth projective universal curve on the exact cyclotomic symplectic component. | Declare the coupled bundle and supply the separate StableReductionPartII package for joint upstream submission. |

[WORKERS.md, Upstream tiers](../WORKERS.md#upstream-tiers) allows package
citations to libraries, own layers, bundle partners and lower-tier packages;
every depended roadmap must go upstream first or together in its declared
bundle. This job authorizes only its package files and handoff. Supplying the
missing packages or changing the bundle schedule would edit other jobs' files.
The checkpoint follows [WORKERS.md, Claiming](../WORKERS.md#claiming).
Another package-only continuation cannot remove this external gate.

The node chain is
`JC1 relative Jacobian → MC.4 full-level/fine-level scheme → JC7 application`.
A fresh topological sort visits **576 nodes and 1,313 explicit internal node
edges** across the two plans. This checks only the explicit node edges; it does
not expand stage references or establish external supplier closure. Do not add
reciprocal whole-package scheduling dependencies. Keep the fine-level supplier
out of Layers 0–5 and retain the noetherian construction followed by arbitrary
pullback in Layer 7.

## Current ownership and pinned interfaces

Read the current JacobianChallenge and AlgebraicVectorBundles READMEs in full,
and their suggested-file forms. The read-only roadmap checkout is
`070dc2becd74419e76303ede84b465ed4a69461f`; current Tau Ceti is
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
Searches by Picard, Jacobian, Poincaré, Hodge, group-scheme and line-class
structures include current roadmaps, Completed and current Tau Ceti.
JacobianChallenge Layers A–F own the field and pointed results.
AlgebraicVectorBundles L0B–L0C owns finite locally free duals and determinants;
StableReduction Layer 2 owns nodal coherent duality and base change.
Completed HodgeStructures concerns its existing Hodge structures; it does not
supply the stable relative Picard/invariant-differential comparison here.

Read current
[`LineBundle.Class`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/AlgebraicGeometry/LineBundle/Class.lean),
[`rigidifiedPicardFunctor`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/AlgebraicGeometry/PicardFunctor/Rigidified.lean#L66),
[`rigidifiedPicardPoint`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/AlgebraicGeometry/PicardFunctor/Point.lean#L40)
and the field
[`AbelianVariety`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean#L95)
carrier. The rigidified functor requires a chosen section; it does not prove
the section-free fppf quotient comparison or relative representability.
The abelian-variety carrier requires a field, rather than an arbitrary S.
The stable-reduction numerical-type Picard modules are lattice/cokernel
objects and do not represent the relative curve Picard functor.

The older compile pin has only the LineBundleClass commutative monoid and
lacks the current rigidified functor. Do not introduce current-only imports
into a file elaborated at that pin. This run therefore corrects the README's
current ownership contract while leaving its Mathlib-only native file intact.
The accepted plan's old-pin actual Picard-group supplier request needs its
owner to adopt the current declarations; this package does not change the
packet or pretend to alter its coverage status. No Lake command was run in
either read-only checkout.

## Sources checked in this run

Every public locator used by the targets was read in its named version.
The locators below identify mathematical ingredients, rather than certifying
all the relative descent proofs recorded as gaps in the accepted plan.

| Public source | Pages and results read | Limits preserved |
| --- | --- | --- |
| [Yuan, arXiv:2108.05625v4](https://arxiv.org/pdf/2108.05625v4), 30 April 2024, 125 pages | §2.2.1–2.2.2 pp. 29–32, Definition 2.4 and Proposition 2.6 proof; Theorem 2.10 and proof pp. 37–39; Lemma 3.4 and proof pp. 43–44; §4.6.2 pp. 96–98, the definitions and Theorem 4.17(5) proof; §A.3 p. 108; Theorem A.3 and proof pp. 109–110. | The arithmetic formulations have narrower base hypotheses. The generic algebraic recipes here use the exact earlier supplier and descent contracts. The d=0 finiteness exclusion remains necessary even though p. 29's informal sentence omits it. No Annals typeset collation is claimed. |
| [Dimitrov–Gao–Habegger, arXiv:2001.10276v3](https://arxiv.org/pdf/2001.10276v3), 49 pages | §6.1 pp. 23–25; universal Jacobian, (6.1), degree pieces and section-free map, Faltings–Zhang (6.3) and arbitrary base change (6.5). | Their fine-moduli setting is over Q. The integral cyclotomic symplectic component comes from MC.4, as the README says. |
| [Milne, Jacobian Varieties](https://www.jmilne.org/math/xnotes/JVs.pdf), 12 June 2021, 50 pages | §8 Theorem 8.1 p. 27 and family/base-change discussion p. 28. | Actual classes modulo base classes need not exhaust relative sections without a section. It gives family context, not a substitute for the full arbitrary-test-scheme descent proofs. |

Yuan v4 SHA-256: `a4e4c3d79e0912b62961a4b45b08e1e5c6957b0b64af7da74647c8ff9361e11e`.
DGH v3 SHA-256:
`5fc8e86f53ee43e9d18e8239a8db986bff74115ddb947abef4902a72dde338a4`.
The author-hosted Yuan PDF was unavailable through both direct retrieval and
browsing, which is why the README now uses the independently read arXiv version.
The older author's page-number convention survives only in the
[preceding handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/ea03e4c6caa79afc9c9ee7a49b579965c2ade755/research/blueprint/handoff/PKG-JacobianChallengePartII.md).

The cleared-library index was read. BLR, Néron Models, and
Mumford–Fogarty–Kirwan, Geometric Invariant Theory, are not cleared;
neither was obtained or read. BLR locators and their earlier proof receipts
are inherited, not newly source-verified. The representability/properness,
relative polarization, Leray and deformation-theory obligations remain in
the handoff's gap table below. No source passage or source file is stored in
the repository. A 14-word exact-prose overlap scan against the three public
PDF extractions found none; this is a limited mechanical check, not a full
copyright or source-faithfulness proof.

## Adversarial mathematical pass

Walked every target, identity and convention against its standing and explicit
hypotheses and its checks. The following table covers all 48 subsections.
Geometry rows record boundary-case reasoning and supplier obligations;
finite-group computations verify the coordinate/sign controls only. Neither
a successful `sorry` elaboration nor a finite-group computation completes a
scheme-level geometric proof.

| Targets | Instances and distinctions inspected | Outcome or retained obligation |
| --- | --- | --- |
| §0.1–§0.4 | Disconnected T with degrees 0 and 1; negative d; Pic⁰; genus-one period >1; actual bundle versus sheaf section | Constant-degree pieces remain separate; no origin or actual representative is inserted into a torsor. Full representability proof remains a supplier obligation. |
| §1.1–§1.4 | Pointed elliptic curve; sectionless genus-one curve; nilpotent base extension; one-nodal counterexample | Properness precedes the abelian carrier; polarization needs all-test-scheme descent. Nodal families are excluded from this smooth layer. |
| §2.1–§2.7 | d=0, −1, 1 and characteristic-p degree p; same point, swapped pair, three points; section acquired after base change | Finiteness retains d≠0; multiplication need not be étale. Difference is y−x. Pointed immersion and its descent remain an earlier proof obligation. |
| §3.1–§3.3 | Elliptic diagonal class; both zero axes; nontrivial base twist; no global degree-one α | P has the negative addition convention; Θ dualizes before diagonal pullback. Actual rigidifications remain data. |
| §3.4–§3.7 | g=1 and g=2; arbitrary translated α; diagonal restriction O(Δ)|Δ=ω_C⁻¹ | Degrees and signs agree: inverse-theta pullback has degree g; theta pullback gives ω_C for g=2. No canonical-root hypothesis is added. The arbitrary-α proof remains in the plan's gap list. |
| §3.8–§3.10 | Symmetric and nonsymmetric theta; elliptic Θ degree 2; simultaneous inversion | The doubling formula keeps the inversion term. Dualizing the negative diagonal class gives the positive twice-theta class. |
| §3.11–§3.13 | Identity section; nonreduced base; geometric fibre ampleness | Symmetry and zero normalization remain family identities; the ampleness conclusion uses properness and the noetherian fibre criterion. |
| §4.1–§4.2 | Y=S; degree zero on a curve; obstructed relative class; positive-degree pullback from one factor | Actual groups retain base classes and require both projection conditions. Relative sheaf points are not inserted as actual representatives. |
| §4.3–§4.5 | d=0, −1, 1; section of J versus absence of a section of X | Autoduality has its sign characterized by degree-one pullback. The Brauer sequence needs universal global functions. Torsion cokernel does not assert divisibility of all S-points. |
| §4.6–§4.7 | One-factor lift with a positive-degree restriction on the other projection | Such a lift fails the target. Preservation of both fibre conditions is a separate nonroutine obligation; no uniform exponent is asserted. |
| §4.8–§4.9 | Trivial class; nontrivial degree-zero axis pullback; pointed elliptic identity | Axis kernels differ from Pic⁰⁰ and from chosen rigidifications. The rational point is retained; the two-variable Albanese/seesaw proof remains required. |
| §5.1–§5.2 | g=1 boundary; zero translation; fixed first coordinate | The finite canonical Abel application uses g>1. The expressible c=0 shift is diagonal without claiming finiteness. |
| §5.3–§5.4 | m=1 and 2; diagonal tuple; changed origin; proper source/separated target | Source order and the unscaled tail survive. Native properness has the precise morphism-property inputs. |
| §5.5 | One, two and three factors in C5 and S3; both inverse composites; wrong left-hand restoration | The inverse restores tails on the right. S3 negative controls detect the incorrect order. This equivalence needs no commutativity. |
| §5.6 | m=1; exponents −2, −1, 0, 1, 2; characteristic dividing 2g−2; S3 powering | Empty tail gives identity. A nonempty zero tail map is not generally an isogeny. Commutativity remains on the group-homomorphism and factorization interfaces; scheme-property transfers require properties of [e]. |
| §6.1–§6.3 | Smooth and one-nodal fibres; arithmetic versus normalization genus; rank-g comparison before determinant | Semi-abelian G may be nonproper with varying toric rank. No constant-rank global torus extension is asserted. Relative duality/base-change is a supplier input. |
| §7.1–§7.2 | ℓ≥3 unit; exact pairing component; noninvertible ℓ; coarse space; nonnoetherian/nilpotent pullbacks | Full symplectic level and its cyclotomic base remain fixed. Generic construction precedes the universal moduli application. |

Scratch finite-group calculations passed **5,073 assertions**. S3 provides
108 negative cocycle cases without commutativity, 54 negative power-homomorphism
cases, and 18 failures of the incorrect left-hand inverse. No mathematical
statement was weakened or strengthened. The only library correction is the
current actual Picard class group contract described above.

## Validation in this run

- `python3 scripts/check_blueprint.py research/blueprint/packets/JacobianChallengePartII.json`:
  **0 errors, 0 warnings**. The accepted packet is unchanged: 48 nodes,
  60 APIs, 52 tests, 24 planets, 11 baseline declarations, 14 gaps and 13
  requests. Layers JC0–JC7 remain planned, none closed.
- Statement/API/check correspondence: **all retained**. Each of the 48 targets
  has a nearby source locator and *Needs* paragraph; each of eight layers
  has examples and dependencies. No forbidden catalogue fields or local
  paths occur in the README. All four definitions and all construction
  interfaces with tests retain at least three discriminating checks.
- `lean-check research/blueprint/packages/JacobianChallengePartII/Suggested.lean`:
  **exit 0, 76 warnings, all declaration uses sorry; zero errors or other
  warnings**. Available memory was 90 GiB. Mathlib is
  `082e2d37e8b0463410cdb532e111cd43d5a66174`; the shared helper identifies
  Tau Ceti `f790474`. The file imports Mathlib and is unchanged. This is
  representative signature elaboration, not proof or geometric closure.
- Submission path validation and `git diff --check`: pass; only the README
  and job handoff change. No review of our own work was claimed or written.

## Resume only when the gate changes

1. Supply the parent abelian-scheme package and declare the coupled bundle;
   supply its separate StableReductionPartII package. Do not claim this is
   fixed by another README-only continuation.
2. Recheck every dependency against the then-current upstream and libraries.
   Keep field/pointed theory and general vector-bundle operations with their
   existing owners, and use the current actual LineBundleClass group directly.
3. Keep the prose README, its 48 targets and all interfaces/checks. The target
   headings §k.n correspond to the accepted JCk nodes in the table below;
   only the presentation labels changed.
4. Add genuine geometric signatures when the supplier types permit them;
   representative omissions remain allowed by the binding package instructions.
   Do not replace them with arbitrary predicates or conclusion hypotheses.
5. Resolve any plan correction through its owner, repeat source, Lean and
   intake checks, and add `topic = "math.AG"` when the package can honestly
   be completed.

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
