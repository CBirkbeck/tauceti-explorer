# PKG-CrystallineLocalGlobalCompatibilityCM — blocked checkpoint

Issue: [#7462](https://github.com/CBirkbeck/tauceti-explorer/issues/7462).
Agent: Codex. Session: `codex-I45l3p`. Date: 2026-10-11.
Branch: `codex-I45l3p-crystalline-package`.
Input commit: `22b9809c23bc18e23897f4497776cfc83408502d`.
Claim [6107601365](https://github.com/CBirkbeck/tauceti-explorer/issues/7462#issuecomment-6107601365)
confirmed by [6107602356](https://github.com/CBirkbeck/tauceti-explorer/issues/7462#issuecomment-6107602356).
None of the manager-priority issues was available at selection; this was an
eligible focus package. This session claimed only this job.

## Outcome and concrete change

**Blocked on missing supplier interfaces; this is not a complete package.**
The previously supplied algebraic cores are retained. This checkpoint adds two
supplementary signatures to README §3.6 and Suggested.lean:

- `CrystallineCM.subquotient_mod_p_pow_unique`: at a fixed ambient depth,
  two maps out of the actual image of N′ in N/p^eN coincide if they satisfy
  the same square with the chosen presentation f : N′ → M.
- `CrystallineCM.subquotient_mod_p_pow_equivariant`: that comparison intertwines
  supplied representations of a common monoid, provided both generating maps
  intertwine the same action on N′. The monoid may be the multiplicative monoid
  of a Hecke algebra. Arithmetic actions still require their actual supplier.

These requirements were already described in the reader's comparison proof;
they now have typed signatures. The actual quotient image and comparison square
are retained. There are no new carriers or unspecified proposition fields.
Both proofs are `sorry`, as required for the suggested roadmap file.

The proof outline is elementary: the canonical map from N′ onto its quotient
image is surjective (`LinearMap.surjective_rangeRestrict` in pinned Mathlib).
For uniqueness, precompose both maps with it. For equivariance, precompose
both proposed intertwining maps, use the supplied equivariance identities and
the square, and cancel the surjection. Neither consequence needs finite
generation, a surjective f, or positive depths; those hypotheses enter the
existing existence and Artin–Rees depth-control statements. No arithmetic
comparison or tower is constructed by these consequences.

Freshly read Caraiani–Newton, arXiv:2301.10509v3, Lemma 2.3.18 and its proof,
printed p.43: the relevant object is the image of N′ in the ambient reduction,
and the deeper coefficient exponent comes from Artin–Rees. These supplementary
signatures are consequences of the chosen square, rather than additional
claims attributed to that lemma. The existing three checks (the full ambient
quotient; failure at depth one for pZ_p in Z_p; repair at depth two) remain.

The accepted input is a complete target-level **planning pass**, not a closed
plan: 97 nodes, 103 API entries, 104 tests, 27 requests, 40 gaps; ten layers
planned and none closed. Its review explicitly distinguishes these outcomes.
The inherited inventory of packet-named declarations remains 17/97 target
names, 44/103 API names and 45/104 named examples; these two supplementary
signatures are outside that inventory. This is a name count, not certification
of every arithmetic specialization. Successful elaboration does not certify
the 80 omitted target names, 59 API names or 59 named examples. The preceding
checkpoint's detailed inventory and reader compression are recorded in
[#8826](https://github.com/CBirkbeck/tauceti-explorer/pull/8826).

## Sufficient blockers checked in this session

### Integral dual-Weyl coefficients

`REQ-INTEGRAL-WEYL` needs integral dual-Weyl lattices with base change and
reduction, Levi evaluation onto V_{λ_τ̃} ⊗ V_{−w₀λ_{τ̃c}}, Schubert evaluation
surjectivity after reduction, and positive-root weights in its kernel. It also
needs the integral Levi-equivariant splitting V_{λ̃} = V_λ ⊕ W, the equality
W ⊗ E = (1−U)V_{λ̃,E}, and P(O)-stability. An E-linear splitting alone is
insufficient.

The [parent plan](../packets/PotentialAutomorphyInfrastructure.json), in its
integral highest-weight gap and restructuring record, assigns these general
modules and evaluation maps to `ReductiveGroupsIntegralRepresentationsPartII`
and records no exporting stage ids. The owner still has no packet, suggested
file, package or current upstream roadmap. Upstream ReductiveGroups Layer 9
supplies integral group schemes, not the missing integral highest-weight
modules, evaluation or splitting.

Read the pinned and current `TauCeti.YoungTableau.weylModule` declarations:
both require `[Algebra ℚ k]` (pinned `ClassicalGroups/WeylModule.lean`,
lines 114–130; current `WeylModule/Basic.lean`, same declaration and assumptions).
They do not supply O- or O/ϖ^m-coefficients. Reuse the existing general algebraic
induction of IHG §0.7; it does not discharge these missing integral contracts.
Do not invent an owner stage id.

Consumers: CL.0/lem-2-1-12, CL.0/lem-2-1-17, CL.2/lem-2-2-14,
CL.2/lem-2-2-16, CL.5/cor-4-1-9 and CL.6/lem-4-2-3.
The README retains the preceding correction to **NT16 Proposition 2.10**;
the request still says “Lemma 2.10”. Reconcile this in a packet-authorized job.
This session did not repeat the full NT16 source audit.

### Completed arithmetic towers

`REQ-TOWER` still cites ALS.6. Read accepted [RS-09](../restructure/RS-09.result.json):
ALS.1/3/4/6 supply finite-level geometry, cochains/support and finite descent.
The actual arithmetic tower belongs to `CompletedCohomologyPartII`:

| Required input | Ownership in RS-09 |
|---|---|
| Actual level indexing, conjugation and tower assembly | CC.0 |
| Smooth action on the level colimit | CC.1 |
| Completion, order of limits, Milnor/reduction comparison | CC.2 |
| Completed equivariant chain models and finite recovery | CC.4 |
| Continuous completed descent and derived invariants | CC.6 |
| Completed boundary and support triangle | CC.7 |

**Inventory correction to the previous handoff:** a
[CC.8 packet](../packets/CompletedCohomologyPartII--CC.8.json), reader and
suggested file now exist. The packet has status `complete`, covers only CC.8
(12 nodes), and has no independent review object. Its `sameRoadmapContracts`
requests CC.0–CC.7; it does not export the missing tower. There is still no
CC.0–CC.7 packet/package or current upstream completed-cohomology roadmap.
The stage contracts must be reconciled with RS-09 before citation as exports.

Read the reviewed ALS.6 entry in `data/library-coverage.json`: generic limits
are distinct from the missing arithmetic tower and Hecke action. Its old
ownership wording is superseded by RS-09. Generic derived categories or assumed
diagrams cannot construct actual adelic levels and arithmetic comparison maps.

Consumers: CL.1/p-ordinary-completed, CL.3/lem-2-3-14,
CL.5/boundary-coefficient-object, CL.5/lem-4-1-6, CL.5/prop-4-1-4,
CL.8/pgl2-cohomology and CL.8/prop-5-5-3. Preserve the existing corrected reader
citations. ALS.2's arithmetic nilmanifold fibration and integral congruence-limit
acyclicity are separate inputs, not consequences of a characteristic-zero
Lie-algebra formula.

These blockers suffice without claiming a fresh audit of all 27 requests.
The issue permits package files and this handoff only, expressly forbidding
packet changes. Rebuilding missing general theories in the consumer conflicts
with PROTOCOL §15; arbitrary proposition fields conflict with §13. Completion
therefore requires owner exports and packet-authorized reconciliation outside
this issue, rather than more elapsed time on the package.

Fresh owner-job statuses on 2026-10-11:

| Owner work | Issue | Status |
|---|---|---|
| Integral representation continuation in ReductiveGroups Part III brief | [#3357](https://github.com/CBirkbeck/tauceti-explorer/issues/3357) | Open, available, design; routing brief rather than export |
| Completed towers from CC.0 | [#701](https://github.com/CBirkbeck/tauceti-explorer/issues/701) | Open, available, blueprint |
| Completed towers from CC.8 | [#702](https://github.com/CBirkbeck/tauceti-explorer/issues/702) | Open, submitted, blueprint |

No other issue was claimed and no label was changed manually.

## Validation

- Read WORKERS.md, both protocols and UPSTREAM_GUIDE.md; read current upstream
  PeripheralActions and InductionRestriction READMEs in full. Read pinned
  Artin–Rees and quotient/range interfaces, pinned/current Weyl assumptions,
  the parent owner record, RS-09, reviewed ALS.6 audit and CC.8 contracts.
- Read-only roadmap commit: `c251d2e42c66f14c279d1e5c2708c5a91d8c8aec`;
  current Tau Ceti: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
  Neither tree was built or edited.
- Accepted input checker: **0 errors, 0 warnings**, with the counts above.
  Packet SHA-256:
  `116c38b940316cbe91ed2bd0e9d77e1c6537c3e0507edb6622694292dd970a4d`.
- `lean-check` on the changed Suggested.lean: **exit 0, no errors, 109 warnings,
  all declaration-uses-sorry**, against pinned Mathlib
  `082e2d37e8b0463410cdb532e111cd43d5a66174` and the supplied shared Tau Ceti
  build pinned at `f790474821cf4256814db967cb154e7af3d0c369`. Available memory
  was 99 GB before checking. No language server or library build was started;
  no check remains running. Suggested.lean SHA-256:
  `28b20bcb74a0e2433b287a7c99da1d60e146a74f6c6955d58cb615df4c2bbcb6`.
- Reader size: **196,980 bytes**, below the 200 KB ceiling. Only the paragraph
  specifying these two consequences is added; all prior targets, named APIs,
  examples and source locators are retained.
- `git diff --check` passes. Intake `check-files`: **3 files, 0 problems**.
  Only the permitted README, Suggested.lean and handoff are changed.
- `metadata.toml` remains absent: `issues.deliverables_complete` tests output
  existence for package jobs, so adding it would misclassify this incomplete
  package. No accepted packet, original reader/suggested file or supplier was
  edited. No scratch artifact is required to resume.
- Fresh CN source SHA-256:
  `57abc79ad46875b0ea432ce1193f517b8dbb0ad0448cb51942bc20ed95ffd0c3`.
  Only Lemma 2.3.18 and its p.43 proof were reread for this addition; source
  checks below remain inherited. No source passage is copied into the package.

## Where to resume

1. Route integral highest-weight exports through their owner, reusing IHG §0.7.
   Obtain CC arithmetic tower exports and the separate smooth positive-monoid
   enhancements. These are owner jobs, not further jobs claimed here.
2. In a packet-authorized job, connect real supplier declarations, retarget
   `REQ-TOWER`, reconcile CC stage contracts and smooth stage ids, and correct
   NT16 Proposition 2.10. Preserve the IHG §1.6 torsion-target reconstruction
   finding and separate arithmetic/continuity obligations below.
3. Type and specialize every omitted target, API and named example to actual
   arithmetic objects. Retain the comparison image, square, uniqueness and
   equivariance above and the qualified Barsotti–Tate endpoint below.
4. Elaborate the complete file, finish the reader, and only then add
   `topic = "math.NT"` as metadata.

## Inherited mathematical resume contracts

These are the preceding workers' authored source and interface checks, preserved
for continuity. They are not fresh source-reading claims for `codex-I45l3p`.
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
