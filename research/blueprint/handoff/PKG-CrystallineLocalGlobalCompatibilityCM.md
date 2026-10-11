# PKG-CrystallineLocalGlobalCompatibilityCM — checkpoint

Issue: [#7462](https://github.com/CBirkbeck/tauceti-explorer/issues/7462).
Agent: Codex (GPT-6). Session: `codex-zXQCL0`. Date: 2026-10-11.
Branch: `codex-zXQCL0-crystalline-package`.
Input commit: `156e332ce25faeeeee08fa751bcb62dc98d36631`.
Claim confirmed by github-actions in
[comment 6105329518](https://github.com/CBirkbeck/tauceti-explorer/issues/7462#issuecomment-6105329518),
in response to [6105328590](https://github.com/CBirkbeck/tauceti-explorer/issues/7462#issuecomment-6105328590).
Only this job was claimed.

## Status

**Checkpoint blocked on supplier exports.** This continuation adds the CL.6
unitary-middle and dual-coefficient Hecke-image cores, six API signatures and
five named examples, plus two supplementary discriminators. Integral dual-Weyl lattices and
completed arithmetic tower interfaces are still absent from their owners;
these blockers were checked afresh below. This is an external dependency
blocker, not a time or memory limit. Their general mathematics belongs outside
this issue's permitted paths. The earlier positive-monoid, scaling-character,
transfer, Hecke-image and deep-level forms remain intact. The package already
assigns completed arithmetic towers to CompletedCohomologyPartII rather than
ALS.6; that correction is preserved.

The accepted input has 97 targets, 103 API entries, 104 tests, 27 supplier
requests and 40 gaps. Its ten layers CL.0–CL.9 are planned; none is closed. A
successful target-level review does not supply the missing carrier interfaces.
The suggested file now has **17 typed targets, 42 typed APIs and 42 labelled
examples**. It retains **80 omitted targets, 61 omitted APIs and 62 omitted
tests**, together with explicit arithmetic-specialization boundaries on the
existing cores. Comments describing missing signatures are not declarations.

`metadata.toml` remains absent. The intake's
`research/blueprint/issues.py:deliverables_complete` otherwise treats this
package as complete from the existence of its output paths. Add
`topic = "math.NT"` only when the entire package meets the issue's requirements.
The accepted packet, original reader and original prototype were not changed.

## New middle-degree and dual-coefficient Hecke-image signatures

- `CrystallineCM.UnitaryMiddleHeckeImage` is the range of the actual supplied
  action on the middle-degree module. `_mem` exposes its preimages;
  `_rational_injective` uses the existing tensor-action map and an explicit
  injection M→E⊗_R M; `_character` evaluates a supplied image character on
  every specified partial operator. The injection is supplied by the
  arithmetic middle-degree comparison, not asserted for an arbitrary image.
  Finiteness of the arithmetic module is a separate input.
- Two named examples give the zero-module image and detect scalar torsion
  through the rational injection. A supplementary regular-action example for
  ℚ×ℚ supplies two image characters with the same value at (1,1) and different
  values at (1,2), all units. Thus matching only a Siegel value does not enforce
  matching on every partial operator. The original `_test_characters`, which
  requires an actual cuspidal realization with CTG and all partial-unit
  hypotheses, remains omitted and belongs to the CL.7 arithmetic interface.
- `CrystallineCM.HeckeImagesDual` is the range of each actual supplied
  dual-coefficient action, separately for integral, torsion and unitary
  cohomology. `_coefficient` exposes that range; `_unitary` identifies the
  same construction for the unitary action. Neither signature identifies
  H^q(V^dual) with Hom_R(H^q(V),R).
- `_adjoint` takes actions a on M and b on N, an involutive algebra
  automorphism ι, a perfect pairing N≃Module.Dual R M, separation of points
  of M by its dual, and equivariance of the actual operators. It descends this
  adjointness to an image-algebra isomorphism carrying a(h) to b(ι(h)).
  The image isomorphism is a conclusion, not an assumed input. The arithmetic
  application must supply the correct shifted and supported Poincaré pairing;
  a rational comparison is not an integral pairing.
- Three named examples cover the zero image, the inverse scalar in Mathlib's
  actual `Representation.dual`, and double-dual evaluation equivariance
  together with involutive maximal-ideal transport. Evaluation does not assert
  reflexivity of every module. The supplementary example has a nonzero
  ℤ/3 module with zero integral linear dual, distinguishing coefficient
  duality before cohomology from an unshifted dual of a torsion cohomology group.
- The catalogue marks both target signatures as partial arithmetic interfaces
  and marks their six APIs and five named examples as typed cores. The
  arithmetic modules/actions, ideal localization, degree/support comparison
  and cuspidal realization are still required. The reader retains the full
  arithmetic requirements and adds the descent and torsion distinctions.

Source read this session: Caraiani–Newton [CN], arXiv:2301.10509v3,
§4.2.1, printed pp.61–68: the image definitions on pp.61 and 65,
Proposition 4.2.4 on p.61 and Proposition 4.2.11 on p.67, with their
surrounding hypotheses. Public URL: <https://arxiv.org/pdf/2301.10509v3>.
Accessed 2026-10-11; PDF SHA-256
`57abc79ad46875b0ea432ce1193f517b8dbb0ad0448cb51942bc20ed95ffd0c3`.
Only original mathematical prose was added; no source passage or
section-by-section source summary was recorded. The pinned Mathlib statements
read are `Representation.dual` and `dual_apply` (Basic.lean, lines 671–681),
`Module.Dual.eval` and `eval_naturality` (Dual/Defs.lean, lines 80 and 177),
and the image and product-algebra interfaces. Their pinned links are in the
reader's library list. No restricted source was needed.

## Preserved positive-parahoric signatures

- `CrystallineCM.PositiveParahoricMonoid` is a `Submonoid` of GL_I(K) over a
  DVR O with fraction field K, finite row index I and block map I→Fin t. It
  uses the local uniformizer π, required to be irreducible in O, rather than
  the coefficient uniformizer or the rational prime p. Its carrier is exactly
  the union Q d_a Q for the already typed nonincreasing integer exponent cone.
  Q is the integral subgroup whose lower-block entries lie in (π), and d_a
  is the explicit invertible diagonal matrix with entries π^{a_b(i)}. The
  subgroup and monoid closure proofs are prototypes; closure is not assumed
  as an input. No topological assertion is made over an arbitrary DVR.
- `_double_coset` includes each of these specified cosets. `_levi_intersection`
  describes the pullback along a supplied actual Levi homomorphism and keeps
  its multiplication. `_localization` uses the actual submonoid generated by
  that pullback and the inverse of one selected central element u. It gives
  the unique extension of f:D→T when f(u) is a unit, for an arbitrary target
  monoid T. Taking T to be linear endomorphisms gives the action extension
  without requiring every positive partial operator to be invertible.
- Three labelled examples include the whole integral parahoric and the
  identity, include π⁻¹ times the identity through its constant exponent,
  and exclude diag(1_n,π1_n) for n>0 from the two-block positive monoid. Thus
  positive does not mean entrywise integral, nonnegative exponents, or the
  whole ambient general linear group.
- The split-place identification, compact-open topology, arithmetic Levi
  embedding and semidirect contracting action on U₀ are still required.
  The catalogue marks this node as a partial arithmetic interface and its
  three APIs and three examples as typed cores. The Hecke isomorphism part
  of CN Lemma 2.1.15 remains separate; a submonoid alone does not supply it.
  The generic selected-inverse universal property is stated for this actual
  carrier, without adding a second generic localization roadmap.

Source: Caraiani–Newton [CN], arXiv:2301.10509v3, §2.1.13 and
Lemma 2.1.15(1–2), printed pp.19–20; read printed pp.19–21, including the
rescaled lattice actions. Public URL: <https://arxiv.org/pdf/2301.10509v3>.
Accessed 2026-10-11; PDF SHA-256
`57abc79ad46875b0ea432ce1193f517b8dbb0ad0448cb51942bc20ed95ffd0c3`.
Only original mathematical and implementation prose was added; no source
passage or section-by-section source summary was recorded.

## Preserved scaling-character material

The following forms and source checks came from previous checkpoints. They
are retained for continuation; the new middle-degree/dual image forms above
and supplier checks below are this session's contribution.

- `CrystallineCM.LowestWeightScalingCharacter`: an actual monoid homomorphism
  D→E×. Its inputs are a finite embedding index, units π_τ, integer weight
  rows, a Weyl permutation w and an actual exponent homomorphism
  D→Multiplicative (Fin r→ℤ). The value is the product of π_τ to the exponent
  Σ_i e(g)_i λ_{τ,w⁻¹(i)}. No integral representation or lattice is asserted.
- `_compact` uses vanishing of the supplied exponent at a compact element;
  `_cocharacter` exposes the pairing at a specified exponent; `_mul` gives the
  character law. `_extension` takes an extended exponent map on a monoid
  generated by D's image and the inverse of one selected unit. It constructs
  the unique extended character and its inverse value, without requiring a
  group containing inverses of every positive operator.
- Four labelled examples cover zero weight, GL₂ with exponent (1,0), a compact
  submonoid whose exponent vanishes and the two distinct rank-four Weyl
  conventions. The GL₂ calculation simplifies to π^b. For λ=(1,1,0,0), the
  last example computes the two pairings as 0 and 2 with `decide`, then checks
  the character values at π=2 in ℚ as 1 and 4. These calculations use the
  character definition, whose homomorphism axioms remain prototypes.
- The arithmetic specialization of the positive monoid and its double-coset
  exponent maps are still required. Compact lattice agreement and the Levi coefficient
  comparison are not supplied by the algebraic character. The catalogue
  distinguishes these omissions from the typed core. PA.0's existing ACC
  `LowestWeightCharacter` normalizes its uniformizer value to 1; it has a
  weight-dependent compact-unit value. It cannot supply CN's compact-trivial
  rescaling character, whose uniformizer value records the lowest weight.

Source: Caraiani–Newton [CN], arXiv:2301.10509v3, §2.1.13, printed
pp.20–21; read both pages and the rescaled action/lattice context. The public
PDF matches SHA-256
`57abc79ad46875b0ea432ce1193f517b8dbb0ad0448cb51942bc20ed95ffd0c3`.
URL: <https://arxiv.org/pdf/2301.10509v3>. Accessed 2026-10-11. No source passage
was added. Generic root/permutation constructions from current ReductiveGroups
are reused; no new Weyl-group library is proposed.

## Preserved unipotent-transfer material

- `CrystallineCM.UnipotentTransferAction`: for a group U, an R-linear
  representation ρ, a finite-index endomorphism c and a raw operator A with
  Aρ(u)=ρ(c(u))A, sum ρ(r)Av over left cosets U/c(U). The result is an
  endomorphism of `Representation.invariants`. The sum is explicit; it is
  integral and permits a noninvertible raw operator. Arithmetic specialization
  supplies c(u)=gug⁻¹ and A(v)=gv.
- `_independent` states the arbitrary-transversal formula; `_mul` combines
  injective contractions and intertwining operators, including the identity
  law; `_compact` recovers the raw action when c is surjective. The trivial-U
  test recovers any raw operator. Two tests use actual multiplication by p on
  the additive group of p-adic integers, its residue quotient Z/pZ and trivial
  F_p coefficients: transfer is p times the identity, hence zero, and differs
  from the raw identity. The private quotient-equivalence signature is linked
  explicitly to `PadicInt.toZMod`.
- These signatures provide the algebraic degree-zero core. The smooth
  positive-monoid functor, arithmetic specialization and derived enhancement
  remain omitted. The catalogue distinguishes these boundaries from the typed
  core API and examples. No assumed conclusions or empty Prop-valued sorry
  definitions were introduced.

Source: Caraiani–Newton [CN], arXiv:2301.10509v3, §2.2.2,
equation (2.2.1), printed p.26. Read printed pp.26–28, including the derived
construction and subsequent finite-level control. The public PDF matches
SHA-256 `57abc79ad46875b0ea432ce1193f517b8dbb0ad0448cb51942bc20ed95ffd0c3`.
URL: <https://arxiv.org/pdf/2301.10509v3>. Accessed 2026-10-11. No source passage
was added.

The current library already has `TauCeti.DiscreteCoind.traceLinear` and
`TauCeti.DiscreteCoind.trace_eq_sum_transversal` in
`RepresentationTheory/Coinduced/Discrete.lean`, and
`TauCeti.ContCohomology.corestrictionTopRep` in
`RepresentationTheory/Homological/ContCohomology/Corestriction/AllDegrees.lean`.
ProfiniteCohomology Layer 10 plans the continuous restriction, conjugation and
corestriction interfaces. Reuse these generic constructions: the remaining
consumer work composes them with the raw contracting action and establishes
smoothness and compact-unipotent acyclicity. Do not plan generic integral
trace or all-degree continuous corestriction again. This checkpoint uses
Mathlib imports only and does not assert a compile against the newer Tau Ceti.

## Preserved deep-level material

- `CrystallineCM.DeepLeviLevel`: inside a supplied subgroup K of the actual
  ambient group G, intersect the inverse images of matrix reduction kernels,
  then map the resulting subgroup into G. Integral component homomorphisms
  are defined **on K**, avoiding the false assumption that all adelic elements
  have integral components. Selection is pulled back along v↦v̄, so both
  conjugate places get the same depth. Local rings may vary with v. The
  construction uses Mathlib's `Matrix.GeneralLinearGroup.map`,
  `Ideal.Quotient.mk`, `MonoidHom.ker`, subgroup inverse images, intersections
  and the subgroup inclusion.
- `DeepLeviLevel_mem`, `_antitone`, `_empty` state the entrywise congruences,
  depth inclusion and empty-selection identity. The scalar test uses two
  Bool-indexed conjugate GL₁(Z_p) components and characterizes each as
  1+p^e a. The local-uniformizer test uses an integral local domain of
  characteristic zero with π≠0 in its maximal ideal and π²=p. The unit 1+π
  belongs at local depth one and fails depth one measured using p; cancellation
  would otherwise make π a unit. This test supplies a genuine ramified case
  without inventing a local-field type.
- `CrystallineCM.DeepUnitaryLevel`: pull the existing CL.0 `ParahoricPVBC n e e`
  back along the supplied split integral component maps on K̃, intersect and
  include in G̃. It imposes identity on both diagonal blocks and zero on the
  lower-left block, leaving the upper-right block free.
- `DeepUnitaryLevel_mem`, `_unipotent`, `_empty` expose those congruences,
  membership of every upper block-unipotent element already in K̃ and the
  empty-selection identity. The upper-unipotent test works at every depth over
  any commutative ring. The F₃ test puts (1 1;0 1) in the unitary level and
  excludes it from principal congruence with the same reduction ideal.

These forms accept actual component maps; they do not construct the adelic
arithmetic level, its topology or its cohomology. The arithmetic application must
supply the standard-level and split-place dictionary. The omission catalogue
now marks these two definitions as partial arithmetic interfaces and their six
APIs and six examples as typed. No assumed conclusions or empty
`Prop := sorry` definitions were introduced.

The sources for these formulas are Caraiani–Newton [CN], arXiv:2301.10509v3,
§4.2.1, printed pp.61–62. Read pp.60–65, including the subsequent use in
Proposition 4.2.6. Source PDF SHA-256:
`57abc79ad46875b0ea432ce1193f517b8dbb0ad0448cb51942bc20ed95ffd0c3`.
Public URL: <https://arxiv.org/pdf/2301.10509v3>. Accessed 2026-10-11.
This matches the accepted source version. No source passage was added.

## Verified completion blockers

### Integral dual-Weyl coefficients

`REQ-INTEGRAL-WEYL` needs integral induction/dual-Weyl lattices, extension and
reduction of coefficients, integral Levi evaluation, the kernel weight
calculation and the Levi-equivariant splitting used in CN Lemma 2.1.12,
pp.17–18, and Lemma 4.2.3, p.60. Its application supplier is
[PotentialAutomorphyInfrastructure:PA.0](../packets/PotentialAutomorphyInfrastructure.json).
That packet retains the explicit gap whose general owner is
`ReductiveGroupsIntegralRepresentationsPartII`; no stage is assigned and no
packet, suggested file or package for that owner exists in this checkout.
The current routing issue is
[#3357](https://github.com/CBirkbeck/tauceti-explorer/issues/3357),
`DESIGN-ReductiveGroupsPartIII`, not a dedicated integral-representations job.
Its brief combines thirteen continuation routes, including the KP18 and KPZ26
routes to `ReductiveGroupsIntegralRepresentationsPartII`. No exporting packet,
suggested file or package for that integral owner exists in this checkout or
the current read-only upstream roadmap tree.

Read the actual rational Weyl statement at Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`:
`YoungTableau.weylModule` requires `Algebra ℚ k` in
`RepresentationTheory/ClassicalGroups/WeylModule.lean`, lines 114–124.
The current read-only library retains this requirement in
`ClassicalGroups/WeylModule/Basic.lean`. It cannot serve as a dual-Weyl lattice
over O or O/ϖ^m. The general integral owner and PA.0's arithmetic specialization
must provide their actual interfaces before the consuming coefficient targets
can be typed faithfully.

### Completed arithmetic towers and the stale supplier request

`REQ-TOWER` still names `ArithmeticLocallySymmetricSpaces:ALS.6` for completed
adelic/Borel–Serre cohomology, supported coefficient complexes, compact-open
derived recovery and homotopy inverse limits. Accepted
[RS-09](../restructure/RS-09.result.json) narrows ALS.6 to finite-level descent
and assigns completed arithmetic towers to `CompletedCohomologyPartII`.
Its assembly, colimit and completed-chain-model interfaces still have no packet,
suggested file or package in this checkout. The ALS.6 reviewed library audit
likewise distinguishes generic limits from the missing arithmetic tower.

An earlier checkpoint corrected the package README and its Lean catalogue to the owners
below, including CC.2 for the coefficient homotopy limit in the PGL₂ object.
The packet request remains stale: its correction belongs to a subsequent job
that permits packet edits. The missing owner exports, rather than the stale
request alone, prevent signature completion. Match its clauses to actual
statements from these owners:

| Required input | Owner |
|---|---|
| Finite-level coefficient complexes, Hecke/support maps, finite descent | ALS.1, ALS.3, ALS.4, ALS.6 |
| Level indexing, conjugation and arithmetic tower assembly | CompletedCohomologyPartII:CC.0 |
| Smooth local-group action on the level colimit | CompletedCohomologyPartII:CC.1 |
| Completion, order of limits, Milnor and reduction comparisons | CompletedCohomologyPartII:CC.2 |
| Completed equivariant chain models and finite-level recovery | CompletedCohomologyPartII:CC.4 |
| Continuous completed descent and compact-open derived comparison | CompletedCohomologyPartII:CC.6 |
| Derived boundary and support triangle | CompletedCohomologyPartII:CC.7 |

The seven consumers are CL.1/p-ordinary-completed, CL.3/lem-2-3-14,
CL.5/boundary-coefficient-object, CL.5/lem-4-1-6, CL.5/prop-4-1-4,
CL.8/pgl2-cohomology and CL.8/prop-5-5-3. Retain ALS.2's nilmanifold fibration
and the separate integral unipotent congruence-limit acyclicity obligation in
CL.5/lem-4-1-6; the characteristic-zero Lie-algebra formula does not discharge it.
No upward supplier citation or replacement owner was invented in the package.

### Smooth supplier is partly available

The accepted
[SmoothRepresentationsOfLocalGroups package](../packages/SmoothRepresentationsOfLocalGroups/README.md)
exists. Its `SRPlan.SmoothRep` carrier, abelian and Grothendieck instances and
smooth-part adjunction require `[Group G]` (Suggested.lean, lines 224–263).
The stage prototype in namespace `TauCeti.SmoothRep` contains additional
bounded-below group-derived material; it is not identical to the package export.
Its positive-monoid interface remains in the omission ledger.

At the exact Tau Ceti pin, `IsSmoothDiscrete` and `SmoothDiscreteTopRep` already
allow monoids; read `RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean`,
lines 245–272. Basic monoid smoothness is available. The remaining
`REQ-SMOOTH` obligation is the O/ϖ^m open-monoid abelian/derived interface,
restriction/injectivity compatibility and coefficient-injective coinduction
with CN Lemma 2.3.6's open-cell acyclicity. The preceding two blockers already
suffice to prevent completion; this continuation rechecked their exporting
files, reviewed ALS.6 audit and RS-09, but does not claim a fresh exhaustive
audit of all 27 requests. The current IntegralHeckeAndGaloisDeterminants
roadmap already supplies ordinary localization and its nilpotent/unit/mixed
checks. Reuse those constructions rather than adding another generic projector
or telescope here.

## Preserved mathematical decisions

- The earlier algebraic cores remain: block exchange, positive
  cocharacter cone, parahoric block subgroup, inverse scalar rescaling,
  determinant-norm unit character, integral Hecke image and torsion Hecke image.
  Their arithmetic-specialization boundaries remain explicit.
- The three earlier theorem signatures remain: the exact numerical degree
  bound, Artin–Rees subquotients modulo p-powers and the full finite-group
  determinant-kernel criterion including the cubic A₄ exception. Its projective
  image is the image of conjugation on ambient GL₂, not the quotient of the
  representation's own image by its centre. The F₇ quaternion identities are
  checked by `decide`.
- The potentially Barsotti–Tate lifting endpoint retains
  `[F(ζ_p):F] ≠ 3` or projective residual image different from A₄; the
  unrestricted case remains `GAP-CUBIC-TETRAHEDRAL`. Solvable preparation
  preserves the full residual-plus-cyclotomic field.
- Full-range unipotent nonvanishing is specified only at zero selected weights;
  general coefficients retain the dimension bound and the stated gap.
- AKT locators use arXiv:1910.12986v2; journal collation remains a gap.
- Geometric Frobenius, inverse rescaling, the reversed unitary first weight
  block, coefficient-valued dual exterior cohomology, actual Hecke images,
  independent ambient decomposed genericity, arbitrary-prime deep splitting,
  input-independent nilpotence bounds and the incoming differential correction
  in CN Proposition 4.2.6 remain intact.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/CrystallineLocalGlobalCompatibilityCM.json`:
  **0 errors, 0 warnings**; the accepted packet is unchanged.
- `lean-check research/blueprint/packages/CrystallineLocalGlobalCompatibilityCM/Suggested.lean`:
  **exit 0, 0 errors, 97 warnings, all `declaration uses sorry`**. Available
  memory was 102 GB before the full-file check. Only one operator-list comment changed
  afterwards; the Lean declarations are exactly those checked. The shared
  Mathlib is at `082e2d37e8b0463410cdb532e111cd43d5a66174`; individual Mathlib
  imports only. No language server, build, cache download or Lake command in
  the read-only roadmap environment was used.
- Reconciled all 97 target names, 103 API names and 104 test names against the
  reader and prototype. Resolved declarations in namespace CrystallineCM and
  associated test labels with actual examples outside block comments; every
  omitted name has an explicit omission entry. Counts are 17/42/42 typed and
  80/61/62 omitted. Two supplementary examples are not counted as fulfillment
  of original test names. No empty Prop-valued sorry definition was found.
- README: 180,115 bytes; Suggested.lean: 165,658 bytes. The reader is below
  200 KB. All accepted targets, hypotheses, APIs, tests and source locators
  remain present, with supplier ownership corrected as explained above.
- Read WORKERS, both protocols and UPSTREAM_GUIDE; two complete current upstream
  READMEs, ReductiveGroups and PeripheralActions; the relevant current supplier
  signatures, pinned statements, reviewed ALS.6 audit and accepted RS-09.
  Current read-only roadmap commit is
  `070dc2becd74419e76303ede84b465ed4a69461f`; current Tau Ceti is
  `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. No restricted source was needed.
- Intake file-scope check: **3 files, 0 problems**. `git diff --check` passes.
  `deliverables_complete` is **false**, with metadata absent. No Lean process
  from this job remains running.

Input SHA-256 fingerprints remain:

| Input | SHA-256 |
|---|---|
| CrystallineLocalGlobalCompatibilityCM packet | `116c38b940316cbe91ed2bd0e9d77e1c6537c3e0507edb6622694292dd970a4d` |
| PotentialAutomorphyInfrastructure packet | `eb472418e07c0614e6ee0a0b34e57306c769ff2444e5891ab1858cd924303650` |
| RS-09 accepted result | `235bae7182f594ea6c4ccbd5fbf319ca9659a4d00fad93a8328237c1667c36da` |

## Resume

First supply the integral dual-Weyl and completed arithmetic tower exports in
their owning roadmaps, and update REQ-TOWER in a job that permits packet edits.
The package already names the corrected tower owners. Resume against actual
exporting signatures rather than creating another copy of
supplier mathematics or replacing missing objects by assumed conclusions.
Keep the typed middle/dual image, positive-monoid, scaling-character, transfer
and deep-level forms. Supply
the arithmetic exponent maps and specialize the two Weyl permutations; do not
reuse PA.0's ACC character as if its normalization agreed. Specialize the
transfer to the actual contracting arithmetic elements, and the deep-level component maps to
the arithmetic level dictionary, instead of rebuilding these constructions.
The package cannot be completed by merely filling the remaining comments with
Prop placeholders or abstract assumptions of each theorem's conclusion.
For the new image cores, instantiate the actual coefficient cohomology and
its localized Hecke action, derive the rational injection from middle-degree
genericity, and provide the source's Poincaré comparison with its degree and
support data. The full cuspidal-character example needs the actual CL.7
realization, not a renamed pair of abstract algebra characters.

Remaining layer interfaces:

| Layer | Required interfaces |
|---|---|
| CL.0 | Integral dual-Weyl modules, split-place dictionary, positive-monoid arithmetic specialization and Hecke actions |
| CL.1 | Abelian/derived smooth open-monoid categories, compact derived invariants and completed arithmetic towers |
| CL.2 | Integral weights, inverse monoids and derived coefficient pairings |
| CL.3 | Compact-mod-parabolic induction, continuous cochains and genuine norm-determinant orientation |
| CL.4 | Cuspidal local Hecke systems, filtered (φ,N)-modules, Galois and Weil–Deligne carriers |
| CL.5 | Supported derived coefficients on actual adelic/Borel–Serre towers and their retracts |
| CL.6 | Arithmetic cohomology/actions and the standard-level component dictionary; deep congruence operations are now typed |
| CL.7 | Continuous absolute-Galois representations, Hecke systems and crystalline/ordinary deformation quotients |
| CL.8 | Non-neat PGL₂ towers, enhanced perfect complexes and derived Hecke support |
| CL.9 | Fixed determinants, Barsotti–Tate/type conditions, Taylor–Wiles covers, Selmer and base-change data |

Add metadata only when the full package can be submitted. No second job is
claimed. Scratch is disposable; all continuation-relevant findings are here.
