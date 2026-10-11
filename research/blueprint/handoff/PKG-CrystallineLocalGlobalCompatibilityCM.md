# PKG-CrystallineLocalGlobalCompatibilityCM — blocked checkpoint

Issue: [#7462](https://github.com/CBirkbeck/tauceti-explorer/issues/7462).
Agent: Codex (GPT-6). Session: `codex-3KNBuT`. Date: 2026-10-11.
Branch: `codex-3KNBuT-crystalline-package`.
Input commit: `f973beb333680e13458c7da9eb4dafaa23a6961f`.
Claim confirmed in [comment 6105477908](https://github.com/CBirkbeck/tauceti-explorer/issues/7462#issuecomment-6105477908),
responding to [comment 6105477076](https://github.com/CBirkbeck/tauceti-explorer/issues/7462#issuecomment-6105477076).
Only this job was claimed.

## What this continuation changes

The README now explicitly assigns general integral induced/Weyl/dual-Weyl theory
to `ReductiveGroupsIntegralRepresentationsPartII` and its GL_n/unitary
specialization to `PotentialAutomorphyInfrastructure:PA.0`. It distinguishes the
rational Young-symmetrizer construction from the integral coefficient maps and
splittings used here. No new mathematics or supplier declaration is invented.
The existing suggested signatures are preserved without modification.

**Blocked on external supplier interfaces, not on the run's time or memory.**
The issue permits only the three package outputs and this handoff. Building the
general supplier theories here would duplicate their owners, and changing the
accepted request would exceed those permitted paths. This submission is a
checkpoint; it does not complete the package.

The accepted plan has 97 targets, 103 API entries, 104 tests, 27 requests and
40 gaps. Ten layers are planned and none is closed. A fresh signature inventory
finds **17 typed targets, 42 typed API entries and 42 named examples**, with
**80 targets, 61 API entries and 62 tests omitted**. The typed targets include
partial arithmetic cores; their existence does not establish the full arithmetic
interface. Every remaining name occurs in the explicit omission catalogue.

`metadata.toml` remains absent. The intake's `deliverables_complete` currently
uses output existence for this package, so creating the metadata would incorrectly
mark the unfinished package complete. Add `topic = "math.NT"` only with a full
submission. The accepted packet, original reader and original prototype are unchanged.

## Freshly checked completion blockers

### Integral dual-Weyl coefficients

`REQ-INTEGRAL-WEYL` needs integral induction, dual-Weyl lattices, coefficient
extension/reduction, Levi evaluation, kernel weights and the integral
Levi-equivariant splitting. Six consumers are CL.0/lem-2-1-12,
CL.0/lem-2-1-17, CL.2/lem-2-2-14, CL.2/lem-2-2-16,
CL.5/cor-4-1-9 and CL.6/lem-4-2-3.

Read again the gap in
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

Read CN v3 Lemma 2.1.12, pp.17–18, including its reduction to Schubert
restriction, and Lemma 4.2.3 and proof, p.60. The latter requires an integral
Levi-equivariant splitting and parabolic stability of its kernel; an E-linear
splitting alone is insufficient. **Locator correction for a packet-editing job:**
CN's proof cites NT16 **Proposition 2.10**. `REQ-INTEGRAL-WEYL` and the inherited
handoff call it Lemma 2.10. No packet was edited in this package job.

### Completed arithmetic towers

`REQ-TOWER` still requests completed adelic/Borel–Serre objects from
`ArithmeticLocallySymmetricSpaces:ALS.6`. Read again accepted
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

These two blockers suffice. This continuation does not claim a fresh exhaustive
verification of all 27 supplier requests. The inherited open-monoid
abelian/derived-category, coefficient-injective coinduction and ordinary open-cell
acyclicity obligations also remain in the catalogue.

## Material to preserve when resuming

The previous signature work and its detailed explanations are retained in the
package. [#8715](https://github.com/CBirkbeck/tauceti-explorer/pull/8715)
contains the preceding handoff if its full history is needed.

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
| Numerical degree bound and adic subquotients | Retain floor/ceiling conventions in odd dimension, and the Artin–Rees coefficient-depth increase. |
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

## Validation and provenance

- `python3 scripts/check_blueprint.py research/blueprint/packets/CrystallineLocalGlobalCompatibilityCM.json`:
  **0 errors, 0 warnings**. Packet SHA-256 remains
  `116c38b940316cbe91ed2bd0e9d77e1c6537c3e0507edb6622694292dd970a4d`.
- `lean-check research/blueprint/packages/CrystallineLocalGlobalCompatibilityCM/Suggested.lean`:
  **exit 0, 0 errors, 97 warnings, all `declaration uses sorry`**.
  Available memory was 100 GB. One check was run; no language server or
  library build was started. The file was not modified after checking.
- Recounted declarations outside nested block comments and associated named
  test labels with actual examples. Counts are 17/42/42 typed, 80/61/62
  omitted. Supplementary examples do not fulfill omitted named tests.
  No empty `Prop := sorry` definition was found.
- Intake `check-files`: **2 files, 0 problems**; `git diff --check` passes.
  `deliverables_complete` is **false**, with metadata absent. The README is
  below 200 KB. No Lean process from this job remains running.
- Read WORKERS, both protocols and UPSTREAM_GUIDE, complete current ReductiveGroups
  and PeripheralActions READMEs, the relevant Weyl statements, PA's owner gap,
  reviewed ALS.6 audit and accepted RS-09. Current read-only roadmap commit:
  `070dc2becd74419e76303ede84b465ed4a69461f`; current library:
  `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. No restricted source was needed.
- Read CN v3 pp.17–18 and 60 from <https://arxiv.org/pdf/2301.10509v3>,
  accessed 2026-10-11. PDF SHA-256:
  `57abc79ad46875b0ea432ce1193f517b8dbb0ad0448cb51942bc20ed95ffd0c3`.
  Only authored mathematical prose and locators enter the deliverables.
- PA packet SHA-256:
  `eb472418e07c0614e6ee0a0b34e57306c769ff2444e5891ab1858cd924303650`;
  RS-09 result SHA-256:
  `235bae7182f594ea6c4ccbd5fbf319ca9659a4d00fad93a8328237c1667c36da`.

## Resume condition

Supply the integral dual-Weyl and completed arithmetic tower exports in their
owning roadmaps first. Retarget `REQ-TOWER` and correct the NT16 locator in a
job that allows packet edits. Then specialize the existing cores to the actual
arithmetic carriers, actions, localizations and pairings, and type the remaining
named targets, API and tests. Do not substitute hypotheses asserting each
conclusion or empty propositions for these objects. Add metadata only when
all package requirements are met. No second job is claimed.
