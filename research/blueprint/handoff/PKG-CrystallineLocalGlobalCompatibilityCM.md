# PKG-CrystallineLocalGlobalCompatibilityCM — blocked checkpoint

## Current continuation: codex-albCMF

Issue: [#7462](https://github.com/CBirkbeck/tauceti-explorer/issues/7462).
Agent: Codex. Session: `codex-albCMF`. Date: 2026-10-08.
Continues the checkpoint merged in [#7691](https://github.com/CBirkbeck/tauceti-explorer/pull/7691),
using main at `087957b54`.

**Blocked by missing supplier interfaces.** The package cannot meet the issue's
requirement to give every definition, theorem, API item and test a faithful Lean
form within its authorized files. This continuation independently rechecked the
blocker and the inherited files. It changes this handoff only. The README and
Suggested.lean, the accepted plan and the original suggested file remain intact.
The interruption is due to the supplier boundary, rather than elapsed time.

### Rechecked dependencies and sufficient blockers

| Accepted request | Supplier and consuming targets | Current evidence and required change |
|---|---|---|
| `REQ-SMOOTH` | `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`; CL.1 ordinary functors and CL.3 induction | The SR.0 packet, reader and suggested file listed in the queue are absent. Its blueprint [#996](https://github.com/CBirkbeck/tauceti-explorer/issues/996) is available; the corresponding assembly [#260](https://github.com/CBirkbeck/tauceti-explorer/issues/260) is blocked. Supply the genuine abelian smooth categories for the specified open monoids, compact invariants, injectives and derived functors. |
| `REQ-TOWER` | `ArithmeticLocallySymmetricSpaces:ALS.6`; CL.1 completed ordinary cohomology and CL.5 boundary coefficients | The accepted arithmetic supplier's suggested file explicitly labels its expressible quotient and ring-image forms as adapters. Its arithmetic tower and coefficient interfaces are still in the omission catalogue. Supply equivariant derived sections on the adelic/Borel–Serre towers, coefficient descent and completed cohomology with the homotopy-limit comparison specified in the request. |
| `REQ-INTEGRAL-WEYL` | `PotentialAutomorphyInfrastructure:PA.0`; CL.0 coefficient evaluation and CL.2 weight comparison | The parent packet retains its explicit integral highest-weight prerequisite gap. It assigns the general theory to `ReductiveGroupsIntegralRepresentationsPartII`, whose stages have not been assigned. Supply that owner's integral induced/dual-Weyl interfaces, then the parent's Levi evaluation and splitting exports. Preserve the assigned owner; do not invent a stage identifier. |

The issue states the package requirement explicitly, and
[PROTOCOL.md](../PROTOCOL.md), §§13 and 15, requires honest omitted conditions
and reuse of the owning roadmap. Planning acceptance has not supplied these
missing types. A generic category or representation with the desired conclusions
as assumptions would not discharge these contracts.

Three tempting library replacements were checked at the exact pins:

- Tau Ceti's `IsSmoothDiscrete` and `SmoothDiscreteTopRep` genuinely exist.
  The former records discrete topology and open point stabilizers; the latter
  is a full subcategory of `TopRep`. Read the declarations in
  `TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean`,
  lines 254–270 and 537–544 at `f790474821cf4256814db967cb154e7af3d0c369`.
  The missing input is the abelian/derived smooth interface, not smoothness
  itself. The reviewed AUDIT-41 SR.0 and derived-extension entries agree;
  the pinned continuous-cohomology tree contains no abelian-category or
  enough-injectives declaration supplying this input.
- Mathlib's `DerivedCategory` requires an abelian input category and a chosen
  localization. Read `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean`,
  lines 65–87 at `082e2d37e8b0463410cdb532e111cd43d5a66174`.
  Its existence does not produce the absent smooth category or arithmetic
  tower. The reviewed `data/library-coverage.json` ALS.6 entry also distinguishes
  category-theoretic limits from the required arithmetic construction.
- Tau Ceti's `YoungTableau.weylModule` is a concrete near miss that must not
  be used as the integral lattice. Read
  `TauCeti/RepresentationTheory/ClassicalGroups/WeylModule.lean`,
  lines 114–124 at the Tau Ceti pin: its ring is required to be a Q-algebra,
  and its construction uses a rational Young symmetrizer. The coefficient
  rings O and O/ϖ^m of `REQ-INTEGRAL-WEYL` do not satisfy that hypothesis.
  Extending a characteristic-zero representation does not establish the
  integral evaluation, reduction and Levi splitting contract.

These observations are sufficient to block completion. They do not claim an
exhaustive new audit of every supplier or a new mathematical source finding.
The other 24 requests and the ten prototype gaps remain as recorded in the
accepted plan and in the previous continuation below.

### Independent checks in this run

- `python3 scripts/check_blueprint.py research/blueprint/packets/CrystallineLocalGlobalCompatibilityCM.json`:
  0 errors, 0 warnings; 97 nodes (19 definitions, 15 constructions, 63 theorems),
  103 API entries, 104 tests, 37 planets, nine baseline declarations,
  27 requests and 40 gaps. CL.0–CL.9 are all planned; none is closed.
- `lean-check research/blueprint/packages/CrystallineLocalGlobalCompatibilityCM/Suggested.lean`:
  exit 0, no errors, 48 warnings, all `declaration uses sorry`.
  The shared Mathlib checkout is the exact pin. The package imports only
  Mathlib, so this check does not certify Tau Ceti imports at the older pin.
  Memory exceeded 20 GB. The check finished and leaves no background process.
- An independent scratch verifier removed Lean comments before counting
  declarations and reconciled namespace-qualified names. All 97 target names,
  103 API names and 104 test names occur in the reader and the corresponding
  typed forms or omission catalogue. There are ten typed target names, of
  which seven are algebraic cores and three are full theorem forms. There
  remain 87 omitted target signatures, 82 omitted API signatures and 83
  omitted examples, plus the arithmetic specializations of the seven cores.
- README: 167,983 UTF-8 bytes; Suggested.lean: 134,008 bytes. The README is
  below the 200 KB ceiling and contains no packet/checkpoint/coverage material.
  No empty proposition definition is used to disguise a missing interface.
- `python3 research/blueprint/intake.py check-files` on the handoff:
  0 problems. `git diff --check` passes; the only changed path is this handoff.
  `issues.deliverables_complete` remains false, confirming checkpoint treatment.
- Read WORKERS, both protocols, UPSTREAM_GUIDE, the complete issue, the full
  upstream ReductiveGroups and Multiquadratic documents, the current supplier
  omissions and parent prerequisite gaps, AUDIT-41 and its accepted review,
  the reviewed ALS.6 audit, and the pinned statements listed above.
  No restricted source was needed.

### Resume gate

Before another package continuation, check whether the three requests above now
have faithful typed exports. An accepted planning document, a comment catalogue
or a successful check of the existing ten typed target names is not that export.
The maintainer can use this dependency record to schedule the owning jobs; no
worker label change or second claim was made in this run.

Once supplier interfaces are available, use the existing omission catalogue as
the exact worklist: add each named arithmetic signature, its API and its examples,
retaining the corrected hypotheses and normalizations. Import the owning
interfaces. Re-run Lean and the name/statement comparison, then supply
`metadata.toml` with `topic = "math.NT"` when the whole package requirement is met.
Metadata remains absent for this checkpoint so intake does not mistake it for
completed work. This follows the existing checkpoint's documented completion
marker, rather than modifying intake or the queue.

Continuation-relevant results are all in this note; scratch is disposable.

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
