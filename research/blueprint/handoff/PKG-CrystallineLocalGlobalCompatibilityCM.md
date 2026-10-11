# PKG-CrystallineLocalGlobalCompatibilityCM — blocked checkpoint

Issue: [#7462](https://github.com/CBirkbeck/tauceti-explorer/issues/7462).
Agent: Codex. Session: `codex-wdRttK`. Date: 2026-10-11.
Branch: `codex-wdRttK-crystalline-package`.
Input commit: `517d1829d0fc041f39f5b88fd54e5ba8459ba55c`.
Claim [6107845953](https://github.com/CBirkbeck/tauceti-explorer/issues/7462#issuecomment-6107845953)
confirmed by [6107847278](https://github.com/CBirkbeck/tauceti-explorer/issues/7462#issuecomment-6107847278).
None of the manager-priority issues was available at selection; the worker
order selected this focus package. This session claimed only this job.

## Outcome

**Blocked on supplier interfaces outside this issue's permitted edits.** This
checkpoint changes only the handoff. It independently rechecks two sufficient
blockers, corrects the inherited CC.8 review status, reconfirms the partial
file's coverage by layer, and gives a concrete readiness condition for resuming.
The existing reader and Lean file are retained; no new arithmetic interface is claimed.

The accepted input is a complete target-level planning pass, not a closed
plan: 97 nodes, 103 API entries, 104 tests, 27 requests and 40 gaps; ten layers
planned and none closed. Its 2026-10-07 review explicitly accepts the pass
while retaining supplier, cubic-tetrahedral, general-coefficient nonvanishing
and journal-collation gaps. A complete pass is not a complete package.

## Sufficient blockers freshly checked

### Integral dual-Weyl coefficients

`REQ-INTEGRAL-WEYL` needs integral dual-Weyl lattices, coefficient extension and
reduction, Levi evaluation onto V_{λ_τ̃} ⊗ V_{−w₀λ_{τ̃c}}, residue-field
Schubert evaluation surjectivity and positive-root weights in its kernel. It
also needs the integral Levi-equivariant splitting V_{λ̃} = V_λ ⊕ W,
W ⊗ E = (1−U)V_{λ̃,E}, and P(O)-stability. An E-linear splitting is insufficient.

Freshly read Caraiani–Newton, [arXiv:2301.10509v3](https://arxiv.org/abs/2301.10509v3),
Lemma 2.1.12 and its proof, printed pp.17–18: transitivity identifies the
induced coefficient object; evaluation becomes surjective after residue-field
reduction, using restriction to the relevant Schubert variety, and Nakayama
then gives integral surjectivity. This requires the integral coefficient
objects and their base-change comparison before the arithmetic theorem can
be typed. The characteristic-zero representation alone cannot substitute.

The [parent plan](../packets/PotentialAutomorphyInfrastructure.json), in its
integral highest-weight gap and restructuring record, assigns these modules
and evaluation maps to `ReductiveGroupsIntegralRepresentationsPartII`, with
no exporting stage ids. A file inventory of roadmap definitions, packets,
suggested files, packages and current upstream roadmaps finds no such owner
exports. Current
upstream ReductiveGroups Layer 9 supplies integral group schemes, rather than
these highest-weight modules and their evaluation/splitting API. Do not invent
an owner stage or rebuild the general supplier in this consumer.

Read the pinned `ClassicalGroups/WeylModule.lean`, lines 114–130, and current
`ClassicalGroups/WeylModule/Basic.lean`, lines 122–138:
`TauCeti.YoungTableau.weylModule` requires `[Algebra ℚ k]` in both. It therefore
does not provide the required O- or O/ϖ^m-coefficient carrier. General algebraic
induction already belongs to IHG §0.7; its inherited reuse contract is below.

The current **LieHighestWeight** roadmap is another insufficient near match:
its standing representation-theory coefficients are an algebraically closed
field of characteristic zero (README §Conventions, lines 75–85;
Suggested.lean, lines 256–258). An integral *weight* there constrains coroot
pairings; it does not supply an integral coefficient lattice or reduction
modulo ϖ. **ReductiveGroupsPartII**'s minuscule fixer-immersion target uses
chosen highest-weight lattice data (README lines 4085–4104), rather than
exporting the general dual-Weyl construction needed here. Those existing
targets must be cited in the owner development, not treated as this missing
coefficient interface.

Consumers: CL.0/lem-2-1-12, CL.0/lem-2-1-17, CL.2/lem-2-2-14,
CL.2/lem-2-2-16, CL.5/cor-4-1-9 and CL.6/lem-4-2-3. The reader retains the
preceding correction to NT16 **Proposition 2.10**; the request still says
“Lemma 2.10”. Reconcile that in a packet-authorized job; this session did not
repeat the full NT16 audit.

### Completed arithmetic towers

`REQ-TOWER` still cites ALS.6. Freshly read accepted
[RS-09](../restructure/RS-09.result.json): ALS.6 supplies finite normal covers,
finite-cover Hochschild–Serre/descent and support/Hecke qualifications. It does
not own completed towers. Their ownership is:

| Required input | RS-09 owner |
|---|---|
| Actual level indexing, conjugation and tower assembly | CC.0 |
| Smooth action on the level colimit | CC.1 |
| Completion, order of limits and Milnor/reduction comparison | CC.2 |
| Completed equivariant chain models and finite recovery | CC.4 |
| Continuous completed descent and derived invariants | CC.6 |
| Completed boundary and support triangle | CC.7 |

A fresh file inventory finds no CC.0–CC.7 packet/package or current upstream
completed-cohomology roadmap. The existing
[CC.8 packet](../packets/CompletedCohomologyPartII--CC.8.json), reader and
suggested file cover only CC.8 (12 nodes, status `complete`). **Correction to
#8841:** the packet now has an accepted independent review,
`independent-review-REV-CompletedCohomologyPartII--CC.8`, dated 2026-10-11,
by Codex session `codex-hFEHBg` (issue #377). This session did not write or
review CC.8. The review reconciles its supplier assignments with RS-09 and
retains three carrier/supplier gaps. Its corrected `sameRoadmapContracts`
still request CC.0–CC.7; accepting CC.8 does not export those earlier layers.
CC.2 supplies completion and coefficient recovery, CC.4 finite deck-coinvariant
recovery, CC.6 completed descent, and CC.7 supports. The present consumer's
`REQ-TOWER` still needs packet-authorized reconciliation and those actual
exports. CC.8 does not discharge the tower request. Packet SHA-256:
`5ed4d50f64c36cf9ebfa2676c18f6e7aa4198bf7ffbf46dbab77c915b3e440b7`.

The reviewed ALS.6 entry in `data/library-coverage.json` distinguishes generic
category limits from the absent arithmetic tower and its Hecke action. Its
older ownership wording is superseded by RS-09. A supplied abstract diagram
cannot replace actual adelic levels, arithmetic coefficient systems and
comparison maps.

Consumers: CL.1/p-ordinary-completed, CL.3/lem-2-3-14,
CL.5/boundary-coefficient-object, CL.5/lem-4-1-6, CL.5/prop-4-1-4,
CL.8/pgl2-cohomology and CL.8/prop-5-5-3. Preserve the reader's corrected
citations. Arithmetic nilmanifold fibrations and integral congruence-limit
acyclicity remain separate inputs, not consequences of a characteristic-zero
Lie-algebra formula.

These two blockers suffice; this is not a fresh audit of all 27 requests.
The issue permits only the package and handoff, expressly forbidding packet
changes. Duplicating missing general theories conflicts with PROTOCOL §15;
substituting arbitrary proposition fields conflicts with §13. Additional
isolated signatures would leave the same missing carriers in place.

## Coverage of the existing Suggested.lean

This session independently counted actual named declarations after removing
Lean comments, and accepted test labels followed by an actual `example` through
only comments/whitespace. The resulting inventory is:

| Layer | Target names | API names | Named examples |
|---|---:|---:|---:|
| CL.0 | 6/10 | 18/18 | 19/19 |
| CL.1 | 1/13 | 3/18 | 3/18 |
| CL.2 | 0/6 | 0/3 | 0/3 |
| CL.3 | 2/16 | 3/12 | 3/12 |
| CL.4 | 0/5 | 0/9 | 0/9 |
| CL.5 | 0/8 | 0/3 | 0/3 |
| CL.6 | 7/13 | 18/21 | 17/21 |
| CL.7 | 0/7 | 0/0 | 0/0 |
| CL.8 | 0/7 | 0/6 | 0/6 |
| CL.9 | 1/12 | 2/13 | 3/13 |
| Total | 17/97 | 44/103 | 45/104 |

Nine supplementary anonymous examples and supplementary signatures are outside
this inventory. Name presence is not certification of the arithmetic
specialization or of source faithfulness. Elaboration cannot certify the
80 omitted target names, 59 omitted API names and 59 omitted named examples.
The independent recount agrees with #8841. The preceding
compression/inventory record is in
[#8826](https://github.com/CBirkbeck/tauceti-explorer/pull/8826).

## Readiness condition and where to resume

Before another attempt can complete this package, obtain both:

1. An owner roadmap for integral highest-weight theory with real stage ids and
   typed integral lattice, base-change, evaluation and splitting exports,
   reusing IHG §0.7. Roadmap signatures with `sorry` suffice at this planning
   stage; implemented proofs are not a prerequisite for packaging.
2. CC.0–CC.7 arithmetic tower exports and packet-authorized reconciliation of
   `REQ-TOWER` with RS-09, including the coefficient/support/Hecke comparisons
   required by the listed consumers.

These are necessary conditions, not an assertion that the other requests are
resolved. The smooth positive-monoid enhancements, actual stage ids, torsion
reconstruction contract and arithmetic/continuity obligations below still need
checking. Also reconcile NT16 Proposition 2.10 in the accepted input.

Owner jobs checked on 2026-10-11:

| Owner work | Issue | State |
|---|---|---|
| Integral representation continuation in ReductiveGroups Part III brief | [#3357](https://github.com/CBirkbeck/tauceti-explorer/issues/3357) | Open, available, design; brief rather than export |
| Completed towers from CC.0 | [#701](https://github.com/CBirkbeck/tauceti-explorer/issues/701) | Open, available, blueprint |
| Completed Hecke application CC.8 | [#702](https://github.com/CBirkbeck/tauceti-explorer/issues/702) | Open, submitted; local packet independently accepted, earlier tower interfaces still requested |

For queue management, the maintainer should keep this package blocked until
these necessary conditions change, then provide a packet-authorized route for
reconciliation. Automatically releasing a checkpoint does not resolve its
mathematical dependencies. No label was changed manually and no owner job was
claimed in this session.

Once the suppliers are available, type and specialize every omitted target,
API and named example to the actual arithmetic objects, elaborate the complete
file, finish the reader and only then add `topic = "math.NT"` as metadata.
Retain the qualified Barsotti–Tate endpoint and the inherited conventions below.

## Validation in this session

- Read WORKERS.md, both protocols and UPSTREAM_GUIDE.md. Read current upstream
  PeripheralActions and ReductiveGroups READMEs in full. Checked the
  parent owner record, RS-09, reviewed ALS.6 audit, CC.8 scope/contracts and
  pinned/current Weyl coefficient assumptions.
- Read-only roadmap commit: `c251d2e42c66f14c279d1e5c2708c5a91d8c8aec`;
  current Tau Ceti: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
  Neither tree was built or edited.
- Accepted input checker: **0 errors, 0 warnings**. Packet SHA-256:
  `116c38b940316cbe91ed2bd0e9d77e1c6537c3e0507edb6622694292dd970a4d`.
- `git diff --check` passes. Intake `check-files`: **1 file, 0 problems**.
  Only this permitted handoff is changed.
- `lean-check` on the existing Suggested.lean: **exit 0, no errors,
  109 warnings, all declaration-uses-sorry**. The approved shared build uses
  the configured Tau Ceti pin `f790474821cf4256814db967cb154e7af3d0c369`;
  Mathlib HEAD was checked as `082e2d37e8b0463410cdb532e111cd43d5a66174`.
  Available memory was 91 GB before checking. No language server or library
  build was started; no check remains running.
- Suggested.lean SHA-256:
  `28b20bcb74a0e2433b287a7c99da1d60e146a74f6c6955d58cb615df4c2bbcb6`.
  Reader SHA-256:
  `b4d490214debf0f054e4c1dd14f4fa879e15757ec3f244eed4a4bcb8ccfa10ed`;
  size **196,980 bytes**, below the 200 KB ceiling. Both are unchanged.
- `metadata.toml` remains absent. `issues.deliverables_complete` uses output
  existence for package jobs, so adding it would misclassify this incomplete
  package. No accepted packet, original reader/suggested file or supplier was
  edited. No scratch artifact is required to resume.
- Fresh CN v3 PDF SHA-256:
  `57abc79ad46875b0ea432ce1193f517b8dbb0ad0448cb51942bc20ed95ffd0c3`.
  Accessed the public v3 source on 2026-10-11. Only Lemma 2.1.12, its
  pp.17–18 proof and the adjacent coefficient setup were reread for this
  checkpoint;
  the source audits below remain inherited. No source passage is copied here.

## Previous checkpoint additions to retain

[#8833](https://github.com/CBirkbeck/tauceti-explorer/pull/8833) added
`CrystallineCM.subquotient_mod_p_pow_unique` and
`CrystallineCM.subquotient_mod_p_pow_equivariant` to README §3.6 and
Suggested.lean. They retain the actual image of N′ in N/p^eN and the square
with a chosen presentation f : N′ → M. Precomposition with the surjective
canonical map onto that image proves uniqueness; the same cancellation proves
intertwining when the generating maps intertwine a common monoid action.
Arithmetic actions still require their supplier. These statements do not need
finite generation, surjectivity of f or positive depths; those assumptions
belong to the existing existence/Artin–Rees depth-control statements. Both
suggested proofs are `sorry`.

That preceding worker checked CN v3 Lemma 2.3.18, p.43. The supplementary
statements are consequences of the comparison square, rather than extra
claims attributed to that source lemma. Preserve the full ambient quotient,
the depth-one failure for pZ_p in Z_p, and its depth-two repair examples.
The preceding complete check record remains in #8833.

## Inherited mathematical resume contracts

These are the preceding workers' authored source and interface checks, preserved
for continuity. They are not fresh source-reading claims for `codex-wdRttK`.
For the preceding full audit records, see
[#8807](https://github.com/CBirkbeck/tauceti-explorer/pull/8807) and
[#8800](https://github.com/CBirkbeck/tauceti-explorer/pull/8800).

### Algebraic induction and compatible reconstruction

The preceding continuation established that IHG §0.7 already owns
`AlgebraicInduction.module`, its cotensor equalizer, `moduleComodule`,
`reciprocity` and the counit `reciprocity_apply`. The integral highest-weight
owner should specialize that carrier; IHG §6.4's GL₂ good-filtration theory
does not establish arbitrary GL_{2n} integral Siegel evaluation and splitting.
Its F(hg) = hF(g) convention compares by inversion with Jantzen I.3.3–3.7,
pp.38–41, in the cleared second edition. That source audit is inherited.

IHG README §1.6 and `Theorems.compatible_local_reconstruction` already allow a
surjection B→A with B local and A henselian local, without requiring A flat.
In CN Proposition 4.2.13, B = Ã is finite flat over O, whereas A is the torsion
Hecke quotient. The arithmetic application must supply equality of full
determinant laws, actual global/local corner identities, generic-fiber basis
comparisons and continuity of the local corner action. Algebraic assembly
returns a B-valued conjugate reducing exactly to the fixed global representation
and retaining the selected generic constituents; it does not construct the
finite flat algebra, projectors, continuity or crystalline data. Preserve the
rank-one O→O/ϖ test against an unnecessary flatness hypothesis on A.

The preceding worker read CN arXiv:2301.10509v3 §3.2, Lemma 3.2.2 and
Proposition 3.2.4, pp.47–50, and Proposition 4.2.13, pp.69–71. Retarget
`REQ-COMPATIBLE-LOCAL-RECONSTRUCTION` in a packet-authorized job to the existing
IHG §1.6 export and these arithmetic inputs, rather than requesting a second
generic theorem. The README already retains this distinction.

### Smooth monoids and derived ordinary parts

The inherited phrase “missing smooth category” needs a narrower interpretation.
At the pinned Tau Ceti commit, the preceding continuation read the following
interfaces in `RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean`.
That historical continuation also read the monoid predicate, restriction and category:

| Declaration | Locator and actual scope |
|---|---|
| `TauCeti.IsSmoothDiscrete` | Lines 245–259; `[Monoid G]`, a discrete underlying module and open point stabilizers. |
| `TauCeti.IsSmoothDiscrete.res` | Lines 268–270; continuous monoid restriction preserves that predicate. |
| `TauCeti.SmoothDiscreteTopRep` | Lines 530–538; the corresponding full subcategory of `TopRep`. |
| `TauCeti.discreteRepEquivSmoothTopRep` | Lines 642–645 and 678–688; the section requires `[Group G]` and `[IsTopologicalGroup G]`. |

The current library keeps these interfaces in `SmoothDiscrete/Basic.lean`:
predicate lines 270–275, restriction line 303, category lines 612–618,
equivalence line 834. The monoid carrier is therefore already present and must
not be recreated here. Its group coefficient equivalence must not be invoked
for a positive monoid without a separate comparison theorem.

The current upstream `SmoothRepresentationsOfLocalGroups` has the actual stages
`SR.0` and `SR.0d`. The preceding continuation read its Suggested.lean
lines 332–394: `SmoothRep`,
`SmoothRep.instAbelian` and `SmoothRep.instIsGrothendieckAbelian` require a
topological **group**. `SmoothRep.res_preserves_injective` (lines 3011–3014)
likewise takes an open subgroup. README `SR.0d.1` and `SR.0d.2` plan the group
derived category and compact-normal-subgroup composition. They do not establish
the positive-monoid interfaces merely by providing the group category.

The preceding checkpoint read the current **SR.6.5 Stable module operators**
README and its actual Suggested.lean declarations, lines 1712–1730 and
7270–7309. `StableOperator.localization` and `localizationMap` define the
module direct limit with transition T^(j−i) and its index-zero map.
`invertiblePart` supplies an equivalence from range(T^c) under
`StableOperator T`. `localization_nilpotent`, `localization_identity` and
`localization_mixed` state the underlying module checks. These are roadmap
signatures with `sorry`, not implemented Tau Ceti theorems. They have no
representation action or smoothness data. Upstream's
`RationalParabolic.jacquet_localization` is a separate complex-coefficient
Jacquet comparison, not the required torsion positive-monoid functor.
Do not repeat either construction or infer the missing derived comparison
from an equivalence of underlying modules.

The preceding checkpoint read CN v3 §2.2.2 and Definition 2.2.3, pp.26–27.
Required exports to resume:

1. Compare arithmetic smoothness on Δ̃_P and Δ⁺ with the existing monoid
   carrier; provide its abelian/enough-injectives interface.
2. Construct monoid-valued RΓ(U₀,−), retaining the finite-transfer Δ⁺ action;
   establish U₀-acyclicity after the specific monoid restrictions.
3. Localize smooth Δ⁺-objects at the selected central ũ_n to smooth
   Δ-objects; prove exactness and the injective-preservation comparison used
   for derived compact Levi invariants. A finite ordinary projector on a finite
   module does not define localization of arbitrary smooth modules.
4. Supply the coefficient-injective coinduction and higher ordinary open-cell
   acyclicity of CN Lemma 2.3.6, pp.36–37, separately from degree-zero transfer.

These belong to the smooth-representation supplier's monoid extension. The
package now uses the current stage names and states the extra contracts rather
than asserting that existing group prototypes export them. The accepted packet
still uses the old labels: a job authorized to edit that packet should reconcile
`REQ-SMOOTH`, `REQ-DEEP-PERFECT` and `REQ-DERIVED-INVARIANTS` with the actual
stages and assign ids to the additional monoid exports. Deep-perfect restriction
remains a separate requested theorem; this run does not certify it from the
existence of the group-derived category.

### Material to preserve when resuming

The previous signature work and its detailed explanations are retained in the
package. [#8715](https://github.com/CBirkbeck/tauceti-explorer/pull/8715)
contains an earlier handoff if its full history is needed.

| Typed core | Boundary and essential convention |
|---|---|
| Block exchange, positive exponent cone and integral block parahorics | Block exchange differs from full reversal; exponents allow negative central shifts; upper-right parahoric block is free. |
| Positive parahoric monoid | Actual DVR double-coset union; invert only the chosen central Siegel element. Split-place, topology and arithmetic Levi action are separate inputs. |
| Lowest-weight scaling and rescaled actions | Actual supplied exponent map, separate full/blockwise Weyl permutations and inverse scalar rescaling. PA.0's ACC character has a different normalization. |
| Unipotent transfer | Explicit integral finite coset sum with raw intertwining action. On trivial F_p coefficients, index-p transfer is zero. Smoothness and derived enhancement are separate inputs; reuse existing generic trace/corestriction. |
| Determinant-norm unit character | Actual determinant norm and p-adic unit normalization; this does not construct top continuous unipotent cohomology. |
| Integral/torsion Hecke images | Ranges of the actual supplied localized actions; arithmetic coefficient reduction and base change require comparisons. |
| Middle/dual Hecke images | Rational injection needs M→E⊗M injective. Adjoint image descent needs the actual perfect pairing, degree/support data and involution. Dual coefficients precede cohomology; torsion linear duals can vanish. |
| Deep Levi and unitary levels | Integral component maps are defined on K, with the actual local uniformizer. Pull back Levi selection from F⁺ to both conjugate places; unitary levels permit upper unipotents. |
| Numerical degree bound and adic subquotients | Retain floor/ceiling conventions in odd dimension, and the canonical Artin–Rees image, natural square and uniform coefficient-depth shift. |
| Determinant-kernel criterion | Projective image is conjugation image in ambient GL₂. Retain the cubic A₄ exception; the F₇ quaternion computation discriminates it. |

Preserve geometric Frobenius, the reversed first unitary weight block, the
coefficient-valued dual exterior-power computation, independent ambient
2n-dimensional decomposed genericity, arbitrary-prime deep splitting,
input-independent nilpotence exponents and the incoming-differential correction
in CN Proposition 4.2.6. Full-range unipotent nonvanishing is specified at zero
selected weights only. The Barsotti–Tate endpoint retains
`[F(ζ_p):F] ≠ 3` or projective residual image different from A₄; the unrestricted
case remains `GAP-CUBIC-TETRAHEDRAL`. Solvable preparation preserves the full
residual-plus-cyclotomic field. AKT numbering remains arXiv:1910.12986v2;
journal collation is still an explicit gap.

Remaining layer interfaces: CL.0 integral weights and arithmetic Hecke actions;
CL.1 smooth/derived open-monoid categories and actual towers; CL.2 dual/inverse
monoid coefficient comparisons; CL.3 compact-mod-parabolic induction and
continuous cochains; CL.4 cuspidal local Hecke systems and filtered (φ,N)/Galois
carriers; CL.5 supported arithmetic derived objects and retracts; CL.6 arithmetic
cohomology actions, localized comparison and cuspidal realization; CL.7 absolute
Galois and crystalline/ordinary deformation data; CL.8 enhanced non-neat PGL₂
complexes and derived support; CL.9 fixed determinants, local types,
Taylor–Wiles, Selmer and base-change data.

### Additional coefficient conventions

Quasi-ordinary parts require simultaneous generalized eigenspaces with
valuation-zero eigenvalues, splitting-field descent and scalar-extension
comparisons from `PadicFamilies:L0a`. The two scalar operators 1 and p on an
E-line are both invertible over E, yet their simultaneous unit-eigenvalue part
is zero. Finite/profinite Fitting invertibility does not supply this interface.
Preserve HT(ε⁻¹)=+1 alongside the other normalization conventions above.
