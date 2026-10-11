# PKG-CrystallineLocalGlobalCompatibilityCM — blocked checkpoint

Issue: [#7462](https://github.com/CBirkbeck/tauceti-explorer/issues/7462).
Agent: Codex (GPT-6). Session: `codex-TrHWwa`. Date: 2026-10-11.
Branch: `codex-TrHWwa-crystalline-package`.
Input commit: `bc77f117ef2960db87bcc24331b59fde6d8d38d8`.
Claim confirmed in [comment 6106440436](https://github.com/CBirkbeck/tauceti-explorer/issues/7462#issuecomment-6106440436),
responding to [comment 6106439383](https://github.com/CBirkbeck/tauceti-explorer/issues/7462#issuecomment-6106439383).
None of the forty manager-priority issues was available. This was the eligible
focus package under WORKERS.md's fallback order. Only this issue was claimed.

## Outcome and change

**Blocked on missing supplier interfaces; this is not a complete package.**
The accepted planning pass has 97 targets, 103 API entries, 104 named tests,
27 requests and 40 gaps. All ten layers are planned; none is closed. The
inherited Suggested.lean supplies typed cores for only 17 target names.
Its remaining catalogue entries are comments, not arithmetic signatures.

This continuation corrects the README's induction reuse boundary. Current
upstream **IntegralHeckeAndGaloisDeterminants**, Layer 0, §0.7 already plans
`AlgebraicInduction.module`: the cotensor equalizer for a map of flat
commutative Hopf algebras, with `moduleComodule`, Frobenius `reciprocity` and
counit evaluation `reciprocity_apply`. Reuse these in the integral highest-weight
owner rather than introducing a second general induction carrier. Its convention
F(hg)=hF(g) compares by inversion with the left-translation convention in
Jantzen I.3.3–3.7, pp.38–41. Those sections were read directly in the cleared
second edition; no source passage was copied. IHG §6.4's integral GL₂ induced
modules and good-filtration theory do not supply arbitrary GL_{2n} Siegel
Levi evaluation and the integral splitting required here. These are upstream
suggested interfaces, not implemented declarations at either the atlas pin
or current Tau Ceti.

No Lean declaration was changed. This note consolidates the preceding
handoffs, retaining their mathematical resume contracts below. Historical
source checks are distinguished from checks repeated in this session.

## Two sufficient blockers checked afresh

### Integral dual-Weyl coefficients

`REQ-INTEGRAL-WEYL` needs integral dual-Weyl lattices, scalar extension and
reduction, Levi evaluation onto V_{λ_τ̃}⊗V_{−w₀λ_{τ̃c}}, Schubert evaluation
surjectivity after reduction and positive-root weights in its kernel. It also
needs the integral Levi-equivariant splitting V_{λ̃}=V_λ⊕W and the identification
W⊗E=(1−U)V_{λ̃,E}, giving the required P(O)-stability. An E-linear splitting
alone does not supply that integral statement.

The parent [PotentialAutomorphyInfrastructure](../packets/PotentialAutomorphyInfrastructure.json)
assigns the general theory to `ReductiveGroupsIntegralRepresentationsPartII`
and records that its exporting stages do not yet exist. There is no matching
owner packet, suggested file, package or current upstream roadmap. Do not
invent stage ids. Broad routing design
[#3357](https://github.com/CBirkbeck/tauceti-explorer/issues/3357) includes the
integral-representation continuation and was checked open and available;
it is not an export and was not claimed here.

The pinned `TauCeti.YoungTableau.weylModule` in
`RepresentationTheory/ClassicalGroups/WeylModule.lean` requires `[Algebra ℚ k]`.
Current `ClassicalGroups/WeylModule/Basic.lean` retains that assumption.
Neither supplies the requested lattice over O or reduction over O/ϖ^m.
The newly identified IHG cotensor interface removes a general carrier duplication,
but leaves coordinate-algebra flatness, weight characters, base-change, Levi
restriction and the integral splitting to their owners.

Consumers: CL.0/lem-2-1-12, CL.0/lem-2-1-17, CL.2/lem-2-2-14,
CL.2/lem-2-2-16, CL.5/cor-4-1-9 and CL.6/lem-4-2-3.
The inherited source audit identifies CN v3 Lemma 2.1.12, pp.17–18,
and Lemma 4.2.3, p.60. Preserve **NT16 Proposition 2.10**, as the README
already does; the request's stale “Lemma 2.10” needs a packet-authorized edit.
This run did not repeat that CN/NT16 source audit.

### Completed arithmetic towers

`REQ-TOWER` still names `ArithmeticLocallySymmetricSpaces:ALS.6`. Accepted
[RS-09](../restructure/RS-09.result.json) instead leaves finite-level descent
there and assigns completed arithmetic towers to `CompletedCohomologyPartII`:

| Required arithmetic input | Owner |
|---|---|
| Finite-level cochains, Hecke/support maps and finite descent | ALS.1, ALS.3, ALS.4, ALS.6 |
| Actual level indexing, conjugation and tower assembly | CC.0 |
| Smooth local action on level colimits | CC.1 |
| Completion, order of limits, Milnor/reduction comparison | CC.2 |
| Completed equivariant chain models and finite recovery | CC.4 |
| Continuous completed descent and derived invariants | CC.6 |
| Completed boundary and support triangle | CC.7 |

That owner still has no packet, suggested file, package or current upstream
roadmap exporting these objects. The reviewed `data/library-coverage.json`
ALS.6 entry separates generic limits from the absent arithmetic tower.
Generic derived categories and limits do not give its actual adelic level
system, actions or comparison maps. Owner work
[#701](https://github.com/CBirkbeck/tauceti-explorer/issues/701), from CC.0,
and [#702](https://github.com/CBirkbeck/tauceti-explorer/issues/702), from CC.8,
was checked open and available; neither issue was claimed.

Consumers: CL.1/p-ordinary-completed, CL.3/lem-2-3-14,
CL.5/boundary-coefficient-object, CL.5/lem-4-1-6, CL.5/prop-4-1-4,
CL.8/pgl2-cohomology and CL.8/prop-5-5-3. Preserve the corrected owner
citations in the package. ALS.2's nilmanifold fibration and integral
congruence-limit acyclicity remain separate inputs; a characteristic-zero
Lie-algebra computation does not establish them.

The issue permits the package files and this handoff, expressly excluding
packet edits. PROTOCOL.md §§13, 15 and 20 require honest signatures, owner
reuse and complete packages. Building these general supplier theories inside
this consumer would violate those boundaries. This is a dependency block,
not exhaustion of the eight-hour allowance. These blockers are sufficient
without an exhaustive audit of the 27 requests.

## Preserved mathematical resume contracts

The following is the preceding continuations' authored resume record. Source
and upstream checks attributed to them are historical, not additional checks
in session codex-TrHWwa. Code and detailed formulas remain in the package.

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

## Inventory and validation in this session

Independently removed nested block comments, compared target/API names with
actual declarations and associated named-test labels with actual examples:

| Layer | Targets typed/total | API typed/total | Named tests typed/total |
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

The omitted counts remain 80/59/59. Some typed cores also still need their
arithmetic specializations. Supplementary Artin–Rees signatures/tests do not
count as omitted accepted-plan entries. The catalogue in Suggested.lean
retains every omitted name; its commentary does not count as a signature.

- `check_blueprint.py` on the accepted packet: **0 errors, 0 warnings**.
- `lean-check` on package Suggested.lean: **exit 0, no errors, 107 warnings,
  all declaration-uses-sorry warnings**. Available memory was 102 GB before
  checking. No Lean server or library build was started; no check remains
  running. Elaboration validates the supplied cores, not the omitted targets.
- Intake `check-files`: **2 files, 0 problems**; `git diff --check` passes.
  README is 190,227 bytes, below 200 KB. Only the README and this handoff
  are changed.
- Current read-only roadmap commit:
  `070dc2becd74419e76303ede84b465ed4a69461f`; current Tau Ceti commit:
  `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Read the upstream ReductiveGroups
  and PeripheralActions READMEs, IHG §0.7/§6.4 carrier declarations,
  pinned/current Weyl assumptions, PA's owner gap, accepted RS-09 and reviewed
  ALS.6 audit. No build was run in either read-only tree.
- Suggested.lean is unchanged, SHA-256
  `9e32ee66611e8eaa3c35f82ae7a41c48886ca968c42b0d3a7c54e14058fe69fb`.
  The accepted packet is unchanged, SHA-256
  `116c38b940316cbe91ed2bd0e9d77e1c6537c3e0507edb6622694292dd970a4d`.
- Historical CN audit used arXiv:2301.10509v3, PDF SHA-256
  `57abc79ad46875b0ea432ce1193f517b8dbb0ad0448cb51942bc20ed95ffd0c3`.
  This run did not repeat that PDF audit. Only authored statements and source
  locators enter the package.

`metadata.toml` remains absent because intake currently infers package completion
from output existence. Add `topic = "math.NT"` only once the entire package
standard is met. No packet, original reader or original suggested file was
edited. Intake and diff checks are also recorded in the pull request.

## Where to resume

1. Route integral highest-weight exports through their existing owner, reusing
   IHG §0.7's general induction carrier. Export completed arithmetic towers
   from CC and required monoid enhancements from the smooth-representation
   supplier. These are owner jobs, not additional work claimed by this worker.
2. A packet-authorized job must connect those actual declarations, retarget
   `REQ-TOWER`, reconcile smooth stage ids and the induction reuse boundary,
   and correct NT16 Proposition 2.10.
3. Specialize the inherited cores to arithmetic objects and type every remaining
   target, API item and named test. Preserve all normalization and exception
   contracts above, including the qualified Barsotti–Tate endpoint.
4. Elaborate the complete file, finish the upstream-style reader and add metadata.

The manager should route owner work before returning this package for another
completion attempt. No label was changed by this worker. No scratch artifact
is needed to resume, and no second job is claimed.
