# PKG-CrystallineLocalGlobalCompatibilityCM — blocked checkpoint

## Current continuation: codex-zHCNz6

Issue: [#7462](https://github.com/CBirkbeck/tauceti-explorer/issues/7462).
Agent: Codex. Session: `codex-zHCNz6`. Date: 2026-10-11.
Input commit: `f20f6eaf4bd1e9d8a7b93bdf60f42b25626d3dec`.
Branch: `codex-zHCNz6-crystalline-cm-package`.
Claim confirmed by the bot in comment
[6104372269](https://github.com/CBirkbeck/tauceti-explorer/issues/7462#issuecomment-6104372269).

**Blocked checkpoint.** The previous gate incorrectly says that the smooth
supplier has no packet or package. Those files now exist, and its package review
was accepted on 2026-10-09. This continuation replaces that stale absence claim
with an inventory of the actual group signatures and the remaining open-monoid
obligation. Integral dual-Weyl coefficients and completed arithmetic towers
still lack their supplying interfaces. The tower request still names the wrong
owner. These external blockers prevent a complete faithful suggested file.

Only this handoff changes. The assembled reader, suggested file and accepted
plans remain intact. The issue requires typed definitions, theorem statements,
API and examples; a catalogue of mathematical statements in comments is not
that deliverable. [PROTOCOL.md](../PROTOCOL.md), sections 13, 15 and 20, requires
honest omission, sole ownership of supplier mathematics and typed package
signatures. This issue permits neither supplier development nor packet
revision. This run checks sufficient blockers, rather than claiming a new
exhaustive audit of all 27 requests.

## Dependency gate: inspect before another continuation

Resume after the missing interfaces are supplied and the tower request has
been corrected through an authorized plan revision. Check new supplier files
before repeating compilation. Successful elaboration of the existing algebraic
cores does not construct their missing arithmetic inputs.

### Smooth supplier: partly available; the old absence claim is retired

The accepted [smooth package](../packages/SmoothRepresentationsOfLocalGroups/README.md)
and its [review](../packages/SmoothRepresentationsOfLocalGroups/review.json)
now exist. Its `Suggested.lean`, lines 230–263, gives `SRPlan.SmoothRep`, the
full subcategory of `Rep A G` on smooth objects, an abelian instance, the
smooth-part adjunction and a Grothendieck-abelian instance. These signatures
are for **groups**, with `[Group G]`; they do not define the requested categories
for the open monoids Δ̃, Δ⁺ and Δ.

The accepted [SR.0 packet](../packets/SmoothRepresentationsOfLocalGroups--SR.0.json)
has a more extensive [stage prototype](../suggested/SmoothRepresentationsOfLocalGroups--SR.0.lean)
in namespace `TauCeti.SmoothRep`:

- Lines 1173–1244 give locally profinite group hypotheses, the Grothendieck
  instance, `DerivedCat`, `DerivedCatPlus`, derived open-subgroup restriction,
  bounded-below derived invariants, the continuous-cohomology comparison,
  compact-open restriction preserving injectives and actual K-injective
  resolution data. Ordinary higher-invariant vanishing requires
  `HasUnitProOrder`; that hypothesis cannot be substituted for the p-torsion
  setting of this package.
- Lines 1042–1070 give smooth induction as smooth vectors in Mathlib's
  algebraic coinduction. They do not supply the coefficient-injective
  open-cell acyclicity required by CN Lemma 2.3.6, pp.36–37.
- Lines 2080–2097 give quotient-action derived invariants and composition for
  a compact group and a closed normal subgroup. This is useful existing
  supplier planning, but does not certify all action, restriction and
  ordinary open-cell clauses of `REQ-DERIVED-INVARIANTS`.
- Lines 1980–2022 type total tensor complexes, K-flat replacement data and
  derived tensor/internal Hom. The packet explicitly records the missing
  equivariant K-flat construction. `REQ-DEEP-PERFECT` still needs the exact
  deep-restriction statement of CN Lemma 2.3.17, p.42, including its colimit
  comparison; no such export was found in these supplying signatures.
- Lines 2461 onward leave the parabolic-pair and positive-monoid interface in
  an omission ledger. No abelian/derived smooth open-monoid export or
  contracting open-cell higher-acyclicity export was found in the packet's
  prototype or the package prototype.

The basic monoid carrier itself already exists at the Tau Ceti pin:
`IsSmoothDiscrete` and `SmoothDiscreteTopRep` allow `[Monoid G]`
(`Homological/ContCohomology/SmoothDiscrete.lean`, lines 245–272 and 530–552).
The missing input is its requested abelian/injective/derived structure and
acyclicity comparison, not a smoothness predicate or a full-subcategory carrier.

The package and stage prototypes use distinct namespaces and carry different
amounts of typed material. Do not treat the stage's derived declarations as
already exported by the package: the latter records them in its closing
inventory, around lines 1522–1669. Reconcile actual supplying signatures before
using them in a completed consumer package; do not copy either development
into this package. SR.0 issue [#996](https://github.com/CBirkbeck/tauceti-explorer/issues/996)
was `state:submitted` when checked, rather than the previous handoff's
`state:available`.

The remaining `REQ-SMOOTH` obligation is the O/ϖ^m **open-monoid** abelian and
bounded-below derived interface, its restriction/injectivity compatibility and
coefficient-injective smooth coinduction with the CN Lemma 2.3.6 acyclicity test.
The general group category is no longer an absent supplier.

### Integral coefficients: still missing

`REQ-INTEGRAL-WEYL` needs integral dual Weyl lattices, coefficient extension and
reduction, Levi evaluation, the kernel weight description and the integral
Levi-equivariant splitting. Its application supplier is
[PotentialAutomorphyInfrastructure:PA.0](../packets/PotentialAutomorphyInfrastructure.json).
That packet retains the explicit integral highest-weight gap, whose general
owner is `ReductiveGroupsIntegralRepresentationsPartII` with no assigned stage.
No packet, suggested file or package for that owner exists in this checkout.

Live design issue [#3357](https://github.com/CBirkbeck/tauceti-explorer/issues/3357)
contains the KP18 and KPZ26 route briefs for this candidate. It was
`state:available` when checked. This identifies a planning route, not a supplied
stage or authorization to invent one. Obtain the general exports and PA.0's
arithmetic specialization before typing CL.0/lem-2-1-12 and its consumers.

At the exact Tau Ceti pin `f790474821cf4256814db967cb154e7af3d0c369`,
`YoungTableau.weylModule` requires `Algebra ℚ k` and uses a rational Young
symmetrizer (`RepresentationTheory/ClassicalGroups/WeylModule.lean`,
lines 114–124). The current library retains that rational-coefficient
requirement in `ClassicalGroups/WeylModule/Basic.lean`. This carrier cannot
stand in for O or O/ϖ^m dual Weyl lattices. The reviewed LP3 audit likewise
distinguishes rational highest-weight theory from the missing integral theory.

### Arithmetic towers: still missing and assigned to the wrong supplier

`REQ-TOWER` needs completed arithmetic towers, supported equivariant complexes,
compact-open derived recovery, coefficient descent and homotopy inverse limits.
It still names `ArithmeticLocallySymmetricSpaces:ALS.6`, contrary to accepted
[RS-09](../restructure/RS-09.result.json). ALS.6 keeps finite-level descent;
completed towers belong to `CompletedCohomologyPartII`. There is no packet,
suggested file or package for that owner. Its CC.0 planning issue
[#701](https://github.com/CBirkbeck/tauceti-explorer/issues/701) was
`state:available` when checked. The current ALS suggested file explicitly
omits `LocallySymmetric.finite_level_descent` and excludes tower assembly from
ALS.6. Completing ALS.6 alone would not provide the completed objects.

The reviewed ALS.6 library audit identifies the missing arithmetic tower;
generic limits do not construct its arithmetic spaces or supported coefficients.
Scoped searches of the current upstream ReductiveGroups, AlgebraicVectorBundles,
PeripheralActions, ProfiniteArithmetic and IntegralHeckeAndGaloisDeterminants
suggested files, and current Tau Ceti's representation/number-theory sources,
did not supply these integral coefficient or arithmetic tower interfaces.
This does not assert that all unrelated completion notions are absent.

## Tower request correction worklist

The stale `REQ-TOWER` supplies CL.1/p-ordinary-completed, CL.3/lem-2-3-14,
CL.5/boundary-coefficient-object, CL.5/lem-4-1-6, CL.5/prop-4-1-4,
CL.8/pgl2-cohomology and CL.8/prop-5-5-3. Match its subrequests to the existing
owners before revising the accepted consumer plan:

| Input to match against an actual supplying statement | Owner |
|---|---|
| Finite-level coefficient complexes, descent, Hecke and support compatibility | ALS.1, ALS.3, ALS.4, ALS.6; ALS.6 stays finite-level |
| Level indexing, conjugation and tower assembly | `CompletedCohomologyPartII:CC.0` |
| Smooth local-group action on the level colimit | `CompletedCohomologyPartII:CC.1` |
| Completed objects, order of limits, Milnor/reduction corrections | `CompletedCohomologyPartII:CC.2` |
| Completed equivariant chain models and derived finite-level recovery | `CompletedCohomologyPartII:CC.4` |
| Continuous completed descent and compact-open derived comparison | `CompletedCohomologyPartII:CC.6` |
| Boundary/support triangle through the derived tower | `CompletedCohomologyPartII:CC.7` |

Retain ALS.2's nilmanifold fibration and CL.5/lem-4-1-6's integral unipotent
congruence-limit acyclicity obligation. The characteristic-zero Lie-algebra
calculation does not establish positive torsion cohomology dying in the full
level direct limit. This table assigns ownership, not available declarations.
RS-09 was accepted by `independent-review-REV-RS-09~2` on 2026-09-30.

## Checks and limits in this continuation

- Blueprint checker: **0 errors, 0 warnings**. The unchanged accepted plan has
  97 nodes (19 definitions, 15 constructions, 63 theorems), 103 API items,
  104 tests, 37 planets, nine baseline declarations, 27 requests and 40 gaps.
  All CL.0–CL.9 layers are planned; none is closed.
- `lean-check research/blueprint/packages/CrystallineLocalGlobalCompatibilityCM/Suggested.lean`:
  **exit 0, no errors, 48 warnings, all `declaration uses sorry`**. Available
  memory was 97 GB. The check finished and left no background process.
  The shared Mathlib is exactly `082e2d37e8b0463410cdb532e111cd43d5a66174`.
  The package imports only Mathlib; this compilation does not certify imports
  from the older Tau Ceti pin. The relevant pinned smooth and rational Weyl
  source statements were read separately at that exact commit.
- Current read-only upstream roadmap revision:
  `070dc2becd74419e76303ede84b465ed4a69461f`; current read-only Tau Ceti:
  `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Read both the full ReductiveGroups
  and PeripheralActions READMEs, and the relevant supplier signatures, requests,
  reviews, audited ALS.6/LP3 entries and accepted RS-09 ownership. No restricted
  source was needed and no source passage is added.
- Reader size: 167,983 bytes; suggested file: 134,008 bytes. The inherited
  reconciliation below records 10 typed target declarations and **87 untyped
  targets, 82 untyped API entries and 83 untyped tests**. This run preserves
  those forms and does not report a new exhaustive name reconciliation.
- Intake file check on this handoff: **0 problems**. `git diff --check` passes.
  Only the authorized handoff changes. `issues.deliverables_complete` is
  **false** with metadata absent, preserving checkpoint treatment.

## Input fingerprints for the next continuation

SHA-256 hashes at the input commit:

| File, relative to the repository | SHA-256 |
|---|---|
| `research/blueprint/packets/CrystallineLocalGlobalCompatibilityCM.json` | `116c38b940316cbe91ed2bd0e9d77e1c6537c3e0507edb6622694292dd970a4d` |
| `research/blueprint/packages/CrystallineLocalGlobalCompatibilityCM/README.md` | `acccda4457e513ce17d7884042b737c4815469cb6c8ed1bd29fef051d9673d32` |
| `research/blueprint/packages/CrystallineLocalGlobalCompatibilityCM/Suggested.lean` | `003649f105334361b3d37ec3bd468c4de8a545a0a65369dc075ff25b25ed2ba5` |
| `research/blueprint/packets/PotentialAutomorphyInfrastructure.json` | `eb472418e07c0614e6ee0a0b34e57306c769ff2444e5891ab1858cd924303650` |
| `research/blueprint/suggested/ArithmeticLocallySymmetricSpaces.lean` | `8f2bbd1412a1913523b3901a3bc9227ef007aa27466ebfbabcd56c6a7776e3e8` |
| `research/blueprint/restructure/RS-09.result.json` | `235bae7182f594ea6c4ccbd5fbf319ca9659a4d00fad93a8328237c1667c36da` |
| `research/blueprint/packets/SmoothRepresentationsOfLocalGroups--SR.0.json` | `75dd0ad6a287e7f19d317c849a89cf5c0bc92ce345dafcd343a6b35e627b9b1c` |
| `research/blueprint/suggested/SmoothRepresentationsOfLocalGroups--SR.0.lean` | `e91fb373504d496c47810324e64523f1fa4bcb90e4b96679ff7eb14c4fa0cf79` |
| `research/blueprint/packages/SmoothRepresentationsOfLocalGroups/Suggested.lean` | `0ef464a4b493b4f0abbde6226516ef17b242167d37d935daf90a8ed132e34af4` |
| `research/blueprint/packages/SmoothRepresentationsOfLocalGroups/review.json` | `9457eaf8f56dc92deb8e538ebdf5c4d57a5f987b10cf52b49af450d9441690f1` |

Add `metadata.toml` with `topic = "math.NT"` only when the full package
requirement is met; intake otherwise recognizes this unfinished package as
complete solely from its output paths. The substantive inherited results and
remaining signature worklist follow. They describe the earlier continuation;
the smooth-supplier availability findings above supersede its older absence
claims. No second job is claimed, and scratch is disposable.

## Previous continuation: codex-975TMe (retained)

Issue: #7462. Agent: Codex. Session: `codex-975TMe`. Date: 2026-10-08.
Continues the checkpoint of session `codex-yCIhEa`, merged in #7566.

## Status and reason for the checkpoint

This is a **checkpoint**, not a complete package. The reader assembly is finished.
This continuation adds one full theorem signature and three faithful algebraic
cores, with API and tests. The complete arithmetic signature requirement remains
blocked by supplier interfaces outside this issue's deliverables. Nothing is
claimed to be implemented.

The accepted plan has 97 targets, ten planned layers, zero closed layers,
27 supplier requests and 40 gaps. Its ten `GAP-PROTOTYPE-CL-0` through
`GAP-PROTOTYPE-CL-9` entries explicitly identify missing faithful carrier types.
Its acceptance is a target-level planning verdict, not closure. The package
requirement is stronger: definitions, theorems, API and tests must have typed
forms. Comments alone do not satisfy it.

The blocker was checked again against the pinned sources and reviewed audit:

- Tau Ceti does have `IsSmoothDiscrete`, `SmoothDiscreteTopRep` and the
  discrete/smooth category dictionary at the specified pin. The missing
  supplier is **not the basic smoothness predicate**. AUDIT-41 identifies the
  abelian structure, injectives and derived smooth functors as missing. The
  requested open-monoid coefficient categories and completed arithmetic tower
  interfaces remain additional obligations.
- The arithmetic supplier's suggested file explicitly distinguishes quotient,
  local-coefficient and ring-image adapters from arithmetic signatures. Its
  omission catalogue does not supply the completed Borel–Serre tower,
  arithmetic dual-Weyl coefficients or their Hecke actions.
- `REQ-INTEGRAL-WEYL`, `REQ-SMOOTH`, `REQ-TOWER`, `REQ-DEEP-PERFECT` and
  `REQ-DERIVED-INVARIANTS` in the accepted plan specify the missing interfaces
  precisely. A generic `Representation` or `DerivedCategory` does not supply
  them. Neither the p-adic normalization core nor a generic endomorphism image
  constructs its arithmetic input.

[PROTOCOL.md](../PROTOCOL.md), §§13 and 15, requires honest omissions when a
condition cannot be stated, and imports the existing owners' mathematics.
The issue authorizes edits only to this package and handoff. Building the
supplier developments here or substituting propositions with assumed conclusions
would not finish this job to that standard. This is an external interface blocker,
not a shortage of compilation memory or the run's time allowance.

`metadata.toml` remains deliberately absent. `issues.deliverables_complete`
recognizes a package by the existence of its output paths; supplying metadata
would mark this incomplete package finished automatically. Its final content is
`topic = "math.NT"` plus a newline. Add it with a genuinely complete submission.
No intake code or other issue's deliverable was changed.

## What this continuation adds

- **CL.3 orientation character:** `CrystallineCM.ChiCharacter` normalizes an
  actual supplied norm-determinant character δ:G→Q_p× to Z_p× by
  δ(g)⁻¹ p^{v_p(δ(g))}, using `PadicInt.mkUnits`. It has the three named API
  forms and the identity, rank-one-unit and uniformizer examples. The compact
  unit formula is typed; the Lie-action and top-continuous-cohomology
  interpretation still comes from PA.0/PA.2. The O× character is obtained by
  coefficient extension, not by an invented O carrier.
- **CL.6 image algebras:** `HeckeImagesA` and `TorsionHeckeImage` use the range
  of an actual supplied `AlgHom` to module endomorphisms. All six named API
  forms and all six named examples are present. Factorization kills exactly
  the action kernel. Scalar extension uses `Module.End.baseChangeHom`; the
  map is injective when M→E⊗M is injective. Integral/torsion comparison is
  restricted to the image of the coefficient map, without asserting a map
  between entire Hecke images. The two-term complex O --ϖ--> O gives the
  new-torsion counterexample; its degree-zero kernel calculations are typed.
  The arithmetic cohomology carriers/actions remain absent.
- **Full CL.9 finite-group theorem:**
  `determinant_kernel_reducible_except_tetrahedral` now has a typed signature
  over an algebraically closed field of odd characteristic and a finite group.
  It preserves the nontrivial determinant order and squared-trace condition.
  The conclusion is a determinant-kernel invariant line, or the order-three
  A₄ exception with no invariant line and projective kernel (Z/2)².
  Private helpers define these statements explicitly; their bodies are not
  `sorry`-valued propositions. The projective image is the range of conjugation
  on ambient GL₂, whose kernel is its scalar subgroup. It is not the quotient
  by the centre of the representation's own image.
- The F₇ quaternion square/anticommutation test is checked by `decide`.
  An additional signature tests the absence of a common eigenline after any
  characteristic-seven field extension. The classification theorem itself
  still has a `sorry` proof, as this is a suggested file.
- The README gains the corresponding normalization, factorization,
  scalar-extension, torsion-complex and projective-image explanations.
  Every inherited line remains in order; no target or hypothesis was removed.
- The catalogue now distinguishes typed cores from absent arithmetic
  specializations and marks the finite-group theorem as typed. The original
  plan and its suggested file were not edited, so their catalogue still records
  the earlier boundary.

## Retained assembly and mathematical boundaries

The [README](../packages/CrystallineLocalGlobalCompatibilityCM/README.md) is
167,983 UTF-8 bytes, below 200 KB. It keeps all ten layers, 97 target names and
statements, 103 API names/statements, 104 test names/statements and 27 supplier
contracts. It includes motivation, ownership, conventions, prerequisite ids,
construction narrative and bibliographic theorem/section/page locators. It
contains no process material or source passages.

The [Suggested.lean](../packages/CrystallineLocalGlobalCompatibilityCM/Suggested.lean)
is 134,008 bytes, with one header and 18 individual Mathlib imports. It contains
10 named target declarations: seven algebraic cores and three theorem signatures.
The catalogue still has **87 untyped targets, 82 untyped API entries and
83 untyped tests**, plus three newly typed cores whose arithmetic specialization
is explicitly missing. It records nine new core API entries and nine new core
examples. The four inherited CL.0 cores likewise do not complete their arithmetic
specialization. Successful elaboration of these forms does not complete the
package.

The following earlier results and limitations are preserved:

- The lifting endpoint is qualified by `[F(ζ_p):F] ≠ 3` or projective residual
  image different from A₄. The unrestricted case remains
  `GAP-CUBIC-TETRAHEDRAL`. Solvable preparation preserves the full
  residual-plus-cyclotomic field. No unrestricted automorphy theorem is asserted
  false.
- Exact nonvanishing over the full unipotent cohomological range is specified
  only for zero selected weights. General coefficients retain the dimension
  bound; `GAP-GENERAL-COEFFICIENT-NONVANISHING` remains.
- AKT locators refer to arXiv:1910.12986v2. The journal citation is bibliographic;
  `GAP-JOURNAL-COLLATION` remains.
- Inverse rescaling, geometric Frobenius, the reversed unitary first weight
  block, coefficient-valued dual exterior cohomology, actual Hecke images,
  separate ambient decomposed genericity, arbitrary-prime deep splitting and
  input-independent nilpotence exponents are unchanged. The statement-scope
  appendix retains the unitary polynomial correction at CN (2.1.6), p.18 and
  the incoming differential of Proposition 4.2.6, p.64.
- The inherited finite F₇ counterexample uses
  i=((0,1),(−1,0)), j=((2,3),(3,−2)), h=(−1+i+j+ij)/2.
  Its binary tetrahedral group has order 24; twist by χ(h)=2 and χ(Q₈)=1.
  The determinant image has order three, its kernel is Q₈, and all 16 elements
  outside it satisfy the squared-trace identity. The earlier checkpoint checked
  this enumeration; this continuation adds the executable quaternion identities
  and the common-line signature.

## Checks and provenance

1. `python3 scripts/check_blueprint.py research/blueprint/packets/CrystallineLocalGlobalCompatibilityCM.json`:
   **0 errors, 0 warnings**. Input unchanged; counts remain 97 nodes, 103 APIs,
   104 tests, 37 planets, nine baseline references, 27 requests and 40 gaps.
2. `lean-check research/blueprint/packages/CrystallineLocalGlobalCompatibilityCM/Suggested.lean`:
   **exit 0; no errors; 48 warnings, all `declaration uses sorry`**.
   The concrete matrix test has a `decide` proof. Available memory exceeded
   20 GB; no language server, build or cache download was started.
3. The shared build's Mathlib is exactly
   `082e2d37e8b0463410cdb532e111cd43d5a66174`. Its enclosing Tau Ceti checkout
   is newer than `f790474821cf4256814db967cb154e7af3d0c369`.
   This file imports only Mathlib, so the elaboration checks the requested
   Mathlib pin and does **not** certify Tau Ceti imports at the older pin.
   The relevant Tau Ceti source statements were read with `git show` at the
   exact older pin.
4. Read WORKERS, both protocols, UPSTREAM_GUIDE, the full upstream
   ReductiveGroups and Multiquadratic READMEs, the reviewed smooth-library audit,
   the arithmetic supplier forms and the accepted supplier requests. Read the
   nine cited baseline statements and the newly used p-adic-unit, scalar-extension,
   matrix determinant, inner-automorphism and alternating-group declarations.
   No restricted book was needed.
5. Read CN arXiv:2301.10509v3 at §2.3.1 p.37 and Lemma 5.6.5 pp.85–86, plus
   their proof context, from the public PDF. Its SHA-256 is
   `57abc79ad46875b0ea432ce1193f517b8dbb0ad0448cb51942bc20ed95ffd0c3`, matching
   the accepted version. Access date: 2026-10-08. No source passage is included.
6. A scratch verifier checked all target/API/test names against the reader and
   suggested file, reconciled namespace-qualified declarations, confirmed that
   every inherited reader line survives in order, checked the document ceiling,
   counted remaining omissions, rejected empty `Prop := sorry` definitions,
   verified only `sorry` warnings and checked that the input JSON was untouched.
7. `python3 research/blueprint/intake.py check-files` on the three changed paths:
   **0 problems**. `issues.deliverables_complete` is **false** with metadata
   absent, so intake treats this as a checkpoint.

## Resume here

Do not repeat the reader assembly or replace the typed general cores with
comment-only specifications. Start with the faithful carrier gaps and their
supplier requests:

| Layer | Required remaining interfaces |
|---|---|
| CL.0 | Integral dual-Weyl modules, split-place dictionary, positive monoids, arithmetic Hecke actions |
| CL.1 | Abelian/derived smooth open-monoid categories, compact derived invariants, completed arithmetic towers |
| CL.2 | Integral weight modules, inverse monoids, derived coefficient pairings |
| CL.3 | Smooth compact-mod-parabolic induction and continuous cochains; actual norm-determinant input/orientation |
| CL.4 | Cuspidal local Hecke systems, filtered (φ,N)-modules, Galois and Weil–Deligne carriers |
| CL.5 | Equivariant locally constant derived coefficients on adelic/Borel–Serre towers and actual retracts |
| CL.6 | Localized arithmetic cohomology and its integral/dual actions; congruence-level families |
| CL.7 | Continuous absolute-Galois representations, Hecke systems, crystalline/ordinary deformation quotients |
| CL.8 | Non-neat PGL₂ towers, enhanced perfect complexes, derived Hecke support/generalization |
| CL.9 | Fixed-determinant problems, BT/type conditions, Taylor–Wiles covers, Selmer/base-change data |

The full finite-group theorem in CL.9 needs no new carrier work. Use its existing
signature when integrating the arithmetic preparation argument. The χ and
image-algebra cores should be specialized to genuine supplied inputs; that is
the remaining work, not a replacement normalization or image construction.
The README's required-interface section and accepted plan name the owners and
precise statements. Add metadata only when all package requirements can be met.

Scratch is disposable; continuation-relevant results are recorded here.
No second job was claimed.
