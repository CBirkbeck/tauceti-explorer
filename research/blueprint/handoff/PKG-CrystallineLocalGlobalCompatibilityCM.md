# PKG-CrystallineLocalGlobalCompatibilityCM — checkpoint

Issue: [#7462](https://github.com/CBirkbeck/tauceti-explorer/issues/7462).
Agent: Codex (GPT-6). Session: `codex-bVzE4Z`. Date: 2026-10-11.
Branch: `codex-bVzE4Z-crystalline-cm-package`.
Input commit: `fbbbb004e`.
Claim confirmed by github-actions in
[comment 6104545769](https://github.com/CBirkbeck/tauceti-explorer/issues/7462#issuecomment-6104545769),
in response to [6104544772](https://github.com/CBirkbeck/tauceti-explorer/issues/7462#issuecomment-6104544772).
Only this job was claimed.

## Status

**Checkpoint with substantive signature work.** The two deep congruence-level
constructions in CL.6 now have typed forms, all six planned API declarations and
all six planned unit tests. The README explains their construction and tests.
The remaining arithmetic signatures still require supplying interfaces outside
this issue's allowed files. This is an external dependency blocker, not a time
or memory limit.

The accepted input has 97 targets, 103 API entries, 104 tests, 27 supplier
requests and 40 gaps. Its ten layers CL.0–CL.9 are planned; none is closed. A
successful target-level review does not supply the missing carrier interfaces.
The suggested file now has **12 typed targets, 27 typed APIs and 27 labelled
examples**. It retains **85 omitted targets, 76 omitted APIs and 77 omitted
tests**, together with explicit arithmetic-specialization boundaries on the
existing cores. Comments describing missing signatures are not declarations.

`metadata.toml` remains absent. The intake's
`research/blueprint/issues.py:deliverables_complete` otherwise treats this
package as complete from the existence of its output paths. Add
`topic = "math.NT"` only when the entire package meets the issue's requirements.
The accepted packet, original reader and original prototype were not changed.

## New typed material

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
The corresponding design issue is [#3357](https://github.com/CBirkbeck/tauceti-explorer/issues/3357).

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

The accepted consumer request needs an authorized revision, which this package
issue does not permit. Match its clauses to actual statements from these owners:

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
allow monoids; read `Homological/ContCohomology/SmoothDiscrete.lean`,
lines 245–272. Basic monoid smoothness is available. The remaining
`REQ-SMOOTH` obligation is the O/ϖ^m open-monoid abelian/derived interface,
restriction/injectivity compatibility and coefficient-injective coinduction
with CN Lemma 2.3.6's open-cell acyclicity. The preceding two blockers already
suffice to prevent completion; this continuation does not claim a fresh
exhaustive audit of all 27 requests.

## Preserved mathematical decisions

- The seven earlier algebraic cores remain: block exchange, positive
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
  **exit 0, 0 errors, 60 warnings, all `declaration uses sorry`**. Available
  memory was 102 GB before the final check; it finished with no surviving Lean
  process. The shared Mathlib is exactly
  `082e2d37e8b0463410cdb532e111cd43d5a66174`; individual Mathlib imports only.
  No language server, build, cache download or Lake command in the read-only
  roadmap environment was used.
- Reconciled all 97 target names, 103 API names and 104 test names against the
  reader and prototype; resolved namespace-qualified declarations and checked
  the six new labelled examples outside block comments. Checked that there is
  no empty Prop-valued sorry definition.
- README: 169,947 bytes; Suggested.lean: 140,823 bytes. The reader remains
  below 200 KB. Only its two deep-level explanations were extended, preserving
  every accepted target, hypothesis, API, test and source locator.
- Read WORKERS, both protocols and UPSTREAM_GUIDE; both complete upstream
  ReductiveGroups and PeripheralActions READMEs; the relevant current supplier
  signatures, pinned statements, reviewed ALS.6 audit and accepted RS-09.
  The read-only roadmap checkout is
  `070dc2becd74419e76303ede84b465ed4a69461f`; current Tau Ceti is
  `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. No restricted source was needed.
- Intake file-scope check: **3 files, 0 problems**. `git diff --check` passes.
  `deliverables_complete` remains **false**, with metadata absent.

Input SHA-256 fingerprints remain:

| Input | SHA-256 |
|---|---|
| CrystallineLocalGlobalCompatibilityCM packet | `116c38b940316cbe91ed2bd0e9d77e1c6537c3e0507edb6622694292dd970a4d` |
| PotentialAutomorphyInfrastructure packet | `eb472418e07c0614e6ee0a0b34e57306c769ff2444e5891ab1858cd924303650` |
| RS-09 accepted result | `235bae7182f594ea6c4ccbd5fbf319ca9659a4d00fad93a8328237c1667c36da` |

## Resume

First resolve the supplier gate and authorize the REQ-TOWER ownership correction.
Resume against actual exporting signatures rather than creating another copy of
supplier mathematics or replacing missing objects by assumed conclusions.
Keep the new deep-level forms; specialize their component maps to the arithmetic
level dictionary instead of rebuilding the same subgroup construction.

Remaining layer interfaces:

| Layer | Required interfaces |
|---|---|
| CL.0 | Integral dual-Weyl modules, split-place dictionary, positive monoids and arithmetic Hecke actions |
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
