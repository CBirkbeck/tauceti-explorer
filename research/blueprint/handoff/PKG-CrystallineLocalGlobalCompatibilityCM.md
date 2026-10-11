# PKG-CrystallineLocalGlobalCompatibilityCM — blocked checkpoint

Issue: [#7462](https://github.com/CBirkbeck/tauceti-explorer/issues/7462).
Agent: Codex (GPT-6). Session: `codex-nw6xyR`. Date: 2026-10-11.
Branch: `codex-nw6xyR-crystalline-package`.
Input commit: `c8ca27292e25c7c8c1811aba80f0696d58eaa08f`.
Claim confirmed in [comment 6106187590](https://github.com/CBirkbeck/tauceti-explorer/issues/7462#issuecomment-6106187590),
responding to [comment 6106186560](https://github.com/CBirkbeck/tauceti-explorer/issues/7462#issuecomment-6106186560).
None of the manager's priority issues was available. This was the available
focused package under WORKERS.md's fallback order. Only this job was claimed.

## Result of this run

**Blocked on absent supplier interfaces.** This run changes only this handoff.
It does not complete the package or add metadata. The accepted plan still has
97 targets, 103 API items and 104 named tests. The inherited file contains typed
cores/signatures for 17 targets, 44 API items and 45 named tests; these counts
are an inventory, not a claim that the corresponding arithmetic targets are
fully supplied. The remaining 80/59/59 entries are catalogued in comments, not
faithful signatures. Passing elaboration does not close those omissions.

Rechecked two sufficient blockers against the current checkout and read-only
upstream/library trees:

- `REQ-INTEGRAL-WEYL`: PotentialAutomorphyInfrastructure assigns integral
  highest-weight coefficients to `ReductiveGroupsIntegralRepresentationsPartII`
  but records no exporting stages. That owner still has no packet, suggested
  file or package here, or roadmap in current upstream. The pinned and current
  `YoungTableau.weylModule` require a rational algebra, so cannot supply the
  needed integral dual-Weyl lattices, reduction maps and Levi splitting over
  O or O/ϖ^m. The routing issue [#3357](https://github.com/CBirkbeck/tauceti-explorer/issues/3357)
  was checked open and available; it is not an export and was not claimed.
- `REQ-TOWER`: accepted RS-09 assigns completed arithmetic towers to
  `CompletedCohomologyPartII`, while ALS.6 retains finite-level descent.
  CompletedCohomologyPartII still has no packet, suggested file, package or
  current upstream roadmap. The reviewed ALS.6 library audit distinguishes
  generic limits from the absent arithmetic tower. Its CC.0/CC.1/CC.2/CC.4/
  CC.6/CC.7 interfaces remain necessary; the existing package already records
  that owner correction, while the accepted packet's request still needs a
  later authorized packet edit.

The smooth monoid carrier is already present: the pinned
`IsSmoothDiscrete`, its continuous monoid restriction and
`SmoothDiscreteTopRep` must be reused. The upstream group-category abelian and
Grothendieck interfaces require a group; they do not supply the positive-monoid
injective/acyclic and derived ordinary comparison contracts. SR.6.5's module
localization must likewise be reused, with its smooth representation enhancement
supplied separately. Do not recreate these existing carriers to work around
the missing enhancements.

WORKERS.md permits a blocked checkpoint. PROTOCOL.md sections 13, 15 and 20
require faithful signatures, existing-owner reuse and a complete package;
they do not permit replacing arithmetic carriers by arbitrary inputs or
creating general supplier theories within this package's four editable paths.
No proof or missing interface was established merely by accepting the plan.

## Additional supplier check: characteristic-zero Q-ordinary selection

Read `PadicFamilies:L0a` in its packet and suggested file, and compared it with
`CL.4/q-ordinary-local-subspace`, its three API entries and three tests, and
`REQ-Q-ORDINARY-LINEAR-ALGEBRA`. L0a's twenty nodes concern finite/profinite
Fitting projectors, adic systems and ordinary complexes. Those interfaces alone
do not state the characteristic-zero simultaneous valuation-zero eigenspace
selection and descent that this consumer requests. This remains an interface
comparison obligation even though L0a is marked source-decomposed.

For a finite-dimensional invariant space over a p-adic field E, the requested
subspace selects simultaneous generalized eigenspaces on which every rescaled
Hecke eigenvalue has valuation zero, including the central operator. It must
have splitting-field independence, descent and coefficient-extension
compatibility. The source locator is CN v3 §3.1, after Definition 3.1.1, p.43;
the package README already states the needed supplier contract.

The accepted non-example is decisive: two scalar operators 1 and p on an
E-line give a nonzero ordinary part for the first operator but zero Q-ordinary
part. Merely retaining the invertible part over E would retain both operators,
since p is nonzero in E. An integral-lattice Fitting construction would need its
stable-lattice hypotheses and a simultaneous eigenspace comparison before it
can implement this interface. Preserve that distinction when connecting L0a;
this run does not claim a new impossibility result or an exhaustive audit of
all 27 supplier requests.

## Checks in this run

- Packet checker: **0 errors, 0 warnings**. The accepted packet is unchanged.
- `lean-check` on the inherited package Suggested.lean: **exit 0, no errors,
  107 warnings, all declaration-uses-sorry warnings**. Available memory before
  checking was 103 GB; no check remains running. No library build or Lean
  server was started.
- Inventory recounted after removing nested block comments and associating
  named-test labels with actual examples: **17/44/45 typed, 80/59/59 omitted**.
- Intake `check-files` on this handoff: **1 file, 0 problems**;
  `git diff --check` passes. Metadata remains absent, so this is a checkpoint.
- Unchanged Suggested.lean SHA-256:
  `9e32ee66611e8eaa3c35f82ae7a41c48886ca968c42b0d3a7c54e14058fe69fb`.
  Unchanged README SHA-256:
  `849ad358d9d9c5dd53fd3c90c838bb5b84883871356e69fbe68fae9f406eae61`.
  Unchanged packet SHA-256:
  `116c38b940316cbe91ed2bd0e9d77e1c6537c3e0507edb6622694292dd970a4d`.

## Where to resume

Route the integral dual-Weyl and completed arithmetic tower work to their
owners, and supply the smooth-monoid enhancements. Reconcile the accepted
packet's tower owner, smooth stage labels and NT16 Proposition 2.10 locator in
a job authorized to edit it. Connect the Q-ordinary valuation-zero selection
contract rather than substituting characteristic-zero invertibility. Then
specialize the inherited cores to the actual arithmetic carriers, supply all
remaining signatures/API/tests, elaborate the full file and add metadata only
when the package meets section 20. Keep the inherited normalization corrections
and qualified Barsotti–Tate scope.

No scratch file is needed to resume. The following retained record contains
the previous implementation changes, detailed contracts and provenance. Its
validation is historical except where explicitly repeated above. In particular,
this run did not add the Artin–Rees signatures or repeat the previous source
PDF hash and proof audit. No second job was claimed.

## Retained preceding checkpoint: codex-vpR7pE

The record below describes the preceding run, not additional edits or checks
in session codex-nw6xyR.

Issue: [#7462](https://github.com/CBirkbeck/tauceti-explorer/issues/7462).
Agent: Codex (GPT-6). Session: `codex-vpR7pE`. Date: 2026-10-11.
Branch: `codex-vpR7pE-crystalline-package`.
Input commit: `5cbcf764a67eb29027a3af3f4518b483c8f950ea`.
Claim confirmed in [comment 6106036226](https://github.com/CBirkbeck/tauceti-explorer/issues/7462#issuecomment-6106036226),
responding to [comment 6106035229](https://github.com/CBirkbeck/tauceti-explorer/issues/7462#issuecomment-6106035229).
None of the manager's priority issues was available. The earlier focused review
already had its scoped result and an open checkpoint; the four preceding focus
packages had open submissions. This package's latest checkpoint, #8744, had
merged and the bot had released the job. Only this job was claimed.

### Progress in this continuation

`CrystallineCM.subquotient_mod_p_pow` now retains the chosen submodule N′ ⊆ N
and surjection f : N′ → M. Its witness is the canonical image of N′ in
N/p^m′N, with a surjection to M/p^mM and the square induced by f. The inherited
statement only chose an arbitrary submodule and abstract quotient map; it did
not connect that witness to f. The stronger signature records the maps needed
when applying CN Lemma 2.3.18, p.43, to the Hecke subquotients in Proposition
4.2.6 and its proof, pp.63–65, especially p.64.

The supplementary `subquotient_mod_p_pow_uniform` puts the Artin–Rees shift
before both the coefficient depth and the quotient map. Three authored tests
check an ambient quotient with no depth increase, failure of the natural square
for pZ_p ⊆ Z_p at depth one, and its repair at depth two. The last two distinguish
the intrinsic p-adic filtration of the submodule from the ambient filtration.
The README states the canonical maps, the descent argument and the limited
Hecke-naturality consequence. This does not construct arithmetic Hecke actions.
The private image abbreviations reuse Mathlib quotients and ranges; the general
Artin–Rees theorem is imported from its existing pinned Tau Ceti owner.
These are suggested signatures with `sorry` proofs, not verified theorems.

All inherited coefficient, tower, smooth-monoid, rescaling, image-algebra,
duality, level-selection and cubic-tetrahedral corrections are preserved.
In particular, reuse SR.6.5's module localization rather than planning another
colimit. Its missing smooth representation enhancement remains a supplier
contract below. NT16 remains **Proposition 2.10** in the README; the accepted
packet's stale "Lemma 2.10" locator is outside this job's editable files.

### Why this remains a checkpoint

**Blocked on supplier interfaces, not the run's time or memory.** The accepted
plan has 97 targets, 103 API entries, 104 tests, 27 requests and 40 gaps.
All ten layers are planned; none is closed. “Complete” in the packet means its
planning pass is complete, not that its dependencies or prototypes are complete.
A full package requires all its definitions, theorems, API and tests as faithful
Lean signatures. This job permits only the three package files and this handoff;
it expressly prohibits changing packets. Defining the absent general supplier
theories here would duplicate their owners and exceed these permitted files.

The inherited inventory, excluding nested block comments and associating test
labels with actual examples, is unchanged by this continuation:

| Accepted-plan entries | Typed cores/signatures | Omitted |
|---|---:|---:|
| Targets | 17 | 80 |
| API items | 44 | 59 |
| Named tests | 45 | 59 |

No previously omitted target, API or named-test signature was supplied in this
continuation. One existing target was strengthened; a supplementary uniform
signature and three supplementary examples were added. Partially typed arithmetic objects
remain partial, even when a helper formula elaborates. Supplementary examples
do not count as an omitted named test. The omitted names remain in the
source-indexed catalogue. The inherited component APIs do not complete the
`PreparedPGL2Level` arithmetic construction or its non-neat perfectness test.

`metadata.toml` remains absent: intake presently uses output existence to decide
package completion. Creating it would falsely complete this unfinished job.
Add `topic = "math.NT"` only when the full package standard is met.
The accepted packet, original reader and original suggested file are unchanged.

### Supplier blockers and inherited resume contracts

The integral owner gap, absence of completed-tower exports and monoid carrier
were rechecked in this continuation against the pinned/current declarations,
PA's owner gap, accepted RS-09 and the reviewed ALS.6 library audit. The generic
Artin–Rees declarations and the new target's source and consumer were read.
The contracts below preserve the preceding checkpoints' additional source and
upstream checks; their historical checks are identified as such. Integral
coefficients and arithmetic towers alone suffice to establish the block. This
run does not claim exhaustive verification of all 27 supplier requests.

#### Integral dual-Weyl coefficients

`REQ-INTEGRAL-WEYL` needs integral induction, dual-Weyl lattices, coefficient
extension/reduction, Levi evaluation, kernel weights and the integral
Levi-equivariant splitting. Six consumers are CL.0/lem-2-1-12,
CL.0/lem-2-1-17, CL.2/lem-2-2-14, CL.2/lem-2-2-16,
CL.5/cor-4-1-9 and CL.6/lem-4-2-3.

Checked the gap in
[PotentialAutomorphyInfrastructure](../packets/PotentialAutomorphyInfrastructure.json):
it assigns the general theory to `ReductiveGroupsIntegralRepresentationsPartII`
and records that this owner has no stage ids. There is still no exporting packet,
suggested file or package for that owner in this checkout or the current upstream
roadmap tree. [#3357](https://github.com/CBirkbeck/tauceti-explorer/issues/3357)
is open and `state:available`; it is the broad `DESIGN-ReductiveGroupsPartIII`
routing job, whose brief includes the integral-representation continuation.
It is not an existing export or a job claimed by this worker.

Read the pinned `TauCeti.YoungTableau.weylModule` declaration in
`RepresentationTheory/ClassicalGroups/WeylModule.lean`, lines 114–124:
its standing assumptions include `[Algebra ℚ k]`. The current library's
`ClassicalGroups/WeylModule/Basic.lean`, lines 122–134, retains the same
requirement. Neither supplies dual-Weyl lattices over O or O/ϖ^m.

The preceding continuation checked CN v3 Lemma 2.1.12, pp.17–18, including
its Schubert restriction input. The preceding checkpoint reread Lemma 4.2.3 and proof, p.60. The latter requires an integral
Levi-equivariant splitting and parabolic stability of its kernel; an E-linear
splitting alone is insufficient. **Locator correction for a packet-editing job:**
CN's proof cites NT16 **Proposition 2.10**. `REQ-INTEGRAL-WEYL` calls it Lemma 2.10. Both occurrences in the package README now say
Proposition 2.10. No packet was edited in this package job.

#### Completed arithmetic towers

`REQ-TOWER` still requests completed adelic/Borel–Serre objects from
`ArithmeticLocallySymmetricSpaces:ALS.6`. Checked accepted
[RS-09](../restructure/RS-09.result.json): ALS.6 keeps finite-level descent,
while the completed tower belongs to `CompletedCohomologyPartII`.
The latter still has no packet, suggested file or package exporting its
arithmetic tower assembly, smooth level colimit or completed chain models.
The reviewed `data/library-coverage.json` ALS.6 entry independently separates
generic limits from the absent arithmetic tower.

The package already cites the corrected owners; preserve that correction.
A later job allowed to edit the packet should retarget `REQ-TOWER`, while
retaining ALS's finite-level geometry and unipotent congruence-limit obligation.
The missing exports, rather than the stale request alone, prevent completion.

| Required arithmetic input | Owner |
|---|---|
| Finite-level cochains, Hecke and support maps, finite descent | ALS.1, ALS.3, ALS.4, ALS.6 |
| Level indexing, conjugation and tower assembly | CompletedCohomologyPartII:CC.0 |
| Smooth local action on the level colimit | CompletedCohomologyPartII:CC.1 |
| Completion, order of limits, Milnor/reduction comparison | CompletedCohomologyPartII:CC.2 |
| Completed equivariant chain models and finite recovery | CompletedCohomologyPartII:CC.4 |
| Continuous completed descent and derived invariants | CompletedCohomologyPartII:CC.6 |
| Completed boundary and support triangle | CompletedCohomologyPartII:CC.7 |

Consumers are CL.1/p-ordinary-completed, CL.3/lem-2-3-14,
CL.5/boundary-coefficient-object, CL.5/lem-4-1-6,
CL.5/prop-4-1-4, CL.8/pgl2-cohomology and CL.8/prop-5-5-3.
ALS.2's nilmanifold fibration and integral congruence-limit acyclicity remain
separate inputs; a characteristic-zero Lie-algebra computation does not replace them.

#### Smooth monoids and derived ordinary parts

The inherited phrase “missing smooth category” needs a narrower interpretation.
At the pinned Tau Ceti commit, the preceding continuation read the following
interfaces in `RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean`.
This continuation reread the monoid predicate, restriction and category:

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

The integral coefficients and arithmetic tower blockers already suffice to
prevent a complete package. This continuation does not claim exhaustive
verification of all 27 supplier requests. The historical detailed contracts below
remain resume requirements; no missing supplier is reconstructed here.

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

### Validation and provenance

- `python3 scripts/check_blueprint.py research/blueprint/packets/CrystallineLocalGlobalCompatibilityCM.json`:
  **0 errors, 0 warnings**. The accepted packet remains unchanged;
  SHA-256 `116c38b940316cbe91ed2bd0e9d77e1c6537c3e0507edb6622694292dd970a4d`.
- `lean-check research/blueprint/packages/CrystallineLocalGlobalCompatibilityCM/Suggested.lean`:
  **exit 0, 0 errors, 107 warnings, all `declaration uses sorry`**.
  Available memory was 100 GB. The full revised file was checked once, after
  checking the new signatures separately. No Lean server or library build was
  started. No check remains running.
- Inventory independently recounted after stripping nested block comments:
  17/44/45 typed and 80/59/59 omitted. Named tests were counted only when their
  labels precede actual examples, allowing intervening explanatory comments.
  Supplementary signatures and examples do not count as omitted plan entries.
  No empty `Prop := sorry` definition or replacement arithmetic carrier was added.
- Intake `check-files`: **3 files, 0 problems**. `git diff --check` passes.
  README is 189,231 bytes, below 200 KB. `deliverables_complete` remains false:
  metadata is absent, and every changed path belongs to this job.
- Read WORKERS, both protocols and UPSTREAM_GUIDE; current upstream
  ReductiveGroups and PeripheralActions READMEs; relevant pinned/current Weyl
  declarations and the pinned smooth-monoid carrier; PA's owner gap; reviewed
  ALS.6 audit; accepted RS-09; pinned generic Artin–Rees and quotient/range APIs.
  The audit has no entry keyed by this new roadmap id; its ALS.6 supplier entry
  was used. Read-only roadmap commit
  `070dc2becd74419e76303ede84b465ed4a69461f`, current library
  `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. No restricted source was needed.
- The build's `TauCeti/RingTheory/Ideal/ArtinRees.lean` was compared against
  the pinned commit `f790474821cf4256814db967cb154e7af3d0c369`; both have
  SHA-256 `e05c509c32f6433d6fdbf667ee998371c05ab7f0bf894df10daa8e6365fa2270`.
  Its `exists_controlled_lift` requires a Noetherian coefficient ring and a
  finitely generated ambient module, and quantifies the shift before depth
  and surjection. Mathlib's `Ideal.exists_pow_inf_eq_pow_smul` and its actual
  filtration formula were also read at the pin.
- Read CN v3 Lemma 2.3.18 and its proof, p.43, neighboring Lemma 2.3.17,
  p.42, and Proposition 4.2.6 and its proof, pp.63–65, from
  <https://arxiv.org/pdf/2301.10509v3>, accessed 2026-10-11.
  PDF SHA-256 `57abc79ad46875b0ea432ce1193f517b8dbb0ad0448cb51942bc20ed95ffd0c3`.
  Only authored mathematical statements and source locators enter the package.
- PA packet SHA-256
  `eb472418e07c0614e6ee0a0b34e57306c769ff2444e5891ab1858cd924303650`;
  RS-09 result SHA-256
  `235bae7182f594ea6c4ccbd5fbf319ca9659a4d00fad93a8328237c1667c36da`.

### Resume condition and manager action

Supply the integral dual-Weyl and completed arithmetic tower interfaces in their
owning roadmaps, together with the needed smooth-monoid extensions. Then a job
allowed to edit the packet must retarget `REQ-TOWER`, reconcile the smooth stage
labels, correct the NT16 locator and connect the actual supplier declarations.
The owner-design issue [#3357](https://github.com/CBirkbeck/tauceti-explorer/issues/3357)
was checked open and `state:available`; it is not an export, and this worker did
not claim it.

Resume package completion after those exports exist: specialize the inherited
cores to the arithmetic carriers, type all remaining signatures/API/tests,
check the complete file with `lean-check`, then add metadata. Preserve the
qualified Barsotti–Tate scope and every inherited normalization in the material
above. Repeating this package job without resolving its owner dependencies
cannot turn these partial cores into a complete package. The manager should
route the owner work and avoid returning this package to available work until
its supplier situation changes; this worker did not alter labels.

No scratch file is needed to continue. The source URL and hash, all verification
results, code, mathematical formulas and required interfaces are retained here
or in the package. No second job is claimed.
