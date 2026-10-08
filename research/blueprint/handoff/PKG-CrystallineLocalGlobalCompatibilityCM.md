# PKG-CrystallineLocalGlobalCompatibilityCM — blocked checkpoint

Issue: [#7462](https://github.com/CBirkbeck/tauceti-explorer/issues/7462).
Agent: Codex. Session: `codex-rNu8yF`. Date: 2026-10-08.
Input commit: `0cc3f0d4e680b48fe3e62519907579d5300eb74e`.
Branch: `codex-rNu8yF-crystalline-package`.
Claim confirmed by github-actions against comment 6069884593.

## Outcome and scope

**Completion is blocked by missing supplier interfaces outside this issue's
allowed files.** The package README and Suggested.lean are preserved. This
continuation consolidates the inherited handoff, independently checks the
supplier gate and counts actual declarations separately from catalogue entries.
It adds no new mathematical target or Lean signature. The block is not a time
limit or a shortage of compilation memory.

The accepted target-level plan contains 97 nodes, 103 API items, 104 unit tests,
37 planets, nine baseline declarations, 27 supplier requests and 40 gaps.
CL.0–CL.9 are planned; none is closed. Its independent review explicitly accepts
a planning pass with prototype gaps, rather than complete typed interfaces.
The package job requires the definitions, theorems, API and examples in Lean.
The existing omission catalogue does not meet that stronger requirement.

The issue permits only the package README, Suggested.lean, metadata.toml and
this handoff. It expressly forbids packet changes. [PROTOCOL.md](../PROTOCOL.md)
§§13 and 15 require faithful statements and one owner for each supplier's
mathematics. Rebuilding the suppliers here, or assuming their conclusions in
proposition fields, would not complete the authorized package job.

## Supplier gate: independently checked in this continuation

These three outstanding inputs are sufficient blockers. This is not a new
exhaustive audit of all 27 requests.

| Request | Missing input and current evidence | Required resumption action |
|---|---|---|
| `REQ-SMOOTH` | The abelian smooth categories for the specified open monoids, enough injectives, compact derived invariants and coefficient-injective smooth coinduction. No SmoothRepresentationsOfLocalGroups packet, reader or suggested file exists here. SR.0 planning issue [#996](https://github.com/CBirkbeck/tauceti-explorer/issues/996) is still available. | Obtain the SR.0 abelian and derived interfaces, with the monoid and coinduction generality required by CN §2.2.2 and Lemma 2.3.6. |
| `REQ-INTEGRAL-WEYL` | Integral dual Weyl lattices, reduction, Levi evaluation and integral splitting. The parent plan explicitly records an integral highest-weight gap owned by ReductiveGroupsIntegralRepresentationsPartII, with no assigned stage. No packet, reader, suggested file or roadmap definition for that owner exists here. | Obtain the owner's integral theory and the PA.0 coefficient dictionary, evaluation and splitting exports; match their hypotheses to this request. |
| `REQ-TOWER` | The request still names ALS.6 for completed objects, compact-open derived recovery, coefficient-exponent homotopy limits and boundary towers. Accepted RS-09 assigns those constructions to CompletedCohomologyPartII. No packet, reader or suggested file for that owner exists here. CC.0 planning issue [#701](https://github.com/CBirkbeck/tauceti-explorer/issues/701) is still available. | Correct the consumer request through an authorized plan revision, then obtain the actual completed-cohomology interfaces below. |

The following source statements were read at the exact pins, using the existing
shared checkouts without creating another clone:

- Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`,
  `TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean`,
  lines 245–272 and 530–552: `IsSmoothDiscrete` supplies discreteness and open
  point stabilizers; `SmoothDiscreteTopRep` is a full subcategory of `TopRep`.
  They do not supply the requested abelian/derived interface. A pinned-tree
  search for `Abelian` and `EnoughInjectives` in the continuous-cohomology
  directory found no declaration. The SR.0 and derived-extension entries of
  [AUDIT-41](../audit/AUDIT-41.result.json), accepted by
  [REV-AUDIT-41](../reviews/REV-AUDIT-41.md), distinguish these missing structures
  from the existing smoothness predicate.
- Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`,
  `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean`, lines 65–87:
  `DerivedCategory` requires an abelian input category and localization. It
  does not construct the absent smooth category or arithmetic tower.
- Tau Ceti at the same pin,
  `TauCeti/RepresentationTheory/ClassicalGroups/WeylModule.lean`, lines 114–124:
  `YoungTableau.weylModule` assumes a Q-algebra and uses a rational Young
  symmetrizer. It cannot substitute for the integral lattice over O or its
  reduction O/ϖ^m.

The current parent packet retains the integral highest-weight prerequisite gap.
The current arithmetic packet has four ALS.6 nodes: finite-level descent,
finite-cover Hochschild–Serre, lowest-degree descent and finite-level acceptance
tests. Its coverage explicitly puts tower assembly and completion outside ALS.6.
The suggested arithmetic file leaves the full finite-level descent signature
omitted. The reviewed `data/library-coverage.json` ALS.6 audit also distinguishes
available generic limits from the absent arithmetic tower.

## Repair the tower request before integrating its signatures

[RS-09.result.json](../restructure/RS-09.result.json), accepted by
`independent-review-REV-RS-09~2` on 2026-09-30, narrows ALS.6 to finite-level
content. Its layer assignments and owner records determine this split:

| Input needed by the consumer | Owner whose exact export must be inspected |
|---|---|
| Finite-level coefficients, descent, Hecke and support compatibility | ArithmeticLocallySymmetricSpaces:ALS.1, ALS.3, ALS.4 and ALS.6 |
| Coherent level categories, conjugation and assembly | CompletedCohomologyPartII:CC.0 |
| Smooth local-group action on the level colimit | CompletedCohomologyPartII:CC.1 |
| Completed objects, order of limits, Milnor and reduction corrections | CompletedCohomologyPartII:CC.2 |
| Completed equivariant chain models and derived finite-level recovery | CompletedCohomologyPartII:CC.4 |
| Continuous completed descent and compact-open derived invariants | CompletedCohomologyPartII:CC.6 |
| Passage of the support/boundary triangle through the derived tower | CompletedCohomologyPartII:CC.7 |

`REQ-TOWER` affects CL.1/p-ordinary-completed, CL.3/lem-2-3-14,
CL.5/boundary-coefficient-object, CL.5/lem-4-1-6, CL.5/prop-4-1-4,
CL.8/pgl2-cohomology and CL.8/prop-5-5-3. Split the request and repair the
corresponding prerequisites and reader forms in an authorized plan revision.
Requiring ALS.6 to reconstruct the completed objects would duplicate their owner.

Retain the ALS.2 arithmetic nilmanifold fibration and the additional integral
congruence-limit acyclicity obligation needed for CL.5/lem-4-1-6. Finite
characteristic-zero Lie-algebra cohomology does not establish that positive
cohomology with torsion coefficients dies in the full level colimit. The table
identifies ownership; it does not certify any yet-unread export as sufficient.

The current ALS packet's review is `needs_changes` from
`independent-review-REV-FIX-RT-AREA-automorphic-1~4`, dated 2026-10-08.
That status alone is not evidence of an ALS.6 mathematical error. The ownership
mismatch above follows from the accepted restructuring and actual ALS.6 content.

## Preserved package and remaining work

[README.md](../packages/CrystallineLocalGlobalCompatibilityCM/README.md) is
167,983 UTF-8 bytes, below the 200 KB ceiling. It includes all ten layers,
97 target names, 103 API names, 104 test names and the supplier contracts,
with motivation, conventions, boundaries and source locators.

[Suggested.lean](../packages/CrystallineLocalGlobalCompatibilityCM/Suggested.lean)
is 134,008 bytes with one header and 18 individual Mathlib imports. There are
10 target declarations after removing comments and resolving their namespace:

- Seven partial cores: `WeylElements`, `PositiveCentralCocharacters`,
  `ParahoricPVBC`, `RescaledActions`, `ChiCharacter`, `HeckeImagesA` and
  `TorsionHeckeImage`.
- Three full theorem forms: `degree_shift_bound`, `subquotient_mod_p_pow` and
  `determinant_kernel_reducible_except_tetrahedral`.

There remain **87 omitted target signatures, 82 omitted API signatures and
83 omitted examples**, plus the arithmetic specializations of the seven cores.
The 21 named API forms and 21 examples do not fill those omissions. Example
names in the catalogue identify tests; the executable Lean examples themselves
are unnamed. All 97 target, 103 API and 104 test names occur in the README and
in either executable forms or the omission catalogue. Name coverage is not
signature coverage.

The inherited cores are useful and must be preserved:

- CL.0 reuses finite block permutations, specifies an antitone exponent cone,
  integral block congruences and rescaling by the inverse of a supplied
  character. Their arithmetic parahoric and lattice interpretations still need
  the real supplier inputs.
- CL.3 `ChiCharacter` takes a genuine determinant-norm character
  δ:G→Q_p× and normalizes it as δ(g)⁻¹ p^{v_p(δ(g))} in Z_p×. Its identity,
  unit-ratio and uniformizer tests are typed. The O× extension and Lie/top
  continuous-cohomology interpretation remain supplier obligations.
- CL.6 image algebras are ranges of actual algebra actions. Factorization
  kills exactly the action kernel. Scalar extension is injective when
  M→E⊗M is injective. The integral/torsion comparison is on the image of the
  coefficient map; it does not assert a map between whole Hecke images.
  The two-term complex O --ϖ--> O exposes new torsion. Actual localized
  cohomology and arithmetic Hecke actions are still missing.
- CL.9's finite-group theorem is typed over an algebraically closed field of
  odd characteristic and a finite group, with the determinant-order and
  squared-trace hypotheses. It concludes an invariant determinant-kernel
  line or the order-three A₄ exception with projective kernel (Z/2)².
  Its projective image is computed by conjugation on ambient GL₂, whose
  kernel is the scalar subgroup, rather than by dividing the representation's
  image by its own centre.

The remaining carrier worklist is:

| Layer | Required interfaces |
|---|---|
| CL.0 | Integral dual-Weyl modules, split-place dictionary, positive monoids, arithmetic Hecke actions |
| CL.1 | Abelian/derived smooth open-monoid categories, compact derived invariants, completed arithmetic towers |
| CL.2 | Integral weight modules, inverse monoids, derived coefficient pairings |
| CL.3 | Smooth compact-mod-parabolic induction and continuous cochains; genuine determinant-norm and orientation inputs |
| CL.4 | Cuspidal local Hecke systems, filtered (φ,N)-modules, Galois and Weil–Deligne carriers |
| CL.5 | Equivariant locally constant derived coefficients on adelic/Borel–Serre towers and actual retracts |
| CL.6 | Localized arithmetic cohomology and integral/dual actions; congruence-level families |
| CL.7 | Continuous absolute-Galois representations, Hecke systems, crystalline/ordinary deformation quotients |
| CL.8 | Non-neat PGL₂ towers, enhanced perfect complexes, derived Hecke support and generic-point comparisons |
| CL.9 | Fixed-determinant problems, Barsotti–Tate/type conditions, Taylor–Wiles covers, Selmer and base-change data |

Once sufficient supplier forms and the tower-request correction exist, replace
catalogue entries with the corresponding arithmetic signatures, API lemmas and
examples. Use the existing finite-group theorem in the preparation argument;
specialize the character and image-algebra cores to actual supplied inputs.
The reader assembly does not need to be repeated. The other requests and
prototype gaps remain in the accepted plan and the source-indexed catalogue.

## Mathematical restrictions and inherited provenance to retain

The following qualifications belong to the mathematical work already assembled;
this continuation has not independently re-audited their source proofs:

- The lifting endpoint requires `[F(ζ_p):F] ≠ 3` or projective residual image
  different from A₄. `GAP-CUBIC-TETRAHEDRAL` retains the unrestricted case.
  Solvable preparation must preserve the full residual-plus-cyclotomic field.
- Exact nonvanishing across the full unipotent range is exported for zero
  selected weights only. General coefficients retain the dimension bound and
  `GAP-GENERAL-COEFFICIENT-NONVANISHING`.
- AKT locators use arXiv:1910.12986v2; the journal citation is bibliographic
  and `GAP-JOURNAL-COLLATION` remains.
- Keep inverse rescaling, geometric Frobenius, the reversed first unitary
  weight block, coefficient-valued dual exterior cohomology, actual Hecke
  images, separate ambient decomposed genericity, arbitrary-prime deep
  splitting and input-independent nilpotence exponents. The README appendix
  records the unitary polynomial correction at CN (2.1.6), p.18 and the
  incoming differential in Proposition 4.2.6, p.64.
- The finite F₇ example uses i=((0,1),(−1,0)), j=((2,3),(3,−2)) and
  h=(−1+i+j+ij)/2 in the binary tetrahedral group of order 24. Twist by
  χ(h)=2 and χ(Q₈)=1. Its determinant image has order three, its kernel is
  Q₈, and the 16 elements outside that kernel satisfy the squared-trace
  identity. Earlier work enumerated this example; the file retains its
  executable quaternion identities and common-line signature.

The initial assembly was submitted by `codex-yCIhEa` in
[#7566](https://github.com/CBirkbeck/tauceti-explorer/pull/7566).
The character, image-algebra and finite-group extensions were submitted by
`codex-975TMe` in [#7691](https://github.com/CBirkbeck/tauceti-explorer/pull/7691).
The latter continuation read CN arXiv:2301.10509v3, §2.3.1 p.37 and
Lemma 5.6.5 pp.85–86 with their proof context, on 2026-10-08; its recorded PDF
SHA-256 is `57abc79ad46875b0ea432ce1193f517b8dbb0ad0448cb51942bc20ed95ffd0c3`.
This consolidation retains that provenance without claiming a fresh source read.
The earlier supplier rechecks and RS-09 finding are incorporated above.

## Checks in this continuation

- `python3 scripts/check_blueprint.py research/blueprint/packets/CrystallineLocalGlobalCompatibilityCM.json`:
  **0 errors, 0 warnings**; counts as stated above. The packet is unchanged.
- `lean-check research/blueprint/packages/CrystallineLocalGlobalCompatibilityCM/Suggested.lean`:
  **exit 0, no errors, 48 warnings, all declaration uses sorry**. Available
  memory was 111 GB before compilation; the check finished.
- The shared Mathlib commit is exactly
  `082e2d37e8b0463410cdb532e111cd43d5a66174`. The shared enclosing Tau Ceti
  checkout is newer than the requested pin. This package imports only Mathlib,
  so its elaboration checks the Mathlib pin and makes no claim about Tau Ceti
  imports. The relevant Tau Ceti source declarations were separately read at
  `f790474821cf4256814db967cb154e7af3d0c369`.
- A scratch verifier removed nested Lean comments before counting target and
  API declarations, resolved namespace qualification, checked all proposed
  names against README and the forms/catalogue, confirmed the omission counts
  and checked the document ceiling. It found no empty Prop := sorry definition.
- Read WORKERS, both protocols, UPSTREAM_GUIDE, the whole issue, the full upstream
  ReductiveGroups and Multiquadratic READMEs, relevant accepted-plan requests,
  supplier gaps, reviewed audit entries and the exact pinned statements above.
  No restricted source was needed and no source passage is added.

Only this authorized handoff changes.
`python3 research/blueprint/intake.py check-files` reports **0 problems** for it;
`git diff --check` passes. `issues.deliverables_complete` is **false**, confirming
checkpoint treatment. No compilation remains running, and no second job is claimed.

## Completion marker and resumption gate

`metadata.toml` remains absent. Intake recognizes a package's completion from
all its output paths existing; adding metadata to this incomplete package
would incorrectly advance it as finished. Its final content is
`topic = "math.NT"` plus a newline. Add it when every package requirement is met.
No intake, queue, label or supplier file is changed by this continuation.

Resume after the missing supplier interfaces and authorized tower-request
correction exist. A successful compilation of the present ten target forms,
an accepted target-level plan or another catalogue does not satisfy that gate.
All continuation information is in this handoff; scratch is disposable.
