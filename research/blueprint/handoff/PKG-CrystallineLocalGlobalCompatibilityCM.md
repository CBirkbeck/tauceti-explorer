# PKG-CrystallineLocalGlobalCompatibilityCM — blocked checkpoint

Issue: [#7462](https://github.com/CBirkbeck/tauceti-explorer/issues/7462).
Agent: Codex (GPT-6). Session: `codex-i7uAjY`. Date: 2026-10-11.
Branch: `codex-i7uAjY-crystalline-package`.
Input commit: `f90586176babd13aa942990deccd87b0a40d5abb`.
Claim [6107225079](https://github.com/CBirkbeck/tauceti-explorer/issues/7462#issuecomment-6107225079)
confirmed by [6107226008](https://github.com/CBirkbeck/tauceti-explorer/issues/7462#issuecomment-6107226008).
No manager-priority issue was available; this was the eligible focus package.
This session claimed only this job.

## Outcome and concrete change

**Blocked on missing supplier interfaces; this is not a complete package.**
The package Suggested.lean now imports thirteen individual Mathlib modules
instead of the Mathlib root. Its existing Tau Ceti Artin–Rees import remains.
The imports expose the actual matrix, tensor base-change, representation
invariants/duals, p-adic residue, DVR, finite-dimension, alternating-group and
arithmetic tactic APIs used by the supplied signatures. Every declaration,
hypothesis, proof and example below the import block is unchanged.

`lean-check` finished with **exit 0, no errors and 107 warnings, all
“declaration uses sorry”**. The change removes reliance on the root import,
as required by PROTOCOL.md §13; it adds no implementation or arithmetic target.
The README is unchanged. The repeated historical handoffs are consolidated here;
mathematical resume contracts from earlier workers are retained below.

The accepted input is a complete target-level **planning pass**, rather than a
closed plan: 97 nodes, 103 API entries, 104 tests, 27 requests and 40 gaps;
all ten layers are planned, none closed. Its review explicitly says this.
A fresh name inventory, removing nested block comments and requiring each
named-test label to be followed by an actual example (allowing explanatory line
comments), gives:

| Layer | Target names present/total | API names present/total | Named examples present/total |
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
| Total | **17/97** | **44/103** | **45/104** |

This is a name inventory, not a certification that each core expresses its full
arithmetic specialization. The omitted counts are 80/59/59. Successful
elaboration certifies the supplied signatures, not the omitted ones.

## Sufficient blockers checked in this session

### Integral dual-Weyl coefficients

The consumer's `REQ-INTEGRAL-WEYL` requires integral dual-Weyl lattices,
coefficient extension and reduction, Levi evaluation onto
V_{λ_τ̃} ⊗ V_{−w₀λ_{τ̃c}}, Schubert evaluation surjectivity after reduction and
positive-root weights in the kernel. It also requires the integral
Levi-equivariant splitting V_{λ̃} = V_λ ⊕ W and the identification
W ⊗ E = (1−U)V_{λ̃,E}, with the required P(O)-stability. An E-linear splitting
alone does not establish this integral statement.

The [parent plan](../packets/PotentialAutomorphyInfrastructure.json), in its
integral highest-weight gap and restructuring record, assigns the general
induced/Weyl/dual-Weyl theory to `ReductiveGroupsIntegralRepresentationsPartII`
and explicitly records that its exporting stages do not exist. This owner has
no packet, suggested file, package or current upstream roadmap. No stage id
should be invented. Upstream ReductiveGroups Layer 9 builds integral group
schemes, not these integral highest-weight modules and evaluation maps.

Read the pinned `TauCeti.YoungTableau.weylModule` declaration and its local
variable assumptions directly: it requires `[Algebra ℚ k]`. The current
`WeylModule/Basic.lean` retains that assumption. Neither version supplies
coefficients over O or O/ϖ^m. General algebraic induction, whose reuse was
established by a preceding worker, does not discharge these integral
base-change, evaluation and splitting obligations.

Consumers: CL.0/lem-2-1-12, CL.0/lem-2-1-17, CL.2/lem-2-2-14,
CL.2/lem-2-2-16, CL.5/cor-4-1-9 and CL.6/lem-4-2-3.
The existing README retains the preceding source correction to **NT16
Proposition 2.10**; the request still says “Lemma 2.10”. That packet edit needs
separate authorization. This session did not repeat the CN/NT16 source audit.

### Completed arithmetic towers

The consumer's `REQ-TOWER` still cites `ArithmeticLocallySymmetricSpaces:ALS.6`.
Read accepted [RS-09](../restructure/RS-09.result.json): ALS.6 retains
finite-level descent. The actual tower is owned by `CompletedCohomologyPartII`:

| Required input | Owner |
|---|---|
| Finite-level cochains, Hecke/support maps and finite descent | ALS.1, ALS.3, ALS.4, ALS.6 |
| Actual level indexing, conjugation and tower assembly | CC.0 |
| Smooth local action on the level colimit | CC.1 |
| Completion, order of limits, Milnor/reduction comparison | CC.2 |
| Completed equivariant chain models and finite recovery | CC.4 |
| Continuous completed descent and derived invariants | CC.6 |
| Completed boundary and support triangle | CC.7 |

That owner has no packet, suggested file, package or current upstream roadmap.
Read the reviewed `data/library-coverage.json` entry for ALS.6: it separates
generic category-theoretic limits from the absent arithmetic tower and its
Hecke actions. Its older ownership wording is superseded by RS-09. An assumed
diagram or generic derived-category carrier does not construct the actual
adelic level system or its arithmetic comparison maps.

Consumers: CL.1/p-ordinary-completed, CL.3/lem-2-3-14,
CL.5/boundary-coefficient-object, CL.5/lem-4-1-6, CL.5/prop-4-1-4,
CL.8/pgl2-cohomology and CL.8/prop-5-5-3. Preserve the README's corrected owner
citations. ALS.2's arithmetic nilmanifold fibration and integral congruence-limit
acyclicity remain distinct inputs; a characteristic-zero Lie-algebra formula
cannot supply them.

These blockers suffice without a new audit of all 27 requests. The issue
expressly permits only package files and this handoff, and forbids packet edits.
Building the missing general theories in the consumer would violate
PROTOCOL.md §15. Unspecified proposition fields would violate §13. The §20
completion requirement therefore depends on work outside this issue's scope,
rather than on using more of the eight-hour allowance.

Owner-job statuses checked through GitHub on 2026-10-11:

| Work to route | Issue | Status at check |
|---|---|---|
| Integral representation continuation in the ReductiveGroups Part III brief | [#3357](https://github.com/CBirkbeck/tauceti-explorer/issues/3357) | Open, state:available, kind:design; a routing brief, not a supplying export |
| Completed towers from CC.0 | [#701](https://github.com/CBirkbeck/tauceti-explorer/issues/701) | Open, state:available, kind:blueprint |
| Completed towers from CC.8 | [#702](https://github.com/CBirkbeck/tauceti-explorer/issues/702) | Open, state:claimed, kind:blueprint |

No owner job was claimed here. No issue label was changed manually. The
maintainer needs to route the owner exports and packet-authorized reconciliation
before another completion attempt can satisfy this package's requirements.

## Validation

- Read WORKERS.md, both protocols and UPSTREAM_GUIDE.md. Read current upstream
  ReductiveGroups and PeripheralActions READMEs in full. Read the parent owner
  gap, RS-09 ownership, ALS.6 reviewed audit and pinned/current Weyl assumptions.
- Current read-only roadmap commit:
  `070dc2becd74419e76303ede84b465ed4a69461f`; current Tau Ceti commit:
  `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. No build was run in either tree.
- `python3 scripts/check_blueprint.py` on the accepted input: **0 errors,
  0 warnings**, confirming its planning-pass counts above.
- `lean-check` on the changed package Suggested.lean: **exit 0, no errors,
  107 sorry-only warnings**, at pinned Mathlib
  `082e2d37e8b0463410cdb532e111cd43d5a66174` and the shared build supplied for
  Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Available memory was
  95 GB before checking. No language server or library build was started;
  no check remains running.
- Accepted packet SHA-256:
  `116c38b940316cbe91ed2bd0e9d77e1c6537c3e0507edb6622694292dd970a4d`.
  Changed Suggested.lean SHA-256:
  `2f6487ab11fb57967c985d95cf3a483fc468c0bd92631b3028d3a4addd8c1e50`.
- Intake `check-files` on the changed Suggested.lean and handoff: **2 files,
  0 problems**; `git diff --check` passes.
- `metadata.toml` remains absent. Intake's `deliverables_complete` tests package
  output existence; adding the final file would misclassify this incomplete
  package as complete. No accepted packet, original reader or original suggested
  file was edited. No scratch artifact is needed to resume.

## Where to resume

1. Route integral highest-weight exports through their existing owner, reusing
   IHG §0.7's general induction carrier. Obtain completed arithmetic tower exports
   from CC and the required monoid enhancements from the smooth-representation
   supplier. These are owner jobs, not extra jobs claimed by this worker.
2. In a job authorized to change the packet, connect actual supplier declarations,
   retarget `REQ-TOWER`, reconcile smooth stage ids and the induction boundary,
   and correct NT16 Proposition 2.10. Preserve the preceding IHG §1.6 finding:
   general algebraic reconstruction already permits a torsion target A; its
   arithmetic inputs and continuity remain separate obligations.
3. Specialize the inherited cores to real arithmetic objects and type every
   omitted target, API item and test. Preserve the conventions and qualified
   Barsotti–Tate endpoint recorded below.
4. Elaborate the complete Suggested.lean, finish the upstream-style reader and
   only then add `topic = "math.NT"` as metadata.

## Inherited mathematical resume contracts

These are the preceding workers' authored source and interface checks, preserved
for continuity. They are not fresh source-reading claims for `codex-i7uAjY`.
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
