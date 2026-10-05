# Final independent review: accepted planning pass

Issue [#526](https://github.com/CBirkbeck/tauceti-explorer/issues/526),
job `REV-AnabelianGeometryAndNonabelianChabauty`; Codex **codex-e9o9vg**, 2026-10-05.
This session did not write the blueprint. The final packet review accepts the
finished planning pass after a fresh audit of **every one of its 363 nodes**.
The checkpoint reports below retain their original attribution and describe
historical states; this verdict and the current coverage supersede their
unfinished-review and already-resolved-gap wording.

Acceptance does not close the roadmap: NC.0 and NC.3 remain `partial`, and
NC.1, NC.2, NC.4, NC.5 and NC.6 remain `not_read`. No stage is marked planned
or closed; all implementation statuses remain unchecked. The issue explicitly
permits acceptance of a budget-complete pass with honest, precise gaps.

## Counts and verdict

| Item | Final result |
| --- | --- |
| Nodes | 363: 309 verified, 54 corrected, 0 added, 0 unverifiable |
| Node kinds | 4 definitions, 60 constructions, 265 lemmas, 27 theorems, 7 comparisons |
| Pinned baseline declarations | All 160 confirmed in 70 modules; 0 removed or replaced |
| Definition/construction API and tests | All 321 API entries and 254 tests across 64 nodes checked |
| API and tests across all kinds | 341 API entries, 270 tests |
| Suggested active declarations/examples inspected | 725 |
| Source inventory | 28 source ids, 79 distinct source-id/locator/excerpt pairs |
| Requests / gaps / planets | 17 / 10 / 11; unchanged counts |
| Source issues | 1 confirmed preprint-only misprint, E1 |

`review.checked` contains a verdict and mathematical note for each node.
`independentReviewAudit` records the complete baseline table, fresh source URLs,
hashes and exact reading scopes, corrections and supplier checks. These are
fresh checks, not acceptance inferred from earlier checkpoints.

## Corrections in this review

1. Reconciled proof notes on `NC.3/functoriality`, `normal-h1-kernel`,
   `exact-sequence` and `central-extension` with the later quotient action,
   single-gauge image converse, named/embedded adapters and invariant-orbit
   classification. Preserved the distinction between image equality and
   conditional H¹ injectivity, and the genuine central H²/cochain gap.
2. Corrected obsolete progress caveats on the 24 native twisted-kernel nodes
   at positions 196–219 and the 26 quotient-comparison nodes at 220–245.
   Their mathematical contracts and Lean signatures are unchanged. Later
   constructions now supply the action and converse; a quotient map is still
   required for inverse continuity, while a single gauge lift needs only
   surjectivity for the mapped-fibre image statement.
3. Replaced the accumulated NC.3 remaining list with seven present obligations.
   Replaced the stale declaration/API-granularity gap with the actual cochain,
   additive comparison and transport gaps. This issue is **target level**:
   PROTOCOL §2 does not require splitting the verified target proofs further.
4. Added fresh confirmation of the Schmidt 1996 Proposition 15 degree diagram
   to the existing gap note. Degree pullback kills the selected H² class; it
   does not say the target H² group is zero.
5. Changed four historical `sourceVersions.kind` values from `arXiv` to the
   protocol's `preprint`, preserving URLs, dates, hashes and attribution.
6. Added confirmed source misprint E1 and fresh selected-source/version receipts.
   Added only a final review comment to the suggested Lean file. No active
   declaration, API, test, request, planet or owner was added or replaced.

The packet's `independentReviewAudit.nodeCorrections` lists all 54 node ids,
changed fields and reasons. No baseline citation was found to be a near miss
requiring replacement or a new node.

## Mathematical checks that determine acceptance

The nonabelian convention is c(gh)=c(g)(g•c(h)), with gauge
(u•c)(g)=u c(g)(g•u)⁻¹. All ordered gauge, source/coefficient and twist
calculations were checked against actual continuous cocycle and native orbit
carriers. The twist translation sends d to d(g)c(g), with target basepoint [c].
Noncommuting S₃ examples discriminate multiplication and inverse-gauge direction.
Same-N inflation injection uses an N-fixed gauge witness, rather than a witness
made fixed only after enlarging N. Compact/discrete finite-quotient descent and
the filtered-colimit argument do not extend to unipotent p-adic point topologies.

Kernel image exactness lifts one constant gauge element, then restricts the
inverse-gauge normalized cocycle. It never assumes a continuous section of an
arbitrary surjective coefficient map. Actual quotient comparisons retain their
quotient-map inverse-continuity hypothesis. An abstract kernel identification
uses a topological embedding and exact range; bare group injectivity would not
supply inverse continuity. Stabilizer correction uses x·t⁻¹ with t stabilizing
the source cocycle. Lift independence of invariant actions uses w·u⁻¹. The
invariant action on kernel H¹ need not preserve its neutral element. Its orbit
quotient classifies the fibre, so an inverse selects an orbit rather than a
unique kernel class. Injectivity means a trivial **action**, and need not mean
a trivial invariant group. The native inner-twisted version is supplied;
full named/embedded orbit transport and representative/stabilizer compatibility
remain precise follow-up obligations.

The central positive defect is the inverse of Kim's printed boundary, matching
Tau Ceti's positive additive d¹; this is a convention comparison, not source
errata. Continuous cochain/lift/representative independence and the canonical
additive conversion are mathematically sound sketches but have no supplied
typed interfaces. Their signatures remain explicitly omitted as PROTOCOL §13
requires. Nonempty topological torsors have orbit homeomorphisms and both action
compatibilities, with Uᵒᵖ implementing the right action. This supplies the stated
abstract classification; algebraic/filtered-affine descent is a separate gap.

The reserved `key/etale-k-pi-1` id occurs once. Its canonical ε compares full
profinite SGA π₁-cohomology to the associated finite locally constant abelian
sheaf in **all degrees n≥0** for the specified coefficient class. Full,
prime-supported and constant-Fₚ variants stay distinct. All six reserved sample
families appear: fields, P¹ obstruction, affine/positive-genus curves, Artin
M₀,n towers, products and the scoped raw comparison. A constant-Fₚ edge map is
not a justification for replacing full π₁ by maximal pro-p. The raw comparison
retains connected geometrically-unibranch variety hypotheses; broader raw
foundations are explicitly missing. The geometric Lean signatures are honestly
OMITTED until canonical comparison/site/fundamental-group interfaces exist.

The cohomological proof route uses all finite covers, all finite coefficients,
prime-field dévissage and genuinely nonzero positive-degree classes. Connected
prime covers and prime-power towers use the stated genus/degree hypotheses.
Separable descent uses eventual equality/vanishing at a further stage, not an
unproved injectivity of cohomology base change. Product covers are dominated by
rectangles through open finite-index subgroups, including nonnormal covers;
finite families include the H¹⊗H¹ contribution. The canonical Künneth and π₁
product inputs remain exact supplier requests. No unresolved contradiction
remains within the planned contracts.

## Sources and version boundaries

All 79 distinct cited locator/excerpt pairs were checked against freshly read
public texts. The packet distinguishes source statements from authored
abstract topological deductions. This is an audit of the **selected cited
passages**, not a whole-paper audit or certification of every transitive proof.
The following scope table is accompanied by exact downloaded-file SHA-256
receipts in `independentReviewAudit.sourceReads`.

| Public text | Fresh reading scope |
| --- | --- |
| [Kim Siegel arXiv v1](https://arxiv.org/pdf/math/0409456v1) | §1 printed pp.5–10, full selected Propositions 1–3 proofs, cochains/cocycles/gauges, coefficient functor, subgroup exactness and local-condition opening; p.10 display visually inspected |
| [Kim Albanese arXiv v4](https://arxiv.org/pdf/math/0510441v4) | Printed pp.4,19,25–26: H¹, connecting/representability sketch, restriction, local conditions and central Selmer-fibre passage |
| [Poonen author PDF](https://math.mit.edu/~poonen/papers/Qpoints.pdf) | Definition 1.3.14 and full Proposition 1.3.15 proof pp.11–12; §4.5 p.105; Remark 5.12.13 p.154 |
| [Schmidt–Stix published PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p05-p.pdf) | Lemma 2.1 statement and proof pp.821–823; §2.3 pp.826–828 including Lemma 2.7/Proposition 2.8 proofs; Definition 6.1/M₀,n p.845; A.16–A.18 pp.864–866 |
| [Farb–Kisin–Wolfson arXiv v2](https://arxiv.org/pdf/2110.05534v2) | §2.3.1 p.16; Lemma 3.2.2 p.24 and full proof |
| [Achinger 2014 arXiv v1](https://arxiv.org/pdf/1407.0337v1) | §§2.1–2.6 pp.5–6, Definition 3.3 and full Proposition 3.4 proof pp.7–9 |
| [Achinger 2017 version of record](https://link.springer.com/article/10.1007/s00222-017-0733-5) | §4 online HTML, Definition 4.1, Proposition 4.2 and Lemma 4.3 with full proofs; 4.4–4.5 for scope |
| [Schmidt 1996 published PDF](https://www.numdam.org/article/CM_1996__100_2_233_0.pdf) | Propositions 13–14 context p.242, full Proposition 15 proof pp.243–244; p.244 degree diagram visually inspected |
| Stacks Project | Full selected cited statements/proofs at the eleven tags below; transitive generic suppliers remain recorded |

- [03QQ](https://stacks.math.columbia.edu/tag/03QQ): Section 59.59, Lemmas 59.59.1–2, selected sheaf/module and cohomology-of-a-point statements and full proofs.
- [03RQ](https://stacks.math.columbia.edu/tag/03RQ): Lemma 59.69.1, smooth projective curve cohomology with invertible torsion, statement and full Kummer proof.
- [03RR](https://stacks.math.columbia.edu/tag/03RR): Lemma 59.69.3, smooth affine curve vanishing, statement and full proof.
- [0AMB](https://stacks.math.columbia.edu/tag/0AMB): Lemma 59.69.2, degree pullback on H², statement and full Kummer-boundary proof.
- [03RP](https://stacks.math.columbia.edu/tag/03RP): Proposition 39.9.11, especially (7) and surrounding proof: abelian-variety multiplication and torsion over an algebraically closed field.
- [09YQ](https://stacks.math.columbia.edu/tag/09YQ): Theorem 59.51.3, cohomology continuity for directed qcqs schemes with affine transitions, statement and complete printed proof. The generic inverse-site Lemma 21.16.6 remains a supplier proof leaf.
- [03RV](https://stacks.math.columbia.edu/tag/03RV): Lemma 59.64.4, finite locally constant sheaf representability and descent, statement and full printed proof.
- [07RR](https://stacks.math.columbia.edu/tag/07RR): Lemma 32.8.15, morphism-property descent, full statement and proof in the directed affine-transition setting.
- [01ZM](https://stacks.math.columbia.edu/tag/01ZM): Lemma 32.10.1, finite-presentation objects, morphisms and eventual equality: full statement and all three printed proofs.
- [0F13](https://stacks.math.columbia.edu/tag/0F13): Section 59.97, canonical comparison in Lemma 59.97.8 and full Lemma 59.97.9 proof; transitive base-change/field-complex inputs remain requested.
- [03SB](https://stacks.math.columbia.edu/tag/03SB): Lemma 59.83.2 and surrounding constant-coefficient curve context, full selected proof; not every transitive vanishing input.

No Serre reading, full-paper reading, or unpublished raw-homotopy supplier
closure is asserted. Historical broader `readSections` claims keep their original
attribution; the fresh scope above is independently auditable.

### Confirmed source issue E1

In [Kim arXiv v1](https://arxiv.org/pdf/math/0409456v1), proof of Proposition 3,
printed p.10, the final product isomorphism prints
H⁰(G,U_(n+1)^B/U_(n+1)) ≃ H⁰(G,U_n^B/U_n) × I_n.
The first factor on the right should be **H⁰(G,V^B/V)**,
where V=U^(n+1)/U^(n+2). The exact sequence immediately above has that
vector-group kernel and image I_n; the chosen section trivializes this kernel
torsor. The previous-stage ambient base is not its kernel. The PDF text and
page image agree. This is a clear product-factor misprint; the intended
representability result is unchanged (`affects: nothing`).

The [arXiv history](https://arxiv.org/abs/math/0409456) lists only v1.
The [author's publications page](https://www.minhyongkim.net/research/academic-publications)
and [publisher page](https://link.springer.com/article/10.1007/s00222-004-0433-9)
showed no correction for this paper, and title/identifier correction searches
found none. That is the scope of `known: new`, not an exhaustive novelty claim.
The publisher served subscription metadata/preview only: **E1 is confined to
the preprint**, with no accusation about the version of record. The packet
records the exact version/hash and independent confirmed verdict under §18.
A future representability plan must use the corrected factor.

## Supplier, ownership and coverage audit

Read all reviewed NC.0–NC.6 layer targets in `data/library-coverage.json` and
the relevant IG.0/IG.1/SF.2/SF.3 boundaries. Existing ContinuousCohomology,
SheafH, native quotient groups/cosets/actions/topologies, filtered colimits,
fixed subgroups and torsors are reused rather than redefined as generic theory.
No new owner, retired supplier or duplicate library target is introduced.
Planets remain the six NC.3 and five NC.0 landmarks, within the six-per-layer
limit, and the reserved key-definition sample API is retained.

Fresh supplier packet checks found:

- IG.0/IG.1 have no nodes in the partial InverseGalois packet. Its precise
  finite-étale/fundamental-group and arithmetic exact-sequence remaining
  obligations match the requests here. These requested exports are not
  claimed as established inputs.
- The accepted SchemesAndFoundations packet's actual SF.2 nodes concern
  Azumaya/Brauer/coherent-duality/equivariant-sheaf work. They do not supply
  the requested canonical finite-coefficient comparison, Kummer/base-change,
  curve or limit interfaces. SF.3 has no packet nodes. The exact requests
  and transitive generic proof leaves remain open.
- The AbelianSchemes A2 Rosati and A6 Hom/Néron–Severi contracts were read.
  Generic finite-generation work is not repeated. The specified A2
  algebraic-equivalence quotient and Néron–Severi comparison/injection are
  still needed by the routed quadratic-Chabauty work.

The seven current NC.3 obligations cover additive/cochain conversion,
central H², unipotent point topologies/algebraic inputs, geometric
representability and filtered-affine torsors, Selmer local conditions,
remaining orbit transport, and routed geometric/source obligations. NC.0
coverage retains its exact site/π₁/ε, raw-homotopy, curve, product, fibration,
moduli and routed-paper gaps. Acceptance does not claim to finish these.

## Validation and practical limitation

`python3 scripts/check_blueprint.py` on the final packet: **0 errors,
0 warnings**. The §18 source-issue and version-schema checks also pass.
All 363 node ids have exactly one final review verdict, every one of the 160
baseline entries has a fresh receipt, all implementations remain unchecked,
and the diff is confined to the three deliverables plus this job's handoff.

The full suggested file was attempted with `lean-check` and failed before
elaboration because the shared build lacks
`TauCeti.RepresentationTheory.Homological.ContCohomology.LowDegree.olean`.
No library was built or updated. With more than 20 GB available, a temporary
projection in the authorized suggested-file path removed every `import
TauCeti.` line and **only** `section Abelian` through `end Abelian` (original
lines 169–193). It retained `AbelianTwistingTest`. `lean-check` exited **0**
with **693 warnings, all declaration-uses-sorry**, and no errors or other
warnings. The original active code was restored byte for byte before the
final comment receipt was added. The full additive comparisons were **not
compiled**, and admitted signatures/tests do not prove the planned results.
No Lean process remains running. Historical encoded recovery comments were
preserved without decoding or executing them.

## Questions for the orchestrator

No question blocks acceptance of this planning pass. Follow-up jobs should use
the current coverage lists, import the precise missing supplier contracts,
and carry the existing stronger API/tests into the reader when that path is
authorized. A future Kim representability/source-collation job should compare
E1 with the accessible version of record and record whether it is corrected
there. The full suggested file still needs a check when the pinned Tau Ceti
object is available; the successful projection does not settle that boundary.

## Fresh complete baseline table

Every row was read at the indicated pin with namespace and ambient hypotheses,
and checked against its actual citing node contracts. Generated declarations
(e.g. `to_dual`) were checked through their native generating declarations.
The shared Tau Ceti HEAD differs from the pin; exact pinned source was read
with `git show`, not inferred from that HEAD. The table's line anchors locate
the source context; the packet records what each declaration supplies.

| # | Declaration | Exact pinned source |
| --- | --- | --- |
| 0 | `mathlib:ContinuousMap` | [Defs.lean:33](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/ContinuousMap/Defs.lean#L33) |
| 1 | `mathlib:ContinuousMonoidHom` | [ContinuousMonoidHom.lean:57](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/ContinuousMonoidHom.lean#L57) |
| 2 | `mathlib:ContinuousSMul` | [MulAction.lean:46](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/MulAction.lean#L46) |
| 3 | `mathlib:FixedPoints.subgroup` | [Defs.lean:203](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/Defs.lean#L203) |
| 4 | `mathlib:IsTopologicalGroup` | [Defs.lean:110](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Group/Defs.lean#L110) |
| 5 | `mathlib:MulAction.QuotientAction` | [Quotient.lean:52](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/Quotient.lean#L52) |
| 6 | `mathlib:MulAction.orbitRel` | [Defs.lean:287](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/Defs.lean#L287) |
| 7 | `mathlib:MulAction.orbitRel.Quotient` | [Defs.lean:349](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/Defs.lean#L349) |
| 8 | `mathlib:MulAction.toPerm` | [Basic.lean:34](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Action/Basic.lean#L34) |
| 9 | `mathlib:MulAut.conj` | [End.lean:723](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/End.lean#L723) |
| 10 | `mathlib:MulDistribMulAction` | [Defs.lean:629](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Action/Defs.lean#L629) |
| 11 | `mathlib:MulDistribMulAction.toMulAut` | [End.lean:232](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Action/End.lean#L232) |
| 12 | `mathlib:Multiplicative` | [Basic.lean:46](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/TypeTags/Basic.lean#L46) |
| 13 | `mathlib:QuotientGroup.Quotient.group` | [Defs.lean:72](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/QuotientGroup/Defs.lean#L72) |
| 14 | `mathlib:QuotientGroup.continuous_mk` | [Quotient.lean:44](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Group/Quotient.lean#L44) |
| 15 | `mathlib:QuotientGroup.isOpenMap_coe` | [Quotient.lean:52](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Group/Quotient.lean#L52) |
| 16 | `mathlib:Subgroup.Normal` | [Defs.lean:604](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Defs.lean#L604) |
| 17 | `mathlib:Subgroup.center` | [Center.lean:30](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/Subgroup/Center.lean#L30) |
| 18 | `mathlib:Topology.IsQuotientMap` | [Induced.lean:166](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Defs/Induced.lean#L166) |
| 19 | `mathlib:groupCohomology.IsMulCocycle₁` | [LowDegree.lean:621](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupCohomology/LowDegree.lean#L621) |
| 20 | `tauceti:TauCeti.ContCohomology.B1` | [LowDegree.lean:174](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean#L174) |
| 21 | `tauceti:TauCeti.ContCohomology.B2` | [LowDegree.lean:494](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean#L494) |
| 22 | `tauceti:TauCeti.ContCohomology.H0` | [LowDegree.lean:326](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean#L326) |
| 23 | `tauceti:TauCeti.ContCohomology.H1` | [LowDegree.lean:674](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean#L674) |
| 24 | `tauceti:TauCeti.ContCohomology.H1EquivOfSmulEqSelf` | [LowDegree.lean:840](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean#L840) |
| 25 | `tauceti:TauCeti.ContCohomology.H1pi` | [LowDegree.lean:679](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean#L679) |
| 26 | `tauceti:TauCeti.ContCohomology.H2` | [LowDegree.lean:730](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean#L730) |
| 27 | `tauceti:TauCeti.ContCohomology.H2pi` | [LowDegree.lean:735](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean#L735) |
| 28 | `tauceti:TauCeti.ContCohomology.Z1` | [LowDegree.lean:485](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean#L485) |
| 29 | `tauceti:TauCeti.ContCohomology.Z2` | [LowDegree.lean:488](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean#L488) |
| 30 | `tauceti:TauCeti.ContCohomology.d0` | [LowDegree.lean:167](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean#L167) |
| 31 | `tauceti:TauCeti.ContCohomology.d1` | [LowDegree.lean:228](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean#L228) |
| 32 | `mathlib:AlgebraicGeometry.Scheme` | [Scheme.lean:42](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Scheme.lean#L42) |
| 33 | `mathlib:AlgebraicGeometry.IsLocallyNoetherian` | [Noetherian.lean:56](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Noetherian.lean#L56) |
| 34 | `mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology` | [Etale.lean:50](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Sites/Etale.lean#L50) |
| 35 | `mathlib:continuousCohomology` | [Basic.lean:131](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean#L131) |
| 36 | `mathlib:CategoryTheory.PreGaloisCategory.IsFundamentalGroup` | [IsFundamentalgroup.lean:232](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Galois/IsFundamentalgroup.lean#L232) |
| 37 | `mathlib:CommAlgCat.FiniteEtale` | [Finite.lean:58](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Etale/Finite.lean#L58) |
| 38 | `mathlib:CommAlgCat.FiniteEtale.fiber` | [Finite.lean:118](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Etale/Finite.lean#L118) |
| 39 | `mathlib:Topology.IsEmbedding.continuous_iff` | [Basic.lean:124](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Maps/Basic.lean#L124) |
| 40 | `mathlib:MulAction.quotient` | [Quotient.lean:83](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/Quotient.lean#L83) |
| 41 | `mathlib:MulAction.Quotient.smul_mk` | [Quotient.lean:93](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/Quotient.lean#L93) |
| 42 | `mathlib:MulAction.fixedPoints` | [Defs.lean:116](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/Defs.lean#L116) |
| 43 | `mathlib:MulAction.mem_fixedPoints` | [Defs.lean:133](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/Defs.lean#L133) |
| 44 | `mathlib:QuotientGroup.eq` | [Defs.lean:198](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/Coset/Defs.lean#L198) |
| 45 | `mathlib:QuotientGroup.out_eq'` | [Defs.lean:204](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/Coset/Defs.lean#L204) |
| 46 | `mathlib:QuotientGroup.mk_out_eq_mul` | [Defs.lean:216](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/Coset/Defs.lean#L216) |
| 47 | `mathlib:QuotientGroup.leftRel_apply` | [Defs.lean:71](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/Coset/Defs.lean#L71) |
| 48 | `mathlib:MulAction.left_quotientAction` | [Quotient.lean:67](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/Quotient.lean#L67) |
| 49 | `mathlib:groupCohomology.coindIso` | [Shapiro.lean:59](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupCohomology/Shapiro.lean#L59) |
| 50 | `tauceti:TauCeti.ContCohomology.explicitShapiro0` | [Shapiro.lean:120](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/Shapiro.lean#L120) |
| 51 | `tauceti:TauCeti.ContCohomology.explicitShapiro1` | [Shapiro.lean:372](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/Shapiro.lean#L372) |
| 52 | `tauceti:TauCeti.ContCohomology.exists_openNormalSubgroup_descendZ2` | [DegreeTwoDescent.lean:96](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/FiniteQuotient/DegreeTwoDescent.lean#L96) |
| 53 | `tauceti:TauCeti.ContCohomology.exists_explicitInfl2_eq` | [DegreeTwoDescent.lean:108](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/FiniteQuotient/DegreeTwoDescent.lean#L108) |
| 54 | `tauceti:TauCeti.openActionKernel` | [Discrete.lean:133](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/Discrete.lean#L133) |
| 55 | `mathlib:ZMod.instIsSimpleAddGroup` | [Cyclic.lean:282](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/SpecificGroups/Cyclic.lean#L282) |
| 56 | `mathlib:ZMod.card` | [Defs.lean:166](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/ZMod/Defs.lean#L166) |
| 57 | `mathlib:ZMod.natCast_self` | [Basic.lean:145](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/ZMod/Basic.lean#L145) |
| 58 | `mathlib:ZMod.addOrderOf_one` | [Basic.lean:122](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/ZMod/Basic.lean#L122) |
| 59 | `mathlib:ZMod.unitOfCoprime` | [Basic.lean:794](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/ZMod/Basic.lean#L794) |
| 60 | `mathlib:ZMod.coe_unitOfCoprime` | [Basic.lean:798](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/ZMod/Basic.lean#L798) |
| 61 | `mathlib:Nat.card_zmod` | [Finite.lean:249](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/SetTheory/Cardinal/Finite.lean#L249) |
| 62 | `mathlib:Subgroup.prod` | [Basic.lean:89](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Basic.lean#L89) |
| 63 | `mathlib:Subgroup.prod_le_iff` | [Basic.lean:137](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Basic.lean#L137) |
| 64 | `mathlib:Subgroup.map_le_iff_le_comap` | [Map.lean:196](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Map.lean#L196) |
| 65 | `mathlib:OpenSubgroup.comap` | [OpenSubgroup.lean:217](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/OpenSubgroup.lean#L217) |
| 66 | `mathlib:OpenSubgroup.prod` | [OpenSubgroup.lean:160](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/OpenSubgroup.lean#L160) |
| 67 | `mathlib:Subgroup.quotient_finite_of_isOpen` | [OpenSubgroup.lean:289](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/OpenSubgroup.lean#L289) |
| 68 | `mathlib:MonoidHom.eqLocus` | [Ker.lean:388](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Ker.lean#L388) |
| 69 | `mathlib:ConjAct` | [ConjAct.lean:43](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/ConjAct.lean#L43) |
| 70 | `mathlib:ConjAct.toConjAct` | [ConjAct.lean:76](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/ConjAct.lean#L76) |
| 71 | `mathlib:ConjAct.toConjAct_smul` | [ConjAct.lean:133](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/ConjAct.lean#L133) |
| 72 | `mathlib:Subgroup` | [Defs.lean:296](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Defs.lean#L296) |
| 73 | `mathlib:IsTopologicalGroup.exist_openNormalSubgroup_sub_clopen_nhds_of_one` | [ClopenNhdofOne.lean:31](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/ClopenNhdofOne.lean#L31) |
| 74 | `mathlib:isClopen_discrete` | [Clopen.lean:123](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Clopen.lean#L123) |
| 75 | `mathlib:IsClopen.preimage` | [Clopen.lean:90](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Clopen.lean#L90) |
| 76 | `mathlib:isClopen_iInter_of_finite` | [Clopen.lean:78](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Clopen.lean#L78) |
| 77 | `mathlib:Subgroup.Normal.conj_mem'` | [Defs.lean:638](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Defs.lean#L638) |
| 78 | `mathlib:FixedPoints.mem_subgroup` | [Defs.lean:208](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/Defs.lean#L208) |
| 79 | `tauceti:TauCeti.ContCohomology.descendZ1` | [Inflation.lean:291](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/Inflation.lean#L291) |
| 80 | `tauceti:TauCeti.ContCohomology.coe_descendZ1_apply_mk` | [Inflation.lean:315](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/Inflation.lean#L315) |
| 81 | `tauceti:TauCeti.ContCohomology.explicitInfl1_descendZ1` | [Inflation.lean:323](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/Inflation.lean#L323) |
| 82 | `mathlib:QuotientGroup.induction_on` | [Defs.lean:172](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/Coset/Defs.lean#L172) |
| 83 | `mathlib:MulAction.coe_quotient_smul_fixedPoints` | [OfQuotient.lean:34](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/OfQuotient.lean#L34) |
| 84 | `mathlib:coe_smul_fixedPoints_of_normal` | [SubMulAction.lean:612](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/SubMulAction.lean#L612) |
| 85 | `mathlib:QuotientGroup.eq_one_iff` | [Defs.lean:120](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/QuotientGroup/Defs.lean#L120) |
| 86 | `mathlib:QuotientGroup.mk_mul` | [Defs.lean:163](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/QuotientGroup/Defs.lean#L163) |
| 87 | `mathlib:QuotientGroup.isQuotientMap_mk` | [Quotient.lean:40](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Group/Quotient.lean#L40) |
| 88 | `mathlib:Topology.IsQuotientMap.continuous_iff` | [Basic.lean:124](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Maps/Basic.lean#L124) |
| 89 | `mathlib:MulAction.orbitRel_apply` | [Defs.lean:294](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/Defs.lean#L294) |
| 90 | `mathlib:MulAction.mem_orbit_iff` | [Defs.lean:55](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/Defs.lean#L55) |
| 91 | `mathlib:inv_smul_smul` | [Defs.lean:499](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Action/Defs.lean#L499) |
| 92 | `mathlib:continuous_subtype_val` | [Constructions.lean:380](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Constructions.lean#L380) |
| 93 | `mathlib:Continuous.comp` | [Continuous.lean:115](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Continuous.lean#L115) |
| 94 | `mathlib:Subgroup.continuousSMul` | [MulAction.lean:75](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/MulAction.lean#L75) |
| 95 | `mathlib:QuotientGroup.isOpenQuotientMap_mk` | [Quotient.lean:55](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Group/Quotient.lean#L55) |
| 96 | `mathlib:IsOpenQuotientMap.prodMap` | [SumProd.lean:179](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Constructions/SumProd.lean#L179) |
| 97 | `mathlib:IsOpenQuotientMap.id` | [OpenQuotient.lean:35](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Maps/OpenQuotient.lean#L35) |
| 98 | `mathlib:IsOpenQuotientMap.continuous_comp_iff` | [OpenQuotient.lean:64](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Maps/OpenQuotient.lean#L64) |
| 99 | `mathlib:continuous_induced_rng` | [Order.lean:781](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Order.lean#L781) |
| 100 | `mathlib:Continuous.smul` | [MulAction.lean:108](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/MulAction.lean#L108) |
| 101 | `mathlib:continuous_fst` | [SumProd.lean:68](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Constructions/SumProd.lean#L68) |
| 102 | `mathlib:continuous_snd` | [SumProd.lean:104](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Constructions/SumProd.lean#L104) |
| 103 | `mathlib:Equiv.ofBijective` | [Defs.lean:820](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Logic/Equiv/Defs.lean#L820) |
| 104 | `mathlib:Equiv.apply_symm_apply` | [Defs.lean:248](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Logic/Equiv/Defs.lean#L248) |
| 105 | `mathlib:Equiv.symm_apply_apply` | [Defs.lean:250](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Logic/Equiv/Defs.lean#L250) |
| 106 | `mathlib:Equiv.injective` | [Defs.lean:178](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Logic/Equiv/Defs.lean#L178) |
| 107 | `mathlib:CategoryTheory.Limits.Types.FilteredColimit.isColimitOf` | [Filtered.lean:59](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Limits/Types/Filtered.lean#L59) |
| 108 | `mathlib:OpenNormalSubgroup.instSemilatticeInfOpenNormalSubgroup` | [OpenSubgroup.lean:421](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/OpenSubgroup.lean#L421) |
| 109 | `mathlib:CategoryTheory.IsFiltered` | [Basic.lean:95](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Filtered/Basic.lean#L95) |
| 110 | `mathlib:CategoryTheory.Limits.IsLimit.conePointUniqueUpToIso` | [IsLimit.lean:159](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Limits/IsLimit.lean#L159) |
| 111 | `mathlib:CategoryTheory.Limits.IsLimit.conePointUniqueUpToIso_inv_comp` | [IsLimit.lean:168](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Limits/IsLimit.lean#L168) |
| 112 | `mathlib:CategoryTheory.Limits.limit.isLimit` | [HasLimits.lean:217](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Limits/HasLimits.lean#L217) |
| 113 | `mathlib:CategoryTheory.Iso.toEquiv` | [Basic.lean:416](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Types/Basic.lean#L416) |
| 114 | `tauceti:TauCeti.ContCohomology.explicitFiniteQuotientTransition1` | [Explicit.lean:150](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/FiniteQuotient/Explicit.lean#L150) |
| 115 | `tauceti:TauCeti.ContCohomology.explicitFiniteQuotientColimit1` | [Colimit.lean:493](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/FiniteQuotient/Colimit.lean#L493) |
| 116 | `mathlib:MonoidHom.comp` | [Defs.lean:766](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Hom/Defs.lean#L766) |
| 117 | `mathlib:MonoidHom.id` | [Defs.lean:736](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Hom/Defs.lean#L736) |
| 118 | `mathlib:MonoidHom.comp_apply` | [Defs.lean:798](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Hom/Defs.lean#L798) |
| 119 | `mathlib:MonoidHom.one_apply` | [Defs.lean:1023](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Hom/Defs.lean#L1023) |
| 120 | `mathlib:map_mul` | [Defs.lean:326](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Hom/Defs.lean#L326) |
| 121 | `mathlib:map_inv` | [Defs.lean:440](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Hom/Defs.lean#L440) |
| 122 | `mathlib:map_one` | [Defs.lean:234](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Hom/Defs.lean#L234) |
| 123 | `mathlib:Subgroup.subtype` | [Defs.lean:223](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Defs.lean#L223) |
| 124 | `mathlib:MulDistribMulAction.compHom` | [End.lean:39](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/GroupWithZero/Action/End.lean#L39) |
| 125 | `mathlib:MulAction.continuousSMul_compHom` | [MulAction.lean:252](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/MulAction.lean#L252) |
| 126 | `mathlib:MulEquiv.refl` | [Defs.lean:259](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Equiv/Defs.lean#L259) |
| 127 | `mathlib:Quotient.congr` | [Defs.lean:854](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Logic/Equiv/Defs.lean#L854) |
| 128 | `mathlib:Equiv.trans` | [Defs.lean:161](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Logic/Equiv/Defs.lean#L161) |
| 129 | `mathlib:Equiv.symm` | [Defs.lean:145](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Logic/Equiv/Defs.lean#L145) |
| 130 | `mathlib:MulEquiv.trans` | [Defs.lean:405](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Equiv/Defs.lean#L405) |
| 131 | `mathlib:MulEquiv.symm` | [Defs.lean:285](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Equiv/Defs.lean#L285) |
| 132 | `mathlib:MulEquiv.symm_apply_apply` | [Defs.lean:328](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Equiv/Defs.lean#L328) |
| 133 | `mathlib:MonoidHom.ker` | [Ker.lean:238](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Ker.lean#L238) |
| 134 | `mathlib:MonoidHom.mem_ker` | [Ker.lean:249](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Ker.lean#L249) |
| 135 | `mathlib:QuotientGroup.quotientKerEquivOfSurjective` | [Basic.lean:159](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/QuotientGroup/Basic.lean#L159) |
| 136 | `mathlib:Homeomorph.isQuotientMap` | [Defs.lean:241](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Homeomorph/Defs.lean#L241) |
| 137 | `mathlib:Topology.IsQuotientMap.comp` | [Basic.lean:73](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Maps/Basic.lean#L73) |
| 138 | `mathlib:QuotientGroup.mk'` | [Defs.lean:88](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/QuotientGroup/Defs.lean#L88) |
| 139 | `mathlib:QuotientGroup.mk_surjective` | [Defs.lean:165](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/Coset/Defs.lean#L165) |
| 140 | `mathlib:Continuous.subtype_mk` | [Constructions.lean:416](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Constructions.lean#L416) |
| 141 | `mathlib:MulEquiv` | [Defs.lean:75](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Equiv/Defs.lean#L75) |
| 142 | `mathlib:MonoidHom.ofInjective` | [Ker.lean:205](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Ker.lean#L205) |
| 143 | `mathlib:Topology.IsEmbedding.continuous` | [Basic.lean:133](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Maps/Basic.lean#L133) |
| 144 | `mathlib:Topology.IsInducing.isTopologicalGroup` | [Basic.lean:227](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Group/Basic.lean#L227) |
| 145 | `mathlib:MulAction.stabilizer` | [Defs.lean:515](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/Defs.lean#L515) |
| 146 | `mathlib:MulAction.mem_stabilizer_iff` | [Defs.lean:524](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/Defs.lean#L524) |
| 147 | `mathlib:MonoidHom.liftOfSurjective` | [Basic.lean:941](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Basic.lean#L941) |
| 148 | `mathlib:MonoidHom.liftOfRightInverse_comp_apply` | [Basic.lean:946](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Basic.lean#L946) |
| 149 | `mathlib:MulAction.toPermHom` | [End.lean:184](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Action/End.lean#L184) |
| 150 | `mathlib:MulAction.compHom` | [Hom.lean:48](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Action/Hom.lean#L48) |
| 151 | `mathlib:Equiv.Perm.sign` | [Sign.lean:357](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/Perm/Sign.lean#L357) |
| 152 | `mathlib:Equiv.Perm.sign_surjective` | [Sign.lean:424](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/Perm/Sign.lean#L424) |
| 153 | `mathlib:Set.equivOfEq` | [Set.lean:51](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Logic/Equiv/Set.lean#L51) |
| 154 | `mathlib:Equiv.subtypeEquiv` | [Basic.lean:263](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Logic/Equiv/Basic.lean#L263) |
| 155 | `mathlib:Homeomorph` | [Defs.lean:43](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Homeomorph/Defs.lean#L43) |
| 156 | `mathlib:Torsor` | [Defs.lean:70](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Torsor/Defs.lean#L70) |
| 157 | `mathlib:IsTopologicalTorsor` | [Torsor.lean:35](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Group/Torsor.lean#L35) |
| 158 | `mathlib:Homeomorph.smulConst` | [Torsor.lean:100](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Group/Torsor.lean#L100) |
| 159 | `mathlib:MulOpposite.opHomeomorph` | [Constructions.lean:50](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Constructions.lean#L50) |

---

# Historical checkpoints (superseded by the final verdict above)

# Independent review checkpoint: cocycle foundations and map naturality

Issue [#526](https://github.com/CBirkbeck/tauceti-explorer/issues/526), job
`REV-AnabelianGeometryAndNonabelianChabauty`; Codex `codex-m9Qr3w`, 2026-10-05.
Input explorer revision `e944b1df8e7f100d50bf3de50ef3e38ae054040d`.
This session did not author the blueprint. Earlier checkpoints, including
[#6184](https://github.com/CBirkbeck/tauceti-explorer/pull/6184), are retained below
with their original attribution and in `independentReviewCheckpoints`.

**Checkpoint; the independent review remains unfinished.** Fresh scope is
80 nodes at zero-based packet positions 0–13, 26–36 and 101–155: cocycles,
orbit H¹, subgroup connecting maps, fixed cosets, coefficient/source maps,
inner twisting and coefficient naturality. Every row below records a fresh
calculation of its stated mathematics, hypotheses, proof sketch, declared
inputs and suggested signature. Definition/construction APIs and tests in
these families were read. Node 362 was also read as the topological torsor
supplier. This is not a final per-node verification of transitive closure.
No top-level packet `review` object or acceptance verdict is added.

Counts: 363 nodes (4 definitions, 60 constructions, 265 lemmas, 27 theorems,
7 comparisons), 160 baseline declarations, 17 requests, 10 gaps, 11 planets.
Definition/construction APIs: 321; their tests: 254. Across all node kinds:
341 API entries and 270 tests. No nodes, gaps, requests or planets added;
all implementations remain unchecked. NC.0/NC.3 stay partial; NC.1/NC.2/
NC.4/NC.5/NC.6 stay not_read. The packet's complete status denotes its
budget-complete planning pass, not review completion or mathematical closure.

## Corrections and discriminators

1. The original factor-order example quantified over an unrelated ordinary
   homomorphism and did not use Z¹. It now tests the actual explicitly
   constructed identity continuous cocycle on discrete S₃. For g=(01),
   h=(12), c(gh)=c(g)c(h) and c(gh)≠c(h)c(g). This arithmetic is proved
   without admissions. The specified trivial action makes these precisely
   the ordered and swapped cocycle expressions. An initial raw scalar
   spelling selected Lean's native multiplication action on S₃ acting on
   itself; the final test avoids that instance ambiguity.
2. `Twist.toOriginal` now uses pinned native `MulEquiv.refl U`. The earlier
   admitted equivalence had no equation specifying the identity on its
   underlying synonym. Added `Twist.toOriginal_apply` to the packet API and
   suggested signatures. Twisting still changes the G-action.
3. Added an actual forward-map test for τ_c. With identity cocycle c:S₃→S₃,
   x=(01), twisted coboundary d(h)=x(h⋆x)⁻¹ and g=(12), τ_c(d)(g)=xgx⁻¹
   differs from c(g)j_c(d(g)). Indeed d(g)=xgx⁻¹g⁻¹, so d(g)c(g)=xgx⁻¹
   whereas c(g)d(g)=gxgx⁻¹g⁻¹; their values differ. This prototype test is
   admitted, and its mathematical calculation discriminates the forward
   multiplication order. Inverse laws alone would allow a changed bijection.
4. Normalized two connecting-cocycle test-kind labels from base-case/comparison
   to degenerate/compatibility. Their mathematical statements are unchanged.

No reader, supplier packet, atlas data or author handoff is changed.
Reader reconciliation should carry the stronger tests and underlying-identity
API when authorized. Historical encoded payloads remain unchanged; they were
not decoded or executed.

## Sources, version boundaries and closure

Freshly read the exact [Kim Siegel arXiv v1 PDF](https://arxiv.org/pdf/math/0409456v1),
printed pp.5–10, including Proposition 1 and its entire proof, the ordered
cocycle/gauge definitions, coefficient-functor passage, central-extension
argument and subgroup exactness. SHA-256:
`00efa6e96091d564f7afa2ad9fb917a34cc0a55b7e258164383519b4e93ba941`.
The general topological exactness and functor/twist statements are authored
deductions from these conventions, as their matches say; they are not new
numbered theorems in Kim. The positive central defect remains the inverse of
Kim's printed dc, matching Tau Ceti's d¹. This is a convention difference.

Freshly read the exact [Kim Albanese arXiv v4 PDF](https://arxiv.org/pdf/math/0510441v4),
printed pp.4,19,25–26, checking the selected H¹ motivation, crystalline
connecting map, restriction and central-fibre passages. SHA-256:
`7b404331925f1d8e9bce81e9b16473f0d65a7f1ac2948ccff0db3a6e7b0d0f19`.
No full-paper, published-version collation or source-error absence is certified.
The [Poonen supplementary PDF](https://math.mit.edu/~poonen/papers/Qpoints.pdf)
was requested both directly and through the browser, but timed out. This pass
has not freshly verified its locators on nodes 0,12,13; previous readings keep
their original attribution. Serre was not freshly read.

The 80 nodes use 52 distinct baseline references. Their exact qualified
statements and ambient assumptions were read at the packet pins, together
with five native torsor inputs. The table below links these 57 declarations.
The Mathlib shared source is exactly `082e2d37e8b0463410cdb532e111cd43d5a66174`.
The shared Tau Ceti tree is at `cf386627e9176a3827c1a5fe804989fd94a4d216`, so
its source was not used to assert the baseline. Instead the exact
[LowDegree source at f790474](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean)
was fetched and read. In particular B² is d¹ of continuous cochains, H¹ uses
B¹ inside Z¹, H² uses B² inside Z², and the additive cocycle comparison is
only a comparison of pointed carriers. There is no all-160 fresh audit here.

All seven layer descriptions and their reviewed library coverage were read,
along with the upstream AlgebraicTopology and JacobianChallenge documents.
The native coset, fixed-subgroup and torsor machinery is reused; abstract
nonabelian H¹ is absent according to the reviewed audit. No foreign objects
were reconstructed in this scope. Full ownership and planet screening remain
unfinished. Aggregate nodes 2,9,10,11 also cite later kernel, representative
and twisted-source adapters outside this fresh screen; inspecting the initial
formula does not certify those transitive proofs. The central obstruction and
freeness signatures, exact additive class-map comparison, and geometric torsor
comparison remain explicit omissions. Recorded gaps and later calculations
do not prove them. Honest partial/not_read coverage alone is not a reason to
reject a budget-complete pass.

## Fresh scoped node calculations

All node suffixes below are in `AnabelianGeometryAndNonabelianChabauty:NC.3/`.
Rows are scoped findings, not final packet `review.checked` verdicts. Supplemental
source and missing-signature boundaries above apply to the indicated rows.

| Position | Node suffix | Scoped finding | Calculation and boundary |
| --- | --- | --- | --- |
| 0 | `continuous-cocycles` | Corrected | Ordered cocycle law, identity/inverse and continuity checked. Strengthened factor-order test to use the actual identity Z¹ cocycle at two noncommuting transpositions; native arithmetic proves it. Supplemental Poonen locator not freshly available. |
| 1 | `nonabelian-h1` | Scoped check | Gauge multiplication is ordered uv; its neutral orbit is exactly the coboundaries. C₂→S₃ gives four cocycles but two conjugacy classes; C₂ acting by negation on C₃ has trivial H¹. |
| 2 | `functoriality` | Scoped check | Coefficient and source parts are ordinary postcomposition/precomposition and commute. Its extra kernel/representative-source dependencies lie outside this scoped screen; aggregate closure remains pending. |
| 3 | `abelian-comparison` | Scoped check; Lean omission | Underlying cocycle identity is additive; gauge translation is −d⁰m, whose range is still B¹. Exact pinned Tau Ceti carriers read. Native class-map compatibility lacks a suggested lemma; full additive compilation unavailable. |
| 4 | `connecting-cocycle` | Corrected | Unique A-preimage of b⁻¹g(b) exists by range membership and injectivity; embedding transfers continuity. Cocycle expansion uses no normality or continuous section. Normalized two test-kind labels to section 12. |
| 5 | `connecting-cocycle-image` | Scoped check | Evaluation is the defining pointwise lift identity; it pins b⁻¹g(b), not its inverse. |
| 6 | `connecting-change-lift` | Scoped check | Right change b·i(a) yields a⁻¹c(g)g(a), hence gauge by a⁻¹. Membership follows from subgroup closure; the extra suggested membership proof is derivable. |
| 7 | `connecting-class-zero` | Scoped check | c(g)=a·g(a)⁻¹ is equivalent to fixedness of b·i(a), by injectivity and the displayed lift identity. |
| 8 | `connecting-fixed-orbits` | Scoped check | Equal classes give b′=t·b·i(a) with fixed t=b′i(a)⁻¹b⁻¹. Conversely this factorization gives the inverse-gauge witness. Left fixed factors and right subgroup factors have distinct roles. |
| 9 | `normal-h1-kernel` | Scoped check | A neutral projected class has a single gauge witness in C; surjectivity lifts that element to B. Inverse gauge then takes values in A; embedding gives continuity. Openness is surplus for this argument. Later kernel adapters are unreviewed inputs. |
| 10 | `exact-sequence` | Scoped check | A class dies under inclusion exactly when its representative is the B-coboundary of b⁻¹; this gives the invariant coset and its connecting class. Repointed/representative adapter proofs remain external to this screen. |
| 11 | `central-extension` | Scoped check; Lean omission | Central multiplication defines the H¹(Z)-action; equal projected classes can be normalized before taking their central difference. Positive defect changes by d¹z, and zero obstruction means a continuous cochain correction. Freeness uses twisted quotient invariants. The H²/action/freeness signatures remain explicit omissions, not checked implementations. |
| 12 | `twisting` | Corrected | Inner action and τ_c(d)=d·c follow from the ordered cocycle law; the inverse divides on the right. Target neutral point is [c]. Pinned native refl now realizes the underlying group identification; added its exact value API. Supplemental Poonen locator remains unread this pass. |
| 13 | `torsor-classification` | Scoped check | Point cocycle and inverse-gauge point change give the topological classification; left multiplication intertwines cohomologous models. Read native torsor supplier 362 and its five baseline inputs. Kim’s algebraic category comparison remains a gap; supplemental Poonen locator not freshly available. |
| 26 | `quotient-action` | Scoped check | Equivariance preserves the ordered coset relation b⁻¹b′∈i(A), supplying native QuotientAction without normality. |
| 27 | `fixed-coset-criterion` | Scoped check | Native fixed-point condition and coset equality identify exactly b⁻¹g(b)∈i(A); fixedness equality is reversed as needed. |
| 28 | `invariant-coset-projection` | Scoped check | Projection sends the fixed element b to its actual left coset. Tests cover identity subgroup, trivial subgroup and nonnormal order-two subgroup of S₃. |
| 29 | `invariant-coset-image` | Scoped check | Subtype projection is literally the canonical coset class of b. |
| 30 | `connecting-map` | Scoped check | Quotient choice supplies b; change-of-lift gauges by a⁻¹, so the chosen class is representative-independent. Odd coset of C₄ with negation action gives the nonneutral C₂ class. |
| 31 | `connecting-map-lift` | Scoped check | Compare chosen and supplied representatives by a right i(a) factor; change-of-lift gives the same H¹ class for every membership proof. |
| 32 | `invariants-injection` | Scoped check | Equality after i on fixed subgroups reflects by injectivity of the closed embedding. |
| 33 | `invariants-kernel` | Scoped check | Neutral coset means b∈i(A); fixedness of its A-preimage follows by equivariance and injectivity. |
| 34 | `invariant-coset-kernel` | Scoped check | The boundary is neutral exactly when b·i(a) is a fixed representative, hence the coset is in the actual fixed-element projection image. |
| 35 | `connecting-image-kernel` | Scoped check | The inclusion-kernel lift theorem gives a fixed coset; evaluation of the actual connecting map identifies its class. Converse is the ambient coboundary of b⁻¹. |
| 36 | `connecting-quotient-fibres` | Scoped check | The lift-class factorization removes its right subgroup factor under the coset quotient. Left translation by a fixed element preserves invariance; no quotient-group structure is used. |
| 101 | `coefficient-cocycle-map` | Scoped check | Actual map is f∘c; continuity and ordered multiplicativity follow by composition and equivariance. Tests pin identity, zero homomorphism, evaluation and a transposition. |
| 102 | `coefficient-cocycle-gauge` | Scoped check | Expand f(x c(g) g(x)⁻¹), retaining order, to get gauge witness f(x). |
| 103 | `coefficient-cocycle-identity` | Scoped check | Underlying map is identity; cocycle proof fields are irrelevant. |
| 104 | `coefficient-cocycle-composition` | Scoped check | Both actual maps evaluate to f′(f(c(g))); no map reversal. |
| 105 | `coefficient-h1-map` | Scoped check | Gauge compatibility descends the actual cocycle map to the orbit carrier. Nonneutral S₂→S₃ transposition class maps to neutral under constant-one coefficient map. |
| 106 | `coefficient-h1-one` | Scoped check | f(1)=1 gives neutral cocycle and then neutral class. |
| 107 | `coefficient-h1-identity` | Scoped check | Class-map surjectivity reduces identity to the actual representative identity. |
| 108 | `coefficient-h1-composition` | Scoped check | Class-map surjectivity reduces composition to ordered coefficient composition. |
| 109 | `coefficient-invariant-map` | Scoped check | Equivariance sends fixed elements to fixed elements and preserves group operations. Native H⁰ subgroups require no topology. Evaluation/identity/constant/transposition tests checked. |
| 110 | `coefficient-invariant-identity` | Scoped check | Native identity homomorphism on fixed subgroups, with proof irrelevance. |
| 111 | `coefficient-invariant-composition` | Scoped check | Both native homomorphisms send x to f′(f(x)). |
| 112 | `source-cocycle-restriction` | Scoped check | Precomposition along continuous φ preserves cocycles using h·u=φ(h)·u. Values, identity, constant source and subgroup tests checked. |
| 113 | `source-cocycle-value` | Scoped check | Exact evaluation c(φ(h)). |
| 114 | `source-cocycle-neutral` | Scoped check | Precomposition of the constant-one cocycle is constant one. |
| 115 | `source-cocycle-identity` | Scoped check | Identity precomposition fixes the actual cocycle subtype. |
| 116 | `source-cocycle-composition` | Scoped check | res_(φ∘ψ)=res_ψ∘res_φ; both evaluate c(φ(ψ(k))). |
| 117 | `source-cocycle-surjective-injection` | Scoped check | Choose a preimage of each g under surjective φ to reflect equality of cocycles. |
| 118 | `source-cocycle-subgroup` | Scoped check | Subgroup restriction evaluates at the underlying group element; closedness is unnecessary. |
| 119 | `source-cocycle-gauge` | Scoped check | Gauge witness x survives source restriction, by the compatible-action equality. |
| 120 | `source-h1-restriction` | Scoped check | Same-U gauge compatibility gives the quotient lift. Pullback uses native compHom and its continuity theorem. Constant-source example disproves general injectivity. |
| 121 | `source-h1-representative` | Scoped check | Native quotient evaluation gives the actual restricted representative. |
| 122 | `source-h1-neutral` | Scoped check | Restrict the representative one cocycle to obtain the neutral class. |
| 123 | `source-h1-identity` | Scoped check | Class representative and cocycle identity prove restriction identity. |
| 124 | `source-h1-composition` | Scoped check | Class representative and cocycle composition prove contravariant restriction composition. |
| 125 | `source-h1-surjective-injection` | Scoped check | A gauge witness after restriction reflects via surjective φ; this proves class injectivity without assuming coefficient injectivity. |
| 126 | `source-h1-subgroup` | Scoped check | Both class maps use the same subgroup-restricted cocycle. |
| 127 | `source-coefficient-cocycle-square` | Scoped check | Both cocycle-square paths evaluate f(c(φ(h))). Induced H-equivariance is derived from the two action equalities. |
| 128 | `source-coefficient-h1-square` | Scoped check | Reduce the H¹ square to representatives and the cocycle square. |
| 129 | `source-invariant-restriction` | Scoped check | Invariant inclusion preserves the underlying U-element, with no topological hypothesis. Tests cover identity, one and exact value. |
| 130 | `source-invariant-value` | Scoped check | The underlying invariant value is x itself. |
| 131 | `source-invariant-identity` | Scoped check | Identity homomorphism between identical native fixed subgroups. |
| 132 | `source-invariant-composition` | Scoped check | Both invariant composites preserve the same underlying U-element. |
| 133 | `source-invariant-injection` | Scoped check | Invariant restriction is always injective by subtype extensionality, with no surjectivity of φ. |
| 134 | `source-coefficient-invariant-square` | Scoped check | Both invariant homomorphisms have value f(x); no continuity is needed. |
| 135 | `twist-underlying-group` | Corrected | Native MulEquiv.refl is the exact identity on the synonym. Replaced an unconstrained admitted equivalence in the suggested file with that native map; no G-equivariance is asserted. |
| 136 | `twist-cocycle-equivalence` | Corrected | Twisted cocycle multiplication by c is on the right, and inverse division is on the right. Added noncommuting S₃ forward-value test: inverse laws alone do not pin the forward map. |
| 137 | `twist-cocycle-value` | Scoped check | Exact forward value j_c(d(g))·c(g), with fixed order. |
| 138 | `twist-cocycle-inverse-value` | Scoped check | Exact inverse value e(g)·c(g)⁻¹, with fixed order. |
| 139 | `twist-gauge-equivariance` | Scoped check | Expand g⋆x=c(g)g(x)c(g)⁻¹ to get same underlying gauge witness under τ_c. |
| 140 | `twist-h1-equivalence` | Scoped check | Same gauge witness in both directions and native Quotient.congr give the actual orbit equivalence; source one maps to [c]. Nonneutral transposition test checks repointing. |
| 141 | `twist-h1-representative` | Scoped check | Quotient congruence evaluates on the actual τ_c representative. |
| 142 | `twist-h1-neutral-fibre` | Scoped check | Injectivity of T_c and T_c(1)=[c] give the precise neutral fibre. |
| 143 | `twist-invariant-criterion` | Scoped check | Fixedness in the twist is c(g)g(x)=x c(g), by right cancellation. |
| 144 | `twist-coefficient-map` | Scoped check | Underlying map is exactly f, continuous for inherited topology and equivariant for twists by c and f∘c. Tests cover value, identity, constant map, cocycle square and repointed neutral value. |
| 145 | `twist-coefficient-value` | Scoped check | Actual underlying value is f(j_c(x)). |
| 146 | `twist-coefficient-continuity` | Scoped check | Topologies on both synonyms are inherited; use the given hf. |
| 147 | `twist-coefficient-equivariance` | Scoped check | Multiplicativity, inverse preservation and original equivariance give f(c(g)g(x)c(g)⁻¹) in the correct order. |
| 148 | `twist-coefficient-identity` | Scoped check | Mapped identity cocycle and underlying identity homomorphism agree definitionally. |
| 149 | `twist-coefficient-composition` | Scoped check | Mapped cocycle composition and underlying native composition agree definitionally; no action preservation is assumed beyond proved equivariance. |
| 150 | `twist-coefficient-cocycle-square` | Scoped check | At g the square is f(d(g))f(c(g))=f(d(g)c(g)). |
| 151 | `twist-coefficient-inverse-cocycle-square` | Scoped check | Apply injectivity of τ_(f∘c), forward cocycle square and inverse laws; no injectivity of f. |
| 152 | `twist-coefficient-h1-square` | Scoped check | Actual representative surjectivity reduces to the cocycle square and class formulas. |
| 153 | `twist-coefficient-inverse-h1-square` | Scoped check | Apply injectivity of the orbit equivalence, forward square and inverse laws. |
| 154 | `twist-coefficient-repointed-neutral` | Scoped check | Mapped target point is [f∘c], which need not be neutral. |
| 155 | `twist-coefficient-repointed-fibre` | Scoped check | Forward square followed by the neutral-fibre criterion identifies the fibre over [f∘c], without coefficient injectivity. |

## Fresh selected baseline statement locators

Names were checked in their actual namespace and hypothesis context; basename
matches such as IsInducing.continuous_iff, OneHom.comp or DistribMulAction.compHom
are not substitutes for the qualified declarations below. These are the same
pin-qualified locators as the historical table, freshly reread for this scope.

| Declaration | Pinned source |
| --- | --- |
| `mathlib:ContinuousMap` | [Mathlib/Topology/ContinuousMap/Defs.lean:33](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/ContinuousMap/Defs.lean#L33) |
| `mathlib:ContinuousMonoidHom` | [Mathlib/Topology/Algebra/ContinuousMonoidHom.lean:57](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/ContinuousMonoidHom.lean#L57) |
| `mathlib:ContinuousSMul` | [Mathlib/Topology/Algebra/MulAction.lean:46](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/MulAction.lean#L46) |
| `mathlib:FixedPoints.subgroup` | [Mathlib/GroupTheory/GroupAction/Defs.lean:203](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/Defs.lean#L203) |
| `mathlib:IsTopologicalGroup` | [Mathlib/Topology/Algebra/Group/Defs.lean:110](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Group/Defs.lean#L110) |
| `mathlib:MulAction.QuotientAction` | [Mathlib/GroupTheory/GroupAction/Quotient.lean:52](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/Quotient.lean#L52) |
| `mathlib:MulAction.orbitRel` | [Mathlib/GroupTheory/GroupAction/Defs.lean:287](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/Defs.lean#L287) |
| `mathlib:MulAction.orbitRel.Quotient` | [Mathlib/GroupTheory/GroupAction/Defs.lean:349](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/Defs.lean#L349) |
| `mathlib:MulAut.conj` | [Mathlib/Algebra/Group/End.lean:723](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/End.lean#L723) |
| `mathlib:MulDistribMulAction` | [Mathlib/Algebra/Group/Action/Defs.lean:629](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Action/Defs.lean#L629) |
| `mathlib:MulDistribMulAction.toMulAut` | [Mathlib/Algebra/Group/Action/End.lean:232](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Action/End.lean#L232) |
| `mathlib:Multiplicative` | [Mathlib/Algebra/Group/TypeTags/Basic.lean:46](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/TypeTags/Basic.lean#L46) |
| `mathlib:QuotientGroup.continuous_mk` | [Mathlib/Topology/Algebra/Group/Quotient.lean:44](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Group/Quotient.lean#L44) |
| `mathlib:QuotientGroup.isOpenMap_coe` | [Mathlib/Topology/Algebra/Group/Quotient.lean:52](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Group/Quotient.lean#L52) |
| `mathlib:Subgroup.center` | [Mathlib/GroupTheory/Subgroup/Center.lean:30](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/Subgroup/Center.lean#L30) |
| `mathlib:groupCohomology.IsMulCocycle₁` | [Mathlib/RepresentationTheory/Homological/GroupCohomology/LowDegree.lean:621](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupCohomology/LowDegree.lean#L621) |
| `tauceti:TauCeti.ContCohomology.B1` | [TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:174](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean#L174) |
| `tauceti:TauCeti.ContCohomology.B2` | [TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:494](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean#L494) |
| `tauceti:TauCeti.ContCohomology.H0` | [TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:326](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean#L326) |
| `tauceti:TauCeti.ContCohomology.H1` | [TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:674](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean#L674) |
| `tauceti:TauCeti.ContCohomology.H1EquivOfSmulEqSelf` | [TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:840](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean#L840) |
| `tauceti:TauCeti.ContCohomology.H1pi` | [TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:679](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean#L679) |
| `tauceti:TauCeti.ContCohomology.H2` | [TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:730](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean#L730) |
| `tauceti:TauCeti.ContCohomology.H2pi` | [TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:735](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean#L735) |
| `tauceti:TauCeti.ContCohomology.Z1` | [TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:485](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean#L485) |
| `tauceti:TauCeti.ContCohomology.Z2` | [TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:488](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean#L488) |
| `tauceti:TauCeti.ContCohomology.d0` | [TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:167](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean#L167) |
| `tauceti:TauCeti.ContCohomology.d1` | [TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:228](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean#L228) |
| `mathlib:Topology.IsEmbedding.continuous_iff` | [Mathlib/Topology/Maps/Basic.lean:245](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Maps/Basic.lean#L245) |
| `mathlib:MulAction.quotient` | [Mathlib/GroupTheory/GroupAction/Quotient.lean:83](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/Quotient.lean#L83) |
| `mathlib:MulAction.Quotient.smul_mk` | [Mathlib/GroupTheory/GroupAction/Quotient.lean:93](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/Quotient.lean#L93) |
| `mathlib:MulAction.fixedPoints` | [Mathlib/GroupTheory/GroupAction/Defs.lean:116](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/Defs.lean#L116) |
| `mathlib:MulAction.mem_fixedPoints` | [Mathlib/GroupTheory/GroupAction/Defs.lean:133](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/Defs.lean#L133) |
| `mathlib:QuotientGroup.eq` | [Mathlib/GroupTheory/Coset/Defs.lean:198](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/Coset/Defs.lean#L198) |
| `mathlib:QuotientGroup.out_eq'` | [Mathlib/GroupTheory/Coset/Defs.lean:204](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/Coset/Defs.lean#L204) |
| `mathlib:QuotientGroup.mk_out_eq_mul` | [Mathlib/GroupTheory/Coset/Defs.lean:216](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/Coset/Defs.lean#L216) |
| `mathlib:QuotientGroup.leftRel_apply` | [Mathlib/GroupTheory/Coset/Defs.lean:71](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/Coset/Defs.lean#L71) |
| `mathlib:MulAction.left_quotientAction` | [Mathlib/GroupTheory/GroupAction/Quotient.lean:67](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/Quotient.lean#L67) |
| `mathlib:FixedPoints.mem_subgroup` | [Mathlib/GroupTheory/GroupAction/Defs.lean:208](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/Defs.lean#L208) |
| `mathlib:MulAction.orbitRel_apply` | [Mathlib/GroupTheory/GroupAction/Defs.lean:294](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/Defs.lean#L294) |
| `mathlib:Continuous.comp` | [Mathlib/Topology/Continuous.lean:115](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Continuous.lean#L115) |
| `mathlib:MonoidHom.comp` | [Mathlib/Algebra/Group/Hom/Defs.lean:779](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Hom/Defs.lean#L779) |
| `mathlib:MonoidHom.id` | [Mathlib/Algebra/Group/Hom/Defs.lean:750](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Hom/Defs.lean#L750) |
| `mathlib:MonoidHom.comp_apply` | [Mathlib/Algebra/Group/Hom/Defs.lean:806](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Hom/Defs.lean#L806) |
| `mathlib:map_mul` | [Mathlib/Algebra/Group/Hom/Defs.lean:326](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Hom/Defs.lean#L326) |
| `mathlib:map_inv` | [Mathlib/Algebra/Group/Hom/Defs.lean:440](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Hom/Defs.lean#L440) |
| `mathlib:map_one` | [Mathlib/Algebra/Group/Hom/Defs.lean:234](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Hom/Defs.lean#L234) |
| `mathlib:Subgroup.subtype` | [Mathlib/Algebra/Group/Subgroup/Defs.lean:563](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Defs.lean#L563) |
| `mathlib:MulDistribMulAction.compHom` | [Mathlib/Algebra/GroupWithZero/Action/End.lean:50](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/GroupWithZero/Action/End.lean#L50) |
| `mathlib:MulAction.continuousSMul_compHom` | [Mathlib/Topology/Algebra/MulAction.lean:252](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/MulAction.lean#L252) |
| `mathlib:MulEquiv.refl` | [Mathlib/Algebra/Group/Equiv/Defs.lean:259](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Equiv/Defs.lean#L259) |
| `mathlib:Quotient.congr` | [Mathlib/Logic/Equiv/Defs.lean:884](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Logic/Equiv/Defs.lean#L884) |
| `mathlib:Homeomorph` | [Mathlib/Topology/Homeomorph/Defs.lean:43](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Homeomorph/Defs.lean#L43) |
| `mathlib:Torsor` | [Mathlib/Algebra/Torsor/Defs.lean:70](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Torsor/Defs.lean#L70) |
| `mathlib:IsTopologicalTorsor` | [Mathlib/Topology/Algebra/Group/Torsor.lean:35](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Group/Torsor.lean#L35) |
| `mathlib:Homeomorph.smulConst` | [Mathlib/Topology/Algebra/Group/Torsor.lean:100](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Group/Torsor.lean#L100) |
| `mathlib:MulOpposite.opHomeomorph` | [Mathlib/Topology/Algebra/Constructions.lean:50](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Constructions.lean#L50) |

## Validation and resumption

- Packet checker: 0 errors, 0 warnings.
- Full suggested file attempted with lean-check: missing Tau Ceti LowDegree
  object file prevents elaboration. No builds or dependency updates performed;
  no full pinned Tau Ceti compilation claimed.
- Mathlib projection: exit 0, 693 warnings, all sorry; no errors or other
  warnings. The actual-cocycle factor-order example is proved by decide.
- Memory before the final projection: 95 GiB available. No Lean language server
  or background job was started.

Projection recipe: delete exactly import lines starting `import TauCeti.` and
  the exact `section Abelian` through `end Abelian` block, retaining
  `section AbelianTwistingTest`. This tests the remaining signatures, not the
  omitted additive comparison or geometric interfaces, nor the admitted proofs.
Suggested SHA-256: `4ab8a0985990c946ece7301c60780ba57d42fa25c2c063536b0a16e826c60b7b`.
Projection SHA-256: `ce5afacf0a8d2b4f8d1df6b3c023aed77b1e2b85bb1da96cdee6f62a0412e350`.

Continue positions 14–25 and 37–50 (geometry) and 156–313 (representative-change,
source twisting, kernel adapters and stabilizers). Reuse the preceding 51–100
and 314–362 scoped tables, but check all transitive inputs and supplementary
sources before a final verdict. Then finish supplier/ownership/planet checks,
reserved étale K(π,1) scope and sample API, sourceIssues, omitted signatures,
coverage/gap supersession and every baseline consumer. Preserve the positive
central defect, full profinite π for arbitrary finite/p-primary coefficients,
and separate cohomological/raw-homotopy scopes. SourceIssues remains empty
with an unfinished screen. No scratch file is required to resume.

---

## Earlier independent review checkpoints (historical)

# Independent review checkpoint: Anabelian geometry and nonabelian Chabauty

Issue [#526](https://github.com/CBirkbeck/tauceti-explorer/issues/526), job
`REV-AnabelianGeometryAndNonabelianChabauty`; Codex `codex-i1BjcC`, 2026-10-05.
Input explorer revision `b4ea721503c52188587f85a4ebc5541d02f6e151`.
This reviewer did not author the blueprint. The preceding review checkpoints
[#6170](https://github.com/CBirkbeck/tauceti-explorer/pull/6170),
[#6175](https://github.com/CBirkbeck/tauceti-explorer/pull/6175) and
[#6180](https://github.com/CBirkbeck/tauceti-explorer/pull/6180) remain historical
evidence attributed to their respective reviewers.

**This is a checkpoint, not a completed independent review.** Fresh scope is
50 nodes at zero-based packet positions 51–100, inclusive: discrete descent,
quotient cocycles, same-N inflation/restriction, quotient-action continuity and
finite-quotient colimits. Each was checked against its statement, hypotheses,
proof steps, direct prerequisites, source attribution and actual suggested
signature. All construction APIs and tests in this scope were examined.
The table gives scoped findings, not final per-node acceptance of transitive
closure. No packet `review` object or global verdict is supplied. The previous
checkpoint is preserved in `independentReviewCheckpoints`.

The packet still has 363 nodes, 160 baseline declarations, 17 requests,
10 gaps and 11 planets. Definition/construction API entries: 320; their tests:
253. Across every node kind: 340 API entries and 269 tests. No nodes, requests
or suppliers were added. NC.0/NC.3 remain partial; five other stages remain
not_read, and every implementation is unchecked. The packet's `complete`
status continues to mean its budget-complete planning pass.

## Changes and test strength

- Added concrete nonidentity S₃ values for `Z1.descend`, `Z1.inflate` and
  `Z1.descendEquiv`. For discrete G=U=S₃ with trivial action, N={1}, and the
  identity homomorphism cocycle, the actual forward map returns (01) at [(01)]
  and (12) at [(12)]. Inverse laws and proof irrelevance alone could accept a
  permuted equivalence; conjugating the descent by (12) fails the new forward
  evaluation. These three statements still use `sorry`, as prototype tests.
- Added a native `by decide` normality counterexample. Let G=ConjAct(S₃),
  U=S₃, τ=(01), n=τ, g=(12), and c(h)=τ(h•τ)⁻¹. Then c(n)=1 and
  c(gn)=c(g), but c(ng)≠c(g). Mathematically the one-fibre is the nonnormal
  centralizer of τ, and ⟨τ⟩ is killed. The elaborated example proves precisely
  the three displayed arithmetic assertions; it does not construct a proposed
  cocycle or certify a new subgroup API. The cocycle law follows independently
  by expanding this coboundary with the native conjugation action.
- Added `NC.3/nonabelian-h1` as a direct prerequisite of finite-quotient class
  surjectivity, where its proof chooses a representative of the orbit carrier.
- Corrected the residual unbound codomain U in the central-extension action
  hypothesis to B: the joint action is G×B→B. The previous positive-defect
  sign correction is retained. The central H² interface remains omitted.

No reader, supplier packet, atlas data or author handoff was edited. A later
reader reconciliation should reflect the strengthened concrete tests and the
G×B→B spelling; this issue does not authorize editing that reader. Historical
encoded payloads were preserved without decoding or executing them.

## Source and baseline evidence for this scope

Freshly read the exact [Kim arXiv v1 PDF](https://arxiv.org/pdf/math/0409456v1):
the continuous cochain/cocycle/gauge definitions, complete Proposition 1 proof,
and selected central-extension passages on printed pp.5–9. The ordered gauge
convention agrees with the reviewed discrete families. This is not a new
whole-paper reading or published-version collation. Exact SHA-256:
`00efa6e96091d564f7afa2ad9fb917a34cc0a55b7e258164383519b4e93ba941`.

Freshly read Definition 1.3.14 and the complete Proposition 1.3.15 proof on
printed pp.11–12 of [Poonen's author-hosted PDF](https://math.mit.edu/~poonen/papers/Qpoints.pdf).
The direct-limit passage concerns its Hilbert 90 proof. It motivates the
passage from finite to infinite Galois extensions; it does not state the
packet's general compact/discrete nonabelian colimit theorem. The packet
correctly labels those statements as authored deductions, whose arguments
were independently checked below. Exact SHA-256:
`42e92ce4599420f6b72139e78cb9f5230e4bf81258c202e7cee4716887353579`.
No new Serre reading or source-error certification is claimed.

The selected consumers cite 47 distinct Mathlib prerequisites. Their statements
and hypotheses were freshly inspected at
`082e2d37e8b0463410cdb532e111cd43d5a66174`, using the previous report's full
160-entry locator table to disambiguate names. The most consequential boundaries
are: the compact-group clopen-neighbourhood theorem requires neither T₂ nor
profinite hypotheses; quotient group/action formulas retain normality;
`Subgroup.continuousSMul` restricts the acting group; q×id is handled by the
**open** quotient-map product theorem; and the Types colimit criterion requires
surjectivity plus eventual equality. The generated colimit counterparts of
native limit lemmas were checked in the `to_dual` source declarations and in
the elaborated prototype. Tau Ceti remains pinned at
`f790474821cf4256814db967cb154e7af3d0c369`; no fresh all-160 consumer audit is
claimed by this session.

The reviewed library coverage for all seven NC layers was read, together with
the upstream AlgebraicTopology and JacobianChallenge roadmap comparators.
The native fixed-point action, quotient topology, orbit relation and filtered
colimit infrastructure are reused; the audit does not supply nonabelian H¹.
The scoped deduction family introduces no duplicate implementation or foreign
supplier. Full ownership, key-definition, planet and geometric-supplier closure
still require the unfinished global screen.

## Scoped per-node findings

All IDs below have prefix `AnabelianGeometryAndNonabelianChabauty:NC.3/`.
Every row includes examination of actual Lean signature and declared direct
inputs; “Checked” does not certify unreviewed precursor proofs. The shared
source attribution is Kim's degree-one convention and/or Poonen's direct-limit
motivation, followed by the packet's authored mathematical deductions. Scope
0–50 and 101–313 remains unfinished; the preceding checkpoint screened
314–362 separately.

| Position | Node suffix | Scoped finding | Independent calculation / hypothesis or API boundary |
| --- | --- | --- | --- |
| 51 | `cocycle-map-one` | Checked | Cancel the ordered cocycle equation at (1,1); no commutativity of U is used. |
| 52 | `cocycle-map-inverse` | Checked | Apply the equation at (g⁻¹,g), using c(1)=1 and the automorphism action; multiplication order is retained. |
| 53 | `cocycle-one-fibre` | Checked | The one-fibre is a subgroup by the preceding identities; it is not declared normal. With conjugation, a coboundary has a centralizer as one-fibre. |
| 54 | `cocycle-one-fibre-clopen` | Checked | Continuity of c pulls back the clopen singleton {1} in discrete U; no compactness or Hausdorff hypothesis is needed here. |
| 55 | `discrete-normal-killing` | Checked | Use the pinned compact-topological-group clopen-neighbourhood theorem inside the one-fibre. Openness gives a finite quotient; total disconnectedness and finite U are unnecessary. |
| 56 | `cocycle-right-cosets` | Checked | c(gn)=c(g) follows from c(n)=1 and g•1=1, without normality. |
| 57 | `cocycle-left-cosets` | Strengthened test | Rewrite ng=g(g⁻¹ng) and use normality plus right-coset constancy. The added S₃ arithmetic counterexample fails left constancy for a nonnormal killed subgroup. |
| 58 | `cocycle-values-fixed` | Checked | Compare c(ng)=n•c(g) with the preceding left-constancy equality; this proves fixedness by the same N. |
| 59 | `cocycle-values-invariants` | Checked | Package that pointwise equality in native FixedPoints.subgroup; its membership lemma has the required restricted action. |
| 60 | `gauge-witness-fixed` | Checked | Evaluate the gauge formula at n∈N with c(n)=d(n)=1 and cancel to obtain n•x=x. No refinement of N occurs. |
| 61 | `finite-family-normal-killing` | Checked | A finite intersection of clopen one-fibres contains 1. Apply the same neighbourhood theorem; the empty family is harmless. |
| 62 | `quotient-cocycle-descent` | Strengthened test | Quotient-lift the underlying function, not a homomorphism. Right constancy gives well-definedness, fixed values give Uᴺ, and the native quotient action gives the ordered cocycle law. The added identity-S₃ value pins the map. |
| 63 | `quotient-cocycle-unique` | Checked | Quotient induction and the underlying-value condition force the descended cocycle, including the Uᴺ subtype equality. |
| 64 | `quotient-cocycle-inflation` | Strengthened test | Compose the quotient projection and inclusion Uᴺ→U; native action coercion yields the cocycle law. c(1)=1 makes the inflation trivial on N. Added nonidentity S₃ evaluation. |
| 65 | `inflate-descended-cocycle` | Checked | Extensionality reduces inflation after descent to the defining quotient-lift value, with no gauge quotient involved. |
| 66 | `descend-inflated-cocycle` | Checked | Descend uniqueness or quotient induction gives the other literal inverse, not only equality of H¹ classes. |
| 67 | `quotient-cocycle-equivalence` | Corrected test coverage | The equivalence is formed from the two literal inverses. Inverse/proof-irrelevance tests alone permit a permuted equivalence; the added forward identity-S₃ evaluations rule out conjugating its output by (12). |
| 68 | `quotient-cocycle-gauge` | Checked | A gauge witness between N-trivial cocycles lies in Uᴺ by node 60; quotient induction gives the converse using that same fixed witness. |
| 69 | `h1-orbit-criterion` | Checked | Native orbitRel and mem_orbit give the existential ordered gauge formula. The inverse gauge action resolves the orientation of the relation. |
| 70 | `quotient-inflation-equivariance` | Checked | Evaluate the actual inflation under x∈Uᴺ, and use native quotient/fixed-point action coercions. Both actual gauge actions require their joint continuity hypotheses. |
| 71 | `quotient-inflation-gauge-reflection` | Checked | An ambient U-witness is already N-fixed by evaluation on N; equivariance proves the reverse direction. This is same-stage reflection. |
| 72 | `quotient-cocycle-inflation-one` | Checked | Pointwise evaluation sends the literal one cocycle to one. |
| 73 | `h1-inflation` | Checked | Orbit quotient lifting uses equivariance and the existing nonabelian carrier. Its definition and tests specify actual class inflation and its neutral value. |
| 74 | `h1-inflation-injective` | Checked | Representatives of two equal inflated classes have an ambient witness; node 71 reflects it at the same N. No eventual refinement substitutes for injectivity. |
| 75 | `cocycle-restriction` | Checked | Restrict the continuous function along the native subgroup inclusion, retaining the ambient coefficient U and its restricted action. |
| 76 | `cocycle-restriction-equivariance` | Checked | Restriction commutes pointwise with the ordered gauge action. Subgroup.continuousSMul restricts the acting group, not an arbitrary coefficient subgroup. |
| 77 | `h1-neutral-criterion` | Checked | The orbit criterion at the one cocycle identifies exactly the coboundaries x(g•x)⁻¹; both directions have the correct gauge orientation. |
| 78 | `h1-gauge-class` | Checked | The representative and its gauge translate have the same native orbit class; this is not quotient equality for arbitrary unrelated cocycles. |
| 79 | `cocycle-inverse-gauge-normalization` | Checked | For c(n)=x(n•x)⁻¹, translate by x⁻¹. The expression x⁻¹ c(n)(n•x⁻¹)⁻¹ is 1. Normality of N is not needed for this normalization. |
| 80 | `h1-restriction` | Checked | Lift the actual restriction through full-U gauge orbits, not Uᴺ-orbits. Its class formula and pointedness APIs describe the concrete map. |
| 81 | `cocycle-restriction-inflation` | Checked | Inflated cocycles are literally one on N because [(n)]=1. Native quotient membership supplies this equality. |
| 82 | `h1-restriction-inflation` | Checked | Apply the class formula for restriction to node 81; every inflated class restricts to the neutral class. |
| 83 | `h1-inflation-restriction-image` | Checked | For the converse, choose a representative of a neutral-restriction class, normalize by x⁻¹, descend it to Uᴺ, and use gauge-class invariance. The image is the neutral fibre, not all H¹. |
| 84 | `h1-inflation-unique-preimage` | Checked | Image existence is node 83, and uniqueness uses same-N injectivity. The preimage is a class rather than a unique cocycle. |
| 85 | `quotient-fixed-action-continuity` | Checked | The projection q×id is an open quotient map. Ambient joint action continuity and the induced range topology give the quotient action on Uᴺ; closedness of N is unnecessary. |
| 86 | `h1-inflation-one` | Checked | The representative one-cocycle formula proves inflation preserves the neutral class. |
| 87 | `h1-inflation-neutral-equivalence` | Checked | The reverse implication follows from injectivity and node 86. It does not assert that a nonneutral target class lifts. |
| 88 | `quotient-cocycle-inflation-injective` | Checked | Equality after inflation can be tested on quotient representatives; Uᴺ→U is injective. No gauge witnesses or topological-group coefficient assumption are needed. |
| 89 | `cocycle-transition` | Checked | For M≤N, pull back G/N cocycles along G/M→G/N and include Uᴺ in Uᴹ. The invariant inclusion goes in the correct direction; APIs/tests retain concrete evaluation and inverse-stage compatibility. |
| 90 | `cocycle-transition-inflation` | Checked | Ambient inflation of that concrete transition has the same value at every g; extensionality supplies equality. |
| 91 | `h1-transition` | Checked | Transition of H¹ classes uses actual cocycle transition and its gauge compatibility, with quotient joint continuity. APIs/tests pin representative and neutral formulas. |
| 92 | `h1-transition-inflation` | Checked | Lift the cocycle transition/inflation equality to actual classes. |
| 93 | `h1-transition-identity` | Checked | Both sides have equal ambient inflations; same-stage H¹ inflation injectivity proves the identity law. |
| 94 | `h1-transition-composition` | Checked | For L≤M≤N, both composites have equal ambient inflations in stage L; injectivity there proves composition. |
| 95 | `h1-quotient-diagram` | Checked | Use OrderDual(OpenNormalSubgroup G) with inclusions reversed. Concrete transitions and the preceding laws supply the functor; its object/map tests fix the direction. |
| 96 | `h1-inflation-cocone` | Checked | Legs are the actual H¹ inflation functions. Node 92 proves cocone naturality; APIs/tests identify every leg. |
| 97 | `h1-finite-quotient-surjectivity` | Corrected direct prerequisite | Choose a cocycle representative of a class, kill it on an open normal subgroup, descend it and inflate back. Added nonabelian-h1 as the direct carrier/representative dependency. |
| 98 | `h1-quotient-index-filtered` | Checked | The dual of the native inf-semilattice is filtered: N∩M is a common refinement, the top subgroup ensures nonemptiness, and the thin category has unique parallel arrows. |
| 99 | `h1-inflation-colimit` | Checked | Native Types.FilteredColimit.isColimitOf needs class surjectivity and eventual equality. Refine two stages to N∩M, compare ambient inflations, and use injectivity there. This proves the actual cocone universal property. |
| 100 | `h1-finite-quotient-equivalence` | Checked | The native generated colimit duals of the cited limit lemmas identify the chosen categorical colimit with that actual cocone point. The leg formula fixes the equivalence as inflation; discrete/compact assumptions remain explicit. |

### Freshly inspected prerequisites

The previous report's locator table below contains the exact modules and
statement lines. This pass reread these 47 consumer prerequisites, including
namespace context rather than accepting the first basename match:

`CategoryTheory.IsFiltered`, `CategoryTheory.Iso.toEquiv`, `CategoryTheory.Limits.IsLimit.conePointUniqueUpToIso`, `CategoryTheory.Limits.IsLimit.conePointUniqueUpToIso_inv_comp`, `CategoryTheory.Limits.Types.FilteredColimit.isColimitOf`, `CategoryTheory.Limits.limit.isLimit`, `ConjAct`, `ConjAct.toConjAct`, `ConjAct.toConjAct_smul`, `Continuous.comp`, `Continuous.smul`, `ContinuousSMul`, `Equiv.apply_symm_apply`, `Equiv.injective`, `Equiv.ofBijective`, `Equiv.symm_apply_apply`, `FixedPoints.mem_subgroup`, `FixedPoints.subgroup`, `IsClopen.preimage`, `IsOpenQuotientMap.continuous_comp_iff`, `IsOpenQuotientMap.id`, `IsOpenQuotientMap.prodMap`, `IsTopologicalGroup.exist_openNormalSubgroup_sub_clopen_nhds_of_one`, `MulAction.coe_quotient_smul_fixedPoints`, `MulAction.mem_orbit_iff`, `MulAction.orbitRel_apply`, `OpenNormalSubgroup.instSemilatticeInfOpenNormalSubgroup`, `QuotientGroup.continuous_mk`, `QuotientGroup.eq_one_iff`, `QuotientGroup.induction_on`, `QuotientGroup.isOpenQuotientMap_mk`, `QuotientGroup.isQuotientMap_mk`, `QuotientGroup.leftRel_apply`, `QuotientGroup.mk_mul`, `Subgroup`, `Subgroup.Normal.conj_mem'`, `Subgroup.continuousSMul`, `Subgroup.quotient_finite_of_isOpen`, `Topology.IsQuotientMap.continuous_iff`, `coe_smul_fixedPoints_of_normal`, `continuous_fst`, `continuous_induced_rng`, `continuous_snd`, `continuous_subtype_val`, `inv_smul_smul`, `isClopen_discrete`, `isClopen_iInter_of_finite`.

## Validation and its limits

- `python3 scripts/check_blueprint.py` on the packet: 0 errors, 0 warnings.
- Native S₃ arithmetic and the relevant baseline name checks elaborate with
  exit 0 in a fresh scratch file, without admissions.
- Full suggested file attempted using `lean-check`: import failure because
  `TauCeti.RepresentationTheory.Homological.ContCohomology.LowDegree.olean`
  is absent in the shared pinned build. No library was built or updated.
- Mathlib projection elaborates with exit 0 and **693 warnings, all `sorry`**;
  no errors or other warnings. Three added concrete-map tests contribute three
  warnings. The identity cocycle/helper and native normality arithmetic use no
  admissions. Available memory before elaboration was 95 GiB.

To reproduce the projection in authorized on-disk scratch: remove exactly
lines matching `^import TauCeti\..*`; remove the exact `section Abelian` through
`end Abelian` block inclusive; retain `section AbelianTwistingTest`; then check
memory and run `lean-check` once, under WORKERS.md's shared-machine rules.
This checks suggested signatures outside the additive comparisons. It does not
prove the admitted APIs or test assertions, or compile the full suggested file.
Suggested SHA-256:
`ea15ef060b3deffef127327fe1f1431e6400f22ae2c20d5fc238b111435c92cf`.
Projection SHA-256:
`20475e3ff9c7cd0f9c85f76ca2c873310836cddf0bc95e20d456f04874183afc`.

## Resume point

Continue this unfinished review, not a new blueprint. First complete nodes
0–50, supplying the actual continuous cocycle, native fixed-point action and
orbit-carrier precursors; then 101–313 (coefficient/source changes, twisting,
kernel adapters, stabilizers, central/additive comparisons and geometry).
Retain this 50-row calculation and the preceding 49-node screen, but verify
transitive proof closure before giving any final per-node verdict. The final
review must still resolve the geometric proof leaves, IG/SF ownership and
coverage/gap chains, every planet and the reserved étale K(π,1) key. The raw
homotopy candidate is not an accepted registered foundation. All-degree
additive/native comparison remains owned by ProfiniteCohomology Layer 10.

Keep the positive central defect and continuous B² convention. The connecting
H² map, lift-independence and exactness/freeness interfaces remain omissions;
this pass does not repair them. `sourceIssues` is empty with an unfinished
source-error screen, not a certified absence of source errors. Honest partial
and not_read stages alone do not reject a budget-complete planning pass.
No scratch file is needed to resume; all durable evidence is in these four
deliverables and public pinned sources. Scratch is deleted after submission.

---

## Historical checkpoint by codex-1O5j0u (preserved verbatim)

The following reports concern their own input revisions and prior counts;
the current scope, hashes and counts are given above.

# Independent review checkpoint: Anabelian geometry and nonabelian Chabauty

Issue [#526](https://github.com/CBirkbeck/tauceti-explorer/issues/526), job
`REV-AnabelianGeometryAndNonabelianChabauty`. Current reviewer: Codex
`codex-1O5j0u`, 2026-10-05. Input explorer revision:
`ceae7664eb1264bc255acade6af444e36a29b0d0`, incorporating review checkpoints
[#6170](https://github.com/CBirkbeck/tauceti-explorer/pull/6170) and
[#6175](https://github.com/CBirkbeck/tauceti-explorer/pull/6175).
This session did not author the blueprint.

**This remains an unfinished independent review.** There is no global `review`
object, acceptance verdict or completed per-node verdict matrix. The scoped
`independentReviewCheckpoint` records this pass's work. The blueprint's
`complete` status still denotes its budget-complete planning pass. All stages
and implementation statuses are unchanged: NC.0/NC.3 are partial, the other
five stages are not_read, and every implementation is unchecked.

The packet retains 363 nodes, 160 baseline declarations, 17 requests, 10 gaps
and 11 planets. Definitions/constructions have 320 API entries and 250 tests;
across every node kind there are 340 API entries and **265 tests**. This pass
adds one theorem test, no node and no supplier. Existing reading/compilation
receipts remain attributed to their authors.

## Corrections in this pass

1. **Central-obstruction sign.** `NC.3/central-extension` specifies the positive
   defect D(g,h)=c(g)g(c(h))c(gh)⁻¹, matching the pinned Tau Ceti additive
   differential d¹a(g,h)=g•a(h)−a(gh)+a(g). Kim's arXiv v1 printed p.5 instead
   takes the inverse defect, c(gh)g(c(h))⁻¹c(g)⁻¹. Thus the packet's class is
   the negative of Kim's printed class; their zero loci agree. The statement,
   proof outline, source match and suggested omission comment now pin this
   comparison. This is a convention qualification, not a source error.
2. **Sign discriminator.** Added
   `tests.central_defect_sign_C3_C9`: for the least-residue section C₃→C₉ and
   trivial action, the positive defect at (2,1) is 3, its negative is 6, and
   they differ. The central subgroup identification a↦3a takes these to 1 and
   −1 in C₃. The native arithmetic example is proved by `decide`. It does not
   construct the omitted continuous H² interface or certify an H² comparison.
3. **Hypothesis spelling.** Replaced the unbound U in the central-extension
   action/continuity hypotheses by its actual ambient coefficient group B.
4. **Descent reading receipt.** Replaced the obsolete claim that Stacks 01ZM
   could not be retrieved. Its whole statement and all three printed proofs
   were read, retaining directedness, qcqs bases and affine transition maps.
   The packet still requests the generic property/group-structure descent and
   cohomology-continuity suppliers. Reading a source is not building them.
5. **Scoped source receipts.** Recorded fresh reading of Stacks 03RH/03RM and
   Schmidt–Stix Appendix A.3. Their cited foundational proof leaves remain
   open. Historical receipts and encoded recovery payloads are preserved;
   none was decoded or executed or used as independent proof evidence.

No roadmap reader, atlas data, supplier packet or author handoff was edited.
The issue authorizes only this review's packet, suggested file, report and
handoff.

## Baseline statement audit

Every one of the **160 cited declarations** was read at the packet's exact
pins, with the relevant namespace and surrounding hypotheses. All 138 cited
Mathlib names also resolve in a fresh `lean-check` file importing the cited
modules and checking the qualified names; it exits 0. The 22 Tau Ceti entries
were inspected in pinned git objects. Their import cannot be checked in the
existing build because the LowDegree object is absent. The table below gives
exact pinned source locators; it is a statement audit, **not** a certificate
that every citing proof uses the declaration correctly.

The significant boundaries confirmed in the source are:

- Native `groupCohomology.IsMulCocycle₁` requires commutative coefficients;
  its reversed factors cannot be reused for an arbitrary nonabelian group.
  Native `continuousCohomology` uses homogeneous cochains of `TopRep` in
  every degree. The geometric/derived-discrete agreement remains an import
  contract, not an identification supplied by that definition.
- Tau Ceti B² is the image of **continuous** degree-one cochains; its d¹ has
  the positive sign above. H⁰/H¹/H² are additive constructions. The trivial
  action H¹ equivalence lands in additive continuous homomorphisms to the
  multiplicative coefficient synonym. It does not construct nonabelian H¹.
- `explicitShapiro0` needs continuous multiplication. `explicitShapiro1`
  retains compact totally disconnected G, a closed subgroup, discrete additive
  coefficients and joint action continuity. Degree-two descent/inflation
  supplies degree two; the existing finite-quotient H¹ transition/colimit
  supplies discrete abelian coefficients. None is an arbitrary all-degree or
  nonabelian geometric comparison.
- `MulAction.toPerm` and `toPermHom` have distinct types. The native quotient
  group structure requires normality; the coset action and topological
  quotient projection have wider subgroup scopes. The normal fixed-point
  action and the quotient action are already native. `Subgroup.continuousSMul`
  restricts the **acting** group; it does not supply continuity on an arbitrary
  coefficient subgroup.
- Embedding and quotient continuity lemmas were identified by their qualified
  namespaces, not the first basename match. The product continuity argument
  uses **open** quotient maps. The first-isomorphism group equivalence requires
  surjectivity; its inverse continuity is a separate quotient-topology issue.
  `MonoidHom.liftOfSurjective` requires kernel containment. The colimit proof
  uses the generated duals of the cited native limit lemmas; those remain
  native library results.
- `Torsor` includes nonemptiness and scalar division.
  `IsTopologicalTorsor` includes continuous scalar division. Its orbit
  homeomorphism is the actual native composition with the opposite-group
  homeomorphism. Abstract finite étale fibres and Galois-category groups still
  do not supply the non-affine scheme fundamental group.

## Selected node and signature audit

The fresh detailed screen covers the 49 nodes listed in the packet's
`selectedNodeAudit`: the late `kernel-invariant-gauge` through
`twisted-kernel-invariant-injectivity-iff` families and
`equivariant-topological-torsors`. Their statements, hypotheses, proof
outlines, API/test entries and actual suggested signatures were read.
No new contradiction was established in those families. Their earlier
precursors and every consumer dependency still need the complete matrix before
acceptance. The following calculations are the independent mathematical
support for this selected screen.

For K=ker(f), equivariance and f(u)∈Vᴳ imply that
f(u c(g)(g•u)⁻¹)=1. The ambient gauge expression is a continuous cocycle;
its native subgroup coordinate is continuous through the induced topology.
The compatible action on K remains explicit. Gauging first by v and then by u
uses the ordered product uv. A kernel gauge a changes under u into the kernel
gauge uau⁻¹, so the operation descends to kernel cohomology classes.

Let E=f⁻¹(Vᴳ). Kernel elements act trivially on H¹(G,K). When f is
surjective, E→Vᴳ is surjective with kernel K, so the permutation homomorphism
factors through Vᴳ. Changing a lift changes the representative by a kernel
gauge, establishing class-level lift independence. No continuous choice of
lifts is required, and this set action need not fix the neutral kernel class.

Two kernel classes have equal ambient images precisely when an ambient gauge
relates their representatives. Its projection is invariant, so this is exactly
one Vᴳ-orbit. The inverse of the orbit-to-image equivalence therefore returns
an orbit, independently of a chosen kernel preimage. For a continuous
surjective coefficient map, inverse-gauge normalization yields a kernel-valued
cocycle from every neutral mapped class; this gives the orbit-to-neutral-fibre
equivalence. It does not give an individual, unique kernel class.

For the sign map S₃→ℤˣ with discrete trivial C₃-actions, its kernel is A₃.
The three-cycle and inverse define distinct kernel H¹ classes, since A₃ is
abelian and the original action is trivial. The invariant −1 lifts to (01),
whose conjugation exchanges them. Their **ambient inclusion fibre** is one
invariant orbit containing two kernel classes. This is the concrete
regression against treating the inverse as a unique kernel class.

Twisting transports the neutral fibre of f_c to the original fibre over
[f∘c], with the class translation d↦dc in that order. Applying the kernel
orbit classification in the actual twists gives the specified repointed-fibre
equivalence. The neutral kernel orbit maps to [c]. For the identity map on S₃
and the discrete C₂ transposition cocycle, that image is nonneutral; every
coboundary for the trivial action is the identity cocycle. Injectivity of the
translated kernel-class map is equivalent to triviality of the **whole action
on kernel classes**; triviality of the invariant group is sufficient but not
necessary.

The native torsor bundle was checked against its actual signatures and source
hypotheses. With gp=p cₚ(g), point change p↦p·x changes its cocycle by the gauge
x⁻¹, and the cocycle model has action g⋆y=c(g)g(y). The coordinate
homeomorphism preserves both actions. This confirms the topological
classification abstraction's conventions; the existing algebraic
comparison/descent/effectivity gap remains essential.

## Primary-source and ownership reading

Fresh selected reading used the exact downloaded Kim v1, Kim Albanese v4,
Poonen and Schmidt–Stix PDFs, whose hashes match the packet. The paragraphs
read are distinguished from whole-paper certification. Kim v1 printed pp.5–9
supply the cocycle/gauge conventions, torsor argument, central obstruction and
freeness calculations. Poonen printed pp.11–13, 106–107 and 154–155 supply the
Galois-cohomology conventions, descent/effectivity qualifications and algebraic
torsor/twisting distinctions.

In [Schmidt–Stix Appendix A.3](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p05-p.pdf),
printed pp.861–866, the classifying map is constructed through the nerve of the
fundamental groupoid. A.14 gives a fibrant replacement; A.15 proves the group
map correspondence; A.16 identifies maps to BG with pro-group maps. A.18 uses
the cited homotopy-group detection theorem. The raw comparison's fundamental
model-category and Artin–Mazur leaves are still not closed by this reading.

[Stacks 01ZM](https://stacks.math.columbia.edu/tag/01ZM) separates descent of
finite-presentation objects, descent of their morphisms and eventual equality.
Its proof glues a finite affine descent and descends overlap equations at a
later index. Descent of a cover alone does not prove eventual zero of the
pulled-back cohomology class; the latter uses the separate canonical cohomology
colimit. Finite étale/surjective properties and finite coefficient group laws
retain their own supplier proof requirements.

[Stacks 03RH](https://stacks.math.columbia.edu/tag/03RH) supplies the surrounding
proof of [03RM](https://stacks.math.columbia.edu/tag/03RM): the fundamental
multiplicative/divisor sequence and higher vanishing, using the function-field
vanishing input and Leray. Reading this chain does not establish its cited
Tsen, stalk, Leray and colimit foundations in the atlas.

The seven reviewed library audit records were read with their duplicate-owner
boundaries. Upstream `ReductiveGroups` and
`RepresentationTheory/InductionRestriction` READMEs were read in full at
`2172af4ad0d340223ad59e6a5f698766118142c1` as density/ownership comparators;
ProfiniteCohomology's first 400 lines were also read for its explicit versus
canonical and all-degree colimit contracts. No claim is made to have re-audited
the complete supplier packets or all upstream roadmap links. The reserved
K(π,1) key remains a single owned node; its full-coefficient canonical-map
interface must retain the full fundamental group, with separately scoped raw
homotopy and constant-Fₚ/pro-p comparisons.

## Validation and remaining work

The packet checker reports **0 errors and 0 warnings**. The 138 Mathlib name
checks elaborate with exit 0. The full suggested file was attempted with
`lean-check`; it fails at the unavailable
`TauCeti.RepresentationTheory.Homological.ContCohomology.LowDegree.olean`.
No library build, update, cache download or language server was started.

The final Mathlib projection removes exactly the Tau Ceti import line and the
whole exact `section Abelian` block, retaining `section AbelianTwistingTest`.
It elaborates with exit 0 and **690 warnings, all uses of `sorry`**; there are
no errors or other warnings. The new sign discriminator is proved without an
admission. Available memory was 95 GiB. This verifies prototype expressibility,
not the admitted results or the excluded additive comparisons. Full-file
compilation remains unavailable.

Current suggested SHA-256: `8c77e349c1f417615b452bb59b21424e596097fdea8c2c33287abdd2de28ccee`.
Current projection SHA-256: `0d4eeb9a9b74b5c7a4d54e2721f10431fdf9b3dffa07ea9d772d7c2c9a129b41`.

The remaining work is the earlier nodes' complete consumer/source/API/test
matrix, the transitive geometric/foundation supplier audit, current coverage
and gap reconciliation, planet/duplication screening and the complete
source-error screen. `sourceIssues` remains empty without a completed screen.
Honest partial/not_read stages alone do not require rejection of the
budget-complete pass. No final review verdict should be inferred from this
checkpoint. Resume from the handoff instead of promoting the scoped reading
receipts to verified node verdicts.

## Pinned baseline locators

These locators concern the declarations actually cited, including native
limit declarations whose `to_dual` attributes generate the used colimit
statements. Mathlib is pinned to `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti to
`f790474821cf4256814db967cb154e7af3d0c369`. Ambiguous basename matches were resolved manually.

| Cited reference | Statement at the pin |
|---|---|
| `mathlib:ContinuousMap` | [Mathlib/Topology/ContinuousMap/Defs.lean:33](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/ContinuousMap/Defs.lean#L33) |
| `mathlib:ContinuousMonoidHom` | [Mathlib/Topology/Algebra/ContinuousMonoidHom.lean:57](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/ContinuousMonoidHom.lean#L57) |
| `mathlib:ContinuousSMul` | [Mathlib/Topology/Algebra/MulAction.lean:46](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/MulAction.lean#L46) |
| `mathlib:FixedPoints.subgroup` | [Mathlib/GroupTheory/GroupAction/Defs.lean:203](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/Defs.lean#L203) |
| `mathlib:IsTopologicalGroup` | [Mathlib/Topology/Algebra/Group/Defs.lean:110](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Group/Defs.lean#L110) |
| `mathlib:MulAction.QuotientAction` | [Mathlib/GroupTheory/GroupAction/Quotient.lean:52](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/Quotient.lean#L52) |
| `mathlib:MulAction.orbitRel` | [Mathlib/GroupTheory/GroupAction/Defs.lean:287](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/Defs.lean#L287) |
| `mathlib:MulAction.orbitRel.Quotient` | [Mathlib/GroupTheory/GroupAction/Defs.lean:349](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/Defs.lean#L349) |
| `mathlib:MulAction.toPerm` | [Mathlib/Algebra/Group/Action/Basic.lean:34](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Action/Basic.lean#L34) |
| `mathlib:MulAut.conj` | [Mathlib/Algebra/Group/End.lean:723](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/End.lean#L723) |
| `mathlib:MulDistribMulAction` | [Mathlib/Algebra/Group/Action/Defs.lean:629](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Action/Defs.lean#L629) |
| `mathlib:MulDistribMulAction.toMulAut` | [Mathlib/Algebra/Group/Action/End.lean:232](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Action/End.lean#L232) |
| `mathlib:Multiplicative` | [Mathlib/Algebra/Group/TypeTags/Basic.lean:46](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/TypeTags/Basic.lean#L46) |
| `mathlib:QuotientGroup.Quotient.group` | [Mathlib/GroupTheory/QuotientGroup/Defs.lean:72](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/QuotientGroup/Defs.lean#L72) |
| `mathlib:QuotientGroup.continuous_mk` | [Mathlib/Topology/Algebra/Group/Quotient.lean:44](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Group/Quotient.lean#L44) |
| `mathlib:QuotientGroup.isOpenMap_coe` | [Mathlib/Topology/Algebra/Group/Quotient.lean:52](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Group/Quotient.lean#L52) |
| `mathlib:Subgroup.Normal` | [Mathlib/Algebra/Group/Subgroup/Defs.lean:604](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Defs.lean#L604) |
| `mathlib:Subgroup.center` | [Mathlib/GroupTheory/Subgroup/Center.lean:30](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/Subgroup/Center.lean#L30) |
| `mathlib:Topology.IsQuotientMap` | [Mathlib/Topology/Defs/Induced.lean:166](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Defs/Induced.lean#L166) |
| `mathlib:groupCohomology.IsMulCocycle₁` | [Mathlib/RepresentationTheory/Homological/GroupCohomology/LowDegree.lean:621](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupCohomology/LowDegree.lean#L621) |
| `tauceti:TauCeti.ContCohomology.B1` | [TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:174](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean#L174) |
| `tauceti:TauCeti.ContCohomology.B2` | [TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:494](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean#L494) |
| `tauceti:TauCeti.ContCohomology.H0` | [TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:326](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean#L326) |
| `tauceti:TauCeti.ContCohomology.H1` | [TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:674](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean#L674) |
| `tauceti:TauCeti.ContCohomology.H1EquivOfSmulEqSelf` | [TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:840](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean#L840) |
| `tauceti:TauCeti.ContCohomology.H1pi` | [TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:679](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean#L679) |
| `tauceti:TauCeti.ContCohomology.H2` | [TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:730](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean#L730) |
| `tauceti:TauCeti.ContCohomology.H2pi` | [TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:735](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean#L735) |
| `tauceti:TauCeti.ContCohomology.Z1` | [TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:485](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean#L485) |
| `tauceti:TauCeti.ContCohomology.Z2` | [TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:488](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean#L488) |
| `tauceti:TauCeti.ContCohomology.d0` | [TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:167](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean#L167) |
| `tauceti:TauCeti.ContCohomology.d1` | [TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:228](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean#L228) |
| `mathlib:AlgebraicGeometry.Scheme` | [Mathlib/AlgebraicGeometry/Scheme.lean:42](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Scheme.lean#L42) |
| `mathlib:AlgebraicGeometry.IsLocallyNoetherian` | [Mathlib/AlgebraicGeometry/Noetherian.lean:56](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Noetherian.lean#L56) |
| `mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology` | [Mathlib/AlgebraicGeometry/Sites/Etale.lean:50](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Sites/Etale.lean#L50) |
| `mathlib:continuousCohomology` | [Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean:131](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean#L131) |
| `mathlib:CategoryTheory.PreGaloisCategory.IsFundamentalGroup` | [Mathlib/CategoryTheory/Galois/IsFundamentalgroup.lean:232](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Galois/IsFundamentalgroup.lean#L232) |
| `mathlib:CommAlgCat.FiniteEtale` | [Mathlib/RingTheory/Etale/Finite.lean:58](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Etale/Finite.lean#L58) |
| `mathlib:CommAlgCat.FiniteEtale.fiber` | [Mathlib/RingTheory/Etale/Finite.lean:118](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Etale/Finite.lean#L118) |
| `mathlib:Topology.IsEmbedding.continuous_iff` | [Mathlib/Topology/Maps/Basic.lean:245](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Maps/Basic.lean#L245) |
| `mathlib:MulAction.quotient` | [Mathlib/GroupTheory/GroupAction/Quotient.lean:83](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/Quotient.lean#L83) |
| `mathlib:MulAction.Quotient.smul_mk` | [Mathlib/GroupTheory/GroupAction/Quotient.lean:93](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/Quotient.lean#L93) |
| `mathlib:MulAction.fixedPoints` | [Mathlib/GroupTheory/GroupAction/Defs.lean:116](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/Defs.lean#L116) |
| `mathlib:MulAction.mem_fixedPoints` | [Mathlib/GroupTheory/GroupAction/Defs.lean:133](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/Defs.lean#L133) |
| `mathlib:QuotientGroup.eq` | [Mathlib/GroupTheory/Coset/Defs.lean:198](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/Coset/Defs.lean#L198) |
| `mathlib:QuotientGroup.out_eq'` | [Mathlib/GroupTheory/Coset/Defs.lean:204](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/Coset/Defs.lean#L204) |
| `mathlib:QuotientGroup.mk_out_eq_mul` | [Mathlib/GroupTheory/Coset/Defs.lean:216](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/Coset/Defs.lean#L216) |
| `mathlib:QuotientGroup.leftRel_apply` | [Mathlib/GroupTheory/Coset/Defs.lean:71](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/Coset/Defs.lean#L71) |
| `mathlib:MulAction.left_quotientAction` | [Mathlib/GroupTheory/GroupAction/Quotient.lean:67](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/Quotient.lean#L67) |
| `mathlib:groupCohomology.coindIso` | [Mathlib/RepresentationTheory/Homological/GroupCohomology/Shapiro.lean:59](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupCohomology/Shapiro.lean#L59) |
| `tauceti:TauCeti.ContCohomology.explicitShapiro0` | [TauCeti/RepresentationTheory/Homological/ContCohomology/Shapiro.lean:120](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/Shapiro.lean#L120) |
| `tauceti:TauCeti.ContCohomology.explicitShapiro1` | [TauCeti/RepresentationTheory/Homological/ContCohomology/Shapiro.lean:372](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/Shapiro.lean#L372) |
| `tauceti:TauCeti.ContCohomology.exists_openNormalSubgroup_descendZ2` | [TauCeti/RepresentationTheory/Homological/ContCohomology/FiniteQuotient/DegreeTwoDescent.lean:96](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/FiniteQuotient/DegreeTwoDescent.lean#L96) |
| `tauceti:TauCeti.ContCohomology.exists_explicitInfl2_eq` | [TauCeti/RepresentationTheory/Homological/ContCohomology/FiniteQuotient/DegreeTwoDescent.lean:108](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/FiniteQuotient/DegreeTwoDescent.lean#L108) |
| `tauceti:TauCeti.openActionKernel` | [TauCeti/RepresentationTheory/Homological/ContCohomology/Discrete.lean:133](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/Discrete.lean#L133) |
| `mathlib:ZMod.instIsSimpleAddGroup` | [Mathlib/GroupTheory/SpecificGroups/Cyclic.lean:282](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/SpecificGroups/Cyclic.lean#L282) |
| `mathlib:ZMod.card` | [Mathlib/Data/ZMod/Defs.lean:166](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/ZMod/Defs.lean#L166) |
| `mathlib:ZMod.natCast_self` | [Mathlib/Data/ZMod/Basic.lean:145](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/ZMod/Basic.lean#L145) |
| `mathlib:ZMod.addOrderOf_one` | [Mathlib/Data/ZMod/Basic.lean:122](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/ZMod/Basic.lean#L122) |
| `mathlib:ZMod.unitOfCoprime` | [Mathlib/Data/ZMod/Basic.lean:794](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/ZMod/Basic.lean#L794) |
| `mathlib:ZMod.coe_unitOfCoprime` | [Mathlib/Data/ZMod/Basic.lean:798](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/ZMod/Basic.lean#L798) |
| `mathlib:Nat.card_zmod` | [Mathlib/SetTheory/Cardinal/Finite.lean:249](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/SetTheory/Cardinal/Finite.lean#L249) |
| `mathlib:Subgroup.prod` | [Mathlib/Algebra/Group/Subgroup/Basic.lean:89](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Basic.lean#L89) |
| `mathlib:Subgroup.prod_le_iff` | [Mathlib/Algebra/Group/Subgroup/Basic.lean:137](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Basic.lean#L137) |
| `mathlib:Subgroup.map_le_iff_le_comap` | [Mathlib/Algebra/Group/Subgroup/Map.lean:196](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Map.lean#L196) |
| `mathlib:OpenSubgroup.comap` | [Mathlib/Topology/Algebra/OpenSubgroup.lean:217](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/OpenSubgroup.lean#L217) |
| `mathlib:OpenSubgroup.prod` | [Mathlib/Topology/Algebra/OpenSubgroup.lean:160](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/OpenSubgroup.lean#L160) |
| `mathlib:Subgroup.quotient_finite_of_isOpen` | [Mathlib/Topology/Algebra/OpenSubgroup.lean:289](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/OpenSubgroup.lean#L289) |
| `mathlib:MonoidHom.eqLocus` | [Mathlib/Algebra/Group/Subgroup/Ker.lean:388](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Ker.lean#L388) |
| `mathlib:ConjAct` | [Mathlib/GroupTheory/GroupAction/ConjAct.lean:43](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/ConjAct.lean#L43) |
| `mathlib:ConjAct.toConjAct` | [Mathlib/GroupTheory/GroupAction/ConjAct.lean:76](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/ConjAct.lean#L76) |
| `mathlib:ConjAct.toConjAct_smul` | [Mathlib/GroupTheory/GroupAction/ConjAct.lean:133](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/ConjAct.lean#L133) |
| `mathlib:Subgroup` | [Mathlib/Algebra/Group/Subgroup/Defs.lean:296](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Defs.lean#L296) |
| `mathlib:IsTopologicalGroup.exist_openNormalSubgroup_sub_clopen_nhds_of_one` | [Mathlib/Topology/Algebra/ClopenNhdofOne.lean:31](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/ClopenNhdofOne.lean#L31) |
| `mathlib:isClopen_discrete` | [Mathlib/Topology/Clopen.lean:123](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Clopen.lean#L123) |
| `mathlib:IsClopen.preimage` | [Mathlib/Topology/Clopen.lean:90](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Clopen.lean#L90) |
| `mathlib:isClopen_iInter_of_finite` | [Mathlib/Topology/Clopen.lean:78](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Clopen.lean#L78) |
| `mathlib:Subgroup.Normal.conj_mem'` | [Mathlib/Algebra/Group/Subgroup/Defs.lean:638](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Defs.lean#L638) |
| `mathlib:FixedPoints.mem_subgroup` | [Mathlib/GroupTheory/GroupAction/Defs.lean:208](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/Defs.lean#L208) |
| `tauceti:TauCeti.ContCohomology.descendZ1` | [TauCeti/RepresentationTheory/Homological/ContCohomology/Inflation.lean:291](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/Inflation.lean#L291) |
| `tauceti:TauCeti.ContCohomology.coe_descendZ1_apply_mk` | [TauCeti/RepresentationTheory/Homological/ContCohomology/Inflation.lean:315](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/Inflation.lean#L315) |
| `tauceti:TauCeti.ContCohomology.explicitInfl1_descendZ1` | [TauCeti/RepresentationTheory/Homological/ContCohomology/Inflation.lean:323](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/Inflation.lean#L323) |
| `mathlib:QuotientGroup.induction_on` | [Mathlib/GroupTheory/Coset/Defs.lean:172](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/Coset/Defs.lean#L172) |
| `mathlib:MulAction.coe_quotient_smul_fixedPoints` | [Mathlib/GroupTheory/GroupAction/OfQuotient.lean:34](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/OfQuotient.lean#L34) |
| `mathlib:coe_smul_fixedPoints_of_normal` | [Mathlib/GroupTheory/GroupAction/SubMulAction.lean:612](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/SubMulAction.lean#L612) |
| `mathlib:QuotientGroup.eq_one_iff` | [Mathlib/GroupTheory/QuotientGroup/Defs.lean:120](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/QuotientGroup/Defs.lean#L120) |
| `mathlib:QuotientGroup.mk_mul` | [Mathlib/GroupTheory/QuotientGroup/Defs.lean:163](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/QuotientGroup/Defs.lean#L163) |
| `mathlib:QuotientGroup.isQuotientMap_mk` | [Mathlib/Topology/Algebra/Group/Quotient.lean:40](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Group/Quotient.lean#L40) |
| `mathlib:Topology.IsQuotientMap.continuous_iff` | [Mathlib/Topology/Maps/Basic.lean:360](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Maps/Basic.lean#L360) |
| `mathlib:MulAction.orbitRel_apply` | [Mathlib/GroupTheory/GroupAction/Defs.lean:294](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/Defs.lean#L294) |
| `mathlib:MulAction.mem_orbit_iff` | [Mathlib/GroupTheory/GroupAction/Defs.lean:55](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/Defs.lean#L55) |
| `mathlib:inv_smul_smul` | [Mathlib/Algebra/Group/Action/Defs.lean:499](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Action/Defs.lean#L499) |
| `mathlib:continuous_subtype_val` | [Mathlib/Topology/Constructions.lean:380](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Constructions.lean#L380) |
| `mathlib:Continuous.comp` | [Mathlib/Topology/Continuous.lean:115](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Continuous.lean#L115) |
| `mathlib:Subgroup.continuousSMul` | [Mathlib/Topology/Algebra/MulAction.lean:270](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/MulAction.lean#L270) |
| `mathlib:QuotientGroup.isOpenQuotientMap_mk` | [Mathlib/Topology/Algebra/Group/Quotient.lean:55](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Group/Quotient.lean#L55) |
| `mathlib:IsOpenQuotientMap.prodMap` | [Mathlib/Topology/Constructions/SumProd.lean:647](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Constructions/SumProd.lean#L647) |
| `mathlib:IsOpenQuotientMap.id` | [Mathlib/Topology/Maps/OpenQuotient.lean:35](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Maps/OpenQuotient.lean#L35) |
| `mathlib:IsOpenQuotientMap.continuous_comp_iff` | [Mathlib/Topology/Maps/OpenQuotient.lean:64](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Maps/OpenQuotient.lean#L64) |
| `mathlib:continuous_induced_rng` | [Mathlib/Topology/Order.lean:781](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Order.lean#L781) |
| `mathlib:Continuous.smul` | [Mathlib/Topology/Algebra/MulAction.lean:135](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/MulAction.lean#L135) |
| `mathlib:continuous_fst` | [Mathlib/Topology/Constructions/SumProd.lean:68](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Constructions/SumProd.lean#L68) |
| `mathlib:continuous_snd` | [Mathlib/Topology/Constructions/SumProd.lean:104](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Constructions/SumProd.lean#L104) |
| `mathlib:Equiv.ofBijective` | [Mathlib/Logic/Equiv/Defs.lean:820](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Logic/Equiv/Defs.lean#L820) |
| `mathlib:Equiv.apply_symm_apply` | [Mathlib/Logic/Equiv/Defs.lean:248](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Logic/Equiv/Defs.lean#L248) |
| `mathlib:Equiv.symm_apply_apply` | [Mathlib/Logic/Equiv/Defs.lean:250](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Logic/Equiv/Defs.lean#L250) |
| `mathlib:Equiv.injective` | [Mathlib/Logic/Equiv/Defs.lean:178](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Logic/Equiv/Defs.lean#L178) |
| `mathlib:CategoryTheory.Limits.Types.FilteredColimit.isColimitOf` | [Mathlib/CategoryTheory/Limits/Types/Filtered.lean:59](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Limits/Types/Filtered.lean#L59) |
| `mathlib:OpenNormalSubgroup.instSemilatticeInfOpenNormalSubgroup` | [Mathlib/Topology/Algebra/OpenSubgroup.lean:421](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/OpenSubgroup.lean#L421) |
| `mathlib:CategoryTheory.IsFiltered` | [Mathlib/CategoryTheory/Filtered/Basic.lean:95](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Filtered/Basic.lean#L95) |
| `mathlib:CategoryTheory.Limits.IsLimit.conePointUniqueUpToIso` | [Mathlib/CategoryTheory/Limits/IsLimit.lean:159](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Limits/IsLimit.lean#L159) |
| `mathlib:CategoryTheory.Limits.IsLimit.conePointUniqueUpToIso_inv_comp` | [Mathlib/CategoryTheory/Limits/IsLimit.lean:168](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Limits/IsLimit.lean#L168) |
| `mathlib:CategoryTheory.Limits.limit.isLimit` | [Mathlib/CategoryTheory/Limits/HasLimits.lean:217](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Limits/HasLimits.lean#L217) |
| `mathlib:CategoryTheory.Iso.toEquiv` | [Mathlib/CategoryTheory/Types/Basic.lean:416](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Types/Basic.lean#L416) |
| `tauceti:TauCeti.ContCohomology.explicitFiniteQuotientTransition1` | [TauCeti/RepresentationTheory/Homological/ContCohomology/FiniteQuotient/Explicit.lean:150](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/FiniteQuotient/Explicit.lean#L150) |
| `tauceti:TauCeti.ContCohomology.explicitFiniteQuotientColimit1` | [TauCeti/RepresentationTheory/Homological/ContCohomology/FiniteQuotient/Colimit.lean:493](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/FiniteQuotient/Colimit.lean#L493) |
| `mathlib:MonoidHom.comp` | [Mathlib/Algebra/Group/Hom/Defs.lean:779](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Hom/Defs.lean#L779) |
| `mathlib:MonoidHom.id` | [Mathlib/Algebra/Group/Hom/Defs.lean:750](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Hom/Defs.lean#L750) |
| `mathlib:MonoidHom.comp_apply` | [Mathlib/Algebra/Group/Hom/Defs.lean:806](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Hom/Defs.lean#L806) |
| `mathlib:MonoidHom.one_apply` | [Mathlib/Algebra/Group/Hom/Defs.lean:1026](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Hom/Defs.lean#L1026) |
| `mathlib:map_mul` | [Mathlib/Algebra/Group/Hom/Defs.lean:326](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Hom/Defs.lean#L326) |
| `mathlib:map_inv` | [Mathlib/Algebra/Group/Hom/Defs.lean:440](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Hom/Defs.lean#L440) |
| `mathlib:map_one` | [Mathlib/Algebra/Group/Hom/Defs.lean:234](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Hom/Defs.lean#L234) |
| `mathlib:Subgroup.subtype` | [Mathlib/Algebra/Group/Subgroup/Defs.lean:563](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Defs.lean#L563) |
| `mathlib:MulDistribMulAction.compHom` | [Mathlib/Algebra/GroupWithZero/Action/End.lean:50](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/GroupWithZero/Action/End.lean#L50) |
| `mathlib:MulAction.continuousSMul_compHom` | [Mathlib/Topology/Algebra/MulAction.lean:252](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/MulAction.lean#L252) |
| `mathlib:MulEquiv.refl` | [Mathlib/Algebra/Group/Equiv/Defs.lean:259](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Equiv/Defs.lean#L259) |
| `mathlib:Quotient.congr` | [Mathlib/Logic/Equiv/Defs.lean:884](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Logic/Equiv/Defs.lean#L884) |
| `mathlib:Equiv.trans` | [Mathlib/Logic/Equiv/Defs.lean:161](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Logic/Equiv/Defs.lean#L161) |
| `mathlib:Equiv.symm` | [Mathlib/Logic/Equiv/Defs.lean:145](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Logic/Equiv/Defs.lean#L145) |
| `mathlib:MulEquiv.trans` | [Mathlib/Algebra/Group/Equiv/Defs.lean:405](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Equiv/Defs.lean#L405) |
| `mathlib:MulEquiv.symm` | [Mathlib/Algebra/Group/Equiv/Defs.lean:285](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Equiv/Defs.lean#L285) |
| `mathlib:MulEquiv.symm_apply_apply` | [Mathlib/Algebra/Group/Equiv/Defs.lean:328](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Equiv/Defs.lean#L328) |
| `mathlib:MonoidHom.ker` | [Mathlib/Algebra/Group/Subgroup/Ker.lean:238](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Ker.lean#L238) |
| `mathlib:MonoidHom.mem_ker` | [Mathlib/Algebra/Group/Subgroup/Ker.lean:249](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Ker.lean#L249) |
| `mathlib:QuotientGroup.quotientKerEquivOfSurjective` | [Mathlib/GroupTheory/QuotientGroup/Basic.lean:159](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/QuotientGroup/Basic.lean#L159) |
| `mathlib:Homeomorph.isQuotientMap` | [Mathlib/Topology/Homeomorph/Defs.lean:241](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Homeomorph/Defs.lean#L241) |
| `mathlib:Topology.IsQuotientMap.comp` | [Mathlib/Topology/Maps/Basic.lean:336](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Maps/Basic.lean#L336) |
| `mathlib:QuotientGroup.mk'` | [Mathlib/GroupTheory/QuotientGroup/Defs.lean:88](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/QuotientGroup/Defs.lean#L88) |
| `mathlib:QuotientGroup.mk_surjective` | [Mathlib/GroupTheory/Coset/Defs.lean:165](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/Coset/Defs.lean#L165) |
| `mathlib:Continuous.subtype_mk` | [Mathlib/Topology/Constructions.lean:416](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Constructions.lean#L416) |
| `mathlib:MulEquiv` | [Mathlib/Algebra/Group/Equiv/Defs.lean:75](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Equiv/Defs.lean#L75) |
| `mathlib:MonoidHom.ofInjective` | [Mathlib/Algebra/Group/Subgroup/Ker.lean:205](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Ker.lean#L205) |
| `mathlib:Topology.IsEmbedding.continuous` | [Mathlib/Topology/Maps/Basic.lean:249](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Maps/Basic.lean#L249) |
| `mathlib:Topology.IsInducing.isTopologicalGroup` | [Mathlib/Topology/Algebra/Group/Basic.lean:275](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Group/Basic.lean#L275) |
| `mathlib:MulAction.stabilizer` | [Mathlib/GroupTheory/GroupAction/Defs.lean:515](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/Defs.lean#L515) |
| `mathlib:MulAction.mem_stabilizer_iff` | [Mathlib/GroupTheory/GroupAction/Defs.lean:524](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/GroupAction/Defs.lean#L524) |
| `mathlib:MonoidHom.liftOfSurjective` | [Mathlib/Algebra/Group/Subgroup/Basic.lean:941](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Basic.lean#L941) |
| `mathlib:MonoidHom.liftOfRightInverse_comp_apply` | [Mathlib/Algebra/Group/Subgroup/Basic.lean:946](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Basic.lean#L946) |
| `mathlib:MulAction.toPermHom` | [Mathlib/Algebra/Group/Action/End.lean:184](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Action/End.lean#L184) |
| `mathlib:MulAction.compHom` | [Mathlib/Algebra/Group/Action/Hom.lean:48](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Action/Hom.lean#L48) |
| `mathlib:Equiv.Perm.sign` | [Mathlib/GroupTheory/Perm/Sign.lean:357](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/Perm/Sign.lean#L357) |
| `mathlib:Equiv.Perm.sign_surjective` | [Mathlib/GroupTheory/Perm/Sign.lean:424](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/Perm/Sign.lean#L424) |
| `mathlib:Set.equivOfEq` | [Mathlib/Logic/Equiv/Set.lean:51](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Logic/Equiv/Set.lean#L51) |
| `mathlib:Equiv.subtypeEquiv` | [Mathlib/Logic/Equiv/Basic.lean:263](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Logic/Equiv/Basic.lean#L263) |
| `mathlib:Homeomorph` | [Mathlib/Topology/Homeomorph/Defs.lean:43](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Homeomorph/Defs.lean#L43) |
| `mathlib:Torsor` | [Mathlib/Algebra/Torsor/Defs.lean:70](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Torsor/Defs.lean#L70) |
| `mathlib:IsTopologicalTorsor` | [Mathlib/Topology/Algebra/Group/Torsor.lean:35](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Group/Torsor.lean#L35) |
| `mathlib:Homeomorph.smulConst` | [Mathlib/Topology/Algebra/Group/Torsor.lean:100](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Group/Torsor.lean#L100) |
| `mathlib:MulOpposite.opHomeomorph` | [Mathlib/Topology/Algebra/Constructions.lean:50](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Constructions.lean#L50) |

---

## Prior checkpoint report (retained historical record)

The following is codex-CS32rR's report before this continuation. Its current-count
wording and hashes describe that checkpoint. Its unfinished-review scope and
remaining obligations continue except where this pass explicitly advances them.

## Independent review checkpoint: Anabelian geometry and nonabelian Chabauty

Issue #526, job `REV-AnabelianGeometryAndNonabelianChabauty`. Current reviewer:
Codex `codex-CS32rR`, 2026-10-05. Input explorer commit:
`c5c5af2032b33bc80d5a0353e4abefe392b1d922`, including the earlier independent
review checkpoint [#6170](https://github.com/CBirkbeck/tauceti-explorer/pull/6170)
by `codex-rkkbhf`. Neither reviewer session authored the blueprint.

**This review is unfinished.** No top-level `review` object or acceptance
verdict is written. The packet's `complete` status means a budget-complete
planning pass, not a completed review. NC.0 and NC.3 remain partial; the other
five stages remain not_read. Every implementation status is `unchecked`.

The current packet has 363 nodes: 4 definitions, 60 constructions, 265 lemmas,
27 theorems and 7 comparisons. The checker counts 320 API entries and 250 tests
on definitions/constructions; across all node kinds there are 340 API entries
and 264 tests. There are 160 baseline declarations, 17 supplier requests,
10 gaps and 11 planets. This checkpoint adds one definition node, five
baseline entries and one comparison gap. It removes no baseline citation and
changes no supplier ownership or stage status.

### Corrections in this checkpoint

1. Added `NC.3/equivariant-topological-torsors`, marked
   `addedBy: REV-AnabelianGeometryAndNonabelianChabauty`. The classification
   theorem previously introduced its torsor object without a definition node,
   API or tests. The new node reuses native `Torsor Uᵐᵒᵖ P` and
   `IsTopologicalTorsor P`, adding the compatible G-action and semilinearity.
   It specifies a **nonempty** topological carrier,
   jointly continuous right U- and left G-actions, homeomorphic orbit maps,
   and the semilinearity law. A continuous free transitive action alone does
   not ensure the topology has a continuous orbit inverse.
2. Added the actual `Torsor.Iso`: a native homeomorphism preserving both
   actions, with extensionality, identity, inverse and composition. Added its
   `isoSetoid`, whose relation is `Nonempty (P.Iso Q)`. The prototype now has
   `classOf_eq_classOf_iff` and
   `classification : Quotient (Torsor.isoSetoid G U) ≃ H1 G U`, with the
   quotient evaluation formula. The earlier class map and surjectivity alone
   did not express injectivity on isomorphism classes.
3. Added the orbit homeomorphism by composing native
   `MulOpposite.opHomeomorph` and `Homeomorph.smulConst`, rather than rebuilding
   the underlying torsor action or division. Added the cocycle model and coordinate homeomorphism,
   the right/left coordinate formulas, point-cocycle specification,
   change-of-point formula, preservation by isomorphisms, model cocycle and
   class-map evaluation. A coordinate homeomorphism avoids identifying
   carriers in different universes by an ill-typed equality. The new definition
   has 18 API entries and five typed tests; the classification theorem has
   eight API entries. All corresponding forms are in the suggested file.
4. Added the separate algebraic-torsor comparison gap and qualified the
   classification theorem's geometric acceptance items. Kim's Proposition 1
   classifies filtered affine-algebra torsors, whereas this node is an authored
   topological abstraction of its pointwise argument. Poonen's algebraic
   classification additionally uses Galois descent. A point-space class map
   cannot establish scheme isomorphism or descent/effectivity by itself.
5. Supplied four typed examples for the inherited test names
   `tests.invariants`, `tests.continuity` and `tests.h1_abelian`: negation versus
   trivial C₂-action on ℤ; countably many continuous C₂-characters of the
   countable product versus uncountably many abstract characters; and neutral
   H¹ for C₂ acting by negation on C₃. The action hypotheses are explicit.
6. Supplied the four missing twisting tests. The trivial twist checks its
   action and cocycle evaluations and compatibility with the class map; the
   commutative case checks the original action and translation by c. For
   discrete C₂ acting trivially on S₃ with c(generator)=(01), the twisted
   invariants have cardinality 2, the original invariants have cardinality 6,
   and the twist equivalence carries the neutral point to a nonneutral class.
   The discrete topology, trivial original action and transposition hypotheses
   are retained. Reconciled the omission ledger for these actual examples and
   for already present instances/tests; unrelated omissions remain open.
7. Corrected the reserved K(π,1) node's Schmidt–Stix locator: the cohomological
   criterion is in the **proof** of Lemma 2.7(b), not its statement. Added
   Achinger's version-of-record Definition 4.1 as the direct source for the
   canonical all-degree, all-finite-coefficient predicate, with its coherent
   scope distinguished from the packet's wider parameterized predicate.
8. Visually inspected the scanned degree diagram in Schmidt 1996,
   Proposition 15, printed pp.243–244, and updated the gap's obsolete
   uninspected-diagram wording. The diagram's degree-two restriction is
   multiplication by the covering degree. This does not close the generic
   cohomology, curve-degree or descent suppliers. Replaced the packet's
   outdated summary counts and recorded the current checkpoint in NC.3's
   remaining work.

The previous checkpoint's corrections are retained: `MulAction.toPerm` versus
`toPermHom`; acting-subgroup continuity; `Z1.mem_iff` and the named identity
instance; the actual conjugation-action target of `H1.equivOfTrivial`;
`Z1/H0.equivContCohomology`; named twisted continuity and `Twist.self`; the
four-cocycle/two-class S₃ tests; Kim Albanese §4's locator; and the duplicate
coefficient-map dependency. Its original report remains accessible in #6170.
Historical encoded recovery payloads and receipts are preserved; their build
claims are not independent review evidence.

### Fresh mathematical and source checks

The torsor calculation fixes the order conventions: gp=p·cₚ(g),
cₚ(gh)=cₚ(g)g(cₚ(h)), and cₚᵤ=u⁻¹·cₚ under the existing gauge action
u·c(g)=u c(g)g(u)⁻¹. The model is g⋆x=c(g)g(x), and gauge-related models
are isomorphic by the corresponding left translation. An equivariant
homeomorphism preserves the point cocycle. Conversely, equal gauge classes
identify suitably changed point cocycles, and the two orbit homeomorphisms
produce the required isomorphism. A fixed point is exactly a point with trivial
cocycle. These arguments justify the added abstract signatures, without
claiming their `sorry` proofs are implemented.

Fresh reading included Kim's §1, Propositions 1–3 and proofs on printed pp.5–10
of [arXiv v1](https://arxiv.org/pdf/math/0409456v1), the selected torsor
passages in [Poonen](https://math.mit.edu/~poonen/papers/Qpoints.pdf),
Schmidt–Stix §2.3, pp.826–828 in the
[Annals paper](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p05-p.pdf),
Achinger [2017 §4](https://link.springer.com/article/10.1007/s00222-017-0733-5),
FKW [v2 §2.3.1 and §3.2.2](https://arxiv.org/pdf/2110.05534v2), and the actual
[Schmidt 1996 pages](https://www.numdam.org/article/CM_1996__100_2_233_0.pdf).
The acquired PDFs match the retained packet hashes. This is selected reading,
not whole-paper or all-locator certification.

The reserved `key/etale-k-pi-1` occurs once. Its API/tests cover the inventory's
field, P¹ obstruction, affine and positive-genus curves, characteristic-zero
products, Artin towers/M₀,n and the qualified raw-homotopy comparison. It uses
the canonical comparison in every degree for each permitted coefficient;
p-primary coefficients retain the full fundamental group. The cited raw equivalence retains Achinger's
geometrically-unibranch hypothesis. FKW's constant-Fₚ edge comparison and its specially justified pro-p
inflation are separate inputs. The corresponding geometric Lean interfaces
remain explicit omissions, rather than dummy proposition carriers.

Selected Stacks statements and proofs were checked at tags
[03QQ](https://stacks.math.columbia.edu/tag/03QQ),
[03RQ](https://stacks.math.columbia.edu/tag/03RQ),
[0AMB](https://stacks.math.columbia.edu/tag/0AMB),
[03RR](https://stacks.math.columbia.edu/tag/03RR),
[03PL](https://stacks.math.columbia.edu/tag/03PL),
[03P8](https://stacks.math.columbia.edu/tag/03P8),
[0BA0](https://stacks.math.columbia.edu/tag/0BA0),
[03RP](https://stacks.math.columbia.edu/tag/03RP),
[03RV](https://stacks.math.columbia.edu/tag/03RV),
[09YQ](https://stacks.math.columbia.edu/tag/09YQ) and
[07RR](https://stacks.math.columbia.edu/tag/07RR).
The comparison needs the canonical Kummer boundary and degree pullback, not an
arbitrary H² isomorphism. Separable descent needs both eventual cover descent
and eventual zero of a class; continuity does not make restriction injective.
Generic proofs used by these statements, the full curve section, Künneth and
finite-presentation descent have not been read to closure.

### Baseline, ownership and limits

Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Lean sources were read from those
git objects. The five new entries are native `Homeomorph`
(`Mathlib/Topology/Homeomorph/Defs.lean:43`), `Torsor`
(`Mathlib/Algebra/Torsor/Defs.lean:70`), `IsTopologicalTorsor` and
`Homeomorph.smulConst` (`Mathlib/Topology/Algebra/Group/Torsor.lean:35,100`),
and `MulOpposite.opHomeomorph` (`Mathlib/Topology/Algebra/Constructions.lean:50`).
Their complete statements and bodies were read; there is no finiteness or
separation assumption. The equivariant bundle uses the native torsor and
continuity classes. Native scalar division supplies the continuous orbit inverse,
and the orbit homeomorphism is the actual native composition.

Selected inherited declarations were reread with context, including LowDegree
cochain signs, native continuous cohomology, Shapiro, subgroup actions,
quotient/embedding continuity and finite-quotient transitions/colimits. A
basename search can accidentally find another namespace's declaration;
qualified embedding, quotient-map and action-continuity statements were
inspected separately. This is not a completed audit of all 160 citations
against every consumer. Incoming `checked` receipts remain attributed to their
original authors, not silently converted into this review's verdicts.

Read the seven reviewed library audit records, supplier stage descriptions and
current SF/IG packet inventories. SF.2 is accepted but partial and its current
nodes chiefly cover other owned targets; SF.3 and IG.0/IG.1/IG.6 have no
completed relevant fine-grained supply here. Their requests remain contracts,
not established results. ProfiniteCohomology Layer 10 explicitly owns the
all-degree finite-quotient colimit; the native degree-one additive theorem is
not the arbitrary nonabelian or geometric comparison. The AlgebraicTopology
and JacobianChallenge upstream documents were read as granularity/boundary
comparators. No supplier file, roadmap reader or atlas data was edited.

`sourceIssues` remains empty. No source-error verdict is asserted; the complete
screen remains unfinished. Planet naming and every remaining node's source,
closure, API, tests and typed prototype still need the detailed independent
review described in the handoff.

### Validation

The packet checker reports **0 errors and 0 warnings**. `git diff --check`
passes. The full suggested file was attempted with `lean-check`; import failed
because the existing pinned build lacks
`TauCeti.RepresentationTheory.Homological.ContCohomology.LowDegree.olean`.
No library build, update, cache download or language server was started.

The final temporary Mathlib-only projection removes exactly `import TauCeti.*`
lines and the whole `section Abelian` through `end Abelian`. It elaborated with
`lean-check`, exit code 0: **690 warnings, all uses of `sorry`**, no errors or
other warnings. Available memory was 95 GiB before that check. This checks the
prototype forms, not their proof correctness, and excludes the additive
comparisons. The full suggested file remains uncompiled.

Projection SHA-256:
`3c673ea43f7d115078d17426699c2a8db4f38aafa73e6a44596e9b8b44494a57`.
Suggested file SHA-256:
`7d153ef927b6b1637f5dba083e4b65566e041afb238b8fb5db4e889699e2cb15`.

### Questions for the orchestrator

- Does IG.0's remit explicitly include the geometric product theorem and P¹
  fundamental-group computation, beyond its finite-étale fibre-functor
  dictionary? The requests retain these precise contracts but the current
  finer packet has not supplied them.
- Reconcile the unaccepted EtaleHomotopyTypes candidate with the generic raw
  homotopy/fibration foundations; it cannot be treated as a registered supplier
  or depend on the NC.0 consumer for its generic inputs.

No final verdict should be inferred from this checkpoint.
